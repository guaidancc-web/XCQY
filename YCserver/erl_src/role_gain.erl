-file("src/mod/role/role_gain.erl", 1).

-module(role_gain).

-export([do/2,
         do/3,
         do_notice/2,
         do_notice/3,
         gl_source/2,
         auto_overlap/2,
         auto_overlap/3,
         auto_overlap/4,
         push_assets/1,
         push_rest/1,
         push_exp/1,
         assets_init/0,
         push_9908/2,
         item_base_id_to_assets/7]).

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

-file("src/mod/role/role_gain.erl", 25).

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

-file("src/mod/role/role_gain.erl", 26).

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

-file("src/mod/role/role_gain.erl", 27).

-file("inc/package.hrl", 1).

-record(package,
        {type = 1 :: integer(),
         next_id = 1 :: pos_integer(),
         volume = 0 :: non_neg_integer(),
         free_cell = [] :: list(),
         items = [] :: [tuple()]}).

-file("src/mod/role/role_gain.erl", 28).

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

-file("src/mod/role/role_gain.erl", 29).

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

-file("src/mod/role/role_gain.erl", 30).

-file("inc/link.hrl", 1).

-record(link,
        {socket :: undefined | port(),
         conn_pid :: undefined | pid(),
         ip = {0, 0, 0, 0} :: {0..255, 0..255, 0..255, 0..255},
         port = 0 :: non_neg_integer(),
         lag = 0 :: non_neg_integer()}).

-file("src/mod/role/role_gain.erl", 31).

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

-file("src/mod/role/role_gain.erl", 32).

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

-file("src/mod/role/role_gain.erl", 33).

-file("inc/market.hrl", 1).

-record(market_price,
        {base_id = 0,
         price = 0,
         assets = 0,
         source = 0,
         val1 = 0,
         val2 = 0,
         val3 = 0,
         val4 = 0}).

-file("src/mod/role/role_gain.erl", 34).

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

-file("src/mod/role/role_gain.erl", 35).

-file("inc/satiety.hrl", 1).

-record(m_satiety,
        {hp_flag = 1 :: 0..1,
         hp = 0 :: non_neg_integer(),
         mp_flag = 1 :: 0..1,
         mp = 0 :: non_neg_integer()}).

-file("src/mod/role/role_gain.erl", 36).

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

-file("src/mod/role/role_gain.erl", 37).

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

-file("src/mod/role/role_gain.erl", 38).

-file("inc/teacher.hrl", 1).

-record(m_teacher,
        {id = {0, "", 0},
         ver = 2,
         name = "",
         status = 0,
         daily = [],
         daily_reward = 0,
         daily_time = 0,
         target = [],
         target_reward = [],
         target_rewarded = [],
         target_over = [],
         evaluation = [],
         study_lev = 0,
         mtime = 0,
         daily_goals = [],
         goals_times = 0}).

-record(teacher,
        {id = {0, "", 0},
         ver = 1,
         name = "",
         sex = 0,
         classes = 0,
         lev = 0,
         guild_id = {0, "", 0},
         guild_name = "",
         msg = "",
         teacher_score = 0,
         teacher_score_offline = 0,
         login_time = 0,
         fc = 0,
         students = []}).

-record(student,
        {id = {0, "", 0},
         ver = 2,
         name = "",
         sex = 0,
         classes = 0,
         lev = 0,
         status = 0,
         in_time = 0,
         out_time = 0,
         login_time = 0,
         guild_id = {0, "", 0},
         guild_name = "",
         daily = [],
         daily_time = 0,
         daily_reward = 0,
         quest_student_reward = 0,
         quest_teacher_reward = 0,
         encourage_time = 0,
         target = [],
         teacher_score = 0,
         fc = 0,
         target_reward = [],
         target_rewarded = []}).

-record(teacher_daily,
        {id = 1 :: pos_integer(),
         finish = 0 :: 0..2,
         progress = [] :: [tuple()]}).

-record(teacher_daily_data,
        {id = 1 :: pos_integer(),
         name = "" :: binary(),
         progress = [] :: [tuple()],
         reward = [],
         exp = 0}).

-record(teacher_target,
        {id = 1 :: pos_integer(),
         finish = 0 :: 0..2,
         progress = [] :: [tuple()]}).

-record(teacher_target_data,
        {id = 1 :: pos_integer(),
         name = "" :: binary(),
         progress = [] :: [tuple()],
         student_reward = [],
         teacher_reward = [],
         student_exp = 0,
         teacher_exp = 0}).

-record(teacher_sign,
        {id = {0, "", 0},
         ver = 1,
         name = "",
         sex = 0,
         classes = 0,
         lev = 0,
         online = 0,
         login_time = 0,
         logout_time = 0,
         online_time = 0,
         is_sign = 0,
         msg = ""}).

-record(teacher_quit_desc_data,
        {min = 0, max = 0, radio = 0, title = "", msg = ""}).

-record(teacher_student_sign_info,
        {id = {0, "", 0},
         name = "",
         sex = 0,
         classes = 0,
         lev = 0,
         msg = ""}).

-file("src/mod/role/role_gain.erl", 39).

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

-file("src/mod/role/role_gain.erl", 40).

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

-file("src/mod/role/role_gain.erl", 41).

-file("inc/mount.hrl", 1).

-record(mount_goal,
        {ver = 1 :: non_neg_integer(),
         finish = [] :: list(),
         doing = [] :: list(),
         day_reward = [] :: list()}).

-record(m_mount,
        {ver = 10 :: pos_integer(),
         mounts = [] :: list(),
         mount_goal = #mount_goal{},
         next_mount_id = 1 :: non_neg_integer(),
         ride_mount = 0,
         appearance_list = [],
         combat_active_times = [],
         dye_list = [],
         dye_diff_list = [],
         pre_mount_status = 0 :: non_neg_integer(),
         evolution_list = [],
         double_ride_role = {1, "", 0} ::
             {pos_integer(), list(), non_neg_integer()},
         is_driver = 0}).

-record(mount,
        {ver = 4 :: pos_integer(),
         index = 0 :: non_neg_integer(),
         mount_base_id = 0 :: non_neg_integer(),
         transformation_id = 0 :: non_neg_integer(),
         lev = 1 :: pos_integer(),
         skill_point = 1 :: pos_integer(),
         fail_times = 0 :: non_neg_integer(),
         upgrade_lev = 0 :: non_neg_integer(),
         live_status = 0,
         skill_list = [],
         fight_times = 0 :: non_neg_integer(),
         spirit = 0 :: non_neg_integer(),
         growth = 1 :: pos_integer(),
         growth_item_num = 0 :: non_neg_integer(),
         speed_lev = 1 :: pos_integer(),
         manger_pets = [],
         tmp_growth = 1 :: pos_integer(),
         tmp_skill_list = [],
         decorate_list = [],
         score = 0,
         expire_time = 0}).

-record(mount_skill,
        {skill_index = 1 :: pos_integer(),
         skill_id = 1 :: non_neg_integer(),
         skill_lev = 0 :: non_neg_integer()}).

-record(mount_decorate,
        {decorate_index = 1 :: pos_integer(),
         decorate_base_id = 0 :: non_neg_integer(),
         is_hide = 0 :: non_neg_integer()}).

-record(mount_dye,
        {trans_id = 0, dye_id = 0, cache_dye_list = []}).

-record(mount_evolution,
        {trans_id = 0, evolution_id = 0}).

-file("src/mod/role/role_gain.erl", 42).

-file("inc/lev_break.hrl", 1).

-record(m_lev_break,
        {ver = 0,
         trial = 0 :: non_neg_integer(),
         done = 0 :: non_neg_integer(),
         times = 0 :: non_neg_integer(),
         attr_point = 0 :: non_neg_integer()}).

-file("src/mod/role/role_gain.erl", 43).

-file("inc/log.hrl", 1).

-file("src/mod/role/role_gain.erl", 44).

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

-file("src/mod/role/role_gain.erl", 45).

-record(role_gain_gl_args,
        {refresh_items = [], push_assets = [], ext_args = []}).

-spec assets_init() -> #assets{}.

assets_init() -> #assets{}.

