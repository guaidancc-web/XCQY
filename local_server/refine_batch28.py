#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""Batch 28: 60282 protect-master, 67082 Niu Wei, 67132 Savage Growth."""
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
b.BUILD = os.path.join(ROOT, 'tmp', 'build_batch28')
um = b.um
b15 = b19.b15

IDS = {60282: 700101, 67082: 700102, 67132: 700103}

EXPORTS = ''.join('         script_%d/4,\n' % sid for sid in sorted(IDS.values()))

DISPATCH = '''        700101 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_700101},
                          passive_type = [7]};
        700102 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_700102},
                          passive_type = [5, 1, 102, 116]};
        700103 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_700103},
                          passive_type = [5, 1]};
'''

SCRIPTS = '''

script_700101(Skill, Self, Target, AddtArg) ->
    script_32000(Skill, Self, Target, AddtArg).

%% 67082: +10% magic damage each round, random slow/atk-down,
%% and immunity to the first damage each round.
script_700102(Skill = #c_skill{id = SkillId,
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
script_700102(#c_skill{id = SkillId, target_no = 1},
              #fighter{id = Sid}, #fighter{id = Tid},
              #c_skill_addt_arg{passive_flag = attack}) ->
    case util:rand(1, 1000) =< 700 of
        true ->
            Buff = case util:rand(1, 2) of
                       1 -> {90514, 1000, 2, 0, []};
                       2 -> {90515, 1000, 2, 0, [350]}
                   end,
            Target = combat_cache:f(by_id, Tid),
            lists:foreach(fun (B) ->
                                  combat_buff:buff_add(B, Target, Target)
                          end,
                          combat_script_buff:convert_buff([Buff])),
            #passive_effect{show_passive_skills = [{Sid, SkillId, 1}]};
        false -> #passive_effect{}
    end;
script_700102(#c_skill{}, #fighter{id = Sid}, _Target,
              #c_skill_addt_arg{passive_flag = round}) ->
    put({first_dmg_67082, Sid}, false),
    #passive_effect{};
script_700102(#c_skill{}, _Self,
              #fighter{id = Tid}, DmgTotal)
    when is_integer(DmgTotal) ->
    case get({first_dmg_67082, Tid}) =/= true of
        true ->
            put({first_dmg_67082, Tid}, true),
            {ok, 0};
        false -> {ok, 1000}
    end;
script_700102(_, _, _, _) -> #passive_effect{}.

%% 67132: +15% physical attack each round (3 stacks), 30% atk-down.
script_700103(Skill = #c_skill{id = SkillId,
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
script_700103(#c_skill{id = SkillId, target_no = 1},
              #fighter{id = Sid}, #fighter{id = Tid},
              #c_skill_addt_arg{passive_flag = attack}) ->
    case util:rand(1, 1000) =< 300 of
        true ->
            Target = combat_cache:f(by_id, Tid),
            lists:foreach(fun (B) ->
                                  combat_buff:buff_add(B, Target, Target)
                          end,
                          combat_script_buff:convert_buff([{90515,
                                                            1000,
                                                            2,
                                                            0,
                                                            [200]}])),
            #passive_effect{show_passive_skills = [{Sid, SkillId, 1}]};
        false -> #passive_effect{}
    end;
script_700103(_, _, _, _) -> #passive_effect{}.
'''

BUFF_SCRIPTS = '''get_script(256004 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = debuff,
            recalc =
                fun (#c_buff{args = [Ratio]}, _Caster, _Target) ->
                        [{speed, 3, -Ratio}];
                    (#c_buff{id = BuffId, args = Args}, _Caster,
                     _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     6140),
                        []
                end,
            compare = fun (#c_buff{args = [Ratio]}, _, _) -> Ratio;
                          (_, _, _) -> -1
                      end};
get_script(256005 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = debuff,
            recalc =
                fun (#c_buff{args = [Ratio]}, _Caster, _Target) ->
                        [{phy_dmg, 3, -Ratio},
                         {magic_dmg, 3, -Ratio}];
                    (#c_buff{id = BuffId, args = Args}, _Caster,
                     _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     6150),
                        []
                end,
            compare = fun (#c_buff{args = [Ratio]}, _, _) -> Ratio;
                          (_, _, _) -> -1
                      end};

'''

