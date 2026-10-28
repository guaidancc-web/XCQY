-file("src/data/campaign_group_purchase_data.erl", 1).

-module(campaign_group_purchase_data).

-export([get_ver/0,
         get_item/0,
         get_day/2,
         get_mail/1,
         get_show_item/1]).

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

-file("src/data/campaign_group_purchase_data.erl", 18).

-file("inc/campaign_group_purchase.hrl", 1).

-record(campaign_group_purchase_base,
        {id = 0,
         base_id = 0,
         num = 0,
         limit_num = 0,
         price = 0,
         price_type = 90003,
         discount_list = [],
         start_time = 0,
         end_time = 0,
         check_list = [],
         lev_min = 0,
         lev_max = 0,
         base_role_num = 0,
         sex = 2}).

-record(campaign_group_purchase_item,
        {id = 0,
         ver = 2,
         base_id = 0,
         num = 0,
         limit_num = 0,
         price = 0,
         price_type = 90003,
         discount = 1000,
         discount_list = [],
         start_time = 0,
         end_time = 0,
         buy_num = 0,
         system_buy_num = 0,
         buy_roles = [],
         is_end = 0,
         lev_min = 0,
         lev_max = 0,
         sex = 2,
         list1 = [],
         list2 = []}).

-record(campaign_group_purchase_role,
        {id = {0, "", 0}, ver = 0, buy_list = []}).

-file("src/data/campaign_group_purchase_data.erl", 19).

get_ver() -> 37.

