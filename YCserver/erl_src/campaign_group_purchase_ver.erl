-file("src/mod/campaign/campaign_group_purchase_ver.erl",
      1).

-module(campaign_group_purchase_ver).

-export([do/1]).

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

-file("src/mod/campaign/campaign_group_purchase_ver.erl",
      14).

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

-file("src/mod/campaign/campaign_group_purchase_ver.erl",
      15).

do({campaign_group_purchase_item,
    Id,
    BaseId,
    Num,
    LimitNum,
    Price,
    PriceType,
    DiscountList,
    StartTime,
    EndTime,
    CheckList,
    LevMin,
    LevMax,
    BaseRoleNum}) ->
    Ver = 1,
    Sex = 2,
    do({campaign_group_purchase_item,
        Id,
        Ver,
        BaseId,
        Num,
        LimitNum,
        Price,
        PriceType,
        DiscountList,
        StartTime,
        EndTime,
        CheckList,
        LevMin,
        LevMax,
        BaseRoleNum,
        Sex});
do({campaign_group_purchase_item,
    Id,
    Ver = 2,
    BaseId,
    Num,
    LimitNum,
    Price,
    PriceType,
    DiscountList,
    StartTime,
    EndTime,
    CheckList,
    LevMin,
    LevMax,
    BaseRoleNum,
    Sex}) ->
    NewVer = Ver + 1,
    List1 = [],
    List2 = [],
    do({{campaign_group_purchase_item,
         Id,
         NewVer,
         BaseId,
         Num,
         LimitNum,
         Price,
         PriceType,
         DiscountList,
         StartTime,
         EndTime,
         CheckList,
         LevMin,
         LevMax,
         BaseRoleNum,
         Sex,
         List1,
         List2}});
do(Data = #campaign_group_purchase_item{ver = 2}) ->
    {ok, Data};
do(_Err) ->
    logger:error("团购物品版本转换失败:~w",
                 [_Err],
                 campaign_group_purchase_ver,
                 29),
    {false, lang:get("团购物品版本转换失败")}.

