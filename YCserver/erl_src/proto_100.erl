-file("src/proto/proto_100.erl", 1).

-module(proto_100).

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

-file("src/proto/proto_100.erl", 14).

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

-file("src/proto/proto_100.erl", 15).

-file("inc/assets.hrl", 1).

-record(assets,
        {ver = 41 :: pos_integer(),
         exp = 0 :: non_neg_integer(),
         coin = 0 :: non_neg_integer(),
         coin_bind = 0 :: non_neg_integer(),
         gold = 0 :: non_neg_integer(),
         gold_bind = 0 :: non_neg_integer(),
         intelligs = 0 :: non_neg_integer(),
         guild = 0 :: non_neg_integer(),
         energy = 0 :: non_neg_integer(),
         satiety = 300 :: non_neg_integer(),
         stars_score = 0 :: non_neg_integer(),
         reserve_exp = 0 :: non_neg_integer(),
         character = 0 :: non_neg_integer(),
         alchemy = 0 :: non_neg_integer(),
         love = 0 :: non_neg_integer(),
         teacher_score = 0 :: non_neg_integer(),
         tournament = 0 :: non_neg_integer(),
         lottery_luck = 0 :: non_neg_integer(),
         endless_challenge = 0 :: non_neg_integer(),
         handbook_point = 0 :: non_neg_integer(),
         autumn_score = 0 :: non_neg_integer(),
         star_gold = 0 :: non_neg_integer(),
         halloween = 0 :: non_neg_integer(),
         thanksgiving = 0 :: non_neg_integer(),
         new_year = 0 :: non_neg_integer(),
         firecracker = 0 :: non_neg_integer(),
         glue_pudding = 0 :: non_neg_integer(),
         crystal = 0 :: non_neg_integer(),
         ticket = 0 :: non_neg_integer(),
         brother = 0 :: non_neg_integer(),
         egg = 0 :: non_neg_integer(),
         exchange = 0 :: non_neg_integer(),
         turn = 0 :: non_neg_integer(),
         father = 0 :: non_neg_integer(),
         lucky_ticket = 0 :: non_neg_integer(),
         dollar = 0 :: non_neg_integer(),
         naughty = 0 :: non_neg_integer(),
         concentric = 0 :: non_neg_integer(),
         qixiIntegral = 0 :: non_neg_integer(),
         sunshine = 0 :: non_neg_integer(),
         cut_price = 0 :: non_neg_integer(),
         single_dog = 0 :: non_neg_integer(),
         panda_score = 0 :: non_neg_integer(),
         joyful_egg = 0 :: non_neg_integer(),
         godswar = 0 :: non_neg_integer(),
         skl_unique_exp = 0 :: non_neg_integer(),
         happy_score = 0 :: non_neg_integer(),
         slot_machine = 0 :: non_neg_integer(),
         reserve_gold = 0 :: non_neg_integer(),
         zillionaire_sc = 0,
         score_exchange = 0 :: non_neg_integer(),
         new_open_turn = 0 :: non_neg_integer(),
         long_active = 0 :: non_neg_integer(),
         long_score = 0 :: non_neg_integer(),
         camp_pray_sc = 0 :: non_neg_integer()}).

-file("src/proto/proto_100.erl", 16).

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

-file("src/proto/proto_100.erl", 17).

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

-file("src/proto/proto_100.erl", 18).

-file("inc/adm.hrl", 1).

-record(m_adm, {last_feedback = 0}).

-record(adm_report_info,
        {id, time, classes, lev, name, report = []}).

-record(adm_report,
        {id,
         order,
         name,
         lev,
         time,
         type,
         reason,
         msg = [],
         flag = 0}).

-record(adm_device_info,
        {id, type = 1 :: non_neg_integer()}).

-record(auth_sfz_cfg,
        {plat_channel = {"", 0},
         platform = "",
         channel_reg = 0,
         name = "",
         can_charge = 1,
         is_nonage = 0,
         charge_limit = 5000,
         is_wallow = 0,
         down_sec = 10800,
         is_show_phone = 0,
         show_info = "gm.3k.com",
         is_mail = 0,
         is_mid_exp = 0,
         is_lev_60 = 0,
         is_need_check = 0}).

-record(role_charge_cfg, {id = {0, "", 0}, label = ""}).

-file("src/proto/proto_100.erl", 19).

-spec pack(srv | cli, non_neg_integer(),
           tuple()) -> {ok, binary()} |
                       {error, {unknown_pack_command, non_neg_integer()}}.

pack(cli, 10000, {}) ->
    {ok, <<2:32/little, 10000:16/little>>};
pack(srv, 10000,
     {V0_id,
      V0_platform,
      V0_zone_id,
      V0_name,
      V0_time_reg,
      V0_sex,
      V0_classes,
      V0_lev,
      V0_label,
      V0_hp,
      V0_mp,
      V0_lover_id,
      V0_lover_platform,
      V0_lover_zone_id,
      V0_lover_name,
      V0_wedding_status,
      V0_lev_break_times,
      V0_last_classes_modify_time,
      V0_classes_modify_times,
      #attr{fc = V0_fc, hp_max = V0_hp_max,
            mp_max = V0_mp_max, atk_speed = V0_atk_speed,
            phy_dmg = V0_phy_dmg, magic_dmg = V0_magic_dmg,
            phy_def = V0_phy_def, magic_def = V0_magic_def,
            crit = V0_crit, tenacity = V0_tenacity,
            accuracy = V0_accuracy, evasion = V0_evasion,
            dmg_ratio = V0_dmg_ratio, def_ratio = V0_def_ratio,
            enhance_control = V0_enhance_control,
            anti_control = V0_anti_control, heal_val = V0_heal_val,
            strength = V0_strength, constitution = V0_constitution,
            magic = V0_magic, agility = V0_agility,
            endurance = V0_endurance, speed = V0_speed},
      V0_point,
      {V0_fid, V0_family_platform, V0_family_zone_id}}) ->
    D_a_t_a = <<V0_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little,
                (protocol:pack(string, V0_name))/binary,
                V0_time_reg:32/little, V0_sex:8/little,
                V0_classes:8/little, V0_lev:8/little, V0_label:8/little,
                V0_hp:32/little, V0_mp:32/little, V0_lover_id:32/little,
                (protocol:pack(string, V0_lover_platform))/binary,
                V0_lover_zone_id:16/little,
                (protocol:pack(string, V0_lover_name))/binary,
                V0_wedding_status:8/little, V0_lev_break_times:8/little,
                V0_last_classes_modify_time:32/little,
                V0_classes_modify_times:32/little, V0_fc:32/little,
                V0_hp_max:32/little, V0_mp_max:32/little,
                V0_atk_speed:16/little, V0_phy_dmg:32/little,
                V0_magic_dmg:32/little, V0_phy_def:32/little,
                V0_magic_def:32/little, V0_crit:16/little,
                V0_tenacity:16/little, V0_accuracy:16/little,
                V0_evasion:16/little, V0_dmg_ratio:16/little,
                V0_def_ratio:16/little, V0_enhance_control:16/little,
                V0_anti_control:16/little, V0_heal_val:16/little,
                V0_strength:16/little, V0_constitution:16/little,
                V0_magic:16/little, V0_agility:16/little,
                V0_endurance:16/little, V0_speed:32/little,
                V0_point:16/little, V0_fid:32/little,
                (protocol:pack(string, V0_family_platform))/binary,
                V0_family_zone_id:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10000:16/little,
       D_a_t_a/binary>>};
pack(cli, 10001, {}) ->
    {ok, <<2:32/little, 10001:16/little>>};
