#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""Batch 26: independent shield skills.

- Entry/summon shields: 67091/67093/67302/67336/67346/67356/67366/67371.
- 67307: initial 70% damage reduction shield 2 rounds, cooldown 5.
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
b.BUILD = os.path.join(ROOT, 'tmp', 'build_batch26')
um = b.um
b15 = b19.b15

IDS = {67091: 700083, 67093: 700084, 67302: 700085, 67307: 700086,
       67336: 700087, 67346: 700088, 67356: 700089, 67366: 700090,
       67371: 700091}

EXPORTS = ''.join('         script_%d/4,\n' % sid for sid in sorted(IDS.values()))

DISPATCH = ''.join('''        %d ->
            Skill#c_skill{action =
                              {combat_script_skill, script_%d},
                          passive_type = [100, 12]};
''' % (sid, sid) for sid in (700083, 700084, 700085, 700087,
                            700088, 700089, 700090, 700091))

DISPATCH += '''        700086 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_700086},
                          passive_type = [100, 102]};
'''

SCRIPTS = '''

%% Entry/summon shield helper.
entry_shield(Buffs, _Skill, Self, _Target, Arg) ->
    case Arg of
        #c_skill_addt_arg{passive_flag = init} ->
            #passive_effect{buff_self_to_self =
                                combat_script_buff:convert_buff(Buffs)};
        #c_skill_addt_arg{passive_flag = undefined} ->
            lists:foreach(fun (Buff) ->
                                  combat_buff:buff_add(Buff, Self, Self)
                          end,
                          combat_script_buff:convert_buff(Buffs)),
            true;
        _ -> #passive_effect{}
    end.

buffs_700083() -> [{70055, 1000, 2, 0, [2000, 0]}].

buffs_700084() ->
    [{70055, 1000, 2, 0, [2000, 0]},
     {70065, 1000, 2, 0, [999, 200]}].

buffs_700085() -> [{70055, 1000, 2, 0, [2000, 0]}].

buffs_700087() -> [{70055, 1000, 1, 0, [1000, 0]}].

buffs_700088() ->
    [{70055, 1000, 1, 0, [2000, 0]},
     {90350, 1000, 2, 0, [200]},
     {90503, 1000, 2, 0, [200]}].

buffs_700089() ->
    [{70055, 1000, 1, 0, [2000, 0]},
     {90350, 1000, 3, 0, [300]},
     {90503, 1000, 3, 0, [400]}].

buffs_700090() ->
    [{30002, 1000, 1, 0, [6, 0]},
     {90350, 1000, 3, 0, [300]},
     {90503, 1000, 3, 0, [400]}].

buffs_700091() ->
    [{30002, 1000, 1, 0, [6, 0]},
     {90350, 1000, 3, 0, [300]},
     {90503, 1000, 3, 0, [300]}].

script_700083(Skill, Self, Target, AddtArg) ->
    entry_shield(buffs_700083(), Skill, Self, Target, AddtArg).

script_700084(Skill, Self, Target, AddtArg) ->
    entry_shield(buffs_700084(), Skill, Self, Target, AddtArg).

script_700085(Skill, Self, Target, AddtArg) ->
    entry_shield(buffs_700085(), Skill, Self, Target, AddtArg).

script_700087(Skill, Self, Target, AddtArg) ->
    entry_shield(buffs_700087(), Skill, Self, Target, AddtArg).

script_700088(Skill, Self, Target, AddtArg) ->
    entry_shield(buffs_700088(), Skill, Self, Target, AddtArg).

script_700089(Skill, Self, Target, AddtArg) ->
    entry_shield(buffs_700089(), Skill, Self, Target, AddtArg).

script_700090(Skill, Self, Target, AddtArg) ->
    entry_shield(buffs_700090(), Skill, Self, Target, AddtArg).

script_700091(Skill, Self, Target, AddtArg) ->
    entry_shield(buffs_700091(), Skill, Self, Target, AddtArg).

%% 67307: initial 70% reduction shield 2 rounds, cooldown 5.
script_700086(Skill = #c_skill{},
              #fighter{id = Sid}, _Target,
              #c_skill_addt_arg{passive_flag = init}) ->
    combat_skill:add_skill_cooldown(Sid, Skill),
    #passive_effect{buff_self_to_self =
                        combat_script_buff:convert_buff([{69514,
                                                          1000,
                                                          2,
                                                          0,
                                                          [700]}])};
script_700086(Skill = #c_skill{id = SkillId},
              #fighter{id = Sid}, _Target,
              #c_skill_addt_arg{passive_flag = round}) ->
    case combat_skill:is_skill_in_cooldown(Sid, Skill) of
        true -> #passive_effect{};
        false ->
            combat_skill:add_skill_cooldown(Sid, Skill),
            Self = combat_cache:f(by_id, Sid),
            lists:foreach(fun (Buff) ->
                                  combat_buff:buff_add(Buff, Self, Self)
                          end,
                          combat_script_buff:convert_buff([{69514,
                                                            1000,
                                                            2,
                                                            0,
                                                            [700]}])),
            #passive_effect{show_passive_skills = [{Sid, SkillId, 1}]}
    end;
script_700086(_, _, _, _) -> #passive_effect{}.
'''


def main():
    apply = '--apply' in sys.argv
    combat, combat_crlf = b15.read_norm(os.path.join(SRC, 'skill_combat_data.erl'))
    cskill, cskill_crlf = b15.read_norm(os.path.join(SRC, 'combat_script_skill.erl'))

    combat_new = combat
    for sid, new_id in IDS.items():
        fields = {'script_id': new_id, 'script_args': '[]', 'buff_self': '[]'}
        if sid == 67307:
            fields['cooldown'] = 4
        combat_new = b19.edit_block(combat_new, sid, fields)

    cskill_new = b.sub1(cskill, '         script_700082/4,\n',
                        '         script_700082/4,\n' + EXPORTS, 'exports')
    anchor = ('        700082 ->\n'
              '            Skill#c_skill{action =\n'
              '                              {combat_script_skill, script_700082},\n'
              '                          passive_type = [1]};\n')
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
