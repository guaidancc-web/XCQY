-file("src/mod/quest/quest_progress.erl", 1).

-module(quest_progress).

-export([event/7,
         monitor_event/8,
         remove_monitor/4,
         monitor_quest_prog/4]).

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

-file("src/mod/quest/quest_progress.erl", 15).

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

-file("src/mod/quest/quest_progress.erl", 16).

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

-file("src/mod/quest/quest_progress.erl", 17).

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

-file("src/mod/quest/quest_progress.erl", 18).

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

-file("src/mod/quest/quest_progress.erl", 19).

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

-file("src/mod/quest/quest_progress.erl", 20).

-file("inc/package.hrl", 1).

-record(package,
        {type = 1 :: integer(),
         next_id = 1 :: pos_integer(),
         volume = 0 :: non_neg_integer(),
         free_cell = [] :: list(),
         items = [] :: [tuple()]}).

-file("src/mod/quest/quest_progress.erl", 21).

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

-file("src/mod/quest/quest_progress.erl", 22).

-file("inc/link.hrl", 1).

-record(link,
        {socket :: undefined | port(),
         conn_pid :: undefined | pid(),
         ip = {0, 0, 0, 0} :: {0..255, 0..255, 0..255, 0..255},
         port = 0 :: non_neg_integer(),
         lag = 0 :: non_neg_integer()}).

-file("src/mod/quest/quest_progress.erl", 23).

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

-file("src/mod/quest/quest_progress.erl", 24).

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

-file("src/mod/quest/quest_progress.erl", 25).

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

-file("src/mod/quest/quest_progress.erl", 26).

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

-file("src/mod/quest/quest_progress.erl", 27).

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

-file("src/mod/quest/quest_progress.erl", 28).

-file("inc/battle.hrl", 1).

-record(battle_base,
        {id = 1 :: pos_integer(),
         type = 1 :: pos_integer(),
         sub_id = 0,
         sub_type = 0,
         name :: undefined | atom(),
         pid :: undefined | undefine | pid(),
         global = [] :: list(),
         map = [] :: list(),
         unit = [] :: list(),
         point = [] :: list(),
         trigger = [] :: list(),
         enter_point = {0, 0, 0} ::
             {non_neg_integer(),
              non_neg_integer(),
              non_neg_integer()}}).

-record(battle,
        {id = 1 :: pos_integer(),
         type = 1 :: pos_integer(),
         sub_id = 0,
         sub_type = 0,
         name :: undefined | atom(),
         pid :: undefined | undefine | pid(),
         map = [] :: list(),
         enter_point = {0, 0, 0} ::
             {non_neg_integer(),
              non_neg_integer(),
              non_neg_integer()},
         ext = [],
         role_id = {0, "", 0}}).

-record(battle_context,
        {grade = 1 :: pos_integer(),
         score = 0 :: non_neg_integer(),
         round = 0 :: non_neg_integer(),
         max_dmg = 0 :: non_neg_integer(),
         hurt = 0 :: non_neg_integer(),
         ratio_val = 0,
         die_num = 0}).

-record(battle_role,
        {id,
         status = 1,
         pid,
         name,
         sex = 0 :: 0..1,
         classes = 0 :: 0..6,
         lev = 0 :: non_neg_integer(),
         is_kill_boss = 0 :: 0..1,
         sub_id = 0 :: non_neg_integer(),
         flip_cards = [] :: [],
         has_reward_floor = [],
         context = #battle_context{}}).

-record(battle_combat_info,
        {sub_id = 0, sub_type = 0, gains = []}).

-record(battle_trigger,
        {name :: undefined | bitstring(),
         status = open :: open | close,
         event = [] :: [tuple()],
         vars = [] :: [tuple()],
         condition = [] :: [tuple()],
         action = [] :: list()}).

-record(tri_timer,
        {mode :: undefined | cycle | count,
         times = 0 :: integer(),
         timeout = 1000 :: pos_integer()}).

-record(cfg_act,
        {tpl :: undefined | atom(), cfg = [] :: list()}).

-record(tpl_act,
        {name = "" :: string(),
         type :: undefined | atom(),
         code = "" :: string(),
         args = [] :: list(),
         desc = "" :: string()}).

-record(cfg_cond,
        {tpl = "" :: string(), cfg = [] :: list()}).

-record(tpl_cond,
        {name = "" :: string(),
         code = "" :: string(),
         args = [] :: list(),
         desc = "" :: string()}).

-record(cfg_evt,
        {tpl = "" :: string(), cfg = [] :: list()}).

-record(tpl_evt,
        {name = "" :: string(),
         code = "" :: string(),
         args = [] :: list(),
         desc = "" :: string()}).

-record(cfg_val,
        {tpl = "" :: string(), cfg = [] :: list()}).

-record(tpl_val,
        {name = "" :: string(),
         code = "" :: string(),
         args = [] :: list(),
         desc = "" :: string()}).

-record(cfg_unit,
        {tpl = "" :: string(), cfg = [] :: list()}).

-record(tpl_unit,
        {name = "" :: string(),
         code = "" :: string(),
         args = [] :: list(),
         desc = "" :: string()}).

-record(point,
        {map = 1 :: pos_integer(),
         x = 0 :: non_neg_integer(),
         y = 0 :: non_neg_integer()}).

-record(tpl_fun,
        {name :: undefined | atom(),
         return :: undefined | unit | point,
         args = [] :: [atom()],
         code = "" :: string(),
         mfa_code = "" :: string(),
         label = "" :: string(),
         desc = "" :: string()}).

-file("src/mod/quest/quest_progress.erl", 29).

-file("inc/dungeon.hrl", 1).

-record(m_dungeon,
        {ver = 4,
         dun_id = 0,
         battle_id = 0,
         cards = [],
         unit_rewards = [],
         unit_rewarded = 0}).

-record(dungeon_base,
        {id = 0,
         name = "",
         type = 2,
         need_num = 1,
         cond_enter = [],
         cond_loss = [],
         cross_cond_enter = [],
         cross_cond_loss = [],
         exit_pos = last ::
             last |
             {non_neg_integer(),
              non_neg_integer(),
              non_neg_integer()},
         battle_name_list = [],
         lev_interval = 0,
         unit_list = [],
         lev_max = 0,
         team_dungeon = 0}).

-record(dungeon_role_info,
        {id = {0, "", 0} ::
             {non_neg_integer(), bitstring(), non_neg_integer()},
         score_list = [] :: [tuple()]}).

-record(dungeon_unit_count, {id = 0, num = 0}).

-record(dungeon_score,
        {id = 0,
         score = 0 :: non_neg_integer(),
         grade = 1 :: pos_integer()}).

-record(dungeon_lord_data,
        {unit_id = 0,
         id = 0,
         floor = 0,
         map_id = 0,
         is_lord = 0,
         msg = ""}).

-record(dungeon_lord,
        {key = {0, 0},
         dun_id = 0,
         floor = 0,
         lords = [],
         ranks = []}).

-record(dungeon_lord_role,
        {id,
         name,
         sex = 0 :: 0..1,
         classes = 0 :: 0..6,
         lev = 0 :: non_neg_integer(),
         looks = []}).

-record(dungeon_rank_role,
        {id,
         name,
         sex = 0 :: 0..1,
         classes = 0 :: 0..6,
         lev = 0 :: non_neg_integer(),
         fc = 0,
         looks = [],
         up = 1,
         rank = 0,
         val1 = 0,
         val2 = 0,
         val3 = 0,
         val4 = 0,
         msg1 = "",
         msg2 = "",
         msg3 = ""}).

-record(dungeon_first,
        {key = {0, 0}, dun_id = 0, floor = 0, roles = []}).

-record(dungeon_first_role,
        {id,
         name,
         sex = 0 :: 0..1,
         classes = 0 :: 0..6,
         lev = 0 :: non_neg_integer()}).

-record(dungeon_reward_data,
        {id = 0,
         floor = 0,
         type = 0,
         item_list = [],
         title = "",
         msg = "",
         cast_msg = ""}).

-record(dungeon_team,
        {id = {0, "", 0} :: tuple(),
         leader :: undefined | tuple(),
         members = [] :: list(),
         member_num = 1 :: non_neg_integer(),
         dun_id = 0 :: non_neg_integer(),
         status = 0 :: non_neg_integer(),
         kicked = [] :: list()}).

-record(dungeon_enlistment,
        {id = {0, "", 0} :: tuple(),
         member_num = 1 :: non_neg_integer(),
         dun_id = 0 :: non_neg_integer(),
         leader :: undefined | tuple()}).

-record(dungeon_mate,
        {id = {0, "", 0} :: tuple(),
         name = "" :: string(),
         pid :: undefined | pid(),
         face_id = 0 :: non_neg_integer(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         lev_break_times = 0 :: non_neg_integer(),
         status = 3 :: non_neg_integer(),
         looks = [] :: list(),
         fc = 0 :: non_neg_integer(),
         dun_id = 0 :: non_neg_integer(),
         team_id = {0, "", 0} :: tuple(),
         matched = 0 :: non_neg_integer(),
         join_time = 0 :: non_neg_integer(),
         origin_ids = [] :: list()}).

-record(dungeon_invitation,
        {id = {0, "", 0},
         name = "",
         lev = 0,
         classes = 0,
         sex = 0,
         type = 1,
         team_id = {0, "", 0},
         dun_id = 0,
         dun_name = "",
         time = 0}).

-record(dungeon_card,
        {item_id = 0,
         item_num = 0,
         announce = 0,
         selected = 0}).

-file("src/mod/quest/quest_progress.erl", 30).

-file("inc/trial.hrl", 1).

-record(trial_unit,
        {battle_id = 0,
         unit_id = 0,
         unit_baseid = 0,
         unit_name = "",
         classes = 0,
         sex = 0,
         lev = 0,
         dir = 0,
         looks = [],
         map_id = 0,
         x = 0,
         y = 0}).

-record(m_trial,
        {ver = 3,
         mode = 0,
         order = 0,
         fighter,
         unit = #trial_unit{},
         direct_order = 0,
         clear_normal = 0,
         round = 0,
         times = 2,
         coin = 0,
         reset = 2,
         max_order_easy = 0,
         max_order_hard = 0,
         has_match = [],
         is_helped = "",
         gain_items = []}).

-record(trial_help,
        {id = {0, "", 0},
         name = "",
         lev = 0,
         classes = 0,
         sex = 0,
         type = 1,
         unit_id = 0,
         battle_id = 0,
         unit_name = "",
         time = 0}).

-file("src/mod/quest/quest_progress.erl", 31).

-file("inc/parade.hrl", 1).

-record(m_parade,
        {ver = 0 :: non_neg_integer(),
         pid :: undefined | pid()}).

-record(parade_procession,
        {id = {0, 0} :: {non_neg_integer(), non_neg_integer()},
         map_id = 0 :: non_neg_integer(),
         map_pid :: undefined | pid(),
         unit_base_id = 0 :: non_neg_integer(),
         unit_id = 0 :: non_neg_integer(),
         pid :: undefined | non_neg_integer(),
         participants = [],
         num = 0,
         path = [],
         move_next = [],
         x = 0 :: non_neg_integer(),
         y = 0 :: non_neg_integer(),
         move_ref :: undefined | reference()}).

-record(parade_participant,
        {ver = 0,
         id :: undefined | tuple(),
         name = "" :: string(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         guild = "" :: non_neg_integer(),
         guild_id = {0, "", 0} :: non_neg_integer(),
         guild_post = "" :: non_neg_integer(),
         pid :: undefined | pid(),
         procession_id = 0 :: non_neg_integer(),
         joined = 0 :: non_neg_integer(),
         exp = 0 :: non_neg_integer(),
         figure = 0 :: non_neg_integer(),
         figure_score = 0 :: non_neg_integer(),
         last_ate = 0 :: non_neg_integer(),
         has_food = 0 :: non_neg_integer(),
         map_id = 0 :: non_neg_integer(),
         map_grid_pid = 0 :: non_neg_integer(),
         final_rewarded = 0 :: non_neg_integer()}).

-file("src/mod/quest/quest_progress.erl", 32).

-file("inc/escort.hrl", 1).

-record(m_escort,
        {ver = 0,
         quest_id = 32000 :: non_neg_integer(),
         image_id = 0 :: non_neg_integer(),
         start_time = 0 :: non_neg_integer(),
         robed_by_npc = 0 :: non_neg_integer(),
         robed_num = 0 :: non_neg_integer(),
         rob_by_roles = [] :: [tuple()],
         last_robed = 0 :: non_neg_integer(),
         gain_type = 0 :: non_neg_integer(),
         total_num = 0 :: non_neg_integer(),
         question = 0 :: non_neg_integer(),
         question_time = 0 :: non_neg_integer(),
         answered = 0 :: non_neg_integer(),
         corrected = 0 :: non_neg_integer(),
         done_lottery = 0 :: non_neg_integer(),
         mid_unit_id = {0, 0} ::
             {non_neg_integer(), non_neg_integer()},
         box_unit_id = 0 :: non_neg_integer(),
         box_hp = 0 :: non_neg_integer(),
         box_max_hp = 0 :: non_neg_integer(),
         pass_question = [] :: [non_neg_integer()]}).

-file("src/mod/quest/quest_progress.erl", 33).

-file("inc/shipping.hrl", 1).

-record(m_shipping, {ver = 1, total_num = 0}).

-record(shipping,
        {rid = {1, "", 0},
         world_lev = 0,
         role_lev = 0,
         type = 1,
         status = 0,
         reset_time = 0,
         start_time = 0,
         help = 0,
         show_list = [],
         cells = []}).

-record(shipping_cell,
        {ver = 1,
         id = 0,
         type = 1,
         status = 1,
         help_type = 0,
         pack_type = 0,
         normal_rewards = [],
         rewards = [],
         item_base_id = 0,
         need_num = 0,
         help_friends = [],
         help_guild = {"", 0, ""},
         quest_id = 0}).

-record(shipping_cell_data,
        {id = 0,
         classify = 0,
         classes = 0,
         lev = 0,
         item_base_id = 0,
         need_num = 0,
         weight = 0,
         exp = 0,
         ratio = 0,
         quest_id = 0}).

-record(shipping_classify_data,
        {classify = 0,
         min_num = 0,
         max_num = 0,
         is_show = 0,
         weight = 0}).

-record(shipping_cell_quset_data,
        {id = 0,
         classify = 0,
         quest_id = 0,
         item_base_id = 0,
         ratio = 0,
         week_min = 0,
         week_max = 0}).

-record(quest_shipping_data,
        {id = 0,
         type = 0,
         ring = 0,
         max_ring = 0,
         next_id = 0,
         rewards = [],
         leader_exp_mode = 0,
         leader_ratio = 0,
         exp_mode = 0,
         ratio = 0}).

-record(quest_shipping_reward_data,
        {id = 0,
         min = 0,
         max = 0,
         ratio = 0,
         rewards = [],
         need_num = 0,
         exp_mode = 0,
         mate_rewards = [],
         mate_exp_mode = 0}).

-file("src/mod/quest/quest_progress.erl", 34).

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

-file("src/mod/quest/quest_progress.erl", 35).

-file("inc/treasure.hrl", 1).

-record(treasure_reward,
        {map_id = 0,
         use_id = 0,
         reward_id = 0,
         reward_time = 0,
         show = []}).

-record(treasure_compass,
        {compass_id = 0,
         use_id = 0,
         compass_endtime = 0,
         map_id = 0,
         x = 0,
         y = 0}).

-record(m_treasure,
        {status = 0,
         reward = #treasure_reward{},
         compass = #treasure_compass{},
         total_count = 0}).

-record(treasure, {id = 1, type = 1, val = 1, num = 1}).

-record(treasure_data,
        {type = 1,
         val = 1,
         num = 1,
         ratio = 0,
         show_ratio = 0,
         can_show = 1,
         sex = 0,
         lev_low = 0,
         lev_high = 0,
         classes = 0,
         break_times_min = 0,
         break_times_max = 0}).

-file("src/mod/quest/quest_progress.erl", 36).

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

-file("src/mod/quest/quest_progress.erl", 37).

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

-file("src/mod/quest/quest_progress.erl", 38).

-file("inc/team.hrl", 1).

-record(team,
        {ver = 0,
         pid :: undefined | pid(),
         leader,
         members = [] :: list(),
         applys = [],
         pos :: undefined | tuple(),
         member_num = 1,
         status = 0,
         matched = 0 :: non_neg_integer(),
         is_fly = 0 :: 0 | 1,
         order = [],
         team_formation = 1,
         team_formation_lev = 1,
         usurpers = [],
         type = 0,
         lev_flag = 0,
         lev_min = 0,
         lev_max = 0,
         last_join_time = 0,
         combat_num = 0,
         chat_recruit_info = [],
         target = 0,
         cross_type = 0,
         dun_id = 0}).

-record(m_team,
        {ver = 0,
         pid :: undefined | pid(),
         status = 3 :: non_neg_integer(),
         applys = [],
         mod = 0,
         speed = 0,
         recruitment_time = 0,
         recruitment_ids = lists:seq(1, 5),
         recruitment = [],
         member_num = 0}).

-record(team_mate,
        {ver = 0,
         id = {0, "", 0},
         name = "",
         pid :: undefined | pid(),
         face_id = 0 :: non_neg_integer(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         lev_break_times = 0 :: non_neg_integer(),
         status = 3 :: non_neg_integer(),
         looks = [] :: list(),
         fc = 0 :: non_neg_integer(),
         expect_type = [] :: non_neg_integer(),
         s_ride = 0,
         team_pid :: undefined | pid(),
         matched = 0 :: non_neg_integer(),
         formation_id = 1,
         formation_lev = 1,
         mod = 0,
         speed = 0,
         join_type = 1,
         join_sub_type = 0,
         join_time = 0,
         combat_num = 0,
         constellation_lev = 0,
         lover_id = {0, "", 0},
         lover_name = "",
         lover_status = 0,
         quest_couple_round = 0}).

-record(team_recruitment,
        {ver = 0,
         id :: undefined | tuple(),
         name = "" :: string(),
         face_id = 0 :: non_neg_integer(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         pid,
         type = 0,
         status = 1,
         member_num = 1,
         inviter_status = 0,
         lev_min = 0,
         lev_max = 0,
         matched = 0 :: non_neg_integer(),
         notice_list = [] :: list(),
         cur_classes = [] :: list(),
         constellation_lev = 0,
         chat_recruit_info = [],
         lover_id = {0, "", 0},
         lover_name = "",
         lover_status = 0,
         quest_couple_round = 0,
         precision_notice_list = [] :: list(),
         cross_type = 0}).

-record(team_recruit_room,
        {lev = 0, role_num = 0, members = []}).

-record(team_usurper,
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

-record(team_recruit_lev_range,
        {flag = 0, lev = 0, val1 = 0, val2 = 0}).

-record(team_start_args, {pos, is_fly = 0, target = 0}).

-file("src/mod/quest/quest_progress.erl", 39).

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

-file("src/mod/quest/quest_progress.erl", 40).

-file("inc/market_silver.hrl", 1).

-record(m_market_silver,
        {ver = 1,
         refresh_time = 0,
         is_first_on_sale = 1,
         refresh = []}).

-record(market_silver_shop,
        {ver = 2,
         rid,
         max_cell_id = 0,
         free_ids = [],
         cells = [],
         name = "",
         pid,
         last_logout = 0}).

-record(market_silver_shop_cell,
        {ver = 2,
         cell_id = 0,
         item_base_id = 0,
         num = 0,
         item_attrs = [],
         price = 0,
         expiry = 0,
         sold_num = 0,
         status = 0,
         system_price = 0,
         percent = 100,
         sale_time = 0}).

-record(market_silver_price,
        {ver = 3,
         item_base_id = 0,
         price = 0,
         sellers = [],
         deal_price = [],
         recover_num = 0,
         day_recover = 0,
         day_auto = 0,
         ext = []}).

-record(market_silver_refresh,
        {id = 0,
         item_base_id = 0,
         num = 0,
         item_attrs = [],
         price = 0,
         cell_id = 0,
         seller_id,
         status = 0}).

-record(market_silver_item_data,
        {base_id = 0,
         type = 0,
         step = 0,
         classes = 0,
         min_lev = 0,
         max_lev = 0,
         is_system = 1,
         is_quest_need = 0,
         def_price = 0,
         min_price = 0,
         max_price = 0,
         gain_label = coin,
         world_lev = 0,
         pre_base_id = 0,
         pre_pcnt = 1000,
         group = 0,
         group_id = 0,
         update_time,
         chain_type = 0,
         fix_price = 0}).

-record(market_silver_draw_item,
        {cell_id = 0,
         base_id = 0,
         num = 0,
         rest = 0,
         price = 0,
         pcnt = 0,
         attrs = []}).

-file("src/mod/quest/quest_progress.erl", 41).

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

-file("src/mod/quest/quest_progress.erl", 42).

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

-file("src/mod/quest/quest_progress.erl", 43).

-file("inc/constellation.hrl", 1).

-record(m_constellation,
        {ver = 2,
         lev = 0 :: non_neg_integer(),
         finished = [],
         summoned = []}).

-record(constellation_first,
        {key = {0, 0},
         ver = 0,
         lev = 0 :: non_neg_integer(),
         winner = [],
         mtime = 0,
         base_id = 0}).

-record(constellation_unit,
        {id = {0, 0},
         lev = 0,
         base_id = 0,
         map_id = 0,
         x = 0,
         y = 0,
         fail = 0,
         guards = []}).

-record(constellation_winner,
        {ver = 0,
         id = {0, "", 0},
         name = "" :: string(),
         classes = 0 :: non_neg_integer(),
         sex = 0 :: non_neg_integer(),
         looks = [],
         finished = 0 :: non_neg_integer(),
         round = 0 :: non_neg_integer(),
         is_leader = 0 :: non_neg_integer()}).

-record(constellation_summoned,
        {ver = 2,
         lev = 0 :: non_neg_integer(),
         base_id = 0 :: non_neg_integer(),
         map = 0 :: non_neg_integer(),
         x = 0 :: non_neg_integer(),
         y = 0 :: non_neg_integer(),
         time = 0 :: non_neg_integer()}).

-record(constellation_role,
        {id = {0, "", 0},
         name = "" :: string(),
         classes = 0 :: non_neg_integer(),
         sex = 0 :: non_neg_integer(),
         id_now = 0 :: non_neg_integer(),
         title_lev = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         max_kill = 0 :: non_neg_integer()}).

-record(constellation_first_data,
        {min = 0, max = 0, rate = 0, attr = []}).

-record(constellation_guard,
        {id = {0, "", 0},
         name = "",
         lev = 0,
         sex = 0,
         classes = 0,
         looks = [],
         base_id = 0}).

-file("src/mod/quest/quest_progress.erl", 44).

-file("inc/quest_teacher.hrl", 1).

-record(quest_teacher_args,
        {quest_id = 0,
         type = 0,
         sec_type = 0,
         round = 0,
         partner_id,
         partner_pid,
         partner_name = "",
         ask_id = 0,
         ask_start_time = 0,
         dyn_ext_data = [],
         rand_pos = []}).

-record(quest_teacher_stats,
        {teacher_id,
         student_id,
         quest_id = 0,
         type = 0,
         round = 0,
         ext = []}).

-record(quest_teacher_rand_data,
        {round = 0,
         quest_id = 0 :: pos_integer(),
         type = 0,
         sec_type = 0,
         weight :: undefined | non_neg_integer()}).

-record(quest_teacher_reward_data,
        {round = 0,
         exp_ratio = 0,
         coin_ratio = 0,
         pet_exp_ratio = 0,
         rand_items = [],
         item_pcnt = 0,
         teacher_score = 0}).

-record(quest_teacher_patrol_data,
        {id,
         map_base_id,
         unit_list = [],
         weight = 0,
         pcnt = 0,
         min_move_step = 0,
         max_move_step = 0}).

-file("src/mod/quest/quest_progress.erl", 45).

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

-file("src/mod/quest/quest_progress.erl", 46).

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

-file("src/mod/quest/quest_progress.erl", 47).

-file("inc/goal.hrl", 1).

-record(m_goal,
        {ver = 2 :: non_neg_integer(),
         finish = [] :: [pos_integer()],
         doing = [] :: [tuple()],
         day_reward = [] :: [],
         days = 0 :: non_neg_integer(),
         day_time = 0 :: non_neg_integer(),
         discount = [],
         count_reward = []}).

-file("src/mod/quest/quest_progress.erl", 48).

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

-file("src/mod/quest/quest_progress.erl", 49).

-file("inc/lev_break.hrl", 1).

-record(m_lev_break,
        {ver = 0,
         trial = 0 :: non_neg_integer(),
         done = 0 :: non_neg_integer(),
         times = 0 :: non_neg_integer(),
         attr_point = 0 :: non_neg_integer()}).

-file("src/mod/quest/quest_progress.erl", 50).

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

-file("src/mod/quest/quest_progress.erl", 51).

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

-file("src/mod/quest/quest_progress.erl", 52).

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

-file("src/mod/quest/quest_progress.erl", 53).

-spec fetch(#role{}, Label :: quest,
            QuestId :: pos_integer(),
            ProgressId :: pos_integer()) -> {ok,
                                             #quest{},
                                             #quest_progress{}} |
                                            {error, Reason :: term()}.

fetch(#role{name = _Name,
            m_quest = #m_quest{quest = Quests}},
      quest, QuestId, ProgressId) ->
    case lists:keyfind(QuestId, #quest.id, Quests) of
        false ->
            logger:debug("角色[~ts]未接受编号为[~w]的任务",
                         [_Name, QuestId],
                         quest_progress,
                         123),
            {error, quest_not_found};
        Q = #quest{progress = Progress} ->
            case lists:keyfind(ProgressId,
                               #quest_progress.id,
                               Progress)
                of
                false ->
                    logger:error("任务[~w]中不存在编号为[~w]的进度",
                                 [QuestId, ProgressId],
                                 quest_progress,
                                 128),
                    {error, progress_not_found};
                P -> {ok, Q, P}
            end
    end;
fetch(#role{name = Name,
            m_achievement = #m_achievement{doing = Quests}},
      achievement, QuestId, ProgressId) ->
    case lists:keyfind(QuestId, #quest.id, Quests) of
        false ->
            logger:error("角色[~ts]未接受编号为[~w]的成就任务",
                         [Name, QuestId],
                         quest_progress,
                         136),
            {error, quest_not_found};
        Q = #quest{progress = Progress} ->
            case lists:keyfind(ProgressId,
                               #quest_progress.id,
                               Progress)
                of
                false ->
                    logger:error("成就任务[~w]中不存在编号为[~w]的进度",
                                 [QuestId, ProgressId],
                                 quest_progress,
                                 141),
                    {error, progress_not_found};
                P -> {ok, Q, P}
            end
    end;
fetch(Role, quest_classes, QuestId, ProgressId) ->
    fetch(Role, quest, QuestId, ProgressId);
fetch(Role, quest_offer, QuestId, ProgressId) ->
    fetch(Role, quest, QuestId, ProgressId);
fetch(Role, quest_guild, QuestId, ProgressId) ->
    fetch(Role, quest, QuestId, ProgressId);
fetch(Role, quest_marriage, QuestId, ProgressId) ->
    fetch(Role, quest, QuestId, ProgressId);
fetch(Role, quest_couple, QuestId, ProgressId) ->
    fetch(Role, quest, QuestId, ProgressId);
fetch(Role, quest_teacher, QuestId, ProgressId) ->
    fetch(Role, quest, QuestId, ProgressId);
fetch(Role, quest_pursue, QuestId, ProgressId) ->
    fetch(Role, quest, QuestId, ProgressId);
fetch(Role, quest_child, QuestId, ProgressId) ->
    fetch(Role, quest, QuestId, ProgressId);
fetch(Role, quest_pregnancy, QuestId, ProgressId) ->
    fetch(Role, quest, QuestId, ProgressId);
fetch(Role, quest_acquaintance, QuestId, ProgressId) ->
    fetch(Role, quest, QuestId, ProgressId);
fetch(Role = #role{m_team =
                       #m_team{pid = Pid, status = 1}},
      quest_shipping, QuestId, ProgressId)
    when is_pid(Pid) ->
    fetch(Role, quest, QuestId, ProgressId);
fetch(_Role = #role{m_team = #m_team{pid = Pid}},
      quest_shipping, _QuestId, _ProgressId)
    when is_pid(Pid) ->
    {error, role};
fetch(Role, quest_shipping, QuestId, ProgressId) ->
    fetch(Role, quest, QuestId, ProgressId);
fetch(#role{m_goal = #m_goal{doing = Quests}}, goal,
      QuestId, ProgressId) ->
    case lists:keyfind(QuestId, #quest.id, Quests) of
        false -> {error, quest_not_found};
        Q = #quest{progress = Progress} ->
            case lists:keyfind(ProgressId,
                               #quest_progress.id,
                               Progress)
                of
                false ->
                    logger:error("目标任务[~w]中不存在编号为[~w]的进度",
                                 [QuestId, ProgressId],
                                 quest_progress,
                                 179),
                    {error, progress_not_found};
                P -> {ok, Q, P}
            end
    end;
fetch(#role{m_mount =
                #m_mount{mount_goal = #mount_goal{doing = Quests}}},
      mount_goal, QuestId, ProgressId) ->
    case lists:keyfind(QuestId, #quest.id, Quests) of
        false -> {error, quest_not_found};
        Q = #quest{progress = Progress} ->
            case lists:keyfind(ProgressId,
                               #quest_progress.id,
                               Progress)
                of
                false ->
                    logger:error("目标任务[~w]中不存在编号为[~w]的进度",
                                 [QuestId, ProgressId],
                                 quest_progress,
                                 191),
                    {error, progress_not_found};
                P -> {ok, Q, P}
            end
    end;
fetch(Role, _Label, QuestId, ProgressId) ->
    fetch(Role, quest, QuestId, ProgressId).

-spec update(#role{}, Label :: quest,
             QuestId :: pos_integer(), ProgressId :: pos_integer(),
             #quest_progress{}) -> #role{}.

update(Role = #role{link = #link{conn_pid = ConnPid},
                    m_quest = Mquest = #m_quest{quest = Quests}},
       quest, Q = #quest{id = QuestId, progress = Progress},
       ProgressId, P) ->
    NewP = lists:keyreplace(ProgressId,
                            #quest_progress.id,
                            Progress,
                            P),
    case [false || #quest_progress{finish = 0} <- NewP] of
        [] ->
            NewQ = Q#quest{progress = NewP, finish = 1},
            sys_conn:pack_send(ConnPid, 10209, {[NewQ]}),
            NewQuests = lists:keyreplace(QuestId,
                                         #quest.id,
                                         Quests,
                                         NewQ),
            role_trigger:fire(#evt_finish_quest{id = QuestId},
                              Role#role{m_quest =
                                            Mquest#m_quest{quest = NewQuests}});
        _ ->
            NewQ = Q#quest{finish = 0, progress = NewP},
            sys_conn:pack_send(ConnPid, 10209, {[NewQ]}),
            NewQuests = lists:keyreplace(QuestId,
                                         #quest.id,
                                         Quests,
                                         NewQ),
            Role#role{m_quest = Mquest#m_quest{quest = NewQuests}}
    end;
update(Role = #role{link = #link{conn_pid = ConnPid},
                    id = RoleId,
                    m_achievement =
                        MAchi = #m_achievement{doing = Quests, focus = Focus,
                                               point = Point,
                                               assets_point = AssetsPoint,
                                               finish = FinL},
                    pid = Pid},
       achievement,
       Q = #quest{id = QuestId, progress = Progress},
       ProgressId, P) ->
    NewP = lists:keyreplace(ProgressId,
                            #quest_progress.id,
                            Progress,
                            P),
    case [false || #quest_progress{finish = 0} <- NewP] of
        [] ->
            NewPoint = case achievement_data:get(QuestId) of
                           #quest_data{ach_num = AddNum} -> Point + AddNum;
                           _ -> Point
                       end,
            PointAddNum = NewPoint - Point,
            Now = date:unixtime(),
            NewFocus = Focus -- [QuestId],
            NRole = case achievement_data:get(QuestId) of
                        #quest_data{rewards_commit = [], honor = 0} ->
                            NewQuest = Q#quest{progress = [], finish = 2,
                                               finish_time = Now},
                            NewQuests = lists:keydelete(QuestId,
                                                        #quest.id,
                                                        Quests),
                            sys_conn:pack_send(ConnPid, 10220, {[NewQuest]}),
                            Role#role{m_achievement =
                                          MAchi#m_achievement{doing = NewQuests,
                                                              finish =
                                                                  [{QuestId,
                                                                    Now}
                                                                   | FinL],
                                                              focus = NewFocus,
                                                              point = NewPoint,
                                                              assets_point =
                                                                  AssetsPoint +
                                                                      PointAddNum}};
                        _ ->
                            NewQuest = Q#quest{progress = NewP, finish = 1,
                                               finish_time = Now},
                            NewQuests = lists:keyreplace(QuestId,
                                                         #quest.id,
                                                         Quests,
                                                         NewQuest),
                            sys_conn:pack_send(ConnPid, 10220, {[NewQuest]}),
                            Role#role{m_achievement =
                                          MAchi#m_achievement{doing = NewQuests,
                                                              point = NewPoint,
                                                              focus = NewFocus,
                                                              assets_point =
                                                                  AssetsPoint +
                                                                      PointAddNum}}
                    end,
            case PointAddNum =/= 0 of
                false -> ok;
                true ->
                    log:achieve_shop(NRole,
                                     1,
                                     AssetsPoint,
                                     PointAddNum,
                                     0,
                                     lang:get(""),
                                     0)
            end,
            AddBadgeRole = case achievement_data:get(QuestId) of
                               #quest_data{rewards_badge = Badge}
                                   when Badge =/= 0 ->
                                   case achieve_shop:gain_achieve_goods(NRole,
                                                                        Badge)
                                       of
                                       {ok, Role1} -> Role1;
                                       {false, _} -> NRole
                                   end;
                               _ -> NRole
                           end,
            achievement:count_finish(RoleId, QuestId),
            NewRole = AddBadgeRole,
            achievement:announce(NewRole, QuestId, 1),
            role_trigger:async_fire(Pid,
                                    #evt_achievement{id = QuestId}),
            achievement:push(NewRole, 10222),
            role_query:sync_cache(NewRole),
            achievement:focus_push(NewRole),
            achievement:open_next(NewRole, QuestId);
        _ ->
            NewQuest = Q#quest{progress = NewP},
            sys_conn:pack_send(ConnPid, 10220, {[NewQuest]}),
            NewQuests = lists:keyreplace(QuestId,
                                         #quest.id,
                                         Quests,
                                         NewQuest),
            Role#role{m_achievement =
                          MAchi#m_achievement{doing = NewQuests}}
    end;
update(Role, quest_classes, Q, ProgressId, P) ->
    update(Role, quest, Q, ProgressId, P);
update(Role, quest_offer, Q, ProgressId, P) ->
    update(Role, quest, Q, ProgressId, P);
update(Role, quest_guild, Q, ProgressId, P) ->
    quest_guild:propagate_combat(Role, P),
    update(Role, quest, Q, ProgressId, P);
update(Role, quest_chain, Q, ProgressId, P) ->
    update(Role, quest, Q, ProgressId, P);
update(Role, quest_marriage, Q, ProgressId, P) ->
    update(Role, quest, Q, ProgressId, P);
update(Role, quest_couple, Q, ProgressId, P) ->
    update(Role, quest, Q, ProgressId, P);
update(Role, quest_plant, Q, ProgressId, P) ->
    update(Role, quest, Q, ProgressId, P);
update(Role, quest_teacher, Q, ProgressId, P) ->
    update(Role, quest, Q, ProgressId, P);
update(Role, quest_pursue, Q, ProgressId, P) ->
    update(Role, quest, Q, ProgressId, P);
update(Role, quest_child, Q, ProgressId, P) ->
    update(Role, quest, Q, ProgressId, P);
update(Role, quest_pregnancy, Q, ProgressId, P) ->
    update(Role, quest, Q, ProgressId, P);
update(Role, quest_acquaintance, Q, ProgressId, P) ->
    update(Role, quest, Q, ProgressId, P);
update(Role, quest_king, Q, ProgressId, P) ->
    update(Role, quest, Q, ProgressId, P);
update(Role = #role{m_team =
                        #m_team{pid = TeamPid, status = TeamStatus}},
       quest_shipping, Q, ProgressId, P)
    when is_pid(TeamPid) andalso TeamStatus == 1 ->
    update(Role, quest, Q, ProgressId, P);
update(Role = #role{m_team = #m_team{pid = TeamPid}},
       quest_shipping, Q, ProgressId, P)
    when not is_pid(TeamPid) ->
    update(Role, quest, Q, ProgressId, P);
update(Role, quest_shipping, _Q, _ProgressId, _P) ->
    Role;
update(Role = #role{pid = Pid,
                    m_goal =
                        MGoal = #m_goal{doing = Quests, finish = FinL}},
       goal, Q = #quest{id = QuestId, progress = Progress},
       ProgressId, P) ->
    NewP = lists:keyreplace(ProgressId,
                            #quest_progress.id,
                            Progress,
                            P),
    case [false || #quest_progress{finish = 0} <- NewP] of
        [] ->
            NewQuest = Q#quest{progress = NewP, finish = 1},
            goal:push_10235(Role, [NewQuest]),
            Now = date:unixtime(),
            NewQuests = lists:keydelete(QuestId, #quest.id, Quests),
            NewFinL = lists:keystore(QuestId,
                                     1,
                                     FinL,
                                     {QuestId, Now}),
            role_trigger:async_fire(Pid,
                                    #evt_finish_goal{id = QuestId}),
            Role#role{m_goal =
                          MGoal#m_goal{doing = NewQuests, finish = NewFinL}};
        _ ->
            NewQuest = Q#quest{progress = NewP},
            goal:push_10235(Role, [NewQuest]),
            NewQuests = lists:keyreplace(QuestId,
                                         #quest.id,
                                         Quests,
                                         NewQuest),
            Role#role{m_goal = MGoal#m_goal{doing = NewQuests}}
    end;
update(Role = #role{m_mount =
                        MMount = #m_mount{mount_goal =
                                              MountGoal = #mount_goal{doing =
                                                                          Quests,
                                                                      finish =
                                                                          FinL}}},
       mount_goal,
       Q = #quest{id = QuestId, progress = Progress},
       ProgressId, P) ->
    NewP = lists:keyreplace(ProgressId,
                            #quest_progress.id,
                            Progress,
                            P),
    case [false || #quest_progress{finish = 0} <- NewP] of
        [] ->
            NewQuest = Q#quest{progress = NewP, finish = 1},
            mount_goal:push_17008(Role, [NewQuest]),
            Now = date:unixtime(),
            NewQuests = lists:keydelete(QuestId, #quest.id, Quests),
            NewFinL = lists:keystore(QuestId,
                                     1,
                                     FinL,
                                     {QuestId, Now}),
            NewMountGoal = MountGoal#mount_goal{doing = NewQuests,
                                                finish = NewFinL},
            NewMount = MMount#m_mount{mount_goal = NewMountGoal},
            Role#role{m_mount = NewMount};
        _ ->
            NewQuest = Q#quest{progress = NewP},
            mount_goal:push_17008(Role, [NewQuest]),
            NewQuests = lists:keyreplace(QuestId,
                                         #quest.id,
                                         Quests,
                                         NewQuest),
            NewMountGoal = MountGoal#mount_goal{doing = NewQuests},
            NewMount = MMount#m_mount{mount_goal = NewMountGoal},
            Role#role{m_mount = NewMount}
    end;
update(Role = #role{name = Name}, _Label, _Quest,
       _ProgressId, _P) ->
    logger:error("角色[~ts]更新任务进度出错:_Label:~w Quest:~w ProgressId:~w",
                 [Name, _Label, _Quest, _ProgressId],
                 quest_progress,
                 348),
    Role.

-spec event(Evt :: tuple(), #role{}, Label :: quest,
            QuestId :: pos_integer(), ProgressId :: pos_integer(),
            Target :: non_neg_integer(), Param :: list()) -> ok |
                                                             remove |
                                                             {remove, #role{}} |
                                                             {ok, #role{}}.

event(#evt_levup{},
      Role = #role{m_lev_break = #m_lev_break{times = Times}},
      Label, QuestId, ProgressId, 2, [Times]) ->
    Lev = lev_break:lev(Role),
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             param = Param}}
            when Lev >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = OldVal}}
            when Lev > OldVal ->
            NewP = P#quest_progress{finish = 0, value = Lev},
            {ok, update(Role, Label, Quest, ProgressId, NewP)};
        _ -> ok
    end;
event(#evt_levup{},
      Role = #role{m_lev_break = #m_lev_break{times = Times}},
      Label, QuestId, ProgressId, 2, [LevBreakTimes])
    when Times > LevBreakTimes ->
    Lev = lev_break:lev(Role),
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             param = Param}}
            when Lev >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = OldVal}}
            when Lev > OldVal ->
            NewP = P#quest_progress{finish = 0, value = Lev},
            {ok, update(Role, Label, Quest, ProgressId, NewP)};
        _ -> ok
    end;
event(#evt_levup{}, _Role, _Label, _QuestId,
      _ProgressId, 2, _) ->
    ok;
event(#evt_levup{}, Role, Label, QuestId, ProgressId, 1,
      []) ->
    Lev = lev_break:lev(Role),
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             param = Param}}
            when Lev >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = OldVal}}
            when Lev > OldVal ->
            NewP = P#quest_progress{finish = 0, value = Lev},
            {ok, update(Role, Label, Quest, ProgressId, NewP)};
        _ -> ok
    end;
