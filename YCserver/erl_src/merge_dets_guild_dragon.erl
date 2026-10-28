-file("src/merge/merge_dets_guild_dragon.erl", 1).

-module(merge_dets_guild_dragon).

-author("jia").

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

-file("src/merge/merge_dets_guild_dragon.erl", 19).

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

-file("src/merge/merge_dets_guild_dragon.erl", 20).

-file("inc/guild_dragon.hrl", 1).

-author("jia").

-record(guild_dragon_role,
        {ver = 2,
         rid = {0, "", 0},
         map_pid = 0 :: pid(),
         name = "",
         lev = 0,
         sex = 0,
         classes = 0,
         looks = [],
         guild_id = {0, "", 0},
         guild_name = "",
         history = [],
         person_point = 0,
         rewards = [],
         update_time = 0,
         total_person_point = 0,
         challenge_msg_list = [],
         challenge_time = 0,
         loot_status = 0,
         loot_time = 0,
         looted_time = 0,
         max_rank = 0,
         honor_id = 0,
         pre_honor_id = 0,
         sign = 0,
         total_num = 0,
         sys_barrage = 1,
         ply_barrage = 1,
         barrage_time = 0,
         rank_index = 0,
         looted_num = 0,
         is_in_map = 0}).

-record(guild_dragon_history,
        {time = 0, point = 0, rewards = [], rank_index = 0}).

-record(guild_dragon_challenge_msg,
        {target_type = 0,
         target_id = {0, "", 0},
         msg = "",
         add_time = 0}).

-record(guild_dragon_guild,
        {ver = 1,
         guild_id = {0, "", 0},
         guild_name = "",
         lev = 0,
         leader_name = "",
         guild_point = 0,
         update_time = 0,
         rewards = [],
         max_rank = 0,
         history = []}).

-record(guild_dragon_fighter,
        {ver = 1,
         id = {0, "", 0},
         formation = 1,
         formation_lev = 1,
         guards = [],
         first_pet = 0,
         first_pet_base_id = 0}).

-file("src/merge/merge_dets_guild_dragon.erl", 21).

do_init(Table = #merge_table{server =
                                 #merge_server{index = Size, size = Size}}) ->
    merge_util:dets_merge(guild_dragon_role,
                          "guild_dragon_role.dets",
                          set,
                          #guild_dragon_role.rid,
                          undefined),
    merge_util:dets_merge(guild_dragon_guild,
                          "guild_dragon_guild.dets",
                          set,
                          #guild_dragon_guild.guild_id,
                          undefined),
    {ok, [], Table};
do_init(Table) -> {ok, [], Table}.

do_convert([], Table) -> {ok, Table}.

do_end(_Table) -> ignore.

