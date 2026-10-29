#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""Generate server-side item_base entries and shop rows for 2025 client items.

Run:  python local_server/gen_shop_items_2025.py [--install]
Outputs Erlang source snippets + a report under tmp/shop_2025/.
"""
import argparse
import os
import re
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
CLIENT_2021 = os.path.join(ROOT, 'lua_decoded', 'data', 'data_item.lua')
CLIENT_2025 = os.path.join(ROOT, 'tmp', 'data2025_dump', 'data_item.lua')
SERVER_ITEM = os.path.join(ROOT, 'YCserver', 'erl_src', 'item_data.erl')
SERVER_SHOP = os.path.join(ROOT, 'YCserver', 'erl_src', 'shop_data.erl')
OUT = os.path.join(ROOT, 'tmp', 'shop_2025')

# item types that are equipment / pets / internal and should not be put on sale
SKIP_TYPES = set(range(1, 31)) | {9999, 9988}

# price by quality (diamonds)
PRICE_BY_QUALITY = {1: 100, 2: 300, 3: 800, 4: 2000, 5: 5000}

# tab2 used by the screenshot page ("珍宝阁")
SHOP_TAB, SHOP_TAB2 = 2, 5


def split_fields(s):
    parts, depth, cur, q, esc = [], 0, '', False, False
    for ch in s[1:-1]:
        if q:
            cur += ch
            if esc:
                esc = False
            elif ch == '\\':
                esc = True
            elif ch == '"':
                q = False
            continue
        if ch == '"':
            q = True
            cur += ch
            continue
        if ch == '{':
            depth += 1
        elif ch == '}':
            depth -= 1
        elif ch == ',' and depth == 0:
            parts.append(cur.strip())
            cur = ''
            continue
        cur += ch
    parts.append(cur.strip())
    return parts


def parse_client(path):
    text = open(path, encoding='utf-8', errors='replace').read()
    out = {}
    for line in text.split('\n'):
        m = re.match(r'\s*\[(\d+)\]=', line)
        if not m:
            continue
        iid = int(m.group(1))
        pos = line.find('{', m.end())
        if pos < 0:
            continue
        depth, body, q = 0, None, False
        for i in range(pos, len(line)):
            ch = line[i]
            if ch == '"':
                q = not q
            if not q:
                if ch == '{':
                    depth += 1
                elif ch == '}':
                    depth -= 1
                    if depth == 0:
                        body = line[pos:i + 1]
                        break
        if body:
            out[iid] = split_fields(body)
    return out


def parse_server_ids(path):
    text = open(path, encoding='utf-8').read()
    return {int(m.group(1)) for m in re.finditer(r'^get\((\d+)\) ->', text, re.M)}


def parse_effect(ce):
    """{{effect_type = 77,val = {1}},{effect_type = 16,val = {{1,2}}}} -> "{77, 1}, {16, {1, 2}}" """
    ce = ce.strip()
    if ce in ('{}', '{{}}'):
        return '[]'
    items = re.findall(r'effect_type\s*=\s*(\d+)\s*,\s*val\s*=\s*\{(.*?)\}\s*\}', ce)
    parts = []
    for et, val in items:
        val = val.strip()
        if val.startswith('{') and val.endswith('}'):
            inner = val[1:-1].strip()
            nums = [x.strip() for x in inner.split(',') if x.strip()]
            if nums and all(re.fullmatch(r'-?\d+', x) for x in nums):
                if len(nums) == 1:
                    v = nums[0]
                else:
                    v = '{%s}' % ', '.join(nums)
            else:
                v = '{%s}' % inner
        else:
            v = val
        parts.append('{%s, %s}' % (et, v))
    return '[' + ', '.join(parts) + ']' if parts else '[]'


def esc(s):
    return s.replace('\\', '\\\\').replace('"', '\\"')


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('--install', action='store_true')
    args = ap.parse_args()

    old = parse_client(CLIENT_2021)
    new = parse_client(CLIENT_2025)
    have = parse_server_ids(SERVER_ITEM)
    added = sorted(set(new) - set(old))
    print('2025 new ids:', len(added))

    rows, skipped = [], {'type': 0, 'short': 0, 'exists': 0, 'bad': 0}
    for iid in added:
        f = new[iid]
        if len(f) < 16:
            skipped['short'] += 1
            continue
        try:
            typ, qual, overlap = int(f[4]), int(f[5]), int(f[7])
            sex, expire_type = int(f[15]), int(f[14])
        except ValueError:
            skipped['bad'] += 1
            continue
        if typ in SKIP_TYPES:
            skipped['type'] += 1
            continue
        if iid in have:
            skipped['exists'] += 1
            continue
        name = f[1].strip().strip('"')
        if not name:
            skipped['bad'] += 1
            continue
        effect = parse_effect(f[10]) if len(f) > 10 else '[]'
        rows.append(dict(id=iid, name=name, type=typ, quality=max(1, min(qual, 5)),
                         overlap=overlap if overlap > 0 else 1, sex=sex if sex in (0, 1, 2) else 2,
                         expire_type=expire_type, effect=effect))

    print('to add:', len(rows), 'skipped:', skipped)
    os.makedirs(OUT, exist_ok=True)

    item_lines = []
    for r in rows:
        item_lines.append(
            'get(%d) ->\n'
            '    #item_base{id = %d, name = lang:get("%s"),\n'
            '               type = %d, quality = %d, overlap = %d, use_type = 1,\n'
            '               expire_type = %d, effect = %s, lev = 1,\n'
            '               classes = 0, sex = %d, alchemy = 0};\n'
            % (r['id'], r['id'], esc(r['name']), r['type'], r['quality'],
               r['overlap'], r['expire_type'], r['effect'], r['sex']))

    shop_lines = []
    base_sort = 5000
    for n, r in enumerate(rows):
        price = PRICE_BY_QUALITY.get(r['quality'], 800)
        shop_lines.append(
            '     #shop_item{id = %d, base_id = %d,\n'
            '                name = lang:get("%s"), num = 1, bind = 1, sex = 2,\n'
            '                classes = 0, lev = 1, max_lev = 200,\n'
            '                assets_type = gold, price = %d, tab = %d,\n'
            '                tab2 = %d, limit_type = normal, limit_role = -1,\n'
            '                label = 0, sort = %d, min_break = 0, max_break = 99},\n'
            % (900000 + n, r['id'], esc(r['name']), price, SHOP_TAB, SHOP_TAB2, base_sort + n))

    open(os.path.join(OUT, 'items.erl'), 'w', encoding='utf-8').write(''.join(item_lines))
    open(os.path.join(OUT, 'shop.erl'), 'w', encoding='utf-8').write(''.join(shop_lines))
    with open(os.path.join(OUT, 'report.txt'), 'w', encoding='utf-8') as fh:
        fh.write('new=%d added=%d skipped=%s\n' % (len(added), len(rows), skipped))
        for r in rows[:40]:
            fh.write('%d\t%s\ttype=%d\tq=%d\t%s\n' % (r['id'], r['name'], r['type'], r['quality'], r['effect']))
    print('wrote', OUT)


if __name__ == '__main__':
    sys.exit(main())
