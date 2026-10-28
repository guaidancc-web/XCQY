-file("src/mod/goodvoice/goodvoice_mgr.erl", 1).

-module(goodvoice_mgr).

-behaviour(gen_server).

-export([start_link/0, cast/1, call/1, info/1]).

-export([get_list/0,
         lookup/1,
         lookup_rank/1,
         has_record/1,
         get_log/1,
         base_dir/2,
         rank_dir/0,
         handle_report/6,
         find_report/1,
         insert_test/1,
         get_status/0,
         set_status/1,
         get_submit/0,
         rename/1,
         update_rank/1,
         update_rank_only_liked/1,
         get_rank/1,
         get_rank_val/2,
         gm_reward/0,
         load_rank_data/0,
         apply_evt/1]).

-export([init/1,
         handle_call/3,
         handle_cast/2,
         handle_info/2,
         terminate/2,
         code_change/3]).

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

-file("src/mod/goodvoice/goodvoice_mgr.erl", 46).

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

-file("src/mod/goodvoice/goodvoice_mgr.erl", 47).

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

-file("src/mod/goodvoice/goodvoice_mgr.erl", 48).

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

-file("src/mod/goodvoice/goodvoice_mgr.erl", 49).

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

-file("src/mod/goodvoice/goodvoice_mgr.erl", 50).

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

-file("src/mod/goodvoice/goodvoice_mgr.erl", 51).

-file("inc/rank.hrl", 1).

-record(rank,
        {type = 1,
         show_list = [],
         list = [],
         last_val = 0,
         len = 0}).

-record(rank_rc,
        {ver = 3 :: pos_integer(),
         id = {roleid, platform, zoneid} :: term(),
         rank = 1,
         time = 0 :: non_neg_integer(),
         role_id = 0 :: non_neg_integer(),
         platform = "" :: list(),
         zone_id = 0 :: non_neg_integer(),
         name = "" :: list(),
         sex = 0 :: 0..2,
         classes = 0 :: 0..4,
         lev = 0 :: non_neg_integer(),
         val1 = 0 :: non_neg_integer(),
         val2 = 0 :: non_neg_integer(),
         val3 = 0 :: non_neg_integer(),
         val4 = 0 :: non_neg_integer(),
         desc = "",
         pet,
         guard,
         eqm}).

