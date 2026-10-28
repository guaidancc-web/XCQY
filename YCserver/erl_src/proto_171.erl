-file("src/proto/proto_171.erl", 1).

-module(proto_171).

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

-file("src/proto/proto_171.erl", 14).

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

-file("src/proto/proto_171.erl", 15).

-file("inc/handbook.hrl", 1).

-record(m_handbook,
        {ver = 4,
         book_list = [],
         set_list = [],
         auto_book_id = 0,
         store_items = [],
         next_time = 0,
         need_list = [],
         ban_speed_set_list = []}).

-record(handbook_item,
        {idx = 0, id = 0, num = 1, val = 0, flag = 0}).

-record(handbook,
        {ver = 4,
         id = 0,
         status = 0,
         active_step = 0,
         star_step = 0,
         star_val = 0,
         transform_point = 0,
         active_effect_type = 3,
         active_attr = [],
         star_effect_type = 1,
         star_effect_list = [],
         star_attr = [],
         add_point = 0}).

-record(handbook_base,
        {id,
         name = "",
         level_limit = 0,
         lev = 0,
         grade_lev = 1,
         grade_type = 1,
         effect_type = 1,
         active_reward = [],
         set_id = [],
         allow_item = [],
         active_loss = [],
         star_loss = [],
         transform_point = 1,
         max_active_step = 2,
         max_star_step = 2,
         fc = 0,
         fc1 = 0,
         fc2 = 0,
         fuse_flag = 0,
         fuse_id = 0,
         times = 0,
         illusion_id = 0,
         fuse_num1 = 0,
         lev_num1 = 0,
         fuse_num2 = 0,
         lev_num2 = 0,
         fuse_num3 = 0,
         lev_num3 = 0,
         target_id = 0,
         universal = 0,
         bind = 1}).

-file("src/proto/proto_171.erl", 16).

-spec pack(srv | cli, non_neg_integer(),
           tuple()) -> {ok, binary()} |
                       {error, {unknown_pack_command, non_neg_integer()}}.

pack(cli, 17100, {}) ->
    {ok, <<2:32/little, 17100:16/little>>};
pack(srv, 17100,
     {V0_handbook_list, V0_ban_speed_set_list}) ->
    D_a_t_a = <<(length(V0_handbook_list)):16/little,
                (list_to_binary([<<V1_id:32/little, V1_status:8/little,
                                   V1_active_step:8/little,
                                   V1_star_step:8/little, V1_star_val:8/little>>
                                 || #handbook{id = V1_id, status = V1_status,
                                              active_step = V1_active_step,
                                              star_step = V1_star_step,
                                              star_val = V1_star_val}
                                        <- V0_handbook_list]))/binary,
                (length(V0_ban_speed_set_list)):16/little,
                (list_to_binary([<<V1_set_id:8/little>>
                                 || V1_set_id
                                        <- V0_ban_speed_set_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17100:16/little,
       D_a_t_a/binary>>};
pack(cli, 17101, {V0_id, V0_list}) ->
    D_a_t_a = <<V0_id:32/little,
                (length(V0_list)):16/little,
                (list_to_binary([<<V1_base_id:32/little,
                                   V1_num:8/little>>
                                 || {V1_base_id, V1_num} <- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17101:16/little,
       D_a_t_a/binary>>};
pack(srv, 17101, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17101:16/little,
       D_a_t_a/binary>>};
pack(cli, 17102, {}) ->
    {ok, <<2:32/little, 17102:16/little>>};
pack(srv, 17102,
     {#handbook{id = V0_id, status = V0_status,
                active_step = V0_active_step, star_step = V0_star_step,
                star_val = V0_star_val}}) ->
    D_a_t_a = <<V0_id:32/little, V0_status:8/little,
                V0_active_step:8/little, V0_star_step:8/little,
                V0_star_val:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17102:16/little,
       D_a_t_a/binary>>};
pack(cli, 17103, {V0_id, V0_list}) ->
    D_a_t_a = <<V0_id:32/little,
                (length(V0_list)):16/little,
                (list_to_binary([<<V1_base_id:32/little,
                                   V1_num:8/little>>
                                 || {V1_base_id, V1_num} <- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17103:16/little,
       D_a_t_a/binary>>};
pack(srv, 17103, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17103:16/little,
       D_a_t_a/binary>>};
pack(cli, 17106, {}) ->
    {ok, <<2:32/little, 17106:16/little>>};
pack(srv, 17106,
     {#m_handbook{next_time = V0_next_time,
                  store_items = V0_store_items}}) ->
    D_a_t_a = <<V0_next_time:32/little,
                (length(V0_store_items)):16/little,
                (list_to_binary([<<V1_idx:16/little, V1_id:32/little,
                                   V1_num:32/little, V1_val:32/little,
                                   V1_flag:8/little>>
                                 || #handbook_item{idx = V1_idx, id = V1_id,
                                                   num = V1_num, val = V1_val,
                                                   flag = V1_flag}
                                        <- V0_store_items]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17106:16/little,
       D_a_t_a/binary>>};
pack(cli, 17107, {V0_idx}) ->
    D_a_t_a = <<V0_idx:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17107:16/little,
       D_a_t_a/binary>>};
pack(srv, 17107, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17107:16/little,
       D_a_t_a/binary>>};
pack(cli, 17108, {V0_id}) ->
    D_a_t_a = <<V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17108:16/little,
       D_a_t_a/binary>>};
pack(srv, 17108, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17108:16/little,
       D_a_t_a/binary>>};
pack(cli, 17109, {}) ->
    {ok, <<2:32/little, 17109:16/little>>};
pack(srv, 17109, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17109:16/little,
       D_a_t_a/binary>>};
pack(cli, 17110, {V0_id, V0_is_need}) ->
    D_a_t_a = <<V0_id:32/little, V0_is_need:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17110:16/little,
       D_a_t_a/binary>>};
