-file("src/lib/thrift/thrift_transport_state_test.erl",
      1).

-module(thrift_transport_state_test).

-behaviour(gen_server).

-behaviour(thrift_transport).

-export([new/1]).

-export([init/1,
         handle_call/3,
         handle_cast/2,
         handle_info/2,
         terminate/2,
         code_change/3]).

-export([write/2, read/2, flush/1, close/1]).

-record(trans,
        {wrapped,
         version :: undefined | integer(),
         counter :: undefined | pid()}).

-type state() :: #trans{}.

-file("inc/thrift_transport_behaviour.hrl", 1).

-spec write(state(), iolist() | binary()) -> {state(),
                                              ok | {error, _Reason}}.

-spec read(state(), non_neg_integer()) -> {state(),
                                           {ok, binary()} | {error, _Reason}}.

-spec flush(state()) -> {state(),
                         ok | {error, _Reason}}.

-spec close(state()) -> {state(),
                         ok | {error, _Reason}}.

-file("src/lib/thrift/thrift_transport_state_test.erl",
      41).

-record(state, {cversion :: undefined | integer()}).

new(WrappedTransport) ->
    case gen_server:start_link(thrift_transport_state_test,
                               [],
                               [])
        of
        {ok, Pid} ->
            Trans = #trans{wrapped = WrappedTransport, version = 0,
                           counter = Pid},
            thrift_transport:new(thrift_transport_state_test,
                                 Trans);
        Else -> Else
    end.

write(Transport0 = #trans{wrapped = Wrapped0}, Data) ->
    Transport1 = check_version(Transport0),
    {Wrapped1, Result} = thrift_transport:write(Wrapped0,
                                                Data),
    Transport2 = Transport1#trans{wrapped = Wrapped1},
    {Transport2, Result}.

flush(Transport0 = #trans{wrapped = Wrapped0}) ->
    Transport1 = check_version(Transport0),
    {Wrapped1, Result} = thrift_transport:flush(Wrapped0),
    Transport2 = Transport1#trans{wrapped = Wrapped1},
    {Transport2, Result}.

close(Transport0 = #trans{wrapped = Wrapped0}) ->
    Transport1 = check_version(Transport0),
    shutdown_counter(Transport1),
    {Wrapped1, Result} = thrift_transport:close(Wrapped0),
    Transport2 = Transport1#trans{wrapped = Wrapped1},
    {Transport2, Result}.

read(Transport0 = #trans{wrapped = Wrapped0}, Len) ->
    Transport1 = check_version(Transport0),
    {Wrapped1, Result} = thrift_transport:read(Wrapped0,
                                               Len),
    Transport2 = Transport1#trans{wrapped = Wrapped1},
    {Transport2, Result}.

init([]) -> {ok, #state{cversion = 0}}.

handle_call(check_version, _From,
            State = #state{cversion = Version}) ->
    {reply, Version, State#state{cversion = Version + 1}}.

handle_cast(shutdown, State) -> {stop, normal, State}.

handle_info(_Info, State) -> {noreply, State}.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

terminate(_Reason, _State) -> ok.

check_version(Transport = #trans{version = Version,
                                 counter = Counter}) ->
    case gen_server:call(Counter, check_version) of
        Version -> Transport#trans{version = Version + 1};
        _Else -> erlang:error(state_not_propagated)
    end.

shutdown_counter(#trans{counter = Counter}) ->
    gen_server:cast(Counter, shutdown).

