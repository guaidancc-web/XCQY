-file("src/t.erl", 1).

-module(t).

-compile(export_all).

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

-file("src/t.erl", 9).

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

-file("src/t.erl", 10).

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

-file("src/t.erl", 11).

-file("inc/node.hrl", 1).

-record(node,
        {id = {<<>>, 0} :: {bitstring(), non_neg_integer()},
         disabled = 0 :: atom(),
         auto_connect = 0 :: 0 | 1,
         nodename :: undefined | atom(),
         machine = 0 :: non_neg_integer(),
         root = "" :: string(),
         type = zone :: center | zone | oms,
         ext :: undefined | tuple(),
         cookie = "m8B2E89I@O1n3z1" :: string(),
         db_host = "" :: string(),
         db_port = 3306 :: string(),
         db_name = "" :: string(),
         db_user = "root" :: string(),
         db_pass = "" :: string(),
         db_conn_min = 30 :: pos_integer(),
         db_conn_max = 100 :: pos_integer()}).

-file("src/t.erl", 12).

-file("inc/machine.hrl", 1).

-record(machine,
        {id = 1 :: pos_integer(),
         owner = <<>> :: bitstring(),
         disabled = false :: boolean(),
         location = "" :: list(),
         code_path = "" :: string(),
         ip = "" :: string(),
         ip1 = "" :: string(),
         ip2 = "" :: string(),
         ip_internal = "" :: string(),
         ssh_user = "root" :: string(),
         ssh_port = 22 :: string(),
         cores = 1 :: pos_integer(),
         bandwidth = 1 :: pos_integer(),
         disk = 1 :: pos_integer(),
         disk_timing = 1 :: pos_integer(),
         note = "" :: string()}).

-file("src/t.erl", 13).

-file("inc/protocol.hrl", 1).

-record(module,
        {code :: undefined | pos_integer(),
         type :: undefined | game_server | monitor | tester,
         need_auth = true :: boolean(),
         caller = connector :: connector | object,
         module :: undefined | atom(),
         desc = "" :: string()}).

-record(rpc,
        {code = 0 :: non_neg_integer(),
         disable = false :: boolean(),
         autolog = false :: boolean(),
         autozip = false :: boolean(),
         condition = [] :: [tuple()],
         log_title :: undefined | string(),
         req_desc ::
             undefined |
             string() |
             {string(), [atom()]} |
             {atom(), atom(), tuple()},
         req = [] :: {atom(), [tuple()]} | [tuple()],
         reply_desc ::
             undefined |
             string() |
             {string(), [atom()]} |
             {atom(), atom(), tuple()},
         reply = [] :: {atom(), [tuple()]} | [tuple()],
         parser :: undefined | atom(),
         mod :: undefined | atom(),
         can_cache = true :: boolean()}).

-file("src/t.erl", 14).

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

-file("src/t.erl", 15).

-file("inc/robot.hrl", 1).

-record(robot_role,
        {ver = 4,
         id = {0, "", 0} :: tuple(),
         name = "" :: list(),
         sex = 0 :: 0..1,
         classes = 0 :: 0..4,
         lev = 0 :: non_neg_integer(),
         fc = 0,
         face = 0,
         ai_id = 0,
         skills = [],
         talents = [],
         pet,
         backup_pets = [],
         guard,
         slave = [],
         attr :: undefined | tuple(),
         looks = [],
         time = 0,
         m_formation,
         pet_fc = 0,
         all_fc = 0,
         cup = 1000,
         m_lev_break}).

-record(robot_role_index,
        {id = {0, "", 0} :: tuple(),
         sex = 0 :: 0..1,
         classes = 0 :: 0..4,
         lev = 0 :: non_neg_integer(),
         fc = 0,
         pet_fc = 0,
         cup = 1000,
         all_fc = 0,
         time = 0}).

-file("src/t.erl", 16).

-file("inc/group.hrl", 1).

-record(member,
        {pid :: undefined | pid(),
         conn_pid :: undefined | pid()}).

-file("src/t.erl", 17).

-file("inc/package.hrl", 1).

-record(package,
        {type = 1 :: integer(),
         next_id = 1 :: pos_integer(),
         volume = 0 :: non_neg_integer(),
         free_cell = [] :: list(),
         items = [] :: [tuple()]}).

-file("src/t.erl", 18).

url() -> encode_uri_rfc3986:encode(<<"百度baidu1">>).

url1() -> http_uri:encode("百度baidu").

