#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""Batch 18: move the 67347 hurt_before hook to all dmg/6 call sites.

The previous batch put the hook inside the main dmg/6 clause, which misses the
fixed/direct-damage clauses. This patch reverts that and wraps normal, anti and
assist attacks instead, so every damage path sees the threshold check.
"""
import importlib.util
import os
import shutil
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
SRC = os.path.join(ROOT, 'YCserver', 'erl_src')
EBIN = os.path.join(ROOT, 'YCserver', 'data', 'server', 'ebin')

spec = importlib.util.spec_from_file_location(
    'b17', os.path.join(ROOT, 'local_server', 'refine_batch17.py'))
b17 = importlib.util.module_from_spec(spec)
spec.loader.exec_module(b17)
b = b17.b
b.BUILD = os.path.join(ROOT, 'tmp', 'build_batch18')
um = b.um
b15 = b17.b15

REVERT = '''    {GetDmgHp2, GetHolyHp2} =
        combat_script_skill:hurt_before(CSkill,
                                        Self,
                                        Target,
                                        GetDmgHp1,
                                        GetHolyHp1),
    {GetDmgHp2,
     GetHolyHp2,
     GetCrit,
     GetDefence,
     PassiveBuffHolyAddt};'''

ORIGINAL = '''    {GetDmgHp1,
     GetHolyHp1,
     GetCrit,
     GetDefence,
     PassiveBuffHolyAddt};'''

NORMAL_OLD = '''            {DmgHpBeforeAbsorb,
             DmgHolyHpBeforeAbsorb,
             IsCrit,
             IsDefence,
             BuffDmg} =
                dmg(attack, Skill, Self, Target, ActionEffect, Pe),'''

NORMAL_NEW = '''            {DmgHpRaw,
             DmgHolyRaw,
             IsCrit,
             IsDefence,
             BuffDmg} =
                dmg(attack, Skill, Self, Target, ActionEffect, Pe),
            {DmgHpBeforeAbsorb, DmgHolyHpBeforeAbsorb} =
                combat_script_skill:hurt_before(Skill,
                                                Self,
                                                Target,
                                                DmgHpRaw,
                                                DmgHolyRaw),'''

ANTI_OLD = '''                                    {DmgHp,
                                     DmgHolyHp,
                                     IsCrit,
                                     _IsDefence,
                                     _BuffDmg} =
                                        dmg(anti_attack,
                                            CSkill,
                                            Target,
                                            Self,
                                            #action_effect{crit_ratio =
                                                               CritRatio},
                                            AntiAtkPe),'''

ANTI_NEW = '''                                    {DmgHpRaw,
                                     DmgHolyRaw,
                                     IsCrit,
                                     _IsDefence,
                                     _BuffDmg} =
                                        dmg(anti_attack,
                                            CSkill,
                                            Target,
                                            Self,
                                            #action_effect{crit_ratio =
                                                               CritRatio},
                                            AntiAtkPe),
                                    {DmgHp, DmgHolyHp} =
                                        combat_script_skill:hurt_before(CSkill,
                                                                        Target,
                                                                        Self,
                                                                        DmgHpRaw,
                                                                        DmgHolyRaw),'''

ASSIST_OLD = '''                    {DmgHp, DmgHolyHp, IsCrit, _IsDefence, _BuffDmg} =
                        dmg(anti_attack,
                            CSkill,
                            SelfPet,
                            Target,
                            #action_effect{crit_ratio = CritRatio},
                            #passive_effect{}),'''

ASSIST_NEW = '''                    {DmgHpRaw, DmgHolyRaw, IsCrit, _IsDefence, _BuffDmg} =
                        dmg(anti_attack,
                            CSkill,
                            SelfPet,
                            Target,
                            #action_effect{crit_ratio = CritRatio},
                            #passive_effect{}),
                    {DmgHp, DmgHolyHp} =
                        combat_script_skill:hurt_before(CSkill,
                                                        SelfPet,
                                                        Target,
                                                        DmgHpRaw,
                                                        DmgHolyRaw),'''


def main():
    apply = '--apply' in sys.argv
    calc, crlf = b15.read_norm(os.path.join(SRC, 'combat_script_skill_calc.erl'))

    new = b.sub1(calc, REVERT, ORIGINAL, 'revert dmg hook')
    new = b.sub1(new, NORMAL_OLD, NORMAL_NEW, 'normal attack hook')
    new = b.sub1(new, ANTI_OLD, ANTI_NEW, 'anti attack hook')
    new = b.sub1(new, ASSIST_OLD, ASSIST_NEW, 'assist attack hook')

    print('hurt_before calls:', new.count('combat_script_skill:hurt_before'))
    if not apply:
        print('dry-run; rerun with --apply')
        return

    beam = b.compile_beam('combat_script_skill_calc', new)
    shutil.copy2(beam, os.path.join(EBIN, 'combat_script_skill_calc.beam'))
    b15.write_keep(os.path.join(SRC, 'combat_script_skill_calc.erl'), new, crlf)

    nodes = um.running_nodes()
    if nodes:
        expr = ('Ns=%s,R=[{N,rpc:call(N,code,soft_purge,[combat_script_skill_calc]),'
                'rpc:call(N,code,load_file,[combat_script_skill_calc])} || N <- Ns],'
                'io:format("~p~n",[R]),init:stop().' % str(nodes))
        print(um.erl_eval(expr)[:1500])


if __name__ == '__main__':
    main()
