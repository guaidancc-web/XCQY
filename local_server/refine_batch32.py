#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""Batch 32: 67081 神威, 67082 牛威控制免疫, 67132 野蛮暴击叠层."""
import importlib.util
import os
import re
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
b.BUILD = os.path.join(ROOT, 'tmp', 'build_batch32')
um = b.um
b15 = b19.b15


def replace_func(src, func, new_code):
    start = src.index('script_%d(' % func)
    pos = start
    nxt = len(src)
    while True:
        cand = src.find('\nscript_', pos + 1)
        if cand < 0:
            nxt = len(src)
            break
        m = re.match(r'\nscript_(\d+)\(', src[cand:])
        if m and int(m.group(1)) != func:
            nxt = cand
            break
        pos = cand
    return src[:start] + new_code.strip() + src[nxt:]


NEW_700096 = '''script_700096(#c_skill{id = SkillId, target_no = 1},
              Self = #fighter{id = Sid, action = Action, buffs = Buffs},
              _Target,
              #c_skill_addt_arg{passive_flag = attack}) ->
    case Action of
        {#c_skill{skill = #skill{elem_type = 1}}, _} ->
            case lists:keyfind(90522, #c_buff.id, Buffs) of
                #c_buff{} -> #passive_effect{};
                _ ->
                    case util:rand(1, 1000) =< 700 of
                        true ->
                            lists:foreach(fun (Buff) ->
                                                  combat_buff:buff_add(Buff,
                                                                       Self,
                                                                       Self)
                                          end,
                                          combat_script_buff:convert_buff([{90522,
                                                                            1000,
                                                                            2,
                                                                            0,
                                                                            []}])),
                            #passive_effect{show_passive_skills =
                                                [{Sid, SkillId, 1}]};
                        false -> #passive_effect{}
                    end
            end;
        _ -> #passive_effect{}
    end;
script_700096(Skill, Self, Target, AddtArg) ->
    script_60002(Skill, Self, Target, AddtArg).
'''

NEW_700103 = '''script_700103(Skill = #c_skill{id = SkillId,
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
              Self = #fighter{id = Sid}, #fighter{id = Tid},
              #c_skill_addt_arg{passive_flag = attack}) ->
    lists:foreach(fun (Buff) ->
                          combat_buff:buff_add(Buff, Self, Self)
                  end,
                  combat_script_buff:convert_buff([{90523,
                                                    1000,
                                                    999,
                                                    0,
                                                    []}])),
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
script_700103(#c_skill{id = _SkillId},
              #fighter{id = Sid, buffs = Buffs}, _Target,
              #c_skill_addt_arg{passive_flag = undefined}) ->
    case
        combat_cache:get_context_elem([#combat_context.skill_crit])
        of
        [true] ->
            lists:foreach(fun (Buff) ->
                                  combat_buff:buff_del(Sid, Sid, Buff)
                          end,
                          [Buff
                           || Buff = #c_buff{id = 90523} <- Buffs]),
            #passive_effect{};
        _ -> #passive_effect{}
    end;
script_700103(_, _, _, _) -> #passive_effect{}.
'''

BUFF_SCRIPTS = '''get_script(256010 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = buff,
            recalc =
                fun (#c_buff{}, _Caster, _Target) ->
                        [{d_magic_dmg_ratio, 1, 1000}];
                    (#c_buff{id = BuffId, args = Args}, _Caster,
                     _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     6200),
                        []
                end,
            compare = fun (_, _, _) -> -1 end};
get_script(256011 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = buff,
            recalc =
                fun (#c_buff{layer = Layer}, _Caster, _Target) ->
                        [{crit, 1, 100 * Layer}];
                    (#c_buff{id = BuffId, args = Args}, _Caster,
                     _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     6210),
                        []
                end,
            compare = fun (_, _, _) -> -1 end};

'''

BUFF_BASES = '''get_buff(90522) ->
    #c_buff_base{id = 90522, eff_type = buff, type = 90522,
                 max_layer = 1, script_id = 256010};
get_buff(90523) ->
    #c_buff_base{id = 90523, eff_type = buff, type = 90523,
                 max_layer = 99, script_id = 256011};
'''


