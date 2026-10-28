-file("src/merge/merge_dets_teacher.erl", 1).

-module(merge_dets_teacher).

-export([do_init/1, do_convert/2, do_end/1]).

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

-file("src/merge/merge_dets_teacher.erl", 13).

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

-file("src/merge/merge_dets_teacher.erl", 14).

-file("inc/teacher.hrl", 1).

-record(m_teacher,
        {id = {0, "", 0},
         ver = 2,
         name = "",
         status = 0,
         daily = [],
         daily_reward = 0,
         daily_time = 0,
         target = [],
         target_reward = [],
         target_rewarded = [],
         target_over = [],
         evaluation = [],
         study_lev = 0,
         mtime = 0,
         daily_goals = [],
         goals_times = 0}).

-record(teacher,
        {id = {0, "", 0},
         ver = 1,
         name = "",
         sex = 0,
         classes = 0,
         lev = 0,
         guild_id = {0, "", 0},
         guild_name = "",
         msg = "",
         teacher_score = 0,
         teacher_score_offline = 0,
         login_time = 0,
         fc = 0,
         students = []}).

-record(student,
        {id = {0, "", 0},
         ver = 2,
         name = "",
         sex = 0,
         classes = 0,
         lev = 0,
         status = 0,
         in_time = 0,
         out_time = 0,
         login_time = 0,
         guild_id = {0, "", 0},
         guild_name = "",
         daily = [],
         daily_time = 0,
         daily_reward = 0,
         quest_student_reward = 0,
         quest_teacher_reward = 0,
         encourage_time = 0,
         target = [],
         teacher_score = 0,
         fc = 0,
         target_reward = [],
         target_rewarded = []}).

-record(teacher_daily,
        {id = 1 :: pos_integer(),
         finish = 0 :: 0..2,
         progress = [] :: [tuple()]}).

-record(teacher_daily_data,
        {id = 1 :: pos_integer(),
         name = "" :: binary(),
         progress = [] :: [tuple()],
         reward = [],
         exp = 0}).

-record(teacher_target,
        {id = 1 :: pos_integer(),
         finish = 0 :: 0..2,
         progress = [] :: [tuple()]}).

-record(teacher_target_data,
        {id = 1 :: pos_integer(),
         name = "" :: binary(),
         progress = [] :: [tuple()],
         student_reward = [],
         teacher_reward = [],
         student_exp = 0,
         teacher_exp = 0}).

-record(teacher_sign,
        {id = {0, "", 0},
         ver = 1,
         name = "",
         sex = 0,
         classes = 0,
         lev = 0,
         online = 0,
         login_time = 0,
         logout_time = 0,
         online_time = 0,
         is_sign = 0,
         msg = ""}).

-record(teacher_quit_desc_data,
        {min = 0, max = 0, radio = 0, title = "", msg = ""}).

-record(teacher_student_sign_info,
        {id = {0, "", 0},
         name = "",
         sex = 0,
         classes = 0,
         lev = 0,
         msg = ""}).

-file("src/merge/merge_dets_teacher.erl", 15).

do_init(Table = #merge_table{server =
                                 #merge_server{index = Size, size = Size}}) ->
    merge_util:dets_merge(teacher,
                          "teacher.dets",
                          set,
                          #teacher.id,
                          undefined),
    merge_util:dets_merge(teacher_sign,
                          "teacher_sign.dets",
                          set,
                          #teacher_sign.id,
                          undefined),
    {ok, [], Table};
do_init(Table) -> {ok, [], Table}.

do_convert([], Table) -> {ok, Table}.

do_end(_Table) -> ignore.

