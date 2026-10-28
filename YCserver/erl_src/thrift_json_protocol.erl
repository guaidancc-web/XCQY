-file("src/lib/thrift/thrift_json_protocol.erl", 1).

-module(thrift_json_protocol).

-behaviour(thrift_protocol).

-file("inc/thrift_constants.hrl", 1).

-record('TApplicationException', {message, type}).

-file("src/lib/thrift/thrift_json_protocol.erl", 28).

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

-file("src/lib/thrift/thrift_json_protocol.erl", 29).

-export([new/1,
         new/2,
         read/2,
         write/2,
         flush_transport/1,
         close_transport/1,
         new_protocol_factory/2]).

-record(json_context, {type, fields_processed = 0}).

-record(json_protocol,
        {transport, context_stack = [], jsx}).

-type state() :: #json_protocol{}.

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

-file("src/lib/thrift/thrift_json_protocol.erl", 52).

typeid_to_json(2) -> "tf";
typeid_to_json(4) -> "dbl";
typeid_to_json(3) -> "i8";
typeid_to_json(6) -> "i16";
typeid_to_json(8) -> "i32";
typeid_to_json(10) -> "i64";
typeid_to_json(11) -> "str";
typeid_to_json(12) -> "rec";
typeid_to_json(13) -> "map";
typeid_to_json(14) -> "set";
typeid_to_json(15) -> "lst".

json_to_typeid("tf") -> 2;
json_to_typeid("dbl") -> 4;
json_to_typeid("i8") -> 3;
json_to_typeid("i16") -> 6;
json_to_typeid("i32") -> 8;
json_to_typeid("i64") -> 10;
json_to_typeid("str") -> 11;
json_to_typeid("rec") -> 12;
json_to_typeid("map") -> 13;
json_to_typeid("set") -> 14;
json_to_typeid("lst") -> 15.

start_context(object) -> "{";
start_context(array) -> "[".

end_context(object) -> "}";
end_context(array) -> "]".

new(Transport) -> new(Transport, _Options = []).

new(Transport, _Options) ->
    State = #json_protocol{transport = Transport},
    thrift_protocol:new(thrift_json_protocol, State).

flush_transport(This = #json_protocol{transport =
                                          Transport}) ->
    {NewTransport, Result} =
        thrift_transport:flush(Transport),
    {This#json_protocol{transport = NewTransport,
                        context_stack = []},
     Result}.

close_transport(This = #json_protocol{transport =
                                          Transport}) ->
    {NewTransport, Result} =
        thrift_transport:close(Transport),
    {This#json_protocol{transport = NewTransport,
                        context_stack = [], jsx = undefined},
     Result}.

write(#json_protocol{context_stack = Stack} = State0,
      {enter_context, Type}) ->
    {State1, ok} = write_values(State0,
                                [{context_pre_item, false}]),
    State2 = State1#json_protocol{context_stack =
                                      [#json_context{type = Type} | Stack]},
    write_values(State2,
                 [list_to_binary(start_context(Type))]);
write(#json_protocol{context_stack =
                         [CurrCtxt | Stack]} =
          State0,
      {exit_context}) ->
    Type = CurrCtxt#json_context.type,
    State1 = State0#json_protocol{context_stack = Stack},
    write_values(State1,
                 [list_to_binary(end_context(Type)),
                  {context_post_item, false}]);
write(#json_protocol{context_stack = []} = This0,
      {context_pre_item, _}) ->
    {This0, ok};
write(#json_protocol{context_stack =
                         [Context | _CtxtTail]} =
          This0,
      {context_pre_item, MayNeedQuotes}) ->
    FieldNo = Context#json_context.fields_processed,
    CtxtType = Context#json_context.type,
    Rem = FieldNo rem 2,
    case {CtxtType, FieldNo, Rem, MayNeedQuotes} of
        {array, N, _, _} when N > 0 -> write(This0, <<",">>);
        {object, 0, _, true} -> write(This0, <<"\"">>);
        {object, N, 0, true} when N > 0 ->
            write(This0, <<",\"">>);
        {object, N, 0, false} when N > 0 ->
            write(This0, <<",">>);
        _ -> {This0, ok}
    end;
write(#json_protocol{context_stack = []} = This0,
      {context_post_item, _}) ->
    {This0, ok};
write(#json_protocol{context_stack =
                         [Context | CtxtTail]} =
          This0,
      {context_post_item, MayNeedQuotes}) ->
    FieldNo = Context#json_context.fields_processed,
    CtxtType = Context#json_context.type,
    Rem = FieldNo rem 2,
    {This1, ok} = case {CtxtType, Rem, MayNeedQuotes} of
                      {object, 0, true} -> write(This0, <<"\":">>);
                      {object, 0, false} -> write(This0, <<":">>);
                      _ -> {This0, ok}
                  end,
    NewContext = Context#json_context{fields_processed =
                                          FieldNo + 1},
    {This1#json_protocol{context_stack =
                             [NewContext | CtxtTail]},
     ok};
