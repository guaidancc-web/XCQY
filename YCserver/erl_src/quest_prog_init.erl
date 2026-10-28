-file("src/mod/quest/quest_prog_init.erl", 1).

-module(quest_prog_init).

-export([do/3, update/3]).

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

-file("src/mod/quest/quest_prog_init.erl", 12).

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

-file("src/mod/quest/quest_prog_init.erl", 13).

-file("inc/quest.hrl", 1).

-file("inc/quest_king.hrl", 1).

-record(quest_king,
        {ver = 1,
         stage = 1,
         finish = [],
         doing = [],
         rf_times = 0}).

-file("inc/quest.hrl", 36).

-record(quest_data,
        {id = 1 :: pos_integer(),
         phase = 1 :: pos_integer(),
         quest_line = 1,
         type = 1 :: pos_integer(),
         sec_type = 1 :: pos_integer(),
         name = "" :: list(),
         mode = 1 :: pos_integer(),
         leader_cond = [] :: [tuple()],
         is_leader_quest = 0 :: 0 | 1,
         can_giveup = 0 :: 0..1,
         lev = 1 :: pos_integer(),
         lev_break_min_times = 0 :: non_neg_integer(),
         lev_break_max_times = 0 :: non_neg_integer(),
         max_lev = 0 :: non_neg_integer(),
         auto_finished_lev = 0 :: non_neg_integer(),
         classes = 0 :: 0..4,
         pre_quest ::
             undefined | non_neg_integer() | [non_neg_integer()],
         check_distance = 0 :: 0..1,
         npc_accept_battle = 0 :: non_neg_integer(),
         npc_accept_id = 0 :: non_neg_integer(),
         npc_accept = 0 :: non_neg_integer(),
         npc_commit_battle = 0 :: non_neg_integer(),
         npc_commit_id = 0 :: non_neg_integer(),
         npc_commit = 0 :: non_neg_integer(),
         start_time = 0 ::
             tuple() | non_neg_integer() | undefined,
         end_time = 0 :: tuple() | non_neg_integer() | undefined,
         condition = [] :: [tuple()],
         progress = [] :: [tuple()],
         rewards_accept = [] :: [tuple()],
         rewards_commit = [] :: [tuple()],
         commit_loss = [] :: [tuple()],
         rewards_vip = [] :: [tuple()],
         action_accept = [] :: [tuple()],
         action_commit = [] :: [tuple()],
         times = 1 :: non_neg_integer(),
         desc = "" :: list(),
         auto_accept = 0 :: 0..1,
         is_auto_finished_gain = 0 :: 0..1,
         weekdays = [] :: [pos_integer()],
         white_list = [] :: list(),
         black_list = [] :: list(),
         notice_msg = "" :: list(),
         val_from_prev = 0 :: 0..1,
         honor = 0 :: non_neg_integer(),
         ach_num = 0 :: non_neg_integer(),
         rewards_badge = 0 :: non_neg_integer(),
         day = 0 :: non_neg_integer(),
         extra = []}).

-record(quest_extra_data,
        {name = 0, classes = 0, val1 = 0, val2 = 0, list = []}).

-record(quest_classes,
        {quest_id = 0,
         first_time = 0,
         ring = 1,
         round = 0,
         total_count = 0,
         done_list = []}).

-record(quest_offer,
        {quest_id = 0,
         day_count = 0,
         leader_count = 0,
         leader_quest_count = 0,
         round = 0,
         total_count = 0,
         team_args = []}).

-record(quest_treasure,
        {quest_id = 0, round = 0, total_count = 0}).

-record(quest_guild,
        {quest_id = 0,
         last_accepted = 0,
         ring = 1,
         round = 0,
         total_count = 0,
         done_list = []}).

-record(quest_chain,
        {quest_id = 0,
         accept_time = 0,
         type = 0,
         ext_data = [],
         round = 0,
         total_count = 0,
         commit_npc}).

-record(quest_marriage,
        {quest_id = 0,
         type = 0,
         sec_type = 0,
         round = 0,
         total_count = 0,
         ext_data = quest_marriage:quest_ext_data()}).

-record(quest_couple,
        {quest_id = 0,
         type = 0,
         sec_type = 0,
         round = 0,
         total_count = 0,
         partner_id,
         ext_data = quest_couple:quest_ext_data()}).

-record(quest_prac,
        {part = 1, chapter = 2, section = 0}).

-record(quest_plant,
        {quest_id = 0,
         last_accepted = 0,
         last_commited = 0,
         round = 0,
         unit_id = 0,
         phase = 0,
         pos = {0, 0, 0},
         done_list = []}).

-record(quest_teacher,
        {quest_id = 0,
         type = 0,
         sec_type = 0,
         partner_id,
         round = 0,
         total_count = 0,
         stats = [],
         ext_data = quest_teacher:quest_ext_data()}).

-record(quest_shipping, {list = []}).

-record(quest_pursue,
        {quest_id = 0,
         last_accepted = 0,
         round_started = 0,
         ring = 1,
         round = 0,
         total_count = 0,
         done_list = []}).

-record(quest_child,
        {quest_id = 0,
         last_accepted = 0,
         last_commited = 0,
         round = 0,
         mode = 1,
         unit_id = 0,
         done_list = []}).

-record(quest_pregnancy,
        {quest_id = 0,
         last_accepted = 0,
         last_commited = 0,
         round = 0,
         mode = 1,
         done_list = []}).

-record(quest_acquaintance,
        {quest_id = 0,
         last_accepted = 0,
         last_commited = 0,
         round = 0,
         partner_id = 0,
         partner_name = "",
         done_list = [],
         ring = 0,
         rpc_accepted = 0}).

-record(quest_summer,
        {ver = 1,
         finish = [],
         doing = [],
         score = 0,
         rewarded = []}).

