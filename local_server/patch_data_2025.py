#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""Show the 2022-2025 special pets in the 2025 pet manual.

The 2025 data bundle sets show_manual = 0 for 20022-20039 and 20041-20069,
which hides them from PetView_Manual. Flip it to 1 for those ids and write a
patched textures_business_data.unity3d.
"""
import os
import re
import shutil

import UnityPy

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
SOURCES = [
    os.path.join(ROOT, 'tmp', 'updated_client', 'business_data_2025.unity3d'),
    os.path.join(ROOT, 'cdn', 'patch_android', '202506251639', 'textures', 'textures_business_data.unity3d'),
]
OUT_DIR = os.path.join(ROOT, 'tmp', 'data_2025_patched')
DIST = os.path.join(ROOT, 'dist', 'textures_business_data.unity3d')
TARGETS = [i for i in range(20022, 20040)] + [i for i in range(20041, 20070)]


def pick_source():
    for p in SOURCES:
        if os.path.isfile(p) and os.path.getsize(p) > 0:
            return p
    raise SystemExit('缺少 2025 data bundle（先让客户端更新一次，或用 cdn/ 里的缓存）')


def get_data_pet(env):
    for obj in env.objects:
        if obj.type.name == 'TextAsset':
            d = obj.read()
            if str(d.m_Name) == 'data_pet':
                return obj, d
    raise SystemExit('data_pet TextAsset not found')


def main():
    src = pick_source()
    env = UnityPy.load(src)
    obj, data = get_data_pet(env)
    text = data.m_Script
    if isinstance(text, bytes):
        text = text.decode('utf-8')
    present = set()
    for line in text.split('\n'):
        m = re.match(r'\t\[(\d+)\] = \{id = \1,', line)
        if m and int(m.group(1)) in TARGETS:
            present.add(int(m.group(1)))
    changed = 0
    touched = []
    out_lines = []
    for line in text.split('\n'):
        m = re.match(r'\t\[(\d+)\] = \{id = \1,', line)
        if m and int(m.group(1)) in present:
            pid = int(m.group(1))
            new, n = re.subn(r'show_manual = 0', 'show_manual = 1', line, count=1)
            if n:
                changed += 1
                touched.append(pid)
                line = new
        out_lines.append(line)
    if changed != len(present):
        missing = sorted(present - set(touched))
        raise SystemExit('show_manual patched %d/%d, missing %s' % (changed, len(present), missing))
    data.m_Script = '\n'.join(out_lines)
    data.save()

    if os.path.isdir(OUT_DIR):
        shutil.rmtree(OUT_DIR)
    os.makedirs(OUT_DIR)
    for f in env.files.values():
        f.is_changed = True
    env.save(pack='lz4', out_path=OUT_DIR)
    produced = next(os.path.join(OUT_DIR, f) for f in os.listdir(OUT_DIR) if f.endswith('.unity3d'))
    out = os.path.join(OUT_DIR, 'textures_business_data.unity3d')
    if produced != out:
        os.replace(produced, out)
    shutil.copy2(out, DIST)

    # verify: reopen and count visible target ids inside the data_pet block only
    env2 = UnityPy.load(out)
    _, d2 = get_data_pet(env2)
    txt = d2.m_Script
    if isinstance(txt, bytes):
        txt = txt.decode('utf-8')
    a = txt.find('DataPet.data_pet = {')
    b = txt.find('DataPet.data_pet_grade = {', a)
    visible = set()
    for m in re.finditer(r'(?m)^\t\[(\d+)\] = \{id = \1,.*$', txt[a:b]):
        pid = int(m.group(1))
        if pid in TARGETS and re.search(r'show_manual = 1', m.group(0)):
            visible.add(pid)
    print('source:', src)
    print('patched show_manual for', changed, 'pets')
    print('wrote', out, os.path.getsize(out), 'bytes')
    print('dist   ', DIST)
    print('visible targets:', len(visible), 'missing:', sorted(set(TARGETS) - visible))


if __name__ == '__main__':
    main()
