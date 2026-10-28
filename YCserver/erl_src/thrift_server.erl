-file("src/lib/thrift/thrift_server.erl", 1).

-module(thrift_server).

-behaviour(gen_server).

-export([start_link/3, stop/1, take_socket/2]).

-export([init/1,
         handle_call/3,
         handle_cast/2,
         handle_info/2,
         terminate/2,
         code_change/3]).

-record(state,
        {listen_socket, acceptor_ref, service, handler}).

start_link(Port, Service, HandlerModule)
    when is_integer(Port), is_atom(HandlerModule) ->
    gen_server:start_link({local, thrift_server},
                          thrift_server,
                          {Port, Service, HandlerModule},
                          []).

stop(Pid) when is_pid(Pid) ->
    gen_server:call(Pid, stop).

take_socket(Server, Socket) ->
    gen_server:call(Server, {take_socket, Socket}).

init({Port, Service, Handler}) ->
    {ok, Socket} = gen_tcp:listen(Port,
                                  [binary,
                                   {packet, 0},
                                   {active, false},
                                   {nodelay, true},
                                   {reuseaddr, true}]),
    {ok, Ref} = prim_inet:async_accept(Socket, -1),
    {ok,
     #state{listen_socket = Socket, acceptor_ref = Ref,
            service = Service, handler = Handler}}.

handle_call(stop, _From, State) ->
    {stop, stopped, ok, State};
handle_call({take_socket, Socket}, {FromPid, _Tag},
            State) ->
    Result = gen_tcp:controlling_process(Socket, FromPid),
    {reply, Result, State}.

handle_cast(_Msg, State) -> {noreply, State}.

handle_info({inet_async,
             ListenSocket,
             Ref,
             {ok, ClientSocket}},
            State = #state{listen_socket = ListenSocket,
                           acceptor_ref = Ref, service = Service,
                           handler = Handler}) ->
    case set_sockopt(ListenSocket, ClientSocket) of
        ok ->
            start_processor(ClientSocket, Service, Handler),
            {ok, NewRef} = prim_inet:async_accept(ListenSocket, -1),
            {noreply, State#state{acceptor_ref = NewRef}};
        {error, Reason} ->
            error_logger:error_msg("Couldn't set socket opts: ~p~n",
                                   [Reason]),
            {stop, Reason, State}
    end;
handle_info({inet_async, _ListenSocket, _Ref, Error},
            State) ->
    error_logger:error_msg("Error in acceptor: ~p~n",
                           [Error]),
    {stop, Error, State};
handle_info(_Info, State) -> {noreply, State}.

terminate(_Reason, _State) -> ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

set_sockopt(ListenSocket, ClientSocket) ->
    true = inet_db:register_socket(ClientSocket, inet_tcp),
    case prim_inet:getopts(ListenSocket,
                           [active,
                            nodelay,
                            keepalive,
                            delay_send,
                            priority,
                            tos])
        of
        {ok, Opts} ->
            case prim_inet:setopts(ClientSocket, Opts) of
                ok -> ok;
                Error ->
                    gen_tcp:close(ClientSocket),
                    Error
            end;
        Error ->
            gen_tcp:close(ClientSocket),
            Error
    end.

start_processor(Socket, Service, Handler) ->
    Server = self(),
    ProtoGen = fun () ->
                       ok = take_socket(Server, Socket),
                       {ok, SocketTransport} =
                           thrift_socket_transport:new(Socket),
                       {ok, BufferedTransport} =
                           thrift_buffered_transport:new(SocketTransport),
                       {ok, Protocol} =
                           thrift_binary_protocol:new(BufferedTransport),
                       {ok, Protocol}
               end,
    spawn(thrift_processor,
          init,
          [{Server, ProtoGen, Service, Handler}]).

