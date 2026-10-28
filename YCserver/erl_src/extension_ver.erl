-file("src/mod/extension/extension_ver.erl", 1).

-module(extension_ver).

-export([do/1, do_role/1]).

-file("inc/extension.hrl", 1).

-record(m_extension,
        {ver = 3,
         init = 0,
         key = "",
         key_time = 0,
         ships = [],
         apply_id = {0, "", 0},
         apply_key = "",
         apply_name = "",
         day_score = 0,
         day_flag = 0}).

-record(extension_key,
        {key, role_id, role_name = "", time}).

-record(extension_role,
        {ver = 2,
         id,
         name,
         apply_id = {0, "", 0},
         apply_key = "",
         apply_name = "",
         key = "",
         key_time = 0,
         ships = [],
         rewarded = [],
         day_score = 0,
         day_flag = 0}).

-record(extension_ship,
        {ver = 2,
         id = {0, "", 0},
         name = "",
         score = 0,
         key = "",
         time = 0,
         activity_score = 0,
         activity_time = []}).

-file("src/mod/extension/extension_ver.erl", 15).

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

-file("src/mod/extension/extension_ver.erl", 16).

do({m_extension,
    Ver = 1,
    Init,
    Key,
    KeyTime,
    Ships,
    ApplyId,
    ApplyKey}) ->
    ApplyName = "",
    do({m_extension,
        Ver + 1,
        Init,
        Key,
        KeyTime,
        Ships,
        ApplyId,
        ApplyKey,
        ApplyName});
do({m_extension,
    Ver = 2,
    Init,
    Key,
    KeyTime,
    Ships,
    ApplyId,
    ApplyKey,
    ApplyName}) ->
    DayFlag = 0,
    DayScore = 0,
    do({m_extension,
        Ver + 1,
        Init,
        Key,
        KeyTime,
        Ships,
        ApplyId,
        ApplyKey,
        ApplyName,
        DayFlag,
        DayScore});
do(Data = #m_extension{ver = 3}) -> {ok, Data};
do(_Err) ->
    logger:error("角色推广员版本转换失败:~w",
                 [_Err],
                 extension_ver,
                 28),
    {false, lang:get("角色推广员版本转换失败")}.

do_role({extension_role,
         Ver = 1,
         Id,
         Name,
         ApplyId,
         ApplyKey,
         ApplyName,
         Key,
         KeyTime,
         Ships,
         Rewarded}) ->
    DayScore = 0,
    DayFlag = 0,
    do_role({extension_role,
             Ver + 1,
             Id,
             Name,
             ApplyId,
             ApplyKey,
             ApplyName,
             Key,
             KeyTime,
             Ships,
             Rewarded,
             DayScore,
             DayFlag});
do_role(Data = #extension_role{ver = 2,
                               ships = Ships}) ->
    case do_ships_list(Ships, []) of
        {ok, NewShips} ->
            NewData = Data#extension_role{ships = NewShips},
            {ok, NewData};
        {false, Reason} -> {false, Reason}
    end;
do_role(_Err) ->
    logger:error("推广信息版本转换失败:~w",
                 [_Err],
                 extension_ver,
                 45),
    {false, lang:get("推广信息版本转换失败")}.

do_ships_list([], Ships) -> {ok, Ships};
do_ships_list([H | T], Ships) ->
    case do_ships(H) of
        {ok, NewH} -> do_ships_list(T, [NewH | Ships]);
        {false, Reason} -> {false, Reason}
    end.

do_ships({extension_ship,
          Ver = 1,
          Id,
          Name,
          Score,
          Key,
          Time}) ->
    ActiveScore = 0,
    ActiveTime = [],
    do_ships({extension_ship,
              Ver + 1,
              Id,
              Name,
              Score,
              Key,
              Time,
              ActiveScore,
              ActiveTime});
do_ships(Data = #extension_ship{ver = 2}) -> {ok, Data};
do_ships(_Err) ->
    logger:error("推广关系版本转换失败:~w",
                 [_Err],
                 extension_ver,
                 64),
    {false, lang:get("推广关系版本转换失败")}.

