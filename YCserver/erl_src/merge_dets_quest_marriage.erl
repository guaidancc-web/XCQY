-file("src/merge/merge_dets_quest_marriage.erl", 1).

-module(merge_dets_quest_marriage).

-export([do_init/1, do_convert/2, do_end/1, merge/2]).

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

-file("src/merge/merge_dets_quest_marriage.erl", 14).

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

-file("src/merge/merge_dets_quest_marriage.erl", 15).

-file("inc/quest_marriage.hrl", 1).

-record(quest_marriage_state,
        {question_next_mid = 1,
         reset_timer,
         platform = "",
         zone_id = 0}).

-record(quest_marriage_args,
        {quest_id = 0,
         type = 0,
         sec_type = 0,
         round = 0,
         lover_pid,
         robot_id,
         dyn_ext_data = [],
         rand_pos = []}).

-record(quest_marriage_rand_data,
        {round = 0,
         quest_id = 0 :: pos_integer(),
         type = 0,
         sec_type = 0,
         weight :: undefined | non_neg_integer()}).

-record(quest_marriage_question,
        {mid = 0,
         ver = 1,
         sid = 0,
         qid = 0,
         start_time = 0,
         male_id,
         male_pid,
         male_info = #{},
         female_id,
         female_pid,
         female_info = #{},
         opts = [],
         answer_list = [],
         agreed = [],
         questions = [],
         ext_data = #{}}).

-record(quest_marriage_answer,
        {sid = 0,
         qid = 0,
         opts = [],
         result = 0,
         draw_list = [],
         ext_data = []}).

-record(quest_marriage_reward_data,
        {round = 0,
         exp_ratio = 0,
         coin_ratio = 0,
         pet_exp_ratio = 0,
         intimacy = 0,
         love = 0,
         rand_items = []}).

-file("src/merge/merge_dets_quest_marriage.erl", 16).

do_init(Table = #merge_table{server =
                                 #merge_server{index = Size, size = Size}}) ->
    TabName = quest_marriage_question,
    DetsName = "quest_marriage_question.dets",
    KeyPos = #quest_marriage_question.mid,
    Functions = {undefined,
                 fun merge_dets_quest_marriage:merge/2,
                 undefined},
    merge_util:dets_merge(TabName,
                          DetsName,
                          set,
                          KeyPos,
                          Functions),
    {ok, [], Table};
do_init(Table) -> {ok, [], Table}.

do_convert([], Table) -> {ok, Table}.

do_end(_Table) -> ignore.

merge(Question = #quest_marriage_question{mid = Mid},
      #merge_server{platform = Pltm, zone_id = ZoneId})
    when is_integer(Mid) ->
    NewMid = {Pltm, ZoneId, Mid},
    NewQuestion = Question#quest_marriage_question{mid =
                                                       NewMid},
    {ok, NewQuestion};
merge(Question = #quest_marriage_question{},
      _MergeServer) ->
    {ok, Question};
merge(Unknow, _MergeServer) ->
    logger:error("未知的夫妻任务答题数据:~w",
                 [Unknow],
                 merge_dets_quest_marriage,
                 41),
    {false, "未知的夫妻任务答题数据"}.

