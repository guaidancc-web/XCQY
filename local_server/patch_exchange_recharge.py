#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""Patch the 2025 client data bundle:

- data_exchange: keep the 2025 exchange tiers but restore gift_ratio values
  from the 2021 table, so the "赠送" column shows and pays out again.
- data_recharge: restore the official 1 RMB = 10 diamond tiers for platform 0
  (the 2025 table ships a 1:10000 shop that never matches the server's
  recharge activity data).
"""
import os
import re
import shutil

import UnityPy

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
SRC = os.path.join(ROOT, 'dist', 'textures_business_data.unity3d')
REF_EXCHANGE = os.path.join(ROOT, 'lua_decoded', 'data', 'data_exchange.lua')
REF_RECHARGE = os.path.join(ROOT, 'lua_decoded', 'data', 'data_recharge.lua')
OUT_DIR = os.path.join(ROOT, 'tmp', 'data_2025_exchange')


def load_text(name, path):
    t = open(path, encoding='utf-8-sig').read()
    return t


def parse_gift_ratios(text):
    block = text.split('DataExchange.data_extra = {', 1)[1]
    block = block.split('\n}', 1)[0]
    out = {}
    for key, val in re.findall(r'\["([\d_]+)"\] = \{gift_ratio = (\d+)\}', block):
        out[key] = int(val)
    return out


def parse_platform0_recharge(text):
    m = re.search(r'\[0\] = \{platform_label = 0, rmb2Glod = (\{[^\n]*?\})\}', text)
    return m.group(1)


def patch_exchange(text, ratios):
    block_start = text.index('DataExchange.data_extra = {')
    head, tail = text[:block_start], text[block_start:]
    block_end = tail.index('\n}')
    block, rest = tail[:block_end], tail[block_end:]
    replaced = 0
    missing = []

    def repl(m):
        nonlocal replaced
        key = m.group(1)
        if key in ratios:
            replaced += 1
            return '["%s"] = {gift_ratio = %d}' % (key, ratios[key])
        missing.append(key)
        return m.group(0)

    block = re.sub(r'\["([\d_]+)"\] = \{gift_ratio = \d+\}', repl, block)
    return head + block + rest, replaced, missing


def patch_recharge(text, new_tiers):
    new, n = re.subn(r'\[0\] = \{platform_label = 0, rmb2Glod = \{[^\n]*?\}\}',
                     '[0] = {platform_label = 0, rmb2Glod = %s}' % new_tiers,
                     text)
    return new, n


def main():
    ref_ratios = parse_gift_ratios(load_text('data_exchange', REF_EXCHANGE))
    ref_tiers = parse_platform0_recharge(load_text('data_recharge', REF_RECHARGE))
    print('2021 gift keys:', len(ref_ratios))
    print('2021 platform0 tiers:', ref_tiers)

    env = UnityPy.load(SRC)
    done = []
    for obj in env.objects:
        if obj.type.name != 'TextAsset':
            continue
        d = obj.read()
        name = str(d.m_Name)
        if name == 'data_exchange':
            text = d.m_Script
            if isinstance(text, bytes):
                text = text.decode('utf-8-sig', 'ignore')
            new, n, missing = patch_exchange(text, ref_ratios)
            if missing:
                raise SystemExit('gift keys missing in 2021 table: %s' % missing[:10])
            d.m_Script = new
            d.save()
            done.append((name, n))
        elif name == 'data_recharge':
            text = d.m_Script
            if isinstance(text, bytes):
                text = text.decode('utf-8-sig', 'ignore')
            new, n = patch_recharge(text, ref_tiers)
            if n != 1:
                raise SystemExit('data_recharge platform0 not patched (%d)' % n)
            d.m_Script = new
            d.save()
            done.append((name, n))

    if len(done) != 2:
        raise SystemExit('expected data_exchange + data_recharge, got %s' % (done,))

    if os.path.isdir(OUT_DIR):
        shutil.rmtree(OUT_DIR)
    os.makedirs(OUT_DIR)
    for f in env.files.values():
        f.is_changed = True
    env.save(pack='lz4', out_path=OUT_DIR)
    produced = next(os.path.join(OUT_DIR, f) for f in os.listdir(OUT_DIR)
                    if f.endswith('.unity3d'))
    out = os.path.join(OUT_DIR, 'textures_business_data.unity3d')
    if produced != out:
        shutil.move(produced, out)
    shutil.copy2(out, SRC)
    print('patched', done, '->', SRC)


if __name__ == '__main__':
    main()
