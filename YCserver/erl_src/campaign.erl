-file("src/mod/campaign/campaign.erl", 1).

-module(campaign).

-export([fire/2,
         init/0,
         zero_flush/2,
         five_flush/2,
         push_ico/1,
         push_camp/1,
         push_camp/2,
         reward/2,
         get_can_reward_num/2,
         get_had_reward_num/2,
         get_can_max_reward_num/2,
         get_acc_val/2,
         parse_items/3,
         list_cli_camp/1,
         first_charge_double/2,
         push/2,
         login/1,
         gm_clear/1,
         do_cli_camp/3,
         del_camp/3,
         del_camp_all/2]).

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

-file("src/mod/campaign/campaign.erl", 34).

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

-file("src/mod/campaign/campaign.erl", 35).

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

-file("src/mod/campaign/campaign.erl", 36).

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

-file("src/mod/campaign/campaign.erl", 37).

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

-file("src/mod/campaign/campaign.erl", 38).

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

-file("src/mod/campaign/campaign.erl", 39).

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

-file("src/mod/campaign/campaign.erl", 40).

-file("inc/condition.hrl", 1).

-record(condition,
        {label :: undefined | atom(),
         op = eq ::
             ue | eq | lt | gt | le | ge | range | include,
         val :: undefined | term(),
         msg = "" :: list()}).

-file("src/mod/campaign/campaign.erl", 41).

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

-file("src/mod/campaign/campaign.erl", 42).

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

-file("src/mod/campaign/campaign.erl", 43).

init() ->
    #m_campaign{hide_seek = camp_hide_seek:init(),
                login_roll = camp_login_roll:init(),
                recharge = camp_series_recharge:init(),
                recharge_open = camp_series_recharge_open:init(),
                camp_sign = camp_sign:init(),
                camp_exchange = camp_exchange:init(),
                camp_animal_chess = camp_animal_chess_mgr:init(),
                camp_new_flop = #camp_new_flop{}}.

login(Role = #role{id = _RId, name = _Name,
                   m_campaign =
                       MCamp = #m_campaign{acc = AccL, can_reward = CanRewardL,
                                           rewarded = Rewarded,
                                           first_charge_double =
                                               FirstChargeDouble,
                                           multiplex_assert = MulFlag},
                   assets = Assets}) ->
    Now = date:unixtime(),
    NewAccL = merge_clear_zero(AccL, Now, []),
    NewCanRewardL = merge_clear_zero(CanRewardL, Now, []),
    NewRewarded = merge_clear_zero(Rewarded, Now, []),
    NewFirstChargeDouble = [I
                            || I = {_, FTime} <- FirstChargeDouble,
                               FTime >=
                                   date:datetime_to_seconds({{2016, 1, 1},
                                                             {1, 1, 1}})
                                   andalso
                                   Now >=
                                       date:datetime_to_seconds({{2016, 1, 1},
                                                                 {1, 1, 1}})],
    NewRole = Role#role{m_campaign =
                            NMCamp = MCamp#m_campaign{acc = NewAccL,
                                                      can_reward =
                                                          NewCanRewardL,
                                                      rewarded = NewRewarded,
                                                      first_charge_double =
                                                          NewFirstChargeDouble}},
    campaign:push_camp(NewRole),
    NRole = case MulFlag of
                25 -> NewRole;
                _ ->
                    NewAssets = clean_campaign_assets([#assets.panda_score],
                                                      Assets),
                    NewRole#role{assets = NewAssets,
                                 m_campaign =
                                     NMCamp#m_campaign{multiplex_assert = 25}}
            end,
    {ok, NRole}.

del_camp_all(CampId, Time) ->
    role_group:apply(world,
                     {campaign, del_camp, [CampId, Time]}).

del_camp(Role = #role{m_campaign =
                          MCamp = #m_campaign{rewarded = Reward}},
         CampId, Time) ->
    case lists:keyfind(CampId, 1, Reward) of
        {_, CampTime, _} when CampTime < Time ->
            NewMC = MCamp#m_campaign{rewarded =
                                         lists:keydelete(CampId, 1, Reward)},
            NewRole = Role#role{m_campaign = NewMC},
            {ok, NewRole};
        _ -> ok
    end.

clean_campaign_assets([], Assets) -> Assets;
clean_campaign_assets([AssetsLabel | Rest], Assets)
    when is_integer(AssetsLabel) ->
    NewAssets = erlang:setelement(AssetsLabel, Assets, 0),
    clean_campaign_assets(Rest, NewAssets);
clean_campaign_assets([_ | Rest], Assets) ->
    clean_campaign_assets(Rest, Assets).

zero_flush(Role = #role{id = _RId, name = _Name,
                        m_campaign =
                            MCamp = #m_campaign{acc = AccL,
                                                can_reward = CanRewardL,
                                                rewarded = Rewarded,
                                                multiplex_assert = MulFlag},
                        assets = Assets},
           Now) ->
    NewAccL = clear_zero(AccL, Now, []),
    NewCanRewardL = clear_zero(CanRewardL, Now, []),
    NewRewarded = clear_zero(Rewarded, Now, []),
    NewRole1 = Role#role{m_campaign =
                             NMCamp = MCamp#m_campaign{acc = NewAccL,
                                                       can_reward =
                                                           NewCanRewardL,
                                                       rewarded = NewRewarded}},
    NewRole = case MulFlag of
                  25 -> NewRole1;
                  _ ->
                      NewAssets = clean_campaign_assets([#assets.panda_score],
                                                        Assets),
                      NewRole1#role{assets = NewAssets,
                                    m_campaign =
                                        NMCamp#m_campaign{multiplex_assert =
                                                              25}}
              end,
    campaign:push_camp(NewRole),
    {ok, NewRole}.

