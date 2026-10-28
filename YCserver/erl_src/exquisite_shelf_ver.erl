-file("src/mod/exquisite_shelf/exquisite_shelf_ver.erl",
      1).

-module(exquisite_shelf_ver).

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

-file("src/mod/exquisite_shelf/exquisite_shelf_ver.erl",
      4).

-file("inc/exquisite_shelf.hrl", 1).

-record(m_exquisite_shelf,
        {ver = 2,
         wave = 0,
         shelf_id = 0,
         shelf_pid,
         pos_wave = 0,
         card_info = [],
         help_times = 0,
         is_get_help = 0}).

-record(exquisite_shelf_util,
        {id = 0,
         cross_type = 0,
         pid = 0,
         battle_id = 0,
         wave_info = [],
         wave = 1,
         lev = 1,
         challenges = [],
         create_time = 0}).

-record(exquisite_shelf_wave_info,
        {wave = 0,
         map_base_id = 0,
         map_id = 0,
         map_pid,
         units = [],
         status = 0}).

-record(exquisite_shelf_card_info,
        {wave = 1,
         shelf_lev = 1,
         type = 2,
         normal_card = [],
         gold_card = []}).

-record(exquisite_shelf_card_item,
        {index = 1,
         item_id = 0,
         num = 0,
         is_get = 0,
         is_notice = 0,
         is_show = 0}).

-record(exquisite_shelf_fast_combat_record,
        {shelf_wave = {0, 0},
         use_time = 0,
         record_id = {0, {0, "", 0}}}).

-file("src/mod/exquisite_shelf/exquisite_shelf_ver.erl",
      5).

-export([do/1]).

do({m_exquisite_shelf,
    Ver = 1,
    Wave,
    ShelfId,
    ShelfPid,
    PosWave,
    CardInfo}) ->
    NewVer = Ver + 1,
    HelpTimes = 0,
    IsGetHelp = 0,
    do({m_exquisite_shelf,
        NewVer,
        Wave,
        ShelfId,
        ShelfPid,
        PosWave,
        CardInfo,
        HelpTimes,
        IsGetHelp});
do(MExquisiteShelf = #m_exquisite_shelf{}) ->
    {ok, MExquisiteShelf};
do(_Err) ->
    logger:error("exquisite_shelf_ver版本错误:~w",
                 [_Err],
                 exquisite_shelf_ver,
                 16),
    {false, "exquisite_shelf_ver版本转换失败"}.

