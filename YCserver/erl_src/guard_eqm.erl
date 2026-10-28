-file("src/mod/guard/guard_eqm.erl", 1).

-module(guard_eqm).

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

-file("src/mod/guard/guard_eqm.erl", 23).

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

-file("src/mod/guard/guard_eqm.erl", 24).

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

-file("src/mod/guard/guard_eqm.erl", 25).

-file("inc/gain.hrl", 1).

-record(gain,
        {label :: undefined | atom(),
         val :: undefined | term(),
         msg = "" :: list(),
         source = 0 :: non_neg_integer(),
         notice_msg = "" :: list(),
         reason :: undefined | atom(),
         ext = 0 :: term(),
         notice = 0 :: 0..1,
         ext_val = 0}).

-record(loss,
        {label :: undefined | atom(),
         val :: undefined | term(),
         msg = "" :: list(),
         notice_msg = "" :: list(),
         source = 0 :: non_neg_integer(),
         reason :: undefined | atom(),
         ext = 0 :: term(),
         ext_val = 0,
         auto_scene = "" :: list()}).

-record(gain_text_opts,
        {order = loss :: gain | loss,
         gain_tag = "" :: string(),
         loss_tag = "" :: string(),
         split_str = "，" :: string(),
         split_op_str = "，" :: string(),
         merge_type = [] :: list(),
         fly_to_bag = 0 :: non_neg_integer()}).

-file("src/mod/guard/guard_eqm.erl", 26).

-file("inc/notice.hrl", 1).

-record(notice,
        {id = 1 :: pos_integer(),
         type = 0 :: non_neg_integer(),
         pos = 1 :: pos_integer(),
         start_time = 0 :: non_neg_integer(),
         end_time = 0 :: non_neg_integer(),
         msg = "" :: bitstring()}).

-record(notice_board,
        {id = 1,
         type = 1,
         start_time = 0,
         end_time = 0,
         title = "",
         content = "",
         msg = "",
         gain = [],
         condition = []}).

-record(notice_scroll,
        {id = 1,
         type = 1,
         start_time = 0,
         end_time = 0,
         interval_time = 0,
         content = ""}).

-record(notice_board_log, {id = 1, log_list = []}).

-record(campaign_notice,
        {title = [] :: list(),
         content = [] :: list(),
         process = [] :: list(),
         extern_content = [] :: list(),
         rewards = [] :: list()}).

-file("src/mod/guard/guard_eqm.erl", 27).

-file("inc/guard.hrl", 1).

-record(m_guard,
        {ver = 1 :: pos_integer(),
         free_war_ids = [] :: [pos_integer()],
         tactics_fields = [] :: list(),
         tactics_attr = [] :: list(),
         guards = [] :: list()}).

-record(guard_eqm,
        {ver = 5,
         base_id :: undefined | non_neg_integer(),
         type :: undefined | non_neg_integer(),
         lev,
         eqm_attrs = [] :: list(),
         reset_base_id = 0,
         reset_attrs = [] :: list(),
         gem = [] :: list(),
         is_init = 1,
         timeout = 0,
         back_effect_timeout = 0,
         back_effect_attr = []}).

-record(guard_astroid,
        {ver = 2 :: non_neg_integer(),
         aroused = [] :: non_neg_integer(),
         skills = [] :: list(),
         attrs = [] :: list(),
         growth = 0 :: non_neg_integer(),
         active = 0 :: non_neg_integer()}).

-record(guard_astroid_star,
        {ver = 0,
         id = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         exp = 0 :: non_neg_integer(),
         attrs = [] :: list()}).

