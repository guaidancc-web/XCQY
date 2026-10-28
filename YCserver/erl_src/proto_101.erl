-file("src/proto/proto_101.erl", 1).

-module(proto_101).

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

-file("src/proto/proto_101.erl", 14).

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

-file("src/proto/proto_101.erl", 15).

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

-file("src/proto/proto_101.erl", 16).

-file("inc/unit.hrl", 1).

-record(unit_order,
        {order :: undefined | move | guard | attack | atom(),
         type = 0 :: 0..2,
         arg :: undefined | tuple() | [tuple()],
         data :: undefined | term(),
         condition = [] :: list(),
         over :: undefined | defense | stop | atom()}).

-record(unit_data,
        {id = 0 :: pos_integer(),
         type = 1 :: non_neg_integer(),
         fun_type = 1 :: non_neg_integer(),
         desc = "",
         classes = 0,
         sex = 0,
         lev = 1,
         name = "" :: list(),
         activity = 0 :: 0..1,
         guide_lev = 0 :: non_neg_integer(),
         status = 0 :: non_neg_integer(),
         nature = 0 :: non_neg_integer(),
         disabled = "" :: bitstring(),
         condition = [] :: [tuple()],
         speed = 120 :: pos_integer(),
         lock = 0 :: 0 | 1,
         t_move = 3 :: pos_integer(),
         t_atk = 3 :: pos_integer(),
         range_trace = 200 :: pos_integer(),
         range_atk = 100 :: pos_integer(),
         gain = [] :: list(),
         formation = 1,
         formation_lev = 1,
         slave = [] :: list(),
         talk = [] :: list(),
         looks = [] :: list(),
         data = [] :: list(),
         def_status = defense :: defense | patrol | loaf}).

-record(unit,
        {id = {1, 1} :: {pos_integer(), pos_integer()},
         base_id = 0 :: non_neg_integer(),
         type = 1 :: non_neg_integer(),
         fun_type = 1,
         name = "" :: list(),
         pid = 0 :: non_neg_integer() | pid(),
         lev = 1,
         classes = 0,
         sex = 0,
         activity = 0 :: 0..1,
         dun_info :: undefined | {pid(), pos_integer()},
         combat_pid = 0 :: non_neg_integer() | pid(),
         status = 0 :: non_neg_integer(),
         guide_lev = 0 :: non_neg_integer(),
         nature = 0 :: non_neg_integer(),
         disabled = "" :: list(),
         condition = [] :: [tuple()],
         speed = 180 :: pos_integer(),
         lock = 0 :: 0 | 1,
         range_trace = 200 :: pos_integer(),
         range_atk = 100 :: pos_integer(),
         defxy = {0, 0, 0} :: tuple(),
         def_status = defense :: defense | patrol | loaf,
         talk = [] :: list(),
         pos :: undefined | tuple(),
         data :: undefined | term(),
         looks = [] :: [tuple()],
         evt = [] :: [atom()],
         formation = 1,
         formation_lev = 1,
         slave = [] :: list(),
         prop = [] :: [{non_neg_integer(), string()}],
         order = [] :: list(),
         path = [] :: list(),
         ts = {1, 1, 1} ::
             {pos_integer(), pos_integer(), pos_integer()},
         t_move = 3 :: pos_integer(),
         t_atk = 3 :: pos_integer(),
         ai_id = 0,
         ai = {[], []} :: {list(), list()},
         attr,
         role_id = {0, "", 0}}).

-record(map_unit,
        {id = {1, 1} :: {pos_integer(), pos_integer()},
         base_id = 0 :: non_neg_integer(),
         type = 1 :: pos_integer(),
         activity = 0 :: 0..1,
         status = 0 :: non_neg_integer(),
         classes = 0,
         sex = 0,
         guide_lev = 0 :: non_neg_integer(),
         name = "" :: list(),
         speed = 1 :: pos_integer(),
         x = 0 :: non_neg_integer(),
         y = 0 :: non_neg_integer(),
         gx = 0 :: non_neg_integer(),
         gy = 0 :: non_neg_integer(),
         looks = [] :: [tuple()],
         prop = [] :: [tuple()]}).

