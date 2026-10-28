-file("src/merge/merge_dets_camp_discount.erl", 1).

-module(merge_dets_camp_discount).

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

-file("src/merge/merge_dets_camp_discount.erl", 12).

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

-file("src/merge/merge_dets_camp_discount.erl", 13).

-file("inc/camp_discount.hrl", 1).

-record(camp_discount_config_data,
        {id = 0,
         group_id = 0,
         item_list = [],
         cost1 = 0,
         cost2 = [],
         min_lev = 0,
         max_lev = 0,
         sex = 0,
         classes = 0,
         limit_role_num = 0,
         limit_zone_num = 0,
         weigth = 0,
         show_effect = 0,
         show_item = [],
         show_type = 0}).

-record(m_camp_discount,
        {camp_id = 0,
         refresh_time = 0,
         shop_list = [],
         limit_list = [],
         refresh_num = 0,
         last_group = 0}).

-record(camp_discount_limit, {id, num}).

-file("src/merge/merge_dets_camp_discount.erl", 14).

do_init(Table = #merge_table{server =
                                 #merge_server{index = 1}}) ->
    merge_util:dets_merge(camp_discount_limit,
                          "camp_discount_limit.dets",
                          set,
                          #camp_discount_limit.id,
                          undefined),
    {ok, [], Table};
do_init(Table) -> {ok, [], Table}.

do_convert([], Table) -> {ok, Table}.

do_end(_Table) -> ignore.

