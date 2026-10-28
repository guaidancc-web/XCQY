-file("src/mod/examination/examination.erl", 1).

-module(examination).

-behaviour(gen_fsm).

-export([start_link/0,
         init/0,
         join/1,
         quit/1,
         login/1,
         logout/1,
         enter/1,
         answer/2,
         info/1,
         push/2,
         apply_role/2,
         apply_guild/2,
         ask_help/2,
         apply_for_help/2,
         assist/2,
         help_answer/2,
         role_callback/2]).

-export([idle/2, notice/2, active/2]).

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

-file("src/mod/examination/examination.erl", 34).

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

-file("src/mod/examination/examination.erl", 35).

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

-file("src/mod/examination/examination.erl", 36).

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

-file("src/mod/examination/examination.erl", 37).

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

-file("src/mod/examination/examination.erl", 38).

-file("inc/link.hrl", 1).

-record(link,
        {socket :: undefined | port(),
         conn_pid :: undefined | pid(),
         ip = {0, 0, 0, 0} :: {0..255, 0..255, 0..255, 0..255},
         port = 0 :: non_neg_integer(),
         lag = 0 :: non_neg_integer()}).

-file("src/mod/examination/examination.erl", 39).

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

-file("src/mod/examination/examination.erl", 40).

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

-file("src/mod/examination/examination.erl", 41).

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

-file("src/mod/examination/examination.erl", 42).

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

-file("src/mod/examination/examination.erl", 43).

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

-file("src/mod/examination/examination.erl", 44).

-file("inc/mail.hrl", 1).

-record(mail,
        {sess ::
             undefined |
             {pos_integer(), bitstring(), non_neg_integer()},
         to ::
             undefined |
             {pos_integer(), bitstring(), non_neg_integer()},
         from ::
             undefined |
             {non_neg_integer(), bitstring(), non_neg_integer()},
         from_face = 0 :: non_neg_integer(),
         from_name = "" :: bitstring(),
         to_face = 0 :: non_neg_integer(),
         to_name = "" :: bitstring(),
         type = 0 :: 0..1,
         status = 0 :: 0..1,
         del_type = 0 :: 0..1,
         title = "" :: bitstring(),
         content = "" :: bitstring(),
         item_list = [] :: [tuple()],
         source = 0 :: pos_integer(),
         rev_ts = 0 :: pos_integer(),
         ts = 0 :: pos_integer(),
         read_ts = 0 :: non_neg_integer()}).

-file("src/mod/examination/examination.erl", 45).

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

-file("src/mod/examination/examination.erl", 46).

-file("inc/examination.hrl", 1).

-record(m_examination,
        {ver = 1,
         question = 0 :: non_neg_integer(),
         started = 0 :: non_neg_integer(),
         expire = 0 :: non_neg_integer(),
         subject = 0 :: non_neg_integer(),
         next_subject = 0 :: non_neg_integer(),
         next_subjects = [],
         finish_ids = [],
         right_num = 0 :: non_neg_integer(),
         answered = 0 :: non_neg_integer(),
         successive_right = 0 :: non_neg_integer(),
         questions = [] :: list(),
         dynamics = [] :: list()}).

-record(examination_testee,
        {id = {0, "", 0},
         name = "" :: string(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         score = 0 :: non_neg_integer(),
         elapsed = 0 :: non_neg_integer(),
         pid :: undefined | pid(),
         coin = 0 :: non_neg_integer(),
         exp = 0 :: non_neg_integer(),
         pet_exp = 0 :: non_neg_integer()}).

-record(examination_role,
        {ver = 0,
         id = {0, "", 0},
         name = "" :: string(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         score = 0 :: non_neg_integer(),
         elapsed = 0 :: non_neg_integer(),
         rank = 0 :: non_neg_integer(),
         certified = 0 :: 0 | 1,
         results = []}).

-record(examination_question,
        {id = 0 :: non_neg_integer(),
         type = 0 :: non_neg_integer(),
         desc = "" :: string(),
         answer = 0 :: non_neg_integer(),
         options = [] :: list()}).

-record(examination_taker,
        {ver = 0,
         id = {0, "", 0},
         name = "" :: string(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         score = 0 :: non_neg_integer(),
         last_answered = 0 :: non_neg_integer(),
         double_used = 0 :: non_neg_integer(),
         eased = 0 :: non_neg_integer(),
         peeked = 0 :: non_neg_integer(),
         coin = 0 :: non_neg_integer(),
         exp = 0 :: non_neg_integer(),
         pet_exp = 0 :: non_neg_integer(),
         right_num = 0 :: non_neg_integer(),
         answered = 0 :: non_neg_integer()}).

-record(examination_answer,
        {id = {0, "", 0},
         name = "" :: string(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         choice = 0 :: 0..4,
         result = 0 :: 0 | 1,
         time = 0 :: non_neg_integer()}).

-file("src/mod/examination/examination.erl", 47).

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

-file("src/mod/examination/examination.erl", 48).

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

-file("src/mod/examination/examination.erl", 49).

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

-file("src/mod/examination/examination.erl", 50).

-file("inc/help.hrl", 1).

-record(m_help,
        {ver = 1,
         next_id = 1,
         free_ids = [],
         send_msg = [],
         recv_msg = [],
         ext = []}).

-record(help_state,
        {next_record_id = 1, free_record_ids = []}).

-record(help_msg,
        {id = 0,
         help_rid,
         help_id = 0,
         record_id = 0,
         time = 0,
         digit_array = [],
         str_array = [],
         ext = []}).

-record(help_record, {record_id = 0, rid}).

-record(help_data,
        {id = 0 :: pos_integer(),
         title = "",
         fun_type = 0,
         type = 0,
         help_args :: undefined | term()}).

-file("src/mod/examination/examination.erl", 51).

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

-file("src/mod/examination/examination.erl", 52).

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

-file("src/mod/examination/examination.erl", 53).

-record(state,
        {ts = 0 :: tuple(),
         timeout = 0 :: non_neg_integer(),
         type = 1,
         units = [],
         questions = [],
         maps = [],
         day_ref :: undefined | reference(),
         bottom_rank_score = 0 :: non_neg_integer()}).

init() -> #m_examination{}.

join(Role = #role{s_event = OldEvent,
                  cross_type = CrossType}) ->
    Day = day_of_the_week(),
    Type = get_type(Day),
    case check_join(Role, Type) of
        {new, Mexam1 = #m_examination{dynamics = Dynamics}} ->
            Testee = to(examination_testee, Role),
            case gen_fsm:sync_send_all_state_event(examination,
                                                   {join, Testee})
                of
                {ok, 1, Expire} ->
                    DIds = [Did
                            || #examination_question{id = Did} <- Dynamics],
                    DNum = length(DIds),
                    Questions0 = college_random_question(DNum),
                    Questions = DIds ++ Questions0,
                    QId = get_question(Questions0, Day, []),
                    Now = date:unixtime(),
                    NewMexam = Mexam1#m_examination{question = QId,
                                                    finish_ids = [QId],
                                                    started = Now,
                                                    expire = Expire + Now,
                                                    subject = Day,
                                                    questions = Questions},
                    NewRole = Role#role{m_examination = NewMexam},
                    push(NewRole, 14503),
                    {ok, NewRole};
                {ok, 2, _Expire} when CrossType == 1 ->
                    {false, lang:get("跨服状态不能参与智慧闯关-半决赛")};
                {ok, 2, Expire} ->
                    [One, Two | Orders] = random_subjects(),
                    Now = date:unixtime(),
                    NewMexam = Mexam1#m_examination{question = 0,
                                                    subject = One,
                                                    started = Now,
                                                    expire = Now + Expire,
                                                    next_subject = Two,
                                                    next_subjects = Orders,
                                                    answered = 0},
                    NewRole = Role#role{m_examination = NewMexam,
                                        s_event = 7},
                    map:role_update(NewRole),
                    push(NewRole, 14503),
                    Msg = notice:format(lang:get("报名成功，前往~ts闯关"),
                                        [{string_2, 1, lang:get("一号考官")}]),
                    {ok, Msg, NewRole};
                {false, Time} ->
                    Msg = notice:format(lang:get("距离下次活动开始还有~ts"),
                                        [{string_2, 1, format_time(Time)}]),
                    {false, Msg};
                _Else ->
                    logger:debug("未知返回 ~w", [_Else], examination, 213),
                    {false, lang:get("不能报名")}
            end;
        {ok,
         Mexam1 = #m_examination{question = 0,
                                 subject = Subject}} ->
            Testee = to(examination_testee, Role),
            case gen_fsm:sync_send_all_state_event(examination,
                                                   {rejoin, Testee})
                of
                {ok, Expire} ->
                    Now = date:unixtime(),
                    {NewMexam, Msg} = case OldEvent =:= 7 of
                                          true -> {gen_question(Mexam1), ""};
                                          _ ->
                                              Mexam2 =
                                                  Mexam1#m_examination{started =
                                                                           Now,
                                                                       expire =
                                                                           Expire
                                                                               +
                                                                               Now},
                                              Msg0 =
                                                  notice:format(lang:get("你已再次报名成功，请前往~ts闯关答题"),
                                                                [{unit_1,
                                                                  get_examiner_id(Subject)}]),
                                              {Mexam2, Msg0}
                                      end,
                    Event = case Type of
                                2 -> 7;
                                _ -> OldEvent
                            end,
                    NewRole = Role#role{m_examination = NewMexam,
                                        s_event = Event},
                    map:role_update(NewRole),
                    push(NewRole, 14503),
                    {ok, Msg, NewRole};
                {false, Time} ->
                    Msg = notice:format(lang:get("距离下次活动开始还有~ts"),
                                        [{string_2, 1, format_time(Time)}]),
                    {false, Msg};
                Else -> Else
            end;
        {ok, Mexam1 = #m_examination{}} ->
            Testee = to(examination_testee, Role),
            case gen_fsm:sync_send_all_state_event(examination,
                                                   {rejoin, Testee})
                of
                {ok, _Expire} ->
                    NewMexam = Mexam1,
                    Event = case Type of
                                2 -> 7;
                                _ -> OldEvent
                            end,
                    NewRole = Role#role{m_examination = NewMexam,
                                        s_event = Event},
                    map:role_update(NewRole),
                    push(NewRole, 14503),
                    {ok, NewRole};
                {false, Time} ->
                    Msg = notice:format(lang:get("距离下次活动开始还有~ts"),
                                        [{string_2, 1, format_time(Time)}]),
                    {false, Msg};
                Else -> Else
            end;
        Else -> Else
    end.

quit(Role = #role{s_event = 7, id = Id,
                  m_examination =
                      Mexam = #m_examination{started = Started,
                                             question = QId}}) ->
    Elapsed = case QId of
                  0 -> 0;
                  _ -> date:unixtime() - Started
              end,
    examination ! {quit, Id, Elapsed},
    NewRole = Role#role{s_event = 0,
                        m_examination =
                            Mexam#m_examination{started = Started - 30,
                                                question = 0}},
    map:role_update(NewRole),
    {ok, NewRole};
