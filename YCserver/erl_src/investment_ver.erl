-file("src/mod/investment/investment_ver.erl", 1).

-module(investment_ver).

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

-file("src/mod/investment/investment_ver.erl", 12).

-file("inc/investment.hrl", 1).

-record(m_investment,
        {ver = 2,
         start_time = 0,
         revenue = [],
         id = 2,
         start_time2 = 0,
         revenue2 = []}).

-file("src/mod/investment/investment_ver.erl", 13).

do({m_investment, Ver = 0, Startime, Revenue}) ->
    Id = case Startime of
             0 -> 2;
             _ -> 1
         end,
    do({m_investment, Ver + 1, Startime, Revenue, Id});
do({m_investment, Ver = 1, Startime, Revenue, Id}) ->
    StartTime2 = 0,
    Revenue2 = [],
    do({m_investment,
        Ver + 1,
        Startime,
        Revenue,
        Id,
        StartTime2,
        Revenue2});
do(Data = #m_investment{ver = 2}) -> {ok, Data};
do(_) -> {false, lang:get("投资计划数据转换失败")}.