write(This0,
      #protocol_message_begin{name = Name, type = Type,
                              seqid = Seqid}) ->
    write_values(This0,
                 [{enter_context, array},
                  {i32, 1},
                  {string, Name},
                  {i32, Type},
                  {i32, Seqid}]);
write(This, message_end) ->
    write_values(This, [{exit_context}]);
write(This0,
      #protocol_field_begin{name = _Name, type = Type,
                            id = Id}) ->
    write_values(This0,
                 [{i16, Id},
                  {enter_context, object},
                  {string, typeid_to_json(Type)}]);
write(This, field_stop) -> {This, ok};
write(This, field_end) ->
    write_values(This, [{exit_context}]);
write(This0,
      #protocol_map_begin{ktype = Ktype, vtype = Vtype,
                          size = Size}) ->
    write_values(This0,
                 [{enter_context, array},
                  {string, typeid_to_json(Ktype)},
                  {string, typeid_to_json(Vtype)},
                  {i32, Size},
                  {enter_context, object}]);
write(This, map_end) ->
    write_values(This, [{exit_context}, {exit_context}]);
write(This0,
      #protocol_list_begin{etype = Etype, size = Size}) ->
    write_values(This0,
                 [{enter_context, array},
                  {string, typeid_to_json(Etype)},
                  {i32, Size}]);
write(This, list_end) ->
    write_values(This, [{exit_context}]);
write(This0,
      #protocol_set_begin{etype = Etype, size = Size}) ->
    write_values(This0,
                 [{enter_context, array},
                  {string, typeid_to_json(Etype)},
                  {i32, Size}]);
write(This, set_end) ->
    write_values(This, [{exit_context}]);
write(This, #protocol_struct_begin{}) ->
    write_values(This, [{enter_context, object}]);
write(This, struct_end) ->
    write_values(This, [{exit_context}]);
write(This, {bool, true}) ->
    write_values(This,
                 [{context_pre_item, true},
                  <<"true">>,
                  {context_post_item, true}]);
write(This, {bool, false}) ->
    write_values(This,
                 [{context_pre_item, true},
                  <<"false">>,
                  {context_post_item, true}]);
write(This, {byte, Byte}) ->
    write_values(This,
                 [{context_pre_item, true},
                  list_to_binary(integer_to_list(Byte)),
                  {context_post_item, true}]);
write(This, {i16, I16}) -> write(This, {byte, I16});
write(This, {i32, I32}) -> write(This, {byte, I32});
write(This, {i64, I64}) -> write(This, {byte, I64});
write(This, {double, Double}) ->
    write_values(This,
                 [{context_pre_item, true},
                  list_to_binary(io_lib:format("~.*f", [16, Double])),
                  {context_post_item, true}]);
write(This0, {string, Str}) ->
    write_values(This0,
                 [{context_pre_item, false},
                  case is_binary(Str) of
                      true -> Str;
                      false -> <<"\"", (list_to_binary(Str))/binary, "\"">>
                  end,
                  {context_post_item, false}]);
write(This = #json_protocol{transport = Trans}, Data) ->
    {NewTransport, Result} = thrift_transport:write(Trans,
                                                    Data),
    {This#json_protocol{transport = NewTransport}, Result}.

write_values(This0, ValueList) ->
    FinalState = lists:foldl(fun (Val, ThisIn) ->
                                     {ThisOut, ok} = write(ThisIn, Val),
                                     ThisOut
                             end,
                             This0,
                             ValueList),
    {FinalState, ok}.

read_all(#json_protocol{transport = Transport0} =
             State) ->
    {Transport1, Bin} = read_all_1(Transport0, []),
    P = thrift_json_parser:parser(),
    [First | Rest] = P(Bin),
    State#json_protocol{transport = Transport1,
                        jsx = {event, First, Rest}}.

read_all_1(Transport0, IoList) ->
    {Transport1, Result} = thrift_transport:read(Transport0,
                                                 1),
    case Result of
        {ok, <<>>} ->
            {Transport1, iolist_to_binary(lists:reverse(IoList))};
        {ok, Data} -> read_all_1(Transport1, [Data | IoList]);
        {error, 'EOF'} ->
            {Transport1, iolist_to_binary(lists:reverse(IoList))}
    end.

expect(#json_protocol{jsx =
                          {event, {Type, Data} = Ev, [Next | Rest]}} =
           State,
       ExpectedType) ->
    NextState = State#json_protocol{jsx =
                                        {event, Next, Rest}},
    case Type == ExpectedType of
        true -> {NextState, {ok, convert_data(Type, Data)}};
        false ->
            {NextState, {error, {unexpected_json_event, Ev}}}
    end;
expect(#json_protocol{jsx = {event, Event, Next}} =
           State,
       ExpectedEvent) ->
    expect(State#json_protocol{jsx =
                                   {event, {Event, none}, Next}},
           ExpectedEvent).

convert_data(integer, I) -> list_to_integer(I);
convert_data(float, F) -> list_to_float(F);
convert_data(_, D) -> D.

expect_many(State, ExpectedList) ->
    expect_many_1(State, ExpectedList, [], ok).

expect_many_1(State, [], ResultList, Status) ->
    {State, {Status, lists:reverse(ResultList)}};
expect_many_1(State, [Expected | ExpTail], ResultList,
              _PrevStatus) ->
    {State1, {Status, Data}} = expect(State, Expected),
    NewResultList = [Data | ResultList],
    case Status of
        error ->
            expect_many_1(State1, [], NewResultList, Status);
        ok ->
            expect_many_1(State1, ExpTail, NewResultList, Status)
    end.

expect_nodata(This, ExpectedList) ->
    case expect_many(This, ExpectedList) of
        {State, {ok, _}} -> {State, ok};
        Error -> Error
    end.

read_field(#json_protocol{jsx =
                              {event, Field, [Next | Rest]}} =
               State) ->
    NewState = State#json_protocol{jsx =
                                       {event, Next, Rest}},
    {NewState, Field}.

