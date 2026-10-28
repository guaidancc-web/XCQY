-file("src/proto/proto_141.erl", 1).

-module(proto_141).

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

-file("src/proto/proto_141.erl", 14).

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

-file("src/proto/proto_141.erl", 15).

-file("inc/campaign.hrl", 1).

-record(campaign_eggs,
        {ver = 0,
         location = 0 :: non_neg_integer(),
         footprints = [],
         last_moved = 0 :: non_neg_integer(),
         rolled = 0 :: non_neg_integer(),
         rewarded = []}).

-record(camp_login,
        {camp_id = 0,
         m_time = 0,
         num = 0,
         days = [],
         buys = []}).

-record(camp_login_data,
        {day = 0, reward = [], buys = [], cost = []}).

-record(camp_login_buy_data,
        {id = 0, reward = [], cost = [], cd = 0}).

-record(campaign_bags,
        {ver = 0,
         collected = [],
         last_filled = 0 :: non_neg_integer(),
         rewarded = 0}).

-record(campaign_card,
        {ver = 0,
         card_ver = 0,
         init = 0,
         times = 0,
         card_list = []}).

-record(campaign_card_open,
        {ver = 0,
         card_ver = 0,
         times = 0,
         init = 0,
         card_list = []}).

-record(camp_wish_flower,
        {ver = 1,
         floor = 1,
         times = 0,
         all_times = 0,
         camp_id = 0}).

-record(camp_new_flop,
        {ver = 1,
         group = 0,
         times = 0,
         rewarded = [],
         camp_id = 0}).

-record(camp_consume_rebate,
        {ver = 1, limit_item = []}).

-record(camp_new_acc_charge,
        {ver = 1, charge_val = 0, get_reward = []}).

-record(camp_charge_seven_gift,
        {ver = 1, id = 0, buy_time = 0, can_reward = []}).

-record(camp_lucky_tree,
        {id = 0,
         times = 0,
         reward_list = [],
         delay_reward = []}).

-record(camp_long_active,
        {ver = 1,
         id = 0,
         lev = 0,
         token_list = [],
         reward_levs = [],
         week_box = 0,
         last_reset_time = 0}).

-record(m_campaign,
        {ver = 27,
         acc = [] :: list(),
         can_reward = [] :: list(),
         rewarded = [] :: list(),
         eggs = #campaign_eggs{},
         bags = #campaign_bags{},
         first_charge_double = [],
         camp_login = #camp_login{},
         hide_seek,
         login_roll,
         recharge = camp_series_recharge:init(),
         camp_card = #campaign_card{},
         wish_times = 0,
         camp_limit = [],
         camp_card_open = #campaign_card_open{},
         recharge_open = camp_series_recharge_open:init(),
         camp_wish_flower = #camp_wish_flower{},
         camp_doll = camp_doll:init(),
         camp_sign,
         camp_exchange,
         camp_animal_chess,
         camp_new_flop = #camp_new_flop{},
         multiplex_assert = 0,
         camp_consume_rebate = camp_consume_rebate:init(),
         camp_black_white_chess =
             camp_black_white_chess_mgr:init(),
         camp_scratch_card = camp_scratch_card:init(),
         camp_new_acc_charge = camp_new_acc_charge:init(),
         camp_charge_seven_gift = camp_charge_seven_gift:init(),
         camp_lucky_tree = camp_lucky_tree:init(),
         camp_long_active = camp_long_active:init(),
         gift_custom = camp_gift_custom:init()}).

-record(campaign_handle,
        {time = 0 :: non_neg_integer(),
         evt = {evt_rpc} :: tuple(),
         call_from = rpc :: evt | rpc,
         add_can_reward = 0 :: non_neg_integer(),
         camp :: undefined | tuple(),
         camp_info :: undefined | tuple(),
         push_list = [] :: [tuple()],
         push_cli = 0 :: 0..1,
         rpc_reward_num = 1 :: non_neg_integer(),
         return_acc = 0}).

