-file("src/mod/parade/parade_procession.erl", 1).

-module(parade_procession).

-behaviour(gen_server).

-export([start/1,
         join/2,
         quit/2,
         logout/2,
         apply_role/2,
         stop/1,
         eat/2,
         get_exp/1]).

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

-file("src/mod/parade/parade_procession.erl", 21).

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

-file("src/mod/parade/parade_procession.erl", 22).

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

-file("src/mod/parade/parade_procession.erl", 23).

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

-file("src/mod/parade/parade_procession.erl", 24).

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

-file("src/mod/parade/parade_procession.erl", 25).

-file("inc/link.hrl", 1).

-record(link,
        {socket :: undefined | port(),
         conn_pid :: undefined | pid(),
         ip = {0, 0, 0, 0} :: {0..255, 0..255, 0..255, 0..255},
         port = 0 :: non_neg_integer(),
         lag = 0 :: non_neg_integer()}).

-file("src/mod/parade/parade_procession.erl", 26).

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

-file("src/mod/parade/parade_procession.erl", 27).

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

-file("src/mod/parade/parade_procession.erl", 28).

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

-file("src/mod/parade/parade_procession.erl", 29).

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

-file("src/mod/parade/parade_procession.erl", 30).

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

-file("src/mod/parade/parade_procession.erl", 31).

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

-file("src/mod/parade/parade_procession.erl", 32).

join(Pid, Participant) when is_pid(Pid) ->
    catch gen_server:call(Pid, {join, Participant});
join(_, _) -> {false, lang:get("队列不存在")}.

quit(Pid, Id) when is_pid(Pid) -> Pid ! {quit, Id};
quit(_Pid, _) -> ok.

logout(Pid, Id) -> Pid ! {logout, Id}.

stop(Pid) when is_pid(Pid) -> Pid ! stop;
stop(_) -> ok.