url2() ->
    edoc_lib:escape_uri(unicode:characters_to_list(<<"百度baidu">>)).

data() -> "hello 中国 ren".

data1() -> <<"hello 中国 ren">>.

sqlite(N) ->
    case dets:info(test, size) of
        undefined ->
            dets:open_file(test, [{file, "./var/test.dets"}]);
        _ -> ignore
    end,
    {ok, Db} = esqlite3:open("./var/test.sdb"),
    esqlite3:exec("create table test(id integer primary "
                  "key, content text)",
                  Db),
    F1 = fun (I) -> dets:insert(test, {I, I}) end,
    F2 = fun (I) -> dets:lookup(test, I) end,
    F3 = fun (I) -> dets:delete(test, I) end,
    F11 = fun (I) ->
                  esqlite3:exec("insert into test values(" ++
                                    integer_to_list(I) ++
                                        ", " ++ integer_to_list(I) ++ ")",
                                Db)
          end,
    F12 = fun (I) ->
                  esqlite3:q("select * from test where id = ?", [I], Db)
          end,
    F13 = fun (I) ->
                  esqlite3:exec("delete from test where id =" ++
                                    integer_to_list(I),
                                Db)
          end,
    ptester:run(N,
                [{"dets insert", F1},
                 {"dets select", F2},
                 {"dets delete", F3},
                 {"sqlite insert", F11},
                 {"sqlite select", F12},
                 {"sqlite delete", F13}]).

role_info(N) ->
    [spawn(fun () ->
                   do_role_info(I, N, env:get(platform), env:get(zone_id))
           end)
     || I <- lists:seq(1, N)].