-record(camp_collection,
        {camp_end_time = 0,
         reward_list = [],
         extra_data = [],
         random_index,
         red_dot}).

-record(camp_ico,
        {id = 0 :: non_neg_integer(),
         ico_id = 0 :: non_neg_integer(),
         name = "",
         is_show = 0 :: 0..1,
         start_time = 0 :: non_neg_integer() | tuple(),
         end_time = 0 :: non_neg_integer() | tuple(),
         white_list = [] :: list(),
         black_list = [] :: list(),
         min_open_time = 0 :: non_neg_integer() | tuple(),
         max_open_time = 0 :: non_neg_integer() | tuple()}).

-record(camp_cfg,
        {id = 0 :: non_neg_integer(),
         name = "" :: bitstring(),
         group_id = 0 :: non_neg_integer(),
         start_time = 0 :: non_neg_integer() | tuple(),
         end_time = 0 :: non_neg_integer() | tuple(),
         cli_start_time = 0 :: non_neg_integer() | tuple(),
         cli_end_time = 0 :: non_neg_integer() | tuple(),
         type = 0 :: pos_integer(),
         sec_type = 0 :: non_neg_integer(),
         status = 1 :: 0..1,
         reward_type = 2 :: pos_integer(),
         settlement = 2 :: non_neg_integer(),
         reward_title = "" :: bitstring(),
         reward_content = "" :: bitstring(),
         loss_items = [] :: list(),
         auto_buy = 0,
         reward = [] :: list(),
         camp_cond :: undefined | tuple(),
         reward_max = 1 :: non_neg_integer(),
         white_list = [] :: list(),
         black_list = [] :: list(),
         min_open_time = 0 :: non_neg_integer() | tuple(),
         max_open_time = 0 :: non_neg_integer() | tuple(),
         finish_id = 0 :: non_neg_integer(),
         finish_days = 0 :: non_neg_integer(),
         finish_end_days = 0 :: non_neg_integer(),
         cond_reward = [],
         merge_min = 0,
         merge_max = 0,
         is_keep_time = 0}).

-record(camp_cache,
        {id = 0 :: non_neg_integer(),
         sec_type = 0 :: non_neg_integer(),
         is_srv_open = 0 :: 0..1,
         start_time = 0 :: non_neg_integer(),
         end_time = 0 :: non_neg_integer(),
         cli_start_time = 0 :: non_neg_integer(),
         cli_end_time = 0 :: non_neg_integer()}).

-record(camp_unit,
        {id = {0, 0}, base_id = 0, map_id = 0}).

-record(camp_time,
        {id = 0, start_time = 0, end_time = 0}).

-record(camp_item,
        {item = 0,
         start_time = 0,
         end_time = 0,
         open = 0,
         msg = 0}).

-record(camp_assets_data,
        {type = 0, items = [], max = 0, var_type = day}).

-record(camp_gift_custom,
        {ver = 1,
         camp_id = 0,
         gift = [],
         buy = [],
         extra_reward = 0}).

-file("src/proto/proto_141.erl", 16).

-spec pack(srv | cli, non_neg_integer(),
           tuple()) -> {ok, binary()} |
                       {error, {unknown_pack_command, non_neg_integer()}}.

pack(cli, 14100, {}) ->
    {ok, <<2:32/little, 14100:16/little>>};
pack(srv, 14100, {V0_seven_day}) ->
    D_a_t_a = <<(length(V0_seven_day)):16/little,
                (list_to_binary([<<V1_year:16/little, V1_month:8/little,
                                   V1_day:8/little, V1_order:8/little,
                                   V1_rewarded:8/little>>
                                 || {{V1_year, V1_month, V1_day},
                                     V1_order,
                                     V1_rewarded}
                                        <- V0_seven_day]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14100:16/little,
       D_a_t_a/binary>>};
pack(cli, 14101, {V0_order}) ->
    D_a_t_a = <<V0_order:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14101:16/little,
       D_a_t_a/binary>>};
