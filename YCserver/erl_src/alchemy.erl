-file("src/mod/alchemy/alchemy.erl", 1).

-module(alchemy).

-export([init/0,
         melt/2,
         start_produce/2,
         start_all/1,
         get_product/2,
         get_all_product/1,
         extend_shop/2,
         exchange/2,
         mark_auto/3,
         push/2,
         gm/1,
         gm/2,
         smelting/2]).

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

-file("src/mod/alchemy/alchemy.erl", 24).

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

-file("src/mod/alchemy/alchemy.erl", 25).

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

-file("src/mod/alchemy/alchemy.erl", 26).

-file("inc/package.hrl", 1).

-record(package,
        {type = 1 :: integer(),
         next_id = 1 :: pos_integer(),
         volume = 0 :: non_neg_integer(),
         free_cell = [] :: list(),
         items = [] :: [tuple()]}).

-file("src/mod/alchemy/alchemy.erl", 27).

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

-file("src/mod/alchemy/alchemy.erl", 28).

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

-file("src/mod/alchemy/alchemy.erl", 29).

-file("inc/link.hrl", 1).

-record(link,
        {socket :: undefined | port(),
         conn_pid :: undefined | pid(),
         ip = {0, 0, 0, 0} :: {0..255, 0..255, 0..255, 0..255},
         port = 0 :: non_neg_integer(),
         lag = 0 :: non_neg_integer()}).

-file("src/mod/alchemy/alchemy.erl", 30).

-file("inc/alchemy.hrl", 1).

-record(m_alchemy, {ver = 0, shops = []}).

-record(alchemy_shop,
        {ver = 1,
         id = 0 :: non_neg_integer(),
         volume = 0,
         products = [],
         is_auto = 1 :: 1 | 0}).

-file("src/mod/alchemy/alchemy.erl", 31).

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

-file("src/mod/alchemy/alchemy.erl", 32).

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

-file("src/mod/alchemy/alchemy.erl", 33).

init() ->
    #m_alchemy{shops =
                   [#alchemy_shop{id = Id, volume = Vol}
                    || {Id, Vol} <- alchemy_data:list()]}.

