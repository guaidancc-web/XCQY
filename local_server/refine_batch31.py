#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""Batch 31: fill 67368/67348/67130/67309/67316 sub-mechanics."""
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
b.BUILD = os.path.join(ROOT, 'tmp', 'build_batch31')
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


NEW_700036 = '''script_700036(Skill = #c_skill{action_no = 1, target_no = 1},
              Self, Target, AddtArg) ->
    plain_attack(Skill, Self, Target, AddtArg),
    maybe_buff(Target, {90514, 1000, 3, 0, [200]}, 500);
script_700036(Skill, Self, Target, AddtArg) ->
    plain_attack(Skill, Self, Target, AddtArg).
'''

NEW_700037 = '''script_700037(Skill = #c_skill{action_no = 1, target_no = 1},
              Self, Target, AddtArg) ->
    plain_attack(Skill, Self, Target, AddtArg),
    Buff = case util:rand(1, 2) of
               1 -> {90519, 1000, 2, 0, []};
               2 -> {90520, 1000, 2, 0, []}
           end,
    maybe_buff(Self, Buff, 500);
script_700037(Skill, Self, Target, AddtArg) ->
    plain_attack(Skill, Self, Target, AddtArg).
'''

NEW_700038 = '''script_700038(Skill = #c_skill{action_no = 1, target_no = 1},
              Self, Target, AddtArg) ->
    plain_attack(Skill, Self, Target, AddtArg),
    Buff = case util:rand(1, 2) of
               1 -> {90521, 1000, 2, 0, [500]};
               2 -> {90518, 1000, 2, 0, [200]}
           end,
    maybe_buff(Target, Buff, 500);
script_700038(Skill, Self, Target, AddtArg) ->
    plain_attack(Skill, Self, Target, AddtArg).
'''

NEW_700041 = '''script_700041(Skill = #c_skill{action_no = 1, target_no = 1},
              Self = #fighter{id = Sid}, Target, AddtArg) ->
    combat_script_skill_calc:attack(Skill,
                                    Self,
                                    Target,
                                    AddtArg,
                                    #action_effect{crit_suck_hp = 300}),
    [Round] = combat_cache:get_context_elem([#combat_context.round]),
    case get({shield_67348, Sid}) of
        Round -> ok;
        _ ->
            case util:rand(1, 1000) =< 900 of
                true ->
                    put({shield_67348, Sid}, Round),
                    lists:foreach(fun (Buff) ->
                                          combat_buff:buff_add(Buff, Self, Self)
                                  end,
                                  combat_script_buff:convert_buff([{30002,
                                                                    1000,
                                                                    1,
                                                                    0,
                                                                    [1, 0]}])),
                    ok;
                false -> ok
            end
    end;
script_700041(Skill, Self, Target, AddtArg) ->
    plain_attack(Skill, Self, Target, AddtArg).
'''

BUFF_SCRIPTS = '''get_script(256007 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = debuff,
            recalc =
                fun (#c_buff{args = [Ratio]}, _Caster, _Target) ->
                        [{d_dmg_ratio, 1, -Ratio}];
                    (#c_buff{id = BuffId, args = Args}, _Caster,
                     _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     6170),
                        []
                end,
            compare = fun (#c_buff{args = [Ratio]}, _, _) -> Ratio;
                          (_, _, _) -> -1
                      end};
get_script(256008 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = buff,
            recalc =
                fun (#c_buff{}, _Caster, _Target) ->
                        [{crit, 1, 500}];
                    (#c_buff{id = BuffId, args = Args}, _Caster,
                     _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     6180),
                        []
                end,
            compare = fun (_, _, _) -> -1 end};
get_script(256009 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = buff,
            recalc =
                fun (#c_buff{}, _Caster, _Target) ->
                        [{speed, 3, 50}, {d_dmg_ratio, 1, 500}];
                    (#c_buff{id = BuffId, args = Args}, _Caster,
                     _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     6190),
                        []
                end,
            compare = fun (_, _, _) -> -1 end};

'''