pack(srv, 14101, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14101:16/little,
       D_a_t_a/binary>>};
pack(cli, 14102, {}) ->
    {ok, <<2:32/little, 14102:16/little>>};
pack(srv, 14102,
     {V0_signed,
      V0_last_time,
      V0_log,
      V0_flag,
      V0_add_sign,
      V0_rand_reward,
      V0_rand_num,
      V0_continue_num,
      V0_repeatflag}) ->
    D_a_t_a = <<V0_signed:8/little, V0_last_time:32/little,
                (length(V0_log)):16/little,
                (list_to_binary([<<V1_year:16/little, V1_month:8/little,
                                   V1_day:8/little, V1_rewarded:8/little>>
                                 || {{V1_year, V1_month, V1_day}, V1_rewarded}
                                        <- V0_log]))/binary,
                V0_flag:8/little, V0_add_sign:32/little,
                V0_rand_reward:32/little, V0_rand_num:32/little,
                V0_continue_num:32/little, V0_repeatflag:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14102:16/little,
       D_a_t_a/binary>>};
pack(cli, 14103, {}) ->
    {ok, <<2:32/little, 14103:16/little>>};
pack(srv, 14103, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14103:16/little,
       D_a_t_a/binary>>};
pack(cli, 14104, {}) ->
    {ok, <<2:32/little, 14104:16/little>>};
pack(srv, 14104, {V0_charge_day}) ->
    D_a_t_a = <<(length(V0_charge_day)):16/little,
                (list_to_binary([<<V1_order:8/little,
                                   V1_rewarded:8/little>>
                                 || {V1_order, V1_rewarded}
                                        <- V0_charge_day]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14104:16/little,
       D_a_t_a/binary>>};
pack(cli, 14105, {V0_order}) ->
    D_a_t_a = <<V0_order:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14105:16/little,
       D_a_t_a/binary>>};
pack(srv, 14105, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14105:16/little,
       D_a_t_a/binary>>};
pack(cli, 14106, {}) ->
    {ok, <<2:32/little, 14106:16/little>>};
pack(srv, 14106, {V0_day_charge}) ->
    D_a_t_a = <<V0_day_charge:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14106:16/little,
       D_a_t_a/binary>>};
pack(cli, 14107, {}) ->
    {ok, <<2:32/little, 14107:16/little>>};
pack(srv, 14107, {V0_discount_info}) ->
    D_a_t_a = <<(length(V0_discount_info)):16/little,
                (list_to_binary([<<V1_id:32/little, V1_count:32/little>>
                                 || {V1_id, V1_count}
                                        <- V0_discount_info]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14107:16/little,
       D_a_t_a/binary>>};
pack(cli, 14108, {V0_type, V0_num}) ->
    D_a_t_a = <<V0_type:32/little, V0_num:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14108:16/little,
       D_a_t_a/binary>>};
pack(srv, 14108, {V0_flag, V0_msg, V0_type, V0_id}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary,
                V0_type:32/little, V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14108:16/little,
       D_a_t_a/binary>>};
pack(cli, 14109, {}) ->
    {ok, <<2:32/little, 14109:16/little>>};
pack(srv, 14109, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 14109:16/little,
       D_a_t_a/binary>>};