pack(srv, 10001,
     {V0_hp,
      V0_mp,
      #attr{fc = V0_fc, hp_max = V0_hp_max,
            mp_max = V0_mp_max, atk_speed = V0_atk_speed,
            phy_dmg = V0_phy_dmg, magic_dmg = V0_magic_dmg,
            phy_def = V0_phy_def, magic_def = V0_magic_def,
            crit = V0_crit, tenacity = V0_tenacity,
            accuracy = V0_accuracy, evasion = V0_evasion,
            dmg_ratio = V0_dmg_ratio, def_ratio = V0_def_ratio,
            enhance_control = V0_enhance_control,
            anti_control = V0_anti_control, heal_val = V0_heal_val,
            strength = V0_strength, constitution = V0_constitution,
            magic = V0_magic, agility = V0_agility,
            endurance = V0_endurance, speed = V0_speed}}) ->
    D_a_t_a = <<V0_hp:32/little, V0_mp:32/little,
                V0_fc:32/little, V0_hp_max:32/little,
                V0_mp_max:32/little, V0_atk_speed:16/little,
                V0_phy_dmg:32/little, V0_magic_dmg:32/little,
                V0_phy_def:32/little, V0_magic_def:32/little,
                V0_crit:16/little, V0_tenacity:16/little,
                V0_accuracy:16/little, V0_evasion:16/little,
                V0_dmg_ratio:16/little, V0_def_ratio:16/little,
                V0_enhance_control:16/little, V0_anti_control:16/little,
                V0_heal_val:16/little, V0_strength:16/little,
                V0_constitution:16/little, V0_magic:16/little,
                V0_agility:16/little, V0_endurance:16/little,
                V0_speed:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10001:16/little,
       D_a_t_a/binary>>};
pack(cli, 10002, {}) ->
    {ok, <<2:32/little, 10002:16/little>>};
pack(srv, 10002,
     {#assets{coin = V0_coin, gold = V0_gold,
              gold_bind = V0_gold_bind},
      V0_debt_coin,
      V0_debt_gold,
      V0_debt_gold_bind}) ->
    D_a_t_a = <<V0_coin:32/little, V0_gold:32/little,
                V0_gold_bind:32/little, V0_debt_coin:32/little,
                V0_debt_gold:32/little, V0_debt_gold_bind:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10002:16/little,
       D_a_t_a/binary>>};
pack(cli, 10003, {}) ->
    {ok, <<2:32/little, 10003:16/little>>};
pack(srv, 10003,
     {#assets{intelligs = V0_intelligs, guild = V0_guild,
              energy = V0_energy, stars_score = V0_stars_score,
              satiety = V0_satiety, character = V0_character,
              alchemy = V0_alchemy, love = V0_love,
              teacher_score = V0_teacher_score,
              tournament = V0_tournament,
              lottery_luck = V0_lottery_luck,
              handbook_point = V0_handbook_point,
              endless_challenge = V0_endless_challenge,
              autumn_score = V0_autumn_score,
              star_gold = V0_star_gold, halloween = V0_halloween,
              thanksgiving = V0_thanksgiving, new_year = V0_new_year,
              firecracker = V0_firecracker,
              glue_pudding = V0_glue_pudding, crystal = V0_crystal,
              ticket = V0_ticket, brother = V0_brother, egg = V0_egg,
              exchange = V0_exchange, turn = V0_turn,
              father = V0_father, lucky_ticket = V0_lucky_ticket,
              dollar = V0_dollar, naughty = V0_naughty,
              concentric = V0_concentric,
              qixiIntegral = V0_qixiIntegral, sunshine = V0_sunshine,
              cut_price = V0_cut_price, single_dog = V0_single_dog,
              panda_score = V0_panda_score,
              joyful_egg = V0_joyful_egg, godswar = V0_godswar,
              skl_unique_exp = V0_skl_unique_exp,
              happy_score = V0_happy_score,
              slot_machine = V0_slot_machine,
              reserve_gold = V0_reserve_gold,
              zillionaire_sc = V0_zillionaire_sc,
              score_exchange = V0_score_exchange,
              new_open_turn = V0_new_open_turn,
              long_score = V0_long_score,
              camp_pray_sc = V0_camp_pray_sc}}) ->
    D_a_t_a = <<V0_intelligs:32/little, V0_guild:32/little,
                V0_energy:32/little, V0_stars_score:32/little,
                V0_satiety:32/little, V0_character:32/little,
                V0_alchemy:32/little, V0_love:32/little,
                V0_teacher_score:32/little, V0_tournament:32/little,
                V0_lottery_luck:32/little, V0_handbook_point:32/little,
                V0_endless_challenge:32/little,
                V0_autumn_score:32/little, V0_star_gold:32/little,
                V0_halloween:32/little, V0_thanksgiving:32/little,
                V0_new_year:32/little, V0_firecracker:32/little,
                V0_glue_pudding:32/little, V0_crystal:32/little,
                V0_ticket:32/little, V0_brother:32/little,
                V0_egg:32/little, V0_exchange:32/little,
                V0_turn:32/little, V0_father:32/little,
                V0_lucky_ticket:32/little, V0_dollar:32/little,
                V0_naughty:32/little, V0_concentric:32/little,
                V0_qixiIntegral:32/little, V0_sunshine:32/little,
                V0_cut_price:32/little, V0_single_dog:32/little,
                V0_panda_score:32/little, V0_joyful_egg:32/little,
                V0_godswar:32/little, V0_skl_unique_exp:32/little,
                V0_happy_score:32/little, V0_slot_machine:32/little,
                V0_reserve_gold:32/little, V0_zillionaire_sc:32/little,
                V0_score_exchange:32/little, V0_new_open_turn:32/little,
                V0_long_score:32/little, V0_camp_pray_sc:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10003:16/little,
       D_a_t_a/binary>>};
pack(cli, 10004, {}) ->
    {ok, <<2:32/little, 10004:16/little>>};
pack(srv, 10004, {V0_lev, V0_exp, V0_reserve_exp}) ->
    D_a_t_a = <<V0_lev:16/little, V0_exp:32/little,
                V0_reserve_exp:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10004:16/little,
       D_a_t_a/binary>>};
pack(cli, 10005,
     {V0_strength,
      V0_constitution,
      V0_magic,
      V0_agility,
      V0_endurance}) ->
    D_a_t_a = <<V0_strength:16/little,
                V0_constitution:16/little, V0_magic:16/little,
                V0_agility:16/little, V0_endurance:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10005:16/little,
       D_a_t_a/binary>>};
pack(srv, 10005, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10005:16/little,
       D_a_t_a/binary>>};
pack(cli, 10006,
     {V0_strength,
      V0_constitution,
      V0_magic,
      V0_agility,
      V0_endurance}) ->
    D_a_t_a = <<V0_strength:16/little,
                V0_constitution:16/little, V0_magic:16/little,
                V0_agility:16/little, V0_endurance:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10006:16/little,
       D_a_t_a/binary>>};
pack(srv, 10006, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10006:16/little,
       D_a_t_a/binary>>};
pack(cli, 10007, {}) ->
    {ok, <<2:32/little, 10007:16/little>>};
pack(srv, 10007,
     {#m_attr_point{ext_point = V0_ext_point,
                    first_free = V0_first_free, valid_plan = V0_valid_plan,
                    change_plan_times = V0_change_plan_times,
                    plan_data = V0_plan_data},
      V0_point_data}) ->
    D_a_t_a = <<(length(V0_ext_point)):16/little,
                (list_to_binary([<<V1_type:8/little,
                                   V1_point:16/little>>
                                 || {V1_type, V1_point}
                                        <- V0_ext_point]))/binary,
                V0_first_free:8/little, V0_valid_plan:8/little,
                V0_change_plan_times:32/little,
                (length(V0_plan_data)):16/little,
                (list_to_binary([<<V1_index:8/little,
                                   (protocol:pack(string, V1_plan_name))/binary,
                                   V1_strength:16/little,
                                   V1_constitution:16/little,
                                   V1_magic:16/little, V1_agility:16/little,
                                   V1_endurance:16/little, V1_pre_str:16/little,
                                   V1_pre_con:16/little, V1_pre_magic:16/little,
                                   V1_pre_agi:16/little, V1_pre_end:16/little>>
                                 || #attr_point_plan{index = V1_index,
                                                     plan_name = V1_plan_name,
                                                     strength = V1_strength,
                                                     constitution =
                                                         V1_constitution,
                                                     magic = V1_magic,
                                                     agility = V1_agility,
                                                     endurance = V1_endurance,
                                                     pre_str = V1_pre_str,
                                                     pre_con = V1_pre_con,
                                                     pre_magic = V1_pre_magic,
                                                     pre_agi = V1_pre_agi,
                                                     pre_end = V1_pre_end}
                                        <- V0_plan_data]))/binary,
                (length(V0_point_data)):16/little,
                (list_to_binary([<<V1_index:8/little,
                                   V1_point:32/little>>
                                 || {V1_index, V1_point}
                                        <- V0_point_data]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10007:16/little,
       D_a_t_a/binary>>};
pack(cli, 10008, {V0_from}) ->
    D_a_t_a = <<(protocol:pack(string, V0_from))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10008:16/little,
       D_a_t_a/binary>>};
