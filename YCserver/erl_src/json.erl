-file("src/lib/json.erl", 1).

-module(json).

-export([test/0,
         decode_test/0,
         e2j_vec_test/0,
         encoder_utf8_test/0,
         input_validation_test/0,
         inline_json_test/0,
         big_unicode_test/0,
         custom_decoder_test/0,
         atom_test/0,
         key_encode_test/0,
         unsafe_chars_test/0,
         int_test/0,
         float_fallback_test/0,
         handler_test/0]).

-author('bob@mochimedia.com').

-export([encoder/1, encode/1]).

-export([decoder/1, decode/1]).

-record(encoder, {handler = null, utf8 = false}).

-record(decoder,
        {object_hook = null,
         offset = 0,
         line = 1,
         column = 1,
         state = null}).

encoder(Options) ->
    State = parse_encoder_options(Options, #encoder{}),
    fun (O) -> json_encode(O, State) end.

encode(Any) -> json_encode(Any, #encoder{}).

decoder(Options) ->
    State = parse_decoder_options(Options, #decoder{}),
    fun (O) -> json_decode(O, State) end.

decode(S) -> json_decode(S, #decoder{}).

parse_encoder_options([], State) -> State;
parse_encoder_options([{handler, Handler} | Rest],
                      State) ->
    parse_encoder_options(Rest,
                          State#encoder{handler = Handler});
parse_encoder_options([{utf8, Switch} | Rest], State) ->
    parse_encoder_options(Rest,
                          State#encoder{utf8 = Switch}).

parse_decoder_options([], State) -> State;
parse_decoder_options([{object_hook, Hook} | Rest],
                      State) ->
    parse_decoder_options(Rest,
                          State#decoder{object_hook = Hook}).

json_encode(true, _State) -> <<"true">>;
json_encode(false, _State) -> <<"false">>;
json_encode(null, _State) -> <<"null">>;
json_encode(I, _State)
    when is_integer(I) andalso
             I >= -2147483648 andalso I =< 2147483647 ->
    integer_to_list(I);
json_encode(I, _State) when is_integer(I) ->
    mochinum:digits(float(I));
json_encode(F, _State) when is_float(F) ->
    mochinum:digits(F);
json_encode(S, State) when is_binary(S); is_atom(S) ->
    json_encode_string(S, State);
json_encode(Array, State) when is_list(Array) ->
    json_encode_array(Array, State);
json_encode({struct, Props}, State)
    when is_list(Props) ->
    json_encode_proplist(Props, State);
json_encode({json, IoList}, _State) -> IoList;
json_encode(Bad, #encoder{handler = null}) ->
    exit({json_encode, {bad_term, Bad}});
json_encode(Bad, State = #encoder{handler = Handler}) ->
    json_encode(Handler(Bad), State).

json_encode_array([], _State) -> <<"[]">>;
json_encode_array(L, State) ->
    F = fun (O, Acc) -> [$,, json_encode(O, State) | Acc]
        end,
    [$, | Acc1] = lists:foldl(F, "[", L),
    lists:reverse([$] | Acc1]).

json_encode_proplist([], _State) -> <<"{}">>;
json_encode_proplist(Props, State) ->
    F = fun ({K, V}, Acc) ->
                KS = json_encode_string(K, State),
                VS = json_encode(V, State),
                [$,, VS, $:, KS | Acc]
        end,
    [$, | Acc1] = lists:foldl(F, "{", Props),
    lists:reverse([$} | Acc1]).

json_encode_string(A, State) when is_atom(A) ->
    L = atom_to_list(A),
    case json_string_is_safe(L) of
        true -> [$", L, $"];
        false ->
            json_encode_string_unicode(xmerl_ucs:from_utf8(L),
                                       State,
                                       [$"])
    end;
json_encode_string(B, State) when is_binary(B) ->
    case json_bin_is_safe(B) of
        true -> [$", B, $"];
        false ->
            json_encode_string_unicode(xmerl_ucs:from_utf8(B),
                                       State,
                                       [$"])
    end;
json_encode_string(I, _State) when is_integer(I) ->
    [$", integer_to_list(I), $"];
json_encode_string(L, State) when is_list(L) ->
    case json_string_is_safe(L) of
        true -> [$", L, $"];
        false -> json_encode_string_unicode(L, State, [$"])
    end.

json_string_is_safe([]) -> true;
json_string_is_safe([C | Rest]) ->
    case C of
        $" -> false;
        $\\ -> false;
        $\b -> false;
        $\f -> false;
        $\n -> false;
        $\r -> false;
        $\t -> false;
        C when C >= 0, C < $\s; C >= 127, C =< 1114111 -> false;
        C when C < 127 -> json_string_is_safe(Rest);
        _ -> false
    end.

json_bin_is_safe(<<>>) -> true;
json_bin_is_safe(<<C, Rest/binary>>) ->
    case C of
        $" -> false;
        $\\ -> false;
        $\b -> false;
        $\f -> false;
        $\n -> false;
        $\r -> false;
        $\t -> false;
        C when C >= 0, C < $\s; C >= 127 -> false;
        C when C < 127 -> json_bin_is_safe(Rest)
    end.

json_encode_string_unicode([], _State, Acc) ->
    lists:reverse([$" | Acc]);
json_encode_string_unicode([C | Cs], State, Acc) ->
    Acc1 = case C of
               $" -> [$", $\\ | Acc];
               $\\ -> [$\\, $\\ | Acc];
               $\b -> [$b, $\\ | Acc];
               $\f -> [$f, $\\ | Acc];
               $\n -> [$n, $\\ | Acc];
               $\r -> [$r, $\\ | Acc];
               $\t -> [$t, $\\ | Acc];
               C when C >= 0, C < $\s -> [unihex(C) | Acc];
               C when C >= 127, C =< 1114111, State#encoder.utf8 ->
                   [xmerl_ucs:to_utf8(C) | Acc];
               C when C >= 127, C =< 1114111, not State#encoder.utf8 ->
                   [unihex(C) | Acc];
               C when C < 127 -> [C | Acc];
               _ -> exit({json_encode, {bad_char, C}})
           end,
    json_encode_string_unicode(Cs, State, Acc1).

hexdigit(C) when C >= 0, C =< 9 -> C + $0;
hexdigit(C) when C =< 15 -> C + $a - 10.

unihex(C) when C < 65536 ->
    <<D3:4, D2:4, D1:4, D0:4>> = <<C:16>>,
    Digits = [hexdigit(D) || D <- [D3, D2, D1, D0]],
    [$\\, $u | Digits];
unihex(C) when C =< 1114111 ->
    N = C - 65536,
    S1 = 55296 bor (N bsr 10) band 1023,
    S2 = 56320 bor N band 1023,
    [unihex(S1), unihex(S2)].

json_decode(L, S) when is_list(L) ->
    json_decode(iolist_to_binary(L), S);
json_decode(B, S) ->
    {Res, S1} = decode1(B, S),
    {eof, _} = tokenize(B, S1#decoder{state = trim}),
    Res.

decode1(B, S = #decoder{state = null}) ->
    case tokenize(B, S#decoder{state = any}) of
        {{const, C}, S1} -> {C, S1};
        {start_array, S1} -> decode_array(B, S1);
        {start_object, S1} -> decode_object(B, S1)
    end.

make_object(V, #decoder{object_hook = null}) -> V;
make_object(V, #decoder{object_hook = Hook}) -> Hook(V).

decode_object(B, S) ->
    decode_object(B, S#decoder{state = key}, []).

decode_object(B, S = #decoder{state = key}, Acc) ->
    case tokenize(B, S) of
        {end_object, S1} ->
            V = make_object({struct, lists:reverse(Acc)}, S1),
            {V, S1#decoder{state = null}};
        {{const, K}, S1} ->
            {colon, S2} = tokenize(B, S1),
            {V, S3} = decode1(B, S2#decoder{state = null}),
            decode_object(B,
                          S3#decoder{state = comma},
                          [{K, V} | Acc])
    end;
decode_object(B, S = #decoder{state = comma}, Acc) ->
    case tokenize(B, S) of
        {end_object, S1} ->
            V = make_object({struct, lists:reverse(Acc)}, S1),
            {V, S1#decoder{state = null}};
        {comma, S1} ->
            decode_object(B, S1#decoder{state = key}, Acc)
    end.

decode_array(B, S) ->
    decode_array(B, S#decoder{state = any}, []).

decode_array(B, S = #decoder{state = any}, Acc) ->
    case tokenize(B, S) of
        {end_array, S1} ->
            {lists:reverse(Acc), S1#decoder{state = null}};
        {start_array, S1} ->
            {Array, S2} = decode_array(B, S1),
            decode_array(B,
                         S2#decoder{state = comma},
                         [Array | Acc]);
        {start_object, S1} ->
            {Array, S2} = decode_object(B, S1),
            decode_array(B,
                         S2#decoder{state = comma},
                         [Array | Acc]);
        {{const, Const}, S1} ->
            decode_array(B,
                         S1#decoder{state = comma},
                         [Const | Acc])
    end;
decode_array(B, S = #decoder{state = comma}, Acc) ->
    case tokenize(B, S) of
        {end_array, S1} ->
            {lists:reverse(Acc), S1#decoder{state = null}};
        {comma, S1} ->
            decode_array(B, S1#decoder{state = any}, Acc)
    end.

tokenize_string(B, S = #decoder{offset = O}) ->
    case tokenize_string_fast(B, O) of
        {escape, O1} ->
            Length = O1 - O,
            S1 = S#decoder{offset = Length + S#decoder.offset,
                           column = Length + S#decoder.column},
            <<_:O/binary, Head:Length/binary, _/binary>> = B,
            tokenize_string(B,
                            S1,
                            lists:reverse(binary_to_list(Head)));
        O1 ->
            Length = O1 - O,
            <<_:O/binary, String:Length/binary, $", _/binary>> = B,
            {{const, String},
             S#decoder{offset = Length + 1 + S#decoder.offset,
                       column = Length + 1 + S#decoder.column}}
    end.

tokenize_string_fast(B, O) ->
    case B of
        <<_:O/binary, $", _/binary>> -> O;
        <<_:O/binary, $\\, _/binary>> -> {escape, O};
        <<_:O/binary, C1, _/binary>> when C1 < 128 ->
            tokenize_string_fast(B, 1 + O);
        <<_:O/binary, C1, C2, _/binary>>
            when C1 >= 194, C1 =< 223, C2 >= 128, C2 =< 191 ->
            tokenize_string_fast(B, 2 + O);
        <<_:O/binary, C1, C2, C3, _/binary>>
            when C1 >= 224, C1 =< 239, C2 >= 128, C2 =< 191,
                 C3 >= 128, C3 =< 191 ->
            tokenize_string_fast(B, 3 + O);
        <<_:O/binary, C1, C2, C3, C4, _/binary>>
            when C1 >= 240, C1 =< 244, C2 >= 128, C2 =< 191,
                 C3 >= 128, C3 =< 191, C4 >= 128, C4 =< 191 ->
            tokenize_string_fast(B, 4 + O);
        _ -> throw(invalid_utf8)
    end.

tokenize_string(B, S = #decoder{offset = O}, Acc) ->
    case B of
        <<_:O/binary, $", _/binary>> ->
            {{const, iolist_to_binary(lists:reverse(Acc))},
             S#decoder{offset = 1 + S#decoder.offset,
                       column = 1 + S#decoder.column}};
        <<_:O/binary, "\\\"", _/binary>> ->
            tokenize_string(B,
                            S#decoder{offset = 2 + S#decoder.offset,
                                      column = 2 + S#decoder.column},
                            [$" | Acc]);
        <<_:O/binary, "\\\\", _/binary>> ->
            tokenize_string(B,
                            S#decoder{offset = 2 + S#decoder.offset,
                                      column = 2 + S#decoder.column},
                            [$\\ | Acc]);
        <<_:O/binary, "\\/", _/binary>> ->
            tokenize_string(B,
                            S#decoder{offset = 2 + S#decoder.offset,
                                      column = 2 + S#decoder.column},
                            [$/ | Acc]);
        <<_:O/binary, "\\b", _/binary>> ->
            tokenize_string(B,
                            S#decoder{offset = 2 + S#decoder.offset,
                                      column = 2 + S#decoder.column},
                            [$\b | Acc]);
        <<_:O/binary, "\\f", _/binary>> ->
            tokenize_string(B,
                            S#decoder{offset = 2 + S#decoder.offset,
                                      column = 2 + S#decoder.column},
                            [$\f | Acc]);
        <<_:O/binary, "\\n", _/binary>> ->
            tokenize_string(B,
                            S#decoder{offset = 2 + S#decoder.offset,
                                      column = 2 + S#decoder.column},
                            [$\n | Acc]);
        <<_:O/binary, "\\r", _/binary>> ->
            tokenize_string(B,
                            S#decoder{offset = 2 + S#decoder.offset,
                                      column = 2 + S#decoder.column},
                            [$\r | Acc]);
        <<_:O/binary, "\\t", _/binary>> ->
            tokenize_string(B,
                            S#decoder{offset = 2 + S#decoder.offset,
                                      column = 2 + S#decoder.column},
                            [$\t | Acc]);
        <<_:O/binary, "\\u", C3, C2, C1, C0, Rest/binary>> ->
            C = erlang:list_to_integer([C3, C2, C1, C0], 16),
            if C > 55295, C < 56320 ->
                   <<"\\u", D3, D2, D1, D0, _/binary>> = Rest,
                   D = erlang:list_to_integer([D3, D2, D1, D0], 16),
                   [CodePoint] =
                       xmerl_ucs:from_utf16be(<<C:16/big-unsigned-integer,
                                                D:16/big-unsigned-integer>>),
                   Acc1 = lists:reverse(xmerl_ucs:to_utf8(CodePoint), Acc),
                   tokenize_string(B,
                                   S#decoder{offset = 12 + S#decoder.offset,
                                             column = 12 + S#decoder.column},
                                   Acc1);
               true ->
                   Acc1 = lists:reverse(xmerl_ucs:to_utf8(C), Acc),
                   tokenize_string(B,
                                   S#decoder{offset = 6 + S#decoder.offset,
                                             column = 6 + S#decoder.column},
                                   Acc1)
            end;
        <<_:O/binary, C, _/binary>> ->
            tokenize_string(B,
                            case C of
                                $\n ->
                                    S#decoder{column = 1,
                                              line = 1 + S#decoder.line,
                                              offset = 1 + S#decoder.offset};
                                _ ->
                                    S#decoder{column = 1 + S#decoder.column,
                                              offset = 1 + S#decoder.offset}
                            end,
                            [C | Acc])
    end.

tokenize_number(B, S) ->
    case tokenize_number(B, sign, S, []) of
        {{int, Int}, S1} -> {{const, list_to_integer(Int)}, S1};
        {{float, Float}, S1} ->
            {{const, list_to_float(Float)}, S1}
    end.

tokenize_number(B, sign, S = #decoder{offset = O},
                []) ->
    case B of
        <<_:O/binary, $-, _/binary>> ->
            tokenize_number(B,
                            int,
                            S#decoder{offset = 1 + S#decoder.offset,
                                      column = 1 + S#decoder.column},
                            [$-]);
        _ -> tokenize_number(B, int, S, [])
    end;
tokenize_number(B, int, S = #decoder{offset = O},
                Acc) ->
    case B of
        <<_:O/binary, $0, _/binary>> ->
            tokenize_number(B,
                            frac,
                            S#decoder{offset = 1 + S#decoder.offset,
                                      column = 1 + S#decoder.column},
                            [$0 | Acc]);
        <<_:O/binary, C, _/binary>>
            when C >= $1 andalso C =< $9 ->
            tokenize_number(B,
                            int1,
                            S#decoder{offset = 1 + S#decoder.offset,
                                      column = 1 + S#decoder.column},
                            [C | Acc])
    end;
tokenize_number(B, int1, S = #decoder{offset = O},
                Acc) ->
    case B of
        <<_:O/binary, C, _/binary>>
            when C >= $0 andalso C =< $9 ->
            tokenize_number(B,
                            int1,
                            S#decoder{offset = 1 + S#decoder.offset,
                                      column = 1 + S#decoder.column},
                            [C | Acc]);
        _ -> tokenize_number(B, frac, S, Acc)
    end;
tokenize_number(B, frac, S = #decoder{offset = O},
                Acc) ->
    case B of
        <<_:O/binary, $., C, _/binary>> when C >= $0, C =< $9 ->
            tokenize_number(B,
                            frac1,
                            S#decoder{offset = 2 + S#decoder.offset,
                                      column = 2 + S#decoder.column},
                            [C, $. | Acc]);
        <<_:O/binary, E, _/binary>>
            when E =:= $e orelse E =:= $E ->
            tokenize_number(B,
                            esign,
                            S#decoder{offset = 1 + S#decoder.offset,
                                      column = 1 + S#decoder.column},
                            [$e, $0, $. | Acc]);
        _ -> {{int, lists:reverse(Acc)}, S}
    end;
tokenize_number(B, frac1, S = #decoder{offset = O},
                Acc) ->
    case B of
        <<_:O/binary, C, _/binary>>
            when C >= $0 andalso C =< $9 ->
            tokenize_number(B,
                            frac1,
                            S#decoder{offset = 1 + S#decoder.offset,
                                      column = 1 + S#decoder.column},
                            [C | Acc]);
        <<_:O/binary, E, _/binary>>
            when E =:= $e orelse E =:= $E ->
            tokenize_number(B,
                            esign,
                            S#decoder{offset = 1 + S#decoder.offset,
                                      column = 1 + S#decoder.column},
                            [$e | Acc]);
        _ -> {{float, lists:reverse(Acc)}, S}
    end;
tokenize_number(B, esign, S = #decoder{offset = O},
                Acc) ->
    case B of
        <<_:O/binary, C, _/binary>>
            when C =:= $- orelse C =:= $+ ->
            tokenize_number(B,
                            eint,
                            S#decoder{offset = 1 + S#decoder.offset,
                                      column = 1 + S#decoder.column},
                            [C | Acc]);
        _ -> tokenize_number(B, eint, S, Acc)
    end;
tokenize_number(B, eint, S = #decoder{offset = O},
                Acc) ->
    case B of
        <<_:O/binary, C, _/binary>>
            when C >= $0 andalso C =< $9 ->
            tokenize_number(B,
                            eint1,
                            S#decoder{offset = 1 + S#decoder.offset,
                                      column = 1 + S#decoder.column},
                            [C | Acc])
    end;
tokenize_number(B, eint1, S = #decoder{offset = O},
                Acc) ->
    case B of
        <<_:O/binary, C, _/binary>>
            when C >= $0 andalso C =< $9 ->
            tokenize_number(B,
                            eint1,
                            S#decoder{offset = 1 + S#decoder.offset,
                                      column = 1 + S#decoder.column},
                            [C | Acc]);
        _ -> {{float, lists:reverse(Acc)}, S}
    end.

tokenize(B, S = #decoder{offset = O}) ->
    case B of
        <<_:O/binary, C, _/binary>>
            when C =:= $\s orelse
                     C =:= $\t orelse C =:= $\r orelse C =:= $\n ->
            tokenize(B,
                     case C of
                         $\n ->
                             S#decoder{column = 1, line = 1 + S#decoder.line,
                                       offset = 1 + S#decoder.offset};
                         _ ->
                             S#decoder{column = 1 + S#decoder.column,
                                       offset = 1 + S#decoder.offset}
                     end);
        <<_:O/binary, "{", _/binary>> ->
            {start_object,
             S#decoder{offset = 1 + S#decoder.offset,
                       column = 1 + S#decoder.column}};
        <<_:O/binary, "}", _/binary>> ->
            {end_object,
             S#decoder{offset = 1 + S#decoder.offset,
                       column = 1 + S#decoder.column}};
        <<_:O/binary, "[", _/binary>> ->
            {start_array,
             S#decoder{offset = 1 + S#decoder.offset,
                       column = 1 + S#decoder.column}};
        <<_:O/binary, "]", _/binary>> ->
            {end_array,
             S#decoder{offset = 1 + S#decoder.offset,
                       column = 1 + S#decoder.column}};
        <<_:O/binary, ",", _/binary>> ->
            {comma,
             S#decoder{offset = 1 + S#decoder.offset,
                       column = 1 + S#decoder.column}};
        <<_:O/binary, ":", _/binary>> ->
            {colon,
             S#decoder{offset = 1 + S#decoder.offset,
                       column = 1 + S#decoder.column}};
        <<_:O/binary, "null", _/binary>> ->
            {{const, null},
             S#decoder{offset = 4 + S#decoder.offset,
                       column = 4 + S#decoder.column}};
        <<_:O/binary, "true", _/binary>> ->
            {{const, true},
             S#decoder{offset = 4 + S#decoder.offset,
                       column = 4 + S#decoder.column}};
        <<_:O/binary, "false", _/binary>> ->
            {{const, false},
             S#decoder{offset = 5 + S#decoder.offset,
                       column = 5 + S#decoder.column}};
        <<_:O/binary, "\"", _/binary>> ->
            tokenize_string(B,
                            S#decoder{offset = 1 + S#decoder.offset,
                                      column = 1 + S#decoder.column});
        <<_:O/binary, C, _/binary>>
            when C >= $0 andalso C =< $9 orelse C =:= $- ->
            tokenize_number(B, S);
        <<_:O/binary>> ->
            trim = S#decoder.state,
            {eof, S}
    end.

-file("/usr/local/lib/erlang/lib/eunit-2.2.7/include"
      "/eunit.hrl",
      1).

-file("src/lib/json.erl", 514).

obj_new() -> {struct, []}.

is_obj({struct, Props}) ->
    F = fun ({K, _}) when is_binary(K) -> true end,
    lists:all(F, Props).

obj_from_list(Props) ->
    Obj = {struct, Props},
    begin
        fun () ->
                case is_obj(Obj) of
                    true -> ok;
                    __V ->
                        erlang:error({assertion_failed,
                                      [{module, json},
                                       {line, 530},
                                       {expression, "is_obj ( Obj )"},
                                       {expected, true},
                                       {value,
                                        case __V of
                                            false -> __V;
                                            _ -> {not_a_boolean, __V}
                                        end}]})
                end
        end()
    end,
    Obj.

equiv({struct, Props1}, {struct, Props2}) ->
    equiv_object(Props1, Props2);
equiv(L1, L2) when is_list(L1), is_list(L2) ->
    equiv_list(L1, L2);
equiv(N1, N2) when is_number(N1), is_number(N2) ->
    N1 == N2;
equiv(B1, B2) when is_binary(B1), is_binary(B2) ->
    B1 == B2;
equiv(A, A)
    when A =:= true orelse A =:= false orelse A =:= null ->
    true.

equiv_object(Props1, Props2) ->
    L1 = lists:keysort(1, Props1),
    L2 = lists:keysort(1, Props2),
    Pairs = lists:zip(L1, L2),
    true = lists:all(fun ({{K1, V1}, {K2, V2}}) ->
                             equiv(K1, K2) and equiv(V1, V2)
                     end,
                     Pairs).

equiv_list([], []) -> true;
equiv_list([V1 | L1], [V2 | L2]) ->
    equiv(V1, V2) andalso equiv_list(L1, L2).

decode_test() ->
    [1.199344435545e+12, 1] =
        decode(<<"[1199344435545.0,1]">>),
    <<240, 157, 156, 149>> = decode([34,
                                     "\\ud835",
                                     "\\udf15",
                                     34]).

e2j_vec_test() -> test_one(e2j_test_vec(utf8), 1).

test_one([], _N) -> ok;
test_one([{E, J} | Rest], N) ->
    true = equiv(E, decode(J)),
    true = equiv(E, decode(encode(E))),
    test_one(Rest, 1 + N).

e2j_test_vec(utf8) ->
    [{1, "1"},
     {3.14159999999999994813, "3.14160"},
     {-1, "-1"},
     {-3.14159999999999994813, "-3.14160"},
     {1.2e+11, "1.20000e+11"},
     {1.234e+10, "1.23400e+10"},
     {-1.234e-10, "-1.23400e-10"},
     {1.0e+1, "1.0e+01"},
     {1.23456e+2, "1.23456E+2"},
     {1.0e+1, "1e1"},
     {<<"foo">>, "\"foo\""},
     {<<"foo", 5, "bar">>, "\"foo\\u0005bar\""},
     {<<"">>, "\"\""},
     {<<"\n\n\n">>, "\"\\n\\n\\n\""},
     {<<"\" \b\f\r\n\t\"">>, "\"\\\" \\b\\f\\r\\n\\t\\\"\""},
     {obj_new(), "{}"},
     {obj_from_list([{<<"foo">>, <<"bar">>}]),
      "{\"foo\":\"bar\"}"},
     {obj_from_list([{<<"foo">>, <<"bar">>},
                     {<<"baz">>, 123}]),
      "{\"foo\":\"bar\",\"baz\":123}"},
     {[], "[]"},
     {[[]], "[[]]"},
     {[1, <<"foo">>], "[1,\"foo\"]"},
     {obj_from_list([{<<"foo">>, [123]}]),
      "{\"foo\":[123]}"},
     {obj_from_list([{<<"foo">>,
                      obj_from_list([{<<"bar">>, true}])}]),
      "{\"foo\":{\"bar\":true}}"},
     {obj_from_list([{<<"foo">>, []},
                     {<<"bar">>, obj_from_list([{<<"baz">>, true}])},
                     {<<"alice">>, <<"bob">>}]),
      "{\"foo\":[],\"bar\":{\"baz\":true},\"alice\":\""
      "bob\"}"},
     {[-123,
       <<"foo">>,
       obj_from_list([{<<"bar">>, []}]),
       null],
      "[-123,\"foo\",{\"bar\":[]},null]"}].

encoder_utf8_test() ->
    [34,
     "\\u0001",
     "\\u0442",
     "\\u0435",
     "\\u0441",
     "\\u0442",
     34] =
        encode(<<1, "Ñ\202ÐµÑ\201Ñ\202">>),
    Enc = mochijson2:encoder([{utf8, true}]),
    [34,
     "\\u0001",
     [209, 130],
     [208, 181],
     [209, 129],
     [209, 130],
     34] =
        Enc(<<1, "Ñ\202ÐµÑ\201Ñ\202">>).

input_validation_test() ->
    Good = [{163, <<$", 194, 163, $">>},
            {8364, <<$", 226, 130, 172, $">>},
            {65942, <<$", 240, 144, 134, 150, $">>}],
    lists:foreach(fun ({CodePoint, UTF8}) ->
                          Expect = list_to_binary(xmerl_ucs:to_utf8(CodePoint)),
                          Expect = decode(UTF8)
                  end,
                  Good),
    Bad = [<<$", 128, $">>,
           <<$", 194, 127, $">>,
           <<$", 224, 128, 127, $">>,
           <<$", 240, 128, 128, 127, $">>,
           <<$", 245, 128, 128, 128, $">>],
    lists:foreach(fun (X) ->
                          ok = try decode(X) catch invalid_utf8 -> ok end,
                          {'EXIT', _} = (catch encode(X))
                  end,
                  Bad).

inline_json_test() ->
    begin
        fun (__X) ->
                case iolist_to_binary(encode({json,
                                              [<<"\"iodata">>, " iodata\""]}))
                    of
                    __X -> ok;
                    __V ->
                        erlang:error({assertEqual_failed,
                                      [{module, json},
                                       {line, 667},
                                       {expression,
                                        "iolist_to_binary ( encode ( { json , "
                                        "[ << \"\\\"iodata\" >> , \" iodata\\\"\" "
                                        "] } ) )"},
                                       {expected, __X},
                                       {value, __V}]})
                end
        end(<<"\"iodata iodata\"">>)
    end,
    begin
        fun (__X) ->
                case decode(encode({struct,
                                    [{key,
                                      {json, [<<"\"iodata">>, " iodata\""]}}]}))
                    of
                    __X -> ok;
                    __V ->
                        erlang:error({assertEqual_failed,
                                      [{module, json},
                                       {line, 671},
                                       {expression,
                                        "decode ( encode ( { struct , [ { key "
                                        ", { json , [ << \"\\\"iodata\" >> , "
                                        "\" iodata\\\"\" ] } } ] } ) )"},
                                       {expected, __X},
                                       {value, __V}]})
                end
        end({struct, [{<<"key">>, <<"iodata iodata">>}]})
    end,
    ok.

big_unicode_test() ->
    UTF8Seq = list_to_binary(xmerl_ucs:to_utf8(119072)),
    begin
        fun (__X) ->
                case iolist_to_binary(encode(UTF8Seq)) of
                    __X -> ok;
                    __V ->
                        erlang:error({assertEqual_failed,
                                      [{module, json},
                                       {line, 678},
                                       {expression,
                                        "iolist_to_binary ( encode ( UTF8Seq "
                                        ") )"},
                                       {expected, __X},
                                       {value, __V}]})
                end
        end(<<"\"\\ud834\\udd20\"">>)
    end,
    begin
        fun (__X) ->
                case decode(iolist_to_binary(encode(UTF8Seq))) of
                    __X -> ok;
                    __V ->
                        erlang:error({assertEqual_failed,
                                      [{module, json},
                                       {line, 681},
                                       {expression,
                                        "decode ( iolist_to_binary ( encode ( "
                                        "UTF8Seq ) ) )"},
                                       {expected, __X},
                                       {value, __V}]})
                end
        end(UTF8Seq)
    end,
    ok.

custom_decoder_test() ->
    begin
        fun (__X) ->
                case (decoder([]))("{\"key\": \"value\"}") of
                    __X -> ok;
                    __V ->
                        erlang:error({assertEqual_failed,
                                      [{module, json},
                                       {line, 687},
                                       {expression,
                                        "( decoder ( [ ] ) ) ( \"{\\\"key\\\": "
                                        "\\\"value\\\"}\" )"},
                                       {expected, __X},
                                       {value, __V}]})
                end
        end({struct, [{<<"key">>, <<"value">>}]})
    end,
    F = fun ({struct, [{<<"key">>, <<"value">>}]}) -> win
        end,
    begin
        fun (__X) ->
                case (decoder([{object_hook,
                                F}]))("{\"key\": \"value\"}")
                    of
                    __X -> ok;
                    __V ->
                        erlang:error({assertEqual_failed,
                                      [{module, json},
                                       {line, 691},
                                       {expression,
                                        "( decoder ( [ { object_hook , F } ] "
                                        ") ) ( \"{\\\"key\\\": \\\"value\\\"}\" )"},
                                       {expected, __X},
                                       {value, __V}]})
                end
        end(win)
    end,
    ok.

atom_test() ->
    [begin
         begin
             fun (__X) ->
                     case decode(atom_to_list(A)) of
                         __X -> ok;
                         __V ->
                             erlang:error({assertEqual_failed,
                                           [{module, json},
                                            {line, 697},
                                            {expression,
                                             "decode ( atom_to_list ( A ) )"},
                                            {expected, __X},
                                            {value, __V}]})
                     end
             end(A)
         end,
         begin
             fun (__X) ->
                     case iolist_to_binary(encode(A)) of
                         __X -> ok;
                         __V ->
                             erlang:error({assertEqual_failed,
                                           [{module, json},
                                            {line, 699},
                                            {expression,
                                             "iolist_to_binary ( encode ( A ) )"},
                                            {expected, __X},
                                            {value, __V}]})
                     end
             end(iolist_to_binary(atom_to_list(A)))
         end
     end
     || A <- [true, false, null]],
    begin
        fun (__X) ->
                case iolist_to_binary(encode(foo)) of
                    __X -> ok;
                    __V ->
                        erlang:error({assertEqual_failed,
                                      [{module, json},
                                       {line, 704},
                                       {expression,
                                        "iolist_to_binary ( encode ( foo ) )"},
                                       {expected, __X},
                                       {value, __V}]})
                end
        end(<<"\"foo\"">>)
    end,
    begin
        fun (__X) ->
                case
                    iolist_to_binary(encode(list_to_atom(xmerl_ucs:to_utf8(119072))))
                    of
                    __X -> ok;
                    __V ->
                        erlang:error({assertEqual_failed,
                                      [{module, json},
                                       {line, 707},
                                       {expression,
                                        "iolist_to_binary ( encode ( list_to_atom "
                                        "( xmerl_ucs : to_utf8 ( 119072 ) ) ) "
                                        ")"},
                                       {expected, __X},
                                       {value, __V}]})
                end
        end(<<"\"\\ud834\\udd20\"">>)
    end,
    ok.

key_encode_test() ->
    begin
        fun (__X) ->
                case iolist_to_binary(encode({struct, [{foo, 1}]})) of
                    __X -> ok;
                    __V ->
                        erlang:error({assertEqual_failed,
                                      [{module, json},
                                       {line, 715},
                                       {expression,
                                        "iolist_to_binary ( encode ( { struct "
                                        ", [ { foo , 1 } ] } ) )"},
                                       {expected, __X},
                                       {value, __V}]})
                end
        end(<<"{\"foo\":1}">>)
    end,
    begin
        fun (__X) ->
                case iolist_to_binary(encode({struct,
                                              [{<<"foo">>, 1}]}))
                    of
                    __X -> ok;
                    __V ->
                        erlang:error({assertEqual_failed,
                                      [{module, json},
                                       {line, 718},
                                       {expression,
                                        "iolist_to_binary ( encode ( { struct "
                                        ", [ { << \"foo\" >> , 1 } ] } ) )"},
                                       {expected, __X},
                                       {value, __V}]})
                end
        end(<<"{\"foo\":1}">>)
    end,
    begin
        fun (__X) ->
                case iolist_to_binary(encode({struct, [{"foo", 1}]})) of
                    __X -> ok;
                    __V ->
                        erlang:error({assertEqual_failed,
                                      [{module, json},
                                       {line, 721},
                                       {expression,
                                        "iolist_to_binary ( encode ( { struct "
                                        ", [ { \"foo\" , 1 } ] } ) )"},
                                       {expected, __X},
                                       {value, __V}]})
                end
        end(<<"{\"foo\":1}">>)
    end,
    begin
        fun (__X) ->
                case iolist_to_binary(encode({struct, [{[119072], 1}]}))
                    of
                    __X -> ok;
                    __V ->
                        erlang:error({assertEqual_failed,
                                      [{module, json},
                                       {line, 725},
                                       {expression,
                                        "iolist_to_binary ( encode ( { struct "
                                        ", [ { [ 119072 ] , 1 } ] } ) )"},
                                       {expected, __X},
                                       {value, __V}]})
                end
        end(<<"{\"\\ud834\\udd20\":1}">>)
    end,
    begin
        fun (__X) ->
                case iolist_to_binary(encode({struct, [{1, 1}]})) of
                    __X -> ok;
                    __V ->
                        erlang:error({assertEqual_failed,
                                      [{module, json},
                                       {line, 728},
                                       {expression,
                                        "iolist_to_binary ( encode ( { struct "
                                        ", [ { 1 , 1 } ] } ) )"},
                                       {expected, __X},
                                       {value, __V}]})
                end
        end(<<"{\"1\":1}">>)
    end,
    ok.

unsafe_chars_test() ->
    Chars = "\"\\\b\f\n\r\t",
    [begin
         begin
             fun (__X) ->
                     case json_string_is_safe([C]) of
                         __X -> ok;
                         __V ->
                             erlang:error({assertEqual_failed,
                                           [{module, json},
                                            {line, 734},
                                            {expression,
                                             "json_string_is_safe ( [ C ] )"},
                                            {expected, __X},
                                            {value, __V}]})
                     end
             end(false)
         end,
         begin
             fun (__X) ->
                     case json_bin_is_safe(<<C>>) of
                         __X -> ok;
                         __V ->
                             erlang:error({assertEqual_failed,
                                           [{module, json},
                                            {line, 735},
                                            {expression,
                                             "json_bin_is_safe ( << C >> )"},
                                            {expected, __X},
                                            {value, __V}]})
                     end
             end(false)
         end,
         begin
             fun (__X) ->
                     case decode(encode(<<C>>)) of
                         __X -> ok;
                         __V ->
                             erlang:error({assertEqual_failed,
                                           [{module, json},
                                            {line, 736},
                                            {expression,
                                             "decode ( encode ( << C >> ) )"},
                                            {expected, __X},
                                            {value, __V}]})
                     end
             end(<<C>>)
         end
     end
     || C <- Chars],
    begin
        fun (__X) ->
                case json_string_is_safe([119072]) of
                    __X -> ok;
                    __V ->
                        erlang:error({assertEqual_failed,
                                      [{module, json},
                                       {line, 740},
                                       {expression,
                                        "json_string_is_safe ( [ 119072 ] )"},
                                       {expected, __X},
                                       {value, __V}]})
                end
        end(false)
    end,
    begin
        fun (__X) ->
                case
                    json_bin_is_safe(list_to_binary(xmerl_ucs:to_utf8(119072)))
                    of
                    __X -> ok;
                    __V ->
                        erlang:error({assertEqual_failed,
                                      [{module, json},
                                       {line, 743},
                                       {expression,
                                        "json_bin_is_safe ( list_to_binary ( "
                                        "xmerl_ucs : to_utf8 ( 119072 ) ) )"},
                                       {expected, __X},
                                       {value, __V}]})
                end
        end(false)
    end,
    begin
        fun (__X) ->
                case
                    xmerl_ucs:from_utf8(binary_to_list(decode(encode(list_to_atom(xmerl_ucs:to_utf8(119072))))))
                    of
                    __X -> ok;
                    __V ->
                        erlang:error({assertEqual_failed,
                                      [{module, json},
                                       {line, 748},
                                       {expression,
                                        "xmerl_ucs : from_utf8 ( binary_to_list "
                                        "( decode ( encode ( list_to_atom ( xmerl_ucs "
                                        ": to_utf8 ( 119072 ) ) ) ) ) )"},
                                       {expected, __X},
                                       {value, __V}]})
                end
        end([119072])
    end,
    begin
        fun (__X) ->
                case json_string_is_safe([1114112]) of
                    __X -> ok;
                    __V ->
                        erlang:error({assertEqual_failed,
                                      [{module, json},
                                       {line, 751},
                                       {expression,
                                        "json_string_is_safe ( [ 1114112 ] )"},
                                       {expected, __X},
                                       {value, __V}]})
                end
        end(false)
    end,
    begin
        fun (__X) ->
                case
                    json_bin_is_safe(list_to_binary(xmerl_ucs:to_utf8([1114112])))
                    of
                    __X -> ok;
                    __V ->
                        erlang:error({assertEqual_failed,
                                      [{module, json},
                                       {line, 754},
                                       {expression,
                                        "json_bin_is_safe ( list_to_binary ( "
                                        "xmerl_ucs : to_utf8 ( [ 1114112 ] ) "
                                        ") )"},
                                       {expected, __X},
                                       {value, __V}]})
                end
        end(false)
    end,
    begin
        fun (__X) ->
                case decode(<<"\"\\/\"">>) of
                    __X -> ok;
                    __V ->
                        erlang:error({assertEqual_failed,
                                      [{module, json},
                                       {line, 758},
                                       {expression,
                                        "decode ( << \"\\\"\\\\/\\\"\" >> )"},
                                       {expected, __X},
                                       {value, __V}]})
                end
        end(<<"/">>)
    end,
    ok.

int_test() ->
    begin
        fun (__X) ->
                case decode("0") of
                    __X -> ok;
                    __V ->
                        erlang:error({assertEqual_failed,
                                      [{module, json},
                                       {line, 762},
                                       {expression, "decode ( \"0\" )"},
                                       {expected, __X},
                                       {value, __V}]})
                end
        end(0)
    end,
    begin
        fun (__X) ->
                case decode("1") of
                    __X -> ok;
                    __V ->
                        erlang:error({assertEqual_failed,
                                      [{module, json},
                                       {line, 763},
                                       {expression, "decode ( \"1\" )"},
                                       {expected, __X},
                                       {value, __V}]})
                end
        end(1)
    end,
    begin
        fun (__X) ->
                case decode("11") of
                    __X -> ok;
                    __V ->
                        erlang:error({assertEqual_failed,
                                      [{module, json},
                                       {line, 764},
                                       {expression, "decode ( \"11\" )"},
                                       {expected, __X},
                                       {value, __V}]})
                end
        end(11)
    end,
    ok.

float_fallback_test() ->
    begin
        fun (__X) ->
                case iolist_to_binary(encode(-2147483649)) of
                    __X -> ok;
                    __V ->
                        erlang:error({assertEqual_failed,
                                      [{module, json},
                                       {line, 768},
                                       {expression,
                                        "iolist_to_binary ( encode ( - 2147483649 "
                                        ") )"},
                                       {expected, __X},
                                       {value, __V}]})
                end
        end(<<"-2147483649.0">>)
    end,
    begin
        fun (__X) ->
                case iolist_to_binary(encode(2147483648)) of
                    __X -> ok;
                    __V ->
                        erlang:error({assertEqual_failed,
                                      [{module, json},
                                       {line, 769},
                                       {expression,
                                        "iolist_to_binary ( encode ( 2147483648 "
                                        ") )"},
                                       {expected, __X},
                                       {value, __V}]})
                end
        end(<<"2147483648.0">>)
    end,
    ok.

handler_test() ->
    begin
        fun (__X) ->
                case catch encode({}) of
                    __X -> ok;
                    __V ->
                        erlang:error({assertEqual_failed,
                                      [{module, json},
                                       {line, 775},
                                       {expression, "catch encode ( { } )"},
                                       {expected, __X},
                                       {value, __V}]})
                end
        end({'EXIT', {json_encode, {bad_term, {}}}})
    end,
    F = fun ({}) -> [] end,
    begin
        fun (__X) ->
                case iolist_to_binary((encoder([{handler, F}]))({})) of
                    __X -> ok;
                    __V ->
                        erlang:error({assertEqual_failed,
                                      [{module, json},
                                       {line, 779},
                                       {expression,
                                        "iolist_to_binary ( ( encoder ( [ { handler "
                                        ", F } ] ) ) ( { } ) )"},
                                       {expected, __X},
                                       {value, __V}]})
                end
        end(<<"[]">>)
    end,
    ok.


test() -> eunit:test(json).