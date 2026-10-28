-file("src/merge/merge_dets_robot.erl", 1).

-module(merge_dets_robot).

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

-file("src/merge/merge_dets_robot.erl", 12).

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

-file("src/merge/merge_dets_robot.erl", 13).

-file("inc/robot.hrl", 1).

-record(robot_role,
        {ver = 4,
         id = {0, "", 0} :: tuple(),
         name = "" :: list(),
         sex = 0 :: 0..1,
         classes = 0 :: 0..4,
         lev = 0 :: non_neg_integer(),
         fc = 0,
         face = 0,
         ai_id = 0,
         skills = [],
         talents = [],
         pet,
         backup_pets = [],
         guard,
         slave = [],
         attr :: undefined | tuple(),
         looks = [],
         time = 0,
         m_formation,
         pet_fc = 0,
         all_fc = 0,
         cup = 1000,
         m_lev_break}).

-record(robot_role_index,
        {id = {0, "", 0} :: tuple(),
         sex = 0 :: 0..1,
         classes = 0 :: 0..4,
         lev = 0 :: non_neg_integer(),
         fc = 0,
         pet_fc = 0,
         cup = 1000,
         all_fc = 0,
         time = 0}).

-file("src/merge/merge_dets_robot.erl", 14).

do_init(Table = #merge_table{server =
                                 #merge_server{index = Size, size = Size}}) ->
    merge_util:dets_merge(robot_role,
                          "robot_role.dets",
                          set,
                          #robot_role.id,
                          undefined),
    {ok, [], Table};
do_init(Table) -> {ok, [], Table}.

do_convert([], Table) -> {ok, Table}.

do_end(_Table) -> ignore.

