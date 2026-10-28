-file("src/merge/merge_dets_camp_new_discount.erl", 1).

-module(merge_dets_camp_new_discount).

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

-file("src/merge/merge_dets_camp_new_discount.erl", 19).

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

-file("src/merge/merge_dets_camp_new_discount.erl", 20).

-file("inc/camp_new_discount.hrl", 1).

-author("Suhan").

-record(camp_new_discount_config,
        {cost, item_id, bind, num, title, content}).

-record(m_camp_new_discount,
        {role_id, camp_id = 0, total_cost = 0, shop_info = []}).

-record(camp_new_discount_data,
        {id, item, price, left_num, total_num, show_effect}).

-record(camp_new_discount_shop_data,
        {day,
         id,
         item,
         cost,
         min_lev,
         max_lev,
         sex,
         classes,
         limit_role_num,
         show_effect}).

-file("src/merge/merge_dets_camp_new_discount.erl", 21).

do_init(Table = #merge_table{server =
                                 #merge_server{index = Size, size = Size}}) ->
    merge_util:dets_merge(camp_new_discount,
                          "camp_new_discount.dets",
                          set,
                          #m_camp_new_discount.role_id,
                          undefined),
    {ok, [], Table};
do_init(Table) -> {ok, [], Table}.

do_convert([], Table) -> {ok, Table}.

do_end(_Table) -> ignore.

