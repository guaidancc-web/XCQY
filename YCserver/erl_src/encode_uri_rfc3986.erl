-file("src/lib/encode_uri_rfc3986.erl", 1).

-module(encode_uri_rfc3986).

-author('Renato Albano <renatoalbano@gmail.com>').

-export([encode/1]).

encode([C | Cs]) when C >= $a, C =< $z ->
    [C | encode(Cs)];
encode([C | Cs]) when C >= $A, C =< $Z ->
    [C | encode(Cs)];
encode([C | Cs]) when C >= $0, C =< $9 ->
    [C | encode(Cs)];
encode([C | Cs]) when C == 32 -> [$+ | encode(Cs)];
encode([C = $- | Cs]) -> [C | encode(Cs)];
encode([C = $_ | Cs]) -> [C | encode(Cs)];
encode([C = 46 | Cs]) -> [C | encode(Cs)];
encode([C = $! | Cs]) -> [C | encode(Cs)];
encode([C = $~ | Cs]) -> [C | encode(Cs)];
encode([C = $* | Cs]) -> [C | encode(Cs)];
encode([C = 39 | Cs]) -> [C | encode(Cs)];
encode([C = $( | Cs]) -> [C | encode(Cs)];
encode([C = $) | Cs]) -> [C | encode(Cs)];
encode([C | Cs]) when C =< 127 ->
    escape_byte(C) ++ encode(Cs);
encode([C | Cs]) when (C >= 127) and (C =< 2047) ->
    escape_byte(C bsr 6 + 192) ++
        escape_byte(C band 63 + 128) ++ encode(Cs);
encode([C | Cs]) when C > 2047 ->
    escape_byte(C bsr 12 + 224) ++
        escape_byte(63 band (C bsr 6) + 128) ++
            escape_byte(C band 63 + 128) ++ encode(Cs);
encode([C | Cs]) -> escape_byte(C) ++ encode(Cs);
encode([]) -> [];
encode(Bin) when is_binary(Bin) ->
    encode(unicode:characters_to_list(Bin)).

hex_octet(N) when N =< 9 -> [$0 + N];
hex_octet(N) when N > 15 ->
    hex_octet(N bsr 4) ++ hex_octet(N band 15);
hex_octet(N) -> [N - 10 + $A].

escape_byte(C) ->
    H = hex_octet(C),
    normalize(H).

normalize(H) when length(H) == 1 -> "%0" ++ H;
normalize(H) -> "%" ++ H.

