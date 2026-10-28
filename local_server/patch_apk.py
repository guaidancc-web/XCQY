import argparse
import lzma
import re
import shutil
import subprocess
import sys
import zipfile
from pathlib import Path

BASE = Path(__file__).resolve().parent.parent
SRC = BASE / "base(3).apk"
TMP = BASE / "tmp"
PATCHED_PLAIN = TMP / "patched_lua"
PATCHED_LZMA = TMP / "patched_lzma"
UNSIGNED = BASE / "base_local_unsigned.apk"
SIGNED = BASE / "base_local.apk"
KEYSTORE = BASE / "local_server" / "debug.keystore"
JDK_BIN = BASE / "tools" / "jdk-21.0.12.1+1" / "bin"
PS1 = BASE / "local_server" / "lzma_compress.ps1"

LUA_TARGETS = {
    "assets/lua/mod/connet/connection.lua",
    "assets/lua/mod/login/login_view.lua",
    "assets/lua/config/login_config.lua",
    "assets/lua/config/server_config.lua",
}

SO_PATCHES = {
    "lib/x86/libclinkapi-lib.so": [(0x44930, b"\x31\xc0\xc3")],
}


def lua_text(zf, name):
    return lzma.decompress(zf.read(name)).decode("utf-8")


def patch_connection(text):
    pattern = r'local port1\s*=\s*"q\.jsfeipu\.com"\s*\n\s*if\s+ip\s*~=\s*port1\s+then\s*\n\s*return\s*\n\s*end\s*\n'
    new, count = re.subn(pattern, "", text)
    if count != 1:
        raise SystemExit(f"connection.lua guard pattern matched {count} times")
    return new


def patch_login_view(text):
    text = text.replace("q.jsfeipu.com", "127.0.0.1").replace("127.0.0.1:81", "127.0.0.1:8081")
    pattern = r"if continue then(\s*\n\s*local url = string\.format\(LoginConfig\.url)"
    new, count = re.subn(pattern, r"if true then\1", text)
    if count != 1:
        fallback, fallback_count = re.subn(r"if continue then", "if true then", text)
        if fallback_count != 1:
            raise SystemExit(f"login_view.lua whitelist pattern matched {count}/{fallback_count} times")
        new = fallback
    text = new

    text, count = re.subn(
        r"\n\s*if not self\.model\.ListLoaded then\s*\n\s*return\s*\n\s*end\s*\n",
        "\n",
        text,
        count=1,
    )
    if count != 1:
        raise SystemExit("login_view.lua ListLoaded gate not found")

    text, count = re.subn(
        r"\n\s*if not self\.toggle\.isOn then\s*\n.*?\n\s*end\s*\n",
        "\n",
        text,
        count=1,
        flags=re.S,
    )
    if count != 1:
        raise SystemExit("login_view.lua PK toggle gate not found")

    text, count = re.subn(
        r"(function LoginView:OnServerListLoaded\(www, str\)\n    if BaseUtils\.isnull\(self\.gameObject\) then\n        return\n    end\n)",
        r"\1    print(string.format(\"[SLDBG] OnServerListLoaded type=%s len=%s head=%s tail=%s\", type(www), tostring(type(www) == \"string\" and #www or -1), tostring(www):sub(1, 240), string.sub(tostring(www), -80)))\n",
        text,
        count=1,
    )
    if count != 1:
        raise SystemExit("login_view.lua OnServerListLoaded insertion failed")

    text, count = re.subn(
        r'function\(\)  Log\.Error\(string\.format\("ServerListPrase_Error：%s \|\| %s", debug\.traceback\(\), www\)\) end',
        r'function(err)  Log.Error(string.format("ServerListPrase_Error：err=%s || %s || %s", tostring(err), debug.traceback(), tostring(www))) end',
        text,
        count=1,
    )
    if count != 1:
        raise SystemExit("login_view.lua parse error handler not found")

    text, count = re.subn(
        r'function\(\) Log\.Error\(string\.format\("ServerListReload_Error：%s ", debug\.traceback\(\)\)\) end',
        r'function(err) Log.Error(string.format("ServerListReload_Error：err=%s || %s || %s", tostring(err), debug.traceback(), tostring(www))) end',
        text,
        count=1,
    )
    if count != 1:
        raise SystemExit("login_view.lua reload error handler not found")

    text, count = re.subn(
        r"(function LoginView:on_submit\(serverData\))",
        r"\1\n    if self.input_field ~= nil and (self.input_field.text == \"\" or self.input_field.text == TI18N(\"请输入帐号\")) then self.input_field.text = \"test123\" end\n    if self.input_field1 ~= nil and self.input_field1.text == \"\" then self.input_field1.text = \"test123\" end",
        text,
        count=1,
    )
    if count != 1:
        raise SystemExit("login_view.lua on_submit signature not found")

    text, count = re.subn(
        r"(svr = self\.currSelectData\s*\n\s*end\s*\n)(\s*self:SavePlayerPrefs\(\"last_isfirst\", svr\.first_zone\))",
        r"\1    if svr == nil then svr = ServerConfig.servers[1] or {name=\"本地测试服\",host=\"127.0.0.1\",port=8001,platform=\"dev\",zone_id=1,begin_time=1700000000,end_time=2000000000,first_zone=\"1\",recomend=\"1\",isnew=\"0\",hot=\"1\"} end\n\2",
        text,
        count=1,
    )
    if count != 1:
        raise SystemExit("login_view.lua svr fallback insertion failed")

    auto = """
    LuaTimer.Add(2500, function()
        if self == nil or BaseUtils.isnull(self.gameObject) then return end
        if self.input_field == nil or self.input_field1 == nil then return end
        self.input_field.text = "test123"
        self.input_field1.text = "test123"
        if self.toggle ~= nil then self.toggle.isOn = true end
        self:on_submit()
    end)
"""
    text, count = re.subn(
        r"(self:SetLastServer\(\)\s*\n\s*self:InitTabPanel\(\)\s*\n)(end)",
        r"\1" + auto.replace("\\", "\\\\") + r"\2",
        text,
        count=1,
    )
    if count != 1:
        raise SystemExit("login_view.lua auto-submit insertion failed")
    return text


