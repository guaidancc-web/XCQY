-file("src/mod/item/item_use.erl", 1).

-module(item_use).

-export([use/4, gain_and_use/2, rpc_use/3]).

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

-file("src/mod/item/item_use.erl", 16).

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

-file("src/mod/item/item_use.erl", 17).

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

-file("src/mod/item/item_use.erl", 18).

-file("inc/condition.hrl", 1).

-record(condition,
        {label :: undefined | atom(),
         op = eq ::
             ue | eq | lt | gt | le | ge | range | include,
         val :: undefined | term(),
         msg = "" :: list()}).

-file("src/mod/item/item_use.erl", 19).

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

-file("src/mod/item/item_use.erl", 20).

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

-file("src/mod/item/item_use.erl", 21).

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

-file("src/mod/item/item_use.erl", 22).

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

-file("src/mod/item/item_use.erl", 23).

-file("inc/package.hrl", 1).

-record(package,
        {type = 1 :: integer(),
         next_id = 1 :: pos_integer(),
         volume = 0 :: non_neg_integer(),
         free_cell = [] :: list(),
         items = [] :: [tuple()]}).

-file("src/mod/item/item_use.erl", 24).

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

-file("src/mod/item/item_use.erl", 25).

-file("inc/buff.hrl", 1).

-record(m_buff, {ver = 2, r_list = [], show = 1}).

-record(buff_base,
        {id = 1,
         name = "",
         class = 0,
         lev = 0,
         cancel = 0,
         same_buff_mode = 0,
         type = 1,
         sub_type = 0,
         time_mode = 0,
         max_time_num = 1,
         duration = 0,
         max_effect_lev = 1,
         looks = [],
         attr = [],
         guard_attr = [],
         pet_attr = [],
         end_date = 0,
         extra = [],
         effect = [],
         dynamic_attr = [],
         pvp_limit = 0,
         desc = ""}).

-record(buff,
        {ver = 4,
         id = 1,
         class = 0,
         lev = 0,
         cancel = 0,
         type = 1,
         same_buff_mode = 0,
         time_mode = 0,
         duration = 0,
         max_duration = 1,
         effect_lev = 1,
         end_date = 0,
         start_time = 0,
         looks = [],
         dynamic_attr = [],
         pvped = 0,
         ext_param = [],
         args = 1}).

-file("src/mod/item/item_use.erl", 26).

-file("inc/looks.hrl", 1).

-file("src/mod/item/item_use.erl", 27).

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

-file("src/mod/item/item_use.erl", 28).

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

-file("src/mod/item/item_use.erl", 29).

-file("inc/family.hrl", 1).

-record(beans_reward,
        {id = 0,
         giver_id = {0, "", 0},
         giver_name = "",
         belong_id = {0, "", 0},
         pos = {0, 0},
         give_time = 0}).

-record(magic_beans,
        {ver = 2,
         growth = 0 :: non_neg_integer(),
         flower_num = 0 :: non_neg_integer(),
         wake_time = 0 :: non_neg_integer(),
         event_record = [],
         fosters = [],
         inviters = [],
         beans_rewards = [],
         next_beanrw_id = 0}).

-record(family_info,
        {ver = 5 :: pos_integer(),
         id = {0, "", 0},
         master_id = {0, "", 0},
         master_name = "",
         master_classes = 0 :: pos_integer(),
         master_lev = 1 :: pos_integer(),
         master_sex = 0 :: 0..2,
         lover_id = {0, "", 0},
         lover_name = "",
         pid :: undefined | pid(),
         house_info = undefined,
         yard_info = undefined,
         visitor = [],
         last_visit_time = 0,
         visit_lock = 1,
         last_rf_time = 0,
         magic_beans = #magic_beans{},
         battle_id}).

-record(furnishing,
        {id = 0 :: non_neg_integer(),
         base_id = 0,
         num = 1,
         status = 1,
         belong = {0, "", 0},
         pos = {1, 1, 1, 1} :: tuple(),
         dir = 0 :: 0..1}).

-record(house_info,
        {ver = 3 :: pos_integer(),
         map_id = 0,
         map_pid :: undefined | pid(),
         furnishings = [] :: list(),
         env_val = 0,
         lev = 1 :: pos_integer(),
         floor_lev = 0 :: non_neg_integer(),
         bdg_info = [] :: list(),
         furishing_max_lev_info = [] :: list(),
         next_fur_id = 1,
         cleanness = 100,
         last_clean_time = 0,
         housekeeper_action_times = 0,
         is_upgrade_bdg = []}).

-record(building_info, {type = 1, lev = 0, exp = 0}).

-record(yard_info,
        {ver = 1 :: pos_integer(),
         map_id = 0,
         map_pid :: undefined | pid(),
         furnishings = [] :: list(),
         levl = 1 :: pos_integer(),
         floor_lev = 0 :: non_neg_integer()}).

-record(family_store,
        {ver = 1,
         next_time = 0 :: non_neg_integer(),
         goods_list = []}).

-record(m_family,
        {ver = 1,
         cur_id = {0, "", 0},
         pid :: undefined | pid(),
         idle_family = {0, "", 0},
         family_store = #family_store{},
         family_effect = [],
         effect_use_info = []}).

-record(family_pet_train_info,
        {id = 1, pet_id = 0, end_time = 0}).

-record(fshop_item,
        {id = 0,
         store_type = 1,
         base_id = 0,
         type = 90000,
         val = 0,
         count = 1}).

