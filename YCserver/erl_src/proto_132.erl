-file("src/proto/proto_132.erl", 1).

-module(proto_132).

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

-file("src/proto/proto_132.erl", 14).

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

-file("src/proto/proto_132.erl", 15).

-file("inc/fashion.hrl", 1).

-record(m_fashion,
        {ver = 5,
         head = [],
         clothes = [],
         belt = [],
         ring = [],
         head_dyeing = [],
         clothes_dyeing = [],
         head_ornament = [],
         collect_lev = 0,
         collect_val = 0,
         classes_eqm = 0,
         eqm = []}).

-record(fashion_dress_data,
        {base_id = 0,
         name = "",
         type,
         quality = 0,
         classes = 0,
         sex = 2,
         lev,
         set_id = 0,
         texture_id = 0,
         is_origin = 0,
         loss = [],
         attrs = [],
         score = 0,
         can_use = 0,
         model_id = 0}).

-record(fashion_wear_data,
        {id = 0,
         base_id = 0,
         expire_type = 0,
         expire_time = 0}).

-record(fashion_dress,
        {base_id = 0,
         expire_type = 0,
         expire_time = 0,
         is_wear = 0}).

-record(fashion_dyeing, {dyeing_id = 0, is_use = 0}).

-record(fashion_time_data,
        {id = 0, expire_type = 0, expire_time = 0}).

-file("src/proto/proto_132.erl", 16).

-spec pack(srv | cli, non_neg_integer(),
           tuple()) -> {ok, binary()} |
                       {error, {unknown_pack_command, non_neg_integer()}}.

pack(cli, 13200, {}) ->
    {ok, <<2:32/little, 13200:16/little>>};
pack(srv, 13200,
     {V0_dress,
      V0_dyeing,
      V0_collect_lev,
      V0_collect_val,
      V0_classes_eqm,
      V0_weapon,
      V0_flag}) ->
    D_a_t_a = <<(length(V0_dress)):16/little,
                (list_to_binary([<<V1_dress_type:8/little,
                                   (length(V1_fashion_dress)):16/little,
                                   (list_to_binary([<<V2_base_id:32/little,
                                                      V2_is_wear:8/little,
                                                      V2_expire_time:32/little>>
                                                    || #fashion_dress{base_id =
                                                                          V2_base_id,
                                                                      is_wear =
                                                                          V2_is_wear,
                                                                      expire_time
                                                                          =
                                                                          V2_expire_time}
                                                           <- V1_fashion_dress]))/binary>>
                                 || {V1_dress_type, V1_fashion_dress}
                                        <- V0_dress]))/binary,
                (length(V0_dyeing)):16/little,
                (list_to_binary([<<V1_dyeing_type:8/little,
                                   (length(V1_fashion_dyeing)):16/little,
                                   (list_to_binary([<<V2_dyeing_id:32/little,
                                                      V2_is_use:8/little>>
                                                    || #fashion_dyeing{dyeing_id
                                                                           =
                                                                           V2_dyeing_id,
                                                                       is_use =
                                                                           V2_is_use}
                                                           <- V1_fashion_dyeing]))/binary>>
                                 || {V1_dyeing_type, V1_fashion_dyeing}
                                        <- V0_dyeing]))/binary,
                V0_collect_lev:8/little, V0_collect_val:16/little,
                V0_classes_eqm:16/little, V0_weapon:32/little,
                V0_flag:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 13200:16/little,
       D_a_t_a/binary>>};
pack(cli, 13201,
     {V0_hair_dyeing,
      V0_hair_base_id,
      V0_clothes_dyeing,
      V0_clothes_base_id}) ->
    D_a_t_a = <<V0_hair_dyeing:32/little,
                V0_hair_base_id:32/little, V0_clothes_dyeing:32/little,
                V0_clothes_base_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 13201:16/little,
       D_a_t_a/binary>>};
