#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""Batch 15: finish the remaining attribute-only support skills.

- 60450 组字秘: attack chance grants 40% damage share for 2 rounds.
- 67068 修罗觉醒: 50% at round end cleanse own debuffs.
- 67077 战神护佑: on kill heal 10% max HP.
- 67083 神牛意志 / 67207 麒麟庇护: attack removes one buff from the first target.
- 67097 神枭觉醒: first hit taken each round grants +20% physical damage.
- 67133 神兔庇佑: same first-hit buff + 30% chance 30% damage reduction 3 rounds.
- 67367 死神神体: ignore 30% defenses vs characters; per dead ally +10% damage/+20% magic def.
- 67353/67363: random 5-8 hits via addt script 1003.
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
    'b13', os.path.join(ROOT, 'local_server', 'refine_batch13.py'))
b = importlib.util.module_from_spec(spec)
spec.loader.exec_module(b)
b.BUILD = os.path.join(ROOT, 'tmp', 'build_batch15')
um = b.um

NEW_CLAUSES = '''get_combat({60450, 1}) ->
        #skill{id = 60450, lev = 1, name = lang:get("组字秘"),
           type = 1, sub_type = 2, acc_ratio = 1000,
           acc_low = 1000, acc_high = 1000, attack_type = 1,
           elem_type = 0, target_type = 1, attack_times = 1,
           target_list = [{1, 2, 1}], dmg_ratio = [1000],
           buff_self = [],
           script_id = 700024,
           script_args =
               [300, 400, 2]};
get_combat({67068, 1}) ->
        #skill{id = 67068, lev = 1, name = lang:get("修罗觉醒"),
           type = 1, sub_type = 2, acc_ratio = 1000,
           acc_low = 1000, acc_high = 1000, attack_type = 1,
           elem_type = 0, target_type = 1, attack_times = 1,
           target_list = [{1, 2, 1}], dmg_ratio = [1000],
           buff_self = [],
           script_id = 700025,
           script_args = []};
get_combat({67077, 1}) ->
        #skill{id = 67077, lev = 1, name = lang:get("战神护佑"),
           type = 1, sub_type = 2, acc_ratio = 1000,
           acc_low = 1000, acc_high = 1000, attack_type = 1,
           elem_type = 0, target_type = 1, attack_times = 1,
           target_list = [{1, 2, 1}], dmg_ratio = [1000],
           buff_self = [],
           script_id = 700026,
           script_args = []};
get_combat({67083, 1}) ->
        #skill{id = 67083, lev = 1, name = lang:get("神牛意志"),
           type = 1, sub_type = 2, acc_ratio = 1000,
           acc_low = 1000, acc_high = 1000, attack_type = 1,
           elem_type = 0, target_type = 1, attack_times = 1,
           target_list = [{1, 2, 1}], dmg_ratio = [1000],
           buff_self = [],
           script_id = 700027,
           script_args =
               [1000]};
get_combat({67207, 1}) ->
        #skill{id = 67207, lev = 1, name = lang:get("麒麟庇护"),
           type = 1, sub_type = 2, acc_ratio = 1000,
           acc_low = 1000, acc_high = 1000, attack_type = 1,
           elem_type = 0, target_type = 1, attack_times = 1,
           target_list = [{1, 2, 1}], dmg_ratio = [1000],
           buff_self = [],
           script_id = 700027,
           script_args =
               [300]};
get_combat({67097, 1}) ->
        #skill{id = 67097, lev = 1, name = lang:get("神枭觉醒"),
           type = 1, sub_type = 2, acc_ratio = 1000,
           acc_low = 1000, acc_high = 1000, attack_type = 1,
           elem_type = 0, target_type = 1, attack_times = 1,
           target_list = [{1, 2, 1}], dmg_ratio = [1000],
           buff_self = [],
           script_id = 700028,
           script_args = []};
get_combat({67133, 1}) ->
        #skill{id = 67133, lev = 1, name = lang:get("神兔庇佑"),
           type = 1, sub_type = 2, acc_ratio = 1000,
           acc_low = 1000, acc_high = 1000, attack_type = 1,
           elem_type = 0, target_type = 1, attack_times = 1,
           target_list = [{1, 2, 1}], dmg_ratio = [1000],
           buff_self = [],
           script_id = 700029,
           script_args = []};

'''

BUFF_BASES = '''get_buff(90509) ->
    #c_buff_base{id = 90509, eff_type = buff, type = 90509,
                 max_layer = 1, script_id = 103020};
get_buff(90510) ->
    #c_buff_base{id = 90510, eff_type = buff, type = 90510,
                 max_layer = 1, script_id = 106020};
'''

