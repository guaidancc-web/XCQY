-file("src/merge/merge_dao_charge.erl", 1).

-module(merge_dao_charge).

-export([do_init/1, do_convert/2, do_end/1]).

-record(merge_charge,
        {sn,
         type,
         status,
         gold,
         money,
         account,
         rid,
         platform,
         zone_id,
         channel_reg,
         name,
         classes,
         lev,
         is_test,
         ts,
         time_deal,
         rmb}).

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

-file("src/merge/merge_dao_charge.erl", 38).

-file("inc/merge.hrl", 1).

-record(merge_table,
        {name = <<>>,
         table = <<>>,
         dao,
         server,
         next_key = 0,
         process = merge_main_proc,
         state,
         new_srv_id,
         old_srv_id}).

-record(merge_server,
        {platform = "",
         zone_id = 1,
         data_source,
         schema,
         target_schema,
         index = 0,
         size = 0}).

-record(merge_role_name,
        {key = {0, <<>>, 0},
         name = <<>>,
         lev = 0,
         exp = 0,
         data_source}).

-file("src/merge/merge_dao_charge.erl", 39).

do_init(Table = #merge_table{server =
                                 #merge_server{data_source = DataSource,
                                               index = Index}}) ->
    case Index =:= 1 of
        true ->
            ets:new(ets_merge_charge,
                    [set, named_table, public, {keypos, #merge_charge.sn}]);
        _ -> skip
    end,
    Sql = "select sn, type, status, gold, money, "
          "account, rid, platform, zone_id, channel_reg, "
          "name, classes, lev, is_test, ts, time_deal, "
          "rmb from charge",
    case merge_db:get_all(DataSource, Sql, []) of
        {ok, Data} ->
            case insert(Data, Index) of
                {error, Reason} -> {error, Reason};
                ok -> {ok, [], Table}
            end;
        {error, Reason} -> {error, Reason}
    end.

do_convert([],
           Table = #merge_table{server =
                                    #merge_server{index = Size,
                                                  size = Size}}) ->
    List = ets:tab2list(ets_merge_charge),
    case deal(List) of
        ok -> {ok, Table};
        {error, Reason} -> {error, Reason}
    end;
do_convert([], Table) -> {ok, Table}.

do_end(#merge_table{server =
                        #merge_server{index = Size, size = Size}}) ->
    ets:delete(ets_merge_charge),
    skip;
do_end(_) -> skip.

insert([], _) -> ok;
insert([[Sn,
         Type,
         Status,
         Gold,
         Money,
         Account,
         Rid,
         Platform,
         ZoneId,
         ChannelReg,
         Name,
         Classes,
         Lev,
         IsTest,
         Ts,
         TimeDeal,
         Rmb]
        | T],
       Index) ->
    case ets:lookup(ets_merge_charge, Sn) of
        [] ->
            ets:insert(ets_merge_charge,
                       #merge_charge{sn = Sn, type = Type, status = Status,
                                     gold = Gold, money = Money,
                                     account = Account, rid = Rid,
                                     platform = Platform, zone_id = ZoneId,
                                     channel_reg = ChannelReg, name = Name,
                                     classes = Classes, lev = Lev,
                                     is_test = IsTest, ts = Ts,
                                     time_deal = TimeDeal, rmb = Rmb}),
            insert(T, Index);
        [#merge_charge{}] ->
            NewSn = util:flist("~ts_~w", [Sn, Index]),
            ets:insert(ets_merge_charge,
                       #merge_charge{sn = NewSn, type = Type, status = Status,
                                     gold = Gold, money = Money,
                                     account = Account, rid = Rid,
                                     platform = Platform, zone_id = ZoneId,
                                     channel_reg = ChannelReg, name = Name,
                                     classes = Classes, lev = Lev,
                                     is_test = IsTest, ts = Ts,
                                     time_deal = TimeDeal, rmb = Rmb}),
            insert(T, Index)
    end.

deal([]) -> ok;
deal([#merge_charge{sn = Sn, type = Type,
                    status = Status, gold = Gold, money = Money,
                    account = Account, rid = Rid, platform = Platform,
                    zone_id = ZoneId, channel_reg = ChannelReg, name = Name,
                    classes = Classes, lev = Lev, is_test = IsTest, ts = Ts,
                    time_deal = TimeDeal, rmb = Rmb}
      | T]) ->
    Sql = "insert into charge(sn, type, status, "
          "gold, money, account, rid, platform, "
          "zone_id, channel_reg, name, classes, "
          "lev, is_test, ts, time_deal, rmb) value "
          "(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, "
          "?, ?, ?, ?, ?)",
    case merge_db:exec(merge_target,
                       Sql,
                       [Sn,
                        Type,
                        Status,
                        Gold,
                        Money,
                        Account,
                        Rid,
                        Platform,
                        ZoneId,
                        ChannelReg,
                        Name,
                        Classes,
                        Lev,
                        IsTest,
                        Ts,
                        TimeDeal,
                        Rmb])
        of
        ok -> deal(T);
        {error, Reason} -> {error, Reason}
    end.

