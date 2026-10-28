-file("src/proto/proto_113.erl", 1).

-module(proto_113).

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

-file("src/proto/proto_113.erl", 14).

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

-file("src/proto/proto_113.erl", 15).

-file("inc/shop.hrl", 1).

-record(shop_item,
        {id = 0 :: non_neg_integer(),
         base_id = 0 :: non_neg_integer(),
         name = "" :: bitstring(),
         num = 0 :: non_neg_integer(),
         bind = 1,
         sex = 2 :: 0..2,
         lev = 1 :: pos_integer(),
         max_lev = 0 :: pos_integer(),
         classes = 0 :: 0..4,
         min_break = 0,
         max_break = 0,
         price = 1 :: integer(),
         tab = 1 :: pos_integer(),
         tab2 = 0 :: non_neg_integer(),
         label = 0,
         limit_type = normal :: normal | day | week,
         limit_role = 0 :: integer(),
         sort = 0 :: non_neg_integer(),
         assets_type = gold :: atom(),
         discount = 1000 :: non_neg_integer(),
         privilege_lev = 0,
         privilege_role = [],
         rencounter_lev = 0,
         ext_args = "",
         achievement_limit = [],
         market_change = 0}).

-record(shop, {}).

-file("src/proto/proto_113.erl", 16).

-spec pack(srv | cli, non_neg_integer(),
           tuple()) -> {ok, binary()} |
                       {error, {unknown_pack_command, non_neg_integer()}}.

pack(cli, 11300, {}) ->
    {ok, <<2:32/little, 11300:16/little>>};
pack(srv, 11300, {V0_tab, V0_reload}) ->
    D_a_t_a = <<V0_tab:8/little, V0_reload:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11300:16/little,
       D_a_t_a/binary>>};
pack(cli, 11301, {V0_tab}) ->
    D_a_t_a = <<V0_tab:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11301:16/little,
       D_a_t_a/binary>>};
pack(srv, 11301, {V0_tab, V0_itemlist}) ->
    D_a_t_a = <<V0_tab:8/little,
                (length(V0_itemlist)):16/little,
                (list_to_binary([<<V1_tab2:8/little, V1_label:8/little,
                                   V1_id:16/little, V1_base_id:32/little,
                                   V1_num:32/little, V1_price:32/signed-little,
                                   V1_limit_role:16/signed-little,
                                   V1_discount:32/signed-little,
                                   V1_privilege_lev:32/signed-little,
                                   V1_min_break:32/signed-little,
                                   V1_max_break:32/signed-little,
                                   V1_rencounter_lev:32/signed-little,
                                   (protocol:pack(string, V1_ext_args))/binary,
                                   (protocol:pack(string,
                                                  V1_assets_type))/binary,
                                   (protocol:pack(string,
                                                  V1_limit_type))/binary,
                                   V1_sort:32/little,
                                   (length(V1_privilege_role)):16/little,
                                   (list_to_binary([<<V2_p_lev:32/signed-little,
                                                      V2_p_num:32/little>>
                                                    || {V2_p_lev, V2_p_num}
                                                           <- V1_privilege_role]))/binary,
                                   (length(V1_achievement_limit)):16/little,
                                   (list_to_binary([<<V2_min:32/signed-little,
                                                      V2_max:32/signed-little,
                                                      V2_discount:32/signed-little>>
                                                    || {V2_min,
                                                        V2_max,
                                                        V2_discount}
                                                           <- V1_achievement_limit]))/binary>>
                                 || #shop_item{tab2 = V1_tab2, label = V1_label,
                                               id = V1_id, base_id = V1_base_id,
                                               num = V1_num, price = V1_price,
                                               limit_role = V1_limit_role,
                                               discount = V1_discount,
                                               privilege_lev = V1_privilege_lev,
                                               min_break = V1_min_break,
                                               max_break = V1_max_break,
                                               rencounter_lev =
                                                   V1_rencounter_lev,
                                               ext_args = V1_ext_args,
                                               assets_type = V1_assets_type,
                                               limit_type = V1_limit_type,
                                               sort = V1_sort,
                                               privilege_role =
                                                   V1_privilege_role,
                                               achievement_limit =
                                                   V1_achievement_limit}
                                        <- V0_itemlist]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11301:16/little,
       D_a_t_a/binary>>};
pack(cli, 11302, {}) ->
    {ok, <<2:32/little, 11302:16/little>>};
pack(srv, 11302, {V0_buy_info}) ->
    D_a_t_a = <<(length(V0_buy_info)):16/little,
                (list_to_binary([<<V1_id:16/little, V1_num:16/little>>
                                 || {V1_id, V1_num} <- V0_buy_info]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11302:16/little,
       D_a_t_a/binary>>};
pack(cli, 11303, {V0_id, V0_num}) ->
    D_a_t_a = <<V0_id:16/little, V0_num:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11303:16/little,
       D_a_t_a/binary>>};
