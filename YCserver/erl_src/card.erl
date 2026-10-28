-file("src/mod/misc/card.erl", 1).

-module(card).

-export([make/3, read_file/1]).

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

-file("src/mod/misc/card.erl", 14).

make(Type, Num, CardLen) ->
    OldFiles = read_file(Type),
    {Year, Month, Day} = date(),
    {Hour, _, _} = time(),
    NowFile = util:flist("./card_~w_~w_~w~w_~w.csv",
                         [Type, Year, Month, Day, Hour]),
    Dict = dict:new(),
    Dict1 = load_old_data(OldFiles -- [NowFile], Dict),
    do_make(Type, Num, CardLen, Dict1, dict:new(), NowFile).

do_make(Type, 0, _CardLen, _OldDict, Dict, FileName) ->
    L = dict:fetch_keys(Dict),
    Str = string:join(L, "\r\n"),
    case file:write_file(FileName, Str) of
        ok ->
            case os:type() of
                {win32, _} ->
                    io:format("~ts",
                              [io_lib:format("> 已生成媒体卡文件: ~ts 类型:~w 数量:~w~n",
                                             [FileName,
                                              Type,
                                              dict:size(Dict)])]);
                _ ->
                    io:format("~ts",
                              [io_lib:format("> 已生成媒体卡文件: ~ts 类型:~w 数量:~w~n",
                                             [FileName,
                                              Type,
                                              dict:size(Dict)])])
            end;
        Err1 ->
            case os:type() of
                {win32, _} ->
                    io:format("~ts",
                              [io_lib:format("> 生成文件[~ts]时发生异常: ~w~n",
                                             [FileName, Err1])]);
                _ ->
                    io:format("~ts",
                              [io_lib:format("> 生成文件[~ts]时发生异常: ~w~n",
                                             [FileName, Err1])])
            end
    end,
    ok;
do_make(Type, Num, CardLen, OldDict, Dict, FileName) ->
    Now = date:unixtime(),
    RandVal = util:rand(1, 10000),
    Hash2 = util:md5(lists:concat(["fswy",
                                   Now,
                                   RandVal,
                                   Num])),
    Hash = lists:sublist(binary_to_list(Hash2), CardLen),
    {WordList, MathList} = lists:partition(fun (H) ->
                                                   H >= 97 andalso H =< 122
                                           end,
                                           Hash),
    case WordList of
        [] ->
            do_make(Type, Num, CardLen, OldDict, Dict, FileName);
        _ ->
            LastHash = WordList ++ MathList,
            case dict:find(LastHash, OldDict) of
                error ->
                    case dict:find(LastHash, Dict) of
                        error ->
                            do_make(Type,
                                    Num - 1,
                                    CardLen,
                                    OldDict,
                                    dict:store(LastHash, 1, Dict),
                                    FileName);
                        {ok, 1} ->
                            do_make(Type, Num, CardLen, OldDict, Dict, FileName)
                    end;
                {ok, 1} ->
                    logger:debug("发现重复的字符串:~w", [LastHash], card, 54),
                    do_make(Type, Num, CardLen, OldDict, Dict, FileName)
            end
    end.

read_file(Type) ->
    Fun = fun (F, AccIn) -> [filename:basename(F) | AccIn]
          end,
    FileList = filelib:fold_files(".",
                                  util:flist("card_~w_.*.csv", [Type]),
                                  true,
                                  Fun,
                                  []),
    FileList.

load_old_data([], Dict) -> Dict;
load_old_data([H | T], Dict) ->
    case readlines(H) of
        {ok, List} ->
            Fun = fun (Hash, NowDict) ->
                          dict:store(Hash, 1, NowDict)
                  end,
            Dict1 = lists:foldl(Fun, Dict, List),
            load_old_data(T, Dict1);
        {error, Err} ->
            logger:error("读取~w文件时发生错误~w", [H, Err], card, 74),
            load_old_data(T, Dict)
    end.

readlines(FileName) ->
    case file:open(FileName, [read]) of
        {error, Reason} -> {error, Reason};
        {ok, F} -> get_all_lines(F, [])
    end.

get_all_lines(F, L) ->
    case io:get_line(F, "") of
        {error, Reason} -> {error, Reason};
        eof -> {ok, lists:reverse(L)};
        Line -> get_all_lines(F, [lists:droplast(Line) | L])
    end.

