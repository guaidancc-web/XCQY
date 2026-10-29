#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""Generate a human-readable effect table for the 2025 pet skills."""
import os
import re
import UnityPy
from collections import Counter
from openpyxl import Workbook
from openpyxl.styles import Font, PatternFill, Alignment, Border, Side

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
DATA = os.path.join(ROOT, 'cdn', 'patch_android', '202506251639', 'textures', 'textures_business_data.unity3d')
OUT = os.path.join(ROOT, 'docs', '技能效果表.md')

ATTR = {
    1: '生命', 3: '攻速', 4: '物攻', 5: '魔攻', 6: '物防', 7: '魔防',
    8: '暴击', 10: '命中', 11: '闪避', 12: '速度', 21: '神圣', 22: '暴伤',
    23: '伤害加成', 36: '魔法暴击', 45: '物伤加成', 46: '魔伤加成',
    51: '生命%', 53: '攻速%', 54: '物攻%', 55: '魔攻%', 56: '物防%', 57: '魔防%',
}
PCT = {8, 22, 23, 45, 46, 51, 53, 54, 55, 56, 57, 36}
SCRIPT = {
    20002: '治疗', 20049: '回蓝', 20000: '纯 buff', 60146: '被动触发',
    60001: '连击', 60002: '法术连击', 60006: '吸血', 60019: '物理攻击',
    60021: '反弹', 60022: '还击', 60023: '逆击', 60026: '护主',
    60027: '涅槃', 60028: '审判', 60029: '驱鬼', 60030: '逃生',
    60047: '物穿', 60052: '强击', 60053: '神佑', 60054: '眩晕',
    60058: '法穿', 60118: '逃生', 60173: '禁魂', 33002: '清心',
    50000: '魔法攻击', 50026: '物理攻击(暴击吸血)', 700001: '真实伤害',
    700002: '物理受击护盾',
    700003: '攻击扣蓝',
    700004: '出场盾+受击魔法盾',
    700005: '减伤/反伤/沉默',
    700006: '法术吸血+受击减伤',
    700007: '击杀回血+燃火',
    700008: '召唤回主人血',
    700009: '死亡回全队血',
    700010: '随机双倍/三倍+速度增伤',
    700011: '召唤清心+控制免疫',
    700012: '速度条件增伤/减伤',
    700013: '召唤减主人冷却',
    700014: '同宠增伤',
    700015: '周期攻速/物攻',
    700016: '击杀法术追击',
    700017: '复活+伤害分担',
    700018: '搬山护盾/增伤/复活',
    700019: '攻击为主人加怒',
    700020: '攻击不加怒/扣目标怒',
    700021: '附加治疗/护盾',
    700022: '叠层+伤害分担',
    700023: '随机阳/阴形态',
    700024: '攻击触发伤害分担',
    700025: '回合末清异常',
    700026: '击杀回血',
    700027: '攻击清增益',
    700028: '首次受击增伤',
    700029: '首次受击增伤+免伤盾',
    700030: '无视防御+阵亡增伤',
    700031: '攻击扣蓝+蓝耗25%',
    700032: '乾坤天降（风雷）',
    700033: '初音圣体（阈值减伤）',
    700034: '灵魂超度（条件倍率）',
    700035: '枭刃（1-2段）',
    700036: '兔击长空',
    700037: '金箍棒头',
    700038: '三味真火',
    700039: '玄女功',
    700040: '初音飓风+驱散',
    700041: '穷凶烈爪+暴击吸血',
    700042: '太初决+驱散',
    700043: '封阳击（独立物理）',
    700044: '推气过穴（独立治疗）',
    700045: '生命化泉（独立治疗）',
    700046: '炼气化神（独立回蓝）',
    700047: '罗汉金钟（独立魔法盾）',
    700048: '菩提明镜（独立反伤盾）',
    700049: '郎神共舞（独立）',
    700050: '天诛（独立）',
    700051: '燃烧之光（独立）',
    700052: '八方俱灭（独立）',
    700053: '神龙吐珠（独立）',
    700054: '玄天盾（独立）',
    700055: '超级涅槃（独立）',
    700056: '超级神佑（独立）',
    700057: '超级逃生（独立）',
    700058: '花仙守护（独立）',
    700059: '换天之术（独立）',
    700060: '龙尊道体（独立）',
    700061: '超级反弹（独立）',
    700062: '超级魔法还击（独立）',
    700063: '八方物连（独立）',
    700064: '天地双连（独立）',
    700065: '斗字秘（独立）',
    700066: '灵魂冲击（独立）',
    700067: '列字秘（独立追击）',
    700068: '叠法（独立重放）',
    700069: '神兵加持（独立重放）',
    700070: '九龙神火（独立重放）',
    700071: '法术吸血（独立）',
    700072: '超级审判（独立）',
    700073: '超级驱鬼（独立）',
    700074: '禁魂（独立）',
    700075: '魔气入体（独立）',
    700076: '兵字秘（独立）',
    700077: '突袭（独立）',
    700078: '破道（独立）',
    700079: '穷奇圣体（独立）',
    700080: '封阳圣体（独立）',
    700081: '太初圣体（独立）',
    700082: '亡川神体（独立）',
    700083: '白灵祝福（独立护盾）',
    700084: '神猿加持（独立护盾）',
    700085: '麒麟御风（独立护盾）',
    700086: '仙道神体（独立减伤盾）',
    700087: '龙盾（独立护盾）',
    700088: '风盾（独立护盾）',
    700089: '封盾（独立护盾）',
    700090: '死神盾（独立护盾）',
    700091: '亡川盾（独立护盾）',
    700092: '超级报复（独立）',
    700093: '超级物攻祝福（独立）',
    700094: '超级逆击（独立）',
    700095: '超级强击（独立）',
    700096: '神威（独立）',
    700097: '神隐（独立）',
    700098: '金刚之躯（独立）',
    700099: '乘风（独立）',
    700100: '扶摇（独立）',
    700101: '超级护主（独立）',
    700102: '牛威（独立）',
    700103: '野蛮增长（独立）',
    700104: '身外化身（蛋形）',
    700105: '化魂（蛋形）',
}
BUFF = {
    70055: '生命护盾', 70065: '反伤', 80005: '持续回血', 69514: '减伤',
    90350: '增伤', 70025: '控制免疫', 90009: '隐身', 90335: '复活',
    88047: '伤害免疫', 70000: '封心', 30002: '次数护盾', 90500: '叠层增伤99',
    90501: '叠层增伤3', 90304: '法术吸血', 70012: '物攻祝福',
    90503: '攻速', 90504: '物攻', 90505: '灼烧', 90506: '伤害分担',
    90507: '魔伤', 90508: '攻速', 90247: '眩晕',
    90509: '物理增伤', 90510: '魔防', 90511: '风雷祝福', 90512: '小萌羊',
}
ACTIVE = {60590, 60603, 67075, 67085, 67110, 67130, 67131, 67200, 67309,
          67316, 67330, 67334, 67338, 67343, 67348, 67353, 67358, 67363,
          67368, 67378}
