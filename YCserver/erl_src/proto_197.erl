-file("src/proto/proto_197.erl", 1).

-module(proto_197).

-export([pack/3, unpack/3]).

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

-file("src/proto/proto_197.erl", 14).

-file("inc/protocol.hrl", 1).

-record(module,
        {code :: undefined | pos_integer(),
         type :: undefined | game_server | monitor | tester,
         need_auth = true :: boolean(),
         caller = connector :: connector | object,
         module :: undefined | atom(),
         desc = "" :: string()}).

-record(rpc,
        {code = 0 :: non_neg_integer(),
         disable = false :: boolean(),
         autolog = false :: boolean(),
         autozip = false :: boolean(),
         condition = [] :: [tuple()],
         log_title :: undefined | string(),
         req_desc ::
             undefined |
             string() |
             {string(), [atom()]} |
             {atom(), atom(), tuple()},
         req = [] :: {atom(), [tuple()]} | [tuple()],
         reply_desc ::
             undefined |
             string() |
             {string(), [atom()]} |
             {atom(), atom(), tuple()},
         reply = [] :: {atom(), [tuple()]} | [tuple()],
         parser :: undefined | atom(),
         mod :: undefined | atom(),
         can_cache = true :: boolean()}).

-file("src/proto/proto_197.erl", 15).

-file("inc/guild_auction.hrl", 1).

-record(guild_auction,
        {id = {0, "", 0} :: tuple(),
         name = "" :: string(),
         goods = [] :: list(),
         last_goods = [] :: list(),
         next_id = 1 :: non_neg_integer()}).

-record(guild_auction_goods,
        {id = 0 :: non_neg_integer(),
         ver = 0 :: non_neg_integer(),
         item_id = 0 :: non_neg_integer(),
         item_num = 0 :: non_neg_integer(),
         current_price = 0 :: non_neg_integer(),
         max_price = 0 :: non_neg_integer(),
         last_bidden = 0 :: non_neg_integer(),
         bidden = 0 :: non_neg_integer(),
         timeout = 0 :: non_neg_integer(),
         deadline = 0 :: non_neg_integer(),
         status = 0 :: non_neg_integer(),
         added = 0 :: non_neg_integer(),
         start_time = 0 :: non_neg_integer(),
         bidders = [] :: list(),
         subscribers = [] :: list()}).

-record(guild_auction_bidder,
        {id = {0, "", 0} :: tuple(),
         name = "" :: string(),
         classes = 0,
         sex = 0,
         lev = 1,
         price = 0 :: non_neg_integer(),
         loss = [] :: list()}).

-file("src/proto/proto_197.erl", 16).

-spec pack(srv | cli, non_neg_integer(),
           tuple()) -> {ok, binary()} |
                       {error, {unknown_pack_command, non_neg_integer()}}.

pack(cli, 19700, {}) ->
    {ok, <<2:32/little, 19700:16/little>>};
pack(srv, 19700, {V0_status, V0_timeout}) ->
    D_a_t_a = <<V0_status:8/little, V0_timeout:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19700:16/little,
       D_a_t_a/binary>>};
pack(cli, 19701, {}) ->
    {ok, <<2:32/little, 19701:16/little>>};
