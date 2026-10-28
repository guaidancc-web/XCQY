-file("src/mod/campaign/camp_dragon_boat.erl", 1).

-module(camp_dragon_boat).

-behaviour(gen_fsm).

-export([start_link/0,
         init/0,
         login/1,
         sign/1,
         quit/1,
         checkin/1,
         combat_over/4,
         role_callback/2,
         evt_callback/2,
         push/2,
         gm/1,
         rpc_get_rank_info/1,
         reset_start_time/1]).

-export([idle/2, active/2, sign/2, match/2]).

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

-file("src/mod/campaign/camp_dragon_boat.erl", 37).

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

-file("src/mod/campaign/camp_dragon_boat.erl", 38).

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

-file("src/mod/campaign/camp_dragon_boat.erl", 39).

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

-file("src/mod/campaign/camp_dragon_boat.erl", 40).

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

-file("src/mod/campaign/camp_dragon_boat.erl", 41).

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

-file("src/mod/campaign/camp_dragon_boat.erl", 42).

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

-file("src/mod/campaign/camp_dragon_boat.erl", 43).

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

-file("src/mod/campaign/camp_dragon_boat.erl", 44).

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

-file("src/mod/campaign/camp_dragon_boat.erl", 45).

-file("inc/link.hrl", 1).

-record(link,
        {socket :: undefined | port(),
         conn_pid :: undefined | pid(),
         ip = {0, 0, 0, 0} :: {0..255, 0..255, 0..255, 0..255},
         port = 0 :: non_neg_integer(),
         lag = 0 :: non_neg_integer()}).

-file("src/mod/campaign/camp_dragon_boat.erl", 46).

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

-file("src/mod/campaign/camp_dragon_boat.erl", 47).

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

-file("src/mod/campaign/camp_dragon_boat.erl", 48).

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

-file("src/mod/campaign/camp_dragon_boat.erl", 49).

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

-file("src/mod/campaign/camp_dragon_boat.erl", 50).

-file("inc/camp_dragon_boat.hrl", 1).

-record(m_camp_dragon_boat,
        {ver = 0,
         start_time = 0 :: non_neg_integer(),
         time_span = 0 :: non_neg_integer(),
         rewarded = [] :: non_neg_integer(),
         rewarded_time = 0 :: non_neg_integer(),
         done = 0 :: non_neg_integer(),
         fought = 0 :: non_neg_integer(),
         triggers = []}).

-record(dragon_boat_role,
        {ver = 0,
         id = {0, "", 0},
         name = "" :: string(),
         sex = 0 :: 0 | 1,
         classes = 0 :: 0..5,
         time_span = 0 :: integer(),
         is_leader = 0 :: 0 | 1}).

-record(dragon_boat_team,
        {ver = 0,
         id = [] :: list(),
         time_span = 0 :: integer(),
         members = [],
         rank = 0 :: non_neg_integer(),
         done = 0 :: non_neg_integer(),
         leader_name = "" :: list()}).

-file("src/mod/campaign/camp_dragon_boat.erl", 51).

-file("inc/achieve_shop.hrl", 1).

-record(m_achieve_shop,
        {ver = 5 :: pos_integer(),
         shops = [] :: list(),
         zone_theme = 0 :: non_neg_integer(),
         team_mark = 401 :: non_neg_integer(),
         chat_bubble = 301 :: non_neg_integer(),
         photo_frame = 0 :: non_neg_integer(),
         badges = [] :: list(),
         prefix = 0,
         honor = 0,
         footmark = 0 :: non_neg_integer()}).

-record(ashop_goods_info,
        {ver = 1 :: non_neg_integer(),
         id = 0 :: non_neg_integer(),
         state = 0 :: non_neg_integer(),
         expire = 0 :: non_neg_integer()}).

-file("src/mod/campaign/camp_dragon_boat.erl", 52).

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

-file("src/mod/campaign/camp_dragon_boat.erl", 53).

-record(state,
        {ts = 0 :: tuple(),
         timeout = 0 :: non_neg_integer(),
         units = [],
         rank_ref :: undefined | reference()}).

init() -> #m_camp_dragon_boat{}.

login(Role = #role{m_camp_dragon_boat = DragonBoat,
                   s_event = 23}) ->
    {ok,
     Role#role{m_camp_dragon_boat =
                   DragonBoat#m_camp_dragon_boat{start_time = 0, done = 0,
                                                 triggers = []},
               s_event = 0}};
login(_) -> ok.

sign(#role{s_event = 23}) ->
    {false, lang:get("您已经成功报名，无需重复报名")};
sign(Role = #role{m_camp_dragon_boat =
                      DragonBoat = #m_camp_dragon_boat{triggers =
                                                           Triggers}}) ->
    case check_sign([time,
                     status,
                     event,
                     team,
                     teammate_lev],
                    Role)
        of
        true ->
            Now = date:unixtime(),
            {Role1, NewTriggers} = add_trigger([evt_team_appoint,
                                                evt_team_leave,
                                                evt_move_map],
                                               Role,
                                               Triggers),
            SignRole = Role1#role{s_event = 23,
                                  m_camp_dragon_boat =
                                      DragonBoat#m_camp_dragon_boat{done = 0,
                                                                    start_time =
                                                                        0,
                                                                    time_span =
                                                                        0,
                                                                    fought = 0,
                                                                    triggers =
                                                                        NewTriggers}},
            NewRole = case achieve_shop:set_team_mark(SignRole, 407)
                          of
                          {ok, TeamMarkRole} ->
                              achieve_shop:push_teammark(TeamMarkRole),
                              TeamMarkRole;
                          _ -> SignRole
                      end,
            team:leader_async(NewRole,
                              {camp_dragon_boat,
                               role_callback,
                               [{sync_sign, 0, 0, Now}]}),
            map:role_update(NewRole),
            npc_talk(NewRole, 0),
            {ok, update(NewRole, [])};
        Else -> Else
    end.

quit(Role = #role{m_camp_dragon_boat =
                      DragonBoat = #m_camp_dragon_boat{triggers = Triggers},
                  s_event = 23}) ->
    {Role1, NewTriggers} = remove_trigger(all,
                                          Triggers,
                                          Role),
    NewRole = Role1#role{s_event = 0,
                         m_camp_dragon_boat =
                             DragonBoat#m_camp_dragon_boat{done = 0,
                                                           start_time = 0,
                                                           time_span = 0,
                                                           triggers =
                                                               NewTriggers}},
    push(NewRole, 19900),
    team:leader_async(NewRole,
                      {camp_dragon_boat, role_callback, [clear]}),
    map:role_update(NewRole),
    {ok, NewRole};
