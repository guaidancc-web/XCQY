#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""Add the 26 pets (20041-20069) and every missing pet skill they reference.

Baseline is the already-patched server state in tmp/build/src (includes the
20022-20039 pets); if that is absent, falls back to YCserver/erl_src.

Skill templates are chosen from the same 60xxx family when possible, so
passives keep their attr list; otherwise 60089/60019 (active, single/AoE) and
60830 (passive) are used. Every existing key is differential-verified against
the installed beams before deployment.
"""
import json
import os
import re
import shutil
import subprocess
import sys

import UnityPy

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
SRC_ORIG = os.path.join(ROOT, 'YCserver', 'erl_src')
SRC_PREV = os.path.join(ROOT, 'tmp', 'build', 'src')
EBIN = os.path.join(ROOT, 'YCserver', 'data', 'server', 'ebin')
BUILD = os.path.join(ROOT, 'tmp', 'build_2025')
BACKUP = os.path.join(ROOT, 'tmp', 'beam_backup_2025')
ERLC = os.path.join(ROOT, 'tmp', 'erlang19', 'bin', 'erlc.exe')
ERL = os.path.join(ROOT, 'tmp', 'erlang19', 'bin', 'erl.exe')
DATA_BUNDLES = [
    os.path.join(ROOT, 'tmp', 'updated_client', 'business_data_2025.unity3d'),
    os.path.join(ROOT, 'cdn', 'patch_android', '202506251639', 'textures', 'textures_business_data.unity3d'),
]
NEW_PETS = list(range(20041, 20070))
MODULES = ['pet_data', 'skill_data', 'skill_combat_data']
ACTIVE_FALLBACK_SINGLE = 60089
ACTIVE_FALLBACK_AOE = 60019
PASSIVE_FALLBACK = 60830
EXPECTED_DIFFS = {}


def read(p):
    with open(p, encoding='utf-8', newline='') as f:
        return f.read()


def write(p, s):
    os.makedirs(os.path.dirname(p), exist_ok=True)
    with open(p, 'w', encoding='utf-8', newline='') as f:
        f.write(s)


def baseline_src():
    if all(os.path.exists(os.path.join(SRC_PREV, m + '.erl')) for m in MODULES):
        return SRC_PREV
    return SRC_ORIG


# ---------------------------------------------------------------- client data
def lua_field(body, key):
    m = re.search(r'(?:^|[{,])\s*%s = ' % re.escape(key), body)
    if not m:
        return None
    i = m.end()
    if body.startswith('{', i):
        depth, j = 0, i
        while j < len(body):
            if body[j] == '{':
                depth += 1
            elif body[j] == '}':
                depth -= 1
                if depth == 0:
                    return body[i:j + 1]
            j += 1
        return None
    e = body.find(',', i)
    return body[i:e if e >= 0 else len(body)].strip()


def load_client_bundle():
    path = next((p for p in DATA_BUNDLES if os.path.isfile(p) and os.path.getsize(p) > 0), None)
    if path is None:
        raise SystemExit('缺少 2025 data bundle（先让客户端更新一次，或用 cdn/ 里的缓存）')
    env = UnityPy.load(path)
    assets = {}
    for obj in env.objects:
        if obj.type.name == 'TextAsset':
            d = obj.read()
            s = d.m_Script
            assets[str(d.m_Name)] = s.decode('gbk', 'ignore') if isinstance(s, bytes) else s
    return assets


def parse_client_pets(pet_txt):
    a = pet_txt.find('DataPet.data_pet = {')
    b = pet_txt.find('DataPet.data_pet_grade = {', a)
    block = pet_txt[a:b]
    lines = {int(m.group(1)): m.group(0) for m in re.finditer(r'(?m)^\t\[(\d+)\] = \{id = \1,.*$', block)}
    out = {}
    for pid in NEW_PETS:
        if pid not in lines:
            continue
        body = '{' + re.match(r'^\t\[\d+\] = \{(.*)\},?$', lines[pid]).group(1) + '}'

        def scal(k, d=None):
            v = lua_field(body, k)
            return d if v is None else v

        nums = lambda s: [int(x) for x in re.findall(r'\d+', s or '')]
        pairs = lambda s: [(int(a), int(b)) for a, b in re.findall(r'\{(\d+),\s*(\d+)\}', s or '')]
        out[pid] = dict(
            name=scal('name').strip('"'),
            type=int(scal('type')), genre=int(scal('genre')),
            phy=int(scal('phy_aptitude')), pdef=int(scal('pdef_aptitude')),
            hp=int(scal('hp_aptitude')), magic=int(scal('magic_aptitude')),
            aspd=int(scal('aspd_aptitude')),
            base_skills=pairs(scal('base_skills')),
            need_lev_break=int(scal('need_lev_break', '0')),
            has_break=int(scal('has_break_skill', '1')),
            lev_break=nums(scal('lev_break_skills')),
            cost=pairs(scal('cost')), lev_break_cost=pairs(scal('lev_break_cost')),
            max_wash=int(scal('max_wash_time', '0')),
            growth=int(scal('growth_red')),
            model=scal('model_id'), model1=scal('model_id1'), model2=scal('model_id2'),
            model3=scal('model_id3'), skin0=scal('skin_id_0'), skin1=scal('skin_id_1'),
            skin2=scal('skin_id_2'), skin3=scal('skin_id_3'), ss0=scal('skin_id_s0'),
            ss1=scal('skin_id_s1'), ss2=scal('skin_id_s2'), ss3=scal('skin_id_s3'),
            manual_level=int(scal('manual_level', '1')),
        )
        for k in ('model', 'model1', 'model2', 'model3', 'skin0', 'skin1', 'skin2', 'skin3',
                  'ss0', 'ss1', 'ss2', 'ss3'):
            if not out[pid][k]:
                out[pid][k] = out[pid]['model']
    return out


def parse_skill_meta(skill_txt, combat_txt):
    names = {}
    a = skill_txt.find('DataSkill.petSkillGetFunc={')
    b = skill_txt.find('\nDataSkill.', a + 10)
    block = skill_txt[a:b if b > 0 else len(skill_txt)]
    for m in re.finditer(r'\["(\d+)_1"\]=\[\[{(\d+),(\d+),"([^"]*)"', block):
        names.setdefault(int(m.group(1)), m.group(4))
    meta = {}
    for m in re.finditer(r'(?m)^\t\["(\d+)_1"\]=\[\[(\{.*?\})\]\],?$', combat_txt):
        sid, body = int(m.group(1)), m.group(2)
        cm = re.search(r'^\{\d+,\d+,"[^"]*",-?\d+,-?\d+,(\{[^}]*\})', body)
        cost = cm.group(1) if cm else '?'
        tn = re.search(r'target_num = (\d+)', body)
        meta[sid] = {'cost': cost, 'target': int(tn.group(1)) if tn else 0}
    return names, meta


# ------------------------------------------------------------- server sources
def clause_block(src, head_re):
    heads = [(m.start(), m.group(0)) for m in re.finditer(head_re, src, re.M)]
    out = {}
    for i, (pos, head) in enumerate(heads):
        end = heads[i + 1][0] if i + 1 < len(heads) else src.find('\n\n', pos)
        keys = tuple(int(x) for x in re.findall(r'\d+', re.match(r'^[a-z_0-9]+\((.*?)\)\s*->', head).group(1)))
        out[keys] = src[pos:end].rstrip('\n')
    return out


def erl_list(nums, indent, per_line=1):
    if not nums:
        return '[]'
    if per_line == 1:
        return '[\n' + indent + (',\n' + indent).join(str(n) for n in nums) + ']'
    rows = [', '.join(str(n) for n in nums[i:i + per_line]) for i in range(0, len(nums), per_line)]
    return '[\n' + indent + (',\n' + indent).join(rows) + ']'


def erl_pair_list(pairs, indent):
    if not pairs:
        return '[]'
    return '[\n' + indent + (',\n' + indent).join('{%d, %d}' % p for p in pairs) + ']'


def erl_str(s):
    return s.replace('\\', '\\\\').replace('"', '\\"')


def build_pet_clauses(pets, pids, tpl):
    base, ratio, polish, model = [], [], [], []
    for pid in pids:
        p = pets[pid]
        vs = [int(x) for x in re.findall(r'\d+', tpl['vari_skills'])]
        rec = (
            "get_base(%d) ->\n"
            "    #pet_base{id = %d, name = lang:get(\"%s\"), type = %d,\n"
            "              genre = %d, phy_aptitude = %d, pdef_aptitude = %d,\n"
            "              hp_aptitude = %d, magic_aptitude = %d,\n"
            "              aspd_aptitude = %d, base_happy = %s,\n"
            "              min_happy_ratio = %s, max_happy_ratio = %s,\n"
            "              min_happy_genre_ratio = %s,\n"
            "              max_happy_genre_ratio = %s,\n"
            "              base_skills = %s,\n"
            "              vari_skills = %s,\n"
            "              has_break_skill = %d, lev_break_skills = %s,\n"
            "              cost = %s, lev_break_cost = %s,\n"
            "              max_wash_time = %d, growth_blue = %d,\n"
            "              growth_purple = %d, growth_orange = %d,\n"
            "              growth_red = %d, model_id = %s, model_id1 = %s,\n"
            "              model_id2 = %s, model_id3 = %s, skin_id_0 = %s,\n"
            "              skin_id_1 = %s, skin_id_2 = %s, skin_id_3 = %s,\n"
            "              skin_id_s0 = %s, skin_id_s1 = %s,\n"
            "              skin_id_s2 = %s, skin_id_s3 = %s,\n"
            "              need_lev_break = %d, manual_level = %d};\n"
        ) % (pid, pid, erl_str(p['name']), p['type'], p['genre'], p['phy'], p['pdef'],
             p['hp'], p['magic'], p['aspd'], tpl['base_happy'],
             tpl['min_happy_ratio'], tpl['max_happy_ratio'],
             tpl['min_happy_genre_ratio'], tpl['max_happy_genre_ratio'],
             erl_pair_list(p['base_skills'], '                  '),
             erl_list(vs, '                  '),
             p['has_break'], erl_list(p['lev_break'], '                  ', 5),
             erl_pair_list(p['cost'], '                  '),
             erl_pair_list(p['lev_break_cost'], '                  '),
             p['max_wash'], p['growth'], p['growth'], p['growth'], p['growth'],
             p['model'], p['model1'], p['model2'], p['model3'],
             p['skin0'], p['skin1'], p['skin2'], p['skin3'],
             p['ss0'], p['ss1'], p['ss2'], p['ss3'],
             p['need_lev_break'], p['manual_level'])
        base.append(rec)
        model.append('model(%d) -> %s;\n' % (pid, p['model']))
        ratio.append('get_base_ratio(%d) -> {0, 0, 0, 0, 0, 0, 0};\n' % pid)
        polish.append('get_polish(%d) -> [{20006, 5}, {20618, 2}];\n' % pid)
    return ''.join(base), ''.join(model), ''.join(ratio), ''.join(polish)


def build_stone_clauses(pids, stone_tpl_lines):
    out = []
    for pid in pids:
        for line in stone_tpl_lines:
            out.append(re.sub(r'\{20021,', '{%d,' % pid, line))
    return ''.join(l + '\n' for l in out)


def insert_before(src, catchall, text):
    i = src.index(catchall)
    return src[:i] + text + src[i:]


def pick_template(sid, active, pet_blocks, combat_blocks):
    suffix = sid % 1000
    cands = []
    if 60000 <= sid < 61000:
        for base in (60000, 60100, 60200, 60300, 60400, 60500):
            c = base + suffix
            if c < sid and (c, 1) in pet_blocks and (not active or (c, 1) in combat_blocks):
                cands.append(c)
    if not cands:
        if active:
            return ACTIVE_FALLBACK_SINGLE
        return PASSIVE_FALLBACK
    return max(cands)


def build_skill_clauses(skill_src, combat_src, pets, names, meta, server_ids, server_combat):
    pet_blocks = clause_block(skill_src, r'^get_pet\(\{\d+, 1\}\) ->')
    combat_blocks = clause_block(combat_src, r'^get_combat\(\{\d+, 1\}\) ->')
    refs = set()
    for p in pets.values():
        refs.update(s for s, _ in p['base_skills'])
        refs.update(p['lev_break'])
    missing = sorted(refs - server_ids)
    used_types = set(int(x) for x in re.findall(r'type = (\d+)', skill_src))
    next_type = 1000
    skill_out, combat_out, chosen = [], [], {}
    for sid in missing:
        if sid not in names:
            raise SystemExit('client skill name missing: %d' % sid)
        m = meta.get(sid)
        active = bool(m and m['cost'] != '{}')
        tpl = pick_template(sid, active, pet_blocks, combat_blocks)
        key = (tpl, 1)
        if key not in pet_blocks:
            raise SystemExit('no pet_base_skill template %d for %d' % (tpl, sid))
        body = re.search(r'#pet_base_skill\{.*?\};', pet_blocks[key], re.S).group(0)
        body = re.sub(r'id = \d+', 'id = %d' % sid, body, count=1)
        body = re.sub(r'name = lang:get\(".*?"\)', 'name = lang:get("%s")' % erl_str(names[sid]), body, count=1)
        body = re.sub(r'type = \d+', 'type = %d' % next_type, body, count=1)
        next_type += 1
        skill_out.append('get_pet({%d, 1}) ->\n    %s\n' % (sid, body))
        if active:
            if key not in combat_blocks:
                raise SystemExit('no combat template %d for %d' % (tpl, sid))
            cbody = re.search(r'#skill\{.*?\};', combat_blocks[key], re.S).group(0)
            cbody = re.sub(r'id = \d+', 'id = %d' % sid, cbody, count=1)
            cbody = re.sub(r'name = lang:get\(".*?"\)', 'name = lang:get("%s")' % erl_str(names[sid]), cbody, count=1)
            combat_out.append('get_combat({%d, 1}) ->\n    %s\n' % (sid, cbody))
        chosen[sid] = (tpl, active)
    return ''.join(skill_out), ''.join(combat_out), missing, chosen


def main():
    install = '--install' in sys.argv
    src = baseline_src()
    print('baseline:', src)
    os.makedirs(BUILD, exist_ok=True)
    os.makedirs(os.path.join(BUILD, 'src'), exist_ok=True)
    os.makedirs(os.path.join(BUILD, 'baseline'), exist_ok=True)
    os.makedirs(os.path.join(BUILD, 'patched'), exist_ok=True)
    os.makedirs(os.path.join(BUILD, 'out'), exist_ok=True)

    assets = load_client_bundle()
    pets = parse_client_pets(assets['data_pet'])
    names, meta = parse_skill_meta(assets['data_skill'], assets['data_combat_skill'])
    if not pets:
        raise SystemExit('no 2025 pets parsed')

    pet_txt = read(os.path.join(src, 'pet_data.erl'))
    skill_txt = read(os.path.join(src, 'skill_data.erl'))
    combat_txt = read(os.path.join(src, 'skill_combat_data.erl'))

    tpl_blocks = clause_block(pet_txt, r'^get_base\(\d+\) ->')
    tpl_raw = tpl_blocks[(20021,)]
    tpl = {'vari_skills': re.search(r'vari_skills =\s*\[(.*?)\]', tpl_raw, re.S).group(1)}
    for k in ['base_happy', 'min_happy_ratio', 'max_happy_ratio',
              'min_happy_genre_ratio', 'max_happy_genre_ratio']:
        tpl[k] = re.search(r'%s = (\d+)' % k, tpl_raw).group(1)

    chunk = re.search(r'allow_stone\(\{20021, 0, 1\}\) ->\n(.*?)allow_stone\(_\)', pet_txt, re.S).group(0)
    chunk = chunk.rstrip()[:-len('allow_stone(_)')]
    stone_lines = []
    for m in re.finditer(r'allow_stone\(\{20021, (\d+), (\d+)\}\) ->\n\s+(\[[^\]]*\]);', chunk, re.S):
        stone_lines.append('allow_stone({20021, %s, %s}) ->\n    %s;' % (m.group(1), m.group(2), re.sub(r'\s+', ' ', m.group(3))))

    new_pids = [pid for pid in sorted(pets) if ('get_base(%d) ->' % pid) not in pet_txt]
    base_txt, model_txt, ratio_txt, polish_txt = build_pet_clauses(pets, new_pids, tpl)
    stone_txt = build_stone_clauses(new_pids, stone_lines)

    pet_new = pet_txt
    pet_new = insert_before(pet_new, 'get_base(_) -> false.\n', base_txt)
    pet_new = insert_before(pet_new, 'model(_) -> false.\n', model_txt)
    pet_new = insert_before(pet_new, 'get_base_ratio(_) -> false.\n', ratio_txt)
    pet_new = insert_before(pet_new, 'get_polish(_) -> false.\n', polish_txt)
    pet_new = insert_before(pet_new, 'allow_stone(_) -> [].\n', stone_txt)

    server_ids = set(int(x) for x in re.findall(r'get_pet\(\{(\d+), 1\}\) ->', skill_txt))
    server_combat = set(int(x) for x in re.findall(r'get_combat\(\{(\d+), 1\}\) ->', combat_txt))
    skill_txt_new, combat_txt_new, missing, chosen = build_skill_clauses(
        skill_txt, combat_txt, pets, names, meta, server_ids, server_combat)
    skill_new = insert_before(skill_txt, 'get_pet(_) -> false.\n', skill_txt_new)
    combat_new = insert_before(combat_txt, 'get_combat(_) -> false.\n', combat_txt_new)

    for mod, text in [('pet_data', pet_new), ('skill_data', skill_new), ('skill_combat_data', combat_new)]:
        write(os.path.join(BUILD, 'src', mod + '.erl'), text)
        print('%-20s %10d -> %10d bytes' % (mod, len(read(os.path.join(src, mod + '.erl'))), len(text)))

    for mod in MODULES:
        for stage, path in [('baseline', os.path.join(src, mod + '.erl')),
                            ('patched', os.path.join(BUILD, 'src', mod + '.erl'))]:
            out = os.path.join(BUILD, stage)
            r = subprocess.run([ERLC, '-o', out, path], capture_output=True, text=True)
            if r.returncode:
                print(r.stdout, r.stderr)
                raise SystemExit('compile failed: %s (%s)' % (mod, stage))
            print('%-18s %-8s -> %8d bytes' % (mod, stage, os.path.getsize(os.path.join(out, mod + '.beam'))))

    print('\npets: %d, missing skills: %d (active %d, passive %d)' % (
        len(pets), len(missing), sum(1 for s in missing if chosen[s][1]), sum(1 for s in missing if not chosen[s][1])))
    for pid in sorted(pets):
        p = pets[pid]
        print('  %d %-8s type=%d growth=%d skills=%s break=%s' % (
            pid, p['name'], p['type'], p['growth'], [s for s, _ in p['base_skills']], p['lev_break']))

    verify(src)
    if not install:
        print('\n(generate+compile+verify done; rerun with --install to deploy and hot-load)')
        return
    deploy(src)
    print('\nhot-loaded. new pets:', ', '.join(str(p) for p in sorted(pets)))


def erl_eval(expr):
    r = subprocess.run([ERL, '+S1:1', '-noshell',
                        '-sname', 'patcher25_%d_%s' % (os.getpid(), abs(hash(expr)) % 9999),
                        '-setcookie', '6bc1t325xjo21c1',
                        '-pa', os.path.join(BUILD, 'out'),
                        '-pa', os.path.join(ROOT, 'tmp', 'build', 'out'), '-pa', EBIN,
                        '-eval', expr], capture_output=True, text=True, timeout=1200)
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


def verify(src):
    for mod in MODULES:
        keys = os.path.join(BUILD, mod + '.keys')
        subprocess.run([sys.executable, os.path.join(ROOT, 'tmp', 'make_keys.py'),
                        os.path.join(src, mod + '.erl'), keys], check=True,
                       stdout=subprocess.DEVNULL)
        orig = os.path.join(EBIN, mod + '.beam')
        for stage in ['baseline', 'patched']:
            out = erl_eval('verify_beam:run("%s","%s","%s")' % (
                orig.replace('\\', '/'),
                os.path.join(BUILD, stage, mod + '.beam').replace('\\', '/'),
                keys.replace('\\', '/')))
            line = next((l for l in out.split('\n') if 'compared' in l), out.strip()[:200])
            allow = EXPECTED_DIFFS.get(mod, 0)
            n = int(re.search(r'(\d+) diffs', line).group(1)) if 'diffs' in line else -1
            flag = 'OK' if n == allow else 'FAIL'
            print('  verify %-18s %-8s %s  (%s)' % (mod, stage, line.strip(), flag))
            if flag == 'FAIL':
                print(out[:3000])
                raise SystemExit('regression detected in %s (%s)' % (mod, stage))


def deploy(src):
    os.makedirs(BACKUP, exist_ok=True)
    for mod in MODULES:
        dst = os.path.join(EBIN, mod + '.beam')
        bak = os.path.join(BACKUP, mod + '.beam')
        if not os.path.exists(bak):
            shutil.copy2(dst, bak)
        shutil.copy2(os.path.join(BUILD, 'patched', mod + '.beam'), dst)
        print('installed', mod, '(pre-2025 beam kept in %s)' % BACKUP)
        shutil.copy2(os.path.join(BUILD, 'src', mod + '.erl'), os.path.join(SRC_ORIG, mod + '.erl'))
        print('updated source', mod)
    nodes = running_nodes()
    if not nodes:
        print('no running fswy nodes - beams installed, they load on next server start')
        return
    expr = ('Nodes=%s, Mods=%s, R=[{{N,M},rpc:call(N,code,load_file,[M])} '
            '|| N <- Nodes, M <- Mods], io:format("~p~n",[R]), init:stop().' %
            (str(nodes), str(MODULES)))
    print('hot-loading on', nodes)
    print(erl_eval(expr)[:4000])


if __name__ == '__main__':
    main()
