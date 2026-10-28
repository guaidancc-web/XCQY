-file("src/merge/merge_dets_review.erl", 1).

-module(merge_dets_review).

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

-file("src/merge/merge_dets_review.erl", 14).

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

-file("src/merge/merge_dets_review.erl", 15).

-file("inc/review.hrl", 1).

-record(review,
        {ver = 1 :: non_neg_integer(),
         id = {0, "", 0},
         type = 1 :: non_neg_integer(),
         base_id = 0 :: non_neg_integer(),
         rid = {0, "", 0},
         name = "" :: string(),
         sex = 1 :: non_neg_integer(),
         classes = 1 :: non_neg_integer(),
         content = "" :: string(),
         pro = 0 :: non_neg_integer(),
         con = 0 :: non_neg_integer(),
         ctime = 0 :: non_neg_integer(),
         pets = [],
         guards = []}).

-record(review_index,
        {key = {0, 0} :: tuple(),
         ids = [] :: list(),
         hots = [] :: list()}).

-record(review_report,
        {id = {0, "", 0},
         rid = {0, "", 0},
         type = 0,
         base_id = 0,
         name = "",
         lev = 1,
         time = 0,
         content = "",
         reporter_id = {0, "", 0},
         reporter_name = "",
         reporter_lev = 0}).

-file("src/merge/merge_dets_review.erl", 16).

do_init(Table = #merge_table{server =
                                 #merge_server{index = Size, size = Size}}) ->
    merge_util:dets_merge(review,
                          "review.dets",
                          set,
                          #review.id,
                          undefined),
    merge_util:dets_merge(review_index,
                          "review_index.dets",
                          set,
                          #review_index.key,
                          undefined),
    {ok, [], Table};
do_init(Table) -> {ok, [], Table}.

do_convert([], Table) -> {ok, Table}.

do_end(_Table) -> ignore.