-record(guard,
        {ver = 2,
         base_id = 0 :: non_neg_integer(),
         war_id = 0 :: non_neg_integer(),
         name = "" :: string(),
         alias = "" :: string(),
         classes = 0 :: non_neg_integer(),
         quality = 0 :: non_neg_integer(),
         status = 0 :: non_neg_integer(),
         tac_pos = 0 :: non_neg_integer(),
         skills = [] :: list(),
         eqm = [] :: list(),
         attr :: undefined | tuple(),
         score = 0 :: non_neg_integer(),
         astroid = #guard_astroid{} :: #guard_astroid{}}).

-record(guard_data,
        {base_id = 0 :: non_neg_integer(),
         name = "" :: binary(),
         alias = "" :: binary(),
         classes = 0 :: non_neg_integer(),
         quality = 0 :: non_neg_integer(),
         loss = [] :: tuple(),
         recruit_lev = 1 :: non_neg_integer(),
         desc = "" :: list(),
         normal_atk_id = 0 :: integer(),
         ai_id = 0 :: integer(),
         base_score = 0,
         growth = 0 :: non_neg_integer()}).

-record(guard_eqm_data,
        {base_id = 0 :: non_neg_integer(),
         lev = 1 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         type = 0 :: non_neg_integer(),
         quality = 0 :: non_neg_integer(),
         loss_coin = 0 :: [tuple()],
         reset_coin = 0 :: [tuple()],
         gem_list = [] :: list()}).

-record(guard_lev_data,
        {base_id :: undefined | non_neg_integer(),
         lev :: undefined | non_neg_integer(),
         lev_up_exp :: undefined | non_neg_integer(),
         attrs = [] :: non_neg_integer()}).

-record(guard_eqm_gem,
        {id = 0, base_id = 0, type = 0, lev = 0}).

-record(guard_eqm_gem_data,
        {base_id = 0,
         next_base_id = 0,
         name = "",
         lev = 0,
         type = 0,
         need_lev = 0,
         loss_coin = [],
         attrs = []}).

-file("src/mod/guard/guard_eqm.erl", 28).

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

-file("src/mod/guard/guard_eqm.erl", 29).

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

-file("src/mod/guard/guard_eqm.erl", 30).

-file("inc/trigger.hrl", 1).

-record(trigger,
        {id = 1 :: pos_integer(),
         label :: undefined | atom(),
         m :: undefined | atom(),
         f :: undefined | function() | atom(),
         a = [] :: list()}).

-record(evt_enter_map,
        {id = 1 :: pos_integer(),
         base_id = 1 :: pos_integer(),
         x = 0 :: non_neg_integer(),
         y = 0 :: non_neg_integer()}).

-record(evt_ico, {id = 0 :: non_neg_integer()}).

-record(evt_close_guide, {id = 0 :: pos_integer()}).

-record(evt_guild, {}).

-record(evt_guild_leave, {val = 0}).

-record(evt_guild_war, {}).

-record(evt_battle_plot,
        {plot_id = 1 :: pos_integer(),
         role_id = {1, "", 0} ::
             {pos_integer(), bitstring(), non_neg_integer()},
         role_name = "" :: bitstring(),
         role_pid :: undefined | pid()}).

-record(evt_plot,
        {id = 1 :: pos_integer(), type = 1 :: pos_integer()}).

-record(evt_shop_buy,
        {assets_type = 0 :: non_neg_integer(),
         val = 0 :: non_neg_integer(),
         base_id = 0 :: non_neg_integer(),
         bind = 0 :: 0..1,
         num = 0 :: non_neg_integer()}).

-record(evt_store_buy, {s_items = []}).

-record(evt_enchant,
        {base_id = 1 :: pos_integer(),
         pre_lev = 1 :: pos_integer(),
         lev = 1 :: pos_integer(),
         type = 0 :: non_neg_integer(),
         pos = 0 :: non_neg_integer(),
         quality = 0 :: non_neg_integer()}).

-record(evt_select, {type = 0 :: non_neg_integer()}).

-record(evt_guild_lev, {}).

-record(evt_skill_up, {id = 0, lev = 0}).

-record(evt_skill_unique_up, {id = 0, lev = 0}).

-record(evt_quest_treasure, {}).

-record(evt_fc,
        {val :: undefined | pos_integer(),
         now_val = 0 :: non_neg_integer()}).

-record(evt_wedding_score, {}).

-record(evt_wedding_req_agreed, {}).

-record(evt_wedding_marry, {}).

-record(evt_wedding_divorce, {}).

-record(evt_guard, {base_id = 0, num = 0}).

-record(evt_leave_map,
        {id = 1 :: pos_integer(),
         base_id = 1 :: pos_integer(),
         x = 0 :: non_neg_integer(),
         y = 0 :: non_neg_integer()}).

-record(evt_move_map,
        {base_id = 1 :: non_neg_integer(),
         x = 0 :: non_neg_integer(),
         y = 0 :: non_neg_integer()}).

-record(evt_dungeon_enter,
        {id = 0 :: non_neg_integer()}).

-record(evt_dungeon_exit,
        {id = 0 :: non_neg_integer()}).

-record(evt_dungeon_pass,
        {id = 0 :: non_neg_integer()}).

-record(evt_dungeon_kill_unit,
        {dun_id = 0, unit_id = 0}).

-record(evt_dungeon_unit_reward,
        {id = 0 :: non_neg_integer()}).

-record(evt_get_item,
        {base_id = 1 :: pos_integer(),
         num = 1 :: pos_integer()}).

-record(evt_use_item,
        {base_id :: undefined | pos_integer(),
         num = 0 :: pos_integer()}).

-record(evt_use_item_type,
        {type = 0 :: non_neg_integer()}).

-record(evt_del_item,
        {base_id :: undefined | pos_integer(),
         num = 0 :: pos_integer()}).

-record(evt_gain_coin,
        {val = 1 :: pos_integer(),
         source :: undefined | atom()}).

-record(evt_have_coin, {val = 1 :: pos_integer()}).

-record(evt_loss_coin,
        {val = 1 :: pos_integer(),
         reason :: undefined | atom()}).

-record(evt_gain_gold,
        {val = 1 :: pos_integer(),
         source :: undefined | atom()}).

-record(evt_loss_gold,
        {val = 1 :: pos_integer(),
         reason :: undefined | atom()}).

-record(evt_loss_gold_bind, {val = 1 :: pos_integer()}).

-record(evt_levup,
        {old_lev = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer()}).

-record(evt_logout, {}).

-record(evt_tower, {floor = 0, unit_id = 0}).

-record(evt_tower_floor, {floor = 0}).

-record(evt_glory, {lev_id = 0}).

-record(evt_reset_eqm, {type = 0}).

-record(evt_cli_loaded, {mod = 0 :: non_neg_integer()}).

-record(evt_eqm, {type = 0}).

-record(evt_pet_war, {base_id = 0}).

-record(evt_pet_skill, {base_id = 0}).

-record(evt_pet_rest, {base_id = 0}).

-record(evt_select_pet, {}).

-record(evt_get_pet,
        {base_id = 0,
         genre = 0,
         lev = 0,
         status = 0,
         is_catched = false,
         talent = 0}).

-record(evt_del_pet, {base_id = 0, num = 0}).

-record(evt_levup_pet,
        {pet_id = 0, base_id = 0, lev = 0}).

-record(evt_aptitude_pet, {base_id = 0, genre = 0}).

-record(evt_pick_flower, {id}).

-record(evt_send_flower,
        {num = 0, val = 0, base_id = 0, recv_id, items = []}).

-record(evt_recv_flower, {num = 0, val = 0, send_id}).

-record(evt_accept_quest, {id = 0 :: pos_integer()}).

-record(evt_commit_quest,
        {id = 0 :: pos_integer(), sec_type = 0}).

-record(evt_finish_quest, {id = 0 :: pos_integer()}).

-record(evt_quest_guild_round, {}).

-record(evt_commit_quest_chain,
        {id = 0 :: pos_integer(), type = 0}).

-record(evt_giveup_quest, {id = 0 :: pos_integer()}).

-record(evt_quest_del, {id = 0 :: pos_integer()}).

-record(evt_map_role_enter,
        {id = 0 :: non_neg_integer(),
         platform = <<>> :: bitstring(),
         zone_id = 0 :: non_neg_integer(),
         map_id = 1 :: pos_integer(),
         map_base_id = 1 :: pos_integer(),
         x = 0 :: non_neg_integer(),
         y = 0 :: non_neg_integer()}).

-record(evt_map_role_move,
        {role_id = {0, "", 0},
         role_pid = 0 :: non_neg_integer() | pid(),
         map_id = 1 :: pos_integer(),
         map_base_id = 1 :: pos_integer(),
         sx = 0 :: non_neg_integer(),
         sy = 0 :: non_neg_integer(),
         dx = 0 :: non_neg_integer(),
         dy = 0 :: non_neg_integer(),
         event = 0 :: non_neg_integer()}).

-record(evt_map_role_leave,
        {role_pid = 0 :: non_neg_integer() | pid(),
         map_id = 1 :: pos_integer(),
         map_base_id = 1 :: pos_integer()}).

-record(evt_combat_round,
        {round :: undefined | pos_integer(),
         self = [] :: [tuple()],
         opp = [] :: [tuple()]}).

-record(evt_combat_init,
        {self = [] :: [tuple()], opp = [] :: [tuple()]}).

-record(evt_kill_npc,
        {id = 0 :: non_neg_integer(),
         base_id = 1 :: pos_integer(),
         origin_id = {1, 1} :: tuple(),
         ratio_val = 0,
         num = 1 :: pos_integer()}).

-record(evt_kill_npc_lose,
        {id = 0 :: non_neg_integer(),
         base_id = 1 :: pos_integer(),
         num = 1 :: pos_integer()}).

-record(evt_kill_role_clone,
        {id = {0, "robot", 0}, ratio_val = 0}).

-record(evt_fight_unit,
        {id = 0 :: non_neg_integer(),
         base_id = 1 :: pos_integer(),
         num = 1 :: pos_integer()}).

-record(evt_mount_combat,
        {combat_type = 0 :: non_neg_integer(),
         is_win = 0 :: non_neg_integer()}).

-record(evt_unit_click,
        {id = 0 :: non_neg_integer(),
         role_id = {0, "", 0},
         name = "",
         pid,
         type = 0 :: non_neg_integer(),
         base_id = 0 :: non_neg_integer(),
         do_type = -1 :: integer()}).

-record(evt_online_time, {acc_time = 0, add_val = 0}).

-record(evt_battle_role_enter,
        {id = 0 :: non_neg_integer(),
         platform = "" :: bitstring(),
         zone_id = 0 :: non_neg_integer(),
         pid :: undefined | pid(),
         conn_pid :: undefined | pid(),
         name = "" :: bitstring(),
         dun_id = 0 :: non_neg_integer(),
         last_pos = {0, 0, 0} ::
             {non_neg_integer(),
              non_neg_integer(),
              non_neg_integer()},
         enter_pos = {0, 0, 0} ::
             {non_neg_integer(),
              non_neg_integer(),
              non_neg_integer()},
         dun_role :: undefined | tuple()}).

-record(evt_battle_enter_map,
        {id = {0, "", 0} ::
             {non_neg_integer(), bitstring(), non_neg_integer()},
         name = "" :: bitstring(),
         pid :: undefined | pid(),
         map_base_id = 0 :: non_neg_integer()}).

-record(evt_battle_role_login,
        {id = 0 :: non_neg_integer(),
         platform = "" :: bitstring(),
         zone_id = 0 :: non_neg_integer(),
         pid :: undefined | pid(),
         conn_pid :: undefined | pid(),
         name = "" :: bitstring(),
         last_pos = {0, 0, 0} ::
             {non_neg_integer(),
              non_neg_integer(),
              non_neg_integer()},
         enter_pos = {0, 0, 0} ::
             {non_neg_integer(),
              non_neg_integer(),
              non_neg_integer()}}).

-record(evt_battle_role_exit,
        {id = 0 :: non_neg_integer(),
         platform = "" :: bitstring(),
         zone_id = 0 :: non_neg_integer(),
         name = "" :: bitstring()}).

-record(evt_battle_role_logout,
        {id = 0 :: non_neg_integer(),
         platform = "" :: bitstring(),
         zone_id = 0 :: non_neg_integer(),
         name = "" :: bitstring(),
         ext_id = 0 :: non_neg_integer()}).

-record(evt_battle_unit_killed,
        {unit_id = {1, 1} :: {pos_integer(), pos_integer()},
         base_id = 1 :: pos_integer(),
         type = 1 :: pos_integer(),
         role_list = [] ::
             [{role_id(), list(), undefined | pid()}]}).

-record(evt_battle_unit_picked,
        {unit_id = {1, 1} :: {pos_integer(), pos_integer()},
         base_id = 1 :: pos_integer(),
         type = 102 :: pos_integer(),
         action_type = 1 :: pos_integer(),
         map_base_id = 1,
         x = 1,
         y = 1,
         role_id = {1, "", 0},
         role_name = "",
         role_pid}).

-record(evt_battle_unit_die,
        {unit_id = {1, 1} :: {pos_integer(), pos_integer()},
         base_id = 1 :: pos_integer(),
         type = 1 :: pos_integer()}).

-record(evt_create_unit,
        {unit_id = {1, 1}, base_id = 1, type = 1}).

-record(evt_team_join, {pid :: undefined | pid()}).

-record(evt_team_leave, {}).

-record(evt_team_away, {}).

-record(evt_team_follow, {}).

-record(evt_team_appoint, {status, leader_id}).

-record(evt_arena_fight, {}).

-record(evt_arena_win, {cup = 0}).

-record(evt_trial, {mode = 0}).

-record(evt_escort, {}).

-record(evt_friend, {num = 0}).

-record(evt_fairyland, {}).

-record(evt_fairyland_floor,
        {floor = 0, is_leader = 0}).

-record(evt_fairyland_box, {box_punish = 0}).

-record(evt_pet, {}).

-record(evt_pet_lev, {old_lev = 0, lev = 0}).

-record(evt_quest_offer_ring, {ring = 0, old_ring = 0}).

-record(evt_quest_offer_reward, {}).

-record(evt_qualifying_combat, {type = 0}).

-record(evt_qualifying_combat_over,
        {type = 0, win_flag = 0}).

-record(evt_guild_answer, {}).

-record(evt_parade, {}).

-record(evt_market_silver_first_on_sale, {}).

-record(evt_market_gold_bind_buy,
        {base_id = 0,
         num = 0,
         init_price = 0,
         price = 0,
         margin = 0}).

-record(evt_market_gold_bind_sold,
        {base_id = 0, price = 0}).

-record(evt_kill_guild_robber, {}).

-record(evt_shipping_sail, {type = 0}).

-record(evt_shipping_commit, {type = 0, pack_type = 0}).

-record(evt_shipping_help, {}).

-record(evt_treasure, {base_id = 0}).

-record(evt_treasure_compass, {}).

-record(evt_guild_propagate, {}).

-record(evt_pay, {sn = "", gold = 0, source = 0}).

-record(evt_kill_treasure_ghost, {}).

-record(evt_pray, {}).

-record(evt_skill_prac_levup, {id = 0, lev = 0}).

-record(evt_skill_life_levup, {id = 0, lev = 0}).

-record(evt_skill_life_produce,
        {id = 0, base_id = 0, num = 0}).

-record(evt_blacksmith_embed, {num = 0}).

-record(evt_blacksmith_embed_lev, {lev = 0}).

-record(evt_blacksmith_enchant,
        {base_id = 0,
         is_succ = 0,
         luck_list = 0,
         is_protect = 0,
         all_lev = 0,
         pre_all_lev = 0,
         sum_lev = 0,
         pre_sum_lev = 0}).

-record(evt_guild_plant_mature, {}).

-record(evt_examination, {type = 1 :: 1..3}).

-record(evt_question_match, {score = 0}).

-record(evt_question_match_answer, {is_right = 0}).

-record(evt_question_match_mvp, {}).

-record(evt_question_match_last_right, {count = 0}).

-record(evt_warrior_fight, {win_flag = 0}).

-record(evt_warrior_reward, {win_flag = 0, score = 0}).

-record(evt_warrior, {}).

-record(evt_gold_league_fight, {win_flag = 0}).

-record(evt_gold_league_reward,
        {win_flag = 0, score = 0}).

-record(evt_gold_league, {}).

-record(evt_achievement, {id = 0}).

-record(evt_gain_achieve, {val = 0}).

-record(evt_gain_gold_bind,
        {val = 1 :: pos_integer(),
         source :: undefined | atom()}).

-record(evt_have_gold_bind, {val = 1 :: pos_integer()}).

-record(evt_wing,
        {grade = 1 :: pos_integer(),
         growth = 1 :: pos_integer(),
         star = 0}).

-record(evt_wing_reset, {}).

-record(evt_wing_skill, {count = 0}).

-record(evt_wing_lev,
        {grade = 1 :: pos_integer(), star_lev = 0}).

-record(evt_fuse, {base_id = 0 :: non_neg_integer()}).

-record(evt_guild_post,
        {post = 0 :: non_neg_integer()}).

-record(evt_examination_answer,
        {is_right = 1 :: 1 | 2}).

-record(evt_pet_use_item, {base_id = 0}).

-record(evt_pet_repleace_skill, {}).

-record(evt_activity, {val = 0}).

-record(evt_pet_rename, {}).

-record(evt_pet_free, {}).

-record(evt_pet_stone_upgrade, {grade = 0}).

-record(evt_guard_upgrade_eqm, {}).

-record(evt_guard_reset_eqm, {}).

-record(evt_guard_embed_gem, {}).

-record(evt_friend_intimacy, {val = 0}).

-record(evt_friend_intimacy_camp,
        {val = 0, target_id = {0, "", 0}}).

-record(evt_friend_zone_photo, {}).

-record(evt_friend_zone_like, {val = 0}).

-record(evt_friend_zone_liked, {val = 0}).

-record(evt_friend_zone_like_baby, {val = 0}).

-record(evt_friend_zone_leave_trend, {}).

-record(evt_friend_zone_leave_trended, {val = 0}).

-record(evt_formation_lev, {id = 0, lev = 0}).

-record(evt_alchemy_produce, {item_list = []}).

-record(evt_alchemy_melt, {item_list = []}).

-record(evt_classes_challenge_order, {order = 0}).

-record(evt_classes_challenge_rank, {rank = 0}).

-record(evt_classes_challenge_up_rank, {rank = 0}).

-record(evt_market_silver_assets,
        {assets = coin, val = 0}).

-record(evt_market_silver_sold,
        {assets = [], sold_items = []}).

-record(evt_market_silver_buy, {num = 0}).

-record(evt_combat_statistics,
        {revive = 0,
         pet_revive = 0,
         cast_pet = 0,
         use_item = 0,
         is_win = 0,
         is_die = 0,
         guard = [],
         kill_group = 0,
         killed_group = 0,
         kill_group_pet = 0,
         kill_group_target = 0,
         killed_group_target = 0,
         kill_group_target_pet = 0}).

-record(evt_honor, {id = 0}).

-record(evt_pre_honor, {pre_id = 0}).

-record(evt_fashion, {}).

-record(evt_gain_character, {val = 1 :: pos_integer()}).

-record(evt_campaign_unit_match, {val = 0}).

-record(evt_campaign_unit_heap2, {val = 0}).

-record(evt_campaign_unit_match_boss, {val = 0}).

-record(evt_campaign_unit_card, {val = 0}).

-record(evt_campaign_unit_card_boss, {val = 0}).

-record(evt_campaign_unit_order, {val = 0}).

-record(evt_campaign_unit_order_boss, {val = 0}).

-record(evt_campaign_unit_steal, {val = 0}).

-record(evt_campaign_unit_kill, {val = 0}).

-record(evt_campaign_unit_base, {val = 0}).

-record(evt_campaign_unit_kill_boss, {val = 0}).

-record(evt_campaign_unit_fox, {val = 0}).

-record(evt_qualifying, {}).

-record(evt_gain_guild, {val = 1 :: pos_integer()}).

-record(evt_guard_score,
        {val = 0 :: non_neg_integer()}).

-record(evt_constellation,
        {lev = 0 :: non_neg_integer(),
         base_id = 0 :: non_neg_integer()}).

-record(evt_constellation_score,
        {lev = 0 :: non_neg_integer(),
         base_id = 0 :: non_neg_integer()}).

-record(evt_roll,
        {point = 0 :: non_neg_integer(),
         reward = 0 :: non_neg_integer()}).

-record(evt_finish_marriage_question, {}).

-record(evt_commit_marriage_question, {}).

-record(evt_marriage_flower, {}).

-record(evt_finish_couple_question, {}).

-record(evt_finish_couple_task, {}).

-record(evt_commit_couple_question, {}).

-record(evt_couple_flower, {}).

-record(evt_cultivate_plant, {}).

-record(evt_guild_plant_irrigate, {}).

-record(evt_teacher_score_sum, {score = 0}).

-record(evt_teacher_student, {num = 0}).

-record(evt_finish_ask_question, {fun_type = 0}).

-record(evt_teacher_to_sudent, {id = {0, "", 0}}).

-record(evt_teacher, {num = 0}).

-record(evt_commit_ask_question, {}).

-record(evt_get_pet_item_skill_guide, {}).

-record(evt_brave_trial_order, {order = 0}).

-record(evt_shipping_dun, {flag = 0}).

-record(evt_consume, {gold = 0, source = 0}).

-record(evt_guild_hero, {}).

-record(evt_hero, {}).

-record(evt_lover_combat, {win_flag = 0}).

-record(evt_wedding_treasure, {base_id = 0}).

-record(evt_constellation_first, {base_id = 0}).

-record(evt_boss_first, {base_id = 0}).

-record(evt_quest_prac_help, {}).

-record(evt_arena_win_rate, {classes = 0, rate = 0}).

-record(evt_wedding_guest, {}).

-record(evt_dragon_boat, {camp_id = 0}).

-record(evt_dragon_boat_rank, {camp_id = 0, rank = 0}).

-record(evt_dragon_boat_cplt,
        {camp_id = 0, time_span = 0}).

-record(evt_mount_dye_diff, {dye_id = 0, val = 0}).

-record(evt_arena_cup, {cup = 0}).

-record(evt_arena_cup_target, {id = 0}).

-record(evt_arena_roll, {flag = 0, num = 0}).

-record(evt_achi_num, {id = 0, num = 0}).

-record(evt_dun_first, {id = 0, floor = 0}).

-record(evt_tournament_combat, {type = 0}).

-record(evt_comprehend_eqm, {}).

-record(evt_elf_combat, {}).

-record(evt_finish_goal, {id = 0}).

-record(evt_hide_seek, {}).

-record(evt_hide_seek_help, {}).

-record(evt_hide_seek_reward, {}).

-record(evt_camp_fruit, {base_id = 0, num = 0}).

-record(evt_camp_fruit_help, {base_id = 0, num = 0}).

-record(evt_camp_fruit_reward, {}).

-record(evt_tournament,
        {awesome_kill = 0,
         awesome_kill_num = 0,
         awesome_dmg = 0,
         awesome_heal = 0,
         awesome_control = 0,
         mvp = 0,
         rank_lev = 0,
         liked = 0 :: non_neg_integer(),
         best_win_count = 0 :: non_neg_integer()}).

-record(evt_tournament_point,
        {rank_lev = 0, rank_point = 0}).

-record(evt_friend_circle,
        {photos = 0, mentions = 0, day_num = 0}).

-record(evt_friend_circle_liked, {num = 0, other = 0}).

-record(evt_friend_circle_like, {self = 0}).

-record(evt_friend_circle_commented,
        {num = 0, other = 0}).

-record(evt_friend_circle_comment, {self = 0}).

-record(evt_family_update, {type = 0, lev = 0}).

-record(evt_family, {lev = 0}).

-record(evt_family_env, {env = 0}).

-record(evt_family_self_magic_beans, {}).

-record(evt_family_help_magic_beans, {}).

-record(evt_family_furnishing, {type = 0, count = 0}).

-record(evt_own_mount, {status = 0, count = 0}).

-record(evt_mount_growth, {growth = 0}).

-record(evt_mount_appearand, {count = 0}).

-record(evt_mount_mange_pet, {}).

-record(evt_mount_lev, {lev = 0}).

-record(evt_mount_attr, {}).

-record(evt_everyday, {val = 0}).

-record(evt_campaign_reward,
        {type = 0, sec_type = 0, id = 0}).

-record(evt_wedding_day, {day = 0}).

-record(evt_lev_break, {}).

-record(evt_enjoy_moon, {}).

-record(evt_enjoy_moon_wish, {type = 1}).

-record(evt_join_glue_pudding, {}).

-record(evt_glue_pudding_answer, {result = 0}).

-record(evt_glue_pudding_win, {}).

-record(evt_join_kongming_lanterns, {camp_id = 0}).

-record(evt_kongming_lanterns_answer,
        {camp_id = 0, result = 0}).

-record(evt_kongming_lanterns_win, {camp_id = 0}).

-record(evt_join_mid_pudding, {}).

-record(evt_mid_pudding_answer, {result = 0}).

-record(evt_mid_pudding_win, {}).

-record(evt_mid_pudding_agenda, {}).

-record(evt_guild_dragon, {}).

-record(evt_lev_break_active, {}).

-record(evt_camp_cake_finish, {}).

-record(evt_camp_cake_exit, {}).

-record(evt_camp_cake_sub, {}).

-record(evt_national_wisdom, {}).

-record(evt_national_wisdom_right, {}).

-record(evt_national_wisdom_luckyer, {}).

-record(evt_campaign_bag_fill, {}).

-record(evt_rainbow_lottery_day, {}).

-record(evt_campaign_bag_reward, {}).

-record(evt_lev_break_exch, {val = 0}).

-record(evt_classes_modify_times, {times = 0}).

-record(evt_use_fruit_limit, {base_id = 0, lev = 0}).

-record(endless_challenge_cross, {wave = 0}).

-record(endless_challenge_card, {}).

-record(evt_camp_halloween, {}).

-record(evt_camp_halloween_rank, {win = 0, rank = 0}).

-record(evt_camp_halloween_first, {}).

-record(evt_sworn_finish, {times = 0}).

-record(evt_sworn_invite, {times = 0}).

-record(evt_sworn_defined_name, {times = 0}).

-record(evt_sworn_name, {times = 0}).

-record(evt_sworn_skill, {times = 0}).

-record(evt_other, {}).

-record(evt_guild_league_join, {}).

-record(evt_guild_league_cannon, {}).

-record(evt_guild_league_win, {}).

-record(evt_campaign_snow, {val = 0}).

-record(evt_child_info,
        {growth_type = 0, skills = [], talent_skills = []}).

-record(evt_child_eat, {base_id = 0, num = 0}).

-record(evt_child_study,
        {study_str = 0,
         study_con = 0,
         study_mag = 0,
         study_agi = 0,
         study_end = 0}).

-record(evt_go_to_bed, {}).

-record(evt_child_combat,
        {combat_type = 0 :: non_neg_integer(),
         is_win = 0 :: non_neg_integer()}).

-record(evt_child_deliver, {}).

-record(evt_child_grow, {stage}).

-record(evt_fashion_collect_lev, {lev = 0}).

-record(evt_maze, {times = 0}).

-record(evt_maze_sweep, {}).

-record(evt_maze_monster, {}).

-record(evt_maze_gold, {gold = 0}).

-record(evt_maze_monkey, {}).

-record(evt_maze_cat, {}).

-record(evt_may_day_bags, {}).

-record(evt_may_day_help, {}).

-record(evt_may_day_clean, {camp_id = 0}).

-record(evt_rencounter, {is_win = 0}).

-record(evt_rencounter_star,
        {rank_lev = 1, star = 0, total_star = 0}).

-record(evt_guild_siege_combat, {is_win = 0, star = 1}).

-record(evt_guild_dungeon, {}).

-record(evt_guild_pray, {}).

-record(evt_talisman, {type = 0, id = 0}).

-record(evt_camp_whiteday, {type = 0}).

-record(evt_camp_animal_chess, {}).

-record(evt_animal_chess_win, {}).

-record(evt_animal_chess_soldier, {}).

-record(evt_animal_chess_fail, {}).

-record(evt_animal_chess_coach_killed, {}).

-record(evt_animal_chess_kill_coach, {}).

-record(evt_animal_chess_kill_soldier, {}).

-record(evt_pet_add_point, {pet_id = 0, base_id = 0}).

-record(evt_combat_over,
        {combat_type = 0, win_flag = win}).

-record(evt_goodvoice, {}).

-record(evt_spirit_treasure_general, {}).

-record(evt_spirit_treasure_boss, {}).

-record(evt_spirit_treasure_offer_star, {star = 0}).

-record(evt_spirit_treasure_first_kill, {}).

-record(evt_spirit_treasure_boss_wave, {wave = 0}).

-record(evt_oracle_treasure_general, {}).

-record(evt_oracle_treasure_boss, {}).

-record(evt_oracle_treasure_offer_star, {star = 0}).

-record(evt_oracle_treasure_first_kill, {}).

-record(evt_oracle_treasure_boss_wave, {wave = 0}).

-record(evt_oracle_treasure_boss_times, {times = 0}).

-record(evt_camp_7_7th_point, {val = 0}).

-record(evt_chat_guild, {}).

-record(evt_guard_activate, {}).

-record(evt_exquisite_shelf_wave, {wave = 0}).

-record(evt_chat, {channel = undefined, content = ""}).

-record(evt_combat_wing_power, {val = 0}).

-record(evt_combat_sq_point,
        {combat_type = 0,
         is_win = lose,
         val = 0,
         unit_lev = 0}).

-record(evt_guild_dragon_times, {times = 0}).

-record(evt_guild_dragon_rank, {rank = 0}).

-record(evt_guild_dragon_total_point, {point = 0}).

-record(evt_exquisite_shelf_help, {}).

-record(evt_rushing_top_final_times, {final_times = 0}).

-record(g_evt_lev, {val = 0}).

-record(g_evt_member, {val = 0}).

-record(evt_expression, {}).

-record(evt_fuse_expression, {cost_item_id = 0}).

-record(evt_kingbadge,
        {base_id = 0 :: non_neg_integer()}).

-record(evt_sprog_mount, {}).

-record(evt_gods_duel_score, {score = 0}).

-record(evt_provocation_times, {}).

-record(evt_provocation_5v5, {}).

-record(evt_quest_offer_teacher, {}).

-record(evt_boss_teacher, {}).

-record(evt_constellation_kill, {}).

-record(evt_tower_teacher, {}).

-record(evt_gain_experience, {val = 0}).

-record(evt_provocation_use_horn, {}).

-record(evt_provocation_duel_win, {}).

-record(evt_provocation_duel_5v5_win, {}).

-record(evt_stars_trial,
        {base_id = 0,
         round = 99,
         use_item_num = 50,
         self_die_times = 0,
         pet_summon = 0,
         combat_formation = 0}).

-record(evt_stars_trial_combat_round, {dies = []}).

-record(evt_stars_trial_combat,
        {npc_dies = 0,
         after_die_done = 0,
         skill_use_times = []}).

-record(evt_camp_black_white_chess, {}).

-record(evt_black_white_chess_change_in_round,
        {change_num = 0}).

-record(evt_black_white_chess_win, {}).

-record(evt_black_white_chess_lose, {}).

-record(evt_black_white_chess_more_than_ops_chess,
        {num = 0}).

-record(evt_black_white_chess_draw_whitout_ask_draw,
        {}).

-record(evt_black_white_chess_win_remain_one_color, {}).

-record(evt_black_white_chess_lose_remain_one_color,
        {}).

-record(evt_canyon_summit_join, {}).

-record(evt_canyon_summit_cannon, {}).

-record(evt_canyon_summit_win, {}).

-record(evt_star_moon, {}).

-record(evt_truth_dare_join, {}).

-record(evt_truth_dare_lucky, {}).

-record(evt_truth_dare_lucky_choose, {type = 0}).

-record(evt_truth_dare_end, {type = 0}).

-record(evt_truth_dare_two_fail, {}).

-record(evt_truth_dare_one_shot, {}).

-record(evt_general_send_flower, {items = []}).

-file("src/mod/guard/guard_eqm.erl", 31).

-file("inc/timer.hrl", 1).

-record(timer,
        {id :: undefined | term(),
         timeout = 1000 :: pos_integer(),
         m :: undefined | atom(),
         f :: undefined | function() | atom(),
         a = [] :: [term()],
         times = 1 :: integer(),
         next_tick = 0 :: non_neg_integer(),
         set_time = 1 :: pos_integer()}).

-record(rtimer,
        {ref :: undefined | reference(),
         key :: undefined | reference(),
         timers = [] :: [#timer{}]}).

-record(s_timer,
        {ref :: undefined | reference(),
         timers = [] :: [#timer{}]}).

-file("src/mod/guard/guard_eqm.erl", 32).

-file("inc/lev_break.hrl", 1).

-record(m_lev_break,
        {ver = 0,
         trial = 0 :: non_neg_integer(),
         done = 0 :: non_neg_integer(),
         times = 0 :: non_neg_integer(),
         attr_point = 0 :: non_neg_integer()}).

-file("src/mod/guard/guard_eqm.erl", 33).

-export([init/2,
         save_reset_eqm_attr/3,
         upgrade_eqm/3,
         embed_gem/5,
         upgrade_gem/4,
         remove_gem/4,
         calc_eqm_attr/2,
         auto_update_eqm/3,
         check_guard_eqm_all_lev/2,
         check_embed_gem_all_num/2,
         get_guard_eqm_lev_count/2,
         get_eqm_lev_guard_count/2,
         get_eqm_lev_guard_count/3,
         marking/3,
         save_marking/3,
         set_time/2]).

-compile({inline, [{eqm_name, 1}]}).

eqm_name(15) -> lang:get("守护武器");
eqm_name(16) -> lang:get("守护衣服");
eqm_name(17) -> lang:get("守护裤子");
eqm_name(18) -> lang:get("守护鞋子");
eqm_name(19) -> lang:get("守护项链");
eqm_name(20) -> lang:get("守护腰带");
eqm_name(_) -> "".

-spec init(Classes :: pos_integer(),
           Role :: #role{}) -> list().

-spec init(Types :: list(), Role :: #role{},
           Lev :: pos_integer(), Eqms :: list()) -> Eqms :: list().

init(Classes, Role = #role{}) ->
    Lev = lev_break:lev(Role),
    InitLev = min(30, max(1, Lev div 10 * 10)),
    init([15, 16, 17, 18, 20, 19], Classes, InitLev, []).

init([], _Classes, _InitLev, Acc) -> Acc;
init([Type | Rest], Classes, InitLev, Acc) ->
    case do_init(Type, Classes, InitLev) of
        Eqm = #guard_eqm{} ->
            init(Rest, Classes, InitLev, [Eqm | Acc]);
        false -> init(Rest, Classes, InitLev, Acc)
    end.

do_init(Type, Classes, Lev) ->
    case guard_data:get_eqm_by_lev({Classes, Type, Lev}) of
        BaseId when is_integer(BaseId) ->
            Eqm = #guard_eqm{type = Type, lev = Lev,
                             base_id = BaseId},
            NewEqm = guard_attr:init_eqm(Eqm, Classes),
            NewEqm;
        _False -> false
    end.

set_time(Role = #role{m_guard =
                          Mguard = #m_guard{guards = Guards}},
         PushFlag) ->
    {Time, NewGuards} = calc_guard_time(Role,
                                        date:unixtime(),
                                        Guards,
                                        PushFlag,
                                        0,
                                        []),
    NewMguard = Mguard#m_guard{guards = NewGuards},
    NewRole = Role#role{m_guard = NewMguard},
    NewRole1 = case Time > 0 of
                   true ->
                       Timer = #timer{id = role_guard_eqm,
                                      timeout = Time * 1000, times = 1,
                                      m = guard_eqm, f = set_time, a = [true]},
                       role_timer:set(Timer, NewRole);
                   _ -> NewRole
               end,
    {ok, NewRole1}.

calc_guard_time(_Role, _Now, [], _PushFlag, Time,
                List) ->
    {Time, List};
calc_guard_time(Role, Now,
                [Guard = #guard{eqm = EqmList} | T], PushFlag, Time,
                List) ->
    case calc_eqm_time(EqmList, Now, Time, false) of
        {true, NewTime, NewEqmList} ->
            NewGuard = Guard#guard{eqm = NewEqmList},
            NewGuard1 = guard_attr:calc(NewGuard, Role),
            case PushFlag of
                true -> guard_api:push_guard(Role, NewGuard1);
                _ -> ok
            end,
            calc_guard_time(Role,
                            Now,
                            T,
                            PushFlag,
                            NewTime,
                            [NewGuard1 | List]);
        {false, NewTime, _} ->
            calc_guard_time(Role,
                            Now,
                            T,
                            PushFlag,
                            NewTime,
                            [Guard | List]);
        _ ->
            calc_guard_time(Role,
                            Now,
                            T,
                            PushFlag,
                            Time,
                            [Guard | List])
    end.

calc_eqm_time(EqmList, Now, Time, Flag) ->
    calc_eqm_time(EqmList, Now, Time, Flag, []).

calc_eqm_time([], _Now, Time, Flag, EqmList) ->
    {Flag, Time, EqmList};
calc_eqm_time([Eqm = #guard_eqm{timeout = 0} | T], Now,
              Time, Flag, EqmList) ->
    calc_eqm_time(T, Now, Time, Flag, [Eqm | EqmList]);
calc_eqm_time([Eqm = #guard_eqm{timeout = Timeout,
                                eqm_attrs = EqmAttrs}
               | T],
              Now, Time, Flag, EqmList) ->
    case Now >= Timeout of
        true ->
            NewEqmAttrs = [A
                           || A = #attr_base{type = AttrType} <- EqmAttrs,
                              AttrType =/= 4],
            NewEqm = Eqm#guard_eqm{timeout = 0,
                                   eqm_attrs = NewEqmAttrs},
            NewEqm1 = guard_attr:calc_eqm(NewEqm),
            calc_eqm_time(T, Now, Time, true, [NewEqm1 | EqmList]);
        false ->
            Diff = Timeout - Now,
            NewTime = case Time =:= 0 of
                          true -> Diff;
                          _ -> min(Diff, Time)
                      end,
            calc_eqm_time(T, Now, NewTime, Flag, [Eqm | EqmList])
    end.

calc_eqm_attr(Ac = #attr_calc{},
              #guard{eqm = EqmList}) ->
    Ac1 = do_calc_eqm(Ac, EqmList),
    Ac1;
calc_eqm_attr(_Ac, _) ->
    logger:error("守护属性无法计算", [], guard_eqm, 171),
    _Ac.

do_calc_eqm(Ac, []) -> Ac;
do_calc_eqm(Ac,
            [#guard_eqm{base_id = BaseId, eqm_attrs = EqmAttrs,
                        gem = Gems}
             | T]) ->
    AddRatio = case lists:keyfind(151,
                                  #attr_base.name,
                                  EqmAttrs)
                   of
                   #attr_base{val = Val} -> Val;
                   _ -> 0
               end,
    Fun = fun (#guard_eqm_gem{base_id = GemBaseId},
               {Ratio, GemAttrList}) ->
                  case guard_data:get_eqm_gem(GemBaseId) of
                      #guard_eqm_gem_data{attrs = GemAttr} ->
                          GemAttr1 = [{AttrName,
                                       round(AttrVal * (1000 + Ratio) / 1000)}
                                      || {AttrName, AttrVal} <- GemAttr],
                          NewGemAttrList = GemAttr1 ++ GemAttrList,
                          {Ratio, NewGemAttrList};
                      _ -> {Ratio, GemAttrList}
                  end
          end,
    {_, GemAttrList1} = lists:foldl(Fun,
                                    {AddRatio, []},
                                    Gems),
    GemAttr = attr_type:to_attr(base, GemAttrList1),
    NewEqmAttrs = EqmAttrs ++ GemAttr,
    case attr_type:do_attr(NewEqmAttrs, Ac) of
        {false, Reason} ->
            logger:error("守护装备属性计算错误[~w]:[~w]",
                         [BaseId, Reason],
                         guard_eqm,
                         199),
            do_calc_eqm(Ac, T);
        {ok, NewAc} -> do_calc_eqm(NewAc, T)
    end.

auto_update_eqm(Lev, Lev, Guard) -> Guard;
auto_update_eqm(OldLev, NewLev,
                Guard = #guard{eqm = EqmList, classes = Classes}) ->
    Result = case NewLev < OldLev of
                 true -> {down, max(1, NewLev div 10 * 10)};
                 false ->
                     case NewLev > 30 of
                         true -> {up, 30};
                         false -> {up, max(1, NewLev div 10 * 10)}
                     end
             end,
    {Flag, NewEqmList} = do_auto_update_eqm(EqmList,
                                            Classes,
                                            Result,
                                            false,
                                            []),
    case Flag of
        true -> todo;
        false -> todo
    end,
    Guard#guard{eqm = NewEqmList}.

do_auto_update_eqm([], _Classes, _Result, Flag,
                   EqmList) ->
    {Flag, EqmList};
do_auto_update_eqm([Eqm = #guard_eqm{lev = EqmLev} | T],
                   Classes, {up, Tlev}, Flag, EqmList)
    when EqmLev >= Tlev ->
    do_auto_update_eqm(T,
                       Classes,
                       {up, Tlev},
                       Flag,
                       [Eqm | EqmList]);
do_auto_update_eqm([Eqm = #guard_eqm{type = Type,
                                     gem = Gems}
                    | T],
                   Classes, {up, Tlev}, Flag, EqmList) ->
    NewGems = [Gem#guard_eqm_gem{lev = max(1, GemLev - 1)}
               || Gem = #guard_eqm_gem{lev = GemLev} <- Gems],
    case guard_data:get_eqm_by_lev({Classes, Type, Tlev}) of
        BaseId when is_integer(BaseId) ->
            UpdateEqm = #guard_eqm{base_id = BaseId, type = Type,
                                   lev = Tlev, gem = NewGems},
            NewEqm = guard_attr:init_eqm(UpdateEqm, Classes),
            do_auto_update_eqm(T,
                               Classes,
                               {up, Tlev},
                               true,
                               [NewEqm | EqmList]);
        _ ->
            do_auto_update_eqm(T,
                               Classes,
                               {up, Tlev},
                               Flag,
                               [Eqm | EqmList])
    end;
do_auto_update_eqm([Eqm = #guard_eqm{lev = EqmLev} | T],
                   Classes, {down, Tlev}, Flag, EqmList)
    when EqmLev =< Tlev ->
    do_auto_update_eqm(T,
                       Classes,
                       {down, Tlev},
                       Flag,
                       [Eqm | EqmList]);
do_auto_update_eqm([Eqm = #guard_eqm{type = Type,
                                     gem = Gems}
                    | T],
                   Classes, {down, Tlev}, Flag, EqmList) ->
    case guard_data:get_eqm_by_lev({Classes, Type, Tlev}) of
        BaseId when is_integer(BaseId) ->
            Eqm = #guard_eqm{base_id = BaseId, type = Type,
                             lev = Tlev, gem = Gems},
            NewEqm = guard_attr:init_eqm(Eqm, Classes),
            do_auto_update_eqm(T,
                               Classes,
                               {down, Tlev},
                               true,
                               [NewEqm | EqmList]);
        _ ->
            do_auto_update_eqm(T,
                               Classes,
                               {down, Tlev},
                               Flag,
                               [Eqm | EqmList])
    end;
do_auto_update_eqm([Eqm | T], Classes, Result, Flag,
                   EqmList) ->
    logger:error("无法判定升级的装备:~w:~w",
                 [Eqm, Result],
                 guard_eqm,
                 265),
    do_auto_update_eqm(T,
                       Classes,
                       Result,
                       Flag,
                       [Eqm | EqmList]).

-spec upgrade_eqm(GuardBaseId, Type, Role) -> false |
                                              {false, binary() | string()} |
                                              {upgrade,
                                               #role{}} when GuardBaseId ::
                                                                 pos_integer(),
                                                             Type ::
                                                                 pos_integer(),
                                                             Role :: #role{}.

upgrade_eqm(Guard, Type, Role) ->
    Args = #{guard => Guard, type => Type},
    upgrade_eqm_flow([check, loss, final], Args, Role).

save_reset_eqm_attr(Guard = #guard{base_id =
                                       GuardBaseId,
                                   eqm = EqmList},
                    Type,
                    Role = #role{m_guard =
                                     MGuard = #m_guard{guards = Guards}}) ->
    case lists:keyfind(Type, #guard_eqm.type, EqmList) of
        #guard_eqm{reset_attrs = []} ->
            {false, lang:get("没有可保存的属性")};
        #guard_eqm{reset_base_id = 0} ->
            {false, lang:get("没有可保存的属性")};
        GuardEqm = #guard_eqm{reset_base_id = ResetBaseId,
                              reset_attrs = ResetAttr} ->
            case guard_data:get_eqm_by_id(ResetBaseId) of
                #guard_eqm_data{lev = ResetLev} ->
                    NewGuardEqm = GuardEqm#guard_eqm{lev = ResetLev,
                                                     base_id = ResetBaseId,
                                                     eqm_attrs = ResetAttr,
                                                     reset_base_id = 0,
                                                     reset_attrs = [],
                                                     is_init = 1},
                    NewGuardEqm1 = guard_attr:calc_eqm(NewGuardEqm),
                    NewEqmList = lists:keystore(Type,
                                                #guard_eqm.type,
                                                EqmList,
                                                NewGuardEqm1),
                    NewGuard = #guard{score = Score} =
                                   guard_attr:calc(Guard#guard{eqm =
                                                                   NewEqmList},
                                                   Role),
                    NewGuards = lists:keystore(GuardBaseId,
                                               #guard.base_id,
                                               Guards,
                                               NewGuard),
                    NewRole = Role#role{m_guard =
                                            MGuard#m_guard{guards = NewGuards}},
                    guard_api:push_guard(NewRole, NewGuard),
                    NewRole1 = guard_attr:recalc_tactics(NewGuard, NewRole),
                    NewRole2 = role_trigger:fire(#evt_guard_score{val =
                                                                      Score},
                                                 NewRole1),
                    Msg = "",
                    log:guard_eqm(NewRole2,
                                  "守护保存属性",
                                  GuardEqm,
                                  NewGuardEqm),
                    {ok, NewRole2, Msg};
                _ -> {false, lang:get("无法找到重置后的装备")}
            end;
        _ -> {false, lang:get("守护没有该类型的装备")}
    end.

marking(Role = #role{m_guard =
                         Mguard = #m_guard{guards = Guards}},
        Guard = #guard{base_id = GuardBaseId, eqm = EqmList},
        Type) ->
    case lists:keyfind(Type, #guard_eqm.type, EqmList) of
        GuardEqm = #guard_eqm{lev = Lev, eqm_attrs = EqmAttrs,
                              back_effect_attr = OldBackEffectAttr} ->
            case guard_data:get_marking({Type, Lev}) of
                #{time := Time, loss := Loss = [_ | _]} ->
                    Ls = format:val_to_loss(Loss),
                    case role_gain:do_notice(Ls, Role) of
                        {ok, NewRole} ->
                            DelList = case OldBackEffectAttr of
                                          [_ | _] ->
                                              [{N, S}
                                               || #attr_base{name = N, val = S}
                                                      <- OldBackEffectAttr];
                                          _ ->
                                              [{N, S}
                                               || #attr_base{name = N, val = S,
                                                             type = Et}
                                                      <- EqmAttrs,
                                                  Et =:= 4]
                                      end,
                            EffectAttr = eqm_attr:get_guard_effect_attr(Type,
                                                                        Lev,
                                                                        DelList),
                            NewGuardEqm = GuardEqm#guard_eqm{back_effect_timeout
                                                                 = Time,
                                                             back_effect_attr =
                                                                 EffectAttr},
                            NewEqmList = lists:keystore(Type,
                                                        #guard_eqm.type,
                                                        EqmList,
                                                        NewGuardEqm),
                            NewGuard = Guard#guard{eqm = NewEqmList},
                            NewGuards = lists:keystore(GuardBaseId,
                                                       #guard.base_id,
                                                       Guards,
                                                       NewGuard),
                            NewRole1 = NewRole#role{m_guard =
                                                        Mguard#m_guard{guards =
                                                                           NewGuards}},
                            log:guard_eqm(NewRole1,
                                          "守护刻印装备",
                                          GuardEqm,
                                          NewGuardEqm),
                            {ok, NewRole1, NewGuardEqm};
                        {false, _} -> {false, lang:get("道具不足，无法刻印")}
                    end;
                _ -> {false, lang:get("该等级装备不支持刻印")}
            end;
        _ -> {false, lang:get("守护没有该类型的装备")}
    end.

save_marking(Role = #role{m_guard =
                              Mguard = #m_guard{guards = Guards}},
             Guard = #guard{base_id = GuardBaseId, eqm = EqmList},
             Type) ->
    case lists:keyfind(Type, #guard_eqm.type, EqmList) of
        GuardEqm = #guard_eqm{eqm_attrs = EqmAttrs,
                              back_effect_attr = EffectAttr = [_ | _],
                              back_effect_timeout = Timeout} ->
            EndTime = date:unixtime() + Timeout,
            NewEqmAttrs = [A
                           || A = #attr_base{type = AttrType} <- EqmAttrs,
                              AttrType =/= 4],
            NewEqmAttrs1 = NewEqmAttrs ++ EffectAttr,
            NewGuardEqm =
                guard_attr:calc_eqm(GuardEqm#guard_eqm{eqm_attrs =
                                                           NewEqmAttrs1,
                                                       timeout = EndTime,
                                                       back_effect_attr = [],
                                                       back_effect_timeout =
                                                           0}),
            NewEqmList = lists:keystore(Type,
                                        #guard_eqm.type,
                                        EqmList,
                                        NewGuardEqm),
            NewGuard = #guard{score = Score} =
                           guard_attr:calc(Guard#guard{eqm = NewEqmList}, Role),
            NewGuards = lists:keystore(GuardBaseId,
                                       #guard.base_id,
                                       Guards,
                                       NewGuard),
            NewRole = Role#role{m_guard =
                                    Mguard#m_guard{guards = NewGuards}},
            {ok, NewRole1} = set_time(NewRole, true),
            NewRole2 = role_trigger:fire(#evt_guard_score{val =
                                                              Score},
                                         NewRole1),
            guard_api:push_guard(NewRole2, NewGuard),
            log:guard_eqm(NewRole2,
                          "守护保存刻印",
                          GuardEqm,
                          NewGuardEqm),
            {ok, NewRole2, NewGuardEqm};
        #guard_eqm{} -> {false, lang:get("没有可以保存的刻印属性")};
        _ -> {false, lang:get("守护没有该类型的装备")}
    end.

embed_gem(Guard, Type, HoleId, GemBaseId, Role) ->
    Args = #{guard => Guard, type => Type,
             gem_base_id => GemBaseId, hole_id => HoleId},
    embed_gem_flow([find, check, final], Args, Role).