event(#evt_kill_npc{base_id = BaseId, num = _Num}, Role,
      Label, QuestId, ProgressId, _Target,
      [{fun_type, FunType = 13}]) ->
    case unit_data:get(BaseId) of
        #unit_data{fun_type = FunType} ->
            case fetch(Role, Label, QuestId, ProgressId) of
                {error, role} -> {ok, Role};
                {error, _} -> remove;
                {ok, _Quest, #quest_progress{finish = Finish}}
                    when Finish =/= 0 ->
                    remove;
                {ok,
                 Quest,
                 P = #quest_progress{target_val = TargetVal,
                                     value = Value, param = Param}}
                    when Value + 1 >= TargetVal ->
                    RemoveRole = plot_quest:remove_task_unit(Role, Param),
                    Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
                    NewP = P#quest_progress{finish = 1, value = TargetVal,
                                            trigger = undefined},
                    {remove, update(Role1, Label, Quest, ProgressId, NewP)};
                {ok, Quest, P = #quest_progress{value = Value}} ->
                    NewP = P#quest_progress{finish = 0, value = Value + 1},
                    {ok, update(Role, Label, Quest, ProgressId, NewP)}
            end;
        _ -> ok
    end;
event(#evt_kill_npc{base_id = BaseId}, Role,
      Label = quest_classes, QuestId, ProgressId, _Target,
      [{type, patrol}]) ->
    case unit_data:get(BaseId) of
        #unit_data{fun_type = 2} ->
            case fetch(Role, Label, QuestId, ProgressId) of
                {error, role} -> {ok, Role};
                {error, _} -> remove;
                {ok, _Quest, #quest_progress{finish = Finish}}
                    when Finish =/= 0 ->
                    remove;
                {ok,
                 Quest,
                 P = #quest_progress{target_val = TargetVal,
                                     value = Value, param = Param}}
                    when Value + 1 >= TargetVal ->
                    RemoveRole = plot_quest:remove_task_unit(Role, Param),
                    Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
                    NewP = P#quest_progress{finish = 1, value = TargetVal,
                                            trigger = undefined},
                    {remove, update(Role1, Label, Quest, ProgressId, NewP)};
                {ok, Quest, P = #quest_progress{value = Value}} ->
                    NewP = P#quest_progress{finish = 0, value = Value + 1},
                    {ok, update(Role, Label, Quest, ProgressId, NewP)}
            end;
        _ -> ok
    end;
event(#evt_kill_npc{base_id = BaseId},
      Role = #role{pos = #pos{map_base_id = MapBaseId}},
      Label = quest_guild, QuestId, ProgressId, _Target,
      [{type, patrol}]) ->
    case quest_guild_data:get_patrol(QuestId) of
        [] -> ok;
        L ->
            L1 = [UnitList
                  || #{map_base_id := MBaseId, unit_list := UnitList}
                         <- L,
                     MBaseId =:= MapBaseId],
            case lists:keyfind(BaseId, 1, lists:flatten(L1)) of
                {BaseId, _} ->
                    case fetch(Role, Label, QuestId, ProgressId) of
                        {error, role} -> {ok, Role};
                        {error, _} -> remove;
                        {ok, _Quest, #quest_progress{finish = Finish}}
                            when Finish =/= 0 ->
                            remove;
                        {ok,
                         Quest,
                         P = #quest_progress{target_val = TargetVal,
                                             value = Value, param = Param}}
                            when Value + 1 >= TargetVal ->
                            RemoveRole = plot_quest:remove_task_unit(Role,
                                                                     Param),
                            Role1 = monitor_quest_prog(Label,
                                                       P,
                                                       Quest,
                                                       RemoveRole),
                            NewP = P#quest_progress{finish = 1,
                                                    value = TargetVal,
                                                    trigger = undefined},
                            {remove,
                             update(Role1, Label, Quest, ProgressId, NewP)};
                        {ok, Quest, P = #quest_progress{value = Value}} ->
                            NewP = P#quest_progress{finish = 0,
                                                    value = Value + 1},
                            {ok, update(Role, Label, Quest, ProgressId, NewP)}
                    end;
                _ -> ok
            end
    end;
event(#evt_kill_npc{base_id = BaseId},
      Role = #role{pos = #pos{map_base_id = MapBaseId}},
      Label = quest_teacher, QuestId, ProgressId, _Target,
      [{type, patrol}]) ->
    logger:debug("[~ts]师徒任务巡逻击杀[BaseId:~w][QuestId:~w]",
                 [Role#role.name, BaseId, QuestId],
                 quest_progress,
                 397),
    case quest_teacher_data:get_patrol(QuestId) of
        L = [_ | _] ->
            L1 = [UnitList
                  || #quest_teacher_patrol_data{map_base_id = MBaseId,
                                                unit_list = UnitList}
                         <- L,
                     MBaseId =:= MapBaseId],
            case lists:keyfind(BaseId, 1, lists:flatten(L1)) of
                {BaseId, _} ->
                    case fetch(Role, Label, QuestId, ProgressId) of
                        {error, role} -> {ok, Role};
                        {error, _} -> remove;
                        {ok, _Quest, #quest_progress{finish = Finish}}
                            when Finish =/= 0 ->
                            remove;
                        {ok,
                         Quest,
                         P = #quest_progress{target_val = TargetVal,
                                             value = Value, param = Param}}
                            when Value + 1 >= TargetVal ->
                            RemoveRole = plot_quest:remove_task_unit(Role,
                                                                     Param),
                            Role1 = monitor_quest_prog(Label,
                                                       P,
                                                       Quest,
                                                       RemoveRole),
                            NewP = P#quest_progress{finish = 1,
                                                    value = TargetVal,
                                                    trigger = undefined},
                            {remove,
                             update(Role1, Label, Quest, ProgressId, NewP)};
                        {ok, Quest, P = #quest_progress{value = Value}} ->
                            NewP = P#quest_progress{finish = 0,
                                                    value = Value + 1},
                            {ok, update(Role, Label, Quest, ProgressId, NewP)}
                    end;
                _ -> ok
            end
    end;
event(#evt_kill_npc{base_id = BaseId},
      Role = #role{pos = #pos{map_base_id = MapBaseId}},
      Label = quest_pursue, QuestId, ProgressId, _Target,
      [{type, patrol}]) ->
    case quest_pursue_data:get_patrol(QuestId) of
        [] -> ok;
        L ->
            L1 = [UnitList
                  || #{map_base_id := MBaseId, unit_list := UnitList}
                         <- L,
                     MBaseId =:= MapBaseId],
            case lists:keyfind(BaseId, 1, lists:flatten(L1)) of
                {BaseId, _} ->
                    case fetch(Role, Label, QuestId, ProgressId) of
                        {error, role} -> {ok, Role};
                        {error, _} -> remove;
                        {ok, _Quest, #quest_progress{finish = Finish}}
                            when Finish =/= 0 ->
                            remove;
                        {ok,
                         Quest,
                         P = #quest_progress{target_val = TargetVal,
                                             value = Value, param = Param}}
                            when Value + 1 >= TargetVal ->
                            RemoveRole = plot_quest:remove_task_unit(Role,
                                                                     Param),
                            Role1 = monitor_quest_prog(Label,
                                                       P,
                                                       Quest,
                                                       RemoveRole),
                            NewP = P#quest_progress{finish = 1,
                                                    value = TargetVal,
                                                    trigger = undefined},
                            {remove,
                             update(Role1, Label, Quest, ProgressId, NewP)};
                        {ok, Quest, P = #quest_progress{value = Value}} ->
                            NewP = P#quest_progress{finish = 0,
                                                    value = Value + 1},
                            {ok, update(Role, Label, Quest, ProgressId, NewP)}
                    end;
                _ -> ok
            end
    end;
event(#evt_kill_npc{base_id = BaseId},
      Role = #role{pos = #pos{map_base_id = MapBaseId}},
      Label = quest_child, QuestId, ProgressId, _Target,
      [{type, patrol}]) ->
    case quest_child_data:get_patrol(QuestId) of
        [] -> ok;
        L ->
            L1 = [UnitList
                  || #{map_base_id := MBaseId, unit_list := UnitList}
                         <- L,
                     MBaseId =:= MapBaseId],
            case lists:keyfind(BaseId, 1, lists:flatten(L1)) of
                {BaseId, _} ->
                    case fetch(Role, Label, QuestId, ProgressId) of
                        {error, role} -> {ok, Role};
                        {error, _} -> remove;
                        {ok, _Quest, #quest_progress{finish = Finish}}
                            when Finish =/= 0 ->
                            remove;
                        {ok,
                         Quest,
                         P = #quest_progress{target_val = TargetVal,
                                             value = Value, param = Param}}
                            when Value + 1 >= TargetVal ->
                            RemoveRole = plot_quest:remove_task_unit(Role,
                                                                     Param),
                            Role1 = monitor_quest_prog(Label,
                                                       P,
                                                       Quest,
                                                       RemoveRole),
                            NewP = P#quest_progress{finish = 1,
                                                    value = TargetVal,
                                                    trigger = undefined},
                            {remove,
                             update(Role1, Label, Quest, ProgressId, NewP)};
                        {ok, Quest, P = #quest_progress{value = Value}} ->
                            NewP = P#quest_progress{finish = 0,
                                                    value = Value + 1},
                            {ok, update(Role, Label, Quest, ProgressId, NewP)}
                    end;
                _ -> ok
            end
    end;
event(#evt_kill_npc{base_id = BaseId},
      Role = #role{pos = #pos{map_base_id = MapBaseId}},
      Label = quest_pregnancy, QuestId, ProgressId, _Target,
      [{type, patrol}]) ->
    case quest_pregnancy_data:get_patrol(QuestId) of
        [] -> ok;
        L ->
            L1 = [UnitList
                  || #{map_base_id := MBaseId, unit_list := UnitList}
                         <- L,
                     MBaseId =:= MapBaseId],
            case lists:keyfind(BaseId, 1, lists:flatten(L1)) of
                {BaseId, _} ->
                    case fetch(Role, Label, QuestId, ProgressId) of
                        {error, role} -> {ok, Role};
                        {error, _} -> remove;
                        {ok, _Quest, #quest_progress{finish = Finish}}
                            when Finish =/= 0 ->
                            remove;
                        {ok,
                         Quest,
                         P = #quest_progress{target_val = TargetVal,
                                             value = Value, param = Param}}
                            when Value + 1 >= TargetVal ->
                            RemoveRole = plot_quest:remove_task_unit(Role,
                                                                     Param),
                            Role1 = monitor_quest_prog(Label,
                                                       P,
                                                       Quest,
                                                       RemoveRole),
                            NewP = P#quest_progress{finish = 1,
                                                    value = TargetVal,
                                                    trigger = undefined},
                            {remove,
                             update(Role1, Label, Quest, ProgressId, NewP)};
                        {ok, Quest, P = #quest_progress{value = Value}} ->
                            NewP = P#quest_progress{finish = 0,
                                                    value = Value + 1},
                            {ok, update(Role, Label, Quest, ProgressId, NewP)}
                    end;
                _ -> ok
            end
    end;
event(#evt_kill_npc{base_id = BaseId},
      Role = #role{pos = #pos{map_base_id = MapBaseId}},
      Label = quest_acquaintance, QuestId, ProgressId,
      _Target, [{type, patrol}]) ->
    case quest_acquaintance_data:get_patrol(QuestId) of
        [] -> ok;
        L ->
            L1 = [UnitList
                  || #{map_base_id := MBaseId, unit_list := UnitList}
                         <- L,
                     MBaseId =:= MapBaseId],
            case lists:keyfind(BaseId, 1, lists:flatten(L1)) of
                {BaseId, _} ->
                    case fetch(Role, Label, QuestId, ProgressId) of
                        {error, role} -> {ok, Role};
                        {error, _} -> remove;
                        {ok, _Quest, #quest_progress{finish = Finish}}
                            when Finish =/= 0 ->
                            remove;
                        {ok,
                         Quest,
                         P = #quest_progress{target_val = TargetVal,
                                             value = Value, param = Param}}
                            when Value + 1 >= TargetVal ->
                            RemoveRole = plot_quest:remove_task_unit(Role,
                                                                     Param),
                            Role1 = monitor_quest_prog(Label,
                                                       P,
                                                       Quest,
                                                       RemoveRole),
                            NewP = P#quest_progress{finish = 1,
                                                    value = TargetVal,
                                                    trigger = undefined},
                            {remove,
                             update(Role1, Label, Quest, ProgressId, NewP)};
                        {ok, Quest, P = #quest_progress{value = Value}} ->
                            NewP = P#quest_progress{finish = 0,
                                                    value = Value + 1},
                            {ok, update(Role, Label, Quest, ProgressId, NewP)}
                    end;
                _ -> ok
            end
    end;
event(#evt_kill_npc{base_id = BaseId},
      Role = #role{pos = #pos{map_base_id = MapBaseId}},
      Label = quest_king, QuestId, ProgressId, _Target,
      [{type, patrol}]) ->
    case quest_king_data:get_patrol(QuestId) of
        [] -> ok;
        L ->
            L1 = [UnitList
                  || #{map_base_id := MBaseId, unit_list := UnitList}
                         <- L,
                     MBaseId =:= MapBaseId],
            case lists:keyfind(BaseId, 1, lists:flatten(L1)) of
                {BaseId, _} ->
                    case fetch(Role, Label, QuestId, ProgressId) of
                        {error, role} -> {ok, Role};
                        {error, _} -> remove;
                        {ok, _Quest, #quest_progress{finish = Finish}}
                            when Finish =/= 0 ->
                            remove;
                        {ok,
                         Quest,
                         P = #quest_progress{target_val = TargetVal,
                                             value = Value, param = Param}}
                            when Value + 1 >= TargetVal ->
                            RemoveRole = plot_quest:remove_task_unit(Role,
                                                                     Param),
                            Role1 = monitor_quest_prog(Label,
                                                       P,
                                                       Quest,
                                                       RemoveRole),
                            NewP = P#quest_progress{finish = 1,
                                                    value = TargetVal,
                                                    trigger = undefined},
                            {remove,
                             update(Role1, Label, Quest, ProgressId, NewP)};
                        {ok, Quest, P = #quest_progress{value = Value}} ->
                            NewP = P#quest_progress{finish = 0,
                                                    value = Value + 1},
                            {ok, update(Role, Label, Quest, ProgressId, NewP)}
                    end;
                _ -> ok
            end
    end;
event(#evt_kill_npc{base_id = BaseId, num = Num}, Role,
      Label, QuestId, ProgressId, Target, [])
    when BaseId =:= Target orelse Target =:= 0 ->
    case quest_data:get(QuestId) of
        #quest_data{sec_type = 14} ->
            case quest_chain:check_fight_finish(Role) of
                true ->
                    case fetch(Role, Label, QuestId, ProgressId) of
                        {error, role} -> {ok, Role};
                        {error, _} -> remove;
                        {ok, _Quest, #quest_progress{finish = Finish}}
                            when Finish =/= 0 ->
                            remove;
                        {ok,
                         Quest,
                         P = #quest_progress{target_val = TargetVal,
                                             value = Value, param = Param}}
                            when Value + Num >= TargetVal ->
                            RemoveRole = plot_quest:remove_task_unit(Role,
                                                                     Param),
                            Role1 = monitor_quest_prog(Label,
                                                       P,
                                                       Quest,
                                                       RemoveRole),
                            NewP = P#quest_progress{finish = 1,
                                                    value = TargetVal,
                                                    trigger = undefined},
                            {remove,
                             update(Role1, Label, Quest, ProgressId, NewP)};
                        {ok, Quest, P = #quest_progress{value = Value}} ->
                            NewP = P#quest_progress{finish = 0,
                                                    value = Value + Num},
                            {ok, update(Role, Label, Quest, ProgressId, NewP)}
                    end;
                false -> ok
            end;
        _False ->
            case fetch(Role, Label, QuestId, ProgressId) of
                {error, role} -> {ok, Role};
                {error, _} -> remove;
                {ok, _Quest, #quest_progress{finish = Finish}}
                    when Finish =/= 0 ->
                    remove;
                {ok,
                 Quest,
                 P = #quest_progress{target_val = TargetVal,
                                     value = Value, param = Param}}
                    when Value + Num >= TargetVal ->
                    RemoveRole = plot_quest:remove_task_unit(Role, Param),
                    Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
                    NewP = P#quest_progress{finish = 1, value = TargetVal,
                                            trigger = undefined},
                    {remove, update(Role1, Label, Quest, ProgressId, NewP)};
                {ok, Quest, P = #quest_progress{value = Value}} ->
                    NewP = P#quest_progress{finish = 0,
                                            value = Value + Num},
                    {ok, update(Role, Label, Quest, ProgressId, NewP)}
            end
    end;
event(#evt_kill_npc{base_id = BaseId, num = Num,
                    ratio_val = RatioVal},
      Role, Label, QuestId, ProgressId, Target,
      [{quest_kill, lev, KillLev}])
    when BaseId =:= Target orelse Target =:= 0 ->
    case RatioVal >= KillLev of
        true ->
            case fetch(Role, Label, QuestId, ProgressId) of
                {error, role} -> {ok, Role};
                {error, _} -> remove;
                {ok, _Quest, #quest_progress{finish = Finish}}
                    when Finish =/= 0 ->
                    remove;
                {ok,
                 Quest,
                 P = #quest_progress{target_val = TargetVal,
                                     value = Value, param = Param}}
                    when Value + Num >= TargetVal ->
                    RemoveRole = plot_quest:remove_task_unit(Role, Param),
                    Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
                    NewP = P#quest_progress{finish = 1, value = TargetVal,
                                            trigger = undefined},
                    {remove, update(Role1, Label, Quest, ProgressId, NewP)};
                {ok, Quest, P = #quest_progress{value = Value}} ->
                    NewP = P#quest_progress{finish = 0,
                                            value = Value + Num},
                    {ok, update(Role, Label, Quest, ProgressId, NewP)}
            end;
        false -> ok
    end;
event(#evt_kill_npc{base_id = BaseId, num = Num,
                    ratio_val = RatioVal},
      Role = #role{lev = Lev}, Label, QuestId, ProgressId,
      Target, [{quest_kill, diff_lev, DiffLev}])
    when BaseId =:= Target orelse Target =:= 0 ->
    case RatioVal >= Lev - DiffLev of
        true ->
            case fetch(Role, Label, QuestId, ProgressId) of
                {error, role} -> {ok, Role};
                {error, _} -> remove;
                {ok, _Quest, #quest_progress{finish = Finish}}
                    when Finish =/= 0 ->
                    remove;
                {ok,
                 Quest,
                 P = #quest_progress{target_val = TargetVal,
                                     value = Value, param = Param}}
                    when Value + Num >= TargetVal ->
                    RemoveRole = plot_quest:remove_task_unit(Role, Param),
                    Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
                    NewP = P#quest_progress{finish = 1, value = TargetVal,
                                            trigger = undefined},
                    {remove, update(Role1, Label, Quest, ProgressId, NewP)};
                {ok, Quest, P = #quest_progress{value = Value}} ->
                    NewP = P#quest_progress{finish = 0,
                                            value = Value + Num},
                    {ok, update(Role, Label, Quest, ProgressId, NewP)}
            end;
        false -> ok
    end;
event(#evt_kill_npc{base_id = BaseId, num = Num}, Role,
      Label, QuestId, ProgressId, _Target, [{type, Type}]) ->
    case unit_data:get(BaseId) of
        #unit_data{type = Type} ->
            case fetch(Role, Label, QuestId, ProgressId) of
                {error, role} -> {ok, Role};
                {error, _} -> remove;
                {ok, _Quest, #quest_progress{finish = Finish}}
                    when Finish =/= 0 ->
                    remove;
                {ok,
                 Quest,
                 P = #quest_progress{target_val = TargetVal,
                                     value = Value, param = Param}}
                    when Value + Num >= TargetVal ->
                    RemoveRole = plot_quest:remove_task_unit(Role, Param),
                    Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
                    NewP = P#quest_progress{finish = 1, value = TargetVal,
                                            trigger = undefined},
                    {remove, update(Role1, Label, Quest, ProgressId, NewP)};
                {ok, Quest, P = #quest_progress{value = Value}} ->
                    NewP = P#quest_progress{finish = 0,
                                            value = Value + Num},
                    {ok, update(Role, Label, Quest, ProgressId, NewP)}
            end;
        _ -> ok
    end;
event(#evt_kill_npc{base_id = BaseId, num = Num}, Role,
      Label, QuestId, ProgressId, Target, _Param)
    when BaseId =:= Target orelse Target =:= 0 ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + Num >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0,
                                    value = Value + Num},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_kill_npc{base_id = BaseId}, Role,
      Label = quest_offer, QuestId, ProgressId, _Target,
      [{fun_type, FunType}]) ->
    case unit_data:get(BaseId) of
        #unit_data{fun_type = FunType} ->
            case fetch(Role, Label, QuestId, ProgressId) of
                {error, role} -> {ok, Role};
                {error, _} -> remove;
                {ok, _Quest, #quest_progress{finish = Finish}}
                    when Finish =/= 0 ->
                    remove;
                {ok,
                 Quest,
                 P = #quest_progress{target_val = TargetVal,
                                     param = Param}}
                    when 1 >= TargetVal ->
                    RemoveRole = plot_quest:remove_task_unit(Role, Param),
                    Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
                    NewP = P#quest_progress{finish = 1, value = TargetVal,
                                            trigger = undefined},
                    {remove, update(Role1, Label, Quest, ProgressId, NewP)};
                {ok, Quest, P = #quest_progress{value = OldVal}}
                    when 1 > OldVal ->
                    NewP = P#quest_progress{finish = 0, value = 1},
                    {ok, update(Role, Label, Quest, ProgressId, NewP)};
                _ -> ok
            end;
        _ -> ok
    end;
event(#evt_kill_npc{base_id = BaseId, num = Num}, Role,
      Label, QuestId, ProgressId, _Target,
      [{fun_type, FunType}]) ->
    case unit_data:get(BaseId) of
        #unit_data{fun_type = FunType} ->
            case fetch(Role, Label, QuestId, ProgressId) of
                {error, role} -> {ok, Role};
                {error, _} -> remove;
                {ok, _Quest, #quest_progress{finish = Finish}}
                    when Finish =/= 0 ->
                    remove;
                {ok,
                 Quest,
                 P = #quest_progress{target_val = TargetVal,
                                     value = Value, param = Param}}
                    when Value + Num >= TargetVal ->
                    RemoveRole = plot_quest:remove_task_unit(Role, Param),
                    Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
                    NewP = P#quest_progress{finish = 1, value = TargetVal,
                                            trigger = undefined},
                    {remove, update(Role1, Label, Quest, ProgressId, NewP)};
                {ok, Quest, P = #quest_progress{value = Value}} ->
                    NewP = P#quest_progress{finish = 0,
                                            value = Value + Num},
                    {ok, update(Role, Label, Quest, ProgressId, NewP)}
            end;
        _ -> ok
    end;
event(#evt_kill_npc{base_id = BaseId, num = Num}, Role,
      Label, QuestId, ProgressId, _Target, Param = [_ | _]) ->
    case lists:member(BaseId, Param) of
        true ->
            case fetch(Role, Label, QuestId, ProgressId) of
                {error, role} -> {ok, Role};
                {error, _} -> remove;
                {ok, _Quest, #quest_progress{finish = Finish}}
                    when Finish =/= 0 ->
                    remove;
                {ok,
                 Quest,
                 P = #quest_progress{target_val = TargetVal,
                                     value = Value, param = Param}}
                    when Value + Num >= TargetVal ->
                    RemoveRole = plot_quest:remove_task_unit(Role, Param),
                    Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
                    NewP = P#quest_progress{finish = 1, value = TargetVal,
                                            trigger = undefined},
                    {remove, update(Role1, Label, Quest, ProgressId, NewP)};
                {ok, Quest, P = #quest_progress{value = Value}} ->
                    NewP = P#quest_progress{finish = 0,
                                            value = Value + Num},
                    {ok, update(Role, Label, Quest, ProgressId, NewP)}
            end;
        _ -> ok
    end;
event(#evt_kill_npc{}, _Role, _Label, _QuestId,
      _ProgressId, _Target, _Param) ->
    ok;
event(#evt_kill_npc_lose{base_id = BaseId, num = Num},
      Role, Label, QuestId, ProgressId, Target, _Param)
    when BaseId =:= Target orelse Target =:= 0 ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + Num >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0,
                                    value = Value + Num},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_kill_npc_lose{}, _Role, _Label, _QuestId,
      _ProgressId, _Target, _Param) ->
    ok;
event(#evt_camp_halloween{}, Role, Label, QuestId,
      ProgressId, _Target, _) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_camp_halloween_rank{win = Target,
                               rank = Rank},
      Role, Label, QuestId, ProgressId, Target, [Rank | _]) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_camp_halloween_rank{}, _Role, _Label,
      _QuestId, _ProgressId, _Target, _) ->
    ok;