SUPPORT = {67074, 67113, 67114, 67117, 67118, 67119}
PARTIAL = {67300, 67305, 67333, 67342, 67345, 67353, 67363, 67367, 67368,
           67378, 67200, 67127}
INDEP = {67110, 67116}
SPECIAL = {
    67131: '精确（当前生命25%脚本）',
    67308: '独立脚本（致命伤害变蛋保留80%生命；蛋破则死；回合末涅槃；CD3）',
    67369: '独立脚本（致命伤害变蛋保留150%生命；蛋破则死；回合末恢复80%；CD3）',
    60282: '独立脚本（主人受伤61%承担55%）',
    67082: '独立脚本（每回合+10%魔攻叠层；70%随机减速/降攻；每回合首次伤害免疫；控制免疫未做）',
    67132: '独立脚本（每回合+15%物攻3层；30%降攻20%；暴击叠层未做）',
    60291: '独立脚本（低血增伤，阈值沿用10/30/50%）',
    60304: '独立脚本（回合初38%概率+10%物攻2回合）',
    60311: '独立脚本（对祝福目标+33%）',
    60326: '独立脚本（对宠物+15%，目标生命>1.7倍再+65%）',
    67081: '独立脚本（80%魔法连击；神威状态/暴伤未做）',
    67314: '独立脚本（出场/召唤隐身2回合可攻击）',
    67315: '独立脚本（受击70%概率20%减伤2回合）',
    67344: '独立脚本（每回合+10%魔攻叠层）',
    67360: '独立脚本（每回合+15%魔攻叠层；每回合10%双倍伤害）',
    67091: '独立脚本（出场200%盾2回合；属性已生效）',
    67093: '独立脚本（出场200%盾2回合+20%反伤2回合）',
    67302: '独立脚本（出场200%盾2回合；低血狂暴未做）',
    67307: '独立脚本（初始70%减伤盾2回合，CD5）',
    67336: '独立脚本（出场100%盾1回合；低血狂暴未做）',
    67346: '独立脚本（前2回合+20%伤害/攻速；出场200%盾1回合）',
    67356: '独立脚本（前3回合+30%伤害/40%攻速；出场200%盾1回合）',
    67366: '独立脚本（前3回合+30%伤害/40%攻速；出场挡6次盾1回合）',
    67371: '独立脚本（前3回合+30%伤害/30%攻速；出场挡6次盾1回合）',
    61064: '独立脚本（法术吸血15%）',
    60301: '独立脚本（对神佑/逃生目标+35%，击杀禁神佑）',
    60302: '独立脚本（鬼魂2倍伤害，无视8%物防）',
    67355: '独立脚本（20%禁魂5回合）',
    67038: '独立脚本（必定魔气入体3回合）',
    60444: '独立脚本（物穿40%）',
    67354: '独立脚本（物穿28%）',
    67364: '独立脚本（法穿30%）',
    67352: '独立脚本（攻击人物无视10%物魔防）',
    67357: '独立脚本（攻击人物无视35%物魔防）',
    67362: '独立脚本（攻击人物无视30%物魔防）',
    67372: '独立脚本（攻击人物无视35%物魔防）',
    67349: '独立脚本（技能击杀追击最多2次；+5%物攻/+3%魔攻）',
    67370: '独立脚本（30%重放无忧击70%伤害）',
    67087: '独立脚本（50%重放天诛）',
    67379: '独立脚本（释放乾坤天降40%额外释放；+30%伤害/攻速/魔防）',
    60288: '独立脚本（35%反弹65%）',
    60290: '独立脚本（58%魔法还击）',
    67332: '独立脚本（60%物理连击，倍率沿用135%）',
    67339: '独立脚本（70%物理连击120%）',
    60447: '独立脚本（40%追加130%魔法攻击）',
    60449: '独立脚本（70%眩晕1回合）',
    60283: '独立脚本（主人死亡40%复活35%生命，上限等级×75）',
    60285: '独立脚本（死亡28%复活100%生命，体质修正）',
    60286: '独立脚本（致命伤害49%回复150）',
    67304: '独立脚本（首次死亡100%复活100%生命，+30%魔防3回合）',
    67115: '独立脚本（出场200%盾2回合+20%反伤；首次死亡复活20%）',
    67337: '独立脚本（致命伤害50%免疫每回合一次；带60352/60353时80%）',
    67074: '独立脚本（3人，立即8%+200，每回合5%回血3回合）',
    67113: '独立脚本（4人，立即12%+200，每回合8%回血3回合）',
    67114: '独立脚本（5人，回复30%最大魔法，CD3）',
    67117: '独立脚本（全体，魔法减伤50%3回合，CD2）',
    67118: '独立脚本（1人，反伤35%3回合）',
    60590: '独立脚本（<50%生命2倍，否则150%；+20%魔攻）',
    60603: '独立脚本（1–2段随机；倍率推断）',
    67130: '独立脚本（7目标物理；降速有几率暂按70%记录）',
    67309: '独立脚本（3×3物理；金刚/怒目有几率暂按70%记录）',
    67316: '独立脚本（3×3魔法；天残/迟暮有几率暂按70%记录）',
    67338: '独立脚本（3/4/5目标物理）',
    67343: '独立脚本（3/3/6魔法+必定驱散）',
    67348: '独立脚本（2/3目标物理；主目标暴击吸血30%；护盾有几率暂按70%记录）',
    67358: '独立脚本（3/4/10魔法+必定驱散；20%小萌羊3回合）',
    60450: '独立脚本（攻击30%触发40%伤害分担2回合；属性已生效）',
    67068: '独立脚本（回合末50%清除自身异常）',
    67077: '独立脚本（击杀回复10%最大生命）',
    67083: '独立脚本（每次出手清除目标1个增益）',
    67207: '独立脚本（30%几率清除目标1个增益）',
    67097: '独立脚本（首次受击未死+20%物伤，本回合）',
    67133: '独立脚本（首次受击+20%物伤；受击30%几率30%减伤3回合）',
    67347: '独立脚本（单次伤害>50%生命时80%几率降至40%，+20%伤害2回合，CD3；覆盖普通/反击/协助伤害）',
    67110: '独立脚本（真实伤害）',
    67116: '独立脚本（物理受击护盾）',
    60284: '独立脚本（攻击扣蓝10%；蓝耗+25%已生效）',
    67080: '独立脚本（攻击扣蓝15%）',
    67127: '独立脚本（出场盾+受击魔法盾）',
    67305: '独立脚本（减伤/反伤/沉默）',
    67359: '独立脚本（25%法术吸血+受击减伤）',
    67365: '独立脚本（击杀回血+燃火增伤）',
    60279: '独立脚本（召唤回主人28%生命）',
    67306: '独立脚本（死亡回全队40%生命）',
    67340: '独立脚本（随机双/三倍+速度增伤）',
    60281: '独立脚本（召唤清心+控制免疫）',
    67310: '独立脚本（速度条件增伤/减伤）',
    60280: '独立脚本（召唤时主人技能冷却-3）',
    67111: '独立脚本（同阵营暗夜君王每只+5%横斩伤害，上限20%；另+10%物伤+20%物攻）',
    67331: '独立脚本（每2回合攻速+20%/物攻+30%，持续2回合）',
    67335: '独立脚本（法术技能击杀后追击一次技能）',
    67361: '独立脚本（前3回合魔伤+40%/攻速+30%；出场200%护盾1回合；首次死亡60%复活）',
    67119: '独立脚本（全队+20%伤害3回合，CD2）',
    67075: '独立脚本（3目标魔法；50%主目标封心；70%一次免伤）',
    67085: '独立脚本（4目标物理；暴击吸血20%）',
    67330: '独立脚本（2×4物理；主目标暴击吸血50%）',
    67334: '独立脚本（2×4魔法；10%法术吸血）',
    67341: '独立脚本（出场/召唤100%盾1回合；10%致命免疫）',
    67300: '独立脚本（叠层增伤+55%几率35%伤害分担）',
    67345: '独立脚本（首次死亡50%复活；每回合40%几率35%伤害分担2回合）',
    67333: '独立脚本（60%攻击为主人+5怒气；属性已生效）',
    67342: '独立脚本（攻击不涨怒并扣第一目标5怒；属性已生效）',
    67367: '独立脚本（攻击人物无视30%防；每个阵亡友方+10%伤害/+20%魔防）',
    67200: '独立脚本（40%阳焱全体+灼烧5%；60%阴焱2目标×2+50%眩晕）',
    67353: '独立脚本（5–8段随机；击杀后自动转火；物理攻击脚本已修正）',
    67363: '独立脚本（5–8段随机；击杀后自动转火；每段20%眩晕2回合）',
    67368: '独立脚本（每段附加治疗+20%护盾近似）',
    67378: '独立脚本（主目标+相邻5目标同倍率；释放后+15%物攻/速度/生命；风雷护盾70%几率250%生命2回合）',
}


