#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""Stacking auras for 67082 / 67132 / 67300 / 67344 / 67360.

Adds two combat buff bases (90500 max 99 layers, 90501 max 3 layers) using
the existing 417001 damage-ratio halo script, then attaches 60146 to each
passive so the buff is reapplied before each action.
"""
import importlib.util
import os
import re
import shutil
import subprocess
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
SRC = os.path.join(ROOT, 'YCserver', 'erl_src')
EBIN = os.path.join(ROOT, 'YCserver', 'data', 'server', 'ebin')
BUILD = os.path.join(ROOT, 'tmp', 'build_stacking')
ERLC = os.path.join(ROOT, 'tmp', 'erlang19', 'bin', 'erlc.exe')

spec = importlib.util.spec_from_file_location('um', os.path.join(ROOT, 'local_server', 'refine_unique_mechanics.py'))
um = importlib.util.module_from_spec(spec)
spec.loader.exec_module(um)

STACK = {
    67082: (90500, [100]),
    67132: (90501, [150]),
    67300: (90501, [100]),
    67344: (90500, [100]),
    67360: (90500, [150]),
}


def add_buff_bases(text):
    if 'get_buff(90500)' in text:
        return text
    m = re.search(r'get_buff\(90350\) ->\n    #c_buff_base\{.*?\};\n', text, re.S)
    if not m:
        raise SystemExit('90350 buff anchor not found')
    add = (
        'get_buff(90500) ->\n'
        '    #c_buff_base{id = 90500, eff_type = buff, type = 90500,\n'
        '                 max_layer = 99, script_id = 417001};\n'
        'get_buff(90501) ->\n'
        '    #c_buff_base{id = 90501, eff_type = buff, type = 90501,\n'
        '                 max_layer = 3, script_id = 417001};\n')
    return text[:m.end()] + add + text[m.end():]


def compile_mod(name, text, stage):
    d = os.path.join(BUILD, name, stage)
    os.makedirs(d, exist_ok=True)
    path = os.path.join(d, name + '.erl')
    um.write(path, text)
    r = subprocess.run([ERLC, '-o', d, path], capture_output=True, text=True,
                       encoding='utf-8', errors='replace')
    if r.returncode:
        print(r.stdout, r.stderr)
        raise SystemExit('compile failed %s %s' % (name, stage))
    return d


def verify(name, baseline_src, patched_src):
    base_dir = compile_mod(name, baseline_src, 'baseline')
    patched_dir = compile_mod(name, patched_src, 'patched')
    keys = os.path.join(BUILD, name + '.keys')
    subprocess.run([sys.executable, os.path.join(ROOT, 'tmp', 'make_keys.py'),
                    os.path.join(base_dir, name + '.erl'), keys],
                   check=True, stdout=subprocess.DEVNULL)
    out = um.erl_eval('verify_beam:run("%s","%s","%s")' % (
        os.path.join(EBIN, name + '.beam').replace('\\', '/'),
        os.path.join(patched_dir, name + '.beam').replace('\\', '/'),
        keys.replace('\\', '/')))
    print(next((l for l in out.split('\n') if 'compared' in l), out[:500]))
    if '0 diffs' not in out:
        print(out[:3000])
        raise SystemExit('verify failed %s' % name)
    shutil.copy2(os.path.join(patched_dir, name + '.beam'), os.path.join(EBIN, name + '.beam'))
    um.write(os.path.join(SRC, name + '.erl'), patched_src)


def main():
    apply = '--apply' in sys.argv
    script_src = um.read(os.path.join(SRC, 'skill_script_data.erl'))
    combat_src = um.read(os.path.join(SRC, 'skill_combat_data.erl'))
    skill_src = um.read(os.path.join(SRC, 'skill_data.erl'))

    script_new = add_buff_bases(script_src)
    blocks = {int(m.group(1)): m.group(0) for m in re.finditer(
        r'get_combat\(\{(\d+), 1\}\) ->\n.*?(?=\nget_combat\(|\Z)', combat_src, re.S)}
    combat_new = combat_src
    for sid, (bid, args) in sorted(STACK.items()):
        name = re.search(r'get_pet\(\{%d, 1\}\) ->\n    #pet_base_skill\{.*?name = lang:get\("([^"]*)"\)' % sid,
                         skill_src, re.S)
        spec_ = dict(tpl=60517, type=1, sub=2, target_type=1, count=1,
                     cost_mp=None, cd=1, script_id=60146,
                     script_args=[[], [], 0], dmg_ratio=[1000],
                     buff_self=[(bid, 1000, 999, 1, args)])
        clause = um.make_clause(combat_src, sid, name.group(1) if name else str(sid), spec_)
        if sid in blocks:
            combat_new = combat_new.replace(blocks[sid], clause, 1)
        else:
            combat_new = combat_new.replace('get_combat(_) -> false.\n',
                                            clause + '\n' + 'get_combat(_) -> false.\n', 1)
    print('stack skills:', len(STACK), 'buff bases added:', script_new != script_src)
    if not apply:
        print('dry-run; rerun with --apply')
        return
    verify('skill_script_data', script_src, script_new)
    verify('skill_combat_data', combat_src, combat_new)
    nodes = um.running_nodes()
    if nodes:
        expr = ('Ns=%s,R=[{N,rpc:call(N,code,soft_purge,[skill_script_data]),'
                'rpc:call(N,code,load_file,[skill_script_data]),'
                'rpc:call(N,code,soft_purge,[skill_combat_data]),'
                'rpc:call(N,code,load_file,[skill_combat_data])} || N <- Ns],'
                'io:format("~p~n",[R]),init:stop().' % str(nodes))
        print(um.erl_eval(expr)[:2000])


if __name__ == '__main__':
    main()
