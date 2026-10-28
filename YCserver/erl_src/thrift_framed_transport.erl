-file("src/lib/thrift/thrift_framed_transport.erl", 1).

-module(thrift_framed_transport).

-behaviour(thrift_transport).

-export([new/1]).

-export([read/2,
         read_exact/2,
         write/2,
         flush/1,
         close/1]).

-record(t_framed, {wrapped, read_buffer, write_buffer}).

-type state() :: #t_framed{}.

-spec new(Transport ::
              thrift_transport:t_transport()) -> thrift_transport:t_transport().

new(Wrapped) ->
    State = #t_framed{wrapped = Wrapped, read_buffer = [],
                      write_buffer = []},
    thrift_transport:new(thrift_framed_transport, State).

-file("inc/thrift_transport_behaviour.hrl", 1).

-spec write(state(), iolist() | binary()) -> {state(),
                                              ok | {error, _Reason}}.

-spec read(state(), non_neg_integer()) -> {state(),
                                           {ok, binary()} | {error, _Reason}}.

-spec flush(state()) -> {state(),
                         ok | {error, _Reason}}.

-spec close(state()) -> {state(),
                         ok | {error, _Reason}}.

-file("src/lib/thrift/thrift_framed_transport.erl", 52).

read(State = #t_framed{wrapped = Wrapped,
                       read_buffer = Buffer},
     Len)
    when is_integer(Len), Len >= 0 ->
    Binary = iolist_to_binary(Buffer),
    case Binary of
        <<>> when Len > 0 ->
            case next_frame(Wrapped) of
                {NewState, {ok, Frame}} ->
                    NewBinary = iolist_to_binary([Binary, Frame]),
                    Give = min(iolist_size(NewBinary), Len),
                    {Result, Remaining} = split_binary(NewBinary, Give),
                    {State#t_framed{wrapped = NewState,
                                    read_buffer = Remaining},
                     {ok, Result}};
                Error -> Error
            end;
        <<>> -> {State, {ok, <<>>}};
        _ ->
            Give = min(iolist_size(Binary), Len),
            {Result, Remaining} = split_binary(Binary, Give),
            {State#t_framed{read_buffer = Remaining}, {ok, Result}}
    end.

read_exact(State = #t_framed{wrapped = Wrapped,
                             read_buffer = Buffer},
           Len)
    when is_integer(Len), Len >= 0 ->
    Binary = iolist_to_binary(Buffer),
    case iolist_size(Binary) of
        X when X >= Len ->
            {Result, Remaining} = split_binary(Binary, Len),
            {State#t_framed{read_buffer = Remaining}, {ok, Result}};
        _ ->
            case next_frame(Wrapped) of
                {NewState, {ok, Frame}} ->
                    read_exact(State#t_framed{wrapped = NewState,
                                              read_buffer = [Buffer, Frame]},
                               Len);
                {NewState, Error} ->
                    {State#t_framed{wrapped = NewState}, Error}
            end
    end.

next_frame(Transport) ->
    case thrift_transport:read_exact(Transport, 4) of
        {NewState,
         {ok, <<FrameLength:32/integer-signed-big>>}} ->
            thrift_transport:read_exact(NewState, FrameLength);
        Error -> Error
    end.

write(State = #t_framed{write_buffer = Buffer}, Data) ->
    {State#t_framed{write_buffer = [Buffer, Data]}, ok}.

flush(State = #t_framed{write_buffer = Buffer,
                        wrapped = Wrapped}) ->
    case iolist_size(Buffer) of
        0 -> {State, ok};
        FrameLen ->
            Data = [<<FrameLen:32/integer-signed-big>>, Buffer],
            {Written, Response} = thrift_transport:write(Wrapped,
                                                         Data),
            {Flushed, ok} = thrift_transport:flush(Written),
            {State#t_framed{wrapped = Flushed, write_buffer = []},
             Response}
    end.

close(State = #t_framed{wrapped = Wrapped}) ->
    {Closed, Result} = thrift_transport:close(Wrapped),
    {State#t_framed{wrapped = Closed}, Result}.

