-file("src/lib/emysql/emysql_util.erl", 1).

-module(emysql_util).

-export([field_names/1,
         as_record/4,
         as_record/3,
         length_coded_binary/1,
         length_coded_string/1,
         null_terminated_string/2,
         asciz/1,
         bxor_binary/2,
         dualmap/3,
         hash/1,
         rnd/3,
         encode/1,
         encode/2,
         quote/1]).

-compile(export_all).

-file("inc/emysql.hrl", 1).

-record(pool,
        {pool_id,
         user,
         password,
         host,
         port,
         database,
         encoding,
         available = queue:new(),
         locked = gb_trees:empty(),
         waiting = queue:new(),
         max_conn_num = 0,
         min_conn_num = 0}).

-record(emysql_connection,
        {id,
         pool_id,
         encoding,
         socket,
         version,
         thread_id,
         caps,
         language,
         prepared = gb_trees:empty(),
         locked_at,
         alive = true}).

-record(greeting,
        {protocol_version,
         server_version,
         thread_id,
         salt1,
         salt2,
         caps,
         caps_high,
         language,
         status,
         seq_num,
         plugin}).

-record(field,
        {seq_num,
         catalog,
         db,
         table,
         org_table,
         name,
         org_name,
         type,
         default,
         charset_nr,
         length,
         flags,
         decimals}).

-record(packet, {size, seq_num, data}).

-record(ok_packet,
        {seq_num,
         affected_rows,
         insert_id,
         status,
         warning_count,
         msg}).

-record(error_packet, {seq_num, code, status, msg}).

-record(eof_packet, {seq_num, status, warning_count}).

-record(result_packet,
        {seq_num, field_list, rows, extra}).

-file("src/lib/emysql/emysql_util.erl", 32).