-record(rank_cfg,
        {type = 0 :: non_neg_integer(),
         num = 100 :: non_neg_integer(),
         keys = [#rank_rc.val3, #rank_rc.val2, #rank_rc.val1] ::
             [pos_integer()],
         min_val = 1 :: pos_integer(),
         nologin = 0 :: non_neg_integer(),
         zone = rank_zone_1 :: atom()}).

-file("src/mod/goodvoice/goodvoice_mgr.erl", 52).

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

-file("src/mod/goodvoice/goodvoice_mgr.erl", 53).

-record(state,
        {status = 1, next_id = 1, push_flag = 0}).

cast(Args) -> gen_server:cast(goodvoice_mgr, Args).

call(Args) ->
    case catch gen_server:call(goodvoice_mgr, Args, 10000)
        of
        {'EXIT', {timeout, _}} -> {error, timeout};
        {'EXIT', {noproc, _}} -> {error, noproc};
        {'EXIT', {normal, _}} -> {error, exit};
        {'EXIT', _Call_Err} -> {error, _Call_Err};
        _Call_Return -> _Call_Return
    end.

info(Args) -> goodvoice_mgr ! Args.

start_link() ->
    gen_server:start_link({local, goodvoice_mgr},
                          goodvoice_mgr,
                          [],
                          []).

get_list() ->
    Status = get_status(),
    case Status >= 5 of
        true -> ets:tab2list(ets_goodvoice_all);
        false -> ets:tab2list(ets_goodvoice)
    end.

get_status() ->
    case env:get(goodvoice_status) of
        Status when is_integer(Status) -> Status;
        _ -> 1
    end.

get_submit() ->
    case env:get(goodvoice_local_submit) of
        SubmitList when is_list(SubmitList) -> SubmitList;
        _ -> []
    end.

gm_reward() ->
    case env:get(goodvoice_local_submit) of
        SubmitList = [_ | _] ->
            Title = lang:get("好声音奖励补偿"),
            Content = lang:get("由于之前好声音奖励称号卡发放时效错误，现重新补偿给您新的称号卡"),
            do_gm_reward(SubmitList, Title, Content);
        _ -> skip
    end.

do_gm_reward([], _, _) -> ok;
do_gm_reward([{RoleId, RoleName, Num} | T], Title,
             Content)
    when Num =< 10 ->
    Items = case Num of
                1 -> [{22758, 1}];
                2 -> [{22759, 1}];
                3 -> [{22760, 1}];
                _ -> [{22761, 1}]
            end,
    mail:send(RoleId,
              #{title => Title, content => Content, items => Items}),
    logger:info("给[~ts]补偿第[~w]名称号卡[~w]",
                [RoleName, Num, Items],
                goodvoice_mgr,
                135),
    do_gm_reward(T, Title, Content);
do_gm_reward([_ | T], Title, Content) ->
    do_gm_reward(T, Title, Content).

rename(#role{id = RoleId, name = Name}) ->
    case lookup(RoleId) of
        {true, #goodvoice{}} -> cast({rename, RoleId, Name});
        _ -> skip
    end.

update_rank(L) -> goodvoice_mgr ! {update_rank, L}.

update_rank_only_liked(L) ->
    goodvoice_mgr ! {update_rank_only_liked, L}.

get_rank(Type) when Type =:= 1 ->
    ets:tab2list(goodvoice_rank);
get_rank(_Type) ->
    ets:tab2list(goodvoice_rank_only_liked).

get_rank_val(Type, Id) when Type =:= 1 ->
    case ets:lookup(goodvoice_rank, Id) of
        [#goodvoice_rank{rank = Rank, liked = Liked}] ->
            {Rank, Liked};
        _ -> {0, 0}
    end;
get_rank_val(_Type, Id) ->
    case ets:lookup(goodvoice_rank_only_liked, Id) of
        [#goodvoice_rank{rank = Rank, liked = Liked}] ->
            {Rank, Liked};
        _ -> {0, 0}
    end.

set_status(Status) ->
    case Status >= 1 andalso Status =< 8 of
        true -> cast({set_status, Status});
        _ -> skip
    end.

base_dir(P, Z) ->
    Zstr = integer_to_list(Z),
    "good_voice/" ++ P ++ "_" ++ Zstr ++ "/".

rank_dir() -> "good_voice/" ++ "rank/".

lookup(RoleId) ->
    case catch ets:lookup(ets_goodvoice, RoleId) of
        [Gv = #goodvoice{}] -> {true, Gv};
        _ -> false
    end.

lookup_rank(RoleId) ->
    case catch ets:lookup(goodvoice_rank, RoleId) of
        [Gv = #goodvoice_rank{}] -> {true, Gv};
        _ -> false
    end.

has_record(RoleId) ->
    case catch ets:member(ets_goodvoice, RoleId) of
        true -> true;
        _ -> false
    end.

get_log(RoleId) ->
    case catch ets:lookup_element(ets_goodvoice,
                                  RoleId,
                                  #goodvoice.logs)
        of
        Logs when is_list(Logs) -> Logs;
        _ -> []
    end.

filename(#goodvoice{role_id = {Rid, P, Z},
                    update_time = UpdateTime}) ->
    lists:concat([1,
                  "_",
                  Rid,
                  "_",
                  P,
                  "_",
                  Z,
                  "_",
                  UpdateTime]).

insert(GoodVoice = #goodvoice{}, Voice) ->
    FileName = filename(GoodVoice),
    NewGoodVoice = GoodVoice#goodvoice{file_name =
                                           FileName},
    case insert_file(NewGoodVoice, Voice) of
        true ->
            insert_cache(NewGoodVoice),
            true;
        _ -> false
    end.

insert_cache(GoodVoice) ->
    ets:insert(ets_goodvoice, GoodVoice),
    dets:insert(dets_goodvoice, GoodVoice),
    ok.

delete_cache() ->
    ets:delete_all_objects(ets_goodvoice),
    dets:delete_all_objects(dets_goodvoice),
    ok.

insert_test(RoleId) ->
    P = env:get(platform),
    Z = env:get(zone_id),
    Now = date:unixtime(),
    GoodVoice = #goodvoice{role_id = {RoleId, P, Z},
                           name = "test", time = 10, update_time = Now},
    insert_cache(GoodVoice).

insert_file(#goodvoice{platform = P, zone_id = Z,
                       file_name = FileName},
            Voice) ->
    FileDir = base_dir(P, Z) ++ FileName,
    logger:debug("========== ~w",
                 [FileDir],
                 goodvoice_mgr,
                 274),
    case filelib:is_dir(base_dir(P, Z)) of
        true -> ok;
        _ ->
            case file:make_dir(base_dir(P, Z)) of
                ok -> ok;
                _Res ->
                    logger:error("无法创建好声音目录 ~w",
                                 [_Res],
                                 goodvoice_mgr,
                                 281),
                    ok
            end
    end,
    case file:write_file(FileDir, Voice) of
        ok -> true;
        _Err ->
            logger:error("语音文件写入失败:~w", [_Err], goodvoice_mgr, 288),
            false
    end.

delete_file(#goodvoice{file_name = ""}) -> ok;
delete_file(#goodvoice{file_name = FileName,
                       platform = P, zone_id = Z}) ->
    FileDir = base_dir(P, Z) ++ FileName,
    file:delete(FileDir);
delete_file(#goodvoice_rank{file_name = FileName}) ->
    FileDir = rank_dir() ++ FileName,
    file:delete(FileDir).

handle_report(Rid, Plat, Zone, HandleState, Items,
              IsCast)
    when is_integer(Rid) andalso
             is_list(Plat) andalso
                 is_integer(Zone) andalso
                     HandleState >= 1 andalso
                         HandleState =< 3 andalso
                             IsCast >= 0 andalso IsCast =< 1 ->
    case check_item(Items) of
        {true, NewItems} ->
            logger:info("后台处理举报HandleState:~w, Items:~w, NewItems:~w, "
                        "IsCast:~w",
                        [HandleState, Items, NewItems, IsCast],
                        goodvoice_mgr,
                        310),
            gen_server:cast(goodvoice_mgr,
                            {handle_report,
                             {Rid, Plat, Zone},
                             HandleState,
                             NewItems,
                             IsCast}),
            ok;
        false ->
            logger:error("后台举报道具错误:~w",
                         [Items],
                         goodvoice_mgr,
                         314),
            false
    end;
handle_report(Rid, Plat, Zone, HandleState, Items,
              IsCast) ->
    logger:error("后台举报发放错误参数:~w,~w,~w,~w",
                 [{Rid, Plat, Zone}, HandleState, Items, IsCast],
                 goodvoice_mgr,
                 319),
    false.

init([]) ->
    logger:info("[~w] 正在启动...",
                [goodvoice_mgr],
                goodvoice_mgr,
                326),
    process_flag(trap_exit, true),
    dets:open_file(dets_goodvoice,
                   [{file, "./dets/goodvoice.dets"},
                    {keypos, #goodvoice.role_id}]),
    dets:open_file(goodvoice_rank,
                   [{file, "./dets/goodvoice_rank.dets"},
                    {keypos, #goodvoice_rank.role_id}]),
    dets:open_file(goodvoice_rank_only_liked,
                   [{file, "./dets/goodvoice_rank_only_liked.dets"},
                    {keypos, #goodvoice_rank.role_id}]),
    ets:new(ets_goodvoice,
            [set,
             named_table,
             public,
             {keypos, #goodvoice.role_id}]),
    ets:new(goodvoice_rank,
            [set,
             named_table,
             public,
             {keypos, #goodvoice_rank.role_id}]),
    ets:new(goodvoice_rank_only_liked,
            [set,
             named_table,
             public,
             {keypos, #goodvoice_rank.role_id}]),
    ets:new(ets_goodvoice_all,
            [set,
             named_table,
             public,
             {keypos, #goodvoice.role_id}]),
    create_dir(),
    ets:new(ets_goodvoice_report,
            [set,
             named_table,
             public,
             {keypos, #goodvoice_report_info.id}]),
    erlang:send_after(util:rand(4000, 10000),
                      self(),
                      load_report),
    StartFlag = case dets:first(dets_goodvoice) of
                    '$end_of_table' ->
                        logger:info("没有数据需要加载", [], goodvoice_mgr, 344),
                        [];
                    _ ->
                        dets:traverse(dets_goodvoice,
                                      fun (G) ->
                                              case goodvoice_ver:do(G) of
                                                  {ok,
                                                   G1 = #goodvoice{id =
                                                                       SongId}} ->
                                                      update_song_id(SongId),
                                                      insert_cache(G1),
                                                      continue;
                                                  _ ->
                                                      logger:error("无法转换好声音版本数据:~w",
                                                                   [G],
                                                                   goodvoice_mgr,
                                                                   355),
                                                      {done, false}
                                              end
                                      end)
                end,
    logger:debug("================== ~w",
                 [StartFlag],
                 goodvoice_mgr,
                 361),
    {StartFlag1, StartFlag2} = load_rank_data(),
    case {StartFlag, StartFlag1, StartFlag2} of
        {[], [], []} ->
            {Status, NeedTime} = calc_status(),
            Ref = erlang:send_after(date:next_diff(0, 0, 2) * 1000,
                                    self(),
                                    zero_reset),
            put(goodvoice_reset_time, Ref),
            case Status of
                1 when NeedTime =:= 0 -> skip;
                1 when NeedTime > 0 ->
                    delete_data(),
                    LastTime = date:unixtime(zero) + 86400 -
                                   date:unixtime(),
                    case NeedTime > LastTime of
                        true -> skip;
                        false ->
                            Ref1 = erlang:send_after((NeedTime + 1) * 1000,
                                                     self(),
                                                     status_reset),
                            put(goodvoice_status_reset, Ref1)
                    end;
                _ ->
                    LastTime = date:unixtime(zero) + 86400 -
                                   date:unixtime(),
                    case NeedTime > LastTime of
                        true -> skip;
                        false ->
                            Ref1 = erlang:send_after((NeedTime + 1) * 1000,
                                                     self(),
                                                     status_reset),
                            put(goodvoice_status_reset, Ref1)
                    end
            end,
            logger:info("好声音当前状态是[~w],进入下个状态还需[~w]秒",
                        [Status, NeedTime],
                        goodvoice_mgr,
                        392),
            env:set(goodvoice_status, Status),
            State = #state{status = Status},
            case get(max_song_id) of
                MaxId when is_integer(MaxId) ->
                    logger:info("[~w] 启动完成",
                                [goodvoice_mgr],
                                goodvoice_mgr,
                                397),
                    State1 = State#state{next_id = MaxId + 1},
                    {ok, State1};
                undefined ->
                    logger:info("[~w] 启动完成",
                                [goodvoice_mgr],
                                goodvoice_mgr,
                                401),
                    {ok, State};
                _MaxIdErr ->
                    logger:error("好声音ID获取错误:~w",
                                 [_MaxIdErr],
                                 goodvoice_mgr,
                                 404),
                    {stop, err_max_id}
            end;
        _StartErr ->
            logger:error("好声音加载数据失败:~w",
                         [_StartErr],
                         goodvoice_mgr,
                         408),
            {stop, data_load_err}
    end.

handle_call({submit,
             GoodVoice = #goodvoice{role_id = {_, P, Z}},
             Voice},
            _From,
            State = #state{next_id = NextId, status = Status})
    when Status >= 2 andalso Status =< 4 ->
    NewGoodVoice = GoodVoice#goodvoice{id = NextId,
                                       platform = P, zone_id = Z},
    case insert(NewGoodVoice, Voice) of
        true ->
            {reply,
             {true, NextId},
             State#state{next_id = NextId + 1}};
        false ->
            {reply, {false, lang:get("系统繁忙，暂时无法提交报名")}, State}
    end;
handle_call({submit,
             GoodVoice = #goodvoice{role_id = {_, P, Z}},
             Voice},
            _From,
            State = #state{next_id = NextId, status = Status})
    when Status >= 6 andalso Status =< 8 ->
    NewGoodVoice = GoodVoice#goodvoice{id = NextId,
                                       platform = P, zone_id = Z},
    case insert(NewGoodVoice, Voice) of
        true ->
            {reply,
             {true, NextId},
             State#state{next_id = NextId + 1, push_flag = 1}};
        false ->
            {reply, {false, lang:get("系统繁忙，暂时无法提交报名")}, State}
    end;
handle_call({submit, _GoodVoice, _Voice}, _From,
            State = #state{status = 1}) ->
    {reply, {false, lang:get("活动尚未开始，无法报名")}, State};
handle_call({submit, _GoodVoice, _Voice}, _From,
            State = #state{}) ->
    {reply, {false, lang:get("当前阶段已经无法报名")}, State};
handle_call({update_voice, RoleId, Voice, Time}, _From,
            State = #state{}) ->
    case lookup(RoleId) of
        {true, OldGoodVoice = #goodvoice{id = SongId}} ->
            Now = date:unixtime(),
            NewGoodVoice = OldGoodVoice#goodvoice{update_time = Now,
                                                  time = Time},
            delete_file(OldGoodVoice),
            case insert(NewGoodVoice, Voice) of
                true ->
                    {reply, {true, SongId}, State#state{push_flag = 1}};
                false ->
                    {reply, {false, lang:get("系统繁忙，暂时无法提交报名")}, State}
            end;
        _ -> {reply, {false, lang:get("没有找到报名记录")}, State}
    end;
handle_call({update_summary, RoleId, Summary}, _From,
            State = #state{}) ->
    case lookup(RoleId) of
        {true, OldGoodVoice = #goodvoice{id = SongId}} ->
            NewGoodVoice = OldGoodVoice#goodvoice{summary =
                                                      Summary},
            insert_cache(NewGoodVoice),
            {reply, {true, SongId}, State};
        _ -> {reply, {false, lang:get("没有找到报名记录")}, State}
    end;
handle_call({report,
             ReportId,
             ReportLev,
             ReportName,
             Now,
             Report = #goodvoice_report{id = SubmitId}},
            _From, State) ->
    Reply = case find_report(ReportId) of
                {true,
                 ReportInfo = #goodvoice_report_info{report =
                                                         Reported}} ->
                    Len = length(Reported),
                    case Len >= 3 of
                        true -> {false, lang:get("对方已经被多人举报，无需再举报")};
                        false ->
                            case lists:keymember(SubmitId,
                                                 #goodvoice_report.id,
                                                 Reported)
                                of
                                true -> {false, lang:get("你已经举报过对方，请耐心等待处理")};
                                false ->
                                    NewReport = Report#goodvoice_report{order =
                                                                            Len
                                                                                +
                                                                                1},
                                    NewReportInfo =
                                        ReportInfo#goodvoice_report_info{report
                                                                             =
                                                                             [NewReport
                                                                              | Reported]},
                                    case update_report(NewReportInfo,
                                                       {update,
                                                        Len + 1,
                                                        NewReport})
                                        of
                                        true ->
                                            ets_update_report(NewReportInfo),
                                            {true, 0};
                                        false -> {false, lang:get("系统繁忙，请稍后再试")}
                                    end
                            end
                    end;
                null ->
                    case lookup(ReportId) of
                        false -> {false, lang:get("对方已经不在报名状态，无需举报")};
                        {true, #goodvoice{file_name = ""}} ->
                            {false, lang:get("对方已经作品已做处理，无需举报")};
                        {true, #goodvoice{}} ->
                            ReportInfo = #goodvoice_report_info{id = ReportId,
                                                                time = Now,
                                                                lev = ReportLev,
                                                                name =
                                                                    ReportName,
                                                                report =
                                                                    [Report#goodvoice_report{order
                                                                                                 =
                                                                                                 1}]},
                            case update_report(ReportInfo, {create, Report}) of
                                true ->
                                    ets_update_report(ReportInfo),
                                    {true, 1};
                                false -> {false, lang:get("系统繁忙，请稍后再试")}
                            end;
                        _ -> {false, lang:get("对方已经下线，无需举报")}
                    end;
                _ -> {false, lang:get("系统繁忙，请稍后提交")}
            end,
    {reply, Reply, State};
handle_call({vote, SendRoleId, SendRoleName, ToRoleId},
            _From, State = #state{status = 4}) ->
    Reply = case lookup(ToRoleId) of
                {true,
                 OldGoodVoice = #goodvoice{liked = Liked,
                                           likers = Likers, logs = Logs,
                                           only_liked = OnlyLiked}} ->
                    OldData = case lists:keyfind(SendRoleId, 1, Likers) of
                                  {_, Time} -> Time;
                                  _ -> 0
                              end,
                    NewLiked = Liked + 1,
                    NewLikers = lists:keystore(SendRoleId,
                                               1,
                                               Likers,
                                               {SendRoleId, OldData + 1}),
                    NewLogs = lists:sublist([{SendRoleId,
                                              SendRoleName,
                                              1,
                                              1}
                                             | Logs],
                                            20),
                    NewGoodVoice = OldGoodVoice#goodvoice{liked = Liked + 1,
                                                          likers = NewLikers,
                                                          logs = NewLogs,
                                                          only_liked =
                                                              OnlyLiked + 1},
                    insert_cache(NewGoodVoice),
                    Msg =
                        notice:format(lang:get("~ts给你的好声音投了一票，真好听{face_1,2}"),
                                      [{role_2, SendRoleName}]),
                    apply_role(ToRoleId, {msg, Msg}),
                    {true, NewLiked};
                _ -> {false, lang:get("没有找到该报名选手")}
            end,
    {reply, Reply, State};
handle_call({vote, SendRoleId, SendRoleName, ToRoleId},
            _From, State = #state{status = 8}) ->
    case lookup(ToRoleId) of
        {true,
         OldGoodVoice = #goodvoice{liked = Liked,
                                   likers = Likers, logs = Logs,
                                   only_liked = OnlyLiked}} ->
            OldData = case lists:keyfind(SendRoleId, 1, Likers) of
                          {_, Time} -> Time;
                          _ -> 0
                      end,
            NewLiked = Liked + 1,
            NewLikers = lists:keystore(SendRoleId,
                                       1,
                                       Likers,
                                       {SendRoleId, OldData + 1}),
            NewLogs = lists:sublist([{SendRoleId,
                                      SendRoleName,
                                      1,
                                      1}
                                     | Logs],
                                    20),
            NewGoodVoice = OldGoodVoice#goodvoice{liked = Liked + 1,
                                                  likers = NewLikers,
                                                  logs = NewLogs,
                                                  only_liked = OnlyLiked + 1},
            insert_cache(NewGoodVoice),
            Msg =
                notice:format(lang:get("~ts给你的好声音投了一票，真好听{face_1,2}"),
                              [{role_2, SendRoleName}]),
            apply_role(ToRoleId, {msg, Msg}),
            Reply = {true, NewLiked},
            {reply, Reply, State#state{push_flag = 1}};
        _ ->
            Reply = {false, lang:get("没有找到该报名选手")},
            {reply, Reply, State}
    end;
handle_call({vote,
             _SendRoleId,
             _SendRoleName,
             _ToRoleId},
            _From, State = #state{}) ->
    {reply, {false, lang:get("当前阶段不能好评")}, State};
handle_call(_Request, _From, State) -> {noreply, State}.

handle_cast({rename, RoleId, RoleName}, State) ->
    case lookup(RoleId) of
        {true, OldGoodVoice} ->
            NewGoodVoice = OldGoodVoice#goodvoice{name = RoleName},
            insert_cache(NewGoodVoice),
            {noreply, State#state{push_flag = 1}};
        _ -> {noreply, State}
    end;
handle_cast({handle_report,
             RoleId,
             HandleState,
             Items,
             IsCast},
            State) ->
    case find_report(RoleId) of
        {true, AdmReportInfo = #goodvoice_report_info{}} ->
            case do_handle_report(AdmReportInfo, HandleState) of
                ok ->
                    save_report(RoleId, HandleState, Items),
                    del_report(AdmReportInfo),
                    reward_report(AdmReportInfo,
                                  HandleState,
                                  Items,
                                  IsCast),
                    ok;
                {false, Reason} ->
                    logger:error("处理举报操作时出错:~w",
                                 [Reason],
                                 goodvoice_mgr,
                                 583),
                    ok
            end,
            {noreply, State#state{push_flag = 1}};
        null ->
            save_report(RoleId, HandleState, []),
            {noreply, State#state{push_flag = 1}};
        _ -> {noreply, State}
    end;
handle_cast({cast_song, RoleId, CasterRoleId},
            State = #state{status = 2}) ->
    case lookup(RoleId) of
        {true,
         OldGoodVoice = #goodvoice{caster = Caster,
                                   caster_num = CasterNum}} ->
            case lists:member(CasterRoleId, Caster) of
                true -> {noreply, State};
                false ->
                    NewCaster = lists:sublist([CasterRoleId | Caster], 100),
                    NewCasterNum = CasterNum + util:rand(3, 5),
                    NewGoodVoice = OldGoodVoice#goodvoice{caster =
                                                              NewCaster,
                                                          caster_num =
                                                              NewCasterNum},
                    insert_cache(NewGoodVoice),
                    {noreply, State}
            end;
        _ -> {noreply, State}
    end;
handle_cast({cast_song, RoleId, CasterRoleId},
            State = #state{status = 6}) ->
    case lookup(RoleId) of
        {true,
         OldGoodVoice = #goodvoice{caster = Caster,
                                   caster_num = CasterNum}} ->
            case lists:member(CasterRoleId, Caster) of
                true -> {noreply, State};
                false ->
                    NewCaster = lists:sublist([CasterRoleId | Caster], 100),
                    NewCasterNum = CasterNum + util:rand(3, 5),
                    NewGoodVoice = OldGoodVoice#goodvoice{caster =
                                                              NewCaster,
                                                          caster_num =
                                                              NewCasterNum},
                    insert_cache(NewGoodVoice),
                    {noreply, State#state{push_flag = 1}}
            end;
        _ -> {noreply, State}
    end;
handle_cast({cast_song, _, _}, State) ->
    {noreply, State};
handle_cast({flower,
             SendRoleId,
             SendRoleName,
             ToRoleId,
             FlowerNum},
            State = #state{status = Status})
    when Status =:= 4 ->
    case lookup(ToRoleId) of
        {true,
         OldGoodVoice = #goodvoice{flower_likers = FlowerLiker,
                                   update_flower = UpdateFlower,
                                   today_flower = TodayFlower, liked = Liked,
                                   logs = Logs, name = ToRoleName}} ->
            LikeAdd = case Status of
                          4 -> round(20 * FlowerNum);
                          _ -> round(10 * FlowerNum)
                      end,
            logger:debug("送花 ~ts ~w",
                         [ToRoleName, LikeAdd],
                         goodvoice_mgr,
                         639),
            {TodayFlower1, FlowerLiker1} = case
                                               date:is_today(UpdateFlower)
                                               of
                                               true ->
                                                   {TodayFlower, FlowerLiker};
                                               false -> {0, []}
                                           end,
            NewFlowerLiker = [SendRoleId | FlowerLiker1],
            NewUpdateFlower = date:unixtime(),
            AddFlower = case TodayFlower1 >= 200 of
                            true -> 0;
                            false -> min(200 - TodayFlower1, LikeAdd)
                        end,
            {MailFlag, Msg1, Msg2} = case AddFlower of
                                         0 ->
                                             {0,
                                              notice:format(lang:get("~ts给你赠送鲜花，今日收花已增加~ts好评无法再增加"),
                                                            [{role_2,
                                                              SendRoleName},
                                                             {string_2,
                                                              1,
                                                              200}]),
                                              notice:format(lang:get("为~ts赠送了鲜花，对方今日收花已增加~ts好评无法再增加"),
                                                            [{role_2,
                                                              ToRoleName},
                                                             {string_2,
                                                              1,
                                                              200}])};
                                         _ ->
                                             {1,
                                              notice:format(lang:get("~ts给你赠送鲜花，增加~ts点好评"),
                                                            [{role_2,
                                                              SendRoleName},
                                                             {string_2,
                                                              1,
                                                              AddFlower}]),
                                              notice:format(lang:get("为~ts赠送了鲜花，对方的好声音增加了~ts票{face_1,2}"),
                                                            [{role_2,
                                                              ToRoleName},
                                                             {string_2,
                                                              1,
                                                              AddFlower}])}
                                     end,
            case MailFlag of
                1 ->
                    MailInfo = #{items => [], title => lang:get("好声音好评"),
                                 content => Msg1},
                    mail:send(ToRoleId, MailInfo);
                0 -> skip
            end,
            apply_role(ToRoleId, {msg, Msg1}),
            apply_role(SendRoleId, {msg, Msg2}),
            apply_evt(SendRoleId),
            NewLogs = lists:sublist([{SendRoleId,
                                      SendRoleName,
                                      2,
                                      AddFlower}
                                     | Logs],
                                    50),
            NewGoodVoice = OldGoodVoice#goodvoice{flower_likers =
                                                      NewFlowerLiker,
                                                  update_flower =
                                                      NewUpdateFlower,
                                                  liked = Liked + AddFlower,
                                                  today_flower =
                                                      TodayFlower1 + AddFlower,
                                                  logs = NewLogs},
            insert_cache(NewGoodVoice),
            {noreply, State#state{push_flag = 1}};
        _ -> {noreply, State}
    end;
handle_cast({flower,
             SendRoleId,
             SendRoleName,
             ToRoleId,
             FlowerNum},
            State = #state{status = Status})
    when Status =:= 8 ->
    case lookup(ToRoleId) of
        {true,
         OldGoodVoice = #goodvoice{flower_likers = FlowerLiker,
                                   update_flower = UpdateFlower,
                                   today_flower = TodayFlower, liked = Liked,
                                   logs = Logs, name = ToRoleName,
                                   flower = OldFlower}} ->
            LikeAdd = case Status of
                          4 -> round(20 * FlowerNum);
                          _ -> round(10 * FlowerNum)
                      end,
            logger:debug("送花 ~ts ~w",
                         [ToRoleName, LikeAdd],
                         goodvoice_mgr,
                         689),
            {TodayFlower1, FlowerLiker1} = case
                                               date:is_today(UpdateFlower)
                                               of
                                               true ->
                                                   {TodayFlower, FlowerLiker};
                                               false -> {0, []}
                                           end,
            NewFlowerLiker = [SendRoleId | FlowerLiker1],
            NewUpdateFlower = date:unixtime(),
            AddFlower = case TodayFlower1 >= 200 of
                            true -> 0;
                            false -> min(200 - TodayFlower1, LikeAdd)
                        end,
            {MailFlag, Msg1, Msg2} = case AddFlower of
                                         0 ->
                                             {0,
                                              notice:format(lang:get("~ts给你赠送鲜花，今日收花已增加~ts好评无法再增加"),
                                                            [{role_2,
                                                              SendRoleName},
                                                             {string_2,
                                                              1,
                                                              200}]),
                                              notice:format(lang:get("为~ts赠送了鲜花，对方今日收花已增加~ts好评无法再增加"),
                                                            [{role_2,
                                                              ToRoleName},
                                                             {string_2,
                                                              1,
                                                              200}])};
                                         _ ->
                                             {1,
                                              notice:format(lang:get("~ts给你赠送鲜花，增加~ts点好评"),
                                                            [{role_2,
                                                              SendRoleName},
                                                             {string_2,
                                                              1,
                                                              AddFlower}]),
                                              notice:format(lang:get("为~ts赠送了鲜花，对方的好声音增加了~ts票{face_1,2}"),
                                                            [{role_2,
                                                              ToRoleName},
                                                             {string_2,
                                                              1,
                                                              AddFlower}])}
                                     end,
            case MailFlag of
                1 ->
                    MailInfo = #{items => [], title => lang:get("好声音好评"),
                                 content => Msg1},
                    mail:send(ToRoleId, MailInfo);
                0 -> skip
            end,
            apply_role(ToRoleId, {msg, Msg1}),
            apply_role(SendRoleId, {msg, Msg2}),
            apply_evt(SendRoleId),
            NewLogs = lists:sublist([{SendRoleId,
                                      SendRoleName,
                                      2,
                                      AddFlower}
                                     | Logs],
                                    50),
            NewGoodVoice = OldGoodVoice#goodvoice{flower_likers =
                                                      NewFlowerLiker,
                                                  update_flower =
                                                      NewUpdateFlower,
                                                  liked = Liked + AddFlower,
                                                  today_flower =
                                                      TodayFlower1 + AddFlower,
                                                  logs = NewLogs,
                                                  flower =
                                                      OldFlower + AddFlower},
            insert_cache(NewGoodVoice),
            {noreply, State#state{push_flag = 1}};
        _ -> {noreply, State}
    end;
handle_cast({flower, _, _, _, _}, State) ->
    {noreply, State};
handle_cast(fix_local_submit, State) ->
    case env:get(goodvoice_local_submit) of
        {SubmitList, RankList} ->
            env:save(goodvoice_local_submit, SubmitList),
            rank_zone:cast(53, {replace, 53, RankList, #{}});
        _ -> skip
    end,
    {noreply, State};
handle_cast({set_status, Status}, State) ->
    env:set(goodvoice_status, Status),
    role_group:pack_send(world, 16809, {Status}),
    case Status of
        5 ->
            {SubmitList, RankList} = calc_show_list(),
            env:save(goodvoice_local_submit, SubmitList),
            rank_zone:cast(53, {replace, 53, RankList, #{}}),
            case SubmitList of
                [{_, RoleName, _} | _] ->
                    cast_status(Status, [{string_2, 1, RoleName}]);
                _ -> cast_status(Status, [{string_1, ""}])
            end;
        6 ->
            send_show_mail(),
            cast_status(Status, [{string_1, ""}]);
        1 -> delete_data();
        _ -> cast_status(Status, [{string_1, ""}])
    end,
    logger:info("好声音跨服进入[~w]状态",
                [Status],
                goodvoice_mgr,
                765),
    {noreply, State#state{status = Status}};
handle_cast(_Msg, State) -> {noreply, State}.

handle_info(zero_reset, State) ->
    case get(goodvoice_reset_time) of
        OldRef1 when is_reference(OldRef1) ->
            erlang:cancel_timer(OldRef1);
        _ -> skip
    end,
    case get(goodvoice_status_reset) of
        OldRef2 when is_reference(OldRef2) ->
            erlang:cancel_timer(OldRef2);
        _ -> skip
    end,
    {Status, NeedTime} = calc_status(),
    logger:info("0点计算好声音当前状态[~w]还需[~w]秒进入下阶段",
                [Status, NeedTime],
                goodvoice_mgr,
                782),
    case Status of
        1 when NeedTime =:= 0 -> skip;
        _ ->
            LastTime = date:unixtime(zero) + 86400 -
                           date:unixtime(),
            case NeedTime > LastTime of
                true -> skip;
                false ->
                    Ref1 = erlang:send_after((NeedTime + 1) * 1000,
                                             self(),
                                             status_reset),
                    put(goodvoice_status_reset, Ref1)
            end
    end,
    Ref = erlang:send_after(date:next_diff(0, 0, 2) * 1000,
                            self(),
                            zero_reset),
    put(goodvoice_reset_time, Ref),
    env:set(goodvoice_status, Status),
    {noreply, State#state{status = Status}};
handle_info(status_reset,
            State = #state{status = Status}) ->
    case get(goodvoice_status_reset) of
        OldRef when is_reference(OldRef) ->
            erlang:cancel_timer(OldRef);
        _ -> skip
    end,
    {NewStatus, NeedTime} = calc_status(),
    case NewStatus of
        1 when NeedTime =:= 0 -> skip;
        _ ->
            LastTime = date:unixtime(zero) + 86400 -
                           date:unixtime(),
            case NeedTime > LastTime of
                true -> skip;
                false ->
                    Ref1 = erlang:send_after((NeedTime + 1) * 1000,
                                             self(),
                                             status_reset),
                    put(goodvoice_status_reset, Ref1)
            end
    end,
    logger:info("好声音活动从[~w]跳转到[~w]状态",
                [Status, NewStatus],
                goodvoice_mgr,
                817),
    case NewStatus of
        5 ->
            {SubmitList, RankList} = calc_show_list(),
            env:save(goodvoice_local_submit, SubmitList),
            rank_zone:cast(53, {replace, 53, RankList, #{}}),
            case SubmitList of
                [{_, RoleName, _} | _] ->
                    cast_status(NewStatus, [{string_2, 1, RoleName}]);
                _ -> cast_status(NewStatus, [{string_1, ""}])
            end;
        6 ->
            send_show_mail(),
            cast_status(NewStatus, [{string_1, ""}]);
        1 -> skip;
        _ -> cast_status(NewStatus, [{string_1, ""}])
    end,
    env:set(goodvoice_status, NewStatus),
    role_group:pack_send(world, 16809, {NewStatus}),
    {noreply, State#state{status = NewStatus}};
handle_info(load_report, State) ->
    Sql = "select id, platform, zone_id, time, "
          "lev, name, id_1, platform_1, zone_id_1, "
          "name_1, lev_1, time_1, filename_1, id_2, "
          "platform_2, zone_id_2, name_2, lev_2, "
          "time_2, filename_2, id_3, platform_3, "
          "zone_id_3, name_3, lev_3, time_3, filename_3 "
          "from goodvoice_report where state = "
          "?",
    case db:get_all(Sql, [0]) of
        {ok, L} -> do_load_report(L);
        {error, _Err} ->
            logger:error("加载举报数时发生错误:~w",
                         [_Err],
                         goodvoice_mgr,
                         848)
    end,
    {noreply, State};
handle_info(push_local_data,
            State = #state{push_flag = 1}) ->
    Data = ets:tab2list(ets_goodvoice),
    Data1 = [D#goodvoice{logs = [], caster = [],
                         flower_likers = []}
             || D <- Data],
    P = env:get(platform),
    Z = env:get(zone_id),
    big_world:cast(c_goodvoice_mgr,
                   info,
                   [{update_local_data, P, Z, Data1}]),
    {noreply, State#state{push_flag = 0}};
handle_info(init_push_local_data, State) ->
    Data = ets:tab2list(ets_goodvoice),
    Data1 = [D#goodvoice{logs = [], caster = [],
                         flower_likers = []}
             || D <- Data],
    P = env:get(platform),
    Z = env:get(zone_id),
    big_world:cast(c_goodvoice_mgr,
                   info,
                   [{update_local_data, P, Z, Data1}]),
    {noreply, State#state{push_flag = 0}};
handle_info({update_all_data, Data}, State) ->
    ets:delete_all_objects(ets_goodvoice_all),
    ets:insert(ets_goodvoice_all, Data),
    {noreply, State};
handle_info({update_rank, Data}, State) ->
    logger:debug("更新偶像榜 ~w", [Data], goodvoice_mgr, 878),
    OldData = ets:tab2list(goodvoice_rank),
    delete_rank(OldData),
    ets:delete_all_objects(goodvoice_rank),
    dets:delete_all_objects(goodvoice_rank),
    ets:insert(goodvoice_rank, Data),
    dets:insert(goodvoice_rank, Data),
    copy_files(Data),
    {noreply, State};
handle_info({update_rank_only_liked, Data}, State) ->
    logger:debug("更新实力榜 ~w", [Data], goodvoice_mgr, 889),
    OldData = ets:tab2list(goodvoice_rank_only_liked),
    delete_rank(OldData),
    ets:delete_all_objects(goodvoice_rank_only_liked),
    dets:delete_all_objects(goodvoice_rank_only_liked),
    ets:insert(goodvoice_rank_only_liked, Data),
    dets:insert(goodvoice_rank_only_liked, Data),
    copy_files(Data),
    {noreply, State};
handle_info(fix_new_season, State) ->
    logger:info("开始修复", [], goodvoice_mgr, 900),
    List = ets:tab2list(ets_goodvoice),
    lists:foreach(fun (#goodvoice{role_id = RoleId,
                                  name = _Name, update_time = Time,
                                  today_flower = TodayFlower,
                                  liked = OldLiked} =
                           GoodVoice) ->
                          case Time < 1490976000 of
                              true ->
                                  logger:info("好声音被删除数据 ~w ~w ~w ~w",
                                              [RoleId,
                                               TodayFlower,
                                               OldLiked,
                                               Time],
                                              goodvoice_mgr,
                                              906),
                                  ets:delete(ets_goodvoice, RoleId),
                                  dets:delete(dets_goodvoice, RoleId);
                              _ ->
                                  logger:info("玩家 ~ts 修复前好评数 ~w 修复后好评数 ~w",
                                              [_Name, OldLiked, TodayFlower],
                                              goodvoice_mgr,
                                              910),
                                  ets:insert(ets_goodvoice,
                                             GoodVoice#goodvoice{liked =
                                                                     TodayFlower}),
                                  dets:insert(dets_goodvoice,
                                              GoodVoice#goodvoice{liked =
                                                                      TodayFlower})
                          end
                  end,
                  List),
    ets:delete_all_objects(goodvoice_rank),
    dets:delete_all_objects(goodvoice_rank),
    logger:info("修复成功", [], goodvoice_mgr, 917),
    {noreply, State};
handle_info(_Info, State) -> {noreply, State}.

terminate(_Reason, _State) ->
    logger:info("[~w] 正在关闭...",
                [goodvoice_mgr],
                goodvoice_mgr,
                923),
    logger:info("[~w] 关闭完成",
                [goodvoice_mgr],
                goodvoice_mgr,
                924),
    ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

delete_data() ->
    Data = ets:tab2list(ets_goodvoice),
    do_delete_data(Data).

do_delete_data([]) ->
    ets:delete_all_objects(ets_goodvoice_all),
    delete_cache(),
    ok;
do_delete_data([GoodVoice = #goodvoice{} | T]) ->
    delete_file(GoodVoice),
    do_delete_data(T);
do_delete_data([_ | T]) -> do_delete_data(T).

calc_show_list() ->
    Data = ets:tab2list(ets_goodvoice),
    SorData = util:keys_sort([#goodvoice.caster_num,
                              #goodvoice.liked],
                             Data),
    Now = date:unixtime(),
    do_calc_show_list(SorData, 1, [], [], Now).

do_calc_show_list([], _Num, CanSubmit, RankList,
                  _Now) ->
    CanSubmit1 = lists:reverse(CanSubmit),
    RankList1 = lists:reverse(RankList),
    delete_cache(),
    {CanSubmit1, RankList1};
do_calc_show_list([GoodVoice = #goodvoice{role_id =
                                              RoleId,
                                          name = Name}
                   | T],
                  Num, CanSubmit, RankList, Now) ->
    send_reward(GoodVoice, Num),
    delete_file(GoodVoice),
    case Num =< 10 of
        true ->
            R = to_rank_rc(GoodVoice, Now),
            logger:info("好声音第~w:~w", [Num, R], goodvoice_mgr, 966),
            do_calc_show_list(T,
                              Num + 1,
                              [{RoleId, Name, Num} | CanSubmit],
                              [R | RankList],
                              Now);
        false ->
            do_calc_show_list(T, Num + 1, CanSubmit, RankList, Now)
    end;
do_calc_show_list([_ | T], Num, CanSubmit, RankList,
                  Now) ->
    do_calc_show_list(T, Num, CanSubmit, RankList, Now).

to_rank_rc(#goodvoice{role_id =
                          {RoleId, Platform, ZoneId},
                      name = Name, sex = Sex, lev = Lev, classes = Classes,
                      liked = Liked, caster_num = CasterNum},
           Now) ->
    RankRc = #rank_rc{id = {RoleId, Platform, ZoneId},
                      role_id = RoleId, platform = Platform, zone_id = ZoneId,
                      name = Name, sex = Sex, classes = Classes, lev = Lev,
                      time = Now, val1 = Liked, val2 = CasterNum},
    RankRc.

send_reward(#goodvoice{liked = Liked}, _)
    when Liked < 20 ->
    ok;
send_reward(#goodvoice{role_id = RoleId, name = Name,
                       liked = Liked},
            Num) ->
    Items = sing_data:get({0, 1, Num}),
    Title = lang:get("好声音奖励"),
    Content = if Num =:= 1 ->
                     notice:format(lang:get("恭喜您获得~ts！你将代表本服参加跨服入围赛，希望你继续向全服玩家展现自己最美的声音。"),
                                   [{string_2, 1, lang:get("星辰好声音-预选赛冠军")}]);
                 Num =:= 2 ->
                     notice:format(lang:get("恭喜您获得~ts！你将代表本服参加跨服入围赛，希望你继续向全服玩家展现自己最美的声音。"),
                                   [{string_2, 1, lang:get("星辰好声音-预选赛亚军")}]);
                 Num =:= 3 ->
                     notice:format(lang:get("恭喜您获得~ts！你将代表本服参加跨服入围赛，希望你继续向全服玩家展现自己最美的声音。"),
                                   [{string_2, 1, lang:get("星辰好声音-预选赛季军")}]);
                 Num =< 10 ->
                     notice:format(lang:get("恭喜您获得~ts第~ts名！你将代表本服参加跨服入围赛，希望你继续向全服玩家展现自己最美的声音。"),
                                   [{string_2, 1, lang:get("星辰好声音-预选赛")},
                                    {string_2, 1, Num}]);
                 Num =< 20 ->
                     notice:format(lang:get("恭喜您获得~ts第~ts名！虽然没有能获得参加入围赛的资格，但是你的美妙声音也是得到了大家"
                                            "的认可，继续努力。"),
                                   [{string_2, 1, lang:get("星辰好声音-预选赛")},
                                    {string_2, 1, Num}]);
                 true ->
                     notice:format(lang:get("感谢您参与本届~ts！虽然没有能拿到很高的名次，但是你的参赛热情感动了大家，请下次也要参与哟。"),
                                   [{string_2, 1, lang:get("星辰好声音-预选赛")}])
              end,
    logger:info("给[~ts]发送好声音排名[~w]奖励[~w]",
                [Name, Num, Liked],
                goodvoice_mgr,
                1000),
    mail:send(RoleId,
              #{title => Title, content => Content, items => Items}),
    ok;
send_reward(_, _) -> ok.

cast_status(Status, Args) ->
    Msg = case Status of
              2 ->
                  notice:format(lang:get("~ts报名开始啦，赶紧来参与报名吧，唱出自己最美的声音{face_1, "
                                         "18}"),
                                [{string_2, 1, lang:get("星辰好声音")}]);
              3 ->
                  notice:format(lang:get("~ts报名结束啦，明天0点正式开启投票，欢迎大家踊跃投票选出自己心中的最美声音{face_"
                                         "1, 7}"),
                                [{string_2, 1, lang:get("星辰好声音")}]);
              4 ->
                  notice:format(lang:get("~ts投票开始啦，赶紧投出你手中宝贵的选票，为那让耳朵怀孕的声音加油吧{face_1, "
                                         "18}"),
                                [{string_2, 1, lang:get("星辰好声音")}]);
              5 ->
                  notice:format(lang:get("~ts投票结束啦，恭喜~ts等10名玩家获得了参加全服决赛的资格，其他参赛者下次要努力哟{"
                                         "face_1, 18}"),
                                [{string_2, 1, lang:get("星辰好声音")} | Args]);
              6 ->
                  notice:format(lang:get("~ts全服展示开始了，各服前十名的好声音玩家可以上传新的录音，和全服的好声音一较高下{fa"
                                         "ce_1, 18}"),
                                [{string_2, 1, lang:get("星辰好声音")}]);
              7 ->
                  notice:format(lang:get("~ts全服报名结束啦，后天0点正式开启投票，欢迎大家踊跃投票选出自己心中的最美声音{fac"
                                         "e_1, 7}"),
                                [{string_2, 1, lang:get("星辰好声音")}]);
              8 ->
                  notice:format(lang:get("~ts全服投票现在开始，谁会成为全服玩家心中的最美声音呢？大家赶紧投出你手中宝贵的选票吧{"
                                         "face_1, 18}"),
                                [{string_2, 1, lang:get("星辰好声音")}]);
              _ -> ""
          end,
    case Msg of
        "" -> skip;
        _ -> notice:cast(all, 8, Msg)
    end.

send_show_mail() ->
    List = get_submit(),
    Title = lang:get("入围赛报名"),
    Content =
        notice:format(lang:get("~ts开启啦!由于您好声音预赛获得本服前十，获得了参加入围赛的资格。赶紧前往~ts处报名参"
                               "加，和全服的好声音玩家们一决高下吧!{face_1, 18}"),
                      [{string_2, 1, lang:get("好声音入围赛报名")},
                       {string_2, 1, lang:get("音儿")}]),
    send_show_mail(List, Title, Content).

send_show_mail([], _, _) -> ok;
send_show_mail([{RoleId, RoleName, Num} | T], Title,
               Content) ->
    logger:info("给[~ts][~w]发送参与邮件",
                [RoleName, Num],
                goodvoice_mgr,
                1041),
    mail:send(RoleId,
              #{title => Title, content => Content, items => []}),
    send_show_mail(T, Title, Content).

apply_role(RoleId, {msg, Msg}) ->
    spawn(fun () -> role_msg(RoleId, Msg) end).

role_msg(RoleId = {_, P, Z}, Msg) ->
    case big_world:call(P,
                        Z,
                        role_query,
                        pid,
                        [by_id, RoleId])
        of
        {ok, Pid} ->
            notice:send({pid, Pid}, 3, Msg),
            ok;
        _ -> ok
    end.

apply_evt(#role{} = Role) ->
    NewRole = role_trigger:fire(#evt_goodvoice{}, Role),
    {ok, NewRole};
apply_evt(RoleId) ->
    spawn(fun () -> do_apply_evt(RoleId) end).

do_apply_evt(RoleId = {_, P, Z}) ->
    big_world:cast(P,
                   Z,
                   role,
                   apply,
                   [async, RoleId, {goodvoice_mgr, apply_evt, []}]).

calc_status() ->
    Now = date:unixtime(),
    SignStartTime = date:datetime_to_seconds({2019,
                                              6,
                                              30,
                                              0,
                                              1,
                                              0}),
    SignEndTime = date:datetime_to_seconds({2019,
                                            7,
                                            1,
                                            23,
                                            59,
                                            0}),
    VoteWaitStartTime = date:datetime_to_seconds({2019,
                                                  7,
                                                  1,
                                                  23,
                                                  59,
                                                  0}),
    VoteWaitEndTime = date:datetime_to_seconds({2019,
                                                7,
                                                2,
                                                0,
                                                1,
                                                0}),
    VoteStartTime = date:datetime_to_seconds({2019,
                                              7,
                                              2,
                                              0,
                                              1,
                                              0}),
    VoteEndTime = date:datetime_to_seconds({2019,
                                            7,
                                            7,
                                            23,
                                            59,
                                            0}),
    ShowWaitStartTime = date:datetime_to_seconds({2019,
                                                  7,
                                                  7,
                                                  23,
                                                  59,
                                                  0}),
    ShowWaitEndTime = date:datetime_to_seconds({2019,
                                                7,
                                                8,
                                                0,
                                                1,
                                                0}),
    ShowStartTime = date:datetime_to_seconds({2019,
                                              7,
                                              8,
                                              0,
                                              1,
                                              0}),
    ShowEndTime = date:datetime_to_seconds({2019,
                                            7,
                                            10,
                                            23,
                                            59,
                                            0}),
    AllVoteWaitStartTime = date:datetime_to_seconds({2019,
                                                     7,
                                                     10,
                                                     23,
                                                     59,
                                                     0}),
    AllVoteWaitEndTime = date:datetime_to_seconds({2019,
                                                   7,
                                                   12,
                                                   0,
                                                   1,
                                                   0}),
    AllVoteStartTime = date:datetime_to_seconds({2019,
                                                 7,
                                                 12,
                                                 0,
                                                 1,
                                                 0}),
    AllVoteEndTime = date:datetime_to_seconds({2019,
                                               7,
                                               19,
                                               23,
                                               59,
                                               0}),
    if Now < SignStartTime -> {1, SignStartTime - Now};
       Now >= SignStartTime andalso Now < SignEndTime ->
           {2, SignEndTime - Now};
       Now >= VoteWaitStartTime andalso
           Now < VoteWaitEndTime ->
           {3, VoteWaitEndTime - Now};
       Now >= VoteStartTime andalso Now < VoteEndTime ->
           {4, VoteEndTime - Now};
       Now >= ShowWaitStartTime andalso
           Now < ShowWaitEndTime ->
           {5, ShowWaitEndTime - Now};
       Now >= ShowStartTime andalso Now < ShowEndTime ->
           {6, ShowEndTime - Now};
       Now >= AllVoteWaitStartTime andalso
           Now < AllVoteWaitEndTime ->
           {7, AllVoteWaitEndTime - Now};
       Now >= AllVoteStartTime andalso Now < AllVoteEndTime ->
           {8, AllVoteEndTime - Now};
       true -> {1, 0}
    end.

update_song_id(SongId) ->
    case get(max_song_id) of
        undefined -> put(max_song_id, max(1, SongId));
        ID -> put(max_song_id, max(ID, SongId))
    end.

create_dir() ->
    case filelib:is_dir("good_voice/") of
        true -> ok;
        _ ->
            case file:make_dir("good_voice/") of
                ok -> ok;
                _Res ->
                    logger:error("无法创建好声音目录 ~w",
                                 [_Res],
                                 goodvoice_mgr,
                                 1139),
                    ok
            end
    end,
    case filelib:is_dir("good_voice/" ++ "rank/") of
        true -> ok;
        _ ->
            case file:make_dir("good_voice/" ++ "rank/") of
                ok -> ok;
                _Res1 ->
                    logger:error("无法创建好声音目录 ~w",
                                 [_Res1],
                                 goodvoice_mgr,
                                 1149),
                    ok
            end
    end.

ets_update_report(GoodVoiceReportInfo =
                      #goodvoice_report_info{}) ->
    ets:insert(ets_goodvoice_report, GoodVoiceReportInfo),
    ok;
ets_update_report(_) -> ok.

do_load_report([]) -> ok;
do_load_report(Report) -> do_load_report(Report, []).

do_load_report([], []) -> ok;
do_load_report([], Report) ->
    Report1 = lists:keysort(#goodvoice_report_info.time,
                            Report),
    lists:foreach(fun (ReportInfo) ->
                          ets_update_report(ReportInfo)
                  end,
                  Report1),
    ok;
do_load_report([[Id,
                 P,
                 Z,
                 Time,
                 Lev,
                 Name,
                 Id1,
                 P1,
                 Z1,
                 Name1,
                 Lev1,
                 Time1,
                 FileName1,
                 Id2,
                 P2,
                 Z2,
                 Name2,
                 Lev2,
                 Time2,
                 FileName2,
                 Id3,
                 P3,
                 Z3,
                 Name3,
                 Lev3,
                 Time3,
                 FileName3]
                | T],
               Report) ->
    RList1 = case Id1 =/= 0 of
                 true ->
                     [#goodvoice_report{id = {Id1, P1, Z1}, order = 1,
                                        name = Name1, lev = Lev1, time = Time1,
                                        filename = FileName1}];
                 false -> []
             end,
    RList2 = case Id2 =/= 0 of
                 true ->
                     [#goodvoice_report{id = {Id2, P2, Z2}, order = 2,
                                        name = Name2, lev = Lev2, time = Time2,
                                        filename = FileName2}];
                 false -> []
             end,
    RList3 = case Id3 =/= 0 of
                 true ->
                     [#goodvoice_report{id = {Id3, P3, Z3}, order = 3,
                                        name = Name3, lev = Lev3, time = Time3,
                                        filename = FileName3}];
                 false -> []
             end,
    RList = RList1 ++ RList2 ++ RList3,
    R = #goodvoice_report_info{id = {Id, P, Z}, time = Time,
                               lev = Lev, name = Name, report = RList},
    do_load_report(T, [R | Report]);
do_load_report([_ | T], Report) ->
    do_load_report(T, Report).

find_report(ReportId) ->
    case catch ets:lookup(ets_goodvoice_report, ReportId) of
        [Report = #goodvoice_report_info{}] -> {true, Report};
        [] -> null;
        _Err ->
            logger:error("查询举报表失败:~w", [_Err], goodvoice_mgr, 1202),
            false
    end.

update_report(#goodvoice_report_info{id = {Rid, P, Z},
                                     time = Time, lev = Lev, name = Name},
              Mode) ->
    Result = case Mode of
                 {create,
                  #goodvoice_report{id = {Rid1, P1, Z1}, name = Name1,
                                    lev = Lev1, time = Time1,
                                    filename = FileName}} ->
                     {"insert into goodvoice_report(id, platform, "
                      "zone_id, time, lev, name, id_1, platform_1, "
                      "zone_id_1, name_1, lev_1, time_1, filename_1) "
                      "values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, "
                      "?, ?, ?) ON DUPLICATE KEY UPDATE id_1 "
                      "= ?, platform_1 = ?, zone_id_1 = ?, "
                      "name_1 = ?, lev_1 = ?, time_1 = ?, filename_1 "
                      "= ?",
                      [Rid,
                       P,
                       Z,
                       Time,
                       Lev,
                       Name,
                       Rid1,
                       P1,
                       Z1,
                       Name1,
                       Lev1,
                       Time1,
                       FileName,
                       Rid1,
                       P1,
                       Z1,
                       Name1,
                       Lev1,
                       Time1,
                       FileName]};
                 {update,
                  2,
                  #goodvoice_report{id = {Rid1, P1, Z1}, name = Name1,
                                    lev = Lev1, time = Time1,
                                    filename = FileName}} ->
                     {"insert into goodvoice_report(id, platform, "
                      "zone_id, time, lev, name, id_2, platform_2, "
                      "zone_id_2, name_2, lev_2, time_2, filename_2) "
                      "values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, "
                      "?, ?, ?) ON DUPLICATE KEY UPDATE id_2 "
                      "= ?, platform_2 = ?, zone_id_2 = ?, "
                      "name_2 = ?, lev_2 = ?, time_2 = ?, filename_2 "
                      "= ?",
                      [Rid,
                       P,
                       Z,
                       Time,
                       Lev,
                       Name,
                       Rid1,
                       P1,
                       Z1,
                       Name1,
                       Lev1,
                       Time1,
                       FileName,
                       Rid1,
                       P1,
                       Z1,
                       Name1,
                       Lev1,
                       Time1,
                       FileName]};
                 {update,
                  3,
                  #goodvoice_report{id = {Rid1, P1, Z1}, name = Name1,
                                    lev = Lev1, time = Time1,
                                    filename = FileName}} ->
                     {"insert into goodvoice_report(id, platform, "
                      "zone_id, time, lev, name, id_3, platform_3, "
                      "zone_id_3, name_3, lev_3, time_3, filename_3) "
                      "values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, "
                      "?, ?, ?) ON DUPLICATE KEY UPDATE id_3 "
                      "= ?, platform_3 = ?, zone_id_3 = ?, "
                      "name_3 = ?, lev_3 = ?, time_3 = ?, filename_3 "
                      "= ?",
                      [Rid,
                       P,
                       Z,
                       Time,
                       Lev,
                       Name,
                       Rid1,
                       P1,
                       Z1,
                       Name1,
                       Lev1,
                       Time1,
                       FileName,
                       Rid1,
                       P1,
                       Z1,
                       Name1,
                       Lev1,
                       Time1,
                       FileName]};
                 _Err ->
                     logger:error("未知的举报参数:~w", [_Err], goodvoice_mgr, 1225),
                     false
             end,
    case Result of
        {Sql, Args} ->
            case db:exec(Sql, Args) of
                ok -> true;
                _Other ->
                    logger:error("提交举报入库失败:~w",
                                 [_Other],
                                 goodvoice_mgr,
                                 1233),
                    false
            end;
        _ -> false
    end.

do_handle_report(_AdmReportInfo, 2) -> ok;
do_handle_report(#goodvoice_report_info{id = RoleId},
                 1) ->
    Now = date:unixtime(),
    case lookup(RoleId) of
        {true, OldGoodVoice = #goodvoice{}} ->
            NewGoodVoice = OldGoodVoice#goodvoice{update_time = Now,
                                                  file_name = ""},
            delete_file(OldGoodVoice),
            insert_cache(NewGoodVoice),
            ok;
        _ -> ok
    end;
do_handle_report(#goodvoice_report_info{id = RoleId},
                 3) ->
    case lookup(RoleId) of
        {true, OldGoodVoice = #goodvoice{}} ->
            delete_file(OldGoodVoice),
            ets:delete(ets_goodvoice, RoleId),
            dets:delete(dets_goodvoice, RoleId),
            ok;
        _ -> ok
    end;
do_handle_report(_, _) -> false.

save_report({Rid, Plat, ZoneId}, State, Items) ->
    Sql = "update goodvoice_report set state = "
          "?, items = ? where id = ? and platform "
          "= ? and zone_id = ?",
    ItemStr = do_item_string(Items, ""),
    case db:exec(Sql, [State, ItemStr, Rid, Plat, ZoneId])
        of
        ok -> ok;
        {error, Reason} ->
            logger:error("更新举报数据库时失败~w",
                         [Reason],
                         goodvoice_mgr,
                         1275),
            {false, Reason}
    end.

do_item_string([], Str) -> Str;
do_item_string([{ItemId, Bind, Num} | T], Str) ->
    NewStr = util:flist("{~w,~w,~w},~ts",
                        [ItemId, Bind, Num, Str]),
    do_item_string(T, NewStr);
do_item_string([_ | T], Str) -> do_item_string(T, Str).

del_report(#goodvoice_report_info{id = ReportId}) ->
    ets:delete(ets_goodvoice_report, ReportId),
    ok.

reward_report(#goodvoice_report_info{}, 2, _Items,
              _IsCast) ->
    ok;
reward_report(#goodvoice_report_info{name = Name,
                                     report = Report,
                                     id =
                                         ReportId = {_,
                                                     ReportPlat,
                                                     ReportZoneId}},
              _State, Items, IsCast) ->
    case lists:keysort(#goodvoice_report.order, Report) of
        [#goodvoice_report{id = RoleId = {_, Rplat, Rzone}}
         | _] ->
            Title = lang:get("举报反馈"),
            Content =
                notice:format(lang:get("你对~ts的举报信息经查核有效。我们已为其准备好小黑屋。 感谢您对维护游戏秩序做出的贡献，"
                                       "希望我们能一同努力，让游戏保持和谐健康！"),
                              [{role_2, Name}]),
            case IsCast =:= 1 of
                true ->
                    CastMsg = case Items of
                                  [_ | _] ->
                                      notice:format(lang:get("一位热心的玩家举报了~ts发布的不良好声音参赛作品，维护了游戏环境，获得了~ts的奖励"),
                                                    [{role_2, Name},
                                                     {item_2, Items}]);
                                  _ ->
                                      notice:format(lang:get("一位热心的玩家举报了~ts发布的不良好声音参赛作品，维护了游戏环境"),
                                                    [{role_2, Name}])
                              end,
                    case role_misc:is_local_role(ReportId) of
                        true -> notice:cast(all, 7, CastMsg);
                        _ ->
                            notice:cast(all, 7, CastMsg),
                            big_world:cast(ReportPlat,
                                           ReportZoneId,
                                           {notice, cast, [all, 7, CastMsg]})
                    end;
                false -> skip
            end,
            big_world:cast(Rplat,
                           Rzone,
                           mail,
                           send,
                           [RoleId,
                            #{title => Title, content => Content,
                              items => Items}]),
            ok;
        _ -> skip
    end.

check_item(Items) -> check_item(Items, []).

check_item([], Items) -> {true, Items};
check_item([{ItemId, Bind, Num} | T], Items)
    when Num > 0 ->
    case item_data:get(ItemId) of
        #item_base{} ->
            check_item(T, [{ItemId, Bind, Num} | Items]);
        _ ->
            logger:error("举报发放不存在的奖励:~w",
                         [ItemId],
                         goodvoice_mgr,
                         1330),
            check_item(T, Items)
    end;
check_item([_Err | _T], _Items) -> false.

copy_files([]) -> ok;
copy_files([#goodvoice_rank{role_id =
                                RoleId = {_, P, Z},
                            file_name = FileName}
            | T]) ->
    case role_misc:is_local_role(RoleId) of
        true ->
            case file:copy(base_dir(P, Z) ++ FileName,
                           "good_voice/" ++ "rank/" ++ FileName)
                of
                {ok, _} -> ok;
                {error, Why} ->
                    logger:error("复制排行榜文件出错 ~ts, ~w",
                                 [FileName, Why],
                                 goodvoice_mgr,
                                 1344)
            end;
        _ -> ok
    end,
    copy_files(T).

delete_rank([]) -> ok;
delete_rank([G = #goodvoice_rank{role_id = RoleId}
             | T]) ->
    case role_misc:is_local_role(RoleId) of
        true -> delete_file(G);
        _ -> ok
    end,
    delete_rank(T).

load_rank_data() ->
    StartFlag1 = case dets:first(goodvoice_rank) of
                     '$end_of_table' ->
                         logger:info("没有数据需要加载", [], goodvoice_mgr, 1365),
                         [];
                     _ ->
                         dets:traverse(goodvoice_rank,
                                       fun (G) ->
                                               case goodvoice_ver:do_rank(G) of
                                                   {ok, Rank} ->
                                                       ets:insert(goodvoice_rank,
                                                                  Rank),
                                                       dets:insert(goodvoice_rank,
                                                                   Rank),
                                                       continue;
                                                   _ ->
                                                       logger:error("无法转换好声音排行榜版本数据:~w",
                                                                    [G],
                                                                    goodvoice_mgr,
                                                                    1376),
                                                       {done, false}
                                               end
                                       end)
                 end,
    StartFlag2 = case dets:first(goodvoice_rank_only_liked)
                     of
                     '$end_of_table' ->
                         logger:info("没有数据需要加载", [], goodvoice_mgr, 1384),
                         [];
                     _ ->
                         dets:traverse(goodvoice_rank_only_liked,
                                       fun (G1) ->
                                               case goodvoice_ver:do_rank(G1) of
                                                   {ok, RankOnlyLiked} ->
                                                       ets:insert(goodvoice_rank_only_liked,
                                                                  RankOnlyLiked),
                                                       dets:insert(goodvoice_rank_only_liked,
                                                                   RankOnlyLiked),
                                                       continue;
                                                   _ ->
                                                       logger:error("无法转换好声音排行榜版本数据:~w",
                                                                    [G1],
                                                                    goodvoice_mgr,
                                                                    1395),
                                                       {done, false}
                                               end
                                       end)
                 end,
    {StartFlag1, StartFlag2}.

