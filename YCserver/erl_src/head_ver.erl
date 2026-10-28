-file("src/mod/head/head_ver.erl", 1).

-module(head_ver).

-export([do/1]).

-file("inc/head.hrl", 1).

-record(m_head,
        {ver = 2 :: pos_integer(),
         id_now = 0 :: non_neg_integer(),
         time_buy = 0 :: non_neg_integer(),
         day = 0 :: non_neg_integer(),
         head = [] :: list(),
         frame_id_now = 0 :: non_neg_integer(),
         frame_time_buy = 0 :: non_neg_integer(),
         frame_day = 0 :: non_neg_integer(),
         head_frame = [] :: list()}).

-record(head,
        {id = 0 :: non_neg_integer(),
         time_buy = 0 :: non_neg_integer(),
         day = 0 :: non_neg_integer(),
         list = [] :: list()}).

-record(head_frame,
        {id = 0 :: non_neg_integer(),
         time_buy = 0 :: non_neg_integer(),
         day = 0 :: non_neg_integer(),
         list = [] :: list()}).

-file("src/mod/head/head_ver.erl", 14).

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

-file("src/mod/head/head_ver.erl", 15).

do({m_head, Ver = 1, IdNow, TimeBuy, Day, Head}) ->
    FrameIdNow = 0,
    FrameTimeBuy = 0,
    FrameDay = 0,
    HeadFrame = [],
    do({m_head,
        Ver + 1,
        IdNow,
        TimeBuy,
        Day,
        Head,
        FrameIdNow,
        FrameTimeBuy,
        FrameDay,
        HeadFrame});
do(Data = #m_head{ver = 2}) -> {ok, Data};
do(_Err) ->
    logger:error("角色头像版本转换失败:~w", [_Err], head_ver, 26),
    {false, lang:get("角色头像版本转换失败")}.

