-file("src/mod/talisman/talisman.erl", 1).

-module(talisman).

-export([init/0,
         add_talisman/2,
         add_talisman/3,
         use/2,
         unuse/2,
         change_plan/2,
         push_19601/2,
         push_19602/2,
         push_19603/2,
         push_19604/1,
         push_10627/1,
         fusion/3,
         absorb/5,
         get_skills/1,
         get_pet_child_skills/1,
         calc_fc/1,
         calc_sub_fc/1,
         get_set_fc/1,
         gm_up_fusion/2,
         login/1,
         adm_show/1,
         adm_show_lev/1,
         get_combat_talisman/1,
         talisman_classes_modify/2,
         remold/3,
         push_formula/1,
         remold_reset_week_five/2,
         gm_remold_reset_week_five/1,
         get_convertible_talisman/1,
         talisman_convert/4,
         add_volume/1]).

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

-file("src/mod/talisman/talisman.erl", 45).

-file("inc/talisman.hrl", 1).

-record(m_talisman,
        {ver = 5,
         next_id = 1,
         use_plan = 1,
         plan_1 = [],
         plan_2 = [],
         items = [],
         fusion_lev = 0,
         fusion_val = 0,
         skills = [],
         fc = 0,
         remold_formula = [],
         last_gain_id = 0,
         volume = 48}).

-record(talisman,
        {ver = 3,
         id = 1,
         base_id = 0,
         type = 0,
         quality = 0,
         lev = 0,
         attr = [],
         num = 1,
         fc = 0}).

-record(talisman_base,
        {base_id = 0,
         name = "",
         type = 0,
         quality = 0,
         lev = 0,
         need_lev = 0,
         need_lev_break = 0,
         set_id = 0,
         fusion_val = 0,
         base_attr = [],
         grade = 0}).

-file("src/mod/talisman/talisman.erl", 46).

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

-file("src/mod/talisman/talisman.erl", 47).

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

-file("src/mod/talisman/talisman.erl", 48).

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

-file("src/mod/talisman/talisman.erl", 49).

-file("inc/var.hrl", 1).

-record(m_var,
        {ver = 1,
         last_reset_time = 0 :: non_neg_integer(),
         last_reset_five_time = 0,
         last_reset_week_five_time = 0,
         day_vars = [] :: [tuple()],
         day_five_vars = [] :: [tuple()],
         week_five_vars = [],
         last_acc_time = 0,
         acc_time = 0,
         acc_vars = [] :: [tuple()],
         other_vars = [] :: [tuple()]}).

-record(role_var,
        {id = {0, "", 0} :: tuple(),
         ver = 1,
         last_reset_time = 0 :: non_neg_integer(),
         day_vars = [] :: [tuple()],
         forever_vars = [] :: [tuple()],
         last_reset_five_time = 0,
         last_reset_week_five_time = 0,
         day_five_vars = [] :: [tuple()],
         week_five_vars = []}).

-file("src/mod/talisman/talisman.erl", 50).

-file("inc/package.hrl", 1).

-record(package,
        {type = 1 :: integer(),
         next_id = 1 :: pos_integer(),
         volume = 0 :: non_neg_integer(),
         free_cell = [] :: list(),
         items = [] :: [tuple()]}).

-file("src/mod/talisman/talisman.erl", 51).

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

-file("src/mod/talisman/talisman.erl", 52).

-file("inc/skill_prac.hrl", 1).

-record(skl_prac_meta_data,
        {id :: undefined | pos_integer(),
         name :: undefined | string(),
         obj :: undefined | pos_integer(),
         day_max_times :: undefined | pos_integer()}).

-record(skill_prac_data,
        {id :: undefined | pos_integer(),
         role_lev :: undefined | non_neg_integer(),
         skill_lev :: undefined | non_neg_integer(),
         top_lev :: undefined | non_neg_integer(),
         exp :: undefined | non_neg_integer(),
         attrs :: undefined | list(),
         lev_break_times :: undefined | non_neg_integer()}).

-record(skl_prac,
        {id = 0 :: pos_integer(),
         obj = 0 :: pos_integer(),
         lev = 0 :: non_neg_integer(),
         exp = 0 :: non_neg_integer(),
         enhance = [] :: list()}).

-record(skl_prac_enhance,
        {source = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer()}).

-record(skill_prac_box,
        {id :: undefined | tuple(), exps = []}).

-file("src/mod/talisman/talisman.erl", 53).

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

-file("src/mod/talisman/talisman.erl", 54).

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

-file("src/mod/talisman/talisman.erl", 55).

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

-file("src/mod/talisman/talisman.erl", 56).

init() -> #m_talisman{}.

