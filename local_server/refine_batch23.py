#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""Batch 23: independent reflect / counter / combo triggers (2a).

- 60288 reflect, 60290 magic counter.
- 67332/67339 physical combo, 60447 magic combo.
- 60449 stun at the temporary 70% policy.
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
b.BUILD = os.path.join(ROOT, 'tmp', 'build_batch23')
um = b.um
b15 = b19.b15

IDS = {60288: 700061, 60290: 700062, 67332: 700063,
       67339: 700064, 60447: 700065, 60449: 700066}

EXPORTS = ''.join('         script_%d/4,\n' % sid for sid in sorted(IDS.values()))

DISPATCH = '''        700061 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_700061},
                          passive_type = [2]};
        700062 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_700062},
                          passive_type = [2]};
        700063 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_700063},
                          act_flag = more_attack, passive_type = [3]};
        700064 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_700064},
                          act_flag = more_attack, passive_type = [3]};
        700065 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_700065},
                          act_flag = more_attack, passive_type = [3]};
        700066 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_700066},
                          passive_type = [1]};
'''

SCRIPTS = '''

%% 2025 reflect/counter/combo triggers: independent wrappers.
script_700061(Skill, Self, Target, AddtArg) ->
    script_60021(Skill, Self, Target, AddtArg).

script_700062(Skill, Self, Target, AddtArg) ->
    script_60022(Skill, Self, Target, AddtArg).

script_700063(Skill, Self, Target, AddtArg) ->
    script_60001(Skill, Self, Target, AddtArg).

script_700064(Skill, Self, Target, AddtArg) ->
    script_60001(Skill, Self, Target, AddtArg).

script_700065(Skill, Self, Target, AddtArg) ->
    script_60002(Skill, Self, Target, AddtArg).

script_700066(Skill, Self, Target, AddtArg) ->
    script_60054(Skill, Self, Target, AddtArg).
'''


def main():
    apply = '--apply' in sys.argv
    combat, combat_crlf = b15.read_norm(os.path.join(SRC, 'skill_combat_data.erl'))
    cskill, cskill_crlf = b15.read_norm(os.path.join(SRC, 'combat_script_skill.erl'))

    combat_new = combat
    for sid, new_id in IDS.items():
        fields = {'script_id': new_id}
        if sid == 60449:
            fields['script_args'] = '[700, 700, 700, 700]'
        combat_new = b19.edit_block(combat_new, sid, fields)

    cskill_new = b.sub1(cskill, '         script_700060/4,\n',
                        '         script_700060/4,\n' + EXPORTS, 'exports')
    anchor = ('        700060 ->\n'
              '            Skill#c_skill{action =\n'
              '                              {combat_script_skill, script_700060},\n'
              '                          passive_type = [100, 102, 116]};\n')
    cskill_new = b.sub1(cskill_new, anchor, anchor + DISPATCH, 'dispatch')
    cskill_new = cskill_new.rstrip() + SCRIPTS

    print('scripts:', len(IDS))
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
