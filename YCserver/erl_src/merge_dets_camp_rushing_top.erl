-file("src/merge/merge_dets_camp_rushing_top.erl", 1).

-module(merge_dets_camp_rushing_top).

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

-file("src/merge/merge_dets_camp_rushing_top.erl", 20).

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

-file("src/merge/merge_dets_camp_rushing_top.erl", 21).

-file("inc/camp_rushing_top.hrl", 1).

-author("jia").

-record(camp_rushing_top_season_info,
        {season_id = 0,
         cur_index = 0,
         total_index = 0,
         question_group = 0,
         option_a = 0,
         option_b = 0,
         option_c = 0,
         gold = 0,
         final_num = 0,
         final_roles = [],
         gain_gold = 0,
         last_num = 0}).

-record(camp_rushing_top_role,
        {rid = {0, "", 0},
         name = "",
         lev = 0,
         sex = 0,
         classes = 0,
         is_sign = 0,
         in_map = 0,
         index = 0,
         option = 0,
         is_lost = 0,
         sign_times = 0,
         final_times = 0,
         revive_times = 0,
         sys_barrage = 1,
         ply_barrage = 1,
         barrage_time = 0}).

-record(camp_rushing_top_question_base,
        {question_group = 0,
         question_index = 0,
         question = "",
         option_a = "",
         option_b = "",
         option_c = "",
         answer = 0}).

-file("src/merge/merge_dets_camp_rushing_top.erl", 22).

do_init(Table = #merge_table{server =
                                 #merge_server{index = Size, size = Size}}) ->
    merge_util:dets_merge(camp_rushing_top_role,
                          "camp_rushing_top_role.dets",
                          set,
                          #camp_rushing_top_role.rid,
                          undefined),
    {ok, [], Table};
do_init(Table) -> {ok, [], Table}.

do_convert([], Table) -> {ok, Table}.

do_end(_Table) -> ignore.

