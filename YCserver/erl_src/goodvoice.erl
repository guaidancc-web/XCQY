-file("src/mod/goodvoice/goodvoice.erl", 1).

-module(goodvoice).

-export([submit/4,
         update_voice/3,
         update_summary/2,
         get_song/2,
         do_get_song/2,
         follow/2,
         unfollow/2,
         follow_list/1,
         report/2,
         do_report/2,
         flower/4,
         do_flower/4,
         vote/2,
         do_vote/3,
         get_chat_icon/1,
         login/1,
         play_rank/1,
         get_rank_song/1]).

-file("inc/goodvoice.hrl", 1).

-record(goodvoice,
        {ver = 4,
         role_id = {0, "", 0},
         id = 0,
         platform = "",
         zone_id = 0,
         name = "",
         sex = 0,
         lev = 0,
         classes = 0,
         time = 0,
         summary = "",
         update_time = 0,
         file_name = "",
         liked = 0,
         likers = [],
         flower_likers = [],
         today_flower = 0,
         update_flower = 0,
         caster_num = 0,
         caster = [],
         logs = [],
         only_liked = 0,
         flower = 0}).

-record(goodvoice_report_info,
        {id, time, lev, name, report = []}).

-record(goodvoice_report,
        {id, order, name, lev, time, filename}).

-record(goodvoice_rank,
        {ver = 1,
         role_id = {0, "", 0},
         id = 0,
         platform = "",
         zone_id = 0,
         name = "",
         sex = 0,
         lev = 0,
         classes = 0,
         time = 0,
         summary = "",
         update_time = 0,
         file_name = "",
         liked = 0,
         today_flower = 0,
         update_flower = 0,
         caster_num = 0,
         rank = 0,
         only_liked = 0,
         flower = 0}).

-file("src/mod/goodvoice/goodvoice.erl", 32).

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

-file("src/mod/goodvoice/goodvoice.erl", 33).

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

-file("src/mod/goodvoice/goodvoice.erl", 34).

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

-file("src/mod/goodvoice/goodvoice.erl", 35).

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

-file("src/mod/goodvoice/goodvoice.erl", 36).

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

-file("src/mod/goodvoice/goodvoice.erl", 37).

-file("inc/agenda.hrl", 1).

-record(m_agenda,
        {ver = 1 :: non_neg_integer(),
         progress = [],
         activity = 0 :: non_neg_integer(),
         last_joined = 0 :: non_neg_integer(),
         rewarded = [] :: [non_neg_integer()],
         last_rewarded = 0 :: non_neg_integer(),
         recommends = [] :: list(),
         last_recommended = 0 :: non_neg_integer()}).

-record(agenda_prog,
        {ver = 1,
         id = 0 :: non_neg_integer(),
         joined = 0 :: non_neg_integer(),
         last_joined = 0 :: non_neg_integer()}).

-record(agenda_stat,
        {id = 0 :: non_neg_integer(), joined = 0, finised = 0}).

-record(agenda_stat_role,
        {id = {0, "", 0},
         lev = 0,
         date = {0, 0, 0},
         logs = []}).

-record(m_agenda_week,
        {ver = 1,
         id = 0,
         week_activity = 0 :: non_neg_integer(),
         rewards = [],
         last_add_activity_time = 0}).

-file("src/mod/goodvoice/goodvoice.erl", 38).

-file("inc/chat.hrl", 1).

-record(chat_msg,
        {rid = {0, "", 0} :: non_neg_integer(),
         platform = "" :: binary(),
         zone_id = 0 :: non_neg_integer(),
         channel = 0 :: non_neg_integer(),
         name = "" :: binary(),
         sex = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         msg = "" :: binary(),
         guild_name = "",
         special = [] :: [tuple()]}).

-record(chat_voice,
        {role_id,
         voice = <<>>,
         text = "",
         time = 0,
         channel,
         group_id}).

-record(chat_offline, {id = {0, "", 0}, msgs = []}).

-file("src/mod/goodvoice/goodvoice.erl", 39).

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

-file("src/mod/goodvoice/goodvoice.erl", 40).

get_chat_icon(Role) ->
    case var:get_var(Role, other, 2036, undefined) of
        {Rank, _EndTime} -> [{5, Rank}];
        _ -> []
    end.

login(Role) ->
    case var:get_var(Role, other, 2036, undefined) of
        {Rank, EndTime} ->
            Now = date:unixtime(),
            case EndTime >= Now + 86400 * 90 of
                true ->
                    NewEndTime = Now + 86400 * 90,
                    NewRole = var:set_var(Role,
                                          other,
                                          2036,
                                          {Rank, NewEndTime}),
                    {ok, NewRole};
                false ->
                    case Now >= EndTime of
                        true ->
                            NewRole = var:del_var(Role, other, 2036),
                            {ok, NewRole};
                        _ -> ok
                    end
            end;
        _ -> ok
    end.