-spec push_assets(#role{}) -> ok.

push_assets(Role = #role{charge = _Charge,
                         assets = Assets, link = #link{conn_pid = ConnPid}}) ->
    DebtGoldBind = var:get_var(Role, other, 2061, 0),
    DebtGold = var:get_var(Role, other, 2126, 0),
    DebtCoin = var:get_var(Role, other, 2127, 0),
    sys_conn:pack_send(ConnPid,
                       10002,
                       {Assets, DebtCoin, DebtGold, DebtGoldBind}),
    ok.

-spec push_rest(#role{}) -> ok.

push_rest(#role{assets = Assets,
                link = #link{conn_pid = ConnPid}}) ->
    sys_conn:pack_send(ConnPid, 10003, {Assets}),
    ok.

-spec push_exp(#role{}) -> ok.

push_exp(Role = #role{assets =
                          #assets{exp = Exp, reserve_exp = ReserveExp},
                      lev = Lev}) ->
    role:link_send(Role, 10004, {Lev, Exp, ReserveExp}),
    ok.

gl_source(GL, Source) ->
    Fun = fun (G = #gain{}) -> G#gain{source = Source};
              (L = #loss{}) -> L#loss{source = Source}
          end,
    [Fun(G) || G <- GL].

-spec auto_overlap(list(), #role{}) -> {ok,
                                        #role{},
                                        SucL :: list(),
                                        FailL :: list()} |
                                       {false, #loss{} | #gain{}}.

auto_overlap(List, Role) ->
    auto_overlap(List, Role, "").

auto_overlap(List, Role, Title) ->
    auto_overlap(List, Role, Title, false).

auto_overlap(List, Role, Title, CanFail) ->
    role:send_buff_begin(),
    do_auto_overlap(List, Role, Title, CanFail, [], []).

do_auto_overlap([], Role, _Title, _CanFail, SucL,
                FailL) ->
    guild_common:add_donation(Role, SucL),
    role:send_buff_flush(),
    Evts = overlap_item_evt(SucL, []),
    FireRole = role_trigger:fire(Evts, Role),
    NewRole = FireRole,
    {ok, NewRole, SucL, FailL};
do_auto_overlap([#gain{label = item_base_id, val = []}
                 | T],
                Role, Title, CanFail, SucL, FailL) ->
    do_auto_overlap(T, Role, Title, CanFail, SucL, FailL);
do_auto_overlap([G = #gain{label = item_base_id,
                           val = [{ItemBaseId, Bind, Num} | T1]}
                 | T],
                Role = #role{p_bag = Bag}, Title, CanFail, SucL,
                FailL) ->
    G1 = G#gain{val = [{ItemBaseId, Bind, Num}]},
    G2 = G#gain{val = T1},
    case package:do_find_add_item(Bag,
                                  ItemBaseId,
                                  Bind,
                                  Num)
        of
        false ->
            case to_do([G1], Role) of
                {ok, NRole, GL} ->
                    do_auto_overlap([G2 | T],
                                    NRole,
                                    Title,
                                    CanFail,
                                    SucL ++ GL,
                                    FailL);
                {false, NewG} when CanFail =:= true ->
                    do_auto_overlap([G2 | T],
                                    Role,
                                    Title,
                                    CanFail,
                                    SucL,
                                    [NewG | FailL]);
                {false, NewG} ->
                    role:send_buff_clean(),
                    {false, NewG}
            end;
        {ok, NewBag} ->
            do_auto_overlap([G2 | T],
                            Role#role{p_bag = NewBag},
                            Title,
                            CanFail,
                            SucL ++ [G1],
                            FailL)
    end;
do_auto_overlap([G = #gain{label = item_base_id,
                           val =
                               [Args = #{base_id := _ItemBaseId, bind := _Bind,
                                         quantity := _Num}
                                | T1]}
                 | T],
                Role = #role{p_bag = Bag}, Title, CanFail, SucL,
                FailL) ->
    G1 = G#gain{val = [Args]},
    G2 = G#gain{val = T1},
    case package:do_find_add_item(Bag, Args) of
        false ->
            case to_do([G1], Role) of
                {ok, NRole, GL} ->
                    do_auto_overlap([G2 | T],
                                    NRole,
                                    Title,
                                    CanFail,
                                    SucL ++ GL,
                                    FailL);
                {false, NewG} when CanFail =:= true ->
                    do_auto_overlap([G2 | T],
                                    Role,
                                    Title,
                                    CanFail,
                                    SucL,
                                    [NewG | FailL]);
                {false, NewG} ->
                    role:send_buff_clean(),
                    {false, NewG}
            end;
        {ok, NewBag} ->
            do_auto_overlap([G2 | T],
                            Role#role{p_bag = NewBag},
                            Title,
                            CanFail,
                            [G1 | SucL],
                            FailL)
    end;
do_auto_overlap([G = #gain{label = items,
                           val = [Item | T1]}
                 | T],
                Role = #role{p_bag = Bag}, Title, CanFail, SucL,
                FailL) ->
    G1 = G#gain{val = [Item]},
    G2 = G#gain{val = T1},
    case package:find_add_item(by_source,
                               push,
                               Item,
                               Bag,
                               Role)
        of
        false ->
            case to_do([G1], Role) of
                {ok, NRole, GL} ->
                    do_auto_overlap([G2 | T],
                                    NRole,
                                    Title,
                                    CanFail,
                                    SucL ++ GL,
                                    FailL);
                {false, NewG} when CanFail =:= true ->
                    do_auto_overlap([G2 | T],
                                    Role,
                                    Title,
                                    CanFail,
                                    SucL,
                                    [NewG | FailL]);
                {false, NewG} ->
                    role:send_buff_clean(),
                    {false, NewG}
            end;
        {ok, NewBag} ->
            do_auto_overlap([G2 | T],
                            Role#role{p_bag = NewBag},
                            Title,
                            CanFail,
                            [G1 | SucL],
                            FailL)
    end;
do_auto_overlap([G | T], Role, Title, CanFail, SucL,
                FailL) ->
    case to_do([G], Role) of
        {ok, NRole, GL} ->
            do_auto_overlap(T,
                            NRole,
                            Title,
                            CanFail,
                            SucL ++ GL,
                            FailL);
        {false, NewG} when CanFail =:= true ->
            do_auto_overlap(T,
                            Role,
                            Title,
                            CanFail,
                            SucL,
                            [NewG | FailL]);
        {false, NewG} ->
            role:send_buff_clean(),
            {false, NewG}
    end.

overlap_item_evt(#gain{label = Label, val = ItemInfo})
    when Label =:= item_base_id orelse Label =:= items ->
    case item:make(ItemInfo) of
        {ok, Items} -> {ok, to_gain_evt(Items, [])};
        _ -> false
    end;
overlap_item_evt(_Unkown) -> false.

overlap_item_evt([], Evts) -> Evts;
overlap_item_evt([H | Rest], Evts) ->
    NewEvts = case overlap_item_evt(H) of
                  {ok, AddEvts} -> AddEvts ++ Evts;
                  _ -> Evts
              end,
    overlap_item_evt(Rest, NewEvts).

-spec do_notice(list(), #role{}) -> {ok, #role{}} |
                                    {false, #loss{} | #gain{}}.

do_notice(List, Role) -> do_notice(List, Role, "").

do_notice(List, Role, Title) ->
    case to_do(List, Role) of
        {ok, NRole, NewList} ->
            notice:gl(NewList, Role, Title),
            guild_common:add_donation(Role, List),
            {ok, NRole};
        Other -> Other
    end.

do([], Role) -> {ok, Role};
do(List, Role) ->
    case to_do(List, Role) of
        {ok, NewRole, _NewL} ->
            guild_common:add_donation(Role, List),
            {ok, NewRole};
        {false, L} -> {false, L}
    end.

-spec do(List :: list(), Role :: #role{},
         Opts :: map()) -> {ok, #role{}, map()} |
                           {false, #loss{} | #gain{}} |
                           {false, string()}.

do([], Role, Opts) -> {ok, Role, Opts};
do(List, Role, Opts) when is_map(Opts) ->
    case to_do(List, Role) of
        {ok, NewRole, NewL} ->
            guild_common:add_donation(Role, List),
            {ok, NewRole, Opts#{new_gl => NewL}};
        {false, L} -> {false, L}
    end;
do(_List, #role{name = Name}, Opts) ->
    logger:error("[name:~ts]错误损益操作参数:~w",
                 [Name, Opts],
                 role_gain,
                 238),
    {false, lang:get("错误的参数")}.

to_do(List, Role = #role{pid = Pid}) ->
    fun_call:trans_begin(),
    put(role_gain_evts, []),
    case gl_all(List, Role, [], #role_gain_gl_args{}) of
        {ok, GlRole, NewGL, Args} ->
            refresh(Args, GlRole),
            GainRole = GlRole#role{is_gain = true},
            Evts = erase(role_gain_evts),
            NRole = role_trigger:fire(Evts, GainRole),
            fun_call:trans_flush(),
            {ok, NRole, NewGL};
        {false, L} ->
            erase(role_gain_evts),
            fun_call:trans_clean(),
            case L of
                #loss{label = Label} ->
                    role:apply(async, Pid, {role_gain, push_9908, [Label]}),
                    ok;
                _ -> ok
            end,
            {false, L}
    end.

refresh(#role_gain_gl_args{refresh_items = RefreshList,
                           push_assets = PushArgs, ext_args = ExtArgs},
        Role) ->
    case lists:member(assets, PushArgs) of
        true -> push_assets(Role);
        false -> skip
    end,
    case lists:member(exp, PushArgs) of
        true -> push_exp(Role);
        false -> skip
    end,
    case lists:member(rest, PushArgs) of
        true -> push_rest(Role);
        false -> skip
    end,
    package:push_gain(RefreshList, Role),
    do_run_ext(ExtArgs, Role).

merge_evts([], Acc) -> Acc;
merge_evts([I | T], Acc) -> merge_evts(T, [I | Acc]);
merge_evts(Single, Acc) -> [Single | Acc].

to_gain_evt([], Acc) -> Acc;
to_gain_evt([I | T], Acc) ->
    case to_gain_evt(I) of
        false -> to_gain_evt(T, Acc);
        Evt -> to_gain_evt(T, [Evt | Acc])
    end.

to_gain_evt(#item{base_id = BaseId, quantity = Num}) ->
    #evt_get_item{base_id = BaseId, num = Num};
to_gain_evt(_Unkown) -> false.

to_loss_evt([], Acc) -> Acc;
to_loss_evt([I | T], Acc) ->
    case to_loss_evt(I) of
        false -> to_loss_evt(T, Acc);
        Evt -> to_loss_evt(T, [Evt | Acc])
    end.

to_loss_evt(#item{base_id = BaseId, quantity = Num}) ->
    #evt_del_item{base_id = BaseId, num = Num};
to_loss_evt(_Unkown) -> false.

-spec gl_all(GL, Role, AccGL, Args) -> {ok,
                                        NewRole,
                                        NewGL,
                                        NewArgs} |
                                       {false, False} when GL :: [#gain{} |
                                                                  #loss{}],
                                                           AccGL :: [#gain{} |
                                                                     #loss{}],
                                                           NewGL :: [#gain{} |
                                                                     #loss{}],
                                                           Role :: #role{},
                                                           NewRole :: #role{},
                                                           False :: #gain{} |
                                                                    #loss{},
                                                           Args ::
                                                               #role_gain_gl_args{},
                                                           NewArgs ::
                                                               #role_gain_gl_args{}.

gl_all([], Role, GL,
       Args = #role_gain_gl_args{push_assets = PushAssets,
                                 refresh_items = RefreshItems}) ->
    NewGL = case GL of
                [_ | _] -> lists:reverse(GL);
                _ -> []
            end,
    NewPushAssets = util:remove_duplicate(PushAssets),
    NewRefreshItems = merge_refresh_items(RefreshItems, []),
    NewArgs = Args#role_gain_gl_args{push_assets =
                                         NewPushAssets,
                                     refresh_items = NewRefreshItems},
    {ok, Role, NewGL, NewArgs};
gl_all([H | T], Role, NewGL, Args) ->
    case gl(H, Args, Role) of
        {false, L} -> {false, L};
        {ok, NewRole} -> gl_all(T, NewRole, [H | NewGL], Args);
        {ok, NewRole, NewArgs} ->
            gl_all(T, NewRole, [H | NewGL], NewArgs);
        {ok, NewRole, GL = [_ | _], NewArgs} ->
            gl_all(T, NewRole, GL ++ NewGL, NewArgs);
        {ok, NewRole, [], NewArgs} ->
            gl_all(T, NewRole, NewGL, NewArgs);
        _Unkown ->
            logger:error("错误的损益操作的刷新返回值[Err:~w]",
                         [_Unkown],
                         role_gain,
                         364),
            {false, H}
    end.

merge_refresh_items([], Acc) -> Acc;
merge_refresh_items([{Type, Add, Del, Fresh} | Rest],
                    Acc) ->
    NewAcc = case lists:keytake(Type, 1, Acc) of
                 {value, {_Type, AddAcc, DelAcc, FreshAcc}, RestAcc} ->
                     [{Type, Add ++ AddAcc, Del ++ DelAcc, Fresh ++ FreshAcc}
                      | RestAcc];
                 _ -> [{Type, Add, Del, Fresh} | Acc]
             end,
    merge_refresh_items(Rest, NewAcc);
merge_refresh_items([_ | Rest], Acc) ->
    merge_refresh_items(Rest, Acc).

do_run_ext([], _Role) -> skip;
do_run_ext([{msg, Msg} | T], Role) ->
    notice:send(Role, 3, Msg),
    do_run_ext(T, Role);
do_run_ext([_ | T], Role) -> do_run_ext(T, Role).

-compile({inline, [{label_to_enum, 1}]}).

label_to_enum(coin) -> 90000;
label_to_enum(gold_bind) -> 90003;
label_to_enum(gold) -> 90002;
label_to_enum(gold_bind_or_gold) -> 90002;
label_to_enum(coin_or_gold) -> 90002;
label_to_enum(star_gold_or_gold) -> 90002;
label_to_enum(hallowmas) -> 29811;
label_to_enum(christmas_snow) -> 29915;
label_to_enum(lucky_knot) -> 29971;
label_to_enum(_Label) -> false.

push_9908(Role, Label) ->
    case label_to_enum(Label) of
        EnumType when is_integer(EnumType) ->
            role:link_send(Role, 9908, {EnumType}),
            ok;
        _ -> ok
    end.

gl(G = #gain{label = exp, val = Val,
             source = Source = 13},
   Args = #role_gain_gl_args{push_assets = PushAssets,
                             ext_args = ExtArgs},
   Role = #role{name = _Name,
                assets = Assets = #assets{exp = Exp, coin = Coin},
                lev = Lev},
   LevMax) ->
    {WorldLev, ExpRatio, CoinRatio} =
        world_lev:calc_exp(Role),
    _ExpVal = round(Val * ExpRatio / 1000),
    CoinVal = round(Val * CoinRatio / 1000),
    MaxExp = lev_break:get_max_exp(Role),
    NewRole = role_trigger:fire(#evt_gain_experience{val =
                                                         Val},
                                Role),
    case CoinVal > 0 of
        _ when Exp >= MaxExp andalso LevMax =:= 100 ->
            NoticeMsg = lang:get("储存经验已满，突破后可继续升级"),
            add_log_item(gain, {90010, 0}),
            NewPushAssets = [assets | PushAssets],
            NewExtArgs = [{msg, NoticeMsg} | ExtArgs],
            NewArgs = Args#role_gain_gl_args{push_assets =
                                                 NewPushAssets,
                                             ext_args = NewExtArgs},
            logger:debug("加经验:~ts;来源:~w;原始值:~w（存储经验满不再增加）",
                         [_Name, Source, Val],
                         role_gain,
                         443),
            {ok, NewRole, [], NewArgs};
        _
            when Exp >= MaxExp andalso
                     (Lev =:= 109 orelse Lev =:= 99) ->
            NoticeMsg = lang:get("储存经验已满，跃升后可继续升级"),
            add_log_item(gain, {90010, 0}),
            NewPushAssets = [assets | PushAssets],
            NewExtArgs = [{msg, NoticeMsg} | ExtArgs],
            NewArgs = Args#role_gain_gl_args{push_assets =
                                                 NewPushAssets,
                                             ext_args = NewExtArgs},
            logger:debug("加经验:~ts;来源:~w;原始值:~w（存储经验满不再增加）",
                         [_Name, Source, Val],
                         role_gain,
                         453),
            {ok, NewRole, [], NewArgs};
        _ when Exp >= MaxExp andalso Lev >= LevMax ->
            NoticeMsg = lang:get("储存经验已满，突破后可继续升级，经验全部转换为银币"),
            NewCoinVal = round(Val * 5.0e-1),
            Gains = [#gain{label = coin, val = NewCoinVal}],
            Role1 = NewRole#role{assets =
                                     Assets#assets{coin =
                                                       round(Coin +
                                                                 NewCoinVal)}},
            Evts = merge_evts([#evt_gain_coin{val = NewCoinVal},
                               #evt_have_coin{val = round(Coin + NewCoinVal)}],
                              get(role_gain_evts)),
            put(role_gain_evts, Evts),
            add_log_item(gain, {90000, NewCoinVal}),
            NewPushAssets = [assets | PushAssets],
            NewExtArgs = [{msg, NoticeMsg} | ExtArgs],
            NewArgs = Args#role_gain_gl_args{push_assets =
                                                 NewPushAssets,
                                             ext_args = NewExtArgs},
            logger:debug("加经验:~ts;来源:~w;原始值:~w 转银币:~w（存储经验满不再增加）",
                         [_Name, Source, Val, NewCoinVal],
                         role_gain,
                         467),
            {ok, Role1, Gains, NewArgs};
        true ->
            NoticeMsg =
                notice:format(lang:get("您已高于世界等级~ts，经验全部转换为银币"),
                              [{string_2, 5, lang:get("8级")}]),
            Gains = [#gain{label = coin, val = CoinVal}],
            Role1 = NewRole#role{assets =
                                     Assets#assets{coin =
                                                       round(Coin + CoinVal)}},
            Evts = merge_evts([#evt_gain_coin{val = CoinVal},
                               #evt_have_coin{val = round(Coin + CoinVal)}],
                              get(role_gain_evts)),
            put(role_gain_evts, Evts),
            add_log_item(gain, {90000, CoinVal}),
            NewPushAssets = [assets | PushAssets],
            NewExtArgs = [{msg, NoticeMsg} | ExtArgs],
            NewArgs = Args#role_gain_gl_args{push_assets =
                                                 NewPushAssets,
                                             ext_args = NewExtArgs},
            logger:debug("加经验:~ts;来源:~w;原始值:~w;世界等级转换:~w;世界的等级加成：~w;转银币"
                         ":~w;(全部转成银币)",
                         [_Name, Source, Val, _ExpVal, ExpRatio, CoinVal],
                         role_gain,
                         480),
            {ok, Role1, Gains, NewArgs};
        _ ->
            {WorldLev, _ExpRatio, _CoinRatio} =
                world_lev:calc_exp(NewRole),
            {Role1, ReserveExp} =
                agenda:extract_reserve_exp(NewRole, Val, Source),
            AddVal = round(Val + ReserveExp),
            NewVal = levup:calc_stop_lev_exp(Role1, AddVal),
            Gains = [G#gain{val = NewVal,
                            ext_val = round(ReserveExp)}],
            add_log_item(gain, {90010, NewVal}),
            NewPushAssets = [exp | PushAssets],
            NewArgs = Args#role_gain_gl_args{push_assets =
                                                 NewPushAssets},
            logger:debug("加经验:~ts;来源:~w;原始值:~w;储备经验:~w, 实际值:~w(原始 "
                         "+ 储备经验)",
                         [_Name, Source, Val, ReserveExp, NewVal],
                         role_gain,
                         492),
            {ok,
             levup:add_exp(NewVal, WorldLev + 8, Role1),
             Gains,
             NewArgs}
    end;
gl(G = #gain{label = exp, val = Val,
             source = Source = 12},
   Args = #role_gain_gl_args{push_assets = PushAssets,
                             ext_args = _ExtArgs},
   Role = #role{name = _Name}, _LevMax) ->
    NewRole = role_trigger:fire(#evt_gain_experience{val =
                                                         Val},
                                Role),
    {WorldLev, _ExpRatio, _CoinRatio} =
        world_lev:calc_exp(NewRole),
    {Role1, ReserveExp} =
        agenda:extract_reserve_exp(NewRole, Val, Source),
    AddVal = round(Val + ReserveExp),
    NewVal = levup:calc_stop_lev_exp(Role1, AddVal),
    Gains = [G#gain{val = NewVal,
                    ext_val = round(ReserveExp)}],
    add_log_item(gain, {90010, NewVal}),
    NewPushAssets = [exp | PushAssets],
    NewArgs = Args#role_gain_gl_args{push_assets =
                                         NewPushAssets},
    logger:debug("加经验:~ts;来源:~w;原始值:~w;储备经验:~w, 实际值:~w(原始 "
                 "+ 储备经验)",
                 [_Name, Source, Val, ReserveExp, NewVal],
                 role_gain,
                 515),
    {ok,
     levup:add_exp(NewVal, WorldLev + 8, Role1),
     Gains,
     NewArgs};
gl(G = #gain{label = exp, val = Val, source = Source},
   Args = #role_gain_gl_args{push_assets = PushAssets,
                             ext_args = ExtArgs},
   Role = #role{name = _Name,
                assets = Assets = #assets{coin = Coin, exp = Exp},
                lev = Lev},
   LevMax) ->
    NewRole = role_trigger:fire(#evt_gain_experience{val =
                                                         Val},
                                Role),
    {WorldLev, ExpRatio, CoinRatio} =
        world_lev:calc_exp(NewRole),
    ExpVal = round(Val * ExpRatio / 1000),
    CoinVal = round(Val * CoinRatio / 1000),
    MaxExp = lev_break:get_max_exp(NewRole),
    case CoinVal > 0 of
        _ when Exp >= MaxExp andalso LevMax =:= 100 ->
            NoticeMsg = lang:get("储存经验已满，突破后可继续升级"),
            add_log_item(gain, {90010, 0}),
            NewPushAssets = [assets | PushAssets],
            NewExtArgs = [{msg, NoticeMsg} | ExtArgs],
            NewArgs = Args#role_gain_gl_args{push_assets =
                                                 NewPushAssets,
                                             ext_args = NewExtArgs},
            logger:debug("加经验:~ts;来源:~w;原始值:~w（存储经验满不再增加）",
                         [_Name, Source, Val],
                         role_gain,
                         541),
            {ok, NewRole, [], NewArgs};
        _
            when Exp >= MaxExp andalso
                     (Lev =:= 109 orelse Lev =:= 99) ->
            NoticeMsg = lang:get("储存经验已满，跃升后可继续升级"),
            add_log_item(gain, {90010, 0}),
            NewPushAssets = [assets | PushAssets],
            NewExtArgs = [{msg, NoticeMsg} | ExtArgs],
            NewArgs = Args#role_gain_gl_args{push_assets =
                                                 NewPushAssets,
                                             ext_args = NewExtArgs},
            logger:debug("加经验:~ts;来源:~w;原始值:~w（存储经验满不再增加）",
                         [_Name, Source, Val],
                         role_gain,
                         551),
            {ok, NewRole, [], NewArgs};
        _ when Exp >= MaxExp andalso Lev >= LevMax ->
            NoticeMsg = lang:get("储存经验已满，突破后可继续升级，经验全部转换为银币"),
            NewCoinVal = round(Val * 5.0e-1),
            Gains = [#gain{label = coin, val = NewCoinVal}],
            Role1 = NewRole#role{assets =
                                     Assets#assets{coin =
                                                       round(Coin +
                                                                 NewCoinVal)}},
            Evts = merge_evts([#evt_gain_coin{val = NewCoinVal},
                               #evt_have_coin{val = round(Coin + NewCoinVal)}],
                              get(role_gain_evts)),
            put(role_gain_evts, Evts),
            add_log_item(gain, {90000, NewCoinVal}),
            NewPushAssets = [assets | PushAssets],
            NewExtArgs = [{msg, NoticeMsg} | ExtArgs],
            NewArgs = Args#role_gain_gl_args{push_assets =
                                                 NewPushAssets,
                                             ext_args = NewExtArgs},
            logger:debug("加经验:~ts;来源:~w;原始值:~w 转银币:~w（存储经验满不再增加）",
                         [_Name, Source, Val, NewCoinVal],
                         role_gain,
                         565),
            {ok, Role1, Gains, NewArgs};
        true ->
            NoticeMsg =
                notice:format(lang:get("您已高于世界等级~ts，经验全部转换为银币"),
                              [{string_2, 5, lang:get("8级")}]),
            Gains = [#gain{label = coin, val = CoinVal}],
            Role1 = NewRole#role{assets =
                                     Assets#assets{coin =
                                                       round(Coin + CoinVal)}},
            Evts = merge_evts([#evt_gain_coin{val = CoinVal},
                               #evt_have_coin{val = round(Coin + CoinVal)}],
                              get(role_gain_evts)),
            put(role_gain_evts, Evts),
            add_log_item(gain, {90000, CoinVal}),
            NewPushAssets = [assets | PushAssets],
            NewExtArgs = [{msg, NoticeMsg} | ExtArgs],
            NewArgs = Args#role_gain_gl_args{push_assets =
                                                 NewPushAssets,
                                             ext_args = NewExtArgs},
            logger:debug("加经验:~ts;来源:~w;原始值:~w;世界等级转换:~w;世界的等级加成：~w;转银币"
                         ":~w;(全部转成银币)",
                         [_Name, Source, Val, ExpVal, ExpRatio, CoinVal],
                         role_gain,
                         578),
            {ok, Role1, Gains, NewArgs};
        false ->
            if ExpVal > Val ->
                   case lists:member(Source, [6, 8]) of
                       true ->
                           {Role1, ReserveExp} =
                               agenda:extract_reserve_exp(NewRole, Val, Source),
                           AddVal = round(Val + ReserveExp),
                           NewVal = levup:calc_stop_lev_exp(Role1, AddVal),
                           Gains = [G#gain{val = NewVal,
                                           ext_val = round(ReserveExp)}],
                           add_log_item(gain, {90010, NewVal}),
                           NewPushAssets = [exp | PushAssets],
                           NewArgs = Args#role_gain_gl_args{push_assets =
                                                                NewPushAssets},
                           logger:debug("加经验:~ts;来源:~w;原始值:~w;世界等级转换:~w;世界的等级加成：~w;转银币"
                                        ":~w;储备经验:~w, 实际值:~w(原始 + 储备经验;主线，荣耀不转换)",
                                        [_Name,
                                         Source,
                                         Val,
                                         ExpVal,
                                         ExpRatio,
                                         CoinVal,
                                         ReserveExp,
                                         NewVal],
                                        role_gain,
                                        593),
                           {ok,
                            levup:add_exp(NewVal, WorldLev + 8, Role1),
                            Gains,
                            NewArgs};
                       false ->
                           {Role1, ReserveExp} =
                               agenda:extract_reserve_exp(NewRole,
                                                          ExpVal,
                                                          Source),
                           AddVal = round(ExpVal + ReserveExp),
                           NewVal = levup:calc_stop_lev_exp(Role1, AddVal),
                           Gains = [G#gain{val = NewVal,
                                           ext_val = round(ReserveExp)}],
                           add_log_item(gain, {90010, NewVal}),
                           NewPushAssets = [exp | PushAssets],
                           NewArgs = Args#role_gain_gl_args{push_assets =
                                                                NewPushAssets},
                           logger:debug("加经验:~ts;来源:~w;原始值:~w;世界等级转换:~w;世界的等级加成：~w;转银币"
                                        ":~w;储备经验:~w, 实际值:~w(转换 + 储备经验;主线，荣耀不转换)",
                                        [_Name,
                                         Source,
                                         Val,
                                         ExpVal,
                                         ExpRatio,
                                         CoinVal,
                                         ReserveExp,
                                         NewVal],
                                        role_gain,
                                        604),
                           {ok,
                            levup:add_exp(NewVal, WorldLev + 8, Role1),
                            Gains,
                            NewArgs}
                   end;
               ExpVal =:= Val ->
                   {Role1, ReserveExp} =
                       agenda:extract_reserve_exp(NewRole, ExpVal, Source),
                   AddVal = round(ExpVal + ReserveExp),
                   NewVal = levup:calc_stop_lev_exp(Role1, AddVal),
                   Gains = [G#gain{val = NewVal,
                                   ext_val = round(ReserveExp)}],
                   add_log_item(gain, {90010, NewVal}),
                   NewPushAssets = [exp | PushAssets],
                   NewArgs = Args#role_gain_gl_args{push_assets =
                                                        NewPushAssets},
                   logger:debug("加经验:~ts;来源:~w;原始值:~w;世界等级转换:~w;世界的等级加成：~w;转银币"
                                ":~w;储备经验:~w, 实际值:~w(转换 + 储备经验；转换后相等)",
                                [_Name,
                                 Source,
                                 Val,
                                 ExpVal,
                                 ExpRatio,
                                 CoinVal,
                                 ReserveExp,
                                 NewVal],
                                role_gain,
                                616),
                   {ok,
                    levup:add_exp(NewVal, WorldLev + 8, Role1),
                    Gains,
                    NewArgs};
               true ->
                   {Role1, ReserveExp} =
                       agenda:extract_reserve_exp(NewRole, ExpVal, Source),
                   AddVal = round(ExpVal + ReserveExp),
                   NewVal = levup:calc_stop_lev_exp(Role1, AddVal),
                   Gains = [G#gain{val = NewVal,
                                   ext_val = round(ReserveExp)}],
                   add_log_item(gain, {90010, NewVal}),
                   NewPushAssets = [exp | PushAssets],
                   NewArgs = Args#role_gain_gl_args{push_assets =
                                                        NewPushAssets},
                   logger:debug("加经验:~ts;来源:~w;原始值:~w;世界等级转换:~w;世界的等级加成：~w;转银币"
                                ":~w;储备经验:~w, 实际值:~w(转换 + 储备经验；取转换)",
                                [_Name,
                                 Source,
                                 Val,
                                 ExpVal,
                                 ExpRatio,
                                 CoinVal,
                                 ReserveExp,
                                 NewVal],
                                role_gain,
                                627),
                   {ok,
                    levup:add_exp(NewVal, WorldLev + 8, Role1),
                    Gains,
                    NewArgs}
            end
    end.

