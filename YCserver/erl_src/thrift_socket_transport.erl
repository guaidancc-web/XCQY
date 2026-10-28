-file("src/lib/thrift/thrift_socket_transport.erl", 1).

-module(thrift_socket_transport).

-behaviour(thrift_transport).

-export([new/1, new/2]).

-export([read/2,
         read_exact/2,
         write/2,
         flush/1,
         close/1]).

-export([new_transport_factory/3]).

-record(t_socket,
        {socket, recv_timeout = 60000, buffer = []}).

-type state() :: #t_socket{}.

-spec new(Socket ::
              any()) -> thrift_transport:t_transport().

new(Socket) -> new(Socket, []).

-spec new(Socket :: any(),
          Opts :: list()) -> thrift_transport:t_transport().

new(Socket, Opts) when is_list(Opts) ->
    State = parse_opts(Opts, #t_socket{socket = Socket}),
    thrift_transport:new(thrift_socket_transport, State).

parse_opts([{recv_timeout, Timeout} | Rest], State)
    when is_integer(Timeout), Timeout > 0 ->
    parse_opts(Rest,
               State#t_socket{recv_timeout = Timeout});
parse_opts([{recv_timeout, infinity} | Rest], State) ->
    parse_opts(Rest,
               State#t_socket{recv_timeout = infinity});
parse_opts([], State) -> State.

-file("inc/thrift_transport_behaviour.hrl", 1).

-spec write(state(), iolist() | binary()) -> {state(),
                                              ok | {error, _Reason}}.

-spec read(state(), non_neg_integer()) -> {state(),
                                           {ok, binary()} | {error, _Reason}}.

-spec flush(state()) -> {state(),
                         ok | {error, _Reason}}.

-spec close(state()) -> {state(),
                         ok | {error, _Reason}}.

-file("src/lib/thrift/thrift_socket_transport.erl", 64).

read(State = #t_socket{buffer = Buf}, Len)
    when is_integer(Len), Len >= 0 ->
    Binary = iolist_to_binary(Buf),
    case iolist_size(Binary) of
        X when X >= Len ->
            {Result, Remaining} = split_binary(Binary, Len),
            {State#t_socket{buffer = Remaining}, {ok, Result}};
        _ -> recv(State, Len)
    end.

recv(State = #t_socket{socket = Socket, buffer = Buf},
     Len) ->
    case gen_tcp:recv(Socket,
                      0,
                      State#t_socket.recv_timeout)
        of
        {error, Error} ->
            gen_tcp:close(Socket),
            {State, {error, Error}};
        {ok, Data} ->
            Binary = iolist_to_binary([Buf, Data]),
            Give = min(iolist_size(Binary), Len),
            {Result, Remaining} = split_binary(Binary, Give),
            {State#t_socket{buffer = Remaining}, {ok, Result}}
    end.

read_exact(State = #t_socket{buffer = Buf}, Len)
    when is_integer(Len), Len >= 0 ->
    Binary = iolist_to_binary(Buf),
    case iolist_size(Binary) of
        X when X >= Len -> read(State, Len);
        X ->
            case gen_tcp:recv(State#t_socket.socket,
                              Len - X,
                              State#t_socket.recv_timeout)
                of
                {error, Error} ->
                    gen_tcp:close(State#t_socket.socket),
                    {State, {error, Error}};
                {ok, Data} ->
                    {State#t_socket{buffer = []},
                     {ok, <<Binary/binary, Data/binary>>}}
            end
    end.

write(State = #t_socket{socket = Socket}, Data) ->
    case gen_tcp:send(Socket, Data) of
        {error, Error} ->
            gen_tcp:close(Socket),
            {State, {error, Error}};
        ok -> {State, ok}
    end.

flush(State) -> {State#t_socket{buffer = []}, ok}.

close(State = #t_socket{socket = Socket}) ->
    {State, gen_tcp:close(Socket)}.

-record(factory_opts,
        {connect_timeout = infinity,
         sockopts = [],
         framed = false}).

parse_factory_options([], FactoryOpts, TransOpts) ->
    {FactoryOpts, TransOpts};
parse_factory_options([{framed, Bool} | Rest],
                      FactoryOpts, TransOpts)
    when is_boolean(Bool) ->
    parse_factory_options(Rest,
                          FactoryOpts#factory_opts{framed = Bool},
                          TransOpts);
parse_factory_options([{sockopts, OptList} | Rest],
                      FactoryOpts, TransOpts)
    when is_list(OptList) ->
    parse_factory_options(Rest,
                          FactoryOpts#factory_opts{sockopts = OptList},
                          TransOpts);
parse_factory_options([{connect_timeout, TO} | Rest],
                      FactoryOpts, TransOpts)
    when TO =:= infinity; is_integer(TO) ->
    parse_factory_options(Rest,
                          FactoryOpts#factory_opts{connect_timeout = TO},
                          TransOpts);
parse_factory_options([{recv_timeout, TO} | Rest],
                      FactoryOpts, TransOpts)
    when TO =:= infinity; is_integer(TO) ->
    parse_factory_options(Rest,
                          FactoryOpts,
                          [{recv_timeout, TO}] ++ TransOpts).

new_transport_factory(Host, Port, Options) ->
    {FactoryOpts, TransOpts} =
        parse_factory_options(Options, #factory_opts{}, []),
    {ok,
     fun () ->
             SockOpts = [binary,
                         {packet, 0},
                         {active, false},
                         {nodelay, true}
                         | FactoryOpts#factory_opts.sockopts],
             case catch gen_tcp:connect(Host,
                                        Port,
                                        SockOpts,
                                        FactoryOpts#factory_opts.connect_timeout)
                 of
                 {ok, Sock} ->
                     {ok, Transport} = thrift_socket_transport:new(Sock,
                                                                   TransOpts),
                     {ok, BufTransport} = case
                                              FactoryOpts#factory_opts.framed
                                              of
                                              true ->
                                                  thrift_framed_transport:new(Transport);
                                              false ->
                                                  thrift_buffered_transport:new(Transport)
                                          end,
                     {ok, BufTransport};
                 Error -> Error
             end
     end}.

