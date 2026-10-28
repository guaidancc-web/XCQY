-file("src/mod/quest/quest.erl", 1).

-module(quest).

-export([login/1,
         set_check_timer/1,
         time_check/2,
         lev_up/2,
         accept/2,
         force_accept/2,
         callback_accept/3,
         callback_accept/4,
         callback_commit/3,
         finish/2,
         finish_line/2,
         commit/2,
         force_commit/2,
         giveup/2,
         flush/2,
         zero_flush/1,
         load_quest/4,
         load_progress/5,
         accept_handle/3,
         accept_handle/4,
         accept_handle_by_id/4,
         commit_handle/4,
         commit_no_reward/2,
         push_dynamic_rewards/2,
         check_collect/2,
         get_id_by_sectype/3,
         check_finish/2,
         init/0,
         del_quest/2,
         push_stats/1,
         push_stats/2,
         check_join_team/1,
         sync_quest_talk/3,
         team_leave_clean/1,
         team_kickout_clean/2,
         handle_auto_finished/2,
         apply_del_quest/2,
         del_sec_type/2,
         can_enter_temple/1,
         push_guide/1,
         reward_guide/2,
         quest_state/2]).

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

-file("src/mod/quest/quest.erl", 53).

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

-file("src/mod/quest/quest.erl", 54).

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

-file("src/mod/quest/quest.erl", 55).

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

-file("src/mod/quest/quest.erl", 56).

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

-file("src/mod/quest/quest.erl", 57).

-file("inc/condition.hrl", 1).

-record(condition,
        {label :: undefined | atom(),
         op = eq ::
             ue | eq | lt | gt | le | ge | range | include,
         val :: undefined | term(),
         msg = "" :: list()}).

-file("src/mod/quest/quest.erl", 58).

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

-file("src/mod/quest/quest.erl", 59).

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

-file("src/mod/quest/quest.erl", 60).

-file("inc/link.hrl", 1).

-record(link,
        {socket :: undefined | port(),
         conn_pid :: undefined | pid(),
         ip = {0, 0, 0, 0} :: {0..255, 0..255, 0..255, 0..255},
         port = 0 :: non_neg_integer(),
         lag = 0 :: non_neg_integer()}).

-file("src/mod/quest/quest.erl", 61).

-file("inc/log.hrl", 1).

-file("src/mod/quest/quest.erl", 62).

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

-file("src/mod/quest/quest.erl", 63).

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

-file("src/mod/quest/quest.erl", 64).

-file("inc/package.hrl", 1).

-record(package,
        {type = 1 :: integer(),
         next_id = 1 :: pos_integer(),
         volume = 0 :: non_neg_integer(),
         free_cell = [] :: list(),
         items = [] :: [tuple()]}).

-file("src/mod/quest/quest.erl", 65).

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

-file("src/mod/quest/quest.erl", 66).

-file("inc/combat.hrl", 1).

-record(combat,
        {type :: undefined | non_neg_integer(),
         pid :: undefined | pid(),
         result :: undefined | integer(),
         round = 1 :: non_neg_integer(),
         start_args :: undefined | tuple(),
         observers = [],
         winner = [],
         loser = [],
         atk_formation = 1,
         atk_formation_lev = 1,
         dfd_formation = 1,
         dfd_formation_lev = 1,
         waiting_join = [],
         cur_plot = 0,
         waiting_next_wave = [] :: [tuple()],
         all_waiting_next_wave = [],
         ts,
         start_time = 0 :: non_neg_integer(),
         t_play = 0 :: integer(),
         t_idle = 500 :: integer(),
         assign_gains = [],
         ratio_val = 0,
         start_failed_reason :: undefined | atom()}).

-record(fighter,
        {id = 0 :: non_neg_integer(),
         pid = 0 :: non_neg_integer() | pid(),
         type = 1,
         name = "",
         group = 0,
         classes = 0,
         sex = 0,
         face_id = 0,
         hp = 0,
         mp = 0,
         hp_max = 0,
         tmp_hp_max = 0,
         mp_max = 0,
         lev = 0,
         looks = [],
         is_die = 0,
         is_die_disappear = 0,
         is_escape = 0,
         is_defence = 0,
         is_radiance = 0,
         is_leader = 0,
         self_preside_status = 0,
         self_preside_text = "",
         target_preside_status = 0,
         target_preside_text = "",
         rid = 0,
         platform = "",
         zone_id = 0,
         origin_id,
         base_id = 0 :: non_neg_integer(),
         lover,
         res_id = 0,
         active_skills = [],
         passive_skills = [],
         halo_skills = [],
         has_use_item = 0,
         buffs = [],
         buff_infos = [],
         skill_cooldown = [],
         skill_infos = [],
         pet_skill_infos = [],
         child_skill_infos = [],
         last_skill = 0,
         attr,
         combat_init_attr,
         combat_dynamic_attr,
         pet_attr,
         m_init,
         action_num = 0,
         formation = 1,
         formation_lev = 1,
         pos = 0,
         order = 0,
         combat_statistics,
         result = 3,
         is_ai_action = 0,
         pre_action,
         action,
         talk = "",
         special_status,
         special_attr,
         s_event = 0,
         s_event_pid,
         active_pet,
         backup_pets = [],
         active_child,
         backup_childs = [],
         has_summon_pet = 0,
         active_guard = [],
         team_guard = [],
         is_hosted = 0,
         is_ready = 0,
         is_auto = 0,
         is_double_point = 0,
         plot = {id, [], []},
         max_catch_num = 0,
         catched = [],
         learn_skills = [],
         m_dungeon,
         anti_heal = 0,
         anger = 0,
         skill_prac_atk = 0,
         skill_prac_phy_def = 0,
         skill_prac_magic_def = 0,
         m_lev_break,
         sworn_id,
         dun_args,
         ext_args = [],
         talisman = [],
         master_pid = 0,
         master_fid = 0,
         master_pos = 0,
         combat_talk = [],
         guard_pid = 0,
         guard_fid = 0,
         guard_pos = 0,
         cost_mp_ratio = 1000,
         slave = [],
         unit_type = 0,
         ratio_val = 0,
         unit_fun_type = 0,
         ai_id = 0,
         ai = {[], []},
         ext = [],
         skill_plan = [],
         hook_index = 1,
         force_is_auto = 0}).

-record(combat_start_args,
        {common_referee :: undefined | pid(),
         other_referees = [] :: [{atom(), pid()}],
         ext_args = [] :: [{atom(), term()}],
         max_guard = 4}).

-record(combat_over_calc_data,
        {fighter :: undefined | tuple(),
         combat_result :: undefined | non_neg_integer(),
         rewards = [] :: [tuple()],
         record :: undefined | tuple()}).

-record(c_observer,
        {role_id = {0, "", 0} ::
             {non_neg_integer(), list(), non_neg_integer()},
         pid :: undefined | pid(),
         name = "" :: list(),
         group = 0}).

-record(m_combat,
        {ver = 3 :: pos_integer(),
         pid :: undefined | pid(),
         observe_pid :: undefined | pid(),
         is_debug = 0 :: 0..1,
         ext = [] :: [tuple()],
         self_preside = [],
         target_preside = [],
         combat_type = 0}).

-record(m_combat_init,
        {skills = [] ::
             [{non_neg_integer(), non_neg_integer()}],
         talents = [],
         wing_skills = [],
         eff_skills = [],
         guard_skills = []}).

-record(fighter_wrap,
        {fighter,
         combat_pid = 0,
         s_event,
         m_team,
         status,
         s_action,
         pos :: undefined | tuple(),
         combat_type = 0}).

-record(c_item,
        {item_id,
         base_id :: undefined | non_neg_integer(),
         step = 0,
         target_type :: undefined | non_neg_integer(),
         skill_id = 0,
         skill_lev = 0,
         script_id :: undefined | non_neg_integer(),
         script_args = [] :: [integer()],
         buff_self = [],
         buff_target = [],
         anti_heal = 0,
         can_effect = 0,
         action :: undefined | function()}).

-record(c_skill,
        {id = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         passive_type = [] :: non_neg_integer(),
         act_flag = undefined,
         type_flag = undefined,
         use_type = {live, live},
         special_type = [],
         skill :: undefined | tuple(),
         action_no = 1 :: non_neg_integer(),
         target_no = 1 :: non_neg_integer(),
         keep_kill_num = 0 :: non_neg_integer(),
         action :: undefined | {atom(), list()},
         ext_args = [] :: [{atom(), non_neg_integer()}],
         trigger_before = [] ::
             [{{atom(), atom()}, [integer()]}],
         trigger_after = [] :: [{{atom(), atom()}, [integer()]}],
         reduce_dmg = 1000,
         reduce_heal = 1000,
         action_msg = "",
         pursue_attack = 0,
         pursue_skill_attack = 0,
         passive_args,
         variety_base}).

-record(c_buff_base,
        {id,
         eff_type = buff :: buff | debuff,
         type = 1,
         max_layer = 1,
         script_id = 0}).

-record(c_buff,
        {id :: undefined | non_neg_integer(),
         type,
         sec_type,
         layer = 1,
         script_id,
         caster_id :: undefined | non_neg_integer(),
         action_num = 0 :: non_neg_integer(),
         eff_type = buff :: buff | debuff,
         eff_sec_type = normal :: normal | control,
         hit_rate = 1000 :: non_neg_integer(),
         can_dispel = 1 :: 0..1,
         visible = 1 :: 0..1,
         time_unit = 0 :: non_neg_integer(),
         duration = 0 :: non_neg_integer(),
         duration_left = 0 :: non_neg_integer(),
         period = 1 :: non_neg_integer(),
         args = [],
         eff_val_before :: undefined | function(),
         eff_val_after :: undefined | function(),
         eff_before :: undefined | function(),
         eff :: undefined | function(),
         recalc :: undefined | function(),
         eff_after :: undefined | function(),
         compare :: undefined | function(),
         tips_calc :: undefined | function(),
         hit :: undefined | function(),
         can_eff :: undefined | function(),
         die_eff = 0,
         halo_eff_fighter_type = [] :: list()}).

-record(combat_statistics,
        {total_hurt = 0 :: non_neg_integer(),
         total_dmg = 0 :: non_neg_integer(),
         round_dmg = 0 :: non_neg_integer(),
         max_dmg = 0 :: non_neg_integer(),
         revive = 0,
         pet_revive = 0,
         cast_pet = 0,
         guard = [],
         has_use_item = 0,
         total_heal = 0,
         control_num = 0,
         dispel_num = 0,
         is_die = 0,
         kill_group = 0,
         killed_group = 0,
         kill_group_pet = 0,
         kill_group_target = 0,
         killed_group_target = 0,
         kill_group_target_pet = 0,
         child_skills = [],
         die_times = 0,
         skill_use_times = [],
         after_die_done = 0,
         auto_round = []}).

-record(combat_context,
        {type :: undefined | non_neg_integer(),
         start_time = 0 :: integer(),
         round = 0,
         pos_num = 0 :: integer(),
         origin_atk = [],
         origin_dfd = [],
         playing = [],
         self_side = [],
         op_side = [],
         skill_cooldown = [],
         all_waiting_next_wave = [] :: [list()],
         passive_attack = [] :: [],
         passive_skill_attack = [],
         pursue_attack = false,
         pursue_skill_attack = false,
         pursue_attack_list = [],
         revive_self = [],
         nirvana_list = [],
         ghost_list = [],
         revive_list = [],
         kill_by_self_list = [],
         avatar_list = [],
         mate_suck_list = [],
         skill_hurt = false :: true | false,
         skill_pursue_crit = false :: true | false,
         kill_someone = false :: true | false,
         skill_crit = false :: true | false,
         skill_dmg = 0,
         action_dmg = 0,
         multi_pursue_num = 0,
         link_hurt = [],
         is_passive_attack = false,
         revive_count = 0,
         is_skill_range = false,
         fisrt_target_id = 0,
         round_die = [],
         common_cooldown = []}).

-record(passive_effect,
        {atk_addt = 0 :: non_neg_integer(),
         atk_ratio = 0 :: non_neg_integer(),
         atk_holy_addt = 0 :: non_neg_integer(),
         buff_holy_addt = 0,
         atk_holy_ratio = 0 :: non_neg_integer(),
         dmg_addt = 0 :: non_neg_integer(),
         phy_dmg_dec = 0,
         magic_dmg_dec = 0,
         dmg_ext = 0,
         dmg_ratio = 0 :: non_neg_integer(),
         dmg_ratio_add = 0,
         def_ratio = 0 :: non_neg_integer(),
         hurt_multi = 0,
         suck_hp = 0,
         kill_suck_hp = 0,
         stone_suck_hp,
         suck_mp = 0,
         suck_mp_loss = 0,
         suck_mp_max = 0,
         master_suck_hp,
         feedback = 0,
         heal_ratio = 0,
         anti_skill,
         def_anti = 0,
         crit_ratio = 0,
         hit_ratio = 0,
         dec_def_ratio = 0,
         dec_phy_def = 0,
         dec_magic_def = 0,
         dec_phy_def_ratio = 0,
         dec_magic_def_ratio = 0,
         float_dmg = 0,
         ghost_atk = 0,
         phy_dmg_ratio = 0,
         defence = 0,
         magic_dmg_ratio = 0,
         revive_self_atk = 0,
         dec_dmg_flag = 0,
         self_val_changed = [],
         self_changed = [],
         target_val_changed = [],
         target_changed = [],
         buff_self_to_self = [] :: [tuple()],
         buff_self_to_target = [] :: [tuple()],
         buff_target_to_self = [] :: [tuple()],
         buff_target_to_target = [] :: [tuple()],
         del_target_buff = [],
         show_passive_skills = [] ::
             [{non_neg_integer(),
               non_neg_integer(),
               non_neg_integer()}],
         talents = [],
         pet_effect = [],
         conflict_list = [],
         ext_args = [],
         flag = 0,
         injury_ratio = 0,
         tar_ignore_die_ratio = 0,
         target_def_add_buff = [],
         phy_crit_extra_dmg = 0,
         mag_crit_extra_dmg = 0}).

-record(combat_init_attr,
        {dmg_ratio = 0,
         hurt_ratio = 0,
         magic_hurt_ratio = 0,
         crit_dmg_ratio = 0,
         crit_hurt_ratio = 0,
         heal_ratio = 0 :: non_neg_integer(),
         eff_heal_ratio = 0 :: non_neg_integer(),
         item_effect_ratio = 0,
         eff_item_effect_ratio = 0,
         can_be_crit = 1,
         anti_poison = 0,
         phy_dmg_ratio = 0,
         magic_dmg_ratio = 0,
         def_anger_ratio = 0,
         use_anger_ratio = 1000,
         debuff_buff_expire_ratio = {0, 0, 0},
         dec_ghost_ratio = 0,
         heal_crit_ratio = 0,
         eff_revive_ratio = 0,
         eff_heal_val = 0,
         add_chaos_ratio = 0,
         sworn_protect,
         anti_crit_ratio = 0,
         atk_not_anger = 0,
         hit_ratio = 0,
         phy_crit_extra_dmg = 0,
         mag_crit_extra_dmg = 0}).

