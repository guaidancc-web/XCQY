-file("src/mod/dress/fashion_ver.erl", 1).

-module(fashion_ver).

-export([do/1, calc_collect_val/1]).

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

-file("src/mod/dress/fashion_ver.erl", 15).

-file("inc/fashion.hrl", 1).

-record(m_fashion,
        {ver = 5,
         head = [],
         clothes = [],
         belt = [],
         ring = [],
         head_dyeing = [],
         clothes_dyeing = [],
         head_ornament = [],
         collect_lev = 0,
         collect_val = 0,
         classes_eqm = 0,
         eqm = []}).

-record(fashion_dress_data,
        {base_id = 0,
         name = "",
         type,
         quality = 0,
         classes = 0,
         sex = 2,
         lev,
         set_id = 0,
         texture_id = 0,
         is_origin = 0,
         loss = [],
         attrs = [],
         score = 0,
         can_use = 0,
         model_id = 0}).

-record(fashion_wear_data,
        {id = 0,
         base_id = 0,
         expire_type = 0,
         expire_time = 0}).

-record(fashion_dress,
        {base_id = 0,
         expire_type = 0,
         expire_time = 0,
         is_wear = 0}).

-record(fashion_dyeing, {dyeing_id = 0, is_use = 0}).

-record(fashion_time_data,
        {id = 0, expire_type = 0, expire_time = 0}).

-file("src/mod/dress/fashion_ver.erl", 16).

-file("inc/item.hrl", 1).

-record(item_base,
        {id = 0 :: non_neg_integer(),
         name = "" :: list(),
         type = 0 :: non_neg_integer(),
         quality = 0 :: 0..4,
         overlap = 1 :: pos_integer(),
         look_id = 0 :: non_neg_integer(),
         use_type = 0 :: 0..4,
         expire_type = 0 :: non_neg_integer(),
         expire_time = 0 ::
             non_neg_integer() |
             {{pos_integer(), pos_integer(), pos_integer()},
              {non_neg_integer(),
               non_neg_integer(),
               non_neg_integer()}},
         attr = [] :: [tuple()],
         lev = 0,
         classes = 0,
         sex = 2,
         buy_source = [],
         condition = [] :: [tuple()],
         effect = [] :: [tuple()],
         alchemy = 0 :: non_neg_integer()}).

-record(item,
        {ver = 0 :: non_neg_integer(),
         id = 0 :: non_neg_integer(),
         base_id = 0 :: non_neg_integer(),
         bind = 1 :: 0 | 1,
         look_id = 0,
         type = 0 :: non_neg_integer(),
         use_type = 0 :: 0..4,
         quality = 0 :: 0..4,
         craft = 0 :: 0..5,
         enchant = -1 :: integer(),
         growth_lev = 0,
         growth_val = 0,
         step = 0 :: pos_integer(),
         quantity = 1 :: 0..250,
         pos = 0 :: non_neg_integer(),
         expire_type = 0 :: 0..4,
         expire_time = 0 :: non_neg_integer(),
         attr = [] :: [tuple()],
         reset_attr = [],
         lev = 1 :: pos_integer(),
         classes = 0 :: 0..6,
         sex = 2 :: 0..2,
         extra = [] :: [tuple()],
         data = [] :: [any()]}).

-record(item_extra_info, {source, price}).

-file("src/mod/dress/fashion_ver.erl", 17).

do({m_fashion, Ver = 1, Head, Clothes, Belt, Ring}) ->
    NewVer = Ver + 1,
    HeadDyeing = [],
    ClothesDyeing = [],
    do({m_fashion,
        NewVer,
        Head,
        Clothes,
        Belt,
        Ring,
        HeadDyeing,
        ClothesDyeing});
do({m_fashion,
    Ver = 2,
    Head,
    Clothes,
    Belt,
    Ring,
    HeadDyeing,
    ClothesDyeing}) ->
    NewVer = Ver + 1,
    HeadOrnament = [],
    do({m_fashion,
        NewVer,
        Head,
        Clothes,
        Belt,
        Ring,
        HeadDyeing,
        ClothesDyeing,
        HeadOrnament});
do({m_fashion,
    Ver = 3,
    Head,
    Clothes,
    Belt,
    Ring,
    HeadDyeing,
    ClothesDyeing,
    HeadOrnament}) ->
    NewVer = Ver + 1,
    CollectLev = 0,
    CollectVal = calc_collect_val(Head ++
                                      Clothes ++
                                          Belt ++
                                              HeadOrnament ++
                                                  HeadDyeing ++ ClothesDyeing),
    do({m_fashion,
        NewVer,
        Head,
        Clothes,
        Belt,
        Ring,
        HeadDyeing,
        ClothesDyeing,
        HeadOrnament,
        CollectLev,
        CollectVal});
do({m_fashion,
    Ver,
    Head,
    Clothes,
    Belt,
    Ring,
    HeadDyeing,
    ClothesDyeing,
    HeadOrnament,
    CollectLev,
    CollectVal}) ->
    do({m_fashion,
        Ver + 1,
        Head,
        Clothes,
        Belt,
        Ring,
        HeadDyeing,
        ClothesDyeing,
        HeadOrnament,
        CollectLev,
        CollectVal,
        0,
        []});
do(Mf = #m_fashion{}) -> {ok, Mf};
do(_Err) ->
    logger:error("时装版本错误:~w", [_Err], fashion_ver, 38),
    {false, "角色时装版本转换失败"}.

calc_collect_val(List) -> calc_collect_val(List, 0).

calc_collect_val([], Val) -> Val;
calc_collect_val([{fashion_dress, BaseId, 0, _, _} | T],
                 Val) ->
    AddVal = fashion_data:get_dress_collect_val(BaseId),
    calc_collect_val(T, Val + AddVal);
calc_collect_val([{fashion_dyeing, DyeId, _} | T],
                 Val) ->
    AddVal = fashion_data:get_dyeing_collect_val(DyeId),
    calc_collect_val(T, Val + AddVal);
calc_collect_val([_Err | T], Val) ->
    calc_collect_val(T, Val).

