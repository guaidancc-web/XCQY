-file("src/mod/boss/world_boss_ver.erl", 1).

-module(world_boss_ver).

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

-file("src/mod/boss/world_boss_ver.erl", 13).

-file("inc/world_boss.hrl", 1).

-record(world_boss,
        {ver = 1 :: non_neg_integer(),
         id = 0 :: non_neg_integer(),
         first_killer = [],
         round_first = [],
         round_killer = [],
         killer_rank = [],
         last_killed = 0 :: non_neg_integer(),
         last_respawn = 0 :: non_neg_integer(),
         total_killed = 0 :: non_neg_integer(),
         is_rewarded = false :: true | false,
         is_rewarded_first = false :: true | false,
         map_id = 0 :: non_neg_integer(),
         x = 0 :: non_neg_integer(),
         y = 0 :: non_neg_integer(),
         recent_killer = []}).

-record(world_boss_killer,
        {ver = 0,
         id = {0, "", 0},
         name = "" :: string(),
         classes = 0 :: non_neg_integer(),
         sex = 0 :: non_neg_integer(),
         looks = [],
         finished = 0 :: non_neg_integer(),
         round = 0 :: non_neg_integer(),
         is_leader = 0 :: non_neg_integer()}).

-record(world_boss_winner,
        {ver = 0,
         id = {0, "", 0},
         name = "" :: string(),
         rewarded = 0 :: non_neg_integer(),
         last_rewarded = 0 :: non_neg_integer()}).

-file("src/mod/boss/world_boss_ver.erl", 14).

do({world_boss,
    Ver = 0,
    Id,
    First_killer,
    Round_first,
    Round_killer,
    Killer_rank,
    Last_killed,
    Last_respawn,
    Total_killed,
    Is_rewarded,
    Is_rewarded_first,
    Map_id,
    X,
    Y}) ->
    Recent_killer = [],
    do({world_boss,
        Ver + 1,
        Id,
        First_killer,
        Round_first,
        Round_killer,
        Killer_rank,
        Last_killed,
        Last_respawn,
        Total_killed,
        Is_rewarded,
        Is_rewarded_first,
        Map_id,
        X,
        Y,
        Recent_killer});
do(Data = #world_boss{ver = 1}) -> {ok, Data};
do(_) -> {false, lang:get("世界boss数据转换失败")}.

