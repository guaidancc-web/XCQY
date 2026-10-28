-file("src/lib/thrift/thrift_compact_protocol.erl", 1).

-module(thrift_compact_protocol).

-behaviour(thrift_protocol).

-file("inc/thrift_constants.hrl", 1).

-record('TApplicationException', {message, type}).

-file("src/lib/thrift/thrift_compact_protocol.erl", 25).

-file("inc/thrift_protocol.hrl", 1).

-record(protocol_message_begin, {name, type, seqid}).

-record(protocol_struct_begin, {name}).

-record(protocol_field_begin, {name, type, id}).

-record(protocol_map_begin, {ktype, vtype, size}).

-record(protocol_list_begin, {etype, size}).

-record(protocol_set_begin, {etype, size}).

-type tprot_header_val() :: #protocol_message_begin{} |
                            #protocol_struct_begin{} |
                            #protocol_field_begin{} |
                            #protocol_map_begin{} |
                            #protocol_list_begin{} |
                            #protocol_set_begin{}.

-type tprot_empty_tag() :: message_end |
                           struct_begin |
                           struct_end |
                           field_end |
                           map_end |
                           list_end |
                           set_end.

-type tprot_header_tag() :: message_begin |
                            field_begin |
                            map_begin |
                            list_begin |
                            set_begin.

-type tprot_data_tag() :: ui32 |
                          bool |
                          byte |
                          i16 |
                          i32 |
                          i64 |
                          double |
                          string.

-type tprot_cont_tag() :: {list, _Type} |
                          {map, _KType, _VType} |
                          {set, _Type}.

-file("src/lib/thrift/thrift_compact_protocol.erl", 26).

-export([new/1,
         new/2,
         read/2,
         write/2,
         flush_transport/1,
         close_transport/1,
         new_protocol_factory/2]).

-record(t_compact,
        {transport,
         read_stack = [],
         read_value = 0,
         write_stack = [],
         write_id = 65536}).

-type state() :: #t_compact{}.

-file("inc/thrift_protocol_behaviour.hrl", 1).

-spec flush_transport(state()) -> {state(),
                                   ok | {error, _Reason}}.

-spec close_transport(state()) -> {state(),
                                   ok | {error, _Reason}}.

-spec write(state(), any()) -> {state(),
                                ok | {error, _Reason}}.

-spec read(state(), tprot_empty_tag()) -> {state(),
                                           ok | {error, _Reason}};
          (state(), tprot_header_tag()) -> {state(),
                                            tprot_header_val() |
                                            {error, _Reason}};
          (state(), tprot_data_tag()) -> {state(),
                                          {ok, any()} | {error, _Reason}}.

-file("src/lib/thrift/thrift_compact_protocol.erl", 49).

typeid_to_compact(0) -> 0;
typeid_to_compact(2) -> 2;
typeid_to_compact(3) -> 3;
typeid_to_compact(6) -> 4;
typeid_to_compact(8) -> 5;
typeid_to_compact(10) -> 6;
typeid_to_compact(4) -> 7;
typeid_to_compact(11) -> 8;
typeid_to_compact(12) -> 12;
typeid_to_compact(13) -> 11;
typeid_to_compact(14) -> 10;
typeid_to_compact(15) -> 9.

compact_to_typeid(0) -> 0;
compact_to_typeid(2) -> 2;
compact_to_typeid(1) -> 2;
compact_to_typeid(7) -> 4;
compact_to_typeid(3) -> 3;
compact_to_typeid(4) -> 6;
compact_to_typeid(5) -> 8;
compact_to_typeid(6) -> 10;
compact_to_typeid(8) -> 11;
compact_to_typeid(12) -> 12;
compact_to_typeid(11) -> 13;
compact_to_typeid(10) -> 14;
compact_to_typeid(9) -> 15.

bool_to_cbool(Value) when Value -> 1;
bool_to_cbool(_) -> 2.

cbool_to_bool(Value) -> Value =:= 1.

new(Transport) -> new(Transport, _Options = []).