calc_fc(#role{m_talisman = #m_talisman{fc = Fc}}) -> Fc;
calc_fc(_) -> 0.

login(Role) ->
    {ok, NewRole} = talisman_attr:recalc(Role, 0),
    {ok, NewRole}.

calc_sub_fc(#role{m_talisman =
                      #m_talisman{fc = Fc, fusion_lev = FuSionLev}}) ->
    FuSionFc = talisman_data:get_fusion_fc(FuSionLev),
    {max(0, Fc - FuSionFc), FuSionFc}.

get_skills(#role{m_talisman = Mtalisman}) ->
    UseItems = get_use(Mtalisman),
    case get_set_list(UseItems) of
        SetList = [_ | _] ->
            Fun = fun ({SetId, Q4, Q2}, Skills) ->
                          AddSkill = do_get_skills({SetId, Q4, Q2}),
                          AddSkill ++ Skills
                  end,
            AllSkill = lists:foldl(Fun, [], SetList),
            [{S, 1} || {Type, S} <- AllSkill, Type =:= 1];
        _ -> []
    end.

do_get_skills({_, 0, 0}) -> [];
do_get_skills({SetId, Q4, Q2}) ->
    case talisman_data:get_set(SetId) of
        #{skills_blue_2 := SkillsB2, skills_blue_4 := SkillsB4,
          skills_purple_2 := SkillsP2,
          skills_purple_4 := SkillsP4,
          skills_orange_2 := SkillsO2,
          skills_orange_4 := SkillsO4, skills_red_2 := SkillsR2,
          skills_red_4 := SkillsR4} ->
            S4 = if Q4 =:= 5 -> SkillsR4;
                    Q4 =:= 4 -> SkillsO4;
                    Q4 =:= 3 -> SkillsP4;
                    Q4 =:= 2 -> SkillsB4;
                    true -> []
                 end,
            S2 = if Q2 =:= 5 -> SkillsR2;
                    Q2 =:= 4 -> SkillsO2;
                    Q2 =:= 3 -> SkillsP2;
                    Q2 =:= 2 -> SkillsB2;
                    true -> []
                 end,
            S4 ++ S2;
        _ -> []
    end.

get_pet_child_skills(#role{m_talisman = Mtalisman}) ->
    UseItems = get_use(Mtalisman),
    case get_set_list(UseItems) of
        SetList = [_ | _] ->
            Fun = fun ({SetId, Q4, Q2}, Skills) ->
                          AddSkill = do_get_skills({SetId, Q4, Q2}),
                          AddSkill ++ Skills
                  end,
            AllSkill = lists:foldl(Fun, [], SetList),
            [{S, 1} || {Type, S} <- AllSkill, Type =:= 2];
        _ -> []
    end.

get_use(#m_talisman{use_plan = UsePlan, plan_1 = Plan1,
                    plan_2 = Plan2, items = Items}) ->
    case UsePlan of
        1 ->
            [I
             || I = #talisman{id = Id} <- Items,
                lists:keymember(Id, 2, Plan1) =:= true];
        _ ->
            [I
             || I = #talisman{id = Id} <- Items,
                lists:keymember(Id, 2, Plan2) =:= true]
    end.

get_set_fc(#role{m_talisman = Mtalisman}) ->
    UseItems = get_use(Mtalisman),
    case get_set_list(UseItems) of
        SetList = [_ | _] ->
            Fun = fun ({SetId, Q4, Q2}, Fc) ->
                          AddFc = do_get_fc({SetId, Q4, Q2}),
                          AddFc + Fc
                  end,
            AllFc = lists:foldl(Fun, 0, SetList),
            AllFc;
        _ -> 0
    end.

do_get_fc({_, 0, 0}) -> 0;
do_get_fc({SetId, Q4, Q2}) ->
    case talisman_data:get_set(SetId) of
        #{fc_blue_2 := FcB2, fc_blue_4 := FcB4,
          fc_purple_2 := FcP2, fc_purple_4 := FcP4,
          fc_orange_2 := FcO2, fc_orange_4 := FcO4,
          fc_red_2 := FcR2, fc_red_4 := FcR4} ->
            S4 = if Q4 =:= 4 -> FcO4;
                    Q4 =:= 3 -> FcP4;
                    Q4 =:= 2 -> FcB4;
                    Q4 =:= 5 -> FcR4;
                    true -> 0
                 end,
            S2 = if Q2 =:= 4 -> FcO2;
                    Q2 =:= 3 -> FcP2;
                    Q2 =:= 2 -> FcB2;
                    Q2 =:= 5 -> FcR2;
                    true -> 0
                 end,
            S4 + S2;
        _ -> 0
    end.

get_set_list(Items) -> get_set_list(Items, []).

get_set_list([], SetList) ->
    [calc_set(I) || I <- SetList];
get_set_list([#talisman{base_id = BaseId,
                        quality = Quality}
              | T],
             SetList) ->
    case talisman_data:get(BaseId) of
        #talisman_base{set_id = SetId} when SetId =/= 0 ->
            NewSetLiset = case lists:keyfind(SetId, 1, SetList) of
                              {_, NumList} ->
                                  Data = {SetId, add_set(NumList, Quality)},
                                  lists:keystore(SetId, 1, SetList, Data);
                              _ ->
                                  Data = {SetId,
                                          add_set([{5, 0},
                                                   {4, 0},
                                                   {3, 0},
                                                   {2, 0}],
                                                  Quality)},
                                  lists:keystore(SetId, 1, SetList, Data)
                          end,
            get_set_list(T, NewSetLiset);
        _ -> get_set_list(T, SetList)
    end;
get_set_list([_ | T], SetList) ->
    get_set_list(T, SetList).

add_set(List, Quality) -> do_add_set(List, Quality, []).

do_add_set([], _Quality, List) -> lists:reverse(List);
do_add_set([{Q1, Num} | T], Q2, List) ->
    case Q2 >= Q1 of
        true -> do_add_set(T, Q2, [{Q1, Num + 1} | List]);
        _ -> do_add_set(T, Q2, [{Q1, Num} | List])
    end.

calc_set({SetId, List}) ->
    S4 = case [{Q, N} || {Q, N} <- List, N >= 4] of
             [{Q4, _} | _] -> Q4;
             _ -> 0
         end,
    S2 = case [{Q, N} || {Q, N} <- List, N >= 2] of
             [{Q2, _} | _] -> Q2;
             _ -> 0
         end,
    {SetId, S4, S2}.

add_talisman(Role, BaseId, Val) ->
    add_talisman(Role, BaseId, Val, []).

add_talisman(Role, _BaseId, Val, AddItems)
    when Val =< 0 ->
    {ok, Role, AddItems};
add_talisman(Role, BaseId, Val, AddItems) ->
    case add_talisman(Role, BaseId) of
        {ok, NewRole, Add} ->
            add_talisman(NewRole,
                         BaseId,
                         Val - 1,
                         [Add | AddItems]);
        {false, Reason} -> {false, Reason}
    end.

add_talisman(Role = #role{m_talisman =
                              Mtalisman = #m_talisman{next_id = NextId,
                                                      items = Items,
                                                      volume = Volume}},
             BaseId) ->
    Len = length(Items),
    case Len >= Volume of
        true -> {false, bag_full};
        _ ->
            case make_talisman(BaseId) of
                {true, Talisman} ->
                    Talisman1 = talisman_attr:init(Talisman#talisman{id =
                                                                         NextId}),
                    NewTalisman = talisman_attr:calc_fc(Talisman1),
                    NewItems = [NewTalisman | Items],
                    NewMtalisman = Mtalisman#m_talisman{next_id =
                                                            NextId + 1,
                                                        items = NewItems},
                    NewRole = Role#role{m_talisman = NewMtalisman},
                    push_19601(NewRole, NewTalisman),
                    {ok, NewRole, NewTalisman};
                {false, Reason} -> {false, Reason}
            end
    end.

make_talisman(BaseId) ->
    case talisman_data:get(BaseId) of
        #talisman_base{type = Type, quality = Quality,
                       lev = Lev} ->
            {true,
             #talisman{base_id = BaseId, type = Type,
                       quality = Quality, lev = Lev}};
        _ ->
            logger:error("无法增加[~w]的法宝", [BaseId], talisman, 293),
            {false, lang:get("不存在的法宝")}
    end.

name(BaseId) ->
    case talisman_data:get(BaseId) of
        #talisman_base{name = Name} -> Name;
        _ -> lang:get("未知法宝")
    end.

use(Role = #role{lev = Lev,
                 m_talisman =
                     Mtalisman = #m_talisman{use_plan = UsePlan,
                                             plan_1 = Plan1, plan_2 = Plan2,
                                             items = Items}},
    Id) ->
    case lists:keyfind(Id, #talisman.id, Items) of
        #talisman{type = Type, base_id = BaseId} ->
            case lists:member(Type, [148, 147, 149, 150]) of
                true ->
                    case talisman_data:get(BaseId) of
                        #talisman_base{need_lev_break = NeedLevBreak,
                                       need_lev = NeedLev} ->
                            LevBreakTime = lev_break:get_times(Role),
                            UseFlag = if LevBreakTime > NeedLevBreak -> true;
                                         LevBreakTime =:= NeedLevBreak ->
                                             case Lev >= NeedLev of
                                                 true -> true;
                                                 _ ->
                                                     {false,
                                                      util:flist(lang:get("等级不足~w级，无法装备法宝"),
                                                                 [NeedLev])}
                                             end;
                                         true -> {false, lang:get("突破后才能装备此法宝")}
                                      end,
                            case UseFlag of
                                true ->
                                    {NewPlan1, NewPlan2} = case UsePlan of
                                                               1 ->
                                                                   {lists:keystore(Type,
                                                                                   1,
                                                                                   Plan1,
                                                                                   {Type,
                                                                                    Id}),
                                                                    Plan2};
                                                               _ ->
                                                                   {Plan1,
                                                                    lists:keystore(Type,
                                                                                   1,
                                                                                   Plan2,
                                                                                   {Type,
                                                                                    Id})}
                                                           end,
                                    NewMtalisman = Mtalisman#m_talisman{plan_1 =
                                                                            NewPlan1,
                                                                        plan_2 =
                                                                            NewPlan2},
                                    Role1 =
                                        talisman_attr:calc_all_fc(Role#role{m_talisman
                                                                                =
                                                                                NewMtalisman}),
                                    NewRole = attr:calc_and_push(Role1),
                                    Msg = notice:format(lang:get("装备~ts成功"),
                                                        [{string_2,
                                                          1,
                                                          name(BaseId)}]),
                                    push_19604(NewRole),
                                    NewRole1 =
                                        role_trigger:fire(#evt_talisman{type =
                                                                            Type,
                                                                        id =
                                                                            Id},
                                                          NewRole),
                                    {true,
                                     Msg,
                                     UsePlan,
                                     NewPlan1,
                                     NewPlan2,
                                     NewRole1};
                                {false, Reason} -> {false, Reason}
                            end;
                        _ -> {false, lang:get("不可使用的法宝")}
                    end;
                _ -> {false, lang:get("不可使用的法宝")}
            end;
        _ -> {false, lang:get("不存在的法宝无法装备")}
    end.

unuse(Role = #role{m_talisman =
                       Mtalisman = #m_talisman{use_plan = UsePlan,
                                               plan_1 = Plan1, plan_2 = Plan2}},
      Type) ->
    case UsePlan of
        1 ->
            case lists:keyfind(Type, 1, Plan1) of
                {_, _} ->
                    NewPlan1 = lists:keydelete(Type, 1, Plan1),
                    NewMtalisman = Mtalisman#m_talisman{plan_1 = NewPlan1},
                    Role1 = talisman_attr:calc_all_fc(Role#role{m_talisman =
                                                                    NewMtalisman}),
                    NewRole = attr:calc_and_push(Role1),
                    Msg = lang:get("卸下成功"),
                    push_19604(NewRole),
                    {true, Msg, UsePlan, NewPlan1, Plan2, NewRole};
                _ -> {false, lang:get("没有装备法宝")}
            end;
        _ ->
            case lists:keyfind(Type, 1, Plan2) of
                {_, _} ->
                    NewPlan2 = lists:keydelete(Type, 1, Plan2),
                    NewMtalisman = Mtalisman#m_talisman{plan_2 = NewPlan2},
                    Role1 = talisman_attr:calc_all_fc(Role#role{m_talisman =
                                                                    NewMtalisman}),
                    NewRole = attr:calc_and_push(Role1),
                    Msg = lang:get("卸下成功"),
                    push_19604(NewRole),
                    {true, Msg, UsePlan, Plan1, NewPlan2, NewRole};
                _ -> {false, lang:get("没有装备法宝")}
            end
    end.