EXPORTS = '''         script_700023/4,
         script_700024/4,
         script_700025/4,
         script_700026/4,
         script_700027/4,
         script_700028/4,
         script_700029/4,
         script_700030/4,
'''

DISPATCH = '''        700024 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_700024},
                          passive_type = [1]};
        700025 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_700025},
                          passive_type = [102]};
        700026 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_700026},
                          passive_type = [9]};
        700027 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_700027},
                          passive_type = [1]};
        700028 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_700028},
                          passive_type = [2]};
        700029 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_700029},
                          passive_type = [2]};
        700030 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_700030},
                          passive_type = [1, 102]};
'''

SCRIPTS = '''

%% 2025 pet skill 60450: attack chance grants a 40% damage-share buff.
script_700024(#c_skill{id = SkillId, target_no = 1,
                       skill = #skill{script_args = [Rate, ShareRatio, Dur]}},
              Self = #fighter{id = Sid, buffs = Buffs}, _Target,
              #c_skill_addt_arg{passive_flag = attack}) ->
    case lists:keyfind(90506, #c_buff.id, Buffs) of
        #c_buff{} -> #passive_effect{};
        _ ->
            case util:rand(1, 1000) =< Rate of
                true ->
                    lists:foreach(fun (Buff) ->
                                          combat_buff:buff_add(Buff, Self, Self)
                                  end,
                                  combat_script_buff:convert_buff([{90506,
                                                                    1000,
                                                                    Dur,
                                                                    1,
                                                                    [ShareRatio]}])),
                    #passive_effect{show_passive_skills = [{Sid, SkillId, 1}]};
                false -> #passive_effect{}
            end
    end;
script_700024(_, _, _, _) -> #passive_effect{}.

%% 2025 pet skill 67068: 50% at round end cleanse own abnormal states.
script_700025(#c_skill{id = SkillId},
              #fighter{id = Sid, buffs = Buffs}, _Target,
              #c_skill_addt_arg{passive_flag = round}) ->
    case util:rand(1, 1000) =< 500 of
        true ->
            Clear = [Buff
                     || Buff = #c_buff{can_dispel = 1, eff_type = debuff}
                            <- Buffs],
            lists:foreach(fun (Buff) ->
                                  combat_buff:buff_del(Sid, Sid, Buff)
                          end,
                          Clear),
            #passive_effect{show_passive_skills = [{Sid, SkillId, 1}]};
        false -> #passive_effect{}
    end;
script_700025(_, _, _, _) -> #passive_effect{}.

%% 2025 pet skill 67077: on kill heal 10% max HP.
script_700026(#c_skill{id = SkillId},
              #fighter{id = Sid, hp_max = HpMax}, _Target,
              #c_skill_addt_arg{passive_flag = kill}) ->
    Heal = round(HpMax * 100 / 1000),
    #passive_effect{self_val_changed = [{hp, 1, Heal}],
                    self_changed = [{0, Heal, 0}],
                    show_passive_skills = [{Sid, SkillId, 1}]};
script_700026(_, _, _, _) -> #passive_effect{}.

%% 2025 pet skill 67083/67207: attack removes one buff from the first target.
script_700027(#c_skill{id = SkillId, target_no = 1,
                       skill = #skill{script_args = [Rate]}},
              #fighter{id = Sid}, #fighter{id = Tid, buffs = TBuffs},
              #c_skill_addt_arg{passive_flag = attack}) ->
    case util:rand(1, 1000) =< Rate of
        true ->
            case [Buff
                  || Buff = #c_buff{can_dispel = 1, eff_type = buff}
                         <- TBuffs]
                of
                [Buff | _] ->
                    combat_buff:buff_del(Tid, Sid, Buff),
                    #passive_effect{show_passive_skills = [{Sid, SkillId, 1}]};
                [] -> #passive_effect{}
            end;
        false -> #passive_effect{}
    end;
script_700027(_, _, _, _) -> #passive_effect{}.

%% 2025 pet skill 67097: first hit each round grants +20% physical damage.
script_700028(#c_skill{id = SkillId},
              Self = #fighter{id = Sid, buffs = Buffs}, _Target,
              #c_skill_addt_arg{passive_flag = defence}) ->
    case lists:keyfind(90509, #c_buff.id, Buffs) of
        #c_buff{} -> #passive_effect{};
        _ ->
            lists:foreach(fun (Buff) ->
                                  combat_buff:buff_add(Buff, Self, Self)
                          end,
                          combat_script_buff:convert_buff([{90509,
                                                            1000,
                                                            1,
                                                            0,
                                                            [200]}])),
            #passive_effect{show_passive_skills = [{Sid, SkillId, 1}]}
    end;
script_700028(_, _, _, _) -> #passive_effect{}.

%% 2025 pet skill 67133: first-hit buff + chance 30% damage reduction.
script_700029(#c_skill{id = SkillId},
              Self = #fighter{id = Sid, buffs = Buffs}, _Target,
              #c_skill_addt_arg{passive_flag = defence}) ->
    {FirstBuffs, HasFirst} =
        case lists:keyfind(90509, #c_buff.id, Buffs) of
            #c_buff{} -> {[], true};
            _ ->
                {combat_script_buff:convert_buff([{90509, 1000, 1, 0, [200]}]),
                 false}
        end,
    lists:foreach(fun (Buff) ->
                          combat_buff:buff_add(Buff, Self, Self)
                  end,
                  FirstBuffs),
    ShieldBuffs =
        case lists:keyfind(69514, #c_buff.id, Buffs) of
            #c_buff{} -> [];
            _ ->
                case util:rand(1, 1000) =< 300 of
                    true ->
                        combat_script_buff:convert_buff([{69514,
                                                          1000,
                                                          3,
                                                          0,
                                                          [300]}]);
                    false -> []
                end
        end,
    lists:foreach(fun (Buff) ->
                          combat_buff:buff_add(Buff, Self, Self)
                  end,
                  ShieldBuffs),
    case HasFirst andalso ShieldBuffs =:= [] of
        true -> #passive_effect{};
        false ->
            #passive_effect{show_passive_skills = [{Sid, SkillId, 1}]}
    end;
script_700029(_, _, _, _) -> #passive_effect{}.

%% 2025 pet skill 67367: ignore defenses vs characters; dead allies buff self.
script_700030(#c_skill{id = SkillId},
              #fighter{id = Sid, group = Group},
              Target = #fighter{type = TType},
              #c_skill_addt_arg{passive_flag = attack}) ->
    Dead = length([1
                   || #fighter{is_die = 1} <- combat_cache:all(Group)]),
    Add = Dead * 100,
    case TType =:= 1 orelse Add > 0 of
        true ->
            case TType =:= 1 of
                true ->
                    #passive_effect{dmg_ratio_add = Add,
                                    dec_phy_def_ratio = 300,
                                    dec_magic_def_ratio = 300,
                                    show_passive_skills = [{Sid, SkillId, 1}]};
                false ->
                    #passive_effect{dmg_ratio_add = Add,
                                    show_passive_skills = [{Sid, SkillId, 1}]}
            end;
        false -> #passive_effect{}
    end;
script_700030(#c_skill{id = SkillId},
              Self = #fighter{id = Sid, group = Group, buffs = Buffs},
              _Target,
              #c_skill_addt_arg{passive_flag = round}) ->
    Dead = length([1
                   || #fighter{is_die = 1} <- combat_cache:all(Group)]),
    lists:foreach(fun (Buff) ->
                          combat_buff:buff_del(Sid, Sid, Buff)
                  end,
                  [Buff || Buff = #c_buff{id = 90510} <- Buffs]),
    case Dead > 0 of
        true ->
            lists:foreach(fun (Buff) ->
                                  combat_buff:buff_add(Buff, Self, Self)
                          end,
                          combat_script_buff:convert_buff([{90510,
                                                            1000,
                                                            1,
                                                            0,
                                                            [Dead * 200]}])),
            #passive_effect{show_passive_skills = [{Sid, SkillId, 1}]};
        false -> #passive_effect{}
    end;
script_700030(_, _, _, _) -> #passive_effect{}.
'''

