-file("src/mod/campaign/campaign_world_gift.erl", 1).

-module(campaign_world_gift).

-behaviour(gen_server).

-export([reload/0,
         reset/0,
         submit/2,
         get_info/0,
         check_pick/2,
         pick_gain/2,
         gm_create/0,
         world_mail/3]).

-export([info/1, cast/1, call/1, start_link/0]).

-export([init/1,
         handle_call/3,
         handle_cast/2,
         handle_info/2,
         terminate/2,
         code_change/3]).

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

-file("src/mod/campaign/campaign_world_gift.erl", 24).

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

-file("src/mod/campaign/campaign_world_gift.erl", 25).

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

-file("src/mod/campaign/campaign_world_gift.erl", 26).

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

-file("src/mod/campaign/campaign_world_gift.erl", 27).

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

-file("src/mod/campaign/campaign_world_gift.erl", 28).

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

-file("src/mod/campaign/campaign_world_gift.erl", 29).

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

-file("src/mod/campaign/campaign_world_gift.erl", 30).

-file("inc/lev_break.hrl", 1).

-record(m_lev_break,
        {ver = 0,
         trial = 0 :: non_neg_integer(),
         done = 0 :: non_neg_integer(),
         times = 0 :: non_neg_integer(),
         attr_point = 0 :: non_neg_integer()}).

-file("src/mod/campaign/campaign_world_gift.erl", 31).

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

-file("src/mod/campaign/campaign_world_gift.erl", 32).

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

-file("src/mod/campaign/campaign_world_gift.erl", 33).

-record(state,
        {ver = 1,
         start_time = 0,
         end_time = 0,
         val = 0,
         box_list = [],
         unit_base_id = 0}).

info(Info) -> campaign_world_gift ! Info.

cast(Info) ->
    gen_server:cast(campaign_world_gift, Info).

call(Info) ->
    case catch gen_server:call(campaign_world_gift,
                               Info,
                               10000)
        of
        {'EXIT', {timeout, _}} -> {error, timeout};
        {'EXIT', {noproc, _}} -> {error, noproc};
        {'EXIT', {normal, _}} -> {error, exit};
        {'EXIT', _Call_Err} -> {error, _Call_Err};
        _Call_Return -> _Call_Return
    end.

reload() -> info(reload).

reset() -> info(reset).

gm_create() -> info({create_box, 1}).

get_info() ->
    case env:get(campaign_world_gift) of
        #{start_time := StartTime, end_time := EndTime,
          val := Val} ->
            {StartTime, EndTime, Val};
        _ -> {0, 0, 0}
    end.