eat(Role = #role{s_event = 4,
                 m_parade = #m_parade{pid = Pid}, id = Id, lev = Lev},
    Rid)
    when is_pid(Pid) ->
    case gen_server:call(Pid, {eat, Id, Rid}) of
        {ok, Figure} ->
            case parade_data:get_lev(Lev) of
                #{bobling_exp := Exp} ->
                    Gain0 = format:val_to_gain([{90010, Exp}]),
                    Gain = case pet:get_war_pet(Role) of
                               {ok, #pet{lev = PetLev}} ->
                                   case parade_data:get_lev(PetLev) of
                                       #{pet_bobling_exp := PExp} ->
                                           format:val_to_gain([{90005, PExp}])
                                               ++ Gain0;
                                       _ -> Gain0
                                   end;
                               _ -> Gain0
                           end,
                    case role_gain:do_notice(Gain, Role) of
                        {ok, Role1} ->
                            Msg = make_eat_msg(ok, Figure),
                            {ok, Msg, Role1};
                        _ -> ok
                    end;
                _ -> ok
            end;
        {final, Figure} ->
            case parade_data:get_lev(Lev) of
                #{final_exp := Exp, final_item := Items} ->
                    Gain0 = case Items of
                                [] -> format:val_to_gain([{90010, Exp}]);
                                Items ->
                                    {ItemId, Num, _} = util:rand_list(Items, 3),
                                    format:val_to_gain([{90010, Exp},
                                                        {ItemId, Num}])
                            end,
                    Gain = case pet:get_war_pet(Role) of
                               {ok, #pet{lev = PetLev}} ->
                                   case parade_data:get_lev(PetLev) of
                                       #{pet_final_exp := PExp} ->
                                           format:val_to_gain([{90005, PExp}])
                                               ++ Gain0;
                                       _ -> Gain0
                                   end;
                               _ -> Gain0
                           end,
                    case role_gain:do_notice(Gain, Role) of
                        {ok, Role1} ->
                            Msg = make_eat_msg(final, Figure),
                            {ok, Msg, Role1};
                        _ -> ok
                    end;
                _ -> ok
            end;
        {false, Why} -> {false, Why};
        _R ->
            logger:debug("未知返回 ~w", [_R], parade_procession, 129),
            {false, lang:get("手慢了")}
    end;
eat(_, _) -> ok.

get_exp(#role{s_event = 4,
              m_parade = #m_parade{pid = Pid}, id = Id})
    when is_pid(Pid) ->
    case ets:lookup(parade_participant, Id) of
        [#parade_participant{exp = Exp,
                             figure_score = Score}] ->
            {Exp, Score};
        _ -> {0, 0}
    end;
get_exp(_) -> {0, 0}.

apply_role(Role = #role{s_event = 4,
                        m_parade = #m_parade{pid = Pid}},
           {move, Pid, Dx, Dy, Dir}) ->
    NRole = Role,
    {ok, map:role_move(Dx, Dy, Dir, NRole)};
apply_role(Role = #role{s_event = 4,
                        m_parade = Mparade = #m_parade{pid = Pid}},
           quit)
    when is_pid(Pid) ->
    Role1 = Role#role{s_event = 0,
                      m_parade = Mparade#m_parade{pid = undefined}},
    Role2 = looks:calc(Role1),
    Role3 = attr:calc_and_push(Role2),
    ToPos = util:rand_list([{10001, 306, 3507},
                            {10001, 2583, 3848},
                            {10001, 4957, 3680},
                            {10001, 445, 2565},
                            {10001, 4646, 704},
                            {10001, 841, 1033},
                            {10001, 2098, 1834},
                            {10001, 3617, 1816}]),
    case map:role_enter(ToPos, Role3) of
        {ok, Role4 = #role{}} ->
            team:follow(Role4),
            {ok, Role4};
        _Err ->
            map:role_update(Role3),
            team:follow(Role3),
            {ok, Role3}
    end;
apply_role(Role = #role{s_event = 4,
                        link = #link{conn_pid = ConnPid}},
           {add_exp, Exp, NewExp, NewScore}) ->
    logger:debug("加的经验 ~w", [Exp], parade_procession, 163),
    Ratio = case var:get_var(Role, day, 26, 0) of
                Val when Val < 10 -> 1.5;
                _ -> 1
            end,
    Gain = format:val_to_gain([{90010,
                                round(Exp * Ratio)}]),
    case role_gain:do_notice(Gain,
                             var:acc_var(Role, day, 26))
        of
        {ok, Role1} ->
            sys_conn:pack_send(ConnPid, 13306, {NewExp, NewScore}),
            {ok, Role1};
        _ -> ok
    end;
apply_role(Role = #role{s_event = 4,
                        link = #link{conn_pid = ConnPid}},
           {add_pet_exp, NewExp, NewScore}) ->
    Gain = case pet:get_war_pet(Role) of
               {ok, #pet{lev = PetLev}} ->
                   case parade_data:get_lev(PetLev) of
                       #{pet_exp := PExp} ->
                           format:val_to_gain([{90005, PExp}]);
                       _ -> []
                   end;
               _ -> []
           end,
    case role_gain:do_notice(Gain,
                             var:acc_var(Role, day, 26))
        of
        {ok, Role1} ->
            sys_conn:pack_send(ConnPid, 13306, {NewExp, NewScore}),
            {ok, Role1};
        _ -> ok
    end;
apply_role(Role = #role{lev = Lev}, {auto_eat, 1}) ->
    case parade_data:get_lev(Lev) of
        #{bobling_exp := Exp} ->
            Gain0 = format:val_to_gain([{90010, Exp}]),
            Gain = case pet:get_war_pet(Role) of
                       {ok, #pet{lev = PetLev}} ->
                           case parade_data:get_lev(PetLev) of
                               #{pet_bobling_exp := PExp} ->
                                   format:val_to_gain([{90005, PExp}]) ++ Gain0;
                               _ -> Gain0
                           end;
                       _ -> Gain0
                   end,
            case role_gain:do_notice(Gain, Role) of
                {ok, Role1} -> {ok, Role1};
                _ -> ok
            end;
        _ -> ok
    end;
apply_role(Role = #role{lev = Lev}, {auto_eat, 2}) ->
    case parade_data:get_lev(Lev) of
        #{final_exp := Exp, final_item := Items} ->
            Gain0 = case Items of
                        [] -> format:val_to_gain([{90010, Exp}]);
                        Items ->
                            {ItemId, Num, _} = util:rand_list(Items, 3),
                            format:val_to_gain([{90010, Exp}, {ItemId, Num}])
                    end,
            Gain = case pet:get_war_pet(Role) of
                       {ok, #pet{lev = PetLev}} ->
                           case parade_data:get_lev(PetLev) of
                               #{pet_final_exp := PExp} ->
                                   format:val_to_gain([{90005, PExp}]) ++ Gain0;
                               _ -> Gain0
                           end;
                       _ -> Gain0
                   end,
            case role_gain:do_notice(Gain, Role) of
                {ok, Role1} -> {ok, Role1};
                _ -> ok
            end;
        _ -> ok
    end;
apply_role(_Role, _Args) ->
    logger:debug("未知回调 ~w",
                 [_Args],
                 parade_procession,
                 238),
    ok.

start(PP) ->
    gen_server:start(parade_procession, [PP], []).

init([PP = #parade_procession{map_id = MapId,
                              unit_base_id = BaseId,
                              path = [First | _] = Paths0}]) ->
    [{X, Y} | _Paths1] = gen_path_detail(Paths0,
                                         First,
                                         MapId,
                                         []),
    {ok, #unit{id = UId}} = unit_mgr:create(5,
                                            BaseId,
                                            {MapId, X, Y}),
    NewPP = PP#parade_procession{pid = self(),
                                 unit_id = UId, x = X, y = Y},
    erlang:put(last_add_exp_type, add_exp),
    erlang:put(add_exp_ref,
               erlang:send_after(10000, self(), add_exp)),
    parade:update(NewPP),
    {ok, NewPP}.

handle_call({join,
             Participant = #parade_participant{id = Id}},
            _From,
            State = #parade_procession{participants = Ps, num = Num,
                                       x = X, y = Y, map_id = MapId,
                                       unit_id = UnitId,
                                       unit_base_id = BaseId}) ->
    NewState = State#parade_procession{participants =
                                           lists:keystore(Id,
                                                          #parade_participant.id,
                                                          Ps,
                                                          Participant),
                                       num = Num + 1},
    map:pack_send_to_all(MapId,
                         13304,
                         {UnitId, BaseId, MapId, Participant}),
    Reply = {ok, MapId, X, Y},
    parade:update(NewState),
    parade:update(Participant),
    {reply, Reply, NewState};
handle_call({eat, Id, Tid}, _From,
            State = #parade_procession{participants = Ps,
                                       map_id = MapId, unit_id = UnitId,
                                       unit_base_id = BaseId}) ->
    Now = date:unixtime(),
    {NewPs, Reply} = case lists:keyfind(Id,
                                        #parade_participant.id,
                                        Ps)
                         of
                         #parade_participant{figure_score = Score}
                             when Score >= 145 andalso Id =/= Tid ->
                             {Ps, {false, lang:get("第四阶段变身只能吃自己的食物哦")}};
                         #parade_participant{figure_score = Score,
                                             final_rewarded = 1}
                             when Score >= 145 ->
                             {Ps, {false, lang:get("再也吃不动了")}};
                         #parade_participant{last_ate = Last}
                             when Now - Last =< 10 ->
                             {Ps,
                              {false,
                               util:flist(lang:get("吞嚼中，无力再战。剩余~ws"),
                                          [10 - (Now - Last)])}};
                         #parade_participant{id = Tid, has_food = 0} ->
                             {Ps, {false, lang:get("手慢了，食物被别人抢走啦！")}};
                         P = #parade_participant{figure_score = Score, id = Tid}
                             when Score >= 145 ->
                             Figure = calc_figure(145),
                             P1 = P#parade_participant{has_food = 0,
                                                       figure = Figure,
                                                       figure_score = 145,
                                                       final_rewarded = 1,
                                                       last_ate = Now},
                             Ps1 = lists:keyreplace(Id,
                                                    #parade_participant.id,
                                                    Ps,
                                                    P1),
                             parade:update(P1),
                             map:pack_send_to_all(MapId,
                                                  13308,
                                                  {UnitId, BaseId, MapId, P1}),
                             {Ps1, {final, Figure}};
                         P = #parade_participant{figure_score = Score,
                                                 id = Tid} ->
                             NewScore = min(145, Score + 15),
                             Figure = calc_figure(NewScore),
                             P1 = P#parade_participant{has_food = 0,
                                                       figure = Figure,
                                                       figure_score = NewScore,
                                                       last_ate = Now},
                             Ps1 = lists:keyreplace(Id,
                                                    #parade_participant.id,
                                                    Ps,
                                                    P1),
                             parade:update(P1),
                             map:pack_send_to_all(MapId,
                                                  13308,
                                                  {UnitId, BaseId, MapId, P1}),
                             {Ps1, {ok, Figure}};
                         P = #parade_participant{figure_score = Score} ->
                             case lists:keyfind(Tid, #parade_participant.id, Ps)
                                 of
                                 PT = #parade_participant{has_food = 1} ->
                                     NewScore = min(145, Score + 15),
                                     Figure = calc_figure(NewScore),
                                     P1 = P#parade_participant{figure = Figure,
                                                               figure_score =
                                                                   NewScore,
                                                               last_ate = Now},
                                     PT1 = PT#parade_participant{has_food = 0},
                                     Ps1 = lists:keyreplace(Id,
                                                            #parade_participant.id,
                                                            Ps,
                                                            P1),
                                     Ps2 = lists:keyreplace(Tid,
                                                            #parade_participant.id,
                                                            Ps1,
                                                            PT1),
                                     parade:update(P1),
                                     parade:update(PT1),
                                     map:pack_send_to_all(MapId,
                                                          13308,
                                                          {UnitId,
                                                           BaseId,
                                                           MapId,
                                                           P1}),
                                     map:pack_send_to_all(MapId,
                                                          13308,
                                                          {UnitId,
                                                           BaseId,
                                                           MapId,
                                                           PT1}),
                                     {Ps2, {ok, Figure}};
                                 _ -> {Ps, {false, lang:get("手慢了，食物被别人抢走啦！")}}
                             end
                     end,
    NewState = State#parade_procession{participants =
                                           NewPs},
    parade:update(NewState),
    {reply, Reply, NewState};