quit(Role = #role{s_event = 8, id = Id}) ->
    examination ! {quit, Id, 0},
    NewRole = Role#role{s_event = 0},
    map:role_update(NewRole),
    {ok, NewRole};
quit(Role) ->
    map:role_update(Role),
    {false, lang:get("你还没参与智慧闯关")}.

enter(#role{s_event = Event})
    when Event =/= 0 andalso Event =/= 2 ->
    {false, lang:get("当前状态不能参与")};
enter(Role = #role{id = Id, name = Name,
                   pos =
                       #pos{map = MapId, x = X, y = Y, platform = OldPlatform,
                            zone_id = OldZoneId}}) ->
    case ets:lookup(examination_role, Id) of
        [#examination_role{certified = 1}] ->
            case gen_fsm:sync_send_all_state_event(examination,
                                                   get_entry)
                of
                {ok, {NewMapId, _MapPid}} ->
                    case examination_data:get_examiner(7) of
                        #{location := [_, {_, MapBaseId, _, _} | _]} ->
                            case map_data:get(MapBaseId) of
                                {ok, #map_data{revive = [{NewX, NewY} | _]}} ->
                                    case map:role_enter({NewMapId, NewX, NewY},
                                                        Role)
                                        of
                                        {error, Reason} ->
                                            logger:error("[~s]进入地图失败:~w",
                                                         [Name, Reason],
                                                         examination,
                                                         312),
                                            {false, lang:get("进入地图失败")};
                                        {ok, NewRole = #role{pos = Pos}} ->
                                            Last = #pos_history{map = MapId,
                                                                x = X, y = Y,
                                                                platform =
                                                                    OldPlatform,
                                                                zone_id =
                                                                    OldZoneId},
                                            {ok,
                                             NewRole#role{pos =
                                                              Pos#pos{last =
                                                                          Last}}}
                                    end;
                                _ -> {false, lang:get("进不去")}
                            end;
                        _ -> {false, lang:get("找不到地图")}
                    end;
                {false, Time} ->
                    Msg = notice:format(lang:get("距离下次活动开始还有~ts"),
                                        [{string_2, 1, format_time(Time)}]),
                    {false, Msg};
                _Else ->
                    logger:debug("未知返回 ~w", [_Else], examination, 328),
                    {false, lang:get("活动还没开始")}
            end;
        _ -> {false, lang:get("你没获得智慧闯关决赛资格哦")}
    end.

login(Role = #role{s_event = 7}) ->
    Testee = to(examination_testee, Role),
    case gen_fsm:sync_send_all_state_event(examination,
                                           {login, Testee})
        of
        {ok, 2} -> ok;
        _ ->
            NewRole = Role#role{s_event = 0},
            {ok, NewRole}
    end;
login(Role = #role{s_event = 8}) ->
    NewRole = Role#role{s_event = 0},
    {ok, NewRole};
login(Role) -> {ok, Role}.

logout(#role{s_event = 7, id = Id}) ->
    examination ! {logout, Id},
    ok;
logout(#role{s_event = 8, id = Id}) ->
    examination ! {logout, Id},
    ok;
logout(_Role) -> ok.

answer(#role{m_examination =
                 #m_examination{question = 0}},
       _Option) ->
    {false, lang:get("你还没参与智慧闯关")};
answer(Role = #role{m_examination =
                        Mexam = #m_examination{question = QId, expire = Expire,
                                               started = Started,
                                               answered = Answered,
                                               right_num = Right,
                                               successive_right = Successive,
                                               dynamics = Dynamics},
                    s_event = Event, name = RoleName, m_guild = MGuild},
       Option) ->
    Day = day_of_the_week(),
    Type = get_type(Day),
    case check_distance(Role, old, Type) of
        ok ->
            Now = date:unixtime(),
            Elapsed0 = Now - Started,
            Answer = case lists:keyfind(QId,
                                        #examination_question.id,
                                        Dynamics)
                         of
                         DQ = #examination_question{answer = 0} ->
                             dynamic_notice(DQ, Option, Role),
                             Option;
                         #examination_question{answer = Asr} -> Asr;
                         _ -> question_data:get_answer(QId)
                     end,
            IsRight = case Answer of
                          Option when Expire > Now -> 1;
                          _ -> 2
                      end,
            {NewRight, NewSuccessive} = case IsRight of
                                            1 -> {Right + 1, Successive + 1};
                                            _ -> {Right, 0}
                                        end,
            NewAnswered = Answered + 1,
            IsOver = case Type of
                         2 when NewAnswered >= 30 -> true;
                         1 when NewAnswered >= 10 -> true;
                         _ -> false
                     end,
            {Score, Elapsed} = case Type of
                                   2 when IsRight =:= 1 ->
                                       Extra = case NewSuccessive rem 10 of
                                                   0 -> 6;
                                                   _ -> 0
                                               end,
                                       {6 * 2 + Extra, Elapsed0};
                                   2 -> {6, Elapsed0};
                                   1 when IsRight =:= 1 -> {6 * 2, Elapsed0};
                                   1 -> {3 * 2, Elapsed0};
                                   _ when IsRight =:= 1 -> {1, Elapsed0};
                                   _ -> {0, Elapsed0}
                               end,
            Testee = statistic(Role, IsRight, Type),
            Score1 = case IsOver of
                         true when Type =:= 2 ->
                             Score + calc_elapsed_addition(Elapsed);
                         _ -> Score
                     end,
            case gen_fsm:sync_send_all_state_event(examination,
                                                   {answer,
                                                    Testee#examination_testee{score
                                                                                  =
                                                                                  Score1,
                                                                              elapsed
                                                                                  =
                                                                                  Elapsed},
                                                    Day})
                of
                {ok, NewExpire} ->
                    Mexam1 = #m_examination{} =
                                 gen_question(Mexam#m_examination{answered =
                                                                      NewAnswered}),
                    NewMexam = case Type of
                                   2
                                       when IsRight =:= 1 andalso
                                                NewSuccessive rem 10 =:= 10 ->
                                       Mexam1#m_examination{started = Started,
                                                            right_num =
                                                                NewRight,
                                                            successive_right =
                                                                NewSuccessive};
                                   2 when IsRight =:= 1 ->
                                       Mexam1#m_examination{right_num =
                                                                NewRight,
                                                            successive_right =
                                                                NewSuccessive};
                                   2 ->
                                       Mexam1#m_examination{started = Started,
                                                            right_num =
                                                                NewRight,
                                                            successive_right =
                                                                NewSuccessive};
                                   _ ->
                                       Mexam1#m_examination{started = Now,
                                                            expire =
                                                                NewExpire + Now,
                                                            right_num =
                                                                NewRight,
                                                            successive_right =
                                                                NewSuccessive}
                               end,
                    Role1 = reward(Role#role{m_examination = NewMexam},
                                   IsRight,
                                   Type),
                    NewRole = case IsOver of
                                  true when Event =:= 7 ->
                                      Role2 = Role1#role{s_event = 0},
                                      map:role_update(Role2),
                                      Role2;
                                  _ -> Role1
                              end,
                    notice_statistic(NewRole, IsOver, Type),
                    Msg = case Type of
                              2 when IsRight =:= 2 ->
                                  notice:format(lang:get("你答错了，获得~ts分"),
                                                [{string_2, 1, 6}]);
                              2 ->
                                  notice:format(lang:get("恭喜答对，获得~ts分"),
                                                [{string_2, 1, 6 * 2}]);
                              1 when IsRight =:= 1 ->
                                  notice:format(lang:get("恭喜答对，获得~ts分"),
                                                [{string_2, 1, 6 * 2}]);
                              1 ->
                                  notice:format(lang:get("你答错了，获得~ts分"),
                                                [{string_2, 1, 3 * 2}]);
                              _ when IsRight =:= 1 -> lang:get("恭喜答对");
                              _ -> lang:get("你答错了")
                          end,
                    case IsOver =:= true andalso NewRight >= NewAnswered of
                        true ->
                            notice:cast(all,
                                        5,
                                        lang:get("~ts在~ts中一口气答对了所有问题，真是令人敬佩{face_1,38}"),
                                        [{role_2, RoleName},
                                         {string_2, 1, get_type_name()}]);
                        _ -> ok
                    end,
                    case Type =:= 2 andalso
                             NewSuccessive rem 10 =:= 0 andalso IsRight =:= 1
                        of
                        true ->
                            ExtMsg =
                                notice:format(lang:get("恭喜你连续答对~ts题，分数额外~ts分"),
                                              [{string_2, 5, 10},
                                               {string_2, 1, lang:get("+6")}]),
                            notice:send(Role, 3, ExtMsg);
                        _ -> ok
                    end,
                    FireRole = case IsOver of
                                   true ->
                                       role_trigger:fire([#evt_examination{type
                                                                               =
                                                                               Type},
                                                          #evt_examination_answer{is_right
                                                                                      =
                                                                                      IsRight}],
                                                         NewRole);
                                   _ ->
                                       role_trigger:fire(#evt_examination_answer{is_right
                                                                                     =
                                                                                     IsRight},
                                                         NewRole)
                               end,
                    DayRole1 = case var:get_var(FireRole, day, 82) > 0 of
                                   true ->
                                       case MGuild of
                                           #m_guild{pid = GuildPid} ->
                                               case IsRight of
                                                   1 ->
                                                       guild:notice(GuildPid,
                                                                    notice:format(lang:get("~ts听从大家的建议选择了~ts答案，回答正确{face_1,38}"),
                                                                                  [{role_2,
                                                                                    RoleName},
                                                                                   {string_2,
                                                                                    5,
                                                                                    option_name(Option)}]));
                                                   _ ->
                                                       guild:notice(GuildPid,
                                                                    notice:format(lang:get("~ts听从大家的建议选择了~ts答案，居然错误了{face_1,19}"),
                                                                                  [{role_2,
                                                                                    RoleName},
                                                                                   {string_2,
                                                                                    5,
                                                                                    option_name(Option)}]))
                                               end;
                                           _ -> ignore
                                       end,
                                       var:acc_var(FireRole, day, 78);
                                   _ -> FireRole
                               end,
                    HelpRole1 = case help:del_help_info_by_id(DayRole1, 22)
                                    of
                                    {ok, HelpRole} -> HelpRole;
                                    _ -> DayRole1
                                end,
                    TimesRole = var:set_var(HelpRole1, day, 82, 0),
                    {ok, IsRight, Answer, Msg, NewSuccessive, TimesRole};
                over ->
                    NewMexam = Mexam#m_examination{question = 0},
                    {ok, Role#role{m_examination = NewMexam}}
            end;
        Else -> Else
    end.

push(#role{link = #link{conn_pid = ConnPid}},
     Cmd = 14500) ->
    Data = info(status),
    sys_conn:pack_send(ConnPid, Cmd, Data);
push(Role = #role{link = #link{conn_pid = ConnPid},
                  m_examination = Mexam, id = Id},
     Cmd = 14503) ->
    {Limit, AskMax} = case get_type() of
                          2 -> {30, 3};
                          _ -> {10, 2}
                      end,
    {Score, Elapsed, Exp, PetExp, Coin} = case
                                              ets:lookup(examination_testee, Id)
                                              of
                                              [#examination_testee{score =
                                                                       Score0,
                                                                   elapsed =
                                                                       Elapsed0,
                                                                   exp = Exp0,
                                                                   pet_exp =
                                                                       PetExp0,
                                                                   coin =
                                                                       Coin0}] ->
                                                  {Score0,
                                                   Elapsed0,
                                                   Exp0,
                                                   PetExp0,
                                                   Coin0};
                                              _ -> {0, 0, 0, 0, 0}
                                          end,
    {ScoreAll, ElapsedAll} = case
                                 ets:lookup(examination_role, Id)
                                 of
                                 [#examination_role{score = ScoreAll0,
                                                    elapsed = ElapsedAll0}] ->
                                     {ScoreAll0, ElapsedAll0};
                                 _ -> {0, 0}
                             end,
    CanAsk = max(0, AskMax - var:get_var(Role, day, 78, 0)),
    sys_conn:pack_send(ConnPid,
                       Cmd,
                       {Mexam,
                        Limit,
                        Elapsed,
                        Score,
                        Exp,
                        PetExp,
                        Coin,
                        ScoreAll,
                        ElapsedAll,
                        CanAsk});