read(This0, message_begin) ->
    This1 = read_all(This0),
    case expect_many(This1,
                     [start_array, integer, string, integer, integer])
        of
        {This2, {ok, [_, Version, Name, Type, SeqId]}} ->
            case Version =:= 1 of
                true ->
                    {This2,
                     #protocol_message_begin{name = Name, type = Type,
                                             seqid = SeqId}};
                false -> {This2, {error, no_json_protocol_version}}
            end;
        Other -> Other
    end;
read(This, message_end) ->
    expect_nodata(This, [end_array]);
read(This, struct_begin) ->
    expect_nodata(This, [start_object]);
read(This, struct_end) ->
    expect_nodata(This, [end_object]);
read(This0, field_begin) ->
    {This1, Read} = expect_many(This0,
                                [key, start_object, key]),
    case Read of
        {ok, [FieldIdStr, _, FieldType]} ->
            {This1,
             #protocol_field_begin{type = json_to_typeid(FieldType),
                                   id = list_to_integer(FieldIdStr)}};
        {error,
         [{unexpected_json_event, {end_object, none}}]} ->
            {This1, #protocol_field_begin{type = 0}};
        Other ->
            io:format("**** OTHER branch selected ****"),
            {This1, Other}
    end;
read(This, field_end) ->
    expect_nodata(This, [end_object]);
read(This0, map_begin) ->
    case expect_many(This0,
                     [start_array, string, string, integer, start_object])
        of
        {This1, {ok, [_, Ktype, Vtype, Size, _]}} ->
            {This1,
             #protocol_map_begin{ktype = Ktype, vtype = Vtype,
                                 size = Size}};
        Other -> Other
    end;
read(This, map_end) ->
    expect_nodata(This, [end_object, end_array]);
read(This0, list_begin) ->
    case expect_many(This0, [start_array, string, integer])
        of
        {This1, {ok, [_, Etype, Size]}} ->
            {This1,
             #protocol_list_begin{etype = Etype, size = Size}};
        Other -> Other
    end;
read(This, list_end) ->
    expect_nodata(This, [end_array]);
read(This0, set_begin) ->
    case expect_many(This0, [start_array, string, integer])
        of
        {This1, {ok, [_, Etype, Size]}} ->
            {This1,
             #protocol_set_begin{etype = Etype, size = Size}};
        Other -> Other
    end;
read(This, set_end) -> expect_nodata(This, [end_array]);
read(This0, field_stop) -> {This0, ok};
read(This0, bool) ->
    {This1, Field} = read_field(This0),
    Value = case Field of
                {literal, I} -> {ok, I};
                _Other -> {error, unexpected_event_for_boolean}
            end,
    {This1, Value};
read(This0, byte) ->
    {This1, Field} = read_field(This0),
    Value = case Field of
                {key, K} -> {ok, list_to_integer(K)};
                {integer, I} -> {ok, list_to_integer(I)};
                _Other -> {error, unexpected_event_for_integer}
            end,
    {This1, Value};
read(This0, i16) -> read(This0, byte);
read(This0, i32) -> read(This0, byte);
read(This0, i64) -> read(This0, byte);
read(This0, double) ->
    {This1, Field} = read_field(This0),
    Value = case Field of
                {float, I} -> {ok, list_to_float(I)};
                _Other -> {error, unexpected_event_for_double}
            end,
    {This1, Value};
read(This0, string) ->
    {This1, Field} = read_field(This0),
    Value = case Field of
                {string, I} -> {ok, I};
                {key, J} -> {ok, J};
                _Other -> {error, unexpected_event_for_string}
            end,
    {This1, Value}.

new_protocol_factory(TransportFactory, _Options) ->
    F = fun () ->
                {ok, Transport} = TransportFactory(),
                thrift_json_protocol:new(Transport, [])
        end,
    {ok, F}.

