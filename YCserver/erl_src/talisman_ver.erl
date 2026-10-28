-file("src/mod/talisman/talisman_ver.erl", 1).

-module(talisman_ver).

-export([do/1]).

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

-file("src/mod/talisman/talisman_ver.erl", 14).

-file("inc/talisman.hrl", 1).

-record(m_talisman,
        {ver = 5,
         next_id = 1,
         use_plan = 1,
         plan_1 = [],
         plan_2 = [],
         items = [],
         fusion_lev = 0,
         fusion_val = 0,
         skills = [],
         fc = 0,
         remold_formula = [],
         last_gain_id = 0,
         volume = 48}).

-record(talisman,
        {ver = 3,
         id = 1,
         base_id = 0,
         type = 0,
         quality = 0,
         lev = 0,
         attr = [],
         num = 1,
         fc = 0}).

-record(talisman_base,
        {base_id = 0,
         name = "",
         type = 0,
         quality = 0,
         lev = 0,
         need_lev = 0,
         need_lev_break = 0,
         set_id = 0,
         fusion_val = 0,
         base_attr = [],
         grade = 0}).

-file("src/mod/talisman/talisman_ver.erl", 15).

do({m_talisman,
    Ver = 1,
    NextId,
    UsePlan,
    Plan1,
    Plan2,
    Items,
    FusionLev,
    FusionVal,
    Skills}) ->
    Fc = 0,
    NewVer = Ver + 1,
    do({m_talisman,
        NewVer,
        NextId,
        UsePlan,
        Plan1,
        Plan2,
        Items,
        FusionLev,
        FusionVal,
        Skills,
        Fc});
do({m_talisman,
    Ver = 2,
    NextId,
    UsePlan,
    Plan1,
    Plan2,
    Items,
    FusionLev,
    FusionVal,
    Skills,
    Fc}) ->
    RemoldFormula = [],
    do({m_talisman,
        Ver + 1,
        NextId,
        UsePlan,
        Plan1,
        Plan2,
        Items,
        FusionLev,
        FusionVal,
        Skills,
        Fc,
        RemoldFormula});
do({m_talisman,
    Ver = 3,
    NextId,
    UsePlan,
    Plan1,
    Plan2,
    Items,
    FusionLev,
    FusionVal,
    Skills,
    Fc,
    RemoldFormula}) ->
    LastGainId = 0,
    do({m_talisman,
        Ver + 1,
        NextId,
        UsePlan,
        Plan1,
        Plan2,
        Items,
        FusionLev,
        FusionVal,
        Skills,
        Fc,
        RemoldFormula,
        LastGainId});
do({m_talisman,
    Ver = 4,
    NextId,
    UsePlan,
    Plan1,
    Plan2,
    Items,
    FusionLev,
    FusionVal,
    Skills,
    Fc,
    RemoldFormula,
    LastGainId}) ->
    Volume = 48,
    do({m_talisman,
        Ver + 1,
        NextId,
        UsePlan,
        Plan1,
        Plan2,
        Items,
        FusionLev,
        FusionVal,
        Skills,
        Fc,
        RemoldFormula,
        LastGainId,
        Volume});
do(Mtalisman = #m_talisman{ver = 5, items = Items}) ->
    case do_item(Items, []) of
        {true, NewItems} ->
            {ok, Mtalisman#m_talisman{items = NewItems}};
        {false, Reason} -> {false, Reason}
    end;
do(_Err) ->
    logger:error("法宝版本错误:~w", [_Err], talisman_ver, 37),
    {false, "法宝版本转换失败"}.

do_item([], Items) -> {true, Items};
do_item([H | T], Items) ->
    case do_talisman(H) of
        {ok, NewH} -> do_item(T, [NewH | Items]);
        {false, Reason} -> {false, Reason}
    end.

do_talisman({talisman,
             Ver = 1,
             Id,
             BaseId,
             Type,
             Quality,
             Lev,
             Attr,
             Num}) ->
    Fc = 0,
    NewVer = Ver + 1,
    do_talisman({talisman,
                 NewVer,
                 Id,
                 BaseId,
                 Type,
                 Quality,
                 Lev,
                 Attr,
                 Num,
                 Fc});
do_talisman({talisman,
             Ver = 2,
             Id,
             BaseId,
             Type,
             Quality,
             Lev,
             Attr,
             Num,
             Fc}) ->
    NewAttr = [begin
                   case Name =/= 0 of
                       true ->
                           {attr_base,
                            Type2,
                            Name,
                            10000 + Flag,
                            CalcType,
                            Val};
                       _ -> {attr_base, Type2, Name, Flag, CalcType, Val}
                   end
               end
               || {attr_base, Type2, Name, Flag, CalcType, Val}
                      <- Attr],
    NewVer = Ver + 1,
    do_talisman({talisman,
                 NewVer,
                 Id,
                 BaseId,
                 Type,
                 Quality,
                 Lev,
                 NewAttr,
                 Num,
                 Fc});
do_talisman(Talisman = #talisman{ver = 3}) ->
    {ok, Talisman};
do_talisman(_Err) ->
    logger:error("法宝版本错误:~w", [_Err], talisman_ver, 68),
    {false, "法宝版本转换失败"}.