pack(srv, 10008, {}) ->
    {ok, <<2:32/little, 10008:16/little>>};
pack(cli, 10009, {}) ->
    {ok, <<2:32/little, 10009:16/little>>};
pack(srv, 10009, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10009:16/little,
       D_a_t_a/binary>>};
pack(cli, 10010, {V0_op_type}) ->
    D_a_t_a = <<V0_op_type:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10010:16/little,
       D_a_t_a/binary>>};
pack(srv, 10010, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10010:16/little,
       D_a_t_a/binary>>};
pack(cli, 10011, {}) ->
    {ok, <<2:32/little, 10011:16/little>>};
pack(srv, 10011,
     {V0_hp, V0_mp, V0_hp_max, V0_mp_max}) ->
    D_a_t_a = <<V0_hp:32/little, V0_mp:32/little,
                V0_hp_max:32/little, V0_mp_max:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10011:16/little,
       D_a_t_a/binary>>};
pack(cli, 10012, {V0_num}) ->
    D_a_t_a = <<V0_num:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10012:16/little,
       D_a_t_a/binary>>};
pack(srv, 10012, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10012:16/little,
       D_a_t_a/binary>>};
pack(cli, 10013, {}) ->
    {ok, <<2:32/little, 10013:16/little>>};
pack(srv, 10013, {V0_msg}) ->
    D_a_t_a = <<(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10013:16/little,
       D_a_t_a/binary>>};
pack(cli, 10014, {}) ->
    {ok, <<2:32/little, 10014:16/little>>};
pack(srv, 10014, {V0_num, V0_pay_num}) ->
    D_a_t_a = <<V0_num:8/little, V0_pay_num:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10014:16/little,
       D_a_t_a/binary>>};
pack(cli, 10015, {V0_name}) ->
    D_a_t_a = <<(protocol:pack(string, V0_name))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10015:16/little,
       D_a_t_a/binary>>};
pack(srv, 10015,
     {V0_flag, V0_msg, V0_name, V0_num, V0_pay_num}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary,
                (protocol:pack(string, V0_name))/binary,
                V0_num:8/little, V0_pay_num:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10015:16/little,
       D_a_t_a/binary>>};
pack(cli, 10016, {V0_id, V0_platform, V0_zone_id}) ->
    D_a_t_a = <<V0_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10016:16/little,
       D_a_t_a/binary>>};
pack(srv, 10016,
     {#role_profile{id = {V0_rid, V0_platform, V0_zone_id},
                    name = V0_name, name_used = V0_name_used, sex = V0_sex,
                    classes = V0_classes, lev = V0_lev, face = V0_face,
                    fc = V0_fc, looks = V0_looks,
                    team_status = V0_team_status, status = V0_status,
                    achievement_point = V0_achievement_point,
                    guild_id = {V0_g_id, V0_g_platform, V0_g_zone_id},
                    honor_id = V0_honor_id, guild_name = V0_guild_name,
                    lover_name = V0_lover_name,
                    teacher_name = V0_teacher_name,
                    tournament_lev = V0_tournament_lev,
                    family_id =
                        {V0_fid, V0_family_platform, V0_family_zone_id},
                    pre_honor_id = V0_pre_honor_id}}) ->
    D_a_t_a = <<V0_rid:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little,
                (protocol:pack(string, V0_name))/binary,
                (protocol:pack(string, V0_name_used))/binary,
                V0_sex:8/little, V0_classes:8/little, V0_lev:8/little,
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
                V0_team_status:8/signed-little, V0_status:8/little,
                V0_achievement_point:32/signed-little,
                V0_g_id:32/little,
                (protocol:pack(string, V0_g_platform))/binary,
                V0_g_zone_id:16/little, V0_honor_id:32/little,
                (protocol:pack(string, V0_guild_name))/binary,
                (protocol:pack(string, V0_lover_name))/binary,
                (protocol:pack(string, V0_teacher_name))/binary,
                V0_tournament_lev:8/little, V0_fid:32/little,
                (protocol:pack(string, V0_family_platform))/binary,
                V0_family_zone_id:16/little,
                V0_pre_honor_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10016:16/little,
       D_a_t_a/binary>>};
pack(cli, 10017, {V0_id, V0_platform, V0_zone_id}) ->
    D_a_t_a = <<V0_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10017:16/little,
       D_a_t_a/binary>>};
pack(srv, 10017, {V0_role_name_used}) ->
    D_a_t_a = <<(length(V0_role_name_used)):16/little,
                (list_to_binary([<<(protocol:pack(string,
                                                  V1_name))/binary,
                                   V1_time:32/little>>
                                 || #role_name_used{name = V1_name,
                                                    time = V1_time}
                                        <- V0_role_name_used]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10017:16/little,
       D_a_t_a/binary>>};
pack(cli, 10018, {}) ->
    {ok, <<2:32/little, 10018:16/little>>};
pack(srv, 10018,
     {V0_mine,
      V0_max,
      V0_sub_mine,
      V0_sub_max,
      V0_fc_speed_flag}) ->
    D_a_t_a = <<(length(V0_mine)):16/little,
                (list_to_binary([<<V1_type:16/little,
                                   V1_score:32/little>>
                                 || {V1_type, V1_score} <- V0_mine]))/binary,
                (length(V0_max)):16/little,
                (list_to_binary([<<V1_type:16/little,
                                   V1_score:32/little>>
                                 || {V1_type, V1_score} <- V0_max]))/binary,
                (length(V0_sub_mine)):16/little,
                (list_to_binary([<<V1_type:16/little,
                                   V1_score:32/little>>
                                 || {V1_type, V1_score}
                                        <- V0_sub_mine]))/binary,
                (length(V0_sub_max)):16/little,
                (list_to_binary([<<V1_type:16/little,
                                   V1_score:32/little>>
                                 || {V1_type, V1_score} <- V0_sub_max]))/binary,
                V0_fc_speed_flag:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10018:16/little,
       D_a_t_a/binary>>};
pack(cli, 10019, {}) ->
    {ok, <<2:32/little, 10019:16/little>>};
pack(srv, 10019, {V0_cross_type}) ->
    D_a_t_a = <<V0_cross_type:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10019:16/little,
       D_a_t_a/binary>>};
pack(cli, 10020, {}) ->
    {ok, <<2:32/little, 10020:16/little>>};
pack(srv, 10020, {V0_type}) ->
    D_a_t_a = <<V0_type:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10020:16/little,
       D_a_t_a/binary>>};
pack(cli, 10021, {}) ->
    {ok, <<2:32/little, 10021:16/little>>};
pack(srv, 10021, {V0_list}) ->
    D_a_t_a = <<(length(V0_list)):16/little,
                (list_to_binary([<<(protocol:pack(string,
                                                  V1_platform))/binary,
                                   V1_zone_id:32/little>>
                                 || {V1_platform, V1_zone_id}
                                        <- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10021:16/little,
       D_a_t_a/binary>>};
pack(cli, 10022, {V0_device_key}) ->
    D_a_t_a = <<(protocol:pack(string,
                               V0_device_key))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10022:16/little,
       D_a_t_a/binary>>};
pack(srv, 10022, {}) ->
    {ok, <<2:32/little, 10022:16/little>>};
pack(cli, 10023, {}) ->
    {ok, <<2:32/little, 10023:16/little>>};
pack(srv, 10023, {V0_left_point}) ->
    D_a_t_a = <<V0_left_point:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10023:16/little,
       D_a_t_a/binary>>};
pack(cli, 10024, {V0_valid_plan}) ->
    D_a_t_a = <<V0_valid_plan:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10024:16/little,
       D_a_t_a/binary>>};