get_item() ->
    [#campaign_group_purchase_base{id = 1, base_id = 29407,
                                   num = 1, limit_num = 1, price = 47000,
                                   price_type = 90003,
                                   discount_list =
                                       [{700, 10},
                                        {650, 38},
                                        {600, 75},
                                        {550, 112},
                                        {500, 150}],
                                   start_time = 1585670400,
                                   end_time = 1585756799,
                                   check_list =
                                       [{7, 8, 650, 1, 2},
                                        {9, 9, 650, 2, 3},
                                        {11, 12, 600, 1, 2},
                                        {13, 13, 600, 2, 3},
                                        {16, 17, 550, 1, 2},
                                        {18, 18, 550, 2, 3}],
                                   lev_min = 1, lev_max = 89,
                                   base_role_num = 10, sex = 2},
     #campaign_group_purchase_base{id = 2, base_id = 29408,
                                   num = 1, limit_num = 1, price = 50000,
                                   price_type = 90003,
                                   discount_list =
                                       [{700, 10},
                                        {650, 38},
                                        {600, 75},
                                        {550, 112},
                                        {500, 150}],
                                   start_time = 1585670400,
                                   end_time = 1585756799,
                                   check_list =
                                       [{7, 8, 650, 1, 2},
                                        {9, 9, 650, 2, 3},
                                        {11, 12, 650, 1, 2},
                                        {13, 13, 600, 2, 3},
                                        {16, 17, 550, 1, 2},
                                        {18, 18, 550, 2, 3}],
                                   lev_min = 90, lev_max = 999,
                                   base_role_num = 10, sex = 2},
     #campaign_group_purchase_base{id = 3, base_id = 29409,
                                   num = 1, limit_num = 2, price = 3500,
                                   price_type = 90002,
                                   discount_list =
                                       [{700, 10},
                                        {650, 38},
                                        {600, 75},
                                        {550, 112},
                                        {500, 150}],
                                   start_time = 1585670400,
                                   end_time = 1585756799,
                                   check_list =
                                       [{7, 8, 900, 0, 1},
                                        {9, 9, 900, 0, 1},
                                        {11, 12, 900, 1, 2},
                                        {13, 13, 900, 2, 3},
                                        {16, 17, 850, 1, 2},
                                        {18, 18, 850, 2, 3}],
                                   lev_min = 1, lev_max = 89, base_role_num = 5,
                                   sex = 2},
     #campaign_group_purchase_base{id = 4, base_id = 29410,
                                   num = 1, limit_num = 2, price = 3600,
                                   price_type = 90002,
                                   discount_list =
                                       [{700, 10},
                                        {650, 38},
                                        {600, 75},
                                        {550, 112},
                                        {500, 150}],
                                   start_time = 1585670400,
                                   end_time = 1585756799,
                                   check_list =
                                       [{7, 8, 600, 0, 1},
                                        {9, 9, 600, 0, 1},
                                        {11, 12, 600, 1, 2},
                                        {13, 13, 600, 2, 3},
                                        {16, 17, 550, 1, 2},
                                        {18, 18, 550, 2, 3}],
                                   lev_min = 90, lev_max = 999,
                                   base_role_num = 5, sex = 2},
     #campaign_group_purchase_base{id = 5, base_id = 24022,
                                   num = 1, limit_num = 2, price = 1500,
                                   price_type = 90002,
                                   discount_list =
                                       [{950, 5},
                                        {900, 10},
                                        {850, 20},
                                        {800, 30}],
                                   start_time = 1585670400,
                                   end_time = 1585756799,
                                   check_list =
                                       [{7, 8, 900, 0, 1},
                                        {9, 9, 900, 0, 1},
                                        {11, 12, 850, 1, 2},
                                        {13, 13, 850, 2, 3},
                                        {16, 17, 800, 1, 2},
                                        {18, 18, 800, 2, 3}],
                                   lev_min = 1, lev_max = 999,
                                   base_role_num = 4, sex = 2},
     #campaign_group_purchase_base{id = 6, base_id = 71515,
                                   num = 1, limit_num = 4, price = 1000,
                                   price_type = 90002,
                                   discount_list =
                                       [{950, 5},
                                        {900, 10},
                                        {850, 20},
                                        {800, 30}],
                                   start_time = 1585670400,
                                   end_time = 1585756799,
                                   check_list =
                                       [{7, 8, 900, 0, 1},
                                        {9, 9, 900, 0, 1},
                                        {11, 12, 900, 1, 2},
                                        {13, 13, 900, 2, 3},
                                        {16, 17, 850, 1, 2},
                                        {18, 18, 850, 2, 3}],
                                   lev_min = 1, lev_max = 999,
                                   base_role_num = 5, sex = 2},
     #campaign_group_purchase_base{id = 7, base_id = 71516,
                                   num = 1, limit_num = 5, price = 2000,
                                   price_type = 90002,
                                   discount_list =
                                       [{950, 4},
                                        {900, 15},
                                        {850, 30},
                                        {800, 45}],
                                   start_time = 1585670400,
                                   end_time = 1585756799,
                                   check_list =
                                       [{7, 8, 900, 0, 1},
                                        {9, 9, 900, 0, 1},
                                        {11, 12, 900, 1, 2},
                                        {13, 13, 900, 2, 3},
                                        {16, 17, 850, 1, 2},
                                        {18, 18, 850, 2, 3}],
                                   lev_min = 1, lev_max = 999,
                                   base_role_num = 4, sex = 2},
     #campaign_group_purchase_base{id = 8, base_id = 71514,
                                   num = 1, limit_num = 5, price = 1800,
                                   price_type = 90002,
                                   discount_list =
                                       [{900, 4},
                                        {850, 15},
                                        {800, 30},
                                        {750, 45}],
                                   start_time = 1585670400,
                                   end_time = 1585756799,
                                   check_list =
                                       [{7, 8, 900, 0, 1},
                                        {9, 9, 900, 0, 1},
                                        {11, 12, 900, 1, 2},
                                        {13, 13, 900, 2, 3},
                                        {16, 17, 850, 1, 2},
                                        {18, 18, 850, 2, 3}],
                                   lev_min = 1, lev_max = 999,
                                   base_role_num = 4, sex = 2},
     #campaign_group_purchase_base{id = 9, base_id = 29630,
                                   num = 1, limit_num = 1, price = 60000,
                                   price_type = 90003,
                                   discount_list =
                                       [{700, 4},
                                        {650, 15},
                                        {600, 30},
                                        {550, 45},
                                        {500, 60}],
                                   start_time = 1585756800,
                                   end_time = 1585843199,
                                   check_list =
                                       [{7, 8, 650, 1, 2},
                                        {9, 9, 650, 2, 3},
                                        {11, 12, 600, 1, 2},
                                        {13, 13, 600, 2, 3},
                                        {16, 17, 550, 1, 2},
                                        {18, 18, 550, 2, 3}],
                                   lev_min = 1, lev_max = 74,
                                   base_role_num = 10, sex = 2},
     #campaign_group_purchase_base{id = 10, base_id = 29631,
                                   num = 1, limit_num = 2, price = 1800,
                                   price_type = 90002,
                                   discount_list =
                                       [{950, 5},
                                        {900, 10},
                                        {850, 15},
                                        {800, 20}],
                                   start_time = 1585756800,
                                   end_time = 1585843199,
                                   check_list =
                                       [{7, 8, 500, 0, 1},
                                        {9, 9, 500, 0, 1},
                                        {11, 12, 500, 1, 2},
                                        {13, 13, 500, 2, 3},
                                        {16, 17, 400, 1, 2},
                                        {18, 18, 400, 2, 3}],
                                   lev_min = 1, lev_max = 74, base_role_num = 4,
                                   sex = 2},
     #campaign_group_purchase_base{id = 11, base_id = 29921,
                                   num = 1, limit_num = 1, price = 50000,
                                   price_type = 90003,
                                   discount_list =
                                       [{700, 4},
                                        {650, 15},
                                        {600, 30},
                                        {550, 45},
                                        {500, 60}],
                                   start_time = 1585756800,
                                   end_time = 1585843199,
                                   check_list =
                                       [{7, 8, 650, 0, 1},
                                        {9, 9, 650, 0, 1},
                                        {11, 12, 600, 1, 2},
                                        {13, 13, 600, 2, 3},
                                        {16, 17, 550, 1, 2},
                                        {18, 18, 550, 2, 3}],
                                   lev_min = 75, lev_max = 999,
                                   base_role_num = 4, sex = 2},
     #campaign_group_purchase_base{id = 12, base_id = 29922,
                                   num = 1, limit_num = 2, price = 5000,
                                   price_type = 90002,
                                   discount_list =
                                       [{950, 5},
                                        {900, 10},
                                        {850, 15},
                                        {800, 20}],
                                   start_time = 1585756800,
                                   end_time = 1585843199,
                                   check_list =
                                       [{7, 8, 900, 0, 1},
                                        {9, 9, 900, 0, 1},
                                        {11, 12, 900, 1, 2},
                                        {13, 13, 900, 2, 3},
                                        {16, 17, 850, 1, 2},
                                        {18, 18, 850, 2, 3}],
                                   lev_min = 75, lev_max = 999,
                                   base_role_num = 5, sex = 2},
     #campaign_group_purchase_base{id = 13, base_id = 71515,
                                   num = 1, limit_num = 4, price = 1000,
                                   price_type = 90002,
                                   discount_list =
                                       [{950, 5},
                                        {900, 10},
                                        {850, 20},
                                        {800, 30}],
                                   start_time = 1585756800,
                                   end_time = 1585843199,
                                   check_list =
                                       [{7, 8, 900, 0, 1},
                                        {9, 9, 900, 0, 1},
                                        {11, 12, 900, 1, 2},
                                        {13, 13, 900, 2, 3},
                                        {16, 17, 850, 1, 2},
                                        {18, 18, 850, 2, 3}],
                                   lev_min = 1, lev_max = 999,
                                   base_role_num = 5, sex = 2},
     #campaign_group_purchase_base{id = 14, base_id = 71516,
                                   num = 1, limit_num = 5, price = 2000,
                                   price_type = 90002,
                                   discount_list =
                                       [{950, 5},
                                        {900, 10},
                                        {850, 20},
                                        {800, 30}],
                                   start_time = 1585756800,
                                   end_time = 1585843199,
                                   check_list =
                                       [{7, 8, 900, 0, 1},
                                        {9, 9, 900, 0, 1},
                                        {11, 12, 900, 1, 2},
                                        {13, 13, 900, 2, 3},
                                        {16, 17, 850, 1, 2},
                                        {18, 18, 850, 2, 3}],
                                   lev_min = 1, lev_max = 999,
                                   base_role_num = 5, sex = 2},
     #campaign_group_purchase_base{id = 15, base_id = 71514,
                                   num = 1, limit_num = 5, price = 1800,
                                   price_type = 90002,
                                   discount_list =
                                       [{900, 4},
                                        {850, 15},
                                        {800, 30},
                                        {750, 45}],
                                   start_time = 1585756800,
                                   end_time = 1585843199,
                                   check_list =
                                       [{7, 8, 900, 0, 1},
                                        {9, 9, 900, 0, 1},
                                        {11, 12, 900, 1, 2},
                                        {13, 13, 900, 2, 3},
                                        {16, 17, 850, 1, 2},
                                        {18, 18, 850, 2, 3}],
                                   lev_min = 1, lev_max = 999,
                                   base_role_num = 4, sex = 2},
     #campaign_group_purchase_base{id = 16, base_id = 29413,
                                   num = 1, limit_num = 1, price = 46250,
                                   price_type = 90003,
                                   discount_list =
                                       [{700, 10},
                                        {600, 38},
                                        {500, 75},
                                        {450, 112},
                                        {400, 150}],
                                   start_time = 1585843200,
                                   end_time = 1585929599,
                                   check_list =
                                       [{7, 8, 600, 0, 1},
                                        {9, 9, 600, 0, 1},
                                        {11, 12, 500, 1, 2},
                                        {13, 13, 500, 2, 3},
                                        {16, 17, 450, 1, 2},
                                        {18, 18, 450, 2, 3}],
                                   lev_min = 1, lev_max = 79,
                                   base_role_num = 10, sex = 2},
     #campaign_group_purchase_base{id = 17, base_id = 29414,
                                   num = 1, limit_num = 1, price = 45000,
                                   price_type = 90003,
                                   discount_list =
                                       [{700, 10},
                                        {600, 38},
                                        {500, 75},
                                        {450, 112},
                                        {400, 150}],
                                   start_time = 1585843200,
                                   end_time = 1585929599,
                                   check_list =
                                       [{7, 8, 600, 0, 1},
                                        {9, 9, 600, 0, 1},
                                        {11, 12, 500, 1, 2},
                                        {13, 13, 500, 2, 3},
                                        {16, 17, 450, 1, 2},
                                        {18, 18, 450, 2, 3}],
                                   lev_min = 80, lev_max = 999,
                                   base_role_num = 10, sex = 2},
     #campaign_group_purchase_base{id = 18, base_id = 29625,
                                   num = 1, limit_num = 2, price = 3000,
                                   price_type = 90002,
                                   discount_list =
                                       [{800, 4},
                                        {700, 20},
                                        {600, 40},
                                        {500, 60}],
                                   start_time = 1585843200,
                                   end_time = 1585929599,
                                   check_list =
                                       [{7, 8, 600, 0, 1},
                                        {9, 9, 600, 0, 1},
                                        {11, 12, 600, 1, 2},
                                        {13, 13, 600, 2, 3},
                                        {16, 17, 500, 1, 2},
                                        {18, 18, 500, 2, 3}],
                                   lev_min = 1, lev_max = 79, base_role_num = 4,
                                   sex = 2},
     #campaign_group_purchase_base{id = 19, base_id = 29626,
                                   num = 1, limit_num = 2, price = 3000,
                                   price_type = 90002,
                                   discount_list =
                                       [{800, 4},
                                        {700, 20},
                                        {600, 40},
                                        {500, 60}],
                                   start_time = 1585843200,
                                   end_time = 1585929599,
                                   check_list =
                                       [{7, 8, 600, 0, 1},
                                        {9, 9, 600, 0, 1},
                                        {11, 12, 600, 1, 2},
                                        {13, 13, 600, 2, 3},
                                        {16, 17, 500, 1, 2},
                                        {18, 18, 500, 2, 3}],
                                   lev_min = 80, lev_max = 999,
                                   base_role_num = 4, sex = 2},
     #campaign_group_purchase_base{id = 20, base_id = 71515,
                                   num = 1, limit_num = 4, price = 1000,
                                   price_type = 90002,
                                   discount_list =
                                       [{950, 5},
                                        {900, 10},
                                        {850, 20},
                                        {800, 30}],
                                   start_time = 1585843200,
                                   end_time = 1585929599,
                                   check_list =
                                       [{7, 8, 900, 0, 1},
                                        {9, 9, 900, 0, 1},
                                        {11, 12, 900, 1, 2},
                                        {13, 13, 900, 2, 3},
                                        {16, 17, 850, 1, 2},
                                        {18, 18, 850, 2, 3}],
                                   lev_min = 1, lev_max = 999,
                                   base_role_num = 5, sex = 2},
     #campaign_group_purchase_base{id = 21, base_id = 71516,
                                   num = 1, limit_num = 5, price = 2000,
                                   price_type = 90002,
                                   discount_list =
                                       [{950, 5},
                                        {900, 10},
                                        {850, 20},
                                        {800, 30}],
                                   start_time = 1585843200,
                                   end_time = 1585929599,
                                   check_list =
                                       [{7, 8, 900, 0, 1},
                                        {9, 9, 900, 0, 1},
                                        {11, 12, 900, 1, 2},
                                        {13, 13, 900, 2, 3},
                                        {16, 17, 850, 1, 2},
                                        {18, 18, 850, 2, 3}],
                                   lev_min = 1, lev_max = 999,
                                   base_role_num = 5, sex = 2},
     #campaign_group_purchase_base{id = 22, base_id = 28725,
                                   num = 1, limit_num = 4, price = 1250,
                                   price_type = 90002,
                                   discount_list =
                                       [{950, 5},
                                        {900, 10},
                                        {850, 20},
                                        {800, 30}],
                                   start_time = 1585843200,
                                   end_time = 1585929599,
                                   check_list =
                                       [{7, 8, 900, 0, 1},
                                        {9, 9, 900, 0, 1},
                                        {11, 12, 900, 1, 2},
                                        {13, 13, 900, 2, 3},
                                        {16, 17, 850, 1, 2},
                                        {18, 18, 850, 2, 3}],
                                   lev_min = 1, lev_max = 999,
                                   base_role_num = 4, sex = 2},
     #campaign_group_purchase_base{id = 23, base_id = 71514,
                                   num = 1, limit_num = 5, price = 1800,
                                   price_type = 90002,
                                   discount_list =
                                       [{900, 4},
                                        {850, 15},
                                        {800, 30},
                                        {750, 45}],
                                   start_time = 1585843200,
                                   end_time = 1585929599,
                                   check_list =
                                       [{7, 8, 900, 0, 1},
                                        {9, 9, 900, 0, 1},
                                        {11, 12, 900, 1, 2},
                                        {13, 13, 900, 2, 3},
                                        {16, 17, 850, 1, 2},
                                        {18, 18, 850, 2, 3}],
                                   lev_min = 1, lev_max = 999,
                                   base_role_num = 4, sex = 2}].