quit(#role{}) -> {false, lang:get("你还没参与")}.

checkin(Role = #role{m_camp_dragon_boat =
                         DragonBoat = #m_camp_dragon_boat{done = Done,
                                                          rewarded = Rewarded,
                                                          rewarded_time = Last,
                                                          fought = Fought,
                                                          start_time =
                                                              OldStartTime},
                     pos = #pos{map = MapId, x = X, y = Y}, s_event = 23,
                     name = Name}) ->
    case env:get(camp_dragon_boat_status) of
        {match, _} ->
            case team:get_members_follow_num(Role) of
                N when is_integer(N) andalso N >= 3 ->
                    Now = date:unixtime(),
                    NewDone = Done + 1,
                    TeamSt = team:get_status(Role),
                    case dragon_boat_data:get(NewDone) of
                        _ when TeamSt =/= {true, 1} ->
                            {false, lang:get("只有队长才能签到")};
                        #{map_id := DestMapId, x := DestX, y := DestY}
                            when DestMapId =/= MapId orelse
                                     abs(X - DestX) >= 500 orelse
                                         Y - DestY > 500 ->
                            {false,
                             notice:format(lang:get("你要去~ts号点去签到哦"),
                                           [{string_2, 5, NewDone}])};
                        #{min_fight := Min, enemy := UnitList}
                            when Min > Fought ->
                            {UnitId, _} = util:rand_list(UnitList),
                            start_combat(Role, UnitId);
                        #{map_id := MapId, x := DestX, y := DestY}
                            when abs(X - DestX) < 500 andalso Y - DestY < 500 ->
                            Rewarded1 = case date:is_same_day(Last, Now) of
                                            true -> Rewarded;
                                            _ -> []
                                        end,
                            StartTime = case OldStartTime of
                                            0 ->
                                                case
                                                    env:get(dragon_boat_start_time)
                                                    of
                                                    _S when is_integer(_S) ->
                                                        _S;
                                                    _ -> 0
                                                end;
                                            _ -> OldStartTime
                                        end,
                            TimeSpan = case NewDone of
                                           0 -> 0;
                                           _ -> Now - StartTime
                                       end,
                            logger:debug("所花时间:~w",
                                         [TimeSpan],
                                         camp_dragon_boat,
                                         209),
                            case lists:keyfind(NewDone, 1, Rewarded1) of
                                {_, RewardTimes} when RewardTimes >= 2 ->
                                    Role1 = Role#role{m_camp_dragon_boat =
                                                          DragonBoat#m_camp_dragon_boat{done
                                                                                            =
                                                                                            NewDone,
                                                                                        start_time
                                                                                            =
                                                                                            StartTime,
                                                                                        rewarded
                                                                                            =
                                                                                            Rewarded1,
                                                                                        fought
                                                                                            =
                                                                                            0,
                                                                                        time_span
                                                                                            =
                                                                                            TimeSpan}},
                                    Msg =
                                        notice:format(lang:get("你今天已经参与过2次~ts活动，无法再获得奖励"),
                                                      [{string_2,
                                                        1,
                                                        lang:get("极速滑雪")}]),
                                    notice:send(Role, 3, Msg),
                                    {ok, update(Role1, [])};
                                _ ->
                                    NewRewarded = case lists:keyfind(NewDone,
                                                                     1,
                                                                     Rewarded1)
                                                      of
                                                      {_, RewardTimes} ->
                                                          lists:keystore(NewDone,
                                                                         1,
                                                                         Rewarded1,
                                                                         {NewDone,
                                                                          RewardTimes
                                                                              +
                                                                              1});
                                                      _ ->
                                                          [{NewDone, 1}
                                                           | Rewarded1]
                                                  end,
                                    DoneRole = Role#role{m_camp_dragon_boat =
                                                             DragonBoat#m_camp_dragon_boat{done
                                                                                               =
                                                                                               NewDone,
                                                                                           start_time
                                                                                               =
                                                                                               StartTime,
                                                                                           rewarded
                                                                                               =
                                                                                               NewRewarded,
                                                                                           rewarded_time
                                                                                               =
                                                                                               Now,
                                                                                           fought
                                                                                               =
                                                                                               0,
                                                                                           time_span
                                                                                               =
                                                                                               TimeSpan}},
                                    Role1 = case NewDone of
                                                8 ->
                                                    EventRole =
                                                        DoneRole#role{s_event =
                                                                          0},
                                                    map:role_update(EventRole),
                                                    EventRole;
                                                _ -> DoneRole
                                            end,
                                    {Reward, AnnItem} =
                                        get_checkin_reward(Role1, NewDone),
                                    Gain = format:val_to_gain(Reward),
                                    case role_gain:do_notice(Gain, Role1) of
                                        {ok, NewRole} ->
                                            case AnnItem of
                                                [] -> ok;
                                                _ when NewDone =:= 8 ->
                                                    AnnStr =
                                                        notice:format(lang:get("~ts在~ts中以胜利者的姿态抵达终点，惊喜地获得~ts{face_1,15}"),
                                                                      [{role_2,
                                                                        Name},
                                                                       {string_2,
                                                                        1,
                                                                        lang:get("极速滑雪")},
                                                                       {item_2,
                                                                        AnnItem}]),
                                                    notice:cast(all, 5, AnnStr);
                                                _ ->
                                                    logger:debug("Dragon Boat 1",
                                                                 [],
                                                                 camp_dragon_boat,
                                                                 268),
                                                    AnnStr =
                                                        notice:format(lang:get("~ts在~ts中雪橇一甩，翻出了一个漂亮的托马斯大回旋，竟带起一件~ts{face_1,10}"),
                                                                      [{role_2,
                                                                        Name},
                                                                       {string_2,
                                                                        1,
                                                                        lang:get("极速滑雪")},
                                                                       {item_2,
                                                                        AnnItem}]),
                                                    notice:cast(all, 5, AnnStr)
                                            end,
                                            {ok, update(NewRole, Reward)};
                                        {false, #gain{msg = Msg2}} ->
                                            {false, Msg2}
                                    end
                            end;
                        #{} -> {false, lang:get("距离太远")};
                        _ -> {false, lang:get("你已完成比赛")}
                    end;
                _ ->
                    Msg = notice:format(lang:get("队伍人数不足~ts人，无法完成比赛"),
                                        [{string_2, 1, 3}]),
                    {false, Msg}
            end;
        _ -> {false, lang:get("比赛还未开始，请耐心等待")}
    end;
checkin(_) ->
    {false,
     notice:format(lang:get("请前往~ts处报名吧！{face_1,25}"),
                   [{string_2, 5, lang:get("圣心城-龙猫冒险家")}])}.

rpc_get_rank_info(#role{id = Id}) ->
    RankList = ets:tab2list(dragon_boat_team_rank),
    Fun = fun (#dragon_boat_team{id = TeamId, rank = Rank},
               Rtn) ->
                  case lists:member(Id, TeamId) of
                      true -> Rank;
                      _ -> Rtn
                  end
          end,
    SelfRank = lists:foldl(Fun, 0, RankList),
    Reply = {RankList, SelfRank},
    {ok, Reply}.

combat_over(Role = #role{m_camp_dragon_boat =
                             DragonBoat = #m_camp_dragon_boat{fought = Fought,
                                                              done = Done,
                                                              start_time =
                                                                  StartTime0}},
            win, Round, Loser) ->
    {MinusSecs, MinusStr} = calc_minus_secs(Loser),
    StartTime = StartTime0 + MinusSecs,
    Words = case Done =:= 7 andalso MinusSecs =:= 0 of
                true -> lang:get("战斗获胜，快向终点全力冲刺吧{face_1,7}");
                _ when Done =:= 7 andalso MinusSecs < 0 ->
                    notice:format(lang:get("战斗获胜，击败~ts，累计增加时间~ts秒{face_1,18}"),
                                  [{string_1, MinusStr},
                                   {string_2, 5, abs(MinusSecs)}]);
                _ when Done =:= 7 ->
                    notice:format(lang:get("战斗获胜，击败~ts，累计减少时间~ts秒{face_1,18}"),
                                  [{string_1, MinusStr},
                                   {string_2, 5, MinusSecs}]);
                _ when Round > 3 ->
                    notice:format(lang:get("滑雪队晕头转向，躲避障碍雪堆过程中~ts{face_1,39}"),
                                  [{string_2, 5, lang:get("耽误了一些时间")}]);
                _ ->
                    notice:format(lang:get("滑雪队一路狂飙、躲开大量障碍雪堆，精妙的躲避~ts！{face_1,38}"),
                                  [{string_2, 5, lang:get("节省了大量时间")}])
            end,
    case dragon_boat_data:get(Done + 1) of
        #{base_id := BaseId} ->
            notice:npc_talk(Role, BaseId, Words);
        _ -> ok
    end,
    case team:get_status(Role) of
        {true, 1} ->
            Role1 = Role#role{m_camp_dragon_boat =
                                  DragonBoat#m_camp_dragon_boat{fought =
                                                                    Fought + 1,
                                                                start_time =
                                                                    StartTime}},
            team:leader_async(Role1,
                              {camp_dragon_boat,
                               role_callback,
                               [{sync_team, Done, Fought + 1, StartTime}]}),
            push(Role1, 19900),
            case Done =:= 7 of
                true -> team:notice(Role1, Words);
                _ -> ok
            end,
            Role1;
        _ -> Role
    end;
combat_over(Role = #role{m_camp_dragon_boat =
                             DragonBoat = #m_camp_dragon_boat{done = Done,
                                                              start_time =
                                                                  StartTime},
                         name = Name},
            _WinOrLose, _Round, _) ->
    case team:get_status(Role) of
        {true, 1} ->
            Role1 = Role#role{m_camp_dragon_boat =
                                  DragonBoat#m_camp_dragon_boat{fought = 0}},
            team:leader_async(Role1,
                              {camp_dragon_boat,
                               role_callback,
                               [{sync_team, Done, 0, StartTime}]}),
            team:notice(Role,
                        lang:get("不小心被怪物埋伏了，有惊无险，继续前进吧{face_1,30}")),
            push(Role1, 19900),
            case dragon_boat_data:get(Done) of
                #{map_id := MapId, x := X, y := Y} ->
                    case map:role_enter({MapId,
                                         X + util:rand(50, 60),
                                         Y + util:rand(27, 37)},
                                        Role1)
                        of
                        {error, Reason} ->
                            logger:error("[~s]进入地图失败:~w",
                                         [Name, Reason],
                                         camp_dragon_boat,
                                         360),
                            Role1;
                        {ok, Role3} ->
                            NewRole = Role3,
                            map:role_update(NewRole),
                            NewRole
                    end;
                _ -> Role1
            end;
        _ -> Role
    end.