change_plan(#role{m_talisman =
                      #m_talisman{use_plan = Plan}},
            Plan) ->
    {false, lang:get("方案没有改变")};
change_plan(Role = #role{m_talisman =
                             Mtalisman = #m_talisman{}},
            Plan) ->
    NewMtalisman = Mtalisman#m_talisman{use_plan = Plan},
    Role1 = talisman_attr:calc_all_fc(Role#role{m_talisman =
                                                    NewMtalisman}),
    NewRole = attr:calc_and_push(Role1),
    push_19604(NewRole),
    Msg = lang:get("切换方案成功"),
    {true, Msg, NewRole}.

absorb(Role = #role{m_talisman =
                        Mtalisman = #m_talisman{items = Items}},
       Id1, Flag1, Id2, Flag2) ->
    CheckFlag = case lists:keyfind(Id1, #talisman.id, Items)
                    of
                    S = #talisman{} ->
                        case lists:keyfind(Id2, #talisman.id, Items) of
                            T = #talisman{} -> {true, S, T};
                            _ -> {false, lang:get("吸收法宝不存在")}
                        end;
                    _ -> {false, lang:get("目标法宝不存在")}
                end,
    case CheckFlag of
        {true, Self = #talisman{}, Target = #talisman{}} ->
            case do_absorb(Self, Target, Flag1, Flag2) of
                {true, NewSelf, Msg, Loss, OldAttr, NewAttr} ->
                    LossResult = case Loss of
                                     [_ | _] ->
                                         LossList = format:val_to_loss(Loss),
                                         case role_gain:do_notice(LossList,
                                                                  Role)
                                             of
                                             {ok, LossRole} -> {ok, LossRole};
                                             {false, #loss{msg = LossMsg}} ->
                                                 {false, LossMsg}
                                         end;
                                     _ -> {ok, Role}
                                 end,
                    case LossResult of
                        {ok, GetRole} ->
                            NewItems = lists:keydelete(Id2,
                                                       #talisman.id,
                                                       Items),
                            NewItems1 = lists:keystore(Id1,
                                                       #talisman.id,
                                                       NewItems,
                                                       NewSelf),
                            NewMtalisman = Mtalisman#m_talisman{items =
                                                                    NewItems1},
                            NewRole = GetRole#role{m_talisman = NewMtalisman},
                            NewRole1 = talisman_attr:calc_all_fc(NewRole),
                            NewRole2 = attr:calc_and_push(NewRole1),
                            push_19602(NewRole2, Target),
                            push_19603(NewRole2, NewSelf),
                            log:talisman(NewRole2,
                                         "吸收道具",
                                         [Self, Target],
                                         NewSelf),
                            notice:send(NewRole2, 3, Msg),
                            {true, "", NewRole2, OldAttr, NewAttr};
                        {false, Reason} -> {false, Reason}
                    end;
                {false, Reason} -> {false, Reason}
            end;
        {false, Reason} -> {false, Reason}
    end.

do_absorb(Self = #talisman{base_id = SBaseId,
                           attr = Sattr},
          #talisman{base_id = TBaseId, attr = Tattr}, Flag1,
          Flag2) ->
    Check = case talisman_data:get(SBaseId) of
                #talisman_base{type = Type, set_id = SetId,
                               name = Sname} ->
                    case talisman_data:get(TBaseId) of
                        #talisman_base{type = Type, set_id = SetId} ->
                            {true, false, Sname};
                        #talisman_base{type = Type, set_id = SetId2} ->
                            case check_absorb_between_set(SetId,
                                                          SetId2,
                                                          Tattr,
                                                          Flag2)
                                of
                                true -> {true, true, Sname};
                                {false, ErrMsg} -> {false, ErrMsg}
                            end;
                        _ -> {false, lang:get("未知法宝类型")}
                    end;
                _ -> {false, lang:get("未知法宝类型")}
            end,
    CheckFlagNum = case erlang:length(Flag1) =:=
                            erlang:length(Flag2)
                       of
                       true -> true;
                       _ -> {false, lang:get("两边所选属性数量相同时才可洗练哟{face_1, 22}")}
                   end,
    case CheckFlagNum of
        true ->
            case Check of
                {true, IsBetweenSet, GetSname} ->
                    Tattr1 = [{Flag div 100 rem 100, A}
                              || A = #attr_base{flag = Flag, val = Val,
                                                type = Type}
                                     <- Tattr,
                                 Val =/= 0 andalso Type =:= 9],
                    Sattr1 = [{Flag div 100 rem 100, A}
                              || A = #attr_base{flag = Flag, type = Type}
                                     <- Sattr,
                                 Type =:= 9],
                    case lists:all(fun ({Flag}) ->
                                           lists:keymember(Flag, 1, Sattr1)
                                   end,
                                   Flag1)
                        of
                        true ->
                            case lists:all(fun ({Flag}) ->
                                                   lists:keymember(Flag,
                                                                   1,
                                                                   Tattr1)
                                           end,
                                           Flag2)
                                of
                                true ->
                                    F = fun ({Flag}) ->
                                                case lists:keyfind(Flag,
                                                                   1,
                                                                   Tattr1)
                                                    of
                                                    {_,
                                                     #attr_base{flag =
                                                                    PerFlag}} ->
                                                        PerFlag rem 100 >= 3;
                                                    _ -> false
                                                end
                                        end,
                                    case not IsBetweenSet orelse
                                             lists:all(F, Flag2)
                                        of
                                        true ->
                                            {Self2,
                                             Msg,
                                             Loss,
                                             OldAttr,
                                             NewAttr} =
                                                do_absorb_per_flag(Self,
                                                                   Sattr1,
                                                                   Tattr1,
                                                                   Sattr,
                                                                   Flag1,
                                                                   Flag2,
                                                                   IsBetweenSet),
                                            TSNum = erlang:length(Msg),
                                            Msg2 =
                                                notice:format(lang:get("吸收成功，~ts"
                                                                           ++
                                                                           string:copies("，~ts",
                                                                                         TSNum)),
                                                              [{string_2,
                                                                5,
                                                                GetSname}
                                                               | Msg]),
                                            NewSelf =
                                                talisman_attr:calc_fc(Self2),
                                            {true,
                                             NewSelf,
                                             Msg2,
                                             Loss,
                                             OldAttr,
                                             NewAttr};
                                        _ -> {false, lang:get("本次转换属性要求3星以上")}
                                    end;
                                false -> {false, lang:get("吸收法宝没有可吸收属性")}
                            end;
                        false -> {false, lang:get("目标法宝没有对应属性孔")}
                    end;
                {false, Reason} -> {false, Reason}
            end;
        {false, Reason} -> {false, Reason}
    end.

do_absorb_per_flag(Self, SAttr, TAttr, Sattr, Flag1,
                   Flag2, IsBetweenSet) ->
    do_absorb_per_flag(Self,
                       [],
                       [],
                       [],
                       [],
                       SAttr,
                       TAttr,
                       Sattr,
                       Flag1,
                       Flag2,
                       IsBetweenSet).

do_absorb_per_flag(Self, Msg, Loss, OldAttr, NewAttr, _,
                   _, _, [], [], _IsBetweenSet) ->
    {Self, Msg, Loss, OldAttr, NewAttr};
do_absorb_per_flag(Self, AccMsg, AccLoss, OldAttr,
                   NewAttr, SAttr1, TAttr1, SAttr, [{Flag1} | RestFlag1],
                   [{Flag2} | RestFlag2], IsBetweenSet) ->
    {SFlag, Sa} = lists:keyfind(Flag1, 1, SAttr1),
    {_,
     Ta = #attr_base{flag = TFlag, name = TName,
                     val = TVal}} =
        lists:keyfind(Flag2, 1, TAttr1),
    TStar = TFlag rem 100,
    TStar2 = case IsBetweenSet of
                 true -> talisman_data:get_absorb_star_trans(TStar);
                 _ -> TStar
             end,
    NewTFlag = TStar2 + SFlag * 100 +
                   TFlag div 10000 rem 10 * 10000,
    NewTa = Ta#attr_base{flag = NewTFlag},
    NewSAttr = (SAttr -- [Sa]) ++ [NewTa],
    Loss = talisman_data:get_absorb(TStar),
    ExtraName = case TFlag div 10000 rem 10 of
                    1 -> "";
                    2 -> "宠物"
                end,
    Msg = {string_2,
           1,
           ExtraName ++ notice:to_attr_msg(TName, TVal)},
    do_absorb_per_flag(Self#talisman{attr = NewSAttr},
                       [Msg | AccMsg],
                       Loss ++ AccLoss,
                       [Sa | OldAttr],
                       [NewTa | NewAttr],
                       SAttr1,
                       TAttr1,
                       NewSAttr,
                       RestFlag1,
                       RestFlag2,
                       IsBetweenSet).

