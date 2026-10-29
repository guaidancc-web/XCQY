#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""Batch 19: independent scripts for the 9 inferred active skills.

- 60590 conditional 200%/150% magic damage.
- 60603 random 1-2 hits; fixes the old passive 60047 misuse.
- 67130 / 67309 / 67316 / 67338 plain independent attacks.
- 67343 / 67358 dispel all dispellable buffs; 67358 also 20% sheep.
- 67348 main-target crit lifesteal 30%.
- 67353 plain independent attack (fixes the old passive 60047 misuse).
"""
import importlib.util
import os
import re
import shutil
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
SRC = os.path.join(ROOT, 'YCserver', 'erl_src')
EBIN = os.path.join(ROOT, 'YCserver', 'data', 'server', 'ebin')

spec = importlib.util.spec_from_file_location(
    'b18', os.path.join(ROOT, 'local_server', 'refine_batch18.py'))
b18 = importlib.util.module_from_spec(spec)
spec.loader.exec_module(b18)
b = b18.b
b.BUILD = os.path.join(ROOT, 'tmp', 'build_batch19')
um = b.um
b15 = b18.b15

SCRIPT_IDS = {
    60590: 700034,
    60603: 700035,
    67130: 700036,
    67309: 700037,
    67316: 700038,
    67338: 700039,
    67343: 700040,
    67348: 700041,
    67358: 700042,
    67353: 700043,
}

EXPORTS = ''.join('         script_%d/4,\n' % sid
                  for sid in sorted(SCRIPT_IDS.values()))

DISPATCH = ''.join('''        %d ->
            Skill#c_skill{action =
                              {combat_script_skill, script_%d}};
''' % (sid, sid) for sid in sorted(SCRIPT_IDS.values()))

SCRIPTS = '''

%% 2025 active skills: independent attack shells.
plain_attack(Skill, Self, Target, AddtArg) ->
    combat_script_skill_calc:attack(Skill,
                                    Self,
                                    Target,
                                    AddtArg,
                                    #action_effect{}).

dispel_buffs(Sid, Tid) ->
    case combat_cache:f(by_id, Tid) of
        #fighter{is_die = 0, buffs = Buffs} ->
            Clear = [Buff
                     || Buff = #c_buff{can_dispel = 1, eff_type = buff}
                            <- Buffs],
            lists:foreach(fun (Buff) ->
                                  combat_buff:buff_del(Tid, Sid, Buff)
                          end,
                          Clear),
            ok;
        _ -> ok
    end.

%% 60590: <50% HP -> 200% magic damage, otherwise 150%.
script_700034(Skill = #c_skill{skill = S = #skill{}},
              Self,
              Target = #fighter{hp = Hp, hp_max = HpMax},
              AddtArg) ->
    Ratio = case Hp * 1000 < HpMax * 500 of
                true -> 2000;
                false -> 1500
            end,
    combat_script_skill_calc:attack(Skill#c_skill{skill =
                                                      S#skill{dmg_ratio =
                                                                  [Ratio]}},
                                    Self,
                                    Target,
                                    AddtArg,
                                    #action_effect{}).

script_700035(Skill, Self, Target, AddtArg) ->
    plain_attack(Skill, Self, Target, AddtArg).

script_700036(Skill, Self, Target, AddtArg) ->
    plain_attack(Skill, Self, Target, AddtArg).

script_700037(Skill, Self, Target, AddtArg) ->
    plain_attack(Skill, Self, Target, AddtArg).

script_700038(Skill, Self, Target, AddtArg) ->
    plain_attack(Skill, Self, Target, AddtArg).

script_700039(Skill, Self, Target, AddtArg) ->
    plain_attack(Skill, Self, Target, AddtArg).

%% 67343: magic attack + dispel all buffs on every hit target.
script_700040(Skill, Self = #fighter{id = Sid},
              Target = #fighter{id = Tid}, AddtArg) ->
    plain_attack(Skill, Self, Target, AddtArg),
    dispel_buffs(Sid, Tid).

%% 67348: main target crit lifesteal 30%.
script_700041(Skill = #c_skill{action_no = 1, target_no = 1},
              Self, Target, AddtArg) ->
    combat_script_skill_calc:attack(Skill,
                                    Self,
                                    Target,
                                    AddtArg,
                                    #action_effect{crit_suck_hp = 300});
script_700041(Skill, Self, Target, AddtArg) ->
    plain_attack(Skill, Self, Target, AddtArg).

%% 67358: magic attack + dispel all buffs.
script_700042(Skill, Self = #fighter{id = Sid},
              Target = #fighter{id = Tid}, AddtArg) ->
    plain_attack(Skill, Self, Target, AddtArg),
    dispel_buffs(Sid, Tid).

%% 67353: plain attack shell; 5-8 hits handled by addt script 1003.
script_700043(Skill, Self, Target, AddtArg) ->
    plain_attack(Skill, Self, Target, AddtArg).
'''

BUFF_SCRIPT = '''get_script(256003 = ScriptId) ->
    #c_buff{script_id = ScriptId, eff_type = debuff,
            recalc =
                fun (#c_buff{}, _Caster, _Target) ->
                        [{is_silent, 0, 1}, {d_hurt_ratio, 1, 200}];
                    (#c_buff{id = BuffId, args = Args}, _Caster,
                     _Target) ->
                        logger:error("错误的buff:~w, 参数:~w",
                                     [BuffId, Args],
                                     combat_script_buff,
                                     6130),
                        []
                end,
            compare = fun (_, _, _) -> -1 end};

'''

BUFF_BASE = '''get_buff(90512) ->
    #c_buff_base{id = 90512, eff_type = debuff, type = 90512,
                 max_layer = 1, script_id = 256003};
'''


def edit_block(src, sid, fields):
    pat = re.compile(r'(get_combat\(\{%d, 1\}\) ->\n.*?)(?=\nget_combat\(|\Z)' % sid, re.S)
    m = pat.search(src)
    if not m:
        raise SystemExit('missing block %d' % sid)
    block = m.group(1)
    for key, value in fields.items():
        if key in ('target_list', 'dmg_ratio', 'script_args',
                   'addt_scripts', 'buff_target'):
            block = um.replace_list_field(block, key, value)
        else:
            block = um.set_scalar(block, key, value)
    return src[:m.start()] + block + src[m.end():]


def main():
    apply = '--apply' in sys.argv
    combat, combat_crlf = b15.read_norm(os.path.join(SRC, 'skill_combat_data.erl'))
    script, script_crlf = b15.read_norm(os.path.join(SRC, 'skill_script_data.erl'))
    cskill, cskill_crlf = b15.read_norm(os.path.join(SRC, 'combat_script_skill.erl'))
    cbuff, cbuff_crlf = b15.read_norm(os.path.join(SRC, 'combat_script_buff.erl'))

    combat_new = combat
    for sid, new_id in SCRIPT_IDS.items():
        fields = {'script_id': new_id, 'script_args': '[]'}
        if sid == 60603:
            fields.update({'attack_times': 1,
                           'target_list': '[{1, 2, 1}]',
                           'dmg_ratio': '[700, 700]',
                           'addt_scripts':
                               '[{1, 1003, [1000, 2, 1, [{0, 500}, {1, 500}]]}]'})
        if sid == 67358:
            fields['buff_target'] = ('[[{90512, 200, 3, 1, []}],\n'
                                     '                [{90512, 200, 3, 1, []}],\n'
                                     '                [{90512, 200, 3, 1, []}]]')
        combat_new = edit_block(combat_new, sid, fields)

    script_new = b.sub1(
        script,
        'get_buff(90511) ->\n'
        '    #c_buff_base{id = 90511, eff_type = buff, type = 90511,\n'
        '                 max_layer = 1, script_id = 256002};\n',
        'get_buff(90511) ->\n'
        '    #c_buff_base{id = 90511, eff_type = buff, type = 90511,\n'
        '                 max_layer = 1, script_id = 256002};\n' + BUFF_BASE,
        'buff base 90512')

    cskill_new = b.sub1(cskill, '         script_700033/4,\n',
                        '         script_700033/4,\n' + EXPORTS, 'exports')
    anchor = ('        700033 ->\n'
              '            Skill#c_skill{action =\n'
              '                              {combat_script_skill, script_700033},\n'
              '                          passive_type = [116]};\n')
    cskill_new = b.sub1(cskill_new, anchor, anchor + DISPATCH, 'dispatch')
    cskill_new = cskill_new.rstrip() + SCRIPTS

    cbuff_new = b.sub1(cbuff, 'get_script(_) -> false.\n',
                       BUFF_SCRIPT + 'get_script(_) -> false.\n',
                       'buff script 256003')

    print('scripts:', len(SCRIPT_IDS))
    print('buff base:', 'get_buff(90512)' in script_new)
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