-record(combat_dynamic_attr,
        {dmg_ratio = 0,
         hurt_ratio = 0,
         phy_hurt_ratio = 0,
         magic_hurt_ratio = 0,
         phy_final_hurt_ratio = 0,
         magic_final_hurt_ratio = 0,
         crit_dmg_ratio = 0,
         crit_hurt_ratio = 0,
         buff_reduce_dmg = 0,
         heal_ratio = 0 :: non_neg_integer(),
         eff_heal_ratio = 0 :: non_neg_integer(),
         eff_heal_val = 0,
         feedback = 0,
         reduce_dmg = 0,
         stone_reduce_dmg = 0,
         accuracy = 0,
         phy_accuracy = 0,
         magic_accuracy = 0,
         evasion = 0,
         phy_evasion = 0,
         magic_evasion = 0,
         phy_dmg_ratio = 0,
         magic_dmg_ratio = 0,
         can_attack_stealth = 0,
         buff_reduce_dmg_max = 0,
         mirror_feedback_rate = 0}).

-record(special_attr,
        {absorb_shield = 0,
         absorb_shield_type = 0,
         absorb_order = 0,
         absorb_shield_suck = 0,
         absorb_dmg = 0,
         magic_absorb_dmg = 0,
         model_order = 0,
         immunity = 0,
         has_immunity = 0,
         pre_action,
         next_action_stay = 0,
         reduce_self_phy_dmg = 0,
         reduce_phy_dmg = 0,
         anti_control_ratio = 0,
         can_feedback = 1,
         fixed_feedback = 0,
         can_anti_attack = 1,
         can_revive_self = 1,
         model_id = 0,
         model_val = 0,
         fixed_dmg = 0,
         anti_ratio = 0,
         anti_times = 0,
         anti_skill = base,
         anti_dmg_ratio = 0,
         protector = undefined,
         has_nirvana = 0,
         nirvaning = 0,
         has_ghost = 0,
         ghosting = 0,
         reviving = 0,
         has_revive_self = 0,
         anti_trial = 0,
         can_attack_stealth = 0,
         control_num = 0,
         has_fearless = 0,
         add_phy_layer = 0,
         last_dispel_phy_dmg_ratio = 0,
         last_eva_phy_dmg_ratio = 0,
         round_add_magic_dmg = 0,
         sleep_layer = 0,
         stone_layer = 0,
         is_sworn_protect = 0,
         is_sworn_heal = 0,
         chaos_ratio = 300,
         round_hurt = 0,
         dec_dmg,
         multi_atk_num = 0,
         has_multi_atk = 0,
         assist_atk_ratio = 0,
         assist_atk_skill = base,
         assist_atk_hurt_ratio = 1000,
         suck_hp = 0,
         suck_times = 1,
         rebound_times = 0,
         rebound_dmg_ratio = 0,
         trap_owener = 0,
         trap_buff = [],
         trap_ratio = 0,
         be_dmg_mp_times = 0,
         flush_pet_times = 0,
         save_life_times = 0,
         elem_dmg_absorb = 0,
         wheel_dmg = 0,
         wheel_skill = 0,
         be_attack_times = undefined,
         first_target_id = 0,
         rebound_type = 1,
         iron_body_times = 0,
         hp_link = 0}).

-record(special_status,
        {is_weakness = 0,
         is_seal = 0,
         is_silent = 0 :: 0..1,
         is_rest = 0,
         is_stealth = 0,
         cannot_use_skill = 0,
         is_taunt = 0 :: 0..1,
         is_chaos = 0,
         chaos_skill = 0,
         is_stun = 0,
         is_sleep = 0,
         is_stone = 0,
         is_anti_heal = 0,
         can_crit = 1,
         cannot_revive = 0,
         taunt_pid = undefined,
         soul_link = undefined,
         buff_revive_self = undefined,
         lover_revive_self = undefined,
         dec_taunt_dmg_ratio = 0,
         can_use_anger_skill = 1,
         bleed = 0,
         energy = 0,
         modify_script = [],
         is_tempt = 0,
         tempt_ratio = 0,
         tempt_dmg = 0,
         be_attack_skills = []}).

-record(buff_play,
        {order = 0 :: non_neg_integer(),
         sub_order = 0 :: non_neg_integer(),
         action_type :: undefined | non_neg_integer(),
         buff_id :: undefined | non_neg_integer(),
         layer = 1 :: pos_integer(),
         time_unit = 1 :: non_neg_integer(),
         duration = 0 :: non_neg_integer(),
         duration_left = 0 :: non_neg_integer(),
         is_hit = 1 :: 0..1,
         can_dispel = 1 :: 0..1,
         caster_id = 0 :: non_neg_integer(),
         target_id = 0 :: non_neg_integer(),
         skill_fid = 0 :: non_neg_integer(),
         target_changes = [] :: [{non_neg_integer(), integer()}],
         is_target_die = 0 :: 0..1,
         is_target_die_disappear = 0 :: 0..1,
         tips_args = [] :: [integer()]}).

-record(summon_play,
        {order = 0 :: non_neg_integer(),
         sub_order = 0 :: non_neg_integer(),
         summon_type :: undefined | non_neg_integer(),
         summoner_id :: undefined | non_neg_integer(),
         summons = [] :: [tuple()]}).

-record(skill_play,
        {order = 0 :: non_neg_integer(),
         sub_order = 0 :: non_neg_integer(),
         action_type :: undefined | non_neg_integer(),
         skill_id = 0 :: non_neg_integer(),
         skill_lev = 1 :: non_neg_integer(),
         attack_type :: undefined | non_neg_integer(),
         self_id = 0 :: non_neg_integer(),
         self_type = 0,
         self_classes = 0,
         self_origin_id = 0,
         self_res_id = 0,
         target_id = 0 :: non_neg_integer(),
         self_changes = [] :: [{non_neg_integer(), integer()}],
         target_changes = [] :: [{non_neg_integer(), integer()}],
         show_passive_skills = [] ::
             [{non_neg_integer(),
               non_neg_integer(),
               non_neg_integer()}],
         is_hit = 1 :: 0..1,
         is_defence = 0 :: 0..1,
         is_crit = 0 :: 0..1,
         is_self_die = 0 :: 0..1,
         is_self_die_disappear = 0 :: 0..1,
         is_target_die = 0 :: 0..1,
         is_target_die_disappear = 0 :: 0..1,
         talk = "" :: list(),
         action_msg = ""}).

-record(c_pet,
        {id = 0,
         ver = 6,
         base_id = 0,
         can_summon = 1,
         status = 0,
         name = "",
         lev = 0,
         looks = [],
         skills = [],
         hp = 1,
         mp = 1,
         attr,
         combat_talk = [],
         talent = 0,
         pet_attr,
         grade = 0,
         skill_plan = [],
         is_first = 0}).

-record(c_guard,
        {base_id = 0,
         war_id = 0,
         name = "",
         classes = 0,
         skills = [],
         attr,
         looks = []}).

-record(c_child,
        {id = 0,
         origin_id,
         ver = 1,
         base_id = 0,
         grade = 0,
         status = 0,
         can_summon = 1,
         name = "",
         classes = 0,
         lev = 0,
         looks = [],
         skills = [],
         hp = 1,
         mp = 1,
         attr,
         combat_talk = [],
         hungry = 0}).

-record(c_skill_addt_arg,
        {self_val_changed = [] :: [{atom(), integer()}],
         self_changed = [] :: [{non_neg_integer(), integer()}],
         target_val_changed = [] :: [{atom(), integer()}],
         target_changed = [] :: [{non_neg_integer(), integer()}],
         self_buff = [] :: [tuple()],
         target_buff = [] :: [tuple()],
         show_passive_skills = [] :: [tuple()],
         ext_args,
         skip_exec = 0,
         passive_flag,
         conflict_list = []}).

-record(action_effect,
        {can_crit = 1,
         can_feedback = 1,
         can_protect = 1,
         heal_hp = 0,
         can_anti_heal = 0,
         crit_flag = 0,
         holy_addt = 0,
         suck_hp = 0,
         mate_suck_hp = undefined,
         dec_def_ratio = 0,
         dec_magic_def_ratio = 0,
         default_atk = undefined,
         direct_dmg = undefined,
         calc_def = 0,
         hurt_multi = 1000,
         act_dmg = 0,
         hit_ratio = 0,
         crit_ratio = 0,
         crit_dmg_ratio = 0,
         act_dmg_ratio = 0,
         target_val_changes = [],
         target_changes = [],
         suck_buff,
         crit_suck_hp = 0,
         dmg_buff = [],
         injury_ratio = 0,
         extern_dmg = 0,
         act_hurt_multi = 0,
         alice_suck_max = 0}).

-record(combat_record_chat_mgr,
        {id = {0, "", 0},
         name = "",
         classes = 0,
         sex = 0,
         lev = 0,
         break_times = 0,
         msg = "",
         report_cnt = 0}).

-record(combat_record,
        {id,
         type = 1,
         ver = 10,
         atk_name = "",
         dfd_name = "",
         combat_type = 0,
         time = 0,
         frames = [],
         cited = 0,
         likes = [],
         liked = 0,
         replayed = 0,
         round = 0,
         fighters = [],
         avg_lev = 0,
         shared = 0,
         atk_sex = 0,
         atk_classes = 0,
         dfd_sex = 0,
         dfd_classes = 0,
         screen_msg = []}).

-record(combat_record_role,
        {id = {0, "", 0}, recent = [], collection = []}).

-record(combat_record_marvelous,
        {id, combat_type = 0, time = 0}).

-record(combat_record_hot,
        {id,
         combat_type = 0,
         replayed = 0,
         shared = 0,
         liked = 0,
         time = 0}).

-record(combat_record_fighter,
        {id = {0, "", 0},
         name = "",
         classes = 0,
         sex = 0,
         lev = 0,
         group = 0}).

-file("src/mod/quest/quest.erl", 67).

-file("inc/quest_classes.hrl", 1).

-record(quest_classes_rand_data,
        {id, type, weight, max, in_round = []}).

-record(quest_classes_patrol_data,
        {id,
         map_base_id,
         unit_list = [],
         weight = 0,
         pcnt = 0,
         min_move_step = 0,
         max_move_step = 0}).

-record(quest_classes_item_data,
        {id = 0, role_lev = 0, weight = 0, type = 0}).

-file("src/mod/quest/quest.erl", 68).

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

-file("src/mod/quest/quest.erl", 69).

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

-file("src/mod/quest/quest.erl", 70).

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

-file("src/mod/quest/quest.erl", 71).

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

-file("src/mod/quest/quest.erl", 72).

-file("inc/camp_cake.hrl", 1).

-record(m_camp_cake,
        {round = 0,
         quest_id = 0,
         pre_quest_id = 0,
         quest_flag = 0,
         step_finish = 0,
         step = 0,
         step_flag = 0,
         step_info = [],
         sub_quest_flag = 0,
         reward = []}).

-record(camp_cake_step,
        {key = {0, 0}, type = 0, id = 0, statues = 0}).

-record(camp_cake_role,
        {id = {0, "", 0},
         lev = 0,
         start_time = 0,
         end_time = 0}).

-record(camp_cake_data,
        {round = 0,
         quest = 0,
         next_quest = 0,
         step = [],
         step_info = [],
         sub_quest_info = [],
         reward = [],
         exp_mode = 0,
         exp_radio = 0,
         extra_reward = [],
         extra_exp_mod = 0,
         extra_exp_radio = 0,
         extra_reward_fail = [],
         extra_exp_mod_fail = 0,
         extra_exp_radio_fail = 0,
         buff = []}).

-record(camp_cake_reward_data,
        {key = 0,
         id = 0,
         is_add = 0,
         is_succ = 0,
         ratio = 0,
         reward = [],
         reward2 = [],
         exp_mode = 0,
         exp_radio = 0}).

-file("src/mod/quest/quest.erl", 73).

-file("inc/map.hrl", 1).

-record(map,
        {id = 1 :: pos_integer(),
         platform = "" :: list(),
         zone_id = 0 :: non_neg_integer(),
         base_id = 1 :: pos_integer(),
         res_id = 0 :: non_neg_integer(),
         pid :: undefined | pid(),
         ctrl_pid :: undefined | pid(),
         grid_info = [] :: [{pid(), pos_integer()}],
         name = "" :: bitstring(),
         condition = [] :: list(),
         num = 0 :: non_neg_integer(),
         width = 1 :: pos_integer(),
         height = 1 :: pos_integer()}).

-record(map_grid,
        {map_pid :: undefined | pid(),
         map_id = 1 :: pos_integer(),
         base_id = 1 :: pos_integer(),
         width = 1 :: pos_integer(),
         height = 1 :: pos_integer()}).

-record(map_data,
        {id = 1 :: pos_integer(),
         name = "" :: list(),
         condition = [] :: [tuple()],
         revive = [] :: [tuple()],
         width = 1 :: pos_integer(),
         height = 1 :: pos_integer(),
         grid_x = 0 :: pos_integer(),
         grid_y = 0 :: pos_integer(),
         max_pre_layer = 60 :: pos_integer(),
         startup = 0 :: 0..1,
         is_single = 0 :: 0..1}).

-file("src/mod/quest/quest.erl", 74).

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

-file("src/mod/quest/quest.erl", 75).

-type accept_steps() :: check_distance |
                        condition |
                        loss |
                        accept |
                        fire.

-export_type([accept_steps/0]).

-export([gm_lookup_quest/2]).

gm_lookup_quest(0,
                #role{m_quest = #m_quest{quest = Quests}}) ->
    Ids = [Id || #quest{id = Id} <- Quests],
    util:flist("已接任务列表:~w", [lists:reverse(Ids)]);
gm_lookup_quest(1,
                #role{m_quest = #m_quest{acceptable = Acceptable}}) ->
    util:flist("可接任务列表:~w", [Acceptable]);
gm_lookup_quest(2,
                #role{m_quest = #m_quest{finished = Finished}}) ->
    util:flist("已完成任务列表:~w", [Finished]);
gm_lookup_quest(3,
                #role{m_quest =
                          #m_quest{quest_offer =
                                       #quest_offer{day_count = DayCount,
                                                    leader_count = LCount,
                                                    round = Round,
                                                    leader_quest_count =
                                                        LeaderQuestCount}}}) ->
    util:flist("悬赏任务， 每日计数：~w, 每日队长次数：~w, 完成队长任务次数：~w, "
               "环数：~w",
               [DayCount, LCount, LeaderQuestCount, Round]);
gm_lookup_quest(4,
                #role{m_quest =
                          #m_quest{quest_classes =
                                       #quest_classes{round = Round,
                                                      ring = Ring}}}) ->
    util:flist("职业任务， 环数：~w, 轮数:~w", [Ring, Round]);
gm_lookup_quest(5,
                #role{m_quest =
                          #m_quest{quest_prac =
                                       #quest_prac{part = Part,
                                                   chapter = Chapter,
                                                   section = Section}}}) ->
    util:flist("主线任务， 篇：~w, 章：~w, 节：~w",
               [Part, Chapter, Section]);
