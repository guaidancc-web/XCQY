#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""Batch 16: exact percent speed support + 67378 wind-thunder stats.

- combat_cache: add flat/percent `speed` attribute updates.
- buff 90511 / script 256002: +15% phy atk, +15% speed, +15% max HP.
- 67378 active script 700032: attack, then permanent 90511 (once) and a
  chance to gain the 70055 wind-thunder shield.
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
    'b15', os.path.join(ROOT, 'local_server', 'refine_batch15.py'))
b15 = importlib.util.module_from_spec(spec)
spec.loader.exec_module(b15)
b = b15.b
b.BUILD = os.path.join(ROOT, 'tmp', 'build_batch16')
um = b.um

SPEED_CLAUSES = '''             speed when Type =:= 1 ->
                 Attr = #attr{speed = Speed} = F#fighter.attr,
                 F#fighter{attr =
                               Attr#attr{speed =
                                             util:check_min(Speed + Val, 0)}};
             speed when Type =:= 3 ->
                 Attr = #attr{speed = Speed} = F#fighter.attr,
                 F#fighter{attr =
                               Attr#attr{speed =
                                             util:check_min(round(Speed *
                                                                      (1 +
                                                                           Val /
                                                                               1000)),
                                                            0)}};
'''

BUFF_SCRIPT = '''get_script(256002 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = buff,
            recalc =
                fun (#c_buff{args = [SpeedRatio, PhyRatio, HpRatio]},
                     _Caster, #fighter{id = Tid}) ->
                        BaseSpeed =
                            case combat_cache:f_origin(by_id, Tid) of
                                #fighter{attr = #attr{speed = S}} -> S;
                                _ -> 0
                            end,
                        Delta = round(BaseSpeed * SpeedRatio / 1000),
                        [{speed, 1, Delta},
                         {phy_dmg, 3, PhyRatio},
                         {hp_max, 3, HpRatio}];
                    (#c_buff{id = BuffId, args = Args}, _Caster,
                     _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     6120),
                        []
                end,
            compare = fun (_, _, _) -> -1 end};

'''

BUFF_BASE = '''get_buff(90511) ->
    #c_buff_base{id = 90511, eff_type = buff, type = 90511,
                 max_layer = 1, script_id = 256002};
'''

EXPORT = '         script_700031/4,\n         script_700032/4,\n'

DISPATCH = '''        700032 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_700032}};
'''

SCRIPT = '''

%% 2025 pet skill 67378: attack + permanent wind-thunder stats + chance shield.
script_700032(Skill = #c_skill{target_no = 1},
              Self = #fighter{id = _Sid, buffs = Buffs}, Target, AddtArg) ->
    combat_script_skill_calc:attack(Skill,
                                    Self,
                                    Target,
                                    AddtArg,
                                    #action_effect{}),
    Buffs1 =
        case lists:keyfind(90511, #c_buff.id, Buffs) of
            #c_buff{} -> [];
            _ ->
                combat_script_buff:convert_buff([{90511,
                                                  1000,
                                                  999,
                                                  0,
                                                  [150, 150, 150]}])
        end,
    lists:foreach(fun (Buff) ->
                          combat_buff:buff_add(Buff, Self, Self)
                  end,
                  Buffs1),
    case util:rand(1, 1000) =< 300 of
        true ->
            lists:foreach(fun (Buff) ->
                                  combat_buff:buff_add(Buff, Self, Self)
                          end,
                          combat_script_buff:convert_buff([{70055,
                                                            1000,
                                                            2,
                                                            0,
                                                            [250, 0]}])) ,
            ok;
        false -> ok
    end;
script_700032(Skill, Self, Target, AddtArg) ->
    combat_script_skill_calc:attack(Skill,
                                    Self,
                                    Target,
                                    AddtArg,
                                    #action_effect{}).
'''