check_absorb_between_set(SetId, SetId2, TAttr, TFlag) ->
    case talisman_data:get_absorb_set_id_map(SetId2) of
        [SetId] -> check_enable_absorb_num(TAttr, TFlag);
        [SetMap] ->
            case lists:member(SetId, SetMap) of
                true -> check_enable_absorb_num(TAttr, TFlag);
                _ -> {false, lang:get("该法宝属性无法转移到目标法宝上")}
            end;
        _ -> {false, lang:get("同套装同部位的法宝才可以吸收属性")}
    end.

check_enable_absorb_num(Attr, Flag) ->
    Attr2 = [A || A = #attr_base{type = 9} <- Attr],
    EnableNum =
        talisman_data:get_enable_absorb_num(erlang:length(Attr2)),
    case erlang:length(Flag) =< EnableNum of
        true -> true;
        _ -> {false, lang:get("吸收属性数量超出限制")}
    end.

fusion(Role = #role{m_talisman =
                        Mtalisman = #m_talisman{fusion_lev = OldFusionLev},
                    p_bag = #package{items = BagItems}},
       Ids1, Ids2) ->
    DayFusion = var:get_var(Role, day, 603, 0),
    DayExpFusion = var:get_var(Role, day, 604, 0),
    case check_fusion(Mtalisman,
                      BagItems,
                      Ids1,
                      Ids2,
                      DayFusion,
                      DayExpFusion)
        of
        {false, Reason} -> {false, Reason};
        {true,
         NewMtalisman = #m_talisman{fusion_lev = NewFusionLev},
         LossTalisman,
         LossBagItem,
         NewDayFusion,
         NewDayExpFusion,
         SkillPrac,
         AddVal} ->
            LossFlag = case LossBagItem =:= [] of
                           true -> {true, Role};
                           _ ->
                               Loss = [#loss{label = item_id,
                                             val = LossBagItem}],
                               case role_gain:do_notice(Loss, Role) of
                                   {false, #loss{msg = Msg}} -> {false, Msg};
                                   {ok, LossRole} -> {true, LossRole}
                               end
                       end,
            case LossFlag of
                {false, Reason} -> {false, Reason};
                {true, NewRole} ->
                    NewRole1 =
                        talisman_attr:calc_all_fc(NewRole#role{m_talisman =
                                                                   NewMtalisman}),
                    NewRole2 = var:set_var(NewRole1,
                                           day,
                                           603,
                                           NewDayFusion),
                    NewRole3 = var:set_var(NewRole2,
                                           day,
                                           604,
                                           NewDayExpFusion),
                    NewRole4 = skill_prac:upgrade(NewRole3,
                                                  5,
                                                  SkillPrac,
                                                  1),
                    NewRole5 = attr:calc_and_push(NewRole4),
                    push_19602(NewRole5, LossTalisman),
                    push_19604(NewRole5),
                    RtnMsg = case OldFusionLev =/= NewFusionLev of
                                 true ->
                                     FusionName = case
                                                      talisman_data:get_fusion(NewFusionLev)
                                                      of
                                                      #{name := Fn} -> Fn;
                                                      _ -> ""
                                                  end,
                                     notice:format(lang:get("吸收了宝物的能量，宝物境界值增加~ts，境界提升至~ts"),
                                                   [{string_2, 1, AddVal},
                                                    {string_2, 1, FusionName}]);
                                 _ ->
                                     notice:format(lang:get("吸收了宝物的能量，宝物境界值增加~ts"),
                                                   [{string_2, 1, AddVal}])
                             end,
                    notice:send(NewRole5, 3, RtnMsg),
                    log:talisman(NewRole5, "熔炉道具", "", LossTalisman),
                    {true, "", NewRole5}
            end
    end.

check_fusion(Mtalisman = #m_talisman{plan_1 = Plan1,
                                     plan_2 = Plan2, items = TalismanItems,
                                     fusion_lev = FusionLev,
                                     fusion_val = FusionVal},
             BagItems, Ids1, Ids2, DayFusion, DayExpFusion) ->
    case do_check_ids(TalismanItems,
                      Plan1,
                      Plan2,
                      Ids1,
                      [],
                      0,
                      0)
        of
        {true,
         LossTalisman,
         AddVal1,
         NewTalismanItems,
         AddNum} ->
            case do_check_bag_ids(BagItems,
                                  Ids2,
                                  DayExpFusion,
                                  [],
                                  0)
                of
                {true, LossBagItem, AddVal2, NewDayExpFusion} ->
                    AllVal = AddVal1 + AddVal2,
                    case AllVal > 0 of
                        false -> {false, lang:get("今日熔炼数量已满")};
                        true ->
                            case DayFusion + AddNum > 100 of
                                true -> {false, lang:get("每天最多熔炼100个法宝")};
                                false ->
                                    case up_fusion(FusionLev, FusionVal, AllVal)
                                        of
                                        {true, NewFusionLev, NewFusionVal} ->
                                            SkillPrac = case
                                                            talisman_data:get_fusion(NewFusionLev)
                                                            of
                                                            #{skill_prac :=
                                                                  Skl} ->
                                                                Skl;
                                                            _ -> []
                                                        end,
                                            NewMtalisman =
                                                Mtalisman#m_talisman{items =
                                                                         NewTalismanItems,
                                                                     fusion_lev
                                                                         =
                                                                         NewFusionLev,
                                                                     fusion_val
                                                                         =
                                                                         NewFusionVal},
                                            NewDayFusion = DayFusion + AddNum,
                                            {true,
                                             NewMtalisman,
                                             LossTalisman,
                                             LossBagItem,
                                             NewDayFusion,
                                             NewDayExpFusion,
                                             SkillPrac,
                                             AllVal};
                                        {false, Reason} -> {false, Reason}
                                    end
                            end
                    end;
                {false, Reason} -> {false, Reason}
            end;
        {false, Reason} -> {false, Reason}
    end.

do_check_bag_ids(_Items, [], DayExpFusion, LossBagItem,
                 AddVal) ->
    {true, LossBagItem, AddVal, DayExpFusion};
