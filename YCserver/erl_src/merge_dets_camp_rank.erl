-file("src/merge/merge_dets_camp_rank.erl", 1).

-module(merge_dets_camp_rank).

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

-file("src/merge/merge_dets_camp_rank.erl", 14).

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

-file("src/merge/merge_dets_camp_rank.erl", 15).

-file("inc/campaign_rank.hrl", 1).

-record(campaign_rank,
        {sec_type = 1,
         show_list = [],
         list = [],
         last_val = 0,
         len = 0}).

-record(campaign_rank_role,
        {key,
         id = {0, "", 0} :: term(),
         id2 = {0, "", 0} :: term(),
         sec_type = 0,
         rank = 1,
         time = 0 :: non_neg_integer(),
         role_id = 0 :: non_neg_integer(),
         platform = "" :: list(),
         zone_id = 0 :: non_neg_integer(),
         name = "" :: list(),
         sex = 0 :: 0..2,
         classes = 0 :: 0..4,
         lev = 0 :: non_neg_integer(),
         role_id2 = 0 :: non_neg_integer(),
         platform2 = "" :: list(),
         zone_id2 = 0 :: non_neg_integer(),
         name2 = "" :: list(),
         sex2 = 0 :: 0..2,
         classes2 = 0 :: 0..4,
         lev2 = 0 :: non_neg_integer(),
         val1 = 0 :: non_neg_integer(),
         val2 = 0 :: non_neg_integer(),
         val3 = 0 :: non_neg_integer(),
         val4 = 0 :: non_neg_integer(),
         desc = ""}).

-record(campaign_rank_zone,
        {id = 0, sec_type = 0, zone, pid}).

-record(campaign_rank_data,
        {id = 0,
         sec_type = 0,
         num = 0,
         keys = [],
         min_val = 1,
         zone,
         title = "",
         content = "",
         desc = "",
         cast = "",
         cast_rank = 1,
         merge_flag = 0}).

-record(camp_rank_reward_data,
        {min_rank = 0,
         max_rank = 0,
         sec_type = 0,
         item_list = [],
         title = "",
         content = "",
         limit = 0}).

-record(camp_rank_self_reward_data,
        {sec_type = 0, item_list = [], num = 0}).

-file("src/merge/merge_dets_camp_rank.erl", 16).

do_init(Table = #merge_table{server =
                                 #merge_server{index = 1}}) ->
    merge_util:dets_merge(campaign_rank,
                          "campaign_rank.dets",
                          set,
                          #campaign_rank.sec_type,
                          undefined),
    {ok, [], Table};
do_init(Table) -> {ok, [], Table}.

do_convert([], Table) -> {ok, Table}.

do_end(_Table) -> ignore.

