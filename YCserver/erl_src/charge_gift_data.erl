-file("src/data/charge_gift_data.erl", 1).

-module(charge_gift_data).

-export([get/1,
         get_type/1,
         groups/0,
         get_group/1,
         get_extra_rand/1,
         get_num/1,
         lev_list/0,
         lev_gifts/1,
         get_gift/1]).

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

-file("src/data/charge_gift_data.erl", 23).

-file("inc/charge_gift.hrl", 1).

-record(m_charge_gift,
        {ver = 1,
         flag = 0,
         login_time = 0,
         check_time = 0,
         start_time = 0,
         keep_time = 0,
         pay_time = 0,
         end_time = 0,
         check_time_list = [],
         acc = 0,
         return = 0,
         num = 0,
         list = []}).

-record(charge_gift_data,
        {min = 0,
         max = 0,
         group = 0,
         gold = 0,
         charge_gold = 0,
         num = 0,
         list = [],
         title = "",
         msg = ""}).

-record(charge_gift_server, {white = [], black = []}).

-file("src/data/charge_gift_data.erl", 24).

groups() -> [1, 999].

get_group(1) ->
    #charge_gift_server{white = [{"mix", -1, ""}]};
get_group(999) -> #charge_gift_server{};
get_group(_) -> false.

get({999, 4}) -> 250;
get({999, 5}) -> 400;
get({999, 6}) -> 500;
get({999, 7}) -> 550;
get({999, 1}) -> 700;
get({999, 2}) -> 850;
get({999, 3}) -> 1000;
get({1, 4}) -> 250;
get({1, 5}) -> 400;
get({1, 6}) -> 500;
get({1, 7}) -> 550;
get({1, 1}) -> 700;
get({1, 2}) -> 850;
get({1, 3}) -> 1000;
get(_) -> 0.

get_extra_rand({999, 4}) -> 0;
get_extra_rand({999, 5}) -> 0;
get_extra_rand({999, 6}) -> 0;
get_extra_rand({999, 7}) -> 0;
get_extra_rand({999, 1}) -> 0;
get_extra_rand({999, 2}) -> 0;
get_extra_rand({999, 3}) -> 0;
get_extra_rand({1, 4}) -> 0;
get_extra_rand({1, 5}) -> 0;
get_extra_rand({1, 6}) -> 0;
get_extra_rand({1, 7}) -> 0;
get_extra_rand({1, 1}) -> 0;
get_extra_rand({1, 2}) -> 0;
get_extra_rand({1, 3}) -> 0;
get_extra_rand(_) -> 0.

get_type({999, 1}) -> 10;
get_type({1, 1}) -> 10;
get_type(_) -> 0.

get_num(999) -> 2;
get_num(1) -> 2;
get_num(_) -> 0.

lev_list() ->
    [{1, 49},
     {50, 79},
     {80, 200},
     {1, 49},
     {50, 79},
     {80, 200},
     {1, 49},
     {50, 79},
     {80, 200}].

lev_gifts({1, 49}) -> [{1, 1}, {4, 1}, {7, 1}];
lev_gifts({50, 79}) -> [{1, 1}, {4, 1}, {7, 1}];
lev_gifts({80, 200}) -> [{1, 1}, {4, 1}, {7, 1}];
lev_gifts(_) -> [].

get_gift({Lev, 60}) when Lev >= 1 andalso Lev =< 49 ->
    #charge_gift_data{min = 1, max = 49, group = 1,
                      gold = 60, charge_gold = 0, num = 1,
                      list = [{23140, 0, 1}], title = lang:get("每日礼包"),
                      msg =
                          lang:get("您的背包空间不足，购买的<color='#ffff00'>每日礼包-6元礼包</color"
                                   ">道具，由邮件的方式发放给您，请查收")};
get_gift({Lev, 60}) when Lev >= 50 andalso Lev =< 79 ->
    #charge_gift_data{min = 50, max = 79, group = 1,
                      gold = 60, charge_gold = 0, num = 1,
                      list = [{23141, 0, 1}], title = lang:get("每日礼包"),
                      msg =
                          lang:get("您的背包空间不足，购买的<color='#ffff00'>每日礼包-6元礼包</color"
                                   ">道具，由邮件的方式发放给您，请查收")};
get_gift({Lev, 60}) when Lev >= 80 andalso Lev =< 200 ->
    #charge_gift_data{min = 80, max = 200, group = 1,
                      gold = 60, charge_gold = 0, num = 1,
                      list = [{23142, 0, 1}], title = lang:get("每日礼包"),
                      msg =
                          lang:get("您的背包空间不足，购买的<color='#ffff00'>每日礼包-6元礼包</color"
                                   ">道具，由邮件的方式发放给您，请查收")};
get_gift({Lev, 280}) when Lev >= 1 andalso Lev =< 49 ->
    #charge_gift_data{min = 1, max = 49, group = 4,
                      gold = 280, charge_gold = 0, num = 1,
                      list = [{23143, 0, 1}], title = lang:get("每日礼包"),
                      msg =
                          lang:get("您的背包空间不足，购买的<color='#ffff00'>每日礼包-28元礼包</colo"
                                   "r>道具，由邮件的方式发放给您，请查收")};
get_gift({Lev, 280}) when Lev >= 50 andalso Lev =< 79 ->
    #charge_gift_data{min = 50, max = 79, group = 4,
                      gold = 280, charge_gold = 0, num = 1,
                      list = [{23144, 0, 1}], title = lang:get("每日礼包"),
                      msg =
                          lang:get("您的背包空间不足，购买的<color='#ffff00'>每日礼包-28元礼包</colo"
                                   "r>道具，由邮件的方式发放给您，请查收")};
get_gift({Lev, 280})
    when Lev >= 80 andalso Lev =< 200 ->
    #charge_gift_data{min = 80, max = 200, group = 4,
                      gold = 280, charge_gold = 0, num = 1,
                      list = [{23145, 0, 1}], title = lang:get("每日礼包"),
                      msg =
                          lang:get("您的背包空间不足，购买的<color='#ffff00'>每日礼包-28元礼包</colo"
                                   "r>道具，由邮件的方式发放给您，请查收")};
get_gift({Lev, 680}) when Lev >= 1 andalso Lev =< 49 ->
    #charge_gift_data{min = 1, max = 49, group = 7,
                      gold = 680, charge_gold = 0, num = 1,
                      list = [{23146, 0, 1}], title = lang:get("每日礼包"),
                      msg =
                          lang:get("您的背包空间不足，购买的<color='#ffff00'>每日礼包-68元礼包</colo"
                                   "r>道具，由邮件的方式发放给您，请查收")};
get_gift({Lev, 680}) when Lev >= 50 andalso Lev =< 79 ->
    #charge_gift_data{min = 50, max = 79, group = 7,
                      gold = 680, charge_gold = 0, num = 1,
                      list = [{23147, 0, 1}], title = lang:get("每日礼包"),
                      msg =
                          lang:get("您的背包空间不足，购买的<color='#ffff00'>每日礼包-68元礼包</colo"
                                   "r>道具，由邮件的方式发放给您，请查收")};
get_gift({Lev, 680})
    when Lev >= 80 andalso Lev =< 200 ->
    #charge_gift_data{min = 80, max = 200, group = 7,
                      gold = 680, charge_gold = 0, num = 1,
                      list = [{23148, 0, 1}], title = lang:get("每日礼包"),
                      msg =
                          lang:get("您的背包空间不足，购买的<color='#ffff00'>每日礼包-68元礼包</colo"
                                   "r>道具，由邮件的方式发放给您，请查收")};
get_gift(_) -> false.