def main():
    apply = '--apply' in sys.argv
    cache, cache_crlf = b15.read_norm(os.path.join(SRC, 'combat_cache.erl'))
    cbuff, cbuff_crlf = b15.read_norm(os.path.join(SRC, 'combat_script_buff.erl'))
    script, script_crlf = b15.read_norm(os.path.join(SRC, 'skill_script_data.erl'))
    cskill, cskill_crlf = b15.read_norm(os.path.join(SRC, 'combat_script_skill.erl'))
    combat, combat_crlf = b15.read_norm(os.path.join(SRC, 'skill_combat_data.erl'))

    anchor_speed = ('             atk_speed when Type =:= 3 ->\n'
                    '                 Attr = #attr{atk_speed = AtkSpeed} = F#fighter.attr,\n'
                    '                 F#fighter{attr =\n'
                    '                               Attr#attr{atk_speed =\n'
                    '                                             util:check_min(round(AtkSpeed *\n'
                    '                                                                      (1 +\n'
                    '                                                                           Val /\n'
                    '                                                                               1000)),\n'
                    '                                                            0)}};\n'
                    '             phy_dmg when Type =:= 1 ->')
    cache_new = b.sub1(cache, anchor_speed,
                       anchor_speed.replace('             phy_dmg when Type =:= 1 ->',
                                            SPEED_CLAUSES + '             phy_dmg when Type =:= 1 ->'),
                       'speed clauses')

    cbuff_new = b.sub1(cbuff, 'get_script(_) -> false.\n',
                       BUFF_SCRIPT + 'get_script(_) -> false.\n',
                       'buff script 256002')

    script_new = b.sub1(
        script,
        'get_buff(90510) ->\n'
        '    #c_buff_base{id = 90510, eff_type = buff, type = 90510,\n'
        '                 max_layer = 1, script_id = 106020};\n',
        'get_buff(90510) ->\n'
        '    #c_buff_base{id = 90510, eff_type = buff, type = 90510,\n'
        '                 max_layer = 1, script_id = 106020};\n' + BUFF_BASE,
        'buff base 90511')

    cskill_new = b.sub1(cskill, '         script_700031/4,\n', EXPORT, 'export')
    anchor_dispatch = ('        700031 ->\n'
                       '            Skill#c_skill{action =\n'
                       '                              {combat_script_skill, script_700031},\n'
                       '                          passive_type = [100, 1]};\n')
    cskill_new = b.sub1(cskill_new, anchor_dispatch,
                        anchor_dispatch + DISPATCH, 'dispatch')
    cskill_new = cskill_new.rstrip() + SCRIPT

    pat_67378 = re.compile(r'(get_combat\(\{67378, 1\}\) ->\n.*?)(?=\nget_combat\(|\Z)', re.S)
    m_67378 = pat_67378.search(combat)
    if not m_67378:
        raise SystemExit('missing 67378 block')
    block_67378 = m_67378.group(1)
    old_67378 = 'script_id = 50026, script_args = [0]'
    if block_67378.count(old_67378) != 1:
        raise SystemExit('67378 script anchor not unique')
    block_67378 = block_67378.replace(old_67378,
                                      'script_id = 700032, script_args = []', 1)
    combat_new = (combat[:m_67378.start()] + block_67378
                  + combat[m_67378.end():])

    print('speed clauses:', SPEED_CLAUSES.count('speed when'))
    print('buff bases:', BUFF_BASE.count('get_buff('))
    if not apply:
        print('dry-run; rerun with --apply')
        return

    b.verify_data('skill_combat_data', combat, combat_new)
    beams = {
        'combat_cache': b.compile_beam('combat_cache', cache_new),
        'combat_script_buff': b.compile_beam('combat_script_buff', cbuff_new),
        'skill_script_data': b.compile_beam('skill_script_data', script_new),
        'combat_script_skill': b.compile_beam('combat_script_skill', cskill_new),
        'skill_combat_data': os.path.join(b.BUILD, 'skill_combat_data_new',
                                          'skill_combat_data.beam'),
    }
    texts = {'combat_cache': cache_new,
             'combat_script_buff': cbuff_new,
             'skill_script_data': script_new,
             'combat_script_skill': cskill_new,
             'skill_combat_data': combat_new}
    styles = {'combat_cache': cache_crlf,
              'combat_script_buff': cbuff_crlf,
              'skill_script_data': script_crlf,
              'combat_script_skill': cskill_crlf,
              'skill_combat_data': combat_crlf}
    for name, src in beams.items():
        shutil.copy2(src, os.path.join(EBIN, name + '.beam'))
        b15.write_keep(os.path.join(SRC, name + '.erl'), texts[name], styles[name])

    nodes = um.running_nodes()
    mods = ['combat_cache', 'combat_script_buff', 'skill_script_data',
            'combat_script_skill', 'skill_combat_data']
    if nodes:
        expr = ('Ns=%s,Ms=%s,R=[{N,[rpc:call(N,code,soft_purge,[M]) || M <- Ms],'
                '[rpc:call(N,code,load_file,[M]) || M <- Ms]} || N <- Ns],'
                'io:format("~p~n",[R]),init:stop().' % (str(nodes), str(mods)))
        print(um.erl_eval(expr)[:2500])


if __name__ == '__main__':
    main()