-record(family_child,
        {id = {0, "", 0},
         name = "",
         classes = 0 :: pos_integer(),
         lev = 1 :: pos_integer(),
         sex = 0 :: 0..2,
         stage = 0 :: non_neg_integer(),
         base_id = 0 :: non_neg_integer(),
         unit_id = {0, 0},
         unit_base_id = 0}).

-file("src/mod/item/item_use.erl", 30).

-file("inc/month_gift.hrl", 1).

-record(m_month_gift, {lists = []}).

-record(month_gift_data,
        {id = 0,
         start_time,
         end_time,
         is_open = 0,
         desc1 = "",
         desc2 = "",
         title = "",
         item_list = []}).

-record(month_gift_item_data,
        {id = 0,
         gift_id = 0,
         group = 0,
         item_id = 0,
         bind = 0,
         num = 0,
         origin_price = [],
         price = [],
         min_lev = 0,
         max_lev = 0,
         sex = 0,
         classes = 0,
         min_lev_break = 0,
         max_lev_break = 0}).

-record(pay_gift_item_data,
        {gift_id = 0,
         item_id = 0,
         bind = 0,
         num = 0,
         type = 0,
         origin_price = [],
         price = [],
         min_lev = 0,
         max_lev = 0,
         sex = 0,
         classes = 0,
         min_lev_break = 0,
         max_lev_break = 0,
         desc = ""}).

-file("src/mod/item/item_use.erl", 31).

-file("inc/lev_break.hrl", 1).

-record(m_lev_break,
        {ver = 0,
         trial = 0 :: non_neg_integer(),
         done = 0 :: non_neg_integer(),
         times = 0 :: non_neg_integer(),
         attr_point = 0 :: non_neg_integer()}).

-file("src/mod/item/item_use.erl", 32).

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

-file("src/mod/item/item_use.erl", 33).