def read_client():
    env = UnityPy.load(DATA)
    for o in env.objects:
        if o.type.name != 'TextAsset':
            continue
        d = o.read()
        if str(d.m_Name) != 'data_skill':
            continue
        s = d.m_Script
        if isinstance(s, bytes):
            s = s.decode('utf-8', 'ignore')
        a = s.find('DataSkill.petSkillGetFunc={')
        b = s.find('\nDataSkill.', a + 10)
        blk = s[a:b if b > 0 else len(s)]
        out = {}
        for m in re.finditer(r'\[\[{(\d+),1,"([^"]*)",\d+,\d+,\d+,"(.*?)"}\]\],', blk, re.S):
            desc = re.sub(r'<[^>]+>', '', m.group(3).replace('\\n', '\n'))
            out[int(m.group(1))] = (m.group(2), desc.strip())
        return out
    return {}


def attr_text(entries):
    out = []
    for t, name, val in entries:
        name = int(name)
        label = ATTR.get(name, '属性%s' % name)
        if t == 3:
            a, b = val
            out.append('%s=等级×%s+%s' % (label, int(a) / 10, b))
        elif t == 8:
            a, b = val
            out.append('%s=等级×%s+%s' % (label, int(a) / 100, b))
        else:
            if name in PCT:
                out.append('%s+%s%%' % (label, int(val) / 10))
            else:
                out.append('%s+%s' % (label, val))
    return '，'.join(out) if out else '-'


