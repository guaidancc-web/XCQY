-file("src/lib/ptester.erl", 1).

-module(ptester).

-compile(export_all).

-spec run(Times, TestSpec) -> ok when Times ::
                                          pos_integer(),
                                      TestSpec :: [{Title, Fun}],
                                      Title :: string(), Fun :: function().

run(N, List) ->
    [[L, T1, T2] = H | T] = [timer(Label, F, N)
                             || {Label, F} <- List],
    io:format("============================================="
              "===========================~n"),
    io:format("~-20ts = ~9.2fms [~8.2f%] ~9.2fms [~8.2f%]~n",
              [L, T1 + 0.0, 1.0e+2, T2 + 0.0, 1.0e+2]),
    compare(T, H),
    io:format("============================================="
              "===========================~n").

-spec timer(string(), function(),
            pos_integer()) -> list().

timer(Label, F, N) ->
    statistics(runtime),
    statistics(wall_clock),
    for(1, N, F),
    {_, Time1} = statistics(runtime),
    {_, Time2} = statistics(wall_clock),
    U1 = Time1 * 1000 / N,
    U2 = Time2 * 1000 / N,
    io:format("~p [total: ~p(~p)ms avg: ~.3f(~.3f)us]~n",
              [Label, Time1, Time2, U1, U2]),
    [Label, Time1, Time2].

-spec ptimer(string(), pos_integer(),
             function()) -> list().

ptimer(Label, N, F) ->
    T = get_us(),
    for(1, N, F),
    DT = get_us() - T,
    U = DT * 1000 / N,
    io:format("~p [total: ~.2fms avg: ~.2fus]~n",
              [Label, DT + 0.0, U + 0.0]),
    [Label, DT].

-spec rand(pos_integer(),
           pos_integer()) -> pos_integer().

rand(Min, Max) ->
    case get("rand_seed") of
        undefined ->
            RandSeed = erlang:now(),
            random:seed(RandSeed),
            put("rand_seed", RandSeed);
        _ -> skip
    end,
    M = Min - 1,
    random:uniform(Max - M) + M.

compare([], _) -> ok;
compare([[L, T1, T2] | T], [_, TB1, TB2] = TB) ->
    io:format("~20ts = ~9.2fms [~8.2f%] ~9.2fms [~8.2f%]~n",
              [L,
               T1 + 0.0,
               T1 / (TB1 + 1.0e-8) * 100,
               T2 + 0.0,
               T2 / (TB2 + 1.0e-8) * 100]),
    compare(T, TB).

for(Max, Max, F) -> F(Max);
for(I, Max, F) ->
    F(I),
    for(I + 1, Max, F).

get_us() ->
    {M, S, U} = erlang:now(),
    M * 1000000000 + S * 1000 + U / 1000.

