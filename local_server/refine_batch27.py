#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""Batch 27: round buffs / conditional damage (9 skills)."""
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
b.BUILD = os.path.join(ROOT, 'tmp', 'build_batch27')
um = b.um
b15 = b19.b15

IDS = {60291: 700092, 60304: 700093, 60311: 700094, 60326: 700095,
       67081: 700096, 67314: 700097, 67315: 700098,
       67344: 700099, 67360: 700100}

EXPORTS = ''.join('         script_%d/4,\n' % sid for sid in sorted(IDS.values()))

DISPATCH = '''        700092 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_700092},
                          passive_type = [1]};
        700093 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_700093},
                          passive_type = [5]};
        700094 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_700094},
                          passive_type = [1]};
        700095 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_700095},
                          passive_type = [1]};
        700096 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_700096},
                          act_flag = more_attack, passive_type = [3]};
        700097 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_700097},
                          passive_type = [100, 12]};
        700098 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_700098},
                          passive_type = [2]};
        700099 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_700099},
                          passive_type = [5]};
        700100 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_700100},
                          passive_type = [5, 1]};
'''

SCRIPTS = '''

%% 2025 round/conditional skills: independent wrappers.
script_700092(Skill, Self, Target, AddtArg) ->
    script_60019(Skill, Self, Target, AddtArg).

script_700093(Skill, Self, Target, AddtArg) ->
    script_31000(Skill, Self, Target, AddtArg).

script_700094(Skill, Self, Target, AddtArg) ->
    script_60023(Skill, Self, Target, AddtArg).

script_700095(Skill, Self, Target, AddtArg) ->
    script_60052(Skill, Self, Target, AddtArg).

script_700096(Skill, Self, Target, AddtArg) ->
    script_60002(Skill, Self, Target, AddtArg).

%% 67314: entry/summon stealth 2 rounds.
script_700097(#c_skill{}, #fighter{}, _Target,
              #c_skill_addt_arg{passive_flag = init}) ->
    #passive_effect{buff_self_to_self =
                        combat_script_buff:convert_buff([{90009,
                                                          1000,
                                                          2,
                                                          1,
                                                          [100]}])};
script_700097(#c_skill{}, Self = #fighter{}, _Target,
              #c_skill_addt_arg{passive_flag = undefined}) ->
    lists:foreach(fun (Buff) ->
                          combat_buff:buff_add(Buff, Self, Self)
                  end,
                  combat_script_buff:convert_buff([{90009,
                                                    1000,
                                                    2,
                                                    1,
                                                    [100]}])),
    true;
script_700097(_, _, _, _) -> #passive_effect{}.

%% 67315: 70% chance on being hit to gain 20% damage reduction 2 rounds.
script_700098(#c_skill{id = SkillId},
              Self = #fighter{id = Sid}, _Target,
              #c_skill_addt_arg{passive_flag = defence}) ->
    case util:rand(1, 1000) =< 700 of
        true ->
            lists:foreach(fun (Buff) ->
                                  combat_buff:buff_add(Buff, Self, Self)
                          end,
                          combat_script_buff:convert_buff([{69514,
                                                            1000,
                                                            2,
                                                            0,
                                                            [200]}])),
            #passive_effect{show_passive_skills = [{Sid, SkillId, 1}]};
        false -> #passive_effect{}
    end;
script_700098(_, _, _, _) -> #passive_effect{}.

%% 67344/67360: apply the 90500 stack every round.
script_700099(Skill = #c_skill{id = SkillId,
                               skill = #skill{buff_self = BuffSelf}},
              #fighter{id = Sid}, _Target,
              #c_skill_addt_arg{passive_flag = pre_action}) ->
    case combat_skill:is_skill_in_cooldown(Sid, Skill) of
        true -> #passive_effect{};
        false ->
            case BuffSelf of
                [] -> #passive_effect{};
                _ ->
                    combat_skill:add_skill_cooldown(Sid, Skill, 1),
                    #passive_effect{buff_self_to_self = BuffSelf,
                                    show_passive_skills = [{Sid, SkillId, 0}],
                                    flag = 1}
            end
    end;
script_700099(_, _, _, _) -> #passive_effect{}.

%% 67360: same stack plus one 10% double-damage roll per round.
script_700100(Skill = #c_skill{id = SkillId,
                               skill = #skill{buff_self = BuffSelf}},
              #fighter{id = Sid}, _Target,
              #c_skill_addt_arg{passive_flag = pre_action}) ->
    case combat_skill:is_skill_in_cooldown(Sid, Skill) of
        true -> #passive_effect{};
        false ->
            case BuffSelf of
                [] -> #passive_effect{};
                _ ->
                    combat_skill:add_skill_cooldown(Sid, Skill, 1),
                    #passive_effect{buff_self_to_self = BuffSelf,
                                    show_passive_skills = [{Sid, SkillId, 0}],
                                    flag = 1}
            end
    end;
script_700100(#c_skill{id = SkillId},
              #fighter{id = Sid}, _Target,
              #c_skill_addt_arg{passive_flag = attack}) ->
    [Round] = combat_cache:get_context_elem([#combat_context.round]),
    case get({dbl_67360, Sid}) of
        Round -> #passive_effect{};
        _ ->
            case util:rand(1, 1000) =< 100 of
                true ->
                    put({dbl_67360, Sid}, Round),
                    #passive_effect{dmg_ratio_add = 1000,
                                    show_passive_skills = [{Sid, SkillId, 1}]};
                false -> #passive_effect{}
            end
    end;
script_700100(_, _, _, _) -> #passive_effect{}.
'''


def main():
    apply = '--apply' in sys.argv
    combat, combat_crlf = b15.read_norm(os.path.join(SRC, 'skill_combat_data.erl'))
    cskill, cskill_crlf = b15.read_norm(os.path.join(SRC, 'combat_script_skill.erl'))

    combat_new = combat
    for sid, new_id in IDS.items():
        fields = {'script_id': new_id}
        if sid in (60291, 60311, 60326, 67081):
            pass
        elif sid == 60304:
            fields['script_args'] = '[380]'
        elif sid == 67314:
            fields.update({'script_args': '[]', 'buff_self': '[]', 'cooldown': 0})
        elif sid == 67315:
            fields.update({'script_args': '[]', 'buff_self': '[]', 'cooldown': 0})
        elif sid in (67344, 67360):
            fields.update({'script_args': '[]', 'cooldown': 0})
        combat_new = b19.edit_block(combat_new, sid, fields)

    cskill_new = b.sub1(cskill, '         script_700091/4,\n',
                        '         script_700091/4,\n' + EXPORTS, 'exports')
    anchor = ('        700091 ->\n'
              '            Skill#c_skill{action =\n'
              '                              {combat_script_skill, script_700091},\n'
              '                          passive_type = [100, 12]};\n')
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