gm_lookup_quest(10, #role{id = Rid}) ->
    quest_kill:gm_lookup_quest(Rid);
gm_lookup_quest(QuestId,
                #role{m_quest = #m_quest{quest = Quests}})
    when is_integer(QuestId) ->
    case lists:keyfind(QuestId, #quest.id, Quests) of
        Quest = #quest{name = Name, finish = Finish,
                       progress = Progress} ->
            IsFinished = case Finish of
                             1 -> "已完成";
                             _ -> "未完成"
                         end,
            ProgStatus = [util:flist("{进度Id：~w, 是否完成：~w}",
                                     [ProgId, ProgFinish])
                          || #quest_progress{id = ProgId, finish = ProgFinish}
                                 <- Progress],
            util:flist("id：~w, 名称：~ts, 完成状态：~ts， 进度状态：~ts~n服务端数据：~w",
                       [QuestId,
                        Name,
                        IsFinished,
                        string:join(ProgStatus, ","),
                        Quest]);
        _ -> util:flist("未知的已接任务Id:~w", [QuestId])
    end;
gm_lookup_quest(_, _) -> "未知任务类型".

init() -> #m_quest{}.

-spec login(#role{}) -> {ok, #role{}}.

login(Role) ->
    Role1 = #role{m_quest = #m_quest{quest = Quests}} =
                quest_revise:do(Role),
    {_Tid, Role2} = role_trigger:add([#trigger{label =
                                                   evt_levup,
                                               m = quest, f = lev_up, a = []},
                                      #trigger{label = evt_lev_break, m = quest,
                                               f = lev_up, a = []}],
                                     Role1),
    {NewQuests, NewRole = #role{m_quest = Mquest}} =
        load_quest(Quests, [], quest, Role2),
    set_check_timer(NewQuests),
    {ok,
     flush(NewRole#role{m_quest =
                            Mquest#m_quest{quest = NewQuests}},
           not_push)}.

push_guide(Role) ->
    GList = var:get_var(Role, other, 2081, []),
    sys_conn:pack_send(10248, {GList}).

reward_guide(Role = #role{m_quest =
                              #m_quest{finished = Finished}},
             Id) ->
    GList = var:get_var(Role, other, 2081, []),
    case lists:member(Id, GList) of
        true -> {false, lang:get("该奖励已经领过")};
        false ->
            QList = quest_data:sec_list(13),
            case [QId
                  || {QId, Lev} <- QList, util:ceil((Lev + 1) / 10) == Id]
                of
                [] -> {false, lang:get("该等级没有指引任务")};
                QL ->
                    DelList = guild_del(Role,
                                        QL,
                                        [world_lev, quest_lev],
                                        []),
                    case (QL -- DelList) -- Finished of
                        [] ->
                            Rewards = quest_data:reward_guide(Id),
                            Gain = format:val_to_gain(Rewards),
                            case role_gain:do_notice(Gain,
                                                     Role,
                                                     lang:get("指引任务"))
                                of
                                {ok, NRole} ->
                                    NewRole = var:set_var(NRole,
                                                          other,
                                                          2081,
                                                          [Id | GList]),
                                    push_guide(NewRole),
                                    {ok, NewRole};
                                {false, _} -> {false, lang:get("背包空间不足")}
                            end;
                        _E ->
                            logger:debug("还有指引任务未完成：~w", [_E], quest, 161),
                            {false, lang:get("还有指引任务未完成")}
                    end
            end
    end.

quest_state(QuestID, Role) ->
    #role{m_quest =
              #m_quest{quest = DoingList, finished = FinishedList}} =
        Role,
    case lists:keymember(QuestID, #quest.id, DoingList) of
        true -> role:pack_send(Role, 10212, {QuestID, 1});
        _ ->
            case lists:member(QuestID, FinishedList) of
                true -> role:pack_send(Role, 10212, {QuestID, 2});
                _ -> role:pack_send(Role, 10212, {QuestID, 0})
            end
    end,
    ok.

guild_del(_Role, _QL, [], List) -> List;
guild_del(Role, _QL, [_Label = world_lev | T], List) ->
    {WorldLev, _} = world_lev:get_world_lev(Role),
    case WorldLev < 50 of
        true -> guild_del(Role, _QL, T, [41012 | List]);
        false -> guild_del(Role, _QL, T, List)
    end;
guild_del(Role = #role{lev = Lev}, QL,
          [_Label = quest_lev | T], List) ->
    Fun = fun (Id, Rtn) ->
                  case quest_data:get(Id) of
                      #quest_data{lev = QLev, max_lev = MLev} ->
                          case Lev =< QLev andalso Lev =< MLev of
                              true -> Rtn;
                              _ -> [Id | Rtn]
                          end
                  end
          end,
    QIds = lists:foldl(Fun, [], QL),
    guild_del(Role, QL, T, QIds ++ List);
guild_del(Role, QL, [_Label | T], List) ->
    guild_del(Role, QL, T, List).

-spec finish_line(#role{}, pos_integer()) -> {ok,
                                              #role{}} |
                                             {false, bitstring()}.

finish_line(Role = #role{m_quest =
                             Mquest = #m_quest{quest = Quests,
                                               finished = FinL}},
            Id) ->
    case quest_data:get(Id) of
        #quest_data{pre_quest = PreQ} ->
            case lists:member(Id, FinL) of
                true -> {ok, Role};
                _ ->
                    NewQuests = [#quest{id = Id} | lists:keydelete(Id,
                                                                   #quest.id,
                                                                   Quests)],
                    case force_commit(Id,
                                      Role#role{m_quest =
                                                    Mquest#m_quest{quest =
                                                                       NewQuests}})
                        of
                        {ok, NRole} when is_list(PreQ) andalso PreQ =/= [] ->
                            [PreId | _] = PreQ,
                            finish_line(NRole, PreId);
                        _ -> {ok, Role}
                    end
            end;
        _ -> {ok, Role}
    end.