clear_zero([], _Now, L) -> L;
clear_zero([I = {Id, Time, _Info} | T], Now, L) ->
    case campaign_data:get(Id) of
        #camp_cfg{settlement = 1} -> clear_zero(T, Now, L);
        #camp_cfg{start_time = {week, _, _},
                  end_time = {week, _, _}} ->
            case campaign_mgr:lookup_camp(Id) of
                #camp_cache{is_srv_open = 1, start_time = StartT,
                            end_time = EndT}
                    when StartT =< Now andalso Now < EndT ->
                    clear_zero(T, Now, [I | L]);
                _ -> clear_zero(T, Now, L)
            end;
        #camp_cfg{} -> clear_zero(T, Now, [I | L]);
        _ when Now - Time >= 864000 -> clear_zero(T, Now, L);
        _ -> clear_zero(T, Now, [I | L])
    end.

merge_clear_zero([], _Now, L) -> L;
merge_clear_zero([I = {Id, Time, _Info} | T], Now, L) ->
    case campaign_data:get(Id) of
        #camp_cfg{start_time = {merge_time, _, _},
                  end_time = {merge_time, _, _}} ->
            case campaign_mgr:lookup_camp(Id) of
                #camp_cache{is_srv_open = 1, start_time = StartT,
                            end_time = EndT}
                    when StartT =< Now andalso
                             Now < EndT andalso Time < StartT ->
                    merge_clear_zero(T, Now, L);
                #camp_cache{is_srv_open = 1, start_time = StartT,
                            end_time = EndT}
                    when StartT =< Now andalso Now < EndT ->
                    merge_clear_zero(T, Now, [I | L]);
                _ when Now - Time >= 3 * 86400 ->
                    merge_clear_zero(T, Now, L);
                _ -> merge_clear_zero(T, Now, [I | L])
            end;
        _ -> merge_clear_zero(T, Now, [I | L])
    end.

gm_clear(Role = #role{m_campaign =
                          MCamp = #m_campaign{acc = AccL,
                                              can_reward = CanRewardL,
                                              rewarded = Rewarded}}) ->
    ExIds = [2001, 2002, 2003, 2004, 2005, 2006, 2007],
    AccL1 = [{Id, Time, _Info}
             || {Id, Time, _Info} <- AccL,
                lists:member(Id, ExIds) =:= false],
    CanRewardL1 = [{Id, Time, _Info}
                   || {Id, Time, _Info} <- CanRewardL,
                      lists:member(Id, ExIds) =:= false],
    Rewarded1 = [{Id, Time, _Info}
                 || {Id, Time, _Info} <- Rewarded,
                    lists:member(Id, ExIds) =:= false],
    MCamp1 = MCamp#m_campaign{acc = AccL1,
                              can_reward = CanRewardL1, rewarded = Rewarded1},
    {ok, Role#role{m_campaign = MCamp1}}.

five_flush(Role = #role{m_campaign =
                            MCamp = #m_campaign{acc = AccL,
                                                can_reward = CanRewardL,
                                                rewarded = Rewarded}},
           Now) ->
    NewAccL = clear_five(AccL, Now, []),
    NewCanRewardL = clear_five(CanRewardL, Now, []),
    NewRewarded = clear_five(Rewarded, Now, []),
    NewRole = Role#role{m_campaign =
                            MCamp#m_campaign{acc = NewAccL,
                                             can_reward = NewCanRewardL,
                                             rewarded = NewRewarded}},
    campaign:push_camp(NewRole),
    {ok, NewRole}.

clear_five([], _Now, L) -> L;
clear_five([I = {Id, Time, _Info} | T], Now, L) ->
    case campaign_data:get(Id) of
        #camp_cfg{settlement = 3} -> clear_five(T, Now, L);
        #camp_cfg{} -> clear_five(T, Now, [I | L]);
        _ when Now - Time >= 864000 -> clear_five(T, Now, L);
        _ -> clear_five(T, Now, [I | L])
    end.

-spec push_ico(#role{}) -> ok.

push_ico(Role) ->
    role:link_send(Role, 14003, {campaign_mgr:cli_ico()}),
    ok.

-spec push_camp(#role{}) -> ok.

push_camp(Role = #role{m_campaign =
                           #m_campaign{camp_charge_seven_gift =
                                           #camp_charge_seven_gift{buy_time =
                                                                       0}}}) ->
    Data = list_cli_camp(Role),
    logger:debug("玩家活动列表:~w", [Data], campaign, 193),
    role:link_send(Role, 14000, {Data}),
    ok;
push_camp(Role = #role{m_campaign =
                           #m_campaign{camp_charge_seven_gift =
                                           #camp_charge_seven_gift{id = CampId,
                                                                   buy_time =
                                                                       BuyTime}}}) ->
    Data = list_cli_camp(Role),
    case camp_charge_seven_gift:get_charge_day(BuyTime) of
        0 ->
            logger:debug("玩家活动列表:~w", [Data], campaign, 200),
            role:link_send(Role, 14000, {Data});
        _ ->
            NData = [{CampId, 0, 0, 0, 0, 0, 0} | Data],
            logger:debug("玩家活动列表:~w", [NData], campaign, 204),
            role:link_send(Role, 14000, {NData})
    end,
    ok.

push(Role = #role{m_campaign =
                      #m_campaign{first_charge_double = FirstChargeDouble}},
     14019) ->
    Data = {date:datetime_to_seconds({{2028, 1, 1},
                                      {1, 1, 1}}),
            FirstChargeDouble},
    role:link_send(Role, 14019, Data),
    ok.

first_charge_double(Role = #role{m_campaign =
                                     MCamp = #m_campaign{first_charge_double =
                                                             FirstChargeDouble}},
                    Gold) ->
    Now = date:unixtime(),
    case Now >=
             date:datetime_to_seconds({{2028, 1, 1}, {1, 1, 1}})
        of
        true ->
            case lists:keyfind(Gold, 1, FirstChargeDouble) of
                {_, _} -> {Role, 0};
                _ ->
                    case recharge_data:gold({Gold, "xcqy", 1}) of
                        false -> {Role, 0};
                        GoldLev when is_integer(GoldLev) andalso GoldLev > 0 ->
                            Role1 = Role#role{m_campaign =
                                                  MCamp#m_campaign{first_charge_double
                                                                       =
                                                                       [{Gold,
                                                                         Now}
                                                                        | FirstChargeDouble]}},
                            push(Role1, 14019),
                            {Role1, Gold};
                        _ -> {Role, 0}
                    end
            end;
        _ -> {Role, 0}
    end.