get_day(Time, 2)
    when Time >= 1585670400 andalso Time =< 1585756799 ->
    {28725, 1};
get_day(Time, 2)
    when Time >= 1585756800 andalso Time =< 1585843199 ->
    {28725, 1};
get_day(Time, 2)
    when Time >= 1585843200 andalso Time =< 1585929599 ->
    {28725, 1};
get_day(_, _) -> false.

get_mail(1) ->
    #{title => lang:get("四月团购"),
      content =>
          lang:get("<color='#ffff00'>四月团购，惊喜享好礼</color>！活动期间<colo"
                   "r='#00ff00'>每日首次购买任一钻石</color>团购礼包即可获得~ts，千万别"
                   "错过哦！")};
get_mail(2) ->
    #{title => lang:get("四月团购"),
      content =>
          lang:get("亲爱的玩家，您在<color='#ffff00'>四月团购</color>中所购买的~ts"
                   "上架后抢购火爆，现已低至~ts！根据您所购买价格现返还您~ts差价及~ts的额外返利，达到"
                   "下一折扣还将继续获得返还哦！越早购买越划算，赶快叫上小伙伴来抢购吧！{face_1,3}")};
get_mail(3) ->
    #{title => lang:get("广播"),
      content =>
          lang:get("好消息！~ts现以~ts优惠待购啦！{face_1,7}，打开四月团购活动界面即可购买，抢"
                   "先购买返利更多这波必不亏！")};
get_mail(_) -> false.

get_show_item(29407) ->
    #{list1 => [{20020, 20}, {20022, 3}]};
get_show_item(29408) -> #{list1 => [{22306, 10}]};
get_show_item(29409) ->
    #{list1 => [{22600, 1}, {29046, 4}, {22212, 10}]};
get_show_item(29410) ->
    #{list1 => [{22586, 1}, {22212, 20}, {29046, 4}]};
get_show_item(29630) ->
    #{list1 => [{20616, 1}, {20075, 2}]};
get_show_item(29631) ->
    #{list1 => [{20617, 1}, {20076, 2}]};
get_show_item(29921) -> #{list1 => [{21244, 2}]};
get_show_item(29922) ->
    #{list1 => [{21244, 3}, {21245, 1}]};
get_show_item(29413) ->
    #{list1 => [{20034, 5}, {22585, 2}, {22216, 2}]};
get_show_item(29414) ->
    #{list1 => [{23556, 10}, {21098, 10}]};
get_show_item(29625) ->
    #{list1 => [{22585, 10}, {22216, 12}]};
get_show_item(29626) ->
    #{list1 => [{22307, 12}, {21098, 30}]};
get_show_item(_) -> false.

