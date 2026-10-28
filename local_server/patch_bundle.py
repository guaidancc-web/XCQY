import re
import shutil
from pathlib import Path

import UnityPy

BASE = Path(__file__).resolve().parent.parent
SRC = BASE / "extracted" / "assets" / "textures" / "textures_business.unity3d"
OUT_DIR = BASE / "tmp" / "bundle_patched"

LOCAL_URL = "127.0.0.1:8081"

LOCAL_SERVER = (
    '{name="本地测试服",host="127.0.0.1",port=8001,platform="dev",zone_id=1,'
    'begin_time=1700000000,end_time=2000000000,first_zone="1",recomend="1",isnew="0",hot="1",roles={}}'
)


def patch_connection(text):
    text = text.replace("sf.zhaixin.top:81", LOCAL_URL).replace("sf.zhaixin.top", LOCAL_URL)
    pattern = r'local port1\s*=\s*"[^"]*"\s*\n\s*if\s+ip\s*~=\s*port1\s+then\s*\n\s*return\s*\n\s*end\s*\n'
    new, count = re.subn(pattern, "", text)
    if count != 1:
        raise SystemExit(f"connection guard matched {count}")
    return new


def patch_login_config(text):
    text = text.replace("sf.zhaixin.top:81", LOCAL_URL).replace("sf.zhaixin.top", LOCAL_URL)
    text, count = re.subn(
        r'LoginConfig\.url\s*=\s*"[^"]*"',
        'LoginConfig.url = "http://127.0.0.1:8081/login/checkAccount.php?account=%s&password=%s"',
        text,
        count=1,
    )
    if count != 1:
        raise SystemExit("login_config url not found")
    return text


def patch_server_config(text):
    marker = "ServerConfig.GetServers = function()\n"
    if text.count(marker) != 1:
        raise SystemExit("server_config GetServers not found")
    debug = '''    if true then
        Log.Error(string.format("[SLDBG] GetServers root=%s", type(ctx.ServerListConfig)))
        if ctx.ServerListConfig ~= nil then
            local __tnode = nil
            pcall(function() __tnode = ctx.ServerListConfig.table end)
            Log.Error(string.format("[SLDBG] GetServers table=%s", type(__tnode)))
            if type(__tnode) == "table" then
                local __keys = {}
                for __k, __v in pairs(__tnode) do
                    table.insert(__keys, tostring(__k) .. ":" .. type(__v))
                end
                Log.Error("[SLDBG] GetServers keys=" .. table.concat(__keys, ","))
                local __pok, __probe = pcall(NormalJson, '{"table":{"msg":{"x":1}}}')
                if __pok then
                    Log.Error("[SLDBG] probe ok table=" .. type(__probe and __probe.table) .. " msg=" .. tostring(__probe and __probe.table and __probe.table.msg) .. " x=" .. tostring(__probe and __probe.table and __probe.table.msg and __probe.table.msg.x))
                else
                    Log.Error("[SLDBG] probe err=" .. tostring(__probe))
                end
                local __msg = nil
                pcall(function() __msg = __tnode.msg end)
                Log.Error(string.format("[SLDBG] GetServers msg=%s val=%s", type(__msg), tostring(__msg):sub(1, 200)))
                if type(__msg) == "string" then
                    local __ok, __parsed = pcall(NormalJson, __msg)
                    if __ok and __parsed ~= nil and __parsed.table ~= nil then
                        local __m = __parsed.table.msg or __parsed.table
                        if __m ~= nil and __m.server_list ~= nil then
                            __tnode.msg = __m
                            Log.Error("[SLDBG] GetServers msg reparsed")
                        end
                    end
                elseif type(__msg) == "table" then
                    local __sl = nil
                    pcall(function() __sl = __msg.server_list end)
                    Log.Error(string.format("[SLDBG] GetServers server_list=%s n=%s", type(__sl), tostring(type(__sl) == "table" and #__sl or -1)))
                end
            end
        end
    end
'''
    return text.replace(marker, marker + debug, 1)


def patch_login_manager(text):
    marker = "function LoginManager:Do_Login(_server_index, account)\n"
    if text.count(marker) != 1:
        raise SystemExit("login_manager Do_Login not found")
    head = '''function LoginManager:Do_Login(_server_index, account)
    if ServerConfig.servers == nil then ServerConfig.servers = {} end
    if ServerConfig.servers[_server_index or 1] == nil then
        ServerConfig.servers[_server_index or 1] = %s
    end
''' % LOCAL_SERVER
    text = text.replace(marker, head, 1)
    text, count = re.subn(
        r"(ServerConfig\.target_server = BaseUtils\.copytab\(ServerConfig\.servers\[_server_index\]\)\n)",
        "\\1    Log.Error(string.format(\"[SLDBG] Do_Login idx=%s host=%s port=%s account=%s connected=%s conn=%s\", tostring(_server_index), tostring(ServerConfig.target_server and ServerConfig.target_server.host), tostring(ServerConfig.target_server and ServerConfig.target_server.port), tostring(account), tostring(self.has_connected), tostring(self.connectiong)))\n",
        text,
        count=1,
    )
    if count != 1:
        raise SystemExit("login_manager target_server not found")
    marker2 = "function LoginManager:onConnected()\n"
    if text.count(marker2) == 1:
        text = text.replace(
            marker2,
            marker2 + '    Log.Error("[SLDBG] onConnected account=" .. tostring(self.account))\n',
            1,
        )
    return text