role_callback(Role = #role{m_camp_dragon_boat =
                               DragonBoat = #m_camp_dragon_boat{triggers =
                                                                    Triggers}},
              {sync_team, Done, Fought, StartTime}) ->
    case team:get_status(Role) of
        {true, 2} ->
            {Role1, NewTriggers} = add_trigger([evt_team_appoint,
                                                evt_team_leave],
                                               Role,
                                               Triggers),
            Role2 = Role1#role{s_event = 23,
                               m_camp_dragon_boat =
                                   DragonBoat#m_camp_dragon_boat{done = Done,
                                                                 triggers =
                                                                     NewTriggers,
                                                                 start_time =
                                                                     StartTime,
                                                                 fought =
                                                                     Fought}},
            push(Role2, 19900),
            map:role_update(Role2),
            {ok, Role2};
        _ -> ok
    end;
role_callback(Role = #role{m_camp_dragon_boat =
                               DragonBoat = #m_camp_dragon_boat{triggers =
                                                                    Triggers}},
              {sync_sign, Done, Fought, _StartTime}) ->
    case team:get_status(Role) of
        {true, 2} ->
            {Role1, NewTriggers} = add_trigger([evt_team_appoint,
                                                evt_team_leave],
                                               Role,
                                               Triggers),
            Role2 = Role1#role{s_event = 23,
                               m_camp_dragon_boat =
                                   DragonBoat#m_camp_dragon_boat{done = Done,
                                                                 triggers =
                                                                     NewTriggers,
                                                                 start_time = 0,
                                                                 fought =
                                                                     Fought,
                                                                 time_span =
                                                                     0}},
            npc_talk(Role, 0),
            map:role_update(Role2),
            {ok, Role2};
        _ -> ok
    end;
role_callback(Role = #role{m_camp_dragon_boat =
                               DragonBoat = #m_camp_dragon_boat{rewarded =
                                                                    Rewarded,
                                                                rewarded_time =
                                                                    Last},
                           s_event = 23, name = Name},
              {checkin, NewDone, TimeSpan}) ->
    Now = date:unixtime(),
    Rewarded1 = case date:is_same_day(Last, Now) of
                    true -> Rewarded;
                    _ -> []
                end,
    logger:debug("获取的物品：~w",
                 [Rewarded1],
                 camp_dragon_boat,
                 422),
    case team:get_status(Role) of
        {true, 2} ->
            DragonBoat1 = DragonBoat#m_camp_dragon_boat{done =
                                                            NewDone,
                                                        fought = 0,
                                                        time_span = TimeSpan},
            Event = case TimeSpan of
                        0 -> 23;
                        _ -> 0
                    end,
            case lists:keyfind(NewDone, 1, Rewarded1) of
                {_, RewardTimes} when RewardTimes >= 2 ->
                    Role1 = Role#role{s_event = Event,
                                      m_camp_dragon_boat =
                                          DragonBoat1#m_camp_dragon_boat{rewarded
                                                                             =
                                                                             Rewarded1}},
                    Msg = notice:format(lang:get("你今天已经参与过2次~ts活动，无法再获得奖励"),
                                        [{string_2, 1, lang:get("极速滑雪")}]),
                    notice:send(Role, 3, Msg),
                    {ok, update(Role1, [])};
                _ ->
                    NewRewarded = case lists:keyfind(NewDone, 1, Rewarded1)
                                      of
                                      {_, RewardTimes} ->
                                          lists:keystore(NewDone,
                                                         1,
                                                         Rewarded1,
                                                         {NewDone,
                                                          RewardTimes + 1});
                                      _ -> [{NewDone, 1} | Rewarded1]
                                  end,
                    DoneRole = Role#role{s_event = Event,
                                         m_camp_dragon_boat =
                                             DragonBoat1#m_camp_dragon_boat{rewarded
                                                                                =
                                                                                NewRewarded,
                                                                            rewarded_time
                                                                                =
                                                                                Now}},
                    Role1 = case NewDone of
                                8 ->
                                    EventRole = DoneRole#role{s_event = 0},
                                    map:role_update(EventRole),
                                    EventRole;
                                _ -> DoneRole
                            end,
                    {Reward, AnnItem} = get_checkin_reward(Role1, NewDone),
                    Gain = format:val_to_gain(Reward),
                    case role_gain:do_notice(Gain, Role1) of
                        {ok, NewRole} ->
                            case AnnItem of
                                [] -> ok;
                                _ when NewDone =:= 8 ->
                                    AnnStr =
                                        notice:format(lang:get("~ts在~ts中以胜利者的姿态抵达终点，惊喜地获得~ts{face_1,15}"),
                                                      [{role_2, Name},
                                                       {string_2,
                                                        1,
                                                        lang:get("极速滑雪")},
                                                       {item_2, AnnItem}]),
                                    notice:cast(all, 5, AnnStr);
                                _ ->
                                    logger:debug("Dragon Boat 2",
                                                 [],
                                                 camp_dragon_boat,
                                                 484),
                                    AnnStr =
                                        notice:format(lang:get("~ts在~ts中雪橇一甩，翻出了一个漂亮的托马斯大回旋，竟带起一件~ts{face_1,10}"),
                                                      [{role_2, Name},
                                                       {string_2,
                                                        1,
                                                        lang:get("极速滑雪")},
                                                       {item_2, AnnItem}]),
                                    notice:cast(all, 5, AnnStr)
                            end,
                            {ok, update(NewRole, Reward)};
                        {false, #gain{reason = bag_full, msg = Msg2}} ->
                            NewRole = Role1,
                            notice:send(NewRole, 3, Msg2),
                            case AnnItem of
                                [] -> ok;
                                _ when NewDone =:= 8 ->
                                    AnnStr =
                                        notice:format(lang:get("~ts在~ts中以胜利者的姿态抵达终点，惊喜地获得~ts{face_1,15}"),
                                                      [{role_2, Name},
                                                       {string_2,
                                                        1,
                                                        lang:get("极速滑雪")},
                                                       {item_2, AnnItem}]),
                                    notice:cast(all, 5, AnnStr);
                                _ ->
                                    logger:debug("Dragon Boat 3",
                                                 [],
                                                 camp_dragon_boat,
                                                 500),
                                    AnnStr =
                                        notice:format(lang:get("~ts在~ts中雪橇一甩，翻出了一个漂亮的托马斯大回旋，竟带起一件~ts{face_1,10}"),
                                                      [{role_2, Name},
                                                       {string_2,
                                                        1,
                                                        lang:get("极速滑雪")},
                                                       {item_2, AnnItem}]),
                                    notice:cast(all, 5, AnnStr)
                            end,
                            Title = lang:get("极速滑雪"),
                            Content = lang:get("背包已满，这是滑雪的过关奖励，请查收。"),
                            mail:send(NewRole,
                                      #{title => Title, content => Content,
                                        items => Reward}),
                            {ok, update(NewRole, Reward)};
                        {false, #gain{msg = Msg2}} ->
                            NewRole = Role#role{s_event = Event,
                                                m_camp_dragon_boat =
                                                    DragonBoat1},
                            notice:send(NewRole, 3, Msg2),
                            {ok, update(NewRole, [])}
                    end
            end;
        _ -> ok
    end;
role_callback(_, {checkin, _, _}) -> ok;
role_callback(Role = #role{m_camp_dragon_boat =
                               Brave = #m_camp_dragon_boat{triggers = Triggers},
                           s_event = 23},
              clear) ->
    {Role1, NewTriggers} = remove_trigger(all,
                                          Triggers,
                                          Role),
    Role2 = Role1#role{s_event = 0,
                       m_camp_dragon_boat =
                           Brave#m_camp_dragon_boat{start_time = 0, done = 0,
                                                    triggers = NewTriggers}},
    push(Role2, 19900),
    map:role_update(Role2),
    {ok, Role2};
role_callback(_, clear) -> ok.