event(#evt_camp_halloween_first{}, Role, Label, QuestId,
      ProgressId, _Target, _) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_kill_role_clone{id = Rid},
      Role = #role{name = _Name}, quest_classes = Label,
      QuestId, ProgressId, _Target, Param) ->
    case quest_classes:is_challange_finished(QuestId,
                                             ProgressId,
                                             Rid,
                                             Role)
        of
        true ->
            logger:debug("[~ts]击杀克隆玩家:[Rid:~w]",
                         [_Name, Rid],
                         quest_progress,
                         528),
            case fetch(Role, Label, QuestId, ProgressId) of
                {error, role} -> {ok, Role};
                {error, _} -> remove;
                {ok, _Quest, #quest_progress{finish = Finish}}
                    when Finish =/= 0 ->
                    remove;
                {ok,
                 Quest,
                 P = #quest_progress{target_val = TargetVal,
                                     param = Param}}
                    when 1 >= TargetVal ->
                    RemoveRole = plot_quest:remove_task_unit(Role, Param),
                    Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
                    NewP = P#quest_progress{finish = 1, value = TargetVal,
                                            trigger = undefined},
                    {remove, update(Role1, Label, Quest, ProgressId, NewP)};
                {ok, Quest, P = #quest_progress{value = OldVal}}
                    when 1 > OldVal ->
                    NewP = P#quest_progress{finish = 0, value = 1},
                    {ok, update(Role, Label, Quest, ProgressId, NewP)};
                _ -> ok
            end;
        false -> ok
    end;
event(#evt_kill_role_clone{id = Rid},
      Role = #role{name = _Name}, quest_marriage = Label,
      QuestId, ProgressId, _Target, Param) ->
    case quest_marriage:is_challange_finished(QuestId,
                                              ProgressId,
                                              Rid,
                                              Role)
        of
        true ->
            logger:debug("[~ts]击杀克隆玩家:[Rid:~w]",
                         [_Name, Rid],
                         quest_progress,
                         536),
            case fetch(Role, Label, QuestId, ProgressId) of
                {error, role} -> {ok, Role};
                {error, _} -> remove;
                {ok, _Quest, #quest_progress{finish = Finish}}
                    when Finish =/= 0 ->
                    remove;
                {ok,
                 Quest,
                 P = #quest_progress{target_val = TargetVal,
                                     param = Param}}
                    when 1 >= TargetVal ->
                    RemoveRole = plot_quest:remove_task_unit(Role, Param),
                    Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
                    NewP = P#quest_progress{finish = 1, value = TargetVal,
                                            trigger = undefined},
                    {remove, update(Role1, Label, Quest, ProgressId, NewP)};
                {ok, Quest, P = #quest_progress{value = OldVal}}
                    when 1 > OldVal ->
                    NewP = P#quest_progress{finish = 0, value = 1},
                    {ok, update(Role, Label, Quest, ProgressId, NewP)};
                _ -> ok
            end;
        false -> ok
    end;
event(#evt_kill_role_clone{id = Rid},
      Role = #role{name = _Name}, quest_couple = Label,
      QuestId, ProgressId, _Target, Param) ->
    case quest_couple:is_challange_finished(QuestId,
                                            ProgressId,
                                            Rid,
                                            Role)
        of
        true ->
            logger:debug("[~ts]击杀克隆玩家:[Rid:~w]",
                         [_Name, Rid],
                         quest_progress,
                         544),
            case fetch(Role, Label, QuestId, ProgressId) of
                {error, role} -> {ok, Role};
                {error, _} -> remove;
                {ok, _Quest, #quest_progress{finish = Finish}}
                    when Finish =/= 0 ->
                    remove;
                {ok,
                 Quest,
                 P = #quest_progress{target_val = TargetVal,
                                     param = Param}}
                    when 1 >= TargetVal ->
                    RemoveRole = plot_quest:remove_task_unit(Role, Param),
                    Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
                    NewP = P#quest_progress{finish = 1, value = TargetVal,
                                            trigger = undefined},
                    {remove, update(Role1, Label, Quest, ProgressId, NewP)};
                {ok, Quest, P = #quest_progress{value = OldVal}}
                    when 1 > OldVal ->
                    NewP = P#quest_progress{finish = 0, value = 1},
                    {ok, update(Role, Label, Quest, ProgressId, NewP)};
                _ -> ok
            end;
        false -> ok
    end;
event(_Evt = #evt_kill_role_clone{},
      #role{name = _Name}, _Label, _QuestId, _ProgressId,
      _Target, _Param) ->
    logger:debug("[~ts]击杀克隆玩家:[Evt:~w][Label:~w]",
                 [_Name, _Evt, _Label],
                 quest_progress,
                 550),
    ok;
event(#evt_fight_unit{base_id = BaseId, num = Num},
      Role, Label, QuestId, ProgressId, Target, _Param)
    when BaseId =:= Target orelse Target =:= 0 ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + Num >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0,
                                    value = Value + Num},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_fight_unit{}, _Role, _Label, _QuestId,
      _ProgressId, _Target, _Param) ->
    ok;
event(#evt_get_item{base_id = Target, num = Num}, Role,
      Label, QuestId, ProgressId, Target, []) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + Num >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0,
                                    value = Value + Num},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_get_item{base_id = BaseId, num = Num}, Role,
      Label, QuestId, ProgressId, _Target,
      [{item_type, Type}]) ->
    case item_data:get(BaseId) of
        #item_base{type = Type} ->
            case fetch(Role, Label, QuestId, ProgressId) of
                {error, role} -> {ok, Role};
                {error, _} -> remove;
                {ok, _Quest, #quest_progress{finish = Finish}}
                    when Finish =/= 0 ->
                    remove;
                {ok,
                 Quest,
                 P = #quest_progress{target_val = TargetVal,
                                     value = Value, param = Param}}
                    when Value + Num >= TargetVal ->
                    RemoveRole = plot_quest:remove_task_unit(Role, Param),
                    Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
                    NewP = P#quest_progress{finish = 1, value = TargetVal,
                                            trigger = undefined},
                    {remove, update(Role1, Label, Quest, ProgressId, NewP)};
                {ok, Quest, P = #quest_progress{value = Value}} ->
                    NewP = P#quest_progress{finish = 0,
                                            value = Value + Num},
                    {ok, update(Role, Label, Quest, ProgressId, NewP)}
            end;
        _ -> ok
    end;
event(#evt_get_item{base_id = Target, num = Num}, Role,
      Label, QuestId, ProgressId, Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + Num >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0,
                                    value = Value + Num},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_get_item{}, _Role, _Label, _QuestId,
      _ProgressId, _Target, _Param) ->
    ok;
event(#evt_warrior_fight{win_flag = Target}, Role,
      Label, QuestId, ProgressId, Target, _) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_warrior_fight{}, _Role, _Label, _QuestId,
      _ProgressId, _Target, _Param) ->
    ok;
event(#evt_qualifying_combat_over{win_flag = Target},
      Role, Label, QuestId, ProgressId, Target, _) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_qualifying_combat_over{}, _Role, _Label,
      _QuestId, _ProgressId, _Target, _Param) ->
    ok;
event(#evt_lover_combat{win_flag = Target}, Role, Label,
      QuestId, ProgressId, Target, _) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_lover_combat{}, _Role, _Label, _QuestId,
      _ProgressId, _Target, _Param) ->
    ok;
event(#evt_combat_over{combat_type = CombatType,
                       win_flag = WinFlag},
      Role, Label, QuestId, ProgressId, CombatType,
      [WinFlag]) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_combat_over{combat_type = CombatType}, Role,
      Label, QuestId, ProgressId, CombatType, []) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_combat_over{}, _Role, _Label, _QuestId,
      _ProgressId, _Target, _Param) ->
    ok;
event(#evt_use_item{base_id = Target, num = Num}, Role,
      Label, QuestId, ProgressId, Target, []) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + Num >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0,
                                    value = Value + Num},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_use_item{base_id = BaseId, num = Num}, Role,
      Label, QuestId, ProgressId, _Target, Param) ->
    case is_list(Param) andalso lists:member(BaseId, Param)
        of
        true ->
            case fetch(Role, Label, QuestId, ProgressId) of
                {error, role} -> {ok, Role};
                {error, _} -> remove;
                {ok, _Quest, #quest_progress{finish = Finish}}
                    when Finish =/= 0 ->
                    remove;
                {ok,
                 Quest,
                 P = #quest_progress{target_val = TargetVal,
                                     value = Value, param = Param}}
                    when Value + Num >= TargetVal ->
                    RemoveRole = plot_quest:remove_task_unit(Role, Param),
                    Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
                    NewP = P#quest_progress{finish = 1, value = TargetVal,
                                            trigger = undefined},
                    {remove, update(Role1, Label, Quest, ProgressId, NewP)};
                {ok, Quest, P = #quest_progress{value = Value}} ->
                    NewP = P#quest_progress{finish = 0,
                                            value = Value + Num},
                    {ok, update(Role, Label, Quest, ProgressId, NewP)}
            end;
        _ -> ok
    end;
event(#evt_use_item_type{type = Type}, Role, Label,
      QuestId, ProgressId, Type, []) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_use_item_type{}, _Role, _Label, _QuestId,
      _ProgressId, _Target, _Param) ->
    ok;
event(#evt_del_item{base_id = Target, num = Num}, Role,
      Label, QuestId, ProgressId, Target, []) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + Num >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0,
                                    value = Value + Num},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_del_item{}, _Role, _Label, _QuestId,
      _ProgressId, _Target, _Param) ->
    ok;
event(#evt_gain_coin{},
      Role = #role{assets = #assets{coin = Coin}}, Label,
      QuestId, ProgressId, _Target, [num]) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             param = Param}}
            when Coin >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = OldVal}}
            when Coin > OldVal ->
            NewP = P#quest_progress{finish = 0, value = Coin},
            {ok, update(Role, Label, Quest, ProgressId, NewP)};
        _ -> ok
    end;
event(#evt_gain_coin{val = Num}, Role, Label, QuestId,
      ProgressId, _Target, []) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + Num >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0,
                                    value = Value + Num},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_gain_gold_bind{},
      Role = #role{assets = #assets{gold_bind = Num}}, Label,
      QuestId, ProgressId, _Target, [num]) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             param = Param}}
            when Num >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = OldVal}}
            when Num > OldVal ->
            NewP = P#quest_progress{finish = 0, value = Num},
            {ok, update(Role, Label, Quest, ProgressId, NewP)};
        _ -> ok
    end;
event(#evt_gain_gold_bind{val = Num}, Role, Label,
      QuestId, ProgressId, _Target, []) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + Num >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0,
                                    value = Value + Num},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_loss_coin{val = Num}, Role, Label, QuestId,
      ProgressId, _Target, []) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + Num >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0,
                                    value = Value + Num},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_gain_character{val = Num}, Role, Label,
      QuestId, ProgressId, _Target, []) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + Num >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0,
                                    value = Value + Num},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_arena_cup{cup = Num}, Role, Label, QuestId,
      ProgressId, _Target, []) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             param = Param}}
            when Num >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = OldVal}}
            when Num > OldVal ->
            NewP = P#quest_progress{finish = 0, value = Num},
            {ok, update(Role, Label, Quest, ProgressId, NewP)};
        _ -> ok
    end;
event(#evt_arena_roll{flag = 1, num = Val}, Role, Label,
      QuestId, ProgressId, Num, [finish])
    when Val =< Num ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_arena_roll{flag = 0, num = Val}, Role, Label,
      QuestId, ProgressId, Num, [no_finish])
    when Val >= Num ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_arena_roll{flag = 1}, Role, Label, QuestId,
      ProgressId, _Target, []) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_arena_roll{}, _Role, _Label, _QuestId,
      _ProgressId, _Target, _) ->
    ok;
event(#evt_achi_num{id = Target, num = Num}, Role,
      Label, QuestId, ProgressId, Target, [Num]) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_achi_num{}, _Role, _Label, _QuestId,
      _ProgressId, _Target, _) ->
    ok;
event(#evt_dun_first{id = Target, floor = Num}, Role,
      Label, QuestId, ProgressId, Target, [Num]) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_dun_first{}, _Role, _Label, _QuestId,
      _ProgressId, _Target, _) ->
    ok;
event(#evt_fashion_collect_lev{lev = Lev}, Role, Label,
      QuestId, ProgressId, _Target, []) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             param = Param}}
            when Lev >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = OldVal}}
            when Lev > OldVal ->
            NewP = P#quest_progress{finish = 0, value = Lev},
            {ok, update(Role, Label, Quest, ProgressId, NewP)};
        _ -> ok
    end;
event(#evt_gain_guild{val = Num}, Role, Label, QuestId,
      ProgressId, _Target, []) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + Num >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0,
                                    value = Value + Num},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_campaign_unit_heap2{val = Val}, Role, Label,
      QuestId, ProgressId, _Target, [{val, NeedVal}]) ->
    case Val >= NeedVal of
        true ->
            case fetch(Role, Label, QuestId, ProgressId) of
                {error, role} -> {ok, Role};
                {error, _} -> remove;
                {ok, _Quest, #quest_progress{finish = Finish}}
                    when Finish =/= 0 ->
                    remove;
                {ok,
                 Quest,
                 P = #quest_progress{target_val = TargetVal,
                                     value = Value, param = Param}}
                    when Value + 1 >= TargetVal ->
                    RemoveRole = plot_quest:remove_task_unit(Role, Param),
                    Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
                    NewP = P#quest_progress{finish = 1, value = TargetVal,
                                            trigger = undefined},
                    {remove, update(Role1, Label, Quest, ProgressId, NewP)};
                {ok, Quest, P = #quest_progress{value = Value}} ->
                    NewP = P#quest_progress{finish = 0, value = Value + 1},
                    {ok, update(Role, Label, Quest, ProgressId, NewP)}
            end;
        _ -> ok
    end;
event(#evt_campaign_unit_heap2{}, _Role, _Label,
      _QuestId, _ProgressId, _Target, _Param) ->
    ok;
event(#evt_accept_quest{id = Id}, Role, Label, QuestId,
      ProgressId, _Target, [{sec_type, SecType}]) ->
    case quest_data:get(Id) of
        #quest_data{sec_type = SecType} ->
            case fetch(Role, Label, QuestId, ProgressId) of
                {error, role} -> {ok, Role};
                {error, _} -> remove;
                {ok, _Quest, #quest_progress{finish = Finish}}
                    when Finish =/= 0 ->
                    remove;
                {ok,
                 Quest,
                 P = #quest_progress{target_val = TargetVal,
                                     value = Value, param = Param}}
                    when Value + 1 >= TargetVal ->
                    RemoveRole = plot_quest:remove_task_unit(Role, Param),
                    Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
                    NewP = P#quest_progress{finish = 1, value = TargetVal,
                                            trigger = undefined},
                    {remove, update(Role1, Label, Quest, ProgressId, NewP)};
                {ok, Quest, P = #quest_progress{value = Value}} ->
                    NewP = P#quest_progress{finish = 0, value = Value + 1},
                    {ok, update(Role, Label, Quest, ProgressId, NewP)}
            end;
        _False -> ok
    end;
event(#evt_accept_quest{}, _Role, _Label, _QuestId,
      _ProgressId, _Target, _Param) ->
    ok;
event(#evt_commit_quest{id = Target},
      Role = #role{name = _Name}, Label, QuestId, ProgressId,
      Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_commit_quest{id = Id}, Role, Label, QuestId,
      ProgressId, _Target, [{type, Type}]) ->
    case quest_data:get(Id) of
        #quest_data{type = Type} ->
            case fetch(Role, Label, QuestId, ProgressId) of
                {error, role} -> {ok, Role};
                {error, _} -> remove;
                {ok, _Quest, #quest_progress{finish = Finish}}
                    when Finish =/= 0 ->
                    remove;
                {ok,
                 Quest,
                 P = #quest_progress{target_val = TargetVal,
                                     value = Value, param = Param}}
                    when Value + 1 >= TargetVal ->
                    RemoveRole = plot_quest:remove_task_unit(Role, Param),
                    Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
                    NewP = P#quest_progress{finish = 1, value = TargetVal,
                                            trigger = undefined},
                    {remove, update(Role1, Label, Quest, ProgressId, NewP)};
                {ok, Quest, P = #quest_progress{value = Value}} ->
                    NewP = P#quest_progress{finish = 0, value = Value + 1},
                    {ok, update(Role, Label, Quest, ProgressId, NewP)}
            end;
        _ -> ok
    end;
event(#evt_commit_quest{id = Id}, Role, Label, QuestId,
      ProgressId, _Target, [{sec_type, Type}]) ->
    case quest_data:get(Id) of
        #quest_data{sec_type = Type} ->
            case fetch(Role, Label, QuestId, ProgressId) of
                {error, role} -> {ok, Role};
                {error, _} -> remove;
                {ok, _Quest, #quest_progress{finish = Finish}}
                    when Finish =/= 0 ->
                    remove;
                {ok,
                 Quest,
                 P = #quest_progress{target_val = TargetVal,
                                     value = Value, param = Param}}
                    when Value + 1 >= TargetVal ->
                    RemoveRole = plot_quest:remove_task_unit(Role, Param),
                    Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
                    NewP = P#quest_progress{finish = 1, value = TargetVal,
                                            trigger = undefined},
                    {remove, update(Role1, Label, Quest, ProgressId, NewP)};
                {ok, Quest, P = #quest_progress{value = Value}} ->
                    NewP = P#quest_progress{finish = 0, value = Value + 1},
                    {ok, update(Role, Label, Quest, ProgressId, NewP)}
            end;
        _ -> ok
    end;
event(#evt_commit_quest{id = Id},
      Role = #role{m_quest =
                       #m_quest{quest_prac =
                                    #quest_prac{part = CurPart,
                                                chapter = CurChapter}}},
      Label, QuestId, ProgressId, _Target,
      [{quest_prac, Part, Chapter}]) ->
    case quest_data:get(Id) of
        #quest_data{sec_type = SecType}
            when SecType =:= 5 orelse SecType =:= 6 ->
            case CurPart >= Part of
                true ->
                    case CurChapter > Chapter of
                        true ->
                            case fetch(Role, Label, QuestId, ProgressId) of
                                {error, role} -> {ok, Role};
                                {error, _} -> remove;
                                {ok, _Quest, #quest_progress{finish = Finish}}
                                    when Finish =/= 0 ->
                                    remove;
                                {ok,
                                 Quest,
                                 P = #quest_progress{target_val = TargetVal,
                                                     value = Value,
                                                     param = Param}}
                                    when Value + 1 >= TargetVal ->
                                    RemoveRole =
                                        plot_quest:remove_task_unit(Role,
                                                                    Param),
                                    Role1 = monitor_quest_prog(Label,
                                                               P,
                                                               Quest,
                                                               RemoveRole),
                                    NewP = P#quest_progress{finish = 1,
                                                            value = TargetVal,
                                                            trigger =
                                                                undefined},
                                    {remove,
                                     update(Role1,
                                            Label,
                                            Quest,
                                            ProgressId,
                                            NewP)};
                                {ok,
                                 Quest,
                                 P = #quest_progress{value = Value}} ->
                                    NewP = P#quest_progress{finish = 0,
                                                            value = Value + 1},
                                    {ok,
                                     update(Role,
                                            Label,
                                            Quest,
                                            ProgressId,
                                            NewP)}
                            end;
                        false -> ok
                    end;
                false -> ok
            end;
        _ -> ok
    end;
event(#evt_commit_quest{id = Id}, Role, Label, QuestId,
      ProgressId, _Target, [{quest_kill, Num}]) ->
    case quest_data:get(Id) of
        #quest_data{sec_type = 10} ->
            Count = quest_kill:get_total_num(Role),
            case Count >= Num of
                true ->
                    case fetch(Role, Label, QuestId, ProgressId) of
                        {error, role} -> {ok, Role};
                        {error, _} -> remove;
                        {ok, _Quest, #quest_progress{finish = Finish}}
                            when Finish =/= 0 ->
                            remove;
                        {ok,
                         Quest,
                         P = #quest_progress{target_val = TargetVal,
                                             value = Value, param = Param}}
                            when Value + 1 >= TargetVal ->
                            RemoveRole = plot_quest:remove_task_unit(Role,
                                                                     Param),
                            Role1 = monitor_quest_prog(Label,
                                                       P,
                                                       Quest,
                                                       RemoveRole),
                            NewP = P#quest_progress{finish = 1,
                                                    value = TargetVal,
                                                    trigger = undefined},
                            {remove,
                             update(Role1, Label, Quest, ProgressId, NewP)};
                        {ok, Quest, P = #quest_progress{value = Value}} ->
                            NewP = P#quest_progress{finish = 0,
                                                    value = Value + 1},
                            {ok, update(Role, Label, Quest, ProgressId, NewP)}
                    end;
                false -> ok
            end;
        _ -> ok
    end;
event(#evt_commit_quest{id = Id},
      Role = #role{m_quest =
                       #m_quest{quest_guild = #quest_guild{round = CurRound}}},
      Label, QuestId, ProgressId, _Target,
      [{quest_guild, Round}]) ->
    case quest_data:get(Id) of
        #quest_data{sec_type = 12} ->
            case CurRound >= Round of
                true ->
                    case fetch(Role, Label, QuestId, ProgressId) of
                        {error, role} -> {ok, Role};
                        {error, _} -> remove;
                        {ok, _Quest, #quest_progress{finish = Finish}}
                            when Finish =/= 0 ->
                            remove;
                        {ok,
                         Quest,
                         P = #quest_progress{target_val = TargetVal,
                                             param = Param}}
                            when 1 >= TargetVal ->
                            RemoveRole = plot_quest:remove_task_unit(Role,
                                                                     Param),
                            Role1 = monitor_quest_prog(Label,
                                                       P,
                                                       Quest,
                                                       RemoveRole),
                            NewP = P#quest_progress{finish = 1,
                                                    value = TargetVal,
                                                    trigger = undefined},
                            {remove,
                             update(Role1, Label, Quest, ProgressId, NewP)};
                        {ok, Quest, P = #quest_progress{value = OldVal}}
                            when 1 > OldVal ->
                            NewP = P#quest_progress{finish = 0, value = 1},
                            {ok, update(Role, Label, Quest, ProgressId, NewP)};
                        _ -> ok
                    end;
                false -> ok
            end;
        _ -> ok
    end;
event(#evt_commit_quest{id = Id},
      Role = #role{m_quest =
                       #m_quest{quest_treasure =
                                    #quest_treasure{round = CurRound}}},
      Label, QuestId, ProgressId, _Target,
      [{quest_treasure, Round}]) ->
    case quest_data:get(Id) of
        #quest_data{sec_type = 11} ->
            case CurRound >= Round of
                true ->
                    case fetch(Role, Label, QuestId, ProgressId) of
                        {error, role} -> {ok, Role};
                        {error, _} -> remove;
                        {ok, _Quest, #quest_progress{finish = Finish}}
                            when Finish =/= 0 ->
                            remove;
                        {ok,
                         Quest,
                         P = #quest_progress{target_val = TargetVal,
                                             param = Param}}
                            when 1 >= TargetVal ->
                            RemoveRole = plot_quest:remove_task_unit(Role,
                                                                     Param),
                            Role1 = monitor_quest_prog(Label,
                                                       P,
                                                       Quest,
                                                       RemoveRole),
                            NewP = P#quest_progress{finish = 1,
                                                    value = TargetVal,
                                                    trigger = undefined},
                            {remove,
                             update(Role1, Label, Quest, ProgressId, NewP)};
                        {ok, Quest, P = #quest_progress{value = OldVal}}
                            when 1 > OldVal ->
                            NewP = P#quest_progress{finish = 0, value = 1},
                            {ok, update(Role, Label, Quest, ProgressId, NewP)};
                        _ -> ok
                    end;
                false -> ok
            end;
        _ -> ok
    end;
event(#evt_commit_quest{id = Id},
      Role = #role{m_quest =
                       #m_quest{quest_classes =
                                    #quest_classes{round = CurRound}}},
      Label, QuestId, ProgressId, _Target,
      [{quest_classes, Round}]) ->
    case quest_data:get(Id) of
        #quest_data{sec_type = 4} ->
            case CurRound >= Round of
                true ->
                    case fetch(Role, Label, QuestId, ProgressId) of
                        {error, role} -> {ok, Role};
                        {error, _} -> remove;
                        {ok, _Quest, #quest_progress{finish = Finish}}
                            when Finish =/= 0 ->
                            remove;
                        {ok,
                         Quest,
                         P = #quest_progress{target_val = TargetVal,
                                             param = Param}}
                            when 1 >= TargetVal ->
                            RemoveRole = plot_quest:remove_task_unit(Role,
                                                                     Param),
                            Role1 = monitor_quest_prog(Label,
                                                       P,
                                                       Quest,
                                                       RemoveRole),
                            NewP = P#quest_progress{finish = 1,
                                                    value = TargetVal,
                                                    trigger = undefined},
                            {remove,
                             update(Role1, Label, Quest, ProgressId, NewP)};
                        {ok, Quest, P = #quest_progress{value = OldVal}}
                            when 1 > OldVal ->
                            NewP = P#quest_progress{finish = 0, value = 1},
                            {ok, update(Role, Label, Quest, ProgressId, NewP)};
                        _ -> ok
                    end;
                false -> ok
            end;
        _ -> ok
    end;
event(#evt_commit_quest{id = Id},
      Role = #role{m_quest =
                       #m_quest{quest_pursue =
                                    #quest_pursue{round = CurRound}}},
      Label, QuestId, ProgressId, _Target,
      [{quest_pursue, Round}]) ->
    case quest_data:get(Id) of
        #quest_data{sec_type = 21} ->
            case CurRound >= Round of
                true ->
                    case fetch(Role, Label, QuestId, ProgressId) of
                        {error, role} -> {ok, Role};
                        {error, _} -> remove;
                        {ok, _Quest, #quest_progress{finish = Finish}}
                            when Finish =/= 0 ->
                            remove;
                        {ok,
                         Quest,
                         P = #quest_progress{target_val = TargetVal,
                                             param = Param}}
                            when 1 >= TargetVal ->
                            RemoveRole = plot_quest:remove_task_unit(Role,
                                                                     Param),
                            Role1 = monitor_quest_prog(Label,
                                                       P,
                                                       Quest,
                                                       RemoveRole),
                            NewP = P#quest_progress{finish = 1,
                                                    value = TargetVal,
                                                    trigger = undefined},
                            {remove,
                             update(Role1, Label, Quest, ProgressId, NewP)};
                        {ok, Quest, P = #quest_progress{value = OldVal}}
                            when 1 > OldVal ->
                            NewP = P#quest_progress{finish = 0, value = 1},
                            {ok, update(Role, Label, Quest, ProgressId, NewP)};
                        _ -> ok
                    end;
                false -> ok
            end;
        _ -> ok
    end;
event(#evt_commit_quest{id = Id},
      Role = #role{m_quest =
                       #m_quest{quest_child = #quest_child{round = CurRound}}},
      Label, QuestId, ProgressId, _Target,
      [{quest_child, Round}]) ->
    case quest_data:get(Id) of
        #quest_data{sec_type = 23} ->
            case CurRound >= Round of
                true ->
                    case fetch(Role, Label, QuestId, ProgressId) of
                        {error, role} -> {ok, Role};
                        {error, _} -> remove;
                        {ok, _Quest, #quest_progress{finish = Finish}}
                            when Finish =/= 0 ->
                            remove;
                        {ok,
                         Quest,
                         P = #quest_progress{target_val = TargetVal,
                                             param = Param}}
                            when 1 >= TargetVal ->
                            RemoveRole = plot_quest:remove_task_unit(Role,
                                                                     Param),
                            Role1 = monitor_quest_prog(Label,
                                                       P,
                                                       Quest,
                                                       RemoveRole),
                            NewP = P#quest_progress{finish = 1,
                                                    value = TargetVal,
                                                    trigger = undefined},
                            {remove,
                             update(Role1, Label, Quest, ProgressId, NewP)};
                        {ok, Quest, P = #quest_progress{value = OldVal}}
                            when 1 > OldVal ->
                            NewP = P#quest_progress{finish = 0, value = 1},
                            {ok, update(Role, Label, Quest, ProgressId, NewP)};
                        _ -> ok
                    end;
                false -> ok
            end;
        _ -> ok
    end;
event(#evt_commit_quest{id = Id},
      Role = #role{m_quest =
                       #m_quest{quest_pregnancy =
                                    #quest_pregnancy{round = CurRound}}},
      Label, QuestId, ProgressId, _Target,
      [{quest_pregnancy, Round}]) ->
    case quest_data:get(Id) of
        #quest_data{sec_type = 24} ->
            case CurRound >= Round of
                true ->
                    case fetch(Role, Label, QuestId, ProgressId) of
                        {error, role} -> {ok, Role};
                        {error, _} -> remove;
                        {ok, _Quest, #quest_progress{finish = Finish}}
                            when Finish =/= 0 ->
                            remove;
                        {ok,
                         Quest,
                         P = #quest_progress{target_val = TargetVal,
                                             param = Param}}
                            when 1 >= TargetVal ->
                            RemoveRole = plot_quest:remove_task_unit(Role,
                                                                     Param),
                            Role1 = monitor_quest_prog(Label,
                                                       P,
                                                       Quest,
                                                       RemoveRole),
                            NewP = P#quest_progress{finish = 1,
                                                    value = TargetVal,
                                                    trigger = undefined},
                            {remove,
                             update(Role1, Label, Quest, ProgressId, NewP)};
                        {ok, Quest, P = #quest_progress{value = OldVal}}
                            when 1 > OldVal ->
                            NewP = P#quest_progress{finish = 0, value = 1},
                            {ok, update(Role, Label, Quest, ProgressId, NewP)};
                        _ -> ok
                    end;
                false -> ok
            end;
        _ -> ok
    end;
event(#evt_commit_quest{sec_type = Target}, Role, Label,
      QuestId, ProgressId, Target, [sec_type]) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_commit_quest{id = Id}, Role, Label, QuestId,
      ProgressId, _Target, Param) ->
    case lists:member(Id, Param) of
        true ->
            case fetch(Role, Label, QuestId, ProgressId) of
                {error, role} -> {ok, Role};
                {error, _} -> remove;
                {ok, _Quest, #quest_progress{finish = Finish}}
                    when Finish =/= 0 ->
                    remove;
                {ok,
                 Quest,
                 P = #quest_progress{target_val = TargetVal,
                                     value = Value, param = Param}}
                    when Value + 1 >= TargetVal ->
                    RemoveRole = plot_quest:remove_task_unit(Role, Param),
                    Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
                    NewP = P#quest_progress{finish = 1, value = TargetVal,
                                            trigger = undefined},
                    {remove, update(Role1, Label, Quest, ProgressId, NewP)};
                {ok, Quest, P = #quest_progress{value = Value}} ->
                    NewP = P#quest_progress{finish = 0, value = Value + 1},
                    {ok, update(Role, Label, Quest, ProgressId, NewP)}
            end;
        _ -> ok
    end;
event(#evt_quest_offer_ring{ring = Ring,
                            old_ring = OldRing},
      Role, Label, QuestId, ProgressId, _Target, Param) ->
    case Ring =/= OldRing of
        true ->
            case fetch(Role, Label, QuestId, ProgressId) of
                {error, role} -> {ok, Role};
                {error, _} -> remove;
                {ok, _Quest, #quest_progress{finish = Finish}}
                    when Finish =/= 0 ->
                    remove;
                {ok,
                 Quest,
                 P = #quest_progress{target_val = TargetVal,
                                     value = Value, param = Param}}
                    when Value + 1 >= TargetVal ->
                    RemoveRole = plot_quest:remove_task_unit(Role, Param),
                    Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
                    NewP = P#quest_progress{finish = 1, value = TargetVal,
                                            trigger = undefined},
                    {remove, update(Role1, Label, Quest, ProgressId, NewP)};
                {ok, Quest, P = #quest_progress{value = Value}} ->
                    NewP = P#quest_progress{finish = 0, value = Value + 1},
                    {ok, update(Role, Label, Quest, ProgressId, NewP)}
            end;
        false -> ok
    end;
event(#evt_cli_loaded{mod = Mod}, Role, Label, QuestId,
      ProgressId, Target, _Param)
    when Mod =:= Target orelse Target =:= 0 ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_cli_loaded{}, _Role, _Label, _QuestId,
      _ProgressId, _Target, _Param) ->
    ok;
