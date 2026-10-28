-file("src/mod/teacher/teacher_ver.erl", 1).

-module(teacher_ver).

-export([do/1, convert_sign/2, convert_teacher/1]).

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

-file("src/mod/teacher/teacher_ver.erl", 16).

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

-file("src/mod/teacher/teacher_ver.erl", 17).

do({m_teacher,
    Id,
    Name,
    Status,
    Daily,
    DailyReward,
    DailyTime,
    Target,
    Evaluation,
    StudyLev,
    Mtime}) ->
    DailyGoals = [],
    GoalsTimes = 0,
    MTeacherVer = 1,
    do({m_teacher,
        Id,
        Name,
        Status,
        Daily,
        DailyReward,
        DailyTime,
        Target,
        Evaluation,
        StudyLev,
        Mtime,
        DailyGoals,
        GoalsTimes,
        MTeacherVer});
do({m_teacher,
    Id,
    Name,
    Status,
    Daily,
    DailyReward,
    DailyTime,
    Target,
    Evaluation,
    StudyLev,
    Mtime,
    DailyGoals,
    GoalsTimes,
    MTeacherVer}) ->
    NewMTeacherVer = MTeacherVer + 1,
    NewDaily = [{teacher_daily, DId, Finish, Progress}
                || {teacher_daily, DId, _Name, Finish, Progress}
                       <- Daily],
    {TargetReward, TargetRewarded, TargetOver, NewTarget} =
        filter_target(Target, [], [], [], []),
    do({m_teacher,
        Id,
        NewMTeacherVer,
        Name,
        Status,
        NewDaily,
        DailyReward,
        DailyTime,
        NewTarget,
        TargetReward,
        TargetRewarded,
        TargetOver,
        Evaluation,
        StudyLev,
        Mtime,
        DailyGoals,
        GoalsTimes});