handle_call(_Request, _From, State) ->
    logger:debug("未知消息 ~w",
                 [_Request],
                 parade_procession,
                 330),
    {noreply, State}.

handle_cast(_Msg, State) ->
    logger:debug("未知消息 ~w", [_Msg], parade_procession, 334),
    {noreply, State}.

handle_info({quit, Id},
            State = #parade_procession{participants = Ps, num = Num,
                                       unit_id = UnitId, map_id = MapId,
                                       unit_base_id = BaseId}) ->
    case lists:keyfind(Id, #parade_participant.id, Ps) of
        Participant = #parade_participant{} ->
            NewState = State#parade_procession{participants =
                                                   lists:keydelete(Id,
                                                                   #parade_participant.id,
                                                                   Ps),
                                               num = Num - 1},
            map:pack_send_to_all(MapId,
                                 13305,
                                 {UnitId, BaseId, MapId, Participant}),
            parade:procession_wait(Num, self()),
            parade:update(NewState),
            {noreply, NewState};
        _ -> {noreply, State}
    end;
handle_info({logout, Id},
            State = #parade_procession{participants = Ps, num = Num,
                                       unit_id = UnitId, unit_base_id = BaseId,
                                       map_id = MapId}) ->
    case lists:keyfind(Id, #parade_participant.id, Ps) of
        Participant = #parade_participant{} ->
            NewState = State#parade_procession{participants =
                                                   lists:keydelete(Id,
                                                                   #parade_participant.id,
                                                                   Ps),
                                               num = Num - 1},
            map:pack_send_to_all(MapId,
                                 13305,
                                 {UnitId, BaseId, MapId, Participant}),
            parade:procession_wait(Num, self()),
            parade:update(NewState),
            {noreply, NewState};
        _ -> {noreply, State}
    end;
