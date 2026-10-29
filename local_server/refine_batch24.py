#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""Batch 24: independent re-cast / pursuit triggers (2b).

- 67349: skill kill pursuit, max 2.
- 67370: 30% re-cast 67368 at 70% damage.
- 67087: 50% re-cast 67085.
- 67379: when casting 67378, 40% extra plain 67378.
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
b.BUILD = os.path.join(ROOT, 'tmp', 'build_batch24')
um = b.um
b15 = b19.b15

IDS = {67349: 700067, 67370: 700068, 67087: 700069, 67379: 700070}

EXPORTS = ''.join('         script_%d/4,\n' % sid for sid in sorted(IDS.values()))

DISPATCH = '''        700067 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_700067},
                          passive_type = [9]};
        700068 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_700068},
                          passive_type = [1]};
        700069 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_700069},
                          passive_type = [1]};
        700070 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_700070},
                          passive_type = [1]};
'''

SCRIPTS = '''

%% Queue an extra skill release through passive_skill_attack.
pursuit_idle() ->
    case
        combat_cache:get_context_elem([#combat_context.pursue_attack_list])
        of
        [[]] -> true;
        _ -> false
    end.

queue_pursuit(SkillId, Sid, CS0, Target) ->
    CS = combat_script_skill_ext:exec_trigger_before(CS0,
                                                     combat_cache:f(by_id,
                                                                    Sid),
                                                     Target),
    #c_skill{skill = S} = CS,
    case
        combat_cache:get_context_elem([#combat_context.passive_skill_attack])
        of
        [[]] ->
            AttackTimes = max(1, S#skill.attack_times),
            combat_cache:save_context([{#combat_context.passive_skill_attack,
                                        [{0, AttackTimes, CS}]}]),
            #passive_effect{show_passive_skills = [{Sid, SkillId, 1}]};
        _ -> #passive_effect{}
    end.

%% 67349: skill kill pursuit, max 2 times.
script_700067(#c_skill{id = SkillId},
              #fighter{id = Sid, action = Action}, Target,
              #c_skill_addt_arg{passive_flag = kill}) ->
    case Action of
        {Cs = #c_skill{}, _} ->
            case
                combat_cache:get_context_elem([#combat_context.pursue_attack_list])
                of
                [PursueList]
                    when is_list(PursueList), length(PursueList) < 2 ->
                    queue_pursuit(SkillId, Sid, Cs, Target);
                _ -> #passive_effect{}
            end;
        _ -> #passive_effect{}
    end;
script_700067(_, _, _, _) -> #passive_effect{}.

%% 67370: 30% re-cast 67368 at 70% damage.
script_700068(#c_skill{id = SkillId, target_no = 1},
              #fighter{id = Sid}, Target, _Arg) ->
    case pursuit_idle() andalso util:rand(1, 1000) =< 300 of
        true ->
            CS0 = combat_script_skill:to_combat_skill({67368, 1}),
            #c_skill{skill = S0} = CS0,
            Ratios = [round(R * 700 / 1000) || R <- S0#skill.dmg_ratio],
            queue_pursuit(SkillId, Sid,
                          CS0#c_skill{skill = S0#skill{dmg_ratio = Ratios}},
                          Target);
        false -> #passive_effect{}
    end;
script_700068(_, _, _, _) -> #passive_effect{}.

%% 67087: 50% re-cast 67085.
script_700069(#c_skill{id = SkillId, target_no = 1},
              #fighter{id = Sid}, Target, _Arg) ->
    case pursuit_idle() andalso util:rand(1, 1000) =< 500 of
        true ->
            CS = combat_script_skill:to_combat_skill({67085, 1}),
            queue_pursuit(SkillId, Sid, CS, Target);
        false -> #passive_effect{}
    end;
script_700069(_, _, _, _) -> #passive_effect{}.

%% 67379: 40% extra plain 67378 when casting 67378.
script_700070(#c_skill{id = SkillId, target_no = 1},
              #fighter{id = Sid, action = Action}, Target, _Arg) ->
    case Action of
        {#c_skill{skill = #skill{id = 67378}}, _} ->
            case pursuit_idle() andalso util:rand(1, 1000) =< 400 of
                true ->
                    CS0 = combat_script_skill:to_combat_skill({67378, 1}),
                    #c_skill{skill = S0} = CS0,
                    Plain = CS0#c_skill{action =
                                            {combat_script_skill, script_10000},
                                        skill =
                                            S0#skill{attack_times = 1,
                                                     target_list = [{1, 3, 6}],
                                                     dmg_ratio = [1200]}},
                    queue_pursuit(SkillId, Sid, Plain, Target);
                false -> #passive_effect{}
            end;
        _ -> #passive_effect{}
    end;
script_700070(_, _, _, _) -> #passive_effect{}.
'''