pack(srv, 13201, {V0_dress, V0_dyeing}) ->
    D_a_t_a = <<(length(V0_dress)):16/little,
                (list_to_binary([<<V1_dress_type:8/little,
                                   (length(V1_fashion_dress)):16/little,
                                   (list_to_binary([<<V2_base_id:32/little,
                                                      V2_is_wear:8/little,
                                                      V2_expire_time:32/little>>
                                                    || #fashion_dress{base_id =
                                                                          V2_base_id,
                                                                      is_wear =
                                                                          V2_is_wear,
                                                                      expire_time
                                                                          =
                                                                          V2_expire_time}
                                                           <- V1_fashion_dress]))/binary>>
                                 || {V1_dress_type, V1_fashion_dress}
                                        <- V0_dress]))/binary,
                (length(V0_dyeing)):16/little,
                (list_to_binary([<<V1_dyeing_type:8/little,
                                   (length(V1_fashion_dyeing)):16/little,
                                   (list_to_binary([<<V2_dyeing_id:32/little,
                                                      V2_is_use:8/little>>
                                                    || #fashion_dyeing{dyeing_id
                                                                           =
                                                                           V2_dyeing_id,
                                                                       is_use =
                                                                           V2_is_use}
                                                           <- V1_fashion_dyeing]))/binary>>
                                 || {V1_dyeing_type, V1_fashion_dyeing}
                                        <- V0_dyeing]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 13201:16/little,
       D_a_t_a/binary>>};
pack(cli, 13202,
     {V0_head_ornament, V0_belt_ornament}) ->
    D_a_t_a = <<V0_head_ornament:32/little,
                V0_belt_ornament:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 13202:16/little,
       D_a_t_a/binary>>};
pack(srv, 13202, {V0_falg, V0_msg}) ->
    D_a_t_a = <<V0_falg:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 13202:16/little,
       D_a_t_a/binary>>};
pack(cli, 13203,
     {V0_head_ornament,
      V0_head_time_id,
      V0_belt_ornament,
      V0_belt_time_id}) ->
    D_a_t_a = <<V0_head_ornament:32/little,
                V0_head_time_id:32/little, V0_belt_ornament:32/little,
                V0_belt_time_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 13203:16/little,
       D_a_t_a/binary>>};
pack(srv, 13203, {V0_falg, V0_msg}) ->
    D_a_t_a = <<V0_falg:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 13203:16/little,
       D_a_t_a/binary>>};
pack(cli, 13204, {}) ->
    {ok, <<2:32/little, 13204:16/little>>};
pack(srv, 13204,
     {V0_falg, V0_msg, V0_collect_lev, V0_collect_val}) ->
    D_a_t_a = <<V0_falg:8/little,
                (protocol:pack(string, V0_msg))/binary,
                V0_collect_lev:8/little, V0_collect_val:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 13204:16/little,
       D_a_t_a/binary>>};
pack(cli, 13205, {V0_weapon}) ->
    D_a_t_a = <<V0_weapon:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 13205:16/little,
       D_a_t_a/binary>>};
pack(srv, 13205, {V0_falg, V0_msg}) ->
    D_a_t_a = <<V0_falg:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 13205:16/little,
       D_a_t_a/binary>>};
pack(cli, 13206, {}) ->
    {ok, <<2:32/little, 13206:16/little>>};
