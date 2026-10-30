-file("src/mod/shop/shop_mgr.erl", 1).

-module(shop_mgr).

-behaviour(gen_server).

-export([reload/0,
         get_items/2,
         get_buy_info/1,
         get_shop_item/2,
         get_shop_item2/2,
         buy/3,
         shop_tab_name/2]).

-export([start_link/0]).

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

-file("src/mod/shop/shop_mgr.erl", 22).

-file("inc/shop.hrl", 1).

-record(shop_item,
        {id = 0 :: non_neg_integer(),
         base_id = 0 :: non_neg_integer(),
         name = "" :: bitstring(),
         num = 0 :: non_neg_integer(),
         bind = 1,
         sex = 2 :: 0..2,
         lev = 1 :: pos_integer(),
         max_lev = 0 :: pos_integer(),
         classes = 0 :: 0..4,
         min_break = 0,
         max_break = 0,
         price = 1 :: integer(),
         tab = 1 :: pos_integer(),
         tab2 = 0 :: non_neg_integer(),
         label = 0,
         limit_type = normal :: normal | day | week,
         limit_role = 0 :: integer(),
         sort = 0 :: non_neg_integer(),
         assets_type = gold :: atom(),
         discount = 1000 :: non_neg_integer(),
         privilege_lev = 0,
         privilege_role = [],
         rencounter_lev = 0,
         ext_args = "",
         achievement_limit = [],
         market_change = 0}).

-record(shop, {}).

-file("src/mod/shop/shop_mgr.erl", 23).

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

-file("src/mod/shop/shop_mgr.erl", 24).

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

-file("src/mod/shop/shop_mgr.erl", 25).

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

-file("src/mod/shop/shop_mgr.erl", 26).

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

-file("src/mod/shop/shop_mgr.erl", 27).

-file("inc/log.hrl", 1).

-file("src/mod/shop/shop_mgr.erl", 28).

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

-file("src/mod/shop/shop_mgr.erl", 29).

-file("inc/package.hrl", 1).

-record(package,
        {type = 1 :: integer(),
         next_id = 1 :: pos_integer(),
         volume = 0 :: non_neg_integer(),
         free_cell = [] :: list(),
         items = [] :: [tuple()]}).

-file("src/mod/shop/shop_mgr.erl", 30).

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

-file("src/mod/shop/shop_mgr.erl", 31).

-file("inc/achievement.hrl", 1).

-record(m_achievement,
        {ver = 3 :: pos_integer(),
         point = 0 :: non_neg_integer(),
         finish = [] :: [{pos_integer(), pos_integer()}],
         doing = [] :: [tuple()],
         overdue = [] :: [pos_integer()],
         assets_point = 0 :: non_neg_integer(),
         focus = []}).

-record(achievement_log,
        {id = 0,
         accept = 0 :: integer(),
         finish = 0 :: integer()}).

-file("src/mod/shop/shop_mgr.erl", 32).

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

-file("src/mod/shop/shop_mgr.erl", 33).

-file("inc/camp_lucky_draw.hrl", 1).

-author("jia").

-record(camp_lucky_draw_reward_base,
        {group_id = 0,
         base_id = 0,
         bind = 0,
         num = 0,
         min_times = 0,
         is_free = 0,
         weight = 0,
         icon = "",
         min_lev = 0,
         max_lev = 0,
         sex = 2,
         classes = 0,
         is_record = 0,
         is_effect = 0,
         is_cast = 0,
         add_weight = 0,
         is_zone_cast = 0}).

-record(camp_lucky_draw_role,
        {rid = {0, "", 0},
         name = "",
         lev = 0,
         sex = 2,
         classes = 0,
         free_times = 0,
         draw_times = 0,
         update_time = 0}).

-record(camp_lucky_draw_info,
        {camp_id = 0, gold = 0, add_gold = 0, msg_list = []}).

-record(camp_lucky_draw_record_msg,
        {add_time = 0, msg = ""}).

-file("src/mod/shop/shop_mgr.erl", 34).

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

-file("src/mod/shop/shop_mgr.erl", 36).

-file("inc/privilege.hrl", 1).

-record(m_privilege,
        {ver = 2,
         lev = 0,
         list = [],
         new_list = [],
         new_prilist = []}).

-record(privilege_data,
        {lev = 0,
         min = 0,
         max = 0,
         title = "",
         content = "",
         item = []}).

-record(privilege_type_data,
        {lev = 0, type = 0, val = 0, args = [], old_item = []}).

-record(privilege_role,
        {id = {0, "", 0},
         ver = 2,
         lev = 0,
         privilege_lev = 0,
         buy_list = [],
         pri_list = []}).

-record(privilege_item,
        {id = 0,
         item_id = 0,
         is_self = 0,
         bind = 0,
         num = 0,
         weigth = 0,
         is_cast = 0}).

-record(privilege_gift,
        {id = 0,
         need_val = 0,
         reward = [],
         privileges = [],
         title = "",
         content = "",
         client_show = [],
         mail_title = "",
         mail_content = ""}).

-file("src/mod/shop/shop_mgr.erl", 37).

buy(Role, BuyId, BuyNum) ->
    do_buy([check, buy, send_data],
           BuyId,
           BuyNum,
           Role,
           []).

do_buy([], _BuyId, _BuyNum, Role, _Args) -> {ok, Role};
do_buy([check | T], BuyId, BuyNum, Role, Args) ->
    case calc_buy(BuyId, BuyNum, Role) of
        {false, Reason} -> {false, Reason};
        {true, SI, Evt, EtsInfo} ->
            do_buy(T,
                   BuyId,
                   BuyNum,
                   Role,
                   [{item, SI, EtsInfo}, {evt, Evt} | Args])
    end;