pack(srv, 10024, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10024:16/little,
       D_a_t_a/binary>>};
pack(cli, 10025, {V0_valid_plan}) ->
    D_a_t_a = <<V0_valid_plan:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10025:16/little,
       D_a_t_a/binary>>};
pack(srv, 10025,
     {V0_hp,
      V0_mp,
      #attr{fc = V0_fc, hp_max = V0_hp_max,
            mp_max = V0_mp_max, atk_speed = V0_atk_speed,
            phy_dmg = V0_phy_dmg, magic_dmg = V0_magic_dmg,
            phy_def = V0_phy_def, magic_def = V0_magic_def,
            crit = V0_crit, tenacity = V0_tenacity,
            accuracy = V0_accuracy, evasion = V0_evasion,
            dmg_ratio = V0_dmg_ratio, def_ratio = V0_def_ratio,
            enhance_control = V0_enhance_control,
            anti_control = V0_anti_control, heal_val = V0_heal_val,
            strength = V0_strength, constitution = V0_constitution,
            magic = V0_magic, agility = V0_agility,
            endurance = V0_endurance, speed = V0_speed}}) ->
    D_a_t_a = <<V0_hp:32/little, V0_mp:32/little,
                V0_fc:32/little, V0_hp_max:32/little,
                V0_mp_max:32/little, V0_atk_speed:16/little,
                V0_phy_dmg:32/little, V0_magic_dmg:32/little,
                V0_phy_def:32/little, V0_magic_def:32/little,
                V0_crit:16/little, V0_tenacity:16/little,
                V0_accuracy:16/little, V0_evasion:16/little,
                V0_dmg_ratio:16/little, V0_def_ratio:16/little,
                V0_enhance_control:16/little, V0_anti_control:16/little,
                V0_heal_val:16/little, V0_strength:16/little,
                V0_constitution:16/little, V0_magic:16/little,
                V0_agility:16/little, V0_endurance:16/little,
                V0_speed:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10025:16/little,
       D_a_t_a/binary>>};
pack(cli, 10026, {}) ->
    {ok, <<2:32/little, 10026:16/little>>};
pack(srv, 10026,
     {V0_strength,
      V0_constitution,
      V0_magic,
      V0_agility,
      V0_endurance}) ->
    D_a_t_a = <<V0_strength:16/signed-little,
                V0_constitution:16/signed-little,
                V0_magic:16/signed-little, V0_agility:16/signed-little,
                V0_endurance:16/signed-little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10026:16/little,
       D_a_t_a/binary>>};
pack(cli, 10027, {V0_classes}) ->
    D_a_t_a = <<V0_classes:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10027:16/little,
       D_a_t_a/binary>>};
pack(srv, 10027,
     {V0_flag, V0_msg, V0_cost, V0_cost_gold, V0_rate}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary,
                V0_cost:32/little, V0_cost_gold:32/little,
                V0_rate:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10027:16/little,
       D_a_t_a/binary>>};
pack(cli, 10028, {V0_classes, V0_cost_type}) ->
    D_a_t_a = <<V0_classes:8/little,
                V0_cost_type:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10028:16/little,
       D_a_t_a/binary>>};
pack(srv, 10028, {V0_flag, V0_msg, V0_classes}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary,
                V0_classes:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10028:16/little,
       D_a_t_a/binary>>};
pack(cli, 10029, {}) ->
    {ok, <<2:32/little, 10029:16/little>>};
pack(srv, 10029,
     {V0_classes,
      V0_last_classes_modify_time,
      V0_classes_modify_times}) ->
    D_a_t_a = <<V0_classes:8/little,
                V0_last_classes_modify_time:32/little,
                V0_classes_modify_times:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10029:16/little,
       D_a_t_a/binary>>};
pack(cli, 10030, {}) ->
    {ok, <<2:32/little, 10030:16/little>>};
pack(srv, 10030, {V0_is_auth, V0_is_adult}) ->
    D_a_t_a = <<V0_is_auth:8/little, V0_is_adult:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10030:16/little,
       D_a_t_a/binary>>};
pack(cli, 10031, {V0_name, V0_sfz_id}) ->
    D_a_t_a = <<(protocol:pack(string, V0_name))/binary,
                (protocol:pack(string, V0_sfz_id))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10031:16/little,
       D_a_t_a/binary>>};
pack(srv, 10031, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10031:16/little,
       D_a_t_a/binary>>};
pack(cli, 10032, {}) ->
    {ok, <<2:32/little, 10032:16/little>>};
pack(srv, 10032, {V0_lev}) ->
    D_a_t_a = <<V0_lev:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10032:16/little,
       D_a_t_a/binary>>};
pack(cli, 10033, {}) ->
    {ok, <<2:32/little, 10033:16/little>>};
pack(srv, 10033, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10033:16/little,
       D_a_t_a/binary>>};
pack(cli, 10034, {}) ->
    {ok, <<2:32/little, 10034:16/little>>};
pack(srv, 10034, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10034:16/little,
       D_a_t_a/binary>>};
pack(cli, 10035, {}) ->
    {ok, <<2:32/little, 10035:16/little>>};
pack(srv, 10035, {V0_auth_sfz_cfg}) ->
    D_a_t_a = <<(length(V0_auth_sfz_cfg)):16/little,
                (list_to_binary([<<(protocol:pack(string,
                                                  V1_platform))/binary,
                                   V1_channel_reg:32/little,
                                   V1_can_charge:8/little,
                                   V1_is_nonage:8/little,
                                   V1_charge_limit:32/little,
                                   V1_is_show_phone:8/little,
                                   (protocol:pack(string, V1_show_info))/binary,
                                   V1_is_lev_60:8/little,
                                   V1_is_need_check:8/little>>
                                 || #auth_sfz_cfg{platform = V1_platform,
                                                  channel_reg = V1_channel_reg,
                                                  can_charge = V1_can_charge,
                                                  is_nonage = V1_is_nonage,
                                                  charge_limit =
                                                      V1_charge_limit,
                                                  is_show_phone =
                                                      V1_is_show_phone,
                                                  show_info = V1_show_info,
                                                  is_lev_60 = V1_is_lev_60,
                                                  is_need_check =
                                                      V1_is_need_check}
                                        <- V0_auth_sfz_cfg]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10035:16/little,
       D_a_t_a/binary>>};
pack(cli, 10036, {V0_mod}) ->
    D_a_t_a = <<V0_mod:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10036:16/little,
       D_a_t_a/binary>>};
pack(srv, 10036, {V0_mod, V0_list}) ->
    D_a_t_a = <<V0_mod:32/little,
                (length(V0_list)):16/little,
                (list_to_binary([<<V1_item_id:32/little,
                                   V1_num:32/little>>
                                 || {V1_item_id, V1_num} <- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10036:16/little,
       D_a_t_a/binary>>};
pack(cli, 10037, {}) ->
    {ok, <<2:32/little, 10037:16/little>>};
pack(srv, 10037, {V0_msg}) ->
    D_a_t_a = <<(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10037:16/little,
       D_a_t_a/binary>>};
pack(cli, 10038, {V0_decision}) ->
    D_a_t_a = <<V0_decision:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10038:16/little,
       D_a_t_a/binary>>};
pack(srv, 10038, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10038:16/little,
       D_a_t_a/binary>>};
pack(cli, 10039, {}) ->
    {ok, <<2:32/little, 10039:16/little>>};
pack(srv, 10039, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10039:16/little,
       D_a_t_a/binary>>};
pack(cli, 10040, {}) ->
    {ok, <<2:32/little, 10040:16/little>>};
pack(srv, 10040, {V0_last_classes, V0_is_use_chance}) ->
    D_a_t_a = <<V0_last_classes:8/little,
                V0_is_use_chance:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10040:16/little,
       D_a_t_a/binary>>};
pack(cli, 10041, {V0_speed}) ->
    D_a_t_a = <<V0_speed:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10041:16/little,
       D_a_t_a/binary>>};
pack(srv, 10041, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 10041:16/little,
       D_a_t_a/binary>>};