-spec use(#item{}, Args, pos_integer(),
          #role{}) -> {false, bitstring()} |
                      {ok, #role{}} |
                      {ok, bitstring(), #role{}} when Args ::
                                                          [{non_neg_integer(),
                                                            non_neg_integer(),
                                                            bitstring()}].

use(Item, Args, Num, Role) ->
    case check_time(Item, Role) of
        {expire, NewRole} -> {expire, NewRole};
        {false, Reason} -> {false, Reason};
        true ->
            case check_item(Item, Role) of
                {false, Reason} -> {false, Reason};
                {true, BaseItem} ->
                    case item_to_rule(Item) of
                        false -> {false, lang:get("该物品不能使用")};
                        Rule ->
                            do_use_item(Rule, Item, BaseItem, Args, Num, Role)
                    end
            end
    end.

-spec rpc_use(#role{}, #item{} | [#item{}],
              IsAutoUse :: 0..1) -> ok.

rpc_use(Role, #item{id = Id, quantity = Num}, 1) ->
    role:rpc(Role#role.pid, 10315, {Id, Num, []});
rpc_use(Role, [Item | T], IsAutoUse = 1) ->
    rpc_use(Role, Item, IsAutoUse),
    rpc_use(Role, T, IsAutoUse);
rpc_use(_Role, _, _IsAutoUse) -> ok.

-spec gain_and_use(#role{},
                   ItemL :: [{pos_integer(),
                              pos_integer(),
                              pos_integer()}]) -> {ok, #role{}} |
                                                  {false,
                                                   Reason :: bitstring()}.

gain_and_use(Role, ItemL) ->
    case package:add(by_base_id, bag, Role, ItemL, no_push)
        of
        {ok, NewPackage, AddItems} ->
            NRole = Role#role{p_bag = NewPackage},
            AddBagItems = [Item
                           || Item = #item{} <- AddItems,
                              item_to_rule(Item) =/= puton],
            package:push_item_info(add, Role, [{1, AddBagItems}]),
            notice:gl([#gain{label = item_base_id, val = ItemL}],
                      Role),
            do_gain_use(AddItems, NRole, []);
        false ->
            logger:error("产生物品时发生错误，无法生成物品列表:~w",
                         [ItemL],
                         item_use,
                         72),
            {false, lang:get("不存在物品")};
        full -> {false, lang:get("背包已满，增加物品失败")}
    end.

do_gain_use([], Role, AddBagItems) ->
    package:push_item_info(add, Role, [{1, AddBagItems}]),
    erase(rpc_10321),
    role:rpc(self(), 10321, {}),
    {ok, Role};
do_gain_use([Item = #item{base_id = BaseId,
                          quantity = Num, type = Type}
             | T],
            Role, AddBagItems) ->
    Rule = item_to_rule(Item),
    case use(Item, [not_from_bag], Num, Role) of
        {ok, [], NRole} when Rule =:= puton ->
            do_gain_use(T,
                        role_trigger:fire([#evt_use_item{base_id = BaseId,
                                                         num = Num},
                                           #evt_use_item_type{type = Type}],
                                          NRole),
                        AddBagItems);
        {ok, [NewItem = #item{}], NRole} when Rule =:= puton ->
            do_gain_use(T,
                        role_trigger:fire([#evt_use_item{base_id = BaseId,
                                                         num = Num},
                                           #evt_use_item_type{type = Type}],
                                          NRole),
                        [NewItem | AddBagItems]);
        {ok, NRole} ->
            do_gain_use(T,
                        role_trigger:fire([#evt_use_item{base_id = BaseId,
                                                         num = Num},
                                           #evt_use_item_type{type = Type}],
                                          NRole),
                        AddBagItems);
        {ok, _Msg, NRole} ->
            do_gain_use(T,
                        role_trigger:fire([#evt_use_item{base_id = BaseId,
                                                         num = Num},
                                           #evt_use_item_type{type = Type}],
                                          NRole),
                        AddBagItems);
        {false, Reason} when Rule =:= puton ->
            notice:return(util:flist(lang:get("使用物品失败:~ts"),
                                     [Reason])),
            do_gain_use(T, Role, [Item | AddBagItems]);
        {false, Reason} ->
            notice:return(util:fbin(lang:get("使用物品失败:~ts"),
                                    [Reason])),
            do_gain_use(T, Role, AddBagItems)
    end.

check_time(Item = #item{id = Id, quantity = Num,
                        expire_time = StartTime},
           Role) ->
    case item:check_expire(Item) of
        true ->
            case role_gain:do([#loss{label = item_id,
                                     val = [{Id, Num}]}],
                              Role)
                of
                {ok, NewRole} -> {expire, NewRole};
                {false, _L} -> {false, lang:get("道具过期，使用失败")}
            end;
        false ->
            case item:check_start(Item) of
                true -> true;
                false ->
                    case date:seconds_to_datetime(StartTime) of
                        {{Y, M, D}, {H, Min, S}} ->
                            Msg =
                                notice:format(lang:get("~ts<color='#00ff00'>年</color>~ts<color='#00ff"
                                                       "00'>月</color>~ts<color='#00ff00'>日</color>~ts"
                                                       ":~ts:~ts可以使用喔{face_1,3}"),
                                              [{string_2, 1, Y},
                                               {string_2, 1, M},
                                               {string_2, 1, D},
                                               {string_2, 1, H},
                                               {string_2, 1, Min},
                                               {string_2, 1, S}]),
                            {false, Msg};
                        _ -> {false, "未到开启时间，无法提前使用"}
                    end
            end
    end.

check_item(#item{base_id = BaseId}, Role) ->
    case item_data:get(BaseId) of
        false -> {false, lang:get("不存在该物品")};
        BaseItem = #item_base{condition = Conds, type = Type,
                              lev = Lev, classes = Classes, sex = Sex} ->
            IsEqm = lists:member(Type,
                                 [1,
                                  4,
                                  2,
                                  3,
                                  5,
                                  21,
                                  22,
                                  6,
                                  7,
                                  9,
                                  10,
                                  11,
                                  12,
                                  14]),
            {NewConds, _, _, _} = case Lev of
                                      20 when IsEqm == true ->
                                          item:make_cond(0,
                                                         Classes,
                                                         Sex,
                                                         Conds);
                                      _ ->
                                          item:make_cond(Lev,
                                                         Classes,
                                                         Sex,
                                                         Conds)
                                  end,
            case role_cond:check(NewConds, Role) of
                {false, Cond} -> {false, Cond#condition.msg};
                true -> {true, BaseItem}
            end
    end.

item_to_rule(Item = #item{base_id = BaseId}) ->
    do_item_to_rule(Item#item{use_type =
                                  item:attr(use_type, BaseId),
                              type = item:attr(type, BaseId)}).

do_item_to_rule(#item{use_type = 0}) -> false;
do_item_to_rule(#item{use_type = 3}) -> puton;
do_item_to_rule(#item{type = 111}) -> gift;
do_item_to_rule(#item{type = 119}) -> treasure;
do_item_to_rule(#item{type = 127}) -> wedding_treasure;
do_item_to_rule(#item{type = 113}) -> fruit;
do_item_to_rule(#item{type = 126}) -> role_reset_point;
do_item_to_rule(#item{type = 128}) -> fruit_limit;
do_item_to_rule(#item{type = 116}) -> furnishing;
do_item_to_rule(#item{type = 145}) ->
    wedding_treasure_2;
do_item_to_rule(#item{base_id = 20019}) -> guild_medal;
do_item_to_rule(#item{base_id = 23807}) ->
    quest_child_sow;
do_item_to_rule(#item{type = 146}) ->
    quest_acquaintance;
do_item_to_rule(#item{type = 152}) -> pay_gift;
do_item_to_rule(#item{type = 154}) -> select_gift;
do_item_to_rule(#item{type = 158}) -> exp_heart_obtain;
do_item_to_rule(#item{type = 159}) -> select_gift;
do_item_to_rule(#item{type = 160}) -> make_red_packet;
do_item_to_rule(#item{type = 161}) -> select_gift;
do_item_to_rule(_) -> normal.

do_use_item(gift, Item = #item{id = Id}, BaseItem,
            _Args, Num, Role) ->
    role:send_buff_begin(),
    case role_gain:do([#loss{label = item_id,
                             val = [{Id, Num}]}],
                      Role)
        of
        {ok, NewRole} ->
            case item_gift:use(Item, Num, NewRole) of
                {ok, GiftRole} ->
                    case item:use_normal(GiftRole, Item, BaseItem, Num) of
                        {ok, NRole} ->
                            role:send_buff_flush(),
                            {ok, NRole};
                        {false, Reason} ->
                            role:send_buff_clean(),
                            {false, Reason}
                    end;
                {false, Reason} ->
                    role:send_buff_clean(),
                    {false, Reason}
            end;
        {false, _L} ->
            role:send_buff_clean(),
            {false, lang:get("礼包数量不足, 无法使用")}
    end;
do_use_item(select_gift, Item = #item{id = Id},
            BaseItem, Args, Num, Role) ->
    role:send_buff_begin(),
    case role_gain:do([#loss{label = item_id,
                             val = [{Id, Num}]}],
                      Role)
        of
        {ok, NewRole} ->
            case item_gift:use(Item, Num, NewRole, Args) of
                {ok, GiftRole} ->
                    case item:use_normal(GiftRole, Item, BaseItem, Num) of
                        {ok, NRole} ->
                            role:send_buff_flush(),
                            {ok, NRole};
                        {false, Reason} ->
                            role:send_buff_clean(),
                            {false, Reason}
                    end;
                {false, Reason} ->
                    role:send_buff_clean(),
                    {false, Reason}
            end;
        {false, _L} ->
            role:send_buff_clean(),
            {false, lang:get("礼包数量不足, 无法使用")}
    end;
do_use_item(puton, Item, BaseItem, _Args, Num, Role) ->
    role:send_buff_begin(),
    case eqm:use_eqm(Item, BaseItem, Num, Role) of
        {ok, NewRole} ->
            NewRole1 = attr:calc_and_push(NewRole),
            NewRole2 = looks:calc(NewRole1),
            looks:update_looks(Role, NewRole2),
            role:send_buff_flush(),
            {ok, role_trigger:fire(#evt_eqm{}, NewRole2)};
        {false, Reason} ->
            role:send_buff_clean(),
            {false, Reason}
    end;
do_use_item(role_reset_point, #item{id = Id}, _BaseItem,
            _Args, _Num, Role) ->
    role:send_buff_begin(),
    case role_gain:do_notice([#loss{label = item_id,
                                    val = [{Id, 1}]}],
                             Role)
        of
        {ok, NewRole} ->
            case attr:do_reset_point(NewRole, item) of
                {false, Reason} ->
                    role:send_buff_clean(),
                    {false, Reason};
                {ok, NewRole1, _} ->
                    attr:push_10023(NewRole1),
                    attr:push_10007(NewRole1),
                    role:send_buff_flush(),
                    {ok, NewRole1}
            end;
        {false, _L} ->
            role:send_buff_clean(),
            {false, lang:get("物品数量不足, 无法使用")}
    end;
do_use_item(treasure, Item = #item{}, _BaseItem, _Args,
            _Num, Role) ->
    case treasure:check_use(Role) of
        {false, Reason} -> {false, Reason};
        true ->
            role:send_buff_begin(),
            case treasure:use(Role, Item) of
                {ok, TreasureRole} ->
                    role:send_buff_flush(),
                    {ok, TreasureRole};
                {false, Reason} ->
                    role:send_buff_clean(),
                    {false, Reason}
            end
    end;
do_use_item(wedding_treasure, Item = #item{}, _BaseItem,
            _Args, Num, Role) ->
    role:send_buff_begin(),
    case wedding_treasure:use(Role, Item, Num) of
        {ok, TreasureRole} ->
            role:send_buff_flush(),
            {ok, TreasureRole};
        {false, Reason} ->
            role:send_buff_clean(),
            {false, Reason}
    end;
do_use_item(wedding_treasure_2, Item = #item{},
            _BaseItem, _Args, Num, Role) ->
    role:send_buff_begin(),
    case wedding_treasure:use_history_box(Role, Item, Num)
        of
        {ok, TreasureRole} ->
            role:send_buff_flush(),
            {ok, TreasureRole};
        {false, Reason} ->
            role:send_buff_clean(),
            {false, Reason}
    end;
do_use_item(fruit, #item{id = Id, base_id = BaseId},
            #item_base{effect = [{20, GroupId}]}, _Args, Num,
            Role = #role{classes = Classes}) ->
    role:send_buff_begin(),
    case role_gain:do([#loss{label = item_id,
                             val = [{Id, Num}]}],
                      Role)
        of
        {ok, NRole} ->
            RandIds = case buff_data:rand_ids(GroupId) of
                          L1 = [{_, _, _} | _] ->
                              [{I, R}
                               || {I, R, C} <- L1,
                                  C =:= 0 orelse C =:= Classes];
                          L1 -> L1
                      end,
            case util:rand_list(RandIds, 2) of
                {BuffId, _} ->
                    case buff:add(NRole, BuffId) of
                        {ok, Role1} ->
                            Role2 = attr:calc_and_push(Role1),
                            NewRole = looks:calc(Role2),
                            map:role_update(NewRole),
                            role:send_buff_flush(),
                            Msg = notice:format(lang:get("使用了~ts"),
                                                [{item_2, BaseId}]),
                            notice:send(NewRole, 3, Msg),
                            case buff_data:get(BuffId) of
                                #buff_base{desc = Desc} ->
                                    notice:send(NewRole, 3, Desc);
                                _ -> ok
                            end,
                            do_buff_show_notice(Role),
                            {ok, NewRole};
                        {false, Reason} ->
                            role:send_buff_clean(),
                            {false, Reason}
                    end;
                _Else ->
                    logger:debug("无效随机buff ~w, ~w",
                                 [_Else, GroupId],
                                 item_use,
                                 333),
                    role:send_buff_clean(),
                    {false, lang:get("找不到buff")}
            end;
        {false, _L} ->
            role:send_buff_clean(),
            {false, lang:get("物品数量不足, 无法使用")}
    end;
do_use_item(fruit, #item{id = Id, base_id = BaseId},
            #item_base{effect = [{10, BuffId}]}, _Args, Num,
            Role) ->
    role:send_buff_begin(),
    case role_gain:do([#loss{label = item_id,
                             val = [{Id, Num}]}],
                      Role)
        of
        {ok, NRole} ->
            case buff:add(NRole, BuffId) of
                {ok, Role1} ->
                    Role2 = attr:calc_and_push(Role1),
                    NewRole = looks:calc(Role2),
                    map:role_update(NewRole),
                    role:send_buff_flush(),
                    Msg = notice:format(lang:get("使用了~ts"),
                                        [{item_2, BaseId}]),
                    notice:send(NewRole, 3, Msg),
                    case buff_data:get(BuffId) of
                        #buff_base{desc = Desc} ->
                            notice:send(NewRole, 3, Desc);
                        _ -> ok
                    end,
                    do_buff_show_notice(Role),
                    {ok, NewRole};
                {false, Reason} ->
                    role:send_buff_clean(),
                    {false, Reason}
            end;
        {false, _L} ->
            role:send_buff_clean(),
            {false, lang:get("物品数量不足, 无法使用")}
    end;
do_use_item(fruit, Item = #item{id = Id}, BaseItem,
            _Args, Num, Role) ->
    role:send_buff_begin(),
    case role_gain:do_notice([#loss{label = item_id,
                                    val = [{Id, Num}]}],
                             Role)
        of
        {ok, NewRole} ->
            case item:use_normal(NewRole, Item, BaseItem, Num) of
                {ok, UseRole} ->
                    role:send_buff_flush(),
                    do_buff_show_notice(Role),
                    {ok, UseRole};
                {false, Reason} ->
                    role:send_buff_clean(),
                    {false, Reason}
            end;
        {false, _L} ->
            role:send_buff_clean(),
            {false, lang:get("物品数量不足, 无法使用")}
    end;
do_use_item(fruit_limit,
            Item = #item{id = Id, extra = Extra, base_id = BaseId},
            BaseItem = #item_base{effect = [{52, _ItemEffect} | _]},
            _Args, _Num,
            Role = #role{p_bag = Pbag = #package{items = Items}}) ->
    role:send_buff_begin(),
    case lists:keytake(7, 1, Extra) of
        {value, {_, Times, ""}, OtherList} when Times > 1 ->
            NewItem = Item#item{extra =
                                    [{7, Times - 1, ""} | OtherList],
                                bind = 1},
            NewItems = lists:keystore(Id, #item.id, Items, NewItem),
            package:push_item_info(update, Role, [{1, NewItem}]),
            NewPbag = Pbag#package{items = NewItems},
            NRole = Role#role{p_bag = NewPbag, is_gain = true},
            case use_fruit(NRole, Item, BaseItem, 1) of
                {ok, UseRole} ->
                    role:send_buff_flush(),
                    Msg = notice:format(lang:get("使用了~ts~ts次, 剩余可使用~ts次"),
                                        [{item_2, BaseId},
                                         {string_2, 1, 1},
                                         {string_2, 1, Times - 1}]),
                    notice:send(Role, 3, Msg),
                    do_buff_show_notice(Role),
                    {ok, UseRole};
                {false, Reason} ->
                    role:send_buff_clean(),
                    {false, Reason}
            end;
        _ ->
            case role_gain:do_notice([#loss{label = item_id,
                                            val = [{Id, 1}]}],
                                     Role)
                of
                {ok, NewRole} ->
                    case use_fruit(NewRole, Item, BaseItem, 1) of
                        {ok, UseRole} ->
                            role:send_buff_flush(),
                            {ok, UseRole};
                        {false, Reason} ->
                            role:send_buff_clean(),
                            {false, Reason}
                    end;
                {false, _L} ->
                    role:send_buff_clean(),
                    {false, lang:get("物品数量不足, 无法使用")}
            end
    end;
do_use_item(fruit_limit,
            Item = #item{id = Id, extra = Extra, base_id = BaseId},
            BaseItem = #item_base{effect = [{37, {BuffId, _}} | _]},
            _Args, Num,
            Role = #role{p_bag = Pbag = #package{items = Items}}) ->
    role:send_buff_begin(),
    case lists:keytake(7, 1, Extra) of
        {value, {_, Times, ""}, OtherList} when Times > 1 ->
            NewItem = Item#item{extra =
                                    [{7, Times - 1, ""} | OtherList],
                                bind = 1},
            NewItems = lists:keystore(Id, #item.id, Items, NewItem),
            package:push_item_info(update, Role, [{1, NewItem}]),
            NewPbag = Pbag#package{items = NewItems},
            NRole = Role#role{p_bag = NewPbag, is_gain = true},
            case item:use_normal(NRole, Item, BaseItem, Num) of
                {ok, UseRole} ->
                    role:send_buff_flush(),
                    Msg = notice:format("使用了~ts~ts次, 剩余可使用~ts次",
                                        [{item_2, BaseId},
                                         {string_2, 1, 1},
                                         {string_2, 1, Times - 1}]),
                    notice:send(Role, 3, Msg),
                    case buff_data:get(BuffId) of
                        #buff_base{desc = Desc} -> notice:send(Role, 3, Desc);
                        _ -> ok
                    end,
                    do_buff_show_notice(Role),
                    {ok, UseRole};
                {false, Reason} ->
                    role:send_buff_clean(),
                    {false, Reason}
            end;
        _ ->
            case role_gain:do_notice([#loss{label = item_id,
                                            val = [{Id, Num}]}],
                                     Role)
                of
                {ok, NewRole} ->
                    case item:use_normal(NewRole, Item, BaseItem, Num) of
                        {ok, UseRole} ->
                            role:send_buff_flush(),
                            case buff_data:get(BuffId) of
                                #buff_base{desc = Desc} ->
                                    notice:send(Role, 3, Desc);
                                _ -> ok
                            end,
                            {ok, UseRole};
                        {false, Reason} ->
                            role:send_buff_clean(),
                            {false, Reason}
                    end;
                {false, _L} ->
                    role:send_buff_clean(),
                    {false, lang:get("物品数量不足, 无法使用")}
            end
    end;
do_use_item(fruit_limit,
            Item = #item{id = Id, extra = Extra, base_id = BaseId},
            BaseItem = #item_base{effect =
                                      [{20, {GroupId, SkillLvl}} | RestEffect]},
            _Args, Num,
            Role = #role{p_bag = Pbag = #package{items = Items},
                         classes = Classes}) ->
    RandIds = case buff_data:rand_ids(GroupId) of
                  L1 = [{_, _, _} | _] ->
                      [{I, R}
                       || {I, R, C} <- L1, C =:= 0 orelse C =:= Classes];
                  L1 -> L1
              end,
    case util:rand_list(RandIds, 2) of
        {BuffId, _} ->
            role:send_buff_begin(),
            case lists:keytake(7, 1, Extra) of
                {value, {_, Times, ""}, OtherList} when Times > 1 ->
                    NewItem = Item#item{extra =
                                            [{7, Times - 1, ""} | OtherList],
                                        bind = 1},
                    NewItems = lists:keystore(Id, #item.id, Items, NewItem),
                    package:push_item_info(update, Role, [{1, NewItem}]),
                    NewPbag = Pbag#package{items = NewItems},
                    NRole = Role#role{p_bag = NewPbag, is_gain = true},
                    case item:use_normal(NRole,
                                         Item,
                                         BaseItem#item_base{effect =
                                                                [{37,
                                                                  {BuffId,
                                                                   SkillLvl}}
                                                                 | RestEffect]},
                                         Num)
                        of
                        {ok, UseRole} ->
                            role:send_buff_flush(),
                            Msg = notice:format("使用了~ts~ts次, 剩余可使用~ts次",
                                                [{item_2, BaseId},
                                                 {string_2, 1, 1},
                                                 {string_2, 1, Times - 1}]),
                            notice:send(Role, 3, Msg),
                            case buff_data:get(BuffId) of
                                #buff_base{desc = Desc} ->
                                    notice:send(Role, 3, Desc);
                                _ -> ok
                            end,
                            do_buff_show_notice(Role),
                            {ok, UseRole};
                        {false, Reason} ->
                            role:send_buff_clean(),
                            {false, Reason}
                    end;
                _ ->
                    case role_gain:do_notice([#loss{label = item_id,
                                                    val = [{Id, Num}]}],
                                             Role)
                        of
                        {ok, NewRole} ->
                            case item:use_normal(NewRole,
                                                 Item,
                                                 BaseItem#item_base{effect =
                                                                        [{37,
                                                                          {BuffId,
                                                                           SkillLvl}}
                                                                         | RestEffect]},
                                                 Num)
                                of
                                {ok, UseRole} ->
                                    role:send_buff_flush(),
                                    case buff_data:get(BuffId) of
                                        #buff_base{desc = Desc} ->
                                            notice:send(Role, 3, Desc);
                                        _ -> ok
                                    end,
                                    do_buff_show_notice(Role),
                                    {ok, UseRole};
                                {false, Reason} ->
                                    role:send_buff_clean(),
                                    {false, Reason}
                            end;
                        {false, _L} ->
                            role:send_buff_clean(),
                            {false, lang:get("物品数量不足, 无法使用")}
                    end
            end;
        _Else ->
            logger:debug("无效随机buff ~w, ~w",
                         [_Else, GroupId],
                         item_use,
                         524),
            {false, lang:get("找不到buff")}
    end;
do_use_item(guild_medal, Item = #item{id = Id},
            BaseItem, _Args, Num, Role) ->
    role:send_buff_begin(),
    case role_gain:do_notice([#loss{label = item_id,
                                    val = [{Id, Num}]}],
                             Role)
        of
        {ok, NewRole} ->
            case item:use_normal(NewRole, Item, BaseItem, Num) of
                {ok, UseRole = #role{m_guild = #m_guild{pid = GPid}}} ->
                    GPid ! {add_medal, Num},
                    role:send_buff_flush(),
                    {ok, UseRole};
                {false, Reason} ->
                    role:send_buff_clean(),
                    {false, Reason}
            end;
        {false, _L} ->
            role:send_buff_clean(),
            {false, lang:get("物品数量不足, 无法使用")}
    end;
do_use_item(quest_child_sow, _Item = #item{id = Id},
            _BaseItem, _Args, Num, Role) ->
    role:send_buff_begin(),
    case role_gain:do_notice([#loss{label = item_id,
                                    val = [{Id, Num}]}],
                             Role)
        of
        {ok, NewRole} ->
            case quest_child:sow(NewRole) of
                {ok, UseRole} ->
                    role:send_buff_flush(),
                    {ok, UseRole};
                {false, Reason} ->
                    role:send_buff_clean(),
                    {false, Reason}
            end;
        {false, _L} ->
            role:send_buff_clean(),
            {false, lang:get("物品数量不足, 无法使用")}
    end;
do_use_item(quest_acquaintance, _Item = #item{id = Id},
            _BaseItem, _Args, Num, Role) ->
    role:send_buff_begin(),
    case role_gain:do_notice([#loss{label = item_id,
                                    val = [{Id, Num}]}],
                             Role)
        of
        {ok, NewRole} ->
            case quest_acquaintance:rpc_accept(NewRole) of
                {ok, UseRole} ->
                    role:send_buff_flush(),
                    {ok, UseRole};
                {false, Reason} ->
                    role:send_buff_clean(),
                    {false, Reason}
            end;
        {false, _L} ->
            role:send_buff_clean(),
            {false, lang:get("物品数量不足, 无法使用")}
    end;
do_use_item(pay_gift,
            _Item = #item{id = Id, base_id = BaseId}, _BaseItem,
            _Args, Num,
            Role = #role{lev = Lev, sex = Sex, classes = Classes,
                         m_lev_break = #m_lev_break{times = LevBreak}}) ->
    role:send_buff_begin(),
    case role_gain:do_notice([#loss{label = item_id,
                                    val = [{Id, Num}]}],
                             Role)
        of
        {ok, NRole} ->
            case month_gift_data:get_pay_gift(BaseId) of
                [] ->
                    role:send_buff_clean(),
                    {false, lang:get("没有找到礼包")};
                ItemList = [#pay_gift_item_data{price = Price} | _] ->
                    case [{IItemId, IBind, INum}
                          || #pay_gift_item_data{item_id = IItemId,
                                                 bind = IBind, num = INum,
                                                 min_lev = MinLev,
                                                 max_lev = MaxLev, sex = ISex,
                                                 classes = IClasses,
                                                 min_lev_break = MinLevBreak,
                                                 max_lev_break = MaxLevBreak}
                                 <- ItemList,
                             (MinLev == 0 andalso MaxLev == 0 orelse
                                  Lev >= MinLev andalso Lev =< MaxLev)
                                 andalso
                                 (ISex == 2 orelse Sex == ISex) andalso
                                     (IClasses == 0 orelse IClasses == Classes)
                                         andalso
                                         (MinLevBreak == 0 andalso
                                              MaxLevBreak == 0
                                              orelse
                                              LevBreak >= MinLevBreak andalso
                                                  LevBreak =< MaxLevBreak)]
                        of
                        [] ->
                            role:send_buff_clean(),
                            {false, lang:get("没有符合的道具")};
                        AddItems ->
                            case role_gain:do_notice(format:val_to_loss(Price),
                                                     NRole)
                                of
                                {ok, NRole2} ->
                                    AddItems2 = [{IItemId, IBind, INum * Num}
                                                 || {IItemId, IBind, INum}
                                                        <- AddItems],
                                    Gain = format:val_to_gain(AddItems2),
                                    case role_gain:do_notice(Gain, NRole2) of
                                        {ok, NewRole} ->
                                            role:send_buff_flush(),
                                            {ok, NewRole};
                                        {false, _} ->
                                            role:send_buff_flush(),
                                            mail:send(Role,
                                                      item:attr(name, BaseId),
                                                      notice:format(lang:get("打开~ts时背包空间不足，请查收"),
                                                                    [{item_2,
                                                                      BaseId}]),
                                                      AddItems2),
                                            notice:send(Role,
                                                        3,
                                                        lang:get("背包已满，奖励已通过邮件发放")),
                                            {ok, NRole2}
                                    end;
                                {false, #loss{label = gold}} ->
                                    role:send_buff_clean(),
                                    {false, lang:get("钻石不足")};
                                {false, _} ->
                                    role:send_buff_clean(),
                                    {false, lang:get("材料不足")}
                            end
                    end
            end;
        {false, _L} ->
            role:send_buff_clean(),
            {false, lang:get("物品数量不足, 无法使用")}
    end;
do_use_item(furnishing,
            #item{id = Id, base_id = BaseId}, _BaseItem, _Args, Num,
            Role = #role{m_family =
                             #m_family{cur_id = FamilyId}}) ->
    case FamilyId of
        {0, "", 0} -> {false, lang:get("您还没有创建家园哦")};
        _ ->
            role:send_buff_begin(),
            case role_gain:do([#loss{label = item_id,
                                     val = [{Id, Num}]}],
                              Role)
                of
                {ok, NewRole} ->
                    case family_data:get_item_furnishing_id(BaseId) of
                        Fid when is_integer(Fid) ->
                            role:send_buff_flush(),
                            family_logic:add_frunishing(NewRole, Fid, Num),
                            FurName = case family_data:get_furnishing(Fid) of
                                          #{name := TmpName} -> TmpName;
                                          _ -> lang:get("无名家具")
                                      end,
                            ItemAddMsg =
                                notice:format(lang:get("家园增加了一个[~ts]，可在家具布置中使用"),
                                              [{string_2, 5, FurName}]),
                            notice:return(ItemAddMsg),
                            {ok, NewRole};
                        _ ->
                            role:send_buff_clean(),
                            logger:error("道具:~w 无法转换成家具",
                                         [BaseId],
                                         item_use,
                                         647),
                            {false, lang:get("错误的家具")}
                    end;
                {false, _L} ->
                    role:send_buff_clean(),
                    {false, lang:get("物品数量不足, 无法使用")}
            end
    end;
do_use_item(exp_heart_obtain,
            #item{id = Id, base_id = _BaseId, step = Step},
            _BaseItem, _Args, Num, Role = #role{lev = Lev}) ->
    case var:get_var(Role, day, 626, 0) of
        _Val when _Val >= 5 ->
            {false, lang:get("每天最多使用5次经验圣水哦")};
        Val ->
            case experience_bottle_data:get(Step) of
                {_, _, LevMin, LevMax, _}
                    when Lev < LevMin orelse Lev > LevMax ->
                    {false,
                     notice:format(lang:get("这瓶经验圣水适用于~ts到~ts级，你无法使用哦"),
                                   [{string_2, 5, LevMin},
                                    {string_2, 5, LevMax}])};
                {_, _, _, _, Exp} ->
                    role:send_buff_begin(),
                    case role_gain:do_notice([#loss{label = item_id,
                                                    val = [{Id, Num}]}],
                                             Role)
                        of
                        {ok, Role1} ->
                            case role_gain:do([#gain{label = exp,
                                                     val = Exp * Num}],
                                              Role1,
                                              #{})
                                of
                                {ok, NewRole, #{new_gl := NewGL}} ->
                                    role:send_buff_flush(),
                                    Msg1 = case NewGL of
                                               [#gain{label = exp,
                                                      val = Exp1}] ->
                                                   notice:format(lang:get("获得~ts经验（今天还能使用~ts瓶）"),
                                                                 [{string_2,
                                                                   5,
                                                                   Exp1},
                                                                  {string_2,
                                                                   5,
                                                                   5 - Val -
                                                                       Num}]);
                                               [#gain{label = coin,
                                                      val = Coin1}] ->
                                                   notice:format(lang:get("获得~ts银币（今天还能使用~ts瓶）"),
                                                                 [{string_2,
                                                                   5,
                                                                   Coin1},
                                                                  {string_2,
                                                                   5,
                                                                   5 - Val -
                                                                       Num}]);
                                               _ ->
                                                   notice:format(lang:get("获得~ts经验（今天还能使用~ts瓶）"),
                                                                 [{string_2,
                                                                   5,
                                                                   Exp * Num},
                                                                  {string_2,
                                                                   5,
                                                                   5 - Val -
                                                                       Num}])
                                           end,
                                    Msg2 = notice:format(lang:get("~ts"),
                                                         [{string_1, Msg1}]),
                                    notice:send(NewRole, 3, Msg2),
                                    NewRole2 = var:set_var(NewRole,
                                                           day,
                                                           626,
                                                           Val + Num),
                                    {ok, NewRole2};
                                _Err ->
                                    role:send_buff_clean(),
                                    logger:debug("使用经验心得失败:~w",
                                                 [_Err],
                                                 item_use,
                                                 686),
                                    {false, lang:get("使用经验心得失败")}
                            end;
                        {false, _L} ->
                            role:send_buff_clean(),
                            {false, lang:get("物品数量不足, 无法使用")}
                    end
            end
    end;
do_use_item(make_red_packet,
            _Item = #item{id = Id, data = Data}, _BaseItem, _Args,
            Num, Role = #role{}) ->
    logger:debug("~w", [_Item], item_use, 698),
    role:send_buff_begin(),
    case role_gain:do([#loss{label = item_id,
                             val = [{Id, Num}]}],
                      Role)
        of
        {ok, NRole} ->
            case provocation_role:make_red_packet(NRole, Data) of
                ok ->
                    role:send_buff_flush(),
                    {ok, NRole};
                {ok, NewRole} ->
                    role:send_buff_flush(),
                    {ok, NewRole};
                {false, Reason} ->
                    role:send_buff_clean(),
                    {false, Reason};
                _ ->
                    role:send_buff_clean(),
                    {false, lang:get("无法使用此物品")}
            end;
        _ ->
            role:send_buff_clean(),
            {false, lang:get("物品数量不足, 无法使用")}
    end;
do_use_item(normal, Item = #item{id = Id}, BaseItem,
            _Args, Num, Role) ->
    role:send_buff_begin(),
    case role_gain:do_notice([#loss{label = item_id,
                                    val = [{Id, Num}]}],
                             Role)
        of
        {ok, NewRole} ->
            case item:use_normal(NewRole, Item, BaseItem, Num) of
                {ok, UseRole} ->
                    role:send_buff_flush(),
                    {ok, UseRole};
                {false, Reason} ->
                    role:send_buff_clean(),
                    {false, Reason}
            end;
        {false, _L} ->
            role:send_buff_clean(),
            {false, lang:get("物品数量不足, 无法使用")}
    end;
do_use_item(_Type, _Item, _BaseItem, _Args, _Num,
            _Role) ->
    logger:error("使用道具匹配错误:~w,~w",
                 [_Type, _BaseItem],
                 item_use,
                 740),
    ok.

do_buff_show_notice(Role = #role{m_buff =
                                     #m_buff{show = Show}}) ->
    case Show of
        0 ->
            Msg =
                lang:get("变身后将显示<color='#ffff00'>原外观</color>，可在<color='"
                         "#ffff00'>[提升-变身]</color>进行修改"),
            notice:send(Role, 3, Msg);
        _ -> ok
    end.

use_fruit(_Role = #role{s_event = Event}, #item{},
          #item_base{}, _Num)
    when Event =:= 26 orelse Event =:= 27 ->
    {false, lang:get("精灵幻境中不能使用")};
use_fruit(_Role = #role{s_event = Event}, #item{},
          #item_base{}, _Num)
    when Event =:= 51 ->
    {false, lang:get("小猪快跳活动中不能使用")};
use_fruit(Role, Item = #item{},
          #item_base{id = BaseId,
                     effect = [{52, {BookId, SkillLev}} | _]},
          _Num) ->
    case skill_life:check_skill_level(Role, SkillLev) of
        true ->
            case handbook:use_item(BookId, Item, Role) of
                {false, Reason} -> {false, Reason};
                {ok, Role2} ->
                    NewRole = role_trigger:fire(#evt_use_fruit_limit{base_id
                                                                         =
                                                                         BaseId,
                                                                     lev =
                                                                         SkillLev},
                                                Role2),
                    {ok, NewRole}
            end;
        false ->
            Msg = notice:format(lang:get("幻化之术等级不足~ts级，无法使用"),
                                [{string_2, 1, SkillLev}]),
            {false, Msg}
    end.

