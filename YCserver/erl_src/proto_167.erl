-file("src/proto/proto_167.erl", 1).

-module(proto_167).

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

-file("src/proto/proto_167.erl", 14).

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

-file("src/proto/proto_167.erl", 15).

-file("inc/auction.hrl", 1).

-record(auction,
        {idx = 0 :: non_neg_integer(),
         item_id = 0 :: non_neg_integer(),
         item_count = 0 :: non_neg_integer(),
         gold = 0 :: non_neg_integer(),
         gold_once = 1 :: non_neg_integer(),
         time = 0 :: non_neg_integer(),
         time_auction = 0 :: non_neg_integer(),
         state = 0 :: non_neg_integer(),
         week = 0 :: non_neg_integer(),
         role_id = {1, "", 0} ::
             {pos_integer(), list(), non_neg_integer()},
         role_name = "" :: list(),
         focus = [] :: list(),
         auto = [] :: list(),
         history = [] :: list()}).

-file("src/proto/proto_167.erl", 16).

-file("inc/role.hrl", 1).

-record(role,
        {ver = 76 :: pos_integer(),
         pid :: undefined | pid(),
         loop_counter = 1 :: pos_integer(),
         is_gain = false,
         need_sync = false :: boolean(),
         time_info = {0, 0} ::
             {non_neg_integer(), non_neg_integer()},
         time_reg = 1 :: pos_integer(),
         ip_reg = {0, 0, 0, 0} :: tuple(),
         ip_last_login = {0, 0, 0, 0} :: tuple(),
         lock_status = 0,
         id = {1, "", 0} ::
             {pos_integer(), list(), non_neg_integer()},
         platform = "" :: list(),
         zone_id = 0 :: non_neg_integer(),
         channel_reg = 0 :: non_neg_integer(),
         dispense = "",
         device_id = "",
         device_type = 1,
         device_key = "",
         account = "" :: list(),
         name = "" :: list(),
         charge = 0 :: non_neg_integer(),
         consume = 0,
         label = 0 :: 0..2,
         sex = 2 :: 0..2,
         classes = 0 :: 0..5,
         lev = 0 :: non_neg_integer(),
         realm = 0 :: non_neg_integer(),
         speed = 0 :: non_neg_integer(),
         hp = 1 :: pos_integer(),
         mp = 1 :: pos_integer(),
         hp_max = 1 :: pos_integer(),
         mp_max = 1 :: pos_integer(),
         face = 1 :: pos_integer(),
         assets :: undefined | tuple(),
         attr :: undefined | tuple(),
         link :: undefined | tuple(),
         trigger = {1, []} :: {pos_integer(), [tuple()]},
         timer :: undefined | tuple(),
         pos :: undefined | tuple(),
         extra = [] :: [{non_neg_integer(), term()}],
         status = 0 :: 0..4,
         s_action = 0 :: non_neg_integer(),
         s_ride = 0 :: 0..3,
         s_event = 0 :: non_neg_integer(),
         s_event_pid = 0 :: 0 | undefined | pid(),
         s_name = 0 :: 0 | 1,
         s_looks = [] ::
             [{non_neg_integer(),
               non_neg_integer(),
               non_neg_integer(),
               bitstring()}],
         s_follow = [] :: [tuple()],
         debug_rpc = false :: boolean(),
         name_used = "" :: string(),
         cross_type = 0,
         m_attr_point,
         m_combat,
         m_quest,
         m_pet,
         m_skill,
         m_var,
         m_guard,
         m_plot,
         m_dungeon,
         m_guild,
         m_home,
         m_option,
         m_wing,
         m_team,
         m_honor,
         m_friend,
         m_wake,
         m_arena,
         m_market_silver,
         m_escort,
         m_buff,
         m_formation,
         m_skill_life,
         m_trial,
         m_fashion,
         m_satiety,
         m_agenda,
         m_parade,
         m_mail = [],
         m_qualifying,
         m_treasure,
         m_campaign,
         m_shipping,
         m_checkin,
         m_tower,
         m_classes_challenge,
         m_fairyland,
         m_glory,
         m_examination,
         m_adm,
         m_alchemy,
         m_pet_store,
         m_store,
         m_achievement,
         m_wedding,
         m_constellation,
         m_investment,
         m_privilege,
         m_limit_return,
         m_pray,
         m_teacher,
         m_help,
         m_achieve_shop,
         m_brave_trial,
         m_camp_dragon_boat,
         m_over_seas,
         m_hook_setting,
         m_tournament,
         m_market_gold,
         m_goal,
         m_family,
         m_charge_gift,
         m_mount,
         m_camp_web,
         m_handbook,
         m_endless_challenge,
         m_lev_break,
         m_head,
         m_extension,
         m_camp_cake,
         m_rainbow_lottery,
         m_sworn,
         m_gods_duel,
         m_preparation,
         m_reward_back,
         m_child,
         m_maze,
         m_raffle,
         m_rencounter,
         m_talisman,
         m_month_gift,
         m_pay_turn,
         m_camp_box,
         m_camp_pay_continus,
         m_spirit_treasure,
         m_camp_discount,
         m_camp_7_7th,
         m_new_expression,
         m_exquisite_shelf,
         m_camp_recharge,
         m_camp_recharge_gift,
         m_camp_collection,
         m_camp_cut_price,
         m_camp_inquiry,
         m_gods_place,
         m_camp_slot_machine,
         m_camp_sign_draw,
         m_agenda_week,
         m_exp_bottle,
         m_camp_zillionaire,
         m_provocation,
         m_oracle_treasure,
         m_camp_pass_flower_language,
         m_camp_score_exchange,
         m_camp_pray,
         p_bag,
         p_store,
         p_eqm,
         p_family_store}).