do_check_bag_ids(Items, [Id | T], DayExpFusion,
                 LossBagItem, AddVal) ->
    case lists:keytake(Id, #item.id, Items) of
        {value,
         #item{type = 151, base_id = BaseId, quantity = Num},
         ResetItems} ->
            CanUse = max(0, 30 - DayExpFusion),
            UseNum = min(CanUse, Num),
            NewDayExpFusion = DayExpFusion + UseNum,
            case UseNum > 0 of
                true ->
                    case talisman_data:get_bag_fusion(BaseId) of
                        #{val := Val} ->
                            Val1 = round(Val * UseNum),
                            do_check_bag_ids(ResetItems,
                                             T,
                                             NewDayExpFusion,
                                             [{Id, UseNum} | LossBagItem],
                                             AddVal + Val1);
                        _ -> {false, lang:get("不可熔化的道具")}
                    end;
                _ ->
                    do_check_bag_ids(ResetItems,
                                     T,
                                     DayExpFusion,
                                     LossBagItem,
                                     AddVal)
            end;
        {value,
         #item{base_id = BaseId, quantity = Num},
         ResetItems} ->
            case talisman_data:get_bag_fusion(BaseId) of
                #{val := Val} ->
                    Val1 = round(Val * Num),
                    do_check_bag_ids(ResetItems,
                                     T,
                                     DayExpFusion,
                                     [{Id, Num} | LossBagItem],
                                     AddVal + Val1);
                _ -> {false, lang:get("不可熔化的道具")}
            end;
        _ -> {false, lang:get("找不到道具")}
    end.

do_check_ids(Items, _Plan1, _Plan2, [], LossItem,
             AddVal, AddNum) ->
    {true, LossItem, AddVal, Items, AddNum};
do_check_ids(Items, Plan1, Plan2, [Id | T], LossItem,
             AddVal, AddNum) ->
    case lists:keyfind(Id, #talisman.id, Items) of
        Talisman = #talisman{base_id = BaseId, type = _Type} ->
            case lists:keymember(Id, 2, Plan1 ++ Plan2) of
                false ->
                    NewItems = lists:keydelete(Id, #talisman.id, Items),
                    Val = case talisman_data:get(BaseId) of
                              #talisman_base{fusion_val = Fval} -> Fval;
                              _ -> 0
                          end,
                    NewAddNum = AddNum + 1,
                    do_check_ids(NewItems,
                                 Plan1,
                                 Plan2,
                                 T,
                                 [Talisman | LossItem],
                                 AddVal + Val,
                                 NewAddNum);
                _ -> {false, lang:get("装备中的法宝不能熔炼")}
            end;
        _ -> {false, lang:get("找不到法宝")}
    end.

gm_up_fusion(Role = #role{m_talisman =
                              Mtalisman = #m_talisman{fusion_lev = FusionLev,
                                                      fusion_val = FusionVal}},
             Val) ->
    case up_fusion(FusionLev, FusionVal, Val) of
        {true, NewFusionLev, NewFusionVal} ->
            SkillPrac = case talisman_data:get_fusion(NewFusionLev)
                            of
                            #{skill_prac := Skl} -> Skl;
                            _ -> []
                        end,
            NewMtalisman = Mtalisman#m_talisman{fusion_lev =
                                                    NewFusionLev,
                                                fusion_val = NewFusionVal},
            NewRole1 =
                talisman_attr:calc_all_fc(Role#role{m_talisman =
                                                        NewMtalisman}),
            NewRole4 = skill_prac:upgrade(NewRole1,
                                          5,
                                          SkillPrac,
                                          1),
            NewRole5 = attr:calc_and_push(NewRole4),
            push_19604(NewRole5),
            {ok, NewRole5};
        {false, Reason} -> {false, Reason}
    end.

up_fusion(FusionLev, FusionVal, AddVal) ->
    case talisman_data:get_fusion(FusionLev) of
        #{max_lev := MaxLev} when FusionLev >= MaxLev ->
            {false, lang:get("熔炉已经满级，无法继续升级")};
        #{need_val := NeedVal} ->
            AllVal = FusionVal + AddVal,
            case AllVal >= NeedVal of
                true -> do_up_fusion(FusionLev + 1, AllVal - NeedVal);
                _ -> {true, FusionLev, AllVal}
            end;
        _ -> {false, lang:get("不存在的熔炉等级")}
    end.

do_up_fusion(FusionLev, AllVal) ->
    case talisman_data:get_fusion(FusionLev) of
        #{max_lev := MaxLev} when FusionLev >= MaxLev ->
            {true, FusionLev, 0};
        #{need_val := NeedVal} ->
            case AllVal >= NeedVal of
                true -> do_up_fusion(FusionLev + 1, AllVal - NeedVal);
                _ -> {true, FusionLev, AllVal}
            end;
        _ -> {true, FusionLev, AllVal}
    end.

remold(Role = #role{m_talisman =
                        MTalisman = #m_talisman{next_id = NextId, items = Items,
                                                remold_formula =
                                                    RemoldFormula}},
       FormulaId, Stuff) ->
    case remold_check(Role, FormulaId, Stuff) of
        true ->
            #{cost := Cost, complex_base_id := BaseId} =
                talisman_data:get_formula(FormulaId),
            role:send_buff_begin(),
            Loss = format:val_to_loss(Cost),
            case role_gain:do(Loss, Role) of
                {ok, NewRole1} ->
                    NewItems1 = delete_talisman(Stuff, Items),
                    case make_talisman(BaseId) of
                        {true, Talisman} ->
                            role:send_buff_flush(),
                            Talisman1 = talisman_attr:init(Talisman#talisman{id
                                                                                 =
                                                                                 NextId}),
                            NewTalisman = talisman_attr:calc_fc(Talisman1),
                            NewItems = [NewTalisman | NewItems1],
                            {_, LeftRemoldTimes} = lists:keyfind(FormulaId,
                                                                 1,
                                                                 RemoldFormula),
                            NewRemoldFormula = lists:keystore(FormulaId,
                                                              1,
                                                              RemoldFormula,
                                                              {FormulaId,
                                                               LeftRemoldTimes -
                                                                   1}),
                            NewMTalisman = MTalisman#m_talisman{next_id =
                                                                    NextId + 1,
                                                                items =
                                                                    NewItems,
                                                                remold_formula =
                                                                    NewRemoldFormula},
                            NewRole = NewRole1#role{m_talisman = NewMTalisman},
                            push_19600(NewRole),
                            Msg4 = lang:get("重塑成功"),
                            [{AssetsType, Val} | _] = Cost,
                            NoticeMsg = notice:format(lang:get("消耗~ts,获得~ts"),
                                                      [{assets_1,
                                                        AssetsType,
                                                        Val},
                                                       {item_2, BaseId}]),
                            notice:send(NewRole, 3, NoticeMsg),
                            NewStuff = lists:foldl(fun ({TempId, _}, Acc) ->
                                                           case
                                                               lists:keyfind(TempId,
                                                                             #talisman.id,
                                                                             Items)
                                                               of
                                                               T =
                                                                   #talisman{} ->
                                                                   [T | Acc];
                                                               _ -> ok
                                                           end
                                                   end,
                                                   [],
                                                   Stuff),
                            catch log:talisman(NewRole,
                                               "重塑",
                                               NewStuff,
                                               NewTalisman),
                            {ok, BaseId, Msg4, NewRole};
                        {false, Msg3} ->
                            role:send_buff_clean(),
                            {false, Msg3}
                    end;
                _ ->
                    role:send_buff_clean(),
                    Msg2 = lang:get("金币不足"),
                    {false, Msg2}
            end;
        {false, Reason} -> {false, Reason};
        _ ->
            Msg1 = lang:get("配方材料错啦"),
            {false, Msg1}
    end.

delete_talisman([], Items) -> Items;
delete_talisman([{TalismanId, _} | LeftStuff], Items) ->
    NewItems = lists:keydelete(TalismanId,
                               #talisman.id,
                               Items),
    delete_talisman(LeftStuff, NewItems).

remold_check(#role{m_talisman =
                       #m_talisman{use_plan = UsePlan, plan_1 = Plan1,
                                   plan_2 = Plan2, items = Items,
                                   remold_formula = RemoldFormula}},
             FormulaId, Stuff) ->
    case check_diff(Stuff, []) of
        true ->
            case lists:keyfind(FormulaId, 1, RemoldFormula) of
                {_, LeftRemoldTimes} ->
                    case talisman_data:get_formula(FormulaId) of
                        #{stuff1 := CfgStuff1, stuff2 := CfgStuff2,
                          stuff3 := CfgStuff3} ->
                            case LeftRemoldTimes > 0 of
                                true ->
                                    case to_three_stuff(Stuff, [], [], []) of
                                        NewStuff when is_list(NewStuff) ->
                                            Plan = case UsePlan =:= 1 of
                                                       true -> Plan1;
                                                       _ -> Plan2
                                                   end,
                                            remold_check_stuff(NewStuff,
                                                               [CfgStuff1,
                                                                CfgStuff2,
                                                                CfgStuff3],
                                                               Plan,
                                                               Items);
                                        _ ->
                                            Msg5 = lang:get("数据错误"),
                                            {false, Msg5}
                                    end;
                                _ ->
                                    Msg4 = lang:get("次数用完啦"),
                                    {false, Msg4}
                            end;
                        _ ->
                            Msg3 = lang:get("配方不存在"),
                            {false, Msg3}
                    end;
                _ ->
                    Msg2 = lang:get("配方错误"),
                    {false, Msg2}
            end;
        _ ->
            Msg1 = lang:get("法宝重复"),
            {false, Msg1}
    end.

check_diff([], _TalismanIdList) -> true;
check_diff([{TalismanId, _} | Stuff], TalismanIdList) ->
    case lists:member(TalismanId, TalismanIdList) of
        true -> false;
        _ -> check_diff(Stuff, [TalismanId | TalismanIdList])
    end.

to_three_stuff([], Stuff1, Stuff2, Stuff3) ->
    Stuff = [Stuff1, Stuff2, Stuff3],
    Stuff;
to_three_stuff([{TalismanId, 1} | LeftStuff], Stuff1,
               Stuff2, Stuff3) ->
    to_three_stuff(LeftStuff,
                   [TalismanId | Stuff1],
                   Stuff2,
                   Stuff3);