def patch_login_view(text):
    text = text.replace("sf.zhaixin.top:81", LOCAL_URL).replace("sf.zhaixin.top", LOCAL_URL)

    text, count = re.subn(
        r"\n\s*if not self\.model\.ListLoaded then\s*\n\s*return\s*\n\s*end\s*\n",
        "\n",
        text,
        count=1,
    )
    if count != 1:
        raise SystemExit("login_view ListLoaded gate not found")

    text, count = re.subn(
        r"\n\s*if not self\.toggle\.isOn then\s*\n.*?\n\s*end\s*\n",
        "\n",
        text,
        count=1,
        flags=re.S,
    )
    if count != 1:
        raise SystemExit("login_view PK toggle gate not found")

    text, count = re.subn(
        r"(?m)^(\s*)if continue then(\s*\n\s*local url = string\.format\(LoginConfig\.url)",
        r"\1if true then\2",
        text,
        count=1,
    )
    if count != 1:
        raise SystemExit("login_view continue gate not found")

    text, count = re.subn(
        r"(function LoginView:on_submit\(serverData\))",
        "\\1\n    if self.input_field ~= nil and (self.input_field.text == \"\" or self.input_field.text == TI18N(\"请输入帐号\")) then self.input_field.text = \"test123\" end\n    if self.input_field1 ~= nil and self.input_field1.text == \"\" then self.input_field1.text = \"test123\" end",
        text,
        count=1,
    )
    if count != 1:
        raise SystemExit("login_view on_submit signature not found")

    text, count = re.subn(
        r"(svr = self\.currSelectData\s*\n\s*end\s*\n)(\s*self:SavePlayerPrefs\(\"last_isfirst\", svr\.first_zone\))",
        r"\1    if svr == nil then svr = ServerConfig.servers[1] or " + LOCAL_SERVER + r" end\n\2",
        text,
        count=1,
    )
    if count != 1:
        raise SystemExit("login_view svr fallback insertion failed")

    text, count = re.subn(
        r"(function LoginView:OnServerListLoaded\(www, str\)\n    if BaseUtils\.isnull\(self\.gameObject\) then\n        return\n    end\n)",
        "\\1    Log.Error(string.format(\"[SLDBG] OnServerListLoaded type=%s len=%s head=%s tail=%s\", type(www), tostring(type(www) == \"string\" and #www or -1), tostring(www):sub(1, 240), string.sub(tostring(www), -80)))\n",
        text,
        count=1,
    )
    if count != 1:
        raise SystemExit("login_view OnServerListLoaded insertion failed")

    text, count = re.subn(
        r'function\(\)  Log\.Error\(string\.format\("ServerListPrase_Error：%s \|\| %s", debug\.traceback\(\), www\)\) end',
        r'function(err)  Log.Error(string.format("ServerListPrase_Error：err=%s || %s || %s", tostring(err), debug.traceback(), tostring(www))) end',
        text,
        count=1,
    )
    if count != 1:
        raise SystemExit("login_view parse error handler not found")

    text, count = re.subn(
        r'function\(\) Log\.Error\(string\.format\("ServerListReload_Error：%s ", debug\.traceback\(\)\)\) end',
        r'function(err) Log.Error(string.format("ServerListReload_Error：err=%s || %s || %s", tostring(err), debug.traceback(), tostring(www))) end',
        text,
        count=1,
    )
    if count != 1:
        raise SystemExit("login_view reload error handler not found")

    text, count = re.subn(
        r"(ctx:GetRemoteTxt\(url, function\(result\)\n)",
        "\\1                        Log.Error(\"[SLDBG] login result type=\" .. type(result) .. \" val=\" .. tostring(result):sub(1, 400))\n",
        text,
        count=1,
    )
    if count != 1:
        raise SystemExit("login_view login callback not found")

    text, count = re.subn(
        r"(\s*local msgData =  NormalJson\(resultData\.table\.msg\)\n)",
        "\\1                            do\n"
        "                                local __m = resultData.table.msg\n"
        "                                Log.Error(\"[SLDBG] msg type=\" .. type(__m) .. \" len=\" .. tostring(type(__m) == \"string\" and #__m or -1) .. \" val=\" .. tostring(__m):sub(1, 160))\n"
        "                                local __ok, __p = pcall(function() return NormalJson(__m) end)\n"
        "                                Log.Error(\"[SLDBG] msg reprobe ok=\" .. tostring(__ok) .. \" ptype=\" .. type(__p) .. \" tbl=\" .. type(__p and __p.table or nil))\n"
        "                                local __ok2, __p2 = pcall(function() return NormalJson('{\"table\":{\"success\":\"true\"}}') end)\n"
        "                                Log.Error(\"[SLDBG] literal probe ok=\" .. tostring(__ok2) .. \" ptype=\" .. type(__p2) .. \" tbl=\" .. type(__p2 and __p2.table or nil) .. \" suc=\" .. tostring(__p2 and __p2.table and __p2.table.success))\n"
        "                            end\n"
        "                            local msgData =  NormalJson(resultData.table.msg)\n",
        text,
        count=1,
    )
    if count != 1:
        raise SystemExit("login_view msgData probe insertion failed")

    text, count = re.subn(
        r"(local msgData =  NormalJson\(resultData\.table\.msg\)\n)",
        "\\1                            Log.Error(\"[SLDBG] login msgData=\" .. type(msgData) .. \" tbl=\" .. type(msgData and msgData.table) .. \" suc=\" .. tostring(msgData and msgData.table and msgData.table.success))\n",
        text,
        count=1,
    )
    if count != 1:
        raise SystemExit("login_view msgData line not found")

    auto = """
    LuaTimer.Add(2500, function()
        if self == nil or BaseUtils.isnull(self.gameObject) then return end
        if self.input_field == nil or self.input_field1 == nil then return end
        self.input_field.text = "test123"
        self.input_field1.text = "test123"
        if self.toggle ~= nil then self.toggle.isOn = true end
        Log.Error("[SLDBG] auto on_submit")
        self:on_submit()
    end)
"""
    text, count = re.subn(
        r"(self:SetLastServer\(\)\s*\n\s*self:InitTabPanel\(\)\s*\n)(end)",
        r"\1" + auto + r"\2",
        text,
        count=1,
    )
    if count != 1:
        raise SystemExit("login_view auto-submit insertion failed")
    return text


