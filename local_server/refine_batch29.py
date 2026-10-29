#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""Batch 29: exact egg-form skills 67308 / 67369."""
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
b.BUILD = os.path.join(ROOT, 'tmp', 'build_batch29')
um = b.um
b15 = b19.b15

IDS = {67308: 700104, 67369: 700105}

EXPORTS = ''.join('         script_%d/4,\n' % sid for sid in sorted(IDS.values()))

DISPATCH = '''        700104 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_700104},
                          passive_type = [4, 102, 116]};
        700105 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_700105},
                          passive_type = [4, 102, 116]};
'''

SCRIPTS = '''

%% 67308: egg form at 80% HP; broken egg dies; next round rebirth.
script_700104(Skill = #c_skill{id = SkillId},
              #fighter{id = Sid}, _Target,
              #c_skill_addt_arg{passive_flag = undefined}) ->
    case get({egg_pending_67308, Sid}) of
        true ->
            put({egg_pending_67308, Sid}, false),
            put({egg_67308, Sid}, true),
            combat_skill:add_skill_cooldown(Sid, Skill),
            F = combat_cache:f(by_id, Sid),
            NewHp = round(F#fighter.hp_max * 800 / 1000),
            combat_cache:u(F#fighter{hp = NewHp, is_die = 0}),
            #passive_effect{show_passive_skills = [{Sid, SkillId, 1}]};
        _ -> #passive_effect{}
    end;
script_700104(#c_skill{id = SkillId},
              #fighter{id = Sid}, _Target,
              #c_skill_addt_arg{passive_flag = round}) ->
    case get({egg_67308, Sid}) of
        true ->
            put({egg_67308, Sid}, false),
            F = combat_cache:f(by_id, Sid),
            NewHp = round(F#fighter.hp_max * 800 / 1000),
            combat_cache:u(F#fighter{hp = NewHp, is_die = 0}),
            #passive_effect{show_passive_skills = [{Sid, SkillId, 1}]};
        _ -> #passive_effect{}
    end;
script_700104(Skill = #c_skill{},
              _Self,
              #fighter{id = Tid, hp = Hp}, DmgTotal)
    when is_integer(DmgTotal) ->
    case DmgTotal >= Hp andalso
             get({egg_67308, Tid}) =/= true andalso
             combat_skill:is_skill_in_cooldown(Tid, Skill) =:= false
        of
        true ->
            put({egg_pending_67308, Tid}, true),
            {ok, 0};
        false -> {ok, 1000}
    end;
script_700104(_, _, _, _) -> #passive_effect{}.

%% 67369: egg form at 150% HP via a temporary +50% max HP buff.
script_700105(Skill = #c_skill{id = SkillId},
              Self = #fighter{id = Sid}, _Target,
              #c_skill_addt_arg{passive_flag = undefined}) ->
    case get({egg_pending_67369, Sid}) of
        true ->
            put({egg_pending_67369, Sid}, false),
            put({egg_67369, Sid}, true),
            combat_skill:add_skill_cooldown(Sid, Skill),
            lists:foreach(fun (Buff) ->
                                  combat_buff:buff_add(Buff, Self, Self)
                          end,
                          combat_script_buff:convert_buff([{90516,
                                                            1000,
                                                            1,
                                                            0,
                                                            [500]}])),
            F = combat_cache:f(by_id, Sid),
            combat_cache:u(F#fighter{hp = F#fighter.hp_max, is_die = 0}),
            #passive_effect{show_passive_skills = [{Sid, SkillId, 1}]};
        _ -> #passive_effect{}
    end;
script_700105(#c_skill{id = SkillId},
              #fighter{id = Sid}, _Target,
              #c_skill_addt_arg{passive_flag = round}) ->
    case get({egg_67369, Sid}) of
        true ->
            put({egg_67369, Sid}, false),
            F0 = combat_cache:f(by_id, Sid),
            lists:foreach(fun (Buff) ->
                                  combat_buff:buff_del(Sid, Sid, Buff)
                          end,
                          [Buff
                           || Buff = #c_buff{id = 90516}
                                  <- F0#fighter.buffs]),
            F = combat_cache:f(by_id, Sid),
            NewHp = round(F#fighter.hp_max * 800 / 1000),
            combat_cache:u(F#fighter{hp = NewHp, is_die = 0}),
            #passive_effect{show_passive_skills = [{Sid, SkillId, 1}]};
        _ -> #passive_effect{}
    end;
script_700105(Skill = #c_skill{},
              _Self,
              #fighter{id = Tid, hp = Hp}, DmgTotal)
    when is_integer(DmgTotal) ->
    case DmgTotal >= Hp andalso
             get({egg_67369, Tid}) =/= true andalso
             combat_skill:is_skill_in_cooldown(Tid, Skill) =:= false
        of
        true ->
            put({egg_pending_67369, Tid}, true),
            {ok, 0};
        false -> {ok, 1000}
    end;
script_700105(_, _, _, _) -> #passive_effect{}.
'''

BUFF_SCRIPT = '''get_script(256006 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = buff,
            recalc =
                fun (#c_buff{args = [Ratio]}, _Caster, _Target) ->
                        [{hp_max, 3, Ratio}];
                    (#c_buff{id = BuffId, args = Args}, _Caster,
                     _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     6160),
                        []
                end,
            compare = fun (_, _, _) -> -1 end};

'''

BUFF_BASE = '''get_buff(90516) ->
    #c_buff_base{id = 90516, eff_type = buff, type = 90516,
                 max_layer = 1, script_id = 256006};
'''


def main():
    apply = '--apply' in sys.argv
    combat, combat_crlf = b15.read_norm(os.path.join(SRC, 'skill_combat_data.erl'))
    script, script_crlf = b15.read_norm(os.path.join(SRC, 'skill_script_data.erl'))
    cskill, cskill_crlf = b15.read_norm(os.path.join(SRC, 'combat_script_skill.erl'))
    cbuff, cbuff_crlf = b15.read_norm(os.path.join(SRC, 'combat_script_buff.erl'))

    combat_new = combat
    for sid, new_id in IDS.items():
        combat_new = b19.edit_block(combat_new, sid,
                                    {'script_id': new_id,
                                     'script_args': '[]',
                                     'buff_self': '[]',
                                     'cooldown': 2})

    script_new = b.sub1(
        script,
        'get_buff(90515) ->\n'
        '    #c_buff_base{id = 90515, eff_type = debuff, type = 90515,\n'
        '                 max_layer = 1, script_id = 256005};\n',
        'get_buff(90515) ->\n'
        '    #c_buff_base{id = 90515, eff_type = debuff, type = 90515,\n'
        '                 max_layer = 1, script_id = 256005};\n' + BUFF_BASE,
        'buff base 90516')

    cskill_new = b.sub1(cskill, '         script_700103/4,\n',
                        '         script_700103/4,\n' + EXPORTS, 'exports')
    anchor = ('        700103 ->\n'
              '            Skill#c_skill{action =\n'
              '                              {combat_script_skill, script_700103},\n'
              '                          passive_type = [5, 1]};\n')
    cskill_new = b.sub1(cskill_new, anchor, anchor + DISPATCH, 'dispatch')
    cskill_new = cskill_new.rstrip() + SCRIPTS

    cbuff_new = b.sub1(cbuff, 'get_script(_) -> false.\n',
                       BUFF_SCRIPT + 'get_script(_) -> false.\n',
                       'buff script 256006')

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
