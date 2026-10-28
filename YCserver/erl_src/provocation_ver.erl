-file("src/mod/provocation/provocation_ver.erl", 1).

-module(provocation_ver).

-export([do_profile/1, do/1]).

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

-file("src/mod/provocation/provocation_ver.erl", 14).

-file("inc/provocation.hrl", 1).

-record(m_provocation,
        {ver = 3,
         room_id = 0,
         book_id = 0,
         identity = 0,
         triggers = [],
         map_id = 0,
         room_check = 1,
         book_check = 0,
         video_check = 0,
         invited_list = [],
         published_list = [],
         pick_batch_list = [],
         pick_box_num = 0,
         pick_packet_num = 0}).

-record(provocation_room,
        {ver = 1,
         id = 0,
         pid = undefined :: pid(),
         name = [],
         room_lev_min = 0,
         min_lev_break = 0,
         room_lev_max = 200,
         max_lev_break = 1,
         master_fc = 0,
         mode = 1,
         password = [],
         status = 0,
         master_id = {0, "", 0},
         master_lev = 0,
         master_break = 0,
         master_name = [],
         master_sex = 0,
         master_class = 0,
         master_head = 0,
         customer_id = {0, "", 0},
         master_team_pid = undefined :: pid(),
         customer_team_pid = undefined :: pid(),
         last_vedio_id = {0, "", 0},
         provocation_type = 0,
         target_rival = {0, "", 0},
         target_name = [],
         make_horn_role = {0, "", 0},
         horn_name = [],
         horn_start_time = 0}).

-record(provocation_team,
        {ver = 1,
         team_formation = 0,
         team_formation_lev = 0,
         order = [],
         guards = [],
         team_mate = []}).

-record(provocation_fight_team,
        {leader_id = {0, "", 0}, fighters = []}).

-record(provocation_profile,
        {ver = 2,
         id = {0, "", 0},
         pid = undefined :: pid(),
         name = "",
         classes = 0,
         lev = 0,
         sex = 0,
         break_times = 0,
         fc = 0,
         looks = [] :: list(),
         head = 0,
         formation_id = 1 :: non_neg_integer(),
         formation_lev = 1 :: non_neg_integer(),
         guards = [],
         join_time = 0}).

-record(provocation_book,
        {ver = 1,
         id = 0,
         name = [],
         book_lev_min = 0,
         min_lev_break = 0,
         book_lev_max = 200,
         max_lev_break = 0,
         master_fc = 0,
         mode = 1,
         master_id = {0, "", 0},
         master_lev = 0,
         master_name = [],
         master_sex = 0,
         master_class = 0,
         master_head = 0,
         master_break = 0,
         live_status = 1,
         time_stamp = 0,
         provocation_type = 0}).

-record(provocation_fighter,
        {id = {0, "", 0} :: tuple(),
         name = "" :: string(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         kill_num = 0,
         dead_num = 0,
         total_heal = 0,
         control_num = 0,
         total_hurt = 0 :: non_neg_integer(),
         total_dmg = 0 :: non_neg_integer(),
         mvp_score = 0 :: non_neg_integer()}).

-record(provocation_result,
        {id = {0, "", 0},
         ver = 1,
         is_win = 1,
         mates = [],
         rival = [],
         match_id = 0,
         record_pz = {"", 0} :: tuple(),
         time = 0}).

-record(provocation_result_role,
        {id = {0, "", 0},
         ver = 1,
         recent = [],
         last_recent = []}).

-record(provocation_slices,
        {key = {0, 0}, role_list = []}).

-record(provocation_publish,
        {help_id = 0,
         msg_id = 0,
         record_id = 0,
         channel = 0,
         map_id = 0}).

-record(provocation_box,
        {map_id = 0,
         type = 0,
         batch_id = 0,
         time_stamp = 0,
         boxlist = []}).

-file("src/mod/provocation/provocation_ver.erl", 15).

do({m_provocation,
    Ver = 1,
    RoomId,
    BookId,
    Identity,
    Triggers,
    MapId,
    RoomCheck,
    BookCheck,
    VideoCheck,
    InvitedList}) ->
    PublishedList = [],
    do({m_provocation,
        Ver + 1,
        RoomId,
        BookId,
        Identity,
        Triggers,
        MapId,
        RoomCheck,
        BookCheck,
        VideoCheck,
        InvitedList,
        PublishedList});
do({m_provocation,
    Ver = 2,
    RoomId,
    BookId,
    Identity,
    Triggers,
    MapId,
    RoomCheck,
    BookCheck,
    VideoCheck,
    InvitedList,
    PublishedList}) ->
    PickBatchList = [],
    PickBoxNum = 0,
    PickPacketNum = 0,
    do({m_provocation,
        Ver + 1,
        RoomId,
        BookId,
        Identity,
        Triggers,
        MapId,
        RoomCheck,
        BookCheck,
        VideoCheck,
        InvitedList,
        PublishedList,
        PickBatchList,
        PickBoxNum,
        PickPacketNum});
do(Data = #m_provocation{ver = 3}) -> {ok, Data};
do(Data) ->
    logger:error("数据转换失败:~w", [Data], provocation_ver, 31),
    {false, lang:get("跨服约战数据转换失败")}.

do_profile(_D = {provocation_profile,
                 Ver = 1,
                 Id,
                 Pid,
                 Name,
                 Classes,
                 Lev,
                 Sex,
                 BKTimes,
                 Fc,
                 Looks,
                 Head,
                 FormationId,
                 FormationLev,
                 Guards}) ->
    JoinTime = 0,
    do_profile({provocation_profile,
                Ver + 1,
                Id,
                Pid,
                Name,
                Classes,
                Lev,
                Sex,
                BKTimes,
                Fc,
                Looks,
                Head,
                FormationId,
                FormationLev,
                Guards,
                JoinTime});
do_profile(Data = #provocation_profile{ver = 2}) ->
    {ok, Data};
do_profile(_D) ->
    logger:debug("数据版本 ~w", [_D], provocation_ver, 41),
    {false, lang:get("跨服约战版本转换失败")}.

