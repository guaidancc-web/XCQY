-file("src/gm_cmd.erl", 1).

-module(gm_cmd).

-export([do/2, cmds/0, save/0]).

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

-file("src/gm_cmd.erl", 15).

-file("inc/gm.hrl", 1).

-record(gm_cmd,
        {cmd = "" :: list(),
         args = [] :: list(),
         desc = "" :: list(),
         do :: undefined | function()}).

-file("src/gm_cmd.erl", 16).

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

-file("src/gm_cmd.erl", 17).

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

-file("src/gm_cmd.erl", 18).

-file("inc/package.hrl", 1).

-record(package,
        {type = 1 :: integer(),
         next_id = 1 :: pos_integer(),
         volume = 0 :: non_neg_integer(),
         free_cell = [] :: list(),
         items = [] :: [tuple()]}).

-file("src/gm_cmd.erl", 19).

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

-file("src/gm_cmd.erl", 20).

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

-file("src/gm_cmd.erl", 21).

-file("inc/attr.hrl", 1).

-record(attr_base,
        {type = 0 :: non_neg_integer(),
         name = 0 :: pos_integer(),
         flag = 0 :: non_neg_integer(),
         calc_type = 0 :: non_neg_integer(),
         val = 0 :: non_neg_integer()}).

-record(attr,
        {ver = 3,
         fc = 0 :: non_neg_integer(),
         speed = 260 :: pos_integer(),
         hp_max = 0 :: non_neg_integer(),
         mp_max = 0 :: non_neg_integer(),
         atk_speed = 0 :: non_neg_integer(),
         phy_dmg = 0 :: non_neg_integer(),
         magic_dmg = 0 :: non_neg_integer(),
         phy_def = 0 :: non_neg_integer(),
         magic_def = 0 :: non_neg_integer(),
         crit = 0 :: non_neg_integer(),
         tenacity = 0 :: non_neg_integer(),
         accuracy = 0 :: non_neg_integer(),
         evasion = 0 :: non_neg_integer(),
         holy_dmg = 0 :: non_neg_integer(),
         crit_dmg = 0 :: non_neg_integer(),
         crit_dmg_def = 0 :: non_neg_integer(),
         dmg_ratio = 0 :: non_neg_integer(),
         def_ratio = 0 :: non_neg_integer(),
         enhance_control = 0 :: non_neg_integer(),
         anti_control = 0 :: non_neg_integer(),
         escape = 0 :: non_neg_integer(),
         anti_escape = 0 :: non_neg_integer(),
         capture = 0 :: non_neg_integer(),
         phy_def_ratio = 0 :: non_neg_integer(),
         magic_def_ratio = 0 :: non_neg_integer(),
         phy_accuracy = 0 :: non_neg_integer(),
         magic_accuracy = 0 :: non_neg_integer(),
         phy_evasion = 0 :: non_neg_integer(),
         magic_evasion = 0 :: non_neg_integer(),
         phy_crit = 0 :: non_neg_integer(),
         magic_crit = 0 :: non_neg_integer(),
         phy_tenacity = 0 :: non_neg_integer(),
         magic_tenacity = 0 :: non_neg_integer(),
         heal_val = 0 :: non_neg_integer(),
         heal_ratio = 0 :: non_neg_integer(),
         eff_heal_ratio = 0 :: non_neg_integer(),
         phy_dmg_ratio = 0 :: non_neg_integer(),
         magic_dmg_ratio = 0 :: non_neg_integer(),
         strength = 0,
         constitution = 0,
         magic = 0,
         agility = 0,
         endurance = 0,
         exp_ratio = 0}).

-record(attr_calc,
        {attr :: undefined | #attr{},
         attr_no_ratio :: undefined | #attr{},
         ratio :: undefined | #attr{},
         attr_no_fc :: undefined | #attr{},
         ratio_no_fc :: undefined | #attr{}}).

-record(m_attr_point,
        {ver = 2,
         ext_point = [],
         first_free = 0,
         valid_plan = 1,
         plan_data = [],
         change_plan_times = 0}).

-record(attr_point_plan,
        {index = 1 :: pos_integer(),
         plan_name = [],
         strength = 0 :: pos_integer(),
         constitution = 0 :: non_neg_integer(),
         magic = 0 :: non_neg_integer(),
         agility = 0 :: non_neg_integer(),
         endurance = 0 :: non_neg_integer(),
         pre_str = 0,
         pre_con = 0,
         pre_magic = 0,
         pre_agi = 0,
         pre_end = 0}).

-file("src/gm_cmd.erl", 22).

-file("inc/link.hrl", 1).

-record(link,
        {socket :: undefined | port(),
         conn_pid :: undefined | pid(),
         ip = {0, 0, 0, 0} :: {0..255, 0..255, 0..255, 0..255},
         port = 0 :: non_neg_integer(),
         lag = 0 :: non_neg_integer()}).

-file("src/gm_cmd.erl", 23).

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

-file("src/gm_cmd.erl", 24).

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

-file("src/gm_cmd.erl", 25).

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

-file("src/gm_cmd.erl", 26).

-file("inc/query.hrl", 1).

-record(name_index,
        {name = "" :: list(),
         id = 0 :: non_neg_integer(),
         acc = "" :: list(),
         pid :: undefined | pid(),
         conn_pid :: undefined | pid()}).

-record(id_index,
        {id = {0, "", 0} ::
             {non_neg_integer(), list(), non_neg_integer()},
         acc = "" :: list(),
         name = "" :: list(),
         pid :: undefined | pid(),
         conn_pid :: undefined | pid()}).

-record(acc_index,
        {acc = {"", "", 0} ::
             {list(), list(), non_neg_integer()},
         id = 0 :: non_neg_integer(),
         name = "" :: list(),
         pid :: undefined | pid(),
         conn_pid :: undefined | pid()}).

-file("src/gm_cmd.erl", 27).

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

-file("src/gm_cmd.erl", 28).

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

-file("src/gm_cmd.erl", 29).

-file("inc/timer.hrl", 1).

-record(timer,
        {id :: undefined | term(),
         timeout = 1000 :: pos_integer(),
         m :: undefined | atom(),
         f :: undefined | function() | atom(),
         a = [] :: [term()],
         times = 1 :: integer(),
         next_tick = 0 :: non_neg_integer(),
         set_time = 1 :: pos_integer()}).

-record(rtimer,
        {ref :: undefined | reference(),
         key :: undefined | reference(),
         timers = [] :: [#timer{}]}).

-record(s_timer,
        {ref :: undefined | reference(),
         timers = [] :: [#timer{}]}).

-file("src/gm_cmd.erl", 30).

-file("inc/skill.hrl", 1).

-record(m_skill,
        {ver = 6 :: pos_integer(),
         skills = [] :: [{non_neg_integer(), non_neg_integer()}],
         is_open_skl_prac = 0 :: 0 | 1,
         selected_skl_prac = 0 :: non_neg_integer(),
         skill_prac = [] :: list(),
         skill_couple = [] :: list(),
         skill_sworn = [] :: list(),
         speed = [] :: list(),
         skill_unique = [],
         skill_clsld_done = [],
         unique_coolddown_time = 0,
         skl_unique_point = 100,
         sq_double = 0,
         is_open_sq_double = 0,
         sq_exp_statistics = []}).

-record(role_base_skill,
        {id = 0,
         lev = 0,
         type :: undefined | non_neg_integer(),
         sub_type :: undefined | non_neg_integer(),
         max_lev = 0,
         name = "",
         way = 1,
         study_lev = 1,
         cost = [],
         attr = []}).

-record(skill,
        {id = 0,
         lev = 0,
         type = 0 :: non_neg_integer(),
         sub_type = 0 :: non_neg_integer(),
         speed = 1,
         name = "",
         acc_ratio = 1000,
         acc_low = 0,
         acc_high = 1000,
         attack_type = 0 :: non_neg_integer(),
         elem_type = 0 :: non_neg_integer(),
         target_type = 1 :: non_neg_integer(),
         attack_times = 1 :: non_neg_integer(),
         target_list = [],
         self_cond = [],
         self_loss = [],
         target_cond = [],
         dmg_addt = 0 :: non_neg_integer(),
         dmg_ratio = [1000] :: non_neg_integer(),
         pre_cooldown = 0,
         cooldown = 0 :: non_neg_integer(),
         cost_mp = 0 :: non_neg_integer(),
         cost_anger = 0,
         cost_other = [] :: [{atom(), non_neg_integer()}],
         buff_self = [] :: [tuple()],
         buff_target = [] :: [tuple()],
         script_id = 0 :: non_neg_integer(),
         script_args = [] :: [integer()],
         addt_scripts = [] ::
             [{non_neg_integer(), non_neg_integer(), list()}],
         play_time = 0 :: non_neg_integer()}).

-record(chief_classes,
        {leader_id = 0,
         classes = 0,
         name = "",
         sex = 0,
         lev = 0,
         looks = []}).

-record(sq_exp_statistics,
        {combat_type = 0, times = 0, gain = 0, real_gain = 0}).

-file("src/gm_cmd.erl", 31).

-file("inc/wing.hrl", 1).

-record(m_wing,
        {ver = 11 :: pos_integer(),
         grade = 0 :: non_neg_integer(),
         growth = 0,
         enhance_num = 0,
         wing_id = 0,
         plot_wing_id = 0,
         expiry = [],
         tmp_grade = 0 :: non_neg_integer(),
         tmp_growth = 0,
         tmp_wing_id = 0,
         star_lev = 1 :: non_neg_integer(),
         valid_plan = 1,
         plan_data = [] :: list(),
         change_times = 0,
         reset_times = 0,
         lev_break_skill = [],
         wing_ids = [],
         exp = 0,
         old_grade = 0,
         old_star = 0,
         appearance_list = [],
         speed = 1,
         wing_group_list = [],
         wing_power = 100}).

-record(wing_skill_plan,
        {index = 1,
         plan_name = [] :: list(),
         skills = [],
         tmp_skills = []}).

-record(wing_lev_break_skill,
        {ver = 1,
         skill_grade = 0,
         skill_id = 0,
         skill_lev = 0,
         skill_val = 0}).

-record(wing_skill,
        {ver = 1, key = {0, 0}, id = 0, lev = 0, is_lock = 0}).

-record(wing_lock_data,
        {grade = 0, max = 0, item_list = []}).

-record(wing_appearance,
        {id = 0,
         time = 0,
         timeout = 0,
         grade = 0,
         star_lev = 0}).

-record(wing_base_group,
        {group_id = 0,
         need_grade = 0,
         wing_ids = [],
         grades = [],
         loss_item = []}).

-record(wing_group,
        {ver = 1,
         group_id = 0,
         wing_ids = [],
         wing_times = 0,
         rewarded = 0}).

-file("src/gm_cmd.erl", 32).

-file("inc/skill_prac.hrl", 1).

-record(skl_prac_meta_data,
        {id :: undefined | pos_integer(),
         name :: undefined | string(),
         obj :: undefined | pos_integer(),
         day_max_times :: undefined | pos_integer()}).

-record(skill_prac_data,
        {id :: undefined | pos_integer(),
         role_lev :: undefined | non_neg_integer(),
         skill_lev :: undefined | non_neg_integer(),
         top_lev :: undefined | non_neg_integer(),
         exp :: undefined | non_neg_integer(),
         attrs :: undefined | list(),
         lev_break_times :: undefined | non_neg_integer()}).

-record(skl_prac,
        {id = 0 :: pos_integer(),
         obj = 0 :: pos_integer(),
         lev = 0 :: non_neg_integer(),
         exp = 0 :: non_neg_integer(),
         enhance = [] :: list()}).

-record(skl_prac_enhance,
        {source = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer()}).

-record(skill_prac_box,
        {id :: undefined | tuple(), exps = []}).

-file("src/gm_cmd.erl", 33).

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

-file("src/gm_cmd.erl", 34).

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

-file("src/gm_cmd.erl", 35).

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

-file("src/gm_cmd.erl", 36).

-file("inc/trial.hrl", 1).

-record(trial_unit,
        {battle_id = 0,
         unit_id = 0,
         unit_baseid = 0,
         unit_name = "",
         classes = 0,
         sex = 0,
         lev = 0,
         dir = 0,
         looks = [],
         map_id = 0,
         x = 0,
         y = 0}).

-record(m_trial,
        {ver = 3,
         mode = 0,
         order = 0,
         fighter,
         unit = #trial_unit{},
         direct_order = 0,
         clear_normal = 0,
         round = 0,
         times = 2,
         coin = 0,
         reset = 2,
         max_order_easy = 0,
         max_order_hard = 0,
         has_match = [],
         is_helped = "",
         gain_items = []}).

-record(trial_help,
        {id = {0, "", 0},
         name = "",
         lev = 0,
         classes = 0,
         sex = 0,
         type = 1,
         unit_id = 0,
         battle_id = 0,
         unit_name = "",
         time = 0}).

-file("src/gm_cmd.erl", 37).

-file("inc/quest.hrl", 1).

-file("inc/quest_king.hrl", 1).

-record(quest_king,
        {ver = 1,
         stage = 1,
         finish = [],
         doing = [],
         rf_times = 0}).

-file("inc/quest.hrl", 36).

-record(quest_data,
        {id = 1 :: pos_integer(),
         phase = 1 :: pos_integer(),
         quest_line = 1,
         type = 1 :: pos_integer(),
         sec_type = 1 :: pos_integer(),
         name = "" :: list(),
         mode = 1 :: pos_integer(),
         leader_cond = [] :: [tuple()],
         is_leader_quest = 0 :: 0 | 1,
         can_giveup = 0 :: 0..1,
         lev = 1 :: pos_integer(),
         lev_break_min_times = 0 :: non_neg_integer(),
         lev_break_max_times = 0 :: non_neg_integer(),
         max_lev = 0 :: non_neg_integer(),
         auto_finished_lev = 0 :: non_neg_integer(),
         classes = 0 :: 0..4,
         pre_quest ::
             undefined | non_neg_integer() | [non_neg_integer()],
         check_distance = 0 :: 0..1,
         npc_accept_battle = 0 :: non_neg_integer(),
         npc_accept_id = 0 :: non_neg_integer(),
         npc_accept = 0 :: non_neg_integer(),
         npc_commit_battle = 0 :: non_neg_integer(),
         npc_commit_id = 0 :: non_neg_integer(),
         npc_commit = 0 :: non_neg_integer(),
         start_time = 0 ::
             tuple() | non_neg_integer() | undefined,
         end_time = 0 :: tuple() | non_neg_integer() | undefined,
         condition = [] :: [tuple()],
         progress = [] :: [tuple()],
         rewards_accept = [] :: [tuple()],
         rewards_commit = [] :: [tuple()],
         commit_loss = [] :: [tuple()],
         rewards_vip = [] :: [tuple()],
         action_accept = [] :: [tuple()],
         action_commit = [] :: [tuple()],
         times = 1 :: non_neg_integer(),
         desc = "" :: list(),
         auto_accept = 0 :: 0..1,
         is_auto_finished_gain = 0 :: 0..1,
         weekdays = [] :: [pos_integer()],
         white_list = [] :: list(),
         black_list = [] :: list(),
         notice_msg = "" :: list(),
         val_from_prev = 0 :: 0..1,
         honor = 0 :: non_neg_integer(),
         ach_num = 0 :: non_neg_integer(),
         rewards_badge = 0 :: non_neg_integer(),
         day = 0 :: non_neg_integer(),
         extra = []}).

-record(quest_extra_data,
        {name = 0, classes = 0, val1 = 0, val2 = 0, list = []}).

-record(quest_classes,
        {quest_id = 0,
         first_time = 0,
         ring = 1,
         round = 0,
         total_count = 0,
         done_list = []}).

-record(quest_offer,
        {quest_id = 0,
         day_count = 0,
         leader_count = 0,
         leader_quest_count = 0,
         round = 0,
         total_count = 0,
         team_args = []}).

-record(quest_treasure,
        {quest_id = 0, round = 0, total_count = 0}).

-record(quest_guild,
        {quest_id = 0,
         last_accepted = 0,
         ring = 1,
         round = 0,
         total_count = 0,
         done_list = []}).

-record(quest_chain,
        {quest_id = 0,
         accept_time = 0,
         type = 0,
         ext_data = [],
         round = 0,
         total_count = 0,
         commit_npc}).

-record(quest_marriage,
        {quest_id = 0,
         type = 0,
         sec_type = 0,
         round = 0,
         total_count = 0,
         ext_data = quest_marriage:quest_ext_data()}).

-record(quest_couple,
        {quest_id = 0,
         type = 0,
         sec_type = 0,
         round = 0,
         total_count = 0,
         partner_id,
         ext_data = quest_couple:quest_ext_data()}).

-record(quest_prac,
        {part = 1, chapter = 2, section = 0}).

-record(quest_plant,
        {quest_id = 0,
         last_accepted = 0,
         last_commited = 0,
         round = 0,
         unit_id = 0,
         phase = 0,
         pos = {0, 0, 0},
         done_list = []}).

-record(quest_teacher,
        {quest_id = 0,
         type = 0,
         sec_type = 0,
         partner_id,
         round = 0,
         total_count = 0,
         stats = [],
         ext_data = quest_teacher:quest_ext_data()}).

-record(quest_shipping, {list = []}).

-record(quest_pursue,
        {quest_id = 0,
         last_accepted = 0,
         round_started = 0,
         ring = 1,
         round = 0,
         total_count = 0,
         done_list = []}).

-record(quest_child,
        {quest_id = 0,
         last_accepted = 0,
         last_commited = 0,
         round = 0,
         mode = 1,
         unit_id = 0,
         done_list = []}).

-record(quest_pregnancy,
        {quest_id = 0,
         last_accepted = 0,
         last_commited = 0,
         round = 0,
         mode = 1,
         done_list = []}).

-record(quest_acquaintance,
        {quest_id = 0,
         last_accepted = 0,
         last_commited = 0,
         round = 0,
         partner_id = 0,
         partner_name = "",
         done_list = [],
         ring = 0,
         rpc_accepted = 0}).

-record(quest_summer,
        {ver = 1,
         finish = [],
         doing = [],
         score = 0,
         rewarded = []}).

-record(quest_single_dog,
        {ver = 1, finish = [], round = 1, extra = #{}}).

-record(quest_sign_draw, {finish = [], doing = []}).

-record(quest_score_exchange,
        {finish = [], doing = []}).

-record(quest_long_active, {finish = [], doing = []}).

-record(m_quest,
        {ver = 19,
         quest = [] :: list(),
         acceptable = [] :: list(),
         finished = [] :: list(),
         day_finished = [],
         quest_classes = #quest_classes{} :: #quest_classes{},
         quest_offer = #quest_offer{} :: #quest_offer{},
         quest_prac = #quest_prac{} :: #quest_prac{},
         quest_treasure = #quest_treasure{},
         quest_guild = #quest_guild{},
         quest_chain = #quest_chain{},
         quest_marriage = #quest_marriage{},
         quest_couple = #quest_couple{},
         quest_plant = #quest_plant{},
         quest_teacher = #quest_teacher{},
         quest_shipping = #quest_shipping{},
         quest_pursue = #quest_pursue{},
         quest_line = 2,
         quest_child = #quest_child{},
         quest_pregnancy = #quest_pregnancy{},
         quest_acquaintance = #quest_acquaintance{},
         quest_king = #quest_king{},
         quest_summer = #quest_summer{},
         quest_single_dog = #quest_single_dog{},
         quest_sign_draw = #quest_sign_draw{},
         quest_score_exchange = #quest_score_exchange{},
         quest_long_active = #quest_long_active{}}).

-record(quest,
        {id = 1 :: pos_integer(),
         name = "" :: binary(),
         type = 1 :: pos_integer(),
         sec_type = 1 :: pos_integer(),
         finish = 0 :: 0..2,
         quality = 0 :: 0..4,
         progress = [] :: [tuple()],
         accept_time = 0 :: non_neg_integer(),
         end_time = 0 :: non_neg_integer(),
         finish_time = 0 :: non_neg_integer(),
         round = 0 :: non_neg_integer()}).

-record(quest_progress,
        {id = 0 :: non_neg_integer(),
         label :: undefined | atom(),
         target = 0 :: non_neg_integer(),
         param = [] :: list(),
         finish = 0 :: 0..1,
         trigger :: undefined | tuple(),
         target_val = 1 :: pos_integer(),
         value = 0 :: non_neg_integer(),
         msg = "" :: bitstring() | string(),
         ext_data = [] :: [tuple()],
         dyn_ext_data = [] :: [tuple()]}).

-record(quest_rewards,
        {prob = 1000 :: pos_integer(),
         classes = 0 :: 0..4,
         gain :: undefined | tuple(),
         action :: undefined | function()}).

-record(quest_stats,
        {sec_type = 1, stats = [], desc = []}).

-file("src/gm_cmd.erl", 38).

-file("inc/guard.hrl", 1).

-record(m_guard,
        {ver = 1 :: pos_integer(),
         free_war_ids = [] :: [pos_integer()],
         tactics_fields = [] :: list(),
         tactics_attr = [] :: list(),
         guards = [] :: list()}).

-record(guard_eqm,
        {ver = 5,
         base_id :: undefined | non_neg_integer(),
         type :: undefined | non_neg_integer(),
         lev,
         eqm_attrs = [] :: list(),
         reset_base_id = 0,
         reset_attrs = [] :: list(),
         gem = [] :: list(),
         is_init = 1,
         timeout = 0,
         back_effect_timeout = 0,
         back_effect_attr = []}).

-record(guard_astroid,
        {ver = 2 :: non_neg_integer(),
         aroused = [] :: non_neg_integer(),
         skills = [] :: list(),
         attrs = [] :: list(),
         growth = 0 :: non_neg_integer(),
         active = 0 :: non_neg_integer()}).

-record(guard_astroid_star,
        {ver = 0,
         id = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         exp = 0 :: non_neg_integer(),
         attrs = [] :: list()}).

-record(guard,
        {ver = 2,
         base_id = 0 :: non_neg_integer(),
         war_id = 0 :: non_neg_integer(),
         name = "" :: string(),
         alias = "" :: string(),
         classes = 0 :: non_neg_integer(),
         quality = 0 :: non_neg_integer(),
         status = 0 :: non_neg_integer(),
         tac_pos = 0 :: non_neg_integer(),
         skills = [] :: list(),
         eqm = [] :: list(),
         attr :: undefined | tuple(),
         score = 0 :: non_neg_integer(),
         astroid = #guard_astroid{} :: #guard_astroid{}}).

-record(guard_data,
        {base_id = 0 :: non_neg_integer(),
         name = "" :: binary(),
         alias = "" :: binary(),
         classes = 0 :: non_neg_integer(),
         quality = 0 :: non_neg_integer(),
         loss = [] :: tuple(),
         recruit_lev = 1 :: non_neg_integer(),
         desc = "" :: list(),
         normal_atk_id = 0 :: integer(),
         ai_id = 0 :: integer(),
         base_score = 0,
         growth = 0 :: non_neg_integer()}).

-record(guard_eqm_data,
        {base_id = 0 :: non_neg_integer(),
         lev = 1 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         type = 0 :: non_neg_integer(),
         quality = 0 :: non_neg_integer(),
         loss_coin = 0 :: [tuple()],
         reset_coin = 0 :: [tuple()],
         gem_list = [] :: list()}).

-record(guard_lev_data,
        {base_id :: undefined | non_neg_integer(),
         lev :: undefined | non_neg_integer(),
         lev_up_exp :: undefined | non_neg_integer(),
         attrs = [] :: non_neg_integer()}).

-record(guard_eqm_gem,
        {id = 0, base_id = 0, type = 0, lev = 0}).

-record(guard_eqm_gem_data,
        {base_id = 0,
         next_base_id = 0,
         name = "",
         lev = 0,
         type = 0,
         need_lev = 0,
         loss_coin = [],
         attrs = []}).

-file("src/gm_cmd.erl", 39).

-file("inc/treasure.hrl", 1).

-record(treasure_reward,
        {map_id = 0,
         use_id = 0,
         reward_id = 0,
         reward_time = 0,
         show = []}).

-record(treasure_compass,
        {compass_id = 0,
         use_id = 0,
         compass_endtime = 0,
         map_id = 0,
         x = 0,
         y = 0}).

-record(m_treasure,
        {status = 0,
         reward = #treasure_reward{},
         compass = #treasure_compass{},
         total_count = 0}).

-record(treasure, {id = 1, type = 1, val = 1, num = 1}).

-record(treasure_data,
        {type = 1,
         val = 1,
         num = 1,
         ratio = 0,
         show_ratio = 0,
         can_show = 1,
         sex = 0,
         lev_low = 0,
         lev_high = 0,
         classes = 0,
         break_times_min = 0,
         break_times_max = 0}).

-file("src/gm_cmd.erl", 40).

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

-file("src/gm_cmd.erl", 41).

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

-file("src/gm_cmd.erl", 42).

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

-file("src/gm_cmd.erl", 43).

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

-file("src/gm_cmd.erl", 44).

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

-file("src/gm_cmd.erl", 45).

-file("inc/limit_return.hrl", 1).

-record(limit_return_server, {white = [], black = []}).

-record(m_limit_return,
        {ver = 1,
         flag = 0,
         login_time = 0,
         check_time = 0,
         start_time = 0,
         keep_time = 0,
         pay_time = 0,
         end_time = 0,
         check_time_list = [],
         acc = 0,
         return = 0,
         num = 0}).

-file("src/gm_cmd.erl", 46).

-file("inc/friend.hrl", 1).

-record(friendship,
        {owner = {1, "", 0} ::
             {pos_integer(), string(), non_neg_integer()},
         id = {1, "", 0} ::
             {pos_integer(), string(), non_neg_integer()},
         type = 0 :: non_neg_integer(),
         intimacy = 0 :: non_neg_integer(),
         ct = 0 :: non_neg_integer()}).

-record(friend_role,
        {id = {1, "", 0} ::
             {pos_integer(), string(), non_neg_integer()},
         ver = 6,
         name = "" :: string(),
         sex = 1 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         lev = 1 :: non_neg_integer(),
         break_times = 0,
         fc = 0 :: non_neg_integer(),
         face = 1 :: pos_integer(),
         intimacy = 0 :: non_neg_integer(),
         glamor = 0 :: non_neg_integer(),
         signature = "" :: string(),
         city = "" :: string(),
         online = 0 :: 0 | 1,
         online_time = 0 :: non_neg_integer(),
         total_fc = 0 :: non_neg_integer(),
         guild = "" :: string(),
         qualifying,
         arena,
         pet,
         guard,
         skill_prac = 0,
         achievement = 0,
         received_num = 0,
         given_num = 0,
         update_time = 0,
         looks = [] :: list(),
         offline_push = 0,
         glory_max_id = 0,
         glory_time = 0}).

-record(friend_request,
        {owner = {1, "", 0} ::
             {pos_integer(), string(), non_neg_integer()},
         id = {1, "", 0} ::
             {pos_integer(), string(), non_neg_integer()},
         name = "" :: string(),
         sex = 1 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         lev = 1 :: non_neg_integer(),
         fc = 0 :: non_neg_integer(),
         total_fc = 0 :: non_neg_integer(),
         face = 1 :: pos_integer(),
         ct = 0 :: non_neg_integer()}).

-record(friend_present,
        {ver = 0,
         giver = {0, "", 0},
         recipient = {0, "", 0},
         time = 0 :: integer(),
         num = 0 :: integer()}).

-record(m_friend,
        {ver = 2,
         signature = "星辰奇缘真好玩！" :: string(),
         num = 0 :: non_neg_integer(),
         fans = 0 :: non_neg_integer(),
         log_next_id = 1 :: pos_integer(),
         flower = 0 :: non_neg_integer(),
         intimacy = 0 :: non_neg_integer(),
         glamor = 0 :: non_neg_integer(),
         city = "" :: string(),
         set_num = 0 :: non_neg_integer(),
         cond_city = 1 :: 0..1,
         cond_sex = 1 :: 0..1,
         cond_fc = 1 :: 0..1,
         received_presents = [] :: [],
         given_presents = [] :: [],
         received_num = 0 :: non_neg_integer(),
         given_num = 0 :: non_neg_integer(),
         popularity_rewarded = [] :: list(),
         offline_push = 0}).

-record(friend_zone,
        {ver = 14 :: non_neg_integer(),
         id = {1, "", 0} ::
             {pos_integer(), string(), non_neg_integer()},
         name = "" :: string(),
         sex = 1 :: non_neg_integer(),
         classes = 1 :: non_neg_integer(),
         lev = 1 :: non_neg_integer(),
         photo = [] :: non_neg_integer(),
         birth = "" :: non_neg_integer(),
         constellation = 0 :: non_neg_integer(),
         abo = 0 :: non_neg_integer(),
         signature = "" :: string(),
         spouse_id = {0, "", 0} :: tuple(),
         spouse_name = "" :: string(),
         region = "" :: string(),
         online_time = 0 :: non_neg_integer(),
         guild = "" :: string(),
         subscribed = [],
         fans = [],
         visitors = [],
         visited = 0 :: non_neg_integer(),
         tags = [],
         liked = 0 :: non_neg_integer(),
         likes = [],
         privacy = 0 :: 0 | 1,
         prize_num = 0 :: non_neg_integer(),
         own_trends = [] :: [non_neg_integer()],
         subscribed_trends = [] :: [non_neg_integer()],
         photo_auditing = 0 :: non_neg_integer(),
         photo_audited = 0 :: non_neg_integer(),
         present_num = 0 :: non_neg_integer(),
         name_used = "" :: string(),
         week_liked = 0 :: non_neg_integer(),
         last_liked = 0 :: non_neg_integer(),
         honor_id = 0 :: non_neg_integer(),
         lover_name = "" :: string(),
         theme = 401 :: non_neg_integer(),
         badges = [] :: list(),
         photo_frame = 0 :: non_neg_integer(),
         teacher_name = "" :: string(),
         own_trend_num = 0,
         city = "" :: string(),
         is_shared_region = 1 :: 0 | 1,
         sworn_name = "" :: string(),
         show_honor = 0 :: non_neg_integer(),
         pre_honor_id = 0 :: non_neg_integer(),
         privacy_zone = 0 :: 0 | 1,
         privacy_moments = 0 :: 0 | 1}).

-record(friend_trend,
        {ver = 0 :: non_neg_integer(),
         zone_id = {0, "", 0},
         rid = {0, "", 0},
         name = "" :: string(),
         sex = 1 :: non_neg_integer(),
         classes = 1 :: non_neg_integer(),
         photo = 1 :: pos_integer(),
         id = 0 :: non_neg_integer(),
         type = 0 :: 0 | 1,
         content = "" :: string(),
         liked = 0 :: non_neg_integer(),
         likes = [],
         presents = [],
         ctime = 0 :: non_neg_integer()}).

-record(friend_visitor,
        {id = {0, "", 0},
         ver = 0,
         name = "" :: string(),
         sex = 0 :: 0 | 1,
         classes = 0 :: non_neg_integer(),
         photo = 0 :: non_neg_integer(),
         time = 0 :: non_neg_integer()}).

-record(friend_subscription,
        {id = {0, "", 0},
         ver = 0,
         name = "" :: string(),
         sex = 0 :: 0 | 1,
         classes = 0 :: non_neg_integer(),
         photo = 0 :: non_neg_integer(),
         time = 0 :: non_neg_integer(),
         cared = 0 :: non_neg_integer(),
         interacted = 0 :: non_neg_integer()}).

-record(friend_zone_rank,
        {id = {0, "", 0},
         ver = 0,
         name = "" :: string(),
         sex = 0 :: 0 | 1,
         classes = 0 :: non_neg_integer(),
         photo = 0 :: non_neg_integer(),
         liked = 0 :: non_neg_integer(),
         prize_num = 0 :: non_neg_integer()}).

-record(friend_zone_rank_week,
        {id = {0, "", 0},
         ver = 0,
         name = "" :: string(),
         sex = 0 :: 0 | 1,
         classes = 0 :: non_neg_integer(),
         photo = 0 :: non_neg_integer(),
         liked = 0 :: non_neg_integer(),
         last_liked = 0 :: non_neg_integer(),
         prize_num = 0 :: non_neg_integer()}).

-record(friend_like,
        {id = {0, "", 0},
         ver = 0,
         name = "" :: string(),
         sex = 0 :: 0 | 1,
         classes = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         got_prize = 0 :: 0 | 1,
         time = 0 :: non_neg_integer()}).

-record(friend_zone_photo,
        {id = 1,
         ver = 0,
         uploaded = 0,
         auditing = 0,
         audited = 0,
         default = 0}).

-record(friend_circle,
        {ver = 3 :: non_neg_integer(),
         id = {1, "", 0} ::
             {pos_integer(), string(), non_neg_integer()},
         name = "" :: string(),
         sex = 1 :: non_neg_integer(),
         classes = 1 :: non_neg_integer(),
         lev = 1 :: non_neg_integer(),
         region = "" :: string(),
         city = "" :: string(),
         moments = [] :: list(),
         subscriptions = [] :: list(),
         block = [] :: list(),
         unsubscribed = [] :: list(),
         notifications = [] :: list(),
         is_shared_region = 1 :: 0 | 1,
         unread_num = 0 :: non_neg_integer(),
         privacy_moments = 0 :: 0 | 1}).

-record(friend_moment,
        {ver = 1 :: non_neg_integer(),
         id = {0, "", 0},
         rid = {0, "", 0},
         name = "" :: string(),
         sex = 1 :: non_neg_integer(),
         classes = 1 :: non_neg_integer(),
         content = "" :: string(),
         liked = 0 :: non_neg_integer(),
         likes = [],
         mentions = [],
         ctime = 0 :: non_neg_integer(),
         type = 1}).

-record(friend_comment,
        {ver = 0 :: non_neg_integer(),
         id = {0, "", 0},
         moment_id = {0, "", 0},
         rid = {0, "", 0},
         name = "" :: string(),
         sex = 1 :: non_neg_integer(),
         classes = 1 :: non_neg_integer(),
         msg = "" :: string(),
         mentions = [],
         ctime = 0 :: non_neg_integer()}).

-record(friend_moment_like,
        {ver = 0 :: non_neg_integer(),
         moment_id = {0, "", 0},
         rid = {0, "", 0},
         name = "" :: string(),
         sex = 1 :: non_neg_integer(),
         classes = 1 :: non_neg_integer(),
         ctime = 0 :: non_neg_integer()}).

-record(friend_moment_photo,
        {id = 1,
         moment_id = {0, "", 0},
         rid = {0, "", 0},
         ver = 0,
         uploaded = 0,
         auditing = 1,
         audited = 0}).

-record(friend_circle_report,
        {id = {{0, "", 0}, 0, 0},
         rid = {0, "", 0},
         moment_id = {0, "", 0},
         spec_id = 0,
         type = 0,
         name = "",
         lev = 1,
         time = 0,
         content = "",
         reporter_id = {0, "", 0},
         reporter_name = "",
         reporter_lev = 0}).

-record(friend_circle_region,
        {ver = 0 :: non_neg_integer(),
         region = "" :: string(),
         city = "" :: string(),
         moments = [] :: list()}).

-record(friend_recall,
        {role_id = {0, "", 0},
         role_name = "",
         id = 0 :: non_neg_integer(),
         activity = 0 :: non_neg_integer(),
         status = 0 :: non_neg_integer(),
         role_id_bind = {0, "", 0},
         role_name_bind = "",
         lists = [] :: list(),
         rewards = [] :: list(),
         lists_time = [] :: list(),
         time_return = 0 :: non_neg_integer()}).

-record(friend_recalled,
        {role_id = {0, "", 0},
         status = 0 :: non_neg_integer(),
         bind = 0 :: non_neg_integer(),
         time_return = 0 :: non_neg_integer(),
         time = 0 :: non_neg_integer(),
         activity = 0 :: non_neg_integer(),
         rewards = [] :: list(),
         lists = [] :: list(),
         recall_list = [] :: list(),
         role_id_recall = {0, "", 0},
         role_name_recall = "" :: string(),
         login = 0 :: non_neg_integer(),
         activity_id = 0 :: non_neg_integer()}).

-record(friend_group,
        {ver = 0,
         id = {0, "", 0},
         name = "",
         content = "",
         owner_id = {0, "", 0},
         owner_name = "",
         owner_classes = 0,
         owner_sex = 0,
         owner_lev = 1,
         owner_fc = 0,
         owner_face = 1,
         time = 0,
         members = [],
         trends = [],
         historys = [],
         invites = []}).

-record(friend_group_role,
        {ver = 1,
         id = {0, "", 0},
         groups = [],
         inviteds = [],
         create = 0,
         join = 0,
         unlock = 0,
         applys = []}).

-record(friend_group_trend,
        {type = 0, string1 = "", string2 = "", time = 0}).

-record(friend_group_chat,
        {role_id = 0, msgs = "", time = 0}).

-record(friend_group_data,
        {group_id = {0, "", 0},
         group_name = "",
         group_content = "",
         owner_id = {0, "", 0},
         owner_name = "",
         owner_classes = 0,
         owner_sex = 0,
         time = 0}).

-record(friend_group_role_data,
        {role_id = {0, "", 0},
         role_name = "",
         role_classes = 0,
         role_lev = 0,
         role_sex = 0,
         online = 0,
         online_time = 0,
         post = 0,
         notice = 1,
         pid = undefined}).

-record(friend_moment_wish_audit,
        {ver = 1,
         moment_id = {0, "", 0},
         role_id = {0, "", 0},
         audit_time = 0,
         reward_title = 0,
         camp_id = 0}).

-file("src/gm_cmd.erl", 47).

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

-file("src/gm_cmd.erl", 48).

-file("inc/arena.hrl", 1).

-record(m_arena,
        {ver = 1,
         cd_time = 0 :: non_neg_integer(),
         acc_num = 0 :: non_neg_integer(),
         cup = 1000 :: non_neg_integer(),
         roll_time = 0,
         roll_id = 0,
         roll_graph = []}).

-record(arena_role,
        {id = {0, "", 0} :: tuple(),
         ver = 6,
         name = "" :: bitstring(),
         win = 0 :: non_neg_integer(),
         acc_num = 0,
         sex = 0 :: 0..1,
         classes = 0 :: 0..4,
         lev = 0 :: non_neg_integer(),
         last_time = 0 :: non_neg_integer(),
         is_robot = 0 :: 0..1,
         cup = 0,
         next_log_id = 1,
         log = [],
         win_list = [],
         win_ratio = 0,
         day_time_flag = 0,
         enemy = [],
         day_win = 0,
         day_lost = 0,
         def_acc_num = 0,
         def_win = 0,
         max_cup = 1000,
         acc_sword_num = 0,
         acc_mage_num = 0,
         acc_archer_num = 0,
         acc_orc_num = 0,
         acc_devine_num = 0,
         acc_moon_num = 0,
         acc_templar_num = 0,
         win_sword = 0,
         win_mage = 0,
         win_archer = 0,
         win_orc = 0,
         win_devine = 0,
         win_moon = 0,
         win_templar = 0,
         init_def = 0,
         formation = 1,
         formation_lev = 1,
         guards = [],
         last_win_role}).

-record(arena_enemy,
        {order = 0,
         role_id = {0, "", 0},
         is_robot = 0,
         classes = 0,
         lev = 0,
         sex = 0,
         cup = 0,
         soul = 1}).

-record(arena_log,
        {log_id = 1,
         s_role_id = {0, "", 0} :: tuple(),
         s_name = "" :: list(),
         result = 0 :: 0..1,
         t_role_id = {0, "", 0} :: tuple(),
         t_name = "" :: list(),
         time = 0 :: non_neg_integer(),
         s_cup = 0,
         t_cup = 0,
         s_cup_change = 0,
         t_cup_change = 0,
         feedback = 0}).

-record(arena_role_index,
        {id = {0, "", 0},
         lev = 0,
         cup = 0,
         time = 0,
         day_time_flag = 0,
         day_win = 0,
         day_lost = 0,
         win_list = [],
         win_ratio = 0}).

-record(arena_robot,
        {id = {0, "robot", 0},
         lev = 0,
         name = "",
         classes = 0,
         sex = 0,
         cup = 0}).

-record(arena_graph,
        {id = 1,
         base_id = 0,
         num = 0,
         status = 0,
         quality = 0}).

-record(arena_graph_base,
        {id = 1,
         base_id = 0,
         num = 0,
         quality = 0,
         name = "",
         sex = 0,
         classes = 0,
         lev_low = 0,
         lev_high = 0,
         ratio = 0,
         times = 1,
         order_list = []}).

-file("src/gm_cmd.erl", 49).

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

-file("src/gm_cmd.erl", 50).

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

-file("src/gm_cmd.erl", 51).

-file("inc/constellation.hrl", 1).

-record(m_constellation,
        {ver = 2,
         lev = 0 :: non_neg_integer(),
         finished = [],
         summoned = []}).

-record(constellation_first,
        {key = {0, 0},
         ver = 0,
         lev = 0 :: non_neg_integer(),
         winner = [],
         mtime = 0,
         base_id = 0}).

-record(constellation_unit,
        {id = {0, 0},
         lev = 0,
         base_id = 0,
         map_id = 0,
         x = 0,
         y = 0,
         fail = 0,
         guards = []}).

-record(constellation_winner,
        {ver = 0,
         id = {0, "", 0},
         name = "" :: string(),
         classes = 0 :: non_neg_integer(),
         sex = 0 :: non_neg_integer(),
         looks = [],
         finished = 0 :: non_neg_integer(),
         round = 0 :: non_neg_integer(),
         is_leader = 0 :: non_neg_integer()}).

-record(constellation_summoned,
        {ver = 2,
         lev = 0 :: non_neg_integer(),
         base_id = 0 :: non_neg_integer(),
         map = 0 :: non_neg_integer(),
         x = 0 :: non_neg_integer(),
         y = 0 :: non_neg_integer(),
         time = 0 :: non_neg_integer()}).

-record(constellation_role,
        {id = {0, "", 0},
         name = "" :: string(),
         classes = 0 :: non_neg_integer(),
         sex = 0 :: non_neg_integer(),
         id_now = 0 :: non_neg_integer(),
         title_lev = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         max_kill = 0 :: non_neg_integer()}).

-record(constellation_first_data,
        {min = 0, max = 0, rate = 0, attr = []}).

-record(constellation_guard,
        {id = {0, "", 0},
         name = "",
         lev = 0,
         sex = 0,
         classes = 0,
         looks = [],
         base_id = 0}).

-file("src/gm_cmd.erl", 52).

-file("inc/goal.hrl", 1).

-record(m_goal,
        {ver = 2 :: non_neg_integer(),
         finish = [] :: [pos_integer()],
         doing = [] :: [tuple()],
         day_reward = [] :: [],
         days = 0 :: non_neg_integer(),
         day_time = 0 :: non_neg_integer(),
         discount = [],
         count_reward = []}).

-file("src/gm_cmd.erl", 53).

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

-file("src/gm_cmd.erl", 54).

-file("inc/tournament.hrl", 1).

-record(m_tournament,
        {ver = 3 :: non_neg_integer(),
         triggers = [] :: list(),
         status = 0 :: non_neg_integer(),
         rewarded = [] :: list(),
         pk_type = 0,
         kingbadgenum = 0,
         starlev = 0,
         kingbadge = [] :: list(),
         showbadge = 0}).

-record(tournament_profile,
        {id = {0, "", 0} :: tuple(),
         ver = 11 :: non_neg_integer(),
         name = "" :: string(),
         lev = 0 :: non_neg_integer(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         rank_lev = 1 :: non_neg_integer(),
         rank_point = 0 :: non_neg_integer(),
         liked = 0 :: non_neg_integer(),
         liked_other = 0 :: non_neg_integer(),
         last_matched = 0 :: non_neg_integer(),
         day_matched = 0 :: non_neg_integer(),
         day_win = 0 :: non_neg_integer(),
         day_win_sustained = 0 :: non_neg_integer(),
         season_rank_lev = 1 :: non_neg_integer(),
         season_rank_point = 0 :: non_neg_integer(),
         combat_count = 0 :: non_neg_integer(),
         win_count = 0 :: non_neg_integer(),
         win_sustained = 0 :: non_neg_integer(),
         season_kill = 0 :: non_neg_integer(),
         season_reverse = 0 :: non_neg_integer(),
         season_revive = 0 :: non_neg_integer(),
         season_dmg = 0 :: non_neg_integer(),
         season_bearing_dmg = 0 :: non_neg_integer(),
         season_zero_dmg = 0 :: non_neg_integer(),
         season_pet_revive = 0 :: non_neg_integer(),
         best_rank_point = 0 :: non_neg_integer(),
         best_rank_lev = 1 :: non_neg_integer(),
         best_win_count = 0 :: non_neg_integer(),
         best_win_sustained = 0 :: non_neg_integer(),
         best_partner = [] :: list(),
         week_rank_lev = 1 :: non_neg_integer(),
         week_rank_point = 0 :: non_neg_integer(),
         awesome_kill = 0 :: non_neg_integer(),
         awesome_kill_num = 0 :: non_neg_integer(),
         awesome_dmg = 0 :: non_neg_integer(),
         awesome_heal = 0 :: non_neg_integer(),
         awesome_control = 0 :: non_neg_integer(),
         mvp = 0 :: non_neg_integer(),
         loss_mvp = 0 :: non_neg_integer(),
         season_awesome_kill = 0 :: non_neg_integer(),
         season_awesome_kill_num = 0 :: non_neg_integer(),
         season_awesome_dmg = 0 :: non_neg_integer(),
         season_awesome_heal = 0 :: non_neg_integer(),
         season_awesome_control = 0 :: non_neg_integer(),
         season_mvp = 0 :: non_neg_integer(),
         season_loss_mvp = 0 :: non_neg_integer(),
         consecutive_lost = 0 :: non_neg_integer(),
         reported = 0 :: non_neg_integer(),
         reported_other = 0 :: non_neg_integer(),
         reported_logs = [] :: list(),
         banned_date = 0 :: non_neg_integer(),
         reported_single_match = 0,
         is_auto_combat = 0,
         guards = [],
         historical_high = 0 :: non_neg_integer(),
         show_badge_id = 0 :: non_neg_integer(),
         promotion_win = 0 :: non_neg_integer(),
         upgrade_point = 0 :: non_neg_integer()}).

-record(tournament_role,
        {id = {0, "", 0} :: tuple(),
         status = 0 :: non_neg_integer(),
         name = "" :: string(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         fc = 0 :: non_neg_integer(),
         looks = [] :: list(),
         times = 1 :: non_neg_integer(),
         point = 1 :: non_neg_integer(),
         rank_lev = 1 :: non_neg_integer(),
         rank_point = 0 :: non_neg_integer(),
         pid :: undefined | pid() | 0,
         is_online = 0 :: 0 | 1,
         match_id = 0 :: non_neg_integer(),
         side = 0 :: non_neg_integer(),
         is_leader = 0 :: 0 | 1,
         last_matched = 0 :: non_neg_integer(),
         team_id = [] :: list(),
         formation_id = 1 :: non_neg_integer(),
         formation_lev = 1 :: non_neg_integer(),
         partner = [] :: list(),
         consecutive_lost = 0 :: non_neg_integer(),
         reported = 0 :: non_neg_integer(),
         guards = [],
         show_badge_id = 0 :: non_neg_integer()}).

-record(tournament_team,
        {ids = [] :: list(),
         output_num = 0 :: non_neg_integer(),
         assist_num = {0, 0} ::
             {non_neg_integer(), non_neg_integer()},
         origin_ids = [] :: list(),
         num = 1 :: non_neg_integer(),
         sum_point = 0 :: non_neg_integer(),
         max_point = 0 :: non_neg_integer(),
         min_point = 0 :: non_neg_integer(),
         sum_lev = 0 :: non_neg_integer(),
         max_lev = 0 :: non_neg_integer(),
         min_lev = 0 :: non_neg_integer(),
         tried_match = 0 :: non_neg_integer(),
         match_id = 0 :: non_neg_integer(),
         usurpers = [] :: list(),
         order = [] :: list(),
         classes = [] :: list()}).

-record(tournament_match,
        {id = 0 :: non_neg_integer(),
         teams = [] :: list(),
         time = 0 :: non_neg_integer(),
         combat_pid :: undefined | pid(),
         calc_args = [] :: list()}).

-record(tournament_usurper,
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

-record(tournament_celebrity,
        {id = {0, "", 0} :: tuple(),
         name = "" :: string(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         val1 = 0 :: non_neg_integer(),
         val2 = 0 :: non_neg_integer()}).

-record(tournament_fighter,
        {id = {0, "", 0} :: tuple(),
         name = "" :: string(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         rank_lev = 1 :: non_neg_integer(),
         rank_point = 0 :: non_neg_integer(),
         kill_num = 0,
         dead_num = 0,
         total_heal = 0,
         control_num = 0,
         total_hurt = 0 :: non_neg_integer(),
         total_dmg = 0 :: non_neg_integer(),
         mvp_score = 0 :: non_neg_integer()}).

-record(tournament_season_role,
        {ver = 0,
         id = {0, "", 0} :: tuple(),
         name = "" :: string(),
         reward_lev = 0 :: non_neg_integer(),
         rewarded = 0 :: non_neg_integer()}).

-record(tournament_result,
        {id = {0, "", 0},
         ver = 3,
         is_win = 1,
         mates = [],
         rival = [],
         match_id = 0,
         record_pz = {"", 0} :: tuple(),
         time = 0,
         rank_lev = 0}).

-record(tournament_result_role,
        {id = {0, "", 0},
         ver = 1,
         recent = [],
         last_recent = []}).

-record(king_badge,
        {id = 0,
         status = 0,
         active_effect_type = 3,
         active_attr = [],
         fc = 0}).

-record(tournament_match_report_info,
        {match_id, can_report = [], result}).

-file("src/gm_cmd.erl", 55).

-file("inc/charge_gift.hrl", 1).

-record(m_charge_gift,
        {ver = 1,
         flag = 0,
         login_time = 0,
         check_time = 0,
         start_time = 0,
         keep_time = 0,
         pay_time = 0,
         end_time = 0,
         check_time_list = [],
         acc = 0,
         return = 0,
         num = 0,
         list = []}).

-record(charge_gift_data,
        {min = 0,
         max = 0,
         group = 0,
         gold = 0,
         charge_gold = 0,
         num = 0,
         list = [],
         title = "",
         msg = ""}).

-record(charge_gift_server, {white = [], black = []}).

-file("src/gm_cmd.erl", 56).

-file("inc/camp_web.hrl", 1).

-record(m_camp_web,
        {ver = 4 :: non_neg_integer(),
         acc = [] :: list(),
         can_reward = [] :: list(),
         rewarded = [] :: list(),
         overdue_time = 0 :: non_neg_integer(),
         end_reward = [] :: list(),
         time_list = [] :: list(),
         card_info = {0, 0, 0, []} :: tuple()}).

-record(camp_web_ico,
        {id = 0 :: non_neg_integer(),
         name = "" :: bitstring(),
         title = "" :: bitstring(),
         ico = "" :: bitstring(),
         alert = "" :: bitstring(),
         gif = "" :: bitstring(),
         start_time = 0 :: non_neg_integer(),
         end_time = 0 :: non_neg_integer(),
         login_open = 0 :: non_neg_integer(),
         is_show_time = 0 :: 0..1,
         menu_list = [] :: list()}).

-record(camp_web_menu,
        {id = 0 :: non_neg_integer(),
         type = 0 :: non_neg_integer(),
         sec_type = 0 :: non_neg_integer(),
         settlement = 0 :: non_neg_integer(),
         reward_mod = 0 :: non_neg_integer(),
         mail_title = "" :: bitstring(),
         mail_content = "" :: bitstring(),
         title = "" :: bitstring(),
         title2 = "" :: bitstring(),
         ico = "" :: bitstring(),
         title_ico = "" :: bitstring(),
         type_ico = "" :: bitstring(),
         total_ico = 0 :: non_neg_integer(),
         start_time = 0 :: non_neg_integer(),
         end_time = 0 :: non_neg_integer(),
         sort_val = 0 :: non_neg_integer(),
         top_banner = "" :: bitstring(),
         rule_str = "" :: bitstring(),
         time_str = "" :: bitstring(),
         bottom_alert = "" :: bitstring(),
         reward_title = "" :: bitstring(),
         panel_type = "" :: bitstring(),
         cli_reward = "" :: bitstring(),
         button_text = "" :: bitstring(),
         is_button = 0 :: 0..1,
         notice_msg = "" :: bitstring(),
         camp_list = [] :: list(),
         is_tran = 0,
         tran_info = ""}).

-record(camp_web,
        {id = 0 :: non_neg_integer(),
         n = 1 :: pos_integer(),
         key = {0, 0} :: tuple(),
         type = 0 :: non_neg_integer(),
         sec_type = 0 :: non_neg_integer(),
         third_type = 0 :: non_neg_integer(),
         settlement = 0 :: non_neg_integer(),
         reward_num = 1 :: non_neg_integer(),
         reward_can = 0 :: non_neg_integer(),
         value = 0 :: non_neg_integer(),
         tar_val = 0 :: non_neg_integer(),
         ext_val = 0 :: non_neg_integer(),
         status = 0 :: 0..2,
         cond_msg = "" :: bitstring(),
         loss_items = [] :: list(),
         items = [] :: list(),
         val1 = 0 :: non_neg_integer(),
         val2 = 0 :: non_neg_integer(),
         val3 = 0 :: non_neg_integer(),
         val4 = 0 :: non_neg_integer(),
         str1 = "" :: bitstring(),
         str2 = "" :: bitstring(),
         str3 = "" :: bitstring(),
         str4 = "" :: bitstring(),
         extra = [],
         data :: undefined | any(),
         is_desc = 0 :: 0..1}).

-record(camp_handle,
        {time = 0 :: non_neg_integer(),
         evt = {evt_rpc} :: tuple(),
         total_camp :: undefined | #camp_web_ico{},
         menu :: undefined | #camp_web_menu{},
         camp :: undefined | #camp_web{},
         call_form = rpc :: evt | rpc,
         add_can_reward = 0 :: non_neg_integer(),
         rpc_reward_num = 1 :: non_neg_integer(),
         push_cli = 0 :: 0..1,
         push_list = [] :: [tuple()],
         to_id,
         return_acc = 0}).

-file("src/gm_cmd.erl", 57).

-file("inc/handbook.hrl", 1).

-record(m_handbook,
        {ver = 4,
         book_list = [],
         set_list = [],
         auto_book_id = 0,
         store_items = [],
         next_time = 0,
         need_list = [],
         ban_speed_set_list = []}).

-record(handbook_item,
        {idx = 0, id = 0, num = 1, val = 0, flag = 0}).

-record(handbook,
        {ver = 4,
         id = 0,
         status = 0,
         active_step = 0,
         star_step = 0,
         star_val = 0,
         transform_point = 0,
         active_effect_type = 3,
         active_attr = [],
         star_effect_type = 1,
         star_effect_list = [],
         star_attr = [],
         add_point = 0}).

-record(handbook_base,
        {id,
         name = "",
         level_limit = 0,
         lev = 0,
         grade_lev = 1,
         grade_type = 1,
         effect_type = 1,
         active_reward = [],
         set_id = [],
         allow_item = [],
         active_loss = [],
         star_loss = [],
         transform_point = 1,
         max_active_step = 2,
         max_star_step = 2,
         fc = 0,
         fc1 = 0,
         fc2 = 0,
         fuse_flag = 0,
         fuse_id = 0,
         times = 0,
         illusion_id = 0,
         fuse_num1 = 0,
         lev_num1 = 0,
         fuse_num2 = 0,
         lev_num2 = 0,
         fuse_num3 = 0,
         lev_num3 = 0,
         target_id = 0,
         universal = 0,
         bind = 1}).

-file("src/gm_cmd.erl", 58).

-file("inc/glory.hrl", 1).

-record(m_glory,
        {ver = 2,
         id = 0,
         title_id = 0,
         end_time = 0,
         new_id = 0,
         new_title_id = 0,
         switch_time = 0,
         max_id = 0,
         mtime = 0,
         reset_time = 0,
         last_week = 0,
         reward_list = [],
         day_reward = 0,
         lost_times = 0}).

-record(glory_role,
        {id = {0, "", 0},
         classes = 0,
         name = "",
         sex = 0,
         lev = 0,
         new_id = 0,
         max_id = 0,
         new_title_id = 0,
         mtime = 0,
         reset_time = 0,
         last_week = 0,
         update_time = 0,
         day_reward = 0}).

-record(glory_floor,
        {floor = 0,
         ver = 0,
         first = [],
         role_list = [],
         max_list = [],
         record_list = [],
         num = 0}).

-record(glory_rank_data,
        {min = 0, max = 0, reward = []}).

-record(glory_open_rank_data,
        {min = 0,
         max = 0,
         open = 0,
         reward = [],
         title = "",
         content = "",
         honor_id = 0}).

-record(glory_lev_data,
        {id = 0,
         name = "",
         title_id = 0,
         need_title_id = 0,
         need_lev = 0,
         need_fc = 0,
         fc_del = 0,
         fc_add = 0,
         lev_break = 0,
         unit_id = 0,
         all_point = 0,
         guard_num = 0,
         skill_prac = [],
         skill_prac_lev = [],
         first_reward = [],
         first_exp_mod = 0,
         normal_reward = [],
         normal_exp_mod = 0,
         day_reward = [],
         day_exp_mod = 0,
         buff_num = 0,
         buff_id = 0}).

-record(glory_title_data,
        {title_id = 0,
         next_title_id = 0,
         title_name = "",
         honor_id = 0,
         rate = 0}).

-file("src/gm_cmd.erl", 59).

-file("inc/lev_break.hrl", 1).

-record(m_lev_break,
        {ver = 0,
         trial = 0 :: non_neg_integer(),
         done = 0 :: non_neg_integer(),
         times = 0 :: non_neg_integer(),
         attr_point = 0 :: non_neg_integer()}).

-file("src/gm_cmd.erl", 60).

-file("inc/brave_trial.hrl", 1).

-record(m_brave_trial,
        {ver = 2,
         id = 0 :: integer(),
         done_list = [] :: list(),
         rewarded = [] :: list(),
         last_accepted = 0 :: integer(),
         time_span = 0 :: integer(),
         triggers = [],
         star = 0 :: integer(),
         gains = []}).

-record(brave_trial_team,
        {ver = 0,
         id = [] :: list(),
         time_span = 0 :: integer(),
         members = [],
         star = 0 :: non_neg_integer(),
         rank = 0 :: non_neg_integer()}).

-record(brave_trial_role,
        {ver = 0,
         id = {0, "", 0},
         name = "" :: string(),
         sex = 0 :: 0 | 1,
         classes = 0 :: 0..5,
         time_span = 0 :: integer(),
         rank = 0 :: non_neg_integer(),
         star = 0 :: non_neg_integer(),
         is_leader = 0 :: 0 | 1}).

-file("src/gm_cmd.erl", 61).

-file("inc/sworn.hrl", 1).

-record(m_sworn,
        {ver = 0 :: pos_integer(),
         id = {0, "", 0} ::
             {pos_integer(), list(), non_neg_integer()},
         status = 0 :: non_neg_integer(),
         name = "" :: string(),
         name_defined = "" :: string(),
         time = 0 :: list()}).

-record(sworn_role,
        {ver = 0 :: pos_integer(),
         role_id = 0 :: non_neg_integer(),
         id = 0 :: non_neg_integer(),
         name = "" :: string(),
         name_defined = "" :: string(),
         status = 0 :: non_neg_integer()}).

-record(sworn,
        {ver = 0 :: pos_integer(),
         id = {0, "", 0} ::
             {pos_integer(), list(), non_neg_integer()},
         name = "" :: string(),
         time = 0 :: non_neg_integer(),
         sworn_val = 0 :: non_neg_integer(),
         status = 0 :: non_neg_integer(),
         num = 0 :: non_neg_integer(),
         head = 0 :: non_neg_integer(),
         pos = 0 :: non_neg_integer(),
         timeout = 0 :: non_neg_integer(),
         times = 0 :: non_neg_integer(),
         members = [] :: list(),
         votes = [] :: list(),
         trends = [] :: list(),
         lists = [] :: list()}).

-record(sworn_member,
        {ver = 0 :: pos_integer(),
         pos = 0 :: non_neg_integer(),
         role_id = {0, "", 0} ::
             {pos_integer(), list(), non_neg_integer()},
         name = "" :: string(),
         name_defined = "" :: string(),
         lev = 0 :: pos_integer(),
         classes = 0 :: pos_integer(),
         sex = 0 :: pos_integer(),
         times = 0 :: pos_integer(),
         free = 0 :: pos_integer()}).

-record(sworn_trend,
        {type = 0 :: non_neg_integer(),
         id = {0, "", 0} ::
             {pos_integer(), list(), non_neg_integer()},
         name = "" :: string(),
         r_id = {0, "", 0} ::
             {pos_integer(), list(), non_neg_integer()},
         r_name = "" :: string(),
         r_lev = 0 :: non_neg_integer(),
         r_sex = 0 :: non_neg_integer(),
         r_classes = 0 :: non_neg_integer(),
         rename = "" :: string(),
         timeout = 0 :: non_neg_integer(),
         time = 0 :: non_neg_integer(),
         reason_id = 0 :: non_neg_integer(),
         reason_msg = "" :: string(),
         votes = [] :: list(),
         agree = 0 :: non_neg_integer(),
         lists = [] :: list()}).

-record(sworn_evt,
        {role_id = {0, "", 0} ::
             {pos_integer(), list(), non_neg_integer()},
         finish = 0 :: non_neg_integer(),
         skill = 0 :: non_neg_integer(),
         invite = 0 :: non_neg_integer(),
         prefix = 0 :: non_neg_integer(),
         personal = 0 :: non_neg_integer()}).

-file("src/gm_cmd.erl", 62).

-file("inc/world_boss.hrl", 1).

-record(world_boss,
        {ver = 1 :: non_neg_integer(),
         id = 0 :: non_neg_integer(),
         first_killer = [],
         round_first = [],
         round_killer = [],
         killer_rank = [],
         last_killed = 0 :: non_neg_integer(),
         last_respawn = 0 :: non_neg_integer(),
         total_killed = 0 :: non_neg_integer(),
         is_rewarded = false :: true | false,
         is_rewarded_first = false :: true | false,
         map_id = 0 :: non_neg_integer(),
         x = 0 :: non_neg_integer(),
         y = 0 :: non_neg_integer(),
         recent_killer = []}).

-record(world_boss_killer,
        {ver = 0,
         id = {0, "", 0},
         name = "" :: string(),
         classes = 0 :: non_neg_integer(),
         sex = 0 :: non_neg_integer(),
         looks = [],
         finished = 0 :: non_neg_integer(),
         round = 0 :: non_neg_integer(),
         is_leader = 0 :: non_neg_integer()}).

-record(world_boss_winner,
        {ver = 0,
         id = {0, "", 0},
         name = "" :: string(),
         rewarded = 0 :: non_neg_integer(),
         last_rewarded = 0 :: non_neg_integer()}).

-file("src/gm_cmd.erl", 63).

-file("inc/talisman.hrl", 1).

-record(m_talisman,
        {ver = 5,
         next_id = 1,
         use_plan = 1,
         plan_1 = [],
         plan_2 = [],
         items = [],
         fusion_lev = 0,
         fusion_val = 0,
         skills = [],
         fc = 0,
         remold_formula = [],
         last_gain_id = 0,
         volume = 48}).

-record(talisman,
        {ver = 3,
         id = 1,
         base_id = 0,
         type = 0,
         quality = 0,
         lev = 0,
         attr = [],
         num = 1,
         fc = 0}).

-record(talisman_base,
        {base_id = 0,
         name = "",
         type = 0,
         quality = 0,
         lev = 0,
         need_lev = 0,
         need_lev_break = 0,
         set_id = 0,
         fusion_val = 0,
         base_attr = [],
         grade = 0}).

-file("src/gm_cmd.erl", 64).

-file("inc/camp_sign.hrl", 1).

-record(camp_sign,
        {date = {0, 0, 0}, num = 0, camp_id = 0}).

-record(camp_sign_data,
        {num = 0, item_list = [], cost = []}).

-file("src/gm_cmd.erl", 65).

-file("inc/pay_turn.hrl", 1).

-record(m_pay_turn, {lucky = 0, list = []}).

-record(pay_turn_data,
        {id = 0,
         item_id = 0,
         bind = 0,
         num = 0,
         type = 0,
         sex = 0,
         classes = 0,
         min_lev = 0,
         max_lev = 0,
         min_lev_break = 0,
         max_lev_break = 0,
         is_cast = 0,
         lucky = 0,
         reset_lucky = 0,
         must = 0,
         min_lucky = 0,
         max_lucky = 0,
         weigth = 0}).

-file("src/gm_cmd.erl", 66).

-file("inc/camp_7_7th.hrl", 1).

-author("jia").

-record(camp_7_7th_sign,
        {id = {0, "", 0},
         name = "",
         classes = 0,
         head_id = 0,
         sex = 0 :: 0..2,
         lev = 0,
         time,
         msg = "",
         is_sign = 0,
         online = 0}).

-record(m_camp_7_7th,
        {other_id = {0, "", 0},
         other_name = "",
         other_sex = 0,
         other_lev = 0,
         other_classes = 0,
         status = 0,
         point = 0,
         get_times = 1,
         time = 0}).

-record(camp_7_7th_link,
        {id = {0, "", 0}, is_break = 0}).

-file("src/gm_cmd.erl", 67).

-file("inc/exquisite_shelf.hrl", 1).

-record(m_exquisite_shelf,
        {ver = 2,
         wave = 0,
         shelf_id = 0,
         shelf_pid,
         pos_wave = 0,
         card_info = [],
         help_times = 0,
         is_get_help = 0}).

-record(exquisite_shelf_util,
        {id = 0,
         cross_type = 0,
         pid = 0,
         battle_id = 0,
         wave_info = [],
         wave = 1,
         lev = 1,
         challenges = [],
         create_time = 0}).

-record(exquisite_shelf_wave_info,
        {wave = 0,
         map_base_id = 0,
         map_id = 0,
         map_pid,
         units = [],
         status = 0}).

-record(exquisite_shelf_card_info,
        {wave = 1,
         shelf_lev = 1,
         type = 2,
         normal_card = [],
         gold_card = []}).

-record(exquisite_shelf_card_item,
        {index = 1,
         item_id = 0,
         num = 0,
         is_get = 0,
         is_notice = 0,
         is_show = 0}).

-record(exquisite_shelf_fast_combat_record,
        {shelf_wave = {0, 0},
         use_time = 0,
         record_id = {0, {0, "", 0}}}).

-file("src/gm_cmd.erl", 68).

-file("inc/camp_black_white_chess.hrl", 1).

-record(black_white_chess_role,
        {id = {0, "", 0},
         pid,
         status = 0,
         name = "",
         sex = 0,
         classes = 0,
         lev = 0,
         looks = [],
         self_grade = 0,
         grade = 0,
         score = 0,
         all_score = 0,
         start_match_time = 0,
         last_color = 1,
         fail_do_times = 0,
         max_change_in_round = 0,
         match_fail_times = 0}).

-record(black_white_chess_game_state,
        {id = 0,
         black_role,
         white_role,
         round = 0,
         round_end_time = date:unixtime(),
         round_start_time_stamp = date:now2(),
         timeout = 20 * 1000,
         m_probable_use_pos = [],
         m_black_can_use_pos = [],
         m_white_can_use_pos = [],
         m_chess = [],
         m_change_chess = [],
         do_flag = false,
         game_type = 1,
         skip_flag = false,
         ask_draw_flag = false,
         ask_draw_time_stamp = date:unixtime(),
         black_keep_ahead_round = 0,
         white_keep_ahead_round = 0,
         is_comeback = 0}).

-record(m_black_white_chess,
        {grade = 1, score = 0, all_score = 0, last_color = 1}).

-file("src/gm_cmd.erl", 68).

-spec save() -> ok.

save() ->
    Content = help(cmds()),
    File = "./gm_cmd.txt",
    case file:write_file(File,
                         unicode:characters_to_binary(Content))
        of
        ok ->
            case os:type() of
                {win32, _} ->
                    io:format("~ts",
                              [io_lib:format("> 已生成GM命令文件: ~ts~n", [File])]);
                _ ->
                    io:format("~ts",
                              [io_lib:format("> 已生成GM命令文件: ~ts~n", [File])])
            end;
        Err1 ->
            case os:type() of
                {win32, _} ->
                    io:format("~ts",
                              [io_lib:format("> 生成文件[~ts]时发生异常: ~w~n",
                                             [File, Err1])]);
                _ ->
                    io:format("~ts",
                              [io_lib:format("> 生成文件[~ts]时发生异常: ~w~n",
                                             [File, Err1])])
            end
    end.

-spec cmds() -> [#gm_cmd{}].

cmds() ->
    [#gm_cmd{cmd = "help",
             args = [{string, "GM命令关键词, 不填为所有", ""}],
             desc = "显示相关GM命令帮助信息",
             do =
                 fun ([Keyword], _Role) ->
                         Cmds = [Cmd
                                 || Cmd = #gm_cmd{cmd = Desc} <- cmds(),
                                    re:run(unicode:characters_to_binary(Desc),
                                           unicode:characters_to_binary(Keyword),
                                           [{capture, none}, caseless])
                                        =:= match],
                         {reply, help(Cmds)}
                 end},
     #gm_cmd{cmd = "goto",
             args =
                 [{int, "地图ID", 10001},
                  {int, "x坐标", 0},
                  {int, "y坐标", 0}],
             desc = "将当前角色传送到指定地点",
             do =
                 fun ([MapId, X, Y], Role) ->
                         case role_misc:check_event(Role) of
                             {false, Reason} -> {false, Reason};
                             true ->
                                 {ToX, ToY} = case map_data:get(MapId) of
                                                  {ok,
                                                   #map_data{revive =
                                                                 [{X0, Y0}]}}
                                                      when X =:= 0 andalso
                                                               Y =:= 0 ->
                                                      {X0, Y0};
                                                  _ -> {X, Y}
                                              end,
                                 case map:role_enter({MapId, ToX, ToY}, Role) of
                                     {error, Reason} -> {reply, Reason};
                                     {ok, NewRole} -> {ok, NewRole}
                                 end
                         end
                 end},
     #gm_cmd{cmd = "获取物品",
             args =
                 [{int, "BaseId"}, {int, "Num", 1}, {int, "bind", 0}],
             desc = "获取一个物品",
             do =
                 fun ([BaseId, Num, Bind], Role) ->
                         GL = format:val_to_gain([{BaseId, Bind, Num}]),
                         case role_gain:do(GL, Role) of
                             {false, G} -> {reply, G#gain.msg};
                             {ok, NewRole} -> {ok, NewRole}
                         end
                 end},
     #gm_cmd{cmd = "清空BUFF", args = [], desc = "清空角色全部buff",
             do =
                 fun ([], Role) ->
                         case buff:gm_clean(Role) of
                             {ok, NewRole} -> {ok, NewRole};
                             {false, Reason} -> {reply, Reason}
                         end
                 end},
     #gm_cmd{cmd = "清空排行榜", args = [], desc = "清空相关排行榜数据",
             do =
                 fun ([], _Role) ->
                         rank_mgr:cast({clear, all}),
                         ok
                 end},
     #gm_cmd{cmd = "更新排行榜", args = [], desc = "更新排行榜数据",
             do =
                 fun ([], _Role) ->
                         arena_mgr ! zero_update_rank,
                         rank_mgr ! gm_update_hour_zero,
                         glory_mgr ! update_hour_zero,
                         friend_zone ! update_rank,
                         camp_dragon_boat ! update_rank,
                         ok
                 end},
     #gm_cmd{cmd = "上线时间后退", args = [{int, "小时", 1}],
             desc = "上线时间后退",
             do =
                 fun ([Int], _Role = #role{id = Id}) ->
                         case friend:fetch(by_id, Id) of
                             Data = #friend_role{online_time = OnlineTime} ->
                                 friend:update(friend_role,
                                               Data#friend_role{online_time =
                                                                    max(0,
                                                                        OnlineTime
                                                                            -
                                                                            Int
                                                                                *
                                                                                3600)}),
                                 ok;
                             _ -> ok
                         end
                 end},
     #gm_cmd{cmd = "滚动广播",
             args =
                 [{string, "内容", "滚动广播内容"},
                  {int, "类型", 5},
                  {int, "开始时间", date:unixtime() + 10},
                  {int, "结束时间", date:unixtime() + 3600},
                  {int, "间隔时间", 180}],
             desc = "滚动广播",
             do =
                 fun ([Msg, Type, ST, ET, IntervalTime],
                      _Role = #role{}) ->
                         NST = case ST of
                                   0 -> date:unixtime() - 3600;
                                   V when V >= 3 * 86400 -> ST;
                                   _ -> date:unixtime() + ST
                               end,
                         NET = case ET of
                                   0 -> date:unixtime() - 1800;
                                   V2 when V2 >= 3 * 86400 -> ET;
                                   _ -> date:unixtime() + ET
                               end,
                         _Result =
                             db:exec("INSERT INTO sys_notice_scroll (id, type, "
                                     "start_time, end_time, interval_time, "
                                     "msg) VALUES(?, ?, ?, ?, ?, ?)",
                                     [date:unixtime(),
                                      Type,
                                      NST,
                                      NET,
                                      IntervalTime,
                                      Msg]),
                         logger:debug("滚动广播写入mysql：~w", [_Result], gm_cmd, 211),
                         notice_board:reload_scroll(),
                         ok
                 end},
     #gm_cmd{cmd = "设世界等级", args = [{int, "档次", 1}],
             desc = "设置世界等级档次",
             do =
                 fun ([Val], _Role) ->
                         world_lev:gm_set(Val),
                         ok
                 end},
     #gm_cmd{cmd = "活动排行榜下阶段", args = [], desc = "活动排行榜下阶段",
             do =
                 fun ([], _Role) ->
                         campaign_rank_mgr:m(),
                         ok
                 end},
     #gm_cmd{cmd = "爵位周一五点", args = [], desc = "爵位周一五点",
             do =
                 fun ([], Role) ->
                         glory_mgr ! gm_week_reset,
                         glory_new:gm_week_reset(Role)
                 end},
     #gm_cmd{cmd = "爵位周一零点", args = [], desc = "爵位周一零点",
             do =
                 fun ([], _Role) ->
                         glory_mgr ! gm_week_zero,
                         ok
                 end},
     #gm_cmd{cmd = "世界等级排行榜下阶段",
             args = [{int, "活动类型", 60020}], desc = "活动排行榜下阶段",
             do =
                 fun ([SecType], _Role) ->
                         campaign_rank_mgr:next(SecType),
                         ok
                 end},
     #gm_cmd{cmd = "清世界等级活动", args = [], desc = "活动排行榜下阶段",
             do =
                 fun ([], _Role) ->
                         ets:delete_all_objects(camp_time),
                         ok
                 end},
     #gm_cmd{cmd = "设转盘幸运值", args = [{int, "幸运值", 1}],
             desc = "设转盘幸运值",
             do =
                 fun ([Val], Role = #role{m_pay_turn = MPayTurn}) ->
                         NewRole = Role#role{m_pay_turn =
                                                 MPayTurn#m_pay_turn{lucky =
                                                                         Val}},
                         pay_turn:push(NewRole),
                         {ok, NewRole}
                 end},
     #gm_cmd{cmd = "获得花语", args = [{int, "花语ID", 1}],
             desc = "获得花语",
             do =
                 fun ([Val],
                      Role = #role{m_camp_collection =
                                       MCampCollection =
                                           #camp_collection{reward_list =
                                                                OldR}}) ->
                         RewardList = case Val of
                                          0 ->
                                              [{Flower, Index, 1}
                                               || {Flower, Index}
                                                      <- campaign_collection_data:get_all_flowers()];
                                          FlowerID ->
                                              [{Flower, Index, 1}
                                               || {Flower, Index}
                                                      <- campaign_collection_data:get_all_flowers(),
                                                  Flower =:= FlowerID]
                                      end,
                         RewardList2 = lists:foldl(fun ({Flower, Index, Add},
                                                        Acc) ->
                                                           case
                                                               lists:keytake(Index,
                                                                             2,
                                                                             Acc)
                                                               of
                                                               {value,
                                                                {_,
                                                                 Index,
                                                                 OldNum},
                                                                Rest} ->
                                                                   [{Flower,
                                                                     Index,
                                                                     OldNum +
                                                                         Add}
                                                                    | Rest];
                                                               _ ->
                                                                   [{Flower,
                                                                     Index,
                                                                     Add}
                                                                    | Acc]
                                                           end
                                                   end,
                                                   OldR,
                                                   RewardList),
                         NewRole = Role#role{m_camp_collection =
                                                 MCampCollection#camp_collection{reward_list
                                                                                     =
                                                                                     RewardList2}},
                         pay_turn:push(NewRole),
                         {ok, NewRole}
                 end},
     #gm_cmd{cmd = "砍价", args = [], desc = "",
             do =
                 fun ([], Role) -> camp_cut_price:gm_cut_price(Role)
                 end},
     #gm_cmd{cmd = "砍一点钱", args = [{int, "钱", 1}], desc = "",
             do =
                 fun ([Price], Role) ->
                         camp_cut_price:gm_cut_price(Role, Price)
                 end},
     #gm_cmd{cmd = "0点更新", args = [], desc = "进入一次0点更新",
             do =
                 fun ([],
                      Role = #role{m_var = MVar,
                                   m_campaign =
                                       MCamp = #m_campaign{acc = AccL,
                                                           can_reward =
                                                               CanRewardL,
                                                           rewarded = Rewarded,
                                                           camp_sign =
                                                               CampSign},
                                   m_camp_web =
                                       MCampWeb = #m_camp_web{acc = WAccL,
                                                              can_reward =
                                                                  WCanRewardL,
                                                              rewarded =
                                                                  WRewarded},
                                   m_limit_return =
                                       MLimitReturn = #m_limit_return{login_time
                                                                          =
                                                                          TLoginTime,
                                                                      check_time
                                                                          =
                                                                          TCheckTime,
                                                                      pay_time =
                                                                          TPaytime,
                                                                      end_time =
                                                                          TEndTime}}) ->
                         NewCampSign = CampSign#camp_sign{date = {0, 0, 0}},
                         NewMCamp = MCamp#m_campaign{acc =
                                                         [{Id,
                                                           Time - 86400,
                                                           Info}
                                                          || {Id, Time, Info}
                                                                 <- AccL],
                                                     can_reward =
                                                         [{Id,
                                                           Time - 86400,
                                                           Info}
                                                          || {Id, Time, Info}
                                                                 <- CanRewardL],
                                                     rewarded =
                                                         [{Id,
                                                           Time - 86400,
                                                           Info}
                                                          || {Id, Time, Info}
                                                                 <- Rewarded],
                                                     camp_sign = NewCampSign},
                         NewMCampWeb = MCampWeb#m_camp_web{acc =
                                                               [{Id,
                                                                 Time - 86400,
                                                                 Info}
                                                                || {Id,
                                                                    Time,
                                                                    Info}
                                                                       <- WAccL],
                                                           can_reward =
                                                               [{Id,
                                                                 Time - 86400,
                                                                 Info}
                                                                || {Id,
                                                                    Time,
                                                                    Info}
                                                                       <- WCanRewardL],
                                                           rewarded =
                                                               [{Id,
                                                                 Time - 86400,
                                                                 Info}
                                                                || {Id,
                                                                    Time,
                                                                    Info}
                                                                       <- WRewarded]},
                         MonthCard = #card_state{buy_time = BuyTime} =
                                         var:get_var(Role,
                                                     other,
                                                     2022,
                                                     #card_state{}),
                         logger:debug("=================:~w",
                                      [BuyTime],
                                      gm_cmd,
                                      355),
                         NewBuyTime = max(0, BuyTime - 86400),
                         logger:debug("=================:~w",
                                      [NewBuyTime],
                                      gm_cmd,
                                      357),
                         NewMonthCard = MonthCard#card_state{buy_time =
                                                                 NewBuyTime},
                         NewMLimitReturn =
                             MLimitReturn#m_limit_return{login_time =
                                                             max(0,
                                                                 TLoginTime -
                                                                     86400),
                                                         check_time =
                                                             max(0,
                                                                 TCheckTime -
                                                                     86400),
                                                         pay_time =
                                                             max(0,
                                                                 TPaytime -
                                                                     86400),
                                                         end_time =
                                                             max(TEndTime -
                                                                     86400,
                                                                 0)},
                         TNRole = Role#role{m_var =
                                                MVar#m_var{last_reset_time = 0},
                                            m_campaign = NewMCamp,
                                            m_camp_web = NewMCampWeb,
                                            m_limit_return = NewMLimitReturn},
                         NRole = var:set_var(TNRole, other, 2022, NewMonthCard),
                         var ! update_hour_zero,
                         dungeon_mgr ! update_hour_zero,
                         privilege ! update_hour_zero,
                         glory_mgr ! update_hour_zero,
                         camp_web:push(),
                         {ok, NRole1} = checkin:gm(NRole, before),
                         var:reset(NRole1, zero)
                 end},
     #gm_cmd{cmd = "限时返利", args = [{int, "后退天数", 1}],
             desc = "限时返利，后退天数",
             do =
                 fun ([Int],
                      Role = #role{m_limit_return =
                                       MLimitReturn = #m_limit_return{login_time
                                                                          =
                                                                          TLoginTime,
                                                                      check_time
                                                                          =
                                                                          TCheckTime,
                                                                      pay_time =
                                                                          TPaytime,
                                                                      end_time =
                                                                          TEndTime,
                                                                      start_time
                                                                          =
                                                                          StartTime},
                                   m_var = MVar}) ->
                         NewMLimitReturn =
                             MLimitReturn#m_limit_return{login_time =
                                                             max(0,
                                                                 TLoginTime -
                                                                     Int *
                                                                         86400),
                                                         check_time =
                                                             max(0,
                                                                 TCheckTime -
                                                                     Int *
                                                                         86400),
                                                         pay_time =
                                                             max(0,
                                                                 TPaytime -
                                                                     Int *
                                                                         86400),
                                                         end_time =
                                                             max(TEndTime -
                                                                     Int *
                                                                         86400,
                                                                 0),
                                                         start_time =
                                                             max(StartTime -
                                                                     Int *
                                                                         86400,
                                                                 0)},
                         NRole = Role#role{m_limit_return = NewMLimitReturn,
                                           m_var =
                                               MVar#m_var{last_reset_time = 0}},
                         var:reset(NRole, zero)
                 end},
     #gm_cmd{cmd = "现金礼包", args = [{int, "后退天数", 1}],
             desc = "现金礼包，后退天数",
             do =
                 fun ([Int],
                      Role = #role{m_charge_gift =
                                       MLimitReturn = #m_charge_gift{login_time
                                                                         =
                                                                         TLoginTime,
                                                                     check_time
                                                                         =
                                                                         TCheckTime,
                                                                     pay_time =
                                                                         TPaytime,
                                                                     end_time =
                                                                         TEndTime,
                                                                     start_time
                                                                         =
                                                                         StartTime},
                                   m_var = MVar}) ->
                         NewMLimitReturn = MLimitReturn#m_charge_gift{login_time
                                                                          =
                                                                          max(0,
                                                                              TLoginTime
                                                                                  -
                                                                                  Int
                                                                                      *
                                                                                      86400),
                                                                      check_time
                                                                          =
                                                                          max(0,
                                                                              TCheckTime
                                                                                  -
                                                                                  Int
                                                                                      *
                                                                                      86400),
                                                                      pay_time =
                                                                          max(0,
                                                                              TPaytime
                                                                                  -
                                                                                  Int
                                                                                      *
                                                                                      86400),
                                                                      end_time =
                                                                          max(TEndTime
                                                                                  -
                                                                                  Int
                                                                                      *
                                                                                      86400,
                                                                              0),
                                                                      start_time
                                                                          =
                                                                          max(StartTime
                                                                                  -
                                                                                  Int
                                                                                      *
                                                                                      86400,
                                                                              0)},
                         NRole = Role#role{m_charge_gift = NewMLimitReturn,
                                           m_var =
                                               MVar#m_var{last_reset_time = 0}},
                         var:reset(NRole, zero)
                 end},
     #gm_cmd{cmd = "限时返利星期",
             args = [{int, "开始星期几", 1}, {int, "结束星期几", 7}],
             desc = "限时返利星期",
             do =
                 fun ([Min, Max],
                      Role = #role{m_limit_return =
                                       MLimitReturn = #m_limit_return{check_time
                                                                          =
                                                                          TCheckTime},
                                   m_var = MVar}) ->
                         NMin = min(7, Min),
                         NMax = min(7, Max),
                         CheckTimeList = lists:seq(NMin, NMax),
                         NewMLimitReturn =
                             MLimitReturn#m_limit_return{check_time =
                                                             max(0,
                                                                 TCheckTime -
                                                                     86400),
                                                         check_time_list =
                                                             CheckTimeList},
                         NRole = Role#role{m_limit_return = NewMLimitReturn,
                                           m_var =
                                               MVar#m_var{last_reset_time = 0}},
                         var:reset(NRole, zero)
                 end},
     #gm_cmd{cmd = "5点更新", args = [], desc = "进入一次5点更新",
             do =
                 fun ([],
                      Role = #role{m_var = MVar,
                                   m_brave_trial =
                                       MBraveTrial =
                                           #m_brave_trial{last_accepted =
                                                              LastAccepted},
                                   m_glory =
                                       MGlory = #m_glory{day_reward = DayReward,
                                                         mtime = Mtime,
                                                         reset_time =
                                                             ResetTime},
                                   m_quest =
                                       MQuest = #m_quest{quest_guild =
                                                             QuestGuild =
                                                                 #quest_guild{last_accepted
                                                                                  =
                                                                                  Last}}}) ->
                         var ! update_hour_five,
                         camp_cake:gm(Role, #{label => five_reset}),
                         {ok, NewRole} = var:reset_five(Role#role{m_var =
                                                                      MVar#m_var{last_reset_five_time
                                                                                     =
                                                                                     0},
                                                                  m_quest =
                                                                      MQuest#m_quest{quest_guild
                                                                                         =
                                                                                         QuestGuild#quest_guild{last_accepted
                                                                                                                    =
                                                                                                                    Last
                                                                                                                        -
                                                                                                                        86400}},
                                                                  m_brave_trial
                                                                      =
                                                                      MBraveTrial#m_brave_trial{last_accepted
                                                                                                    =
                                                                                                    LastAccepted
                                                                                                        -
                                                                                                        86400},
                                                                  m_glory =
                                                                      MGlory#m_glory{day_reward
                                                                                         =
                                                                                         max(DayReward
                                                                                                 -
                                                                                                 86400,
                                                                                             0),
                                                                                     mtime
                                                                                         =
                                                                                         max(0,
                                                                                             Mtime
                                                                                                 -
                                                                                                 86400),
                                                                                     reset_time
                                                                                         =
                                                                                         max(ResetTime
                                                                                                 -
                                                                                                 86400,
                                                                                             0)}},
                                                        five),
                         glory_mgr ! update_hour_five,
                         {ok, NewRole}
                 end},
     #gm_cmd{cmd = "设移动速度", args = [{int, "速度", 260}],
             desc = "",
             do =
                 fun ([Val], Role = #role{attr = Attr}) ->
                         NewAttr = Attr#attr{speed = Val},
                         NewRole = Role#role{attr = NewAttr, speed = Val},
                         map:role_update(NewRole),
                         {ok, NewRole}
                 end},
     #gm_cmd{cmd = "设开服时间",
             args =
                 [{int, "年", 2015},
                  {int, "月", 1},
                  {int, "日", 1},
                  {int, "时", 0},
                  {int, "分", 0},
                  {int, "秒", 0}],
             desc = "修改开服时间",
             do =
                 fun ([Year, Month, Day, HH, MM, SS], _Role) ->
                         Time = date:datetime_to_seconds({{Year, Month, Day},
                                                          {HH, MM, SS}}),
                         env:save(srv_open_time, Time),
                         env ! reset_cache_time,
                         ok
                 end},
     #gm_cmd{cmd = "预合服", args = [{string, "邮件内容", ""}],
             desc = "预合服",
             do =
                 fun ([Msg], _Role) ->
                         merge_gift:pre(Msg),
                         ok
                 end},
     #gm_cmd{cmd = "查看预合服", args = [], desc = "查看预合服",
             do =
                 fun ([], _Role) ->
                         {ok, {Time, Msg}} = merge_gift:get_pre(),
                         {reply,
                          util:flist("设置时间：~w；设置内容：~ts",
                                     [date:seconds_to_datetime(Time), Msg])}
                 end},
     #gm_cmd{cmd = "查看合服次数", args = [], desc = "查看合服次数",
             do =
                 fun ([], _Role) ->
                         {reply, util:flist("~w", [env:get(merge_index)])}
                 end},
     #gm_cmd{cmd = "设合服次数", args = [{int, "次数", 1}],
             desc = "设合服次数",
             do =
                 fun ([Val], _Role) ->
                         env:set(merge_index, Val),
                         {reply, util:flist("~w", [Val])}
                 end},
     #gm_cmd{cmd = "查看合服时间", args = [], desc = "查看当前服务器合服时间",
             do =
                 fun ([], _Role) ->
                         {reply,
                          util:flist("~w",
                                     [date:seconds_to_datetime(env:get(merge_time))])}
                 end},
     #gm_cmd{cmd = "设合服时间",
             args =
                 [{int, "年", 2015},
                  {int, "月", 1},
                  {int, "日", 1},
                  {int, "时", 0},
                  {int, "分", 0},
                  {int, "秒", 0}],
             desc = "设合服时间",
             do =
                 fun ([Year, Month, Day, HH, MM, SS], _Role) ->
                         Time = date:datetime_to_seconds({{Year, Month, Day},
                                                          {HH, MM, SS}}),
                         env:save(merge_time, Time),
                         env ! reset_cache_time,
                         ok
                 end},
     #gm_cmd{cmd = "开机器人",
             args =
                 [{int, "开始编号", 1},
                  {int, "结束编号", 1},
                  {atom, "模式", robot},
                  {atom, "服", self}],
             desc = "模式",
             do =
                 fun ([Min, Max, _Mod, _Srv], _Role)
                         when Min > Max orelse Max - Min > 2000 ->
                         {reply, "非法参数"};
                     ([Min, Max, Mod, Srv], _Role) ->
                         logger:debug("开机器人   ~w", [Mod], gm_cmd, 536),
                         test:t(Srv, Mod, Min, Max),
                         ok
                 end},
     #gm_cmd{cmd = "关闭机器人", args = [], desc = "关闭机器人",
             do =
                 fun ([], _Role) ->
                         tester:info(all, del),
                         ok
                 end},
     #gm_cmd{cmd = "刷雪人宝箱", args = [], desc = "",
             do =
                 fun ([], _Role) ->
                         campaign_world_gift:gm_create(),
                         ok
                 end},
     #gm_cmd{cmd = "重置雪人", args = [], desc = "",
             do =
                 fun ([], _Role) ->
                         campaign_world_gift:reset(),
                         ok
                 end},
     #gm_cmd{cmd = "旧孩子", args = [], desc = "",
             do =
                 fun ([], Role) ->
                         case child_infant:gm_set_init(Role) of
                             {ok, NewRole} -> {ok, NewRole};
                             _ -> ok
                         end
                 end},
     #gm_cmd{cmd = "设好声音阶段", args = [{int, "阶段", 1}],
             desc = "设置好声音阶段",
             do =
                 fun ([Status], _Role) ->
                         big_world:cast(all,
                                        goodvoice_mgr,
                                        set_status,
                                        [Status]),
                         big_world:cast(c_goodvoice_mgr, set_status, [Status]),
                         ok
                 end},
     #gm_cmd{cmd = "更新好声音榜", args = [], desc = "更新好声音榜",
             do =
                 fun ([], _Role) ->
                         big_world:cast(erlang,
                                        send,
                                        [c_goodvoice_mgr, update_rank]),
                         ok
                 end},
     #gm_cmd{cmd = "提交好声音",
             args = [{string, "简介", "这是一段测试语言"}, {int, "时长", 70}],
             desc = "提交好声音",
             do =
                 fun ([Summary, Time], Role) ->
                         Voice = <<20, 0, 0, 0, 31, 166, 128, 208, 0, 57, 206,
                                   112, 224, 67, 225, 124, 199, 39, 133, 44,
                                   159, 128, 189, 30, 20, 0, 0, 0, 31, 165, 208,
                                   221, 159, 107, 39, 60, 206, 81, 86, 35, 253,
                                   231, 138, 16, 64, 102, 182, 39, 20, 0, 0, 0,
                                   28, 205, 230, 181, 231, 205, 146, 157, 36,
                                   226, 163, 219, 112, 17, 83, 156, 23, 135, 57,
                                   206, 20, 0, 0, 0, 30, 157, 102, 0, 28, 36,
                                   234, 80, 0, 28, 231, 56, 0, 14, 115, 156, 0,
                                   7, 57, 206, 20, 0, 0, 0, 30, 157, 102, 0, 0,
                                   57, 206, 112, 0, 28, 231, 56, 0, 14, 115,
                                   156, 0, 7, 57, 206, 20, 0, 0, 0, 30, 157,
                                   102, 0, 0, 57, 206, 112, 0, 28, 231, 56, 0,
                                   14, 115, 156, 0, 7, 57, 206, 20, 0, 0, 0, 30,
                                   157, 102, 0, 0, 57, 206, 112, 0, 28, 231, 56,
                                   0, 14, 115, 156, 0, 7, 57, 206, 20, 0, 0, 0,
                                   30, 157, 102, 0, 0, 57, 206, 112, 0, 28, 231,
                                   56, 0, 14, 154, 156, 0, 7, 57, 206, 20, 0, 0,
                                   0, 30, 157, 102, 6, 92, 93, 14, 112, 0, 28,
                                   231, 58, 55, 23, 68, 156, 85, 165, 125, 204,
                                   20, 0, 0, 0, 30, 131, 38, 2, 28, 42, 234,
                                   176, 6, 168, 148, 30, 51, 88, 118, 26, 11,
                                   137, 1, 254, 20, 0, 0, 0, 30, 133, 230, 5,
                                   60, 74, 74, 2, 254, 48, 15, 229, 111, 18,
                                   186, 172, 63, 132, 29, 169, 20, 0, 0, 0, 30,
                                   137, 110, 0, 220, 77, 56, 24, 14, 65, 92,
                                   124, 23, 19, 85, 0, 55, 130, 249, 232, 20, 0,
                                   0, 0, 27, 152, 152, 8, 252, 1, 120, 64, 238,
                                   62, 120, 0, 199, 8, 66, 192, 39, 135, 167,
                                   10, 20, 0, 0, 0, 27, 130, 46, 10, 60, 42,
                                   200, 254, 30, 20, 143, 128, 151, 31, 241, 62,
                                   1, 191, 147, 254, 20, 0, 0, 0, 27, 149, 194,
                                   8, 156, 39, 234, 250, 46, 16, 4, 52, 31, 57,
                                   122, 148, 59, 128, 29, 10, 20, 0, 0, 0, 27,
                                   152, 238, 0, 28, 35, 232, 250, 62, 20, 0,
                                   110, 183, 63, 70, 14, 39, 146, 131, 4, 20, 0,
                                   0, 0, 27, 157, 110, 1, 188, 125, 24, 148,
                                   126, 124, 128, 33, 87, 32, 170, 116, 27, 149,
                                   76, 0, 20, 0, 0, 0, 27, 140, 194, 0, 220,
                                   197, 95, 59, 30, 126, 136, 124, 175, 37, 68,
                                   52, 115, 155, 222, 232, 20, 0, 0, 0, 29, 211,
                                   244, 5, 28, 160, 191, 75, 238, 106, 160, 87,
                                   215, 62, 69, 146, 143, 144, 69, 41, 20, 0, 0,
                                   0, 29, 221, 244, 11, 220, 162, 105, 89, 174,
                                   83, 143, 158, 207, 40, 250, 17, 39, 148, 1,
                                   56, 20, 0, 0, 0, 29, 204, 52, 64, 92, 37,
                                   232, 71, 110, 20, 3, 197, 199, 10, 66, 21,
                                   35, 147, 181, 53, 20, 0, 0, 0, 29, 220, 16,
                                   74, 60, 162, 229, 88, 65, 222, 148, 131, 159,
                                   22, 74, 148, 239, 155, 70, 120, 20, 0, 0, 0,
                                   29, 196, 24, 104, 60, 122, 254, 0, 222, 73,
                                   241, 71, 191, 7, 170, 207, 31, 132, 130, 8,
                                   20, 0, 0, 0, 29, 201, 88, 96, 201, 89, 87, 0,
                                   116, 194, 168, 77, 187, 73, 175, 254, 219,
                                   148, 45, 42, 20, 0, 0, 0, 29, 201, 16, 119,
                                   188, 160, 27, 2, 9, 237, 133, 170, 229, 234,
                                   74, 19, 227, 152, 175, 255, 20, 0, 0, 0, 25,
                                   208, 134, 129, 156, 171, 54, 92, 14, 86, 117,
                                   45, 44, 41, 194, 21, 211, 149, 131, 216, 20,
                                   0, 0, 0, 29, 201, 16, 174, 188, 169, 113, 91,
                                   246, 148, 215, 191, 167, 13, 249, 162, 255,
                                   159, 191, 31, 20, 0, 0, 0, 29, 201, 24, 164,
                                   157, 225, 188, 61, 167, 237, 128, 127, 171,
                                   117, 82, 213, 96, 255, 161, 106, 20, 0, 0, 0,
                                   29, 201, 78, 177, 60, 124, 214, 3, 246, 253,
                                   139, 171, 203, 86, 124, 39, 227, 148, 173,
                                   231, 20, 0, 0, 0, 29, 199, 14, 191, 92, 169,
                                   74, 78, 180, 219, 152, 99, 175, 32, 141, 177,
                                   96, 184, 20, 11, 20, 0, 0, 0, 29, 221, 94,
                                   206, 99, 99, 232, 18, 212, 125, 20, 39, 164,
                                   87, 66, 158, 67, 139, 72, 8, 20, 0, 0, 0, 29,
                                   222, 86, 197, 167, 202, 159, 85, 213, 150,
                                   97, 175, 191, 22, 154, 62, 164, 242, 27, 36,
                                   20, 0, 0, 0, 25, 133, 166, 204, 82, 146, 95,
                                   180, 166, 143, 197, 47, 67, 73, 122, 46, 103,
                                   144, 13, 55, 20, 0, 0, 0, 26, 109, 164, 206,
                                   205, 200, 255, 40, 64, 196, 245, 5, 223, 22,
                                   120, 50, 132, 226, 19, 9, 20, 0, 0, 0, 27,
                                   176, 56, 199, 252, 89, 10, 86, 35, 147, 126,
                                   38, 39, 5, 0, 60, 32, 85, 98, 192, 20, 0, 0,
                                   0, 31, 163, 16, 200, 113, 74, 31, 182, 83,
                                   212, 166, 26, 23, 50, 83, 31, 106, 132, 164,
                                   231, 20, 0, 0, 0, 26, 97, 228, 197, 155, 172,
                                   234, 93, 173, 207, 9, 35, 112, 247, 1, 23,
                                   228, 101, 110, 6, 20, 0, 0, 0, 27, 193, 134,
                                   202, 45, 130, 170, 47, 47, 97, 95, 169, 227,
                                   224, 169, 88, 130, 63, 171, 232, 20, 0, 0, 0,
                                   26, 119, 174, 216, 27, 165, 41, 199, 135, 45,
                                   107, 226, 27, 189, 138, 122, 164, 242, 162,
                                   106, 20, 0, 0, 0, 26, 110, 28, 215, 123, 3,
                                   194, 68, 166, 236, 244, 158, 20, 254, 175,
                                   76, 171, 124, 34, 7, 20, 0, 0, 0, 26, 108,
                                   204, 209, 113, 142, 10, 251, 65, 214, 26,
                                   169, 175, 49, 98, 21, 36, 125, 105, 103, 20,
                                   0, 0, 0, 26, 110, 28, 236, 135, 37, 233, 75,
                                   94, 87, 182, 190, 137, 215, 95, 213, 45, 160,
                                   31, 112, 20, 0, 0, 0, 26, 105, 240, 220, 175,
                                   225, 49, 252, 145, 215, 73, 125, 122, 118,
                                   52, 107, 99, 119, 206, 32, 20, 0, 0, 0, 26,
                                   127, 156, 228, 37, 164, 182, 83, 247, 86, 20,
                                   51, 51, 74, 57, 211, 120, 170, 136, 0, 20, 0,
                                   0, 0, 26, 97, 88, 233, 67, 12, 56, 76, 142,
                                   104, 165, 34, 193, 233, 5, 215, 255, 133, 32,
                                   235, 20, 0, 0, 0, 26, 110, 88, 249, 156, 248,
                                   207, 62, 182, 150, 149, 161, 160, 209, 60,
                                   17, 56, 111, 41, 85, 20, 0, 0, 0, 26, 97, 88,
                                   232, 254, 157, 91, 255, 43, 238, 191, 170,
                                   218, 41, 178, 22, 124, 181, 141, 154, 20, 0,
                                   0, 0, 29, 220, 66, 231, 99, 136, 55, 95, 177,
                                   196, 182, 164, 191, 31, 60, 210, 4, 16, 69,
                                   10, 20, 0, 0, 0, 26, 108, 144, 227, 27, 167,
                                   86, 83, 116, 214, 9, 20, 107, 205, 70, 44,
                                   71, 117, 169, 254, 20, 0, 0, 0, 29, 220, 98,
                                   215, 124, 167, 62, 171, 113, 82, 10, 175,
                                   170, 118, 171, 214, 214, 40, 171, 0, 20, 0,
                                   0, 0, 26, 97, 16, 199, 110, 198, 4, 229, 163,
                                   84, 131, 46, 242, 62, 41, 94, 135, 88, 217,
                                   9, 20, 0, 0, 0, 28, 120, 242, 203, 18, 181,
                                   127, 183, 238, 75, 147, 168, 111, 43, 65,
                                   206, 243, 149, 197, 42, 20, 0, 0, 0, 28, 100,
                                   242, 209, 35, 252, 224, 74, 45, 222, 165,
                                   160, 210, 74, 85, 146, 107, 136, 198, 18, 20,
                                   0, 0, 0, 28, 126, 242, 200, 254, 165, 109,
                                   66, 201, 108, 8, 138, 88, 246, 212, 94, 247,
                                   203, 38, 120, 20, 0, 0, 0, 24, 122, 186, 205,
                                   231, 165, 81, 84, 142, 80, 143, 28, 226, 96,
                                   64, 215, 97, 63, 221, 104, 20, 0, 0, 0, 24,
                                   126, 186, 222, 229, 75, 232, 244, 78, 64, 4,
                                   40, 10, 105, 199, 236, 107, 152, 157, 184,
                                   20, 0, 0, 0, 28, 112, 178, 216, 239, 188, 50,
                                   3, 36, 144, 59, 70, 20, 236, 170, 163, 235,
                                   212, 173, 74, 20, 0, 0, 0, 28, 126, 250, 213,
                                   88, 254, 56, 73, 150, 205, 95, 159, 103, 48,
                                   170, 241, 89, 55, 167, 8, 20, 0, 0, 0, 28,
                                   126, 250, 217, 229, 88, 39, 133, 158, 95,
                                   224, 23, 39, 41, 150, 130, 97, 57, 40, 22,
                                   20, 0, 0, 0, 28, 127, 82, 219, 163, 173, 73,
                                   18, 178, 84, 123, 64, 119, 118, 88, 6, 163,
                                   197, 43, 159, 20, 0, 0, 0, 28, 103, 250, 209,
                                   141, 161, 9, 21, 52, 87, 101, 44, 239, 22,
                                   94, 37, 87, 148, 166, 222, 20, 0, 0, 0, 28,
                                   127, 40, 201, 135, 229, 75, 127, 31, 87, 151,
                                   33, 250, 113, 154, 112, 214, 21, 38, 192, 20,
                                   0, 0, 0, 28, 103, 250, 211, 137, 42, 167,
                                   194, 131, 77, 226, 43, 199, 34, 195, 212,
                                   223, 195, 129, 190, 20, 0, 0, 0, 28, 127,
                                   122, 200, 209, 169, 10, 87, 198, 218, 179,
                                   254, 68, 39, 253, 151, 45, 212, 137, 121, 20,
                                   0, 0, 0, 24, 125, 186, 196, 69, 131, 239,
                                   240, 168, 226, 223, 6, 187, 113, 65, 222, 56,
                                   251, 229, 103, 20, 0, 0, 0, 28, 127, 50, 213,
                                   28, 34, 16, 138, 190, 84, 86, 193, 170, 113,
                                   130, 185, 120, 208, 137, 73, 20, 0, 0, 0, 29,
                                   122, 194, 205, 60, 137, 105, 176, 136, 218,
                                   11, 35, 1, 118, 252, 89, 91, 149, 182, 112,
                                   20, 0, 0, 0, 31, 100, 230, 211, 187, 1, 40,
                                   253, 243, 213, 251, 94, 170, 96, 20, 255,
                                   128, 164, 160, 248, 20, 0, 0, 0, 29, 122,
                                   194, 196, 227, 161, 64, 5, 233, 150, 204, 34,
                                   183, 47, 72, 173, 77, 184, 217, 75, 20, 0, 0,
                                   0, 28, 97, 40, 200, 62, 30, 175, 134, 116,
                                   210, 182, 148, 241, 234, 64, 83, 233, 149,
                                   129, 9, 20, 0, 0, 0, 29, 106, 206, 194, 141,
                                   225, 38, 178, 226, 215, 158, 141, 212, 75,
                                   178, 227, 126, 245, 37, 164, 20, 0, 0, 0, 29,
                                   106, 244, 203, 231, 2, 217, 87, 254, 63, 240,
                                   34, 71, 49, 82, 193, 129, 211, 193, 86, 20,
                                   0, 0, 0, 24, 104, 186, 180, 183, 225, 104,
                                   92, 161, 226, 52, 174, 96, 247, 250, 1, 241,
                                   51, 169, 118, 20, 0, 0, 0, 28, 97, 50, 191,
                                   173, 255, 170, 18, 176, 206, 164, 175, 79,
                                   63, 87, 255, 225, 179, 247, 234, 20, 0, 0, 0,
                                   28, 112, 248, 178, 173, 168, 23, 160, 238,
                                   84, 137, 3, 171, 199, 5, 83, 107, 149, 31,
                                   248, 20, 0, 0, 0, 28, 112, 128, 183, 188,
                                   219, 60, 211, 254, 99, 93, 213, 114, 104,
                                   195, 208, 103, 138, 128, 235, 20, 0, 0, 0,
                                   24, 120, 204, 191, 252, 165, 8, 93, 94, 78,
                                   181, 42, 92, 74, 2, 193, 138, 116, 30, 224,
                                   20, 0, 0, 0, 28, 112, 168, 176, 254, 169, 49,
                                   71, 254, 77, 85, 79, 110, 201, 39, 209, 156,
                                   119, 131, 255, 20, 0, 0, 0, 28, 57, 118, 191,
                                   91, 21, 49, 7, 143, 94, 178, 183, 249, 82,
                                   82, 129, 193, 56, 231, 234, 20, 0, 0, 0, 28,
                                   97, 120, 179, 173, 173, 107, 190, 51, 212,
                                   148, 9, 201, 0, 90, 62, 64, 123, 172, 247,
                                   20, 0, 0, 0, 24, 120, 186, 177, 73, 173, 89,
                                   59, 214, 255, 103, 175, 240, 231, 19, 209,
                                   56, 127, 130, 23, 20, 0, 0, 0, 28, 120, 248,
                                   181, 114, 199, 15, 157, 45, 128, 167, 161,
                                   162, 103, 80, 35, 8, 127, 168, 224, 20, 0, 0,
                                   0, 30, 112, 216, 195, 28, 39, 255, 70, 73,
                                   108, 186, 33, 231, 9, 218, 57, 98, 63, 169,
                                   109, 20, 0, 0, 0, 30, 109, 88, 204, 137, 255,
                                   234, 42, 178, 236, 179, 140, 98, 103, 59,
                                   209, 155, 181, 68, 8, 20, 0, 0, 0, 30, 127,
                                   174, 205, 47, 199, 245, 5, 205, 211, 139, 31,
                                   119, 188, 186, 201, 85, 217, 127, 75, 20, 0,
                                   0, 0, 26, 125, 174, 205, 19, 191, 234, 95,
                                   50, 242, 203, 173, 231, 40, 76, 85, 63, 117,
                                   22, 51, 20, 0, 0, 0, 24, 119, 196, 197, 142,
                                   194, 182, 93, 221, 150, 155, 125, 57, 246,
                                   146, 235, 9, 51, 104, 56, 20, 0, 0, 0, 30,
                                   109, 88, 204, 5, 253, 9, 93, 87, 209, 47,
                                   154, 123, 192, 120, 1, 116, 252, 169, 119,
                                   20, 0, 0, 0, 30, 112, 216, 184, 169, 144, 55,
                                   0, 196, 214, 117, 43, 17, 118, 66, 235, 251,
                                   152, 170, 48, 20, 0, 0, 0, 26, 87, 162, 193,
                                   105, 167, 42, 179, 190, 0, 15, 217, 94, 200,
                                   82, 146, 159, 101, 130, 7, 20, 0, 0, 0, 28,
                                   112, 248, 203, 69, 88, 31, 87, 14, 80, 115,
                                   253, 55, 170, 125, 147, 8, 117, 174, 207, 20,
                                   0, 0, 0, 29, 217, 14, 203, 143, 73, 9, 80,
                                   166, 207, 116, 161, 25, 246, 192, 16, 45, 32,
                                   94, 199, 20, 0, 0, 0, 28, 173, 240, 196, 199,
                                   73, 13, 83, 238, 0, 114, 137, 92, 202, 66,
                                   177, 96, 192, 1, 2, 20, 0, 0, 0, 29, 222, 14,
                                   195, 135, 33, 40, 198, 222, 21, 100, 9, 97,
                                   221, 89, 248, 115, 18, 13, 88, 20, 0, 0, 0,
                                   29, 203, 124, 196, 142, 218, 47, 173, 167,
                                   244, 254, 87, 180, 73, 141, 149, 187, 148,
                                   225, 43, 20, 0, 0, 0, 29, 217, 14, 196, 187,
                                   197, 159, 66, 50, 227, 180, 1, 65, 234, 60,
                                   139, 132, 240, 42, 235, 20, 0, 0, 0, 28, 173,
                                   144, 196, 143, 157, 66, 18, 78, 222, 1, 228,
                                   167, 52, 173, 192, 153, 217, 102, 53, 20, 0,
                                   0, 0, 26, 81, 190, 207, 45, 233, 3, 194, 77,
                                   208, 186, 229, 66, 255, 185, 195, 65, 209,
                                   121, 74, 20, 0, 0, 0, 27, 163, 46, 221, 173,
                                   174, 43, 245, 227, 172, 179, 147, 175, 62,
                                   83, 229, 212, 127, 169, 22, 20, 0, 0, 0, 27,
                                   165, 202, 235, 123, 248, 11, 79, 182, 144, 6,
                                   33, 83, 140, 186, 239, 21, 180, 163, 232, 20,
                                   0, 0, 0, 27, 180, 78, 221, 105, 201, 241, 15,
                                   99, 151, 227, 207, 176, 245, 98, 159, 189,
                                   50, 225, 26, 20, 0, 0, 0, 27, 181, 14, 220,
                                   221, 129, 106, 123, 39, 124, 149, 190, 71,
                                   47, 92, 23, 49, 43, 87, 241, 20, 0, 0, 0, 28,
                                   181, 200, 216, 137, 53, 255, 71, 70, 249,
                                   188, 39, 188, 80, 90, 163, 13, 184, 153, 11,
                                   20, 0, 0, 0, 28, 173, 240, 217, 174, 37, 145,
                                   183, 14, 87, 97, 131, 170, 120, 122, 160,
                                   148, 248, 232, 69, 20, 0, 0, 0, 26, 104, 206,
                                   212, 75, 253, 224, 58, 111, 106, 205, 90,
                                   235, 234, 61, 199, 208, 115, 198, 239, 20, 0,
                                   0, 0, 27, 189, 102, 230, 131, 37, 43, 81,
                                   182, 144, 208, 127, 103, 39, 68, 24, 114, 37,
                                   154, 176, 20, 0, 0, 0, 27, 181, 22, 250, 124,
                                   107, 255, 127, 46, 0, 172, 37, 244, 200, 184,
                                   15, 166, 39, 138, 208, 20, 0, 0, 0, 27, 184,
                                   184, 255, 62, 29, 234, 86, 45, 138, 2, 163,
                                   30, 200, 1, 208, 15, 4, 140, 88, 20, 0, 0, 0,
                                   27, 189, 78, 253, 110, 44, 7, 70, 222, 68, 6,
                                   159, 13, 224, 97, 113, 36, 164, 92, 0, 20, 0,
                                   0, 0, 27, 173, 108, 246, 220, 98, 41, 72, 96,
                                   96, 127, 208, 25, 95, 250, 175, 144, 228, 71,
                                   9, 20, 0, 0, 0, 27, 173, 78, 245, 77, 182,
                                   199, 100, 199, 85, 131, 55, 127, 32, 198, 4,
                                   61, 62, 17, 96, 20, 0, 0, 0, 31, 163, 4, 249,
                                   88, 249, 45, 81, 196, 233, 58, 109, 143, 135,
                                   68, 149, 206, 107, 44, 172, 20, 0, 0, 0, 29,
                                   222, 14, 255, 62, 163, 24, 77, 174, 64, 133,
                                   227, 251, 214, 90, 203, 211, 248, 213, 64,
                                   20, 0, 0, 0, 29, 206, 15, 10, 252, 64, 229,
                                   71, 88, 0, 141, 35, 150, 192, 10, 76, 192,
                                   228, 13, 246, 20, 0, 0, 0, 29, 204, 35, 10,
                                   220, 129, 13, 251, 67, 214, 165, 195, 163,
                                   200, 182, 30, 193, 227, 110, 111, 20, 0, 0,
                                   0, 26, 104, 195, 14, 94, 148, 223, 59, 7,
                                   219, 88, 13, 19, 71, 59, 223, 45, 182, 38,
                                   11, 20, 0, 0, 0, 29, 199, 227, 15, 7, 154,
                                   37, 124, 254, 81, 163, 216, 223, 47, 194, 84,
                                   193, 240, 21, 232, 20, 0, 0, 0, 29, 206, 98,
                                   246, 69, 170, 88, 198, 243, 151, 117, 216,
                                   192, 233, 48, 150, 193, 245, 249, 109, 20, 0,
                                   0, 0, 29, 199, 138, 251, 41, 161, 57, 99,
                                   163, 217, 181, 34, 87, 40, 58, 46, 157, 52,
                                   251, 234, 20, 0, 0, 0, 29, 202, 227, 4, 153,
                                   220, 178, 141, 241, 223, 128, 63, 187, 168,
                                   35, 246, 5, 0, 232, 0, 20, 0, 0, 0, 29, 193,
                                   226, 249, 27, 202, 83, 89, 1, 216, 148, 138,
                                   180, 72, 15, 171, 100, 107, 225, 32, 20, 0,
                                   0, 0, 29, 201, 194, 241, 105, 230, 71, 83,
                                   174, 122, 243, 156, 199, 57, 26, 158, 195,
                                   123, 129, 41, 20, 0, 0, 0, 29, 221, 10, 242,
                                   45, 173, 31, 179, 148, 61, 17, 1, 201, 95,
                                   154, 198, 31, 212, 241, 132, 20, 0, 0, 0, 29,
                                   205, 66, 243, 220, 216, 28, 126, 215, 128,
                                   208, 47, 242, 122, 178, 176, 236, 240, 108,
                                   242, 20, 0, 0, 0, 29, 196, 16, 241, 137, 197,
                                   234, 61, 65, 88, 212, 230, 210, 118, 20, 179,
                                   127, 156, 167, 10, 20, 0, 0, 0, 29, 209, 30,
                                   245, 5, 168, 216, 78, 17, 150, 163, 171, 74,
                                   113, 139, 227, 239, 194, 102, 251, 20, 0, 0,
                                   0, 29, 204, 174, 227, 123, 37, 234, 183, 97,
                                   251, 112, 120, 223, 49, 178, 83, 187, 155,
                                   174, 160, 20, 0, 0, 0, 29, 196, 46, 229, 91,
                                   157, 86, 56, 68, 200, 165, 2, 129, 81, 66,
                                   255, 138, 37, 197, 9, 20, 0, 0, 0, 29, 196,
                                   46, 227, 123, 234, 108, 76, 243, 107, 80,
                                   156, 235, 170, 72, 174, 251, 128, 120, 7, 20,
                                   0, 0, 0, 29, 195, 252, 228, 145, 171, 205,
                                   95, 227, 254, 195, 255, 201, 106, 87, 176,
                                   153, 84, 203, 175, 20, 0, 0, 0, 29, 206, 38,
                                   236, 103, 126, 13, 95, 110, 75, 235, 188,
                                   203, 235, 86, 63, 226, 95, 255, 255, 20, 0,
                                   0, 0, 29, 206, 34, 244, 7, 168, 42, 28, 4,
                                   252, 245, 145, 26, 72, 247, 148, 109, 161,
                                   161, 72, 20, 0, 0, 0, 29, 221, 226, 247, 77,
                                   132, 229, 76, 33, 202, 244, 6, 249, 179, 68,
                                   190, 127, 155, 165, 117, 20, 0, 0, 0, 25, 57,
                                   130, 241, 188, 128, 74, 81, 4, 231, 97, 97,
                                   188, 88, 75, 102, 220, 99, 177, 104, 20, 0,
                                   0, 0, 30, 181, 144, 236, 35, 169, 45, 90, 84,
                                   190, 134, 157, 90, 115, 182, 56, 177, 178,
                                   78, 214, 20, 0, 0, 0, 26, 104, 160, 237, 174,
                                   121, 239, 183, 61, 154, 116, 41, 31, 63, 2,
                                   129, 12, 228, 3, 248, 20, 0, 0, 0, 27, 180,
                                   74, 235, 173, 33, 137, 134, 84, 138, 116, 37,
                                   62, 232, 122, 115, 145, 48, 206, 204, 20, 0,
                                   0, 0, 31, 165, 144, 251, 251, 37, 168, 9, 30,
                                   79, 251, 65, 169, 255, 98, 35, 155, 144, 66,
                                   40, 20, 0, 0, 0, 28, 1, 215, 76, 188, 57,
                                   198, 69, 94, 115, 171, 144, 151, 44, 156,
                                   142, 175, 155, 87, 224, 20, 0, 0, 0, 31, 168,
                                   165, 33, 130, 131, 31, 254, 136, 254, 177,
                                   117, 75, 67, 7, 159, 158, 40, 219, 105, 20,
                                   0, 0, 0, 31, 168, 165, 17, 65, 225, 21, 5,
                                   73, 238, 148, 89, 127, 62, 123, 64, 80, 239,
                                   42, 186, 20, 0, 0, 0, 31, 165, 37, 19, 143,
                                   71, 24, 79, 31, 65, 189, 181, 227, 134, 73,
                                   32, 87, 133, 68, 179, 20, 0, 0, 0, 31, 168,
                                   145, 6, 7, 240, 239, 1, 32, 193, 228, 226,
                                   226, 111, 27, 125, 109, 58, 145, 42, 20, 0,
                                   0, 0, 31, 181, 17, 4, 60, 156, 248, 242, 191,
                                   112, 8, 66, 129, 216, 18, 82, 137, 36, 63, 2,
                                   20, 0, 0, 0, 31, 181, 67, 33, 41, 170, 211,
                                   137, 105, 81, 91, 63, 199, 50, 89, 90, 76,
                                   234, 60, 200, 20, 0, 0, 0, 31, 165, 67, 29,
                                   130, 83, 223, 241, 228, 248, 77, 171, 18,
                                   103, 170, 228, 143, 156, 72, 76, 20, 0, 0, 0,
                                   31, 165, 67, 9, 188, 192, 241, 177, 79, 111,
                                   69, 30, 209, 112, 162, 164, 12, 70, 139, 40,
                                   20, 0, 0, 0, 31, 181, 67, 6, 255, 172, 166,
                                   72, 192, 65, 151, 169, 67, 159, 185, 85, 105,
                                   48, 45, 54, 20, 0, 0, 0, 31, 189, 67, 10,
                                   237, 156, 235, 89, 182, 145, 114, 189, 79,
                                   43, 75, 23, 236, 175, 171, 252, 20, 0, 0, 0,
                                   26, 126, 231, 8, 190, 110, 198, 123, 46, 85,
                                   143, 158, 86, 204, 195, 98, 183, 136, 168,
                                   73, 20, 0, 0, 0, 26, 100, 144, 247, 46, 189,
                                   103, 82, 6, 228, 127, 23, 250, 107, 98, 197,
                                   107, 132, 163, 0, 20, 0, 0, 0, 26, 96, 195,
                                   7, 71, 249, 119, 73, 246, 239, 238, 97, 139,
                                   117, 63, 149, 133, 124, 46, 8, 20, 0, 0, 0,
                                   26, 96, 157, 7, 103, 131, 42, 147, 17, 225,
                                   86, 50, 113, 114, 88, 20, 110, 32, 175, 7,
                                   20, 0, 0, 0, 26, 127, 28, 247, 115, 197, 232,
                                   67, 20, 222, 216, 109, 222, 246, 194, 87, 92,
                                   111, 160, 12, 20, 0, 0, 0, 26, 127, 46, 252,
                                   59, 33, 0, 2, 17, 222, 121, 161, 147, 104,
                                   184, 21, 67, 114, 45, 150, 20, 0, 0, 0, 26,
                                   127, 96, 250, 252, 169, 74, 60, 191, 97, 28,
                                   146, 78, 40, 192, 0, 69, 48, 105, 248, 20, 0,
                                   0, 0, 24, 162, 20, 246, 175, 53, 8, 99, 173,
                                   143, 251, 65, 172, 226, 144, 27, 113, 184,
                                   216, 199, 20, 0, 0, 0, 28, 127, 128, 246,
                                   167, 217, 114, 177, 40, 204, 200, 177, 178,
                                   39, 64, 240, 71, 51, 197, 96, 20, 0, 0, 0,
                                   28, 51, 207, 2, 73, 239, 9, 57, 22, 241, 27,
                                   85, 223, 8, 66, 191, 213, 220, 181, 64, 20,
                                   0, 0, 0, 28, 38, 22, 245, 105, 172, 155, 4,
                                   94, 68, 171, 157, 150, 199, 95, 170, 16, 20,
                                   44, 16, 20, 0, 0, 0, 28, 38, 78, 246, 100,
                                   32, 184, 83, 35, 204, 5, 237, 150, 231, 67,
                                   229, 50, 112, 36, 103, 20, 0, 0, 0, 28, 38,
                                   100, 229, 109, 162, 77, 251, 19, 204, 182,
                                   81, 43, 234, 126, 49, 1, 248, 245, 104, 20,
                                   0, 0, 0, 24, 119, 186, 226, 211, 189, 102,
                                   101, 185, 146, 167, 222, 51, 104, 196, 110,
                                   175, 149, 173, 94, 20, 0, 0, 0, 31, 176, 211,
                                   38, 91, 40, 71, 187, 51, 34, 157, 51, 172,
                                   47, 61, 211, 227, 84, 15, 202, 20, 0, 0, 0,
                                   31, 181, 89, 7, 199, 128, 16, 87, 255, 21, 6,
                                   29, 161, 200, 73, 255, 168, 117, 219, 123,
                                   20, 0, 0, 0, 24, 161, 195, 7, 78, 182, 242,
                                   199, 235, 140, 149, 45, 175, 159, 123, 106,
                                   224, 251, 42, 106, 20, 0, 0, 0, 31, 161, 19,
                                   9, 205, 93, 12, 92, 94, 22, 81, 98, 56, 223,
                                   180, 159, 224, 179, 175, 17, 20, 0, 0, 0, 31,
                                   181, 0, 253, 209, 22, 178, 125, 146, 240, 22,
                                   199, 64, 222, 141, 80, 51, 133, 125, 11, 20,
                                   0, 0, 0, 27, 173, 66, 251, 79, 2, 237, 100,
                                   126, 41, 251, 36, 255, 48, 179, 227, 95, 155,
                                   29, 126, 20, 0, 0, 0, 29, 199, 166, 244, 142,
                                   110, 24, 111, 177, 174, 88, 170, 7, 16, 66,
                                   172, 30, 48, 47, 8, 20, 0, 0, 0, 31, 181, 0,
                                   245, 243, 195, 44, 61, 243, 190, 153, 62,
                                   249, 49, 70, 45, 90, 90, 193, 255, 20, 0, 0,
                                   0, 29, 199, 135, 8, 220, 214, 184, 75, 126,
                                   15, 223, 60, 183, 134, 70, 17, 217, 32, 101,
                                   112, 20, 0, 0, 0, 31, 181, 40, 242, 205, 202,
                                   169, 123, 141, 229, 229, 172, 236, 94, 179,
                                   212, 220, 247, 250, 120, 20, 0, 0, 0, 31,
                                   181, 104, 245, 137, 29, 234, 74, 84, 225,
                                   105, 46, 185, 207, 69, 127, 79, 156, 165,
                                   112, 20, 0, 0, 0, 31, 165, 168, 233, 143, 17,
                                   234, 193, 78, 107, 228, 173, 89, 208, 149,
                                   193, 224, 231, 181, 245, 20, 0, 0, 0, 31,
                                   168, 168, 219, 89, 200, 151, 147, 133, 197,
                                   115, 128, 162, 79, 102, 29, 223, 159, 169,
                                   126, 20, 0, 0, 0, 25, 165, 4, 248, 127, 18,
                                   127, 104, 110, 228, 220, 130, 211, 111, 244,
                                   226, 199, 221, 87, 39, 20, 0, 0, 0, 25, 181,
                                   212, 233, 91, 253, 2, 109, 47, 10, 186, 222,
                                   65, 70, 192, 154, 132, 204, 46, 32, 20, 0, 0,
                                   0, 25, 165, 244, 238, 135, 62, 177, 75, 6,
                                   235, 152, 232, 171, 108, 62, 27, 40, 228,
                                   169, 112, 20, 0, 0, 0, 25, 181, 186, 231, 69,
                                   48, 233, 91, 14, 118, 200, 73, 230, 241, 221,
                                   125, 199, 133, 169, 22, 20, 0, 0, 0, 25, 184,
                                   133, 11, 220, 45, 103, 191, 233, 75, 207, 5,
                                   10, 107, 56, 144, 159, 202, 234, 248, 20, 0,
                                   0, 0, 25, 165, 116, 249, 3, 169, 65, 45, 14,
                                   1, 37, 217, 67, 222, 0, 165, 21, 179, 89, 96,
                                   20, 0, 0, 0, 31, 184, 194, 238, 252, 129,
                                   113, 19, 155, 211, 36, 147, 129, 237, 41, 1,
                                   152, 184, 105, 40, 20, 0, 0, 0, 31, 161, 0,
                                   236, 254, 202, 73, 203, 91, 240, 220, 126,
                                   163, 81, 208, 61, 41, 196, 31, 13, 20, 0, 0,
                                   0, 31, 161, 58, 253, 163, 81, 89, 7, 142, 78,
                                   181, 40, 183, 32, 59, 213, 171, 130, 99, 9,
                                   20, 0, 0, 0, 24, 177, 194, 252, 77, 53, 47,
                                   153, 212, 227, 4, 43, 55, 2, 50, 62, 236,
                                   248, 122, 168, 20, 0, 0, 0, 25, 33, 164, 245,
                                   167, 226, 216, 65, 17, 227, 113, 39, 241,
                                   233, 49, 209, 152, 117, 62, 11, 20, 0, 0, 0,
                                   29, 220, 66, 249, 137, 156, 71, 196, 164,
                                   252, 180, 61, 9, 102, 90, 214, 164, 245, 97,
                                   43, 20, 0, 0, 0, 29, 220, 11, 9, 188, 229,
                                   17, 250, 87, 97, 95, 54, 119, 12, 124, 36,
                                   87, 138, 237, 85, 20, 0, 0, 0, 28, 33, 246,
                                   249, 252, 67, 209, 140, 214, 195, 192, 175,
                                   91, 113, 107, 222, 39, 216, 136, 22, 20, 0,
                                   0, 0, 26, 104, 194, 251, 187, 1, 7, 86, 148,
                                   188, 152, 242, 115, 106, 194, 87, 110, 248,
                                   248, 42, 20, 0, 0, 0, 25, 33, 165, 0, 33,
                                   230, 56, 173, 203, 218, 137, 67, 88, 214,
                                   122, 78, 220, 100, 173, 72, 20, 0, 0, 0, 26,
                                   112, 146, 242, 220, 136, 85, 12, 238, 19, 18,
                                   177, 59, 240, 140, 27, 63, 133, 147, 81, 20,
                                   0, 0, 0, 29, 223, 6, 235, 197, 242, 39, 253,
                                   201, 255, 118, 154, 183, 177, 143, 222, 123,
                                   125, 212, 243, 20, 0, 0, 0, 25, 33, 148, 232,
                                   120, 250, 13, 6, 142, 75, 245, 167, 1, 111,
                                   142, 21, 116, 245, 157, 66, 20, 0, 0, 0, 25,
                                   33, 148, 240, 129, 149, 181, 60, 158, 23,
                                   119, 225, 53, 239, 74, 203, 35, 147, 69, 111,
                                   20, 0, 0, 0, 29, 220, 226, 251, 135, 162, 22,
                                   170, 178, 143, 234, 161, 65, 38, 89, 109, 51,
                                   146, 36, 169, 20, 0, 0, 0, 29, 220, 170, 241,
                                   94, 4, 241, 171, 68, 229, 113, 61, 167, 8,
                                   64, 161, 119, 101, 202, 54, 20, 0, 0, 0, 29,
                                   223, 98, 244, 219, 202, 163, 124, 89, 241,
                                   206, 3, 75, 97, 60, 127, 103, 223, 66, 31,
                                   20, 0, 0, 0, 25, 33, 148, 234, 141, 168, 210,
                                   183, 141, 206, 5, 150, 219, 233, 82, 60, 177,
                                   220, 37, 120, 20, 0, 0, 0, 29, 220, 226, 255,
                                   56, 178, 176, 167, 191, 96, 169, 171, 209,
                                   53, 176, 206, 95, 154, 248, 21, 20, 0, 0, 0,
                                   25, 63, 148, 248, 123, 137, 117, 35, 35, 255,
                                   255, 147, 73, 227, 170, 215, 251, 213, 93,
                                   150, 20, 0, 0, 0, 24, 32, 118, 255, 175, 70,
                                   195, 254, 185, 204, 163, 63, 159, 42, 110,
                                   112, 186, 38, 161, 121, 20, 0, 0, 0, 28, 63,
                                   246, 255, 135, 36, 8, 133, 30, 85, 134, 249,
                                   191, 43, 182, 44, 177, 119, 157, 43, 20, 0,
                                   0, 0, 28, 195, 3, 8, 175, 233, 74, 188, 130,
                                   224, 243, 255, 34, 114, 137, 207, 124, 217,
                                   29, 105, 20, 0, 0, 0, 25, 41, 149, 4, 207,
                                   61, 8, 251, 50, 214, 214, 92, 191, 47, 176,
                                   13, 67, 156, 201, 107, 20, 0, 0, 0, 25, 42,
                                   215, 12, 252, 156, 0, 205, 136, 172, 102, 90,
                                   183, 15, 67, 85, 128, 176, 111, 8, 20, 0, 0,
                                   0, 30, 190, 148, 246, 47, 181, 139, 57, 53,
                                   213, 138, 189, 38, 63, 245, 212, 228, 179,
                                   33, 48, 20, 0, 0, 0, 31, 176, 147, 6, 188,
                                   88, 234, 180, 39, 35, 247, 165, 43, 207, 32,
                                   195, 157, 49, 45, 248, 20, 0, 0, 0, 31, 161,
                                   1, 10, 60, 161, 48, 183, 147, 31, 5, 174,
                                   183, 130, 64, 109, 249, 192, 45, 8, 20, 0, 0,
                                   0, 31, 174, 97, 14, 156, 130, 250, 65, 14,
                                   95, 136, 134, 116, 79, 125, 126, 233, 202,
                                   248, 209, 20, 0, 0, 0, 31, 161, 66, 251, 109,
                                   128, 21, 39, 211, 255, 105, 38, 89, 232, 253,
                                   173, 63, 197, 241, 232, 20, 0, 0, 0, 31, 161,
                                   16, 237, 81, 230, 27, 250, 230, 213, 60, 40,
                                   111, 32, 91, 17, 21, 53, 29, 178, 20, 0, 0,
                                   0, 26, 96, 174, 237, 156, 219, 72, 60, 130,
                                   238, 168, 125, 60, 92, 32, 47, 150, 40, 121,
                                   255, 20, 0, 0, 0, 26, 127, 46, 238, 94, 197,
                                   189, 181, 237, 237, 50, 234, 102, 56, 215,
                                   237, 228, 169, 47, 215, 20, 0, 0, 0, 31, 161,
                                   20, 219, 109, 146, 227, 130, 101, 245, 94,
                                   91, 143, 59, 97, 23, 237, 116, 99, 103, 20,
                                   0, 0, 0, 26, 100, 174, 220, 60, 242, 96, 181,
                                   110, 108, 40, 65, 228, 232, 84, 187, 212,
                                   171, 45, 21, 20, 0, 0, 0, 30, 161, 176, 239,
                                   77, 144, 10, 39, 94, 44, 112, 45, 113, 10,
                                   173, 158, 209, 0, 72, 232, 20, 0, 0, 0, 24,
                                   189, 194, 224, 98, 226, 204, 142, 206, 107,
                                   101, 89, 233, 214, 215, 144, 204, 165, 167,
                                   34, 20, 0, 0, 0, 25, 44, 36, 235, 99, 168,
                                   243, 77, 126, 98, 249, 229, 165, 233, 86,
                                   172, 152, 101, 170, 118, 20, 0, 0, 0, 26, 97,
                                   66, 223, 23, 198, 28, 83, 27, 236, 176, 88,
                                   144, 241, 247, 20, 212, 244, 206, 161, 20, 0,
                                   0, 0, 29, 219, 34, 217, 188, 169, 8, 14, 237,
                                   214, 8, 219, 214, 245, 130, 246, 154, 115,
                                   161, 138, 20, 0, 0, 0, 28, 127, 242, 222,
                                   219, 91, 200, 255, 50, 194, 171, 51, 209, 64,
                                   98, 35, 201, 199, 131, 235, 20, 0, 0, 0, 28,
                                   127, 128, 222, 79, 162, 223, 15, 45, 219,
                                   159, 160, 159, 40, 198, 142, 73, 48, 29, 72,
                                   20, 0, 0, 0, 29, 220, 102, 210, 35, 169, 137,
                                   2, 66, 238, 181, 22, 128, 224, 247, 172, 99,
                                   152, 4, 23, 20, 0, 0, 0, 26, 97, 46, 194,
                                   121, 197, 24, 87, 34, 236, 109, 45, 209, 236,
                                   82, 169, 231, 220, 219, 245, 20, 0, 0, 0, 31,
                                   172, 216, 212, 131, 37, 208, 103, 59, 247,
                                   224, 234, 66, 112, 27, 243, 103, 148, 32,
                                   159, 20, 0, 0, 0, 29, 199, 158, 221, 92, 157,
                                   32, 7, 147, 198, 165, 125, 51, 145, 0, 21,
                                   65, 186, 167, 111, 20, 0, 0, 0, 24, 173, 246,
                                   201, 105, 128, 24, 95, 135, 234, 219, 227,
                                   243, 175, 30, 14, 109, 179, 234, 40, 20, 0,
                                   0, 0, 31, 169, 68, 202, 124, 169, 84, 82, 24,
                                   219, 22, 242, 195, 118, 95, 48, 84, 126, 171,
                                   12, 20, 0, 0, 0, 31, 181, 68, 202, 237, 29,
                                   113, 149, 158, 57, 255, 188, 228, 105, 1,
                                   225, 31, 199, 193, 66, 20, 0, 0, 0, 24, 185,
                                   230, 186, 14, 29, 63, 64, 73, 238, 189, 133,
                                   31, 42, 126, 1, 241, 52, 165, 109, 20, 0, 0,
                                   0, 31, 161, 76, 179, 28, 152, 143, 76, 239,
                                   79, 244, 163, 249, 232, 87, 227, 252, 188,
                                   44, 42, 20, 0, 0, 0, 31, 181, 76, 195, 28,
                                   183, 64, 94, 67, 140, 220, 40, 211, 106, 149,
                                   86, 9, 54, 177, 226, 20, 0, 0, 0, 31, 161,
                                   80, 187, 51, 167, 236, 7, 137, 143, 15, 253,
                                   249, 106, 82, 142, 115, 181, 238, 114, 20, 0,
                                   0, 0, 31, 161, 196, 204, 179, 25, 96, 165, 6,
                                   170, 155, 129, 131, 74, 67, 85, 57, 53, 8,
                                   76, 20, 0, 0, 0, 26, 26, 70, 222, 91, 2, 179,
                                   247, 206, 58, 0, 76, 167, 8, 67, 62, 87, 144,
                                   41, 63, 20, 0, 0, 0, 31, 130, 55, 31, 185,
                                   185, 220, 40, 6, 227, 206, 108, 107, 205, 65,
                                   7, 255, 128, 173, 103, 20, 0, 0, 0, 31, 168,
                                   228, 211, 167, 161, 224, 67, 203, 212, 151,
                                   163, 132, 64, 2, 81, 245, 55, 163, 160, 20,
                                   0, 0, 0, 31, 175, 100, 217, 45, 172, 22, 249,
                                   30, 64, 166, 162, 153, 207, 58, 108, 203, 44,
                                   21, 161, 20, 0, 0, 0, 29, 149, 38, 201, 195,
                                   176, 236, 59, 91, 192, 125, 49, 31, 8, 51,
                                   227, 45, 56, 157, 142, 20, 0, 0, 0, 31, 175,
                                   36, 201, 201, 90, 192, 57, 214, 192, 184,
                                   248, 119, 40, 81, 111, 9, 181, 217, 139, 20,
                                   0, 0, 0, 31, 168, 194, 211, 45, 17, 92, 96,
                                   254, 52, 82, 227, 51, 106, 202, 219, 238, 93,
                                   159, 216, 20, 0, 0, 0, 28, 5, 124, 240, 205,
                                   253, 215, 120, 116, 229, 232, 227, 171, 101,
                                   121, 148, 163, 136, 123, 62, 20, 0, 0, 0, 31,
                                   168, 148, 229, 41, 175, 24, 179, 46, 82, 149,
                                   53, 19, 126, 76, 125, 51, 155, 166, 32, 20,
                                   0, 0, 0, 31, 168, 130, 251, 47, 39, 24, 222,
                                   84, 244, 181, 239, 200, 200, 64, 118, 48,
                                   228, 126, 126, 20, 0, 0, 0, 31, 168, 144,
                                   234, 252, 91, 207, 82, 54, 170, 64, 79, 75,
                                   170, 38, 26, 113, 63, 128, 74, 20, 0, 0, 0,
                                   31, 181, 16, 238, 251, 157, 112, 124, 116,
                                   212, 174, 120, 108, 203, 125, 202, 231, 156,
                                   36, 69, 20, 0, 0, 0, 29, 207, 198, 228, 73,
                                   250, 216, 243, 127, 27, 63, 188, 239, 57, 60,
                                   154, 186, 89, 125, 106, 20, 0, 0, 0, 31, 180,
                                   16, 235, 233, 191, 15, 53, 135, 129, 102, 19,
                                   235, 75, 1, 225, 188, 253, 217, 75, 20, 0, 0,
                                   0, 31, 153, 199, 60, 216, 57, 206, 112, 70,
                                   244, 93, 243, 164, 134, 150, 171, 195, 96,
                                   173, 72, 20, 0, 0, 0, 31, 189, 28, 228, 113,
                                   161, 241, 249, 212, 210, 128, 30, 79, 152,
                                   195, 14, 163, 205, 193, 138, 20, 0, 0, 0, 26,
                                   119, 196, 235, 113, 129, 102, 105, 190, 81,
                                   240, 98, 221, 216, 36, 201, 93, 197, 217, 32,
                                   20, 0, 0, 0, 31, 161, 164, 236, 220, 88, 16,
                                   247, 51, 167, 38, 39, 102, 98, 63, 24, 235,
                                   132, 197, 168, 20, 0, 0, 0, 26, 126, 174,
                                   226, 124, 216, 214, 174, 92, 60, 155, 253,
                                   190, 209, 71, 166, 196, 232, 212, 251, 20, 0,
                                   0, 0, 28, 11, 55, 19, 175, 43, 55, 18, 62,
                                   17, 201, 180, 118, 111, 65, 160, 95, 155,
                                   162, 241, 20, 0, 0, 0, 31, 184, 215, 31, 60,
                                   0, 233, 153, 22, 147, 141, 248, 177, 107,
                                   159, 236, 243, 48, 97, 231, 20, 0, 0, 0, 27,
                                   190, 253, 7, 175, 162, 108, 149, 36, 230,
                                   193, 123, 137, 241, 174, 42, 97, 52, 205, 71,
                                   20, 0, 0, 0, 31, 181, 165, 6, 14, 174, 211,
                                   23, 3, 137, 249, 138, 42, 72, 9, 55, 82, 227,
                                   157, 100, 20, 0, 0, 0, 31, 184, 164, 242, 28,
                                   153, 120, 185, 228, 147, 162, 128, 199, 201,
                                   83, 79, 220, 213, 170, 69, 20, 0, 0, 0, 31,
                                   184, 220, 255, 23, 236, 203, 60, 183, 11,
                                   220, 47, 123, 94, 65, 80, 138, 106, 247, 30,
                                   20, 0, 0, 0, 31, 168, 164, 232, 28, 224, 12,
                                   93, 215, 48, 137, 218, 203, 231, 69, 180, 71,
                                   144, 19, 26, 20, 0, 0, 0, 31, 181, 52, 229,
                                   77, 225, 118, 43, 231, 182, 160, 31, 199,
                                   171, 173, 217, 51, 130, 42, 5, 20, 0, 0, 0,
                                   31, 175, 20, 235, 219, 0, 250, 63, 86, 198,
                                   243, 221, 99, 104, 67, 65, 188, 165, 195,
                                   236, 20, 0, 0, 0, 31, 168, 148, 230, 238, 44,
                                   7, 62, 195, 196, 133, 61, 76, 219, 139, 207,
                                   176, 127, 121, 167, 20, 0, 0, 0, 29, 194, 70,
                                   226, 187, 45, 172, 85, 142, 47, 133, 42, 242,
                                   95, 67, 22, 216, 156, 198, 168, 20, 0, 0, 0,
                                   31, 181, 58, 224, 233, 214, 224, 86, 52, 109,
                                   107, 22, 219, 112, 14, 235, 187, 100, 33, 49,
                                   20, 0, 0, 0, 29, 201, 134, 239, 227, 225, 28,
                                   98, 110, 106, 2, 36, 127, 49, 82, 79, 226,
                                   116, 200, 224, 20, 0, 0, 0, 26, 104, 230,
                                   229, 105, 189, 149, 122, 254, 103, 255, 170,
                                   235, 107, 129, 218, 159, 139, 52, 255, 20, 0,
                                   0, 0, 29, 221, 106, 219, 60, 165, 54, 66, 9,
                                   204, 65, 179, 104, 241, 153, 19, 85, 182,
                                   191, 219, 20, 0, 0, 0, 29, 194, 70, 209, 188,
                                   207, 246, 6, 206, 86, 101, 110, 247, 34, 186,
                                   202, 71, 154, 173, 248, 20, 0, 0, 0, 29, 222,
                                   14, 216, 142, 169, 102, 89, 47, 64, 221, 203,
                                   25, 248, 139, 5, 40, 228, 172, 234, 20, 0, 0,
                                   0, 29, 218, 66, 192, 92, 162, 232, 61, 142,
                                   64, 115, 192, 200, 201, 65, 146, 108, 115,
                                   157, 81, 20, 0, 0, 0, 26, 111, 16, 206, 3,
                                   198, 146, 122, 46, 42, 127, 169, 233, 235,
                                   142, 25, 235, 155, 29, 121, 20, 0, 0, 0, 25,
                                   41, 182, 194, 220, 249, 40, 179, 210, 127,
                                   149, 175, 63, 49, 197, 190, 60, 122, 225, 96,
                                   20, 0, 0, 0, 30, 189, 144, 193, 78, 151, 23,
                                   192, 56, 144, 35, 240, 47, 137, 84, 87, 13,
                                   59, 33, 88, 20, 0, 0, 0, 25, 59, 252, 190,
                                   60, 175, 193, 140, 113, 242, 125, 74, 95, 62,
                                   82, 175, 131, 117, 197, 79, 20, 0, 0, 0, 26,
                                   118, 46, 202, 103, 156, 196, 213, 198, 147,
                                   223, 199, 99, 64, 92, 148, 239, 179, 221,
                                   105, 20, 0, 0, 0, 26, 118, 46, 205, 169, 170,
                                   5, 108, 35, 155, 52, 162, 220, 79, 51, 86,
                                   176, 235, 11, 201, 20, 0, 0, 0, 25, 43, 220,
                                   201, 41, 3, 22, 77, 206, 11, 3, 166, 219,
                                   113, 81, 105, 23, 128, 47, 96, 20, 0, 0, 0,
                                   25, 51, 208, 200, 220, 199, 11, 147, 205,
                                   208, 168, 122, 22, 43, 82, 140, 45, 32, 15,
                                   42, 20, 0, 0, 0, 26, 118, 160, 186, 7, 148,
                                   171, 45, 4, 95, 37, 65, 68, 225, 176, 18, 87,
                                   216, 169, 228, 20, 0, 0, 0, 25, 47, 148, 220,
                                   237, 141, 146, 6, 18, 138, 120, 62, 1, 214,
                                   89, 139, 28, 103, 150, 71, 20, 0, 0, 0, 25,
                                   59, 220, 186, 158, 148, 104, 68, 247, 109,
                                   44, 176, 179, 200, 38, 161, 3, 129, 78, 32,
                                   20, 0, 0, 0, 25, 44, 80, 178, 207, 161, 21,
                                   193, 193, 174, 180, 95, 72, 231, 121, 150,
                                   167, 121, 164, 246, 20, 0, 0, 0, 31, 189, 82,
                                   183, 28, 160, 77, 176, 115, 139, 20, 174,
                                   139, 135, 240, 151, 151, 180, 219, 254, 20,
                                   0, 0, 0, 31, 191, 0, 228, 3, 62, 48, 236, 78,
                                   63, 143, 189, 50, 34, 234, 59, 159, 115, 249,
                                   93, 20, 0, 0, 0, 26, 125, 174, 219, 78, 229,
                                   171, 86, 28, 98, 116, 16, 155, 192, 105, 86,
                                   21, 251, 158, 136, 20, 0, 0, 0, 31, 185, 24,
                                   210, 124, 166, 227, 10, 116, 222, 179, 254,
                                   113, 245, 82, 37, 253, 205, 65, 94, 20, 0, 0,
                                   0, 31, 165, 144, 218, 23, 210, 172, 141, 47,
                                   94, 178, 106, 31, 5, 131, 85, 103, 131, 28,
                                   15, 20, 0, 0, 0, 26, 126, 174, 222, 252, 155,
                                   232, 130, 36, 99, 166, 108, 232, 192, 192,
                                   144, 28, 111, 135, 21, 20, 0, 0, 0, 31, 163,
                                   78, 197, 45, 175, 114, 215, 212, 227, 117,
                                   146, 142, 234, 195, 79, 211, 133, 178, 233,
                                   20, 0, 0, 0, 26, 126, 174, 193, 62, 193, 231,
                                   47, 13, 189, 243, 168, 191, 23, 21, 149, 46,
                                   32, 244, 254, 20, 0, 0, 0, 31, 163, 16, 180,
                                   35, 132, 216, 42, 199, 63, 132, 181, 89, 199,
                                   145, 233, 130, 246, 9, 234, 20, 0, 0, 0, 31,
                                   175, 66, 179, 92, 219, 192, 3, 173, 224, 145,
                                   163, 251, 164, 170, 35, 66, 122, 141, 224,
                                   20, 0, 0, 0, 26, 126, 174, 173, 201, 149,
                                   231, 171, 227, 226, 223, 165, 23, 62, 248,
                                   60, 207, 145, 130, 152, 20, 0, 0, 0, 26, 103,
                                   174, 189, 233, 24, 75, 251, 226, 190, 132,
                                   157, 46, 234, 251, 210, 177, 230, 163, 0, 20,
                                   0, 0, 0, 31, 171, 66, 168, 46, 217, 235, 91,
                                   63, 77, 9, 27, 71, 45, 248, 23, 7, 105, 66,
                                   117, 20, 0, 0, 0, 26, 118, 46, 185, 51, 109,
                                   56, 85, 187, 96, 244, 43, 227, 64, 104, 0,
                                   103, 145, 61, 105, 20, 0, 0, 0, 25, 47, 180,
                                   211, 137, 91, 47, 179, 76, 19, 97, 49, 68,
                                   169, 180, 65, 177, 114, 181, 242, 20, 0, 0,
                                   0, 28, 203, 66, 250, 124, 121, 53, 92, 78,
                                   14, 39, 249, 207, 10, 2, 158, 247, 121, 72,
                                   19, 20, 0, 0, 0, 25, 52, 214, 243, 145, 180,
                                   210, 98, 151, 99, 22, 176, 126, 255, 122,
                                   175, 139, 159, 188, 226, 20, 0, 0, 0, 28,
                                   203, 66, 227, 163, 229, 82, 76, 183, 248, 31,
                                   147, 243, 190, 122, 37, 252, 247, 219, 245,
                                   20, 0, 0, 0, 28, 203, 66, 247, 47, 92, 47,
                                   72, 8, 95, 133, 216, 215, 134, 132, 31, 21,
                                   56, 201, 48, 20, 0, 0, 0, 28, 218, 102, 234,
                                   7, 134, 210, 74, 123, 211, 102, 158, 107,
                                   239, 247, 219, 0, 120, 126, 243, 20, 0, 0, 0,
                                   28, 203, 102, 231, 71, 190, 163, 93, 116,
                                   223, 154, 147, 111, 54, 97, 216, 104, 240,
                                   71, 1, 20, 0, 0, 0, 25, 63, 52, 231, 199,
                                   181, 244, 150, 87, 213, 176, 217, 222, 203,
                                   178, 84, 155, 164, 218, 173, 20, 0, 0, 0, 28,
                                   217, 102, 213, 137, 177, 118, 122, 8, 133,
                                   136, 165, 251, 171, 188, 113, 27, 155, 41,
                                   233, 20, 0, 0, 0, 28, 217, 118, 228, 124,
                                   149, 170, 250, 127, 7, 120, 159, 221, 242,
                                   183, 163, 171, 122, 136, 171, 20, 0, 0, 0,
                                   27, 177, 22, 227, 231, 137, 56, 111, 107,
                                   111, 155, 123, 95, 42, 4, 209, 235, 155, 129,
                                   89, 20, 0, 0, 0, 27, 176, 202, 233, 133, 38,
                                   0, 102, 116, 147, 44, 94, 219, 114, 81, 224,
                                   113, 245, 163, 220, 20, 0, 0, 0, 27, 177, 74,
                                   237, 187, 234, 96, 198, 174, 15, 136, 47,
                                   175, 54, 168, 152, 237, 232, 169, 7, 20, 0,
                                   0, 0, 25, 62, 182, 238, 241, 49, 56, 168, 9,
                                   110, 2, 172, 84, 200, 98, 20, 152, 228, 196,
                                   79, 20, 0, 0, 0, 27, 177, 118, 210, 220, 190,
                                   210, 247, 222, 84, 213, 77, 170, 71, 226, 70,
                                   175, 133, 189, 56, 20, 0, 0, 0, 27, 181, 10,
                                   217, 28, 161, 22, 19, 46, 65, 111, 221, 79,
                                   17, 84, 128, 64, 123, 52, 79, 20, 0, 0, 0,
                                   25, 62, 182, 213, 231, 13, 43, 121, 190, 126,
                                   144, 27, 87, 41, 77, 175, 154, 116, 29, 95,
                                   20, 0, 0, 0, 25, 40, 180, 198, 163, 173, 64,
                                   1, 81, 207, 140, 34, 227, 200, 4, 64, 155,
                                   216, 43, 80, 20, 0, 0, 0, 27, 173, 22, 205,
                                   174, 69, 106, 3, 78, 101, 80, 51, 25, 200,
                                   90, 16, 143, 140, 37, 50, 20, 0, 0, 0, 25,
                                   237, 194, 195, 237, 221, 56, 64, 182, 206,
                                   196, 35, 167, 214, 196, 46, 153, 229, 137,
                                   62, 20, 0, 0, 0, 27, 181, 58, 201, 231, 41,
                                   234, 215, 190, 64, 119, 2, 95, 105, 74, 14,
                                   165, 52, 8, 237, 20, 0, 0, 0, 31, 56, 102,
                                   202, 27, 97, 169, 120, 215, 254, 187, 37,
                                   129, 127, 81, 207, 57, 251, 180, 234, 20, 0,
                                   0, 0, 28, 63, 152, 217, 239, 203, 33, 15, 19,
                                   229, 107, 231, 15, 39, 175, 236, 196, 243,
                                   132, 255, 20, 0, 0, 0, 31, 40, 226, 216, 156,
                                   182, 75, 78, 30, 89, 20, 148, 127, 112, 141,
                                   145, 210, 118, 223, 201, 20, 0, 0, 0, 27, 33,
                                   164, 223, 131, 193, 237, 74, 121, 124, 187,
                                   0, 251, 191, 83, 34, 107, 150, 37, 22, 20, 0,
                                   0, 0, 31, 48, 162, 218, 254, 121, 106, 77,
                                   121, 144, 5, 200, 76, 118, 84, 79, 215, 146,
                                   254, 200, 20, 0, 0, 0, 31, 45, 98, 233, 50,
                                   129, 45, 103, 154, 101, 87, 206, 193, 201,
                                   65, 94, 153, 104, 109, 239, 20, 0, 0, 0, 31,
                                   44, 34, 230, 105, 198, 231, 242, 254, 16,
                                   200, 255, 255, 47, 91, 87, 3, 104, 195, 10,
                                   20, 0, 0, 0, 31, 44, 102, 228, 123, 1, 56,
                                   138, 83, 216, 19, 202, 119, 45, 124, 151,
                                   108, 246, 225, 121, 20, 0, 0, 0, 25, 249,
                                   162, 237, 13, 212, 139, 174, 129, 211, 25,
                                   14, 106, 75, 254, 31, 33, 214, 44, 241, 20,
                                   0, 0, 0, 28, 213, 88, 236, 83, 253, 234, 77,
                                   217, 133, 84, 2, 225, 230, 176, 107, 233, 59,
                                   48, 228, 20, 0, 0, 0, 29, 208, 134, 242, 248,
                                   121, 248, 27, 158, 23, 59, 170, 238, 207, 78,
                                   14, 255, 249, 17, 105, 20, 0, 0, 0, 29, 220,
                                   226, 230, 109, 189, 88, 93, 221, 206, 175,
                                   164, 176, 240, 37, 124, 107, 148, 55, 162,
                                   20, 0, 0, 0, 29, 223, 98, 249, 73, 38, 190,
                                   125, 140, 86, 189, 114, 196, 190, 59, 227,
                                   222, 150, 208, 246, 20, 0, 0, 0, 30, 177,
                                   176, 247, 216, 165, 170, 84, 214, 206, 126,
                                   74, 217, 202, 107, 233, 67, 146, 53, 40, 20,
                                   0, 0, 0, 28, 197, 2, 246, 49, 75, 248, 179,
                                   17, 192, 248, 69, 42, 99, 86, 213, 165, 171,
                                   46, 63, 20, 0, 0, 0, 29, 223, 34, 251, 40,
                                   62, 45, 123, 46, 48, 159, 156, 131, 169, 127,
                                   52, 208, 123, 0, 96, 20, 0, 0, 0, 31, 168,
                                   197, 11, 221, 35, 31, 178, 244, 129, 52, 126,
                                   211, 128, 19, 107, 51, 156, 90, 190, 20, 0,
                                   0, 0, 31, 168, 197, 10, 60, 135, 155, 250,
                                   108, 64, 146, 192, 168, 234, 90, 168, 145,
                                   59, 72, 250, 20, 0, 0, 0, 31, 181, 69, 15,
                                   156, 206, 72, 83, 238, 237, 56, 224, 88, 98,
                                   108, 79, 195, 207, 161, 69, 20, 0, 0, 0, 31,
                                   181, 66, 239, 30, 208, 235, 123, 129, 128,
                                   112, 146, 233, 181, 46, 177, 133, 113, 149,
                                   98, 20, 0, 0, 0, 29, 208, 142, 214, 105, 153,
                                   151, 126, 95, 112, 212, 85, 42, 99, 16, 132,
                                   205, 56, 68, 160, 20, 0, 0, 0, 29, 193, 142,
                                   219, 155, 195, 202, 21, 189, 236, 217, 47,
                                   166, 216, 60, 145, 144, 252, 115, 182, 20, 0,
                                   0, 0, 29, 213, 62, 220, 111, 205, 94, 126,
                                   71, 241, 55, 167, 15, 190, 235, 214, 48, 39,
                                   213, 235, 20, 0, 0, 0, 29, 221, 14, 204, 158,
                                   50, 40, 198, 45, 224, 240, 223, 215, 43, 22,
                                   115, 35, 132, 42, 232, 20, 0, 0, 0, 29, 221,
                                   66, 204, 251, 249, 6, 62, 57, 224, 152, 137,
                                   234, 117, 127, 223, 136, 255, 182, 49, 20, 0,
                                   0, 0, 29, 221, 10, 205, 5, 173, 230, 148, 33,
                                   238, 120, 160, 162, 113, 67, 207, 170, 101,
                                   252, 16, 20, 0, 0, 0, 29, 194, 18, 205, 79,
                                   152, 234, 144, 180, 212, 163, 130, 142, 43,
                                   250, 43, 167, 18, 224, 170, 20, 0, 0, 0, 29,
                                   221, 98, 205, 16, 218, 196, 254, 162, 226,
                                   72, 167, 19, 223, 240, 17, 161, 211, 134, 34,
                                   20, 0, 0, 0, 29, 193, 226, 196, 94, 167, 33,
                                   30, 7, 234, 1, 230, 112, 226, 65, 113, 88,
                                   224, 44, 18, 20, 0, 0, 0, 29, 205, 226, 192,
                                   177, 219, 255, 194, 97, 226, 52, 158, 136,
                                   214, 179, 46, 95, 143, 124, 232, 20, 0, 0, 0,
                                   29, 194, 6, 182, 183, 255, 22, 107, 67, 225,
                                   104, 250, 215, 63, 172, 65, 111, 147, 97,
                                   245, 20, 0, 0, 0, 29, 204, 34, 189, 105, 29,
                                   21, 151, 33, 221, 56, 218, 119, 56, 82, 143,
                                   36, 224, 124, 173, 20, 0, 0, 0, 30, 181, 186,
                                   190, 137, 147, 11, 124, 23, 99, 63, 191, 208,
                                   225, 171, 233, 231, 147, 190, 225, 20, 0, 0,
                                   0, 31, 168, 194, 189, 77, 41, 168, 1, 142,
                                   86, 85, 1, 0, 200, 66, 35, 191, 135, 229,
                                   190, 20, 0, 0, 0, 31, 168, 146, 168, 102,
                                   153, 53, 84, 19, 129, 160, 51, 54, 114, 42,
                                   31, 10, 247, 172, 172, 20, 0, 0, 0, 31, 168,
                                   210, 188, 92, 192, 119, 106, 190, 44, 148,
                                   215, 47, 0, 193, 174, 193, 133, 253, 40, 20,
                                   0, 0, 0, 31, 168, 216, 171, 57, 138, 98, 108,
                                   66, 228, 126, 45, 107, 105, 130, 144, 23,
                                   150, 0, 168, 20, 0, 0, 0, 31, 168, 216, 162,
                                   233, 169, 103, 157, 192, 229, 196, 162, 242,
                                   232, 247, 144, 103, 148, 61, 105, 20, 0, 0,
                                   0, 31, 181, 66, 171, 175, 174, 131, 135, 62,
                                   99, 58, 96, 220, 109, 85, 149, 173, 49, 44,
                                   0, 20, 0, 0, 0, 25, 57, 214, 179, 220, 172,
                                   72, 87, 229, 236, 84, 129, 170, 111, 201, 96,
                                   83, 151, 167, 231, 20, 0, 0, 0, 25, 33, 214,
                                   192, 231, 124, 12, 88, 28, 192, 52, 85, 127,
                                   42, 186, 89, 240, 98, 88, 201, 20, 0, 0, 0,
                                   25, 41, 214, 220, 60, 227, 62, 251, 253, 151,
                                   27, 98, 1, 202, 45, 189, 95, 223, 180, 88,
                                   20, 0, 0, 0, 25, 33, 218, 201, 163, 181, 106,
                                   95, 135, 212, 251, 30, 135, 42, 72, 128, 32,
                                   176, 125, 177, 20, 0, 0, 0, 25, 41, 180, 216,
                                   27, 133, 236, 252, 44, 112, 115, 248, 191,
                                   22, 139, 63, 98, 115, 173, 184, 20, 0, 0, 0,
                                   25, 33, 214, 217, 124, 216, 7, 33, 166, 219,
                                   140, 94, 23, 176, 52, 71, 96, 228, 163, 9,
                                   20, 0, 0, 0, 26, 104, 146, 219, 37, 198, 69,
                                   154, 230, 192, 32, 55, 79, 32, 146, 112, 8,
                                   79, 213, 8, 20, 0, 0, 0, 26, 104, 194, 210,
                                   9, 124, 5, 7, 15, 13, 15, 83, 55, 56, 178,
                                   87, 165, 32, 30, 39, 20, 0, 0, 0, 29, 206, 6,
                                   220, 244, 201, 248, 83, 190, 109, 22, 39, 57,
                                   17, 124, 175, 104, 227, 197, 47, 20, 0, 0, 0,
                                   27, 165, 46, 206, 41, 254, 199, 94, 180, 192,
                                   95, 125, 151, 42, 132, 94, 71, 128, 126, 10,
                                   20, 0, 0, 0, 31, 163, 0, 198, 131, 73, 62,
                                   85, 131, 244, 133, 114, 154, 43, 76, 97, 4,
                                   228, 201, 79, 20, 0, 0, 0, 31, 176, 28, 198,
                                   135, 150, 250, 84, 65, 240, 182, 215, 80,
                                   205, 82, 90, 179, 155, 0, 7, 20, 0, 0, 0, 31,
                                   173, 156, 199, 135, 173, 19, 198, 234, 204,
                                   53, 127, 61, 240, 74, 247, 103, 10, 193, 160,
                                   20, 0, 0, 0, 29, 152, 243, 15, 187, 101, 194,
                                   86, 3, 156, 231, 1, 55, 11, 33, 16, 133, 181,
                                   125, 115, 20, 0, 0, 0, 28, 10, 55, 32, 187,
                                   165, 118, 181, 134, 16, 12, 187, 119, 18, 6,
                                   85, 161, 127, 206, 202, 20, 0, 0, 0, 27, 185,
                                   253, 30, 166, 166, 190, 62, 228, 252, 136,
                                   70, 135, 128, 1, 81, 96, 169, 13, 229, 20, 0,
                                   0, 0, 27, 165, 92, 246, 28, 144, 224, 1, 126,
                                   35, 112, 124, 36, 95, 6, 45, 178, 56, 134,
                                   152, 20, 0, 0, 0, 26, 109, 130, 227, 156,
                                   164, 64, 95, 247, 91, 229, 152, 127, 176,
                                   194, 85, 91, 210, 217, 83, 20, 0, 0, 0, 31,
                                   176, 48, 239, 206, 213, 103, 252, 199, 205,
                                   63, 142, 59, 98, 57, 23, 107, 0, 45, 37, 20,
                                   0, 0, 0, 26, 109, 130, 227, 105, 155, 198,
                                   21, 103, 197, 158, 77, 7, 9, 13, 70, 143,
                                   138, 151, 234, 20, 0, 0, 0, 29, 203, 166,
                                   212, 156, 252, 64, 133, 126, 217, 245, 70,
                                   226, 41, 50, 163, 128, 179, 174, 170, 20, 0,
                                   0, 0, 26, 109, 130, 219, 152, 245, 103, 111,
                                   233, 227, 5, 198, 211, 213, 56, 63, 31, 59,
                                   125, 95, 20, 0, 0, 0, 26, 109, 176, 212, 252,
                                   177, 107, 124, 135, 159, 137, 75, 51, 134,
                                   147, 193, 219, 149, 227, 199, 20, 0, 0, 0,
                                   26, 123, 224, 210, 238, 197, 146, 134, 230,
                                   234, 67, 170, 34, 107, 105, 79, 130, 90, 169,
                                   128, 20, 0, 0, 0, 31, 85, 32, 211, 14, 2,
                                   160, 12, 176, 229, 140, 190, 247, 138, 57,
                                   24, 185, 181, 31, 220, 20, 0, 0, 0, 31, 85,
                                   18, 200, 51, 191, 197, 66, 100, 212, 191,
                                   171, 25, 241, 20, 227, 235, 149, 21, 79, 20,
                                   0, 0, 0, 28, 105, 224, 202, 92, 129, 224,
                                   151, 148, 241, 101, 136, 202, 40, 195, 228,
                                   221, 197, 129, 111, 20, 0, 0, 0, 31, 123,
                                   130, 203, 94, 18, 126, 41, 104, 72, 181, 119,
                                   49, 199, 222, 114, 239, 199, 169, 245, 20, 0,
                                   0, 0, 29, 219, 46, 144, 241, 224, 24, 123, 8,
                                   243, 86, 60, 67, 81, 76, 17, 255, 119, 168,
                                   0, 20, 0, 0, 0, 27, 195, 66, 163, 5, 128,
                                   101, 5, 178, 214, 164, 112, 247, 42, 168,
                                   215, 41, 245, 217, 93, 20, 0, 0, 0, 29, 220,
                                   78, 169, 169, 161, 94, 248, 152, 208, 112, 2,
                                   190, 233, 2, 49, 43, 131, 175, 247, 20, 0, 0,
                                   0, 29, 217, 46, 163, 72, 193, 55, 105, 71,
                                   231, 88, 158, 72, 234, 82, 146, 116, 123, 2,
                                   235, 20, 0, 0, 0, 29, 217, 124, 161, 9, 254,
                                   192, 60, 225, 214, 167, 153, 239, 152, 92, 9,
                                   243, 245, 216, 82, 20, 0, 0, 0, 25, 240, 66,
                                   163, 142, 177, 187, 18, 61, 212, 211, 162,
                                   93, 233, 43, 206, 61, 164, 190, 232, 20, 0,
                                   0, 0, 25, 45, 36, 163, 92, 168, 6, 85, 105,
                                   248, 171, 63, 31, 41, 50, 15, 144, 116, 34,
                                   119, 20, 0, 0, 0, 29, 199, 56, 182, 103, 62,
                                   180, 181, 98, 255, 98, 88, 174, 203, 123,
                                   236, 196, 240, 14, 229, 20, 0, 0, 0, 29, 220,
                                   66, 180, 35, 5, 2, 65, 254, 23, 248, 45, 27,
                                   105, 181, 108, 143, 154, 129, 233, 20, 0, 0,
                                   0, 25, 52, 80, 182, 27, 55, 194, 2, 159, 243,
                                   35, 255, 34, 111, 33, 212, 60, 169, 46, 168,
                                   20, 0, 0, 0, 29, 220, 110, 191, 101, 216,
                                   234, 217, 174, 0, 139, 77, 187, 86, 66, 206,
                                   212, 60, 161, 234, 20, 0, 0, 0, 31, 118, 160,
                                   177, 128, 130, 233, 85, 206, 0, 58, 164, 70,
                                   207, 61, 164, 137, 218, 168, 235, 20, 0, 0,
                                   0, 31, 102, 174, 207, 101, 33, 171, 78, 137,
                                   108, 180, 124, 89, 235, 52, 226, 92, 119,
                                   218, 214, 20, 0, 0, 0, 31, 100, 194, 195,
                                   241, 217, 82, 9, 64, 236, 175, 199, 62, 246,
                                   76, 106, 255, 147, 202, 10, 20, 0, 0, 0, 31,
                                   118, 160, 203, 28, 33, 171, 91, 244, 192,
                                   127, 219, 47, 43, 65, 215, 163, 156, 45, 73,
                                   20, 0, 0, 0, 24, 98, 136, 218, 45, 229, 48,
                                   174, 14, 162, 145, 43, 9, 240, 10, 246, 29,
                                   159, 109, 152, 20, 0, 0, 0, 28, 51, 206, 214,
                                   156, 219, 99, 145, 198, 242, 24, 55, 63, 56,
                                   82, 210, 95, 132, 2, 200, 20, 0, 0, 0, 31,
                                   167, 221, 30, 188, 21, 121, 38, 158, 17, 244,
                                   88, 127, 33, 100, 120, 65, 182, 243, 200, 20,
                                   0, 0, 0, 31, 174, 36, 249, 173, 218, 106, 4,
                                   246, 214, 119, 137, 158, 222, 190, 166, 60,
                                   99, 121, 32, 20, 0, 0, 0, 31, 190, 36, 225,
                                   111, 33, 4, 246, 183, 193, 22, 53, 103, 56,
                                   252, 42, 149, 253, 20, 241, 20, 0, 0, 0, 28,
                                   10, 55, 58, 187, 56, 238, 101, 228, 131, 215,
                                   46, 174, 202, 24, 21, 46, 89, 129, 175, 20,
                                   0, 0, 0, 28, 12, 55, 52, 90, 73, 52, 79, 174,
                                   148, 204, 79, 86, 32, 111, 231, 112, 214,
                                   226, 86, 20, 0, 0, 0, 31, 183, 17, 9, 209,
                                   195, 237, 130, 183, 86, 183, 130, 252, 88,
                                   106, 64, 99, 133, 165, 64, 20, 0, 0, 0, 31,
                                   161, 16, 225, 30, 232, 23, 119, 87, 248, 191,
                                   34, 4, 101, 139, 250, 12, 112, 96, 232, 20,
                                   0, 0, 0, 31, 175, 16, 212, 28, 3, 96, 141, 5,
                                   225, 211, 171, 99, 224, 188, 99, 14, 117, 35,
                                   182, 20, 0, 0, 0, 26, 126, 252, 216, 252,
                                   170, 149, 103, 28, 82, 15, 223, 145, 200, 64,
                                   10, 49, 32, 61, 10, 20, 0, 0, 0, 26, 126,
                                   252, 206, 94, 70, 80, 1, 174, 86, 83, 43, 35,
                                   122, 86, 83, 245, 169, 121, 232, 20, 0, 0, 0,
                                   26, 109, 174, 179, 92, 196, 240, 78, 30, 115,
                                   42, 253, 194, 88, 132, 51, 176, 242, 30, 34,
                                   20, 0, 0, 0, 26, 125, 16, 180, 99, 215, 13,
                                   41, 222, 86, 150, 161, 86, 234, 80, 219, 251,
                                   117, 251, 217, 20, 0, 0, 0, 26, 98, 16, 162,
                                   169, 157, 25, 222, 148, 208, 135, 251, 235,
                                   173, 2, 239, 141, 244, 35, 151, 20, 0, 0, 0,
                                   26, 97, 16, 185, 169, 39, 30, 111, 249, 188,
                                   43, 220, 192, 203, 242, 148, 63, 149, 252, 1,
                                   20, 0, 0, 0, 26, 111, 16, 168, 124, 169, 24,
                                   123, 105, 212, 71, 156, 79, 141, 139, 81, 62,
                                   40, 217, 87, 20, 0, 0, 0, 26, 104, 174, 150,
                                   60, 203, 13, 62, 244, 196, 176, 54, 47, 44,
                                   142, 49, 75, 152, 127, 246, 20, 0, 0, 0, 26,
                                   120, 196, 162, 60, 255, 177, 60, 1, 211, 40,
                                   34, 96, 239, 110, 35, 72, 164, 88, 231, 20,
                                   0, 0, 0, 26, 111, 46, 147, 233, 242, 18, 108,
                                   97, 222, 7, 172, 241, 232, 86, 20, 84, 113,
                                   137, 119, 20, 0, 0, 0, 27, 193, 10, 155, 79,
                                   197, 100, 76, 174, 58, 156, 43, 179, 190,
                                   177, 151, 32, 251, 85, 107, 20, 0, 0, 0, 27,
                                   221, 6, 154, 205, 0, 16, 86, 157, 213, 63,
                                   19, 20, 214, 14, 31, 225, 194, 97, 114, 20,
                                   0, 0, 0, 26, 125, 164, 151, 230, 160, 77,
                                   123, 190, 80, 152, 107, 70, 47, 13, 92, 91,
                                   116, 163, 184, 20, 0, 0, 0, 26, 97, 16, 145,
                                   243, 41, 240, 62, 65, 227, 226, 210, 219,
                                   106, 107, 206, 101, 48, 25, 60, 20, 0, 0, 0,
                                   26, 120, 196, 152, 13, 34, 239, 7, 98, 142,
                                   132, 44, 159, 42, 66, 78, 152, 100, 128, 10,
                                   20, 0, 0, 0, 27, 213, 10, 155, 38, 168, 209,
                                   73, 180, 211, 228, 10, 139, 114, 192, 150,
                                   65, 53, 199, 136, 20, 0, 0, 0, 25, 34, 100,
                                   140, 124, 164, 113, 72, 194, 232, 181, 121,
                                   207, 63, 30, 44, 100, 239, 90, 217, 20, 0, 0,
                                   0, 24, 162, 52, 152, 156, 167, 7, 215, 227,
                                   248, 161, 41, 240, 234, 193, 45, 77, 217,
                                   196, 17, 20, 0, 0, 0, 26, 118, 78, 159, 60,
                                   33, 15, 153, 190, 99, 102, 179, 167, 16, 61,
                                   154, 79, 149, 41, 148, 20, 0, 0, 0, 27, 206,
                                   6, 147, 163, 112, 168, 172, 126, 119, 195,
                                   51, 214, 58, 73, 88, 121, 190, 45, 96, 20, 0,
                                   0, 0, 24, 162, 118, 174, 156, 166, 223, 82,
                                   185, 237, 104, 20, 94, 60, 199, 236, 208,
                                   112, 46, 248, 20, 0, 0, 0, 31, 175, 78, 206,
                                   134, 96, 138, 59, 152, 1, 234, 219, 31, 47,
                                   243, 5, 135, 146, 194, 52, 20, 0, 0, 0, 31,
                                   168, 220, 189, 103, 124, 26, 146, 14, 60,
                                   253, 205, 95, 9, 122, 73, 191, 147, 165, 120,
                                   20, 0, 0, 0, 31, 161, 116, 210, 205, 151,
                                   112, 137, 72, 129, 200, 255, 138, 95, 120,
                                   80, 117, 236, 42, 185, 20, 0, 0, 0, 31, 168,
                                   228, 179, 233, 30, 33, 80, 191, 80, 166, 45,
                                   250, 98, 67, 94, 174, 88, 2, 210, 20, 0, 0,
                                   0, 28, 18, 55, 2, 220, 108, 255, 22, 27, 52,
                                   225, 8, 115, 123, 108, 61, 34, 86, 133, 6,
                                   20, 0, 0, 0, 28, 30, 55, 10, 25, 156, 47, 52,
                                   255, 254, 191, 51, 47, 12, 181, 207, 187, 85,
                                   165, 9, 20, 0, 0, 0, 31, 191, 86, 253, 211,
                                   190, 61, 22, 61, 133, 32, 15, 92, 90, 66, 89,
                                   122, 43, 111, 176, 20, 0, 0, 0, 27, 173, 86,
                                   206, 62, 121, 32, 61, 239, 44, 244, 217, 64,
                                   229, 161, 19, 188, 243, 43, 245, 20, 0, 0, 0,
                                   28, 177, 144, 181, 124, 129, 8, 247, 196, 86,
                                   11, 37, 171, 216, 66, 64, 99, 145, 38, 202,
                                   20, 0, 0, 0, 29, 133, 242, 207, 14, 93, 32,
                                   239, 58, 107, 230, 146, 176, 245, 75, 212,
                                   32, 100, 50, 41, 20, 0, 0, 0, 29, 144, 242,
                                   190, 7, 153, 22, 131, 77, 236, 4, 164, 202,
                                   98, 96, 222, 143, 216, 182, 66, 20, 0, 0, 0,
                                   31, 144, 38, 204, 131, 41, 13, 1, 254, 64, 9,
                                   160, 52, 106, 148, 189, 218, 223, 137, 47,
                                   20, 0, 0, 0, 29, 145, 210, 194, 73, 164, 28,
                                   59, 4, 208, 148, 217, 179, 120, 194, 168,
                                   131, 128, 125, 29, 20, 0, 0, 0, 31, 173, 220,
                                   183, 79, 157, 6, 157, 238, 95, 21, 125, 39,
                                   21, 3, 124, 60, 118, 103, 75, 20, 0, 0, 0,
                                   31, 155, 166, 198, 14, 62, 92, 16, 140, 176,
                                   58, 1, 43, 73, 51, 64, 246, 214, 255, 126,
                                   20, 0, 0, 0, 31, 155, 134, 192, 237, 167, 8,
                                   58, 183, 18, 11, 22, 7, 22, 91, 95, 1, 165,
                                   196, 157, 20, 0, 0, 0, 31, 130, 38, 205, 23,
                                   142, 172, 225, 135, 15, 177, 41, 171, 150,
                                   183, 109, 239, 139, 193, 18, 20, 0, 0, 0, 31,
                                   140, 38, 199, 191, 175, 7, 180, 68, 155, 225,
                                   201, 238, 240, 82, 181, 229, 164, 43, 255,
                                   20, 0, 0, 0, 31, 136, 38, 194, 183, 141, 76,
                                   47, 135, 86, 198, 227, 60, 210, 187, 237,
                                   217, 41, 61, 115, 20, 0, 0, 0, 31, 185, 196,
                                   203, 60, 189, 76, 34, 92, 210, 34, 73, 187,
                                   113, 181, 109, 159, 195, 156, 0, 20, 0, 0, 0,
                                   31, 170, 208, 200, 28, 247, 252, 100, 86,
                                   203, 89, 205, 202, 113, 41, 125, 195, 115, 0,
                                   11, 20, 0, 0, 0, 31, 176, 68, 207, 58, 199,
                                   201, 44, 222, 119, 62, 131, 52, 232, 253,
                                   110, 121, 59, 250, 31, 20, 0, 0, 0, 31, 185,
                                   208, 190, 78, 255, 255, 131, 132, 231, 104,
                                   43, 186, 103, 90, 94, 190, 251, 212, 159, 20,
                                   0, 0, 0, 31, 155, 134, 178, 142, 199, 31,
                                   253, 86, 192, 6, 227, 33, 226, 75, 108, 248,
                                   223, 158, 164, 20, 0, 0, 0, 31, 170, 208,
                                   183, 115, 195, 248, 143, 118, 214, 57, 2,
                                   199, 32, 85, 103, 37, 189, 225, 74, 20, 0, 0,
                                   0, 31, 137, 166, 203, 102, 179, 195, 37, 140,
                                   189, 45, 149, 235, 223, 166, 246, 137, 36, 7,
                                   18, 20, 0, 0, 0, 31, 185, 208, 181, 92, 255,
                                   224, 131, 217, 144, 196, 204, 238, 108, 138,
                                   227, 126, 113, 9, 12, 20, 0, 0, 0, 28, 16,
                                   14, 201, 202, 89, 249, 177, 150, 140, 64,
                                   217, 48, 105, 143, 193, 103, 148, 132, 209,
                                   20, 0, 0, 0, 28, 5, 198, 222, 109, 87, 10,
                                   164, 242, 65, 48, 8, 214, 106, 38, 11, 253,
                                   156, 74, 0, 20, 0, 0, 0, 31, 149, 134, 211,
                                   110, 171, 236, 41, 222, 115, 145, 126, 106,
                                   79, 129, 144, 113, 173, 205, 4, 20, 0, 0, 0,
                                   28, 25, 198, 223, 171, 195, 143, 163, 77,
                                   152, 159, 25, 170, 124, 111, 178, 223, 155,
                                   166, 34, 20, 0, 0, 0, 28, 18, 55, 24, 1, 5,
                                   217, 63, 169, 87, 121, 125, 92, 175, 97, 107,
                                   209, 168, 217, 72, 20, 0, 0, 0, 28, 10, 199,
                                   46, 48, 185, 203, 63, 11, 107, 244, 216, 95,
                                   155, 140, 209, 190, 39, 253, 7, 20, 0, 0, 0,
                                   28, 29, 71, 47, 249, 231, 17, 238, 104, 119,
                                   1, 107, 99, 66, 75, 212, 30, 44, 43, 7, 20,
                                   0, 0, 0, 31, 182, 79, 30, 45, 176, 149, 110,
                                   35, 239, 226, 29, 18, 87, 105, 40, 173, 204,
                                   189, 17, 20, 0, 0, 0, 31, 190, 220, 245, 222,
                                   35, 105, 252, 56, 150, 179, 234, 106, 202,
                                   104, 229, 163, 156, 242, 18, 20, 0, 0, 0, 31,
                                   168, 252, 225, 47, 164, 54, 252, 249, 160,
                                   38, 54, 155, 200, 178, 88, 57, 235, 85, 66,
                                   20, 0, 0, 0, 31, 176, 182, 219, 235, 241,
                                   139, 213, 12, 245, 40, 113, 57, 192, 220,
                                   215, 251, 130, 232, 32, 20, 0, 0, 0, 28, 178,
                                   228, 194, 227, 212, 47, 4, 236, 220, 242, 31,
                                   167, 124, 94, 16, 103, 196, 32, 64, 20, 0, 0,
                                   0, 31, 180, 206, 204, 187, 252, 39, 7, 8,
                                   210, 133, 62, 139, 77, 102, 42, 239, 132,
                                   224, 170, 20, 0, 0, 0, 31, 167, 182, 197,
                                   252, 233, 111, 185, 30, 63, 197, 28, 9, 178,
                                   210, 171, 161, 241, 98, 191, 20, 0, 0, 0, 29,
                                   145, 14, 205, 44, 149, 56, 178, 152, 186, 12,
                                   32, 239, 10, 73, 201, 54, 76, 34, 219, 20, 0,
                                   0, 0, 31, 188, 100, 198, 60, 196, 79, 193,
                                   103, 231, 106, 189, 79, 152, 65, 216, 123,
                                   128, 43, 234, 20, 0, 0, 0, 30, 96, 216, 178,
                                   45, 216, 226, 245, 225, 204, 59, 167, 147,
                                   200, 56, 26, 79, 146, 156, 24, 20, 0, 0, 0,
                                   30, 118, 152, 185, 101, 188, 255, 254, 214,
                                   210, 136, 36, 193, 241, 248, 217, 139, 146,
                                   181, 98, 20, 0, 0, 0, 31, 190, 46, 191, 227,
                                   160, 1, 75, 69, 196, 187, 130, 115, 149, 62,
                                   42, 133, 167, 255, 229, 20, 0, 0, 0, 31, 190,
                                   46, 179, 60, 39, 74, 69, 212, 149, 168, 28,
                                   239, 19, 113, 239, 143, 148, 169, 179, 20, 0,
                                   0, 0, 29, 141, 110, 185, 188, 9, 21, 61, 156,
                                   34, 1, 199, 175, 168, 49, 111, 123, 146, 161,
                                   73, 20, 0, 0, 0, 29, 145, 110, 185, 77, 53,
                                   48, 10, 162, 128, 151, 131, 135, 42, 86, 20,
                                   208, 168, 53, 47, 20, 0, 0, 0, 31, 190, 68,
                                   187, 243, 25, 17, 143, 143, 30, 7, 171, 230,
                                   241, 199, 78, 197, 160, 11, 10, 20, 0, 0, 0,
                                   29, 145, 124, 176, 87, 105, 141, 35, 68, 254,
                                   164, 128, 255, 63, 82, 190, 34, 61, 100, 184,
                                   20, 0, 0, 0, 31, 174, 68, 172, 207, 176, 7,
                                   58, 46, 112, 133, 34, 239, 17, 255, 254, 67,
                                   148, 169, 8, 20, 0, 0, 0, 28, 162, 132, 162,
                                   41, 129, 118, 69, 147, 212, 5, 209, 8, 248,
                                   56, 210, 28, 122, 29, 97, 20, 0, 0, 0, 31,
                                   185, 68, 162, 137, 9, 228, 92, 164, 215, 148,
                                   167, 219, 203, 25, 208, 125, 36, 40, 228, 20,
                                   0, 0, 0, 31, 161, 100, 167, 41, 34, 224, 146,
                                   125, 211, 196, 77, 67, 171, 168, 116, 173,
                                   239, 98, 85, 20, 0, 0, 0, 31, 163, 100, 175,
                                   45, 189, 30, 123, 30, 100, 180, 18, 135, 0,
                                   2, 194, 127, 131, 39, 144, 20, 0, 0, 0, 24,
                                   181, 182, 173, 109, 224, 68, 53, 20, 150,
                                   191, 31, 170, 44, 67, 234, 138, 39, 180, 239,
                                   20, 0, 0, 0, 24, 170, 230, 144, 233, 165, 72,
                                   0, 193, 64, 20, 162, 10, 95, 26, 1, 117, 192,
                                   99, 246, 20, 0, 0, 0, 26, 126, 160, 143, 92,
                                   196, 104, 90, 87, 192, 165, 53, 243, 74, 99,
                                   44, 169, 218, 130, 196, 20, 0, 0, 0, 29, 204,
                                   34, 141, 45, 217, 135, 6, 78, 109, 158, 34,
                                   47, 54, 110, 206, 117, 212, 156, 54, 20, 0,
                                   0, 0, 26, 121, 174, 143, 3, 97, 51, 100, 129,
                                   210, 124, 18, 202, 74, 86, 35, 138, 35, 188,
                                   10, 20, 0, 0, 0, 31, 189, 40, 141, 92, 165,
                                   224, 250, 83, 239, 20, 87, 215, 44, 4, 68,
                                   249, 63, 180, 210, 20, 0, 0, 0, 29, 201, 134,
                                   138, 207, 39, 10, 249, 206, 80, 186, 128,
                                   255, 62, 65, 20, 72, 112, 124, 8, 20, 0, 0,
                                   0, 29, 193, 142, 133, 110, 217, 51, 174, 251,
                                   202, 6, 138, 140, 120, 66, 95, 37, 211, 193,
                                   126, 20, 0, 0, 0, 26, 104, 194, 142, 9, 3,
                                   247, 195, 164, 228, 180, 3, 163, 114, 184,
                                   16, 73, 183, 228, 232, 20, 0, 0, 0, 29, 211,
                                   134, 142, 155, 249, 12, 67, 119, 22, 0, 38,
                                   88, 248, 67, 39, 62, 53, 61, 232, 20, 0, 0,
                                   0, 26, 113, 174, 143, 5, 255, 192, 0, 81,
                                   112, 150, 46, 16, 225, 84, 190, 255, 158, 16,
                                   231, 20, 0, 0, 0, 29, 207, 134, 139, 109, 39,
                                   242, 33, 246, 228, 83, 222, 83, 113, 66, 148,
                                   148, 240, 90, 42, 20, 0, 0, 0, 27, 165, 118,
                                   142, 28, 191, 103, 130, 87, 34, 241, 183,
                                   215, 42, 83, 79, 51, 151, 228, 6, 20, 0, 0,
                                   0, 31, 163, 16, 143, 252, 255, 231, 244, 62,
                                   78, 139, 161, 153, 216, 77, 69, 181, 61, 3,
                                   107, 20, 0, 0, 0, 26, 104, 206, 130, 41, 217,
                                   137, 59, 222, 99, 6, 36, 175, 63, 250, 18,
                                   32, 80, 44, 10, 20, 0, 0, 0, 27, 180, 88,
                                   148, 87, 27, 5, 237, 231, 33, 249, 94, 159,
                                   112, 53, 153, 223, 149, 0, 248, 20, 0, 0, 0,
                                   31, 143, 30, 238, 124, 43, 167, 202, 62, 9,
                                   232, 150, 68, 184, 87, 138, 185, 63, 205, 32,
                                   20, 0, 0, 0, 27, 165, 236, 219, 107, 175, 52,
                                   161, 87, 209, 140, 197, 195, 113, 106, 216,
                                   249, 21, 233, 63, 20, 0, 0, 0, 27, 165, 190,
                                   181, 92, 191, 255, 161, 193, 206, 147, 197,
                                   40, 199, 85, 16, 69, 160, 159, 10, 20, 0, 0,
                                   0, 25, 53, 148, 168, 173, 169, 184, 255, 35,
                                   236, 158, 21, 86, 239, 139, 15, 4, 242, 37,
                                   11, 20, 0, 0, 0, 25, 53, 130, 163, 124, 162,
                                   254, 77, 45, 248, 148, 31, 243, 109, 51, 4,
                                   94, 117, 129, 42, 20, 0, 0, 0, 29, 221, 162,
                                   168, 188, 218, 32, 57, 196, 231, 241, 225,
                                   202, 117, 60, 33, 27, 148, 108, 235, 20, 0,
                                   0, 0, 25, 53, 220, 162, 41, 135, 194, 252,
                                   246, 202, 196, 60, 171, 73, 178, 208, 5, 236,
                                   121, 107, 20, 0, 0, 0, 27, 161, 74, 145, 252,
                                   135, 9, 70, 255, 80, 101, 248, 215, 32, 76,
                                   145, 38, 252, 183, 186, 20, 0, 0, 0, 27, 165,
                                   216, 156, 124, 165, 63, 79, 62, 84, 127, 0,
                                   203, 112, 2, 150, 149, 49, 221, 41, 20, 0, 0,
                                   0, 26, 104, 160, 155, 167, 169, 35, 1, 190,
                                   14, 165, 97, 191, 175, 226, 150, 20, 183,
                                   182, 82, 20, 0, 0, 0, 27, 180, 88, 144, 33,
                                   178, 179, 111, 79, 6, 27, 229, 46, 203, 58,
                                   114, 223, 128, 172, 4, 20, 0, 0, 0, 29, 136,
                                   234, 184, 111, 55, 25, 189, 182, 143, 63, 16,
                                   50, 49, 52, 25, 227, 134, 46, 226, 20, 0, 0,
                                   0, 28, 18, 54, 210, 92, 33, 25, 131, 46, 30,
                                   53, 222, 220, 170, 111, 208, 162, 148, 29,
                                   120, 20, 0, 0, 0, 28, 18, 215, 57, 114, 132,
                                   108, 66, 220, 254, 216, 10, 220, 179, 67,
                                   234, 94, 43, 55, 232, 20, 0, 0, 0, 28, 3, 55,
                                   22, 33, 164, 0, 55, 247, 126, 57, 88, 185,
                                   224, 206, 7, 51, 127, 181, 215, 20, 0, 0, 0,
                                   28, 16, 55, 7, 179, 167, 255, 101, 212, 218,
                                   38, 188, 186, 100, 31, 12, 207, 148, 156, 43,
                                   20, 0, 0, 0, 28, 29, 54, 243, 142, 233, 74,
                                   124, 110, 64, 62, 126, 250, 111, 88, 90, 78,
                                   43, 48, 55, 20, 0, 0, 0, 28, 16, 54, 254, 78,
                                   53, 172, 199, 14, 71, 117, 33, 247, 62, 117,
                                   155, 204, 232, 156, 136, 20, 0, 0, 0, 28, 3,
                                   54, 245, 15, 55, 243, 3, 158, 20, 244, 28,
                                   231, 210, 180, 171, 223, 35, 212, 22, 20, 0,
                                   0, 0, 31, 190, 164, 228, 124, 116, 22, 192,
                                   201, 213, 216, 182, 87, 15, 245, 96, 167, 54,
                                   175, 120, 20, 0, 0, 0, 28, 16, 54, 239, 6,
                                   194, 219, 203, 141, 226, 2, 63, 118, 107, 61,
                                   157, 67, 143, 131, 31, 20, 0, 0, 0, 28, 2,
                                   100, 218, 97, 193, 0, 159, 119, 111, 119,
                                   162, 247, 8, 183, 247, 117, 116, 200, 143,
                                   20, 0, 0, 0, 28, 5, 214, 212, 202, 160, 94,
                                   223, 199, 100, 201, 251, 61, 245, 74, 67,
                                   201, 225, 198, 222, 20, 0, 0, 0, 31, 157,
                                   166, 214, 188, 196, 224, 89, 129, 186, 172,
                                   35, 239, 26, 39, 63, 251, 143, 52, 141, 20,
                                   0, 0, 0, 31, 152, 134, 194, 92, 176, 216,
                                   180, 7, 85, 245, 178, 167, 9, 35, 253, 203,
                                   205, 115, 82, 20, 0, 0, 0, 31, 157, 38, 187,
                                   137, 242, 208, 56, 230, 210, 153, 215, 183,
                                   103, 194, 164, 87, 201, 66, 79, 20, 0, 0, 0,
                                   31, 158, 106, 173, 113, 202, 224, 91, 137,
                                   193, 22, 190, 221, 105, 84, 212, 211, 148,
                                   137, 44, 20, 0, 0, 0, 31, 144, 38, 165, 253,
                                   164, 51, 241, 196, 192, 1, 165, 16, 127, 255,
                                   143, 222, 240, 33, 26, 20, 0, 0, 0, 31, 131,
                                   38, 182, 15, 240, 84, 239, 190, 110, 93, 54,
                                   241, 215, 188, 173, 154, 117, 131, 101, 20,
                                   0, 0, 0, 31, 158, 38, 181, 92, 77, 95, 154,
                                   189, 251, 173, 23, 246, 63, 231, 118, 137,
                                   216, 148, 153, 20, 0, 0, 0, 31, 140, 70, 168,
                                   222, 170, 185, 246, 244, 235, 54, 238, 98,
                                   248, 193, 89, 167, 152, 33, 22, 20, 0, 0, 0,
                                   29, 145, 238, 184, 28, 163, 69, 66, 172, 126,
                                   84, 139, 247, 6, 107, 95, 59, 43, 112, 12,
                                   20, 0, 0, 0, 31, 149, 166, 188, 175, 205, 16,
                                   15, 104, 166, 192, 35, 23, 6, 220, 65, 3, 95,
                                   251, 68, 20, 0, 0, 0, 31, 144, 124, 198, 214,
                                   37, 112, 110, 248, 56, 39, 180, 194, 122,
                                   213, 255, 151, 116, 13, 73, 20, 0, 0, 0, 29,
                                   145, 166, 202, 105, 17, 30, 57, 14, 64, 184,
                                   96, 155, 127, 184, 15, 87, 142, 3, 93, 20, 0,
                                   0, 0, 29, 145, 196, 195, 137, 190, 83, 4,
                                   141, 150, 217, 54, 106, 173, 49, 254, 189,
                                   250, 54, 247, 20, 0, 0, 0, 29, 149, 214, 202,
                                   252, 238, 240, 82, 118, 217, 140, 54, 76,
                                   205, 180, 100, 241, 246, 19, 150, 20, 0, 0,
                                   0, 29, 145, 214, 195, 113, 45, 37, 221, 238,
                                   87, 148, 247, 15, 50, 120, 128, 182, 249,
                                   205, 142, 20, 0, 0, 0, 31, 144, 124, 202, 77,
                                   254, 3, 177, 175, 124, 77, 145, 242, 120,
                                   149, 166, 234, 247, 158, 154, 20, 0, 0, 0,
                                   31, 131, 6, 184, 143, 162, 219, 57, 4, 244,
                                   126, 42, 82, 74, 47, 241, 158, 39, 196, 12,
                                   20, 0, 0, 0, 31, 173, 164, 164, 173, 253, 96,
                                   250, 129, 222, 112, 108, 243, 113, 43, 89,
                                   55, 132, 35, 4, 20, 0, 0, 0, 26, 104, 144,
                                   164, 132, 254, 223, 102, 131, 193, 113, 44,
                                   129, 214, 85, 126, 46, 35, 199, 200, 20, 0,
                                   0, 0, 26, 104, 194, 158, 35, 163, 52, 93,
                                   112, 161, 57, 97, 58, 71, 81, 208, 175, 151,
                                   225, 173, 20, 0, 0, 0, 28, 18, 55, 14, 156,
                                   57, 206, 114, 94, 28, 229, 228, 247, 8, 112,
                                   148, 149, 184, 28, 254, 20, 0, 0, 0, 28, 21,
                                   165, 33, 99, 192, 143, 147, 204, 251, 58, 61,
                                   243, 137, 234, 151, 111, 207, 156, 10, 20, 0,
                                   0, 0, 28, 29, 125, 12, 78, 170, 38, 98, 254,
                                   2, 9, 254, 166, 51, 168, 162, 177, 179, 231,
                                   10, 20, 0, 0, 0, 28, 16, 125, 1, 49, 205,
                                   185, 105, 76, 223, 46, 43, 83, 208, 246, 228,
                                   139, 132, 163, 226, 20, 0, 0, 0, 28, 16, 124,
                                   248, 220, 147, 150, 132, 222, 62, 116, 232,
                                   163, 192, 125, 69, 140, 226, 89, 254, 20, 0,
                                   0, 0, 31, 149, 134, 241, 139, 203, 186, 180,
                                   135, 59, 26, 75, 191, 5, 101, 108, 87, 202,
                                   192, 232, 20, 0, 0, 0, 31, 181, 164, 231,
                                   143, 226, 240, 63, 249, 207, 51, 226, 136,
                                   205, 158, 19, 243, 207, 65, 247, 20, 0, 0, 0,
                                   31, 170, 220, 216, 209, 137, 47, 156, 188,
                                   202, 255, 113, 138, 104, 176, 9, 195, 4, 1,
                                   86, 20, 0, 0, 0, 31, 151, 198, 228, 156, 189,
                                   34, 198, 4, 210, 155, 90, 63, 33, 131, 89,
                                   241, 104, 77, 31, 20, 0, 0, 0, 31, 181, 148,
                                   215, 239, 36, 168, 253, 39, 128, 129, 1, 210,
                                   136, 250, 107, 248, 55, 7, 25, 20, 0, 0, 0,
                                   31, 173, 194, 210, 164, 138, 141, 177, 77,
                                   188, 172, 107, 171, 66, 22, 52, 137, 32, 85,
                                   47, 20, 0, 0, 0, 27, 160, 46, 195, 237, 65,
                                   71, 0, 177, 214, 69, 125, 8, 212, 1, 255, 57,
                                   163, 189, 32, 20, 0, 0, 0, 26, 118, 0, 198,
                                   73, 29, 225, 147, 38, 200, 233, 127, 111, 22,
                                   252, 78, 131, 136, 217, 242, 20, 0, 0, 0, 25,
                                   59, 92, 180, 13, 166, 224, 89, 151, 192, 4,
                                   65, 10, 92, 90, 103, 231, 208, 189, 41, 20,
                                   0, 0, 0, 25, 61, 164, 187, 220, 36, 76, 93,
                                   222, 81, 194, 159, 214, 228, 76, 246, 91,
                                   180, 84, 235, 20, 0, 0, 0, 25, 56, 214, 181,
                                   71, 156, 1, 176, 152, 212, 120, 160, 159, 8,
                                   204, 25, 64, 117, 185, 30, 20, 0, 0, 0, 25,
                                   61, 164, 183, 203, 29, 64, 192, 247, 202, 52,
                                   103, 65, 113, 21, 84, 51, 139, 36, 17, 20, 0,
                                   0, 0, 25, 239, 66, 186, 92, 127, 15, 181, 94,
                                   18, 205, 188, 167, 9, 155, 192, 254, 81, 19,
                                   25, 20, 0, 0, 0, 30, 170, 150, 192, 79, 61,
                                   37, 207, 180, 27, 39, 30, 103, 34, 18, 160,
                                   153, 92, 98, 127, 20, 0, 0, 0, 28, 9, 199,
                                   35, 199, 57, 206, 117, 233, 3, 96, 16, 162,
                                   108, 103, 9, 226, 82, 76, 45, 20, 0, 0, 0,
                                   31, 190, 195, 12, 173, 183, 166, 57, 158, 0,
                                   136, 163, 63, 55, 37, 235, 215, 4, 147, 21,
                                   20, 0, 0, 0, 31, 190, 195, 5, 110, 128, 26,
                                   43, 6, 199, 136, 122, 219, 137, 91, 19, 125,
                                   36, 175, 209, 20, 0, 0, 0, 31, 168, 162, 230,
                                   67, 177, 86, 1, 81, 158, 165, 120, 207, 50,
                                   200, 103, 215, 221, 147, 13, 20, 0, 0, 0, 31,
                                   168, 230, 237, 92, 243, 22, 177, 174, 87,
                                   107, 50, 146, 109, 41, 235, 41, 53, 66, 213,
                                   20, 0, 0, 0, 25, 181, 164, 211, 169, 234, 17,
                                   65, 135, 47, 92, 108, 17, 112, 59, 230, 159,
                                   56, 251, 196, 20, 0, 0, 0, 31, 184, 194, 213,
                                   233, 161, 74, 105, 142, 98, 188, 89, 62, 42,
                                   232, 16, 164, 250, 164, 193, 20, 0, 0, 0, 31,
                                   184, 194, 225, 135, 38, 184, 63, 182, 209,
                                   191, 222, 10, 49, 126, 87, 46, 107, 9, 0, 20,
                                   0, 0, 0, 27, 165, 142, 216, 222, 195, 18,
                                   121, 132, 209, 86, 39, 167, 152, 146, 109,
                                   250, 115, 166, 47, 20, 0, 0, 0, 31, 184, 194,
                                   213, 7, 161, 2, 65, 212, 202, 216, 45, 209,
                                   106, 130, 230, 154, 97, 180, 243, 20, 0, 0,
                                   0, 25, 165, 244, 201, 105, 164, 152, 71, 87,
                                   217, 102, 197, 131, 108, 6, 16, 69, 55, 235,
                                   239, 20, 0, 0, 0, 31, 161, 40, 195, 13, 199,
                                   234, 143, 79, 106, 77, 251, 234, 72, 173,
                                   212, 59, 235, 37, 95, 20, 0, 0, 0, 25, 176,
                                   58, 187, 60, 165, 85, 193, 116, 236, 112, 34,
                                   67, 181, 1, 225, 103, 203, 78, 109, 20, 0, 0,
                                   0, 31, 175, 66, 169, 110, 128, 165, 71, 177,
                                   254, 0, 161, 67, 106, 79, 218, 220, 115, 86,
                                   32, 20, 0, 0, 0, 26, 104, 206, 184, 111, 73,
                                   80, 190, 70, 210, 183, 168, 14, 112, 91, 212,
                                   184, 228, 170, 162, 20, 0, 0, 0, 29, 220, 14,
                                   180, 199, 196, 21, 172, 142, 68, 136, 15, 46,
                                   105, 77, 241, 216, 244, 98, 117, 20, 0, 0, 0,
                                   29, 198, 134, 161, 62, 198, 214, 67, 33, 96,
                                   84, 127, 228, 107, 93, 81, 147, 145, 137, 82,
                                   20, 0, 0, 0, 31, 190, 150, 220, 188, 98, 203,
                                   68, 222, 16, 235, 172, 116, 168, 178, 95,
                                   226, 16, 71, 154, 20, 0, 0, 0, 25, 181, 185,
                                   29, 77, 168, 114, 1, 102, 211, 200, 196, 255,
                                   54, 245, 211, 221, 227, 33, 75, 20, 0, 0, 0,
                                   25, 183, 165, 4, 13, 29, 232, 156, 164, 202,
                                   192, 74, 91, 72, 250, 19, 53, 197, 226, 36,
                                   20, 0, 0, 0, 31, 190, 218, 242, 60, 240, 170,
                                   253, 230, 218, 80, 72, 186, 106, 151, 76,
                                   181, 229, 205, 103, 20, 0, 0, 0, 31, 184,
                                   242, 233, 73, 205, 136, 129, 148, 242, 135,
                                   199, 223, 23, 2, 206, 59, 124, 126, 197, 20,
                                   0, 0, 0, 31, 184, 218, 233, 39, 220, 120,
                                   187, 116, 138, 195, 225, 22, 53, 7, 135, 80,
                                   169, 38, 199, 20, 0, 0, 0, 25, 185, 164, 213,
                                   103, 34, 71, 197, 119, 224, 117, 33, 215,
                                   135, 108, 85, 173, 181, 84, 11, 20, 0, 0, 0,
                                   31, 177, 146, 222, 135, 182, 42, 182, 63,
                                   142, 121, 67, 113, 210, 247, 236, 81, 166,
                                   73, 40, 20, 0, 0, 0, 31, 190, 220, 212, 234,
                                   124, 235, 2, 180, 163, 254, 126, 182, 234,
                                   98, 15, 239, 154, 193, 66, 20, 0, 0, 0, 25,
                                   185, 164, 196, 222, 157, 168, 249, 125, 239,
                                   22, 161, 222, 218, 1, 196, 129, 36, 37, 17,
                                   20, 0, 0, 0, 31, 168, 146, 198, 233, 99, 10,
                                   165, 66, 78, 0, 68, 136, 248, 55, 15, 13, 45,
                                   164, 152, 20, 0, 0, 0, 31, 161, 20, 197, 252,
                                   1, 45, 2, 99, 141, 32, 46, 171, 104, 67, 222,
                                   217, 229, 60, 235, 20, 0, 0, 0, 26, 126, 146,
                                   183, 111, 51, 21, 40, 96, 235, 252, 94, 49,
                                   213, 4, 107, 69, 56, 92, 38, 20, 0, 0, 0, 31,
                                   173, 88, 180, 39, 157, 24, 126, 118, 189, 93,
                                   131, 123, 109, 210, 140, 237, 228, 36, 0, 20,
                                   0, 0, 0, 26, 104, 174, 188, 195, 139, 106,
                                   102, 49, 208, 196, 175, 179, 166, 173, 111,
                                   177, 239, 175, 23, 20, 0, 0, 0, 25, 41, 164,
                                   177, 67, 127, 192, 77, 230, 62, 164, 134, 43,
                                   107, 138, 238, 101, 185, 34, 56, 20, 0, 0, 0,
                                   31, 190, 218, 220, 95, 124, 0, 127, 3, 46,
                                   34, 239, 55, 120, 121, 235, 162, 88, 39, 198,
                                   20, 0, 0, 0, 28, 10, 183, 70, 173, 57, 67,
                                   116, 92, 221, 235, 80, 222, 119, 137, 164,
                                   21, 206, 93, 167, 20, 0, 0, 0, 28, 13, 183,
                                   19, 49, 44, 75, 254, 248, 213, 48, 37, 39,
                                   51, 196, 83, 15, 57, 189, 55, 20, 0, 0, 0,
                                   28, 25, 183, 22, 206, 196, 28, 53, 183, 112,
                                   126, 126, 63, 112, 253, 106, 213, 232, 206,
                                   205, 20, 0, 0, 0, 28, 16, 71, 9, 254, 146,
                                   35, 225, 242, 104, 50, 139, 163, 145, 5, 107,
                                   217, 232, 192, 36, 20, 0, 0, 0, 28, 2, 55,
                                   13, 225, 127, 211, 62, 142, 15, 98, 246, 66,
                                   226, 157, 245, 17, 48, 106, 61, 20, 0, 0, 0,
                                   28, 16, 70, 253, 134, 155, 192, 195, 158,
                                   110, 77, 60, 163, 176, 151, 125, 241, 178,
                                   26, 194, 20, 0, 0, 0, 31, 181, 182, 243, 78,
                                   195, 57, 134, 132, 208, 4, 78, 70, 199, 153,
                                   252, 185, 232, 121, 1, 20, 0, 0, 0, 31, 181,
                                   164, 246, 119, 36, 182, 143, 71, 226, 14,
                                   207, 71, 48, 196, 153, 145, 182, 165, 75, 20,
                                   0, 0, 0, 31, 182, 86, 231, 209, 50, 27, 182,
                                   119, 236, 126, 73, 131, 127, 253, 126, 177,
                                   227, 165, 0, 20, 0, 0, 0, 31, 182, 90, 223,
                                   156, 129, 119, 125, 191, 100, 139, 44, 101,
                                   214, 197, 251, 67, 150, 180, 82, 20, 0, 0, 0,
                                   31, 181, 214, 215, 107, 213, 228, 177, 92,
                                   214, 69, 99, 148, 198, 4, 71, 52, 39, 152,
                                   96, 20, 0, 0, 0, 31, 189, 148, 202, 142, 200,
                                   15, 187, 38, 238, 79, 33, 57, 223, 60, 129,
                                   97, 208, 48, 36, 20, 0, 0, 0, 31, 189, 66,
                                   198, 60, 252, 137, 77, 99, 206, 0, 120, 184,
                                   240, 85, 159, 1, 226, 160, 134, 20, 0, 0, 0,
                                   31, 190, 20, 169, 209, 164, 3, 171, 30, 86,
                                   167, 163, 17, 100, 106, 170, 164, 235, 250,
                                   81, 20, 0, 0, 0, 31, 163, 20, 165, 24, 212,
                                   137, 124, 86, 227, 121, 3, 198, 239, 186,
                                   223, 173, 36, 88, 0, 20, 0, 0, 0, 31, 176,
                                   48, 156, 156, 136, 74, 129, 30, 74, 166, 207,
                                   2, 109, 104, 231, 127, 146, 45, 73, 20, 0, 0,
                                   0, 31, 161, 90, 140, 92, 166, 24, 84, 195,
                                   142, 80, 89, 196, 82, 225, 164, 173, 57, 213,
                                   105, 20, 0, 0, 0, 26, 104, 206, 142, 25, 20,
                                   10, 72, 196, 204, 117, 137, 207, 40, 152, 20,
                                   165, 247, 217, 191, 20, 0, 0, 0, 27, 165, 66,
                                   136, 227, 134, 138, 53, 30, 116, 147, 171,
                                   225, 68, 52, 87, 126, 244, 49, 87, 20, 0, 0,
                                   0, 27, 180, 24, 131, 156, 69, 26, 73, 174,
                                   64, 4, 10, 55, 178, 4, 6, 87, 155, 113, 94,
                                   20, 0, 0, 0, 26, 104, 174, 131, 60, 134, 43,
                                   172, 151, 255, 74, 183, 250, 80, 136, 127,
                                   179, 133, 18, 208, 20, 0, 0, 0, 26, 113, 174,
                                   114, 137, 255, 63, 179, 38, 230, 129, 32,
                                   207, 42, 104, 8, 124, 101, 2, 13, 20, 0, 0,
                                   0, 29, 211, 198, 135, 99, 69, 77, 243, 118,
                                   215, 209, 124, 48, 40, 2, 208, 155, 55, 159,
                                   222, 20, 0, 0, 0, 31, 181, 48, 134, 41, 124,
                                   0, 1, 49, 208, 87, 168, 223, 62, 98, 62, 115,
                                   152, 236, 0, 20, 0, 0, 0, 26, 104, 164, 139,
                                   155, 221, 112, 104, 238, 116, 26, 43, 17,
                                   234, 154, 129, 85, 177, 103, 63, 20, 0, 0, 0,
                                   31, 165, 176, 142, 247, 169, 137, 70, 198,
                                   210, 101, 195, 178, 112, 221, 86, 133, 48,
                                   33, 30, 20, 0, 0, 0, 27, 221, 6, 146, 252,
                                   85, 45, 150, 4, 228, 121, 60, 167, 41, 87,
                                   143, 152, 125, 131, 175, 20, 0, 0, 0, 29,
                                   194, 124, 148, 81, 31, 232, 100, 223, 158,
                                   198, 224, 119, 42, 82, 64, 105, 190, 169, 21,
                                   20, 0, 0, 0, 27, 213, 134, 154, 101, 237, 18,
                                   71, 244, 159, 128, 33, 51, 94, 41, 94, 107,
                                   154, 79, 64, 20, 0, 0, 0, 27, 221, 6, 157,
                                   238, 176, 19, 161, 110, 86, 164, 16, 224,
                                   194, 213, 210, 54, 107, 97, 132, 20, 0, 0, 0,
                                   27, 180, 78, 146, 188, 55, 241, 39, 244, 231,
                                   243, 47, 143, 39, 87, 150, 135, 153, 158, 42,
                                   20, 0, 0, 0, 26, 104, 156, 150, 187, 36, 232,
                                   105, 254, 108, 3, 225, 182, 234, 197, 191,
                                   137, 191, 182, 201, 20, 0, 0, 0, 27, 180, 24,
                                   159, 161, 174, 209, 89, 173, 236, 165, 210,
                                   240, 207, 66, 33, 184, 37, 168, 7, 20, 0, 0,
                                   0, 29, 194, 70, 158, 92, 157, 64, 237, 179,
                                   246, 248, 126, 158, 53, 210, 207, 0, 244, 37,
                                   109, 20, 0, 0, 0, 29, 220, 14, 150, 62, 219,
                                   34, 203, 180, 226, 116, 38, 35, 95, 59, 1,
                                   141, 32, 35, 90, 20, 0, 0, 0, 26, 104, 174,
                                   150, 205, 113, 77, 4, 13, 223, 149, 139, 120,
                                   249, 59, 214, 67, 148, 33, 7, 20, 0, 0, 0,
                                   28, 105, 248, 156, 71, 225, 113, 41, 78, 84,
                                   250, 156, 199, 42, 125, 81, 54, 50, 88, 231,
                                   20, 0, 0, 0, 26, 104, 156, 155, 115, 169, 40,
                                   141, 183, 110, 188, 53, 81, 213, 60, 25, 132,
                                   245, 47, 22, 20, 0, 0, 0, 26, 97, 28, 138,
                                   105, 126, 248, 195, 62, 118, 36, 195, 239,
                                   250, 77, 80, 82, 57, 214, 202, 20, 0, 0, 0,
                                   29, 204, 252, 135, 19, 70, 192, 7, 142, 78,
                                   137, 97, 123, 170, 255, 229, 119, 144, 28,
                                   165, 20, 0, 0, 0, 26, 120, 174, 130, 252,
                                   242, 204, 68, 223, 55, 20, 40, 175, 39, 69,
                                   109, 212, 63, 173, 234, 20, 0, 0, 0, 26, 104,
                                   164, 114, 167, 159, 150, 193, 147, 214, 94,
                                   87, 58, 100, 135, 208, 56, 87, 196, 255, 20,
                                   0, 0, 0, 27, 200, 138, 140, 39, 33, 248, 6,
                                   14, 64, 148, 164, 191, 34, 72, 48, 109, 63,
                                   153, 187, 20, 0, 0, 0, 31, 165, 196, 138,
                                   131, 162, 252, 137, 30, 69, 4, 27, 151, 47,
                                   144, 15, 51, 21, 145, 247, 20, 0, 0, 0, 31,
                                   189, 68, 131, 201, 202, 103, 145, 190, 106,
                                   112, 79, 42, 127, 58, 8, 172, 114, 148, 8,
                                   20, 0, 0, 0, 29, 199, 142, 159, 248, 168, 66,
                                   179, 62, 10, 203, 129, 167, 41, 82, 142, 232,
                                   127, 172, 0, 20, 0, 0, 0, 31, 181, 68, 148,
                                   241, 125, 66, 250, 190, 46, 147, 35, 51, 160,
                                   170, 232, 123, 159, 60, 136, 20, 0, 0, 0, 26,
                                   111, 68, 140, 220, 214, 8, 67, 102, 253, 116,
                                   41, 232, 232, 145, 225, 163, 216, 217, 7, 20,
                                   0, 0, 0, 26, 104, 164, 159, 235, 198, 168,
                                   79, 75, 210, 116, 71, 153, 147, 66, 40, 255,
                                   144, 109, 18, 20, 0, 0, 0, 26, 113, 174, 135,
                                   14, 155, 24, 49, 150, 248, 3, 125, 43, 106,
                                   193, 236, 212, 176, 88, 5, 20, 0, 0, 0, 26,
                                   112, 156, 137, 199, 255, 234, 151, 110, 17,
                                   245, 37, 79, 63, 183, 209, 135, 149, 127,
                                   241, 20, 0, 0, 0, 26, 112, 174, 133, 7, 152,
                                   168, 59, 65, 211, 27, 40, 191, 42, 71, 245,
                                   217, 213, 227, 152, 20, 0, 0, 0, 29, 219, 14,
                                   141, 254, 193, 11, 222, 62, 86, 0, 39, 199,
                                   182, 252, 150, 97, 185, 252, 106, 20, 0, 0,
                                   0, 31, 169, 16, 134, 190, 172, 205, 71, 182,
                                   145, 19, 175, 223, 56, 73, 158, 123, 201, 35,
                                   255, 20, 0, 0, 0, 29, 211, 198, 125, 239,
                                   174, 192, 3, 190, 113, 228, 38, 254, 234, 82,
                                   170, 72, 51, 193, 88, 20, 0, 0, 0, 29, 207,
                                   142, 136, 92, 217, 234, 83, 222, 62, 0, 80,
                                   87, 190, 74, 225, 145, 181, 49, 82, 20, 0, 0,
                                   0, 29, 199, 134, 133, 230, 158, 43, 140, 132,
                                   145, 128, 45, 2, 48, 189, 69, 197, 168, 45,
                                   88, 20, 0, 0, 0, 29, 204, 70, 139, 77, 215,
                                   192, 124, 173, 196, 165, 51, 95, 55, 168,
                                   155, 129, 176, 127, 44, 20, 0, 0, 0, 26, 104,
                                   174, 141, 17, 70, 223, 78, 56, 190, 178, 63,
                                   106, 118, 131, 86, 61, 251, 90, 63, 20, 0, 0,
                                   0, 30, 189, 132, 138, 123, 33, 71, 78, 190,
                                   82, 117, 225, 11, 149, 3, 255, 245, 198, 79,
                                   235, 20, 0, 0, 0, 29, 207, 142, 141, 163,
                                   248, 66, 73, 110, 86, 5, 172, 183, 63, 82,
                                   79, 22, 244, 36, 234, 20, 0, 0, 0, 29, 206,
                                   14, 114, 79, 209, 4, 132, 40, 212, 127, 169,
                                   95, 47, 4, 108, 196, 180, 183, 248, 20, 0, 0,
                                   0, 31, 181, 40, 138, 220, 168, 240, 60, 46,
                                   94, 133, 175, 185, 184, 178, 228, 67, 215,
                                   181, 143, 20, 0, 0, 0, 26, 112, 144, 152, 92,
                                   11, 39, 56, 174, 61, 101, 35, 87, 55, 74,
                                   225, 19, 148, 167, 250, 20, 0, 0, 0, 29, 206,
                                   6, 128, 201, 165, 8, 6, 131, 211, 35, 61,
                                   207, 99, 82, 79, 51, 124, 53, 8, 20, 0, 0, 0,
                                   25, 41, 228, 138, 174, 192, 41, 42, 228, 240,
                                   244, 161, 139, 100, 194, 223, 255, 149, 29,
                                   235, 20, 0, 0, 0, 29, 217, 126, 136, 145, 71,
                                   232, 101, 159, 14, 130, 38, 39, 54, 183, 207,
                                   55, 148, 169, 63, 20, 0, 0, 0, 29, 207, 134,
                                   133, 9, 133, 57, 79, 182, 215, 140, 171, 186,
                                   111, 68, 175, 39, 148, 114, 229, 20, 0, 0, 0,
                                   26, 97, 144, 137, 9, 188, 6, 53, 163, 207,
                                   66, 37, 71, 49, 84, 13, 59, 149, 202, 31, 20,
                                   0, 0, 0, 26, 97, 144, 148, 173, 126, 192,
                                   187, 125, 223, 245, 125, 55, 42, 1, 65, 179,
                                   153, 41, 9, 20, 0, 0, 0, 29, 194, 70, 161,
                                   137, 174, 199, 82, 100, 241, 159, 162, 238,
                                   254, 89, 239, 253, 180, 206, 117, 20, 0, 0,
                                   0, 31, 165, 80, 164, 169, 36, 241, 87, 24,
                                   248, 37, 176, 239, 56, 227, 200, 243, 115,
                                   180, 14, 20, 0, 0, 0, 27, 217, 230, 164, 227,
                                   150, 200, 64, 40, 228, 4, 33, 20, 105, 247,
                                   79, 65, 176, 157, 4, 20, 0, 0, 0, 29, 149,
                                   120, 191, 103, 3, 251, 59, 213, 193, 179,
                                   163, 32, 234, 20, 5, 173, 211, 165, 166, 20,
                                   0, 0, 0, 29, 133, 238, 191, 238, 126, 29, 25,
                                   118, 215, 251, 73, 254, 234, 156, 189, 209,
                                   178, 196, 143, 20, 0, 0, 0, 29, 149, 102,
                                   185, 238, 199, 229, 59, 36, 188, 67, 249, 79,
                                   41, 52, 48, 113, 63, 215, 73, 20, 0, 0, 0,
                                   29, 149, 110, 201, 109, 98, 118, 7, 18, 1,
                                   124, 43, 171, 95, 252, 78, 75, 251, 182, 29,
                                   20, 0, 0, 0, 30, 104, 216, 218, 231, 61, 82,
                                   42, 166, 128, 68, 124, 100, 190, 81, 144,
                                   100, 218, 210, 203, 20, 0, 0, 0, 30, 97, 144,
                                   233, 28, 35, 245, 157, 119, 38, 184, 152,
                                   254, 25, 94, 61, 100, 247, 230, 3, 20, 0, 0,
                                   0, 30, 104, 152, 233, 35, 50, 15, 5, 147,
                                   162, 172, 26, 209, 239, 164, 13, 110, 84, 41,
                                   179, 20, 0, 0, 0, 30, 97, 168, 235, 62, 216,
                                   124, 92, 136, 138, 161, 42, 211, 196, 64, 72,
                                   137, 35, 44, 137, 20, 0, 0, 0, 30, 117, 24,
                                   203, 110, 254, 241, 125, 52, 228, 123, 122,
                                   3, 124, 61, 172, 152, 251, 37, 15, 20, 0, 0,
                                   0, 26, 74, 138, 194, 195, 191, 50, 154, 93,
                                   191, 184, 170, 205, 232, 71, 246, 201, 165,
                                   174, 191, 20, 0, 0, 0, 26, 94, 162, 198, 35,
                                   218, 39, 197, 167, 95, 163, 146, 76, 84, 249,
                                   203, 112, 160, 172, 73, 20, 0, 0, 0, 26, 64,
                                   170, 187, 104, 89, 104, 142, 254, 6, 176,
                                   218, 95, 34, 224, 74, 3, 208, 18, 135, 20, 0,
                                   0, 0, 25, 250, 76, 174, 62, 174, 32, 186, 78,
                                   80, 163, 202, 198, 245, 180, 74, 115, 152,
                                   137, 42, 20, 0, 0, 0, 29, 199, 102, 164, 137,
                                   218, 80, 74, 36, 210, 80, 43, 68, 127, 82,
                                   94, 230, 117, 41, 6, 20, 0, 0, 0, 25, 227,
                                   88, 174, 207, 65, 36, 109, 194, 86, 7, 142,
                                   199, 118, 109, 170, 90, 44, 243, 23, 20, 0,
                                   0, 0, 28, 61, 116, 151, 231, 174, 39, 138,
                                   92, 86, 151, 169, 185, 234, 37, 239, 153, 48,
                                   45, 41, 20, 0, 0, 0, 29, 217, 66, 162, 252,
                                   165, 171, 58, 125, 236, 148, 28, 136, 235,
                                   89, 254, 83, 149, 76, 64, 20, 0, 0, 0, 24,
                                   113, 186, 159, 121, 164, 13, 183, 150, 212,
                                   151, 128, 183, 56, 43, 219, 211, 241, 71,
                                   196, 20, 0, 0, 0, 25, 45, 36, 155, 55, 234,
                                   75, 65, 129, 241, 142, 21, 50, 74, 23, 173,
                                   41, 55, 165, 175, 20, 0, 0, 0, 28, 53, 116,
                                   152, 252, 249, 241, 133, 77, 142, 0, 28, 231,
                                   56, 82, 34, 67, 53, 184, 232, 20, 0, 0, 0,
                                   28, 56, 206, 144, 0, 133, 41, 181, 183, 223,
                                   103, 124, 40, 235, 242, 44, 231, 152, 1, 63,
                                   20, 0, 0, 0, 25, 33, 80, 147, 13, 30, 40,
                                   170, 255, 83, 20, 162, 168, 248, 98, 201,
                                   150, 103, 153, 21, 20, 0, 0, 0, 25, 41, 80,
                                   146, 43, 173, 43, 140, 78, 20, 252, 53, 251,
                                   74, 78, 127, 249, 187, 89, 149, 20, 0, 0, 0,
                                   28, 112, 178, 157, 187, 214, 224, 126, 201,
                                   85, 132, 174, 113, 231, 131, 228, 250, 59,
                                   233, 85, 20, 0, 0, 0, 29, 199, 102, 144, 241,
                                   188, 170, 124, 6, 234, 215, 231, 227, 107,
                                   74, 226, 91, 153, 173, 17, 20, 0, 0, 0, 28,
                                   61, 118, 174, 156, 69, 13, 85, 244, 234, 115,
                                   197, 90, 49, 52, 85, 115, 19, 221, 236, 20,
                                   0, 0, 0, 25, 240, 66, 161, 155, 166, 32, 72,
                                   191, 56, 111, 219, 8, 239, 1, 132, 215, 148,
                                   49, 44, 20, 0, 0, 0, 31, 254, 168, 174, 183,
                                   165, 41, 173, 6, 230, 148, 175, 169, 105,
                                   179, 3, 233, 208, 234, 247, 20, 0, 0, 0, 25,
                                   250, 58, 168, 110, 234, 188, 154, 78, 65,
                                   101, 98, 183, 47, 183, 233, 240, 245, 167,
                                   22, 20, 0, 0, 0, 25, 250, 58, 191, 82, 99,
                                   15, 181, 246, 72, 132, 39, 187, 200, 82, 16,
                                   92, 81, 47, 75, 20, 0, 0, 0, 29, 96, 194,
                                   179, 156, 165, 183, 255, 153, 208, 129, 47,
                                   225, 107, 54, 48, 168, 176, 44, 15, 20, 0, 0,
                                   0, 31, 242, 208, 197, 135, 97, 8, 73, 110,
                                   82, 11, 91, 169, 159, 86, 23, 83, 139, 5,
                                   171, 20, 0, 0, 0, 28, 170, 201, 15, 18, 126,
                                   202, 170, 11, 146, 215, 8, 160, 88, 196, 45,
                                   216, 247, 175, 79, 20, 0, 0, 0, 24, 173, 246,
                                   255, 71, 139, 15, 132, 198, 238, 184, 22,
                                   175, 56, 185, 235, 77, 35, 140, 229, 20, 0,
                                   0, 0, 30, 195, 14, 245, 252, 136, 34, 108,
                                   246, 142, 118, 133, 69, 225, 136, 142, 103,
                                   154, 169, 67, 20, 0, 0, 0, 30, 195, 11, 5,
                                   22, 73, 235, 199, 189, 205, 113, 46, 144,
                                   233, 82, 20, 200, 166, 71, 231, 20, 0, 0, 0,
                                   25, 33, 220, 229, 249, 161, 86, 61, 49, 254,
                                   148, 189, 151, 144, 122, 138, 252, 98, 229,
                                   120, 20, 0, 0, 0, 24, 175, 118, 212, 6, 166,
                                   102, 182, 29, 213, 48, 107, 17, 92, 25, 193,
                                   59, 139, 225, 56, 20, 0, 0, 0, 25, 61, 100,
                                   197, 171, 225, 82, 83, 161, 206, 179, 167,
                                   250, 104, 66, 63, 188, 117, 166, 35, 20, 0,
                                   0, 0, 25, 61, 100, 197, 169, 160, 75, 255,
                                   244, 219, 56, 0, 218, 22, 65, 31, 83, 193,
                                   190, 72, 20, 0, 0, 0, 25, 61, 80, 182, 219,
                                   198, 114, 68, 94, 126, 155, 167, 192, 202,
                                   250, 21, 184, 99, 197, 16, 20, 0, 0, 0, 25,
                                   45, 20, 197, 164, 10, 105, 125, 46, 0, 164,
                                   99, 3, 199, 58, 64, 205, 102, 173, 87, 20, 0,
                                   0, 0, 24, 96, 200, 203, 184, 1, 109, 190,
                                   190, 64, 190, 40, 59, 156, 0, 63, 141, 232,
                                   165, 95, 20, 0, 0, 0, 25, 44, 208, 185, 23,
                                   197, 39, 59, 15, 63, 12, 41, 213, 239, 22,
                                   219, 51, 150, 239, 205, 20, 0, 0, 0, 30, 57,
                                   144, 204, 242, 88, 17, 131, 19, 172, 176,
                                   255, 246, 246, 48, 45, 136, 255, 157, 30, 20,
                                   0, 0, 0, 28, 195, 46, 237, 220, 183, 61, 181,
                                   222, 68, 136, 211, 246, 31, 184, 0, 199, 203,
                                   97, 234, 20, 0, 0, 0, 28, 221, 14, 199, 227,
                                   35, 231, 82, 78, 118, 7, 227, 103, 54, 90,
                                   78, 101, 38, 70, 74, 20, 0, 0, 0, 28, 192,
                                   66, 214, 124, 189, 182, 3, 158, 14, 82, 178,
                                   33, 232, 60, 255, 42, 86, 237, 248, 20, 0, 0,
                                   0, 24, 41, 186, 193, 233, 218, 249, 209, 230,
                                   90, 36, 40, 151, 2, 69, 166, 131, 121, 5, 72,
                                   20, 0, 0, 0, 25, 55, 218, 199, 135, 35, 1,
                                   121, 191, 163, 107, 253, 167, 50, 69, 99, 13,
                                   250, 161, 62, 20, 0, 0, 0, 28, 199, 138, 200,
                                   188, 171, 245, 244, 43, 218, 4, 192, 203,
                                   144, 57, 223, 245, 36, 122, 118, 20, 0, 0, 0,
                                   28, 197, 194, 204, 5, 104, 40, 253, 252, 26,
                                   4, 169, 158, 248, 249, 234, 213, 22, 41, 139,
                                   20, 0, 0, 0, 28, 197, 226, 203, 147, 165, 24,
                                   6, 180, 197, 105, 231, 88, 236, 133, 14, 115,
                                   20, 197, 248, 20, 0, 0, 0, 28, 197, 194, 205,
                                   21, 252, 21, 81, 172, 100, 14, 34, 102, 120,
                                   12, 163, 122, 121, 196, 160, 20, 0, 0, 0, 28,
                                   213, 66, 206, 137, 153, 104, 104, 135, 98,
                                   18, 45, 146, 120, 75, 215, 8, 247, 249, 95,
                                   20, 0, 0, 0, 28, 213, 66, 177, 238, 208, 255,
                                   68, 206, 94, 0, 2, 238, 255, 250, 17, 166,
                                   183, 199, 49, 20, 0, 0, 0, 25, 55, 214, 187,
                                   110, 166, 213, 45, 210, 196, 148, 190, 23,
                                   150, 0, 161, 165, 192, 175, 234, 20, 0, 0, 0,
                                   25, 53, 218, 187, 231, 35, 165, 70, 8, 84,
                                   188, 190, 23, 173, 144, 95, 112, 249, 54, 74,
                                   20, 0, 0, 0, 25, 41, 214, 162, 188, 156, 88,
                                   180, 147, 214, 133, 47, 96, 247, 75, 36, 147,
                                   147, 197, 7, 20, 0, 0, 0, 25, 33, 180, 177,
                                   183, 165, 242, 85, 204, 112, 139, 121, 211,
                                   117, 181, 214, 163, 132, 33, 9, 20, 0, 0, 0,
                                   29, 219, 10, 164, 105, 188, 2, 254, 45, 216,
                                   135, 143, 63, 113, 58, 193, 60, 184, 172, 11,
                                   20, 0, 0, 0, 25, 61, 20, 165, 105, 171, 234,
                                   158, 31, 21, 37, 174, 241, 120, 3, 238, 87,
                                   145, 97, 15, 20, 0, 0, 0, 28, 112, 168, 165,
                                   188, 216, 240, 198, 99, 226, 60, 53, 80, 229,
                                   34, 223, 218, 87, 251, 233, 20, 0, 0, 0, 26,
                                   97, 16, 172, 181, 197, 96, 2, 62, 86, 68,
                                   195, 255, 42, 169, 197, 71, 113, 147, 7, 20,
                                   0, 0, 0, 25, 41, 228, 186, 101, 141, 81, 72,
                                   78, 192, 11, 226, 103, 135, 5, 86, 26, 21,
                                   27, 207, 20, 0, 0, 0, 25, 41, 252, 190, 71,
                                   191, 208, 77, 7, 70, 241, 254, 140, 223, 66,
                                   213, 156, 189, 226, 165, 20, 0, 0, 0, 25, 55,
                                   252, 221, 91, 102, 138, 88, 99, 132, 69, 131,
                                   73, 191, 126, 79, 23, 155, 61, 74, 20, 0, 0,
                                   0, 29, 161, 142, 241, 169, 40, 233, 7, 155,
                                   158, 68, 98, 142, 210, 3, 207, 99, 148, 31,
                                   23, 20, 0, 0, 0, 31, 180, 175, 16, 147, 148,
                                   229, 102, 98, 105, 89, 255, 218, 255, 173,
                                   171, 235, 104, 128, 15, 20, 0, 0, 0, 31, 176,
                                   217, 21, 123, 185, 44, 191, 185, 192, 207,
                                   118, 63, 41, 140, 30, 88, 252, 33, 177, 20,
                                   0, 0, 0, 30, 183, 187, 20, 67, 107, 27, 252,
                                   145, 160, 212, 227, 41, 43, 111, 60, 214,
                                   156, 62, 164, 20, 0, 0, 0, 30, 167, 245, 23,
                                   253, 158, 100, 104, 225, 108, 193, 160, 44,
                                   162, 128, 5, 4, 161, 175, 7, 20, 0, 0, 0, 30,
                                   167, 153, 22, 60, 218, 53, 68, 158, 26, 36,
                                   166, 68, 79, 141, 227, 29, 56, 180, 188, 20,
                                   0, 0, 0, 30, 167, 187, 8, 39, 171, 225, 64,
                                   103, 1, 45, 193, 131, 106, 17, 94, 195, 146,
                                   120, 40, 20, 0, 0, 0, 25, 55, 253, 15, 99,
                                   69, 30, 58, 103, 95, 87, 167, 145, 203, 4,
                                   44, 33, 228, 140, 40, 20, 0, 0, 0, 25, 47,
                                   214, 244, 199, 177, 70, 93, 241, 159, 251, 2,
                                   159, 159, 66, 54, 250, 98, 53, 77, 20, 0, 0,
                                   0, 25, 55, 252, 255, 115, 128, 126, 78, 190,
                                   61, 44, 96, 81, 103, 199, 56, 127, 116, 188,
                                   223, 20, 0, 0, 0, 26, 127, 66, 245, 220, 71,
                                   250, 94, 14, 112, 11, 93, 3, 205, 13, 146,
                                   89, 184, 125, 84, 20, 0, 0, 0, 27, 122, 206,
                                   250, 200, 172, 77, 183, 7, 227, 9, 110, 248,
                                   246, 86, 14, 91, 128, 35, 15, 20, 0, 0, 0,
                                   25, 63, 220, 209, 227, 216, 231, 79, 52, 255,
                                   241, 251, 143, 182, 248, 83, 123, 148, 169,
                                   32, 20, 0, 0, 0, 25, 63, 214, 223, 190, 196,
                                   202, 28, 6, 243, 134, 190, 107, 173, 69, 142,
                                   212, 104, 37, 57, 20, 0, 0, 0, 25, 63, 184,
                                   218, 137, 125, 66, 171, 142, 14, 245, 121,
                                   96, 203, 66, 171, 31, 144, 60, 24, 20, 0, 0,
                                   0, 27, 122, 160, 219, 36, 148, 24, 255, 174,
                                   68, 210, 171, 127, 145, 75, 201, 56, 163,
                                   188, 135, 20, 0, 0, 0, 25, 63, 168, 197, 124,
                                   170, 75, 42, 174, 100, 135, 201, 54, 232,
                                   252, 83, 123, 155, 84, 42, 20, 0, 0, 0, 28,
                                   59, 138, 200, 163, 223, 95, 129, 148, 210,
                                   180, 99, 124, 255, 16, 35, 90, 231, 171, 203,
                                   20, 0, 0, 0, 25, 41, 146, 207, 195, 241, 19,
                                   17, 182, 150, 63, 54, 90, 41, 207, 209, 135,
                                   159, 85, 11, 20, 0, 0, 0, 25, 47, 168, 223,
                                   77, 3, 9, 189, 197, 163, 144, 175, 47, 32,
                                   83, 227, 255, 159, 128, 59, 20, 0, 0, 0, 25,
                                   47, 146, 218, 239, 177, 75, 189, 215, 65,
                                   229, 91, 32, 241, 74, 109, 161, 185, 4, 68,
                                   20, 0, 0, 0, 24, 47, 186, 220, 156, 38, 10,
                                   179, 14, 66, 8, 190, 185, 241, 85, 115, 215,
                                   128, 37, 245, 20, 0, 0, 0, 24, 51, 186, 229,
                                   120, 170, 56, 89, 158, 44, 115, 158, 175, 9,
                                   194, 129, 77, 165, 162, 66, 20, 0, 0, 0, 27,
                                   50, 230, 236, 152, 217, 106, 57, 120, 149,
                                   117, 225, 241, 103, 28, 125, 156, 120, 195,
                                   16, 20, 0, 0, 0, 24, 54, 186, 239, 205, 198,
                                   62, 66, 206, 49, 86, 255, 84, 169, 249, 237,
                                   105, 186, 161, 6, 20, 0, 0, 0, 28, 205, 18,
                                   236, 188, 138, 249, 5, 132, 222, 180, 75,
                                   151, 11, 81, 193, 161, 170, 253, 48, 20, 0,
                                   0, 0, 28, 215, 82, 228, 166, 93, 0, 177, 23,
                                   127, 250, 160, 207, 49, 76, 142, 49, 53, 31,
                                   9, 20, 0, 0, 0, 27, 50, 130, 227, 199, 79,
                                   226, 62, 71, 21, 105, 123, 228, 237, 181, 81,
                                   173, 171, 29, 40, 20, 0, 0, 0, 28, 204, 138,
                                   229, 137, 189, 71, 94, 55, 142, 255, 46, 234,
                                   74, 71, 207, 109, 177, 54, 199, 20, 0, 0, 0,
                                   24, 47, 186, 209, 43, 218, 160, 199, 211,
                                   109, 80, 39, 25, 230, 84, 143, 139, 123, 156,
                                   13, 20, 0, 0, 0, 27, 58, 194, 239, 155, 188,
                                   12, 137, 95, 91, 226, 246, 171, 149, 183,
                                   218, 39, 104, 157, 47, 20, 0, 0, 0, 27, 34,
                                   174, 212, 17, 61, 249, 190, 57, 209, 38, 155,
                                   9, 231, 90, 133, 140, 248, 219, 203, 20, 0,
                                   0, 0, 27, 34, 36, 220, 70, 158, 39, 139, 46,
                                   75, 231, 225, 15, 43, 69, 128, 103, 153, 62,
                                   67, 20, 0, 0, 0, 27, 34, 36, 204, 147, 198,
                                   235, 44, 194, 239, 56, 191, 179, 105, 93, 64,
                                   128, 115, 205, 95, 20, 0, 0, 0, 27, 126, 176,
                                   199, 3, 196, 60, 90, 148, 196, 231, 250, 223,
                                   42, 250, 148, 117, 176, 69, 124, 20, 0, 0, 0,
                                   25, 44, 212, 203, 124, 167, 234, 69, 182,
                                   239, 104, 101, 162, 117, 234, 134, 220, 123,
                                   174, 249, 20, 0, 0, 0, 25, 63, 168, 195, 141,
                                   41, 10, 135, 136, 147, 21, 223, 203, 105,
                                   146, 125, 190, 239, 157, 44, 20, 0, 0, 0, 25,
                                   165, 24, 209, 56, 94, 54, 57, 206, 4, 128,
                                   33, 153, 234, 255, 206, 127, 152, 233, 72,
                                   20, 0, 0, 0, 25, 183, 183, 27, 156, 144, 178,
                                   136, 135, 103, 63, 192, 119, 35, 231, 192,
                                   37, 196, 2, 175, 20, 0, 0, 0, 31, 176, 143,
                                   6, 145, 20, 88, 123, 201, 128, 6, 10, 123,
                                   104, 83, 18, 174, 88, 2, 228, 20, 0, 0, 0,
                                   31, 176, 231, 13, 140, 134, 7, 4, 172, 196,
                                   47, 219, 75, 201, 169, 255, 57, 49, 21, 172,
                                   20, 0, 0, 0, 31, 176, 203, 9, 220, 30, 175,
                                   228, 238, 97, 251, 93, 99, 194, 84, 159, 148,
                                   224, 175, 170, 20, 0, 0, 0, 25, 180, 79, 2,
                                   156, 1, 24, 110, 94, 16, 130, 47, 163, 77,
                                   188, 147, 181, 8, 48, 186, 20, 0, 0, 0, 25,
                                   165, 246, 253, 174, 162, 173, 147, 239, 122,
                                   134, 221, 41, 192, 150, 11, 97, 203, 41, 108,
                                   20, 0, 0, 0, 25, 180, 118, 235, 60, 182, 208,
                                   85, 222, 46, 252, 67, 51, 192, 69, 111, 37,
                                   54, 189, 40, 20, 0, 0, 0, 28, 200, 142, 236,
                                   109, 11, 242, 36, 189, 200, 220, 42, 82, 96,
                                   2, 189, 232, 102, 227, 0, 20, 0, 0, 0, 25,
                                   181, 116, 230, 77, 137, 163, 54, 194, 67,
                                   140, 117, 123, 138, 253, 158, 15, 214, 216,
                                   77, 20, 0, 0, 0, 30, 190, 180, 215, 13, 224,
                                   169, 73, 225, 210, 148, 66, 143, 191, 27,
                                   193, 223, 153, 85, 182, 20, 0, 0, 0, 30, 195,
                                   118, 216, 123, 194, 248, 150, 211, 238, 177,
                                   3, 59, 224, 234, 145, 116, 117, 63, 43, 20,
                                   0, 0, 0, 28, 197, 252, 223, 141, 231, 246, 6,
                                   77, 212, 0, 125, 79, 41, 173, 215, 172, 121,
                                   3, 182, 20, 0, 0, 0, 27, 173, 22, 212, 55,
                                   131, 15, 63, 83, 227, 164, 160, 72, 231, 100,
                                   83, 163, 144, 252, 40, 20, 0, 0, 0, 26, 96,
                                   174, 229, 92, 66, 32, 97, 230, 208, 252, 38,
                                   63, 43, 168, 31, 49, 185, 6, 223, 20, 0, 0,
                                   0, 26, 100, 174, 236, 30, 171, 36, 37, 119,
                                   225, 58, 128, 82, 41, 169, 86, 37, 226, 169,
                                   17, 20, 0, 0, 0, 24, 167, 246, 215, 133, 174,
                                   198, 181, 55, 253, 106, 220, 219, 118, 128,
                                   227, 192, 184, 205, 254, 20, 0, 0, 0, 29,
                                   220, 14, 221, 45, 165, 54, 26, 3, 238, 1,
                                   124, 65, 79, 138, 61, 254, 53, 217, 17, 20,
                                   0, 0, 0, 25, 33, 164, 209, 188, 248, 87, 134,
                                   230, 89, 20, 139, 255, 50, 99, 19, 127, 101,
                                   111, 0, 20, 0, 0, 0, 25, 45, 80, 212, 159,
                                   229, 48, 130, 174, 18, 159, 156, 65, 241, 98,
                                   218, 138, 125, 177, 39, 20, 0, 0, 0, 25, 33,
                                   208, 207, 195, 128, 54, 113, 238, 117, 51,
                                   199, 208, 246, 35, 212, 155, 100, 171, 9, 20,
                                   0, 0, 0, 24, 61, 118, 197, 201, 153, 47, 141,
                                   62, 108, 191, 126, 155, 114, 254, 167, 41,
                                   171, 90, 216, 20, 0, 0, 0, 24, 45, 252, 209,
                                   252, 98, 104, 129, 247, 23, 9, 226, 179, 170,
                                   137, 215, 169, 197, 65, 72, 20, 0, 0, 0, 30,
                                   195, 66, 223, 189, 128, 34, 3, 211, 190, 132,
                                   14, 80, 201, 169, 206, 135, 148, 60, 231, 20,
                                   0, 0, 0, 31, 153, 61, 22, 173, 105, 221, 16,
                                   220, 247, 51, 87, 85, 159, 249, 214, 112,
                                   102, 41, 214, 20, 0, 0, 0, 27, 176, 236, 229,
                                   15, 218, 237, 71, 198, 238, 221, 249, 83,
                                   201, 192, 75, 174, 235, 165, 11, 20, 0, 0, 0,
                                   27, 176, 236, 218, 99, 198, 42, 59, 195, 214,
                                   145, 99, 107, 234, 200, 23, 248, 42, 225, 0,
                                   20, 0, 0, 0, 30, 195, 100, 201, 126, 171,
                                   231, 5, 199, 35, 164, 170, 161, 239, 74, 123,
                                   161, 184, 121, 42, 20, 0, 0, 0, 27, 181, 76,
                                   194, 17, 43, 231, 57, 238, 99, 148, 97, 35,
                                   138, 26, 214, 111, 143, 97, 240, 20, 0, 0, 0,
                                   27, 161, 76, 202, 227, 205, 40, 64, 199, 162,
                                   179, 168, 166, 31, 34, 38, 213, 48, 68, 228,
                                   20, 0, 0, 0, 26, 197, 166, 182, 120, 169, 0,
                                   74, 163, 222, 185, 236, 112, 207, 212, 86,
                                   253, 187, 180, 24, 20, 0, 0, 0, 27, 200, 214,
                                   182, 237, 219, 163, 129, 106, 193, 59, 10,
                                   244, 82, 123, 210, 111, 149, 239, 74, 20, 0,
                                   0, 0, 27, 181, 68, 177, 188, 163, 111, 59,
                                   217, 83, 5, 55, 203, 202, 41, 236, 34, 47,
                                   171, 251, 20, 0, 0, 0, 31, 133, 166, 164,
                                   124, 152, 7, 57, 78, 68, 155, 39, 175, 56, 6,
                                   187, 255, 149, 121, 32, 20, 0, 0, 0, 31, 153,
                                   124, 172, 231, 224, 66, 61, 157, 210, 128,
                                   78, 159, 41, 21, 191, 77, 48, 103, 8, 20, 0,
                                   0, 0, 26, 21, 159, 9, 233, 57, 206, 114, 58,
                                   50, 231, 103, 140, 142, 75, 134, 26, 94, 227,
                                   146, 20, 0, 0, 0, 31, 144, 30, 226, 239, 218,
                                   22, 254, 189, 130, 97, 46, 172, 81, 163, 14,
                                   123, 130, 43, 234, 20, 0, 0, 0, 31, 144, 70,
                                   197, 59, 156, 160, 76, 254, 113, 89, 70, 123,
                                   67, 42, 107, 225, 200, 128, 15, 20, 0, 0, 0,
                                   31, 148, 124, 181, 47, 232, 157, 222, 167,
                                   66, 163, 171, 31, 132, 159, 99, 241, 55, 215,
                                   135, 20, 0, 0, 0, 29, 194, 124, 181, 187,
                                   128, 225, 91, 119, 62, 116, 98, 82, 108, 111,
                                   255, 173, 204, 3, 83, 20, 0, 0, 0, 27, 213,
                                   118, 166, 5, 151, 149, 87, 67, 211, 253, 161,
                                   110, 241, 172, 115, 29, 179, 96, 170, 20, 0,
                                   0, 0, 29, 194, 70, 171, 222, 254, 222, 102,
                                   71, 237, 134, 95, 75, 167, 120, 41, 191, 117,
                                   78, 42, 20, 0, 0, 0, 26, 113, 194, 175, 59,
                                   253, 128, 89, 81, 197, 131, 21, 201, 120,
                                   200, 91, 201, 233, 126, 24, 20, 0, 0, 0, 29,
                                   205, 134, 166, 227, 142, 24, 183, 142, 65,
                                   96, 89, 204, 229, 67, 84, 137, 44, 129, 69,
                                   20, 0, 0, 0, 29, 221, 6, 165, 191, 125, 117,
                                   197, 30, 67, 213, 97, 193, 232, 93, 126, 78,
                                   49, 86, 15, 20, 0, 0, 0, 29, 194, 6, 173,
                                   238, 191, 149, 45, 239, 1, 64, 96, 151, 59,
                                   148, 207, 155, 120, 223, 1, 20, 0, 0, 0, 29,
                                   221, 14, 163, 124, 191, 145, 143, 121, 107,
                                   68, 121, 111, 138, 147, 97, 190, 126, 122,
                                   104, 20, 0, 0, 0, 29, 222, 102, 158, 231,
                                   197, 95, 69, 62, 91, 58, 44, 151, 49, 101,
                                   170, 213, 240, 206, 69, 20, 0, 0, 0, 29, 204,
                                   14, 151, 18, 175, 233, 61, 78, 83, 120, 254,
                                   200, 232, 1, 225, 120, 117, 39, 10, 20, 0, 0,
                                   0, 29, 221, 46, 175, 78, 74, 79, 89, 46, 83,
                                   2, 170, 167, 49, 92, 68, 83, 153, 167, 53,
                                   20, 0, 0, 0, 29, 201, 134, 157, 62, 128, 169,
                                   76, 232, 234, 116, 50, 176, 232, 67, 205,
                                   236, 233, 250, 43, 20, 0, 0, 0, 29, 216, 118,
                                   166, 191, 50, 54, 93, 14, 86, 167, 34, 139,
                                   118, 93, 164, 83, 145, 97, 43, 20, 0, 0, 0,
                                   29, 204, 14, 162, 77, 65, 146, 69, 70, 209,
                                   100, 126, 139, 113, 53, 177, 91, 148, 175,
                                   43, 20, 0, 0, 0, 29, 194, 14, 167, 27, 174,
                                   202, 122, 169, 231, 27, 46, 95, 24, 127, 228,
                                   181, 224, 125, 73, 20, 0, 0, 0, 31, 181, 88,
                                   169, 169, 196, 3, 3, 147, 212, 168, 192, 187,
                                   96, 22, 81, 125, 40, 164, 23, 20, 0, 0, 0,
                                   31, 181, 28, 166, 247, 46, 247, 229, 254,
                                   127, 133, 63, 39, 43, 3, 208, 229, 230, 72,
                                   23, 20, 0, 0, 0, 31, 168, 128, 172, 25, 157,
                                   243, 189, 7, 106, 206, 54, 190, 236, 5, 85,
                                   103, 112, 161, 92, 20, 0, 0, 0, 30, 197, 102,
                                   169, 7, 116, 246, 1, 118, 202, 163, 151, 193,
                                   161, 58, 216, 164, 116, 253, 17, 20, 0, 0, 0,
                                   31, 181, 40, 173, 28, 124, 85, 121, 214, 222,
                                   98, 192, 135, 62, 104, 177, 162, 115, 49, 88,
                                   20, 0, 0, 0, 31, 168, 208, 178, 237, 61, 161,
                                   110, 211, 184, 39, 224, 223, 7, 122, 80, 121,
                                   179, 225, 10, 20, 0, 0, 0, 30, 197, 98, 188,
                                   199, 222, 182, 121, 22, 235, 100, 162, 206,
                                   159, 81, 226, 55, 207, 100, 232, 20, 0, 0, 0,
                                   27, 165, 78, 171, 62, 148, 246, 4, 227, 108,
                                   164, 34, 247, 51, 1, 65, 217, 176, 26, 214,
                                   20, 0, 0, 0, 31, 181, 20, 174, 252, 181, 24,
                                   199, 110, 105, 85, 178, 191, 56, 74, 95, 108,
                                   105, 9, 234, 20, 0, 0, 0, 31, 181, 16, 187,
                                   124, 126, 15, 201, 126, 58, 73, 51, 210, 71,
                                   138, 216, 160, 186, 233, 243, 20, 0, 0, 0,
                                   31, 168, 164, 175, 28, 168, 118, 56, 190,
                                   110, 185, 162, 53, 236, 98, 245, 41, 243,
                                   129, 86, 20, 0, 0, 0, 31, 175, 92, 163, 141,
                                   160, 55, 57, 134, 226, 141, 160, 215, 13, 74,
                                   32, 92, 127, 254, 8, 20, 0, 0, 0, 31, 181,
                                   80, 188, 220, 26, 113, 7, 206, 129, 20, 33,
                                   143, 150, 68, 103, 21, 59, 118, 149, 20, 0,
                                   0, 0, 29, 194, 14, 191, 227, 174, 76, 86, 41,
                                   248, 213, 174, 114, 71, 142, 143, 141, 215,
                                   253, 146, 20, 0, 0, 0, 31, 181, 16, 177, 156,
                                   64, 237, 86, 3, 140, 66, 183, 17, 229, 81,
                                   252, 1, 242, 37, 43, 20, 0, 0, 0, 24, 185,
                                   246, 177, 83, 46, 71, 230, 115, 253, 6, 225,
                                   99, 113, 44, 78, 211, 139, 224, 24, 20, 0, 0,
                                   0, 29, 207, 142, 189, 15, 190, 170, 125, 23,
                                   51, 38, 131, 223, 150, 184, 19, 147, 118,
                                   161, 127, 20, 0, 0, 0, 28, 185, 204, 180, 73,
                                   206, 233, 94, 169, 131, 111, 227, 71, 165,
                                   98, 240, 0, 116, 46, 191, 20, 0, 0, 0, 26,
                                   112, 174, 178, 154, 44, 0, 6, 120, 81, 111,
                                   159, 199, 47, 57, 240, 200, 241, 158, 242,
                                   20, 0, 0, 0, 29, 211, 14, 189, 190, 210, 23,
                                   141, 134, 237, 24, 215, 224, 231, 91, 87, 44,
                                   248, 142, 152, 20, 0, 0, 0, 31, 119, 206,
                                   187, 28, 152, 11, 111, 177, 199, 227, 62, 32,
                                   236, 57, 45, 192, 216, 229, 73, 20, 0, 0, 0,
                                   26, 109, 16, 199, 169, 166, 48, 118, 249,
                                   124, 166, 127, 240, 230, 110, 78, 104, 2, 11,
                                   8, 20, 0, 0, 0, 25, 220, 138, 203, 237, 61,
                                   124, 7, 23, 230, 137, 225, 97, 231, 146, 213,
                                   117, 60, 2, 199, 20, 0, 0, 0, 29, 196, 78,
                                   206, 27, 174, 71, 177, 200, 236, 183, 249,
                                   153, 255, 84, 173, 202, 112, 19, 224, 20, 0,
                                   0, 0, 29, 211, 78, 203, 237, 168, 228, 168,
                                   184, 148, 35, 255, 180, 222, 178, 98, 24, 21,
                                   24, 243, 20, 0, 0, 0, 28, 105, 128, 184, 163,
                                   213, 126, 32, 243, 226, 184, 47, 153, 242,
                                   86, 5, 128, 115, 241, 121, 20, 0, 0, 0, 26,
                                   125, 68, 188, 41, 168, 197, 15, 67, 107, 104,
                                   215, 134, 199, 64, 38, 128, 124, 39, 17, 20,
                                   0, 0, 0, 26, 125, 78, 184, 183, 30, 201, 79,
                                   221, 203, 197, 218, 180, 107, 33, 163, 41,
                                   187, 25, 248, 20, 0, 0, 0, 29, 219, 14, 203,
                                   27, 177, 234, 91, 54, 223, 50, 103, 196, 177,
                                   158, 17, 64, 101, 158, 163, 20, 0, 0, 0, 29,
                                   223, 70, 186, 67, 253, 8, 41, 126, 88, 123,
                                   255, 42, 104, 194, 206, 200, 255, 159, 7, 20,
                                   0, 0, 0, 29, 221, 198, 184, 153, 204, 233,
                                   95, 3, 241, 56, 87, 28, 241, 61, 151, 249,
                                   247, 232, 240, 20, 0, 0, 0, 24, 161, 206,
                                   196, 155, 86, 246, 85, 125, 234, 33, 51, 182,
                                   197, 78, 44, 105, 48, 159, 234, 20, 0, 0, 0,
                                   29, 223, 6, 189, 105, 99, 42, 127, 167, 230,
                                   240, 75, 208, 24, 107, 34, 215, 149, 146,
                                   247, 20, 0, 0, 0, 29, 207, 124, 196, 191, 89,
                                   45, 152, 65, 126, 23, 162, 105, 199, 249,
                                   255, 84, 244, 42, 207, 20, 0, 0, 0, 29, 206,
                                   70, 181, 113, 189, 108, 74, 33, 223, 245, 71,
                                   48, 239, 58, 19, 33, 37, 40, 233, 20, 0, 0,
                                   0, 29, 221, 14, 189, 60, 233, 106, 198, 102,
                                   207, 255, 64, 32, 229, 65, 193, 112, 188,
                                   168, 228, 20, 0, 0, 0, 29, 222, 14, 182, 81,
                                   239, 61, 63, 62, 129, 107, 37, 116, 47, 29,
                                   162, 12, 95, 209, 66, 20, 0, 0, 0, 31, 181,
                                   76, 184, 219, 248, 233, 93, 225, 236, 164,
                                   127, 227, 146, 92, 153, 148, 114, 165, 40,
                                   20, 0, 0, 0, 29, 222, 70, 188, 220, 195, 253,
                                   194, 63, 91, 31, 177, 103, 184, 77, 129, 166,
                                   43, 40, 231, 20, 0, 0, 0, 31, 163, 48, 179,
                                   143, 141, 51, 141, 207, 80, 59, 57, 127, 133,
                                   228, 173, 188, 107, 124, 0, 20, 0, 0, 0, 27,
                                   213, 102, 160, 227, 133, 5, 1, 113, 215, 73,
                                   162, 155, 108, 216, 127, 215, 212, 133, 89,
                                   20, 0, 0, 0, 29, 223, 182, 161, 137, 218,
                                   179, 244, 151, 96, 164, 35, 63, 44, 90, 241,
                                   33, 184, 224, 248, 20, 0, 0, 0, 31, 163, 16,
                                   173, 252, 129, 93, 190, 78, 65, 128, 32, 249,
                                   73, 142, 18, 216, 114, 170, 153, 20, 0, 0, 0,
                                   26, 109, 228, 175, 171, 98, 162, 17, 243,
                                   214, 174, 31, 254, 232, 70, 53, 155, 144, 45,
                                   107, 20, 0, 0, 0, 31, 176, 68, 184, 197, 35,
                                   8, 199, 103, 34, 5, 190, 132, 108, 194, 103,
                                   247, 99, 92, 65, 20, 0, 0, 0, 31, 189, 80,
                                   164, 218, 183, 234, 74, 119, 9, 141, 118,
                                   107, 112, 181, 16, 19, 117, 245, 233, 20, 0,
                                   0, 0, 31, 176, 46, 166, 145, 141, 233, 84,
                                   196, 237, 1, 69, 235, 127, 82, 193, 232, 149,
                                   226, 202, 20, 0, 0, 0, 31, 168, 196, 213,
                                   247, 40, 67, 253, 78, 15, 164, 51, 19, 102,
                                   227, 20, 175, 17, 30, 69, 20, 0, 0, 0, 28,
                                   21, 70, 233, 1, 97, 251, 103, 93, 162, 74,
                                   191, 132, 232, 84, 193, 8, 230, 69, 95, 20,
                                   0, 0, 0, 31, 181, 88, 205, 55, 128, 54, 1,
                                   184, 164, 135, 137, 40, 225, 0, 216, 77, 181,
                                   73, 231, 20, 0, 0, 0, 31, 168, 194, 193, 195,
                                   203, 42, 69, 189, 193, 100, 49, 57, 81, 82,
                                   81, 129, 170, 248, 160, 20, 0, 0, 0, 31, 168,
                                   146, 179, 240, 249, 30, 7, 199, 200, 164, 11,
                                   249, 231, 72, 177, 251, 203, 72, 96, 20, 0,
                                   0, 0, 26, 104, 160, 164, 124, 250, 28, 22, 1,
                                   193, 147, 169, 140, 168, 125, 109, 250, 119,
                                   129, 79, 20, 0, 0, 0, 31, 163, 18, 165, 110,
                                   229, 88, 183, 243, 210, 126, 248, 243, 173,
                                   244, 97, 56, 126, 84, 119, 20, 0, 0, 0, 30,
                                   185, 148, 166, 233, 28, 239, 79, 231, 208,
                                   133, 84, 199, 137, 170, 206, 222, 40, 176,
                                   75, 20, 0, 0, 0, 29, 211, 226, 175, 197, 34,
                                   80, 150, 238, 96, 0, 29, 183, 42, 194, 71,
                                   72, 173, 225, 72, 20, 0, 0, 0, 29, 204, 98,
                                   159, 199, 131, 15, 74, 28, 86, 149, 159, 48,
                                   202, 103, 190, 220, 118, 248, 95, 20, 0, 0,
                                   0, 29, 204, 66, 175, 243, 225, 132, 255, 247,
                                   20, 180, 29, 176, 241, 132, 99, 246, 82, 166,
                                   200, 20, 0, 0, 0, 29, 219, 98, 153, 174, 230,
                                   75, 4, 71, 100, 212, 167, 235, 170, 193, 233,
                                   15, 148, 39, 248, 20, 0, 0, 0, 29, 204, 98,
                                   167, 60, 91, 118, 140, 252, 15, 8, 49, 1,
                                   117, 171, 19, 189, 59, 122, 5, 20, 0, 0, 0,
                                   26, 125, 96, 159, 190, 172, 232, 159, 98,
                                   222, 152, 34, 104, 247, 217, 213, 75, 133, 2,
                                   0, 20, 0, 0, 0, 29, 207, 138, 169, 123, 164,
                                   95, 245, 152, 65, 104, 61, 153, 118, 139,
                                   193, 163, 147, 3, 237, 20, 0, 0, 0, 26, 104,
                                   174, 172, 252, 253, 237, 142, 36, 194, 122,
                                   200, 231, 48, 34, 193, 212, 245, 120, 77, 20,
                                   0, 0, 0, 29, 220, 198, 160, 209, 172, 200,
                                   249, 14, 78, 120, 146, 174, 236, 38, 45, 103,
                                   114, 85, 32, 20, 0, 0, 0, 30, 112, 236, 177,
                                   137, 225, 24, 59, 30, 79, 28, 174, 128, 227,
                                   126, 35, 220, 240, 85, 10, 20, 0, 0, 0, 30,
                                   113, 152, 181, 14, 214, 28, 212, 71, 97, 7,
                                   251, 214, 232, 122, 214, 163, 101, 32, 34,
                                   20, 0, 0, 0, 27, 200, 198, 185, 222, 124,
                                   234, 188, 215, 151, 102, 161, 36, 172, 74,
                                   94, 186, 213, 28, 18, 20, 0, 0, 0, 29, 149,
                                   110, 205, 169, 136, 184, 79, 104, 133, 136,
                                   62, 63, 143, 188, 222, 109, 173, 5, 120, 20,
                                   0, 0, 0, 31, 176, 16, 197, 219, 41, 228, 108,
                                   40, 84, 83, 250, 167, 8, 145, 113, 244, 164,
                                   33, 241, 20, 0, 0, 0, 26, 104, 174, 188, 190,
                                   175, 162, 199, 30, 114, 85, 41, 73, 111, 122,
                                   231, 144, 241, 95, 130, 20, 0, 0, 0, 26, 109,
                                   194, 200, 243, 47, 83, 173, 126, 66, 94, 171,
                                   254, 11, 170, 83, 23, 100, 221, 231, 20, 0,
                                   0, 0, 26, 104, 194, 179, 131, 86, 68, 89,
                                   206, 127, 105, 248, 191, 43, 98, 188, 104,
                                   121, 54, 108, 20, 0, 0, 0, 26, 104, 146, 183,
                                   28, 53, 55, 5, 94, 44, 168, 45, 223, 23, 88,
                                   0, 86, 38, 250, 172, 20, 0, 0, 0, 25, 48, 20,
                                   188, 15, 220, 234, 110, 31, 223, 22, 216,
                                   242, 126, 192, 241, 9, 213, 23, 18, 20, 0, 0,
                                   0, 29, 200, 98, 188, 231, 217, 50, 133, 151,
                                   25, 250, 99, 18, 88, 170, 15, 131, 104, 213,
                                   31, 20, 0, 0, 0, 29, 202, 98, 165, 177, 189,
                                   3, 251, 233, 225, 138, 158, 15, 42, 194, 226,
                                   111, 132, 169, 10, 20, 0, 0, 0, 29, 202, 10,
                                   169, 114, 161, 8, 175, 142, 64, 5, 195, 255,
                                   48, 250, 9, 123, 211, 140, 247, 20, 0, 0, 0,
                                   29, 202, 102, 163, 45, 240, 234, 90, 238, 19,
                                   112, 0, 227, 119, 73, 227, 227, 149, 125, 18,
                                   20, 0, 0, 0, 29, 202, 14, 165, 227, 149, 107,
                                   89, 40, 234, 116, 6, 40, 232, 254, 27, 39,
                                   149, 0, 235, 20, 0, 0, 0, 26, 96, 112, 165,
                                   77, 174, 168, 93, 119, 252, 70, 227, 124,
                                   255, 254, 35, 255, 213, 190, 62, 20, 0, 0, 0,
                                   26, 109, 144, 168, 151, 175, 232, 59, 99,
                                   208, 245, 149, 7, 15, 173, 139, 115, 117, 79,
                                   55, 20, 0, 0, 0, 29, 204, 102, 163, 188, 166,
                                   42, 133, 179, 207, 148, 10, 172, 237, 85,
                                   225, 248, 252, 102, 213, 20, 0, 0, 0, 29,
                                   204, 10, 187, 175, 188, 48, 66, 8, 190, 105,
                                   54, 15, 53, 56, 175, 104, 254, 163, 10, 20,
                                   0, 0, 0, 28, 197, 14, 183, 126, 33, 45, 243,
                                   132, 150, 245, 37, 151, 50, 134, 21, 182, 21,
                                   36, 7, 20, 0, 0, 0, 29, 223, 98, 203, 61, 69,
                                   74, 69, 14, 80, 180, 34, 249, 244, 100, 37,
                                   61, 165, 183, 202, 20, 0, 0, 0, 24, 57, 246,
                                   206, 45, 188, 30, 58, 17, 218, 147, 168, 172,
                                   88, 217, 97, 132, 252, 88, 199, 20, 0, 0, 0,
                                   29, 193, 98, 195, 156, 68, 225, 0, 25, 196,
                                   140, 34, 198, 53, 9, 193, 224, 112, 191, 106,
                                   20, 0, 0, 0, 25, 33, 214, 193, 62, 181, 104,
                                   89, 163, 213, 37, 183, 161, 49, 42, 150, 119,
                                   155, 125, 232, 20, 0, 0, 0, 25, 63, 148, 219,
                                   251, 28, 0, 242, 174, 45, 190, 167, 49, 141,
                                   136, 38, 91, 149, 184, 240, 20, 0, 0, 0, 25,
                                   63, 148, 216, 39, 42, 101, 5, 14, 106, 36,
                                   88, 186, 64, 3, 212, 253, 192, 3, 148, 20, 0,
                                   0, 0, 29, 220, 134, 219, 94, 53, 140, 58,
                                   168, 147, 34, 217, 135, 56, 159, 149, 16,
                                   195, 156, 9, 20, 0, 0, 0, 25, 33, 218, 212,
                                   44, 245, 248, 125, 83, 31, 135, 160, 176,
                                   253, 204, 142, 199, 150, 168, 51, 20, 0, 0,
                                   0, 25, 33, 164, 217, 156, 200, 246, 59, 36,
                                   139, 14, 67, 89, 71, 66, 75, 201, 152, 29,
                                   80, 20, 0, 0, 0, 25, 33, 214, 209, 59, 70, 0,
                                   127, 159, 66, 74, 168, 207, 22, 141, 128,
                                   177, 187, 45, 254, 20, 0, 0, 0, 25, 48, 214,
                                   220, 60, 25, 8, 72, 121, 127, 244, 53, 80,
                                   246, 74, 82, 65, 168, 165, 95, 20, 0, 0, 0,
                                   29, 220, 42, 223, 3, 221, 114, 21, 231, 109,
                                   149, 207, 27, 106, 219, 37, 68, 184, 217, 32,
                                   20, 0, 0, 0, 29, 217, 66, 239, 251, 2, 104,
                                   64, 207, 89, 88, 126, 177, 71, 246, 83, 84,
                                   245, 1, 11, 20, 0, 0, 0, 29, 220, 66, 222,
                                   220, 161, 76, 124, 97, 206, 121, 255, 255,
                                   136, 58, 148, 237, 203, 44, 231, 20, 0, 0, 0,
                                   25, 48, 36, 214, 238, 216, 234, 186, 254, 1,
                                   211, 189, 39, 9, 92, 214, 83, 164, 89, 39,
                                   20, 0, 0, 0, 29, 206, 66, 212, 220, 20, 176,
                                   85, 207, 106, 255, 54, 217, 248, 73, 239, 79,
                                   159, 168, 0, 20, 0, 0, 0, 29, 201, 50, 194,
                                   99, 197, 180, 61, 199, 225, 40, 35, 33, 87,
                                   93, 146, 233, 229, 180, 13, 20, 0, 0, 0, 25,
                                   53, 80, 202, 145, 188, 79, 44, 84, 138, 183,
                                   166, 111, 41, 74, 20, 236, 181, 140, 139, 20,
                                   0, 0, 0, 29, 206, 62, 188, 27, 40, 240, 60,
                                   94, 80, 139, 11, 126, 247, 56, 14, 217, 176,
                                   85, 40, 20, 0, 0, 0, 29, 222, 10, 197, 124,
                                   174, 94, 248, 49, 60, 180, 31, 85, 201, 243,
                                   192, 127, 148, 161, 16, 20, 0, 0, 0, 29, 202,
                                   22, 216, 7, 86, 224, 44, 151, 88, 0, 159, 30,
                                   252, 246, 128, 4, 61, 170, 192, 20, 0, 0, 0,
                                   29, 202, 102, 212, 77, 175, 186, 84, 110,
                                   109, 135, 169, 34, 111, 74, 87, 75, 120, 178,
                                   207, 20, 0, 0, 0, 28, 127, 168, 227, 252, 33,
                                   248, 7, 3, 174, 131, 180, 102, 246, 178, 148,
                                   190, 91, 45, 254, 20, 0, 0, 0, 26, 125, 16,
                                   226, 87, 189, 85, 171, 222, 91, 175, 74, 91,
                                   241, 200, 253, 53, 237, 32, 200, 20, 0, 0, 0,
                                   26, 111, 16, 239, 241, 196, 231, 173, 126,
                                   127, 98, 75, 25, 237, 65, 215, 125, 111, 65,
                                   72, 20, 0, 0, 0, 29, 219, 10, 237, 188, 168,
                                   245, 183, 49, 151, 68, 36, 231, 24, 90, 109,
                                   221, 50, 165, 113, 20, 0, 0, 0, 27, 106, 144,
                                   232, 199, 206, 66, 23, 86, 214, 214, 121, 99,
                                   223, 134, 4, 211, 47, 182, 242, 20, 0, 0, 0,
                                   25, 44, 52, 232, 219, 92, 22, 50, 215, 196,
                                   117, 70, 67, 255, 81, 173, 67, 128, 97, 64,
                                   20, 0, 0, 0, 27, 125, 132, 233, 188, 218,
                                   114, 20, 141, 212, 244, 26, 118, 233, 91,
                                   118, 233, 162, 225, 47, 20, 0, 0, 0, 27, 114,
                                   144, 234, 145, 213, 85, 124, 163, 193, 218,
                                   202, 86, 241, 133, 227, 32, 186, 141, 74, 20,
                                   0, 0, 0, 25, 59, 218, 225, 229, 1, 101, 178,
                                   207, 43, 90, 40, 194, 111, 147, 211, 131, 48,
                                   127, 80, 20, 0, 0, 0, 28, 40, 22, 239, 252,
                                   175, 22, 4, 6, 219, 85, 173, 255, 0, 6, 61,
                                   45, 20, 189, 119, 20, 0, 0, 0, 26, 103, 146,
                                   235, 225, 199, 7, 102, 24, 147, 111, 182,
                                   167, 170, 61, 99, 127, 63, 60, 144, 20, 0, 0,
                                   0, 26, 125, 146, 236, 220, 156, 15, 111, 93,
                                   190, 136, 225, 154, 111, 25, 192, 113, 171,
                                   41, 176, 20, 0, 0, 0, 28, 42, 24, 234, 143,
                                   53, 34, 66, 142, 20, 187, 120, 207, 39, 249,
                                   236, 101, 50, 213, 64, 20, 0, 0, 0, 28, 43,
                                   150, 228, 146, 181, 11, 177, 116, 224, 245,
                                   100, 148, 107, 91, 81, 24, 26, 107, 199, 20,
                                   0, 0, 0, 25, 34, 90, 238, 27, 61, 0, 0, 131,
                                   137, 20, 213, 217, 80, 109, 212, 241, 230,
                                   181, 40, 20, 0, 0, 0, 27, 114, 146, 235, 169,
                                   60, 1, 250, 3, 150, 164, 226, 99, 82, 58, 16,
                                   184, 177, 212, 139, 20, 0, 0, 0, 27, 122,
                                   146, 218, 211, 137, 138, 87, 210, 210, 38,
                                   223, 67, 169, 96, 50, 219, 95, 33, 77, 20, 0,
                                   0, 0, 28, 59, 150, 221, 91, 166, 48, 1, 222,
                                   112, 128, 0, 24, 182, 130, 210, 92, 231, 218,
                                   17, 20, 0, 0, 0, 28, 40, 22, 203, 126, 180,
                                   8, 56, 135, 226, 151, 225, 147, 118, 194,
                                   243, 11, 216, 175, 209, 20, 0, 0, 0, 27, 107,
                                   144, 201, 238, 158, 214, 83, 30, 82, 145,
                                   126, 131, 127, 91, 193, 129, 219, 41, 233,
                                   20, 0, 0, 0, 29, 219, 42, 213, 163, 218, 135,
                                   180, 193, 215, 117, 168, 231, 6, 91, 88, 220,
                                   118, 182, 34, 20, 0, 0, 0, 25, 34, 86, 204,
                                   39, 181, 33, 168, 160, 99, 37, 32, 60, 119,
                                   0, 49, 131, 127, 175, 22, 20, 0, 0, 0, 26,
                                   104, 194, 196, 232, 167, 9, 252, 2, 255, 16,
                                   198, 148, 72, 103, 236, 153, 235, 197, 8, 20,
                                   0, 0, 0, 26, 106, 194, 198, 156, 28, 5, 1,
                                   116, 144, 21, 35, 223, 111, 5, 154, 199, 131,
                                   0, 254, 20, 0, 0, 0, 26, 104, 194, 188, 91,
                                   161, 239, 190, 31, 98, 64, 97, 99, 109, 195,
                                   111, 58, 115, 163, 6, 20, 0, 0, 0, 26, 106,
                                   202, 206, 233, 216, 215, 93, 117, 87, 7, 253,
                                   225, 166, 138, 134, 228, 164, 6, 124, 20, 0,
                                   0, 0, 26, 125, 162, 186, 41, 44, 232, 148,
                                   119, 176, 136, 227, 135, 39, 252, 37, 20,
                                   166, 113, 84, 20, 0, 0, 0, 26, 126, 16, 185,
                                   7, 162, 197, 204, 241, 188, 181, 54, 11, 234,
                                   74, 240, 160, 171, 45, 96, 20, 0, 0, 0, 31,
                                   96, 162, 167, 231, 128, 3, 70, 193, 202, 149,
                                   33, 160, 245, 57, 210, 157, 123, 214, 50, 20,
                                   0, 0, 0, 26, 97, 16, 191, 71, 68, 54, 177,
                                   174, 82, 250, 169, 138, 67, 80, 44, 107, 136,
                                   133, 35, 20, 0, 0, 0, 29, 204, 138, 169, 137,
                                   169, 56, 75, 177, 129, 243, 35, 39, 167, 138,
                                   83, 116, 119, 220, 137, 20, 0, 0, 0, 30, 177,
                                   186, 193, 124, 43, 231, 6, 162, 5, 204, 43,
                                   92, 138, 12, 15, 154, 93, 65, 232, 20, 0, 0,
                                   0, 28, 197, 142, 199, 180, 189, 56, 86, 174,
                                   19, 128, 31, 41, 72, 176, 142, 64, 69, 169,
                                   232, 20, 0, 0, 0, 30, 177, 150, 186, 188,
                                   255, 213, 181, 254, 74, 184, 71, 51, 178,
                                   210, 78, 49, 168, 74, 50, 20, 0, 0, 0, 29,
                                   223, 106, 190, 60, 191, 16, 59, 57, 82, 159,
                                   160, 235, 101, 60, 113, 149, 207, 249, 73,
                                   20, 0, 0, 0, 29, 204, 234, 167, 222, 143,
                                   220, 249, 196, 238, 3, 174, 131, 127, 250,
                                   158, 104, 112, 77, 106, 20, 0, 0, 0, 29, 223,
                                   6, 162, 188, 183, 231, 60, 206, 65, 116, 223,
                                   204, 243, 110, 16, 231, 148, 221, 21, 20, 0,
                                   0, 0, 29, 206, 14, 190, 131, 25, 2, 103, 78,
                                   90, 149, 224, 199, 8, 175, 78, 91, 129, 43,
                                   24, 20, 0, 0, 0, 29, 221, 134, 178, 41, 28,
                                   241, 215, 99, 236, 255, 121, 11, 242, 5, 202,
                                   89, 164, 21, 241, 20, 0, 0, 0, 26, 104, 174,
                                   189, 5, 9, 159, 123, 40, 90, 180, 85, 147,
                                   202, 110, 177, 227, 21, 225, 41, 20, 0, 0, 0,
                                   31, 165, 216, 161, 252, 129, 235, 82, 151,
                                   211, 243, 162, 228, 127, 23, 241, 45, 59, 2,
                                   86, 20, 0, 0, 0, 31, 161, 56, 167, 92, 246,
                                   200, 254, 166, 244, 127, 191, 193, 232, 149,
                                   143, 83, 152, 200, 160, 20, 0, 0, 0, 31, 161,
                                   24, 161, 142, 225, 30, 92, 49, 239, 181, 179,
                                   177, 240, 82, 16, 209, 155, 9, 144, 20, 0, 0,
                                   0, 26, 104, 246, 185, 173, 2, 16, 77, 100,
                                   197, 113, 8, 68, 106, 81, 201, 79, 136, 162,
                                   68, 20, 0, 0, 0, 29, 206, 118, 170, 252, 165,
                                   110, 91, 34, 249, 138, 161, 169, 191, 193,
                                   208, 192, 251, 139, 21, 20, 0, 0, 0, 27, 180,
                                   24, 168, 113, 196, 80, 250, 182, 213, 95,
                                   190, 122, 43, 240, 146, 211, 158, 181, 173,
                                   20, 0, 0, 0, 31, 163, 28, 171, 37, 200, 169,
                                   127, 164, 223, 76, 102, 112, 209, 0, 94, 203,
                                   149, 42, 43, 20, 0, 0, 0, 26, 104, 156, 150,
                                   233, 195, 224, 179, 7, 81, 91, 37, 166, 230,
                                   242, 253, 235, 177, 89, 36, 20, 0, 0, 0, 26,
                                   112, 164, 172, 109, 216, 26, 137, 100, 240,
                                   146, 89, 74, 73, 47, 223, 83, 105, 61, 136,
                                   20, 0, 0, 0, 31, 161, 80, 164, 211, 230, 105,
                                   201, 206, 43, 28, 43, 113, 74, 160, 211, 201,
                                   48, 80, 247, 20, 0, 0, 0, 29, 223, 70, 191,
                                   28, 19, 239, 139, 82, 61, 78, 62, 171, 72,
                                   143, 206, 71, 131, 24, 232, 20, 0, 0, 0, 27,
                                   200, 166, 171, 252, 160, 255, 253, 104, 193,
                                   155, 23, 188, 79, 32, 217, 224, 99, 159, 146,
                                   20, 0, 0, 0, 27, 165, 116, 174, 195, 135,
                                   190, 102, 30, 86, 7, 161, 43, 122, 129, 65,
                                   149, 52, 46, 171, 20, 0, 0, 0, 27, 221, 102,
                                   173, 77, 62, 171, 122, 221, 254, 2, 156, 184,
                                   243, 239, 15, 177, 181, 207, 155, 20, 0, 0,
                                   0, 27, 207, 106, 173, 233, 145, 170, 65, 116,
                                   227, 43, 173, 159, 40, 195, 17, 7, 2, 41,
                                   176, 20, 0, 0, 0, 27, 200, 166, 169, 28, 137,
                                   70, 45, 94, 102, 37, 37, 12, 75, 0, 219, 19,
                                   136, 252, 100, 20, 0, 0, 0, 27, 200, 214,
                                   147, 169, 131, 201, 245, 110, 84, 134, 130,
                                   122, 122, 174, 48, 217, 33, 190, 42, 20, 0,
                                   0, 0, 31, 137, 6, 158, 9, 143, 197, 158, 158,
                                   97, 134, 35, 107, 234, 81, 224, 131, 155,
                                   120, 169, 20, 0, 0, 0, 29, 206, 54, 161, 81,
                                   163, 199, 91, 77, 210, 85, 40, 95, 42, 183,
                                   214, 168, 232, 191, 10, 20, 0, 0, 0, 24, 181,
                                   206, 169, 195, 156, 214, 101, 102, 224, 51,
                                   246, 140, 79, 134, 43, 132, 114, 174, 212,
                                   20, 0, 0, 0, 27, 200, 134, 172, 137, 40, 232,
                                   62, 55, 150, 202, 205, 175, 214, 152, 1, 124,
                                   178, 36, 202, 20, 0, 0, 0, 27, 213, 102, 164,
                                   77, 233, 105, 1, 142, 121, 236, 95, 83, 111,
                                   0, 128, 221, 243, 198, 231, 20, 0, 0, 0, 27,
                                   207, 102, 166, 174, 31, 235, 147, 109, 241,
                                   180, 43, 249, 127, 117, 97, 253, 248, 169,
                                   82, 20, 0, 0, 0, 27, 180, 78, 165, 41, 129,
                                   2, 199, 177, 146, 91, 167, 151, 47, 171, 73,
                                   100, 246, 57, 252, 20, 0, 0, 0, 27, 180, 116,
                                   164, 188, 28, 180, 175, 62, 0, 37, 127, 57,
                                   240, 125, 206, 225, 249, 79, 255, 20, 0, 0,
                                   0, 29, 199, 198, 149, 28, 236, 141, 224, 126,
                                   90, 156, 90, 98, 73, 170, 224, 163, 146, 67,
                                   71, 20, 0, 0, 0, 31, 165, 84, 158, 3, 5, 237,
                                   62, 171, 214, 131, 161, 222, 230, 109, 186,
                                   84, 27, 92, 177, 20, 0, 0, 0, 31, 185, 144,
                                   167, 232, 252, 175, 79, 126, 1, 117, 163,
                                   183, 42, 152, 4, 90, 119, 156, 89, 20, 0, 0,
                                   0, 31, 176, 52, 174, 110, 65, 144, 161, 78,
                                   112, 111, 168, 175, 41, 95, 159, 103, 156,
                                   227, 11, 20, 0, 0, 0, 31, 169, 180, 186, 220,
                                   130, 202, 131, 205, 72, 230, 94, 83, 169, 74,
                                   37, 205, 38, 126, 128, 20, 0, 0, 0, 31, 176,
                                   52, 171, 252, 201, 237, 25, 89, 225, 205, 74,
                                   219, 102, 152, 135, 196, 255, 193, 135, 20,
                                   0, 0, 0, 31, 165, 58, 170, 228, 250, 171,
                                   146, 39, 79, 122, 145, 154, 112, 55, 129,
                                   235, 213, 33, 232, 20, 0, 0, 0, 29, 204, 14,
                                   184, 60, 36, 64, 131, 101, 202, 199, 151,
                                   239, 11, 239, 151, 141, 191, 169, 234, 20, 0,
                                   0, 0, 29, 201, 118, 181, 157, 177, 141, 13,
                                   19, 207, 244, 30, 155, 227, 3, 34, 160, 245,
                                   161, 33, 20, 0, 0, 0, 29, 211, 78, 186, 239,
                                   71, 231, 69, 55, 140, 219, 42, 23, 48, 240,
                                   20, 20, 101, 52, 73, 20, 0, 0, 0, 29, 196,
                                   16, 183, 227, 251, 112, 62, 198, 203, 152, 7,
                                   72, 109, 61, 99, 15, 150, 144, 241, 20, 0, 0,
                                   0, 29, 196, 16, 202, 208, 188, 191, 13, 135,
                                   149, 233, 34, 39, 21, 243, 209, 178, 45, 205,
                                   7, 20, 0, 0, 0, 29, 196, 46, 182, 83, 69,
                                   135, 6, 209, 219, 191, 223, 116, 82, 46, 88,
                                   224, 233, 123, 204, 20, 0, 0, 0, 29, 211, 66,
                                   182, 232, 53, 111, 144, 162, 146, 246, 98,
                                   238, 231, 254, 176, 17, 55, 231, 209, 20, 0,
                                   0, 0, 29, 204, 34, 168, 15, 131, 246, 74,
                                   126, 76, 124, 67, 202, 103, 243, 83, 49, 42,
                                   168, 200, 20, 0, 0, 0, 31, 119, 162, 150, 79,
                                   174, 7, 71, 180, 213, 147, 227, 207, 54, 60,
                                   49, 233, 55, 244, 104, 20, 0, 0, 0, 29, 211,
                                   14, 169, 109, 191, 48, 141, 223, 15, 219,
                                   196, 246, 239, 134, 48, 155, 148, 165, 76,
                                   20, 0, 0, 0, 29, 204, 14, 175, 77, 130, 67,
                                   2, 88, 234, 92, 38, 99, 105, 174, 144, 27,
                                   149, 157, 10, 20, 0, 0, 0, 26, 104, 196, 176,
                                   241, 254, 160, 225, 228, 211, 39, 141, 6,
                                   107, 243, 87, 251, 100, 35, 203, 20, 0, 0, 0,
                                   27, 195, 102, 176, 98, 167, 255, 4, 158, 125,
                                   72, 40, 24, 232, 80, 0, 204, 120, 250, 220,
                                   20, 0, 0, 0, 31, 163, 80, 207, 195, 93, 239,
                                   193, 252, 94, 111, 97, 191, 36, 250, 23, 235,
                                   118, 33, 36, 20, 0, 0, 0, 31, 165, 208, 192,
                                   162, 168, 0, 65, 223, 236, 188, 34, 244, 194,
                                   85, 79, 21, 180, 161, 11, 20, 0, 0, 0, 31,
                                   163, 116, 205, 99, 150, 49, 5, 221, 223, 120,
                                   166, 241, 192, 250, 3, 85, 53, 196, 191, 20,
                                   0, 0, 0, 31, 161, 80, 195, 78, 85, 91, 253,
                                   14, 18, 148, 174, 135, 32, 66, 143, 99, 128,
                                   55, 138, 20, 0, 0, 0, 27, 180, 100, 207, 156,
                                   242, 135, 93, 78, 98, 169, 180, 196, 107, 90,
                                   207, 62, 52, 250, 169, 20, 0, 0, 0, 26, 127,
                                   28, 206, 201, 160, 224, 33, 215, 110, 121,
                                   19, 250, 126, 17, 105, 217, 253, 137, 249,
                                   20, 0, 0, 0, 26, 127, 28, 210, 80, 221, 105,
                                   89, 151, 48, 96, 11, 47, 13, 126, 43, 153,
                                   50, 47, 7, 20, 0, 0, 0, 26, 126, 174, 212,
                                   92, 156, 24, 180, 142, 44, 170, 178, 194,
                                   103, 173, 121, 52, 191, 138, 199, 20, 0, 0,
                                   0, 25, 61, 36, 230, 141, 44, 32, 188, 237,
                                   170, 167, 249, 227, 184, 130, 19, 168, 117,
                                   159, 127, 20, 0, 0, 0, 25, 54, 86, 211, 131,
                                   157, 138, 202, 36, 207, 140, 46, 123, 226,
                                   66, 15, 219, 148, 108, 23, 20, 0, 0, 0, 25,
                                   54, 106, 217, 187, 205, 80, 9, 241, 238, 181,
                                   210, 107, 232, 180, 10, 40, 123, 37, 99, 20,
                                   0, 0, 0, 25, 46, 20, 233, 60, 89, 120, 180,
                                   204, 85, 38, 169, 59, 74, 90, 81, 191, 134,
                                   175, 226, 20, 0, 0, 0, 28, 63, 22, 221, 173,
                                   255, 16, 4, 202, 230, 148, 35, 6, 240, 141,
                                   94, 72, 112, 5, 31, 20, 0, 0, 0, 27, 118, 36,
                                   214, 231, 174, 47, 254, 222, 81, 130, 165,
                                   235, 177, 197, 197, 96, 127, 161, 64, 20, 0,
                                   0, 0, 28, 46, 22, 207, 62, 172, 223, 82, 241,
                                   255, 19, 254, 184, 234, 66, 98, 49, 19, 217,
                                   117, 20, 0, 0, 0, 28, 61, 22, 201, 231, 159,
                                   239, 123, 241, 218, 148, 170, 106, 49, 18,
                                   243, 51, 116, 1, 10, 20, 0, 0, 0, 28, 44,
                                   244, 199, 37, 173, 171, 92, 199, 147, 4, 71,
                                   186, 106, 150, 65, 16, 101, 53, 232, 20, 0,
                                   0, 0, 28, 44, 244, 201, 199, 178, 95, 192,
                                   50, 193, 37, 158, 97, 85, 66, 144, 79, 138,
                                   224, 8, 20, 0, 0, 0, 27, 234, 164, 185, 123,
                                   254, 16, 249, 17, 204, 183, 157, 87, 41, 250,
                                   80, 70, 52, 66, 167, 20, 0, 0, 0, 28, 44,
                                   244, 184, 13, 220, 11, 124, 179, 191, 245,
                                   170, 200, 240, 77, 115, 99, 152, 159, 0, 20,
                                   0, 0, 0, 27, 250, 144, 188, 174, 171, 0, 204,
                                   227, 128, 12, 90, 105, 79, 122, 129, 55, 184,
                                   214, 74, 20, 0, 0, 0, 28, 49, 24, 187, 73,
                                   214, 86, 180, 215, 252, 184, 50, 7, 5, 66,
                                   17, 40, 247, 128, 24, 20, 0, 0, 0, 28, 48,
                                   152, 187, 92, 218, 75, 196, 147, 172, 147,
                                   160, 203, 104, 64, 79, 83, 152, 156, 88, 20,
                                   0, 0, 0, 28, 49, 50, 183, 62, 90, 235, 121,
                                   174, 124, 101, 172, 135, 115, 80, 78, 163,
                                   115, 255, 255, 20, 0, 0, 0, 25, 53, 40, 196,
                                   156, 1, 99, 76, 136, 202, 146, 226, 218, 105,
                                   90, 23, 223, 132, 252, 239, 20, 0, 0, 0, 27,
                                   126, 230, 193, 132, 96, 22, 29, 180, 148,
                                   148, 166, 68, 88, 94, 75, 201, 213, 121, 71,
                                   20, 0, 0, 0, 28, 41, 150, 196, 60, 73, 74,
                                   81, 174, 108, 4, 161, 23, 13, 250, 44, 199,
                                   192, 0, 13, 20, 0, 0, 0, 28, 41, 150, 183,
                                   161, 189, 234, 71, 158, 90, 122, 193, 159,
                                   170, 52, 67, 9, 176, 73, 97, 20, 0, 0, 0, 28,
                                   41, 150, 188, 141, 221, 41, 199, 135, 90,
                                   244, 182, 105, 241, 250, 15, 51, 117, 219,
                                   22, 20, 0, 0, 0, 28, 40, 22, 182, 105, 229,
                                   172, 100, 173, 155, 52, 89, 175, 25, 0, 15,
                                   104, 119, 229, 236, 20, 0, 0, 0, 29, 204, 82,
                                   190, 225, 46, 17, 223, 54, 213, 131, 92, 87,
                                   24, 241, 113, 199, 118, 181, 43, 20, 0, 0, 0,
                                   28, 32, 22, 185, 239, 30, 7, 62, 20, 235, 4,
                                   228, 204, 201, 61, 147, 120, 164, 196, 48,
                                   20, 0, 0, 0, 29, 216, 82, 160, 130, 170, 0,
                                   3, 14, 109, 105, 160, 36, 111, 253, 151, 148,
                                   116, 47, 240, 20, 0, 0, 0, 29, 216, 32, 175,
                                   19, 217, 22, 174, 22, 252, 139, 98, 38, 249,
                                   139, 101, 97, 180, 178, 11, 20, 0, 0, 0, 29,
                                   195, 146, 185, 9, 137, 73, 178, 215, 34, 133,
                                   183, 113, 106, 63, 176, 19, 159, 192, 248,
                                   20, 0, 0, 0, 24, 40, 36, 198, 28, 227, 244,
                                   228, 35, 149, 243, 162, 36, 209, 59, 214,
                                   189, 187, 89, 88, 20, 0, 0, 0, 26, 119, 224,
                                   196, 111, 173, 139, 89, 174, 108, 11, 168,
                                   231, 43, 147, 224, 196, 212, 39, 12, 20, 0,
                                   0, 0, 24, 59, 164, 214, 17, 86, 34, 73, 254,
                                   35, 129, 44, 171, 34, 81, 224, 71, 22, 174,
                                   216, 20, 0, 0, 0, 26, 119, 224, 229, 164,
                                   213, 224, 2, 83, 158, 140, 36, 203, 127, 74,
                                   21, 241, 240, 105, 45, 20, 0, 0, 0, 26, 105,
                                   224, 232, 206, 213, 126, 17, 222, 100, 197,
                                   38, 203, 86, 146, 212, 218, 36, 137, 95, 20,
                                   0, 0, 0, 31, 181, 97, 10, 141, 39, 42, 94,
                                   142, 20, 135, 146, 38, 182, 149, 193, 42, 91,
                                   197, 77, 20, 0, 0, 0, 29, 215, 163, 14, 220,
                                   230, 94, 247, 94, 1, 22, 52, 233, 142, 199,
                                   148, 85, 30, 160, 64, 20, 0, 0, 0, 26, 112,
                                   195, 4, 92, 254, 114, 77, 34, 129, 84, 168,
                                   23, 168, 5, 190, 119, 139, 96, 168, 20, 0, 0,
                                   0, 26, 108, 233, 10, 69, 236, 85, 205, 51,
                                   176, 219, 67, 137, 254, 210, 68, 247, 135,
                                   165, 95, 20, 0, 0, 0, 31, 205, 99, 8, 13,
                                   141, 235, 61, 50, 139, 112, 251, 11, 73, 164,
                                   91, 203, 102, 66, 7, 20, 0, 0, 0, 27, 98,
                                   176, 247, 113, 213, 254, 204, 88, 228, 91,
                                   55, 24, 237, 104, 48, 163, 120, 222, 43, 20,
                                   0, 0, 0, 27, 98, 144, 246, 124, 75, 204, 194,
                                   55, 34, 152, 209, 156, 100, 14, 49, 217, 26,
                                   196, 242, 20, 0, 0, 0, 25, 35, 208, 254, 146,
                                   169, 144, 96, 211, 206, 126, 7, 193, 255,
                                   150, 76, 141, 251, 226, 7, 20, 0, 0, 0, 28,
                                   35, 150, 245, 252, 213, 11, 247, 99, 163, 27,
                                   34, 31, 146, 89, 235, 184, 101, 86, 198, 20,
                                   0, 0, 0, 27, 114, 194, 241, 219, 180, 133,
                                   96, 163, 172, 5, 166, 254, 254, 26, 160, 145,
                                   213, 217, 71, 20, 0, 0, 0, 28, 35, 178, 245,
                                   205, 241, 146, 199, 99, 144, 197, 221, 62,
                                   245, 96, 128, 186, 38, 37, 118, 20, 0, 0, 0,
                                   27, 118, 240, 248, 79, 137, 159, 133, 231,
                                   176, 154, 255, 195, 175, 62, 32, 192, 99,
                                   225, 17, 20, 0, 0, 0, 27, 118, 216, 237, 28,
                                   88, 236, 1, 228, 229, 56, 4, 168, 246, 140,
                                   131, 161, 186, 216, 126, 20, 0, 0, 0, 27,
                                   114, 144, 226, 92, 194, 13, 81, 81, 176, 131,
                                   130, 95, 63, 93, 163, 244, 190, 88, 43, 20,
                                   0, 0, 0, 27, 98, 144, 232, 135, 127, 232, 35,
                                   132, 153, 155, 175, 47, 9, 252, 163, 156, 75,
                                   29, 32, 20, 0, 0, 0, 31, 118, 194, 235, 233,
                                   125, 75, 247, 142, 82, 123, 36, 146, 111, 27,
                                   174, 191, 213, 139, 17, 20, 0, 0, 0, 27, 114,
                                   206, 252, 71, 62, 203, 93, 33, 199, 200, 63,
                                   58, 94, 138, 210, 71, 128, 41, 73, 20, 0, 0,
                                   0, 25, 42, 86, 225, 94, 0, 11, 4, 115, 145,
                                   242, 3, 59, 85, 66, 214, 61, 37, 69, 231, 20,
                                   0, 0, 0, 27, 114, 244, 238, 168, 196, 231,
                                   81, 78, 113, 95, 237, 182, 237, 249, 212,
                                   226, 37, 176, 255, 20, 0, 0, 0, 27, 114, 144,
                                   206, 126, 197, 53, 179, 180, 216, 187, 224,
                                   28, 104, 0, 20, 171, 123, 68, 248, 20, 0, 0,
                                   0, 25, 42, 20, 232, 125, 93, 98, 180, 210,
                                   112, 172, 158, 241, 43, 60, 149, 163, 144,
                                   27, 43, 20, 0, 0, 0, 27, 114, 164, 208, 0,
                                   170, 143, 240, 230, 218, 124, 34, 239, 63,
                                   59, 60, 57, 187, 45, 0, 20, 0, 0, 0, 25, 34,
                                   86, 211, 152, 165, 241, 1, 228, 173, 108, 45,
                                   90, 118, 183, 189, 144, 171, 161, 2, 20, 0,
                                   0, 0, 25, 46, 84, 214, 156, 131, 22, 72, 157,
                                   209, 236, 39, 79, 62, 65, 155, 59, 215, 173,
                                   84, 20, 0, 0, 0, 25, 51, 218, 195, 9, 161,
                                   26, 91, 174, 84, 36, 163, 41, 79, 89, 207,
                                   64, 196, 107, 13, 20, 0, 0, 0, 25, 35, 218,
                                   206, 28, 161, 177, 246, 94, 112, 53, 198,
                                   219, 98, 205, 127, 120, 104, 133, 73, 20, 0,
                                   0, 0, 27, 114, 144, 201, 173, 190, 245, 190,
                                   222, 146, 132, 172, 128, 213, 206, 49, 24,
                                   117, 197, 74, 20, 0, 0, 0, 28, 46, 24, 178,
                                   124, 145, 72, 177, 81, 214, 23, 221, 222,
                                   246, 139, 109, 226, 59, 33, 42, 20, 0, 0, 0,
                                   24, 40, 58, 178, 197, 74, 75, 91, 247, 218,
                                   166, 62, 144, 223, 60, 161, 220, 107, 28,
                                   240, 20, 0, 0, 0, 28, 51, 202, 170, 201, 149,
                                   172, 175, 196, 100, 67, 153, 132, 169, 105,
                                   211, 71, 148, 43, 248, 20, 0, 0, 0, 25, 44,
                                   68, 174, 252, 217, 170, 88, 246, 212, 133,
                                   128, 143, 41, 186, 213, 131, 217, 42, 104,
                                   20, 0, 0, 0, 25, 35, 240, 169, 111, 218, 170,
                                   204, 238, 229, 249, 168, 82, 96, 58, 37, 123,
                                   100, 171, 209, 20, 0, 0, 0, 28, 35, 152, 171,
                                   155, 230, 180, 92, 30, 121, 236, 44, 236,
                                   202, 87, 173, 6, 40, 208, 160, 20, 0, 0, 0,
                                   26, 120, 216, 155, 133, 144, 0, 169, 14, 63,
                                   228, 38, 195, 107, 143, 58, 83, 149, 33, 96,
                                   20, 0, 0, 0, 28, 35, 152, 158, 165, 197, 8,
                                   192, 151, 14, 149, 172, 175, 23, 58, 132,
                                   120, 228, 35, 0, 20, 0, 0, 0, 28, 127, 242,
                                   148, 219, 68, 15, 68, 150, 236, 116, 61, 217,
                                   246, 186, 239, 252, 120, 166, 71, 20, 0, 0,
                                   0, 31, 96, 174, 132, 67, 173, 254, 93, 247,
                                   193, 1, 92, 214, 233, 66, 190, 243, 155, 47,
                                   34, 20, 0, 0, 0, 31, 96, 230, 150, 81, 0,
                                   235, 44, 70, 223, 207, 255, 247, 43, 107,
                                   163, 143, 143, 136, 126, 20, 0, 0, 0, 29,
                                   220, 102, 139, 94, 213, 126, 89, 30, 87, 228,
                                   32, 184, 246, 125, 177, 231, 127, 194, 98,
                                   20, 0, 0, 0, 26, 127, 66, 139, 60, 156, 136,
                                   33, 62, 84, 244, 124, 192, 233, 74, 170, 229,
                                   56, 203, 19, 20, 0, 0, 0, 25, 41, 228, 141,
                                   35, 255, 159, 73, 86, 226, 127, 160, 103, 39,
                                   201, 65, 156, 122, 240, 48, 20, 0, 0, 0, 25,
                                   41, 228, 131, 28, 240, 103, 3, 205, 205, 102,
                                   163, 119, 42, 19, 71, 32, 181, 244, 175, 20,
                                   0, 0, 0, 26, 112, 174, 133, 92, 170, 174,
                                   245, 100, 86, 164, 126, 64, 232, 4, 211, 167,
                                   221, 41, 30, 20, 0, 0, 0, 24, 119, 186, 157,
                                   171, 139, 234, 125, 62, 124, 240, 0, 160,
                                   192, 158, 19, 201, 143, 217, 137, 20, 0, 0,
                                   0, 24, 189, 66, 143, 188, 162, 207, 91, 129,
                                   223, 133, 219, 96, 252, 178, 187, 140, 191,
                                   134, 203, 20, 0, 0, 0, 31, 175, 100, 223,
                                   137, 41, 206, 29, 14, 50, 120, 206, 60, 51,
                                   97, 236, 189, 148, 174, 83, 20, 0, 0, 0, 28,
                                   30, 55, 6, 237, 31, 189, 90, 106, 48, 36, 98,
                                   204, 179, 54, 147, 11, 119, 155, 4, 20, 0, 0,
                                   0, 28, 25, 183, 34, 92, 79, 160, 75, 14, 55,
                                   133, 126, 235, 120, 97, 208, 187, 56, 202,
                                   83, 20, 0, 0, 0, 28, 10, 183, 51, 89, 158,
                                   92, 198, 60, 216, 149, 105, 118, 94, 78, 1,
                                   176, 33, 2, 172, 20, 0, 0, 0, 28, 10, 183,
                                   35, 249, 180, 159, 245, 179, 125, 97, 221,
                                   51, 235, 27, 244, 133, 49, 86, 32, 20, 0, 0,
                                   0, 28, 16, 55, 47, 239, 185, 56, 177, 149,
                                   214, 158, 87, 230, 104, 46, 216, 228, 165,
                                   227, 201, 20, 0, 0, 0, 28, 16, 55, 40, 79,
                                   66, 77, 77, 86, 234, 211, 247, 170, 77, 7,
                                   79, 33, 198, 221, 97, 20, 0, 0, 0, 28, 16,
                                   125, 24, 91, 26, 22, 36, 222, 64, 170, 215,
                                   247, 12, 97, 32, 235, 159, 76, 236, 20, 0, 0,
                                   0, 28, 16, 55, 26, 237, 33, 242, 243, 228,
                                   151, 60, 95, 128, 72, 212, 89, 174, 104, 31,
                                   160, 20, 0, 0, 0, 28, 26, 55, 13, 43, 165,
                                   20, 1, 86, 212, 63, 41, 210, 97, 86, 244,
                                   231, 58, 175, 187, 20, 0, 0, 0, 31, 190, 221,
                                   14, 231, 175, 175, 9, 222, 108, 206, 136,
                                   171, 124, 178, 222, 249, 42, 249, 83, 20, 0,
                                   0, 0, 28, 16, 124, 241, 190, 248, 173, 138,
                                   0, 141, 217, 31, 74, 98, 18, 65, 101, 247,
                                   162, 252, 20, 0, 0, 0, 31, 190, 228, 243,
                                   187, 224, 95, 226, 173, 215, 227, 167, 194,
                                   193, 7, 192, 78, 125, 189, 17, 20, 0, 0, 0,
                                   28, 16, 86, 236, 249, 204, 64, 241, 72, 252,
                                   133, 89, 200, 96, 146, 163, 224, 243, 74, 55,
                                   20, 0, 0, 0, 28, 19, 124, 248, 41, 28, 255,
                                   117, 172, 19, 103, 241, 151, 81, 255, 46,
                                   154, 41, 39, 250, 20, 0, 0, 0, 31, 175, 92,
                                   235, 129, 135, 16, 221, 16, 165, 132, 55,
                                   127, 156, 97, 192, 20, 183, 181, 95, 20, 0,
                                   0, 0, 31, 184, 220, 211, 46, 252, 74, 22,
                                   238, 215, 82, 26, 43, 139, 80, 191, 105, 54,
                                   136, 156, 20, 0, 0, 0, 31, 189, 184, 210, 59,
                                   254, 178, 64, 160, 230, 243, 151, 41, 239,
                                   134, 20, 85, 234, 255, 196, 20, 0, 0, 0, 31,
                                   184, 184, 198, 173, 212, 69, 254, 98, 255,
                                   131, 91, 167, 47, 79, 31, 253, 35, 3, 232,
                                   20, 0, 0, 0, 31, 184, 168, 201, 190, 158,
                                   197, 128, 35, 241, 60, 40, 41, 224, 184, 1,
                                   95, 131, 255, 255, 20, 0, 0, 0, 27, 184, 206,
                                   202, 137, 28, 134, 250, 118, 133, 88, 166,
                                   57, 197, 0, 49, 35, 111, 253, 150, 20, 0, 0,
                                   0, 27, 181, 182, 200, 11, 126, 80, 37, 118,
                                   191, 2, 35, 11, 96, 82, 240, 194, 38, 40,
                                   164, 20, 0, 0, 0, 27, 176, 206, 185, 62, 191,
                                   3, 93, 199, 0, 38, 33, 166, 209, 120, 61,
                                   105, 182, 217, 251, 20, 0, 0, 0, 31, 184,
                                   184, 185, 127, 129, 234, 234, 204, 108, 80,
                                   36, 64, 120, 184, 128, 233, 161, 29, 168, 20,
                                   0, 0, 0, 27, 181, 206, 186, 156, 85, 32, 3,
                                   253, 217, 5, 54, 122, 89, 73, 33, 160, 104,
                                   2, 116, 20, 0, 0, 0, 31, 184, 144, 167, 28,
                                   93, 232, 159, 54, 193, 137, 253, 187, 104,
                                   248, 19, 86, 239, 225, 7, 20, 0, 0, 0, 31,
                                   181, 84, 167, 55, 131, 205, 192, 152, 212,
                                   240, 1, 127, 8, 107, 209, 6, 227, 125, 64,
                                   20, 0, 0, 0, 27, 165, 14, 170, 227, 213, 240,
                                   138, 190, 82, 207, 253, 239, 51, 36, 133, 97,
                                   36, 99, 248, 20, 0, 0, 0, 31, 161, 16, 155,
                                   92, 253, 48, 217, 17, 207, 24, 125, 202, 117,
                                   80, 214, 156, 246, 43, 130, 20, 0, 0, 0, 31,
                                   163, 16, 147, 28, 227, 44, 5, 190, 110, 133,
                                   86, 147, 160, 201, 76, 201, 50, 81, 8, 20, 0,
                                   0, 0, 31, 165, 208, 157, 60, 221, 241, 85,
                                   142, 82, 12, 78, 63, 181, 93, 7, 94, 50, 29,
                                   73, 20, 0, 0, 0, 27, 165, 206, 159, 131, 221,
                                   187, 64, 193, 211, 148, 218, 143, 24, 167, 1,
                                   53, 63, 189, 182, 20, 0, 0, 0, 31, 175, 36,
                                   153, 135, 145, 0, 92, 33, 199, 100, 77, 227,
                                   64, 122, 201, 180, 202, 241, 109, 20, 0, 0,
                                   0, 31, 163, 52, 159, 169, 236, 104, 123, 30,
                                   75, 250, 129, 79, 43, 242, 149, 137, 59, 97,
                                   41, 20, 0, 0, 0, 27, 181, 206, 186, 14, 16,
                                   126, 95, 94, 58, 7, 190, 127, 63, 56, 24,
                                   179, 117, 34, 73, 20, 0, 0, 0, 31, 157, 198,
                                   199, 188, 40, 19, 6, 190, 15, 225, 241, 242,
                                   102, 148, 144, 113, 36, 137, 224, 20, 0, 0,
                                   0, 31, 133, 198, 193, 131, 119, 170, 84, 180,
                                   153, 216, 192, 215, 205, 17, 21, 185, 58,
                                   122, 136, 20, 0, 0, 0, 31, 152, 198, 206, 24,
                                   200, 171, 86, 126, 42, 201, 129, 14, 201,
                                   227, 124, 93, 35, 89, 115, 20, 0, 0, 0, 31,
                                   157, 6, 195, 70, 146, 199, 73, 190, 94, 68,
                                   48, 28, 117, 180, 49, 137, 239, 76, 39, 20,
                                   0, 0, 0, 31, 173, 208, 202, 169, 14, 229, 71,
                                   135, 106, 21, 52, 158, 0, 2, 17, 195, 119,
                                   158, 56, 20, 0, 0, 0, 31, 158, 70, 182, 25,
                                   170, 85, 83, 68, 160, 6, 48, 46, 221, 2, 238,
                                   153, 246, 161, 130, 20, 0, 0, 0, 31, 173,
                                   208, 178, 235, 61, 80, 67, 38, 192, 186, 190,
                                   158, 231, 154, 158, 167, 205, 214, 17, 20, 0,
                                   0, 0, 31, 131, 38, 188, 163, 240, 231, 178,
                                   116, 231, 79, 186, 244, 178, 226, 48, 46, 53,
                                   106, 64, 20, 0, 0, 0, 31, 176, 80, 174, 92,
                                   251, 191, 71, 103, 95, 95, 111, 87, 51, 250,
                                   24, 167, 126, 143, 74, 20, 0, 0, 0, 29, 133,
                                   56, 165, 141, 181, 171, 193, 158, 81, 248,
                                   75, 239, 58, 75, 68, 67, 156, 94, 39, 20, 0,
                                   0, 0, 29, 149, 110, 171, 188, 167, 234, 209,
                                   190, 69, 8, 215, 58, 97, 126, 205, 149, 12,
                                   31, 9, 20, 0, 0, 0, 31, 181, 78, 163, 233,
                                   154, 75, 97, 142, 79, 9, 66, 175, 63, 33,
                                   212, 98, 44, 28, 108, 20, 0, 0, 0, 29, 149,
                                   110, 163, 212, 10, 54, 206, 5, 210, 86, 138,
                                   59, 186, 111, 85, 189, 187, 165, 51, 20, 0,
                                   0, 0, 31, 181, 36, 149, 219, 163, 130, 76,
                                   31, 18, 134, 253, 209, 239, 125, 159, 107,
                                   144, 217, 231, 20, 0, 0, 0, 31, 173, 164,
                                   148, 38, 44, 220, 22, 223, 213, 115, 48, 199,
                                   38, 75, 241, 187, 148, 55, 193, 20, 0, 0, 0,
                                   31, 173, 228, 171, 124, 198, 40, 63, 151, 86,
                                   133, 39, 235, 86, 144, 23, 241, 47, 254, 95,
                                   20, 0, 0, 0, 31, 165, 100, 170, 109, 49, 51,
                                   249, 230, 203, 157, 34, 227, 76, 193, 206,
                                   143, 148, 99, 23, 20, 0, 0, 0, 31, 173, 228,
                                   153, 103, 89, 129, 134, 71, 86, 188, 116,
                                   122, 104, 197, 79, 61, 178, 248, 159, 20, 0,
                                   0, 0, 29, 149, 110, 168, 252, 212, 249, 146,
                                   212, 229, 62, 222, 67, 95, 197, 192, 121, 56,
                                   175, 62, 20, 0, 0, 0, 29, 149, 102, 146, 35,
                                   129, 232, 65, 222, 91, 91, 95, 131, 121, 248,
                                   37, 9, 60, 105, 172, 20, 0, 0, 0, 31, 165,
                                   228, 154, 238, 158, 249, 247, 110, 18, 148,
                                   42, 1, 240, 8, 93, 149, 34, 158, 96, 20, 0,
                                   0, 0, 31, 165, 228, 146, 156, 220, 8, 69,
                                   190, 126, 0, 38, 202, 106, 90, 1, 146, 49,
                                   191, 147, 20, 0, 0, 0, 31, 165, 206, 159,
                                   137, 171, 55, 195, 243, 13, 175, 65, 46, 222,
                                   179, 14, 96, 96, 26, 233, 20, 0, 0, 0, 31,
                                   165, 244, 155, 14, 32, 178, 94, 23, 240, 116,
                                   81, 10, 64, 243, 80, 109, 36, 169, 114, 20,
                                   0, 0, 0, 27, 200, 198, 155, 220, 36, 17, 84,
                                   174, 81, 229, 216, 199, 32, 171, 229, 29,
                                   235, 72, 104, 20, 0, 0, 0, 27, 193, 118, 149,
                                   141, 65, 10, 248, 81, 236, 163, 97, 87, 54,
                                   74, 193, 30, 83, 169, 10, 20, 0, 0, 0, 26,
                                   104, 144, 154, 173, 225, 236, 228, 79, 84,
                                   213, 207, 3, 108, 135, 196, 84, 123, 41, 170,
                                   20, 0, 0, 0, 27, 206, 102, 163, 124, 0, 73,
                                   85, 174, 77, 135, 164, 32, 177, 29, 175, 24,
                                   120, 254, 191, 20, 0, 0, 0, 28, 170, 156,
                                   171, 163, 89, 40, 66, 33, 191, 0, 74, 218,
                                   114, 69, 206, 173, 255, 161, 127, 20, 0, 0,
                                   0, 24, 162, 118, 170, 142, 29, 108, 2, 113,
                                   155, 37, 43, 230, 234, 120, 1, 188, 249, 63,
                                   201, 20, 0, 0, 0, 26, 116, 156, 164, 156,
                                   217, 103, 2, 227, 213, 145, 9, 99, 227, 156,
                                   25, 168, 247, 129, 106, 20, 0, 0, 0, 25, 33,
                                   214, 190, 188, 35, 9, 103, 84, 160, 24, 85,
                                   115, 241, 126, 6, 87, 100, 214, 95, 20, 0, 0,
                                   0, 25, 234, 66, 173, 59, 173, 106, 34, 104,
                                   235, 20, 3, 218, 123, 253, 65, 159, 146, 13,
                                   89, 20, 0, 0, 0, 25, 234, 66, 180, 188, 141,
                                   155, 60, 246, 222, 132, 29, 94, 243, 52, 113,
                                   40, 107, 68, 231, 20, 0, 0, 0, 29, 220, 102,
                                   171, 237, 214, 223, 178, 52, 213, 245, 70,
                                   103, 32, 253, 124, 236, 116, 136, 242, 20, 0,
                                   0, 0, 25, 48, 220, 174, 7, 157, 16, 53, 215,
                                   14, 15, 250, 214, 208, 169, 255, 8, 252, 125,
                                   183, 20, 0, 0, 0, 30, 189, 132, 167, 28, 74,
                                   170, 31, 78, 125, 108, 124, 130, 99, 57, 213,
                                   195, 112, 97, 39, 20, 0, 0, 0, 26, 104, 194,
                                   170, 239, 33, 103, 64, 222, 72, 211, 252,
                                   128, 224, 95, 144, 191, 207, 226, 223, 20, 0,
                                   0, 0, 26, 127, 46, 153, 133, 135, 25, 70,
                                   164, 150, 132, 175, 141, 209, 98, 20, 46, 53,
                                   124, 32, 20, 0, 0, 0, 26, 112, 174, 149, 215,
                                   199, 2, 42, 238, 85, 0, 31, 11, 98, 94, 30,
                                   61, 53, 34, 42, 20, 0, 0, 0, 30, 212, 102,
                                   151, 163, 128, 237, 89, 30, 63, 116, 2, 218,
                                   114, 69, 139, 33, 38, 252, 235, 20, 0, 0, 0,
                                   27, 181, 118, 133, 60, 224, 8, 159, 247, 108,
                                   175, 156, 191, 43, 241, 238, 140, 118, 43,
                                   91, 20, 0, 0, 0, 31, 161, 16, 145, 129, 130,
                                   45, 65, 179, 158, 141, 110, 209, 192, 106,
                                   18, 127, 145, 54, 150, 20, 0, 0, 0, 29, 216,
                                   166, 167, 228, 127, 224, 0, 230, 148, 87,
                                   157, 39, 128, 69, 239, 183, 147, 163, 37, 20,
                                   0, 0, 0, 26, 120, 174, 179, 9, 173, 71, 82,
                                   54, 241, 83, 193, 198, 200, 5, 213, 84, 101,
                                   163, 21, 20, 0, 0, 0, 26, 104, 194, 163, 220,
                                   215, 247, 145, 8, 240, 146, 115, 39, 44, 226,
                                   238, 178, 84, 42, 1, 20, 0, 0, 0, 24, 181,
                                   218, 186, 124, 45, 228, 60, 52, 16, 6, 129,
                                   78, 207, 3, 219, 29, 164, 93, 43, 20, 0, 0,
                                   0, 27, 173, 66, 168, 227, 137, 104, 62, 99,
                                   214, 132, 171, 162, 103, 92, 241, 21, 43,
                                   131, 213, 20, 0, 0, 0, 25, 34, 20, 172, 156,
                                   131, 200, 197, 62, 94, 139, 41, 97, 248, 120,
                                   212, 123, 152, 40, 224, 20, 0, 0, 0, 28, 222,
                                   102, 167, 186, 174, 17, 82, 52, 236, 175, 13,
                                   56, 234, 1, 193, 88, 213, 197, 226, 20, 0, 0,
                                   0, 25, 61, 148, 186, 92, 145, 40, 71, 45,
                                   240, 192, 44, 112, 254, 84, 18, 40, 53, 136,
                                   31, 20, 0, 0, 0, 25, 34, 52, 161, 169, 255,
                                   201, 6, 103, 237, 104, 28, 138, 96, 89, 146,
                                   188, 251, 94, 191, 20, 0, 0, 0, 29, 206, 34,
                                   170, 3, 166, 101, 82, 175, 80, 200, 29, 143,
                                   41, 2, 240, 88, 117, 92, 43, 20, 0, 0, 0, 25,
                                   41, 214, 167, 14, 253, 7, 129, 7, 82, 43,
                                   122, 115, 106, 68, 143, 240, 188, 157, 208,
                                   20, 0, 0, 0, 25, 34, 90, 168, 67, 172, 250,
                                   81, 126, 80, 143, 90, 39, 251, 192, 218, 204,
                                   120, 132, 112, 20, 0, 0, 0, 29, 204, 138,
                                   160, 251, 33, 47, 249, 182, 255, 140, 201,
                                   128, 199, 90, 214, 75, 148, 63, 246, 20, 0,
                                   0, 0, 25, 37, 164, 166, 3, 1, 32, 141, 131,
                                   207, 138, 133, 68, 73, 125, 109, 5, 163, 197,
                                   96, 20, 0, 0, 0, 31, 113, 174, 173, 126, 167,
                                   234, 66, 126, 69, 117, 229, 98, 113, 183,
                                   197, 162, 166, 128, 8, 20, 0, 0, 0, 31, 97,
                                   130, 188, 189, 125, 10, 197, 50, 108, 80, 47,
                                   94, 223, 78, 19, 181, 244, 220, 87, 20, 0, 0,
                                   0, 29, 201, 88, 163, 45, 165, 104, 4, 56,
                                   202, 202, 163, 78, 201, 120, 7, 128, 248,
                                   188, 71, 20, 0, 0, 0, 31, 119, 174, 188, 59,
                                   197, 43, 126, 109, 224, 148, 39, 46, 235, 91,
                                   112, 238, 52, 231, 137, 20, 0, 0, 0, 28, 48,
                                   22, 205, 23, 91, 246, 193, 134, 151, 96, 3,
                                   14, 232, 130, 26, 125, 187, 25, 76, 20, 0, 0,
                                   0, 28, 40, 22, 204, 251, 33, 11, 73, 206, 0,
                                   15, 169, 2, 74, 77, 249, 136, 171, 120, 236,
                                   20, 0, 0, 0, 28, 48, 122, 214, 156, 156, 24,
                                   81, 177, 191, 96, 63, 37, 119, 203, 212, 231,
                                   149, 189, 64, 20, 0, 0, 0, 28, 57, 250, 217,
                                   15, 221, 9, 136, 39, 30, 36, 195, 46, 235,
                                   22, 16, 109, 54, 48, 39, 20, 0, 0, 0, 28, 41,
                                   250, 236, 178, 45, 104, 70, 75, 235, 5, 43,
                                   44, 245, 135, 243, 148, 128, 1, 234, 20, 0,
                                   0, 0, 28, 41, 250, 236, 186, 216, 10, 90, 68,
                                   223, 226, 171, 35, 128, 0, 1, 151, 120, 163,
                                   24, 20, 0, 0, 0, 29, 223, 146, 236, 182, 146,
                                   224, 201, 245, 193, 104, 31, 33, 254, 241,
                                   44, 235, 199, 157, 103, 20, 0, 0, 0, 24, 48,
                                   58, 234, 195, 158, 16, 254, 95, 255, 255,
                                   254, 233, 63, 250, 165, 152, 232, 13, 241,
                                   20, 0, 0, 0, 24, 48, 118, 236, 197, 174, 48,
                                   92, 94, 17, 226, 156, 151, 11, 53, 210, 147,
                                   131, 190, 64, 20, 0, 0, 0, 25, 33, 148, 236,
                                   69, 65, 234, 106, 225, 150, 217, 63, 126, 8,
                                   49, 193, 8, 255, 92, 135, 20, 0, 0, 0, 29,
                                   206, 98, 244, 145, 121, 254, 120, 194, 84,
                                   245, 102, 239, 0, 94, 18, 149, 191, 79, 217,
                                   20, 0, 0, 0, 29, 220, 226, 241, 167, 37, 169,
                                   90, 183, 210, 189, 87, 247, 55, 98, 44, 206,
                                   83, 201, 7, 20, 0, 0, 0, 28, 45, 24, 246, 14,
                                   219, 215, 137, 196, 236, 242, 122, 251, 124,
                                   159, 239, 245, 180, 219, 216, 20, 0, 0, 0,
                                   28, 40, 22, 253, 196, 192, 96, 246, 228, 125,
                                   151, 164, 239, 51, 141, 33, 131, 149, 242,
                                   181, 20, 0, 0, 0, 31, 212, 32, 248, 9, 192,
                                   126, 196, 227, 140, 117, 46, 121, 45, 194,
                                   151, 1, 177, 93, 120, 20, 0, 0, 0, 31, 195,
                                   32, 255, 188, 97, 34, 103, 238, 18, 150, 67,
                                   126, 231, 175, 212, 128, 124, 159, 254, 20,
                                   0, 0, 0, 28, 40, 24, 243, 220, 224, 57, 57,
                                   254, 21, 51, 158, 35, 72, 66, 15, 135, 133,
                                   74, 21, 20, 0, 0, 0, 28, 36, 116, 254, 70,
                                   159, 255, 130, 14, 127, 250, 215, 143, 81,
                                   249, 255, 199, 31, 171, 219, 20, 0, 0, 0, 28,
                                   56, 116, 254, 37, 86, 53, 151, 5, 121, 41,
                                   243, 10, 111, 92, 43, 194, 120, 127, 245, 20,
                                   0, 0, 0, 28, 45, 24, 252, 35, 190, 176, 150,
                                   38, 226, 111, 51, 18, 81, 207, 163, 76, 227,
                                   86, 176, 20, 0, 0, 0, 29, 220, 18, 238, 91,
                                   128, 229, 50, 24, 219, 37, 86, 149, 237, 44,
                                   253, 139, 152, 47, 106, 20, 0, 0, 0, 29, 215,
                                   227, 46, 59, 104, 252, 189, 10, 90, 249, 91,
                                   157, 228, 173, 101, 203, 111, 171, 29, 20, 0,
                                   0, 0, 29, 192, 134, 246, 110, 25, 41, 66, 17,
                                   142, 120, 92, 239, 56, 195, 192, 83, 21, 191,
                                   200, 20, 0, 0, 0, 29, 223, 162, 252, 92, 210,
                                   169, 135, 25, 237, 15, 94, 43, 107, 241, 237,
                                   77, 21, 68, 245, 20, 0, 0, 0, 29, 199, 162,
                                   227, 252, 223, 207, 191, 27, 225, 99, 63,
                                   147, 249, 88, 77, 205, 251, 214, 82, 20, 0,
                                   0, 0, 26, 113, 216, 238, 14, 251, 0, 231, 31,
                                   30, 245, 179, 23, 0, 186, 223, 192, 255, 96,
                                   195, 20, 0, 0, 0, 29, 206, 34, 220, 92, 219,
                                   204, 121, 230, 252, 107, 95, 131, 203, 192,
                                   20, 255, 156, 36, 172, 20, 0, 0, 0, 29, 215,
                                   134, 212, 105, 133, 171, 92, 231, 230, 140,
                                   99, 137, 99, 181, 211, 143, 137, 29, 41, 20,
                                   0, 0, 0, 29, 207, 134, 204, 77, 211, 232,
                                   179, 222, 121, 245, 92, 161, 75, 83, 206,
                                   136, 107, 159, 255, 20, 0, 0, 0, 29, 207,
                                   230, 204, 99, 42, 170, 246, 30, 86, 175, 157,
                                   115, 231, 249, 239, 135, 152, 245, 112, 20,
                                   0, 0, 0, 27, 201, 118, 228, 92, 89, 104, 66,
                                   36, 167, 86, 214, 129, 241, 169, 39, 139,
                                   133, 63, 200, 20, 0, 0, 0, 26, 109, 4, 228,
                                   156, 35, 9, 44, 22, 211, 116, 174, 129, 194,
                                   91, 138, 137, 171, 18, 180, 20, 0, 0, 0, 27,
                                   205, 118, 216, 169, 198, 180, 255, 51, 254,
                                   162, 123, 185, 191, 43, 203, 215, 121, 46,
                                   39, 20, 0, 0, 0, 27, 205, 102, 209, 183, 194,
                                   31, 173, 248, 251, 3, 94, 50, 117, 240, 179,
                                   144, 105, 180, 40, 20, 0, 0, 0, 31, 181, 4,
                                   193, 199, 156, 62, 133, 150, 237, 117, 252,
                                   220, 92, 97, 235, 3, 195, 195, 248, 20, 0, 0,
                                   0, 31, 173, 228, 200, 56, 40, 18, 2, 91, 95,
                                   130, 190, 228, 37, 182, 16, 233, 48, 51, 150,
                                   20, 0, 0, 0, 28, 5, 54, 239, 110, 71, 5, 52,
                                   255, 162, 62, 45, 162, 181, 253, 175, 91,
                                   150, 90, 252, 20, 0, 0, 0, 31, 168, 164, 238,
                                   109, 160, 152, 129, 198, 142, 6, 225, 67,
                                   251, 153, 206, 102, 44, 35, 167, 20, 0, 0, 0,
                                   31, 177, 220, 250, 205, 54, 166, 58, 231,
                                   149, 183, 86, 45, 239, 95, 13, 2, 223, 157,
                                   98, 20, 0, 0, 0, 31, 168, 228, 234, 156, 33,
                                   30, 187, 3, 68, 56, 77, 206, 105, 31, 159,
                                   116, 40, 193, 42, 20, 0, 0, 0, 31, 181, 56,
                                   231, 188, 105, 164, 194, 223, 218, 249, 54,
                                   127, 44, 66, 38, 67, 217, 48, 231, 20, 0, 0,
                                   0, 31, 168, 164, 227, 124, 144, 135, 179, 59,
                                   200, 252, 23, 14, 211, 222, 41, 215, 132,
                                   165, 126, 20, 0, 0, 0, 31, 165, 66, 213, 207,
                                   157, 199, 135, 237, 185, 202, 200, 28, 107,
                                   2, 21, 56, 115, 73, 235, 20, 0, 0, 0, 31,
                                   176, 16, 215, 45, 151, 203, 183, 239, 126,
                                   175, 87, 159, 48, 70, 23, 55, 181, 220, 169,
                                   20, 0, 0, 0, 31, 176, 52, 215, 41, 252, 69,
                                   205, 187, 217, 91, 150, 19, 135, 176, 33,
                                   221, 194, 171, 215, 20, 0, 0, 0, 31, 165, 36,
                                   197, 167, 3, 224, 70, 93, 129, 14, 41, 147,
                                   191, 243, 214, 75, 209, 151, 205, 20, 0, 0,
                                   0, 31, 163, 52, 204, 45, 207, 80, 89, 255,
                                   63, 244, 34, 87, 9, 106, 17, 97, 205, 192,
                                   159, 20, 0, 0, 0, 31, 161, 52, 184, 57, 120,
                                   255, 2, 169, 96, 171, 107, 115, 144, 134, 64,
                                   89, 99, 195, 42, 20, 0, 0, 0, 31, 181, 52,
                                   173, 41, 165, 56, 17, 230, 212, 160, 155,
                                   251, 177, 200, 0, 115, 152, 49, 240, 20, 0,
                                   0, 0, 31, 176, 150, 190, 220, 1, 73, 254, 54,
                                   146, 144, 96, 8, 39, 2, 81, 192, 247, 183,
                                   113, 20, 0, 0, 0, 30, 204, 10, 228, 156, 47,
                                   201, 89, 186, 84, 201, 70, 60, 56, 7, 216,
                                   39, 217, 21, 10, 20, 0, 0, 0, 30, 160, 240,
                                   227, 241, 243, 12, 186, 205, 82, 171, 172,
                                   251, 106, 66, 149, 119, 143, 161, 12, 20, 0,
                                   0, 0, 28, 204, 14, 229, 199, 93, 31, 101, 51,
                                   228, 1, 70, 35, 77, 138, 162, 192, 230, 66,
                                   70, 20, 0, 0, 0, 30, 184, 144, 211, 233, 173,
                                   93, 149, 59, 195, 52, 170, 223, 54, 88, 156,
                                   220, 107, 54, 219, 20, 0, 0, 0, 27, 177, 22,
                                   221, 9, 162, 235, 64, 209, 240, 179, 255,
                                   119, 21, 71, 209, 174, 176, 174, 203, 20, 0,
                                   0, 0, 28, 217, 124, 210, 105, 1, 237, 158,
                                   183, 135, 9, 128, 199, 47, 252, 146, 173,
                                   248, 42, 68, 20, 0, 0, 0, 28, 203, 124, 194,
                                   28, 173, 101, 67, 141, 250, 148, 22, 203,
                                   107, 81, 207, 133, 168, 129, 103, 20, 0, 0,
                                   0, 27, 175, 138, 218, 143, 71, 8, 82, 181,
                                   229, 25, 199, 70, 237, 9, 236, 145, 55, 201,
                                   40, 20, 0, 0, 0, 31, 166, 102, 209, 184, 33,
                                   139, 5, 222, 116, 18, 231, 150, 45, 193, 199,
                                   153, 180, 78, 4, 20, 0, 0, 0, 31, 175, 92,
                                   212, 77, 120, 173, 193, 118, 204, 3, 253, 15,
                                   43, 50, 21, 249, 188, 63, 203, 20, 0, 0, 0,
                                   29, 128, 238, 231, 173, 72, 115, 66, 165,
                                   145, 133, 125, 84, 232, 69, 39, 213, 212,
                                   131, 50, 20, 0, 0, 0, 29, 154, 252, 238, 119,
                                   155, 139, 122, 148, 134, 39, 139, 98, 167,
                                   136, 96, 233, 178, 188, 219, 20, 0, 0, 0, 26,
                                   3, 198, 231, 51, 226, 50, 211, 159, 193, 96,
                                   21, 126, 116, 227, 218, 118, 243, 213, 178,
                                   20, 0, 0, 0, 29, 154, 214, 248, 225, 161,
                                   171, 76, 198, 240, 171, 110, 220, 240, 178,
                                   165, 149, 48, 170, 13, 20, 0, 0, 0, 29, 154,
                                   198, 235, 203, 144, 83, 229, 208, 247, 59,
                                   18, 3, 245, 48, 85, 103, 51, 55, 211, 20, 0,
                                   0, 0, 29, 149, 182, 237, 46, 168, 169, 67,
                                   112, 212, 153, 8, 139, 113, 16, 166, 139, 51,
                                   255, 96, 20, 0, 0, 0, 29, 149, 252, 239, 119,
                                   194, 76, 49, 144, 252, 185, 53, 251, 209,
                                   198, 153, 101, 49, 155, 109, 20, 0, 0, 0, 29,
                                   149, 252, 232, 237, 154, 167, 56, 206, 12,
                                   47, 193, 69, 225, 0, 51, 169, 164, 2, 80, 20,
                                   0, 0, 0, 29, 153, 198, 231, 55, 66, 236, 147,
                                   36, 145, 13, 214, 163, 177, 9, 189, 61, 181,
                                   181, 209, 20, 0, 0, 0, 29, 133, 198, 228,
                                   121, 125, 151, 157, 183, 13, 128, 132, 183,
                                   33, 220, 194, 127, 139, 67, 203, 20, 0, 0, 0,
                                   29, 133, 114, 210, 60, 173, 230, 195, 137,
                                   205, 225, 67, 23, 35, 74, 240, 87, 147, 42,
                                   80, 20, 0, 0, 0, 31, 181, 220, 228, 156, 104,
                                   209, 100, 99, 216, 136, 153, 226, 226, 22,
                                   205, 253, 166, 32, 171, 20, 0, 0, 0, 31, 181,
                                   220, 236, 109, 31, 200, 4, 215, 66, 14, 180,
                                   79, 56, 48, 1, 175, 55, 225, 92, 20, 0, 0, 0,
                                   25, 181, 229, 22, 248, 7, 254, 114, 70, 149,
                                   15, 242, 100, 190, 100, 209, 113, 184, 33,
                                   64, 20, 0, 0, 0, 31, 190, 215, 20, 119, 2,
                                   149, 108, 71, 138, 172, 33, 63, 7, 4, 144,
                                   43, 54, 224, 140, 20, 0, 0, 0, 25, 162, 117,
                                   25, 43, 175, 2, 196, 149, 141, 132, 253, 129,
                                   215, 98, 83, 31, 194, 211, 191, 20, 0, 0, 0,
                                   31, 184, 243, 13, 188, 72, 231, 223, 4, 253,
                                   63, 130, 125, 220, 106, 190, 128, 47, 140,
                                   21, 20, 0, 0, 0, 31, 184, 130, 249, 179, 194,
                                   222, 23, 7, 237, 15, 62, 129, 239, 107, 63,
                                   55, 148, 27, 116, 20, 0, 0, 0, 31, 184, 221,
                                   2, 220, 252, 132, 165, 148, 176, 139, 106,
                                   186, 75, 36, 150, 233, 183, 234, 10, 20, 0,
                                   0, 0, 27, 181, 253, 9, 107, 73, 172, 4, 222,
                                   64, 172, 22, 207, 8, 56, 26, 121, 32, 1, 189,
                                   20, 0, 0, 0, 27, 177, 234, 247, 185, 181,
                                   241, 78, 203, 236, 132, 167, 244, 105, 194,
                                   223, 97, 214, 28, 232, 20, 0, 0, 0, 27, 161,
                                   234, 254, 110, 163, 21, 62, 14, 123, 15, 128,
                                   8, 169, 127, 254, 71, 213, 16, 144, 20, 0, 0,
                                   0, 27, 181, 218, 253, 134, 156, 6, 82, 22,
                                   206, 18, 202, 34, 112, 252, 80, 109, 187,
                                   166, 220, 20, 0, 0, 0, 27, 184, 170, 254,
                                   233, 208, 115, 54, 39, 87, 59, 119, 99, 222,
                                   76, 191, 41, 195, 139, 210, 20, 0, 0, 0, 27,
                                   161, 138, 228, 188, 169, 29, 57, 244, 192,
                                   150, 199, 242, 106, 84, 7, 15, 218, 179, 146,
                                   20, 0, 0, 0, 27, 165, 102, 230, 56, 170, 195,
                                   177, 206, 64, 207, 44, 231, 43, 82, 128, 13,
                                   53, 235, 246, 20, 0, 0, 0, 29, 202, 226, 231,
                                   94, 151, 2, 54, 40, 218, 148, 149, 238, 234,
                                   181, 14, 152, 101, 248, 16, 20, 0, 0, 0, 29,
                                   200, 98, 232, 14, 77, 23, 82, 148, 233, 36,
                                   198, 183, 53, 253, 148, 178, 63, 2, 235, 20,
                                   0, 0, 0, 26, 113, 194, 213, 124, 169, 8, 56,
                                   84, 196, 53, 61, 162, 108, 147, 72, 8, 191,
                                   130, 234, 20, 0, 0, 0, 26, 121, 194, 212,
                                   112, 168, 25, 0, 88, 208, 131, 131, 42, 105,
                                   106, 205, 182, 60, 95, 72, 20, 0, 0, 0, 26,
                                   105, 144, 211, 92, 166, 80, 111, 45, 210,
                                   132, 97, 66, 124, 200, 233, 179, 35, 226,
                                   202, 20, 0, 0, 0, 29, 219, 98, 215, 169, 150,
                                   202, 73, 125, 214, 118, 197, 119, 45, 86, 52,
                                   30, 53, 84, 11, 20, 0, 0, 0, 29, 200, 90,
                                   213, 50, 174, 1, 251, 222, 66, 150, 87, 159,
                                   45, 94, 23, 86, 125, 90, 138, 20, 0, 0, 0,
                                   26, 125, 48, 212, 238, 175, 82, 91, 212, 247,
                                   212, 76, 32, 160, 202, 143, 162, 32, 44, 41,
                                   20, 0, 0, 0, 26, 125, 20, 219, 252, 190, 210,
                                   47, 115, 225, 248, 60, 16, 240, 74, 255, 123,
                                   119, 164, 112, 20, 0, 0, 0, 29, 195, 146,
                                   222, 252, 171, 25, 43, 145, 240, 177, 167,
                                   50, 79, 80, 149, 17, 203, 76, 87, 20, 0, 0,
                                   0, 29, 204, 90, 217, 99, 1, 233, 212, 17,
                                   230, 175, 171, 217, 43, 68, 19, 241, 213,
                                   226, 15, 20, 0, 0, 0, 26, 109, 48, 215, 5,
                                   199, 11, 37, 135, 107, 7, 146, 23, 33, 153,
                                   255, 205, 249, 226, 170, 20, 0, 0, 0, 29,
                                   216, 66, 199, 15, 254, 231, 108, 174, 125,
                                   120, 90, 72, 234, 67, 240, 65, 32, 126, 246,
                                   20, 0, 0, 0, 29, 206, 106, 201, 3, 201, 180,
                                   68, 206, 67, 129, 127, 102, 249, 186, 198, 5,
                                   57, 173, 118, 20, 0, 0, 0, 26, 104, 130, 187,
                                   71, 157, 72, 161, 22, 254, 218, 129, 98, 81,
                                   18, 222, 230, 40, 96, 8, 20, 0, 0, 0, 29,
                                   222, 98, 196, 45, 38, 231, 191, 141, 209,
                                   239, 161, 215, 56, 196, 22, 123, 131, 233,
                                   48, 20, 0, 0, 0, 26, 120, 224, 189, 62, 229,
                                   86, 75, 110, 76, 5, 164, 163, 73, 35, 82,
                                   161, 255, 190, 42, 20, 0, 0, 0, 29, 221, 226,
                                   179, 227, 169, 138, 25, 206, 19, 240, 44,
                                   120, 233, 227, 208, 131, 159, 163, 194, 20,
                                   0, 0, 0, 29, 194, 98, 164, 99, 193, 73, 208,
                                   225, 81, 234, 131, 63, 45, 254, 31, 61, 59,
                                   106, 32, 20, 0, 0, 0, 29, 206, 6, 166, 19,
                                   89, 185, 142, 191, 70, 148, 175, 81, 233, 90,
                                   214, 117, 191, 192, 95, 20, 0, 0, 0, 31, 165,
                                   232, 174, 41, 162, 86, 83, 164, 214, 186,
                                   191, 107, 234, 136, 176, 157, 186, 200, 80,
                                   20, 0, 0, 0, 29, 221, 226, 188, 123, 175,
                                   175, 133, 247, 129, 228, 138, 55, 54, 169,
                                   113, 211, 240, 68, 182, 20, 0, 0, 0, 29, 202,
                                   146, 205, 112, 213, 105, 63, 120, 106, 138,
                                   127, 22, 231, 46, 32, 173, 41, 1, 235, 20, 0,
                                   0, 0, 29, 221, 18, 203, 17, 121, 54, 80, 121,
                                   91, 159, 130, 183, 32, 7, 213, 39, 194, 248,
                                   255, 20, 0, 0, 0, 28, 32, 22, 203, 209, 95,
                                   201, 172, 180, 243, 102, 174, 107, 112, 132,
                                   49, 63, 154, 253, 31, 20, 0, 0, 0, 29, 196,
                                   18, 222, 252, 159, 117, 42, 161, 241, 16,
                                   202, 147, 81, 126, 99, 147, 203, 62, 107, 20,
                                   0, 0, 0, 28, 44, 22, 205, 91, 177, 99, 49, 3,
                                   237, 95, 170, 6, 229, 89, 206, 152, 113, 161,
                                   129, 20, 0, 0, 0, 28, 34, 106, 219, 156, 156,
                                   10, 87, 164, 214, 144, 89, 127, 31, 143, 192,
                                   185, 48, 65, 245, 20, 0, 0, 0, 28, 44, 24,
                                   226, 205, 71, 41, 77, 222, 30, 116, 68, 83,
                                   9, 74, 215, 2, 99, 254, 7, 20, 0, 0, 0, 28,
                                   44, 110, 211, 251, 248, 236, 21, 119, 224,
                                   145, 29, 249, 111, 7, 244, 90, 98, 171, 32,
                                   20, 0, 0, 0, 28, 42, 24, 237, 242, 152, 163,
                                   40, 176, 32, 150, 169, 224, 248, 75, 245,
                                   188, 244, 175, 9, 20, 0, 0, 0, 27, 98, 128,
                                   237, 210, 139, 32, 179, 98, 162, 220, 219,
                                   145, 100, 219, 36, 171, 104, 166, 210, 20, 0,
                                   0, 0, 25, 35, 148, 219, 167, 170, 75, 1, 62,
                                   75, 21, 231, 169, 209, 43, 48, 123, 115, 161,
                                   24, 20, 0, 0, 0, 28, 59, 50, 236, 252, 129,
                                   84, 95, 77, 219, 9, 70, 74, 33, 98, 147, 162,
                                   48, 2, 245, 20, 0, 0, 0, 27, 114, 144, 238,
                                   43, 193, 56, 187, 110, 98, 165, 198, 151, 7,
                                   123, 34, 127, 127, 157, 82, 20, 0, 0, 0, 31,
                                   211, 46, 250, 219, 3, 0, 135, 190, 108, 180,
                                   180, 51, 209, 145, 226, 236, 229, 55, 137,
                                   20, 0, 0, 0, 31, 118, 170, 250, 174, 42, 208,
                                   68, 129, 147, 123, 131, 26, 113, 14, 9, 11,
                                   111, 161, 233, 20, 0, 0, 0, 27, 114, 206,
                                   238, 19, 219, 178, 143, 2, 225, 107, 120, 94,
                                   201, 144, 17, 164, 117, 223, 82, 20, 0, 0, 0,
                                   25, 44, 40, 224, 162, 159, 255, 255, 19, 227,
                                   251, 28, 231, 41, 90, 80, 219, 144, 173, 243,
                                   20, 0, 0, 0, 26, 127, 82, 233, 62, 152, 165,
                                   126, 65, 220, 37, 183, 15, 22, 2, 21, 249,
                                   57, 235, 100, 20, 0, 0, 0, 25, 62, 52, 234,
                                   231, 37, 47, 248, 151, 254, 136, 228, 87,
                                   136, 157, 52, 251, 200, 64, 232, 20, 0, 0, 0,
                                   24, 122, 186, 233, 45, 104, 211, 126, 46, 17,
                                   128, 88, 235, 81, 178, 222, 163, 152, 81,
                                   104, 20, 0, 0, 0, 26, 126, 164, 237, 60, 27,
                                   212, 18, 196, 225, 159, 46, 122, 203, 0, 49,
                                   29, 47, 254, 76, 20, 0, 0, 0, 29, 137, 74,
                                   232, 16, 238, 136, 65, 227, 173, 85, 61, 72,
                                   192, 250, 161, 104, 120, 75, 231, 20, 0, 0,
                                   0, 29, 131, 124, 239, 193, 132, 165, 92, 7,
                                   53, 227, 144, 185, 192, 25, 144, 47, 4, 175,
                                   159, 20, 0, 0, 0, 30, 105, 180, 215, 215,
                                   174, 91, 232, 125, 255, 244, 29, 3, 188, 126,
                                   35, 185, 219, 199, 26, 20, 0, 0, 0, 29, 131,
                                   22, 222, 103, 145, 213, 11, 213, 215, 127,
                                   75, 106, 45, 64, 177, 94, 106, 155, 113, 20,
                                   0, 0, 0, 29, 131, 86, 238, 59, 51, 211, 66,
                                   190, 87, 41, 94, 234, 73, 53, 79, 221, 38,
                                   180, 208, 20, 0, 0, 0, 29, 155, 214, 218, 28,
                                   182, 69, 237, 14, 124, 83, 73, 190, 60, 239,
                                   4, 214, 252, 1, 191, 20, 0, 0, 0, 29, 149,
                                   214, 211, 174, 89, 166, 213, 132, 244, 146,
                                   79, 226, 95, 2, 40, 113, 188, 43, 83, 20, 0,
                                   0, 0, 29, 157, 86, 216, 205, 1, 41, 42, 125,
                                   144, 166, 224, 116, 246, 40, 159, 199, 37,
                                   205, 45, 20, 0, 0, 0, 29, 143, 110, 215, 239,
                                   32, 64, 7, 244, 196, 166, 92, 194, 75, 57, 5,
                                   140, 250, 53, 164, 20, 0, 0, 0, 30, 98, 78,
                                   197, 219, 190, 223, 56, 149, 242, 212, 41,
                                   192, 86, 218, 190, 117, 169, 65, 136, 20, 0,
                                   0, 0, 27, 164, 24, 237, 39, 33, 71, 64, 119,
                                   85, 101, 193, 201, 239, 107, 15, 155, 153,
                                   21, 60, 20, 0, 0, 0, 30, 127, 186, 209, 79,
                                   134, 214, 163, 66, 191, 18, 179, 239, 0, 154,
                                   16, 233, 187, 44, 87, 20, 0, 0, 0, 28, 100,
                                   248, 216, 199, 161, 69, 23, 173, 211, 251,
                                   126, 95, 40, 176, 126, 83, 151, 189, 73, 20,
                                   0, 0, 0, 24, 122, 152, 221, 241, 212, 254,
                                   125, 100, 237, 56, 167, 208, 241, 86, 82, 60,
                                   117, 62, 214, 20, 0, 0, 0, 24, 182, 22, 234,
                                   187, 98, 248, 64, 202, 94, 49, 96, 111, 136,
                                   57, 248, 39, 102, 21, 53, 20, 0, 0, 0, 24,
                                   166, 58, 237, 28, 221, 111, 87, 197, 170,
                                   117, 72, 102, 252, 69, 150, 38, 100, 34, 0,
                                   20, 0, 0, 0, 28, 124, 248, 217, 17, 152, 41,
                                   76, 184, 242, 118, 159, 39, 53, 198, 15, 75,
                                   216, 203, 205, 20, 0, 0, 0, 31, 100, 162,
                                   196, 201, 180, 75, 109, 207, 18, 35, 227,
                                   121, 237, 18, 173, 219, 117, 125, 106, 20, 0,
                                   0, 0, 24, 179, 186, 178, 105, 173, 47, 255,
                                   135, 109, 4, 38, 128, 224, 61, 172, 231, 117,
                                   217, 34, 20, 0, 0, 0, 28, 116, 248, 181, 241,
                                   189, 10, 103, 147, 254, 1, 32, 195, 112, 146,
                                   243, 243, 155, 10, 15, 20, 0, 0, 0, 28, 51,
                                   206, 200, 49, 52, 249, 81, 174, 85, 6, 158,
                                   127, 40, 80, 45, 139, 152, 167, 0, 20, 0, 0,
                                   0, 24, 179, 186, 181, 188, 215, 40, 82, 68,
                                   192, 12, 35, 201, 107, 16, 237, 24, 120, 228,
                                   255, 20, 0, 0, 0, 24, 118, 200, 196, 127, 88,
                                   254, 73, 3, 149, 245, 163, 232, 246, 143,
                                   214, 221, 160, 1, 10, 20, 0, 0, 0, 24, 118,
                                   144, 176, 196, 198, 52, 2, 205, 199, 112, 99,
                                   112, 224, 90, 128, 132, 165, 30, 33, 20, 0,
                                   0, 0, 24, 103, 144, 185, 163, 120, 53, 81,
                                   196, 194, 181, 235, 220, 240, 83, 65, 163,
                                   140, 253, 7, 20, 0, 0, 0, 26, 119, 96, 187,
                                   123, 203, 209, 67, 211, 208, 48, 2, 208, 201,
                                   76, 190, 100, 119, 136, 191, 20, 0, 0, 0, 28,
                                   127, 168, 186, 104, 253, 72, 253, 131, 227,
                                   108, 234, 64, 233, 59, 23, 140, 116, 214, 34,
                                   20, 0, 0, 0, 25, 44, 20, 190, 251, 177, 103,
                                   198, 49, 223, 120, 243, 55, 54, 74, 82, 104,
                                   118, 64, 245, 20, 0, 0, 0, 25, 34, 20, 184,
                                   101, 43, 234, 76, 148, 231, 80, 36, 87, 168,
                                   91, 33, 23, 124, 67, 254, 20, 0, 0, 0, 25,
                                   51, 148, 184, 155, 169, 137, 57, 194, 191,
                                   224, 25, 23, 45, 146, 49, 79, 144, 9, 17, 20,
                                   0, 0, 0, 25, 51, 180, 191, 205, 237, 95, 182,
                                   254, 87, 227, 164, 71, 16, 69, 127, 145, 52,
                                   84, 95, 20, 0, 0, 0, 25, 38, 148, 163, 5,
                                   198, 192, 110, 196, 192, 39, 156, 64, 175,
                                   90, 26, 223, 156, 84, 0, 20, 0, 0, 0, 25, 47,
                                   164, 178, 99, 159, 20, 186, 135, 249, 21, 32,
                                   112, 242, 80, 193, 173, 20, 144, 8, 20, 0, 0,
                                   0, 25, 51, 148, 186, 173, 38, 7, 140, 190,
                                   112, 171, 31, 110, 210, 92, 98, 213, 21, 31,
                                   15, 20, 0, 0, 0, 26, 118, 18, 182, 165, 129,
                                   106, 69, 161, 240, 217, 91, 51, 107, 42, 191,
                                   226, 245, 214, 231, 20, 0, 0, 0, 25, 62, 36,
                                   207, 103, 175, 8, 87, 169, 1, 92, 129, 129,
                                   209, 159, 240, 112, 107, 41, 248, 20, 0, 0,
                                   0, 25, 50, 86, 207, 30, 43, 202, 254, 118,
                                   148, 187, 9, 238, 203, 21, 206, 252, 103,
                                   163, 224, 20, 0, 0, 0, 26, 109, 194, 205,
                                   167, 37, 76, 87, 163, 148, 127, 135, 107,
                                   107, 90, 88, 87, 144, 181, 39, 20, 0, 0, 0,
                                   25, 62, 52, 197, 143, 157, 111, 193, 14, 126,
                                   129, 3, 241, 247, 82, 31, 58, 43, 3, 135, 20,
                                   0, 0, 0, 25, 45, 148, 197, 139, 172, 72, 105,
                                   244, 213, 127, 66, 207, 53, 105, 239, 227,
                                   116, 8, 106, 20, 0, 0, 0, 25, 45, 218, 192,
                                   237, 179, 255, 65, 49, 153, 133, 254, 128,
                                   224, 135, 161, 23, 140, 41, 109, 20, 0, 0, 0,
                                   25, 47, 86, 205, 6, 29, 41, 3, 100, 254, 223,
                                   92, 211, 104, 144, 11, 73, 160, 33, 232, 20,
                                   0, 0, 0, 27, 165, 250, 215, 123, 120, 225,
                                   127, 200, 89, 141, 212, 106, 107, 167, 112,
                                   190, 122, 167, 30, 20, 0, 0, 0, 25, 50, 214,
                                   201, 60, 165, 190, 76, 52, 252, 117, 136, 26,
                                   64, 178, 1, 255, 211, 42, 194, 20, 0, 0, 0,
                                   25, 45, 214, 200, 27, 141, 42, 86, 67, 252,
                                   188, 148, 30, 208, 76, 231, 113, 232, 3, 224,
                                   20, 0, 0, 0, 25, 34, 86, 188, 92, 255, 223,
                                   251, 184, 242, 11, 97, 208, 254, 44, 229,
                                   140, 228, 217, 7, 20, 0, 0, 0, 25, 34, 36,
                                   183, 28, 221, 75, 102, 190, 48, 47, 219, 47,
                                   52, 66, 85, 96, 251, 76, 246, 20, 0, 0, 0,
                                   27, 163, 24, 179, 237, 160, 58, 253, 135,
                                   206, 123, 128, 81, 232, 75, 255, 252, 239,
                                   145, 83, 20, 0, 0, 0, 26, 126, 194, 178, 30,
                                   68, 184, 135, 103, 66, 204, 44, 73, 207, 249,
                                   208, 105, 58, 113, 180, 20, 0, 0, 0, 28, 127,
                                   242, 191, 31, 95, 22, 69, 155, 210, 222, 218,
                                   209, 123, 35, 123, 69, 176, 154, 162, 20, 0,
                                   0, 0, 26, 104, 174, 183, 231, 250, 207, 34,
                                   139, 198, 37, 166, 111, 43, 183, 17, 212,
                                   253, 45, 147, 20, 0, 0, 0, 27, 180, 66, 188,
                                   28, 254, 13, 153, 150, 222, 188, 99, 76, 103,
                                   250, 22, 12, 251, 18, 203, 20, 0, 0, 0, 26,
                                   104, 174, 188, 133, 158, 87, 171, 67, 204,
                                   129, 242, 91, 109, 145, 111, 107, 117, 146,
                                   233, 20, 0, 0, 0, 26, 113, 194, 190, 19, 39,
                                   232, 79, 196, 199, 27, 134, 65, 120, 138, 0,
                                   227, 132, 199, 228, 20, 0, 0, 0, 26, 104,
                                   194, 191, 88, 217, 113, 12, 62, 77, 243, 160,
                                   208, 222, 57, 90, 134, 85, 125, 43, 20, 0, 0,
                                   0, 29, 220, 110, 182, 133, 45, 232, 18, 77,
                                   211, 83, 231, 203, 197, 107, 253, 245, 220,
                                   145, 10, 20, 0, 0, 0, 29, 219, 6, 190, 183,
                                   220, 231, 181, 20, 237, 245, 63, 182, 224,
                                   178, 112, 29, 51, 252, 0, 20, 0, 0, 0, 26,
                                   97, 16, 185, 209, 161, 24, 47, 19, 108, 150,
                                   156, 146, 75, 18, 31, 93, 219, 44, 75, 20, 0,
                                   0, 0, 25, 41, 182, 184, 76, 163, 245, 7, 15,
                                   79, 10, 214, 139, 119, 129, 236, 14, 36, 72,
                                   30, 20, 0, 0, 0, 25, 33, 182, 201, 220, 126,
                                   203, 89, 1, 209, 255, 129, 150, 11, 101, 164,
                                   201, 227, 205, 8, 20, 0, 0, 0, 28, 183, 168,
                                   191, 99, 226, 205, 194, 246, 193, 30, 54,
                                   180, 76, 138, 162, 208, 125, 77, 138, 20, 0,
                                   0, 0, 29, 220, 10, 186, 119, 0, 248, 49, 68,
                                   254, 163, 156, 106, 96, 226, 145, 173, 247,
                                   186, 231, 20, 0, 0, 0, 25, 33, 180, 199, 88,
                                   213, 81, 169, 52, 172, 247, 172, 167, 17,
                                   184, 21, 223, 144, 70, 216, 20, 0, 0, 0, 25,
                                   45, 182, 199, 165, 253, 103, 126, 102, 148,
                                   131, 168, 222, 55, 202, 47, 237, 161, 55, 8,
                                   20, 0, 0, 0, 30, 197, 34, 229, 233, 53, 111,
                                   71, 244, 153, 205, 13, 205, 56, 69, 97, 227,
                                   155, 10, 44, 20, 0, 0, 0, 30, 177, 144, 208,
                                   113, 159, 152, 59, 238, 14, 121, 98, 106,
                                   227, 89, 99, 171, 147, 120, 128, 20, 0, 0, 0,
                                   25, 160, 16, 238, 156, 188, 158, 200, 195,
                                   160, 113, 99, 214, 4, 107, 48, 65, 165, 128,
                                   34, 20, 0, 0, 0, 25, 32, 220, 219, 124, 152,
                                   41, 58, 45, 194, 131, 200, 99, 254, 216, 231,
                                   29, 213, 160, 252, 20, 0, 0, 0, 30, 168, 212,
                                   217, 26, 190, 181, 71, 52, 241, 141, 175,
                                   128, 234, 100, 213, 201, 43, 130, 197, 20, 0,
                                   0, 0, 29, 206, 6, 215, 92, 188, 153, 96, 151,
                                   85, 229, 19, 127, 39, 9, 106, 176, 230, 181,
                                   145, 20, 0, 0, 0, 28, 190, 168, 223, 253,
                                   161, 49, 75, 68, 142, 2, 44, 239, 34, 139,
                                   14, 172, 231, 169, 42, 20, 0, 0, 0, 28, 170,
                                   168, 220, 167, 2, 237, 38, 45, 208, 255, 39,
                                   11, 192, 30, 16, 112, 101, 68, 247, 20, 0, 0,
                                   0, 29, 207, 162, 211, 77, 75, 207, 101, 70,
                                   252, 134, 217, 94, 47, 18, 83, 24, 24, 133,
                                   89, 20, 0, 0, 0, 29, 220, 162, 202, 188, 11,
                                   231, 76, 143, 56, 175, 181, 81, 255, 253,
                                   127, 213, 48, 92, 113, 20, 0, 0, 0, 30, 168,
                                   244, 199, 9, 221, 116, 87, 56, 176, 216, 203,
                                   51, 136, 104, 241, 200, 111, 1, 96, 20, 0, 0,
                                   0, 25, 33, 252, 189, 202, 38, 40, 179, 203,
                                   226, 128, 197, 48, 236, 181, 86, 8, 84, 41,
                                   96, 20, 0, 0, 0, 29, 207, 190, 189, 60, 218,
                                   42, 65, 158, 127, 105, 37, 241, 226, 106, 16,
                                   77, 188, 37, 127, 20, 0, 0, 0, 29, 206, 62,
                                   180, 222, 219, 248, 154, 52, 214, 247, 252,
                                   63, 159, 106, 87, 212, 119, 228, 202, 20, 0,
                                   0, 0, 29, 219, 6, 160, 98, 192, 224, 231, 39,
                                   137, 80, 125, 143, 54, 181, 94, 241, 23, 130,
                                   209, 20, 0, 0, 0, 29, 206, 6, 191, 92, 160,
                                   234, 59, 191, 66, 249, 170, 183, 10, 178, 87,
                                   20, 233, 163, 8, 20, 0, 0, 0, 29, 207, 134,
                                   170, 45, 175, 232, 140, 177, 189, 244, 42,
                                   135, 44, 25, 113, 44, 31, 0, 11, 20, 0, 0, 0,
                                   29, 219, 38, 169, 143, 230, 212, 255, 161,
                                   148, 132, 75, 186, 127, 169, 236, 107, 123,
                                   172, 138, 20, 0, 0, 0, 29, 220, 98, 160, 162,
                                   161, 96, 196, 39, 238, 117, 83, 17, 248, 178,
                                   45, 181, 52, 164, 176, 20, 0, 0, 0, 26, 104,
                                   174, 189, 113, 241, 119, 106, 238, 73, 4, 96,
                                   247, 50, 81, 206, 189, 220, 187, 22, 20, 0,
                                   0, 0, 29, 221, 198, 205, 210, 175, 66, 111,
                                   28, 16, 2, 3, 255, 32, 125, 137, 211, 128,
                                   65, 49, 20, 0, 0, 0, 31, 161, 4, 200, 141,
                                   126, 3, 126, 110, 16, 250, 167, 87, 51, 228,
                                   216, 248, 96, 91, 254, 20, 0, 0, 0, 31, 161,
                                   16, 193, 194, 0, 136, 196, 222, 94, 136, 31,
                                   2, 17, 74, 75, 58, 60, 97, 130, 20, 0, 0, 0,
                                   27, 160, 142, 253, 227, 69, 68, 195, 140, 48,
                                   115, 226, 23, 48, 120, 0, 95, 52, 197, 55,
                                   20, 0, 0, 0, 27, 173, 78, 229, 199, 161, 137,
                                   202, 89, 190, 132, 166, 51, 200, 84, 64, 16,
                                   36, 88, 9, 20, 0, 0, 0, 27, 173, 118, 238,
                                   177, 195, 176, 221, 38, 231, 162, 104, 202,
                                   114, 192, 62, 227, 127, 165, 104, 20, 0, 0,
                                   0, 27, 172, 246, 233, 188, 157, 118, 87, 244,
                                   198, 5, 163, 91, 159, 247, 144, 243, 180,
                                   223, 10, 20, 0, 0, 0, 28, 181, 176, 213, 41,
                                   233, 43, 139, 84, 236, 186, 105, 206, 193,
                                   234, 4, 65, 182, 173, 73, 20, 0, 0, 0, 30,
                                   195, 102, 219, 137, 99, 231, 181, 86, 128,
                                   86, 0, 128, 241, 67, 252, 91, 135, 139, 255,
                                   20, 0, 0, 0, 24, 161, 150, 210, 220, 161, 96,
                                   152, 162, 128, 164, 20, 68, 96, 18, 144, 163,
                                   203, 25, 171, 20, 0, 0, 0, 24, 184, 246, 216,
                                   93, 197, 152, 74, 215, 144, 164, 129, 129,
                                   68, 69, 99, 211, 115, 251, 8, 20, 0, 0, 0,
                                   30, 208, 66, 222, 110, 49, 40, 143, 158, 101,
                                   235, 106, 186, 104, 19, 214, 252, 228, 33, 7,
                                   20, 0, 0, 0, 26, 120, 174, 196, 104, 46, 231,
                                   76, 206, 109, 109, 193, 211, 40, 233, 14,
                                   199, 223, 189, 31, 20, 0, 0, 0, 24, 161, 194,
                                   198, 195, 132, 197, 89, 52, 195, 245, 96,
                                   140, 64, 178, 113, 29, 53, 15, 107, 20, 0, 0,
                                   0, 26, 97, 204, 194, 252, 157, 233, 194, 126,
                                   213, 148, 172, 156, 72, 172, 144, 227, 196,
                                   128, 23, 20, 0, 0, 0, 26, 104, 196, 187, 195,
                                   161, 57, 197, 111, 173, 124, 90, 227, 229,
                                   106, 82, 234, 36, 226, 15, 20, 0, 0, 0, 27,
                                   193, 34, 188, 60, 88, 255, 215, 23, 214, 112,
                                   28, 210, 126, 135, 69, 212, 123, 89, 83, 20,
                                   0, 0, 0, 27, 193, 6, 166, 92, 224, 224, 105,
                                   78, 80, 150, 217, 139, 203, 169, 219, 166,
                                   37, 173, 224, 20, 0, 0, 0, 27, 172, 78, 146,
                                   28, 217, 2, 126, 126, 95, 196, 182, 31, 54,
                                   136, 126, 163, 128, 96, 63, 20, 0, 0, 0, 31,
                                   161, 4, 164, 59, 159, 12, 36, 62, 70, 15, 43,
                                   115, 233, 74, 98, 228, 117, 171, 39, 20, 0,
                                   0, 0, 27, 207, 102, 161, 195, 128, 162, 67,
                                   151, 108, 177, 46, 127, 41, 79, 20, 237, 11,
                                   45, 41, 20, 0, 0, 0, 27, 221, 38, 170, 14,
                                   157, 79, 33, 14, 84, 132, 129, 124, 235, 86,
                                   215, 40, 122, 61, 182, 20, 0, 0, 0, 27, 193,
                                   162, 164, 35, 161, 242, 254, 94, 76, 177,
                                   174, 242, 115, 127, 113, 84, 247, 230, 237,
                                   20, 0, 0, 0, 27, 205, 6, 164, 187, 227, 31,
                                   87, 231, 23, 15, 65, 224, 255, 124, 83, 217,
                                   37, 128, 28, 20, 0, 0, 0, 27, 193, 10, 173,
                                   124, 255, 18, 178, 25, 158, 90, 229, 215, 43,
                                   249, 75, 29, 155, 61, 12, 20, 0, 0, 0, 29,
                                   220, 30, 175, 16, 173, 127, 71, 139, 212,
                                   152, 177, 124, 209, 192, 20, 69, 184, 33, 89,
                                   20, 0, 0, 0, 29, 195, 230, 166, 60, 173, 56,
                                   193, 97, 237, 6, 212, 202, 98, 81, 255, 237,
                                   117, 81, 95, 20, 0, 0, 0, 29, 221, 134, 186,
                                   169, 31, 232, 154, 64, 255, 178, 239, 135,
                                   49, 66, 16, 36, 117, 100, 9, 20, 0, 0, 0, 29,
                                   220, 14, 190, 230, 62, 236, 180, 126, 43,
                                   150, 130, 164, 220, 27, 192, 166, 115, 217,
                                   175, 20, 0, 0, 0, 29, 219, 66, 189, 39, 217,
                                   72, 102, 39, 78, 193, 115, 55, 43, 157, 87,
                                   107, 120, 217, 233, 20, 0, 0, 0, 29, 220, 74,
                                   196, 197, 196, 41, 78, 127, 98, 84, 175, 243,
                                   80, 230, 43, 84, 195, 196, 11, 20, 0, 0, 0,
                                   29, 220, 82, 177, 147, 134, 106, 133, 38,
                                   209, 53, 219, 196, 113, 245, 159, 183, 149,
                                   193, 75, 20, 0, 0, 0, 29, 220, 66, 188, 7,
                                   191, 11, 80, 195, 254, 172, 67, 1, 237, 154,
                                   167, 4, 208, 30, 232, 20, 0, 0, 0, 30, 170,
                                   176, 185, 61, 168, 236, 85, 148, 247, 124,
                                   202, 59, 174, 31, 132, 62, 38, 158, 43, 20,
                                   0, 0, 0, 29, 198, 226, 183, 56, 29, 40, 249,
                                   23, 142, 0, 36, 235, 72, 60, 214, 209, 228,
                                   53, 48, 20, 0, 0, 0, 25, 59, 164, 174, 237,
                                   165, 149, 2, 163, 222, 164, 32, 179, 114,
                                   251, 111, 2, 117, 34, 167, 20, 0, 0, 0, 26,
                                   127, 46, 167, 141, 55, 241, 88, 209, 192, 84,
                                   160, 123, 98, 159, 209, 149, 228, 37, 106,
                                   20, 0, 0, 0, 26, 104, 206, 162, 237, 33, 23,
                                   105, 174, 84, 116, 139, 234, 233, 197, 143,
                                   191, 148, 156, 92, 20, 0, 0, 0, 26, 104, 174,
                                   163, 28, 159, 243, 167, 210, 208, 255, 89,
                                   14, 233, 194, 20, 169, 240, 108, 12, 20, 0,
                                   0, 0, 26, 104, 174, 168, 211, 173, 57, 32,
                                   117, 113, 121, 102, 79, 15, 4, 1, 253, 220,
                                   45, 240, 20, 0, 0, 0, 30, 170, 186, 169, 201,
                                   225, 176, 181, 131, 240, 87, 225, 146, 107,
                                   82, 47, 64, 101, 254, 192, 20, 0, 0, 0, 30,
                                   170, 212, 157, 49, 191, 15, 122, 206, 96, 5,
                                   167, 145, 234, 193, 160, 217, 54, 84, 224,
                                   20, 0, 0, 0, 31, 175, 66, 168, 253, 233, 8,
                                   249, 142, 84, 160, 1, 19, 107, 122, 47, 97,
                                   52, 88, 225, 20, 0, 0, 0, 31, 190, 66, 171,
                                   67, 191, 86, 19, 215, 192, 4, 167, 113, 248,
                                   106, 196, 249, 178, 105, 254, 20, 0, 0, 0,
                                   31, 175, 90, 167, 195, 129, 111, 83, 255,
                                   127, 92, 166, 193, 202, 93, 126, 237, 191,
                                   108, 17, 20, 0, 0, 0, 31, 189, 96, 169, 9,
                                   181, 10, 126, 61, 204, 143, 144, 212, 230,
                                   150, 203, 3, 218, 193, 230, 20, 0, 0, 0, 31,
                                   181, 148, 188, 252, 161, 24, 205, 211, 203,
                                   146, 30, 59, 132, 169, 217, 215, 148, 36, 11,
                                   20, 0, 0, 0, 28, 16, 70, 228, 197, 116, 110,
                                   175, 189, 154, 8, 209, 228, 191, 107, 27,
                                   182, 81, 226, 173, 20, 0, 0, 0, 31, 181, 228,
                                   230, 60, 137, 189, 21, 163, 152, 157, 33,
                                   203, 194, 131, 230, 129, 182, 96, 234, 20, 0,
                                   0, 0, 31, 186, 252, 231, 246, 159, 146, 211,
                                   230, 206, 125, 74, 99, 176, 31, 44, 225, 255,
                                   52, 75, 20, 0, 0, 0, 31, 173, 164, 238, 59,
                                   191, 15, 237, 150, 200, 182, 18, 119, 62,
                                   220, 212, 12, 169, 127, 15, 20, 0, 0, 0, 31,
                                   170, 252, 239, 174, 155, 109, 78, 222, 12,
                                   150, 7, 118, 47, 212, 235, 221, 229, 160,
                                   162, 20, 0, 0, 0, 31, 177, 148, 238, 183,
                                   175, 150, 7, 221, 213, 111, 158, 191, 40,
                                   170, 162, 153, 182, 214, 88, 20, 0, 0, 0, 31,
                                   177, 252, 247, 233, 61, 182, 165, 124, 251,
                                   4, 96, 168, 86, 215, 81, 135, 105, 237, 40,
                                   20, 0, 0, 0, 31, 168, 218, 243, 123, 4, 248,
                                   65, 72, 237, 165, 157, 186, 232, 93, 18, 254,
                                   182, 194, 63, 20, 0, 0, 0, 31, 175, 218, 235,
                                   28, 179, 18, 85, 215, 215, 113, 17, 162, 113,
                                   84, 23, 83, 152, 166, 71, 20, 0, 0, 0, 31,
                                   170, 148, 252, 177, 23, 208, 102, 48, 212,
                                   164, 88, 195, 107, 248, 9, 187, 154, 67, 249,
                                   20, 0, 0, 0, 31, 162, 66, 242, 188, 122, 213,
                                   197, 4, 228, 144, 82, 140, 70, 87, 177, 82,
                                   232, 175, 36, 20, 0, 0, 0, 31, 167, 230, 235,
                                   201, 161, 79, 106, 30, 0, 118, 130, 89, 224,
                                   128, 144, 48, 245, 62, 68, 20, 0, 0, 0, 31,
                                   172, 36, 235, 211, 196, 184, 41, 231, 39,
                                   224, 3, 178, 245, 47, 190, 85, 52, 106, 228,
                                   20, 0, 0, 0, 31, 162, 36, 229, 169, 255, 248,
                                   249, 177, 218, 179, 79, 162, 72, 192, 144,
                                   91, 132, 41, 167, 20, 0, 0, 0, 31, 170, 92,
                                   238, 60, 250, 39, 76, 182, 210, 93, 253, 114,
                                   127, 86, 47, 109, 229, 19, 226, 20, 0, 0, 0,
                                   31, 162, 20, 231, 185, 173, 253, 149, 196,
                                   198, 166, 158, 232, 218, 94, 12, 101, 167,
                                   192, 9, 20, 0, 0, 0, 27, 160, 124, 228, 203,
                                   226, 218, 53, 49, 129, 57, 38, 219, 202, 66,
                                   13, 243, 193, 72, 7, 20, 0, 0, 0, 31, 176,
                                   66, 228, 73, 108, 232, 79, 183, 125, 40, 51,
                                   217, 144, 70, 30, 129, 40, 157, 32, 20, 0, 0,
                                   0, 26, 117, 230, 232, 94, 22, 83, 125, 6,
                                   148, 116, 9, 231, 0, 29, 60, 112, 100, 214,
                                   199, 20, 0, 0, 0, 31, 176, 128, 246, 99, 33,
                                   234, 74, 180, 133, 83, 156, 87, 111, 20, 162,
                                   97, 180, 50, 216, 20, 0, 0, 0, 31, 168, 194,
                                   248, 167, 24, 229, 159, 147, 222, 143, 172,
                                   239, 41, 194, 26, 217, 184, 25, 248, 20, 0,
                                   0, 0, 31, 172, 194, 243, 105, 181, 107, 34,
                                   179, 240, 134, 123, 146, 96, 106, 12, 136,
                                   235, 252, 0, 20, 0, 0, 0, 31, 177, 40, 253,
                                   126, 169, 178, 251, 222, 64, 15, 46, 241,
                                   105, 123, 80, 209, 121, 41, 85, 20, 0, 0, 0,
                                   25, 165, 52, 252, 71, 69, 115, 93, 251, 253,
                                   116, 162, 255, 86, 123, 218, 241, 39, 128,
                                   11, 20, 0, 0, 0, 31, 168, 170, 252, 14, 53,
                                   105, 69, 132, 213, 227, 222, 249, 166, 38,
                                   153, 125, 104, 236, 42, 20, 0, 0, 0, 25, 176,
                                   26, 245, 175, 117, 244, 86, 11, 172, 87, 249,
                                   142, 241, 194, 13, 57, 255, 55, 125, 20, 0,
                                   0, 0, 31, 181, 18, 253, 109, 0, 15, 92, 19,
                                   76, 255, 97, 1, 159, 8, 193, 79, 58, 212,
                                   232, 20, 0, 0, 0, 28, 197, 102, 244, 156,
                                   169, 69, 18, 241, 210, 187, 167, 1, 234, 183,
                                   135, 127, 116, 61, 113, 20, 0, 0, 0, 28, 197,
                                   119, 11, 247, 181, 187, 150, 19, 148, 213,
                                   237, 95, 63, 124, 62, 185, 57, 192, 211, 20,
                                   0, 0, 0, 26, 112, 219, 9, 137, 35, 162, 68,
                                   193, 205, 152, 179, 207, 32, 60, 83, 83, 128,
                                   121, 10, 20, 0, 0, 0, 28, 192, 67, 3, 39,
                                   201, 170, 146, 142, 14, 183, 216, 222, 209,
                                   81, 209, 30, 95, 213, 31, 20, 0, 0, 0, 27,
                                   123, 165, 4, 252, 177, 150, 60, 88, 226, 104,
                                   137, 220, 127, 146, 223, 108, 55, 165, 54,
                                   20, 0, 0, 0, 31, 195, 99, 24, 60, 245, 45,
                                   188, 233, 82, 73, 149, 145, 80, 171, 247,
                                   203, 124, 62, 48, 20, 0, 0, 0, 27, 119, 177,
                                   14, 91, 253, 98, 86, 237, 86, 148, 198, 135,
                                   162, 42, 133, 81, 200, 216, 226, 20, 0, 0, 0,
                                   25, 57, 214, 254, 167, 193, 8, 146, 159, 110,
                                   90, 42, 215, 149, 134, 51, 185, 187, 43, 248,
                                   20, 0, 0, 0, 27, 119, 148, 245, 105, 43, 41,
                                   62, 126, 109, 89, 19, 175, 75, 59, 37, 89,
                                   58, 216, 35, 20, 0, 0, 0, 25, 32, 20, 241,
                                   133, 191, 9, 107, 220, 194, 73, 151, 183,
                                   166, 129, 212, 128, 249, 17, 167, 20, 0, 0,
                                   0, 27, 113, 148, 224, 34, 189, 64, 122, 156,
                                   81, 43, 196, 143, 182, 124, 131, 145, 179,
                                   85, 73, 20, 0, 0, 0, 27, 119, 128, 252, 188,
                                   124, 120, 2, 14, 16, 200, 173, 87, 41, 75,
                                   35, 179, 156, 181, 243, 20, 0, 0, 0, 25, 33,
                                   149, 24, 28, 65, 184, 122, 78, 79, 84, 50,
                                   35, 119, 151, 43, 189, 226, 53, 111, 20, 0,
                                   0, 0, 25, 33, 215, 0, 233, 96, 11, 78, 126,
                                   30, 114, 95, 205, 237, 124, 176, 245, 34, 45,
                                   87, 20, 0, 0, 0, 25, 33, 148, 245, 28, 173,
                                   86, 254, 78, 127, 117, 170, 223, 48, 226, 73,
                                   109, 189, 174, 190, 20, 0, 0, 0, 25, 33, 214,
                                   230, 228, 178, 25, 95, 93, 231, 232, 224, 4,
                                   106, 58, 208, 52, 14, 17, 53, 20, 0, 0, 0,
                                   29, 206, 10, 252, 173, 189, 248, 39, 93, 158,
                                   240, 28, 135, 191, 81, 149, 14, 34, 173, 178,
                                   20, 0, 0, 0, 24, 57, 246, 230, 120, 196, 240,
                                   254, 102, 207, 31, 161, 119, 138, 66, 143,
                                   58, 96, 90, 72, 20, 0, 0, 0, 25, 57, 218,
                                   220, 35, 226, 43, 60, 105, 226, 251, 224,
                                   126, 230, 90, 88, 75, 145, 61, 0, 20, 0, 0,
                                   0, 24, 59, 150, 225, 98, 128, 171, 251, 199,
                                   171, 2, 165, 37, 204, 130, 120, 93, 160, 53,
                                   9, 20, 0, 0, 0, 28, 211, 18, 219, 60, 9, 231,
                                   85, 222, 78, 152, 169, 23, 63, 143, 192, 145,
                                   54, 191, 11, 20, 0, 0, 0, 28, 211, 18, 239,
                                   251, 166, 214, 201, 87, 149, 251, 71, 194,
                                   40, 122, 94, 138, 37, 174, 31, 20, 0, 0, 0,
                                   28, 222, 122, 226, 123, 142, 202, 61, 147,
                                   83, 102, 31, 110, 232, 232, 1, 203, 117, 89,
                                   103, 20, 0, 0, 0, 28, 222, 98, 252, 124, 3,
                                   24, 255, 142, 94, 108, 1, 11, 81, 199, 22,
                                   21, 229, 125, 81, 20, 0, 0, 0, 27, 122, 146,
                                   224, 175, 198, 24, 150, 46, 30, 216, 63, 179,
                                   104, 81, 213, 123, 147, 200, 255, 20, 0, 0,
                                   0, 25, 39, 220, 251, 169, 0, 168, 29, 107,
                                   150, 165, 79, 241, 164, 126, 68, 183, 117,
                                   60, 19, 20, 0, 0, 0, 25, 54, 21, 5, 167, 88,
                                   255, 177, 230, 162, 162, 175, 207, 30, 70,
                                   15, 231, 152, 130, 91, 20, 0, 0, 0, 27, 161,
                                   63, 20, 3, 33, 130, 62, 227, 133, 228, 195,
                                   246, 250, 194, 165, 51, 152, 160, 0, 20, 0,
                                   0, 0, 30, 189, 145, 28, 144, 214, 40, 68, 34,
                                   170, 143, 207, 132, 88, 194, 255, 212, 47,
                                   158, 207, 20, 0, 0, 0, 27, 161, 63, 27, 73,
                                   33, 255, 254, 179, 127, 91, 115, 135, 86, 7,
                                   207, 160, 235, 181, 64, 20, 0, 0, 0, 25, 45,
                                   229, 11, 211, 226, 104, 3, 65, 194, 143, 1,
                                   247, 138, 182, 19, 0, 180, 40, 171, 20, 0, 0,
                                   0, 25, 34, 101, 0, 0, 173, 86, 2, 14, 84,
                                   126, 94, 136, 241, 40, 143, 69, 58, 255, 255,
                                   20, 0, 0, 0, 27, 189, 127, 2, 41, 90, 9, 46,
                                   254, 18, 181, 160, 203, 90, 26, 145, 125,
                                   214, 204, 239, 20, 0, 0, 0, 24, 170, 194,
                                   249, 109, 216, 2, 67, 84, 237, 101, 34, 1,
                                   106, 106, 58, 164, 107, 128, 106, 20, 0, 0,
                                   0, 27, 189, 108, 250, 235, 129, 120, 251,
                                   196, 193, 3, 157, 2, 73, 210, 173, 145, 40,
                                   0, 15, 20, 0, 0, 0, 24, 173, 230, 254, 198,
                                   154, 64, 249, 22, 128, 148, 24, 143, 28, 198,
                                   21, 48, 43, 217, 103, 20, 0, 0, 0, 24, 122,
                                   216, 232, 109, 94, 127, 68, 110, 91, 59, 161,
                                   168, 231, 142, 62, 223, 201, 61, 21, 20, 0,
                                   0, 0, 24, 189, 246, 250, 123, 128, 152, 70,
                                   103, 224, 123, 95, 7, 40, 254, 211, 127, 149,
                                   181, 8, 20, 0, 0, 0, 26, 100, 175, 7, 188,
                                   164, 184, 82, 214, 215, 96, 22, 171, 237,
                                   121, 99, 241, 219, 47, 144, 20, 0, 0, 0, 30,
                                   189, 133, 11, 91, 173, 16, 83, 199, 159, 137,
                                   114, 211, 33, 74, 113, 27, 127, 149, 179, 20,
                                   0, 0, 0, 27, 172, 203, 7, 238, 195, 30, 63,
                                   238, 81, 252, 70, 15, 0, 69, 171, 104, 192,
                                   219, 39, 20, 0, 0, 0, 25, 54, 125, 9, 135,
                                   173, 72, 62, 3, 232, 52, 254, 231, 43, 90,
                                   69, 161, 244, 243, 201, 20, 0, 0, 0, 25, 50,
                                   215, 9, 101, 62, 40, 188, 97, 229, 5, 175,
                                   169, 170, 183, 100, 8, 255, 174, 241, 20, 0,
                                   0, 0, 25, 55, 81, 6, 109, 189, 137, 64, 194,
                                   83, 120, 166, 1, 200, 133, 87, 196, 248, 70,
                                   112, 20, 0, 0, 0, 25, 55, 81, 4, 40, 200, 8,
                                   16, 160, 126, 149, 166, 233, 237, 74, 42,
                                   175, 20, 13, 69, 20, 0, 0, 0, 25, 63, 87, 12,
                                   228, 182, 15, 23, 135, 86, 85, 42, 112, 251,
                                   244, 139, 156, 211, 9, 148, 20, 0, 0, 0, 25,
                                   63, 81, 13, 27, 197, 50, 51, 142, 66, 184,
                                   55, 33, 247, 67, 241, 152, 240, 93, 112, 20,
                                   0, 0, 0, 25, 59, 85, 24, 4, 152, 54, 81, 67,
                                   0, 187, 61, 162, 67, 243, 236, 17, 11, 87,
                                   231, 20, 0, 0, 0, 25, 63, 53, 12, 165, 197,
                                   49, 215, 14, 87, 89, 48, 189, 225, 134, 32,
                                   163, 117, 131, 245, 20, 0, 0, 0, 25, 63, 21,
                                   0, 135, 174, 23, 194, 183, 19, 87, 190, 19,
                                   75, 138, 126, 101, 228, 89, 70, 20, 0, 0, 0,
                                   25, 63, 106, 248, 37, 152, 254, 74, 115, 216,
                                   164, 30, 114, 106, 138, 21, 164, 250, 182,
                                   117, 20, 0, 0, 0, 27, 110, 165, 7, 169, 37,
                                   5, 190, 57, 67, 68, 107, 38, 201, 248, 21,
                                   215, 131, 170, 233, 20, 0, 0, 0, 25, 55, 85,
                                   12, 136, 124, 9, 245, 230, 214, 12, 128, 210,
                                   17, 180, 80, 253, 188, 98, 35, 20, 0, 0, 0,
                                   24, 46, 116, 249, 199, 137, 249, 90, 142, 82,
                                   4, 197, 48, 248, 169, 217, 184, 118, 188,
                                   235, 20, 0, 0, 0, 25, 54, 218, 252, 61, 129,
                                   130, 249, 33, 209, 142, 90, 59, 168, 97, 219,
                                   143, 196, 48, 77, 20, 0, 0, 0, 25, 63, 90,
                                   246, 60, 1, 71, 65, 30, 76, 184, 167, 129,
                                   224, 78, 17, 139, 121, 137, 126, 20, 0, 0, 0,
                                   27, 118, 102, 252, 46, 164, 22, 194, 81, 128,
                                   244, 43, 11, 185, 180, 173, 137, 24, 178, 41,
                                   20, 0, 0, 0, 25, 63, 40, 255, 163, 21, 16,
                                   70, 51, 236, 248, 103, 138, 88, 2, 234, 111,
                                   175, 163, 29, 20, 0, 0, 0, 25, 62, 20, 233,
                                   37, 191, 118, 95, 38, 238, 158, 183, 17, 237,
                                   83, 87, 75, 159, 92, 244, 20, 0, 0, 0, 28,
                                   63, 202, 248, 92, 69, 114, 197, 247, 34, 101,
                                   75, 10, 31, 253, 103, 140, 171, 129, 8, 20,
                                   0, 0, 0, 25, 61, 20, 232, 3, 37, 106, 66, 97,
                                   218, 145, 170, 67, 102, 66, 212, 2, 116, 109,
                                   104, 20, 0, 0, 0, 25, 55, 166, 235, 156, 40,
                                   41, 109, 57, 64, 127, 219, 247, 22, 175, 206,
                                   180, 208, 165, 56, 20, 0, 0, 0, 25, 41, 148,
                                   228, 205, 173, 242, 255, 66, 120, 188, 0,
                                   113, 246, 249, 234, 192, 212, 41, 34, 20, 0,
                                   0, 0, 30, 161, 200, 230, 206, 161, 138, 162,
                                   81, 195, 255, 132, 63, 139, 0, 212, 95, 139,
                                   92, 18, 20, 0, 0, 0, 25, 59, 130, 220, 142,
                                   183, 201, 241, 211, 209, 41, 38, 21, 230, 20,
                                   205, 146, 19, 93, 10, 20, 0, 0, 0, 25, 41,
                                   156, 210, 254, 177, 47, 27, 50, 229, 144, 60,
                                   163, 118, 74, 63, 83, 153, 65, 39, 20, 0, 0,
                                   0, 25, 63, 220, 214, 197, 201, 173, 139, 71,
                                   79, 38, 62, 191, 45, 177, 192, 197, 229, 161,
                                   19, 20, 0, 0, 0, 25, 47, 208, 216, 9, 201, 6,
                                   89, 227, 218, 22, 137, 247, 18, 84, 129, 52,
                                   232, 157, 40, 20, 0, 0, 0, 25, 251, 142, 205,
                                   99, 137, 108, 86, 39, 237, 117, 223, 120,
                                   232, 194, 228, 115, 208, 157, 8, 20, 0, 0, 0,
                                   31, 177, 66, 217, 254, 47, 214, 61, 239, 207,
                                   89, 41, 199, 38, 176, 31, 107, 5, 41, 45, 20,
                                   0, 0, 0, 25, 63, 228, 204, 39, 158, 126, 242,
                                   126, 127, 255, 163, 92, 113, 76, 150, 120,
                                   191, 1, 41, 20, 0, 0, 0, 25, 33, 252, 204,
                                   15, 224, 9, 75, 241, 218, 151, 158, 24, 231,
                                   186, 235, 157, 126, 220, 7, 20, 0, 0, 0, 30,
                                   177, 186, 206, 228, 138, 168, 255, 30, 213,
                                   184, 174, 171, 235, 70, 240, 137, 212, 54, 8,
                                   20, 0, 0, 0, 27, 106, 194, 199, 237, 60, 175,
                                   103, 152, 83, 3, 227, 160, 234, 255, 254,
                                   232, 123, 92, 64, 20, 0, 0, 0, 25, 33, 148,
                                   220, 211, 40, 166, 174, 108, 127, 236, 227,
                                   151, 54, 224, 61, 131, 116, 47, 202, 20, 0,
                                   0, 0, 28, 197, 98, 248, 238, 125, 73, 12,
                                   255, 23, 5, 171, 45, 210, 252, 127, 56, 150,
                                   14, 49, 20, 0, 0, 0, 25, 33, 218, 228, 79,
                                   215, 232, 22, 131, 196, 18, 84, 52, 127, 176,
                                   30, 179, 139, 70, 63, 20, 0, 0, 0, 28, 195,
                                   98, 254, 60, 65, 234, 180, 247, 214, 198, 63,
                                   251, 209, 124, 135, 75, 159, 42, 181, 20, 0,
                                   0, 0, 25, 33, 218, 227, 73, 217, 253, 63,
                                   131, 242, 201, 126, 137, 230, 83, 197, 212,
                                   252, 73, 169, 20, 0, 0, 0, 24, 48, 118, 225,
                                   251, 225, 113, 132, 62, 98, 248, 169, 185,
                                   80, 61, 86, 225, 234, 169, 24, 20, 0, 0, 0,
                                   26, 170, 176, 227, 85, 158, 214, 122, 46, 64,
                                   32, 173, 71, 136, 66, 27, 139, 197, 61, 141,
                                   20, 0, 0, 0, 25, 33, 148, 220, 104, 172, 25,
                                   122, 33, 208, 217, 174, 206, 243, 184, 30, 4,
                                   84, 1, 104, 20, 0, 0, 0, 24, 57, 246, 221,
                                   201, 199, 173, 182, 73, 147, 111, 195, 186,
                                   108, 18, 20, 127, 155, 127, 252, 20, 0, 0, 0,
                                   25, 33, 148, 211, 28, 196, 25, 108, 45, 144,
                                   204, 84, 223, 58, 64, 148, 104, 116, 46, 241,
                                   20, 0, 0, 0, 27, 113, 130, 212, 19, 158, 179,
                                   196, 161, 212, 11, 95, 112, 249, 195, 8, 148,
                                   124, 137, 103, 20, 0, 0, 0, 28, 33, 234, 211,
                                   28, 227, 232, 67, 222, 227, 54, 7, 127, 49,
                                   83, 101, 20, 251, 4, 246, 20, 0, 0, 0, 25,
                                   61, 20, 218, 201, 212, 113, 139, 190, 15, 0,
                                   125, 63, 38, 82, 100, 16, 187, 172, 252, 20,
                                   0, 0, 0, 25, 34, 86, 223, 28, 55, 21, 77,
                                   221, 212, 11, 163, 164, 168, 100, 219, 255,
                                   108, 89, 72, 20, 0, 0, 0, 25, 161, 245, 47,
                                   253, 12, 238, 17, 35, 135, 125, 142, 27, 8,
                                   229, 238, 195, 151, 167, 201, 20, 0, 0, 0,
                                   25, 189, 117, 46, 210, 148, 122, 195, 135,
                                   33, 152, 226, 105, 152, 6, 11, 179, 128, 65,
                                   165, 20, 0, 0, 0, 25, 189, 117, 22, 28, 254,
                                   228, 1, 241, 231, 225, 191, 6, 208, 42, 69,
                                   133, 100, 125, 111, 20, 0, 0, 0, 25, 180,
                                   117, 20, 28, 90, 232, 181, 215, 36, 187, 163,
                                   91, 79, 193, 36, 231, 129, 97, 95, 20, 0, 0,
                                   0, 25, 180, 59, 0, 165, 212, 201, 82, 97,
                                   209, 90, 107, 243, 128, 3, 238, 61, 228, 161,
                                   9, 20, 0, 0, 0, 30, 190, 205, 14, 215, 88,
                                   127, 211, 30, 26, 194, 222, 145, 201, 87,
                                   227, 251, 149, 189, 146, 20, 0, 0, 0, 30,
                                   190, 245, 12, 135, 70, 218, 193, 220, 95, 53,
                                   62, 43, 210, 168, 19, 19, 132, 107, 133, 20,
                                   0, 0, 0, 30, 161, 212, 240, 110, 43, 8, 70,
                                   109, 194, 219, 195, 25, 194, 251, 9, 156,
                                   181, 97, 230, 20, 0, 0, 0, 30, 191, 116, 243,
                                   237, 207, 209, 62, 167, 228, 241, 98, 145,
                                   214, 144, 149, 132, 246, 160, 5, 20, 0, 0, 0,
                                   24, 189, 52, 254, 28, 86, 184, 198, 45, 158,
                                   148, 207, 19, 209, 190, 215, 141, 224, 94,
                                   191, 20, 0, 0, 0, 26, 97, 16, 224, 14, 127,
                                   32, 11, 129, 207, 88, 171, 30, 192, 250, 8,
                                   57, 55, 146, 217, 20, 0, 0, 0, 31, 96, 230,
                                   219, 73, 164, 11, 182, 111, 66, 254, 51, 199,
                                   172, 203, 18, 227, 128, 3, 24, 20, 0, 0, 0,
                                   31, 96, 230, 211, 109, 253, 8, 80, 241, 239,
                                   3, 201, 200, 246, 20, 209, 149, 148, 133, 85,
                                   20, 0, 0, 0, 28, 112, 178, 215, 5, 201, 71,
                                   190, 57, 65, 101, 71, 1, 118, 82, 151, 14,
                                   32, 44, 0, 20, 0, 0, 0, 28, 104, 178, 220,
                                   71, 39, 250, 76, 222, 80, 165, 35, 17, 203,
                                   88, 23, 56, 224, 30, 190, 20, 0, 0, 0, 28,
                                   35, 78, 213, 99, 169, 120, 63, 52, 34, 117,
                                   203, 7, 165, 66, 226, 157, 164, 28, 143, 20,
                                   0, 0, 0, 28, 62, 24, 220, 71, 39, 41, 171,
                                   155, 115, 111, 61, 87, 42, 204, 94, 171, 144,
                                   190, 115, 20, 0, 0, 0, 25, 33, 148, 212, 188,
                                   134, 248, 75, 155, 235, 223, 188, 203, 144,
                                   72, 46, 175, 145, 37, 232, 20, 0, 0, 0, 28,
                                   44, 24, 210, 199, 253, 137, 106, 142, 96,
                                   122, 169, 209, 201, 76, 190, 80, 215, 146,
                                   67, 20, 0, 0, 0, 28, 41, 138, 229, 92, 218,
                                   208, 91, 162, 170, 132, 250, 225, 95, 139,
                                   211, 35, 128, 38, 62, 20, 0, 0, 0, 25, 61,
                                   20, 236, 23, 127, 240, 87, 30, 5, 84, 174,
                                   58, 75, 122, 81, 139, 15, 61, 15, 20, 0, 0,
                                   0, 25, 53, 148, 213, 109, 163, 40, 61, 249,
                                   145, 28, 29, 143, 54, 255, 211, 135, 123,
                                   129, 106, 20, 0, 0, 0, 25, 41, 218, 217, 103,
                                   248, 0, 80, 0, 212, 180, 168, 231, 39, 137,
                                   229, 132, 168, 169, 15, 20, 0, 0, 0, 25, 61,
                                   92, 221, 60, 170, 202, 58, 1, 215, 67, 245,
                                   31, 42, 58, 131, 203, 133, 60, 224, 20, 0, 0,
                                   0, 25, 53, 188, 252, 75, 49, 86, 123, 132,
                                   232, 166, 88, 247, 39, 82, 211, 139, 104,
                                   109, 45, 20, 0, 0, 0, 24, 181, 246, 229, 227,
                                   40, 91, 6, 35, 162, 199, 227, 167, 63, 62,
                                   26, 142, 40, 10, 190, 20, 0, 0, 0, 29, 206,
                                   14, 219, 211, 225, 139, 60, 254, 97, 132,
                                   168, 203, 127, 9, 212, 47, 19, 249, 182, 20,
                                   0, 0, 0, 29, 220, 14, 231, 131, 155, 10, 225,
                                   168, 209, 135, 173, 199, 57, 79, 148, 7, 223,
                                   165, 10, 20, 0, 0, 0, 24, 189, 24, 222, 20,
                                   217, 112, 95, 212, 226, 179, 253, 231, 40,
                                   71, 191, 47, 127, 197, 64, 20, 0, 0, 0, 31,
                                   250, 240, 218, 241, 218, 3, 174, 105, 232,
                                   159, 163, 73, 105, 58, 11, 182, 72, 225, 0,
                                   20, 0, 0, 0, 25, 235, 88, 231, 13, 129, 72,
                                   253, 199, 71, 148, 138, 135, 39, 190, 163,
                                   250, 36, 42, 209, 20, 0, 0, 0, 27, 242, 206,
                                   232, 167, 159, 116, 59, 14, 86, 231, 225,
                                   160, 246, 88, 95, 96, 225, 101, 137, 20, 0,
                                   0, 0, 25, 55, 80, 233, 220, 225, 86, 176, 83,
                                   17, 26, 129, 24, 229, 153, 243, 160, 100,
                                   162, 10, 20, 0, 0, 0, 25, 235, 66, 230, 143,
                                   33, 31, 79, 36, 62, 0, 125, 220, 243, 193,
                                   123, 133, 191, 222, 53, 20, 0, 0, 0, 28, 46,
                                   116, 226, 41, 143, 136, 58, 174, 98, 175,
                                   172, 227, 111, 93, 188, 175, 27, 89, 143, 20,
                                   0, 0, 0, 27, 125, 132, 224, 190, 190, 223,
                                   59, 190, 35, 21, 150, 73, 120, 94, 16, 255,
                                   156, 219, 32, 20, 0, 0, 0, 24, 96, 186, 235,
                                   92, 216, 175, 180, 97, 237, 44, 200, 188,
                                   231, 178, 17, 115, 188, 136, 39, 20, 0, 0, 0,
                                   27, 118, 4, 227, 9, 161, 7, 127, 36, 173,
                                   111, 43, 155, 208, 74, 17, 139, 152, 190,
                                   192, 20, 0, 0, 0, 27, 126, 164, 228, 167,
                                   125, 22, 182, 222, 111, 149, 30, 156, 72,
                                   137, 84, 101, 196, 45, 5, 20, 0, 0, 0, 26,
                                   127, 74, 223, 201, 88, 10, 207, 180, 192, 60,
                                   126, 151, 40, 194, 94, 72, 96, 2, 120, 20, 0,
                                   0, 0, 25, 41, 148, 232, 124, 229, 15, 176,
                                   81, 234, 213, 124, 191, 0, 169, 20, 48, 164,
                                   50, 81, 20, 0, 0, 0, 26, 104, 194, 220, 159,
                                   163, 7, 150, 73, 219, 159, 162, 138, 65, 20,
                                   147, 200, 120, 63, 147, 20, 0, 0, 0, 26, 97,
                                   66, 212, 60, 130, 205, 195, 99, 239, 28, 158,
                                   127, 10, 0, 63, 24, 124, 146, 243, 20, 0, 0,
                                   0, 26, 110, 104, 212, 201, 219, 55, 72, 103,
                                   139, 21, 131, 135, 3, 74, 151, 215, 149, 50,
                                   199, 20, 0, 0, 0, 27, 106, 164, 193, 101,
                                   133, 3, 172, 62, 3, 32, 44, 217, 241, 202,
                                   147, 127, 219, 199, 7, 20, 0, 0, 0, 26, 97,
                                   90, 220, 59, 169, 237, 145, 135, 31, 241, 44,
                                   151, 36, 145, 177, 193, 160, 3, 240, 20, 0,
                                   0, 0, 26, 125, 90, 215, 241, 172, 26, 93,
                                   237, 155, 240, 175, 99, 72, 189, 108, 119,
                                   148, 69, 236, 20, 0, 0, 0, 31, 119, 130, 220,
                                   254, 173, 72, 46, 34, 190, 176, 23, 47, 126,
                                   20, 82, 171, 156, 30, 32, 20, 0, 0, 0, 26,
                                   126, 26, 251, 163, 150, 152, 140, 222, 98,
                                   244, 35, 163, 105, 59, 4, 128, 252, 2, 234,
                                   20, 0, 0, 0, 27, 119, 164, 250, 124, 161, 10,
                                   103, 22, 227, 136, 246, 56, 192, 62, 18, 215,
                                   155, 30, 184, 20, 0, 0, 0, 29, 207, 235, 8,
                                   218, 125, 73, 72, 65, 62, 132, 217, 228, 160,
                                   182, 17, 213, 181, 228, 74, 20, 0, 0, 0, 27,
                                   122, 180, 242, 142, 162, 37, 62, 87, 104,
                                   144, 73, 19, 168, 79, 208, 131, 132, 29, 120,
                                   20, 0, 0, 0, 27, 122, 181, 15, 220, 0, 10,
                                   85, 92, 143, 15, 38, 20, 109, 210, 219, 168,
                                   164, 127, 7, 20, 0, 0, 0, 27, 126, 164, 241,
                                   123, 198, 12, 169, 19, 214, 112, 93, 15, 8,
                                   90, 64, 187, 216, 195, 213, 20, 0, 0, 0, 28,
                                   195, 118, 245, 103, 114, 231, 250, 157, 228,
                                   181, 192, 204, 111, 13, 95, 115, 214, 29, 80,
                                   20, 0, 0, 0, 27, 119, 245, 14, 251, 37, 56,
                                   63, 185, 81, 195, 128, 200, 246, 253, 171,
                                   80, 113, 217, 105, 20, 0, 0, 0, 27, 106, 247,
                                   6, 252, 171, 0, 176, 201, 222, 151, 166, 178,
                                   73, 41, 255, 173, 209, 89, 87, 20, 0, 0, 0,
                                   27, 127, 17, 19, 233, 199, 240, 31, 110, 26,
                                   20, 166, 151, 41, 14, 35, 219, 116, 36, 43,
                                   20, 0, 0, 0, 27, 125, 133, 42, 28, 70, 203,
                                   123, 102, 213, 124, 248, 191, 2, 101, 174,
                                   160, 224, 198, 79, 20, 0, 0, 0, 27, 122, 247,
                                   22, 131, 211, 17, 140, 180, 240, 208, 84,
                                   168, 254, 100, 83, 110, 84, 1, 184, 20, 0, 0,
                                   0, 27, 126, 245, 40, 165, 215, 220, 13, 17,
                                   155, 148, 42, 174, 216, 5, 78, 240, 239, 213,
                                   62, 20, 0, 0, 0, 27, 114, 207, 42, 135, 2,
                                   202, 91, 110, 62, 168, 142, 23, 171, 170, 16,
                                   83, 101, 164, 231, 20, 0, 0, 0, 27, 110, 247,
                                   27, 233, 201, 192, 28, 206, 34, 144, 34, 161,
                                   210, 66, 19, 84, 245, 150, 215, 20, 0, 0, 0,
                                   27, 118, 117, 26, 103, 37, 74, 187, 213, 146,
                                   170, 173, 36, 74, 136, 0, 230, 244, 40, 224,
                                   20, 0, 0, 0, 27, 125, 145, 28, 237, 89, 24,
                                   69, 206, 64, 245, 70, 27, 15, 7, 216, 115,
                                   196, 29, 137, 20, 0, 0, 0, 28, 60, 23, 24,
                                   252, 1, 111, 2, 215, 224, 23, 212, 174, 232,
                                   75, 210, 173, 219, 126, 10, 20, 0, 0, 0, 25,
                                   122, 181, 21, 231, 164, 0, 197, 254, 27, 96,
                                   2, 151, 167, 250, 43, 69, 228, 218, 167, 20,
                                   0, 0, 0, 25, 126, 149, 21, 87, 132, 89, 181,
                                   13, 226, 152, 190, 121, 236, 84, 39, 65, 203,
                                   12, 233, 20, 0, 0, 0, 25, 98, 165, 10, 46,
                                   212, 246, 138, 167, 238, 124, 37, 35, 96, 92,
                                   63, 78, 251, 33, 43, 20, 0, 0, 0, 31, 112,
                                   129, 10, 39, 226, 240, 157, 18, 251, 123,
                                   231, 11, 75, 181, 87, 69, 255, 224, 236, 20,
                                   0, 0, 0, 25, 119, 133, 1, 231, 165, 34, 143,
                                   73, 90, 182, 96, 159, 171, 250, 234, 254, 53,
                                   253, 86, 20, 0, 0, 0, 31, 35, 66, 250, 47,
                                   159, 255, 121, 71, 214, 20, 162, 121, 232,
                                   76, 80, 8, 51, 165, 63, 20, 0, 0, 0, 31, 35,
                                   66, 247, 233, 253, 246, 3, 238, 127, 101,
                                   138, 231, 40, 92, 16, 178, 28, 71, 74, 20, 0,
                                   0, 0, 25, 45, 40, 246, 79, 176, 31, 123, 63,
                                   109, 15, 222, 80, 217, 94, 34, 155, 118, 231,
                                   41, 20, 0, 0, 0, 25, 63, 243, 1, 124, 35,
                                   231, 7, 217, 85, 229, 170, 231, 54, 122, 82,
                                   91, 106, 255, 235, 20, 0, 0, 0, 24, 161, 195,
                                   0, 98, 225, 71, 76, 78, 83, 1, 142, 183, 237,
                                   98, 168, 125, 62, 229, 5, 20, 0, 0, 0, 29,
                                   220, 63, 4, 169, 199, 13, 86, 1, 235, 231,
                                   167, 155, 150, 61, 18, 170, 114, 219, 240,
                                   20, 0, 0, 0, 27, 173, 67, 10, 39, 132, 181,
                                   26, 132, 177, 128, 47, 83, 202, 69, 57, 69,
                                   251, 172, 182, 20, 0, 0, 0, 25, 45, 37, 6,
                                   205, 252, 47, 58, 162, 213, 200, 160, 134,
                                   208, 3, 80, 176, 144, 30, 36, 20, 0, 0, 0,
                                   28, 46, 119, 3, 145, 39, 31, 174, 159, 15,
                                   87, 170, 203, 117, 122, 218, 183, 104, 182,
                                   45, 20, 0, 0, 0, 29, 220, 102, 254, 156, 190,
                                   213, 107, 174, 74, 213, 68, 8, 171, 194, 138,
                                   169, 212, 167, 138, 20, 0, 0, 0, 27, 173, 74,
                                   251, 227, 33, 43, 56, 189, 195, 11, 69, 251,
                                   69, 243, 65, 81, 206, 209, 72, 20, 0, 0, 0,
                                   31, 161, 96, 244, 176, 241, 232, 101, 190,
                                   101, 232, 213, 122, 118, 31, 16, 33, 243,
                                   128, 64, 20, 0, 0, 0, 26, 112, 174, 245, 159,
                                   41, 23, 253, 6, 163, 11, 78, 215, 45, 197,
                                   215, 193, 220, 177, 169, 20, 0, 0, 0, 31,
                                   181, 64, 249, 99, 173, 73, 17, 102, 223, 136,
                                   29, 241, 193, 66, 84, 149, 211, 143, 151, 20,
                                   0, 0, 0, 26, 113, 194, 252, 14, 153, 138,
                                   171, 87, 15, 20, 157, 59, 95, 66, 17, 215,
                                   32, 47, 201, 20, 0, 0, 0, 31, 169, 96, 238,
                                   28, 227, 255, 182, 36, 161, 8, 7, 107, 76,
                                   130, 23, 249, 48, 95, 175, 20, 0, 0, 0, 29,
                                   207, 166, 227, 220, 134, 111, 5, 247, 199,
                                   28, 238, 183, 53, 82, 149, 181, 197, 179,
                                   219, 20, 0, 0, 0, 31, 181, 16, 217, 67, 161,
                                   19, 215, 143, 0, 255, 96, 151, 31, 192, 42,
                                   119, 132, 137, 50, 20, 0, 0, 0, 27, 193, 134,
                                   194, 188, 225, 77, 211, 127, 98, 217, 64,
                                   100, 74, 145, 200, 203, 133, 52, 233, 20, 0,
                                   0, 0, 31, 181, 0, 193, 252, 35, 30, 5, 206,
                                   96, 58, 173, 99, 167, 59, 112, 135, 138, 192,
                                   48, 20, 0, 0, 0, 24, 185, 164, 193, 254, 16,
                                   6, 171, 185, 0, 2, 86, 204, 181, 56, 61, 171,
                                   146, 151, 197, 20, 0, 0, 0, 24, 168, 194,
                                   216, 87, 158, 91, 53, 14, 81, 229, 165, 19,
                                   254, 37, 85, 133, 232, 45, 113, 20, 0, 0, 0,
                                   28, 63, 206, 222, 252, 137, 38, 70, 30, 86,
                                   72, 19, 47, 62, 19, 87, 51, 127, 41, 111, 20,
                                   0, 0, 0, 29, 219, 102, 228, 147, 169, 178,
                                   76, 118, 214, 42, 223, 8, 238, 161, 249, 7,
                                   147, 164, 248, 20, 0, 0, 0, 25, 39, 164, 228,
                                   163, 169, 250, 58, 179, 94, 116, 50, 255,
                                   177, 85, 158, 15, 122, 174, 233, 20, 0, 0, 0,
                                   25, 33, 214, 236, 7, 221, 39, 89, 62, 109,
                                   149, 29, 201, 233, 91, 197, 94, 52, 137, 237,
                                   20, 0, 0, 0, 25, 254, 66, 232, 190, 230, 51,
                                   70, 221, 215, 115, 165, 55, 54, 123, 80, 203,
                                   223, 171, 42, 20, 0, 0, 0, 25, 45, 52, 248,
                                   35, 98, 55, 39, 254, 14, 187, 23, 243, 120,
                                   109, 219, 77, 9, 157, 113, 20, 0, 0, 0, 25,
                                   48, 214, 241, 94, 194, 168, 41, 158, 82, 34,
                                   157, 51, 64, 128, 212, 98, 83, 196, 232, 20,
                                   0, 0, 0, 30, 200, 231, 36, 60, 84, 102, 243,
                                   254, 130, 216, 28, 34, 127, 122, 240, 195,
                                   146, 162, 190, 20, 0, 0, 0, 30, 213, 107, 19,
                                   231, 193, 190, 56, 98, 241, 96, 127, 227,
                                   192, 78, 42, 183, 216, 90, 253, 20, 0, 0, 0,
                                   30, 213, 99, 17, 73, 180, 82, 203, 168, 197,
                                   53, 47, 250, 73, 68, 81, 103, 134, 218, 99,
                                   20, 0, 0, 0, 30, 213, 103, 9, 92, 164, 107,
                                   62, 123, 193, 137, 66, 42, 86, 196, 15, 229,
                                   249, 88, 211, 20, 0, 0, 0, 30, 213, 102, 240,
                                   135, 193, 119, 94, 84, 236, 246, 175, 71, 56,
                                   170, 184, 124, 117, 249, 24, 20, 0, 0, 0, 30,
                                   197, 130, 248, 56, 215, 143, 197, 131, 151,
                                   23, 213, 233, 202, 123, 210, 131, 150, 84,
                                   80, 20, 0, 0, 0, 30, 213, 102, 239, 175, 212,
                                   72, 225, 99, 229, 8, 218, 44, 229, 194, 15,
                                   145, 56, 178, 207, 20, 0, 0, 0, 30, 195, 102,
                                   236, 233, 34, 30, 125, 200, 219, 55, 149, 70,
                                   17, 122, 80, 147, 144, 74, 207, 20, 0, 0, 0,
                                   30, 213, 86, 223, 232, 219, 242, 39, 211,
                                   222, 64, 68, 65, 111, 193, 143, 253, 192, 57,
                                   22, 20, 0, 0, 0, 28, 177, 184, 237, 126, 5,
                                   38, 193, 46, 96, 126, 62, 76, 172, 110, 30,
                                   106, 40, 152, 240, 20, 0, 0, 0, 31, 161, 52,
                                   211, 233, 89, 67, 90, 231, 33, 86, 177, 23,
                                   48, 85, 79, 229, 181, 188, 15, 20, 0, 0, 0,
                                   30, 177, 244, 223, 188, 161, 29, 65, 134,
                                   206, 218, 169, 15, 38, 196, 153, 11, 144,
                                   181, 145, 20, 0, 0, 0, 29, 212, 134, 213,
                                   135, 0, 242, 66, 14, 22, 8, 28, 247, 50, 87,
                                   236, 121, 53, 167, 223, 20, 0, 0, 0, 29, 199,
                                   102, 219, 163, 218, 228, 222, 217, 223, 145,
                                   212, 124, 232, 15, 133, 65, 248, 45, 48, 20,
                                   0, 0, 0, 29, 204, 170, 235, 205, 157, 10,
                                   175, 166, 212, 55, 175, 105, 202, 84, 212,
                                   111, 150, 230, 68, 20, 0, 0, 0, 28, 45, 24,
                                   235, 220, 191, 119, 94, 183, 159, 113, 30,
                                   242, 100, 108, 227, 63, 107, 72, 83, 20, 0,
                                   0, 0, 28, 45, 116, 235, 156, 198, 10, 134,
                                   220, 84, 90, 190, 110, 193, 135, 171, 183,
                                   118, 93, 119, 20, 0, 0, 0, 31, 52, 124, 237,
                                   216, 199, 25, 125, 230, 219, 44, 171, 235,
                                   109, 179, 149, 187, 240, 62, 121, 20, 0, 0,
                                   0, 31, 112, 156, 235, 188, 36, 191, 92, 211,
                                   141, 115, 181, 131, 215, 72, 108, 245, 183,
                                   175, 246, 20, 0, 0, 0, 31, 52, 36, 213, 199,
                                   179, 255, 179, 228, 223, 155, 167, 137, 233,
                                   40, 133, 199, 24, 239, 11, 20, 0, 0, 0, 31,
                                   41, 36, 222, 59, 197, 47, 91, 3, 162, 248,
                                   39, 135, 101, 164, 74, 54, 231, 191, 10, 20,
                                   0, 0, 0, 31, 35, 102, 219, 252, 174, 243,
                                   134, 231, 87, 103, 222, 0, 235, 186, 94, 199,
                                   119, 138, 84, 20, 0, 0, 0, 31, 48, 102, 218,
                                   39, 49, 21, 241, 222, 118, 172, 191, 255, 56,
                                   2, 95, 255, 156, 166, 80, 20, 0, 0, 0, 30,
                                   161, 205, 9, 253, 190, 62, 105, 238, 32, 207,
                                   31, 139, 145, 130, 215, 5, 44, 37, 40, 20, 0,
                                   0, 0, 29, 192, 190, 234, 7, 33, 1, 15, 3, 75,
                                   28, 192, 145, 234, 82, 165, 190, 98, 138,
                                   182, 20, 0, 0, 0, 30, 57, 206, 231, 124, 30,
                                   79, 246, 205, 129, 111, 75, 158, 194, 66,
                                   129, 3, 134, 188, 6, 20, 0, 0, 0, 30, 212,
                                   62, 211, 73, 0, 10, 122, 30, 30, 149, 145,
                                   102, 205, 111, 149, 127, 139, 165, 254, 20,
                                   0, 0, 0, 29, 220, 190, 204, 3, 168, 183, 94,
                                   4, 216, 80, 61, 23, 40, 91, 240, 129, 37, 8,
                                   255, 20, 0, 0, 0, 29, 223, 34, 204, 33, 191,
                                   217, 92, 199, 150, 121, 34, 223, 42, 253, 86,
                                   120, 117, 130, 203, 20, 0, 0, 0, 29, 199,
                                   198, 214, 9, 66, 161, 95, 230, 176, 178, 96,
                                   201, 236, 230, 218, 223, 18, 1, 15, 20, 0, 0,
                                   0, 27, 193, 198, 202, 124, 168, 223, 250,
                                   148, 252, 15, 199, 218, 127, 248, 230, 159,
                                   148, 35, 222, 20, 0, 0, 0, 27, 200, 198, 213,
                                   220, 42, 122, 158, 147, 210, 117, 67, 102,
                                   234, 217, 206, 170, 39, 131, 243, 20, 0, 0,
                                   0, 27, 221, 70, 204, 207, 215, 213, 110, 83,
                                   199, 9, 104, 212, 231, 210, 65, 153, 253,
                                   226, 95, 20, 0, 0, 0, 31, 163, 28, 207, 227,
                                   19, 248, 109, 231, 143, 112, 29, 32, 230, 10,
                                   20, 250, 229, 92, 179, 20, 0, 0, 0, 29, 145,
                                   86, 215, 169, 36, 90, 79, 45, 202, 162, 170,
                                   249, 202, 88, 51, 235, 42, 95, 18, 20, 0, 0,
                                   0, 30, 127, 238, 194, 237, 225, 74, 84, 183,
                                   63, 101, 251, 227, 241, 20, 20, 161, 190,
                                   196, 43, 20, 0, 0, 0, 31, 172, 80, 199, 28,
                                   126, 201, 226, 180, 128, 117, 38, 121, 106,
                                   210, 214, 176, 164, 226, 50, 20, 0, 0, 0, 31,
                                   163, 16, 207, 137, 141, 37, 57, 126, 72, 216,
                                   180, 239, 134, 253, 143, 130, 40, 45, 233,
                                   20, 0, 0, 0, 31, 175, 16, 177, 131, 169, 77,
                                   88, 33, 208, 147, 253, 167, 41, 78, 6, 108,
                                   116, 139, 92, 20, 0, 0, 0, 31, 165, 144, 183,
                                   15, 224, 242, 102, 76, 82, 40, 123, 38, 237,
                                   2, 83, 233, 59, 84, 189, 20, 0, 0, 0, 26,
                                   104, 252, 207, 83, 67, 231, 23, 50, 146, 243,
                                   60, 209, 208, 249, 192, 101, 37, 17, 24, 20,
                                   0, 0, 0, 31, 181, 148, 206, 92, 69, 88, 95,
                                   137, 86, 180, 87, 223, 2, 19, 78, 109, 181,
                                   16, 124, 20, 0, 0, 0, 31, 181, 144, 220, 73,
                                   191, 236, 175, 62, 89, 38, 40, 167, 21, 71,
                                   86, 224, 237, 213, 237, 20, 0, 0, 0, 31, 170,
                                   184, 212, 137, 163, 1, 155, 57, 251, 112,
                                   115, 39, 26, 253, 5, 17, 228, 178, 172, 20,
                                   0, 0, 0, 31, 177, 220, 214, 43, 43, 231, 165,
                                   174, 111, 69, 33, 19, 106, 253, 97, 89, 117,
                                   8, 15, 20, 0, 0, 0, 31, 168, 128, 209, 65,
                                   161, 69, 62, 225, 153, 100, 194, 242, 104,
                                   57, 192, 131, 203, 65, 247, 20, 0, 0, 0, 31,
                                   181, 66, 205, 7, 33, 235, 108, 118, 231, 15,
                                   189, 194, 73, 61, 81, 168, 243, 187, 210, 20,
                                   0, 0, 0, 24, 177, 246, 197, 188, 160, 255,
                                   205, 171, 122, 218, 41, 183, 15, 213, 111,
                                   188, 244, 29, 128, 20, 0, 0, 0, 28, 170, 168,
                                   196, 237, 193, 73, 163, 232, 228, 223, 43,
                                   250, 95, 77, 194, 53, 43, 42, 207, 20, 0, 0,
                                   0, 24, 177, 246, 194, 220, 98, 173, 81, 93,
                                   247, 244, 156, 204, 242, 224, 238, 196, 247,
                                   160, 71, 20, 0, 0, 0, 29, 220, 134, 222, 79,
                                   35, 207, 124, 115, 254, 140, 175, 153, 241,
                                   93, 81, 1, 35, 212, 247, 20, 0, 0, 0, 29,
                                   219, 98, 221, 28, 225, 19, 33, 32, 151, 128,
                                   42, 44, 83, 97, 43, 197, 19, 219, 41, 20, 0,
                                   0, 0, 29, 206, 6, 223, 188, 99, 43, 172, 49,
                                   147, 5, 196, 105, 205, 65, 21, 200, 245, 181,
                                   9, 20, 0, 0, 0, 29, 206, 102, 205, 174, 157,
                                   124, 199, 29, 226, 170, 199, 145, 71, 229,
                                   214, 249, 35, 0, 152, 20, 0, 0, 0, 24, 189,
                                   66, 206, 39, 160, 47, 88, 180, 97, 47, 92,
                                   87, 163, 200, 21, 148, 119, 197, 24, 20, 0,
                                   0, 0, 29, 206, 70, 206, 94, 40, 55, 91, 62,
                                   84, 5, 204, 146, 81, 183, 145, 38, 51, 141,
                                   155, 20, 0, 0, 0, 29, 215, 6, 190, 111, 252,
                                   79, 127, 225, 212, 12, 41, 73, 106, 74, 234,
                                   210, 56, 193, 255, 20, 0, 0, 0, 31, 184, 220,
                                   222, 29, 97, 17, 1, 232, 137, 130, 146, 162,
                                   104, 220, 31, 149, 191, 140, 81, 20, 0, 0, 0,
                                   31, 168, 164, 202, 124, 35, 248, 226, 14, 49,
                                   240, 205, 31, 39, 232, 223, 49, 186, 156,
                                   234, 20, 0, 0, 0, 31, 168, 220, 204, 86, 145,
                                   170, 129, 118, 128, 116, 129, 63, 170, 77,
                                   99, 109, 213, 121, 16, 20, 0, 0, 0, 31, 181,
                                   16, 200, 190, 122, 76, 51, 62, 30, 128, 93,
                                   151, 32, 126, 17, 5, 194, 159, 245, 20, 0, 0,
                                   0, 31, 181, 16, 203, 3, 206, 17, 151, 115,
                                   214, 120, 222, 167, 47, 68, 45, 180, 198,
                                   166, 96, 20, 0, 0, 0, 31, 163, 16, 198, 46,
                                   159, 81, 134, 243, 132, 117, 72, 151, 63,
                                   182, 85, 211, 159, 170, 74, 20, 0, 0, 0, 29,
                                   220, 66, 202, 169, 41, 11, 194, 60, 77, 131,
                                   190, 252, 43, 47, 166, 127, 112, 1, 168, 20,
                                   0, 0, 0, 29, 207, 134, 214, 37, 160, 242, 33,
                                   78, 96, 156, 147, 18, 118, 203, 34, 184, 246,
                                   127, 18, 20, 0, 0, 0, 29, 207, 230, 238, 175,
                                   65, 81, 197, 62, 32, 116, 46, 14, 117, 84,
                                   89, 63, 159, 128, 74, 20, 0, 0, 0, 29, 204,
                                   138, 237, 38, 125, 247, 56, 142, 64, 148,
                                   254, 103, 60, 18, 13, 25, 36, 9, 176, 20, 0,
                                   0, 0, 29, 220, 134, 239, 163, 1, 106, 89, 15,
                                   47, 196, 167, 239, 185, 168, 104, 211, 136,
                                   226, 41, 20, 0, 0, 0, 31, 181, 20, 250, 173,
                                   39, 231, 91, 98, 123, 108, 82, 3, 68, 88, 19,
                                   143, 104, 192, 73, 20, 0, 0, 0, 27, 165, 86,
                                   246, 252, 27, 216, 178, 115, 18, 244, 165,
                                   151, 139, 242, 222, 75, 136, 170, 109, 20, 0,
                                   0, 0, 27, 181, 118, 239, 124, 165, 41, 73,
                                   196, 214, 182, 134, 161, 234, 204, 85, 209,
                                   61, 62, 101, 20, 0, 0, 0, 28, 190, 186, 245,
                                   4, 170, 45, 142, 59, 41, 4, 130, 231, 138,
                                   48, 57, 240, 126, 13, 84, 20, 0, 0, 0, 31,
                                   168, 218, 237, 28, 173, 74, 251, 132, 193,
                                   197, 114, 209, 111, 168, 23, 141, 199, 194,
                                   70, 20, 0, 0, 0, 25, 184, 145, 2, 59, 28,
                                   164, 101, 99, 150, 89, 181, 161, 222, 193,
                                   211, 51, 146, 131, 154, 20, 0, 0, 0, 28, 197,
                                   143, 5, 215, 169, 7, 110, 173, 146, 171, 0,
                                   104, 216, 151, 21, 97, 239, 1, 225, 20, 0, 0,
                                   0, 25, 165, 132, 249, 105, 228, 241, 186,
                                   163, 201, 137, 158, 49, 241, 249, 90, 225,
                                   52, 236, 199, 20, 0, 0, 0, 25, 165, 186, 246,
                                   206, 225, 0, 247, 185, 254, 133, 136, 88,
                                   139, 125, 213, 179, 133, 252, 17, 20, 0, 0,
                                   0, 25, 165, 244, 228, 239, 254, 22, 140, 100,
                                   212, 215, 198, 195, 231, 4, 141, 91, 208, 89,
                                   24, 20, 0, 0, 0, 25, 165, 244, 231, 95, 165,
                                   232, 4, 84, 141, 3, 181, 243, 216, 104, 126,
                                   243, 136, 126, 9, 20, 0, 0, 0, 31, 176, 128,
                                   216, 252, 249, 32, 86, 150, 228, 163, 128,
                                   242, 77, 217, 44, 241, 39, 199, 242, 20, 0,
                                   0, 0, 27, 181, 46, 214, 56, 37, 22, 3, 174,
                                   68, 186, 161, 251, 74, 13, 129, 58, 118, 253,
                                   43, 20, 0, 0, 0, 30, 177, 212, 214, 73, 227,
                                   16, 98, 211, 202, 102, 11, 255, 31, 1, 142,
                                   176, 250, 39, 252, 20, 0, 0, 0, 31, 161, 26,
                                   213, 205, 128, 162, 14, 167, 246, 219, 166,
                                   34, 111, 62, 165, 231, 156, 96, 224, 20, 0,
                                   0, 0, 29, 212, 134, 213, 111, 130, 112, 12,
                                   102, 254, 8, 193, 115, 255, 50, 64, 28, 117,
                                   197, 72, 20, 0, 0, 0, 26, 104, 194, 221, 126,
                                   158, 81, 18, 190, 172, 4, 253, 97, 111, 132,
                                   64, 211, 219, 68, 88, 20, 0, 0, 0, 27, 180,
                                   66, 215, 123, 162, 207, 95, 78, 45, 133, 62,
                                   47, 41, 137, 13, 108, 176, 168, 17, 20, 0, 0,
                                   0, 25, 49, 148, 219, 71, 160, 182, 241, 95,
                                   100, 211, 253, 127, 38, 64, 225, 40, 227,
                                   164, 233, 20, 0, 0, 0, 30, 168, 176, 213,
                                   107, 177, 45, 20, 100, 223, 249, 74, 163,
                                   167, 181, 95, 253, 155, 127, 232, 20, 0, 0,
                                   0, 25, 176, 52, 241, 195, 170, 203, 3, 251,
                                   21, 246, 178, 129, 49, 156, 101, 163, 128,
                                   108, 254, 20, 0, 0, 0, 25, 61, 214, 255, 238,
                                   34, 105, 105, 130, 162, 213, 99, 47, 35, 3,
                                   18, 41, 55, 128, 235, 20, 0, 0, 0, 25, 33,
                                   148, 249, 78, 233, 227, 52, 178, 234, 76,
                                   203, 161, 240, 122, 36, 46, 53, 157, 8, 20,
                                   0, 0, 0, 30, 190, 180, 244, 167, 206, 231,
                                   171, 222, 83, 202, 142, 223, 9, 84, 14, 96,
                                   181, 171, 18, 20, 0, 0, 0, 30, 190, 180, 252,
                                   59, 55, 224, 2, 231, 162, 42, 144, 123, 7,
                                   138, 147, 133, 194, 224, 224, 20, 0, 0, 0,
                                   30, 181, 212, 234, 187, 167, 150, 186, 45,
                                   197, 140, 201, 224, 237, 81, 242, 248, 111,
                                   124, 232, 20, 0, 0, 0, 30, 177, 164, 227,
                                   173, 171, 76, 174, 253, 217, 211, 234, 234,
                                   66, 66, 15, 69, 172, 101, 184, 20, 0, 0, 0,
                                   29, 223, 98, 215, 156, 28, 216, 4, 100, 109,
                                   106, 138, 111, 106, 130, 22, 144, 187, 174,
                                   48, 20, 0, 0, 0, 25, 53, 214, 208, 252, 137,
                                   72, 106, 60, 124, 117, 72, 92, 68, 4, 147,
                                   141, 236, 31, 89, 20, 0, 0, 0, 29, 220, 134,
                                   207, 238, 220, 255, 51, 249, 89, 57, 31, 191,
                                   105, 77, 209, 95, 222, 8, 12, 20, 0, 0, 0,
                                   29, 220, 162, 202, 167, 138, 215, 76, 173,
                                   204, 192, 44, 156, 88, 70, 0, 211, 219, 164,
                                   237, 20, 0, 0, 0, 29, 220, 14, 200, 169, 127,
                                   245, 202, 142, 0, 36, 32, 16, 224, 2, 17,
                                   114, 86, 157, 73, 20, 0, 0, 0, 29, 206, 70,
                                   217, 199, 43, 22, 50, 50, 49, 115, 237, 19,
                                   249, 193, 91, 167, 145, 190, 124, 20, 0, 0,
                                   0, 29, 204, 142, 230, 220, 61, 108, 149, 111,
                                   38, 178, 254, 193, 200, 128, 47, 175, 131,
                                   139, 53, 20, 0, 0, 0, 29, 207, 134, 196, 133,
                                   171, 2, 246, 209, 228, 120, 227, 112, 230,
                                   252, 146, 4, 93, 142, 170, 20, 0, 0, 0, 29,
                                   199, 134, 196, 13, 129, 136, 98, 38, 210,
                                   181, 85, 3, 114, 9, 60, 223, 116, 64, 79, 20,
                                   0, 0, 0, 29, 219, 102, 203, 29, 2, 226, 76,
                                   190, 89, 197, 250, 204, 240, 82, 168, 180,
                                   248, 17, 54, 20, 0, 0, 0, 29, 221, 134, 218,
                                   91, 136, 56, 133, 141, 87, 37, 195, 67, 85,
                                   132, 146, 236, 244, 193, 138, 20, 0, 0, 0,
                                   25, 45, 214, 195, 195, 178, 106, 141, 163,
                                   215, 28, 71, 56, 254, 108, 25, 49, 186, 169,
                                   169, 20, 0, 0, 0, 27, 161, 74, 204, 233, 228,
                                   28, 109, 3, 227, 104, 39, 71, 40, 120, 154,
                                   115, 151, 160, 96, 20, 0, 0, 0, 25, 62, 214,
                                   198, 28, 166, 32, 101, 155, 212, 134, 150,
                                   145, 248, 65, 148, 206, 250, 194, 183, 20, 0,
                                   0, 0, 25, 56, 214, 194, 231, 253, 125, 131,
                                   174, 126, 223, 55, 31, 39, 66, 146, 116, 119,
                                   89, 218, 20, 0, 0, 0, 25, 33, 214, 205, 69,
                                   230, 56, 70, 81, 215, 244, 251, 55, 41, 43,
                                   94, 188, 180, 150, 47, 20, 0, 0, 0, 25, 47,
                                   36, 199, 205, 205, 181, 4, 14, 120, 251, 222,
                                   190, 234, 186, 143, 59, 90, 237, 43, 20, 0,
                                   0, 0, 25, 61, 52, 198, 39, 133, 3, 72, 253,
                                   94, 251, 158, 247, 45, 58, 149, 222, 115,
                                   144, 225, 20, 0, 0, 0, 30, 177, 181, 1, 176,
                                   79, 11, 204, 249, 51, 172, 169, 15, 53, 186,
                                   67, 127, 144, 85, 84, 20, 0, 0, 0, 26, 125,
                                   66, 251, 252, 1, 21, 72, 17, 17, 240, 33, 7,
                                   10, 90, 62, 58, 253, 201, 175, 20, 0, 0, 0,
                                   29, 208, 163, 17, 251, 18, 80, 59, 19, 173,
                                   185, 194, 27, 127, 44, 109, 141, 179, 161,
                                   11, 20, 0, 0, 0, 27, 106, 165, 7, 224, 155,
                                   151, 143, 50, 159, 131, 252, 102, 48, 136,
                                   154, 108, 102, 197, 169, 20, 0, 0, 0, 29,
                                   220, 90, 250, 241, 38, 79, 195, 139, 242,
                                   240, 223, 169, 175, 68, 89, 214, 90, 37, 43,
                                   20, 0, 0, 0, 29, 220, 102, 246, 137, 225,
                                   245, 171, 24, 215, 137, 86, 80, 227, 101,
                                   103, 59, 151, 221, 25, 20, 0, 0, 0, 29, 220,
                                   98, 241, 69, 213, 185, 62, 19, 194, 149, 191,
                                   28, 254, 93, 253, 185, 176, 205, 244, 20, 0,
                                   0, 0, 29, 220, 234, 242, 220, 130, 12, 72,
                                   167, 19, 109, 37, 107, 150, 60, 227, 239,
                                   192, 48, 127, 20, 0, 0, 0, 26, 96, 194, 226,
                                   152, 33, 16, 172, 142, 74, 166, 38, 175, 182,
                                   140, 15, 20, 104, 216, 207, 20, 0, 0, 0, 26,
                                   127, 66, 239, 252, 213, 36, 248, 157, 210,
                                   223, 156, 87, 177, 156, 63, 115, 202, 165,
                                   248, 20, 0, 0, 0, 26, 127, 66, 235, 171, 221,
                                   51, 188, 158, 2, 112, 127, 71, 18, 79, 129,
                                   186, 123, 33, 185, 20, 0, 0, 0, 26, 127, 58,
                                   221, 67, 125, 30, 253, 195, 218, 137, 96,
                                   183, 52, 103, 51, 252, 120, 212, 185, 20, 0,
                                   0, 0, 27, 114, 164, 218, 77, 183, 0, 182, 23,
                                   130, 251, 125, 243, 232, 75, 226, 249, 234,
                                   33, 21, 20, 0, 0, 0, 25, 35, 220, 205, 3,
                                   171, 55, 130, 143, 87, 86, 231, 56, 200, 124,
                                   112, 133, 37, 217, 75, 20, 0, 0, 0, 31, 100,
                                   230, 204, 91, 38, 223, 130, 238, 70, 182,
                                   189, 199, 152, 161, 231, 239, 143, 98, 222,
                                   20, 0, 0, 0, 26, 116, 216, 202, 135, 86, 235,
                                   60, 17, 154, 65, 48, 38, 10, 218, 127, 179,
                                   149, 206, 68, 20, 0, 0, 0, 26, 127, 0, 163,
                                   67, 163, 217, 5, 209, 210, 134, 3, 240, 241,
                                   43, 206, 137, 49, 190, 42, 20, 0, 0, 0, 26,
                                   127, 36, 167, 124, 154, 175, 78, 142, 110,
                                   120, 38, 93, 232, 85, 193, 212, 187, 97, 82,
                                   20, 0, 0, 0, 26, 124, 144, 162, 9, 189, 175,
                                   244, 161, 218, 255, 236, 122, 107, 82, 191,
                                   183, 147, 202, 27, 20, 0, 0, 0, 26, 125, 194,
                                   185, 156, 21, 120, 2, 239, 49, 229, 181, 247,
                                   191, 100, 212, 7, 112, 97, 22, 20, 0, 0, 0,
                                   26, 126, 230, 170, 227, 157, 103, 72, 212,
                                   240, 152, 39, 55, 33, 169, 138, 81, 43, 31,
                                   232, 20, 0, 0, 0, 26, 104, 194, 156, 46, 120,
                                   17, 75, 180, 203, 184, 33, 143, 48, 57, 252,
                                   199, 117, 35, 232, 20, 0, 0, 0, 31, 169, 16,
                                   146, 195, 166, 195, 23, 49, 173, 133, 222,
                                   49, 107, 181, 150, 97, 54, 43, 29, 20, 0, 0,
                                   0, 31, 177, 238, 218, 28, 100, 25, 96, 73,
                                   85, 111, 68, 162, 155, 174, 25, 239, 7, 249,
                                   37, 20, 0, 0, 0, 31, 177, 190, 193, 229, 67,
                                   182, 144, 232, 211, 133, 127, 233, 224, 61,
                                   215, 215, 56, 228, 198, 20, 0, 0, 0, 31, 177,
                                   88, 201, 71, 129, 34, 106, 254, 19, 240, 97,
                                   75, 104, 89, 228, 65, 44, 121, 64, 20, 0, 0,
                                   0, 26, 103, 174, 196, 252, 197, 85, 131, 39,
                                   91, 45, 66, 167, 2, 195, 45, 47, 117, 96,
                                   234, 20, 0, 0, 0, 25, 35, 220, 195, 187, 213,
                                   111, 249, 251, 228, 136, 86, 105, 236, 82,
                                   223, 99, 148, 198, 48, 20, 0, 0, 0, 26, 124,
                                   160, 201, 219, 250, 75, 88, 97, 232, 108,
                                   215, 215, 132, 50, 165, 213, 196, 178, 212,
                                   20, 0, 0, 0, 28, 51, 150, 201, 240, 169, 71,
                                   250, 174, 64, 132, 89, 1, 49, 216, 192, 169,
                                   187, 190, 81, 20, 0, 0, 0, 28, 124, 210, 197,
                                   9, 65, 241, 2, 134, 240, 27, 99, 111, 44,
                                   202, 239, 183, 147, 218, 200, 20, 0, 0, 0,
                                   25, 35, 212, 195, 28, 252, 62, 85, 37, 225,
                                   56, 192, 175, 0, 173, 94, 152, 229, 1, 255,
                                   20, 0, 0, 0, 28, 116, 210, 202, 219, 197, 71,
                                   21, 75, 64, 196, 217, 140, 119, 136, 237, 3,
                                   128, 37, 18, 20, 0, 0, 0, 28, 116, 168, 205,
                                   7, 193, 107, 17, 70, 250, 165, 232, 159, 10,
                                   138, 19, 253, 179, 100, 85, 20, 0, 0, 0, 28,
                                   116, 248, 207, 195, 217, 180, 126, 62, 85,
                                   91, 227, 255, 17, 196, 19, 96, 228, 76, 20,
                                   20, 0, 0, 0, 24, 118, 144, 198, 60, 171, 17,
                                   37, 130, 115, 17, 49, 238, 239, 242, 224,
                                   181, 56, 194, 24, 20, 0, 0, 0, 28, 124, 128,
                                   191, 109, 202, 41, 88, 112, 208, 147, 165,
                                   192, 235, 148, 155, 177, 185, 97, 95, 20, 0,
                                   0, 0, 28, 116, 242, 186, 211, 199, 64, 91,
                                   79, 98, 200, 79, 195, 132, 120, 163, 175,
                                   133, 68, 231, 20, 0, 0, 0, 31, 100, 174, 178,
                                   188, 229, 33, 194, 3, 213, 97, 53, 15, 169,
                                   66, 142, 139, 99, 159, 232, 20, 0, 0, 0, 27,
                                   173, 88, 196, 5, 88, 224, 7, 238, 113, 23,
                                   155, 197, 237, 192, 80, 191, 154, 97, 45, 20,
                                   0, 0, 0, 30, 216, 231, 6, 231, 56, 28, 115,
                                   9, 31, 91, 36, 239, 50, 125, 118, 103, 146,
                                   25, 31, 20, 0, 0, 0, 30, 216, 230, 239, 135,
                                   173, 137, 0, 145, 254, 191, 226, 67, 107,
                                   141, 163, 122, 123, 53, 18, 20, 0, 0, 0, 30,
                                   216, 246, 227, 60, 32, 0, 72, 112, 210, 164,
                                   47, 255, 38, 6, 30, 231, 149, 39, 252, 20, 0,
                                   0, 0, 30, 193, 102, 234, 210, 202, 196, 73,
                                   47, 122, 244, 54, 73, 98, 137, 196, 57, 230,
                                   148, 17, 20, 0, 0, 0, 30, 193, 102, 219, 188,
                                   222, 203, 110, 99, 226, 252, 42, 83, 149,
                                   140, 65, 146, 112, 121, 64, 20, 0, 0, 0, 28,
                                   193, 124, 210, 252, 62, 201, 126, 67, 252,
                                   208, 1, 51, 135, 135, 129, 185, 243, 118, 6,
                                   20, 0, 0, 0, 31, 184, 150, 217, 174, 198,
                                   201, 79, 148, 152, 182, 163, 127, 10, 90, 65,
                                   150, 113, 55, 144, 20, 0, 0, 0, 27, 184, 150,
                                   215, 169, 149, 45, 150, 238, 10, 131, 225,
                                   57, 192, 183, 190, 39, 159, 67, 249, 20, 0,
                                   0, 0, 27, 181, 246, 221, 211, 35, 229, 122,
                                   46, 87, 8, 38, 225, 248, 198, 99, 104, 230,
                                   201, 5, 20, 0, 0, 0, 25, 165, 180, 198, 142,
                                   213, 160, 103, 231, 130, 248, 164, 151, 8,
                                   201, 85, 117, 211, 65, 118, 20, 0, 0, 0, 27,
                                   181, 246, 203, 155, 153, 120, 58, 239, 226,
                                   117, 106, 99, 194, 59, 231, 101, 41, 1, 55,
                                   20, 0, 0, 0, 30, 168, 180, 190, 158, 36, 7,
                                   57, 132, 252, 213, 98, 89, 197, 139, 207,
                                   171, 158, 74, 21, 20, 0, 0, 0, 27, 181, 22,
                                   178, 142, 60, 224, 196, 110, 20, 243, 217,
                                   11, 107, 61, 10, 155, 159, 217, 18, 20, 0, 0,
                                   0, 27, 181, 102, 180, 237, 217, 13, 2, 116,
                                   197, 233, 226, 169, 226, 207, 90, 98, 51, 92,
                                   241, 20, 0, 0, 0, 26, 104, 246, 178, 164,
                                   169, 100, 66, 28, 230, 44, 70, 55, 45, 74,
                                   236, 87, 218, 252, 103, 20, 0, 0, 0, 28, 190,
                                   154, 207, 111, 73, 82, 129, 254, 68, 180,
                                   191, 177, 66, 147, 34, 209, 33, 11, 31, 20,
                                   0, 0, 0, 29, 169, 138, 225, 60, 28, 241, 81,
                                   83, 146, 220, 124, 88, 207, 218, 192, 250,
                                   87, 170, 176, 20, 0, 0, 0, 30, 211, 231, 7,
                                   178, 193, 244, 255, 89, 88, 79, 124, 187,
                                   193, 74, 159, 114, 35, 37, 81, 20, 0, 0, 0,
                                   25, 172, 4, 251, 222, 53, 113, 59, 230, 24,
                                   172, 61, 86, 241, 253, 94, 27, 210, 136, 104,
                                   20, 0, 0, 0, 31, 176, 128, 251, 105, 121, 21,
                                   82, 155, 160, 243, 181, 125, 67, 246, 255,
                                   242, 37, 165, 92, 20, 0, 0, 0, 25, 169, 208,
                                   227, 28, 250, 43, 75, 13, 136, 212, 166, 123,
                                   171, 0, 92, 102, 228, 21, 247, 20, 0, 0, 0,
                                   31, 184, 128, 214, 156, 195, 20, 41, 254,
                                   123, 229, 98, 82, 104, 16, 14, 53, 55, 205,
                                   87, 20, 0, 0, 0, 31, 168, 248, 208, 45, 255,
                                   233, 122, 153, 225, 248, 60, 151, 32, 42, 11,
                                   226, 36, 23, 136, 20, 0, 0, 0, 31, 165, 216,
                                   220, 203, 218, 21, 193, 228, 155, 132, 226,
                                   163, 108, 211, 212, 255, 135, 222, 146, 20,
                                   0, 0, 0, 31, 165, 202, 209, 205, 173, 64,
                                   249, 30, 96, 113, 83, 59, 138, 215, 179, 47,
                                   139, 43, 235, 20, 0, 0, 0, 26, 126, 194, 198,
                                   71, 130, 175, 38, 242, 201, 6, 123, 67, 150,
                                   2, 154, 41, 213, 160, 11, 20, 0, 0, 0, 31,
                                   174, 40, 197, 133, 138, 24, 64, 97, 254, 0,
                                   99, 172, 202, 64, 129, 128, 176, 30, 220, 20,
                                   0, 0, 0, 31, 184, 144, 202, 188, 89, 32, 3,
                                   103, 95, 35, 156, 121, 243, 46, 18, 67, 155,
                                   36, 239, 20, 0, 0, 0, 27, 169, 150, 203, 54,
                                   162, 202, 44, 147, 87, 59, 42, 85, 255, 107,
                                   198, 149, 160, 44, 8, 20, 0, 0, 0, 31, 184,
                                   178, 201, 156, 226, 10, 73, 4, 215, 248, 160,
                                   238, 64, 251, 109, 147, 128, 38, 168, 20, 0,
                                   0, 0, 27, 172, 152, 178, 175, 146, 102, 178,
                                   206, 84, 3, 167, 15, 234, 13, 145, 129, 214,
                                   139, 18, 20, 0, 0, 0, 26, 126, 238, 195, 28,
                                   171, 199, 17, 132, 143, 107, 109, 227, 119,
                                   90, 87, 93, 41, 97, 34, 20, 0, 0, 0, 31, 183,
                                   66, 199, 77, 156, 25, 102, 38, 213, 6, 136,
                                   111, 39, 100, 75, 77, 226, 23, 10, 20, 0, 0,
                                   0, 31, 166, 168, 200, 201, 1, 103, 2, 190,
                                   34, 133, 105, 242, 232, 187, 193, 131, 139,
                                   67, 96, 20, 0, 0, 0, 31, 174, 40, 189, 28,
                                   99, 245, 250, 151, 142, 132, 124, 176, 192,
                                   76, 102, 141, 181, 127, 231, 20, 0, 0, 0, 31,
                                   165, 194, 180, 73, 161, 41, 184, 193, 225,
                                   104, 252, 116, 81, 148, 7, 88, 174, 43, 8,
                                   20, 0, 0, 0, 31, 189, 66, 161, 227, 128, 25,
                                   67, 21, 255, 140, 72, 143, 20, 172, 65, 93,
                                   62, 169, 241, 20, 0, 0, 0, 31, 174, 16, 158,
                                   46, 129, 8, 114, 23, 4, 158, 37, 31, 59, 58,
                                   128, 85, 180, 163, 239, 20, 0, 0, 0, 31, 189,
                                   16, 160, 161, 216, 23, 77, 174, 112, 168, 6,
                                   120, 203, 56, 49, 150, 191, 69, 24, 20, 0, 0,
                                   0, 31, 165, 168, 174, 60, 249, 71, 168, 244,
                                   192, 185, 32, 152, 248, 105, 254, 36, 85,
                                   161, 39, 20, 0, 0, 0, 31, 168, 128, 172, 70,
                                   138, 134, 73, 116, 223, 201, 158, 106, 109,
                                   195, 16, 235, 158, 1, 59, 20, 0, 0, 0, 31,
                                   168, 144, 161, 99, 212, 0, 75, 71, 100, 246,
                                   127, 55, 44, 216, 142, 165, 208, 89, 38, 20,
                                   0, 0, 0, 27, 167, 74, 188, 83, 73, 156, 80,
                                   168, 162, 1, 97, 44, 54, 253, 142, 86, 36,
                                   41, 176, 20, 0, 0, 0, 25, 246, 88, 197, 145,
                                   66, 77, 101, 15, 51, 21, 28, 214, 249, 134,
                                   16, 187, 139, 68, 255, 20, 0, 0, 0, 30, 210,
                                   175, 49, 60, 86, 176, 65, 185, 18, 89, 252,
                                   57, 131, 122, 97, 43, 180, 96, 224, 20, 0, 0,
                                   0, 30, 221, 131, 94, 28, 217, 22, 5, 118,
                                   218, 197, 255, 10, 81, 59, 19, 163, 192, 70,
                                   72, 20, 0, 0, 0, 30, 223, 35, 52, 239, 157,
                                   53, 100, 39, 35, 128, 64, 126, 225, 225, 45,
                                   189, 203, 63, 38, 20, 0, 0, 0, 30, 223, 95,
                                   37, 45, 168, 18, 210, 46, 95, 4, 157, 82, 10,
                                   2, 148, 240, 176, 103, 115, 20, 0, 0, 0, 30,
                                   223, 39, 23, 59, 173, 224, 199, 123, 255, 90,
                                   161, 169, 81, 37, 91, 209, 43, 36, 167, 20,
                                   0, 0, 0, 29, 172, 143, 23, 77, 128, 43, 196,
                                   118, 212, 170, 75, 41, 230, 82, 78, 26, 40,
                                   123, 246, 20, 0, 0, 0, 30, 206, 115, 23, 60,
                                   199, 105, 120, 127, 108, 214, 157, 208, 255,
                                   81, 160, 128, 123, 165, 10, 20, 0, 0, 0, 29,
                                   173, 79, 5, 110, 236, 246, 58, 78, 112, 143,
                                   30, 191, 16, 173, 211, 192, 229, 69, 41, 20,
                                   0, 0, 0, 30, 37, 5, 3, 77, 171, 202, 226,
                                   179, 252, 179, 181, 109, 49, 224, 6, 209,
                                   223, 197, 70, 20, 0, 0, 0, 30, 213, 67, 5,
                                   197, 127, 128, 139, 2, 201, 143, 171, 131,
                                   168, 69, 238, 204, 244, 32, 255, 20, 0, 0, 0,
                                   30, 168, 245, 23, 205, 228, 42, 198, 33, 211,
                                   55, 145, 134, 222, 197, 192, 177, 227, 137,
                                   230, 20, 0, 0, 0, 31, 143, 7, 53, 139, 100,
                                   77, 90, 243, 148, 164, 225, 140, 26, 63, 238,
                                   175, 187, 189, 253, 20, 0, 0, 0, 31, 168,
                                   175, 47, 252, 128, 136, 42, 6, 222, 179, 133,
                                   243, 80, 157, 79, 61, 235, 113, 253, 20, 0,
                                   0, 0, 27, 165, 89, 21, 87, 200, 241, 141,
                                   182, 240, 183, 131, 81, 231, 229, 80, 104,
                                   119, 228, 12, 20, 0, 0, 0, 24, 173, 247, 21,
                                   111, 196, 177, 64, 33, 124, 8, 34, 248, 199,
                                   4, 14, 183, 249, 168, 49, 20, 0, 0, 0, 29,
                                   206, 71, 30, 43, 251, 204, 197, 214, 244,
                                   132, 66, 101, 249, 63, 230, 64, 228, 61, 254,
                                   20, 0, 0, 0, 29, 199, 199, 25, 207, 90, 216,
                                   139, 254, 38, 87, 189, 15, 8, 141, 143, 133,
                                   57, 60, 177, 20, 0, 0, 0, 31, 161, 17, 12,
                                   28, 218, 75, 65, 35, 212, 38, 143, 107, 151,
                                   63, 231, 47, 116, 226, 48, 20, 0, 0, 0, 29,
                                   199, 198, 255, 105, 159, 232, 100, 185, 227,
                                   32, 47, 248, 233, 69, 146, 133, 56, 213, 248,
                                   20, 0, 0, 0, 31, 181, 100, 250, 211, 221,
                                   104, 79, 130, 150, 168, 40, 32, 243, 63, 177,
                                   245, 219, 114, 21, 20, 0, 0, 0, 31, 181, 28,
                                   231, 15, 159, 234, 199, 99, 206, 196, 150,
                                   88, 208, 39, 159, 239, 204, 142, 129, 20, 0,
                                   0, 0, 31, 181, 80, 234, 141, 98, 127, 41,
                                   226, 215, 163, 176, 36, 100, 125, 1, 91, 139,
                                   246, 237, 20, 0, 0, 0, 31, 181, 76, 216, 105,
                                   156, 239, 76, 206, 99, 15, 36, 90, 73, 71,
                                   20, 237, 181, 173, 233, 20, 0, 0, 0, 29, 204,
                                   124, 209, 142, 222, 7, 88, 211, 215, 248,
                                   164, 26, 72, 240, 32, 183, 209, 163, 172, 20,
                                   0, 0, 0, 29, 199, 198, 203, 177, 180, 231,
                                   126, 215, 88, 24, 25, 47, 42, 77, 193, 144,
                                   107, 125, 86, 20, 0, 0, 0, 28, 173, 144, 185,
                                   229, 222, 43, 3, 3, 234, 126, 37, 26, 72, 83,
                                   215, 43, 196, 158, 113, 20, 0, 0, 0, 28, 170,
                                   144, 185, 175, 42, 196, 57, 110, 64, 124,
                                   191, 39, 42, 251, 82, 225, 199, 130, 150, 20,
                                   0, 0, 0, 31, 161, 36, 183, 156, 32, 223, 140,
                                   149, 112, 172, 6, 250, 74, 194, 42, 127, 135,
                                   137, 54, 20, 0, 0, 0, 31, 163, 28, 190, 220,
                                   32, 11, 145, 158, 94, 117, 88, 36, 103, 214,
                                   63, 133, 163, 30, 83, 20, 0, 0, 0, 27, 165,
                                   46, 163, 77, 167, 205, 124, 78, 84, 95, 3,
                                   239, 37, 82, 193, 252, 108, 72, 104, 20, 0,
                                   0, 0, 26, 97, 174, 188, 147, 125, 54, 173,
                                   148, 146, 126, 30, 183, 22, 226, 83, 243,
                                   156, 61, 9, 20, 0, 0, 0, 24, 173, 246, 171,
                                   156, 172, 25, 125, 99, 159, 31, 238, 243,
                                   127, 122, 216, 243, 152, 40, 3, 20, 0, 0, 0,
                                   29, 217, 14, 175, 105, 193, 237, 75, 70, 224,
                                   176, 99, 105, 201, 182, 48, 127, 149, 207,
                                   199, 20, 0, 0, 0, 26, 109, 16, 174, 167, 133,
                                   89, 129, 7, 15, 3, 128, 243, 105, 74, 255,
                                   192, 210, 82, 10, 20, 0, 0, 0, 29, 219, 70,
                                   163, 227, 192, 231, 191, 168, 215, 102, 31,
                                   83, 250, 179, 72, 123, 155, 41, 43, 20, 0, 0,
                                   0, 29, 217, 124, 179, 220, 49, 108, 95, 174,
                                   80, 211, 192, 106, 63, 68, 191, 182, 127,
                                   195, 235, 20, 0, 0, 0, 26, 104, 128, 185,
                                   199, 37, 31, 66, 20, 148, 164, 191, 105, 236,
                                   18, 217, 179, 119, 137, 8, 20, 0, 0, 0, 26,
                                   125, 28, 189, 135, 237, 17, 174, 217, 80,
                                   215, 173, 235, 126, 141, 176, 133, 180, 97,
                                   41, 20, 0, 0, 0, 29, 204, 14, 186, 142, 175,
                                   226, 175, 104, 228, 15, 218, 218, 120, 255,
                                   212, 215, 111, 168, 0, 20, 0, 0, 0, 29, 217,
                                   110, 182, 220, 0, 9, 178, 94, 19, 239, 43,
                                   94, 224, 240, 18, 104, 53, 130, 176, 20, 0,
                                   0, 0, 29, 217, 102, 181, 137, 157, 64, 254,
                                   226, 149, 108, 43, 187, 170, 90, 213, 55,
                                   160, 35, 170, 20, 0, 0, 0, 24, 96, 152, 189,
                                   55, 193, 11, 61, 242, 227, 165, 251, 91, 170,
                                   74, 94, 55, 164, 165, 17, 20, 0, 0, 0, 28,
                                   112, 248, 191, 207, 173, 103, 94, 179, 188,
                                   165, 43, 39, 35, 83, 62, 227, 203, 36, 121,
                                   20, 0, 0, 0, 24, 97, 244, 185, 41, 38, 232,
                                   70, 215, 236, 109, 225, 203, 73, 90, 181,
                                   173, 4, 171, 240, 20, 0, 0, 0, 31, 127, 46,
                                   168, 199, 198, 48, 67, 200, 205, 113, 87,
                                   113, 246, 56, 168, 55, 241, 52, 255, 20, 0,
                                   0, 0, 31, 96, 174, 179, 188, 197, 73, 95,
                                   254, 62, 4, 161, 125, 191, 189, 237, 71, 112,
                                   123, 213, 20, 0, 0, 0, 28, 99, 208, 179, 201,
                                   191, 35, 75, 238, 86, 115, 219, 129, 255, 52,
                                   17, 129, 176, 169, 8, 20, 0, 0, 0, 28, 127,
                                   128, 170, 12, 197, 9, 78, 46, 82, 215, 219,
                                   91, 113, 2, 87, 166, 51, 75, 150, 20, 0, 0,
                                   0, 31, 119, 174, 174, 190, 193, 95, 130, 65,
                                   210, 126, 53, 47, 40, 127, 154, 251, 144, 1,
                                   83, 20, 0, 0, 0, 29, 220, 14, 164, 203, 169,
                                   233, 1, 239, 65, 155, 65, 127, 54, 194, 234,
                                   211, 149, 42, 224, 20, 0, 0, 0, 29, 220, 78,
                                   168, 135, 1, 8, 145, 241, 210, 116, 22, 57,
                                   250, 42, 38, 18, 53, 129, 79, 20, 0, 0, 0,
                                   26, 97, 16, 172, 3, 0, 238, 38, 33, 202, 154,
                                   161, 103, 22, 130, 110, 216, 116, 48, 175,
                                   20, 0, 0, 0, 31, 161, 16, 168, 92, 174, 17,
                                   73, 134, 241, 131, 41, 146, 99, 56, 19, 112,
                                   244, 34, 135, 20, 0, 0, 0, 26, 97, 130, 181,
                                   171, 72, 225, 234, 13, 172, 127, 42, 54, 31,
                                   204, 172, 205, 189, 205, 239, 20, 0, 0, 0,
                                   27, 221, 98, 185, 78, 69, 32, 62, 70, 211,
                                   88, 254, 176, 233, 2, 167, 40, 231, 246, 86,
                                   20, 0, 0, 0, 26, 97, 28, 191, 47, 191, 6,
                                   174, 78, 14, 127, 225, 51, 192, 57, 112, 65,
                                   172, 70, 193, 20, 0, 0, 0, 26, 127, 46, 177,
                                   107, 62, 64, 189, 19, 182, 251, 197, 142,
                                   201, 76, 197, 226, 81, 231, 231, 20, 0, 0, 0,
                                   26, 127, 46, 165, 39, 175, 252, 86, 78, 18,
                                   159, 170, 225, 233, 1, 108, 115, 157, 213,
                                   64, 20, 0, 0, 0, 26, 110, 16, 174, 109, 149,
                                   248, 123, 169, 237, 85, 173, 19, 167, 133,
                                   70, 173, 57, 210, 235, 20, 0, 0, 0, 24, 172,
                                   58, 172, 124, 168, 11, 56, 89, 227, 2, 209,
                                   225, 117, 73, 17, 173, 53, 7, 49, 20, 0, 0,
                                   0, 24, 119, 144, 165, 35, 199, 232, 94, 129,
                                   199, 42, 32, 177, 56, 60, 19, 51, 24, 38,
                                   212, 20, 0, 0, 0, 29, 219, 46, 180, 7, 191,
                                   192, 3, 215, 17, 140, 62, 247, 31, 67, 68,
                                   97, 175, 171, 9, 20, 0, 0, 0, 25, 35, 164,
                                   188, 252, 219, 203, 71, 159, 44, 251, 161,
                                   63, 11, 2, 147, 47, 117, 124, 10, 20, 0, 0,
                                   0, 25, 34, 36, 184, 173, 135, 24, 59, 214,
                                   222, 166, 130, 171, 109, 194, 155, 244, 183,
                                   171, 86, 20, 0, 0, 0, 26, 127, 0, 179, 156,
                                   222, 39, 221, 195, 173, 243, 170, 43, 255,
                                   51, 188, 120, 216, 165, 39, 20, 0, 0, 0, 26,
                                   127, 96, 190, 99, 243, 13, 155, 238, 99, 5,
                                   97, 83, 160, 62, 211, 199, 155, 30, 105, 20,
                                   0, 0, 0, 31, 168, 130, 216, 251, 125, 168,
                                   26, 50, 142, 87, 207, 17, 8, 88, 30, 195,
                                   124, 123, 31, 20, 0, 0, 0, 31, 191, 66, 212,
                                   220, 153, 40, 67, 33, 255, 167, 143, 89, 208,
                                   179, 201, 77, 179, 131, 32, 20, 0, 0, 0, 31,
                                   161, 66, 214, 163, 163, 151, 47, 243, 212,
                                   118, 27, 57, 76, 31, 23, 104, 230, 43, 246,
                                   20, 0, 0, 0, 31, 176, 128, 218, 28, 241, 143,
                                   1, 163, 80, 80, 46, 27, 207, 139, 49, 147,
                                   143, 53, 105, 20, 0, 0, 0, 31, 161, 66, 197,
                                   47, 208, 178, 153, 66, 79, 15, 163, 113, 239,
                                   146, 18, 107, 221, 213, 239, 20, 0, 0, 0, 30,
                                   190, 144, 202, 49, 53, 133, 111, 147, 150,
                                   112, 40, 245, 222, 18, 27, 85, 195, 201, 67,
                                   20, 0, 0, 0, 31, 161, 88, 207, 44, 138, 176,
                                   31, 131, 240, 143, 181, 131, 133, 130, 216,
                                   139, 135, 157, 63, 20, 0, 0, 0, 30, 183, 132,
                                   204, 195, 61, 114, 252, 94, 43, 108, 54, 111,
                                   15, 198, 149, 228, 235, 131, 222, 20, 0, 0,
                                   0, 26, 112, 160, 196, 227, 41, 9, 78, 161,
                                   172, 44, 42, 7, 21, 89, 1, 92, 245, 34, 199,
                                   20, 0, 0, 0, 25, 41, 148, 205, 137, 37, 179,
                                   3, 82, 195, 134, 179, 209, 201, 89, 83, 228,
                                   244, 181, 41, 20, 0, 0, 0, 26, 96, 194, 190,
                                   239, 9, 53, 132, 46, 95, 255, 129, 42, 106,
                                   80, 1, 111, 120, 226, 202, 20, 0, 0, 0, 26,
                                   112, 194, 207, 59, 189, 126, 14, 30, 16, 163,
                                   215, 187, 213, 63, 150, 144, 103, 137, 25,
                                   20, 0, 0, 0, 25, 34, 36, 198, 126, 126, 22,
                                   180, 30, 7, 72, 39, 198, 211, 58, 235, 227,
                                   169, 130, 8, 20, 0, 0, 0, 25, 34, 86, 180,
                                   73, 173, 86, 109, 91, 254, 251, 47, 177, 115,
                                   129, 216, 57, 235, 135, 10, 20, 0, 0, 0, 26,
                                   111, 88, 176, 99, 159, 137, 70, 196, 236,
                                   252, 123, 199, 146, 5, 202, 8, 188, 161, 128,
                                   20, 0, 0, 0, 26, 125, 168, 180, 92, 197, 71,
                                   207, 85, 85, 245, 99, 7, 30, 41, 30, 20, 117,
                                   173, 74, 20, 0, 0, 0, 26, 97, 96, 171, 56,
                                   152, 234, 199, 140, 95, 16, 227, 204, 235, 5,
                                   16, 115, 20, 101, 241, 20, 0, 0, 0, 29, 219,
                                   34, 176, 201, 125, 64, 4, 123, 83, 150, 174,
                                   86, 235, 18, 48, 146, 58, 164, 255, 20, 0, 0,
                                   0, 26, 97, 46, 178, 156, 65, 106, 70, 30, 94,
                                   0, 39, 209, 86, 133, 223, 54, 124, 61, 9, 20,
                                   0, 0, 0, 28, 112, 178, 206, 253, 155, 130,
                                   136, 102, 212, 163, 131, 59, 128, 131, 30,
                                   111, 100, 33, 76, 20, 0, 0, 0, 29, 220, 102,
                                   191, 47, 172, 0, 136, 152, 238, 115, 215, 59,
                                   246, 88, 61, 141, 60, 39, 232, 20, 0, 0, 0,
                                   29, 220, 62, 202, 188, 44, 235, 61, 62, 16,
                                   187, 31, 102, 235, 98, 145, 226, 208, 1, 120,
                                   20, 0, 0, 0, 31, 177, 202, 222, 135, 42, 202,
                                   135, 45, 151, 220, 27, 180, 185, 0, 49, 158,
                                   85, 86, 240, 20, 0, 0, 0, 31, 165, 78, 240,
                                   89, 129, 239, 151, 102, 65, 26, 135, 148,
                                   214, 178, 80, 175, 201, 163, 254, 20, 0, 0,
                                   0, 31, 185, 220, 235, 81, 0, 128, 2, 249,
                                   194, 245, 33, 255, 45, 240, 59, 19, 149, 51,
                                   149, 20, 0, 0, 0, 31, 165, 66, 227, 201, 138,
                                   50, 148, 102, 102, 5, 203, 200, 103, 131,
                                   223, 229, 176, 127, 247, 20, 0, 0, 0, 31,
                                   180, 48, 227, 124, 191, 209, 218, 227, 255,
                                   134, 205, 145, 189, 3, 31, 248, 118, 55, 86,
                                   20, 0, 0, 0, 26, 106, 174, 239, 233, 248,
                                   204, 34, 14, 26, 4, 170, 227, 74, 93, 228,
                                   184, 252, 49, 145, 20, 0, 0, 0, 26, 97, 224,
                                   237, 199, 201, 162, 47, 212, 217, 38, 209,
                                   145, 203, 226, 160, 190, 101, 126, 184, 20,
                                   0, 0, 0, 26, 108, 4, 213, 175, 113, 62, 110,
                                   187, 212, 156, 198, 255, 44, 141, 78, 61,
                                   246, 62, 202, 20, 0, 0, 0, 26, 109, 16, 221,
                                   197, 36, 236, 62, 163, 204, 163, 97, 121,
                                   245, 146, 206, 177, 246, 136, 162, 20, 0, 0,
                                   0, 28, 127, 184, 216, 73, 65, 168, 87, 254,
                                   34, 3, 157, 121, 231, 172, 25, 176, 253, 40,
                                   145, 20, 0, 0, 0, 31, 128, 125, 13, 91, 114,
                                   196, 5, 222, 1, 149, 1, 31, 32, 82, 167, 16,
                                   115, 28, 98, 20, 0, 0, 0, 27, 221, 3, 34, 9,
                                   151, 197, 156, 89, 164, 38, 184, 32, 8, 64,
                                   22, 132, 100, 215, 184, 20, 0, 0, 0, 27, 180,
                                   101, 12, 109, 105, 105, 148, 183, 32, 124,
                                   142, 197, 228, 66, 137, 133, 179, 2, 202, 20,
                                   0, 0, 0, 31, 142, 31, 37, 27, 92, 5, 56, 81,
                                   175, 140, 29, 55, 12, 159, 241, 151, 144, 85,
                                   53, 20, 0, 0, 0, 30, 213, 3, 61, 45, 253,
                                   126, 230, 194, 106, 246, 174, 223, 139, 67,
                                   100, 127, 131, 132, 0, 20, 0, 0, 0, 30, 200,
                                   131, 58, 147, 188, 216, 130, 201, 235, 92,
                                   164, 174, 104, 176, 16, 146, 36, 111, 135,
                                   20, 0, 0, 0, 27, 176, 239, 43, 158, 157, 56,
                                   174, 33, 251, 130, 3, 152, 250, 18, 121, 20,
                                   186, 163, 203, 20, 0, 0, 0, 27, 161, 191, 22,
                                   124, 235, 18, 190, 61, 216, 23, 226, 187,
                                   231, 241, 90, 245, 240, 21, 175, 20, 0, 0, 0,
                                   30, 213, 3, 23, 126, 70, 219, 149, 167, 145,
                                   131, 67, 203, 145, 183, 223, 47, 156, 40, 96,
                                   20, 0, 0, 0, 27, 181, 111, 12, 174, 166, 24,
                                   195, 135, 236, 0, 110, 172, 79, 146, 11, 45,
                                   56, 249, 70, 20, 0, 0, 0, 30, 197, 87, 31,
                                   19, 32, 11, 92, 131, 255, 243, 190, 187, 106,
                                   188, 21, 120, 116, 127, 251, 20, 0, 0, 0, 27,
                                   161, 239, 7, 7, 172, 224, 103, 126, 85, 22,
                                   163, 155, 82, 210, 48, 90, 57, 181, 126, 20,
                                   0, 0, 0, 27, 165, 25, 9, 9, 148, 81, 212,
                                   126, 245, 234, 197, 126, 63, 90, 199, 19, 60,
                                   23, 247, 20, 0, 0, 0, 31, 181, 67, 2, 188, 2,
                                   47, 198, 254, 96, 186, 217, 91, 150, 94, 14,
                                   146, 38, 87, 234, 20, 0, 0, 0, 29, 206, 6,
                                   252, 222, 194, 10, 132, 111, 116, 10, 197,
                                   215, 47, 86, 254, 53, 27, 33, 54, 20, 0, 0,
                                   0, 27, 185, 189, 26, 201, 88, 216, 75, 254,
                                   3, 128, 96, 127, 72, 114, 48, 183, 179, 185,
                                   62, 20, 0, 0, 0, 31, 168, 221, 47, 156, 199,
                                   186, 1, 254, 111, 19, 13, 179, 234, 127, 154,
                                   191, 133, 200, 165, 20, 0, 0, 0, 27, 165, 79,
                                   16, 30, 168, 233, 81, 238, 108, 148, 77, 123,
                                   200, 73, 200, 236, 103, 251, 15, 20, 0, 0, 0,
                                   26, 104, 165, 19, 173, 76, 207, 58, 185, 161,
                                   118, 37, 86, 215, 89, 113, 97, 51, 20, 48,
                                   20, 0, 0, 0, 31, 181, 17, 7, 169, 174, 183,
                                   21, 209, 195, 59, 122, 113, 191, 177, 187,
                                   175, 196, 70, 11, 20, 0, 0, 0, 31, 168, 128,
                                   249, 79, 167, 9, 81, 12, 79, 246, 208, 222,
                                   105, 92, 223, 11, 221, 78, 226, 20, 0, 0, 0,
                                   27, 181, 78, 252, 197, 168, 69, 97, 254, 2,
                                   120, 99, 236, 75, 97, 213, 46, 229, 61, 11,
                                   20, 0, 0, 0, 27, 181, 230, 243, 28, 141, 109,
                                   3, 230, 196, 136, 66, 139, 177, 84, 44, 28,
                                   164, 156, 18, 20, 0, 0, 0, 31, 181, 16, 228,
                                   28, 165, 56, 65, 89, 152, 246, 193, 47, 34,
                                   108, 175, 109, 196, 215, 223, 20, 0, 0, 0,
                                   29, 199, 134, 230, 137, 200, 91, 134, 103,
                                   112, 176, 0, 184, 212, 194, 62, 214, 47, 165,
                                   175, 20, 0, 0, 0, 29, 221, 166, 212, 252,
                                   236, 192, 246, 179, 225, 230, 71, 236, 72,
                                   238, 45, 161, 233, 159, 242, 20, 0, 0, 0, 29,
                                   206, 6, 212, 137, 41, 74, 101, 56, 159, 44,
                                   119, 118, 245, 122, 21, 156, 233, 169, 47,
                                   20, 0, 0, 0, 29, 216, 234, 220, 45, 226, 214,
                                   108, 52, 214, 122, 127, 67, 233, 123, 64,
                                   137, 53, 20, 130, 20, 0, 0, 0, 27, 165, 22,
                                   210, 156, 29, 123, 58, 126, 69, 132, 31, 19,
                                   108, 88, 48, 112, 251, 132, 178, 20, 0, 0, 0,
                                   29, 216, 234, 198, 220, 131, 234, 103, 62,
                                   64, 171, 196, 184, 224, 88, 235, 23, 199,
                                   164, 138, 20, 0, 0, 0, 27, 180, 66, 195, 188,
                                   149, 82, 243, 118, 201, 164, 186, 186, 2, 58,
                                   103, 11, 150, 177, 95, 20, 0, 0, 0, 31, 163,
                                   20, 191, 39, 160, 0, 3, 231, 90, 135, 147,
                                   234, 118, 121, 236, 151, 145, 112, 210, 20,
                                   0, 0, 0, 26, 104, 130, 183, 195, 234, 73, 18,
                                   189, 209, 115, 241, 7, 50, 246, 20, 145, 50,
                                   249, 121, 20, 0, 0, 0, 26, 104, 130, 180, 28,
                                   132, 244, 125, 77, 222, 244, 133, 77, 224,
                                   72, 7, 255, 114, 228, 107, 20, 0, 0, 0, 26,
                                   104, 130, 178, 35, 190, 10, 198, 234, 236,
                                   32, 29, 99, 201, 72, 9, 77, 53, 35, 13, 20,
                                   0, 0, 0, 26, 121, 148, 189, 56, 206, 207,
                                   109, 222, 83, 235, 2, 178, 111, 141, 161,
                                   209, 244, 10, 72, 20, 0, 0, 0, 29, 203, 230,
                                   178, 41, 130, 170, 66, 205, 237, 243, 159,
                                   169, 235, 202, 16, 67, 155, 65, 172, 20, 0,
                                   0, 0, 29, 219, 198, 199, 37, 34, 77, 103,
                                   153, 84, 188, 216, 84, 104, 105, 193, 69, 48,
                                   180, 190, 20, 0, 0, 0, 26, 121, 130, 201,
                                   233, 36, 22, 242, 253, 160, 164, 189, 163,
                                   240, 182, 33, 66, 47, 125, 25, 20, 0, 0, 0,
                                   31, 176, 104, 179, 45, 165, 17, 250, 86, 194,
                                   223, 202, 17, 235, 188, 129, 59, 207, 86, 94,
                                   20, 0, 0, 0, 31, 176, 20, 184, 237, 177, 107,
                                   95, 126, 90, 164, 47, 232, 245, 166, 153,
                                   229, 212, 244, 61, 20, 0, 0, 0, 31, 181, 224,
                                   187, 73, 141, 38, 139, 94, 110, 124, 33, 231,
                                   58, 90, 0, 167, 48, 60, 72, 20, 0, 0, 0, 31,
                                   165, 88, 219, 60, 218, 65, 145, 110, 34, 136,
                                   33, 139, 169, 0, 165, 86, 41, 61, 71, 20, 0,
                                   0, 0, 31, 165, 224, 218, 205, 126, 192, 119,
                                   159, 82, 55, 156, 198, 96, 228, 12, 0, 20,
                                   45, 40, 20, 0, 0, 0, 31, 165, 168, 197, 135,
                                   199, 55, 94, 99, 162, 251, 37, 206, 216, 190,
                                   99, 194, 223, 97, 184, 20, 0, 0, 0, 31, 165,
                                   232, 222, 155, 158, 94, 77, 70, 217, 36, 192,
                                   123, 103, 122, 81, 83, 147, 40, 8, 20, 0, 0,
                                   0, 31, 189, 96, 207, 222, 156, 141, 154, 54,
                                   217, 248, 77, 185, 203, 81, 210, 11, 52, 88,
                                   6, 20, 0, 0, 0, 31, 165, 232, 221, 111, 92,
                                   48, 56, 209, 196, 148, 32, 162, 117, 243, 87,
                                   121, 181, 125, 136, 20, 0, 0, 0, 31, 176, 96,
                                   213, 180, 156, 143, 157, 36, 206, 164, 46,
                                   36, 107, 235, 229, 171, 117, 93, 176, 20, 0,
                                   0, 0, 31, 165, 96, 213, 7, 219, 255, 248,
                                   206, 98, 245, 92, 171, 64, 73, 208, 211, 195,
                                   181, 201, 20, 0, 0, 0, 31, 165, 96, 228, 184,
                                   33, 150, 243, 174, 1, 249, 29, 155, 107, 63,
                                   47, 138, 70, 32, 107, 20, 0, 0, 0, 26, 113,
                                   174, 220, 126, 219, 85, 46, 45, 206, 67, 252,
                                   175, 62, 196, 143, 162, 21, 171, 255, 20, 0,
                                   0, 0, 29, 219, 226, 223, 79, 158, 30, 87, 34,
                                   236, 152, 142, 65, 250, 78, 124, 143, 148,
                                   161, 247, 20, 0, 0, 0, 29, 195, 230, 211,
                                   233, 249, 113, 87, 215, 222, 151, 195, 105,
                                   254, 44, 102, 139, 146, 176, 215, 20, 0, 0,
                                   0, 26, 121, 236, 220, 105, 130, 222, 101, 7,
                                   96, 221, 108, 178, 101, 159, 47, 180, 245,
                                   170, 226, 20, 0, 0, 0, 29, 204, 14, 210, 237,
                                   177, 11, 81, 214, 215, 106, 253, 219, 81, 66,
                                   143, 158, 37, 241, 115, 20, 0, 0, 0, 29, 195,
                                   230, 213, 27, 41, 248, 74, 162, 56, 246, 115,
                                   231, 32, 72, 84, 4, 72, 251, 143, 20, 0, 0,
                                   0, 29, 199, 134, 223, 184, 69, 120, 199, 212,
                                   205, 150, 43, 223, 39, 84, 94, 133, 180, 223,
                                   222, 20, 0, 0, 0, 29, 201, 135, 3, 114, 164,
                                   111, 166, 98, 223, 236, 56, 174, 48, 197,
                                   185, 243, 47, 66, 205, 20, 0, 0, 0, 29, 193,
                                   135, 0, 101, 173, 74, 60, 12, 8, 133, 201,
                                   106, 102, 55, 77, 3, 102, 72, 242, 20, 0, 0,
                                   0, 29, 204, 135, 5, 188, 90, 10, 123, 231,
                                   140, 211, 213, 203, 135, 182, 31, 71, 148,
                                   198, 7, 20, 0, 0, 0, 29, 209, 35, 0, 98, 191,
                                   10, 3, 253, 172, 247, 165, 58, 80, 148, 63,
                                   235, 139, 94, 108, 20, 0, 0, 0, 29, 220, 138,
                                   255, 99, 254, 8, 222, 189, 252, 24, 92, 0,
                                   225, 45, 105, 160, 246, 225, 109, 20, 0, 0,
                                   0, 29, 204, 162, 252, 231, 165, 50, 84, 45,
                                   151, 101, 18, 17, 85, 86, 110, 113, 244, 238,
                                   76, 20, 0, 0, 0, 28, 197, 102, 229, 220, 201,
                                   2, 58, 118, 239, 229, 190, 102, 202, 137,
                                   223, 59, 122, 21, 9, 20, 0, 0, 0, 29, 209,
                                   98, 227, 220, 165, 239, 81, 208, 188, 191,
                                   91, 255, 32, 189, 213, 187, 211, 203, 7, 20,
                                   0, 0, 0, 28, 63, 150, 243, 233, 225, 106,
                                   100, 78, 86, 207, 159, 163, 183, 65, 239, 3,
                                   145, 81, 104, 20, 0, 0, 0, 28, 33, 150, 250,
                                   123, 192, 2, 242, 4, 218, 148, 165, 116, 209,
                                   169, 254, 187, 199, 197, 141, 20, 0, 0, 0,
                                   28, 48, 150, 233, 243, 131, 57, 84, 78, 44,
                                   8, 221, 224, 229, 84, 202, 220, 107, 65, 31,
                                   20, 0, 0, 0, 27, 104, 194, 237, 237, 69, 7,
                                   85, 183, 124, 184, 90, 194, 48, 184, 21, 209,
                                   24, 173, 7, 20, 0, 0, 0, 29, 209, 18, 225,
                                   69, 196, 250, 148, 39, 106, 28, 151, 23, 139,
                                   135, 212, 211, 122, 182, 63, 20, 0, 0, 0, 27,
                                   42, 164, 236, 169, 220, 22, 194, 30, 90, 87,
                                   181, 183, 32, 82, 32, 69, 191, 219, 42, 20,
                                   0, 0, 0, 28, 48, 150, 225, 155, 191, 8, 177,
                                   238, 19, 247, 219, 20, 239, 70, 17, 56, 101,
                                   46, 40, 20, 0, 0, 0, 27, 113, 194, 239, 55,
                                   42, 85, 93, 46, 94, 164, 41, 87, 140, 178,
                                   159, 132, 162, 238, 203, 20, 0, 0, 0, 28, 33,
                                   150, 238, 131, 93, 24, 66, 215, 184, 252, 51,
                                   54, 226, 204, 126, 100, 127, 40, 106, 20, 0,
                                   0, 0, 28, 45, 22, 234, 109, 11, 255, 62, 31,
                                   222, 242, 255, 15, 138, 143, 237, 116, 172,
                                   53, 231, 20, 0, 0, 0, 28, 33, 202, 236, 103,
                                   1, 239, 90, 33, 147, 52, 39, 100, 171, 146,
                                   99, 160, 201, 84, 243, 20, 0, 0, 0, 28, 33,
                                   152, 220, 190, 201, 10, 60, 222, 98, 120,
                                   130, 230, 224, 176, 19, 140, 245, 35, 209,
                                   20, 0, 0, 0, 27, 184, 139, 44, 135, 57, 217,
                                   222, 141, 177, 155, 136, 66, 74, 125, 129,
                                   11, 243, 169, 98, 20, 0, 0, 0, 28, 21, 199,
                                   125, 167, 103, 181, 113, 153, 80, 168, 52,
                                   76, 240, 151, 90, 67, 155, 20, 111, 20, 0, 0,
                                   0, 28, 5, 135, 83, 113, 226, 25, 98, 23, 162,
                                   0, 107, 139, 125, 6, 31, 131, 252, 120, 247,
                                   20, 0, 0, 0, 31, 168, 221, 85, 188, 38, 177,
                                   87, 222, 89, 145, 65, 90, 74, 90, 105, 47,
                                   33, 251, 92, 20, 0, 0, 0, 31, 168, 231, 70,
                                   77, 190, 174, 70, 139, 234, 207, 253, 119,
                                   50, 114, 11, 132, 191, 20, 156, 20, 0, 0, 0,
                                   31, 168, 221, 63, 237, 169, 237, 242, 196,
                                   241, 241, 167, 65, 231, 186, 113, 111, 196,
                                   122, 2, 20, 0, 0, 0, 31, 168, 221, 62, 97,
                                   229, 107, 238, 71, 204, 249, 70, 251, 118,
                                   89, 213, 143, 127, 92, 83, 20, 0, 0, 0, 31,
                                   168, 129, 60, 167, 215, 216, 79, 182, 219,
                                   227, 195, 70, 58, 123, 212, 64, 168, 118, 74,
                                   20, 0, 0, 0, 31, 168, 221, 44, 207, 254, 152,
                                   121, 71, 30, 8, 197, 47, 8, 66, 23, 189, 227,
                                   205, 0, 20, 0, 0, 0, 31, 168, 185, 43, 79, 8,
                                   250, 190, 151, 253, 82, 110, 162, 204, 122,
                                   42, 73, 192, 71, 167, 20, 0, 0, 0, 31, 168,
                                   129, 20, 92, 98, 86, 0, 247, 219, 16, 2, 137,
                                   248, 53, 54, 137, 40, 69, 81, 20, 0, 0, 0,
                                   31, 168, 243, 14, 39, 156, 9, 111, 53, 210,
                                   135, 167, 153, 228, 89, 81, 199, 98, 216, 12,
                                   20, 0, 0, 0, 31, 168, 129, 4, 73, 165, 45,
                                   98, 70, 144, 130, 94, 209, 64, 0, 36, 113,
                                   173, 103, 198, 20, 0, 0, 0, 31, 165, 128,
                                   245, 110, 169, 254, 106, 126, 34, 192, 29,
                                   19, 75, 87, 224, 109, 190, 162, 18, 20, 0, 0,
                                   0, 31, 184, 221, 13, 167, 202, 226, 138, 94,
                                   20, 153, 215, 23, 11, 76, 114, 91, 32, 57,
                                   169, 20, 0, 0, 0, 31, 184, 220, 225, 238,
                                   205, 10, 131, 174, 85, 105, 65, 151, 62, 18,
                                   194, 135, 151, 197, 21, 20, 0, 0, 0, 31, 165,
                                   184, 236, 79, 178, 70, 190, 18, 129, 132,
                                   190, 115, 201, 78, 4, 107, 134, 194, 7, 20,
                                   0, 0, 0, 31, 184, 194, 226, 92, 45, 74, 97,
                                   158, 35, 96, 96, 202, 94, 94, 38, 234, 51,
                                   197, 245, 20, 0, 0, 0, 25, 165, 246, 239,
                                   174, 224, 2, 143, 195, 63, 166, 157, 130, 83,
                                   154, 191, 176, 167, 245, 120, 20, 0, 0, 0,
                                   30, 168, 246, 216, 156, 152, 229, 88, 198,
                                   214, 37, 41, 4, 126, 55, 166, 182, 35, 154,
                                   224, 20, 0, 0, 0, 25, 33, 214, 230, 77, 34,
                                   233, 126, 173, 144, 253, 30, 172, 43, 247,
                                   31, 3, 4, 70, 160, 20, 0, 0, 0, 25, 48, 218,
                                   214, 147, 41, 49, 123, 71, 110, 183, 166, 54,
                                   44, 68, 34, 141, 55, 218, 175, 20, 0, 0, 0,
                                   28, 213, 118, 223, 41, 172, 180, 14, 116,
                                   236, 76, 73, 25, 175, 42, 30, 175, 152, 156,
                                   231, 20, 0, 0, 0, 28, 213, 66, 231, 59, 24,
                                   107, 218, 163, 206, 143, 171, 47, 105, 63,
                                   52, 228, 231, 227, 233, 20, 0, 0, 0, 28, 195,
                                   90, 236, 109, 193, 224, 199, 4, 213, 169,
                                   163, 10, 109, 242, 27, 185, 248, 170, 106,
                                   20, 0, 0, 0, 25, 249, 146, 229, 190, 1, 104,
                                   38, 215, 188, 5, 175, 106, 232, 84, 45, 91,
                                   147, 130, 232, 20, 0, 0, 0, 28, 213, 2, 243,
                                   67, 54, 32, 133, 158, 86, 39, 219, 23, 9, 66,
                                   14, 103, 158, 2, 242, 20, 0, 0, 0, 29, 204,
                                   250, 243, 163, 163, 239, 91, 151, 234, 247,
                                   233, 111, 226, 88, 144, 152, 240, 89, 87, 20,
                                   0, 0, 0, 29, 209, 90, 253, 71, 198, 202, 246,
                                   172, 109, 121, 63, 63, 237, 76, 69, 131, 181,
                                   39, 202, 20, 0, 0, 0, 29, 209, 18, 248, 156,
                                   176, 0, 3, 3, 192, 132, 168, 136, 224, 169,
                                   49, 98, 43, 85, 231, 20, 0, 0, 0, 27, 176,
                                   239, 54, 176, 45, 16, 58, 135, 0, 245, 204,
                                   91, 104, 85, 150, 174, 24, 164, 55, 20, 0, 0,
                                   0, 27, 165, 11, 39, 13, 245, 242, 63, 22,
                                   152, 74, 252, 223, 22, 242, 253, 93, 51, 198,
                                   163, 20, 0, 0, 0, 27, 168, 139, 41, 167, 226,
                                   112, 175, 49, 192, 35, 102, 198, 33, 66, 27,
                                   89, 59, 75, 76, 20, 0, 0, 0, 31, 168, 149,
                                   24, 231, 129, 42, 58, 227, 214, 112, 35, 49,
                                   229, 194, 100, 209, 52, 225, 79, 20, 0, 0, 0,
                                   31, 168, 169, 28, 165, 165, 120, 41, 166,
                                   235, 103, 130, 199, 43, 194, 145, 213, 163,
                                   72, 186, 20, 0, 0, 0, 29, 223, 7, 28, 206,
                                   97, 224, 7, 33, 193, 22, 17, 92, 204, 83,
                                   252, 177, 5, 239, 224, 20, 0, 0, 0, 29, 199,
                                   199, 11, 109, 161, 22, 98, 243, 198, 216,
                                   178, 210, 92, 155, 46, 247, 156, 49, 64, 20,
                                   0, 0, 0, 29, 208, 199, 10, 103, 137, 113,
                                   146, 52, 205, 57, 69, 139, 54, 3, 47, 202,
                                   119, 227, 4, 20, 0, 0, 0, 27, 165, 79, 21,
                                   231, 44, 171, 221, 35, 230, 198, 19, 255, 40,
                                   93, 126, 75, 103, 227, 72, 20, 0, 0, 0, 29,
                                   221, 199, 2, 7, 226, 170, 207, 43, 208, 248,
                                   207, 130, 233, 17, 137, 116, 123, 174, 138,
                                   20, 0, 0, 0, 29, 206, 87, 4, 105, 218, 16, 5,
                                   71, 219, 185, 8, 207, 48, 194, 176, 188, 251,
                                   172, 16, 20, 0, 0, 0, 29, 204, 182, 255, 163,
                                   154, 42, 146, 17, 214, 253, 62, 107, 141, 51,
                                   99, 121, 183, 161, 77, 20, 0, 0, 0, 29, 207,
                                   6, 249, 170, 137, 117, 85, 56, 225, 232, 201,
                                   198, 216, 50, 145, 173, 232, 221, 103, 20, 0,
                                   0, 0, 29, 193, 14, 227, 233, 171, 170, 124,
                                   142, 74, 179, 101, 78, 233, 57, 105, 27, 112,
                                   41, 4, 20, 0, 0, 0, 29, 217, 66, 226, 37,
                                   207, 248, 205, 95, 66, 208, 71, 89, 72, 138,
                                   148, 127, 155, 119, 49, 20, 0, 0, 0, 29, 206,
                                   14, 211, 169, 249, 246, 7, 177, 207, 135,
                                   161, 178, 124, 139, 13, 180, 250, 174, 224,
                                   20, 0, 0, 0, 29, 222, 6, 221, 155, 253, 88,
                                   107, 249, 248, 246, 135, 153, 202, 79, 212,
                                   131, 149, 218, 211, 20, 0, 0, 0, 29, 206, 6,
                                   202, 26, 169, 126, 69, 131, 151, 19, 139,
                                   158, 37, 57, 33, 187, 119, 178, 74, 20, 0, 0,
                                   0, 26, 104, 144, 209, 229, 121, 229, 94, 137,
                                   172, 140, 123, 167, 15, 146, 227, 184, 245,
                                   63, 199, 20, 0, 0, 0, 26, 109, 144, 218, 237,
                                   192, 146, 125, 22, 151, 57, 29, 122, 115,
                                   148, 149, 131, 149, 176, 39, 20, 0, 0, 0, 27,
                                   160, 78, 222, 124, 172, 66, 66, 104, 228,
                                   164, 60, 183, 63, 198, 66, 77, 254, 93, 201,
                                   20, 0, 0, 0, 30, 216, 231, 13, 251, 20, 146,
                                   244, 73, 20, 4, 92, 63, 54, 95, 153, 190, 88,
                                   169, 90, 20, 0, 0, 0, 27, 184, 151, 8, 135,
                                   0, 252, 2, 222, 56, 7, 171, 199, 59, 76, 9,
                                   170, 111, 6, 198, 20, 0, 0, 0, 27, 181, 66,
                                   243, 220, 236, 153, 94, 169, 240, 27, 166,
                                   31, 39, 244, 96, 164, 119, 177, 229, 20, 0,
                                   0, 0, 27, 165, 56, 250, 229, 29, 103, 83,
                                   115, 79, 32, 61, 58, 94, 81, 234, 135, 0, 98,
                                   96, 20, 0, 0, 0, 27, 181, 22, 231, 92, 172,
                                   31, 193, 166, 222, 143, 151, 49, 231, 242,
                                   209, 20, 121, 24, 42, 20, 0, 0, 0, 27, 181,
                                   14, 236, 206, 227, 204, 6, 108, 35, 255, 130,
                                   196, 201, 186, 80, 143, 153, 13, 107, 20, 0,
                                   0, 0, 27, 165, 22, 226, 215, 1, 183, 246,
                                   146, 145, 82, 227, 22, 204, 253, 176, 91,
                                   213, 216, 75, 20, 0, 0, 0, 27, 165, 23, 11,
                                   216, 212, 172, 115, 99, 118, 100, 139, 203,
                                   77, 226, 207, 164, 169, 188, 133, 20, 0, 0,
                                   0, 27, 165, 22, 250, 109, 212, 101, 199, 44,
                                   240, 186, 223, 55, 241, 171, 127, 229, 53,
                                   23, 117, 20, 0, 0, 0, 27, 168, 150, 245, 41,
                                   138, 184, 44, 126, 122, 188, 32, 183, 146,
                                   59, 214, 197, 48, 44, 177, 20, 0, 0, 0, 27,
                                   165, 22, 246, 60, 180, 38, 158, 170, 84, 191,
                                   65, 79, 55, 78, 96, 164, 100, 161, 71, 20, 0,
                                   0, 0, 27, 165, 106, 236, 46, 198, 217, 57,
                                   179, 125, 56, 69, 194, 108, 98, 59, 234, 97,
                                   235, 152, 20, 0, 0, 0, 29, 216, 234, 236,
                                   186, 68, 25, 61, 35, 236, 168, 203, 103, 45,
                                   98, 31, 67, 150, 198, 228, 20, 0, 0, 0, 27,
                                   165, 22, 220, 206, 255, 246, 47, 83, 204,
                                   252, 211, 193, 73, 82, 152, 127, 154, 204,
                                   171, 20, 0, 0, 0, 27, 181, 22, 213, 92, 189,
                                   10, 173, 199, 79, 53, 8, 0, 169, 85, 64, 247,
                                   150, 173, 120, 20, 0, 0, 0, 29, 193, 106,
                                   212, 60, 154, 7, 126, 30, 79, 117, 226, 179,
                                   118, 151, 193, 209, 220, 188, 168, 20, 0, 0,
                                   0, 27, 181, 22, 214, 207, 69, 177, 132, 209,
                                   226, 216, 158, 79, 52, 3, 210, 129, 164, 89,
                                   191, 20, 0, 0, 0, 25, 181, 52, 207, 69, 129,
                                   114, 206, 242, 206, 95, 43, 55, 134, 74, 134,
                                   127, 149, 209, 183, 20, 0, 0, 0, 30, 216,
                                   215, 24, 28, 59, 43, 67, 152, 17, 98, 196,
                                   156, 182, 68, 159, 186, 6, 196, 224, 20, 0,
                                   0, 0, 27, 176, 247, 0, 131, 165, 86, 90, 253,
                                   143, 247, 167, 199, 40, 176, 22, 171, 214,
                                   60, 202, 20, 0, 0, 0, 28, 197, 175, 13, 47,
                                   150, 43, 95, 185, 208, 121, 1, 102, 9, 58,
                                   150, 184, 185, 23, 216, 20, 0, 0, 0, 27, 184,
                                   230, 245, 94, 150, 88, 110, 242, 193, 21, 54,
                                   124, 94, 197, 106, 94, 235, 41, 12, 20, 0, 0,
                                   0, 30, 216, 166, 238, 111, 216, 72, 249, 71,
                                   108, 202, 190, 21, 209, 87, 192, 187, 209,
                                   26, 11, 20, 0, 0, 0, 30, 197, 198, 213, 5,
                                   201, 208, 125, 142, 80, 115, 129, 99, 245,
                                   86, 10, 105, 56, 129, 43, 20, 0, 0, 0, 27,
                                   177, 228, 219, 28, 156, 56, 171, 75, 172,
                                   244, 60, 54, 248, 58, 81, 83, 127, 127, 138,
                                   20, 0, 0, 0, 27, 177, 220, 250, 125, 180,
                                   210, 18, 70, 163, 246, 10, 182, 36, 182, 17,
                                   147, 128, 128, 154, 20, 0, 0, 0, 31, 168,
                                   228, 230, 37, 129, 115, 81, 82, 205, 215,
                                   239, 11, 226, 17, 212, 229, 60, 158, 8, 20,
                                   0, 0, 0, 27, 165, 78, 213, 248, 170, 182, 66,
                                   255, 95, 79, 215, 37, 239, 69, 211, 15, 215,
                                   145, 115, 20, 0, 0, 0, 31, 168, 180, 239, 18,
                                   174, 234, 53, 126, 25, 103, 150, 199, 22,
                                   169, 25, 25, 54, 38, 50, 20, 0, 0, 0, 31,
                                   181, 58, 228, 141, 36, 88, 110, 117, 250,
                                   153, 83, 183, 12, 23, 254, 128, 122, 210, 0,
                                   20, 0, 0, 0, 31, 181, 80, 215, 120, 190, 17,
                                   62, 127, 87, 54, 170, 152, 166, 152, 127,
                                   195, 198, 255, 224, 20, 0, 0, 0, 26, 97, 164,
                                   197, 183, 158, 45, 107, 89, 80, 179, 197,
                                   195, 118, 63, 213, 113, 49, 37, 135, 20, 0,
                                   0, 0, 29, 220, 102, 205, 104, 43, 25, 251,
                                   87, 82, 21, 101, 137, 75, 61, 90, 187, 116,
                                   233, 83, 20, 0, 0, 0, 26, 97, 16, 192, 73,
                                   221, 63, 2, 46, 82, 124, 129, 106, 45, 130,
                                   171, 253, 62, 18, 108, 20, 0, 0, 0, 31, 103,
                                   130, 223, 188, 66, 7, 85, 45, 212, 80, 12,
                                   115, 246, 147, 240, 148, 118, 84, 190, 20, 0,
                                   0, 0, 27, 125, 132, 222, 200, 70, 9, 79, 55,
                                   226, 195, 66, 138, 95, 84, 86, 235, 122, 90,
                                   70, 20, 0, 0, 0, 31, 96, 194, 222, 123, 216,
                                   94, 194, 61, 144, 247, 165, 243, 137, 72,
                                   143, 216, 248, 243, 39, 20, 0, 0, 0, 24, 97,
                                   186, 222, 197, 161, 7, 254, 128, 255, 242,
                                   161, 87, 177, 177, 15, 232, 12, 171, 24, 20,
                                   0, 0, 0, 28, 112, 218, 223, 5, 89, 103, 68,
                                   244, 158, 213, 95, 151, 122, 56, 81, 51, 134,
                                   174, 71, 20, 0, 0, 0, 28, 112, 218, 206, 208,
                                   135, 9, 74, 35, 215, 232, 172, 8, 169, 85,
                                   191, 210, 88, 161, 7, 20, 0, 0, 0, 24, 106,
                                   154, 205, 169, 242, 88, 247, 50, 110, 156,
                                   131, 163, 235, 194, 219, 13, 229, 37, 103,
                                   20, 0, 0, 0, 28, 112, 168, 206, 207, 94, 70,
                                   137, 14, 16, 99, 195, 47, 62, 67, 213, 216,
                                   255, 159, 57, 20, 0, 0, 0, 25, 250, 66, 202,
                                   227, 97, 3, 28, 238, 60, 207, 252, 0, 145,
                                   193, 236, 233, 249, 125, 71, 20, 0, 0, 0, 29,
                                   215, 22, 222, 222, 2, 233, 110, 126, 110, 36,
                                   143, 63, 62, 99, 197, 249, 177, 168, 200, 20,
                                   0, 0, 0, 28, 62, 52, 197, 72, 138, 43, 7, 99,
                                   210, 164, 1, 55, 113, 20, 107, 202, 104, 254,
                                   41, 20, 0, 0, 0, 24, 96, 154, 218, 92, 164,
                                   255, 201, 132, 243, 225, 22, 151, 22, 192,
                                   177, 44, 107, 92, 8, 20, 0, 0, 0, 28, 112,
                                   250, 201, 124, 168, 235, 5, 227, 210, 132,
                                   22, 47, 181, 175, 208, 187, 149, 31, 64, 20,
                                   0, 0, 0, 24, 126, 150, 206, 143, 171, 25, 21,
                                   17, 165, 246, 164, 58, 41, 68, 21, 152, 117,
                                   40, 0>>,
                         case goodvoice:submit(Summary, Voice, Time, Role) of
                             {ok, NewRole, _SongId, Msg} ->
                                 logger:debug("提交成功 声音Id ~w",
                                              [_SongId],
                                              gm_cmd,
                                              613),
                                 notice:return(Msg),
                                 {ok, NewRole};
                             {false, Reason} ->
                                 notice:return(Reason),
                                 ok
                         end
                 end},
     #gm_cmd{cmd = "查看开服时间", args = [], desc = "查看当前服务器开服时间",
             do =
                 fun ([], _Role) ->
                         {reply,
                          util:flist("~w",
                                     [date:seconds_to_datetime(env:srv_open_time())])}
                 end},
     #gm_cmd{cmd = "设储存经验", args = [{int, "经验", 10}],
             desc = "设储存经验",
             do =
                 fun ([Val], Role = #role{assets = Assets}) ->
                         NRole = Role#role{assets =
                                               Assets#assets{reserve_exp =
                                                                 Val}},
                         role_gain:push_exp(NRole),
                         {ok, NRole}
                 end},
     #gm_cmd{cmd = "设宠物技能", args = [{string, "技能列表", []}],
             desc = "设置宠物技能",
             do =
                 fun ([SkillIds], Role) ->
                         case util:string_to_term(SkillIds) of
                             {error, Err} ->
                                 {reply, util:flist("命令的参数格式不正确: ~w", [Err])};
                             {ok, Data} ->
                                 logger:debug("Data:~w", [Data], gm_cmd, 654),
                                 case pet_skill:gm_study(Data, Role) of
                                     {ok, NewRole} -> {ok, NewRole};
                                     {false, Reason} -> {reply, Reason}
                                 end
                         end
                 end},
     #gm_cmd{cmd = "设宠物寿命", args = [{int, "寿命", 80}],
             desc = "设置宠物寿命",
             do =
                 fun ([Val],
                      Role = #role{m_pet = Mpet = #m_pet{pets = Pets}}) ->
                         case lists:keyfind(1, #pet.status, Pets) of
                             Pet = #pet{id = PetId} ->
                                 Pet1 = Pet#pet{happy = Val},
                                 NewPets = lists:keystore(PetId,
                                                          #pet.id,
                                                          Pets,
                                                          Pet1),
                                 Role1 = Role#role{m_pet =
                                                       Mpet#m_pet{pets =
                                                                      NewPets}},
                                 pet:push_10502(Role1, Pet1),
                                 {ok, Role1};
                             _ -> {reply, lang:get("没有找到出战宠物")}
                         end
                 end},
     #gm_cmd{cmd = "守护测试包", args = [], desc = "获取守护测试包",
             do =
                 fun ([], Role) ->
                         GL = format:val_to_gain([{90000, 0, 1000000},
                                                  {90001, 0, 1000000},
                                                  {90002, 0, 1000000},
                                                  {90003, 0, 1000000}]),
                         case role_gain:do(GL, Role) of
                             {false, G} -> {reply, G#gain.msg};
                             {ok, NewRole} -> {ok, NewRole}
                         end
                 end},
     #gm_cmd{cmd = "守护品质",
             args = [{int, "守护Id", 1014}, {int, "品质", 1}],
             desc = "修改守护品质",
             do =
                 fun ([BaseId, NewQ],
                      Role = #role{m_guard =
                                       MG = #m_guard{guards = Guards}}) ->
                         logger:debug("守护baseId ~w", [BaseId], gm_cmd, 706),
                         case lists:keyfind(BaseId, #guard.base_id, Guards) of
                             Guard = #guard{astroid = Astroid} ->
                                 case guard_data:get_astroid_upgrade({BaseId,
                                                                      NewQ})
                                     of
                                     #{skills := Skills, attrs := Attrs} ->
                                         Guard1 = Guard#guard{quality = NewQ,
                                                              astroid =
                                                                  Astroid#guard_astroid{attrs
                                                                                            =
                                                                                            Attrs,
                                                                                        skills
                                                                                            =
                                                                                            Skills}},
                                         Guard2 = guard_attr:calc(Guard1, Role),
                                         Role1 = Role#role{m_guard =
                                                               MG#m_guard{guards
                                                                              =
                                                                              lists:keyreplace(BaseId,
                                                                                               #guard.base_id,
                                                                                               Guards,
                                                                                               Guard2)}},
                                         guard_astroid:push(Role1, Guard2),
                                         guard_api:push_guard(Role, Guard2),
                                         NewRole = attr:calc_and_push(Role1),
                                         {ok, NewRole};
                                     _ ->
                                         notice:send(Role,
                                                     1,
                                                     lang:get("该品质不存在")),
                                         ok
                                 end;
                             _ ->
                                 notice:send(Role, 1, lang:get("该守护不存在")),
                                 ok
                         end
                 end},
     #gm_cmd{cmd = "攻城战下阶段", args = [], desc = "攻城战下阶段",
             do =
                 fun ([], _Role) ->
                         big_world:cast(c_guild_siege_mgr, m, [timeout]),
                         ok
                 end},
     #gm_cmd{cmd = "斗兽棋下阶段", args = [], desc = "斗兽棋下阶段",
             do =
                 fun ([], _Role) ->
                         camp_animal_chess_mgr:m(),
                         ok
                 end},
     #gm_cmd{cmd = "斗兽棋跨服下阶段", args = [], desc = "斗兽棋跨服下阶段",
             do =
                 fun ([], _Role) ->
                         camp_animal_chess_mgr:m1(),
                         ok
                 end},
     #gm_cmd{cmd = "龙凤棋下阶段", args = [], desc = "龙凤棋下阶段",
             do =
                 fun ([], _Role) ->
                         camp_black_white_chess_mgr:m(),
                         ok
                 end},
     #gm_cmd{cmd = "龙凤棋跨服下阶段", args = [], desc = "龙凤棋跨服下阶段",
             do =
                 fun ([], _Role) ->
                         camp_black_white_chess_mgr:m1(),
                         ok
                 end},
     #gm_cmd{cmd = "龙凤棋清除次数", args = [], desc = "龙凤棋清除次数",
             do =
                 fun ([], Role) ->
                         {ok, camp_black_white_chess_mgr:clear_times(Role)}
                 end},
     #gm_cmd{cmd = "龙凤棋清段位", args = [], desc = "龙凤棋清段位",
             do =
                 fun ([],
                      Role = #role{m_campaign =
                                       MC = #m_campaign{camp_black_white_chess =
                                                            CBWC}}) ->
                         NCBWC = CBWC#m_black_white_chess{grade = 1, score = 0,
                                                          all_score = 0},
                         NMC = MC#m_campaign{camp_black_white_chess = NCBWC},
                         NewRole = Role#role{m_campaign = NMC},
                         {ok, NewRole}
                 end},
     #gm_cmd{cmd = "龙凤棋段位和分数",
             args = [{int, "段位", 1}, {int, "积分", 0}],
             desc = "龙凤棋设置段位和分数",
             do =
                 fun ([Grade, Score],
                      Role = #role{m_campaign =
                                       MC = #m_campaign{camp_black_white_chess =
                                                            CBWC}}) ->
                         logger:debug("目标段位和分数：~w，~w",
                                      [Grade, Score],
                                      gm_cmd,
                                      820),
                         case Grade >= 1 andalso Grade =< 30 of
                             true ->
                                 NewAllScore = lists:sum([maps:get(next_grade,
                                                                   camp_black_white_chess_data:get_score(I))
                                                          || I
                                                                 <- lists:seq(1,
                                                                              Grade)]),
                                 GradeScore = maps:get(next_grade,
                                                       camp_black_white_chess_data:get_score(Grade)),
                                 case Score > 0 andalso Score =< GradeScore of
                                     true ->
                                         NCBWC = CBWC#m_black_white_chess{grade
                                                                              =
                                                                              Grade,
                                                                          score
                                                                              =
                                                                              Score,
                                                                          all_score
                                                                              =
                                                                              NewAllScore};
                                     false ->
                                         NCBWC = CBWC#m_black_white_chess{grade
                                                                              =
                                                                              Grade,
                                                                          score
                                                                              =
                                                                              0,
                                                                          all_score
                                                                              =
                                                                              NewAllScore}
                                 end,
                                 NMC = MC#m_campaign{camp_black_white_chess =
                                                         NCBWC},
                                 NewRole = Role#role{m_campaign = NMC},
                                 {ok, NewRole};
                             _ ->
                                 notice:send(Role, 1, lang:get("输入的参数有误")),
                                 {ok, Role}
                         end
                 end},
     #gm_cmd{cmd = "清空守护", args = [], desc = "清空守护数据",
             do =
                 fun ([], Role) -> {ok, Role#role{m_guard = #m_guard{}}}
                 end},
     #gm_cmd{cmd = "清空邮件", args = [], desc = "清空邮件",
             do =
                 fun ([], Role) -> {ok, Role#role{m_mail = []}} end},
     #gm_cmd{cmd = "清空藏宝图", args = [], desc = "清空藏宝图",
             do =
                 fun ([], Role = #role{m_quest = Mquest}) ->
                         {ok,
                          Role#role{m_quest =
                                        Mquest#m_quest{quest_treasure =
                                                           #quest_treasure{}}}}
                 end},
     #gm_cmd{cmd = "终止战斗", args = [], desc = "终止当前战斗",
             do =
                 fun ([],
                      #role{m_combat = #m_combat{pid = CombatPid}}) ->
                         case is_pid(CombatPid) of
                             true -> CombatPid ! stop;
                             false -> ignore
                         end,
                         ok
                 end},
     #gm_cmd{cmd = "战斗站位", args = [], desc = "打印当前战斗站位",
             do =
                 fun ([],
                      #role{m_combat = #m_combat{pid = CombatPid}}) ->
                         case is_pid(CombatPid) of
                             true -> CombatPid ! print_pos;
                             false -> ignore
                         end,
                         ok
                 end},
     #gm_cmd{cmd = "终止战斗结算", args = [], desc = "终止当前战斗",
             do =
                 fun ([],
                      #role{m_combat = #m_combat{pid = CombatPid}}) ->
                         case is_pid(CombatPid) of
                             true -> CombatPid ! stop_result;
                             false -> ignore
                         end,
                         ok
                 end},
     #gm_cmd{cmd = "变神器", args = [], desc = "隐藏命令",
             do =
                 fun ([],
                      Role = #role{p_eqm = Peqm = #package{items = Items}}) ->
                         case lists:keyfind(1, #item.id, Items) of
                             false -> ok;
                             Item ->
                                 Attr = [#attr_base{type = 2, name = 4,
                                                    calc_type = 1,
                                                    val = 9999999},
                                         #attr_base{type = 2, name = 5,
                                                    calc_type = 1,
                                                    val = 9999999},
                                         #attr_base{type = 2, name = 3,
                                                    calc_type = 1, val = 99999},
                                         #attr_base{type = 2, name = 6,
                                                    calc_type = 1, val = 99999},
                                         #attr_base{type = 2, name = 7,
                                                    calc_type = 1,
                                                    val = 99999}],
                                 NewItem = Item#item{attr = Attr},
                                 NewItems = lists:keystore(1,
                                                           #item.id,
                                                           Items,
                                                           NewItem),
                                 NewPeqm = Peqm#package{items = NewItems},
                                 Role1 = Role#role{p_eqm = NewPeqm},
                                 Role2 = attr:calc_and_push(Role1),
                                 {ok, Role2}
                         end
                 end},
     #gm_cmd{cmd = "变速度", args = [{int, "出手速度", 0}],
             desc = "隐藏命令",
             do =
                 fun ([Val],
                      Role = #role{p_eqm = Peqm = #package{items = Items}}) ->
                         case lists:keyfind(1, #item.id, Items) of
                             false -> ok;
                             Item ->
                                 Attr = [#attr_base{type = 2, name = 3,
                                                    calc_type = 1, val = Val}],
                                 NewItem = Item#item{attr = Attr},
                                 NewItems = lists:keystore(1,
                                                           #item.id,
                                                           Items,
                                                           NewItem),
                                 NewPeqm = Peqm#package{items = NewItems},
                                 Role1 = Role#role{p_eqm = NewPeqm},
                                 Role2 = attr:calc_and_push(Role1),
                                 {ok, Role2}
                         end
                 end},
     #gm_cmd{cmd = "清空宝图", args = [], desc = "清空宝图",
             do =
                 fun ([], Role) ->
                         Role1 = Role#role{m_treasure = #m_treasure{}},
                         treasure:push_13600(Role1),
                         {ok, Role1}
                 end},
     #gm_cmd{cmd = "禁言",
             args =
                 [{int, "玩家id", 0},
                  {int, "时间", 0},
                  {string, "隐藏信息", "GM命令"},
                  {string, "信息", "GM命令"}],
             desc = "禁言",
             do =
                 fun ([Id, Time, Hide, Msg],
                      _Role = #role{id = {RoleId, _, _}, name = Name}) ->
                         case Id == 0 orelse Id == RoleId of
                             true -> {reply, "输入角色id，不是是自己哦"};
                             _ ->
                                 Platform = env:get(platform),
                                 ZoneId = env:get(zone_id),
                                 NewId = case Id == 0 of
                                             true -> RoleId;
                                             _ -> Id
                                         end,
                                 adm:silent([{NewId, Platform, ZoneId}],
                                            Time,
                                            Hide,
                                            Msg,
                                            Name),
                                 ok
                         end
                 end},
     #gm_cmd{cmd = "封号",
             args =
                 [{int, "玩家id", 0},
                  {int, "时间", 0},
                  {string, "信息", "GM命令"}],
             desc = "封号",
             do =
                 fun ([Id, Time, Msg],
                      _Role = #role{id = {RoleId, _, _}, name = Name}) ->
                         case Id == 0 orelse Id == RoleId of
                             true -> {reply, "输入角色id，不是是自己哦"};
                             _ ->
                                 Platform = env:get(platform),
                                 ZoneId = env:get(zone_id),
                                 NewId = case Id == 0 of
                                             true -> RoleId;
                                             _ -> Id
                                         end,
                                 adm:lock([{NewId, Platform, ZoneId}],
                                          Time,
                                          Msg,
                                          Name),
                                 ok
                         end
                 end},
     #gm_cmd{cmd = "解禁", args = [{int, "玩家id", 0}],
             desc = "解禁",
             do =
                 fun ([Id],
                      _Role = #role{id = {RoleId, _, _}, name = Name}) ->
                         case Id == 0 orelse Id == RoleId of
                             true -> {reply, "输入角色id，不是是自己哦"};
                             _ ->
                                 Platform = env:get(platform),
                                 ZoneId = env:get(zone_id),
                                 NewId = case Id == 0 of
                                             true -> RoleId;
                                             _ -> Id
                                         end,
                                 adm:unlock([{NewId, Platform, ZoneId}], Name),
                                 ok
                         end
                 end},
     #gm_cmd{cmd = "弹幕", args = [], desc = "弹幕",
             do =
                 fun ([], #role{name = Name}) ->
                         notice:cast(all,
                                     9,
                                     notice:format(lang:get("~ts 来一波弹幕"),
                                                   [{role_2, Name}])),
                         ok
                 end},
     #gm_cmd{cmd = "完成师徒日常", args = [], desc = "完成师徒日常",
             do =
                 fun ([], Role) ->
                         {ok, NewRole} = teacher:gm(Role, finish_daily),
                         {ok, NewRole}
                 end},
     #gm_cmd{cmd = "孩子成长", args = [], desc = "孩子成长",
             do =
                 fun ([], Role) ->
                         case child_infant:gm_study(Role) of
                             {ok, NewRole} -> {ok, NewRole};
                             {false, Reason} -> {reply, Reason}
                         end
                 end},
     #gm_cmd{cmd = "清空师徒", args = [], desc = "清空师徒",
             do =
                 fun ([], Role) ->
                         NewRole = Role#role{m_teacher = teacher:init()},
                         teacher:push(NewRole),
                         {ok, NewRole}
                 end},
     #gm_cmd{cmd = "师徒日常后退", args = [], desc = "师徒日常后退",
             do =
                 fun ([], Role) ->
                         {ok, NewRole} = teacher:gm(Role, daily_before),
                         {ok, NewRole}
                 end},
     #gm_cmd{cmd = "徒弟贡献", args = [{int, "贡献良师值", 0}],
             desc = "徒弟贡献",
             do =
                 fun ([Int], Role) ->
                         {ok, NewRole} = teacher:gm(Role, {student_score, Int}),
                         {ok, NewRole}
                 end},
     #gm_cmd{cmd = "lookup",
             args =
                 [{string, "字段名", "m_skill"}, {int, "二级字段位置(0为所有)", 0}],
             desc = "查看角色数据",
             do =
                 fun ([Filed, Pos], Role) ->
                         F = list_to_atom(Filed),
                         L = lists:zip([record_name | record_info(fields,
                                                                  role)],
                                       tuple_to_list(Role)),
                         case lists:keyfind(F, 1, L) of
                             {_, Val} when Pos =:= 0 ->
                                 logger:debug("角色~ts数据 ~w",
                                              [Filed, Val],
                                              gm_cmd,
                                              1096),
                                 {reply,
                                  util:flist("~ts ==> ~w", [Filed, Val])};
                             {_, Val} ->
                                 logger:debug("角色~ts数据 ~w",
                                              [Filed, element(Pos, Val)],
                                              gm_cmd,
                                              1099),
                                 {reply,
                                  util:flist("~ts ==> ~w",
                                             [Filed, element(Pos, Val)])};
                             _ -> {reply, "查找不到内容"}
                         end
                 end},
     #gm_cmd{cmd = "加经验", args = [{int, "值", 0}],
             desc = "增加角色经验",
             do =
                 fun ([Val], Role) ->
                         case role_gain:do_notice([#gain{label = exp,
                                                         val = Val}],
                                                  Role)
                             of
                             {false, G} -> {reply, G#gain.msg};
                             {ok, NewRole} -> {ok, NewRole}
                         end
                 end},
     #gm_cmd{cmd = "加同心值", args = [{int, "值", 0}],
             desc = "加同心值",
             do =
                 fun ([Val], Role) ->
                         Evt = #evt_camp_7_7th_point{val = Val},
                         {ok, role_trigger:fire(Evt, Role)}
                 end},
     #gm_cmd{cmd = "七夕劈腿", args = [], desc = "七夕劈腿",
             do = fun ([], Role) -> camp_7_7th_mgr:pitui(Role) end},
     #gm_cmd{cmd = "七夕棒打鸳鸯", args = [],
             desc = "七夕棒打鸳鸯,所有对碰的关系全部清除",
             do =
                 fun ([], _Role) ->
                         camp_7_7th_mgr:init_link(),
                         camp_7_7th_mgr:relogin()
                 end},
     #gm_cmd{cmd = "清空充值转盘", args = [], desc = "",
             do =
                 fun ([], Role) -> camp_recharge:gm_clear(Role) end},
     #gm_cmd{cmd = "清空充值礼包", args = [], desc = "",
             do =
                 fun ([], Role) -> camp_recharge_gift:gm_clear(Role)
                 end},
     #gm_cmd{cmd = "测试坐骑幻化", args = [], desc = "增加角色经验",
             do =
                 fun ([], Role) ->
                         mount:adm_show(Role),
                         ok
                 end},
     #gm_cmd{cmd = "测试坐骑幻化", args = [], desc = "增加角色经验",
             do =
                 fun ([], Role) ->
                         mount:adm_show(Role),
                         ok
                 end},
     #gm_cmd{cmd = "新手坐骑到期", args = [], desc = "",
             do =
                 fun ([], Role) ->
                         mount:gm_expire(Role),
                         ok
                 end},
     #gm_cmd{cmd = "坐骑升级",
             args = [{int, "第几只坐骑", 1}, {int, "生多少级", 1}],
             desc = "坐骑升级",
             do =
                 fun ([Index, Lev], Role) ->
                         mount:gm_levelUp(Index, Lev, Role)
                 end},
     #gm_cmd{cmd = "设职业", args = [{int, "值", 1}],
             desc = "设置当前角色的职业[]",
             do =
                 fun ([Val],
                      Role = #role{pid = Pid,
                                   p_eqm = Peqm = #package{items = Items}}) ->
                         case Val >= 1 andalso Val =< 5 of
                             true ->
                                 Role1 = Role#role{p_eqm =
                                                       Peqm#package{items =
                                                                        []}},
                                 package:push_item_info(del,
                                                        Role1,
                                                        [{3, Items}]),
                                 NRole = attr:calc_and_push(Role1#role{classes =
                                                                           Val}),
                                 NewRole = NRole#role{m_skill =
                                                          #m_skill{skills =
                                                                       []}},
                                 {ok,
                                  NewRole1 = #role{m_skill =
                                                       #m_skill{skills =
                                                                    Skills}}} =
                                     skill:login(NewRole),
                                 role:pack_send(Pid, 10800, {Skills, []}),
                                 attr:push_10000(NewRole1),
                                 map:role_update(NewRole1),
                                 {ok, NewRole1};
                             false -> {reply, lang:get("非法职业")}
                         end
                 end},
     #gm_cmd{cmd = "设银币", args = [{int, "值", 1}],
             desc = "设置银币",
             do =
                 fun ([Val],
                      Role = #role{assets = Assets, pid = _Pid}) ->
                         NewAssets = Assets#assets{coin = Val},
                         Role1 = Role#role{assets = NewAssets},
                         role_gain:push_assets(Role1),
                         {ok, Role1}
                 end},
     #gm_cmd{cmd = "设金币", args = [{int, "值", 1}],
             desc = "设置金币",
             do =
                 fun ([Val],
                      Role = #role{assets = Assets, pid = _Pid}) ->
                         NewAssets = Assets#assets{gold_bind = Val},
                         Role1 = Role#role{assets = NewAssets},
                         role_gain:push_assets(Role1),
                         {ok, Role1}
                 end},
     #gm_cmd{cmd = "设钻石", args = [{int, "值", 1}],
             desc = "设置钻石",
             do =
                 fun ([Val],
                      Role = #role{assets = Assets, pid = _Pid}) ->
                         NewAssets = Assets#assets{gold = Val},
                         Role1 = Role#role{assets = NewAssets},
                         role_gain:push_assets(Role1),
                         {ok, Role1}
                 end},
     #gm_cmd{cmd = "加宠物经验", args = [{int, "值", 0}],
             desc = "增加宠物经验",
             do =
                 fun ([Val], Role) ->
                         case role_gain:do([#gain{label = pet_exp, val = Val}],
                                           Role)
                             of
                             {false, G} -> {reply, G#gain.msg};
                             {ok, NewRole} -> {ok, NewRole}
                         end
                 end},
     #gm_cmd{cmd = "设宠物等级", args = [{int, "值", 0}],
             desc = "设置出战宠物等级",
             do =
                 fun ([Val],
                      Role = #role{m_pet = Mpet = #m_pet{pets = Pets}}) ->
                         case lists:keyfind(1, #pet.status, Pets) of
                             Pet = #pet{id = PetId, pet_attr = PetAttr} ->
                                 NewPetAttr = PetAttr#pet_attr{p_str = 2,
                                                               p_con = 2,
                                                               p_mag = 2,
                                                               p_agi = 2,
                                                               p_end = 2,
                                                               point = 0},
                                 NewPet = Pet#pet{lev = 1, exp = 0,
                                                  pet_attr = NewPetAttr},
                                 NewPets = lists:keystore(PetId,
                                                          #pet.id,
                                                          Pets,
                                                          NewPet),
                                 Role1 = Role#role{m_pet =
                                                       Mpet#m_pet{pets =
                                                                      NewPets}},
                                 Lev = max(1, Val),
                                 pet:gm_set_pet_lev(Role1, Lev);
                             _ -> {reply, lang:get("没有找到出战宠物")}
                         end
                 end},
     #gm_cmd{cmd = "技能", args = [{int, "值", 1}],
             desc = "学习角色全部技能",
             do =
                 fun ([Val],
                      Role = #role{m_skill =
                                       MSkill = #m_skill{skills = Skills}}) ->
                         NewSkills = [{SkillId, Val} || {SkillId, _} <- Skills],
                         NewRole = Role#role{m_skill =
                                                 MSkill#m_skill{skills =
                                                                    NewSkills}},
                         role:link_send(NewRole, 10800, {NewSkills, []}),
                         {ok, NewRole}
                 end},
     #gm_cmd{cmd = "单个技能",
             args = [{int, "技能id"}, {int, "等级", 1}],
             desc = "学习角色单个技能",
             do =
                 fun ([SkillId, Lev],
                      Role = #role{m_skill =
                                       MSkill = #m_skill{skills = Skills}}) ->
                         case lists:keyfind(SkillId, 1, Skills) of
                             {_, _} ->
                                 NewSkills = lists:keystore(SkillId,
                                                            1,
                                                            Skills,
                                                            {SkillId, Lev}),
                                 NewRole = Role#role{m_skill =
                                                         MSkill#m_skill{skills =
                                                                            NewSkills}},
                                 role:link_send(NewRole, 10800, {NewSkills}),
                                 {ok, NewRole};
                             _ -> {false, "无法学习其他职业的技能"}
                         end
                 end},
     #gm_cmd{cmd = "获取宠物",
             args = [{int, "值", 10001}, {int, "等级", 1}],
             desc = "获得一只宠物",
             do =
                 fun ([Val, Lev], Role) ->
                         case pet:create(Role,
                                         #{base_id => Val, lev => Lev,
                                           from => "GM"})
                             of
                             {ok, NewRole} -> {ok, NewRole};
                             {false, Reason} -> {false, Reason}
                         end
                 end},
     #gm_cmd{cmd = "清空宠物", args = [], desc = "",
             do =
                 fun ([],
                      Role = #role{m_pet = Mpet = #m_pet{pets = OldPets}}) ->
                         NewMpet = Mpet#m_pet{pets = [], next_id = 1},
                         NewRole = Role#role{m_pet = NewMpet},
                         lists:foreach(fun (#pet{id = PetId}) ->
                                               role:link_send(Role,
                                                              10522,
                                                              {PetId, 1, ""})
                                       end,
                                       OldPets),
                         {ok, NewRole}
                 end},
     #gm_cmd{cmd = "清空背包", args = [], desc = "清空背包",
             do =
                 fun ([],
                      Role = #role{p_bag =
                                       Bag = #package{volume = Volume,
                                                      type = Type,
                                                      items = Items}}) ->
                         package:push_item_info(del, Role, [{Type, Items}]),
                         {ok,
                          Role#role{p_bag =
                                        Bag#package{items = [],
                                                    free_cell =
                                                        lists:seq(1, Volume)}}}
                 end},
     #gm_cmd{cmd = "清空装备", args = [], desc = "清空装备",
             do =
                 fun ([],
                      Role = #role{p_eqm = Eqm = #package{items = Items}}) ->
                         package:push_item_info(del, Role, [{3, Items}]),
                         {ok, Role#role{p_eqm = Eqm#package{items = []}}}
                 end},
     #gm_cmd{cmd = "获取野生宠物",
             args = [{int, "值", 10001}, {int, "数量", 30}],
             desc = "获得野生宠物",
             do =
                 fun ([Val, Num], Role) ->
                         F = fun (_, Role0) ->
                                     case pet:create(Role0,
                                                     #{base_id => Val,
                                                       genre => 3,
                                                       from => "GM"})
                                         of
                                         {ok, NewRole} -> NewRole;
                                         {false, _} -> Role0
                                     end
                             end,
                         {ok, lists:foldl(F, Role, lists:seq(1, Num))}
                 end},
     #gm_cmd{cmd = "设等级", args = [{int, "值", 20}],
             desc = "设置当前角色的等级",
             do =
                 fun ([Val],
                      Role = #role{lev = OldLev, assets = Assets}) ->
                         case Val > 120 orelse Val < 1 of
                             true -> {reply, "参数非法"};
                             false ->
                                 ResetPointRole = case attr:do_reset_point(Role,
                                                                           true)
                                                      of
                                                      {ok,
                                                       _ResetPointRole,
                                                       _} ->
                                                          _ResetPointRole;
                                                      _ -> Role
                                                  end,
                                 Role1 = ResetPointRole#role{lev = Val,
                                                             assets =
                                                                 Assets#assets{exp
                                                                                   =
                                                                                   0},
                                                             is_gain = true},
                                 case Val >= OldLev of
                                     true ->
                                         role_gain:push_exp(Role1),
                                         {ok, Role1};
                                     false ->
                                         NewRole = attr:calc_and_push(Role1),
                                         role_gain:push_exp(NewRole),
                                         {ok, NewRole}
                                 end
                         end
                 end},
     #gm_cmd{cmd = "打自己", args = [], desc = "打自己（克隆人）",
             do =
                 fun (_, Role = #role{}) ->
                         {ok, F1} = role_convert:to(fighter, Role),
                         {ok, F2} = role_convert:to(fighter_clone, Role),
                         combat_mgr:start_combat(0, [F1], [F2]),
                         ok
                 end},
     #gm_cmd{cmd = "击杀NPC", args = [{int, "值"}],
             desc = "击杀NPC",
             do =
                 fun ([Val], Role = #role{}) ->
                         case team:get_fighters(Role) of
                             {ok, AtkList} ->
                                 combat_mgr:start_combat(1,
                                                         AtkList,
                                                         [{unit_baseid, Val}]),
                                 ok;
                             {false, Reason} -> {reply, Reason}
                         end
                 end},
     #gm_cmd{cmd = "进入战斗",
             args = [{int, "npc_id"}, {int, "个数"}], desc = "击杀NPC",
             do =
                 fun ([NpcId, Num], Role = #role{}) ->
                         case team:get_fighters(Role) of
                             {ok, AtkList} ->
                                 case unit_convert:to(unit_base_id_to_fighter,
                                                      NpcId)
                                     of
                                     {ok, DfdF} ->
                                         Dedfs = lists:duplicate(Num, DfdF),
                                         combat_mgr:start_combat(1,
                                                                 AtkList,
                                                                 Dedfs),
                                         ok;
                                     Reason -> {reply, Reason}
                                 end;
                             {false, Reason} -> {reply, Reason}
                         end
                 end},
     #gm_cmd{cmd = "异常战斗", args = [], desc = "异常战斗",
             do =
                 fun ([], Role = #role{m_combat = MC, pid = Pid}) ->
                         {ok, Role#role{m_combat = MC#m_combat{pid = Pid}}}
                 end},
     #gm_cmd{cmd = "击杀固定NPC",
             args = [{int, "值"}, {int, "站位", 1}], desc = "击杀NPC",
             do =
                 fun ([Val, Val2], Role = #role{}) ->
                         case team:get_fighters(Role) of
                             {ok, AtkList} ->
                                 combat_mgr:start_combat(1,
                                                         AtkList,
                                                         [{unit_baseid,
                                                           Val,
                                                           Val2}]),
                                 ok;
                             {false, Reason} -> {reply, Reason}
                         end
                 end},
     #gm_cmd{cmd = "打人", args = [{string, "角色名"}],
             desc = "打某人",
             do =
                 fun ([Name], Role = #role{id = {_, P, Z} = RoleId}) ->
                         case role_query:local_index(by_name, Name, P, Z) of
                             {ok, #name_index{id = Id}} ->
                                 CombatModeArgs = {warrior_combat_mode, 4},
                                 CombatEmbattleArgs = {warrior_combat_embattle,
                                                       [{0,
                                                         warrior_mgr:get_embattle_args(RoleId)},
                                                        {1,
                                                         warrior_mgr:get_embattle_args({Id,
                                                                                        P,
                                                                                        Z})}]},
                                 Args = #combat_start_args{max_guard = 2,
                                                           ext_args =
                                                               [CombatModeArgs,
                                                                CombatEmbattleArgs]},
                                 combat_mgr:start_combat(103,
                                                         [Role],
                                                         [{Id, P, Z}],
                                                         Args),
                                 ok;
                             _ -> {reply, "查找不到对方"}
                         end
                 end},
     #gm_cmd{cmd = "嗑药",
             args =
                 [{string, "角色名"}, {int, "大力丸", 0}, {int, "幸运丸", 0}],
             desc = "嗑药打人",
             do =
                 fun ([Name, Times1, Times2],
                      Role = #role{id = {_, P, Z}}) ->
                         case role_query:local_index(by_name, Name, P, Z) of
                             {ok, #name_index{id = Id}} ->
                                 Role1 = Role#role{s_event = 53},
                                 Role2 = var:set_var(Role1,
                                                     other,
                                                     2098,
                                                     Times1),
                                 Role3 = var:set_var(Role2,
                                                     other,
                                                     2099,
                                                     Times2),
                                 combat_mgr:start_combat(103,
                                                         [Role3],
                                                         [{Id, P, Z}]),
                                 {ok, Role};
                             _ -> {reply, "查找不到对方"}
                         end
                 end},
     #gm_cmd{cmd = "打雪仗", args = [{string, "角色名"}],
             desc = "打某人",
             do =
                 fun ([Name], Role = #role{id = {_, P, Z}}) ->
                         case role_query:rec(by_name, Name, P, Z, fighter_wrap)
                             of
                             {ok, #fighter_wrap{status = 2}} ->
                                 {reply, "对方在战斗中"};
                             {ok, Target = #fighter_wrap{}} ->
                                 {Flag1, AtkList} = team:get_fighters(Role),
                                 {Flag2, DfdList} = team:get_fighters(Target),
                                 case {Flag1, Flag2} of
                                     {ok, ok} ->
                                         combat_mgr:start_combat(52,
                                                                 AtkList,
                                                                 DfdList),
                                         ok;
                                     _ -> {reply, "发起战斗失败"}
                                 end;
                             _ -> {reply, "查找不到对方"}
                         end
                 end},
     #gm_cmd{cmd = "打人2", args = [{string, "角色名"}],
             desc = "打某人",
             do =
                 fun ([Name], Role = #role{id = {_, P, Z}}) ->
                         case role_query:local_index(by_name, Name, P, Z) of
                             {ok, #name_index{id = Id}} ->
                                 CombatModeArgs = {warrior_combat_mode, 2},
                                 Args = #combat_start_args{ext_args =
                                                               [CombatModeArgs]},
                                 combat_mgr:start_combat(103,
                                                         [Role],
                                                         [{Id, P, Z}],
                                                         Args),
                                 ok;
                             _ -> {reply, "查找不到对方"}
                         end
                 end},
     #gm_cmd{cmd = "开启roll",
             args = [{int, "类型,0:普通, 1:副本 2:组队 3:幻境"}, {int, "id"}],
             desc = "开启一个roll任务",
             do =
                 fun ([Mode, Id], Role) ->
                         Result = team:get_status(Role),
                         RoleList = case Result of
                                        {true, 1} ->
                                            case team:get_members(Role) of
                                                TeamList = [_ | _] ->
                                                    [Role | TeamList];
                                                _ -> [Role]
                                            end;
                                        _ -> [Role]
                                    end,
                         case Mode of
                             0 -> roll:normal_roll(Id, RoleList);
                             1 -> roll:dungeon_roll(Id, RoleList);
                             2 -> roll:team_roll(Id, RoleList);
                             3 -> roll:fairyland_box(Id, RoleList);
                             _ -> ok
                         end
                 end},
     #gm_cmd{cmd = "不存档", args = [],
             desc = "本次登录所有角色变化状态不存档, 如果备份 则为备份状态",
             do =
                 fun ([], _Role = #role{s_event = 0}) ->
                         put(role_bak_flag, true),
                         ok;
                     ([], _Role) -> {false, "当前不能进行此操作"}
                 end},
     #gm_cmd{cmd = "存档", args = [],
             desc = "登录所有角色变化状态存档, (配合 永久不存档 使用)",
             do =
                 fun ([], Role = #role{s_event = 0}) ->
                         {ok, var:del_var(Role, other, role_bak_flag)};
                     ([], _Role) -> {false, "当前不能进行此操作"}
                 end},
     #gm_cmd{cmd = "永不存档", args = [],
             desc =
                 "以后每次登录所有角色变化状态不存档, 如果备份 则为备份状态 直到<<存档>>命令出现 "
                 "注意：本操作会备份一次",
             do =
                 fun ([], Role = #role{s_event = 0}) ->
                         NRole = var:set_var(Role, other, role_bak_flag, 1),
                         put(role_bak, NRole),
                         {ok, NRole};
                     ([], _Role) -> {false, "当前不能进行此操作"}
                 end},
     #gm_cmd{cmd = "备份", args = [], desc = "登记角色当前状态",
             do =
                 fun ([], Role = #role{s_event = 0}) ->
                         put(role_bak, Role),
                         ok;
                     ([], _Role) -> {false, "当前不能进行此操作"}
                 end},
     #gm_cmd{cmd = "下线", args = [], desc = "角色主动下线",
             do =
                 fun ([], #role{pid = Pid}) when is_pid(Pid) ->
                         role:disconnect(Pid, normal_exit),
                         {reply, "角色下线成功"};
                     ([], _Role) -> {false, "当前不能进行此操作"}
                 end},
     #gm_cmd{cmd = "增加公会资金", args = [{int, "值"}],
             desc = "增加当前公会的资金",
             do =
                 fun ([Val], Role = #role{}) ->
                         guild_common:add_assets(Val, Role),
                         ok
                 end},
     #gm_cmd{cmd = "变身", args = [{string, "类型"}],
             desc = "执行GM命令组",
             do = fun ([Type], Role) -> gm(Type, Role) end},
     #gm_cmd{cmd = "退副本", args = [], desc = "退出副本",
             do =
                 fun ([], Role) ->
                         case dungeon_util:team_check(exit, Role) of
                             false -> {reply, lang:get("您在队伍中, 只有队长和暂离队员才能操作")};
                             {true, Status} ->
                                 case dungeon:role_exit(Status, Role) of
                                     {false, Reason} -> {reply, Reason};
                                     {ok} -> ok;
                                     {ok, NewRole} -> {ok, NewRole}
                                 end
                         end
                 end},
     #gm_cmd{cmd = "完成任务链", args = [{int, "尾任务ID"}],
             desc = "完成到指定任务链",
             do =
                 fun ([Id], Role) -> quest:finish_line(Role, Id) end},
     #gm_cmd{cmd = "放弃任务", args = [{int, "任务ID"}],
             desc = "放弃任务",
             do = fun ([Id], Role) -> quest:giveup(Id, Role) end},
     #gm_cmd{cmd = "清空变量", args = [], desc = "清空变量",
             do =
                 fun ([],
                      Role = #role{m_var =
                                       MVar = #m_var{other_vars =
                                                         OtherVars}}) ->
                         NewOtherVars = [{Key, Val}
                                         || {Key, Val} <- OtherVars,
                                            Key =:= 2000],
                         NRole = Role#role{m_var =
                                               MVar#m_var{day_vars = [],
                                                          acc_vars = [],
                                                          other_vars =
                                                              NewOtherVars,
                                                          day_five_vars = [],
                                                          week_five_vars = []}},
                         {ok, NRole}
                 end},
     #gm_cmd{cmd = "加试炼次数", args = [], desc = "增加试炼次数",
             do =
                 fun ([], Role = #role{m_trial = Mtrial}) ->
                         NewMtrial = Mtrial#m_trial{reset = 1},
                         NewRole = Role#role{m_trial = NewMtrial},
                         trial:push_13100(NewRole),
                         {ok, NewRole}
                 end},
     #gm_cmd{cmd = "公会跨天", args = [], desc = "公会跨天测试",
             do =
                 fun ([], #role{m_guild = Mg}) ->
                         case Mg of
                             #m_guild{pid = GuildPid} -> GuildPid ! reset;
                             _ -> skip
                         end,
                         ok
                 end},
     #gm_cmd{cmd = "公会活跃后退", args = [{int, "天数"}],
             desc = "公会活跃后退",
             do =
                 fun ([Val], Role) ->
                         guild_role:update(Role, {gm_active, Val}),
                         ok
                 end},
     #gm_cmd{cmd = "公会健康度更新", args = [], desc = "公会健康度更新",
             do =
                 fun ([], #role{}) ->
                         lists:foreach(fun ([Pid]) -> Pid ! maintain_health end,
                                       ets:match(guild_list,
                                                 #guild{pid = '$1', _ = '_'})),
                         ok
                 end},
     #gm_cmd{cmd = "设公会健康度", args = [{int, "健康度"}],
             desc = "设置公会健康度",
             do =
                 fun ([Health], Role) ->
                         guild_union:gm(Role, {set_health, Health}),
                         ok
                 end},
     #gm_cmd{cmd = "公会合并", args = [], desc = "公会自动合并",
             do =
                 fun ([], _Role) ->
                         guild_mgr ! auto_merge,
                         ok
                 end},
     #gm_cmd{cmd = "设入会时间", args = [{int, "秒"}],
             desc = "设置时间",
             do =
                 fun ([Secs],
                      Role = #role{m_guild = MG = #m_guild{pid = Pid},
                                   id = Id}) ->
                         Entered = max(0, date:unixtime() - Secs),
                         Fun = fun (G = #guild{members = Members}) ->
                                       NewMembers = case lists:keyfind(Id,
                                                                       #guild_role.id,
                                                                       Members)
                                                        of
                                                        R = #guild_role{} ->
                                                            lists:keyreplace(Id,
                                                                             #guild_role.id,
                                                                             Members,
                                                                             R#guild_role{enter_time
                                                                                              =
                                                                                              Entered});
                                                        _ -> Members
                                                    end,
                                       {ok,
                                        G#guild{members = NewMembers, flag = 1}}
                               end,
                         guild_mgr:apply(async, Pid, {Fun}),
                         {ok,
                          Role#role{m_guild =
                                        MG#m_guild{enter_time = Entered}}};
                     (_, _) -> {false, lang:get("不在公会")}
                 end},
     #gm_cmd{cmd = "设所有人入会时间", args = [{int, "秒"}],
             desc = "设置时间",
             do =
                 fun ([Secs],
                      Role = #role{m_guild = MG = #m_guild{pid = Pid}}) ->
                         Entered = max(0, date:unixtime() - Secs),
                         Fun = fun (G = #guild{members = Members}) ->
                                       NewMembers = [R#guild_role{enter_time =
                                                                      Entered}
                                                     || R <- Members],
                                       {ok,
                                        G#guild{members = NewMembers, flag = 1}}
                               end,
                         guild_mgr:apply(async, Pid, {Fun}),
                         {ok,
                          Role#role{m_guild =
                                        MG#m_guild{enter_time = Entered}}};
                     (_, _) -> {false, lang:get("不在公会")}
                 end},
     #gm_cmd{cmd = "设公会时间", args = [{int, "秒"}],
             desc = "设置时间",
             do =
                 fun ([Secs],
                      _Role = #role{m_guild = #m_guild{pid = Pid}}) ->
                         Fun = fun (G = #guild{}) ->
                                       {ok,
                                        G#guild{create_time =
                                                    max(0,
                                                        date:unixtime() - Secs),
                                                flag = 1}}
                               end,
                         guild_mgr:apply(async, Pid, {Fun}),
                         ok;
                     (_, _) -> {false, lang:get("不在公会")}
                 end},
     #gm_cmd{cmd = "设公会等级", args = [{int, "等级"}],
             desc = "设置公会等级",
             do =
                 fun ([Lev],
                      Role = #role{m_guild = MG = #m_guild{pid = Pid}}) ->
                         Fun = fun (G = #guild{}) ->
                                       {ok,
                                        guild_trigger:fire(#g_evt_lev{val =
                                                                          Lev},
                                                           G#guild{lev = Lev,
                                                                   flag = 1})}
                               end,
                         guild_mgr:apply(async, Pid, {Fun}),
                         {ok, Role#role{m_guild = MG#m_guild{guild_lev = Lev}}};
                     (_, _) -> {false, lang:get("不在公会")}
                 end},
     #gm_cmd{cmd = "设公会人数", args = [{int, "人数"}],
             desc = "设置公会人数",
             do =
                 fun ([Num],
                      _Role = #role{m_guild = #m_guild{pid = Pid}}) ->
                         Fun = fun (G = #guild{}) ->
                                       {ok, G#guild{mem_num = Num, flag = 1}}
                               end,
                         guild_mgr:apply(async, Pid, {Fun}),
                         ok;
                     (_, _) -> {false, lang:get("不在公会")}
                 end},
     #gm_cmd{cmd = "公会战", args = [], desc = "公会战状态切换",
             do =
                 fun ([], _Role) ->
                         cross:cast(guild_war, m, [timeout]),
                         cross:cast(all, guild_war, m, [timeout]),
                         ok
                 end},
     #gm_cmd{cmd = "公会战匹配", args = [], desc = "公会战匹配",
             do =
                 fun ([], _Role) ->
                         cross:cast(erlang, send, [guild_war, match]),
                         cross:cast(all, erlang, send, [guild_war, match]),
                         ok
                 end},
     #gm_cmd{cmd = "公会战匹配消息", args = [], desc = "公会战匹配消息",
             do =
                 fun ([], _Role) ->
                         guild_war:gm(match_notice),
                         ok
                 end},
     #gm_cmd{cmd = "公会战判定", args = [], desc = "公会战进入判定胜负阶段",
             do =
                 fun ([], _Role) ->
                         guild_war ! judge,
                         ok
                 end},
     #gm_cmd{cmd = "公会宝藏", args = [], desc = "公会宝藏",
             do =
                 fun ([], #role{m_guild = #m_guild{id = Gid}}) ->
                         guild_treasure:add(Gid),
                         ok;
                     (_, _) -> {false, lang:get("还没加入公会")}
                 end},
     #gm_cmd{cmd = "公会激励宝藏", args = [], desc = "公会激励宝藏",
             do =
                 fun ([], #role{m_guild = #m_guild{id = Gid}}) ->
                         guild_treasure:add_fail(Gid),
                         ok;
                     (_, _) -> {false, lang:get("还没加入公会")}
                 end},
     #gm_cmd{cmd = "公会宝藏跳转", args = [], desc = "公会宝藏跳转",
             do =
                 fun ([], #role{m_guild = #m_guild{pid = Pid}}) ->
                         Pid ! gen_treasure_unit,
                         ok;
                     (_, _) -> {false, lang:get("还没加入公会")}
                 end},
     #gm_cmd{cmd = "公会联赛", args = [], desc = "公会联赛状态切换",
             do =
                 fun ([], _Role) ->
                         big_world:cast(gen_fsm,
                                        send_event,
                                        [guild_league, timeout]),
                         ok
                 end},
     #gm_cmd{cmd = "公会联赛匹配", args = [], desc = "公会联赛匹配",
             do =
                 fun ([], _Role) ->
                         big_world:cast(erlang, send, [guild_league, match]),
                         ok
                 end},
     #gm_cmd{cmd = "公会联赛匹配2", args = [], desc = "公会联赛匹配2",
             do =
                 fun ([], _Role) ->
                         big_world:cast(erlang,
                                        send,
                                        [guild_league, collect_update]),
                         ok
                 end},
     #gm_cmd{cmd = "公会联赛开炮", args = [], desc = "公会联赛激活大炮",
             do =
                 fun ([], _Role) ->
                         big_world:cast(erlang,
                                        send,
                                        [guild_league, cannon_ready]),
                         ok
                 end},
     #gm_cmd{cmd = "公会联赛迟到", args = [], desc = "公会联赛迟到阶段",
             do =
                 fun ([], _Role) ->
                         big_world:cast(erlang, send, [guild_league, judge]),
                         ok
                 end},
     #gm_cmd{cmd = "公会联赛调级", args = [{int, "阶段"}],
             desc = "公会联赛调级",
             do =
                 fun ([Phase], _Role) ->
                         big_world:cast(guild_league, gm, [attend_all]),
                         big_world:cast(erlang,
                                        send,
                                        [guild_league, {reset_grade, Phase}]),
                         ok
                 end},
     #gm_cmd{cmd = "公会联赛排级", args = [], desc = "公会联赛排级",
             do =
                 fun ([], _Role) ->
                         big_world:cast(guild_league_guild,
                                        test_reset_grade,
                                        []),
                         ok
                 end},
     #gm_cmd{cmd = "公会联赛重置", args = [], desc = "公会联赛重置",
             do =
                 fun ([], _Role) ->
                         big_world:cast(erlang,
                                        send,
                                        [guild_league, reset_all]),
                         ok
                 end},
     #gm_cmd{cmd = "加公会战利品",
             args = [{int, "物品id"}, {int, "数量"}], desc = "增加公会战利品",
             do =
                 fun ([BaseId, Num],
                      #role{m_guild = #m_guild{id = Gid}}) ->
                         guild_loot:add(Gid, [{BaseId, Num}]),
                         ok;
                     (_, _) -> {false, lang:get("还没加入公会")}
                 end},
     #gm_cmd{cmd = "清功勋宝箱", args = [], desc = "清功勋宝箱分配记录",
             do =
                 fun (_, #role{m_guild = #m_guild{id = Gid}}) ->
                         guild_loot:gm(Gid, clear),
                         ok;
                     (_, _) -> {false, lang:get("还没加入公会")}
                 end},
     #gm_cmd{cmd = "公会精英战", args = [], desc = "公会精英战状态切换",
             do =
                 fun ([], _Role) ->
                         gen_fsm:send_event(guild_hero, timeout),
                         ok
                 end},
     #gm_cmd{cmd = "跨服公会精英战", args = [],
             desc = "跨服公会英雄战状态切换",
             do =
                 fun ([], _Role) ->
                         cross:cast(gen_fsm, send_event, [guild_hero, timeout]),
                         ok
                 end},
     #gm_cmd{cmd = "公会精英战匹配", args = [], desc = "公会精英战状态切换",
             do =
                 fun ([], _Role) ->
                         cross:cast(erlang, send, [guild_hero, round_match]),
                         cross:cast(cross,
                                    cast,
                                    [all,
                                     erlang,
                                     send,
                                     [guild_hero, round_match]]),
                         ok
                 end},
     #gm_cmd{cmd = "公会精英战开打", args = [], desc = "公会精英战状态切换",
             do =
                 fun ([], _Role) ->
                         cross:cast(erlang, send, [guild_hero, match_fight]),
                         cross:cast(cross,
                                    cast,
                                    [all,
                                     erlang,
                                     send,
                                     [guild_hero, match_fight]]),
                         ok
                 end},
     #gm_cmd{cmd = "公会精英战结算", args = [], desc = "公会精英战回合结算",
             do =
                 fun ([], _Role) ->
                         cross:cast(erlang, send, [guild_hero, round_over]),
                         cross:cast(cross,
                                    cast,
                                    [all,
                                     erlang,
                                     send,
                                     [guild_hero, round_over]]),
                         ok
                 end},
     #gm_cmd{cmd = "获取称号", args = [{int, "称号ID", 0}],
             desc = "获取称号",
             do =
                 fun ([Id], Role) ->
                         EndT = 0,
                         case honor:add_and_use(Role, {Id, EndT}, push) of
                             {ok, NRole} -> {ok, NRole};
                             ok -> {reply, lang:get("获取失败")}
                         end
                 end},
     #gm_cmd{cmd = "获得任务", args = [{int, "任务ID", 0}],
             desc = "获得任务",
             do =
                 fun ([Id],
                      Role = #role{m_quest =
                                       MQuest = #m_quest{acceptable =
                                                             Acceptable}}) ->
                         case quest:force_accept(Id,
                                                 Role#role{m_quest =
                                                               MQuest#m_quest{acceptable
                                                                                  =
                                                                                  [Id
                                                                                   | Acceptable]}})
                             of
                             {ok, NRole} -> {ok, NRole};
                             _ -> {reply, lang:get("获得失败，不满足条件")}
                         end
                 end},
     #gm_cmd{cmd = "公告重载", args = [], desc = "重载公告数据",
             do =
                 fun ([], _Role) ->
                         notice_board:reload(),
                         ok
                 end},
     #gm_cmd{cmd = "商城重载", args = [], desc = "商城重载",
             do =
                 fun ([], _Role) ->
                         shop_mgr:reload(),
                         ok
                 end},
     #gm_cmd{cmd = "查看任务",
             args =
                 [{int,
                   "已接任务:0; 可接任务:1; 已完成任务:2; 悬赏任务:3; 职业任务:4; "
                   "主线任务：5; 历练任务(屠魔)：10;",
                   0}],
             desc = "查看任务",
             do =
                 fun ([Type], Role) ->
                         Reply = quest:gm_lookup_quest(Type, Role),
                         {reply, Reply}
                 end},
     #gm_cmd{cmd = "清空历练", args = [], desc = "查看历练（屠魔）任务",
             do =
                 fun ([], Role) ->
                         Reply = quest_kill:gm_clean(Role),
                         {reply, Reply}
                 end},
     #gm_cmd{cmd = "设置职业任务时间", args = [], desc = "设置职业任务时间",
             do =
                 fun ([], Role) -> quest_classes:set_accept_time(Role)
                 end},
     #gm_cmd{cmd = "在线", args = [{int, "秒数", 1}],
             desc = "在线",
             do =
                 fun ([Val], Role) ->
                         NewRole = var:add_var(Role, day_five, 143, Val, 0),
                         {ok, NewRole}
                 end},
     #gm_cmd{cmd = "清首杀", args = [], desc = "清首杀",
             do =
                 fun ([], _Role) ->
                         ets:delete_all_objects(dungeon_first),
                         ets:delete_all_objects(constellation_first),
                         ets:delete_all_objects(ets_glory_rank),
                         env:del(tower_first),
                         [ets:insert(world_boss,
                                     I#world_boss{first_killer = []})
                          || I <- ets:tab2list(world_boss)],
                         ok
                 end},
     #gm_cmd{cmd = "清战斗录像", args = [], desc = "清战斗录像",
             do =
                 fun ([], _Role) ->
                         ets:delete_all_objects(combat_record_system),
                         ets:delete_all_objects(combat_record_public),
                         ets:delete_all_objects(combat_record_gods_duel_final),
                         ets:delete_all_objects(combat_record_gods_challenge),
                         ets:delete_all_objects(combat_record_marvelous),
                         ets:delete_all_objects(combat_record_hot),
                         ets:delete_all_objects(combat_record_rank),
                         ets:delete_all_objects(combat_record_rank_week),
                         dets:delete_all_objects(combat_record_system),
                         dets:delete_all_objects(combat_record_public),
                         dets:delete_all_objects(combat_record_gods_duel_final),
                         dets:delete_all_objects(combat_record_gods_challenge),
                         dets:delete_all_objects(combat_record_marvelous),
                         dets:delete_all_objects(combat_record_hot),
                         dets:delete_all_objects(combat_record_rank),
                         dets:delete_all_objects(combat_record_rank_week),
                         big_world:cast(ets,
                                        delete_all_objects,
                                        [combat_record_hot]),
                         big_world:cast(ets,
                                        delete_all_objects,
                                        [combat_record_rank]),
                         big_world:cast(ets,
                                        delete_all_objects,
                                        [combat_record_rank_week]),
                         big_world:cast(ets,
                                        delete_all_objects,
                                        [combat_record_marvelous]),
                         big_world:cast(dets,
                                        delete_all_objects,
                                        [combat_record_hot]),
                         big_world:cast(dets,
                                        delete_all_objects,
                                        [combat_record_rank]),
                         big_world:cast(dets,
                                        delete_all_objects,
                                        [combat_record_rank_week]),
                         big_world:cast(dets,
                                        delete_all_objects,
                                        [combat_record_marvelous]),
                         ok
                 end},
     #gm_cmd{cmd = "录像排行榜", args = [], desc = "录像排行榜",
             do =
                 fun ([], _Role) ->
                         combat_record:info(update_rank),
                         big_world:cast(combat_record_cross,
                                        info,
                                        [update_rank]),
                         ok
                 end},
     #gm_cmd{cmd = "设置悬赏环数", args = [{int, "环数", 1}],
             desc = "设置悬赏任务环数",
             do =
                 fun ([Count], Role) ->
                         quest_offer:gm_set_daycount(Count, Role)
                 end},
     #gm_cmd{cmd = "设置悬赏队长环数", args = [{int, "环数", 1}],
             desc = "设置悬赏任务队长环数",
             do =
                 fun ([Count], Role) ->
                         quest_offer:gm_set_leader_count(Count, Role)
                 end},
     #gm_cmd{cmd = "设置任务链环数", args = [{int, "环数", 1}],
             desc = "设置任务链环数",
             do =
                 fun ([Round], Role) ->
                         quest_chain:gm_set_round(Round, Role)
                 end},
     #gm_cmd{cmd = "重置任务链", args = [], desc = "重置任务链",
             do = fun ([], Role) -> quest_chain:gm_reset(Role) end},
     #gm_cmd{cmd = "护送sss", args = [], desc = "直接刷新到sss护送",
             do = fun ([], Role) -> escort:gm_sss(Role) end},
     #gm_cmd{cmd = "吃货游行", args = [], desc = "切换吃货游行的活动状态",
             do =
                 fun ([], _Role) -> gen_fsm:send_event(parade, timeout)
                 end},
     #gm_cmd{cmd = "公会温泉", args = [], desc = "切换公会温泉的活动状态",
             do =
                 fun ([], _Role) ->
                         gen_fsm:send_event(guild_spring, timeout)
                 end},
     #gm_cmd{cmd = "公会盗贼", args = [], desc = "切换公会盗贼活动状态",
             do =
                 fun ([], _Role) ->
                         gen_fsm:send_event(guild_robber, timeout)
                 end},
     #gm_cmd{cmd = "生成盗贼", args = [], desc = "切换生成公会盗贼到公会领地",
             do =
                 fun ([], _Role) ->
                         guild_robber ! gm_monster,
                         ok
                 end},
     #gm_cmd{cmd = "盗贼宝箱", args = [], desc = "生成盗贼宝箱",
             do =
                 fun ([], Role) ->
                         guild_robber:gm(Role, create_box_switch),
                         ok
                 end},
     #gm_cmd{cmd = "清盗贼宝箱", args = [], desc = "清理盗贼宝箱",
             do =
                 fun ([], Role) ->
                         guild_robber:gm(Role, clear_box),
                         ok
                 end},
     #gm_cmd{cmd = "公会商店提示", args = [], desc = "提示一下公会商店更新",
             do =
                 fun ([], _Role) ->
                         sys_conn:pack_send(11120, {0}),
                         ok
                 end},
     #gm_cmd{cmd = "刷冒险宝箱", args = [], desc = "刷新貌相宝箱",
             do =
                 fun ([], _Role) ->
                         skill_prac_box ! gen_box,
                         ok
                 end},
     #gm_cmd{cmd = "冒险人品模式", args = [], desc = "开启冒险宝箱人品模式",
             do =
                 fun ([], Role) -> skill_prac_box:gm(Role, best_luck)
                 end},
     #gm_cmd{cmd = "冒险普通模式", args = [], desc = "开启冒险宝箱普通模式",
             do =
                 fun ([], Role) -> skill_prac_box:gm(Role, normal_luck)
                 end},
     #gm_cmd{cmd = "冒险技能",
             args = [{int, "等级", 1}, {int, "经验", 1}], desc = "冒险技能",
             do =
                 fun ([Lev, Exp],
                      Role = #role{m_skill =
                                       MSkill = #m_skill{skill_prac =
                                                             Skills}}) ->
                         NewSkills = [Skl#skl_prac{lev = Lev, exp = Exp}
                                      || Skl = #skl_prac{} <- Skills],
                         NewMSkill = MSkill#m_skill{skill_prac = NewSkills,
                                                    is_open_skl_prac = 1},
                         NewRole = Role#role{m_skill = NewMSkill},
                         skill_prac:push_skl_prac(NewRole),
                         Reply = "冒险技能设置成功",
                         {reply, Reply, NewRole}
                 end},
     #gm_cmd{cmd = "刷鸿福宝箱", args = [], desc = "刷新鸿福宝箱",
             do =
                 fun ([], _Role) ->
                         spectral_box ! spectral_box_create,
                         ok
                 end},
     #gm_cmd{cmd = "设饱食度", args = [{int, "饱食度", 0}],
             desc = "设置饱食度",
             do =
                 fun ([Val], Role) -> satiety:gm(Role, {set, Val}) end},
     #gm_cmd{cmd = "重置远航", args = [], desc = "重置远航商人",
             do =
                 fun ([], Role) -> shipping:gm_reset_shipping(Role) end},
     #gm_cmd{cmd = "金币市场物品", args = [{int, "物品基础ID", 0}],
             desc = "查询金币市场物品数据",
             do =
                 fun ([BaseId], _Role) ->
                         Reply = market_tests:gm_gold_lookup(BaseId),
                         {reply, Reply}
                 end},
     #gm_cmd{cmd = "金币市场类别",
             args = [{int, "一级类别", 1}, {int, "二级类别", 2}],
             desc = "查询金币市场物品数据",
             do =
                 fun ([Catalg1, Catalg2], Role) ->
                         Reply = market_tests:gm_gold_lookup_items(Catalg1,
                                                                   Catalg2,
                                                                   Role),
                         {reply, Reply}
                 end},
     #gm_cmd{cmd = "金币刷新", args = [], desc = "金币市场刷新",
             do =
                 fun ([], _Role) ->
                         Reply = market_tests:gm_gold_refresh(),
                         {reply, Reply}
                 end},
     #gm_cmd{cmd = "设金市物品",
             args =
                 [{int, "物品基础ID", 0},
                  {int, "当前价格", -1},
                  {int, "起始价格", -1},
                  {int, "当前库存", -1}],
             desc = "设置金币市场物品数据",
             do =
                 fun ([BaseId, CurPrice, InitPrice, Stock], Role) ->
                         Reply = market_tests:gm_gold_set(BaseId,
                                                          CurPrice,
                                                          InitPrice,
                                                          Stock,
                                                          Role),
                         {reply, Reply}
                 end},
     #gm_cmd{cmd = "回购列表", args = [], desc = "银币市场回收列表",
             do =
                 fun ([], _Role) ->
                         Reply = market_tests:gm_check_recover(),
                         {reply, Reply}
                 end},
     #gm_cmd{cmd = "回购", args = [], desc = "银币市场回购",
             do =
                 fun ([], _Role) ->
                         Reply = market_tests:gm_recover(),
                         {reply, Reply}
                 end},
     #gm_cmd{cmd = "银币市场价格", args = [], desc = "银币市场价格",
             do =
                 fun ([], _Role) ->
                         Reply = market_tests:gm_silver_print_price(),
                         {reply, Reply}
                 end},
     #gm_cmd{cmd = "重置银币市场", args = [], desc = "重置银币",
             do =
                 fun ([], _Role) ->
                         Reply = market_tests:gm_silver_reset(),
                         {reply, Reply}
                 end},
     #gm_cmd{cmd = "开启封妖", args = [], desc = "开启封妖",
             do =
                 fun ([], Role) ->
                         Reply = treasure:gm_start_ghost_box(Role),
                         {reply, Reply}
                 end},
     #gm_cmd{cmd = "查看封妖", args = [{int, "地图基础Id", 10002}],
             desc = "查看封妖",
             do =
                 fun ([MapBaseId], _Role) ->
                         Reply = treasure:gm_lookup_units(MapBaseId),
                         {reply, Reply}
                 end},
     #gm_cmd{cmd = "清除封妖", args = [], desc = "清除封妖",
             do =
                 fun ([], _Role) ->
                         Reply = treasure:gm_clean_ghost_box(),
                         {reply, Reply}
                 end},
     #gm_cmd{cmd = "段位赛下阶段", args = [], desc = "段位赛进入下阶段",
             do =
                 fun ([], _Role) ->
                         cross:cast(qualifying_mgr, m, [timeout]),
                         cross:cast(all, qualifying_mgr, m, [timeout]),
                         ok
                 end},
     #gm_cmd{cmd = "段位赛结算赛季", args = [], desc = "段位赛结算赛季",
             do =
                 fun ([], _Role) ->
                         qualifying_mgr ! calc_season,
                         ok
                 end},
     #gm_cmd{cmd = "星辰宝贝下阶段", args = [], desc = "星辰宝贝下阶段",
             do =
                 fun ([], _Role) ->
                         camp_guild_bady:m(),
                         ok
                 end},
     #gm_cmd{cmd = "巅峰对决下阶段", args = [], desc = "巅峰对决下阶段",
             do =
                 fun ([], _Role) ->
                         top_compete_mgr:m(timeout),
                         ok
                 end},
     #gm_cmd{cmd = "武道大会下阶段", args = [], desc = "武道大会下阶段",
             do =
                 fun ([], _Role) ->
                         hero_mgr:m(),
                         ok
                 end},
     #gm_cmd{cmd = "武道大会设置",
             args = [{int, "积分", 0}, {int, "胜场", 1}, {int, "连胜", 1}],
             desc = "武道大会设置",
             do =
                 fun ([Score, Win, WinStreak], #role{id = RoleID}) ->
                         hero:cast({gm_update_role,
                                    {RoleID, Score, Win, WinStreak}}),
                         ok
                 end},
     #gm_cmd{cmd = "蛋糕下阶段", args = [], desc = "蛋糕下阶段",
             do =
                 fun ([], _Role) ->
                         camp_cake:m(),
                         ok
                 end},
     #gm_cmd{cmd = "万圣节下阶段", args = [], desc = "万圣节下阶段",
             do =
                 fun ([], _Role) ->
                         camp_halloween_mgr:m(),
                         cross:cast(camp_halloween_mgr, m, []),
                         ok
                 end},
     #gm_cmd{cmd = "万圣节结算", args = [], desc = "万圣节结算",
             do =
                 fun ([], Role) ->
                         camp_halloween_mgr:m(Role),
                         ok
                 end},
     #gm_cmd{cmd = "蛋糕成长值", args = [{int, "活跃度", 1}],
             desc = "蛋糕成长值",
             do =
                 fun ([Val], Role) ->
                         camp_cake:gm(Role, #{label => finish, val => Val}),
                         ok
                 end},
     #gm_cmd{cmd = "精灵下阶段", args = [], desc = "精灵下阶段",
             do =
                 fun ([], _Role) ->
                         cross:cast(elf_mgr, m, []),
                         cross:cast(all, elf_mgr, m, []),
                         ok
                 end},
     #gm_cmd{cmd = "精灵重载", args = [], desc = "精灵重载",
             do =
                 fun ([], _Role) ->
                         cross:cast(elf_mgr, reload, []),
                         cross:cast(all, elf_mgr, reload, []),
                         ok
                 end},
     #gm_cmd{cmd = "水果种植下阶段", args = [], desc = "水果种植下阶段",
             do =
                 fun ([], _Role) ->
                         camp_fruit:m(),
                         ok
                 end},
     #gm_cmd{cmd = "捉迷藏下阶段", args = [], desc = "捉迷藏下阶段",
             do =
                 fun ([], _Role) ->
                         camp_hide_seek:m(),
                         ok
                 end},
     #gm_cmd{cmd = "广播捉迷藏", args = [], desc = "广播捉迷藏",
             do =
                 fun ([], Role) ->
                         camp_hide_seek:gm_help(Role),
                         ok
                 end},
     #gm_cmd{cmd = "婚礼下阶段", args = [], desc = "婚礼进入下阶段",
             do =
                 fun ([], _Role) ->
                         wedding_mgr:m(),
                         ok
                 end},
     #gm_cmd{cmd = "清空结婚状态", args = [], desc = "清空结婚状态",
             do =
                 fun ([], Role = #role{id = RoleId}) ->
                         ets:delete(lover, RoleId),
                         dets:delete(lover, RoleId),
                         {ok, Role#role{m_wedding = #m_wedding{}}}
                 end},
     #gm_cmd{cmd = "宠物祝福", args = [], desc = "宠物祝福下阶段",
             do =
                 fun ([], _Role) ->
                         meet_pet:m(),
                         {reply, "宠物祝福进入下阶段"}
                 end},
     #gm_cmd{cmd = "清空宠物祝福", args = [], desc = "清空宠物祝福状态",
             do =
                 fun ([], Role) ->
                         case meet_pet:gm_clean_meet_pet(Role) of
                             {ok, NewRole} ->
                                 logger:debug("成功清空宠物祝福状态", [], gm_cmd, 2762),
                                 {reply, "成功清空宠物祝福状态", NewRole};
                             {false, _Msg} ->
                                 logger:debug("~ts", [_Msg], gm_cmd, 2765),
                                 {reply, "成功清空宠物祝福状态"};
                             _False ->
                                 logger:debug("成功清空宠物祝福状态:~w",
                                              [_False],
                                              gm_cmd,
                                              2768),
                                 {reply, "成功清空宠物祝福状态"}
                         end
                 end},
     #gm_cmd{cmd = "删除夫妻任务", args = [], desc = "删除夫妻任务",
             do =
                 fun ([],
                      Role = #role{m_quest =
                                       MQuest = #m_quest{quest = Quests,
                                                         quest_marriage =
                                                             QMarriage}}) ->
                         case lists:keyfind(15, #quest.sec_type, Quests) of
                             Quest = #quest{} ->
                                 NewRole = quest:del_quest(Quest, Role),
                                 {reply, "成功删除夫妻任务", NewRole};
                             _False ->
                                 logger:debug("删除夫妻任务~w",
                                              [_False],
                                              gm_cmd,
                                              2785),
                                 NewRole = Role#role{m_quest =
                                                         MQuest#m_quest{quest_marriage
                                                                            =
                                                                            QMarriage#quest_marriage{round
                                                                                                         =
                                                                                                         0}}},
                                 {reply, "没有夫妻任务可以删除", NewRole}
                         end
                 end},
     #gm_cmd{cmd = "删除情缘任务", args = [], desc = "删除情缘任务",
             do =
                 fun ([],
                      Role = #role{m_quest =
                                       MQuest = #m_quest{quest = Quests,
                                                         quest_couple =
                                                             QMarriage}}) ->
                         case lists:keyfind(16, #quest.sec_type, Quests) of
                             Quest = #quest{} ->
                                 NewRole = quest:del_quest(Quest, Role),
                                 {reply, "成功删除情缘任务", NewRole};
                             _False ->
                                 logger:debug("删除情缘任务~w",
                                              [_False],
                                              gm_cmd,
                                              2805),
                                 NewRole = Role#role{m_quest =
                                                         MQuest#m_quest{quest_couple
                                                                            =
                                                                            QMarriage#quest_couple{round
                                                                                                       =
                                                                                                       0}}},
                                 {reply, "没有情缘任务可以删除", NewRole}
                         end
                 end},
     #gm_cmd{cmd = "清种植任务", args = [], desc = "清种植任务",
             do =
                 fun ([],
                      Role = #role{m_quest =
                                       MQuest = #m_quest{quest = Quests,
                                                         quest_plant =
                                                             Plant =
                                                                 #quest_plant{unit_id
                                                                                  =
                                                                                  UnitId,
                                                                              pos
                                                                                  =
                                                                                  {Map,
                                                                                   X,
                                                                                   Y}}}}) ->
                         Role1 = Role#role{m_quest =
                                               MQuest#m_quest{quest_plant =
                                                                  Plant#quest_plant{round
                                                                                        =
                                                                                        0,
                                                                                    quest_id
                                                                                        =
                                                                                        0,
                                                                                    unit_id
                                                                                        =
                                                                                        0,
                                                                                    phase
                                                                                        =
                                                                                        0,
                                                                                    last_commited
                                                                                        =
                                                                                        0,
                                                                                    last_accepted
                                                                                        =
                                                                                        0}}},
                         Role2 = case UnitId of
                                     0 -> Role1;
                                     _ ->
                                         plot_quest:remove_task_unit(Role1,
                                                                     [{create_unit,
                                                                       UnitId,
                                                                       UnitId,
                                                                       {point,
                                                                        Map,
                                                                        X,
                                                                        Y},
                                                                       0,
                                                                       "stand"}])
                                 end,
                         case lists:keyfind(17, #quest.sec_type, Quests) of
                             Quest = #quest{} ->
                                 NewRole = quest:del_quest(Quest, Role2),
                                 quest_plant:push(NewRole, 10224),
                                 {reply, "成功删除种植任务", NewRole};
                             _False ->
                                 quest_plant:push(Role2, 10224),
                                 {reply, "没有种植任务可以删除", Role2}
                         end
                 end},
     #gm_cmd{cmd = "删除师徒任务", args = [], desc = "删除师徒任务",
             do =
                 fun ([],
                      Role = #role{m_quest =
                                       MQuest = #m_quest{quest = Quests,
                                                         quest_teacher =
                                                             QTeacher}}) ->
                         case lists:keyfind(18, #quest.sec_type, Quests) of
                             Quest = #quest{} ->
                                 NewRole = quest:del_quest(Quest, Role),
                                 {reply, "成功删除师徒任务", NewRole};
                             _False ->
                                 logger:debug("删除师徒任务~w",
                                              [_False],
                                              gm_cmd,
                                              2858),
                                 NewRole = Role#role{m_quest =
                                                         MQuest#m_quest{quest_teacher
                                                                            =
                                                                            QTeacher#quest_teacher{round
                                                                                                       =
                                                                                                       0,
                                                                                                   stats
                                                                                                       =
                                                                                                       []}}},
                                 {reply, "没有师徒任务可以删除", NewRole}
                         end
                 end},
     #gm_cmd{cmd = "清空结婚排行榜", args = [{int, "1"}],
             desc = "清空结婚排行榜",
             do =
                 fun ([Type], _Role) ->
                         wedding_rank:clean_rank(Type),
                         ok
                 end},
     #gm_cmd{cmd = "结婚排行榜称号", args = [], desc = "结婚排行榜称号",
             do =
                 fun ([], _Role) ->
                         wedding_mgr:info(gm_rank_honor),
                         ok
                 end},
     #gm_cmd{cmd = "正常状态", args = [], desc = "正常状态",
             do =
                 fun ([], Role) -> {ok, Role#role{s_event = 0}} end},
     #gm_cmd{cmd = "清段位赛次数", args = [], desc = "清段位赛次数",
             do =
                 fun ([], #role{id = RoleId}) ->
                         qualifying_mgr:clean_count(RoleId),
                         ok
                 end},
     #gm_cmd{cmd = "设段位赛积分", args = [{int, "1000"}],
             desc = "设置段位赛积分",
             do =
                 fun ([Point], Role)
                         when Point >= 0 andalso Point =< 11400 ->
                         qualifying_mgr:set_point(Role, Point),
                         ok;
                     (_, _Role) -> ok
                 end},
     #gm_cmd{cmd = "段位赛赛季奖励", args = [], desc = "段位赛赛季奖励",
             do =
                 fun ([], _Role) ->
                         qualifying_mgr:info(calc_final_reward),
                         ok;
                     (_, _Role) -> ok
                 end},
     #gm_cmd{cmd = "段位赛匹配测试", args = [], desc = "段位赛匹配测试",
             do =
                 fun ([],
                      Role = #role{id = Id, name = Name, sex = Sex,
                                   classes = Classes, lev = Lev,
                                   s_looks = Looks}) ->
                         I = {Id, Name, Sex, Classes, Lev, 1, 1150, Looks},
                         Ainfo = [I, I, I],
                         Binfo = [I, I, I],
                         role:link_send(Role, 13503, {1, Ainfo, Binfo}),
                         ok
                 end},
     #gm_cmd{cmd = "设活跃度", args = [{int, "活跃度", 0}],
             desc = "设置活跃度",
             do =
                 fun ([Val], Role) ->
                         agenda:gm(Role, {set_activity, Val})
                 end},
     #gm_cmd{cmd = "加活跃度", args = [{int, "活跃度", 0}],
             desc = "增加活跃度",
             do =
                 fun ([Val], Role) ->
                         agenda:gm(Role, {add_activity, Val})
                 end},
     #gm_cmd{cmd = "清活跃奖励", args = [], desc = "清空活跃度奖励",
             do =
                 fun (_, Role) -> agenda:gm(Role, clear_reward) end},
     #gm_cmd{cmd = "发邮件",
             args =
                 [{string, "标题", "标题"},
                  {string, "内容", "内容"},
                  {string, "物品", "[]"},
                  {int, "0阅后删除，1阅后一天删", 0}],
             desc = "给自己发没物品的邮件",
             do =
                 fun ([Title, Content, ItemStr, DelType], Role) ->
                         case util:string_to_term(ItemStr) of
                             {error, Err} ->
                                 {reply, util:flist("命令的参数格式不正确: ~w", [Err])};
                             {ok, Item} ->
                                 mail:send(Role,
                                           #{title => Title, content => Content,
                                             items => Item,
                                             del_type => DelType}),
                                 ok
                         end
                 end},
     #gm_cmd{cmd = "世界boss奖励", args = [{int, "1000"}],
             desc = "发对应世界boss的奖励",
             do =
                 fun ([BaseId], _Role) ->
                         world_boss ! {reward, BaseId},
                         ok;
                     (_, _Role) -> ok
                 end},
     #gm_cmd{cmd = "世界boss复活", args = [{int, "1000"}],
             desc = "复活指定世界boss",
             do =
                 fun ([BaseId], _Role) ->
                         world_boss ! {respawn, BaseId},
                         ok;
                     (_, _Role) -> ok
                 end},
     #gm_cmd{cmd = "通过图片", args = [{int, "图片id"}],
             desc = "审核图片通过",
             do =
                 fun ([N], _Role = #role{id = Id}) ->
                         friend_zone:audit_photo(Id, N, 1),
                         ok
                 end},
     #gm_cmd{cmd = "上传图片", args = [], desc = "上传图片",
             do =
                 fun (_, _Role = #role{id = Id}) ->
                         friend_zone ! {update, photo, Id},
                         ok
                 end},
     #gm_cmd{cmd = "不通过图片", args = [{int, "图片id"}],
             desc = "审核图片不通过",
             do =
                 fun ([N], _Role = #role{id = Id}) ->
                         friend_zone:audit_photo(Id, N, 2),
                         ok
                 end},
     #gm_cmd{cmd = "删除图片", args = [], desc = "删除图片",
             do =
                 fun (_, _Role = #role{id = Id}) ->
                         friend_zone ! {del_photo, Id},
                         ok
                 end},
     #gm_cmd{cmd = "清签到", args = [], desc = "清签到奖励",
             do =
                 fun (_, Role) -> checkin:gm(Role, clear_everyday) end},
     #gm_cmd{cmd = "签到后退", args = [], desc = "签到后退一天",
             do = fun (_, Role) -> checkin:gm(Role, before) end},
     #gm_cmd{cmd = "加签到抽奖", args = [], desc = "加签到抽奖",
             do = fun (_, Role) -> checkin:gm(Role, add_rand) end},
     #gm_cmd{cmd = "7天登录", args = [], desc = "生成7天登录数据",
             do = fun (_, Role) -> checkin:gm(Role, gen_seven) end},
     #gm_cmd{cmd = "7天登录跳天", args = [], desc = "7天登录跳天",
             do =
                 fun (_, Role) -> checkin:gm(Role, add_seven_day) end},
     #gm_cmd{cmd = "清7天充值", args = [], desc = "清理7天充值",
             do =
                 fun (_, Role) -> checkin:gm(Role, clean_charge_day)
                 end},
     #gm_cmd{cmd = "职业挑战", args = [], desc = "职业挑战",
             do =
                 fun ([], _Role) ->
                         gen_fsm:send_event(classes_challenge, timeout)
                 end},
     #gm_cmd{cmd = "接受职业挑战", args = [], desc = "接受职业挑战",
             do =
                 fun ([], Role) -> classes_challenge:accept(Role) end},
     #gm_cmd{cmd = "清职业挑战", args = [], desc = "清职业挑战",
             do =
                 fun ([], Role) -> classes_challenge:gm(Role, clear)
                 end},
     #gm_cmd{cmd = "清勇者试炼", args = [], desc = "清勇者试炼",
             do = fun ([], Role) -> brave_trial:gm(Role, clear) end},
     #gm_cmd{cmd = "勇者试炼下阶段", args = [], desc = "勇者试炼下阶段",
             do = fun ([], _Role) -> brave_trial:m() end},
     #gm_cmd{cmd = "赛龙舟公告", args = [], desc = "赛龙舟公告",
             do =
                 fun ([], _Role) -> camp_dragon_boat:gm(announce) end},
     #gm_cmd{cmd = "重载龙舟配置", args = [], desc = "重载龙舟配置",
             do =
                 fun ([], _Role) ->
                         camp_dragon_boat ! reload,
                         ok
                 end},
     #gm_cmd{cmd = "清龙舟", args = [], desc = "清龙舟次数",
             do =
                 fun ([], Role) ->
                         {ok,
                          Role#role{m_camp_dragon_boat = #m_camp_dragon_boat{}}}
                 end},
     #gm_cmd{cmd = "赛龙舟", args = [], desc = "赛龙舟状态切换",
             do =
                 fun ([], _Role) ->
                         logger:debug("赛龙舟", [], gm_cmd, 3192),
                         gen_fsm:send_event(camp_dragon_boat, timeout)
                 end},
     #gm_cmd{cmd = "武道会", args = [], desc = "武道会状态切换",
             do =
                 fun ([], _Role) ->
                         big_world:cast(gen_fsm,
                                        send_event,
                                        [tournament, timeout])
                 end},
     #gm_cmd{cmd = "武道会更新王者", args = [], desc = "武道会更新王者",
             do =
                 fun ([], _Role) ->
                         big_world:cast(erlang,
                                        send,
                                        [tournament, second_final_rank])
                 end},
     #gm_cmd{cmd = "武道会清算举报", args = [], desc = "武道会清算举报",
             do =
                 fun ([], _Role) ->
                         big_world:cast(erlang,
                                        send,
                                        [tournament, check_banned])
                 end},
     #gm_cmd{cmd = "清武道会次数", args = [], desc = "清武道会次数",
             do =
                 fun ([], _Role) ->
                         tournament_agent:gm(clear),
                         big_world:cast(tournament, gm, [clear])
                 end},
     #gm_cmd{cmd = "设武道会次数", args = [{int, "次数"}],
             desc = "设武道会次数",
             do =
                 fun ([Time], _Role = #role{id = Id}) ->
                         case tournament_agent:get_profile(Id) of
                             P = #tournament_profile{} ->
                                 tournament_agent:update_profile(P#tournament_profile{day_matched
                                                                                          =
                                                                                          Time,
                                                                                      last_matched
                                                                                          =
                                                                                          date:unixtime()});
                             _ ->
                                 tournament_agent:update_profile(#tournament_profile{id
                                                                                         =
                                                                                         Id,
                                                                                     day_matched
                                                                                         =
                                                                                         Time,
                                                                                     last_matched
                                                                                         =
                                                                                         date:unixtime()})
                         end,
                         ok
                 end},
     #gm_cmd{cmd = "设武道等级",
             args = [{int, "等级", 1}, {int, "分数", 0}],
             desc = "设武道会等级",
             do =
                 fun ([RankLev, RankPoint], Role) ->
                         tournament_agent:gm({rank_point,
                                              Role,
                                              RankLev,
                                              RankPoint}),
                         ok
                 end},
     #gm_cmd{cmd = "设武道晋级等级", args = [{int, "等级"}],
             desc = "设武道晋级等级",
             do =
                 fun ([RankLev], Role) ->
                         tournament_agent:gm({rank_lev, Role, RankLev}),
                         ok
                 end},
     #gm_cmd{cmd = "设武道历史最高等级", args = [{int, "等级"}],
             desc = "设武道会等级",
             do =
                 fun ([RankLev], Role) ->
                         tournament_agent:gm({max_point, Role, RankLev}),
                         ok
                 end},
     #gm_cmd{cmd = "武道会周奖励", args = [], desc = "发放武道会周奖励",
             do =
                 fun ([], _Role) ->
                         tournament_agent ! week_reward,
                         ok
                 end},
     #gm_cmd{cmd = "武道会赛季结算", args = [], desc = "赛季结算",
             do =
                 fun ([], _Role) ->
                         tournament_agent:gm(season_reset),
                         ok
                 end},
     #gm_cmd{cmd = "幻境寻宝", args = [], desc = "幻境寻宝活动状态切换",
             do =
                 fun ([], _Role) ->
                         gen_fsm:send_event(fairyland, timeout)
                 end},
     #gm_cmd{cmd = "设彩虹奖池", args = [{int, "次数"}],
             desc = "设彩虹奖池",
             do =
                 fun ([Times], _Role) ->
                         env:set(fairyland_roll_pool, Times),
                         ok
                 end},
     #gm_cmd{cmd = "活动重载", args = [], desc = "重载活动数据",
             do =
                 fun ([], _Role) ->
                         role_group:apply(world,
                                          {campaign_time, push_time_info, []}),
                         campaign_mgr:reload(),
                         camp_web_mgr:reload(),
                         ok
                 end},
     #gm_cmd{cmd = "累计天数", args = [], desc = "活动累计天数加1，刷新生效",
             do = fun ([], Role) -> camp_web:gm_next_day(Role) end},
     #gm_cmd{cmd = "清后台活动数据", args = [], desc = "清空后台活动相关数据",
             do =
                 fun ([], Role) ->
                         NRole = Role#role{m_camp_web = camp_web:init(),
                                           m_campaign = campaign:init()},
                         campaign:push_camp(NRole),
                         camp_web:push(NRole),
                         {ok, NRole}
                 end},
     #gm_cmd{cmd = "lookfun",
             args =
                 [{atom, "模块名"}, {atom, "方法名"}, {string, "参数", "[]"}],
             desc = "查看方法返回",
             do =
                 fun ([Mod, F, A], Role) ->
                         {ok, Args} = util:string_to_term(A),
                         Fun1 = fun (role) -> Role;
                                    (A1) -> A1
                                end,
                         Ret = erlang:apply(Mod, F, [Fun1(A1) || A1 <- Args]),
                         {reply, util:flist("结果:~w", [Ret])}
                 end},
     #gm_cmd{cmd = "参与幻境寻宝", args = [], desc = "参与幻境寻宝",
             do = fun ([], Role) -> fairyland:join(Role) end},
     #gm_cmd{cmd = "退出幻境寻宝", args = [], desc = "退出幻境寻宝",
             do = fun ([], Role) -> fairyland:quit(Role) end},
     #gm_cmd{cmd = "幻境跳转", args = [{int, "第几层"}],
             desc = "幻境寻宝跳转",
             do =
                 fun ([Floor], Role) ->
                         fairyland:gm(Role, {teleport, Floor})
                 end},
     #gm_cmd{cmd = "幻境boss", args = [], desc = "更新幻境boss",
             do =
                 fun ([], _Role) ->
                         fairyland ! gen_boss,
                         ok
                 end},
     #gm_cmd{cmd = "幻境钥匙", args = [{int, "数量"}],
             desc = "获取幻境钥匙",
             do =
                 fun ([Num], Role) -> fairyland:gm(Role, {gen_keys, Num})
                 end},
     #gm_cmd{cmd = "智力闯关", args = [], desc = "智力闯关状态切换",
             do =
                 fun ([], _Role) ->
                         gen_fsm:send_event(examination, timeout)
                 end},
     #gm_cmd{cmd = "智力达标", args = [], desc = "使符合决赛答题资格",
             do =
                 fun ([], Role) -> examination_final:gm(certified, Role)
                 end},
     #gm_cmd{cmd = "智力闯关决赛", args = [], desc = "智力闯关决赛状态切换",
             do =
                 fun ([], _Role) ->
                         gen_fsm:send_event(examination_final, timeout)
                 end},
     #gm_cmd{cmd = "星座挑战", args = [], desc = "星座状态切换",
             do =
                 fun ([], _Role) ->
                         gen_fsm:send_event(constellation, timeout),
                         ok
                 end},
     #gm_cmd{cmd = "星座刷新", args = [], desc = "星座挑战刷新怪物",
             do =
                 fun ([], _Role) ->
                         constellation ! refresh_units,
                         ok
                 end},
     #gm_cmd{cmd = "清星座首杀", args = [], desc = "清理星座首杀记录",
             do =
                 fun ([], _Role) ->
                         ets:delete_all_objects(constellation_first1),
                         dets:delete_all_objects(constellation_first1),
                         ok
                 end},
     #gm_cmd{cmd = "设星座等级", args = [{int, "等级"}],
             desc = "开通星座挑战等级",
             do =
                 fun ([Lev],
                      Role = #role{m_constellation =
                                       MConstell = #m_constellation{}}) ->
                         {ok,
                          Role#role{m_constellation =
                                        MConstell#m_constellation{lev = Lev}}}
                 end},
     #gm_cmd{cmd = "清星座", args = [], desc = "清星座",
             do =
                 fun ([], _Role) ->
                         constellation:clean_units(all),
                         ets:delete_all_objects(constellation_unit),
                         dets:delete_all_objects(constellation_unit),
                         ok
                 end},
     #gm_cmd{cmd = "勇士下阶段", args = [], desc = "勇士战场下阶段",
             do =
                 fun ([], _Role) ->
                         cross:cast(warrior_mgr, m, []),
                         cross:cast(all, warrior_mgr, m, []),
                         ok
                 end},
     #gm_cmd{cmd = "勇士下阶段2", args = [],
             desc = "勇士战场下阶段(本地开启)",
             do =
                 fun ([], _Role) ->
                         warrior_mgr:m(),
                         ok
                 end},
     #gm_cmd{cmd = "钻石联赛下阶段", args = [], desc = "钻石联赛下阶段",
             do =
                 fun ([], _Role) ->
                         cross:cast(gold_league_mgr, m, []),
                         cross:cast(all, gold_league_mgr, m, []),
                         ok
                 end},
     #gm_cmd{cmd = "钻石联赛结束战斗", args = [], desc = "钻石联赛结束战斗",
             do =
                 fun ([], _Role) ->
                         gold_league:stop_combat(),
                         cross:cast(gold_league, stop_combat, []),
                         ok
                 end},
     #gm_cmd{cmd = "钻石联赛下阶段2", args = [],
             desc = "钻石联赛下阶段(本地开启)",
             do =
                 fun ([], _Role) ->
                         gold_league_mgr:m(),
                         ok
                 end},
     #gm_cmd{cmd = "钻石联赛战场下阶段", args = [],
             desc = "钻石联赛战场下阶段(本地开启)",
             do =
                 fun ([], Role) ->
                         gold_league:m(Role),
                         ok
                 end},
     #gm_cmd{cmd = "钻石联赛信息", args = [], desc = "钻石联赛信息",
             do =
                 fun ([], Role) ->
                         gold_league:print_info(Role),
                         ok
                 end},
     #gm_cmd{cmd = "钻石联赛个人信息", args = [], desc = "钻石联赛个人信息",
             do =
                 fun ([], Role) ->
                         gold_league:print_self_info(Role),
                         ok
                 end},
     #gm_cmd{cmd = "钻石联赛结束战斗", args = [], desc = "钻石联赛个人信息",
             do =
                 fun ([], _Role) ->
                         gold_league:stop_combat(),
                         ok
                 end},
     #gm_cmd{cmd = "设气血", args = [{int, "气血比"}],
             desc = "设置当前的气血比",
             do =
                 fun ([Val],
                      Role = #role{hp_max = HpMax, mp_max = MpMax}) ->
                         Role1 = Role#role{hp = round(HpMax * Val / 100),
                                           mp = round(MpMax * Val / 100)},
                         attr:push_10011(Role1),
                         {ok, Role1}
                 end},
     #gm_cmd{cmd = "设充值", args = [{int, "充值额度"}],
             desc = "设置当前的充值额度",
             do =
                 fun ([Val], Role) ->
                         Role1 = Role#role{charge = Val},
                         {ok, Role1}
                 end},
     #gm_cmd{cmd = "充值",
             args = [{int, "钻石", 100}, {int, "充值类型", 0}],
             desc = "充值指定钻石",
             do =
                 fun ([Gold, ChargeType],
                      #role{id = {Rid, P, Z}, channel_reg = ChannelReg,
                            account = Account, name = Name, lev = Lev,
                            classes = Classes}) ->
                         logger:debug("充值执行", [], gm_cmd, 3625),
                         Sn = lists:concat([p,
                                            date:unixtime(ms) * 100000000,
                                            Rid]),
                         _Ret = db:exec("insert into charge(sn, type, status, "
                                        "gold, charge_type, money, account, rid, "
                                        "platform, zone_id, channel_reg, name, "
                                        "classes, lev, is_test, ts) values(?, "
                                        "?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, "
                                        "?, ?, ?)",
                                        [Sn,
                                         1,
                                         0,
                                         Gold,
                                         ChargeType,
                                         Gold,
                                         Account,
                                         Rid,
                                         P,
                                         Z,
                                         ChannelReg,
                                         Name,
                                         Classes,
                                         Lev,
                                         1,
                                         date:unixtime()]),
                         charge:notice(Rid, P, Z, Sn),
                         ok
                 end},
     #gm_cmd{cmd = "设渠道号", args = [{int, "渠道号", 0}],
             desc = "设置渠道号",
             do =
                 fun ([ChannelReg], Role) ->
                         logger:debug("设置渠道号", [], gm_cmd, 3639),
                         Role1 = Role#role{channel_reg = ChannelReg},
                         notice:return("设置渠道号成功"),
                         {ok, Role1}
                 end},
     #gm_cmd{cmd = "提示", args = [], desc = "测试提示",
             do =
                 fun ([], #role{id = RoleId, name = RoleName}) ->
                         Msg = notice:format("~ts消耗了~ts，但是由于~ts不足~w，所以没法获得~ts",
                                             [{role_1, RoleId, RoleName},
                                              {assets_1, 90000, 500},
                                              {string_2, 5, "智商"},
                                              50,
                                              {item_2, 20000}]),
                         notice:send(conn_pid, 1, Msg),
                         notice:cast(all, 5, Msg),
                         ok
                 end},
     #gm_cmd{cmd = "重置神秘", args = [], desc = "重置神秘商店",
             do = fun ([], Role) -> store:reset_role(Role) end},
     #gm_cmd{cmd = "刷新活动怪", args = [], desc = "刷新活动怪",
             do =
                 fun ([], _Role) ->
                         campaign_unit ! make_unit,
                         ok
                 end},
     #gm_cmd{cmd = "打群架", args = [], desc = "打自己（克隆人）",
             do =
                 fun (_, Role = #role{classes = _Rclasses}) ->
                         {ok, F1} = role_convert:to(fighter, Role),
                         {ok, F2} = role_convert:to(fighter_clone, Role),
                         {ok, F3} = role_convert:to(fighter_clone, Role),
                         {ok, F4} = role_convert:to(fighter_clone, Role),
                         {ok, F5} = role_convert:to(fighter_clone, Role),
                         {ok, F6} = role_convert:to(fighter_clone, Role),
                         {ok, F7} = role_convert:to(fighter_clone, Role),
                         {ok, F8} = role_convert:to(fighter_clone, Role),
                         {ok, F9} = role_convert:to(fighter_clone, Role),
                         {ok, F10} = role_convert:to(fighter_clone, Role),
                         combat_mgr:start_combat(0,
                                                 [F1, F2, F3, F4, F5],
                                                 [F6, F7, F8, F9, F10]),
                         ok
                 end},
     #gm_cmd{cmd = "cmd",
             args = [{int, "命令号"}, {string, "参数", "{}"}],
             desc = "执行服务端命令(模拟客户端发送消息)",
             do =
                 fun ([Code, ArgStr], _Role) ->
                         case util:string_to_term(ArgStr) of
                             {error, Err} ->
                                 {reply, util:flist("命令的参数格式不正确: ~w", [Err])};
                             {ok, Data} ->
                                 case mapping:module(game_server, Code) of
                                     {error, _Reason} ->
                                         logger:debug("模块映射失败，请检查命令号是否正确",
                                                      [],
                                                      gm_cmd,
                                                      3714),
                                         {reply, "模块映射失败，请检查命令号是否正确"};
                                     {ok, _, _, Parser, Mod} ->
                                         logger:info("Data:~w",
                                                     [Data],
                                                     gm_cmd,
                                                     3717),
                                         case Parser:pack(cli, Code, Data) of
                                             {ok,
                                              <<_A1:32, _A2:16, Bin/binary>>} ->
                                                 logger:info("==============~w",
                                                             [{Parser,
                                                               Mod,
                                                               Code,
                                                               Bin}],
                                                             gm_cmd,
                                                             3720),
                                                 role:rpc(self(),
                                                          Parser,
                                                          Mod,
                                                          Code,
                                                          Bin),
                                                 ok;
                                             _Err ->
                                                 logger:error("打包数据出错，请检查参数格式是否正确:~w",
                                                              [_Err],
                                                              gm_cmd,
                                                              3724),
                                                 {reply, "打包数据出错，请检查参数格式是否正确"}
                                         end
                                 end
                         end
                 end},
     #gm_cmd{cmd = "协议监控", args = [{atom, "状态", true}],
             desc = "协议请求发送监控 true | false",
             do =
                 fun ([Debug], _Role) ->
                         get(conn_pid) ! {debug, Debug},
                         ok
                 end},
     #gm_cmd{cmd = "测试注册", args = [], desc = "测试注册",
             do =
                 fun ([], Role) ->
                         log_account:update(Role),
                         ok
                 end},
     #gm_cmd{cmd = "加竞技场魂", args = [{int, "魂数"}],
             desc = "增加竞技场魂",
             do =
                 fun ([Val], Role) ->
                         Soul = var:get_var(Role, other, 2012, 0),
                         NewSoul = Soul + Val,
                         Role1 = var:set_var(Role, other, 2012, NewSoul),
                         case arena_mgr:init_panel(Role) of
                             {true, Cup, Enemy, ArenaLog} ->
                                 role:link_send(Role1,
                                                12200,
                                                {Cup,
                                                 NewSoul,
                                                 Enemy,
                                                 ArenaLog}),
                                 {ok, Role1};
                             _ -> {reply, "增加失败"}
                         end
                 end},
     #gm_cmd{cmd = "竞技场roll", args = [{int, "roll次数"}],
             desc = "增加竞技场roll点次数",
             do =
                 fun ([Val], Role = #role{m_arena = Marena}) ->
                         NewMarena = Marena#m_arena{roll_time = Val},
                         Role1 = Role#role{m_arena = NewMarena},
                         arena_mgr:push_count(Role1),
                         {ok, Role1}
                 end},
     #gm_cmd{cmd = "进跨服", args = [], desc = "进入跨服地图",
             do =
                 fun ([], Role) ->
                         case c_trip_mgr:enter(Role) of
                             {ok, NewRole} -> {ok, NewRole};
                             {false, Reason} -> {reply, Reason}
                         end
                 end},
     #gm_cmd{cmd = "退跨服", args = [], desc = "退出跨服地图",
             do =
                 fun ([], Role) ->
                         case c_trip_mgr:exit(Role) of
                             {ok, NewRole} -> {ok, NewRole};
                             {false, Reason} -> {reply, Reason}
                         end
                 end},
     #gm_cmd{cmd = "重置胜利之路", args = [], desc = "重置胜利之路",
             do =
                 fun ([], Role = #role{m_arena = Marena}) ->
                         RollGraph = arena_mgr:make_graph(Role),
                         NewMarena = Marena#m_arena{roll_graph = RollGraph,
                                                    roll_id = 0},
                         NewRole = Role#role{m_arena = NewMarena},
                         arena_mgr:push_graph(NewRole),
                         {ok, NewRole}
                 end},
     #gm_cmd{cmd = "协议请求",
             args =
                 [{int, "协议号"}, {string, "协议请求附带值 举例=>1,abc", ""}],
             desc = "协议请求消息(服务器端测试使用)",
             do =
                 fun ([Code, Info], Role) ->
                         case mapping:module(game_server, Code) of
                             {ok, _, object, Parser, Mod} ->
                                 L = string:tokens(Info, ";"),
                                 Fun = fun (A) ->
                                               case catch list_to_integer(A) of
                                                   {'EXIT', _} ->
                                                       case catch
                                                                list_to_float(A)
                                                           of
                                                           {'EXIT', _} ->
                                                               case
                                                                   util:string_to_term(A)
                                                                   of
                                                                   {ok, Term}
                                                                       when
                                                                         is_list(Term)
                                                                             orelse
                                                                             is_tuple(Term) ->
                                                                       Term;
                                                                   _ ->
                                                                       list_to_binary(A)
                                                               end;
                                                           Float -> Float
                                                       end;
                                                   Int -> Int
                                               end
                                       end,
                                 ArgL = lists:map(Fun, L),
                                 Tuple = list_to_tuple(ArgL),
                                 case Parser:pack(cli, Code, Tuple) of
                                     {ok, <<_A1:32, _A2:16, Bin/binary>>} ->
                                         role:rpc(Role#role.pid,
                                                  Parser,
                                                  Mod,
                                                  Code,
                                                  Bin),
                                         ok;
                                     _ -> {reply, "非法参数"}
                                 end;
                             _ -> {reply, "非法协议号"}
                         end
                 end},
     #gm_cmd{cmd = "播放剧情",
             args = [{int, "剧情ID"}, {int, "第几步", 1}],
             desc = "播放指定剧情",
             do =
                 fun ([Id, Num],
                      Role = #role{m_plot =
                                       MPlot = #m_plot{play_list = PlayL,
                                                       do_list = DoL}}) ->
                         case lists:keyfind(Id, #plot.id, DoL) of
                             #plot{act_idx = ActIdx} when ActIdx > 0 -> ok;
                             Plot = #plot{} ->
                                 NRole = Role#role{m_plot =
                                                       MPlot#m_plot{play_list =
                                                                        PlayL ++
                                                                            [Id],
                                                                    do_list =
                                                                        lists:keyreplace(Id,
                                                                                         #plot.id,
                                                                                         DoL,
                                                                                         Plot#plot{act_idx
                                                                                                       =
                                                                                                       Num})}},
                                 {ok, plot_act:continue(NRole)};
                             _ ->
                                 case plot_data:get(Id) of
                                     #plot_trigger{type = 1} ->
                                         Plot = #plot{id = Id, act_idx = Num},
                                         NRole = Role#role{m_plot =
                                                               MPlot#m_plot{play_list
                                                                                =
                                                                                PlayL
                                                                                    ++
                                                                                    [Id],
                                                                            do_list
                                                                                =
                                                                                [Plot
                                                                                 | DoL]}},
                                         {ok, plot_act:continue(NRole)};
                                     _ -> {reply, lang:get("剧情基础数据不存在")}
                                 end
                         end
                 end},
     #gm_cmd{cmd = "协议推送",
             args =
                 [{int, "协议号"}, {string, "协议请求附带值 举例=>1;abc", ""}],
             desc = "推送请求消息(客户端测试使用)",
             do =
                 fun ([Code, Info], _Role) ->
                         L = string:tokens(Info, ";"),
                         Fun = fun (A) ->
                                       case catch list_to_integer(A) of
                                           {'EXIT', _} ->
                                               case catch list_to_float(A) of
                                                   {'EXIT', _} ->
                                                       case
                                                           util:string_to_term(A)
                                                           of
                                                           {ok, Term}
                                                               when
                                                                 is_list(Term)
                                                                     orelse
                                                                     is_tuple(Term) ->
                                                               Term;
                                                           _ ->
                                                               list_to_binary(A)
                                                       end;
                                                   Float -> Float
                                               end;
                                           Int -> Int
                                       end
                               end,
                         ArgL = lists:map(Fun, L),
                         Tuple = list_to_tuple(ArgL),
                         sys_conn:pack_send(Code, Tuple),
                         ok
                 end},
     #gm_cmd{cmd = "获取buff", args = [{int, "buffid"}],
             desc = "给角色增加一个buff",
             do =
                 fun ([Buffid], Role) -> buff:add_and_calc(Role, Buffid)
                 end},
     #gm_cmd{cmd = "获取家具", args = [{int, "fid", 0}],
             desc = "添加一件家具到仓库",
             do =
                 fun ([Fid], Role) ->
                         family_logic:add_frunishing(Role, Fid, 1),
                         ok
                 end},
     #gm_cmd{cmd = "刷新家具商店", args = [], desc = "刷新家具商店",
             do =
                 fun ([], Role) ->
                         {ok, NewRole1} = family_shop:flush_store(Role),
                         {ok, NewRole1}
                 end},
     #gm_cmd{cmd = "清空家具", args = [], desc = "清空家具",
             do =
                 fun ([],
                      #role{m_family = #m_family{cur_id = FamilyId}}) ->
                         family_mgr ! {clean_furnishing, FamilyId},
                         ok
                 end},
     #gm_cmd{cmd = "设清洁度", args = [{int, "cleanness", 80}],
             desc = "设清洁度",
             do =
                 fun ([Cleanness],
                      #role{m_family = #m_family{cur_id = FamilyId}}) ->
                         family_mgr ! {set_cleanness, FamilyId, Cleanness},
                         ok
                 end},
     #gm_cmd{cmd = "初始化坐骑", args = [], desc = "初始化坐骑",
             do =
                 fun ([], Role) ->
                         MMount = mount:init(),
                         {ok, Role#role{m_mount = MMount}}
                 end},
     #gm_cmd{cmd = "获取坐骑", args = [], desc = "获得坐骑",
             do = fun ([], Role) -> mount:create_mount(Role) end},
     #gm_cmd{cmd = "设坐骑等级",
             args = [{int, "坐骑索引", 1}, {int, "等级", 30}],
             desc = "获得坐骑",
             do =
                 fun ([Index, Lev], Role) ->
                         mount:set_mount_lev(Role, Index, Lev)
                 end},
     #gm_cmd{cmd = "孵化坐骑", args = [], desc = "获得坐骑",
             do =
                 fun ([],
                      Role = #role{m_mount =
                                       MMount = #m_mount{mounts = Mounts}}) ->
                         NewMounts = [Mount#mount{live_status = 3}
                                      || Mount = #mount{} <- Mounts],
                         NewRole = Role#role{m_mount =
                                                 MMount#m_mount{mounts =
                                                                    NewMounts}},
                         mount:push_mount(NewRole),
                         {ok, NewRole}
                 end},
     #gm_cmd{cmd = "加坐骑精力", args = [{int, "值", 50}],
             desc = "加坐骑精力",
             do =
                 fun ([Val], Role) ->
                         Gain = format:val_to_gain([{90021, Val}]),
                         case role_gain:do_notice(Gain, Role) of
                             {ok, NewRole} -> {ok, NewRole};
                             {false, #gain{msg = Msg}} -> {false, Msg};
                             _Err ->
                                 logger:debug("出错了:~w", [_Err], gm_cmd, 4034),
                                 {false, lang:get("出错了")}
                         end
                 end},
     #gm_cmd{cmd = "扣坐骑精力", args = [{int, "值", 50}],
             desc = "加坐骑精力",
             do =
                 fun ([Val], Role) ->
                         Loss = format:val_to_loss([{90021, Val}]),
                         case role_gain:do_notice(Loss, Role) of
                             {ok, NewRole} -> {ok, NewRole};
                             {false, #gain{msg = Msg}} -> {false, Msg};
                             _Err ->
                                 logger:debug("出错了:~w", [_Err], gm_cmd, 4052),
                                 {false, lang:get("出错了")}
                         end
                 end},
     #gm_cmd{cmd = "加孵化值", args = [{int, "值", 50}],
             desc = "加孵化值",
             do =
                 fun ([Val], Role) -> mount:check_active_mount(Role, Val)
                 end},
     #gm_cmd{cmd = "加许愿值", args = [{int, "growth", 10}],
             desc = "加许愿值",
             do =
                 fun ([Growth],
                      #role{m_family = #m_family{cur_id = FamilyId}}) ->
                         family_mgr !
                             {add_magic_beans_growth, FamilyId, Growth},
                         ok
                 end},
     #gm_cmd{cmd = "重置许愿树", args = [], desc = "重置许愿树",
             do =
                 fun ([],
                      #role{m_family = #m_family{cur_id = FamilyId}}) ->
                         family_mgr ! {clean_wake_time, FamilyId},
                         ok
                 end},
     #gm_cmd{cmd = "获得所有家具", args = [], desc = "获得所有家具",
             do =
                 fun ([], Role) ->
                         Fun = fun (Fid) ->
                                       family_logic:add_frunishing(Role, Fid, 1)
                               end,
                         lists:foreach(Fun, lists:seq(1, 100)),
                         ok
                 end},
     #gm_cmd{cmd = "清洁度结算", args = [], desc = "清洁度结算",
             do =
                 fun ([],
                      #role{m_family = #m_family{cur_id = FamilyId}}) ->
                         family_mgr ! {calc_cleanness, FamilyId},
                         ok
                 end},
     #gm_cmd{cmd = "家园0点更新", args = [], desc = "家园0点更新",
             do =
                 fun ([],
                      #role{m_family = #m_family{cur_id = FamilyId}}) ->
                         family_mgr ! {day_reset, FamilyId},
                         ok
                 end},
     #gm_cmd{cmd = "重启家园进程", args = [], desc = "重启家园进程",
             do =
                 fun ([],
                      #role{m_family = #m_family{cur_id = FamilyId}}) ->
                         family_mgr ! {restart, FamilyId},
                         ok
                 end},
     #gm_cmd{cmd = "查看属性", args = [], desc = "查看装备属性",
             do =
                 fun ([], Role) ->
                         eqm_attr:push_eqm_point(Role),
                         ok
                 end},
     #gm_cmd{cmd = "镶嵌宝石", args = [{int, "lev"}],
             desc = "给角色镶嵌宝石",
             do =
                 fun ([Lev],
                      Role = #role{p_eqm = #package{items = Items},
                                   classes = Classes}) ->
                         case gm_srv_data:get_data({Lev, Classes}) of
                             #{stone_list := List} ->
                                 NewRole = dembed(Items, List, Role),
                                 NewRole1 = attr:calc_and_push(NewRole),
                                 {ok, NewRole1};
                             _ -> {reply, lang:get("无法找到镶嵌数据")}
                         end
                 end},
     #gm_cmd{cmd = "开放7日目标", args = [{int, "day", 7}],
             desc = "开放7日目标",
             do =
                 fun ([Day], Role = #role{m_goal = MGoal}) ->
                         {ok, Role#role{m_goal = MGoal#m_goal{days = Day}}}
                 end},
     #gm_cmd{cmd = "一元夺宝", args = [{int, "time", 3600}],
             desc = "一元夺宝开关",
             do =
                 fun ([Time], _Role) ->
                         big_world:cast(erlang,
                                        send,
                                        [lottery_mgr,
                                         {start_gm,
                                          date:unixtime(),
                                          date:unixtime() + Time}]),
                         ok
                 end},
     #gm_cmd{cmd = "竞拍", args = [{int, "time", 3600}],
             desc = "竞拍开关",
             do =
                 fun ([Time], _Role) ->
                         auction_mgr:start_gm(date:unixtime(),
                                              date:unixtime() + Time),
                         ok
                 end},
     #gm_cmd{cmd = "清空礼包", args = [], desc = "结婚纪念清空已领取礼包",
             do =
                 fun ([], Role = #role{m_wedding = MWedding}) ->
                         {ok,
                          Role#role{m_wedding =
                                        MWedding#m_wedding{reward = []}}}
                 end},
     #gm_cmd{cmd = "幸运值", args = [{int, "值"}],
             desc = "增加幸运值",
             do =
                 fun ([Val], Role) ->
                         Gain = format:val_to_gain([{90022, Val}]),
                         case role_gain:do_notice(Gain, Role) of
                             {ok, NewRole} -> {ok, NewRole};
                             {false, #gain{msg = Msg}} -> {false, Msg};
                             _Err ->
                                 logger:debug("出错了:~w", [_Err], gm_cmd, 4212),
                                 {false, lang:get("出错了")}
                         end
                 end},
     #gm_cmd{cmd = "结婚时间",
             args =
                 [{int, "year", 2016},
                  {int, "month", 1},
                  {int, "Day", 1},
                  {int, "hour", 1},
                  {int, "min", 1},
                  {int, "sec", 1}],
             desc = "修改结婚时间",
             do =
                 fun ([Year, Month, Day, Hour, Min, Sec],
                      #role{id = RoleId}) ->
                         Time = date:datetime_to_seconds({{Year, Month, Day},
                                                          {Hour, Min, Sec}}),
                         case wedding:lover(RoleId) of
                             {ok, #lover{lover_id = LoverId} = Lover1} ->
                                 ets:insert(lover, Lover1#lover{time = Time}),
                                 dets:insert(lover, Lover1#lover{time = Time}),
                                 case wedding:lover(LoverId) of
                                     {ok, Lover2} ->
                                         ets:insert(lover,
                                                    Lover2#lover{time = Time}),
                                         dets:insert(lover,
                                                     Lover2#lover{time = Time}),
                                         ok;
                                     _ -> {false, lang:get("出错了")}
                                 end;
                             _ -> {false, lang:get("出错了")}
                         end
                 end},
     #gm_cmd{cmd = "加资产",
             args = [{int, "资源类型", 90001}, {int, "值", 100}],
             desc = "增加资产",
             do =
                 fun ([Assets, Val], Role) ->
                         Gain = format:val_to_gain([{Assets, Val}]),
                         case role_gain:do_notice(Gain, Role) of
                             {ok, NewRole} -> {ok, NewRole};
                             {false, #gain{msg = Msg}} -> {false, Msg};
                             _Err ->
                                 logger:debug("出错了:~w", [_Err], gm_cmd, 4261),
                                 {false, lang:get("出错了")}
                         end
                 end},
     #gm_cmd{cmd = "挑战排行结算", args = [], desc = "挑战排行结算",
             do =
                 fun ([], _Role) -> endless_challenge_rank ! reward_tick
                 end},
     #gm_cmd{cmd = "挑战排行清空", args = [], desc = "挑战排行清空",
             do =
                 fun ([], _Role) -> endless_challenge_rank ! reset_tick
                 end},
     #gm_cmd{cmd = "清空图鉴", args = [], desc = "清空图鉴",
             do =
                 fun ([], Role = #role{}) ->
                         role:link_send(Role, 17100, {[], []}),
                         {ok, Role#role{m_handbook = #m_handbook{}}}
                 end},
     #gm_cmd{cmd = "测试图鉴收藏", args = [], desc = "测试图鉴收藏",
             do =
                 fun ([], Role = #role{}) ->
                         handbook:adm_show(Role),
                         ok
                 end},
     #gm_cmd{cmd = "设爵位层数", args = [{int, "设爵位层数", 3}],
             do =
                 fun ([Glory],
                      Role = #role{m_glory =
                                       MGlory = #m_glory{max_id = MaxId}}) ->
                         NewRole = Role#role{m_glory =
                                                 MGlory#m_glory{new_id = Glory,
                                                                max_id =
                                                                    max(MaxId,
                                                                        Glory)}},
                         glory_new:push(NewRole),
                         {ok, NewRole}
                 end},
     #gm_cmd{cmd = "清活动时间", args = [], desc = "清活动时间",
             do =
                 fun ([], _Role) ->
                         ets:delete_all_objects(camp_time),
                         dets:delete_all_objects(camp_time)
                 end},
     #gm_cmd{cmd = "刷孔明灯", args = [], desc = "刷孔明灯",
             do =
                 fun ([], _Role) ->
                         camp_mid_autumn ! start_kongming_lanterns,
                         ok
                 end},
     #gm_cmd{cmd = "灯会下阶段", args = [], desc = "灯会下阶段",
             do =
                 fun ([], _Role) ->
                         camp_kongming_lanterns:next(),
                         ok
                 end},
     #gm_cmd{cmd = "赏月下阶段", args = [], desc = "赏月下阶段",
             do =
                 fun ([], _Role) ->
                         camp_enjoy_moon:next(),
                         ok
                 end},
     #gm_cmd{cmd = "设中秋祈愿值", args = [{int, "祈愿值", 1000}],
             desc = "赏月下阶段",
             do =
                 fun ([WishVal], _Role) ->
                         camp_enjoy_moon:set_wish_val(WishVal),
                         ok
                 end},
     #gm_cmd{cmd = "重置突破", args = [], desc = "重置突破",
             do = fun ([], Role) -> lev_break:gm(Role, reset) end},
     #gm_cmd{cmd = "提交突破碎片", args = [{int, "数量", 1}],
             desc = "提交突破碎片",
             do =
                 fun ([Num], Role) ->
                         lev_break:gm(Role, {contribute, Num}),
                         ok
                 end},
     #gm_cmd{cmd = "清空突破", args = [], desc = "清空突破",
             do =
                 fun ([], Role) ->
                         lev_break:gm(Role, unactive),
                         ok
                 end},
     #gm_cmd{cmd = "清空团购", args = [], desc = "清空团购数据",
             do =
                 fun ([], _Role) ->
                         campaign_group_purchase:info(clear),
                         ok
                 end},
     #gm_cmd{cmd = "重载团购", args = [], desc = "重载团购数据",
             do =
                 fun ([], _Role) ->
                         campaign_group_purchase:info(reload),
                         ok
                 end},
     #gm_cmd{cmd = "激活突破碎片", args = [], desc = "激活突破碎片",
             do =
                 fun ([], #role{name = Name, pid = Pid}) ->
                         lev_break ! {active, Pid, Name},
                         ok
                 end},
     #gm_cmd{cmd = "突破boss天数", args = [{int, "天数", 1}],
             desc = "设置突破出现boss天数",
             do =
                 fun ([Day], _Role) ->
                         lev_break:gm(boss_day, Day),
                         ok
                 end},
     #gm_cmd{cmd = "头像时间",
             args =
                 [{int, "year", 2016},
                  {int, "month", 1},
                  {int, "Day", 1},
                  {int, "hour", 1},
                  {int, "min", 1},
                  {int, "sec", 1}],
             desc = "修改头像时间",
             do =
                 fun ([Year, Month, Day, Hour, Min, Sec],
                      Role = #role{}) ->
                         head:gm_change(Role, Year, Month, Day, Hour, Min, Sec)
                 end},
     #gm_cmd{cmd = "头像框时间",
             args =
                 [{int, "id", 0},
                  {int, "year", 2016},
                  {int, "month", 1},
                  {int, "Day", 1},
                  {int, "hour", 1},
                  {int, "min", 1},
                  {int, "sec", 1}],
             desc = "修改头像框时间",
             do =
                 fun ([Id, Year, Month, Day, Hour, Min, Sec],
                      Role = #role{}) ->
                         head:gm_change_frame(Role,
                                              Id,
                                              Year,
                                              Month,
                                              Day,
                                              Hour,
                                              Min,
                                              Sec)
                 end},
     #gm_cmd{cmd = "智多星开启", args = [], desc = "智多星开启",
             do =
                 fun ([], #role{}) ->
                         camp_national_wisdom:info(gm_start),
                         ok
                 end},
     #gm_cmd{cmd = "惊喜连连转", args = [], desc = "重置惊喜连连转投掷次数",
             do =
                 fun ([], Role) -> camp_login_roll:gm_reset(Role) end},
     #gm_cmd{cmd = "连续充值", args = [{int, "day", 0}],
             desc = "连续充值修改天数",
             do =
                 fun ([Day], Role) ->
                         camp_series_recharge:gm_reset(Role, Day)
                 end},
     #gm_cmd{cmd = "开服连续充值", args = [{int, "day", 0}],
             desc = "连续充值修改天数",
             do =
                 fun ([Day], Role) ->
                         camp_series_recharge_open:gm_reset(Role, Day)
                 end},
     #gm_cmd{cmd = "连续充值数据", args = [], desc = "连续充值修改天数",
             do =
                 fun ([], Role) -> camp_series_recharge:gm(Role) end},
     #gm_cmd{cmd = "连续充值跨天", args = [], desc = "连续充值修改天数",
             do = fun ([], Role) -> camp_pay_continus:gm(Role) end},
     #gm_cmd{cmd = "连续充值重置", args = [], desc = "连续充值",
             do =
                 fun ([], Role) -> camp_pay_continus:gm_reset(Role) end},
     #gm_cmd{cmd = "清转职时间", args = [{int, "转职时间戳", 100}],
             desc = "清转职时间",
             do =
                 fun ([Time], Role = #role{classes = Classes}) ->
                         NewRole = var:set_var(Role, other, 2046, Time),
                         ClassesModifyTimes = var:get_var(Role, other, 2047, 0),
                         role:link_send(NewRole,
                                        10029,
                                        {Classes, Time, ClassesModifyTimes}),
                         {ok, NewRole}
                 end},
     #gm_cmd{cmd = "诸神重载", args = [], desc = "诸神重载",
             do =
                 fun ([], _Role) ->
                         big_world:call(gods_duel_mgr, reload, []),
                         ok
                 end},
     #gm_cmd{cmd = "诸神下阶段", args = [], desc = "诸神下阶段",
             do =
                 fun ([], _Role) ->
                         big_world:call(gods_duel_mgr, next, []),
                         ok
                 end},
     #gm_cmd{cmd = "诸神重置", args = [], desc = "诸神重置",
             do =
                 fun ([], _Role) ->
                         big_world:call(gods_duel_mgr, reset, []),
                         ok
                 end},
     #gm_cmd{cmd = "诸神统计", args = [], desc = "诸神统计",
             do =
                 fun ([], _Role) ->
                         big_world:call(gods_duel_mgr, rank_cleanness, []),
                         ok
                 end},
     #gm_cmd{cmd = "诸神队伍上报", args = [], desc = "诸神队伍上报",
             do =
                 fun ([], _Role) ->
                         gods_duel_agent:info(sign_team),
                         ok
                 end},
     #gm_cmd{cmd = "诸神小组赛分组", args = [], desc = "诸神小组赛分组",
             do =
                 fun ([], _Role) ->
                         big_world:cast(gods_duel_mgr, info, [fetch_group]),
                         big_world:cast(gods_duel_mgr,
                                        info,
                                        [{goto_state, match_256_idle_1}]),
                         ok
                 end},
     #gm_cmd{cmd = "诸神淘汰赛", args = [], desc = "诸神小组赛分组",
             do =
                 fun ([], _Role) ->
                         big_world:cast(gods_duel_mgr, info, [statistics]),
                         big_world:cast(gods_duel_mgr,
                                        info,
                                        [{goto_state, match_idle_32}]),
                         big_world:cast(gods_duel_mgr, info, [vote_reset]),
                         ok
                 end},
     #gm_cmd{cmd = "诸神比赛下阶段", args = [], desc = "诸神比赛下阶段",
             do =
                 fun ([], _Role) ->
                         big_world:cast(gods_duel_match, next, []),
                         ok
                 end},
     #gm_cmd{cmd = "诸神投票支持率", args = [{int, "支持率", 50}],
             desc = "设置诸神投票支持率",
             do =
                 fun ([Ratio], _Role) ->
                         logger:debug("===========:~w", [Ratio], gm_cmd, 4635),
                         gods_duel_agent:info(sync_voting),
                         erlang:send_after(100,
                                           gods_duel_agent,
                                           {set_vote_ratio, Ratio}),
                         ok
                 end},
     #gm_cmd{cmd = "", args = [], desc = "诸神比赛下阶段",
             do =
                 fun ([], _Role) ->
                         big_world:cast(gods_duel_match, next, []),
                         ok
                 end},
     #gm_cmd{cmd = "结拜战斗", args = [], desc = "结拜跳过战斗",
             do =
                 fun ([], #role{m_sworn = #m_sworn{id = SwornId}}) ->
                         sworn ! {combat_over, [], SwornId},
                         ok
                 end},
     #gm_cmd{cmd = "结拜重置", args = [], desc = "重置结拜状态",
             do = fun ([], Role) -> sworn:sworn_clear(Role) end},
     #gm_cmd{cmd = "结拜剧情", args = [], desc = "直接进入结拜剧情",
             do = fun ([], Role) -> sworn:sworn_play(Role) end},
     #gm_cmd{cmd = "结拜清空", args = [], desc = "清空数据",
             do =
                 fun ([], _Role) ->
                         sworn ! gm_clear,
                         ok
                 end},
     #gm_cmd{cmd = "回归登陆", args = [{int, "day", 1}],
             desc = "老玩家回归登陆",
             do =
                 fun ([Day], Role) ->
                         regression_login:gm_login_day(Role, Day)
                 end},
     #gm_cmd{cmd = "回归登陆时间", args = [{int, "day", 1}],
             desc = "老玩家回归登陆",
             do =
                 fun ([Day], Role) ->
                         regression_login:gm_login_time(Role, Day)
                 end},
     #gm_cmd{cmd = "累计活跃度", args = [{int, "activity", 1}],
             desc = "老玩家回归累计活跃度",
             do =
                 fun ([Activity], Role) ->
                         friend_recall:gm_activity(Role, Activity)
                 end},
     #gm_cmd{cmd = "好友招募清空", args = [], desc = "老玩家回归登陆",
             do =
                 fun (_, Role) -> friend_recall:gm_cancl_recall(Role)
                 end},
     #gm_cmd{cmd = "好友招募绑定", args = [], desc = "好友绑定清空",
             do =
                 fun (_, Role) -> friend_recall:gm_cancl_recalled(Role)
                 end},
     #gm_cmd{cmd = "欢乐助长礼", args = [{int, "day", 1}],
             desc = "欢乐助长礼",
             do =
                 fun ([Day], Role) ->
                         friend_recall:gm_buff_change(Role, Day)
                 end},
     #gm_cmd{cmd = "打开大厅", args = [{int, "id", 1000}],
             desc = "打开已关闭大厅",
             do =
                 fun ([RoomId], _Role) ->
                         big_world:cast(preparation_room, open, [RoomId]),
                         big_world:cast(big_world,
                                        cast,
                                        [all,
                                         preparation_room,
                                         open,
                                         [RoomId]]),
                         ok
                 end},
     #gm_cmd{cmd = "关闭大厅", args = [{int, "id", 1000}],
             desc = "关闭已打开大厅",
             do =
                 fun ([RoomId], _Role) ->
                         big_world:cast(preparation_room, close, [RoomId]),
                         big_world:cast(big_world,
                                        cast,
                                        [all,
                                         preparation_room,
                                         close,
                                         [RoomId]]),
                         ok
                 end},
     #gm_cmd{cmd = "打雪仗下阶段", args = [], desc = "打雪仗下阶段",
             do = fun ([], _Role) -> campaign_snow_mgr:m() end},
     #gm_cmd{cmd = "改注册天数", args = [{int, "day", 1}],
             desc = "改注册天数",
             do =
                 fun ([Day], Role) ->
                         {ok,
                          Role#role{time_reg = date:unixtime() - Day * 86400}}
                 end},
     #gm_cmd{cmd = "许愿次数", args = [], desc = "重置许愿次数",
             do = fun (_, Role) -> campaign_wish:gm_times(Role) end},
     #gm_cmd{cmd = "限时购买", args = [], desc = "重置限时购买",
             do = fun (_, Role) -> campaign_limit:gm(Role) end},
     #gm_cmd{cmd = "清翅膀突破", args = [], desc = "清空翅膀突破",
             do =
                 fun (_, Role) -> wing:reset_lev_break_skill(Role) end},
     #gm_cmd{cmd = "删除翅膀突破技能", args = [], desc = "清空翅膀突破",
             do =
                 fun (_, Role) -> wing:del_lev_break_skill(Role) end},
     #gm_cmd{cmd = "加翅膀能量", args = [{int, "增加能量", 100}],
             desc = "加翅膀能量",
             do =
                 fun ([Power], Role) -> wing:add_wing_power(Role, Power)
                 end},
     #gm_cmd{cmd = "设翅膀能量", args = [{int, "能量", 100}],
             desc = "加翅膀能量",
             do =
                 fun ([Power], Role) -> wing:set_wing_power(Role, Power)
                 end},
     #gm_cmd{cmd = "开服翻牌", args = [], desc = "清空开服翻牌",
             do = fun (_, Role) -> campaign_card_open:gm(Role) end},
     #gm_cmd{cmd = "新手领取时间",
             args =
                 [{int, "年", 2015},
                  {int, "月", 1},
                  {int, "日", 1},
                  {int, "时", 0},
                  {int, "分", 0},
                  {int, "秒", 0}],
             desc = "修改新手领取时间",
             do =
                 fun ([Year, Month, Day, HH, MM, SS],
                      Role = #role{m_pet = MPet}) ->
                         Time = date:datetime_to_seconds({{Year, Month, Day},
                                                          {HH, MM, SS}}),
                         NewMPet = MPet#m_pet{time = Time},
                         NewRole = Role#role{m_pet = NewMPet},
                         pet_util:push_client_pets(NewRole),
                         {ok, NewRole}
                 end},
     #gm_cmd{cmd = "公会周奖励", args = [], desc = "发送公会周奖励",
             do =
                 fun ([], _Role) ->
                         campaign_misc:gm_week_reward(),
                         ets:delete_all_objects(guild_join),
                         dets:delete_all_objects(guild_join),
                         ok
                 end},
     #gm_cmd{cmd = "月度礼包", args = [], desc = "月度礼包",
             do =
                 fun ([], _Role) ->
                         month_gift:reload(),
                         ok
                 end},
     #gm_cmd{cmd = "奖励找回", args = [{int, "天数", 1}],
             desc = "修改奖励找回时间",
             do =
                 fun ([Day], Role) -> reward_back:gm(Role, Day) end},
     #gm_cmd{cmd = "清子女任务", args = [], desc = "清子女任务",
             do = fun ([], Role) -> quest_child:gm(Role, clear) end},
     #gm_cmd{cmd = "抛弃子女", args = [{int, "子女id", 1}],
             desc = "抛弃子女",
             do =
                 fun ([Id], Role = #role{id = {_, P, Z}}) ->
                         child:abandon(Role, {Id, P, Z})
                 end},
     #gm_cmd{cmd = "子女任务结果", args = [], desc = "子女任务结果",
             do =
                 fun ([], Role) -> quest_child:gm(Role, result) end},
     #gm_cmd{cmd = "设子女快乐值", args = [{int, "快乐值", 60}],
             desc = "设子女快乐值",
             do =
                 fun ([Val], Role) ->
                         child_effect:gm_set_hungry(Role, Val)
                 end},
     #gm_cmd{cmd = "百花祝福", args = [], desc = "重置百花祝福次数层数",
             do =
                 fun ([], Role) -> camp_wish_flower:gm_rest(Role) end},
     #gm_cmd{cmd = "清孕育任务", args = [], desc = "清孕育任务",
             do =
                 fun ([], Role) -> quest_pregnancy:gm(Role, clear) end},
     #gm_cmd{cmd = "压岁钱", args = [{int, "第几天", 1}],
             desc = "设置天数",
             do =
                 fun ([Day], _Role) ->
                         lucky_money ! {gm, Day},
                         ok
                 end},
     #gm_cmd{cmd = "清空压岁钱", args = [], desc = "清空压岁钱数据",
             do =
                 fun (_, Role) ->
                         ets:delete(lucky_money_role, Role#role.id),
                         dets:delete(lucky_money_role, Role#role.id),
                         ok
                 end},
     #gm_cmd{cmd = "设置珍宝石板",
             args =
                 [{int, "X轴", 2},
                  {int, "Y轴", 2},
                  {int, "类型", 1},
                  {int, "ID", 1},
                  {int, "硬度", 1},
                  {int, "特殊ID", 1}],
             desc = "设置珍宝石板数据",
             do =
                 fun ([X, Y, Type, Id, Hard, SpecialId], Role) ->
                         maze:gm(Role, X, Y, Type, Id, Hard, SpecialId)
                 end},
     #gm_cmd{cmd = "重置珍宝石板", args = [], desc = "重置珍宝石板数据",
             do = fun (_, Role) -> maze:gm_reset(Role) end},
     #gm_cmd{cmd = "珍宝石板数据", args = [], desc = "设置珍宝石板数据",
             do = fun (_, Role) -> maze:gm_data(Role) end},
     #gm_cmd{cmd = "删除祈福属性", args = [], desc = "删除祈福",
             do =
                 fun (_, Role) ->
                         NewRole = guild_role:gm_reset_element(Role),
                         NewRole1 = attr:calc_and_push(NewRole),
                         guild_role:push_element_info(NewRole1),
                         {ok, NewRole1}
                 end},
     #gm_cmd{cmd = "设公会元素等级", args = [{int, "等级", 0}],
             desc = "设公会元素等级",
             do =
                 fun ([NLev], Role) ->
                         guild_build:gm_set_element_lev(Role, NLev),
                         ok
                 end},
     #gm_cmd{cmd = "开抽奖", args = [], desc = "打开抽奖",
             do =
                 fun ([], _Role) ->
                         raffle:switch(1),
                         ok
                 end},
     #gm_cmd{cmd = "关抽奖", args = [], desc = "打开抽奖",
             do =
                 fun ([], _Role) ->
                         raffle:switch(0),
                         ok
                 end},
     #gm_cmd{cmd = "星辰擂台排行", args = [], desc = "打开抽奖",
             do =
                 fun ([], _Role) ->
                         big_world:call(rencounter_mgr, info, [update_rank]),
                         ok
                 end},
     #gm_cmd{cmd = "擂台下阶段", args = [], desc = "打开抽奖",
             do =
                 fun ([], _Role) ->
                         big_world:call(rencounter_mgr, next, []),
                         ok
                 end},
     #gm_cmd{cmd = "擂台赛季结算", args = [], desc = "打开抽奖",
             do =
                 fun ([], _Role) ->
                         big_world:call(rencounter_mgr,
                                        info,
                                        [gm_season_reset]),
                         ok
                 end},
     #gm_cmd{cmd = "刷新擂台次数", args = [], desc = "刷新擂台次数",
             do =
                 fun ([], _Role = #role{id = RoleId}) ->
                         big_world:call(rencounter_mgr,
                                        info,
                                        [{gm_reset_join, RoleId}]),
                         ok
                 end},
     #gm_cmd{cmd = "设擂台星阶",
             args = [{int, "阶", 6}, {int, "星", 2}], desc = "刷新擂台次数",
             do =
                 fun ([RankLev, Star], _Role = #role{id = RoleId}) ->
                         big_world:call(rencounter_mgr,
                                        info,
                                        [{set_rank_lev,
                                          RoleId,
                                          RankLev,
                                          Star}]),
                         ok
                 end},
     #gm_cmd{cmd = "设擂台次数", args = [{int, "次数", 4}],
             desc = "设挑战次数",
             do =
                 fun ([Times], _Role = #role{id = RoleId}) ->
                         big_world:call(rencounter_mgr,
                                        info,
                                        [{gm_set_times, RoleId, Times}]),
                         ok
                 end},
     #gm_cmd{cmd = "设状态", args = [{int, "状态", 0}],
             desc = "设置角色状态",
             do =
                 fun ([Event], Role = #role{}) ->
                         NRole = Role#role{s_event = Event},
                         map:role_update(NRole),
                         {ok, NRole}
                 end},
     #gm_cmd{cmd = "清擂台排行", args = [], desc = "设置角色状态",
             do =
                 fun ([], _Role) ->
                         big_world:cast(rencounter_mgr, info, [clean_rank]),
                         ok
                 end},
     #gm_cmd{cmd = "获得法宝", args = [{int, "法宝"}],
             desc = "获得一个法宝",
             do =
                 fun ([BaseId], Role) ->
                         case talisman:add_talisman(Role, BaseId) of
                             {ok, NewRole, _} -> {ok, NewRole};
                             _ -> ok
                         end
                 end},
     #gm_cmd{cmd = "加法宝熔炉", args = [{int, "增加熔炉值"}],
             desc = "增加法宝熔炉值",
             do =
                 fun ([Val], Role) ->
                         case talisman:gm_up_fusion(Role, Val) of
                             {ok, NewRole} -> {ok, NewRole};
                             _ -> ok
                         end
                 end},
     #gm_cmd{cmd = "清空法宝", args = [], desc = "清空法宝",
             do =
                 fun ([],
                      Role = #role{m_talisman =
                                       Mtalisman = #m_talisman{items =
                                                                   Items}}) ->
                         NewMtalisman = Mtalisman#m_talisman{items = [],
                                                             plan_1 = [],
                                                             plan_2 = [],
                                                             fusion_lev = 0,
                                                             fusion_val = 0},
                         NewRole = Role#role{m_talisman = NewMtalisman},
                         talisman:push_19602(NewRole, Items),
                         talisman:push_19604(NewRole),
                         {ok, NewRole}
                 end},
     #gm_cmd{cmd = "突破次数", args = [{int, "次数", 0}],
             desc = "突破次数",
             do =
                 fun ([Times], Role) ->
                         case Role of
                             #role{lev = Lev,
                                   m_lev_break = MLevBreak = #m_lev_break{}}
                                 when Lev >= 95 ->
                                 NewRole = Role#role{m_lev_break =
                                                         MLevBreak#m_lev_break{times
                                                                                   =
                                                                                   Times}},
                                 {ok, NewRole};
                             _ -> ok
                         end
                 end},
     #gm_cmd{cmd = "公会拍卖", args = [], desc = "加公会拍卖物品",
             do =
                 fun ([], _Role) ->
                         gen_fsm:send_event(guild_auction, timeout),
                         ok
                 end},
     #gm_cmd{cmd = "加公会拍卖物品", args = [{int, "道具id", 0}],
             desc = "加公会拍卖物品",
             do =
                 fun ([ItemId], Role) ->
                         case Role of
                             #role{m_guild = #m_guild{id = Gid}} ->
                                 guild_auction:add(Gid, ItemId);
                             _ -> ok
                         end
                 end},
     #gm_cmd{cmd = "公会副本boss",
             args = [{int, "章节", 1}, {int, "据点", 1}],
             desc = "创建公会副本boss",
             do =
                 fun ([ChapterId, StrongpointId], Role) ->
                         guild_dungeon:gm_create_boss(Role,
                                                      ChapterId,
                                                      StrongpointId)
                 end},
     #gm_cmd{cmd = "公会副本重置", args = [], desc = "重置公会副本数据",
             do =
                 fun ([], Role) -> guild_dungeon:gm_reset(Role) end},
     #gm_cmd{cmd = "所有公会副本重置", args = [], desc = "所有公会副本重置",
             do = fun ([], _Role) -> guild_dungeon:gm_reset() end},
     #gm_cmd{cmd = "公会副本开启", args = [], desc = "开启公会副本活动",
             do =
                 fun ([], _Role) ->
                         guild_dungeon ! active_start,
                         ok
                 end},
     #gm_cmd{cmd = "公会副本结束", args = [], desc = "结束公会副本活动",
             do =
                 fun ([], _Role) ->
                         guild_dungeon ! active_end,
                         ok
                 end},
     #gm_cmd{cmd = "公会副本恢复血量", args = [],
             desc = "公会副本活动怪物恢复血量",
             do =
                 fun ([], _Role) ->
                         guild_dungeon ! active_recover,
                         ok
                 end},
     #gm_cmd{cmd = "公会副本开启所有", args = [],
             desc = "公会副本开启所有怪物",
             do = fun ([], Role) -> guild_dungeon:gm_all(Role) end},
     #gm_cmd{cmd = "关闭防沉迷", args = [], desc = "关闭防沉迷",
             do =
                 fun ([],
                      _Role = #role{id = {_, Plat, _},
                                    channel_reg = ChannelReg}) ->
                         Msg = lang:get("关闭防沉迷"),
                         notice:send(_Role, 1, Msg),
                         adm_mgr ! {close_authsfz, {Plat, ChannelReg}},
                         ok
                 end},
     #gm_cmd{cmd = "加附灵技能",
             args = [{int, "技能id"}, {int, "技能等级", 1}],
             desc = "给出战宠增加附灵技能",
             do =
                 fun ([SkillId, SkillLev],
                      Role = #role{m_pet = Mpet = #m_pet{pets = Pets}}) ->
                         case lists:keyfind(1, #pet.status, Pets) of
                             Pet = #pet{id = PetId} ->
                                 Pet1 = Pet#pet{spirit_skills =
                                                    [{SkillId, SkillLev}]},
                                 NewPets = lists:keystore(PetId,
                                                          #pet.id,
                                                          Pets,
                                                          Pet1),
                                 Role1 = Role#role{m_pet =
                                                       Mpet#m_pet{pets =
                                                                      NewPets}},
                                 pet:push_10502(Role1, Pet1),
                                 {ok, Role1};
                             _ -> {reply, lang:get("没有找到出战宠物")}
                         end
                 end},
     #gm_cmd{cmd = "设普通内丹技能",
             args =
                 [{int, "内丹槽id"}, {int, "内丹id"}, {int, "内丹等级", 1}],
             desc = "给出战宠增加内丹技能",
             do =
                 fun ([IndexId, RuneId, RuneLev],
                      Role = #role{m_pet = Mpet = #m_pet{pets = Pets}}) ->
                         case lists:keyfind(1, #pet.status, Pets) of
                             Pet = #pet{id = PetId, pet_rune = RuneList} ->
                                 case rune_data:get_base({RuneId, RuneLev}) of
                                     #{quality := 2} ->
                                         {reply,
                                          lang:get("技能为高级技能，不能用该gm命令学习")};
                                     _ ->
                                         NRuneList = lists:keystore(IndexId,
                                                                    #pet_rune.rune_index,
                                                                    RuneList,
                                                                    #pet_rune{rune_index
                                                                                  =
                                                                                  IndexId,
                                                                              rune_type
                                                                                  =
                                                                                  1,
                                                                              rune_status
                                                                                  =
                                                                                  1,
                                                                              rune_id
                                                                                  =
                                                                                  RuneId,
                                                                              rune_lev
                                                                                  =
                                                                                  RuneLev}),
                                         Pet1 = Pet#pet{pet_rune = NRuneList},
                                         NewPets = lists:keystore(PetId,
                                                                  #pet.id,
                                                                  Pets,
                                                                  Pet1),
                                         Role1 = Role#role{m_pet =
                                                               Mpet#m_pet{pets =
                                                                              NewPets}},
                                         pet:push_10502(Role1, Pet1),
                                         {ok, Role1}
                                 end;
                             _ -> {reply, lang:get("没有找到出战宠物")}
                         end
                 end},
     #gm_cmd{cmd = "设高级内丹",
             args = [{int, "内丹id"}, {int, "内丹等级", 1}],
             desc = "给出战宠增加内丹技能",
             do =
                 fun ([RuneId, RuneLev],
                      Role = #role{m_pet = Mpet = #m_pet{pets = Pets}}) ->
                         case lists:keyfind(1, #pet.status, Pets) of
                             Pet = #pet{id = PetId, pet_rune = RuneList} ->
                                 logger:debug("=============",
                                              [],
                                              gm_cmd,
                                              5354),
                                 case rune_data:get_base({RuneId, RuneLev}) of
                                     #{quality := 1} ->
                                         {reply,
                                          lang:get("技能为低级技能，不能用该gm命令学习")};
                                     _ ->
                                         logger:debug("=============",
                                                      [],
                                                      gm_cmd,
                                                      5359),
                                         case lists:keyfind(2,
                                                            #pet_rune.rune_type,
                                                            RuneList)
                                             of
                                             PetRune = #pet_rune{} ->
                                                 logger:debug("=============",
                                                              [],
                                                              gm_cmd,
                                                              5362),
                                                 NPetRune =
                                                     PetRune#pet_rune{rune_status
                                                                          = 1,
                                                                      rune_id =
                                                                          RuneId,
                                                                      rune_lev =
                                                                          RuneLev},
                                                 NRuneList = lists:keystore(2,
                                                                            #pet_rune.rune_type,
                                                                            RuneList,
                                                                            NPetRune),
                                                 Pet1 = Pet#pet{pet_rune =
                                                                    NRuneList},
                                                 NewPets = lists:keystore(PetId,
                                                                          #pet.id,
                                                                          Pets,
                                                                          Pet1),
                                                 Role1 = Role#role{m_pet =
                                                                       Mpet#m_pet{pets
                                                                                      =
                                                                                      NewPets}},
                                                 logger:debug("=============~w",
                                                              [Pet1],
                                                              gm_cmd,
                                                              5368),
                                                 pet:push_10502(Role1, Pet1),
                                                 {ok, Role1};
                                             _ ->
                                                 {reply, lang:get("该宠物没有高级内丹槽")}
                                         end
                                 end;
                             _ ->
                                 logger:debug("=============",
                                              [],
                                              gm_cmd,
                                              5376),
                                 {reply, lang:get("没有找到出战宠物")}
                         end
                 end},
     #gm_cmd{cmd = "开启防沉迷",
             args = [{int, "选项", 0}, {int, "值", 0}], desc = "开启防沉迷",
             do =
                 fun ([Type, Val],
                      _Role = #role{id = RoleId, channel_reg = ChannelReg}) ->
                         adm_mgr !
                             {open_authsfz, RoleId, ChannelReg, Type, Val},
                         ok
                 end},
     #gm_cmd{cmd = "套娃重置", args = [], desc = "套娃重置",
             do = fun ([], Role) -> camp_doll:gm_reset(Role) end},
     #gm_cmd{cmd = "悬赏奖章", args = [], desc = "获取悬赏奖章",
             do =
                 fun ([], Role = #role{pid = _Self}) ->
                         Item = quest_offer:get_offer_medal(Role, 30),
                         mail:send(Role,
                                   lang:get("悬赏奖章"),
                                   lang:get("悬赏奖章"),
                                   Item),
                         case role_gain:do([#gain{label = items, val = Item}],
                                           Role)
                             of
                             {false, G} -> {reply, G#gain.msg};
                             {ok, GainRole} -> {ok, GainRole}
                         end
                 end},
     #gm_cmd{cmd = "重置皇家任务", args = [], desc = "重置皇家任务",
             do =
                 fun ([], Role) ->
                         NewRole = quest_king:reset(Role),
                         {ok, NewRole}
                 end},
     #gm_cmd{cmd = "智慧答题下阶段", args = [], desc = "智慧答题下阶段",
             do =
                 fun ([], _Role) ->
                         cross:cast(question_match_mgr, next, []),
                         question_match_mgr:next(),
                         ok
                 end},
     #gm_cmd{cmd = "结束智慧答题", args = [], desc = "结束智慧答题",
             do =
                 fun ([], _Role) ->
                         cross:cast(question_match_mgr, stop, []),
                         question_match_mgr:stop(),
                         ok
                 end},
     #gm_cmd{cmd = "钻石换经验",
             args = [{int, "选项", 0}, {int, "值", 0}], desc = "钻石换经验",
             do =
                 fun ([AddExp, ReGold], Role) ->
                         Lost = #loss{label = gold, val = ReGold,
                                      msg = lang:get("钻石不足啊，你还来？")},
                         Gain = #gain{label = exp, val = AddExp},
                         GL = [Lost, Gain],
                         case role_gain:do_notice(GL, Role) of
                             {ok, NRole} -> {ok, NRole};
                             {false, #loss{msg = Msg}} -> {reply, Msg};
                             {false, #gain{msg = Msg}} -> {reply, Msg};
                             Err ->
                                 logger:error("钻石换经验出错[~w]",
                                              [Err],
                                              gm_cmd,
                                              5463),
                                 {error, Err}
                         end
                 end},
     #gm_cmd{cmd = "龙王试炼刷新", args = [], desc = "钻石换经验",
             do =
                 fun ([], Role) -> spirit_treasure_role:gm_reset(Role)
                 end},
     #gm_cmd{cmd = "龙王试炼周更新", args = [], desc = "龙王试炼周更新",
             do =
                 fun ([], Role) ->
                         spirit_treasure_role:gm_reset_week(Role)
                 end},
     #gm_cmd{cmd = "龙王试炼下阶段", args = [], desc = "龙王试炼周更新",
             do =
                 fun ([], _Role) ->
                         spirit_treasure_mgr:next(),
                         ok
                 end},
     #gm_cmd{cmd = "跨服龙王试炼", args = [], desc = "龙王试炼周更新",
             do =
                 fun ([], _Role) ->
                         cross:call(spirit_treasure_mgr, next, []),
                         ok
                 end},
     #gm_cmd{cmd = "龙王星级",
             args =
                 [{int, "怪物id", 32000}, {int, "星", 1}, {int, "击杀次数", 1}],
             desc = "龙王试炼周更新",
             do =
                 fun ([UnitId, Star, KillTimes], Role) ->
                         spirit_treasure_role:gm_set_star(Role,
                                                          UnitId,
                                                          Star,
                                                          KillTimes),
                         ok
                 end},
     #gm_cmd{cmd = "龙王试炼排行结算", args = [], desc = "龙王试炼排行结算",
             do =
                 fun ([], _Role) ->
                         spirit_treasure_role:gm_clear_unit_info(),
                         ok
                 end},
     #gm_cmd{cmd = "龙王重载配置", args = [], desc = "龙王重载配置",
             do =
                 fun ([], _Role) ->
                         spirit_treasure_mgr:reload(),
                         cross:cast(spirit_treasure_mgr, reload, []),
                         ok
                 end},
     #gm_cmd{cmd = "天启试炼刷新", args = [], desc = "钻石换经验",
             do =
                 fun ([], Role) -> oracle_treasure_role:gm_reset(Role)
                 end},
     #gm_cmd{cmd = "天启试炼周更新", args = [], desc = "龙王试炼周更新",
             do =
                 fun ([], Role) ->
                         oracle_treasure_role:gm_reset_week(Role)
                 end},
     #gm_cmd{cmd = "天启试炼下阶段", args = [], desc = "龙王试炼周更新",
             do =
                 fun ([], _Role) ->
                         oracle_treasure_mgr:next(),
                         ok
                 end},
     #gm_cmd{cmd = "跨服天启试炼", args = [], desc = "龙王试炼周更新",
             do =
                 fun ([], _Role) ->
                         cross:call(oracle_treasure_mgr, next, []),
                         ok
                 end},
     #gm_cmd{cmd = "天启星级",
             args =
                 [{int, "怪物id", 32000}, {int, "星", 1}, {int, "击杀次数", 1}],
             desc = "试炼周更新",
             do =
                 fun ([UnitId, Star, KillTimes], Role) ->
                         oracle_treasure_role:gm_set_star(Role,
                                                          UnitId,
                                                          Star,
                                                          KillTimes),
                         ok
                 end},
     #gm_cmd{cmd = "天启试炼排行结算", args = [], desc = "天启试炼排行结算",
             do =
                 fun ([], _Role) ->
                         oracle_treasure_role:gm_clear_unit_info(),
                         ok
                 end},
     #gm_cmd{cmd = "天启重载配置", args = [], desc = "龙王重载配置",
             do =
                 fun ([], _Role) ->
                         oracle_treasure_mgr:reload(),
                         cross:cast(oracle_treasure_mgr, reload, []),
                         ok
                 end},
     #gm_cmd{cmd = "翻牌清空", args = [], desc = "翻牌清空",
             do =
                 fun ([], Role = #role{m_campaign = Camp}) ->
                         NFlop = #camp_new_flop{group = 0, times = 0,
                                                rewarded = []},
                         NRole = Role#role{m_campaign =
                                               Camp#m_campaign{camp_new_flop =
                                                                   NFlop}},
                         {ok, NRole}
                 end},
     #gm_cmd{cmd = "更新跨服", args = [], desc = "更新跨服数据",
             do =
                 fun ([], _Role) ->
                         big_world:cast(dev, u, []),
                         cross:cast(dev, u, []),
                         ok
                 end},
     #gm_cmd{cmd = "设历练环数", args = [{int, "环", 100}],
             desc = "设历练环数",
             do =
                 fun ([Round],
                      Role = #role{m_quest =
                                       MQuest = #m_quest{quest_chain =
                                                             QuestChain}}) ->
                         NewRole = Role#role{m_quest =
                                                 MQuest#m_quest{quest_chain =
                                                                    QuestChain#quest_chain{round
                                                                                               =
                                                                                               Round}}},
                         quest:push_stats(NewRole),
                         {ok, NewRole}
                 end},
     #gm_cmd{cmd = "清空历练任务", args = [], desc = "清空历练任务",
             do =
                 fun ([],
                      Role = #role{m_quest =
                                       MQuest = #m_quest{quest = Quests,
                                                         quest_chain =
                                                             QuestChain}}) ->
                         NewQuests = lists:keydelete(14,
                                                     #quest.sec_type,
                                                     Quests),
                         NewChain = quest_chaing:reset_chain(QuestChain),
                         NewRole = Role#role{m_quest =
                                                 MQuest#m_quest{quest =
                                                                    NewQuests,
                                                                quest_chain =
                                                                    NewChain}},
                         {ok, NewRole}
                 end},
     #gm_cmd{cmd = "历练翻牌", args = [{int, "环", 100}],
             desc = "历练翻牌",
             do =
                 fun ([Round],
                      Role = #role{m_quest =
                                       MQuest = #m_quest{quest_chain =
                                                             QuestChain}}) ->
                         VarRole = var:set_var(Role, other, 2100, {0, 0}),
                         ReplyCard = {0, 0, []},
                         role:link_send(VarRole, 10256, ReplyCard),
                         Timer = #timer{id = quest_chain_card, timeout = 60000,
                                        times = 1, m = quest_chain,
                                        f = apply_open_card, a = []},
                         TimerRole = role_timer:add(Timer, VarRole),
                         NewRole = TimerRole#role{m_quest =
                                                      MQuest#m_quest{quest_chain
                                                                         =
                                                                         QuestChain#quest_chain{round
                                                                                                    =
                                                                                                    Round
                                                                                                        +
                                                                                                        1,
                                                                                                total_count
                                                                                                    =
                                                                                                    Round}}},
                         {ok, NewRole}
                 end},
     #gm_cmd{cmd = "设宝阁层数", args = [{int, "层", 5}],
             desc = "设宝阁层数",
             do =
                 fun ([Wave],
                      Role = #role{m_exquisite_shelf = MExquisiteShelf}) ->
                         NewRole = Role#role{m_exquisite_shelf =
                                                 MExquisiteShelf#m_exquisite_shelf{wave
                                                                                       =
                                                                                       Wave}},
                         {ok, NewRole}
                 end},
     #gm_cmd{cmd = "清空表情", args = [], desc = "清空表情",
             do =
                 fun ([], Role = #role{m_new_expression = ME}) ->
                         NewRole = Role#role{m_new_expression =
                                                 ME#m_new_expression{s_expression
                                                                         = [],
                                                                     b_expression
                                                                         = []}},
                         {ok, NewRole}
                 end},
     #gm_cmd{cmd = "更新配置", args = [], desc = "更新配置",
             do =
                 fun ([], _Role) ->
                         dev:m(data),
                         notice:send(_Role, 3, lang:get("更新完成")),
                         ok
                 end},
     #gm_cmd{cmd = "宝阁怪物刷新", args = [], desc = "宝阁怪物刷新",
             do =
                 fun ([], _Role) ->
                         cross:cast(exquisite_shelf_mgr, info, [refresh_unit]),
                         exquisite_shelf_mgr:info(refresh_unit),
                         notice:return("刷新成功"),
                         ok
                 end},
     #gm_cmd{cmd = "修改线索状态",
             args = [{int, "线索", 1}, {int, "状态", 2}],
             desc = "修改线索状态",
             do =
                 fun ([Clue, Status], Role) ->
                         NewRole =
                             campaign_inquiry_role:gm_set_clue_status(Role,
                                                                      Clue,
                                                                      Status),
                         {ok, NewRole}
                 end},
     #gm_cmd{cmd = "魔龙挑战下阶段", args = [], desc = "魔龙挑战下阶段",
             do =
                 fun ([], _Role) ->
                         gen_fsm:send_event(guild_dragon_mgr, timeout),
                         ok
                 end},
     #gm_cmd{cmd = "魔龙挑战重载", args = [], desc = "魔龙挑战重载",
             do =
                 fun ([], _Role) ->
                         guild_dragon_mgr:gm(reload),
                         ok
                 end},
     #gm_cmd{cmd = "冲顶答题下阶段", args = [], desc = "冲顶答题进入下阶段",
             do =
                 fun ([], _Role) ->
                         big_world:cast(gen_fsm,
                                        send_event,
                                        [c_camp_rushing_top, timeout]),
                         ok
                 end},
     #gm_cmd{cmd = "冲顶答题开始答题", args = [], desc = "冲顶答题开始答题",
             do =
                 fun ([], _Role) ->
                         big_world:cast(c_camp_rushing_top,
                                        info,
                                        [re_question]),
                         ok
                 end},
     #gm_cmd{cmd = "精灵蛋清空产出限制", args = [],
             desc = "精灵蛋清空产出限制",
             do =
                 fun ([], _Role) ->
                         pet_egg:gm_reset_limit(),
                         ok
                 end},
     #gm_cmd{cmd = "精灵蛋设置孵化次数", args = [{int, "次数", 1}],
             desc = "精灵蛋设置孵化次数",
             do =
                 fun ([Num], _Role) ->
                         pet_egg:gm_set_incubate_num(Num),
                         ok
                 end},
     #gm_cmd{cmd = "促销礼包购买量设置",
             args = [{int, "第几天", 1}, {int, "购买量", 1}],
             desc = "促销礼包购买量设置",
             do =
                 fun ([Day, Num], Role) ->
                         NewRole =
                             camp_sales_promotion:gm_set_today_purchase(Role,
                                                                        Num,
                                                                        Day),
                         {ok, NewRole}
                 end},
     #gm_cmd{cmd = "时装评选下阶段", args = [], desc = "时装评选下阶段",
             do =
                 fun ([], _Role) ->
                         big_world:cast(gen_fsm,
                                        send_event,
                                        [c_camp_fashion_vote, timeout])
                 end},
     #gm_cmd{cmd = "清空时装评选", args = [], desc = "清空时装评选",
             do =
                 fun ([], _Role) ->
                         big_world:cast(c_camp_fashion_vote, cast, [gm_clean])
                 end},
     #gm_cmd{cmd = "时装评选重载", args = [], desc = "时装评选重载",
             do =
                 fun ([], _Role) ->
                         big_world:cast(c_camp_fashion_vote, reload, [])
                 end},
     #gm_cmd{cmd = "设绝招重置天数", args = [{int, "天", 1}],
             desc = "时装评选重载",
             do =
                 fun ([Day], Role) ->
                         NewRole = var:set_var(Role,
                                               other,
                                               2108,
                                               date:unixtime() - 86400 * Day),
                         {ok, NewRole}
                 end},
     #gm_cmd{cmd = "增加诸神荣誉资产", args = [{int, "个数", 10}],
             desc = "增加诸神荣誉资产",
             do =
                 fun ([Num], Role) ->
                         NewRole = gods_duel_role:gm_add_assets_godswar(Role,
                                                                        Num),
                         {ok, NewRole}
                 end},
     #gm_cmd{cmd = "增加诸神荣誉积分", args = [{int, "个数", 10}],
             desc = "增加诸神荣誉积分",
             do =
                 fun ([Num],
                      #role{id = Id, name = Name, classes = Classes,
                            sex = Sex, lev = Lev,
                            m_lev_break = #m_lev_break{times = Times}}) ->
                         gods_duel_team:update_point(#{id => Id, name => Name,
                                                       classes => Classes,
                                                       sex => Sex, lev => Lev,
                                                       break_times => Times,
                                                       add_score => Num})
                 end},
     #gm_cmd{cmd = "诸神荣誉积分清零", args = [], desc = "诸神荣誉积分清零",
             do =
                 fun ([],
                      #role{id = Id, name = Name, classes = Classes,
                            sex = Sex, lev = Lev,
                            m_lev_break = #m_lev_break{times = Times}}) ->
                         gods_duel_team:gm_reset_point(#{id => Id, name => Name,
                                                         classes => Classes,
                                                         sex => Sex, lev => Lev,
                                                         break_times => Times})
                 end},
     #gm_cmd{cmd = "开启职业任务", args = [], desc = "诸神荣誉积分清零",
             do =
                 fun ([], Role = #role{}) ->
                         quest:finish_line(Role, 22310)
                 end},
     #gm_cmd{cmd = "设绝招灵气", args = [{int, "值", 10}],
             desc = "设绝招灵气",
             do =
                 fun ([Val], Role = #role{}) ->
                         skill_unique:set_skl_point(Role, Val)
                 end},
     #gm_cmd{cmd = "诸神殿堂下阶段", args = [], desc = "诸神殿堂下阶段",
             do =
                 fun ([], _Role) ->
                         big_world:call(gods_place_mgr, next, []),
                         ok
                 end},
     #gm_cmd{cmd = "祝福语", args = [], desc = "祝福语",
             do =
                 fun ([], _Role) ->
                         big_world:cast(all,
                                        gen_fsm,
                                        send_event,
                                        [friend_wish_agent, timeout]),
                         ok
                 end},
     #gm_cmd{cmd = "通过寄语", args = [{int, "flag", 1}],
             desc = "通过寄语",
             do =
                 fun ([Flag], _Role) ->
                         friend_wish_agent:gm_audit(_Role, Flag),
                         ok
                 end},
     #gm_cmd{cmd = "诸神殿堂重载", args = [], desc = "诸神殿堂重载",
             do =
                 fun ([], _Role) ->
                         big_world:call(gods_place_mgr, reset, []),
                         ok
                 end},
     #gm_cmd{cmd = "载入诸神殿堂冠军队",
             args = [{int, "值", 1}, {int, "值", 7}, {int, "值", 7}],
             desc = "诸神殿堂重载",
             do =
                 fun ([Group, SeasonId, Num], _Role) ->
                         big_world:call(gods_place_mgr,
                                        loadtest,
                                        [Group, SeasonId, Num]),
                         ok
                 end},
     #gm_cmd{cmd = "诸神殿堂撒宝箱", args = [], desc = "诸神殿堂撒宝箱",
             do =
                 fun ([], _Role) ->
                         big_world:call(gods_place_mgr, gm_creatbox, []),
                         ok
                 end},
     #gm_cmd{cmd = "清玩家诸神殿堂数据", args = [],
             desc = "清玩家诸神殿堂数据",
             do = fun ([], Role) -> gods_place_role:reset(Role) end},
     #gm_cmd{cmd = "设置周活跃度", args = [{int, "活跃度", 0}],
             desc = "设置周活跃度",
             do =
                 fun ([Val], Role) ->
                         agenda_week:gm_set_week_activity(Role, Val)
                 end},
     #gm_cmd{cmd = "周活跃度重置", args = [], desc = "周活跃度重置",
             do =
                 fun ([], Role) -> agenda_week:gm_reset_week_five(Role)
                 end},
     #gm_cmd{cmd = "设大富翁轮回", args = [{int, "轮回", 1}],
             desc = "设大富翁轮回",
             do =
                 fun ([Val], Role) ->
                         camp_zillionaire:gm_set_ring_times(Role, Val)
                 end},
     #gm_cmd{cmd = "设大富翁幸运骰子", args = [{int, "骰子", 1}],
             desc = "设大富翁幸运骰子",
             do =
                 fun ([Val], Role) ->
                         camp_zillionaire:gm_set_lucky_dics(Role, Val)
                 end},
     #gm_cmd{cmd = "转职",
             args = [{int, "职业", 0}, {int, "消耗类型", 1}], desc = "转职",
             do =
                 fun ([TargetClasses, CostType], Role) ->
                         role_classes_modify:gm_role_classes_modify(TargetClasses,
                                                                    CostType,
                                                                    Role)
                 end},
     #gm_cmd{cmd = "设子女皮肤时间", args = [{int, "分钟", 0}],
             desc = "设子女皮肤时间",
             do =
                 fun ([Val], Role) ->
                         child_skin:gm_set_skin_expire_time(Val, Role)
                 end},
     #gm_cmd{cmd = "刷新星辰试炼", args = [], desc = "刷新星辰试炼",
             do =
                 fun ([], _Role) ->
                         stars_trial_mgr:info(create_unit),
                         ok
                 end},
     #gm_cmd{cmd = "刷新法宝配方", args = [], desc = "刷新法宝配方",
             do =
                 fun ([], Role) ->
                         talisman:gm_remold_reset_week_five(Role)
                 end},
     #gm_cmd{cmd = "获得花", args = [{int, "花朵ID", 1}],
             desc = "获得花",
             do =
                 fun ([FlowerId], Role) ->
                         camp_pass_flower_language:gm_add_flower(Role, FlowerId)
                 end},
     #gm_cmd{cmd = "龙王天启结算", args = [], desc = "获得花",
             do =
                 fun ([], Role) ->
                         {ok, Role1} = spirit_treasure_role:role_week_five(Role,
                                                                           Role),
                         {ok, Role2} =
                             oracle_treasure_role:role_week_five(Role1, Role),
                         {ok, Role2}
                 end},
     #gm_cmd{cmd = "峡谷之巅下阶段", args = [], desc = "获得花",
             do =
                 fun ([], _Role) ->
                         cross:call(canyon_summit_mgr, next, []),
                         ok
                 end},
     #gm_cmd{cmd = "峡谷之巅开启大炮", args = [], desc = "获得花",
             do =
                 fun ([], _Role) ->
                         cross:call(canyon_summit_mgr,
                                    send_msg,
                                    [cannon_ready]),
                         ok
                 end},
     #gm_cmd{cmd = "峡谷之巅上传队伍", args = [], desc = "",
             do =
                 fun ([], Role) ->
                         cross:call(canyon_summit_mgr, gm_clear_team, []),
                         cross:call(canyon_summit_mgr, send_msg, [enroll_team]),
                         L = cross:call(canyon_summit_mgr, get_team, []),
                         Num = length(L),
                         notice:send(Role,
                                     1,
                                     util:flist("目前总共有~w个队伍，隔断时间再执行一次", [Num])),
                         ok
                 end},
     #gm_cmd{cmd = "峡谷之巅加积分", args = [], desc = "",
             do =
                 fun ([], Role) ->
                         canyon_summit_role:gm_add_score(Role),
                         notice:send(Role, 1, util:flist("增加积分~w", [100])),
                         ok
                 end},
     #gm_cmd{cmd = "setVar",
             args = [{int, "对应id", 2021}, {int, "值", 0}],
             desc = "设置变量",
             do =
                 fun ([Id, Val], Role) ->
                         NewRole = var:set_var(Role, other, Id, Val),
                         {ok, NewRole}
                 end},
     #gm_cmd{cmd = "SetChessColor",
             args = [{int, "Color", 1}], desc = "Color",
             do =
                 fun ([Color], #role{s_event_pid = Pid}) ->
                         camp_black_white_chess:cast(Pid,
                                                     {gm_set_color, Color}),
                         ok
                 end},
     #gm_cmd{cmd = "赊资源",
             args = [{int, "资源类型", 90000}, {int, "数量", 10000}],
             desc = "赊资源",
             do =
                 fun ([AssetsType, Count], _Role = #role{id = Id}) ->
                         case AssetsType of
                             90000 -> adm:loss_coin(Id, Count);
                             90002 -> adm:loss_gold(Id, Count);
                             90003 -> adm:loss_gold_bind(Id, Count);
                             _ ->
                                 notice:return("错误的资源类型,概不赊账"),
                                 ok
                         end,
                         ok
                 end},
     #gm_cmd{cmd = "SetChessColor",
             args = [{int, "Color", 1}], desc = "Color",
             do =
                 fun ([Color], #role{s_event_pid = Pid}) ->
                         camp_black_white_chess:cast(Pid,
                                                     {gm_set_color, Color}),
                         ok
                 end},
     #gm_cmd{cmd = "赊资源",
             args = [{int, "资源类型", 90000}, {int, "数量", 10000}],
             desc = "赊资源",
             do =
                 fun ([AssetsType, Count], _Role = #role{id = Id}) ->
                         case AssetsType of
                             90000 -> adm:loss_coin(Id, Count);
                             90002 -> adm:loss_gold(Id, Count);
                             90003 -> adm:loss_gold_bind(Id, Count);
                             _ ->
                                 notice:return("错误的资源类型,概不赊账"),
                                 ok
                         end,
                         ok
                 end},
     #gm_cmd{cmd = "开启提示", args = [], desc = "开启提示",
             do =
                 fun ([], _Role) ->
                         env:set(gm_notice, 1),
                         ok
                 end},
     #gm_cmd{cmd = "关闭提示", args = [], desc = "关闭提示",
             do =
                 fun ([], _Role) ->
                         env:set(gm_notice, 0),
                         ok
                 end},
     #gm_cmd{cmd = "真心话大冒险活动状态跳转", args = [],
             desc = "真心话大冒险活动状态跳转",
             do =
                 fun ([], _Role) -> guild_truth_dare_mgr:next() end},
     #gm_cmd{cmd = "真心话大冒险重置题库", args = [],
             desc = "真心话大冒险重置题库",
             do =
                 fun ([], _Role) ->
                         guild_truth_dare_mgr:load_sys_question()
                 end},
     #gm_cmd{cmd = "改名", args = [{string, "名字", ""}],
             desc = "改名",
             do =
                 fun ([Name], Role) ->
                         NewRole = Role#role{name = Name},
                         map:role_update(NewRole),
                         {ok, NewRole}
                 end},
     #gm_cmd{cmd = "龙王每日保底刷新测试", args = [],
             desc = "龙王每日保底刷新测试",
             do =
                 fun ([], _Role) ->
                         spirit_treasure_mgr:info(zreo_push_bottom_stuff),
                         cross:call(spirit_treasure_mgr,
                                    info,
                                    [zreo_push_bottom_stuff])
                 end},
     #gm_cmd{cmd = "天启每日保底刷新测试", args = [],
             desc = "天启每日保底刷新测试",
             do =
                 fun ([], _Role) ->
                         oracle_treasure_mgr:info(zreo_push_bottom_stuff),
                         cross:call(oracle_treasure_mgr,
                                    info,
                                    [zreo_push_bottom_stuff])
                 end},
     #gm_cmd{cmd = "设颜值",
             args = [{int, "颜值等级", 11}, {int, "颜值", 100}],
             desc = "设颜值",
             do =
                 fun ([Lev, Val], Role) -> fashion:gm_set(Role, Lev, Val)
                 end},
     #gm_cmd{cmd = "清新开服连充", args = [], desc = "设颜值",
             do =
                 fun ([], Role) ->
                         camp_new_series_recharge:async_reset(Role)
                 end},
     #gm_cmd{cmd = "gm购买礼包",
             args = [{int, "天数", 1}, {int, "类型", 2}], desc = "设颜值",
             do =
                 fun ([Day, Type], Role) ->
                         camp_bring_up_open:gm_send(Role, Day, Type)
                 end},
     #gm_cmd{cmd = "幻月灵兽刷新", args = [], desc = "幻月灵兽刷新",
             do =
                 fun ([], _Role) -> star_moon_mgr ! clean_unit end}].

-spec do(bitstring(), #role{}) -> {reply, bitstring()} |
                                  {reply, bitstring(), #role{}}.

do(CmdStr, Role) ->
    case string:tokens(CmdStr, " ") of
        [] -> {reply, {help(cmds())}};
        [Cmd | A] ->
            case lists:keyfind(Cmd, #gm_cmd.cmd, cmds()) of
                false -> {reply, {util:flist("不支持的命令: ~ts~n", [Cmd])}};
                GmCmd = #gm_cmd{do = Do, args = ArgDefine} ->
                    case parse_args(ArgDefine, A, []) of
                        {error, Reason} ->
                            {reply,
                             {util:flist("命令[~ts]执行失败: ~ts~n命令说明:~ts~n",
                                         [Cmd, Reason, help([GmCmd])])}};
                        {ok, Args} ->
                            case catch Do(Args, Role) of
                                ok -> ok;
                                {ok, NewRole} ->
                                    {reply,
                                     {util:flist("命令[~ts]执行成功~n", [Cmd])},
                                     NewRole};
                                {false, Msg} ->
                                    {reply, {util:flist("~ts~n", [Msg])}};
                                {error, Msg} ->
                                    {reply, {util:flist("<SRV> ~ts~n", [Msg])}};
                                {reply, Msg} ->
                                    {reply, {util:flist("~ts~n", [Msg])}};
                                {reply, Msg, NewRole} ->
                                    {reply,
                                     {util:flist("~ts~n", [Msg])},
                                     NewRole};
                                Err ->
                                    logger:error("命令[~ts]执行失败: ~w",
                                                 [Cmd, Err],
                                                 gm_cmd,
                                                 6305),
                                    {reply,
                                     {util:flist("[SRV]命令[~ts]执行失败~n", [Cmd])}}
                            end
                    end
            end
    end.

parse_args([], _, L) -> {ok, lists:reverse(L)};
parse_args([{_Type, _Desc, DefVal} | T], [], L) ->
    parse_args(T, [], [DefVal | L]);
parse_args(_, [], _L) -> {error, "参数不完整"};
parse_args([{Type, Desc, _} | T], Args, L) ->
    parse_args([{Type, Desc} | T], Args, L);
parse_args([{int, Desc} | T], [V | Args], L) ->
    case catch list_to_integer(V) of
        {'EXIT', _} ->
            {error, util:cn("参数[~ts]无法转换成int", [Desc])};
        A -> parse_args(T, Args, [A | L])
    end;
parse_args([{atom, _Desc} | T], [V | Args], L) ->
    parse_args(T, Args, [list_to_atom(V) | L]);
parse_args([{float, Desc} | T], [V | Args], L) ->
    case catch list_to_float(V) of
        {'EXIT', _} ->
            {error, util:cn("参数[~ts]无法转换成float", [Desc])};
        A -> parse_args(T, Args, [A | L])
    end;
parse_args([{bitstring, Desc} | T], [V | Args], L) ->
    case catch list_to_bitstring(V) of
        {'EXIT', _} ->
            {error, util:cn("参数[~ts]无法转换成bitstring", [Desc])};
        A -> parse_args(T, Args, [A | L])
    end;
parse_args([{_, _} | T], [V | Args], L) ->
    parse_args(T, Args, [V | L]).

help(Cmds) ->
    lists:concat(lists:reverse(do_help(Cmds, []))).

do_help([], L) -> L;
do_help([#gm_cmd{cmd = Cmd, args = Args, desc = Desc}
         | T],
        L) ->
    S = lists:concat(["<color=#393>",
                      Cmd,
                      "</color>",
                      lists:concat([" [<color=#393>" ++
                                        to_help_args(A) ++ "</color>]"
                                    || A <- Args]),
                      " ",
                      Desc,
                      "\n"]),
    do_help(T, [S | L]).

to_help_args({_, Desc}) -> lists:concat([Desc, ",必须项"]);
to_help_args({_, Desc, DefVal}) ->
    lists:concat([Desc,
                  ",默认值(",
                  util:to_list(DefVal),
                  ")"]).

gm(Id,
   Role = #role{classes = Classes,
                p_eqm = #package{items = OldEqms}}) ->
    case gm_srv_data:get({Id, Classes}) of
        #{lev := Lev, eqm := Eqm, enchant := Enchant,
          skill_lev := SkillLev, skill_prac := SkillPracLev,
          wing := WingLev} ->
            ResetPointRole = case attr:do_reset_point(Role, true) of
                                 {ok, _ResetPointRole, _} -> _ResetPointRole;
                                 _ -> Role
                             end,
            EqmItems = make_eqm(Eqm, Enchant, ResetPointRole, []),
            Role0 = ResetPointRole#role{p_eqm = package:init(eqm)},
            Role1 = #role{p_eqm = #package{items = NewEqms}} =
                        puton_eqm(EqmItems, Role0),
            package:push_gain([{3, NewEqms, OldEqms, []}], Role1),
            Role2 = Role1#role{lev = Lev, is_gain = true},
            Role3 = make_skill(SkillLev, Role2),
            Role4 = make_skill_prac(SkillPracLev, Role3),
            Role5 = make_wing(WingLev, Role4),
            NewRole = attr:calc_and_push(Role5),
            LookRole = looks:calc(NewRole),
            looks:update_looks(Role, LookRole),
            role_gain:push_exp(LookRole),
            map:role_update(LookRole),
            {ok, LookRole};
        _ -> {reply, "查找不到数据"}
    end.

make_skill(SkillLev,
           Role = #role{lev = Lev,
                        m_skill = MSkill = #m_skill{skills = Skills}}) ->
    MinSkillLev = min(SkillLev, Lev),
    Fun = fun ({SkillId, OldSkillLev}, SkillList) ->
                  case skill_data:get_role({SkillId, MinSkillLev}) of
                      #role_base_skill{study_lev = StudyLev}
                          when StudyLev =< Lev ->
                          [{SkillId, MinSkillLev} | SkillList];
                      _ -> [{SkillId, OldSkillLev} | SkillList]
                  end
          end,
    NewSkills = lists:reverse(lists:foldl(Fun, [], Skills)),
    NewRole = Role#role{m_skill =
                            MSkill#m_skill{skills = NewSkills}},
    role:link_send(NewRole, 10800, {NewSkills, []}),
    NewRole.

make_skill_prac(SkillPracLev, Role = #role{}) ->
    Role1 = #role{m_skill =
                      MSkill = #m_skill{selected_skl_prac = SklPracId,
                                        skill_prac = SkillPrac}} =
                skill_prac:level_up(Role),
    NewSkillPrac = [SklPrac#skl_prac{lev = SkillPracLev}
                    || SklPrac <- SkillPrac],
    NewMSkill = MSkill#m_skill{skill_prac = NewSkillPrac},
    Role2 = Role1#role{m_skill = NewMSkill},
    SkillPracTimes = skill_prac:get_skill_prac_times(Role),
    role:link_send(Role2,
                   10805,
                   {SklPracId, SkillPrac, SkillPracTimes}),
    Role2.

make_wing(0, Role = #role{m_wing = Mwing}) ->
    NewMwing = Mwing#m_wing{grade = 0, growth = 0,
                            star_lev = 1},
    Role1 = Role#role{m_wing = NewMwing},
    wing:push_wing(Role1),
    Role1;
make_wing(WingGrade, Role) ->
    case wing:update_wing(WingGrade, Role, true, true) of
        {ok, NewRole = #role{m_wing = Mwing}} ->
            NewRole#role{m_wing = Mwing#m_wing{star_lev = 1}};
        _ -> Role
    end.

make_eqm([], _Enchant, _Role, L) -> L;
make_eqm([BaseId | T], Enchant, Role = #role{}, L) ->
    case item:make(BaseId, 0, 1) of
        {ok, [Item = #item{use_type = 3}]} ->
            Item1 = eqm_attr:calc_eqm(Item#item{enchant = Enchant}),
            make_eqm(T, Enchant, Role, [Item1 | L]);
        _ -> make_eqm(T, Enchant, Role, L)
    end.

puton_eqm([], Role) -> Role;
puton_eqm([Item = #item{type = Type} | T],
          Role = #role{p_eqm =
                           PEqm = #package{items = Items,
                                           free_cell = FreeCell}}) ->
    EqmId = eqm:type_to_id(Type),
    EqmPos = eqm:type_to_pos(Type),
    NewItem = Item#item{id = EqmId, pos = EqmPos},
    puton_eqm(T,
              Role#role{p_eqm =
                            PEqm#package{items = [NewItem | Items],
                                         free_cell = FreeCell -- [EqmPos]}}).

dembed([], _List, Role) -> Role;
dembed([Item = #item{attr = AttrList, lev = Lev,
                     type = IType}
        | ItemList],
       List, Role = #role{p_eqm = Peqm}) ->
    case lists:keyfind(IType, 1, List) of
        {_, StoneId, StoneId2} ->
            AttrList1 = [Attr
                         || Attr = #attr_base{type = Type} <- AttrList,
                            Type =/= 3],
            logger:debug("DEMBED ~w~n", [StoneId], gm_cmd, 6505),
            HoleAttr = #attr_base{type = 3, name = 110, flag = 0,
                                  val = StoneId},
            HoleAttr1 = #attr_base{type = 3, name = 111, flag = 0,
                                   val = StoneId2},
            NewItem = if Lev >= 60 andalso StoneId2 =/= 0 ->
                             Item#item{attr =
                                           [HoleAttr, HoleAttr1 | AttrList1]};
                         Lev >= 30 -> Item#item{attr = [HoleAttr | AttrList1]};
                         true -> Item
                      end,
            {ok, NewPeqm, _} = package:fresh_item(Item,
                                                  NewItem,
                                                  Peqm,
                                                  Role),
            NewRole = Role#role{p_eqm = NewPeqm},
            dembed(ItemList, List, NewRole);
        _ ->
            AttrList1 = [Attr
                         || Attr = #attr_base{type = Type} <- AttrList,
                            Type =/= 3],
            NewItem = Item#item{attr = AttrList1},
            {ok, NewPeqm, _} = package:fresh_item(Item,
                                                  NewItem,
                                                  Peqm,
                                                  Role),
            NewRole = Role#role{p_eqm = NewPeqm},
            dembed(ItemList, List, NewRole)
    end.