-record(plot_unit,
        {id = 0 :: pos_integer(),
         name = "" :: bitstring(),
         base_id = 0 :: non_neg_integer(),
         type = 1,
         fun_type = 1,
         dun_id = 0 :: non_neg_integer(),
         map = 0 :: non_neg_integer(),
         x = 0 :: non_neg_integer(),
         y = 0 :: non_neg_integer(),
         dir = 0 :: non_neg_integer(),
         act_type = "" :: bitstring(),
         looks = [] :: [tuple()],
         status = 0 :: non_neg_integer(),
         quest_id = 0 :: non_neg_integer(),
         quest_prog_id = 0 :: non_neg_integer(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer()}).

-record(unit_statue,
        {type = 0,
         id = {0, "", 0},
         name = "",
         lev = 0,
         classes = 0,
         sex = 0,
         looks = []}).

-file("src/proto/proto_101.erl", 17).

-file("inc/item.hrl", 1).

-record(item_base,
        {id = 0 :: non_neg_integer(),
         name = "" :: list(),
         type = 0 :: non_neg_integer(),
         quality = 0 :: 0..4,
         overlap = 1 :: pos_integer(),
         look_id = 0 :: non_neg_integer(),
         use_type = 0 :: 0..4,
         expire_type = 0 :: non_neg_integer(),
         expire_time = 0 ::
             non_neg_integer() |
             {{pos_integer(), pos_integer(), pos_integer()},
              {non_neg_integer(),
               non_neg_integer(),
               non_neg_integer()}},
         attr = [] :: [tuple()],
         lev = 0,
         classes = 0,
         sex = 2,
         buy_source = [],
         condition = [] :: [tuple()],
         effect = [] :: [tuple()],
         alchemy = 0 :: non_neg_integer()}).

-record(item,
        {ver = 0 :: non_neg_integer(),
         id = 0 :: non_neg_integer(),
         base_id = 0 :: non_neg_integer(),
         bind = 1 :: 0 | 1,
         look_id = 0,
         type = 0 :: non_neg_integer(),
         use_type = 0 :: 0..4,
         quality = 0 :: 0..4,
         craft = 0 :: 0..5,
         enchant = -1 :: integer(),
         growth_lev = 0,
         growth_val = 0,
         step = 0 :: pos_integer(),
         quantity = 1 :: 0..250,
         pos = 0 :: non_neg_integer(),
         expire_type = 0 :: 0..4,
         expire_time = 0 :: non_neg_integer(),
         attr = [] :: [tuple()],
         reset_attr = [],
         lev = 1 :: pos_integer(),
         classes = 0 :: 0..6,
         sex = 2 :: 0..2,
         extra = [] :: [tuple()],
         data = [] :: [any()]}).

-record(item_extra_info, {source, price}).

-file("src/proto/proto_101.erl", 18).

-file("inc/attr.hrl", 1).

-record(attr_base,
        {type = 0 :: non_neg_integer(),
         name = 0 :: pos_integer(),
         flag = 0 :: non_neg_integer(),
         calc_type = 0 :: non_neg_integer(),
         val = 0 :: non_neg_integer()}).

-record(attr,
        {ver = 3,
         fc = 0 :: non_neg_integer(),
         speed = 260 :: pos_integer(),
         hp_max = 0 :: non_neg_integer(),
         mp_max = 0 :: non_neg_integer(),
         atk_speed = 0 :: non_neg_integer(),
         phy_dmg = 0 :: non_neg_integer(),
         magic_dmg = 0 :: non_neg_integer(),
         phy_def = 0 :: non_neg_integer(),
         magic_def = 0 :: non_neg_integer(),
         crit = 0 :: non_neg_integer(),
         tenacity = 0 :: non_neg_integer(),
         accuracy = 0 :: non_neg_integer(),
         evasion = 0 :: non_neg_integer(),
         holy_dmg = 0 :: non_neg_integer(),
         crit_dmg = 0 :: non_neg_integer(),
         crit_dmg_def = 0 :: non_neg_integer(),
         dmg_ratio = 0 :: non_neg_integer(),
         def_ratio = 0 :: non_neg_integer(),
         enhance_control = 0 :: non_neg_integer(),
         anti_control = 0 :: non_neg_integer(),
         escape = 0 :: non_neg_integer(),
         anti_escape = 0 :: non_neg_integer(),
         capture = 0 :: non_neg_integer(),
         phy_def_ratio = 0 :: non_neg_integer(),
         magic_def_ratio = 0 :: non_neg_integer(),
         phy_accuracy = 0 :: non_neg_integer(),
         magic_accuracy = 0 :: non_neg_integer(),
         phy_evasion = 0 :: non_neg_integer(),
         magic_evasion = 0 :: non_neg_integer(),
         phy_crit = 0 :: non_neg_integer(),
         magic_crit = 0 :: non_neg_integer(),
         phy_tenacity = 0 :: non_neg_integer(),
         magic_tenacity = 0 :: non_neg_integer(),
         heal_val = 0 :: non_neg_integer(),
         heal_ratio = 0 :: non_neg_integer(),
         eff_heal_ratio = 0 :: non_neg_integer(),
         phy_dmg_ratio = 0 :: non_neg_integer(),
         magic_dmg_ratio = 0 :: non_neg_integer(),
         strength = 0,
         constitution = 0,
         magic = 0,
         agility = 0,
         endurance = 0,
         exp_ratio = 0}).

-record(attr_calc,
        {attr :: undefined | #attr{},
         attr_no_ratio :: undefined | #attr{},
         ratio :: undefined | #attr{},
         attr_no_fc :: undefined | #attr{},
         ratio_no_fc :: undefined | #attr{}}).

-record(m_attr_point,
        {ver = 2,
         ext_point = [],
         first_free = 0,
         valid_plan = 1,
         plan_data = [],
         change_plan_times = 0}).

-record(attr_point_plan,
        {index = 1 :: pos_integer(),
         plan_name = [],
         strength = 0 :: pos_integer(),
         constitution = 0 :: non_neg_integer(),
         magic = 0 :: non_neg_integer(),
         agility = 0 :: non_neg_integer(),
         endurance = 0 :: non_neg_integer(),
         pre_str = 0,
         pre_con = 0,
         pre_magic = 0,
         pre_agi = 0,
         pre_end = 0}).

-file("src/proto/proto_101.erl", 19).

-spec pack(srv | cli, non_neg_integer(),
           tuple()) -> {ok, binary()} |
                       {error, {unknown_pack_command, non_neg_integer()}}.

pack(cli, 10100, {V0_battle_id, V0_id, V0_code}) ->
    D_a_t_a = <<V0_battle_id:32/little, V0_id:32/little,
                V0_code:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10100:16/little,
       D_a_t_a/binary>>};
pack(srv, 10100,
     {V0_result, V0_msg, V0_battle_id, V0_id}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary,
                V0_battle_id:32/little, V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10100:16/little,
       D_a_t_a/binary>>};
pack(cli, 10101, {}) ->
    {ok, <<2:32/little, 10101:16/little>>};
pack(srv, 10101,
     {V0_flag,
      V0_base_id,
      V0_x,
      V0_y,
      V0_ride,
      V0_event,
      V0_speed}) ->
    D_a_t_a = <<V0_flag:8/little, V0_base_id:32/little,
                V0_x:16/little, V0_y:16/little, V0_ride:8/little,
                V0_event:8/little, V0_speed:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10101:16/little,
       D_a_t_a/binary>>};
pack(cli, 10102, {}) ->
    {ok, <<2:32/little, 10102:16/little>>};
pack(srv, 10102, {V0_base_id, V0_flag, V0_pos}) ->
    D_a_t_a = <<V0_base_id:32/little, V0_flag:8/little,
                (length(V0_pos)):16/little,
                (list_to_binary([<<V1_x:16/little, V1_y:16/little>>
                                 || {V1_x, V1_y} <- V0_pos]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10102:16/little,
       D_a_t_a/binary>>};
pack(cli, 10103, {}) ->
    {ok, <<2:32/little, 10103:16/little>>};
pack(srv, 10103, {V0_base_id, V0_pos}) ->
    D_a_t_a = <<V0_base_id:32/little,
                (length(V0_pos)):16/little,
                (list_to_binary([<<V1_x:16/little, V1_y:16/little>>
                                 || {V1_x, V1_y} <- V0_pos]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10103:16/little,
       D_a_t_a/binary>>};
pack(cli, 10110, {}) ->
    {ok, <<2:32/little, 10110:16/little>>};
pack(srv, 10110,
     {V0_base_id,
      V0_res_id,
      V0_x,
      V0_y,
      V0_ride,
      V0_event,
      V0_speed}) ->
    D_a_t_a = <<V0_base_id:32/little, V0_res_id:32/little,
                V0_x:16/little, V0_y:16/little, V0_ride:8/little,
                V0_event:8/little, V0_speed:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10110:16/little,
       D_a_t_a/binary>>};
pack(cli, 10111, {}) ->
    {ok, <<2:32/little, 10111:16/little>>};
pack(srv, 10111, {V0_res_id}) ->
    D_a_t_a = <<V0_res_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10111:16/little,
       D_a_t_a/binary>>};
pack(cli, 10112, {}) ->
    {ok, <<2:32/little, 10112:16/little>>};
pack(srv, 10112, {}) ->
    {ok, <<2:32/little, 10112:16/little>>};
pack(cli, 10113, {}) ->
    {ok, <<2:32/little, 10113:16/little>>};
pack(srv, 10113,
     #map_role{rid = V0_rid, platform = V0_platform,
               zone_id = V0_zone_id, name = V0_name, speed = V0_speed,
               dir = V0_dir, x = V0_x, y = V0_y, gx = V0_gx,
               gy = V0_gy, status = V0_status, action = V0_action,
               ride = V0_ride, event = V0_event, hidden = V0_hidden,
               label = V0_label, lev = V0_lev, sex = V0_sex,
               classes = V0_classes, realm = V0_realm, face = V0_face,
               fc = V0_fc, looks = V0_looks, guild = V0_guild,
               guild_post = V0_guild_post,
               guild_signature = V0_guild_signature,
               guild_id =
                   {V0_guild_id, V0_guild_platform, V0_guild_zone},
               team_status = V0_team_status, team_num = V0_team_num,
               lover_rid = V0_lover_rid,
               lover_platform = V0_lover_platform,
               lover_zone_id = V0_lover_zone_id,
               lover_name = V0_lover_name,
               lover_status = V0_lover_status,
               team_mark = V0_team_mark, foot_mark = V0_foot_mark}) ->
    D_a_t_a = <<V0_rid:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little,
                (protocol:pack(string, V0_name))/binary,
                V0_speed:16/little, V0_dir:8/little, V0_x:16/little,
                V0_y:16/little, V0_gx:16/little, V0_gy:16/little,
                V0_status:8/little, V0_action:8/little,
                V0_ride:8/little, V0_event:8/little, V0_hidden:8/little,
                V0_label:8/little, V0_lev:8/little, V0_sex:8/little,
                V0_classes:8/little, V0_realm:8/little,
                V0_face:32/little, V0_fc:32/little,
                (length(V0_looks)):16/little,
                (list_to_binary([<<V1_looks_type:32/little,
                                   V1_looks_mode:32/little,
                                   V1_looks_val:32/little,
                                   (protocol:pack(string,
                                                  V1_looks_str))/binary>>
                                 || {V1_looks_type,
                                     V1_looks_mode,
                                     V1_looks_val,
                                     V1_looks_str}
                                        <- V0_looks]))/binary,
                (protocol:pack(string, V0_guild))/binary,
                (protocol:pack(string, V0_guild_post))/binary,
                (protocol:pack(string, V0_guild_signature))/binary,
                V0_guild_id:32/little,
                (protocol:pack(string, V0_guild_platform))/binary,
                V0_guild_zone:16/little, V0_team_status:8/signed-little,
                V0_team_num:8/little, V0_lover_rid:32/little,
                (protocol:pack(string, V0_lover_platform))/binary,
                V0_lover_zone_id:16/little,
                (protocol:pack(string, V0_lover_name))/binary,
                V0_lover_status:32/little, V0_team_mark:16/little,
                V0_foot_mark:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10113:16/little,
       D_a_t_a/binary>>};
pack(cli, 10114, {}) ->
    {ok, <<2:32/little, 10114:16/little>>};
pack(srv, 10114, {V0_rid, V0_platform, V0_zone_id}) ->
    D_a_t_a = <<V0_rid:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10114:16/little,
       D_a_t_a/binary>>};
pack(cli, 10115,
     {V0_map_base_id, V0_x, V0_y, V0_dir}) ->
    D_a_t_a = <<V0_map_base_id:32/little, V0_x:16/little,
                V0_y:16/little, V0_dir:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10115:16/little,
       D_a_t_a/binary>>};
pack(srv, 10115,
     {V0_rid,
      V0_platform,
      V0_zone_id,
      V0_dir,
      V0_x,
      V0_y,
      V0_dx,
      V0_dy,
      V0_gx,
      V0_gy}) ->
    D_a_t_a = <<V0_rid:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little, V0_dir:8/little, V0_x:16/little,
                V0_y:16/little, V0_dx:16/little, V0_dy:16/little,
                V0_gx:16/little, V0_gy:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10115:16/little,
       D_a_t_a/binary>>};
pack(cli, 10116, {}) ->
    {ok, <<2:32/little, 10116:16/little>>};
