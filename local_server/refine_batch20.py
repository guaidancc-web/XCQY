#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""Batch 20: independent scripts for 5 support/heal skills.

- 67074 heal 3 allies 8%+200, regen 5%/round 3 rounds.
- 67113 heal 4 allies 12%+200, regen 8%/round 3 rounds.
- 67114 restore 30% max MP to 5 allies, cooldown 3.
- 67117 all allies 50% magic damage reduction 3 rounds, cooldown 2.
- 67118 one ally 35% damage reflect 3 rounds.
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
b.BUILD = os.path.join(ROOT, 'tmp', 'build_batch20')
um = b.um
b15 = b19.b15

IDS = {67074: 700044, 67113: 700045, 67114: 700046,
       67117: 700047, 67118: 700048}

EXPORTS = ''.join('         script_%d/4,\n' % sid for sid in sorted(IDS.values()))

DISPATCH = ''.join('''        %d ->
            Skill#c_skill{action =
                              {combat_script_skill, script_%d}};
''' % (sid, sid) for sid in sorted(IDS.values()))

SCRIPTS = '''

%% 2025 support skills: independent heal / shield shells.
heal_target(Skill = #c_skill{skill =
                                 #skill{script_args = [HealRatio, HealHp]}},
            Self, Target = #fighter{hp_max = HpMax}, AddtArg) ->
    HealHp1 = round(HealHp + HpMax * HealRatio / 1000),
    combat_script_skill_calc:heal(Skill,
                                  Self,
                                  Target,
                                  AddtArg,
                                  #action_effect{heal_hp = HealHp1,
                                                 can_anti_heal = 1}).

script_700044(Skill, Self, Target, AddtArg) ->
    heal_target(Skill, Self, Target, AddtArg).

script_700045(Skill, Self, Target, AddtArg) ->
    heal_target(Skill, Self, Target, AddtArg).

%% 67114: restore 30% max MP.
script_700046(Skill = #c_skill{skill =
                                   #skill{script_args = [Ratio, Val]}},
              Self, Target = #fighter{mp_max = MpMax}, AddtArg) ->
    AddMp = round(Val + MpMax * Ratio / 1000),
    {Tvc, Tc} = case AddMp > 0 of
                    true -> {[{mp, 1, AddMp}], [{1, AddMp, 0}]};
                    false -> {[], []}
                end,
    AddtArg1 = AddtArg#c_skill_addt_arg{target_val_changed = Tvc,
                                       target_changed = Tc},
    combat_script_skill_calc:cast(attack,
                                  Skill,
                                  Self,
                                  Target,
                                  AddtArg1,
                                  #action_effect{}).

%% 67117 / 67118: buff_target is applied by the engine; no extra action.
script_700047(_, _, _, _) -> ok.

script_700048(_, _, _, _) -> ok.
'''


def main():
    apply = '--apply' in sys.argv
    combat, combat_crlf = b15.read_norm(os.path.join(SRC, 'skill_combat_data.erl'))
    cskill, cskill_crlf = b15.read_norm(os.path.join(SRC, 'combat_script_skill.erl'))

    combat_new = combat
    for sid, new_id in IDS.items():
        fields = {'script_id': new_id}
        if sid in (67074, 67113, 67114):
            fields['script_args'] = ('[80, 200]' if sid == 67074 else
                                     '[120, 200]' if sid == 67113 else '[300, 0]')
        else:
            fields['script_args'] = '[]'
        if sid == 67114:
            fields['cooldown'] = 3
        if sid == 67117:
            fields['buff_target'] = '[[{90502, 1000, 3, 1, [500]}]]'
        combat_new = b19.edit_block(combat_new, sid, fields)

    cskill_new = b.sub1(cskill, '         script_700043/4,\n',
                        '         script_700043/4,\n' + EXPORTS, 'exports')
    anchor = ('        700043 ->\n'
              '            Skill#c_skill{action =\n'
              '                              {combat_script_skill, script_700043}};\n')
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
