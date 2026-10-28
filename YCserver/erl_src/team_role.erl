-file("src/mod/team/team_role.erl", 1).

-module(team_role).

-export([callback/2]).

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

-file("src/mod/team/team_role.erl", 12).

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

-file("src/mod/team/team_role.erl", 13).

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

-file("src/mod/team/team_role.erl", 14).

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

-file("src/mod/team/team_role.erl", 15).

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

-file("src/mod/team/team_role.erl", 16).

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

-file("src/mod/team/team_role.erl", 17).

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

-file("src/mod/team/team_role.erl", 18).

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

-file("src/mod/team/team_role.erl", 19).

-file("inc/link.hrl", 1).

-record(link,
        {socket :: undefined | port(),
         conn_pid :: undefined | pid(),
         ip = {0, 0, 0, 0} :: {0..255, 0..255, 0..255, 0..255},
         port = 0 :: non_neg_integer(),
         lag = 0 :: non_neg_integer()}).

-file("src/mod/team/team_role.erl", 20).

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

-file("src/mod/team/team_role.erl", 21).

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

-file("src/mod/team/team_role.erl", 22).

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

-file("src/mod/team/team_role.erl", 23).

-file("inc/preparation.hrl", 1).

-record(m_preparation,
        {ver = 0,
         pid :: undefined | pid(),
         id = 0 :: non_neg_integer(),
         status = 0 :: non_neg_integer()}).

-record(preparation_room,
        {ver = 0,
         id = 0 :: non_neg_integer(),
         pid :: undefined | pid(),
         map_id = 0 :: non_neg_integer(),
         map_pid :: undefined | pid(),
         matching = [] :: list(),
         num = 1,
         matched = 0 :: non_neg_integer(),
         match_ref :: undefined | reference(),
         mode = 1,
         is_open = true :: boolean()}).

-record(preparation_team,
        {ids = [] :: list(),
         origin_ids = [] :: list(),
         num = 1 :: non_neg_integer(),
         sum_lev = 0 :: non_neg_integer(),
         max_lev = 0 :: non_neg_integer(),
         min_lev = 0 :: non_neg_integer(),
         tried_match = 0 :: non_neg_integer(),
         room_id = 0 :: non_neg_integer(),
         order = [] :: list(),
         classes = [] :: list()}).

-record(preparation_role,
        {ver = 0,
         id = {0, "", 0},
         name = "",
         pid :: undefined | pid(),
         face_id = 0 :: non_neg_integer(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         lev_break_times = 0 :: non_neg_integer(),
         status = 0 :: non_neg_integer(),
         looks = [] :: list(),
         fc = 0 :: non_neg_integer(),
         room_id = 0 :: non_neg_integer(),
         s_ride = 0,
         preparation_pid :: undefined | pid(),
         matched = 0 :: non_neg_integer(),
         formation_id = 1,
         formation_lev = 1,
         team_id = [] :: list(),
         partner = [] :: list(),
         group = 1 :: non_neg_integer()}).

-record(preparation_show_role,
        {id = {0, "", 0},
         name = "",
         face_id = 0 :: non_neg_integer(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         group = 1 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         lev_break_times = 0 :: non_neg_integer(),
         looks = [] :: list()}).

-file("src/mod/team/team_role.erl", 24).

-file("inc/spirit_treasure.hrl", 1).

-record(m_spirit_treasure,
        {ver = 1,
         is_offer = 0,
         unit_id = 0,
         is_get = 0,
         card_gain_list = [],
         max_wave = 0,
         wave_reward = []}).

-record(spirit_treasure_state,
        {ts,
         timeout = 0,
         state_name,
         cross_type = 0,
         map_info = []}).

-record(spirit_treasure_unit,
        {base_id = {0, 0},
         ver = 1,
         difficulty = 1,
         kill_times = 0,
         offer_teams = [],
         now_star = 1,
         diff_num = 0}).

-record(spirit_treasure_team,
        {leader_id = {0, "", 0},
         all_mate_id = [],
         team_mates = [],
         record_id = {0, {0, "", 0}},
         wave = 0,
         use_time = 0}).

-record(spirit_treasure_offer_mate,
        {id = {0, "", 0},
         name = "",
         lev = 0,
         classes = 0,
         sex = 0,
         fc = 0,
         break_times = 0,
         status = 2,
         looks = []}).

-record(spirit_treasure_rank_rc,
        {id = {0, "", 0},
         name = "",
         lev = 0,
         classes = 0,
         sex = 0,
         fc = 0,
         break_times = 0,
         wave = 0,
         use_time = 0,
         rank = 0}).

-record(spirit_treasure_rank_list,
        {group = 0, min_val = {0, 0}, list = [], len = 0}).

-file("src/mod/team/team_role.erl", 25).

-file("inc/oracle_treasure.hrl", 1).

-record(m_oracle_treasure,
        {ver = 2,
         is_offer = 0,
         unit_id = 0,
         is_get = 0,
         card_gain_list = [],
         max_wave = 0,
         wave_reward = [],
         week_times = 0,
         times = 0}).

-record(oracle_treasure_state,
        {ts,
         timeout = 0,
         state_name,
         cross_type = 0,
         map_info = []}).

-record(oracle_treasure_unit,
        {base_id = {0, 0},
         ver = 1,
         difficulty = 1,
         kill_times = 0,
         offer_teams = [],
         now_star = 0,
         diff_num = 0}).

-record(oracle_treasure_team,
        {leader_id = {0, "", 0},
         all_mate_id = [],
         team_mates = [],
         record_id = {0, {0, "", 0}},
         wave = 0,
         use_time = 0}).

-record(oracle_treasure_offer_mate,
        {id = {0, "", 0},
         name = "",
         lev = 0,
         classes = 0,
         sex = 0,
         fc = 0,
         break_times = 0,
         status = 2,
         looks = []}).

-record(oracle_treasure_rank_rc,
        {id = {0, "", 0},
         name = "",
         lev = 0,
         classes = 0,
         sex = 0,
         fc = 0,
         break_times = 0,
         wave = 0,
         use_time = 0,
         rank = 0}).

-record(oracle_treasure_rank_list,
        {group = 0, min_val = {0, 0}, list = [], len = 0}).

-file("src/mod/team/team_role.erl", 26).

-file("inc/exquisite_shelf.hrl", 1).

-record(m_exquisite_shelf,
        {ver = 2,
         wave = 0,
         shelf_id = 0,
         shelf_pid,
         pos_wave = 0,
         card_info = [],
         help_times = 0,
         is_get_help = 0}).

-record(exquisite_shelf_util,
        {id = 0,
         cross_type = 0,
         pid = 0,
         battle_id = 0,
         wave_info = [],
         wave = 1,
         lev = 1,
         challenges = [],
         create_time = 0}).

-record(exquisite_shelf_wave_info,
        {wave = 0,
         map_base_id = 0,
         map_id = 0,
         map_pid,
         units = [],
         status = 0}).

-record(exquisite_shelf_card_info,
        {wave = 1,
         shelf_lev = 1,
         type = 2,
         normal_card = [],
         gold_card = []}).

-record(exquisite_shelf_card_item,
        {index = 1,
         item_id = 0,
         num = 0,
         is_get = 0,
         is_notice = 0,
         is_show = 0}).

-record(exquisite_shelf_fast_combat_record,
        {shelf_wave = {0, 0},
         use_time = 0,
         record_id = {0, {0, "", 0}}}).

-file("src/mod/team/team_role.erl", 27).

-file("inc/lev_break.hrl", 1).

-record(m_lev_break,
        {ver = 0,
         trial = 0 :: non_neg_integer(),
         done = 0 :: non_neg_integer(),
         times = 0 :: non_neg_integer(),
         attr_point = 0 :: non_neg_integer()}).

-file("src/mod/team/team_role.erl", 28).

-spec callback(#role{}, Args :: term()) -> ok |
                                           {ok, NewRole :: #role{}}.

callback(Role = #role{s_event = Event,
                      s_event_pid = EventPid, id = RoleId,
                      cross_type = CrossType},
         {login, TeamPid, Mod, Speed, CrossType}) ->
    team_util:notice_team_status(Event,
                                 EventPid,
                                 [],
                                 [{away, RoleId}]),
    {ok,
     Role#role{m_team =
                   #m_team{pid = TeamPid, mod = Mod, speed = Speed}}};
callback(Role = #role{s_event = Event,
                      s_event_pid = EventPid, id = RoleId},
         {login, TeamPid, Mod, Speed, _CrossType}) ->
    team_util:notice_team_status(Event,
                                 EventPid,
                                 [],
                                 [{away, RoleId}]),
    NRole = Role#role{m_team =
                          #m_team{pid = TeamPid, mod = Mod, speed = Speed}},
    case team:async_leave(NRole) of
        {ok, NewRole} -> {ok, NewRole};
        ok -> ok
    end;
callback(Role = #role{s_event = Event,
                      s_event_pid = EventPid, id = RoleId, m_team = Mteam},
         away) ->
    logger:debug("暂离队伍:~w", [RoleId], team_role, 52),
    team_util:notice_team_status(Event,
                                 EventPid,
                                 [],
                                 [{away, RoleId}]),
    Role1 = attr:calc_and_push(Role#role{m_team =
                                             Mteam#m_team{status = 3}}),
    Role2 = role_trigger:fire(#evt_team_away{}, Role1),
    role_fly:update(Role2);
callback(Role = #role{m_team = Mteam, s_event = Event},
         {member_update, MemberNum}) ->
    case Mteam of
        #team{member_num = MemberNum} -> {ok, Role};
        _ ->
            UpdateRole = Role#role{m_team =
                                       Mteam#m_team{member_num = MemberNum}},
            EventRole = case Event of
                            19 -> meet_pet:team_member_update(UpdateRole);
                            _ -> UpdateRole
                        end,
            NewRole = EventRole,
            map:role_status_update(NewRole),
            {ok, NewRole}
    end;
callback(Role = #role{s_event = Event, m_team = Mteam,
                      pos =
                          #pos{map_pid = MapPid, map_grid_pid = MapGridPid}},
         {follow,
          #pos{map_pid = MapPid, x = X, y = Y,
               map_grid_pid = MapGridPid},
          IsFly,
          LeadEvent}) ->
    NewEvent = case LeadEvent of
                   23 -> LeadEvent;
                   56 -> LeadEvent;
                   67 -> LeadEvent;
                   _ -> Event
               end,
    logger:debug("x --> ~w, y----> ~w, is_fly ~w",
                 [X, Y, IsFly],
                 team_role,
                 81),
    Role1 = attr:calc_and_push(Role#role{m_team =
                                             Mteam#m_team{status = 2},
                                         s_ride = IsFly, s_event = NewEvent}),
    Role2 = looks:calc(Role1),
    map:role_update(Role2),
    case map:role_transmit(4, 0, X, Y, Role2) of
        Role3 = #role{} -> {ok, Role3};
        _Err ->
            logger:error("归队传送时, 地图内传送出错:~w",
                         [_Err],
                         team_role,
                         90),
            ok
    end;
callback(Role = #role{m_team = Mteam, s_event = Event},
         {follow,
          #pos{platform = P, zone_id = Z, map = MapId, x = X,
               y = Y, map_grid_pid = Gpid},
          IsFly,
          LeadEvent}) ->
    logger:debug("x --> ~w, y----> ~w, is_fly ~w",
                 [X, Y, IsFly],
                 team_role,
                 94),
    NewEvent = case LeadEvent of
                   2 -> LeadEvent;
                   56 -> LeadEvent;
                   67 -> LeadEvent;
                   _ -> Event
               end,
    Role1 = attr:calc_and_push(Role#role{m_team =
                                             Mteam#m_team{status = 2},
                                         s_event = NewEvent, s_ride = IsFly}),
    Role2 = looks:calc(Role1),
    map:role_update(Role2),
    case map:role_enter({P, Z, MapId, Gpid, X, Y}, Role2) of
        {ok, Role3 = #role{}} -> {ok, Role3};
        _Err ->
            logger:error("归队传送时, 进入地图出错:~w",
                         [_Err],
                         team_role,
                         108),
            ok
    end;
callback(Role = #role{s_event = Event, m_team = Mteam,
                      pos =
                          #pos{map_pid = MapPid, map_grid_pid = MapGridPid}},
         {to_leader_pos,
          #pos{map_pid = MapPid, x = X, y = Y,
               map_grid_pid = MapGridPid},
          IsFly,
          LeadEvent}) ->
    logger:debug("x --> ~w, y----> ~w, is_fly ~w",
                 [X, Y, IsFly],
                 team_role,
                 114),
    NewEvent = case LeadEvent of
                   23 -> LeadEvent;
                   56 -> LeadEvent;
                   67 -> LeadEvent;
                   _ -> Event
               end,
    Role1 = attr:calc_and_push(Role#role{m_team = Mteam,
                                         s_ride = IsFly, s_event = NewEvent}),
    Role2 = looks:calc(Role1),
    map:role_update(Role2),
    case map:role_transmit(4, 0, X, Y, Role2) of
        Role3 = #role{} -> {ok, Role3};
        _Err ->
            logger:error("归队传送时, 地图内传送出错:~w",
                         [_Err],
                         team_role,
                         129),
            ok
    end;