BUFF_BASES = '''get_buff(90517) ->
    #c_buff_base{id = 90517, eff_type = debuff, type = 90517,
                 max_layer = 1, script_id = 256007};
get_buff(90518) ->
    #c_buff_base{id = 90518, eff_type = debuff, type = 90518,
                 max_layer = 1, script_id = 211020};
get_buff(90519) ->
    #c_buff_base{id = 90519, eff_type = buff, type = 90519,
                 max_layer = 1, script_id = 256008};
get_buff(90520) ->
    #c_buff_base{id = 90520, eff_type = buff, type = 90520,
                 max_layer = 1, script_id = 256009};
get_buff(90521) ->
    #c_buff_base{id = 90521, eff_type = debuff, type = 90521,
                 max_layer = 1, script_id = 209010};
'''


def main():
    apply = '--apply' in sys.argv
    script, script_crlf = b15.read_norm(os.path.join(SRC, 'skill_script_data.erl'))
    cskill, cskill_crlf = b15.read_norm(os.path.join(SRC, 'combat_script_skill.erl'))
    cbuff, cbuff_crlf = b15.read_norm(os.path.join(SRC, 'combat_script_buff.erl'))

    script_new = b.sub1(
        script,
        'get_buff(90516) ->\n'
        '    #c_buff_base{id = 90516, eff_type = buff, type = 90516,\n'
        '                 max_layer = 1, script_id = 256006};\n',
        'get_buff(90516) ->\n'
        '    #c_buff_base{id = 90516, eff_type = buff, type = 90516,\n'
        '                 max_layer = 1, script_id = 256006};\n' + BUFF_BASES,
        'buff bases')

    cskill_new = replace_func(cskill, 700036, NEW_700036)
    cskill_new = replace_func(cskill_new, 700037, NEW_700037)
    cskill_new = replace_func(cskill_new, 700038, NEW_700038)
    cskill_new = replace_func(cskill_new, 700041, NEW_700041)

    # 67368: add a 50% 孱弱 debuff on the first target of each action.
    old_attack = '''    combat_script_skill_calc:attack(Skill,
                                    Self,
                                    Target,
                                    AddtArg,
                                    #action_effect{}),
    case
        combat_cache:get_context_elem([#combat_context.skill_dmg])'''
    new_attack = '''    combat_script_skill_calc:attack(Skill,
                                    Self,
                                    Target,
                                    AddtArg,
                                    #action_effect{}),
    Debuff = case util:rand(1, 2) of
                 1 -> {90517, 1000, 2, 0, [300]};
                 2 -> {90518, 1000, 2, 0, [300]}
             end,
    maybe_buff(Target, Debuff, 500),
    case
        combat_cache:get_context_elem([#combat_context.skill_dmg])'''
    cskill_new = b.sub1(cskill_new, old_attack, new_attack, '67368 debuff')

    cbuff_new = b.sub1(cbuff, 'get_script(_) -> false.\n',
                       BUFF_SCRIPTS + 'get_script(_) -> false.\n',
                       'buff scripts')

    print('scripts: 700036/700037/700038/700041 + 67368')
    print('buffs: 90517-90521')
    if not apply:
        print('dry-run; rerun with --apply')
        return

    beams = {
        'skill_script_data': b.compile_beam('skill_script_data', script_new),
        'combat_script_skill': b.compile_beam('combat_script_skill', cskill_new),
        'combat_script_buff': b.compile_beam('combat_script_buff', cbuff_new),
    }
    texts = {'skill_script_data': script_new,
             'combat_script_skill': cskill_new,
             'combat_script_buff': cbuff_new}
    styles = {'skill_script_data': script_crlf,
              'combat_script_skill': cskill_crlf,
              'combat_script_buff': cbuff_crlf}
    for name, src in beams.items():
        shutil.copy2(src, os.path.join(EBIN, name + '.beam'))
        b15.write_keep(os.path.join(SRC, name + '.erl'), texts[name], styles[name])

    nodes = um.running_nodes()
    mods = ['skill_script_data', 'combat_script_skill', 'combat_script_buff']
    if nodes:
        expr = ('Ns=%s,Ms=%s,R=[{N,[rpc:call(N,code,soft_purge,[M]) || M <- Ms],'
                '[rpc:call(N,code,load_file,[M]) || M <- Ms]} || N <- Ns],'
                'io:format("~p~n",[R]),init:stop().' % (str(nodes), str(mods)))
        print(um.erl_eval(expr)[:2000])


if __name__ == '__main__':
    main()