pack(srv, 19701, {V0_guild_auction_goods}) ->
    D_a_t_a = <<(length(V0_guild_auction_goods)):16/little,
                (list_to_binary([<<V1_id:32/little,
                                   V1_item_id:32/little, V1_item_num:32/little,
                                   V1_current_price:32/little,
                                   V1_max_price:32/little,
                                   V1_last_bidden:32/little,
                                   V1_bidden:32/little, V1_timeout:32/little,
                                   V1_start_time:32/little, V1_status:8/little,
                                   (length(V1_bidders)):16/little,
                                   (list_to_binary([<<V2_rid:32/little,
                                                      (protocol:pack(string,
                                                                     V2_platform))/binary,
                                                      V2_zone_id:16/little,
                                                      (protocol:pack(string,
                                                                     V2_name))/binary,
                                                      V2_lev:8/little,
                                                      V2_sex:8/little,
                                                      V2_classes:8/little>>
                                                    || #guild_auction_bidder{id
                                                                                 =
                                                                                 {V2_rid,
                                                                                  V2_platform,
                                                                                  V2_zone_id},
                                                                             name
                                                                                 =
                                                                                 V2_name,
                                                                             lev
                                                                                 =
                                                                                 V2_lev,
                                                                             sex
                                                                                 =
                                                                                 V2_sex,
                                                                             classes
                                                                                 =
                                                                                 V2_classes}
                                                           <- V1_bidders]))/binary>>
                                 || #guild_auction_goods{id = V1_id,
                                                         item_id = V1_item_id,
                                                         item_num = V1_item_num,
                                                         current_price =
                                                             V1_current_price,
                                                         max_price =
                                                             V1_max_price,
                                                         last_bidden =
                                                             V1_last_bidden,
                                                         bidden = V1_bidden,
                                                         timeout = V1_timeout,
                                                         start_time =
                                                             V1_start_time,
                                                         status = V1_status,
                                                         bidders = V1_bidders}
                                        <- V0_guild_auction_goods]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19701:16/little,
       D_a_t_a/binary>>};
pack(cli, 19702, {}) ->
    {ok, <<2:32/little, 19702:16/little>>};
pack(srv, 19702, {V0_guild_auction_goods}) ->
    D_a_t_a = <<(length(V0_guild_auction_goods)):16/little,
                (list_to_binary([<<V1_id:32/little,
                                   V1_item_id:32/little, V1_item_num:32/little,
                                   V1_current_price:32/little,
                                   V1_max_price:32/little,
                                   V1_last_bidden:32/little,
                                   V1_bidden:32/little, V1_timeout:32/little,
                                   V1_start_time:32/little, V1_status:8/little,
                                   (length(V1_bidders)):16/little,
                                   (list_to_binary([<<V2_rid:32/little,
                                                      (protocol:pack(string,
                                                                     V2_platform))/binary,
                                                      V2_zone_id:16/little,
                                                      (protocol:pack(string,
                                                                     V2_name))/binary,
                                                      V2_lev:8/little,
                                                      V2_sex:8/little,
                                                      V2_classes:8/little>>
                                                    || #guild_auction_bidder{id
                                                                                 =
                                                                                 {V2_rid,
                                                                                  V2_platform,
                                                                                  V2_zone_id},
                                                                             name
                                                                                 =
                                                                                 V2_name,
                                                                             lev
                                                                                 =
                                                                                 V2_lev,
                                                                             sex
                                                                                 =
                                                                                 V2_sex,
                                                                             classes
                                                                                 =
                                                                                 V2_classes}
                                                           <- V1_bidders]))/binary>>
                                 || #guild_auction_goods{id = V1_id,
                                                         item_id = V1_item_id,
                                                         item_num = V1_item_num,
                                                         current_price =
                                                             V1_current_price,
                                                         max_price =
                                                             V1_max_price,
                                                         last_bidden =
                                                             V1_last_bidden,
                                                         bidden = V1_bidden,
                                                         timeout = V1_timeout,
                                                         start_time =
                                                             V1_start_time,
                                                         status = V1_status,
                                                         bidders = V1_bidders}
                                        <- V0_guild_auction_goods]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19702:16/little,
       D_a_t_a/binary>>};
pack(cli, 19703, {V0_id, V0_price}) ->
    D_a_t_a = <<V0_id:32/little, V0_price:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19703:16/little,
       D_a_t_a/binary>>};
pack(srv, 19703, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19703:16/little,
       D_a_t_a/binary>>};
pack(cli, 19704, {}) ->
    {ok, <<2:32/little, 19704:16/little>>};
pack(srv, 19704, {V0_subscriptions}) ->
    D_a_t_a = <<(length(V0_subscriptions)):16/little,
                (list_to_binary([<<V1_id:32/little>>
                                 || V1_id <- V0_subscriptions]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19704:16/little,
       D_a_t_a/binary>>};
pack(cli, 19705, {V0_id}) ->
    D_a_t_a = <<V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19705:16/little,
       D_a_t_a/binary>>};