event(#evt_enter_map{base_id = BaseId}, Role, Label,
      QuestId, ProgressId, Target, [])
    when Target =:= BaseId orelse Target =:= 0 ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_enter_map{base_id = BaseId}, Role, Label,
      QuestId, ProgressId, _Target, Param) ->
    case lists:member(BaseId, Param) of
        true ->
            case fetch(Role, Label, QuestId, ProgressId) of
                {error, role} -> {ok, Role};
                {error, _} -> remove;
                {ok, _Quest, #quest_progress{finish = Finish}}
                    when Finish =/= 0 ->
                    remove;
                {ok,
                 Quest,
                 P = #quest_progress{target_val = TargetVal,
                                     value = Value, param = Param}}
                    when Value + 1 >= TargetVal ->
                    RemoveRole = plot_quest:remove_task_unit(Role, Param),
                    Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
                    NewP = P#quest_progress{finish = 1, value = TargetVal,
                                            trigger = undefined},
                    {remove, update(Role1, Label, Quest, ProgressId, NewP)};
                {ok, Quest, P = #quest_progress{value = Value}} ->
                    NewP = P#quest_progress{finish = 0, value = Value + 1},
                    {ok, update(Role, Label, Quest, ProgressId, NewP)}
            end;
        _ ->
            logger:debug("[~ts]进入场景事件:~w",
                         [Role#role.name, BaseId],
                         quest_progress,
                         838),
            ok
    end;
event(#evt_leave_map{base_id = BaseId}, Role, Label,
      QuestId, ProgressId, Target, [])
    when Target =:= BaseId orelse Target =:= 0 ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_leave_map{base_id = BaseId}, Role, Label,
      QuestId, ProgressId, _Target, Param) ->
    case lists:member(BaseId, Param) of
        true ->
            case fetch(Role, Label, QuestId, ProgressId) of
                {error, role} -> {ok, Role};
                {error, _} -> remove;
                {ok, _Quest, #quest_progress{finish = Finish}}
                    when Finish =/= 0 ->
                    remove;
                {ok,
                 Quest,
                 P = #quest_progress{target_val = TargetVal,
                                     value = Value, param = Param}}
                    when Value + 1 >= TargetVal ->
                    RemoveRole = plot_quest:remove_task_unit(Role, Param),
                    Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
                    NewP = P#quest_progress{finish = 1, value = TargetVal,
                                            trigger = undefined},
                    {remove, update(Role1, Label, Quest, ProgressId, NewP)};
                {ok, Quest, P = #quest_progress{value = Value}} ->
                    NewP = P#quest_progress{finish = 0, value = Value + 1},
                    {ok, update(Role, Label, Quest, ProgressId, NewP)}
            end;
        _ -> ok
    end;
event(#evt_move_map{},
      Role = #role{pos =
                       #pos{map_base_id = BaseId, x = X, y = Y}},
      Label, QuestId, ProgressId, Target, [DestX, DestY, R])
    when Target =:= BaseId orelse Target =:= 0 ->
    case abs(X - DestX) < R andalso abs(Y - DestY) < R of
        true ->
            case fetch(Role, Label, QuestId, ProgressId) of
                {error, role} -> {ok, Role};
                {error, _} -> remove;
                {ok, _Quest, #quest_progress{finish = Finish}}
                    when Finish =/= 0 ->
                    remove;
                {ok,
                 Quest,
                 P = #quest_progress{target_val = TargetVal,
                                     value = Value, param = Param}}
                    when Value + 1 >= TargetVal ->
                    RemoveRole = plot_quest:remove_task_unit(Role, Param),
                    Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
                    NewP = P#quest_progress{finish = 1, value = TargetVal,
                                            trigger = undefined},
                    {remove, update(Role1, Label, Quest, ProgressId, NewP)};
                {ok, Quest, P = #quest_progress{value = Value}} ->
                    NewP = P#quest_progress{finish = 0, value = Value + 1},
                    {ok, update(Role, Label, Quest, ProgressId, NewP)}
            end;
        _ -> ok
    end;
event(#evt_move_map{}, _Role, _Label, _QuestId,
      _ProgressId, _Target, _Param) ->
    ok;
event(#evt_pet_skill{},
      Role = #role{m_pet = #m_pet{pets = Pets}}, Label,
      QuestId, ProgressId, Target, [one_count]) ->
    L = [pet_skill:all_skill(Pet) || Pet <- Pets],
    L2 = [BaseSkills ++ StoneSkills
          || {BaseSkills, StoneSkills, _, _, _, _} <- L],
    L3 = [[skill_data:get_pet({SId, SLev})
           || {SId, SLev} <- SL]
          || SL <- L2],
    L4 = [length([1
                  || #pet_base_skill{step = Step} <- SL, Step >= Target])
          || SL <- L3],
    case L4 of
        [] -> ok;
        List ->
            Max = lists:max(List),
            case fetch(Role, Label, QuestId, ProgressId) of
                {error, role} -> {ok, Role};
                {error, _} -> remove;
                {ok, _Quest, #quest_progress{finish = Finish}}
                    when Finish =/= 0 ->
                    remove;
                {ok,
                 Quest,
                 P = #quest_progress{target_val = TargetVal,
                                     param = Param}}
                    when Max >= TargetVal ->
                    RemoveRole = plot_quest:remove_task_unit(Role, Param),
                    Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
                    NewP = P#quest_progress{finish = 1, value = TargetVal,
                                            trigger = undefined},
                    {remove, update(Role1, Label, Quest, ProgressId, NewP)};
                {ok, Quest, P = #quest_progress{value = OldVal}}
                    when Max > OldVal ->
                    NewP = P#quest_progress{finish = 0, value = Max},
                    {ok, update(Role, Label, Quest, ProgressId, NewP)};
                _ -> ok
            end
    end;
event(#evt_pet_skill{}, _Role, _Label, _QuestId,
      _ProgressId, _Target, _Param) ->
    ok;
event(#evt_skill_up{id = Id}, Role, Label, QuestId,
      ProgressId, 0, [])
    when Id > 0 ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_skill_up{}, Role, Label, QuestId, ProgressId,
      Target, []) ->
    Skills = skill:get_total_skill(Role),
    Num = lists:sum([1
                     || {_SkillId, Lev} <- Skills, Lev >= Target]),
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             param = Param}}
            when Num >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = OldVal}}
            when Num > OldVal ->
            NewP = P#quest_progress{finish = 0, value = Num},
            {ok, update(Role, Label, Quest, ProgressId, NewP)};
        _ -> ok
    end;
event(#evt_skill_up{}, _Role, _Label, _QuestId,
      _ProgressId, _Target, _Param) ->
    ok;
event(#evt_skill_unique_up{}, Role, Label, QuestId,
      ProgressId, _Target, []) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_skill_life_produce{num = Num, id = SkillId},
      Role, Label, QuestId, ProgressId, _Target,
      [{skill, SkillId}]) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + Num >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0,
                                    value = Value + Num},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_skill_life_produce{num = Num}, Role, Label,
      QuestId, ProgressId, 0, []) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + Num >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0,
                                    value = Value + Num},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_skill_life_produce{base_id = BaseId,
                              num = Num},
      Role, Label, QuestId, ProgressId, BaseId, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + Num >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0,
                                    value = Value + Num},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_skill_life_produce{}, _Role, _Label,
      _QuestId, _ProgressId, _Target, _Param) ->
    ok;
event(#evt_skill_life_levup{lev = Lev}, Role, Label,
      QuestId, ProgressId, 0, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             param = Param}}
            when Lev >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = OldVal}}
            when Lev > OldVal ->
            NewP = P#quest_progress{finish = 0, value = Lev},
            {ok, update(Role, Label, Quest, ProgressId, NewP)};
        _ -> ok
    end;
event(#evt_skill_life_levup{lev = Lev, id = Target},
      Role, Label, QuestId, ProgressId, Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             param = Param}}
            when Lev >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = OldVal}}
            when Lev > OldVal ->
            NewP = P#quest_progress{finish = 0, value = Lev},
            {ok, update(Role, Label, Quest, ProgressId, NewP)};
        _ -> ok
    end;
event(#evt_skill_life_levup{}, _Role, _Label, _QuestId,
      _ProgressId, _Target, _Param) ->
    ok;
event(#evt_skill_prac_levup{},
      Role = #role{m_skill = #m_skill{skill_prac = Skills}},
      Label, QuestId, ProgressId, _Target,
      [{lev, TargetLev}]) ->
    Num = length([S
                  || S = #skl_prac{lev = Lev} <- Skills,
                     Lev >= TargetLev]),
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             param = Param}}
            when Num >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = OldVal}}
            when Num > OldVal ->
            NewP = P#quest_progress{finish = 0, value = Num},
            {ok, update(Role, Label, Quest, ProgressId, NewP)};
        _ -> ok
    end;
event(#evt_skill_prac_levup{}, _Role, _Label, _QuestId,
      _ProgressId, _Target, _Param) ->
    ok;
event(#evt_guard{base_id = Target}, Role, Label,
      QuestId, ProgressId, Target, Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             param = Param}}
            when 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = OldVal}}
            when 1 > OldVal ->
            NewP = P#quest_progress{finish = 0, value = 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)};
        _ -> ok
    end;
event(#evt_guard{}, Role, Label, QuestId, ProgressId, 0,
      Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_guard{}, _Role, _Label, _QuestId,
      _ProgressId, _Target, _Param) ->
    ok;
event(#evt_guard_activate{}, Role, Label, QuestId,
      ProgressId, _Target, Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_guard_upgrade_eqm{}, Role, Label, QuestId,
      ProgressId, _Target, [{lev_num, TargetLev}]) ->
    Count = guard_eqm:get_guard_eqm_lev_count(Role,
                                              TargetLev),
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             param = Param}}
            when Count >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = OldVal}}
            when Count > OldVal ->
            NewP = P#quest_progress{finish = 0, value = Count},
            {ok, update(Role, Label, Quest, ProgressId, NewP)};
        _ -> ok
    end;
event(#evt_guard_upgrade_eqm{}, Role, Label, QuestId,
      ProgressId, _Target, [{all_lev, TargetLev}]) ->
    logger:debug("[~ts]所有守护装备达到指定等级TargetLev:~w, quest_id:~w",
                 [Role#role.name, TargetLev, QuestId],
                 quest_progress,
                 930),
    case guard_eqm:check_guard_eqm_all_lev(Role, TargetLev)
        of
        true ->
            case fetch(Role, Label, QuestId, ProgressId) of
                {error, role} -> {ok, Role};
                {error, _} -> remove;
                {ok, _Quest, #quest_progress{finish = Finish}}
                    when Finish =/= 0 ->
                    remove;
                {ok,
                 Quest,
                 P = #quest_progress{target_val = TargetVal,
                                     param = Param}}
                    when 1 >= TargetVal ->
                    RemoveRole = plot_quest:remove_task_unit(Role, Param),
                    Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
                    NewP = P#quest_progress{finish = 1, value = TargetVal,
                                            trigger = undefined},
                    {remove, update(Role1, Label, Quest, ProgressId, NewP)};
                {ok, Quest, P = #quest_progress{value = OldVal}}
                    when 1 > OldVal ->
                    NewP = P#quest_progress{finish = 0, value = 1},
                    {ok, update(Role, Label, Quest, ProgressId, NewP)};
                _ -> ok
            end;
        _ -> ok
    end;
event(#evt_guard_upgrade_eqm{}, Role, Label, QuestId,
      ProgressId, _Target, [{guard_eqm_lev, TargetLev}]) ->
    Count = guard_eqm:get_eqm_lev_guard_count(Role,
                                              TargetLev),
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             param = Param}}
            when Count >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = OldVal}}
            when Count > OldVal ->
            NewP = P#quest_progress{finish = 0, value = Count},
            {ok, update(Role, Label, Quest, ProgressId, NewP)};
        _ -> ok
    end;
event(#evt_guard_upgrade_eqm{}, Role, Label, QuestId,
      ProgressId, _Target, Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_guard_embed_gem{}, Role, Label, QuestId,
      ProgressId, _Target, [{all_num, TargetNum}]) ->
    logger:debug("[~ts]镶嵌守护装备宝石TargetNum:~w, quest_id:~w",
                 [Role#role.name, TargetNum, QuestId],
                 quest_progress,
                 943),
    case guard_eqm:check_embed_gem_all_num(Role, TargetNum)
        of
        true ->
            case fetch(Role, Label, QuestId, ProgressId) of
                {error, role} -> {ok, Role};
                {error, _} -> remove;
                {ok, _Quest, #quest_progress{finish = Finish}}
                    when Finish =/= 0 ->
                    remove;
                {ok,
                 Quest,
                 P = #quest_progress{target_val = TargetVal,
                                     param = Param}}
                    when 1 >= TargetVal ->
                    RemoveRole = plot_quest:remove_task_unit(Role, Param),
                    Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
                    NewP = P#quest_progress{finish = 1, value = TargetVal,
                                            trigger = undefined},
                    {remove, update(Role1, Label, Quest, ProgressId, NewP)};
                {ok, Quest, P = #quest_progress{value = OldVal}}
                    when 1 > OldVal ->
                    NewP = P#quest_progress{finish = 0, value = 1},
                    {ok, update(Role, Label, Quest, ProgressId, NewP)};
                _ -> ok
            end;
        _ -> ok
    end;
event(#evt_guard_embed_gem{}, Role, Label, QuestId,
      ProgressId, _Target, Param) ->
    logger:debug("[~ts]镶嵌守护装备宝石quest_id:~w",
                 [Role#role.name, QuestId],
                 quest_progress,
                 950),
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_guard_reset_eqm{}, Role, Label, QuestId,
      ProgressId, _Target, Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_guard_score{val = Score}, Role, Label,
      QuestId, ProgressId, _Target, Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             param = Param}}
            when Score >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = OldVal}}
            when Score > OldVal ->
            NewP = P#quest_progress{finish = 0, value = Score},
            {ok, update(Role, Label, Quest, ProgressId, NewP)};
        _ -> ok
    end;
event(#evt_unit_click{base_id = BaseId}, Role, Label,
      QuestId, ProgressId, Target, [])
    when BaseId =:= Target orelse Target =:= 0 ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_unit_click{base_id = BaseId}, Role, Label,
      QuestId, ProgressId, Target, _Param)
    when BaseId =:= Target orelse Target =:= 0 ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_unit_click{base_id = BaseId}, Role, Label,
      QuestId, ProgressId, _Target, Param = [_ | _]) ->
    case lists:member(BaseId, Param) of
        true ->
            case fetch(Role, Label, QuestId, ProgressId) of
                {error, role} -> {ok, Role};
                {error, _} -> remove;
                {ok, _Quest, #quest_progress{finish = Finish}}
                    when Finish =/= 0 ->
                    remove;
                {ok,
                 Quest,
                 P = #quest_progress{target_val = TargetVal,
                                     value = Value, param = Param}}
                    when Value + 1 >= TargetVal ->
                    RemoveRole = plot_quest:remove_task_unit(Role, Param),
                    Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
                    NewP = P#quest_progress{finish = 1, value = TargetVal,
                                            trigger = undefined},
                    {remove, update(Role1, Label, Quest, ProgressId, NewP)};
                {ok, Quest, P = #quest_progress{value = Value}} ->
                    NewP = P#quest_progress{finish = 0, value = Value + 1},
                    {ok, update(Role, Label, Quest, ProgressId, NewP)}
            end;
        _ -> ok
    end;
event(#evt_unit_click{}, _Role, _Label, _QuestId,
      _ProgressId, _Target, _Param) ->
    ok;
event(#evt_select_pet{}, Role, Label, QuestId,
      ProgressId, _Target, []) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_guild{}, Role, Label, QuestId, ProgressId,
      _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             param = Param}}
            when 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = OldVal}}
            when 1 > OldVal ->
            NewP = P#quest_progress{finish = 0, value = 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)};
        _ -> ok
    end;
event(#evt_guild_leave{}, Role, Label, QuestId,
      ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             param = Param}}
            when 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = OldVal}}
            when 1 > OldVal ->
            NewP = P#quest_progress{finish = 0, value = 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)};
        _ -> ok
    end;
event(#evt_eqm{},
      Role = #role{p_eqm = #package{items = Eqms}}, Label,
      QuestId, ProgressId, _, [{eqm_lev, Conds}]) ->
    case lists:keytake(lev, 1, Conds) of
        {value, {lev, RequireLev}, [{num, RequireNum}]} ->
            RequireEqms = [1
                           || #item{lev = Lev} <- Eqms, Lev >= RequireLev],
            case length(RequireEqms) >= RequireNum of
                true ->
                    case fetch(Role, Label, QuestId, ProgressId) of
                        {error, role} -> {ok, Role};
                        {error, _} -> remove;
                        {ok, _Quest, #quest_progress{finish = Finish}}
                            when Finish =/= 0 ->
                            remove;
                        {ok,
                         Quest,
                         P = #quest_progress{target_val = TargetVal,
                                             param = Param}}
                            when 1 >= TargetVal ->
                            RemoveRole = plot_quest:remove_task_unit(Role,
                                                                     Param),
                            Role1 = monitor_quest_prog(Label,
                                                       P,
                                                       Quest,
                                                       RemoveRole),
                            NewP = P#quest_progress{finish = 1,
                                                    value = TargetVal,
                                                    trigger = undefined},
                            {remove,
                             update(Role1, Label, Quest, ProgressId, NewP)};
                        {ok, Quest, P = #quest_progress{value = OldVal}}
                            when 1 > OldVal ->
                            NewP = P#quest_progress{finish = 0, value = 1},
                            {ok, update(Role, Label, Quest, ProgressId, NewP)};
                        _ -> ok
                    end;
                false -> ok
            end;
        _ -> ok
    end;
event(#evt_eqm{},
      Role = #role{p_eqm = #package{items = Eqms}}, Label,
      QuestId, ProgressId, _, [{eqm_lev_num, RequireLev}]) ->
    RequireEqms = [1
                   || #item{lev = Lev} <- Eqms, Lev >= RequireLev],
    Num = length(RequireEqms),
    logger:debug("装备套装变化:~w",
                 [{Num, RequireLev, Label, QuestId, ProgressId}],
                 quest_progress,
                 1004),
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             param = Param}}
            when Num >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = OldVal}}
            when Num > OldVal ->
            NewP = P#quest_progress{finish = 0, value = Num},
            {ok, update(Role, Label, Quest, ProgressId, NewP)};
        _ -> ok
    end;
event(#evt_eqm{}, _Role, _Label, _QuestId, _ProgressId,
      _, _Param) ->
    ok;
event(#evt_blacksmith_embed{num = Num}, Role, Label,
      QuestId, ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             param = Param}}
            when Num >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = OldVal}}
            when Num > OldVal ->
            NewP = P#quest_progress{finish = 0, value = Num},
            {ok, update(Role, Label, Quest, ProgressId, NewP)};
        _ -> ok
    end;
event(#evt_blacksmith_embed_lev{},
      Role = #role{name = _Name,
                   p_eqm = #package{items = Items}},
      Label, QuestId, ProgressId, Target, _Param) ->
    AttrList = lists:append([Attr
                             || #item{attr = Attr} <- Items]),
    StoneList = [blacksmith_data:get_stone(Val)
                 || #attr_base{type = 3, val = Val} <- AttrList,
                    Val > 0],
    Count = erlang:length([Lev
                           || #{lev := Lev} <- StoneList, Lev >= Target]),
    logger:debug("装备镶嵌宝石等级[~ts]~w",
                 [_Name, {Count}],
                 quest_progress,
                 1018),
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             param = Param}}
            when Count >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = OldVal}}
            when Count > OldVal ->
            NewP = P#quest_progress{finish = 0, value = Count},
            {ok, update(Role, Label, Quest, ProgressId, NewP)};
        _ -> ok
    end;
event(#evt_pet_war{base_id = Target}, Role, Label,
      QuestId, ProgressId, Target, []) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             param = Param}}
            when 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = OldVal}}
            when 1 > OldVal ->
            NewP = P#quest_progress{finish = 0, value = 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)};
        _ -> ok
    end;
event(#evt_pet_war{},
      Role = #role{m_pet = #m_pet{pets = Pets}}, Label,
      QuestId, ProgressId, _Target, [{num, Val}]) ->
    L = [Id
         || #pet{id = Id, status = Status} <- Pets,
            Status =:= 1],
    case length(L) >= Val of
        true ->
            case fetch(Role, Label, QuestId, ProgressId) of
                {error, role} -> {ok, Role};
                {error, _} -> remove;
                {ok, _Quest, #quest_progress{finish = Finish}}
                    when Finish =/= 0 ->
                    remove;
                {ok,
                 Quest,
                 P = #quest_progress{target_val = TargetVal,
                                     param = Param}}
                    when 1 >= TargetVal ->
                    RemoveRole = plot_quest:remove_task_unit(Role, Param),
                    Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
                    NewP = P#quest_progress{finish = 1, value = TargetVal,
                                            trigger = undefined},
                    {remove, update(Role1, Label, Quest, ProgressId, NewP)};
                {ok, Quest, P = #quest_progress{value = OldVal}}
                    when 1 > OldVal ->
                    NewP = P#quest_progress{finish = 0, value = 1},
                    {ok, update(Role, Label, Quest, ProgressId, NewP)};
                _ -> ok
            end;
        false -> ok
    end;
event(#evt_pet_war{}, _Role, _Label, _QuestId,
      _ProgressId, _Target, _Param) ->
    ok;
event(#evt_get_pet{base_id = Target, genre = Genre,
                   status = Status, lev = Lev},
      Role, Label = quest_classes, QuestId, ProgressId,
      Target, _Param) ->
    case Genre =:= 3 andalso Status =:= 0 andalso Lev =:= 1
        of
        true ->
            case fetch(Role, Label, QuestId, ProgressId) of
                {error, role} -> {ok, Role};
                {error, _} -> remove;
                {ok, _Quest, #quest_progress{finish = Finish}}
                    when Finish =/= 0 ->
                    remove;
                {ok,
                 Quest,
                 P = #quest_progress{target_val = TargetVal,
                                     value = Value, param = Param}}
                    when Value + 1 >= TargetVal ->
                    RemoveRole = plot_quest:remove_task_unit(Role, Param),
                    Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
                    NewP = P#quest_progress{finish = 1, value = TargetVal,
                                            trigger = undefined},
                    {remove, update(Role1, Label, Quest, ProgressId, NewP)};
                {ok, Quest, P = #quest_progress{value = Value}} ->
                    NewP = P#quest_progress{finish = 0, value = Value + 1},
                    {ok, update(Role, Label, Quest, ProgressId, NewP)}
            end;
        _ -> ok
    end;
event(#evt_get_pet{is_catched = true}, Role, Label,
      QuestId, ProgressId, _Target, [catch_num]) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_get_pet{}, Role = #role{}, Label, QuestId,
      ProgressId, 0, []) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_get_pet{talent = Talent}, Role = #role{},
      Label, QuestId, ProgressId, Target, [talent])
    when Talent >= Target ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_get_pet{base_id = Target, genre = Genre,
                   status = Status, lev = Lev},
      Role = #role{}, Label, QuestId, ProgressId, Target,
      Param) ->
    case quest_data:get(QuestId) of
        #quest_data{sec_type = 14} ->
            case Genre =:= 3 andalso Status =:= 0 andalso Lev =:= 1
                of
                true ->
                    case fetch(Role, Label, QuestId, ProgressId) of
                        {error, role} -> {ok, Role};
                        {error, _} -> remove;
                        {ok, _Quest, #quest_progress{finish = Finish}}
                            when Finish =/= 0 ->
                            remove;
                        {ok,
                         Quest,
                         P = #quest_progress{target_val = TargetVal,
                                             value = Value, param = Param}}
                            when Value + 1 >= TargetVal ->
                            RemoveRole = plot_quest:remove_task_unit(Role,
                                                                     Param),
                            Role1 = monitor_quest_prog(Label,
                                                       P,
                                                       Quest,
                                                       RemoveRole),
                            NewP = P#quest_progress{finish = 1,
                                                    value = TargetVal,
                                                    trigger = undefined},
                            {remove,
                             update(Role1, Label, Quest, ProgressId, NewP)};
                        {ok, Quest, P = #quest_progress{value = Value}} ->
                            NewP = P#quest_progress{finish = 0,
                                                    value = Value + 1},
                            {ok, update(Role, Label, Quest, ProgressId, NewP)}
                    end;
                _ -> ok
            end;
        _ ->
            case fetch(Role, Label, QuestId, ProgressId) of
                {error, role} -> {ok, Role};
                {error, _} -> remove;
                {ok, _Quest, #quest_progress{finish = Finish}}
                    when Finish =/= 0 ->
                    remove;
                {ok,
                 Quest,
                 P = #quest_progress{target_val = TargetVal,
                                     value = Value, param = Param}}
                    when Value + 1 >= TargetVal ->
                    RemoveRole = plot_quest:remove_task_unit(Role, Param),
                    Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
                    NewP = P#quest_progress{finish = 1, value = TargetVal,
                                            trigger = undefined},
                    {remove, update(Role1, Label, Quest, ProgressId, NewP)};
                {ok, Quest, P = #quest_progress{value = Value}} ->
                    NewP = P#quest_progress{finish = 0, value = Value + 1},
                    {ok, update(Role, Label, Quest, ProgressId, NewP)}
            end
    end;
event(_Evt = #evt_get_pet{base_id = Target},
      Role = #role{}, Label, QuestId, ProgressId, Target,
      [base_id]) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(_Evt = #evt_get_pet{}, _Role = #role{}, _Label,
      _QuestId, _ProgressId, _Target, _Param) ->
    logger:debug("[~ts]捕捉宠物[Evt:~w][param:~w][Target:~w][quest_"
                 "id:~w]",
                 [_Role#role.name, _Evt, _Param, _Target, _QuestId],
                 quest_progress,
                 1071),
    ok;
event(#evt_get_pet_item_skill_guide{}, Role, Label,
      QuestId, ProgressId, _Target, _Param) ->
    logger:debug("[~ts]获得宠物技能指引书[param:~w][Target:~w][quest_id:~w]",
                 [Role#role.name, _Param, _Target, QuestId],
                 quest_progress,
                 1076),
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_create_unit{}, Role = #role{}, Label,
      QuestId, ProgressId, _Target, [plant_flower]) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_levup{lev = Lev}, Role = #role{}, Label,
      QuestId, ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             param = Param}}
            when Lev >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = OldVal}}
            when Lev > OldVal ->
            NewP = P#quest_progress{finish = 0, value = Lev},
            {ok, update(Role, Label, Quest, ProgressId, NewP)};
        _ -> ok
    end;
event(#evt_dungeon_pass{id = DunId}, Role = #role{},
      Label, QuestId, ProgressId, DunId, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_dungeon_pass{}, Role = #role{}, Label,
      QuestId, ProgressId, 0, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_dungeon_pass{}, _Role, _Label, _QuestId,
      _ProgressId, _DunId, _Param) ->
    ok;
event(#evt_activity{val = Val}, Role, Label, QuestId,
      ProgressId, _Target, Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + Val >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0,
                                    value = Value + Val},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_kill_guild_robber{}, Role, Label, QuestId,
      ProgressId, _Target, _Param) ->
    logger:debug("击杀公会强盗[~ts]",
                 [Role#role.name],
                 quest_progress,
                 1100),
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_arena_fight{}, Role, Label, QuestId,
      ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_arena_win{}, Role = #role{}, Label, QuestId,
      ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_reset_eqm{}, Role = #role{}, Label, QuestId,
      ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_comprehend_eqm{}, Role = #role{}, Label,
      QuestId, ProgressId, _Target,
      [{craft_num, CraftLev}]) ->
    Num = eqm:calc_comprehend_craft_num(Role, CraftLev),
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             param = Param}}
            when Num >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = OldVal}}
            when Num > OldVal ->
            NewP = P#quest_progress{finish = 0, value = Num},
            {ok, update(Role, Label, Quest, ProgressId, NewP)};
        _ -> ok
    end;
event(#evt_tower{}, Role = #role{}, Label, QuestId,
      ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_tower_floor{floor = Floor}, Role = #role{},
      Label, QuestId, ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             param = Param}}
            when Floor >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = OldVal}}
            when Floor > OldVal ->
            NewP = P#quest_progress{finish = 0, value = Floor},
            {ok, update(Role, Label, Quest, ProgressId, NewP)};
        _ -> ok
    end;
event(#evt_glory{lev_id = LevId}, Role = #role{}, Label,
      QuestId, ProgressId, _Target, [count]) ->
    case LevId >= 80 of
        true ->
            case fetch(Role, Label, QuestId, ProgressId) of
                {error, role} -> {ok, Role};
                {error, _} -> remove;
                {ok, _Quest, #quest_progress{finish = Finish}}
                    when Finish =/= 0 ->
                    remove;
                {ok,
                 Quest,
                 P = #quest_progress{target_val = TargetVal,
                                     param = Param}}
                    when 80 >= TargetVal ->
                    RemoveRole = plot_quest:remove_task_unit(Role, Param),
                    Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
                    NewP = P#quest_progress{finish = 1, value = TargetVal,
                                            trigger = undefined},
                    {remove, update(Role1, Label, Quest, ProgressId, NewP)};
                {ok, Quest, P = #quest_progress{value = OldVal}}
                    when 80 > OldVal ->
                    NewP = P#quest_progress{finish = 0, value = 80},
                    {ok, update(Role, Label, Quest, ProgressId, NewP)};
                _ -> ok
            end;
        _ ->
            case fetch(Role, Label, QuestId, ProgressId) of
                {error, role} -> {ok, Role};
                {error, _} -> remove;
                {ok, _Quest, #quest_progress{finish = Finish}}
                    when Finish =/= 0 ->
                    remove;
                {ok,
                 Quest,
                 P = #quest_progress{target_val = TargetVal,
                                     value = Value, param = Param}}
                    when Value + 1 >= TargetVal ->
                    RemoveRole = plot_quest:remove_task_unit(Role, Param),
                    Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
                    NewP = P#quest_progress{finish = 1, value = TargetVal,
                                            trigger = undefined},
                    {remove, update(Role1, Label, Quest, ProgressId, NewP)};
                {ok, Quest, P = #quest_progress{value = Value}} ->
                    NewP = P#quest_progress{finish = 0, value = Value + 1},
                    {ok, update(Role, Label, Quest, ProgressId, NewP)}
            end
    end;
event(#evt_glory{lev_id = LevId}, Role = #role{}, Label,
      QuestId, ProgressId, _Target, []) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             param = Param}}
            when LevId >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = OldVal}}
            when LevId > OldVal ->
            NewP = P#quest_progress{finish = 0, value = LevId},
            {ok, update(Role, Label, Quest, ProgressId, NewP)};
        _ -> ok
    end;
event(#evt_glory{}, _Role, _Label, _QuestId,
      _ProgressId, _Target, _Param) ->
    ok;
event(#evt_market_silver_first_on_sale{}, Role, Label,
      QuestId, ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             param = Param}}
            when 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = OldVal}}
            when 1 > OldVal ->
            NewP = P#quest_progress{finish = 0, value = 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)};
        _ -> ok
    end;
event(#evt_market_silver_sold{assets = AssetsList},
      Role, Label, QuestId, ProgressId, _Target,
      [{assets, TarAssetsLabel}]) ->
    L = [Val
         || {AssetsLabel, Val} <- AssetsList,
            AssetsLabel =:= TarAssetsLabel],
    Sum = lists:sum(L),
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + Sum >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0,
                                    value = Value + Sum},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_market_silver_sold{sold_items = Items}, Role,
      Label, QuestId, ProgressId, _Target,
      [{percent, TarPcnt}]) ->
    L = [Num
         || #market_silver_draw_item{pcnt = Percent, num = Num}
                <- Items,
            Percent >= TarPcnt],
    Sum = lists:sum(L),
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + Sum >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0,
                                    value = Value + Sum},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_market_silver_sold{sold_items = Items}, Role,
      Label, QuestId, ProgressId, _Target, _Param) ->
    L = [Num
         || #market_silver_draw_item{num = Num} <- Items],
    Sum = lists:sum(L),
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + Sum >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0,
                                    value = Value + Sum},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_market_silver_buy{num = Num}, Role, Label,
      QuestId, ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + Num >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0,
                                    value = Value + Num},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_market_gold_bind_buy{price = Price,
                                num = Num},
      Role, Label, QuestId, ProgressId, _Target, []) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + Price * Num >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0,
                                    value = Value + Price * Num},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_market_gold_bind_buy{margin = Margin,
                                num = Num},
      Role, Label, QuestId, ProgressId, _Target,
      [{percent, TarMargin}]) ->
    case Margin >= TarMargin of
        true ->
            case fetch(Role, Label, QuestId, ProgressId) of
                {error, role} -> {ok, Role};
                {error, _} -> remove;
                {ok, _Quest, #quest_progress{finish = Finish}}
                    when Finish =/= 0 ->
                    remove;
                {ok,
                 Quest,
                 P = #quest_progress{target_val = TargetVal,
                                     value = Value, param = Param}}
                    when Value + Num >= TargetVal ->
                    RemoveRole = plot_quest:remove_task_unit(Role, Param),
                    Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
                    NewP = P#quest_progress{finish = 1, value = TargetVal,
                                            trigger = undefined},
                    {remove, update(Role1, Label, Quest, ProgressId, NewP)};
                {ok, Quest, P = #quest_progress{value = Value}} ->
                    NewP = P#quest_progress{finish = 0,
                                            value = Value + Num},
                    {ok, update(Role, Label, Quest, ProgressId, NewP)}
            end;
        _ -> ok
    end;
event(#evt_market_gold_bind_buy{}, _Role, _Label,
      _QuestId, _ProgressId, _Target, _Param) ->
    ok;
event(#evt_market_gold_bind_sold{price = Price}, Role,
      Label, QuestId, ProgressId, _Target, []) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + Price >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0,
                                    value = Value + Price},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_pet_add_point{}, Role, Label, QuestId,
      ProgressId, _Target, _) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_shop_buy{assets_type = Target, val = Val},
      Role, Label, QuestId, ProgressId, Target, [{buy}]) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + Val >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0,
                                    value = Value + Val},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_shop_buy{}, Role, Label, QuestId, ProgressId,
      _Target, [{buy}]) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_shop_buy{}, _Role, _Label, _QuestId,
      _ProgressId, _Target, _Param) ->
    ok;
event(#evt_store_buy{}, Role, Label, QuestId,
      ProgressId, _Target, [{buy}]) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_store_buy{}, _Role, _Label, _QuestId,
      _ProgressId, _Target, _Param) ->
    ok;
event(#evt_trial{}, Role = #role{}, Label, QuestId,
      ProgressId, 0, [count]) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_trial{mode = Target},
      Role = #role{m_trial = #m_trial{order = Order}}, Label,
      QuestId, ProgressId, Target, _Param) ->
    logger:debug("试炼[~ts]~w",
                 [Role#role.name, Order],
                 quest_progress,
                 1200),
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             param = Param}}
            when Order div 2 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = OldVal}}
            when Order div 2 > OldVal ->
            NewP = P#quest_progress{finish = 0,
                                    value = Order div 2},
            {ok, update(Role, Label, Quest, ProgressId, NewP)};
        _ -> ok
    end;
event(#evt_trial{},
      Role = #role{m_trial = #m_trial{order = Order}}, Label,
      QuestId, ProgressId, 0, _Param) ->
    logger:debug("试炼[~ts]~w",
                 [Role#role.name, Order],
                 quest_progress,
                 1203),
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             param = Param}}
            when Order div 2 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = OldVal}}
            when Order div 2 > OldVal ->
            NewP = P#quest_progress{finish = 0,
                                    value = Order div 2},
            {ok, update(Role, Label, Quest, ProgressId, NewP)};
        _ -> ok
    end;
event(#evt_trial{}, _Role, _Label, _QuestId,
      _ProgressId, _Target, _Param) ->
    ok;
event(#evt_parade{}, Role, Label, QuestId, ProgressId,
      _Target, _Param) ->
    logger:debug("游行[~ts]",
                 [Role#role.name],
                 quest_progress,
                 1210),
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_escort{},
      Role = #role{m_escort =
                       #m_escort{total_num = TotalNum}},
      Label, QuestId, ProgressId, _Target, _Param) ->
    logger:debug("护送[~ts]~w",
                 [Role#role.name, TotalNum],
                 quest_progress,
                 1215),
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             param = Param}}
            when TotalNum >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = OldVal}}
            when TotalNum > OldVal ->
            NewP = P#quest_progress{finish = 0, value = TotalNum},
            {ok, update(Role, Label, Quest, ProgressId, NewP)};
        _ -> ok
    end;
