#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""Batch 21: independent scripts for the 6 special approximation skills.

- 67075: 3-target magic, 50% main-target heal-cut, 70% one-hit immunity.
- 67085: 4-target physical, 20% crit lifesteal.
- 67119: team +20% damage 3 rounds, CD2 (buff shell).
- 67330: 2x4 physical, main-target 50% crit lifesteal.
- 67334: 2x4 magic, 10% spell lifesteal buff.
- 67341: entry/summon 100% HP shield 1 round + 10% lethal immunity.
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
b.BUILD = os.path.join(ROOT, 'tmp', 'build_batch21')
um = b.um
b15 = b19.b15

IDS = {67075: 700049, 67085: 700050, 67119: 700051,
       67330: 700052, 67334: 700053, 67341: 700054}

EXPORTS = ''.join('         script_%d/4,\n' % sid for sid in sorted(IDS.values()))

DISPATCH = ''.join('''        %d ->
            Skill#c_skill{action =
                              {combat_script_skill, script_%d}};
''' % (sid, sid) for sid in (700049, 700050, 700051, 700052, 700053))

DISPATCH += '''        700054 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_700054},
                          passive_type = [100, 12, 116]};
'''

SCRIPTS = '''

%% 2025 special skills: independent scripts.
maybe_buff(Target, Buff, Rate) ->
    case util:rand(1, 1000) =< Rate of
        true ->
            lists:foreach(fun (B) ->
                                  combat_buff:buff_add(B, Target, Target)
                          end,
                          combat_script_buff:convert_buff([Buff])),
            ok;
        false -> ok
    end.

%% 67075: attack + 50% main-target heal-cut + 70% one-hit immunity.
script_700049(Skill = #c_skill{target_no = 1},
              Self = #fighter{}, Target = #fighter{}, AddtArg) ->
    plain_attack(Skill, Self, Target, AddtArg),
    maybe_buff(Target, {70000, 1000, 2, 1, [500]}, 500),
    maybe_buff(Self, {90513, 1000, 2, 1, [1000, 0, 1, 1]}, 700);
script_700049(Skill, Self, Target, AddtArg) ->
    plain_attack(Skill, Self, Target, AddtArg).

%% 67085: 20% crit lifesteal on all targets.
script_700050(Skill, Self, Target, AddtArg) ->
    combat_script_skill_calc:attack(Skill,
                                    Self,
                                    Target,
                                    AddtArg,
                                    #action_effect{crit_suck_hp = 200}).

%% 67119: buff_target is applied by the engine.
script_700051(_, _, _, _) -> ok.

%% 67330: main-target 50% crit lifesteal.
script_700052(Skill = #c_skill{action_no = 1, target_no = 1},
              Self, Target, AddtArg) ->
    combat_script_skill_calc:attack(Skill,
                                    Self,
                                    Target,
                                    AddtArg,
                                    #action_effect{crit_suck_hp = 500});
script_700052(Skill, Self, Target, AddtArg) ->
    plain_attack(Skill, Self, Target, AddtArg).

%% 67334: attack; buff_self 90304 provides 10% spell lifesteal.
script_700053(Skill, Self, Target, AddtArg) ->
    plain_attack(Skill, Self, Target, AddtArg).

%% 67341: entry shield + 10% lethal immunity.
script_700054(#c_skill{}, #fighter{}, _Target,
              #c_skill_addt_arg{passive_flag = init}) ->
    #passive_effect{buff_self_to_self =
                        combat_script_buff:convert_buff([{70055,
                                                          1000,
                                                          1,
                                                          0,
                                                          [1000, 0]}])};
script_700054(#c_skill{}, Self = #fighter{}, _Target,
              #c_skill_addt_arg{}) ->
    lists:foreach(fun (Buff) ->
                          combat_buff:buff_add(Buff, Self, Self)
                  end,
                  combat_script_buff:convert_buff([{70055,
                                                    1000,
                                                    1,
                                                    0,
                                                    [1000, 0]}])),
    true;
script_700054(#c_skill{}, _Self,
              #fighter{hp = Hp, hp_max = _HpMax}, DmgTotal)
    when is_integer(DmgTotal) ->
    case DmgTotal >= Hp andalso util:rand(1, 1000) =< 100 of
        true -> {ok, 0};
        false -> {ok, 1000}
    end;
script_700054(_, _, _, _) -> {ok, 1000}.
'''

