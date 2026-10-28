-file("src/sys/env.erl", 1).

-module(env).

-behaviour(gen_server).

-export([start_link/0,
         start_link/1,
         srv_open_time/0,
         get/1,
         set/2,
         update_counter/2,
         save/2,
         save_counter/2,
         del/1,
         dump/2,
         const_var/1,
         const_var/2,
         env_save/2,
         env_set/2]).

-export([init/1,
         handle_call/3,
         handle_cast/2,
         handle_info/2,
         terminate/2,
         code_change/3]).

-record(state, {}).

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

-file("src/sys/env.erl", 29).

-file("inc/env.hrl", 1).

-author("Lith").

-file("src/sys/env.erl", 30).

-spec srv_open_time() -> non_neg_integer().

srv_open_time() ->
    T = env:get(srv_open_time),
    T1 = case is_integer(T) of
             true -> date:unixtime({zero, T});
             _ -> T
         end,
    Ttest = env:get(srv_open_time_test),
    Now = date:unixtime(),
    case is_integer(T) andalso T1 =< Now of
        true -> min(T, Now);
        _ when is_integer(Ttest) -> Ttest;
        _ -> 0
    end.

-spec const_var(any()) -> undefined | any().

const_var(Key) ->
    case erlang:get(Key) of
        undefined ->
            Val = env:get(Key),
            put(Key, Val),
            Val;
        Val -> Val
    end.

-spec const_var(any(), DefVal :: any()) -> undefined |
                                           any().

const_var(Key, DefVal) ->
    case const_var(Key) of
        undefined ->
            put(Key, DefVal),
            DefVal;
        Val -> Val
    end.

-spec get(any()) -> undefined | any().

get(Key) ->
    case catch ets:lookup(env, Key) of
        [{_, Val}] -> Val;
        {'EXIT', {badarg, _}} ->
            logger:error("系统环境变量服务器异常：未运行或已经崩溃", [], env, 81),
            undefined;
        _ -> undefined
    end.

-spec set(any(), any()) -> any().

set(Key, Val) ->
    ets:insert(env, {Key, Val}),
    Val.

-spec update_counter(term(), integer()) -> integer().

update_counter(Key, Val) when is_integer(Val) ->
    ets:update_counter(env, Key, Val).

-spec save(any(), any()) -> any().

save(Key, Val) ->
    ets:insert(env, {Key, Val}),
    dets:insert(env_file, {Key, Val}),
    Val.

-spec save_counter(term(), integer()) -> integer().

save_counter(Key, Val) ->
    V = ets:update_counter(env, Key, Val),
    dets:insert(env_file, {Key, V}),
    V.

-spec del(any()) -> ok | {error, term()}.

del(Key) ->
    ets:delete(env, Key),
    dets:delete(env_file, Key),
    ok.

env_save(Key, Val) -> env ! {save, Key, Val}.

env_set(Key, Val) -> env ! {set, Key, Val}.

-spec dump(any(), string()) -> ok | {error, term()}.

dump(Key, File) -> util:save(File, env:get(Key)).

-spec start_link() -> ignore |
                      {error, term()} |
                      {ok, pid()}.

start_link() -> start_link("").

-spec start_link(string()) -> ignore |
                              {error, term()} |
                              {ok, pid()}.

start_link(CfgFile) ->
    gen_server:start_link({local, env}, env, [CfgFile], []).

init([Cfg]) ->
    process_flag(trap_exit, true),
    ets:new(env, [set, named_table, public, {keypos, 1}]),
    dets:open_file(env_file,
                   [{file, "./dets/env.dets"}, {keypos, 1}, {type, set}]),
    dets:to_ets(env_file, env),
    Root = filename:absname(""),
    set(root, Root),
    State = #state{},
    case Cfg of
        "" -> {ok, State};
        _ ->
            case load_env_cfg(env:get(root) ++ "/env.cfg") of
                {error, Reason} ->
                    logger:error("载入配置[~ts]失败: ~w",
                                 [Cfg, Reason],
                                 env,
                                 160),
                    {stop, {can_not_load_env_file, Reason}};
                ok ->
                    io:format("~n~n+----------------------------------------"
                              "--------------------+~n"),
                    io:format("|                             o.O   "
                              "                         |~n"),
                    io:format("+--------------------------------------------"
                              "----------------+~n"),
                    true = erlang:set_cookie(node(), env:get(cookie)),
                    logger:info("已载入[~ts]的配置内容", [Cfg], env, 168),
                    set(center,
                        #center{ready = 0, platform = env:get(platform),
                                zone_id = env:get(zone_id),
                                combine = env:get(combine)}),
                    env:set(big_world_center,
                            #{ready => 0, platform => env:get(platform),
                              zone_id => env:get(zone_id),
                              combine => env:get(combine)}),
                    {ok, State}
            end
    end.

handle_call(_Request, _From, State) -> {noreply, State}.

handle_cast(_Msg, State) -> {noreply, State}.

handle_info({save, Key, Val}, State) ->
    save(Key, Val),
    {noreply, State};
handle_info({set, Key, Val}, State) ->
    set(Key, Val),
    {noreply, State};
handle_info(_Info, State) -> {noreply, State}.

terminate(_Reason, _State) ->
    dets:close(env_file),
    ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

-spec load_env_cfg(string()) -> ok | {error, term()}.

load_env_cfg(File) ->
    case util:load(File) of
        {error, Reason} -> {error, Reason};
        {ok, undefined} -> ok;
        {ok, L} ->
            [set(K, V) || {K, V} <- L],
            ok
    end.