event(#evt_friend{}, Role, Label, QuestId, ProgressId,
      _Target, _Param) ->
    Num = friend:get_num(Role),
    logger:debug("好友[~ts]~w",
                 [Role#role.name, Num],
                 quest_progress,
                 1221),
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             param = Param}}
            when Num >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = OldVal}}
            when Num > OldVal ->
            NewP = P#quest_progress{finish = 0, value = Num},
            {ok, update(Role, Label, Quest, ProgressId, NewP)};
        _ -> ok
    end;
event(#evt_shipping_sail{type = Target},
      Role = #role{m_shipping =
                       #m_shipping{total_num = Count}},
      Label, QuestId, ProgressId, Target, _Param) ->
    logger:debug("远航[~ts]~w",
                 [Role#role.name, Count],
                 quest_progress,
                 1226),
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             param = Param}}
            when Count >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = OldVal}}
            when Count > OldVal ->
            NewP = P#quest_progress{finish = 0, value = Count},
            {ok, update(Role, Label, Quest, ProgressId, NewP)};
        _ -> ok
    end;
event(#evt_shipping_sail{},
      Role = #role{m_shipping =
                       #m_shipping{total_num = Count}},
      Label, QuestId, ProgressId, _Target, _Param) ->
    logger:debug("远航[~ts]~w",
                 [Role#role.name, Count],
                 quest_progress,
                 1229),
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             param = Param}}
            when Count >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = OldVal}}
            when Count > OldVal ->
            NewP = P#quest_progress{finish = 0, value = Count},
            {ok, update(Role, Label, Quest, ProgressId, NewP)};
        _ -> ok
    end;
event(#evt_treasure{},
      Role = #role{name = _Name,
                   m_treasure = #m_treasure{total_count = Count}},
      Label, QuestId, ProgressId, 0, _Param) ->
    logger:debug("挖宝任务[~ts]~w",
                 [_Name, Count],
                 quest_progress,
                 1233),
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             param = Param}}
            when Count >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = OldVal}}
            when Count > OldVal ->
            NewP = P#quest_progress{finish = 0, value = Count},
            {ok, update(Role, Label, Quest, ProgressId, NewP)};
        _ -> ok
    end;
event(#evt_treasure{base_id = Target},
      Role = #role{name = _Name}, Label, QuestId, ProgressId,
      Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_treasure{}, _Role, _Label, _QuestId,
      _ProgressId, _Target, _Param) ->
    ok;
event(#evt_treasure_compass{},
      Role = #role{name = _Name}, Label, QuestId, ProgressId,
      _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_qualifying_combat{}, Role, Label, QuestId,
      ProgressId, _Target, _Param) ->
    logger:debug("段位[~ts]",
                 [Role#role.name],
                 quest_progress,
                 1245),
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_guild_propagate{}, Role, Label, QuestId,
      ProgressId, _Target, _Param) ->
    logger:debug("宣读公会宗旨[~ts]",
                 [Role#role.name],
                 quest_progress,
                 1249),
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_guild_plant_mature{}, Role, Label, QuestId,
      ProgressId, _Target, _Param) ->
    logger:debug("宣读种花[~ts]",
                 [Role#role.name],
                 quest_progress,
                 1253),
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_enchant{}, Role = #role{name = _Name}, Label,
      QuestId, ProgressId, 0, _Param) ->
    logger:debug("强化任务[~ts]~w",
                 [_Name, {1111}],
                 quest_progress,
                 1258),
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_enchant{},
      Role = #role{name = _Name,
                   p_eqm = #package{items = Items}},
      Label, QuestId, ProgressId, Target, _Param) ->
    Count = erlang:length([1
                           || #item{enchant = Enchant} <- Items,
                              Enchant >= Target]),
    logger:debug("强化任务[~ts]~w",
                 [_Name, {Count, Target}],
                 quest_progress,
                 1262),
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             param = Param}}
            when Count >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = OldVal}}
            when Count > OldVal ->
            NewP = P#quest_progress{finish = 0, value = Count},
            {ok, update(Role, Label, Quest, ProgressId, NewP)};
        _ -> ok
    end;
event(#evt_enchant{}, _Role, _Label, _QuestId,
      _ProgressId, _Target, _Param) ->
    ok;
event(#evt_blacksmith_enchant{is_succ = 0},
      Role = #role{name = _Name}, Label, QuestId, ProgressId,
      _Target, [fail]) ->
    logger:debug("强化标志[~ts]",
                 [_Name],
                 quest_progress,
                 1268),
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_blacksmith_enchant{luck_list = [_ | _]},
      Role = #role{name = _Name}, Label, QuestId, ProgressId,
      0, [luck_item]) ->
    logger:debug("强化标志[~ts]",
                 [_Name],
                 quest_progress,
                 1271),
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_blacksmith_enchant{luck_list =
                                  [_ | _] = LuckItem},
      Role = #role{name = _Name}, Label, QuestId, ProgressId,
      Target, [luck_item]) ->
    case lists:keyfind(Target, 1, LuckItem) of
        {_, _} ->
            logger:debug("强化标志[~ts]",
                         [_Name],
                         quest_progress,
                         1276),
            case fetch(Role, Label, QuestId, ProgressId) of
                {error, role} -> {ok, Role};
                {error, _} -> remove;
                {ok, _Quest, #quest_progress{finish = Finish}}
                    when Finish =/= 0 ->
                    remove;
                {ok,
                 Quest,
                 P = #quest_progress{target_val = TargetVal,
                                     value = Value, param = Param}}
                    when Value + 1 >= TargetVal ->
                    RemoveRole = plot_quest:remove_task_unit(Role, Param),
                    Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
                    NewP = P#quest_progress{finish = 1, value = TargetVal,
                                            trigger = undefined},
                    {remove, update(Role1, Label, Quest, ProgressId, NewP)};
                {ok, Quest, P = #quest_progress{value = Value}} ->
                    NewP = P#quest_progress{finish = 0, value = Value + 1},
                    {ok, update(Role, Label, Quest, ProgressId, NewP)}
            end;
        _ -> ok
    end;
event(#evt_blacksmith_enchant{},
      _Role = #role{name = _Name}, _Label, _QuestId,
      _ProgressId, _Target, _Param) ->
    logger:debug("强化标志[~ts]",
                 [_Name],
                 quest_progress,
                 1282),
    ok;
event(#evt_friend_zone_like{},
      Role = #role{name = _Name}, Label, QuestId, ProgressId,
      _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_friend_zone_liked{val = Val},
      Role = #role{name = _Name}, Label, QuestId, ProgressId,
      _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             param = Param}}
            when Val >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = OldVal}}
            when Val > OldVal ->
            NewP = P#quest_progress{finish = 0, value = Val},
            {ok, update(Role, Label, Quest, ProgressId, NewP)};
        _ -> ok
    end;
event(#evt_friend_zone_leave_trend{},
      Role = #role{name = _Name}, Label, QuestId, ProgressId,
      _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_friend_zone_leave_trended{val = Val},
      Role = #role{name = _Name}, Label, QuestId, ProgressId,
      _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             param = Param}}
            when Val >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = OldVal}}
            when Val > OldVal ->
            NewP = P#quest_progress{finish = 0, value = Val},
            {ok, update(Role, Label, Quest, ProgressId, NewP)};
        _ -> ok
    end;
event(#evt_friend_zone_photo{},
      Role = #role{name = _Name}, Label, QuestId, ProgressId,
      _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_shipping_commit{pack_type = PackType},
      Role = #role{name = _Name}, Label, QuestId, ProgressId,
      _Target, [helped])
    when PackType == 1 orelse PackType == 2 ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_shipping_commit{type = Target},
      Role = #role{name = _Name}, Label, QuestId, ProgressId,
      Target, [type]) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_shipping_commit{}, _Role, _Label, _QuestId,
      _ProgressId, _Target, _Param) ->
    ok;
event(#evt_shipping_help{}, Role = #role{name = _Name},
      Label, QuestId, ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_fairyland{}, Role = #role{name = _Name},
      Label, QuestId, ProgressId, _Target, _Param) ->
    logger:debug("进入彩虹[~ts]",
                 [_Name],
                 quest_progress,
                 1321),
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_fairyland_floor{floor = Floor},
      Role = #role{name = _Name,
                   m_team = #m_team{status = 1}},
      Label, QuestId, ProgressId, Target, [leader])
    when Floor >= Target ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_fairyland_floor{floor = Floor},
      Role = #role{name = _Name}, Label, QuestId, ProgressId,
      Target, [])
    when Floor >= Target ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_fairyland_box{box_punish = 1},
      Role = #role{name = _Name}, Label, QuestId, ProgressId,
      _Target, [box_punish]) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_fairyland_box{}, Role = #role{name = _Name},
      Label, QuestId, ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_quest_guild_round{}, Role = #role{}, Label,
      QuestId, ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_commit_quest_chain{},
      Role = #role{name = _Name}, Label, QuestId, ProgressId,
      0, _Param) ->
    logger:debug("任务链标志[~ts]",
                 [_Name],
                 quest_progress,
                 1338),
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_commit_quest_chain{type = Target},
      Role = #role{name = _Name}, Label, QuestId, ProgressId,
      Target, _Param) ->
    logger:debug("任务链标志[~ts]",
                 [_Name],
                 quest_progress,
                 1341),
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_commit_quest_chain{}, _Role, _Label,
      _QuestId, _ProgressId, _Target, _Param) ->
    logger:debug("任务链标志[~ts]", ["跳"], quest_progress, 1344),
    ok;
event(#evt_formation_lev{id = Target, lev = Lev}, Role,
      Label, QuestId, ProgressId, Target, [formation]) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             param = Param}}
            when Lev >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = OldVal}}
            when Lev > OldVal ->
            NewP = P#quest_progress{finish = 0, value = Lev},
            {ok, update(Role, Label, Quest, ProgressId, NewP)};
        _ -> ok
    end;
event(#evt_formation_lev{},
      Role = #role{name = _Name,
                   m_formation = #m_formation{forms = Forms}},
      Label, QuestId, ProgressId, Target, []) ->
    Length = length([1
                     || #formation{lev = TLev} <- Forms, TLev >= Target]),
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             param = Param}}
            when Length >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = OldVal}}
            when Length > OldVal ->
            NewP = P#quest_progress{finish = 0, value = Length},
            {ok, update(Role, Label, Quest, ProgressId, NewP)};
        _ -> ok
    end;
event(#evt_formation_lev{}, _Role, _Label, _QuestId,
      _ProgressId, _Target, _Param) ->
    ok;
event(#evt_warrior{}, Role = #role{name = _Name}, Label,
      QuestId, ProgressId, _Target, _Param) ->
    logger:debug("进入勇士竞技场[~ts]",
                 [_Name],
                 quest_progress,
                 1359),
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_warrior_reward{score = Score},
      Role = #role{name = _Name}, Label, QuestId, ProgressId,
      _Target, [score]) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             param = Param}}
            when Score >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = OldVal}}
            when Score > OldVal ->
            NewP = P#quest_progress{finish = 0, value = Score},
            {ok, update(Role, Label, Quest, ProgressId, NewP)};
        _ -> ok
    end;
event(#evt_warrior_reward{win_flag = 1},
      Role = #role{name = _Name}, Label, QuestId, ProgressId,
      _Target, [win_flag]) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_warrior_reward{win_flag = 0},
      Role = #role{name = _Name}, Label, QuestId, ProgressId,
      _Target, [fail_flag]) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_warrior_reward{}, _Role, _Label, _QuestId,
      _ProgressId, _Target, _Param) ->
    ok;
event(#evt_friend_intimacy{val = Val},
      Role = #role{name = _Name}, Label, QuestId, ProgressId,
      _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             param = Param}}
            when Val >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = OldVal}}
            when Val > OldVal ->
            NewP = P#quest_progress{finish = 0, value = Val},
            {ok, update(Role, Label, Quest, ProgressId, NewP)};
        _ -> ok
    end;
event(#evt_send_flower{num = Val},
      Role = #role{name = _Name}, Label, QuestId, ProgressId,
      _Target, [total_num]) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             param = Param}}
            when Val >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = OldVal}}
            when Val > OldVal ->
            NewP = P#quest_progress{finish = 0, value = Val},
            {ok, update(Role, Label, Quest, ProgressId, NewP)};
        _ -> ok
    end;
event(#evt_send_flower{val = Val},
      Role = #role{name = _Name}, Label, QuestId, ProgressId,
      _Target, [num]) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             param = Param}}
            when Val >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = OldVal}}
            when Val > OldVal ->
            NewP = P#quest_progress{finish = 0, value = Val},
            {ok, update(Role, Label, Quest, ProgressId, NewP)};
        _ -> ok
    end;
event(#evt_send_flower{items = Items},
      Role = #role{name = _Name}, Label, QuestId, ProgressId,
      Target, []) ->
    case lists:sum([N || {I, N} <- Items, I =:= Target]) of
        0 -> ok;
        Num ->
            case fetch(Role, Label, QuestId, ProgressId) of
                {error, role} -> {ok, Role};
                {error, _} -> remove;
                {ok, _Quest, #quest_progress{finish = Finish}}
                    when Finish =/= 0 ->
                    remove;
                {ok,
                 Quest,
                 P = #quest_progress{target_val = TargetVal,
                                     value = Value, param = Param}}
                    when Value + Num >= TargetVal ->
                    RemoveRole = plot_quest:remove_task_unit(Role, Param),
                    Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
                    NewP = P#quest_progress{finish = 1, value = TargetVal,
                                            trigger = undefined},
                    {remove, update(Role1, Label, Quest, ProgressId, NewP)};
                {ok, Quest, P = #quest_progress{value = Value}} ->
                    NewP = P#quest_progress{finish = 0,
                                            value = Value + Num},
                    {ok, update(Role, Label, Quest, ProgressId, NewP)}
            end
    end;
event(#evt_send_flower{}, _Role, _Label, _QuestId,
      _ProgressId, _Target, _Param) ->
    ok;
event(#evt_general_send_flower{items = Items},
      Role = #role{name = _Name}, Label, QuestId, ProgressId,
      _Target, []) ->
    case lists:sum([N
                    || {I, N} <- Items,
                       lists:member(I, [20042, 20043, 20032, 20031, 29153])])
        of
        0 -> ok;
        Num ->
            case fetch(Role, Label, QuestId, ProgressId) of
                {error, role} -> {ok, Role};
                {error, _} -> remove;
                {ok, _Quest, #quest_progress{finish = Finish}}
                    when Finish =/= 0 ->
                    remove;
                {ok,
                 Quest,
                 P = #quest_progress{target_val = TargetVal,
                                     value = Value, param = Param}}
                    when Value + Num >= TargetVal ->
                    RemoveRole = plot_quest:remove_task_unit(Role, Param),
                    Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
                    NewP = P#quest_progress{finish = 1, value = TargetVal,
                                            trigger = undefined},
                    {remove, update(Role1, Label, Quest, ProgressId, NewP)};
                {ok, Quest, P = #quest_progress{value = Value}} ->
                    NewP = P#quest_progress{finish = 0,
                                            value = Value + Num},
                    {ok, update(Role, Label, Quest, ProgressId, NewP)}
            end
    end;
event(#evt_marriage_flower{}, Role, Label, QuestId,
      ProgressId, _Target, _Param) ->
    logger:debug("夫妻送花:~ts",
                 [Role#role.name],
                 quest_progress,
                 1400),
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_finish_marriage_question{}, Role, Label,
      QuestId, ProgressId, _Target, _Param) ->
    logger:debug("夫妻答题:~ts",
                 [Role#role.name],
                 quest_progress,
                 1405),
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_finish_couple_question{}, Role, Label,
      QuestId, ProgressId, _Target, _Param) ->
    logger:debug("夫妻答题:~ts",
                 [Role#role.name],
                 quest_progress,
                 1409),
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_finish_ask_question{fun_type = Target}, Role,
      Label, QuestId, ProgressId, Target, _Param) ->
    logger:debug("答题:~ts",
                 [Role#role.name],
                 quest_progress,
                 1413),
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_finish_ask_question{}, _Role, _Label,
      _QuestId, _ProgressId, _Target, _Param) ->
    ok;
event(#evt_examination{type = Type},
      Role = #role{name = _Name}, Label, QuestId, ProgressId,
      Type, _Param) ->
    logger:debug("参与智慧[~ts]",
                 [_Name],
                 quest_progress,
                 1420),
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_examination{}, _Role, _Label, _QuestId,
      _ProgressId, _Target, _Param) ->
    ok;
event(#evt_wing{grade = Grade, star = Star}, Role,
      Label, QuestId, ProgressId, _Target,
      [{grade_star, NeedGrade, NeedStar}]) ->
    case Grade > NeedGrade of
        true ->
            case fetch(Role, Label, QuestId, ProgressId) of
                {error, role} -> {ok, Role};
                {error, _} -> remove;
                {ok, _Quest, #quest_progress{finish = Finish}}
                    when Finish =/= 0 ->
                    remove;
                {ok,
                 Quest,
                 P = #quest_progress{target_val = TargetVal,
                                     param = Param}}
                    when 1 >= TargetVal ->
                    RemoveRole = plot_quest:remove_task_unit(Role, Param),
                    Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
                    NewP = P#quest_progress{finish = 1, value = TargetVal,
                                            trigger = undefined},
                    {remove, update(Role1, Label, Quest, ProgressId, NewP)};
                {ok, Quest, P = #quest_progress{value = OldVal}}
                    when 1 > OldVal ->
                    NewP = P#quest_progress{finish = 0, value = 1},
                    {ok, update(Role, Label, Quest, ProgressId, NewP)};
                _ -> ok
            end;
        false ->
            case Grade =:= NeedGrade of
                true ->
                    case Star >= NeedStar of
                        true ->
                            case fetch(Role, Label, QuestId, ProgressId) of
                                {error, role} -> {ok, Role};
                                {error, _} -> remove;
                                {ok, _Quest, #quest_progress{finish = Finish}}
                                    when Finish =/= 0 ->
                                    remove;
                                {ok,
                                 Quest,
                                 P = #quest_progress{target_val = TargetVal,
                                                     param = Param}}
                                    when 1 >= TargetVal ->
                                    RemoveRole =
                                        plot_quest:remove_task_unit(Role,
                                                                    Param),
                                    Role1 = monitor_quest_prog(Label,
                                                               P,
                                                               Quest,
                                                               RemoveRole),
                                    NewP = P#quest_progress{finish = 1,
                                                            value = TargetVal,
                                                            trigger =
                                                                undefined},
                                    {remove,
                                     update(Role1,
                                            Label,
                                            Quest,
                                            ProgressId,
                                            NewP)};
                                {ok, Quest, P = #quest_progress{value = OldVal}}
                                    when 1 > OldVal ->
                                    NewP = P#quest_progress{finish = 0,
                                                            value = 1},
                                    {ok,
                                     update(Role,
                                            Label,
                                            Quest,
                                            ProgressId,
                                            NewP)};
                                _ -> ok
                            end;
                        false -> ok
                    end;
                false -> ok
            end
    end;
event(#evt_wing{grade = Grade, growth = Growth}, Role,
      Label, QuestId, ProgressId, _Target,
      [{growth, NeedGrowth}]) ->
    case Growth >= NeedGrowth of
        true ->
            case fetch(Role, Label, QuestId, ProgressId) of
                {error, role} -> {ok, Role};
                {error, _} -> remove;
                {ok, _Quest, #quest_progress{finish = Finish}}
                    when Finish =/= 0 ->
                    remove;
                {ok,
                 Quest,
                 P = #quest_progress{target_val = TargetVal,
                                     param = Param}}
                    when Grade >= TargetVal ->
                    RemoveRole = plot_quest:remove_task_unit(Role, Param),
                    Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
                    NewP = P#quest_progress{finish = 1, value = TargetVal,
                                            trigger = undefined},
                    {remove, update(Role1, Label, Quest, ProgressId, NewP)};
                {ok, Quest, P = #quest_progress{value = OldVal}}
                    when Grade > OldVal ->
                    NewP = P#quest_progress{finish = 0, value = Grade},
                    {ok, update(Role, Label, Quest, ProgressId, NewP)};
                _ -> ok
            end;
        _ -> ok
    end;
event(#evt_wing{grade = Grade}, Role, Label, QuestId,
      ProgressId, _Target, []) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             param = Param}}
            when Grade >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = OldVal}}
            when Grade > OldVal ->
            NewP = P#quest_progress{finish = 0, value = Grade},
            {ok, update(Role, Label, Quest, ProgressId, NewP)};
        _ -> ok
    end;
event(#evt_wing{}, _Role, _Label, _QuestId, _ProgressId,
      _Target, _) ->
    ok;
event(#evt_wing_reset{}, Role, Label, QuestId,
      ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_wing_skill{count = Count}, Role, Label,
      QuestId, ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             param = Param}}
            when Count >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = OldVal}}
            when Count > OldVal ->
            NewP = P#quest_progress{finish = 0, value = Count},
            {ok, update(Role, Label, Quest, ProgressId, NewP)};
        _ -> ok
    end;
event(#evt_wing_lev{grade = Grade, star_lev = Star},
      Role, Label, QuestId, ProgressId, NeedGrade,
      [{star_lev, NeedStar}]) ->
    case Grade > NeedGrade of
        true ->
            case fetch(Role, Label, QuestId, ProgressId) of
                {error, role} -> {ok, Role};
                {error, _} -> remove;
                {ok, _Quest, #quest_progress{finish = Finish}}
                    when Finish =/= 0 ->
                    remove;
                {ok,
                 Quest,
                 P = #quest_progress{target_val = TargetVal,
                                     param = Param}}
                    when 1 >= TargetVal ->
                    RemoveRole = plot_quest:remove_task_unit(Role, Param),
                    Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
                    NewP = P#quest_progress{finish = 1, value = TargetVal,
                                            trigger = undefined},
                    {remove, update(Role1, Label, Quest, ProgressId, NewP)};
                {ok, Quest, P = #quest_progress{value = OldVal}}
                    when 1 > OldVal ->
                    NewP = P#quest_progress{finish = 0, value = 1},
                    {ok, update(Role, Label, Quest, ProgressId, NewP)};
                _ -> ok
            end;
        false ->
            case Grade =:= NeedGrade of
                true ->
                    case Star >= NeedStar of
                        true ->
                            case fetch(Role, Label, QuestId, ProgressId) of
                                {error, role} -> {ok, Role};
                                {error, _} -> remove;
                                {ok, _Quest, #quest_progress{finish = Finish}}
                                    when Finish =/= 0 ->
                                    remove;
                                {ok,
                                 Quest,
                                 P = #quest_progress{target_val = TargetVal,
                                                     param = Param}}
                                    when 1 >= TargetVal ->
                                    RemoveRole =
                                        plot_quest:remove_task_unit(Role,
                                                                    Param),
                                    Role1 = monitor_quest_prog(Label,
                                                               P,
                                                               Quest,
                                                               RemoveRole),
                                    NewP = P#quest_progress{finish = 1,
                                                            value = TargetVal,
                                                            trigger =
                                                                undefined},
                                    {remove,
                                     update(Role1,
                                            Label,
                                            Quest,
                                            ProgressId,
                                            NewP)};
                                {ok, Quest, P = #quest_progress{value = OldVal}}
                                    when 1 > OldVal ->
                                    NewP = P#quest_progress{finish = 0,
                                                            value = 1},
                                    {ok,
                                     update(Role,
                                            Label,
                                            Quest,
                                            ProgressId,
                                            NewP)};
                                _ -> ok
                            end;
                        false -> ok
                    end;
                false -> ok
            end
    end;
event(#evt_wing_lev{grade = Grade}, Role, Label,
      QuestId, ProgressId, NeedGrade, []) ->
    case Grade >= NeedGrade of
        true ->
            case fetch(Role, Label, QuestId, ProgressId) of
                {error, role} -> {ok, Role};
                {error, _} -> remove;
                {ok, _Quest, #quest_progress{finish = Finish}}
                    when Finish =/= 0 ->
                    remove;
                {ok,
                 Quest,
                 P = #quest_progress{target_val = TargetVal,
                                     param = Param}}
                    when 1 >= TargetVal ->
                    RemoveRole = plot_quest:remove_task_unit(Role, Param),
                    Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
                    NewP = P#quest_progress{finish = 1, value = TargetVal,
                                            trigger = undefined},
                    {remove, update(Role1, Label, Quest, ProgressId, NewP)};
                {ok, Quest, P = #quest_progress{value = OldVal}}
                    when 1 > OldVal ->
                    NewP = P#quest_progress{finish = 0, value = 1},
                    {ok, update(Role, Label, Quest, ProgressId, NewP)};
                _ -> ok
            end;
        false -> ok
    end;
event(#evt_fuse{base_id = Target}, Role, Label, QuestId,
      ProgressId, Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_fuse{}, _Role, _Label, _QuestId, _ProgressId,
      _Target, _Param) ->
    ok;
event(#evt_guild_post{post = Target}, Role, Label,
      QuestId, ProgressId, Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             param = Param}}
            when 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = OldVal}}
            when 1 > OldVal ->
            NewP = P#quest_progress{finish = 0, value = 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)};
        _ -> ok
    end;
event(#evt_guild_post{}, _Role, _Label, _QuestId,
      _ProgressId, _Target, _Param) ->
    ok;
event(#evt_examination_answer{is_right = Target}, Role,
      Label, QuestId, ProgressId, Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_examination_answer{}, _Role, _Label,
      _QuestId, _ProgressId, _Target, _Param) ->
    ok;
event(#evt_aptitude_pet{}, Role, Label, QuestId,
      ProgressId, _Target, [count]) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_aptitude_pet{},
      Role = #role{m_pet = #m_pet{pets = Pets}}, Label,
      QuestId, ProgressId, Target, [sum]) ->
    Length = length([1
                     || #pet{genre = GenreType} <- Pets,
                        GenreType == Target]),
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             param = Param}}
            when Length >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = OldVal}}
            when Length > OldVal ->
            NewP = P#quest_progress{finish = 0, value = Length},
            {ok, update(Role, Label, Quest, ProgressId, NewP)};
        _ -> ok
    end;
event(#evt_aptitude_pet{base_id = Target}, Role, Label,
      QuestId, ProgressId, Target, _Param) ->
    logger:debug("[~ts]指定洗髓的宠物Target:~w, quest_id:~w",
                 [Role#role.name, Target, QuestId],
                 quest_progress,
                 1506),
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_aptitude_pet{}, _Role, _Label, _QuestId,
      _ProgressId, _Target, _Param) ->
    ok;
event(#evt_pet_use_item{base_id = BaseId}, Role, Label,
      QuestId, ProgressId, Target, [type]) ->
    case item_data:get(BaseId) of
        #item_base{type = Target} ->
            case fetch(Role, Label, QuestId, ProgressId) of
                {error, role} -> {ok, Role};
                {error, _} -> remove;
                {ok, _Quest, #quest_progress{finish = Finish}}
                    when Finish =/= 0 ->
                    remove;
                {ok,
                 Quest,
                 P = #quest_progress{target_val = TargetVal,
                                     value = Value, param = Param}}
                    when Value + 1 >= TargetVal ->
                    RemoveRole = plot_quest:remove_task_unit(Role, Param),
                    Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
                    NewP = P#quest_progress{finish = 1, value = TargetVal,
                                            trigger = undefined},
                    {remove, update(Role1, Label, Quest, ProgressId, NewP)};
                {ok, Quest, P = #quest_progress{value = Value}} ->
                    NewP = P#quest_progress{finish = 0, value = Value + 1},
                    {ok, update(Role, Label, Quest, ProgressId, NewP)}
            end;
        _ -> ok
    end;
event(#evt_pet_use_item{base_id = Target}, Role, Label,
      QuestId, ProgressId, Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_pet_use_item{base_id = BaseId}, Role, Label,
      QuestId, ProgressId, _Target, Param) ->
    case is_list(Param) andalso lists:member(BaseId, Param)
        of
        true ->
            case fetch(Role, Label, QuestId, ProgressId) of
                {error, role} -> {ok, Role};
                {error, _} -> remove;
                {ok, _Quest, #quest_progress{finish = Finish}}
                    when Finish =/= 0 ->
                    remove;
                {ok,
                 Quest,
                 P = #quest_progress{target_val = TargetVal,
                                     value = Value, param = Param}}
                    when Value + 1 >= TargetVal ->
                    RemoveRole = plot_quest:remove_task_unit(Role, Param),
                    Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
                    NewP = P#quest_progress{finish = 1, value = TargetVal,
                                            trigger = undefined},
                    {remove, update(Role1, Label, Quest, ProgressId, NewP)};
                {ok, Quest, P = #quest_progress{value = Value}} ->
                    NewP = P#quest_progress{finish = 0, value = Value + 1},
                    {ok, update(Role, Label, Quest, ProgressId, NewP)}
            end;
        _ -> ok
    end;
event(#evt_pet_rename{}, Role, Label, QuestId,
      ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_pet_free{}, Role, Label, QuestId, ProgressId,
      _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_pet_stone_upgrade{}, Role, Label, QuestId,
      ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_pet_repleace_skill{}, Role, Label, QuestId,
      ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_pet{},
      Role = #role{m_pet = #m_pet{pets = Pets}}, Label,
      QuestId, ProgressId, Target, [sum_genre]) ->
    Length = length([1
                     || #pet{genre = Genre} <- Pets, Genre == Target]),
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             param = Param}}
            when Length >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = OldVal}}
            when Length > OldVal ->
            NewP = P#quest_progress{finish = 0, value = Length},
            {ok, update(Role, Label, Quest, ProgressId, NewP)};
        _ -> ok
    end;
event(#evt_pet{},
      Role = #role{m_pet = #m_pet{pets = Pets}}, Label,
      QuestId, ProgressId, Target, [sum_talent]) ->
    Length = length([1
                     || #pet{talent = Talent} <- Pets, Talent >= Target]),
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             param = Param}}
            when Length >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = OldVal}}
            when Length > OldVal ->
            NewP = P#quest_progress{finish = 0, value = Length},
            {ok, update(Role, Label, Quest, ProgressId, NewP)};
        _ -> ok
    end;
event(#evt_pet{}, _Role, _Label, _QuestId, _ProgressId,
      _Target, _Param) ->
    ok;
event(#evt_pet_lev{},
      Role = #role{m_pet = #m_pet{pets = Pets}}, Label,
      QuestId, ProgressId, Target, [sum]) ->
    Length = length([1
                     || #pet{lev = Lev} <- Pets, Lev >= Target]),
    logger:debug("宠物等级[~w]",
                 [Length],
                 quest_progress,
                 1556),
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             param = Param}}
            when Length >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = OldVal}}
            when Length > OldVal ->
            NewP = P#quest_progress{finish = 0, value = Length},
            {ok, update(Role, Label, Quest, ProgressId, NewP)};
        _ -> ok
    end;
event(#evt_pet_lev{lev = Lev}, Role, Label, QuestId,
      ProgressId, Target, _Param)
    when Lev >= Target ->
    logger:debug("宠物等级[~w]", [Lev], quest_progress, 1561),
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_pet_lev{lev = _Lev}, _Role, _Label, _QuestId,
      _ProgressId, _Target, _Param) ->
    logger:debug("宠物等级[~w]", [_Lev], quest_progress, 1564),
    ok;