evt_callback(_Evt = #evt_move_map{base_id = _BaseId},
             Role = #role{m_camp_dragon_boat =
                              #m_camp_dragon_boat{done = Done, fought = Fought},
                          s_event = 23}) ->
    case dragon_boat_data:get(Done + 1) of
        #{enemy := UnitList, max_fight := MaxFight,
          min_fight := Min}
            when MaxFight > Fought ->
            Flag = case team:get_status(Role) of
                       {true, 1} -> true;
                       false -> true;
                       _ -> false
                   end,
            case Flag of
                true ->
                    case get(hook_patrol_move) of
                        undefined ->
                            put(hook_patrol_move, 1),
                            ok;
                        Step when Step < 15 ->
                            put(hook_patrol_move, Step + 1),
                            ok;
                        Step ->
                            case util:rand(1, 100) =< 50 of
                                true ->
                                    {UnitId, _} = util:rand_list(UnitList),
                                    start_combat(Role, UnitId);
                                _ when Step >= 30 andalso Fought < Min ->
                                    {UnitId, _} = util:rand_list(UnitList),
                                    start_combat(Role, UnitId);
                                _ ->
                                    put(hook_patrol_move, Step + 1),
                                    ok
                            end
                    end;
                false -> ok
            end;
        _ -> ok
    end;
evt_callback(_Evt = #evt_team_leave{},
             Role = #role{m_camp_dragon_boat = DragonBoat}) ->
    Role2 = Role#role{s_event = 0,
                      m_camp_dragon_boat =
                          DragonBoat#m_camp_dragon_boat{start_time = 0,
                                                        fought = 0}},
    NewRole = cancel_team_mark(Role2),
    push(NewRole, 19900),
    map:role_update(NewRole),
    {ok, NewRole};
evt_callback(#evt_team_appoint{status = 1},
             Role = #role{m_camp_dragon_boat =
                              DragonBoat = #m_camp_dragon_boat{triggers =
                                                                   Triggers}}) ->
    {Role1, NewTriggers} = add_trigger([evt_move_map],
                                       Role,
                                       Triggers),
    TriggerRole = Role1#role{m_camp_dragon_boat =
                                 DragonBoat#m_camp_dragon_boat{triggers =
                                                                   NewTriggers}},
    NewRole = case achieve_shop:set_team_mark(TriggerRole,
                                              407)
                  of
                  {ok, TeamMarkRole} ->
                      achieve_shop:push_teammark(TeamMarkRole),
                      map:role_update(TeamMarkRole),
                      TeamMarkRole;
                  _ -> TriggerRole
              end,
    {ok, NewRole};
evt_callback(#evt_team_appoint{},
             Role = #role{m_camp_dragon_boat =
                              DragonBoat = #m_camp_dragon_boat{triggers =
                                                                   Triggers}}) ->
    {Role1, NewTriggers} = remove_trigger([evt_move_map],
                                          Triggers,
                                          Role),
    TriggerRole = Role1#role{m_camp_dragon_boat =
                                 DragonBoat#m_camp_dragon_boat{triggers =
                                                                   NewTriggers}},
    NewRole = cancel_team_mark(TriggerRole),
    {ok, NewRole};
evt_callback(_Evt, _Role) ->
    logger:debug("未知事件回调 ~w",
                 [_Evt],
                 camp_dragon_boat,
                 642),
    ok.

push(#role{m_camp_dragon_boat = DragonBoat,
           link = #link{conn_pid = ConnPid}},
     Cmd = 19900) ->
    sys_conn:pack_send(ConnPid, Cmd, {DragonBoat});
push(#role{link = #link{conn_pid = ConnPid}},
     Cmd = 19901) ->
    CampId = campaign_mgr:get_camp_id(60043),
    MatchInfo = case env:get(camp_dragon_boat_status) of
                    {sign, EndTime} -> {1, EndTime, CampId};
                    {match, EndTime} -> {2, EndTime, CampId};
                    _ -> {0, 0, CampId}
                end,
    logger:debug("~w", [MatchInfo], camp_dragon_boat, 656),
    sys_conn:pack_send(ConnPid, Cmd, MatchInfo);
push(#role{link = #link{conn_pid = ConnPid}},
     {Cmd = 19905, TimeSpan, Reward}) ->
    sys_conn:pack_send(ConnPid, Cmd, {TimeSpan, Reward}).

gm(Info) -> camp_dragon_boat ! Info.

start_link() ->
    gen_fsm:start_link({local, camp_dragon_boat},
                       camp_dragon_boat,
                       [],
                       []).