-spec push_camp(#role{},
                [tuple()] | [pos_integer()]) -> ok.

push_camp(Role, CampL) ->
    case list_cli_camp(Role, CampL) of
        List = [_ | _] -> role:link_send(Role, 14002, {List});
        _ -> skip
    end,
    ok.

-spec list_cli_camp(#role{}) -> [tuple()].

list_cli_camp(Role) ->
    CampL = campaign_mgr:camp(),
    list_cli_camp(Role, CampL).

list_cli_camp(Role, CampL) ->
    cli_camp(CampL,
             #campaign_handle{time = date:unixtime()},
             Role,
             []).

cli_camp([], _Handle, _Role, L) -> L;
cli_camp([Id | T], Handle, Role, L)
    when is_integer(Id) ->
    case campaign_mgr:lookup_camp(Id) of
        false -> cli_camp(T, Handle, Role, L);
        Camp ->
            NewL = to_cli_camp(Handle#campaign_handle{camp =
                                                          campaign_data:get(Camp#camp_cache.id),
                                                      camp_info = Camp},
                               Role,
                               L),
            cli_camp(T, Handle, Role, NewL)
    end;
cli_camp([Camp | T], Handle, Role, L) ->
    NewL = to_cli_camp(Handle#campaign_handle{camp =
                                                  campaign_data:get(Camp#camp_cache.id),
                                              camp_info = Camp},
                       Role,
                       L),
    cli_camp(T, Handle, Role, NewL).

to_cli_camp(Handle, Role, L) ->
    case campaign_cond:check_opening(Role, Handle) of
        true -> do_cli_camp(Handle, Role, L);
        _ -> L
    end.

do_cli_camp(#campaign_handle{camp =
                                 #camp_cfg{id = Id, sec_type = 60001}},
            _Role, L) ->
    [{Id, 0, 0, 0, 0, 0, 0} | L];
do_cli_camp(#campaign_handle{camp =
                                 #camp_cfg{id = Id, type = 5,
                                           sec_type = SecType}},
            _Role, L) ->
    case campaign_rank:check_open_time(SecType) of
        true -> [{Id, 0, 0, 0, 0, 0, 0} | L];
        _ -> L
    end;
do_cli_camp(#campaign_handle{camp =
                                 #camp_cfg{id = Id, reward_type = 99}},
            _Role, L) ->
    [{Id, 0, 0, 0, 0, 0, 0} | L];
do_cli_camp(#campaign_handle{camp =
                                 #camp_cfg{id = Id, camp_cond = undefined}},
            _Role, L) ->
    [{Id, 0, 0, 0, 0, 0, 0} | L];
do_cli_camp(Handle = #campaign_handle{camp =
                                          #camp_cfg{id = Id}},
            Role, L) ->
    RewardCan = get_can_max_reward_num(Role, Handle),
    Status = case RewardCan =< 0 of
                 true -> 2;
                 _ ->
                     case campaign_cond:check(Role, Handle) of
                         true -> 1;
                         {ok, _Role, _Handle} -> 1;
                         _ -> 0
                     end
             end,
    {Value, TarVal, ExtVal} = get_prog_val(Role, Handle),
    RewardMax = get_max_reward_num(Handle),
    [{Id,
      Status,
      Value,
      TarVal,
      ExtVal,
      RewardMax,
      RewardCan}
     | L];
do_cli_camp(#campaign_handle{camp_info =
                                 #camp_cache{id = Id}},
            _Role, L) ->
    campaign_mgr:info({reload_camp, Id}),
    L.