def main():
    apply = '--apply' in sys.argv
    script, script_crlf = b15.read_norm(os.path.join(SRC, 'skill_script_data.erl'))
    cskill, cskill_crlf = b15.read_norm(os.path.join(SRC, 'combat_script_skill.erl'))
    cbuff, cbuff_crlf = b15.read_norm(os.path.join(SRC, 'combat_script_buff.erl'))
    core, core_crlf = b15.read_norm(os.path.join(SRC, 'combat_buff.erl'))

    script_new = b.sub1(
        script,
        'get_buff(90521) ->\n'
        '    #c_buff_base{id = 90521, eff_type = debuff, type = 90521,\n'
        '                 max_layer = 1, script_id = 209010};\n',
        'get_buff(90521) ->\n'
        '    #c_buff_base{id = 90521, eff_type = debuff, type = 90521,\n'
        '                 max_layer = 1, script_id = 209010};\n' + BUFF_BASES,
        'buff bases')

    cskill_new = replace_func(cskill, 700096, NEW_700096)
    cskill_new = replace_func(cskill_new, 700103, NEW_700103)

    # 67082: first event flag (damage or control).
    cskill_new = b.sub1(cskill_new,
                        '    put({first_dmg_67082, Sid}, false),',
                        '    put({first_event_67082, Sid}, true),',
                        '67082 round flag')
    cskill_new = b.sub1(
        cskill_new,
        '''    case get({first_dmg_67082, Tid}) =/= true of
        true ->
            put({first_dmg_67082, Tid}, true),
            {ok, 0};''',
        '''    case get({first_event_67082, Tid}) =:= true of
        true ->
            put({first_event_67082, Tid}, false),
            {ok, 0};''',
        '67082 hurt flag')

    core_new = b.sub1(
        core,
        '''    IsHit = case Hit of
                undefined ->
                    combat_script_buff:default_hit(Buff, Caster, Target);
                _ -> Hit(Buff, Caster, Target)
            end,''',
        '''    IsHit = case SecBuffType =:= control andalso
                     get({first_event_67082, Tid}) =:= true
                of
                true ->
                    put({first_event_67082, Tid}, false),
                    false;
                false ->
                    case Hit of
                        undefined ->
                            combat_script_buff:default_hit(Buff,
                                                           Caster,
                                                           Target);
                        _ -> Hit(Buff, Caster, Target)
                    end
            end,''',
        'control immunity hook')
    cbuff_new = b.sub1(cbuff, 'get_script(_) -> false.\n',
                       BUFF_SCRIPTS + 'get_script(_) -> false.\n',
                       'buff scripts')

    cskill_new = b.sub1(
        cskill_new,
        '''        700096 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_700096},
                          act_flag = more_attack, passive_type = [3]};''',
        '''        700096 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_700096},
                          act_flag = more_attack, passive_type = [1, 3]};''',
        '700096 types')
    cskill_new = b.sub1(
        cskill_new,
        '''        700103 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_700103},
                          passive_type = [5, 1]};''',
        '''        700103 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_700103},
                          passive_type = [5, 1, 3]};''',
        '700103 types')

    print('scripts: 700096/700103/700102 + combat_buff hook')
    print('buffs: 90522/90523')
    if not apply:
        print('dry-run; rerun with --apply')
        return

    beams = {
        'skill_script_data': b.compile_beam('skill_script_data', script_new),
        'combat_script_skill': b.compile_beam('combat_script_skill', cskill_new),
        'combat_script_buff': b.compile_beam('combat_script_buff', cbuff_new),
        'combat_buff': b.compile_beam('combat_buff', core_new),
    }
    texts = {'skill_script_data': script_new,
             'combat_script_skill': cskill_new,
             'combat_script_buff': cbuff_new,
             'combat_buff': core_new}
    styles = {'skill_script_data': script_crlf,
              'combat_script_skill': cskill_crlf,
              'combat_script_buff': cbuff_crlf,
              'combat_buff': core_crlf}
    for name, src in beams.items():
        shutil.copy2(src, os.path.join(EBIN, name + '.beam'))
        b15.write_keep(os.path.join(SRC, name + '.erl'), texts[name], styles[name])

    nodes = um.running_nodes()
    mods = ['skill_script_data', 'combat_script_skill', 'combat_script_buff',
            'combat_buff']
    if nodes:
        expr = ('Ns=%s,Ms=%s,R=[{N,[rpc:call(N,code,soft_purge,[M]) || M <- Ms],'
                '[rpc:call(N,code,load_file,[M]) || M <- Ms]} || N <- Ns],'
                'io:format("~p~n",[R]),init:stop().' % (str(nodes), str(mods)))
        print(um.erl_eval(expr)[:2500])


if __name__ == '__main__':
    main()
