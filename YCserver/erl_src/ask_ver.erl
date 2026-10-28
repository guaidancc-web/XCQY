-file("src/mod/ask/ask_ver.erl", 1).

-module(ask_ver).

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

-file("src/mod/ask/ask_ver.erl", 12).

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

-file("src/mod/ask/ask_ver.erl", 13).

-spec do(tuple()) -> {false, bitstring()} |
                     {ok, #ask_question{}}.

do({ask_question,
    Ver = 1,
    Id,
    Sid,
    Qid,
    FunType,
    StartTime,
    QStartTime,
    Opts,
    AnswerList,
    Agreed,
    AllCorrect,
    Questions,
    Answerers,
    ExtData}) ->
    NewVer = Ver + 1,
    NewAskId = if is_integer(Id) ->
                      Pltm = case env:get(platform) of
                                 undefined -> "";
                                 TmpPltm -> TmpPltm
                             end,
                      ZoneId = case env:get(zone_id) of
                                   undefined -> 0;
                                   TmpZoneId -> TmpZoneId
                               end,
                      {Pltm, ZoneId, Id};
                  true -> Id
               end,
    NewAsk = {ask_question,
              NewVer,
              NewAskId,
              Sid,
              Qid,
              FunType,
              StartTime,
              QStartTime,
              Opts,
              AnswerList,
              Agreed,
              AllCorrect,
              Questions,
              Answerers,
              ExtData},
    do(NewAsk);
do(Ask = #ask_question{ver = 2}) -> {ok, Ask};
do(_) -> {false, lang:get("任务数据版本转换")}.