event(#evt_combat_statistics{revive = Revive}, Role,
      Label, QuestId, ProgressId, _Target, [revive]) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + Revive >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0,
                                    value = Value + Revive},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_combat_statistics{pet_revive = Revive}, Role,
      Label, QuestId, ProgressId, _Target, [pet_revive]) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + Revive >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0,
                                    value = Value + Revive},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_combat_statistics{cast_pet = CastPet}, Role,
      Label, QuestId, ProgressId, _Target, [cast_pet]) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + CastPet >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0,
                                    value = Value + CastPet},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_combat_statistics{use_item = UseItem}, Role,
      Label, QuestId, ProgressId, _Target, [use_item]) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + UseItem >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0,
                                    value = Value + UseItem},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_combat_statistics{is_win = IsWin}, Role,
      Label, QuestId, ProgressId, _Target, [win]) ->
    case IsWin of
        1 ->
            case fetch(Role, Label, QuestId, ProgressId) of
                {error, role} -> {ok, Role};
                {error, _} -> remove;
                {ok, _Quest, #quest_progress{finish = Finish}}
                    when Finish =/= 0 ->
                    remove;
                {ok,
                 Quest,
                 P = #quest_progress{target_val = TargetVal,
                                     value = Value, param = Param}}
                    when Value + 1 >= TargetVal ->
                    RemoveRole = plot_quest:remove_task_unit(Role, Param),
                    Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
                    NewP = P#quest_progress{finish = 1, value = TargetVal,
                                            trigger = undefined},
                    {remove, update(Role1, Label, Quest, ProgressId, NewP)};
                {ok, Quest, P = #quest_progress{value = Value}} ->
                    NewP = P#quest_progress{finish = 0, value = Value + 1},
                    {ok, update(Role, Label, Quest, ProgressId, NewP)}
            end;
        _ -> ok
    end;
event(#evt_combat_statistics{is_win = IsWin,
                             is_die = IsDie},
      Role, Label, QuestId, ProgressId, _Target, [win_die]) ->
    case IsWin =:= 1 andalso IsDie =:= 1 of
        true ->
            case fetch(Role, Label, QuestId, ProgressId) of
                {error, role} -> {ok, Role};
                {error, _} -> remove;
                {ok, _Quest, #quest_progress{finish = Finish}}
                    when Finish =/= 0 ->
                    remove;
                {ok,
                 Quest,
                 P = #quest_progress{target_val = TargetVal,
                                     value = Value, param = Param}}
                    when Value + 1 >= TargetVal ->
                    RemoveRole = plot_quest:remove_task_unit(Role, Param),
                    Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
                    NewP = P#quest_progress{finish = 1, value = TargetVal,
                                            trigger = undefined},
                    {remove, update(Role1, Label, Quest, ProgressId, NewP)};
                {ok, Quest, P = #quest_progress{value = Value}} ->
                    NewP = P#quest_progress{finish = 0, value = Value + 1},
                    {ok, update(Role, Label, Quest, ProgressId, NewP)}
            end;
        _ -> ok
    end;
event(#evt_combat_statistics{is_win = IsWin}, Role,
      Label, QuestId, ProgressId, _Target, [lose]) ->
    case IsWin of
        0 ->
            case fetch(Role, Label, QuestId, ProgressId) of
                {error, role} -> {ok, Role};
                {error, _} -> remove;
                {ok, _Quest, #quest_progress{finish = Finish}}
                    when Finish =/= 0 ->
                    remove;
                {ok,
                 Quest,
                 P = #quest_progress{target_val = TargetVal,
                                     value = Value, param = Param}}
                    when Value + 1 >= TargetVal ->
                    RemoveRole = plot_quest:remove_task_unit(Role, Param),
                    Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
                    NewP = P#quest_progress{finish = 1, value = TargetVal,
                                            trigger = undefined},
                    {remove, update(Role1, Label, Quest, ProgressId, NewP)};
                {ok, Quest, P = #quest_progress{value = Value}} ->
                    NewP = P#quest_progress{finish = 0, value = Value + 1},
                    {ok, update(Role, Label, Quest, ProgressId, NewP)}
            end;
        _ -> ok
    end;
event(#evt_combat_statistics{is_die = IsDie}, Role,
      Label, QuestId, ProgressId, _Target, [is_die]) ->
    case IsDie of
        1 ->
            case fetch(Role, Label, QuestId, ProgressId) of
                {error, role} -> {ok, Role};
                {error, _} -> remove;
                {ok, _Quest, #quest_progress{finish = Finish}}
                    when Finish =/= 0 ->
                    remove;
                {ok,
                 Quest,
                 P = #quest_progress{target_val = TargetVal,
                                     value = Value, param = Param}}
                    when Value + 1 >= TargetVal ->
                    RemoveRole = plot_quest:remove_task_unit(Role, Param),
                    Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
                    NewP = P#quest_progress{finish = 1, value = TargetVal,
                                            trigger = undefined},
                    {remove, update(Role1, Label, Quest, ProgressId, NewP)};
                {ok, Quest, P = #quest_progress{value = Value}} ->
                    NewP = P#quest_progress{finish = 0, value = Value + 1},
                    {ok, update(Role, Label, Quest, ProgressId, NewP)}
            end;
        _ -> ok
    end;
event(#evt_combat_statistics{guard = Guard}, Role,
      Label, QuestId, ProgressId, Target, [{guard, Num}]) ->
    Len = length([1
                  || {_, Score} <- Guard, Score >= Target]),
    case Len >= Num of
        true ->
            case fetch(Role, Label, QuestId, ProgressId) of
                {error, role} -> {ok, Role};
                {error, _} -> remove;
                {ok, _Quest, #quest_progress{finish = Finish}}
                    when Finish =/= 0 ->
                    remove;
                {ok,
                 Quest,
                 P = #quest_progress{target_val = TargetVal,
                                     value = Value, param = Param}}
                    when Value + 1 >= TargetVal ->
                    RemoveRole = plot_quest:remove_task_unit(Role, Param),
                    Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
                    NewP = P#quest_progress{finish = 1, value = TargetVal,
                                            trigger = undefined},
                    {remove, update(Role1, Label, Quest, ProgressId, NewP)};
                {ok, Quest, P = #quest_progress{value = Value}} ->
                    NewP = P#quest_progress{finish = 0, value = Value + 1},
                    {ok, update(Role, Label, Quest, ProgressId, NewP)}
            end;
        _ -> ok
    end;
event(#evt_combat_statistics{kill_group = Val}, Role,
      Label, QuestId, ProgressId, _Target, [kill_group]) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + Val >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0,
                                    value = Value + Val},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_combat_statistics{kill_group_pet = Val},
      Role, Label, QuestId, ProgressId, _Target,
      [kill_group_pet]) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + Val >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0,
                                    value = Value + Val},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_combat_statistics{killed_group = Val}, Role,
      Label, QuestId, ProgressId, _Target, [killed_group]) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + Val >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0,
                                    value = Value + Val},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_combat_statistics{killed_group_target = Val},
      Role, Label, QuestId, ProgressId, _Target,
      [killed_group_target]) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + Val >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0,
                                    value = Value + Val},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_combat_statistics{}, _Role, _Label, _QuestId,
      _ProgressId, _Target, _Param) ->
    ok;
event(#evt_alchemy_melt{item_list = ItemList}, Role,
      Label, QuestId, ProgressId, Target, _Param) ->
    L = [{ItemId, Num, item_data:get(ItemId)}
         || {ItemId, Num} <- ItemList],
    Sum = lists:sum([Num
                     || {_, Num, #item_base{alchemy = Alchemy}} <- L,
                        Alchemy >= Target]),
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + Sum >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0,
                                    value = Value + Sum},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_alchemy_produce{item_list = ItemList}, Role,
      Label, QuestId, ProgressId, _Target, _Param) ->
    Sum = length(ItemList),
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + Sum >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0,
                                    value = Value + Sum},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_classes_challenge_order{order = Order}, Role,
      Label, QuestId, ProgressId, Target, _Param)
    when Order >= Target ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_classes_challenge_order{}, _Role, _Label,
      _QuestId, _ProgressId, _Target, _Param) ->
    ok;
event(#evt_classes_challenge_rank{rank = Rank}, Role,
      Label, QuestId, ProgressId, Target, _Param)
    when Rank =< Target ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             param = Param}}
            when 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = OldVal}}
            when 1 > OldVal ->
            NewP = P#quest_progress{finish = 0, value = 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)};
        _ -> ok
    end;
event(#evt_classes_challenge_rank{}, _Role, _Label,
      _QuestId, _ProgressId, _Target, _Param) ->
    ok;
event(#evt_classes_challenge_up_rank{}, Role, Label,
      QuestId, ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_achievement{},
      Role = #role{m_achievement =
                       #m_achievement{point = Point}},
      Label, QuestId, ProgressId, _Target, [point]) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             param = Param}}
            when Point >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = OldVal}}
            when Point > OldVal ->
            NewP = P#quest_progress{finish = 0, value = Point},
            {ok, update(Role, Label, Quest, ProgressId, NewP)};
        _ -> ok
    end;
event(#evt_achievement{id = Id}, Role, Label, QuestId,
      ProgressId, _Target, [{id, Id}]) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             param = Param}}
            when 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = OldVal}}
            when 1 > OldVal ->
            NewP = P#quest_progress{finish = 0, value = 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)};
        _ -> ok
    end;
event(#evt_achievement{}, _Role, _Label, _QuestId,
      _ProgressId, _Target, _Param) ->
    ok;
event(#evt_honor{},
      Role = #role{m_honor = #m_honor{r_list = RList}}, Label,
      QuestId, ProgressId, 0, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             param = Param}}
            when length(RList) >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = OldVal}}
            when length(RList) > OldVal ->
            NewP = P#quest_progress{finish = 0,
                                    value = length(RList)},
            {ok, update(Role, Label, Quest, ProgressId, NewP)};
        _ -> ok
    end;
event(#evt_honor{id = Target}, Role, Label, QuestId,
      ProgressId, Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             param = Param}}
            when 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = OldVal}}
            when 1 > OldVal ->
            NewP = P#quest_progress{finish = 0, value = 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)};
        _ -> ok
    end;
event(#evt_honor{}, _Role, _Label, _QuestId,
      _ProgressId, _Target, _Param) ->
    ok;
event(#evt_pre_honor{},
      Role = #role{m_honor = #m_honor{r_pre_list = PreList}},
      Label, QuestId, ProgressId, 0, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             param = Param}}
            when length(PreList) >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = OldVal}}
            when length(PreList) > OldVal ->
            NewP = P#quest_progress{finish = 0,
                                    value = length(PreList)},
            {ok, update(Role, Label, Quest, ProgressId, NewP)};
        _ -> ok
    end;
event(#evt_pre_honor{pre_id = Target}, Role, Label,
      QuestId, ProgressId, Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             param = Param}}
            when 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = OldVal}}
            when 1 > OldVal ->
            NewP = P#quest_progress{finish = 0, value = 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)};
        _ -> ok
    end;
event(#evt_pre_honor{}, _Role, _Label, _QuestId,
      _ProgressId, _Target, _Param) ->
    ok;
event(#evt_fashion{}, Role, Label, QuestId, ProgressId,
      Target, _Param)
    when Target > 0 ->
    Num = fashion:count(Role, Target),
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             param = Param}}
            when Num >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = OldVal}}
            when Num > OldVal ->
            NewP = P#quest_progress{finish = 0, value = Num},
            {ok, update(Role, Label, Quest, ProgressId, NewP)};
        _ -> ok
    end;
event(#evt_fashion{}, Role, Label, QuestId, ProgressId,
      _Target, _Param) ->
    Num = fashion:count(Role, suit),
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             param = Param}}
            when Num >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = OldVal}}
            when Num > OldVal ->
            NewP = P#quest_progress{finish = 0, value = Num},
            {ok, update(Role, Label, Quest, ProgressId, NewP)};
        _ -> ok
    end;
event(#evt_qualifying{},
      Role = #role{m_qualifying =
                       #m_qualifying{rank_point = RankPoint}},
      Label, QuestId, ProgressId, _Target, [rank_point]) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             param = Param}}
            when RankPoint >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = OldVal}}
            when RankPoint > OldVal ->
            NewP = P#quest_progress{finish = 0, value = RankPoint},
            {ok, update(Role, Label, Quest, ProgressId, NewP)};
        _ -> ok
    end;
event(#evt_qualifying{},
      Role = #role{m_qualifying =
                       #m_qualifying{day_win = DayWin}},
      Label, QuestId, ProgressId, _Target, [day_win]) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             param = Param}}
            when DayWin >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = OldVal}}
            when DayWin > OldVal ->
            NewP = P#quest_progress{finish = 0, value = DayWin},
            {ok, update(Role, Label, Quest, ProgressId, NewP)};
        _ -> ok
    end;
event(#evt_qualifying{}, _Role, _Label, _QuestId,
      _ProgressId, _Target, _Param) ->
    ok;
event(#evt_roll{point = Point, reward = 0}, Role, Label,
      QuestId, ProgressId, Target, [no_reward])
    when Point >= Target ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_roll{point = Point, reward = 1}, Role, Label,
      QuestId, ProgressId, Target, [reward])
    when Point =< Target ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_roll{point = Point}, Role, Label, QuestId,
      ProgressId, Target, [larger])
    when Point > Target ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_roll{point = Point}, Role, Label, QuestId,
      ProgressId, Target, [less])
    when Point < Target ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_roll{point = Target}, Role, Label, QuestId,
      ProgressId, Target, []) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_roll{}, _Role, _Label, _QuestId, _ProgressId,
      _Target, _Param) ->
    ok;
event(#evt_constellation{}, Role, Label, QuestId,
      ProgressId, _Target, [count]) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_constellation{lev = Lev}, Role, Label,
      QuestId, ProgressId, 0, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             param = Param}}
            when Lev >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = OldVal}}
            when Lev > OldVal ->
            NewP = P#quest_progress{finish = 0, value = Lev},
            {ok, update(Role, Label, Quest, ProgressId, NewP)};
        _ -> ok
    end;
event(#evt_constellation{base_id = Target, lev = Lev},
      Role, Label, QuestId, ProgressId, Target,
      [{lev, Lev}]) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             param = Param}}
            when Lev >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = OldVal}}
            when Lev > OldVal ->
            NewP = P#quest_progress{finish = 0, value = Lev},
            {ok, update(Role, Label, Quest, ProgressId, NewP)};
        _ -> ok
    end;
event(#evt_constellation{}, _Role, _Label, _QuestId,
      _ProgressId, _Target, _Param) ->
    ok;
event(#evt_cultivate_plant{}, Role, Label, QuestId,
      ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_guild_plant_irrigate{}, Role, Label, QuestId,
      ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_wedding_marry{}, Role, Label, QuestId,
      ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_wedding_divorce{}, Role, Label, QuestId,
      ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_constellation_first{base_id = Target}, Role,
      Label, QuestId, ProgressId, Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_constellation_first{}, Role, Label, QuestId,
      ProgressId, 0, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_constellation_first{}, _Role, _Label,
      _QuestId, _ProgressId, _, _Param) ->
    ok;
event(#evt_boss_first{base_id = Target}, Role, Label,
      QuestId, ProgressId, Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_boss_first{}, Role, Label, QuestId,
      ProgressId, 0, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_boss_first{}, _Role, _Label, _QuestId,
      _ProgressId, _, _Param) ->
    ok;
event(#evt_wedding_guest{}, Role, Label, QuestId,
      ProgressId, _, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_stars_trial{}, Role, Label, QuestId,
      ProgressId, 0, []) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_stars_trial{base_id = TargetId}, Role, Label,
      QuestId, ProgressId, TargetId, []) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_stars_trial{round = Round}, Role, Label,
      QuestId, ProgressId, TargetRound, [round]) ->
    case Round =< TargetRound of
        true ->
            case fetch(Role, Label, QuestId, ProgressId) of
                {error, role} -> {ok, Role};
                {error, _} -> remove;
                {ok, _Quest, #quest_progress{finish = Finish}}
                    when Finish =/= 0 ->
                    remove;
                {ok,
                 Quest,
                 P = #quest_progress{target_val = TargetVal,
                                     value = Value, param = Param}}
                    when Value + 1 >= TargetVal ->
                    RemoveRole = plot_quest:remove_task_unit(Role, Param),
                    Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
                    NewP = P#quest_progress{finish = 1, value = TargetVal,
                                            trigger = undefined},
                    {remove, update(Role1, Label, Quest, ProgressId, NewP)};
                {ok, Quest, P = #quest_progress{value = Value}} ->
                    NewP = P#quest_progress{finish = 0, value = Value + 1},
                    {ok, update(Role, Label, Quest, ProgressId, NewP)}
            end;
        _ -> ok
    end;
event(#evt_stars_trial{use_item_num = UseItemNum}, Role,
      Label, QuestId, ProgressId, TUseItemNum, [use_item]) ->
    case UseItemNum =< TUseItemNum of
        true ->
            case fetch(Role, Label, QuestId, ProgressId) of
                {error, role} -> {ok, Role};
                {error, _} -> remove;
                {ok, _Quest, #quest_progress{finish = Finish}}
                    when Finish =/= 0 ->
                    remove;
                {ok,
                 Quest,
                 P = #quest_progress{target_val = TargetVal,
                                     value = Value, param = Param}}
                    when Value + 1 >= TargetVal ->
                    RemoveRole = plot_quest:remove_task_unit(Role, Param),
                    Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
                    NewP = P#quest_progress{finish = 1, value = TargetVal,
                                            trigger = undefined},
                    {remove, update(Role1, Label, Quest, ProgressId, NewP)};
                {ok, Quest, P = #quest_progress{value = Value}} ->
                    NewP = P#quest_progress{finish = 0, value = Value + 1},
                    {ok, update(Role, Label, Quest, ProgressId, NewP)}
            end;
        _ -> ok
    end;
event(#evt_stars_trial{pet_summon = PetSummon}, Role,
      Label, QuestId, ProgressId, PetCastNum, [pet_summon]) ->
    case PetSummon =< PetCastNum of
        true ->
            case fetch(Role, Label, QuestId, ProgressId) of
                {error, role} -> {ok, Role};
                {error, _} -> remove;
                {ok, _Quest, #quest_progress{finish = Finish}}
                    when Finish =/= 0 ->
                    remove;
                {ok,
                 Quest,
                 P = #quest_progress{target_val = TargetVal,
                                     value = Value, param = Param}}
                    when Value + 1 >= TargetVal ->
                    RemoveRole = plot_quest:remove_task_unit(Role, Param),
                    Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
                    NewP = P#quest_progress{finish = 1, value = TargetVal,
                                            trigger = undefined},
                    {remove, update(Role1, Label, Quest, ProgressId, NewP)};
                {ok, Quest, P = #quest_progress{value = Value}} ->
                    NewP = P#quest_progress{finish = 0, value = Value + 1},
                    {ok, update(Role, Label, Quest, ProgressId, NewP)}
            end;
        _ -> ok
    end;
event(#evt_stars_trial{combat_formation = FormationId},
      Role, Label, QuestId, ProgressId, FormationId,
      [combat_formation]) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_stars_trial{self_die_times = DieTimes}, Role,
      Label, QuestId, ProgressId, TrgetTimes, [self_die]) ->
    case DieTimes >= TrgetTimes of
        true ->
            case fetch(Role, Label, QuestId, ProgressId) of
                {error, role} -> {ok, Role};
                {error, _} -> remove;
                {ok, _Quest, #quest_progress{finish = Finish}}
                    when Finish =/= 0 ->
                    remove;
                {ok,
                 Quest,
                 P = #quest_progress{target_val = TargetVal,
                                     value = Value, param = Param}}
                    when Value + 1 >= TargetVal ->
                    RemoveRole = plot_quest:remove_task_unit(Role, Param),
                    Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
                    NewP = P#quest_progress{finish = 1, value = TargetVal,
                                            trigger = undefined},
                    {remove, update(Role1, Label, Quest, ProgressId, NewP)};
                {ok, Quest, P = #quest_progress{value = Value}} ->
                    NewP = P#quest_progress{finish = 0, value = Value + 1},
                    {ok, update(Role, Label, Quest, ProgressId, NewP)}
            end;
        _ -> ok
    end;
event(#evt_stars_trial{}, _Role, _Label, _QuestId,
      _ProgressId, _, _Param) ->
    ok;
event(#evt_stars_trial_combat_round{dies = RoundDie},
      Role, Label, QuestId, ProgressId, TrgetTimes,
      [{kill_npc, UnitList}]) ->
    logger:debug("回合死亡:~w",
                 [RoundDie],
                 quest_progress,
                 1806),
    case length([UnitId
                 || UnitId <- RoundDie, lists:member(UnitId, UnitList)])
             >= TrgetTimes
        of
        true ->
            case fetch(Role, Label, QuestId, ProgressId) of
                {error, role} -> {ok, Role};
                {error, _} -> remove;
                {ok, _Quest, #quest_progress{finish = Finish}}
                    when Finish =/= 0 ->
                    remove;
                {ok,
                 Quest,
                 P = #quest_progress{target_val = TargetVal,
                                     value = Value, param = Param}}
                    when Value + 1 >= TargetVal ->
                    RemoveRole = plot_quest:remove_task_unit(Role, Param),
                    Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
                    NewP = P#quest_progress{finish = 1, value = TargetVal,
                                            trigger = undefined},
                    {remove, update(Role1, Label, Quest, ProgressId, NewP)};
                {ok, Quest, P = #quest_progress{value = Value}} ->
                    NewP = P#quest_progress{finish = 0, value = Value + 1},
                    {ok, update(Role, Label, Quest, ProgressId, NewP)}
            end;
        _ -> ok
    end;
event(_Evt = #evt_stars_trial_combat_round{}, _Role,
      _Label, _QuestId, _ProgressId, _, _Param) ->
    logger:debug("回合死亡:~w", [_Evt], quest_progress, 1812),
    ok;
event(_Evt = #evt_stars_trial_combat{skill_use_times =
                                         SkillUse},
      Role, Label, QuestId, ProgressId, TargetUseTimes,
      [{use_skill, SkillId}]) ->
    logger:debug("银月战斗:~w", [_Evt], quest_progress, 1817),
    case lists:keyfind(SkillId, 1, SkillUse) of
        {SkillId, UseTimes} when UseTimes >= TargetUseTimes ->
            case fetch(Role, Label, QuestId, ProgressId) of
                {error, role} -> {ok, Role};
                {error, _} -> remove;
                {ok, _Quest, #quest_progress{finish = Finish}}
                    when Finish =/= 0 ->
                    remove;
                {ok,
                 Quest,
                 P = #quest_progress{target_val = TargetVal,
                                     value = Value, param = Param}}
                    when Value + 1 >= TargetVal ->
                    RemoveRole = plot_quest:remove_task_unit(Role, Param),
                    Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
                    NewP = P#quest_progress{finish = 1, value = TargetVal,
                                            trigger = undefined},
                    {remove, update(Role1, Label, Quest, ProgressId, NewP)};
                {ok, Quest, P = #quest_progress{value = Value}} ->
                    NewP = P#quest_progress{finish = 0, value = Value + 1},
                    {ok, update(Role, Label, Quest, ProgressId, NewP)}
            end;
        _ -> ok
    end;
event(_Evt = #evt_stars_trial_combat{npc_dies =
                                         MaxDieTimes},
      Role, Label, QuestId, ProgressId, TargetDieTimes,
      [die_times]) ->
    logger:debug("银月战斗:~w", [_Evt], quest_progress, 1823),
    case MaxDieTimes >= TargetDieTimes of
        true ->
            case fetch(Role, Label, QuestId, ProgressId) of
                {error, role} -> {ok, Role};
                {error, _} -> remove;
                {ok, _Quest, #quest_progress{finish = Finish}}
                    when Finish =/= 0 ->
                    remove;
                {ok,
                 Quest,
                 P = #quest_progress{target_val = TargetVal,
                                     value = Value, param = Param}}
                    when Value + 1 >= TargetVal ->
                    RemoveRole = plot_quest:remove_task_unit(Role, Param),
                    Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
                    NewP = P#quest_progress{finish = 1, value = TargetVal,
                                            trigger = undefined},
                    {remove, update(Role1, Label, Quest, ProgressId, NewP)};
                {ok, Quest, P = #quest_progress{value = Value}} ->
                    NewP = P#quest_progress{finish = 0, value = Value + 1},
                    {ok, update(Role, Label, Quest, ProgressId, NewP)}
            end;
        _ -> ok
    end;
event(_Evt = #evt_stars_trial_combat{after_die_done =
                                         1},
      Role, Label, QuestId, ProgressId, _Target,
      [after_die_done]) ->
    logger:debug("银月战斗:~w", [_Evt], quest_progress, 1829),
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(_Evt = #evt_stars_trial_combat{}, _Role, _Label,
      _QuestId, _ProgressId, _, _Param) ->
    logger:debug("银月战斗:~w", [_Evt], quest_progress, 1832),
    ok;
event(#evt_arena_win_rate{classes = Target,
                          rate = Rate},
      Role, Label, QuestId, ProgressId, Target, [Min])
    when Rate >= Min ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_arena_win_rate{rate = Rate}, Role, Label,
      QuestId, ProgressId, 0, [Min])
    when Rate >= Min ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_arena_win_rate{}, _Role, _Label, _QuestId,
      _ProgressId, _, _) ->
    ok;
event(#evt_quest_prac_help{}, Role, Label, QuestId,
      ProgressId, _, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_wedding_treasure{base_id = Target}, Role,
      Label, QuestId, ProgressId, Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_wedding_treasure{}, Role, Label, QuestId,
      ProgressId, 0, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_wedding_treasure{}, _Role, _Label, _QuestId,
      _ProgressId, _, _Param) ->
    ok;
event(#evt_wedding_score{}, Role, Label, QuestId,
      ProgressId, _Target, [acc]) ->
    Val = var:get_var(Role, acc, 1009, 0),
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             param = Param}}
            when Val >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = OldVal}}
            when Val > OldVal ->
            NewP = P#quest_progress{finish = 0, value = Val},
            {ok, update(Role, Label, Quest, ProgressId, NewP)};
        _ -> ok
    end;
event(#evt_wedding_score{},
      Role = #role{assets = #assets{love = Val}}, Label,
      QuestId, ProgressId, _Target, _) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             param = Param}}
            when Val >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = OldVal}}
            when Val > OldVal ->
            NewP = P#quest_progress{finish = 0, value = Val},
            {ok, update(Role, Label, Quest, ProgressId, NewP)};
        _ -> ok
    end;
event(#evt_teacher_score_sum{score = Score}, Role,
      Label, QuestId, ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             param = Param}}
            when Score >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = OldVal}}
            when Score > OldVal ->
            NewP = P#quest_progress{finish = 0, value = Score},
            {ok, update(Role, Label, Quest, ProgressId, NewP)};
        _ -> ok
    end;
event(#evt_teacher_to_sudent{}, Role, Label, QuestId,
      ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_teacher{num = Num}, Role, Label, QuestId,
      ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             param = Param}}
            when Num >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = OldVal}}
            when Num > OldVal ->
            NewP = P#quest_progress{finish = 0, value = Num},
            {ok, update(Role, Label, Quest, ProgressId, NewP)};
        _ -> ok
    end;
event(#evt_finish_couple_task{}, Role = #role{}, Label,
      QuestId, ProgressId, _Target, []) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_finish_goal{}, Role = #role{}, Label,
      QuestId, ProgressId, _Target, [{complete, GoalList}]) ->
    case goal:check_complete_goal(Role, GoalList) of
        true ->
            case fetch(Role, Label, QuestId, ProgressId) of
                {error, role} -> {ok, Role};
                {error, _} -> remove;
                {ok, _Quest, #quest_progress{finish = Finish}}
                    when Finish =/= 0 ->
                    remove;
                {ok,
                 Quest,
                 P = #quest_progress{target_val = TargetVal,
                                     param = Param}}
                    when 1 >= TargetVal ->
                    RemoveRole = plot_quest:remove_task_unit(Role, Param),
                    Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
                    NewP = P#quest_progress{finish = 1, value = TargetVal,
                                            trigger = undefined},
                    {remove, update(Role1, Label, Quest, ProgressId, NewP)};
                {ok, Quest, P = #quest_progress{value = OldVal}}
                    when 1 > OldVal ->
                    NewP = P#quest_progress{finish = 0, value = 1},
                    {ok, update(Role, Label, Quest, ProgressId, NewP)};
                _ -> ok
            end;
        false -> ok
    end;
event(#evt_enjoy_moon{}, Role = #role{}, Label, QuestId,
      ProgressId, _Target, _) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             param = Param}}
            when 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = OldVal}}
            when 1 > OldVal ->
            NewP = P#quest_progress{finish = 0, value = 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)};
        _ -> ok
    end;
event(#evt_enjoy_moon_wish{}, Role = #role{}, Label,
      QuestId, ProgressId, _Target, [{wish, 0}]) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_enjoy_moon_wish{type = WishType1},
      Role = #role{}, Label, QuestId, ProgressId, _Target,
      [{wish, WishType2}]) ->
    case WishType1 =:= WishType2 of
        true ->
            case fetch(Role, Label, QuestId, ProgressId) of
                {error, role} -> {ok, Role};
                {error, _} -> remove;
                {ok, _Quest, #quest_progress{finish = Finish}}
                    when Finish =/= 0 ->
                    remove;
                {ok,
                 Quest,
                 P = #quest_progress{target_val = TargetVal,
                                     value = Value, param = Param}}
                    when Value + 1 >= TargetVal ->
                    RemoveRole = plot_quest:remove_task_unit(Role, Param),
                    Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
                    NewP = P#quest_progress{finish = 1, value = TargetVal,
                                            trigger = undefined},
                    {remove, update(Role1, Label, Quest, ProgressId, NewP)};
                {ok, Quest, P = #quest_progress{value = Value}} ->
                    NewP = P#quest_progress{finish = 0, value = Value + 1},
                    {ok, update(Role, Label, Quest, ProgressId, NewP)}
            end;
        _ -> ok
    end;
event(#evt_join_glue_pudding{}, Role = #role{}, Label,
      QuestId, ProgressId, _Target, _) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             param = Param}}
            when 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = OldVal}}
            when 1 > OldVal ->
            NewP = P#quest_progress{finish = 0, value = 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)};
        _ -> ok
    end;
event(#evt_glue_pudding_answer{result = Target},
      Role = #role{}, Label, QuestId, ProgressId, Target,
      []) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_glue_pudding_answer{}, _Role = #role{},
      _Label, _QuestId, _ProgressId, _Target, []) ->
    ok;
event(#evt_glue_pudding_win{}, Role = #role{}, Label,
      QuestId, ProgressId, _Target, []) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_join_kongming_lanterns{camp_id = CampId1},
      Role = #role{}, Label, QuestId, ProgressId, _Target,
      [{camp_id, CampId2}]) ->
    case CampId1 =:= CampId2 of
        true ->
            case fetch(Role, Label, QuestId, ProgressId) of
                {error, role} -> {ok, Role};
                {error, _} -> remove;
                {ok, _Quest, #quest_progress{finish = Finish}}
                    when Finish =/= 0 ->
                    remove;
                {ok,
                 Quest,
                 P = #quest_progress{target_val = TargetVal,
                                     param = Param}}
                    when 1 >= TargetVal ->
                    RemoveRole = plot_quest:remove_task_unit(Role, Param),
                    Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
                    NewP = P#quest_progress{finish = 1, value = TargetVal,
                                            trigger = undefined},
                    {remove, update(Role1, Label, Quest, ProgressId, NewP)};
                {ok, Quest, P = #quest_progress{value = OldVal}}
                    when 1 > OldVal ->
                    NewP = P#quest_progress{finish = 0, value = 1},
                    {ok, update(Role, Label, Quest, ProgressId, NewP)};
                _ -> ok
            end;
        _ -> ok
    end;
event(#evt_kongming_lanterns_answer{camp_id = CampId1,
                                    result = Target},
      Role = #role{}, Label, QuestId, ProgressId, Target,
      [{camp_id, CampId2}]) ->
    case CampId1 =:= CampId2 of
        true ->
            case fetch(Role, Label, QuestId, ProgressId) of
                {error, role} -> {ok, Role};
                {error, _} -> remove;
                {ok, _Quest, #quest_progress{finish = Finish}}
                    when Finish =/= 0 ->
                    remove;
                {ok,
                 Quest,
                 P = #quest_progress{target_val = TargetVal,
                                     value = Value, param = Param}}
                    when Value + 1 >= TargetVal ->
                    RemoveRole = plot_quest:remove_task_unit(Role, Param),
                    Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
                    NewP = P#quest_progress{finish = 1, value = TargetVal,
                                            trigger = undefined},
                    {remove, update(Role1, Label, Quest, ProgressId, NewP)};
                {ok, Quest, P = #quest_progress{value = Value}} ->
                    NewP = P#quest_progress{finish = 0, value = Value + 1},
                    {ok, update(Role, Label, Quest, ProgressId, NewP)}
            end;
        _ -> ok
    end;
event(#evt_kongming_lanterns_answer{}, _Role = #role{},
      _Label, _QuestId, _ProgressId, _Target, []) ->
    ok;
event(#evt_kongming_lanterns_win{camp_id = CampId1},
      Role = #role{}, Label, QuestId, ProgressId, _Target,
      [{camp_id, CampId2}]) ->
    case CampId1 =:= CampId2 of
        true ->
            case fetch(Role, Label, QuestId, ProgressId) of
                {error, role} -> {ok, Role};
                {error, _} -> remove;
                {ok, _Quest, #quest_progress{finish = Finish}}
                    when Finish =/= 0 ->
                    remove;
                {ok,
                 Quest,
                 P = #quest_progress{target_val = TargetVal,
                                     value = Value, param = Param}}
                    when Value + 1 >= TargetVal ->
                    RemoveRole = plot_quest:remove_task_unit(Role, Param),
                    Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
                    NewP = P#quest_progress{finish = 1, value = TargetVal,
                                            trigger = undefined},
                    {remove, update(Role1, Label, Quest, ProgressId, NewP)};
                {ok, Quest, P = #quest_progress{value = Value}} ->
                    NewP = P#quest_progress{finish = 0, value = Value + 1},
                    {ok, update(Role, Label, Quest, ProgressId, NewP)}
            end;
        _ -> ok
    end;
event(#evt_join_mid_pudding{}, Role = #role{}, Label,
      QuestId, ProgressId, _Target, _) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             param = Param}}
            when 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = OldVal}}
            when 1 > OldVal ->
            NewP = P#quest_progress{finish = 0, value = 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)};
        _ -> ok
    end;
event(#evt_mid_pudding_answer{result = Target},
      Role = #role{}, Label, QuestId, ProgressId, Target,
      []) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_mid_pudding_answer{}, _Role = #role{},
      _Label, _QuestId, _ProgressId, _Target, []) ->
    ok;
event(#evt_mid_pudding_win{}, Role = #role{}, Label,
      QuestId, ProgressId, _Target, []) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_camp_fruit{}, Role = #role{}, Label, QuestId,
      ProgressId, _Target, _) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_camp_fruit_help{}, Role = #role{}, Label,
      QuestId, ProgressId, _Target, _) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_camp_fruit_reward{}, Role = #role{}, Label,
      QuestId, ProgressId, _Target, _) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_hide_seek{}, Role = #role{}, Label, QuestId,
      ProgressId, _Target, _) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_hide_seek_help{}, Role = #role{}, Label,
      QuestId, ProgressId, _Target, _) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_hide_seek_reward{}, Role = #role{}, Label,
      QuestId, ProgressId, _Target, _) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_tournament{best_win_count = Num},
      Role = #role{}, Label, QuestId, ProgressId, _Target,
      [win_count]) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             param = Param}}
            when Num >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = OldVal}}
            when Num > OldVal ->
            NewP = P#quest_progress{finish = 0, value = Num},
            {ok, update(Role, Label, Quest, ProgressId, NewP)};
        _ -> ok
    end;
event(#evt_tournament{liked = Num}, Role = #role{},
      Label, QuestId, ProgressId, _Target, [liked]) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             param = Param}}
            when Num >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = OldVal}}
            when Num > OldVal ->
            NewP = P#quest_progress{finish = 0, value = Num},
            {ok, update(Role, Label, Quest, ProgressId, NewP)};
        _ -> ok
    end;
