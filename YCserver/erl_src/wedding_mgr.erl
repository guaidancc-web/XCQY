-file("src/mod/wedding/wedding_mgr.erl", 1).

-module(wedding_mgr).

-behaviour(gen_fsm).

-export([start_link/0,
         update_ets/2,
         del_ets/1,
         m/0,
         info/1,
         cast/1,
         call/1,
         apply_invit/4,
         apply_do_invit/2,
         camera_reset_apply/1,
         camera_reset_apply/2,
         camera_move_to/5,
         camera_reset/2,
         camera_cancel/2,
         rank_conver/2]).

-export([idel/2,
         notice/2,
         pre/2,
         pre_ceremony/2,
         ceremony/2,
         freedom/2,
         over/2]).

-export([init/1,
         handle_event/3,
         handle_sync_event/4,
         handle_info/3,
         terminate/3,
         code_change/4]).

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

-file("src/mod/wedding/wedding_mgr.erl", 42).

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

-file("src/mod/wedding/wedding_mgr.erl", 43).

-file("inc/wedding.hrl", 1).

-record(m_wedding,
        {ver = 1,
         lover_id = {0, "", 0},
         lover_name = "",
         status = 0,
         honor_ids = [],
         reward = [],
         mail = []}).

-record(lover,
        {id = {0, "", 0} ::
             {non_neg_integer(), bitstring(), non_neg_integer()},
         name = "" :: bitstring(),
         lover_id = {0, "", 0} ::
             {non_neg_integer(), bitstring(), non_neg_integer()},
         lover_name = "" :: bitstring(),
         type = 1 :: 1..2,
         status = 1 :: 0..2,
         ring_lev = 0 :: non_neg_integer(),
         intimacy = 0 :: non_neg_integer(),
         order_index = 0 :: non_neg_integer(),
         order_time = 0 :: non_neg_integer(),
         atmosp = 0 :: non_neg_integer(),
         index = 0 :: non_neg_integer(),
         time = 0 :: non_neg_integer(),
         lover_sex = 2 :: 0..2,
         lover_classes = 0,
         lover_lev = 0,
         lover_fc = 0,
         lover_pet_fc = 0,
         lover_face = 0}).

-record(guest,
        {id = {0, "", 0} ::
             {non_neg_integer(), bitstring(), non_neg_integer()},
         name = "" :: bitstring(),
         pid = 0 :: 0 | pid(),
         act_list = [],
         unit_list = [],
         classes = 0,
         sex = 0,
         lev = 0,
         face = 0}).

-record(wedding_atmosp_data,
        {type = 0 :: non_neg_integer(),
         min_val = 0 :: non_neg_integer(),
         max_val = 0 :: non_neg_integer(),
         exp = 0 :: non_neg_integer(),
         scene_reward = [] :: list(),
         scene_msg = "" :: string(),
         male_reward = [] :: list(),
         famale_reward = [] :: list(),
         title = "" :: string(),
         content = "" :: string()}).

-record(wedding_act_data,
        {id = 0,
         type = 0,
         target = 1,
         free_num = 0,
         max_num = 0,
         cost = [],
         msg = "",
         log_msg = "",
         atmosp = 0,
         gain = [],
         main_gain = [],
         effect_type = 0,
         effect_id = 1,
         effect_num = 1,
         cd = 0}).

-record(wedding_rank, {type = 0, list = []}).

-record(wedding_rank_rc,
        {id = {{0, "", 0}, {0, "", 0}},
         male_id = {0, "", 0},
         male_name = "",
         rank = 1,
         time = 0 :: non_neg_integer(),
         male_sex = 0 :: 0..2,
         male_classes = 0 :: 0..4,
         male_lev = 0 :: non_neg_integer(),
         female_id = {0, "", 0},
         female_name = "",
         female_sex = 0 :: 0..2,
         female_classes = 0 :: 0..4,
         female_lev = 0 :: non_neg_integer(),
         val1 = 0 :: non_neg_integer(),
         val2 = 0 :: non_neg_integer(),
         val3 = 0 :: non_neg_integer(),
         val4 = 0 :: non_neg_integer(),
         desc = ""}).

