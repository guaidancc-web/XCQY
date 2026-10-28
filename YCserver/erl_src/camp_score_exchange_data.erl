-file("src/data/camp_score_exchange_data.erl", 1).

-module(camp_score_exchange_data).

-export([get_config/1,
         get_special_gift/0,
         get_special_item/1,
         get_common_gift/0,
         get_quest_list/0,
         get_quest_info/1,
         get_other_info/0,
         get_quests/1]).

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

-file("src/data/camp_score_exchange_data.erl", 21).

-file("inc/camp_score_exchange.hrl", 1).

-author("Liyufei").

-record(m_camp_score_exchange,
        {ver = 1,
         camp_id = 0,
         day = 0,
         acc_score = 0,
         now_score = 0,
         owned_item = [],
         exchange_order = []}).

-record(camp_score_exchange_item,
        {id = 0,
         order_id = 0,
         item_id = 0,
         item_name = "",
         bind = 0,
         base_num = 0,
         exchange_num = 0,
         cost = 0,
         is_effect = 0,
         is_zone_cast = 0,
         min_lev = 0,
         max_lev = 0,
         sex = 0,
         classes = 0}).

-file("src/data/camp_score_exchange_data.erl", 22).

get_config({1357, 1}) -> {[1, 2, 3, 4], 0};
get_config({1357, 2}) -> {[1, 2, 3, 4], 0};
get_config({1357, 3}) -> {[1, 2, 3, 4], 0};
get_config(_) -> false.

get_special_gift() ->
    [#camp_score_exchange_item{id = 1, order_id = 1,
                               item_id = 20006, bind = 0, base_num = 3,
                               exchange_num = 1, cost = 2, is_effect = 0,
                               is_zone_cast = 0, min_lev = 1, max_lev = 200,
                               sex = 2, classes = 0},
     #camp_score_exchange_item{id = 1, order_id = 2,
                               item_id = 20054, bind = 0, base_num = 1,
                               exchange_num = 1, cost = 3, is_effect = 0,
                               is_zone_cast = 0, min_lev = 1, max_lev = 200,
                               sex = 2, classes = 0},
     #camp_score_exchange_item{id = 1, order_id = 3,
                               item_id = 90051, bind = 0, base_num = 25,
                               exchange_num = 1, cost = 8, is_effect = 0,
                               is_zone_cast = 0, min_lev = 1, max_lev = 200,
                               sex = 2, classes = 0},
     #camp_score_exchange_item{id = 1, order_id = 4,
                               item_id = 70502, bind = 0, base_num = 1,
                               exchange_num = 1, cost = 15, is_effect = 1,
                               is_zone_cast = 0, min_lev = 1, max_lev = 200,
                               sex = 2, classes = 0},
     #camp_score_exchange_item{id = 2, order_id = 1,
                               item_id = 20005, bind = 0, base_num = 1,
                               exchange_num = 1, cost = 2, is_effect = 0,
                               is_zone_cast = 0, min_lev = 1, max_lev = 200,
                               sex = 2, classes = 0},
     #camp_score_exchange_item{id = 2, order_id = 2,
                               item_id = 20025, bind = 0, base_num = 1,
                               exchange_num = 1, cost = 5, is_effect = 0,
                               is_zone_cast = 0, min_lev = 1, max_lev = 200,
                               sex = 2, classes = 0},
     #camp_score_exchange_item{id = 2, order_id = 3,
                               item_id = 90051, bind = 0, base_num = 25,
                               exchange_num = 1, cost = 8, is_effect = 0,
                               is_zone_cast = 0, min_lev = 1, max_lev = 200,
                               sex = 2, classes = 0},
     #camp_score_exchange_item{id = 2, order_id = 4,
                               item_id = 70503, bind = 0, base_num = 1,
                               exchange_num = 1, cost = 50, is_effect = 1,
                               is_zone_cast = 0, min_lev = 1, max_lev = 200,
                               sex = 2, classes = 0},
     #camp_score_exchange_item{id = 3, order_id = 1,
                               item_id = 20004, bind = 0, base_num = 1,
                               exchange_num = 1, cost = 2, is_effect = 0,
                               is_zone_cast = 0, min_lev = 1, max_lev = 200,
                               sex = 2, classes = 0},
     #camp_score_exchange_item{id = 3, order_id = 2,
                               item_id = 20000, bind = 0, base_num = 1,
                               exchange_num = 1, cost = 5, is_effect = 0,
                               is_zone_cast = 0, min_lev = 1, max_lev = 200,
                               sex = 2, classes = 0},
     #camp_score_exchange_item{id = 3, order_id = 3,
                               item_id = 90051, bind = 0, base_num = 25,
                               exchange_num = 1, cost = 8, is_effect = 0,
                               is_zone_cast = 0, min_lev = 1, max_lev = 200,
                               sex = 2, classes = 0},
     #camp_score_exchange_item{id = 3, order_id = 4,
                               item_id = 70503, bind = 0, base_num = 1,
                               exchange_num = 1, cost = 15, is_effect = 1,
                               is_zone_cast = 0, min_lev = 1, max_lev = 200,
                               sex = 2, classes = 0},
     #camp_score_exchange_item{id = 4, order_id = 1,
                               item_id = 20052, bind = 0, base_num = 1,
                               exchange_num = 1, cost = 2, is_effect = 0,
                               is_zone_cast = 0, min_lev = 1, max_lev = 200,
                               sex = 2, classes = 0},
     #camp_score_exchange_item{id = 4, order_id = 2,
                               item_id = 20002, bind = 0, base_num = 2,
                               exchange_num = 1, cost = 7, is_effect = 0,
                               is_zone_cast = 0, min_lev = 1, max_lev = 200,
                               sex = 2, classes = 0},
     #camp_score_exchange_item{id = 4, order_id = 3,
                               item_id = 90051, bind = 0, base_num = 25,
                               exchange_num = 1, cost = 8, is_effect = 0,
                               is_zone_cast = 0, min_lev = 1, max_lev = 200,
                               sex = 2, classes = 0},
     #camp_score_exchange_item{id = 4, order_id = 4,
                               item_id = 22445, bind = 0, base_num = 1,
                               exchange_num = 1, cost = 75, is_effect = 1,
                               is_zone_cast = 0, min_lev = 1, max_lev = 200,
                               sex = 2, classes = 0}].