init([]) ->
    logger:info("开始启动...", [], camp_dragon_boat, 672),
    ets:new(dragon_boat_role,
            [set,
             named_table,
             public,
             {keypos, #dragon_boat_role.id}]),
    ets:new(dragon_boat_team,
            [set,
             named_table,
             public,
             {keypos, #dragon_boat_team.id}]),
    ets:new(dragon_boat_team_rank,
            [set,
             named_table,
             public,
             {keypos, #dragon_boat_team.id}]),
    {StateName, Timeout} = get_state(),
    Units = case StateName of
                active ->
                    DailyRef = erlang:send_after(date:next_diff({0, 0, 1}),
                                                 camp_dragon_boat,
                                                 daily_refresh),
                    put(daily_ref, DailyRef),
                    create_units(dragon_boat_data:list());
                _ -> []
            end,
    State = #state{ts = now(), timeout = Timeout,
                   units = Units},
    logger:info("启动完成 state_name: ~w, timeout: ~w",
                [StateName, Timeout],
                camp_dragon_boat,
                694),
    {ok, StateName, State, Timeout}.

handle_event(_Event, StateName, State) ->
    logger:error("未知消息 ~w",
                 [_Event],
                 camp_dragon_boat,
                 698),
    continue(StateName, State).

handle_sync_event(_Event, _From, StateName, State) ->
    logger:error("未知消息 ~w",
                 [_Event],
                 camp_dragon_boat,
                 702),
    Reply = false,
    continue(Reply, StateName, State).

handle_info(reload, _StateName, _State) ->
    {StateName, Timeout} = get_state(),
    Units = case StateName of
                active ->
                    DailyRef = erlang:send_after(date:next_diff({0, 0, 1}),
                                                 camp_dragon_boat,
                                                 daily_refresh),
                    put(daily_ref, DailyRef),
                    create_units(dragon_boat_data:list());
                _ -> []
            end,
    State = #state{ts = now(), timeout = Timeout,
                   units = Units},
    logger:info("重载完成 state_name: ~w, timeout: ~w",
                [StateName, Timeout],
                camp_dragon_boat,
                721),
    continue(StateName, State);
handle_info(announce, match, State) ->
    case erlang:time() of
        {H, _, _} when H =< 9 orelse H >= 23 -> ok;
        _ -> update_rank(announce)
    end,
    case erlang:get(announce_ref) of
        OldAnnRef when is_reference(OldAnnRef) ->
            erlang:cancel_timer(OldAnnRef);
        _ -> ok
    end,
    AnnRef = erlang:send_after(180000, self(), announce),
    erlang:put(announce_ref, AnnRef),
    continue(match, State);
handle_info(announce, StateName, State) ->
    continue(StateName, State);
handle_info(daily_refresh, idle, State) ->
    continue(idle, State);
handle_info(daily_refresh, StateName, State) ->
    env:del(dragon_boat_rank_reward_roles),
    case get(daily_ref) of
        Ref when is_reference(Ref) -> erlang:cancel_timer(Ref);
        _ -> ok
    end,
    DailyRef = erlang:send_after(date:next_diff({0, 0, 1}),
                                 camp_dragon_boat,
                                 daily_refresh),
    put(daily_ref, DailyRef),
    continue(StateName, State);
handle_info(update_rank, match, State) ->
    update_rank(final),
    continue(match, State);
handle_info(update_rank, StateName, State) ->
    continue(StateName, State);
handle_info({sync_rank,
             Team = #dragon_boat_team{members = Members,
                                      leader_name = LeaderName}},
            StateName, State) ->
    case ets:match_object(dragon_boat_team,
                          #dragon_boat_team{leader_name = LeaderName, _ = '_'})
        of
        [] -> ok;
        Teams ->
            [ets:delete(dragon_boat_team, Id)
             || #dragon_boat_team{id = Id} <- Teams]
    end,
    ets:insert(dragon_boat_team, Team),
    update_role_rank(Members),
    continue(StateName, State);
handle_info(_Info, StateName, State) ->
    logger:error("未知消息 ~w", [_Info], camp_dragon_boat, 771),
    continue(StateName, State).

terminate(_Reason, _StateName, _State) -> ok.

code_change(_OldVsn, StateName, State, _Extra) ->
    {ok, StateName, State}.

idle(timeout, State) ->
    {StateName, TimeOut} = get_state(),
    case StateName of
        active ->
            DailyRef = erlang:send_after(date:next_diff({0, 0, 1}),
                                         camp_dragon_boat,
                                         daily_refresh),
            put(daily_ref, DailyRef),
            create_units(dragon_boat_data:list());
        _ -> ok
    end,
    NewState = State#state{ts = now(), timeout = TimeOut},
    continue(StateName, NewState);
idle(_, State) -> continue(idle, State).

active(timeout, State) ->
    logger:debug("赛龙舟活动进入准备", [], camp_dragon_boat, 805),
    Now = date:unixtime(),
    {_, EndTime} = campaign_mgr:get_camp_time(60043),
    {StateName, TimeOut} = case Now >= EndTime of
                               true -> {idle, infinity};
                               false ->
                                   NowSecs = date:seconds_of_the_day(),
                                   CampId = campaign_mgr:get_camp_id(60043),
                                   case get_match_time() of
                                       {_SignT, StartT, _EndT}
                                           when StartT >= NowSecs ->
                                           CampEndTime = Now + StartT - NowSecs,
                                           logger:debug("过期时间戳:~w",
                                                        [CampEndTime],
                                                        camp_dragon_boat,
                                                        819),
                                           env:set(camp_dragon_boat_status,
                                                   {sign, CampEndTime}),
                                           role_group:pack_send(world,
                                                                19901,
                                                                {1,
                                                                 CampEndTime,
                                                                 CampId}),
                                           Msg =
                                               notice:format(lang:get("~ts活动将于~ts后开启，请抓紧时间报名啦{face_1, 7}"),
                                                             [{string_2,
                                                               2,
                                                               lang:get("极速滑雪")},
                                                              {string_2,
                                                               1,
                                                               lang:get("10分钟")}]),
                                           notice:cast(all, 8, Msg),
                                           logger:debug("赛龙舟活动进入准备",
                                                        [],
                                                        camp_dragon_boat,
                                                        826),
                                           {sign, (StartT - NowSecs) * 1000};
                                       _Else ->
                                           case 1 of
                                               1 ->
                                                   CampEndTime = Now + 600,
                                                   logger:debug("过期时间戳:~w",
                                                                [CampEndTime],
                                                                camp_dragon_boat,
                                                                833),
                                                   env:set(camp_dragon_boat_status,
                                                           {sign, CampEndTime}),
                                                   role_group:pack_send(world,
                                                                        19901,
                                                                        {1,
                                                                         CampEndTime,
                                                                         CampId}),
                                                   Msg =
                                                       notice:format(lang:get("~ts活动将于~ts后开启，请抓紧时间报名啦{face_1, 7}"),
                                                                     [{string_2,
                                                                       2,
                                                                       lang:get("极速滑雪")},
                                                                      {string_2,
                                                                       1,
                                                                       lang:get("10分钟")}]),
                                                   notice:cast(all, 8, Msg),
                                                   {sign, 600000};
                                               _ ->
                                                   case get_next_match_time() of
                                                       {SignT, _, _} ->
                                                           logger:info("当前没有比赛:~w:~w",
                                                                       [_Else,
                                                                        NowSecs],
                                                                       camp_dragon_boat,
                                                                       845),
                                                           {active,
                                                            (SignT - NowSecs) *
                                                                1000};
                                                       false ->
                                                           logger:error("活动配置错误:~w",
                                                                        [dragon_boat_data:list_time()],
                                                                        camp_dragon_boat,
                                                                        848),
                                                           {idle, infinity}
                                                   end
                                           end
                                   end
                           end,
    NewState = State#state{ts = now(), timeout = TimeOut},
    continue(StateName, NewState);
active(_, State) -> continue(active, State).

sign(timeout, State) ->
    NowSecs = date:seconds_of_the_day(),
    CampId = campaign_mgr:get_camp_id(60043),
    {StateName, TimeOut} = case get_match_time() of
                               {_SignT, StartT, EndT} when NowSecs =< StartT ->
                                   {match, EndT - NowSecs};
                               _ -> {match, 1200}
                           end,
    MatchIndex = get_match_index(),
    Msg =
        notice:format(lang:get("~ts~ts活动正式开始，缤纷瑞雪勇士速滑，看谁能夺得第一{face_1, "
                               "18}"),
                      [{string_2, 2, lang:get("极速滑雪")},
                       {string_2, 1, MatchIndex}]),
    notice:cast(all, 8, Msg),
    Now = date:unixtime(),
    env:set(dragon_boat_start_time, Now),
    EndTime = Now + TimeOut,
    env:set(camp_dragon_boat_status, {match, EndTime}),
    role_group:pack_send(world,
                         19901,
                         {2, EndTime, CampId}),
    role_group:apply(world,
                     {camp_dragon_boat, reset_start_time, []}),
    AnnRef = erlang:send_after(180000, self(), announce),
    erlang:put(announce_ref, AnnRef),
    ets:delete_all_objects(dragon_boat_team_rank),
    NewState = State#state{ts = now(),
                           timeout = TimeOut * 1000},
    continue(StateName, NewState);
sign(_, State) -> continue(match, State).

reset_start_time(Role = #role{m_camp_dragon_boat =
                                  MDragonBoat = #m_camp_dragon_boat{}}) ->
    NRole = Role#role{m_camp_dragon_boat =
                          MDragonBoat#m_camp_dragon_boat{start_time =
                                                             date:unixtime(),
                                                         done = 0}},
    push(NRole, 19900),
    {ok, NRole}.

match(timeout, State) ->
    {StateName, TimeOut} = get_state(),
    NewState = State#state{ts = now(), timeout = TimeOut},
    env:set(camp_dragon_boat_status, {idle, 0}),
    CampId = campaign_mgr:get_camp_id(60043),
    role_group:pack_send(world, 19901, {0, 0, CampId}),
    Fun = fun (#dragon_boat_role{id = RoleId}, _) ->
                  role:apply(async,
                             RoleId,
                             {camp_dragon_boat, role_callback, [clear]})
          end,
    ets:foldl(Fun, ok, dragon_boat_role),
    update_rank(final),
    continue(StateName, NewState);
match(_, State) -> continue(active, State).

get_state() ->
    Now = date:unixtime(),
    {Start, End} = campaign_mgr:get_camp_time(60043),
    {StateName, Timeout} = case Start > Now of
                               true -> {idle, Start - Now};
                               _ when End > Now ->
                                   NowSecs = date:seconds_of_the_day(),
                                   case get_next_match_time() of
                                       {SignT, _StartT, _EndT} ->
                                           NextSec = SignT - NowSecs,
                                           {active, NextSec};
                                       _ ->
                                           OpenTimeList =
                                               dragon_boat_data:list_time(),
                                           case OpenTimeList of
                                               [{FirstSignT,
                                                 _FistStartT,
                                                 _FisrtEndT}
                                                | _] ->
                                                   NextSec = min(End - Now,
                                                                 FirstSignT -
                                                                     NowSecs
                                                                     + 86400),
                                                   {active, NextSec};
                                               _ -> {active, End - Now}
                                           end
                                   end;
                               _ -> {idle, infinity}
                           end,
    case Timeout of
        infinity -> {StateName, Timeout};
        _ -> {StateName, Timeout * 1000}
    end.

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

check_sign([], _) -> true;
check_sign([time | T], Role) ->
    {Start, End} = campaign_mgr:get_camp_time(60043),
    Now = date:unixtime(),
    logger:debug("Now:~w,Start:~w,End:~w",
                 [Now, Start, End],
                 camp_dragon_boat,
                 989),
    case Now >= Start andalso Now < End of
        true ->
            case env:get(camp_dragon_boat_status) of
                {sign, _} -> check_sign(T, Role);
                {match, _} ->
                    Msg =
                        notice:format(lang:get("极速滑雪活动将在~ts开启，请提前十分钟报名参加{face_1,1}"),
                                      [{string_2,
                                        1,
                                        lang:get("14：00、14：30、16：00、16：30、18：00、18：30")}]),
                    {false, Msg};
                _ ->
                    Msg =
                        notice:format(lang:get("极速滑雪活动将在~ts开启，请提前十分钟报名参加{face_1,1}"),
                                      [{string_2,
                                        1,
                                        lang:get("14：00、14：30、16：00、16：30、18：00、18：30")}]),
                    {false, Msg}
            end;
        _ when Start > Now ->
            Msg = lang:get("活动尚未开启，敬请期待哟{fae_1,3}"),
            {false, Msg};
        _ ->
            Msg = lang:get("活动已结束，感谢您的参与{fae_1,3}"),
            notice:npc_talk(Role, 21006, Msg),
            {false, Msg}
    end;
check_sign([status | _T], #role{s_ride = 1}) ->
    {false, lang:get("飞行中不能参与")};
check_sign([status | T], Role) -> check_sign(T, Role);
check_sign([event | T], Role) ->
    case role_misc:check_event(Role) of
        true -> check_sign(T, Role);
        Else -> Else
    end;
check_sign([distance | T],
           Role = #role{pos = #pos{map = MapId, x = X, y = Y}}) ->
    case dragon_boat_data:get(0) of
        #{map_id := MapId, x := DestX, y := DestY}
            when abs(X - DestX) < 500 andalso Y - DestY < 500 ->
            check_sign(T, Role);
        _Ret -> {false, lang:get("距离太远")}
    end;
check_sign([team | T], Role) ->
    case team:get_members_follow_num(Role) of
        N when is_integer(N) andalso N >= 3 ->
            check_sign(T, Role);
        _Ret ->
            {false,
             notice:format(lang:get("需要组队~ts人才能组成滑雪队"),
                           [{string_2, 1, 3}])}
    end;
check_sign([teammate_lev | T],
           Role = #role{lev = Lev, name = LeaderName}) ->
    Result = case Lev >= 30 of
                 true ->
                     do_check_teammate_lev(team:get_members(Role), []);
                 _ ->
                     do_check_teammate_lev(team:get_members(Role),
                                           [LeaderName])
             end,
    case Result of
        true -> check_sign(T, Role);
        {false, FaillNameList} ->
            FormatStr =
                string:join(lists:duplicate(length(FaillNameList),
                                            "~ts"),
                            "、"),
            NameList = [{string_1, Name} || Name <- FaillNameList],
            NameStr = notice:format(FormatStr, NameList),
            Msg =
                notice:format(lang:get("滑雪需要大量的体力输出，<color='#7FFF00'>~ts</color> "
                                       "等级不足<color='#ffff00'>~ts</color>呢，请前往升级再来报名吧！"
                                       "{face_1,3}"),
                              [{string_1, NameStr}, {string_1, 30}]),
            {false, Msg};
        _ -> {false, lang:get("未知错误")}
    end.

do_check_teammate_lev([], []) -> true;
do_check_teammate_lev([], FailNameList) ->
    {false, lists:reverse(FailNameList)};
do_check_teammate_lev([#team_mate{status = 3} | T],
                      FailNameList) ->
    do_check_teammate_lev(T, FailNameList);
do_check_teammate_lev([#team_mate{lev = Lev,
                                  name = Name}
                       | T],
                      FailNameList) ->
    case Lev >= 30 of
        true -> do_check_teammate_lev(T, FailNameList);
        _ -> do_check_teammate_lev(T, [Name | FailNameList])
    end.

add_trigger([], Role, Triggers) -> {Role, Triggers};
add_trigger([Label | T], Role, Triggers) ->
    case lists:keyfind(Label, 1, Triggers) of
        {Label, _} -> add_trigger(T, Role, Triggers);
        _ ->
            {TriId, Role1} = role_trigger:add(#trigger{label =
                                                           Label,
                                                       m = camp_dragon_boat,
                                                       f = evt_callback,
                                                       a = []},
                                              Role),
            add_trigger(T, Role1, [TriId | Triggers])
    end.

remove_trigger(all, Triggers, Role) ->
    Role0 = role_trigger:del(Triggers, Role),
    {Role0, []};
remove_trigger(Labels, Triggers, Role) ->
    TriIds = [Tid
              || Tid = {Lb, _} <- Triggers, lists:member(Lb, Labels)],
    Role0 = role_trigger:del(TriIds, Role),
    {Role0,
     [One
      || One = {OLb, _} <- Triggers,
         lists:member(OLb, Labels) =:= false]}.

create_units([]) -> [];
create_units([Id | T]) ->
    case dragon_boat_data:get(Id) of
        #{base_id := BaseId, map_id := Map, x := X, y := Y} ->
            {ok, #unit{id = UId}} = unit_mgr:create({28, BaseId},
                                                    BaseId,
                                                    {Map, X, Y}),
            [UId | create_units(T)];
        _ ->
            logger:error("找不到单位配置 ~w",
                         [Id],
                         camp_dragon_boat,
                         1114),
            create_units(T)
    end.

start_combat(Role, UnitId) ->
    put(hook_patrol_move, 0),
    case team:get_fighters(Role) of
        {ok, Mates} ->
            case combat_mgr:check_self(37, Role) of
                true ->
                    logger:debug("UnitId:~w",
                                 [UnitId],
                                 camp_dragon_boat,
                                 1125),
                    case combat_mgr:start_combat(37,
                                                 Mates,
                                                 [{unit_baseid, UnitId}])
                        of
                        {ok, _} ->
                            Msg =
                                notice:format(lang:get("划雪的过程中遇到了~ts{face_1,39}"),
                                              [{string_2,
                                                5,
                                                lang:get("障碍雪堆")}]),
                            team:notice(Role, Msg),
                            ok;
                        _Err ->
                            logger:debug("暗雷战斗发起失败:~w",
                                         [_Err],
                                         camp_dragon_boat,
                                         1133),
                            ok
                    end;
                {false, _Reason} -> ok
            end;
        _ -> ok
    end.

update(Role = #role{m_camp_dragon_boat =
                        DragonBoat = #m_camp_dragon_boat{done = Done,
                                                         triggers = Triggers,
                                                         time_span = TimeSpan},
                    m_team = #m_team{pid = TeamPid, status = 1}},
       Reward)
    when is_pid(TeamPid) ->
    npc_talk(Role, Done),
    logger:debug("更新角色龙舟信息：~w",
                 [TimeSpan],
                 camp_dragon_boat,
                 1146),
    case Done of
        8 ->
            {Role1, NewTriggers} = remove_trigger(all,
                                                  Triggers,
                                                  Role),
            Role2 = Role1#role{s_event = 0,
                               m_camp_dragon_boat =
                                   DragonBoat#m_camp_dragon_boat{start_time = 0,
                                                                 triggers =
                                                                     NewTriggers}},
            push(Role2#role{m_camp_dragon_boat =
                                DragonBoat#m_camp_dragon_boat{done = Done}},
                 19900),
            team:leader_async(Role2,
                              {camp_dragon_boat,
                               role_callback,
                               [{checkin, Done, TimeSpan}]}),
            map:role_update(Role2),
            sync_rank(Role2),
            push_result(Role2, Reward),
            Evts = [#evt_dragon_boat{camp_id = get_camp_id()},
                    #evt_dragon_boat_cplt{camp_id = get_camp_id(),
                                          time_span = TimeSpan}],
            TriggerRole = role_trigger:fire(Evts, Role2),
            cancel_team_mark(TriggerRole);
        _ ->
            push(Role, 19900),
            team:leader_async(Role,
                              {camp_dragon_boat,
                               role_callback,
                               [{checkin, Done, 0}]}),
            sync_rank(Role),
            Role
    end;
update(Role = #role{m_camp_dragon_boat =
                        DragonBoat = #m_camp_dragon_boat{done = Done,
                                                         triggers = Triggers,
                                                         time_span = TimeSpan}},
       Reward) ->
    npc_talk(Role, Done),
    case Done of
        8 ->
            {Role1, NewTriggers} = remove_trigger(all,
                                                  Triggers,
                                                  Role),
            Role2 = Role1#role{s_event = 0,
                               m_camp_dragon_boat =
                                   DragonBoat#m_camp_dragon_boat{start_time = 0,
                                                                 triggers =
                                                                     NewTriggers}},
            push(Role2, 19900),
            push_result(Role2, Reward),
            map:role_update(Role2),
            Evts = [#evt_dragon_boat{camp_id = get_camp_id()},
                    #evt_dragon_boat_cplt{camp_id = get_camp_id(),
                                          time_span = TimeSpan}],
            TriggerRole = role_trigger:fire(Evts, Role2),
            cancel_team_mark(TriggerRole);
        _ ->
            push(Role, 19900),
            Role
    end.

