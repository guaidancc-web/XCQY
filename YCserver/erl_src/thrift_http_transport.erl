-file("src/lib/thrift/thrift_http_transport.erl", 1).

-module(thrift_http_transport).

-behaviour(thrift_transport).

-export([new/2, new/3]).

-export([write/2, read/2, flush/1, close/1]).

-record(http_transport,
        {host,
         path,
         read_buffer,
         write_buffer,
         http_options,
         extra_headers}).

-type state() :: #http_transport{}.

-file("inc/thrift_transport_behaviour.hrl", 1).

-spec write(state(), iolist() | binary()) -> {state(),
                                              ok | {error, _Reason}}.

-spec read(state(), non_neg_integer()) -> {state(),
                                           {ok, binary()} | {error, _Reason}}.

-spec flush(state()) -> {state(),
                         ok | {error, _Reason}}.

-spec close(state()) -> {state(),
                         ok | {error, _Reason}}.

-file("src/lib/thrift/thrift_http_transport.erl", 39).

new(Host, Path) -> new(Host, Path, _Options = []).

new(Host, Path, Options) ->
    State1 = #http_transport{host = Host, path = Path,
                             read_buffer = [], write_buffer = [],
                             http_options = [], extra_headers = []},
    ApplyOption = fun ({http_options, HttpOpts},
                       State = #http_transport{}) ->
                          State#http_transport{http_options = HttpOpts};
                      ({extra_headers, ExtraHeaders},
                       State = #http_transport{}) ->
                          State#http_transport{extra_headers = ExtraHeaders};
                      (Other, #http_transport{}) -> {invalid_option, Other};
                      (_, Error) -> Error
                  end,
    case lists:foldl(ApplyOption, State1, Options) of
        State2 = #http_transport{} ->
            thrift_transport:new(thrift_http_transport, State2);
        Else -> {error, Else}
    end.

write(State = #http_transport{write_buffer = WBuf},
      Data) ->
    {State#http_transport{write_buffer = [WBuf, Data]}, ok}.

flush(State = #http_transport{host = Host, path = Path,
                              read_buffer = Rbuf, write_buffer = Wbuf,
                              http_options = HttpOptions,
                              extra_headers = ExtraHeaders}) ->
    case iolist_to_binary(Wbuf) of
        <<>> -> {State, ok};
        WBinary ->
            {ok, {{_Version, 200, _ReasonPhrase}, _Headers, Body}} =
                httpc:request(post,
                              {"http://" ++ Host ++ Path,
                               [{"User-Agent", "Erlang/thrift_http_transport"}
                                | ExtraHeaders],
                               "application/x-thrift",
                               WBinary},
                              HttpOptions,
                              [{body_format, binary}]),
            State1 = State#http_transport{read_buffer =
                                              [Rbuf, Body],
                                          write_buffer = []},
            {State1, ok}
    end.

close(State) -> {State, ok}.

read(State = #http_transport{read_buffer = RBuf}, Len)
    when is_integer(Len) ->
    Give = min(iolist_size(RBuf), Len),
    case iolist_to_binary(RBuf) of
        <<Data:Give/binary, RBuf1/binary>> ->
            Response = {ok, Data},
            State1 = State#http_transport{read_buffer = RBuf1},
            {State1, Response};
        _ -> {State, {error, 'EOF'}}
    end.

