-file("src/lib/thrift/thrift_file_transport.erl", 1).

-module(thrift_file_transport).

-behaviour(thrift_transport).

-export([new/1, new/2]).

-export([read/2,
         read_exact/2,
         write/2,
         flush/1,
         close/1]).

-export([new_reader/1]).

-record(t_file,
        {device, should_close = true, mode = write}).

-type state() :: #t_file{}.

-spec new(Device ::
              file:io_device()) -> thrift_transport:t_transport().

new(Device) -> new(Device, []).

-spec new(Device :: file:io_device(),
          Opts :: list()) -> thrift_transport:t_transport().

new(Device, Opts) when is_list(Opts) ->
    State = parse_opts(Opts, #t_file{device = Device}),
    thrift_transport:new(thrift_file_transport, State).

parse_opts([{should_close, Bool} | Rest], State)
    when is_boolean(Bool) ->
    parse_opts(Rest, State#t_file{should_close = Bool});
parse_opts([{mode, Mode} | Rest], State)
    when Mode =:= write; Mode =:= read ->
    parse_opts(Rest, State#t_file{mode = Mode});
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

-file("src/lib/thrift/thrift_file_transport.erl", 66).

read(State = #t_file{device = Device, mode = read}, Len)
    when is_integer(Len), Len >= 0 ->
    case file:read(Device, Len) of
        eof -> {State, {error, eof}};
        {ok, Result} -> {State, {ok, iolist_to_binary(Result)}}
    end;
read(State, _) -> {State, {error, write_mode}}.

read_exact(State = #t_file{device = Device,
                           mode = read},
           Len)
    when is_integer(Len), Len >= 0 ->
    case file:read(Device, Len) of
        eof -> {State, {error, eof}};
        {ok, Result} ->
            case iolist_size(Result) of
                X when X < Len -> {State, {error, eof}};
                _ -> {State, {ok, iolist_to_binary(Result)}}
            end
    end;
read_exact(State, _) -> {State, {error, write_mode}}.

write(State = #t_file{device = Device, mode = write},
      Data) ->
    {State, file:write(Device, Data)};
write(State, _) -> {State, {error, read_mode}}.

flush(State = #t_file{device = Device, mode = write}) ->
    {State, file:sync(Device)}.

close(State = #t_file{device = Device,
                      should_close = SC}) ->
    case SC of
        true -> {State, file:close(Device)};
        false -> {State, ok}
    end.

new_reader(Filename) ->
    case file:open(Filename,
                   [read, binary, {read_ahead, 1024 * 1024}])
        of
        {ok, IODevice} ->
            new(IODevice, [{should_close, true}, {mode, read}]);
        Error -> Error
    end.

