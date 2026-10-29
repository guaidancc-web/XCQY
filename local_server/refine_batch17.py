#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""Batch 17: exact 67347 pre-damage threshold hook.

Adds combat_script_skill:hurt_before/5, called from dmg/6 after the final
damage is known but before shields/HP loss. The 67347 passive sees the damage,
checks >50% max HP and an 80% roll, then scales damage to 40% and grants +20%
damage for 2 rounds with a 3-round cooldown.
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

spec = importlib.util.spec_from_file_location(
    'b16', os.path.join(ROOT, 'local_server', 'refine_batch16.py'))
b16 = importlib.util.module_from_spec(spec)
spec.loader.exec_module(b16)
b = b16.b
b.BUILD = os.path.join(ROOT, 'tmp', 'build_batch17')
um = b.um
b15 = b16.b15

NEW_CLAUSE = '''get_combat({67347, 1}) ->
        #skill{id = 67347, lev = 1, name = lang:get("初音圣体"),
           type = 1, sub_type = 2, acc_ratio = 1000,
           acc_low = 1000, acc_high = 1000, attack_type = 1,
           elem_type = 0, target_type = 1, attack_times = 1,
           target_list = [{1, 2, 1}], dmg_ratio = [1000],
           cooldown = 2,
           buff_self = [],
           script_id = 700033,
           script_args = []};

'''

DISPATCH = '''        700033 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_700033},
                          passive_type = [116]};
'''

SCRIPT = '''

%% 67347: threshold damage cut, called from combat_script_skill_calc:dmg/6.
hurt_before(Skill, Self, Target = #fighter{id = Tid}, DmgHp, DmgHoly) ->
    case combat_cache:f(by_id, Tid) of
        #fighter{passive_skills = Passives} ->
            Skills = [S
                      || S = #c_skill{passive_type = T} <- Passives,
                         lists:member(116, T)],
            lists:foldl(fun (S, {DH, DHoly}) ->
                                case S#c_skill.action of
                                    {Mod, Fun} ->
                                        case
                                            combat_util:run({Mod, Fun},
                                                            [S,
                                                             Self,
                                                             Target,
                                                             DH + DHoly])
                                            of
                                            {ok, Ratio}
                                                when is_integer(Ratio) ->
                                                {round(DH * Ratio / 1000),
                                                 round(DHoly * Ratio / 1000)};
                                            _ -> {DH, DHoly}
                                        end;
                                    _ -> {DH, DHoly}
                                end
                        end,
                        {DmgHp, DmgHoly},
                        Skills);
        _ -> {DmgHp, DmgHoly}
    end.

script_700033(Skill = #c_skill{id = _SkillId},
              _Self,
              #fighter{id = Tid, hp = Hp, hp_max = HpMax},
              DmgTotal) ->
    case combat_skill:is_skill_in_cooldown(Tid, Skill) of
        true -> {ok, 1000};
        false ->
            case Hp > 0 andalso DmgTotal > round(HpMax * 500 / 1000) of
                true ->
                    case util:rand(1, 1000) =< 800 of
                        true ->
                            combat_skill:add_skill_cooldown(Tid, Skill),
                            Target = combat_cache:f(by_id, Tid),
                            lists:foreach(fun (Buff) ->
                                                  combat_buff:buff_add(Buff,
                                                                       Target,
                                                                       Target)
                                          end,
                                          combat_script_buff:convert_buff([{90350,
                                                                            1000,
                                                                            2,
                                                                            0,
                                                                            [200]}])),
                            {ok, 400};
                        false -> {ok, 1000}
                    end;
                false -> {ok, 1000}
            end
    end.
'''


