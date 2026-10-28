-file("src/i18n.erl", 1).

-module(i18n).

-export([parse/0, gen_lang_erl/0]).

-file("inc/common.hrl", 1).

-type p() :: bitstring().

-type z() :: non_neg_integer().

-type role_id() :: {pos_integer(), p(), z()}.

-type unit_id() :: {pos_integer(), pos_integer()}.

-type pos() :: {pos_integer(),
                non_neg_integer(),
                non_neg_integer()}.

-record(center,
        {ready = 0 :: 1 | 0,
         pid :: undefined | pid(),
         node :: undefined | atom(),
         center_platform = "" :: list(),
         center_zone_id = 0 :: non_neg_integer(),
         platform = <<>> :: bitstring(),
         zone_id = 0 :: non_neg_integer(),
         combine = [] :: [{bitstring(), non_neg_integer()}]}).

-record(notice_rec,
        {type = 11, digit_attr = [], str_attr = []}).

-file("src/i18n.erl", 13).

-spec parse() -> ok.

parse() ->
    Dir = env:get(code_path),
    case os:type() of
        {win32, _} ->
            io:format("~ts",
                      [io_lib:format("> 正在扫描所有的erl文件~n", [])]);
        _ ->
            io:format("~ts",
                      [io_lib:format("> 正在扫描所有的erl文件~n", [])])
    end,
    case dev:file_list(Dir, ".erl") of
        {error, Reason} ->
            case os:type() of
                {win32, _} ->
                    io:format("~ts",
                              [io_lib:format("> 搜索erl文件时发生异常: ~w~n",
                                             [Reason])]);
                _ ->
                    io:format("~ts",
                              [io_lib:format("> 搜索erl文件时发生异常: ~w~n", [Reason])])
            end;
        {ok, L} ->
            Zh = scan(L, []),
            Tpl = util:template(Dir ++ "/tpl/lang.xml",
                                [{rows, to_xml(Zh, [])}]),
            Fcsv = Dir ++ "/lang/lang_template.xml",
            case file:write_file(Fcsv, Tpl) of
                ok ->
                    case os:type() of
                        {win32, _} ->
                            io:format("~ts",
                                      [io_lib:format("> 已生成lang_template.xml~n",
                                                     [])]);
                        _ ->
                            io:format("~ts",
                                      [io_lib:format("> 已生成lang_template.xml~n",
                                                     [])])
                    end;
                Ecsv ->
                    case os:type() of
                        {win32, _} ->
                            io:format("~ts",
                                      [io_lib:format("> 生成lang_template.xml时发生异常: ~w~n",
                                                     [Ecsv])]);
                        _ ->
                            io:format("~ts",
                                      [io_lib:format("> 生成lang_template.xml时发生异常: ~w~n",
                                                     [Ecsv])])
                    end
            end
    end.

-spec gen_lang_erl() -> ok.