def patch_login_config(text):
    return text.replace("q.jsfeipu.com", "127.0.0.1").replace("127.0.0.1:81", "127.0.0.1:8081")


def patch_server_config(text):
    marker = "ServerConfig.GetServers = function()\n"
    if text.count(marker) != 1:
        raise SystemExit("server_config.lua GetServers not found")
    debug = '''    if true then
        print(string.format("[SLDBG] GetServers root=%s", type(ctx.ServerListConfig)))
        if ctx.ServerListConfig ~= nil then
            local __tnode = nil
            pcall(function() __tnode = ctx.ServerListConfig.table end)
            print(string.format("[SLDBG] GetServers table=%s", type(__tnode)))
            if type(__tnode) == "table" then
                local __msg = nil
                pcall(function() __msg = __tnode.msg end)
                print(string.format("[SLDBG] GetServers msg=%s val=%s", type(__msg), tostring(__msg):sub(1, 200)))
                if type(__msg) == "string" then
                    local __ok, __parsed = pcall(NormalJson, __msg)
                    if __ok and __parsed ~= nil and __parsed.table ~= nil then
                        local __m = __parsed.table.msg or __parsed.table
                        __tnode.msg = __m
                        print(string.format("[SLDBG] GetServers msg reparsed=%s", type(__m)))
                    end
                elseif type(__msg) == "table" then
                    local __sl = nil
                    pcall(function() __sl = __msg.server_list end)
                    print(string.format("[SLDBG] GetServers server_list=%s n=%s", type(__sl), tostring(type(__sl) == "table" and #__sl or -1)))
                end
            end
        end
    end
'''
    return text.replace(marker, marker + debug, 1)


def dry_run():
    with zipfile.ZipFile(SRC) as zf:
        names = set(zf.namelist())
        for name in sorted(LUA_TARGETS):
            if name not in names:
                raise SystemExit(f"missing target: {name}")
            text = lua_text(zf, name)
            if name.endswith("connection.lua"):
                new = patch_connection(text)
            elif name.endswith("login_view.lua"):
                new = patch_login_view(text)
            elif name.endswith("server_config.lua"):
                new = patch_server_config(text)
            else:
                new = patch_login_config(text)
            print(f"{name}: {len(text)} -> {len(new)} chars, changed={text != new}")
        data = zf.read("assets/base_setting.json")
        new_data = data.replace(b"106.52.8.88", b"127.0.0.1")
        print(f"assets/base_setting.json: {len(data)} -> {len(new_data)} bytes, changed={data != new_data}")
        print("dry-run OK")