-record(wedding_rank_cfg,
        {type = 0 :: non_neg_integer(),
         num = 100 :: non_neg_integer(),
         keys =
             [#wedding_rank_rc.val3,
              #wedding_rank_rc.val2,
              #wedding_rank_rc.val1]
             :: [pos_integer()],
         min_val = 1 :: pos_integer()}).

-record(wedding_unit_data,
        {id = 0, target = 0, rand = [], limit = 0}).

-record(wedding_rank_honor_data,
        {type = 0,
         rank = 0,
         male_honor = 0,
         female_honor = 0,
         reward = [],
         title = "",
         content = ""}).

-record(wedding_rank_honor_type_data,
        {type = 0, day = day}).

-file("src/mod/wedding/wedding_mgr.erl", 44).

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

-file("src/mod/wedding/wedding_mgr.erl", 45).

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

-file("src/mod/wedding/wedding_mgr.erl", 46).

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

-file("src/mod/wedding/wedding_mgr.erl", 47).

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

-file("src/mod/wedding/wedding_mgr.erl", 48).

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

-file("src/mod/wedding/wedding_mgr.erl", 49).

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

-file("src/mod/wedding/wedding_mgr.erl", 50).

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

-file("src/mod/wedding/wedding_mgr.erl", 51).

-record(state,
        {male_id = {0, "", 0} ::
             {non_neg_integer(), bitstring(), non_neg_integer()},
         male_pid = 0 :: 0 | pid(),
         male_classes = 0 :: 0 | pid(),
         male_sex = 0 :: 0 | pid(),
         male_face = 0 :: 0 | pid(),
         male_lev = 0 :: 0 | pid(),
         male_name = "" :: bitstring(),
         male_lover :: undefined | tuple(),
         male_invi_card = 0 :: non_neg_integer(),
         male_act_list = [],
         male_unit_list = [],
         female_id = {0, "", 0} ::
             {non_neg_integer(), bitstring(), non_neg_integer()},
         female_pid = 0 :: 0 | pid(),
         female_name = "" :: bitstring(),
         female_classes = 0 :: 0 | pid(),
         female_sex = 0 :: 0 | pid(),
         female_face = 0 :: 0 | pid(),
         female_lev = 0 :: 0 | pid(),
         female_lover :: undefined | tuple(),
         female_invi_card = 0 :: non_neg_integer(),
         female_act_list = [],
         female_unit_list = [],
         map_id = 0 :: non_neg_integer(),
         map_pid = 0 :: 0 | pid(),
         type = 1 :: 1..2,
         time = 0 :: non_neg_integer(),
         end_time = 0 :: non_neg_integer(),
         is_wedding = 0 :: 0..1,
         atmosp = 0 :: non_neg_integer(),
         next_order_id = 0 :: non_neg_integer(),
         next_id = 1 :: non_neg_integer(),
         ts = {0, 0, 0} :: tuple(),
         timeout = 0 :: non_neg_integer(),
         acc_guest_num = 0 :: non_neg_integer(),
         guest_num = 0 :: non_neg_integer(),
         guest_max = 0 :: non_neg_integer(),
         ceremony_start = 0}).

update_ets(Data, all) ->
    ets:insert(lover, Data),
    dets:insert(lover, Data);
update_ets(Data, ets) -> ets:insert(lover, Data).

del_ets(#lover{id = RoleId, lover_id = LoverId}) ->
    ets:delete(lover, RoleId),
    dets:delete(lover, RoleId),
    ets:delete(lover, LoverId),
    dets:delete(lover, LoverId).

update_state_ets(State) ->
    dets:insert(wedding_state, State).

load_last_state() -> dets:lookup(wedding_state, state).

-spec m() -> ok.

m() ->
    logger:info("有人输入了婚礼下阶段", [], wedding_mgr, 153),
    gen_fsm:send_event(wedding_mgr, timeout).

info(Info) -> wedding_mgr ! Info.

cast(Event) ->
    gen_fsm:send_all_state_event(wedding_mgr, Event).

call(Event) ->
    try gen_fsm:sync_send_all_state_event(wedding_mgr,
                                          Event)
    catch
        _Type:_Reason ->
            logger:debug("Type: ~w  Reason: ~w",
                         [_Type, _Reason],
                         wedding_mgr,
                         170),
            {error, timeout}
    end.

apply_invit(Role, L, Msg, Wedding) ->
    do_invit(L, Role, Wedding, Msg, []),
    ok.

apply_do_invit(#role{id = RoleId, name = Name}, Info) ->
    sys_conn:pack_send(15004, Info),
    wedding_mgr:cast({invit_guest, RoleId, Name}),
    ok.

start_link() ->
    gen_fsm:start_link({local, wedding_mgr},
                       wedding_mgr,
                       [],
                       []).

init([]) ->
    logger:info("开始启动...", [], wedding_mgr, 192),
    process_flag(trap_exit, true),
    dets:open_file(lover,
                   [{file, "./dets/lover.dets"}, {keypos, #lover.id}]),
    dets:open_file(wedding_rank,
                   [{file, "./dets/wedding_rank.dets"},
                    {keypos, #wedding_rank.type}]),
    dets:open_file(wedding_state,
                   [{file, "./dets/wedding_state.dets"}, {keypos, 1}]),
    ets:new(lover,
            [set, named_table, public, {keypos, #lover.id}]),
    ets:new(wedding_rank,
            [set,
             named_table,
             public,
             {keypos, #wedding_rank.type}]),
    {NextOrderId, NextId} = load_data(),
    wedding_rank:load_rank(),
    load_last_state(),
    case env:get(wedding_roles) of
        [_ | _] ->
            erlang:send_after(60 * 1000,
                              self(),
                              wedding_compensate);
        _ -> ignore
    end,
    State = #state{next_order_id = NextOrderId,
                   next_id = NextId, ts = date:now2(), timeout = 86400000},
    erlang:send_after(date:next_diff(0, 0, 1) * 1000,
                      self(),
                      rank_hour_zero),
    logger:info("启动完成", [], wedding_mgr, 218),
    {ok, idel, State}.

handle_event({update_lover, Id, LoverId, List},
             StateName, State) ->
    case wedding:lover(Id) of
        {ok, Lover = #lover{lover_id = LoverId}} ->
            NewLover = update_lover(Lover, List),
            wedding_mgr:update_ets([NewLover], all);
        _ -> ignore
    end,
    continue(StateName, State);
handle_event({enter, #guest{pid = RolePid}},
             StateName = idel, State) ->
    notice:send({pid, RolePid},
                1,
                lang:get("没有人举行典礼哦"),
                []),
    continue(StateName, State);
handle_event({enter, #guest{pid = RolePid}},
             StateName = notice, State) ->
    notice:send({pid, RolePid},
                1,
                lang:get("当前阶段还不能进入"),
                []),
    continue(StateName, State);
handle_event({enter,
              #guest{id = RoleId, pid = RolePid}},
             StateName,
             State = #state{type = Type, male_id = MaleId,
                            female_id = FemaleId, map_id = MapId})
    when MaleId =:= RoleId orelse FemaleId =:= RoleId ->
    role:apply(async,
               RolePid,
               {wedding, apply_enter, [MapId, Type]}),
    continue(StateName, State);
handle_event({enter, #guest{pid = RolePid}}, StateName,
             State = #state{guest_max = Max, guest_num = Num})
    when Num >= Max ->
    notice:send({pid, RolePid},
                1,
                lang:get("宾客进入数量已达上限，不能进入"),
                []),
    continue(StateName, State);
handle_event({enter,
              Guest = #guest{id = RoleId, name = Name, pid = RolePid,
                             classes = Classes, sex = Sex, lev = Lev,
                             face = Face}},
             StateName,
             State = #state{map_id = MapId, guest_num = Num,
                            acc_guest_num = AccNum, type = Type,
                            male_id = MaleId, male_name = MaleName,
                            female_id = FemaleId, female_name = FemaleName,
                            male_pid = MalePid, female_pid = FemalePid}) ->
    case lists:keyfind(RoleId, 1, get(invit_list)) of
        false ->
            notice:send({pid, RolePid},
                        1,
                        lang:get("现在向主人申请进入典礼"),
                        []),
            add_apply({RoleId, Name, Classes, Sex, Lev, Face},
                      State),
            continue(StateName, State);
        _ ->
            {ok, #map_data{revive = [{X, Y}]}} =
                map_data:get(30002),
            case StateName of
                ceremony ->
                    case get_guest_pos() of
                        {GX, GY, _GDir} ->
                            role:apply(async,
                                       RolePid,
                                       {wedding,
                                        apply_guest_enter,
                                        [MapId,
                                         GX,
                                         GY,
                                         15,
                                         {MaleId,
                                          MaleName,
                                          FemaleId,
                                          FemaleName}]});
                        _ ->
                            role:apply(async,
                                       RolePid,
                                       {wedding,
                                        apply_guest_enter,
                                        [MapId,
                                         X,
                                         Y,
                                         15,
                                         {MaleId,
                                          MaleName,
                                          FemaleId,
                                          FemaleName}]})
                    end,
                    set_guest_pos(Guest),
                    case get(camera) of
                        {false, _, _} -> ignore;
                        {Mod, Fun, Args} ->
                            erlang:apply(Mod, Fun, [RolePid | Args]);
                        _ -> ignore
                    end;
                _ ->
                    role:apply(async,
                               RolePid,
                               {wedding,
                                apply_guest_enter,
                                [MapId,
                                 X,
                                 Y,
                                 14,
                                 {MaleId, MaleName, FemaleId, FemaleName}]})
            end,
            EnterMsg = notice:format(lang:get("~ts带着祝福来到了典礼现场"),
                                     [{role_2, Name}]),
            notice:send({pid, MalePid}, 1, EnterMsg, []),
            notice:send({pid, FemalePid}, 1, EnterMsg, []),
            case get_guest(RoleId) of
                false ->
                    NewGuest = case Type of
                                   1 -> Guest#guest{};
                                   _ -> Guest#guest{}
                               end,
                    put(guest_list, [NewGuest | get(guest_list)]),
                    NewState = State#state{guest_num = Num + 1,
                                           acc_guest_num = AccNum + 1},
                    push_invit(get(invit_list), NewState),
                    continue(StateName, NewState);
                G ->
                    update_guest(G#guest{pid = RolePid}),
                    NewState = State#state{guest_num = Num + 1},
                    push_invit(get(invit_list), NewState),
                    continue(StateName, NewState)
            end
    end;
handle_event({leave, RoleId}, StateName,
             State = #state{male_id = RoleId, male_pid = MalePid})
    when StateName == over ->
    del_enter_list(RoleId),
    role:apply(async, MalePid, {wedding, apply_leave, []}),
    continue(StateName, State);
handle_event({leave, RoleId}, StateName,
             State = #state{male_id = RoleId, male_pid = MalePid}) ->
    notice:send({pid, MalePid},
                1,
                lang:get("正在典礼中，不能逃跑哦"),
                []),
    continue(StateName, State);
handle_event({leave, RoleId}, StateName,
             State = #state{female_id = RoleId,
                            female_pid = MalePid})
    when StateName == over ->
    del_enter_list(RoleId),
    role:apply(async, MalePid, {wedding, apply_leave, []}),
    continue(StateName, State);
handle_event({leave, RoleId}, StateName,
             State = #state{female_id = RoleId,
                            female_pid = MalePid}) ->
    notice:send({pid, MalePid},
                1,
                lang:get("正在典礼中，不能逃跑哦"),
                []),
    continue(StateName, State);
handle_event({leave, RoleId}, StateName,
             State = #state{guest_num = Num})
    when StateName =/= idel ->
    case get_guest(RoleId) of
        G = #guest{} ->
            del_enter_list(RoleId),
            update_guest(G#guest{pid = 0}),
            continue(StateName,
                     State#state{guest_num = max(0, Num - 1)});
        _ -> continue(StateName, State)
    end;
handle_event({divorce, Lover}, StateName, State) ->
    rank_listener:handle(divorce, Lover, 1),
    continue(StateName, State);
handle_event({get_enter_list, Pid}, StateName, State)
    when StateName =/= idel ->
    NewList = case get(enter_list) of
                  List when is_list(List) -> List;
                  _ -> []
              end,
    role:pack_send(Pid, 15023, {NewList}),
    continue(StateName, State);
handle_event({invit_guest, RoleId, Name}, StateName,
             State)
    when StateName =/= idel ->
    case lists:keyfind(RoleId, 1, get(invit_list)) of
        false ->
            List = [{RoleId, Name} | get(invit_list)],
            push_invit(List, State),
            put(invit_list, List);
        _ -> skip
    end,
    continue(StateName, State);
handle_event({guild_cast, RoleId, Pid, GId}, StateName,
             State = #state{male_id = MaleId, male_name = MaleName,
                            female_id = FemaleId, female_name = FemaleName})
    when StateName =/= idel andalso
             (RoleId == MaleId orelse FemaleId == RoleId) ->
    Msg =
        notice:format(lang:get("~ts与~ts今天甜蜜结缘，邀请公会成员参加他们的典礼，一起来见证他们的幸福吧！~ts"),
                      [{role_2, MaleName},
                       {role_2, FemaleName},
                       {panel_3, 15008, 1, lang:get("申请")}]),
    notice:send({pid, Pid},
                1,
                lang:get("成功通知公会成员来参加你们的典礼"),
                []),
    guild:notice(GId, Msg),
    continue(StateName, State);
handle_event({guild_cast, _RoleId, Pid, _GId},
             StateName, State)
    when StateName =/= idel ->
    notice:send({pid, Pid}, 1, lang:get("你不是这对有缘人"), []),
    continue(StateName, State);
handle_event({get_apply, RoleId, RolePid}, StateName,
             State = #state{male_id = MaleId, female_id = FemaleId})
    when StateName =/= idel andalso
             (RoleId == MaleId orelse FemaleId == RoleId) ->
    ApplyList = get(apply_list),
    role:pack_send(RolePid, 15005, {0, ApplyList}),
    continue(StateName, State);
handle_event({agree_apply,
              RoleId,
              _RolePid,
              _Name,
              List,
              1},
             StateName,
             State = #state{male_id = MaleId, male_pid = MalePid,
                            female_id = FemaleId, female_pid = FemalePid})
    when StateName =/= idel andalso
             (RoleId == MaleId orelse FemaleId == RoleId) ->
    InvitList = get(invit_list),
    Fun = fun (Rid, L1) ->
                  case lists:keyfind(Rid, 1, InvitList) of
                      false -> [{Rid, ""} | L1];
                      _ -> L1
                  end
          end,
    del_apply(List),
    NewL = lists:foldl(Fun, [], List),
    put(invit_list, NewL ++ InvitList),
    push_invit(NewL ++ InvitList, State),
    DelList = [{Rid, "", 0, 0, 0, 0} || {Rid, _} <- NewL],
    role:pack_send(MalePid, 15005, {2, DelList}),
    role:pack_send(FemalePid, 15005, {2, DelList}),
    [role:apply(async, Rid, {wedding, enter, []})
     || {Rid, _} <- NewL],
    continue(StateName, State);
handle_event({agree_apply,
              RoleId,
              _RolePid,
              _Name,
              List,
              _},
             StateName,
             State = #state{male_id = MaleId, female_id = FemaleId,
                            male_pid = MalePid, female_pid = FemalePid})
    when StateName =/= idel andalso
             (RoleId == MaleId orelse FemaleId == RoleId) ->
    del_apply(List),
    DelList = [{Rid, "", 0, 0, 0, 0} || Rid <- List],
    role:pack_send(MalePid, 15005, {2, DelList}),
    role:pack_send(FemalePid, 15005, {2, DelList}),
    continue(StateName, State);
handle_event({invit,
              RoleId,
              RolePid,
              _InvitType,
              Msg,
              L},
             StateName,
             State = #state{male_id = MaleId, male_name = _MaleName,
                            female_id = FemaleId, female_name = _FemaleName})
    when RoleId =:= MaleId orelse RoleId =:= FemaleId ->
    GuestList = get(guest_list),
    NL = [Rid
          || Rid <- L,
             lists:keyfind(Rid, #guest.id, GuestList) == false],
    role:apply(async,
               RolePid,
               {wedding_mgr, apply_invit, [NL, Msg, State]}),
    notice:send({pid, RolePid},
                1,
                lang:get("你的邀请已经成功发送"),
                []),
    continue(StateName, State);
handle_event({Label = act,
              RoleId,
              Name,
              Pid,
              Pos,
              Id,
              Target,
              Msg},
             StateName,
             State = #state{type = Type, male_id = RoleId,
                            male_act_list = ActList})
    when StateName =/= idel ->
    case wedding_data:get_act({Id, Type, Target}) of
        Data = #wedding_act_data{} ->
            do_act(Label,
                   RoleId,
                   Pid,
                   Name,
                   Pos,
                   Data,
                   ActList,
                   Msg);
        _ ->
            notice:send({pid, Pid}, 1, lang:get("你不能执行此操作"), [])
    end,
    continue(StateName, State);
handle_event({Label = act,
              RoleId,
              Name,
              Pid,
              Pos,
              Id,
              Target,
              Msg},
             StateName,
             State = #state{type = Type, female_id = RoleId,
                            female_act_list = ActList})
    when StateName =/= idel ->
    case wedding_data:get_act({Id, Type, Target}) of
        Data = #wedding_act_data{} ->
            do_act(Label,
                   RoleId,
                   Pid,
                   Name,
                   Pos,
                   Data,
                   ActList,
                   Msg);
        _ ->
            notice:send({pid, Pid}, 1, lang:get("你不能执行此操作"), [])
    end,
    continue(StateName, State);
handle_event({Label = guest_act,
              RoleId,
              Name,
              Pid,
              Pos,
              Id,
              Target,
              Msg},
             StateName, State = #state{type = Type})
    when StateName =/= idel ->
    case get_guest(RoleId) of
        #guest{act_list = ActList} ->
            case wedding_data:get_act({Id, Type, Target}) of
                Data = #wedding_act_data{} ->
                    do_act(Label,
                           RoleId,
                           Pid,
                           Name,
                           Pos,
                           Data,
                           ActList,
                           Msg);
                _ ->
                    notice:send({pid, Pid}, 1, lang:get("你不能执行此操作"), [])
            end;
        _ -> ignore
    end,
    continue(StateName, State);
handle_event({get_wedding, Pid}, StateName = idel,
             State) ->
    push_wedding(Pid, 0, State),
    continue(StateName, State);
handle_event({get_wedding, Pid}, StateName = pre,
             State) ->
    push_wedding(Pid, 1, State),
    continue(StateName, State);
handle_event({get_wedding, Pid},
             StateName = pre_ceremony, State) ->
    push_wedding(Pid, 1, State),
    continue(StateName, State);
handle_event({get_wedding, Pid}, StateName = ceremony,
             State) ->
    push_wedding(Pid, 2, State),
    continue(StateName, State);
handle_event({get_wedding, Pid}, StateName = freedom,
             State) ->
    push_wedding(Pid, 3, State),
    continue(StateName, State);
handle_event({get_wedding, Pid}, StateName = over,
             State) ->
    push_wedding(Pid, 4, State),
    continue(StateName, State);
handle_event({enter_succ, RoleId, Pid}, StateName,
             State) ->
    Status = case StateName of
                 idel -> 0;
                 pre -> 1;
                 pre_ceremony -> 1;
                 ceremony -> 2;
                 freedom -> 3;
                 over -> 4;
                 _ -> 0
             end,
    push_wedding(Pid, Status, State),
    push_atmosp(Pid, State),
    role:pack_send(Pid, 15009, {}),
    add_enter_list(RoleId),
    continue(StateName, State);
handle_event({act_list, RoleId, RolePid, Type},
             StateName,
             State = #state{male_id = RoleId,
                            male_act_list = ActList})
    when StateName =/= idel ->
    role:pack_send(RolePid, 15007, {Type, ActList}),
    continue(StateName, State);
handle_event({act_list, RoleId, RolePid, Type},
             StateName,
             State = #state{female_id = RoleId,
                            female_act_list = ActList})
    when StateName =/= idel ->
    role:pack_send(RolePid, 15007, {Type, ActList}),
    continue(StateName, State);
handle_event({act_list_guest, RoleId, RolePid, Type},
             StateName, State)
    when StateName =/= idel ->
    case get_guest(RoleId) of
        #guest{act_list = ActList} ->
            role:pack_send(RolePid, 15007, {Type, ActList});
        _ -> ignore
    end,
    continue(StateName, State);
handle_event({push_atmosp, Pid}, StateName, State) ->
    push_atmosp(Pid, State),
    continue(StateName, State);
handle_event({push_act_log, Pid}, StateName, State)
    when StateName =/= idle ->
    case get(act_log) of
        List when is_list(List) ->
            role:pack_send(Pid, 15012, {0, List});
        _ -> ignore
    end,
    continue(StateName, State);
handle_event({login, RoleId, RolePid, Event}, StateName,
             State)
    when StateName =/= idel ->
    case get_guest(RoleId) of
        G = #guest{} ->
            case Event of
                14 when StateName =:= ceremony ->
                    set_guest_pos(G#guest{pid = RolePid});
                _ -> skip
            end,
            update_guest(G#guest{pid = RolePid});
        _ ->
            role:apply(async, RolePid, {wedding, apply_leave, []})
    end,
    continue(StateName, State);
handle_event({login, _RoleId, RolePid, _Event},
             StateName, State) ->
    role:apply(async, RolePid, {wedding, apply_leave, []}),
    continue(StateName, State);
handle_event({logout, RoleId}, StateName, State)
    when StateName =/= idel ->
    case get_guest(RoleId) of
        G = #guest{} -> update_guest(G#guest{pid = 0});
        _ -> skip
    end,
    continue(StateName, State);
handle_event({push_invit, Pid}, StateName, State)
    when StateName =/= idel ->
    push_invit(Pid, get(invit_list), State),
    continue(StateName, State);
handle_event({push_rank, Pid, Type}, StateName,
             State) ->
    wedding_rank:push_rank(Pid, Type),
    continue(StateName, State);
handle_event({pick_unit, _RoleId, _BaseId},
             StateName = idel, State) ->
    continue(StateName, State);
handle_event({pick_unit, RoleId, BaseId}, StateName,
             State = #state{male_id = RoleId,
                            male_unit_list = UnitList}) ->
    NewUnitList = case lists:keyfind(BaseId, 1, UnitList) of
                      {_, Num} ->
                          lists:keyreplace(BaseId,
                                           1,
                                           UnitList,
                                           {BaseId, Num + 1});
                      _ -> [{BaseId, 1} | UnitList]
                  end,
    continue(StateName,
             State#state{male_unit_list = NewUnitList});
handle_event({pick_unit, RoleId, BaseId}, StateName,
             State = #state{female_id = RoleId,
                            female_unit_list = UnitList}) ->
    NewUnitList = case lists:keyfind(BaseId, 1, UnitList) of
                      {_, Num} ->
                          lists:keyreplace(BaseId,
                                           1,
                                           UnitList,
                                           {BaseId, Num + 1});
                      _ -> [{BaseId, 1} | UnitList]
                  end,
    continue(StateName,
             State#state{female_unit_list = NewUnitList});
handle_event({pick_unit, RoleId, BaseId}, StateName,
             State) ->
    case get(RoleId) of
        Guest = #guest{unit_list = UnitList} ->
            NewUnitList = case lists:keyfind(BaseId, 1, UnitList) of
                              {_, Num} ->
                                  lists:keyreplace(BaseId,
                                                   1,
                                                   UnitList,
                                                   {BaseId, Num + 1});
                              _ -> [{BaseId, 1} | UnitList]
                          end,
            NewGuest = Guest#guest{unit_list = NewUnitList},
            update_guest(NewGuest);
        _ -> ignore
    end,
    continue(StateName, State);
handle_event(_Event, StateName, State) ->
    continue(StateName, State).

handle_sync_event({check_pick, RoleId, UnitId}, _From,
                  StateName,
                  State = #state{male_id = MaleId,
                                 male_unit_list = MaleUnitList,
                                 female_id = FemaleId,
                                 female_unit_list = FemaleUnit})
    when StateName =/= idel ->
    {Target, TargetUnitList} = case RoleId of
                                   MaleId -> {1, MaleUnitList};
                                   FemaleId -> {2, FemaleUnit};
                                   _ ->
                                       case get_guest(RoleId) of
                                           #guest{unit_list = UnitList} ->
                                               {3, UnitList};
                                           _ -> {3, []}
                                       end
                               end,
    Num = case lists:keyfind(UnitId, 1, TargetUnitList) of
              {_, TNum} -> TNum;
              _ -> 0
          end,
    Result = case wedding_data:get_unit({UnitId, Target}) of
                 #wedding_unit_data{limit = Limit} when Num >= Limit ->
                     {false,
                      notice:format(lang:get("~ts 每人只能获得 ~ts 个，不能贪心哦"),
                                    [{unit_1, UnitId}, {string_2, 5, Limit}])};
                 Data = #wedding_unit_data{} -> {ok, Data};
                 _ -> {false, lang:get("没有找到配置")}
             end,
    continue(StateName, Result, State);
handle_sync_event({check_pick, _RoleId, _UnitId}, _From,
                  StateName, State) ->
    continue(StateName, {false, lang:get("典礼已经结束")}, State);
handle_sync_event({login, _RoleId, _}, _From,
                  StateName = idel, State) ->
    continue(StateName, false, State);
handle_sync_event({login, RoleId, RolePid}, _From,
                  StateName, State = #state{male_id = RoleId})
    when StateName =/= idel ->
    continue(StateName,
             ok,
             State#state{male_pid = RolePid});
handle_sync_event({login, RoleId, RolePid}, _From,
                  StateName, State = #state{female_id = RoleId})
    when StateName =/= idel ->
    continue(StateName,
             ok,
             State#state{female_pid = RolePid});
handle_sync_event({login, _RoleId, _}, _From, StateName,
                  State) ->
    continue(StateName, false, State);
handle_sync_event({order,
                   Lover1 = #lover{id = Id1},
                   Lover2 = #lover{id = Id2}},
                  _From, StateName,
                  State = #state{next_order_id = NextOrderId}) ->
    case {wedding:lover(Id1), wedding:lover(Id2)} of
        {null, null} ->
            Now = date:unixtime(),
            update_ets([Lover1#lover{order_index = NextOrderId,
                                     order_time = Now},
                        Lover2#lover{order_index = NextOrderId,
                                     order_time = Now + 1}],
                       all),
            continue(StateName,
                     ok,
                     State#state{next_order_id = NextOrderId + 1});
        {{ok, #lover{}}, _} -> continue(StateName, Id1, State);
        {_, {ok, _}} -> continue(StateName, Id2, State);
        _ ->
            continue(StateName, {false, lang:get("系统繁忙")}, State)
    end;
handle_sync_event({start,
                   #{type := Type, male_id := MaleId, male_pid := MalePid,
                     male_name := MaleName, male_classes := MaleClasses,
                     male_sex := MaleSex, male_lev := MaleLev,
                     male_face := MaleFace, male_lover := MaleLover,
                     female_id := FemaleId, female_pid := FemalePid,
                     female_classes := FemaleClasses,
                     female_sex := FemaleSex, female_lev := FemaleLev,
                     female_face := FemaleFace, female_lover := FemaleLover,
                     female_name := FemaleName, atmosp := Atmosp,
                     guest_max := GuestMax}},
                  _From, idel,
                  State = #state{is_wedding = 0, next_id = NextId,
                                 next_order_id = NextOrderId}) ->
    case map_mgr:create(30002) of
        {ok, MapPid, MapId} ->
            Now = date:unixtime(),
            EndT = Now +
                       (240000 + 100000 + 300000 + 300000) div 1000,
            NewMaleLover = MaleLover#lover{status = 2,
                                           index = NextId, time = Now,
                                           atmosp = Atmosp},
            NewFeMaleLover = FemaleLover#lover{status = 2,
                                               index = NextId, time = Now,
                                               atmosp = Atmosp},
            NewState = State#state{time = Now, end_time = EndT,
                                   next_id = NextId + 1,
                                   next_order_id = NextOrderId,
                                   ts = date:now2(), timeout = 1,
                                   map_pid = MapPid, map_id = MapId,
                                   male_pid = MalePid,
                                   male_classes = MaleClasses,
                                   male_sex = MaleSex, male_lev = MaleLev,
                                   male_face = MaleFace,
                                   male_lover = NewMaleLover,
                                   female_classes = FemaleClasses,
                                   female_sex = FemaleSex,
                                   female_lev = FemaleLev,
                                   female_face = FemaleFace,
                                   female_lover = NewFeMaleLover,
                                   is_wedding = 1, type = Type,
                                   male_id = MaleId, male_name = MaleName,
                                   female_id = FemaleId,
                                   female_name = FemaleName,
                                   female_pid = FemalePid, guest_max = GuestMax,
                                   atmosp = Atmosp, male_act_list = [],
                                   female_act_list = [], male_unit_list = [],
                                   female_unit_list = [], ceremony_start = 0,
                                   guest_num = 0, acc_guest_num = 0},
            update_ets([NewMaleLover, NewFeMaleLover], all),
            put(guest_list, []),
            put(invit_list, []),
            put(refuse_list, []),
            put(act_logs, []),
            put(unit_id, 1000),
            put(map_id, MapId),
            put(act_log, []),
            put(apply_list, []),
            put(enter_list, []),
            put(camera, {false, false, false}),
            map:active_region(MapId, 1, 0),
            push_invit([], NewState),
            continue(notice, ok, NewState);
        _ -> continue(idel, {fals_e, lang:get("创建地图失败")}, State)
    end;
handle_sync_event({start, _Wedding}, _From, StateName,
                  State) ->
    continue(StateName,
             {false, lang:get("当前有人正在举办典礼，请排队哦！")},
             State);
handle_sync_event(_Event, _From, StateName, State) ->
    Reply = ok,
    continue(StateName, Reply, State).

handle_info({scene_gain, N}, StateName,
            State = #state{type = Type, atmosp = Atmosp})
    when StateName =/= idel andalso StateName =/= over ->
    apply_all(State,
              {wedding, apply_gain, [100, {Type, Atmosp}, 1]}),
    erlang:send_after(60000, self(), {scene_gain, N + 1}),
    continue(StateName, State);
handle_info({unit_talk, [], Next}, StateName, State) ->
    self() ! Next,
    continue(StateName, State);
handle_info({unit_talk, [Msg | T], Next}, StateName,
            State) ->
    unit_talk({16, 1}, Msg),
    erlang:send_after(5000, self(), {unit_talk, T, Next}),
    continue(StateName, State);
handle_info({effect, N}, StateName = ceremony,
            State = #state{map_id = MapId})
    when N =< 5 ->
    notice:effect({map, MapId}, 30074),
    erlang:send_after(util:rand(2500, 3000),
                      self(),
                      {effect, N + 1}),
    continue(StateName, State);
handle_info({move, N = 0, Line1, Line2},
            StateName = ceremony,
            State = #state{male_pid = _MalePid, map_id = MapId}) ->
    erlang:send_after(2000,
                      self(),
                      {move, N + 1, Line1, Line2}),
    self() ! {effect, 1},
    send_rand_talk(State, N),
    notice:effect({map, MapId}, 30066),
    continue(StateName, State);
handle_info({move, N = 1, Line1, Line2},
            StateName = ceremony,
            State = #state{male_pid = _MalePid, male_id = _MaleId,
                           male_name = _MaleName, female_id = _FemaleId,
                           female_name = _FemaleName, female_pid = _FemalePid,
                           map_id = _MapId}) ->
    camera_reset(State),
    put(camera, {wedding_mgr, camera_reset, [State]}),
    erlang:send_after(2500,
                      self(),
                      {move, N + 1, Line1, Line2}),
    send_rand_talk(State, N),
    continue(StateName, State);
handle_info({move,
             N,
             [{X1, Y1, Dir1} | Line1],
             [{X2, Y2, Dir2} | Line2]},
            StateName = ceremony,
            State = #state{male_pid = MalePid, male_id = _MaleId,
                           male_name = _MaleName, female_id = _FemaleId,
                           female_name = _FemaleName, female_pid = FemalePid,
                           map_id = MapId}) ->
    role:apply(async,
               MalePid,
               {wedding, apply_move, [X1, Y1, Dir1]}),
    role:apply(async,
               FemalePid,
               {wedding, apply_move, [X2, Y2, Dir2]}),
    erlang:send_after(10000,
                      self(),
                      {move, N + 1, Line1, Line2}),
    send_rand_talk(State, N),
    notice:effect({map, MapId}, 30075),
    continue(StateName, State);
handle_info({move, _N, _Line1, _Line2},
            StateName = ceremony, State) ->
    erlang:send_after(3000, self(), {ceremony, 10}),
    continue(StateName, State);
handle_info({ceremony, 10}, StateName = ceremony,
            State = #state{male_id = _MaleId, male_name = MaleName,
                           female_id = _FemaleId, female_name = FemaleName,
                           map_id = _MapId}) ->
    unit_talk({16, 1},
              notice:format(lang:get("~ts 先生你是否愿意和 ~ts 小姐结为伴侣，无论贫穷富有，你都永远爱她、照顾她。~ts "
                                     "先生，你愿意吗？"),
                            [{role_2, MaleName},
                             {role_2, FemaleName},
                             {role_2, MaleName}])),
    erlang:send_after(6000, self(), {ceremony, 11}),
    continue(StateName, State);
handle_info({ceremony, 11}, StateName = ceremony,
            State = #state{male_pid = MalePid, male_id = MaleId,
                           male_name = MaleName, map_id = MapId}) ->
    role:apply(async,
               MalePid,
               {wedding, apply_say, [lang:get("我愿意")]}),
    map:pack_send_to_all(MapId,
                         10413,
                         {MaleId, MaleName, lang:get("我愿意")}),
    erlang:send_after(6000, self(), {ceremony, 20}),
    continue(StateName, State);
handle_info({ceremony, 20}, StateName = ceremony,
            State = #state{male_id = _MaleId, male_name = MaleName,
                           female_id = _FemaleId, female_name = FemaleName,
                           map_id = _MapId}) ->
    unit_talk({16, 1},
              notice:format(lang:get("~ts 小姐愿意与 ~ts 先生结为伴侣，无论是贫穷富有，你都永远爱他、照顾他。~ts "
                                     "小姐，你愿意吗？"),
                            [{role_2, FemaleName},
                             {role_2, MaleName},
                             {role_2, FemaleName}])),
    erlang:send_after(6000, self(), {ceremony, 21}),
    continue(StateName, State);
handle_info({ceremony, 21}, StateName = ceremony,
            State = #state{female_pid = FemalePid,
                           female_id = FemaleId, female_name = FemaleName,
                           map_id = MapId}) ->
    role:apply(async,
               FemalePid,
               {wedding, apply_say, [lang:get("我愿意")]}),
    map:pack_send_to_all(MapId,
                         10413,
                         {FemaleId, FemaleName, lang:get("我愿意")}),
    erlang:send_after(6000, self(), {ceremony, 30}),
    continue(StateName, State);
handle_info({ceremony, 30}, StateName = ceremony,
            State = #state{}) ->
    unit_talk({16, 1},
              lang:get("男方，此时的你可以张开双臂，在全场来宾的掌声之中上前一步，拥抱并亲吻你美丽的女方！")),
    erlang:send_after(6000, self(), {ceremony, 31}),
    continue(StateName, State);
handle_info({ceremony, 31}, StateName = ceremony,
            State = #state{male_id = MaleId, female_id = FemaleId,
                           map_id = MapId}) ->
    map:pack_send_to_all(MapId,
                         10150,
                         {[MaleId, FemaleId], 1, 1}),
    notice:effect({map, MapId}, 30234),
    erlang:send_after(6000, self(), {ceremony, 40}),
    continue(StateName, State);
handle_info({ceremony, 40}, StateName = ceremony,
            State = #state{male_id = _MaleId, male_name = MaleName,
                           female_id = _FemaleId, female_name = FemaleName}) ->
    unit_talk({16, 1},
              notice:format(lang:get("至此，~ts先生、~ts小姐的结缘大典圆满礼成，下面大家在这里可以尽情享受这快乐的时光！"),
                            [{role_2, FemaleName}, {role_2, MaleName}])),
    erlang:send_after(3000, self(), {ceremony, 41}),
    continue(StateName, State);
handle_info({ceremony, 41}, StateName = ceremony,
            State = #state{male_id = _MaleId, male_name = MaleName,
                           female_id = _FemaleId, female_name = FemaleName}) ->
    notice:cast({map, get(map_id)},
                7,
                notice:format(lang:get("~ts 与 ~ts 互换了结缘戒指，将戒指紧紧地套入对方无名指中！"),
                              [{role_2, MaleName}, {role_2, FemaleName}])),
    erlang:send_after(3000, self(), {ceremony, 50}),
    continue(StateName, State);
handle_info({ceremony, 50}, StateName = ceremony,
            State = #state{map_id = MapId}) ->
    notice:effect({map, MapId}, 30234),
    case get(guest_list) of
        [#guest{id = _GuestId, name = GuestName} | _] ->
            notice:cast({map, get(map_id)},
                        4,
                        notice:format(lang:get("~ts 角色名心情澎湃，不由地抓起一把花向这对有缘人撒去！"),
                                      [{role_2, GuestName}]));
        _ -> ignore
    end,
    erlang:send_after(3000, self(), {ceremony, 51}),
    continue(StateName, State);
handle_info({ceremony, 51}, StateName = ceremony,
            State = #state{male_id = _MaleId, male_name = _MaleName,
                           female_id = _FemaleId, female_name = _FemaleName,
                           ts = Ts, timeout = Timeout}) ->
    put(ceremony_time, util:time_left(Timeout, Ts)),
    continue(StateName,
             State#state{ts = date:now2(), timeout = 1});
handle_info({camera_move_to, Id, X, Y}, StateName,
            State) ->
    camera_move_to(State, Id, X, Y),
    put(camera,
        {wedding_mgr, camera_move_to, [State, Id, X, Y]}),
    continue(StateName, State);
handle_info({to_act,
             act,
             RoleId,
             Pid,
             Name,
             Now,
             Pos,
             Data,
             RoleMsg},
            StateName,
            State = #state{male_id = RoleId,
                           male_act_list = ActList})
    when StateName =/= idel ->
    {NState, NewActList} = to_act(RoleId,
                                  Pid,
                                  Name,
                                  Now,
                                  Data,
                                  Pos,
                                  ActList,
                                  State,
                                  RoleMsg),
    push_atmosp(NState),
    continue(StateName,
             NState#state{male_act_list = NewActList});
handle_info({to_act,
             act,
             RoleId,
             Pid,
             Name,
             Now,
             Pos,
             Data,
             RoleMsg},
            StateName,
            State = #state{female_id = RoleId,
                           female_act_list = ActList})
    when StateName =/= idel ->
    {NState, NewActList} = to_act(RoleId,
                                  Pid,
                                  Name,
                                  Now,
                                  Data,
                                  Pos,
                                  ActList,
                                  State,
                                  RoleMsg),
    push_atmosp(NState),
    continue(StateName,
             NState#state{female_act_list = NewActList});
handle_info({to_act,
             guest_act,
             RoleId,
             Pid,
             Name,
             Now,
             Pos,
             Data,
             RoleMsg},
            StateName, State)
    when StateName =/= idel ->
    NewState = case get_guest(RoleId) of
                   Guest = #guest{act_list = ActList} ->
                       {NState, NewActList} = to_act(RoleId,
                                                     Pid,
                                                     Name,
                                                     Now,
                                                     Data,
                                                     Pos,
                                                     ActList,
                                                     State,
                                                     RoleMsg),
                       update_guest(Guest#guest{act_list = NewActList}),
                       NState;
                   _ -> State
               end,
    push_atmosp(NewState),
    continue(StateName, NewState);
handle_info({in_rank, Type, Data}, StateName, State) ->
    wedding_rank:in_rank(Type, Data),
    continue(StateName, State);
handle_info(rank_hour_zero, StateName, State) ->
    wedding_rank:rank_hour_zero(),
    erlang:send_after(86400 * 1000, self(), rank_hour_zero),
    continue(StateName, State);
handle_info({clean_rank, Type}, StateName, State) ->
    wedding_rank:clean_rank(Type),
    continue(StateName, State);
handle_info(gm_rank_honor, StateName, State) ->
    wedding_rank:honor(),
    continue(StateName, State);
handle_info(wedding_compensate, StateName, State) ->
    case env:get(wedding_roles) of
        Roles = [_ | _] -> wedding_compensate(Roles);
        _ -> ignore
    end,
    env:del(wedding_roles),
    continue(StateName, State);
handle_info(_Info, StateName, State) ->
    continue(StateName, State).

terminate(_Reason, _StateName,
          _State = #state{is_wedding = IsWedding, type = Type,
                          male_id = MaleId, female_id = FeMaleId}) ->
    case IsWedding of
        1 ->
            List = [{MaleId, 1, Type}, {FeMaleId, 0, Type}],
            env:save(wedding_roles, List);
        _ -> ignore
    end,
    ok.

code_change(_OldVsn, StateName, State, _Extra) ->
    {ok, StateName, State}.

idel(timeout, State) ->
    continue(idel,
             State#state{ts = date:now2(), timeout = 86400000});
idel(_Any, State) -> continue(idel, State).

notice(timeout,
       State = #state{male_id = _MaleId, male_name = MaleName,
                      male_pid = MalePid, female_id = _FemaleId,
                      female_pid = FemalePid, female_name = FemaleName,
                      type = Type, map_id = MapId}) ->
    case Type of
        2 ->
            notice:cast(all,
                        4,
                        notice:format(lang:get("~ts与~ts准备举行一场<color='#00ff00'>豪华典礼</color>，大家"
                                               "赶快前去参加祝福吧{face_1,38}"),
                                      [{role_2, MaleName},
                                       {role_2, FemaleName}]));
        1 ->
            notice:cast(all,
                        4,
                        notice:format(lang:get("~ts 与 ~ts 准备举行一场温馨浪漫的典礼，赶快前往参加祝福吧！"),
                                      [{role_2, MaleName},
                                       {role_2, FemaleName}]));
        _ -> skip
    end,
    role:apply(async,
               MalePid,
               {wedding, apply_enter, [MapId, Type]}),
    role:apply(async,
               FemalePid,
               {wedding, apply_enter, [MapId, Type]}),
    NewState = State#state{ts = date:now2(),
                           timeout = 240000},
    push_wedding(1, NewState),
    push_atmosp(NewState),
    self() ! {scene_gain, 0},
    continue(pre, NewState);
notice(_Any, State) -> continue(notice, State).

pre(timeout,
    State = #state{map_id = MapId, male_name = MaleName,
                   female_name = FemaleName}) ->
    notice:pop({map, MapId},
               0,
               util:flist(lang:get("<color='#ffff00'>~ts</color>与<color='#ffff00'"
                                   ">~ts</color>的典礼仪式将在1分钟后开启，快准备一下哦！"),
                          [MaleName, FemaleName])),
    NewState = State#state{ts = date:now2(),
                           timeout = 60000},
    continue(pre_ceremony, NewState);
pre(_Any, State) -> continue(pre, State).

pre_ceremony(timeout,
             State = #state{map_id = MapId, male_id = _MaleId,
                            male_pid = MalePid, male_name = MaleName,
                            female_id = _FemaleId, female_pid = FemalePid,
                            female_name = FemaleName}) ->
    Now = date:unixtime(),
    X = 1306,
    Y = 838,
    unit_mgr:create({16, 1}, 20059, {MapId, X, Y}),
    NewState = State#state{ts = date:now2(),
                           timeout = 100000, ceremony_start = Now},
    push_wedding(2, NewState),
    [{X1, Y1, Dir1} | Line1] = wedding_data:points(1),
    [{X2, Y2, Dir2} | Line2] = wedding_data:points(2),
    role:apply(async,
               MalePid,
               {wedding, apply_pos, [X1, Y1, Dir1, 13]}),
    role:apply(async,
               FemalePid,
               {wedding, apply_pos, [X2, Y2, Dir2, 13]}),
    set_guest_pos(get(guest_list)),
    notice:effect(all, 30234),
    erlang:send_after(3000,
                      self(),
                      {camera_move_to, {16, 1}, X, Y}),
    erlang:send_after(5000,
                      self(),
                      {unit_talk,
                       [lang:get("各位亲朋好友，大家好！"),
                        notice:format(lang:get("非常荣幸能够和莅临典礼现场的每一位好友一起来见证一对 ~ts 先生和 ~ts "
                                               "小姐的浪漫典礼仪式。"),
                                      [{role_2, MaleName},
                                       {role_2, FemaleName}]),
                        lang:get("从这一刻起，缘分的大门向一对新人敞开，有请新人沿着铺满祝福的今生之路，步入圣洁的典礼殿堂。")],
                       {move, 0, Line1, Line2}}),
    put(ceremony_time, 0),
    map:active_region(MapId, 1, 1),
    continue(ceremony, NewState);
pre_ceremony(_Any, State) ->
    continue(pre_ceremony, State).

ceremony(timeout,
         State = #state{map_id = MapId, male_pid = MalePid,
                        female_pid = FemalePid, male_id = _MaleId,
                        male_name = MaleName, female_id = _FemaleId,
                        female_name = FemaleName, type = Type,
                        male_lover = MaleLover, female_lover = FemaleLover}) ->
    map:active_region(MapId, 1, 0),
    unit_mgr:remove({16, 1}),
    NewMaleLover = MaleLover#lover{status = 3},
    NewFemaleLover = FemaleLover#lover{status = 3},
    update_ets([NewMaleLover, NewFemaleLover], all),
    NewState = State#state{male_lover = NewMaleLover,
                           female_lover = NewFemaleLover, ts = date:now2(),
                           timeout = 300000},
    push_wedding(3, NewState),
    role:apply(async,
               MalePid,
               {wedding, apply_set_event, [12]}),
    role:apply(async,
               FemalePid,
               {wedding, apply_set_event, [12]}),
    [role:apply(async,
                RPid,
                {wedding, apply_set_event, [14]})
     || #guest{pid = RPid} <- get(guest_list), is_pid(RPid)],
    camera_cancel(NewState),
    role:apply(async, MalePid, {wedding, add_honor, []}),
    role:apply(async, FemalePid, {wedding, add_honor, []}),
    role:apply(async,
               MalePid,
               {friend_zone, update, [lover, FemaleName]}),
    role:apply(async,
               FemalePid,
               {friend_zone, update, [lover, MaleName]}),
    case Type of
        2 ->
            role:apply(async,
                       MalePid,
                       {wedding,
                        apply_love_score,
                        [299, lang:get("豪华典礼已经圆满结束")]}),
            role:apply(async,
                       FemalePid,
                       {wedding,
                        apply_love_score,
                        [299, lang:get("豪华典礼已经圆满结束")]});
        _ ->
            role:apply(async,
                       MalePid,
                       {wedding,
                        apply_love_score,
                        [20, lang:get("挚爱典礼已经圆满结束")]}),
            role:apply(async,
                       FemalePid,
                       {wedding,
                        apply_love_score,
                        [20, lang:get("挚爱典礼已经圆满结束")]})
    end,
    put(camera, {false, false, false}),
    continue(freedom, NewState);
ceremony(_Any, State) -> continue(ceremony, State).

freedom(timeout,
        State = #state{type = Type, male_id = _MaleId,
                       male_name = MaleName, female_id = _FemaleId,
                       female_name = FemaleName, guest_num = GuestNum}) ->
    push_wedding(4, State),
    case Type of
        2 ->
            notice:cast(all,
                        5,
                        notice:format(lang:get("典礼现场出现了一批<color='#00ff00'>结缘宝箱</color>，祝 "
                                               "~ts 和 ~ts 永结同心{face_1,3}"),
                                      [{role_2, MaleName},
                                       {role_2, FemaleName}])),
            do_create_unit(max(2,
                               util:ceil((GuestNum + 2) * 8.0e-1)),
                           10045,
                           State,
                           []);
        _ -> ignore
    end,
    continue(over,
             State#state{ts = date:now2(), timeout = 300000});
freedom(_Any, State) -> continue(freedom, State).

over(timeout, State = #state{}) ->
    do_over(State),
    push_wedding(0, State),
    continue(idel,
             State#state{is_wedding = 0, ts = date:now2(),
                         timeout = 86400000});
over(_Any, State) -> continue(over, State).

do_over(State = #state{type = Type, map_id = MapId,
                       map_pid = MapPid, male_pid = MalePid, male_id = MaleId,
                       male_name = MaleName, female_pid = FemalePid,
                       female_id = FemaleId, female_name = FemaleName,
                       male_lover = MaleLover, female_lover = FemaleLover,
                       atmosp = _Atmosp, is_wedding = 1, next_id = NextId}) ->
    update_ets([MaleLover#lover{status = 3},
                FemaleLover#lover{status = 3}],
               all),
    role:apply(async, MalePid, {wedding, apply_leave, []}),
    role:apply(async,
               FemalePid,
               {wedding, apply_leave, []}),
    [role:apply(async, RPid, {wedding, apply_leave, []})
     || #guest{pid = RPid} <- get(guest_list), is_pid(RPid)],
    push_wedding(0, State),
    WeddingMsg = case Type of
                     1 -> lang:get("挚爱典礼");
                     _ -> lang:get("豪华典礼")
                 end,
    notice:cast(all,
                4,
                notice:format(lang:get("在爱神的见证下，~ts与~ts举办了~ts，成为本服第 ~ts 对伴侣{face_1,3}"),
                              [{role_2, MaleName},
                               {role_2, FemaleName},
                               {string_2, 1, WeddingMsg},
                               {string_2, 1, NextId - 1}])),
    notice:cast(all,
                11,
                notice:format(lang:get("在爱神的见证下，~ts与~ts举办了~ts，成为本服第 ~ts 对伴侣{face_1,3}"),
                              [{role_2, MaleName},
                               {role_2, FemaleName},
                               {string_2, 1, WeddingMsg},
                               {string_2, 1, NextId - 1}])),
    unit_mgr:remove_map_all(MapId),
    case rank_conver(1, State) of
        {ok, TimeRank} -> info({in_rank, 1, TimeRank});
        _ -> ignore
    end,
    case rank_conver(2, State) of
        {ok, AtmospRank} -> info({in_rank, 2, AtmospRank});
        _ -> ignore
    end,
    case wedding_data:reward({Type, 1}) of
        {Mail1, Items1 = [_ | _]} ->
            mail:send(MaleId, lang:get("举办典礼"), Mail1, Items1);
        _ -> skip
    end,
    case wedding_data:reward({Type, 0}) of
        {Mail2, Items2 = [_ | _]} ->
            mail:send(FemaleId, lang:get("举办典礼"), Mail2, Items2);
        _ -> skip
    end,
    LogArgs = #{id => MaleId, name => MaleName,
                other_id => FemaleId, other_name => FemaleName,
                handle => "婚礼结束", type => Type},
    role:apply(async, MaleId, {log, wedding, [LogArgs]}),
    child:wed(MaleId, FemaleId),
    map:stop(MapPid);
do_over(_State) -> ok.

push_wedding(Status,
             State = #state{type = Type, time = StartTime,
                            end_time = EndTime, male_id = MaleId,
                            male_classes = MaleClasses, male_sex = MaleSex,
                            male_lev = MaleLev, male_face = MaleFace,
                            male_name = MaleName, female_id = FemaleId,
                            female_classes = FemaleClasses,
                            female_sex = FemaleSex, female_lev = FemaleLev,
                            female_face = FemaleFace,
                            female_name = FemaleName}) ->
    Time = get_time(Status, State),
    role_group:pack_send(world,
                         15003,
                         {Status,
                          Type,
                          StartTime,
                          EndTime,
                          MaleId,
                          MaleClasses,
                          MaleSex,
                          MaleLev,
                          MaleFace,
                          MaleName,
                          FemaleId,
                          FemaleClasses,
                          FemaleSex,
                          FemaleLev,
                          FemaleFace,
                          FemaleName,
                          Time}).

push_wedding(Pid, Status,
             State = #state{type = Type, time = StartTime,
                            end_time = EndTime, male_id = MaleId,
                            male_classes = MaleClasses, male_sex = MaleSex,
                            male_lev = MaleLev, male_face = MaleFace,
                            male_name = MaleName, female_id = FemaleId,
                            female_classes = FemaleClasses,
                            female_sex = FemaleSex, female_lev = FemaleLev,
                            female_face = FemaleFace,
                            female_name = FemaleName}) ->
    Time = get_time(Status, State),
    role:pack_send(Pid,
                   15003,
                   {Status,
                    Type,
                    StartTime,
                    EndTime,
                    MaleId,
                    MaleClasses,
                    MaleSex,
                    MaleLev,
                    MaleFace,
                    MaleName,
                    FemaleId,
                    FemaleClasses,
                    FemaleSex,
                    FemaleLev,
                    FemaleFace,
                    FemaleName,
                    Time}).

get_time(Status,
         #state{type = Type, time = StartTime,
                end_time = EndTime, ceremony_start = CeremonyStart}) ->
    Now = date:unixtime(),
    Time = case Status >= 2 of
               true
                   when Type == 2 andalso
                            (Status == 2 orelse Status == 3) ->
                   (300000 + 100000) div 1000 - (Now - CeremonyStart);
               true -> EndTime - Now;
               _ -> StartTime + (240000 + 60000) div 1000 - Now
           end,
    max(0, Time).

push_invit(List,
           #state{male_pid = MalePid, female_pid = FeMalePid,
                  guest_max = Max, guest_num = Num}) ->
    role:pack_send(MalePid,
                   15013,
                   {length(List), Max, Num}),
    role:pack_send(FeMalePid,
                   15013,
                   {length(List), Max, Num}),
    ok.

push_invit(Pid, List,
           #state{guest_max = Max, guest_num = Num}) ->
    role:pack_send(Pid, 15013, {length(List), Max, Num}),
    ok.

wedding_compensate([]) -> ok;
wedding_compensate([{RoleId, Sex, Type} | T]) ->
    logger:info("婚礼补偿:~p, sex:~w; type:~w",
                [RoleId, Sex, Type],
                wedding_mgr,
                1068),
    case wedding_data:reward({Type, Sex}) of
        {Mail2, Items2 = [_ | _]} ->
            mail:send(RoleId, lang:get("举办典礼"), Mail2, Items2);
        _ -> skip
    end,
    wedding_compensate(T).

apply_all(#state{male_pid = MalePid,
                 female_pid = FemalePid},
          Mfa) ->
    role:apply(async, MalePid, Mfa),
    role:apply(async, FemalePid, Mfa),
    [role:apply(async, RPid, Mfa)
     || #guest{pid = RPid} <- get(guest_list), is_pid(RPid)].

load_data() ->
    Fun = fun (Lover = #lover{order_index = OrderIndex,
                              index = Index},
               {N1, N2}) ->
                  update_ets(Lover, ets),
                  {max(OrderIndex, N1), max(Index, N2)}
          end,
    {NextOrderId, NextId} = dets:foldl(Fun, {0, 0}, lover),
    {NextOrderId + 1, NextId + 1}.

do_invit([], _Role, _, _Msg, _L) -> ok;
do_invit([Rid | T], Role,
         State = #state{type = Type, time = Time,
                        male_id = MaleId, male_classes = MaleClasses,
                        male_sex = MaleSex, male_lev = MaleLev,
                        male_face = MaleFace, male_name = MaleName,
                        female_id = FemaleId, female_classes = FemaleClasses,
                        female_sex = FemaleSex, female_lev = FemaleLev,
                        female_face = FemaleFace, female_name = FemaleName},
         Msg, L) ->
    case role_query:pid(by_id, Rid) of
        {ok, Pid} ->
            role:apply(async,
                       Pid,
                       {wedding_mgr,
                        apply_do_invit,
                        [{Type,
                          Time,
                          MaleId,
                          MaleClasses,
                          MaleSex,
                          MaleLev,
                          MaleFace,
                          MaleName,
                          FemaleId,
                          FemaleClasses,
                          FemaleSex,
                          FemaleLev,
                          FemaleFace,
                          FemaleName,
                          Msg}]}),
            do_invit(T, Role, State, Msg, [Rid | L]);
        _ -> do_invit(T, Role, State, Msg, L)
    end.

set_guest_pos([]) -> ok;
set_guest_pos([I | T]) ->
    set_guest_pos(I),
    set_guest_pos(T);
set_guest_pos(#guest{pid = Pid}) when is_pid(Pid) ->
    case get_guest_pos() of
        {X, Y, Dir} ->
            role:apply(async,
                       Pid,
                       {wedding, apply_pos, [X, Y, Dir, 15]});
        _ -> skip
    end;
set_guest_pos(_) -> ok.

get_guest_pos() ->
    case get(guest_points) of
        [{X, Y, Dir} | PL] ->
            put(guest_points, PL),
            {X, Y, Dir};
        _ ->
            case wedding_data:points(3) of
                [{X, Y, Dir} | PL] ->
                    put(guest_points, PL),
                    {X, Y, Dir};
                _ -> skip
            end
    end.

get_guest(RoleId) ->
    lists:keyfind(RoleId, #guest.id, get(guest_list)).

update_guest(G = #guest{id = RoleId}) ->
    put(guest_list,
        lists:keyreplace(RoleId,
                         #guest.id,
                         get(guest_list),
                         G)).

unit_talk(UnitId, Msg) ->
    unit:talk(UnitId, Msg),
    notice:cast({map, get(map_id)}, 7, Msg).

camera_move_to(#state{map_id = MapId}, {BattleId, UId},
               X, Y) ->
    map:pack_send_to_all(MapId,
                         15017,
                         {1, BattleId, "", UId, 0, X, Y, 2000}),
    ok.

camera_move_to(Pid, #state{}, {BattleId, UId}, X, Y) ->
    role:pack_send(Pid,
                   15017,
                   {1, BattleId, "", UId, 0, X, Y, 2000}),
    ok.

camera_reset(#state{female_pid = FeMalePid}) ->
    role:apply(async,
               FeMalePid,
               {wedding_mgr, camera_reset_apply, []}),
    ok.

camera_reset(Pid, #state{female_pid = FeMalePid}) ->
    role:apply(async,
               FeMalePid,
               {wedding_mgr, camera_reset_apply, [Pid]}),
    ok.

camera_reset_apply(#role{id = {Id, Platform, ZoneId},
                         pos = #pos{map = MapId, x = X, y = Y}}) ->
    map:pack_send_to_all(MapId,
                         15017,
                         {2, Id, Platform, ZoneId, 0, X, Y, 2000}),
    ok.

camera_reset_apply(#role{id = {Id, Platform, ZoneId},
                         pos = #pos{x = X, y = Y}},
                   Pid) ->
    role:pack_send(Pid,
                   15017,
                   {2, Id, Platform, ZoneId, 0, X, Y, 2000}),
    ok.

camera_cancel(#state{map_id = MapId}) ->
    map:pack_send_to_all(MapId,
                         15017,
                         {3, 0, "", 0, 0, 0, 0, 2000}),
    ok.

camera_cancel(Pid, #state{}) ->
    role:pack_send(Pid,
                   15017,
                   {3, 0, "", 0, 0, 0, 0, 2000}),
    ok.

do_create_unit(Num, _UnitBaseId, _State, _Points)
    when Num =< 0 ->
    ok;
do_create_unit(Num, UnitBaseId,
               State = #state{map_id = MapId}, Points) ->
    {X, Y} = case util:rand_list(Points) of
                 {X1, Y1} -> {X1, Y1};
                 _ -> map_mgr:rand_point(MapId, 30002)
             end,
    UnitId = get_unit_id(),
    unit_mgr:create({16, UnitId},
                    UnitBaseId,
                    {MapId, X, Y}),
    do_create_unit(Num - 1,
                   UnitBaseId,
                   State,
                   Points -- [{X, Y}]).

get_unit_id() ->
    UnitId = get(unit_id),
    put(unit_id, UnitId + 1).

do_act(Label, RoleId, Pid, Name, Pos,
       Data = #wedding_act_data{id = ActId, free_num = FreeNum,
                                max_num = MaxNum},
       ActList, RoleMsg) ->
    Now = date:unixtime(),
    case lists:keyfind(ActId, 1, ActList) of
        {_, _, MTime} when MTime >= Now ->
            notice:send({pid, Pid},
                        1,
                        notice:format(lang:get("需要 ~ts 秒后才能再次使用~ts"),
                                      [{string_2, 5, MTime - Now},
                                       {string_1, wedding:act_name(ActId)}]));
        {_, ActNum, _} when ActNum >= MaxNum ->
            notice:send({pid, Pid}, 1, lang:get("该动作次数已满"));
        {_, ActNum, _} when ActNum >= FreeNum ->
            role:apply(async,
                       Pid,
                       {wedding, act_apply, [Label, Now, Data, RoleMsg]});
        _ when FreeNum == 0 ->
            role:apply(async,
                       Pid,
                       {wedding, act_apply, [Label, Now, Data, RoleMsg]});
        _ ->
            self() !
                {to_act,
                 Label,
                 RoleId,
                 Pid,
                 Name,
                 Now,
                 Pos,
                 Data,
                 RoleMsg}
    end.

to_act(RoleId, Pid, Name, Now,
       Data = #wedding_act_data{id = ActId, msg = Msg,
                                log_msg = LogMsg, atmosp = AddAtmosp,
                                effect_type = EffectType,
                                effect_num = EffectNum, cd = Cd},
       Pos, ActList,
       State = #state{atmosp = Atmosp, map_id = MapId,
                      female_pid = FemalePid, male_pid = MalePid,
                      guest_num = GuestNum},
       RoleMsg) ->
    NewActList = case lists:keyfind(ActId, 1, ActList) of
                     {_, ActNum, _} ->
                         AddAct = {ActId, ActNum + 1, Now + Cd},
                         role:pack_send(Pid, 15007, {2, [AddAct]}),
                         lists:keystore(ActId, 1, ActList, AddAct);
                     _ ->
                         AddAct = {ActId, 1, Now + Cd},
                         role:pack_send(Pid, 15007, {2, [AddAct]}),
                         lists:keystore(ActId, 1, ActList, AddAct)
                 end,
    NewEffectNum = case EffectType of
                       1 -> max(2, util:ceil((GuestNum + 2) * 8.0e-1));
                       _ -> EffectNum
                   end,
    to_act2(NewEffectNum,
            Pos,
            Data,
            RoleMsg,
            {RoleId, Name, Pid}),
    case Msg of
        "" -> ignore;
        _ when ActId == 5 ->
            CastMsg = notice:replace_role(Msg, [{role_2, Name}]),
            notice:cast({map, MapId}, 9, CastMsg),
            notice:cast({map, MapId}, 7, CastMsg);
        _ ->
            CastMsg = notice:replace_role(Msg, [{role_2, Name}]),
            notice:cast({map, MapId}, 7, CastMsg)
    end,
    case LogMsg of
        "" -> ignore;
        _ ->
            NewLogMsg = notice:replace_role(LogMsg,
                                            [{role_2, Name}]),
            add_act_msg({NewLogMsg, date:unixtime()})
    end,
    role:apply(async, Pid, {wedding, act_gain, [Data]}),
    role:apply(async,
               MalePid,
               {wedding, act_main_gain, [Name, Data]}),
    role:apply(async,
               FemalePid,
               {wedding, act_main_gain, [Name, Data]}),
    NewAtmoasp = Atmosp + AddAtmosp,
    NewState = State#state{atmosp = NewAtmoasp},
    update_atmoasp(Atmosp, NewState),
    role:pack_send(Pid, 15006, {1, ActId}),
    {NewState, NewActList}.

to_act2(_, _Pos, _Data, _RoleMsg,
        _RoleInfo = #wedding_act_data{effect_type = 0}) ->
    ok;
to_act2(0, _Pos, _Data, _RoleMsg, _RoleInfo) -> ok;
to_act2(Num, Pos,
        Data = #wedding_act_data{effect_type = 1,
                                 effect_id = UnitBaseId},
        RoleMsg, RoleInfo) ->
    MapId = get(map_id),
    {X, Y} = map_mgr:rand_point(MapId, 30002),
    UnitId = get_unit_id(),
    notice:effect({map, MapId}, 30074),
    unit_mgr:create({16, UnitId},
                    UnitBaseId,
                    {MapId, X, Y}),
    to_act2(Num - 1, Pos, Data, RoleMsg, RoleInfo);
to_act2(Num, Pos,
        Data = #wedding_act_data{effect_type = 2,
                                 effect_id = EffectId},
        RoleMsg, RoleInfo) ->
    MapId = get(map_id),
    notice:effect({map, MapId}, EffectId),
    to_act2(Num - 1, Pos, Data, RoleMsg, RoleInfo);
to_act2(Num, Pos = #pos{x = X, y = Y},
        Data = #wedding_act_data{effect_type = 3,
                                 effect_id = EffectId},
        RoleMsg, RoleInfo) ->
    MapId = get(map_id),
    notice:effect({map, MapId}, EffectId, 1, 30002, X, Y),
    to_act2(Num - 1, Pos, Data, RoleMsg, RoleInfo);
to_act2(Num, Pos,
        Data = #wedding_act_data{effect_type = 4}, RoleMsg,
        RoleInfo = {_, _, Pid}) ->
    role:apply(async,
               Pid,
               {wedding, barrage_apply, [RoleMsg]}),
    to_act2(Num - 1, Pos, Data, RoleMsg, RoleInfo);
to_act2(Num, Pos, Data, RoleMsg, RoleInfo) ->
    to_act2(Num - 1, Pos, Data, RoleMsg, RoleInfo).

push_atmosp(Pid, #state{atmosp = Atmosp}) ->
    role:pack_send(Pid, 15011, {Atmosp}).

push_atmosp(#state{atmosp = Atmosp}) ->
    map:pack_send_to_all(get(map_id), 15011, {Atmosp}).

add_act_msg(Msg) ->
    LogList = get(act_log),
    put(act_log, [Msg | LogList]),
    map:pack_send_to_all(get(map_id), 15012, {1, [Msg]}).

update_atmoasp(Atmosp,
               State = #state{type = Type, male_id = MaleId,
                              female_id = FemaleId, atmosp = NewAtmosp,
                              map_id = MapId}) ->
    case {wedding_data:atmosp_reward({Type, Atmosp}),
          wedding_data:atmosp_reward({Type, NewAtmosp})}
        of
        {Data, Data} -> skip;
        {_,
         #wedding_atmosp_data{scene_reward = Reward,
                              scene_msg = SceneMsg, male_reward = MaleReward0,
                              famale_reward = FemaleReward, title = Title,
                              content = Content}} ->
            case MaleReward0 of
                [_ | _] ->
                    MaleReward = [{item_type:special_id(MId), Mnum}
                                  || {MId, Mnum} <- MaleReward0],
                    notice:cast({map, MapId},
                                7,
                                notice:format(lang:get("典礼浪漫值达到~ts点，新人获得~ts {face_1,3}"),
                                              [{string_2, 5, NewAtmosp},
                                               {item_2, MaleReward}])),
                    MaleMailInfo = #{title => Title, content => Content,
                                     items => MaleReward, source => 9},
                    FemaleMailInfo = #{title => Title, content => Content,
                                       items => FemaleReward, source => 9},
                    mail:send(MaleId, MaleMailInfo),
                    mail:send(FemaleId, FemaleMailInfo);
                _ -> skip
            end,
            case Reward of
                [_ | _] ->
                    apply_all(State,
                              {wedding, apply_gain, [update_atmoasp, Reward]});
                _ -> skip
            end,
            case SceneMsg of
                "" -> skip;
                _ -> notice:cast({map, MapId}, 110, SceneMsg)
            end;
        _ -> skip
    end.

rank_conver(1,
            #state{male_id = MaleId, male_name = MaleName,
                   male_sex = MaleSex, male_classes = MaleClasses,
                   male_lev = MaleLev, female_id = FemaleId,
                   female_name = FemaleName, female_sex = FemaleSex,
                   female_classes = FemaleClasses, female_lev = FemaleLev,
                   type = Type}) ->
    Now = date:unixtime(),
    {ok,
     #wedding_rank_rc{id = {MaleId, FemaleId},
                      male_id = MaleId, male_name = MaleName, time = Now,
                      male_sex = MaleSex, male_classes = MaleClasses,
                      male_lev = MaleLev, female_id = FemaleId,
                      female_name = FemaleName, female_sex = FemaleSex,
                      female_classes = FemaleClasses, female_lev = FemaleLev,
                      val1 = Now, val2 = Type}};
rank_conver(2,
            #state{male_id = MaleId, male_name = MaleName,
                   male_sex = MaleSex, male_classes = MaleClasses,
                   male_lev = MaleLev, female_id = FemaleId,
                   female_name = FemaleName, female_sex = FemaleSex,
                   female_classes = FemaleClasses, female_lev = FemaleLev,
                   atmosp = Atmosp, type = Type}) ->
    Now = date:unixtime(),
    {ok,
     #wedding_rank_rc{id = {MaleId, FemaleId},
                      male_id = MaleId, male_name = MaleName, time = Now,
                      male_sex = MaleSex, male_classes = MaleClasses,
                      male_lev = MaleLev, female_id = FemaleId,
                      female_name = FemaleName, female_sex = FemaleSex,
                      female_classes = FemaleClasses, female_lev = FemaleLev,
                      val1 = Atmosp, val2 = Type}};
rank_conver(3,
            Role = #role{id = MaleId, name = MaleName,
                         classes = MaleClasses, lev = MaleLev,
                         m_wedding =
                             #m_wedding{lover_id = FemaleId,
                                        lover_name = FemaleName}}) ->
    Now = date:unixtime(),
    case wedding:lover(MaleId) of
        {ok,
         #lover{lover_classes = FemaleClasses,
                lover_lev = FemaleLev, type = Type}} ->
            Val = var:get_var(Role, week, 208),
            {ok,
             #wedding_rank_rc{id = {MaleId, FemaleId},
                              male_id = MaleId, male_name = MaleName,
                              time = Now, male_sex = 1,
                              male_classes = MaleClasses, male_lev = MaleLev,
                              female_id = FemaleId, female_name = FemaleName,
                              female_sex = 0, female_classes = FemaleClasses,
                              female_lev = FemaleLev, val1 = Val, val2 = Type}};
        _ -> false
    end;
rank_conver(4,
            Role = #role{id = MaleId, name = MaleName,
                         classes = MaleClasses, lev = MaleLev,
                         m_wedding =
                             #m_wedding{lover_id = FemaleId,
                                        lover_name = FemaleName}}) ->
    Now = date:unixtime(),
    case wedding:lover(MaleId) of
        {ok,
         #lover{lover_classes = FemaleClasses,
                lover_lev = FemaleLev, type = Type}} ->
            Val = var:get_var(Role, acc, 1009),
            {ok,
             #wedding_rank_rc{id = {MaleId, FemaleId},
                              male_id = MaleId, male_name = MaleName,
                              time = Now, male_sex = 1,
                              male_classes = MaleClasses, male_lev = MaleLev,
                              female_id = FemaleId, female_name = FemaleName,
                              female_sex = 0, female_classes = FemaleClasses,
                              female_lev = FemaleLev, val1 = Val, val2 = Type}};
        _ -> false
    end;
