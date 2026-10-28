-file("src/mod/roll/roll_rpc.erl", 1).

-module(roll_rpc).

-export([handle/3]).

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

-file("src/mod/roll/roll_rpc.erl", 10).

-file("inc/roll.hrl", 1).

-record(roll,
        {id = 0,
         mode = 0,
         key = 0,
         end_tick = 0,
         timeout = 0,
         items = [],
         has_reward = 0,
         channel}).

-record(roll_item,
        {id = 1,
         has_reward = 0,
         base_id = 0,
         origin_base_id = 0,
         num = 1,
         choices = [1],
         roles = [],
         is_cast = 0,
         crystal = 0}).

-record(roll_role,
        {role_id,
         name = "",
         pid,
         sex = 0,
         classes = 0,
         choice = 0,
         rand_num = 0,
         time = 0,
         reward = 0,
         team_status = 0}).

-file("src/mod/roll/roll_rpc.erl", 11).

handle(12302, {RollId, ItemId}, Role) ->
    roll_mgr:choice(Role, RollId, ItemId),
    ok;
handle(12321, {Id, Pos}, Role) ->
    open_card_mgr:choose(Role, Id, Pos),
    ok;
handle(_Cmd, _Data, _Role) ->
    logger:debug("模块[~w]收到无效的RPC调用[~w]: ~w",
                 [roll_rpc, _Cmd, _Data],
                 roll_rpc,
                 24),
    {error, unknow_command}.