def patch_pet_manual(text):
    # 新加的 20022-20038 原本 manual_sort 100+，在图鉴里排到最后，第一页看不到。
    # 这里把它们排到同页最前面，方便直接看到（只影响显示顺序，不改数据）。
    old = "    local sortfunction = function(a,b) return a.data.manual_sort < b.data.manual_sort end"
    new = """    local sortfunction = function(a,b)
        local __a_new = a.data.id >= 20022 and a.data.id <= 20038
        local __b_new = b.data.id >= 20022 and b.data.id <= 20038
        if __a_new ~= __b_new then return __a_new end
        return a.data.manual_sort < b.data.manual_sort
    end"""
    if text.count(old) != 1:
        raise SystemExit("pet_view_manual sort function not found")
    return text.replace(old, new, 1)


def patch_kvdata(text):
    # ActiveDevice / NewPlayerImport post to oss.api.shiyuegame.com; WSA has no DNS,
    # so every GetRemoteTxt fails and pops the blocking "下载remotetxt信息失败" dialog.
    new, count = re.subn(r"http://oss\.api\.shiyuegame\.com", f"http://{LOCAL_URL}", text)
    if count < 3:
        raise SystemExit(f"kvdata urls matched {count}")
    return new


PATCHERS = {
    "connection": patch_connection,
    "login_config": patch_login_config,
    "kvdata": patch_kvdata,
    "server_config": patch_server_config,
    "login_manager": patch_login_manager,
    "login_view": patch_login_view,
    "pet_view_manual": patch_pet_manual,
}


def main():
    env = UnityPy.load(str(SRC))
    done = set()
    for obj in env.objects:
        if obj.type.name != "TextAsset":
            continue
        data = obj.read()
        name = str(data.m_Name)
        patcher = PATCHERS.get(name)
        if patcher is None:
            continue
        text = data.m_Script
        if isinstance(text, bytes):
            text = text.decode("utf-8")
        new = patcher(text)
        if new != text:
            data.m_Script = new
            data.save()
            done.add(name)
            print(f"patched {name}: {len(text)} -> {len(new)}")
    missing = set(PATCHERS) - done
    if missing:
        raise SystemExit(f"not patched: {sorted(missing)}")
    if OUT_DIR.exists():
        shutil.rmtree(OUT_DIR)
    OUT_DIR.mkdir(parents=True)
    for f in env.files.values():
        f.is_changed = True
    env.save(pack="lz4", out_path=str(OUT_DIR))
    out = OUT_DIR / SRC.name
    print(f"wrote {out} ({out.stat().st_size} bytes, original {SRC.stat().st_size})")


if __name__ == "__main__":
    main()