rank_conver(_, _) -> false.

update_lover(Lover, []) -> Lover;
update_lover(Lover, [{Key, Val} | T]) ->
    NewLover = erlang:setelement(Key, Lover, Val),
    update_lover(NewLover, T).

send_rand_talk(#state{male_pid = MalePid,
                      male_id = MaleId, male_name = MaleName,
                      female_id = FemaleId, female_name = FemaleName,
                      female_pid = FemalePid, map_id = MapId},
               N) ->
    case N rem 2 of
        0 ->
            MaleRandTalk = rand_talk(male),
            role:apply(async,
                       MalePid,
                       {wedding, apply_say, [MaleRandTalk]}),
            map:pack_send_to_all(MapId,
                                 10413,
                                 {MaleId, MaleName, MaleRandTalk});
        _ ->
            FemaleRandTalk = rand_talk(female),
            role:apply(async,
                       FemalePid,
                       {wedding, apply_say, [FemaleRandTalk]}),
            map:pack_send_to_all(MapId,
                                 10413,
                                 {FemaleId, FemaleName, FemaleRandTalk})
    end,
    ok.

rand_talk(male) ->
    util:rand_list([lang:get("谢谢大家"),
                    lang:get("我的伴侣好美啊"),
                    lang:get("终于要把伴侣带回家了"),
                    lang:get("照顾不到，大家今天就尽情的吃喝吧"),
                    lang:get("好紧张"),
                    lang:get("从今天开始，我也是有家的人啦"),
                    lang:get("谁也不能阻挡我，永远守护你"),
                    lang:get("还没找到另一半的朋友也抓紧啦")]);