gen_lang_erl() ->
    Dir = env:get(code_path),
    case os:type() of
        {win32, _} ->
            io:format("~ts",
                      [io_lib:format("> 正在分析lang.xml文件~n", [])]);
        _ ->
            io:format("~ts",
                      [io_lib:format("> 正在分析lang.xml文件~n", [])])
    end,
    {XmlElems, _} = xmerl_scan:file(Dir ++
                                        "/lang/lang.xml"),
    Rows = xmerl_xpath:string(lists:concat(["//Row"]),
                              XmlElems),
    Kv = lists:foldl(fun (R, L) ->
                             [K, V | _] = xmerl_xpath:string("//Data/text()",
                                                             R),
                             [{get_text(K), get_text(V)} | L]
                     end,
                     [],
                     Rows),
    case dev:file_list(Dir, ".erl") of
        {error, Reason} ->
            case os:type() of
                {win32, _} ->
                    io:format("~ts",
                              [io_lib:format("> 搜索erl文件时发生异常: ~w~n",
                                             [Reason])]);
                _ ->
                    io:format("~ts",
                              [io_lib:format("> 搜索erl文件时发生异常: ~w~n", [Reason])])
            end;
        {ok, L} ->
            case os:type() of
                {win32, _} ->
                    io:format("~ts",
                              [io_lib:format("> 正在扫描所有的erl源文件~n", [])]);
                _ ->
                    io:format("~ts",
                              [io_lib:format("> 正在扫描所有的erl源文件~n", [])])
            end,
            K = scan(L, []),
            case os:type() of
                {win32, _} ->
                    io:format("~ts", [io_lib:format("> 正在检查数据...~n", [])]);
                _ ->
                    io:format("~ts", [io_lib:format("> 正在检查数据...~n", [])])
            end,
            case os:type() of
                {win32, _} ->
                    io:format("~ts",
                              [io_lib:format("> 检查完毕，请留意下面的检查结果，输出为空表示无异常~n",
                                             [])]);
                _ ->
                    io:format("~ts",
                              [io_lib:format("> 检查完毕，请留意下面的检查结果，输出为空表示无异常~n",
                                             [])])
            end,
            Tpl = util:template(Dir ++ "/tpl/lang.erl",
                                [{get, to_fun(K, Kv, [])}]),
            File = Dir ++ "/lang/lang.erl",
            case file:write_file(File, Tpl) of
                ok ->
                    case os:type() of
                        {win32, _} ->
                            io:format("~ts",
                                      [io_lib:format("> 已生成lang.erl~n", [])]);
                        _ ->
                            io:format("~ts",
                                      [io_lib:format("> 已生成lang.erl~n", [])])
                    end;
                Err ->
                    case os:type() of
                        {win32, _} ->
                            io:format("~ts",
                                      [io_lib:format("> 生成lang.erl时发生异常: ~w~n",
                                                     [Err])]);
                        _ ->
                            io:format("~ts",
                                      [io_lib:format("> 生成lang.erl时发生异常: ~w~n",
                                                     [Err])])
                    end
            end
    end.

scan([], L) -> L;
scan([{_, F} | T], L) ->
    case file:read_file(F) of
        {error, Reason} ->
            case os:type() of
                {win32, _} ->
                    io:format("~ts",
                              [io_lib:format("> 扫描文件[~ts]时发生异常: ~w~n",
                                             [F, Reason])]);
                _ ->
                    io:format("~ts",
                              [io_lib:format("> 扫描文件[~ts]时发生异常: ~w~n",
                                             [F, Reason])])
            end;
        {ok, Text} ->
            case re:run(binary_to_list(Text),
                        "\\?T\\(<<\"(.*)\">>\\)",
                        [{capture, [1], list}, global, ungreedy])
                of
                nomatch -> scan(T, L);
                {match, V} -> scan(T, t(V, L))
            end
    end.

t([], L) -> L;
t([[S] | T], L) ->
    case lists:member(S, L) of
        true -> t(T, L);
        false -> t(T, [S | L])
    end.

get_text({xmlText, _, _, _, V, _}) ->
    strip(bitstring_to_list(unicode:characters_to_binary(V))).

strip(V) -> do_strip([$\n, $　], V).

do_strip([], V) -> string:strip(V, both);
do_strip([H | T], V) ->
    do_strip(T, string:strip(V, both, H)).

to_fun([], _Kv, L) -> lists:concat(L);
to_fun([K | T], Kv, L) ->
    case lists:keyfind(K, 1, Kv) of
        false ->
            case os:type() of
                {win32, _} ->
                    io:format("~ts",
                              [io_lib:format("> 此行找不到对应的翻译:~n~ts~n", [K])]);
                _ ->
                    io:format("~ts",
                              [io_lib:format("> 此行找不到对应的翻译:~n~ts~n", [K])])
            end,
            to_fun(T, Kv, L);
        {_, V} ->
            F = lists:concat(["get(<<\"",
                              K,
                              "\">>) -> <<\"",
                              V,
                              "\">>;\n"]),
            to_fun(T, Kv, [F | L])
    end.

to_xml([], L) -> lists:concat(L);
to_xml([H | T], L) ->
    F =
        io_lib:format("<Row><Cell><Data ss:Type='String'>~ts</Data><"
                      "/Cell><Cell><Data ss:Type='String'></Data></C"
                      "ell></Row>",
                      [H]),
    to_xml(T, [F | L]).