push_result(Role = #role{m_camp_dragon_boat =
                             #m_camp_dragon_boat{time_span = TimeSpan}},
            Reward)
    when TimeSpan > 0 ->
    Fun = fun ({I, N}) -> {I, N};
              ({I, _, N}) -> {I, N}
          end,
    Reward1 = [Fun(O) || O <- Reward],
    push(Role, {19905, TimeSpan, Reward1});
push_result(_, _) -> ok.

get_checkin_reward(Role = #role{lev = Lev,
                                m_camp_dragon_boat =
                                    #m_camp_dragon_boat{time_span = TimeSpan}},
                   8) ->
    FinalRate = case TimeSpan =< 900 of
                    true -> 1.5;
                    _ -> 1
                end,
    {ExpRate, Gain1} = case dragon_boat_data:get(8) of
                           #{reward := CGain, exp_rate := EpRate} ->
                               {EpRate, CGain};
                           _ -> {0, []}
                       end,
    Gain2 = case levup_data:get_exp({3320, Lev}) of
                #{exp := Exp} ->
                    [{90010, round(Exp * ExpRate * FinalRate / 1000)}
                     | Gain1];
                _ -> Gain1
            end,
    Gain3 = case pet:get_war_pet(Role) of
                {ok, #pet{lev = PetLev}} ->
                    case levup_data:get_exp({3320, PetLev}) of
                        #{pet_exp := PetExp} ->
                            [{90005, round(PetExp * ExpRate * FinalRate / 1000)}
                             | Gain2];
                        _ -> Gain2
                    end;
                _ -> Gain2
            end,
    {Gain4, AnnItem1} = case
                            util:rand_list(dragon_boat_data:get_final_reward1(),
                                           item_weight)
                            of
                            #{item_id := ItemId01, item_num := ItemNum1,
                              announce := 1} ->
                                ItemId1 = item_type:special_id(ItemId01),
                                {[{ItemId1, 0, ItemNum1} | Gain3],
                                 [{ItemId1, ItemNum1}]};
                            #{item_id := ItemId01, item_num := ItemNum1} ->
                                ItemId1 = item_type:special_id(ItemId01),
                                {[{ItemId1, 0, ItemNum1} | Gain3], []};
                            _ -> {Gain3, []}
                        end,
    {Gain5, AnnItem2} = case
                            util:rand_list(dragon_boat_data:get_final_reward2(),
                                           item_weight)
                            of
                            #{item_id := ItemId02, item_num := ItemNum2,
                              announce := 1} ->
                                ItemId2 = item_type:special_id(ItemId02),
                                {[{ItemId2, 0, ItemNum2} | Gain4],
                                 [{ItemId2, ItemNum2} | AnnItem1]};
                            #{item_id := ItemId02, item_num := ItemNum2} ->
                                ItemId2 = item_type:special_id(ItemId02),
                                {[{ItemId2, 0, ItemNum2} | Gain4], AnnItem1};
                            _ -> {Gain4, AnnItem1}
                        end,
    case TimeSpan =< 600 of
        true ->
            case
                util:rand_list(dragon_boat_data:get_final_reward1(),
                               item_weight)
                of
                #{item_id := ItemId03, item_num := ItemNum3,
                  announce := 1} ->
                    ItemId3 = item_type:special_id(ItemId03),
                    {[{ItemId3, 0, ItemNum3} | Gain5],
                     [{ItemId3, ItemNum3} | AnnItem2]};
                #{item_id := ItemId03, item_num := ItemNum3} ->
                    ItemId3 = item_type:special_id(ItemId03),
                    {[{ItemId3, 0, ItemNum3} | Gain5], AnnItem2};
                _ -> {Gain5, AnnItem2}
            end;
        _ -> {Gain5, AnnItem2}
    end;