def buff_text(bid, rate=None, dur=None, args=None):
    name = BUFF.get(bid, 'buff%s' % bid)
    extra = []
    if args:
        if bid == 70055 and len(args) >= 1:
            extra.append('生命上限%s%%' % (int(args[0]) / 10))
        elif bid == 70065 and len(args) >= 2:
            extra.append('%s%%反伤' % (int(args[1]) / 10))
        elif bid == 80005 and len(args) >= 1:
            extra.append('每回合%s%%' % (int(args[0]) / 10))
        elif bid == 69514 and len(args) >= 1:
            extra.append('%s%%减伤' % (int(args[0]) / 10))
        elif bid == 90350 and len(args) >= 1:
            extra.append('%s%%增伤' % (int(args[0]) / 10))
        elif bid == 88047 and len(args) >= 1:
            extra.append('%s%%免疫' % (int(args[0]) / 10))
        elif bid == 70000 and len(args) >= 1:
            extra.append('封心%s%%' % (int(args[0]) / 10))
        elif bid == 30002 and len(args) >= 1:
            extra.append('挡%s次' % args[0])
        elif bid in (90500, 90501) and len(args) >= 1:
            extra.append('每层%s%%' % (int(args[0]) / 10))
        elif bid == 90304 and len(args) >= 1:
            extra.append('%s%%吸血' % (int(args[0]) / 10))
        elif bid == 90335 and len(args) >= 5:
            extra.append('%s%%生命复活' % (int(args[4]) / 10))
        elif bid in (90503, 90508) and len(args) >= 1:
            extra.append('攻速+%s%%' % (int(args[0]) / 10))
        elif bid == 90504 and len(args) >= 1:
            extra.append('物攻+%s%%' % (int(args[0]) / 10))
        elif bid == 90505 and len(args) >= 1:
            extra.append('每回合%s%%生命' % (int(args[0]) / 10))
        elif bid == 90506 and len(args) >= 1:
            extra.append('%s%%伤害分担' % (int(args[0]) / 10))
        elif bid == 90507 and len(args) >= 1:
            extra.append('魔伤+%s%%' % (int(args[0]) / 10))
    if dur:
        extra.append('%s回合' % dur)
    return name + ('(' + '，'.join(extra) + ')' if extra else '')


