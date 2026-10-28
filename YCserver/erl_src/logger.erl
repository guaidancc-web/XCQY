-file("src/lib/logger.erl", 1).

-module(logger).

-export([info/1,
         info/2,
         info/4,
         debug/1,
         debug/2,
         debug/4,
         error/1,
         error/2,
         error/4,
         err_log/1,
         err_log/2,
         err_log/4]).

info(Msg) -> info(Msg, []).

info(Format, Args) -> info(Format, Args, null, 0).

info(Format, Args, Mod, Line) ->
    Msg = format("info", Format, Args, Mod, Line),
    io:format("~ts", [Msg]).

debug(Msg) -> debug(Msg, []).

debug(Format, Args) -> debug(Format, Args, null, 0).

debug(Format, Args, Mod, Line) ->
    Msg = case Line of
              null ->
                  io_lib:format(lists:concat(["## debug ", Format, "~n"]),
                                Args);
              _ ->
                  io_lib:format(lists:concat(["## debug [~w:~w] ",
                                              Format,
                                              "~n"]),
                                [Mod, Line] ++ Args)
          end,
    io:format("~ts", [Msg]).

-spec error(iodata()) -> ok.

error(Msg) -> logger:error(Msg, []).

-spec error(iodata(), list()) -> ok.

error(Format, Args) ->
    logger:error(Format, Args, null, 0).

-spec error(iodata(), list(), atom(),
            non_neg_integer()) -> ok.

error(Format, Args, Mod, Line) ->
    Msg = format("error", Format, Args, Mod, Line),
    io:format("~ts", [Msg]).

-spec err_log(iodata()) -> ok.

err_log(Msg) -> err_log(Msg, []).

-spec err_log(iodata(), list()) -> ok.

err_log(Format, Args) -> err_log(Format, Args, null, 0).

-spec err_log(iodata(), list(), atom(),
              non_neg_integer()) -> ok.

err_log(Format, Args, Mod, Line) ->
    Msg = format("elog", Format, Args, Mod, Line),
    io:format("~ts", [Msg]),
    log(Msg).

-spec format(string(), iodata(), list(), atom(),
             non_neg_integer()) -> iodata().

format(T, F, A, Mod, Line) ->
    {{Y, M, D}, {H, I, S}} = erlang:localtime(),
    Date = lists:concat([Y,
                         "/",
                         M,
                         "/",
                         D,
                         " ",
                         H,
                         ":",
                         I,
                         ":",
                         S]),
    case Line > 0 of
        false ->
            io_lib:format(lists:concat(["## ",
                                        T,
                                        " ~ts ",
                                        F,
                                        "~n"]),
                          [Date] ++ A);
        true ->
            io_lib:format(lists:concat(["## ",
                                        T,
                                        " ~ts[~w:~w] ",
                                        F,
                                        "~n"]),
                          [Date, Mod, Line] ++ A)
    end.

-spec log(iodata()) -> ok.

log(Msg) ->
    db:exec("insert into log_error (msg) values(?)", [Msg]),
    ok.

