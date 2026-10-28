#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""Attach existing trigger scripts to the 2025 passives and fix skill step.

Only mechanics with an existing script are mapped here. Parameters that the
description states (chance / heal ratio / damage share) are passed exactly;
hidden per-stat distributions are approximated. Unique 2025 mechanics
(shields, damage share, stacking auras, ...) remain for the script phase.
"""
import os
import re
import shutil
import subprocess
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
SRC = os.path.join(ROOT, 'YCserver', 'erl_src')
EBIN = os.path.join(ROOT, 'YCserver', 'data', 'server', 'ebin')
BUILD = os.path.join(ROOT, 'tmp', 'build_triggers')
ERLC = os.path.join(ROOT, 'tmp', 'erlang19', 'bin', 'erlc.exe')
ERL = os.path.join(ROOT, 'tmp', 'erlang19', 'bin', 'erl.exe')

MAGIC_SKILLS = [60011, 60012, 60013, 60014, 60015, 60016, 60065, 60066, 60069,
                60074, 60068, 160084, 160085, 160087, 160088, 60090, 60092,
                60505, 60508, 60518, 60523, 60528, 60529, 60532, 60550, 60551,
                60552, 60553, 60590, 67075, 67200, 67316, 67334, 67343, 67358,
                67363]

ATTACK = {60590, 60603, 67075, 67085, 67110, 67130, 67131, 67200, 67309,
          67316, 67330, 67334, 67338, 67343, 67348, 67353, 67358, 67363,
          67368, 67378}
SUPPORT_ACTIVE = {67074, 67113, 67114, 67117, 67118, 67119}

# sid -> (template id, script_args, {buff_id: (duration or None, args or None)})
TRIGGERS = {
    60282: (60026, [610, 550, 1000], None, None),
    60283: (60027, [400, 350, 0, 75], None, None),
    60285: (60029, [140, 180, 220, 280, 1000, 0], None, None),
    60286: (60030, [490, 0, 150], None, None),
    60288: (60032, [350, 650], None, None),
    60290: (60034, [580, [60011, 60012, 60013], 1], None, None),
    60291: (60035, [500, 300, 100], None, None),
    60301: (60045, [350], None, None),
    60302: (60046, [1000, 80], None, None),
    60304: (60048, [380], {70012: (2, [100])}, None),
    60311: (60055, [330], None, None),
    60326: (60080, [150, 1700, 650], None, None),
    60444: (60001, [400], None, None),
    60447: (60041, [400, MAGIC_SKILLS, 1300], None, None),
    60449: (60054, [800, 800, 800, 800], None, None),
    61064: (60038, [1000, 150], None, None),
    67038: (60006, [1000, 1000], {70008: (3, None)}, None),
    67081: (60041, [800, MAGIC_SKILLS, 1000], None, None),
    67087: (60037, [500, 0, 1800, 1800], None, None),
    67332: (60037, [600, 0, 1350, 1350], None, None),
    67339: (60037, [700, 0, 1200, 1200], None, None),
    67349: (60037, [1000, 0, 1000, 1000], None, None),
    67352: (60001, [100], None, None),
    67354: (60001, [280], None, None),
    67355: (60006, [200, 200], {70008: (5, None)}, None),
    67357: (60001, [350], None, None),
    67362: (60001, [300], None, 60058),
    67364: (60001, [300], None, 60058),
    67367: (60001, [300], None, 60058),
    67370: (60037, [300, 0, 700, 700], None, None),
    67372: (60001, [350], None, None),
    67379: (60037, [400, 0, 1800, 1800], None, None),
}


def read(p):
    with open(p, encoding='utf-8', newline='') as f:
        return f.read()


def write(p, s):
    os.makedirs(os.path.dirname(p), exist_ok=True)
    with open(p, 'w', encoding='utf-8', newline='') as f:
        f.write(s)


def erl(v):
    if isinstance(v, list):
        return '[' + ', '.join(erl(x) for x in v) + ']'
    return str(v)


def combat_blocks(src):
    return {int(m.group(1)): m.group(0) for m in re.finditer(
        r'get_combat\(\{(\d+), 1\}\) ->\n.*?(?=\nget_combat\(|\Z)', src, re.S)}


def template_body(src, tid):
    m = re.search(r'get_combat\(\{%d, 1\}\) ->\n(.*?)(?=\nget_combat\(|\Z)' % tid, src, re.S)
    if not m:
        raise SystemExit('missing combat template %d' % tid)
    body = m.group(1).rstrip()
    return body[:-1].rstrip() if body.endswith(';') else body


def replace_list_field(body, key, value):
    m = re.search(r'\b%s\s*=\s*\[' % key, body)
    if not m:
        return body
    start = m.end() - 1
    depth = 0
    for i in range(start, len(body)):
        if body[i] == '[':
            depth += 1
        elif body[i] == ']':
            depth -= 1
            if depth == 0:
                return body[:start] + value + body[i + 1:]
    raise SystemExit('unbalanced %s' % key)


def replace_buff(body, buff_id, duration, args):
    pat = re.compile(r'(\{%d,\s*\d+,\s*)(\d+)(,\s*\d+,\s*)\[([^\]]*)\]' % buff_id)
    m = pat.search(body)
    if not m:
        raise SystemExit('buff %d not in template' % buff_id)
    dur = str(duration) if duration is not None else m.group(2)
    arg = erl(args) if args is not None else '[' + m.group(4) + ']'
    return body[:m.start()] + m.group(1) + dur + m.group(3) + arg + body[m.end():]


def make_clause(src, sid, name, tpl, args, buffs, script_override=None):
    body = template_body(src, tpl)
    body = re.sub(r'\bid = \d+', 'id = %d' % sid, body, count=1)
    body = re.sub(r'name = lang:get\("[^"]*"\)',
                  'name = lang:get("%s")' % name.replace('"', '\\"'), body, count=1)
    if script_override is not None:
        body = re.sub(r'script_id = \d+', 'script_id = %d' % script_override, body, count=1)
    if args is not None:
        body = replace_list_field(body, 'script_args', erl(args))
    if buffs:
        for bid, (dur, barg) in buffs.items():
            body = replace_buff(body, bid, dur, barg)
    return 'get_combat({%d, 1}) ->\n    %s;' % (sid, body)


def main():
    apply = '--apply' in sys.argv
    skill_src = read(os.path.join(SRC, 'skill_data.erl'))
    our_ids = []
    for sid in (int(x) for x in re.findall(r'get_pet\(\{(\d+), 1\}\) ->', skill_src)):
        m = re.search(r'get_pet\(\{%d, 1\}\) ->\n    #pet_base_skill\{.*?type = (\d+)' % sid, skill_src, re.S)
        if m and int(m.group(1)) >= 1000:
            our_ids.append(sid)
    combat_src = read(os.path.join(SRC, 'skill_combat_data.erl'))
    blocks = combat_blocks(combat_src)
    new_combat = combat_src
    for sid, (tpl, args, buffs, script_override) in sorted(TRIGGERS.items()):
        name = re.search(r'get_pet\(\{%d, 1\}\) ->\n    #pet_base_skill\{.*?name = lang:get\("([^"]*)"\)' % sid,
                         skill_src, re.S)
        clause = make_clause(combat_src, sid, name.group(1) if name else str(sid), tpl, args, buffs, script_override)
        if sid in blocks:
            new_combat = new_combat.replace(blocks[sid], clause, 1)
        else:
            new_combat = new_combat.replace('get_combat(_) -> false.\n',
                                            clause + '\n' + 'get_combat(_) -> false.\n', 1)
    active = ATTACK | SUPPORT_ACTIVE
    removed = []
    for sid in sorted(our_ids):
        if sid in TRIGGERS or sid in ATTACK:
            continue
        if sid in blocks:
            new_combat = new_combat.replace(blocks[sid] + '\n', '', 1)
            removed.append(sid)
    print('mapped triggers:', len(TRIGGERS), 'removed wrong combat:', len(removed))
    if not apply:
        print('dry-run; rerun with --apply')
        return

    # fix step: 1 for passive/trigger, 2 for active casts
    new_skill = skill_src
    for sid in our_ids:
        m = re.search(r'get_pet\(\{%d, 1\}\) ->\n    #pet_base_skill\{.*?\};' % sid, new_skill, re.S)
        if not m:
            continue
        block = m.group(0)
        step = 2 if sid in active else 1
        nb = re.sub(r'\bstep = \d+', 'step = %d' % step, block, count=1)
        if nb != block:
            new_skill = new_skill.replace(block, nb, 1)

    os.makedirs(BUILD, exist_ok=True)
    for mod, base, patched in (('skill_data', skill_src, new_skill),
                               ('skill_combat_data', combat_src, new_combat)):
        for stage, text in (('baseline', base), ('patched', patched)):
            d = os.path.join(BUILD, mod, stage)
            os.makedirs(d, exist_ok=True)
            path = os.path.join(d, mod + '.erl')
            write(path, text)
            r = subprocess.run([ERLC, '-o', d, path], capture_output=True, text=True,
                               encoding='utf-8', errors='replace')
            if r.returncode:
                print(r.stdout, r.stderr)
                raise SystemExit('compile failed %s %s' % (mod, stage))
        keys = os.path.join(BUILD, mod + '.keys')
        subprocess.run([sys.executable, os.path.join(ROOT, 'tmp', 'make_keys.py'),
                        os.path.join(ROOT, 'tmp', 'build', 'src', mod + '.erl'), keys],
                       check=True, stdout=subprocess.DEVNULL)
        out = erl_eval('verify_beam:run("%s","%s","%s")' % (
            os.path.join(EBIN, mod + '.beam').replace('\\', '/'),
            os.path.join(BUILD, mod, 'patched', mod + '.beam').replace('\\', '/'),
            keys.replace('\\', '/')))
        print(next((l for l in out.split('\n') if 'compared' in l), out[:500]))
        if '0 diffs' not in out:
            print(out[:3000])
            raise SystemExit('verify failed %s' % mod)
        shutil.copy2(os.path.join(BUILD, mod, 'patched', mod + '.beam'),
                     os.path.join(EBIN, mod + '.beam'))
        write(os.path.join(SRC, mod + '.erl'), patched)
    nodes = running_nodes()
    if nodes:
        expr = ('Ns=%s, R=[{N,rpc:call(N,code,soft_purge,[skill_data]),'
                'rpc:call(N,code,load_file,[skill_data]),rpc:call(N,code,soft_purge,[skill_combat_data]),'
                'rpc:call(N,code,load_file,[skill_combat_data])} || N <- Ns],'
                'io:format("~p~n",[R]),init:stop().' % str(nodes))
        print(erl_eval(expr)[:2500])


def erl_eval(expr):
    r = subprocess.run([ERL, '+S1:1', '-noshell',
                        '-sname', 'trigref_%d_%s' % (os.getpid(), abs(hash(expr)) % 9999),
                        '-setcookie', '6bc1t325xjo21c1',
                        '-pa', os.path.join(ROOT, 'tmp', 'build', 'out'), '-pa', EBIN,
                        '-eval', expr], capture_output=True, text=True,
                       encoding='utf-8', errors='replace', timeout=1200)
    return (r.stdout or '') + (r.stderr or '')


def running_nodes():
    epmd = next((p for p in [os.path.join(ROOT, 'tmp', 'erlang19', 'bin', 'epmd.exe'),
                             os.path.join(ROOT, 'tmp', 'erlang19', 'erts-8.3', 'bin', 'epmd.exe')]
                 if os.path.exists(p)), None)
    if epmd is None:
        return []
    out = subprocess.run([epmd, '-names'], capture_output=True, text=True,
                         encoding='utf-8', errors='replace').stdout
    names = []
    for line in out.splitlines():
        parts = line.split()
        if len(parts) >= 2 and parts[0] == 'name':
            names.append(parts[1] + '@cll')
    return [n for n in names if n.startswith('fswy_')]


if __name__ == '__main__':
    main()
