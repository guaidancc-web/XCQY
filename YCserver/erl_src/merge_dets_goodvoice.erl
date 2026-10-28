-file("src/merge/merge_dets_goodvoice.erl", 1).

-module(merge_dets_goodvoice).

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

-file("src/merge/merge_dets_goodvoice.erl", 13).

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

-file("src/merge/merge_dets_goodvoice.erl", 14).

-file("inc/goodvoice.hrl", 1).

-record(goodvoice,
        {ver = 4,
         role_id = {0, "", 0},
         id = 0,
         platform = "",
         zone_id = 0,
         name = "",
         sex = 0,
         lev = 0,
         classes = 0,
         time = 0,
         summary = "",
         update_time = 0,
         file_name = "",
         liked = 0,
         likers = [],
         flower_likers = [],
         today_flower = 0,
         update_flower = 0,
         caster_num = 0,
         caster = [],
         logs = [],
         only_liked = 0,
         flower = 0}).

-record(goodvoice_report_info,
        {id, time, lev, name, report = []}).

-record(goodvoice_report,
        {id, order, name, lev, time, filename}).

-record(goodvoice_rank,
        {ver = 1,
         role_id = {0, "", 0},
         id = 0,
         platform = "",
         zone_id = 0,
         name = "",
         sex = 0,
         lev = 0,
         classes = 0,
         time = 0,
         summary = "",
         update_time = 0,
         file_name = "",
         liked = 0,
         today_flower = 0,
         update_flower = 0,
         caster_num = 0,
         rank = 0,
         only_liked = 0,
         flower = 0}).

-file("src/merge/merge_dets_goodvoice.erl", 15).

do_init(Table = #merge_table{server =
                                 #merge_server{index = Size, size = Size}}) ->
    merge_util:dets_merge(goodvoice,
                          "goodvoice.dets",
                          set,
                          #goodvoice.role_id,
                          undefined),
    merge_util:dets_merge(goodvoice_rank,
                          "goodvoice_rank.dets",
                          set,
                          #goodvoice_rank.role_id,
                          undefined),
    {ok, [], Table};
do_init(Table) -> {ok, [], Table}.

do_convert([], Table) -> {ok, Table}.

do_end(_Table) -> ignore.

