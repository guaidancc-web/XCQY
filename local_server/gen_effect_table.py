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
}
BUFF = {
    70055: '生命护盾', 70065: '反伤', 80005: '持续回血', 69514: '减伤',
    90350: '增伤', 70025: '控制免疫', 90009: '隐身', 90335: '复活',
    88047: '伤害免疫', 70000: '封心', 30002: '次数护盾', 90500: '叠层增伤99',
    90501: '叠层增伤3', 90304: '法术吸血', 70012: '物攻祝福',
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
    67110: '独立脚本（真实伤害）',
    67116: '独立脚本（物理受击护盾）',
    60284: '独立脚本（攻击扣蓝10%；蓝耗+25%未做）',
    67080: '独立脚本（攻击扣蓝15%）',
    67127: '独立脚本（出场盾+受击魔法盾）',
    67305: '独立脚本（减伤/反伤/沉默）',
    67359: '独立脚本（25%法术吸血+受击减伤）',
    67365: '独立脚本（击杀回血+燃火增伤）',
    67119: '近似（群增伤20%）',
    67075: '近似（封心+护盾已接）',
    67085: '近似（20%暴击吸血）',
    67330: '近似（50%暴击吸血）',
    67334: '近似（10%法术吸血）',
    67341: '近似（护盾+10%免疫）',
    67300: '部分（叠层已做，伤害分担未做）',
    67345: '未实现（伤害分担）',
    67333: '仅属性（怒气未做）',
    67342: '仅属性（怒气未做）',
    67367: '部分（属性/法穿已做，怒气未做）',
    67200: '部分（随机形态未做）',
    67353: '部分（击杀转火未做）',
    67363: '部分（击杀转火未做）',
    67368: '部分（附加治疗/护盾未做）',
    67378: '部分（溅射近似）',
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
    if dur:
        extra.append('%s回合' % dur)
    return name + ('(' + '，'.join(extra) + ')' if extra else '')


def combat_text(block):
    if not block:
        return ''
    m = re.search(r'target_list = \[\{1, 2, (\d+)\}\]', block)
    target = m.group(1) if m else '?'
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
    for line in ['独立脚本：700001-700005 等专用脚本',
                 '精确：属性/公式按说明落表',
                 '近似：属性/目标/消耗准确，伤害倍率或 buff 参数推断',
                 '部分：部分机制已做，剩余机制未做',
                 '未实现：目前没有生效记录',
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
    wb.save(os.path.join(ROOT, 'docs', '技能效果表.xlsx'))


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
        c = Counter(r[4] for r in rows)
        for k, v in c.items():
            f.write('- %s：%d\n' % (k, v))
        f.write('\n- “独立脚本”=新增 700001/700002 等专用脚本；\n')
        f.write('- “近似”=属性/目标/消耗精确，但伤害倍率或 buff 参数按描述推断；\n')
        f.write('- “仅属性”=属性已生效，特殊触发尚未写脚本；\n')
        f.write('- “未实现”=目前没有可生效的战斗记录。\n\n')
        f.write('## 详细表\n\n')
        f.write('| ID | 技能 | 类型 | 当前效果 | 状态 |\n')
        f.write('|---|---|---|---|---|\n')
        for sid, name, typ, effect, status, _ in rows:
            f.write('| %d | %s | %s | %s | %s |\n' % (sid, name, typ, effect, status))
    counts = Counter(r[4] for r in rows)
    write_xlsx(rows, counts)
    print('wrote', OUT, 'and docs/技能效果表.xlsx rows', len(rows))


if __name__ == '__main__':
    main()