push(#role{link = #link{conn_pid = ConnPid}, id = Id},
     Cmd = 14507) ->
    BottomScore = info(bottom_rank_score),
    Examinee = case ets:lookup(examination_role, Id) of
                   [ER = #examination_role{}] -> ER;
                   _ -> #examination_role{}
               end,
    Testee = case ets:lookup(examination_testee, Id) of
                 [ET = #examination_testee{}] -> ET;
                 _ -> #examination_testee{}
             end,
    sys_conn:pack_send(ConnPid,
                       Cmd,
                       {BottomScore, Testee, Examinee});
push(Role = #role{link = #link{conn_pid = ConnPid}},
     Cmd = 14508) ->
    CanJoin = case check_push(Role, get_type()) of
                  {false, _} -> 0;
                  _ -> 1
              end,
    sys_conn:pack_send(ConnPid, Cmd, {CanJoin}).

push(#role{link = #link{conn_pid = ConnPid}},
     Cmd = 14505, Data) ->
    sys_conn:pack_send(ConnPid, Cmd, Data).

info(status) ->
    gen_fsm:sync_send_all_state_event(examination,
                                      info_status);
info(bottom_rank_score) ->
    gen_fsm:sync_send_all_state_event(examination,
                                      info_bottom_rank).

apply_role(Role = #role{s_event = 7}, quit) ->
    {ok, Role#role{s_event = 0}};
apply_role(Role = #role{s_event = 8}, quit) ->
    {ok, Role#role{s_event = 0}};
apply_role(_Role, quit) -> ok;
apply_role(Role = #role{}, leave) ->
    case map:role_enter(util:rand_list([{10001, 306, 3507},
                                        {10001, 2583, 3848},
                                        {10001, 4957, 3680},
                                        {10001, 445, 2565},
                                        {10001, 4646, 704},
                                        {10001, 841, 1033},
                                        {10001, 2098, 1834},
                                        {10001, 3617, 1816}]),
                        Role#role{s_event = 0})
        of
        {error, Reason} ->
            logger:error("退出活动地进入主城时出错:~w",
                         [Reason],
                         examination,
                         579),
            ok;
        {ok, Nr} -> {ok, Nr}
    end;
apply_role(_Role, _Else) ->
    logger:debug("未知回调 ~w", [_Else], examination, 584),
    ok.

apply_guild(#guild{leader_name = LName,
                   members = Members},
            get_leader) ->
    L1 = [Name
          || #guild_role{name = Name}
                 <- lists:sublist(Members, 4),
             Name =/= LName],
    {ok, [LName | lists:sublist(L1, 3)]};
apply_guild(#guild{members = Members},
            get_vice_leader) ->
    case lists:keyfind(50, #guild_role.post, Members) of
        #guild_role{name = LName} ->
            L1 = [Name
                  || #guild_role{name = Name, post = Post}
                         <- lists:sublist(Members, 6),
                     Name =/= LName andalso Post =/= 50],
            {ok, [LName | lists:sublist(L1, 3)]};
        _ -> {ok, false}
    end;
apply_guild(#guild{members = Members},
            {get_isomerism, Sex}) ->
    case [{IsmName, Online}
          || #guild_role{name = IsmName, status = Online,
                         sex = ISex}
                 <- Members,
             ISex =/= Sex]
        of
        [H | T] ->
            L2 = case [Name || {Name, 1} <- [H | T]] of
                     L1 when length(L1) >= 4 -> util:rand_list_n(L1, 4);
                     [OH | OT] ->
                         Num = length([OH | OT]),
                         util:rand_list_n([OH | OT], Num) ++
                             util:rand_list_n([Off || {Off, 0} <- [H | T]],
                                              4 - Num);
                     _ ->
                         util:rand_list_n([RName || {RName, _} <- [H | T]], 4)
                 end,
            {ok, L2};
        _ -> {ok, false}
    end;
apply_guild(#guild{members = Members}, get_baby) ->
    case [BName
          || #guild_role{name = BName, post = 25} <- Members]
        of
        [H | T] ->
            LName = util:rand_list([H | T]),
            L1 = [Name
                  || #guild_role{name = Name, post = Post}
                         <- lists:sublist(Members, 15),
                     Post =/= 25],
            {ok, [LName | util:rand_list_n(L1, 3)]};
        _ -> {ok, false}
    end;
apply_guild(_, _) -> {ok, false}.

start_link() ->
    gen_fsm:start_link({local, examination},
                       examination,
                       [],
                       []).

init([]) ->
    logger:info("开始启动...", [], examination, 634),
    Type = get_type(),
    Day = day_of_the_week(),
    dets:open_file(examination_role,
                   [{file, "./dets/examination_role.dets"},
                    {keypos, #examination_role.id}]),
    ets:new(examination_role,
            [set,
             named_table,
             public,
             {keypos, #examination_role.id}]),
    dets:to_ets(examination_role, examination_role),
    ets:new(examination_testee,
            [set,
             named_table,
             public,
             {keypos, #examination_testee.id}]),
    dets:open_file(examination_rank,
                   [{file, "./dets/examination_rank.dets"},
                    {keypos, #examination_role.id}]),
    ets:new(examination_rank,
            [set,
             named_table,
             public,
             {keypos, #examination_role.id}]),
    dets:to_ets(examination_rank, examination_rank),
    case env:get(examination_state) of
        #state{type = OldType = 2}
            when Type =/= OldType andalso
                     (Day =/= 7 orelse Day =/= 6) ->
            ets:delete_all_objects(examination_role),
            dets:delete_all_objects(examination_role),
            ets:delete_all_objects(examination_rank),
            dets:delete_all_objects(examination_rank);
        _ -> ok
    end,
    {StateName, Timeout} = get_state(),
    Units = create_units(),
    DayTimeout = date:next_diff(0, 0, 6),
    logger:debug("下次更新npc时间 ~w",
                 [DayTimeout],
                 examination,
                 656),
    Ref = erlang:send_after(DayTimeout * 1000,
                            self(),
                            reset),
    State0 = #state{ts = now(), timeout = Timeout,
                    type = Type, units = Units, day_ref = Ref},
    State = case StateName of
                active -> init_active(State0);
                _ -> State0
            end,
    logger:info("启动完成 state_name: ~w, timeout: ~w, type: ~w",
                [StateName, Timeout, Type],
                examination,
                669),
    {ok, StateName, State, Timeout}.

handle_event({question_match_result, MatchResult},
             StateName, State) ->
    logger:debug("智力闯关同步智慧对决：~w",
                 [MatchResult],
                 examination,
                 673),
    Day = day_of_the_week(),
    Fun = fun (Er = #examination_role{id = Id,
                                      score = TodayScore}) ->
                  case ets:lookup(examination_role, Id) of
                      [R = #examination_role{score = Score,
                                             results = Results}] ->
                          save(R#examination_role{score = Score + TodayScore,
                                                  results =
                                                      lists:keystore(Day,
                                                                     1,
                                                                     Results,
                                                                     {Day,
                                                                      TodayScore,
                                                                      0})});
                      _ ->
                          save(Er#examination_role{score = TodayScore,
                                                   results =
                                                       [{Day, TodayScore, 0}]})
                  end
          end,
    lists:map(Fun, MatchResult),
    continue(StateName, State);
handle_event(_Event, StateName, State) ->
    logger:debug("未知消息 ~w", [_Event], examination, 688),
    continue(StateName, State).

handle_sync_event(info_status, _From, StateName,
                  State = #state{ts = Ts, timeout = Timeout,
                                 type = Type}) ->
    St = case StateName of
             notice -> 1;
             active -> 2;
             _ -> 0
         end,
    Rest = util:time_left(Timeout, Ts),
    Reply = {St, Type, Rest div 1000},
    continue(Reply, StateName, State);
handle_sync_event(info_bottom_rank, _From, StateName,
                  State = #state{bottom_rank_score = Score}) ->
    Reply = Score,
    continue(Reply, StateName, State);
handle_sync_event(get_entry, _From, StateName,
                  State = #state{maps = Maps, timeout = Timeout,
                                 ts = Ts}) ->
    Reply = case Maps of
                [One | _] -> {ok, One};
                _ ->
                    Expire0 = util:time_left(Timeout, Ts) div 1000,
                    {false, Expire0}
            end,
    continue(Reply, StateName, State);
handle_sync_event({login,
                   Testee = #examination_testee{id = Id, pid = Pid}},
                  _From, active, State = #state{type = Type}) ->
    case ets:lookup(examination_testee, Id) of
        [O = #examination_testee{}] ->
            ets:insert(examination_testee,
                       O#examination_testee{pid = Pid});
        _ -> ets:insert(examination_testee, Testee)
    end,
    Reply = {ok, Type},
    continue(Reply, active, State);
handle_sync_event({login, _}, _From, StateName,
                  State) ->
    Reply = false,
    continue(Reply, StateName, State);
handle_sync_event({join,
                   Testee = #examination_testee{id = Id, pid = Pid}},
                  _From, active,
                  State = #state{timeout = Timeout, ts = Ts, type = Type,
                                 questions = Questions}) ->
    case ets:lookup(examination_testee, Id) of
        [OldTestee = #examination_testee{}] ->
            ets:insert(examination_testee,
                       OldTestee#examination_testee{pid = Pid});
        _ -> ets:insert(examination_testee, Testee)
    end,
    Expire0 = util:time_left(Timeout, Ts) div 1000,
    Reply = case Type of
                1 -> {ok, Type, Expire0};
                2 -> {ok, Type, Expire0};
                _ -> {ok, Type, min(Expire0, 22), Questions}
            end,
    continue(Reply, active, State);
handle_sync_event({join, _}, _From, StateName,
                  State = #state{timeout = Timeout, ts = Ts}) ->
    Expire0 = util:time_left(Timeout, Ts) div 1000,
    Reply = {false, Expire0},
    continue(Reply, StateName, State);
handle_sync_event({rejoin,
                   Testee = #examination_testee{id = Id, pid = Pid}},
                  _From, active,
                  State = #state{timeout = Timeout, ts = Ts,
                                 type = Type}) ->
    case ets:lookup(examination_testee, Id) of
        [OldTestee = #examination_testee{}] ->
            ets:insert(examination_testee,
                       OldTestee#examination_testee{pid = Pid});
        _ -> ets:insert(examination_testee, Testee)
    end,
    Expire0 = util:time_left(Timeout, Ts) div 1000,
    Expire = case Type of _ -> Expire0 end,
    Reply = {ok, Expire},
    continue(Reply, active, State);
handle_sync_event({rejoin, _}, _From, StateName,
                  State = #state{timeout = Timeout, ts = Ts}) ->
    Expire0 = util:time_left(Timeout, Ts) div 1000,
    Reply = {false, Expire0},
    continue(Reply, StateName, State);
handle_sync_event({answer,
                   Testee = #examination_testee{id = Id, score = Score,
                                                elapsed = Elapsed,
                                                coin = AddCoin, exp = AddExp,
                                                pet_exp = AddPetExp},
                   Day},
                  _From, active,
                  State = #state{timeout = Timeout, ts = Ts,
                                 type = Type}) ->
    case ets:lookup(examination_testee, Id) of
        [OldTestee = #examination_testee{coin = Coin, exp = Exp,
                                         score = CurScore, pet_exp = CurPetExp}]
            when Type =:= 2 ->
            acc_result(Testee, OldTestee, Day),
            ets:insert(examination_testee,
                       OldTestee#examination_testee{elapsed = Elapsed,
                                                    coin = Coin + AddCoin,
                                                    exp = Exp + AddExp,
                                                    score = CurScore + Score,
                                                    pet_exp =
                                                        CurPetExp + AddPetExp});
        [OldTestee = #examination_testee{score = CurScore,
                                         elapsed = CurElapsed, coin = Coin,
                                         exp = Exp, pet_exp = CurPetExp}] ->
            acc_result(Testee, OldTestee, Day),
            ets:insert(examination_testee,
                       OldTestee#examination_testee{score = CurScore + Score,
                                                    elapsed =
                                                        CurElapsed + Elapsed,
                                                    coin = Coin + AddCoin,
                                                    exp = Exp + AddExp,
                                                    pet_exp =
                                                        CurPetExp + AddPetExp});
        _ ->
            acc_result(Testee, Testee, Day),
            ets:insert(examination_testee, Testee)
    end,
    Expire0 = util:time_left(Timeout, Ts) div 1000,
    Expire = case Type of _ -> Expire0 end,
    Reply = {ok, Expire},
    continue(Reply, active, State);
handle_sync_event({answer, _, _day}, _From, StateName,
                  State) ->
    Reply = over,
    continue(Reply, StateName, State);
handle_sync_event(_Event, _From, StateName, State) ->
    logger:debug("未知消息 ~w", [_Event], examination, 797),
    Reply = false,
    continue(Reply, StateName, State).

handle_info({quit, Id, Elapsed}, active,
            State = #state{type = Type}) ->
    ets:update_element(examination_testee,
                       Id,
                       {#examination_testee.pid, 0}),
    case Type of
        2 ->
            ets:update_counter(examination_testee,
                               Id,
                               {#examination_testee.elapsed, 30 + Elapsed});
        _ -> ok
    end,
    continue(active, State);
handle_info({quit, _Id, _Elapsed}, StateName, State) ->
    continue(StateName, State);
handle_info({logout, Id}, active, State) ->
    ets:update_element(examination_testee,
                       Id,
                       {#examination_testee.pid, 0}),
    continue(active, State);
handle_info({logout, _Id}, StateName, State) ->
    continue(StateName, State);
handle_info(reset, StateName,
            State = #state{units = OldUnits, day_ref = OldRef}) ->
    case erlang:is_reference(OldRef) of
        true -> erlang:cancel_timer(OldRef);
        _ -> ok
    end,
    unit_mgr:remove(OldUnits),
    Units = create_units(),
    Timeout = date:next_diff(0, 0, 6),
    logger:debug("下次更新npc时间 ~w",
                 [Timeout],
                 examination,
                 830),
    Ref = erlang:send_after(Timeout * 1000, self(), reset),
    continue(StateName,
             State#state{units = Units, day_ref = Ref});
handle_info(_Info, StateName, State) ->
    logger:debug("未知消息 ~w", [_Info], examination, 834),
    continue(StateName, State).

terminate(_Reason, _StateName, _State) ->
    lists:foreach(fun (#examination_testee{pid = Pid}) ->
                          role:apply(async,
                                     Pid,
                                     {examination, apply_role, [quit]})
                  end,
                  ets:tab2list(examination_testee)),
    ok.

code_change(_OldVsn, StateName, State, _Extra) ->
    {ok, StateName, State}.

idle(timeout, State) ->
    Day = day_of_the_week(),
    Type = get_type(Day),
    State1 = State#state{ts = now(), timeout = 600 * 1000,
                         type = Type, bottom_rank_score = 0},
    case Day of
        1 ->
            ets:delete_all_objects(examination_role),
            dets:delete_all_objects(examination_role);
        _ -> ok
    end,
    ets:delete_all_objects(examination_testee),
    Msg =
        notice:format(lang:get("~ts活动10分钟后将开启，运用你们的知识，准备去答题啦"),
                      [{string_2, 1, lang:get("智慧闯关")}]),
    notice:cast(all, 8, Msg, []),
    role_group:pack_send(world, 14500, {1, Type, 600}),
    continue(notice, State1);
idle(_, State) -> continue(idle, State).

notice(timeout, State = #state{type = Type}) ->
    Timeout = case Type of
                  2 -> 18000;
                  _ -> date:next_diff(23, 59, 55)
              end,
    State1 = State#state{ts = now(),
                         timeout = Timeout * 1000},
    State2 = init_active(State1),
    Msg =
        notice:format(lang:get("~ts活动开始啦，开动你的大脑，用智慧赢取奖励吧！"),
                      [{string_2, 1, lang:get("智慧闯关")}]),
    notice:cast(all, 8, Msg, []),
    role_group:pack_send(world, 14500, {2, Type, Timeout}),
    continue(active, State2);
notice(_, State) -> continue(notice, State).

active(timeout,
       State = #state{type = Type, maps = Maps}) ->
    Now = date:unixtime(),
    Day = get_init_day(Now, 1),
    {_, Tt} =
        agenda:get_state_timeout(day_to_agenda_id(Day), 600),
    Timeout = Tt * 1000,
    lists:foreach(fun (#examination_testee{pid = Pid}) ->
                          role:apply(async,
                                     Pid,
                                     {examination, apply_role, [quit]})
                  end,
                  ets:tab2list(examination_testee)),
    stop_maps(Maps),
    BottomScore = update_rank(Type, day_of_the_week()),
    NewState = State#state{ts = now(), timeout = Timeout,
                           maps = [], bottom_rank_score = BottomScore},
    env:save(examination_state,
             NewState#state{day_ref = 0}),
    role_group:pack_send(world, 14500, {0, Type, Timeout}),
    Msg = case Type of
              2 ->
                  notice:format(lang:get("~ts到此结束了，晋级决赛的资格线是~ts分，感谢大家积极参与"),
                                [{string_2, 1, get_type_name()},
                                 {string_2, 1, BottomScore}]);
              _ ->
                  notice:format(lang:get("~ts到此结束了，感谢大家积极参与"),
                                [{string_2, 1, get_type_name()}])
          end,
    notice:cast(all, 8, Msg, []),
    logger:debug("下次开始时间 ~w", [Timeout], examination, 919),
    continue(idle, NewState);
active(_, State) -> continue(active, State).

get_state() ->
    Now = date:unixtime(),
    Day = get_init_day(Now, 1),
    logger:debug("星期 ~w会开始", [Day], examination, 932),
    {StateName, Timeout} = case
                               agenda:get_state_timeout(day_to_agenda_id(Day),
                                                        600)
                               of
                               {idle, Tt} -> {idle, Tt};
                               {notice, _} -> {notice, 600};
                               {active, Tt} -> {active, Tt}
                           end,
    {StateName, Timeout * 1000}.

continue(StateName,
         State = #state{timeout = infinity}) ->
    {next_state, StateName, State, infinity};
continue(StateName,
         State = #state{ts = Ts, timeout = Timeout}) ->
    {next_state,
     StateName,
     State,
     util:time_left(Timeout, Ts)}.

continue(Reply, StateName,
         State = #state{timeout = infinity}) ->
    {reply, Reply, StateName, State, infinity};
continue(Reply, StateName,
         State = #state{ts = Ts, timeout = Timeout}) ->
    {reply,
     Reply,
     StateName,
     State,
     util:time_left(Timeout, Ts)}.

get_type() -> get_type(day_of_the_week()).

get_type(Day) ->
    case Day of
        6 -> 2;
        _ -> 1
    end.

get_type_name() ->
    case day_of_the_week() of
        6 -> lang:get("智慧闯关-半决赛");
        _ -> lang:get("智慧闯关")
    end.

to(examination_testee,
   #role{id = Id, name = Name, sex = Sex,
         classes = Classes, pid = Pid, lev = Lev}) ->
    #examination_testee{id = Id, name = Name, sex = Sex,
                        classes = Classes, pid = Pid, lev = Lev};
to(examination_role,
   #role{id = Id, name = Name, sex = Sex,
         classes = Classes, lev = Lev}) ->
    #examination_role{id = Id, name = Name, sex = Sex,
                      classes = Classes, lev = Lev};
to(examination_role,
   #examination_testee{id = Id, name = Name, sex = Sex,
                       classes = Classes, lev = Lev}) ->
    #examination_role{id = Id, name = Name, sex = Sex,
                      classes = Classes, lev = Lev}.

get_question(Questions, D, Ids) ->
    case Questions of
        [] ->
            util:rand_list(question_data:list_subject(D) -- Ids);
        _ -> util:rand_list(Questions -- Ids)
    end.

create_units() ->
    D = day_of_the_week(),
    case examination_data:get_examiner(D) of
        #{location := Location} -> create_units(Location, D);
        _Else ->
            logger:error("找不到配置 ~w", [D], examination, 990),
            ok
    end.

create_units([], _) -> [];
create_units([{BaseId, Map, X, Y} | _], 7) ->
    {ok, #unit{id = UId}} = unit_mgr:create({12, BaseId},
                                            BaseId,
                                            {Map, X, Y}),
    [UId];
create_units([{BaseId, Map, X, Y} | T], D) ->
    {ok, #unit{id = UId}} = unit_mgr:create({12, BaseId},
                                            BaseId,
                                            {Map, X, Y}),
    [UId | create_units(T, D)].

acc_result(#examination_testee{id = Id,
                               score = AddScore, elapsed = Elapsed},
           Testee = #examination_testee{score = TodayScore,
                                        elapsed = TodayElapsed},
           Day) ->
    case ets:lookup(examination_role, Id) of
        [R = #examination_role{score = Score,
                               results = Results}] ->
            save(R#examination_role{score = Score + AddScore,
                                    results =
                                        lists:keystore(Day,
                                                       1,
                                                       Results,
                                                       {Day,
                                                        TodayScore + AddScore,
                                                        TodayElapsed +
                                                            Elapsed})});
        _ ->
            R = to(examination_role, Testee),
            save(R#examination_role{score = AddScore,
                                    results =
                                        [{Day,
                                          TodayScore + AddScore,
                                          TodayElapsed + Elapsed}]})
    end.

save(R = #examination_role{}) ->
    ets:insert(examination_role, R),
    dets:insert(examination_role, R).

random_subjects() -> lists:seq(1, 10).

check_join(#role{lev = Lev}, _) when Lev < 30 ->
    {false,
     notice:format(lang:get("角色等级~ts级才能参与"),
                   [{string_2, 1, 30}])};
check_join(#role{s_event = Event}, _)
    when Event =/= 0 andalso
             Event =/= 2 andalso Event =/= 7 andalso Event =/= 8 ->
    {false, lang:get("当前状态不能参与")};
check_join(#role{m_team = #m_team{pid = Pid}}, 2)
    when is_pid(Pid) ->
    {false, lang:get("请不要在队伍中参与半决赛")};
check_join(Role = #role{id = Id,
                        m_examination =
                            Mexam = #m_examination{answered = Answered}},
           Type) ->
    case ets:lookup(examination_testee, Id) of
        [#examination_testee{}]
            when Type =:= 2 andalso Answered >= 30 ->
            {false, lang:get("您已经参加过今日的答题，无法再次答题")};
        [#examination_testee{}]
            when Type =:= 1 andalso Answered >= 10 ->
            {false, lang:get("您已经参加过今日的答题，无法再次答题")};
        [#examination_testee{}] ->
            case check_distance(Role, old, Type) of
                ok -> {ok, Mexam};
                Else -> Else
            end;
        _ ->
            case check_distance(Role, new, Type) of
                ok when Type =:= 1 ->
                    Dynamics = gen_dynamic(Role),
                    {new, #m_examination{dynamics = Dynamics}};
                ok -> {new, #m_examination{}};
                Else -> Else
            end
    end.

check_push(#role{lev = Lev}, _) when Lev < 30 ->
    {false,
     notice:format(lang:get("角色等级~ts级才能参与"),
                   [{string_2, 1, 30}])};
check_push(#role{s_event = Event}, _)
    when Event =/= 0 andalso
             Event =/= 2 andalso Event =/= 7 andalso Event =/= 8 ->
    {false, lang:get("当前状态不能参与")};
check_push(#role{id = Id,
                 m_examination = #m_examination{answered = Answered}},
           Type) ->
    case ets:lookup(examination_testee, Id) of
        [#examination_testee{}]
            when Type =:= 2 andalso Answered >= 30 ->
            {false, lang:get("您已经参加过今日的答题，无法再次答题")};
        [#examination_testee{}]
            when Type =:= 1 andalso Answered >= 10 ->
            {false, lang:get("您已经参加过今日的答题，无法再次答题")};
        [#examination_testee{}] -> ok;
        _ -> ok
    end.

day_of_the_week() ->
    date:day_of_the_week(date:unixtime()).

init_active(State = #state{type = Type}) ->
    Maps = create_maps(Type),
    Questions = case Type of _ -> [] end,
    State#state{questions = Questions, maps = Maps}.

random_question([], _) -> [];
random_question(_, Num) when Num < 1 -> [];
random_question(L, Num) ->
    One = util:rand_list(L),
    [One | random_question(L -- [One], Num - 1)].

college_random_question(DNum) ->
    Today = day_of_the_week(),
    L = lists:seq(1, 5),
    L1 = L -- [Today],
    L2 = do_college_random_question([{Today,
                                      max(1, 8 - DNum)}
                                     | [{D, 3} || D <- L1]]),
    lists:flatten(L2).

do_college_random_question([]) -> [];
do_college_random_question([{Day, Num} | T]) ->
    [random_question(question_data:list_subject(Day), Num)
     | do_college_random_question(T)].

gen_question(Mexam = #m_examination{question = QId,
                                    questions = Questions, subject = Subject,
                                    next_subject = NextSubject,
                                    next_subjects = Nexts,
                                    answered = NewAnswered,
                                    finish_ids = Ids}) ->
    case get_type() of
        2 when NewAnswered >= 30 ->
            Mexam#m_examination{question = 0};
        1 when NewAnswered >= 10 ->
            Mexam#m_examination{question = 0};
        2
            when QId =/= 0 andalso
                     NewAnswered rem 3 =:= 0 andalso NextSubject =/= 0 ->
            {NewNext, Rest} = case Nexts of
                                  [One | Other] -> {One, Other};
                                  _ -> {0, []}
                              end,
            Mexam#m_examination{question = 0, subject = NextSubject,
                                next_subject = NewNext, next_subjects = Rest};
        2 ->
            NewQId = get_question(question_data:list(),
                                  Subject,
                                  Ids),
            NewIds = [NewQId | Ids],
            Mexam#m_examination{question = NewQId,
                                finish_ids = NewIds};
        _ ->
            Questions1 = case [Did || Did <- Questions, Did =< 3] --
                                  Ids
                             of
                             [H | T] when NewAnswered =:= 10 - 1 -> [H | T];
                             [H | T] when NewAnswered =:= 7 ->
                                 case util:rand(1, 10) =< 6 of
                                     true -> [H | T];
                                     _ -> [Sid || Sid <- Questions, Sid > 3]
                                 end;
                             _ -> [Sid || Sid <- Questions, Sid > 3]
                         end,
            NewQId = get_question(Questions1, Subject, Ids),
            NewIds = [NewQId | Ids],
            Mexam#m_examination{question = NewQId,
                                finish_ids = NewIds}
    end.

statistic(Role, IsRight, Type) ->
    PetExp = case pet:get_war_pet(Role) of
                 {ok, #pet{lev = PetLev}} ->
                     case examination_data:get_reward({PetLev, Type}) of
                         #{right_pet_exp := PExp} when IsRight =:= 1 -> PExp;
                         #{wrong_pet_exp := PExp} -> PExp;
                         _ -> 0
                     end;
                 _ -> 0
             end,
    Testee = #examination_testee{coin = Coin, exp = Exp,
                                 pet_exp = OldPetExp, lev = Lev} =
                 to(examination_testee, Role),
    case examination_data:get_reward({Lev, Type}) of
        #{right_exp := AddExp, right_coin := AddCoin}
            when IsRight =:= 1 ->
            Testee#examination_testee{coin = Coin + AddCoin,
                                      exp = Exp + AddExp,
                                      pet_exp = OldPetExp + PetExp};
        #{wrong_exp := AddExp, wrong_coin := AddCoin} ->
            Testee#examination_testee{coin = Coin + AddCoin,
                                      exp = Exp + AddExp,
                                      pet_exp = OldPetExp + PetExp};
        _ -> Testee
    end.

notice_statistic(Role = #role{m_examination =
                                  #m_examination{right_num = Right,
                                                 answered = Answered,
                                                 question = 0},
                              id = Id},
                 _IsOver, Type) ->
    case ets:lookup(examination_testee, Id) of
        [Testee = #examination_testee{pet_exp = PetExp,
                                      exp = Exp, score = Score}] ->
            Msg = case PetExp > 0 of
                      true ->
                          Fmt =
                              lang:get("恭喜您在~ts中答对了~ts题，总计获得了~ts、~ts奖励，总分~ts"),
                          notice:format(Fmt,
                                        [{string_2, 1, get_type_name()},
                                         {string_2, 1, Right},
                                         {assets_1, 90010, Exp},
                                         {assets_1, 90005, PetExp},
                                         {string_2, 1, Score}]);
                      _ ->
                          Fmt = lang:get("恭喜您在~ts中答对了~ts题，总计获得了~ts奖励，总分~ts"),
                          notice:format(Fmt,
                                        [{string_2, 1, get_type_name()},
                                         {string_2, 1, Right},
                                         {assets_1, 90010, Exp},
                                         {string_2, 1, Score}])
                  end,
            Limit = case Type of
                        2 -> 30;
                        _ -> 10
                    end,
            push(Role, 14505, {Testee, Right, Answered, Limit}),
            notice:send(Role, 3, Msg);
        _ -> ok
    end;
notice_statistic(_, _IsOver, _Type) -> ok.

reward(Role = #role{lev = Lev, name = Name}, 1, Type) ->
    case examination_data:get_reward({Lev, Type}) of
        #{right_exp := Exp, right_coin := Coin} ->
            Gain1 = [{90010, Exp}, {90000, Coin}],
            ItemCfg =
                util:rand_list(examination_data:reward_item(Type),
                               item_weight),
            Gain2 = case ItemCfg of
                        #{item_id := ItemId, item_num := ItemNum}
                            when ItemId > 0 andalso ItemNum > 0 ->
                            [{ItemId, 0, ItemNum} | Gain1];
                        _Item ->
                            logger:debug("物品 ~w", [_Item], examination, 1194),
                            Gain1
                    end,
            Gain3 = case pet:get_war_pet(Role) of
                        {ok, #pet{lev = PetLev}} ->
                            case examination_data:get_reward({PetLev, Type}) of
                                #{right_pet_exp := PExp} ->
                                    [{90005, PExp} | Gain2];
                                _ -> Gain2
                            end;
                        _ -> Gain2
                    end,
            Gain = format:val_to_gain(Gain3),
            case role_gain:do_notice(Gain, Role) of
                {ok, Role1} ->
                    announce_item(Name, ItemCfg),
                    Role1;
                _ -> Role
            end;
        _ -> Role
    end;
reward(Role = #role{lev = Lev}, _, Type) ->
    logger:debug("错了", [], examination, 1216),
    case examination_data:get_reward({Lev, Type}) of
        #{wrong_exp := Exp, wrong_coin := Coin} ->
            Gain1 = [{90010, Exp}, {90000, Coin}],
            Gain2 = case pet:get_war_pet(Role) of
                        {ok, #pet{lev = PetLev}} ->
                            case examination_data:get_reward({PetLev, Type}) of
                                #{wrong_pet_exp := PExp} ->
                                    [{90005, PExp} | Gain1];
                                _ -> Gain1
                            end;
                        _ -> Gain1
                    end,
            Gain = format:val_to_gain([One
                                       || One = {_, V} <- Gain2, V > 0]),
            case role_gain:do_notice(Gain, Role) of
                {ok, Role1} -> Role1;
                _ -> Role
            end;
        _ -> Role
    end.

check_distance(_, _, 1) -> ok;
check_distance(#role{name = _Name,
                     pos = #pos{map = MapId, x = X, y = Y},
                     m_examination = #m_examination{subject = Subject},
                     s_event = 7},
               old, 2) ->
    case examination_data:get_examiner(6) of
        #{location := [_Loc1 | L]} ->
            case lists:nth(Subject, L) of
                {_UnitId, MapId, DestX, DestY}
                    when abs(X - DestX) < 500 andalso Y - DestY < 500 ->
                    ok;
                {UnitId, _MapId, _DestX, _DestY} ->
                    {false,
                     notice:format(lang:get("请去~ts处答题"),
                                   [{unit_1, UnitId}])};
                _Ret -> {false, lang:get("距离太远")}
            end;
        _Ret -> {false, lang:get("距离太远")}
    end;
check_distance(#role{name = _Name,
                     pos = #pos{map = MapId, x = X, y = Y}},
               _, 2) ->
    case examination_data:get_examiner(6) of
        #{location := [{UnitId, MapId, DestX, DestY} | _]} ->
            case abs(X - DestX) < 500 andalso Y - DestY < 500 of
                true -> ok;
                _ ->
                    {false,
                     notice:format(lang:get("请去~ts处报名"), [{unit_1, UnitId}])}
            end;
        _Ret -> {false, lang:get("距离太远")}
    end;
check_distance(#role{name = _Name,
                     pos = #pos{map = MapId, x = X, y = Y},
                     m_examination = #m_examination{subject = Subject}},
               old, _) ->
    case examination_data:get_examiner(Subject) of
        #{location := [{UnitId, MapId, DestX, DestY} | _]} ->
            case abs(X - DestX) < 500 andalso Y - DestY < 500 of
                true -> ok;
                _ ->
                    {false,
                     notice:format(lang:get("请去~ts处答题"), [{unit_1, UnitId}])}
            end;
        _Ret -> {false, lang:get("距离太远")}
    end;
check_distance(#role{name = _Name,
                     pos = #pos{map = MapId, x = X, y = Y}},
               new, _) ->
    Day = day_of_the_week(),
    case examination_data:get_examiner(Day) of
        #{location := [{UnitId, MapId, DestX, DestY} | _]} ->
            case abs(X - DestX) < 500 andalso Y - DestY < 500 of
                true -> ok;
                _ ->
                    {false,
                     notice:format(lang:get("请去~ts处报名"), [{unit_1, UnitId}])}
            end;
        _Ret -> {false, lang:get("距离太远")}
    end;
check_distance(_, _Way, _Type) ->
    logger:error("未知位置 ~w, ~w",
                 [_Way, _Type],
                 examination,
                 1279),
    {false, lang:get("未知位置")}.

update_rank(2, Day) ->
    L1 = ets:tab2list(examination_role),
    Total = ets:info(examination_role, size),
    Certification = max(100,
                        round(Total * 5.99999999999999977796e-1)),
    Fun = fun (#examination_role{elapsed = ElapsedA,
                                 score = ScoreA},
               #examination_role{elapsed = ElapsedB,
                                 score = ScoreB}) ->
                  if ScoreA > ScoreB -> true;
                     ScoreA =:= ScoreB andalso ElapsedA < ElapsedB -> true;
                     true -> false
                  end
          end,
    L2 = lists:sort(Fun, L1),
    to_out_rank(L2),
    update_rank_role(L2, 1, Certification, Day),
    get_rank_bottom_score(L2, Total);
update_rank(_, _Day) ->
    L1 = ets:tab2list(examination_testee),
    Total = ets:info(examination_testee, size),
    Fun = fun (#examination_testee{elapsed = ElapsedA,
                                   score = ScoreA},
               #examination_testee{elapsed = ElapsedB,
                                   score = ScoreB}) ->
                  if ScoreA > ScoreB -> true;
                     ScoreA =:= ScoreB andalso ElapsedA < ElapsedB -> true;
                     true -> false
                  end
          end,
    L2 = lists:sort(Fun, L1),
    to_out_rank(L2),
    get_rank_bottom_score(L2, Total).

get_rank_bottom_score(L2, Total) ->
    case L2 of
        [] -> 0;
        _ ->
            BottomOne = min(Total,
                            max(100,
                                util:ceil(Total * 5.99999999999999977796e-1))),
            case lists:nth(BottomOne, L2) of
                #examination_testee{score = BottomScore} -> BottomScore;
                #examination_role{score = BottomScore} -> BottomScore;
                _ -> 0
            end
    end.

update_rank_role([], _, _, _) -> ok;
update_rank_role([Testee = #examination_testee{id = Id}
                  | T],
                 Num, Certification = 0, Day) ->
    NewR = case ets:lookup(examination_role, Id) of
               [R = #examination_role{}] ->
                   R#examination_role{rank = Num};
               _ ->
                   R = to(examination_role, Testee),
                   R#examination_role{rank = Num}
           end,
    save(NewR),
    case Num =< 100 of
        true ->
            ets:insert(examination_rank, NewR),
            dets:insert(examination_rank, NewR);
        _ -> ok
    end,
    Content = notice:format(lang:get("恭喜您在智慧闯关-决赛中成绩排名~ts"),
                            [{string_2, 1, Num}]),
    MailInfo = #{items => [],
                 title => lang:get("智慧闯关-决赛排名结果"), content => Content,
                 del_type => 1},
    mail:send(Id, MailInfo),
    update_rank_role(T, Num + 1, Certification, Day);
update_rank_role([R = #examination_role{id = Id} | T],
                 Num, Certification, Day) ->
    Certified = case Num =< Certification of
                    true -> 1;
                    _ -> 0
                end,
    save(R#examination_role{rank = Num,
                            certified = Certified}),
    Content = case Num =< Certification of
                  true ->
                      notice:format(lang:get("恭喜您在智慧闯关-半决赛中成绩排名~ts，进入前60%，获得明天的智慧闯关-决赛资格！请明"
                                             "天准时参加"),
                                    [{string_2, 1, Num}]);
                  _ ->
                      notice:format(lang:get("恭喜您在智慧闯关-半决赛中成绩排名~ts"),
                                    [{string_2, 1, Num}])
              end,
    MailInfo = #{items => [],
                 title => lang:get("智慧闯关-半决赛排名结果"), content => Content,
                 del_type => 1},
    mail:send(Id, MailInfo),
    update_rank_role(T, Num + 1, Certification, Day).

create_maps(_) -> [].

stop_maps(Maps) ->
    lists:foreach(fun ({_, MapPid}) ->
                          map:async_apply(MapPid,
                                          {examination, apply_role, [leave]}),
                          case map:unit_list(MapPid) of
                              {ok, L} ->
                                  lists:foreach(fun (#map_unit{id = Id}) ->
                                                        unit_mgr:remove(Id)
                                                end,
                                                L);
                              _ -> ok
                          end,
                          map:stop(MapPid)
                  end,
                  Maps).

announce_item(Name,
              #{announce := 1, item_id := BaseId,
                item_num := ItemNum}) ->
    Fmt = case util:rand(1, 4) of
              1 -> lang:get("~ts参加智慧闯关时，巧思如流，被路过文曲星看中，赠送了他一个~ts");
              2 -> lang:get("~ts参加智慧闯关思考过于入迷，以至于考官都被感动，特赠送了他一个~ts");
              3 -> lang:get("~ts奔走在智慧闯关的路上和人相撞，起身收拾背包时发现包里多出一个~ts");
              _ -> lang:get("~ts在智慧闯关被难住，想摸出包里的小抄，不想却发现包里多出一个~ts")
          end,
    notice:cast(all,
                5,
                Fmt,
                [{role_2, Name}, {item_2, BaseId, ItemNum}]);
announce_item(_, _) -> ok.

get_examiner_id(Subject) ->
    case examination_data:get_examiner(6) of
        #{location := [_Loc1 | L]} ->
            case lists:nth(Subject, L) of
                {UnitId, _MapId, _DestX, _DestY} -> UnitId;
                _ -> 0
            end;
        _ -> 0
    end.

ask_help(#role{m_examination =
                   #m_examination{question = 0}},
         _HelpData) ->
    {false, lang:get("当前没有问题可以求助")};
ask_help(Role, HelpData = #help_data{}) ->
    Max = case day_of_the_week() of
              6 -> 3;
              _ -> 2
          end,
    case var:get_var(Role, day, 78, 0) >= Max of
        true ->
            {false, lang:get("很抱歉，您的求助机会已经用尽了~{face_1 ,22}")};
        _ -> do_ask_help(Role, HelpData)
    end;
ask_help(_Role, _Type) ->
    logger:debug("极寒挑战", [], examination, 1425),
    {false, lang:get("无效请求")}.

do_ask_help(Role = #role{id = Id, name = Name,
                         m_examination =
                             #m_examination{question = Question,
                                            dynamics = Dynamics},
                         m_guild = #m_guild{id = Gid}},
            HelpData = #help_data{id = HelpId}) ->
    case guild_mgr:members(Gid) of
        {ok, Members} ->
            Fmt = lang:get("~ts发起求助：智慧闯关，快帮助TA吧"),
            Args = [{role_2, Name}],
            NoticeMsg = notice:format(Fmt, Args),
            StrArr0 = case lists:keyfind(Question,
                                         #examination_question.id,
                                         Dynamics)
                          of
                          #examination_question{desc = Desc,
                                                options = Options} ->
                              [{1003, Desc} | options_to_help(Options)];
                          _ -> []
                      end,
            StrArr = [{1000, NoticeMsg}, {1001, Name} | StrArr0],
            DigArr = [{10, Question}],
            HelpMsg = #help_msg{help_rid = Id, help_id = HelpId,
                                str_array = StrArr, digit_array = DigArr},
            case help:add(HelpData, HelpMsg, Role) of
                {ok, NewHelpMsg, NewRole} ->
                    MFA = {examination, apply_for_help, [NewHelpMsg]},
                    guild_role:async_apply_role(Members, MFA),
                    QuestionList = var:get_var(NewRole, day, 80, []),
                    DayRole = case lists:member(Question, QuestionList) of
                                  true -> NewRole;
                                  _ ->
                                      var:set_var(NewRole,
                                                  day,
                                                  80,
                                                  [Question | QuestionList])
                              end,
                    {ok, DayRole};
                Rtn -> Rtn
            end;
        _ -> {false, lang:get("无法发起公会求助")}
    end;
do_ask_help(_Role, #help_data{}) ->
    {false, lang:get("不在公会中,无法发起公会求助")}.

options_to_help([]) -> [];
options_to_help([{1, Desc} | T]) ->
    [{1004, Desc} | options_to_help(T)];
options_to_help([{2, Desc} | T]) ->
    [{1005, Desc} | options_to_help(T)];
options_to_help([{3, Desc} | T]) ->
    [{1006, Desc} | options_to_help(T)];
options_to_help([{4, Desc} | T]) ->
    [{1007, Desc} | options_to_help(T)];
options_to_help([_ | T]) -> options_to_help(T).

apply_for_help(Role, HelpMsg) ->
    NewRole = help:ack_recv(HelpMsg, Role),
    {ok, NewRole}.

assist(Role,
       #help_msg{id = HelpMsgId,
                 help_rid = {Rid, Platform, ZoneId},
                 digit_array = [{10, Question}],
                 str_array =
                     [{1000, _NoticeMsg}, {1001, RName} | RestArr]}) ->
    role:link_send(Role,
                   14518,
                   {Rid,
                    Platform,
                    ZoneId,
                    RName,
                    HelpMsgId,
                    Question,
                    RestArr}),
    ok.

help_answer(Role = #role{id = SelfId, lev = SelfLev,
                         m_help = #m_help{recv_msg = RecvMsg}, name = Name},
            {HelpMsgId, Option}) ->
    case var:get_var(Role, day, 79, 0) < 10 of
        true ->
            case lists:keyfind(HelpMsgId, #help_msg.id, RecvMsg) of
                #help_msg{help_id = HelpId, help_rid = HelpRid,
                          digit_array = [{10, Question}],
                          str_array = [{1000, _NoticeMsg}, {1001, RName} | _]}
                    when HelpRid =/= SelfId ->
                    AnswerList = var:get_var(Role, day, 81, []),
                    logger:debug("已回答问题问题列表 ~w",
                                 [AnswerList],
                                 examination,
                                 1494),
                    case lists:member({HelpRid, Question}, AnswerList) of
                        false ->
                            Val = case examination_data:get_reward({SelfLev,
                                                                    get_type()})
                                      of
                                      #{right_exp := Exp} ->
                                          [{90010, util:floor(Exp / 5)}];
                                      _ -> []
                                  end,
                            Gain = format:val_to_gain(Val),
                            case role_gain:do_notice(Gain, Role) of
                                {ok, Role1} ->
                                    case role:apply(sync,
                                                    HelpRid,
                                                    {examination,
                                                     role_callback,
                                                     [{assist,
                                                       Question,
                                                       Option,
                                                       HelpId,
                                                       Name}]})
                                        of
                                        ok ->
                                            Role2 = var:acc_var(Role1, day, 79),
                                            Role3 = var:set_var(Role2,
                                                                day,
                                                                81,
                                                                [{HelpRid,
                                                                  Question}
                                                                 | AnswerList]),
                                            OptionName = option_name(Option),
                                            GuildMsg =
                                                notice:format(lang:get("建议成功，你建议~ts选择~ts"),
                                                              [{role_2, RName},
                                                               {string_2,
                                                                5,
                                                                OptionName}]),
                                            {ok, Role3, GuildMsg};
                                        {false, Why} -> {false, Why};
                                        _Else -> {false, lang:get("对方在忙，请稍等")}
                                    end;
                                {false, #gain{msg = Msg}} -> {false, Msg}
                            end;
                        _ -> {false, lang:get("你已经给过建议了，不能重复建议")}
                    end;
                _R ->
                    logger:debug("==~w", [_R], examination, 1523),
                    {false, lang:get("该请求帮助已失效")}
            end;
        _ -> {false, lang:get("您的帮助次数已经用尽了~{face_1 ,22}")}
    end.

role_callback(Role = #role{id = _Id, name = Name,
                           m_examination = #m_examination{question = QId},
                           m_guild = #m_guild{id = Gid}},
              {assist, Question, Option, _HelpId, HelpName}) ->
    logger:debug("收到帮助 ~w",
                 [{QId, Question, Option, _HelpId}],
                 examination,
                 1532),
    case QId =:= Question of
        true ->
            case guild_mgr:members(Gid) of
                {ok, Members} ->
                    GuildFmt = lang:get("~ts建议~ts选择~ts"),
                    MyFmt = lang:get("~ts建议你选择~ts"),
                    OptionName = option_name(Option),
                    GuildMsg = notice:format(GuildFmt,
                                             [{role_2, HelpName},
                                              {role_2, Name},
                                              {string_2, 5, OptionName}]),
                    MyMsg = notice:format(MyFmt,
                                          [{role_2, HelpName},
                                           {string_2, 5, OptionName}]),
                    guild:notice(Members, GuildMsg),
                    notice:send(Role, 1, MyMsg),
                    Role2 = var:acc_var(Role, day, 82),
                    {ok, ok, Role2};
                _ -> {ok, {false, lang:get("无法发起公会求助")}}
            end;
        _ -> {ok, {false, lang:get("该求助已失效")}}
    end.

option_name(Option) ->
    case Option of
        1 -> lang:get("A");
        2 -> lang:get("B");
        3 -> lang:get("C");
        _ -> lang:get("D")
    end.

format_time(Time) when Time >= 3600 ->
    util:flist(lang:get("~w小时"), [Time div 3600]);
format_time(Time) when Time >= 60 ->
    util:flist(lang:get("~w分"), [Time div 60]);
format_time(Time) ->
    util:flist(lang:get("~w秒"), [Time]).

calc_elapsed_addition(Elapsed) when Elapsed < 720 ->
    min(240, 720 - Elapsed);
calc_elapsed_addition(_) -> 0.

day_to_agenda_id(6) -> 2008;
day_to_agenda_id(_) -> 2007.

get_init_day(_Now, N) when N > 7 -> 2;
get_init_day(Now, N) ->
    Day = date:day_of_the_week(Now),
    Zero = date:unixtime({zero, Now}),
    case agenda_data:get(day_to_agenda_id(Day)) of
        #{starttime := StartTime, args := Args}
            when StartTime + Zero > Now ->
            case lists:member(Day, Args) of
                true -> Day;
                _ -> get_init_day(Zero + 86400, N + 1)
            end;
        _ -> get_init_day(Zero + 86400, N + 1)
    end.

to_out_rank(L) ->
    RankList = to_rank_list(L, 1, date:unixtime()),
    rank_zone:cast(47, {replace, 47, RankList, #{}}).

to_rank_list(LastL, Num, Now) ->
    to_rank_list(LastL, Num, Now, []).

to_rank_list([], _Num, _Now, RankList) ->
    lists:reverse(RankList);
to_rank_list(_, Num, _Now, RankList) when Num >= 100 ->
    lists:reverse(RankList);
to_rank_list([#examination_role{id =
                                    {RoleId, Platform, ZoneId},
                                name = Name, sex = Sex, classes = Classes,
                                score = Score, elapsed = TimeSpan}
              | T],
             Num, Now, RankList) ->
    RankRc = #rank_rc{id = {RoleId, Platform, ZoneId},
                      role_id = RoleId, platform = Platform, zone_id = ZoneId,
                      name = Name, sex = Sex, classes = Classes, time = Now,
                      val1 = Score, val2 = TimeSpan},
    to_rank_list(T, Num + 1, Now, [RankRc | RankList]);
to_rank_list([#examination_testee{id =
                                      {RoleId, Platform, ZoneId},
                                  name = Name, sex = Sex, classes = Classes,
                                  score = Score, elapsed = TimeSpan}
              | T],
             Num, Now, RankList) ->
    RankRc = #rank_rc{id = {RoleId, Platform, ZoneId},
                      role_id = RoleId, platform = Platform, zone_id = ZoneId,
                      name = Name, sex = Sex, classes = Classes, time = Now,
                      val1 = Score, val2 = TimeSpan},
    to_rank_list(T, Num + 1, Now, [RankRc | RankList]).

gen_dynamic(Role) ->
    Num = 3,
    Types = [{1, 15},
             {3, 15},
             {4, 15},
             {5, 15},
             {6, 15},
             {7, 5},
             {8, 5},
             {9, 2}],
    do_gen_dynamic(lists:reverse(util:rand_list_n(Types,
                                                  2,
                                                  length(Types))),
                   1,
                   Role,
                   Num).

do_gen_dynamic([], _, _, _) -> [];
do_gen_dynamic(_, N, _, Num) when N > Num -> [];
do_gen_dynamic([{1, _} | T], Id, Role, Num) ->
    case select_rank([4, 30, 52]) of
        {Type, [#rank_rc{name = Name} | L]} ->
            Opts = [OName
                    || #rank_rc{name = OName} <- lists:sublist(L, 3)],
            OptNum = length(Opts) + 1,
            [Answer | OptIds] = util:rand_list_n(lists:seq(1,
                                                           OptNum),
                                                 OptNum),
            Desc = case Type of
                       30 -> lang:get("本服称霸竞技场的玩家是谁？（竞技场杯数第一）？");
                       52 -> lang:get("本服谁的家园最漂亮（繁华度第一）？");
                       4 -> lang:get("本服集万千宠爱于一身的历史人气榜第一的玩家是谁？");
                       _ ->
                           notice:format(lang:get("本服~ts排行榜第一名是谁？"),
                                         [{string_2, 1, get_rank_name(Type)}])
                   end,
            Question = #examination_question{id = Id, type = 1,
                                             answer = Answer, desc = Desc,
                                             options =
                                                 gen_options([Name | Opts],
                                                             [Answer
                                                              | OptIds])},
            [Question | do_gen_dynamic(T, Id + 1, Role, Num)];
        _ -> do_gen_dynamic(T, Id, Role, Num)
    end;
do_gen_dynamic([{2, _} | T], Id, Role, Num) ->
    case select_rank([4, 30, 52]) of
        {Type, Rank} ->
            Len = erlang:length(Rank),
            Question = case Len > 6 of
                           true ->
                               Start = util:rand(2, Len - 4),
                               [Name | Opts] = [OName
                                                || #rank_rc{name = OName}
                                                       <- lists:sublist(Rank,
                                                                        Start,
                                                                        4)],
                               OptNum = length(Opts) + 1,
                               [Answer | OptIds] = util:rand_list_n(lists:seq(1,
                                                                              OptNum),
                                                                    OptNum),
                               #examination_question{id = Id, type = 2,
                                                     answer = Answer,
                                                     desc =
                                                         notice:format(lang:get("本服~ts排行榜第~ts名是谁？"),
                                                                       [{string_2,
                                                                         1,
                                                                         get_rank_name(Type)},
                                                                        {string_2,
                                                                         1,
                                                                         Start}]),
                                                     options =
                                                         gen_options([Name
                                                                      | Opts],
                                                                     [Answer
                                                                      | OptIds])};
                           _ ->
                               [Name | Opts] = [OName
                                                || #rank_rc{name = OName}
                                                       <- lists:sublist(Rank,
                                                                        4)],
                               OptNum = length(Opts) + 1,
                               [Answer | OptIds] = util:rand_list_n(lists:seq(1,
                                                                              OptNum),
                                                                    OptNum),
                               #examination_question{id = Id, type = 2,
                                                     answer = Answer,
                                                     desc =
                                                         notice:format(lang:get("本服~ts排行榜第一名是谁？"),
                                                                       [{string_2,
                                                                         1,
                                                                         get_rank_name(Type)}]),
                                                     options =
                                                         gen_options([Name
                                                                      | Opts],
                                                                     [Answer
                                                                      | OptIds])}
                       end,
            [Question | do_gen_dynamic(T, Id + 1, Role, Num)];
        _ -> do_gen_dynamic(T, Id, Role, Num)
    end;
do_gen_dynamic([{3, _} | T], Id, Role, Num) ->
    {WorldLev, _} = world_lev:get_world_lev(),
    case WorldLev div 10 of
        0 -> do_gen_dynamic(T, Id, Role, Num);
        N ->
            Start = max(0, N - util:rand(1, 4)),
            R = WorldLev rem 10,
            Lvs = lists:sublist([Lv * 10 + R
                                 || Lv <- lists:seq(Start, Start + 4),
                                    Lv * 10 + R =/= WorldLev],
                                3),
            Opts = [erlang:integer_to_list(Lv) || Lv <- Lvs],
            OptNum = length(Opts) + 1,
            Name = erlang:integer_to_list(WorldLev),
            [Answer | OptIds] = util:rand_list_n(lists:seq(1,
                                                           OptNum),
                                                 OptNum),
            Question = #examination_question{id = Id, type = 3,
                                             answer = Answer,
                                             desc = lang:get("目前本服世界等级是多少级？"),
                                             options =
                                                 gen_options([Name | Opts],
                                                             [Answer
                                                              | OptIds])},
            [Question | do_gen_dynamic(T, Id + 1, Role, Num)]
    end;
do_gen_dynamic([{4, _} | T], Id,
               Role = #role{m_guild = #m_guild{id = Gid}}, Num) ->
    case guild:apply(sync,
                     Gid,
                     {examination, apply_guild, [get_leader]})
        of
        [Name | Opts] when length([Name | Opts]) > 3 ->
            OptNum = length(Opts) + 1,
            [Answer | OptIds] = util:rand_list_n(lists:seq(1,
                                                           OptNum),
                                                 OptNum),
            Question = #examination_question{id = Id, type = 4,
                                             answer = Answer,
                                             desc = lang:get("目前你所在的公会会长是谁？"),
                                             options =
                                                 gen_options([Name | Opts],
                                                             [Answer
                                                              | OptIds])},
            [Question | do_gen_dynamic(T, Id + 1, Role, Num)];
        _ -> do_gen_dynamic(T, Id, Role, Num)
    end;
do_gen_dynamic([{5, _} | T], Id,
               Role = #role{m_guild = #m_guild{id = Gid}}, Num) ->
    case guild:apply(sync,
                     Gid,
                     {examination, apply_guild, [get_vice_leader]})
        of
        [Name | Opts] when length([Name | Opts]) > 3 ->
            OptNum = length(Opts) + 1,
            [Answer | OptIds] = util:rand_list_n(lists:seq(1,
                                                           OptNum),
                                                 OptNum),
            Question = #examination_question{id = Id, type = 5,
                                             answer = Answer,
                                             desc =
                                                 lang:get("以下哪位是你所在公会的公会副会长？"),
                                             options =
                                                 gen_options([Name | Opts],
                                                             [Answer
                                                              | OptIds])},
            [Question | do_gen_dynamic(T, Id + 1, Role, Num)];
        _ -> do_gen_dynamic(T, Id, Role, Num)
    end;
do_gen_dynamic([{6, _} | T], Id,
               Role = #role{m_guild = #m_guild{id = Gid}}, Num) ->
    case guild:apply(sync,
                     Gid,
                     {examination, apply_guild, [get_baby]})
        of
        [Name | Opts] when length([Name | Opts]) > 3 ->
            OptNum = length(Opts) + 1,
            [Answer | OptIds] = util:rand_list_n(lists:seq(1,
                                                           OptNum),
                                                 OptNum),
            Question = #examination_question{id = Id, type = 6,
                                             answer = Answer,
                                             desc =
                                                 lang:get("以下哪位是你所在公会的公会宝贝？"),
                                             options =
                                                 gen_options([Name | Opts],
                                                             [Answer
                                                              | OptIds])},
            [Question | do_gen_dynamic(T, Id + 1, Role, Num)];
        _ -> do_gen_dynamic(T, Id, Role, Num)
    end;
do_gen_dynamic([{7, _} | T], Id,
               Role = #role{m_guild = #m_guild{id = Gid}}, Num) ->
    Sex = util:rand_list([1, 0]),
    case guild:apply(sync,
                     Gid,
                     {examination, apply_guild, [{get_isomerism, Sex}]})
        of
        [Name | Opts] when length([Name | Opts]) > 3 ->
            logger:debug("异性题 ~w",
                         [[Name | Opts]],
                         examination,
                         1768),
            OptNum = length(Opts) + 1,
            [Answer | OptIds] = util:rand_list_n(lists:seq(1,
                                                           OptNum),
                                                 OptNum),
            Desc = case Sex of
                       1 -> lang:get("以下四名本公会成员，你觉得哪位最美？");
                       _ -> lang:get("以下四名本公会成员，你觉得哪位最帅？")
                   end,
            Type = case Sex of
                       1 -> 10;
                       _ -> 11
                   end,
            Question = #examination_question{id = Id, type = Type,
                                             answer = 0, desc = Desc,
                                             options =
                                                 gen_options([Name | Opts],
                                                             [Answer
                                                              | OptIds])},
            [Question | do_gen_dynamic(T, Id + 1, Role, Num)];
        _Else ->
            logger:debug("异性题 ~w", [_Else], examination, 1788),
            do_gen_dynamic(T, Id, Role, Num)
    end;
do_gen_dynamic([{8, _} | T], Id,
               Role = #role{m_guild = #m_guild{id = Gid}, sex = Sex},
               Num) ->
    case guild:apply(sync,
                     Gid,
                     {examination, apply_guild, [{get_isomerism, Sex}]})
        of
        [Name | Opts] when length([Name | Opts]) > 3 ->
            OptNum = length(Opts) + 1,
            [Answer | OptIds] = util:rand_list_n(lists:seq(1,
                                                           OptNum),
                                                 OptNum),
            Desc = lang:get("你最喜欢以下列出的你们公会的哪位玩家？"),
            Question = #examination_question{id = Id, type = 8,
                                             answer = 0, desc = Desc,
                                             options =
                                                 gen_options([Name | Opts],
                                                             [Answer
                                                              | OptIds])},
            [Question | do_gen_dynamic(T, Id + 1, Role, Num)];
        _ -> do_gen_dynamic(T, Id, Role, Num)
    end;
do_gen_dynamic([{9, _} | T], Id,
               Role = #role{m_wedding =
                                #m_wedding{status = 3, lover_name = Name}},
               Num) ->
    Desc = notice:format(lang:get("你深爱你的伴侣~ts吗？"),
                         [{role_2, Name}]),
    Options = [{I, lang:get("爱")} || I <- lists:seq(1, 4)],
    Question = #examination_question{id = Id, type = 9,
                                     answer = 0, desc = Desc,
                                     options = Options},
    [Question | do_gen_dynamic(T, Id + 1, Role, Num)];
do_gen_dynamic([_ | T], Id, Role, Num) ->
    do_gen_dynamic(T, Id, Role, Num).

select_rank([]) -> false;
select_rank(L) ->
    Type = util:rand_list(L),
    case rank:list_show(Type) of
        [A, B | T] -> {Type, [A, B | T]};
        _ -> select_rank(L -- [Type])
    end.

gen_options([Name | NT], [Id | IT]) ->
    [{Id, Name} | gen_options(NT, IT)];
gen_options(_, _) -> [].

get_rank_name(1) -> lang:get("角色等级");
get_rank_name(2) -> lang:get("宠物");
get_rank_name(3) -> lang:get("守护");
get_rank_name(4) -> lang:get("历史人气");
get_rank_name(39) -> lang:get("本周人气");
get_rank_name(5) -> lang:get("送花");
get_rank_name(6) -> lang:get("收花");
get_rank_name(7) -> lang:get("冒险技能");
get_rank_name(100) -> lang:get("累计师道值");
get_rank_name(101) -> lang:get("出师榜");
get_rank_name(30) -> lang:get("竞技杯数");
get_rank_name(52) -> lang:get("家园");
get_rank_name(_) -> "".

dynamic_notice(#examination_question{type = 8,
                                     options = Options},
               Opted,
               #role{m_guild = #m_guild{pid = Pid}, name = Name}) ->
    case lists:keyfind(Opted, 1, Options) of
        {_, OptName} ->
            AnnStr =
                notice:format(lang:get("~ts偷偷告诉答题考官，他挺喜欢公会里的~ts"),
                              [{role_2, Name}, {role_2, OptName}]),
            guild:notice(Pid, AnnStr);
        _ -> ok
    end;
dynamic_notice(#examination_question{type = 10,
                                     options = Options},
               Opted,
               #role{m_guild = #m_guild{pid = Pid}, name = Name}) ->
    case lists:keyfind(Opted, 1, Options) of
        {_, OptName} ->
            AnnStr =
                notice:format(lang:get("~ts偷偷告诉答题考官，他觉得~ts长得特别漂亮"),
                              [{role_2, Name}, {role_2, OptName}]),
            guild:notice(Pid, AnnStr);
        _ -> ok
    end;
dynamic_notice(#examination_question{type = 11,
                                     options = Options},
               Opted,
               #role{m_guild = #m_guild{pid = Pid}, name = Name}) ->
    case lists:keyfind(Opted, 1, Options) of
        {_, OptName} ->
            AnnStr =
                notice:format(lang:get("~ts偷偷告诉答题考官，他觉得~ts长得特别帅"),
                              [{role_2, Name}, {role_2, OptName}]),
            guild:notice(Pid, AnnStr);
        _ -> ok
    end;
dynamic_notice(#examination_question{type = 9}, _,
               #role{m_wedding = #m_wedding{lover_name = OptName},
                     name = Name}) ->
    case util:rand(1, 1) of
        1 ->
            AnnStr =
                notice:format(lang:get("~ts在答题也不忘给大家喂狗粮，他表示他一直深爱着~ts"),
                              [{role_2, Name}, {role_2, OptName}]),
            notice:cast(all, 5, AnnStr);
        _ -> ok
    end;
dynamic_notice(_, _, _) -> ok.

