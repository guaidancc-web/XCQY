-file("src/merge/merge_dets_ask.erl", 1).

-module(merge_dets_ask).

-export([do_init/1,
         do_convert/2,
         do_end/1,
         merge_ask/2]).

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

-file("src/merge/merge_dets_ask.erl", 14).

-file("inc/merge.hrl", 1).

-record(merge_table,
        {name = <<>>,
         table = <<>>,
         dao,
         server,
         next_key = 0,
         process = merge_main_proc,
         state,
         new_srv_id,
         old_srv_id}).

-record(merge_server,
        {platform = "",
         zone_id = 1,
         data_source,
         schema,
         target_schema,
         index = 0,
         size = 0}).

-record(merge_role_name,
        {key = {0, <<>>, 0},
         name = <<>>,
         lev = 0,
         exp = 0,
         data_source}).

-file("src/merge/merge_dets_ask.erl", 15).

-file("inc/ask.hrl", 1).

-record(ask_state,
        {next_ask_id = 1,
         free_ask_ids = [],
         five_reset_timer,
         platform = "",
         zone_id = 0}).

-record(ask_state_store,
        {ver = 1,
         label = store,
         next_ask_id = 1,
         free_ask_ids = []}).

-record(ask_question,
        {ver = 2,
         id = 0,
         sid = 0,
         qid = 0,
         fun_type = 0,
         start_time = 0,
         q_start_time = 0,
         opts = [],
         answer_list = [],
         agreed = [],
         all_correct = [],
         questions = [],
         answerers = [],
         ext_data = #{}}).

-record(ask_answer,
        {sid = 0,
         qid = 0,
         opts = [],
         result = 0,
         draw_list = [],
         ext_data = []}).

-record(ask_answerer,
        {rid, pid, label = 0, info = #{}, opts = []}).

-file("src/merge/merge_dets_ask.erl", 16).

do_init(Table = #merge_table{server =
                                 #merge_server{index = 1}}) ->
    StoreTabName = ask_state_tab,
    StoreDetsName = "ask_state.dets",
    StoreKeyPos = #ask_state_store.label,
    merge_util:dets_merge(StoreTabName,
                          StoreDetsName,
                          set,
                          StoreKeyPos,
                          undefined),
    {ok, [], Table};
do_init(Table = #merge_table{server =
                                 #merge_server{index = Size, size = Size}}) ->
    AskTabName = ask_tab,
    AskDetsName = "ask.dets",
    AskKeyPos = #ask_question.id,
    AskFunctions = {undefined,
                    fun merge_dets_ask:merge_ask/2,
                    undefined},
    merge_util:dets_merge(AskTabName,
                          AskDetsName,
                          set,
                          AskKeyPos,
                          AskFunctions),
    {ok, [], Table};
do_init(Table) -> {ok, [], Table}.

do_convert([], Table) -> {ok, Table}.

do_end(_Table) -> ignore.

merge_ask(Question = #ask_question{id = AskId},
          #merge_server{platform = Pltm, zone_id = ZoneId})
    when is_integer(AskId) ->
    NewAId = {Pltm, ZoneId, AskId},
    NewQuestion = Question#ask_question{id = NewAId},
    {ok, NewQuestion};
merge_ask(Question = #ask_question{}, _MergeServer) ->
    {ok, Question};
merge_ask(Unknow, _MergeServer) ->
    logger:error("未知的夫妻任务答题数据:~w",
                 [Unknow],
                 merge_dets_ask,
                 47),
    {false, "未知的夫妻任务答题数据"}.