fire(Evt = #evt_cli_loaded{}, Role) ->
    do_event(Evt, Role);
fire(Evt = #evt_online_time{}, Role) ->
    do_event(Evt, Role);
fire(Evt = #evt_levup{}, Role) -> do_event(Evt, Role);
fire(Evt = #evt_friend{}, Role) -> do_event(Evt, Role);
fire(Evt = #evt_eqm{}, Role) -> do_event(Evt, Role);
fire(Evt = #evt_pet{}, Role) -> do_event(Evt, Role);
fire(Evt = #evt_arena_win{}, Role) ->
    do_event(Evt, Role);
fire(Evt = #evt_pay{}, Role) -> do_event(Evt, Role);
fire(Evt = #evt_activity{}, Role) ->
    do_event(Evt, Role);
fire(Evt = #evt_consume{}, Role) -> do_event(Evt, Role);
fire(_Evt, Role) -> Role.

do_event(Evt, Role) ->
    case campaign_mgr:srv_camp() of
        [] -> Role;
        CampL ->
            Now = date:unixtime(),
            CampList = util:keys_sort([{asc, #camp_cache.sec_type}],
                                      CampL),
            {NewRole, Handle} = evt_camp(CampList,
                                         Role,
                                         #campaign_handle{time = Now, evt = Evt,
                                                          call_from = evt}),
            case Handle of
                #campaign_handle{push_list = PushList = [_ | _]} ->
                    role:link_send(Role, 14002, {PushList});
                _ -> skip
            end,
            NewRole
    end.

evt_camp([], Role, Handle) -> {Role, Handle};
evt_camp([Camp = #camp_cache{id = CampId} | T], Role,
         Handle) ->
    Handle1 = Handle#campaign_handle{camp =
                                         campaign_data:get(CampId),
                                     camp_info = Camp, add_can_reward = 0,
                                     push_cli = 0},
    case do_handle([check_evt,
                    opening,
                    calc_acc,
                    condition,
                    check_reward,
                    evt_reward],
                   Role,
                   Handle1)
        of
        {ok,
         NewRole,
         NewHandle = #campaign_handle{push_cli = 1,
                                      push_list = PushList,
                                      camp = #camp_cfg{}}} ->
            NewPushList = case do_cli_camp(NewHandle, NewRole, [])
                              of
                              [CliCamp] -> [CliCamp | PushList];
                              _ -> PushList
                          end,
            evt_camp(T,
                     NewRole,
                     NewHandle#campaign_handle{push_list = NewPushList});
        {ok, NewRole, NewHandle = #campaign_handle{}} ->
            evt_camp(T, NewRole, NewHandle);
        {false, _Reason} -> evt_camp(T, Role, Handle)
    end.

check_rpc_reward(#camp_cfg{reward_type = 1}) -> true;
check_rpc_reward(#camp_cfg{reward_type = 3}) -> true;
check_rpc_reward(#camp_cfg{reward = []}) -> true;
check_rpc_reward(_Camp) -> {false, lang:get("不存在的奖励")}.

reward(Role = #role{name = Name}, Id) ->
    logger:debug("领取活动奖励:~w", [Id], campaign, 387),
    case campaign_mgr:lookup_camp(Id) of
        Camp = #camp_cache{is_srv_open = 1} ->
            case do_handle([rpc_reward_type,
                            opening,
                            condition,
                            check_reward,
                            role_cond,
                            rpc_reward],
                           Role,
                           #campaign_handle{rpc_reward_num = 1,
                                            camp =
                                                campaign_data:get(Camp#camp_cache.id),
                                            camp_info = Camp,
                                            time = date:unixtime()})
                of
                {ok, NewRole, Handle} ->
                    case do_cli_camp(Handle, NewRole, []) of
                        [CliCamp] ->
                            Nexts = list_cli_camp(NewRole, get_next_ids(Id)),
                            logger:debug("下发活动后续活动:~w", [Nexts], campaign, 395),
                            role:link_send(Role, 14002, {[CliCamp | Nexts]});
                        _ -> skip
                    end,
                    case Handle of
                        #campaign_handle{camp =
                                             #camp_cfg{sec_type = 10002,
                                                       id = 1}} ->
                            AnnStr =
                                notice:format(lang:get("~ts在首充奖励中获得了~ts和一大堆~ts，真让人羡慕{face_1,3}"),
                                              [{role_2, Name},
                                               {item_2, 20097},
                                               {string_2,
                                                1,
                                                lang:get("珍稀道具")}]),
                            notice:cast(all, 6, AnnStr),
                            ok;
                        _ -> ok
                    end,
                    {ok, NewRole};
                {false, Reason} -> {false, Reason}
            end;
        _ -> {false, lang:get("活动不存在")}
    end.

do_handle([], Role, Handle) -> {ok, Role, Handle};
do_handle([Label | T], Role,
          Handle = #campaign_handle{call_from = CallFrom,
                                    camp = Camp}) ->
    case catch do_handle(Label, Role, Handle) of
        true -> do_handle(T, Role, Handle);
        false -> {false, ""};
        {ok, NewRole, NewHandle} ->
            do_handle(T, NewRole, NewHandle);
        {false, _Reason} when CallFrom =:= evt ->
            {ok, Role, Handle};
        {false, Reason} -> {false, Reason};
        {false, _Reason, NewHandle} when CallFrom =:= evt ->
            {ok, Role, NewHandle};
        {false, Reason, _NewHandle} -> {false, Reason};
        {break, NewRole, NewHandle} -> {ok, NewRole, NewHandle};
        {NewRole = #role{}, NewHandle = #campaign_handle{}} ->
            do_handle(T, NewRole, NewHandle);
        _Err ->
            logger:error("处理活动[~w:~w]出错:~w",
                         [Label, Camp, _Err],
                         campaign,
                         443),
            {false, lang:get("无法处理的活动")}
    end;
do_handle(check_evt, _Role,
          #campaign_handle{evt = Evt, camp = Camp}) ->
    check_evt(Evt, Camp);
do_handle(rpc_reward_type, _Role,
          #campaign_handle{camp = Camp}) ->
    check_rpc_reward(Camp);
do_handle(opening, Role, Handle) ->
    campaign_cond:check_opening(Role, Handle);
do_handle(calc_acc, Role, Handle) ->
    update_acc(Role, Handle);
do_handle(condition, Role, Handle) ->
    case campaign_cond:check(Role, Handle) of
        true -> {ok, Role, Handle};
        false ->
            logger:debug("条件未达成:~w", [Handle], campaign, 460),
            {false, lang:get("条件未达成")};
        Ret ->
            logger:debug("条件未达成:~w", [Ret], campaign, 463),
            Ret
    end;
do_handle(role_cond, Role,
          Handle = #campaign_handle{camp =
                                        #camp_cfg{cond_reward = CondReward}}) ->
    case role_cond:check(CondReward, Role) of
        true -> {ok, Role, Handle};
        false -> {false, lang:get("条件未达成")};
        {false, #condition{msg = Msg}} -> {false, Msg}
    end;
do_handle(check_reward, Role,
          Handle = #campaign_handle{return_acc = ReturnAcc}) ->
    case get_can_max_reward_num(Role, Handle) > 0 of
        true -> {ok, Role, Handle};
        _ when ReturnAcc =:= 1 ->
            {false, lang:get("奖励已领取"), Handle};
        _ ->
            {false,
             lang:get("奖励已领取"),
             Handle#campaign_handle{push_cli = 0}}
    end;
do_handle(evt_reward, TRole = #role{id = RoleId},
          Handle = #campaign_handle{camp =
                                        #camp_cfg{sec_type = SecType,
                                                  reward = Items,
                                                  camp_cond = CampCond,
                                                  reward_title = Title,
                                                  reward_content = Content,
                                                  id = Key, type = CampType,
                                                  reward_type = 2},
                                    add_can_reward = AddCanReward,
                                    evt = Evt}) ->
    RewardNum = max(1, AddCanReward),
    {TItems, Role} = case SecType of
                         10005 ->
                             case {CampCond, Evt} of
                                 {{_, _, Radio, 2},
                                  #evt_pay{gold = Gold, sn = Sn}} ->
                                     {[{90026, util:ceil(Gold * Radio / 1000)}],
                                      var:set_var(TRole, other, 2041, Sn)};
                                 {{_, _, Radio, _},
                                  #evt_pay{gold = Gold, sn = Sn}} ->
                                     {[{90002, util:ceil(Gold * Radio / 1000)}],
                                      var:set_var(TRole, other, 2041, Sn)};
                                 _ -> {[], TRole}
                             end;
                         10006 ->
                             case {CampCond, Evt} of
                                 {{_, _, Radio, 2},
                                  #evt_pay{gold = Gold, sn = Sn}} ->
                                     {[{90012, util:ceil(Gold * Radio / 1000)}],
                                      var:set_var(TRole, other, 2041, Sn)};
                                 {{_, _, Radio, _},
                                  #evt_pay{gold = Gold, sn = Sn}} ->
                                     {[{90002, util:ceil(Gold * Radio / 1000)}],
                                      var:set_var(TRole, other, 2041, Sn)};
                                 _ -> {[], TRole}
                             end;
                         _ -> {Items, TRole}
                     end,
    Items1 = parse_items(TItems, Role, []),
    Items2 = [{BaseId, Bind, Val * RewardNum}
              || {BaseId, Bind, Val} <- Items1],
    case SecType of
        10001 ->
            notice:return(notice:format(lang:get("恭喜你触发~ts活动，获得~ts"),
                                        [{string_2, 5, Title},
                                         {item_2, Items2}]));
        10005 ->
            notice:return(notice:format(lang:get("恭喜你触发~ts活动，获得~ts, 请在邮箱内领取"),
                                        [{string_2, 5, Title},
                                         {item_2, Items2}]));
        10006 ->
            notice:return(notice:format(lang:get("恭喜你触发~ts活动，获得~ts"),
                                        [{string_2, 5, Title},
                                         {item_2, Items2}]));
        _ -> ignore
    end,
    fun_call:exec(mail,
                  send,
                  [RoleId,
                   #{items => Items2, title => Title,
                     content =>
                         notice:replace_msg([{"#role#", [{role_2, Role}]},
                                             {"#item#", [{item_2, Items2}]}],
                                            Content)}]),
    NRole = role_trigger:fire(#evt_campaign_reward{id = Key,
                                                   type = CampType,
                                                   sec_type = SecType},
                              Role),
    acc_rewarded_num(NRole,
                     Handle#campaign_handle{push_cli = 1},
                     RewardNum);
do_handle(evt_reward, Role, Handle) ->
    acc_can_reward_num(Role, Handle);
do_handle(rpc_reward, Role,
          Handle = #campaign_handle{rpc_reward_num = RpcRewardNum,
                                    camp =
                                        #camp_cfg{name = CampName,
                                                  type = CampType,
                                                  sec_type = CampSecType,
                                                  loss_items = LossItems0,
                                                  id = Key,
                                                  auto_buy = AutoBuy}}) ->
    logger:debug("领取活动奖励:~w", [Key], campaign, 527),
    {Items1, Args} = filter_reward(Handle, #{}),
    RewardNum = min(max(RpcRewardNum,
                        get_can_reward_num(Role, Handle)),
                    get_can_max_reward_num(Role, Handle)),
    Items = parse_items(Items1, Role, []),
    LossItems = [{BaseId, Num * RewardNum}
                 || {BaseId, Num} <- LossItems0],
    NewItems = [{BaseId, Bind, Num * RewardNum}
                || {BaseId, Bind, Num} <- Items],
    LossL = format:val_to_loss(LossItems,
                               #{item_base_id_auto_buy => AutoBuy,
                                 auto_scene => lang:get("领取奖励")}),
    GainL = format:val_to_gain(NewItems),
    GL = LossL ++ GainL,
    case CampType =:= 4 andalso
             (CampSecType =:= 40003 orelse CampSecType =:= 40008)
        of
        true ->
            case role_gain:do(GL, Role) of
                {false, #loss{msg = Msg}} -> {false, Msg};
                {false, #gain{msg = Msg}} -> {false, Msg};
                {ok,
                 Role1 = #role{m_campaign =
                                   MCampWeb = #m_campaign{can_reward =
                                                              CanRewardL}}} ->
                    Role2 = role_trigger:fire(#evt_campaign_reward{id = Key,
                                                                   type =
                                                                       CampType,
                                                                   sec_type =
                                                                       CampSecType},
                                              Role1#role{m_campaign =
                                                             MCampWeb#m_campaign{can_reward
                                                                                     =
                                                                                     lists:keydelete(Key,
                                                                                                     1,
                                                                                                     CanRewardL)}}),
                    case CampSecType =:= 40008 of
                        true ->
                            RewardBaseId = case Args of
                                               #{reward_id := _RewardId} ->
                                                   _RewardId;
                                               _ -> 0
                                           end,
                            logger:debug("推送抽奖结果:~w",
                                         [RewardBaseId],
                                         campaign,
                                         551),
                            role:link_send(Role2, 14098, {Key, RewardBaseId});
                        _ ->
                            case NewItems of
                                [] -> ok;
                                _ ->
                                    case lists:member(Key,
                                                      [1001,
                                                       1002,
                                                       1003,
                                                       1004,
                                                       1005,
                                                       1006,
                                                       1007,
                                                       1008])
                                        of
                                        true ->
                                            Msg =
                                                notice:format(lang:get("你在幸运转盘中获得~ts"),
                                                              [{item_2,
                                                                NewItems}]),
                                            notice:send(Role, 7, Msg);
                                        _ -> ok
                                    end
                            end,
                            ok
                    end,
                    log:camp(Role, Role2, LossItems, NewItems, Handle),
                    acc_rewarded_num(Role2, Handle, RewardNum)
            end;
        false ->
            Notice = case CampName of
                         "" -> lang:get("活动奖励");
                         _ -> CampName
                     end,
            case role_gain:do_notice(GL, Role, Notice) of
                {false, #loss{msg = Msg}} -> {false, Msg};
                {false, #gain{msg = Msg}} -> {false, Msg};
                {ok,
                 Role1 = #role{m_campaign =
                                   MCampWeb = #m_campaign{can_reward =
                                                              CanRewardL}}} ->
                    Role2 = role_trigger:fire(#evt_campaign_reward{id = Key,
                                                                   type =
                                                                       CampType,
                                                                   sec_type =
                                                                       CampSecType},
                                              Role1#role{m_campaign =
                                                             MCampWeb#m_campaign{can_reward
                                                                                     =
                                                                                     lists:keydelete(Key,
                                                                                                     1,
                                                                                                     CanRewardL)}}),
                    log:camp(Role, Role2, LossItems, NewItems, Handle),
                    acc_rewarded_num(Role2, Handle, RewardNum)
            end
    end.

check_evt(_Evt, #camp_cfg{reward_type = 99}) -> false;
check_evt(_Evt, #camp_cfg{settlement = 99}) -> false;
check_evt(#evt_cli_loaded{},
          #camp_cfg{sec_type = 40001}) ->
    true;
check_evt(#evt_online_time{},
          #camp_cfg{sec_type = 40002}) ->
    true;
check_evt(#evt_online_time{},
          #camp_cfg{sec_type = 40003}) ->
    true;
check_evt(#evt_online_time{},
          #camp_cfg{sec_type = 40008}) ->
    true;
check_evt(#evt_levup{}, #camp_cfg{sec_type = 30001}) ->
    true;
check_evt(#evt_friend{}, #camp_cfg{sec_type = 30002}) ->
    true;
check_evt(#evt_eqm{}, #camp_cfg{sec_type = 30003}) ->
    true;
check_evt(#evt_pet{}, #camp_cfg{sec_type = 30004}) ->
    true;
check_evt(#evt_activity{},
          #camp_cfg{sec_type = 30006}) ->
    true;
check_evt(#evt_activity{},
          #camp_cfg{sec_type = 30009}) ->
    true;
check_evt(#evt_arena_win{},
          #camp_cfg{sec_type = 30005}) ->
    true;
check_evt(#evt_pay{}, #camp_cfg{sec_type = 10002}) ->
    true;
check_evt(#evt_pay{}, #camp_cfg{sec_type = 10001}) ->
    true;
check_evt(#evt_pay{}, #camp_cfg{sec_type = 10005}) ->
    true;
check_evt(#evt_pay{}, #camp_cfg{sec_type = 10006}) ->
    true;
check_evt(#evt_pay{}, #camp_cfg{sec_type = 10003}) ->
    true;
check_evt(#evt_pay{}, #camp_cfg{sec_type = 10004}) ->
    true;
check_evt(#evt_consume{},
          #camp_cfg{sec_type = 20001}) ->
    true;
check_evt(_Evt, _Camp) -> false.

parse_items([], _Role, Items) -> Items;
parse_items([{first_charge_rate, Num} | T],
            Role = #role{charge = Charge}, Items) ->
    parse_items(T,
                Role,
                [{90002, 1, round(Charge * Num / 100)} | Items]);
parse_items([{BaseId, Num} | T], Role, Items) ->
    parse_items(T, Role, [{BaseId, 0, Num} | Items]);
parse_items([{BaseId, Bind, Num} | T], Role, Items) ->
    parse_items(T, Role, [{BaseId, Bind, Num} | Items]);
parse_items([{NeedClasses, NeedSex, BaseId, Num} | T],
            Role = #role{classes = Classes, sex = Sex}, Items)
    when (NeedClasses =:= 0 orelse NeedClasses =:= Classes)
             andalso (NeedSex =:= 2 orelse NeedSex =:= Sex) ->
    parse_items(T, Role, [{BaseId, 0, Num} | Items]);
parse_items([{MinLev,
              MaxLev,
              NeedClasses,
              NeedSex,
              BaseId,
              Num}
             | T],
            Role = #role{classes = Classes, sex = Sex, lev = Lev},
            Items)
    when (NeedClasses =:= 0 orelse NeedClasses =:= Classes)
             andalso
             (NeedSex =:= 2 orelse NeedSex =:= Sex) andalso
                 Lev >= MinLev andalso Lev =< MaxLev ->
    parse_items(T, Role, [{BaseId, 0, Num} | Items]);
parse_items([_ | T], Role, Items) ->
    parse_items(T, Role, Items).

filter_reward(#campaign_handle{camp =
                                   #camp_cfg{type = 4, sec_type = 40008,
                                             reward = Items0}},
              Args) ->
    logger:debug("====:~w", [Items0], campaign, 631),
    case util:rand_list(Items0, 4) of
        {RewardId, BaseId, Num, _Ratio} ->
            {[{BaseId, 0, Num}], Args#{reward_id => RewardId}};
        _ -> {[], Args}
    end;
filter_reward(#campaign_handle{camp =
                                   #camp_cfg{reward = Items}},
              Args) ->
    {Items, Args};
filter_reward(_Err, _Args) ->
    logger:error("过滤奖励错误:~w", [_Err], campaign, 639),
    {[], _Args}.

acc_can_reward_num(Role = #role{m_campaign =
                                    MCamp = #m_campaign{can_reward =
                                                            CanRewardL}},
                   Handle = #campaign_handle{time = Now,
                                             camp =
                                                 #camp_cfg{id = Key,
                                                           sec_type = 30009,
                                                           camp_cond =
                                                               {ModVal}}}) ->
    HadReward = get_had_reward_num(Role, Handle),
    Acc = get_acc_val(Role, Handle),
    TotalCanReward = Acc div ModVal,
    NewCanRewardNum = max(0,
                          min(TotalCanReward - HadReward,
                              get_can_max_reward_num(Role, Handle))),
    case lists:keyfind(Key, 1, CanRewardL) of
        {Key, _, NewCanRewardNum} -> {ok, Role, Handle};
        _ ->
            NewCanRewardL = lists:keystore(Key,
                                           1,
                                           CanRewardL,
                                           {Key, Now, NewCanRewardNum}),
            NewRole = Role#role{m_campaign =
                                    MCamp#m_campaign{can_reward =
                                                         NewCanRewardL}},
            {ok, NewRole, Handle#campaign_handle{push_cli = 1}}
    end;
acc_can_reward_num(Role = #role{m_campaign =
                                    MCamp = #m_campaign{can_reward =
                                                            CanRewardL}},
                   Handle = #campaign_handle{add_can_reward = AddCanReward,
                                             time = Now,
                                             camp = #camp_cfg{id = Key}}) ->
    OldCanReward = get_can_reward_num(Role, Handle),
    NewCanRewardNum = case AddCanReward of
                          0 -> 1;
                          _ ->
                              min(OldCanReward + AddCanReward,
                                  get_can_max_reward_num(Role, Handle))
                      end,
    case lists:keyfind(Key, 1, CanRewardL) of
        {Key, _, NewCanRewardNum} -> {ok, Role, Handle};
        _ ->
            NewCanRewardL = lists:keystore(Key,
                                           1,
                                           CanRewardL,
                                           {Key, Now, NewCanRewardNum}),
            NewRole = Role#role{m_campaign =
                                    MCamp#m_campaign{can_reward =
                                                         NewCanRewardL}},
            {ok, NewRole, Handle#campaign_handle{push_cli = 1}}
    end.

acc_rewarded_num(Role = #role{m_campaign =
                                  MCamp = #m_campaign{rewarded = Rewarded}},
                 Handle = #campaign_handle{camp = Camp, time = Now},
                 N) ->
    Key = get_key(Camp),
    NewRewarded = lists:keystore(Key,
                                 1,
                                 Rewarded,
                                 {Key,
                                  Now,
                                  get_had_reward_num(Role, Handle) + N}),
    NewRole = Role#role{m_campaign =
                            MCamp#m_campaign{rewarded = NewRewarded}},
    update_group_camp(NewRole, Handle),
    {ok, NewRole, Handle}.

update_group_camp(Role,
                  #campaign_handle{camp =
                                       Camp = #camp_cfg{id = Id,
                                                        reward_type = 3,
                                                        group_id = Key}}) ->
    Key = get_key(Camp),
    case campaign_data:get_group(Key) of
        List = [_ | _] ->
            case lists:delete(Id, List) of
                NewList = [_ | _] -> push_camp(Role, NewList);
                _ -> skip
            end;
        _ -> skip
    end;
update_group_camp(_Role, _) -> ok.

get_key(#camp_cfg{reward_type = 3, group_id = Key}) ->
    Key;
get_key(#camp_cfg{id = Key}) -> Key.

update_acc(Role,
           Handle = #campaign_handle{camp =
                                         #camp_cfg{sec_type = 40001}}) ->
    do_update_acc_day(Role, Handle, 1);
update_acc(Role,
           Handle = #campaign_handle{camp =
                                         #camp_cfg{sec_type = 40003},
                                     evt =
                                         #evt_online_time{add_val = AddVal}}) ->
    do_update_acc(Role, Handle, AddVal);
update_acc(Role,
           Handle = #campaign_handle{camp =
                                         #camp_cfg{sec_type = 40008},
                                     evt =
                                         #evt_online_time{add_val = AddVal}}) ->
    do_update_acc(Role, Handle, AddVal);
update_acc(Role,
           Handle = #campaign_handle{camp =
                                         #camp_cfg{sec_type = 10003}}) ->
    {ok, Role, Handle#campaign_handle{push_cli = 1}};
update_acc(Role,
           Handle = #campaign_handle{camp =
                                         #camp_cfg{sec_type = 10002},
                                     evt = #evt_pay{gold = Gold}}) ->
    do_update_acc(Role,
                  Handle#campaign_handle{return_acc = 1},
                  Gold);
update_acc(Role,
           Handle = #campaign_handle{camp =
                                         #camp_cfg{sec_type = 20001},
                                     evt = #evt_consume{gold = Gold}}) ->
    do_update_acc(Role,
                  Handle#campaign_handle{return_acc = 1},
                  Gold);
update_acc(Role,
           Handle = #campaign_handle{camp =
                                         #camp_cfg{sec_type = 30006},
                                     evt = #evt_activity{val = Val}}) ->
    do_update_acc(Role,
                  Handle#campaign_handle{return_acc = 1},
                  Val);
update_acc(Role,
           Handle = #campaign_handle{camp =
                                         #camp_cfg{sec_type = 30009},
                                     evt = #evt_activity{val = Val}}) ->
    do_update_acc(Role,
                  Handle#campaign_handle{return_acc = 1},
                  Val);
update_acc(Role, Handle) -> {ok, Role, Handle}.

do_update_acc(Role = #role{m_campaign =
                               MCamp = #m_campaign{acc = AccL}},
              Handle = #campaign_handle{camp =
                                            #camp_cfg{id = Id,
                                                      settlement = Settle},
                                        time = Now},
              AddVal) ->
    NewAccL = case lists:keyfind(Id, 1, AccL) of
                  false -> [{Id, Now, AddVal} | AccL];
                  {Key, Time, Val} when Settle =:= 1 ->
                      case date:is_today(Time) of
                          true ->
                              lists:keyreplace(Key,
                                               1,
                                               AccL,
                                               {Key, Time, Val + AddVal});
                          false ->
                              lists:keyreplace(Key, 1, AccL, {Key, Now, AddVal})
                      end;
                  {Key, Time, Val} when Settle =:= 3 ->
                      case date:is_today_five_reset(Time) of
                          true ->
                              lists:keyreplace(Key,
                                               1,
                                               AccL,
                                               {Key, Time, Val + AddVal});
                          false ->
                              lists:keyreplace(Key, 1, AccL, {Key, Now, AddVal})
                      end;
                  {Id, Time, Val} ->
                      lists:keyreplace(Id, 1, AccL, {Id, Time, Val + AddVal})
              end,
    {ok,
     Role#role{m_campaign = MCamp#m_campaign{acc = NewAccL}},
     Handle#campaign_handle{push_cli = 1}}.

do_update_acc_day(Role = #role{m_campaign =
                                   MCamp = #m_campaign{acc = AccL}},
                  Handle = #campaign_handle{camp = #camp_cfg{id = Key},
                                            time = Now},
                  AddVal) ->
    Ret = case lists:keyfind(Key, 1, AccL) of
              false -> {1, [{Key, Now, AddVal} | AccL]};
              {Key, Time, Val} ->
                  case date:is_today(Time) of
                      true -> {0, AccL};
                      false ->
                          {1,
                           lists:keyreplace(Key,
                                            1,
                                            AccL,
                                            {Key, Now, AddVal + Val})}
                  end
          end,
    case Ret of
        {1, NewAccL} ->
            {ok,
             Role#role{m_campaign = MCamp#m_campaign{acc = NewAccL}},
             Handle#campaign_handle{push_cli = 1}};
        _ -> false
    end.

get_max_reward_num(#campaign_handle{camp =
                                        #camp_cfg{reward_max = 0}}) ->
    0;
get_max_reward_num(#campaign_handle{camp =
                                        #camp_cfg{reward_max = Max}}) ->
    Max.

get_acc_val(#role{m_guild = MGuild},
            #campaign_handle{camp =
                                 #camp_cfg{id = Id, type = 6}}) ->
    case MGuild of
        #m_guild{id = GId} ->
            case guild_mgr:attr(GId, #guild.guild_camp) of
                #guild_campaign{acc = AccL} ->
                    case lists:keyfind(Id, 1, AccL) of
                        {Id, _Time, N} -> N;
                        _ -> 0
                    end;
                _ -> 0
            end;
        _ -> 0
    end;
get_acc_val(#role{m_campaign = #m_campaign{acc = AccL}},
            #campaign_handle{camp = #camp_cfg{id = Id}}) ->
    case lists:keyfind(Id, 1, AccL) of
        {Id, _Time, Val} -> Val;
        _ -> 0
    end.

get_can_reward_num(#role{m_guild = MGuild},
                   #campaign_handle{camp =
                                        #camp_cfg{id = Id, type = 6}}) ->
    case MGuild of
        #m_guild{id = GId} ->
            case guild_mgr:attr(GId, #guild.guild_camp) of
                #guild_campaign{can_reward = CanReward} ->
                    case lists:keyfind(Id, 1, CanReward) of
                        {Id, _Time, N} -> N;
                        _ -> 0
                    end;
                _ -> 0
            end;
        _ -> 0
    end;
get_can_reward_num(#role{m_campaign =
                             #m_campaign{can_reward = CanReward}},
                   #campaign_handle{camp = #camp_cfg{id = Id}}) ->
    case lists:keyfind(Id, 1, CanReward) of
        {Id, _Time, N} -> N;
        _ -> 0
    end.

get_can_max_reward_num(_Role,
                       #campaign_handle{camp = #camp_cfg{reward_max = 0}}) ->
    0;
get_can_max_reward_num(Role = #role{m_campaign =
                                        #m_campaign{rewarded = Rewarded}},
                       Handle = #campaign_handle{camp =
                                                     #camp_cfg{id = Key,
                                                               reward_max = Max,
                                                               sec_type =
                                                                   SecType},
                                                 evt = Evt}) ->
    case Key of
        1008 ->
            case lists:keyfind(1007, 1, Rewarded) of
                {_, Time, _Val} when Time < 1487559600 -> 0;
                _ -> max(0, Max - get_had_reward_num(Role, Handle))
            end;
        _ ->
            case SecType of
                10006 ->
                    Sn = case Evt of
                             #evt_pay{sn = _Sn} -> _Sn;
                             _ -> undefined
                         end,
                    CampSn = var:get_var(Role, other, 2041, ""),
                    case Sn =:= CampSn of
                        true -> 0;
                        _ -> max(0, Max - get_had_reward_num(Role, Handle))
                    end;
                _ -> max(0, Max - get_had_reward_num(Role, Handle))
            end
    end.

get_had_reward_num(#role{m_campaign =
                             #m_campaign{rewarded = Rewarded}},
                   #campaign_handle{camp = Camp}) ->
    Key = get_key(Camp),
    case lists:keyfind(Key, 1, Rewarded) of
        {Key, _Time, Val} -> Val;
        _ -> 0
    end.

get_prog_val(Role,
             Handle = #campaign_handle{camp =
                                           #camp_cfg{sec_type = 10002,
                                                     camp_cond = {TarVal}}}) ->
    {get_acc_val(Role, Handle), TarVal, 0};
get_prog_val(Role,
             Handle = #campaign_handle{camp =
                                           #camp_cfg{sec_type = 30006,
                                                     camp_cond = {TarVal}}}) ->
    {get_acc_val(Role, Handle), TarVal, 0};
get_prog_val(Role,
             Handle = #campaign_handle{camp =
                                           #camp_cfg{sec_type = 30009,
                                                     camp_cond = {ModVal}}}) ->
    AccVal = get_acc_val(Role, Handle),
    {AccVal, ModVal, 0};
get_prog_val(Role,
             Handle = #campaign_handle{camp =
                                           #camp_cfg{sec_type = 20001,
                                                     camp_cond = {TarVal}}}) ->
    {get_acc_val(Role, Handle), TarVal, 0};
get_prog_val(#role{charge = Charge},
             #campaign_handle{camp =
                                  #camp_cfg{sec_type = 10003,
                                            camp_cond = {TarVal}}}) ->
    {Charge, TarVal, 0};
get_prog_val(Role = #role{m_var =
                              #m_var{last_acc_time = Last}},
             Handle = #campaign_handle{camp =
                                           #camp_cfg{sec_type = 40003,
                                                     camp_cond = {TarVal}}}) ->
    {get_acc_val(Role, Handle), TarVal, Last};
get_prog_val(Role = #role{m_var =
                              #m_var{last_acc_time = Last}},
             Handle = #campaign_handle{camp =
                                           #camp_cfg{sec_type = 40008,
                                                     camp_cond = {TarVal}}}) ->
    {get_acc_val(Role, Handle), TarVal, Last};
get_prog_val(Role = #role{},
             Handle = #campaign_handle{camp =
                                           #camp_cfg{sec_type = 40001,
                                                     camp_cond = {TarVal}}}) ->
    {get_acc_val(Role, Handle), TarVal, 0};
get_prog_val(_Role, _Handle) -> {0, 0, 0}.

get_next_ids(Id) ->
    get_next_ids(campaign_data:all(), Id).

get_next_ids([], _) -> [];
get_next_ids([H | T], Id) ->
    case campaign_data:get(H) of
        #camp_cfg{finish_id = Id} -> [H | get_next_ids(T, Id)];
        _ -> get_next_ids(T, Id)
    end.

