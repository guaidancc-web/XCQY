-file("src/lib/thrift/thrift_json_parser.erl", 1).

-module(thrift_json_parser).

-export([parser/0, handle_event/2]).

-record(config, {strict_utf8 = false :: boolean()}).

parser() ->
    fun (JSON) ->
            start(JSON, {thrift_json_parser, []}, [], #config{})
    end.

handle_event(Event, {Handler, State}, _Config) ->
    {Handler, Handler:handle_event(Event, State)}.

handle_event(end_json, State) ->
    lists:reverse([end_json] ++ State);
handle_event(Event, State) -> [Event] ++ State.

new_seq() -> [].

new_seq(C) -> [C].

acc_seq(Seq, C) when is_list(C) ->
    lists:reverse(C) ++ Seq;
acc_seq(Seq, C) -> [C] ++ Seq.

end_seq(Seq) ->
    unicode:characters_to_binary(lists:reverse(Seq)).

end_seq(Seq, _) -> end_seq(Seq).

start(<<239, 187, 191, Rest/binary>>, Handler, Stack,
      Config) ->
    value(Rest, Handler, Stack, Config);
start(Bin, Handler, Stack, Config) ->
    value(Bin, Handler, Stack, Config).

value(<<34, Rest/binary>>, Handler, Stack, Config) ->
    string(Rest, Handler, new_seq(), Stack, Config);
value(<<$t, Rest/binary>>, Handler, Stack, Config) ->
    true(Rest, Handler, Stack, Config);
value(<<$f, Rest/binary>>, Handler, Stack, Config) ->
    false(Rest, Handler, Stack, Config);
value(<<$n, Rest/binary>>, Handler, Stack, Config) ->
    null(Rest, Handler, Stack, Config);
value(<<45, Rest/binary>>, Handler, Stack, Config) ->
    negative(Rest, Handler, new_seq($-), Stack, Config);
value(<<48, Rest/binary>>, Handler, Stack, Config) ->
    zero(Rest, Handler, new_seq($0), Stack, Config);
value(<<S, Rest/binary>>, Handler, Stack, Config)
    when S >= $1 andalso S =< $9 ->
    integer(Rest, Handler, new_seq(S), Stack, Config);
value(<<123, Rest/binary>>, Handler, Stack, Config) ->
    object(Rest,
           handle_event(start_object, Handler, Config),
           [key | Stack],
           Config);
value(<<91, Rest/binary>>, Handler, Stack, Config) ->
    array(Rest,
          handle_event(start_array, Handler, Config),
          [array | Stack],
          Config);
value(<<S, Rest/binary>>, Handler, Stack, Config)
    when S =:= 32; S =:= 9; S =:= 13; S =:= 10 ->
    value(Rest, Handler, Stack, Config);
value(_Bin, _Handler, _Stack, _Config) ->
    erlang:error(badarg).

object(<<34, Rest/binary>>, Handler, Stack, Config) ->
    string(Rest, Handler, new_seq(), Stack, Config);
object(<<125, Rest/binary>>, Handler, [key | Stack],
       Config) ->
    maybe_done(Rest,
               handle_event(end_object, Handler, Config),
               Stack,
               Config);
object(<<S, Rest/binary>>, Handler, Stack, Config)
    when S =:= 32; S =:= 9; S =:= 13; S =:= 10 ->
    object(Rest, Handler, Stack, Config);
object(_Bin, _Handler, _Stack, _Config) ->
    erlang:error(badarg).

array(<<93, Rest/binary>>, Handler, [array | Stack],
      Config) ->
    maybe_done(Rest,
               handle_event(end_array, Handler, Config),
               Stack,
               Config);
array(<<S, Rest/binary>>, Handler, Stack, Config)
    when S =:= 32; S =:= 9; S =:= 13; S =:= 10 ->
    array(Rest, Handler, Stack, Config);
array(Bin, Handler, Stack, Config) ->
    value(Bin, Handler, Stack, Config).

colon(<<58, Rest/binary>>, Handler, [key | Stack],
      Config) ->
    value(Rest, Handler, [object | Stack], Config);
colon(<<S, Rest/binary>>, Handler, Stack, Config)
    when S =:= 32; S =:= 9; S =:= 13; S =:= 10 ->
    colon(Rest, Handler, Stack, Config);
colon(_Bin, _Handler, _Stack, _Config) ->
    erlang:error(badarg).

key(<<34, Rest/binary>>, Handler, Stack, Config) ->
    string(Rest, Handler, new_seq(), Stack, Config);
key(<<S, Rest/binary>>, Handler, Stack, Config)
    when S =:= 32; S =:= 9; S =:= 13; S =:= 10 ->
    key(Rest, Handler, Stack, Config);
key(_Bin, _Handler, _Stack, _Config) ->
    erlang:error(badarg).

string(<<34, Rest/binary>>, Handler, Acc, Stack,
       Config) ->
    doublequote(Rest, Handler, Acc, Stack, Config);
string(<<47, Rest/binary>>, Handler, Acc, Stack,
       Config) ->
    string(Rest, Handler, acc_seq(Acc, 47), Stack, Config);
string(<<92/utf8, Rest/binary>>, Handler, Acc, Stack,
       Config) ->
    unescape(Rest, Handler, Acc, Stack, Config);
string(<<X/utf8, Rest/binary>>, Handler, Acc, Stack,
       Config)
    when X >= 32, X < 8232 ->
    string(Rest, Handler, acc_seq(Acc, X), Stack, Config);
string(<<X/utf8, Rest/binary>>, Handler, Acc, Stack,
       Config)
    when X == 8232; X == 8233 ->
    string(Rest, Handler, acc_seq(Acc, X), Stack, Config);
string(<<X/utf8, Rest/binary>>, Handler, Acc, Stack,
       Config)
    when X > 8233, X < 55296 ->
    string(Rest, Handler, acc_seq(Acc, X), Stack, Config);
string(<<X/utf8, Rest/binary>>, Handler, Acc, Stack,
       Config)
    when X > 57343, X < 64976 ->
    string(Rest, Handler, acc_seq(Acc, X), Stack, Config);
string(<<X/utf8, Rest/binary>>, Handler, Acc, Stack,
       Config)
    when X > 65007, X < 65534 ->
    string(Rest, Handler, acc_seq(Acc, X), Stack, Config);
string(<<X/utf8, Rest/binary>>, Handler, Acc, Stack,
       Config)
    when X >= 65536, X < 131070 ->
    string(Rest, Handler, acc_seq(Acc, X), Stack, Config);
string(<<X/utf8, Rest/binary>>, Handler, Acc, Stack,
       Config)
    when X >= 131072, X < 196606 ->
    string(Rest, Handler, acc_seq(Acc, X), Stack, Config);
string(<<X/utf8, Rest/binary>>, Handler, Acc, Stack,
       Config)
    when X >= 196608, X < 262142 ->
    string(Rest, Handler, acc_seq(Acc, X), Stack, Config);
string(<<X/utf8, Rest/binary>>, Handler, Acc, Stack,
       Config)
    when X >= 262144, X < 327678 ->
    string(Rest, Handler, acc_seq(Acc, X), Stack, Config);
string(<<X/utf8, Rest/binary>>, Handler, Acc, Stack,
       Config)
    when X >= 327680, X < 393214 ->
    string(Rest, Handler, acc_seq(Acc, X), Stack, Config);
string(<<X/utf8, Rest/binary>>, Handler, Acc, Stack,
       Config)
    when X >= 393216, X < 458750 ->
    string(Rest, Handler, acc_seq(Acc, X), Stack, Config);
string(<<X/utf8, Rest/binary>>, Handler, Acc, Stack,
       Config)
    when X >= 458752, X < 524286 ->
    string(Rest, Handler, acc_seq(Acc, X), Stack, Config);
string(<<X/utf8, Rest/binary>>, Handler, Acc, Stack,
       Config)
    when X >= 524288, X < 589822 ->
    string(Rest, Handler, acc_seq(Acc, X), Stack, Config);
string(<<X/utf8, Rest/binary>>, Handler, Acc, Stack,
       Config)
    when X >= 589824, X < 655358 ->
    string(Rest, Handler, acc_seq(Acc, X), Stack, Config);
string(<<X/utf8, Rest/binary>>, Handler, Acc, Stack,
       Config)
    when X >= 655360, X < 720894 ->
    string(Rest, Handler, acc_seq(Acc, X), Stack, Config);
string(<<X/utf8, Rest/binary>>, Handler, Acc, Stack,
       Config)
    when X >= 720896, X < 786430 ->
    string(Rest, Handler, acc_seq(Acc, X), Stack, Config);
string(<<X/utf8, Rest/binary>>, Handler, Acc, Stack,
       Config)
    when X >= 786432, X < 851966 ->
    string(Rest, Handler, acc_seq(Acc, X), Stack, Config);
string(<<X/utf8, Rest/binary>>, Handler, Acc, Stack,
       Config)
    when X >= 851968, X < 917502 ->
    string(Rest, Handler, acc_seq(Acc, X), Stack, Config);
string(<<X/utf8, Rest/binary>>, Handler, Acc, Stack,
       Config)
    when X >= 917504, X < 983038 ->
    string(Rest, Handler, acc_seq(Acc, X), Stack, Config);
string(<<X/utf8, Rest/binary>>, Handler, Acc, Stack,
       Config)
    when X >= 983040, X < 1048574 ->
    string(Rest, Handler, acc_seq(Acc, X), Stack, Config);
string(<<X/utf8, Rest/binary>>, Handler, Acc, Stack,
       Config)
    when X >= 1048576, X < 1114110 ->
    string(Rest, Handler, acc_seq(Acc, X), Stack, Config);
string(<<237, X, _, Rest/binary>>, Handler, Acc, Stack,
       Config = #config{strict_utf8 = false})
    when X >= 160 ->
    string(Rest,
           Handler,
           acc_seq(Acc, 65533),
           Stack,
           Config);
string(<<_/utf8, Rest/binary>>, Handler, Acc, Stack,
       Config = #config{strict_utf8 = false}) ->
    string(Rest,
           Handler,
           acc_seq(Acc, 65533),
           Stack,
           Config);
string(<<239, 191, X, Rest/binary>>, Handler, Acc,
       Stack, Config = #config{strict_utf8 = false})
    when X == 190; X == 191 ->
    string(Rest,
           Handler,
           acc_seq(Acc, 65533),
           Stack,
           Config);
string(<<X, Rest/binary>>, Handler, Acc, Stack,
       Config = #config{strict_utf8 = false})
    when X >= 192, X =< 223 ->
    strip_continuations(Rest,
                        Handler,
                        Acc,
                        Stack,
                        Config,
                        1);
string(<<X, Rest/binary>>, Handler, Acc, Stack,
       Config = #config{strict_utf8 = false})
    when X >= 224, X =< 239 ->
    strip_continuations(Rest,
                        Handler,
                        Acc,
                        Stack,
                        Config,
                        2);
string(<<X, Rest/binary>>, Handler, Acc, Stack,
       Config = #config{strict_utf8 = false})
    when X >= 240, X =< 247 ->
    strip_continuations(Rest,
                        Handler,
                        Acc,
                        Stack,
                        Config,
                        3);
string(<<_, Rest/binary>>, Handler, Acc, Stack,
       Config = #config{strict_utf8 = false}) ->
    string(Rest,
           Handler,
           acc_seq(Acc, 65533),
           Stack,
           Config);
string(_Bin, _Handler, _Acc, _Stack, _Config) ->
    erlang:error(badarg).

doublequote(Rest, Handler, Acc, [key | _] = Stack,
            Config) ->
    colon(Rest,
          handle_event({key, end_seq(Acc, Config)},
                       Handler,
                       Config),
          Stack,
          Config);
doublequote(Rest, Handler, Acc, Stack, Config) ->
    maybe_done(Rest,
               handle_event({string, end_seq(Acc, Config)},
                            Handler,
                            Config),
               Stack,
               Config).

strip_continuations(<<Rest/binary>>, Handler, Acc,
                    Stack, Config, 0) ->
    string(Rest,
           Handler,
           acc_seq(Acc, 65533),
           Stack,
           Config);
strip_continuations(<<X, Rest/binary>>, Handler, Acc,
                    Stack, Config, N)
    when X >= 128, X =< 191 ->
    strip_continuations(Rest,
                        Handler,
                        Acc,
                        Stack,
                        Config,
                        N - 1);
strip_continuations(<<Rest/binary>>, Handler, Acc,
                    Stack, Config, _) ->
    string(Rest,
           Handler,
           acc_seq(Acc, 65533),
           Stack,
           Config).

unescape(<<$b, Rest/binary>>, Handler, Acc, Stack,
         Config) ->
    string(Rest, Handler, acc_seq(Acc, $\b), Stack, Config);
unescape(<<$f, Rest/binary>>, Handler, Acc, Stack,
         Config) ->
    string(Rest, Handler, acc_seq(Acc, $\f), Stack, Config);
unescape(<<$n, Rest/binary>>, Handler, Acc, Stack,
         Config) ->
    string(Rest, Handler, acc_seq(Acc, $\n), Stack, Config);
unescape(<<$r, Rest/binary>>, Handler, Acc, Stack,
         Config) ->
    string(Rest, Handler, acc_seq(Acc, $\r), Stack, Config);
unescape(<<$t, Rest/binary>>, Handler, Acc, Stack,
         Config) ->
    string(Rest, Handler, acc_seq(Acc, $\t), Stack, Config);
unescape(<<34, Rest/binary>>, Handler, Acc, Stack,
         Config) ->
    string(Rest, Handler, acc_seq(Acc, $"), Stack, Config);
unescape(<<92, Rest/binary>>, Handler, Acc, Stack,
         Config) ->
    string(Rest, Handler, acc_seq(Acc, $\\), Stack, Config);
unescape(<<47, Rest/binary>>, Handler, Acc, Stack,
         Config) ->
    string(Rest, Handler, acc_seq(Acc, $/), Stack, Config);
unescape(<<$u, $d, A, B, C, 92, $u, $d, X, Y, Z,
           Rest/binary>>,
         Handler, Acc, Stack, Config)
    when A == $8 orelse
             A == $9 orelse A == $a orelse A == $b,
         X == $c orelse X == $d orelse X == $e orelse X == $f,
         B >= $a andalso B =< $f orelse
             B >= $A andalso B =< $F orelse B >= $0 andalso B =< $9,
         C >= $a andalso C =< $f orelse
             C >= $A andalso C =< $F orelse C >= $0 andalso C =< $9,
         Y >= $a andalso Y =< $f orelse
             Y >= $A andalso Y =< $F orelse Y >= $0 andalso Y =< $9,
         Z >= $a andalso Z =< $f orelse
             Z >= $A andalso Z =< $F orelse
                 Z >= $0 andalso Z =< $9 ->
    High = erlang:list_to_integer([$d, A, B, C], 16),
    Low = erlang:list_to_integer([$d, X, Y, Z], 16),
    Codepoint = (High - 55296) * 1024 + (Low - 56320) +
                    65536,
    string(Rest,
           Handler,
           acc_seq(Acc, Codepoint),
           Stack,
           Config);
unescape(<<$u, $d, A, B, C, 92, $u, W, X, Y, Z,
           Rest/binary>>,
         Handler, Acc, Stack, Config)
    when A == $8 orelse
             A == $9 orelse A == $a orelse A == $b,
         B >= $a andalso B =< $f orelse
             B >= $A andalso B =< $F orelse B >= $0 andalso B =< $9,
         C >= $a andalso C =< $f orelse
             C >= $A andalso C =< $F orelse C >= $0 andalso C =< $9,
         W >= $a andalso W =< $f orelse
             W >= $A andalso W =< $F orelse W >= $0 andalso W =< $9,
         X >= $a andalso X =< $f orelse
             X >= $A andalso X =< $F orelse X >= $0 andalso X =< $9,
         Y >= $a andalso Y =< $f orelse
             Y >= $A andalso Y =< $F orelse Y >= $0 andalso Y =< $9,
         Z >= $a andalso Z =< $f orelse
             Z >= $A andalso Z =< $F orelse
                 Z >= $0 andalso Z =< $9 ->
    string(Rest,
           Handler,
           acc_seq(Acc, [65533, 65533]),
           Stack,
           Config);
unescape(<<$u, A, B, C, D, Rest/binary>>, Handler, Acc,
         Stack, Config)
    when A >= $a andalso A =< $f orelse
             A >= $A andalso A =< $F orelse A >= $0 andalso A =< $9,
         B >= $a andalso B =< $f orelse
             B >= $A andalso B =< $F orelse B >= $0 andalso B =< $9,
         C >= $a andalso C =< $f orelse
             C >= $A andalso C =< $F orelse C >= $0 andalso C =< $9,
         D >= $a andalso D =< $f orelse
             D >= $A andalso D =< $F orelse
                 D >= $0 andalso D =< $9 ->
    case erlang:list_to_integer([A, B, C, D], 16) of
        Codepoint when Codepoint < 55296; Codepoint > 57343 ->
            string(Rest,
                   Handler,
                   acc_seq(Acc, Codepoint),
                   Stack,
                   Config);
        _ ->
            string(Rest,
                   Handler,
                   acc_seq(Acc, 65533),
                   Stack,
                   Config)
    end;
unescape(_Bin, _Handler, _Acc, _Stack, _Config) ->
    erlang:error(badarg).

negative(<<$0, Rest/binary>>, Handler, Acc, Stack,
         Config) ->
    zero(Rest, Handler, acc_seq(Acc, $0), Stack, Config);
negative(<<S, Rest/binary>>, Handler, Acc, Stack,
         Config)
    when S >= $1 andalso S =< $9 ->
    integer(Rest, Handler, acc_seq(Acc, S), Stack, Config);
negative(_Bin, _Handler, _Acc, _Stack, _Config) ->
    erlang:error(badarg).

zero(<<46, Rest/binary>>, Handler, Acc, Stack,
     Config) ->
    decimal(Rest, Handler, acc_seq(Acc, 46), Stack, Config);
zero(<<S, Rest/binary>>, Handler, Acc, Stack, Config)
    when S =:= $e; S =:= $E ->
    e(Rest, Handler, acc_seq(Acc, ".0e"), Stack, Config);
zero(Bin, Handler, Acc, Stack, Config) ->
    finish_number(Bin, Handler, {zero, Acc}, Stack, Config).

integer(<<S, Rest/binary>>, Handler, Acc, Stack, Config)
    when S =:= 48; S >= $1 andalso S =< $9 ->
    integer(Rest, Handler, acc_seq(Acc, S), Stack, Config);
integer(<<46, Rest/binary>>, Handler, Acc, Stack,
        Config) ->
    initialdecimal(Rest,
                   Handler,
                   acc_seq(Acc, 46),
                   Stack,
                   Config);
integer(<<S, Rest/binary>>, Handler, Acc, Stack, Config)
    when S =:= $e; S =:= $E ->
    e(Rest, Handler, acc_seq(Acc, ".0e"), Stack, Config);
integer(Bin, Handler, Acc, Stack, Config) ->
    finish_number(Bin,
                  Handler,
                  {integer, Acc},
                  Stack,
                  Config).

initialdecimal(<<S, Rest/binary>>, Handler, Acc, Stack,
               Config)
    when S =:= 48; S >= $1 andalso S =< $9 ->
    decimal(Rest, Handler, acc_seq(Acc, S), Stack, Config);
initialdecimal(_Bin, _Handler, _Acc, _Stack, _Config) ->
    erlang:error(badarg).

decimal(<<S, Rest/binary>>, Handler, Acc, Stack, Config)
    when S =:= 48; S >= $1 andalso S =< $9 ->
    decimal(Rest, Handler, acc_seq(Acc, S), Stack, Config);
decimal(<<S, Rest/binary>>, Handler, Acc, Stack, Config)
    when S =:= $e; S =:= $E ->
    e(Rest, Handler, acc_seq(Acc, $e), Stack, Config);
decimal(Bin, Handler, Acc, Stack, Config) ->
    finish_number(Bin,
                  Handler,
                  {decimal, Acc},
                  Stack,
                  Config).

e(<<S, Rest/binary>>, Handler, Acc, Stack, Config)
    when S =:= 48; S >= $1 andalso S =< $9 ->
    exp(Rest, Handler, acc_seq(Acc, S), Stack, Config);
e(<<Sign, Rest/binary>>, Handler, Acc, Stack, Config)
    when Sign =:= 43; Sign =:= 45 ->
    ex(Rest, Handler, acc_seq(Acc, Sign), Stack, Config);
e(_Bin, _Handler, _Acc, _Stack, _Config) ->
    erlang:error(badarg).

ex(<<S, Rest/binary>>, Handler, Acc, Stack, Config)
    when S =:= 48; S >= $1 andalso S =< $9 ->
    exp(Rest, Handler, acc_seq(Acc, S), Stack, Config);
ex(_Bin, _Handler, _Acc, _Stack, _Config) ->
    erlang:error(badarg).

exp(<<S, Rest/binary>>, Handler, Acc, Stack, Config)
    when S =:= 48; S >= $1 andalso S =< $9 ->
    exp(Rest, Handler, acc_seq(Acc, S), Stack, Config);
exp(Bin, Handler, Acc, Stack, Config) ->
    finish_number(Bin, Handler, {exp, Acc}, Stack, Config).

finish_number(Rest, Handler, Acc, [], Config) ->
    maybe_done(Rest,
               handle_event(format_number(Acc), Handler, Config),
               [],
               Config);
finish_number(Rest, Handler, Acc, Stack, Config) ->
    maybe_done(Rest,
               handle_event(format_number(Acc), Handler, Config),
               Stack,
               Config).

format_number({zero, Acc}) ->
    {integer, list_to_integer(lists:reverse(Acc))};
format_number({integer, Acc}) ->
    {integer, list_to_integer(lists:reverse(Acc))};
format_number({decimal, Acc}) ->
    {float, list_to_float(lists:reverse(Acc))};
format_number({exp, Acc}) ->
    {float, list_to_float(lists:reverse(Acc))}.

true(<<$r, $u, $e, Rest/binary>>, Handler, Stack,
     Config) ->
    maybe_done(Rest,
               handle_event({literal, true}, Handler, Config),
               Stack,
               Config);
true(_Bin, _Handler, _Stack, _Config) ->
    erlang:error(badarg).

false(<<$a, $l, $s, $e, Rest/binary>>, Handler, Stack,
      Config) ->
    maybe_done(Rest,
               handle_event({literal, false}, Handler, Config),
               Stack,
               Config);
false(_Bin, _Handler, _Stack, _Config) ->
    erlang:error(badarg).

null(<<$u, $l, $l, Rest/binary>>, Handler, Stack,
     Config) ->
    maybe_done(Rest,
               handle_event({literal, null}, Handler, Config),
               Stack,
               Config);
null(_Bin, _Handler, _Stack, _Config) ->
    erlang:error(badarg).

maybe_done(<<Rest/binary>>, Handler, [], Config) ->
    done(Rest,
         handle_event(end_json, Handler, Config),
         [],
         Config);
maybe_done(<<125, Rest/binary>>, Handler,
           [object | Stack], Config) ->
    maybe_done(Rest,
               handle_event(end_object, Handler, Config),
               Stack,
               Config);
maybe_done(<<93, Rest/binary>>, Handler,
           [array | Stack], Config) ->
    maybe_done(Rest,
               handle_event(end_array, Handler, Config),
               Stack,
               Config);
maybe_done(<<44, Rest/binary>>, Handler,
           [object | Stack], Config) ->
    key(Rest, Handler, [key | Stack], Config);
maybe_done(<<44, Rest/binary>>, Handler,
           [array | _] = Stack, Config) ->
    value(Rest, Handler, Stack, Config);
maybe_done(<<S, Rest/binary>>, Handler, Stack, Config)
    when S =:= 32; S =:= 9; S =:= 13; S =:= 10 ->
    maybe_done(Rest, Handler, Stack, Config);
maybe_done(_Bin, _Handler, _Stack, _Config) ->
    erlang:error(badarg).

done(<<S, Rest/binary>>, Handler, [], Config)
    when S =:= 32; S =:= 9; S =:= 13; S =:= 10 ->
    done(Rest, Handler, [], Config);
done(<<>>, {_Handler, State}, [], _Config) -> State;
done(_Bin, _Handler, _Stack, _Config) ->
    erlang:error(badarg).