def prepare_plain():
    if PATCHED_PLAIN.exists():
        shutil.rmtree(PATCHED_PLAIN)
    if PATCHED_LZMA.exists():
        shutil.rmtree(PATCHED_LZMA)
    PATCHED_PLAIN.mkdir(parents=True)
    with zipfile.ZipFile(SRC) as zf:
        for name in sorted(LUA_TARGETS):
            text = lua_text(zf, name)
            if name.endswith("connection.lua"):
                new = patch_connection(text)
            elif name.endswith("login_view.lua"):
                new = patch_login_view(text)
            elif name.endswith("server_config.lua"):
                new = patch_server_config(text)
            else:
                new = patch_login_config(text)
            out = PATCHED_PLAIN / Path(name).relative_to("assets/lua")
            out.parent.mkdir(parents=True, exist_ok=True)
            out.write_text(new, encoding="utf-8")
            print(f"patched {name}: {len(text)} -> {len(new)} chars")


def compress_lua():
    cmd = [
        "powershell.exe", "-NoProfile", "-ExecutionPolicy", "Bypass", "-File", str(PS1),
        "-InDir", str(PATCHED_PLAIN), "-OutDir", str(PATCHED_LZMA),
    ]
    result = subprocess.run(cmd, capture_output=True, text=True)
    sys.stdout.write(result.stdout)
    if result.returncode != 0:
        sys.stderr.write(result.stderr)
        raise SystemExit(f"LZMA compression failed: {result.returncode}")
    for plain in PATCHED_PLAIN.rglob("*.lua"):
        rel = plain.relative_to(PATCHED_PLAIN)
        packed = PATCHED_LZMA / rel
        if not packed.exists():
            raise SystemExit(f"missing compressed file: {packed}")
        if lzma.decompress(packed.read_bytes()) != plain.read_bytes():
            raise SystemExit(f"LZMA roundtrip mismatch: {packed}")
        print(f"verified {rel}: {packed.stat().st_size} bytes")


def is_signature(name):
    if not name.startswith("META-INF/"):
        return False
    if name == "META-INF/MANIFEST.MF":
        return True
    return name.endswith((".SF", ".RSA", ".DSA", ".EC"))


def build_unsigned():
    if UNSIGNED.exists():
        UNSIGNED.unlink()
    count = 0
    with zipfile.ZipFile(SRC) as zin, zipfile.ZipFile(UNSIGNED, "w", allowZip64=True) as zout:
        for info in zin.infolist():
            name = info.filename
            if is_signature(name):
                continue
            if name == "assets/base_setting.json":
                data = zin.read(info).replace(b"106.52.8.88:81", b"127.0.0.1:8081")
                zout.writestr(info, data)
            elif name in LUA_TARGETS:
                data = (PATCHED_LZMA / Path(name).relative_to("assets/lua")).read_bytes()
                zout.writestr(info, data)
            elif name in SO_PATCHES:
                data = bytearray(zin.read(info))
                for offset, patch in SO_PATCHES[name]:
                    data[offset:offset + len(patch)] = patch
                zout.writestr(info, bytes(data))
            else:
                with zin.open(info) as src, zout.open(info, "w") as dst:
                    shutil.copyfileobj(src, dst, 1024 * 1024)
            count += 1
            if count % 2000 == 0:
                print(f"copied {count} entries...")
    print(f"wrote {UNSIGNED} ({UNSIGNED.stat().st_size} bytes, {count} entries)")


def sign():
    keytool = JDK_BIN / "keytool.exe"
    jarsigner = JDK_BIN / "jarsigner.exe"
    if not KEYSTORE.exists():
        subprocess.run([
            str(keytool), "-genkeypair", "-keystore", str(KEYSTORE),
            "-alias", "androiddebugkey", "-storepass", "android", "-keypass", "android",
            "-keyalg", "RSA", "-keysize", "2048", "-validity", "10000",
            "-dname", "CN=Android Debug,O=Android,C=US", "-noprompt",
        ], check=True)
    if SIGNED.exists():
        SIGNED.unlink()
    subprocess.run([
        str(jarsigner), "-keystore", str(KEYSTORE), "-storepass", "android", "-keypass", "android",
        "-sigalg", "SHA256withRSA", "-digestalg", "SHA-256",
        "-signedjar", str(SIGNED), str(UNSIGNED), "androiddebugkey",
    ], check=True)
    subprocess.run([str(jarsigner), "-verify", "-certs", str(SIGNED)], check=True)
    print(f"signed {SIGNED} ({SIGNED.stat().st_size} bytes)")


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--dry-run", action="store_true")
    parser.add_argument("--skip-compress", action="store_true")
    parser.add_argument("--skip-build", action="store_true")
    args = parser.parse_args()
    if args.dry_run:
        dry_run()
        return
    if not args.skip_compress:
        prepare_plain()
        compress_lua()
    if not args.skip_build:
        build_unsigned()
        sign()


if __name__ == "__main__":
    main()