get_common_gift() -> [].

get_special_item({1, 1, 20006}) ->
    #camp_score_exchange_item{id = 1, order_id = 1,
                              item_id = 20006, bind = 0, base_num = 3,
                              exchange_num = 1, cost = 2, is_effect = 0,
                              is_zone_cast = 0, min_lev = 1, max_lev = 200,
                              sex = 2, classes = 0};
get_special_item({1, 2, 20054}) ->
    #camp_score_exchange_item{id = 1, order_id = 2,
                              item_id = 20054, bind = 0, base_num = 1,
                              exchange_num = 1, cost = 3, is_effect = 0,
                              is_zone_cast = 0, min_lev = 1, max_lev = 200,
                              sex = 2, classes = 0};
get_special_item({1, 3, 90051}) ->
    #camp_score_exchange_item{id = 1, order_id = 3,
                              item_id = 90051, bind = 0, base_num = 25,
                              exchange_num = 1, cost = 8, is_effect = 0,
                              is_zone_cast = 0, min_lev = 1, max_lev = 200,
                              sex = 2, classes = 0};
get_special_item({1, 4, 70502}) ->
    #camp_score_exchange_item{id = 1, order_id = 4,
                              item_id = 70502, bind = 0, base_num = 1,
                              exchange_num = 1, cost = 15, is_effect = 1,
                              is_zone_cast = 0, min_lev = 1, max_lev = 200,
                              sex = 2, classes = 0};
get_special_item({2, 1, 20005}) ->
    #camp_score_exchange_item{id = 2, order_id = 1,
                              item_id = 20005, bind = 0, base_num = 1,
                              exchange_num = 1, cost = 2, is_effect = 0,
                              is_zone_cast = 0, min_lev = 1, max_lev = 200,
                              sex = 2, classes = 0};
get_special_item({2, 2, 20025}) ->
    #camp_score_exchange_item{id = 2, order_id = 2,
                              item_id = 20025, bind = 0, base_num = 1,
                              exchange_num = 1, cost = 5, is_effect = 0,
                              is_zone_cast = 0, min_lev = 1, max_lev = 200,
                              sex = 2, classes = 0};
get_special_item({2, 3, 90051}) ->
    #camp_score_exchange_item{id = 2, order_id = 3,
                              item_id = 90051, bind = 0, base_num = 25,
                              exchange_num = 1, cost = 8, is_effect = 0,
                              is_zone_cast = 0, min_lev = 1, max_lev = 200,
                              sex = 2, classes = 0};
get_special_item({2, 4, 70503}) ->
    #camp_score_exchange_item{id = 2, order_id = 4,
                              item_id = 70503, bind = 0, base_num = 1,
                              exchange_num = 1, cost = 50, is_effect = 1,
                              is_zone_cast = 0, min_lev = 1, max_lev = 200,
                              sex = 2, classes = 0};
get_special_item({3, 1, 20004}) ->
    #camp_score_exchange_item{id = 3, order_id = 1,
                              item_id = 20004, bind = 0, base_num = 1,
                              exchange_num = 1, cost = 2, is_effect = 0,
                              is_zone_cast = 0, min_lev = 1, max_lev = 200,
                              sex = 2, classes = 0};
get_special_item({3, 2, 20000}) ->
    #camp_score_exchange_item{id = 3, order_id = 2,
                              item_id = 20000, bind = 0, base_num = 1,
                              exchange_num = 1, cost = 5, is_effect = 0,
                              is_zone_cast = 0, min_lev = 1, max_lev = 200,
                              sex = 2, classes = 0};
get_special_item({3, 3, 90051}) ->
    #camp_score_exchange_item{id = 3, order_id = 3,
                              item_id = 90051, bind = 0, base_num = 25,
                              exchange_num = 1, cost = 8, is_effect = 0,
                              is_zone_cast = 0, min_lev = 1, max_lev = 200,
                              sex = 2, classes = 0};