def combat_text(block):
    if not block:
        return ''
    nums = re.findall(r'\{\d+, \d+, (\d+)\}', block)
    if not nums:
        target = '?'
    elif len(set(nums)) == 1:
        target = '%s×%s' % (nums[0], len(nums)) if len(nums) > 1 else nums[0]
    else:
        target = '/'.join(nums)
    dr = re.search(r'dmg_ratio = \[([^\]]*)\]', block)
    dmg = dr.group(1).strip() if dr else ''
    at = re.search(r'attack_times = (\d+)', block)
    times = at.group(1) if at else '1'
    mp = re.search(r'cost_mp = (\d+)', block)
    cd = re.search(r'cooldown = (\d+)', block)
    sid = re.search(r'script_id = (\d+)', block)
    args = re.search(r'script_args = \[([^\]]*)\]', block)
    buffs = []
    for m in re.finditer(r'\{(\d+),\s*\d+,\s*(\d+),\s*\d+,\s*\[([^\]]*)\]\}', block):
        bid = int(m.group(1))
        if bid in BUFF:
            buffs.append(buff_text(bid, dur=m.group(2), args=[x.strip() for x in m.group(3).split(',') if x.strip()]))
    parts = []
    if sid:
        sn = SCRIPT.get(int(sid.group(1)), '脚本%s' % sid.group(1))
        parts.append(sn + ('(%s)' % args.group(1) if args else ''))
    if target != '?':
        parts.append('目标%s' % target)
    if dmg:
        parts.append('倍率[%s]' % dmg)
    if times != '1':
        parts.append('%s段' % times)
    if mp:
        parts.append('MP%s' % mp.group(1))
    if cd:
        parts.append('CD%s' % cd.group(1))
    if buffs:
        parts.append('buff:' + '、'.join(buffs))
    return '；'.join(parts)


