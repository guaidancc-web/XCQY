-file("src/data/auth_sfz_data.erl", 1).

-module(auth_sfz_data).

-export([list_platform/0, get_reward/1]).

-file("inc/common.hrl", 1).

-type p() :: bitstring().

-type z() :: non_neg_integer().

-type role_id() :: {pos_integer(), p(), z()}.

-type unit_id() :: {pos_integer(), pos_integer()}.

-type pos() :: {pos_integer(),
                non_neg_integer(),
                non_neg_integer()}.

-record(center,
        {ready = 0 :: 1 | 0,
         pid :: undefined | pid(),
         node :: undefined | atom(),
         center_platform = "" :: list(),
         center_zone_id = 0 :: non_neg_integer(),
         platform = <<>> :: bitstring(),
         zone_id = 0 :: non_neg_integer(),
         combine = [] :: [{bitstring(), non_neg_integer()}]}).

-record(notice_rec,
        {type = 11, digit_attr = [], str_attr = []}).

-file("src/data/auth_sfz_data.erl", 15).

-file("inc/adm.hrl", 1).

-record(m_adm, {last_feedback = 0}).

-record(adm_report_info,
        {id, time, classes, lev, name, report = []}).

-record(adm_report,
        {id,
         order,
         name,
         lev,
         time,
         type,
         reason,
         msg = [],
         flag = 0}).

-record(adm_device_info,
        {id, type = 1 :: non_neg_integer()}).

-record(auth_sfz_cfg,
        {plat_channel = {"", 0},
         platform = "",
         channel_reg = 0,
         name = "",
         can_charge = 1,
         is_nonage = 0,
         charge_limit = 5000,
         is_wallow = 0,
         down_sec = 10800,
         is_show_phone = 0,
         show_info = "gm.3k.com",
         is_mail = 0,
         is_mid_exp = 0,
         is_lev_60 = 0,
         is_need_check = 0}).

-record(role_charge_cfg, {id = {0, "", 0}, label = ""}).

-file("src/data/auth_sfz_data.erl", 16).

list_platform() ->
    [#auth_sfz_cfg{platform = "local",
                   name = lang:get("本机"), can_charge = 1, is_nonage = 1,
                   charge_limit = 50000, is_wallow = 1, down_sec = 10800,
                   is_show_phone = 1, is_mail = 1,
                   show_info = "gm.3k.com"},
     #auth_sfz_cfg{platform = "dev", name = lang:get("开发服"),
                   can_charge = 1, is_nonage = 1, charge_limit = 50000,
                   is_wallow = 1, down_sec = 10800, is_show_phone = 1,
                   is_mail = 1, show_info = "gm.3k.com"},
     #auth_sfz_cfg{platform = "beta",
                   name = lang:get("3K安卓")},
     #auth_sfz_cfg{platform = "unite",
                   name = lang:get("3K苹果混服")},
     #auth_sfz_cfg{platform = "sp",
                   name = lang:get("3K渠道转移专服")}].

get_reward(1) -> [{22692, 0, 1}];
get_reward(_) -> false.