gl(G = #gain{val = Val}, _Args, _Role)
    when is_integer(Val) andalso Val < 0 ->
    {false, G#gain{msg = lang:get("数值异常")}};
gl(L = #loss{val = Val}, _Args, _Role)
    when is_integer(Val) andalso Val < 0 ->
    {false, L#loss{msg = lang:get("数值异常")}};
gl(G = #gain{label = exp}, Args, Role) ->
    logger:debug("===增加经验===:", [], role_gain, 640),
    LevBreak = lev_break:get_max_lev(Role),
    gl(G, Args, Role, LevBreak);
gl(L = #loss{label = exp, val = Val},
   Args = #role_gain_gl_args{push_assets = PushAssets},
   Role = #role{assets = Assets = #assets{exp = Exp}})
    when Val >= 0 ->
    case Exp < Val of
        true -> {false, L};
        false ->
            NewRole = Role#role{assets =
                                    Assets#assets{exp = round(Exp - Val)}},
            add_log_item(loss, {90010, Val}),
            NewPushAssets = [exp | PushAssets],
            NewArgs = Args#role_gain_gl_args{push_assets =
                                                 NewPushAssets},
            {ok, NewRole, NewArgs}
    end;
gl(#gain{label = pet_exp, val = Val}, _Args, Role) ->
    case pet:add_exp(Role, #{mode => 1, val => Val}) of
        {ok, NRole} ->
            add_log_item(gain, {90005, Val}),
            {ok, NRole};
        _ -> {ok, Role}
    end;
gl(G = #gain{label = prac_exp}, _Args, Role) ->
    case skill_prac:add_cycle_exp(Role, 1, G) of
        Rtn = {ok, _NRole} -> Rtn;
        {false, Msg} -> {false, G#gain{msg = Msg}};
        {false, Msg, Reason} ->
            {false, G#gain{msg = Msg, reason = Reason}};
        _False ->
            Msg = lang:get("当前所有冒险技能都已达到世界等级上限，无法获得冒险经验"),
            {false, G#gain{msg = Msg}}
    end;
gl(#gain{label = gold, val = Val, source = Source},
   Args = #role_gain_gl_args{push_assets = PushAssets},
   Role = #role{assets = Assets = #assets{gold = Gold}}) ->
    Owe = var:get_var(Role, other, 2126, 0),
    case Owe > 0 of
        true ->
            {NewVal, NewOwe} = case Val >= Owe of
                                   true -> {Val - Owe, 0};
                                   false -> {0, Owe - Val}
                               end,
            NewRole = Role#role{assets =
                                    Assets#assets{gold = round(Gold + NewVal)}},
            NewRole1 = var:set_var(NewRole, other, 2126, NewOwe),
            OweMsg = notice:format(lang:get("当前实际钻石为~ts"),
                                   [{assets_1, 90002, -NewOwe}]),
            notice:send(Role, 7, OweMsg),
            put(role_gain_evts,
                [#evt_gain_gold{val = Val, source = Source}
                 | get(role_gain_evts)]),
            add_log_item(gain, {90002, NewVal}),
            NewPushAssets = [assets | PushAssets],
            NewArgs = Args#role_gain_gl_args{push_assets =
                                                 NewPushAssets},
            {ok, NewRole1, NewArgs};
        false ->
            NewRole = Role#role{assets =
                                    Assets#assets{gold = round(Gold + Val)}},
            put(role_gain_evts,
                [#evt_gain_gold{val = Val, source = Source}
                 | get(role_gain_evts)]),
            add_log_item(gain, {90002, Val}),
            NewPushAssets = [assets | PushAssets],
            NewArgs = Args#role_gain_gl_args{push_assets =
                                                 NewPushAssets},
            {ok, NewRole, NewArgs}
    end;
gl(L = #loss{label = gold, val = Val, reason = R,
             source = Source},
   Args = #role_gain_gl_args{push_assets = PushAssets},
   Role = #role{assets = Assets = #assets{gold = Gold}})
    when Val >= 0 ->
    case Gold < Val of
        true -> {false, L};
        false ->
            NewRole = Role#role{assets =
                                    Assets#assets{gold = round(Gold - Val)}},
            Evts = merge_evts(#evt_loss_gold{val = Val, reason = R},
                              get(role_gain_evts)),
            put(role_gain_evts, Evts),
            put(loss_gold_source, Source),
            add_log_item(loss, {90002, Val}),
            NewPushAssets = [assets | PushAssets],
            NewArgs = Args#role_gain_gl_args{push_assets =
                                                 NewPushAssets},
            {ok, NewRole, NewArgs}
    end;
gl(G = #gain{label = talisman, val = [{BaseId, Val}]},
   Args = #role_gain_gl_args{}, Role = #role{}) ->
    case talisman:add_talisman(Role, BaseId, Val) of
        {false, bag_full} ->
            {false,
             G#gain{reason = bag_full,
                    msg = lang:get("宝物背包已满，请先整理宝物背包")}};
        {false, Reason} ->
            logger:error("增加[~w]法宝时出错[~w]",
                         [BaseId, Reason],
                         role_gain,
                         745),
            {false,
             G#gain{reason = error_item,
                    msg = lang:get("错误的法宝,无法增加")}};
        {ok, NewRole, AddTalisman} ->
            add_log_item(gain, {BaseId, Val}),
            put(role_gain_talisman,
                AddTalisman ++ get(role_gain_talisman)),
            {ok, NewRole, Args}
    end;
gl(#gain{label = gold_bind, val = Val, source = Source},
   Args = #role_gain_gl_args{push_assets = PushAssets},
   Role = #role{name = Name,
                assets = Assets = #assets{gold_bind = GoldBind}}) ->
    Owe = var:get_var(Role, other, 2061, 0),
    case Owe > 0 of
        true ->
            {NewVal, NewOwe} = case Val >= Owe of
                                   true -> {Val - Owe, 0};
                                   false -> {0, Owe - Val}
                               end,
            logger:info("[~ts]欠款变动[~w:~w],增加变动[~w:~w]",
                        [Name, Owe, NewOwe, Val, NewVal],
                        role_gain,
                        766),
            NewRole = Role#role{assets =
                                    Assets#assets{gold_bind =
                                                      round(GoldBind +
                                                                NewVal)}},
            NewRole1 = var:set_var(NewRole, other, 2061, NewOwe),
            OweMsg = notice:format(lang:get("当前实际金币为~ts"),
                                   [{assets_1, 90003, -NewOwe}]),
            notice:send(Role, 7, OweMsg),
            Evts = merge_evts([#evt_gain_gold_bind{val = GoldBind,
                                                   source = Source},
                               #evt_have_gold_bind{val =
                                                       round(GoldBind +
                                                                 NewVal)}],
                              get(role_gain_evts)),
            put(role_gain_evts, Evts),
            OweMsg = notice:format(lang:get("当前实际金币为~ts"),
                                   [{assets_1, 90003, -NewOwe}]),
            notice:send(Role, 7, OweMsg),
            add_log_item(gain, {90003, NewVal}),
            NewPushAssets = [assets | PushAssets],
            NewArgs = Args#role_gain_gl_args{push_assets =
                                                 NewPushAssets},
            {ok, NewRole1, NewArgs};
        false ->
            NewRole = Role#role{assets =
                                    Assets#assets{gold_bind =
                                                      round(GoldBind + Val)}},
            Evts = merge_evts([#evt_gain_gold_bind{val = GoldBind,
                                                   source = Source},
                               #evt_have_gold_bind{val =
                                                       round(GoldBind + Val)}],
                              get(role_gain_evts)),
            put(role_gain_evts, Evts),
            add_log_item(gain, {90003, Val}),
            NewPushAssets = [assets | PushAssets],
            NewArgs = Args#role_gain_gl_args{push_assets =
                                                 NewPushAssets},
            {ok, NewRole, NewArgs}
    end;
gl(L = #loss{label = gold_bind, val = Val},
   Args = #role_gain_gl_args{push_assets = PushAssets},
   Role = #role{assets =
                    Assets = #assets{gold_bind = GoldBind}})
    when Val >= 0 ->
    case GoldBind < Val of
        true -> {false, L};
        false ->
            NewRole = Role#role{assets =
                                    Assets#assets{gold_bind =
                                                      round(GoldBind - Val)}},
            add_log_item(loss, {90003, Val}),
            Evts = merge_evts(#evt_loss_gold_bind{val = Val},
                              get(role_gain_evts)),
            put(role_gain_evts, Evts),
            NewPushAssets = [assets | PushAssets],
            NewArgs = Args#role_gain_gl_args{push_assets =
                                                 NewPushAssets},
            {ok, NewRole, NewArgs}
    end;
gl(#gain{label = achieve_score, val = Val},
   Args = #role_gain_gl_args{push_assets = PushAssets},
   Role = #role{m_achievement =
                    Achievement = #m_achievement{assets_point =
                                                     AchievePoint}}) ->
    NewRole = Role#role{m_achievement =
                            Achievement#m_achievement{assets_point =
                                                          AchievePoint + Val}},
    Evts = merge_evts([#evt_gain_achieve{val = Val}],
                      get(role_gain_evts)),
    put(role_gain_evts, Evts),
    add_log_item(gain, {90003, Val}),
    NewPushAssets = [assets | PushAssets],
    NewArgs = Args#role_gain_gl_args{push_assets =
                                         NewPushAssets},
    achievement:push(NewRole, 10222),
    {ok, NewRole, NewArgs};
gl(L = #loss{label = achieve_score, val = Val},
   Args = #role_gain_gl_args{push_assets = PushAssets},
   Role = #role{m_achievement =
                    Achievement = #m_achievement{assets_point =
                                                     AchievePoint}})
    when Val >= 0 ->
    case AchievePoint < Val of
        true -> {false, L};
        false ->
            NewRole = Role#role{m_achievement =
                                    Achievement#m_achievement{assets_point =
                                                                  round(AchievePoint
                                                                            -
                                                                            Val)}},
            add_log_item(loss, {90008, Val}),
            NewPushAssets = [assets | PushAssets],
            NewArgs = Args#role_gain_gl_args{push_assets =
                                                 NewPushAssets},
            achievement:push(NewRole, 10222),
            {ok, NewRole, NewArgs}
    end;
gl(L = #loss{label = gold_all, val = Val, reason = R},
   Args = #role_gain_gl_args{push_assets = PushAssets},
   Role = #role{assets =
                    Assets = #assets{gold = Gold, gold_bind = GoldBind}})
    when Val >= 0 ->
    case Gold + GoldBind < Val of
        true -> {false, L};
        false when GoldBind >= Val ->
            NewRole = Role#role{assets =
                                    Assets#assets{gold_bind =
                                                      round(GoldBind - Val)}},
            NewPushAssets = [assets | PushAssets],
            NewArgs = Args#role_gain_gl_args{push_assets =
                                                 NewPushAssets},
            {ok,
             NewRole,
             [#loss{label = gold_bind, val = Val}],
             NewArgs};
        false ->
            NewRole = Role#role{assets =
                                    Assets#assets{gold =
                                                      round(Gold -
                                                                (Val -
                                                                     GoldBind)),
                                                  gold_bind = 0}},
            GL = [#loss{label = gold, val = Val - GoldBind},
                  #loss{label = gold_bind, val = GoldBind}],
            Evts = merge_evts(#evt_loss_gold{val = Val, reason = R},
                              get(role_gain_evts)),
            put(role_gain_evts, Evts),
            NewPushAssets = [assets | PushAssets],
            NewArgs = Args#role_gain_gl_args{push_assets =
                                                 NewPushAssets},
            {ok, NewRole, GL, NewArgs}
    end;
gl(L = #loss{label = gold_bind_or_gold, val = BindVal},
   Args = #role_gain_gl_args{push_assets = PushAssets},
   Role = #role{assets =
                    Assets = #assets{gold_bind = GoldBind, gold = Gold,
                                     star_gold = StarGold}})
    when BindVal >= 0 ->
    case GoldBind < BindVal of
        true ->
            case market_gold:exchange_gold(BindVal, Role) of
                {ok, GoldVal} when StarGold + Gold >= GoldVal ->
                    gl(L#loss{label = star_gold_or_gold, val = GoldVal},
                       Args,
                       Role);
                _ -> {false, L}
            end;
        false ->
            NewRole = Role#role{assets =
                                    Assets#assets{gold_bind =
                                                      round(GoldBind -
                                                                BindVal)}},
            add_log_item(loss, {90003, BindVal}),
            NewLoss = #loss{label = gold_bind, val = BindVal},
            NewPushAssets = [assets | PushAssets],
            NewArgs = Args#role_gain_gl_args{push_assets =
                                                 NewPushAssets},
            {ok, NewRole, [NewLoss], NewArgs}
    end;
gl(#gain{label = coin, val = Val, source = Source},
   Args = #role_gain_gl_args{push_assets = PushAssets,
                             ext_args = ExtArgs},
   Role = #role{assets = Assets = #assets{coin = Coin}}) ->
    logger:debug("获得银币:~w", [Val], role_gain, 896),
    Owe = var:get_var(Role, other, 2127, 0),
    case Owe > 0 of
        true ->
            {NewVal, NewOwe} = case Val >= Owe of
                                   true -> {Val - Owe, 0};
                                   false -> {0, Owe - Val}
                               end,
            NewRole = Role#role{assets =
                                    Assets#assets{coin = round(Coin + NewVal)}},
            NewRole1 = var:set_var(NewRole, other, 2127, NewOwe),
            OweMsg = notice:format(lang:get("当前实际银币为~ts"),
                                   [{assets_1, 90000, -NewOwe}]),
            notice:send(Role, 7, OweMsg),
            Evts = merge_evts([#evt_gain_coin{val = NewVal,
                                              source = Source},
                               #evt_have_coin{val = round(Coin + NewVal)}],
                              get(role_gain_evts)),
            put(role_gain_evts, Evts),
            add_log_item(gain, {90000, Val}),
            NewPushAssets = [assets | PushAssets],
            NewArgs = Args#role_gain_gl_args{push_assets =
                                                 NewPushAssets},
            {ok, NewRole1, NewArgs};
        false ->
            logger:debug("获得银币:~w", [Val], role_gain, 915),
            case Coin >= 2000000000 of
                true ->
                    logger:debug("获得银币:~w", [Val], role_gain, 918),
                    NoticeMsg = lang:get("您的银币已经超过了上限,无法继续获得"),
                    NewExtArgs = [{msg, NoticeMsg} | ExtArgs],
                    NewArgs = Args#role_gain_gl_args{ext_args = NewExtArgs},
                    {ok, Role, NewArgs};
                _ ->
                    NewCoin = min(2000000000, round(Coin + Val)),
                    NewRole = Role#role{assets =
                                            Assets#assets{coin = NewCoin}},
                    Evts = merge_evts([#evt_gain_coin{val = Val,
                                                      source = Source},
                                       #evt_have_coin{val = NewCoin}],
                                      get(role_gain_evts)),
                    put(role_gain_evts, Evts),
                    add_log_item(gain, {90000, Val}),
                    NewPushAssets = [assets | PushAssets],
                    NewArgs = Args#role_gain_gl_args{push_assets =
                                                         NewPushAssets},
                    {ok, NewRole, NewArgs}
            end
    end;
gl(L = #loss{label = coin, val = Val, reason = R},
   Args = #role_gain_gl_args{push_assets = PushAssets},
   Role = #role{assets = Assets = #assets{coin = Coin}})
    when Val >= 0 ->
    case Coin < Val of
        true -> {false, L};
        false ->
            NewRole = Role#role{assets =
                                    Assets#assets{coin = round(Coin - Val)}},
            Evts = merge_evts(#evt_loss_coin{val = Val, reason = R},
                              get(role_gain_evts)),
            put(role_gain_evts, Evts),
            add_log_item(loss, {90000, Val}),
            NewPushAssets = [assets | PushAssets],
            NewArgs = Args#role_gain_gl_args{push_assets =
                                                 NewPushAssets},
            {ok, NewRole, NewArgs}
    end;
gl(#gain{label = coin_bind, val = Val, source = Source},
   Args = #role_gain_gl_args{push_assets = PushAssets},
   Role = #role{assets =
                    Assets = #assets{coin_bind = CoinBind}}) ->
    NewRole = Role#role{assets =
                            Assets#assets{coin_bind = round(CoinBind + Val)}},
    Evts = merge_evts([#evt_gain_coin{val = Val,
                                      source = Source}],
                      get(role_gain_evts)),
    put(role_gain_evts, Evts),
    NewPushAssets = [assets | PushAssets],
    NewArgs = Args#role_gain_gl_args{push_assets =
                                         NewPushAssets},
    {ok, NewRole, NewArgs};
