#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""Parse the 2025 pet skill descriptions into exact server attr entries.

Dry-run by default: writes tmp/attr_refine_report.tsv and unmatched lines.
Use --apply to rewrite the matching #pet_base_skill{attr = ...} records,
compile, differential-verify and hot-load.
"""
import os
import re
import shutil
import subprocess
import sys

import UnityPy

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
SRC = os.path.join(ROOT, 'YCserver', 'erl_src')
EBIN = os.path.join(ROOT, 'YCserver', 'data', 'server', 'ebin')
BUILD = os.path.join(ROOT, 'tmp', 'build_attrs')
BACKUP = os.path.join(ROOT, 'tmp', 'beam_backup_attrs')
ERLC = os.path.join(ROOT, 'tmp', 'erlang19', 'bin', 'erlc.exe')
ERL = os.path.join(ROOT, 'tmp', 'erlang19', 'bin', 'erl.exe')
DATA_BUNDLES = [
    os.path.join(ROOT, 'tmp', 'updated_client', 'business_data_2025.unity3d'),
    os.path.join(ROOT, 'cdn', 'patch_android', '202506251639', 'textures', 'textures_business_data.unity3d'),
]
REPORT = os.path.join(ROOT, 'tmp', 'attr_refine_report.tsv')
UNMATCHED = os.path.join(ROOT, 'tmp', 'attr_refine_unmatched.txt')

# keyword -> server attr name (flat 1-50, ratio 51-62; see attr_type.erl)
PCT_ATTR = [
    ('气血上限', 51), ('生命值', 51), ('生命', 51),
    ('物理攻击', 54), ('物攻', 54),
    ('魔法攻击', 55), ('魔攻', 55),
    ('攻击速度', 53), ('攻速', 53),
    ('物理防御', 56), ('物防', 56),
    ('魔法防御', 57), ('魔防', 57),
    ('物理伤害', 45), ('魔法伤害', 46), ('法术伤害', 46),
    ('暴击概率', 8), ('暴击几率', 8), ('暴击率', 8),
    ('魔法暴击', 36), ('暴击伤害', 22),
    ('闪避', 11), ('命中', 10), ('伤害提成', 23),
]
LEVEL_ATTR = [
    ('气血上限', 1), ('生命值', 1), ('生命', 1),
    ('物理攻击', 4), ('物攻', 4), ('魔法攻击', 5), ('魔攻', 5),
    ('攻击速度', 3), ('攻速', 3),
    ('物理防御', 6), ('物防', 6), ('魔法防御', 7), ('魔防', 7),
    ('速度', 12),
]
PCT_RE = re.compile(
    r'(?:永久)?(?:提升|提高|增加)?(?:自身|宠物)?(?:的)?\s*(\d+(?:\.\d+)?)\s*%\s*(?:的)?\s*('
    + '|'.join(k for k, _ in PCT_ATTR) + r')')
PLUS_RE = re.compile(r'(' + '|'.join(k for k, _ in PCT_ATTR) + r')\s*\+\s*(\d+(?:\.\d+)?)\s*%')
LEVEL_RE = re.compile(
    r'(?:永久提升|永久提高|提升|提高|增加)?(?:宠物|主宠)?等级\s*[×xX*]\s*(\d+(?:\.\d+)?)'
    r'\s*(?:\+\s*(\d+))?\s*(?:点|的)?\s*(' + '|'.join(k for k, _ in LEVEL_ATTR) + r')')
FLAT_RE = re.compile(
    r'(?:永久提升|附加永久提升|永久增加|增加)\s*(\d{2,})\s*(?:点)?\s*(' 
    + '|'.join(k for k, _ in LEVEL_ATTR) + r')')
PCT_MAP = dict(PCT_ATTR)
LEVEL_MAP = dict(LEVEL_ATTR)
SPECIAL_ATTRS = {60326: {10: 140}}


def read(p):
    with open(p, encoding='utf-8', newline='') as f:
        return f.read()


def write(p, s):
    os.makedirs(os.path.dirname(p), exist_ok=True)
    with open(p, 'w', encoding='utf-8', newline='') as f:
        f.write(s)


def load_descriptions():
    path = next((p for p in DATA_BUNDLES if os.path.isfile(p) and os.path.getsize(p) > 0), None)
    if path is None:
        raise SystemExit('缺少 2025 data bundle')
    env = UnityPy.load(path)
    assets = {}
    for obj in env.objects:
        if obj.type.name == 'TextAsset':
            d = obj.read()
            s = d.m_Script
            assets[str(d.m_Name)] = s.decode('utf-8', 'ignore') if isinstance(s, bytes) else s
    s = assets['data_skill']
    a = s.find('DataSkill.petSkillGetFunc={')
    b = s.find('\nDataSkill.', a + 10)
    block = s[a:b if b > 0 else len(s)]
    out = {}
    for m in re.finditer(r'\[\[{(\d+),1,"([^"]*)",\d+,\d+,\d+,"(.*?)"}\]\],', block, re.S):
        desc = m.group(3).replace('\\n', '\n')
        desc = re.sub(r"<[^>]+>", "", desc).replace("\\'", "'")
        out[int(m.group(1))] = (m.group(2), desc)
    return out


def mask_transient(line):
    # drop damage/heal clauses so 150% damage / 28% heal is not read as a stat
    return re.sub(
        r'(?:造成|额外造成|恢复|回复|吸收|吸取|提高至|伤害为原来的)'
        r'[^，,。;；!！\n]*?(?=，|,|。|;|；|!|！|永久|$)',
        ' ', line)


def parse_attrs(desc):
    attrs = {}
    matched = []
    unmatched = []
    for line in desc.split('\n'):
        m = re.search(r'拥有此技能(?:时)?[，,]?\s*攻速(?:额外)?提升\s*(\d+(?:\.\d+)?)\s*%', line)
        if m:
            val = int(round(float(m.group(1)) * 10))
            attrs[53] = attrs.get(53, 0) + val
            matched.append((line, [f'拥有此技能攻速{m.group(1)}%->53:{val}']))
        m = re.search(r'暴击伤害\s*(?:提升|提高|增加)\s*(\d+(?:\.\d+)?)\s*%', line)
        if m:
            val = int(round(float(m.group(1)) * 10))
            attrs[22] = attrs.get(22, 0) + val
            matched.append((line, [f'暴击伤害{m.group(1)}%->22:{val}']))
    for orig in desc.split('\n'):
        line = orig.strip()
        if not line:
            continue
        found = []
        if '永久' in line:
            line = mask_transient(line)
            for m in PCT_RE.finditer(line):
                pct, key = float(m.group(1)), m.group(2)
                attr = PCT_MAP[key]
                val = int(round(pct * 10))
                attrs[attr] = attrs.get(attr, 0) + val
                found.append(f'{key}{m.group(1)}%->{attr}:{val}')
            for m in PLUS_RE.finditer(line):
                key, pct = m.group(1), float(m.group(2))
                attr = PCT_MAP[key]
                val = int(round(pct * 10))
                attrs[attr] = attrs.get(attr, 0) + val
                found.append(f'{key}+{m.group(2)}%->{attr}:{val}')
            for m in LEVEL_RE.finditer(line):
                coeff, base, key = float(m.group(1)), m.group(2), m.group(3)
                attr = LEVEL_MAP[key]
                if coeff < 1:
                    attrs[attr] = (8, int(round(coeff * 100)), int(base or 0))
                    found.append(f'等级x{coeff}+{base or 0}{key}->type8:{attr}')
                else:
                    attrs[attr] = (3, int(round(coeff * 10)), int(base or 0))
                    found.append(f'等级x{coeff}+{base or 0}{key}->type3:{attr}')
            for m in FLAT_RE.finditer(line):
                val, key = int(m.group(1)), m.group(2)
                attr = LEVEL_MAP[key]
                attrs[attr] = attrs.get(attr, 0) + val
                found.append(f'{key}+{val}->{attr}:{val}')
        if found:
            matched.append((line, found))
        elif '永久' in orig and len(orig) > 6:
            unmatched.append(orig)
    return attrs, matched, unmatched


def attr_text(attrs):
    parts = []
    for name in sorted(attrs):
        val = attrs[name]
        if isinstance(val, tuple):
            t, a, b = val
            parts.append('{%d, %d, {%d, %d}}' % (t, name, a, b))
        else:
            parts.append('{1, %d, %d}' % (name, val))
    return '[' + ', '.join(parts) + ']' if parts else '[]'


def current_attr(src, sid):
    m = re.search(r'get_pet\(\{%d, 1\}\) ->\n    #pet_base_skill\{.*?\};' % sid, src, re.S)
    if not m:
        return None, None
    block = m.group(0)
    am = re.search(r'attr\s*=\s*(\[.*?\])\s*\}', block, re.S)
    return block, (re.sub(r'\s+', ' ', am.group(1)) if am else None)


def replace_attr(block, attr_sql):
    # remove an existing attr field (multi-line, nested braces)
    am = re.search(r',\s*attr\s*=\s*\[.*?\]', block, re.S)
    if am:
        block = block[:am.start()] + block[am.end():]
    if attr_sql == '[]':
        return block
    end = block.rfind('}')
    return block[:end] + ',\n                    attr = ' + attr_sql + block[end:]


def compile_beam(src_text, out_dir):
    os.makedirs(out_dir, exist_ok=True)
    path = os.path.join(BUILD, 'src', 'skill_data.erl')
    write(path, src_text)
    r = subprocess.run([ERLC, '-o', out_dir, path], capture_output=True, text=True)
    if r.returncode:
        print(r.stdout, r.stderr)
        raise SystemExit('compile failed')
    return os.path.join(out_dir, 'skill_data.beam')


def erl_eval(expr):
    r = subprocess.run([ERL, '+S1:1', '-noshell',
                        '-sname', 'attrref_%d_%s' % (os.getpid(), abs(hash(expr)) % 9999),
                        '-setcookie', '6bc1t325xjo21c1',
                        '-pa', os.path.join(ROOT, 'tmp', 'build', 'out'), '-pa', EBIN,
                        '-eval', expr], capture_output=True, text=True, encoding='utf-8', errors='replace', timeout=1200)
    return (r.stdout or '') + (r.stderr or '')


def running_nodes():
    epmd = next((p for p in [os.path.join(ROOT, 'tmp', 'erlang19', 'bin', 'epmd.exe'),
                             os.path.join(ROOT, 'tmp', 'erlang19', 'erts-8.3', 'bin', 'epmd.exe')]
                 if os.path.exists(p)), None)
    if epmd is None:
        return []
    out = subprocess.run([epmd, '-names'], capture_output=True, text=True).stdout
    names = []
    for line in out.splitlines():
        parts = line.split()
        if len(parts) >= 2 and parts[0] == 'name':
            names.append(parts[1] + '@cll')
    return [n for n in names if n.startswith('fswy_')]


def main():
    apply = '--apply' in sys.argv
    descs = load_descriptions()
    src = read(os.path.join(SRC, 'skill_data.erl'))
    ids = sorted(int(x) for x in re.findall(r'get_pet\(\{(\d+), 1\}\) ->', src))
    # our generated 2025 skills all use type >= 1000; original skills stop at 999
    targets = []
    for sid in ids:
        m = re.search(r'get_pet\(\{%d, 1\}\) ->\n    #pet_base_skill\{.*?type = (\d+)' % sid, src, re.S)
        if m and int(m.group(1)) >= 1000:
            targets.append(sid)
    rows = []
    unmatched_all = []
    blocks = {}
    for sid in targets:
        if sid not in descs:
            continue
        block, cur = current_attr(src, sid)
        if block is None:
            continue
        name, desc = descs[sid]
        attrs, matched, unmatched = parse_attrs(desc)
        for k, v in SPECIAL_ATTRS.get(sid, {}).items():
            attrs[k] = v
        new = attr_text(attrs)
        rows.append((sid, name, cur or '-', new, len(matched), ' | '.join(x for _, fs in matched for x in fs)))
        if unmatched:
            unmatched_all.append((sid, name, unmatched))
        blocks[sid] = (block, new)
    with open(REPORT, 'w', encoding='utf-8', newline='') as f:
        f.write('id\tname\tcurrent\tnew\tmatches\tevidence\n')
        for r in rows:
            f.write('\t'.join(map(str, r)) + '\n')
    with open(UNMATCHED, 'w', encoding='utf-8') as f:
        for sid, name, lines in unmatched_all:
            f.write(f'===== {sid} {name}\n')
            for line in lines:
                f.write('  ' + line + '\n')
    print('report:', REPORT, 'rows:', len(rows))
    print('unmatched lines:', sum(len(x[2]) for x in unmatched_all))
    if not apply:
        print('dry-run only; rerun with --apply to install')
        return

    os.makedirs(os.path.join(BUILD, 'src'), exist_ok=True)
    os.makedirs(os.path.join(BUILD, 'baseline'), exist_ok=True)
    os.makedirs(os.path.join(BUILD, 'patched'), exist_ok=True)
    new_src = src
    for sid, (block, new) in sorted(blocks.items()):
        if new == '[]' and 'attr' not in block:
            continue
        old = re.search(r'get_pet\(\{%d, 1\}\) ->\n    #pet_base_skill\{.*?\};' % sid, new_src, re.S).group(0)
        new_src = new_src.replace(old, replace_attr(old, new), 1)
    compile_beam(src, os.path.join(BUILD, 'baseline'))
    compile_beam(new_src, os.path.join(BUILD, 'patched'))
    keys = os.path.join(BUILD, 'skill_data.keys')
    subprocess.run([sys.executable, os.path.join(ROOT, 'tmp', 'make_keys.py'),
                    os.path.join(ROOT, 'tmp', 'build', 'src', 'skill_data.erl'), keys],
                   check=True, stdout=subprocess.DEVNULL)
    out = erl_eval('verify_beam:run("%s","%s","%s")' % (
        os.path.join(EBIN, 'skill_data.beam').replace('\\', '/'),
        os.path.join(BUILD, 'patched', 'skill_data.beam').replace('\\', '/'),
        keys.replace('\\', '/')))
    print(next((l for l in out.split('\n') if 'compared' in l), out[:500]))
    if '0 diffs' not in out:
        print(out[:3000])
        raise SystemExit('verify failed')
    shutil.copy2(os.path.join(BUILD, 'patched', 'skill_data.beam'), os.path.join(EBIN, 'skill_data.beam'))
    write(os.path.join(SRC, 'skill_data.erl'), new_src)
    nodes = running_nodes()
    if nodes:
        expr = ('Nodes=%s, R=[{N,rpc:call(N,code,load_file,[skill_data])} || N <- Nodes],'
                'io:format("~p~n",[R]),init:stop().' % str(nodes))
        print(erl_eval(expr)[:2000])
    print('applied', len(blocks), 'skills')


if __name__ == '__main__':
    main()