pack(_Type, Code, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
             binary()) -> {ok, tuple()} |
                          {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(srv, 14100, _B0) -> {ok, {}};
unpack(cli, 14100, _B0) ->
    {V1_seven_day, _B8} = protocol:array(_B0,
                                         fun (_B1) ->
                                                 {V2_year, _B2} =
                                                     protocol:uint16(_B1),
                                                 {V2_month, _B3} =
                                                     protocol:uint8(_B2),
                                                 {V2_day, _B4} =
                                                     protocol:uint8(_B3),
                                                 {V2_order, _B5} =
                                                     protocol:uint8(_B4),
                                                 {V2_rewarded, _B6} =
                                                     protocol:uint8(_B5),
                                                 {{V2_year,
                                                   V2_month,
                                                   V2_day,
                                                   V2_order,
                                                   V2_rewarded},
                                                  _B6}
                                         end),
    {ok, {V1_seven_day}};
unpack(srv, 14101, _B0) ->
    {V1_order, _B1} = protocol:uint8(_B0),
    {ok, {V1_order}};
unpack(cli, 14101, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 14102, _B0) -> {ok, {}};
unpack(cli, 14102, _B0) ->
    {V1_signed, _B1} = protocol:uint8(_B0),
    {V1_last_time, _B2} = protocol:uint32(_B1),
    {V1_log, _B9} = protocol:array(_B2,
                                   fun (_B3) ->
                                           {V2_year, _B4} =
                                               protocol:uint16(_B3),
                                           {V2_month, _B5} =
                                               protocol:uint8(_B4),
                                           {V2_day, _B6} = protocol:uint8(_B5),
                                           {V2_rewarded, _B7} =
                                               protocol:uint8(_B6),
                                           {{V2_year,
                                             V2_month,
                                             V2_day,
                                             V2_rewarded},
                                            _B7}
                                   end),
    {V1_flag, _B10} = protocol:uint8(_B9),
    {V1_add_sign, _B11} = protocol:uint32(_B10),
    {V1_rand_reward, _B12} = protocol:uint32(_B11),
    {V1_rand_num, _B13} = protocol:uint32(_B12),
    {V1_continue_num, _B14} = protocol:uint32(_B13),
    {V1_repeatflag, _B15} = protocol:uint8(_B14),
    {ok,
     {V1_signed,
      V1_last_time,
      V1_log,
      V1_flag,
      V1_add_sign,
      V1_rand_reward,
      V1_rand_num,
      V1_continue_num,
      V1_repeatflag}};
unpack(srv, 14103, _B0) -> {ok, {}};
unpack(cli, 14103, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 14104, _B0) -> {ok, {}};
unpack(cli, 14104, _B0) ->
    {V1_charge_day, _B5} = protocol:array(_B0,
                                          fun (_B1) ->
                                                  {V2_order, _B2} =
                                                      protocol:uint8(_B1),
                                                  {V2_rewarded, _B3} =
                                                      protocol:uint8(_B2),
                                                  {{V2_order, V2_rewarded}, _B3}
                                          end),
    {ok, {V1_charge_day}};
unpack(srv, 14105, _B0) ->
    {V1_order, _B1} = protocol:uint8(_B0),
    {ok, {V1_order}};
unpack(cli, 14105, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 14106, _B0) -> {ok, {}};
unpack(cli, 14106, _B0) ->
    {V1_day_charge, _B1} = protocol:uint32(_B0),
    {ok, {V1_day_charge}};
unpack(srv, 14107, _B0) -> {ok, {}};
unpack(cli, 14107, _B0) ->
    {V1_discount_info, _B5} = protocol:array(_B0,
                                             fun (_B1) ->
                                                     {V2_id, _B2} =
                                                         protocol:uint32(_B1),
                                                     {V2_count, _B3} =
                                                         protocol:uint32(_B2),
                                                     {{V2_id, V2_count}, _B3}
                                             end),
    {ok, {V1_discount_info}};
unpack(srv, 14108, _B0) ->
    {V1_type, _B1} = protocol:uint32(_B0),
    {V1_num, _B2} = protocol:uint32(_B1),
    {ok, {V1_type, V1_num}};
unpack(cli, 14108, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_type, _B3} = protocol:uint32(_B2),
    {V1_id, _B4} = protocol:uint32(_B3),
    {ok, {V1_flag, V1_msg, V1_type, V1_id}};
unpack(srv, 14109, _B0) -> {ok, {}};
unpack(cli, 14109, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(_Type, Code, _Data) ->
    {error, {unknown_unpack_command, Code}}.

