-file("src/data/camp_guild_bady_data.erl", 1).

-module(camp_guild_bady_data).

-export([get/1, get_reward/1]).

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

-file("src/data/camp_guild_bady_data.erl", 16).

-file("inc/camp_guild_bady.hrl", 1).

-record(camp_guild_bady,
        {id = {0, "", 0},
         name = "",
         sex = 0,
         classes = 0,
         lev = 0,
         guild_id = {0, "", 0},
         guild_name = "",
         score = 0,
         is_bady = 0,
         photo = 0,
         photo_auditing = 0,
         mtime = 0}).

-record(camp_guild_bady_rank,
        {rank = 0,
         id = {0, "", 0},
         name = "",
         sex = 0,
         classes = 0,
         lev = 0,
         guild_id = {0, "", 0},
         guild_name = "",
         score = 0,
         photo = 0,
         photo_auditing = 0,
         mtime = 0}).

-record(camp_guild_bady_data,
        {rank = 0,
         role_reward = [],
         guild_reward = [],
         honor = 0}).

-file("src/data/camp_guild_bady_data.erl", 17).

get(show_num) -> 20;
get(_) -> false.

get_reward(1) ->
    #camp_guild_bady_data{rank = 1,
                          role_reward = [{29152, 0, 1}, {29158, 0, 1}],
                          guild_reward = [{23019, 0, 1}], honor = 11071};
get_reward(2) ->
    #camp_guild_bady_data{rank = 2,
                          role_reward = [{29152, 0, 1}, {29158, 0, 1}],
                          guild_reward = [{23019, 0, 1}]};
get_reward(3) ->
    #camp_guild_bady_data{rank = 3,
                          role_reward = [{29152, 0, 1}, {29158, 0, 1}],
                          guild_reward = [{23019, 0, 1}]};
get_reward(4) ->
    #camp_guild_bady_data{rank = 4,
                          role_reward = [{29152, 0, 1}, {29158, 0, 1}],
                          guild_reward = [{23019, 0, 1}]};
get_reward(5) ->
    #camp_guild_bady_data{rank = 5,
                          role_reward = [{29152, 0, 1}, {29158, 0, 1}],
                          guild_reward = [{23019, 0, 1}]};
get_reward(6) ->
    #camp_guild_bady_data{rank = 6,
                          role_reward = [{20031, 0, 1}, {29134, 0, 1}],
                          guild_reward = [{20019, 0, 3}]};
get_reward(7) ->
    #camp_guild_bady_data{rank = 7,
                          role_reward = [{20031, 0, 1}, {29134, 0, 1}],
                          guild_reward = [{20019, 0, 3}]};
get_reward(8) ->
    #camp_guild_bady_data{rank = 8,
                          role_reward = [{20031, 0, 1}, {29134, 0, 1}],
                          guild_reward = [{20019, 0, 3}]};
get_reward(9) ->
    #camp_guild_bady_data{rank = 9,
                          role_reward = [{20031, 0, 1}, {29134, 0, 1}],
                          guild_reward = [{20019, 0, 3}]};
get_reward(10) ->
    #camp_guild_bady_data{rank = 10,
                          role_reward = [{20031, 0, 1}, {29134, 0, 1}],
                          guild_reward = [{20019, 0, 3}]};
get_reward(11) ->
    #camp_guild_bady_data{rank = 11,
                          role_reward = [{20031, 0, 1}, {29134, 0, 1}],
                          guild_reward = [{20019, 0, 3}]};
get_reward(12) ->
    #camp_guild_bady_data{rank = 12,
                          role_reward = [{20031, 0, 1}, {29134, 0, 1}],
                          guild_reward = [{20019, 0, 3}]};
get_reward(13) ->
    #camp_guild_bady_data{rank = 13,
                          role_reward = [{20031, 0, 1}, {29134, 0, 1}],
                          guild_reward = [{20019, 0, 3}]};
get_reward(14) ->
    #camp_guild_bady_data{rank = 14,
                          role_reward = [{20031, 0, 1}, {29134, 0, 1}],
                          guild_reward = [{20019, 0, 3}]};
get_reward(15) ->
    #camp_guild_bady_data{rank = 15,
                          role_reward = [{20031, 0, 1}, {29134, 0, 1}],
                          guild_reward = [{20019, 0, 3}]};
get_reward(16) ->
    #camp_guild_bady_data{rank = 16,
                          role_reward = [{20031, 0, 1}, {29134, 0, 1}],
                          guild_reward = [{20019, 0, 3}]};
get_reward(17) ->
    #camp_guild_bady_data{rank = 17,
                          role_reward = [{20031, 0, 1}, {29134, 0, 1}],
                          guild_reward = [{20019, 0, 3}]};
get_reward(18) ->
    #camp_guild_bady_data{rank = 18,
                          role_reward = [{20031, 0, 1}, {29134, 0, 1}],
                          guild_reward = [{20019, 0, 3}]};
get_reward(19) ->
    #camp_guild_bady_data{rank = 19,
                          role_reward = [{20031, 0, 1}, {29134, 0, 1}],
                          guild_reward = [{20019, 0, 3}]};
get_reward(20) ->
    #camp_guild_bady_data{rank = 20,
                          role_reward = [{20031, 0, 1}, {29134, 0, 1}],
                          guild_reward = [{20019, 0, 3}]};
get_reward(_) -> false.