-record(map_role,
        {pid :: undefined | pid(),
         rid = 0 :: non_neg_integer(),
         platform = "" :: list(),
         zone_id = 0 :: non_neg_integer(),
         name = "" :: list(),
         speed = 1 :: pos_integer(),
         conn_pid :: undefined | pid(),
         map = 0 :: non_neg_integer(),
         grid_pid :: undefined | pid(),
         dir = 0 :: non_neg_integer(),
         x = 0 :: non_neg_integer(),
         y = 0 :: non_neg_integer(),
         gx = 0 :: non_neg_integer(),
         gy = 0 :: non_neg_integer(),
         status = 0 :: non_neg_integer(),
         action = 0 :: non_neg_integer(),
         ride = 0 :: non_neg_integer(),
         event = 0 :: non_neg_integer(),
         hidden = 0 :: 0..1,
         label = 0 :: 0..2,
         lev = 1 :: pos_integer(),
         sex = 0 :: 0..2,
         classes = 0 :: 0..5,
         realm = 0 :: non_neg_integer(),
         face = 1 :: pos_integer(),
         fc = 0 :: non_neg_integer(),
         prop = [] :: [{non_neg_integer(), string()}],
         looks = [] :: list(),
         follow_list = [] :: list(),
         guild = "" :: bitstring(),
         guild_post = "" :: bitstring(),
         guild_signature = "" :: bitstring(),
         guild_id = {0, "", 0} ::
             {non_neg_integer(), bitstring(), non_neg_integer()},
         team_status = 0 :: 0..4,
         team_num = 0,
         lover_rid = 0 :: non_neg_integer(),
         lover_platform = "" :: list(),
         lover_zone_id = 0 :: non_neg_integer(),
         lover_name = "" :: list(),
         lover_status = 0 :: non_neg_integer(),
         team_mark = 401 :: non_neg_integer(),
         foot_mark = 0 :: non_neg_integer()}).

-record(role_info,
        {id = 0 :: non_neg_integer(),
         platform = "" :: list(),
         zone_id = 0 :: non_neg_integer(),
         name = "" :: list(),
         lock_status = 0 :: 0..3,
         lev = 1 :: pos_integer(),
         break_times = 0 :: non_neg_integer(),
         sex = 0 :: 0..2,
         classes = 0 :: 0..5,
         fc = 0 :: pos_integer(),
         guild = "" :: list()}).

-record(role_name_used,
        {ver = 1,
         id = {0, "", 0},
         name = "",
         new_name = "",
         sex = 0,
         classes = 0,
         time = 0}).

-record(role_profile,
        {id = {0, "", 0} :: tuple(),
         name = "" :: list(),
         lev = 1 :: pos_integer(),
         sex = 0 :: 0..2,
         classes = 0 :: 0..5,
         fc = 0 :: pos_integer(),
         face = 0 :: non_neg_integer(),
         guild_id = {0, "", 0} :: tuple(),
         guild_name = "" :: list(),
         looks = [],
         achievement_point = 0 :: non_neg_integer(),
         achievement_assets_point = 0,
         achievement_list = [],
         status = 0 :: 0..4,
         team_status = 0 :: 0..4,
         team_num = 0,
         name_used = "" :: string(),
         honor_id = 0 :: non_neg_integer(),
         lover_name = "" :: string(),
         teacher_name = "" :: string(),
         tournament_lev = 0 :: non_neg_integer(),
         family_id = {0, "", 0} :: tuple(),
         break_times = 0 :: non_neg_integer(),
         pre_honor_id = 0 :: non_neg_integer()}).