to_three_stuff([{TalismanId, 2} | LeftStuff], Stuff1,
               Stuff2, Stuff3) ->
    to_three_stuff(LeftStuff,
                   Stuff1,
                   [TalismanId | Stuff2],
                   Stuff3);
to_three_stuff([{TalismanId, 3} | LeftStuff], Stuff1,
               Stuff2, Stuff3) ->
    to_three_stuff(LeftStuff,
                   Stuff1,
                   Stuff2,
                   [TalismanId | Stuff3]);
to_three_stuff(_, _Stuff1, _Stuff2, _Stuff3) -> false.

remold_check_stuff([], [], _Plan, _Items) -> true;
remold_check_stuff([], [_ | _], _Plan, _Items) -> false;
remold_check_stuff([_ | _], [], _Plan, _Items) -> false;
remold_check_stuff([Stuff | LeftStuff],
                   [CfgStuff | LeftCfgStuff], Plan, Items) ->
    Len = length(Stuff),
    case do_remold_check_stuff(Stuff,
                               CfgStuff,
                               Plan,
                               Items,
                               Len,
                               undefined)
        of
        true ->
            remold_check_stuff(LeftStuff,
                               LeftCfgStuff,
                               Plan,
                               Items);
        _ -> false
    end.

do_remold_check_stuff([], _CfgStuff, _Plan, _Items,
                      _Len, _BaseId) ->
    true;
do_remold_check_stuff([TalismanId | LeftStuff],
                      CfgStuff, Plan, Items, Len, LastBaseId) ->
    case lists:keyfind(TalismanId, #talisman.id, Items) of
        #talisman{base_id = BaseId} ->
            case lists:keyfind(TalismanId, 2, Plan) of
                {_, _} -> false;
                _ ->
                    NewBaseId = case LastBaseId of
                                    undefined -> BaseId;
                                    _ -> LastBaseId
                                end,
                    case NewBaseId =:= BaseId of
                        true ->
                            case lists:keyfind(NewBaseId, 1, CfgStuff) of
                                {_, CfgNeedNum} ->
                                    case Len =:= CfgNeedNum of
                                        true ->
                                            do_remold_check_stuff(LeftStuff,
                                                                  CfgStuff,
                                                                  Plan,
                                                                  Items,
                                                                  Len,
                                                                  NewBaseId);
                                        _ -> false
                                    end;
                                _ -> false
                            end;
                        _ -> false
                    end
            end;
        _ -> false
    end.

push_formula(Role = #role{m_talisman =
                              #m_talisman{remold_formula = RemoldFormula}}) ->
    case length(RemoldFormula) =:= 0 of
        true ->
            {ok,
             NewRole = #role{m_talisman =
                                 #m_talisman{remold_formula =
                                                 NewRemoldFormula}}} =
                remold_reset_week_five(Role, Role),
            {ok, NewRemoldFormula, NewRole};
        _ -> {ok, RemoldFormula}
    end.

gm_remold_reset_week_five(Role) ->
    {ok, NewRole} = remold_reset_week_five(Role, Role),
    push_formula(NewRole),
    {ok, NewRole}.

remold_reset_week_five(Role = #role{classes = Classes,
                                    lev = Lev, m_talisman = MTalisman},
                       _OldRole) ->
    GroupList = talisman_data:get_formula_group_list(),
    GroupNumList = rand_group_num(GroupList, []),
    RemoldFormula = rand_formula(GroupNumList,
                                 [],
                                 Classes,
                                 Lev),
    {ok,
     Role#role{m_talisman =
                   MTalisman#m_talisman{remold_formula = RemoldFormula}}}.

rand_group_num([], GroupNumList) -> GroupNumList;
rand_group_num([GroupId | GroupList], GroupNumList) ->
    case talisman_data:get_formula_group(GroupId) of
        #{min_num := MinNum, max_num := MaxNum} ->
            GroupNum = util:rand(MinNum, MaxNum),
            rand_group_num(GroupList,
                           [{GroupId, GroupNum} | GroupNumList]);
        _ -> rand_group_num(GroupList, GroupNumList)
    end.

rand_formula([], RemoldFormula, _Classes, _Lev) ->
    RemoldFormula;
rand_formula([{GroupId, GroupNum} | GroupNumList],
             RemoldFormula, Classes, Lev) ->
    AllFormulaList = talisman_data:get_formula_list(),
    GroupFormulaList = get_formula_by_group(AllFormulaList,
                                            GroupId,
                                            Classes,
                                            Lev,
                                            []),
    RandRemoldFormulaList =
        util:rand_list_n(GroupFormulaList, weight, GroupNum),
    NewRemoldFormula =
        to_formula_id_and_num(RandRemoldFormulaList,
                              RemoldFormula),
    rand_formula(GroupNumList,
                 NewRemoldFormula,
                 Classes,
                 Lev).

get_formula_by_group([], _GroupId, _Classes, _Lev,
                     GroupFormulaList) ->
    GroupFormulaList;
get_formula_by_group([FormulaId | FormulaList], GroupId,
                     Classes, Lev, GroupFormulaList) ->
    case talisman_data:get_formula(FormulaId) of
        Formula = #{group_id := CfgGroupId,
                    classes := CfgClasses, min_lev := CfgMinLev,
                    max_lev := CfgMaxLev}
            when CfgGroupId =:= GroupId andalso
                     CfgMinLev =< Lev andalso
                         Lev =< CfgMaxLev andalso
                             (CfgClasses =:= 0 orelse CfgClasses =:= Classes) ->
            get_formula_by_group(FormulaList,
                                 GroupId,
                                 Classes,
                                 Lev,
                                 [Formula | GroupFormulaList]);
        _ ->
            get_formula_by_group(FormulaList,
                                 GroupId,
                                 Classes,
                                 Lev,
                                 GroupFormulaList)
    end.

to_formula_id_and_num([], RemoldFormula) ->
    RemoldFormula;
to_formula_id_and_num([#{formula_id := FormulaId,
                         complex_times := Times}
                       | T],
                      RemoldFormula) ->
    to_formula_id_and_num(T,
                          [{FormulaId, Times} | RemoldFormula]).

add_volume(Role = #role{m_talisman =
                            MTalisman = #m_talisman{volume = Volume}}) ->
    OpenTimes = var:get_var(Role, other, 2132, 0),
    case talisman_data:get_add_volume(OpenTimes + 1) of
        Cost when is_list(Cost) ->
            Loss = format:val_to_loss(Cost),
            case role_gain:do_notice(Loss, Role) of
                {ok, NewRole} ->
                    NewRole1 = var:set_var(NewRole,
                                           other,
                                           2132,
                                           OpenTimes + 1),
                    NewVolume = Volume + 4,
                    {ok,
                     lang:get("开启成功{face_1,3}"),
                     NewVolume,
                     NewRole1#role{m_talisman =
                                       MTalisman#m_talisman{volume =
                                                                NewVolume}}};
                _ -> {false, lang:get("道具不足，无法增加容量"), Volume}
            end;
        _ -> {false, lang:get("宝物背包已达上限"), Volume}
    end.

talisman_classes_modify(Role = #role{classes = Classes,
                                     m_talisman =
                                         MTalisman = #m_talisman{items =
                                                                     Items}},
                        TargetClasses) ->
    {ModifySet, ModifyAttr} =
        talisman_classes_modify_set_and_attr(Classes,
                                             TargetClasses),
    NewItems1 = talisman_classes_modify_set(Items,
                                            ModifySet,
                                            []),
    NewItems2 = talisman_classes_modify_all_attr(NewItems1,
                                                 ModifyAttr,
                                                 []),
    LastId = case NewItems2 of
                 [] -> 0;
                 _ -> lists:max([Id || #talisman{id = Id} <- NewItems2])
             end,
    NewRole1 = Role#role{m_talisman =
                             MTalisman#m_talisman{items = NewItems2,
                                                  last_gain_id = LastId}},
    NewRole2 = talisman_attr:calc_all_fc(NewRole1),
    NewRole3 = attr:calc_and_push(NewRole2),
    push_19600(NewRole3),
    NewRole3.