pack(srv, 17110, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17110:16/little,
       D_a_t_a/binary>>};
pack(cli, 17111, {}) ->
    {ok, <<2:32/little, 17111:16/little>>};
pack(srv, 17111, {V0_need_list}) ->
    D_a_t_a = <<(length(V0_need_list)):16/little,
                (list_to_binary([<<V1_id:32/little>>
                                 || V1_id <- V0_need_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17111:16/little,
       D_a_t_a/binary>>};
pack(cli, 17112, {V0_set_id, V0_flag}) ->
    D_a_t_a = <<V0_set_id:8/little, V0_flag:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17112:16/little,
       D_a_t_a/binary>>};
pack(srv, 17112, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17112:16/little,
       D_a_t_a/binary>>};
pack(cli, 17113,
     {V0_handbook_id, V0_item_id, V0_list, V0_attr_id}) ->
    D_a_t_a = <<V0_handbook_id:32/little,
                V0_item_id:32/little, (length(V0_list)):16/little,
                (list_to_binary([<<V1_base_id:32/little,
                                   V1_num:8/little>>
                                 || {V1_base_id, V1_num} <- V0_list]))/binary,
                V0_attr_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17113:16/little,
       D_a_t_a/binary>>};
pack(srv, 17113, {V0_result, V0_id, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little, V0_id:32/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17113:16/little,
       D_a_t_a/binary>>};
pack(cli, 17114, {V0_id, V0_attr_id}) ->
    D_a_t_a = <<V0_id:32/little, V0_attr_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17114:16/little,
       D_a_t_a/binary>>};
pack(srv, 17114, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 17114:16/little,
       D_a_t_a/binary>>};
