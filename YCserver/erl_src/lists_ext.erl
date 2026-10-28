-file("src/lib/algorithm/lists_ext.erl", 1).

-module(lists_ext).

-export([max/2,
         min/2,
         multikeyfind/2,
         multikeystore/3,
         forward/2]).

-spec max(Fun :: function(), L :: list()) -> term().

max(CmpFun, [H | L]) -> max(CmpFun, L, H).

max(_CmpFun, [], M) -> M;
max(CmpFun, [H | L], M) ->
    NM = case CmpFun(M, H) of
             true -> M;
             false -> H
         end,
    max(CmpFun, L, NM).

-spec min(Fun :: function(), L :: list()) -> term().

min(CmpFun, [H | L]) -> min(CmpFun, L, H).

min(_CmpFun, [], M) -> M;
min(CmpFun, [H | L], M) ->
    NM = case CmpFun(M, H) of
             true -> M;
             false -> H
         end,
    min(CmpFun, L, NM).

-spec multikeyfind(MultiKey :: tuple(),
                   TupleList :: list()) -> tuple() | false.

multikeyfind(_MultiKey, []) -> false;
multikeyfind(MultiKey, [H | L]) ->
    case match_muilt_key(MultiKey, H) of
        true -> H;
        false -> multikeyfind(MultiKey, L)
    end.

-spec multikeystore(MultiKey :: tuple(),
                    TupleList :: list(), AddData :: tuple()) -> list().

multikeystore(MultiKey, TupleList, AddData) ->
    multikeystore(MultiKey, TupleList, AddData, []).

multikeystore(_MultiKey, [], AddData,
              TupleResultList) ->
    [AddData | TupleResultList];
multikeystore(MultiKey, [H | L], AddData,
              TupleResultList) ->
    case match_muilt_key(MultiKey, H) of
        true ->
            R = lists:reverse(TupleResultList),
            R ++ [AddData] ++ L;
        false ->
            multikeystore(MultiKey,
                          L,
                          AddData,
                          [H | TupleResultList])
    end.

-spec forward(L :: list(), N :: integer()) -> list().

forward(L, N) -> forward(L, N, []).

forward([], _, List) -> List;
forward(_, N, List) when N =< 0 -> List;
forward([H | L], N, List) ->
    forward(L, N - 1, [H | List]).

match_muilt_key([], _) -> true;
match_muilt_key([{Key, Pos} | L], Data) ->
    case match_key(Key, Pos, Data) of
        true -> match_muilt_key(L, Data);
        false -> false
    end;
match_muilt_key([_ | L], Data) ->
    match_muilt_key(L, Data).

match_key(Key, Pos, Data)
    when is_integer(Pos) andalso
             tuple_size(Data) >= Pos andalso Pos >= 1 ->
    element(Pos, Data) =:= Key;
match_key(_, _, _) -> false.

