-file("src/merge/merge_dets_world_boss_winner.erl", 1).

-module(merge_dets_world_boss_winner).

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

-file("src/merge/merge_dets_world_boss_winner.erl", 13).

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

-file("src/merge/merge_dets_world_boss_winner.erl", 14).

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

-file("src/merge/merge_dets_world_boss_winner.erl", 15).

do_init(Table = #merge_table{server =
                                 #merge_server{index = Size, size = Size}}) ->
    merge_util:dets_merge(world_boss_winner,
                          "world_boss_winner.dets",
                          set,
                          #world_boss_winner.id,
                          undefined),
    {ok, [], Table};
do_init(Table) -> {ok, [], Table}.

do_convert([], Table) -> {ok, Table}.

do_end(_Table) -> ignore.

