-file("src/mod/notice/notice_db.erl", 1).

-module(notice_db).

-export([load_boards/0, load_scroll/0]).

-file("inc/notice.hrl", 1).

-record(notice,
        {id = 1 :: pos_integer(),
         type = 0 :: non_neg_integer(),
         pos = 1 :: pos_integer(),
         start_time = 0 :: non_neg_integer(),
         end_time = 0 :: non_neg_integer(),
         msg = "" :: bitstring()}).

-record(notice_board,
        {id = 1,
         type = 1,
         start_time = 0,
         end_time = 0,
         title = "",
         content = "",
         msg = "",
         gain = [],
         condition = []}).

-record(notice_scroll,
        {id = 1,
         type = 1,
         start_time = 0,
         end_time = 0,
         interval_time = 0,
         content = ""}).

-record(notice_board_log, {id = 1, log_list = []}).

-record(campaign_notice,
        {title = [] :: list(),
         content = [] :: list(),
         process = [] :: list(),
         extern_content = [] :: list(),
         rewards = [] :: list()}).

-file("src/mod/notice/notice_db.erl", 15).

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

-file("src/mod/notice/notice_db.erl", 16).

-file("inc/item.hrl", 1).

-record(item_base,
        {id = 0 :: non_neg_integer(),
         name = "" :: list(),
         type = 0 :: non_neg_integer(),
         quality = 0 :: 0..4,
         overlap = 1 :: pos_integer(),
         look_id = 0 :: non_neg_integer(),
         use_type = 0 :: 0..4,
         expire_type = 0 :: non_neg_integer(),
         expire_time = 0 ::
             non_neg_integer() |
             {{pos_integer(), pos_integer(), pos_integer()},
              {non_neg_integer(),
               non_neg_integer(),
               non_neg_integer()}},
         attr = [] :: [tuple()],
         lev = 0,
         classes = 0,
         sex = 2,
         buy_source = [],
         condition = [] :: [tuple()],
         effect = [] :: [tuple()],
         alchemy = 0 :: non_neg_integer()}).

-record(item,
        {ver = 0 :: non_neg_integer(),
         id = 0 :: non_neg_integer(),
         base_id = 0 :: non_neg_integer(),
         bind = 1 :: 0 | 1,
         look_id = 0,
         type = 0 :: non_neg_integer(),
         use_type = 0 :: 0..4,
         quality = 0 :: 0..4,
         craft = 0 :: 0..5,
         enchant = -1 :: integer(),
         growth_lev = 0,
         growth_val = 0,
         step = 0 :: pos_integer(),
         quantity = 1 :: 0..250,
         pos = 0 :: non_neg_integer(),
         expire_type = 0 :: 0..4,
         expire_time = 0 :: non_neg_integer(),
         attr = [] :: [tuple()],
         reset_attr = [],
         lev = 1 :: pos_integer(),
         classes = 0 :: 0..6,
         sex = 2 :: 0..2,
         extra = [] :: [tuple()],
         data = [] :: [any()]}).

-record(item_extra_info, {source, price}).

-file("src/mod/notice/notice_db.erl", 17).

load_boards() ->
    Sql = "select id, type, start_time, end_time, "
          "title, content, msg, gain, cond from "
          "sys_notice_board where end_time > ? "
          "and (start_time + 86400 * 20) > ?",
    Now = date:unixtime(),
    case db:get_all(Sql, [Now, Now]) of
        {ok, Boards} -> convert_boards(Boards, Now);
        {error, _Why} ->
            logger:error("重载公告版内容失败，【Reason: ~s】",
                         [_Why],
                         notice_db,
                         25),
            []
    end.

load_scroll() ->
    Sql = "select id, type, start_time, end_time, "
          "interval_time, msg from sys_notice_scroll "
          "where end_time > ? and (start_time + "
          "86400 * 20) > ?",
    Now = date:unixtime(),
    case db:get_all(Sql, [Now, Now]) of
        {ok, Boards} -> convert_scroll(Boards, Now);
        {error, _Why} ->
            logger:error("重载滚动公告内容失败，【Reason: ~s】",
                         [_Why],
                         notice_db,
                         36),
            []
    end.

convert_boards(Boards, Now) ->
    convert_boards(Boards, Now, []).

convert_boards([], _Now, Boards) -> Boards;
convert_boards([[Id,
                 Type,
                 StartTime,
                 EndTime,
                 Title,
                 Content,
                 Msg,
                 Gain,
                 Condition]
                | T],
               Now, Boards)
    when EndTime > StartTime ->
    case EndTime > Now of
        true ->
            ToGain = case util:string_to_term(Gain) of
                         {ok, G} when is_list(G) ->
                             case check_gain(G) of
                                 true -> G;
                                 false -> []
                             end;
                         _ -> []
                     end,
            ToCondition = case util:string_to_term(Condition) of
                              {ok, C} when is_list(C) -> C;
                              _ -> []
                          end,
            NewTitle = case is_bitstring(Title) of
                           true -> Title;
                           false -> ""
                       end,
            NewContent = case is_bitstring(Content) of
                             true -> Content;
                             false -> ""
                         end,
            NewMsg = case is_bitstring(Msg) of
                         true -> Msg;
                         false -> ""
                     end,
            Notice = #notice_board{id = Id, type = Type,
                                   start_time = StartTime, end_time = EndTime,
                                   title = NewTitle, content = NewContent,
                                   msg = NewMsg, gain = ToGain,
                                   condition = ToCondition},
            convert_boards(T, Now, [Notice | Boards]);
        false -> convert_boards(T, Now, Boards)
    end;
convert_boards([_ | T], Now, Boards) ->
    convert_boards(T, Now, Boards).

convert_scroll(Boards, Now) ->
    convert_scroll(Boards, Now, []).

convert_scroll([], _Now, Boards) -> Boards;
convert_scroll([[Id,
                 Type,
                 StartTime,
                 EndTime,
                 IntervalTime,
                 Content]
                | T],
               Now, Boards)
    when EndTime > StartTime ->
    case EndTime > Now of
        true ->
            NewContent = case is_bitstring(Content) of
                             true -> Content;
                             false -> ""
                         end,
            Notice = #notice_scroll{id = Id, type = Type,
                                    start_time = StartTime, end_time = EndTime,
                                    interval_time = IntervalTime,
                                    content = NewContent},
            convert_scroll(T, Now, [Notice | Boards]);
        false -> convert_scroll(T, Now, Boards)
    end;
convert_scroll([_ | T], Now, Boards) ->
    convert_scroll(T, Now, Boards).

check_gain([]) -> true;
check_gain([{Name, Val} | _T]) when Val =< 0 ->
    logger:error("资产值为0, 无法发送, ID:~w",
                 [Name],
                 notice_db,
                 98),
    false;
check_gain([{Name, _Val} | T])
    when Name >= 90000 andalso Name =< 90100 ->
    check_gain(T);
check_gain([{Name, _Val} | T]) ->
    case item_data:get(Name) of
        #item_base{} -> check_gain(T);
        _ ->
            logger:error("不存在物品id:~w", [Name], notice_db, 106),
            false
    end;
check_gain([I | _T]) ->
    logger:error("格式错误, 无法发送, ID:~w", [I], notice_db, 110),
    false.