do_buy([buy | T], BuyId, BuyNum,
       Role = #role{pid = Pid,
                    m_achievement = #m_achievement{point = Achievement}},
       Args) ->
    Data = case lists:keyfind(item, 1, Args) of
               {_,
                Si = #shop_item{base_id = BaseId, price = Price,
                                num = Num, bind = Bind, discount = Discount,
                                assets_type = Label, achievement_limit = AL,
                                market_change = MarketChange},
                LimitEts}
                   when Price > 0 andalso Num =/= 0 andalso BuyNum > 0 ->
                   NewPrice = case MarketChange of
                                  1 ->
                                      case get_market_change_price(Role, Si) of
                                          {ok, ChangePrice} -> ChangePrice;
                                          _ -> Price
                                      end;
                                  _ -> Price
                              end,
                   Val = NewPrice * Num * BuyNum,
                   Discount2 = case check_achievement(AL, Achievement) of
                                   true -> Discount;
                                   {true, Dis} -> Dis;
                                   {false, _Reason} -> Discount
                               end,
                   Val1 = util:ceil(Val * Discount2 / 1000),
                   BaseId1 = item_type:special_id(BaseId),
                   NewVal = market:get_open_srv_price(BaseId1, Val1),
                   Label2 = get_new_label(Label),
                   NewVal2 = get_new_val(Label, NewVal),
                   logger:debug("===========新的价格==============~w",
                                [{Val1, NewVal2}],
                                shop_mgr,
                                78),
                   GL = [#loss{label = Label2, val = NewVal2, source = 2}
                         | [VG#gain{source = 2}
                            || VG = #gain{}
                                   <- format:val_to_gain([{BaseId1,
                                                           Bind,
                                                           Num * BuyNum}])]],
                   Si1 = Si#shop_item{assets_type = Label2,
                                      base_id = BaseId1},
                   {true, GL, Si1, LimitEts};
               _ -> {false, lang:get("购买方式错误, 无法购买")}
           end,
    case Data of
        {false, Reason} -> {false, Reason};
        {true,
         DoGL = [Gold, #gain{val = ValList}],
         GetSi = #shop_item{assets_type = LabelT,
                            base_id = ItemBaseId},
         EtsInfo} ->
            case role_gain:auto_overlap(DoGL, Role) of
                {false, #loss{label = gold}} ->
                    {false, lang:get("购买失败，钻石不足")};
                {false, #loss{label = gold_bind}} ->
                    {false, lang:get("购买失败，金币不足")};
                {false, #loss{label = coin}} ->
                    {false, lang:get("购买失败，银币不足")};
                {false, #loss{label = stars_score}} ->
                    {false, lang:get("购买失败，星辰积分不足")};
                {false, #loss{label = character}} ->
                    {false, lang:get("购买失败，人品值不足")};
                {false, #loss{label = love}} ->
                    {false, lang:get("购买失败，恩爱值不足")};
                {false, #loss{label = teacher_score}} ->
                    {false, lang:get("购买失败，师道值不足")};
                {false, #loss{label = tournament}} ->
                    {false, lang:get("购买失败，王者积分不足")};
                {false, #loss{label = lottery_luck}} ->
                    {false, lang:get("购买失败，幸运值不足")};
                {false, #loss{label = autumn_score}} ->
                    {false, lang:get("购买失败，中秋积分不足")};
                {false, #loss{label = star_gold}} ->
                    {false, lang:get("购买失败，星钻不足")};
                {false, #loss{label = halloween}} ->
                    {false, lang:get("购买失败，南瓜币不足")};
                {false, #loss{label = thanksgiving}} ->
                    {false, lang:get("购买失败，感恩积分不足")};
                {false, #loss{label = star_gold_or_gold}} ->
                    {false, lang:get("购买失败，钻石不足")};
                {false, #loss{label = brother}} ->
                    {false, lang:get("购买失败，兄弟币不足")};
                {false, #loss{label = egg}} ->
                    {false, lang:get("购买失败，扭蛋积分不足")};
                {false, #loss{label = turn}} ->
                    {false, lang:get("购买失败，充值转盘积分不足")};
                {false, #gain{label = item_base_id}} ->
                    {false, lang:get("购买失败，背包空间不足")};
                {false, #loss{label = lucky_ticket}} ->
                    {false, lang:get("购买失败，幸运宝券不足")};
                {false, #loss{label = dollar}} ->
                    {false, lang:get("购买失败，充值礼券不足")};
                {false, #loss{label = naughty}} ->
                    {false, lang:get("购买失败，淘气值不足")};
                {false, #loss{label = concentric}} ->
                    {false, lang:get("购买失败，同心值不足")};
                {false, #loss{label = qixiIntegral}} ->
                    {false, lang:get("购买失败，七夕积分不足")};
                {ok, NewRole2, SucL, []} ->
                    DoGL1 = gain_text_change(DoGL, SucL, []),
                    Text = format:gain_text(DoGL1, NewRole2),
                    notice:send(NewRole2, 3, Text),
                    NewRole = case shop_data:get_present(BuyId) of
                                  #{base_id := PresentBaseId,
                                    bind := PresentBind, num := PresentNum,
                                    title := Title, content := Content} ->
                                      PresentGain =
                                          format:val_to_gain([{PresentBaseId,
                                                               PresentBind,
                                                               PresentNum *
                                                                   BuyNum}]),
                                      PresentNotice =
                                          notice:format(lang:get("恭喜获得来自绯月女神的祝福额外获得~ts"),
                                                        [{item_2,
                                                          PresentBaseId,
                                                          PresentNum *
                                                              BuyNum}]),
                                      notice:send(NewRole2, 1, PresentNotice),
                                      case role_gain:do(PresentGain, NewRole2)
                                          of
                                          {ok, NewRole3} -> NewRole3;
                                          _ ->
                                              mail:send(NewRole2,
                                                        Title,
                                                        Content,
                                                        [{PresentBaseId,
                                                          PresentBind,
                                                          PresentNum *
                                                              BuyNum}]),
                                              NewRole2
                                      end;
                                  _ -> NewRole2
                              end,
                    notice:gain_item(Pid, 1, ValList),
                    Costs = case Gold of
                                #loss{val = CostVal} -> CostVal;
                                _ -> 0
                            end,
                    log:shop(NewRole, GetSi, Costs),
                    NewRole1 = case ItemBaseId of
                                   70895 ->
                                       LuckyBagBuyTimes = var:get_var(NewRole,
                                                                      other,
                                                                      2112,
                                                                      0),
                                       var:set_var(NewRole,
                                                   other,
                                                   2112,
                                                   LuckyBagBuyTimes + 1);
                                   70024 ->
                                       ExpBottleBuyTimes = var:get_var(NewRole,
                                                                       week,
                                                                       214,
                                                                       0),
                                       case ExpBottleBuyTimes < 10 andalso
                                                ExpBottleBuyTimes + BuyNum >= 10
                                           of
                                           true ->
                                               mail:send(Role,
                                                         lang:get("圣水祝福"),
                                                         lang:get("圣灵恩赐，由于你本周潜心积累，获得了<color='#ffff00'>10个经验圣瓶</c"
                                                                  "olor>，得到了<color='#ffff00'>圣灵的祝福</color>，请您查收{"
                                                                  "face_1, 31}"),
                                                         [{26026, 1},
                                                          {26027, 1}]);
                                           _ -> ok
                                       end,
                                       var:set_var(NewRole,
                                                   week,
                                                   214,
                                                   ExpBottleBuyTimes + BuyNum);
                                   _ -> NewRole
                               end,
                    update_ets(EtsInfo, NewRole1, GetSi, BuyNum),
                    do_buy(T, BuyId, BuyNum, NewRole1, Args);
                {ok, _, _SucL, _FailL} ->
                    logger:error("购买[BuyId:~w][base_id:~w]失败[Err:~w]",
                                 [BuyId, ItemBaseId, {_SucL, _FailL}],
                                 shop_mgr,
                                 188),
                    {false, lang:get("购买失败")};
                {false, _} ->
                    push_9908(LabelT, Role),
                    {false, lang:get("资产不足，购买失败")};
                _False ->
                    logger:error("购买[BuyId:~w][base_id:~w]失败[Err:~w]",
                                 [BuyId, ItemBaseId, _False],
                                 shop_mgr,
                                 194),
                    {false, lang:get("购买失败")}
            end
    end;
do_buy([send_data | T], BuyId, BuyNum, Role, Args) ->
    case lists:keyfind(evt, 1, Args) of
        {_, Evts} ->
            NewRole = role_trigger:fire(Evts, Role),
            case BuyId =:= 640 orelse BuyId =:= 641 of
                true ->
                    Text2 = notice:format(lang:get("感谢您购买~ts，~ts已发放至您的邮箱"),
                                          [{string_2, 3, "[未来战士]"},
                                           {string_2, 3, "[机甲面罩箱]"}]),
                    notice:send(Role, 3, Text2),
                    mail:send(Role,
                              lang:get("机甲面罩箱"),
                              notice:format(lang:get("感谢您购买~ts，~ts已送达，购买即可获得2017年专属限定头饰。"),
                                            [{string_2, 5, "[未来战士]"},
                                             {string_2, 5, "[机甲面罩箱]"}]),
                              [{25026, 1}]);
                _ -> ok
            end,
            do_buy(T, BuyId, BuyNum, NewRole, Args);
        _ -> {false, lang:get("无法找到事件")}
    end.

gain_text_change([], [], Acc) -> lists:reverse(Acc);
gain_text_change([GL = #loss{label = star_gold_or_gold}
                  | T1],
                 [#loss{label = gold, val = 0}, #loss{label = star_gold}
                  | T2],
                 Acc1) ->
    gain_text_change(T1,
                     T2,
                     [GL#loss{label = star_gold} | Acc1]);
gain_text_change([GL = #loss{label = star_gold_or_gold}
                  | T1],
                 [#loss{label = gold}, #loss{label = star_gold, val = 0}
                  | T2],
                 Acc1) ->
    gain_text_change(T1,
                     T2,
                     [GL#loss{label = gold} | Acc1]);
gain_text_change([GL = #loss{label = star_gold_or_gold}
                  | T1],
                 [#loss{label = gold, val = Val},
                  #loss{label = star_gold}
                  | T2],
                 Acc1) ->
    gain_text_change(T1,
                     T2,
                     [GL#loss{ext_val = Val} | Acc1]);
gain_text_change([GL = #loss{label = star_gold_or_gold}
                  | T1],
                 [#loss{label = gold} | T2], Acc1) ->
    gain_text_change(T1,
                     T2,
                     [GL#loss{label = gold} | Acc1]);
gain_text_change([GL = #loss{label = star_gold_or_gold}
                  | T1],
                 [#loss{label = star_gold} | T2], Acc1) ->
    gain_text_change(T1,
                     T2,
                     [GL#loss{label = star_gold} | Acc1]);
gain_text_change([GL | T1], [_Sucl | T2], Acc1) ->
    gain_text_change(T1, T2, [GL | Acc1]).

-spec get_buy_info(#role{} | tuple()) -> list() | false.

get_buy_info(#role{id = RoleId}) ->
    get_buy_info(RoleId);
get_buy_info(RoleId) ->
    case catch ets:lookup(ets_shop_role, RoleId) of
        [{_, IdL}] -> recalc_buy(IdL);
        [] -> [];
        _ -> false
    end.

-spec get_items(#role{}, Tab :: pos_integer()) -> {ok,
                                                   list()} |
                                                  {error, term()}.

get_items(Role = #role{sex = Sex, classes = Classes,
                       lev = Lev},
          Tab) ->
    BreakTiems = lev_break:get_times(Role),
    L = list_tab(Tab),
    Fun = fun (Id) ->
                  [SI] = ets:lookup(ets_shop_item, Id),
                  SI
          end,
    L1 = lists:map(Fun, L),
    L2 = [SItem
          || SItem = #shop_item{id = ShopId, sex = NeedSex,
                                classes = NeedClasses, lev = NeedLev,
                                max_lev = MaxLev, min_break = MinBreak,
                                max_break = MaxBreak}
                 <- L1,
             (NeedSex =:= Sex orelse NeedSex =:= 2) andalso
                 ShopId =/= 20 andalso
                     ShopId =/= 21 andalso
                         (Classes =:= NeedClasses orelse NeedClasses =:= 0)
                             andalso
                             Lev >= NeedLev andalso
                                 (MaxLev == 0 orelse Lev =< MaxLev) andalso
                                     delete_flag(SItem, Role) == false andalso
                                         BreakTiems >= MinBreak andalso
                                             BreakTiems =< MaxBreak],
    L3 = case Tab of
             1 -> market_change_price(Role, L2);
             _ -> L2
         end,
    {ok, L3}.

-spec get_shop_item(BaseId :: pos_integer(),
                    Role :: #role{}) -> {ok, pos_integer(), assets_type} |
                                        false.

get_shop_item(BaseId, Role) ->
    case get_shop_item2(BaseId, Role) of
        {ok, NewPrice, AssetsType, _} ->
            {ok, NewPrice, AssetsType};
        Result -> Result
    end.

get_shop_item2(BaseId,
               #role{sex = Sex, classes = Classes, charge = Charge}) ->
    Ms = [{#shop_item{base_id = '$1', tab = '$2',
                      tab2 = '$3', assets_type = '$4', sex = '$5',
                      classes = '$6', _ = '_'},
           [{'andalso',
             {'=:=', BaseId, '$1'},
             {'andalso',
              {'=:=', '$2', 1},
              {'andalso',
               {'=:=', '$3', 1},
               {'andalso',
                {'orelse',
                 {'=:=', '$4', gold},
                 {'=:=', '$4', star_gold_or_gold}},
                {'andalso',
                 {'orelse', {'=:=', Sex, '$5'}, {'=:=', '$5', 2}},
                 {'orelse',
                  {'=:=', '$6', Classes},
                  {'=:=', '$6', 0}}}}}}}],
           ['$_']}],
    case catch ets:select(ets_shop_item, Ms) of
        [#shop_item{id = Id, price = Price,
                    assets_type = AssetsType}
         | _] ->
            NewPrice = market:get_open_srv_price(BaseId, Price),
            {ok, NewPrice, AssetsType, Id};
        [] ->
            case shop_data:get_invisible_item(BaseId) of
                #{need_charge := NeedCharge} when NeedCharge > Charge ->
                    {false,
                     notice:format(lang:get("还需充值~ts才可购买"),
                                   [{item_2, [{90002, NeedCharge - Charge}]}])};
                #{price := Price} ->
                    NewPrice = market:get_open_srv_price(BaseId, Price),
                    {ok, NewPrice, gold};
                _False -> false
            end;
        _Unkown ->
            logger:error("获取物品[BaseId:~w]商城价格错误[~w]",
                         [BaseId, _Unkown],
                         shop_mgr,
                         311),
            false
    end.

broad() ->
    [role_group:pack_send(world, 11300, {Tab, 1})
     || Tab <- [1, 2]],
    ok.

-spec reload() -> ok.

reload() -> gen_server:cast(shop_mgr, reload).

start_link() ->
    gen_server:start_link({local, shop_mgr},
                          shop_mgr,
                          [],
                          []).

init([]) ->
    logger:info("[~w] 正在启动...", [shop_mgr], shop_mgr, 335),
    process_flag(trap_exit, true),
    ets:new(ets_shop_item,
            [set, protected, {keypos, #shop_item.id}, named_table]),
    ets:new(ets_shop_role,
            [set, public, {keypos, 1}, named_table]),
    ets:new(ets_shop,
            [set, public, {keypos, 1}, named_table]),
    dets:open_file(dets_shop_role,
                   [{file, "./dets/shop.dets"}, {keypos, 1}, {type, set}]),
    dets:to_ets(dets_shop_role, ets_shop_role),
    Shop = do_reload(),
    erlang:send_after(date:next_diff(0, 0, 0) * 1000,
                      self(),
                      reload),
    logger:info("[~w] 启动完成...", [shop_mgr], shop_mgr, 344),
    {ok, Shop}.

handle_call(_Request, _From, State) -> {noreply, State}.

handle_cast(reload, _State) ->
    S = do_reload(),
    broad(),
    {noreply, S};
handle_cast(_Msg, State) -> {noreply, State}.

handle_info(reload, _State) ->
    S = do_reload(),
    broad(),
    erlang:send_after(date:next_diff(0, 0, 0) * 1000,
                      self(),
                      reload),
    {noreply, S};
handle_info(_Info, State) -> {noreply, State}.

terminate(_Reason, _State) ->
    logger:info("[~w] 正在关闭...", [shop_mgr], shop_mgr, 368),
    logger:info("[~w] 关闭完成", [shop_mgr], shop_mgr, 369),
    ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

list_tab(Type) ->
    case catch ets:lookup(ets_shop, Type) of
        [{Type, L}] -> L;
        _ -> []
    end.

%% Keep only the permanent variant when a timed variant shares the same base name.
dedupe_shop(Items) ->
    PermanentBases =
        [Base
         || #shop_item{name = Name} <- Items,
            {Base, true} <- [shop_name_info(Name)]],
    Filtered =
        [I
         || I = #shop_item{name = Name} <- Items,
            keep_shop_item(Name, PermanentBases)],
    dedupe_names(Filtered, [], []).

keep_shop_item(Name, PermanentBases) ->
    {Base, IsPermanent} = shop_name_info(Name),
    IsPermanent orelse not lists:member(Base, PermanentBases).

dedupe_names([], Acc, _Seen) -> lists:reverse(Acc);
dedupe_names([I = #shop_item{id = Id, name = Name, base_id = BaseId}
              | T],
             Acc, Seen) ->
    Key = case Id >= 25000 andalso Id =< 25099 of
              true -> {Name, BaseId};
              false -> Name
          end,
    case lists:member(Key, Seen) of
        true -> dedupe_names(T, Acc, Seen);
        false -> dedupe_names(T, [I | Acc], [Key | Seen])
    end.

shop_name_info(Name0) ->
    Name = case is_binary(Name0) of
               true -> unicode:characters_to_list(Name0);
               false -> Name0
           end,
    case string:rstr(Name, "·") of
        0 -> {Name, false};
        Pos ->
            Suffix = lists:nthtail(Pos - 1, Name),
            IsTimed = string:str(Suffix, "天") > 0,
            IsPermanent = string:str(Suffix, "永久") > 0,
            case IsTimed orelse IsPermanent of
                true -> {lists:sublist(Name, Pos - 1), IsPermanent};
                false -> {Name, false}
            end
    end.

do_reload() ->
    ets:delete_all_objects(ets_shop_item),
    ets:delete_all_objects(ets_shop),
    Fun1 = fun (SI = #shop_item{id = Id}) ->
                   ets:insert(ets_shop_item, SI),
                   Id
           end,
    Fun = fun (L) ->
                  NewL = lists:keysort(#shop_item.sort, L),
                  [Fun1(SI) || SI <- NewL]
          end,
    AllList = dedupe_shop(shop_data:get_list() ++ shop_data_2025:extra_list()),
    GoldList = [Si || Si = #shop_item{tab = 1} <- AllList],
    DiscountGoldList =
        calc_campaign_discount_price(GoldList),
    IntegralList = [Si
                    || Si = #shop_item{tab = 2} <- AllList],
    ets:insert(ets_shop, {1, Fun(DiscountGoldList)}),
    ets:insert(ets_shop, {2, Fun(IntegralList)}),
    #shop{}.

calc_buy(BuyId, BuyNum, Role) ->
    case check(BuyId, BuyNum, Role) of
        {false, Reason} -> {false, Reason};
        {ok,
         SI = #shop_item{tab = Tab, base_id = BaseId, num = Q,
                         price = Price, assets_type = AssetsType},
         EtsInfo} ->
            case tab_to_assets(Tab, AssetsType) of
                false -> {false, lang:get("无法识别的商场类型")};
                AssetsType1 ->
                    Evt = #evt_shop_buy{assets_type = AssetsType1,
                                        val = Price * Q * BuyNum,
                                        base_id = BaseId, num = Q * BuyNum},
                    {true, SI, Evt, EtsInfo}
            end
    end.

tab_to_assets(1, gold) -> 90002;
tab_to_assets(1, gold_bind) -> 90003;
tab_to_assets(1, star_gold) -> 90002;
tab_to_assets(1, star_gold_or_gold) -> 90002;
tab_to_assets(2, character) -> 90007;
tab_to_assets(2, stars_score) -> 90012;
tab_to_assets(2, love) -> 90018;
tab_to_assets(2, teacher_score) -> 90019;
tab_to_assets(2, tournament) -> 90020;
tab_to_assets(2, lottery_luck) -> 90022;
tab_to_assets(2, autumn_score) -> 90025;
tab_to_assets(2, star_gold) -> 90002;
tab_to_assets(2, halloween) -> 90027;
tab_to_assets(2, thanksgiving) -> 90028;
tab_to_assets(2, new_year) -> 90029;
tab_to_assets(2, firecracker) -> 90033;
tab_to_assets(2, gold_bind) -> 90003;
tab_to_assets(2, coin) -> 90000;
tab_to_assets(2, gold) -> 90002;
tab_to_assets(2, star_gold_or_gold) -> 90002;
tab_to_assets(2, glue_pudding) -> 90034;
tab_to_assets(2, father) -> 90041;
tab_to_assets(2, ticket) -> 90037;
tab_to_assets(2, brother) -> 90036;
tab_to_assets(2, egg) -> 90038;
tab_to_assets(2, turn) -> 90040;
tab_to_assets(2, lucky_ticket) -> 90042;
tab_to_assets(2, dollar) -> 90044;
tab_to_assets(2, naughty) -> 90045;
tab_to_assets(2, concentric) -> 90046;
tab_to_assets(2, qixiIntegral) -> 90047;
tab_to_assets(2, cut_price) -> 90049;
tab_to_assets(2, single_dog) -> 90050;
tab_to_assets(2, hallowmas) -> 29811;
tab_to_assets(2, panda_score) -> 90051;
tab_to_assets(2, joyful_egg) -> 90052;
tab_to_assets(2, christmas_snow) -> 29915;
tab_to_assets(2, godswar) -> 90056;
tab_to_assets(2, happy_score) -> 90057;
tab_to_assets(2, lucky_knot) -> 29971;
tab_to_assets(2, slot_machine) -> 90061;
tab_to_assets(2, zillionaire_sc) -> 90063;
tab_to_assets(2, new_open_turn) -> 90067;
tab_to_assets(2, long_score) -> 90069;
tab_to_assets(2, camp_pray_sc) -> 90071;
tab_to_assets(_, _) -> false.

get_new_label(hallowmas) -> item_base_id;
get_new_label(christmas_snow) -> item_base_id;
get_new_label(lucky_knot) -> item_base_id;
get_new_label(long_active_item) -> item_base_id;
get_new_label(Label) -> Label.

get_new_val(hallowmas, Val) -> [{29811, Val}];
get_new_val(christmas_snow, Val) -> [{29915, Val}];
get_new_val(lucky_knot, Val) -> [{29971, Val}];
get_new_val(_, Val) -> Val.

push_9908(hallowmas, #role{pid = Pid} = _Role) ->
    role:apply(async,
               Pid,
               {role_gain, push_9908, [hallowmas]});
push_9908(christmas_snow, #role{pid = Pid} = _Role) ->
    role:apply(async,
               Pid,
               {role_gain, push_9908, [christmas_snow]});
push_9908(lucky_knot, #role{pid = Pid} = _Role) ->
    role:apply(async,
               Pid,
               {role_gain, push_9908, [lucky_knot]});
push_9908(long_active_item, #role{pid = Pid} = _Role) ->
    role:apply(async,
               Pid,
               {role_gain, push_9908, [long_active_item]});
push_9908(_, _Role) -> ignore.

check(Id, Num,
      Role = #role{id = RoleId, charge = Charge, lev = Lev,
                   m_achievement = #m_achievement{point = Achievement}}) ->
    PLev = privilege:get_privilege(Role),
    BreakTiems = lev_break:get_times(Role),
    case get_buy_info(RoleId) of
        false -> {false, lang:get("系统正忙, 无法购买")};
        IdL ->
            case catch ets:lookup(ets_shop_item, Id) of
                [] -> {false, lang:get("不存在此商品")};
                [#shop_item{lev = NeedLev}] when Lev < NeedLev ->
                    {false,
                     notice:format(lang:get("等级高于~ts级，才能购买"),
                                   [{string_2, 5, NeedLev}])};
                [#shop_item{max_lev = MaxLev}] when Lev > MaxLev ->
                    {false,
                     notice:format(lang:get("等级高于~ts级，不能购买"),
                                   [{string_2, 5, MaxLev}])};
                [#shop_item{min_break = MinBreak}]
                    when BreakTiems < MinBreak ->
                    {false, lang:get("突破次数不足，不能购买")};
                [#shop_item{max_break = MaxBreak}]
                    when BreakTiems > MaxBreak ->
                    {false,
                     notice:format(lang:get("突破次数高于~ts，不能购买"),
                                   [{string_2, 5, MaxBreak}])};
                [SI = #shop_item{limit_type = normal, privilege_lev = 0,
                                 achievement_limit = AL}] ->
                    CheckFlag = case check_achievement(AL, Achievement) of
                                    true -> check_rencounter(SI, Role);
                                    {true, _Discount} ->
                                        check_rencounter(SI, Role);
                                    {false, Reas} -> {false, Reas}
                                end,
                    case CheckFlag of
                        true -> {ok, SI, IdL};
                        {false, Reason} -> {false, Reason}
                    end;
                [SI = #shop_item{limit_type = normal, limit_role = -1,
                                 achievement_limit = AL}] ->
                    CheckFlag = case check_achievement(AL, Achievement) of
                                    true -> check_rencounter(SI, Role);
                                    {true, _Discount} ->
                                        check_rencounter(SI, Role);
                                    {false, Reas} -> {false, Reas}
                                end,
                    case CheckFlag of
                        true -> {ok, SI, IdL};
                        {false, Reason} -> {false, Reason}
                    end;
                [SI = #shop_item{limit_type = normal,
                                 achievement_limit = AL}] ->
                    CheckFlag = case check_achievement(AL, Achievement) of
                                    true -> check_rencounter(SI, Role);
                                    {true, _Discount} ->
                                        check_rencounter(SI, Role);
                                    {false, Reas} -> {false, Reas}
                                end,
                    case CheckFlag of
                        true -> {ok, SI, IdL};
                        {false, Reason} -> {false, Reason}
                    end;
                [#shop_item{limit_role = -1}] ->
                    {false, lang:get("异常的限购类型")};
                [#shop_item{limit_role = Lr, privilege_role = []}]
                    when Lr < Num ->
                    {false, lang:get("选择购买数量超出上限，无法购买")};
                [SI = #shop_item{base_id = BaseId,
                                 limit_type = LimitType, limit_role = Lr,
                                 privilege_lev = Privilege,
                                 privilege_role = PrivilegeRole,
                                 achievement_limit = AL}] ->
                    CheckFlag = case check_achievement(AL, Achievement) of
                                    true -> check_rencounter(SI, Role);
                                    {true, _Discount} ->
                                        check_rencounter(SI, Role);
                                    {false, Reas} -> {false, Reas}
                                end,
                    case CheckFlag of
                        true ->
                            case campaign_mgr:check_new_camp(RoleId) of
                                false ->
                                    case Privilege > PLev of
                                        true ->
                                            PrivilegeMin =
                                                privilege:get_privilege_min(Privilege),
                                            {false,
                                             notice:format(lang:get("还需充值 ~ts 才可购买"),
                                                           [{item_2,
                                                             [{90002,
                                                               max(PrivilegeMin
                                                                       - Charge,
                                                                   0)}]}])};
                                        _ ->
                                            case lists:keyfind(PLev,
                                                               1,
                                                               PrivilegeRole)
                                                of
                                                {_, PNum} ->
                                                    case lists:keyfind(Id,
                                                                       1,
                                                                       IdL)
                                                        of
                                                        false -> {ok, SI, IdL};
                                                        {Id,
                                                         _OldLimitType,
                                                         N,
                                                         LastTime} ->
                                                            case
                                                                do_check(LimitType,
                                                                         LastTime,
                                                                         N,
                                                                         Lr +
                                                                             PNum,
                                                                         Num)
                                                                of
                                                                {false,
                                                                 Reason} ->
                                                                    {false,
                                                                     Reason};
                                                                true ->
                                                                    {ok,
                                                                     SI,
                                                                     IdL}
                                                            end
                                                    end;
                                                _ ->
                                                    case lists:keyfind(Id,
                                                                       1,
                                                                       IdL)
                                                        of
                                                        false -> {ok, SI, IdL};
                                                        {Id,
                                                         _OldLimitType,
                                                         N,
                                                         LastTime} ->
                                                            case
                                                                do_check(LimitType,
                                                                         LastTime,
                                                                         N,
                                                                         Lr,
                                                                         Num)
                                                                of
                                                                {false,
                                                                 Reason} ->
                                                                    {false,
                                                                     Reason};
                                                                true ->
                                                                    {ok,
                                                                     SI,
                                                                     IdL}
                                                            end
                                                    end
                                            end
                                    end;
                                _ ->
                                    Val = case lists:member(BaseId,
                                                            [22586,
                                                             22690,
                                                             22691])
                                              of
                                              true ->
                                                  privilege:get_val(Role, 114);
                                              _ when BaseId == 22578 ->
                                                  privilege:get_val(Role, 115);
                                              _ -> Num
                                          end,
                                    case Val of
                                        0 ->
                                            {false,
                                             lang:get("该商品属于特权商品，购买特权礼包后才有资格购买该道具")};
                                        NVal when is_integer(NVal) ->
                                            case lists:keyfind(Id, 1, IdL) of
                                                false -> {ok, SI, IdL};
                                                {Id,
                                                 _OldLimitType,
                                                 N,
                                                 LastTime} ->
                                                    case do_check(LimitType,
                                                                  LastTime,
                                                                  N,
                                                                  NVal,
                                                                  Num)
                                                        of
                                                        {false, Reason} ->
                                                            {false, Reason};
                                                        true -> {ok, SI, IdL}
                                                    end
                                            end;
                                        {false, Reason} -> {false, Reason}
                                    end
                            end;
                        {false, Reason} -> {false, Reason}
                    end;
                _ -> {false, lang:get("商城系统未启动")}
            end
    end.

check_rencounter(#shop_item{rencounter_lev = 0},
                 _Role) ->
    true;
check_rencounter(#shop_item{rencounter_lev =
                                RencounterLev},
                 Role) ->
    Tlev = rencounter_role:get_rencounter_ranklev(Role),
    case Tlev >= RencounterLev of
        true -> true;
        _ ->
            Title = util:flist(lang:get("~w阶"), [RencounterLev]),
            {false,
             notice:format(lang:get("英雄擂台段位需达到~ts才可以购买"),
                           [{string_2, 1, Title}])}
    end.

do_check(day, LastTime, Num, LimitRole, BuyNum) ->
    NewNum = case LastTime >= date:unixtime(zero) of
                 true -> Num;
                 false -> 0
             end,
    case BuyNum + NewNum > LimitRole of
        true -> {false, lang:get("购买数量超出上限, 无法购买")};
        false -> true
    end;
do_check(week, LastTime, Num, LimitRole, BuyNum) ->
    NewNum = case date:is_same_week(LastTime,
                                    date:unixtime())
                 of
                 true -> Num;
                 false -> 0
             end,
    case BuyNum + NewNum > LimitRole of
        true -> {false, lang:get("购买数量超出上限, 无法购买")};
        false -> true
    end;
do_check(forever, _LastTime, Num, LimitRole, BuyNum) ->
    NewNum = Num,
    case BuyNum + NewNum > LimitRole of
        true -> {false, lang:get("购买数量超出上限, 无法购买")};
        false -> true
    end;
do_check(_, _, _, _, _) -> {false, lang:get("未知限购类型")}.

recalc_buy(IdL) -> recalc_buy(IdL, []).

recalc_buy([], IdL) -> IdL;
recalc_buy([{Id, day, Num, LastTime} | T], IdL) ->
    case LastTime >= date:unixtime(zero) of
        true -> recalc_buy(T, [{Id, day, Num, LastTime} | IdL]);
        false -> recalc_buy(T, IdL)
    end;
recalc_buy([{Id, week, Num, LastTime} | T], IdL) ->
    case date:is_same_week(LastTime, date:unixtime()) of
        true ->
            recalc_buy(T, [{Id, week, Num, LastTime} | IdL]);
        false -> recalc_buy(T, IdL)
    end;
recalc_buy([{Id, forever, Num, LastTime} | T], IdL) ->
    recalc_buy(T, [{Id, forever, Num, LastTime} | IdL]).

update_ets(_EtsInfo, _, #shop_item{limit_type = normal},
           _BuyNum) ->
    ok;
update_ets(_EtsInfo, _, #shop_item{limit_role = -1},
           _BuyNum) ->
    ok;
update_ets(EtsInfo, Role = #role{id = RoleId},
           #shop_item{id = Id, num = Num, limit_type = LimitType},
           BuyNum) ->
    NewEtsInfo = case lists:keyfind(Id, 1, EtsInfo) of
                     false ->
                         [{Id, LimitType, BuyNum * Num, date:unixtime()}
                          | EtsInfo];
                     {Id, _, N, _} ->
                         lists:keyreplace(Id,
                                          1,
                                          EtsInfo,
                                          {Id,
                                           LimitType,
                                           BuyNum * Num + N,
                                           date:unixtime()})
                 end,
    ets:insert(ets_shop_role, {RoleId, NewEtsInfo}),
    dets:insert(dets_shop_role, {RoleId, NewEtsInfo}),
    PackInfo = [{PackId, PackNum}
                || {PackId, _, PackNum, _} <- NewEtsInfo],
    role:link_send(Role, 11302, {PackInfo}),
    ok.

delete_flag(#shop_item{tab2 = 9}, _Role) -> false;
delete_flag(#shop_item{tab2 = 26}, _Role) -> false;
delete_flag(#shop_item{tab2 = 31}, _Role) -> false;
delete_flag(#shop_item{id = Id, limit_type = forever,
                       limit_role = LimitRole, privilege_role = PrivilegeRole},
            Role = #role{id = RoleId}) ->
    PLev = privilege:get_privilege(Role),
    PLimit = case lists:keyfind(PLev, 1, PrivilegeRole) of
                 {_, TPLimit} -> TPLimit;
                 _ -> 0
             end,
    case get_buy_info(RoleId) of
        false -> false;
        IdL ->
            case lists:keyfind(Id, 1, IdL) of
                false -> false;
                {_, _, N, _} when N >= LimitRole + PLimit -> true;
                _ -> false
            end
    end;
delete_flag(_, _RoleId) -> false.

calc_campaign_discount_price(GoldList) ->
    calc_campaign_discount_price(GoldList, []).

calc_campaign_discount_price([], DiscountGoldList) ->
    DiscountGoldList;
calc_campaign_discount_price([ShopItem = #shop_item{id =
                                                        GoodsId}
                              | Rest],
                             DiscountGoldList) ->
    case shop_data:get_discount_price(GoodsId) of
        ListDiscountPrice = [_ | _] ->
            Now = date:unixtime(),
            DiscountData = [{Label, Price}
                            || #{start_time := ST, end_time := ET,
                                 label := Label, discount_price := Price}
                                   <- ListDiscountPrice,
                               Now >= ST, Now =< ET],
            case DiscountData of
                [{AssetsType, DiscountPrice}] ->
                    NewShopItem = ShopItem#shop_item{price = DiscountPrice,
                                                     assets_type = AssetsType},
                    calc_campaign_discount_price(Rest,
                                                 [NewShopItem
                                                  | DiscountGoldList]);
                _ ->
                    calc_campaign_discount_price(Rest,
                                                 [ShopItem | DiscountGoldList])
            end;
        false ->
            calc_campaign_discount_price(Rest,
                                         [ShopItem | DiscountGoldList])
    end.

check_achievement([], _) -> true;
check_achievement(AL = [{Min, _Max, _Discount} | _T],
                  Achievement) ->
    logger:debug("AL:  ~w  ~w",
                 [Min, Achievement],
                 shop_mgr,
                 764),
    case Achievement < Min of
        true ->
            {false,
             notice:format(lang:get("成就达到~ts点以上专属时装，还差~ts点可以购买{face_1,56}"),
                           [{string_2, 5, Min},
                            {string_2, 5, Min - Achievement}])};
        false -> check_achievement2(AL, Achievement)
    end.

check_achievement2([], _) ->
    {false,
     notice:format(lang:get("成就超过最大限制，不能购买{face_1,56}"),
                   [])};
check_achievement2([{Min, Max, Discount} | T],
                   Achievement) ->
    case Achievement > Min andalso Achievement < Max of
        true -> {true, Discount};
        false -> check_achievement2(T, Achievement)
    end.

market_change_price(Role, List) ->
    market_change_price(Role, List, []).

market_change_price(_Role, [], List) -> List;
market_change_price(Role,
                    [ShopItem = #shop_item{market_change = MarketChange}
                     | Rest],
                    GoldList) ->
    case MarketChange of
        1 ->
            case get_market_change_price(Role, ShopItem) of
                {ok, NewPrice} ->
                    market_change_price(Role,
                                        Rest,
                                        [ShopItem#shop_item{price = NewPrice}
                                         | GoldList]);
                _ ->
                    market_change_price(Role, Rest, [ShopItem | GoldList])
            end;
        _ ->
            market_change_price(Role, Rest, [ShopItem | GoldList])
    end.

get_market_change_price(Role,
                        #shop_item{base_id = BaseId,
                                   assets_type = AssetsType}) ->
    case item_gift_data:get(BaseId) of
        {{1, _Num}, ShopList} ->
            GetList = check_role_cond(Role, ShopList),
            case get_all_gold_num(GetList) of
                GoldNum when is_integer(GoldNum) ->
                    case AssetsType of
                        star_gold -> {ok, util:ceil(GoldNum / 50)};
                        star_gold_or_gold -> {ok, util:ceil(GoldNum / 50)};
                        gold -> {ok, util:ceil(GoldNum / 50)};
                        gold_bind -> {ok, GoldNum};
                        _ -> false
                    end;
                _ -> false
            end;
        _ -> false
    end.

check_role_cond(#role{sex = Sex, lev = Lev,
                      classes = Classes},
                List) ->
    check_role_cond(Sex, Lev, Classes, List, []).

check_role_cond(_Sex, _Lev, _Classes, [], List) -> List;
check_role_cond(Sex, Lev, Classes,
                [H = #{sex := Sex1, lev_low := LevLow,
                       lev_high := LevHigh, classes := Classes1}
                 | T],
                List)
    when (Sex1 =:= Sex orelse Sex1 =:= 2) andalso
             (Classes1 =:= Classes orelse Classes1 =:= 0) andalso
                 (LevLow =:= 0 andalso LevHigh =:= 0 orelse
                      LevLow =:= 0 andalso Lev =< LevHigh orelse
                          Lev >= LevLow andalso LevHigh =:= 0 orelse
                              Lev >= LevLow andalso Lev =< LevHigh) ->
    check_role_cond(Sex, Lev, Classes, T, [H | List]);
check_role_cond(Sex, Lev, Classes, [_ | T], List) ->
    check_role_cond(Sex, Lev, Classes, T, List).

get_all_gold_num(GetList) ->
    get_all_gold_num(GetList, 0).

get_all_gold_num([], GoldNum) -> GoldNum;
get_all_gold_num([#{item_id := ItemId, num := Num}
                  | Rest],
                 GoldNum) ->
    case market_gold:get_item_init_price(ItemId) of
        InitPrice when is_integer(InitPrice) ->
            get_all_gold_num(Rest, GoldNum + InitPrice * Num);
        _ -> false
    end;
get_all_gold_num([_ | _Rest], _GoldNum) -> false.

shop_tab_name(Tab1, Tab2) ->
    case Tab1 of
        1 ->
            case Tab2 of
                1 -> lang:get("钻石商城");
                2 -> lang:get("每周限购");
                3 -> lang:get("恩爱兑换");
                4 -> lang:get("师道值兑换");
                5 -> lang:get("红钻商城");
                6 -> lang:get("幸运兑换");
                7 -> lang:get("中秋兑换");
                8 -> lang:get("推广兑换");
                9 -> lang:get("万圣节兑换");
                10 -> lang:get("感恩兑换");
                11 -> lang:get("元旦兑换");
                12 -> lang:get("子女商店");
                13 -> lang:get("新春兑换");
                14 -> lang:get("元宵兑换");
                15 -> lang:get("游乐卷兑换");
                16 -> lang:get("兄弟币兑换");
                17 -> lang:get("烟花兑换");
                18 -> lang:get("快捷商店");
                19 -> lang:get("暖心兑换");
                20 -> lang:get("幸运宝券兑换");
                21 -> lang:get("同心值");
                22 -> lang:get("七夕积分");
                _ -> lang:get("钻石商城")
            end;
        2 ->
            case Tab2 of
                1 -> lang:get("星辰积分");
                2 -> lang:get("爱心兑换");
                3 -> lang:get("恩爱兑换");
                4 -> lang:get("师道值兑换");
                5 -> lang:get("武道兑换");
                6 -> lang:get("幸运兑换");
                7 -> lang:get("中秋兑换");
                8 -> lang:get("推广兑换");
                9 -> lang:get("万圣节兑换");
                10 -> lang:get("感恩兑换");
                11 -> lang:get("元旦兑换");
                12 -> lang:get("子女商店");
                13 -> lang:get("新春兑换");
                14 -> lang:get("元宵兑换");
                15 -> lang:get("游乐卷兑换");
                16 -> lang:get("兄弟币兑换");
                17 -> lang:get("烟花兑换");
                18 -> lang:get("快捷商店");
                19 -> lang:get("暖心兑换");
                20 -> lang:get("幸运宝券兑换");
                21 -> lang:get("同心值");
                22 -> lang:get("七夕积分");
                26 -> lang:get("圣诞积分");
                27 -> lang:get("元旦积分");
                29 -> lang:get("诸神商店");
                30 -> lang:get("喜庆积分");
                32 -> lang:get("摇摇乐");
                33 -> lang:get("大富翁");
                34 -> lang:get("开服转盘");
                _ -> lang:get("看不到的商店")
            end
    end.