embed_gem_flow([], _Args, _Role) ->
    {false, lang:get("未知的镶嵌检测")};
embed_gem_flow([find | Rest],
               Args = #{guard := #guard{eqm = EqmList}, type := Type,
                        hole_id := HoleId},
               Role) ->
    case lists:keyfind(Type, #guard_eqm.type, EqmList) of
        #guard_eqm{lev = Lev}
            when Lev < 60 andalso HoleId =:= 2 ->
            {false, lang:get("装备需要达到60级才能镶嵌该孔")};
        #guard_eqm{lev = Lev}
            when Lev < 30 andalso HoleId =:= 1 ->
            {false, lang:get("装备需要达到30级才能镶嵌该孔")};
        Eqm = #guard_eqm{gem = GemList} ->
            case lists:keyfind(HoleId, #guard_eqm_gem.id, GemList)
                of
                false -> embed_gem_flow(Rest, Args#{eqm => Eqm}, Role);
                _ -> {false, lang:get("该孔已经镶嵌过宝石，请先摘除再来镶嵌")}
            end;
        _ -> {false, lang:get("守护没有该类型的装备")}
    end;
embed_gem_flow([check | Rest],
               Args = #{eqm := #guard_eqm{type = Type, gem = GemList},
                        gem_base_id := GemBaseId},
               Role) ->
    case guard_data:get_eqm_gem(GemBaseId) of
        #guard_eqm_gem_data{lev = GemLev} when GemLev > 1 ->
            {false, lang:get("只能镶嵌1级宝石")};
        GemData = #guard_eqm_gem_data{type = GemType} ->
            CanList = guard_data:get_embed_type(Type),
            NowNum = lists:sum([1
                                || #guard_eqm_gem{type = GemTypeNow} <- GemList,
                                   GemTypeNow =:= GemType]),
            case lists:keyfind(GemType, 1, CanList) of
                {_, MaxNum} when NowNum >= MaxNum ->
                    {false, lang:get("该装备镶嵌该类宝石已达上限")};
                {_GemType, _MaxNum} ->
                    embed_gem_flow(Rest, Args#{gem_data => GemData}, Role);
                _ -> {false, lang:get("该装备无法镶嵌该类型的宝石")}
            end;
        _ -> {false, lang:get("守护装备只能镶嵌宝石")}
    end;
embed_gem_flow([final | _],
               #{guard := Guard, eqm := Eqm, gem_data := GemData,
                 hole_id := HoleId},
               Role = #role{m_guard =
                                MGuard = #m_guard{guards = Guards}}) ->
    #guard_eqm_gem_data{base_id = GemBaseId, type = GemType,
                        lev = Lev, loss_coin = Loss} =
        GemData,
    #guard{base_id = GuardBaseId, eqm = EqmList} = Guard,
    #guard_eqm{gem = GemList, type = EqmType} = Eqm,
    case role_gain:do_notice(Loss, Role) of
        {ok, LossRole} ->
            EqmGem = #guard_eqm_gem{id = HoleId,
                                    base_id = GemBaseId, type = GemType,
                                    lev = Lev},
            NewEqm = Eqm#guard_eqm{gem = [EqmGem | GemList]},
            NewEqmList = lists:keystore(EqmType,
                                        #guard_eqm.type,
                                        EqmList,
                                        NewEqm),
            Guard1 = Guard#guard{eqm = NewEqmList},
            NewGuard = #guard{score = Score} =
                           guard_attr:calc(Guard1, LossRole),
            NewGuards = lists:keystore(GuardBaseId,
                                       #guard.base_id,
                                       Guards,
                                       NewGuard),
            NewMGuard = MGuard#m_guard{guards = NewGuards},
            FireEvts = [#evt_guard_score{val = Score},
                        #evt_guard_embed_gem{}],
            NewRole = role_trigger:fire(FireEvts,
                                        LossRole#role{m_guard = NewMGuard}),
            guard_api:push_guard(NewRole, NewGuard),
            {ok, NewRole};
        {false, #loss{msg = Msg}} -> {false, Msg};
        _False -> {false, lang:get("道具不足")}
    end;
embed_gem_flow(_Step, _Args, #role{name = Name}) ->
    logger:error("[~ts]镶嵌守护装备宝石错误[~w]",
                 [Name, _Step],
                 guard_eqm,
                 446),
    {false, lang:get("未知的守护宝石镶嵌检测")}.

upgrade_gem(Guard, Type, HoleId, Role) ->
    Args = #{guard => Guard, type => Type,
             hole_id => HoleId},
    upgrade_gem_flow([find, check, final], Args, Role).

upgrade_gem_flow([find | Rest],
                 Args = #{guard := #guard{eqm = EqmList}, type := Type,
                          hole_id := HoleId},
                 Role) ->
    case lists:keyfind(Type, #guard_eqm.type, EqmList) of
        Eqm = #guard_eqm{gem = GemList} ->
            case lists:keyfind(HoleId, #guard_eqm_gem.id, GemList)
                of
                Gem = #guard_eqm_gem{} ->
                    upgrade_gem_flow(Rest,
                                     Args#{eqm => Eqm, gem => Gem},
                                     Role);
                _ -> {false, lang:get("对应孔没有镶嵌过宝石，无法升级")}
            end;
        false -> {false, lang:get("没有找到对应守护装备，无法升级")}
    end;
upgrade_gem_flow([check | Rest],
                 Args = #{gem :=
                              Gem = #guard_eqm_gem{base_id = GemBaseId},
                          eqm := Eqm = #guard_eqm{lev = EqmLev}},
                 Role) ->
    #guard_eqm_gem{base_id = GemBaseId} = Gem,
    #guard_eqm{lev = EqmLev} = Eqm,
    case guard_data:get_eqm_gem(GemBaseId) of
        #guard_eqm_gem_data{need_lev = NeedLev}
            when EqmLev < NeedLev ->
            {false,
             util:flist(lang:get("装备等级不足~w级，无法升级宝石"), [NeedLev])};
        #guard_eqm_gem_data{next_base_id = 0} ->
            {false, lang:get("宝石已经升到顶级，无法继续升级")};
        #guard_eqm_gem_data{next_base_id = NextBaseId} ->
            case guard_data:get_eqm_gem(NextBaseId) of
                GemData = #guard_eqm_gem_data{} ->
                    upgrade_gem_flow(Rest,
                                     Args#{gem_data => GemData},
                                     Role);
                _ -> {false, lang:get("宝石已经升到顶级，无法继续升级")}
            end;
        _False -> {false, lang:get("请先镶嵌宝石再来升级")}
    end;
upgrade_gem_flow([final | _],
                 #{guard :=
                       Guard = #guard{base_id = GuardBaseId, eqm = EqmList},
                   eqm := Eqm = #guard_eqm{gem = GemList, type = EqmType},
                   gem := #guard_eqm_gem{id = HoleId},
                   gem_data :=
                       #guard_eqm_gem_data{base_id = NextBaseId,
                                           type = GemType, lev = NewLev,
                                           loss_coin = Loss}},
                 Role = #role{m_guard =
                                  MGuard = #m_guard{guards = Guards}}) ->
    case role_gain:do_notice(Loss, Role) of
        {ok, LossRole} ->
            NewGem = #guard_eqm_gem{id = HoleId,
                                    base_id = NextBaseId, type = GemType,
                                    lev = NewLev},
            NewEqm = Eqm#guard_eqm{gem =
                                       lists:keystore(HoleId,
                                                      #guard_eqm_gem.id,
                                                      GemList,
                                                      NewGem)},
            NewEqmList = lists:keystore(EqmType,
                                        #guard_eqm.type,
                                        EqmList,
                                        NewEqm),
            Guard1 = Guard#guard{eqm = NewEqmList},
            NewGuard = #guard{score = Score} =
                           guard_attr:calc(Guard1, LossRole),
            NewGuards = lists:keystore(GuardBaseId,
                                       #guard.base_id,
                                       Guards,
                                       NewGuard),
            NewMGuard = MGuard#m_guard{guards = NewGuards},
            NewRole = role_trigger:fire([#evt_guard_score{val =
                                                              Score},
                                         #evt_guard_embed_gem{}],
                                        LossRole#role{m_guard = NewMGuard}),
            guard_api:push_guard(NewRole, NewGuard),
            log:guard_eqm(NewRole, "守护升级宝石", Eqm, NewEqm),
            {ok, NewRole};
        {false, #loss{}} -> {false, lang:get("银币不足，无法升级")};
        _False ->
            logger:error("升级宝石时未知的错误:~w", [_False], guard_eqm, 519),
            {false, lang:get("道具不足")}
    end;
upgrade_gem_flow(_Step, _Args, #role{name = Name}) ->
    logger:error("[~ts]升级守护装备宝石错误[~w]",
                 [Name, _Step],
                 guard_eqm,
                 523),
    {false, lang:get("未知的守护宝石升级过程")}.

remove_gem(Guard, Type, HoleId, Role) ->
    Args = #{guard => Guard, type => Type,
             hole_id => HoleId},
    remove_gem_flow([final], Args, Role).

remove_gem_flow([final | _],
                #{guard :=
                      Guard = #guard{base_id = GuardBaseId, eqm = EqmList},
                  type := Type, hole_id := HoleId},
                Role = #role{m_guard =
                                 MGuard = #m_guard{guards = Guards}}) ->
    case lists:keyfind(Type, #guard_eqm.type, EqmList) of
        Eqm = #guard_eqm{gem = GemList} ->
            case lists:keyfind(HoleId, #guard_eqm_gem.id, GemList)
                of
                #guard_eqm_gem{} ->
                    NewGemList = lists:keydelete(HoleId,
                                                 #guard_eqm_gem.id,
                                                 GemList),
                    NewEqm = Eqm#guard_eqm{gem = NewGemList},
                    NewEqmList = lists:keystore(Type,
                                                #guard_eqm.type,
                                                EqmList,
                                                NewEqm),
                    Guard1 = Guard#guard{eqm = NewEqmList},
                    NewGuard = #guard{score = Score} =
                                   guard_attr:calc(Guard1, Role),
                    NewGuards = lists:keystore(GuardBaseId,
                                               #guard.base_id,
                                               Guards,
                                               NewGuard),
                    NewMGuard = MGuard#m_guard{guards = NewGuards},
                    NewRole = role_trigger:fire(#evt_guard_score{val =
                                                                     Score},
                                                Role#role{m_guard = NewMGuard}),
                    guard_api:push_guard(NewRole, NewGuard),
                    log:guard_eqm(NewRole, "守护摘除宝石", Eqm, NewEqm),
                    {ok, NewRole};
                _ -> {false, lang:get("该孔没有镶嵌过宝石，无法摘除")}
            end;
        _ -> {false, lang:get("该守护没有该类型装备，无法摘除")}
    end;
remove_gem_flow([_Step | _], _Args,
                #role{name = Name}) ->
    logger:error("[~ts]摘除守护装备宝石错误[~w]",
                 [Name, _Step],
                 guard_eqm,
                 560),
    {false, lang:get("未知的摘除宝石过程")}.

get_guard_eqm_lev_count(#role{m_guard =
                                  #m_guard{guards = Guards}},
                        TargetLev) ->
    get_guard_eqm_lev_count(Guards, TargetLev, 0).

get_guard_eqm_lev_count([], _TargetLev, Count) -> Count;
get_guard_eqm_lev_count([#guard{eqm = Eqms} | Rest],
                        TargetLev, Count) ->
    case check_guard_eqm_all_lev(Eqms, false, TargetLev) of
        true ->
            get_guard_eqm_lev_count(Rest, TargetLev, Count + 1);
        false -> get_guard_eqm_lev_count(Rest, TargetLev, Count)
    end.

check_guard_eqm_all_lev(#role{m_guard =
                                  #m_guard{guards = Guards}},
                        Lev) ->
    Flag = false,
    check_guard_eqm_all_lev(Guards, Flag, Lev).

check_guard_eqm_all_lev([], Flag, _Lev) -> Flag;
check_guard_eqm_all_lev([#guard{eqm = Eqms} | Rest],
                        Flag, Lev) ->
    case check_guard_eqm_all_lev(Eqms, Flag, Lev) of
        true -> check_guard_eqm_all_lev(Rest, Flag, Lev);
        false -> false
    end;
check_guard_eqm_all_lev([#guard_eqm{lev = EqmLev}
                         | Rest],
                        _Flag, Lev)
    when EqmLev >= Lev ->
    check_guard_eqm_all_lev(Rest, true, Lev);
check_guard_eqm_all_lev([_H | _Rest], _Flag, _Lev) ->
    false.

get_eqm_lev_guard_count(#role{m_guard =
                                  #m_guard{guards = Guards}},
                        TargetLev) ->
    get_eqm_lev_guard_count(Guards, TargetLev, 0).

get_eqm_lev_guard_count([], _TargetLev, Count) -> Count;
get_eqm_lev_guard_count([#guard{eqm = Eqms} | Rest],
                        TargetLev, Count) ->
    LevEqms = lists:filter(fun (#guard_eqm{lev = EqmLev}) ->
                                   EqmLev >= TargetLev
                           end,
                           Eqms),
    case length(LevEqms) >= 6 of
        true ->
            get_eqm_lev_guard_count(Rest, TargetLev, Count + 1);
        false -> get_eqm_lev_guard_count(Rest, TargetLev, Count)
    end.

check_embed_gem_all_num(#role{m_guard =
                                  #m_guard{guards = Guards}},
                        Num) ->
    Flag = false,
    check_embed_gem_all_num(Guards, Flag, Num).

check_embed_gem_all_num([], Flag, _Num) -> Flag;
check_embed_gem_all_num([#guard{eqm = Eqms} | Rest],
                        Flag, Num) ->
    case check_embed_gem_all_num(Eqms, Flag, Num) of
        true -> check_embed_gem_all_num(Rest, Flag, Num);
        false -> false
    end;
check_embed_gem_all_num([#guard_eqm{gem = Gems} | Rest],
                        _Flag, Num)
    when length(Gems) >= Num ->
    check_embed_gem_all_num(Rest, true, Num);
check_embed_gem_all_num([_H | _Rest], _Flag, _Num) ->
    false.

upgrade_eqm_flow([], _, _) ->
    {false, lang:get("未知的装备升级过程")};
upgrade_eqm_flow([check | RestSteps], Args, Role) ->
    case check_level_up_cond(Role, Args) of
        {levup, #guard_eqm{}, NextEqmData} ->
            upgrade_eqm_flow(RestSteps,
                             Args#{next_eqm_data => NextEqmData},
                             Role);
        {reset, #guard_eqm{}} ->
            reset_eqm_flow([check, loss, final], Args, Role);
        {false, Reason} -> {false, Reason}
    end;
upgrade_eqm_flow([loss | RestSteps],
                 Args = #{next_eqm_data :=
                              #guard_eqm_data{loss_coin = LossCoin, lev = Lev}},
                 Role = #role{}) ->
    {WorldLev, _} = world_lev:get_world_lev(Role),
    NewLossCoin = case Lev =< WorldLev - 5 of
                      true -> util:floor(LossCoin * 5.0e-1);
                      false -> LossCoin
                  end,
    Loss = [#loss{label = coin, val = NewLossCoin}],
    case role_gain:do(Loss, Role) of
        {ok, NewRole} ->
            upgrade_eqm_flow(RestSteps,
                             Args#{loss_coin => NewLossCoin},
                             NewRole);
        {false, #loss{label = coin, val = Val}} ->
            {false,
             notice:format(lang:get("您的~ts不足~w，无法升级"),
                           [{assets_2, 90000}, Val])};
        {false, #loss{label = item_base_id, val = _}} ->
            {false, lang:get("物品不足，重置失败")}
    end;
upgrade_eqm_flow([final | _],
                 #{guard := Guard,
                   next_eqm_data :=
                       NextEqmData = #guard_eqm_data{type = Type,
                                                     lev = EqmLev},
                   loss_coin := LossCoin},
                 Role) ->
    case level_up(Guard, NextEqmData, Role) of
        {ok, NewRole, NewEqm} ->
            Args = [{assets_1, 90000, LossCoin},
                    {string_2, 5, eqm_name(Type)},
                    {string_2, 5, EqmLev}],
            Msg = notice:format(lang:get("花费了~ts, 把~ts提升到~ts级"),
                                Args),
            {upgrade, NewRole, Msg, NewEqm};
        {false, Reason} -> {false, Reason}
    end;
upgrade_eqm_flow(Steps, _, _) ->
    logger:error("守护装备升级流程出错:~w", [Steps], guard_eqm, 669),
    {false, lang:get("未知的升级检测")}.

reset_eqm_flow([check | RestSteps],
               Args = #{guard := Guard, type := Type}, Role) ->
    case reset_eqm_check(Guard, Type) of
        {true, #guard_eqm{lev = EqmLev, base_id = BaseId}} ->
            reset_eqm_flow(RestSteps,
                           Args#{eqm_lev => EqmLev, base_id => BaseId},
                           Role);
        {false, Reason} -> {false, Reason}
    end;
reset_eqm_flow([loss | RestSteps],
               Args = #{base_id := BaseId}, Role) ->
    case guard_data:get_eqm_by_id(BaseId) of
        #guard_eqm_data{reset_coin = LossCoin} ->
            Loss = [#loss{label = coin, val = LossCoin}],
            case role_gain:do(Loss, Role) of
                {ok, NewRole} ->
                    reset_eqm_flow(RestSteps,
                                   Args#{loss_coin => LossCoin},
                                   NewRole);
                {false, #loss{label = coin, val = Val}} ->
                    {false,
                     notice:format(lang:get("您的~ts不足~w，无法重置"),
                                   [{assets_2, 90000}, Val])};
                {false, #loss{label = item_base_id, val = _}} ->
                    {false, lang:get("物品不足，重置失败")}
            end;
        _ -> {false, lang:get("当前装备不能重置")}
    end;
reset_eqm_flow([final | _],
               #{guard := Guard, type := Type, eqm_lev := EqmLev,
                 loss_coin := LossCoin},
               Role) ->
    case preview_reset_eqm(Guard, Type, EqmLev, Role) of
        {ok,
         NRole,
         NewEqm = #guard_eqm{reset_base_id = ResetBaseId}} ->
            Args = [{assets_1, 90000, LossCoin},
                    {item_2, ResetBaseId}],
            Msg = notice:format(lang:get("花费了~ts, 提升了~ts"), Args),
            {reset, NRole, Msg, NewEqm};
        {false, Reason} -> {false, Reason}
    end;
reset_eqm_flow(Steps, _, _) ->
    logger:error("重置守护装备流程出错:~w", [Steps], guard_eqm, 708),
    {false, lang:get("未知的升级检测")}.

check_level_up_cond(Role = #role{m_lev_break =
                                     #m_lev_break{times = MLBTimes}},
                    #{guard := #guard{eqm = EqmList, classes = Classes},
                      type := Type}) ->
    Lev = lev_break:lev(Role),
    case lists:keyfind(Type, #guard_eqm.type, EqmList) of
        GuardEqm = #guard_eqm{base_id = BaseId,
                              is_init = IsInit} ->
            case MLBTimes of
                1 -> NowEqmLev = min(110, max(100, Lev div 10 * 10));
                _ -> NowEqmLev = min(110, max(1, Lev div 10 * 10))
            end,
            case guard_data:get_eqm_by_lev({Classes,
                                            Type,
                                            NowEqmLev})
                of
                BaseId when IsInit =:= 1 ->
                    {false, lang:get("当前装备无需重置")};
                BaseId -> {reset, GuardEqm};
                OtherBaseId when is_integer(OtherBaseId) ->
                    case guard_data:get_eqm_by_id(OtherBaseId) of
                        NextEqmData = #guard_eqm_data{} ->
                            {levup, GuardEqm, NextEqmData};
                        _ -> {false, lang:get("当前装备已经无法升级")}
                    end;
                _ -> {false, lang:get("当前等级没有可适用的守护装备")}
            end;
        _ -> {false, lang:get("守护没有该类型装备")}
    end.

reset_eqm_check(#guard{eqm = EqmList}, Type) ->
    case lists:keyfind(Type, #guard_eqm.type, EqmList) of
        #guard_eqm{lev = Lev} when Lev < 40 ->
            {false, lang:get("40级以上的装备才能重置")};
        GuardEqm = #guard_eqm{} -> {true, GuardEqm};
        _ -> {false, lang:get("守护没有该类型装备")}
    end.

level_up(Guard = #guard{base_id = GuardBaseId,
                        eqm = EqmList, classes = Classes},
         #guard_eqm_data{base_id = BaseId, type = Type,
                         lev = Lev},
         Role = #role{m_guard =
                          MGuard = #m_guard{guards = Guards}}) ->
    case lists:keyfind(Type, #guard_eqm.type, EqmList) of
        Eqm = #guard_eqm{type = Type} ->
            {CalcBaseAttr, SpecialAttr} =
                eqm_attr:get_guard_init_attr(Type, Lev, Classes),
            BackUpAttr = CalcBaseAttr ++ SpecialAttr,
            case BackUpAttr of
                [_ | _] ->
                    NewEqm = Eqm#guard_eqm{lev = Lev, base_id = BaseId,
                                           eqm_attrs = BackUpAttr,
                                           reset_base_id = 0, reset_attrs = [],
                                           is_init = 1},
                    NewEqm1 = guard_attr:calc_eqm(NewEqm),
                    NewEqmList = lists:keystore(Type,
                                                #guard_eqm.type,
                                                EqmList,
                                                NewEqm1),
                    NewGuard = #guard{score = Score} =
                                   guard_attr:calc(Guard#guard{eqm =
                                                                   NewEqmList},
                                                   Role),
                    NewGuards = lists:keystore(GuardBaseId,
                                               #guard.base_id,
                                               Guards,
                                               NewGuard),
                    NewRole = role_trigger:fire(#evt_guard_score{val =
                                                                     Score},
                                                Role#role{m_guard =
                                                              MGuard#m_guard{guards
                                                                                 =
                                                                                 NewGuards}}),
                    guard_api:push_guard(NewRole, NewGuard),
                    NewRole1 = guard_attr:recalc_tactics(NewGuard, NewRole),
                    log:guard_eqm(NewRole1, "守护升级装备", Eqm, NewEqm),
                    {ok, NewRole1, NewEqm};
                _ -> {false, lang:get("无法获得升级属性")}
            end;
        _ -> {false, lang:get("无法找到守护装备")}
    end.

preview_reset_eqm(Guard = #guard{base_id = GuardBaseId,
                                 eqm = EqmList, classes = Classes},
                  Type, EqmLev,
                  Role = #role{name = _Name,
                               m_guard = MGuard = #m_guard{guards = Guards}}) ->
    case lists:keyfind(Type, #guard_eqm.type, EqmList) of
        Eqm = #guard_eqm{base_id = BaseId} ->
            {CalcBaseAttr, SpecialAttr} =
                eqm_attr:get_guard_init_attr(Type, EqmLev, Classes),
            BackUpAttr = CalcBaseAttr ++ SpecialAttr,
            case BackUpAttr of
                [_ | _] ->
                    NewEqm = Eqm#guard_eqm{reset_base_id = BaseId,
                                           reset_attrs = BackUpAttr},
                    NewEqmList = lists:keystore(Type,
                                                #guard_eqm.type,
                                                EqmList,
                                                NewEqm),
                    NewGuard = Guard#guard{eqm = NewEqmList},
                    NewGuards = lists:keystore(GuardBaseId,
                                               #guard.base_id,
                                               Guards,
                                               NewGuard),
                    NewRole = Role#role{m_guard =
                                            MGuard#m_guard{guards = NewGuards}},
                    log:guard_eqm(NewRole, "守护重置装备", Eqm, NewEqm),
                    {ok, NewRole, NewEqm};
                _ -> {false, lang:get("无法获得重置属性")}
            end;
        _ -> {false, lang:get("无法找到守护装备")}
    end.