-spec check_finish(#role{}, pos_integer()) -> true |
                                              false.

check_finish(#role{m_quest = #m_quest{finished = FinL}},
             Id) ->
    lists:member(Id, FinL).

reset_check_timer(Quests) ->
    erase(quest_check_timer),
    set_check_timer(Quests).

-spec set_check_timer(_) -> ok.

set_check_timer([I | T]) ->
    set_check_timer(I),
    set_check_timer(T);
set_check_timer(#quest{end_time = EndT}) ->
    set_check_timer(EndT);
set_check_timer(T) when is_integer(T) ->
    Now = date:unixtime(),
    case T > Now of
        true ->
            NextT = min(864000, T - Now),
            case get(quest_check_timer) of
                undefined ->
                    Ref = erlang:send_after(NextT * 1000,
                                            self(),
                                            {apply_async,
                                             {quest, time_check, [T]}}),
                    put(quest_check_timer, {T, Ref});
                {OldT, OldRef} when OldT > T ->
                    catch erlang:cancel_timer(OldRef),
                    Ref = erlang:send_after(NextT * 1000,
                                            self(),
                                            {apply_async,
                                             {quest, time_check, [T]}}),
                    put(quest_check_timer, {T, Ref});
                _ -> skip
            end;
        _ -> skip
    end;
set_check_timer(_T) -> ok.

time_check(Role = #role{m_quest =
                            #m_quest{quest = Quests}},
           T) ->
    case get(quest_check_timer) of
        {T, _Ref} ->
            erase(quest_check_timer),
            NRole = del_overdue(Quests, date:unixtime(), Role),
            {ok, flush(NRole, push)};
        _ -> ok
    end.

del_overdue([], _Now, Role) -> Role;
del_overdue([I | T], Now, Role) ->
    NRole = del_overdue(I, Now, Role),
    del_overdue(T, Now, NRole);
del_overdue(Q = #quest{end_time = EndT}, Now, Role)
    when EndT > 0 andalso Now >= EndT ->
    auto_del_quest(Q, Role);
del_overdue(_Q, _Now, Role) -> Role.

-spec get_id_by_sectype(#role{}, all | quest | accept,
                        pos_integer()) -> non_neg_integer().

get_id_by_sectype(#role{m_quest = #m_quest{quest = QL}},
                  quest, SecType) ->
    case lists:keyfind(SecType, #quest.sec_type, QL) of
        #quest{id = Id} -> Id;
        _ -> 0
    end;
get_id_by_sectype(#role{m_quest =
                            #m_quest{acceptable = AccL}},
                  accept, SecType) ->
    Fun = fun (Id, RetId) ->
                  case quest_data:get(Id) of
                      #quest_data{sec_type = SecType} -> Id;
                      _ -> RetId
                  end
          end,
    lists:foldl(Fun, 0, AccL);
get_id_by_sectype(Role, all, SecType) ->
    case get_id_by_sectype(Role, quest, SecType) of
        0 -> get_id_by_sectype(Role, accept, SecType);
        Id -> Id
    end.

-spec lev_up(tuple(), #role{}) -> {ok, #role{}}.

lev_up(Evt = #evt_levup{}, Role) ->
    Role1 = achievement:levup(Evt, Role),
    {ok, flush(Role1, push)};
lev_up(_Evt, Role) -> {ok, flush(Role, push)}.

-spec check_collect(#role{}, #unit{}) -> true |
                                         {false, bitstring()}.

check_collect(#role{m_quest = #m_quest{quest = L}},
              Unit) ->
    do_check_collect(L, Unit).

do_check_collect([], _Unit) ->
    {false, lang:get("你不需要该物品, 不能随便采集")};
do_check_collect([#quest{progress = Progs} | T],
                 Unit) ->
    do_check_collect(Progs ++ T, Unit);
do_check_collect([#quest_progress{label =
                                      evt_unit_click,
                                  target = BaseId, finish = 0}
                  | _],
                 #unit{base_id = BaseId}) ->
    true;
do_check_collect([_ | T], Unit) ->
    do_check_collect(T, Unit).

-spec push_dynamic_rewards(#role{},
                           all | pos_integer() | [pos_integer]) -> ok.

push_dynamic_rewards(Role = #role{m_quest =
                                      #m_quest{acceptable = Acceptable,
                                               quest = Quests}},
                     all) ->
    Ids = [Id || #quest{id = Id} <- Quests],
    push_dynamic_rewards(Role, Ids ++ Acceptable);
push_dynamic_rewards(Role, Ids) when is_list(Ids) ->
    case calc_dynamic_rewards(Ids, Role, []) of
        L = [_ | _] -> sys_conn:pack_send(10210, {L});
        _ -> ok
    end;
push_dynamic_rewards(_Role, 0) -> ok;
push_dynamic_rewards(Role, Id) ->
    push_dynamic_rewards(Role, [Id]).

-spec auto_accept(Ids, Role) -> {ok, Role} |
                                {error, Reason} |
                                false when Ids :: [pos_integer()] |
                                                  pos_integer(),
                                           Role :: #role{}, Reason :: string().

auto_accept(Id, Role) when is_integer(Id) ->
    case quest_data:get(Id) of
        Data = #quest_data{auto_accept = 1} ->
            logger:debug("===================:~w",
                         [Id],
                         quest,
                         347),
            dispatch_auto_accept(Data, Role);
        #quest_data{} -> {error, ""};
        Reason ->
            logger:error("任务[~w]在可接列表中，却无法找到该任务的配置数据: ~w",
                         [Id, Reason],
                         quest,
                         352),
            {error, Reason}
    end;
auto_accept([], Role) -> {ok, Role};
auto_accept([Id | T], Role) ->
    case auto_accept(Id, Role) of
        {ok, NRole} ->
            role:link_send(NRole, 10202, {1, "", Id}),
            auto_accept(T, NRole);
        {error, _Reason} -> auto_accept(T, Role)
    end.

-spec accept(QuestId :: pos_integer(), #role{}) -> {ok,
                                                    #role{}} |
                                                   {error,
                                                    Reason :: bitstring()}.

accept(QuestId,
       Role = #role{m_quest =
                        #m_quest{acceptable = Acceptable}}) ->
    case quest_data:get(QuestId) of
        {error, Reason} ->
            logger:error("任务[~w]在可接列表中，却无法找到该任务的配置数据: ~w",
                         [QuestId, Reason],
                         quest,
                         371),
            {error, lang:get("此任务不存在")};
        QuestData = #quest_data{auto_accept = AutoAccept} ->
            case lists:member(QuestId, Acceptable) of
                false when AutoAccept =:= 1 -> {error, ""};
                false -> {error, lang:get("此任务不在可接任务列表中")};
                true ->
                    accept_handle([check_distance,
                                   condition,
                                   loss,
                                   accept,
                                   fire],
                                  Role,
                                  QuestData,
                                  QuestId)
            end
    end.

-spec force_accept(QuestId :: pos_integer(),
                   #role{}) -> {ok, #role{}} |
                               {error, Reason :: bitstring()}.

force_accept(QuestId,
             Role = #role{m_quest =
                              #m_quest{acceptable = Acceptable}}) ->
    case lists:member(QuestId, Acceptable) of
        false -> {error, lang:get("此任务不在可接任务列表中")};
        true ->
            case quest_data:get(QuestId) of
                {error, Reason} ->
                    logger:error("任务[~w]在可接列表中，却无法找到该任务的配置数据: ~w",
                                 [QuestId, Reason],
                                 quest,
                                 392),
                    {error, lang:get("此任务不存在")};
                QuestData ->
                    accept_handle([accept, fire], Role, QuestData, QuestId)
            end
    end.

-spec callback_accept(Role, QuestId, Steps) -> ok |
                                               {ok, Role} when Role :: #role{},
                                                               QuestId ::
                                                                   pos_integer(),
                                                               Steps ::
                                                                   accept_steps().

callback_accept(Role, QuestId, Steps) ->
    callback_accept(Role, QuestId, Steps, []).

-spec callback_accept(Role, QuestId, Steps,
                      Args) -> ok | {ok, Role} when Role :: #role{},
                                                    QuestId :: pos_integer(),
                                                    Steps :: accept_steps(),
                                                    Args :: list().

callback_accept(Role, QuestId, Steps, Args) ->
    case quest_data:get(QuestId) of
        QuestData = #quest_data{} ->
            case accept_handle(Steps,
                               Role,
                               QuestData,
                               QuestId,
                               Args)
                of
                Rtn = {ok, _NewRole} -> Rtn;
                {error, _Err} ->
                    logger:debug("接受~w任务出错:~w",
                                 [QuestId, _Err],
                                 quest,
                                 421),
                    ok
            end;
        {error, Reason} ->
            logger:error("无法找到任务[~w]的配置数据: ~w",
                         [QuestId, Reason],
                         quest,
                         425),
            ok
    end.

-spec accept_handle([atom()], #role{},
                    QuestId :: pos_integer()) -> {ok, #role{}} |
                                                 {error, Reason :: bitstring()}.

accept_handle([], Role, _QuestId) -> {ok, Role};
accept_handle(Steps, Role, QuestId) ->
    case quest_data:get(QuestId) of
        QuestData = #quest_data{} ->
            case accept_handle(Steps, Role, QuestData, QuestId, [])
                of
                Rtn = {ok, _NewRole} -> Rtn;
                {error, Msg} -> {false, Msg}
            end;
        _Err ->
            logger:error("[~ts]无法找到任务[~w]的配置数据: ~w",
                         [Role#role.name, QuestId, _Err],
                         quest,
                         442),
            ok
    end.

-spec accept_handle_by_id([atom()], #role{},
                          QuestId :: pos_integer(),
                          Args :: term() | list()) -> {ok, #role{}} |
                                                      {error,
                                                       Reason :: bitstring()}.

accept_handle_by_id([], Role, _QuestId, _Args) ->
    {ok, Role};
accept_handle_by_id(Steps, Role, QuestId, Args) ->
    case quest_data:get(QuestId) of
        QuestData = #quest_data{} ->
            case accept_handle(Steps,
                               Role,
                               QuestData,
                               QuestId,
                               Args)
                of
                Rtn = {ok, _NewRole} -> Rtn;
                {error, Msg} -> {false, Msg}
            end;
        _Err ->
            logger:error("[~ts]无法找到任务[~w]的配置数据: ~w",
                         [Role#role.name, QuestId, _Err],
                         quest,
                         458),
            ok
    end.

-spec accept_handle([atom()], #role{}, #quest_data{},
                    _AccQuestId :: pos_integer()) -> {ok, #role{}} |
                                                     {error,
                                                      Reason :: bitstring()}.

accept_handle([], Role, _QuestData, _AccQuestId) ->
    logger:debug("===================:~w",
                 [_AccQuestId],
                 quest,
                 465),
    {ok, Role};
accept_handle(Steps, Role, QuestData, AccQuestId) ->
    accept_handle(Steps, Role, QuestData, AccQuestId, []).

-spec accept_handle([atom()], #role{}, #quest_data{},
                    _AccQuestId :: pos_integer(),
                    Args :: list() | term()) -> {ok, #role{}} |
                                                {error, Reason :: bitstring()}.

accept_handle([], Role, _QuestData, _AccQuestId,
              _Args) ->
    {ok, Role};
accept_handle([Label | T], Role, QuestData, AccQuestId,
              Args) ->
    case accept_handle(Label,
                       Role,
                       QuestData,
                       AccQuestId,
                       Args)
        of
        {ok, NRole} ->
            accept_handle(T, NRole, QuestData, AccQuestId, Args);
        {ok, NRole, NewQuestData} ->
            accept_handle(T, NRole, NewQuestData, AccQuestId, Args);
        {error, Reason} -> {error, Reason}
    end;
accept_handle(check_distance,
              Role = #role{pos = #pos{map = MapId, x = X, y = Y}},
              #quest_data{check_distance = 1, npc_accept_id = 0,
                          npc_accept = NpcBaseId},
              _AccQuestId, _Args)
    when NpcBaseId > 0 ->
    case unit_mgr:list(MapId, NpcBaseId) of
        [#unit{pos = #pos{map = MapId, x = DestX, y = DestY}}
         | _]
            when abs(X - DestX) < 500 andalso Y - DestY < 500 ->
            {ok, Role};
        _Ret -> {error, lang:get("距离太远")}
    end;
accept_handle(check_distance,
              Role = #role{name = _Name,
                           pos = #pos{map = MapId, x = X, y = Y}},
              #quest_data{check_distance = 1,
                          npc_accept_battle = BattleId, npc_accept_id = NpcId},
              _AccQuestId, _Args)
    when NpcId > 0 ->
    case unit_mgr:info({BattleId, NpcId}) of
        {ok,
         #unit{pos = #pos{map = MapId, x = DestX, y = DestY}}}
            when abs(X - DestX) < 500 andalso Y - DestY < 500 ->
            {ok, Role};
        _Ret ->
            logger:debug("Name:~w, MapId:~w, X:~w, Y:~w, BattleId:~w "
                         "NpcId:~w _Ret:~w",
                         [_Name, MapId, X, Y, BattleId, NpcId, _Ret],
                         quest,
                         496),
            {error, lang:get("距离太远")}
    end;
accept_handle(check_distance, Role, _QuestData,
              _AccQuestId, _Args) ->
    {ok, Role};
accept_handle(condition, Role,
              QuestData = #quest_data{mode = 2, sec_type = SecType},
              _AccQuestId, _Args)
    when SecType =/= 7 ->
    case quest_team_cond:check(QuestData, Role) of
        false -> {error, lang:get("不满足组队条件")};
        true -> {ok, Role};
        {false, Msg} -> {error, Msg}
    end;
accept_handle(condition, Role,
              QuestData = #quest_data{sec_type = 26}, _AccQuestId,
              _Args) ->
    case quest_levup:check(QuestData, Role) of
        false -> {error, lang:get("不满足任务接受条件")};
        true -> {ok, Role};
        {false, Msg} -> {error, Msg}
    end;
accept_handle(condition, Role,
              #quest_data{condition = Cond}, _AccQuestId, _Args) ->
    case role_cond:check(Cond, Role) of
        {false, #condition{msg = Msg}} -> {error, Msg};
        true -> {ok, Role}
    end;
accept_handle(loss, Role,
              #quest_data{rewards_accept = Rewards}, _AccQuestId,
              _Args) ->
    case role_gain:do(Rewards, Role) of
        {false, Reason} -> {error, Reason};
        {ok, NRole} -> {ok, NRole}
    end;
accept_handle(guild, Role = #role{m_guild = #m_guild{}},
              #quest_data{}, _AccQuestId, _Args) ->
    {ok, Role};
accept_handle(guild, _Role, #quest_data{}, _AccQuestId,
              _Args) ->
    {error, lang:get("请先加入公会")};
accept_handle(accept, Role = #role{name = _Name},
              QuestData = #quest_data{id = _QuestId,
                                      sec_type = SecType},
              AccQuestId, Args) ->
    case dispatch_accept(SecType,
                         QuestData,
                         Role,
                         AccQuestId,
                         Args)
        of
        {NewQuest = #quest{}, NewRole = #role{}} ->
            role:link_send(NewRole, 10204, {[AccQuestId]}),
            push_stats(SecType, NewRole),
            role:link_send(NewRole, 10203, {[NewQuest]}),
            log:mod(NewRole, quest_accept, AccQuestId),
            {ok, NewRole};
        {false, Msg} -> {error, Msg};
        _ -> {error, lang:get("接受任务失败")}
    end;
accept_handle(fire, Role, #quest_data{id = QuestId},
              _AccQuestId, _Args) ->
    {ok,
     role_trigger:fire(#evt_accept_quest{id = QuestId},
                       Role)};
accept_handle(_Label, _Role, _QuestData, _AccQuestId,
              _Args) ->
    logger:error("没有相关处理标签:~w", [_Label], quest, 542),
    {error, lang:get("接受任务失败")}.

-spec finish(QuestId :: pos_integer(), #role{}) -> {ok,
                                                    #role{}} |
                                                   {error,
                                                    Reason :: bitstring()}.

finish(QuestId,
       Role = #role{m_quest =
                        Mquest = #m_quest{quest = Quests}}) ->
    case lists:keyfind(QuestId, #quest.id, Quests) of
        false -> {error, lang:get("你并未接受此任务，无法完成")};
        Quest = #quest{finish = 0, progress = Progress} ->
            NewQuest = Quest#quest{finish = 1,
                                   progress =
                                       [Prog#quest_progress{finish = 1,
                                                            value = TarVal}
                                        || Prog = #quest_progress{target_val =
                                                                      TarVal}
                                               <- Progress]},
            NewQuests = lists:keyreplace(QuestId,
                                         #quest.id,
                                         Quests,
                                         NewQuest),
            NRole = Role#role{m_quest =
                                  Mquest#m_quest{quest = NewQuests}},
            role:link_send(NRole, 10209, {[NewQuest]}),
            {ok,
             role_trigger:fire(#evt_finish_quest{id = QuestId},
                               NRole)};
        _ -> {error, lang:get("此任务已完成")}
    end.

callback_commit(Role = #role{m_quest =
                                 #m_quest{quest = Quests}},
                QuestId, Steps) ->
    case lists:keyfind(QuestId, #quest.id, Quests) of
        false ->
            logger:error("[~ts]并未接受此任务[quest_id:~w]，无法提交",
                         [Role#role.name, QuestId],
                         quest,
                         564),
            ok;
        #quest{finish = 0} ->
            logger:error("[~ts]此任务未完成，无法提交",
                         [Role#role.name],
                         quest,
                         567),
            ok;
        Quest = #quest{} ->
            case quest_data:get(QuestId) of
                {error, Reason} ->
                    logger:error("任务[~w]已经完成，但却无法找到该任务的配置数据: ~w",
                                 [QuestId, Reason],
                                 quest,
                                 572),
                    ok;
                QuestData ->
                    case commit_handle(Steps, Role, Quest, QuestData) of
                        Rtn = {ok, _NewRole} -> Rtn;
                        {error, _Err} ->
                            logger:error("[~ts]回调提交任务[QuestId:~w]失败[~w]",
                                         [Role#role.name, QuestId, _Err],
                                         quest,
                                         579),
                            ok
                    end
            end
    end.

-spec commit(QuestId :: pos_integer(), #role{}) -> {ok,
                                                    #role{}} |
                                                   {error,
                                                    Reason :: bitstring()}.

commit(QuestId,
       Role = #role{m_quest = #m_quest{quest = Quests}}) ->
    case quest_data:get(QuestId) of
        {error, Reason} ->
            logger:error("任务[~w]无法找到配置数据: ~w",
                         [QuestId, Reason],
                         quest,
                         590),
            {error, lang:get("此任务不存在")};
        QuestData = #quest_data{} ->
            case lists:keyfind(QuestId, #quest.id, Quests) of
                false -> {error, lang:get("你并未接受此任务，无法提交")};
                #quest{finish = 0} -> {error, lang:get("此任务未完成，无法提交")};
                Quest = #quest{sec_type = SecType} ->
                    case check_commit(SecType, Quest, QuestData, Role) of
                        true ->
                            Steps = [check_distance,
                                     reward,
                                     finish,
                                     del_quest,
                                     flush,
                                     fire,
                                     special_fire],
                            commit_handle(Steps, Role, Quest, QuestData);
                        {error, combat} -> {error, lang:get("正在战斗中，不能提交任务")};
                        {error, Reason} -> {error, Reason};
                        _False ->
                            logger:error("任务[~w]已经完成，但却无法提交： ~w",
                                         [QuestId, _False],
                                         quest,
                                         609),
                            {error, lang:get("无法提交此任务")}
                    end
            end;
        _False ->
            logger:error("任务[~w]无法找到配置数据: ~w",
                         [QuestId, _False],
                         quest,
                         614),
            {error, lang:get("此任务不存在")}
    end.

-spec force_commit(QuestId :: pos_integer(),
                   #role{}) -> {ok, #role{}} |
                               {error, Reason :: bitstring()}.

force_commit(QuestId,
             Role = #role{m_quest = #m_quest{quest = Quests}}) ->
    case lists:keyfind(QuestId, #quest.id, Quests) of
        false -> {error, lang:get("你并未接受此任务，无法提交")};
        Quest = #quest{sec_type = _SecType} ->
            case quest_data:get(QuestId) of
                {error, Reason} ->
                    logger:error("任务[~w]已经完成，但却无法找到该任务的配置数据: ~w",
                                 [QuestId, Reason],
                                 quest,
                                 626),
                    {error, lang:get("此任务不存在")};
                QuestData ->
                    Steps = [reward,
                             finish,
                             del_quest,
                             flush,
                             fire,
                             special_fire],
                    commit_handle(Steps, Role, Quest, QuestData)
            end
    end.

-spec commit_no_reward(QuestId :: pos_integer(),
                       #role{}) -> {ok, #role{}} |
                                   {error, Reason :: bitstring()}.

commit_no_reward({R, P, Z}, QuestId) ->
    role:apply(async,
               {R, P, Z},
               {quest, commit_no_reward, [QuestId]});
commit_no_reward(Role = #role{m_quest =
                                  #m_quest{quest = Quests}},
                 QuestId) ->
    case lists:keyfind(QuestId, #quest.id, Quests) of
        false -> {error, lang:get("你并未接受此任务，无法提交")};
        Quest = #quest{sec_type = _SecType} ->
            case quest_data:get(QuestId) of
                {error, Reason} ->
                    logger:error("任务[~w]已经完成，但却无法找到该任务的配置数据: ~w",
                                 [QuestId, Reason],
                                 quest,
                                 644),
                    ok;
                QuestData ->
                    case commit_handle([finish,
                                        del_quest,
                                        flush,
                                        fire,
                                        fire,
                                        special_fire],
                                       Role,
                                       Quest,
                                       QuestData)
                        of
                        {error, Reason} ->
                            logger:error("任务[~w]，~ts",
                                         [QuestId, Reason],
                                         quest,
                                         649),
                            ok;
                        Else -> Else
                    end
            end
    end.

-spec giveup(QuestId :: pos_integer(), #role{}) -> {ok,
                                                    #role{}} |
                                                   {error,
                                                    Reason :: bitstring()}.

giveup(QuestId,
       Role = #role{m_quest = #m_quest{quest = Quests}}) ->
    case lists:keyfind(QuestId, #quest.id, Quests) of
        false -> {error, lang:get("你并未接受此任务，无法放弃")};
        Quest ->
            case quest_data:get(QuestId) of
                QuestData = #quest_data{can_giveup = 1,
                                        sec_type = 14} ->
                    quest_chain:giveup(QuestData, Quest, Role);
                QuestData = #quest_data{can_giveup = 1,
                                        sec_type = 27} ->
                    quest_king:giveup(QuestData, Quest, Role);
                QuestData = #quest_data{can_giveup = 1} ->
                    commit_handle([finish, del_quest, flush, giveup_fire],
                                  Role,
                                  Quest,
                                  QuestData);
                _ -> {error, lang:get("此任务不能放弃")}
            end
    end.

-spec commit_handle([atom()], #role{}, #quest{},
                    #quest_data{}) -> {ok, #role{}} |
                                      {error, Reason :: bitstring()}.

commit_handle([], Role, _Quest, _QuestData) ->
    {ok, Role};
commit_handle([Label | T], Role, Quest, QuestData) ->
    case commit_handle(Label, Role, Quest, QuestData) of
        {ok, NRole} ->
            commit_handle(T, NRole, Quest, QuestData);
        {error, Reason} -> {error, Reason}
    end;
commit_handle(check_distance,
              Role = #role{pos = #pos{map = MapId, x = X, y = Y}},
              _Quest,
              _QuestData = #quest_data{check_distance = 1,
                                       npc_commit = NpcBaseId,
                                       npc_commit_id = 0})
    when NpcBaseId > 0 ->
    case unit_mgr:list(MapId, NpcBaseId) of
        [#unit{pos = #pos{map = MapId, x = DestX, y = DestY}}
         | _]
            when abs(X - DestX) < 500 andalso Y - DestY < 500 ->
            {ok, Role};
        _ -> {error, lang:get("距离太远")}
    end;
commit_handle(check_distance,
              Role = #role{pos = #pos{map = MapId, x = X, y = Y}},
              _Quest,
              _QuestData = #quest_data{check_distance = 1,
                                       npc_commit_battle = BattleId,
                                       npc_commit_id = NpcId})
    when NpcId > 0 ->
    case unit_mgr:info({BattleId, NpcId}) of
        {ok,
         #unit{pos = #pos{map = MapId, x = DestX, y = DestY}}}
            when abs(X - DestX) < 500 andalso Y - DestY < 500 ->
            {ok, Role};
        _ -> {error, lang:get("距离太远")}
    end;
commit_handle(check_distance, Role, _Quest,
              _QuestData) ->
    {ok, Role};
commit_handle(reward, Role = #role{name = Name}, Quest,
              QuestData = #quest_data{sec_type = SecType,
                                      id = QuestId}) ->
    {NewRewards, RewardRole, RewardMsgArgs} = case
                                                  calc_dynamic_rewards(QuestData,
                                                                       Role)
                                                  of
                                                  {_, Rewards} ->
                                                      {format:val_to_gain(Rewards),
                                                       Role,
                                                       #{}};
                                                  {false, gain, Rewards} ->
                                                      {Rewards, Role, #{}};
                                                  {false,
                                                   gain,
                                                   TmpRole,
                                                   Rewards} ->
                                                      {Rewards, TmpRole, #{}};
                                                  {_Id, TmpRole, Rewards} ->
                                                      {format:val_to_gain(Rewards),
                                                       TmpRole,
                                                       #{}};
                                                  {_Id,
                                                   TmpRole,
                                                   Rewards,
                                                   MsgArgs} ->
                                                      {format:val_to_gain(Rewards),
                                                       TmpRole,
                                                       MsgArgs}
                                              end,
    Loss = dynamic_commit_loss(SecType,
                               Quest,
                               QuestData,
                               Role),
    case role_gain:do(Loss, RewardRole) of
        {ok, LossRole} ->
            case role_gain:auto_overlap(NewRewards,
                                        LossRole,
                                        lang:get("完成任务"))
                of
                {false, #gain{msg = Msg}} -> {error, Msg};
                {false, #loss{msg = Msg}} -> {error, Msg};
                {false, Msg} -> {error, Msg};
                {ok, NRole, SucL, _FailL} ->
                    Text = format:gain_text(SucL, NRole),
                    case Text of
                        [_ | _] ->
                            GLMsg = notice:format(lang:get("~ts"),
                                                  [{string_1, Text}]),
                            notice:send(NRole, 3, GLMsg),
                            ok;
                        _ -> ok
                    end,
                    special_reward(QuestData, SucL, NRole),
                    notice_reward(QuestData,
                                  Quest,
                                  SucL,
                                  RewardMsgArgs,
                                  NRole),
                    team_reward(NRole, QuestData, RewardMsgArgs),
                    log:mod(NRole,
                            quest_commit,
                            QuestId,
                            util:flist("~w:~ts",
                                       [QuestId, log:item_str(NewRewards)])),
                    {ok, NRole};
                False ->
                    logger:error("[~ts]提交任务[~w]错误[~w]",
                                 [Name, QuestId, False],
                                 quest,
                                 741),
                    {error, ""}
            end;
        {false, #gain{msg = Msg}} -> {error, Msg};
        {false, #loss{msg = Msg}} -> {error, Msg};
        {false, Err} -> {error, Err}
    end;
commit_handle(reward_no_loss, Role = #role{name = Name},
              Quest,
              QuestData = #quest_data{sec_type = SecType,
                                      id = QuestId}) ->
    {NewRewards, RewardRole, RewardMsgArgs} = case
                                                  calc_dynamic_rewards(QuestData,
                                                                       Role)
                                                  of
                                                  {_, Rewards} ->
                                                      {format:val_to_gain(Rewards),
                                                       Role,
                                                       #{}};
                                                  {false, gain, Rewards} ->
                                                      {Rewards, Role, #{}};
                                                  {false,
                                                   gain,
                                                   TmpRole,
                                                   Rewards} ->
                                                      {Rewards, TmpRole, #{}};
                                                  {_Id, TmpRole, Rewards} ->
                                                      {format:val_to_gain(Rewards),
                                                       TmpRole,
                                                       #{}};
                                                  {_Id,
                                                   TmpRole,
                                                   Rewards,
                                                   MsgArgs} ->
                                                      {format:val_to_gain(Rewards),
                                                       TmpRole,
                                                       MsgArgs}
                                              end,
    Loss = dynamic_commit_loss(SecType,
                               Quest,
                               QuestData,
                               Role),
    case role_gain:do(Loss, RewardRole) of
        {ok, LossRole} ->
            case role_gain:auto_overlap(NewRewards,
                                        LossRole,
                                        lang:get("完成任务"))
                of
                {false, #gain{msg = Msg}} -> {error, Msg};
                {false, #loss{msg = Msg}} -> {error, Msg};
                {false, Msg} -> {error, Msg};
                {ok, NRole, SucL, _FailL} ->
                    Text = format:gain_text(SucL, NRole),
                    case Text of
                        [_ | _] ->
                            GLMsg = notice:format(lang:get("~ts"),
                                                  [{string_1, Text}]),
                            notice:send(NRole, 3, GLMsg),
                            ok;
                        _ -> ok
                    end,
                    special_reward(QuestData, SucL, NRole),
                    notice_reward(QuestData,
                                  Quest,
                                  SucL,
                                  RewardMsgArgs,
                                  NRole),
                    team_reward(NRole, QuestData, RewardMsgArgs),
                    log:mod(NRole,
                            quest_commit,
                            QuestId,
                            util:flist("~w:~ts",
                                       [QuestId, log:item_str(NewRewards)])),
                    {ok, NRole};
                False ->
                    logger:error("[~ts]提交任务[~w]错误[~w]",
                                 [Name, QuestId, False],
                                 quest,
                                 790),
                    {error, ""}
            end;
        {false, #gain{msg = Msg}} -> {error, Msg};
        {false, #loss{}} ->
            case role_gain:auto_overlap(NewRewards,
                                        RewardRole,
                                        lang:get("完成任务"))
                of
                {false, #gain{msg = Msg}} -> {error, Msg};
                {false, #loss{msg = Msg}} -> {error, Msg};
                {false, Msg} -> {error, Msg};
                {ok, NRole, SucL, _FailL} ->
                    Text = format:gain_text(SucL, NRole),
                    case Text of
                        [_ | _] ->
                            GLMsg = notice:format(lang:get("~ts"),
                                                  [{string_1, Text}]),
                            notice:send(NRole, 3, GLMsg),
                            ok;
                        _ -> ok
                    end,
                    special_reward(QuestData, SucL, NRole),
                    notice_reward(QuestData,
                                  Quest,
                                  SucL,
                                  RewardMsgArgs,
                                  NRole),
                    team_reward(NRole, QuestData, RewardMsgArgs),
                    log:mod(NRole,
                            quest_commit,
                            QuestId,
                            util:flist("~w:~ts",
                                       [QuestId, log:item_str(NewRewards)])),
                    {ok, NRole};
                False ->
                    logger:error("[~ts]提交任务[~w]错误[~w]",
                                 [Name, QuestId, False],
                                 quest,
                                 818),
                    {error, ""}
            end;
        {false, Err} -> {error, Err}
    end;
commit_handle(finish,
              Role = #role{m_quest =
                               Mquest = #m_quest{finished = Finished}},
              #quest{id = QuestId, sec_type = SecType}, _QuestData) ->
    NewRole = case lists:member(SecType,
                                [1, 2, 5, 6, 13, 29])
                  of
                  true ->
                      Role#role{m_quest =
                                    Mquest#m_quest{finished =
                                                       [QuestId | Finished]}};
                  false -> Role
              end,
    {ok, NewRole};
commit_handle(del_quest, Role, Quest, _QuestData) ->
    {ok, del_quest(Quest, Role)};
commit_handle(flush, Role, _Quest, _QuestData) ->
    {ok, flush(Role, push)};
commit_handle(fire, Role,
              #quest{id = QuestId, sec_type = SecType}, _QuestData) ->
    {ok,
     role_trigger:fire(#evt_commit_quest{id = QuestId,
                                         sec_type = SecType},
                       Role)};
commit_handle(special_fire, Role, #quest{id = QuestId},
              #quest_data{sec_type = SecType}) ->
    case SecType of
        11 -> quest_treasure:commit(Role, QuestId);
        12 -> quest_guild:commit(Role);
        14 -> quest_chain:commit(Role, QuestId);
        15 -> quest_marriage:commit(Role, QuestId);
        16 -> quest_couple:commit(Role, QuestId);
        17 -> quest_plant:commit(Role);
        18 -> quest_teacher:commit(Role, QuestId);
        19 -> quest_shipping:commit(Role, QuestId);
        20 -> quest_hide_seek:commit(Role, QuestId);
        22 -> camp_cake:commit(Role, QuestId);
        21 -> quest_pursue:commit(Role);
        23 -> quest_child:commit(Role);
        24 -> quest_pregnancy:commit(Role);
        25 -> quest_acquaintance:commit(Role);
        26 -> quest_levup:commit(Role);
        10 -> quest_levup:commit(Role);
        27 -> quest_king:commit(Role);
        28 -> quest_summer:commit(Role, QuestId);
        30 -> campaign_inquiry_role:commit(Role, QuestId);
        29 -> quest_single_dog:commit(Role, QuestId);
        31 -> camp_sign_draw:commit(Role, QuestId);
        33 -> camp_zillionaire:commit(Role, QuestId);
        34 -> camp_score_exchange:commit(Role, QuestId);
        35 -> camp_long_active:commit(Role, QuestId);
        _ -> {ok, Role}
    end;
commit_handle(giveup_fire, Role, #quest{id = QuestId},
              _QuestData) ->
    NRole = role_trigger:fire(#evt_giveup_quest{id =
                                                    QuestId},
                              Role),
    log:mod(NRole, quest_giveup, QuestId),
    {ok, NRole};
commit_handle(_Label, _Role, _Quest, _QuestData) ->
    logger:error("没有相关处理标签:~w", [_Label], quest, 874),
    {error, lang:get("处理任务失败")}.

handle_auto_finished([], Role) -> {ok, Role};
handle_auto_finished([Data =
                          #quest_data{is_auto_finished_gain = 1,
                                      rewards_commit = Rewards, id = QuestId}
                      | Rest],
                     Role) ->
    NewRole = case role_gain:auto_overlap(Rewards,
                                          Role,
                                          lang:get("完成任务"))
                  of
                  {false, #gain{msg = Msg}} -> {error, Msg};
                  {false, #loss{msg = Msg}} -> {error, Msg};
                  {false, Msg} -> {error, Msg};
                  {ok, SucRole, SucL, _FailL} ->
                      Text = format:gain_text(SucL, SucRole),
                      case Text of
                          [_ | _] ->
                              GLMsg = notice:format(lang:get("~ts"),
                                                    [{string_1, Text}]),
                              notice:send(SucRole, 3, GLMsg),
                              ok;
                          _ -> ok
                      end,
                      NRole = handle_auto_finished_record(Data, SucRole),
                      log:mod(NRole,
                              quest_commit,
                              QuestId,
                              util:flist("~w:~ts",
                                         [QuestId, log:item_str(Rewards)])),
                      NRole;
                  False ->
                      logger:error("[~ts]提交任务[~w]错误[~w]",
                                   [Role#role.name, QuestId, False],
                                   quest,
                                   904),
                      Role
              end,
    handle_auto_finished(Rest, NewRole);
handle_auto_finished([Data = #quest_data{id = QuestId}
                      | Rest],
                     Role) ->
    NewRole = handle_auto_finished_record(Data, Role),
    log:mod(NewRole,
            quest_commit,
            QuestId,
            util:flist("~w:~ts", [QuestId, []])),
    handle_auto_finished(Rest, NewRole);
handle_auto_finished([_ | Rest], Role) ->
    handle_auto_finished(Rest, Role).

handle_auto_finished_record(#quest_data{sec_type =
                                            SecType,
                                        id = QuestId},
                            Role = #role{m_quest =
                                             MQuest = #m_quest{finished =
                                                                   Finished}}) ->
    case lists:member(SecType, [1, 2, 5, 6, 13, 29]) of
        true ->
            Role#role{m_quest =
                          MQuest#m_quest{finished = [QuestId | Finished]}};
        false -> Role
    end.

-spec zero_flush(#role{}) -> #role{}.

zero_flush(Role = #role{m_quest =
                            Mquest = #m_quest{quest = Quests}}) ->
    NewQuests = do_zero_flush(Quests, []),
    NRole = Role#role{m_quest =
                          Mquest#m_quest{quest = NewQuests}},
    flush(NRole, force_push).

do_zero_flush([], Quests) -> lists:reverse(Quests);
do_zero_flush([Q | T], Quests) ->
    do_zero_flush(T, [Q | Quests]).

-spec flush(#role{},
            not_push | push | force_push) -> #role{}.

flush(Role = #role{}, not_push) ->
    AcceptRole = #role{m_quest =
                           #m_quest{acceptable = NewAcceptable}} =
                     quest_filter:accept_list(Role),
    case auto_accept(NewAcceptable, AcceptRole) of
        false -> AcceptRole;
        {ok, NewRole} -> NewRole;
        {error, _Reason} -> AcceptRole
    end;
flush(Role = #role{}, force_push) ->
    AcceptRole = #role{m_quest =
                           #m_quest{acceptable = NewAcceptable}} =
                     quest_filter:accept_list(Role),
    role:link_send(AcceptRole, 10201, {NewAcceptable}),
    case auto_accept(NewAcceptable, AcceptRole) of
        false -> AcceptRole;
        {ok, NewRole} -> NewRole;
        {error, _Reason} -> AcceptRole
    end;
flush(Role = #role{m_quest =
                       #m_quest{acceptable = OldAcceptable}},
      push) ->
    AcceptRole = #role{m_quest =
                           #m_quest{acceptable = NewAcceptable}} =
                     quest_filter:accept_list(Role),
    DelL = OldAcceptable -- NewAcceptable,
    role:link_send(AcceptRole, 10204, {DelL}),
    AddL = NewAcceptable -- OldAcceptable,
    logger:debug("=====================:~w",
                 [AddL],
                 quest,
                 968),
    role:link_send(AcceptRole, 10207, {AddL}),
    push_stats(AcceptRole),
    logger:debug("=====================:~w",
                 [NewAcceptable],
                 quest,
                 971),
    case auto_accept(NewAcceptable, AcceptRole) of
        false -> AcceptRole;
        {ok, NewRole} -> NewRole;
        {error, _Reason} -> AcceptRole
    end.

check_join_team(Role) ->
    Msg = {false, lang:get("无法加入队伍")},
    check_join_team([14, 6], Role, Msg).

check_join_team([], _Role, Rtn) -> Rtn;
check_join_team([SecType | Rest], Role, _Rtn) ->
    Flag = case SecType of
               14 -> quest_chain:check_join_team(Role);
               6 -> quest_prac:check_join_team(Role);
               _ -> false
           end,
    case Flag of
        true -> true;
        NewRtn -> check_join_team(Rest, Role, NewRtn)
    end.

-spec load_quest([#quest{}], [#quest{}],
                 Label :: quest |
                          day_quest |
                          guild_quest |
                          quest_active |
                          atom(),
                 #role{}) -> {[#quest{}], #role{}}.

load_quest([], Quests, _Label, Role) -> {Quests, Role};
load_quest([Q = #quest{id = Id, finish = 1,
                       finish_time = FTime}
            | T],
           Quests, Label = achievement,
           Role = #role{m_achievement =
                            MAchi = #m_achievement{finish = FinL}}) ->
    case achievement_data:get(Id) of
        #quest_data{rewards_commit = [], honor = 0} ->
            MAchi1 = case FTime of
                         0 ->
                             MAchi#m_achievement{finish =
                                                     [{Id, date:unixtime()}
                                                      | FinL]};
                         _ -> MAchi#m_achievement{finish = [{Id, FTime} | FinL]}
                     end,
            load_quest(T,
                       Quests,
                       Label,
                       Role#role{m_achievement = MAchi1});
        _ -> load_quest(T, [Q | Quests], Label, Role)
    end;
load_quest([Q = #quest{id = Qid, progress = Progress}
            | T],
           Quests, Label = achievement, Role) ->
    {NewProgress, NewRole} = load_progress(Progress,
                                           Label,
                                           Qid,
                                           [],
                                           Role),
    load_quest(T,
               [Q#quest{progress = NewProgress} | Quests],
               Label,
               NewRole);
load_quest([Q = #quest{finish = 1, sec_type = SecType,
                       id = Qid, progress = Progress}
            | T],
           Quests, Label, Role) ->
    QuestLabel = case SecType of
                     4 -> quest_classes;
                     14 -> quest_chain;
                     12 -> quest_guild;
                     17 -> quest_plant;
                     21 -> quest_pursue;
                     23 -> quest_child;
                     24 -> quest_pregnancy;
                     25 -> quest_acquaintance;
                     _ -> quest
                 end,
    {NewProgress, NewRole} = load_progress(Progress,
                                           QuestLabel,
                                           Qid,
                                           [],
                                           Role),
    case [Tmp
          || Tmp = #quest_progress{finish = 0} <- NewProgress]
        of
        [] ->
            load_quest(T,
                       [Q#quest{progress = NewProgress} | Quests],
                       Label,
                       NewRole);
        _ ->
            load_quest(T,
                       [Q#quest{progress = NewProgress, finish = 0} | Quests],
                       Label,
                       NewRole)
    end;
load_quest([Q = #quest{sec_type = 4, id = Qid,
                       progress = Progress}
            | T],
           Quests, Label, Role) ->
    {NewProgress, NewRole} = load_progress(Progress,
                                           quest_classes,
                                           Qid,
                                           [],
                                           Role),
    load_quest(T,
               [Q#quest{progress = NewProgress} | Quests],
               Label,
               NewRole);
load_quest([Q = #quest{sec_type = 12, id = Qid,
                       progress = Progress}
            | T],
           Quests, Label, Role) ->
    {NewProgress, NewRole} = load_progress(Progress,
                                           quest_guild,
                                           Qid,
                                           [],
                                           Role),
    load_quest(T,
               [Q#quest{progress = NewProgress} | Quests],
               Label,
               NewRole);
load_quest([Q = #quest{sec_type = 14, id = Qid,
                       progress = Progress}
            | T],
           Quests, Label, Role) ->
    {NewProgress, NewRole} = load_progress(Progress,
                                           quest_chain,
                                           Qid,
                                           [],
                                           Role),
    load_quest(T,
               [Q#quest{progress = NewProgress} | Quests],
               Label,
               NewRole);
load_quest([Q = #quest{sec_type = 15, id = Qid,
                       progress = Progress}
            | T],
           Quests, Label, Role) ->
    {NewProgress, NewRole} = load_progress(Progress,
                                           quest_marriage,
                                           Qid,
                                           [],
                                           Role),
    load_quest(T,
               [Q#quest{progress = NewProgress} | Quests],
               Label,
               NewRole);
load_quest([Q = #quest{sec_type = 16, id = Qid,
                       progress = Progress}
            | T],
           Quests, Label, Role) ->
    {NewProgress, NewRole} = load_progress(Progress,
                                           quest_couple,
                                           Qid,
                                           [],
                                           Role),
    load_quest(T,
               [Q#quest{progress = NewProgress} | Quests],
               Label,
               NewRole);
load_quest([Q = #quest{sec_type = 17, id = Qid,
                       progress = Progress}
            | T],
           Quests, Label, Role) ->
    {NewProgress, NewRole} = load_progress(Progress,
                                           quest_plant,
                                           Qid,
                                           [],
                                           Role),
    load_quest(T,
               [Q#quest{progress = NewProgress} | Quests],
               Label,
               NewRole);
load_quest([Q = #quest{sec_type = 18, id = Qid,
                       progress = Progress}
            | T],
           Quests, Label, Role) ->
    {NewProgress, NewRole} = load_progress(Progress,
                                           quest_teacher,
                                           Qid,
                                           [],
                                           Role),
    load_quest(T,
               [Q#quest{progress = NewProgress} | Quests],
               Label,
               NewRole);
load_quest([Q = #quest{sec_type = 21, id = Qid,
                       progress = Progress}
            | T],
           Quests, Label, Role) ->
    {NewProgress, NewRole} = load_progress(Progress,
                                           quest_pursue,
                                           Qid,
                                           [],
                                           Role),
    load_quest(T,
               [Q#quest{progress = NewProgress} | Quests],
               Label,
               NewRole);
load_quest([Q = #quest{sec_type = 23, id = Qid,
                       progress = Progress}
            | T],
           Quests, Label, Role) ->
    {NewProgress, NewRole} = load_progress(Progress,
                                           quest_child,
                                           Qid,
                                           [],
                                           Role),
    load_quest(T,
               [Q#quest{progress = NewProgress} | Quests],
               Label,
               NewRole);
load_quest([Q = #quest{sec_type = 24, id = Qid,
                       progress = Progress}
            | T],
           Quests, Label, Role) ->
    {NewProgress, NewRole} = load_progress(Progress,
                                           quest_pregnancy,
                                           Qid,
                                           [],
                                           Role),
    load_quest(T,
               [Q#quest{progress = NewProgress} | Quests],
               Label,
               NewRole);
load_quest([Q = #quest{sec_type = 25, id = Qid,
                       progress = Progress}
            | T],
           Quests, Label, Role) ->
    {NewProgress, NewRole} = load_progress(Progress,
                                           quest_acquaintance,
                                           Qid,
                                           [],
                                           Role),
    load_quest(T,
               [Q#quest{progress = NewProgress} | Quests],
               Label,
               NewRole);
load_quest([Q = #quest{sec_type = 27, id = Qid,
                       progress = Progress}
            | T],
           Quests, Label, Role) ->
    {NewProgress, NewRole} = load_progress(Progress,
                                           quest_king,
                                           Qid,
                                           [],
                                           Role),
    load_quest(T,
               [Q#quest{progress = NewProgress} | Quests],
               Label,
               NewRole);
load_quest([Q = #quest{id = Qid, progress = Progress}
            | T],
           Quests, Label, Role) ->
    {NewProgress, NewRole} = load_progress(Progress,
                                           Label,
                                           Qid,
                                           [],
                                           Role),
    load_quest(T,
               [Q#quest{progress = NewProgress} | Quests],
               Label,
               NewRole).

-spec load_progress(Progress, TypeLabel, QuestData,
                    NewProgress, NewRole) -> {NewProgress,
                                              NewRole} when Progress ::
                                                                [#quest_progress{}],
                                                            NewProgress ::
                                                                [#quest_progress{}],
                                                            TypeLabel :: quest |
                                                                         day_quest |
                                                                         guild_quest |
                                                                         quest_active |
                                                                         quest_classes |
                                                                         atom(),
                                                            QuestData ::
                                                                pos_integer() |
                                                                #quest_data{},
                                                            NewProgress ::
                                                                #role{}.

load_progress([], _TypeLabel, _Qid, [], Role) ->
    {[], Role};
load_progress([], _TypeLabel, _Qid, Progress, Role) ->
    {lists:reverse(Progress), Role};
load_progress([P = #quest_progress{finish = 0} | T],
              quest_classes, Qid, Progress, Role) ->
    {ok,
     Prog = #quest_progress{id = Id, label = Label,
                            target = Target, param = Param},
     AddRole} =
        quest_classes:add_trigger(P, Qid, Role),
    {Tid, NewRole} = role_trigger:add(#trigger{label =
                                                   Label,
                                               m = quest_progress, f = event,
                                               a =
                                                   [quest_classes,
                                                    Qid,
                                                    Id,
                                                    Target,
                                                    Param]},
                                      AddRole),
    NewP = Prog#quest_progress{trigger = Tid},
    load_progress(T,
                  quest_classes,
                  Qid,
                  [NewP | Progress],
                  NewRole);
load_progress([P = #quest_progress{finish = 0} | T],
              quest_guild, Qid, Progress, Role) ->
    {ok,
     Prog = #quest_progress{id = Id, label = Label,
                            target = Target, param = Param},
     AddRole} =
        quest_guild:add_trigger(P, Qid, Role),
    {Tid, NewRole} = role_trigger:add(#trigger{label =
                                                   Label,
                                               m = quest_progress, f = event,
                                               a =
                                                   [quest_guild,
                                                    Qid,
                                                    Id,
                                                    Target,
                                                    Param]},
                                      AddRole),
    NewP = Prog#quest_progress{trigger = Tid},
    load_progress(T,
                  quest_guild,
                  Qid,
                  [NewP | Progress],
                  NewRole);
load_progress([P = #quest_progress{finish = 0} | T],
              quest_chain, Qid, Progress, Role) ->
    {ok,
     Prog = #quest_progress{id = Id, label = Label,
                            target = Target, param = Param},
     AddRole} =
        quest_chain:add_trigger(P, Qid, Role),
    {Tid, NewRole} = role_trigger:add(#trigger{label =
                                                   Label,
                                               m = quest_progress, f = event,
                                               a =
                                                   [quest_chain,
                                                    Qid,
                                                    Id,
                                                    Target,
                                                    Param]},
                                      AddRole),
    NewP = Prog#quest_progress{trigger = Tid},
    load_progress(T,
                  quest_chain,
                  Qid,
                  [NewP | Progress],
                  NewRole);
load_progress([P = #quest_progress{finish = 0} | T],
              quest_marriage, Qid, Progress, Role) ->
    {ok,
     Prog = #quest_progress{id = Id, label = Label,
                            target = Target, param = Param},
     AddRole} =
        quest_marriage:add_trigger(P, Qid, Role),
    {Tid, NewRole} = role_trigger:add(#trigger{label =
                                                   Label,
                                               m = quest_progress, f = event,
                                               a =
                                                   [quest_marriage,
                                                    Qid,
                                                    Id,
                                                    Target,
                                                    Param]},
                                      AddRole),
    NewP = Prog#quest_progress{trigger = Tid},
    load_progress(T,
                  quest_marriage,
                  Qid,
                  [NewP | Progress],
                  NewRole);
load_progress([P = #quest_progress{finish = 0} | T],
              quest_couple, Qid, Progress, Role) ->
    {ok,
     Prog = #quest_progress{id = Id, label = Label,
                            target = Target, param = Param},
     AddRole} =
        quest_couple:add_trigger(P, Qid, Role),
    {Tid, NewRole} = role_trigger:add(#trigger{label =
                                                   Label,
                                               m = quest_progress, f = event,
                                               a =
                                                   [quest_couple,
                                                    Qid,
                                                    Id,
                                                    Target,
                                                    Param]},
                                      AddRole),
    NewP = Prog#quest_progress{trigger = Tid},
    load_progress(T,
                  quest_couple,
                  Qid,
                  [NewP | Progress],
                  NewRole);
load_progress([P = #quest_progress{finish = 0} | T],
              quest_plant, Qid, Progress, Role) ->
    {ok,
     Prog = #quest_progress{id = Id, label = Label,
                            target = Target, param = Param},
     AddRole} =
        quest_plant:add_trigger(P, Qid, Role),
    {Tid, NewRole} = role_trigger:add(#trigger{label =
                                                   Label,
                                               m = quest_progress, f = event,
                                               a =
                                                   [quest_plant,
                                                    Qid,
                                                    Id,
                                                    Target,
                                                    Param]},
                                      AddRole),
    NewP = Prog#quest_progress{trigger = Tid},
    load_progress(T,
                  quest_plant,
                  Qid,
                  [NewP | Progress],
                  NewRole);
load_progress([P = #quest_progress{finish = 0} | T],
              quest_teacher, Qid, Progress, Role) ->
    {ok,
     Prog = #quest_progress{id = Id, label = Label,
                            target = Target, param = Param},
     AddRole} =
        quest_teacher:add_trigger(P, Qid, Role),
    {Tid, NewRole} = role_trigger:add(#trigger{label =
                                                   Label,
                                               m = quest_progress, f = event,
                                               a =
                                                   [quest_teacher,
                                                    Qid,
                                                    Id,
                                                    Target,
                                                    Param]},
                                      AddRole),
    NewP = Prog#quest_progress{trigger = Tid},
    load_progress(T,
                  quest_couple,
                  Qid,
                  [NewP | Progress],
                  NewRole);
load_progress([P = #quest_progress{finish = 0} | T],
              quest_pursue, Qid, Progress, Role) ->
    {ok,
     Prog = #quest_progress{id = Id, label = Label,
                            target = Target, param = Param},
     AddRole} =
        quest_pursue:add_trigger(P, Qid, Role),
    {Tid, NewRole} = role_trigger:add(#trigger{label =
                                                   Label,
                                               m = quest_progress, f = event,
                                               a =
                                                   [quest_pursue,
                                                    Qid,
                                                    Id,
                                                    Target,
                                                    Param]},
                                      AddRole),
    NewP = Prog#quest_progress{trigger = Tid},
    load_progress(T,
                  quest_pursue,
                  Qid,
                  [NewP | Progress],
                  NewRole);
load_progress([P = #quest_progress{finish = 0} | T],
              quest_child, Qid, Progress, Role) ->
    {ok,
     Prog = #quest_progress{id = Id, label = Label,
                            target = Target, param = Param},
     AddRole} =
        quest_child:add_trigger(P, Qid, Role),
    {Tid, NewRole} = role_trigger:add(#trigger{label =
                                                   Label,
                                               m = quest_progress, f = event,
                                               a =
                                                   [quest_child,
                                                    Qid,
                                                    Id,
                                                    Target,
                                                    Param]},
                                      AddRole),
    NewP = Prog#quest_progress{trigger = Tid},
    load_progress(T,
                  quest_child,
                  Qid,
                  [NewP | Progress],
                  NewRole);
load_progress([P = #quest_progress{finish = 0} | T],
              quest_pregnancy, Qid, Progress, Role) ->
    {ok,
     Prog = #quest_progress{id = Id, label = Label,
                            target = Target, param = Param},
     AddRole} =
        quest_pregnancy:add_trigger(P, Qid, Role),
    {Tid, NewRole} = role_trigger:add(#trigger{label =
                                                   Label,
                                               m = quest_progress, f = event,
                                               a =
                                                   [quest_pregnancy,
                                                    Qid,
                                                    Id,
                                                    Target,
                                                    Param]},
                                      AddRole),
    NewP = Prog#quest_progress{trigger = Tid},
    load_progress(T,
                  quest_pregnancy,
                  Qid,
                  [NewP | Progress],
                  NewRole);
load_progress([P = #quest_progress{finish = 0} | T],
              quest_acquaintance, Qid, Progress, Role) ->
    {ok,
     Prog = #quest_progress{id = Id, label = Label,
                            target = Target, param = Param},
     AddRole} =
        quest_acquaintance:add_trigger(P, Qid, Role),
    {Tid, NewRole} = role_trigger:add(#trigger{label =
                                                   Label,
                                               m = quest_progress, f = event,
                                               a =
                                                   [quest_acquaintance,
                                                    Qid,
                                                    Id,
                                                    Target,
                                                    Param]},
                                      AddRole),
    NewP = Prog#quest_progress{trigger = Tid},
    load_progress(T,
                  quest_acquaintance,
                  Qid,
                  [NewP | Progress],
                  NewRole);
load_progress([P = #quest_progress{finish = 0} | T],
              quest_king, Qid, Progress, Role) ->
    {ok,
     Prog = #quest_progress{id = Id, label = Label,
                            target = Target, param = Param},
     AddRole} =
        quest_king:add_trigger(P, Qid, Role),
    {Tid, NewRole} = role_trigger:add(#trigger{label =
                                                   Label,
                                               m = quest_progress, f = event,
                                               a =
                                                   [quest_king,
                                                    Qid,
                                                    Id,
                                                    Target,
                                                    Param]},
                                      AddRole),
    NewP = Prog#quest_progress{trigger = Tid},
    load_progress(T,
                  quest_king,
                  Qid,
                  [NewP | Progress],
                  NewRole);
load_progress([P = #quest_progress{id = Id,
                                   label = Label, target = Target,
                                   param = Param, finish = 0}
               | T],
              TypeLabel, Qid, Progress, Role) ->
    {Tid, NewRole} = role_trigger:add(#trigger{label =
                                                   Label,
                                               m = quest_progress, f = event,
                                               a =
                                                   [TypeLabel,
                                                    Qid,
                                                    Id,
                                                    Target,
                                                    Param]},
                                      Role),
    load_progress(T,
                  TypeLabel,
                  Qid,
                  [P#quest_progress{trigger = Tid} | Progress],
                  NewRole);
load_progress([P | T], TypeLabel, Qid, Progress,
              Role) ->
    NewRole = quest_progress:monitor_quest_prog(TypeLabel,
                                                P,
                                                Qid,
                                                Role),
    load_progress(T,
                  TypeLabel,
                  Qid,
                  [P#quest_progress{trigger = undefined} | Progress],
                  NewRole).

sync_quest_talk(QuestId, TalkType,
                Role = #role{m_quest = #m_quest{quest = Quests}}) ->
    case lists:keyfind(QuestId, #quest.id, Quests) of
        Quest = #quest{sec_type = 15} ->
            quest_marriage:sync_quest_talk(Quest, TalkType, Role);
        Quest = #quest{sec_type = 16} ->
            quest_couple:sync_quest_talk(Quest, TalkType, Role);
        Quest = #quest{sec_type = 18} ->
            quest_teacher:sync_quest_talk(Quest, TalkType, Role);
        Quest = #quest{sec_type = 25} ->
            quest_acquaintance:sync_quest_talk(Quest,
                                               TalkType,
                                               Role);
        _ -> false
    end.

team_leave_clean(Role) ->
    TypeList = [18],
    quest_shipping:del_all_unit([self()]),
    team_leave_clean(TypeList, Role).

team_leave_clean([], Role) -> Role;
team_leave_clean([SecType | Rest], Role) ->
    NewRole = team_leave_clean(SecType, Role),
    team_leave_clean(Rest, NewRole);
team_leave_clean(SecType = 18,
                 Role = #role{m_quest = #m_quest{quest = Quests}}) ->
    case lists:keyfind(SecType, #quest.sec_type, Quests) of
        Quest = #quest{} ->
            quest_teacher:team_leave_clean(Quest, Role);
        _ -> Role
    end.

team_kickout_clean(Role, MateId) ->
    TypeList = [18],
    team_kickout_clean(TypeList, MateId, Role).

team_kickout_clean([], _MateId, Role) -> Role;
team_kickout_clean([SecType | Rest], MateId, Role) ->
    NewRole = team_kickout_clean(SecType, MateId, Role),
    team_kickout_clean(Rest, MateId, NewRole);
team_kickout_clean(SecType = 18, MateId,
                   Role = #role{m_quest = #m_quest{quest = Quests}}) ->
    case lists:keyfind(SecType, #quest.sec_type, Quests) of
        Quest = #quest{} ->
            quest_teacher:team_kickout_clean(Quest, MateId, Role);
        _ -> Role
    end.

apply_del_quest(Role, []) -> {ok, Role};
apply_del_quest(Role, [Id | Rest]) ->
    NewRole = del_quest(Id, Role),
    apply_del_quest(NewRole, Rest).

del_sec_type(Role = #role{m_quest =
                              #m_quest{quest = Quests}},
             SecType) ->
    Ids = [Id
           || #quest{id = Id, sec_type = ISecType} <- Quests,
              ISecType == SecType],
    apply_del_quest(Role, Ids).

can_enter_temple(#role{m_quest =
                           #m_quest{finished = FinL}}) ->
    QuestId = 12630,
    case lists:member(12630, FinL) of
        true -> true;
        _ ->
            case quest_data:get(QuestId) of
                #quest_data{lev = Lev} ->
                    {nav,
                     notice:format(lang:get("完成~ts级~ts任务才能进入~ts{face_1,26}"),
                                   [{string_2, 1, Lev},
                                    {quest_1, 12630},
                                    {map_1, 10009}])};
                {error, _Reason} -> {error, lang:get("不可进入")}
            end
    end.

del_quest(Id,
          Role = #role{m_quest = #m_quest{quest = Quests}})
    when is_integer(Id) ->
    case lists:keyfind(Id, #quest.id, Quests) of
        false -> Role;
        Quest -> del_quest(Quest, Role)
    end;
del_quest(#quest{sec_type = 3, id = Id,
                 progress = Progress},
          Role = #role{name = _Name,
                       link = #link{conn_pid = ConnPid}}) ->
    Role1 = plot_quest:remove_task_unit(Role, Progress),
    Tids = [Tid
            || #quest_progress{trigger = Tid, finish = 0}
                   <- Progress,
               is_tuple(Tid)],
    Role2 = #role{m_quest =
                      Mquest = #m_quest{quest = Quests}} =
                role_trigger:del(Tids, Role1),
    sys_conn:pack_send(ConnPid, 10208, {[Id]}),
    NewQuests = lists:keydelete(Id, #quest.id, Quests),
    reset_check_timer(NewQuests),
    NewRole = Role2#role{m_quest =
                             Mquest#m_quest{quest = NewQuests}},
    role_trigger:fire(#evt_quest_del{id = Id}, NewRole);
del_quest(#quest{sec_type = 15, id = Id,
                 progress = Progress},
          Role) ->
    Role1 = plot_quest:remove_task_unit(Role, Progress),
    Tids = [Tid
            || #quest_progress{trigger = Tid, finish = 0}
                   <- Progress,
               is_tuple(Tid)],
    Role2 = #role{m_quest =
                      Mquest = #m_quest{quest = Quests}} =
                role_trigger:del(Tids, Role1),
    role:link_send(Role2, 10208, {[Id]}),
    NewQuests = lists:keydelete(Id, #quest.id, Quests),
    reset_check_timer(NewQuests),
    Role3 = Role2#role{m_quest =
                           Mquest#m_quest{quest = NewQuests}},
    DelRole = quest_marriage:del_quest(Role3),
    NewRole = DelRole,
    NewRole;
del_quest(#quest{sec_type = 16, id = Id,
                 progress = Progress},
          Role) ->
    Role1 = plot_quest:remove_task_unit(Role, Progress),
    Tids = [Tid
            || #quest_progress{trigger = Tid, finish = 0}
                   <- Progress,
               is_tuple(Tid)],
    Role2 = #role{m_quest =
                      Mquest = #m_quest{quest = Quests}} =
                role_trigger:del(Tids, Role1),
    role:link_send(Role2, 10208, {[Id]}),
    NewQuests = lists:keydelete(Id, #quest.id, Quests),
    reset_check_timer(NewQuests),
    Role3 = Role2#role{m_quest =
                           Mquest#m_quest{quest = NewQuests}},
    DelRole = quest_couple:del_quest(Role3),
    NewRole = DelRole,
    NewRole;
del_quest(#quest{sec_type = 18, id = Id,
                 progress = Progress},
          Role) ->
    Role1 = plot_quest:remove_task_unit(Role, Progress),
    Tids = [Tid
            || #quest_progress{trigger = Tid, finish = 0}
                   <- Progress,
               is_tuple(Tid)],
    Role2 = #role{m_quest =
                      Mquest = #m_quest{quest = Quests}} =
                role_trigger:del(Tids, Role1),
    role:link_send(Role2, 10208, {[Id]}),
    NewQuests = lists:keydelete(Id, #quest.id, Quests),
    reset_check_timer(NewQuests),
    Role3 = Role2#role{m_quest =
                           Mquest#m_quest{quest = NewQuests}},
    DelRole = quest_teacher:del_quest(Role3),
    NewRole = DelRole,
    NewRole;
del_quest(#quest{sec_type = 19, id = Id,
                 progress = Progress},
          Role) ->
    Role1 = plot_quest:remove_task_unit(Role, Progress),
    Tids = [Tid
            || #quest_progress{trigger = Tid, finish = 0}
                   <- Progress,
               is_tuple(Tid)],
    Role2 = #role{m_quest =
                      Mquest = #m_quest{quest = Quests}} =
                role_trigger:del(Tids, Role1),
    role:link_send(Role2, 10208, {[Id]}),
    NewQuests = lists:keydelete(Id, #quest.id, Quests),
    reset_check_timer(NewQuests),
    Role3 = Role2#role{m_quest =
                           Mquest#m_quest{quest = NewQuests}},
    DelRole = quest_shipping:del_quest(Role3, Id),
    NewRole = DelRole,
    NewRole;
del_quest(#quest{id = Id, progress = Progress},
          Role = #role{link = #link{conn_pid = ConnPid},
                       m_quest = Mquest = #m_quest{quest = Quests}}) ->
    Role1 = plot_quest:remove_task_unit(Role, Progress),
    Tids = [Tid
            || #quest_progress{trigger = Tid, finish = 0}
                   <- Progress,
               is_tuple(Tid)],
    NewRole = role_trigger:del(Tids, Role1),
    sys_conn:pack_send(ConnPid, 10208, {[Id]}),
    NewQuests = lists:keydelete(Id, #quest.id, Quests),
    reset_check_timer(NewQuests),
    NewRole#role{m_quest =
                     Mquest#m_quest{quest = NewQuests}}.

-spec calc_dynamic_rewards(QuestData :: #quest_data{},
                           Role :: #role{}) -> {false, list()} |
                                               [{pos_integer(), pos_integer()}].

-spec calc_dynamic_rewards(Ids :: list(),
                           Role :: #role{}, L) -> L when L :: [{pos_integer(),
                                                                pos_integer()}].

calc_dynamic_rewards([], _Role, L) -> L;
calc_dynamic_rewards([I | T], Role, L) ->
    case calc_dynamic_rewards(quest_data:get(I), Role) of
        {false, _} -> calc_dynamic_rewards(T, Role, L);
        {false, gain, _} -> calc_dynamic_rewards(T, Role, L);
        {false, gain, NewRole, _Rewards} ->
            calc_dynamic_rewards(T, NewRole, L);
        {Id, NewRole, Rewards} ->
            calc_dynamic_rewards(T, NewRole, [{Id, Rewards} | L]);
        {Id, NewRole, Rewards, _} ->
            calc_dynamic_rewards(T, NewRole, [{Id, Rewards} | L]);
        Data = {_, _} ->
            calc_dynamic_rewards(T, Role, [Data | L])
    end.

calc_dynamic_rewards(QuestData = #quest_data{id = Id,
                                             sec_type = 3},
                     Role) ->
    {ok, NewRole, Rewards} =
        quest_offer:get_reward(QuestData, Role),
    {Id, NewRole, Rewards};
calc_dynamic_rewards(QuestData = #quest_data{id = Id,
                                             sec_type = 4},
                     Role) ->
    {ok, NewRole, Rewards} =
        quest_classes:get_reward(QuestData, Role),
    {Id, NewRole, Rewards};
calc_dynamic_rewards(QuestData = #quest_data{sec_type =
                                                 10},
                     Role) ->
    {ok, Rewards} = quest_kill:get_reward(QuestData, Role),
    {false, gain, Rewards};
calc_dynamic_rewards(QuestData = #quest_data{sec_type =
                                                 5},
                     Role) ->
    {ok, Rewards, NewRole} =
        quest_prac:get_reward(QuestData, Role),
    Rewards1 = update_main_gain(Rewards, []),
    {false, gain, NewRole, Rewards1};
calc_dynamic_rewards(QuestData = #quest_data{sec_type =
                                                 6},
                     Role) ->
    {ok, Rewards, NewRole} =
        quest_prac:get_reward(QuestData, Role),
    Rewards1 = update_main_gain(Rewards, []),
    {false, gain, NewRole, Rewards1};
calc_dynamic_rewards(QuestData = #quest_data{id = Id,
                                             sec_type = 12},
                     Role) ->
    {ok, NewRole, Rewards} =
        quest_guild:get_reward(QuestData, Role),
    {Id, NewRole, Rewards};
calc_dynamic_rewards(QuestData = #quest_data{id = Id,
                                             sec_type = 14},
                     Role) ->
    {ok, NRole, Rewards, MsgArgs} =
        quest_chain:get_reward(QuestData, Role),
    {Id, NRole, Rewards, MsgArgs};
calc_dynamic_rewards(QuestData = #quest_data{sec_type =
                                                 15},
                     Role) ->
    {ok, NewRole, Rewards} =
        quest_marriage:get_reward(QuestData, Role),
    {false, gain, NewRole, Rewards};
calc_dynamic_rewards(QuestData = #quest_data{sec_type =
                                                 16},
                     Role) ->
    {ok, NewRole, Rewards} =
        quest_couple:get_reward(QuestData, Role),
    {false, gain, NewRole, Rewards};
calc_dynamic_rewards(QuestData = #quest_data{id = Id,
                                             sec_type = 17},
                     Role) ->
    {ok, NewRole, Rewards, MsgMFA} =
        quest_plant:get_reward(QuestData, Role),
    {Id, NewRole, Rewards, MsgMFA};
calc_dynamic_rewards(QuestData = #quest_data{sec_type =
                                                 18},
                     Role) ->
    {ok, NewRole, Rewards} =
        quest_teacher:get_reward(QuestData, Role),
    {false, gain, NewRole, Rewards};
calc_dynamic_rewards(QuestData = #quest_data{sec_type =
                                                 19},
                     Role) ->
    {ok, NewRole, Rewards} =
        quest_shipping:get_reward(QuestData, Role),
    {false, gain, NewRole, Rewards};
calc_dynamic_rewards(QuestData = #quest_data{sec_type =
                                                 21},
                     Role) ->
    {ok, NewRole, Rewards} =
        quest_pursue:get_reward(QuestData, Role),
    {false, gain, NewRole, Rewards};
calc_dynamic_rewards(QuestData = #quest_data{sec_type =
                                                 23},
                     Role) ->
    {ok, NewRole, Rewards} =
        quest_child:get_reward(QuestData, Role),
    {false, gain, NewRole, Rewards};
calc_dynamic_rewards(QuestData = #quest_data{sec_type =
                                                 24},
                     Role) ->
    {ok, NewRole, Rewards} =
        quest_pregnancy:get_reward(QuestData, Role),
    {false, gain, NewRole, Rewards};
calc_dynamic_rewards(QuestData = #quest_data{sec_type =
                                                 25},
                     Role) ->
    {ok, NewRole, Rewards} =
        quest_acquaintance:get_reward(QuestData, Role),
    {false, gain, NewRole, Rewards};
calc_dynamic_rewards(QuestData = #quest_data{sec_type =
                                                 29},
                     Role) ->
    {ok, NewRole, Rewards} =
        quest_single_dog:get_reward(QuestData, Role),
    {false, gain, NewRole, Rewards};
calc_dynamic_rewards(#quest_data{type = 1,
                                 rewards_commit = Rewards},
                     _Role) ->
    Rewards1 = update_main_gain(Rewards, []),
    {false, gain, Rewards1};
calc_dynamic_rewards(#quest_data{rewards_commit =
                                     Rewards},
                     _Role) ->
    {false, gain, Rewards};
calc_dynamic_rewards(_QuestData, _Role) ->
    logger:error("动态奖励的任务不存在", [], quest, 1384),
    {false, []}.

update_main_gain([], Rewards) -> lists:reverse(Rewards);
update_main_gain([G = #gain{label = exp} | T],
                 Rewards) ->
    update_main_gain(T, [G#gain{source = 6} | Rewards]);
update_main_gain([G | T], Rewards) ->
    update_main_gain(T, [G | Rewards]).

dispatch_accept(3, QuestData, Role, AccQuestId, Args) ->
    quest_offer:accept(QuestData, Role, AccQuestId, Args);
dispatch_accept(4, QuestData, Role, AccQuestId,
                _Args) ->
    quest_classes:accept(QuestData, Role, AccQuestId);
dispatch_accept(5, QuestData, Role, AccQuestId,
                _Args) ->
    quest_prac:accept(QuestData, Role, AccQuestId);
dispatch_accept(6, QuestData, Role, AccQuestId,
                _Args) ->
    quest_prac:accept(QuestData, Role, AccQuestId);
dispatch_accept(11, QuestData, Role, AccQuestId,
                _Args) ->
    quest_treasure:accept(QuestData, Role, AccQuestId);
dispatch_accept(12, QuestData, Role, AccQuestId,
                _Args) ->
    quest_guild:accept(QuestData, Role, AccQuestId);
dispatch_accept(14, QuestData, Role, AccQuestId,
                Args) ->
    quest_chain:accept(QuestData, Role, AccQuestId, Args);
dispatch_accept(15, QuestData, Role, AccQuestId,
                Args) ->
    quest_marriage:accept(QuestData,
                          Role,
                          AccQuestId,
                          Args);
dispatch_accept(16, QuestData, Role, AccQuestId,
                Args) ->
    quest_couple:accept(QuestData, Role, AccQuestId, Args);
dispatch_accept(17, QuestData, Role, AccQuestId,
                _Args) ->
    quest_plant:accept(QuestData, Role, AccQuestId);
dispatch_accept(18, QuestData, Role, AccQuestId,
                Args) ->
    quest_teacher:accept(QuestData, Role, AccQuestId, Args);
dispatch_accept(19, QuestData, Role, AccQuestId,
                Args) ->
    quest_shipping:accept(QuestData,
                          Role,
                          AccQuestId,
                          Args);
dispatch_accept(21, QuestData, Role, AccQuestId,
                _Args) ->
    quest_pursue:accept(QuestData, Role, AccQuestId);
dispatch_accept(23, QuestData, Role, AccQuestId,
                _Args) ->
    quest_child:accept(QuestData, Role, AccQuestId);
dispatch_accept(24, QuestData, Role, AccQuestId,
                _Args) ->
    quest_pregnancy:accept(QuestData, Role, AccQuestId);
dispatch_accept(25, QuestData, Role, AccQuestId,
                _Args) ->
    quest_acquaintance:accept(QuestData, Role, AccQuestId);
dispatch_accept(27, QuestData, Role, AccQuestId,
                _Args) ->
    quest_king:accept(QuestData, Role, AccQuestId);
dispatch_accept(28, QuestData, Role, AccQuestId,
                _Args) ->
    quest_summer:accept(QuestData, Role, AccQuestId);
dispatch_accept(31, QuestData, Role, AccQuestId,
                _Args) ->
    camp_sign_draw:accept(QuestData, Role, AccQuestId);
dispatch_accept(_Type,
                #quest_data{id = QuestId, type = Type,
                            sec_type = SecType, progress = Progress,
                            start_time = ST, end_time = ET},
                Role = #role{m_quest =
                                 _Mquest = #m_quest{quest = Quests,
                                                    acceptable = Acceptable}},
                AccQuestId, _Args) ->
    Progress0 = quest_prog_init:do(Role, Progress, QuestId),
    {NewProgress, LoadRole} = load_progress(Progress0,
                                            quest,
                                            QuestId,
                                            [],
                                            Role),
    UnitRole = plot_quest:create_task_unit(LoadRole,
                                           QuestId,
                                           NewProgress),
    Finish = case [false
                   || #quest_progress{finish = 0} <- NewProgress]
                 of
                 [] -> 1;
                 _ -> 0
             end,
    {_, EndT} = date:parse_time(ST, ET),
    NQuest = #quest{id = QuestId, finish = Finish,
                    type = Type, sec_type = SecType, progress = NewProgress,
                    end_time = EndT},
    set_check_timer(EndT),
    NewQuests = [NQuest | Quests],
    NewAcceptable = lists:delete(AccQuestId, Acceptable),
    Mquest = UnitRole#role.m_quest,
    NewRole = UnitRole#role{m_quest =
                                Mquest#m_quest{quest = NewQuests,
                                               acceptable = NewAcceptable}},
    {NQuest, NewRole}.

dispatch_auto_accept(QuestData = #quest_data{id = Id,
                                             mode = 2},
                     Role) ->
    case team:is_leader(Role) of
        true ->
            accept_handle([condition, loss, accept, fire],
                          Role,
                          QuestData,
                          Id);
        false -> {error, lang:get("不不满足队伍条件")}
    end;
dispatch_auto_accept(QuestData = #quest_data{id = Id},
                     Role) ->
    accept_handle([condition, loss, accept, fire],
                  Role,
                  QuestData,
                  Id).

push_stats(Role) ->
    push_stats([4,
                3,
                11,
                12,
                14,
                15,
                16,
                17,
                18,
                19,
                20,
                21,
                22,
                25,
                29,
                33],
               Role,
               []).

push_stats(SecType, Role) ->
    case lists:member(SecType,
                      [4,
                       3,
                       11,
                       12,
                       14,
                       15,
                       16,
                       17,
                       18,
                       19,
                       20,
                       21,
                       22,
                       25,
                       29,
                       33])
        of
        true -> push_stats([SecType], Role, []);
        false -> skip
    end.

push_stats([], Role, Acc) ->
    role:link_send(Role, 10214, {Acc}),
    ok;
push_stats([Type | Rest], Role, Acc) ->
    case get_kv_stats(Type, Role) of
        {true, QuestStats} ->
            push_stats(Rest, Role, [QuestStats | Acc]);
        {other, QuestStats} ->
            push_stats(Rest, Role, [QuestStats | Acc]);
        false -> push_stats(Rest, Role, Acc)
    end.

get_kv_stats(Type,
             Role = #role{m_quest =
                              #m_quest{quest_classes = QuestClasses,
                                       quest_offer = QuestOffer,
                                       quest_treasure = QuestTreasure,
                                       quest_guild = QuestGuild,
                                       quest_chain = QuestChain,
                                       quest_marriage = QuestMarriage,
                                       quest_couple = QuestCouple,
                                       quest_plant = Plant,
                                       quest_teacher = QuestTeacher,
                                       quest_pursue = QuestPursue,
                                       quest_child = QuestChild,
                                       quest_pregnancy = QuestPregnancy,
                                       quest_acquaintance = QuestAcq,
                                       quest_single_dog = QuestSingleDog},
                          s_event = Event,
                          m_camp_cake = #m_camp_cake{round = CakeRound}}) ->
    {Flag, Stats, Array} = case Type of
                               4 ->
                                   #quest_classes{round = Round, ring = Ring} =
                                       QuestClasses,
                                   case Round >= 0 andalso Ring =< 1 of
                                       true ->
                                           Info =
                                               quest_classes:quest_info(Role),
                                           {true,
                                            [{2, Round}, {1, Ring}],
                                            Info};
                                       false -> {false, [], []}
                                   end;
                               3 ->
                                   #quest_offer{round = Round,
                                                leader_count = LeaderCount} =
                                       QuestOffer,
                                   case Round > 0 of
                                       true ->
                                           {true,
                                            [{2, Round}, {3, LeaderCount}],
                                            []};
                                       false -> {false, [], []}
                                   end;
                               11 ->
                                   #quest_treasure{round = Round} =
                                       QuestTreasure,
                                   case Round > 0 of
                                       true -> {true, [{2, Round}], []};
                                       false -> {false, [], []}
                                   end;
                               22 ->
                                   case Event == 34 orelse Event == 35 of
                                       true -> {true, [{2, CakeRound}], []};
                                       false -> {false, [], []}
                                   end;
                               12 ->
                                   #quest_guild{round = Round, ring = Ring} =
                                       QuestGuild,
                                   {true, [{2, Round}, {1, Ring}], []};
                               14 ->
                                   #quest_chain{round = Round,
                                                commit_npc = CommitNpc} =
                                       QuestChain,
                                   {BattleId, Id, BaseId} = case CommitNpc of
                                                                {TmpBattleId,
                                                                 TmpId,
                                                                 TmpBaseId} ->
                                                                    {TmpBattleId,
                                                                     TmpId,
                                                                     TmpBaseId};
                                                                _ -> {0, 0, 0}
                                                            end,
                                   NpcStats = [{6, BattleId},
                                               {7, Id},
                                               {8, BaseId}],
                                   Luck = [{12,
                                            var:get_var(Role, acc, 1015, 0)}],
                                   case Round > 0 of
                                       true ->
                                           ChainStats = [{2, Round} | NpcStats],
                                           {true, ChainStats ++ Luck, []};
                                       false -> {other, Luck, []}
                                   end;
                               15 ->
                                   #quest_marriage{round = Round} =
                                       QuestMarriage,
                                   case Round > 0 of
                                       true ->
                                           MarriageStats = [{2, Round}],
                                           {true, MarriageStats, []};
                                       false -> {false, [], []}
                                   end;
                               16 ->
                                   #quest_couple{round = Round} = QuestCouple,
                                   case Round > 0 of
                                       true ->
                                           CoupleStats = [{2, Round}],
                                           {true, CoupleStats, []};
                                       false -> {false, [], []}
                                   end;
                               17 ->
                                   #quest_plant{round = Round} = Plant,
                                   {true, [{2, Round}], []};
                               18 ->
                                   #quest_teacher{round = Round, ext_data = Ext,
                                                  type = TeacherType} =
                                       QuestTeacher,
                                   case Round > 0 of
                                       true ->
                                           {AskStats, Desc} = case TeacherType
                                                                  of
                                                                  3 ->
                                                                      case
                                                                          quest_teacher:get_ask_id(Ext,
                                                                                                   Role)
                                                                          of
                                                                          {AskPltm,
                                                                           AskZoneId,
                                                                           AskId} ->
                                                                              {[{9,
                                                                                 AskId},
                                                                                {10,
                                                                                 AskZoneId}],
                                                                               [{0,
                                                                                 [{2,
                                                                                   AskPltm}]}]};
                                                                          _ ->
                                                                              {[],
                                                                               []}
                                                                      end;
                                                                  _ -> {[], []}
                                                              end,
                                           TeacherStats = [{2, Round}] ++
                                                              AskStats,
                                           {true, TeacherStats, Desc};
                                       false -> {false, [], []}
                                   end;
                               21 ->
                                   #quest_pursue{round = Round, ring = Ring} =
                                       QuestPursue,
                                   CanCommit = case
                                                   quest_pursue:check_commit(Role)
                                                   of
                                                   true -> 1;
                                                   _ -> 0
                                               end,
                                   {true,
                                    [{2, Round}, {1, Ring}, {11, CanCommit}],
                                    []};
                               23 ->
                                   #quest_child{round = Round} = QuestChild,
                                   {true, [{2, Round}], []};
                               24 ->
                                   #quest_pregnancy{round = Round} =
                                       QuestPregnancy,
                                   {true, [{2, Round}], []};
                               25 ->
                                   #quest_acquaintance{round = Round} =
                                       QuestAcq,
                                   {true, [{2, Round}], []};
                               29 ->
                                   #quest_single_dog{round = Round} =
                                       QuestSingleDog,
                                   {true, [{2, Round}], []};
                               _ -> {false, [], []}
                           end,
    case Flag of
        true ->
            {true,
             #quest_stats{sec_type = Type, stats = Stats,
                          desc = Array}};
        other ->
            {other,
             #quest_stats{sec_type = Type, stats = Stats,
                          desc = Array}};
        _ -> false
    end.

check_commit(13, _Quest, _QuestData, _Role) -> true;
check_commit(10, _Quest, _QuestData, _Role) -> true;
check_commit(31, _Quest, _QuestData, _Role) -> true;
check_commit(33, _Quest, _QuestData, _Role) -> true;
check_commit(35, _Quest, _QuestData, Role) ->
    camp_long_active:check_commit(Role);
check_commit(_SecType, _Quest, _QuestData,
             #role{m_combat = #m_combat{pid = ComPid}})
    when is_pid(ComPid) ->
    {error, combat};
check_commit(3, Quest, QuestData, Role) ->
    quest_offer:check_commit(Quest, QuestData, Role);
check_commit(14, _Quest, _QuestData, Role) ->
    quest_chain:check_world_lev(Role);
check_commit(15, _Quest, _QuestData, Role) ->
    quest_marriage:check_commit(Role);
check_commit(16, _Quest, _QuestData, Role) ->
    quest_couple:check_commit(Role);
check_commit(18, _Quest, _QuestData, Role) ->
    quest_teacher:check_commit(Role);
check_commit(21, _Quest, _QuestData, Role) ->
    quest_pursue:check_commit(Role);
check_commit(23, _Quest, _QuestData, Role) ->
    quest_child:check_commit(Role);
check_commit(24, _Quest, _QuestData, Role) ->
    quest_pregnancy:check_commit(Role);
check_commit(25, _Quest, _QuestData, Role) ->
    quest_acquaintance:check_commit(Role);
check_commit(_SecType, _Quest, _Data, _Role) -> true.

dynamic_commit_loss(4, Quest, Data, Role) ->
    quest_classes:dynamic_commit_loss(Quest, Data, Role);
dynamic_commit_loss(12, Quest, Data, Role) ->
    quest_guild:dynamic_commit_loss(Quest, Data, Role);
dynamic_commit_loss(14, Quest, Data, Role) ->
    quest_chain:dynamic_commit_loss(Quest, Data, Role);
dynamic_commit_loss(21, Quest, Data, Role) ->
    quest_pursue:dynamic_commit_loss(Quest, Data, Role);
dynamic_commit_loss(23, Quest, Data, Role) ->
    quest_child:dynamic_commit_loss(Quest, Data, Role);
dynamic_commit_loss(24, Quest, Data, Role) ->
    quest_pregnancy:dynamic_commit_loss(Quest, Data, Role);
dynamic_commit_loss(25, Quest, Data, Role) ->
    quest_acquaintance:dynamic_commit_loss(Quest,
                                           Data,
                                           Role);
dynamic_commit_loss(_SecType, _Quest,
                    #quest_data{commit_loss = Loss}, _Role) ->
    Loss.

notice_reward(#quest_data{sec_type = 17}, _Quest, _SucL,
              MsgArgs, Role) ->
    quest_plant:notice_commit_reward(Role, MsgArgs),
    ok;
notice_reward(#quest_data{sec_type = 14}, _Quest, _SucL,
              MsgArgs, Role) ->
    quest_chain:reward_hearsay(Role, MsgArgs),
    ok;
notice_reward(_QuestData, _Quest, _SucL, _MsgArgs,
              _Role) ->
    ok.

team_reward(Role, #quest_data{sec_type = 17}, Args) ->
    quest_plant:team_reward(Role, Args),
    ok;
team_reward(_, _, _) -> ok.

special_reward(#quest_data{sec_type = 18}, SucL,
               #role{id = SelfId,
                     m_teacher = #m_teacher{id = TeacherId},
                     m_quest =
                         #m_quest{quest_teacher =
                                      #quest_teacher{partner_id =
                                                         PartnerId}}}) ->
    case lists:keyfind(teacher_score, #gain.label, SucL) of
        #gain{val = Val} ->
            {NewTeacherId, StudentId} = case PartnerId =:= TeacherId
                                            of
                                            true -> {PartnerId, SelfId};
                                            false -> {SelfId, PartnerId}
                                        end,
            teacher:update_student_score(NewTeacherId,
                                         StudentId,
                                         [{90019, Val}]),
            ok;
        _ -> ok
    end;
special_reward(_Data, _SucL, _Role) -> ok.

auto_del_quest(Quest = #quest{sec_type = 3},
               Role = #role{m_quest =
                                MQuest = #m_quest{quest_offer = QOffer}}) ->
    logger:debug("删除悬赏任务", [], quest, 1698),
    notice_del_quest(Quest, Role),
    QOfferRole = Role#role{m_quest =
                               MQuest#m_quest{quest_offer =
                                                  QOffer#quest_offer{round = 0,
                                                                     quest_id =
                                                                         0}}},
    del_quest(Quest, QOfferRole);
auto_del_quest(Quest, Role) ->
    notice_del_quest(Quest, Role),
    del_quest(Quest, Role).

notice_del_quest(#quest{sec_type = 3}, Role) ->
    Msg = notice:format(lang:get("您在~ts内未完成悬赏， 任务消失了"),
                        [{string_2, 6, "40分钟"}]),
    notice:send(Role, 3, Msg);
notice_del_quest(_Quest, _Role) -> ok.