-record(quest_single_dog,
        {ver = 1, finish = [], round = 1, extra = #{}}).

-record(quest_sign_draw, {finish = [], doing = []}).

-record(quest_score_exchange,
        {finish = [], doing = []}).

-record(quest_long_active, {finish = [], doing = []}).

-record(m_quest,
        {ver = 19,
         quest = [] :: list(),
         acceptable = [] :: list(),
         finished = [] :: list(),
         day_finished = [],
         quest_classes = #quest_classes{} :: #quest_classes{},
         quest_offer = #quest_offer{} :: #quest_offer{},
         quest_prac = #quest_prac{} :: #quest_prac{},
         quest_treasure = #quest_treasure{},
         quest_guild = #quest_guild{},
         quest_chain = #quest_chain{},
         quest_marriage = #quest_marriage{},
         quest_couple = #quest_couple{},
         quest_plant = #quest_plant{},
         quest_teacher = #quest_teacher{},
         quest_shipping = #quest_shipping{},
         quest_pursue = #quest_pursue{},
         quest_line = 2,
         quest_child = #quest_child{},
         quest_pregnancy = #quest_pregnancy{},
         quest_acquaintance = #quest_acquaintance{},
         quest_king = #quest_king{},
         quest_summer = #quest_summer{},
         quest_single_dog = #quest_single_dog{},
         quest_sign_draw = #quest_sign_draw{},
         quest_score_exchange = #quest_score_exchange{},
         quest_long_active = #quest_long_active{}}).

-record(quest,
        {id = 1 :: pos_integer(),
         name = "" :: binary(),
         type = 1 :: pos_integer(),
         sec_type = 1 :: pos_integer(),
         finish = 0 :: 0..2,
         quality = 0 :: 0..4,
         progress = [] :: [tuple()],
         accept_time = 0 :: non_neg_integer(),
         end_time = 0 :: non_neg_integer(),
         finish_time = 0 :: non_neg_integer(),
         round = 0 :: non_neg_integer()}).

-record(quest_progress,
        {id = 0 :: non_neg_integer(),
         label :: undefined | atom(),
         target = 0 :: non_neg_integer(),
         param = [] :: list(),
         finish = 0 :: 0..1,
         trigger :: undefined | tuple(),
         target_val = 1 :: pos_integer(),
         value = 0 :: non_neg_integer(),
         msg = "" :: bitstring() | string(),
         ext_data = [] :: [tuple()],
         dyn_ext_data = [] :: [tuple()]}).

-record(quest_rewards,
        {prob = 1000 :: pos_integer(),
         classes = 0 :: 0..4,
         gain :: undefined | tuple(),
         action :: undefined | function()}).

-record(quest_stats,
        {sec_type = 1, stats = [], desc = []}).

-file("src/mod/quest/quest_prog_init.erl", 14).

-file("inc/pos.hrl", 1).

-record(pos_history,
        {map = 0 :: non_neg_integer(),
         platform = "" :: list(),
         zone_id = 0 :: non_neg_integer(),
         x = 0 :: non_neg_integer(),
         y = 0 :: non_neg_integer()}).

-record(pos,
        {map = 10001 :: non_neg_integer(),
         platform = "" :: list(),
         zone_id = 0 :: non_neg_integer(),
         last :: undefined | #pos_history{},
         map_base_id = 0 :: non_neg_integer(),
         map_pid = 0 :: non_neg_integer() | pid(),
         map_grid_pid = 0 :: non_neg_integer() | pid(),
         hidden = 1 :: 0 | 1,
         x = 0 :: non_neg_integer(),
         y = 0 :: non_neg_integer(),
         dir = 0 :: 0..255}).

-file("src/mod/quest/quest_prog_init.erl", 15).

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

-file("src/mod/quest/quest_prog_init.erl", 16).

-file("inc/package.hrl", 1).

-record(package,
        {type = 1 :: integer(),
         next_id = 1 :: pos_integer(),
         volume = 0 :: non_neg_integer(),
         free_cell = [] :: list(),
         items = [] :: [tuple()]}).

-file("src/mod/quest/quest_prog_init.erl", 17).

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

-file("src/mod/quest/quest_prog_init.erl", 18).

-file("inc/plot.hrl", 1).

-record(m_plot,
        {ver = 1 :: pos_integer(),
         plot_quest_ver = 1 :: pos_integer(),
         finished = [] :: [pos_integer()],
         play_list = [] :: [pos_integer()],
         do_list = [] :: [tuple()],
         combat_list = [] :: [tuple()],
         fun_icons = [] :: [pos_integer()],
         unit_list = [] :: [tuple()],
         map_list = [] :: [pos_integer()],
         guide_list = [] :: [pos_integer()],
         dun_id = 0 :: non_neg_integer(),
         hide_mode = 0 :: non_neg_integer(),
         scene = [] :: list(),
         dungeon = [] :: list(),
         quest_trace = 0 :: non_neg_integer()}).

-record(plot,
        {id :: undefined | non_neg_integer(),
         num = 0 :: non_neg_integer(),
         act_idx = 0 :: non_neg_integer()}).

-record(plot_trigger,
        {id = 0 :: non_neg_integer(),
         name = "" :: list(),
         lev = 0 :: non_neg_integer(),
         status = 1 :: 0 | 1,
         type = 1 :: 1 | 2,
         off_line = 0 :: 0..2,
         can_skip = 1 :: 0..1,
         hide_layer = 1 :: 0..1,
         res_list = [] :: [bitstring()],
         maps = [] :: [pos_integer()],
         num = 1 :: non_neg_integer(),
         event = [] :: [tuple()],
         vars = [] :: [tuple()],
         cond_logic = 'and' :: atom(),
         condition = [] :: [tuple()],
         action = [] :: [tuple()],
         lev_break_min_times = 0,
         lev_break_max_times = 1}).

-record(plot_act,
        {id = 0 :: non_neg_integer(),
         type = 0 :: non_neg_integer(),
         label :: undefined | atom(),
         time = 0 :: non_neg_integer(),
         mode = 0 :: non_neg_integer(),
         unit_id = 0 :: non_neg_integer(),
         unit_base_id = 0 :: non_neg_integer(),
         looks = [] :: list(),
         ext_info = [] :: [{pos_integer(), bitstring()}],
         battle_id = 0 :: non_neg_integer(),
         mapid = 0 :: non_neg_integer(),
         x = 0 :: non_neg_integer(),
         y = 0 :: non_neg_integer(),
         val = 0 :: non_neg_integer(),
         ext_val = 0 :: non_neg_integer(),
         res_id = 0 :: non_neg_integer(),
         color = "" :: bitstring(),
         msg = "" :: bitstring(),
         ext_msg = "" :: bitstring(),
         gain = [] :: [{pos_integer(), pos_integer()}],
         need_next = 0 :: 0..1,
         timeout = 0 :: non_neg_integer(),
         skip_do = 0 :: 0..1,
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer()}).

-record(plot_quest_revise_data,
        {ver = 0 :: non_neg_integer(),
         min_lev = 0 :: non_neg_integer(),
         max_lev = 0 :: non_neg_integer(),
         min_exp = 0 :: non_neg_integer(),
         pos :: undefined | tuple(),
         finish_quests = [] :: [pos_integer()],
         finish_reward_quests = [] :: [pos_integer()],
         finish_plots = [] :: [pos_integer()],
         open_plots = [] :: [pos_integer()],
         open_sys_list = [] :: [pos_integer()],
         open_map_list = [] :: [pos_integer()],
         skill_list = [] :: [pos_integer()],
         reward_list = [] :: list()}).

-record(plot_quest_unit,
        {label,
         id = 0,
         base_id = 0,
         pos,
         dir,
         act_type,
         is_rand_pos = 0}).

-file("src/mod/quest/quest_prog_init.erl", 19).

-file("inc/skill.hrl", 1).

-record(m_skill,
        {ver = 6 :: pos_integer(),
         skills = [] :: [{non_neg_integer(), non_neg_integer()}],
         is_open_skl_prac = 0 :: 0 | 1,
         selected_skl_prac = 0 :: non_neg_integer(),
         skill_prac = [] :: list(),
         skill_couple = [] :: list(),
         skill_sworn = [] :: list(),
         speed = [] :: list(),
         skill_unique = [],
         skill_clsld_done = [],
         unique_coolddown_time = 0,
         skl_unique_point = 100,
         sq_double = 0,
         is_open_sq_double = 0,
         sq_exp_statistics = []}).

-record(role_base_skill,
        {id = 0,
         lev = 0,
         type :: undefined | non_neg_integer(),
         sub_type :: undefined | non_neg_integer(),
         max_lev = 0,
         name = "",
         way = 1,
         study_lev = 1,
         cost = [],
         attr = []}).

-record(skill,
        {id = 0,
         lev = 0,
         type = 0 :: non_neg_integer(),
         sub_type = 0 :: non_neg_integer(),
         speed = 1,
         name = "",
         acc_ratio = 1000,
         acc_low = 0,
         acc_high = 1000,
         attack_type = 0 :: non_neg_integer(),
         elem_type = 0 :: non_neg_integer(),
         target_type = 1 :: non_neg_integer(),
         attack_times = 1 :: non_neg_integer(),
         target_list = [],
         self_cond = [],
         self_loss = [],
         target_cond = [],
         dmg_addt = 0 :: non_neg_integer(),
         dmg_ratio = [1000] :: non_neg_integer(),
         pre_cooldown = 0,
         cooldown = 0 :: non_neg_integer(),
         cost_mp = 0 :: non_neg_integer(),
         cost_anger = 0,
         cost_other = [] :: [{atom(), non_neg_integer()}],
         buff_self = [] :: [tuple()],
         buff_target = [] :: [tuple()],
         script_id = 0 :: non_neg_integer(),
         script_args = [] :: [integer()],
         addt_scripts = [] ::
             [{non_neg_integer(), non_neg_integer(), list()}],
         play_time = 0 :: non_neg_integer()}).

-record(chief_classes,
        {leader_id = 0,
         classes = 0,
         name = "",
         sex = 0,
         lev = 0,
         looks = []}).

-record(sq_exp_statistics,
        {combat_type = 0, times = 0, gain = 0, real_gain = 0}).

-file("src/mod/quest/quest_prog_init.erl", 20).

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

-file("src/mod/quest/quest_prog_init.erl", 21).

-file("inc/guild.hrl", 1).

-type guild_id() :: {non_neg_integer(),
                     list(),
                     non_neg_integer()}.

-record(guild_apply,
        {id = {0, "", 0},
         name = "",
         classes = 0,
         sex = 0,
         lev = 1,
         time = 0,
         type = 0,
         looks = [],
         cup = 0 :: non_neg_integer(),
         donation = 0 :: non_neg_integer(),
         tag = 0 :: non_neg_integer(),
         msg = "" :: string()}).

-record(guild_envelop,
        {ver = 1,
         title = "" :: string(),
         amount = 0 :: non_neg_integer(),
         remain = 0 :: non_neg_integer(),
         total = 0 :: non_neg_integer(),
         num = 0 :: non_neg_integer(),
         time = 0 :: non_neg_integer(),
         packs = [],
         log = [] :: list()}).

-record(guild_role,
        {id = {1, "", 0} ::
             {pos_integer(), list(), non_neg_integer()},
         pid :: undefined | pid(),
         name = "" :: list(),
         sex = 0 :: 0 | 1,
         classes = 0 :: 0..4,
         lev = 1 :: pos_integer(),
         lev_break_times = 0 :: non_neg_integer(),
         fc = 1 :: pos_integer(),
         synth_fc = 1 :: pos_integer(),
         post = 0 :: 0..5,
         status = 0 :: 0 | 1,
         last_login = 1 :: pos_integer(),
         last_logout = 1 :: pos_integer(),
         enter_time = 0 :: non_neg_integer(),
         signature = "" :: list(),
         value = 0,
         total_value = 0 :: non_neg_integer(),
         cup = 0 :: non_neg_integer(),
         looks = [],
         envelope = #guild_envelop{},
         requirement = [],
         signed = 0 :: non_neg_integer(),
         last_signed = 0 :: non_neg_integer(),
         mails = [],
         active = 0,
         ability = 0,
         chat_num = 0,
         doing = 0,
         chat_num_list = [],
         doing_list = [],
         element_attr = [] :: list(),
         tmp_element_attr = [] :: list()}).

-record(guild_leaver,
        {id = {1, "", 0} ::
             {pos_integer(), list(), non_neg_integer()},
         name = "" :: list(),
         guild_id = {1, "", 0} ::
             {pos_integer(), list(), non_neg_integer()},
         value = 0,
         total_value = 0 :: non_neg_integer(),
         time = 0 :: integer()}).

-record(guild_boss,
        {lev = 1 :: non_neg_integer(),
         step = 1 :: non_neg_integer(),
         unit_id = 0 :: non_neg_integer(),
         name = "",
         hp = 0 :: non_neg_integer(),
         hp_max = 0 :: non_neg_integer(),
         exp = 0 :: non_neg_integer(),
         called = 0 :: integer(),
         log = [] :: list(),
         last_renamed = 0 :: non_neg_integer()}).

-record(guild_mercenary,
        {id = {0, "", 0},
         key :: undefined | tuple(),
         lev = 0 :: non_neg_integer(),
         name = "" :: string(),
         dispatched = 0 :: non_neg_integer(),
         recruited = 0 :: non_neg_integer(),
         score = 0 :: non_neg_integer(),
         gain = [],
         guard :: undefined | tuple()}).

-record(guild_totem,
        {ver = 0 :: non_neg_integer(),
         id = util:rand_list([101, 102, 103, 104, 105]) ::
             non_neg_integer(),
         changeable = 1 :: non_neg_integer(),
         last_changed = 0 :: non_neg_integer()}).

-record(guild_question_answer,
        {ver = 0,
         id = {0, "", 0},
         name = "" :: string(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         guild_name = "" :: string(),
         option = 0 :: 0..4,
         result = 0 :: 0 | 1,
         score = 0 :: non_neg_integer(),
         answered = 0 :: non_neg_integer(),
         totem_id = 0 :: non_neg_integer(),
         rank = 0 :: non_neg_integer()}).

-record(guild_question,
        {ver = 0,
         id = 0 :: non_neg_integer(),
         answer = 0 :: 0..4,
         asked = 0 :: non_neg_integer(),
         answers = [] :: [#guild_question_answer{}],
         cheat_off = [],
         asked_num = 0 :: non_neg_integer(),
         cheat_nums = []}).

-record(guild_robber,
        {ver = 0 :: non_neg_integer(),
         id :: undefined | tuple(),
         today_generated = 0 :: non_neg_integer(),
         gen_hour = 0 :: non_neg_integer(),
         gen_time = 0 :: non_neg_integer(),
         total_killed = 0 :: non_neg_integer(),
         last_killed = 0 :: non_neg_integer(),
         killed_time = 0 :: non_neg_integer(),
         fighters = [],
         picker = []}).

-record(guild_treasure,
        {ver = 1 :: non_neg_integer(),
         added = 0 :: non_neg_integer(),
         setting_chance = 0 :: non_neg_integer(),
         setting_time = 0 :: non_neg_integer(),
         gen_time = 0 :: non_neg_integer(),
         generated = 0 :: non_neg_integer(),
         unit_num = 0 :: non_neg_integer(),
         total_killed = 0 :: non_neg_integer(),
         last_killed = 0 :: non_neg_integer(),
         killed_time = 0 :: non_neg_integer(),
         can_open = 0 :: 0,
         fighters = [],
         picker = [],
         type = win}).

-record(guild_loot,
        {ver = 0, items = [], log = [], allocated = []}).

-record(guild_usurper,
        {ver = 0,
         id :: undefined | tuple(),
         name = "" :: string(),
         classes = 0,
         sex = 0,
         ctime = 0 :: integer()}).

-record(guild_invitation,
        {ver = 0,
         id :: undefined | tuple(),
         name = "" :: string(),
         classes = 0,
         sex = 0,
         lev = 0,
         ctime = 0 :: integer(),
         guild_id :: undefined | tuple(),
         guild_name = "" :: string()}).

-record(guild_plant_irrigator,
        {id = {0, "", 0} :: tuple(),
         name = "" :: string(),
         classes = 0,
         sex = 0,
         ctime = 0 :: integer()}).

-record(guild_plant,
        {ver = 0,
         pos = {0, 0},
         owner_rid = {0, "", 0},
         owner_name = "",
         irrigations = [],
         phase = 0,
         sowed = 0,
         matured = 0,
         fired = 0 :: 0 | 1,
         unit_id = {0, 0},
         unit_base_id = 0}).

-record(guild_union_apply,
        {ver = 0,
         id = {0, "", 0},
         name = "" :: string(),
         leader_id = {0, "", 0},
         leader_name = "" :: string(),
         ctime = 0 :: integer()}).

-record(guild_campaign,
        {acc = [] :: list(),
         can_reward = [] :: list(),
         rewarded = [] :: list()}).

-record(guild_camp_web,
        {acc = [] :: list(),
         can_reward = [] :: list(),
         rewarded = [] :: list(),
         overdue_time = 0 :: non_neg_integer(),
         end_reward = [] :: list(),
         time_list = [] :: list()}).

-record(element_info,
        {ver = 1, build_type = 0, lev = 1, time = 0}).

-record(guild,
        {id = {0, "", 0} ::
             {non_neg_integer(), list(), non_neg_integer()},
         ver = 21 :: non_neg_integer(),
         name = "" :: list(),
         assets = 5000000,
         max_assets = 5000000,
         upkeep = 0,
         pid :: undefined | pid(),
         leader_name = "" :: list(),
         leader_id = {0, "", 0} ::
             {non_neg_integer(), list(), non_neg_integer()},
         leader_sex = 0 :: 0 | 1,
         leader_classes = 0 :: 0..6,
         leader_lev = 0 :: non_neg_integer(),
         members = [] :: [#guild_role{}],
         mem_num = 0 :: non_neg_integer(),
         fresh_num = 0 :: non_neg_integer(),
         max_mem_num = 90,
         max_fresh_num = 100,
         board = "" :: list(),
         health = 100,
         join_type = 2,
         join_condition = [],
         apply_list = [],
         event_list = [],
         lev = 1 :: pos_integer(),
         lev_time = 0 :: non_neg_integer(),
         academy_lev = 0 :: non_neg_integer(),
         academy_time = 0 :: non_neg_integer(),
         store_lev = 0 :: non_neg_integer(),
         store_time = 0 :: non_neg_integer(),
         exchequer_lev = 0 :: non_neg_integer(),
         exchequer_time = 0 :: non_neg_integer(),
         lev_ref :: undefined | reference(),
         welfare_time = 0,
         welfare_list = [],
         store_tick_time = 0,
         store_list = [],
         create_time = 0,
         flag = 0,
         map_pid = 0,
         map_id = 0,
         boss = #guild_boss{},
         mercenarys = [] :: [#guild_mercenary{}],
         totem = #guild_totem{} :: #guild_totem{},
         question = #guild_question{},
         robber_num = 0 :: non_neg_integer(),
         robber_total_num = 0 :: non_neg_integer(),
         usurpers = [],
         activity = 0,
         plants = [],
         announcement = "" :: string(),
         union_applys = [] :: list(),
         union_applied = [] :: list(),
         today_used_medal = 0 :: integer(),
         last_medal_used = 0 :: integer(),
         today_upgraded_build = 0 :: integer(),
         last_build_upgraded = 0 :: integer(),
         today_destory_build = 0 :: integer(),
         last_build_destory = 0 :: integer(),
         treasure = #guild_treasure{},
         loot = #guild_loot{},
         week_assets = 0 :: integer(),
         formalizing_lev = 35 :: integer(),
         name_used = "" :: string(),
         create_id = {0, "", 0},
         create_name = "",
         guild_camp = #guild_campaign{},
         guild_camp_web = #guild_camp_web{},
         max_chat_num = 0,
         max_doing = 0,
         max_fc = 0,
         max_synth_fc = 0,
         element_info = [],
         uplev_element_times = 0,
         last_uplev_element = 0,
         upgrade_element_time = 0,
         mail_list = [],
         limit_mode = 0,
         is_lock_board = 0,
         board_id = {0, "", 0},
         announce_id = {0, "", 0}}).

-record(guild_element_attr,
        {ver = 1,
         effect_obj = 1,
         attr = [],
         attr_snd = [],
         add_skill_list = [],
         high_attr = [],
         end_time = 0}).

-record(m_guild,
        {ver = 3 :: pos_integer(),
         id = {0, "", 0} ::
             {non_neg_integer(), list(), non_neg_integer()},
         name = "" :: list(),
         pid :: undefined | pid(),
         enter_time = 0,
         guild_lev = 1,
         post = 0 :: non_neg_integer(),
         value = 0,
         total_value = 0 :: non_neg_integer(),
         signature = "" :: list(),
         element_attr = [] :: list(),
         tmp_element_attr = [] :: list(),
         build_speed_num = 0 :: non_neg_integer()}).

-record(guild_emblem,
        {ver = 0, id = 0, type = 0, lev = 0}).

-record(m_guild_emblem,
        {ver = 0 :: non_neg_integer(),
         remain_point = 0 :: non_neg_integer(),
         total_point = 0 :: non_neg_integer(),
         emblems = []}).

-file("src/mod/quest/quest_prog_init.erl", 22).

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

-file("src/mod/quest/quest_prog_init.erl", 23).

-file("inc/pet.hrl", 1).

-record(pet_attr,
        {point = 0,
         p_str = 0,
         p_con = 0,
         p_mag = 0,
         p_agi = 0,
         p_end = 0,
         pre_str = 0,
         pre_con = 0,
         pre_mag = 0,
         pre_agi = 0,
         pre_end = 0,
         max_hp_apt_used = 0,
         max_phy_apt_used = 0,
         max_pdef_apt_used = 0,
         max_magic_apt_used = 0,
         max_aspd_apt_used = 0,
         hp_aptitude = 0,
         phy_aptitude = 0,
         pdef_aptitude = 0,
         magic_aptitude = 0,
         aspd_aptitude = 0,
         max_hp_aptitude = 0,
         max_phy_aptitude = 0,
         max_pdef_aptitude = 0,
         max_magic_aptitude = 0,
         max_aspd_aptitude = 0}).

-record(pet_tmp_aptitude,
        {is_valid = 0,
         tmp_genre = 0,
         tmp_pet_attr = #pet_attr{} :: #pet_attr{},
         tmp_skills = [],
         tmp_growth = 0,
         tmp_growth_type = 0,
         tmp_happy = 0,
         talent = 0}).

-record(pet_base,
        {id = 0,
         name = "",
         type = 1,
         genre = 0,
         hp_aptitude = 0,
         phy_aptitude = 0,
         pdef_aptitude = 0,
         magic_aptitude = 0,
         aspd_aptitude = 0,
         need_lev_break = 0,
         base_skills = [],
         vari_skills = [],
         lev_break_skills = [],
         has_break_skill = 0,
         base_happy = 1000,
         min_happy_ratio = 800,
         max_happy_ratio = 1050,
         min_happy_genre_ratio = 1000,
         max_happy_genre_ratio = 1100,
         growth_blue = 0,
         growth_purple = 0,
         growth_orange = 0,
         growth_red = 0,
         model_id = 0,
         model_id1 = 0,
         model_id2 = 0,
         model_id3 = 0,
         skin_id_0 = 0,
         skin_id_1 = 0,
         skin_id_2 = 0,
         skin_id_3 = 0,
         skin_id_s0 = 0,
         skin_id_s1 = 0,
         skin_id_s2 = 0,
         skin_id_s3 = 0,
         cost = [],
         lev_break_cost = [],
         max_wash_time = 0,
         manual_level = 0}).

-record(pet_base_skill,
        {id = 0,
         name = "",
         type = 0,
         step = 0,
         lev = 0,
         max_exp = 0,
         attr = []}).

-record(pet_skill,
        {id = 0,
         lev = 1,
         exp = 1,
         step = 0,
         type = 0,
         source = 1,
         is_lock = 0,
         is_last_study = 0}).

-record(pet_skin,
        {use_skin = 0,
         has_skin = [],
         add_hp_aptitude = 0,
         add_phy_aptitude = 0,
         add_pdef_aptitude = 0,
         add_magic_aptitude = 0,
         add_aspd_aptitude = 0,
         add_growth = 0}).

-record(pet,
        {ver = 32 :: pos_integer(),
         id = 1 :: pos_integer(),
         type = 1 :: pos_integer(),
         name = "" :: bitstring(),
         lev = 1 :: pos_integer(),
         talent = 0,
         growth = 0,
         growth_type = 2,
         use_growth = 0,
         genre = 0,
         exp = 0 :: non_neg_integer(),
         max_exp = 1 :: pos_integer(),
         status = 0 :: 0 | 1,
         base_id :: undefined | pos_integer(),
         attr :: undefined | tuple(),
         hp = 1,
         mp = 1,
         hp_max = 1,
         mp_max = 1,
         pet_attr = #pet_attr{} :: #pet_attr{},
         happy = 0 :: non_neg_integer(),
         looks = [] :: list(),
         skills = [],
         comprehend_lev = 1,
         grade = 0,
         grade_attr = [],
         stones = [],
         feed_item = [],
         feed_point = 0,
         free_reset_flag = 0,
         combat_talk = [],
         lock = 0,
         wash_time = 0,
         ai_skillid = 0,
         mount_skills = [],
         break_times = 0,
         is_first = 0,
         handbook_attr = [],
         handbook_num = 0,
         star_handbook_num = 0,
         pet_tmp_aptitude = #pet_tmp_aptitude{},
         glue_pudding_used = 0,
         pet_skin = #pet_skin{},
         spirit_attached = 0 :: 0 | 1,
         spirit_attached_id = 0 :: non_neg_integer(),
         spirit_skills = [],
         spirit_info = [],
         unreal = [],
         spirit_child_flag = 0 :: 0 | 1,
         spirit_child_id = {0, "", 0} :: tuple(),
         unreal_looks_flag = 0 :: 0 | 1,
         pet_rune = []}).

-record(m_pet,
        {ver = 2 :: pos_integer(),
         fresh_id = 1,
         next_id = 1 :: pos_integer(),
         pets = [] :: list(),
         rename = 3 :: non_neg_integer(),
         pet_nums = 5,
         time = 0}).

-record(m_pet_store,
        {ver = 1 :: pos_integer(),
         next_id = 1 :: pos_integer(),
         pets = [] :: list(),
         pet_nums = 4}).

-record(pet_goods,
        {base_id :: undefined | pos_integer(),
         actv_lev :: undefined | pos_integer(),
         stock :: undefined | pos_integer()}).

-record(pet_shop_data,
        {base_id :: undefined | pos_integer(),
         name :: undefined | binary(),
         actv_lev :: undefined | pos_integer(),
         def_buy_price :: undefined | pos_integer(),
         stock :: undefined | pos_integer()}).

-record(pet_exchange_data,
        {base_id = 0,
         item_id = 0,
         item_num = 0,
         exchange_item_num = 0,
         genre = 0,
         talent = 0}).

-record(pet_stone_polish_data,
        {stone_id = 0,
         attr = [],
         attr_name = 0,
         val_list = [],
         skill_list = []}).

-record(pet_unreal, {item_id = 0, timeout = 0}).

-record(pet_unreal_data,
        {item_id = 0,
         attr = [],
         skills = [],
         model_id = 0,
         skin_id = 0}).

-record(pet_rune,
        {rune_index = 0,
         rune_type = 0,
         rune_status = 0,
         rune_id = 0,
         rune_lev = 0,
         is_resonance = 0,
         resonances = []}).

-record(pet_resonance,
        {resonance_index = 0,
         resonance_id = 0,
         rune_index = 0}).

-file("src/mod/quest/quest_prog_init.erl", 24).

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

-file("src/mod/quest/quest_prog_init.erl", 25).

-file("inc/skill_life.hrl", 1).

-record(m_skill_life, {ver = 2, skills = []}).

-record(skill_life, {id = 0, lev = 0, exp = 0}).

-file("src/mod/quest/quest_prog_init.erl", 26).

-file("inc/quest_offer.hrl", 1).

-type offer_notice() :: integer().

-record(quest_offer_ratio_data,
        {exp_ratio = 0, coin_ratio = 0, leader_ratio = 0}).

-record(quest_offer_calc_ratio,
        {count_exp = 0,
         count_coin = 0,
         count_leader = 0,
         lev_exp = 0,
         lev_coin = 0,
         pet_lev_exp = 0,
         name = ""}).

-record(quest_offer_reward_ratio,
        {exp = 0,
         coin = 0,
         pet_exp = 0,
         double_point = 1,
         ring_20_double = 1}).

-record(quest_offer_team_args,
        {round = 0,
         avg_lev = 1,
         member_num = 0,
         double_point = 0}).

-file("src/mod/quest/quest_prog_init.erl", 27).

-file("inc/friend.hrl", 1).

-record(friendship,
        {owner = {1, "", 0} ::
             {pos_integer(), string(), non_neg_integer()},
         id = {1, "", 0} ::
             {pos_integer(), string(), non_neg_integer()},
         type = 0 :: non_neg_integer(),
         intimacy = 0 :: non_neg_integer(),
         ct = 0 :: non_neg_integer()}).

-record(friend_role,
        {id = {1, "", 0} ::
             {pos_integer(), string(), non_neg_integer()},
         ver = 6,
         name = "" :: string(),
         sex = 1 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         lev = 1 :: non_neg_integer(),
         break_times = 0,
         fc = 0 :: non_neg_integer(),
         face = 1 :: pos_integer(),
         intimacy = 0 :: non_neg_integer(),
         glamor = 0 :: non_neg_integer(),
         signature = "" :: string(),
         city = "" :: string(),
         online = 0 :: 0 | 1,
         online_time = 0 :: non_neg_integer(),
         total_fc = 0 :: non_neg_integer(),
         guild = "" :: string(),
         qualifying,
         arena,
         pet,
         guard,
         skill_prac = 0,
         achievement = 0,
         received_num = 0,
         given_num = 0,
         update_time = 0,
         looks = [] :: list(),
         offline_push = 0,
         glory_max_id = 0,
         glory_time = 0}).

-record(friend_request,
        {owner = {1, "", 0} ::
             {pos_integer(), string(), non_neg_integer()},
         id = {1, "", 0} ::
             {pos_integer(), string(), non_neg_integer()},
         name = "" :: string(),
         sex = 1 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         lev = 1 :: non_neg_integer(),
         fc = 0 :: non_neg_integer(),
         total_fc = 0 :: non_neg_integer(),
         face = 1 :: pos_integer(),
         ct = 0 :: non_neg_integer()}).

-record(friend_present,
        {ver = 0,
         giver = {0, "", 0},
         recipient = {0, "", 0},
         time = 0 :: integer(),
         num = 0 :: integer()}).

-record(m_friend,
        {ver = 2,
         signature = "星辰奇缘真好玩！" :: string(),
         num = 0 :: non_neg_integer(),
         fans = 0 :: non_neg_integer(),
         log_next_id = 1 :: pos_integer(),
         flower = 0 :: non_neg_integer(),
         intimacy = 0 :: non_neg_integer(),
         glamor = 0 :: non_neg_integer(),
         city = "" :: string(),
         set_num = 0 :: non_neg_integer(),
         cond_city = 1 :: 0..1,
         cond_sex = 1 :: 0..1,
         cond_fc = 1 :: 0..1,
         received_presents = [] :: [],
         given_presents = [] :: [],
         received_num = 0 :: non_neg_integer(),
         given_num = 0 :: non_neg_integer(),
         popularity_rewarded = [] :: list(),
         offline_push = 0}).

-record(friend_zone,
        {ver = 14 :: non_neg_integer(),
         id = {1, "", 0} ::
             {pos_integer(), string(), non_neg_integer()},
         name = "" :: string(),
         sex = 1 :: non_neg_integer(),
         classes = 1 :: non_neg_integer(),
         lev = 1 :: non_neg_integer(),
         photo = [] :: non_neg_integer(),
         birth = "" :: non_neg_integer(),
         constellation = 0 :: non_neg_integer(),
         abo = 0 :: non_neg_integer(),
         signature = "" :: string(),
         spouse_id = {0, "", 0} :: tuple(),
         spouse_name = "" :: string(),
         region = "" :: string(),
         online_time = 0 :: non_neg_integer(),
         guild = "" :: string(),
         subscribed = [],
         fans = [],
         visitors = [],
         visited = 0 :: non_neg_integer(),
         tags = [],
         liked = 0 :: non_neg_integer(),
         likes = [],
         privacy = 0 :: 0 | 1,
         prize_num = 0 :: non_neg_integer(),
         own_trends = [] :: [non_neg_integer()],
         subscribed_trends = [] :: [non_neg_integer()],
         photo_auditing = 0 :: non_neg_integer(),
         photo_audited = 0 :: non_neg_integer(),
         present_num = 0 :: non_neg_integer(),
         name_used = "" :: string(),
         week_liked = 0 :: non_neg_integer(),
         last_liked = 0 :: non_neg_integer(),
         honor_id = 0 :: non_neg_integer(),
         lover_name = "" :: string(),
         theme = 401 :: non_neg_integer(),
         badges = [] :: list(),
         photo_frame = 0 :: non_neg_integer(),
         teacher_name = "" :: string(),
         own_trend_num = 0,
         city = "" :: string(),
         is_shared_region = 1 :: 0 | 1,
         sworn_name = "" :: string(),
         show_honor = 0 :: non_neg_integer(),
         pre_honor_id = 0 :: non_neg_integer(),
         privacy_zone = 0 :: 0 | 1,
         privacy_moments = 0 :: 0 | 1}).

-record(friend_trend,
        {ver = 0 :: non_neg_integer(),
         zone_id = {0, "", 0},
         rid = {0, "", 0},
         name = "" :: string(),
         sex = 1 :: non_neg_integer(),
         classes = 1 :: non_neg_integer(),
         photo = 1 :: pos_integer(),
         id = 0 :: non_neg_integer(),
         type = 0 :: 0 | 1,
         content = "" :: string(),
         liked = 0 :: non_neg_integer(),
         likes = [],
         presents = [],
         ctime = 0 :: non_neg_integer()}).

-record(friend_visitor,
        {id = {0, "", 0},
         ver = 0,
         name = "" :: string(),
         sex = 0 :: 0 | 1,
         classes = 0 :: non_neg_integer(),
         photo = 0 :: non_neg_integer(),
         time = 0 :: non_neg_integer()}).

-record(friend_subscription,
        {id = {0, "", 0},
         ver = 0,
         name = "" :: string(),
         sex = 0 :: 0 | 1,
         classes = 0 :: non_neg_integer(),
         photo = 0 :: non_neg_integer(),
         time = 0 :: non_neg_integer(),
         cared = 0 :: non_neg_integer(),
         interacted = 0 :: non_neg_integer()}).

-record(friend_zone_rank,
        {id = {0, "", 0},
         ver = 0,
         name = "" :: string(),
         sex = 0 :: 0 | 1,
         classes = 0 :: non_neg_integer(),
         photo = 0 :: non_neg_integer(),
         liked = 0 :: non_neg_integer(),
         prize_num = 0 :: non_neg_integer()}).

-record(friend_zone_rank_week,
        {id = {0, "", 0},
         ver = 0,
         name = "" :: string(),
         sex = 0 :: 0 | 1,
         classes = 0 :: non_neg_integer(),
         photo = 0 :: non_neg_integer(),
         liked = 0 :: non_neg_integer(),
         last_liked = 0 :: non_neg_integer(),
         prize_num = 0 :: non_neg_integer()}).

-record(friend_like,
        {id = {0, "", 0},
         ver = 0,
         name = "" :: string(),
         sex = 0 :: 0 | 1,
         classes = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         got_prize = 0 :: 0 | 1,
         time = 0 :: non_neg_integer()}).

-record(friend_zone_photo,
        {id = 1,
         ver = 0,
         uploaded = 0,
         auditing = 0,
         audited = 0,
         default = 0}).

-record(friend_circle,
        {ver = 3 :: non_neg_integer(),
         id = {1, "", 0} ::
             {pos_integer(), string(), non_neg_integer()},
         name = "" :: string(),
         sex = 1 :: non_neg_integer(),
         classes = 1 :: non_neg_integer(),
         lev = 1 :: non_neg_integer(),
         region = "" :: string(),
         city = "" :: string(),
         moments = [] :: list(),
         subscriptions = [] :: list(),
         block = [] :: list(),
         unsubscribed = [] :: list(),
         notifications = [] :: list(),
         is_shared_region = 1 :: 0 | 1,
         unread_num = 0 :: non_neg_integer(),
         privacy_moments = 0 :: 0 | 1}).

-record(friend_moment,
        {ver = 1 :: non_neg_integer(),
         id = {0, "", 0},
         rid = {0, "", 0},
         name = "" :: string(),
         sex = 1 :: non_neg_integer(),
         classes = 1 :: non_neg_integer(),
         content = "" :: string(),
         liked = 0 :: non_neg_integer(),
         likes = [],
         mentions = [],
         ctime = 0 :: non_neg_integer(),
         type = 1}).

-record(friend_comment,
        {ver = 0 :: non_neg_integer(),
         id = {0, "", 0},
         moment_id = {0, "", 0},
         rid = {0, "", 0},
         name = "" :: string(),
         sex = 1 :: non_neg_integer(),
         classes = 1 :: non_neg_integer(),
         msg = "" :: string(),
         mentions = [],
         ctime = 0 :: non_neg_integer()}).

-record(friend_moment_like,
        {ver = 0 :: non_neg_integer(),
         moment_id = {0, "", 0},
         rid = {0, "", 0},
         name = "" :: string(),
         sex = 1 :: non_neg_integer(),
         classes = 1 :: non_neg_integer(),
         ctime = 0 :: non_neg_integer()}).

-record(friend_moment_photo,
        {id = 1,
         moment_id = {0, "", 0},
         rid = {0, "", 0},
         ver = 0,
         uploaded = 0,
         auditing = 1,
         audited = 0}).

-record(friend_circle_report,
        {id = {{0, "", 0}, 0, 0},
         rid = {0, "", 0},
         moment_id = {0, "", 0},
         spec_id = 0,
         type = 0,
         name = "",
         lev = 1,
         time = 0,
         content = "",
         reporter_id = {0, "", 0},
         reporter_name = "",
         reporter_lev = 0}).

-record(friend_circle_region,
        {ver = 0 :: non_neg_integer(),
         region = "" :: string(),
         city = "" :: string(),
         moments = [] :: list()}).

-record(friend_recall,
        {role_id = {0, "", 0},
         role_name = "",
         id = 0 :: non_neg_integer(),
         activity = 0 :: non_neg_integer(),
         status = 0 :: non_neg_integer(),
         role_id_bind = {0, "", 0},
         role_name_bind = "",
         lists = [] :: list(),
         rewards = [] :: list(),
         lists_time = [] :: list(),
         time_return = 0 :: non_neg_integer()}).

-record(friend_recalled,
        {role_id = {0, "", 0},
         status = 0 :: non_neg_integer(),
         bind = 0 :: non_neg_integer(),
         time_return = 0 :: non_neg_integer(),
         time = 0 :: non_neg_integer(),
         activity = 0 :: non_neg_integer(),
         rewards = [] :: list(),
         lists = [] :: list(),
         recall_list = [] :: list(),
         role_id_recall = {0, "", 0},
         role_name_recall = "" :: string(),
         login = 0 :: non_neg_integer(),
         activity_id = 0 :: non_neg_integer()}).

-record(friend_group,
        {ver = 0,
         id = {0, "", 0},
         name = "",
         content = "",
         owner_id = {0, "", 0},
         owner_name = "",
         owner_classes = 0,
         owner_sex = 0,
         owner_lev = 1,
         owner_fc = 0,
         owner_face = 1,
         time = 0,
         members = [],
         trends = [],
         historys = [],
         invites = []}).

-record(friend_group_role,
        {ver = 1,
         id = {0, "", 0},
         groups = [],
         inviteds = [],
         create = 0,
         join = 0,
         unlock = 0,
         applys = []}).

-record(friend_group_trend,
        {type = 0, string1 = "", string2 = "", time = 0}).

-record(friend_group_chat,
        {role_id = 0, msgs = "", time = 0}).

-record(friend_group_data,
        {group_id = {0, "", 0},
         group_name = "",
         group_content = "",
         owner_id = {0, "", 0},
         owner_name = "",
         owner_classes = 0,
         owner_sex = 0,
         time = 0}).

-record(friend_group_role_data,
        {role_id = {0, "", 0},
         role_name = "",
         role_classes = 0,
         role_lev = 0,
         role_sex = 0,
         online = 0,
         online_time = 0,
         post = 0,
         notice = 1,
         pid = undefined}).

-record(friend_moment_wish_audit,
        {ver = 1,
         moment_id = {0, "", 0},
         role_id = {0, "", 0},
         audit_time = 0,
         reward_title = 0,
         camp_id = 0}).

-file("src/mod/quest/quest_prog_init.erl", 28).

-file("inc/glory.hrl", 1).

-record(m_glory,
        {ver = 2,
         id = 0,
         title_id = 0,
         end_time = 0,
         new_id = 0,
         new_title_id = 0,
         switch_time = 0,
         max_id = 0,
         mtime = 0,
         reset_time = 0,
         last_week = 0,
         reward_list = [],
         day_reward = 0,
         lost_times = 0}).

-record(glory_role,
        {id = {0, "", 0},
         classes = 0,
         name = "",
         sex = 0,
         lev = 0,
         new_id = 0,
         max_id = 0,
         new_title_id = 0,
         mtime = 0,
         reset_time = 0,
         last_week = 0,
         update_time = 0,
         day_reward = 0}).

-record(glory_floor,
        {floor = 0,
         ver = 0,
         first = [],
         role_list = [],
         max_list = [],
         record_list = [],
         num = 0}).

-record(glory_rank_data,
        {min = 0, max = 0, reward = []}).

-record(glory_open_rank_data,
        {min = 0,
         max = 0,
         open = 0,
         reward = [],
         title = "",
         content = "",
         honor_id = 0}).

-record(glory_lev_data,
        {id = 0,
         name = "",
         title_id = 0,
         need_title_id = 0,
         need_lev = 0,
         need_fc = 0,
         fc_del = 0,
         fc_add = 0,
         lev_break = 0,
         unit_id = 0,
         all_point = 0,
         guard_num = 0,
         skill_prac = [],
         skill_prac_lev = [],
         first_reward = [],
         first_exp_mod = 0,
         normal_reward = [],
         normal_exp_mod = 0,
         day_reward = [],
         day_exp_mod = 0,
         buff_num = 0,
         buff_id = 0}).

-record(glory_title_data,
        {title_id = 0,
         next_title_id = 0,
         title_name = "",
         honor_id = 0,
         rate = 0}).

-file("src/mod/quest/quest_prog_init.erl", 29).

-file("inc/wing.hrl", 1).

-record(m_wing,
        {ver = 11 :: pos_integer(),
         grade = 0 :: non_neg_integer(),
         growth = 0,
         enhance_num = 0,
         wing_id = 0,
         plot_wing_id = 0,
         expiry = [],
         tmp_grade = 0 :: non_neg_integer(),
         tmp_growth = 0,
         tmp_wing_id = 0,
         star_lev = 1 :: non_neg_integer(),
         valid_plan = 1,
         plan_data = [] :: list(),
         change_times = 0,
         reset_times = 0,
         lev_break_skill = [],
         wing_ids = [],
         exp = 0,
         old_grade = 0,
         old_star = 0,
         appearance_list = [],
         speed = 1,
         wing_group_list = [],
         wing_power = 100}).

-record(wing_skill_plan,
        {index = 1,
         plan_name = [] :: list(),
         skills = [],
         tmp_skills = []}).

-record(wing_lev_break_skill,
        {ver = 1,
         skill_grade = 0,
         skill_id = 0,
         skill_lev = 0,
         skill_val = 0}).

-record(wing_skill,
        {ver = 1, key = {0, 0}, id = 0, lev = 0, is_lock = 0}).

-record(wing_lock_data,
        {grade = 0, max = 0, item_list = []}).

-record(wing_appearance,
        {id = 0,
         time = 0,
         timeout = 0,
         grade = 0,
         star_lev = 0}).

-record(wing_base_group,
        {group_id = 0,
         need_grade = 0,
         wing_ids = [],
         grades = [],
         loss_item = []}).

-record(wing_group,
        {ver = 1,
         group_id = 0,
         wing_ids = [],
         wing_times = 0,
         rewarded = 0}).

-file("src/mod/quest/quest_prog_init.erl", 30).

-file("inc/achievement.hrl", 1).

-record(m_achievement,
        {ver = 3 :: pos_integer(),
         point = 0 :: non_neg_integer(),
         finish = [] :: [{pos_integer(), pos_integer()}],
         doing = [] :: [tuple()],
         overdue = [] :: [pos_integer()],
         assets_point = 0 :: non_neg_integer(),
         focus = []}).

-record(achievement_log,
        {id = 0,
         accept = 0 :: integer(),
         finish = 0 :: integer()}).

-file("src/mod/quest/quest_prog_init.erl", 31).

-file("inc/honor.hrl", 1).

-record(m_honor,
        {ver = 3,
         use_id = 0,
         last_id = 0,
         r_list = [] :: list(),
         pre_id = 0,
         r_pre_list = [] :: list(),
         pre_reward_list = [] :: list()}).

-record(honor,
        {id = 0 :: non_neg_integer(),
         end_time = 0 :: non_neg_integer()}).

-record(pre_honor,
        {pre_id = 0 :: non_neg_integer(),
         end_time = 0 :: non_neg_integer()}).

-record(honor_info,
        {key :: undefined | atom(),
         list = [] :: list(),
         end_time = 0 :: non_neg_integer()}).

-record(honor_base,
        {id = 0 :: non_neg_integer(),
         name = "" :: list(),
         type = 0 :: non_neg_integer(),
         mode_type = 0 :: non_neg_integer(),
         show_type = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         is_cast = 0,
         sex = 2 :: non_neg_integer(),
         attr_list = [] :: list(),
         is_can_pre = 0 :: non_neg_integer(),
         collect_val = 0 :: non_neg_integer(),
         color = 12 :: non_neg_integer()}).

-record(pre_honor_base,
        {pre_id = 0 :: non_neg_integer(),
         pre_name = "" :: list(),
         is_cast = 0,
         items = [] :: list(),
         loss_items = [] :: list()}).

-file("src/mod/quest/quest_prog_init.erl", 32).

-file("inc/qualifying.hrl", 1).

-record(m_qualifying,
        {rank_point = 1000,
         season_combat_count = 0,
         season_win_count = 0,
         update_time = 0,
         day_win = 0,
         day_log = [],
         sign_type = 0,
         win_flag = 0,
         win_five_flag = 0}).

-record(qualifying_role_mark,
        {id = {0, "", 0},
         ver = 4,
         name = "",
         rank_lev = 0,
         rank_type = 0,
         rank_point = 1000,
         lev = 0,
         sex = 0,
         classes = 0,
         looks = [],
         thumb_up = 0,
         thumb_up_other = 0,
         day_flag = 0,
         day_win = 0,
         day_win_streak = 0,
         season_max_rank_point = 1000,
         season_combat_count = 0,
         season_win_count = 0,
         season_win_streak = 0,
         season_max_win_streak = 0,
         week_flag = 0,
         week_max_rank_point = 0,
         up_ranklev_reward = []}).

-record(qualifying_role,
        {id = {0, "", 0},
         status = 0,
         name = "",
         sex = 0,
         classes = 0,
         lev = 0,
         fc = 0,
         rank_lev = 1,
         rank_point = 1000,
         looks = [],
         type = 1,
         times = 1,
         point = 1,
         cross_group = 0 :: non_neg_integer()}).

-record(qualifying_team,
        {ids = [],
         origin_team = [],
         rank_point = 1,
         point = 1,
         match_time = 0,
         reward_point = 1,
         cross_group = 0 :: non_neg_integer()}).

-record(qualifying_rank_data,
        {lev = 1,
         max_lev = 1,
         point = 0,
         need_point = 200,
         rank_type = 0,
         lev_name = "",
         gain = [],
         five_gain = [],
         rank_type_name = [],
         uplev_reward = 0}).

-record(qualifying_zone_role,
        {id = {0, "", 0},
         name = "",
         is_online = 1,
         zone_pid,
         pid,
         zone_id = 0}).

-record(qualifying_season_data,
        {ver = 1,
         id = 1 :: pos_integer(),
         end_time = 0,
         count = 0,
         champion_list = []}).

-file("src/mod/quest/quest_prog_init.erl", 33).

-file("inc/formation.hrl", 1).

-record(m_formation,
        {id = 1, lev = 1, pos = 1, forms = [], team_form = []}).

-record(formation, {id = 0, lev = 0, exp = 0}).

-record(formation_data,
        {id = 0,
         type = 1,
         lev = 0,
         max_lev = 1,
         name = "",
         pos_desc = [],
         attr_1 = [],
         attr_2 = [],
         attr_3 = [],
         attr_4 = [],
         attr_5 = [],
         pet_attr = [],
         strong_restrain = [],
         weak_restrain = [],
         next_exp = 0,
         need_item = [],
         item_id = 0}).

-file("src/mod/quest/quest_prog_init.erl", 34).

-file("inc/teacher.hrl", 1).

-record(m_teacher,
        {id = {0, "", 0},
         ver = 2,
         name = "",
         status = 0,
         daily = [],
         daily_reward = 0,
         daily_time = 0,
         target = [],
         target_reward = [],
         target_rewarded = [],
         target_over = [],
         evaluation = [],
         study_lev = 0,
         mtime = 0,
         daily_goals = [],
         goals_times = 0}).

-record(teacher,
        {id = {0, "", 0},
         ver = 1,
         name = "",
         sex = 0,
         classes = 0,
         lev = 0,
         guild_id = {0, "", 0},
         guild_name = "",
         msg = "",
         teacher_score = 0,
         teacher_score_offline = 0,
         login_time = 0,
         fc = 0,
         students = []}).

-record(student,
        {id = {0, "", 0},
         ver = 2,
         name = "",
         sex = 0,
         classes = 0,
         lev = 0,
         status = 0,
         in_time = 0,
         out_time = 0,
         login_time = 0,
         guild_id = {0, "", 0},
         guild_name = "",
         daily = [],
         daily_time = 0,
         daily_reward = 0,
         quest_student_reward = 0,
         quest_teacher_reward = 0,
         encourage_time = 0,
         target = [],
         teacher_score = 0,
         fc = 0,
         target_reward = [],
         target_rewarded = []}).

-record(teacher_daily,
        {id = 1 :: pos_integer(),
         finish = 0 :: 0..2,
         progress = [] :: [tuple()]}).

-record(teacher_daily_data,
        {id = 1 :: pos_integer(),
         name = "" :: binary(),
         progress = [] :: [tuple()],
         reward = [],
         exp = 0}).

-record(teacher_target,
        {id = 1 :: pos_integer(),
         finish = 0 :: 0..2,
         progress = [] :: [tuple()]}).

-record(teacher_target_data,
        {id = 1 :: pos_integer(),
         name = "" :: binary(),
         progress = [] :: [tuple()],
         student_reward = [],
         teacher_reward = [],
         student_exp = 0,
         teacher_exp = 0}).

-record(teacher_sign,
        {id = {0, "", 0},
         ver = 1,
         name = "",
         sex = 0,
         classes = 0,
         lev = 0,
         online = 0,
         login_time = 0,
         logout_time = 0,
         online_time = 0,
         is_sign = 0,
         msg = ""}).

-record(teacher_quit_desc_data,
        {min = 0, max = 0, radio = 0, title = "", msg = ""}).

-record(teacher_student_sign_info,
        {id = {0, "", 0},
         name = "",
         sex = 0,
         classes = 0,
         lev = 0,
         msg = ""}).

-file("src/mod/quest/quest_prog_init.erl", 35).

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

-file("src/mod/quest/quest_prog_init.erl", 36).

-file("inc/arena.hrl", 1).

-record(m_arena,
        {ver = 1,
         cd_time = 0 :: non_neg_integer(),
         acc_num = 0 :: non_neg_integer(),
         cup = 1000 :: non_neg_integer(),
         roll_time = 0,
         roll_id = 0,
         roll_graph = []}).

-record(arena_role,
        {id = {0, "", 0} :: tuple(),
         ver = 6,
         name = "" :: bitstring(),
         win = 0 :: non_neg_integer(),
         acc_num = 0,
         sex = 0 :: 0..1,
         classes = 0 :: 0..4,
         lev = 0 :: non_neg_integer(),
         last_time = 0 :: non_neg_integer(),
         is_robot = 0 :: 0..1,
         cup = 0,
         next_log_id = 1,
         log = [],
         win_list = [],
         win_ratio = 0,
         day_time_flag = 0,
         enemy = [],
         day_win = 0,
         day_lost = 0,
         def_acc_num = 0,
         def_win = 0,
         max_cup = 1000,
         acc_sword_num = 0,
         acc_mage_num = 0,
         acc_archer_num = 0,
         acc_orc_num = 0,
         acc_devine_num = 0,
         acc_moon_num = 0,
         acc_templar_num = 0,
         win_sword = 0,
         win_mage = 0,
         win_archer = 0,
         win_orc = 0,
         win_devine = 0,
         win_moon = 0,
         win_templar = 0,
         init_def = 0,
         formation = 1,
         formation_lev = 1,
         guards = [],
         last_win_role}).

-record(arena_enemy,
        {order = 0,
         role_id = {0, "", 0},
         is_robot = 0,
         classes = 0,
         lev = 0,
         sex = 0,
         cup = 0,
         soul = 1}).

-record(arena_log,
        {log_id = 1,
         s_role_id = {0, "", 0} :: tuple(),
         s_name = "" :: list(),
         result = 0 :: 0..1,
         t_role_id = {0, "", 0} :: tuple(),
         t_name = "" :: list(),
         time = 0 :: non_neg_integer(),
         s_cup = 0,
         t_cup = 0,
         s_cup_change = 0,
         t_cup_change = 0,
         feedback = 0}).

-record(arena_role_index,
        {id = {0, "", 0},
         lev = 0,
         cup = 0,
         time = 0,
         day_time_flag = 0,
         day_win = 0,
         day_lost = 0,
         win_list = [],
         win_ratio = 0}).

-record(arena_robot,
        {id = {0, "robot", 0},
         lev = 0,
         name = "",
         classes = 0,
         sex = 0,
         cup = 0}).

-record(arena_graph,
        {id = 1,
         base_id = 0,
         num = 0,
         status = 0,
         quality = 0}).

-record(arena_graph_base,
        {id = 1,
         base_id = 0,
         num = 0,
         quality = 0,
         name = "",
         sex = 0,
         classes = 0,
         lev_low = 0,
         lev_high = 0,
         ratio = 0,
         times = 1,
         order_list = []}).

-file("src/mod/quest/quest_prog_init.erl", 37).

-file("inc/tournament.hrl", 1).

-record(m_tournament,
        {ver = 3 :: non_neg_integer(),
         triggers = [] :: list(),
         status = 0 :: non_neg_integer(),
         rewarded = [] :: list(),
         pk_type = 0,
         kingbadgenum = 0,
         starlev = 0,
         kingbadge = [] :: list(),
         showbadge = 0}).

-record(tournament_profile,
        {id = {0, "", 0} :: tuple(),
         ver = 11 :: non_neg_integer(),
         name = "" :: string(),
         lev = 0 :: non_neg_integer(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         rank_lev = 1 :: non_neg_integer(),
         rank_point = 0 :: non_neg_integer(),
         liked = 0 :: non_neg_integer(),
         liked_other = 0 :: non_neg_integer(),
         last_matched = 0 :: non_neg_integer(),
         day_matched = 0 :: non_neg_integer(),
         day_win = 0 :: non_neg_integer(),
         day_win_sustained = 0 :: non_neg_integer(),
         season_rank_lev = 1 :: non_neg_integer(),
         season_rank_point = 0 :: non_neg_integer(),
         combat_count = 0 :: non_neg_integer(),
         win_count = 0 :: non_neg_integer(),
         win_sustained = 0 :: non_neg_integer(),
         season_kill = 0 :: non_neg_integer(),
         season_reverse = 0 :: non_neg_integer(),
         season_revive = 0 :: non_neg_integer(),
         season_dmg = 0 :: non_neg_integer(),
         season_bearing_dmg = 0 :: non_neg_integer(),
         season_zero_dmg = 0 :: non_neg_integer(),
         season_pet_revive = 0 :: non_neg_integer(),
         best_rank_point = 0 :: non_neg_integer(),
         best_rank_lev = 1 :: non_neg_integer(),
         best_win_count = 0 :: non_neg_integer(),
         best_win_sustained = 0 :: non_neg_integer(),
         best_partner = [] :: list(),
         week_rank_lev = 1 :: non_neg_integer(),
         week_rank_point = 0 :: non_neg_integer(),
         awesome_kill = 0 :: non_neg_integer(),
         awesome_kill_num = 0 :: non_neg_integer(),
         awesome_dmg = 0 :: non_neg_integer(),
         awesome_heal = 0 :: non_neg_integer(),
         awesome_control = 0 :: non_neg_integer(),
         mvp = 0 :: non_neg_integer(),
         loss_mvp = 0 :: non_neg_integer(),
         season_awesome_kill = 0 :: non_neg_integer(),
         season_awesome_kill_num = 0 :: non_neg_integer(),
         season_awesome_dmg = 0 :: non_neg_integer(),
         season_awesome_heal = 0 :: non_neg_integer(),
         season_awesome_control = 0 :: non_neg_integer(),
         season_mvp = 0 :: non_neg_integer(),
         season_loss_mvp = 0 :: non_neg_integer(),
         consecutive_lost = 0 :: non_neg_integer(),
         reported = 0 :: non_neg_integer(),
         reported_other = 0 :: non_neg_integer(),
         reported_logs = [] :: list(),
         banned_date = 0 :: non_neg_integer(),
         reported_single_match = 0,
         is_auto_combat = 0,
         guards = [],
         historical_high = 0 :: non_neg_integer(),
         show_badge_id = 0 :: non_neg_integer(),
         promotion_win = 0 :: non_neg_integer(),
         upgrade_point = 0 :: non_neg_integer()}).

-record(tournament_role,
        {id = {0, "", 0} :: tuple(),
         status = 0 :: non_neg_integer(),
         name = "" :: string(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         fc = 0 :: non_neg_integer(),
         looks = [] :: list(),
         times = 1 :: non_neg_integer(),
         point = 1 :: non_neg_integer(),
         rank_lev = 1 :: non_neg_integer(),
         rank_point = 0 :: non_neg_integer(),
         pid :: undefined | pid() | 0,
         is_online = 0 :: 0 | 1,
         match_id = 0 :: non_neg_integer(),
         side = 0 :: non_neg_integer(),
         is_leader = 0 :: 0 | 1,
         last_matched = 0 :: non_neg_integer(),
         team_id = [] :: list(),
         formation_id = 1 :: non_neg_integer(),
         formation_lev = 1 :: non_neg_integer(),
         partner = [] :: list(),
         consecutive_lost = 0 :: non_neg_integer(),
         reported = 0 :: non_neg_integer(),
         guards = [],
         show_badge_id = 0 :: non_neg_integer()}).

-record(tournament_team,
        {ids = [] :: list(),
         output_num = 0 :: non_neg_integer(),
         assist_num = {0, 0} ::
             {non_neg_integer(), non_neg_integer()},
         origin_ids = [] :: list(),
         num = 1 :: non_neg_integer(),
         sum_point = 0 :: non_neg_integer(),
         max_point = 0 :: non_neg_integer(),
         min_point = 0 :: non_neg_integer(),
         sum_lev = 0 :: non_neg_integer(),
         max_lev = 0 :: non_neg_integer(),
         min_lev = 0 :: non_neg_integer(),
         tried_match = 0 :: non_neg_integer(),
         match_id = 0 :: non_neg_integer(),
         usurpers = [] :: list(),
         order = [] :: list(),
         classes = [] :: list()}).

-record(tournament_match,
        {id = 0 :: non_neg_integer(),
         teams = [] :: list(),
         time = 0 :: non_neg_integer(),
         combat_pid :: undefined | pid(),
         calc_args = [] :: list()}).

-record(tournament_usurper,
        {id = {0, "", 0} :: tuple(),
         name = "" :: string(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         leader_objected = 0 :: 0 | 1,
         total = 0 :: integer(),
         pros = 0 :: integer(),
         cons = 0 :: integer(),
         time = 0 :: integer(),
         voted_ids = []}).

-record(tournament_celebrity,
        {id = {0, "", 0} :: tuple(),
         name = "" :: string(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         val1 = 0 :: non_neg_integer(),
         val2 = 0 :: non_neg_integer()}).

-record(tournament_fighter,
        {id = {0, "", 0} :: tuple(),
         name = "" :: string(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         rank_lev = 1 :: non_neg_integer(),
         rank_point = 0 :: non_neg_integer(),
         kill_num = 0,
         dead_num = 0,
         total_heal = 0,
         control_num = 0,
         total_hurt = 0 :: non_neg_integer(),
         total_dmg = 0 :: non_neg_integer(),
         mvp_score = 0 :: non_neg_integer()}).

-record(tournament_season_role,
        {ver = 0,
         id = {0, "", 0} :: tuple(),
         name = "" :: string(),
         reward_lev = 0 :: non_neg_integer(),
         rewarded = 0 :: non_neg_integer()}).

-record(tournament_result,
        {id = {0, "", 0},
         ver = 3,
         is_win = 1,
         mates = [],
         rival = [],
         match_id = 0,
         record_pz = {"", 0} :: tuple(),
         time = 0,
         rank_lev = 0}).

-record(tournament_result_role,
        {id = {0, "", 0},
         ver = 1,
         recent = [],
         last_recent = []}).

-record(king_badge,
        {id = 0,
         status = 0,
         active_effect_type = 3,
         active_attr = [],
         fc = 0}).

-record(tournament_match_report_info,
        {match_id, can_report = [], result}).

-file("src/mod/quest/quest_prog_init.erl", 38).

-file("inc/mount.hrl", 1).

-record(mount_goal,
        {ver = 1 :: non_neg_integer(),
         finish = [] :: list(),
         doing = [] :: list(),
         day_reward = [] :: list()}).

-record(m_mount,
        {ver = 10 :: pos_integer(),
         mounts = [] :: list(),
         mount_goal = #mount_goal{},
         next_mount_id = 1 :: non_neg_integer(),
         ride_mount = 0,
         appearance_list = [],
         combat_active_times = [],
         dye_list = [],
         dye_diff_list = [],
         pre_mount_status = 0 :: non_neg_integer(),
         evolution_list = [],
         double_ride_role = {1, "", 0} ::
             {pos_integer(), list(), non_neg_integer()},
         is_driver = 0}).

-record(mount,
        {ver = 4 :: pos_integer(),
         index = 0 :: non_neg_integer(),
         mount_base_id = 0 :: non_neg_integer(),
         transformation_id = 0 :: non_neg_integer(),
         lev = 1 :: pos_integer(),
         skill_point = 1 :: pos_integer(),
         fail_times = 0 :: non_neg_integer(),
         upgrade_lev = 0 :: non_neg_integer(),
         live_status = 0,
         skill_list = [],
         fight_times = 0 :: non_neg_integer(),
         spirit = 0 :: non_neg_integer(),
         growth = 1 :: pos_integer(),
         growth_item_num = 0 :: non_neg_integer(),
         speed_lev = 1 :: pos_integer(),
         manger_pets = [],
         tmp_growth = 1 :: pos_integer(),
         tmp_skill_list = [],
         decorate_list = [],
         score = 0,
         expire_time = 0}).

-record(mount_skill,
        {skill_index = 1 :: pos_integer(),
         skill_id = 1 :: non_neg_integer(),
         skill_lev = 0 :: non_neg_integer()}).

-record(mount_decorate,
        {decorate_index = 1 :: pos_integer(),
         decorate_base_id = 0 :: non_neg_integer(),
         is_hide = 0 :: non_neg_integer()}).

-record(mount_dye,
        {trans_id = 0, dye_id = 0, cache_dye_list = []}).

-record(mount_evolution,
        {trans_id = 0, evolution_id = 0}).

-file("src/mod/quest/quest_prog_init.erl", 39).

-file("inc/checkin.hrl", 1).

-record(checkin_everyday,
        {ver = 3,
         last_time = 0 :: non_neg_integer(),
         last_date = {0, 0, 0},
         signed = 0 :: non_neg_integer(),
         log = [],
         add_sign = 0,
         rand_reward = 0,
         rand_num = 0,
         rand_item = [],
         continue_num = 0}).

-record(m_checkin,
        {ver = 3,
         seven_day = [],
         everyday = #checkin_everyday{},
         charge_day = []}).

-record(checkin_rand_data,
        {id = 0,
         item_id = 0,
         bind = 0,
         num = 0,
         weigth = 0,
         is_cast = 0}).

-file("src/mod/quest/quest_prog_init.erl", 40).

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

-file("src/mod/quest/quest_prog_init.erl", 41).

-file("inc/lev_break.hrl", 1).

-record(m_lev_break,
        {ver = 0,
         trial = 0 :: non_neg_integer(),
         done = 0 :: non_neg_integer(),
         times = 0 :: non_neg_integer(),
         attr_point = 0 :: non_neg_integer()}).

-file("src/mod/quest/quest_prog_init.erl", 42).

-file("inc/sworn.hrl", 1).

-record(m_sworn,
        {ver = 0 :: pos_integer(),
         id = {0, "", 0} ::
             {pos_integer(), list(), non_neg_integer()},
         status = 0 :: non_neg_integer(),
         name = "" :: string(),
         name_defined = "" :: string(),
         time = 0 :: list()}).

-record(sworn_role,
        {ver = 0 :: pos_integer(),
         role_id = 0 :: non_neg_integer(),
         id = 0 :: non_neg_integer(),
         name = "" :: string(),
         name_defined = "" :: string(),
         status = 0 :: non_neg_integer()}).

-record(sworn,
        {ver = 0 :: pos_integer(),
         id = {0, "", 0} ::
             {pos_integer(), list(), non_neg_integer()},
         name = "" :: string(),
         time = 0 :: non_neg_integer(),
         sworn_val = 0 :: non_neg_integer(),
         status = 0 :: non_neg_integer(),
         num = 0 :: non_neg_integer(),
         head = 0 :: non_neg_integer(),
         pos = 0 :: non_neg_integer(),
         timeout = 0 :: non_neg_integer(),
         times = 0 :: non_neg_integer(),
         members = [] :: list(),
         votes = [] :: list(),
         trends = [] :: list(),
         lists = [] :: list()}).

-record(sworn_member,
        {ver = 0 :: pos_integer(),
         pos = 0 :: non_neg_integer(),
         role_id = {0, "", 0} ::
             {pos_integer(), list(), non_neg_integer()},
         name = "" :: string(),
         name_defined = "" :: string(),
         lev = 0 :: pos_integer(),
         classes = 0 :: pos_integer(),
         sex = 0 :: pos_integer(),
         times = 0 :: pos_integer(),
         free = 0 :: pos_integer()}).

-record(sworn_trend,
        {type = 0 :: non_neg_integer(),
         id = {0, "", 0} ::
             {pos_integer(), list(), non_neg_integer()},
         name = "" :: string(),
         r_id = {0, "", 0} ::
             {pos_integer(), list(), non_neg_integer()},
         r_name = "" :: string(),
         r_lev = 0 :: non_neg_integer(),
         r_sex = 0 :: non_neg_integer(),
         r_classes = 0 :: non_neg_integer(),
         rename = "" :: string(),
         timeout = 0 :: non_neg_integer(),
         time = 0 :: non_neg_integer(),
         reason_id = 0 :: non_neg_integer(),
         reason_msg = "" :: string(),
         votes = [] :: list(),
         agree = 0 :: non_neg_integer(),
         lists = [] :: list()}).

-record(sworn_evt,
        {role_id = {0, "", 0} ::
             {pos_integer(), list(), non_neg_integer()},
         finish = 0 :: non_neg_integer(),
         skill = 0 :: non_neg_integer(),
         invite = 0 :: non_neg_integer(),
         prefix = 0 :: non_neg_integer(),
         personal = 0 :: non_neg_integer()}).

-file("src/mod/quest/quest_prog_init.erl", 43).

-file("inc/child.hrl", 1).

-record(m_child,
        {ver = 1,
         kids = [] :: list(),
         fertility = 0 :: non_neg_integer(),
         tonic = 0 :: non_neg_integer(),
         hungry_notice_lev = []}).

-record(child_attr,
        {point = 0,
         p_str = 0,
         p_con = 0,
         p_mag = 0,
         p_agi = 0,
         p_end = 0,
         pre_str = 0,
         pre_con = 0,
         pre_mag = 0,
         pre_agi = 0,
         pre_end = 0,
         max_hp_apt_used = 0,
         max_phy_apt_used = 0,
         max_pdef_apt_used = 0,
         max_magic_apt_used = 0,
         max_aspd_apt_used = 0,
         hp_aptitude = 0,
         phy_aptitude = 0,
         pdef_aptitude = 0,
         magic_aptitude = 0,
         aspd_aptitude = 0,
         max_hp_aptitude = 0,
         max_phy_aptitude = 0,
         max_pdef_aptitude = 0,
         max_magic_aptitude = 0,
         max_aspd_aptitude = 0,
         study_str = 0,
         study_con = 0,
         study_mag = 0,
         study_agi = 0,
         study_end = 0}).

-record(child_study_plan,
        {ver = 1,
         is_init = 1,
         study_str_easy = 0,
         study_con_easy = 0,
         study_mag_easy = 0,
         study_agi_easy = 0,
         study_end_easy = 0,
         study_str_hard = 0,
         study_con_hard = 0,
         study_mag_hard = 0,
         study_agi_hard = 0,
         study_end_hard = 0,
         study_str_plan_easy = 0,
         study_con_plan_easy = 0,
         study_mag_plan_easy = 0,
         study_agi_plan_easy = 0,
         study_end_plan_easy = 0,
         study_str_plan_hard = 0,
         study_con_plan_hard = 0,
         study_mag_plan_hard = 0,
         study_agi_plan_hard = 0,
         study_end_plan_hard = 0}).

-record(child_base,
        {id = 0,
         name = "",
         classes,
         sex,
         hp_aptitude = 0,
         phy_aptitude = 0,
         pdef_aptitude = 0,
         magic_aptitude = 0,
         aspd_aptitude = 0,
         growth_blue = 0,
         growth_purple = 0,
         growth_orange = 0,
         growth_red = 0,
         model_id = 0,
         model_id1 = 0,
         model_id2 = 0,
         model_id3 = 0,
         skin_id_0 = 0,
         skin_id_1 = 0,
         skin_id_2 = 0,
         skin_id_3 = 0,
         skin_id_s0 = 0,
         skin_id_s1 = 0,
         skin_id_s2 = 0,
         skin_id_s3 = 0,
         unit_id = 0,
         unit_id_1 = 0,
         unit_id_2 = 0,
         unit_id_3 = 0,
         classes_skills = []}).

-record(child,
        {id = {0, "", 0} :: tuple(),
         ver = 5,
         parents = [] :: list(),
         custody = {0, "", 0} :: tuple(),
         name = "" :: string(),
         base_id = 0,
         sex = 0 :: 0 | 1,
         classes = 0 :: non_neg_integer(),
         classes_type = 1,
         embryo = 1 :: non_neg_integer(),
         pregnant_time = 0 :: non_neg_integer(),
         birth_time = 0 :: non_neg_integer(),
         stage = 1 :: non_neg_integer(),
         status = 0,
         follow = {0, "", 0} :: tuple(),
         maturity = 0 :: non_neg_integer(),
         growth = 0 :: non_neg_integer(),
         ext_growth = 0,
         growth_type = 5 :: non_neg_integer(),
         lev = 1 :: non_neg_integer(),
         skills = [] :: list(),
         talent_skills = [],
         hungry = 100,
         add_point = 0,
         add_point_item = [],
         grade = 0,
         grade_attr = [],
         hp = 0,
         mp = 0,
         attr,
         looks = [],
         stones = [] :: list(),
         use_growth = 0,
         study_easy = 0,
         study_hard = 0,
         day_easy = 0,
         day_hard = 0,
         study_easy_time = 0,
         study_hard_time = 0,
         talent = 0,
         child_attr = #child_attr{},
         name_changed = 0 :: non_neg_integer(),
         last_name_changed = 0 :: non_neg_integer(),
         maturity_added_log = [] :: list(),
         last_added_maturity = 0 :: non_neg_integer(),
         handbook_attr = [],
         handbook_num = 0,
         star_handbook_num = 0,
         combat_talk = [],
         free_study = 0,
         study_plan = #child_study_plan{},
         spirit_attached = 0 :: 0 | 1,
         spirit_skills = [],
         spirit_info = [],
         child_skin = []}).

-record(child_parent,
        {id = {0, "", 0} :: tuple(),
         ver = 0,
         name = "" :: string(),
         sex = 0 :: 0 | 1,
         account = "",
         lev = 1,
         classes = 0 :: non_neg_integer(),
         looks = [] :: list(),
         intimacy = 0 :: non_neg_integer()}).

-record(child_base_skill,
        {id = 0,
         name = "",
         type = 0,
         step = 0,
         lev = 0,
         max_exp = 0,
         attr = []}).

-record(child_skill,
        {id = 0,
         lev = 1,
         step = 0,
         type = 0,
         source = 1,
         is_open = 1,
         exp = 1}).

-record(child_stone,
        {id = 0,
         type = 0,
         base_id = 0,
         role_id = {0, "", 0},
         attr = [],
         extra = [],
         reset_attr = []}).

-record(child_talent_skill,
        {id = 0, grade = 0, lev = 1, exp = 0}).

-record(child_rank, {type = 1, list = []}).

-record(child_rank_rc,
        {id = {0, "", 0} :: tuple(),
         rank = 1,
         ver = 0,
         father_id = {0, "", 0},
         father_name = "",
         father_classes = 0,
         father_sex = 0,
         mother_id = {0, "", 0},
         mother_name = "",
         mother_classes = 0,
         mother_sex = 0,
         custody = {0, "", 0} :: tuple(),
         name = "" :: string(),
         base_id = 0,
         sex = 0 :: 0 | 1,
         classes = 0 :: non_neg_integer(),
         classes_type = 1,
         lev = 1 :: non_neg_integer(),
         val1 = 0 :: non_neg_integer(),
         val2 = 0 :: non_neg_integer(),
         val3 = 0 :: non_neg_integer(),
         val4 = 0 :: non_neg_integer(),
         time = 0}).

-record(child_skin,
        {ver = 2,
         skin_id = 0,
         skin_active_flag = 0,
         expire_time = 0,
         timer_flag = 0}).

-file("src/mod/quest/quest_prog_init.erl", 44).

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

-file("src/mod/quest/quest_prog_init.erl", 45).

-file("inc/gods_duel.hrl", 1).

-record(gods_duel_team,
        {ver = 1 :: pos_integer(),
         id = {0, "", 0},
         name = "",
         lev = 0,
         match_group = 0,
         leader = {0, "", 0},
         member_num = 0,
         members = [],
         fight_capacity = 0,
         applys = [],
         invite_info = [],
         declaration = "",
         win_times = 0,
         loss_times = 0,
         qualification = 0,
         team_group_256 = 0,
         team_group_64 = 0,
         team_group_8 = 0,
         team_group_4 = 0,
         team_seq = 0,
         team_index = 0}).

-record(gods_duel_team_mate,
        {ver = 1,
         id = {0, "", 0},
         name = "",
         classes = 0,
         sex = 0,
         lev = 0,
         break_times = 0,
         position = 0,
         fight_capacity = 0,
         join_time = 0}).

-record(m_gods_duel,
        {ver = 2, team_id = {0, "", 0}, gods_score = 0}).

-record(gods_duel_season_data,
        {ver = 1, serial_id = 0, history_season_info = []}).

-record(gods_duel_season_info,
        {ver = 1,
         id = 0,
         status = 0,
         teams = [],
         group_order = 0,
         season_time_info = []}).

-record(invite_info,
        {id = {0, "", 0},
         name = "",
         lev = 0,
         break_times = 0,
         classes = 0,
         sex = 0,
         total_fc = 0,
         online = 0}).

-record(gods_duel_join_team,
        {id = {0, "", 0},
         team_pid = undefined,
         team_data = undefined,
         fighters = [],
         is_ready = false}).

-record(gods_duel_match,
        {id = {0, 0},
         teams = [],
         combat_pid = undefined :: pid(),
         calc_args = [],
         combat_ref = undefined,
         is_over = 0,
         map_id = 0,
         map_pid = undefined,
         roles = []}).

-record(gods_duel_match_profile,
        {id = 0,
         ver = 1,
         season_id = 0,
         match_type = 0,
         match_round = 0,
         match_id = 0,
         group_id = 0,
         combat_type = 0,
         atk_name,
         dfd_name,
         combat_pid = undefined :: pid(),
         is_over = 0,
         platform = "",
         zone_id = 0,
         time = 0,
         fc_diff = 0,
         round = 0}).

-record(gods_duel_fighter,
        {id = {0, "", 0} :: tuple(),
         name = "" :: string(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         kill_num = 0,
         dead_num = 0,
         total_heal = 0,
         control_num = 0,
         total_hurt = 0 :: non_neg_integer(),
         total_dmg = 0 :: non_neg_integer(),
         mvp_score = 0 :: non_neg_integer()}).

-record(gods_duel_vote,
        {ver = 0 :: non_neg_integer(),
         id = {0, "", 0} :: tuple(),
         name = "" :: bitstring(),
         sex = 0 :: 0..1,
         classes = 0 :: 0..4,
         lev = 0 :: non_neg_integer(),
         season = 0 :: non_neg_integer(),
         choices = [] :: list(),
         time = 0 :: non_neg_integer()}).

-record(gods_duel_vote_choice,
        {id = {0, "", 0} :: tuple(),
         match_round = 0 :: non_neg_integer(),
         match_zone = 0,
         is_right = 0 :: 0..2}).

-record(gods_duel_poll,
        {id = {0, "", 0} :: tuple(),
         match_round = 0 :: non_neg_integer(),
         voted_cnt = 0 :: non_neg_integer()}).

-record(gods_duel_profile,
        {id = {0, "", 0} :: tuple(),
         ver = 1 :: non_neg_integer(),
         name = "" :: string(),
         lev = 0 :: non_neg_integer(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         rank_lev = 1 :: non_neg_integer(),
         gods_duel_score = 0 :: non_neg_integer()}).

-record(gods_challenge_info,
        {id, combat_pid, is_over = 0}).

-record(gods_duel_team_rank,
        {ver = 1, serial_id = 0, history_season_info = []}).

-record(gods_duel_team_rank_data,
        {ver = 1,
         id = {0, "", 0},
         name = "",
         leader = {0, "", 0},
         member_num = 0,
         members = [],
         fight_capacity = 0,
         win_times = 0,
         qualification = 0,
         rank = 0}).

-record(gods_duel_team_rank_mate,
        {ver = 1,
         id = {0, "", 0},
         name = "",
         classes = 0,
         sex = 2,
         lev = 0,
         break_times = 0,
         position = 2,
         fight_capacity = 0,
         looks = []}).

-record(gods_challenge_team,
        {season_id = 0,
         team_name = "",
         member_num = 0,
         members = []}).

-record(gods_challenge_team_mate,
        {id = {0, "", 0}, name = ""}).

-file("src/mod/quest/quest_prog_init.erl", 46).

-spec do(#role{}, Progress :: list(),
         QuestId :: pos_integer()) -> NewProgs :: list().

do(Role, Progress, QuestId) ->
    do(Role, Progress, QuestId, 0, []).

do(_Role, [], _QuestId, _Id, []) -> [];
do(_Role, [], _QuestId, _Id, Progress) ->
    lists:reverse(Progress);
do(Role, [Prog = #quest_progress{} | T], QuestId, Id,
   Progress) ->
    NewProg = #quest_progress{} = update(Prog,
                                         QuestId,
                                         Role),
    do(Role,
       T,
       QuestId,
       Id + 1,
       [NewProg#quest_progress{id = Id} | Progress]).

-spec update(#quest_progress{},
             QuestId :: pos_integer(), #role{}) -> #quest_progress{}.

update(Prog = #quest_progress{label = evt_enter_map,
                              target = Target, target_val = TargetVal},
       _QuestId, #role{pos = #pos{map_base_id = Target}}) ->
    Prog#quest_progress{finish = 1, value = TargetVal};
update(Prog = #quest_progress{label = evt_use_item,
                              target = Target},
       _QuestId,
       _Role = #role{p_eqm = #package{items = Items}}) ->
    case lists:keyfind(Target, #item.base_id, Items) of
        #item{} ->
            #quest_progress{target_val = TarVal, value = OldVal} =
                Prog,
            if 1 >= TarVal ->
                   Prog#quest_progress{finish = 1, value = TarVal};
               1 > OldVal -> Prog#quest_progress{value = 1};
               true -> Prog
            end;
        _ -> Prog
    end;
update(Prog = #quest_progress{label = evt_use_item_type,
                              target = Target},
       _QuestId,
       _Role = #role{p_eqm = #package{items = Items}}) ->
    case lists:keyfind(Target, #item.type, Items) of
        #item{} ->
            #quest_progress{target_val = TarVal, value = OldVal} =
                Prog,
            if 1 >= TarVal ->
                   Prog#quest_progress{finish = 1, value = TarVal};
               1 > OldVal -> Prog#quest_progress{value = 1};
               true -> Prog
            end;
        _ -> Prog
    end;
update(Prog = #quest_progress{label = evt_get_item,
                              target = Target},
       _QuestId, #role{p_bag = Bag})
    when Target > 0 ->
    {_, Num} = package:count(by_base_id, Target, Bag),
    #quest_progress{target_val = TarVal, value = OldVal} =
        Prog,
    if Num >= TarVal ->
           Prog#quest_progress{finish = 1, value = TarVal};
       Num > OldVal -> Prog#quest_progress{value = Num};
       true -> Prog
    end;
update(Prog = #quest_progress{label = evt_get_item,
                              param = [{item_type, Type}]},
       _QuestId, #role{p_bag = Bag})
    when Type > 0 ->
    {_, Num} = package:count(by_type, Type, Bag),
    #quest_progress{target_val = TarVal, value = OldVal} =
        Prog,
    if Num >= TarVal ->
           Prog#quest_progress{finish = 1, value = TarVal};
       Num > OldVal -> Prog#quest_progress{value = Num};
       true -> Prog
    end;
update(Prog = #quest_progress{label = evt_get_item,
                              target_val = TarVal, value = OldVal,
                              ext_data = ExtData},
       QuestId, Role = #role{p_bag = Bag}) ->
    NewProg = #quest_progress{target = Target} = case
                                                     lists:keyfind(3,
                                                                   1,
                                                                   ExtData)
                                                     of
                                                     {3, BaseId} ->
                                                         Prog#quest_progress{target
                                                                                 =
                                                                                 BaseId,
                                                                             ext_data
                                                                                 =
                                                                                 ExtData};
                                                     false ->
                                                         get_rand_find_item(Prog,
                                                                            QuestId,
                                                                            Role);
                                                     _False -> Prog
                                                 end,
    case Target =:= 0 of
        false ->
            {_, Val} = package:count(by_base_id, Target, Bag),
            if Val >= TarVal ->
                   NewProg#quest_progress{finish = 1, value = TarVal};
               Val > OldVal -> NewProg#quest_progress{value = Val};
               true -> NewProg
            end;
        true -> Prog
    end;
update(Prog = #quest_progress{label = evt_levup,
                              target = 2, param = [Times]},
       _QuestId,
       Role = #role{m_lev_break =
                        #m_lev_break{times = BTimes}})
    when BTimes > Times ->
    Lev = lev_break:lev(Role),
    #quest_progress{target_val = TarVal, value = OldVal} =
        Prog,
    if Lev >= TarVal ->
           Prog#quest_progress{finish = 1, value = TarVal};
       Lev > OldVal -> Prog#quest_progress{value = Lev};
       true -> Prog
    end;
update(Prog = #quest_progress{label = evt_levup,
                              target = 2, param = [Times]},
       _QuestId,
       _Role = #role{m_lev_break = #m_lev_break{times = Times},
                     lev = Lev}) ->
    #quest_progress{target_val = TarVal, value = OldVal} =
        Prog,
    if Lev >= TarVal ->
           Prog#quest_progress{finish = 1, value = TarVal};
       Lev > OldVal -> Prog#quest_progress{value = Lev};
       true -> Prog
    end;
update(Prog = #quest_progress{label = evt_levup,
                              target = 2},
       _QuestId, _Role) ->
    Prog;
update(Prog = #quest_progress{label = evt_levup,
                              target = 1},
       _QuestId, Role) ->
    Lev = lev_break:lev(Role),
    #quest_progress{target_val = TarVal, value = OldVal} =
        Prog,
    if Lev >= TarVal ->
           Prog#quest_progress{finish = 1, value = TarVal};
       Lev > OldVal -> Prog#quest_progress{value = Lev};
       true -> Prog
    end;
update(Prog = #quest_progress{label = evt_levup},
       _QuestId, #role{lev = Lev}) ->
    #quest_progress{target_val = TarVal, value = OldVal} =
        Prog,
    if Lev >= TarVal ->
           Prog#quest_progress{finish = 1, value = TarVal};
       Lev > OldVal -> Prog#quest_progress{value = Lev};
       true -> Prog
    end;
update(Prog = #quest_progress{label = evt_arena_cup},
       _QuestId, #role{id = RoleId}) ->
    case arena_mgr:get_role(RoleId) of
        #arena_role{cup = Val} ->
            #quest_progress{target_val = TarVal, value = OldVal} =
                Prog,
            if Val >= TarVal ->
                   Prog#quest_progress{finish = 1, value = TarVal};
               Val > OldVal -> Prog#quest_progress{value = Val};
               true -> Prog
            end;
        _ -> Prog
    end;
update(Prog = #quest_progress{label = evt_guild},
       _QuestId, #role{m_guild = #m_guild{}}) ->
    #quest_progress{target_val = TarVal, value = OldVal} =
        Prog,
    if 1 >= TarVal ->
           Prog#quest_progress{finish = 1, value = TarVal};
       1 > OldVal -> Prog#quest_progress{value = 1};
       true -> Prog
    end;
update(Prog = #quest_progress{label = evt_talisman,
                              param = [num]},
       _QuestId,
       #role{m_talisman =
                 #m_talisman{plan_1 = Plan1, plan_2 = Plan2}}) ->
    Max = max(length(Plan1), length(Plan2)),
    #quest_progress{target_val = TarVal, value = OldVal} =
        Prog,
    if Max >= TarVal ->
           Prog#quest_progress{finish = 1, value = TarVal};
       Max > OldVal -> Prog#quest_progress{value = Max};
       true -> Prog
    end;
update(Prog = #quest_progress{label = evt_skill_up,
                              param = Param = [_ | _]},
       _QuestId, #role{m_skill = #m_skill{skills = SkillL}}) ->
    Num = lists:sum([1
                     || {SkillId, Lev} <- SkillL,
                        lists:member(SkillId, Param), Lev > 0]),
    #quest_progress{target_val = TarVal, value = OldVal} =
        Prog,
    if Num >= TarVal ->
           Prog#quest_progress{finish = 1, value = TarVal};
       Num > OldVal -> Prog#quest_progress{value = Num};
       true -> Prog
    end;
update(Prog = #quest_progress{label = evt_skill_up,
                              target = NeedLev},
       _QuestId, Role)
    when NeedLev > 0 ->
    Skills = skill:get_total_skill(Role),
    Num = lists:sum([1
                     || {_SkillId, Lev} <- Skills, Lev >= NeedLev]),
    #quest_progress{target_val = TarVal, value = OldVal} =
        Prog,
    if Num >= TarVal ->
           Prog#quest_progress{finish = 1, value = TarVal};
       Num > OldVal -> Prog#quest_progress{value = Num};
       true -> Prog
    end;
update(Prog = #quest_progress{label =
                                  evt_skill_prac_levup,
                              param = Param},
       _QuestId,
       #role{m_skill = #m_skill{skill_prac = SkillPrac}}) ->
    case lists:keyfind(lev, 1, Param) of
        {lev, NeedLev} ->
            List = [Id
                    || #skl_prac{id = Id, lev = Lev} <- SkillPrac,
                       Lev >= NeedLev],
            Num = length(List),
            #quest_progress{target_val = TarVal, value = OldVal} =
                Prog,
            if Num >= TarVal ->
                   Prog#quest_progress{finish = 1, value = TarVal};
               Num > OldVal -> Prog#quest_progress{value = Num};
               true -> Prog
            end;
        _False -> Prog
    end;
update(Prog = #quest_progress{label =
                                  evt_skill_life_levup,
                              target = Target},
       _QuestId,
       #role{m_skill_life = #m_skill_life{skills = SkillL}}) ->
    case lists:keyfind(Target, #skill_life.id, SkillL) of
        #skill_life{lev = Lev} ->
            #quest_progress{target_val = TarVal, value = OldVal} =
                Prog,
            if Lev >= TarVal ->
                   Prog#quest_progress{finish = 1, value = TarVal};
               Lev > OldVal -> Prog#quest_progress{value = Lev};
               true -> Prog
            end;
        _False -> Prog
    end;
update(Prog = #quest_progress{label = evt_guard,
                              target = Target},
       _QuestId, #role{m_guard = #m_guard{guards = Guards}}) ->
    L = [BaseId
         || #guard{base_id = BaseId} <- Guards,
            Target =:= 0 orelse Target =:= BaseId],
    case L of
        [] -> Prog;
        _ ->
            #quest_progress{target_val = TarVal, value = OldVal} =
                Prog,
            if length(L) >= TarVal ->
                   Prog#quest_progress{finish = 1, value = TarVal};
               length(L) > OldVal ->
                   Prog#quest_progress{value = length(L)};
               true -> Prog
            end
    end;
update(Prog = #quest_progress{label =
                                  evt_guard_activate},
       _QuestId, #role{m_guard = #m_guard{guards = Guards}}) ->
    case [true
          || #guard{astroid = #guard_astroid{active = Active}}
                 <- Guards,
             Active =/= 0]
        of
        [_ | _] ->
            #quest_progress{target_val = TarVal, value = OldVal} =
                Prog,
            if 1 >= TarVal ->
                   Prog#quest_progress{finish = 1, value = TarVal};
               1 > OldVal -> Prog#quest_progress{value = 1};
               true -> Prog
            end;
        _ -> Prog
    end;
update(Prog = #quest_progress{label = evt_guard_score},
       _QuestId, #role{m_guard = #m_guard{guards = Guards}}) ->
    case Guards of
        [] -> Prog;
        _ ->
            MaxScore = lists:max([Score
                                  || #guard{score = Score} <- Guards]),
            #quest_progress{target_val = TarVal, value = OldVal} =
                Prog,
            if MaxScore >= TarVal ->
                   Prog#quest_progress{finish = 1, value = TarVal};
               MaxScore > OldVal ->
                   Prog#quest_progress{value = MaxScore};
               true -> Prog
            end
    end;
update(Prog = #quest_progress{label = evt_eqm,
                              param = [{eqm_lev, Conds}]},
       _QuestId, #role{p_eqm = #package{items = Eqms}}) ->
    case lists:keytake(lev, 1, Conds) of
        {value, {lev, RequireLev}, [{num, RequireNum}]} ->
            RequireEqms = [1
                           || #item{lev = Lev} <- Eqms, Lev >= RequireLev],
            case length(RequireEqms) >= RequireNum of
                true ->
                    #quest_progress{target_val = TarVal, value = OldVal} =
                        Prog,
                    if 1 >= TarVal ->
                           Prog#quest_progress{finish = 1, value = TarVal};
                       1 > OldVal -> Prog#quest_progress{value = 1};
                       true -> Prog
                    end;
                false -> Prog
            end;
        _ -> Prog
    end;
update(Prog = #quest_progress{label = evt_eqm,
                              param = [{eqm_lev_num, RequireLev}]},
       _QuestId, #role{p_eqm = #package{items = Eqms}}) ->
    RequireEqms = [1
                   || #item{lev = Lev} <- Eqms, Lev >= RequireLev],
    Num = length(RequireEqms),
    #quest_progress{target_val = TarVal, value = OldVal} =
        Prog,
    if Num >= TarVal ->
           Prog#quest_progress{finish = 1, value = TarVal};
       Num > OldVal -> Prog#quest_progress{value = Num};
       true -> Prog
    end;
update(Prog = #quest_progress{label = evt_wedding_score,
                              param = [acc]},
       _QuestId, Role) ->
    Val = var:get_var(Role, acc, 1009, 0),
    #quest_progress{target_val = TarVal, value = OldVal} =
        Prog,
    if Val >= TarVal ->
           Prog#quest_progress{finish = 1, value = TarVal};
       Val > OldVal -> Prog#quest_progress{value = Val};
       true -> Prog
    end;
update(Prog = #quest_progress{label =
                                  evt_lev_break_exch},
       _QuestId,
       _Role = #role{m_lev_break =
                         #m_lev_break{attr_point = Val}}) ->
    #quest_progress{target_val = TarVal, value = OldVal} =
        Prog,
    if Val >= TarVal ->
           Prog#quest_progress{finish = 1, value = TarVal};
       Val > OldVal -> Prog#quest_progress{value = Val};
       true -> Prog
    end;
update(Prog = #quest_progress{label = evt_get_pet,
                              target = 10003, param = []},
       _QuestId = 10270, #role{m_pet = #m_pet{pets = Pets}}) ->
    L = [Id || #pet{id = Id, base_id = 10003} <- Pets],
    case L of
        [] -> Prog;
        _ ->
            #quest_progress{target_val = TarVal, value = OldVal} =
                Prog,
            if 1 >= TarVal ->
                   Prog#quest_progress{finish = 1, value = TarVal};
               1 > OldVal -> Prog#quest_progress{value = 1};
               true -> Prog
            end
    end;
update(Prog = #quest_progress{label = evt_get_pet,
                              target = 10003, param = []},
       _QuestId = 22270, #role{m_pet = #m_pet{pets = Pets}}) ->
    L = [Id || #pet{id = Id, base_id = 10003} <- Pets],
    case L of
        [] -> Prog;
        _ ->
            #quest_progress{target_val = TarVal, value = OldVal} =
                Prog,
            if 1 >= TarVal ->
                   Prog#quest_progress{finish = 1, value = TarVal};
               1 > OldVal -> Prog#quest_progress{value = 1};
               true -> Prog
            end
    end;
update(Prog = #quest_progress{label = evt_get_pet,
                              target = Target},
       _QuestId, #role{m_pet = #m_pet{pets = Pets}}) ->
    L = [Id
         || #pet{id = Id, base_id = BaseId, genre = 3,
                 status = 0, lev = 1}
                <- Pets,
            BaseId =:= Target],
    case L of
        [] -> Prog;
        _ ->
            #quest_progress{target_val = TarVal, value = OldVal} =
                Prog,
            if 1 >= TarVal ->
                   Prog#quest_progress{finish = 1, value = TarVal};
               1 > OldVal -> Prog#quest_progress{value = 1};
               true -> Prog
            end
    end;
update(Prog = #quest_progress{label = evt_pet_war,
                              target = Target, target_val = Val},
       _QuestId, #role{m_pet = #m_pet{pets = Pets}}) ->
    L = [Id
         || #pet{id = Id, status = Status, base_id = BaseId}
                <- Pets,
            Status =:= 1, Target =:= BaseId],
    case length(L) >= Val of
        true ->
            #quest_progress{target_val = TarVal, value = OldVal} =
                Prog,
            if 1 >= TarVal ->
                   Prog#quest_progress{finish = 1, value = TarVal};
               1 > OldVal -> Prog#quest_progress{value = 1};
               true -> Prog
            end;
        false -> Prog
    end;
update(Prog = #quest_progress{label = evt_pet_skill,
                              target = Target, param = [one_count]},
       _QuestId, #role{m_pet = #m_pet{pets = Pets}}) ->
    case [length([1
                  || #pet_skill{step = Step} <- Skills, Step >= Target])
          || #pet{skills = Skills} <- Pets]
        of
        [] -> Prog;
        List ->
            Max = lists:max(List),
            #quest_progress{target_val = TarVal, value = OldVal} =
                Prog,
            if Max >= TarVal ->
                   Prog#quest_progress{finish = 1, value = TarVal};
               Max > OldVal -> Prog#quest_progress{value = Max};
               true -> Prog
            end
    end;
update(Prog = #quest_progress{label = evt_pet_war,
                              param = [{num, Val}]},
       _QuestId, #role{m_pet = #m_pet{pets = Pets}}) ->
    L = [Id
         || #pet{id = Id, status = Status} <- Pets,
            Status =:= 1],
    case length(L) >= Val of
        true ->
            #quest_progress{target_val = TarVal, value = OldVal} =
                Prog,
            if 1 >= TarVal ->
                   Prog#quest_progress{finish = 1, value = TarVal};
               1 > OldVal -> Prog#quest_progress{value = 1};
               true -> Prog
            end;
        false -> Prog
    end;
update(Prog = #quest_progress{label = evt_pet,
                              target = Target, param = [sum_genre]},
       _QuestId, #role{m_pet = #m_pet{pets = Pets}}) ->
    Length = length([1
                     || #pet{genre = Genre} <- Pets, Genre == Target]),
    #quest_progress{target_val = TarVal, value = OldVal} =
        Prog,
    if Length >= TarVal ->
           Prog#quest_progress{finish = 1, value = TarVal};
       Length > OldVal -> Prog#quest_progress{value = Length};
       true -> Prog
    end;
update(Prog = #quest_progress{label = evt_pet,
                              target = Target, param = [sum_talent]},
       _QuestId, #role{m_pet = #m_pet{pets = Pets}}) ->
    Length = length([1
                     || #pet{talent = Talent} <- Pets, Talent >= Target]),
    #quest_progress{target_val = TarVal, value = OldVal} =
        Prog,
    if Length >= TarVal ->
           Prog#quest_progress{finish = 1, value = TarVal};
       Length > OldVal -> Prog#quest_progress{value = Length};
       true -> Prog
    end;
update(Prog = #quest_progress{label = evt_pet_lev,
                              target = Target, param = [sum]},
       _QuestId, #role{m_pet = #m_pet{pets = Pets}}) ->
    Length = length([1
                     || #pet{lev = Lev} <- Pets, Lev >= Target]),
    #quest_progress{target_val = TarVal, value = OldVal} =
        Prog,
    if Length >= TarVal ->
           Prog#quest_progress{finish = 1, value = TarVal};
       Length > OldVal -> Prog#quest_progress{value = Length};
       true -> Prog
    end;
update(Prog = #quest_progress{label = evt_everyday},
       _QuestId,
       #role{m_checkin =
                 #m_checkin{everyday =
                                #checkin_everyday{signed = Val}}}) ->
    #quest_progress{target_val = TarVal, value = OldVal} =
        Prog,
    if Val >= TarVal ->
           Prog#quest_progress{finish = 1, value = TarVal};
       Val > OldVal -> Prog#quest_progress{value = Val};
       true -> Prog
    end;
update(Prog = #quest_progress{label =
                                  evt_campaign_reward,
                              param = Param},
       _QuestId,
       #role{m_campaign = #m_campaign{rewarded = Rewarded}}) ->
    List = [lists:keyfind(Id, 1, Rewarded) || Id <- Param],
    L = [1 || I <- List, I =/= false],
    #quest_progress{target_val = TarVal, value = OldVal} =
        Prog,
    if length(L) >= TarVal ->
           Prog#quest_progress{finish = 1, value = TarVal};
       length(L) > OldVal ->
           Prog#quest_progress{value = length(L)};
       true -> Prog
    end;
update(Prog = #quest_progress{label = evt_friend},
       _QuestId, #role{m_friend = #m_friend{num = Num}}) ->
    #quest_progress{target_val = TarVal, value = OldVal} =
        Prog,
    if Num >= TarVal ->
           Prog#quest_progress{finish = 1, value = TarVal};
       Num > OldVal -> Prog#quest_progress{value = Num};
       true -> Prog
    end;
update(Prog = #quest_progress{label = evt_formation_lev,
                              target = Target, param = [formation]},
       _QuestId,
       #role{m_formation = #m_formation{forms = Forms}}) ->
    case lists:keyfind(Target, #formation.id, Forms) of
        #formation{lev = Lev} ->
            #quest_progress{target_val = TarVal, value = OldVal} =
                Prog,
            if Lev >= TarVal ->
                   Prog#quest_progress{finish = 1, value = TarVal};
               Lev > OldVal -> Prog#quest_progress{value = Lev};
               true -> Prog
            end;
        _ -> Prog
    end;
update(Prog = #quest_progress{label = evt_formation_lev,
                              target = Target},
       _QuestId,
       #role{m_formation = #m_formation{forms = Forms}}) ->
    Length = length([1
                     || #formation{lev = TLev} <- Forms, TLev >= Target]),
    #quest_progress{target_val = TarVal, value = OldVal} =
        Prog,
    if Length >= TarVal ->
           Prog#quest_progress{finish = 1, value = TarVal};
       Length > OldVal -> Prog#quest_progress{value = Length};
       true -> Prog
    end;
update(Prog = #quest_progress{label =
                                  evt_blacksmith_embed},
       _QuestId, Role) ->
    Num = blacksmith:count_embed(Role),
    #quest_progress{target_val = TarVal, value = OldVal} =
        Prog,
    if Num >= TarVal ->
           Prog#quest_progress{finish = 1, value = TarVal};
       Num > OldVal -> Prog#quest_progress{value = Num};
       true -> Prog
    end;
update(Prog = #quest_progress{label = evt_glory,
                              param = [count]},
       _QuestId, #role{m_glory = #m_glory{new_id = Floor}}) ->
    case Floor >= 80 of
        true ->
            #quest_progress{target_val = TarVal, value = OldVal} =
                Prog,
            if Floor >= TarVal ->
                   Prog#quest_progress{finish = 1, value = TarVal};
               Floor > OldVal -> Prog#quest_progress{value = Floor};
               true -> Prog
            end;
        _ -> Prog
    end;
update(Prog = #quest_progress{label = evt_glory},
       _QuestId, #role{m_glory = #m_glory{max_id = Id}}) ->
    #quest_progress{target_val = TarVal, value = OldVal} =
        Prog,
    if Id >= TarVal ->
           Prog#quest_progress{finish = 1, value = TarVal};
       Id > OldVal -> Prog#quest_progress{value = Id};
       true -> Prog
    end;
update(Prog = #quest_progress{label = evt_gain_coin},
       _QuestId, #role{assets = #assets{coin = Num}}) ->
    #quest_progress{target_val = TarVal, value = OldVal} =
        Prog,
    if Num >= TarVal ->
           Prog#quest_progress{finish = 1, value = TarVal};
       Num > OldVal -> Prog#quest_progress{value = Num};
       true -> Prog
    end;
update(Prog = #quest_progress{label =
                                  evt_gain_gold_bind},
       _QuestId, #role{assets = #assets{gold_bind = Num}}) ->
    #quest_progress{target_val = TarVal, value = OldVal} =
        Prog,
    if Num >= TarVal ->
           Prog#quest_progress{finish = 1, value = TarVal};
       Num > OldVal -> Prog#quest_progress{value = Num};
       true -> Prog
    end;
update(Prog = #quest_progress{label = evt_gain_gold},
       _QuestId, #role{assets = #assets{gold = Num}}) ->
    #quest_progress{target_val = TarVal, value = OldVal} =
        Prog,
    if Num >= TarVal ->
           Prog#quest_progress{finish = 1, value = TarVal};
       Num > OldVal -> Prog#quest_progress{value = Num};
       true -> Prog
    end;
update(Prog = #quest_progress{label = evt_gain_guild},
       _QuestId, #role{assets = #assets{guild = Num}}) ->
    #quest_progress{target_val = TarVal, value = OldVal} =
        Prog,
    if Num >= TarVal ->
           Prog#quest_progress{finish = 1, value = TarVal};
       Num > OldVal -> Prog#quest_progress{value = Num};
       true -> Prog
    end;
update(Prog = #quest_progress{label = evt_wing,
                              param = [{growth, NeedGrowth}]},
       _QuestId,
       #role{m_wing =
                 #m_wing{grade = Grade, growth = Growth}}) ->
    case Growth >= NeedGrowth of
        true ->
            #quest_progress{target_val = TarVal, value = OldVal} =
                Prog,
            if Grade >= TarVal ->
                   Prog#quest_progress{finish = 1, value = TarVal};
               Grade > OldVal -> Prog#quest_progress{value = Grade};
               true -> Prog
            end;
        _ -> Prog
    end;
update(Prog = #quest_progress{label = evt_wing},
       _QuestId, #role{m_wing = #m_wing{grade = Grade}}) ->
    #quest_progress{target_val = TarVal, value = OldVal} =
        Prog,
    if Grade >= TarVal ->
           Prog#quest_progress{finish = 1, value = TarVal};
       Grade > OldVal -> Prog#quest_progress{value = Grade};
       true -> Prog
    end;
update(Prog = #quest_progress{label = evt_wing_skill},
       _QuestId,
       #role{m_wing =
                 #m_wing{valid_plan = VL, plan_data = PlanData}}) ->
    case lists:keyfind(VL, #wing_skill_plan.index, PlanData)
        of
        #wing_skill_plan{skills = S} ->
            #quest_progress{target_val = TarVal, value = OldVal} =
                Prog,
            if length(S) >= TarVal ->
                   Prog#quest_progress{finish = 1, value = TarVal};
               length(S) > OldVal ->
                   Prog#quest_progress{value = length(S)};
               true -> Prog
            end;
        _ -> Prog
    end;
update(Prog = #quest_progress{target = Target,
                              label = evt_wing_lev,
                              param = [{star_lev, NeedLev}]},
       _QuestId,
       #role{m_wing =
                 #m_wing{grade = Grade, star_lev = StarLev}}) ->
    case Grade > Target of
        true ->
            #quest_progress{target_val = TarVal, value = OldVal} =
                Prog,
            if 1 >= TarVal ->
                   Prog#quest_progress{finish = 1, value = TarVal};
               1 > OldVal -> Prog#quest_progress{value = 1};
               true -> Prog
            end;
        _ ->
            case Grade =:= Target of
                true when StarLev >= NeedLev ->
                    #quest_progress{target_val = TarVal, value = OldVal} =
                        Prog,
                    if 1 >= TarVal ->
                           Prog#quest_progress{finish = 1, value = TarVal};
                       1 > OldVal -> Prog#quest_progress{value = 1};
                       true -> Prog
                    end;
                _ -> Prog
            end
    end;
update(Prog = #quest_progress{target = Target,
                              label = evt_wing_lev},
       _QuestId, #role{m_wing = #m_wing{grade = Grade}}) ->
    case Grade >= Target of
        true ->
            #quest_progress{target_val = TarVal, value = OldVal} =
                Prog,
            if 1 >= TarVal ->
                   Prog#quest_progress{finish = 1, value = TarVal};
               1 > OldVal -> Prog#quest_progress{value = 1};
               true -> Prog
            end;
        _ -> Prog
    end;
update(Prog = #quest_progress{label = evt_achievement,
                              param = [point]},
       _QuestId,
       #role{m_achievement = #m_achievement{point = Point}}) ->
    #quest_progress{target_val = TarVal, value = OldVal} =
        Prog,
    if Point >= TarVal ->
           Prog#quest_progress{finish = 1, value = TarVal};
       Point > OldVal -> Prog#quest_progress{value = Point};
       true -> Prog
    end;
update(Prog = #quest_progress{label = evt_achievement,
                              param = [{id, Target}]},
       _QuestId,
       #role{m_achievement =
                 #m_achievement{finish = Finish}}) ->
    case lists:keyfind(Target, 1, Finish) of
        {Target, _} ->
            #quest_progress{target_val = TarVal, value = OldVal} =
                Prog,
            if 1 >= TarVal ->
                   Prog#quest_progress{finish = 1, value = TarVal};
               1 > OldVal -> Prog#quest_progress{value = 1};
               true -> Prog
            end;
        _ -> Prog
    end;
update(Prog = #quest_progress{label = evt_honor,
                              target = 0},
       _QuestId, #role{m_honor = #m_honor{r_list = RList}}) ->
    #quest_progress{target_val = TarVal, value = OldVal} =
        Prog,
    if length(RList) >= TarVal ->
           Prog#quest_progress{finish = 1, value = TarVal};
       length(RList) > OldVal ->
           Prog#quest_progress{value = length(RList)};
       true -> Prog
    end;
update(Prog = #quest_progress{label = evt_honor,
                              target = Target},
       _QuestId, #role{m_honor = #m_honor{r_list = RList}}) ->
    case lists:keyfind(Target, #honor.id, RList) of
        #honor{} ->
            #quest_progress{target_val = TarVal, value = OldVal} =
                Prog,
            if 1 >= TarVal ->
                   Prog#quest_progress{finish = 1, value = TarVal};
               1 > OldVal -> Prog#quest_progress{value = 1};
               true -> Prog
            end;
        _ -> Prog
    end;
update(Prog = #quest_progress{label = evt_fashion,
                              target = Target},
       _QuestId, Role)
    when Target > 0 ->
    Num = fashion:count(Role, Target),
    #quest_progress{target_val = TarVal, value = OldVal} =
        Prog,
    if Num >= TarVal ->
           Prog#quest_progress{finish = 1, value = TarVal};
       Num > OldVal -> Prog#quest_progress{value = Num};
       true -> Prog
    end;
update(Prog = #quest_progress{label = evt_fashion},
       _QuestId, Role) ->
    Num = fashion:count(Role, suit),
    #quest_progress{target_val = TarVal, value = OldVal} =
        Prog,
    if Num >= TarVal ->
           Prog#quest_progress{finish = 1, value = TarVal};
       Num > OldVal -> Prog#quest_progress{value = Num};
       true -> Prog
    end;
update(Prog = #quest_progress{label = evt_qualifying,
                              param = [rank_point]},
       _QuestId,
       #role{m_qualifying =
                 #m_qualifying{rank_point = Point}}) ->
    #quest_progress{target_val = TarVal, value = OldVal} =
        Prog,
    if Point >= TarVal ->
           Prog#quest_progress{finish = 1, value = TarVal};
       Point > OldVal -> Prog#quest_progress{value = Point};
       true -> Prog
    end;
update(Prog = #quest_progress{label = evt_qualifying,
                              param = [day_win]},
       _QuestId,
       #role{m_qualifying =
                 #m_qualifying{day_win = DayWin}}) ->
    #quest_progress{target_val = TarVal, value = OldVal} =
        Prog,
    if DayWin >= TarVal ->
           Prog#quest_progress{finish = 1, value = TarVal};
       DayWin > OldVal -> Prog#quest_progress{value = DayWin};
       true -> Prog
    end;
update(Prog = #quest_progress{label =
                                  evt_blacksmith_embed_lev,
                              target = Target},
       _QuestId,
       #role{name = _Name, p_eqm = #package{items = Items}}) ->
    AttrList = lists:append([Attr
                             || #item{attr = Attr} <- Items]),
    StoneList = [blacksmith_data:get_stone(Val)
                 || #attr_base{type = 3, val = Val} <- AttrList,
                    Val > 0],
    Count = erlang:length([Lev
                           || #{lev := Lev} <- StoneList, Lev >= Target]),
    logger:debug("装备镶嵌宝石等级[~ts]~w",
                 [_Name, {Count}],
                 quest_prog_init,
                 451),
    #quest_progress{target_val = TarVal, value = OldVal} =
        Prog,
    if Count >= TarVal ->
           Prog#quest_progress{finish = 1, value = TarVal};
       Count > OldVal -> Prog#quest_progress{value = Count};
       true -> Prog
    end;
update(Prog = #quest_progress{label = evt_enchant,
                              target = Target},
       _QuestId,
       #role{name = _Name, p_eqm = #package{items = Items}}) ->
    Count = erlang:length([1
                           || #item{enchant = Enchant} <- Items,
                              Enchant >= Target]),
    #quest_progress{target_val = TarVal, value = OldVal} =
        Prog,
    if Count >= TarVal ->
           Prog#quest_progress{finish = 1, value = TarVal};
       Count > OldVal -> Prog#quest_progress{value = Count};
       true -> Prog
    end;
update(Prog = #quest_progress{label =
                                  evt_teacher_to_sudent},
       _QuestId,
       #role{m_teacher = #m_teacher{status = Status}})
    when Status == 1 orelse Status == 2 ->
    #quest_progress{target_val = TarVal, value = OldVal} =
        Prog,
    if 1 >= TarVal ->
           Prog#quest_progress{finish = 1, value = TarVal};
       1 > OldVal -> Prog#quest_progress{value = 1};
       true -> Prog
    end;
update(Prog = #quest_progress{label =
                                  evt_teacher_to_sudent},
       _QuestId, #role{lev = Lev})
    when Lev >= 50 ->
    #quest_progress{target_val = TarVal, value = OldVal} =
        Prog,
    if 1 >= TarVal ->
           Prog#quest_progress{finish = 1, value = TarVal};
       1 > OldVal -> Prog#quest_progress{value = 1};
       true -> Prog
    end;
update(Prog = #quest_progress{label = evt_teacher},
       _QuestId,
       #role{id = RoleId,
             m_teacher = #m_teacher{status = 3}}) ->
    case teacher_mgr:lookup(RoleId) of
        #teacher{students = Students} ->
            #quest_progress{target_val = TarVal, value = OldVal} =
                Prog,
            if length(Students) >= TarVal ->
                   Prog#quest_progress{finish = 1, value = TarVal};
               length(Students) > OldVal ->
                   Prog#quest_progress{value = length(Students)};
               true -> Prog
            end;
        _ ->
            #quest_progress{target_val = TarVal, value = OldVal} =
                Prog,
            if 1 >= TarVal ->
                   Prog#quest_progress{finish = 1, value = TarVal};
               1 > OldVal -> Prog#quest_progress{value = 1};
               true -> Prog
            end
    end;
update(Prog = #quest_progress{label =
                                  evt_comprehend_eqm,
                              param = [{craft_num, CraftLev}]},
       _QuestId, Role) ->
    Num = eqm:calc_comprehend_craft_num(Role, CraftLev),
    #quest_progress{target_val = TarVal, value = OldVal} =
        Prog,
    if Num >= TarVal ->
           Prog#quest_progress{finish = 1, value = TarVal};
       Num > OldVal -> Prog#quest_progress{value = Num};
       true -> Prog
    end;
update(Prog = #quest_progress{label = evt_tournament,
                              param = [win_count]},
       _QuestId, _Role = #role{id = Id}) ->
    Num = case tournament_agent:get_profile(Id) of
              #tournament_profile{best_win_count = WinCount} ->
                  WinCount;
              _ -> 0
          end,
    #quest_progress{target_val = TarVal, value = OldVal} =
        Prog,
    if Num >= TarVal ->
           Prog#quest_progress{finish = 1, value = TarVal};
       Num > OldVal -> Prog#quest_progress{value = Num};
       true -> Prog
    end;
update(Prog = #quest_progress{label = evt_tournament,
                              param = [rank_lev]},
       _QuestId, _Role = #role{id = Id}) ->
    Num = case tournament_agent:get_profile(Id) of
              #tournament_profile{rank_lev = RankLev} -> RankLev;
              _ -> 1
          end,
    #quest_progress{target_val = TarVal, value = OldVal} =
        Prog,
    if Num >= TarVal ->
           Prog#quest_progress{finish = 1, value = TarVal};
       Num > OldVal -> Prog#quest_progress{value = Num};
       true -> Prog
    end;
update(Prog = #quest_progress{label = evt_tournament,
                              param = [liked]},
       _QuestId, _Role = #role{id = Id}) ->
    Num = case tournament_agent:get_profile(Id) of
              #tournament_profile{liked = Liked} -> Liked;
              _ -> 0
          end,
    #quest_progress{target_val = TarVal, value = OldVal} =
        Prog,
    if Num >= TarVal ->
           Prog#quest_progress{finish = 1, value = TarVal};
       Num > OldVal -> Prog#quest_progress{value = Num};
       true -> Prog
    end;
update(Prog = #quest_progress{label = evt_tournament,
                              param = [awesome_kill]},
       _QuestId, _Role = #role{id = Id}) ->
    Num = case tournament_agent:get_profile(Id) of
              #tournament_profile{awesome_kill = AwesomeKill} ->
                  AwesomeKill;
              _ -> 0
          end,
    #quest_progress{target_val = TarVal, value = OldVal} =
        Prog,
    if Num >= TarVal ->
           Prog#quest_progress{finish = 1, value = TarVal};
       Num > OldVal -> Prog#quest_progress{value = Num};
       true -> Prog
    end;
update(Prog = #quest_progress{label = evt_tournament,
                              param = [awesome_kill_num]},
       _QuestId, _Role = #role{id = Id}) ->
    Num = case tournament_agent:get_profile(Id) of
              #tournament_profile{awesome_kill_num =
                                      AwesomeKillNum} ->
                  AwesomeKillNum;
              _ -> 0
          end,
    #quest_progress{target_val = TarVal, value = OldVal} =
        Prog,
    if Num >= TarVal ->
           Prog#quest_progress{finish = 1, value = TarVal};
       Num > OldVal -> Prog#quest_progress{value = Num};
       true -> Prog
    end;
update(Prog = #quest_progress{label = evt_tournament,
                              param = [awesome_dmg]},
       _QuestId, _Role = #role{id = Id}) ->
    Num = case tournament_agent:get_profile(Id) of
              #tournament_profile{awesome_dmg = AwesomeDmg} ->
                  AwesomeDmg;
              _ -> 0
          end,
    #quest_progress{target_val = TarVal, value = OldVal} =
        Prog,
    if Num >= TarVal ->
           Prog#quest_progress{finish = 1, value = TarVal};
       Num > OldVal -> Prog#quest_progress{value = Num};
       true -> Prog
    end;
update(Prog = #quest_progress{label = evt_tournament,
                              param = [awesome_heal]},
       _QuestId, _Role = #role{id = Id}) ->
    Num = case tournament_agent:get_profile(Id) of
              #tournament_profile{awesome_heal = AwesomeHeal} ->
                  AwesomeHeal;
              _ -> 0
          end,
    #quest_progress{target_val = TarVal, value = OldVal} =
        Prog,
    if Num >= TarVal ->
           Prog#quest_progress{finish = 1, value = TarVal};
       Num > OldVal -> Prog#quest_progress{value = Num};
       true -> Prog
    end;
update(Prog = #quest_progress{label = evt_tournament,
                              param = [awesome_control]},
       _QuestId, _Role = #role{id = Id}) ->
    Num = case tournament_agent:get_profile(Id) of
              #tournament_profile{awesome_control = AwesomeControl} ->
                  AwesomeControl;
              _ -> 0
          end,
    #quest_progress{target_val = TarVal, value = OldVal} =
        Prog,
    if Num >= TarVal ->
           Prog#quest_progress{finish = 1, value = TarVal};
       Num > OldVal -> Prog#quest_progress{value = Num};
       true -> Prog
    end;
update(Prog = #quest_progress{label = evt_tournament,
                              param = [mvp]},
       _QuestId, _Role = #role{id = Id}) ->
    Num = case tournament_agent:get_profile(Id) of
              #tournament_profile{mvp = Mvp} -> Mvp;
              _ -> 0
          end,
    #quest_progress{target_val = TarVal, value = OldVal} =
        Prog,
    if Num >= TarVal ->
           Prog#quest_progress{finish = 1, value = TarVal};
       Num > OldVal -> Prog#quest_progress{value = Num};
       true -> Prog
    end;
update(Prog = #quest_progress{label = evt_finish_goal,
                              param = [{complete, GoalList}]},
       _QuestId, _Role = #role{}) ->
    case goal:check_complete_goal(_Role, GoalList) of
        true ->
            #quest_progress{target_val = TarVal, value = OldVal} =
                Prog,
            if 1 >= TarVal ->
                   Prog#quest_progress{finish = 1, value = TarVal};
               1 > OldVal -> Prog#quest_progress{value = 1};
               true -> Prog
            end;
        false -> Prog
    end;
update(Prog = #quest_progress{label = evt_own_mount,
                              target = Status, param = []},
       _QuestId, Role = #role{}) ->
    Count = mount:mount_count(Role, Status),
    #quest_progress{target_val = TarVal, value = OldVal} =
        Prog,
    if Count >= TarVal ->
           Prog#quest_progress{finish = 1, value = TarVal};
       Count > OldVal -> Prog#quest_progress{value = Count};
       true -> Prog
    end;
update(Prog = #quest_progress{label = evt_mount_growth,
                              param = []},
       _QuestId,
       _Role = #role{m_mount = #m_mount{mounts = Mounts}}) ->
    Fun = fun (#mount{growth = Growth}, R) ->
                  max(Growth, R);
              (_, R) -> R
          end,
    MaxGrowth = lists:foldl(Fun, 0, Mounts),
    #quest_progress{target_val = TarVal, value = OldVal} =
        Prog,
    if MaxGrowth >= TarVal ->
           Prog#quest_progress{finish = 1, value = TarVal};
       MaxGrowth > OldVal ->
           Prog#quest_progress{value = MaxGrowth};
       true -> Prog
    end;
update(Prog = #quest_progress{label =
                                  evt_mount_appearand,
                              param = []},
       _QuestId,
       _Role = #role{m_mount =
                         #m_mount{appearance_list = AppearandList}}) ->
    #quest_progress{target_val = TarVal, value = OldVal} =
        Prog,
    if length(AppearandList) >= TarVal ->
           Prog#quest_progress{finish = 1, value = TarVal};
       length(AppearandList) > OldVal ->
           Prog#quest_progress{value = length(AppearandList)};
       true -> Prog
    end;
update(Prog = #quest_progress{label = evt_mount_lev,
                              param = []},
       _QuestId,
       _Role = #role{m_mount = #m_mount{mounts = Mounts}}) ->
    Fun = fun (#mount{live_status = 3, lev = Lev}, R) ->
                  max(Lev, R);
              (_, R) -> R
          end,
    MountLev = lists:foldl(Fun, 0, Mounts),
    #quest_progress{target_val = TarVal, value = OldVal} =
        Prog,
    if MountLev >= TarVal ->
           Prog#quest_progress{finish = 1, value = TarVal};
       MountLev > OldVal ->
           Prog#quest_progress{value = MountLev};
       true -> Prog
    end;
update(Prog = #quest_progress{label = evt_wedding_day,
                              param = []},
       _QuestId, Role) ->
    Day = wedding_memory:marry_day(Role),
    #quest_progress{target_val = TarVal, value = OldVal} =
        Prog,
    if Day >= TarVal ->
           Prog#quest_progress{finish = 1, value = TarVal};
       Day > OldVal -> Prog#quest_progress{value = Day};
       true -> Prog
    end;
update(Prog = #quest_progress{label =
                                  evt_lev_break_contribution,
                              param = [], target_val = TargetVal},
       _QuestId, _Role) ->
    Contribution = case lev_break:get_boss_killed() of
                       1 -> TargetVal;
                       _ -> lev_break:get_contribution()
                   end,
    #quest_progress{target_val = TarVal, value = OldVal} =
        Prog,
    if Contribution >= TarVal ->
           Prog#quest_progress{finish = 1, value = TarVal};
       Contribution > OldVal ->
           Prog#quest_progress{value = Contribution};
       true -> Prog
    end;
update(Prog = #quest_progress{label =
                                  evt_lev_break_boss,
                              param = []},
       _QuestId, _Role) ->
    BossKiled = lev_break:get_boss_killed(),
    #quest_progress{target_val = TarVal, value = OldVal} =
        Prog,
    if BossKiled >= TarVal ->
           Prog#quest_progress{finish = 1, value = TarVal};
       BossKiled > OldVal ->
           Prog#quest_progress{value = BossKiled};
       true -> Prog
    end;
update(Prog = #quest_progress{label =
                                  evt_lev_break_trial,
                              param = []},
       _QuestId, Role) ->
    Trial = lev_break:get_trial(Role),
    #quest_progress{target_val = TarVal, value = OldVal} =
        Prog,
    if Trial >= TarVal ->
           Prog#quest_progress{finish = 1, value = TarVal};
       Trial > OldVal -> Prog#quest_progress{value = Trial};
       true -> Prog
    end;
update(Prog = #quest_progress{label = evt_lev_break,
                              param = []},
       _QuestId,
       _Role = #role{m_lev_break =
                         #m_lev_break{times = Times}}) ->
    #quest_progress{target_val = TarVal, value = OldVal} =
        Prog,
    if Times >= TarVal ->
           Prog#quest_progress{finish = 1, value = TarVal};
       Times > OldVal -> Prog#quest_progress{value = Times};
       true -> Prog
    end;
update(Prog = #quest_progress{label = evt_sworn_finish,
                              param = []},
       _QuestId, Role) ->
    #sworn_evt{finish = Times} = sworn:fetch_evt(Role),
    #quest_progress{target_val = TarVal, value = OldVal} =
        Prog,
    if Times >= TarVal ->
           Prog#quest_progress{finish = 1, value = TarVal};
       Times > OldVal -> Prog#quest_progress{value = Times};
       true -> Prog
    end;
update(Prog = #quest_progress{label = evt_sworn_invite,
                              param = []},
       _QuestId, Role) ->
    #sworn_evt{invite = Times} = sworn:fetch_evt(Role),
    #quest_progress{target_val = TarVal, value = OldVal} =
        Prog,
    if Times >= TarVal ->
           Prog#quest_progress{finish = 1, value = TarVal};
       Times > OldVal -> Prog#quest_progress{value = Times};
       true -> Prog
    end;
update(Prog = #quest_progress{label = evt_sworn_name,
                              param = []},
       _QuestId, Role) ->
    #sworn_evt{prefix = Times} = sworn:fetch_evt(Role),
    #quest_progress{target_val = TarVal, value = OldVal} =
        Prog,
    if Times >= TarVal ->
           Prog#quest_progress{finish = 1, value = TarVal};
       Times > OldVal -> Prog#quest_progress{value = Times};
       true -> Prog
    end;
update(Prog = #quest_progress{label =
                                  evt_sworn_name_defined,
                              param = []},
       _QuestId, Role) ->
    #sworn_evt{personal = Times} = sworn:fetch_evt(Role),
    #quest_progress{target_val = TarVal, value = OldVal} =
        Prog,
    if Times >= TarVal ->
           Prog#quest_progress{finish = 1, value = TarVal};
       Times > OldVal -> Prog#quest_progress{value = Times};
       true -> Prog
    end;
update(Prog = #quest_progress{label = evt_sworn_skill,
                              param = []},
       _QuestId, Role) ->
    #sworn_evt{skill = Times} = sworn:fetch_evt(Role),
    #quest_progress{target_val = TarVal, value = OldVal} =
        Prog,
    if Times >= TarVal ->
           Prog#quest_progress{finish = 1, value = TarVal};
       Times > OldVal -> Prog#quest_progress{value = Times};
       true -> Prog
    end;
update(Prog = #quest_progress{label = evt_child_info,
                              param = [{growth_num, Type}]},
       _QuestId, #role{m_child = #m_child{kids = Kids}}) ->
    Num = length([Growth
                  || #child{growth_type = Growth, stage = 3} <- Kids,
                     Growth =:= Type]),
    #quest_progress{target_val = TarVal, value = OldVal} =
        Prog,
    if Num >= TarVal ->
           Prog#quest_progress{finish = 1, value = TarVal};
       Num > OldVal -> Prog#quest_progress{value = Num};
       true -> Prog
    end;
update(Prog = #quest_progress{label = evt_child_info,
                              param = [skill_num]},
       _QuestId, #role{m_child = #m_child{kids = Kids}}) ->
    case [length(Sks ++ TSks)
          || #child{skills = Sks, talent_skills = TSks} <- Kids]
        of
        [] -> Prog;
        SNums ->
            Num = lists:max(SNums),
            #quest_progress{target_val = TarVal, value = OldVal} =
                Prog,
            if Num >= TarVal ->
                   Prog#quest_progress{finish = 1, value = TarVal};
               Num > OldVal -> Prog#quest_progress{value = Num};
               true -> Prog
            end
    end;
update(Prog = #quest_progress{label = evt_child_info,
                              param = [talent_skill_max_lev]},
       _QuestId, #role{m_child = #m_child{kids = Kids}}) ->
    Tlvs1 = [[Tlv || #child_talent_skill{lev = Tlv} <- TSks]
             || #child{talent_skills = TSks} <- Kids, TSks =/= []],
    case [lists:max(STlvs) || STlvs <- Tlvs1, STlvs =/= []]
        of
        [] -> Prog;
        Tlvs2 ->
            MaxLev = lists:max(Tlvs2),
            #quest_progress{target_val = TarVal, value = OldVal} =
                Prog,
            if MaxLev >= TarVal ->
                   Prog#quest_progress{finish = 1, value = TarVal};
               MaxLev > OldVal -> Prog#quest_progress{value = MaxLev};
               true -> Prog
            end
    end;
update(Prog = #quest_progress{label = evt_child_info,
                              param = [talent_skill_sum_lev]},
       _QuestId, #role{m_child = #m_child{kids = Kids}}) ->
    case [lists:sum([Tlv
                     || #child_talent_skill{lev = Tlv} <- TSks])
          || #child{talent_skills = TSks} <- Kids]
        of
        [] -> Prog;
        Tlvs ->
            MaxLev = lists:max(Tlvs),
            #quest_progress{target_val = TarVal, value = OldVal} =
                Prog,
            if MaxLev >= TarVal ->
                   Prog#quest_progress{finish = 1, value = TarVal};
               MaxLev > OldVal -> Prog#quest_progress{value = MaxLev};
               true -> Prog
            end
    end;
update(Prog = #quest_progress{label = evt_child_study,
                              param = [{score, Score}]},
       _QuestId, #role{m_child = #m_child{kids = Kids}}) ->
    Num = length([I
                  || #child{id = I,
                            child_attr =
                                #child_attr{study_str = Str, study_con = Con,
                                            study_mag = Mag, study_agi = Agi,
                                            study_end = End}}
                         <- Kids,
                     lists:max([Str, Con, Mag, Agi, End]) >= Score]),
    #quest_progress{target_val = TarVal, value = OldVal} =
        Prog,
    if Num >= TarVal ->
           Prog#quest_progress{finish = 1, value = TarVal};
       Num > OldVal -> Prog#quest_progress{value = Num};
       true -> Prog
    end;
update(Prog = #quest_progress{label = evt_maze_gold,
                              param = []},
       _QuestId, Role) ->
    Val = var:get_var(Role, other, 2085, 0),
    #quest_progress{target_val = TarVal, value = OldVal} =
        Prog,
    if Val >= TarVal ->
           Prog#quest_progress{finish = 1, value = TarVal};
       Val > OldVal -> Prog#quest_progress{value = Val};
       true -> Prog
    end;
update(Prog = #quest_progress{label = evt_kingbadge,
                              target = 233},
       _QuestId,
       #role{m_tournament =
                 #m_tournament{kingbadge = BadgeList}}) ->
    HList = [BadgeId
             || #king_badge{id = BadgeId, status = Status}
                    <- BadgeList,
                Status =:= 1],
    case lists:member(233, HList) of
        true ->
            logger:debug("========", [], quest_prog_init, 667),
            #quest_progress{target_val = TarVal, value = OldVal} =
                Prog,
            if 1 >= TarVal ->
                   Prog#quest_progress{finish = 1, value = TarVal};
               1 > OldVal -> Prog#quest_progress{value = 1};
               true -> Prog
            end;
        _ -> Prog
    end;
update(Prog = #quest_progress{label =
                                  evt_gods_duel_score,
                              param = []},
       _QuestId,
       #role{id = RoleId,
             m_gods_duel = #m_gods_duel{gods_score = OldScore}}) ->
    case ets:lookup(gods_duel_profile, RoleId) of
        [#gods_duel_profile{gods_duel_score = NScore}] ->
            case NScore >= OldScore of
                true ->
                    #quest_progress{target_val = TarVal, value = OldVal} =
                        Prog,
                    if NScore >= TarVal ->
                           Prog#quest_progress{finish = 1, value = TarVal};
                       NScore > OldVal -> Prog#quest_progress{value = NScore};
                       true -> Prog
                    end;
                false -> Prog
            end;
        _ -> Prog
    end;
update(Prog, _QuestId, _Role) -> Prog.

get_rand_find_item(Prog = #quest_progress{ext_data =
                                              ExtData},
                   QuestId, Role = #role{classes = Classes}) ->
    case quest_data:get(QuestId) of
        #quest_data{sec_type = 4} ->
            case quest_classes:get_rand_find_item(QuestId, Role) of
                {_Type, ItemBaseId} ->
                    Prog#quest_progress{target = ItemBaseId,
                                        ext_data = [{3, ItemBaseId} | ExtData]};
                Unknow ->
                    logger:error("=。=！悲剧了，职业任务的寻物任务没有找到寻物物品[~w]",
                                 [Unknow],
                                 quest_prog_init,
                                 698),
                    Prog
            end;
        #quest_data{sec_type = 12} ->
            case quest_guild:get_rand_find_item(QuestId, Role) of
                {_Type, ItemBaseId} ->
                    Prog#quest_progress{target = ItemBaseId,
                                        ext_data = [{3, ItemBaseId} | ExtData]};
                Unknow ->
                    logger:error("=。=！悲剧了，公会任务的寻物任务没有找到寻物物品[~w]",
                                 [Unknow],
                                 quest_prog_init,
                                 706),
                    Prog
            end;
        #quest_data{sec_type = 21} ->
            case quest_pursue:get_rand_find_item(QuestId, Role) of
                {_Type, ItemBaseId} ->
                    Prog#quest_progress{target = ItemBaseId,
                                        ext_data = [{3, ItemBaseId} | ExtData]};
                Unknow ->
                    logger:error("=。=！悲剧了，公会任务的寻物任务没有找到寻物物品[~w]",
                                 [Unknow],
                                 quest_prog_init,
                                 714),
                    Prog
            end;
        #quest_data{sec_type = 23} ->
            case quest_child:get_rand_find_item(QuestId, Role) of
                {_Type, ItemBaseId} ->
                    Prog#quest_progress{target = ItemBaseId,
                                        ext_data = [{3, ItemBaseId} | ExtData]};
                Unknow ->
                    case Prog of
                        #quest_progress{param = [{item_type, ItemType}]} ->
                            Prog#quest_progress{ext_data =
                                                    [{9, ItemType} | ExtData]};
                        _ ->
                            logger:error("=。=！悲剧了，子女任务的寻物任务没有找到寻物物品[~w]",
                                         [Unknow],
                                         quest_prog_init,
                                         726),
                            Prog
                    end
            end;
        #quest_data{sec_type = 24} ->
            case quest_pregnancy:get_rand_find_item(QuestId, Role)
                of
                {_Type, ItemBaseId} ->
                    Prog#quest_progress{target = ItemBaseId,
                                        ext_data = [{3, ItemBaseId} | ExtData]};
                Unknow ->
                    case Prog of
                        #quest_progress{param = [{item_type, ItemType}]} ->
                            Prog#quest_progress{ext_data =
                                                    [{9, ItemType} | ExtData]};
                        _ ->
                            logger:error("=。=！悲剧了，孕育任务的寻物任务没有找到寻物物品[~w]",
                                         [Unknow],
                                         quest_prog_init,
                                         739),
                            Prog
                    end
            end;
        #quest_data{sec_type = 25} ->
            case quest_acquaintance:get_rand_find_item(QuestId,
                                                       Role)
                of
                {_Type, ItemBaseId} ->
                    Prog#quest_progress{target = ItemBaseId,
                                        ext_data = [{3, ItemBaseId} | ExtData]};
                Unknow ->
                    case Prog of
                        #quest_progress{param = [{item_type, ItemType}]} ->
                            Prog#quest_progress{ext_data =
                                                    [{9, ItemType} | ExtData]};
                        _ ->
                            logger:error("=。=！悲剧了，孕育任务的寻物任务没有找到寻物物品[~w]",
                                         [Unknow],
                                         quest_prog_init,
                                         752),
                            Prog
                    end
            end;
        _ ->
            case quest_data:get(QuestId) of
                #quest_data{extra = ExtraList} ->
                    List = [I
                            || I = #quest_extra_data{name = 1,
                                                     classes = IClasses}
                                   <- ExtraList,
                               IClasses == 0 orelse IClasses == Classes],
                    case util:rand_list(List) of
                        #quest_extra_data{val1 = ItemBaseId} ->
                            Prog#quest_progress{target = ItemBaseId,
                                                ext_data =
                                                    [{3, ItemBaseId}
                                                     | ExtData]};
                        _ -> Prog
                    end;
                _ -> Prog
            end
    end.

