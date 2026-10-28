-file("src/mod/quest/quest_couple_ver.erl", 1).

-module(quest_couple_ver).

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

-file("src/mod/quest/quest_couple_ver.erl", 12).

-file("inc/quest_couple.hrl", 1).

-record(quest_couple_state,
        {question_next_mid = 1,
         reset_timer,
         platform = "",
         zone_id = 0}).

-record(quest_couple_args,
        {quest_id = 0,
         type = 0,
         sec_type = 0,
         round = 0,
         partner_id,
         partner_pid,
         partner_name = "",
         robot_id,
         dyn_ext_data = [],
         rand_pos = []}).

-record(quest_couple_rand_data,
        {round = 0,
         quest_id = 0 :: pos_integer(),
         type = 0,
         sec_type = 0,
         weight :: undefined | non_neg_integer()}).

-record(quest_couple_question,
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

-record(quest_couple_answer,
        {sid = 0,
         qid = 0,
         opts = [],
         result = 0,
         draw_list = [],
         ext_data = []}).

-record(quest_couple_reward_data,
        {round = 0,
         exp_ratio = 0,
         coin_ratio = 0,
         pet_exp_ratio = 0,
         intimacy = 0,
         love = 0,
         rand_items = [],
         item_pcnt = 0}).

-file("src/mod/quest/quest_couple_ver.erl", 13).

-spec do(tuple()) -> {false, bitstring()} |
                     {ok, #quest_couple_question{}}.

do({quest_couple_question,
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
    NewAsk = {quest_couple_question,
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
do(Question = #quest_couple_question{ver = 1}) ->
    {ok, Question};
do(_) -> {false, lang:get("情缘任务数据版本转换")}.