submit(Role = #role{id = RoleId, name = RoleName,
                    pid = RolePid, p_bag = Pbag},
       _Type) ->
    Now = date:unixtime(),
    case env:get(campaign_world_gift) of
        #{start_time := StartTime} when Now < StartTime ->
            {false, lang:get("活动尚未开始")};
        #{end_time := EndTime} when Now >= EndTime ->
            {false, lang:get("活动已经结束")};
        #{val := _Val} ->
            {Loss1, AddVal1, Gain1, {Exp1, PetExp1}} = case
                                                           package:count(by_base_id,
                                                                         71277,
                                                                         Pbag)
                                                           of
                                                           {_, Num1}
                                                               when Num1 > 0 ->
                                                               {[{71277, Num1}],
                                                                calc_val(1,
                                                                         Num1),
                                                                [{71281, Num1}],
                                                                calc_exp(Role,
                                                                         1,
                                                                         Num1)};
                                                           _ ->
                                                               {[],
                                                                0,
                                                                [],
                                                                {0, 0}}
                                                       end,
            {Loss2, AddVal2, Gain2, {Exp2, PetExp2}} = case
                                                           package:count(by_base_id,
                                                                         71278,
                                                                         Pbag)
                                                           of
                                                           {_, Num2}
                                                               when Num2 > 0 ->
                                                               {[{71278, Num2}],
                                                                calc_val(2,
                                                                         Num2),
                                                                [{71281, Num2}],
                                                                calc_exp(Role,
                                                                         2,
                                                                         Num2)};
                                                           _ ->
                                                               {[],
                                                                0,
                                                                [],
                                                                {0, 0}}
                                                       end,
            {Loss3, AddVal3, Gain3, {Exp3, PetExp3}} = case
                                                           package:count(by_base_id,
                                                                         71279,
                                                                         Pbag)
                                                           of
                                                           {_, Num3}
                                                               when Num3 > 0 ->
                                                               {[{71279, Num3}],
                                                                calc_val(3,
                                                                         Num3),
                                                                [{71282, Num3}],
                                                                calc_exp(Role,
                                                                         3,
                                                                         Num3)};
                                                           _ ->
                                                               {[],
                                                                0,
                                                                [],
                                                                {0, 0}}
                                                       end,
            {Loss4, AddVal4, Gain4, {Exp4, PetExp4}} = case
                                                           package:count(by_base_id,
                                                                         71280,
                                                                         Pbag)
                                                           of
                                                           {_, Num4}
                                                               when Num4 > 0 ->
                                                               {[{71280, Num4}],
                                                                calc_val(4,
                                                                         Num4),
                                                                [{71282, Num4}],
                                                                calc_exp(Role,
                                                                         4,
                                                                         Num4)};
                                                           _ ->
                                                               {[],
                                                                0,
                                                                [],
                                                                {0, 0}}
                                                       end,
            GetLoss = merge_gain(Loss1 ++ Loss2 ++ Loss3 ++ Loss4),
            Loss = format:val_to_loss(GetLoss),
            AddVal = AddVal1 + AddVal2 + AddVal3 + AddVal4,
            Exp = Exp1 + Exp2 + Exp3 + Exp4,
            ExpGain = case Exp > 0 of
                          true -> [{90010, Exp}];
                          _ -> []
                      end,
            PetExp = PetExp1 + PetExp2 + PetExp3 + PetExp4,
            PetExpGain = case PetExp > 0 of
                             true -> [{90005, PetExp}];
                             _ -> []
                         end,
            GetGain1 = merge_gain(Gain1 ++ Gain2 ++ Gain3 ++ Gain4),
            GetGain2 = ExpGain ++ PetExpGain,
            Gain = format:val_to_gain(GetGain1 ++ GetGain2),
            case role_gain:do(Loss, Role) of
                {ok, NewRole} ->
                    cast({submit, RoleId, RoleName, RolePid, AddVal}),
                    Msg = "",
                    TalkMsg =
                        notice:format(lang:get("感谢你使用~ts为我装扮，完成度已增加~ts，请收下我的礼物：~ts{face_1,3}{"
                                               "face_1,3}{face_1,3}"),
                                      [{item_2, GetLoss},
                                       {string_2, 1, AddVal},
                                       {item_2, GetGain1}]),
                    notice:npc_talk(Role, 76698, TalkMsg),
                    case role_gain:do_notice(Gain, NewRole) of
                        {ok, NewRole1} -> {ok, NewRole1, Msg};
                        {false, #gain{reason = bag_full}} ->
                            send_mail(NewRole, Gain1),
                            {ok, NewRole, Msg};
                        _ -> {ok, NewRole, Msg}
                    end;
                {false, _} -> {false, lang:get("道具不足，无法操作")}
            end;
        _ -> {false, lang:get("活动已经结束")}
    end;
submit(_, _) -> {false, lang:get("不支持的类型")}.

merge_gain(L) -> merge_gain(L, []).

merge_gain([], L) -> L;
merge_gain([{Id, Num1} | T], L) ->
    case lists:keyfind(Id, 1, L) of
        {_, Num2} ->
            merge_gain(T,
                       lists:keystore(Id, 1, L, {Id, Num1 + Num2}));
        _ -> merge_gain(T, lists:keystore(Id, 1, L, {Id, Num1}))
    end.

calc_exp(Role = #role{lev = Lev}, Type, Num) ->
    RoleExp = case levup_data:get_exp({3353, Lev}) of
                  #{exp := GetExp} when GetExp > 0 -> round(GetExp * Num);
                  _ -> 0
              end,
    PetExp = case pet:get_war_pet(Role) of
                 {ok, #pet{lev = PetLev}} ->
                     case levup_data:get_exp({3353, PetLev}) of
                         #{pet_exp := GetPetExp} when GetPetExp > 0 ->
                             round(GetPetExp * Num);
                         _ -> 0
                     end;
                 _ -> 0
             end,
    case Type of
        4 -> {round(RoleExp * 3), round(PetExp * 3)};
        _ -> {RoleExp, PetExp}
    end.

send_mail(Role, Gain) ->
    Title = lang:get("装饰雪人奖励"),
    Content = lang:get("提交装饰雪人道具时，背包已满"),
    mail:send(Role,
              #{title => Title, content => Content, items => Gain}).

calc_val(Type, Num) -> calc_val(Type, Num, 0).

calc_val(_, Num, Val) when Num =< 0 -> Val;
calc_val(4, Num, Val) -> calc_val(4, Num - 1, Val + 50);
calc_val(3, Num, Val) -> calc_val(3, Num - 1, Val + 50);
calc_val(2, Num, Val) -> calc_val(2, Num - 1, Val + 20);
calc_val(1, Num, Val) -> calc_val(1, Num - 1, Val + 20);
calc_val(Type, Num, Val) ->
    calc_val(Type, Num - 1, Val).

check_pick(#role{lev = Lev}, _) when Lev < 20 ->
    {false,
     notice:format(lang:get("等级~ts级以上才可以采集哦"),
                   [{string_2, 5, 20}])};
check_pick(Role, PickArgs = #{base_id := BaseId}) ->
    case var:get_var(Role, day, 91, 0) >= 1 of
        true ->
            {false, lang:get("今天已经领过新春红包，把祝福留给其他小伙伴吧{face_1,3}")};
        _ ->
            GainList = campaign_world_gift_data:get_gain(BaseId),
            GainList1 = check_role_cond(Role, GainList),
            case util:rand_list(GainList1, ratio) of
                #{base_id := GainBaseId, bind := Bind, num := Num,
                  is_cast := IsCast} ->
                    GainBaseId1 = item_type:special_id(GainBaseId),
                    {true,
                     PickArgs#{get_base_id => GainBaseId1, get_bind => Bind,
                               get_num => Num, is_cast => IsCast}};
                _ -> {false, lang:get("没有找到可以拾取的道具")}
            end
    end.

pick_gain(Role = #role{name = RoleName, pid = RolePid},
          #{uid := UnitId, get_base_id := GainBaseId,
            get_bind := Bind, get_num := Num, is_cast := IsCast}) ->
    Gain = format:val_to_gain([{GainBaseId, Bind, Num}]),
    OldVal = var:get_var(Role, day, 91, 0),
    info({pick_box, UnitId}),
    case role_gain:do_notice(Gain, Role) of
        {ok, Role1} ->
            cast_gain(RoleName, GainBaseId, Num, IsCast),
            Role2 = var:set_var(Role1, day, 91, OldVal + 1),
            notice:effect({role_pid, RolePid}, 30238),
            {ok, Role2};
        {false, #gain{reason = bag_full}} ->
            Title = lang:get("红包雨"),
            Content = lang:get("打开新春红包时，背包已满，奖励通过邮件发放给您，请查收"),
            Items = [{GainBaseId, Bind, Num}],
            mail:send(Role,
                      #{title => Title, content => Content, items => Items}),
            cast_gain(RoleName, GainBaseId, Num, IsCast),
            Role1 = var:set_var(Role, day, 91, OldVal + 1),
            notice:effect({role_pid, RolePid}, 30238),
            {ok, Role1};
        _ -> {ok, Role}
    end;
pick_gain(Role, _) -> {ok, Role}.

cast_gain(RoleName, BaseId, Num, 1) ->
    CastMsg = case util:rand(1, 2) of
                  1 ->
                      notice:format(lang:get("新年吉祥物瑞鼠宝宝听说~ts是个乖孩子，特意在TA的新春红包中塞了~ts{face_1,10}"),
                                    [{role_2, RoleName},
                                     {item_2, [{BaseId, Num}]}]);
                  _ ->
                      notice:format(lang:get("~ts兴匆匆打开新春红包时，在雪地上摔了个底朝天，~ts砸在了额头上{face_1,36}"),
                                    [{role_2, RoleName},
                                     {item_2, [{BaseId, Num}]}])
              end,
    notice:cast(all, 4, CastMsg);
cast_gain(_, _, _, _) -> ok.

world_mail(Title, Content, Items) ->
    lists:foreach(fun (#role_cache{id = RoleId}) ->
                          mail:send(RoleId,
                                    #{title => Title, content => Content,
                                      items => Items})
                  end,
                  role_query:all_cached_roles()),
    ok.

start_link() ->
    gen_server:start_link({local, campaign_world_gift},
                          campaign_world_gift,
                          [],
                          []).

init([]) ->
    logger:info("[~w] 正在启动...",
                [campaign_world_gift],
                campaign_world_gift,
                367),
    process_flag(trap_exit, true),
    {Flag, NewState} = load_state(),
    CreateState = case Flag of
                      start ->
                          Ref = erlang:send_after(date:next_diff(0, 0, 9) *
                                                      1000,
                                                  self(),
                                                  zero_check),
                          put(campaign_world_gift_zero_ref, Ref),
                          timer(NewState),
                          NewState;
                      _ -> NewState
                  end,
    logger:info("[~w] 启动完成",
                [campaign_world_gift],
                campaign_world_gift,
                382),
    {ok, CreateState}.

handle_call(_Request, _From, State) -> {noreply, State}.

handle_cast({submit,
             _RoleId,
             _RoleName,
             RolePid,
             AddVal},
            State = #state{val = Val, start_time = StartTime,
                           end_time = EndTime}) ->
    Now = date:unixtime(),
    case Now >= StartTime andalso Now =< EndTime of
        true ->
            NewVal = Val + AddVal,
            NewState = State#state{val = NewVal},
            role:pack_send(RolePid,
                           17819,
                           {StartTime, EndTime, NewVal}),
            save(NewState),
            NewState1 = create_npc(NewState),
            progress_check(Val, NewVal),
            {noreply, NewState1};
        false ->
            role:pack_send(RolePid,
                           17819,
                           {StartTime, EndTime, Val}),
            save(State),
            {noreply, State}
    end;
handle_cast(_Msg, State) ->
    logger:error("Msg:~w",
                 [_Msg],
                 campaign_world_gift,
                 406),
    {noreply, State}.

handle_info(close_box, State) ->
    case get(campaign_world_gift_create_box) of
        OldRef when is_reference(OldRef) ->
            erlang:cancel_timer(OldRef);
        _ -> ok
    end,
    State1 = clean_box(State),
    {noreply, State1};
handle_info({pick_box, UnitId},
            State = #state{box_list = BoxList}) ->
    BoxList1 = lists:delete(UnitId, BoxList),
    {noreply, State#state{box_list = BoxList1}};
handle_info({create_box, Time}, State) ->
    case get(campaign_world_gift_create_box) of
        OldRef when is_reference(OldRef) ->
            erlang:cancel_timer(OldRef);
        _ -> ok
    end,
    State1 = clean_box(State),
    NewState = case
                   campaign_world_gift_data:get_box({date(), Time})
                   of
                   #{ratio := Ratio, box_id := BoxId,
                     next_time := NextTime} ->
                       State3 = case create_map_box(State1, BoxId, Ratio, Time)
                                    of
                                    State2 = #state{} ->
                                        BoxName = unit:name(BoxId),
                                        CastMsg =
                                            notice:format(lang:get("瑞鼠宝宝带着吉祥与如意在圣心城上空盘旋，洒下了大量的~ts，快去领取吧{face_1,54}"),
                                                          [{string_2,
                                                            1,
                                                            BoxName}]),
                                        notice:cast(all, 11, CastMsg),
                                        notice:cast(all, 4, CastMsg),
                                        notice:effect(all, 30239),
                                        State2;
                                    _ -> State1
                                end,
                       Ref = erlang:send_after(NextTime * 1000,
                                               self(),
                                               {create_box, Time + 1}),
                       put(campaign_world_gift_create_box, Ref),
                       State3;
                   _ -> State1
               end,
    {noreply, NewState};
handle_info(zero_check,
            State = #state{start_time = StartTime,
                           end_time = EndTime}) ->
    logger:info("0点更新载入今日定时器",
                [],
                campaign_world_gift,
                465),
    case get(campaign_world_gift_zero_ref) of
        OldRef when is_reference(OldRef) ->
            erlang:cancel_timer(OldRef);
        _ -> ok
    end,
    Now = date:unixtime(),
    NewState = case Now >= StartTime andalso Now =< EndTime
                   of
                   true ->
                       timer(State),
                       create_npc(State);
                   _ ->
                       remove_npc(),
                       State
               end,
    Ref = erlang:send_after(date:next_diff(0, 0, 9) * 1000,
                            self(),
                            zero_check),
    put(campaign_world_gift_zero_ref, Ref),
    {noreply, NewState};
handle_info(auto_val,
            State = #state{val = Val, start_time = StartTime,
                           end_time = EndTime}) ->
    case get(campaign_world_gift_auto_ref) of
        OldRef1 when is_reference(OldRef1) ->
            erlang:cancel_timer(OldRef1);
        _ -> ok
    end,
    {Hour, _, _} = time(),
    NewState = case Hour =< 20 of
                   true ->
                       case campaign_world_gift_data:get_need_val(date()) of
                           #{need_val := NeedVal} when Val < NeedVal ->
                               LastHour = 20 - Hour,
                               LastVal = NeedVal - Val,
                               AddVal = case LastHour =:= 0 of
                                            true -> NeedVal - Val;
                                            _ ->
                                                max(1,
                                                    round(LastVal /
                                                              (LastHour + 1)))
                                        end,
                               NewVal = Val + AddVal,
                               State1 = State#state{val = NewVal},
                               role_group:pack_send(world,
                                                    17819,
                                                    {StartTime,
                                                     EndTime,
                                                     NewVal}),
                               save(State1),
                               State2 = create_npc(State1),
                               progress_check(Val, NewVal),
                               logger:info("全服礼盒自动增加[~w]点进度, 从[~w]到[~w]",
                                           [AddVal, Val, NewVal],
                                           campaign_world_gift,
                                           507),
                               State2;
                           _ -> State
                       end;
                   false -> State
               end,
    Now = date:unixtime(),
    AutoEndTime = date:unixtime(zero) + 20 * 3600 + 1,
    NextTime = date:unixtime(zero) + (Hour + 1) * 3600,
    case NextTime < AutoEndTime of
        true ->
            AutoTimeDiff = (NextTime - Now) * 1000,
            logger:info("全服礼盒活动下次补货时间[~w]",
                        [AutoTimeDiff],
                        campaign_world_gift,
                        523),
            AutoRef = erlang:send_after(AutoTimeDiff,
                                        self(),
                                        auto_val),
            put(campaign_world_gift_auto_ref, AutoRef),
            ok;
        _ -> ok
    end,
    {noreply, NewState};
handle_info(reload, _State) ->
    case get(campaign_world_gift_zero_ref) of
        OldRef when is_reference(OldRef) ->
            erlang:cancel_timer(OldRef);
        _ -> ok
    end,
    {Flag, NewState} = load_state(),
    ReloadState = case Flag of
                      start ->
                          Ref = erlang:send_after(date:next_diff(0, 0, 9) *
                                                      1000,
                                                  self(),
                                                  zero_check),
                          put(campaign_world_gift_zero_ref, Ref),
                          NewState1 = create_npc(NewState),
                          timer(NewState1),
                          NewState1;
                      _ ->
                          remove_npc(),
                          NewState
                  end,
    {StartTime, EndTime, Val} =
        campaign_world_gift:get_info(),
    role_group:pack_send(world,
                         17819,
                         {StartTime, EndTime, Val}),
    {noreply, ReloadState};
handle_info(reset, _State) ->
    case get(campaign_world_gift_zero_ref) of
        OldRef when is_reference(OldRef) ->
            erlang:cancel_timer(OldRef);
        _ -> ok
    end,
    env:save(campaign_world_gift, undefined),
    {Flag, NewState} = load_state(),
    ReloadState = case Flag of
                      start ->
                          Ref = erlang:send_after(date:next_diff(0, 0, 9) *
                                                      1000,
                                                  self(),
                                                  zero_check),
                          put(campaign_world_gift_zero_ref, Ref),
                          NewState1 = create_npc(NewState),
                          timer(NewState1),
                          NewState1;
                      _ -> NewState
                  end,
    {StartTime, EndTime, Val} =
        campaign_world_gift:get_info(),
    role_group:pack_send(world,
                         17819,
                         {StartTime, EndTime, Val}),
    {noreply, ReloadState};
handle_info({'EXIT', _Pid, normal}, State) ->
    {noreply, State};
handle_info(Info, State) ->
    logger:error("[~w]收到错误的消息:[~w]",
                 [campaign_world_gift, Info],
                 campaign_world_gift,
                 579),
    {noreply, State}.

terminate(_Reason, _State) ->
    logger:info("开始关闭", [], campaign_world_gift, 583),
    logger:info("关闭完成", [], campaign_world_gift, 584),
    ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

progress_check(OldVal, NewVal) ->
    OldStep = case campaign_world_gift_data:get_val(OldVal)
                  of
                  #{step := Step1} -> Step1;
                  _ -> 0
              end,
    NewStep = case campaign_world_gift_data:get_val(NewVal)
                  of
                  #{step := Step2} -> Step2;
                  _ -> 0
              end,
    case OldStep =/= NewStep andalso
             OldStep =/= 0 andalso NewStep =/= 0
        of
        true ->
            Title = lang:get("萌萌雪人活动"),
            StepStr = case NewStep of
                          2 -> lang:get("30%");
                          3 -> lang:get("60%");
                          _ -> lang:get("100%")
                      end,
            DataStr = case NewStep of
                          2 -> lang:get("12月25日21:00");
                          3 -> lang:get("12月26日21:00");
                          _ -> lang:get("12月27日21:00")
                      end,
            Content =
                notice:format(lang:get("~ts活动如火如荼，目前雪人完成度达到~ts，在线玩家获得以下奖励。圣诞老人为了表彰各位乖"
                                       "孩子，将于~ts光临~ts并洒下~ts{face_1,38}"),
                              [{string_2, 1, lang:get("萌萌雪人")},
                               {string_2, 1, StepStr},
                               {string_2, 1, DataStr},
                               {string_2, 1, lang:get("圣心城")},
                               {string_2, 1, lang:get("圣诞礼物")}]),
            Items = [{71328, 0, 1}],
            world_mail(Title, Content, Items),
            ok;
        _ -> ok
    end.

create_npc(State = #state{val = Val,
                          unit_base_id = NowUnitBaseId}) ->
    case campaign_world_gift_data:get_val(Val) of
        #{unit_base_id := NowUnitBaseId} -> State;
        #{unit_base_id := UnitBaseId} ->
            UnitId = {46, 1},
            case unit_mgr:info(UnitId) of
                {ok, Unit = #unit{}} ->
                    unit_mgr:sync_remove(Unit),
                    unit_mgr:create({46, 1},
                                    UnitBaseId,
                                    {10001, 2888, 2230}),
                    logger:info("堆雪人活动[~w]创建NPC:~w",
                                [Val, UnitBaseId],
                                campaign_world_gift,
                                638),
                    State#state{unit_base_id = UnitBaseId};
                _ ->
                    unit_mgr:create({46, 1},
                                    UnitBaseId,
                                    {10001, 2888, 2230}),
                    logger:info("堆雪人活动[~w]创建NPC:~w",
                                [Val, UnitBaseId],
                                campaign_world_gift,
                                642),
                    State#state{unit_base_id = UnitBaseId}
            end;
        _ -> State
    end.

remove_npc() ->
    UnitId = {46, 1},
    case unit_mgr:info(UnitId) of
        {ok, Unit = #unit{}} -> unit_mgr:sync_remove(Unit);
        _ -> ok
    end.

clean_box(State = #state{box_list = BoxList}) ->
    [unit_mgr:remove(UnitId) || UnitId <- BoxList],
    State#state{box_list = []}.

create_map_box(State = #state{val = _Val}, BoxId, Ratio,
               Time) ->
    OnlineNum = ets:info(role_cache, size),
    Num = max(1, round(OnlineNum * Ratio / 1000)),
    logger:info("刷新第[~w]轮[~w]个雪人宝箱",
                [Time, Num],
                campaign_world_gift,
                667),
    case unit_mgr:fetch_ids(Num) of
        {ok, Ids} ->
            BoxList = do_create_box(Ids, Num, BoxId, []),
            State#state{box_list = BoxList};
        _ -> State
    end.

do_create_box([], _Num, _BoxId, BoxList) -> BoxList;
do_create_box(_, Num, _BoxId, BoxList) when Num =< 0 ->
    BoxList;
do_create_box([Id | T], Num, BoxId, BoxList) ->
    case map:rand_pos(10001) of
        {X, Y} ->
            case unit_mgr:create({46, Id}, BoxId, {10001, X, Y}) of
                {ok, #unit{id = UnitId}} ->
                    do_create_box(T, Num - 1, BoxId, [UnitId | BoxList]);
                _ -> do_create_box(T, Num - 1, BoxId, BoxList)
            end;
        _ -> do_create_box(T, Num - 1, BoxId, BoxList)
    end.

clear_timer() ->
    case get(campaign_world_gift_auto_ref) of
        OldRef1 when is_reference(OldRef1) ->
            erlang:cancel_timer(OldRef1);
        _ -> ok
    end,
    case get(campaign_world_gift_create_box) of
        OldRef2 when is_reference(OldRef2) ->
            erlang:cancel_timer(OldRef2);
        _ -> ok
    end,
    ok.

timer(#state{start_time = StartTime,
             end_time = EndTime}) ->
    Now = date:unixtime(),
    clear_timer(),
    case Now >= StartTime andalso Now =< EndTime of
        true ->
            AutoStartTime = date:unixtime(zero) + 15 * 3600,
            AutoEndTime = date:unixtime(zero) + 20 * 3600 + 1,
            case Now < AutoStartTime of
                true ->
                    AutoTimeDiff = (AutoStartTime - Now) * 1000,
                    logger:info("全服礼盒活动下次补货时间[~w]",
                                [AutoTimeDiff],
                                campaign_world_gift,
                                716),
                    AutoRef = erlang:send_after(AutoTimeDiff,
                                                self(),
                                                auto_val),
                    put(campaign_world_gift_auto_ref, AutoRef),
                    ok;
                false ->
                    case Now >= AutoStartTime andalso Now < AutoEndTime of
                        true ->
                            {Hour, _, _} = time(),
                            NextTime = date:unixtime(zero) + (Hour + 1) * 3600,
                            case NextTime < AutoEndTime of
                                true ->
                                    AutoTimeDiff = (NextTime - Now) * 1000,
                                    logger:info("全服礼盒活动下次补货时间[~w]",
                                                [AutoTimeDiff],
                                                campaign_world_gift,
                                                730),
                                    AutoRef = erlang:send_after(AutoTimeDiff,
                                                                self(),
                                                                auto_val),
                                    put(campaign_world_gift_auto_ref, AutoRef),
                                    ok;
                                _ -> ok
                            end;
                        _ -> ok
                    end
            end;
        _ -> ok
    end,
    BoxTime = date:unixtime(zero) + 21 * 3600,
    case Now < BoxTime of
        true ->
            case campaign_world_gift_data:get_box({date(), 1}) of
                #{} ->
                    BoxTimeDiff = (BoxTime - Now) * 1000,
                    logger:info("今日礼盒开启时间[~w]",
                                [BoxTimeDiff],
                                campaign_world_gift,
                                751),
                    BoxRef = erlang:send_after(BoxTimeDiff,
                                               self(),
                                               {create_box, 1}),
                    put(campaign_world_gift_create_box, BoxRef),
                    ok;
                _ -> ok
            end;
        _ -> ok
    end,
    ok.

save(#state{ver = Ver, start_time = StartTime,
            end_time = EndTime, val = Val}) ->
    env:save(campaign_world_gift,
             #{ver => Ver, val => Val, start_time => StartTime,
               end_time => EndTime}),
    ok;
save(undefined) ->
    env:save(campaign_world_gift, undefined),
    ok;
save(_) -> ok.

load_state() ->
    Now = date:unixtime(),
    StartTime = date:datetime_to_seconds({2020,
                                          1,
                                          23,
                                          0,
                                          0,
                                          0}),
    EndTime = date:datetime_to_seconds({2020,
                                        2,
                                        1,
                                        23,
                                        59,
                                        59}),
    clear_timer(),
    case Now >= EndTime of
        true ->
            save(undefined),
            {over, #state{}};
        _ ->
            case Now < StartTime of
                true ->
                    State = #state{ver = 1, start_time = StartTime,
                                   end_time = EndTime, val = 0},
                    save(State),
                    {start, State};
                false ->
                    OldVal = case env:get(campaign_world_gift) of
                                 #{ver := 1, val := Val} -> Val;
                                 _ -> 0
                             end,
                    State = #state{ver = 1, start_time = StartTime,
                                   end_time = EndTime, val = OldVal},
                    save(State),
                    {start, State}
            end
    end.

check_role_cond(#role{sex = Sex, lev = Lev,
                      classes = Classes,
                      m_lev_break = #m_lev_break{times = BreakTimes}},
                List) ->
    check_role_cond(#{lev => Lev, sex => Sex,
                      classes => Classes, break_times => BreakTimes},
                    List,
                    []).

check_role_cond(_Args, [], List) -> List;
check_role_cond(Args = #{sex := Sex, lev := Lev,
                         classes := Classes, break_times := BreakTimes},
                [H = #{sex := Sex1, lev_low := LevLow,
                       lev_high := LevHigh, classes := Classes1,
                       break_times_min := MinBreakTimes,
                       break_times_max := MaxBreakTimes}
                 | T],
                List)
    when (Sex1 =:= Sex orelse Sex1 =:= 2) andalso
             (Classes1 =:= Classes orelse Classes1 =:= 0) andalso
                 (BreakTimes >= MinBreakTimes andalso
                      BreakTimes =< MaxBreakTimes)
                     andalso
                     (LevLow =:= 0 andalso LevHigh =:= 0 orelse
                          LevLow =:= 0 andalso Lev =< LevHigh orelse
                              Lev >= LevLow andalso LevHigh =:= 0 orelse
                                  Lev >= LevLow andalso Lev =< LevHigh) ->
    check_role_cond(Args, T, [H | List]);
check_role_cond(Args, [_ | T], List) ->
    check_role_cond(Args, T, List).