do_role_info(Rid, N, P, Z) ->
    case role_data:local_fetch(by_id, Rid, P, Z) of
        {ok, Role = #role{}} ->
            role_data:save_info(Role),
            do_role_info(Rid + N, N, P, Z);
        {error, role_data_not_found} ->
            case os:type() of
                {win32, _} ->
                    io:format("~ts",
                              [io_lib:format("finish->last_role_id: ~w~n",
                                             [Rid])]);
                _ ->
                    io:format("~ts",
                              [io_lib:format("finish->last_role_id: ~w~n",
                                             [Rid])])
            end;
        _Err ->
            case os:type() of
                {win32, _} ->
                    io:format("~ts", [io_lib:format("error:~w~n", [_Err])]);
                _ ->
                    io:format("~ts", [io_lib:format("error:~w~n", [_Err])])
            end,
            do_role_info(Rid + N, N, P, Z)
    end.

check_role(Num, MaxNum) ->
    P = env:get(platform),
    Z = env:get(zone_id),
    do_check_role(Num, MaxNum, P, Z, {0, {0, "beta", 8}}).

do_check_role(Num, MaxNum, _, _, Max)
    when Num > MaxNum ->
    logger:info("最大角色数据:~w", [Max], t, 106),
    ok;
do_check_role(Num, MaxNum, P, Z, {Size, Id}) ->
    case role_data:local_fetch(by_id, Num, P, Z) of
        {ok, Role = #role{}} ->
            case role_login:do(Role) of
                {error, _Msg} ->
                    logger:error("无法加载角色登陆:~w", [_Msg], t, 113);
                {ok, NewRole} ->
                    NowSize = erlang:external_size(NewRole),
                    logger:info("角色:~w,大小:~w",
                                [{Num, P, Z}, NowSize],
                                t,
                                116),
                    NewMax = case NowSize > Size of
                                 true -> {NowSize, {Num, P, Z}};
                                 false -> {Size, Id}
                             end,
                    do_check_role(Num + 1, MaxNum, P, Z, NewMax)
            end;
        {error, role_data_not_found} ->
            logger:info("finish->last_role_id: ~w~n",
                        [Num],
                        t,
                        124),
            logger:info("最大角色数据:~w", [{Size, Id}], t, 125),
            do_check_role(Num + 1, MaxNum, P, Z, {Size, Id});
        _Err ->
            logger:info("error:~w", [_Err], t, 128),
            do_check_role(Num + 1, MaxNum, P, Z, {Size, Id})
    end.

eprof_all(TimeoutSec) ->
    eprof(processes() -- [whereis(eprof)], TimeoutSec).

eprof(Pids, TimeoutSec) ->
    eprof:start(),
    eprof:start_profiling(Pids),
    timer:sleep(TimeoutSec),
    eprof:stop_profiling(),
    eprof:analyze(total),
    eprof:stop().

z(N) ->
    L = lists:seq(1, 10000),
    D = {L, "abc"},
    F1 = fun (_I) -> term_to_binary(D) end,
    F2 = fun (_I) -> term_to_binary(D, [compressed]) end,
    F3 = fun (_I) -> term_to_binary(D, [{compressed, 1}])
         end,
    F4 = fun (_I) -> term_to_binary(D, [{compressed, 9}])
         end,
    case os:type() of
        {win32, _} ->
            io:format("~ts",
                      [io_lib:format("size: ~w : ~w : ~w : ~w~n",
                                     [byte_size(term_to_binary(D)),
                                      byte_size(term_to_binary(D,
                                                               [compressed])),
                                      byte_size(term_to_binary(D,
                                                               [{compressed,
                                                                 1}])),
                                      byte_size(term_to_binary(D,
                                                               [{compressed,
                                                                 9}]))])]);
        _ ->
            io:format("~ts",
                      [io_lib:format("size: ~w : ~w : ~w : ~w~n",
                                     [byte_size(term_to_binary(D)),
                                      byte_size(term_to_binary(D,
                                                               [compressed])),
                                      byte_size(term_to_binary(D,
                                                               [{compressed,
                                                                 1}])),
                                      byte_size(term_to_binary(D,
                                                               [{compressed,
                                                                 9}]))])])
    end,
    ptester:run(N,
                [{"normal", F1},
                 {"compressed", F2},
                 {"compressed1", F3},
                 {"compressed9", F4}]).

conn_pid(Pid) when is_list(Pid) ->
    conn_pid(list_to_pid(Pid));
conn_pid(Pid) ->
    {ok, L} = role_group:members(world),
    lists:keyfind(Pid, #member.conn_pid, L).

phash(N) ->
    L = [a, b, c, d, e, f, g, h, i, j, k, l],
    F1 = fun (I) -> erlang:phash(I, 10) end,
    F2 = fun (I) -> erlang:phash2({abc, I}, 10) end,
    F3 = fun (I) ->
                 list_to_atom("role_data_" ++ integer_to_list(I rem 10))
         end,
    F4 = fun (I) -> lists:nth(I rem 10 + 1, L) end,
    ptester:run(N,
                [{"phash", F1},
                 {"phash2", F2},
                 {"rem", F3},
                 {"hash", F4}]).

order(Times) ->
    case ets:info(matching, size) of
        undefined ->
            ets:new(matching,
                    [ordered_set, named_table, public, {keypos, 1}]);
        _ -> ignore
    end,
    Type = [xiandao, normal, pvp, pve],
    F1 = fun (I) ->
                 T = util:rand_list(Type),
                 N = util:rand(1, 5),
                 K = {T, N, I, I},
                 ets:insert(matching, {K, I})
         end,
    F2 = fun (I) ->
                 T = util:rand_list(Type),
                 N = util:rand(1, 5),
                 K = {T, N, I, I},
                 ets:lookup(matching, K)
         end,
    F3 = fun (I) ->
                 T = util:rand_list(Type),
                 N = util:rand(1, 5),
                 K = {T, N, I, I},
                 ets:insert(matching, {K, K})
         end,
    F4 = fun (I) ->
                 T = util:rand_list(Type),
                 N = util:rand(1, 5),
                 K = {T, N, I, I},
                 ets:lookup(matching, K)
         end,
    F5 = fun (I) ->
                 T = util:rand_list(Type),
                 N = util:rand(1, 5),
                 K = {T, N, I, I},
                 ets:prev(matching, K),
                 ets:next(matching, K)
         end,
    ptester:run(Times,
                [{"insert", F1},
                 {"lookup", F2},
                 {"rand insert", F3},
                 {"rand lookup", F4},
                 {"rand multi", F5}]).

-spec next(Num, T, N, P, Id, D) -> {Flag,
                                    Pos,
                                    Dir,
                                    Match} when Num :: pos_integer(),
                                                T :: atom(), N :: pos_integer(),
                                                P :: pos_integer(),
                                                Id :: pos_integer(),
                                                D :: pos_integer(),
                                                Flag :: true | false,
                                                Pos :: tuple(),
                                                Dir :: prev | next,
                                                Match :: [tuple()].

next(Num, T, N, P, Id, D) ->
    case next(Num, T, N, P, Id, D, []) of
        {0, Pos, Dir, L} -> {true, Pos, Dir, L};
        {Left, _, _, L} ->
            case prev(Left, T, N, P, Id, D, L) of
                {0, Pos, Dir, L1} -> {true, Pos, Dir, L1};
                {_, Pos, Dir, L1} -> {false, Pos, Dir, L1}
            end
    end.

next(0, T, N, P, Id, _D, L) ->
    {0, {T, N, P, Id}, next, L};
next(Num, T, N, P, Id, D, L) ->
    case ets:next(matching, {T, N, P, Id}) of
        K = {T, N, P1, Id1}
            when N =< Num andalso abs(P - P1) < D ->
            next(Num - N, T, N, P1, Id1, D, [K | L]);
        _ when N > 1 -> next(Num, T, N - 1, P, Id, D, L);
        _ -> {Num, {T, N, P, Id}, next, L}
    end.

prev(Num, T, N, P, Id, D) ->
    case prev(Num, T, N, P, Id, D, []) of
        {0, Pos, Dir, L} -> {true, Pos, Dir, L};
        {_, Pos, Dir, L} -> {false, Pos, Dir, L}
    end.

prev(0, T, N, P, Id, _D, L) ->
    {0, {T, N, P, Id}, prev, L};
prev(Num, T, N, P, Id, D, L) ->
    case ets:prev(matching, {T, N, P, Id}) of
        K = {T, N, P1, Id1}
            when N =< Num andalso abs(P - P1) < D ->
            prev(Num - N, T, N, P1, Id1, D, [K | L]);
        _ when N > 1 -> prev(Num, T, N - 1, P, Id, D, L);
        _ -> {Num, {T, N, P, Id}, prev, L}
    end.

t(N) ->
    R = #role{name = <<"yeahoo">>,
              id = [a, b, "abcd", self()]},
    F1 = fun (_I) ->
                 case os:type() of
                     {win32, _} ->
                         io:format("~ts", [io_lib:format("::: ~p~n", [s(R)])]);
                     _ ->
                         io:format("~ts", [io_lib:format("::: ~p~n", [s(R)])])
                 end
         end,
    F2 = fun (_I) ->
                 case os:type() of
                     {win32, _} ->
                         io:format("~ts", [io_lib:format("::: ~w~n", [R])]);
                     _ -> io:format("~ts", [io_lib:format("::: ~w~n", [R])])
                 end
         end,
    ptester:run(N, [{"to_string", F1}, {"io_lib", F2}]).

s(L) ->
    lists:concat([binary_to_list(X)
                  || X <- lists:flatten(term_to_string(L))]).

term_to_string(X) when is_integer(X) ->
    list_to_binary(integer_to_list(X));
term_to_string(X) when is_float(X) ->
    list_to_binary(float_to_list(X));
term_to_string(X) when is_atom(X) ->
    list_to_binary(atom_to_list(X));
term_to_string(X) when is_pid(X) ->
    [<<"\"">>, list_to_binary(pid_to_list(X)), <<"\"">>];
term_to_string(X) when is_function(X) ->
    list_to_binary(erlang:fun_to_list(X));
term_to_string(X) when is_port(X) ->
    list_to_binary(erlang:port_to_list(X));
term_to_string(X) when is_binary(X) ->
    [<<"<<\"">>, X, <<"\">>">>];
term_to_string(X) when is_tuple(X) -> do_tuple(X);
term_to_string(X) when is_list(X) ->
    [<<"[">> | do_list(X) ++ [<<"]">>]].

do_list([]) -> [];
do_list([H]) -> [term_to_string(H)];
do_list(L) ->
    [H | T] = lists:reverse(L),
    [[term_to_string(X), <<",">>] || X <- lists:reverse(T)]
        ++ [term_to_string(H)].

do_tuple(X) ->
    L = tuple_size(X),
    do_tuple(L - 1,
             X,
             [term_to_string(element(L, X)), <<"}">>]).

do_tuple(0, _X, R) -> [<<"{">>] ++ R;
do_tuple(N, X, R) ->
    S = [term_to_string(element(N, X)), <<",">>],
    do_tuple(N - 1, X, [S | R]).

rec(N) ->
    L = lists:seq(1, 10000),
    Rbig = #role{id = 0, name = L, sex = L, classes = L},
    Rtiny = #role{id = 0},
    F1 = fun (_I) -> rec_loop(N, Rtiny) end,
    F2 = fun (_I) -> rec_loop(N, Rbig) end,
    ptester:run(1, [{"tiny", F1}, {"big", F2}]).

rec_loop(0, R) -> R;
rec_loop(N, R = #role{id = Id}) ->
    rec_loop(N - 1, R#role{id = Id + 1}).

list(N) ->
    Ids = lists:seq(1, 300),
    Ids1 = lists:seq(1, 300),
    [put({role, X}, #role{id = X})
     || X <- lists:seq(1, 300)],
    L = [#role{id = X} || X <- lists:seq(1, 300)],
    put(ids, Ids),
    put(l, L),
    F1 = fun (_I) ->
                 K = util:rand(1, 300),
                 lists:keyfind(K, #role.id, get(l))
         end,
    F2 = fun (_I) ->
                 K = util:rand(1, 300),
                 lists:member(K, get(ids)),
                 get({role, K})
         end,
    F3 = fun (_I) ->
                 K = util:rand(1, 300),
                 case lists:keyfind(K, #role.id, get(l)) of
                     false -> ignore;
                     R -> put({role, K}, R#role{id = K})
                 end
         end,
    F4 = fun (_I) ->
                 K = util:rand(1, 300),
                 case lists:member(K, get(ids)) of
                     false -> ignore;
                     true ->
                         R = get({role, K}),
                         put({role, K}, R#role{id = K})
                 end
         end,
    F5 = fun (_I) -> [get({role, X}) || X <- Ids1] end,
    F6 = fun (_I) -> get(l) end,
    F7 = fun (_I) ->
                 K = util:rand(1, 300),
                 lists:keyreplace(K, #role.id, get(l), #role{id = K})
         end,
    ptester:run(N,
                [{"old", F1},
                 {"now", F2},
                 {"lists:keyfind", F3},
                 {"lists:member", F4},
                 {"get", F5},
                 {"get1", F6},
                 {"lists:keyreplace", F7}]).

ch(N) ->
    F = fun (X) -> X end,
    Fe = fun (X) -> X / 0 end,
    F1 = fun (I) -> case F(I) of _ -> ok end end,
    F2 = fun (I) -> case catch F(I) of _ -> ok end end,
    F3 = fun (I) -> case catch Fe(I) of _ -> ok end end,
    ptester:run(N,
                [{"normal", F1}, {"catch", F2}, {"catch error", F3}]),
    ok.

fold(N) ->
    ets:new(ets_list,
            [set, named_table, public, {keypos, 1}]),
    L = [{X, X} || X <- lists:seq(1, 3000)],
    [ets:insert(ets_list, {X, L}) || X <- lists:seq(1, 10)],
    ets:new(ets_fold,
            [set, named_table, public, {keypos, 1}]),
    [ets:insert(ets_fold, {X, X})
     || X <- lists:seq(1, 3000)],
    F = fun ({X, _}, Acc) -> Acc + X end,
    F1 = fun (_I) ->
                 lists:foldl(F, 0, ets:tab2list(ets_fold))
         end,
    F2 = fun (_I) -> ets:foldl(F, 0, ets_fold) end,
    F3 = fun (_I) ->
                 [F(X, 0) || X <- ets:tab2list(ets_fold)]
         end,
    F4 = fun (_I) -> l(ets:tab2list(ets_fold), F) end,
    F5 = fun (_I) ->
                 LL = ets:lookup(ets_list, 1),
                 l(LL, F)
         end,
    ptester:run(N,
                [{"ets:tab2list", F1},
                 {"ets:foldl", F2},
                 {"list", F3},
                 {"fun", F4},
                 {"fun2", F5}]),
    ok.

l([], _F) -> ok;
l([H | T], F) ->
    F(H, 0),
    l(T, F).

apply(N) ->
    F = fun (X) -> X * X end,
    F1 = fun (I) -> F(I) end,
    F2 = fun (I) -> apply(F, [I]) end,
    F3 = fun (I) -> f(I) end,
    ptester:run(N, [{"F", F1}, {"F apply", F2}, {"f", F3}]),
    ok.

f(X) -> X * X.

record(N) ->
    Name = #role{assets = #assets{}},
    Bag = #role{name = Name},
    R = #role{id = 1, name = Name, p_bag = Bag},
    F1 = fun (I) ->
                 R1 = #role{id = I, name = I},
                 R =:= R1
         end,
    F2 = fun (I) ->
                 R1 = #role{id = I, name = I},
                 check(R, R1)
         end,
    F3 = fun (I) ->
                 R1 = #role{id = I, name = I},
                 check1(R, R1)
         end,
    F4 = fun (I) ->
                 R1 = #role{id = I, name = I},
                 check(R, R1),
                 check1(R, R1)
         end,
    ptester:run(N,
                [{"compare", F1},
                 {"check", F2},
                 {"check1", F3},
                 {"two check", F4}]).

check(#role{name = Name}, #role{name = NewName})
    when Name =:= NewName ->
    ok;
check(_, _) -> ok.

check1(#role{name = Name}, #role{name = NewName})
    when Name =:= NewName ->
    ok;
check1(_, _) -> ok.

ets(N) ->
    case ets:info(ets_test1, size) of
        undefined ->
            ets:new(ets_test1,
                    [set, named_table, public, {keypos, #role.id}]),
            ets:new(ets_test2,
                    [set,
                     named_table,
                     public,
                     {keypos, #role.id},
                     {write_concurrency, true},
                     {read_concurrency, true}]),
            util:for(1,
                     100,
                     fun (_I) ->
                             util:sleep(util:rand(1, 60)),
                             spawn(fun loop1/0)
                     end),
            util:for(1,
                     100,
                     fun (_I) ->
                             util:sleep(util:rand(1, 60)),
                             spawn(fun loop2/0)
                     end);
        _ -> ignore
    end,
    R = #role{p_bag = lists:seq(10000, 11000)},
    F1 = fun (I) -> ets:insert(ets_test1, R#role{id = I})
         end,
    F2 = fun (I) -> ets:lookup(ets_test1, I) end,
    F3 = fun (I) -> ets:insert(ets_test2, R#role{id = I})
         end,
    F4 = fun (I) -> ets:lookup(ets_test2, I) end,
    ptester:run(N,
                [{"normal write", F1},
                 {"normal read", F2},
                 {"special write", F3},
                 {"special read", F4}]).

loop1() ->
    ets:lookup(ets_test1, util:rand(1, 10000)),
    util:sleep(500),
    loop1().

loop2() ->
    ets:lookup(ets_test2, util:rand(1, 10000)),
    util:sleep(200),
    loop2().

time(N) ->
    F1 = fun (_I) -> date:unixtime() end,
    F2 = fun (_I) -> date:unixtime2() end,
    ptester:run(N,
                [{"erlang:now()", F1}, {"os:timestamp()", F2}]).

ets_size(N) ->
    case ets:info(ets_size_1, size) of
        undefined ->
            logger:debug("===========初始化==================",
                         [],
                         t,
                         677),
            ets:new(ets_size_1,
                    [set, named_table, public, {keypos, #role.id}]),
            ets:new(ets_size_2,
                    [set, named_table, public, {keypos, #robot_role.id}]),
            ets:new(ets_size_3, [set, named_table, public]),
            {ok, [Item]} = item:make(20000, 0, 1),
            Pbag = #package{items = Item},
            R = #role{p_bag = Pbag},
            RR = #robot_role{},
            lists:foreach(fun (I) ->
                                  R1 = R#role{id = I, lev = util:rand(1, 30)},
                                  RR1 = RR#robot_role{id = I,
                                                      lev = util:rand(1, 30)},
                                  RRR1 = {I, util:rand(1, 30), 100},
                                  ets:insert(ets_size_1, R1),
                                  ets:insert(ets_size_2, RR1),
                                  ets:insert(ets_size_3, RRR1)
                          end,
                          lists:seq(1, 50000)),
            ok;
        _ -> ignore
    end,
    F1 = fun (_I) ->
                 Conds = [{'=:=', '$1', 15}],
                 RankMs = [{#role{lev = '$1', _ = '_'}, Conds, ['$_']}],
                 ets:select(ets_size_1, RankMs),
                 ok
         end,
    F2 = fun (_I) ->
                 Conds = [{'=:=', '$1', 15}],
                 RankMs = [{#robot_role{lev = '$1', _ = '_'},
                            Conds,
                            ['$_']}],
                 ets:select(ets_size_2, RankMs),
                 ok
         end,
    F3 = fun (_I) ->
                 Conds = [{'=:=', '$1', 15}],
                 RankMs = [{{'_', '$1', '_'}, Conds, ['$_']}],
                 ets:select(ets_size_3, RankMs),
                 ok
         end,
    ptester:run(N,
                [{"role", F1}, {"robot_role", F2}, {"tuple", F3}]).

file_write(N) ->
    {ok, File1} = file:open("./file1.txt", [write]),
    {ok, File2} = file:open("./file2.txt", [write, raw]),
    {ok, File3} = file:open("./file3.txt",
                            [write, raw, {delayed_write, 16 * 1024, 1}]),
    {ok, File4} = file:open("./file4.txt",
                            [write, raw, {delayed_write, 16 * 1024, 2}]),
    {ok, File5} = file:open("./file5.txt",
                            [write, raw, {delayed_write, 128 * 1024, 128}]),
    L2 = lists:seq(901, 1901),
    Name = #role{assets = #assets{}},
    Bag = #role{name = Name},
    R = #role{id = 1,
              name = #role{assets = #assets{}, p_bag = L2},
              p_bag = Bag},
    Str = io_lib:format("~w~n", [R]),
    F1 = fun (_I) -> file:write(File1, Str) end,
    F2 = fun (_I) -> file:write(File2, Str) end,
    F3 = fun (_I) -> file:write(File3, Str) end,
    F4 = fun (_I) -> file:write(File4, Str) end,
    F5 = fun (_I) -> file:write(File5, Str) end,
    ptester:run(N,
                [{"raw, delayed_write", F3},
                 {"raw, delayed_write1", F3},
                 {"raw, delayed_write2", F4},
                 {"raw, delayed_write3", F5},
                 {"raw", F2},
                 {"normal", F1}]).

db_test(_Pnum, LoopNum) ->
    F1 = fun (I) ->
                 Str = util:fbin(<<"英雄_~w">>, [I]),
                 R = #role{id = {I, <<"local">>, 1}, name = Str,
                           account = Str},
                 save_to_db(R)
         end,
    F2 = fun (I) -> fetch_from_db({I, <<"local">>, 1}) end,
    ptester:run(1 * LoopNum,
                [{"First process write db:", F1}]),
    case os:type() of
        {win32, _} ->
            io:format("~ts", [io_lib:format("~n", [])]);
        _ -> io:format("~ts", [io_lib:format("~n", [])])
    end,
    ptester:run(1 * LoopNum,
                [{"First process select db:", F2}]).

loop_db_test(I, LoopNum) ->
    logger:info("db测试进程[I=~w]开始", [I], t, 811),
    Min = (I - 1) * LoopNum + 1,
    Max = I * LoopNum,
    L = [#role{id = {Rid, <<"local">>, 1},
               name = util:fbin(<<"英雄_~w">>, [Rid]),
               account = util:fbin(<<"英雄_~w">>, [Rid])}
         || Rid <- lists:seq(Min, Max)],
    lists:foreach(fun (Role) -> save_to_db(Role) end, L),
    logger:info("db测试进程[I=~w]完成", [I], t, 818).

save_to_db(R = #role{id = {Rid, P, Z}, ver = Ver,
                     account = Acc, name = Name, sex = Sex,
                     classes = Classes, lev = Lev}) ->
    case db:exec("replace into role_test (id, platform, "
                 "zone_id, account, name, sex, classes, "
                 "lev, ver, data) values (?, ?, ?, ?, "
                 "?, ?, ?, ?, ?, ?)",
                 [Rid,
                  P,
                  Z,
                  Acc,
                  Name,
                  Sex,
                  Classes,
                  Lev,
                  Ver,
                  util:term_to_string(R)])
        of
        ok -> ok;
        {error, Err} ->
            logger:error("[~s]的角色数据存入数据库时发生异常: ~w",
                         [Name, Err],
                         t,
                         824),
            {error, Err}
    end.

fetch_from_db({Rid, Platform, ZoneId}) ->
    case
        db:get_row(<<"select ver, label, lock_status, data "
                     "from role where id = ? and platform "
                     "= ? and zone_id = ?">>,
                   [Rid, Platform, ZoneId])
        of
        {ok, undefined} -> {error, role_data_not_found};
        {ok, [_ | _]} -> ok;
        {error, Err} -> {error, Err}
    end.

s_to_db() ->
    case
        db:exec("insert into realm_info (platform, zone_id, "
                "group_id, name, ctime) values (?, ?, "
                "?, ?, ?)",
                ["4399", 19, 1, "我的测试", 123456789])
        of
        ok -> ok;
        {error, Err} -> {error, Err}
    end.

f_from_db() ->
    case db:get_row("select * from realm_info", []) of
        {ok, undefined} -> {error, role_data_not_found};
        {ok, _R = [_ | _]} -> logger:debug("~w", [_R], t, 844);
        {error, Err} -> {error, Err}
    end.

pmap() ->
    S = self(),
    Ref = erlang:make_ref(),
    Pids = lists:map(fun (I) ->
                             spawn(fun () -> do_f(S, Ref, I) end)
                     end,
                     [1, 2, 3, 4, 5]),
    gather(Pids, Ref, []).

do_f(Parent, Ref, I) ->
    Rand = util:rand(5000, 10000),
    util:sleep(Rand),
    logger:debug("I:~w, Rand:~w", [I, Rand], t, 859),
    Parent ! {self(), Ref, I * I}.

gather([Pid | T], Ref, Data) ->
    receive
        {Pid, Ref, Ret} ->
            logger:debug("收到Ret:~w", [Ret], t, 865),
            gather(T, Ref, [Ret | Data])
    end;
gather([], _, Data) -> Data.

info_test() ->
    Msg = "test info",
    F = "~w test info",
    A = [15],
    Color = "\e[0;34m",
    io:format(lists:concat(["##[DEBUG][~s][~w:~w]",
                            Msg,
                            "~n"]),
              [format_localtime(), t, 886]),
    io:format(lists:concat(["##[DEBUG][~s][~w:~w]",
                            F,
                            "~n"]),
              [format_localtime(), t, 887 | A]),
    io:format(lists:concat([Color,
                            "##[DEBUG][~s][~w:~w]",
                            Msg,
                            "~n",
                            "\e[m"]),
              [format_localtime(), t, 888]),
    io:format(lists:concat([Color,
                            "##[DEBUG][~s][~w:~w]",
                            F,
                            "~n",
                            "\e[m"]),
              [format_localtime(), t, 889 | A]),
    io:format(lists:concat(["\e[0m\e[32m",
                            "##[INFO][~s][~w:~w]",
                            Msg,
                            "~n",
                            "\e[m"]),
              [format_localtime(), t, 890]),
    io:format(lists:concat(["\e[0m\e[32m",
                            "##[INFO][~s][~w:~w]",
                            F,
                            "~n",
                            "\e[m"]),
              [format_localtime(), t, 891 | A]),
    io:format(lists:concat(["\e[1m\e[33m",
                            "##[WARN][~s][~w:~w]",
                            Msg,
                            "~n",
                            "\e[m"]),
              [format_localtime(), t, 892]),
    io:format(lists:concat(["\e[1m\e[33m",
                            "##[WARN][~s][~w:~w]",
                            F,
                            "~n",
                            "\e[m"]),
              [format_localtime(), t, 893 | A]),
    io:format(lists:concat(["\e[1m\e[31m",
                            "##[ERROR][~s][~w:~w]",
                            Msg,
                            "~n",
                            "\e[m"]),
              [format_localtime(), t, 894]),
    io:format(lists:concat(["\e[1m\e[31m",
                            "##[ERROR][~s][~w:~w]",
                            F,
                            "~n",
                            "\e[m"]),
              [format_localtime(), t, 895 | A]).

format_localtime() ->
    {{Y, M, D}, {H, I, S}} = erlang:localtime(),
    lists:concat([Y,
                  "/",
                  M,
                  "/",
                  D,
                  " ",
                  H,
                  ":",
                  I,
                  ":",
                  S]).

login_test(S, E) ->
    L = test_account(),
    login_test(L, S, E, 1).

login_test([], _, _, _) -> ok;
login_test([_ | T], S, E, Flag) when Flag < S ->
    login_test(T, S, E, Flag + 1);
login_test(_, S, E, Flag) when Flag > E ->
    logger:info("账号测试从[~w]到[~w]测试完毕", [S, E], t, 912),
    ok;
login_test([Account | T], S, E, Flag)
    when Flag >= S andalso Flag =< E ->
    logger:info("登陆第[~w]个账号[~ts]", [Flag, Account], t, 916),
    logger:info("============================================="
                "=====",
                [],
                t,
                917),
    logger:info("登陆时系统内存[~w]M",
                [round(erlang:memory(total) / 1024 / 1024)],
                t,
                918),
    tester:start(Flag,
                 robot,
                 Account,
                 "test",
                 1,
                 1,
                 1,
                 "beta",
                 8,
                 "localhost",
                 8008),
    util:sleep(10000),
    tester:info(all, del),
    logger:info("退出后系统内存[~w]M",
                [round(erlang:memory(total) / 1024 / 1024)],
                t,
                922),
    logger:info("============================================="
                "=====",
                [],
                t,
                923),
    logger:info("退出第[~w]个账号[~ts]", [Flag, Account], t, 924),
    login_test(T, S, E, Flag + 1).

test_account() -> [].