pack(srv, 11303, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11303:16/little,
       D_a_t_a/binary>>};
pack(_Type, Code, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
             binary()) -> {ok, tuple()} |
                          {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(srv, 11300, _B0) -> {ok, {}};
unpack(cli, 11300, _B0) ->
    {V1_tab, _B1} = protocol:uint8(_B0),
    {V1_reload, _B2} = protocol:uint8(_B1),
    {ok, {V1_tab, V1_reload}};
unpack(srv, 11301, _B0) ->
    {V1_tab, _B1} = protocol:uint8(_B0),
    {ok, {V1_tab}};
unpack(cli, 11301, _B0) ->
    {V1_tab, _B1} = protocol:uint8(_B0),
    {V1_itemlist, _B31} = protocol:array(_B1,
                                         fun (_B2) ->
                                                 {V2_tab2, _B3} =
                                                     protocol:uint8(_B2),
                                                 {V2_label, _B4} =
                                                     protocol:uint8(_B3),
                                                 {V2_id, _B5} =
                                                     protocol:uint16(_B4),
                                                 {V2_base_id, _B6} =
                                                     protocol:uint32(_B5),
                                                 {V2_num, _B7} =
                                                     protocol:uint32(_B6),
                                                 {V2_price, _B8} =
                                                     protocol:int32(_B7),
                                                 {V2_limit_role, _B9} =
                                                     protocol:int16(_B8),
                                                 {V2_discount, _B10} =
                                                     protocol:int32(_B9),
                                                 {V2_privilege_lev, _B11} =
                                                     protocol:int32(_B10),
                                                 {V2_min_break, _B12} =
                                                     protocol:int32(_B11),
                                                 {V2_max_break, _B13} =
                                                     protocol:int32(_B12),
                                                 {V2_rencounter_lev, _B14} =
                                                     protocol:int32(_B13),
                                                 {V2_ext_args, _B15} =
                                                     protocol:string(_B14),
                                                 {V2_assets_type, _B16} =
                                                     protocol:string(_B15),
                                                 {V2_limit_type, _B17} =
                                                     protocol:string(_B16),
                                                 {V2_sort, _B18} =
                                                     protocol:uint32(_B17),
                                                 {V2_privilege_role, _B23} =
                                                     protocol:array(_B18,
                                                                    fun
                                                                        (_B19) ->
                                                                            {V3_p_lev,
                                                                             _B20} =
                                                                                protocol:int32(_B19),
                                                                            {V3_p_num,
                                                                             _B21} =
                                                                                protocol:uint32(_B20),
                                                                            {{V3_p_lev,
                                                                              V3_p_num},
                                                                             _B21}
                                                                    end),
                                                 {V2_achievement_limit, _B29} =
                                                     protocol:array(_B23,
                                                                    fun
                                                                        (_B24) ->
                                                                            {V3_min,
                                                                             _B25} =
                                                                                protocol:int32(_B24),
                                                                            {V3_max,
                                                                             _B26} =
                                                                                protocol:int32(_B25),
                                                                            {V3_discount,
                                                                             _B27} =
                                                                                protocol:int32(_B26),
                                                                            {{V3_min,
                                                                              V3_max,
                                                                              V3_discount},
                                                                             _B27}
                                                                    end),
                                                 {{V2_tab2,
                                                   V2_label,
                                                   V2_id,
                                                   V2_base_id,
                                                   V2_num,
                                                   V2_price,
                                                   V2_limit_role,
                                                   V2_discount,
                                                   V2_privilege_lev,
                                                   V2_min_break,
                                                   V2_max_break,
                                                   V2_rencounter_lev,
                                                   V2_ext_args,
                                                   V2_assets_type,
                                                   V2_limit_type,
                                                   V2_sort,
                                                   V2_privilege_role,
                                                   V2_achievement_limit},
                                                  _B29}
                                         end),
    {ok, {V1_tab, V1_itemlist}};
unpack(srv, 11302, _B0) -> {ok, {}};
unpack(cli, 11302, _B0) ->
    {V1_buy_info, _B5} = protocol:array(_B0,
                                        fun (_B1) ->
                                                {V2_id, _B2} =
                                                    protocol:uint16(_B1),
                                                {V2_num, _B3} =
                                                    protocol:uint16(_B2),
                                                {{V2_id, V2_num}, _B3}
                                        end),
    {ok, {V1_buy_info}};
unpack(srv, 11303, _B0) ->
    {V1_id, _B1} = protocol:uint16(_B0),
    {V1_num, _B2} = protocol:uint32(_B1),
    {ok, {V1_id, V1_num}};
unpack(cli, 11303, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(_Type, Code, _Data) ->
    {error, {unknown_unpack_command, Code}}.