melt(Role = #role{p_bag = Bag}, Ids = [_ | _]) ->
    case check_melt_items(Bag, Ids, 0, []) of
        {ok, Alchemy, Items} ->
            role:send_buff_begin(),
            Loss = [#loss{label = item_id, val = Ids}],
            Gain = format:val_to_gain([{90017, Alchemy}]),
            case role_gain:do(Loss ++ Gain, Role) of
                {ok, Role1} ->
                    role:send_buff_flush(),
                    log:alchemy(Role, "炼化物品", Items),
                    {ok,
                     notice:format(lang:get("炼化成功，获得~ts"),
                                   [{assets_1, 90017, Alchemy}]),
                     role_trigger:fire(#evt_alchemy_melt{item_list =
                                                             [{BaseId, Num}
                                                              || #item{base_id =
                                                                           BaseId,
                                                                       quantity
                                                                           =
                                                                           Num}
                                                                     <- Items]},
                                       Role1)};
                {false, #loss{msg = Msg}} ->
                    role:send_buff_clean(),
                    {false, Msg}
            end;
        Else -> Else
    end;
melt(Role = #role{p_bag = Bag}, Id)
    when is_integer(Id) ->
    case package:find(by_id, Id, Bag) of
        {ok,
         I = #item{base_id = BaseId, quantity = Num,
                   extra = Extra}} ->
            case item_data:get(BaseId) of
                #item_base{alchemy = Val} when Val > 0 ->
                    case calc_rate(BaseId, Extra, Val) of
                        NewVal when NewVal > 0 ->
                            role:send_buff_begin(),
                            Alchemy = NewVal * Num,
                            Loss = [#loss{label = item_id, val = [{Id, Num}]}],
                            Gain = format:val_to_gain([{90017, Alchemy}]),
                            case role_gain:do(Loss ++ Gain, Role) of
                                {ok, Role1} ->
                                    role:send_buff_flush(),
                                    log:alchemy(Role, "炼化背包物品", [I]),
                                    {ok,
                                     notice:format(lang:get("炼化成功，获得~ts"),
                                                   [{assets_1,
                                                     90017,
                                                     Alchemy}]),
                                     role_trigger:fire(#evt_alchemy_melt{item_list
                                                                             =
                                                                             [{BaseId,
                                                                               Num}]},
                                                       Role1)};
                                {false, #loss{msg = Msg}} ->
                                    role:send_buff_clean(),
                                    {false, Msg}
                            end;
                        _ ->
                            {false,
                             notice:format(lang:get("~ts没有使用次数，不能炼化"),
                                           [{item_2, BaseId}])}
                    end;
                _ -> {false, lang:get("不能炼化的物品")}
            end;
        _ -> {false, lang:get("找不到指定物品")}
    end;
melt(_, _) -> {false, lang:get("没有指定物品")}.

start_produce(Role = #role{m_alchemy =
                               MAl = #m_alchemy{shops = Shops}},
              Id) ->
    case lists:keyfind(Id, #alchemy_shop.id, Shops) of
        #alchemy_shop{volume = Vol, products = Products}
            when length(Products) >= Vol ->
            {false, lang:get("该炼化坊已经满负荷了")};
        Shop = #alchemy_shop{products = Products} ->
            Now = date:unixtime(),
            MonthCard = month_card:get_privilege(Role,
                                                 alchemy_produce),
            case alchemy_data:get(Id) of
                #{cost := Cost, need_time := NeedTime,
                  show_item_id := ShowItemId} ->
                    Addition = case Products of
                                   [] -> Now - MonthCard;
                                   _ ->
                                       Now +
                                           max(0,
                                               lists:max(Products) + NeedTime -
                                                   Now)
                                           - MonthCard
                               end,
                    NewShops = lists:keyreplace(Id,
                                                #alchemy_shop.id,
                                                Shops,
                                                Shop#alchemy_shop{products =
                                                                      [Addition
                                                                       | Products]}),
                    Cost1 = calc_pray_buff(Role, Cost, []),
                    Loss = format:val_to_loss(Cost1),
                    Role1 = Role#role{m_alchemy =
                                          MAl#m_alchemy{shops = NewShops}},
                    case role_gain:do_notice(Loss, Role1) of
                        {ok, Role2} ->
                            push(Role2, 14900),
                            {ok,
                             notice:format(lang:get("开始炼制 ~ts"),
                                           [{item_2, ShowItemId}]),
                             Role2};
                        {false, #loss{msg = Msg}} -> {false, Msg}
                    end;
                _ -> {false, lang:get("找不到炼化资料")}
            end;
        _ -> {false, lang:get("找不到炼化坊")}
    end;
start_produce(_Role, _Id) -> {false, lang:get("不能炼成")}.

start_all(Role = #role{m_alchemy =
                           #m_alchemy{shops = Shops}}) ->
    Now = date:unixtime(),
    role:send_buff_begin(),
    MonthCard = month_card:get_privilege(Role,
                                         alchemy_produce),
    case do_start_all(Shops, Role, Now, 0, MonthCard) of
        {ok, _NewRole, 0} ->
            role:send_buff_clean(),
            {false, lang:get("没有可炼制的空位啦{face_1,21}")};
        {ok, NewRole, _Num} ->
            role:send_buff_flush(),
            push(NewRole, 14900),
            {ok, lang:get("开始炼化"), NewRole};
        Else ->
            role:send_buff_clean(),
            Else
    end;
start_all(_Role) -> {false, lang:get("不能炼制")}.

get_product(Role = #role{m_alchemy =
                             MAl = #m_alchemy{shops = Shops},
                         lev = Lev},
            Id) ->
    Now = date:unixtime(),
    case alchemy_data:get(Id) of
        #{need_time := NeedTime, item_id := BaseId} ->
            case lists:keyfind(Id, #alchemy_shop.id, Shops) of
                #alchemy_shop{products = []} ->
                    {false, lang:get("没有炼化中的物品")};
                Shop = #alchemy_shop{products = Products} ->
                    case lists:sort(Products) of
                        [H | _] when H + NeedTime > Now ->
                            {false, lang:get("等会儿再来收获吧{face_1,9}")};
                        [_ | T] ->
                            Num = alchemy_data:get_num({Id, Lev}),
                            Gain = format:val_to_gain([{BaseId, 0, Num}]),
                            Role1 = Role#role{m_alchemy =
                                                  MAl#m_alchemy{shops =
                                                                    lists:keyreplace(Id,
                                                                                     #alchemy_shop.id,
                                                                                     Shops,
                                                                                     Shop#alchemy_shop{products
                                                                                                           =
                                                                                                           T})}},
                            case role_gain:do_notice(Gain, Role1) of
                                {ok, Role2} ->
                                    push(Role2, 14900),
                                    {ok,
                                     lang:get("领取成功"),
                                     role_trigger:fire(#evt_alchemy_produce{item_list
                                                                                =
                                                                                [{BaseId,
                                                                                  Num}]},
                                                       Role2)};
                                {false, #gain{msg = Msg}} -> {false, Msg}
                            end;
                        _ -> {false, lang:get("没有炼化物品")}
                    end;
                _ -> {false, lang:get("找不到炼化坊")}
            end;
        _ -> {false, lang:get("没有炼化资料")}
    end;
get_product(_Role, _Id) -> {false, lang:get("不能领取")}.

get_all_product(Role = #role{m_alchemy =
                                 #m_alchemy{shops = Shops}}) ->
    Now = date:unixtime(),
    case do_get_all_product(Shops, Role, Now, 0) of
        {ok, NewRole} ->
            push(NewRole, 14900),
            {ok, lang:get("领取成功"), NewRole};
        Else -> Else
    end;
get_all_product(_Role) -> {false, lang:get("不能领取")}.

extend_shop(Role = #role{m_alchemy =
                             MAl = #m_alchemy{shops = Shops}},
            Id) ->
    case lists:keyfind(Id, #alchemy_shop.id, Shops) of
        #alchemy_shop{volume = Vol} when Vol >= 4 ->
            {false, lang:get("该炼化坊已经全部扩展")};
        Shop = #alchemy_shop{volume = Vol} ->
            NewVol = Vol + 1,
            NewShops = lists:keyreplace(Id,
                                        #alchemy_shop.id,
                                        Shops,
                                        Shop#alchemy_shop{volume = NewVol}),
            case alchemy_data:get(Id) of
                #{open_cost := Cost} ->
                    Loss = format:val_to_loss([{LossId, LossNum}
                                               || {LossId, LossNum, Order}
                                                      <- Cost,
                                                  Order =:= NewVol]),
                    Role1 = Role#role{m_alchemy =
                                          MAl#m_alchemy{shops = NewShops}},
                    case role_gain:do_notice(Loss, Role1) of
                        {ok, Role2} ->
                            push(Role2, 14900),
                            {ok, lang:get("扩展成功"), Role2};
                        {false, #loss{msg = Msg}} -> {false, Msg}
                    end;
                _ -> {false, lang:get("找不到扩展资料")}
            end;
        _ -> {false, lang:get("找不到炼化坊")}
    end;
extend_shop(_Role, _Id) -> {false, lang:get("不能扩展")}.

exchange(Role, Num) ->
    Loss = format:val_to_loss([{90002, 30 * Num}]),
    Gain = format:val_to_gain([{90017, 100 * Num}]),
    case role_gain:do_notice(Loss ++ Gain, Role) of
        {ok, Role1} -> {ok, "", Role1};
        {false, #loss{msg = Msg}} -> {false, Msg}
    end.

mark_auto(Role = #role{m_alchemy =
                           MA = #m_alchemy{shops = Shops}},
          Id, IsAuto)
    when IsAuto =:= 1 orelse IsAuto =:= 0 ->
    case lists:keyfind(Id, #alchemy_shop.id, Shops) of
        S = #alchemy_shop{} ->
            Role1 = Role#role{m_alchemy =
                                  MA#m_alchemy{shops =
                                                   lists:keyreplace(Id,
                                                                    #alchemy_shop.id,
                                                                    Shops,
                                                                    S#alchemy_shop{is_auto
                                                                                       =
                                                                                       IsAuto})}},
            push(Role1, 14900),
            {ok, Role1};
        _ -> {false, lang:get("找不到炼化坊")}
    end;
mark_auto(_, _, _) -> {false, lang:get("无效标记")}.

push(#role{link = #link{conn_pid = ConnPid},
           m_alchemy = #m_alchemy{shops = Shops}},
     Cmd = 14900) ->
    sys_conn:pack_send(ConnPid, Cmd, {Shops}).

gm({clear_all, Ids}) ->
    [big_world:cast(P, Z, alchemy, gm, [{clear, Id, Val}])
     || {Id = {_, P, Z}, Val} <- Ids],
    ok;
gm({clear, Id, Val}) ->
    case role_query:pid(by_id, Id) of
        {ok, Pid} ->
            role:apply(async, Pid, {alchemy, gm, [{clear, Val}]});
        _ -> logger:info("~w 不在线，本次没有清理成功", [Id], alchemy, 279)
    end.

gm(Role = #role{assets =
                    Assets = #assets{alchemy = Alchemy},
                name = Name, p_bag = Bag},
   {clear, Val}) ->
    NewAlchemy = max(0,
                     Alchemy - round(Val * 120 * 9.0e-1)),
    BaseId = 21100,
    Role1 = Role#role{assets =
                          Assets#assets{alchemy = NewAlchemy}},
    NewRole = case package:count(by_base_id, BaseId, Bag) of
                  {_, Num} when Num > 0 ->
                      Loss = format:val_to_loss([{BaseId, Num}]),
                      case role_gain:do(Loss, Role1) of
                          {ok, Role2} -> Role2;
                          _ -> Role1
                      end;
                  _ -> Role1
              end,
    role_gain:push_rest(NewRole),
    Title = lang:get("炼化值异常处理"),
    Content = lang:get("系统检测您的炼化值出现异常，已完成修复处理。"),
    mail:send(Role,
              #{title => Title, content => Content, items => []}),
    logger:info("[~ts] 炼化值被清理", [Name], alchemy, 301),
    {ok, NewRole}.

check_melt_items(_Bag, [], Alchemy, Items) ->
    {ok, Alchemy, Items};
check_melt_items(Bag, [{Id, Num} | T], Alchemy,
                 Items) ->
    case package:find(by_id, Id, Bag) of
        {ok, #item{quantity = Q, base_id = BaseId}}
            when Q < Num ->
            {false,
             notice:format(lang:get("~ts数量不足"),
                           [{string_2, 5, item:attr(name, BaseId)}])};
        {ok, I = #item{base_id = BaseId, extra = Extra}} ->
            case item_data:get(BaseId) of
                #item_base{alchemy = Val} when Val > 0 ->
                    case calc_rate(BaseId, Extra, Val) of
                        NewVal when NewVal > 0 ->
                            check_melt_items(Bag,
                                             T,
                                             Alchemy + NewVal * Num,
                                             [I#item{quantity = Num} | Items]);
                        _ ->
                            {false,
                             notice:format(lang:get("~ts没有使用次数，不能炼化"),
                                           [{item_2, BaseId}])}
                    end;
                _ -> {false, lang:get("不能炼化的物品")}
            end;
        _ -> {false, lang:get("找不到物品")}
    end.

calc_rate(BaseId, Extra, Val) ->
    case item_data:get_fruit(BaseId) of
        0 -> Val;
        MaxUsed ->
            case lists:keyfind(7, 1, Extra) of
                {_, Remain, _} -> round(Val * Remain / MaxUsed);
                _ -> 0
            end
    end.

do_get_all_product([], Role, _Now, Num) when Num > 0 ->
    {ok, Role};
do_get_all_product([], _Role, _Now, _) ->
    {false, lang:get("暂时没有东西可收获哟{face_1,2}")};
do_get_all_product([#alchemy_shop{products = []} | T],
                   Role, Now, Num) ->
    do_get_all_product(T, Role, Now, Num);
do_get_all_product([Shop = #alchemy_shop{products =
                                             Products,
                                         id = Id}
                    | T],
                   Role = #role{m_alchemy =
                                    MAl = #m_alchemy{shops = Shops},
                                lev = Lev},
                   Now, Num) ->
    case alchemy_data:get(Id) of
        #{need_time := NeedTime, item_id := BaseId} ->
            case get_product_num(lists:sort(Products),
                                 Now,
                                 NeedTime,
                                 0)
                of
                {0, _} -> do_get_all_product(T, Role, Now, Num);
                {Cardinal, Rest} ->
                    ItemNum = alchemy_data:get_num({Id, Lev}) * Cardinal,
                    Gain = format:val_to_gain([{BaseId, 0, ItemNum}]),
                    Role1 = Role#role{m_alchemy =
                                          MAl#m_alchemy{shops =
                                                            lists:keyreplace(Id,
                                                                             #alchemy_shop.id,
                                                                             Shops,
                                                                             Shop#alchemy_shop{products
                                                                                                   =
                                                                                                   Rest})}},
                    case role_gain:do_notice(Gain, Role1) of
                        {ok, Role2} ->
                            Role3 =
                                role_trigger:fire(#evt_alchemy_produce{item_list
                                                                           =
                                                                           [{BaseId,
                                                                             ItemNum}]},
                                                  Role2),
                            do_get_all_product(T, Role3, Now, Num + 1);
                        {false, #gain{reason = exp_full}} ->
                            do_get_all_product(T, Role, Now, Num);
                        _ when Num > 0 -> {ok, Role};
                        {false, #gain{msg = Msg}} -> {false, Msg}
                    end;
                _ -> {false, lang:get("没有炼化物品")}
            end;
        _ -> {false, lang:get("没有炼化资料")}
    end.

get_product_num([], _, _, Num) -> {Num, []};
get_product_num([H | T], Now, NeedTime, Num)
    when Now >= H + NeedTime ->
    get_product_num(T, Now, NeedTime, Num + 1);
get_product_num(Rest, _Now, _, Num) -> {Num, Rest}.

do_start_all([], Role, _, Num, _MonthCard) ->
    {ok, Role, Num};
do_start_all([Shop = #alchemy_shop{is_auto = 0, id = Id}
              | T],
             Role = #role{m_alchemy =
                              MAl = #m_alchemy{shops = Shops}},
             Now, Num, MonthCard) ->
    NewShops = lists:keyreplace(Id,
                                #alchemy_shop.id,
                                Shops,
                                Shop),
    Role1 = Role#role{m_alchemy =
                          MAl#m_alchemy{shops = NewShops}},
    do_start_all(T, Role1, Now, Num, MonthCard);
do_start_all([Shop = #alchemy_shop{products = Products,
                                   volume = Vol, id = Id}
              | T],
             Role = #role{m_alchemy =
                              MAl = #m_alchemy{shops = Shops}},
             Now, Num, MonthCard)
    when length(Products) >= Vol ->
    NewShops = lists:keyreplace(Id,
                                #alchemy_shop.id,
                                Shops,
                                Shop),
    Role1 = Role#role{m_alchemy =
                          MAl#m_alchemy{shops = NewShops}},
    do_start_all(T, Role1, Now, Num, MonthCard);
do_start_all([Shop = #alchemy_shop{products = Products,
                                   id = Id}
              | T],
             Role = #role{m_alchemy =
                              MAl = #m_alchemy{shops = Shops}},
             Now, Num, MonthCard) ->
    case alchemy_data:get(Id) of
        #{cost := CostCfg, need_time := NeedTime} ->
            Cost = calc_pray_buff(Role, CostCfg, []),
            Addition = case Products of
                           [] -> Now - MonthCard;
                           _ ->
                               Now +
                                   max(0, lists:max(Products) + NeedTime - Now)
                                   - MonthCard
                       end,
            Loss = format:val_to_loss(Cost),
            case role_gain:do_notice(Loss, Role) of
                {ok, Role2} ->
                    do_start_all([Shop#alchemy_shop{products =
                                                        [Addition | Products]}
                                  | T],
                                 Role2,
                                 Now,
                                 Num + 1,
                                 MonthCard);
                _ ->
                    NewShops = lists:keyreplace(Id,
                                                #alchemy_shop.id,
                                                Shops,
                                                Shop),
                    Role1 = Role#role{m_alchemy =
                                          MAl#m_alchemy{shops = NewShops}},
                    do_start_all(T, Role1, Now, Num, MonthCard)
            end;
        _ -> {false, lang:get("找不到炼化资料")}
    end.

calc_pray_buff(_Role, [], NewCost) -> NewCost;
calc_pray_buff(Role, [{Label, Val} | Rest], NewCost) ->
    BuffReduce = case
                     buff:is_special_effect_exists_one_param(Role, 22)
                     of
                     {true, Value} -> Value;
                     _ -> 0
                 end,
    NewVal = util:ceil(Val * (1000 - BuffReduce) / 1000),
    logger:debug("在运势BUFF的作用下, 魔法炼化的消耗减少了~w%, 减少前:~w, "
                 "减少后~w",
                 [BuffReduce div 10, Val, NewVal],
                 alchemy,
                 450),
    calc_pray_buff(Role, Rest, [{Label, NewVal} | NewCost]);
calc_pray_buff(Role, [_G | Rest], NewCost) ->
    calc_pray_buff(Role, Rest, NewCost).

smelting(Role = #role{p_bag = Bag}, Id)
    when is_integer(Id) ->
    case package:find(by_id, Id, Bag) of
        {ok, #item{base_id = BaseId, quantity = Num}} ->
            case item_data:get_smelting(BaseId) of
                BaseGain when is_list(BaseGain) ->
                    GainList = lists:foldl(fun ({GainID, BaseNum}, List) ->
                                                   [{GainID, BaseNum * Num}
                                                    | List]
                                           end,
                                           [],
                                           BaseGain),
                    role:send_buff_begin(),
                    Loss = [#loss{label = item_id, val = [{Id, Num}]}],
                    Gain = format:val_to_gain(GainList),
                    case role_gain:do(Loss ++ Gain, Role) of
                        {ok, Role1} ->
                            role:send_buff_flush(),
                            {ok,
                             notice:format(lang:get("熔炼成功，获得~ts"),
                                           [{item_2, GainList}]),
                             Role1};
                        {false, #loss{msg = Msg}} ->
                            role:send_buff_clean(),
                            {false, Msg};
                        _ ->
                            role:send_buff_clean(),
                            {false, lang:get("背包已满，请先整理背包")}
                    end;
                _ -> {false, lang:get("不能的物品")}
            end;
        _ -> {false, lang:get("找不到指定熔炼物品")}
    end;
smelting(_, _) -> {false, lang:get("没有指定物品")}.