get_checkin_reward(_Role, 0) -> {[], []};
get_checkin_reward(Role = #role{lev = Lev}, Done) ->
    logger:debug("DONE = ~w",
                 [Done],
                 camp_dragon_boat,
                 1278),
    {ExpRate, Gain1} = case dragon_boat_data:get(Done) of
                           #{reward := CGain, exp_rate := EpRate} ->
                               {EpRate, CGain};
                           _ -> {0, []}
                       end,
    Gain2 = case levup_data:get_exp({3320, Lev}) of
                #{exp := Exp} ->
                    [{90010, round(Exp * ExpRate / 1000)} | Gain1];
                _ -> Gain1
            end,
    Gain3 = case pet:get_war_pet(Role) of
                {ok, #pet{lev = PetLev}} ->
                    case levup_data:get_exp({3320, PetLev}) of
                        #{pet_exp := PetExp} ->
                            [{90005, round(PetExp * ExpRate / 1000)} | Gain2];
                        _ -> Gain2
                    end;
                _ -> Gain2
            end,
    case
        util:rand_list(dragon_boat_data:get_checkin_reward(),
                       item_weight)
        of
        #{item_id := ItemId01, item_num := ItemNum1,
          announce := 1} ->
            ItemId1 = item_type:special_id(ItemId01),
            {[{ItemId1, 0, ItemNum1} | Gain3],
             [{ItemId1, ItemNum1}]};
        #{item_id := ItemId01, item_num := ItemNum1} ->
            ItemId1 = item_type:special_id(ItemId01),
            {[{ItemId1, 0, ItemNum1} | Gain3], []};
        _ -> {Gain3, []}
    end.

sync_rank(Role = #role{name = LeaderName,
                       m_team = #m_team{pid = Pid, status = 1},
                       m_camp_dragon_boat =
                           #m_camp_dragon_boat{time_span = Time, done = Done}})
    when is_pid(Pid) ->
    logger:debug("==========sync_rank:~w",
                 [Time],
                 camp_dragon_boat,
                 1310),
    case team:get_members(Role) of
        Mates when is_list(Mates) ->
            case to_rank_role([Role | Mates], Time) of
                [] -> ok;
                RankRoles ->
                    logger:debug("转换队伍信息:~w",
                                 [RankRoles],
                                 camp_dragon_boat,
                                 1316),
                    TeamId = lists:sort([Mid
                                         || #dragon_boat_role{id = Mid}
                                                <- RankRoles]),
                    camp_dragon_boat !
                        {sync_rank,
                         #dragon_boat_team{id = TeamId, done = Done,
                                           members = RankRoles,
                                           leader_name = LeaderName,
                                           time_span = Time}}
            end;
        _ -> ok
    end;
sync_rank(_) -> ok.

to_rank_role([], _Time) -> [];
to_rank_role([#role{id = Id, name = Name,
                    classes = Classes, sex = Sex}
              | T],
             Time) ->
    [#dragon_boat_role{id = Id, name = Name,
                       classes = Classes, sex = Sex, time_span = Time,
                       is_leader = 1}
     | to_rank_role(T, Time)];
to_rank_role([#team_mate{id = Id, name = Name,
                         classes = Classes, sex = Sex}
              | T],
             Time) ->
    [#dragon_boat_role{id = Id, name = Name,
                       classes = Classes, sex = Sex, time_span = Time}
     | to_rank_role(T, Time)].

update_role_rank([]) -> ok;
update_role_rank([R = #dragon_boat_role{id = Id,
                                        time_span = Time}
                  | T]) ->
    case ets:lookup(dragon_boat_role, Id) of
        [#dragon_boat_role{time_span = OldTime}]
            when OldTime =< Time ->
            ok;
        _ -> ets:insert(dragon_boat_role, R)
    end,
    update_role_rank(T).

team_reward([], Rewarded) -> Rewarded;
team_reward([#dragon_boat_team{members = Members,
                               rank = Order}
             | T],
            Rewarded) ->
    case dragon_boat_data:get_rank_reward(Order) of
        Prize = #{reward := [_ | _]} ->
            Fun = fun (#dragon_boat_role{id = HRid}) ->
                          role_trigger:async_fire(HRid,
                                                  #evt_dragon_boat_rank{camp_id
                                                                            =
                                                                            get_camp_id(),
                                                                        rank =
                                                                            Order})
                  end,
            lists:foreach(Fun, Members),
            {HonorId, EndTime} = {39029,
                                  86400 * 60 + date:unixtime()},
            Rids = [{HRid, HonorId}
                    || #dragon_boat_role{id = HRid} <- Members],
            honor_mgr:add({dragon_boat_rank, erlang:date()},
                          Rids,
                          EndTime),
            NewRewarded = do_team_reward(Members,
                                         Prize,
                                         Order,
                                         Rewarded),
            team_reward(T, NewRewarded);
        _ -> ok
    end.

do_team_reward([], _Prize, _Order, Rewarded) ->
    Rewarded;
do_team_reward([#dragon_boat_role{id = Id} | T], Prize,
               Order, Rewarded) ->
    case lists:keyfind(Id, 1, Rewarded) of
        {Id, RewardTimes} when RewardTimes >= 2 ->
            do_team_reward(T, Prize, Order, Rewarded);
        _Else ->
            Items = get_items(Prize),
            MailInfo = #{items => [{I, 0, N} || {I, N} <- Items],
                         title => lang:get("极速滑雪奖励"),
                         content =>
                             notice:format(lang:get("你在~ts中表现出众，获得了第~ts名，特发此奖励，敬请查收"),
                                           [{string_2, 1, lang:get("极速滑雪")},
                                            {string_2, 5, Order}])},
            mail:send(Id, MailInfo),
            NewRewarded = case _Else of
                              {Id, RewardTimes} ->
                                  lists:keyreplace(Id,
                                                   1,
                                                   Rewarded,
                                                   {Id, RewardTimes + 1});
                              _ -> [{Id, 1} | Rewarded]
                          end,
            do_team_reward(T, Prize, Order, NewRewarded)
    end.

get_items(#{reward := Reward, min := Min,
            max := Max}) ->
    Rand = util:rand(Min, Max),
    get_items(Reward, Rand).