pack(srv, 10116, {V0_role_list}) ->
    D_a_t_a = <<(length(V0_role_list)):16/little,
                (list_to_binary([<<V1_rid:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:16/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_speed:16/little, V1_dir:8/little,
                                   V1_x:16/little, V1_y:16/little,
                                   V1_gx:16/little, V1_gy:16/little,
                                   V1_status:8/little, V1_action:8/little,
                                   V1_ride:8/little, V1_event:8/little,
                                   V1_hidden:8/little, V1_label:8/little,
                                   V1_lev:8/little, V1_sex:8/little,
                                   V1_classes:8/little, V1_realm:8/little,
                                   V1_face:32/little, V1_fc:32/little,
                                   (length(V1_looks)):16/little,
                                   (list_to_binary([<<V2_looks_type:32/little,
                                                      V2_looks_mode:32/little,
                                                      V2_looks_val:32/little,
                                                      (protocol:pack(string,
                                                                     V2_looks_str))/binary>>
                                                    || {V2_looks_type,
                                                        V2_looks_mode,
                                                        V2_looks_val,
                                                        V2_looks_str}
                                                           <- V1_looks]))/binary,
                                   (protocol:pack(string, V1_guild))/binary,
                                   (protocol:pack(string,
                                                  V1_guild_post))/binary,
                                   (protocol:pack(string,
                                                  V1_guild_signature))/binary,
                                   V1_guild_id:32/little,
                                   (protocol:pack(string,
                                                  V1_guild_platform))/binary,
                                   V1_guild_zone:16/little,
                                   V1_team_status:8/signed-little,
                                   V1_team_num:8/little, V1_lover_rid:32/little,
                                   (protocol:pack(string,
                                                  V1_lover_platform))/binary,
                                   V1_lover_zone_id:16/little,
                                   (protocol:pack(string,
                                                  V1_lover_name))/binary,
                                   V1_lover_status:32/little,
                                   V1_team_mark:16/little,
                                   V1_foot_mark:16/little>>
                                 || #map_role{rid = V1_rid,
                                              platform = V1_platform,
                                              zone_id = V1_zone_id,
                                              name = V1_name, speed = V1_speed,
                                              dir = V1_dir, x = V1_x, y = V1_y,
                                              gx = V1_gx, gy = V1_gy,
                                              status = V1_status,
                                              action = V1_action,
                                              ride = V1_ride, event = V1_event,
                                              hidden = V1_hidden,
                                              label = V1_label, lev = V1_lev,
                                              sex = V1_sex,
                                              classes = V1_classes,
                                              realm = V1_realm, face = V1_face,
                                              fc = V1_fc, looks = V1_looks,
                                              guild = V1_guild,
                                              guild_post = V1_guild_post,
                                              guild_signature =
                                                  V1_guild_signature,
                                              guild_id =
                                                  {V1_guild_id,
                                                   V1_guild_platform,
                                                   V1_guild_zone},
                                              team_status = V1_team_status,
                                              team_num = V1_team_num,
                                              lover_rid = V1_lover_rid,
                                              lover_platform =
                                                  V1_lover_platform,
                                              lover_zone_id = V1_lover_zone_id,
                                              lover_name = V1_lover_name,
                                              lover_status = V1_lover_status,
                                              team_mark = V1_team_mark,
                                              foot_mark = V1_foot_mark}
                                        <- V0_role_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10116:16/little,
       D_a_t_a/binary>>};
pack(cli, 10117, {}) ->
    {ok, <<2:32/little, 10117:16/little>>};
pack(srv, 10117,
     #map_role{rid = V0_rid, platform = V0_platform,
               zone_id = V0_zone_id, name = V0_name,
               classes = V0_classes, sex = V0_sex, looks = V0_looks,
               ride = V0_ride, guild = V0_guild,
               guild_post = V0_guild_post,
               guild_signature = V0_guild_signature,
               guild_id =
                   {V0_guild_id, V0_guild_platform, V0_guild_zone},
               team_status = V0_team_status, team_num = V0_team_num,
               speed = V0_speed, event = V0_event, action = V0_action,
               lover_rid = V0_lover_rid,
               lover_platform = V0_lover_platform,
               lover_zone_id = V0_lover_zone_id,
               lover_name = V0_lover_name,
               lover_status = V0_lover_status,
               team_mark = V0_team_mark, foot_mark = V0_foot_mark}) ->
    D_a_t_a = <<V0_rid:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little,
                (protocol:pack(string, V0_name))/binary,
                V0_classes:8/little, V0_sex:8/little,
                (length(V0_looks)):16/little,
                (list_to_binary([<<V1_looks_type:32/little,
                                   V1_looks_mode:32/little,
                                   V1_looks_val:32/little,
                                   (protocol:pack(string,
                                                  V1_looks_str))/binary>>
                                 || {V1_looks_type,
                                     V1_looks_mode,
                                     V1_looks_val,
                                     V1_looks_str}
                                        <- V0_looks]))/binary,
                V0_ride:8/little,
                (protocol:pack(string, V0_guild))/binary,
                (protocol:pack(string, V0_guild_post))/binary,
                (protocol:pack(string, V0_guild_signature))/binary,
                V0_guild_id:32/little,
                (protocol:pack(string, V0_guild_platform))/binary,
                V0_guild_zone:16/little, V0_team_status:8/signed-little,
                V0_team_num:8/little, V0_speed:16/little,
                V0_event:8/little, V0_action:8/little,
                V0_lover_rid:32/little,
                (protocol:pack(string, V0_lover_platform))/binary,
                V0_lover_zone_id:16/little,
                (protocol:pack(string, V0_lover_name))/binary,
                V0_lover_status:32/little, V0_team_mark:16/little,
                V0_foot_mark:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10117:16/little,
       D_a_t_a/binary>>};
pack(cli, 10118, {}) ->
    {ok, <<2:32/little, 10118:16/little>>};
pack(srv, 10118,
     {V0_rid,
      V0_platform,
      V0_zone_id,
      V0_mode,
      V0_speed,
      V0_dir,
      V0_x,
      V0_y,
      V0_dest,
      V0_gx,
      V0_gy}) ->
    D_a_t_a = <<V0_rid:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little, V0_mode:8/little,
                V0_speed:16/little, V0_dir:8/little, V0_x:16/little,
                V0_y:16/little, (length(V0_dest)):16/little,
                (list_to_binary([<<V1_dx:16/little, V1_dy:16/little>>
                                 || {V1_dx, V1_dy} <- V0_dest]))/binary,
                V0_gx:16/little, V0_gy:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10118:16/little,
       D_a_t_a/binary>>};
pack(cli, 10119, {V0_map_id, V0_x, V0_y}) ->
    D_a_t_a = <<V0_map_id:32/little, V0_x:16/little,
                V0_y:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10119:16/little,
       D_a_t_a/binary>>};
pack(srv, 10119, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10119:16/little,
       D_a_t_a/binary>>};
pack(cli, 10120, {}) ->
    {ok, <<2:32/little, 10120:16/little>>};
pack(srv, 10120, {V0_unit_list}) ->
    D_a_t_a = <<(length(V0_unit_list)):16/little,
                (list_to_binary([<<V1_battle_id:32/little,
                                   V1_id:32/little, V1_base_id:32/little,
                                   V1_type:16/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_status:8/little, V1_guide_lev:8/little,
                                   V1_speed:16/little, V1_x:16/little,
                                   V1_y:16/little, V1_gx:16/little,
                                   V1_gy:16/little, V1_sex:8/little,
                                   V1_classes:8/little,
                                   (length(V1_looks)):16/little,
                                   (list_to_binary([<<V2_looks_type:32/little,
                                                      V2_looks_mode:32/little,
                                                      V2_looks_val:32/little,
                                                      (protocol:pack(string,
                                                                     V2_looks_str))/binary>>
                                                    || {V2_looks_type,
                                                        V2_looks_mode,
                                                        V2_looks_val,
                                                        V2_looks_str}
                                                           <- V1_looks]))/binary,
                                   (length(V1_prop)):16/little,
                                   (list_to_binary([<<V2_prop_key:32/little,
                                                      (protocol:pack(string,
                                                                     V2_prop_val))/binary>>
                                                    || {V2_prop_key,
                                                        V2_prop_val}
                                                           <- V1_prop]))/binary>>
                                 || #map_unit{id = {V1_battle_id, V1_id},
                                              base_id = V1_base_id,
                                              type = V1_type, name = V1_name,
                                              status = V1_status,
                                              guide_lev = V1_guide_lev,
                                              speed = V1_speed, x = V1_x,
                                              y = V1_y, gx = V1_gx, gy = V1_gy,
                                              sex = V1_sex,
                                              classes = V1_classes,
                                              looks = V1_looks, prop = V1_prop}
                                        <- V0_unit_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10120:16/little,
       D_a_t_a/binary>>};
pack(cli, 10122, {}) ->
    {ok, <<2:32/little, 10122:16/little>>};
pack(srv, 10122, {V0_role_list}) ->
    D_a_t_a = <<(length(V0_role_list)):16/little,
                (list_to_binary([<<V1_rid:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:16/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_speed:16/little, V1_dir:8/little,
                                   V1_x:16/little, V1_y:16/little,
                                   V1_gx:16/little, V1_gy:16/little,
                                   V1_status:8/little, V1_action:8/little,
                                   V1_ride:8/little, V1_event:8/little,
                                   V1_hidden:8/little, V1_label:8/little,
                                   V1_lev:8/little, V1_sex:8/little,
                                   V1_classes:8/little, V1_realm:8/little,
                                   V1_face:32/little, V1_fc:32/little,
                                   (length(V1_looks)):16/little,
                                   (list_to_binary([<<V2_looks_type:32/little,
                                                      V2_looks_mode:32/little,
                                                      V2_looks_val:32/little,
                                                      (protocol:pack(string,
                                                                     V2_looks_str))/binary>>
                                                    || {V2_looks_type,
                                                        V2_looks_mode,
                                                        V2_looks_val,
                                                        V2_looks_str}
                                                           <- V1_looks]))/binary,
                                   (protocol:pack(string, V1_guild))/binary,
                                   (protocol:pack(string,
                                                  V1_guild_post))/binary,
                                   (protocol:pack(string,
                                                  V1_guild_signature))/binary,
                                   V1_guild_id:32/little,
                                   (protocol:pack(string,
                                                  V1_guild_platform))/binary,
                                   V1_guild_zone:16/little,
                                   V1_team_status:8/signed-little,
                                   V1_team_num:8/little, V1_lover_rid:32/little,
                                   (protocol:pack(string,
                                                  V1_lover_platform))/binary,
                                   V1_lover_zone_id:16/little,
                                   (protocol:pack(string,
                                                  V1_lover_name))/binary,
                                   V1_lover_status:32/little,
                                   V1_team_mark:16/little,
                                   V1_foot_mark:16/little>>
                                 || #map_role{rid = V1_rid,
                                              platform = V1_platform,
                                              zone_id = V1_zone_id,
                                              name = V1_name, speed = V1_speed,
                                              dir = V1_dir, x = V1_x, y = V1_y,
                                              gx = V1_gx, gy = V1_gy,
                                              status = V1_status,
                                              action = V1_action,
                                              ride = V1_ride, event = V1_event,
                                              hidden = V1_hidden,
                                              label = V1_label, lev = V1_lev,
                                              sex = V1_sex,
                                              classes = V1_classes,
                                              realm = V1_realm, face = V1_face,
                                              fc = V1_fc, looks = V1_looks,
                                              guild = V1_guild,
                                              guild_post = V1_guild_post,
                                              guild_signature =
                                                  V1_guild_signature,
                                              guild_id =
                                                  {V1_guild_id,
                                                   V1_guild_platform,
                                                   V1_guild_zone},
                                              team_status = V1_team_status,
                                              team_num = V1_team_num,
                                              lover_rid = V1_lover_rid,
                                              lover_platform =
                                                  V1_lover_platform,
                                              lover_zone_id = V1_lover_zone_id,
                                              lover_name = V1_lover_name,
                                              lover_status = V1_lover_status,
                                              team_mark = V1_team_mark,
                                              foot_mark = V1_foot_mark}
                                        <- V0_role_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10122:16/little,
       D_a_t_a/binary>>};
pack(cli, 10123, {}) ->
    {ok, <<2:32/little, 10123:16/little>>};
pack(srv, 10123,
     #map_role{rid = V0_rid, platform = V0_platform,
               zone_id = V0_zone_id, status = V0_status,
               team_status = V0_team_status, team_num = V0_team_num,
               lover_rid = V0_lover_rid,
               lover_platform = V0_lover_platform,
               lover_zone_id = V0_lover_zone_id,
               lover_name = V0_lover_name,
               lover_status = V0_lover_status, event = V0_event,
               team_mark = V0_team_mark, foot_mark = V0_foot_mark}) ->
    D_a_t_a = <<V0_rid:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little, V0_status:8/little,
                V0_team_status:8/signed-little, V0_team_num:8/little,
                V0_lover_rid:32/little,
                (protocol:pack(string, V0_lover_platform))/binary,
                V0_lover_zone_id:16/little,
                (protocol:pack(string, V0_lover_name))/binary,
                V0_lover_status:32/little, V0_event:8/little,
                V0_team_mark:16/little, V0_foot_mark:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10123:16/little,
       D_a_t_a/binary>>};
