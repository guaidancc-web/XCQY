#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""Third pass: support actives and common shields / reductions / stealth.

Uses existing combat scripts:
  20002 heal, 20049 mana, 20000 buff-only cast,
  60146 passive pre-action buff, 31000/33002 not touched here.
Buff scripts:
  120010 HP shield (70055), 120000 hit shield (30002),
  102020 heal-over-time (80005), 425001 damage reduction (69514),
  417001 damage boost (90350), 157001 reflect (70065),
  115011 control immunity (70025), 129000 stealth (90009).
"""
import os
import re
import shutil
import subprocess
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
SRC = os.path.join(ROOT, 'YCserver', 'erl_src')
EBIN = os.path.join(ROOT, 'YCserver', 'data', 'server', 'ebin')
BUILD = os.path.join(ROOT, 'tmp', 'build_unique')
ERLC = os.path.join(ROOT, 'tmp', 'erlang19', 'bin', 'erlc.exe')
ERL = os.path.join(ROOT, 'tmp', 'erlang19', 'bin', 'erl.exe')
REPORT = os.path.join(ROOT, 'tmp', 'unique_mechanics_report.tsv')


def read(p):
    with open(p, encoding='utf-8', newline='') as f:
        return f.read()


def write(p, s):
    os.makedirs(os.path.dirname(p), exist_ok=True)
    with open(p, 'w', encoding='utf-8', newline='') as f:
        f.write(s)


def erl(v):
    if isinstance(v, tuple):
        return '{' + ', '.join(erl(x) for x in v) + '}'
    if isinstance(v, list):
        return '[' + ', '.join(erl(x) for x in v) + ']'
    return str(v)


def template_body(src, tid):
    m = re.search(r'get_combat\(\{%d, 1\}\) ->\n(.*?)(?=\nget_combat\(|\Z)' % tid, src, re.S)
    if not m:
        raise SystemExit('missing combat template %d' % tid)
    body = m.group(1).rstrip()
    return body[:-1].rstrip() if body.endswith(';') else body


def replace_list_field(body, key, value):
    m = re.search(r'\b%s\s*=\s*\[' % key, body)
    if not m:
        return re.sub(r',\s*script_id =', ',\n           %s = %s,\n           script_id =' % (key, value),
                      body, count=1)
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


def set_scalar(body, key, value):
    pat = re.compile(r'\b%s = [^,}\n]+' % key)
    if pat.search(body):
        return pat.sub('%s = %s' % (key, value), body, count=1)
    return re.sub(r',\s*script_id =', ',\n           %s = %s,\n           script_id =' % (key, value),
                  body, count=1)


def remove_field(body, key):
    return re.sub(r',\s*%s = \d+' % key, '', body, count=1)


def make_clause(src, sid, name, spec):
    body = template_body(src, spec['tpl'])
    body = re.sub(r'\bid = \d+', 'id = %d' % sid, body, count=1)
    body = re.sub(r'name = lang:get\("[^"]*"\)',
                  'name = lang:get("%s")' % name.replace('"', '\\"'), body, count=1)
    if 'type' in spec:
        body = set_scalar(body, 'type', spec['type'])
    if 'sub' in spec:
        body = set_scalar(body, 'sub_type', spec['sub'])
    if 'target_type' in spec:
        body = set_scalar(body, 'target_type', spec['target_type'])
    if 'count' in spec:
        body = replace_list_field(body, 'target_list', '[{1, 2, %d}]' % spec['count'])
    if 'dmg_ratio' in spec:
        body = replace_list_field(body, 'dmg_ratio', erl(spec['dmg_ratio']))
    if 'cost_mp' in spec:
        if spec['cost_mp']:
            body = set_scalar(body, 'cost_mp', spec['cost_mp'])
        else:
            body = remove_field(body, 'cost_mp')
    if 'cd' in spec:
        if spec['cd']:
            body = set_scalar(body, 'cooldown', spec['cd'])
        else:
            body = remove_field(body, 'cooldown')
    if 'script_id' in spec:
        body = set_scalar(body, 'script_id', spec['script_id'])
    if spec.get('script_args') is not None:
        body = replace_list_field(body, 'script_args', erl(spec['script_args']))
    if spec.get('buff_self') is not None:
        body = replace_list_field(body, 'buff_self', erl(spec['buff_self']))
    if spec.get('buff_target') is not None:
        body = replace_list_field(body, 'buff_target', erl(spec['buff_target']))
    return 'get_combat({%d, 1}) ->\n    %s;' % (sid, body)


SUPPORT = {
    67074: dict(tpl=61041, type=0, sub=0, target_type=0, count=3, cost_mp=0, cd=0,
                script_id=20002, script_args=[80, 200],
                buff_target=[[(80005, 1000, 3, 1, [50, 0, 0])]]),
    67113: dict(tpl=61041, type=0, sub=0, target_type=0, count=4, cost_mp=0, cd=0,
                script_id=20002, script_args=[120, 200],
                buff_target=[[(80005, 1000, 3, 1, [80, 0, 0])]]),
    67114: dict(tpl=61041, type=0, sub=0, target_type=0, count=5, cost_mp=3, cd=0,
                script_id=20049, script_args=[300, 0], buff_target=[]),
    67117: dict(tpl=61043, type=0, sub=0, target_type=0, count=13, cost_mp=4, cd=2,
                script_id=20000, script_args=None,
                buff_target=[[(69514, 1000, 3, 1, [500])]]),
    67118: dict(tpl=61043, type=0, sub=0, target_type=0, count=1, cost_mp=0, cd=0,
                script_id=20000, script_args=None,
                buff_target=[[(70065, 1000, 3, 1, [999, 350])]]),
    67119: dict(tpl=61043, type=0, sub=0, target_type=0, count=13, cost_mp=4, cd=2,
                script_id=20000, script_args=None,
                buff_target=[[(90350, 1000, 3, 1, [200])]]),
}

SHIELDS = {
    67091: dict(buff_self=[(70055, 1000, 2, 0, [2000, 0])]),
    67093: dict(buff_self=[(70055, 1000, 2, 0, [2000, 0]),
                           (70065, 1000, 999, 0, [999, 200])]),
    67115: dict(buff_self=[(70055, 1000, 2, 0, [2000, 0]),
                           (70065, 1000, 999, 0, [999, 200])]),
    67127: dict(buff_self=[(70055, 1000, 2, 0, [2000, 0])]),
    67302: dict(buff_self=[(70055, 1000, 2, 0, [2000, 0])]),
    67336: dict(buff_self=[(70055, 1000, 1, 0, [1000, 0])]),
    67341: dict(buff_self=[(70055, 1000, 1, 0, [1000, 0]), (88047, 1000, 999, 0, [100, 0, 1])]),
    67346: dict(buff_self=[(70055, 1000, 1, 0, [2000, 0])]),
    67356: dict(buff_self=[(70055, 1000, 1, 0, [2000, 0])]),
    67366: dict(buff_self=[(30002, 1000, 1, 0, [6, 0])]),
    67371: dict(buff_self=[(30002, 1000, 1, 0, [6, 0])]),
    67307: dict(buff_self=[(69514, 1000, 2, 0, [700])]),
    67305: dict(buff_self=[(69514, 1000, 999, 0, [300]),
                           (70065, 1000, 999, 0, [999, 300])]),
    67315: dict(buff_self=[(69514, 1000, 2, 0, [200])], cd=1),
    67314: dict(buff_self=[(90009, 1000, 2, 1, [100])]),
    67304: dict(buff_self=[(90335, 1000, 999, 0, [0, 1000, 50100, 0, 1000])]),
    67308: dict(buff_self=[(90335, 1000, 999, 0, [0, 1000, 50100, 0, 800])]),
    67369: dict(buff_self=[(90335, 1000, 999, 0, [0, 1000, 50100, 0, 1500])]),
    67337: dict(buff_self=[(88047, 1000, 1, 0, [500, 0, 1])], cd=1),
}


def main():
    apply = '--apply' in sys.argv
    src = read(os.path.join(SRC, 'skill_combat_data.erl'))
    skill = read(os.path.join(SRC, 'skill_data.erl'))
    blocks = {int(m.group(1)): m.group(0) for m in re.finditer(
        r'get_combat\(\{(\d+), 1\}\) ->\n.*?(?=\nget_combat\(|\Z)', src, re.S)}
    rows = []
    new_src = src
    for sid, spec in sorted({**SUPPORT, **SHIELDS}.items()):
        if sid in SUPPORT:
            spec = dict(spec, tpl=spec['tpl'])
        else:
            spec = dict(spec, tpl=60517, type=1, sub=2, target_type=1, count=1,
                        cost_mp=None, cd=spec.get('cd', 99),
                        script_id=60146, script_args=[[], [], 0],
                        dmg_ratio=[1000])
        name = re.search(r'get_pet\(\{%d, 1\}\) ->\n    #pet_base_skill\{.*?name = lang:get\("([^"]*)"\)' % sid,
                         skill, re.S)
        clause = make_clause(src, sid, name.group(1) if name else str(sid), spec)
        if sid in blocks:
            new_src = new_src.replace(blocks[sid], clause, 1)
        else:
            new_src = new_src.replace('get_combat(_) -> false.\n',
                                      clause + '\n' + 'get_combat(_) -> false.\n', 1)
        rows.append((sid, name.group(1) if name else '?', spec['tpl'], spec.get('count', 1),
                     spec.get('buff_self') or spec.get('buff_target')))
    # 67116 has no battle-start shield in the description; keep it attr-only
    new_src = re.sub(
        r'get_combat\(\{67116, 1\}\) ->\n.*?(?=\nget_combat\()',
        '', new_src, count=1, flags=re.S)
    with open(REPORT, 'w', encoding='utf-8', newline='') as f:
        f.write('id\tname\ttemplate\tcount\tbuffs\n')
        for r in rows:
            f.write('\t'.join(map(str, r)) + '\n')
    print('report:', REPORT, 'rows:', len(rows))
    if not apply:
        print('dry-run; rerun with --apply')
        return

    os.makedirs(BUILD, exist_ok=True)
    for stage, text in (('baseline', src), ('patched', new_src)):
        d = os.path.join(BUILD, stage)
        os.makedirs(d, exist_ok=True)
        path = os.path.join(d, 'skill_combat_data.erl')
        write(path, text)
        r = subprocess.run([ERLC, '-o', d, path], capture_output=True, text=True,
                           encoding='utf-8', errors='replace')
        if r.returncode:
            print(r.stdout, r.stderr)
            raise SystemExit('compile failed %s' % stage)
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
                        '-sname', 'uniqueref_%d_%s' % (os.getpid(), abs(hash(expr)) % 9999),
                        '-setcookie', '6bc1t325xjo21c1',
                        '-pa', os.path.join(ROOT, 'tmp', 'build', 'out'), '-pa', EBIN,
                        '-eval', expr], capture_output=True, text=True,
                       encoding='utf-8', errors='replace', timeout=1200)
    return (r.stdout or '') + (r.stderr or '')


def running_nodes():
    epmd = next((p for p in [os.path.join(ROOT, 'tmp', 'erlang19', 'bin', 'epmd.exe'),
                             os.path.join(ROOT, 'tmp', 'erlang19', 'erts-8.3', 'bin', 'epmd.exe')]
                 if os.path.exists(p)), None)
    if epmd is None:
        return []
    out = subprocess.run([epmd, '-names'], capture_output=True, text=True,
                         encoding='utf-8', errors='replace').stdout
    names = []
    for line in out.splitlines():
        parts = line.split()
        if len(parts) >= 2 and parts[0] == 'name':
            names.append(parts[1] + '@cll')
    return [n for n in names if n.startswith('fswy_')]


if __name__ == '__main__':
    main()