new(Transport, _Options) ->
    State = #t_compact{transport = Transport},
    thrift_protocol:new(thrift_compact_protocol, State).

flush_transport(This = #t_compact{transport =
                                      Transport}) ->
    {NewTransport, Result} =
        thrift_transport:flush(Transport),
    {This#t_compact{transport = NewTransport}, Result}.

close_transport(This = #t_compact{transport =
                                      Transport}) ->
    {NewTransport, Result} =
        thrift_transport:close(Transport),
    {This#t_compact{transport = NewTransport}, Result}.

write_field_begin(This0 = #t_compact{write_stack =
                                         [LastId | T]},
                  CompactType, Id) ->
    IdDiff = Id - LastId,
    This1 = This0#t_compact{write_stack = [Id | T]},
    case (IdDiff > 0) and (IdDiff < 16) of
        true ->
            write(This1, {byte, IdDiff bsl 4 bor CompactType});
        false ->
            {This2, ok} = write(This1, {byte, CompactType}),
            write(This2, {i16, Id})
    end.

-spec to_zigzag(integer()) -> non_neg_integer().

to_zigzag(Value) ->
    18446744073709551615 band
        (Value bsl 1 bxor (Value bsr 63)).

-spec from_zigzag(non_neg_integer()) -> integer().

from_zigzag(Value) -> Value bsr 1 bxor -(Value band 1).

-spec to_varint(non_neg_integer(),
                iolist()) -> iolist().

to_varint(Value, Acc) when Value < 128 -> [Acc, Value];
to_varint(Value, Acc) ->
    to_varint(Value bsr 7, [Acc, Value band 127 bor 128]).

-spec read_varint(#t_compact{}, non_neg_integer(),
                  non_neg_integer()) -> non_neg_integer().

read_varint(This0, Acc, Count) ->
    {This1, {ok, Byte}} = read(This0, byte),
    case Byte band 128 of
        0 -> {This1, {ok, Byte bsl 7 * Count + Acc}};
        _ ->
            read_varint(This1,
                        Byte band 127 bsl 7 * Count + Acc,
                        Count + 1)
    end.

write(This0,
      #protocol_message_begin{name = Name, type = Type,
                              seqid = Seqid}) ->
    {This1, ok} = write(This0, {byte, 130}),
    {This2, ok} = write(This1,
                        {byte, 1 band 31 bor (Type bsl 5)}),
    {This3, ok} = write(This2, {ui32, Seqid}),
    {This4, ok} = write(This3, {string, Name}),
    {This4, ok};
write(This, message_end) -> {This, ok};
write(This0,
      #protocol_field_begin{name = _Name, type = Type,
                            id = Id})
    when Type =:= 2 ->
    {This0#t_compact{write_id = Id}, ok};
write(This0,
      #protocol_field_begin{name = _Name, type = Type,
                            id = Id}) ->
    write_field_begin(This0, typeid_to_compact(Type), Id);
write(This, field_stop) -> write(This, {byte, 0});
write(This, field_end) -> {This, ok};
write(This0,
      #protocol_map_begin{ktype = _Ktype, vtype = _Vtype,
                          size = Size})
    when Size =:= 0 ->
    write(This0, {byte, 0});
write(This0,
      #protocol_map_begin{ktype = Ktype, vtype = Vtype,
                          size = Size}) ->
    {This1, ok} = write(This0, {ui32, Size}),
    write(This1,
          {byte,
           typeid_to_compact(Ktype) bsl 4 bor
               typeid_to_compact(Vtype)});