-record(role_cache,
        {id = {1, "", 0} ::
             {pos_integer(), bitstring(), non_neg_integer()},
         pid :: undefined | pid(),
         link,
         account = "" :: bitstring(),
         name = "" :: bitstring(),
         label = 0 :: 0..2,
         face = 1,
         sex = 2 :: 0..2,
         classes = 0 :: 0..4,
         lev = 0 :: non_neg_integer(),
         hp = 1 :: pos_integer(),
         mp = 1 :: pos_integer(),
         hp_max = 1 :: pos_integer(),
         mp_max = 1 :: pos_integer(),
         status = 0 :: 0..4,
         s_action = 0 :: non_neg_integer(),
         s_event = 0 :: non_neg_integer(),
         pos,
         channel_reg = 0 :: non_neg_integer()}).

-record(card_state,
        {gold = 0,
         gold_bind = 0,
         buy_time = 0,
         state = 0,
         day = 0,
         day_sum = 0,
         daily_time = 0}).

-record(m_new_expression,
        {s_expression = [], b_expression = []}).

-file("src/proto/proto_167.erl", 17).

-spec pack(srv | cli, non_neg_integer(),
           tuple()) -> {ok, binary()} |
                       {error, {unknown_pack_command, non_neg_integer()}}.

pack(cli, 16700, {}) ->
    {ok, <<2:32/little, 16700:16/little>>};
pack(srv, 16700, {V0_auction_list}) ->
    D_a_t_a = <<(length(V0_auction_list)):16/little,
                (list_to_binary([<<V1_idx:32/little,
                                   V1_item_id:32/little,
                                   V1_item_count:16/little, V1_gold:32/little,
                                   V1_gold_my:32/little, V1_gold_once:16/little,
                                   V1_over_time:32/little, V1_focus:8/little,
                                   V1_state:8/little>>
                                 || {V1_idx,
                                     V1_item_id,
                                     V1_item_count,
                                     V1_gold,
                                     V1_gold_my,
                                     V1_gold_once,
                                     V1_over_time,
                                     V1_focus,
                                     V1_state}
                                        <- V0_auction_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16700:16/little,
       D_a_t_a/binary>>};
pack(cli, 16701, {}) ->
    {ok, <<2:32/little, 16701:16/little>>};
pack(srv, 16701, {V0_list}) ->
    D_a_t_a = <<(length(V0_list)):16/little,
                (list_to_binary([<<V1_idx:32/little,
                                   V1_item_id:32/little,
                                   V1_item_count:16/little, V1_gold:32/little,
                                   V1_gold_my:32/little, V1_gold_once:16/little,
                                   V1_over_time:32/little, V1_state:8/little>>
                                 || {V1_idx,
                                     V1_item_id,
                                     V1_item_count,
                                     V1_gold,
                                     V1_gold_my,
                                     V1_gold_once,
                                     V1_over_time,
                                     V1_state}
                                        <- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16701:16/little,
       D_a_t_a/binary>>};
pack(cli, 16702, {V0_idx}) ->
    D_a_t_a = <<V0_idx:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16702:16/little,
       D_a_t_a/binary>>};
pack(srv, 16702, {V0_idx, V0_focus}) ->
    D_a_t_a = <<V0_idx:32/little, V0_focus:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16702:16/little,
       D_a_t_a/binary>>};
pack(cli, 16703, {V0_idx, V0_gold_add, V0_gold}) ->
    D_a_t_a = <<V0_idx:32/little, V0_gold_add:16/little,
                V0_gold:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16703:16/little,
       D_a_t_a/binary>>};
pack(srv, 16703,
     {V0_idx,
      V0_gold,
      V0_gold_my,
      V0_once,
      V0_over_time,
      V0_state}) ->
    D_a_t_a = <<V0_idx:32/little, V0_gold:32/little,
                V0_gold_my:32/little, V0_once:16/little,
                V0_over_time:32/little, V0_state:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16703:16/little,
       D_a_t_a/binary>>};