get_special_item({3, 4, 70503}) ->
    #camp_score_exchange_item{id = 3, order_id = 4,
                              item_id = 70503, bind = 0, base_num = 1,
                              exchange_num = 1, cost = 15, is_effect = 1,
                              is_zone_cast = 0, min_lev = 1, max_lev = 200,
                              sex = 2, classes = 0};
get_special_item({4, 1, 20052}) ->
    #camp_score_exchange_item{id = 4, order_id = 1,
                              item_id = 20052, bind = 0, base_num = 1,
                              exchange_num = 1, cost = 2, is_effect = 0,
                              is_zone_cast = 0, min_lev = 1, max_lev = 200,
                              sex = 2, classes = 0};
get_special_item({4, 2, 20002}) ->
    #camp_score_exchange_item{id = 4, order_id = 2,
                              item_id = 20002, bind = 0, base_num = 2,
                              exchange_num = 1, cost = 7, is_effect = 0,
                              is_zone_cast = 0, min_lev = 1, max_lev = 200,
                              sex = 2, classes = 0};
get_special_item({4, 3, 90051}) ->
    #camp_score_exchange_item{id = 4, order_id = 3,
                              item_id = 90051, bind = 0, base_num = 25,
                              exchange_num = 1, cost = 8, is_effect = 0,
                              is_zone_cast = 0, min_lev = 1, max_lev = 200,
                              sex = 2, classes = 0};
get_special_item({4, 4, 22445}) ->
    #camp_score_exchange_item{id = 4, order_id = 4,
                              item_id = 22445, bind = 0, base_num = 1,
                              exchange_num = 1, cost = 75, is_effect = 1,
                              is_zone_cast = 0, min_lev = 1, max_lev = 200,
                              sex = 2, classes = 0};
get_special_item(_) -> #camp_score_exchange_item{}.

get_quest_list() ->
    [83716,
     83717,
     83718,
     83719,
     83720,
     83721,
     83722,
     83723,
     83724,
     83725,
     83726,
     83727,
     83728,
     83729,
     83730,
     83731,
     83732,
     83733,
     83734,
     83735,
     83736,
     83737,
     83738,
     83739,
     83740,
     83741,
     83742,
     83743].

get_quest_info(83716) -> {83716, 5, "1026", 2, 1};
get_quest_info(83717) -> {83717, 5, "1000", 3, 1};
get_quest_info(83718) -> {83718, 5, "1014", 4, 1};
get_quest_info(83719) -> {83719, 5, "1002", 5, 1};
get_quest_info(83720) -> {83720, 5, "1027", 6, 1};
get_quest_info(83721) -> {83721, 5, "2001", 7, 1};
get_quest_info(83722) -> {83722, 15, "20053", 8, 1};
get_quest_info(83723) -> {83723, 20, "90002", 9, 1};
get_quest_info(83724) -> {83724, 8, "90018", 1, 1};
get_quest_info(83725) -> {83725, 5, "1026", 2, 1};
get_quest_info(83726) -> {83726, 5, "1000", 3, 1};
get_quest_info(83727) -> {83727, 5, "1014", 4, 1};
get_quest_info(83728) -> {83728, 5, "1002", 5, 1};
get_quest_info(83729) -> {83729, 5, "1027", 6, 1};
get_quest_info(83730) -> {83730, 5, "2001", 7, 1};
get_quest_info(83731) -> {83731, 15, "20053", 8, 1};
get_quest_info(83732) -> {83732, 20, "90002", 9, 1};
get_quest_info(83733) -> {83733, 8, "90018", 1, 1};
get_quest_info(83734) -> {83734, 5, "1026", 2, 1};
get_quest_info(83735) -> {83735, 5, "1000", 3, 1};
get_quest_info(83736) -> {83736, 5, "1014", 4, 1};
get_quest_info(83737) -> {83737, 5, "1002", 5, 1};
get_quest_info(83738) -> {83738, 5, "1027", 6, 1};
get_quest_info(83739) -> {83739, 5, "2001", 7, 1};
get_quest_info(83740) -> {83740, 8, "2004", 8, 1};
get_quest_info(83741) -> {83741, 15, "20053", 9, 1};
get_quest_info(83742) -> {83742, 20, "90002", 10, 1};
get_quest_info(83743) -> {83743, 20, "90018", 1, 1};
get_quest_info(_) -> false.

get_other_info() ->
    [{60000,
      lang:get("圣诞乐兑"),
      lang:get("亲爱的玩家，圣诞活动已结束，您剩余的乐兑积分将折算成银币返还给您，请查收"),
      val_not_exist}].

get_quests({1357, 1}) ->
    [83716,
     83717,
     83718,
     83719,
     83720,
     83721,
     83722,
     83723,
     83724];
get_quests({1357, 2}) ->
    [83725,
     83726,
     83727,
     83728,
     83729,
     83730,
     83731,
     83732,
     83733];
get_quests({1357, 3}) ->
    [83734,
     83735,
     83736,
     83737,
     83738,
     83739,
     83740,
     83741,
     83742,
     83743];
get_quests(_) -> [].