field_names(Result)
    when is_record(Result, result_packet) ->
    [Field#field.name
     || Field <- Result#result_packet.field_list].

as_record(Result, RecordName, Fields, Fun)
    when is_record(Result, result_packet),
         is_atom(RecordName), is_list(Fields),
         is_function(Fun) ->
    {Lookup, _} = lists:mapfoldl(fun (#field{name = Name},
                                      Acc) ->
                                         {{binary_to_atom(Name, utf8), Acc},
                                          Acc + 1}
                                 end,
                                 1,
                                 Result#result_packet.field_list),
    [begin
         RecordData = [case proplists:get_value(Field, Lookup) of
                           undefined -> undefined;
                           Index -> lists:nth(Index, Row)
                       end
                       || Field <- Fields],
         Fun(list_to_tuple([RecordName | RecordData]))
     end
     || Row <- Result#result_packet.rows].

as_record(Result, RecordName, Fields)
    when is_record(Result, result_packet),
         is_atom(RecordName), is_list(Fields) ->
    as_record(Result, RecordName, Fields, fun (A) -> A end).

length_coded_binary(<<>>) -> {<<>>, <<>>};
length_coded_binary(<<FirstByte:8, Tail/binary>>) ->
    if FirstByte =< 250 -> {FirstByte, Tail};
       FirstByte == 251 -> {undefined, Tail};
       FirstByte == 252 ->
           <<Word:16/little, Tail1/binary>> = Tail,
           {Word, Tail1};
       FirstByte == 253 ->
           <<Word:24/little, Tail1/binary>> = Tail,
           {Word, Tail1};
       FirstByte == 254 ->
           <<Word:64/little, Tail1/binary>> = Tail,
           {Word, Tail1};
       true -> exit(poorly_formatted_length_encoded_binary)
    end.

length_coded_string(<<>>) -> {<<>>, <<>>};
length_coded_string(Bin) ->
    case length_coded_binary(Bin) of
        {undefined, Rest} -> {undefined, Rest};
        {Length, Rest} ->
            case Rest of
                <<String:Length/binary, Rest1/binary>> ->
                    {String, Rest1};
                _ -> exit(poorly_formatted_length_coded_string)
            end
    end.

null_terminated_string(<<0, Tail/binary>>, Acc) ->
    {Acc, Tail};
null_terminated_string(<<_:8>>, _) ->
    exit(poorly_formatted_null_terminated_string);
null_terminated_string(<<H:1/binary, Tail/binary>>,
                       Acc) ->
    null_terminated_string(Tail, <<Acc/binary, H/binary>>).

asciz(Data) when is_binary(Data) ->
    asciz_binary(Data, []);
asciz(Data) when is_list(Data) ->
    {String, [0 | Rest]} = lists:splitwith(fun (C) -> C /= 0
                                           end,
                                           Data),
    {String, Rest}.

asciz_binary(<<>>, Acc) -> {lists:reverse(Acc), <<>>};
asciz_binary(<<0:8, Rest/binary>>, Acc) ->
    {lists:reverse(Acc), Rest};
asciz_binary(<<C:8, Rest/binary>>, Acc) ->
    asciz_binary(Rest, [C | Acc]).

bxor_binary(B1, B2) ->
    list_to_binary(dualmap(fun (E1, E2) -> E1 bxor E2 end,
                           binary_to_list(B1),
                           binary_to_list(B2))).

dualmap(_F, [], []) -> [];
dualmap(F, [E1 | R1], [E2 | R2]) ->
    [F(E1, E2) | dualmap(F, R1, R2)].

hash(S) -> hash(S, 1345345333, 305419889, 7).

hash([C | S], N1, N2, Add) ->
    N1_1 = N1 bxor ((N1 band 63 + Add) * C + N1 * 256),
    N2_1 = N2 + (N2 * 256 bxor N1_1),
    Add_1 = Add + C,
    hash(S, N1_1, N2_1, Add_1);
hash([], N1, N2, _Add) ->
    Mask = 1 bsl 31 - 1,
    {N1 band Mask, N2 band Mask}.

rnd(N, Seed1, Seed2) ->
    Mod = 1 bsl 30 - 1,
    rnd(N, [], Seed1 rem Mod, Seed2 rem Mod).

rnd(0, List, _, _) -> lists:reverse(List);
rnd(N, List, Seed1, Seed2) ->
    Mod = 1 bsl 30 - 1,
    NSeed1 = (Seed1 * 3 + Seed2) rem Mod,
    NSeed2 = (NSeed1 + Seed2 + 33) rem Mod,
    Float = float(NSeed1) / float(Mod) * 31,
    Val = trunc(Float) + 64,
    rnd(N - 1, [Val | List], NSeed1, NSeed2).

encode(Val) -> encode(Val, binary).

encode(Val, ReturnType) when is_atom(Val) ->
    encode(atom_to_list(Val), ReturnType, latin1);
encode(Val, ReturnType) ->
    encode(Val, ReturnType, latin1).

encode(null, list, _) -> "null";
encode(undefined, list, _) -> "null";
encode(null, binary, _) -> <<"null">>;
encode(undefined, binary, _) -> <<"null">>;
encode(Val, list, latin1) when is_binary(Val) ->
    quote(binary_to_list(Val));
encode(Val, list, Encoding) when is_binary(Val) ->
    quote(unicode:characters_to_list(Val, Encoding));
encode(Val, binary, Encoding) when is_atom(Val) ->
    encode(atom_to_list(Val), binary, Encoding);
encode(Val, binary, latin1) when is_list(Val) ->
    list_to_binary(quote(Val));
encode(Val, binary, Encoding) when is_list(Val) ->
    unicode:characters_to_binary(quote(Val),
                                 Encoding,
                                 Encoding);
encode(Val, binary, latin1) when is_binary(Val) ->
    X = list_to_binary(quote(binary_to_list(Val))),
    X;
encode(Val, binary, Encoding) when is_binary(Val) ->
    case unicode:characters_to_list(Val, Encoding) of
        {error, E1, E2} -> exit({invalid_utf8_binary, E1, E2});
        {incomplete, E1, E2} ->
            exit({invalid_utf8_binary, E1, E2});
        List ->
            unicode:characters_to_binary(quote(List),
                                         Encoding,
                                         Encoding)
    end;
encode(Val, list, _) when is_list(Val) -> quote(Val);
encode(Val, list, _) when is_integer(Val) ->
    integer_to_list(Val);
encode(Val, binary, _) when is_integer(Val) ->
    list_to_binary(integer_to_list(Val));
encode(Val, list, _) when is_float(Val) ->
    [Res] = io_lib:format("~w", [Val]),
    Res;
encode(Val, binary, _) when is_float(Val) ->
    iolist_to_binary(io_lib:format("~w", [Val]));
encode({datetime, Val}, ReturnType, Encoding) ->
    encode(Val, ReturnType, Encoding);
encode({date, Val}, ReturnType, Encoding) ->
    encode(Val, ReturnType, Encoding);
encode({time, Val}, ReturnType, Encoding) ->
    encode(Val, ReturnType, Encoding);
encode({{Year, Month, Day}, {Hour, Minute, Second}},
       list, _) ->
    Res =
        io_lib:format("'~4.4.0w-~2.2.0w-~2.2.0w ~2.2.0w:~2.2.0w:~2.2"
                      ".0w'",
                      [Year, Month, Day, Hour, Minute, Second]),
    lists:flatten(Res);
encode({{_Year, _Month, _Day},
        {_Hour, _Minute, _Second}} =
           Val,
       binary, E) ->
    list_to_binary(encode(Val, list, E));
encode({Time1, Time2, Time3}, list, _) ->
    Res = two_digits([Time1, Time2, Time3]),
    lists:flatten(Res);
encode({_Time1, _Time2, _Time3} = Val, binary, E) ->
    list_to_binary(encode(Val, list, E));
encode(Val, _, _) -> {error, {unrecognized_value, Val}}.

two_digits(Nums) when is_list(Nums) ->
    [two_digits(Num) || Num <- Nums];
two_digits(Num) ->
    [Str] = io_lib:format("~b", [Num]),
    case length(Str) of
        1 -> [$0 | Str];
        _ -> Str
    end.

quote(String) when is_list(String) ->
    [39 | lists:reverse([39 | quote_loop(String)])].

quote(String, _) when is_list(String) -> quote(String);
quote(Any, Pool) when is_record(Any, pool) ->
    quote(Any, Pool#pool.encoding);
quote(Bin, latin1) when is_binary(Bin) ->
    list_to_binary(quote(binary_to_list(Bin)));
quote(Bin, Encoding) when is_binary(Bin) ->
    case unicode:characters_to_list(Bin, Encoding) of
        {error, E1, E2} -> exit({invalid_utf8_binary, E1, E2});
        List ->
            unicode:characters_to_binary(quote(List),
                                         Encoding,
                                         Encoding)
    end.

quote_loop(List) -> quote_loop(List, []).

quote_loop([], Acc) -> Acc;
quote_loop([0 | Rest], Acc) ->
    quote_loop(Rest, [$0, $\\ | Acc]);
quote_loop([10 | Rest], Acc) ->
    quote_loop(Rest, [$n, $\\ | Acc]);
quote_loop([13 | Rest], Acc) ->
    quote_loop(Rest, [$r, $\\ | Acc]);
quote_loop([$\\ | Rest], Acc) ->
    quote_loop(Rest, [$\\, $\\ | Acc]);
quote_loop([39 | Rest], Acc) ->
    quote_loop(Rest, [39, $\\ | Acc]);
quote_loop([34 | Rest], Acc) ->
    quote_loop(Rest, [34, $\\ | Acc]);
quote_loop([26 | Rest], Acc) ->
    quote_loop(Rest, [$Z, $\\ | Acc]);
quote_loop([C | Rest], Acc) ->
    quote_loop(Rest, [C | Acc]).

anybin_to_list(Bin) when is_binary(Bin) ->
    case unicode:characters_to_binary(Bin, utf8, utf8) of
        Bin -> unicode:characters_to_list(Bin);
        _ -> binary_to_list(Bin)
    end.

any_to_binary(L) when is_binary(L) -> L;
any_to_binary(L) when is_list(L) ->
    case unicode:characters_to_binary(L) of
        {error, _, _} -> list_to_binary(L);
        B ->
            case unicode:characters_to_list(B, utf8) of
                L -> B;
                _ -> list_to_binary(L)
            end
    end.

to_binary(L, _) when is_binary(L) -> L;
to_binary(L, latin1) when is_list(L) ->
    list_to_binary(L);
to_binary(L, Encoding) when is_list(L) ->
    unicode:characters_to_binary(L, Encoding, Encoding).

