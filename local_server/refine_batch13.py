#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""Batch 13: finish remaining 2025 pet skills and fix multi-hit target lists.

- 60280 超级雷霆: on summon reduce master skill cooldowns by 3.
- 67111 暗域: per same-pet ally +5% damage to 67110 (cap 20%), +10% phy dmg, +20% phy atk.
- 67331 死亡冲锋: every 2 rounds +20% atk speed / +30% phy atk for 2 rounds.
- 67335 死亡追击: after a magic skill kill, release one pursuit skill.
- 67345 天佑: first death revive 50%; 40% each round share 35% damage with a random enemy.
- 67361 搬山: first 3 rounds +40% magic damage / +30% atk speed; entry shield 200% 1 round; first death revive 60%.
- 67333 战神圣体: 60% on attack +5 anger to master.
- 67342 玄女圣体: attacks grant no anger, first target loses 5 anger.
- 67368 无忧击: heal a random ally and shield it after each attack segment.
- 67378 乾坤天降: adjacent splash target mode.

Also repairs raw buff tuples returned by earlier independent scripts (must be #c_buff records)
and expands target_list to one entry per hit for every multi-hit 2025 skill.
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
BUILD = os.path.join(ROOT, 'tmp', 'build_batch13')
ERLC = os.path.join(ROOT, 'tmp', 'erlang19', 'bin', 'erlc.exe')

spec = importlib.util.spec_from_file_location(
    'um', os.path.join(ROOT, 'local_server', 'refine_unique_mechanics.py'))
um = importlib.util.module_from_spec(spec)
spec.loader.exec_module(um)


def sub1(text, old, new, label):
    if text.count(old) != 1:
        raise SystemExit('%s: expected 1 occurrence, got %d' % (label, text.count(old)))
    return text.replace(old, new, 1)


def replace_targets(src, sid, value):
    pat = re.compile(r'(get_combat\(\{%d, 1\}\) ->\n.*?)(?=\nget_combat\(|\Z)' % sid, re.S)
    m = pat.search(src)
    if not m:
        raise SystemExit('missing combat block %d' % sid)
    block = m.group(1)
    new_block = um.replace_list_field(block, 'target_list', value)
    return src[:m.start()] + new_block + src[m.end():]


def replace_block_field(src, sid, field, value):
    pat = re.compile(r'(get_combat\(\{%d, 1\}\) ->\n.*?)(?=\nget_combat\(|\Z)' % sid, re.S)
    m = pat.search(src)
    if not m:
        raise SystemExit('missing combat block %d' % sid)
    block = m.group(1)
    if field in ('script_args', 'target_list'):
        new_block = um.replace_list_field(block, field, value)
    else:
        new_block = um.set_scalar(block, field, value)
    return src[:m.start()] + new_block + src[m.end():]


MULTI_TARGETS = {
    67309: '[{1, 2, 3}, {2, 2, 3}, {3, 2, 3}]',
    67316: '[{1, 2, 3}, {2, 2, 3}, {3, 2, 3}]',
    67330: '[{1, 2, 4}, {2, 2, 4}]',
    67334: '[{1, 2, 4}, {2, 2, 4}]',
    67338: '[{1, 2, 3}, {2, 2, 4}, {3, 2, 5}]',
    67343: '[{1, 2, 3}, {2, 2, 3}, {3, 2, 6}]',
    67348: '[{1, 2, 2}, {2, 2, 3}]',
    67353: '[{1, 2, 1}, {2, 2, 1}, {3, 2, 1}, {4, 2, 1}, {5, 2, 1}]',
    67358: '[{1, 2, 3}, {2, 2, 4}, {3, 2, 10}]',
    67363: '[{1, 2, 1}, {2, 2, 1}, {3, 2, 1}, {4, 2, 1}, {5, 2, 1}]',
    67368: '[{1, 2, 4}, {2, 2, 4}, {3, 2, 4}]',
}

NEW_CLAUSES = '''get_combat({60280, 1}) ->
        #skill{id = 60280, lev = 1, name = lang:get("超级雷霆"),
           type = 1, sub_type = 2, acc_ratio = 1000,
           acc_low = 1000, acc_high = 1000, attack_type = 1,
           elem_type = 0, target_type = 1, attack_times = 1,
           target_list = [{1, 2, 1}], dmg_ratio = [1000],
           buff_self = [],
           script_id = 700013,
           script_args =
               [3]};
get_combat({67111, 1}) ->
        #skill{id = 67111, lev = 1, name = lang:get("暗域"),
           type = 1, sub_type = 2, acc_ratio = 1000,
           acc_low = 1000, acc_high = 1000, attack_type = 1,
           elem_type = 0, target_type = 1, attack_times = 1,
           target_list = [{1, 2, 1}], dmg_ratio = [1000],
           buff_self = [],
           script_id = 700014,
           script_args =
               [50, 200, 67110, 20044]};
get_combat({67331, 1}) ->
        #skill{id = 67331, lev = 1, name = lang:get("死亡冲锋"),
           type = 1, sub_type = 2, acc_ratio = 1000,
           acc_low = 1000, acc_high = 1000, attack_type = 1,
           elem_type = 0, target_type = 1, attack_times = 1,
           target_list = [{1, 2, 1}], dmg_ratio = [1000],
           cooldown = 1,
           buff_self = [{90503, 1000, 2, 0, [200]},
                        {90504, 1000, 2, 0, [300]}],
           script_id = 700015,
           script_args = []};
get_combat({67335, 1}) ->
        #skill{id = 67335, lev = 1, name = lang:get("死亡追击"),
           type = 1, sub_type = 2, acc_ratio = 1000,
           acc_low = 1000, acc_high = 1000, attack_type = 1,
           elem_type = 0, target_type = 1, attack_times = 1,
           target_list = [{1, 2, 1}], dmg_ratio = [1000],
           buff_self = [],
           script_id = 700016,
           script_args = []};
get_combat({67345, 1}) ->
        #skill{id = 67345, lev = 1, name = lang:get("天佑"),
           type = 1, sub_type = 2, acc_ratio = 1000,
           acc_low = 1000, acc_high = 1000, attack_type = 1,
           elem_type = 0, target_type = 1, attack_times = 1,
           target_list = [{1, 2, 1}], dmg_ratio = [1000],
           buff_self = [],
           script_id = 700017,
           script_args =
               [500, 400, 350]};
get_combat({67361, 1}) ->
        #skill{id = 67361, lev = 1, name = lang:get("搬山"),
           type = 1, sub_type = 2, acc_ratio = 1000,
           acc_low = 1000, acc_high = 1000, attack_type = 1,
           elem_type = 0, target_type = 1, attack_times = 1,
           target_list = [{1, 2, 1}], dmg_ratio = [1000],
           buff_self = [],
           script_id = 700018,
           script_args = []};
get_combat({67333, 1}) ->
        #skill{id = 67333, lev = 1, name = lang:get("战神圣体"),
           type = 1, sub_type = 2, acc_ratio = 1000,
           acc_low = 1000, acc_high = 1000, attack_type = 1,
           elem_type = 0, target_type = 1, attack_times = 1,
           target_list = [{1, 2, 1}], dmg_ratio = [1000],
           buff_self = [],
           script_id = 700019,
           script_args =
               [600, 5]};
get_combat({67342, 1}) ->
        #skill{id = 67342, lev = 1, name = lang:get("玄女圣体"),
           type = 1, sub_type = 2, acc_ratio = 1000,
           acc_low = 1000, acc_high = 1000, attack_type = 1,
           elem_type = 0, target_type = 1, attack_times = 1,
           target_list = [{1, 2, 1}], dmg_ratio = [1000],
           buff_self = [],
           script_id = 700020,
           script_args =
               [5]};

'''

BUFF_BASES = '''get_buff(90503) ->
    #c_buff_base{id = 90503, eff_type = buff, type = 90503,
                 max_layer = 1, script_id = 111020};
get_buff(90504) ->
    #c_buff_base{id = 90504, eff_type = buff, type = 90504,
                 max_layer = 1, script_id = 103020};
get_buff(90505) ->
    #c_buff_base{id = 90505, eff_type = debuff, type = 90505,
                 max_layer = 1, script_id = 202020};
get_buff(90506) ->
    #c_buff_base{id = 90506, eff_type = buff, type = 90506,
                 max_layer = 1, script_id = 256001};
get_buff(90507) ->
    #c_buff_base{id = 90507, eff_type = buff, type = 90507,
                 max_layer = 1, script_id = 104020};
get_buff(90508) ->
    #c_buff_base{id = 90508, eff_type = buff, type = 90508,
                 max_layer = 1, script_id = 111020};
'''

EXPORTS = '''         script_700001/4,
         script_700002/4,
         script_700003/4,
         script_700004/4,
         script_700005/4,
         script_700006/4,
         script_700007/4,
         script_700008/4,
         script_700009/4,
         script_700010/4,
         script_700011/4,
         script_700012/4,
         script_700013/4,
         script_700014/4,
         script_700015/4,
         script_700016/4,
         script_700017/4,
         script_700018/4,
         script_700019/4,
         script_700020/4,
         script_700021/4,
         script_700022/4,
'''

DISPATCH = '''        700013 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_700013},
                          passive_type = [12]};
        700014 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_700014},
                          passive_type = [1]};
        700015 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_700015},
                          passive_type = [5]};
        700016 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_700016},
                          passive_type = [9]};
        700017 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_700017},
                          passive_type = [100, 102]};
        700018 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_700018},
                          passive_type = [100, 12]};
        700019 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_700019},
                          passive_type = [1]};
        700020 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_700020},
                          passive_type = [100, 1]};
        700021 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_700021}};
        700022 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_700022},
                          passive_type = [5, 1]};
'''

SCRIPTS = '''

%% 2025 pet skill 60280: on entering battle reduce master cooldowns.
script_700013(#c_skill{skill = #skill{script_args = [Reduce]}},
              #fighter{master_fid = MasterFid}, _Master, _AddtArg)
    when MasterFid =/= 0 ->
    combat_skill:skill_cooldown_reduce(MasterFid, Reduce),
    true;
script_700013(_, _, _, _) -> true.

%% 2025 pet skill 67111: count same-pet allies, boost the listed skill.
script_700014(#c_skill{id = SkillId,
                       skill =
                           #skill{script_args =
                                      [Per, Max, TargetSkillId, BaseId]}},
              #fighter{id = Sid, group = Group, action = Action},
              _Target,
              #c_skill_addt_arg{passive_flag = attack}) ->
    case Action of
        {#c_skill{skill = #skill{id = TargetSkillId}}, _} ->
            Count =
                length([1
                        || #fighter{base_id = BaseId, is_die = 0,
                                    is_escape = 0}
                               <- combat_cache:all(Group)]),
            case Count > 0 of
                true ->
                    #passive_effect{dmg_ratio_add = min(Max, Count * Per),
                                    show_passive_skills = [{Sid, SkillId, 1}]};
                false -> #passive_effect{}
            end;
        _ -> #passive_effect{}
    end;
script_700014(_, _, _, _) -> #passive_effect{}.

%% 2025 pet skill 67331: every 2 rounds buff self attack speed / phy attack.
script_700015(Skill = #c_skill{id = SkillId,
                               skill = #skill{buff_self = BuffSelf}},
              #fighter{id = Fid}, _Target, _AddtArg) ->
    case combat_skill:is_skill_in_cooldown(Fid, Skill) of
        false ->
            combat_skill:add_skill_cooldown(Fid, Skill),
            #passive_effect{buff_self_to_self = BuffSelf,
                            show_passive_skills = [{Fid, SkillId, 0}],
                            flag = 1};
        true -> #passive_effect{}
    end.

%% 2025 pet skill 67335: magic skill kill triggers one skill pursuit.
script_700016(#c_skill{id = SkillId},
              #fighter{id = Sid, action = Action},
              _Target,
              #c_skill_addt_arg{passive_flag = kill}) ->
    case Action of
        {Cs = #c_skill{skill = CsSkill = #skill{elem_type = 1}}, _} ->
            case
                combat_cache:get_context_elem([#combat_context.pursue_attack_list])
                of
                [[]] ->
                    case
                        combat_cache:get_context_elem([#combat_context.passive_skill_attack])
                        of
                        [[]] ->
                            AttackTimes =
                                max(1, length(CsSkill#skill.target_list)),
                            combat_cache:save_context([{#combat_context.passive_skill_attack,
                                                        [{0, AttackTimes, Cs}]}]),
                            #passive_effect{show_passive_skills =
                                                [{Sid, SkillId, 1}]};
                        _ -> #passive_effect{}
                    end;
                _ -> #passive_effect{}
            end;
        _ -> #passive_effect{}
    end;
script_700016(_, _, _, _) -> #passive_effect{}.

%% 2025 pet skill 67345: first death revive 50%; round-start damage share.
script_700017(#c_skill{skill =
                           #skill{script_args = [ReviveRatio, _, _]}},
              #fighter{id = _Sid}, _Target,
              #c_skill_addt_arg{passive_flag = init}) ->
    Buffs =
        combat_script_buff:convert_buff([{90335,
                                          1000,
                                          999,
                                          0,
                                          [0, 1000, 50100, 0, ReviveRatio]}]),
    #passive_effect{buff_self_to_self = Buffs};
script_700017(#c_skill{skill =
                           #skill{script_args = [_, ShareRate, ShareRatio]}},
              Self = #fighter{id = _Sid, is_die = 0}, _Target,
              #c_skill_addt_arg{passive_flag = round}) ->
    case util:rand(1, 1000) =< ShareRate of
        true ->
            Buffs =
                combat_script_buff:convert_buff([{90506,
                                                  1000,
                                                  2,
                                                  0,
                                                  [ShareRatio]}]),
            lists:foreach(fun (Buff) ->
                                  combat_buff:buff_add(Buff, Self, Self)
                          end,
                          Buffs),
            #passive_effect{};
        false -> #passive_effect{}
    end;
script_700017(_, _, _, _) -> #passive_effect{}.

%% 2025 pet skill 67361: entry shield + 3-round magic buff + first-death revive.
script_700018(#c_skill{}, Self = #fighter{},
              _Target, #c_skill_addt_arg{passive_flag = init}) ->
    #passive_effect{buff_self_to_self =
                        combat_script_buff:convert_buff(buffs_700018())};
script_700018(#c_skill{}, Self = #fighter{}, _Target, _AddtArg) ->
    lists:foreach(fun (Buff) ->
                          combat_buff:buff_add(Buff, Self, Self)
                  end,
                  combat_script_buff:convert_buff(buffs_700018())),
    true.

buffs_700018() ->
    [{70055, 1000, 1, 0, [2000, 0]},
     {90507, 1000, 3, 0, [400]},
     {90508, 1000, 3, 0, [300]},
     {90335, 1000, 999, 0, [0, 1000, 50100, 0, 600]}].

%% 2025 pet skill 67333: chance to add anger to the master on attack.
script_700019(#c_skill{id = SkillId,
                       target_no = 1,
                       skill = #skill{script_args = [Rate, AngerVal]}},
              Self = #fighter{id = Sid, master_fid = MasterFid},
              _Target,
              #c_skill_addt_arg{passive_flag = attack}) ->
    case util:rand(1, 1000) =< Rate of
        true ->
            case combat_cache:f(by_id, MasterFid) of
                Master = #fighter{is_die = 0, is_escape = 0} ->
                    Tvc = [{anger, 1, AngerVal}],
                    Tc = [{9, AngerVal, 0}],
                    Effect =
                        combat_play:gen_sub_skill_play(die_master_effect,
                                                       {Self,
                                                        Master,
                                                        Tc,
                                                        0,
                                                        0,
                                                        [{Sid, SkillId, 1}]}),
                    combat_play:add_sub_play(Effect),
                    combat_cache:u(MasterFid, Tvc),
                    #passive_effect{};
                _ -> #passive_effect{}
            end;
        false -> #passive_effect{}
    end;
script_700019(_, _, _, _) -> #passive_effect{}.

%% 2025 pet skill 67342: attacks add no anger; first target loses 5 anger.
script_700020(#c_skill{skill = #skill{script_args = [_DecAnger]}},
              #fighter{id = Sid}, _Target,
              #c_skill_addt_arg{passive_flag = init}) ->
    combat_cache:u(Sid, [{i_atk_not_anger, 0, 1}]),
    #passive_effect{};
script_700020(#c_skill{id = SkillId,
                       target_no = 1,
                       skill = #skill{script_args = [DecAnger]}},
              #fighter{id = Sid}, _Target,
              #c_skill_addt_arg{passive_flag = attack}) ->
    #passive_effect{target_val_changed = [{anger, 1, -DecAnger}],
                    target_changed = [{9, -DecAnger, 0}],
                    show_passive_skills = [{Sid, SkillId, 1}]};
script_700020(_, _, _, _) -> #passive_effect{}.

%% 2025 pet skill 67368: after each segment heal a random ally and shield it.
script_700021(Skill = #c_skill{target_no = 1, action_no = ActionNo},
              Self = #fighter{id = _Sid, group = Group}, Target,
              AddtArg) ->
    combat_script_skill_calc:attack(Skill,
                                    Self,
                                    Target,
                                    AddtArg,
                                    #action_effect{}),
    case
        combat_cache:get_context_elem([#combat_context.skill_dmg])
        of
        [Dmg] when is_integer(Dmg), Dmg > 0 ->
            Allies =
                [F
                 || F = #fighter{is_die = 0, is_escape = 0}
                        <- combat_cache:all(Group)],
            case Allies of
                [] -> ok;
                _ ->
                    Ally =
                        lists:nth(util:rand(1, length(Allies)), Allies),
                    EnemyCount =
                        min(4,
                            length([1
                                    || #fighter{is_die = 0,
                                                is_escape = 0}
                                           <- combat_cache:all(combat_cache:op(Group))])),
                    HealHp = round(Dmg * EnemyCount * 500 / 1000),
                    combat_script_skill_calc:heal(Skill,
                                                  Self,
                                                  Ally,
                                                  AddtArg,
                                                  #action_effect{heal_hp =
                                                                     HealHp,
                                                                 can_anti_heal
                                                                     = 1}),
                    case ActionNo =:= 1 of
                        true ->
                            lists:foreach(fun (Buff) ->
                                                  combat_buff:buff_add(Buff,
                                                                       Self,
                                                                       Ally)
                                          end,
                                          combat_script_buff:convert_buff([{70055,
                                                                            1000,
                                                                            2,
                                                                            0,
                                                                            [200,
                                                                             0]}])),
                            ok;
                        false -> ok
                    end
            end;
        _ -> ok
    end;
script_700021(Skill, Self, Target, AddtArg) ->
    combat_script_skill_calc:attack(Skill,
                                    Self,
                                    Target,
                                    AddtArg,
                                    #action_effect{}).

%% 2025 pet skill 67300: pre-action stacking + 55% damage-share on attack.
script_700022(Skill = #c_skill{id = SkillId,
                               skill = #skill{buff_self = BuffSelf}},
              #fighter{id = Sid}, _Target,
              #c_skill_addt_arg{passive_flag = pre_action}) ->
    case combat_skill:is_skill_in_cooldown(Sid, Skill) of
        true -> #passive_effect{};
        _ ->
            case BuffSelf of
                [] -> #passive_effect{};
                _ ->
                    combat_skill:add_skill_cooldown(Sid, Skill),
                    #passive_effect{buff_self_to_self = BuffSelf,
                                    show_passive_skills = [{Sid, SkillId, 0}],
                                    flag = 1}
            end
    end;
script_700022(#c_skill{id = SkillId},
              Self = #fighter{id = Sid}, _Target,
              #c_skill_addt_arg{passive_flag = attack}) ->
    case util:rand(1, 1000) =< 550 of
        true ->
            lists:foreach(fun (Buff) ->
                                  combat_buff:buff_add(Buff, Self, Self)
                          end,
                          combat_script_buff:convert_buff([{90506,
                                                            1000,
                                                            2,
                                                            0,
                                                            [350]}])),
            #passive_effect{show_passive_skills = [{Sid, SkillId, 1}]};
        false -> #passive_effect{}
    end;
script_700022(_, _, _, _) -> #passive_effect{}.
'''

BUFF_SCRIPT = '''get_script(256001 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = buff,
            eff_val_before =
                fun (#c_buff{args = [Ratio]}, _Caster,
                     Target = #fighter{}) ->
                        case rand_enemy_id(Target) of
                            false -> [];
                            {true, EnemyId} ->
                                [{protector, 0, {EnemyId, 2, Ratio}}]
                        end;
                    (#c_buff{id = BuffId, args = Args}, _Caster,
                     _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     6100),
                        []
                end,
            eff_val_after =
                fun (#c_buff{}, _Caster, #fighter{}) ->
                        [{protector, 0, del}];
                    (#c_buff{id = BuffId, args = Args}, _Caster,
                     _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     6110),
                        []
                end,
            compare = fun (_, _, _) -> -1 end};

'''

BUFF_HELPER = '''
rand_enemy_id(#fighter{group = Group}) ->
    Enemies =
        [F
         || F = #fighter{is_die = 0, is_escape = 0}
                <- combat_cache:all(combat_cache:op(Group))],
    case Enemies of
        [] -> false;
        _ ->
            Enemy = lists:nth(util:rand(1, length(Enemies)), Enemies),
            {true, Enemy#fighter.id}
    end.

'''

RAW_BUFF_FIXES = [
    ('[{90273, 1000, Duration, 1, [Ratio]}]',
     'combat_script_buff:convert_buff([{90273, 1000, Duration, 1, [Ratio]}])'),
    ('[{70055, 1000, ShieldDur, 0, [ShieldRatio, 0]}]',
     'combat_script_buff:convert_buff([{70055, 1000, ShieldDur, 0, [ShieldRatio, 0]}])'),
    ('[{90502, 1000, ReduceDur, 1, [ReduceRatio]}]',
     'combat_script_buff:convert_buff([{90502, 1000, ReduceDur, 1, [ReduceRatio]}])'),
    ('[{69514, 1000, 999, 1, [ReduceRatio]},\n                     {70065, 1000, 999, 0, [ReflectNum, ReflectRatio]}]',
     'combat_script_buff:convert_buff([{69514, 1000, 999, 1, [ReduceRatio]},\n                                             {70065, 1000, 999, 0, [ReflectNum, ReflectRatio]}])'),
    ('[{90338, 1000, Dur, 1, [1000]}]',
     'combat_script_buff:convert_buff([{90338, 1000, Dur, 1, [1000]}])'),
    ('[{69514, 1000, Duration, 1, [ReduceRatio]}]',
     'combat_script_buff:convert_buff([{69514, 1000, Duration, 1, [ReduceRatio]}])'),
    ('[{90350, 1000, Duration, 1, [DmgRatio]}]',
     'combat_script_buff:convert_buff([{90350, 1000, Duration, 1, [DmgRatio]}])'),
    ('[{69514, 1000, 1, 1, [300]}]',
     'combat_script_buff:convert_buff([{69514, 1000, 1, 1, [300]}])'),
]


def compile_beam(name, text):
    d = os.path.join(BUILD, name)
    os.makedirs(d, exist_ok=True)
    path = os.path.join(d, name + '.erl')
    um.write(path, text)
    r = subprocess.run([ERLC, '-o', d, path], capture_output=True, text=True,
                       encoding='utf-8', errors='replace')
    if r.returncode:
        print(r.stdout, r.stderr)
        raise SystemExit('compile failed %s' % name)
    return os.path.join(d, name + '.beam')


def verify_data(name, old_text, new_text):
    base_dir = os.path.join(BUILD, name + '_base')
    old_dir = os.path.join(BUILD, name + '_old')
    new_dir = os.path.join(BUILD, name + '_new')
    for d in (old_dir, new_dir):
        os.makedirs(d, exist_ok=True)
    old_path = os.path.join(old_dir, name + '.erl')
    new_path = os.path.join(new_dir, name + '.erl')
    um.write(old_path, old_text)
    um.write(new_path, new_text)
    for p in (old_path, new_path):
        r = subprocess.run([ERLC, '-o', os.path.dirname(p), p],
                           capture_output=True, text=True,
                           encoding='utf-8', errors='replace')
        if r.returncode:
            print(r.stdout, r.stderr)
            raise SystemExit('compile failed %s' % p)
    keys = os.path.join(BUILD, name + '.keys')
    key_src = os.path.join(ROOT, 'tmp', 'build', 'src', name + '.erl')
    if not os.path.exists(key_src):
        key_src = old_path
    subprocess.run([sys.executable, os.path.join(ROOT, 'tmp', 'make_keys.py'),
                    key_src, keys], check=True, stdout=subprocess.DEVNULL)
    out = um.erl_eval('verify_beam:run("%s","%s","%s")' % (
        os.path.join(EBIN, name + '.beam').replace('\\', '/'),
        os.path.join(new_dir, name + '.beam').replace('\\', '/'),
        keys.replace('\\', '/')))
    print(next((l for l in out.split('\n') if 'compared' in l), out[:500]))
    if '0 diffs' not in out:
        print(out[:3000])
        raise SystemExit('verify failed %s' % name)


def main():
    apply = '--apply' in sys.argv
    combat = um.read(os.path.join(SRC, 'skill_combat_data.erl'))
    script = um.read(os.path.join(SRC, 'skill_script_data.erl'))
    skill = um.read(os.path.join(SRC, 'skill_data.erl'))
    cskill = um.read(os.path.join(SRC, 'combat_script_skill.erl'))
    cbuff = um.read(os.path.join(SRC, 'combat_script_buff.erl'))

    combat_new = combat
    for sid, value in sorted(MULTI_TARGETS.items()):
        combat_new = replace_targets(combat_new, sid, value)
    combat_new = replace_block_field(combat_new, 67378, 'target_list', '[{1, 3, 6}]')
    combat_new = replace_targets(combat_new, 60603,
                                 '[{1, 2, 1}, {2, 2, 1}]')
    combat_new = replace_block_field(combat_new, 67368, 'script_id', 700021)
    combat_new = replace_block_field(combat_new, 67368, 'script_args', '[]')
    combat_new = replace_block_field(combat_new, 67300, 'script_id', 700022)
    combat_new = replace_block_field(combat_new, 67300, 'script_args', '[]')
    combat_new = sub1(combat_new, 'get_combat({60282, 1}) ->',
                      NEW_CLAUSES + 'get_combat({60282, 1}) ->', 'insert new clauses')

    script_new = sub1(
        script,
        'get_buff(90502) ->\n'
        '    #c_buff_base{id = 90502, eff_type = buff, type = 90502,\n'
        '                 max_layer = 1, script_id = 125003};\n',
        'get_buff(90502) ->\n'
        '    #c_buff_base{id = 90502, eff_type = buff, type = 90502,\n'
        '                 max_layer = 1, script_id = 125003};\n' + BUFF_BASES,
        'insert buff bases')

    skill_new = sub1(
        skill,
        'get_pet({67111, 1}) ->\n'
        '    #pet_base_skill{id = 67111, lev = 1,\n'
        '                    name = lang:get("暗域"), type = 1046, step = 1,\n'
        '                    max_exp = 1};',
        'get_pet({67111, 1}) ->\n'
        '    #pet_base_skill{id = 67111, lev = 1,\n'
        '                    name = lang:get("暗域"), type = 1046, step = 1,\n'
        '                    max_exp = 1, attr = [{1, 45, 100}, {1, 54, 200}]};',
        '67111 attr')

    cskill_new = cskill
    for old, new in RAW_BUFF_FIXES:
        cskill_new = sub1(cskill_new, old, new, 'raw buff ' + old[:24])
    cskill_new = sub1(
        cskill_new,
        '         script_700012/4,\n',
        EXPORTS,
        'exports')
    cskill_new = sub1(
        cskill_new,
        '        60194 ->\n',
        DISPATCH + '        60194 ->\n',
        'dispatch')
    cskill_new = cskill_new.rstrip() + SCRIPTS

    cbuff_new = sub1(
        cbuff,
        'get_script(_) -> false.\n',
        BUFF_SCRIPT + 'get_script(_) -> false.\n' + BUFF_HELPER,
        'buff script 256001')

    print('multi target blocks:', len(MULTI_TARGETS) + 2)
    print('new combat clauses:', NEW_CLAUSES.count('get_combat('))
    print('buff bases:', BUFF_BASES.count('get_buff('))
    print('raw buff fixes:', len(RAW_BUFF_FIXES))
    if not apply:
        print('dry-run; rerun with --apply')
        return

    verify_data('skill_combat_data', combat, combat_new)
    verify_data('skill_data', skill, skill_new)
    compile_beam('skill_script_data', script_new)
    compile_beam('combat_script_skill', cskill_new)
    compile_beam('combat_script_buff', cbuff_new)
    for name in ('skill_combat_data', 'skill_data', 'skill_script_data',
                 'combat_script_skill', 'combat_script_buff'):
        src = os.path.join(BUILD, name, name + '.beam')
        if not os.path.exists(src):
            src = os.path.join(BUILD, name + '_new', name + '.beam')
        shutil.copy2(src, os.path.join(EBIN, name + '.beam'))
        um.write(os.path.join(SRC, name + '.erl'),
                 {'skill_combat_data': combat_new, 'skill_data': skill_new,
                  'skill_script_data': script_new,
                  'combat_script_skill': cskill_new,
                  'combat_script_buff': cbuff_new}[name])

    nodes = um.running_nodes()
    mods = ['skill_combat_data', 'skill_data', 'skill_script_data',
            'combat_script_skill', 'combat_script_buff']
    if nodes:
        expr = ('Ns=%s,Ms=%s,R=[{N,[rpc:call(N,code,soft_purge,[M]) || M <- Ms],'
                '[rpc:call(N,code,load_file,[M]) || M <- Ms]} || N <- Ns],'
                'io:format("~p~n",[R]),init:stop().' % (str(nodes), str(mods)))
        print(um.erl_eval(expr)[:3000])


if __name__ == '__main__':
    main()