def main():
    apply = '--apply' in sys.argv
    combat, combat_crlf = b15.read_norm(os.path.join(SRC, 'skill_combat_data.erl'))
    skill, skill_crlf = b15.read_norm(os.path.join(SRC, 'skill_data.erl'))
    cskill, cskill_crlf = b15.read_norm(os.path.join(SRC, 'combat_script_skill.erl'))

    combat_new = combat
    for sid, new_id in IDS.items():
        combat_new = b19.edit_block(combat_new, sid,
                                    {'script_id': new_id, 'script_args': '[]'})

    skill_new = b.sub1(
        skill,
        'get_pet({67379, 1}) ->\n'
        '    #pet_base_skill{id = 67379, lev = 1,\n'
        '                    name = lang:get("九龙神火"), type = 1117, step = 1,\n'
        '                    max_exp = 1};',
        'get_pet({67379, 1}) ->\n'
        '    #pet_base_skill{id = 67379, lev = 1,\n'
        '                    name = lang:get("九龙神火"), type = 1117, step = 1,\n'
        '                    max_exp = 1,\n'
        '                    attr = [{1, 23, 300}, {1, 53, 300}, {1, 57, 300}]};',
        '67379 attrs')

    cskill_new = b.sub1(cskill, '         script_700066/4,\n',
                        '         script_700066/4,\n' + EXPORTS, 'exports')
    anchor = ('        700066 ->\n'
              '            Skill#c_skill{action =\n'
              '                              {combat_script_skill, script_700066},\n'
              '                          passive_type = [1]};\n')
    cskill_new = b.sub1(cskill_new, anchor, anchor + DISPATCH, 'dispatch')
    cskill_new = cskill_new.rstrip() + SCRIPTS

    print('scripts:', len(IDS))
    if not apply:
        print('dry-run; rerun with --apply')
        return

    b.verify_data('skill_combat_data', combat, combat_new)
    b.verify_data('skill_data', skill, skill_new)
    beams = {
        'combat_script_skill': b.compile_beam('combat_script_skill', cskill_new),
        'skill_combat_data': os.path.join(b.BUILD, 'skill_combat_data_new',
                                          'skill_combat_data.beam'),
        'skill_data': os.path.join(b.BUILD, 'skill_data_new',
                                   'skill_data.beam'),
    }
    texts = {'combat_script_skill': cskill_new,
             'skill_combat_data': combat_new,
             'skill_data': skill_new}
    styles = {'combat_script_skill': cskill_crlf,
              'skill_combat_data': combat_crlf,
              'skill_data': skill_crlf}
    for name, src in beams.items():
        shutil.copy2(src, os.path.join(EBIN, name + '.beam'))
        b15.write_keep(os.path.join(SRC, name + '.erl'), texts[name], styles[name])

    nodes = um.running_nodes()
    mods = ['combat_script_skill', 'skill_combat_data', 'skill_data']
    if nodes:
        expr = ('Ns=%s,Ms=%s,R=[{N,[rpc:call(N,code,soft_purge,[M]) || M <- Ms],'
                '[rpc:call(N,code,load_file,[M]) || M <- Ms]} || N <- Ns],'
                'io:format("~p~n",[R]),init:stop().' % (str(nodes), str(mods)))
        print(um.erl_eval(expr)[:2000])


if __name__ == '__main__':
    main()