pack(cli, 10150, {}) ->
    {ok, <<2:32/little, 10150:16/little>>};
pack(srv, 10150, {V0_role_list, V0_act_type, V0_num}) ->
    D_a_t_a = <<(length(V0_role_list)):16/little,
                (list_to_binary([<<V1_rid:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:16/little>>
                                 || {V1_rid, V1_platform, V1_zone_id}
                                        <- V0_role_list]))/binary,
                V0_act_type:32/little, V0_num:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10150:16/little,
       D_a_t_a/binary>>};
pack(cli, 10160, {}) ->
    {ok, <<2:32/little, 10160:16/little>>};
pack(srv, 10160,
     #map_unit{id = {V0_battle_id, V0_id},
               base_id = V0_base_id, type = V0_type, name = V0_name,
               status = V0_status, guide_lev = V0_guide_lev,
               speed = V0_speed, x = V0_x, y = V0_y, gx = V0_gx,
               gy = V0_gy, sex = V0_sex, classes = V0_classes,
               looks = V0_looks, prop = V0_prop}) ->
    D_a_t_a = <<V0_battle_id:32/little, V0_id:32/little,
                V0_base_id:32/little, V0_type:16/little,
                (protocol:pack(string, V0_name))/binary,
                V0_status:8/little, V0_guide_lev:8/little,
                V0_speed:16/little, V0_x:16/little, V0_y:16/little,
                V0_gx:16/little, V0_gy:16/little, V0_sex:8/little,
                V0_classes:8/little, (length(V0_looks)):16/little,
                (list_to_binary([<<V1_looks_type:32/little,
                                   V1_looks_mode:32/little,
                                   V1_looks_val:32/little,
                                   (protocol:pack(string,
                                                  V1_looks_str))/binary>>
                                 || {V1_looks_type,
                                     V1_looks_mode,
                                     V1_looks_val,
                                     V1_looks_str}
                                        <- V0_looks]))/binary,
                (length(V0_prop)):16/little,
                (list_to_binary([<<V1_prop_key:32/little,
                                   (protocol:pack(string, V1_prop_val))/binary>>
                                 || {V1_prop_key, V1_prop_val}
                                        <- V0_prop]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10160:16/little,
       D_a_t_a/binary>>};
pack(cli, 10162, {}) ->
    {ok, <<2:32/little, 10162:16/little>>};
pack(srv, 10162, {V0_battle_id, V0_id}) ->
    D_a_t_a = <<V0_battle_id:32/little, V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10162:16/little,
       D_a_t_a/binary>>};
pack(cli, 10164, {}) ->
    {ok, <<2:32/little, 10164:16/little>>};
pack(srv, 10164,
     {V0_battle_id, V0_id, V0_x, V0_y, V0_dx, V0_dy}) ->
    D_a_t_a = <<V0_battle_id:32/little, V0_id:32/little,
                V0_x:16/little, V0_y:16/little, V0_dx:16/little,
                V0_dy:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10164:16/little,
       D_a_t_a/binary>>};
pack(cli, 10165, {}) ->
    {ok, <<2:32/little, 10165:16/little>>};
pack(srv, 10165, {{V0_battle_id, V0_id}, V0_msg}) ->
    D_a_t_a = <<V0_battle_id:32/little, V0_id:32/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10165:16/little,
       D_a_t_a/binary>>};
pack(cli, 10166, {}) ->
    {ok, <<2:32/little, 10166:16/little>>};
pack(srv, 10166,
     #map_unit{id = {V0_battle_id, V0_id},
               base_id = V0_base_id, type = V0_type, name = V0_name,
               status = V0_status, sex = V0_sex, classes = V0_classes,
               looks = V0_looks}) ->
    D_a_t_a = <<V0_battle_id:32/little, V0_id:32/little,
                V0_base_id:32/little, V0_type:16/little,
                (protocol:pack(string, V0_name))/binary,
                V0_status:8/little, V0_sex:8/little,
                V0_classes:8/little, (length(V0_looks)):16/little,
                (list_to_binary([<<V1_looks_type:32/little,
                                   V1_looks_mode:32/little,
                                   V1_looks_val:32/little,
                                   (protocol:pack(string,
                                                  V1_looks_str))/binary>>
                                 || {V1_looks_type,
                                     V1_looks_mode,
                                     V1_looks_val,
                                     V1_looks_str}
                                        <- V0_looks]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10166:16/little,
       D_a_t_a/binary>>};
pack(cli, 10167, {V0_map_base_id, V0_members}) ->
    D_a_t_a = <<V0_map_base_id:32/little,
                (length(V0_members)):16/little,
                (list_to_binary([<<V1_rid:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:16/little, V1_x:16/little,
                                   V1_y:16/little, V1_dir:8/little>>
                                 || {V1_rid,
                                     V1_platform,
                                     V1_zone_id,
                                     V1_x,
                                     V1_y,
                                     V1_dir}
                                        <- V0_members]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10167:16/little,
       D_a_t_a/binary>>};
pack(srv, 10167, {}) ->
    {ok, <<2:32/little, 10167:16/little>>};
pack(cli, 10168, {}) ->
    {ok, <<2:32/little, 10168:16/little>>};
pack(srv, 10168,
     {{V0_rid, V0_platform, V0_zone_id}, V0_dir}) ->
    D_a_t_a = <<V0_rid:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little, V0_dir:32/signed-little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10168:16/little,
       D_a_t_a/binary>>};
pack(cli, 10169, {}) ->
    {ok, <<2:32/little, 10169:16/little>>};
pack(srv, 10169, {V0_role_list}) ->
    D_a_t_a = <<(length(V0_role_list)):16/little,
                (list_to_binary([<<V1_rid:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:16/little, V1_dir:8/little>>
                                 || #map_role{rid = V1_rid,
                                              platform = V1_platform,
                                              zone_id = V1_zone_id,
                                              dir = V1_dir}
                                        <- V0_role_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10169:16/little,
       D_a_t_a/binary>>};
pack(cli, 10170, {V0_map_base_id}) ->
    D_a_t_a = <<V0_map_base_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10170:16/little,
       D_a_t_a/binary>>};
pack(srv, 10170, {V0_flag}) ->
    D_a_t_a = <<V0_flag:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10170:16/little,
       D_a_t_a/binary>>};
pack(cli, 10171, {}) ->
    {ok, <<2:32/little, 10171:16/little>>};
pack(srv, 10171, {V0_flag}) ->
    D_a_t_a = <<V0_flag:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10171:16/little,
       D_a_t_a/binary>>};
pack(cli, 10172, {V0_battle_id, V0_id, V0_base_id}) ->
    D_a_t_a = <<V0_battle_id:32/little, V0_id:32/little,
                V0_base_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10172:16/little,
       D_a_t_a/binary>>};
pack(srv, 10172, {V0_battle_id, V0_id, V0_base_id}) ->
    D_a_t_a = <<V0_battle_id:32/little, V0_id:32/little,
                V0_base_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10172:16/little,
       D_a_t_a/binary>>};
pack(cli, 10173, {}) ->
    {ok, <<2:32/little, 10173:16/little>>};
pack(srv, 10173, {V0_reason}) ->
    D_a_t_a = <<V0_reason:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10173:16/little,
       D_a_t_a/binary>>};
pack(cli, 10174, {}) ->
    {ok, <<2:32/little, 10174:16/little>>};