write(This, map_end) -> {This, ok};
write(This0,
      #protocol_list_begin{etype = Etype, size = Size})
    when Size < 15 ->
    write(This0,
          {byte, Size bsl 4 bor typeid_to_compact(Etype)});
write(This0,
      #protocol_list_begin{etype = Etype, size = Size}) ->
    {This1, ok} = write(This0,
                        {byte, 240 bor typeid_to_compact(Etype)}),
    write(This1, {ui32, Size});
write(This, list_end) -> {This, ok};
write(This0,
      #protocol_set_begin{etype = Etype, size = Size}) ->
    write(This0,
          #protocol_list_begin{etype = Etype, size = Size});
write(This, set_end) -> {This, ok};
write(This = #t_compact{write_stack = Stack},
      #protocol_struct_begin{}) ->
    {This#t_compact{write_stack = [0 | Stack]}, ok};
write(This = #t_compact{write_stack = [_ | T]},
      struct_end) ->
    {This#t_compact{write_stack = T}, ok};
write(This = #t_compact{write_id = 65536},
      {bool, Value}) ->
    write(This, {byte, bool_to_cbool(Value)});
write(This0 = #t_compact{write_id = Id},
      {bool, Value}) ->
    {This1, ok} = write_field_begin(This0,
                                    bool_to_cbool(Value),
                                    Id),
    {This1#t_compact{write_id = 65536}, ok};
write(This, {byte, Value}) when is_integer(Value) ->
    write(This, <<Value:8/big-signed>>);
write(This, {i16, Value}) when is_integer(Value) ->
    write(This, to_varint(to_zigzag(Value), []));
write(This, {ui32, Value}) when is_integer(Value) ->
    write(This, to_varint(Value, []));
write(This, {i32, Value}) when is_integer(Value) ->
    write(This, to_varint(to_zigzag(Value), []));
write(This, {i64, Value}) when is_integer(Value) ->
    write(This, to_varint(to_zigzag(Value), []));
write(This, {double, Double}) ->
    write(This, <<Double:64/float-signed-little>>);
write(This0, {string, Str}) when is_list(Str) ->
    {This1, ok} = write(This0, {ui32, length(Str)}),
    {This2, ok} = write(This1, list_to_binary(Str)),
    {This2, ok};
write(This0, {string, Bin}) when is_binary(Bin) ->
    {This1, ok} = write(This0, {ui32, size(Bin)}),
    {This2, ok} = write(This1, Bin),
    {This2, ok};
write(This = #t_compact{transport = Trans}, Data) ->
    {NewTransport, Result} = thrift_transport:write(Trans,
                                                    Data),
    {This#t_compact{transport = NewTransport}, Result}.

read(This0, message_begin) ->
    {This1, {ok, 130}} = read(This0, ubyte),
    {This2, {ok, VerAndType}} = read(This1, ubyte),
    1 = VerAndType band 31,
    {This3, {ok, SeqId}} = read(This2, ui32),
    {This4, {ok, Name}} = read(This3, string),
    {This4,
     #protocol_message_begin{name = binary_to_list(Name),
                             type = (VerAndType bsr 5) band 7, seqid = SeqId}};
read(This, message_end) -> {This, ok};
read(This = #t_compact{read_stack = Stack},
     struct_begin) ->
    {This#t_compact{read_stack = [0 | Stack]}, ok};
read(This = #t_compact{read_stack = [_H | T]},
     struct_end) ->
    {This#t_compact{read_stack = T}, ok};
read(This0 = #t_compact{read_stack = [LastId | T]},
     field_begin) ->
    {This1, {ok, Byte}} = read(This0, ubyte),
    case Byte band 15 of
        CompactType = 0 ->
            {This1, #protocol_field_begin{type = CompactType}};
        CompactType ->
            {This2, {ok, Id}} = case Byte bsr 4 of
                                    0 -> read(This1, i16);
                                    IdDiff -> {This1, {ok, LastId + IdDiff}}
                                end,
            case compact_to_typeid(CompactType) of
                2 ->
                    {This2#t_compact{read_stack = [Id | T],
                                     read_value = cbool_to_bool(CompactType)},
                     #protocol_field_begin{type = 2, id = Id}};
                Type ->
                    {This2#t_compact{read_stack = [Id | T]},
                     #protocol_field_begin{type = Type, id = Id}}
            end
    end;
read(This, field_end) -> {This, ok};
read(This0, map_begin) ->
    {This1, {ok, Size}} = read(This0, ui32),
    {This2, {ok, KV}} = case Size of
                            0 -> {This1, {ok, 0}};
                            _ -> read(This1, ubyte)
                        end,
    {This2,
     #protocol_map_begin{ktype = compact_to_typeid(KV bsr 4),
                         vtype = compact_to_typeid(KV band 15), size = Size}};
read(This, map_end) -> {This, ok};
read(This0, list_begin) ->
    {This1, {ok, SizeAndType}} = read(This0, ubyte),
    {This2, {ok, Size}} = case (SizeAndType bsr 4) band 15
                              of
                              15 -> read(This1, ui32);
                              Else -> {This1, {ok, Else}}
                          end,
    {This2,
     #protocol_list_begin{etype =
                              compact_to_typeid(SizeAndType band 15),
                          size = Size}};
read(This, list_end) -> {This, ok};
read(This0, set_begin) ->
    {This1, {ok, SizeAndType}} = read(This0, ubyte),
    {This2, {ok, Size}} = case (SizeAndType bsr 4) band 15
                              of
                              15 -> read(This1, ui32);
                              Else -> {This1, {ok, Else}}
                          end,
    {This2,
     #protocol_set_begin{etype =
                             compact_to_typeid(SizeAndType band 15),
                         size = Size}};
read(This, set_end) -> {This, ok};
read(This0, field_stop) ->
    {This1, {ok, 0}} = read(This0, ubyte),
    {This1, ok};
read(This0 = #t_compact{read_value = 0}, bool) ->
    {This1, {ok, Byte}} = read(This0, ubyte),
    {This1, {ok, cbool_to_bool(Byte)}};
read(This0 = #t_compact{read_value = Bool}, bool) ->
    {This0#t_compact{read_value = 0}, {ok, Bool}};
read(This0, ubyte) ->
    {This1,
     {ok, <<Val:8/integer-unsigned-big, _/binary>>}} =
        read_data(This0, 1),
    {This1, {ok, Val}};
read(This0, byte) ->
    {This1, Bytes} = read_data(This0, 1),
    case Bytes of
        {ok, <<Val:8/integer-signed-big, _/binary>>} ->
            {This1, {ok, Val}};
        Else -> {This1, Else}
    end;
read(This0, i16) ->
    {This1, {ok, Zigzag}} = read_varint(This0, 0, 0),
    {This1, {ok, from_zigzag(Zigzag)}};
read(This0, ui32) -> read_varint(This0, 0, 0);
read(This0, i32) ->
    {This1, {ok, Zigzag}} = read_varint(This0, 0, 0),
    {This1, {ok, from_zigzag(Zigzag)}};
read(This0, i64) ->
    {This1, {ok, Zigzag}} = read_varint(This0, 0, 0),
    {This1, {ok, from_zigzag(Zigzag)}};
read(This0, double) ->
    {This1, Bytes} = read_data(This0, 8),
    case Bytes of
        {ok, <<Val:64/float-signed-little, _/binary>>} ->
            {This1, {ok, Val}};
        Else -> {This1, Else}
    end;
read(This0, string) ->
    {This1, {ok, Sz}} = read(This0, ui32),
    read_data(This1, Sz).

-spec read_data(#t_compact{},
                non_neg_integer()) -> {#t_compact{},
                                       {ok, binary()} | {error, _Reason}}.

read_data(This, 0) -> {This, {ok, <<>>}};
read_data(This = #t_compact{transport = Trans}, Len)
    when is_integer(Len) andalso Len > 0 ->
    {NewTransport, Result} = thrift_transport:read(Trans,
                                                   Len),
    {This#t_compact{transport = NewTransport}, Result}.

new_protocol_factory(TransportFactory, _Options) ->
    F = fun () ->
                case TransportFactory() of
                    {ok, Transport} ->
                        thrift_compact_protocol:new(Transport, []);
                    {error, Error} -> {error, Error}
                end
        end,
    {ok, F}.

