-file("src/mod/redpacket/red_packet_rpc.erl", 1).

-module(red_packet_rpc).

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

-file("src/mod/redpacket/red_packet_rpc.erl", 15).

-file("inc/red_packet.hrl", 1).

-record(red_packet,
        {ver = 1,
         id = {0, "", 0},
         name = "",
         lev = 0,
         classes = 0,
         sex = 0,
         type = 1,
         title = "" :: string(),
         assets_type = 0,
         amount = 0 :: non_neg_integer(),
         remain = 0 :: non_neg_integer(),
         total = 0 :: non_neg_integer(),
         num = 0 :: non_neg_integer(),
         time = 0 :: non_neg_integer(),
         packs = [],
         log = [] :: list(),
         has_soul = 0}).

-record(red_packet_grab_log,
        {id = {0, "", 0},
         name = "",
         lev = 0,
         classes = 0,
         sex = 0,
         time = 0,
         value = 0,
         is_item = 0}).

-file("src/mod/redpacket/red_packet_rpc.erl", 16).

handle(18500, {}, Role) ->
    red_packet:push_red_packet_list(Role),
    ok;
handle(18502, {Type, Lev, Count, Title}, Role) ->
    case role_misc:check_cd(rpc_18502) of
        false ->
            logger:debug("发送红包过于频繁，请稍后重试", [], red_packet_rpc, 27),
            {reply, {0, lang:get("发送红包过于频繁，请稍后重试")}};
        true ->
            case red_packet:rpc_send_red_packet(Role,
                                                Type,
                                                Lev,
                                                Count,
                                                Title)
                of
                {ok, NewRole, RtnMsg} -> {reply, {1, RtnMsg}, NewRole};
                {false, Reason} ->
                    logger:debug("发送红包出错:~ts",
                                 [Reason],
                                 red_packet_rpc,
                                 34),
                    {reply, {0, Reason}}
            end
    end;
handle(18503, {Id, Platform, ZoneId}, Role) ->
    case red_packet:rpc_grab_red_packet(Role,
                                        {Id, Platform, ZoneId})
        of
        {ok, NewRole, Msg} -> {reply, {1, Msg}, NewRole};
        {false, Reason} -> {reply, {0, Reason}}
    end;
handle(18504, {UnitId}, Role) ->
    case red_packet:rpc_get_rain_red_packet(Role, UnitId) of
        {ok, NewRole, Msg} -> {reply, {1, Msg}, NewRole};
        {false, Reason} -> {reply, {0, Reason}}
    end;
handle(18505, PackId, Role) ->
    red_packet:push_packet_info(Role, PackId),
    ok;
handle(_Cmd, _Data, _Role) ->
    logger:debug("模块[~w]收到无效的RPC调用[~w]: ~w",
                 [red_packet_rpc, _Cmd, _Data],
                 red_packet_rpc,
                 63),
    {error, unknow_command}.

