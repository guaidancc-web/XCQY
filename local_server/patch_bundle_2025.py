import re
import shutil
from pathlib import Path

import UnityPy

BASE = Path(__file__).resolve().parent.parent
SRC_CANDIDATES = [
    BASE / "tmp" / "updated_client" / "business_2025.unity3d",
    BASE / "cdn" / "patch_android" / "202505180009" / "textures" / "textures_business.unity3d",
]
OUT_DIR = BASE / "tmp" / "bundle_2025_patched"

LOCAL_HTTP = "127.0.0.1:8081"
LOCAL_LOGIN = f"http://{LOCAL_HTTP}/login/checkAccount.php?account=%s&password=%s"
LOCAL_SERVER_LUA = (
    '{name="本地测试服", host="127.0.0.1", port=8001, platform="dev", zone_id=1, '
    'begin_time=0, end_time=2000000000, first_zone="1", recomend="1", isnew="0", hot="1", roles={}}'
)


def patch_connection(text):
    pattern = r'local port1\s*=\s*"[^"]*"\s*\n\s*if\s+ip\s*~=\s*port1\s+then\s*\n\s*return\s*\n\s*end\s*\n'
    text, count = re.subn(pattern, "", text)
    if count != 1:
        raise SystemExit(f"connection guard matched {count}")
    return text


def patch_login_config(text):
    text, count = re.subn(r'LoginConfig\.url\s*=\s*"[^"]*"', f'LoginConfig.url = "{LOCAL_LOGIN}"', text, count=1)
    if count != 1:
        raise SystemExit("login_config url not found")
    return text


def patch_kvdata(text):
    new, count = re.subn(r"http://oss\.api\.shiyuegame\.com", f"http://{LOCAL_HTTP}", text)
    if count < 3:
        raise SystemExit(f"kvdata urls matched {count}")
    return new


def patch_login_manager(text):
    marker = "function LoginManager:Do_Login(_server_index, account)\n"
    head = marker + (
        "    ServerConfig.servers = ServerConfig.servers or {}\n"
        "    _server_index = _server_index or 1\n"
        "    if ServerConfig.servers[_server_index] == nil then\n"
        f"        ServerConfig.servers[_server_index] = {LOCAL_SERVER_LUA}\n"
        "    end\n"
    )
    if text.count(marker) != 1:
        raise SystemExit("login_manager Do_Login not found")
    text = text.replace(marker, head, 1)

    guard = (r'\n\s*local port1\s*=\s*"[^"]*"\s*\n\s*if\s+ServerConfig\.target_server\.host\s*~=\s*port1'
             r'\s+then\s*\n\s*return\s*\n\s*end\s*\n')
    text, count = re.subn(guard, "\n", text)
    if count != 1:
        raise SystemExit(f"login_manager host guard matched {count}")
    return text


def patch_login_view(text):
    text = text.replace(
        "http://106.52.8.88:81/fswy_register/www/index.php/Userlogin/userRegs?account=%s&password=%s",
        LOCAL_LOGIN,
    )
    text = text.replace("http://106.52.8.88:81/list/", f"http://{LOCAL_HTTP}/list/")

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

    marker = "    local svr = nil\n    if serverData ~= nil then"
    if text.count(marker) != 1:
        raise SystemExit("login_view server select not found")
    text = text.replace(
        marker,
        "    if ServerConfig.servers == nil or #ServerConfig.servers == 0 then\n"
        f"        ServerConfig.servers = {{{LOCAL_SERVER_LUA}}}\n"
        "    end\n"
        "    if self._server_index == nil then self._server_index = 1 end\n"
        + marker,
        1,
    )

    auto_timer = '''    LuaTimer.Add(2500, function()
        if self == nil or BaseUtils.isnull(self.gameObject) then return end
        if self.input_field == nil or self.input_field1 == nil then return end
        self.input_field.text = "test123"
        self.input_field1.text = "test123"
        if self.toggle ~= nil then self.toggle.isOn = true end
        self:on_submit()
    end)
'''
    tail_marker = "    if self.isLocalList or self.model.ListLoaded then\n        self:InitTabPanel()\n    end\nend"
    if text.count(tail_marker) != 1:
        raise SystemExit("login_view OnShow tail not found")
    text = text.replace(
        tail_marker,
        "    if self.isLocalList or self.model.ListLoaded then\n        self:InitTabPanel()\n    end\n"
        + auto_timer + "end",
        1,
    )
    return text


def patch_pet_manual(text):
    old = "    local sortfunction = function(a,b) return a.data.manual_sort < b.data.manual_sort end"
    new = """    local sortfunction = function(a,b)
        local __a_new = a.data.id >= 20022 and a.data.id <= 20069
        local __b_new = b.data.id >= 20022 and b.data.id <= 20069
        if __a_new ~= __b_new then return __a_new end
        return a.data.manual_sort < b.data.manual_sort
    end"""
    if text.count(old) != 1:
        raise SystemExit("pet_view_manual sort function not found")
    return text.replace(old, new, 1)


def patch_recharge_click(text):
    """充值页点击不再走已失效的 SDK 支付，改为直接发 GM 9900 走服务端原生充值链路。"""
    old = "    self.btn.onClick:AddListener(function() self.callback(self.model.chargeList[index]) end)"
    new = '    self.btn.onClick:AddListener(function() Connection.Instance:send(9900, {msg = "充值 " .. tostring(self.model.chargeList[index].gold) .. " 0"}) end)'
    if new in text:
        return text
    if text.count(old) != 1:
        raise SystemExit(f"recharge click handler matched {text.count(old)} times")
    return text.replace(old, new, 1)