pack(cli, 16704,
     {V0_idx, V0_gold_add, V0_gold, V0_gold_max}) ->
    D_a_t_a = <<V0_idx:32/little, V0_gold_add:8/little,
                V0_gold:32/little, V0_gold_max:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16704:16/little,
       D_a_t_a/binary>>};
pack(srv, 16704,
     {V0_idx,
      V0_item_id,
      V0_item_count,
      V0_gold,
      V0_gold_my,
      V0_gold_once,
      V0_over_time,
      V0_focus}) ->
    D_a_t_a = <<V0_idx:32/little, V0_item_id:32/little,
                V0_item_count:16/little, V0_gold:32/little,
                V0_gold_my:32/little, V0_gold_once:16/little,
                V0_over_time:32/little, V0_focus:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16704:16/little,
       D_a_t_a/binary>>};
pack(cli, 16705, {}) ->
    {ok, <<2:32/little, 16705:16/little>>};
pack(srv, 16705, {}) ->
    {ok, <<2:32/little, 16705:16/little>>};
pack(cli, 16706, {}) ->
    {ok, <<2:32/little, 16706:16/little>>};
pack(srv, 16706, {V0_time_list}) ->
    D_a_t_a = <<(length(V0_time_list)):16/little,
                (list_to_binary([<<V1_start_time:32/little,
                                   V1_end_time:32/little>>
                                 || {V1_start_time, V1_end_time}
                                        <- V0_time_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16706:16/little,
       D_a_t_a/binary>>};
pack(cli, 16707, {}) ->
    {ok, <<2:32/little, 16707:16/little>>};
pack(srv, 16707, {V0_item_list}) ->
    D_a_t_a = <<(length(V0_item_list)):16/little,
                (list_to_binary([<<V1_idx:32/little, V1_gold:32/little,
                                   V1_gold_my:32/little, V1_once:16/little,
                                   V1_over_time:32/little, V1_state:8/little>>
                                 || {V1_idx,
                                     V1_gold,
                                     V1_gold_my,
                                     V1_once,
                                     V1_over_time,
                                     V1_state}
                                        <- V0_item_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 16707:16/little,
       D_a_t_a/binary>>};
pack(_Type, Code, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
             binary()) -> {ok, tuple()} |
                          {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(srv, 16700, _B0) -> {ok, {}};
unpack(cli, 16700, _B0) ->
    {V1_auction_list, _B12} = protocol:array(_B0,
                                             fun (_B1) ->
                                                     {V2_idx, _B2} =
                                                         protocol:uint32(_B1),
                                                     {V2_item_id, _B3} =
                                                         protocol:uint32(_B2),
                                                     {V2_item_count, _B4} =
                                                         protocol:uint16(_B3),
                                                     {V2_gold, _B5} =
                                                         protocol:uint32(_B4),
                                                     {V2_gold_my, _B6} =
                                                         protocol:uint32(_B5),
                                                     {V2_gold_once, _B7} =
                                                         protocol:uint16(_B6),
                                                     {V2_over_time, _B8} =
                                                         protocol:uint32(_B7),
                                                     {V2_focus, _B9} =
                                                         protocol:uint8(_B8),
                                                     {V2_state, _B10} =
                                                         protocol:uint8(_B9),
                                                     {{V2_idx,
                                                       V2_item_id,
                                                       V2_item_count,
                                                       V2_gold,
                                                       V2_gold_my,
                                                       V2_gold_once,
                                                       V2_over_time,
                                                       V2_focus,
                                                       V2_state},
                                                      _B10}
                                             end),
    {ok, {V1_auction_list}};
unpack(srv, 16701, _B0) -> {ok, {}};
unpack(cli, 16701, _B0) ->
    {V1_list, _B11} = protocol:array(_B0,
                                     fun (_B1) ->
                                             {V2_idx, _B2} =
                                                 protocol:uint32(_B1),
                                             {V2_item_id, _B3} =
                                                 protocol:uint32(_B2),
                                             {V2_item_count, _B4} =
                                                 protocol:uint16(_B3),
                                             {V2_gold, _B5} =
                                                 protocol:uint32(_B4),
                                             {V2_gold_my, _B6} =
                                                 protocol:uint32(_B5),
                                             {V2_gold_once, _B7} =
                                                 protocol:uint16(_B6),
                                             {V2_over_time, _B8} =
                                                 protocol:uint32(_B7),
                                             {V2_state, _B9} =
                                                 protocol:uint8(_B8),
                                             {{V2_idx,
                                               V2_item_id,
                                               V2_item_count,
                                               V2_gold,
                                               V2_gold_my,
                                               V2_gold_once,
                                               V2_over_time,
                                               V2_state},
                                              _B9}
                                     end),
    {ok, {V1_list}};
unpack(srv, 16702, _B0) ->
    {V1_idx, _B1} = protocol:uint32(_B0),
    {ok, {V1_idx}};
unpack(cli, 16702, _B0) ->
    {V1_idx, _B1} = protocol:uint32(_B0),
    {V1_focus, _B2} = protocol:uint8(_B1),
    {ok, {V1_idx, V1_focus}};
unpack(srv, 16703, _B0) ->
    {V1_idx, _B1} = protocol:uint32(_B0),
    {V1_gold_add, _B2} = protocol:uint16(_B1),
    {V1_gold, _B3} = protocol:uint32(_B2),
    {ok, {V1_idx, V1_gold_add, V1_gold}};
unpack(cli, 16703, _B0) ->
    {V1_idx, _B1} = protocol:uint32(_B0),
    {V1_gold, _B2} = protocol:uint32(_B1),
    {V1_gold_my, _B3} = protocol:uint32(_B2),
    {V1_once, _B4} = protocol:uint16(_B3),
    {V1_over_time, _B5} = protocol:uint32(_B4),
    {V1_state, _B6} = protocol:uint8(_B5),
    {ok,
     {V1_idx,
      V1_gold,
      V1_gold_my,
      V1_once,
      V1_over_time,
      V1_state}};
unpack(srv, 16704, _B0) ->
    {V1_idx, _B1} = protocol:uint32(_B0),
    {V1_gold_add, _B2} = protocol:uint8(_B1),
    {V1_gold, _B3} = protocol:uint32(_B2),
    {V1_gold_max, _B4} = protocol:uint32(_B3),
    {ok, {V1_idx, V1_gold_add, V1_gold, V1_gold_max}};
unpack(cli, 16704, _B0) ->
    {V1_idx, _B1} = protocol:uint32(_B0),
    {V1_item_id, _B2} = protocol:uint32(_B1),
    {V1_item_count, _B3} = protocol:uint16(_B2),
    {V1_gold, _B4} = protocol:uint32(_B3),
    {V1_gold_my, _B5} = protocol:uint32(_B4),
    {V1_gold_once, _B6} = protocol:uint16(_B5),
    {V1_over_time, _B7} = protocol:uint32(_B6),
    {V1_focus, _B8} = protocol:uint8(_B7),
    {ok,
     {V1_idx,
      V1_item_id,
      V1_item_count,
      V1_gold,
      V1_gold_my,
      V1_gold_once,
      V1_over_time,
      V1_focus}};
unpack(srv, 16705, _B0) -> {ok, {}};
unpack(cli, 16705, _B0) -> {ok, {}};
unpack(srv, 16706, _B0) -> {ok, {}};
unpack(cli, 16706, _B0) ->
    {V1_time_list, _B5} = protocol:array(_B0,
                                         fun (_B1) ->
                                                 {V2_start_time, _B2} =
                                                     protocol:uint32(_B1),
                                                 {V2_end_time, _B3} =
                                                     protocol:uint32(_B2),
                                                 {{V2_start_time, V2_end_time},
                                                  _B3}
                                         end),
    {ok, {V1_time_list}};
unpack(srv, 16707, _B0) -> {ok, {}};
unpack(cli, 16707, _B0) ->
    {V1_item_list, _B9} = protocol:array(_B0,
                                         fun (_B1) ->
                                                 {V2_idx, _B2} =
                                                     protocol:uint32(_B1),
                                                 {V2_gold, _B3} =
                                                     protocol:uint32(_B2),
                                                 {V2_gold_my, _B4} =
                                                     protocol:uint32(_B3),
                                                 {V2_once, _B5} =
                                                     protocol:uint16(_B4),
                                                 {V2_over_time, _B6} =
                                                     protocol:uint32(_B5),
                                                 {V2_state, _B7} =
                                                     protocol:uint8(_B6),
                                                 {{V2_idx,
                                                   V2_gold,
                                                   V2_gold_my,
                                                   V2_once,
                                                   V2_over_time,
                                                   V2_state},
                                                  _B7}
                                         end),
    {ok, {V1_item_list}};
unpack(_Type, Code, _Data) ->
    {error, {unknown_unpack_command, Code}}.