get_song(RoleId = {_, P, Z}, CastRoleId) ->
    Result = case role_misc:is_local_role(RoleId) of
                 true -> do_get_song(RoleId, CastRoleId);
                 false ->
                     big_world:call(P,
                                    Z,
                                    goodvoice,
                                    do_get_song,
                                    [RoleId, CastRoleId])
             end,
    case Result of
        {true, SongId, UpdateTime, Bin} ->
            {true, SongId, UpdateTime, Bin};
        {false, Reason} -> {false, Reason};
        _ -> {false, lang:get("跨服时空已断开，无法读取")}
    end.

do_get_song(RoleId, CastRoleId) ->
    case goodvoice_mgr:lookup(RoleId) of
        {true,
         #goodvoice{id = SongId, platform = P, zone_id = Z,
                    file_name = FileName, update_time = UpdateTime}} ->
            File = goodvoice_mgr:base_dir(P, Z) ++ FileName,
            case file:read_file(File) of
                {ok, Bin} ->
                    goodvoice_mgr:cast({cast_song, RoleId, CastRoleId}),
                    {true, SongId, UpdateTime, Bin};
                _Err ->
                    logger:error("无法找到[~w][~ts]语音文件",
                                 [RoleId, File],
                                 goodvoice,
                                 105),
                    {false, lang:get("找不到对应的语音文件")}
            end;
        _ -> {false, lang:get("找不到对应的语音信息")}
    end.

play_rank(RoleId = {_, P, Z}) ->
    Result = case role_misc:is_local_role(RoleId) of
                 true -> get_rank_song(RoleId);
                 false ->
                     big_world:call(P, Z, goodvoice, get_rank_song, [RoleId])
             end,
    case Result of
        {true, SongId, UpdateTime, Bin} ->
            {true, SongId, UpdateTime, Bin};
        {false, Reason} -> {false, Reason};
        _ -> {false, lang:get("跨服时空已断开，无法读取")}
    end.

get_rank_song(RoleId) ->
    case goodvoice_mgr:lookup_rank(RoleId) of
        {true,
         #goodvoice_rank{id = SongId, file_name = FileName,
                         update_time = UpdateTime}} ->
            File = goodvoice_mgr:rank_dir() ++ FileName,
            case file:read_file(File) of
                {ok, Bin} -> {true, SongId, UpdateTime, Bin};
                _Err ->
                    logger:error("无法找到[~w][~ts]语音文件",
                                 [RoleId, File],
                                 goodvoice,
                                 139),
                    {false, lang:get("找不到对应的语音文件")}
            end;
        _ -> {false, lang:get("找不到对应的语音信息")}
    end.

submit(Summary, Voice, Time,
       Role = #role{id = RoleId, name = RoleName, sex = Sex,
                    classes = Classes, lev = Lev}) ->
    Now = date:unixtime(),
    GoodVoice = #goodvoice{role_id = RoleId,
                           name = RoleName, sex = Sex, classes = Classes,
                           time = Time, summary = Summary, update_time = Now,
                           lev = Lev},
    Flag = case goodvoice_mgr:lookup(RoleId) of
               {true, _} -> {false, lang:get("已经报名，无需再次报名")};
               false ->
                   case check_submit(Role) of
                       {true, ItemList} ->
                           case submit_loss(Role) of
                               {ok, NewRole} -> {ok, NewRole, ItemList};
                               {false, Reason} -> {false, Reason}
                           end;
                       {false, Reason} -> {false, Reason}
                   end
           end,
    case Flag of
        {ok, NewRole1, GainItemList} ->
            case goodvoice_mgr:call({submit, GoodVoice, Voice}) of
                {true, SongId} ->
                    Msg = lang:get("提交报名成功"),
                    {ok, submit_gain(NewRole1, GainItemList), SongId, Msg};
                {false, Reason2} -> {false, Reason2};
                _Err ->
                    logger:error("好声音[~ts]报名失败:~w",
                                 [RoleName, _Err],
                                 goodvoice,
                                 175),
                    Msg = lang:get("系统繁忙，提交出现问题"),
                    {fail, submit_gain(NewRole1, GainItemList), Msg}
            end;
        {false, Reason3} -> {false, Reason3}
    end.

