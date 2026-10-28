-file("src/mod/campaign/c_camp_pet_egg.erl", 1).

-module(c_camp_pet_egg).

-author("Lith").

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

-file("src/mod/campaign/c_camp_pet_egg.erl", 13).

-behaviour(gen_server).

-export([info/1, cast/1, call/1, start_link/0]).

-export([init/1,
         handle_call/3,
         handle_cast/2,
         handle_info/2,
         terminate/2,
         code_change/3]).

-record(state, {}).

info(Info) -> erlang:send(c_camp_pet_egg, Info).

cast(Info) -> gen_server:cast(c_camp_pet_egg, Info).

call(Info) ->
    case catch gen_server:call(c_camp_pet_egg, Info, 10000)
        of
        {'EXIT', {timeout, _}} -> {error, timeout};
        {'EXIT', {noproc, _}} -> {error, noproc};
        {'EXIT', {normal, _}} -> {error, exit};
        {'EXIT', _Call_Err} -> {error, _Call_Err};
        _Call_Return -> _Call_Return
    end.

start_link() ->
    gen_server:start_link({local, c_camp_pet_egg},
                          c_camp_pet_egg,
                          [],
                          []).

init([]) ->
    logger:info("[~w] 正在启动...",
                [c_camp_pet_egg],
                c_camp_pet_egg,
                58),
    process_flag(trap_exit, true),
    ets:new(ets_c_camp_pet_egg,
            [set, named_table, public, {keypos, 1}]),
    dets:open_file(dets_c_camp_pet_egg,
                   [{file, "./dets/c_camp_pet_egg.dets"},
                    {keypos, 1},
                    {type, set}]),
    dets:to_ets(dets_c_camp_pet_egg, ets_c_camp_pet_egg),
    erlang:send_after(300000, c_camp_pet_egg, loop),
    logger:info("[~w] 启动完成",
                [c_camp_pet_egg],
                c_camp_pet_egg,
                64),
    {ok, #state{}}.

terminate(_Reason, _State) ->
    logger:info("开始关闭", [], c_camp_pet_egg, 68),
    ets:to_dets(ets_c_camp_pet_egg, dets_c_camp_pet_egg),
    dets:close(dets_c_camp_pet_egg),
    logger:info("关闭完成", [], c_camp_pet_egg, 71),
    ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

handle_call(Info, _From, State) ->
    Reply = do_call(Info),
    {reply, Reply, State}.

handle_cast(Info, State) ->
    catch do_cast(Info),
    {noreply, State}.

handle_info(Info, State) ->
    catch do_info(Info),
    {noreply, State}.

do_call({update_counter, Key, Add}) ->
    case ets:lookup(ets_c_camp_pet_egg, Key) of
        [] -> ets:insert(ets_c_camp_pet_egg, {Key, 0});
        _ -> ignore
    end,
    ets:update_counter(ets_c_camp_pet_egg, Key, Add);
do_call({set_counter, Key, Num}) ->
    ets:insert(ets_c_camp_pet_egg, {Key, Num});
do_call(_Info) ->
    logger:error("~p  receive unknow call msg: ~p",
                 [c_camp_pet_egg, _Info],
                 c_camp_pet_egg,
                 105).

do_cast(_Info) ->
    logger:error("~p receive unknow cast msg: ~p",
                 [c_camp_pet_egg, _Info],
                 c_camp_pet_egg,
                 108).

do_info(loop) ->
    erlang:send_after(300000, c_camp_pet_egg, loop),
    ets:to_dets(ets_c_camp_pet_egg, dets_c_camp_pet_egg);
do_info({get_log, Log, RolePID}) ->
    LogList2 = case ets:lookup(ets_c_camp_pet_egg, Log) of
                   [] -> [];
                   [{_, LogList}] -> LogList
               end,
    role:pack_send(RolePID, 20404, {LogList2});
do_info({{log, _} = Log, LogInfo}) ->
    case ets:lookup(ets_c_camp_pet_egg, Log) of
        [] -> ets:insert(ets_c_camp_pet_egg, {Log, [LogInfo]});
        [{_, LogList}] ->
            ets:insert(ets_c_camp_pet_egg,
                       {Log, [LogInfo | LogList]})
    end;
do_info(_Info) ->
    logger:error("~p receive unknow info msg: ~p",
                 [c_camp_pet_egg, _Info],
                 c_camp_pet_egg,
                 130).