BUFF_BASE = '''get_buff(90513) ->
    #c_buff_base{id = 90513, eff_type = buff, type = 90513,
                 max_layer = 1, script_id = 113001};
'''


def main():
    apply = '--apply' in sys.argv
    combat, combat_crlf = b15.read_norm(os.path.join(SRC, 'skill_combat_data.erl'))
    script, script_crlf = b15.read_norm(os.path.join(SRC, 'skill_script_data.erl'))
    cskill, cskill_crlf = b15.read_norm(os.path.join(SRC, 'combat_script_skill.erl'))

    combat_new = combat
    for sid, new_id in IDS.items():
        fields = {'script_id': new_id, 'script_args': '[]'}
        if sid == 67075:
            fields.update({'buff_self': '[]', 'buff_target': '[]'})
        if sid == 67119:
            fields['buff_target'] = '[[{90350, 1000, 3, 1, [200]}]]'
        if sid == 67334:
            fields['buff_self'] = '[{90304, 1000, 1, 0, [100]}]'
        if sid == 67341:
            fields.update({'buff_self': '[]', 'cooldown': 0})
        combat_new = b19.edit_block(combat_new, sid, fields)

    script_new = b.sub1(
        script,
        'get_buff(90512) ->\n'
        '    #c_buff_base{id = 90512, eff_type = debuff, type = 90512,\n'
        '                 max_layer = 1, script_id = 256003};\n',
        'get_buff(90512) ->\n'
        '    #c_buff_base{id = 90512, eff_type = debuff, type = 90512,\n'
        '                 max_layer = 1, script_id = 256003};\n' + BUFF_BASE,
        'buff base 90513')

    cskill_new = b.sub1(cskill, '         script_700048/4,\n',
                        '         script_700048/4,\n' + EXPORTS, 'exports')
    anchor = ('        700048 ->\n'
              '            Skill#c_skill{action =\n'
              '                              {combat_script_skill, script_700048}};\n')
    cskill_new = b.sub1(cskill_new, anchor, anchor + DISPATCH, 'dispatch')
    cskill_new = cskill_new.rstrip() + SCRIPTS

    print('scripts:', len(IDS))
    if not apply:
        print('dry-run; rerun with --apply')
        return

    b.verify_data('skill_combat_data', combat, combat_new)
    beams = {
        'skill_script_data': b.compile_beam('skill_script_data', script_new),
        'combat_script_skill': b.compile_beam('combat_script_skill', cskill_new),
        'skill_combat_data': os.path.join(b.BUILD, 'skill_combat_data_new',
                                          'skill_combat_data.beam'),
    }
    texts = {'skill_script_data': script_new,
             'combat_script_skill': cskill_new,
             'skill_combat_data': combat_new}
    styles = {'skill_script_data': script_crlf,
              'combat_script_skill': cskill_crlf,
              'skill_combat_data': combat_crlf}
    for name, src in beams.items():
        shutil.copy2(src, os.path.join(EBIN, name + '.beam'))
        b15.write_keep(os.path.join(SRC, name + '.erl'), texts[name], styles[name])

    nodes = um.running_nodes()
    mods = ['skill_script_data', 'combat_script_skill', 'skill_combat_data']
    if nodes:
        expr = ('Ns=%s,Ms=%s,R=[{N,[rpc:call(N,code,soft_purge,[M]) || M <- Ms],'
                '[rpc:call(N,code,load_file,[M]) || M <- Ms]} || N <- Ns],'
                'io:format("~p~n",[R]),init:stop().' % (str(nodes), str(mods)))
        print(um.erl_eval(expr)[:2000])


if __name__ == '__main__':
    main()