event(#evt_tournament{rank_lev = Num}, Role = #role{},
      Label, QuestId, ProgressId, _Target, [rank_lev]) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             param = Param}}
            when Num >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = OldVal}}
            when Num > OldVal ->
            NewP = P#quest_progress{finish = 0, value = Num},
            {ok, update(Role, Label, Quest, ProgressId, NewP)};
        _ -> ok
    end;
event(#evt_tournament{awesome_kill = Num},
      Role = #role{}, Label, QuestId, ProgressId, _Target,
      [awesome_kill]) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             param = Param}}
            when Num >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = OldVal}}
            when Num > OldVal ->
            NewP = P#quest_progress{finish = 0, value = Num},
            {ok, update(Role, Label, Quest, ProgressId, NewP)};
        _ -> ok
    end;
event(#evt_tournament{awesome_kill_num = Num},
      Role = #role{}, Label, QuestId, ProgressId, _Target,
      [awesome_kill_num]) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             param = Param}}
            when Num >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = OldVal}}
            when Num > OldVal ->
            NewP = P#quest_progress{finish = 0, value = Num},
            {ok, update(Role, Label, Quest, ProgressId, NewP)};
        _ -> ok
    end;
event(#evt_tournament{awesome_dmg = Num},
      Role = #role{}, Label, QuestId, ProgressId, _Target,
      [awesome_dmg]) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             param = Param}}
            when Num >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = OldVal}}
            when Num > OldVal ->
            NewP = P#quest_progress{finish = 0, value = Num},
            {ok, update(Role, Label, Quest, ProgressId, NewP)};
        _ -> ok
    end;
event(#evt_tournament{awesome_heal = Num},
      Role = #role{}, Label, QuestId, ProgressId, _Target,
      [awesome_heal]) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             param = Param}}
            when Num >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = OldVal}}
            when Num > OldVal ->
            NewP = P#quest_progress{finish = 0, value = Num},
            {ok, update(Role, Label, Quest, ProgressId, NewP)};
        _ -> ok
    end;
event(#evt_tournament{awesome_control = Num},
      Role = #role{}, Label, QuestId, ProgressId, _Target,
      [awesome_control]) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             param = Param}}
            when Num >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = OldVal}}
            when Num > OldVal ->
            NewP = P#quest_progress{finish = 0, value = Num},
            {ok, update(Role, Label, Quest, ProgressId, NewP)};
        _ -> ok
    end;
event(#evt_tournament{mvp = Num}, Role = #role{}, Label,
      QuestId, ProgressId, _Target, [mvp]) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             param = Param}}
            when Num >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = OldVal}}
            when Num > OldVal ->
            NewP = P#quest_progress{finish = 0, value = Num},
            {ok, update(Role, Label, Quest, ProgressId, NewP)};
        _ -> ok
    end;
event(#evt_tournament_combat{type = win},
      Role = #role{}, Label, QuestId, ProgressId, _Target,
      [{win}]) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_tournament_combat{}, _Role, _Label, _QuestId,
      _ProgressId, _Target, [{win}]) ->
    ok;
event(#evt_rencounter{is_win = 1}, Role = #role{},
      Label, QuestId, ProgressId, _Target, [{win}]) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_friend_circle{day_num = Val}, Role = #role{},
      Label, QuestId, ProgressId, _Target, [day_num]) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             param = Param}}
            when Val >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = OldVal}}
            when Val > OldVal ->
            NewP = P#quest_progress{finish = 0, value = Val},
            {ok, update(Role, Label, Quest, ProgressId, NewP)};
        _ -> ok
    end;
event(#evt_friend_circle{photos = Val}, Role = #role{},
      Label, QuestId, ProgressId, _Target, [has_photo]) ->
    case Val > 0 of
        true ->
            case fetch(Role, Label, QuestId, ProgressId) of
                {error, role} -> {ok, Role};
                {error, _} -> remove;
                {ok, _Quest, #quest_progress{finish = Finish}}
                    when Finish =/= 0 ->
                    remove;
                {ok,
                 Quest,
                 P = #quest_progress{target_val = TargetVal,
                                     value = Value, param = Param}}
                    when Value + 1 >= TargetVal ->
                    RemoveRole = plot_quest:remove_task_unit(Role, Param),
                    Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
                    NewP = P#quest_progress{finish = 1, value = TargetVal,
                                            trigger = undefined},
                    {remove, update(Role1, Label, Quest, ProgressId, NewP)};
                {ok, Quest, P = #quest_progress{value = Value}} ->
                    NewP = P#quest_progress{finish = 0, value = Value + 1},
                    {ok, update(Role, Label, Quest, ProgressId, NewP)}
            end;
        _ -> ok
    end;
event(#evt_friend_circle{photos = Val}, Role = #role{},
      Label, QuestId, ProgressId, _Target, [photos_acc]) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + Val >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0,
                                    value = Value + Val},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_friend_circle{photos = Val}, Role = #role{},
      Label, QuestId, ProgressId, _Target, [photos]) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             param = Param}}
            when Val >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = OldVal}}
            when Val > OldVal ->
            NewP = P#quest_progress{finish = 0, value = Val},
            {ok, update(Role, Label, Quest, ProgressId, NewP)};
        _ -> ok
    end;
event(#evt_friend_circle{mentions = Val},
      Role = #role{}, Label, QuestId, ProgressId, _Target,
      [has_mentions]) ->
    case Val > 0 of
        true ->
            case fetch(Role, Label, QuestId, ProgressId) of
                {error, role} -> {ok, Role};
                {error, _} -> remove;
                {ok, _Quest, #quest_progress{finish = Finish}}
                    when Finish =/= 0 ->
                    remove;
                {ok,
                 Quest,
                 P = #quest_progress{target_val = TargetVal,
                                     value = Value, param = Param}}
                    when Value + 1 >= TargetVal ->
                    RemoveRole = plot_quest:remove_task_unit(Role, Param),
                    Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
                    NewP = P#quest_progress{finish = 1, value = TargetVal,
                                            trigger = undefined},
                    {remove, update(Role1, Label, Quest, ProgressId, NewP)};
                {ok, Quest, P = #quest_progress{value = Value}} ->
                    NewP = P#quest_progress{finish = 0, value = Value + 1},
                    {ok, update(Role, Label, Quest, ProgressId, NewP)}
            end;
        _ -> ok
    end;
event(#evt_friend_circle{mentions = Val},
      Role = #role{}, Label, QuestId, ProgressId, _Target,
      [mentions_acc]) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + Val >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0,
                                    value = Value + Val},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_friend_circle{mentions = Val},
      Role = #role{}, Label, QuestId, ProgressId, _Target,
      [mentions]) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             param = Param}}
            when Val >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = OldVal}}
            when Val > OldVal ->
            NewP = P#quest_progress{finish = 0, value = Val},
            {ok, update(Role, Label, Quest, ProgressId, NewP)};
        _ -> ok
    end;
event(#evt_friend_circle{}, Role = #role{}, Label,
      QuestId, ProgressId, _Target, _) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_friend_circle_liked{other = Val},
      Role = #role{}, Label, QuestId, ProgressId, 1, _) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             param = Param}}
            when Val >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = OldVal}}
            when Val > OldVal ->
            NewP = P#quest_progress{finish = 0, value = Val},
            {ok, update(Role, Label, Quest, ProgressId, NewP)};
        _ -> ok
    end;
event(#evt_friend_circle_like{self = false},
      Role = #role{}, Label, QuestId, ProgressId, 1, _) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_friend_circle_commented{other = Val},
      Role = #role{}, Label, QuestId, ProgressId, 1, _) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             param = Param}}
            when Val >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = OldVal}}
            when Val > OldVal ->
            NewP = P#quest_progress{finish = 0, value = Val},
            {ok, update(Role, Label, Quest, ProgressId, NewP)};
        _ -> ok
    end;
event(#evt_friend_circle_comment{self = false},
      Role = #role{}, Label, QuestId, ProgressId, 1, _) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_friend_circle_liked{num = Val},
      Role = #role{}, Label, QuestId, ProgressId, _Target,
      _) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             param = Param}}
            when Val >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = OldVal}}
            when Val > OldVal ->
            NewP = P#quest_progress{finish = 0, value = Val},
            {ok, update(Role, Label, Quest, ProgressId, NewP)};
        _ -> ok
    end;
event(#evt_friend_circle_like{}, Role = #role{}, Label,
      QuestId, ProgressId, _Target, _) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_friend_circle_commented{num = Val},
      Role = #role{}, Label, QuestId, ProgressId, _Target,
      _) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             param = Param}}
            when Val >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = OldVal}}
            when Val > OldVal ->
            NewP = P#quest_progress{finish = 0, value = Val},
            {ok, update(Role, Label, Quest, ProgressId, NewP)};
        _ -> ok
    end;
event(#evt_friend_circle_comment{}, Role = #role{},
      Label, QuestId, ProgressId, _Target, _) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_family_update{type = Target, lev = Lev},
      Role = #role{}, Label, QuestId, ProgressId, Target,
      _) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             param = Param}}
            when Lev >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = OldVal}}
            when Lev > OldVal ->
            NewP = P#quest_progress{finish = 0, value = Lev},
            {ok, update(Role, Label, Quest, ProgressId, NewP)};
        _ -> ok
    end;
event(#evt_family_update{}, _Role, _Label, _QuestId,
      _ProgressId, _Target, _) ->
    ok;
event(#evt_family{lev = Lev}, Role = #role{}, Label,
      QuestId, ProgressId, _Target, _) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             param = Param}}
            when Lev >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = OldVal}}
            when Lev > OldVal ->
            NewP = P#quest_progress{finish = 0, value = Lev},
            {ok, update(Role, Label, Quest, ProgressId, NewP)};
        _ -> ok
    end;
event(#evt_family_env{env = Env}, Role = #role{}, Label,
      QuestId, ProgressId, _Target, _) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             param = Param}}
            when Env >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = OldVal}}
            when Env > OldVal ->
            NewP = P#quest_progress{finish = 0, value = Env},
            {ok, update(Role, Label, Quest, ProgressId, NewP)};
        _ -> ok
    end;
event(#evt_family_furnishing{type = Target,
                             count = Count},
      Role = #role{}, Label, QuestId, ProgressId, Target,
      _) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             param = Param}}
            when Count >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = OldVal}}
            when Count > OldVal ->
            NewP = P#quest_progress{finish = 0, value = Count},
            {ok, update(Role, Label, Quest, ProgressId, NewP)};
        _ -> ok
    end;
event(#evt_family_furnishing{type = _Type,
                             count = _Count},
      _Role, _Label, _QuestId, _ProgressId, _Target, _) ->
    ok;
event(#evt_family_self_magic_beans{}, Role = #role{},
      Label, QuestId, ProgressId, _Target, _) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_family_help_magic_beans{}, Role = #role{},
      Label, QuestId, ProgressId, _Target, _) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_campaign_bag_fill{}, Role = #role{}, Label,
      QuestId, ProgressId, _Target, _) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_campaign_bag_reward{}, Role = #role{}, Label,
      QuestId, ProgressId, _Target, _) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_camp_cake_finish{}, Role = #role{}, Label,
      QuestId, ProgressId, _Target, _) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_own_mount{status = Status, count = Count},
      Role = #role{}, Label, QuestId, ProgressId, Target,
      _) ->
    case Status =:= Target of
        true ->
            case fetch(Role, Label, QuestId, ProgressId) of
                {error, role} -> {ok, Role};
                {error, _} -> remove;
                {ok, _Quest, #quest_progress{finish = Finish}}
                    when Finish =/= 0 ->
                    remove;
                {ok,
                 Quest,
                 P = #quest_progress{target_val = TargetVal,
                                     param = Param}}
                    when Count >= TargetVal ->
                    RemoveRole = plot_quest:remove_task_unit(Role, Param),
                    Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
                    NewP = P#quest_progress{finish = 1, value = TargetVal,
                                            trigger = undefined},
                    {remove, update(Role1, Label, Quest, ProgressId, NewP)};
                {ok, Quest, P = #quest_progress{value = OldVal}}
                    when Count > OldVal ->
                    NewP = P#quest_progress{finish = 0, value = Count},
                    {ok, update(Role, Label, Quest, ProgressId, NewP)};
                _ -> ok
            end;
        false -> ok
    end;
event(#evt_mount_growth{growth = Growth},
      Role = #role{}, Label, QuestId, ProgressId, _Target,
      _) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             param = Param}}
            when Growth >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = OldVal}}
            when Growth > OldVal ->
            NewP = P#quest_progress{finish = 0, value = Growth},
            {ok, update(Role, Label, Quest, ProgressId, NewP)};
        _ -> ok
    end;
event(#evt_everyday{val = Val}, Role = #role{}, Label,
      QuestId, ProgressId, _Target, _) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             param = Param}}
            when Val >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = OldVal}}
            when Val > OldVal ->
            NewP = P#quest_progress{finish = 0, value = Val},
            {ok, update(Role, Label, Quest, ProgressId, NewP)};
        _ -> ok
    end;
event(#evt_campaign_reward{id = Id}, Role, Label,
      QuestId, ProgressId, _Target, Param) ->
    case is_list(Param) andalso lists:member(Id, Param) of
        true ->
            case fetch(Role, Label, QuestId, ProgressId) of
                {error, role} -> {ok, Role};
                {error, _} -> remove;
                {ok, _Quest, #quest_progress{finish = Finish}}
                    when Finish =/= 0 ->
                    remove;
                {ok,
                 Quest,
                 P = #quest_progress{target_val = TargetVal,
                                     value = Value, param = Param}}
                    when Value + 1 >= TargetVal ->
                    RemoveRole = plot_quest:remove_task_unit(Role, Param),
                    Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
                    NewP = P#quest_progress{finish = 1, value = TargetVal,
                                            trigger = undefined},
                    {remove, update(Role1, Label, Quest, ProgressId, NewP)};
                {ok, Quest, P = #quest_progress{value = Value}} ->
                    NewP = P#quest_progress{finish = 0, value = Value + 1},
                    {ok, update(Role, Label, Quest, ProgressId, NewP)}
            end;
        _ -> ok
    end;
event(#evt_lev_break{}, Role, Label, QuestId,
      ProgressId, _Target, Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_lev_break_active{}, Role, Label, QuestId,
      ProgressId, _Target, Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_mount_appearand{count = Count},
      Role = #role{}, Label, QuestId, ProgressId, _Target,
      _) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             param = Param}}
            when Count >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = OldVal}}
            when Count > OldVal ->
            NewP = P#quest_progress{finish = 0, value = Count},
            {ok, update(Role, Label, Quest, ProgressId, NewP)};
        _ -> ok
    end;
event(#evt_mount_mange_pet{}, Role = #role{}, Label,
      QuestId, ProgressId, _Target, _) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             param = Param}}
            when 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = OldVal}}
            when 1 > OldVal ->
            NewP = P#quest_progress{finish = 0, value = 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)};
        _ -> ok
    end;
event(#evt_mount_lev{lev = Lev}, Role = #role{}, Label,
      QuestId, ProgressId, _Target, _) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             param = Param}}
            when Lev >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = OldVal}}
            when Lev > OldVal ->
            NewP = P#quest_progress{finish = 0, value = Lev},
            {ok, update(Role, Label, Quest, ProgressId, NewP)};
        _ -> ok
    end;
event(#evt_wedding_day{day = Day}, Role = #role{},
      Label, QuestId, ProgressId, _Target, _) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             param = Param}}
            when Day >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = OldVal}}
            when Day > OldVal ->
            NewP = P#quest_progress{finish = 0, value = Day},
            {ok, update(Role, Label, Quest, ProgressId, NewP)};
        _ -> ok
    end;
event(#evt_maze_gold{gold = Gold}, Role = #role{},
      Label, QuestId, ProgressId, _Target, _) ->
    logger:debug("宝藏迷宫触发金币 ~w",
                 [Gold],
                 quest_progress,
                 2138),
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             param = Param}}
            when Gold >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = OldVal}}
            when Gold > OldVal ->
            NewP = P#quest_progress{finish = 0, value = Gold},
            {ok, update(Role, Label, Quest, ProgressId, NewP)};
        _ -> ok
    end;
event(#evt_national_wisdom_right{}, Role = #role{},
      Label, QuestId, ProgressId, _Target, _) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_national_wisdom_luckyer{}, Role = #role{},
      Label, QuestId, ProgressId, _Target, _) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_rainbow_lottery_day{}, Role = #role{}, Label,
      QuestId, ProgressId, _Target, _) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_lev_break_exch{val = Val}, Role = #role{},
      Label, QuestId, ProgressId, _Target, _) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + Val >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0,
                                    value = Value + Val},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_classes_modify_times{times = Times},
      Role = #role{}, Label, QuestId, ProgressId, _Target,
      _) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             param = Param}}
            when Times >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = OldVal}}
            when Times > OldVal ->
            NewP = P#quest_progress{finish = 0, value = Times},
            {ok, update(Role, Label, Quest, ProgressId, NewP)};
        _ -> ok
    end;
event(#evt_use_fruit_limit{base_id = Target}, Role,
      Label, QuestId, ProgressId, Target, []) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_use_fruit_limit{lev = Lev}, Role, Label,
      QuestId, ProgressId, 0, [{lev, Lev}]) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_use_fruit_limit{}, _Role, _Label, _QuestId,
      _ProgressId, _Target, _Param) ->
    ok;
event(#endless_challenge_cross{wave = Wave}, Role,
      Label, QuestId, ProgressId, _Target, []) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             param = Param}}
            when Wave >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = OldVal}}
            when Wave > OldVal ->
            NewP = P#quest_progress{finish = 0, value = Wave},
            {ok, update(Role, Label, Quest, ProgressId, NewP)};
        _ -> ok
    end;
event(#endless_challenge_card{}, Role, Label, QuestId,
      ProgressId, _Target, []) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_campaign_unit_card{}, Role, Label, QuestId,
      ProgressId, _Target, []) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_campaign_unit_card_boss{}, Role, Label,
      QuestId, ProgressId, _Target, []) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_sworn_finish{times = Times}, Role = #role{},
      Label, QuestId, ProgressId, _Target, _) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             param = Param}}
            when Times >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = OldVal}}
            when Times > OldVal ->
            NewP = P#quest_progress{finish = 0, value = Times},
            {ok, update(Role, Label, Quest, ProgressId, NewP)};
        _ -> ok
    end;
event(#evt_sworn_invite{times = Times}, Role = #role{},
      Label, QuestId, ProgressId, _Target, _) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             param = Param}}
            when Times >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = OldVal}}
            when Times > OldVal ->
            NewP = P#quest_progress{finish = 0, value = Times},
            {ok, update(Role, Label, Quest, ProgressId, NewP)};
        _ -> ok
    end;
event(#evt_sworn_name{times = Times}, Role = #role{},
      Label, QuestId, ProgressId, _Target, _) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             param = Param}}
            when Times >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = OldVal}}
            when Times > OldVal ->
            NewP = P#quest_progress{finish = 0, value = Times},
            {ok, update(Role, Label, Quest, ProgressId, NewP)};
        _ -> ok
    end;
event(#evt_sworn_defined_name{times = Times},
      Role = #role{}, Label, QuestId, ProgressId, _Target,
      _) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             param = Param}}
            when Times >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = OldVal}}
            when Times > OldVal ->
            NewP = P#quest_progress{finish = 0, value = Times},
            {ok, update(Role, Label, Quest, ProgressId, NewP)};
        _ -> ok
    end;
event(#evt_sworn_skill{times = Times}, Role = #role{},
      Label, QuestId, ProgressId, _Target, _) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             param = Param}}
            when Times >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = OldVal}}
            when Times > OldVal ->
            NewP = P#quest_progress{finish = 0, value = Times},
            {ok, update(Role, Label, Quest, ProgressId, NewP)};
        _ -> ok
    end;
event(#evt_guild_league_join{}, Role, Label, QuestId,
      ProgressId, _Target, []) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_guild_league_cannon{}, Role, Label, QuestId,
      ProgressId, _Target, []) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_guild_league_win{}, Role, Label, QuestId,
      ProgressId, _Target, []) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_guild_pray{}, Role, Label, QuestId,
      ProgressId, _Target, []) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_go_to_bed{}, Role, Label, QuestId,
      ProgressId, _Target, []) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_child_deliver{}, Role, Label, QuestId,
      ProgressId, _Target, []) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_child_grow{stage = Target}, Role, Label,
      QuestId, ProgressId, Target, []) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_child_info{},
      Role = #role{m_child = #m_child{kids = Kids}}, Label,
      QuestId, ProgressId, _Target, [{growth_num, Type}]) ->
    Num = length([Growth
                  || #child{growth_type = Growth, stage = 3} <- Kids,
                     Growth =:= Type]),
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             param = Param}}
            when Num >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = OldVal}}
            when Num > OldVal ->
            NewP = P#quest_progress{finish = 0, value = Num},
            {ok, update(Role, Label, Quest, ProgressId, NewP)};
        _ -> ok
    end;
event(#evt_child_info{talent_skills = TSks,
                      skills = Sks},
      Role, Label, QuestId, ProgressId, _Target,
      [skill_num]) ->
    Num = length(Sks ++ TSks),
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             param = Param}}
            when Num >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = OldVal}}
            when Num > OldVal ->
            NewP = P#quest_progress{finish = 0, value = Num},
            {ok, update(Role, Label, Quest, ProgressId, NewP)};
        _ -> ok
    end;
event(#evt_child_info{talent_skills = TSks}, Role,
      Label, QuestId, ProgressId, _Target,
      [talent_skill_max_lev]) ->
    case [Tlv || #child_talent_skill{lev = Tlv} <- TSks] of
        [] -> ok;
        Tlvs ->
            MaxLev = lists:max(Tlvs),
            case fetch(Role, Label, QuestId, ProgressId) of
                {error, role} -> {ok, Role};
                {error, _} -> remove;
                {ok, _Quest, #quest_progress{finish = Finish}}
                    when Finish =/= 0 ->
                    remove;
                {ok,
                 Quest,
                 P = #quest_progress{target_val = TargetVal,
                                     param = Param}}
                    when MaxLev >= TargetVal ->
                    RemoveRole = plot_quest:remove_task_unit(Role, Param),
                    Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
                    NewP = P#quest_progress{finish = 1, value = TargetVal,
                                            trigger = undefined},
                    {remove, update(Role1, Label, Quest, ProgressId, NewP)};
                {ok, Quest, P = #quest_progress{value = OldVal}}
                    when MaxLev > OldVal ->
                    NewP = P#quest_progress{finish = 0, value = MaxLev},
                    {ok, update(Role, Label, Quest, ProgressId, NewP)};
                _ -> ok
            end
    end;
event(#evt_child_info{talent_skills = TSks}, Role,
      Label, QuestId, ProgressId, _Target,
      [talent_skill_sum_lev]) ->
    MaxLev = lists:sum([Tlv
                        || #child_talent_skill{lev = Tlv} <- TSks]),
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             param = Param}}
            when MaxLev >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = OldVal}}
            when MaxLev > OldVal ->
            NewP = P#quest_progress{finish = 0, value = MaxLev},
            {ok, update(Role, Label, Quest, ProgressId, NewP)};
        _ -> ok
    end;
event(#evt_child_study{},
      Role = #role{m_child = #m_child{kids = Kids}}, Label,
      QuestId, ProgressId, _Target, [{score, Score}]) ->
    Num = length([I
                  || #child{id = I,
                            child_attr =
                                #child_attr{study_str = Str, study_con = Con,
                                            study_mag = Mag, study_agi = Agi,
                                            study_end = End}}
                         <- Kids,
                     lists:max([Str, Con, Mag, Agi, End]) >= Score]),
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             param = Param}}
            when Num >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = OldVal}}
            when Num > OldVal ->
            NewP = P#quest_progress{finish = 0, value = Num},
            {ok, update(Role, Label, Quest, ProgressId, NewP)};
        _ -> ok
    end;
event(#evt_child_eat{base_id = BaseId, num = Num}, Role,
      Label, QuestId, ProgressId, _Target, Param) ->
    case lists:member(BaseId, Param) of
        true ->
            case fetch(Role, Label, QuestId, ProgressId) of
                {error, role} -> {ok, Role};
                {error, _} -> remove;
                {ok, _Quest, #quest_progress{finish = Finish}}
                    when Finish =/= 0 ->
                    remove;
                {ok,
                 Quest,
                 P = #quest_progress{target_val = TargetVal,
                                     value = Value, param = Param}}
                    when Value + Num >= TargetVal ->
                    RemoveRole = plot_quest:remove_task_unit(Role, Param),
                    Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
                    NewP = P#quest_progress{finish = 1, value = TargetVal,
                                            trigger = undefined},
                    {remove, update(Role1, Label, Quest, ProgressId, NewP)};
                {ok, Quest, P = #quest_progress{value = Value}} ->
                    NewP = P#quest_progress{finish = 0,
                                            value = Value + Num},
                    {ok, update(Role, Label, Quest, ProgressId, NewP)}
            end;
        _ -> ok
    end;
event(#evt_maze{}, Role, Label, QuestId, ProgressId,
      _Target, Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_maze_sweep{}, Role, Label, QuestId,
      ProgressId, _Target, Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_maze_monster{}, Role, Label, QuestId,
      ProgressId, _Target, Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_maze_gold{}, Role, Label, QuestId,
      ProgressId, _Target, Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_maze_monkey{}, Role, Label, QuestId,
      ProgressId, _Target, Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_maze_cat{}, Role, Label, QuestId, ProgressId,
      _Target, Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_may_day_bags{}, Role, Label, QuestId,
      ProgressId, _Target, Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_may_day_help{}, Role, Label, QuestId,
      ProgressId, _Target, Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_may_day_clean{camp_id = CampId1}, Role,
      Label, QuestId, ProgressId, _Target,
      [{camp_id, CampId2}]) ->
    case CampId1 =:= CampId2 of
        true ->
            case fetch(Role, Label, QuestId, ProgressId) of
                {error, role} -> {ok, Role};
                {error, _} -> remove;
                {ok, _Quest, #quest_progress{finish = Finish}}
                    when Finish =/= 0 ->
                    remove;
                {ok,
                 Quest,
                 P = #quest_progress{target_val = TargetVal,
                                     value = Value, param = Param}}
                    when Value + 1 >= TargetVal ->
                    RemoveRole = plot_quest:remove_task_unit(Role, Param),
                    Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
                    NewP = P#quest_progress{finish = 1, value = TargetVal,
                                            trigger = undefined},
                    {remove, update(Role1, Label, Quest, ProgressId, NewP)};
                {ok, Quest, P = #quest_progress{value = Value}} ->
                    NewP = P#quest_progress{finish = 0, value = Value + 1},
                    {ok, update(Role, Label, Quest, ProgressId, NewP)}
            end;
        _ -> ok
    end;
event(#evt_animal_chess_win{}, Role, Label, QuestId,
      ProgressId, _Target, Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_animal_chess_soldier{}, Role, Label, QuestId,
      ProgressId, _Target, Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_animal_chess_fail{}, Role, Label, QuestId,
      ProgressId, _Target, Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_animal_chess_coach_killed{}, Role, Label,
      QuestId, ProgressId, _Target, Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_animal_chess_kill_coach{}, Role, Label,
      QuestId, ProgressId, _Target, Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_animal_chess_kill_soldier{}, Role, Label,
      QuestId, ProgressId, _Target, Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_guild_siege_combat{star = AddStar}, Role,
      Label, QuestId, ProgressId, _Target, [star]) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + AddStar >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0,
                                    value = Value + AddStar},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_guild_siege_combat{is_win = IsWin}, Role,
      Label, QuestId, ProgressId, _Target, [win]) ->
    case IsWin of
        1 ->
            case fetch(Role, Label, QuestId, ProgressId) of
                {error, role} -> {ok, Role};
                {error, _} -> remove;
                {ok, _Quest, #quest_progress{finish = Finish}}
                    when Finish =/= 0 ->
                    remove;
                {ok,
                 Quest,
                 P = #quest_progress{target_val = TargetVal,
                                     value = Value, param = Param}}
                    when Value + 1 >= TargetVal ->
                    RemoveRole = plot_quest:remove_task_unit(Role, Param),
                    Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
                    NewP = P#quest_progress{finish = 1, value = TargetVal,
                                            trigger = undefined},
                    {remove, update(Role1, Label, Quest, ProgressId, NewP)};
                {ok, Quest, P = #quest_progress{value = Value}} ->
                    NewP = P#quest_progress{finish = 0, value = Value + 1},
                    {ok, update(Role, Label, Quest, ProgressId, NewP)}
            end;
        _ -> ok
    end;
event(#evt_talisman{},
      Role = #role{m_talisman =
                       #m_talisman{plan_1 = Plan1, plan_2 = Plan2}},
      Label, QuestId, ProgressId, _Target, [num]) ->
    Max = max(length(Plan1), length(Plan2)),
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             param = Param}}
            when Max >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = OldVal}}
            when Max > OldVal ->
            NewP = P#quest_progress{finish = 0, value = Max},
            {ok, update(Role, Label, Quest, ProgressId, NewP)};
        _ -> ok
    end;
event(#evt_talisman{}, Role, Label, QuestId, ProgressId,
      _Target, _) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_dragon_boat{camp_id = CampId1}, Role, Label,
      QuestId, ProgressId, _Target, [{camp_id, CampId2}]) ->
    case CampId1 =:= CampId2 of
        true ->
            case fetch(Role, Label, QuestId, ProgressId) of
                {error, role} -> {ok, Role};
                {error, _} -> remove;
                {ok, _Quest, #quest_progress{finish = Finish}}
                    when Finish =/= 0 ->
                    remove;
                {ok,
                 Quest,
                 P = #quest_progress{target_val = TargetVal,
                                     value = Value, param = Param}}
                    when Value + 1 >= TargetVal ->
                    RemoveRole = plot_quest:remove_task_unit(Role, Param),
                    Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
                    NewP = P#quest_progress{finish = 1, value = TargetVal,
                                            trigger = undefined},
                    {remove, update(Role1, Label, Quest, ProgressId, NewP)};
                {ok, Quest, P = #quest_progress{value = Value}} ->
                    NewP = P#quest_progress{finish = 0, value = Value + 1},
                    {ok, update(Role, Label, Quest, ProgressId, NewP)}
            end;
        _ -> ok
    end;
event(#evt_dragon_boat_rank{camp_id = CampId1,
                            rank = Rank},
      Role, Label, QuestId, ProgressId, Target,
      [{camp_id, CampId2}]) ->
    case CampId1 =:= CampId2 andalso Rank =< Target of
        true ->
            case fetch(Role, Label, QuestId, ProgressId) of
                {error, role} -> {ok, Role};
                {error, _} -> remove;
                {ok, _Quest, #quest_progress{finish = Finish}}
                    when Finish =/= 0 ->
                    remove;
                {ok,
                 Quest,
                 P = #quest_progress{target_val = TargetVal,
                                     value = Value, param = Param}}
                    when Value + 1 >= TargetVal ->
                    RemoveRole = plot_quest:remove_task_unit(Role, Param),
                    Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
                    NewP = P#quest_progress{finish = 1, value = TargetVal,
                                            trigger = undefined},
                    {remove, update(Role1, Label, Quest, ProgressId, NewP)};
                {ok, Quest, P = #quest_progress{value = Value}} ->
                    NewP = P#quest_progress{finish = 0, value = Value + 1},
                    {ok, update(Role, Label, Quest, ProgressId, NewP)}
            end;
        _ -> ok
    end;
event(#evt_dragon_boat_cplt{camp_id = CampId1,
                            time_span = UseTime},
      Role, Label, QuestId, ProgressId, Target,
      [{camp_id, CampId2}]) ->
    case CampId1 =:= CampId2 andalso UseTime =< Target of
        true ->
            case fetch(Role, Label, QuestId, ProgressId) of
                {error, role} -> {ok, Role};
                {error, _} -> remove;
                {ok, _Quest, #quest_progress{finish = Finish}}
                    when Finish =/= 0 ->
                    remove;
                {ok,
                 Quest,
                 P = #quest_progress{target_val = TargetVal,
                                     param = Param}}
                    when 1 >= TargetVal ->
                    RemoveRole = plot_quest:remove_task_unit(Role, Param),
                    Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
                    NewP = P#quest_progress{finish = 1, value = TargetVal,
                                            trigger = undefined},
                    {remove, update(Role1, Label, Quest, ProgressId, NewP)};
                {ok, Quest, P = #quest_progress{value = OldVal}}
                    when 1 > OldVal ->
                    NewP = P#quest_progress{finish = 0, value = 1},
                    {ok, update(Role, Label, Quest, ProgressId, NewP)};
                _ -> ok
            end;
        _ -> ok
    end;
event(#evt_mount_dye_diff{val = Val, dye_id = DyeID1},
      Role, Label, QuestId, ProgressId, _Target,
      [{dye_id, DyeID2}]) ->
    case DyeID1 =:= DyeID2 of
        true ->
            case fetch(Role, Label, QuestId, ProgressId) of
                {error, role} -> {ok, Role};
                {error, _} -> remove;
                {ok, _Quest, #quest_progress{finish = Finish}}
                    when Finish =/= 0 ->
                    remove;
                {ok,
                 Quest,
                 P = #quest_progress{target_val = TargetVal,
                                     param = Param}}
                    when Val >= TargetVal ->
                    RemoveRole = plot_quest:remove_task_unit(Role, Param),
                    Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
                    NewP = P#quest_progress{finish = 1, value = TargetVal,
                                            trigger = undefined},
                    {remove, update(Role1, Label, Quest, ProgressId, NewP)};
                {ok, Quest, P = #quest_progress{value = OldVal}}
                    when Val > OldVal ->
                    NewP = P#quest_progress{finish = 0, value = Val},
                    {ok, update(Role, Label, Quest, ProgressId, NewP)};
                _ -> ok
            end;
        _ -> ok
    end;
event(#evt_pay{gold = Target}, Role, Label, QuestId,
      ProgressId, Target, []) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             param = Param}}
            when 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = OldVal}}
            when 1 > OldVal ->
            NewP = P#quest_progress{finish = 0, value = 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)};
        _ -> ok
    end;