def patch_sdk_charge(text):
    """所有充值入口都走 SdkManager:ShowChargeView，在函数开头直接发 GM 9900 充值命令并返回，
    绕开已失效的 SDK 支付与渠道屏蔽。"""
    sig = "function SdkManager:ShowChargeView(productId, amount, gold, extInfo)"
    send = ('    NoticeManager.Instance:FloatTipsByString("充值已提交")' + chr(10)
            + '    Connection.Instance:send(9900, {cmd = "充值 " .. tostring(gold or 0) .. " 0"})')
    inject = sig + chr(10) + send + chr(10) + "    do return end" + chr(10)
    if send in text:
        return text
    if text.count(sig) != 1:
        raise SystemExit(f"ShowChargeView signature matched {text.count(sig)} times")
    return text.replace(sig + chr(10), inject, 1)


def patch_recharge_gift_item(text):
    """itemidToRes[data.item_list[1][1]] 会拿到 nil，导致 InitPanel 中途抛错、
    buyData 一直为 nil，点击充值好礼的卡片等于点空气。加 nil 保护让初始化走完。"""
    old = """    self.diamondImage.sprite = self.assetWrapper:GetSprite(AssetConfig.shop_textures, self.model.itemidToRes[data.item_list[1][1]])"""
    new = """    do
        local __res = nil
        local __map = self.model.itemidToRes
        local __list = data and data.item_list
        if __map ~= nil and __list ~= nil and __list[1] ~= nil then
            __res = __map[__list[1][1]]
        end
        if __res ~= nil then
            self.diamondImage.sprite = self.assetWrapper:GetSprite(AssetConfig.shop_textures, __res)
        end
    end"""
    if 'local __res = nil' in text:
        return text
    if text.count(old) != 1:
        raise SystemExit(f"recharge_gift_item 目标行匹配 {text.count(old)} 次")
    return text.replace(old, new, 1)

def patch_shop_recharge_item(text):
    """充值档位赠送图标取 base 图集的 Assets90029，2025 资源里没有这张图，
    会画出白框；取不到时回退成钻石物品图标。"""
    old = ('    self.tokesCurrencyLoader:SetOtherSprite(PreloadManager.Instance:'
           'GetSprite(AssetConfig.base_textures, "Assets90029"))')
    new = """    do
        local __cur = PreloadManager.Instance:GetSprite(AssetConfig.base_textures, "Assets90029")
        if __cur ~= nil then
            self.tokesCurrencyLoader:SetOtherSprite(__cur)
        else
            self.tokesCurrencyLoader:SetSprite(SingleIconType.Item, 90002)
        end
    end"""
    if 'local __cur = PreloadManager' in text:
        return text
    if text.count(old) != 1:
        raise SystemExit(f"shop_recharge_item 目标行匹配 {text.count(old)} 次")
    return text.replace(old, new, 1)


CHARGE_PANELS = [
    "recharge_gift_panel", "rechargepackage_panel", "shop_recharge_panel", "shop_window", "bible_daily_gift_panel", "bible_invest_panel", "multi_invest_panel", "direct_buy_panel", "directpackagewindow", "grow_fund_panel", "open_server_direct_buy_panel", "shop_monthly_panel",
]

RUNSDK_GUARD = "SdkManager.Instance:RunSdk()"


def _make_guard_patcher(name):
    """充值/礼包面板的支付都被 RunSdk() 挡住（该函数被原作者硬编码 return false），
    这里只在充值相关面板把它当 true，让调用落到 SdkManager:ShowChargeView。"""
    def patch(text):
        if RUNSDK_GUARD not in text:
            raise SystemExit(name + ": 未找到 RunSdk 守卫")
        return text.replace(RUNSDK_GUARD, "true")
    return patch

PATCHERS = {
    "connection": patch_connection,
    "login_config": patch_login_config,
    "kvdata": patch_kvdata,
    "login_manager": patch_login_manager,
    "login_view": patch_login_view,
    "pet_view_manual": patch_pet_manual,
    "sdk_manager": patch_sdk_charge,
    "recharge_gift_item": patch_recharge_gift_item,
    "shop_recharge_item": patch_shop_recharge_item,
    "recharge_gift_panel": _make_guard_patcher("recharge_gift_panel"),
    "rechargepackage_panel": _make_guard_patcher("rechargepackage_panel"),
    "shop_recharge_panel": _make_guard_patcher("shop_recharge_panel"),
    "shop_window": _make_guard_patcher("shop_window"),
    "bible_daily_gift_panel": _make_guard_patcher("bible_daily_gift_panel"),
    "bible_invest_panel": _make_guard_patcher("bible_invest_panel"),
    "multi_invest_panel": _make_guard_patcher("multi_invest_panel"),
    "direct_buy_panel": _make_guard_patcher("direct_buy_panel"),
    "directpackagewindow": _make_guard_patcher("directpackagewindow"),
    "grow_fund_panel": _make_guard_patcher("grow_fund_panel"),
    "open_server_direct_buy_panel": _make_guard_patcher("open_server_direct_buy_panel"),
    "shop_monthly_panel": _make_guard_patcher("shop_monthly_panel"),
}


def main():
    SRC = next((p for p in SRC_CANDIDATES if p.is_file()), None)
    if SRC is None:
        raise SystemExit("缺少 2025 bundle：先让客户端更新一次（会缓存到 cdn/），或放到 "
                         + str(SRC_CANDIDATES[0]))
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
    produced = next(OUT_DIR.glob("*.unity3d"))
    out = OUT_DIR / "textures_business.unity3d"
    produced.replace(out)
    print(f"wrote {out} ({out.stat().st_size} bytes)")


if __name__ == "__main__":
    main()
