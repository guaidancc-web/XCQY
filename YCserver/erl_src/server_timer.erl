-file("src/mod/misc/server_timer.erl", 1).

-module(server_timer).

-export([add/1, del/1, set/1, timer/1, clean/0]).

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

-file("src/mod/misc/server_timer.erl", 22).

-file("inc/timer.hrl", 1).

-record(timer,
        {id :: undefined | term(),
         timeout = 1000 :: pos_integer(),
         m :: undefined | atom(),
         f :: undefined | function() | atom(),
         a = [] :: [term()],
         times = 1 :: integer(),
         next_tick = 0 :: non_neg_integer(),
         set_time = 1 :: pos_integer()}).

-record(rtimer,
        {ref :: undefined | reference(),
         key :: undefined | reference(),
         timers = [] :: [#timer{}]}).

-record(s_timer,
        {ref :: undefined | reference(),
         timers = [] :: [#timer{}]}).

-file("src/mod/misc/server_timer.erl", 23).

-spec add(#timer{}) -> ok.

add(Timer = #timer{}) ->
    case get(pid_timer) of
        #s_timer{ref = Ref, timers = Timers} ->
            catch erlang:cancel_timer(Ref),
            next([Timer | Timers]);
        _ -> next([Timer])
    end;
add(Timers = [_ | _]) when is_list(Timers) ->
    case is_timer(Timers) of
        true ->
            case get(pid_timer) of
                #s_timer{ref = Ref, timers = ServerTimers} ->
                    catch erlang:cancel_timer(Ref),
                    next(Timers ++ ServerTimers);
                _ -> next(Timers)
            end;
        false ->
            logger:error("非角色进程定时器参数错误[~w]",
                         [Timers],
                         server_timer,
                         52),
            ok
    end;
add(_Unknow) ->
    logger:error("非角色进程定时器参数错误[~w]",
                 [_Unknow],
                 server_timer,
                 56),
    ok.

-spec add(#timer{}, #s_timer{}) -> ok.

add(Timer, #s_timer{ref = Ref, timers = Timers}) ->
    catch erlang:cancel_timer(Ref),
    next([Timer | Timers]).

-spec set(#timer{}) -> ok.

set(Timer = #timer{id = Id}) ->
    case get(pid_timer) of
        STimer = #s_timer{} ->
            NewSTimer = del(Id, STimer),
            add(Timer, NewSTimer);
        _ -> add(Timer, #s_timer{})
    end;
set(_Unknow) ->
    logger:error("非角色进程定时器参数错误[~w]",
                 [_Unknow],
                 server_timer,
                 75),
    ok.

-spec del(pos_integer()) -> ok.

del(TimerId) ->
    case get(pid_timer) of
        STimer = #s_timer{} ->
            DelSTimer = del(TimerId, STimer),
            put(pid_timer, DelSTimer);
        _ -> put(pid_timer, #s_timer{})
    end.

-spec del(pos_integer(), #s_timer{}) -> ok.

del(_TimerId, STimer = #s_timer{timers = []}) -> STimer;
del(TimerId,
    #s_timer{ref = Ref,
             timers = [#timer{id = TimerId} | Timers]}) ->
    erlang:cancel_timer(Ref),
    do_next(Timers);
del(TimerId, STimer = #s_timer{timers = Timers}) ->
    STimer#s_timer{timers =
                       lists:keydelete(TimerId, #timer.id, Timers)}.

-spec timer(Label :: keep | remove | ok) -> ok.

timer(Label) ->
    case get(pid_timer) of
        Stimer = #s_timer{} -> timer(Stimer, Label);
        _ -> ok
    end.

timer(#s_timer{timers = []}, _Label) -> ok;
timer(#s_timer{timers =
                   [Timer = #timer{times = Times} | Timers]},
      Label) ->
    case Label of
        keep when Times =:= 1 ->
            next([Timer#timer{times = 1, next_tick = 0} | Timers]);
        remove when Times =/= 1 -> next(Timers);
        Atom
            when Atom =:= ok orelse
                     Atom =:= keep orelse Atom =:= remove ->
            next([Timer#timer{times = max(-1, Times - 1),
                              next_tick = 0}
                  | Timers]);
        Else ->
            logger:error("执行定时器{~w}时得到错误的返回值格式: ~w",
                         [Timer, Else],
                         server_timer,
                         118),
            next(Timers)
    end,
    ok.

clean() ->
    case get(pid_timer) of
        #s_timer{ref = Ref} ->
            case Ref of
                undefined -> ok;
                _ -> erlang:cancel_timer(Ref)
            end,
            erase(pid_timer),
            ok;
        _ -> ok
    end.

-spec next(Timers :: [#timer{}]) -> ok.

next(Timers) ->
    STimer = do_next(Timers),
    put(pid_timer, STimer),
    ok.

do_next([]) -> #s_timer{};
do_next([#timer{times = 0} | Timers]) ->
    do_next(Timers);
do_next([Timer = #timer{next_tick = 0, timeout = To}
         | Timers]) ->
    Now = date:unixtime(ms),
    NewTimer = Timer#timer{set_time = Now,
                           next_tick = Now + To},
    do_next([NewTimer | Timers]);
do_next(Timers) ->
    Now = date:unixtime(ms),
    L = lists:keysort(#timer.next_tick, Timers),
    [#timer{id = Id, next_tick = Nt} | _] = L,
    T = case Nt - Now of
            Diff when Diff > 0 -> Diff;
            _ -> 100
        end,
    logger:debug("下一个定时器[Id:~w][T:~w]",
                 [Id, T],
                 server_timer,
                 165),
    NewRef = erlang:send_after(T, self(), {timer_tick, Id}),
    #s_timer{ref = NewRef, timers = L}.

is_timer(#timer{}) -> true;
is_timer([]) -> true;
is_timer([H | Rest]) ->
    case is_timer(H) of
        true -> is_timer(Rest);
        false -> false
    end;
is_timer(_) -> false.