get_items(_, Num) when Num < 1 -> [];
get_items([], _) -> [];
get_items(Reward, Num) ->
    case util:rand_list(Reward, 3) of
        O = {0, _, _} -> get_items(Reward -- [O], Num - 1);
        O = {ItemId, N, _} ->
            [{item_type:special_id(ItemId), N} | get_items(Reward --
                                                               [O],
                                                           Num - 1)]
    end.

get_leaders(_, Order, Leads) when Order > 3 ->
    lists:reverse(Leads);
get_leaders([], _, Leads) -> lists:reverse(Leads);
get_leaders([#dragon_boat_team{members =
                                   [#dragon_boat_role{id = FId, name = FName}
                                    | _]}
             | T],
            Order, Leads) ->
    get_leaders(T, Order + 1, [{FId, FName} | Leads]).

update_rank(announce) ->
    EtsTeamL = ets:tab2list(dragon_boat_team),
    SortTeams = util:keys_sort([{asc,
                                 #dragon_boat_team.time_span},
                                #dragon_boat_team.done],
                               EtsTeamL),
    SortTeamList = update_team_rank(SortTeams, 1, []),
    ets:delete_all_objects(dragon_boat_team_rank),
    ets:insert(dragon_boat_team_rank, SortTeamList),
    case SortTeamList of
        TeamL = [_ | _] ->
            RoleList = get_leaders(TeamL, 1, []),
            Msg2 = case RoleList of
                       [_ | _] ->
                           MatchIndex = get_match_index(),
                           notice:format(lang:get("酣畅淋漓！~ts~ts活动正在如火如荼进行中，目前~ts的队伍暂列前三名，其他队伍加油{f"
                                                  "ace_1, 18}"),
                                         [{string_2, 1, lang:get("极速滑雪")},
                                          {string_2, 1, MatchIndex},
                                          {role_1, RoleList}]);
                       _ -> false
                   end,
            case Msg2 of
                false -> ok;
                _ -> notice:cast(all, 5, Msg2)
            end;
        _ -> ok
    end;
update_rank(final) ->
    EtsTeamL = ets:tab2list(dragon_boat_team),
    TeamList = lists:filter(fun (#dragon_boat_team{done =
                                                       Done}) ->
                                    Done =:= 8
                            end,
                            EtsTeamL),
    SortTeams = util:keys_sort([{asc,
                                 #dragon_boat_team.time_span}],
                               TeamList),
    SortTeamList = update_team_rank(SortTeams, 1, []),
    RoleRankRewardList = case
                             env:get(dragon_boat_rank_reward_roles)
                             of
                             OldRewarded when is_list(OldRewarded) ->
                                 team_reward(SortTeamList, OldRewarded);
                             _ -> team_reward(SortTeamList, [])
                         end,
    env:save(dragon_boat_rank_reward_roles,
             RoleRankRewardList),
    RoleList = get_leaders(SortTeamList, 1, []),
    Msg2 = case RoleList of
               [_ | _] ->
                   notice:format(lang:get("本轮的~ts已经圆满结束，~ts带领的队伍分别夺得了前三名，并获得丰厚的奖励{face_1"
                                          ",38}"),
                                 [{string_2, 1, lang:get("极速滑雪")},
                                  {role_1, RoleList}]);
               _ -> false
           end,
    case Msg2 of
        false -> ok;
        _ -> notice:cast(all, 5, Msg2)
    end,
    ets:delete_all_objects(dragon_boat_team_rank),
    ets:insert(dragon_boat_team_rank, SortTeamList),
    ets:delete_all_objects(dragon_boat_team),
    ets:delete_all_objects(dragon_boat_role).

update_team_rank([], _, NewSortTeams) ->
    lists:reverse(NewSortTeams);
update_team_rank([Team = #dragon_boat_team{} | Rest],
                 Rank, NewSortTeams) ->
    NewTeam = Team#dragon_boat_team{rank = Rank},
    update_team_rank(Rest,
                     Rank + 1,
                     [NewTeam | NewSortTeams]);
update_team_rank([_Other | Rest], Rank, NewSortTeams) ->
    update_team_rank(Rest, Rank, NewSortTeams).

npc_talk(Role, NewDone) ->
    BaseId = case dragon_boat_data:get(NewDone) of
                 #{base_id := Base} -> Base;
                 _ -> 21006
             end,
    Msg1 = case NewDone < 8 of
               true ->
                   case dragon_boat_data:get_content(NewDone) of
                       false -> false;
                       _Msg -> _Msg
                   end;
               _ -> false
           end,
    case Msg1 of
        false -> ok;
        _ -> notice:npc_talk(Role, BaseId, Msg1)
    end.

calc_minus_secs(L) ->
    Num1 = length([I
                   || #fighter{id = I, type = 2, base_id = 76147,
                               is_die = 1}
                          <- L]),
    Num2 = length([I
                   || #fighter{id = I, type = 2, base_id = 76148,
                               is_die = 1}
                          <- L]),
    Num3 = length([I
                   || #fighter{id = I, type = 2, base_id = 76149,
                               is_die = 1}
                          <- L]),
    Num4 = length([I
                   || #fighter{id = I, type = 2, base_id = 76150,
                               is_die = 1}
                          <- L]),
    Num5 = length([I
                   || #fighter{id = I, type = 2, base_id = 76151,
                               is_die = 1}
                          <- L]),
    Num6 = length([I
                   || #fighter{id = I, type = 2, base_id = 76152,
                               is_die = 1}
                          <- L]),
    Sec1 = 10 * Num1,
    Sec2 = 20 * Num2,
    Sec3 = 30 * Num3,
    Sec4 = 40 * Num4,
    Sec5 = 60 * Num5,
    Sec6 = -20 * Num6,
    L1 = [{76147, Num1},
          {76148, Num2},
          {76149, Num3},
          {76150, Num4},
          {76151, Num5},
          {76152, Num6}],
    Str = case [O || O = {_, N} <- L1, N > 0] of
              [] -> "";
              L2 ->
                  string:join([notice:format(lang:get("~ts*~ts"),
                                             [{string_2, 5, unit:name(Id)},
                                              {string_2, 5, Nu}])
                               || {Id, Nu} <- L2],
                              "、")
          end,
    Secs = Sec1 + Sec2 + Sec3 + Sec4 + Sec5 + Sec6,
    {Secs, Str}.

get_match_time() ->
    NowSecs = date:seconds_of_the_day(),
    OpenTimeList = dragon_boat_data:list_time(),
    Fun = fun ({SignT, StartT, EndT}, Rtn) ->
                  case NowSecs >= SignT andalso NowSecs < EndT of
                      true -> {SignT, StartT, EndT};
                      _ -> Rtn
                  end
          end,
    lists:foldl(Fun, false, OpenTimeList).

get_next_match_time() ->
    NowSecs = date:seconds_of_the_day(),
    OpenTimeList = dragon_boat_data:list_time(),
    Fun = fun ({SignT, StartT, EndT}, false) ->
                  case NowSecs < SignT of
                      true -> {SignT, StartT, EndT};
                      _ -> false
                  end;
              (_, Rtn) -> Rtn
          end,
    lists:foldl(Fun, false, OpenTimeList).

get_match_index() ->
    NowSecs = date:seconds_of_the_day(),
    case dragon_boat_data:get_time_index(NowSecs) of
        {OrderDesc, Index} ->
            util:flist(lang:get("~ts第~w场"), [OrderDesc, Index]);
        _ -> lang:get("首轮第1轮")
    end.

is_boat_team_mark(#role{m_achieve_shop =
                            #m_achieve_shop{team_mark = 407}}) ->
    true;
is_boat_team_mark(_) -> false.

cancel_team_mark(Role) ->
    case is_boat_team_mark(Role) of
        true ->
            DefaultId = achieve_shop_data:default_id(5),
            case achieve_shop:set_team_mark(Role, DefaultId) of
                {ok, TeamMarkRole} ->
                    achieve_shop:push_teammark(TeamMarkRole),
                    map:role_update(TeamMarkRole),
                    TeamMarkRole;
                _ -> Role
            end;
        false -> Role
    end.

get_camp_id() ->
    case campaign_mgr:get_camp_info(60043) of
        #camp_cache{id = ID} -> ID;
        _ -> 0
    end.

