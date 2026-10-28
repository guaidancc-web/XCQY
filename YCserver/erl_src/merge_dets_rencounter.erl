-file("src/merge/merge_dets_rencounter.erl", 1).

-module(merge_dets_rencounter).

-export([do_init/1, do_convert/2, do_end/1, merge/2]).

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

-file("src/merge/merge_dets_rencounter.erl", 15).

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

-file("src/merge/merge_dets_rencounter.erl", 16).

-file("inc/rencounter.hrl", 1).

-record(m_rencounter, {ver = 1}).

-record(rencounter_role,
        {ver = 1,
         id = {0, "", 0},
         name = "",
         classes = 0,
         lev = 0,
         sex = 0,
         break_times = 0,
         fc = 0,
         looks = [] :: list(),
         rank_lev = 1,
         star = 0,
         total_star = 0,
         join_times = 0,
         max_joins = 4 * 2,
         has_get_rank = 1,
         last_matched = 0,
         best_rank = 0,
         best_star = 0,
         best_total_star = 0,
         update_best_star_time = 0,
         win_lasted_times = 0,
         last_result = 0,
         season_join_times = 0,
         season_win_times = 0,
         season_lasted_win = 0,
         total_join_times = 0,
         total_win_times = 0,
         best_laster_win = 0,
         last_join_times = 0,
         last_win_times = 0,
         last_lasted_win = 0}).

-record(rencounter_match_role,
        {ver = 1,
         id = {0, "", 0},
         pid = undefined :: pid(),
         name = "",
         classes = 0,
         lev = 0,
         sex = 0,
         break_times = 0,
         fc = 0,
         looks = [] :: list(),
         rank_lev = 1,
         star = 0,
         win_lasted_times = 0,
         mode = 1,
         trail_times = 0,
         last_matched = 0,
         match_id = 0,
         retrys = 0}).

-record(rencounter_match,
        {id = 0 :: non_neg_integer(),
         mode = 1,
         match_roles = [] :: list(),
         time = 0 :: non_neg_integer(),
         combat_pid :: undefined | pid(),
         calc_args = [] :: list()}).

-file("src/merge/merge_dets_rencounter.erl", 17).

do_init(Table = #merge_table{server =
                                 #merge_server{index = 1}}) ->
    logger:debug("对rencounter_rank进行处理",
                 [],
                 merge_dets_rencounter,
                 20),
    {ok, [], Table};
do_init(Table = #merge_table{server =
                                 #merge_server{index = Size, size = Size}}) ->
    logger:debug("rencounter_role进行处理",
                 [],
                 merge_dets_rencounter,
                 25),
    merge_util:dets_merge(rencounter_role,
                          "rencounter_role.dets",
                          set,
                          #rencounter_role.id,
                          undefined),
    {ok, [], Table};
do_init(Table) -> {ok, [], Table}.

do_convert([], Table) -> {ok, Table}.

do_end(_Table) -> ignore.

merge(Data, #merge_server{}) -> {ok, Data}.

