#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""Set the active-attack shell from the 2025 client data.

Target count / MP / cooldown / type come from data_combat_skill (exact).
Damage ratio is inferred from the client tier field (f16) because the real
server coefficients are not in the client. Support/trigger skills are left
untouched for the script phase.
"""
import os
import re
import shutil
import subprocess
import sys

import UnityPy

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
SRC = os.path.join(ROOT, 'YCserver', 'erl_src')
EBIN = os.path.join(ROOT, 'YCserver', 'data', 'server', 'ebin')
BUILD = os.path.join(ROOT, 'tmp', 'build_active')
ERLC = os.path.join(ROOT, 'tmp', 'erlang19', 'bin', 'erlc.exe')
ERL = os.path.join(ROOT, 'tmp', 'erlang19', 'bin', 'erl.exe')
DATA_BUNDLES = [
    os.path.join(ROOT, 'tmp', 'updated_client', 'business_data_2025.unity3d'),
    os.path.join(ROOT, 'cdn', 'patch_android', '202506251639', 'textures', 'textures_business_data.unity3d'),
]
REPORT = os.path.join(ROOT, 'tmp', 'active_shell_report.tsv')

# real active casts only; passives that modify attacks stay out
ATTACK = {
    60590, 60603, 67075, 67085, 67110, 67130, 67131, 67200, 67309, 67316,
    67330, 67334, 67338, 67343, 67348, 67353, 67358, 67363, 67368, 67378,
}
DMG_BY_TIER = {365: 1800, 265: 1600, 200: 1400, 150: 1300, 100: 1200}

# sid: (hits, average target count)
MULTI = {
    60603: (2, 1), 67309: (3, 3), 67316: (3, 3), 67330: (2, 4),
    67334: (2, 4), 67338: (3, 4), 67343: (3, 4), 67348: (2, 3),
    67353: (5, 1), 67358: (3, 6), 67363: (5, 1), 67368: (3, 4),
}

# template scripts carry side effects: 50026 = crit lifesteal, 50000 = crit,
# 60047 = physical penetration. Zero them out unless the description asks for it.
EXTRAS = {
    67085: {'script_args': [200]},
    67330: {'script_args': [500]},
    67334: {'script_args': [0], 'buff_self': [(90304, 1000, 1, 0, [100])]},
    67075: {'script_args': [0],
            'buff_self': [(70055, 1000, 2, 0, [2000, 0])],
            'buff_target': [[(70000, 1000, 2, 1, [500])]]},
}


def erl(v):
    if isinstance(v, tuple):
        return '{' + ', '.join(erl(x) for x in v) + '}'
    if isinstance(v, list):
        return '[' + ', '.join(erl(x) for x in v) + ']'
    return str(v)


def replace_list_field(body, key, value):
    m = re.search(r'\b%s\s*=\s*\[' % key, body)
    if not m:
        ins = ',' + chr(10) + '           %s = %s,' % (key, value) + chr(10) + '           script_id ='
        return re.sub(r',\s*script_id =', ins, body, count=1)
    start = m.end() - 1
    depth = 0
    for i in range(start, len(body)):
        if body[i] == '[':
            depth += 1
        elif body[i] == ']':
            depth -= 1
            if depth == 0:
                return body[:start] + value + body[i + 1:]
    raise SystemExit('unbalanced %s' % key)

def read(p):
    with open(p, encoding='utf-8', newline='') as f:
        return f.read()


def write(p, s):
    os.makedirs(os.path.dirname(p), exist_ok=True)
    with open(p, 'w', encoding='utf-8', newline='') as f:
        f.write(s)


def load_client():
    path = next((p for p in DATA_BUNDLES if os.path.isfile(p) and os.path.getsize(p) > 0), None)
    if path is None:
        raise SystemExit('缺少 2025 data bundle')
    env = UnityPy.load(path)
    A = {}
    for o in env.objects:
        if o.type.name == 'TextAsset':
            d = o.read()
            s = d.m_Script
            A[str(d.m_Name)] = s.decode('utf-8', 'ignore') if isinstance(s, bytes) else s
    skill = A['data_skill']
    a = skill.find('DataSkill.petSkillGetFunc={')
    b = skill.find('\nDataSkill.', a + 10)
    blk = skill[a:b if b > 0 else len(skill)]
    desc = {}
    for m in re.finditer(r'\[\[{(\d+),1,"([^"]*)",\d+,\d+,\d+,"(.*?)"}\]\],', blk, re.S):
        desc[int(m.group(1))] = (m.group(2), re.sub(r'<[^>]+>', '', m.group(3).replace('\\n', '\n')))
    combat = A['data_combat_skill']
    meta = {}
    for m in re.finditer(r'(?m)^\t\["(\d+)_1"\]=\[\[(\{.*?\})\]\],?$', combat):
        sid, body = int(m.group(1)), m.group(2)
        cm = re.search(r'^\{\d+,\d+,"[^"]*",(-?\d+),(-?\d+),(\{[^}]*\}),'
                       r'(\d+),(\d+),(\d+),(\d+),(\d+),(\d+),\{\{([^}]*)\}\},'
                       r'(\d+),(\d+),(\d+),(\d+),', body)
        if cm:
            tn = re.search(r'target_num = (\d+)', cm.group(10))
            meta[sid] = {'type': int(cm.group(1)), 'sub': int(cm.group(2)),
                         'cost': cm.group(3),
                         'target': int(tn.group(1)) if tn else 0,
                         'cd': int(cm.group(11)), 'mp': int(cm.group(12)),
                         'tier': int(cm.group(13))}
    return desc, meta


def target_count(desc, meta_target):
    vals = []
    for pat in (r'对(?:敌方)?(\d+)名', r'对(?:敌方)?(\d+)个', r'(\d+)名敌方',
                r'(\d+)个敌方', r'第[一二三]次攻击(\d+)个', r'对(\d+)名'):
        vals += [int(x) for x in re.findall(pat, desc)]
    if vals:
        return max(vals)
    return meta_target if meta_target > 1 else 1


def infer_dmg(m):
    if not m:
        return 1400
    return DMG_BY_TIER.get(m.get('tier', 0), 1400)


def get_template(src, count, magic):
    blocks = {}
    for m in re.finditer(r'get_combat\(\{(\d+), 1\}\) ->\n(.*?)(?=\nget_combat\(|\Z)', src, re.S):
        blocks[int(m.group(1))] = m.group(2).rstrip('\n')
    if magic:
        order = [60014, 60011] if count > 1 else [60011, 60014]
    else:
        order = [60019, 60089] if count > 1 else [60089, 60019]
    for t in order:
        if t in blocks:
            body = blocks[t].rstrip()
            if body.endswith(';'):
                body = body[:-1].rstrip()
            return t, body
    raise SystemExit('no combat template')


def update_body(body, sid, name, m, count, dmg, hits=1, extra=None):
    body = re.sub(r'id = \d+', 'id = %d' % sid, body, count=1)
    body = re.sub(r'name = lang:get\("[^"]*"\)', 'name = lang:get("%s")' % name.replace('"', '\\"'), body, count=1)
    body = re.sub(r'\btype = \d+', 'type = %d' % m['type'], body, count=1)
    body = re.sub(r'\bsub_type = \d+', 'sub_type = %d' % m['sub'], body, count=1)
    body = re.sub(r'target_list = \[.*?\]', 'target_list = [{1, 2, %d}]' % count, body, count=1)
    base = dmg // hits
    ratios = [base] * hits
    ratios[-1] += dmg - base * hits
    body = re.sub(r'\battack_times = \d+', 'attack_times = %d' % hits, body, count=1)
    body = re.sub(r'dmg_ratio = \[.*?\]', 'dmg_ratio = [%s]' % ', '.join(map(str, ratios)), body, count=1)
    extra = extra or {}
    body = replace_list_field(body, 'script_args', erl(extra.get('script_args', [0])))
    if extra.get('buff_self') is not None:
        body = replace_list_field(body, 'buff_self', erl(extra['buff_self']))
    if extra.get('buff_target') is not None:
        body = replace_list_field(body, 'buff_target', erl(extra['buff_target']))
    if re.search(r'\bcost_mp = \d+', body):
        if m.get('mp', 0) > 0:
            body = re.sub(r'\bcost_mp = \d+', 'cost_mp = %d' % m['mp'], body, count=1)
        else:
            body = re.sub(r',\s*cost_mp = \d+', '', body, count=1)
    elif m.get('mp', 0) > 0:
        body = re.sub(r',\s*script_id =', ',\n           cost_mp = %d,\n           script_id =' % m['mp'], body, count=1)
    if re.search(r'\bcooldown = \d+', body):
        if m.get('cd', 0) > 0:
            body = re.sub(r'\bcooldown = \d+', 'cooldown = %d' % m['cd'], body, count=1)
        else:
            body = re.sub(r',\s*cooldown = \d+', '', body, count=1)
    elif m.get('cd', 0) > 0:
        body = re.sub(r',\s*script_id =', ',\n           cooldown = %d,\n           script_id =' % m['cd'], body, count=1)
    return body


def main():
    apply = '--apply' in sys.argv
    descs, meta = load_client()
    src = read(os.path.join(SRC, 'skill_combat_data.erl'))
    blocks = {int(m.group(1)): m.group(0) for m in re.finditer(
        r'get_combat\(\{(\d+), 1\}\) ->\n.*?(?=\nget_combat\(|\Z)', src, re.S)}
    rows = []
    new_src = src
    for sid in sorted(ATTACK):
        name, desc = descs.get(sid, ('?', ''))
        m = meta.get(sid, {'type': 0, 'sub': 0, 'target': 1, 'cd': 0, 'mp': 0, 'tier': 0})
        count = target_count(desc, m.get('target', 1))
        hits, tcount = MULTI.get(sid, (1, None))
        if tcount:
            count = tcount
        cd_cn = {'一': 1, '二': 2, '三': 3, '四': 4, '五': 5}
        cm = re.search(r'冷却([一二三四五\d]+)回合', desc)
        if cm:
            val = cd_cn.get(cm.group(1)) or int(cm.group(1))
            m['cd'] = max(m.get('cd', 0), val)
        dmg = 1000 if sid == 67131 else infer_dmg(m)  # 67131 is current-HP%, needs a script
        magic = bool(re.search(r'魔法|法术', desc))
        tpl, tpl_body = get_template(src, count, magic)
        body = update_body(tpl_body, sid, name, m, count, dmg, hits, EXTRAS.get(sid))
        rows.append((sid, name, count, m.get('mp', 0), m.get('cd', 0), dmg, hits, tpl, magic))
        if sid in blocks:
            new_src = new_src.replace(blocks[sid], 'get_combat({%d, 1}) ->\n    %s;\n' % (sid, body), 1)
        else:
            new_src = new_src.replace('get_combat(_) -> false.\n',
                                      'get_combat({%d, 1}) ->\n    %s;\n' % (sid, body) +
                                      'get_combat(_) -> false.\n', 1)
    with open(REPORT, 'w', encoding='utf-8', newline='') as f:
        f.write('id\tname\ttarget\tmp\tcd\tdmg\thits\ttemplate\tmagic\n')
        for r in rows:
            f.write('\t'.join(map(str, r)) + '\n')
    print('report:', REPORT, 'rows:', len(rows))
    if not apply:
        print('dry-run; rerun with --apply')
        return

    os.makedirs(os.path.join(BUILD, 'src'), exist_ok=True)
    os.makedirs(os.path.join(BUILD, 'baseline'), exist_ok=True)
    os.makedirs(os.path.join(BUILD, 'patched'), exist_ok=True)
    for stage, text in (('baseline', src), ('patched', new_src)):
        out = os.path.join(BUILD, stage)
        os.makedirs(out, exist_ok=True)
        path = os.path.join(out, 'skill_combat_data.erl')
        write(path, text)
        r = subprocess.run([ERLC, '-o', out, path], capture_output=True, text=True)
        if r.returncode:
            print(r.stdout, r.stderr)
            raise SystemExit('compile failed')
    keys = os.path.join(BUILD, 'skill_combat_data.keys')
    subprocess.run([sys.executable, os.path.join(ROOT, 'tmp', 'make_keys.py'),
                    os.path.join(ROOT, 'tmp', 'build', 'src', 'skill_combat_data.erl'), keys],
                   check=True, stdout=subprocess.DEVNULL)
    out = erl_eval('verify_beam:run("%s","%s","%s")' % (
        os.path.join(EBIN, 'skill_combat_data.beam').replace('\\', '/'),
        os.path.join(BUILD, 'patched', 'skill_combat_data.beam').replace('\\', '/'),
        keys.replace('\\', '/')))
    print(next((l for l in out.split('\n') if 'compared' in l), out[:500]))
    if '0 diffs' not in out:
        print(out[:3000])
        raise SystemExit('verify failed')
    shutil.copy2(os.path.join(BUILD, 'patched', 'skill_combat_data.beam'),
                 os.path.join(EBIN, 'skill_combat_data.beam'))
    write(os.path.join(SRC, 'skill_combat_data.erl'), new_src)
    nodes = running_nodes()
    if nodes:
        expr = ('Ns=%s, R=[{N,rpc:call(N,code,soft_purge,[skill_combat_data]),'
                'rpc:call(N,code,load_file,[skill_combat_data])} || N <- Ns],'
                'io:format("~p~n",[R]),init:stop().' % str(nodes))
        print(erl_eval(expr)[:2000])


def erl_eval(expr):
    r = subprocess.run([ERL, '+S1:1', '-noshell',
                        '-sname', 'actref_%d_%s' % (os.getpid(), abs(hash(expr)) % 9999),
                        '-setcookie', '6bc1t325xjo21c1',
                        '-pa', os.path.join(ROOT, 'tmp', 'build', 'out'), '-pa', EBIN,
                        '-eval', expr], capture_output=True, text=True, encoding='utf-8', errors='replace', timeout=1200)
    return (r.stdout or '') + (r.stderr or '')


def running_nodes():
    epmd = next((p for p in [os.path.join(ROOT, 'tmp', 'erlang19', 'bin', 'epmd.exe'),
                             os.path.join(ROOT, 'tmp', 'erlang19', 'erts-8.3', 'bin', 'epmd.exe')]
                 if os.path.exists(p)), None)
    if epmd is None:
        return []
    out = subprocess.run([epmd, '-names'], capture_output=True, text=True).stdout
    names = []
    for line in out.splitlines():
        parts = line.split()
        if len(parts) >= 2 and parts[0] == 'name':
            names.append(parts[1] + '@cll')
    return [n for n in names if n.startswith('fswy_')]


if __name__ == '__main__':
    main()