RANDOM_HITS = '[{1, 1003, [1000, 2, 1, [{0, 40}, {1, 30}, {2, 20}, {3, 10}]]}]'


def read_norm(path):
    raw = open(path, 'rb').read()
    crlf = (chr(13) + chr(10)).encode() in raw
    text = raw.decode('utf-8').replace(chr(13) + chr(10), chr(10))
    return text, crlf


def write_keep(path, text, crlf):
    if crlf:
        text = text.replace(chr(10), chr(13) + chr(10))
    with open(path, 'w', encoding='utf-8', newline='') as f:
        f.write(text)


def main():
    apply = '--apply' in sys.argv
    combat, combat_crlf = read_norm(os.path.join(SRC, 'skill_combat_data.erl'))
    script, script_crlf = read_norm(os.path.join(SRC, 'skill_script_data.erl'))
    cskill, cskill_crlf = read_norm(os.path.join(SRC, 'combat_script_skill.erl'))
    styles = {'skill_combat_data': combat_crlf,
              'skill_script_data': script_crlf,
              'combat_script_skill': cskill_crlf}

    combat_new = b.sub1(combat, 'get_combat({60282, 1}) ->',
                        NEW_CLAUSES + 'get_combat({60282, 1}) ->',
                        'insert support clauses')
    combat_new = b.replace_block_field(combat_new, 67367, 'script_id', 700030)
    combat_new = b.replace_block_field(combat_new, 67367, 'script_args', '[]')

    old_67353 = ('           script_id = 60047, script_args = [0]};\n'
                 '\n'
                 'get_combat({67358, 1}) ->')
    new_67353 = ('           addt_scripts = ' + RANDOM_HITS + ',\n'
                 '           script_id = 60047, script_args = [0]};\n'
                 '\n'
                 'get_combat({67358, 1}) ->')
    combat_new = b.sub1(combat_new, old_67353, new_67353, '67353 random hits')

    pat_67363 = re.compile(r'(get_combat\(\{67363, 1\}\) ->\n.*?)(?=\nget_combat\(|\Z)', re.S)
    m_67363 = pat_67363.search(combat_new)
    if not m_67363:
        raise SystemExit('missing combat block 67363')
    old_67363 = '           addt_scripts = [{1, 1016, [1002]}]};\n'
    new_67363 = ('           addt_scripts = [{1, 1016, [1002]}, '
                 + RANDOM_HITS[1:-1] + ']};\n')
    block_67363 = m_67363.group(1)
    if block_67363.count(old_67363) != 1:
        raise SystemExit('67363 addt_scripts anchor not unique')
    block_67363 = block_67363.replace(old_67363, new_67363, 1)
    combat_new = (combat_new[:m_67363.start()] + block_67363
                  + combat_new[m_67363.end():])

    script_new = b.sub1(
        script,
        'get_buff(90508) ->\n'
        '    #c_buff_base{id = 90508, eff_type = buff, type = 90508,\n'
        '                 max_layer = 1, script_id = 111020};\n',
        'get_buff(90508) ->\n'
        '    #c_buff_base{id = 90508, eff_type = buff, type = 90508,\n'
        '                 max_layer = 1, script_id = 111020};\n' + BUFF_BASES,
        'insert buff bases')

    cskill_new = b.sub1(cskill, '         script_700023/4,\n', EXPORTS, 'exports')
    cskill_new = b.sub1(
        cskill_new,
        '        700024 ->\n',
        DISPATCH + '        700024 ->\n',
        'dispatch') if False else cskill_new
    # insert dispatch after the 700023 clause (there is no 700024 yet)
    anchor = ('        700023 ->\n'
              '            Skill#c_skill{action =\n'
              '                              {combat_script_skill, script_700023}};\n')
    cskill_new = b.sub1(cskill_new, anchor, anchor + DISPATCH, 'dispatch')
    cskill_new = cskill_new.rstrip() + SCRIPTS

    print('new clauses:', NEW_CLAUSES.count('get_combat('))
    print('buff bases:', BUFF_BASES.count('get_buff('))
    print('scripts:', SCRIPTS.count('script_7000'))
    if not apply:
        print('dry-run; rerun with --apply')
        return

    b.verify_data('skill_combat_data', combat, combat_new)
    beams = {'skill_script_data': b.compile_beam('skill_script_data', script_new),
             'combat_script_skill': b.compile_beam('combat_script_skill', cskill_new)}
    beams['skill_combat_data'] = os.path.join(
        b.BUILD, 'skill_combat_data_new', 'skill_combat_data.beam')
    for name, src in beams.items():
        shutil.copy2(src, os.path.join(EBIN, name + '.beam'))
        write_keep(os.path.join(SRC, name + '.erl'),
                   {'skill_combat_data': combat_new,
                    'skill_script_data': script_new,
                    'combat_script_skill': cskill_new}[name],
                   styles[name])

    nodes = um.running_nodes()
    mods = ['skill_combat_data', 'skill_script_data', 'combat_script_skill']
    if nodes:
        expr = ('Ns=%s,Ms=%s,R=[{N,[rpc:call(N,code,soft_purge,[M]) || M <- Ms],'
                '[rpc:call(N,code,load_file,[M]) || M <- Ms]} || N <- Ns],'
                'io:format("~p~n",[R]),init:stop().' % (str(nodes), str(mods)))
        print(um.erl_eval(expr)[:2000])


if __name__ == '__main__':
    main()