gl(L = #loss{label = coin_bind, val = Val, reason = R},
   Args = #role_gain_gl_args{push_assets = PushAssets},
   Role = #role{assets =
                    Assets = #assets{coin_bind = CoinBind}}) ->
    case CoinBind < Val of
        true -> {false, L};
        false ->
            NewRole = Role#role{assets =
                                    Assets#assets{coin_bind =
                                                      round(CoinBind - Val)}},
            Evts = merge_evts(#evt_loss_coin{val = Val, reason = R},
                              get(role_gain_evts)),
            put(role_gain_evts, Evts),
            NewPushAssets = [assets | PushAssets],
            NewArgs = Args#role_gain_gl_args{push_assets =
                                                 NewPushAssets},
            {ok, NewRole, NewArgs}
    end;
gl(L = #loss{label = coin_or_gold, val = CoinVal},
   Args = #role_gain_gl_args{push_assets = PushAssets},
   Role = #role{assets =
                    Assets = #assets{coin = Coin, gold = Gold,
                                     star_gold = StarGold}})
    when CoinVal >= 0 ->
    case Coin < CoinVal of
        true ->
            case market_silver:exchange_gold(CoinVal, Role) of
                {ok, GoldVal} when StarGold + Gold >= GoldVal ->
                    gl(L#loss{label = star_gold_or_gold, val = GoldVal},
                       Args,
                       Role);
                _ -> {false, L#loss{msg = lang:get("钻石不足")}}
            end;
        false ->
            NewRole = Role#role{assets =
                                    Assets#assets{coin =
                                                      round(Coin - CoinVal)}},
            add_log_item(loss, {90000, CoinVal}),
            NewLoss = #loss{label = coin, val = CoinVal},
            NewPushAssets = [assets | PushAssets],
            NewArgs = Args#role_gain_gl_args{push_assets =
                                                 NewPushAssets},
            {ok, NewRole, [NewLoss], NewArgs}
    end;
gl(#gain{label = intelligs, val = AddVal},
   Args = #role_gain_gl_args{push_assets = PushAssets},
   Role = #role{assets =
                    Assets = #assets{intelligs = Val}}) ->
    NewRole = Role#role{assets =
                            Assets#assets{intelligs = Val + AddVal}},
    NewPushAssets = [rest | PushAssets],
    NewArgs = Args#role_gain_gl_args{push_assets =
                                         NewPushAssets},
    {ok, NewRole, NewArgs};
gl(L = #loss{label = intelligs, val = LossVal},
   Args = #role_gain_gl_args{push_assets = PushAssets},
   Role = #role{assets =
                    Assets = #assets{intelligs = Val}}) ->
    case LossVal =< Val of
        true ->
            NewRole = Role#role{assets =
                                    Assets#assets{intelligs = Val - LossVal}},
            NewPushAssets = [rest | PushAssets],
            NewArgs = Args#role_gain_gl_args{push_assets =
                                                 NewPushAssets},
            {ok, NewRole, NewArgs};
        false -> {false, L}
    end;
gl(#gain{label = alchemy, val = AddVal},
   Args = #role_gain_gl_args{push_assets = PushAssets},
   Role = #role{assets =
                    Assets = #assets{alchemy = Val}}) ->
    NewRole = Role#role{assets =
                            Assets#assets{alchemy = Val + AddVal}},
    NewPushAssets = [rest | PushAssets],
    NewArgs = Args#role_gain_gl_args{push_assets =
                                         NewPushAssets},
    {ok, NewRole, NewArgs};
gl(L = #loss{label = alchemy, val = LossVal},
   Args = #role_gain_gl_args{push_assets = PushAssets},
   Role = #role{assets =
                    Assets = #assets{alchemy = Val}}) ->
    case LossVal =< Val of
        true ->
            NewRole = Role#role{assets =
                                    Assets#assets{alchemy = Val - LossVal}},
            NewPushAssets = [rest | PushAssets],
            NewArgs = Args#role_gain_gl_args{push_assets =
                                                 NewPushAssets},
            {ok, NewRole, NewArgs};
        false -> {false, L}
    end;
gl(#gain{label = guild, val = AddVal},
   Args = #role_gain_gl_args{push_assets = PushAssets},
   Role = #role{assets = Assets = #assets{guild = Val}}) ->
    NewRole = Role#role{assets =
                            Assets#assets{guild = Val + AddVal}},
    Evts = merge_evts([#evt_gain_guild{val = AddVal}],
                      get(role_gain_evts)),
    put(role_gain_evts, Evts),
    add_log_item(gain, {90011, AddVal}),
    NewPushAssets = [rest | PushAssets],
    NewArgs = Args#role_gain_gl_args{push_assets =
                                         NewPushAssets},
    {ok, NewRole, NewArgs};
gl(#gain{label = guild_assets, val = AddVal},
   Args = #role_gain_gl_args{push_assets = PushAssets},
   Role) ->
    guild_common:add_assets(AddVal, Role),
    NewPushAssets = [rest | PushAssets],
    NewArgs = Args#role_gain_gl_args{push_assets =
                                         NewPushAssets},
    {ok, Role, NewArgs};
gl(L = #loss{label = guild, val = LossVal},
   Args = #role_gain_gl_args{push_assets = PushAssets},
   Role = #role{assets = Assets = #assets{guild = Val}})
    when Val >= 0 ->
    case LossVal =< Val of
        true ->
            NewRole = Role#role{assets =
                                    Assets#assets{guild = Val - LossVal}},
            add_log_item(loss, {90011, LossVal}),
            NewPushAssets = [rest | PushAssets],
            NewArgs = Args#role_gain_gl_args{push_assets =
                                                 NewPushAssets},
            {ok, NewRole, NewArgs};
        false -> {false, L}
    end;
gl(#gain{label = energy, val = AddVal},
   Args = #role_gain_gl_args{push_assets = PushAssets},
   Role = #role{lev = Lev,
                assets = Assets = #assets{energy = Val}}) ->
    NewVal = case agenda_data:get_energy_max(Lev) of
                 0 -> Val;
                 Limit -> min(Val + AddVal, Limit * 2)
             end,
    NewRole = Role#role{assets =
                            Assets#assets{energy = NewVal}},
    NewPushAssets = [rest | PushAssets],
    NewArgs = Args#role_gain_gl_args{push_assets =
                                         NewPushAssets},
    {ok, NewRole, NewArgs};
gl(L = #loss{label = energy, val = LossVal},
   Args = #role_gain_gl_args{push_assets = PushAssets},
   Role = #role{assets = Assets = #assets{energy = Val}})
    when Val >= 0 ->
    case LossVal =< Val of
        true ->
            NewRole = Role#role{assets =
                                    Assets#assets{energy = Val - LossVal}},
            NewPushAssets = [rest | PushAssets],
            NewArgs = Args#role_gain_gl_args{push_assets =
                                                 NewPushAssets},
            {ok, NewRole, NewArgs};
        false -> {false, L}
    end;
gl(#gain{label = satiety, val = AddVal},
   Args = #role_gain_gl_args{push_assets = PushAssets},
   Role = #role{assets =
                    Assets = #assets{satiety = Val}}) ->
    NewRole = Role#role{assets =
                            Assets#assets{satiety =
                                              max(Val,
                                                  min(Val + AddVal, 200))}},
    NewPushAssets = [rest | PushAssets],
    NewArgs = Args#role_gain_gl_args{push_assets =
                                         NewPushAssets},
    {ok, satiety:recharge(NewRole), NewArgs};
gl(L = #loss{label = satiety, val = LossVal},
   Args = #role_gain_gl_args{push_assets = PushAssets},
   Role = #role{assets = Assets = #assets{satiety = Val}})
    when Val >= 0 ->
    case LossVal =< Val of
        true ->
            NewRole = Role#role{assets =
                                    Assets#assets{satiety = Val - LossVal}},
            NewPushAssets = [rest | PushAssets],
            NewArgs = Args#role_gain_gl_args{push_assets =
                                                 NewPushAssets},
            {ok, NewRole, NewArgs};
        false -> {false, L}
    end;
gl(G = #gain{label = character, val = AddVal,
             notice_msg = NoticeMsg},
   Args = #role_gain_gl_args{push_assets = PushAssets,
                             ext_args = ExtArgs},
   Role = #role{assets =
                    Assets = #assets{character = Val}}) ->
    DayCharacter = var:get_var(Role, day_five, 109, 0),
    case DayCharacter >= 500 of
        true -> {ok, Role, [], Args};
        false ->
            AddValMax = min(500 - DayCharacter, AddVal),
            AddValMin = AddValMax,
            BuffAddPrecent = case
                                 buff:is_special_effect_exists_one_param(Role,
                                                                         25)
                                 of
                                 {true, ValueAdd} -> ValueAdd;
                                 _ -> 0
                             end,
            AddVal2 = util:ceil(AddValMin * (1000 + BuffAddPrecent)
                                    / 1000),
            logger:debug("在运势BUFF作用下, 活动的人品值增加了~w%,增加前~w, 增加后~w",
                         [BuffAddPrecent div 10, AddValMin, AddVal2],
                         role_gain,
                         1181),
            Msg = case NoticeMsg of
                      "" ->
                          notice:format(lang:get("获得~ts"),
                                        [{assets_1, 90007, AddVal2}]);
                      _ ->
                          notice:format(lang:get("~ts，获得~ts"),
                                        [{string_1, NoticeMsg},
                                         {assets_1, 90007, AddVal2}])
                  end,
            NewPushAssets = [rest | PushAssets],
            NewExtArgs = [{msg, Msg} | ExtArgs],
            NewRole = Role#role{assets =
                                    Assets#assets{character = Val + AddVal2}},
            NewArgs = Args#role_gain_gl_args{push_assets =
                                                 NewPushAssets,
                                             ext_args = NewExtArgs},
            add_log_item(gain, {90007, AddVal2}),
            Gains = [G#gain{val = AddVal2}],
            Evts = merge_evts([#evt_gain_character{val = AddVal2}],
                              get(role_gain_evts)),
            put(role_gain_evts, Evts),
            NewDayCharacter = DayCharacter + AddVal2,
            NewRole1 = var:set_var(NewRole,
                                   day_five,
                                   109,
                                   NewDayCharacter),
            {ok, NewRole1, Gains, NewArgs}
    end;
gl(L = #loss{label = character, val = LossVal},
   Args = #role_gain_gl_args{push_assets = PushAssets},
   Role = #role{assets =
                    Assets = #assets{character = Val}})
    when Val >= 0 ->
    case LossVal =< Val of
        true ->
            NewRole = Role#role{assets =
                                    Assets#assets{character = Val - LossVal}},
            add_log_item(loss, {90007, LossVal}),
            NewPushAssets = [rest | PushAssets],
            NewArgs = Args#role_gain_gl_args{push_assets =
                                                 NewPushAssets},
            {ok, NewRole, NewArgs};
        false -> {false, L}
    end;
gl(#gain{label = stars_score, val = AddVal},
   Args = #role_gain_gl_args{push_assets = PushAssets},
   Role = #role{assets =
                    Assets = #assets{stars_score = Val}}) ->
    NewRole = Role#role{assets =
                            Assets#assets{stars_score = Val + AddVal}},
    add_log_item(gain, {90012, AddVal}),
    NewPushAssets = [rest | PushAssets],
    NewArgs = Args#role_gain_gl_args{push_assets =
                                         NewPushAssets},
    {ok, NewRole, NewArgs};
gl(L = #loss{label = stars_score, val = LossVal},
   Args = #role_gain_gl_args{push_assets = PushAssets},
   Role = #role{assets =
                    Assets = #assets{stars_score = Val}})
    when Val >= 0 ->
    case LossVal =< Val of
        true ->
            NewRole = Role#role{assets =
                                    Assets#assets{stars_score = Val - LossVal}},
            add_log_item(loss, {90012, LossVal}),
            NewPushAssets = [rest | PushAssets],
            NewArgs = Args#role_gain_gl_args{push_assets =
                                                 NewPushAssets},
            {ok, NewRole, NewArgs};
        false -> {false, L}
    end;
gl(#gain{label = lucky_ticket, val = AddVal},
   Args = #role_gain_gl_args{push_assets = PushAssets},
   Role = #role{assets =
                    Assets = #assets{lucky_ticket = Val}}) ->
    NewRole = Role#role{assets =
                            Assets#assets{lucky_ticket = Val + AddVal}},
    add_log_item(gain, {90042, AddVal}),
    NewPushAssets = [rest | PushAssets],
    NewArgs = Args#role_gain_gl_args{push_assets =
                                         NewPushAssets},
    {ok, NewRole, NewArgs};
gl(L = #loss{label = lucky_ticket, val = LossVal},
   Args = #role_gain_gl_args{push_assets = PushAssets},
   Role = #role{assets =
                    Assets = #assets{lucky_ticket = Val}})
    when Val >= 0 ->
    case LossVal =< Val of
        true ->
            NewRole = Role#role{assets =
                                    Assets#assets{lucky_ticket =
                                                      Val - LossVal}},
            add_log_item(loss, {90042, LossVal}),
            NewPushAssets = [rest | PushAssets],
            NewArgs = Args#role_gain_gl_args{push_assets =
                                                 NewPushAssets},
            {ok, NewRole, NewArgs};
        false -> {false, L}
    end;
gl(#gain{label = dollar, val = AddVal},
   Args = #role_gain_gl_args{push_assets = PushAssets},
   Role = #role{assets =
                    Assets = #assets{dollar = Val}}) ->
    NewRole = Role#role{assets =
                            Assets#assets{dollar = Val + AddVal}},
    add_log_item(gain, {90044, AddVal}),
    NewPushAssets = [rest | PushAssets],
    NewArgs = Args#role_gain_gl_args{push_assets =
                                         NewPushAssets},
    {ok, NewRole, NewArgs};
gl(L = #loss{label = dollar, val = LossVal},
   Args = #role_gain_gl_args{push_assets = PushAssets},
   Role = #role{assets = Assets = #assets{dollar = Val}})
    when Val >= 0 ->
    case LossVal =< Val of
        true ->
            NewRole = Role#role{assets =
                                    Assets#assets{dollar = Val - LossVal}},
            add_log_item(loss, {90044, LossVal}),
            NewPushAssets = [rest | PushAssets],
            NewArgs = Args#role_gain_gl_args{push_assets =
                                                 NewPushAssets},
            {ok, NewRole, NewArgs};
        false -> {false, L}
    end;
gl(#gain{label = naughty, val = AddVal},
   Args = #role_gain_gl_args{push_assets = PushAssets},
   Role = #role{assets =
                    Assets = #assets{naughty = Val}}) ->
    NewRole = Role#role{assets =
                            Assets#assets{naughty = Val + AddVal}},
    add_log_item(gain, {90045, AddVal}),
    NewPushAssets = [rest | PushAssets],
    NewArgs = Args#role_gain_gl_args{push_assets =
                                         NewPushAssets},
    {ok, NewRole, NewArgs};
gl(L = #loss{label = naughty, val = LossVal},
   Args = #role_gain_gl_args{push_assets = PushAssets},
   Role = #role{assets = Assets = #assets{naughty = Val}})
    when Val >= 0 ->
    case LossVal =< Val of
        true ->
            NewRole = Role#role{assets =
                                    Assets#assets{naughty = Val - LossVal}},
            add_log_item(loss, {90045, LossVal}),
            NewPushAssets = [rest | PushAssets],
            NewArgs = Args#role_gain_gl_args{push_assets =
                                                 NewPushAssets},
            {ok, NewRole, NewArgs};
        false -> {false, L}
    end;
gl(#gain{label = concentric, val = AddVal},
   Args = #role_gain_gl_args{push_assets = PushAssets},
   Role = #role{assets =
                    Assets = #assets{concentric = Val}}) ->
    NewRole = Role#role{assets =
                            Assets#assets{concentric = Val + AddVal}},
    add_log_item(gain, {90046, AddVal}),
    NewPushAssets = [rest | PushAssets],
    NewArgs = Args#role_gain_gl_args{push_assets =
                                         NewPushAssets},
    {ok, NewRole, NewArgs};
gl(L = #loss{label = concentric, val = LossVal},
   Args = #role_gain_gl_args{push_assets = PushAssets},
   Role = #role{assets =
                    Assets = #assets{concentric = Val}})
    when Val >= 0 ->
    case LossVal =< Val of
        true ->
            NewRole = Role#role{assets =
                                    Assets#assets{concentric = Val - LossVal}},
            add_log_item(loss, {90046, LossVal}),
            NewPushAssets = [rest | PushAssets],
            NewArgs = Args#role_gain_gl_args{push_assets =
                                                 NewPushAssets},
            {ok, NewRole, NewArgs};
        false -> {false, L}
    end;
gl(#gain{label = qixiIntegral, val = AddVal},
   Args = #role_gain_gl_args{push_assets = PushAssets},
   Role = #role{assets =
                    Assets = #assets{qixiIntegral = Val}}) ->
    NewRole = Role#role{assets =
                            Assets#assets{qixiIntegral = Val + AddVal}},
    add_log_item(gain, {90047, AddVal}),
    NewPushAssets = [rest | PushAssets],
    NewArgs = Args#role_gain_gl_args{push_assets =
                                         NewPushAssets},
    {ok, NewRole, NewArgs};
gl(L = #loss{label = qixiIntegral, val = LossVal},
   Args = #role_gain_gl_args{push_assets = PushAssets},
   Role = #role{assets =
                    Assets = #assets{qixiIntegral = Val}})
    when Val >= 0 ->
    case LossVal =< Val of
        true ->
            NewRole = Role#role{assets =
                                    Assets#assets{qixiIntegral =
                                                      Val - LossVal}},
            add_log_item(loss, {90047, LossVal}),
            NewPushAssets = [rest | PushAssets],
            NewArgs = Args#role_gain_gl_args{push_assets =
                                                 NewPushAssets},
            {ok, NewRole, NewArgs};
        false -> {false, L}
    end;
gl(#gain{label = sunshine, val = AddVal},
   Args = #role_gain_gl_args{push_assets = PushAssets},
   Role = #role{assets =
                    Assets = #assets{sunshine = Val}}) ->
    put(role_gain_items,
        [{90048, AddVal}] ++ get(role_gain_items)),
    NewRole = Role#role{assets =
                            Assets#assets{sunshine = Val + AddVal}},
    NewPushAssets = [rest | PushAssets],
    NewArgs = Args#role_gain_gl_args{push_assets =
                                         NewPushAssets},
    {ok, NewRole, NewArgs};
