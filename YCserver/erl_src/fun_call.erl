-file("src/mod/misc/fun_call.erl", 1).

-module(fun_call).

-export([exec/2,
         exec/3,
         trans_begin/0,
         trans_flush/0,
         trans_clean/0]).

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

-file("src/mod/misc/fun_call.erl", 14).

exec(Fun, Args) -> exec(undefined, Fun, Args).

exec(Mod, Fun, Args) ->
    case get(fun_call_transaction) of
        undefined -> do_exec(Mod, Fun, Args);
        [] -> do_exec(Mod, Fun, Args);
        [H] ->
            put(fun_call_transaction, [[{Mod, Fun, Args} | H]]);
        [H | T] ->
            put(fun_call_transaction, [[{Mod, Fun, Args} | H] | T])
    end.

trans_begin() ->
    case get(fun_call_transaction) of
        L = [_ | _] -> put(fun_call_transaction, [[] | L]);
        _ -> put(fun_call_transaction, [[]])
    end,
    ok.

trans_flush() ->
    case get(fun_call_transaction) of
        [] -> logger:error("方法调用时发生异常:缓冲区为空", [], fun_call, 41);
        [[]] -> put(fun_call_transaction, []);
        [H] ->
            [do_exec(Mod, Fun, Args) || {Mod, Fun, Args} <- H],
            put(fun_call_transaction, []);
        [H, H1 | T] ->
            put(fun_call_transaction,
                [lists:concat([lists:reverse(H), H1]) | T]);
        [H | T] ->
            put(fun_call_transaction,
                [lists:concat([lists:reverse(H), T])])
    end,
    ok.

trans_clean() ->
    case get(fun_call_transaction) of
        [] ->
            logger:error("方法调用事务数据时发生异常:缓冲区为空", [], fun_call, 57);
        [_H] -> put(fun_call_transaction, []);
        [_H | T] -> put(fun_call_transaction, T);
        _ -> skip
    end,
    ok.

do_exec(undefined, Fun, Args) ->
    catch erlang:apply(Fun, Args);
do_exec(Mod, Fun, Args) ->
    catch erlang:apply(Mod, Fun, Args).