pack(_Type, Code, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
             binary()) -> {ok, tuple()} |
                          {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(srv, 17100, _B0) -> {ok, {}};
unpack(cli, 17100, _B0) ->
    {V1_handbook_list, _B8} = protocol:array(_B0,
                                             fun (_B1) ->
                                                     {V2_id, _B2} =
                                                         protocol:uint32(_B1),
                                                     {V2_status, _B3} =
                                                         protocol:uint8(_B2),
                                                     {V2_active_step, _B4} =
                                                         protocol:uint8(_B3),
                                                     {V2_star_step, _B5} =
                                                         protocol:uint8(_B4),
                                                     {V2_star_val, _B6} =
                                                         protocol:uint8(_B5),
                                                     {{V2_id,
                                                       V2_status,
                                                       V2_active_step,
                                                       V2_star_step,
                                                       V2_star_val},
                                                      _B6}
                                             end),
    {V1_ban_speed_set_list, _B12} = protocol:array(_B8,
                                                   fun (_B9) ->
                                                           {V2_set_id, _B10} =
                                                               protocol:uint8(_B9),
                                                           {{V2_set_id}, _B10}
                                                   end),
    {ok, {V1_handbook_list, V1_ban_speed_set_list}};
unpack(srv, 17101, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_list, _B6} = protocol:array(_B1,
                                    fun (_B2) ->
                                            {V2_base_id, _B3} =
                                                protocol:uint32(_B2),
                                            {V2_num, _B4} = protocol:uint8(_B3),
                                            {{V2_base_id, V2_num}, _B4}
                                    end),
    {ok, {V1_id, V1_list}};
unpack(cli, 17101, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 17102, _B0) -> {ok, {}};
unpack(cli, 17102, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_status, _B2} = protocol:uint8(_B1),
    {V1_active_step, _B3} = protocol:uint8(_B2),
    {V1_star_step, _B4} = protocol:uint8(_B3),
    {V1_star_val, _B5} = protocol:uint8(_B4),
    {ok,
     {V1_id,
      V1_status,
      V1_active_step,
      V1_star_step,
      V1_star_val}};
unpack(srv, 17103, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_list, _B6} = protocol:array(_B1,
                                    fun (_B2) ->
                                            {V2_base_id, _B3} =
                                                protocol:uint32(_B2),
                                            {V2_num, _B4} = protocol:uint8(_B3),
                                            {{V2_base_id, V2_num}, _B4}
                                    end),
    {ok, {V1_id, V1_list}};
unpack(cli, 17103, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 17106, _B0) -> {ok, {}};
unpack(cli, 17106, _B0) ->
    {V1_next_time, _B1} = protocol:uint32(_B0),
    {V1_store_items, _B9} = protocol:array(_B1,
                                           fun (_B2) ->
                                                   {V2_idx, _B3} =
                                                       protocol:uint16(_B2),
                                                   {V2_id, _B4} =
                                                       protocol:uint32(_B3),
                                                   {V2_num, _B5} =
                                                       protocol:uint32(_B4),
                                                   {V2_val, _B6} =
                                                       protocol:uint32(_B5),
                                                   {V2_flag, _B7} =
                                                       protocol:uint8(_B6),
                                                   {{V2_idx,
                                                     V2_id,
                                                     V2_num,
                                                     V2_val,
                                                     V2_flag},
                                                    _B7}
                                           end),
    {ok, {V1_next_time, V1_store_items}};
unpack(srv, 17107, _B0) ->
    {V1_idx, _B1} = protocol:uint16(_B0),
    {ok, {V1_idx}};
unpack(cli, 17107, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 17108, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_id}};
unpack(cli, 17108, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 17109, _B0) -> {ok, {}};
unpack(cli, 17109, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 17110, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_is_need, _B2} = protocol:uint8(_B1),
    {ok, {V1_id, V1_is_need}};
unpack(cli, 17110, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 17111, _B0) -> {ok, {}};
unpack(cli, 17111, _B0) ->
    {V1_need_list, _B4} = protocol:array(_B0,
                                         fun (_B1) ->
                                                 {V2_id, _B2} =
                                                     protocol:uint32(_B1),
                                                 {{V2_id}, _B2}
                                         end),
    {ok, {V1_need_list}};
unpack(srv, 17112, _B0) ->
    {V1_set_id, _B1} = protocol:uint8(_B0),
    {V1_flag, _B2} = protocol:uint8(_B1),
    {ok, {V1_set_id, V1_flag}};
unpack(cli, 17112, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 17113, _B0) ->
    {V1_handbook_id, _B1} = protocol:uint32(_B0),
    {V1_item_id, _B2} = protocol:uint32(_B1),
    {V1_list, _B7} = protocol:array(_B2,
                                    fun (_B3) ->
                                            {V2_base_id, _B4} =
                                                protocol:uint32(_B3),
                                            {V2_num, _B5} = protocol:uint8(_B4),
                                            {{V2_base_id, V2_num}, _B5}
                                    end),
    {V1_attr_id, _B8} = protocol:uint32(_B7),
    {ok, {V1_handbook_id, V1_item_id, V1_list, V1_attr_id}};
unpack(cli, 17113, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_id, _B2} = protocol:uint32(_B1),
    {V1_msg, _B3} = protocol:string(_B2),
    {ok, {V1_result, V1_id, V1_msg}};
unpack(srv, 17114, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_attr_id, _B2} = protocol:uint32(_B1),
    {ok, {V1_id, V1_attr_id}};
unpack(cli, 17114, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(_Type, Code, _Data) ->
    {error, {unknown_unpack_command, Code}}.