def main():
    apply = '--apply' in sys.argv
    cskill, cskill_crlf = b15.read_norm(os.path.join(SRC, 'combat_script_skill.erl'))
    calc, calc_crlf = b15.read_norm(os.path.join(SRC, 'combat_script_skill_calc.erl'))
    combat, combat_crlf = b15.read_norm(os.path.join(SRC, 'skill_combat_data.erl'))

    cskill_new = b.sub1(
        cskill,
        '         calc_special_self_changes/2]).',
        '         calc_special_self_changes/2,\n         hurt_before/5]).',
        'hurt_before export')
    cskill_new = b.sub1(cskill_new, '         script_700032/4,\n',
                        '         script_700032/4,\n         script_700033/4,\n',
                        'script export')
    anchor = ('        700032 ->\n'
              '            Skill#c_skill{action =\n'
              '                              {combat_script_skill, script_700032}};\n')
    cskill_new = b.sub1(cskill_new, anchor, anchor + DISPATCH, 'dispatch')
    cskill_new = cskill_new.rstrip() + SCRIPT

    old_ret = ('    GetHolyHp1 = round(GetHolyHp * HurtMulti / 1000 *\n'
               '                           (1000 + PsHurtMulti + ActHurtMulti)\n'
               '                           / 1000),\n'
               '    {GetDmgHp1,\n'
               '     GetHolyHp1,\n'
               '     GetCrit,\n'
               '     GetDefence,\n'
               '     PassiveBuffHolyAddt};')
    new_ret = ('    GetHolyHp1 = round(GetHolyHp * HurtMulti / 1000 *\n'
               '                           (1000 + PsHurtMulti + ActHurtMulti)\n'
               '                           / 1000),\n'
               '    {GetDmgHp2, GetHolyHp2} =\n'
               '        combat_script_skill:hurt_before(CSkill,\n'
               '                                        Self,\n'
               '                                        Target,\n'
               '                                        GetDmgHp1,\n'
               '                                        GetHolyHp1),\n'
               '    {GetDmgHp2,\n'
               '     GetHolyHp2,\n'
               '     GetCrit,\n'
               '     GetDefence,\n'
               '     PassiveBuffHolyAddt};')
    calc_new = b.sub1(calc, old_ret, new_ret, 'dmg hook')

    combat_new = b.sub1(combat, 'get_combat({60282, 1}) ->',
                        NEW_CLAUSE + 'get_combat({60282, 1}) ->',
                        '67347 clause')

    print('hurt_before:', cskill_new.count('hurt_before('))
    print('67347 clause:', 'get_combat({67347, 1})' in combat_new)
    if not apply:
        print('dry-run; rerun with --apply')
        return

    b.verify_data('skill_combat_data', combat, combat_new)
    beams = {
        'combat_script_skill': b.compile_beam('combat_script_skill', cskill_new),
        'combat_script_skill_calc': b.compile_beam('combat_script_skill_calc', calc_new),
        'skill_combat_data': os.path.join(b.BUILD, 'skill_combat_data_new',
                                          'skill_combat_data.beam'),
    }
    texts = {'combat_script_skill': cskill_new,
             'combat_script_skill_calc': calc_new,
             'skill_combat_data': combat_new}
    styles = {'combat_script_skill': cskill_crlf,
              'combat_script_skill_calc': calc_crlf,
              'skill_combat_data': combat_crlf}
    for name, src in beams.items():
        shutil.copy2(src, os.path.join(EBIN, name + '.beam'))
        b15.write_keep(os.path.join(SRC, name + '.erl'), texts[name], styles[name])

    nodes = um.running_nodes()
    mods = ['combat_script_skill', 'combat_script_skill_calc',
            'skill_combat_data']
    if nodes:
        expr = ('Ns=%s,Ms=%s,R=[{N,[rpc:call(N,code,soft_purge,[M]) || M <- Ms],'
                '[rpc:call(N,code,load_file,[M]) || M <- Ms]} || N <- Ns],'
                'io:format("~p~n",[R]),init:stop().' % (str(nodes), str(mods)))
        print(um.erl_eval(expr)[:2500])


if __name__ == '__main__':
    main()
