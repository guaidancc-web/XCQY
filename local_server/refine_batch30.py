#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""Batch 30: apply the vague-probability policy.

有几率=50%, 一定概率=70%, 极大概率/极大几率=90%.
Affected implemented skills: 60450, 60449, 67075, 67133, 67200, 67207, 67378.
"""
import importlib.util
import os
import shutil
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
SRC = os.path.join(ROOT, 'YCserver', 'erl_src')
EBIN = os.path.join(ROOT, 'YCserver', 'data', 'server', 'ebin')

spec = importlib.util.spec_from_file_location(
    'b19', os.path.join(ROOT, 'local_server', 'refine_batch19.py'))
b19 = importlib.util.module_from_spec(spec)
spec.loader.exec_module(b19)
b = b19.b
b.BUILD = os.path.join(ROOT, 'tmp', 'build_batch30')
um = b.um
b15 = b19.b15


def replace_in_script(src, func, old, new):
    start = src.index('script_%d(' % func)
    nxt = src.find('\nscript_', start + 1)
    if nxt < 0:
        nxt = len(src)
    block = src[start:nxt]
    if block.count(old) != 1:
        raise SystemExit('%d: anchor count %d' % (func, block.count(old)))
    return src[:start] + block.replace(old, new, 1) + src[nxt:]


def main():
    apply = '--apply' in sys.argv
    combat, combat_crlf = b15.read_norm(os.path.join(SRC, 'skill_combat_data.erl'))
    cskill, cskill_crlf = b15.read_norm(os.path.join(SRC, 'combat_script_skill.erl'))

    combat_new = b19.edit_block(combat, 60450,
                                {'script_args': '[700, 400, 2]'})
    combat_new = b19.edit_block(combat_new, 60449,
                                {'script_args': '[900, 900, 900, 900]'})
    combat_new = b19.edit_block(combat_new, 67207,
                                {'script_args': '[700]'})

    cskill_new = cskill
    cskill_new = replace_in_script(cskill_new, 700023,
                                   '{90505, 1000, 5, 1, [50, 0]}',
                                   '{90505, 500, 5, 1, [50, 0]}')
    cskill_new = replace_in_script(cskill_new, 700029,
                                   'util:rand(1, 1000) =< 300 of',
                                   'util:rand(1, 1000) =< 500 of')
    cskill_new = replace_in_script(cskill_new, 700032,
                                   'util:rand(1, 1000) =< 700 of',
                                   'util:rand(1, 1000) =< 500 of')
    cskill_new = replace_in_script(
        cskill_new, 700049,
        'maybe_buff(Self, {90513, 1000, 2, 1, [1000, 0, 1, 1]}, 700);',
        'maybe_buff(Self, {90513, 1000, 2, 1, [1000, 0, 1, 1]}, 900);')

    print('data changes: 60450/60449/67207')
    print('script changes: 700023/700029/700032/700049')
    if not apply:
        print('dry-run; rerun with --apply')
        return

    b.verify_data('skill_combat_data', combat, combat_new)
    beams = {
        'combat_script_skill': b.compile_beam('combat_script_skill', cskill_new),
        'skill_combat_data': os.path.join(b.BUILD, 'skill_combat_data_new',
                                          'skill_combat_data.beam'),
    }
    texts = {'combat_script_skill': cskill_new,
             'skill_combat_data': combat_new}
    styles = {'combat_script_skill': cskill_crlf,
              'skill_combat_data': combat_crlf}
    for name, src in beams.items():
        shutil.copy2(src, os.path.join(EBIN, name + '.beam'))
        b15.write_keep(os.path.join(SRC, name + '.erl'), texts[name], styles[name])

    nodes = um.running_nodes()
    mods = ['combat_script_skill', 'skill_combat_data']
    if nodes:
        expr = ('Ns=%s,Ms=%s,R=[{N,[rpc:call(N,code,soft_purge,[M]) || M <- Ms],'
                '[rpc:call(N,code,load_file,[M]) || M <- Ms]} || N <- Ns],'
                'io:format("~p~n",[R]),init:stop().' % (str(nodes), str(mods)))
        print(um.erl_eval(expr)[:2000])


if __name__ == '__main__':
    main()
