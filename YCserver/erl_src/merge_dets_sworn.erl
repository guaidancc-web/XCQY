-file("src/merge/merge_dets_sworn.erl", 1).

-module(merge_dets_sworn).

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

-file("src/merge/merge_dets_sworn.erl", 14).

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

-file("src/merge/merge_dets_sworn.erl", 15).

-file("inc/sworn.hrl", 1).

-record(m_sworn,
        {ver = 0 :: pos_integer(),
         id = {0, "", 0} ::
             {pos_integer(), list(), non_neg_integer()},
         status = 0 :: non_neg_integer(),
         name = "" :: string(),
         name_defined = "" :: string(),
         time = 0 :: list()}).

-record(sworn_role,
        {ver = 0 :: pos_integer(),
         role_id = 0 :: non_neg_integer(),
         id = 0 :: non_neg_integer(),
         name = "" :: string(),
         name_defined = "" :: string(),
         status = 0 :: non_neg_integer()}).

-record(sworn,
        {ver = 0 :: pos_integer(),
         id = {0, "", 0} ::
             {pos_integer(), list(), non_neg_integer()},
         name = "" :: string(),
         time = 0 :: non_neg_integer(),
         sworn_val = 0 :: non_neg_integer(),
         status = 0 :: non_neg_integer(),
         num = 0 :: non_neg_integer(),
         head = 0 :: non_neg_integer(),
         pos = 0 :: non_neg_integer(),
         timeout = 0 :: non_neg_integer(),
         times = 0 :: non_neg_integer(),
         members = [] :: list(),
         votes = [] :: list(),
         trends = [] :: list(),
         lists = [] :: list()}).

-record(sworn_member,
        {ver = 0 :: pos_integer(),
         pos = 0 :: non_neg_integer(),
         role_id = {0, "", 0} ::
             {pos_integer(), list(), non_neg_integer()},
         name = "" :: string(),
         name_defined = "" :: string(),
         lev = 0 :: pos_integer(),
         classes = 0 :: pos_integer(),
         sex = 0 :: pos_integer(),
         times = 0 :: pos_integer(),
         free = 0 :: pos_integer()}).

-record(sworn_trend,
        {type = 0 :: non_neg_integer(),
         id = {0, "", 0} ::
             {pos_integer(), list(), non_neg_integer()},
         name = "" :: string(),
         r_id = {0, "", 0} ::
             {pos_integer(), list(), non_neg_integer()},
         r_name = "" :: string(),
         r_lev = 0 :: non_neg_integer(),
         r_sex = 0 :: non_neg_integer(),
         r_classes = 0 :: non_neg_integer(),
         rename = "" :: string(),
         timeout = 0 :: non_neg_integer(),
         time = 0 :: non_neg_integer(),
         reason_id = 0 :: non_neg_integer(),
         reason_msg = "" :: string(),
         votes = [] :: list(),
         agree = 0 :: non_neg_integer(),
         lists = [] :: list()}).

-record(sworn_evt,
        {role_id = {0, "", 0} ::
             {pos_integer(), list(), non_neg_integer()},
         finish = 0 :: non_neg_integer(),
         skill = 0 :: non_neg_integer(),
         invite = 0 :: non_neg_integer(),
         prefix = 0 :: non_neg_integer(),
         personal = 0 :: non_neg_integer()}).

-file("src/merge/merge_dets_sworn.erl", 16).

do_init(Table = #merge_table{server =
                                 #merge_server{index = Size, size = Size}}) ->
    merge_util:dets_merge(sworn,
                          "sworn.dets",
                          set,
                          #sworn.id,
                          undefined),
    merge_util:dets_merge(sworn_role,
                          "sworn_role.dets",
                          set,
                          #sworn_role.role_id,
                          undefined),
    merge_util:dets_merge(sworn_evt,
                          "sworn_evt.dets",
                          set,
                          #sworn_evt.role_id,
                          undefined),
    {ok, [], Table};
do_init(Table) -> {ok, [], Table}.

do_convert([], Table) -> {ok, Table}.

do_end(_Table) -> ignore.

