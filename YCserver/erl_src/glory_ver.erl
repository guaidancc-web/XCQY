-file("src/mod/glory/glory_ver.erl", 1).

-module(glory_ver).

-export([do/1, do/2]).

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

-file("src/mod/glory/glory_ver.erl", 14).

-file("inc/glory.hrl", 1).

-record(m_glory,
        {ver = 2,
         id = 0,
         title_id = 0,
         end_time = 0,
         new_id = 0,
         new_title_id = 0,
         switch_time = 0,
         max_id = 0,
         mtime = 0,
         reset_time = 0,
         last_week = 0,
         reward_list = [],
         day_reward = 0,
         lost_times = 0}).

-record(glory_role,
        {id = {0, "", 0},
         classes = 0,
         name = "",
         sex = 0,
         lev = 0,
         new_id = 0,
         max_id = 0,
         new_title_id = 0,
         mtime = 0,
         reset_time = 0,
         last_week = 0,
         update_time = 0,
         day_reward = 0}).

-record(glory_floor,
        {floor = 0,
         ver = 0,
         first = [],
         role_list = [],
         max_list = [],
         record_list = [],
         num = 0}).

-record(glory_rank_data,
        {min = 0, max = 0, reward = []}).

-record(glory_open_rank_data,
        {min = 0,
         max = 0,
         open = 0,
         reward = [],
         title = "",
         content = "",
         honor_id = 0}).

-record(glory_lev_data,
        {id = 0,
         name = "",
         title_id = 0,
         need_title_id = 0,
         need_lev = 0,
         need_fc = 0,
         fc_del = 0,
         fc_add = 0,
         lev_break = 0,
         unit_id = 0,
         all_point = 0,
         guard_num = 0,
         skill_prac = [],
         skill_prac_lev = [],
         first_reward = [],
         first_exp_mod = 0,
         normal_reward = [],
         normal_exp_mod = 0,
         day_reward = [],
         day_exp_mod = 0,
         buff_num = 0,
         buff_id = 0}).

-record(glory_title_data,
        {title_id = 0,
         next_title_id = 0,
         title_name = "",
         honor_id = 0,
         rate = 0}).

-file("src/mod/glory/glory_ver.erl", 15).

do({m_glory, Ver = 1, Id, TitleId, EndTime}) ->
    NewId = case glory_data:get_switch(Id) of
                IId when is_integer(IId) -> IId;
                _ when Id == 0 -> 0;
                _ ->
                    logger:error("该关卡没有转换~w", [Id], glory_ver, 22),
                    0
            end,
    NewTitleId = case glory_data:get_level(NewId) of
                     #glory_lev_data{title_id = TTitleId} -> TTitleId;
                     _ when NewId == 0 -> 0;
                     _ ->
                         logger:error("该关卡没有爵位~w", [NewId], glory_ver, 31),
                         0
                 end,
    SwitchTime = case NewId of
                     0 -> 0;
                     _ -> date:unixtime()
                 end,
    do({m_glory,
        Ver + 1,
        Id,
        TitleId,
        EndTime,
        NewId,
        NewTitleId,
        SwitchTime,
        NewId,
        0,
        0,
        0,
        [],
        0,
        0});
do(Data = #m_glory{ver = 2}) -> {ok, Data};
do(Data) ->
    logger:error("爵位转化出错:~w", [Data], glory_ver, 44),
    {false, lang:get("爵位转化出错")}.

do(Label = floor,
   {glory_floor,
    Floor,
    First,
    RoleList,
    MaxList,
    RecordList}) ->
    do(Label,
       {glory_floor,
        Floor,
        0,
        First,
        RoleList,
        MaxList,
        RecordList,
        0});
do(floor, Data = #glory_floor{ver = 0}) -> {ok, Data};
do(Label, Data) ->
    logger:error("爵位转化出错:~w",
                 [{Label, Data}],
                 glory_ver,
                 53),
    {false, lang:get("爵位转化出错")}.

