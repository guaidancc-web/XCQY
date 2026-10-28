#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""Generate + install the server-side data patch that adds the 18 pets
(20022-20039) and 19 pet skills the client bundle knows about but the
original YCserver beams are missing.

Stages: generate -> compile -> differential verify -> install -> hot-load.
"""
import os, re, shutil, subprocess, sys, json

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
SRC = os.path.join(ROOT, 'YCserver', 'erl_src')
EBIN = os.path.join(ROOT, 'YCserver', 'data', 'server', 'ebin')
BUILD = os.path.join(ROOT, 'tmp', 'build')
BACKUP = os.path.join(ROOT, 'tmp', 'beam_backup')
ERLC = os.path.join(ROOT, 'tmp', 'erlang19', 'bin', 'erlc.exe')
ERL = os.path.join(ROOT, 'tmp', 'erlang19', 'bin', 'erl.exe')
PET_LUA = os.path.join(ROOT, 'tmp', 'data_pet_bundle.lua')
SKILL_LUA = os.path.join(ROOT, 'tmp', 'data_skill_bundle.lua')

NEW_PETS = list(range(20022, 20040))
NEW_SKILLS = [60561, 60562, 60563, 60564, 60565, 60566, 60567, 60568, 60569,
              60570, 60571, 60572, 60573, 60574, 60575, 60586, 60587, 60662, 60663]

# pet skill -> existing server skill whose numbers/combat behaviour we inherit
SKILL_ALIAS = {
    60561: 60014, 60562: 60089, 60563: 60073, 60564: 60089, 60565: 60089,
    60566: 60521, 60567: 60508, 60568: 60101, 60569: 60089, 60570: 60505,
    60571: 60504, 60572: 60014, 60573: 60089, 60574: 60089, 60575: 60077,
    60586: 60016, 60587: 60089, 60662: 60073, 60663: 60089,
}
# 60xxx block "type" continues the dense counter; last server value is 60560:134
SKILL_TYPE = {sid: 135 + i for i, sid in enumerate(NEW_SKILLS)}


def read(p):
    with open(p, encoding='utf-8', newline='') as f:
        return f.read()


def write(p, s):
    os.makedirs(os.path.dirname(p), exist_ok=True)
    with open(p, 'w', encoding='utf-8', newline='') as f:
        f.write(s)


# ---------------------------------------------------------------- client data
def lua_field(body, key):
    """Scalar value of `key = ...` in a single-level Lua table body."""
    m = re.search(r'(?:^|[{,])\s*%s = ' % re.escape(key), body)
    if not m:
        return None
    i = m.end()
    if body.startswith('{', i):
        depth, j = 0, i
        while j < len(body):
            if body[j] == '{':
                depth += 1
            elif body[j] == '}':
                depth -= 1
                if depth == 0:
                    return body[i:j + 1]
            j += 1
        raise ValueError('unbalanced table for ' + key)
    end = body.find(',', i)
    return body[i:end if end >= 0 else len(body)].strip()


def read_lua(p):
    with open(p, 'rb') as f:
        return f.read().decode('utf-8').replace('\r\n', '\n')


def parse_client_pets():
    txt = read_lua(PET_LUA)
    out = {}
    for pid in NEW_PETS:
        m = re.search(r'^\t\[%d\] = \{(.*?)\},\n(?=\t\[)' % pid, txt, re.M | re.S)
        if not m:
            m = re.search(r'^\t\[%d\] = \{(.*?)\},\n' % pid, txt, re.M | re.S)
        body = '{' + m.group(1) + '}'
        scal = lambda k, d=None: (lua_field(body, k) or d)
        nums = lambda s: [int(x) for x in re.findall(r'\d+', s or '')]
        pairs = lambda s: [(int(a), int(b)) for a, b in re.findall(r'\{(\d+),\s*(\d+)\}', s or '')]
        out[pid] = dict(
            name=scal('name').strip('"'),
            type=int(scal('type')), genre=int(scal('genre')),
            phy=int(scal('phy_aptitude')), pdef=int(scal('pdef_aptitude')),
            hp=int(scal('hp_aptitude')), magic=int(scal('magic_aptitude')),
            aspd=int(scal('aspd_aptitude')),
            base_skills=pairs(scal('base_skills')),
            need_lev_break=int(scal('need_lev_break', '0')),
            has_break=int(scal('has_break_skill', '1')),
            lev_break=nums(scal('lev_break_skills')),
            cost=pairs(scal('cost')), lev_break_cost=pairs(scal('lev_break_cost')),
            max_wash=int(scal('max_wash_time', '0')),
            growth=int(scal('growth_red')),
            model=scal('model_id'), model1=scal('model_id1'),
            model2=scal('model_id2'), model3=scal('model_id3'),
            skin0=scal('skin_id_0'), skin1=scal('skin_id_1'),
            skin2=scal('skin_id_2'), skin3=scal('skin_id_3'),
            ss0=scal('skin_id_s0'), ss1=scal('skin_id_s1'),
            ss2=scal('skin_id_s2'), ss3=scal('skin_id_s3'),
            manual_level=int(scal('manual_level', '1')),
        )
    return out


def parse_client_skill_names():
    txt = read_lua(SKILL_LUA)
    names = {}
    for m in re.finditer(r'\[\[{(\d+),(\d+),"(.*?)",(\d+),(\d+),(\d+),', txt):
        names.setdefault(int(m.group(1)), m.group(3))
    return names


# ------------------------------------------------------------- server sources
def clause_block(src, head_re):
    """Return {key_tuple: block_text} for a run of single-line clause heads."""
    heads = [(m.start(), m.group(0)) for m in re.finditer(head_re, src, re.M)]
    out = {}
    for i, (pos, head) in enumerate(heads):
        end = heads[i + 1][0] if i + 1 < len(heads) else src.find('\n\n', pos)
        keys = tuple(int(x) for x in re.findall(r'\d+', re.match(r'^[a-z_0-9]+\((.*?)\)\s*->', head).group(1)))
        out[keys] = src[pos:end].rstrip('\n')
    return out


def erl_list(nums, indent, per_line=1):
    if not nums:
        return '[]'
    if per_line == 1:
        return '[\n' + indent + (',\n' + indent).join(str(n) for n in nums) + ']'
    rows = [', '.join(str(n) for n in nums[i:i + per_line]) for i in range(0, len(nums), per_line)]
    return '[\n' + indent + (',\n' + indent).join(rows) + ']'


def erl_pair_list(pairs, indent):
    if not pairs:
        return '[]'
    return '[\n' + indent + (',\n' + indent).join('{%d, %d}' % p for p in pairs) + ']'


def build_pet_clauses(pets, tpl):
    """tpl: dict of template text pieces pulled from an existing genre-2 pet."""
    base, ratio, polish, model = [], [], [], []
    for pid in NEW_PETS:
        p = pets[pid]
        vs = [int(x) for x in re.findall(r'\d+', tpl['vari_skills'])]
        rec = (
            "get_base(%d) ->\n"
            "    #pet_base{id = %d, name = lang:get(\"%s\"), type = %d,\n"
            "              genre = %d, phy_aptitude = %d, pdef_aptitude = %d,\n"
            "              hp_aptitude = %d, magic_aptitude = %d,\n"
            "              aspd_aptitude = %d, base_happy = %s,\n"
            "              min_happy_ratio = %s, max_happy_ratio = %s,\n"
            "              min_happy_genre_ratio = %s,\n"
            "              max_happy_genre_ratio = %s,\n"
            "              base_skills = %s,\n"
            "              vari_skills = %s,\n"
            "              has_break_skill = %d, lev_break_skills = %s,\n"
            "              cost = %s, lev_break_cost = %s,\n"
            "              max_wash_time = %d, growth_blue = %d,\n"
            "              growth_purple = %d, growth_orange = %d,\n"
            "              growth_red = %d, model_id = %s, model_id1 = %s,\n"
            "              model_id2 = %s, model_id3 = %s, skin_id_0 = %s,\n"
            "              skin_id_1 = %s, skin_id_2 = %s, skin_id_3 = %s,\n"
            "              skin_id_s0 = %s, skin_id_s1 = %s,\n"
            "              skin_id_s2 = %s, skin_id_s3 = %s,\n"
            "              need_lev_break = %d, manual_level = %d};\n"
        ) % (pid, pid, p['name'], p['type'], p['genre'], p['phy'], p['pdef'],
             p['hp'], p['magic'], p['aspd'], tpl['base_happy'],
             tpl['min_happy_ratio'], tpl['max_happy_ratio'],
             tpl['min_happy_genre_ratio'], tpl['max_happy_genre_ratio'],
             erl_pair_list(p['base_skills'], '                  '),
             erl_list(vs, '                  '),
             p['has_break'], erl_list(p['lev_break'], '                  ', 5),
             erl_pair_list(p['cost'], '                  '),
             erl_pair_list(p['lev_break_cost'], '                  '),
             p['max_wash'], p['growth'], p['growth'], p['growth'], p['growth'],
             p['model'], p['model1'], p['model2'], p['model3'],
             p['skin0'], p['skin1'], p['skin2'], p['skin3'],
             p['ss0'], p['ss1'], p['ss2'], p['ss3'],
             p['need_lev_break'], p['manual_level'])
        base.append(rec)
        model.append('model(%d) -> %s;\n' % (pid, p['model']))
        ratio.append('get_base_ratio(%d) -> {0, 0, 0, 0, 0, 0, 0};\n' % pid)
        polish.append('get_polish(%d) -> [{20006, 5}, {20618, 2}];\n' % pid)
    return ''.join(base), ''.join(model), ''.join(ratio), ''.join(polish)


def build_stone_clauses(stone_tpl_lines):
    """allow_stone cloned from the 20021 block with the id substituted."""
    out = []
    for pid in NEW_PETS:
        for line in stone_tpl_lines:
            out.append(re.sub(r'\{20021,', '{%d,' % pid, line))
    return ''.join(l + '\n' for l in out)


def insert_before(src, catchall, text):
    i = src.index(catchall)
    return src[:i] + text + src[i:]


def build_skill_clauses(skill_data_src, names):
    blocks = clause_block(skill_data_src, r'^get_pet\(\{\d+, 1\}\) ->')
    out = []
    for sid in NEW_SKILLS:
        alias = SKILL_ALIAS[sid]
        ablock = blocks.get((alias, 1))
        if not ablock:
            raise SystemExit('no template get_pet for %d' % alias)
        body = re.search(r'#pet_base_skill\{.*?\};', ablock, re.S).group(0)
        body = re.sub(r'id = \d+', 'id = %d' % sid, body, count=1)
        body = re.sub(r'name = lang:get\(".*?"\)', 'name = lang:get("%s")' % names[sid], body, count=1)
        body = re.sub(r'type = \d+', 'type = %d' % SKILL_TYPE[sid], body, count=1)
        out.append('get_pet({%d, 1}) ->\n    %s\n' % (sid, body))
    return ''.join(out)


def build_combat_clauses(combat_src, names):
    blocks = clause_block(combat_src, r'^get_combat\(\{\d+, 1\}\) ->')
    out = []
    for sid in NEW_SKILLS:
        alias = SKILL_ALIAS[sid]
        ablock = blocks.get((alias, 1))
        if not ablock:
            raise SystemExit('no template get_combat for %d (alias %d)' % (sid, alias))
        body = re.search(r'#skill\{.*?\};', ablock, re.S).group(0)
        body = re.sub(r'id = \d+', 'id = %d' % sid, body, count=1)
        body = re.sub(r'name = lang:get\(".*?"\)', 'name = lang:get("%s")' % names[sid], body, count=1)
        out.append('get_combat({%d, 1}) ->\n    %s\n' % (sid, body))
    return ''.join(out), blocks


def main():
    install = '--install' in sys.argv
    os.makedirs(BUILD, exist_ok=True)
    os.makedirs(os.path.join(BUILD, 'src'), exist_ok=True)
    os.makedirs(os.path.join(BUILD, 'out'), exist_ok=True)
    os.makedirs(BACKUP, exist_ok=True)

    pet_txt = read(os.path.join(SRC, 'pet_data.erl'))
    skill_txt = read(os.path.join(SRC, 'skill_data.erl'))
    combat_txt = read(os.path.join(SRC, 'skill_combat_data.erl'))

    pets = parse_client_pets()
    names = parse_client_skill_names()
    missing_names = [s for s in NEW_SKILLS if s not in names]
    if missing_names:
        raise SystemExit('client skill names missing: %s' % missing_names)

    tpl_blocks = clause_block(pet_txt, r'^get_base\(\d+\) ->')
    tpl_raw = tpl_blocks[(20021,)]
    tpl = {'vari_skills': re.search(r'vari_skills =\s*\[(.*?)\]', tpl_raw, re.S).group(1)}
    for k in ['base_happy', 'min_happy_ratio', 'max_happy_ratio',
              'min_happy_genre_ratio', 'max_happy_genre_ratio']:
        tpl[k] = re.search(r'%s = (\d+)' % k, tpl_raw).group(1)

    # rebuild the 20021 allow_stone chunk, flattened to one-line clauses
    chunk = re.search(r'allow_stone\(\{20021, 0, 1\}\) ->\n(.*?)allow_stone\(_\)', pet_txt, re.S).group(0)
    chunk = chunk.rstrip()[:-len('allow_stone(_)')]
    stone_lines = []
    for m in re.finditer(r'allow_stone\(\{20021, (\d+), (\d+)\}\) ->\n\s+(\[[^\]]*\]);', chunk, re.S):
        stone_lines.append('allow_stone({20021, %s, %s}) ->\n    %s;' % (m.group(1), m.group(2), re.sub(r'\s+', ' ', m.group(3))))

    base_txt, model_txt, ratio_txt, polish_txt = build_pet_clauses(pets, tpl)
    stone_txt = build_stone_clauses(stone_lines)

    pet_new = pet_txt
    pet_new = insert_before(pet_new, 'get_base(_) -> false.\n', base_txt)
    pet_new = insert_before(pet_new, 'model(_) -> false.\n', model_txt)
    pet_new = insert_before(pet_new, 'get_base_ratio(_) -> false.\n', ratio_txt)
    pet_new = insert_before(pet_new, 'get_polish(_) -> false.\n', polish_txt)
    pet_new = insert_before(pet_new, 'allow_stone(_) -> [].\n', stone_txt)

    skill_txt_new = insert_before(skill_txt, 'get_pet(_) -> false.\n',
                                  build_skill_clauses(skill_txt, names))
    combat_txt_new, combat_blocks = build_combat_clauses(combat_txt, names)
    combat_new = insert_before(combat_txt, 'get_combat(_) -> false.\n', combat_txt_new)
    # 60561 is already claimed by the server's 愈灵珠被动 record; drop it so the
    # appended 毁灭龙息 clause (the client's meaning for this id) is the one reached.
    stale = combat_blocks.get((60561, 1))
    if stale:
        combat_new = combat_new.replace(stale + '\n', '', 1)

    for mod, text in [('pet_data', pet_new), ('skill_data', skill_txt_new),
                      ('skill_combat_data', combat_new)]:
        write(os.path.join(BUILD, 'src', mod + '.erl'), text)
        print('%-20s %10d -> %10d bytes (+%.1f%%)' %
              (mod, len(read(os.path.join(SRC, mod + '.erl'))), len(text),
               (len(text) / len(read(os.path.join(SRC, mod + '.erl'))) - 1) * 100))

    for mod in ['pet_data', 'skill_data', 'skill_combat_data']:
        for stage, path in [('baseline', os.path.join(SRC, mod + '.erl')),
                            ('patched', os.path.join(BUILD, 'src', mod + '.erl'))]:
            out = os.path.join(BUILD, stage)
            os.makedirs(out, exist_ok=True)
            r = subprocess.run([ERLC, '-o', out, path], capture_output=True, text=True)
            if r.returncode:
                print(r.stdout, r.stderr)
                raise SystemExit('compile failed: %s (%s)' % (mod, stage))
            print('%-18s %-8s -> %8d bytes' % (mod, stage, os.path.getsize(os.path.join(out, mod + '.beam'))))

    print('\nparsed %d pets / %d skills' % (len(pets), len(NEW_SKILLS)))
    for pid in NEW_PETS:
        p = pets[pid]
        print('  %d %-8s type=%d genre=%d growth=%d skills=%s break=%s' %
              (pid, p['name'], p['type'], p['genre'], p['growth'],
               [s for s, _ in p['base_skills']], p['lev_break']))

    verify()
    if not install:
        print('\n(generate+compile+verify done; rerun with --install to deploy and hot-load)')
        return
    deploy()
    print('\nhot-loaded. new pets:', ', '.join(str(p) for p in NEW_PETS))


EXPECTED_DIFFS = {'skill_combat_data': 1}   # get_combat({60561,1}) re-purposed for 毁灭龙息


def erl_eval(expr):
    r = subprocess.run([ERL, '+S1:1', '-noshell',
                        '-sname', 'patcher_%d_%s' % (os.getpid(), abs(hash(expr)) % 9999),
                        '-setcookie', '6bc1t325xjo21c1',
                        '-pa', os.path.join(BUILD, 'out'), '-pa', EBIN,
                        '-eval', expr], capture_output=True, text=True, timeout=900)
    return (r.stdout or '') + (r.stderr or '')


def running_nodes():
    epmd = None
    for cand in [os.path.join(ROOT, 'tmp', 'erlang19', 'bin', 'epmd.exe'),
                 os.path.join(ROOT, 'tmp', 'erlang19', 'erts-8.3', 'bin', 'epmd.exe')]:
        if os.path.exists(cand):
            epmd = cand
            break
    if not epmd:
        return []
    out = subprocess.run([epmd, '-names'], capture_output=True, text=True).stdout
    names = []
    for line in out.splitlines():
        parts = line.split()
        if len(parts) >= 2 and parts[0] == 'name':
            names.append(parts[1] + '@cll')
    return [n for n in names if n.startswith('fswy_')]


def verify():
    for mod in ['pet_data', 'skill_data', 'skill_combat_data']:
        keys = os.path.join(BUILD, mod + '.keys')
        subprocess.run([sys.executable, os.path.join(ROOT, 'tmp', 'make_keys.py'),
                        os.path.join(SRC, mod + '.erl'), keys], check=True,
                       stdout=subprocess.DEVNULL)
        pristine = os.path.join(BACKUP, mod + '.beam')
        orig = pristine if os.path.exists(pristine) else os.path.join(EBIN, mod + '.beam')
        for stage in ['baseline', 'patched']:
            out = erl_eval('verify_beam:run("%s","%s","%s")' % (
                orig.replace('\\', '/'),
                os.path.join(BUILD, stage, mod + '.beam').replace('\\', '/'),
                keys.replace('\\', '/')))
            line = next((l for l in out.split('\n') if 'compared' in l), out.strip()[:200])
            allow = EXPECTED_DIFFS.get(mod, 0) if stage == 'patched' else 0
            n = int(re.search(r'(\d+) diffs', line).group(1)) if 'diffs' in line else -1
            flag = 'OK' if n == allow else 'FAIL'
            print('  verify %-18s %-8s %s  (%s)' % (mod, stage, line.strip(), flag))
            if flag == 'FAIL':
                print(out[:3000])
                raise SystemExit('regression detected in %s (%s)' % (mod, stage))


def deploy():
    os.makedirs(BACKUP, exist_ok=True)
    for mod in ['pet_data', 'skill_data', 'skill_combat_data']:
        dst = os.path.join(EBIN, mod + '.beam')
        if not os.path.exists(os.path.join(BACKUP, mod + '.beam')):
            shutil.copy2(dst, os.path.join(BACKUP, mod + '.beam'))
        shutil.copy2(os.path.join(BUILD, 'patched', mod + '.beam'), dst)
        print('installed', mod, '(original kept in %s)' % BACKUP)
    nodes = [n for n in running_nodes() if n.startswith('fswy_')]
    if not nodes:
        print('no running fswy nodes - beams installed, they load on next server start')
        return
    expr = ('Nodes=%s, Mods=[pet_data,skill_data,skill_combat_data],'
            'R=[{{N,M},rpc:call(N,code,load_file,[M])} || N <- Nodes, M <- Mods],'
            'io:format("~p~n",[R]),init:stop().' % str(nodes))
    print('hot-loading on', nodes)
    print(erl_eval(expr)[:4000])


if __name__ == '__main__':
    main()