event(#evt_pay{gold = Gold}, Role, Label, QuestId,
      ProgressId, _Target, []) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + Gold >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0,
                                    value = Value + Gold},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_loss_gold{val = Val}, Role, Label, QuestId,
      ProgressId, _Target, []) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + Val >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0,
                                    value = Value + Val},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_loss_gold_bind{val = Val}, Role, Label,
      QuestId, ProgressId, _Target, []) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + Val >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0,
                                    value = Value + Val},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_question_match_answer{is_right = Target},
      Role, Label, QuestId, ProgressId, Target, []) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_question_match_answer{}, _Role, _Label,
      _QuestId, _ProgressId, _Target, []) ->
    ok;
event(#evt_question_match_mvp{}, Role, Label, QuestId,
      ProgressId, _Target, []) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_question_match_last_right{count = Target},
      Role, Label, QuestId, ProgressId, Target, []) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_question_match_last_right{}, _Role, _Label,
      _QuestId, _ProgressId, _Target, []) ->
    ok;
event(#evt_spirit_treasure_offer_star{star = Star},
      Role, Label, QuestId, ProgressId, Target, []) ->
    logger:debug("~w=============~w",
                 [Star, Target],
                 quest_progress,
                 2369),
    case Star >= Target of
        true ->
            case fetch(Role, Label, QuestId, ProgressId) of
                {error, role} -> {ok, Role};
                {error, _} -> remove;
                {ok, _Quest, #quest_progress{finish = Finish}}
                    when Finish =/= 0 ->
                    remove;
                {ok,
                 Quest,
                 P = #quest_progress{target_val = TargetVal,
                                     value = Value, param = Param}}
                    when Value + 1 >= TargetVal ->
                    RemoveRole = plot_quest:remove_task_unit(Role, Param),
                    Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
                    NewP = P#quest_progress{finish = 1, value = TargetVal,
                                            trigger = undefined},
                    {remove, update(Role1, Label, Quest, ProgressId, NewP)};
                {ok, Quest, P = #quest_progress{value = Value}} ->
                    NewP = P#quest_progress{finish = 0, value = Value + 1},
                    {ok, update(Role, Label, Quest, ProgressId, NewP)}
            end;
        _ -> ok
    end;
event(#evt_spirit_treasure_first_kill{}, Role, Label,
      QuestId, ProgressId, _Target, []) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_spirit_treasure_boss_wave{wave = Wave}, Role,
      Label, QuestId, ProgressId, Target, []) ->
    case Wave >= Target of
        true ->
            case fetch(Role, Label, QuestId, ProgressId) of
                {error, role} -> {ok, Role};
                {error, _} -> remove;
                {ok, _Quest, #quest_progress{finish = Finish}}
                    when Finish =/= 0 ->
                    remove;
                {ok,
                 Quest,
                 P = #quest_progress{target_val = TargetVal,
                                     value = Value, param = Param}}
                    when Value + 1 >= TargetVal ->
                    RemoveRole = plot_quest:remove_task_unit(Role, Param),
                    Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
                    NewP = P#quest_progress{finish = 1, value = TargetVal,
                                            trigger = undefined},
                    {remove, update(Role1, Label, Quest, ProgressId, NewP)};
                {ok, Quest, P = #quest_progress{value = Value}} ->
                    NewP = P#quest_progress{finish = 0, value = Value + 1},
                    {ok, update(Role, Label, Quest, ProgressId, NewP)}
            end;
        _ -> ok
    end;
event(#evt_oracle_treasure_offer_star{star = Star},
      Role, Label, QuestId, ProgressId, Target, []) ->
    case Star >= Target of
        true ->
            case fetch(Role, Label, QuestId, ProgressId) of
                {error, role} -> {ok, Role};
                {error, _} -> remove;
                {ok, _Quest, #quest_progress{finish = Finish}}
                    when Finish =/= 0 ->
                    remove;
                {ok,
                 Quest,
                 P = #quest_progress{target_val = TargetVal,
                                     value = Value, param = Param}}
                    when Value + 1 >= TargetVal ->
                    RemoveRole = plot_quest:remove_task_unit(Role, Param),
                    Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
                    NewP = P#quest_progress{finish = 1, value = TargetVal,
                                            trigger = undefined},
                    {remove, update(Role1, Label, Quest, ProgressId, NewP)};
                {ok, Quest, P = #quest_progress{value = Value}} ->
                    NewP = P#quest_progress{finish = 0, value = Value + 1},
                    {ok, update(Role, Label, Quest, ProgressId, NewP)}
            end;
        _ -> ok
    end;
event(#evt_oracle_treasure_first_kill{}, Role, Label,
      QuestId, ProgressId, _Target, []) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_oracle_treasure_boss_wave{wave = Wave}, Role,
      Label, QuestId, ProgressId, Target, []) ->
    case Wave >= Target of
        true ->
            case fetch(Role, Label, QuestId, ProgressId) of
                {error, role} -> {ok, Role};
                {error, _} -> remove;
                {ok, _Quest, #quest_progress{finish = Finish}}
                    when Finish =/= 0 ->
                    remove;
                {ok,
                 Quest,
                 P = #quest_progress{target_val = TargetVal,
                                     value = Value, param = Param}}
                    when Value + 1 >= TargetVal ->
                    RemoveRole = plot_quest:remove_task_unit(Role, Param),
                    Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
                    NewP = P#quest_progress{finish = 1, value = TargetVal,
                                            trigger = undefined},
                    {remove, update(Role1, Label, Quest, ProgressId, NewP)};
                {ok, Quest, P = #quest_progress{value = Value}} ->
                    NewP = P#quest_progress{finish = 0, value = Value + 1},
                    {ok, update(Role, Label, Quest, ProgressId, NewP)}
            end;
        _ -> ok
    end;
event(#evt_oracle_treasure_boss_times{times = Times},
      Role, Label, QuestId, ProgressId, _Target, []) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             param = Param}}
            when Times >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = OldVal}}
            when Times > OldVal ->
            NewP = P#quest_progress{finish = 0, value = Times},
            {ok, update(Role, Label, Quest, ProgressId, NewP)};
        _ -> ok
    end;
event(#evt_expression{}, Role, Label, QuestId,
      ProgressId, _Target, []) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_fuse_expression{cost_item_id = Target}, Role,
      Label, QuestId, ProgressId, Target, []) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             param = Param}}
            when 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = OldVal}}
            when 1 > OldVal ->
            NewP = P#quest_progress{finish = 0, value = 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)};
        _ -> ok
    end;
event(#evt_fuse_expression{}, _Role, _Label, _QuestId,
      _ProgressId, _Target, []) ->
    ok;
event(#evt_guild_dragon_times{times = Times}, Role,
      Label, QuestId, ProgressId, _Target, []) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             param = Param}}
            when Times >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = OldVal}}
            when Times > OldVal ->
            NewP = P#quest_progress{finish = 0, value = Times},
            {ok, update(Role, Label, Quest, ProgressId, NewP)};
        _ -> ok
    end;
event(#evt_guild_dragon_rank{rank = RankIndex}, Role,
      Label, QuestId, ProgressId, _Target, [{rank, Rank}]) ->
    case Rank >= RankIndex of
        true ->
            case fetch(Role, Label, QuestId, ProgressId) of
                {error, role} -> {ok, Role};
                {error, _} -> remove;
                {ok, _Quest, #quest_progress{finish = Finish}}
                    when Finish =/= 0 ->
                    remove;
                {ok,
                 Quest,
                 P = #quest_progress{target_val = TargetVal,
                                     value = Value, param = Param}}
                    when Value + 1 >= TargetVal ->
                    RemoveRole = plot_quest:remove_task_unit(Role, Param),
                    Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
                    NewP = P#quest_progress{finish = 1, value = TargetVal,
                                            trigger = undefined},
                    {remove, update(Role1, Label, Quest, ProgressId, NewP)};
                {ok, Quest, P = #quest_progress{value = Value}} ->
                    NewP = P#quest_progress{finish = 0, value = Value + 1},
                    {ok, update(Role, Label, Quest, ProgressId, NewP)}
            end;
        _ -> ok
    end;
event(#evt_guild_dragon_total_point{point = Point},
      Role, Label, QuestId, ProgressId, _Target, []) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             param = Param}}
            when Point >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = OldVal}}
            when Point > OldVal ->
            NewP = P#quest_progress{finish = 0, value = Point},
            {ok, update(Role, Label, Quest, ProgressId, NewP)};
        _ -> ok
    end;
event(#evt_chat_guild{}, Role, Label, QuestId,
      ProgressId, _Target, []) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_chat{channel = Target, content = Content},
      Role, Label, QuestId, ProgressId, Target,
      [KeyWordsList]) ->
    case util:text_banned(Content, KeyWordsList) of
        true ->
            case fetch(Role, Label, QuestId, ProgressId) of
                {error, role} -> {ok, Role};
                {error, _} -> remove;
                {ok, _Quest, #quest_progress{finish = Finish}}
                    when Finish =/= 0 ->
                    remove;
                {ok,
                 Quest,
                 P = #quest_progress{target_val = TargetVal,
                                     value = Value, param = Param}}
                    when Value + 1 >= TargetVal ->
                    RemoveRole = plot_quest:remove_task_unit(Role, Param),
                    Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
                    NewP = P#quest_progress{finish = 1, value = TargetVal,
                                            trigger = undefined},
                    {remove, update(Role1, Label, Quest, ProgressId, NewP)};
                {ok, Quest, P = #quest_progress{value = Value}} ->
                    NewP = P#quest_progress{finish = 0, value = Value + 1},
                    {ok, update(Role, Label, Quest, ProgressId, NewP)}
            end;
        false when KeyWordsList =:= [] ->
            case fetch(Role, Label, QuestId, ProgressId) of
                {error, role} -> {ok, Role};
                {error, _} -> remove;
                {ok, _Quest, #quest_progress{finish = Finish}}
                    when Finish =/= 0 ->
                    remove;
                {ok,
                 Quest,
                 P = #quest_progress{target_val = TargetVal,
                                     value = Value, param = Param}}
                    when Value + 1 >= TargetVal ->
                    RemoveRole = plot_quest:remove_task_unit(Role, Param),
                    Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
                    NewP = P#quest_progress{finish = 1, value = TargetVal,
                                            trigger = undefined},
                    {remove, update(Role1, Label, Quest, ProgressId, NewP)};
                {ok, Quest, P = #quest_progress{value = Value}} ->
                    NewP = P#quest_progress{finish = 0, value = Value + 1},
                    {ok, update(Role, Label, Quest, ProgressId, NewP)}
            end;
        _ -> ok
    end;
event(_Evt = #evt_chat{}, _Role, _Label, _QuestId,
      _ProgressId, _Target, _Param) ->
    ok;
event(#evt_exquisite_shelf_wave{wave = Target}, Role,
      Label, QuestId, ProgressId, Target, []) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_exquisite_shelf_wave{}, _Role, _Label,
      _QuestId, _ProgressId, _Target, []) ->
    ok;
event(#evt_exquisite_shelf_help{}, Role, Label, QuestId,
      ProgressId, _Target, []) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_kingbadge{base_id = Target}, Role, Label,
      QuestId, ProgressId, Target, []) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_kingbadge{}, _Role, _Label, _QuestId,
      _ProgressId, _, _Param) ->
    ok;
event(#evt_sprog_mount{}, Role, Label, QuestId,
      ProgressId, _Target, []) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_gods_duel_score{score = Score}, Role, Label,
      QuestId, ProgressId, _Target, []) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             param = Param}}
            when Score >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = OldVal}}
            when Score > OldVal ->
            NewP = P#quest_progress{finish = 0, value = Score},
            {ok, update(Role, Label, Quest, ProgressId, NewP)};
        _ -> ok
    end;
event(#evt_rushing_top_final_times{final_times =
                                       FinalTimes},
      Role, Label, QuestId, ProgressId, _Target, []) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             param = Param}}
            when FinalTimes >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = OldVal}}
            when FinalTimes > OldVal ->
            NewP = P#quest_progress{finish = 0, value = FinalTimes},
            {ok, update(Role, Label, Quest, ProgressId, NewP)};
        _ -> ok
    end;
event(#evt_provocation_times{}, Role, Label, QuestId,
      ProgressId, _Target, []) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_provocation_duel_win{}, Role, Label, QuestId,
      ProgressId, _Target, []) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_provocation_use_horn{}, Role, Label, QuestId,
      ProgressId, _Target, []) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_provocation_5v5{}, Role, Label, QuestId,
      ProgressId, _Target, []) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_provocation_duel_5v5_win{}, Role, Label,
      QuestId, ProgressId, _Target, []) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_black_white_chess_win{}, Role, Label,
      QuestId, ProgressId, _Target, []) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_black_white_chess_lose{}, Role, Label,
      QuestId, ProgressId, _Target, []) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_black_white_chess_change_in_round{change_num
                                                 = ChangeNum},
      Role, Label, QuestId, ProgressId, Target, []) ->
    case ChangeNum >= Target of
        true ->
            case fetch(Role, Label, QuestId, ProgressId) of
                {error, role} -> {ok, Role};
                {error, _} -> remove;
                {ok, _Quest, #quest_progress{finish = Finish}}
                    when Finish =/= 0 ->
                    remove;
                {ok,
                 Quest,
                 P = #quest_progress{target_val = TargetVal,
                                     param = Param}}
                    when 1 >= TargetVal ->
                    RemoveRole = plot_quest:remove_task_unit(Role, Param),
                    Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
                    NewP = P#quest_progress{finish = 1, value = TargetVal,
                                            trigger = undefined},
                    {remove, update(Role1, Label, Quest, ProgressId, NewP)};
                {ok, Quest, P = #quest_progress{value = OldVal}}
                    when 1 > OldVal ->
                    NewP = P#quest_progress{finish = 0, value = 1},
                    {ok, update(Role, Label, Quest, ProgressId, NewP)};
                _ -> ok
            end;
        _ -> ok
    end;
event(#evt_black_white_chess_more_than_ops_chess{num =
                                                     Num},
      Role, Label, QuestId, ProgressId, Target, []) ->
    case Num >= Target of
        true ->
            logger:debug("完成领先成就，领先棋子数:~w",
                         [Target],
                         quest_progress,
                         2523),
            case fetch(Role, Label, QuestId, ProgressId) of
                {error, role} -> {ok, Role};
                {error, _} -> remove;
                {ok, _Quest, #quest_progress{finish = Finish}}
                    when Finish =/= 0 ->
                    remove;
                {ok,
                 Quest,
                 P = #quest_progress{target_val = TargetVal,
                                     param = Param}}
                    when 1 >= TargetVal ->
                    RemoveRole = plot_quest:remove_task_unit(Role, Param),
                    Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
                    NewP = P#quest_progress{finish = 1, value = TargetVal,
                                            trigger = undefined},
                    {remove, update(Role1, Label, Quest, ProgressId, NewP)};
                {ok, Quest, P = #quest_progress{value = OldVal}}
                    when 1 > OldVal ->
                    NewP = P#quest_progress{finish = 0, value = 1},
                    {ok, update(Role, Label, Quest, ProgressId, NewP)};
                _ -> ok
            end;
        _ -> ok
    end;
event(#evt_black_white_chess_draw_whitout_ask_draw{},
      Role, Label, QuestId, ProgressId, _Target, []) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_black_white_chess_win_remain_one_color{},
      Role, Label, QuestId, ProgressId, _Target, []) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_black_white_chess_lose_remain_one_color{},
      Role, Label, QuestId, ProgressId, _Target, []) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_canyon_summit_join{}, Role, Label, QuestId,
      ProgressId, _Target, []) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_canyon_summit_cannon{}, Role, Label, QuestId,
      ProgressId, _Target, []) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_canyon_summit_win{}, Role, Label, QuestId,
      ProgressId, _Target, []) ->
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_truth_dare_join{}, Role, Label, QuestId,
      ProgressId, _Target, []) ->
    logger:debug("真心话大冒险参与", [], quest_progress, 2550),
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_truth_dare_lucky{}, Role, Label, QuestId,
      ProgressId, _Target, []) ->
    logger:debug("真心话大冒险成为幸运儿", [], quest_progress, 2554),
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_truth_dare_two_fail{}, Role, Label, QuestId,
      ProgressId, _Target, []) ->
    logger:debug("真心话大冒险两次不通过", [], quest_progress, 2558),
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_truth_dare_one_shot{}, Role, Label, QuestId,
      ProgressId, _Target, []) ->
    logger:debug("真心话大冒险一次猜对", [], quest_progress, 2562),
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = Finish}}
            when Finish =/= 0 ->
            remove;
        {ok,
         Quest,
         P = #quest_progress{target_val = TargetVal,
                             value = Value, param = Param}}
            when Value + 1 >= TargetVal ->
            RemoveRole = plot_quest:remove_task_unit(Role, Param),
            Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
            NewP = P#quest_progress{finish = 1, value = TargetVal,
                                    trigger = undefined},
            {remove, update(Role1, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}} ->
            NewP = P#quest_progress{finish = 0, value = Value + 1},
            {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_truth_dare_lucky_choose{type = Type}, Role,
      Label, QuestId, ProgressId, Target, []) ->
    case Type =:= Target of
        true ->
            logger:debug("真心话大冒险幸运儿选择类型：[type]:~w，[target]:~w",
                         [Type, Target],
                         quest_progress,
                         2568),
            case fetch(Role, Label, QuestId, ProgressId) of
                {error, role} -> {ok, Role};
                {error, _} -> remove;
                {ok, _Quest, #quest_progress{finish = Finish}}
                    when Finish =/= 0 ->
                    remove;
                {ok,
                 Quest,
                 P = #quest_progress{target_val = TargetVal,
                                     value = Value, param = Param}}
                    when Value + 1 >= TargetVal ->
                    RemoveRole = plot_quest:remove_task_unit(Role, Param),
                    Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
                    NewP = P#quest_progress{finish = 1, value = TargetVal,
                                            trigger = undefined},
                    {remove, update(Role1, Label, Quest, ProgressId, NewP)};
                {ok, Quest, P = #quest_progress{value = Value}} ->
                    NewP = P#quest_progress{finish = 0, value = Value + 1},
                    {ok, update(Role, Label, Quest, ProgressId, NewP)}
            end;
        _ -> ok
    end;
event(#evt_truth_dare_end{type = Type}, Role, Label,
      QuestId, ProgressId, Target, []) ->
    case Type =:= Target of
        true ->
            logger:debug("真心话大冒险结算类型：[type]:~w， [target]:~w",
                         [Type, Target],
                         quest_progress,
                         2577),
            case fetch(Role, Label, QuestId, ProgressId) of
                {error, role} -> {ok, Role};
                {error, _} -> remove;
                {ok, _Quest, #quest_progress{finish = Finish}}
                    when Finish =/= 0 ->
                    remove;
                {ok,
                 Quest,
                 P = #quest_progress{target_val = TargetVal,
                                     value = Value, param = Param}}
                    when Value + 1 >= TargetVal ->
                    RemoveRole = plot_quest:remove_task_unit(Role, Param),
                    Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
                    NewP = P#quest_progress{finish = 1, value = TargetVal,
                                            trigger = undefined},
                    {remove, update(Role1, Label, Quest, ProgressId, NewP)};
                {ok, Quest, P = #quest_progress{value = Value}} ->
                    NewP = P#quest_progress{finish = 0, value = Value + 1},
                    {ok, update(Role, Label, Quest, ProgressId, NewP)}
            end;
        _ -> ok
    end;
event(Evt, _Role, _Label, QuestId, _ProgressId, Target,
      Param) ->
    logger:error("任务[~w ~w]收到无法处理的进度事件 [Evt]: ~w [Target]:~w "
                 "[Param]: ~w",
                 [_Label, QuestId, Evt, Target, Param],
                 quest_progress,
                 2584),
    remove.

monitor_event(#evt_del_item{base_id = Target,
                            num = DelNum},
              Role = #role{p_bag = Bag}, Label, QuestId, ProgressId,
              Target, _Param, TriRef) ->
    {_, BagNum} = package:count(by_base_id, Target, Bag),
    NewNum = erlang:max(BagNum + 1 - DelNum, 0),
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = 0}} ->
            NewRole = role_trigger:del(TriRef, Role),
            {remove, NewRole};
        {ok, Quest, P = #quest_progress{target_val = TargetVal}}
            when NewNum < TargetVal ->
            FalseP = P#quest_progress{finish = 0, value = NewNum},
            RemoveRole = role_trigger:del(TriRef, Role),
            {[NewP], NewRole} = quest:load_progress([FalseP],
                                                    Label,
                                                    QuestId,
                                                    [],
                                                    RemoveRole),
            {remove,
             update(NewRole, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}}
            when NewNum >= Value ->
            NewP = P#quest_progress{value = NewNum},
            {ok, update(Role, Label, Quest, ProgressId, NewP)};
        _ -> ok
    end;
monitor_event(#evt_del_item{}, _Role, _Label, _QuestId,
              _ProgressId, _Target, _Param, _TriRef) ->
    ok;
monitor_event(#evt_del_pet{base_id = Target,
                           num = DelNum},
              Role = #role{m_pet = #m_pet{pets = Pets}}, Label,
              QuestId, ProgressId, Target, _Param, TriRef) ->
    PetNum = length([Pet
                     || Pet = #pet{genre = 3, lev = 1, status = 0,
                                   base_id = BaseId}
                            <- Pets,
                        BaseId =:= Target]),
    NewNum = erlang:max(PetNum + 1 - DelNum, 0),
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = 0}} ->
            NewRole = role_trigger:del(TriRef, Role),
            {remove, NewRole};
        {ok, Quest, P = #quest_progress{target_val = TargetVal}}
            when NewNum < TargetVal ->
            FalseP = P#quest_progress{finish = 0, value = NewNum},
            RemoveRole = role_trigger:del(TriRef, Role),
            {[NewP], NewRole} = quest:load_progress([FalseP],
                                                    Label,
                                                    QuestId,
                                                    [],
                                                    RemoveRole),
            {remove,
             update(NewRole, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}}
            when NewNum >= Value ->
            NewP = P#quest_progress{value = NewNum},
            {ok, update(Role, Label, Quest, ProgressId, NewP)};
        _ -> ok
    end;
monitor_event(#evt_del_pet{}, _Role, _Label, _QuestId,
              _ProgressId, _Target, _Param, _TriRef) ->
    ok;
monitor_event(#evt_pet_war{base_id = Target},
              Role = #role{m_pet = #m_pet{pets = Pets}}, Label,
              QuestId, ProgressId, Target, _Param, TriRef) ->
    PetNum = length([Pet
                     || Pet = #pet{genre = 3, lev = 1, status = 0,
                                   base_id = BaseId}
                            <- Pets,
                        BaseId =:= Target]),
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = 0}} ->
            NewRole = role_trigger:del(TriRef, Role),
            {remove, NewRole};
        {ok, Quest, P = #quest_progress{target_val = TargetVal}}
            when PetNum < TargetVal ->
            FalseP = P#quest_progress{finish = 0, value = PetNum},
            RemoveRole = role_trigger:del(TriRef, Role),
            {[NewP], NewRole} = quest:load_progress([FalseP],
                                                    Label,
                                                    QuestId,
                                                    [],
                                                    RemoveRole),
            {remove,
             update(NewRole, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}}
            when PetNum >= Value ->
            NewP = P#quest_progress{value = PetNum},
            {ok, update(Role, Label, Quest, ProgressId, NewP)};
        _ -> ok
    end;
monitor_event(#evt_pet_war{}, _Role, _Label, _QuestId,
              _ProgressId, _Target, _Param, _TriRef) ->
    ok;
monitor_event(#evt_pet_rest{base_id = Target},
              Role = #role{m_pet = #m_pet{pets = Pets}}, Label,
              QuestId, ProgressId, Target, _Param, TriRef) ->
    PetNum = length([Pet
                     || Pet = #pet{genre = 3, lev = 1, status = 0,
                                   base_id = BaseId}
                            <- Pets,
                        BaseId =:= Target]),
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = 0}} ->
            NewRole = role_trigger:del(TriRef, Role),
            {remove, NewRole};
        {ok, Quest, P = #quest_progress{target_val = TargetVal}}
            when PetNum < TargetVal ->
            FalseP = P#quest_progress{finish = 0, value = PetNum},
            RemoveRole = role_trigger:del(TriRef, Role),
            {[NewP], NewRole} = quest:load_progress([FalseP],
                                                    Label,
                                                    QuestId,
                                                    [],
                                                    RemoveRole),
            {remove,
             update(NewRole, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}}
            when PetNum >= Value ->
            NewP = P#quest_progress{value = PetNum},
            {ok, update(Role, Label, Quest, ProgressId, NewP)};
        _ -> ok
    end;
monitor_event(#evt_pet_rest{}, _Role, _Label, _QuestId,
              _ProgressId, _Target, _Param, _TriRef) ->
    ok;
monitor_event(#evt_aptitude_pet{base_id = Target},
              Role = #role{m_pet = #m_pet{pets = Pets}}, Label,
              QuestId, ProgressId, Target, _Param, TriRef) ->
    PetNum = length([Pet
                     || Pet = #pet{genre = 3, lev = 1, status = 0,
                                   base_id = BaseId}
                            <- Pets,
                        BaseId =:= Target]),
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = 0}} ->
            NewRole = role_trigger:del(TriRef, Role),
            {remove, NewRole};
        {ok, Quest, P = #quest_progress{target_val = TargetVal}}
            when PetNum < TargetVal ->
            FalseP = P#quest_progress{finish = 0, value = PetNum},
            RemoveRole = role_trigger:del(TriRef, Role),
            {[NewP], NewRole} = quest:load_progress([FalseP],
                                                    Label,
                                                    QuestId,
                                                    [],
                                                    RemoveRole),
            {remove,
             update(NewRole, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}}
            when PetNum >= Value ->
            NewP = P#quest_progress{value = PetNum},
            {ok, update(Role, Label, Quest, ProgressId, NewP)};
        _ -> ok
    end;
monitor_event(#evt_aptitude_pet{}, _Role, _Label,
              _QuestId, _ProgressId, _Target, _Param, _TriRef) ->
    ok;
monitor_event(#evt_levup_pet{base_id = Target},
              Role = #role{m_pet = #m_pet{pets = Pets}}, Label,
              QuestId, ProgressId, Target, _Param, TriRef) ->
    PetNum = length([Pet
                     || Pet = #pet{genre = 3, lev = 1, status = 0,
                                   base_id = BaseId}
                            <- Pets,
                        BaseId =:= Target]),
    case fetch(Role, Label, QuestId, ProgressId) of
        {error, role} -> {ok, Role};
        {error, _} -> remove;
        {ok, _Quest, #quest_progress{finish = 0}} ->
            NewRole = role_trigger:del(TriRef, Role),
            {remove, NewRole};
        {ok, Quest, P = #quest_progress{target_val = TargetVal}}
            when PetNum < TargetVal ->
            FalseP = P#quest_progress{finish = 0, value = PetNum},
            RemoveRole = role_trigger:del(TriRef, Role),
            {[NewP], NewRole} = quest:load_progress([FalseP],
                                                    Label,
                                                    QuestId,
                                                    [],
                                                    RemoveRole),
            {remove,
             update(NewRole, Label, Quest, ProgressId, NewP)};
        {ok, Quest, P = #quest_progress{value = Value}}
            when PetNum >= Value ->
            NewP = P#quest_progress{value = PetNum},
            {ok, update(Role, Label, Quest, ProgressId, NewP)};
        _ -> ok
    end;
monitor_event(#evt_levup_pet{}, _Role, _Label, _QuestId,
              _ProgressId, _Target, _Param, _TriRef) ->
    ok;
monitor_event(Evt, Role, Label, QuestId, _ProgressId,
              Target, Param, TriRef) ->
    NewRole = role_trigger:del(TriRef, Role),
    logger:error("任务[~w ~w]收到无法处理的进度监听事件 [Evt]: ~w [Target]:~w "
                 "[Param]: ~w",
                 [Label, QuestId, Evt, Target, Param],
                 quest_progress,
                 2639),
    {remove, NewRole}.

remove_monitor(#evt_commit_quest{id = QId}, Role, QId,
               TriRefs) ->
    NewRole = role_trigger:del(TriRefs, Role),
    {remove, NewRole};
remove_monitor(_Evt, _Role, _QId, _TriRef) -> ok.

monitor_quest_prog(QuestType,
                   P = #quest_progress{label = EvtLabel, param = Param},
                   #quest{id = QId}, Role = #role{}) ->
    case lists:keyfind(monitor, 1, Param) of
        Data when is_tuple(Data) ->
            do_monitor_quest_prog(QuestType,
                                  EvtLabel,
                                  P,
                                  QId,
                                  Role);
        false -> Role
    end;
monitor_quest_prog(QuestType,
                   P = #quest_progress{label = EvtLabel, param = Param},
                   QId, Role = #role{}) ->
    case lists:keyfind(monitor, 1, Param) of
        Data when is_tuple(Data) ->
            do_monitor_quest_prog(QuestType,
                                  EvtLabel,
                                  P,
                                  QId,
                                  Role);
        false -> Role
    end.

do_monitor_quest_prog(TypeLabel, evt_get_item,
                      #quest_progress{id = ProgId, target = Target,
                                      param = Param},
                      QId, Role = #role{trigger = {NextId, _Triggers}}) ->
    TriRef1 = {evt_commit_quest, NextId},
    TriRef2 = {evt_del_item, NextId + 1},
    {TriRef1, Role1} = role_trigger:add(#trigger{label =
                                                     evt_commit_quest,
                                                 m = quest_progress,
                                                 f = remove_monitor,
                                                 a = [QId, TriRef2]},
                                        Role),
    {TriRef2, Role2} = role_trigger:add(#trigger{label =
                                                     evt_del_item,
                                                 m = quest_progress,
                                                 f = monitor_event,
                                                 a =
                                                     [TypeLabel,
                                                      QId,
                                                      ProgId,
                                                      Target,
                                                      Param,
                                                      TriRef1]},
                                        Role1),
    Role2;
do_monitor_quest_prog(TypeLabel, evt_get_pet,
                      #quest_progress{id = ProgId, target = Target,
                                      param = Param},
                      QId, Role = #role{trigger = {NextId, _Triggers}}) ->
    TriRef0 = {evt_commit_quest, NextId},
    TriRef1 = {evt_del_pet, NextId + 1},
    TriRef2 = {evt_pet_war, NextId + 2},
    TriRef3 = {evt_pet_rest, NextId + 3},
    TriRef4 = {evt_aptitude_pet, NextId + 4},
    TriRef5 = {evt_pet_levup, NextId + 5},
    {TriRef0, Role1} = role_trigger:add(#trigger{label =
                                                     evt_commit_quest,
                                                 m = quest_progress,
                                                 f = remove_monitor,
                                                 a =
                                                     [QId,
                                                      [TriRef1,
                                                       TriRef2,
                                                       TriRef3,
                                                       TriRef4,
                                                       TriRef5]]},
                                        Role),
    {TriRef1, Role2} = role_trigger:add(#trigger{label =
                                                     evt_del_pet,
                                                 m = quest_progress,
                                                 f = monitor_event,
                                                 a =
                                                     [TypeLabel,
                                                      QId,
                                                      ProgId,
                                                      Target,
                                                      Param,
                                                      [TriRef0,
                                                       TriRef2,
                                                       TriRef3,
                                                       TriRef4,
                                                       TriRef5]]},
                                        Role1),
    {TriRef2, Role3} = role_trigger:add(#trigger{label =
                                                     evt_pet_war,
                                                 m = quest_progress,
                                                 f = monitor_event,
                                                 a =
                                                     [TypeLabel,
                                                      QId,
                                                      ProgId,
                                                      Target,
                                                      Param,
                                                      [TriRef0,
                                                       TriRef1,
                                                       TriRef3,
                                                       TriRef4,
                                                       TriRef5]]},
                                        Role2),
    {TriRef3, Role4} = role_trigger:add(#trigger{label =
                                                     evt_pet_rest,
                                                 m = quest_progress,
                                                 f = monitor_event,
                                                 a =
                                                     [TypeLabel,
                                                      QId,
                                                      ProgId,
                                                      Target,
                                                      Param,
                                                      [TriRef0,
                                                       TriRef1,
                                                       TriRef2,
                                                       TriRef4,
                                                       TriRef5]]},
                                        Role3),
    {TriRef4, Role5} = role_trigger:add(#trigger{label =
                                                     evt_aptitude_pet,
                                                 m = quest_progress,
                                                 f = monitor_event,
                                                 a =
                                                     [TypeLabel,
                                                      QId,
                                                      ProgId,
                                                      Target,
                                                      Param,
                                                      [TriRef0,
                                                       TriRef1,
                                                       TriRef2,
                                                       TriRef3,
                                                       TriRef5]]},
                                        Role4),
    {TriRef5, Role6} = role_trigger:add(#trigger{label =
                                                     evt_pet_levup,
                                                 m = quest_progress,
                                                 f = monitor_event,
                                                 a =
                                                     [TypeLabel,
                                                      QId,
                                                      ProgId,
                                                      Target,
                                                      Param,
                                                      [TriRef0,
                                                       TriRef1,
                                                       TriRef2,
                                                       TriRef3,
                                                       TriRef4]]},
                                        Role5),
    NewRole = Role6,
    NewRole;
do_monitor_quest_prog(_QuestType, _EvtLabel, _P, _Q,
                      Role) ->
    logger:error("未知任务进度监控事件[~w][~w]",
                 [{_QuestType, _EvtLabel}, _Q],
                 quest_progress,
                 2704),
    Role.