BUFF_BASES = '''get_buff(90514) ->
    #c_buff_base{id = 90514, eff_type = debuff, type = 90514,
                 max_layer = 1, script_id = 256004};
get_buff(90515) ->
    #c_buff_base{id = 90515, eff_type = debuff, type = 90515,
                 max_layer = 1, script_id = 256005};
'''


def main():
    apply = '--apply' in sys.argv
    combat, combat_crlf = b15.read_norm(os.path.join(SRC, 'skill_combat_data.erl'))
    script, script_crlf = b15.read_norm(os.path.join(SRC, 'skill_script_data.erl'))
    cskill, cskill_crlf = b15.read_norm(os.path.join(SRC, 'combat_script_skill.erl'))
    cbuff, cbuff_crlf = b15.read_norm(os.path.join(SRC, 'combat_script_buff.erl'))

    combat_new = combat
    combat_new = b19.edit_block(combat_new, 60282,
                                {'script_id': 700101})
    combat_new = b19.edit_block(combat_new, 67082,
                                {'script_id': 700102,
                                 'script_args': '[]',
                                 'cooldown': 0})
    combat_new = b19.edit_block(combat_new, 67132,
                                {'script_id': 700103,
                                 'script_args': '[]',
                                 'cooldown': 0})

    script_new = b.sub1(
        script,
        'get_buff(90513) ->\n'
        '    #c_buff_base{id = 90513, eff_type = buff, type = 90513,\n'
        '                 max_layer = 1, script_id = 113001};\n',
        'get_buff(90513) ->\n'
        '    #c_buff_base{id = 90513, eff_type = buff, type = 90513,\n'
        '                 max_layer = 1, script_id = 113001};\n' + BUFF_BASES,
        'buff bases')

    cskill_new = b.sub1(cskill, '         script_700100/4,\n',
                        '         script_700100/4,\n' + EXPORTS, 'exports')
    anchor = ('        700100 ->\n'
              '            Skill#c_skill{action =\n'
              '                              {combat_script_skill, script_700100},\n'
              '                          passive_type = [5, 1]};\n')
    cskill_new = b.sub1(cskill_new, anchor, anchor + DISPATCH, 'dispatch')
    cskill_new = cskill_new.rstrip() + SCRIPTS

    cbuff_new = b.sub1(cbuff, 'get_script(_) -> false.\n',
                       BUFF_SCRIPTS + 'get_script(_) -> false.\n',
                       'buff scripts')

    print('scripts:', len(IDS))
    if not apply:
        print('dry-run; rerun with --apply')
        return

    b.verify_data('skill_combat_data', combat, combat_new)
    beams = {
        'skill_script_data': b.compile_beam('skill_script_data', script_new),
        'combat_script_skill': b.compile_beam('combat_script_skill', cskill_new),
        'combat_script_buff': b.compile_beam('combat_script_buff', cbuff_new),
        'skill_combat_data': os.path.join(b.BUILD, 'skill_combat_data_new',
                                          'skill_combat_data.beam'),
    }
    texts = {'skill_script_data': script_new,
             'combat_script_skill': cskill_new,
             'combat_script_buff': cbuff_new,
             'skill_combat_data': combat_new}
    styles = {'skill_script_data': script_crlf,
              'combat_script_skill': cskill_crlf,
              'combat_script_buff': cbuff_crlf,
              'skill_combat_data': combat_crlf}
    for name, src in beams.items():
        shutil.copy2(src, os.path.join(EBIN, name + '.beam'))
        b15.write_keep(os.path.join(SRC, name + '.erl'), texts[name], styles[name])

    nodes = um.running_nodes()
    mods = ['skill_script_data', 'combat_script_skill', 'combat_script_buff',
            'skill_combat_data']
    if nodes:
        expr = ('Ns=%s,Ms=%s,R=[{N,[rpc:call(N,code,soft_purge,[M]) || M <- Ms],'
                '[rpc:call(N,code,load_file,[M]) || M <- Ms]} || N <- Ns],'
                'io:format("~p~n",[R]),init:stop().' % (str(nodes), str(mods)))
        print(um.erl_eval(expr)[:2500])


if __name__ == '__main__':
    main()
