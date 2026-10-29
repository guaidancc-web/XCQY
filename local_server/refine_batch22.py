#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""Batch 22: independent revive / god-bless / escape triggers.

- 60283/60285/60286: unique wrappers around the proven revive/escape logic.
- 67304: 100% first revive + 30% magic defense 3 rounds.
- 67115: entry 200% shield 2 rounds + 20% reflect + first-death 20% revive.
- 67337: 50% lethal immunity once per round (+30% with 60352/60353).
"""
import importlib.util
import os
import shutil
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
SRC = os.path.join(ROOT, 'YCserver', 'erl_src')
EBIN = os.path.join(ROOT, 'YCserver', 'data', 'server', 'ebin')

spec = importlib.util.spec_from_file_location(
    'b21', os.path.join(ROOT, 'local_server', 'refine_batch21.py'))
b21 = importlib.util.module_from_spec(spec)
spec.loader.exec_module(b21)
b = b21.b
b19 = b21.b19
b.BUILD = os.path.join(ROOT, 'tmp', 'build_batch22')
um = b.um
b15 = b21.b15

IDS = {60283: 700055, 60285: 700056, 60286: 700057,
       67304: 700058, 67115: 700059, 67337: 700060}

EXPORTS = ''.join('         script_%d/4,\n' % sid for sid in sorted(IDS.values()))

DISPATCH = '''        700055 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_700055},
                          passive_type = [6]};
        700056 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_700056},
                          passive_type = [100, 8]};
        700057 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_700057},
                          passive_type = [8]};
        700058 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_700058},
                          passive_type = [100, 8]};
        700059 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_700059},
                          passive_type = [100, 12, 8]};
        700060 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_700060},
                          passive_type = [100, 102, 116]};
'''

SCRIPTS = '''

%% 2025 revive category: independent wrappers.
script_700055(Skill, Self, Target, AddtArg) ->
    script_32001(Skill, Self, Target, AddtArg).

script_700056(Skill, Self, Target, AddtArg) ->
    script_60053(Skill, Self, Target, AddtArg).

script_700057(Skill, Self, Target, AddtArg) ->
    script_60118(Skill, Self, Target, AddtArg).

%% 67304: fixed 100% revive at 100% HP; buff_self 90510 is applied on revive.
script_700058(Skill = #c_skill{skill = S = #skill{}},
              Self, Target, AddtArg) ->
    NewSkill = Skill#c_skill{skill =
                                 S#skill{script_args =
                                             [1000, 1000, 1000, 1000, 1000, 0]}},
    script_60053(NewSkill, Self, Target, AddtArg).

%% 67115: entry shield/reflect + first-death 20% revive.
script_700059(#c_skill{}, #fighter{}, _Target,
              #c_skill_addt_arg{passive_flag = init}) ->
    #passive_effect{buff_self_to_self =
                        combat_script_buff:convert_buff([{70055,
                                                          1000,
                                                          2,
                                                          0,
                                                          [2000, 0]},
                                                         {70065,
                                                          1000,
                                                          2,
                                                          0,
                                                          [999, 200]}])};
script_700059(#c_skill{}, Self = #fighter{}, _Target,
              #c_skill_addt_arg{passive_flag = undefined}) ->
    lists:foreach(fun (Buff) ->
                          combat_buff:buff_add(Buff, Self, Self)
                  end,
                  combat_script_buff:convert_buff([{70055,
                                                    1000,
                                                    2,
                                                    0,
                                                    [2000, 0]},
                                                   {70065,
                                                    1000,
                                                    2,
                                                    0,
                                                    [999, 200]}])),
    true;
script_700059(Skill = #c_skill{},
              #fighter{id = Fid, hp_max = HpMax}, #fighter{},
              #c_skill_addt_arg{passive_flag = revive_self}) ->
    case combat_skill:is_skill_in_cooldown(Fid, Skill) of
        true -> #passive_effect{};
        false ->
            combat_skill:add_skill_cooldown(Fid, Skill),
            HealHp = round(HpMax * 200 / 1000),
            Ae = #action_effect{heal_hp = HealHp},
            [ReviveSelf] =
                combat_cache:get_context_elem([#combat_context.revive_self]),
            NewReviveSelf = lists:keystore(Fid,
                                           1,
                                           ReviveSelf,
                                           {Fid, Skill, Ae, []}),
            combat_cache:save_context([{#combat_context.revive_self,
                                        NewReviveSelf}]),
            #passive_effect{}
    end;
script_700059(_, _, _, _) -> #passive_effect{}.

%% 67337: 50% lethal immunity once per round; 80% with 60352/60353.
script_700060(#c_skill{}, #fighter{id = Sid}, _Target,
              #c_skill_addt_arg{passive_flag = init}) ->
    put({lethal_immune_67337, Sid}, false),
    #passive_effect{};
script_700060(#c_skill{}, #fighter{id = Sid}, _Target,
              #c_skill_addt_arg{passive_flag = round}) ->
    put({lethal_immune_67337, Sid}, false),
    #passive_effect{};
script_700060(#c_skill{}, _Self,
              Target = #fighter{id = Tid, hp = Hp}, DmgTotal)
    when is_integer(DmgTotal) ->
    case DmgTotal >= Hp andalso
             get({lethal_immune_67337, Tid}) =/= true
        of
        true ->
            HasInstant =
                lists:any(fun (#c_skill{id = Id}) ->
                                  Id =:= 60352 orelse Id =:= 60353
                          end,
                          Target#fighter.passive_skills),
            Rate = case HasInstant of
                       true -> 800;
                       false -> 500
                   end,
            case util:rand(1, 1000) =< Rate of
                true ->
                    put({lethal_immune_67337, Tid}, true),
                    {ok, 0};
                false -> {ok, 1000}
            end;
        false -> {ok, 1000}
    end;
script_700060(_, _, _, _) -> {ok, 1000}.
'''


def main():
    apply = '--apply' in sys.argv
    combat, combat_crlf = b15.read_norm(os.path.join(SRC, 'skill_combat_data.erl'))
    cskill, cskill_crlf = b15.read_norm(os.path.join(SRC, 'combat_script_skill.erl'))

    combat_new = combat
    for sid, new_id in IDS.items():
        fields = {'script_id': new_id}
        if sid in (60283, 60285, 60286):
            fields['script_args'] = {
                60283: '[400, 350, 0, 75]',
                60285: '[140, 180, 220, 280, 1000, 0]',
                60286: '[490, 0, 150]',
            }[sid]
        elif sid == 67304:
            fields.update({'script_args': '[]',
                           'buff_self': '[{90510, 1000, 3, 0, [300]}]'})
        elif sid == 67115:
            fields.update({'script_args': '[]', 'buff_self': '[]'})
        elif sid == 67337:
            fields.update({'script_args': '[]', 'buff_self': '[]'})
        combat_new = b19.edit_block(combat_new, sid, fields)

    cskill_new = b.sub1(cskill, '         script_700054/4,\n',
                        '         script_700054/4,\n' + EXPORTS, 'exports')
    anchor = ('        700054 ->\n'
              '            Skill#c_skill{action =\n'
              '                              {combat_script_skill, script_700054},\n'
              '                          passive_type = [100, 12, 116]};\n')
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