callback(Role = #role{m_team = Mteam, s_event = Event},
         {to_leader_pos,
          #pos{platform = P, zone_id = Z, map = MapId, x = X,
               y = Y, map_grid_pid = Gpid},
          IsFly,
          LeadEvent}) ->
    logger:debug("x --> ~w, y----> ~w, is_fly ~w",
                 [X, Y, IsFly],
                 team_role,
                 133),
    NewEvent = case LeadEvent of
                   2 -> LeadEvent;
                   23 -> LeadEvent;
                   56 -> LeadEvent;
                   67 -> LeadEvent;
                   _ -> Event
               end,
    Role1 = attr:calc_and_push(Role#role{m_team = Mteam,
                                         s_event = NewEvent, s_ride = IsFly}),
    Role2 = looks:calc(Role1),
    map:role_update(Role2),
    case map:role_enter({P, Z, MapId, Gpid, X, Y}, Role2) of
        {ok, Role3 = #role{}} -> {ok, Role3};
        _Err ->
            logger:error("归队传送时, 进入地图出错:~w",
                         [_Err],
                         team_role,
                         148),
            ok
    end;
callback(Role = #role{}, recall) ->
    push(Role, 11721),
    ok;
callback(Role = #role{s_event = Event,
                      s_event_pid = EventPid, id = RoleId},
         leave) ->
    team_util:notice_team_status(Event,
                                 EventPid,
                                 [],
                                 [{none, RoleId}]),
    role_fly:update(Role#role{m_team = #m_team{}});
callback(Role = #role{id = RoleId, s_event = Event,
                      s_event_pid = EventPid, m_team = #m_team{pid = Pid},
                      pid = Rpid},
         {stop, Pid}) ->
    logger:debug("队伍崩掉 ~w", [Pid], team_role, 161),
    team_util:notice_team_status(Event,
                                 EventPid,
                                 [],
                                 [{none, RoleId}]),
    role:pack_send(Rpid, 11708, {1, lang:get("你已离开队伍")}),
    role_fly:update(Role#role{m_team = #m_team{}});
callback(_Role, {stop, _Pid}) -> ok;
callback(Role = #role{pos = #pos{map_pid = MapPid},
                      m_team = #m_team{status = 2}},
         {move, MapPid, Dx, Dy, Dir}) ->
    NRole = Role,
    {ok, map:role_move(Dx, Dy, Dir, NRole)};
callback(_Role, {move, _MapPid, _Dx, _Dy, _Dir}) -> ok;
callback(Role = #role{m_team = Mteam,
                      pos = #pos{map_pid = MapPid}},
         {transmit, MapPid, X, Y}) ->
    Role1 = Role#role{m_team = Mteam#m_team{status = 2}},
    case map:role_transmit(4, 0, X, Y, Role1) of
        Role2 = #role{} -> {ok, Role2};
        _Err ->
            logger:error("归队传送时, 地图内传送出错:~w",
                         [_Err],
                         team_role,
                         181),
            ok
    end;
callback(#role{m_team = #m_team{status = Status}},
         {enter_map, _, _TeamEvt})
    when Status =/= 2 ->
    ok;
callback(Role = #role{s_event = 0},
         {enter_map,
          #{pos := Pos = #pos{map_base_id = BaseId}, event := 0},
          TeamEvt}) ->
    logger:debug("普通切换", [], team_role, 188),
    case lists:member(BaseId, map_data:startup()) of
        true -> do_role_enter_map(Role, Pos, TeamEvt);
        _R ->
            logger:debug("队长进入了非常规地图 ~w", [BaseId], team_role, 193),
            team:away(Role)
    end;
callback(Role = #role{s_event = 1,
                      m_dungeon = #m_dungeon{battle_id = BattleId},
                      pos = #pos{map = MapId}},
         {enter_map,
          #{pos := Pos = #pos{map = PMapId},
            dungeon := #m_dungeon{battle_id = BattleId},
            event := 1},
          TeamEvt})
    when PMapId =/= MapId ->
    logger:debug("同副本", [], team_role, 198),
    do_role_enter_map(Role, Pos, TeamEvt);
callback(Role = #role{s_event = 0},
         {enter_map, #{pos := Pos, event := 1}, TeamEvt}) ->
    logger:debug("进入副本", [], team_role, 202),
    do_role_enter_map(Role, Pos, TeamEvt);
callback(Role = #role{s_event = 1},
         {enter_map, #{pos := Pos, event := 0}, TeamEvt}) ->
    logger:debug("退出副本", [], team_role, 206),
    do_role_enter_map(Role, Pos, TeamEvt);
callback(Role = #role{s_event = 1},
         {enter_map, #{pos := Pos, event := 43}, TeamEvt}) ->
    logger:debug("退出副本", [], team_role, 209),
    do_role_enter_map(Role, Pos, TeamEvt);
callback(Role = #role{s_event = 57,
                      m_exquisite_shelf =
                          #m_exquisite_shelf{shelf_id = _ShelfId},
                      pos = #pos{map = MapId}},
         {enter_map,
          #{pos := Pos = #pos{map = PMapId}, event := 57},
          TeamEvt})
    when PMapId =/= MapId ->
    logger:debug("进入副本", [], team_role, 214),
    do_role_enter_map(Role, Pos, TeamEvt);
callback(Role = #role{s_event = 0},
         {enter_map, #{pos := Pos, event := 57}, TeamEvt}) ->
    logger:debug("进入副本", [], team_role, 218),
    do_role_enter_map(Role, Pos, TeamEvt);
callback(Role = #role{s_event = 57},
         {enter_map, #{pos := Pos, event := 0}, TeamEvt}) ->
    logger:debug("退出副本", [], team_role, 222),
    do_role_enter_map(Role, Pos, TeamEvt);
callback(Role = #role{s_event = Event},
         {enter_map, #{pos := Pos, event := 5}, TeamEvt})
    when Event =:= 0 orelse Event =:= 2 ->
    logger:debug("进入段位赛准备区", [], team_role, 228),
    do_role_enter_map(Role, Pos, TeamEvt);
callback(Role = #role{s_event = 5},
         {enter_map, #{pos := Pos, event := 0}, TeamEvt}) ->
    logger:debug("退出段位赛准备区", [], team_role, 232),
    do_role_enter_map(Role, Pos, TeamEvt);
callback(Role = #role{s_event = 0},
         {enter_map, #{pos := Pos, event := 16}, TeamEvt}) ->
    logger:debug("进入巅峰对决区", [], team_role, 236),
    do_role_enter_map(Role, Pos, TeamEvt);
callback(Role = #role{s_event = 16},
         {enter_map, #{pos := Pos, event := 0}, TeamEvt}) ->
    logger:debug("退出巅峰对决区", [], team_role, 240),
    do_role_enter_map(Role, Pos, TeamEvt);
callback(Role = #role{s_event = 0},
         {enter_map, #{pos := Pos, event := 2}, TeamEvt}) ->
    logger:debug("进领地", [], team_role, 244),
    do_role_enter_map(Role#role{s_event = 2}, Pos, TeamEvt);
callback(Role = #role{s_event = Event,
                      m_team = #m_team{status = 2}},
         {enter_map, #{pos := Pos, event := 41}, TeamEvt})
    when Event =:= 0 orelse
             Event =:= 2 orelse Event =:= 41 ->
    logger:debug("进入诸神战场", [], team_role, 247),
    do_role_enter_map(Role, Pos, TeamEvt);
callback(Role = #role{s_event = Event,
                      m_team = #m_team{status = 2}},
         {enter_map, #{pos := Pos, event := 0}, TeamEvt})
    when Event =:= 0 orelse
             Event =:= 2 orelse Event =:= 41 ->
    logger:debug("退出诸神战场", [], team_role, 250),
    do_role_enter_map(Role, Pos, TeamEvt);
callback(Role = #role{s_event = Event,
                      m_team = #m_team{status = 2}},
         {enter_map, #{pos := Pos, event := 63}, TeamEvt})
    when Event =:= 0 orelse
             Event =:= 2 orelse Event =:= 63 ->
    logger:debug("进入诸神殿堂", [], team_role, 253),
    do_role_enter_map(Role, Pos, TeamEvt);
callback(Role = #role{id = RoleId, name = Name,
                      pid = Pid, s_event = Event,
                      m_team = #m_team{status = 2}},
         {enter_map,
          #{pos := Pos, event := 56, leader_id := LeaderId},
          TeamEvt})
    when Event =:= 0 orelse
             Event =:= 2 orelse Event =:= 56 ->
    logger:debug("进入元素之域:", [], team_role, 256),
    case spirit_treasure_mgr:is_same_group(RoleId, LeaderId)
        of
        true -> do_role_enter_map(Role, Pos, TeamEvt);
        _ ->
            role:apply(async, Pid, {team, async_leave, []}),
            notice:send(Role, 1, lang:get("您与队长分属不同的分组，无法一起挑战龙王")),
            team:notice(Role,
                        notice:format(lang:get("~ts与队长分属不同分组，自动退出了队伍"),
                                      [{role_2, Name}])),
            ok
    end;
callback(Role = #role{s_event = Event,
                      m_team = #m_team{status = 2}},
         {enter_map, #{pos := Pos, event := 0}, TeamEvt})
    when Event =:= 0 orelse
             Event =:= 2 orelse Event =:= 56 ->
    logger:debug("进入元素之域", [], team_role, 266),
    do_role_enter_map(Role, Pos, TeamEvt);
callback(Role = #role{s_event = Event,
                      m_team = #m_team{status = 2}},
         {enter_map, #{pos := Pos, event := 65}, TeamEvt})
    when Event =:= 0 orelse
             Event =:= 2 orelse Event =:= 65 ->
    logger:debug("进入跨服约战", [], team_role, 270),
    do_role_enter_map(Role, Pos, TeamEvt);
callback(Role = #role{s_event = Event,
                      m_team = #m_team{status = 2}},
         {enter_map, #{pos := Pos, event := 66}, TeamEvt})
    when Event =:= 0 orelse
             Event =:= 2 orelse Event =:= 65 orelse Event =:= 66 ->
    logger:debug("进入跨服约战", [], team_role, 273),
    do_role_enter_map(Role, Pos, TeamEvt);
callback(Role = #role{s_event = Event,
                      m_team = #m_team{status = 2}},
         {enter_map, #{pos := Pos, event := 0}, TeamEvt})
    when Event =:= 65 ->
    logger:debug("退出跨服约战", [], team_role, 276),
    do_role_enter_map(Role, Pos, TeamEvt);
callback(Role = #role{id = RoleId, name = Name,
                      pid = Pid, s_event = Event,
                      m_team = #m_team{status = 2}},
         {enter_map,
          #{pos := Pos, event := 67, leader_id := LeaderId},
          TeamEvt})
    when Event =:= 0 orelse
             Event =:= 2 orelse Event =:= 67 ->
    logger:debug("进入元素之域:", [], team_role, 280),
    case spirit_treasure_mgr:is_same_group(RoleId, LeaderId)
        of
        true -> do_role_enter_map(Role, Pos, TeamEvt);
        _ ->
            role:apply(async, Pid, {team, async_leave, []}),
            notice:send(Role, 1, lang:get("您与队长分属不同的分组，无法一起挑战天启")),
            team:notice(Role,
                        notice:format(lang:get("~ts与队长分属不同分组，自动退出了队伍"),
                                      [{role_2, Name}])),
            ok
    end;
callback(Role = #role{s_event = Event,
                      m_team = #m_team{status = 2}},
         {enter_map, #{pos := Pos, event := 0}, TeamEvt})
    when Event =:= 0 orelse
             Event =:= 2 orelse Event =:= 67 ->
    logger:debug("进入元素之域", [], team_role, 290),
    do_role_enter_map(Role, Pos, TeamEvt);
callback(Role = #role{},
         {enter_map, #{pos := Pos, event := 28}, TeamEvt}) ->
    logger:debug("进家园", [], team_role, 298),
    do_role_enter_map(Role#role{s_event = 28},
                      Pos,
                      TeamEvt);
callback(Role = #role{s_event = 2},
         {enter_map, #{pos := Pos, event := 0}, TeamEvt}) ->
    logger:debug("退领地", [], team_role, 301),
    do_role_enter_map(Role#role{s_event = 0}, Pos, TeamEvt);
callback(Role = #role{s_event = 0},
         {enter_map, #{pos := Pos, event := 3}, TeamEvt}) ->
    logger:debug("护送", [], team_role, 305),
    do_role_enter_map(Role, Pos, TeamEvt);
callback(Role = #role{s_event = Event,
                      m_team = #m_team{status = 2}},
         {enter_map, #{pos := Pos, event := 6}, TeamEvt})
    when Event =:= 0 orelse Event =:= 2 ->
    logger:debug("进幻境", [], team_role, 309),
    do_role_enter_map(Role, Pos, TeamEvt);
callback(Role = #role{s_event = 6,
                      m_team = #m_team{status = 2}},
         {enter_map, #{pos := Pos, event := 0}, TeamEvt}) ->
    logger:debug("退幻境", [], team_role, 312),
    do_role_enter_map(Role, Pos, TeamEvt);
callback(Role = #role{s_event = 6,
                      m_team = #m_team{status = 2}},
         {enter_map, #{pos := Pos, event := 6}, TeamEvt}) ->
    logger:debug("幻境", [], team_role, 315),
    do_role_enter_map(Role, Pos, TeamEvt);
callback(Role = #role{s_event = Event,
                      m_team = #m_team{status = 2}},
         {enter_map, #{pos := Pos, event := 17}, TeamEvt})
    when Event =:= 0 orelse
             Event =:= 2 orelse Event =:= 18 ->
    logger:debug("进公会战", [], team_role, 319),
    do_role_enter_map(Role, Pos, TeamEvt);
callback(Role = #role{s_event = Event,
                      m_team = #m_team{status = 2}},
         {enter_map, #{pos := Pos, event := 18}, TeamEvt})
    when Event =:= 0 orelse Event =:= 2 ->
    logger:debug("进公会战", [], team_role, 322),
    do_role_enter_map(Role, Pos, TeamEvt);
callback(Role = #role{s_event = 17,
                      m_team = #m_team{status = 2}},
         {enter_map, #{pos := Pos, event := 17}, TeamEvt}) ->
    logger:debug("退公会战", [], team_role, 325),
    do_role_enter_map(Role, Pos, TeamEvt);
callback(Role = #role{s_event = 18,
                      m_team = #m_team{status = 2}},
         {enter_map, #{pos := Pos, event := 18}, TeamEvt}) ->
    logger:debug("退公会战", [], team_role, 328),
    do_role_enter_map(Role, Pos, TeamEvt);
callback(Role = #role{s_event = Event,
                      m_team = #m_team{status = 2}},
         {enter_map, #{pos := Pos, event := 22}, TeamEvt})
    when Event =:= 0 orelse Event =:= 2 ->
    logger:debug("公会精英战", [], team_role, 332),
    do_role_enter_map(Role, Pos, TeamEvt);
callback(Role = #role{s_event = 22,
                      m_team = #m_team{status = 2}},
         {enter_map, #{pos := Pos, event := 0}, TeamEvt}) ->
    logger:debug("退公会精英战", [], team_role, 335),
    do_role_enter_map(Role, Pos, TeamEvt);
callback(Role = #role{s_event = 22,
                      m_team = #m_team{status = 2}},
         {enter_map, #{pos := Pos, event := 22}, TeamEvt}) ->
    logger:debug("公会精英战", [], team_role, 338),
    do_role_enter_map(Role, Pos, TeamEvt);
callback(Role = #role{s_event = Event,
                      m_team = #m_team{status = 2}},
         {enter_map, #{pos := Pos, event := 32}, TeamEvt})
    when Event =:= 0 orelse
             Event =:= 2 orelse Event =:= 33 ->
    logger:debug("进公会联赛", [], team_role, 342),
    do_role_enter_map(Role, Pos, TeamEvt);
callback(Role = #role{s_event = Event,
                      m_team = #m_team{status = 2}},
         {enter_map, #{pos := Pos, event := 33}, TeamEvt})
    when Event =:= 0 orelse Event =:= 2 ->
    logger:debug("进公会联赛", [], team_role, 345),
    do_role_enter_map(Role, Pos, TeamEvt);
callback(Role = #role{s_event = 32,
                      m_team = #m_team{status = 2}},
         {enter_map, #{pos := Pos, event := 32}, TeamEvt}) ->
    logger:debug("公会联赛", [], team_role, 348),
    do_role_enter_map(Role, Pos, TeamEvt);
callback(Role = #role{s_event = 33,
                      m_team = #m_team{status = 2}},
         {enter_map, #{pos := Pos, event := 33}, TeamEvt}) ->
    logger:debug("公会联赛", [], team_role, 351),
    do_role_enter_map(Role, Pos, TeamEvt);
callback(Role = #role{s_event = _Event,
                      m_team = #m_team{status = 2}},
         {enter_map, #{pos := Pos, event := 72}, TeamEvt}) ->
    logger:debug("峡谷之巅准备区~w", [_Event], team_role, 355),
    do_role_enter_map(Role, Pos, TeamEvt);
callback(Role = #role{s_event = _Event,
                      m_team = #m_team{status = 2}},
         {enter_map, #{pos := Pos, event := 73}, TeamEvt}) ->
    logger:debug("峡谷之巅战场~w", [_Event], team_role, 358),
    do_role_enter_map(Role, Pos, TeamEvt);
callback(Role = #role{s_event = 20,
                      m_team = #m_team{status = 2}},
         {enter_map, #{pos := Pos, event := 20}, TeamEvt}) ->
    logger:debug("武道大会", [], team_role, 362),
    do_role_enter_map(Role, Pos, TeamEvt);
callback(Role = #role{s_event = Event,
                      m_team = #m_team{status = 2}},
         {enter_map, #{pos := Pos, event := 17}, TeamEvt})
    when Event =:= 0 orelse
             Event =:= 2 orelse Event =:= 20 ->
    logger:debug("武道大会", [], team_role, 365),
    do_role_enter_map(Role, Pos, TeamEvt);
callback(Role = #role{s_event = Event,
                      m_team = #m_team{status = 2}},
         {enter_map, #{pos := Pos, event := 20}, TeamEvt})
    when Event =:= 0 orelse Event =:= 2 ->
    logger:debug("武道大会", [], team_role, 368),
    do_role_enter_map(Role, Pos, TeamEvt);
callback(Role = #role{s_event = Event,
                      m_team = #m_team{status = 2}},
         {enter_map, #{pos := Pos, event := 21}, TeamEvt})
    when Event =:= 0 orelse
             Event =:= 2 orelse Event =:= 20 ->
    logger:debug("武道大会", [], team_role, 371),
    do_role_enter_map(Role, Pos, TeamEvt);
callback(Role = #role{s_event = 21,
                      m_team = #m_team{status = 2}},
         {enter_map, #{pos := Pos, event := 21}, TeamEvt}) ->
    logger:debug("武道大会", [], team_role, 374),
    do_role_enter_map(Role, Pos, TeamEvt);
callback(Role = #role{s_event = Event,
                      m_team = #m_team{status = 2}},
         {enter_map, #{pos := Pos, event := 42}, TeamEvt})
    when Event =:= 0 orelse
             Event =:= 2 orelse Event =:= 42 ->
    logger:debug("准备厅", [], team_role, 377),
    do_role_enter_map(Role, Pos, TeamEvt);
callback(Role = #role{s_event = 42,
                      m_team = #m_team{status = 2}},
         {enter_map, #{pos := Pos}, TeamEvt}) ->
    logger:debug("准备厅", [], team_role, 380),
    do_role_enter_map(Role, Pos, TeamEvt);
callback(Role = #role{s_event = 19,
                      m_team = #m_team{status = 2}},
         {enter_map, #{pos := Pos}, TeamEvt}) ->
    do_role_enter_map(Role, Pos, TeamEvt);
callback(Role = #role{s_event = 23,
                      m_team = #m_team{status = 2}},
         {enter_map, #{pos := Pos}, TeamEvt}) ->
    do_role_enter_map(Role, Pos, TeamEvt);
callback(Role = #role{s_event = 28,
                      m_team = #m_team{status = 2}},
         {enter_map, #{pos := Pos}, TeamEvt}) ->
    do_role_enter_map(Role, Pos, TeamEvt);
callback(Role = #role{s_event = Event, id = Id,
                      name = _Name, pid = Pid, m_team = #m_team{}},
         {enter_map,
          #{pos := Pos, event := 47, leader_id := LeaderId},
          TeamEvt})
    when Event =:= 0 orelse Event =:= 2 ->
    logger:debug("队员进入 ~ts ~w , Mid ~w TeamEvt ~w",
                 [_Name, Event, Id, TeamEvt],
                 team_role,
                 390),
    case guild_util:is_in_same(Id, LeaderId) of
        true ->
            do_role_enter_map(Role#role{s_event = 47},
                              Pos,
                              TeamEvt);
        _ ->
            notice:send({pid, Pid}, 1, lang:get("你与队长不同公会")),
            {ok, false}
    end;
callback(Role = #role{s_event = 47, name = _Name,
                      m_team = #m_team{}},
         {enter_map, #{pos := Pos, event := Event}, TeamEvt})
    when Event =:= 0 orelse Event =:= 2 ->
    logger:debug("队员退出 ~ts ~w TeamEvt ~w ",
                 [_Name, Event, TeamEvt],
                 team_role,
                 400),
    do_role_enter_map(Role#role{s_event = Event},
                      Pos,
                      TeamEvt);
callback(_Role, _Else = {enter_map, _R, _TeamEvt}) ->
    logger:debug("其他归队 ~w ~w", [_R, _Else], team_role, 403),
    ok;
callback(Role = #role{m_team = #m_team{status = 2}},
         {update_fly, 1, _Pos}) ->
    NewRole = Role#role{s_ride = 1},
    map:role_update(NewRole),
    {ok, NewRole};
callback(Role = #role{m_team = #m_team{status = 2},
                      pos = Pos},
         {update_fly, 0, #pos{x = X, y = Y}}) ->
    NewRole = mount:calc_ride_status(Role#role{s_ride = 0,
                                               pos = Pos#pos{x = X, y = Y}}),
    map:role_update(NewRole),
    {ok, NewRole};
callback(Role = #role{m_team = #m_team{status = 2},
                      pos = Pos},
         {update_fly, 2, #pos{x = X, y = Y}}) ->
    NewRole = mount:calc_ride_status(Role#role{s_ride = 0,
                                               pos = Pos#pos{x = X, y = Y}}),
    map:role_update(NewRole),
    {ok, NewRole};
callback(Role = #role{m_team =
                          Mteam = #m_team{status = 2}},
         {set_mod, Mod}) ->
    Role1 = Role#role{m_team = Mteam#m_team{mod = Mod}},
    NewRole = looks:calc(Role1),
    map:role_update(NewRole),
    {ok, NewRole};
callback(Role = #role{m_team = Mteam},
         {set_speed, Speed}) ->
    Role1 = Role#role{m_team = Mteam#m_team{speed = Speed}},
    NewRole = attr:calc_and_push(Role1),
    map:role_update(NewRole),
    {ok, NewRole};
callback(Role = #role{id = RoleId, s_event = Event,
                      s_event_pid = EventPid,
                      m_team = Mteam = #m_team{pid = TeamPid}},
         {appoint, 1, Members}) ->
    case lists:keyfind(RoleId, #team_mate.id, Members) of
        #team_mate{team_pid = TeamPid} ->
            Role1 = attr:calc_and_push(Role#role{m_team =
                                                     Mteam#m_team{status = 1}}),
            Role2 = formation:update_team_form(Role1),
            FireRole = role_trigger:fire(#evt_team_appoint{status =
                                                               1,
                                                           leader_id = RoleId},
                                         Role2),
            team_util:notice_team_status(Event,
                                         EventPid,
                                         Members,
                                         [{leader, RoleId}]),
            team:sync_pos(FireRole),
            role_fly:update(FireRole);
        _ -> ok
    end;
callback(Role = #role{id = RoleId, s_event = Event,
                      s_event_pid = EventPid,
                      m_team = Mteam = #m_team{pid = TeamPid}},
         {appoint, Status, Members}) ->
    case lists:keyfind(1, #team_mate.status, Members) of
        #team_mate{id = LeaderId, team_pid = TeamPid} ->
            FireRole = role_trigger:fire(#evt_team_appoint{status =
                                                               Status,
                                                           leader_id =
                                                               LeaderId},
                                         Role),
            UpdateStatus = case Status of
                               0 -> [{none, RoleId}];
                               2 -> [{follow, RoleId}];
                               _ -> [{away, RoleId}]
                           end,
            team_util:notice_team_status(Event,
                                         EventPid,
                                         [],
                                         UpdateStatus),
            role_fly:update(FireRole#role{m_team =
                                              Mteam#m_team{status = Status}});
        _ -> ok
    end;
callback(Role = #role{id = RoleId, s_event = Event,
                      s_event_pid = EventPid, pid = Pid},
         {kickout, M}) ->
    role:pack_send(Pid, 11708, {1, lang:get("你已离开队伍")}),
    LeaveRole = role_trigger:fire(#evt_team_leave{},
                                  Role#role{m_team = #m_team{}}),
    team_util:notice_team_status(Event,
                                 EventPid,
                                 [],
                                 [{none, RoleId}]),
    {ok, LeaveRole1} = mount:reset_double_ride(LeaveRole),
    Role1 = attr:calc_and_push(LeaveRole1),
    case role_fly:update(Role1) of
        {ok, Role2} -> auto_match(Role2, M);
        Else -> Else
    end;
callback(#role{m_team = #m_team{pid = Pid}},
         {verify, _Pid})
    when is_pid(Pid) ->
    {ok, {false, lang:get("对方已在队伍中")}};
callback(Role = #role{s_event = Event,
                      s_event_pid = EventPid, id = RoleId},
         {verify, Pid}) ->
    NewRole = Role#role{m_team = #m_team{pid = Pid}},
    team_util:notice_team_status(Event,
                                 EventPid,
                                 [],
                                 [{away, RoleId}]),
    {ok, ok, NewRole};
callback(#role{pid = Pid, cross_type = CrossType},
         {check_follow, #{cross_type := MCrossType}})
    when MCrossType =/= CrossType ->
    case MCrossType of
        1 ->
            notice:send({pid, Pid}, 1, lang:get("队伍在跨服中，不能归队"));
        _ -> notice:send({pid, Pid}, 1, lang:get("你在跨服中，不能归队"))
    end,
    {ok, false};
callback(#role{s_event = Event, s_event_pid = EventPid,
               pos = Pos = #pos{map = 10009}},
         {check_follow,
          #{event := Event2, pos := #pos{map = Map2}, pid := Pid,
            temple_map := TempleMap}})
    when Map2 =/= 10009 ->
    case Event2 =:= 0 orelse Event2 =:= 2 of
        true ->
            case TempleMap of
                true -> {ok, {true, Event, EventPid, Pos}};
                {_, Why} ->
                    notice:send({pid, Pid}, 1, Why),
                    {ok, false};
                _ -> {ok, false}
            end;
        _ ->
            Why = notice:format(lang:get("当前状态不能进入~ts"),
                                [{map_1, 10009}]),
            notice:send({pid, Pid}, 1, Why),
            {ok, false}
    end;
callback(#role{s_event = 1,
               pos = #pos{map_pid = MapPid}},
         {check_follow,
          #{pos := #pos{map_pid = MapPid2}, pid := Pid}})
    when MapPid =/= MapPid2 ->
    notice:send({pid, Pid}, 1, lang:get("队长在副本中，不能跟随")),
    {ok, false};
callback(#role{s_event = 1,
               pos = #pos{map_pid = MapPid}},
         {check_follow,
          #{pos := #pos{map_pid = MapPid2}, pid := Pid}})
    when MapPid =/= MapPid2 ->
    notice:send({pid, Pid}, 1, lang:get("队长在副本中，不能跟随")),
    {ok, false};
callback(#role{pos = #pos{map = 60001}},
         {check_follow, #{pid := Pid}}) ->
    notice:send({pid, Pid}, 1, lang:get("队长在试炼中，不能归队")),
    {ok, false};
callback(#role{pid = _TeamPid, s_event = 5,
               m_qualifying = #m_qualifying{sign_type = SignType}},
         {check_follow, #{event := 5, pid := Pid}})
    when SignType =/= 0 ->
    notice:send({pid, Pid},
                1,
                lang:get("队长正在段位赛匹配中，请先让队长取消匹配再来归队")),
    {ok, false};
callback(#role{pid = _TeamPid, s_event = 25},
         {check_follow, #{pid := Pid}}) ->
    notice:send({pid, Pid},
                1,
                lang:get("队长正在武道会匹配中，请先让队长取消匹配再来归队")),
    {ok, false};
callback(#role{s_event = 2, id = Id,
               s_event_pid = EventPid, pos = Pos},
         {check_follow,
          #{id := MId, pid := Pid, event := Event2}})
    when Event2 =:= 0 orelse Event2 =:= 2 ->
    case guild_util:is_in_same(Id, MId) of
        true -> {ok, {true, 2, EventPid, Pos}};
        _ ->
            notice:send({pid, Pid}, 1, lang:get("队长在他们公会领地中")),
            {ok, false}
    end;
callback(#role{s_event = Event1},
         {check_follow, #{event := Event2 = 1, pid := Pid}})
    when Event1 =/= Event2 ->
    notice:send({pid, Pid}, 1, lang:get("队长不在副本中")),
    {ok, false};
callback(#role{s_event = Event = 1,
               s_event_pid = EventPid,
               pos = Pos = #pos{map_pid = MapPid},
               m_dungeon = #m_dungeon{dun_id = DunId}},
         {check_follow,
          #{event := Event, pid := Pid,
            pos := #pos{map_pid = MapPid}}}) ->
    case dungeon_data:get(DunId) of
        #dungeon_base{type = 4} ->
            notice:send({pid, Pid}, 1, lang:get("秘境探索中，暂时不能归队")),
            {ok, false};
        #dungeon_base{} -> {ok, {true, Event, EventPid, Pos}}
    end;
callback(Role = #role{s_event = 3,
                      s_event_pid = EventPid, pos = Pos},
         {check_follow, #{event := Event2, pid := Pid}})
    when Event2 =:= 0 orelse Event2 =:= 2 ->
    case escort:can_follow(Role) of
        true -> {ok, {true, 3, EventPid, Pos}};
        _ ->
            notice:send({pid, Pid}, 1, lang:get("队长在护送中不能跟随")),
            {ok, false}
    end;
callback(#role{s_event = Event, s_event_pid = EventPid,
               pos = Pos},
         {check_follow, #{event := 2}})
    when Event =:= 0 orelse Event =:= 2 ->
    {ok, {true, Event, EventPid, Pos}};
callback(Leader = #role{id = RoleId, s_event = 28,
                        s_event_pid = EventPid, pos = Pos},
         {check_follow,
          #{event := Event2, id := MateId, pid := Pid}})
    when Event2 =:= 0 orelse Event2 =:= 2 ->
    case role_misc:is_local_role(MateId) of
        true ->
            case family_mgr:where(RoleId) of
                FamilyId when is_tuple(FamilyId) ->
                    case family_logic:is_can_visit(FamilyId, MateId) of
                        true ->
                            treat_follow_event(Leader, Pid),
                            {ok, {true, 28, EventPid, Pos}};
                        false ->
                            notice:send({pid, Pid},
                                        1,
                                        lang:get("队长所在家园访问权限限制，不能跟随")),
                            {ok, false}
                    end;
                false ->
                    logger:error("玩家状态错误, 不在任何家园，但是状态为家园状态",
                                 [],
                                 team_role,
                                 586),
                    {ok, {true, 28, EventPid, Pos}}
            end;
        _ ->
            notice:send({pid, Pid}, 1, lang:get("你们不在同一区，不能归队")),
            {ok, false}
    end;
callback(Leader = #role{s_event = Event,
                        s_event_pid = EventPid, pos = Pos},
         {check_follow, #{event := 28, pid := Pid}})
    when Event =:= 0 orelse Event =:= 28 ->
    treat_follow_event(Leader, Pid),
    logger:debug("玩家进入家园", [], team_role, 596),
    {ok, {true, 28, EventPid, Pos}};
callback(#role{s_event = 41},
         {check_follow, #{event := Event, pid := Pid}})
    when Event =/= 41 ->
    notice:send({pid, Pid},
                1,
                lang:get("队长正在诸神战场，请入场后再归队。")),
    {ok, false};
callback(Role = #role{s_event = 41,
                      m_gods_duel = #m_gods_duel{team_id = TeamId},
                      s_event_pid = EventPid, pos = Pos},
         {check_follow,
          #{event := 41, pid := Pid, id := Mid, name := Name}}) ->
    case gods_duel_team:get_team_id(Mid) of
        {true, MateTeamId} when MateTeamId =/= TeamId ->
            role:apply(async, Pid, {team, async_leave, []}),
            notice:send({pid, Pid},
                        1,
                        lang:get("由于您不属于队长的战队，已被自动踢出小队。")),
            team:notice(Role,
                        notice:format(lang:get("~ts不属于您的战队，已将其踢出队伍"),
                                      [{role_2, Name}])),
            {ok, false};
        _ -> {ok, {true, 41, EventPid, Pos}}
    end;
callback(#role{s_event = 17, s_event_pid = EventPid,
               id = Id, pos = Pos},
         {check_follow,
          #{event := 17, pid := Pid, id := Mid}}) ->
    case guild_war:check_alliance(Id, Mid) of
        true -> {ok, {true, 17, EventPid, Pos}};
        _ ->
            notice:send({pid, Pid},
                        1,
                        lang:get("队长正在公会战中，你和队长不是同一公会联盟")),
            {ok, false}
    end;
callback(#role{s_event = 18, s_event_pid = EventPid,
               id = Id, pos = Pos},
         {check_follow,
          #{event := 18, pid := Pid, id := Mid}}) ->
    case guild_war:check_alliance(Id, Mid) of
        true -> {ok, {true, 18, EventPid, Pos}};
        _ ->
            notice:send({pid, Pid},
                        1,
                        lang:get("队长正在公会战中，你和队长不是同一公会联盟")),
            {ok, false}
    end;
callback(#role{},
         {check_follow, #{event := Event2, pid := Pid}})
    when Event2 =:= 18 orelse Event2 =:= 17 ->
    notice:send({pid, Pid}, 1, lang:get("队长不在公会战中")),
    {ok, false};
callback(#role{s_event = 32, s_event_pid = EventPid,
               id = Id, pos = Pos},
         {check_follow,
          #{event := 32, pid := Pid, id := Mid}}) ->
    case guild_league_guild:check_alliance(Id, Mid) of
        true -> {ok, {true, 32, EventPid, Pos}};
        _ ->
            notice:send({pid, Pid}, 1, lang:get("队长在公会联赛中")),
            {ok, false}
    end;
callback(#role{s_event = 33, s_event_pid = EventPid,
               id = Id, pos = Pos},
         {check_follow,
          #{event := 33, pid := Pid, id := Mid}}) ->
    case guild_league_guild:check_alliance(Id, Mid) of
        true -> {ok, {true, 33, EventPid, Pos}};
        _ ->
            notice:send({pid, Pid}, 1, lang:get("队长在公会联赛中")),
            {ok, false}
    end;
callback(#role{},
         {check_follow, #{event := Event2, pid := Pid}})
    when Event2 =:= 33 orelse Event2 =:= 32 ->
    notice:send({pid, Pid}, 1, lang:get("队长不在公会联赛中")),
    {ok, false};
callback(Role = #role{id = LeaderId, s_event = 56,
                      s_event_pid = EventPid, pos = Pos},
         {check_follow,
          #{event := Event, pid := Pid,
            team_mate :=
                #team_mate{id = MateId, lev = Lev, name = Name}}})
    when Event =:= 0 orelse
             Event =:= 56 orelse Event =:= 28 orelse Event =:= 2 ->
    logger:debug("============:玩家归队", [], team_role, 657),
    case Lev >= 65 of
        true ->
            case spirit_treasure_mgr:is_same_group(LeaderId, MateId)
                of
                true -> {ok, {true, 56, EventPid, Pos}};
                _ ->
                    role:apply(async, Pid, {team, async_leave, []}),
                    notice:send({pid, Pid},
                                1,
                                lang:get("您与队长分属不同的分组，无法一起挑战龙王")),
                    team:notice(Role,
                                notice:format(lang:get("~ts与队长分属不同分组，自动退出了队伍"),
                                              [{role_2, Name}])),
                    {ok, false}
            end;
        _ ->
            Msg = notice:format(lang:get("您等级不足~ts级，不能参加龙王试炼"),
                                [{string_2, 1, 65}]),
            notice:send({pid, Pid}, 1, Msg),
            {ok, false}
    end;
callback(Role = #role{id = LeaderId, s_event = 67,
                      s_event_pid = EventPid, pos = Pos},
         {check_follow,
          #{event := Event, pid := Pid,
            team_mate :=
                #team_mate{id = MateId, lev = Lev, name = Name}}})
    when Event =:= 0 orelse
             Event =:= 67 orelse Event =:= 28 orelse Event =:= 2 ->
    logger:debug("============:玩家归队", [], team_role, 676),
    case Lev >= 90 of
        true ->
            case oracle_treasure_mgr:is_same_group(LeaderId, MateId)
                of
                true -> {ok, {true, 67, EventPid, Pos}};
                _ ->
                    role:apply(async, Pid, {team, async_leave, []}),
                    notice:send({pid, Pid},
                                1,
                                lang:get("您与队长分属不同的分组，无法一起挑战天启")),
                    team:notice(Role,
                                notice:format(lang:get("~ts与队长分属不同分组，自动退出了队伍"),
                                              [{role_2, Name}])),
                    {ok, false}
            end;
        _ ->
            Msg = notice:format(lang:get("您等级不足~ts级，不能参加天启试炼"),
                                [{string_2, 1, 90}]),
            notice:send({pid, Pid}, 1, Msg),
            {ok, false}
    end;
callback(#role{s_event = 47, name = _Name,
               s_event_pid = EventPid, pid = Pid, id = Id, pos = Pos},
         {check_follow, _Args = #{event := Event2, id := MId}})
    when Event2 =:= 47 ->
    logger:debug("成员进入公会副本boss  ~ts ~w ",
                 [_Name, _Args],
                 team_role,
                 696),
    case guild_util:is_in_same(Id, MId) of
        true -> {ok, {true, 47, EventPid, Pos}};
        _ ->
            notice:send({pid, Pid}, 1, lang:get("不是同一个公会")),
            {ok, false}
    end;
callback(Role = #role{name = _Name, s_event = 47,
                      m_team = #m_team{status = 2}},
         {enter_map, #{pos := Pos}, TeamEvt}) ->
    logger:debug("退出公会副本 玩家  ~ts", [_Name], team_role, 706),
    do_role_enter_map(Role#role{s_event = 47},
                      Pos,
                      TeamEvt);
callback(Role = #role{s_event = 21,
                      s_event_pid = EventPid, id = Id, pos = Pos},
         {check_follow,
          #{event := 21, pid := Pid, id := Mid, name := Name}}) ->
    case hero_role:is_same_group(Id, Mid) of
        true -> {ok, {true, 21, EventPid, Pos}};
        _E ->
            role:apply(async, Pid, {team, async_leave, []}),
            notice:send({pid, Pid}, 1, lang:get("队长不是同阵营")),
            team:notice(Role,
                        notice:format(lang:get("~ts跟我们阵营不同，自动退出了队伍"),
                                      [{role_2, Name}])),
            {ok, false}
    end;
callback(Role = #role{s_event = 20,
                      s_event_pid = EventPid, id = Id, pos = Pos},
         {check_follow,
          #{event := 20, pid := Pid, id := Mid, name := Name}}) ->
    case hero_role:is_same_group(Id, Mid) of
        true -> {ok, {true, 20, EventPid, Pos}};
        _E ->
            role:apply(async, Pid, {team, async_leave, []}),
            notice:send({pid, Pid}, 1, lang:get("队长不是同阵营")),
            team:notice(Role,
                        notice:format(lang:get("~ts跟我们阵营不同，自动退出了队伍"),
                                      [{role_2, Name}])),
            {ok, false}
    end;
callback(Role = #role{},
         {check_follow,
          #{event := Event2, pid := Pid, name := Name}})
    when Event2 =:= 21 orelse Event2 =:= 20 ->
    role:apply(async, Pid, {team, async_leave, []}),
    notice:send({pid, Pid}, 1, lang:get("队长不在荣耀战场中")),
    team:notice(Role,
                notice:format(lang:get("~ts跟我们阵营不同，自动退出了队伍"),
                              [{role_2, Name}])),
    {ok, false};
callback(Leader = #role{s_event = Event1},
         {check_follow,
          #{event := Event2, name := Name, pid := Pid}})
    when Event1 =/= Event2 andalso
             (Event1 == 21 orelse Event1 == 20) ->
    role:apply(async, Pid, {team, async_leave, []}),
    treat_follow_event(Leader, Pid),
    team:notice(Leader,
                notice:format(lang:get("~ts跟我们阵营不同，自动退出了队伍"),
                              [{role_2, Name}])),
    {ok, false};
callback(Leader = #role{s_event = Event1},
         {check_follow,
          #{event := Event2, name := Name, pid := Pid}})
    when Event1 =/= Event2 andalso
             (Event2 == 21 orelse Event2 == 20) ->
    role:apply(async, Pid, {team, async_leave, []}),
    treat_follow_event(Leader, Pid),
    team:notice(Leader,
                notice:format(lang:get("~ts跟我们阵营不同，自动退出了队伍"),
                              [{role_2, Name}])),
    {ok, false};
callback(#role{s_event = 23, s_event_pid = EventPid,
               pos = Pos},
         {check_follow,
          #{event := Event2, pos := #pos{map_pid = _MapPid2},
            pid := Pid}})
    when Event2 =/= 23 ->
    case env:get(camp_dragon_boat_status) of
        {match, _} ->
            notice:send({pid, Pid}, 1, lang:get("端午龙舟中不能归队")),
            {ok, false};
        _ ->
            logger:debug("玩家归队:~w",
                         [{true, 23, EventPid, Pos}],
                         team_role,
                         752),
            {ok, {true, 23, EventPid, Pos}}
    end;
callback(Leader = #role{s_event = 24},
         {check_follow, #{event := Event2, pid := Pid}})
    when Event2 =/= 24 ->
    treat_follow_event(Leader, Pid),
    {ok, false};
callback(#role{pos = #pos{platform = P, zone_id = Z}},
         {check_follow,
          #{pid := FollowPid,
            pos := #pos{platform = P1, zone_id = Z1}}})
    when P1 =/= P orelse Z1 =/= Z ->
    notice:send({pid, FollowPid},
                1,
                lang:get("你们不在同一区，不能归队")),
    {ok, false};
callback(Leader = #role{s_event = 65,
                        s_event_pid = EventPid, pos = Pos},
         {check_follow, #{event := Event2, pid := Pid}})
    when Event2 =/= 65 ->
    treat_follow_event(Leader, Pid),
    {ok, {true, 65, EventPid, Pos}};
callback(Leader = #role{s_event = 66,
                        s_event_pid = EventPid, pos = Pos},
         {check_follow, #{event := Event2, pid := Pid}})
    when Event2 =/= 66 ->
    treat_follow_event(Leader, Pid),
    {ok, {true, 66, EventPid, Pos}};
callback(#role{s_event = 63},
         {check_follow, #{event := Event, pid := Pid}})
    when Event =/= 63 ->
    notice:send({pid, Pid},
                1,
                lang:get("队长正在诸神殿堂中，请入场后再归队。")),
    {ok, false};
callback(Leader = #role{s_event = 63,
                        s_event_pid = EventPid, pos = Pos},
         {check_follow, #{event := Event2, pid := Pid}})
    when Event2 =/= 63 ->
    treat_follow_event(Leader, Pid),
    {ok, {true, 63, EventPid, Pos}};
callback(Leader = #role{s_event = 72, lev = Lev,
                        m_lev_break = #m_lev_break{times = BKTimes},
                        s_event_pid = EventPid, pos = Pos},
         _Args = {check_follow,
                  #{event := Event2, pid := Pid,
                    team_mate :=
                        #team_mate{lev = MateLev,
                                   lev_break_times = MateBKTimes}}})
    when Event2 =/= 72 ->
    logger:debug("~w", [_Args], team_role, 781),
    case canyon_summit_data:get_group(Lev, BKTimes) =:=
             canyon_summit_data:get_group(MateLev, MateBKTimes)
        of
        true ->
            treat_follow_event(Leader, Pid),
            {ok, {true, 72, EventPid, Pos}};
        _ ->
            role:apply(async, Pid, {team, async_leave, []}),
            notice:send({pid, Pid}, 1, lang:get("你们不在同一等级段，不能归队")),
            {ok, false}
    end;
callback(Leader = #role{s_event = Event1},
         {check_follow, #{event := Event2, pid := Pid}})
    when Event1 =/= Event2 ->
    treat_follow_event(Leader, Pid),
    {ok, false};
callback(#role{s_event = Event, s_event_pid = EventPid,
               pos = Pos},
         {check_follow, _M}) ->
    {ok, {true, Event, EventPid, Pos}};
callback(Role, check_handover) ->
    Reply = case team_util:check_handover([escort,
                                           qualifying,
                                           combat],
                                          Role)
                of
                true -> true;
                _ -> {false, lang:get("现在不能更换队长")}
            end,
    {ok, Reply};
callback(Role, {del_help_info_by_fun_type, FunType}) ->
    case help:del_help_info_by_fun_type(Role, FunType) of
        {ok, NewRole} -> {ok, NewRole};
        _ -> ok
    end;
callback(#role{}, _Args) ->
    logger:debug("未知 ~w", [_Args], team_role, 811),
    ok.

push(#role{link = #link{conn_pid = ConnPid}},
     11721 = Cmd) ->
    sys_conn:pack_send(ConnPid, Cmd, {0, ""}).

do_role_enter_map(Role = #role{s_event = Event,
                               name = _Name},
                  #pos{platform = P, zone_id = Z, x = X, y = Y,
                       map = MapId, map_grid_pid = GridPid},
                  TeamEvt) ->
    logger:debug("队友进入地图 ~ts, ~w",
                 [_Name, {MapId, X, Y}],
                 team_role,
                 821),
    {NewEvent, EnterPos} = case TeamEvt of
                               #{label := exit_dun, ext := [_ExitPos]} ->
                                   {0, {P, Z, MapId, GridPid, X, Y}};
                               #{label := enter_dun} ->
                                   {1, {P, Z, MapId, GridPid, X, Y}};
                               #{label := enter_event, event := EnterEvent} ->
                                   {EnterEvent, {P, Z, MapId, GridPid, X, Y}};
                               #{label := exit_event, event := ExitEvent} ->
                                   {ExitEvent, {P, Z, MapId, GridPid, X, Y}};
                               _ -> {Event, {P, Z, MapId, GridPid, X, Y}}
                           end,
    case map:role_enter(EnterPos,
                        self,
                        Role#role{s_event = NewEvent})
        of
        {ok, Role1} ->
            NewRole = case TeamEvt of
                          #{mfa := {M, F, A}}
                              when is_atom(M) andalso
                                       is_atom(F) andalso is_list(A) ->
                              case catch erlang:apply(M,
                                                      F,
                                                      [Role,
                                                       Role1,
                                                       {P, Z, MapId, X, Y}
                                                       | A])
                                  of
                                  {ok, Role2} -> Role2;
                                  {false, _Reason} ->
                                      logger:error("队员执行回调进入地图失败:~w",
                                                   [_Reason],
                                                   team_role,
                                                   845),
                                      Role1;
                                  _Reason ->
                                      logger:error("队员执行回调进入地图失败:~w",
                                                   [_Reason],
                                                   team_role,
                                                   848),
                                      Role1
                              end;
                          _ -> Role1
                      end,
            {ok, NewRole};
        {error, _Reason} -> team:away(Role)
    end.

auto_match(Role,
           #team_mate{join_type = 2, join_time = JoinTime,
                      expect_type = Type}) ->
    case date:unixtime() - JoinTime < 60 - 60 of
        true ->
            case team_mgr:match(Role, Type) of
                {ok, NewRole} -> {ok, NewRole};
                _ -> {ok, Role}
            end;
        _ -> {ok, Role}
    end;
auto_match(Role, _) -> {ok, Role}.

treat_follow_event(#role{s_event = 6}, Pid) ->
    role:apply(async, Pid, {fairyland, join_to_follow, []});
treat_follow_event(#role{s_event = 5}, Pid) ->
    role:apply(async,
               Pid,
               {qualifying_util, join_to_follow, []});
treat_follow_event(#role{s_event = 16}, Pid) ->
    role:apply(async,
               Pid,
               {top_compete_util, join_to_follow, []});
treat_follow_event(#role{s_event = 19}, Pid) ->
    role:apply(async, Pid, {meet_pet, join_to_follow, []});
treat_follow_event(#role{s_event = 22, id = Id}, Pid) ->
    role:apply(async,
               Pid,
               {guild_hero, join_to_follow, [Id]});
treat_follow_event(#role{s_event = 65}, Pid) ->
    role:apply(async,
               Pid,
               {provocation_role, role_callback, [join_to_follow]});
treat_follow_event(#role{s_event = 72}, Pid) ->
    role:apply(async,
               Pid,
               {canyon_summit_role, role_callback, [join_to_follow]});
treat_follow_event(#role{s_event = 24}, Pid) ->
    notice:send({pid, Pid}, 1, lang:get("队长在武道会中，不能跟随"));
treat_follow_event(#role{id = Id, s_event = 28}, Pid) ->
    role:apply(async,
               Pid,
               {family_logic, join_to_follow, [Id]});
treat_follow_event(#role{s_event = 30}, Pid) ->
    notice:send({pid, Pid}, 1, lang:get("队长正在参加祈福灯会，不能归队"));
treat_follow_event(#role{s_event = 41}, Pid) ->
    notice:send({pid, Pid}, 1, lang:get("队长在诸神之战中,不能归队"));
treat_follow_event(#role{s_event = 42,
                         m_preparation = #m_preparation{id = RoomId}},
                   Pid) ->
    role:apply(async,
               Pid,
               {preparation_role, join_to_follow, [RoomId]});
treat_follow_event(#role{name = _Name, id = Id,
                         s_event = 47},
                   Pid) ->
    logger:debug("玩家  ~ts 公会副本boss ~w",
                 [_Name, Pid],
                 team_role,
                 912),
    role:apply(async,
               Pid,
               {guild_dungeon, join_to_follow, [Id]});
treat_follow_event(_, Pid) ->
    notice:send({pid, Pid}, 1, lang:get("当前状态不能跟随")).

