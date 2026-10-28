-file("src/lib/protocol.erl", 1).

-module(protocol).

-export([byte/1,
         string/1,
         int8/1,
         uint8/1,
         int16/1,
         uint16/1,
         int32/1,
         uint32/1,
         float/1,
         array/2,
         read/2,
         read/3,
         read_fields/2,
         pack/2]).

-spec byte(binary()) -> {bitstring(), binary()}.

byte(<<L:32/little, Bin/binary>>) ->
    split_binary(Bin, L).

-spec string(binary()) -> {list(), binary()}.

string(<<L:16/little, Bin/binary>>) ->
    {BitString, Binary} = split_binary(Bin, L),
    {unicode:characters_to_list(BitString), Binary}.

-spec int8(binary()) -> {integer(), binary()}.

int8(<<N:8/signed-little, Bin/binary>>) -> {N, Bin}.

-spec uint8(binary()) -> {non_neg_integer(), binary()}.

uint8(<<N:8/little, Bin/binary>>) -> {N, Bin}.

-spec int16(binary()) -> {integer(), binary()}.

int16(<<N:16/signed-little, Bin/binary>>) -> {N, Bin}.

-spec uint16(binary()) -> {non_neg_integer(), binary()}.

uint16(<<N:16/little, Bin/binary>>) -> {N, Bin}.

-spec int32(binary()) -> {integer(), binary()}.

int32(<<N:32/signed-little, Bin/binary>>) -> {N, Bin}.

-spec uint32(binary()) -> {non_neg_integer(), binary()}.

uint32(<<N:32/little, Bin/binary>>) -> {N, Bin}.

-spec float(binary()) -> {float(), binary()}.

float(<<N:64/float-little, Bin/binary>>) -> {N, Bin}.

-spec array(binary(), function()) -> {[tuple()],
                                      binary()}.

array(<<N:16/little, Bin/binary>>, Fun) ->
    array(N, Bin, Fun, []).

array(0, Bin, _Fun, List) -> {List, Bin};
array(N, Bin, Fun, List) ->
    {R, B} = Fun(Bin),
    array(N - 1, B, Fun, [R | List]).

-spec read(Type, binary()) -> {integer() |
                               float() |
                               [tuple()],
                               binary()} when Type :: byte |
                                                      string |
                                                      int8 |
                                                      uint8 |
                                                      int16 |
                                                      uint16 |
                                                      int32 |
                                                      uint32 |
                                                      float.

read(byte, <<L:32/little, Bin/binary>>) ->
    split_binary(Bin, L);
read(string, <<L:16/little, Bin/binary>>) ->
    split_binary(Bin, L);
read(int8, <<N:8/signed-little, Bin/binary>>) ->
    {N, Bin};
read(uint8, <<N:8/little, Bin/binary>>) -> {N, Bin};
read(int16, <<N:16/signed-little, Bin/binary>>) ->
    {N, Bin};
read(uint16, <<N:16/little, Bin/binary>>) -> {N, Bin};
read(int32, <<N:32/signed-little, Bin/binary>>) ->
    {N, Bin};
read(uint32, <<N:32/little, Bin/binary>>) -> {N, Bin};
read(float, <<N:64/float-little, Bin/binary>>) ->
    {N, Bin}.

-spec read(array, binary(), function()) -> {term(),
                                            binary()}.

read(array, <<N:16/little, Bin/binary>>, Fun) ->
    array(N, Bin, Fun, []).

-spec read_fields([tuple()], binary()) -> {tuple(),
                                           binary()}.

read_fields(Fields, Bin) ->
    read_fields(Fields, Bin, []).

read_fields([], Bin, Rtn) ->
    {list_to_tuple(lists:reverse(Rtn)), Bin};
read_fields([{int8, _, _} | T],
            <<V:8/signed-little, Bin/binary>>, Rtn) ->
    read_fields(T, Bin, [V | Rtn]);
read_fields([{uint8, _, _} | T],
            <<V:8/little, Bin/binary>>, Rtn) ->
    read_fields(T, Bin, [V | Rtn]);
read_fields([{int16, _, _} | T],
            <<V:16/signed-little, Bin/binary>>, Rtn) ->
    read_fields(T, Bin, [V | Rtn]);
read_fields([{uint16, _, _} | T],
            <<V:16/little, Bin/binary>>, Rtn) ->
    read_fields(T, Bin, [V | Rtn]);
read_fields([{int32, _, _} | T],
            <<V:32/signed-little, Bin/binary>>, Rtn) ->
    read_fields(T, Bin, [V | Rtn]);
read_fields([{uint32, _, _} | T],
            <<V:32/little, Bin/binary>>, Rtn) ->
    read_fields(T, Bin, [V | Rtn]);
read_fields([{float, _, _} | T],
            <<V:64/float-little, Bin/binary>>, Rtn) ->
    read_fields(T, Bin, [V | Rtn]);
read_fields([{string, _, _} | T],
            <<Len:16/little, Bin/binary>>, Rtn) ->
    {V, B} = split_binary(Bin, Len),
    read_fields(T, B, [V | Rtn]);
read_fields([{byte, _, _} | T],
            <<Len:32/little, Bin/binary>>, Rtn) ->
    {V, B} = split_binary(Bin, Len),
    read_fields(T, B, [V | Rtn]);
read_fields([{array, _, _, Fields} | T],
            <<Len:16/little, Bin/binary>>, Rtn) ->
    {V, B} = read_array(Len, Bin, Fields, []),
    read_fields(T, B, [V | Rtn]).

read_array(0, Bin, _, Rtn) -> {lists:reverse(Rtn), Bin};
read_array(N, Bin, Fields, Rtn) ->
    {Val, B} = read_fields(Fields, Bin),
    read_array(N - 1, B, Fields, [Val | Rtn]).

pack(string, X) ->
    Bstr = unicode:characters_to_binary(X),
    Len = byte_size(Bstr),
    <<Len:16/little, Bstr/binary>>.

