-file("src/mod/lottery/lottery_ver.erl", 1).

-module(lottery_ver).

-export([do/1]).

-file("inc/lottery.hrl", 1).

-record(lottery,
        {idx = 0 :: non_neg_integer(),
         ver = 2,
         idx_temp = 0 :: non_neg_integer(),
         item_idx = 0 :: non_neg_integer(),
         item_id = 0 :: non_neg_integer(),
         item_count = 0 :: non_neg_integer(),
         pos = 0 :: non_neg_integer(),
         gold_type = 0 :: non_neg_integer(),
         gold_once = 1 :: non_neg_integer(),
         times_sum = 0 :: non_neg_integer(),
         times_now = 0 :: non_neg_integer(),
         time = 0 :: non_neg_integer(),
         lucky_num = 0 :: non_neg_integer(),
         times_lottery = 0 :: non_neg_integer(),
         state = 0 :: non_neg_integer(),
         num_sum = 0 :: non_neg_integer(),
         hot = 0 :: non_neg_integer(),
         price = 0 :: non_neg_integer(),
         rare = 0 :: non_neg_integer(),
         sort = 0 :: non_neg_integer(),
         role_id = {0, "", 0},
         role_name = "" :: list(),
         history = [] :: list(),
         num_list = [] :: list(),
         id_data = 0 :: non_neg_integer(),
         left_list = [] :: list(),
         buy_list = [] :: list(),
         history_deal = [] :: list()}).

-record(lottery_history,
        {time = 0 :: non_neg_integer(),
         num = 0 :: non_neg_integer(),
         role_id = {0, "", 0} :: list(),
         role_name = "" :: list(),
         item_idx = 0 :: non_neg_integer(),
         item_id = 0 :: non_neg_integer(),
         count = 0 :: non_neg_integer()}).

-record(lottery_mail,
        {idx = 0 :: non_neg_integer(),
         role_id = {0, "", 0} :: list(),
         title = "" :: list(),
         content = "" :: list(),
         item_list = "" :: list(),
         time = 0 :: non_neg_integer(),
         type = 0 :: non_neg_integer()}).

-record(lottery_reward_log,
        {idx = 0 :: non_neg_integer(),
         role_id = {0, "", 0} :: list(),
         role_name = "" :: list(),
         item_idx = 0 :: non_neg_integer(),
         item_id = 0 :: non_neg_integer(),
         item_count = 0 :: non_neg_integer(),
         times_buy = 0 :: non_neg_integer(),
         times_sum = 0 :: non_neg_integer(),
         time = 0 :: non_neg_integer()}).

-file("src/mod/lottery/lottery_ver.erl", 14).

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

-file("src/mod/lottery/lottery_ver.erl", 15).

do({lottery,
    Idx,
    IdxTemp,
    ItemIdx,
    ItemId,
    ItemCount,
    Pos,
    GoldType,
    GoldOnce,
    TimesSum,
    TimesNow,
    Time,
    LuckyNum,
    TimesLottery,
    State,
    NumSum,
    Hot,
    Price,
    RoleId,
    RoleName,
    History,
    NumList,
    IdData,
    LeftList,
    BuyList,
    HistoryDeal}) ->
    Rare = 0,
    do({lottery,
        Idx,
        1,
        IdxTemp,
        ItemIdx,
        ItemId,
        ItemCount,
        Pos,
        GoldType,
        GoldOnce,
        TimesSum,
        TimesNow,
        Time,
        LuckyNum,
        TimesLottery,
        State,
        NumSum,
        Hot,
        Price,
        Rare,
        RoleId,
        RoleName,
        History,
        NumList,
        IdData,
        LeftList,
        BuyList,
        HistoryDeal});
do({lottery,
    Idx,
    Ver,
    IdxTemp,
    ItemIdx,
    ItemId,
    ItemCount,
    Pos,
    GoldType,
    GoldOnce,
    TimesSum,
    TimesNow,
    Time,
    LuckyNum,
    TimesLottery,
    State,
    NumSum,
    Hot,
    Price,
    Rare,
    RoleId,
    RoleName,
    History,
    NumList,
    IdData,
    LeftList,
    BuyList,
    HistoryDeal}) ->
    Sort = 0,
    do({lottery,
        Idx,
        Ver + 1,
        IdxTemp,
        ItemIdx,
        ItemId,
        ItemCount,
        Pos,
        GoldType,
        GoldOnce,
        TimesSum,
        TimesNow,
        Time,
        LuckyNum,
        TimesLottery,
        State,
        NumSum,
        Hot,
        Price,
        Rare,
        Sort,
        RoleId,
        RoleName,
        History,
        NumList,
        IdData,
        LeftList,
        BuyList,
        HistoryDeal});
do(Data = #lottery{ver = 2}) -> {ok, Data};
do(_Err) ->
    logger:error("一元夺宝版本转换失败:~w", [_Err], lottery_ver, 26),
    {false, lang:get("一元夺宝版本转换失败")}.