talisman_classes_modify_set_and_attr(Classes,
                                     TargetClasses) ->
    case talisman_data:get_classes_modify({Classes,
                                           TargetClasses})
        of
        #{set_id1 := SetId1, target_set_id1 := TargetSetId1,
          set_id2 := SetId2, target_set_id2 := TargetSetId2,
          set_id3 := SetId3, target_set_id3 := TargetSetId3,
          set_id4 := SetId4, target_set_id4 := TargetSetId4,
          attr_name1 := AttrName1,
          target_attr_name1 := TargetAttrName1,
          attr_name2 := AttrName2,
          target_attr_name2 := TargetAttrName2,
          attr_name3 := AttrName3,
          target_attr_name3 := TargetAttrName3,
          attr_name4 := AttrName4,
          target_attr_name4 := TargetAttrName4} ->
            {[{SetId1, TargetSetId1},
              {SetId2, TargetSetId2},
              {SetId3, TargetSetId3},
              {SetId4, TargetSetId4}],
             [{AttrName1, TargetAttrName1},
              {AttrName2, TargetAttrName2},
              {AttrName3, TargetAttrName3},
              {AttrName4, TargetAttrName4}]};
        _ -> {[], []}
    end.

talisman_classes_modify_set([], _SetModifyList,
                            NewItems) ->
    lists:reverse(NewItems);
talisman_classes_modify_set([Talisman =
                                 #talisman{base_id = BaseId, attr = Attr}
                             | T],
                            SetModifyList, NewItems) ->
    NewTalisman = case talisman_data:get(BaseId) of
                      #talisman_base{set_id = SetId} ->
                          case lists:keyfind(SetId, 1, SetModifyList) of
                              {_, NewSetId} ->
                                  NewBaseId = BaseId + NewSetId - SetId,
                                  NewAttr1 =
                                      talisman_classes_modify_delete_attr_base(Attr),
                                  BaseAttr = talisman_attr:init_base(NewBaseId),
                                  NewAttr = BaseAttr ++ NewAttr1,
                                  Talisman#talisman{base_id = NewBaseId,
                                                    attr = NewAttr};
                              _ -> Talisman
                          end;
                      _ -> Talisman
                  end,
    talisman_classes_modify_set(T,
                                SetModifyList,
                                [NewTalisman | NewItems]).

talisman_classes_modify_delete_attr_base([]) -> [];
talisman_classes_modify_delete_attr_base(Attr) ->
    case lists:keyfind(7, #attr_base.type, Attr) of
        #attr_base{} ->
            NewAttr = lists:keydelete(7, #attr_base.type, Attr),
            talisman_classes_modify_delete_attr_base(NewAttr);
        _ -> Attr
    end.

talisman_classes_modify_all_attr([], _AttrModifyList,
                                 NewItems) ->
    lists:reverse(NewItems);
talisman_classes_modify_all_attr([Talisman =
                                      #talisman{base_id = BaseId, type = Type,
                                                quality = Quality, lev = Lev,
                                                attr = Attr}
                                  | T],
                                 AttrModifyList, Items) ->
    NewAttr = case talisman_data:get(BaseId) of
                  #talisman_base{grade = Grade} ->
                      SpecialList = talisman_data_get_special_list(Type,
                                                                   Lev,
                                                                   Quality,
                                                                   Grade,
                                                                   1),
                      talisman_classes_modify_attr(Attr,
                                                   AttrModifyList,
                                                   SpecialList,
                                                   Grade,
                                                   []);
                  _ -> Attr
              end,
    NewTalisman1 = Talisman#talisman{attr = NewAttr},
    NewTalisman2 = talisman_attr:calc_fc(NewTalisman1),
    talisman_classes_modify_all_attr(T,
                                     AttrModifyList,
                                     [NewTalisman2 | Items]).

talisman_classes_modify_attr([], _AttrModifyList,
                             _SpecialList, _Grade, NewAttr) ->
    lists:reverse(NewAttr);
talisman_classes_modify_attr([AttrBase = #attr_base{type
                                                        = AttrType,
                                                    name = Name, flag = Flag}
                              | T],
                             AttrModifyList, SpecialList, Grade, Attr) ->
    NewAttr = case AttrType =:= 9 of
                  true ->
                      case Flag div 10000 rem 10 of
                          1 ->
                              case lists:keyfind(Name, 1, AttrModifyList) of
                                  {_, NewName} ->
                                      case lists:keyfind(NewName,
                                                         1,
                                                         SpecialList)
                                          of
                                          {_, AttrVal} ->
                                              Star = Flag rem 100,
                                              {Ratio, _} =
                                                  talisman_data:get_step_ratio({Star,
                                                                                Grade}),
                                              Val = round(AttrVal * Ratio /
                                                              1000),
                                              NewAttrBase =
                                                  attr_type:to_attr(fixed,
                                                                    9,
                                                                    Flag,
                                                                    [{NewName,
                                                                      Val}]),
                                              NewAttrBase ++ Attr;
                                          _ -> [AttrBase | Attr]
                                      end;
                                  _ -> [AttrBase | Attr]
                              end;
                          _ -> [AttrBase | Attr]
                      end;
                  _ -> [AttrBase | Attr]
              end,
    talisman_classes_modify_attr(T,
                                 AttrModifyList,
                                 SpecialList,
                                 Grade,
                                 NewAttr).

talisman_data_get_special_list(Type, Lev, Quality,
                               Grade, ActionObj) ->
    case talisman_data:get_special({Type,
                                    Lev,
                                    Quality,
                                    Grade,
                                    ActionObj})
        of
        Special when is_map(Special) ->
            #{attr_name1 := AttrName1, attr_val1 := AttrVal1,
              attr_ratio1 := _AttrRatio1, attr_name2 := AttrName2,
              attr_val2 := AttrVal2, attr_ratio2 := _AttrRatio2,
              attr_name3 := AttrName3, attr_val3 := AttrVal3,
              attr_ratio3 := _AttrRatio3, attr_name4 := AttrName4,
              attr_val4 := AttrVal4, attr_ratio4 := _AttrRatio4,
              attr_name5 := AttrName5, attr_val5 := AttrVal5,
              attr_ratio5 := _AttrRatio5, attr_name6 := AttrName6,
              attr_val6 := AttrVal6, attr_ratio6 := _AttrRatio6,
              attr_name7 := AttrName7, attr_val7 := AttrVal7,
              attr_ratio7 := _AttrRatio7, attr_name8 := AttrName8,
              attr_val8 := AttrVal8, attr_ratio8 := _AttrRatio8,
              attr_name9 := AttrName9, attr_val9 := AttrVal9,
              attr_ratio9 := _AttrRatio9, attr_name10 := AttrName10,
              attr_val10 := AttrVal10, attr_ratio10 := _AttrRatio10,
              attr_name11 := AttrName11, attr_val11 := AttrVal11,
              attr_ratio11 := _AttrRatio11} =
                Special,
            [{AttrName1, AttrVal1},
             {AttrName2, AttrVal2},
             {AttrName3, AttrVal3},
             {AttrName4, AttrVal4},
             {AttrName5, AttrVal5},
             {AttrName6, AttrVal6},
             {AttrName7, AttrVal7},
             {AttrName8, AttrVal8},
             {AttrName9, AttrVal9},
             {AttrName10, AttrVal10},
             {AttrName11, AttrVal11}];
        _ -> []
    end.

