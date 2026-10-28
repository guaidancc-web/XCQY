-file("src/merge/merge_checker.erl", 1).

-module(merge_checker).

-export([check_all/0]).

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

-file("src/merge/merge_checker.erl", 15).

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

-file("src/merge/merge_checker.erl", 16).

check_all() ->
    List = [target_db],
    case check_all(List) of
        ok -> ok;
        {false, Reason} -> {false, Reason}
    end.

check_all([]) -> ok;
check_all([H | T]) ->
    case check(H) of
        ok -> check_all(T);
        {false, Reason} -> {false, Reason}
    end.

check(target_db) ->
    Sql = "select count(*) from role",
    case merge_db:get_one(merge_target, Sql) of
        {ok, undefined} -> ok;
        {ok, 0} -> ok;
        {ok, _} -> {false, lang:get("目标库非空库，请清档后继续")};
        {error, Reason} -> {false, Reason};
        _ErrMsg -> {false, _ErrMsg}
    end.

