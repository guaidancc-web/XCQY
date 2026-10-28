-file("src/log/log_db.erl", 1).

-module(log_db).

-behaviour(gen_server).

-export([log/2, info/2, start_link/1]).

-export([init/1,
         handle_call/3,
         handle_cast/2,
         handle_info/2,
         terminate/2,
         code_change/3]).

-record(state, {buffer = [] :: [tuple()]}).

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

-file("src/log/log_db.erl", 16).

log(Pid, Log) -> info(Pid, {log, Log}).

info(Pid, Info) when is_pid(Pid) -> Pid ! Info;
info(Zone, Info) ->
    case whereis(Zone) of
        Pid when is_pid(Pid) -> Pid ! Info;
        _ -> ok
    end.

start_link(N) -> gen_server:start_link(log_db, [N], []).

init([N]) ->
    logger:info("[~w] 正在启动...", [log_db], log_db, 36),
    process_flag(trap_exit, true),
    put(n, N),
    State = #state{},
    erlang:register(list_to_atom(lists:concat(["log_proc_db_",
                                               N])),
                    self()),
    logger:info("[~w] 启动完成", [log_db], log_db, 41),
    {ok, State}.

handle_call(_Request, _From, State) -> {noreply, State}.

handle_cast(_Msg, State) -> {noreply, State}.

handle_info({log, Log},
            State = #state{buffer = Buffer}) ->
    case Buffer of
        [] -> erlang:send_after(2000, self(), log_tick);
        _ -> ok
    end,
    {noreply, State#state{buffer = [Log | Buffer]}};
handle_info(log_tick,
            State = #state{buffer = Buffer}) ->
    NewBuffer = log_tick(200, Buffer, []),
    case NewBuffer of
        [] -> ok;
        _ -> erlang:send_after(5000, self(), log_tick)
    end,
    {noreply, State#state{buffer = NewBuffer}};
handle_info(_Info, State) -> {noreply, State}.

terminate(_Reason, _State = #state{buffer = Buffer}) ->
    logger:info("数据库日志[~w]开始关闭: length:~w",
                [get(n), length(Buffer)],
                log_db,
                71),
    log_tick(-1, Buffer, []),
    logger:info("数据库日志[~w]关闭完成", [get(n)], log_db, 73),
    ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

log_tick(0, Buffer, L) ->
    batch_insert_db(L),
    Buffer;
log_tick(_N, Buffer = [], L) ->
    batch_insert_db(L),
    Buffer;
log_tick(N, [{Label, Log} | Buffer], L) ->
    NewL = case sql(Label) of
               {_Num, _Sql} ->
                   case lists:keyfind(Label, 1, L) of
                       {Label, L1} ->
                           lists:keyreplace(Label, 1, L, {Label, [Log | L1]});
                       _ -> [{Label, [Log]} | L]
                   end;
               Sql ->
                   _Ret = db:exec(Sql, Log),
                   L
           end,
    log_tick(N - 1, Buffer, NewL).

batch_insert_db([]) -> ok;
batch_insert_db([{Label, Logs} | T]) ->
    do_batch_insert_db(Logs, sql(Label)),
    batch_insert_db(T).

do_batch_insert_db([], _) -> ok;
do_batch_insert_db(Logs, {Num, Sql})
    when length(Logs) > Num ->
    {T1, T2} = lists:split(Num, Logs),
    do_batch_insert_db(T1, {Num, Sql}),
    do_batch_insert_db(T2, {Num, Sql});
do_batch_insert_db(Logs, {_Num, Sql}) ->
    ValsSql = string:join(Logs, ","),
    NewSql = util:flist(Sql, [ValsSql]),
    db:exec(NewSql).

sql(info_stat) ->
    {100,
     "replace into log_info_stat (k, rid, "
     "platform, zone_id, account, name, title, "
     "msg, val1, val2, val3, val4, val5, val6, "
     "val7, val8, ts) values ~ts"};
sql(mail) ->
    {100,
     "insert into log_mail(sess_id, sess_p, "
     "sess_z, to_id, to_p, to_z, from_id, "
     "from_p, from_z, from_name, to_name, "
     "type, title, content, source, items, "
     "status, ts) values ~ts"};
sql(mail_update) ->
    "update log_mail set status=2, recv_ts "
    "= ? where sess_id = ? and sess_p = ? "
    "and sess_z = ?".

