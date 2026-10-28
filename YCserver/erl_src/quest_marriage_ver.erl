-file("src/mod/quest/quest_marriage_ver.erl", 1).

-module(quest_marriage_ver).

-export([do/1]).

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

-file("src/mod/quest/quest_marriage_ver.erl", 12).

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

-file("src/mod/quest/quest_marriage_ver.erl", 13).

-spec do(tuple()) -> {false, bitstring()} |
                     {ok, #quest_marriage_question{}}.

do({quest_marriage_question,
    Mid,
    Sid,
    Qid,
    StartTime,
    MaleId,
    MalePid,
    MaleInfo,
    FemaleId,
    FemalePid,
    FemaleInfo,
    Opts,
    AnswerList,
    Agreed,
    Questions,
    ExtData}) ->
    NewVer = 1,
    NewMid = if is_integer(Mid) ->
                    Pltm = case env:get(platform) of
                               undefined -> "";
                               TmpPltm -> TmpPltm
                           end,
                    ZoneId = case env:get(zone_id) of
                                 undefined -> 0;
                                 TmpZoneId -> TmpZoneId
                             end,
                    {Pltm, ZoneId, Mid};
                true -> Mid
             end,
    NewAsk = {quest_marriage_question,
              NewMid,
              NewVer,
              Sid,
              Qid,
              StartTime,
              MaleId,
              MalePid,
              MaleInfo,
              FemaleId,
              FemalePid,
              FemaleInfo,
              Opts,
              AnswerList,
              Agreed,
              Questions,
              ExtData},
    do(NewAsk);
do(Question = #quest_marriage_question{ver = 1}) ->
    {ok, Question};
do(_) -> {false, lang:get("夫妻任务数据版本转换")}.

