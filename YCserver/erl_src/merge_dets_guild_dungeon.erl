-file("src/merge/merge_dets_guild_dungeon.erl", 1).

-module(merge_dets_guild_dungeon).

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

-file("src/merge/merge_dets_guild_dungeon.erl", 13).

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

-file("src/merge/merge_dets_guild_dungeon.erl", 14).

-file("inc/guild_dungeon.hrl", 1).

-record(guild_dungeon,
        {ver = 0,
         guild_id = {0, "", 0},
         base_id = 0,
         map_id = 0,
         map_pid = undefined,
         unit_id = 0,
         chapter_now = 0,
         strongpoint_now = 0,
         boss_id = 0,
         num = 0,
         time = 0,
         chapters = [],
         rewards_all = []}).

-record(guild_dungeon_chapter,
        {ver = 0,
         chapter_id = 0,
         status = 0,
         strongpoints = []}).

-record(guild_dungeon_strongpoint,
        {ver = 0, strongpoint_id = 1, monsters = []}).

-record(guild_dungeon_monster,
        {unique = 0,
         monster_id = 0,
         percent = 0,
         challenge = 1,
         role_name = "",
         role_sex = 0,
         role_classes = 0,
         percent_list = [],
         type = 0,
         combat_pid = undefined,
         combat_id = 0,
         rewards = []}).

-record(guild_dungeon_rank,
        {id = 0,
         guild_id = {0, "", 0},
         chapter_id = 0,
         strongpoint_id = 0,
         ranks = [],
         rewards = []}).

-record(guild_dungeon_rank_role,
        {role_id = {0, "", 0},
         times = 0,
         role_name = "",
         classes = 0,
         sex = 0,
         harm = 0,
         role_ids = []}).

-record(guild_dungeon_hp,
        {id = {{0, "", 0}, 0, 0, 0},
         guild_id = {0, "", 0},
         chapter_id = 0,
         strongpoint_id = 0,
         monster_id = 0,
         monsters = []}).

-file("src/merge/merge_dets_guild_dungeon.erl", 15).

do_init(Table = #merge_table{server =
                                 #merge_server{index = Size, size = Size}}) ->
    merge_util:dets_merge(guild_dungeon,
                          "guild_dungeon.dets",
                          set,
                          #guild_dungeon.guild_id,
                          undefined),
    merge_util:dets_merge(guild_dungeon_rank,
                          "guild_dungeon_rank.dets",
                          set,
                          #guild_dungeon_rank.id,
                          undefined),
    merge_util:dets_merge(guild_dungeon_percent,
                          "guild_dungeon_percent.dets",
                          set,
                          1,
                          undefined),
    merge_util:dets_merge(guild_dungeon_score,
                          "guild_dungeon_score.dets",
                          set,
                          1,
                          undefined),
    {ok, [], Table};
do_init(Table) -> {ok, [], Table}.

do_convert([], Table) -> {ok, Table}.

do_end(_Table) -> ignore.