talisman_convert(Id, BaseId, TargetBaseId,
                 Role = #role{assets =
                                  _Assets = #assets{star_gold = StarGold},
                              m_talisman =
                                  MTalisman = #m_talisman{items = Items,
                                                          last_gain_id =
                                                              LastGainId}}) ->
    Quality = case talisman_data:get(BaseId) of
                  #talisman_base{quality = Q} -> Q;
                  _ -> 0
              end,
    {CostType, Num} =
        talisman_data:get_covert_cost(Quality),
    case CostType =:= 0 of
        true -> {0, lang:get("读取配置文件出错")};
        _ ->
            Loss = case CostType of
                       90003 -> format:val_to_loss([{90003, Num}]);
                       29255 ->
                           case StarGold >= Num of
                               true -> format:val_to_loss([{90026, Num}]);
                               _ ->
                                   format:val_to_loss([{90026, StarGold},
                                                       {90002, Num - StarGold}])
                           end;
                       _ ->
                           logger:error("读取配置文件出错", [], talisman, 1190),
                           format:val_to_loss([{90002, 0}])
                   end,
            case is_convertible(Role) of
                true ->
                    role:send_buff_begin(),
                    case role_gain:do_notice(Loss, Role) of
                        {ok, LossRole} ->
                            case Id =< LastGainId of
                                true ->
                                    SetId = case talisman_data:get(BaseId) of
                                                #talisman_base{set_id = SId} ->
                                                    SId;
                                                _ -> 0
                                            end,
                                    TargetSetId = case
                                                      talisman_data:get(TargetBaseId)
                                                      of
                                                      #talisman_base{set_id =
                                                                         SId1} ->
                                                          SId1;
                                                      _ -> 0
                                                  end,
                                    TargetTalisman = lists:keyfind(Id,
                                                                   #talisman.id,
                                                                   Items),
                                    [NewTalisman | _] =
                                        talisman_classes_modify_set([TargetTalisman],
                                                                    [{SetId,
                                                                      TargetSetId}],
                                                                    []),
                                    NewItems1 = lists:keyreplace(Id,
                                                                 #talisman.id,
                                                                 Items,
                                                                 NewTalisman),
                                    NewRole1 = LossRole#role{m_talisman =
                                                                 MTalisman#m_talisman{items
                                                                                          =
                                                                                          NewItems1}},
                                    NewRole2 =
                                        talisman_attr:calc_all_fc(NewRole1),
                                    NewRole3 = attr:calc_and_push(NewRole2),
                                    push_19600(NewRole3),
                                    push_10627(NewRole3),
                                    role:send_buff_flush(),
                                    {1, NewRole3};
                                _ ->
                                    role:send_buff_clean(),
                                    {0, lang:get("不符合转换条件")}
                            end;
                        _Other ->
                            logger:debug("出错了~w", [_Other], talisman, 1224),
                            role:send_buff_clean(),
                            {0, lang:get("金币或钻石不足，不能进行转换")}
                    end;
                _ -> {0, lang:get("不符合转换条件")}
            end
    end.

get_convertible_talisman(Role = #role{classes = Class,
                                      m_talisman =
                                          #m_talisman{items = Items,
                                                      last_gain_id =
                                                          LastGainId}}) ->
    LastCmClass = case var:get_var(Role, other, 2053, []) of
                      [] -> [];
                      [Class1 | _] -> Class1
                  end,
    Result = case is_convertible(Role) of
                 true ->
                     logger:debug("符合宝物转换条件", [], talisman, 1243),
                     get_talisman_list(LastCmClass,
                                       Class,
                                       Items,
                                       LastGainId,
                                       1);
                 _ ->
                     logger:debug("不符合宝物转换条件", [], talisman, 1246),
                     get_talisman_list(LastCmClass,
                                       Class,
                                       Items,
                                       LastGainId,
                                       0)
             end,
    lists:reverse(Result).

is_convertible(Role) ->
    LastCmTime = var:get_var(Role, other, 2046, 0),
    Now = date:unixtime(),
    Result = case LastCmTime of
                 0 -> false;
                 _ ->
                     case (Now - LastCmTime) div 86400 < 7 of
                         true -> true;
                         _ -> false
                     end
             end,
    Result.

get_talisman_list(LastCmClass, Class, Items, LastGainId,
                  Flag) ->
    Fun = fun (#talisman{id = Id, base_id = BaseId}, Acc) ->
                  SetId = case talisman_data:get(BaseId) of
                              #talisman_base{set_id = SId} -> SId;
                              _ -> 0
                          end,
                  case Flag =:= 1 of
                      true ->
                          case Id =< LastGainId of
                              true ->
                                  case
                                      talisman_data:get_talisman_convert({LastCmClass,
                                                                          Class})
                                      of
                                      #{set_id1 := SetId1,
                                        target_set_id1 := TargetSetList1,
                                        set_id2 := SetId2,
                                        target_set_id2 := TargetSetList2,
                                        set_id3 := SetId3,
                                        target_set_id3 := TargetSetList3,
                                        set_id4 := SetId4,
                                        target_set_id4 := TargetSetList4} ->
                                          case SetId of
                                              SetId1 ->
                                                  TargetBaseIdList1 =
                                                      get_target_base_id(TargetSetList1,
                                                                         BaseId,
                                                                         SetId,
                                                                         Flag,
                                                                         []),
                                                  [[{Id,
                                                     BaseId,
                                                     TargetBaseIdList1}]
                                                   | Acc];
                                              SetId2 ->
                                                  TargetBaseIdList2 =
                                                      get_target_base_id(TargetSetList2,
                                                                         BaseId,
                                                                         SetId,
                                                                         Flag,
                                                                         []),
                                                  [[{Id,
                                                     BaseId,
                                                     TargetBaseIdList2}]
                                                   | Acc];
                                              SetId3 ->
                                                  TargetBaseIdList3 =
                                                      get_target_base_id(TargetSetList3,
                                                                         BaseId,
                                                                         SetId,
                                                                         Flag,
                                                                         []),
                                                  [[{Id,
                                                     BaseId,
                                                     TargetBaseIdList3}]
                                                   | Acc];
                                              SetId4 ->
                                                  TargetBaseIdList4 =
                                                      get_target_base_id(TargetSetList4,
                                                                         BaseId,
                                                                         SetId,
                                                                         Flag,
                                                                         []),
                                                  [[{Id,
                                                     BaseId,
                                                     TargetBaseIdList4}]
                                                   | Acc];
                                              _ -> [[{Id, BaseId, []}] | Acc]
                                          end;
                                      _ -> [[{Id, BaseId, []}] | Acc]
                                  end;
                              _ -> [[{Id, BaseId, []}] | Acc]
                          end;
                      _ -> [[{Id, BaseId, []}] | Acc]
                  end
          end,
    TalismanList = lists:foldl(Fun, [], Items),
    util:flist(TalismanList).

get_target_base_id([], _BaseId, _SetId, _Flag, Acc) ->
    util:flist(Acc);
get_target_base_id([{TargetSetId} | T], BaseId, SetId,
                   Flag, Acc) ->
    NewBaseId1 = BaseId + TargetSetId - SetId,
    get_target_base_id(T,
                       BaseId,
                       SetId,
                       Flag,
                       [Acc, {NewBaseId1, Flag}]).

push_19600(Role = #role{m_talisman = Mtalisman}) ->
    DayFusion = var:get_var(Role, day, 603, 0),
    role:link_send(Role, 19600, {DayFusion, Mtalisman}).

push_10627(Role) ->
    TalismanList = talisman:get_convertible_talisman(Role),
    role:link_send(Role, 10627, {TalismanList}).

push_19601(Role, Talisman = #talisman{}) ->
    role:link_send(Role, 19601, {[Talisman]});
push_19601(_, _) -> ok.

push_19602(Role, Talisman = #talisman{}) ->
    role:link_send(Role, 19602, {[Talisman]});
push_19602(Role, Talismans = [_ | _]) ->
    role:link_send(Role, 19602, {Talismans});
push_19602(_, _) -> ok.

push_19603(Role, Talisman = #talisman{}) ->
    role:link_send(Role, 19603, {[Talisman]});
push_19603(Role, Talismans = [_ | _]) ->
    role:link_send(Role, 19603, {Talismans});
push_19603(_, _) -> ok.

push_19604(Role = #role{m_talisman = Mtalisman}) ->
    DayFusion = var:get_var(Role, day, 603, 0),
    role:link_send(Role, 19604, {DayFusion, Mtalisman});
push_19604(_) -> ok.

adm_show(_Role = #role{m_talisman =
                           #m_talisman{items = Items}}) ->
    {ok, adm_show(Items, [])}.

adm_show([], List) -> List;
adm_show([#talisman{base_id = BaseId, lev = Lev,
                    quality = Quality}
          | T],
         List) ->
    Add = [{base_id, BaseId},
           {lev, Lev},
           {quality, Quality},
           {name, item:attr(name, BaseId)}],
    adm_show(T, [Add | List]).

adm_show_lev(#role{m_talisman =
                       #m_talisman{fusion_lev = Lev}}) ->
    {ok, Lev}.

get_combat_talisman(#role{m_talisman =
                              #m_talisman{use_plan = UsePlan, plan_1 = Plan1,
                                          plan_2 = Plan2, items = Items}}) ->
    UseTalisman = case UsePlan of
                      1 -> Plan1;
                      _ -> Plan2
                  end,
    Fun = fun ({Pos, Id}, Rtn) ->
                  TalismanSetId = case lists:keyfind(Id,
                                                     #talisman.id,
                                                     Items)
                                      of
                                      #talisman{base_id = BaseId} ->
                                          case talisman_data:get(BaseId) of
                                              #talisman_base{set_id = SetId} ->
                                                  SetId;
                                              _ -> 0
                                          end;
                                      _ -> 0
                                  end,
                  [{Pos, TalismanSetId} | Rtn]
          end,
    lists:foldl(Fun, [], UseTalisman).