handle_info(move,
            State = #parade_procession{unit_id = UnitId,
                                       move_next = [{X, Y} | MoveNext],
                                       move_ref = OldRef, participants = Ps,
                                       path = Path, num = Num}) ->
    case erlang:is_reference(OldRef) of
        true -> erlang:cancel_timer(OldRef);
        _ -> ok
    end,
    {Next, NewNext} = case MoveNext of
                          [N] -> {N, [N | Path]};
                          [N | _Path1] -> {N, MoveNext}
                      end,
    MoveTime = calc_move_time({X, Y}, Next),
    map:unit_move(UnitId, X, Y),
    FollowPos = get_follow_pos(#{path => Path, xy => {X, Y},
                                 need_patch => Num, add => 0, found => false},
                               []),
    participants_move(Ps, FollowPos),
    Ref = erlang:send_after(MoveTime, self(), move),
    NewState = State#parade_procession{x = X, y = Y,
                                       move_next = NewNext, move_ref = Ref},
    {noreply, NewState};
handle_info(add_exp,
            State = #parade_procession{participants = Ps,
                                       unit_id = UnitId,
                                       unit_base_id = BaseId}) ->
    OldRef = erlang:get(add_exp_ref),
    case erlang:is_reference(OldRef) of
        true -> erlang:cancel_timer(OldRef);
        _ -> ok
    end,
    NewPs = lists:map(fun (P = #parade_participant{pid =
                                                       Pid,
                                                   lev = Lev, exp = OldExp,
                                                   figure_score = Score,
                                                   has_food = HasFood,
                                                   map_id = MapId,
                                                   final_rewarded = Final}) ->
                              NewScore = min(145, Score + 1),
                              NewFigure = calc_figure(NewScore),
                              Exp0 = case parade_data:get_lev(Lev) of
                                         #{exp := Exp00} -> Exp00;
                                         _ -> 0
                                     end,
                              Exp = case NewFigure of
                                        1 -> round(Exp0 * 110 / 100);
                                        2 -> round(Exp0 * 120 / 100);
                                        3 -> round(Exp0 * 130 / 100);
                                        _ -> Exp0
                                    end,
                              NewExp = OldExp + Exp,
                              role:apply(async,
                                         Pid,
                                         {parade_procession,
                                          apply_role,
                                          [{add_exp, Exp, NewExp, NewScore}]}),
                              P1 = P#parade_participant{exp = NewExp,
                                                        figure = NewFigure,
                                                        figure_score =
                                                            NewScore},
                              case HasFood =:= 0 andalso util:rand(1, 100) =< 15
                                  of
                                  true ->
                                      P2 = case NewScore >= 145 andalso
                                                    Final =:= 0 andalso
                                                        util:rand(1, 100) =< 7
                                               of
                                               true ->
                                                   P1#parade_participant{has_food
                                                                             =
                                                                             2};
                                               _ ->
                                                   P1#parade_participant{has_food
                                                                             =
                                                                             1}
                                           end,
                                      map:pack_send_to_all(MapId,
                                                           13308,
                                                           {UnitId,
                                                            BaseId,
                                                            MapId,
                                                            P2}),
                                      parade:update(P2),
                                      P2;
                                  _ ->
                                      parade:update(P1),
                                      P1
                              end
                      end,
                      Ps),
    erlang:put(add_exp_ref,
               erlang:send_after(20000, self(), clear_bobble)),
    {noreply,
     State#parade_procession{participants = NewPs}};
handle_info(clear_bobble,
            State = #parade_procession{participants = Ps,
                                       unit_id = UnitId,
                                       unit_base_id = BaseId}) ->
    OldRef = erlang:get(add_exp_ref),
    case erlang:is_reference(OldRef) of
        true -> erlang:cancel_timer(OldRef);
        _ -> ok
    end,
    NewPs = lists:map(fun (P = #parade_participant{has_food
                                                       = 2,
                                                   map_id = MapId,
                                                   pid = Pid}) ->
                              P1 = P#parade_participant{has_food = 0,
                                                        final_rewarded = 1},
                              role:apply(async,
                                         Pid,
                                         {parade_procession,
                                          apply_role,
                                          [{auto_eat, 2}]}),
                              map:pack_send_to_all(MapId,
                                                   13308,
                                                   {UnitId, BaseId, MapId, P1}),
                              parade:update(P1),
                              P1;
                          (P = #parade_participant{has_food = 1, map_id = MapId,
                                                   pid = Pid,
                                                   figure_score = Score}) ->
                              NewScore = min(145, Score + 15),
                              Figure = calc_figure(NewScore),
                              P1 = P#parade_participant{has_food = 0,
                                                        figure_score = NewScore,
                                                        figure = Figure},
                              role:apply(async,
                                         Pid,
                                         {parade_procession,
                                          apply_role,
                                          [{auto_eat, 1}]}),
                              map:pack_send_to_all(MapId,
                                                   13308,
                                                   {UnitId, BaseId, MapId, P1}),
                              parade:update(P1),
                              P1;
                          (P) -> P
                      end,
                      Ps),
    case erlang:get(last_add_exp_type) of
        add_pet_exp ->
            erlang:put(last_add_exp_type, add_exp),
            erlang:put(add_exp_ref,
                       erlang:send_after(10000, self(), add_exp));
        _ ->
            erlang:put(last_add_exp_type, add_pet_exp),
            erlang:put(add_exp_ref,
                       erlang:send_after(10000, self(), add_pet_exp))
    end,
    {noreply,
     State#parade_procession{participants = NewPs}};
handle_info(add_pet_exp,
            State = #parade_procession{participants = Ps,
                                       unit_id = UnitId,
                                       unit_base_id = BaseId}) ->
    OldRef = erlang:get(add_exp_ref),
    case erlang:is_reference(OldRef) of
        true -> erlang:cancel_timer(OldRef);
        _ -> ok
    end,
    NewPs = lists:map(fun (P = #parade_participant{pid =
                                                       Pid,
                                                   exp = OldExp,
                                                   figure_score = Score,
                                                   has_food = HasFood,
                                                   map_id = MapId,
                                                   final_rewarded = Final}) ->
                              NewScore = min(145, Score + 1),
                              NewFigure = calc_figure(NewScore),
                              NewExp = OldExp,
                              role:apply(async,
                                         Pid,
                                         {parade_procession,
                                          apply_role,
                                          [{add_pet_exp, NewExp, NewScore}]}),
                              P1 = P#parade_participant{exp = NewExp,
                                                        figure = NewFigure,
                                                        figure_score =
                                                            NewScore},
                              case HasFood =:= 0 andalso util:rand(1, 100) =< 15
                                  of
                                  true ->
                                      P2 = case NewScore >= 145 andalso
                                                    Final =:= 0 andalso
                                                        util:rand(1, 100) =< 7
                                               of
                                               true ->
                                                   P1#parade_participant{has_food
                                                                             =
                                                                             2};
                                               _ ->
                                                   P1#parade_participant{has_food
                                                                             =
                                                                             1}
                                           end,
                                      map:pack_send_to_all(MapId,
                                                           13308,
                                                           {UnitId,
                                                            BaseId,
                                                            MapId,
                                                            P2}),
                                      parade:update(P2),
                                      P2;
                                  _ ->
                                      parade:update(P1),
                                      P1
                              end
                      end,
                      Ps),
    erlang:put(add_exp_ref,
               erlang:send_after(20000, self(), clear_bobble)),
    {noreply,
     State#parade_procession{participants = NewPs}};
handle_info(add_food,
            State = #parade_procession{participants = Ps,
                                       unit_id = UnitId,
                                       unit_base_id = BaseId}) ->
    OldRef = erlang:get(add_food_ref),
    case erlang:is_reference(OldRef) of
        true -> erlang:cancel_timer(OldRef);
        _ -> ok
    end,
    NewPs = lists:map(fun (P = #parade_participant{has_food
                                                       = 0,
                                                   map_id = MapId}) ->
                              case util:rand(1, 100) >= 30 of
                                  true ->
                                      P1 = P#parade_participant{has_food = 1},
                                      map:pack_send_to_all(MapId,
                                                           13308,
                                                           {UnitId,
                                                            BaseId,
                                                            MapId,
                                                            P1}),
                                      parade:update(P1),
                                      P1;
                                  _ -> P
                              end;
                          (P) -> P
                      end,
                      Ps),
    {noreply,
     State#parade_procession{participants = NewPs}};
handle_info(stop,
            State = #parade_procession{move_ref = OldRef}) ->
    case erlang:is_reference(OldRef) of
        true -> erlang:cancel_timer(OldRef);
        _ -> ok
    end,
    {stop, normal, State};
handle_info(_Info, State) ->
    logger:debug("未知消息 ~w",
                 [_Info],
                 parade_procession,
                 529),
    {noreply, State}.

terminate(_Reason,
          State = #parade_procession{participants = Ps,
                                     unit_id = UnitId}) ->
    lists:foreach(fun (#parade_participant{pid = Pid}) ->
                          role:apply(async,
                                     Pid,
                                     {parade_procession, apply_role, [quit]})
                  end,
                  Ps),
    unit_mgr:remove(UnitId),
    parade:delete(State),
    ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

calc_move_time({X, Y}, {Xn, Yn}) ->
    Ds = math:sqrt(math:pow(Xn - X, 2) +
                       math:pow(Yn - Y, 2)),
    round(Ds / 120 * 1000).

participants_move([], _) -> ok;
participants_move(_, []) ->
    logger:error("缺少坐标", [], parade_procession, 552),
    ok;
participants_move([#parade_participant{pid = Pid} | T],
                  [{X, Y} | Pos]) ->
    role:apply(async,
               Pid,
               {parade_procession,
                apply_role,
                [{move, self(), X, Y, 1}]}),
    participants_move(T, Pos).

gen_path_detail([], _First, _MapId, Paths) -> Paths;
gen_path_detail([{X, Y}], First, MapId, Paths) ->
    case parade_data:get_curve({MapId, X, Y}) of
        L when is_list(L) ->
            [Cur | L1] = add_detail(L, Paths),
            case map_mgr:paths(MapId, MapId, Cur, First) of
                L2 when is_list(L2) ->
                    [_ | L3] = add_detail([Cur | L2], L1),
                    lists:reverse(L3);
                _E -> lists:reverse([Cur | L1])
            end;
        _R ->
            case map_mgr:paths(MapId, MapId, {X, Y}, First) of
                L1 when is_list(L1) ->
                    [_ | L2] = add_detail([{X, Y} | L1], Paths),
                    lists:reverse(L2);
                _E -> lists:reverse([{X, Y} | Paths])
            end
    end;
gen_path_detail([{X, Y}, {Xn, Yn} | T], First, MapId,
                Paths) ->
    case parade_data:get_curve({MapId, X, Y}) of
        L when is_list(L) ->
            [Cur | L1] = add_detail(L, Paths),
            gen_path_detail([Cur, {Xn, Yn} | T], First, MapId, L1);
        _R ->
            case map_mgr:paths(MapId, MapId, {X, Y}, {Xn, Yn}) of
                L1 when is_list(L1) ->
                    [Cur | L2] = add_detail([{X, Y} | L1], Paths),
                    gen_path_detail([Cur | T], First, MapId, L2);
                _E ->
                    gen_path_detail([{Xn, Yn} | T],
                                    First,
                                    MapId,
                                    [{X, Y} | Paths])
            end
    end.

add_detail([], L) -> L;
add_detail([H | T], L) -> add_detail(T, [H | L]).

get_follow_pos(#{need_patch := 0}, Pos) -> Pos;
get_follow_pos(Cfg = #{path := [XY | Path], xy := XY,
                       need_patch := NeedPatch, add := Add},
               Pos)
    when NeedPatch > Add ->
    get_follow_pos(Cfg#{path := lists:reverse(Path),
                        found => true},
                   Pos);
get_follow_pos(#{need_patch := NeedPatch, add := Add,
                 found := true},
               Pos)
    when NeedPatch =< Add ->
    Pos;
get_follow_pos(#{path := [XY | _Path], xy := XY},
               Pos) ->
    Pos;
get_follow_pos(Cfg = #{path := [XY | Path], add := Add},
               Pos) ->
    get_follow_pos(Cfg#{path := Path, add := Add + 1},
                   [XY | Pos]).

calc_figure(Score) when Score >= 145 -> 3;
calc_figure(Score) when Score >= 65 -> 2;
calc_figure(Score) when Score >= 20 -> 1;
calc_figure(_) -> 0.

make_eat_msg(ok, 0) -> lang:get("吃了肉骨头，长了一斤肉！");
make_eat_msg(ok, 1) -> lang:get("八分饱！经验获取速度110%");
make_eat_msg(ok, 2) -> lang:get("十分饱！经验获取速度120%");
make_eat_msg(ok, 3) -> lang:get("吃撑了！经验获取速度130%");
make_eat_msg(final, _Figure) -> lang:get("撑了，等待解救！").

