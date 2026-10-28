-file("src/merge/merge_dets_lucky_money.erl", 1).

-module(merge_dets_lucky_money).

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

-file("src/merge/merge_dets_lucky_money.erl", 14).

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

-file("src/merge/merge_dets_lucky_money.erl", 15).

-file("inc/lucky_money.hrl", 1).

-record(lucky_money,
        {id = 0,
         round_id_now = 0,
         day = 0,
         start_time = 0,
         end_time = 0,
         assets_type = 0}).

-record(lucky_money_role,
        {role_id = {0, "", 0}, lists = []}).

-record(m_lucky_money, {lists = []}).

-record(lucky_money_data,
        {id = 0,
         day = 0,
         round_id = 0,
         status = 0,
         ratio = 0,
         limit = 0,
         assets_type = 0,
         assets_value = 0,
         init_value = 0,
         reward = []}).

-file("src/merge/merge_dets_lucky_money.erl", 16).

do_init(Table = #merge_table{server =
                                 #merge_server{index = Size, size = Size}}) ->
    merge_util:dets_merge(lucky_money_role,
                          "lucky_money_role.dets",
                          set,
                          #lucky_money_role.role_id,
                          undefined),
    {ok, [], Table};
do_init(Table) -> {ok, [], Table}.

do_convert([], Table) -> {ok, Table}.

do_end(_Table) -> ignore.