gl(L = #loss{label = sunshine, val = LossVal},
   Args = #role_gain_gl_args{push_assets = PushAssets},
   Role = #role{assets = Assets = #assets{sunshine = Val}})
    when Val >= 0 ->
    case LossVal =< Val of
        true ->
            NewItemInfo = package:merge([{90048, LossVal}]),
            LogItems = merge_items(NewItemInfo,
                                   get(role_loss_items)),
            put(role_loss_items, LogItems),
            NewRole = Role#role{assets =
                                    Assets#assets{sunshine = Val - LossVal}},
            NewPushAssets = [rest | PushAssets],
            NewArgs = Args#role_gain_gl_args{push_assets =
                                                 NewPushAssets},
            {ok, NewRole, NewArgs};
        false -> {false, L}
    end;
gl(#gain{label = cut_price, val = AddVal},
   Args = #role_gain_gl_args{push_assets = PushAssets},
   Role = #role{assets =
                    Assets = #assets{cut_price = Val}}) ->
    put(role_gain_items,
        [{90049, AddVal}] ++ get(role_gain_items)),
    NewRole = Role#role{assets =
                            Assets#assets{cut_price = Val + AddVal}},
    NewPushAssets = [rest | PushAssets],
    NewArgs = Args#role_gain_gl_args{push_assets =
                                         NewPushAssets},
    {ok, NewRole, NewArgs};
gl(L = #loss{label = cut_price, val = LossVal},
   Args = #role_gain_gl_args{push_assets = PushAssets},
   Role = #role{assets =
                    Assets = #assets{cut_price = Val}})
    when Val >= 0 ->
    case LossVal =< Val of
        true ->
            NewItemInfo = package:merge([{90049, LossVal}]),
            LogItems = merge_items(NewItemInfo,
                                   get(role_loss_items)),
            put(role_loss_items, LogItems),
            NewRole = Role#role{assets =
                                    Assets#assets{cut_price = Val - LossVal}},
            NewPushAssets = [rest | PushAssets],
            NewArgs = Args#role_gain_gl_args{push_assets =
                                                 NewPushAssets},
            {ok, NewRole, NewArgs};
        false -> {false, L}
    end;
gl(#gain{label = single_dog, val = AddVal},
   Args = #role_gain_gl_args{push_assets = PushAssets},
   Role = #role{assets =
                    Assets = #assets{single_dog = Val}}) ->
    put(role_gain_items,
        [{90050, AddVal}] ++ get(role_gain_items)),
    NewRole = Role#role{assets =
                            Assets#assets{single_dog = Val + AddVal}},
    NewPushAssets = [rest | PushAssets],
    NewArgs = Args#role_gain_gl_args{push_assets =
                                         NewPushAssets},
    {ok, NewRole, NewArgs};
gl(L = #loss{label = single_dog, val = LossVal},
   Args = #role_gain_gl_args{push_assets = PushAssets},
   Role = #role{assets =
                    Assets = #assets{single_dog = Val}})
    when Val >= 0 ->
    case LossVal =< Val of
        true ->
            NewItemInfo = package:merge([{90050, LossVal}]),
            LogItems = merge_items(NewItemInfo,
                                   get(role_loss_items)),
            put(role_loss_items, LogItems),
            NewRole = Role#role{assets =
                                    Assets#assets{single_dog = Val - LossVal}},
            NewPushAssets = [rest | PushAssets],
            NewArgs = Args#role_gain_gl_args{push_assets =
                                                 NewPushAssets},
            {ok, NewRole, NewArgs};
        false -> {false, L}
    end;
gl(#gain{label = love, val = AddVal},
   Args = #role_gain_gl_args{push_assets = PushAssets},
   Role = #role{assets = Assets = #assets{love = Val}}) ->
    AddRole = Role#role{assets =
                            Assets#assets{love = Val + AddVal}},
    VarRole = var:add_var(AddRole, week, 208, AddVal),
    VarRole2 = var:add_var(VarRole, acc, 1009, AddVal),
    Evts = merge_evts([#evt_wedding_score{}],
                      get(role_gain_evts)),
    put(role_gain_evts, Evts),
    NewRole = VarRole2,
    add_log_item(gain, {90018, AddVal}),
    NewPushAssets = [rest | PushAssets],
    NewArgs = Args#role_gain_gl_args{push_assets =
                                         NewPushAssets},
    {ok, NewRole, NewArgs};
gl(L = #loss{label = love, val = LossVal},
   Args = #role_gain_gl_args{push_assets = PushAssets},
   Role = #role{assets = Assets = #assets{love = Val}})
    when Val >= 0 ->
    case LossVal =< Val of
        true ->
            NewRole = Role#role{assets =
                                    Assets#assets{love = Val - LossVal}},
            add_log_item(loss, {90018, LossVal}),
            NewPushAssets = [rest | PushAssets],
            NewArgs = Args#role_gain_gl_args{push_assets =
                                                 NewPushAssets},
            {ok, NewRole, NewArgs};
        false -> {false, L}
    end;
gl(#gain{label = egg, val = AddVal},
   Args = #role_gain_gl_args{push_assets = PushAssets},
   Role = #role{assets = Assets = #assets{egg = Val}}) ->
    AddRole = Role#role{assets =
                            Assets#assets{egg = Val + AddVal}},
    NewRole = AddRole,
    add_log_item(gain, {90038, AddVal}),
    NewPushAssets = [rest | PushAssets],
    NewArgs = Args#role_gain_gl_args{push_assets =
                                         NewPushAssets},
    {ok, NewRole, NewArgs};
gl(L = #loss{label = egg, val = LossVal},
   Args = #role_gain_gl_args{push_assets = PushAssets},
   Role = #role{assets = Assets = #assets{egg = Val}})
    when Val >= 0 ->
    case LossVal =< Val of
        true ->
            NewRole = Role#role{assets =
                                    Assets#assets{egg = Val - LossVal}},
            add_log_item(loss, {90038, LossVal}),
            NewPushAssets = [rest | PushAssets],
            NewArgs = Args#role_gain_gl_args{push_assets =
                                                 NewPushAssets},
            {ok, NewRole, NewArgs};
        false -> {false, L}
    end;
gl(#gain{label = turn, val = AddVal},
   Args = #role_gain_gl_args{push_assets = PushAssets},
   Role = #role{assets = Assets = #assets{turn = Val}}) ->
    AddRole = Role#role{assets =
                            Assets#assets{turn = Val + AddVal}},
    NewRole = AddRole,
    add_log_item(gain, {90040, AddVal}),
    NewPushAssets = [rest | PushAssets],
    NewArgs = Args#role_gain_gl_args{push_assets =
                                         NewPushAssets},
    {ok, NewRole, NewArgs};
gl(L = #loss{label = turn, val = LossVal},
   Args = #role_gain_gl_args{push_assets = PushAssets},
   Role = #role{assets = Assets = #assets{turn = Val}})
    when Val >= 0 ->
    case LossVal =< Val of
        true ->
            NewRole = Role#role{assets =
                                    Assets#assets{turn = Val - LossVal}},
            add_log_item(loss, {90040, LossVal}),
            NewPushAssets = [rest | PushAssets],
            NewArgs = Args#role_gain_gl_args{push_assets =
                                                 NewPushAssets},
            {ok, NewRole, NewArgs};
        false -> {false, L}
    end;
gl(#gain{label = exchange, val = AddVal},
   Args = #role_gain_gl_args{push_assets = PushAssets},
   Role = #role{assets =
                    Assets = #assets{exchange = Val}}) ->
    AddRole = Role#role{assets =
                            Assets#assets{exchange = Val + AddVal}},
    NewRole = AddRole,
    add_log_item(gain, {90039, AddVal}),
    NewPushAssets = [rest | PushAssets],
    NewArgs = Args#role_gain_gl_args{push_assets =
                                         NewPushAssets},
    {ok, NewRole, NewArgs};
gl(L = #loss{label = exchange, val = LossVal},
   Args = #role_gain_gl_args{push_assets = PushAssets},
   Role = #role{assets = Assets = #assets{exchange = Val}})
    when Val >= 0 ->
    case LossVal =< Val of
        true ->
            NewRole = Role#role{assets =
                                    Assets#assets{exchange = Val - LossVal}},
            add_log_item(loss, {90039, LossVal}),
            NewPushAssets = [rest | PushAssets],
            NewArgs = Args#role_gain_gl_args{push_assets =
                                                 NewPushAssets},
            {ok, NewRole, NewArgs};
        false -> {false, L}
    end;
gl(#gain{label = brother, val = AddVal},
   Args = #role_gain_gl_args{push_assets = PushAssets},
   Role = #role{assets =
                    Assets = #assets{brother = Val}}) ->
    AddRole = Role#role{assets =
                            Assets#assets{brother = Val + AddVal}},
    NewRole = AddRole,
    add_log_item(gain, {90036, AddVal}),
    NewPushAssets = [rest | PushAssets],
    NewArgs = Args#role_gain_gl_args{push_assets =
                                         NewPushAssets},
    {ok, NewRole, NewArgs};
gl(L = #loss{label = brother, val = LossVal},
   Args = #role_gain_gl_args{push_assets = PushAssets},
   Role = #role{assets = Assets = #assets{brother = Val}})
    when Val >= 0 ->
    case LossVal =< Val of
        true ->
            NewRole = Role#role{assets =
                                    Assets#assets{brother = Val - LossVal}},
            add_log_item(loss, {90036, LossVal}),
            NewPushAssets = [rest | PushAssets],
            NewArgs = Args#role_gain_gl_args{push_assets =
                                                 NewPushAssets},
            {ok, NewRole, NewArgs};
        false -> {false, L}
    end;
gl(#gain{label = teacher_score, val = AddVal},
   Args = #role_gain_gl_args{push_assets = PushAssets},
   Role = #role{id = TRoleId,
                assets = Assets = #assets{teacher_score = Val}}) ->
    AddRole = Role#role{assets =
                            Assets#assets{teacher_score = Val + AddVal}},
    NewRole = AddRole,
    add_log_item(gain, {90019, AddVal}),
    NewPushAssets = [rest | PushAssets],
    NewArgs = Args#role_gain_gl_args{push_assets =
                                         NewPushAssets},
    teacher_mgr:cast({update_teacher,
                      TRoleId,
                      add_score,
                      [{#teacher.teacher_score, AddVal}]}),
    {ok, NewRole, NewArgs};
gl(L = #loss{label = teacher_score, val = LossVal},
   Args = #role_gain_gl_args{push_assets = PushAssets},
   Role = #role{assets =
                    Assets = #assets{teacher_score = Val}})
    when Val >= 0 ->
    case LossVal =< Val of
        true ->
            NewRole = Role#role{assets =
                                    Assets#assets{teacher_score =
                                                      Val - LossVal}},
            add_log_item(loss, {90019, LossVal}),
            NewPushAssets = [rest | PushAssets],
            NewArgs = Args#role_gain_gl_args{push_assets =
                                                 NewPushAssets},
            {ok, NewRole, NewArgs};
        false -> {false, L}
    end;
gl(#gain{label = tournament, val = AddVal},
   Args = #role_gain_gl_args{push_assets = PushAssets},
   Role = #role{assets =
                    Assets = #assets{tournament = Val}}) ->
    AddRole = Role#role{assets =
                            Assets#assets{tournament = Val + AddVal}},
    NewRole = AddRole,
    add_log_item(gain, {90020, AddVal}),
    NewPushAssets = [rest | PushAssets],
    NewArgs = Args#role_gain_gl_args{push_assets =
                                         NewPushAssets},
    {ok, NewRole, NewArgs};
gl(L = #loss{label = tournament, val = LossVal},
   Args = #role_gain_gl_args{push_assets = PushAssets},
   Role = #role{assets =
                    Assets = #assets{tournament = Val}})
    when Val >= 0 ->
    case LossVal =< Val of
        true ->
            NewRole = Role#role{assets =
                                    Assets#assets{tournament = Val - LossVal}},
            add_log_item(loss, {90020, LossVal}),
            NewPushAssets = [rest | PushAssets],
            NewArgs = Args#role_gain_gl_args{push_assets =
                                                 NewPushAssets},
            {ok, NewRole, NewArgs};
        false -> {false, L}
    end;
gl(#gain{label = lottery_luck, val = AddVal},
   Args = #role_gain_gl_args{push_assets = PushAssets},
   Role = #role{assets =
                    Assets = #assets{lottery_luck = Val}}) ->
    AddRole = Role#role{assets =
                            Assets#assets{lottery_luck = Val + AddVal}},
    NewRole = AddRole,
    add_log_item(gain, {90022, AddVal}),
    NewPushAssets = [rest | PushAssets],
    NewArgs = Args#role_gain_gl_args{push_assets =
                                         NewPushAssets},
    {ok, NewRole, NewArgs};
gl(L = #loss{label = lottery_luck, val = LossVal},
   Args = #role_gain_gl_args{push_assets = PushAssets},
   Role = #role{assets =
                    Assets = #assets{lottery_luck = Val}})
    when Val >= 0 ->
    case LossVal =< Val of
        true ->
            NewRole = Role#role{assets =
                                    Assets#assets{lottery_luck =
                                                      Val - LossVal}},
            add_log_item(loss, {90022, LossVal}),
            NewPushAssets = [rest | PushAssets],
            NewArgs = Args#role_gain_gl_args{push_assets =
                                                 NewPushAssets},
            {ok, NewRole, NewArgs};
        false -> {false, L}
    end;
gl(#gain{label = new_year, val = AddVal},
   Args = #role_gain_gl_args{push_assets = PushAssets},
   Role = #role{assets =
                    Assets = #assets{new_year = Val}}) ->
    AddRole = Role#role{assets =
                            Assets#assets{new_year = Val + AddVal}},
    NewRole = AddRole,
    add_log_item(gain, {90029, AddVal}),
    NewPushAssets = [rest | PushAssets],
    NewArgs = Args#role_gain_gl_args{push_assets =
                                         NewPushAssets},
    {ok, NewRole, NewArgs};
gl(L = #loss{label = new_year, val = LossVal},
   Args = #role_gain_gl_args{push_assets = PushAssets},
   Role = #role{assets = Assets = #assets{new_year = Val}})
    when Val >= 0 ->
    case LossVal =< Val of
        true ->
            NewRole = Role#role{assets =
                                    Assets#assets{new_year = Val - LossVal}},
            add_log_item(loss, {90029, LossVal}),
            NewPushAssets = [rest | PushAssets],
            NewArgs = Args#role_gain_gl_args{push_assets =
                                                 NewPushAssets},
            {ok, NewRole, NewArgs};
        false -> {false, L}
    end;
gl(#gain{label = firecracker, val = AddVal},
   Args = #role_gain_gl_args{push_assets = PushAssets},
   Role = #role{assets =
                    Assets = #assets{firecracker = Val}}) ->
    AddRole = Role#role{assets =
                            Assets#assets{firecracker = Val + AddVal}},
    NewRole = AddRole,
    add_log_item(gain, {90033, AddVal}),
    NewPushAssets = [rest | PushAssets],
    NewArgs = Args#role_gain_gl_args{push_assets =
                                         NewPushAssets},
    {ok, NewRole, NewArgs};
gl(L = #loss{label = firecracker, val = LossVal},
   Args = #role_gain_gl_args{push_assets = PushAssets},
   Role = #role{assets =
                    Assets = #assets{firecracker = Val}})
    when Val >= 0 ->
    case LossVal =< Val of
        true ->
            NewRole = Role#role{assets =
                                    Assets#assets{firecracker = Val - LossVal}},
            add_log_item(loss, {90033, LossVal}),
            NewPushAssets = [rest | PushAssets],
            NewArgs = Args#role_gain_gl_args{push_assets =
                                                 NewPushAssets},
            {ok, NewRole, NewArgs};
        false -> {false, L}
    end;
gl(#gain{label = glue_pudding, val = AddVal},
   Args = #role_gain_gl_args{push_assets = PushAssets},
   Role = #role{assets =
                    Assets = #assets{glue_pudding = Val}}) ->
    AddRole = Role#role{assets =
                            Assets#assets{glue_pudding = Val + AddVal}},
    NewRole = AddRole,
    add_log_item(gain, {90034, AddVal}),
    NewPushAssets = [rest | PushAssets],
    NewArgs = Args#role_gain_gl_args{push_assets =
                                         NewPushAssets},
    {ok, NewRole, NewArgs};
gl(L = #loss{label = glue_pudding, val = LossVal},
   Args = #role_gain_gl_args{push_assets = PushAssets},
   Role = #role{assets =
                    Assets = #assets{glue_pudding = Val}})
    when Val >= 0 ->
    case LossVal =< Val of
        true ->
            NewRole = Role#role{assets =
                                    Assets#assets{glue_pudding =
                                                      Val - LossVal}},
            add_log_item(loss, {90034, LossVal}),
            NewPushAssets = [rest | PushAssets],
            NewArgs = Args#role_gain_gl_args{push_assets =
                                                 NewPushAssets},
            {ok, NewRole, NewArgs};
        false -> {false, L}
    end;
gl(#gain{label = father, val = AddVal},
   Args = #role_gain_gl_args{push_assets = PushAssets},
   Role = #role{assets =
                    Assets = #assets{father = Val}}) ->
    AddRole = Role#role{assets =
                            Assets#assets{father = Val + AddVal}},
    NewRole = AddRole,
    add_log_item(gain, {90041, AddVal}),
    NewPushAssets = [rest | PushAssets],
    NewArgs = Args#role_gain_gl_args{push_assets =
                                         NewPushAssets},
    {ok, NewRole, NewArgs};
gl(L = #loss{label = father, val = LossVal},
   Args = #role_gain_gl_args{push_assets = PushAssets},
   Role = #role{assets = Assets = #assets{father = Val}})
    when Val >= 0 ->
    case LossVal =< Val of
        true ->
            NewRole = Role#role{assets =
                                    Assets#assets{father = Val - LossVal}},
            add_log_item(loss, {90041, LossVal}),
            NewPushAssets = [rest | PushAssets],
            NewArgs = Args#role_gain_gl_args{push_assets =
                                                 NewPushAssets},
            {ok, NewRole, NewArgs};
        false -> {false, L}
    end;