def status_cat(s):
    if '独立' in s:
        return '独立脚本'
    if '精确' in s:
        return '精确'
    if '仅属性' in s:
        return '仅属性'
    if '部分' in s:
        return '部分'
    if '未实现' in s:
        return '未实现'
    return '近似'


def write_xlsx(rows, counts):
    wb = Workbook()
    thin = Side(style='thin', color='B0B0B0')
    border = Border(left=thin, right=thin, top=thin, bottom=thin)
    head_fill = PatternFill('solid', fgColor='1F4E78')
    head_font = Font(color='FFFFFF', bold=True)
    green = PatternFill('solid', fgColor='C6EFCE')
    yellow = PatternFill('solid', fgColor='FFEB9C')
    orange = PatternFill('solid', fgColor='FCE4D6')
    red = PatternFill('solid', fgColor='FFC7CE')
    wrap = Alignment(wrap_text=True, vertical='top')

    ws = wb.active
    ws.title = '总览'
    ws['A1'] = '2025 新宠技能当前效果表'
    ws['A1'].font = Font(bold=True, size=14)
    ws['A2'] = '更新时间'
    ws['B2'] = '2026-10-29'
    ws['A3'] = '技能总数'
    ws['B3'] = len(rows)
    r = 5
    ws.cell(r, 1, '状态').font = head_font
    ws.cell(r, 1).fill = head_fill
    ws.cell(r, 2, '数量').font = head_font
    ws.cell(r, 2).fill = head_fill
    r += 1
    for k, v in counts.most_common():
        ws.cell(r, 1, k)
        ws.cell(r, 2, v)
        ws.cell(r, 1).fill = green if ('独立' in k or '精确' in k) else (red if '未实现' in k else (orange if ('部分' in k or '仅属性' in k) else yellow))
        r += 1
    r += 1
    ws.cell(r, 1, '说明').font = Font(bold=True)
    for line in ['独立脚本：700001-700033 专用脚本',
                 '精确：属性/公式按说明落表',
                 '近似：属性/目标/消耗准确，伤害倍率或 buff 参数推断',
                 '部分：部分机制已做，剩余机制未做',
                 '未实现：目前没有生效记录',
                 '独立脚本均已编译、差分校验并热加载，战斗内触发仍建议实战确认',
                 '伤害倍率无法从客户端取得，均为推断值']:
        r += 1
        ws.cell(r, 1, line)
    ws.column_dimensions['A'].width = 60
    ws.column_dimensions['B'].width = 12

    def add_detail(title, data):
        sh = wb.create_sheet(title)
        headers = ['ID', '技能', '类型', '当前效果', '状态', '技能说明']
        for c, h in enumerate(headers, 1):
            cell = sh.cell(1, c, h)
            cell.font = head_font
            cell.fill = head_fill
            cell.alignment = Alignment(horizontal='center', vertical='center')
            cell.border = border
        for i, row in enumerate(data, 2):
            sid, name, typ, effect, status, desc = row
            vals = [sid, name, typ, effect, status, desc]
            for c, v in enumerate(vals, 1):
                cell = sh.cell(i, c, v)
                cell.alignment = wrap
                cell.border = border
            st = sh.cell(i, 5)
            if '独立' in status or '精确' in status:
                st.fill = green
            elif '未实现' in status:
                st.fill = red
            elif '部分' in status or '仅属性' in status:
                st.fill = orange
            else:
                st.fill = yellow
        sh.freeze_panes = 'A2'
        sh.auto_filter.ref = 'A1:F%d' % (len(data) + 1)
        for col, w in zip('ABCDEF', [8, 18, 10, 80, 34, 80]):
            sh.column_dimensions[col].width = w
        sh.row_dimensions[1].height = 22

    add_detail('详细表', rows)
    todo = [x for x in rows if ('未实现' in x[4] or '部分' in x[4] or '仅属性' in x[4])]
    add_detail('待补-部分', todo)
    out = os.path.join(ROOT, 'docs', '技能效果表.xlsx')
    try:
        wb.save(out)
    except PermissionError:
        alt = os.path.join(ROOT, 'tmp', '技能效果表.xlsx')
        wb.save(alt)
        print('docs xlsx is locked; wrote', alt)


