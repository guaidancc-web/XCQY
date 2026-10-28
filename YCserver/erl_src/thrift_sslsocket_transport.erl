-file("src/lib/thrift/thrift_sslsocket_transport.erl",
      1).

-module(thrift_sslsocket_transport).

-file("inc/thrift_transport_behaviour.hrl", 1).

-spec write(state(), iolist() | binary()) -> {state(),
                                              ok | {error, _Reason}}.

-spec read(state(), non_neg_integer()) -> {state(),
                                           {ok, binary()} | {error, _Reason}}.

-spec flush(state()) -> {state(),
                         ok | {error, _Reason}}.

-spec close(state()) -> {state(),
                         ok | {error, _Reason}}.

-file("src/lib/thrift/thrift_sslsocket_transport.erl",
      22).

-behaviour(thrift_transport).

-export([new/3,
         write/2,
         read/2,
         flush/1,
         close/1,
         new_transport_factory/3]).

-export([new/2]).

-record(data, {socket, recv_timeout = infinity}).

-type state() :: #data{}.

-record(factory_opts,
        {connect_timeout = infinity,
         sockopts = [],
         framed = false,
         ssloptions = []}).

parse_factory_options([], Opts) -> Opts;
parse_factory_options([{framed, Bool} | Rest], Opts)
    when is_boolean(Bool) ->
    parse_factory_options(Rest,
                          Opts#factory_opts{framed = Bool});
parse_factory_options([{sockopts, OptList} | Rest],
                      Opts)
    when is_list(OptList) ->
    parse_factory_options(Rest,
                          Opts#factory_opts{sockopts = OptList});
parse_factory_options([{connect_timeout, TO} | Rest],
                      Opts)
    when TO =:= infinity; is_integer(TO) ->
    parse_factory_options(Rest,
                          Opts#factory_opts{connect_timeout = TO});
parse_factory_options([{ssloptions, SslOptions} | Rest],
                      Opts)
    when is_list(SslOptions) ->
    parse_factory_options(Rest,
                          Opts#factory_opts{ssloptions = SslOptions}).

new(Socket, SockOpts, SslOptions)
    when is_list(SockOpts), is_list(SslOptions) ->
    inet:setopts(Socket, [{active, false}]),
    case catch ssl:ssl_accept(Socket, SslOptions) of
        {ok, SslSocket} -> new(SslSocket, SockOpts);
        {error, Reason} -> exit({error, Reason});
        Other ->
            error_logger:error_report([{application, thrift},
                                       "SSL accept failed error",
                                       lists:flatten(io_lib:format("~p",
                                                                   [Other]))]),
            exit({error, ssl_accept_failed})
    end.

new(SslSocket, SockOpts) ->
    State = case lists:keysearch(recv_timeout, 1, SockOpts)
                of
                {value, {recv_timeout, Timeout}}
                    when is_integer(Timeout), Timeout > 0 ->
                    #data{socket = SslSocket, recv_timeout = Timeout};
                _ -> #data{socket = SslSocket}
            end,
    thrift_transport:new(thrift_sslsocket_transport, State).

write(This = #data{socket = Socket}, Data) ->
    {This, ssl:send(Socket, Data)}.

read(This = #data{socket = Socket,
                  recv_timeout = Timeout},
     Len)
    when is_integer(Len), Len >= 0 ->
    case ssl:recv(Socket, Len, Timeout) of
        Err = {error, timeout} ->
            error_logger:info_msg("read timeout: peer conn ~p",
                                  [inet:peername(Socket)]),
            ssl:close(Socket),
            {This, Err};
        Data -> {This, Data}
    end.

flush(This) -> {This, ok}.

close(This = #data{socket = Socket}) ->
    {This, ssl:close(Socket)}.

new_transport_factory(Host, Port, Options) ->
    ParsedOpts = parse_factory_options(Options,
                                       #factory_opts{}),
    F = fun () ->
                SockOpts = [binary,
                            {packet, 0},
                            {active, false},
                            {nodelay, true}
                            | ParsedOpts#factory_opts.sockopts],
                case catch gen_tcp:connect(Host,
                                           Port,
                                           SockOpts,
                                           ParsedOpts#factory_opts.connect_timeout)
                    of
                    {ok, Sock} ->
                        SslSock = case catch ssl:connect(Sock,
                                                         ParsedOpts#factory_opts.ssloptions,
                                                         ParsedOpts#factory_opts.connect_timeout)
                                      of
                                      {ok, SslSocket} -> SslSocket;
                                      Other ->
                                          error_logger:info_msg("error while connecting over ssl - reason: "
                                                                "~p~n",
                                                                [Other]),
                                          catch gen_tcp:close(Sock),
                                          exit(error)
                                  end,
                        {ok, Transport} =
                            thrift_sslsocket_transport:new(SslSock, SockOpts),
                        {ok, BufTransport} = case ParsedOpts#factory_opts.framed
                                                 of
                                                 true ->
                                                     thrift_framed_transport:new(Transport);
                                                 false ->
                                                     thrift_buffered_transport:new(Transport)
                                             end,
                        {ok, BufTransport};
                    Error -> Error
                end
        end,
    {ok, F}.