pack(_Type, Code, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
             binary()) -> {ok, tuple()} |
                          {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(srv, 10000, _B0) -> {ok, {}};
unpack(cli, 10000, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {V1_name, _B4} = protocol:string(_B3),
    {V1_time_reg, _B5} = protocol:uint32(_B4),
    {V1_sex, _B6} = protocol:uint8(_B5),
    {V1_classes, _B7} = protocol:uint8(_B6),
    {V1_lev, _B8} = protocol:uint8(_B7),
    {V1_label, _B9} = protocol:uint8(_B8),
    {V1_hp, _B10} = protocol:uint32(_B9),
    {V1_mp, _B11} = protocol:uint32(_B10),
    {V1_lover_id, _B12} = protocol:uint32(_B11),
    {V1_lover_platform, _B13} = protocol:string(_B12),
    {V1_lover_zone_id, _B14} = protocol:uint16(_B13),
    {V1_lover_name, _B15} = protocol:string(_B14),
    {V1_wedding_status, _B16} = protocol:uint8(_B15),
    {V1_lev_break_times, _B17} = protocol:uint8(_B16),
    {V1_last_classes_modify_time, _B18} =
        protocol:uint32(_B17),
    {V1_classes_modify_times, _B19} = protocol:uint32(_B18),
    {V1_fc, _B20} = protocol:uint32(_B19),
    {V1_hp_max, _B21} = protocol:uint32(_B20),
    {V1_mp_max, _B22} = protocol:uint32(_B21),
    {V1_atk_speed, _B23} = protocol:uint16(_B22),
    {V1_phy_dmg, _B24} = protocol:uint32(_B23),
    {V1_magic_dmg, _B25} = protocol:uint32(_B24),
    {V1_phy_def, _B26} = protocol:uint32(_B25),
    {V1_magic_def, _B27} = protocol:uint32(_B26),
    {V1_crit, _B28} = protocol:uint16(_B27),
    {V1_tenacity, _B29} = protocol:uint16(_B28),
    {V1_accuracy, _B30} = protocol:uint16(_B29),
    {V1_evasion, _B31} = protocol:uint16(_B30),
    {V1_dmg_ratio, _B32} = protocol:uint16(_B31),
    {V1_def_ratio, _B33} = protocol:uint16(_B32),
    {V1_enhance_control, _B34} = protocol:uint16(_B33),
    {V1_anti_control, _B35} = protocol:uint16(_B34),
    {V1_heal_val, _B36} = protocol:uint16(_B35),
    {V1_strength, _B37} = protocol:uint16(_B36),
    {V1_constitution, _B38} = protocol:uint16(_B37),
    {V1_magic, _B39} = protocol:uint16(_B38),
    {V1_agility, _B40} = protocol:uint16(_B39),
    {V1_endurance, _B41} = protocol:uint16(_B40),
    {V1_speed, _B42} = protocol:uint32(_B41),
    {V1_point, _B43} = protocol:uint16(_B42),
    {V1_fid, _B44} = protocol:uint32(_B43),
    {V1_family_platform, _B45} = protocol:string(_B44),
    {V1_family_zone_id, _B46} = protocol:uint16(_B45),
    {ok,
     {V1_id,
      V1_platform,
      V1_zone_id,
      V1_name,
      V1_time_reg,
      V1_sex,
      V1_classes,
      V1_lev,
      V1_label,
      V1_hp,
      V1_mp,
      V1_lover_id,
      V1_lover_platform,
      V1_lover_zone_id,
      V1_lover_name,
      V1_wedding_status,
      V1_lev_break_times,
      V1_last_classes_modify_time,
      V1_classes_modify_times,
      V1_fc,
      V1_hp_max,
      V1_mp_max,
      V1_atk_speed,
      V1_phy_dmg,
      V1_magic_dmg,
      V1_phy_def,
      V1_magic_def,
      V1_crit,
      V1_tenacity,
      V1_accuracy,
      V1_evasion,
      V1_dmg_ratio,
      V1_def_ratio,
      V1_enhance_control,
      V1_anti_control,
      V1_heal_val,
      V1_strength,
      V1_constitution,
      V1_magic,
      V1_agility,
      V1_endurance,
      V1_speed,
      V1_point,
      V1_fid,
      V1_family_platform,
      V1_family_zone_id}};
unpack(srv, 10001, _B0) -> {ok, {}};
unpack(cli, 10001, _B0) ->
    {V1_hp, _B1} = protocol:uint32(_B0),
    {V1_mp, _B2} = protocol:uint32(_B1),
    {V1_fc, _B3} = protocol:uint32(_B2),
    {V1_hp_max, _B4} = protocol:uint32(_B3),
    {V1_mp_max, _B5} = protocol:uint32(_B4),
    {V1_atk_speed, _B6} = protocol:uint16(_B5),
    {V1_phy_dmg, _B7} = protocol:uint32(_B6),
    {V1_magic_dmg, _B8} = protocol:uint32(_B7),
    {V1_phy_def, _B9} = protocol:uint32(_B8),
    {V1_magic_def, _B10} = protocol:uint32(_B9),
    {V1_crit, _B11} = protocol:uint16(_B10),
    {V1_tenacity, _B12} = protocol:uint16(_B11),
    {V1_accuracy, _B13} = protocol:uint16(_B12),
    {V1_evasion, _B14} = protocol:uint16(_B13),
    {V1_dmg_ratio, _B15} = protocol:uint16(_B14),
    {V1_def_ratio, _B16} = protocol:uint16(_B15),
    {V1_enhance_control, _B17} = protocol:uint16(_B16),
    {V1_anti_control, _B18} = protocol:uint16(_B17),
    {V1_heal_val, _B19} = protocol:uint16(_B18),
    {V1_strength, _B20} = protocol:uint16(_B19),
    {V1_constitution, _B21} = protocol:uint16(_B20),
    {V1_magic, _B22} = protocol:uint16(_B21),
    {V1_agility, _B23} = protocol:uint16(_B22),
    {V1_endurance, _B24} = protocol:uint16(_B23),
    {V1_speed, _B25} = protocol:uint32(_B24),
    {ok,
     {V1_hp,
      V1_mp,
      V1_fc,
      V1_hp_max,
      V1_mp_max,
      V1_atk_speed,
      V1_phy_dmg,
      V1_magic_dmg,
      V1_phy_def,
      V1_magic_def,
      V1_crit,
      V1_tenacity,
      V1_accuracy,
      V1_evasion,
      V1_dmg_ratio,
      V1_def_ratio,
      V1_enhance_control,
      V1_anti_control,
      V1_heal_val,
      V1_strength,
      V1_constitution,
      V1_magic,
      V1_agility,
      V1_endurance,
      V1_speed}};
unpack(srv, 10002, _B0) -> {ok, {}};
unpack(cli, 10002, _B0) ->
    {V1_coin, _B1} = protocol:uint32(_B0),
    {V1_gold, _B2} = protocol:uint32(_B1),
    {V1_gold_bind, _B3} = protocol:uint32(_B2),
    {V1_debt_coin, _B4} = protocol:uint32(_B3),
    {V1_debt_gold, _B5} = protocol:uint32(_B4),
    {V1_debt_gold_bind, _B6} = protocol:uint32(_B5),
    {ok,
     {V1_coin,
      V1_gold,
      V1_gold_bind,
      V1_debt_coin,
      V1_debt_gold,
      V1_debt_gold_bind}};
unpack(srv, 10003, _B0) -> {ok, {}};
unpack(cli, 10003, _B0) ->
    {V1_intelligs, _B1} = protocol:uint32(_B0),
    {V1_guild, _B2} = protocol:uint32(_B1),
    {V1_energy, _B3} = protocol:uint32(_B2),
    {V1_stars_score, _B4} = protocol:uint32(_B3),
    {V1_satiety, _B5} = protocol:uint32(_B4),
    {V1_character, _B6} = protocol:uint32(_B5),
    {V1_alchemy, _B7} = protocol:uint32(_B6),
    {V1_love, _B8} = protocol:uint32(_B7),
    {V1_teacher_score, _B9} = protocol:uint32(_B8),
    {V1_tournament, _B10} = protocol:uint32(_B9),
    {V1_lottery_luck, _B11} = protocol:uint32(_B10),
    {V1_handbook_point, _B12} = protocol:uint32(_B11),
    {V1_endless_challenge, _B13} = protocol:uint32(_B12),
    {V1_autumn_score, _B14} = protocol:uint32(_B13),
    {V1_star_gold, _B15} = protocol:uint32(_B14),
    {V1_halloween, _B16} = protocol:uint32(_B15),
    {V1_thanksgiving, _B17} = protocol:uint32(_B16),
    {V1_new_year, _B18} = protocol:uint32(_B17),
    {V1_firecracker, _B19} = protocol:uint32(_B18),
    {V1_glue_pudding, _B20} = protocol:uint32(_B19),
    {V1_crystal, _B21} = protocol:uint32(_B20),
    {V1_ticket, _B22} = protocol:uint32(_B21),
    {V1_brother, _B23} = protocol:uint32(_B22),
    {V1_egg, _B24} = protocol:uint32(_B23),
    {V1_exchange, _B25} = protocol:uint32(_B24),
    {V1_turn, _B26} = protocol:uint32(_B25),
    {V1_father, _B27} = protocol:uint32(_B26),
    {V1_lucky_ticket, _B28} = protocol:uint32(_B27),
    {V1_dollar, _B29} = protocol:uint32(_B28),
    {V1_naughty, _B30} = protocol:uint32(_B29),
    {V1_concentric, _B31} = protocol:uint32(_B30),
    {V1_qixiIntegral, _B32} = protocol:uint32(_B31),
    {V1_sunshine, _B33} = protocol:uint32(_B32),
    {V1_cut_price, _B34} = protocol:uint32(_B33),
    {V1_single_dog, _B35} = protocol:uint32(_B34),
    {V1_panda_score, _B36} = protocol:uint32(_B35),
    {V1_joyful_egg, _B37} = protocol:uint32(_B36),
    {V1_godswar, _B38} = protocol:uint32(_B37),
    {V1_skl_unique_exp, _B39} = protocol:uint32(_B38),
    {V1_happy_score, _B40} = protocol:uint32(_B39),
    {V1_slot_machine, _B41} = protocol:uint32(_B40),
    {V1_reserve_gold, _B42} = protocol:uint32(_B41),
    {V1_zillionaire_sc, _B43} = protocol:uint32(_B42),
    {V1_score_exchange, _B44} = protocol:uint32(_B43),
    {V1_new_open_turn, _B45} = protocol:uint32(_B44),
    {V1_long_score, _B46} = protocol:uint32(_B45),
    {V1_camp_pray_sc, _B47} = protocol:uint32(_B46),
    {ok,
     {V1_intelligs,
      V1_guild,
      V1_energy,
      V1_stars_score,
      V1_satiety,
      V1_character,
      V1_alchemy,
      V1_love,
      V1_teacher_score,
      V1_tournament,
      V1_lottery_luck,
      V1_handbook_point,
      V1_endless_challenge,
      V1_autumn_score,
      V1_star_gold,
      V1_halloween,
      V1_thanksgiving,
      V1_new_year,
      V1_firecracker,
      V1_glue_pudding,
      V1_crystal,
      V1_ticket,
      V1_brother,
      V1_egg,
      V1_exchange,
      V1_turn,
      V1_father,
      V1_lucky_ticket,
      V1_dollar,
      V1_naughty,
      V1_concentric,
      V1_qixiIntegral,
      V1_sunshine,
      V1_cut_price,
      V1_single_dog,
      V1_panda_score,
      V1_joyful_egg,
      V1_godswar,
      V1_skl_unique_exp,
      V1_happy_score,
      V1_slot_machine,
      V1_reserve_gold,
      V1_zillionaire_sc,
      V1_score_exchange,
      V1_new_open_turn,
      V1_long_score,
      V1_camp_pray_sc}};
unpack(srv, 10004, _B0) -> {ok, {}};
unpack(cli, 10004, _B0) ->
    {V1_lev, _B1} = protocol:uint16(_B0),
    {V1_exp, _B2} = protocol:uint32(_B1),
    {V1_reserve_exp, _B3} = protocol:uint32(_B2),
    {ok, {V1_lev, V1_exp, V1_reserve_exp}};
unpack(srv, 10005, _B0) ->
    {V1_strength, _B1} = protocol:uint16(_B0),
    {V1_constitution, _B2} = protocol:uint16(_B1),
    {V1_magic, _B3} = protocol:uint16(_B2),
    {V1_agility, _B4} = protocol:uint16(_B3),
    {V1_endurance, _B5} = protocol:uint16(_B4),
    {ok,
     {V1_strength,
      V1_constitution,
      V1_magic,
      V1_agility,
      V1_endurance}};
unpack(cli, 10005, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 10006, _B0) ->
    {V1_strength, _B1} = protocol:uint16(_B0),
    {V1_constitution, _B2} = protocol:uint16(_B1),
    {V1_magic, _B3} = protocol:uint16(_B2),
    {V1_agility, _B4} = protocol:uint16(_B3),
    {V1_endurance, _B5} = protocol:uint16(_B4),
    {ok,
     {V1_strength,
      V1_constitution,
      V1_magic,
      V1_agility,
      V1_endurance}};
unpack(cli, 10006, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 10007, _B0) -> {ok, {}};
unpack(cli, 10007, _B0) ->
    {V1_ext_point, _B5} = protocol:array(_B0,
                                         fun (_B1) ->
                                                 {V2_type, _B2} =
                                                     protocol:uint8(_B1),
                                                 {V2_point, _B3} =
                                                     protocol:uint16(_B2),
                                                 {{V2_type, V2_point}, _B3}
                                         end),
    {V1_first_free, _B6} = protocol:uint8(_B5),
    {V1_valid_plan, _B7} = protocol:uint8(_B6),
    {V1_change_plan_times, _B8} = protocol:uint32(_B7),
    {V1_plan_data, _B23} = protocol:array(_B8,
                                          fun (_B9) ->
                                                  {V2_index, _B10} =
                                                      protocol:uint8(_B9),
                                                  {V2_plan_name, _B11} =
                                                      protocol:string(_B10),
                                                  {V2_strength, _B12} =
                                                      protocol:uint16(_B11),
                                                  {V2_constitution, _B13} =
                                                      protocol:uint16(_B12),
                                                  {V2_magic, _B14} =
                                                      protocol:uint16(_B13),
                                                  {V2_agility, _B15} =
                                                      protocol:uint16(_B14),
                                                  {V2_endurance, _B16} =
                                                      protocol:uint16(_B15),
                                                  {V2_pre_str, _B17} =
                                                      protocol:uint16(_B16),
                                                  {V2_pre_con, _B18} =
                                                      protocol:uint16(_B17),
                                                  {V2_pre_magic, _B19} =
                                                      protocol:uint16(_B18),
                                                  {V2_pre_agi, _B20} =
                                                      protocol:uint16(_B19),
                                                  {V2_pre_end, _B21} =
                                                      protocol:uint16(_B20),
                                                  {{V2_index,
                                                    V2_plan_name,
                                                    V2_strength,
                                                    V2_constitution,
                                                    V2_magic,
                                                    V2_agility,
                                                    V2_endurance,
                                                    V2_pre_str,
                                                    V2_pre_con,
                                                    V2_pre_magic,
                                                    V2_pre_agi,
                                                    V2_pre_end},
                                                   _B21}
                                          end),
    {V1_point_data, _B28} = protocol:array(_B23,
                                           fun (_B24) ->
                                                   {V2_index, _B25} =
                                                       protocol:uint8(_B24),
                                                   {V2_point, _B26} =
                                                       protocol:uint32(_B25),
                                                   {{V2_index, V2_point}, _B26}
                                           end),
    {ok,
     {V1_ext_point,
      V1_first_free,
      V1_valid_plan,
      V1_change_plan_times,
      V1_plan_data,
      V1_point_data}};
unpack(srv, 10008, _B0) ->
    {V1_from, _B1} = protocol:string(_B0),
    {ok, {V1_from}};
unpack(cli, 10008, _B0) -> {ok, {}};
unpack(srv, 10009, _B0) -> {ok, {}};
unpack(cli, 10009, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 10010, _B0) ->
    {V1_op_type, _B1} = protocol:uint8(_B0),
    {ok, {V1_op_type}};
unpack(cli, 10010, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 10011, _B0) -> {ok, {}};
unpack(cli, 10011, _B0) ->
    {V1_hp, _B1} = protocol:uint32(_B0),
    {V1_mp, _B2} = protocol:uint32(_B1),
    {V1_hp_max, _B3} = protocol:uint32(_B2),
    {V1_mp_max, _B4} = protocol:uint32(_B3),
    {ok, {V1_hp, V1_mp, V1_hp_max, V1_mp_max}};
unpack(srv, 10012, _B0) ->
    {V1_num, _B1} = protocol:uint16(_B0),
    {ok, {V1_num}};
unpack(cli, 10012, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 10013, _B0) -> {ok, {}};
unpack(cli, 10013, _B0) ->
    {V1_msg, _B1} = protocol:string(_B0),
    {ok, {V1_msg}};
unpack(srv, 10014, _B0) -> {ok, {}};
unpack(cli, 10014, _B0) ->
    {V1_num, _B1} = protocol:uint8(_B0),
    {V1_pay_num, _B2} = protocol:uint8(_B1),
    {ok, {V1_num, V1_pay_num}};
unpack(srv, 10015, _B0) ->
    {V1_name, _B1} = protocol:string(_B0),
    {ok, {V1_name}};
unpack(cli, 10015, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_name, _B3} = protocol:string(_B2),
    {V1_num, _B4} = protocol:uint8(_B3),
    {V1_pay_num, _B5} = protocol:uint8(_B4),
    {ok, {V1_flag, V1_msg, V1_name, V1_num, V1_pay_num}};
unpack(srv, 10016, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {ok, {V1_id, V1_platform, V1_zone_id}};
unpack(cli, 10016, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {V1_name, _B4} = protocol:string(_B3),
    {V1_name_used, _B5} = protocol:string(_B4),
    {V1_sex, _B6} = protocol:uint8(_B5),
    {V1_classes, _B7} = protocol:uint8(_B6),
    {V1_lev, _B8} = protocol:uint8(_B7),
    {V1_face, _B9} = protocol:uint32(_B8),
    {V1_fc, _B10} = protocol:uint32(_B9),
    {V1_looks, _B17} = protocol:array(_B10,
                                      fun (_B11) ->
                                              {V2_looks_type, _B12} =
                                                  protocol:uint32(_B11),
                                              {V2_looks_mode, _B13} =
                                                  protocol:uint32(_B12),
                                              {V2_looks_val, _B14} =
                                                  protocol:uint32(_B13),
                                              {V2_looks_str, _B15} =
                                                  protocol:string(_B14),
                                              {{V2_looks_type,
                                                V2_looks_mode,
                                                V2_looks_val,
                                                V2_looks_str},
                                               _B15}
                                      end),
    {V1_team_status, _B18} = protocol:int8(_B17),
    {V1_status, _B19} = protocol:uint8(_B18),
    {V1_achievement_point, _B20} = protocol:int32(_B19),
    {V1_g_id, _B21} = protocol:uint32(_B20),
    {V1_g_platform, _B22} = protocol:string(_B21),
    {V1_g_zone_id, _B23} = protocol:uint16(_B22),
    {V1_honor_id, _B24} = protocol:uint32(_B23),
    {V1_guild_name, _B25} = protocol:string(_B24),
    {V1_lover_name, _B26} = protocol:string(_B25),
    {V1_teacher_name, _B27} = protocol:string(_B26),
    {V1_tournament_lev, _B28} = protocol:uint8(_B27),
    {V1_fid, _B29} = protocol:uint32(_B28),
    {V1_family_platform, _B30} = protocol:string(_B29),
    {V1_family_zone_id, _B31} = protocol:uint16(_B30),
    {V1_pre_honor_id, _B32} = protocol:uint32(_B31),
    {ok,
     {V1_rid,
      V1_platform,
      V1_zone_id,
      V1_name,
      V1_name_used,
      V1_sex,
      V1_classes,
      V1_lev,
      V1_face,
      V1_fc,
      V1_looks,
      V1_team_status,
      V1_status,
      V1_achievement_point,
      V1_g_id,
      V1_g_platform,
      V1_g_zone_id,
      V1_honor_id,
      V1_guild_name,
      V1_lover_name,
      V1_teacher_name,
      V1_tournament_lev,
      V1_fid,
      V1_family_platform,
      V1_family_zone_id,
      V1_pre_honor_id}};
unpack(srv, 10017, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {ok, {V1_id, V1_platform, V1_zone_id}};
unpack(cli, 10017, _B0) ->
    {V1_role_name_used, _B5} = protocol:array(_B0,
                                              fun (_B1) ->
                                                      {V2_name, _B2} =
                                                          protocol:string(_B1),
                                                      {V2_time, _B3} =
                                                          protocol:uint32(_B2),
                                                      {{V2_name, V2_time}, _B3}
                                              end),
    {ok, {V1_role_name_used}};
unpack(srv, 10018, _B0) -> {ok, {}};
unpack(cli, 10018, _B0) ->
    {V1_mine, _B5} = protocol:array(_B0,
                                    fun (_B1) ->
                                            {V2_type, _B2} =
                                                protocol:uint16(_B1),
                                            {V2_score, _B3} =
                                                protocol:uint32(_B2),
                                            {{V2_type, V2_score}, _B3}
                                    end),
    {V1_max, _B10} = protocol:array(_B5,
                                    fun (_B6) ->
                                            {V2_type, _B7} =
                                                protocol:uint16(_B6),
                                            {V2_score, _B8} =
                                                protocol:uint32(_B7),
                                            {{V2_type, V2_score}, _B8}
                                    end),
    {V1_sub_mine, _B15} = protocol:array(_B10,
                                         fun (_B11) ->
                                                 {V2_type, _B12} =
                                                     protocol:uint16(_B11),
                                                 {V2_score, _B13} =
                                                     protocol:uint32(_B12),
                                                 {{V2_type, V2_score}, _B13}
                                         end),
    {V1_sub_max, _B20} = protocol:array(_B15,
                                        fun (_B16) ->
                                                {V2_type, _B17} =
                                                    protocol:uint16(_B16),
                                                {V2_score, _B18} =
                                                    protocol:uint32(_B17),
                                                {{V2_type, V2_score}, _B18}
                                        end),
    {V1_fc_speed_flag, _B21} = protocol:uint8(_B20),
    {ok,
     {V1_mine,
      V1_max,
      V1_sub_mine,
      V1_sub_max,
      V1_fc_speed_flag}};
unpack(srv, 10019, _B0) -> {ok, {}};
unpack(cli, 10019, _B0) ->
    {V1_cross_type, _B1} = protocol:uint32(_B0),
    {ok, {V1_cross_type}};
unpack(srv, 10020, _B0) -> {ok, {}};
unpack(cli, 10020, _B0) ->
    {V1_type, _B1} = protocol:uint32(_B0),
    {ok, {V1_type}};
unpack(srv, 10021, _B0) -> {ok, {}};
unpack(cli, 10021, _B0) ->
    {V1_list, _B5} = protocol:array(_B0,
                                    fun (_B1) ->
                                            {V2_platform, _B2} =
                                                protocol:string(_B1),
                                            {V2_zone_id, _B3} =
                                                protocol:uint32(_B2),
                                            {{V2_platform, V2_zone_id}, _B3}
                                    end),
    {ok, {V1_list}};
unpack(srv, 10022, _B0) ->
    {V1_device_key, _B1} = protocol:string(_B0),
    {ok, {V1_device_key}};
unpack(cli, 10022, _B0) -> {ok, {}};
unpack(srv, 10023, _B0) -> {ok, {}};
unpack(cli, 10023, _B0) ->
    {V1_left_point, _B1} = protocol:uint32(_B0),
    {ok, {V1_left_point}};
unpack(srv, 10024, _B0) ->
    {V1_valid_plan, _B1} = protocol:uint8(_B0),
    {ok, {V1_valid_plan}};
unpack(cli, 10024, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 10025, _B0) ->
    {V1_valid_plan, _B1} = protocol:uint8(_B0),
    {ok, {V1_valid_plan}};
unpack(cli, 10025, _B0) ->
    {V1_hp, _B1} = protocol:uint32(_B0),
    {V1_mp, _B2} = protocol:uint32(_B1),
    {V1_fc, _B3} = protocol:uint32(_B2),
    {V1_hp_max, _B4} = protocol:uint32(_B3),
    {V1_mp_max, _B5} = protocol:uint32(_B4),
    {V1_atk_speed, _B6} = protocol:uint16(_B5),
    {V1_phy_dmg, _B7} = protocol:uint32(_B6),
    {V1_magic_dmg, _B8} = protocol:uint32(_B7),
    {V1_phy_def, _B9} = protocol:uint32(_B8),
    {V1_magic_def, _B10} = protocol:uint32(_B9),
    {V1_crit, _B11} = protocol:uint16(_B10),
    {V1_tenacity, _B12} = protocol:uint16(_B11),
    {V1_accuracy, _B13} = protocol:uint16(_B12),
    {V1_evasion, _B14} = protocol:uint16(_B13),
    {V1_dmg_ratio, _B15} = protocol:uint16(_B14),
    {V1_def_ratio, _B16} = protocol:uint16(_B15),
    {V1_enhance_control, _B17} = protocol:uint16(_B16),
    {V1_anti_control, _B18} = protocol:uint16(_B17),
    {V1_heal_val, _B19} = protocol:uint16(_B18),
    {V1_strength, _B20} = protocol:uint16(_B19),
    {V1_constitution, _B21} = protocol:uint16(_B20),
    {V1_magic, _B22} = protocol:uint16(_B21),
    {V1_agility, _B23} = protocol:uint16(_B22),
    {V1_endurance, _B24} = protocol:uint16(_B23),
    {V1_speed, _B25} = protocol:uint32(_B24),
    {ok,
     {V1_hp,
      V1_mp,
      V1_fc,
      V1_hp_max,
      V1_mp_max,
      V1_atk_speed,
      V1_phy_dmg,
      V1_magic_dmg,
      V1_phy_def,
      V1_magic_def,
      V1_crit,
      V1_tenacity,
      V1_accuracy,
      V1_evasion,
      V1_dmg_ratio,
      V1_def_ratio,
      V1_enhance_control,
      V1_anti_control,
      V1_heal_val,
      V1_strength,
      V1_constitution,
      V1_magic,
      V1_agility,
      V1_endurance,
      V1_speed}};
unpack(srv, 10026, _B0) -> {ok, {}};
unpack(cli, 10026, _B0) ->
    {V1_strength, _B1} = protocol:int16(_B0),
    {V1_constitution, _B2} = protocol:int16(_B1),
    {V1_magic, _B3} = protocol:int16(_B2),
    {V1_agility, _B4} = protocol:int16(_B3),
    {V1_endurance, _B5} = protocol:int16(_B4),
    {ok,
     {V1_strength,
      V1_constitution,
      V1_magic,
      V1_agility,
      V1_endurance}};
unpack(srv, 10027, _B0) ->
    {V1_classes, _B1} = protocol:uint8(_B0),
    {ok, {V1_classes}};
unpack(cli, 10027, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_cost, _B3} = protocol:uint32(_B2),
    {V1_cost_gold, _B4} = protocol:uint32(_B3),
    {V1_rate, _B5} = protocol:uint32(_B4),
    {ok, {V1_flag, V1_msg, V1_cost, V1_cost_gold, V1_rate}};
unpack(srv, 10028, _B0) ->
    {V1_classes, _B1} = protocol:uint8(_B0),
    {V1_cost_type, _B2} = protocol:uint8(_B1),
    {ok, {V1_classes, V1_cost_type}};
unpack(cli, 10028, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_classes, _B3} = protocol:uint8(_B2),
    {ok, {V1_flag, V1_msg, V1_classes}};
unpack(srv, 10029, _B0) -> {ok, {}};
unpack(cli, 10029, _B0) ->
    {V1_classes, _B1} = protocol:uint8(_B0),
    {V1_last_classes_modify_time, _B2} =
        protocol:uint32(_B1),
    {V1_classes_modify_times, _B3} = protocol:uint32(_B2),
    {ok,
     {V1_classes,
      V1_last_classes_modify_time,
      V1_classes_modify_times}};
unpack(srv, 10030, _B0) -> {ok, {}};
unpack(cli, 10030, _B0) ->
    {V1_is_auth, _B1} = protocol:uint8(_B0),
    {V1_is_adult, _B2} = protocol:uint8(_B1),
    {ok, {V1_is_auth, V1_is_adult}};
unpack(srv, 10031, _B0) ->
    {V1_name, _B1} = protocol:string(_B0),
    {V1_sfz_id, _B2} = protocol:string(_B1),
    {ok, {V1_name, V1_sfz_id}};
unpack(cli, 10031, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 10032, _B0) -> {ok, {}};
unpack(cli, 10032, _B0) ->
    {V1_lev, _B1} = protocol:uint16(_B0),
    {ok, {V1_lev}};
unpack(srv, 10033, _B0) -> {ok, {}};
unpack(cli, 10033, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 10034, _B0) -> {ok, {}};
unpack(cli, 10034, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 10035, _B0) -> {ok, {}};
unpack(cli, 10035, _B0) ->
    {V1_auth_sfz_cfg, _B12} = protocol:array(_B0,
                                             fun (_B1) ->
                                                     {V2_platform, _B2} =
                                                         protocol:string(_B1),
                                                     {V2_channel_reg, _B3} =
                                                         protocol:uint32(_B2),
                                                     {V2_can_charge, _B4} =
                                                         protocol:uint8(_B3),
                                                     {V2_is_nonage, _B5} =
                                                         protocol:uint8(_B4),
                                                     {V2_charge_limit, _B6} =
                                                         protocol:uint32(_B5),
                                                     {V2_is_show_phone, _B7} =
                                                         protocol:uint8(_B6),
                                                     {V2_show_info, _B8} =
                                                         protocol:string(_B7),
                                                     {V2_is_lev_60, _B9} =
                                                         protocol:uint8(_B8),
                                                     {V2_is_need_check, _B10} =
                                                         protocol:uint8(_B9),
                                                     {{V2_platform,
                                                       V2_channel_reg,
                                                       V2_can_charge,
                                                       V2_is_nonage,
                                                       V2_charge_limit,
                                                       V2_is_show_phone,
                                                       V2_show_info,
                                                       V2_is_lev_60,
                                                       V2_is_need_check},
                                                      _B10}
                                             end),
    {ok, {V1_auth_sfz_cfg}};
unpack(srv, 10036, _B0) ->
    {V1_mod, _B1} = protocol:uint32(_B0),
    {ok, {V1_mod}};
unpack(cli, 10036, _B0) ->
    {V1_mod, _B1} = protocol:uint32(_B0),
    {V1_list, _B6} = protocol:array(_B1,
                                    fun (_B2) ->
                                            {V2_item_id, _B3} =
                                                protocol:uint32(_B2),
                                            {V2_num, _B4} =
                                                protocol:uint32(_B3),
                                            {{V2_item_id, V2_num}, _B4}
                                    end),
    {ok, {V1_mod, V1_list}};
unpack(srv, 10037, _B0) -> {ok, {}};
unpack(cli, 10037, _B0) ->
    {V1_msg, _B1} = protocol:string(_B0),
    {ok, {V1_msg}};
unpack(srv, 10038, _B0) ->
    {V1_decision, _B1} = protocol:uint8(_B0),
    {ok, {V1_decision}};
unpack(cli, 10038, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 10039, _B0) -> {ok, {}};
unpack(cli, 10039, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 10040, _B0) -> {ok, {}};
unpack(cli, 10040, _B0) ->
    {V1_last_classes, _B1} = protocol:uint8(_B0),
    {V1_is_use_chance, _B2} = protocol:uint8(_B1),
    {ok, {V1_last_classes, V1_is_use_chance}};
unpack(srv, 10041, _B0) ->
    {V1_speed, _B1} = protocol:uint8(_B0),
    {ok, {V1_speed}};
unpack(cli, 10041, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(_Type, Code, _Data) ->
    {error, {unknown_unpack_command, Code}}.

