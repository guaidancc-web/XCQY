-file("src/mod/alchemy/alchemy_ver.erl", 1).

-module(alchemy_ver).

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

-file("src/mod/alchemy/alchemy_ver.erl", 13).

-file("inc/alchemy.hrl", 1).

-record(m_alchemy, {ver = 0, shops = []}).

-record(alchemy_shop,
        {ver = 1,
         id = 0 :: non_neg_integer(),
         volume = 0,
         products = [],
         is_auto = 1 :: 1 | 0}).

-file("src/mod/alchemy/alchemy_ver.erl", 14).

do(Data = #m_alchemy{ver = 0, shops = Shops}) ->
    case do_shop(Shops, []) of
        {ok, NewShops} ->
            {ok, Data#m_alchemy{shops = NewShops}};
        Else -> Else
    end;
do(_) -> {false, lang:get("日程数据转换失败")}.

do_shop([], Shops) -> {ok, Shops};
do_shop([H | T], Shops) ->
    case do_shop(H) of
        {ok, D} -> do_shop(T, [D | Shops]);
        Else -> Else
    end.

do_shop({alchemy_shop, Ver = 0, Id, Vol, Products}) ->
    IsAuto = 1,
    do_shop({alchemy_shop,
             Ver + 1,
             Id,
             Vol,
             Products,
             IsAuto});
do_shop(D = #alchemy_shop{ver = 1}) -> {ok, D}.

