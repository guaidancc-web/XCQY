#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""Batch 25: independent lifesteal / judgment / ghost / soul-ban / penetration.

Core: 61064, 60301, 60302, 67355, 67038.
Penetration: 60444, 67354, 67364.
Type-conditional body skills: 67352/67357/67362/67372.
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
b.BUILD = os.path.join(ROOT, 'tmp', 'build_batch25')
um = b.um
b15 = b19.b15

IDS = {61064: 700071, 60301: 700072, 60302: 700073,
       67355: 700074, 67038: 700075,
       60444: 700076, 67354: 700077, 67364: 700078,
       67352: 700079, 67357: 700080, 67362: 700081, 67372: 700082}

EXPORTS = ''.join('         script_%d/4,\n' % sid for sid in sorted(IDS.values()))

DISPATCH = '''        700071 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_700071},
                          passive_type = [1], special_type = [anti_attack]};
        700072 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_700072},
                          passive_type = [1], special_type = [anti_attack]};
        700073 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_700073},
                          passive_type = [1], special_type = [anti_attack]};
        700074 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_700074},
                          passive_type = [1]};
        700075 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_700075},
                          passive_type = [1]};
        700076 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_700076},
                          passive_type = [1], special_type = [anti_attack]};
        700077 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_700077},
                          passive_type = [1], special_type = [anti_attack]};
        700078 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_700078},
                          passive_type = [1]};
        700079 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_700079},
                          passive_type = [1]};
        700080 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_700080},
                          passive_type = [1]};
        700081 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_700081},
                          passive_type = [1]};
        700082 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_700082},
                          passive_type = [1]};
'''

SCRIPTS = '''

%% 2025 lifesteal/judgment/ghost/soul-ban: independent wrappers.
script_700071(Skill, Self, Target, AddtArg) ->
    script_60006(Skill, Self, Target, AddtArg).

script_700072(Skill, Self, Target, AddtArg) ->
    script_60028(Skill, Self, Target, AddtArg).

script_700073(Skill, Self, Target, AddtArg) ->
    script_60029(Skill, Self, Target, AddtArg).

script_700074(Skill, Self, Target, AddtArg) ->
    script_60173(Skill, Self, Target, AddtArg).

script_700075(Skill, Self, Target, AddtArg) ->
    script_60173(Skill, Self, Target, AddtArg).

script_700076(Skill, Self, Target, AddtArg) ->
    script_60047(Skill, Self, Target, AddtArg).

script_700077(Skill, Self, Target, AddtArg) ->
    script_60047(Skill, Self, Target, AddtArg).

script_700078(Skill, Self, Target, AddtArg) ->
    script_60058(Skill, Self, Target, AddtArg).

%% Body skills: ignore both defenses only when the target is a character.
type_pen(Target, PhyRatio, MagicRatio) ->
    case Target of
        #fighter{type = 1} ->
            #passive_effect{dec_phy_def_ratio = PhyRatio,
                            dec_magic_def_ratio = MagicRatio};
        _ -> #passive_effect{}
    end.

script_700079(_Skill, _Self, Target, _AddtArg) ->
    type_pen(Target, 100, 100).

script_700080(_Skill, _Self, Target, _AddtArg) ->
    type_pen(Target, 350, 350).

script_700081(_Skill, _Self, Target, _AddtArg) ->
    type_pen(Target, 300, 300).

script_700082(_Skill, _Self, Target, _AddtArg) ->
    type_pen(Target, 350, 350).
'''


def main():
    apply = '--apply' in sys.argv
    combat, combat_crlf = b15.read_norm(os.path.join(SRC, 'skill_combat_data.erl'))
    cskill, cskill_crlf = b15.read_norm(os.path.join(SRC, 'combat_script_skill.erl'))

    combat_new = combat
    keep_args = {61064, 60301, 60302, 67355, 67038, 60444, 67354, 67364}
    for sid, new_id in IDS.items():
        fields = {'script_id': new_id}
        if sid not in keep_args:
            fields['script_args'] = '[]'
        combat_new = b19.edit_block(combat_new, sid, fields)

    cskill_new = b.sub1(cskill, '         script_700070/4,\n',
                        '         script_700070/4,\n' + EXPORTS, 'exports')
    anchor = ('        700070 ->\n'
              '            Skill#c_skill{action =\n'
              '                              {combat_script_skill, script_700070},\n'
              '                          passive_type = [1]};\n')
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