pack(srv, 19705, {V0_flag, V0_msg, V0_id}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary,
                V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19705:16/little,
       D_a_t_a/binary>>};
pack(cli, 19706, {V0_id}) ->
    D_a_t_a = <<V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19706:16/little,
       D_a_t_a/binary>>};
pack(srv, 19706, {V0_flag, V0_msg, V0_id}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary,
                V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19706:16/little,
       D_a_t_a/binary>>};
pack(cli, 19707, {}) ->
    {ok, <<2:32/little, 19707:16/little>>};
pack(srv, 19707, {V0_guild_auction_goods}) ->
    D_a_t_a = <<(length(V0_guild_auction_goods)):16/little,
                (list_to_binary([<<V1_id:32/little,
                                   V1_item_id:32/little, V1_item_num:32/little,
                                   V1_current_price:32/little,
                                   V1_max_price:32/little,
                                   V1_last_bidden:32/little,
                                   V1_bidden:32/little, V1_timeout:32/little,
                                   V1_start_time:32/little, V1_status:8/little,
                                   (length(V1_bidders)):16/little,
                                   (list_to_binary([<<V2_rid:32/little,
                                                      (protocol:pack(string,
                                                                     V2_platform))/binary,
                                                      V2_zone_id:16/little,
                                                      (protocol:pack(string,
                                                                     V2_name))/binary,
                                                      V2_lev:8/little,
                                                      V2_sex:8/little,
                                                      V2_classes:8/little>>
                                                    || #guild_auction_bidder{id
                                                                                 =
                                                                                 {V2_rid,
                                                                                  V2_platform,
                                                                                  V2_zone_id},
                                                                             name
                                                                                 =
                                                                                 V2_name,
                                                                             lev
                                                                                 =
                                                                                 V2_lev,
                                                                             sex
                                                                                 =
                                                                                 V2_sex,
                                                                             classes
                                                                                 =
                                                                                 V2_classes}
                                                           <- V1_bidders]))/binary>>
                                 || #guild_auction_goods{id = V1_id,
                                                         item_id = V1_item_id,
                                                         item_num = V1_item_num,
                                                         current_price =
                                                             V1_current_price,
                                                         max_price =
                                                             V1_max_price,
                                                         last_bidden =
                                                             V1_last_bidden,
                                                         bidden = V1_bidden,
                                                         timeout = V1_timeout,
                                                         start_time =
                                                             V1_start_time,
                                                         status = V1_status,
                                                         bidders = V1_bidders}
                                        <- V0_guild_auction_goods]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19707:16/little,
       D_a_t_a/binary>>};
