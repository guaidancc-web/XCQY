#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""Point the first-recharge window at the 2025 privilege tiers.

The 2025 data_privilege is authored at 1 RMB = 10000 diamonds; the server
uses 1:10, so the five milestone tiers are scaled by 1000 to
980/35000/70000/175000/345000 diamonds.
"""
import os
import shutil

import UnityPy

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
SRC = os.path.join(ROOT, 'dist', 'textures_business.unity3d')
OUT_DIR = os.path.join(ROOT, 'tmp', 'bundle_2025_firstrecharge')

OLD = 'self.levelList = {980000,35000000,70000000,175000000,345000000}'
NEW = 'self.levelList = {980,35000,70000,175000,345000}'


def main():
    env = UnityPy.load(SRC)
    done = 0
    for obj in env.objects:
        if obj.type.name != 'TextAsset':
            continue
        d = obj.read()
        if str(d.m_Name) != 'firstrecharge_develop_window':
            continue
        text = d.m_Script
        if isinstance(text, bytes):
            text = text.decode('utf-8-sig', 'ignore')
        if text.count(OLD) != 1:
            raise SystemExit('levelList not found')
        d.m_Script = text.replace(OLD, NEW, 1)
        d.save()
        done += 1
    if done != 1:
        raise SystemExit('expected 1 firstrecharge_develop_window, got %d' % done)

    if os.path.isdir(OUT_DIR):
        shutil.rmtree(OUT_DIR)
    os.makedirs(OUT_DIR)
    for f in env.files.values():
        f.is_changed = True
    env.save(pack='lz4', out_path=OUT_DIR)
    produced = next(os.path.join(OUT_DIR, f) for f in os.listdir(OUT_DIR)
                    if f.endswith('.unity3d'))
    out = os.path.join(OUT_DIR, 'textures_business.unity3d')
    if produced != out:
        shutil.move(produced, out)
    shutil.copy2(out, SRC)
    print('patched firstrecharge levelList ->', SRC)


if __name__ == '__main__':
    main()