pack(srv, 13206, {V0_list}) ->
    D_a_t_a = <<(length(V0_list)):16/little,
                (list_to_binary([<<V1_rid:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:16/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_classes:8/little>>
                                 || {{V1_rid, V1_platform, V1_zone_id},
                                     V1_name,
                                     V1_classes}
                                        <- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 13206:16/little,
       D_a_t_a/binary>>};
pack(cli, 13207, {}) ->
    {ok, <<2:32/little, 13207:16/little>>};
pack(srv, 13207, {V0_list, V0_list1, V0_list2}) ->
    D_a_t_a = <<(length(V0_list)):16/little,
                (list_to_binary([<<V1_rid:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:16/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_classes:8/little>>
                                 || {{V1_rid, V1_platform, V1_zone_id},
                                     V1_name,
                                     V1_classes}
                                        <- V0_list]))/binary,
                (length(V0_list1)):16/little,
                (list_to_binary([<<V1_rid:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:16/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_classes:8/little>>
                                 || {{V1_rid, V1_platform, V1_zone_id},
                                     V1_name,
                                     V1_classes}
                                        <- V0_list1]))/binary,
                (length(V0_list2)):16/little,
                (list_to_binary([<<V1_rid:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:16/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_classes:8/little>>
                                 || {{V1_rid, V1_platform, V1_zone_id},
                                     V1_name,
                                     V1_classes}
                                        <- V0_list2]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 13207:16/little,
       D_a_t_a/binary>>};
pack(cli, 13208, {}) ->
    {ok, <<2:32/little, 13208:16/little>>};
pack(srv, 13208, {V0_base_id}) ->
    D_a_t_a = <<V0_base_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 13208:16/little,
       D_a_t_a/binary>>};
pack(_Type, Code, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
             binary()) -> {ok, tuple()} |
                          {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(srv, 13200, _B0) -> {ok, {}};
unpack(cli, 13200, _B0) ->
    {V1_dress, _B10} = protocol:array(_B0,
                                      fun (_B1) ->
                                              {V2_dress_type, _B2} =
                                                  protocol:uint8(_B1),
                                              {V2_fashion_dress, _B8} =
                                                  protocol:array(_B2,
                                                                 fun (_B3) ->
                                                                         {V3_base_id,
                                                                          _B4} =
                                                                             protocol:uint32(_B3),
                                                                         {V3_is_wear,
                                                                          _B5} =
                                                                             protocol:uint8(_B4),
                                                                         {V3_expire_time,
                                                                          _B6} =
                                                                             protocol:uint32(_B5),
                                                                         {{V3_base_id,
                                                                           V3_is_wear,
                                                                           V3_expire_time},
                                                                          _B6}
                                                                 end),
                                              {{V2_dress_type,
                                                V2_fashion_dress},
                                               _B8}
                                      end),
    {V1_dyeing, _B19} = protocol:array(_B10,
                                       fun (_B11) ->
                                               {V2_dyeing_type, _B12} =
                                                   protocol:uint8(_B11),
                                               {V2_fashion_dyeing, _B17} =
                                                   protocol:array(_B12,
                                                                  fun (_B13) ->
                                                                          {V3_dyeing_id,
                                                                           _B14} =
                                                                              protocol:uint32(_B13),
                                                                          {V3_is_use,
                                                                           _B15} =
                                                                              protocol:uint8(_B14),
                                                                          {{V3_dyeing_id,
                                                                            V3_is_use},
                                                                           _B15}
                                                                  end),
                                               {{V2_dyeing_type,
                                                 V2_fashion_dyeing},
                                                _B17}
                                       end),
    {V1_collect_lev, _B20} = protocol:uint8(_B19),
    {V1_collect_val, _B21} = protocol:uint16(_B20),
    {V1_classes_eqm, _B22} = protocol:uint16(_B21),
    {V1_weapon, _B23} = protocol:uint32(_B22),
    {V1_flag, _B24} = protocol:uint32(_B23),
    {ok,
     {V1_dress,
      V1_dyeing,
      V1_collect_lev,
      V1_collect_val,
      V1_classes_eqm,
      V1_weapon,
      V1_flag}};
unpack(srv, 13201, _B0) ->
    {V1_hair_dyeing, _B1} = protocol:uint32(_B0),
    {V1_hair_base_id, _B2} = protocol:uint32(_B1),
    {V1_clothes_dyeing, _B3} = protocol:uint32(_B2),
    {V1_clothes_base_id, _B4} = protocol:uint32(_B3),
    {ok,
     {V1_hair_dyeing,
      V1_hair_base_id,
      V1_clothes_dyeing,
      V1_clothes_base_id}};
unpack(cli, 13201, _B0) ->
    {V1_dress, _B10} = protocol:array(_B0,
                                      fun (_B1) ->
                                              {V2_dress_type, _B2} =
                                                  protocol:uint8(_B1),
                                              {V2_fashion_dress, _B8} =
                                                  protocol:array(_B2,
                                                                 fun (_B3) ->
                                                                         {V3_base_id,
                                                                          _B4} =
                                                                             protocol:uint32(_B3),
                                                                         {V3_is_wear,
                                                                          _B5} =
                                                                             protocol:uint8(_B4),
                                                                         {V3_expire_time,
                                                                          _B6} =
                                                                             protocol:uint32(_B5),
                                                                         {{V3_base_id,
                                                                           V3_is_wear,
                                                                           V3_expire_time},
                                                                          _B6}
                                                                 end),
                                              {{V2_dress_type,
                                                V2_fashion_dress},
                                               _B8}
                                      end),
    {V1_dyeing, _B19} = protocol:array(_B10,
                                       fun (_B11) ->
                                               {V2_dyeing_type, _B12} =
                                                   protocol:uint8(_B11),
                                               {V2_fashion_dyeing, _B17} =
                                                   protocol:array(_B12,
                                                                  fun (_B13) ->
                                                                          {V3_dyeing_id,
                                                                           _B14} =
                                                                              protocol:uint32(_B13),
                                                                          {V3_is_use,
                                                                           _B15} =
                                                                              protocol:uint8(_B14),
                                                                          {{V3_dyeing_id,
                                                                            V3_is_use},
                                                                           _B15}
                                                                  end),
                                               {{V2_dyeing_type,
                                                 V2_fashion_dyeing},
                                                _B17}
                                       end),
    {ok, {V1_dress, V1_dyeing}};
unpack(srv, 13202, _B0) ->
    {V1_head_ornament, _B1} = protocol:uint32(_B0),
    {V1_belt_ornament, _B2} = protocol:uint32(_B1),
    {ok, {V1_head_ornament, V1_belt_ornament}};
unpack(cli, 13202, _B0) ->
    {V1_falg, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_falg, V1_msg}};
unpack(srv, 13203, _B0) ->
    {V1_head_ornament, _B1} = protocol:uint32(_B0),
    {V1_head_time_id, _B2} = protocol:uint32(_B1),
    {V1_belt_ornament, _B3} = protocol:uint32(_B2),
    {V1_belt_time_id, _B4} = protocol:uint32(_B3),
    {ok,
     {V1_head_ornament,
      V1_head_time_id,
      V1_belt_ornament,
      V1_belt_time_id}};
unpack(cli, 13203, _B0) ->
    {V1_falg, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_falg, V1_msg}};
unpack(srv, 13204, _B0) -> {ok, {}};
unpack(cli, 13204, _B0) ->
    {V1_falg, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_collect_lev, _B3} = protocol:uint8(_B2),
    {V1_collect_val, _B4} = protocol:uint16(_B3),
    {ok, {V1_falg, V1_msg, V1_collect_lev, V1_collect_val}};
unpack(srv, 13205, _B0) ->
    {V1_weapon, _B1} = protocol:uint32(_B0),
    {ok, {V1_weapon}};
unpack(cli, 13205, _B0) ->
    {V1_falg, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_falg, V1_msg}};