check_submit(#role{id = RoleId}) ->
    case goodvoice_mgr:get_status() of
        Status when Status >= 6 andalso Status =< 8 ->
            SubmitList = goodvoice_mgr:get_submit(),
            case lists:keymember(RoleId, 1, SubmitList) of
                true -> {true, [{21702, 1}]};
                _ -> {false, lang:get("没有获得全服决赛资格，无法报名")}
            end;
        Status when Status >= 2 andalso Status =< 4 ->
            {true, [{21701, 1}]};
        1 -> {false, lang:get("活动已经关闭")};
        _ -> {false, lang:get("还未开始报名，请查看报名日程")}
    end.

submit_loss(Role) ->
    Loss = [#loss{label = coin, val = 100000}],
    case role_gain:do_notice(Loss, Role, lang:get("报名好声音"))
        of
        {ok, NewRole} -> {ok, NewRole};
        {false, _} -> {false, lang:get("银币不足，无法报名")}
    end.

submit_gain(Role, GainItemList) ->
    Gain = format:val_to_gain(GainItemList),
    case role_gain:do_notice(Gain, Role, lang:get("报名好声音"))
        of
        {ok, NewRole} -> NewRole;
        {false, #gain{reason = bag_full}} ->
            Title = lang:get("好声音报名成功"),
            Content = lang:get("背包已满，这是活动宣传册，请查收。"),
            mail:send(Role,
                      #{title => Title, content => Content,
                        items => GainItemList}),
            Role;
        {false, _Err} ->
            logger:error("报名获得报名册失败:~w", [_Err], goodvoice, 224),
            Role
    end.

vote(Role = #role{id = SendRoleId, name = SendRoleName},
     ToRoleId = {_, ToPlat, ToZone}) ->
    case check_vote(Role, ToRoleId) of
        {false, Reason} -> {false, Reason};
        {true, OldTime, DayVote} ->
            NewTime = OldTime + 1,
            case big_world:call(ToPlat,
                                ToZone,
                                goodvoice,
                                do_vote,
                                [SendRoleId, SendRoleName, ToRoleId])
                of
                {true, Liked, TargetRoleName} ->
                    {Msg, NewRole} = add_vote(Role,
                                              ToRoleId,
                                              TargetRoleName,
                                              NewTime,
                                              DayVote),
                    {true, Liked, NewTime, Msg, NewRole};
                {false, Reason} -> {false, Reason};
                {fail, TargetRoleName, _Err} ->
                    logger:error("投票时发生错误:~w", [_Err], goodvoice, 244),
                    {Msg, NewRole} = add_vote(Role,
                                              ToRoleId,
                                              TargetRoleName,
                                              NewTime,
                                              DayVote),
                    {fail, 0, NewTime, Msg, NewRole};
                _Err ->
                    logger:error("投票时发生错误:~w", [_Err], goodvoice, 248),
                    {Msg, NewRole} = add_vote(Role,
                                              ToRoleId,
                                              "未知人",
                                              NewTime,
                                              DayVote),
                    {fail, 0, NewTime, Msg, NewRole}
            end
    end.

do_vote(SendRoleId, SendRoleName, ToRoleId) ->
    case goodvoice_mgr:lookup(ToRoleId) of
        {true, #goodvoice{name = ToName}} ->
            case goodvoice_mgr:call({vote,
                                     SendRoleId,
                                     SendRoleName,
                                     ToRoleId})
                of
                {true, Liked} -> {true, Liked, ToName};
                {false, Reason} -> {false, Reason};
                _Err -> {fail, ToName, _Err}
            end;
        false -> {false, lang:get("对方没有报名好声音")}
    end.

check_vote_base(Role = #role{lev = Lev,
                             m_agenda = #m_agenda{activity = Activity}}) ->
    case Activity >= 100 of
        true -> true;
        false ->
            {WorldLev, _} = world_lev:get_world_lev(Role),
            NeedLev = min(100, WorldLev - 5),
            case Lev >= NeedLev of
                true -> true;
                _ ->
                    {false,
                     notice:format(lang:get("等级达到~ts级或者活跃度达到~ts才可以好评"),
                                   [{string_2, 1, NeedLev},
                                    {string_2, 1, 100}])}
            end
    end.

check_vote(Role = #role{}, ToRoleId) ->
    case check_vote_base(Role) of
        true ->
            NowTime = case var:get_var(Role, day, 105, undefined) of
                          undefined -> 0;
                          {1, OldTime} -> OldTime;
                          _ -> 0
                      end,
            case NowTime >= 5 of
                true -> {false, lang:get("好评次数已经用完，无法好评")};
                false ->
                    DayVote = var:get_var(Role, day, 106, []),
                    case lists:member(ToRoleId, DayVote) of
                        true -> {false, lang:get("你今天已经给过他好评了，去看看其他人的作品吧")};
                        false -> {true, NowTime, DayVote}
                    end
            end;
        {false, Reason} -> {false, Reason}
    end.

add_vote(Role, ToRoleId, TargetRoleName, NewTime,
         DayVote) ->
    NewData = {1, NewTime},
    NewRole = var:set_var(Role, day, 105, NewData),
    NewDayVote = [ToRoleId | DayVote],
    NewRole1 = var:set_var(NewRole, day, 106, NewDayVote),
    Msg = notice:format(lang:get("向~ts投出了宝贵的一票{face_1, 2}"),
                        [{string_2, 1, TargetRoleName}]),
    TriggerRole = role_trigger:fire(#evt_goodvoice{},
                                    NewRole1),
    GainRole = reward(TriggerRole, NewTime),
    {Msg, GainRole}.

reward(Role, Times) ->
    case sing_data:get_odds(Times) of
        Odds when is_integer(Odds) ->
            case util:rand(1, 10000) of
                GetOdds when GetOdds =< Odds ->
                    {ItemId, Num, Bind, _ItemOdds} =
                        util:rand_list(sing_data:get_reward(), 4),
                    Gain = format:val_to_gain([{ItemId, Bind, Num}]),
                    case role_gain:do_notice(Gain, Role) of
                        {ok, NewRole} -> NewRole;
                        _ ->
                            mail:send(Role,
                                      lang:get("背包已满"),
                                      lang:get("你在好声音点赞获得奖励时，背包已满"),
                                      [{ItemId, Bind, Num}]),
                            Role
                    end;
                _ -> Role
            end;
        _ -> Role
    end.

flower(Items, SendRoleId, SendRoleName,
       ToRoleId = {_, P, Z}) ->
    case check_flower(Items, 0) of
        {true, FlowerNum} when FlowerNum > 0 ->
            case role_misc:is_local_role(ToRoleId) of
                true ->
                    do_flower(SendRoleId,
                              SendRoleName,
                              ToRoleId,
                              FlowerNum);
                false ->
                    big_world:cast(P,
                                   Z,
                                   goodvoice,
                                   do_flower,
                                   [SendRoleId,
                                    SendRoleName,
                                    ToRoleId,
                                    FlowerNum])
            end;
        _ -> skip
    end.

do_flower(SendRoleId, SendRoleName, ToRoleId,
          FlowerNum) ->
    case goodvoice_mgr:has_record(ToRoleId) of
        true ->
            goodvoice_mgr:cast({flower,
                                SendRoleId,
                                SendRoleName,
                                ToRoleId,
                                FlowerNum});
        false -> skip
    end,
    ok.

check_flower([], FlowerNum) -> {true, FlowerNum};
check_flower([{BaseId, Num} | T], FlowerNum) ->
    case lists:member(BaseId, [29153, 20032, 29051]) of
        true -> check_flower(T, FlowerNum + Num);
        false -> check_flower(T, FlowerNum)
    end;
check_flower([_ | T], FlowerNum) ->
    check_flower(T, FlowerNum).

update_voice(Voice, Time,
             #role{id = RoleId, name = RoleName}) ->
    case goodvoice_mgr:lookup(RoleId) of
        {true, #goodvoice{}} ->
            case goodvoice_mgr:call({update_voice,
                                     RoleId,
                                     Voice,
                                     Time})
                of
                {true, SongId} ->
                    Msg = lang:get("更新录音成功"),
                    {ok, SongId, Msg};
                {false, Reason} -> {false, Reason};
                _Err ->
                    logger:error("好声音[~ts]更新录音失败:~w",
                                 [RoleName, _Err],
                                 goodvoice,
                                 390),
                    Msg = lang:get("系统繁忙，更新出现问题"),
                    {fail, Msg}
            end;
        _ -> {false, lang:get("还没有报名，请先报名")}
    end.

update_summary(Summary,
               #role{id = RoleId, name = RoleName}) ->
    case goodvoice_mgr:lookup(RoleId) of
        {true, #goodvoice{}} ->
            case goodvoice_mgr:call({update_summary,
                                     RoleId,
                                     Summary})
                of
                {true, SongId} ->
                    Msg = lang:get("更新录音简介成功"),
                    {ok, SongId, Msg};
                {false, Reason} -> {false, Reason};
                _Err ->
                    logger:error("好声音[~ts]更新简介失败:~w",
                                 [RoleName, _Err],
                                 goodvoice,
                                 410),
                    Msg = lang:get("系统繁忙，更新出现问题"),
                    {fail, Msg}
            end;
        _ -> {false, lang:get("还没有报名，请先报名")}
    end.

follow_list(Role) ->
    VarName = get_follow_var_name(),
    {FollowVer, FollowList} = var:get_var(Role,
                                          other,
                                          VarName,
                                          {0, []}),
    FollowList1 = case FollowVer =:= 1 of
                      true -> FollowList;
                      false -> []
                  end,
    FollowList1.

get_follow_var_name() ->
    Status = goodvoice_mgr:get_status(),
    case Status >= 5 of
        true -> 2034;
        _ -> 2024
    end.

follow(RoleId = {_, Plat, Zone}, Role) ->
    FollowList = follow_list(Role),
    case lists:member(RoleId, FollowList) of
        true -> {false, lang:get("已经关注，无需再次关注")};
        false ->
            Len = length(FollowList),
            case Len >= 5 of
                true -> {false, lang:get("关注数已达上限，无法继续关注")};
                false ->
                    Result = case role_misc:is_local_role(RoleId) of
                                 true -> goodvoice_mgr:lookup(RoleId);
                                 _ ->
                                     big_world:call(Plat,
                                                    Zone,
                                                    goodvoice_mgr,
                                                    lookup,
                                                    [RoleId])
                             end,
                    case Result of
                        {true, _} ->
                            VarName = get_follow_var_name(),
                            NewFollowList = [RoleId | FollowList],
                            NewRole = var:set_var(Role,
                                                  other,
                                                  VarName,
                                                  {1, NewFollowList}),
                            {ok, NewRole};
                        _ -> {false, lang:get("对方没有报名好声音，无法关注")}
                    end
            end
    end.

unfollow(RoleId, Role) ->
    FollowList = follow_list(Role),
    NewFollowList = lists:delete(RoleId, FollowList),
    VarName = get_follow_var_name(),
    NewRole = var:set_var(Role,
                          other,
                          VarName,
                          {1, NewFollowList}),
    {ok, NewRole}.

report(Role = #role{id = RoleId, name = RoleName,
                    lev = RoleLev},
       ReportId = {_, ReportPlat, ReportZoneId}) ->
    Result = case role_misc:is_local_role(ReportId) of
                 true ->
                     do_report({RoleId, RoleName, RoleLev}, ReportId);
                 false ->
                     big_world:call(ReportPlat,
                                    ReportZoneId,
                                    goodvoice,
                                    do_report,
                                    [{RoleId, RoleName, RoleLev}, ReportId])
             end,
    case Result of
        {true, 1} ->
            BackMsg =
                lang:get("感谢您的反馈，客服人员将在第一时间核查被举报人的不当行为。核查结果将会邮件通知您!"),
            notice:pop(Role, 2, BackMsg),
            Loss = [#loss{label = energy, val = 10}],
            Role1 = case role_gain:do_notice(Loss,
                                             Role,
                                             lang:get("感谢您，提交举报"))
                        of
                        {ok, NewRole} -> NewRole;
                        _ -> Role
                    end,
            {true, Role1};
        {true, 0} ->
            BackMsg =
                lang:get("感谢您的反馈，客服人员将在第一时间核查被举报人的不当行为。核查结果将会邮件通知您!"),
            notice:pop(Role, 2, BackMsg),
            {true, Role};
        {false, Reason} -> {false, Reason};
        {error, big_world_not_ready} ->
            {false, lang:get("还未与跨服时空连接，请稍后尝试")};
        _ -> {false, lang:get("系统繁忙，请稍后尝试提交")}
    end.

do_report({RoleId, RoleName, RoleLev}, ReportId) ->
    case goodvoice_mgr:lookup(ReportId) of
        false -> {false, lang:get("对方已经不在报名状态，无需举报")};
        {true, #goodvoice{file_name = ""}} ->
            {false, lang:get("对方已经作品已做处理，无需举报")};
        {true,
         #goodvoice{lev = Lev, name = Name,
                    file_name = FileName}} ->
            Now = date:unixtime(),
            Report = #goodvoice_report{id = RoleId, name = RoleName,
                                       lev = RoleLev, time = Now,
                                       filename = FileName},
            case goodvoice_mgr:call({report,
                                     ReportId,
                                     Lev,
                                     Name,
                                     Now,
                                     Report})
                of
                {true, 1} -> {true, 1};
                {true, 0} -> {true, 0};
                {false, FailReason} -> {false, FailReason};
                _ -> {false, lang:get("系统繁忙，请稍后尝试")}
            end
    end.