gl(#gain{label = crystal, val = AddVal},
   Args = #role_gain_gl_args{push_assets = PushAssets},
   Role = #role{assets =
                    Assets = #assets{crystal = Val}}) ->
    AddRole = Role#role{assets =
                            Assets#assets{crystal = Val + AddVal}},
    NewRole = AddRole,
    add_log_item(gain, {90035, AddVal}),
    NewPushAssets = [rest | PushAssets],
    NewArgs = Args#role_gain_gl_args{push_assets =
                                         NewPushAssets},
    {ok, NewRole, NewArgs};
gl(L = #loss{label = crystal, val = LossVal},
   Args = #role_gain_gl_args{push_assets = PushAssets},
   Role = #role{assets = Assets = #assets{crystal = Val}})
    when Val >= 0 ->
    case LossVal =< Val of
        true ->
            NewRole = Role#role{assets =
                                    Assets#assets{crystal = Val - LossVal}},
            add_log_item(loss, {90035, LossVal}),
            NewPushAssets = [rest | PushAssets],
            NewArgs = Args#role_gain_gl_args{push_assets =
                                                 NewPushAssets},
            {ok, NewRole, NewArgs};
        false -> {false, L}
    end;
gl(#gain{label = ticket, val = AddVal},
   Args = #role_gain_gl_args{push_assets = PushAssets},
   Role = #role{assets =
                    Assets = #assets{ticket = Val}}) ->
    AddRole = Role#role{assets =
                            Assets#assets{ticket = Val + AddVal}},
    NewRole = AddRole,
    add_log_item(gain, {90037, AddVal}),
    NewPushAssets = [rest | PushAssets],
    NewArgs = Args#role_gain_gl_args{push_assets =
                                         NewPushAssets},
    {ok, NewRole, NewArgs};
gl(L = #loss{label = ticket, val = LossVal},
   Args = #role_gain_gl_args{push_assets = PushAssets},
   Role = #role{assets = Assets = #assets{ticket = Val}})
    when Val >= 0 ->
    case LossVal =< Val of
        true ->
            NewRole = Role#role{assets =
                                    Assets#assets{ticket = Val - LossVal}},
            add_log_item(loss, {90037, LossVal}),
            NewPushAssets = [rest | PushAssets],
            NewArgs = Args#role_gain_gl_args{push_assets =
                                                 NewPushAssets},
            {ok, NewRole, NewArgs};
        false -> {false, L}
    end;
gl(G = #gain{label = fertility, val = AddVal}, Args,
   Role) ->
    case child:fertilize(Role, AddVal) of
        {ok, _, NewRole} ->
            add_log_item(gain, {90030, AddVal}),
            {ok, NewRole, Args};
        {false, Why} -> {false, G#gain{msg = Why}}
    end;
gl(G = #gain{label = tonic, val = AddVal}, Args,
   Role) ->
    case child:intake_tonic(Role, AddVal) of
        {ok, NewRole} ->
            add_log_item(gain, {90031, AddVal}),
            {ok, NewRole, Args};
        {false, Why} -> {false, G#gain{msg = Why}}
    end;
gl(#gain{label = pregnancy, val = AddVal}, Args,
   Role) ->
    case child:fetus_grow(Role, AddVal) of
        {ok, NewRole} ->
            add_log_item(gain, {90032, AddVal}),
            {ok, NewRole, Args};
        _ -> {ok, Role, Args}
    end;
gl(#gain{label = handbook_point, val = AddVal},
   Args = #role_gain_gl_args{push_assets = PushAssets},
   Role = #role{assets =
                    Assets = #assets{handbook_point = Val}}) ->
    AddRole = Role#role{assets =
                            Assets#assets{handbook_point = Val + AddVal}},
    NewRole = AddRole,
    add_log_item(gain, {90024, AddVal}),
    NewPushAssets = [rest | PushAssets],
    NewArgs = Args#role_gain_gl_args{push_assets =
                                         NewPushAssets},
    {ok, NewRole, NewArgs};
gl(L = #loss{label = handbook_point, val = LossVal},
   Args = #role_gain_gl_args{push_assets = PushAssets},
   Role = #role{assets =
                    Assets = #assets{handbook_point = Val}})
    when Val >= 0 ->
    case LossVal =< Val of
        true ->
            NewRole = Role#role{assets =
                                    Assets#assets{handbook_point =
                                                      Val - LossVal}},
            add_log_item(loss, {90024, LossVal}),
            NewPushAssets = [rest | PushAssets],
            NewArgs = Args#role_gain_gl_args{push_assets =
                                                 NewPushAssets},
            {ok, NewRole, NewArgs};
        false -> {false, L}
    end;
gl(#gain{label = star_gold, val = AddVal},
   Args = #role_gain_gl_args{push_assets = PushAssets},
   Role = #role{assets =
                    Assets = #assets{star_gold = Val}}) ->
    AddRole = Role#role{assets =
                            Assets#assets{star_gold = Val + AddVal}},
    NewRole = AddRole,
    add_log_item(gain, {90026, AddVal}),
    NewPushAssets = [rest | PushAssets],
    NewArgs = Args#role_gain_gl_args{push_assets =
                                         NewPushAssets},
    {ok, NewRole, NewArgs};
gl(L = #loss{label = star_gold, val = LossVal},
   Args = #role_gain_gl_args{push_assets = PushAssets},
   Role = #role{assets =
                    Assets = #assets{star_gold = Val}})
    when Val >= 0 ->
    case LossVal =< Val of
        true ->
            NewRole = Role#role{assets =
                                    Assets#assets{star_gold = Val - LossVal}},
            add_log_item(loss, {90026, LossVal}),
            NewPushAssets = [rest | PushAssets],
            NewArgs = Args#role_gain_gl_args{push_assets =
                                                 NewPushAssets},
            {ok, NewRole, NewArgs};
        false -> {false, L}
    end;
gl(L = #loss{label = star_gold_or_gold, val = Val,
             reason = R},
   Args = #role_gain_gl_args{push_assets = PushAssets},
   Role = #role{assets =
                    Assets = #assets{star_gold = StarGold, gold = Gold}})
    when Val >= 0 ->
    case StarGold + Gold < Val of
        true -> {false, L};
        false when StarGold >= Val ->
            NewRole = Role#role{assets =
                                    Assets#assets{star_gold =
                                                      round(StarGold - Val)}},
            NewPushAssets = [rest | PushAssets],
            add_log_item(loss, {90026, Val}),
            NewArgs = Args#role_gain_gl_args{push_assets =
                                                 NewPushAssets},
            {ok,
             NewRole,
             [#loss{label = star_gold, val = Val},
              #loss{label = gold, val = 0}],
             NewArgs};
        false ->
            NewRole = Role#role{assets =
                                    Assets#assets{gold =
                                                      round(Gold -
                                                                (Val -
                                                                     StarGold)),
                                                  star_gold = 0}},
            GL = [#loss{label = star_gold, val = StarGold},
                  #loss{label = gold, val = Val - StarGold}],
            Evts = merge_evts(#evt_loss_gold{val = Val, reason = R},
                              get(role_gain_evts)),
            put(role_gain_evts, Evts),
            NewPushAssets = case StarGold > 0 of
                                true ->
                                    add_log_item(loss, {90026, StarGold}),
                                    [assets, rest | PushAssets];
                                _ -> [assets | PushAssets]
                            end,
            add_log_item(loss, {90002, Val - StarGold}),
            NewArgs = Args#role_gain_gl_args{push_assets =
                                                 NewPushAssets},
            {ok, NewRole, GL, NewArgs}
    end;
gl(#gain{label = halloween, val = AddVal},
   Args = #role_gain_gl_args{push_assets = PushAssets},
   Role = #role{assets =
                    Assets = #assets{halloween = Val}}) ->
    AddRole = Role#role{assets =
                            Assets#assets{halloween = Val + AddVal}},
    NewRole = AddRole,
    add_log_item(gain, {90027, AddVal}),
    NewPushAssets = [rest | PushAssets],
    NewArgs = Args#role_gain_gl_args{push_assets =
                                         NewPushAssets},
    {ok, NewRole, NewArgs};
gl(L = #loss{label = halloween, val = LossVal},
   Args = #role_gain_gl_args{push_assets = PushAssets},
   Role = #role{assets =
                    Assets = #assets{halloween = Val}})
    when Val >= 0 ->
    case LossVal =< Val of
        true ->
            NewRole = Role#role{assets =
                                    Assets#assets{halloween = Val - LossVal}},
            add_log_item(loss, {90027, LossVal}),
            NewPushAssets = [rest | PushAssets],
            NewArgs = Args#role_gain_gl_args{push_assets =
                                                 NewPushAssets},
            {ok, NewRole, NewArgs};
        false -> {false, L}
    end;
gl(#gain{label = thanksgiving, val = AddVal},
   Args = #role_gain_gl_args{push_assets = PushAssets},
   Role = #role{assets =
                    Assets = #assets{thanksgiving = Val}}) ->
    AddRole = Role#role{assets =
                            Assets#assets{thanksgiving = Val + AddVal}},
    NewRole = AddRole,
    add_log_item(gain, {90027, AddVal}),
    NewPushAssets = [rest | PushAssets],
    NewArgs = Args#role_gain_gl_args{push_assets =
                                         NewPushAssets},
    {ok, NewRole, NewArgs};
gl(L = #loss{label = thanksgiving, val = LossVal},
   Args = #role_gain_gl_args{push_assets = PushAssets},
   Role = #role{assets =
                    Assets = #assets{thanksgiving = Val}})
    when Val >= 0 ->
    case LossVal =< Val of
        true ->
            NewRole = Role#role{assets =
                                    Assets#assets{thanksgiving =
                                                      Val - LossVal}},
            add_log_item(loss, {90027, LossVal}),
            NewPushAssets = [rest | PushAssets],
            NewArgs = Args#role_gain_gl_args{push_assets =
                                                 NewPushAssets},
            {ok, NewRole, NewArgs};
        false -> {false, L}
    end;
gl(#gain{label = panda_score, val = AddVal},
   Args = #role_gain_gl_args{push_assets = PushAssets},
   Role = #role{assets =
                    Assets = #assets{panda_score = Val}}) ->
    AddRole = Role#role{assets =
                            Assets#assets{panda_score = Val + AddVal}},
    NewRole = AddRole,
    add_log_item(gain, {90051, AddVal}),
    NewPushAssets = [rest | PushAssets],
    NewArgs = Args#role_gain_gl_args{push_assets =
                                         NewPushAssets},
    {ok, NewRole, NewArgs};
gl(L = #loss{label = panda_score, val = LossVal},
   Args = #role_gain_gl_args{push_assets = PushAssets},
   Role = #role{assets =
                    Assets = #assets{panda_score = Val}})
    when Val >= 0 ->
    case LossVal =< Val of
        true ->
            NewRole = Role#role{assets =
                                    Assets#assets{panda_score = Val - LossVal}},
            add_log_item(loss, {90051, LossVal}),
            NewPushAssets = [rest | PushAssets],
            NewArgs = Args#role_gain_gl_args{push_assets =
                                                 NewPushAssets},
            {ok, NewRole, NewArgs};
        false -> {false, L}
    end;
gl(G = #gain{label = item_base_id, val = ItemInfo},
   Args = #role_gain_gl_args{refresh_items = RefreshItems},
   Role = #role{name = Name})
    when is_list(ItemInfo) ->
    case package:add(by_base_id,
                     bag,
                     Role,
                     ItemInfo,
                     no_push)
        of
        false ->
            logger:error("[~ts]获得物品时发生错误，无法生成物品列表:~w",
                         [Name, ItemInfo],
                         role_gain,
                         2112),
            {false,
             G#gain{reason = error_item,
                    msg = lang:get("错误的道具,无法增加")}};
        full ->
            {false,
             G#gain{reason = bag_full,
                    msg = lang:get("背包已满，请先整理背包")}};
        {ok, NewPackage, AddItems} ->
            NRole = Role#role{p_bag = NewPackage},
            put(role_gain_items, AddItems ++ get(role_gain_items)),
            EvtItems = to_gain_evt(AddItems, []),
            Evts = merge_evts(EvtItems, get(role_gain_evts)),
            put(role_gain_evts, Evts),
            add_log_item(gain, ItemInfo),
            Refresh = {1, AddItems, [], []},
            NewRefreshItems = [Refresh | RefreshItems],
            NewArgs = Args#role_gain_gl_args{refresh_items =
                                                 NewRefreshItems},
            {ok, NRole, NewArgs}
    end;
gl(G = #gain{label = items, val = Items},
   Args = #role_gain_gl_args{refresh_items = RefreshItems},
   Role)
    when is_list(Items) ->
    case package:add(by_items, bag, Role, Items, no_push) of
        false ->
            logger:error("产生物品时发生错误，无法生成物品列表:~w",
                         [Items],
                         role_gain,
                         2134),
            {false, G#gain{reason = error_item}};
        full ->
            {false,
             G#gain{reason = bag_full,
                    msg = lang:get("背包已满，增加物品失败")}};
        {ok, NewPackage, AddItems} ->
            put(role_gain_items, AddItems ++ get(role_gain_items)),
            EvtItems = to_gain_evt(AddItems, []),
            Evts = merge_evts(EvtItems, get(role_gain_evts)),
            put(role_gain_evts, Evts),
            add_log_item(gain, Items),
            NRole = Role#role{p_bag = NewPackage},
            Refresh = {1, AddItems, [], []},
            NewRefreshItems = [Refresh | RefreshItems],
            NewArgs = Args#role_gain_gl_args{refresh_items =
                                                 NewRefreshItems},
            {ok, NRole, NewArgs}
    end;
gl(G = #gain{label = random_item, val = Items},
   Args = #role_gain_gl_args{refresh_items = RefreshItems},
   Role)
    when is_list(Items) ->
    case util:rand_list(Items, 3) of
        {BaseId, Num, _Rand} ->
            case package:add(by_base_id,
                             bag,
                             Role,
                             [{BaseId, 1, Num}],
                             no_push)
                of
                false ->
                    logger:error("产生物品时发生错误，无法生成物品列表:~w",
                                 [BaseId],
                                 role_gain,
                                 2158),
                    {false, G#gain{reason = error_item}};
                full ->
                    {false,
                     G#gain{reason = bag_full,
                            msg = lang:get("背包已满，增加物品失败")}};
                {ok, NewPackage, AddItems} ->
                    put(role_gain_items, AddItems ++ get(role_gain_items)),
                    EvtItems = to_gain_evt(AddItems, []),
                    Evts = merge_evts(EvtItems, get(role_gain_evts)),
                    put(role_gain_evts, Evts),
                    add_log_item(gain, [{BaseId, 1, Num}]),
                    NRole = Role#role{p_bag = NewPackage},
                    Refresh = {1, AddItems, [], []},
                    NewRefreshItems = [Refresh | RefreshItems],
                    NewArgs = Args#role_gain_gl_args{refresh_items =
                                                         NewRefreshItems},
                    {ok, NRole, NewArgs}
            end;
        _ -> {ok, Role}
    end;
