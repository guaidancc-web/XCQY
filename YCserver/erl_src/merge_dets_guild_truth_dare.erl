-file("src/merge/merge_dets_guild_truth_dare.erl", 1).

-module(merge_dets_guild_truth_dare).

-author("Suhan").

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

-file("src/merge/merge_dets_guild_truth_dare.erl", 19).

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

-file("src/merge/merge_dets_guild_truth_dare.erl", 20).

-file("inc/guild_truth_dare.hrl", 1).

-author("Suhan").

-record(guild_truth_dare_info,
        {guild_id = {0, "", 0}, next_id = 0, his_info = []}).

-record(guild_truth_dare_his_info,
        {id = 0,
         time = 0,
         lucky_role = {0, "", 0},
         role_name = "",
         sex = 0,
         classes = 0,
         flower = 0,
         egg = 0,
         question_type = 0,
         question = ""}).

-record(guild_truth_dare_question_bank,
        {guild_id = {0, "", 0},
         ver = 0,
         next_id = 1000,
         truth_num = 0,
         dare_num = 0,
         question = []}).

-record(guild_truth_dare_question,
        {question_id = 0,
         type = 0,
         role_id = {0, "", 0},
         role_name = "",
         question = "",
         is_choose = 0}).

-record(guild_truth_dare_room_info,
        {guild_id = {0, "", 0},
         room_pid = undefined,
         num = 0,
         max_num = 0,
         role = []}).

-record(guild_truth_dare_room_log,
        {guild_id = {0, "", 0},
         scene_info = [],
         truth_num = 0,
         dare_num = 0,
         contents = []}).

-file("src/merge/merge_dets_guild_truth_dare.erl", 21).

do_init(Table = #merge_table{server =
                                 #merge_server{index = Size, size = Size}}) ->
    merge_util:dets_merge(guild_truth_dare_his,
                          "guild_truth_dare_his.dets",
                          set,
                          #guild_truth_dare_info.guild_id,
                          undefined),
    merge_util:dets_merge(guild_truth_dare_question_bank,
                          "guild_truth_dare_question_bank.dets",
                          set,
                          #guild_truth_dare_question_bank.guild_id,
                          undefined),
    {ok, [], Table};
do_init(Table) -> {ok, [], Table}.

do_convert([], Table) -> {ok, Table}.

do_end(_Table) -> ignore.