rand_talk(female) ->
    util:rand_list([lang:get("小星星，亮晶晶，闪在你的眼睛里"),
                    lang:get("我愿意，好愿意，双手奉上我自己"),
                    lang:get("爱是我，爱是你，爱是肯定句"),
                    lang:get("感谢各位参加我们的典礼"),
                    lang:get("好紧张")]).

add_apply(Info = {RoleId,
                  Name,
                  Classes,
                  Sex,
                  Lev,
                  Face},
          #state{male_pid = MalePid, female_pid = FemalePid}) ->
    role:pack_send(MalePid,
                   15005,
                   {1, [{RoleId, Name, Classes, Sex, Lev, Face}]}),
    role:pack_send(FemalePid,
                   15005,
                   {1, [{RoleId, Name, Classes, Sex, Lev, Face}]}),
    ApplyList = get(apply_list),
    put(apply_list,
        lists:keystore(RoleId, 1, ApplyList, Info)),
    ok.

del_apply([]) -> ok;
del_apply([Id | T]) ->
    ApplyList = get(apply_list),
    NewApplyList = lists:keydelete(Id, 1, ApplyList),
    put(apply_list, NewApplyList),
    del_apply(T).

add_enter_list(RoleId) ->
    NewList = case get(enter_list) of
                  List when is_list(List) -> [RoleId | List];
                  _ -> [RoleId]
              end,
    put(enter_list, NewList).

del_enter_list(RoleId) ->
    NewList = case get(enter_list) of
                  List when is_list(List) -> List -- [RoleId];
                  _ -> []
              end,
    put(enter_list, NewList).

continue(StateName,
         State = #state{ts = Ts, timeout = Tidle}) ->
    update_state_ets(State),
    {next_state,
     StateName,
     State,
     util:time_left(Tidle, Ts)}.

continue(StateName, Reply,
         State = #state{ts = Ts, timeout = Tidle}) ->
    update_state_ets(State),
    {reply,
     Reply,
     StateName,
     State,
     util:time_left(Tidle, Ts)}.