gl(G = #gain{label = classes_item, val = ItemsL},
   Args = #role_gain_gl_args{refresh_items = RefreshItems},
   Role = #role{classes = Classes})
    when is_list(ItemsL) ->
    Items = [{BaseId, Bind, Num}
             || {Classes1, BaseId, Bind, Num} <- ItemsL,
                Classes =:= Classes1],
    case package:add(by_base_id, bag, Role, Items, no_push)
        of
        false ->
            logger:error("产生物品时发生错误，无法生成物品列表:~w",
                         [Items],
                         role_gain,
                         2187),
            {false, G};
        full -> {false, G#gain{msg = lang:get("背包已满，增加物品失败")}};
        {ok, NewPackage, AddItems} ->
            NRole = Role#role{p_bag = NewPackage},
            put(role_gain_items, AddItems ++ get(role_gain_items)),
            EvtItems = to_gain_evt(AddItems, []),
            Evts = merge_evts(EvtItems, get(role_gain_evts)),
            put(role_gain_evts, Evts),
            add_log_item(gain, Items),
            Refresh = {1, AddItems, [], []},
            NewRefreshItems = [Refresh | RefreshItems],
            NewArgs = Args#role_gain_gl_args{refresh_items =
                                                 NewRefreshItems},
            {ok, NRole, NewArgs}
    end;
gl(G = #gain{label = classes_sex_item, val = ItemsL},
   Args = #role_gain_gl_args{refresh_items = RefreshItems},
   Role = #role{classes = Classes, sex = Sex})
    when is_list(ItemsL) ->
    Items = [{BaseId, Bind, Num}
             || {Classes1, Sex1, BaseId, Bind, Num} <- ItemsL,
                Classes =:= Classes1, Sex =:= Sex1],
    case package:add(by_base_id, bag, Role, Items, no_push)
        of
        false ->
            logger:error("产生物品时发生错误，无法生成物品列表:~w",
                         [Items],
                         role_gain,
                         2213),
            {false, G};
        full -> {false, G#gain{msg = lang:get("背包已满，增加物品失败")}};
        {ok, NewPackage, AddItems} ->
            NRole = Role#role{p_bag = NewPackage},
            put(role_gain_items, AddItems ++ get(role_gain_items)),
            EvtItems = to_gain_evt(AddItems, []),
            Evts = merge_evts(EvtItems, get(role_gain_evts)),
            put(role_gain_evts, Evts),
            add_log_item(gain, Items),
            Refresh = {1, AddItems, [], []},
            NewRefreshItems = [Refresh | RefreshItems],
            NewArgs = Args#role_gain_gl_args{refresh_items =
                                                 NewRefreshItems},
            {ok, NRole, NewArgs}
    end;
gl(#gain{label = pet_custom,
         val = {PetId, Lev, Aptitude, Growth, Skills}},
   _GainArgs, Role = #role{}) ->
    NewSkills = tuple_to_list(Skills),
    GrowthList = [2, 3, 4, 5],
    Args = #{base_id => PetId, lev => Lev,
             aptitude => Aptitude, skills => NewSkills,
             from => "任务获得"},
    Args1 = case lists:member(Growth, GrowthList) of
                true -> Args#{growth_type => Growth};
                false -> Args
            end,
    case pet:create(Role, Args1) of
        {ok, NewRole} -> {ok, NewRole};
        {false, Reason} -> {false, Reason}
    end;
gl(#gain{label = pet, val = PetId}, _Args,
   Role = #role{}) ->
    case pet:create(Role, #{base_id => PetId}) of
        {ok, NewRole} -> {ok, NewRole};
        {false, Reason} -> {false, Reason}
    end;
gl(#loss{label = pet, val = BaseId}, _Args,
   Role = #role{}) ->
    case pet:del_pet(by_base_id, BaseId, Role) of
        {ok, NewRole} -> {ok, NewRole};
        {false, Reason} -> {false, Reason}
    end;
gl(L = #loss{label = item_id, val = ItemInfo},
   Args = #role_gain_gl_args{refresh_items = RefreshItems},
   Role)
    when is_list(ItemInfo) ->
    NewItemInfo = package:merge(ItemInfo),
    case package:del(by_id, Role#role.p_bag, NewItemInfo) of
        {false, Reason} -> {false, L#loss{msg = Reason}};
        {ok, NewPackage, DelList, FreshList} ->
            LossItems = DelList ++ FreshList,
            LogItems = merge_items(loss_items(NewItemInfo,
                                              LossItems,
                                              []),
                                   get(role_loss_items)),
            put(role_loss_items, LogItems),
            EvtItems = to_loss_evt(LossItems, []),
            Evts = merge_evts(EvtItems, get(role_gain_evts)),
            put(role_gain_evts, Evts),
            add_log_item(loss, LossItems),
            NewRole = Role#role{p_bag = NewPackage},
            Refresh = {1, [], DelList, FreshList},
            NewRefreshItems = [Refresh | RefreshItems],
            NewArgs = Args#role_gain_gl_args{refresh_items =
                                                 NewRefreshItems},
            {ok, NewRole, NewArgs}
    end;
gl(L = #loss{label = item_id_store, val = ItemInfo},
   Args = #role_gain_gl_args{refresh_items = RefreshItems},
   Role)
    when is_list(ItemInfo) ->
    NewItemInfo = package:merge(ItemInfo),
    case package:del(by_id, Role#role.p_store, NewItemInfo)
        of
        {false, Reason} -> {false, L#loss{msg = Reason}};
        {ok, NewPackage, DelList, FreshList} ->
            LossItems = DelList ++ FreshList,
            LogItems = merge_items(loss_items(NewItemInfo,
                                              LossItems,
                                              []),
                                   get(role_loss_items)),
            put(role_loss_items, LogItems),
            EvtItems = to_loss_evt(LossItems, []),
            Evts = merge_evts(EvtItems, get(role_gain_evts)),
            put(role_gain_evts, Evts),
            add_log_item(loss, LossItems),
            NewRole = Role#role{p_store = NewPackage},
            Refresh = {2, [], DelList, FreshList},
            NewRefreshItems = [Refresh | RefreshItems],
            NewArgs = Args#role_gain_gl_args{refresh_items =
                                                 NewRefreshItems},
            {ok, NewRole, NewArgs}
    end;
gl(L = #loss{label = item_base_id, val = ItemInfo,
             msg = Msg},
   Args = #role_gain_gl_args{refresh_items = RefreshItems},
   Role)
    when is_list(ItemInfo) ->
    NewItemInfo = package:merge(ItemInfo),
    case package:del(by_base_id,
                     Role#role.p_bag,
                     NewItemInfo)
        of
        {false, _Reason} when Msg =/= "" -> {false, L};
        {false, Reason} -> {false, L#loss{msg = Reason}};
        {ok, NewPackage, DelList, FreshList} ->
            NewRole = Role#role{p_bag = NewPackage},
            LogItems = merge_items(NewItemInfo,
                                   get(role_loss_items)),
            put(role_loss_items, LogItems),
            LossItems = DelList ++ FreshList,
            EvtItems = to_loss_evt(LossItems, []),
            Evts = merge_evts(EvtItems, get(role_gain_evts)),
            put(role_gain_evts, Evts),
            add_log_item(loss, NewItemInfo),
            Refresh = {1, [], DelList, FreshList},
            NewRefreshItems = [Refresh | RefreshItems],
            NewArgs = Args#role_gain_gl_args{refresh_items =
                                                 NewRefreshItems},
            {ok, NewRole, NewArgs}
    end;
gl(L = #loss{label = item_base_id_auto_buy,
             val = ItemInfo, auto_scene = AutoScene},
   Args, Role)
    when is_list(ItemInfo) ->
    MergeItemInfo = package:merge(ItemInfo),
    case item_base_id_auto_buy(MergeItemInfo,
                               L,
                               Role,
                               [],
                               [])
        of
        {[], []} -> {ok, Role};
        {[], ItemAcc} ->
            NewL = L#loss{label = item_base_id, val = ItemAcc},
            gl(NewL, Args, Role);
        {AssetsItem, ItemAcc} ->
            case item_base_id_to_assets(AssetsItem,
                                        Role,
                                        [],
                                        [],
                                        [],
                                        [],
                                        [])
                of
                {ok,
                 AssetsLoss,
                 MarketEffect,
                 LogItems,
                 _,
                 Role1,
                 NewLog} ->
                    Loss = case ItemAcc of
                               [] -> AssetsLoss;
                               _ ->
                                   ItemLoss = L#loss{label = item_base_id,
                                                     val = ItemAcc},
                                   [ItemLoss | AssetsLoss]
                           end,
                    case gl_all(Loss, Role1, [], Args) of
                        {ok, NewRole, NewGL, NewArgs} ->
                            market:auto_buy_effect(MarketEffect, Role),
                            {OwnStr, AssetsStr} = merge_assets_item(NewGL,
                                                                    LogItems,
                                                                    [],
                                                                    []),
                            Title = lang:get("快捷购买"),
                            log:auto_buy(NewRole, Title, OwnStr, AssetsStr),
                            logger:debug("~w,~w",
                                         [AssetsLoss, NewLog],
                                         role_gain,
                                         2353),
                            log:make_market_log(NewRole,
                                                AutoScene,
                                                AssetsLoss,
                                                NewLog),
                            market:send_open_srv_notice(AssetsItem, Role),
                            {ok, NewRole, NewGL, NewArgs};
                        False -> False
                    end;
                {false, Msg} when is_list(Msg) ->
                    {false, L#loss{msg = Msg}};
                _False -> {false, L}
            end
    end;
gl(#loss{label = mount_spirit, val = Val}, _Args, Role)
    when is_integer(Val) ->
    case mount:add_mount_spirit(Role, -Val) of
        {ok, MountRole} -> {ok, MountRole};
        _Else -> _Else
    end;
gl(#gain{label = mount_spirit, val = Val}, _Args, Role)
    when is_integer(Val) ->
    case mount:add_mount_spirit(Role, Val) of
        {ok, MountRole} -> {ok, MountRole};
        _Else -> _Else
    end;
gl(#gain{label = endless_challenge, val = AddVal},
   Args = #role_gain_gl_args{push_assets = PushAssets},
   Role = #role{assets =
                    Assets = #assets{endless_challenge = Val}}) ->
    case Val =< 2000 of
        true ->
            NewVal = min(Val + AddVal, 2000),
            AddRole = Role#role{assets =
                                    Assets#assets{endless_challenge = NewVal}},
            NewRole = AddRole,
            add_log_item(gain, {90023, AddVal}),
            NewPushAssets = [rest | PushAssets],
            NewArgs = Args#role_gain_gl_args{push_assets =
                                                 NewPushAssets},
            {ok, NewRole, NewArgs};
        false -> {ok, Role}
    end;
gl(L = #loss{label = endless_challenge, val = LossVal},
   Args = #role_gain_gl_args{push_assets = PushAssets},
   Role = #role{assets =
                    Assets = #assets{endless_challenge = Val}})
    when Val >= 0 ->
    case LossVal =< Val of
        true ->
            NewRole = Role#role{assets =
                                    Assets#assets{endless_challenge =
                                                      Val - LossVal}},
            add_log_item(loss, {90023, LossVal}),
            NewPushAssets = [rest | PushAssets],
            NewArgs = Args#role_gain_gl_args{push_assets =
                                                 NewPushAssets},
            {ok, NewRole, NewArgs};
        false -> {false, L}
    end;
gl(#gain{label = autumn_score, val = AddVal},
   Args = #role_gain_gl_args{push_assets = PushAssets},
   Role = #role{assets =
                    Assets = #assets{autumn_score = Val}}) ->
    NewVal = min(Val + AddVal, 90025),
    AddRole = Role#role{assets =
                            Assets#assets{autumn_score = NewVal}},
    NewRole = AddRole,
    add_log_item(gain, {90025, AddVal}),
    NewPushAssets = [rest | PushAssets],
    NewArgs = Args#role_gain_gl_args{push_assets =
                                         NewPushAssets},
    {ok, NewRole, NewArgs};
gl(L = #loss{label = autumn_score, val = LossVal},
   Args = #role_gain_gl_args{push_assets = PushAssets},
   Role = #role{assets =
                    Assets = #assets{autumn_score = Val}})
    when Val >= 0 ->
    case LossVal =< Val of
        true ->
            NewRole = Role#role{assets =
                                    Assets#assets{autumn_score =
                                                      Val - LossVal}},
            add_log_item(loss, {90025, LossVal}),
            NewPushAssets = [rest | PushAssets],
            NewArgs = Args#role_gain_gl_args{push_assets =
                                                 NewPushAssets},
            {ok, NewRole, NewArgs};
        false -> {false, L}
    end;
gl(L = #gain{label = flower_says,
             val = [{FlowerID, Num}]},
   Args = #role_gain_gl_args{}, Role) ->
    case campaign_collection:add_flower(Role, FlowerID, Num)
        of
        {ok, Role2} ->
            put(role_gain_items,
                [{FlowerID, Num}] ++ get(role_gain_items)),
            {ok, Role2, Args};
        _ -> {false, L}
    end;
gl(L = #loss{label = flower_says,
             val = [{FlowerID, Num}]},
   Args = #role_gain_gl_args{}, Role) ->
    case campaign_collection:reduce_flower(Role,
                                           FlowerID,
                                           Num)
        of
        {ok, Role2} ->
            NewItemInfo = package:merge([{FlowerID, Num}]),
            LogItems = merge_items(NewItemInfo,
                                   get(role_loss_items)),
            put(role_loss_items, LogItems),
            {ok, Role2, Args};
        _ -> {false, L}
    end;
gl(#gain{label = joyful_egg, val = AddVal},
   Args = #role_gain_gl_args{push_assets = PushAssets},
   Role = #role{assets =
                    Assets = #assets{joyful_egg = Val}}) ->
    AddRole = Role#role{assets =
                            Assets#assets{joyful_egg = Val + AddVal}},
    NewRole = AddRole,
    add_log_item(gain, {90052, AddVal}),
    NewPushAssets = [rest | PushAssets],
    NewArgs = Args#role_gain_gl_args{push_assets =
                                         NewPushAssets},
    {ok, NewRole, NewArgs};
gl(L = #loss{label = joyful_egg, val = LossVal},
   Args = #role_gain_gl_args{push_assets = PushAssets},
   Role = #role{assets =
                    Assets = #assets{joyful_egg = Val}})
    when Val >= 0 ->
    case LossVal =< Val of
        true ->
            NewRole = Role#role{assets =
                                    Assets#assets{joyful_egg = Val - LossVal}},
            add_log_item(loss, {90052, LossVal}),
            NewPushAssets = [rest | PushAssets],
            NewArgs = Args#role_gain_gl_args{push_assets =
                                                 NewPushAssets},
            {ok, NewRole, NewArgs};
        false -> {false, L}
    end;
gl(#gain{label = godswar, val = AddVal},
   Args = #role_gain_gl_args{push_assets = PushAssets},
   Role = #role{assets =
                    Assets = #assets{godswar = Val}}) ->
    NewVal = Val + AddVal,
    AddRole = Role#role{assets =
                            Assets#assets{godswar = NewVal}},
    NewRole = AddRole,
    add_log_item(gain, {90056, AddVal}),
    NewPushAssets = [rest | PushAssets],
    NewArgs = Args#role_gain_gl_args{push_assets =
                                         NewPushAssets},
    {ok, NewRole, NewArgs};
gl(L = #loss{label = godswar, val = LossVal},
   Args = #role_gain_gl_args{push_assets = PushAssets},
   Role = #role{assets = Assets = #assets{godswar = Val}})
    when Val >= 0 ->
    case LossVal =< Val of
        true ->
            NewRole = Role#role{assets =
                                    Assets#assets{godswar = Val - LossVal}},
            add_log_item(loss, {90056, LossVal}),
            NewPushAssets = [rest | PushAssets],
            NewArgs = Args#role_gain_gl_args{push_assets =
                                                 NewPushAssets},
            {ok, NewRole, NewArgs};
        false -> {false, L}
    end;
gl(#gain{label = slot_machine, val = AddVal},
   Args = #role_gain_gl_args{push_assets = PushAssets},
   Role = #role{assets =
                    Assets = #assets{slot_machine = Val}}) ->
    NewVal = Val + AddVal,
    AddRole = Role#role{assets =
                            Assets#assets{slot_machine = NewVal}},
    NewRole = AddRole,
    add_log_item(gain, {90061, AddVal}),
    NewPushAssets = [rest | PushAssets],
    NewArgs = Args#role_gain_gl_args{push_assets =
                                         NewPushAssets},
    {ok, NewRole, NewArgs};
gl(L = #loss{label = slot_machine, val = LossVal},
   Args = #role_gain_gl_args{push_assets = PushAssets},
   Role = #role{assets =
                    Assets = #assets{slot_machine = Val}})
    when Val >= 0 ->
    case LossVal =< Val of
        true ->
            NewRole = Role#role{assets =
                                    Assets#assets{slot_machine =
                                                      Val - LossVal}},
            add_log_item(loss, {90061, LossVal}),
            NewPushAssets = [rest | PushAssets],
            NewArgs = Args#role_gain_gl_args{push_assets =
                                                 NewPushAssets},
            {ok, NewRole, NewArgs};
        false -> {false, L}
    end;
gl(#gain{label = zillionaire_sc, val = AddVal},
   Args = #role_gain_gl_args{push_assets = PushAssets},
   Role = #role{assets =
                    Assets = #assets{zillionaire_sc = Val}}) ->
    NewVal = Val + AddVal,
    AddRole = Role#role{assets =
                            Assets#assets{zillionaire_sc = NewVal}},
    NewRole = AddRole,
    add_log_item(gain, {90063, AddVal}),
    NewPushAssets = [rest | PushAssets],
    NewArgs = Args#role_gain_gl_args{push_assets =
                                         NewPushAssets},
    {ok, NewRole, NewArgs};
gl(L = #loss{label = zillionaire_sc, val = LossVal},
   Args = #role_gain_gl_args{push_assets = PushAssets},
   Role = #role{assets =
                    Assets = #assets{zillionaire_sc = Val}})
    when Val >= 0 ->
    case LossVal =< Val of
        true ->
            NewRole = Role#role{assets =
                                    Assets#assets{zillionaire_sc =
                                                      Val - LossVal}},
            add_log_item(loss, {90063, LossVal}),
            NewPushAssets = [rest | PushAssets],
            NewArgs = Args#role_gain_gl_args{push_assets =
                                                 NewPushAssets},
            {ok, NewRole, NewArgs};
        false -> {false, L}
    end;
gl(#gain{label = score_exchange, val = AddVal},
   Args = #role_gain_gl_args{push_assets = PushAssets},
   Role = #role{assets =
                    Assets = #assets{score_exchange = Val}}) ->
    NewVal = Val + AddVal,
    AddRole = Role#role{assets =
                            Assets#assets{score_exchange = NewVal}},
    NewRole = AddRole,
    add_log_item(gain, {90066, AddVal}),
    NewPushAssets = [rest | PushAssets],
    NewArgs = Args#role_gain_gl_args{push_assets =
                                         NewPushAssets},
    {ok, NewRole, NewArgs};
gl(L = #loss{label = score_exchange, val = LossVal},
   Args = #role_gain_gl_args{push_assets = PushAssets},
   Role = #role{assets =
                    Assets = #assets{score_exchange = Val}})
    when Val >= 0 ->
    case LossVal =< Val of
        true ->
            NewRole = Role#role{assets =
                                    Assets#assets{score_exchange =
                                                      Val - LossVal}},
            add_log_item(loss, {90066, LossVal}),
            NewPushAssets = [rest | PushAssets],
            NewArgs = Args#role_gain_gl_args{push_assets =
                                                 NewPushAssets},
            {ok, NewRole, NewArgs};
        false -> {false, L}
    end;
gl(#gain{label = new_open_turn, val = AddVal},
   Args = #role_gain_gl_args{push_assets = PushAssets},
   Role = #role{assets =
                    Assets = #assets{new_open_turn = Val}}) ->
    NewVal = Val + AddVal,
    AddRole = Role#role{assets =
                            Assets#assets{new_open_turn = NewVal}},
    NewRole = AddRole,
    add_log_item(gain, {90067, AddVal}),
    NewPushAssets = [rest | PushAssets],
    NewArgs = Args#role_gain_gl_args{push_assets =
                                         NewPushAssets},
    {ok, NewRole, NewArgs};
gl(L = #loss{label = new_open_turn, val = LossVal},
   Args = #role_gain_gl_args{push_assets = PushAssets},
   Role = #role{assets =
                    Assets = #assets{new_open_turn = Val}})
    when Val >= 0 ->
    case LossVal =< Val of
        true ->
            NewRole = Role#role{assets =
                                    Assets#assets{new_open_turn =
                                                      Val - LossVal}},
            add_log_item(loss, {90067, LossVal}),
            NewPushAssets = [rest | PushAssets],
            NewArgs = Args#role_gain_gl_args{push_assets =
                                                 NewPushAssets},
            {ok, NewRole, NewArgs};
        false -> {false, L}
    end;
gl(#gain{label = long_active, val = AddVal},
   Args = #role_gain_gl_args{push_assets = PushAssets},
   Role = #role{assets =
                    Assets = #assets{long_active = Val}}) ->
    NewVal = Val + AddVal,
    AddRole = Role#role{assets =
                            Assets#assets{long_active = NewVal}},
    NewRole = camp_long_active:update_val(AddRole),
    add_log_item(gain, {90068, AddVal}),
    NewPushAssets = [rest | PushAssets],
    NewArgs = Args#role_gain_gl_args{push_assets =
                                         NewPushAssets},
    {ok, NewRole, NewArgs};