def main():
    client = read_client()
    skill = open(os.path.join(ROOT, 'YCserver', 'erl_src', 'skill_data.erl'), encoding='utf-8').read()
    combat = open(os.path.join(ROOT, 'YCserver', 'erl_src', 'skill_combat_data.erl'), encoding='utf-8').read()
    ids = []
    for sid in (int(x) for x in re.findall(r'get_pet\(\{(\d+), 1\}\) ->', skill)):
        m = re.search(r'get_pet\(\{%d, 1\}\) ->\n    #pet_base_skill\{.*?type = (\d+)' % sid, skill, re.S)
        if m and int(m.group(1)) >= 1000:
            ids.append(sid)
    rows = []
    for sid in sorted(ids):
        name, desc = client.get(sid, ('?', ''))
        block = re.search(r'get_pet\(\{%d, 1\}\) ->\n    #pet_base_skill\{.*?\};' % sid, skill, re.S)
        attrs = []
        if block:
            am = re.search(r'attr\s*=\s*(\[.*?\])\s*\}', block.group(0), re.S)
            if am:
                for m in re.finditer(r'\{(\d+),\s*(\d+),\s*(-?\d+|\{[-0-9, ]+\})\}', am.group(1)):
                    val = m.group(3)
                    if val.startswith('{'):
                        val = tuple(int(x) for x in val.strip('{}').split(','))
                    else:
                        val = int(val)
                    attrs.append((int(m.group(1)), int(m.group(2)), val))
        cb = re.search(r'get_combat\(\{%d, 1\}\) ->\n(.*?)(?=\nget_combat\(|\Z)' % sid, combat, re.S)
        ct = combat_text(cb.group(1) if cb else '')
        at = attr_text(attrs)
        if sid in SPECIAL:
            status = SPECIAL[sid]
        elif sid in ACTIVE:
            status = '近似（倍率推断）'
        elif sid in SUPPORT:
            status = '近似（治疗/护盾参数）'
        elif ct:
            status = '近似（触发脚本）'
        elif at != '-':
            trigger_kw = ('受到', '死亡', '每回合', '击杀', '首次', '出场', '召唤',
                          '攻击时', '被攻击', '护盾', '复活', '免疫', '反弹',
                          '还击', '连击', '追击', '清除', '恢复', '治疗')
            status = '仅属性（触发未实现）' if any(k in desc for k in trigger_kw) else '精确（属性）'
        else:
            status = '未实现'
        if sid in ACTIVE:
            typ = '主动'
        elif sid in SUPPORT:
            typ = '辅助'
        elif '护盾' in desc or '护盾' in name:
            typ = '护盾'
        elif ct:
            typ = '触发'
        else:
            typ = '被动'
        effect = '；'.join(x for x in (at if at != '-' else '', ct) if x) or '无'
        rows.append((sid, name, typ, effect, status, desc.split('\n')[0][:80]))
    with open(OUT, 'w', encoding='utf-8') as f:
        f.write('# 2025 新宠技能当前效果表\n\n')
        f.write('更新时间：2026-10-29。数据来自当前服务端 `skill_data.erl` / `skill_combat_data.erl`。\n\n')
        f.write('## 总览\n\n')
        f.write('- 技能总数：%d\n' % len(rows))
        from collections import Counter
        c = Counter(status_cat(r[4]) for r in rows)
        for k, v in c.most_common():
            f.write('- %s：%d\n' % (k, v))
        f.write('\n- “独立脚本”=新增 700001/700002 等专用脚本；\n')
        f.write('- “近似”=属性/目标/消耗精确，但伤害倍率或 buff 参数按描述推断；\n')
        f.write('- “仅属性”=属性已生效，特殊触发尚未写脚本；\n')
        f.write('- “未实现”=目前没有可生效的战斗记录；\n')
        f.write('- 独立脚本均已编译、差分校验并热加载，战斗内触发仍建议实战确认。\n\n')
        f.write('## 详细表\n\n')
        f.write('| ID | 技能 | 类型 | 当前效果 | 状态 |\n')
        f.write('|---|---|---|---|---|\n')
        for sid, name, typ, effect, status, _ in rows:
            f.write('| %d | %s | %s | %s | %s |\n' % (sid, name, typ, effect, status))
    counts = Counter(status_cat(r[4]) for r in rows)
    write_xlsx(rows, counts)
    print('wrote', OUT, 'and docs/技能效果表.xlsx rows', len(rows))


if __name__ == '__main__':
    main()