pack(srv, 10174, {V0_flag}) ->
    D_a_t_a = <<V0_flag:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10174:16/little,
       D_a_t_a/binary>>};
pack(cli, 10175, {}) ->
    {ok, <<2:32/little, 10175:16/little>>};
pack(srv, 10175, {V0_driver_id, V0_passenger_id}) ->
    D_a_t_a = <<(length(V0_driver_id)):16/little,
                (list_to_binary([<<V1_rid:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:16/little>>
                                 || {V1_rid, V1_platform, V1_zone_id}
                                        <- V0_driver_id]))/binary,
                (length(V0_passenger_id)):16/little,
                (list_to_binary([<<V1_rid:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:16/little>>
                                 || {V1_rid, V1_platform, V1_zone_id}
                                        <- V0_passenger_id]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10175:16/little,
       D_a_t_a/binary>>};
pack(_Type, Code, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
             binary()) -> {ok, tuple()} |
                          {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(srv, 10100, _B0) ->
    {V1_battle_id, _B1} = protocol:uint32(_B0),
    {V1_id, _B2} = protocol:uint32(_B1),
    {V1_code, _B3} = protocol:uint16(_B2),
    {ok, {V1_battle_id, V1_id, V1_code}};
unpack(cli, 10100, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_battle_id, _B3} = protocol:uint32(_B2),
    {V1_id, _B4} = protocol:uint32(_B3),
    {ok, {V1_result, V1_msg, V1_battle_id, V1_id}};
unpack(srv, 10101, _B0) -> {ok, {}};
unpack(cli, 10101, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_base_id, _B2} = protocol:uint32(_B1),
    {V1_x, _B3} = protocol:uint16(_B2),
    {V1_y, _B4} = protocol:uint16(_B3),
    {V1_ride, _B5} = protocol:uint8(_B4),
    {V1_event, _B6} = protocol:uint8(_B5),
    {V1_speed, _B7} = protocol:uint16(_B6),
    {ok,
     {V1_flag,
      V1_base_id,
      V1_x,
      V1_y,
      V1_ride,
      V1_event,
      V1_speed}};
unpack(srv, 10102, _B0) -> {ok, {}};
unpack(cli, 10102, _B0) ->
    {V1_base_id, _B1} = protocol:uint32(_B0),
    {V1_flag, _B2} = protocol:uint8(_B1),
    {V1_pos, _B7} = protocol:array(_B2,
                                   fun (_B3) ->
                                           {V2_x, _B4} = protocol:uint16(_B3),
                                           {V2_y, _B5} = protocol:uint16(_B4),
                                           {{V2_x, V2_y}, _B5}
                                   end),
    {ok, {V1_base_id, V1_flag, V1_pos}};
unpack(srv, 10103, _B0) -> {ok, {}};
unpack(cli, 10103, _B0) ->
    {V1_base_id, _B1} = protocol:uint32(_B0),
    {V1_pos, _B6} = protocol:array(_B1,
                                   fun (_B2) ->
                                           {V2_x, _B3} = protocol:uint16(_B2),
                                           {V2_y, _B4} = protocol:uint16(_B3),
                                           {{V2_x, V2_y}, _B4}
                                   end),
    {ok, {V1_base_id, V1_pos}};
unpack(srv, 10110, _B0) -> {ok, {}};
unpack(cli, 10110, _B0) ->
    {V1_base_id, _B1} = protocol:uint32(_B0),
    {V1_res_id, _B2} = protocol:uint32(_B1),
    {V1_x, _B3} = protocol:uint16(_B2),
    {V1_y, _B4} = protocol:uint16(_B3),
    {V1_ride, _B5} = protocol:uint8(_B4),
    {V1_event, _B6} = protocol:uint8(_B5),
    {V1_speed, _B7} = protocol:uint16(_B6),
    {ok,
     {V1_base_id,
      V1_res_id,
      V1_x,
      V1_y,
      V1_ride,
      V1_event,
      V1_speed}};
unpack(srv, 10111, _B0) -> {ok, {}};
unpack(cli, 10111, _B0) ->
    {V1_res_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_res_id}};
unpack(srv, 10112, _B0) -> {ok, {}};
unpack(cli, 10112, _B0) -> {ok, {}};
unpack(srv, 10113, _B0) -> {ok, {}};
unpack(cli, 10113, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {V1_name, _B4} = protocol:string(_B3),
    {V1_speed, _B5} = protocol:uint16(_B4),
    {V1_dir, _B6} = protocol:uint8(_B5),
    {V1_x, _B7} = protocol:uint16(_B6),
    {V1_y, _B8} = protocol:uint16(_B7),
    {V1_gx, _B9} = protocol:uint16(_B8),
    {V1_gy, _B10} = protocol:uint16(_B9),
    {V1_status, _B11} = protocol:uint8(_B10),
    {V1_action, _B12} = protocol:uint8(_B11),
    {V1_ride, _B13} = protocol:uint8(_B12),
    {V1_event, _B14} = protocol:uint8(_B13),
    {V1_hidden, _B15} = protocol:uint8(_B14),
    {V1_label, _B16} = protocol:uint8(_B15),
    {V1_lev, _B17} = protocol:uint8(_B16),
    {V1_sex, _B18} = protocol:uint8(_B17),
    {V1_classes, _B19} = protocol:uint8(_B18),
    {V1_realm, _B20} = protocol:uint8(_B19),
    {V1_face, _B21} = protocol:uint32(_B20),
    {V1_fc, _B22} = protocol:uint32(_B21),
    {V1_looks, _B29} = protocol:array(_B22,
                                      fun (_B23) ->
                                              {V2_looks_type, _B24} =
                                                  protocol:uint32(_B23),
                                              {V2_looks_mode, _B25} =
                                                  protocol:uint32(_B24),
                                              {V2_looks_val, _B26} =
                                                  protocol:uint32(_B25),
                                              {V2_looks_str, _B27} =
                                                  protocol:string(_B26),
                                              {{V2_looks_type,
                                                V2_looks_mode,
                                                V2_looks_val,
                                                V2_looks_str},
                                               _B27}
                                      end),
    {V1_guild, _B30} = protocol:string(_B29),
    {V1_guild_post, _B31} = protocol:string(_B30),
    {V1_guild_signature, _B32} = protocol:string(_B31),
    {V1_guild_id, _B33} = protocol:uint32(_B32),
    {V1_guild_platform, _B34} = protocol:string(_B33),
    {V1_guild_zone, _B35} = protocol:uint16(_B34),
    {V1_team_status, _B36} = protocol:int8(_B35),
    {V1_team_num, _B37} = protocol:uint8(_B36),
    {V1_lover_rid, _B38} = protocol:uint32(_B37),
    {V1_lover_platform, _B39} = protocol:string(_B38),
    {V1_lover_zone_id, _B40} = protocol:uint16(_B39),
    {V1_lover_name, _B41} = protocol:string(_B40),
    {V1_lover_status, _B42} = protocol:uint32(_B41),
    {V1_team_mark, _B43} = protocol:uint16(_B42),
    {V1_foot_mark, _B44} = protocol:uint16(_B43),
    {ok,
     {V1_rid,
      V1_platform,
      V1_zone_id,
      V1_name,
      V1_speed,
      V1_dir,
      V1_x,
      V1_y,
      V1_gx,
      V1_gy,
      V1_status,
      V1_action,
      V1_ride,
      V1_event,
      V1_hidden,
      V1_label,
      V1_lev,
      V1_sex,
      V1_classes,
      V1_realm,
      V1_face,
      V1_fc,
      V1_looks,
      V1_guild,
      V1_guild_post,
      V1_guild_signature,
      V1_guild_id,
      V1_guild_platform,
      V1_guild_zone,
      V1_team_status,
      V1_team_num,
      V1_lover_rid,
      V1_lover_platform,
      V1_lover_zone_id,
      V1_lover_name,
      V1_lover_status,
      V1_team_mark,
      V1_foot_mark}};
unpack(srv, 10114, _B0) -> {ok, {}};
unpack(cli, 10114, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {ok, {V1_rid, V1_platform, V1_zone_id}};
unpack(srv, 10115, _B0) ->
    {V1_map_base_id, _B1} = protocol:uint32(_B0),
    {V1_x, _B2} = protocol:uint16(_B1),
    {V1_y, _B3} = protocol:uint16(_B2),
    {V1_dir, _B4} = protocol:uint8(_B3),
    {ok, {V1_map_base_id, V1_x, V1_y, V1_dir}};
unpack(cli, 10115, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {V1_dir, _B4} = protocol:uint8(_B3),
    {V1_x, _B5} = protocol:uint16(_B4),
    {V1_y, _B6} = protocol:uint16(_B5),
    {V1_dx, _B7} = protocol:uint16(_B6),
    {V1_dy, _B8} = protocol:uint16(_B7),
    {V1_gx, _B9} = protocol:uint16(_B8),
    {V1_gy, _B10} = protocol:uint16(_B9),
    {ok,
     {V1_rid,
      V1_platform,
      V1_zone_id,
      V1_dir,
      V1_x,
      V1_y,
      V1_dx,
      V1_dy,
      V1_gx,
      V1_gy}};
unpack(srv, 10116, _B0) -> {ok, {}};
unpack(cli, 10116, _B0) ->
    {V1_role_list, _B47} = protocol:array(_B0,
                                          fun (_B1) ->
                                                  {V2_rid, _B2} =
                                                      protocol:uint32(_B1),
                                                  {V2_platform, _B3} =
                                                      protocol:string(_B2),
                                                  {V2_zone_id, _B4} =
                                                      protocol:uint16(_B3),
                                                  {V2_name, _B5} =
                                                      protocol:string(_B4),
                                                  {V2_speed, _B6} =
                                                      protocol:uint16(_B5),
                                                  {V2_dir, _B7} =
                                                      protocol:uint8(_B6),
                                                  {V2_x, _B8} =
                                                      protocol:uint16(_B7),
                                                  {V2_y, _B9} =
                                                      protocol:uint16(_B8),
                                                  {V2_gx, _B10} =
                                                      protocol:uint16(_B9),
                                                  {V2_gy, _B11} =
                                                      protocol:uint16(_B10),
                                                  {V2_status, _B12} =
                                                      protocol:uint8(_B11),
                                                  {V2_action, _B13} =
                                                      protocol:uint8(_B12),
                                                  {V2_ride, _B14} =
                                                      protocol:uint8(_B13),
                                                  {V2_event, _B15} =
                                                      protocol:uint8(_B14),
                                                  {V2_hidden, _B16} =
                                                      protocol:uint8(_B15),
                                                  {V2_label, _B17} =
                                                      protocol:uint8(_B16),
                                                  {V2_lev, _B18} =
                                                      protocol:uint8(_B17),
                                                  {V2_sex, _B19} =
                                                      protocol:uint8(_B18),
                                                  {V2_classes, _B20} =
                                                      protocol:uint8(_B19),
                                                  {V2_realm, _B21} =
                                                      protocol:uint8(_B20),
                                                  {V2_face, _B22} =
                                                      protocol:uint32(_B21),
                                                  {V2_fc, _B23} =
                                                      protocol:uint32(_B22),
                                                  {V2_looks, _B30} =
                                                      protocol:array(_B23,
                                                                     fun
                                                                         (_B24) ->
                                                                             {V3_looks_type,
                                                                              _B25} =
                                                                                 protocol:uint32(_B24),
                                                                             {V3_looks_mode,
                                                                              _B26} =
                                                                                 protocol:uint32(_B25),
                                                                             {V3_looks_val,
                                                                              _B27} =
                                                                                 protocol:uint32(_B26),
                                                                             {V3_looks_str,
                                                                              _B28} =
                                                                                 protocol:string(_B27),
                                                                             {{V3_looks_type,
                                                                               V3_looks_mode,
                                                                               V3_looks_val,
                                                                               V3_looks_str},
                                                                              _B28}
                                                                     end),
                                                  {V2_guild, _B31} =
                                                      protocol:string(_B30),
                                                  {V2_guild_post, _B32} =
                                                      protocol:string(_B31),
                                                  {V2_guild_signature, _B33} =
                                                      protocol:string(_B32),
                                                  {V2_guild_id, _B34} =
                                                      protocol:uint32(_B33),
                                                  {V2_guild_platform, _B35} =
                                                      protocol:string(_B34),
                                                  {V2_guild_zone, _B36} =
                                                      protocol:uint16(_B35),
                                                  {V2_team_status, _B37} =
                                                      protocol:int8(_B36),
                                                  {V2_team_num, _B38} =
                                                      protocol:uint8(_B37),
                                                  {V2_lover_rid, _B39} =
                                                      protocol:uint32(_B38),
                                                  {V2_lover_platform, _B40} =
                                                      protocol:string(_B39),
                                                  {V2_lover_zone_id, _B41} =
                                                      protocol:uint16(_B40),
                                                  {V2_lover_name, _B42} =
                                                      protocol:string(_B41),
                                                  {V2_lover_status, _B43} =
                                                      protocol:uint32(_B42),
                                                  {V2_team_mark, _B44} =
                                                      protocol:uint16(_B43),
                                                  {V2_foot_mark, _B45} =
                                                      protocol:uint16(_B44),
                                                  {{V2_rid,
                                                    V2_platform,
                                                    V2_zone_id,
                                                    V2_name,
                                                    V2_speed,
                                                    V2_dir,
                                                    V2_x,
                                                    V2_y,
                                                    V2_gx,
                                                    V2_gy,
                                                    V2_status,
                                                    V2_action,
                                                    V2_ride,
                                                    V2_event,
                                                    V2_hidden,
                                                    V2_label,
                                                    V2_lev,
                                                    V2_sex,
                                                    V2_classes,
                                                    V2_realm,
                                                    V2_face,
                                                    V2_fc,
                                                    V2_looks,
                                                    V2_guild,
                                                    V2_guild_post,
                                                    V2_guild_signature,
                                                    V2_guild_id,
                                                    V2_guild_platform,
                                                    V2_guild_zone,
                                                    V2_team_status,
                                                    V2_team_num,
                                                    V2_lover_rid,
                                                    V2_lover_platform,
                                                    V2_lover_zone_id,
                                                    V2_lover_name,
                                                    V2_lover_status,
                                                    V2_team_mark,
                                                    V2_foot_mark},
                                                   _B45}
                                          end),
    {ok, {V1_role_list}};
unpack(srv, 10117, _B0) -> {ok, {}};
unpack(cli, 10117, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {V1_name, _B4} = protocol:string(_B3),
    {V1_classes, _B5} = protocol:uint8(_B4),
    {V1_sex, _B6} = protocol:uint8(_B5),
    {V1_looks, _B13} = protocol:array(_B6,
                                      fun (_B7) ->
                                              {V2_looks_type, _B8} =
                                                  protocol:uint32(_B7),
                                              {V2_looks_mode, _B9} =
                                                  protocol:uint32(_B8),
                                              {V2_looks_val, _B10} =
                                                  protocol:uint32(_B9),
                                              {V2_looks_str, _B11} =
                                                  protocol:string(_B10),
                                              {{V2_looks_type,
                                                V2_looks_mode,
                                                V2_looks_val,
                                                V2_looks_str},
                                               _B11}
                                      end),
    {V1_ride, _B14} = protocol:uint8(_B13),
    {V1_guild, _B15} = protocol:string(_B14),
    {V1_guild_post, _B16} = protocol:string(_B15),
    {V1_guild_signature, _B17} = protocol:string(_B16),
    {V1_guild_id, _B18} = protocol:uint32(_B17),
    {V1_guild_platform, _B19} = protocol:string(_B18),
    {V1_guild_zone, _B20} = protocol:uint16(_B19),
    {V1_team_status, _B21} = protocol:int8(_B20),
    {V1_team_num, _B22} = protocol:uint8(_B21),
    {V1_speed, _B23} = protocol:uint16(_B22),
    {V1_event, _B24} = protocol:uint8(_B23),
    {V1_action, _B25} = protocol:uint8(_B24),
    {V1_lover_rid, _B26} = protocol:uint32(_B25),
    {V1_lover_platform, _B27} = protocol:string(_B26),
    {V1_lover_zone_id, _B28} = protocol:uint16(_B27),
    {V1_lover_name, _B29} = protocol:string(_B28),
    {V1_lover_status, _B30} = protocol:uint32(_B29),
    {V1_team_mark, _B31} = protocol:uint16(_B30),
    {V1_foot_mark, _B32} = protocol:uint16(_B31),
    {ok,
     {V1_rid,
      V1_platform,
      V1_zone_id,
      V1_name,
      V1_classes,
      V1_sex,
      V1_looks,
      V1_ride,
      V1_guild,
      V1_guild_post,
      V1_guild_signature,
      V1_guild_id,
      V1_guild_platform,
      V1_guild_zone,
      V1_team_status,
      V1_team_num,
      V1_speed,
      V1_event,
      V1_action,
      V1_lover_rid,
      V1_lover_platform,
      V1_lover_zone_id,
      V1_lover_name,
      V1_lover_status,
      V1_team_mark,
      V1_foot_mark}};
unpack(srv, 10118, _B0) -> {ok, {}};
unpack(cli, 10118, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {V1_mode, _B4} = protocol:uint8(_B3),
    {V1_speed, _B5} = protocol:uint16(_B4),
    {V1_dir, _B6} = protocol:uint8(_B5),
    {V1_x, _B7} = protocol:uint16(_B6),
    {V1_y, _B8} = protocol:uint16(_B7),
    {V1_dest, _B13} = protocol:array(_B8,
                                     fun (_B9) ->
                                             {V2_dx, _B10} =
                                                 protocol:uint16(_B9),
                                             {V2_dy, _B11} =
                                                 protocol:uint16(_B10),
                                             {{V2_dx, V2_dy}, _B11}
                                     end),
    {V1_gx, _B14} = protocol:uint16(_B13),
    {V1_gy, _B15} = protocol:uint16(_B14),
    {ok,
     {V1_rid,
      V1_platform,
      V1_zone_id,
      V1_mode,
      V1_speed,
      V1_dir,
      V1_x,
      V1_y,
      V1_dest,
      V1_gx,
      V1_gy}};
unpack(srv, 10119, _B0) ->
    {V1_map_id, _B1} = protocol:uint32(_B0),
    {V1_x, _B2} = protocol:uint16(_B1),
    {V1_y, _B3} = protocol:uint16(_B2),
    {ok, {V1_map_id, V1_x, V1_y}};
unpack(cli, 10119, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 10120, _B0) -> {ok, {}};
unpack(cli, 10120, _B0) ->
    {V1_unit_list, _B29} = protocol:array(_B0,
                                          fun (_B1) ->
                                                  {V2_battle_id, _B2} =
                                                      protocol:uint32(_B1),
                                                  {V2_id, _B3} =
                                                      protocol:uint32(_B2),
                                                  {V2_base_id, _B4} =
                                                      protocol:uint32(_B3),
                                                  {V2_type, _B5} =
                                                      protocol:uint16(_B4),
                                                  {V2_name, _B6} =
                                                      protocol:string(_B5),
                                                  {V2_status, _B7} =
                                                      protocol:uint8(_B6),
                                                  {V2_guide_lev, _B8} =
                                                      protocol:uint8(_B7),
                                                  {V2_speed, _B9} =
                                                      protocol:uint16(_B8),
                                                  {V2_x, _B10} =
                                                      protocol:uint16(_B9),
                                                  {V2_y, _B11} =
                                                      protocol:uint16(_B10),
                                                  {V2_gx, _B12} =
                                                      protocol:uint16(_B11),
                                                  {V2_gy, _B13} =
                                                      protocol:uint16(_B12),
                                                  {V2_sex, _B14} =
                                                      protocol:uint8(_B13),
                                                  {V2_classes, _B15} =
                                                      protocol:uint8(_B14),
                                                  {V2_looks, _B22} =
                                                      protocol:array(_B15,
                                                                     fun
                                                                         (_B16) ->
                                                                             {V3_looks_type,
                                                                              _B17} =
                                                                                 protocol:uint32(_B16),
                                                                             {V3_looks_mode,
                                                                              _B18} =
                                                                                 protocol:uint32(_B17),
                                                                             {V3_looks_val,
                                                                              _B19} =
                                                                                 protocol:uint32(_B18),
                                                                             {V3_looks_str,
                                                                              _B20} =
                                                                                 protocol:string(_B19),
                                                                             {{V3_looks_type,
                                                                               V3_looks_mode,
                                                                               V3_looks_val,
                                                                               V3_looks_str},
                                                                              _B20}
                                                                     end),
                                                  {V2_prop, _B27} =
                                                      protocol:array(_B22,
                                                                     fun
                                                                         (_B23) ->
                                                                             {V3_prop_key,
                                                                              _B24} =
                                                                                 protocol:uint32(_B23),
                                                                             {V3_prop_val,
                                                                              _B25} =
                                                                                 protocol:string(_B24),
                                                                             {{V3_prop_key,
                                                                               V3_prop_val},
                                                                              _B25}
                                                                     end),
                                                  {{V2_battle_id,
                                                    V2_id,
                                                    V2_base_id,
                                                    V2_type,
                                                    V2_name,
                                                    V2_status,
                                                    V2_guide_lev,
                                                    V2_speed,
                                                    V2_x,
                                                    V2_y,
                                                    V2_gx,
                                                    V2_gy,
                                                    V2_sex,
                                                    V2_classes,
                                                    V2_looks,
                                                    V2_prop},
                                                   _B27}
                                          end),
    {ok, {V1_unit_list}};
unpack(srv, 10122, _B0) -> {ok, {}};
unpack(cli, 10122, _B0) ->
    {V1_role_list, _B47} = protocol:array(_B0,
                                          fun (_B1) ->
                                                  {V2_rid, _B2} =
                                                      protocol:uint32(_B1),
                                                  {V2_platform, _B3} =
                                                      protocol:string(_B2),
                                                  {V2_zone_id, _B4} =
                                                      protocol:uint16(_B3),
                                                  {V2_name, _B5} =
                                                      protocol:string(_B4),
                                                  {V2_speed, _B6} =
                                                      protocol:uint16(_B5),
                                                  {V2_dir, _B7} =
                                                      protocol:uint8(_B6),
                                                  {V2_x, _B8} =
                                                      protocol:uint16(_B7),
                                                  {V2_y, _B9} =
                                                      protocol:uint16(_B8),
                                                  {V2_gx, _B10} =
                                                      protocol:uint16(_B9),
                                                  {V2_gy, _B11} =
                                                      protocol:uint16(_B10),
                                                  {V2_status, _B12} =
                                                      protocol:uint8(_B11),
                                                  {V2_action, _B13} =
                                                      protocol:uint8(_B12),
                                                  {V2_ride, _B14} =
                                                      protocol:uint8(_B13),
                                                  {V2_event, _B15} =
                                                      protocol:uint8(_B14),
                                                  {V2_hidden, _B16} =
                                                      protocol:uint8(_B15),
                                                  {V2_label, _B17} =
                                                      protocol:uint8(_B16),
                                                  {V2_lev, _B18} =
                                                      protocol:uint8(_B17),
                                                  {V2_sex, _B19} =
                                                      protocol:uint8(_B18),
                                                  {V2_classes, _B20} =
                                                      protocol:uint8(_B19),
                                                  {V2_realm, _B21} =
                                                      protocol:uint8(_B20),
                                                  {V2_face, _B22} =
                                                      protocol:uint32(_B21),
                                                  {V2_fc, _B23} =
                                                      protocol:uint32(_B22),
                                                  {V2_looks, _B30} =
                                                      protocol:array(_B23,
                                                                     fun
                                                                         (_B24) ->
                                                                             {V3_looks_type,
                                                                              _B25} =
                                                                                 protocol:uint32(_B24),
                                                                             {V3_looks_mode,
                                                                              _B26} =
                                                                                 protocol:uint32(_B25),
                                                                             {V3_looks_val,
                                                                              _B27} =
                                                                                 protocol:uint32(_B26),
                                                                             {V3_looks_str,
                                                                              _B28} =
                                                                                 protocol:string(_B27),
                                                                             {{V3_looks_type,
                                                                               V3_looks_mode,
                                                                               V3_looks_val,
                                                                               V3_looks_str},
                                                                              _B28}
                                                                     end),
                                                  {V2_guild, _B31} =
                                                      protocol:string(_B30),
                                                  {V2_guild_post, _B32} =
                                                      protocol:string(_B31),
                                                  {V2_guild_signature, _B33} =
                                                      protocol:string(_B32),
                                                  {V2_guild_id, _B34} =
                                                      protocol:uint32(_B33),
                                                  {V2_guild_platform, _B35} =
                                                      protocol:string(_B34),
                                                  {V2_guild_zone, _B36} =
                                                      protocol:uint16(_B35),
                                                  {V2_team_status, _B37} =
                                                      protocol:int8(_B36),
                                                  {V2_team_num, _B38} =
                                                      protocol:uint8(_B37),
                                                  {V2_lover_rid, _B39} =
                                                      protocol:uint32(_B38),
                                                  {V2_lover_platform, _B40} =
                                                      protocol:string(_B39),
                                                  {V2_lover_zone_id, _B41} =
                                                      protocol:uint16(_B40),
                                                  {V2_lover_name, _B42} =
                                                      protocol:string(_B41),
                                                  {V2_lover_status, _B43} =
                                                      protocol:uint32(_B42),
                                                  {V2_team_mark, _B44} =
                                                      protocol:uint16(_B43),
                                                  {V2_foot_mark, _B45} =
                                                      protocol:uint16(_B44),
                                                  {{V2_rid,
                                                    V2_platform,
                                                    V2_zone_id,
                                                    V2_name,
                                                    V2_speed,
                                                    V2_dir,
                                                    V2_x,
                                                    V2_y,
                                                    V2_gx,
                                                    V2_gy,
                                                    V2_status,
                                                    V2_action,
                                                    V2_ride,
                                                    V2_event,
                                                    V2_hidden,
                                                    V2_label,
                                                    V2_lev,
                                                    V2_sex,
                                                    V2_classes,
                                                    V2_realm,
                                                    V2_face,
                                                    V2_fc,
                                                    V2_looks,
                                                    V2_guild,
                                                    V2_guild_post,
                                                    V2_guild_signature,
                                                    V2_guild_id,
                                                    V2_guild_platform,
                                                    V2_guild_zone,
                                                    V2_team_status,
                                                    V2_team_num,
                                                    V2_lover_rid,
                                                    V2_lover_platform,
                                                    V2_lover_zone_id,
                                                    V2_lover_name,
                                                    V2_lover_status,
                                                    V2_team_mark,
                                                    V2_foot_mark},
                                                   _B45}
                                          end),
    {ok, {V1_role_list}};
unpack(srv, 10123, _B0) -> {ok, {}};
unpack(cli, 10123, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {V1_status, _B4} = protocol:uint8(_B3),
    {V1_team_status, _B5} = protocol:int8(_B4),
    {V1_team_num, _B6} = protocol:uint8(_B5),
    {V1_lover_rid, _B7} = protocol:uint32(_B6),
    {V1_lover_platform, _B8} = protocol:string(_B7),
    {V1_lover_zone_id, _B9} = protocol:uint16(_B8),
    {V1_lover_name, _B10} = protocol:string(_B9),
    {V1_lover_status, _B11} = protocol:uint32(_B10),
    {V1_event, _B12} = protocol:uint8(_B11),
    {V1_team_mark, _B13} = protocol:uint16(_B12),
    {V1_foot_mark, _B14} = protocol:uint16(_B13),
    {ok,
     {V1_rid,
      V1_platform,
      V1_zone_id,
      V1_status,
      V1_team_status,
      V1_team_num,
      V1_lover_rid,
      V1_lover_platform,
      V1_lover_zone_id,
      V1_lover_name,
      V1_lover_status,
      V1_event,
      V1_team_mark,
      V1_foot_mark}};
unpack(srv, 10150, _B0) -> {ok, {}};
unpack(cli, 10150, _B0) ->
    {V1_role_list, _B6} = protocol:array(_B0,
                                         fun (_B1) ->
                                                 {V2_rid, _B2} =
                                                     protocol:uint32(_B1),
                                                 {V2_platform, _B3} =
                                                     protocol:string(_B2),
                                                 {V2_zone_id, _B4} =
                                                     protocol:uint16(_B3),
                                                 {{V2_rid,
                                                   V2_platform,
                                                   V2_zone_id},
                                                  _B4}
                                         end),
    {V1_act_type, _B7} = protocol:uint32(_B6),
    {V1_num, _B8} = protocol:uint8(_B7),
    {ok, {V1_role_list, V1_act_type, V1_num}};
unpack(srv, 10160, _B0) -> {ok, {}};
unpack(cli, 10160, _B0) ->
    {V1_battle_id, _B1} = protocol:uint32(_B0),
    {V1_id, _B2} = protocol:uint32(_B1),
    {V1_base_id, _B3} = protocol:uint32(_B2),
    {V1_type, _B4} = protocol:uint16(_B3),
    {V1_name, _B5} = protocol:string(_B4),
    {V1_status, _B6} = protocol:uint8(_B5),
    {V1_guide_lev, _B7} = protocol:uint8(_B6),
    {V1_speed, _B8} = protocol:uint16(_B7),
    {V1_x, _B9} = protocol:uint16(_B8),
    {V1_y, _B10} = protocol:uint16(_B9),
    {V1_gx, _B11} = protocol:uint16(_B10),
    {V1_gy, _B12} = protocol:uint16(_B11),
    {V1_sex, _B13} = protocol:uint8(_B12),
    {V1_classes, _B14} = protocol:uint8(_B13),
    {V1_looks, _B21} = protocol:array(_B14,
                                      fun (_B15) ->
                                              {V2_looks_type, _B16} =
                                                  protocol:uint32(_B15),
                                              {V2_looks_mode, _B17} =
                                                  protocol:uint32(_B16),
                                              {V2_looks_val, _B18} =
                                                  protocol:uint32(_B17),
                                              {V2_looks_str, _B19} =
                                                  protocol:string(_B18),
                                              {{V2_looks_type,
                                                V2_looks_mode,
                                                V2_looks_val,
                                                V2_looks_str},
                                               _B19}
                                      end),
    {V1_prop, _B26} = protocol:array(_B21,
                                     fun (_B22) ->
                                             {V2_prop_key, _B23} =
                                                 protocol:uint32(_B22),
                                             {V2_prop_val, _B24} =
                                                 protocol:string(_B23),
                                             {{V2_prop_key, V2_prop_val}, _B24}
                                     end),
    {ok,
     {V1_battle_id,
      V1_id,
      V1_base_id,
      V1_type,
      V1_name,
      V1_status,
      V1_guide_lev,
      V1_speed,
      V1_x,
      V1_y,
      V1_gx,
      V1_gy,
      V1_sex,
      V1_classes,
      V1_looks,
      V1_prop}};
unpack(srv, 10162, _B0) -> {ok, {}};
unpack(cli, 10162, _B0) ->
    {V1_battle_id, _B1} = protocol:uint32(_B0),
    {V1_id, _B2} = protocol:uint32(_B1),
    {ok, {V1_battle_id, V1_id}};
unpack(srv, 10164, _B0) -> {ok, {}};
unpack(cli, 10164, _B0) ->
    {V1_battle_id, _B1} = protocol:uint32(_B0),
    {V1_id, _B2} = protocol:uint32(_B1),
    {V1_x, _B3} = protocol:uint16(_B2),
    {V1_y, _B4} = protocol:uint16(_B3),
    {V1_dx, _B5} = protocol:uint16(_B4),
    {V1_dy, _B6} = protocol:uint16(_B5),
    {ok, {V1_battle_id, V1_id, V1_x, V1_y, V1_dx, V1_dy}};
unpack(srv, 10165, _B0) -> {ok, {}};
unpack(cli, 10165, _B0) ->
    {V1_battle_id, _B1} = protocol:uint32(_B0),
    {V1_id, _B2} = protocol:uint32(_B1),
    {V1_msg, _B3} = protocol:string(_B2),
    {ok, {V1_battle_id, V1_id, V1_msg}};
unpack(srv, 10166, _B0) -> {ok, {}};
unpack(cli, 10166, _B0) ->
    {V1_battle_id, _B1} = protocol:uint32(_B0),
    {V1_id, _B2} = protocol:uint32(_B1),
    {V1_base_id, _B3} = protocol:uint32(_B2),
    {V1_type, _B4} = protocol:uint16(_B3),
    {V1_name, _B5} = protocol:string(_B4),
    {V1_status, _B6} = protocol:uint8(_B5),
    {V1_sex, _B7} = protocol:uint8(_B6),
    {V1_classes, _B8} = protocol:uint8(_B7),
    {V1_looks, _B15} = protocol:array(_B8,
                                      fun (_B9) ->
                                              {V2_looks_type, _B10} =
                                                  protocol:uint32(_B9),
                                              {V2_looks_mode, _B11} =
                                                  protocol:uint32(_B10),
                                              {V2_looks_val, _B12} =
                                                  protocol:uint32(_B11),
                                              {V2_looks_str, _B13} =
                                                  protocol:string(_B12),
                                              {{V2_looks_type,
                                                V2_looks_mode,
                                                V2_looks_val,
                                                V2_looks_str},
                                               _B13}
                                      end),
    {ok,
     {V1_battle_id,
      V1_id,
      V1_base_id,
      V1_type,
      V1_name,
      V1_status,
      V1_sex,
      V1_classes,
      V1_looks}};
unpack(srv, 10167, _B0) ->
    {V1_map_base_id, _B1} = protocol:uint32(_B0),
    {V1_members, _B10} = protocol:array(_B1,
                                        fun (_B2) ->
                                                {V2_rid, _B3} =
                                                    protocol:uint32(_B2),
                                                {V2_platform, _B4} =
                                                    protocol:string(_B3),
                                                {V2_zone_id, _B5} =
                                                    protocol:uint16(_B4),
                                                {V2_x, _B6} =
                                                    protocol:uint16(_B5),
                                                {V2_y, _B7} =
                                                    protocol:uint16(_B6),
                                                {V2_dir, _B8} =
                                                    protocol:uint8(_B7),
                                                {{V2_rid,
                                                  V2_platform,
                                                  V2_zone_id,
                                                  V2_x,
                                                  V2_y,
                                                  V2_dir},
                                                 _B8}
                                        end),
    {ok, {V1_map_base_id, V1_members}};
unpack(cli, 10167, _B0) -> {ok, {}};
unpack(srv, 10168, _B0) -> {ok, {}};
unpack(cli, 10168, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {V1_dir, _B4} = protocol:int32(_B3),
    {ok, {V1_rid, V1_platform, V1_zone_id, V1_dir}};
unpack(srv, 10169, _B0) -> {ok, {}};
unpack(cli, 10169, _B0) ->
    {V1_role_list, _B7} = protocol:array(_B0,
                                         fun (_B1) ->
                                                 {V2_rid, _B2} =
                                                     protocol:uint32(_B1),
                                                 {V2_platform, _B3} =
                                                     protocol:string(_B2),
                                                 {V2_zone_id, _B4} =
                                                     protocol:uint16(_B3),
                                                 {V2_dir, _B5} =
                                                     protocol:uint8(_B4),
                                                 {{V2_rid,
                                                   V2_platform,
                                                   V2_zone_id,
                                                   V2_dir},
                                                  _B5}
                                         end),
    {ok, {V1_role_list}};
unpack(srv, 10170, _B0) ->
    {V1_map_base_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_map_base_id}};
unpack(cli, 10170, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {ok, {V1_flag}};
unpack(srv, 10171, _B0) -> {ok, {}};
unpack(cli, 10171, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {ok, {V1_flag}};
unpack(srv, 10172, _B0) ->
    {V1_battle_id, _B1} = protocol:uint32(_B0),
    {V1_id, _B2} = protocol:uint32(_B1),
    {V1_base_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_battle_id, V1_id, V1_base_id}};
unpack(cli, 10172, _B0) ->
    {V1_battle_id, _B1} = protocol:uint32(_B0),
    {V1_id, _B2} = protocol:uint32(_B1),
    {V1_base_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_battle_id, V1_id, V1_base_id}};
unpack(srv, 10173, _B0) -> {ok, {}};
unpack(cli, 10173, _B0) ->
    {V1_reason, _B1} = protocol:uint8(_B0),
    {ok, {V1_reason}};
unpack(srv, 10174, _B0) -> {ok, {}};
unpack(cli, 10174, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {ok, {V1_flag}};
unpack(srv, 10175, _B0) -> {ok, {}};
unpack(cli, 10175, _B0) ->
    {V1_driver_id, _B6} = protocol:array(_B0,
                                         fun (_B1) ->
                                                 {V2_rid, _B2} =
                                                     protocol:uint32(_B1),
                                                 {V2_platform, _B3} =
                                                     protocol:string(_B2),
                                                 {V2_zone_id, _B4} =
                                                     protocol:uint16(_B3),
                                                 {{V2_rid,
                                                   V2_platform,
                                                   V2_zone_id},
                                                  _B4}
                                         end),
    {V1_passenger_id, _B12} = protocol:array(_B6,
                                             fun (_B7) ->
                                                     {V2_rid, _B8} =
                                                         protocol:uint32(_B7),
                                                     {V2_platform, _B9} =
                                                         protocol:string(_B8),
                                                     {V2_zone_id, _B10} =
                                                         protocol:uint16(_B9),
                                                     {{V2_rid,
                                                       V2_platform,
                                                       V2_zone_id},
                                                      _B10}
                                             end),
    {ok, {V1_driver_id, V1_passenger_id}};
unpack(_Type, Code, _Data) ->
    {error, {unknown_unpack_command, Code}}.

