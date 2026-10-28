-file("src/mod/camp_pray/camp_pray_ver.erl", 1).

-module(camp_pray_ver).

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

-file("src/mod/camp_pray/camp_pray_ver.erl", 11).

-file("inc/camp_pray.hrl", 1).

-record(m_camp_pray,
        {ver = 2,
         camp_id = 0,
         reset_times = 0,
         choose_ids = [],
         do_times = 0,
         must_items = []}).

-file("src/mod/camp_pray/camp_pray_ver.erl", 12).

-export([do/1]).

do({m_camp_pray,
    Ver = 1,
    CampId,
    ResetTimes,
    ChooseIds,
    DoTimes}) ->
    MustItems = [],
    do({m_camp_pray,
        Ver + 1,
        CampId,
        ResetTimes,
        ChooseIds,
        DoTimes,
        MustItems});
do(Data = #m_camp_pray{ver = 2}) -> {ok, Data};
do(Data) ->
    logger:error("数据转换失败:~w", [Data], camp_pray_ver, 22),
    {false, lang:get("数据转换失败")}.

