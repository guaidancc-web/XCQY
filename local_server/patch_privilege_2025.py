#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""Replace the 2025 client's data_privilege with the 2021 table.

The 2025 table switched min/max to a new unit (min = 980000...), while the
first-recharge window and the server's privilege_data still use the 2021
thresholds (60/1000/2000/10000/30000).  With the 2025 table the window
finds no matching section and renders an empty content area.
"""
import os
import shutil

import UnityPy

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
SRC = os.path.join(ROOT, 'dist', 'textures_business_data.unity3d')
REF = os.path.join(ROOT, 'lua_decoded', 'data', 'data_privilege.lua')
OUT_DIR = os.path.join(ROOT, 'tmp', 'data_2025_privilege')


def main():
    ref = open(REF, encoding='utf-8-sig').read()
    env = UnityPy.load(SRC)
    done = 0
    for obj in env.objects:
        if obj.type.name != 'TextAsset':
            continue
        d = obj.read()
        if str(d.m_Name) != 'data_privilege':
            continue
        d.m_Script = ref
        d.save()
        done += 1
    if done != 1:
        raise SystemExit('expected 1 data_privilege, got %d' % done)

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
    print('patched data_privilege ->', SRC)


if __name__ == '__main__':
    main()