unpack(srv, 13206, _B0) -> {ok, {}};
unpack(cli, 13206, _B0) ->
    {V1_list, _B8} = protocol:array(_B0,
                                    fun (_B1) ->
                                            {V2_rid, _B2} =
                                                protocol:uint32(_B1),
                                            {V2_platform, _B3} =
                                                protocol:string(_B2),
                                            {V2_zone_id, _B4} =
                                                protocol:uint16(_B3),
                                            {V2_name, _B5} =
                                                protocol:string(_B4),
                                            {V2_classes, _B6} =
                                                protocol:uint8(_B5),
                                            {{V2_rid,
                                              V2_platform,
                                              V2_zone_id,
                                              V2_name,
                                              V2_classes},
                                             _B6}
                                    end),
    {ok, {V1_list}};
unpack(srv, 13207, _B0) -> {ok, {}};
unpack(cli, 13207, _B0) ->
    {V1_list, _B8} = protocol:array(_B0,
                                    fun (_B1) ->
                                            {V2_rid, _B2} =
                                                protocol:uint32(_B1),
                                            {V2_platform, _B3} =
                                                protocol:string(_B2),
                                            {V2_zone_id, _B4} =
                                                protocol:uint16(_B3),
                                            {V2_name, _B5} =
                                                protocol:string(_B4),
                                            {V2_classes, _B6} =
                                                protocol:uint8(_B5),
                                            {{V2_rid,
                                              V2_platform,
                                              V2_zone_id,
                                              V2_name,
                                              V2_classes},
                                             _B6}
                                    end),
    {V1_list1, _B16} = protocol:array(_B8,
                                      fun (_B9) ->
                                              {V2_rid, _B10} =
                                                  protocol:uint32(_B9),
                                              {V2_platform, _B11} =
                                                  protocol:string(_B10),
                                              {V2_zone_id, _B12} =
                                                  protocol:uint16(_B11),
                                              {V2_name, _B13} =
                                                  protocol:string(_B12),
                                              {V2_classes, _B14} =
                                                  protocol:uint8(_B13),
                                              {{V2_rid,
                                                V2_platform,
                                                V2_zone_id,
                                                V2_name,
                                                V2_classes},
                                               _B14}
                                      end),
    {V1_list2, _B24} = protocol:array(_B16,
                                      fun (_B17) ->
                                              {V2_rid, _B18} =
                                                  protocol:uint32(_B17),
                                              {V2_platform, _B19} =
                                                  protocol:string(_B18),
                                              {V2_zone_id, _B20} =
                                                  protocol:uint16(_B19),
                                              {V2_name, _B21} =
                                                  protocol:string(_B20),
                                              {V2_classes, _B22} =
                                                  protocol:uint8(_B21),
                                              {{V2_rid,
                                                V2_platform,
                                                V2_zone_id,
                                                V2_name,
                                                V2_classes},
                                               _B22}
                                      end),
    {ok, {V1_list, V1_list1, V1_list2}};
unpack(srv, 13208, _B0) -> {ok, {}};
unpack(cli, 13208, _B0) ->
    {V1_base_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_base_id}};
unpack(_Type, Code, _Data) ->
    {error, {unknown_unpack_command, Code}}.