gl(#gain{label = long_score, val = AddVal},
   Args = #role_gain_gl_args{push_assets = PushAssets},
   Role = #role{assets =
                    Assets = #assets{long_score = Val}}) ->
    NewVal = Val + AddVal,
    AddRole = Role#role{assets =
                            Assets#assets{long_score = NewVal}},
    NewRole = AddRole,
    add_log_item(gain, {90069, AddVal}),
    NewPushAssets = [rest | PushAssets],
    NewArgs = Args#role_gain_gl_args{push_assets =
                                         NewPushAssets},
    {ok, NewRole, NewArgs};
gl(L = #loss{label = long_score, val = LossVal},
   Args = #role_gain_gl_args{push_assets = PushAssets},
   Role = #role{assets =
                    Assets = #assets{long_score = Val}})
    when Val >= 0 ->
    case LossVal =< Val of
        true ->
            NewRole = Role#role{assets =
                                    Assets#assets{long_score = Val - LossVal}},
            add_log_item(loss, {90069, LossVal}),
            NewPushAssets = [rest | PushAssets],
            NewArgs = Args#role_gain_gl_args{push_assets =
                                                 NewPushAssets},
            {ok, NewRole, NewArgs};
        false -> {false, L}
    end;
gl(#gain{label = camp_pray_sc, val = AddVal},
   Args = #role_gain_gl_args{push_assets = PushAssets},
   Role = #role{assets =
                    Assets = #assets{camp_pray_sc = Val}}) ->
    NewVal = Val + AddVal,
    AddRole = Role#role{assets =
                            Assets#assets{camp_pray_sc = NewVal}},
    NewRole = AddRole,
    add_log_item(gain, {90071, AddVal}),
    NewPushAssets = [rest | PushAssets],
    NewArgs = Args#role_gain_gl_args{push_assets =
                                         NewPushAssets},
    {ok, NewRole, NewArgs};
gl(L = #loss{label = camp_pray_sc, val = LossVal},
   Args = #role_gain_gl_args{push_assets = PushAssets},
   Role = #role{assets =
                    Assets = #assets{camp_pray_sc = Val}})
    when Val >= 0 ->
    case LossVal =< Val of
        true ->
            NewRole = Role#role{assets =
                                    Assets#assets{camp_pray_sc =
                                                      Val - LossVal}},
            add_log_item(loss, {90071, LossVal}),
            NewPushAssets = [rest | PushAssets],
            NewArgs = Args#role_gain_gl_args{push_assets =
                                                 NewPushAssets},
            {ok, NewRole, NewArgs};
        false -> {false, L}
    end;
gl(#gain{label = reserve_gold, val = AddVal},
   Args = #role_gain_gl_args{push_assets = PushAssets},
   Role = #role{assets =
                    Assets = #assets{reserve_gold = Val}}) ->
    NewVal = Val + AddVal,
    AddRole = Role#role{assets =
                            Assets#assets{reserve_gold = NewVal}},
    NewRole = AddRole,
    add_log_item(gain, {90062, AddVal}),
    NewPushAssets = [rest | PushAssets],
    NewArgs = Args#role_gain_gl_args{push_assets =
                                         NewPushAssets},
    {ok, NewRole, NewArgs};
gl(L = #loss{label = reserve_gold, val = LossVal},
   Args = #role_gain_gl_args{push_assets = PushAssets},
   Role = #role{assets =
                    Assets = #assets{reserve_gold = Val}})
    when Val >= 0 ->
    case LossVal =< Val of
        true ->
            NewRole = Role#role{assets =
                                    Assets#assets{reserve_gold =
                                                      Val - LossVal}},
            add_log_item(loss, {90062, LossVal}),
            NewPushAssets = [rest | PushAssets],
            NewArgs = Args#role_gain_gl_args{push_assets =
                                                 NewPushAssets},
            {ok, NewRole, NewArgs};
        false -> {false, L}
    end;
gl(#gain{label = skl_unique_exp, val = AddVal},
   Args = #role_gain_gl_args{push_assets = PushAssets},
   Role = #role{assets =
                    Assets = #assets{skl_unique_exp = Val}}) ->
    NewVal = Val + AddVal,
    AddRole = Role#role{assets =
                            Assets#assets{skl_unique_exp = NewVal}},
    NewRole = AddRole,
    add_log_item(gain, {90055, AddVal}),
    NewPushAssets = [rest | PushAssets],
    NewArgs = Args#role_gain_gl_args{push_assets =
                                         NewPushAssets},
    {ok, NewRole, NewArgs};
gl(L = #loss{label = skl_unique_exp, val = LossVal},
   Args = #role_gain_gl_args{push_assets = PushAssets},
   Role = #role{assets =
                    Assets = #assets{skl_unique_exp = Val}})
    when Val >= 0 ->
    case LossVal =< Val of
        true ->
            NewRole = Role#role{assets =
                                    Assets#assets{skl_unique_exp =
                                                      Val - LossVal}},
            add_log_item(loss, {90055, LossVal}),
            NewPushAssets = [rest | PushAssets],
            NewArgs = Args#role_gain_gl_args{push_assets =
                                                 NewPushAssets},
            {ok, NewRole, NewArgs};
        false -> {false, L}
    end;
gl(#gain{label = happy_score, val = AddVal},
   Args = #role_gain_gl_args{push_assets = PushAssets},
   Role = #role{assets =
                    Assets = #assets{happy_score = Val}}) ->
    NewVal = Val + AddVal,
    AddRole = Role#role{assets =
                            Assets#assets{happy_score = NewVal}},
    NewRole = AddRole,
    add_log_item(gain, {90057, AddVal}),
    NewPushAssets = [rest | PushAssets],
    NewArgs = Args#role_gain_gl_args{push_assets =
                                         NewPushAssets},
    {ok, NewRole, NewArgs};
gl(L = #loss{label = happy_score, val = LossVal},
   Args = #role_gain_gl_args{push_assets = PushAssets},
   Role = #role{assets =
                    Assets = #assets{happy_score = Val}})
    when Val >= 0 ->
    case LossVal =< Val of
        true ->
            NewRole = Role#role{assets =
                                    Assets#assets{happy_score = Val - LossVal}},
            add_log_item(loss, {90057, LossVal}),
            NewPushAssets = [rest | PushAssets],
            NewArgs = Args#role_gain_gl_args{push_assets =
                                                 NewPushAssets},
            {ok, NewRole, NewArgs};
        false -> {false, L}
    end;
gl(G, _Args, #role{name = Name}) ->
    logger:error("角色[~ts]收到无法处理的损益数据: ~w",
                 [Name, G],
                 role_gain,
                 2820),
    {false, G}.

loss_items([], _DelL, L) -> L;
loss_items([{Id, Num} | T], DelL, L) ->
    case lists:keyfind(Id, #item.id, DelL) of
        #item{base_id = BaseId} ->
            loss_items(T, DelL, [{BaseId, Num} | L]);
        _ -> loss_items(T, DelL, L)
    end.

merge_items([], Items) -> Items;
merge_items([{BaseId, Num} | T], Items) ->
    NewItems = case lists:keyfind(BaseId, 1, Items) of
                   {_, Num1} ->
                       lists:keyreplace(BaseId,
                                        1,
                                        Items,
                                        {BaseId, Num + Num1});
                   _ -> [{BaseId, Num} | Items]
               end,
    merge_items(T, NewItems).

item_base_id_auto_buy([], _L, _Role, ItemAcc,
                      AssetsAcc) ->
    {AssetsAcc, ItemAcc};
item_base_id_auto_buy([{_BaseId, 0} | Rest], L, Role,
                      ItemAcc, AssetsAcc) ->
    item_base_id_auto_buy(Rest,
                          L,
                          Role,
                          ItemAcc,
                          AssetsAcc);
item_base_id_auto_buy([H = {BaseId, Num} | Rest], L,
                      Role, ItemAcc, AssetsAcc) ->
    case package:count(by_base_id, BaseId, Role#role.p_bag)
        of
        {_, 0} ->
            item_base_id_auto_buy(Rest,
                                  L,
                                  Role,
                                  ItemAcc,
                                  [H | AssetsAcc]);
        {_, HadNum} when HadNum >= Num ->
            item_base_id_auto_buy(Rest,
                                  L,
                                  Role,
                                  [H | ItemAcc],
                                  AssetsAcc);
        {_, HadNum} ->
            DiffNum = Num - HadNum,
            item_base_id_auto_buy(Rest,
                                  L,
                                  Role,
                                  [{BaseId, HadNum} | ItemAcc],
                                  [{BaseId, DiffNum} | AssetsAcc])
    end.

item_base_id_to_assets([], Role, AssetsLoss, Effect,
                       LogItems, GainList, NewLog) ->
    {ok,
     AssetsLoss,
     Effect,
     LogItems,
     GainList,
     Role,
     NewLog};
item_base_id_to_assets([{_BaseId, 0} | Rest], Role,
                       AssetsAcc, EffectAcc, LogItems, GainList, NewLog) ->
    item_base_id_to_assets(Rest,
                           Role,
                           AssetsAcc,
                           EffectAcc,
                           LogItems,
                           GainList,
                           NewLog);
item_base_id_to_assets([{BaseId, Num} | Rest], Role,
                       AssetsAcc, EffectAcc, LogItems, GainList, NewLog) ->
    Priority = item:attr(buy_source, BaseId),
    case do_item_base_id_to_assets(Priority,
                                   BaseId,
                                   Num,
                                   Role)
        of
        {ok,
         Assets = #loss{source = Source, val = TotalPrice}} ->
            item_base_id_to_assets(Rest,
                                   Role,
                                   [Assets | AssetsAcc],
                                   EffectAcc,
                                   [{BaseId, Num} | LogItems],
                                   [{BaseId, 0, Num} | GainList],
                                   [{BaseId, Num, Source, TotalPrice}
                                    | NewLog]);
        {ok,
         Assets = #loss{val = TotalPrice},
         {Source, Effect = {BaseId1, Num1}}} ->
            NewEffectAcc = case lists:keytake(Source, 1, EffectAcc)
                               of
                               {value, {_, List}, RestEffectAcc} ->
                                   [{Source, [Effect | List]} | RestEffectAcc];
                               _ -> [{Source, [Effect]} | EffectAcc]
                           end,
            Bind = case Source of
                       4 -> 1;
                       _ -> 0
                   end,
            item_base_id_to_assets(Rest,
                                   Role,
                                   [Assets | AssetsAcc],
                                   NewEffectAcc,
                                   [{BaseId, Num} | LogItems],
                                   [{BaseId, Bind, Num} | GainList],
                                   [{BaseId1, Num1, Source, TotalPrice}
                                    | NewLog]);
        {ok, Assets, 0} ->
            item_base_id_to_assets(Rest,
                                   Role,
                                   [Assets | AssetsAcc],
                                   EffectAcc,
                                   LogItems,
                                   GainList,
                                   NewLog);
        {ok,
         [Assets = #loss{val = TotalPrice}, Exist],
         {Source, Effect = {BaseId1, Num1}},
         NewRole} ->
            NewEffectAcc = case lists:keytake(Source, 1, EffectAcc)
                               of
                               {value, {_, List}, RestEffectAcc} ->
                                   [{Source, [Effect | List]} | RestEffectAcc];
                               _ -> [{Source, [Effect]} | EffectAcc]
                           end,
            Bind = case Source of
                       4 -> 1;
                       _ -> 0
                   end,
            item_base_id_to_assets(Rest,
                                   NewRole,
                                   [Assets, Exist | AssetsAcc],
                                   NewEffectAcc,
                                   [{BaseId, Num} | LogItems],
                                   [{BaseId, Bind, Num} | GainList],
                                   [{BaseId1, Num1, Source, TotalPrice}
                                    | NewLog]);
        {ok,
         Assets = #loss{val = TotalPrice},
         {Source, Effect = {BaseId1, Num1}},
         NewRole} ->
            NewEffectAcc = case lists:keytake(Source, 1, EffectAcc)
                               of
                               {value, {_, List}, RestEffectAcc} ->
                                   [{Source, [Effect | List]} | RestEffectAcc];
                               _ -> [{Source, [Effect]} | EffectAcc]
                           end,
            Bind = case Source of
                       4 -> 1;
                       _ -> 0
                   end,
            item_base_id_to_assets(Rest,
                                   NewRole,
                                   [Assets | AssetsAcc],
                                   NewEffectAcc,
                                   [{BaseId, Num} | LogItems],
                                   [{BaseId, Bind, Num} | GainList],
                                   [{BaseId1, Num1, Source, TotalPrice}
                                    | NewLog]);
        False -> False
    end.

do_item_base_id_to_assets([], BaseId, _Num, _Role) ->
    {false,
     notice:format(lang:get("市场暂无~ts出售"),
                   [{item_2, BaseId}])};
do_item_base_id_to_assets([3 | Rest], BaseId, Num,
                          Role) ->
    case market_silver:auto_buy_market_price(BaseId) of
        {ok, #market_price{assets = Assets, price = Price}} ->
            Coin = Price * Num,
            Label = case Assets of
                        90000 -> coin_or_gold;
                        _ -> gold
                    end,
            Loss = #loss{label = Label, source = 4, val = Coin},
            {ok, Loss, {4, {BaseId, Num}}};
        _ -> do_item_base_id_to_assets(Rest, BaseId, Num, Role)
    end;
do_item_base_id_to_assets([2 | Rest], BaseId, Num,
                          Role) ->
    case market_gold:auto_buy_market_price(Role,
                                           BaseId,
                                           Num)
        of
        {ok, 0, Role, [{BaseId1, Num1}]} ->
            LimitMsg = notice:format(lang:get("自动使用背包~ts合成~ts"),
                                     [{item_2, BaseId1, Num1},
                                      {item_2, BaseId, Num}]),
            notice:send(Role, 1, LimitMsg),
            Loss = #loss{label = item_base_id,
                         val = [{BaseId1, Num1}], msg = lang:get("道具不足, 无法操作")},
            {ok, Loss, 0};
        {ok,
         #market_price{price = Price},
         NewRole,
         Exist,
         {BaseId1, Num1}} ->
            Loss = case Exist of
                       [LH | LT] ->
                           [#loss{label = gold_bind_or_gold, source = 5,
                                  val = Price, msg = lang:get("钻石不足")}
                            | format:val_to_loss([LH | LT])];
                       _ ->
                           #loss{label = gold_bind_or_gold, source = 5,
                                 val = Price, msg = lang:get("钻石不足")}
                   end,
            logger:debug("消耗 ~w", [Loss], role_gain, 2942),
            {ok, Loss, {5, {BaseId1, Num1}}, NewRole};
        {false, [MH | MT]} when Rest =:= [] ->
            {false, [MH | MT]};
        _ -> do_item_base_id_to_assets(Rest, BaseId, Num, Role)
    end;
do_item_base_id_to_assets([1 | Rest], BaseId, Num,
                          Role) ->
    case shop_mgr:get_shop_item(BaseId, Role) of
        {ok, Price, AssetsType} ->
            TotalPrice = Price * Num,
            Loss = #loss{label = AssetsType, source = 2,
                         val = TotalPrice, msg = lang:get("钻石不足")},
            {ok, Loss};
        {false, Reason} -> {false, Reason};
        _ -> do_item_base_id_to_assets(Rest, BaseId, Num, Role)
    end;
do_item_base_id_to_assets(_, BaseId, _Num, _Role) ->
    {false,
     notice:format(lang:get("市场暂无~ts出售"),
                   [{item_2, BaseId}])}.

merge_assets_item([], [], OwnItems, AssetsItems) ->
    OwnStr = log:item_str(OwnItems),
    AssetsStr = string:join(AssetsItems, ","),
    {OwnStr, AssetsStr};
merge_assets_item([], _, OwnItems, AssetsItems) ->
    {OwnItems, AssetsItems};
merge_assets_item([L = #loss{label = item_base_id}
                   | Rest],
                  LogItems, OwnItems, AssetsItems) ->
    merge_assets_item(Rest,
                      LogItems,
                      [L | OwnItems],
                      AssetsItems);
merge_assets_item([#loss{label = gold, val = 0},
                   L = #loss{label = star_gold}
                   | Rest],
                  [I | LogItems], OwnItems, AssetsItems) ->
    AssetsStr = log:item_str(L),
    ItemStr = log:item_str(I),
    Str = util:flist("[~ts, ~ts]", [ItemStr, AssetsStr]),
    merge_assets_item(Rest,
                      LogItems,
                      OwnItems,
                      [Str | AssetsItems]);
merge_assets_item([#loss{label = gold},
                   L = #loss{label = star_gold, val = 0}
                   | Rest],
                  [I | LogItems], OwnItems, AssetsItems) ->
    AssetsStr = log:item_str(L),
    ItemStr = log:item_str(I),
    Str = util:flist("[~ts, ~ts]", [ItemStr, AssetsStr]),
    merge_assets_item(Rest,
                      LogItems,
                      OwnItems,
                      [Str | AssetsItems]);
merge_assets_item([L1 = #loss{label = gold},
                   L2 = #loss{label = star_gold}
                   | Rest],
                  [I | LogItems], OwnItems, AssetsItems) ->
    AssetsStr1 = log:item_str(L1),
    AssetsStr2 = log:item_str(L2),
    ItemStr = log:item_str(I),
    Str1 = util:flist("[~ts, ~ts]", [ItemStr, AssetsStr1]),
    Str2 = util:flist("[~ts, ~ts]", [ItemStr, AssetsStr2]),
    merge_assets_item(Rest,
                      LogItems,
                      OwnItems,
                      [Str1, Str2 | AssetsItems]);
merge_assets_item([L | Rest], [I | LogItems], OwnItems,
                  AssetsItems) ->
    AssetsStr = log:item_str(L),
    ItemStr = log:item_str(I),
    Str = util:flist("[~ts, ~ts]", [ItemStr, AssetsStr]),
    merge_assets_item(Rest,
                      LogItems,
                      OwnItems,
                      [Str | AssetsItems]).

add_log_item(_Label, []) -> ok;
add_log_item(Label, [I | T]) ->
    add_log_item(Label, I),
    add_log_item(Label, T);
add_log_item(Label, {BaseId, Num}) ->
    put(role_gain_log_items,
        [{Label, BaseId, Num} | get(role_gain_log_items)]);
add_log_item(Label, {BaseId, _, Num}) ->
    put(role_gain_log_items,
        [{Label, BaseId, Num} | get(role_gain_log_items)]);
add_log_item(Label,
             #item{base_id = BaseId, quantity = Num}) ->
    put(role_gain_log_items,
        [{Label, BaseId, Num} | get(role_gain_log_items)]);
add_log_item(_Label, _) -> skip.