pack(_Type, Code, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
             binary()) -> {ok, tuple()} |
                          {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(srv, 19700, _B0) -> {ok, {}};
unpack(cli, 19700, _B0) ->
    {V1_status, _B1} = protocol:uint8(_B0),
    {V1_timeout, _B2} = protocol:uint32(_B1),
    {ok, {V1_status, V1_timeout}};
unpack(srv, 19701, _B0) -> {ok, {}};
unpack(cli, 19701, _B0) ->
    {V1_guild_auction_goods, _B23} = protocol:array(_B0,
                                                    fun (_B1) ->
                                                            {V2_id, _B2} =
                                                                protocol:uint32(_B1),
                                                            {V2_item_id, _B3} =
                                                                protocol:uint32(_B2),
                                                            {V2_item_num, _B4} =
                                                                protocol:uint32(_B3),
                                                            {V2_current_price,
                                                             _B5} =
                                                                protocol:uint32(_B4),
                                                            {V2_max_price,
                                                             _B6} =
                                                                protocol:uint32(_B5),
                                                            {V2_last_bidden,
                                                             _B7} =
                                                                protocol:uint32(_B6),
                                                            {V2_bidden, _B8} =
                                                                protocol:uint32(_B7),
                                                            {V2_timeout, _B9} =
                                                                protocol:uint32(_B8),
                                                            {V2_start_time,
                                                             _B10} =
                                                                protocol:uint32(_B9),
                                                            {V2_status, _B11} =
                                                                protocol:uint8(_B10),
                                                            {V2_bidders, _B21} =
                                                                protocol:array(_B11,
                                                                               fun
                                                                                   (_B12) ->
                                                                                       {V3_rid,
                                                                                        _B13} =
                                                                                           protocol:uint32(_B12),
                                                                                       {V3_platform,
                                                                                        _B14} =
                                                                                           protocol:string(_B13),
                                                                                       {V3_zone_id,
                                                                                        _B15} =
                                                                                           protocol:uint16(_B14),
                                                                                       {V3_name,
                                                                                        _B16} =
                                                                                           protocol:string(_B15),
                                                                                       {V3_lev,
                                                                                        _B17} =
                                                                                           protocol:uint8(_B16),
                                                                                       {V3_sex,
                                                                                        _B18} =
                                                                                           protocol:uint8(_B17),
                                                                                       {V3_classes,
                                                                                        _B19} =
                                                                                           protocol:uint8(_B18),
                                                                                       {{V3_rid,
                                                                                         V3_platform,
                                                                                         V3_zone_id,
                                                                                         V3_name,
                                                                                         V3_lev,
                                                                                         V3_sex,
                                                                                         V3_classes},
                                                                                        _B19}
                                                                               end),
                                                            {{V2_id,
                                                              V2_item_id,
                                                              V2_item_num,
                                                              V2_current_price,
                                                              V2_max_price,
                                                              V2_last_bidden,
                                                              V2_bidden,
                                                              V2_timeout,
                                                              V2_start_time,
                                                              V2_status,
                                                              V2_bidders},
                                                             _B21}
                                                    end),
    {ok, {V1_guild_auction_goods}};
unpack(srv, 19702, _B0) -> {ok, {}};
unpack(cli, 19702, _B0) ->
    {V1_guild_auction_goods, _B23} = protocol:array(_B0,
                                                    fun (_B1) ->
                                                            {V2_id, _B2} =
                                                                protocol:uint32(_B1),
                                                            {V2_item_id, _B3} =
                                                                protocol:uint32(_B2),
                                                            {V2_item_num, _B4} =
                                                                protocol:uint32(_B3),
                                                            {V2_current_price,
                                                             _B5} =
                                                                protocol:uint32(_B4),
                                                            {V2_max_price,
                                                             _B6} =
                                                                protocol:uint32(_B5),
                                                            {V2_last_bidden,
                                                             _B7} =
                                                                protocol:uint32(_B6),
                                                            {V2_bidden, _B8} =
                                                                protocol:uint32(_B7),
                                                            {V2_timeout, _B9} =
                                                                protocol:uint32(_B8),
                                                            {V2_start_time,
                                                             _B10} =
                                                                protocol:uint32(_B9),
                                                            {V2_status, _B11} =
                                                                protocol:uint8(_B10),
                                                            {V2_bidders, _B21} =
                                                                protocol:array(_B11,
                                                                               fun
                                                                                   (_B12) ->
                                                                                       {V3_rid,
                                                                                        _B13} =
                                                                                           protocol:uint32(_B12),
                                                                                       {V3_platform,
                                                                                        _B14} =
                                                                                           protocol:string(_B13),
                                                                                       {V3_zone_id,
                                                                                        _B15} =
                                                                                           protocol:uint16(_B14),
                                                                                       {V3_name,
                                                                                        _B16} =
                                                                                           protocol:string(_B15),
                                                                                       {V3_lev,
                                                                                        _B17} =
                                                                                           protocol:uint8(_B16),
                                                                                       {V3_sex,
                                                                                        _B18} =
                                                                                           protocol:uint8(_B17),
                                                                                       {V3_classes,
                                                                                        _B19} =
                                                                                           protocol:uint8(_B18),
                                                                                       {{V3_rid,
                                                                                         V3_platform,
                                                                                         V3_zone_id,
                                                                                         V3_name,
                                                                                         V3_lev,
                                                                                         V3_sex,
                                                                                         V3_classes},
                                                                                        _B19}
                                                                               end),
                                                            {{V2_id,
                                                              V2_item_id,
                                                              V2_item_num,
                                                              V2_current_price,
                                                              V2_max_price,
                                                              V2_last_bidden,
                                                              V2_bidden,
                                                              V2_timeout,
                                                              V2_start_time,
                                                              V2_status,
                                                              V2_bidders},
                                                             _B21}
                                                    end),
    {ok, {V1_guild_auction_goods}};
unpack(srv, 19703, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_price, _B2} = protocol:uint32(_B1),
    {ok, {V1_id, V1_price}};
unpack(cli, 19703, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 19704, _B0) -> {ok, {}};
unpack(cli, 19704, _B0) ->
    {V1_subscriptions, _B4} = protocol:array(_B0,
                                             fun (_B1) ->
                                                     {V2_id, _B2} =
                                                         protocol:uint32(_B1),
                                                     {{V2_id}, _B2}
                                             end),
    {ok, {V1_subscriptions}};
unpack(srv, 19705, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_id}};
unpack(cli, 19705, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_flag, V1_msg, V1_id}};
unpack(srv, 19706, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_id}};
unpack(cli, 19706, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_flag, V1_msg, V1_id}};
unpack(srv, 19707, _B0) -> {ok, {}};
unpack(cli, 19707, _B0) ->
    {V1_guild_auction_goods, _B23} = protocol:array(_B0,
                                                    fun (_B1) ->
                                                            {V2_id, _B2} =
                                                                protocol:uint32(_B1),
                                                            {V2_item_id, _B3} =
                                                                protocol:uint32(_B2),
                                                            {V2_item_num, _B4} =
                                                                protocol:uint32(_B3),
                                                            {V2_current_price,
                                                             _B5} =
                                                                protocol:uint32(_B4),
                                                            {V2_max_price,
                                                             _B6} =
                                                                protocol:uint32(_B5),
                                                            {V2_last_bidden,
                                                             _B7} =
                                                                protocol:uint32(_B6),
                                                            {V2_bidden, _B8} =
                                                                protocol:uint32(_B7),
                                                            {V2_timeout, _B9} =
                                                                protocol:uint32(_B8),
                                                            {V2_start_time,
                                                             _B10} =
                                                                protocol:uint32(_B9),
                                                            {V2_status, _B11} =
                                                                protocol:uint8(_B10),
                                                            {V2_bidders, _B21} =
                                                                protocol:array(_B11,
                                                                               fun
                                                                                   (_B12) ->
                                                                                       {V3_rid,
                                                                                        _B13} =
                                                                                           protocol:uint32(_B12),
                                                                                       {V3_platform,
                                                                                        _B14} =
                                                                                           protocol:string(_B13),
                                                                                       {V3_zone_id,
                                                                                        _B15} =
                                                                                           protocol:uint16(_B14),
                                                                                       {V3_name,
                                                                                        _B16} =
                                                                                           protocol:string(_B15),
                                                                                       {V3_lev,
                                                                                        _B17} =
                                                                                           protocol:uint8(_B16),
                                                                                       {V3_sex,
                                                                                        _B18} =
                                                                                           protocol:uint8(_B17),
                                                                                       {V3_classes,
                                                                                        _B19} =
                                                                                           protocol:uint8(_B18),
                                                                                       {{V3_rid,
                                                                                         V3_platform,
                                                                                         V3_zone_id,
                                                                                         V3_name,
                                                                                         V3_lev,
                                                                                         V3_sex,
                                                                                         V3_classes},
                                                                                        _B19}
                                                                               end),
                                                            {{V2_id,
                                                              V2_item_id,
                                                              V2_item_num,
                                                              V2_current_price,
                                                              V2_max_price,
                                                              V2_last_bidden,
                                                              V2_bidden,
                                                              V2_timeout,
                                                              V2_start_time,
                                                              V2_status,
                                                              V2_bidders},
                                                             _B21}
                                                    end),
    {ok, {V1_guild_auction_goods}};
unpack(_Type, Code, _Data) ->
    {error, {unknown_unpack_command, Code}}.