do(Data = #m_teacher{ver = 2}) -> {ok, Data};
do(_Err) ->
    logger:error("角色师徒版本转换失败:~w", [_Err], teacher_ver, 32),
    {false, lang:get("角色师徒版本转换失败")}.

convert_sign(_Ver,
             {teacher_sign,
              ID,
              Name,
              Sex,
              Classes,
              Lev,
              Online,
              Login_time,
              Logout_time,
              Online_time,
              Is_sign}) ->
    Msg = "",
    convert_sign(1,
                 {teacher_sign,
                  ID,
                  1,
                  Name,
                  Sex,
                  Classes,
                  Lev,
                  Online,
                  Login_time,
                  Logout_time,
                  Online_time,
                  Is_sign,
                  Msg});
convert_sign(Ver, Data) ->
    case Ver =:= 1 andalso is_record(Data, teacher_sign) of
        false ->
            logger:info("Ver:~w, Data:~w",
                        [Ver, Data],
                        teacher_ver,
                        41),
            logger:error("师傅报名数据项不匹配, 转换失败", [], teacher_ver, 42),
            Data;
        true -> Data
    end.

convert_teacher({teacher,
                 Id,
                 Name,
                 Sex,
                 Classes,
                 Lev,
                 GuildId,
                 GuildName,
                 Msg,
                 TeacherScore,
                 TeacherScoreOffline,
                 LoginTime,
                 Fc,
                 Students}) ->
    Ver = 1,
    convert_teacher({teacher,
                     Id,
                     Ver,
                     Name,
                     Sex,
                     Classes,
                     Lev,
                     GuildId,
                     GuildName,
                     Msg,
                     TeacherScore,
                     TeacherScoreOffline,
                     LoginTime,
                     Fc,
                     Students});
convert_teacher(Data = #teacher{ver = 1}) ->
    parse_field([student], Data);
convert_teacher(Teacher) ->
    logger:error("师徒系统数据加载失败:~w",
                 [Teacher],
                 teacher_ver,
                 54),
    falsse.

parse_field([], Data) -> {true, Data};
parse_field([student | T],
            Data = #teacher{students = Students}) ->
    case convert_student(Students, []) of
        {true, NewStudents} ->
            NewData = Data#teacher{students = NewStudents},
            parse_field(T, NewData);
        _Err ->
            logger:error("师徒数据转化失败:~w", [_Err], teacher_ver, 64),
            false
    end.

convert_student([], Data) -> {true, Data};
convert_student([Stu | T], Data) ->
    case convert_student(Stu) of
        {true, NewStu} -> convert_student(T, [NewStu | Data]);
        _Err ->
            logger:error("师徒数据转化失败:~w", [Stu], teacher_ver, 74),
            false
    end.

convert_student({student,
                 Id,
                 Name,
                 Sex,
                 Classes,
                 Lev,
                 Status,
                 InTime,
                 OutTime,
                 LoginTime,
                 GuildId,
                 GuildName,
                 Daily,
                 DailyTime,
                 DailyReward,
                 QuestStudentReward,
                 QuestTeacherReward,
                 EncourageTime,
                 Target,
                 TeacherScore,
                 Fc,
                 TargetReward,
                 TargetRewarded}) ->
    Ver = 1,
    NewDaily = [{teacher_daily, DId, Finish, Progress}
                || {teacher_daily, DId, _Name, Finish, Progress}
                       <- Daily],
    NewTarget = filter_target(Target, []),
    convert_student({student,
                     Id,
                     Ver,
                     Name,
                     Sex,
                     Classes,
                     Lev,
                     Status,
                     InTime,
                     OutTime,
                     LoginTime,
                     GuildId,
                     GuildName,
                     NewDaily,
                     DailyTime,
                     DailyReward,
                     QuestStudentReward,
                     QuestTeacherReward,
                     EncourageTime,
                     NewTarget,
                     TeacherScore,
                     Fc,
                     TargetReward,
                     TargetRewarded});
convert_student({student,
                 Id,
                 Ver = 1,
                 Name,
                 Sex,
                 Classes,
                 Lev,
                 Status,
                 InTime,
                 OutTime,
                 LoginTime,
                 GuildId,
                 GuildName,
                 Daily,
                 DailyTime,
                 DailyReward,
                 QuestStudentReward,
                 QuestTeacherReward,
                 EncourageTime,
                 Target,
                 TeacherScore,
                 Fc,
                 TargetReward,
                 TargetRewarded}) ->
    Completed = TargetReward ++ TargetRewarded,
    NewTarget = [T
                 || T = #teacher_target{id = TargetId, finish = Finish}
                        <- Target,
                    not lists:member(TargetId, Completed), Finish =/= 3],
    NewVar = Ver + 1,
    convert_student({student,
                     Id,
                     NewVar,
                     Name,
                     Sex,
                     Classes,
                     Lev,
                     Status,
                     InTime,
                     OutTime,
                     LoginTime,
                     GuildId,
                     GuildName,
                     Daily,
                     DailyTime,
                     DailyReward,
                     QuestStudentReward,
                     QuestTeacherReward,
                     EncourageTime,
                     NewTarget,
                     TeacherScore,
                     Fc,
                     TargetReward,
                     TargetRewarded});
convert_student(Data = #student{ver = 2}) ->
    {true, Data};
convert_student(_Data) ->
    logger:error("转换数据出错:~w", [_Data], teacher_ver, 92),
    false.

filter_target([], TargetReward, TargetRewarded,
              TargetOver, Target) ->
    {TargetReward, TargetRewarded, TargetOver, Target};
filter_target([{teacher_target,
                Id,
                _Name,
                Finish,
                Progress}
               | T],
              TargetReward, TargetRewarded, TargetOver, Target) ->
    case Finish of
        1 ->
            filter_target(T,
                          [Id | TargetReward],
                          TargetRewarded,
                          TargetOver,
                          Target);
        2 ->
            filter_target(T,
                          TargetReward,
                          [Id | TargetRewarded],
                          TargetOver,
                          Target);
        3 ->
            filter_target(T,
                          TargetReward,
                          TargetRewarded,
                          [Id | TargetOver],
                          Target);
        _ ->
            filter_target(T,
                          TargetReward,
                          TargetRewarded,
                          TargetOver,
                          [{teacher_target, Id, Finish, Progress} | Target])
    end.

filter_target([], Target) -> Target;
filter_target([{teacher_target,
                Id,
                _Name,
                Finish,
                Progress}
               | T],
              Target) ->
    case Finish of
        1 -> filter_target(T, Target);
        2 -> filter_target(T, Target);
        _ ->
            filter_target(T,
                          [{teacher_target, Id, Finish, Progress} | Target])
    end.

