-file("src/mod/item/item_gift.erl", 1).

-module(item_gift).

-export([use/3, use/4]).

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

-file("src/mod/item/item_gift.erl", 14).

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

-file("src/mod/item/item_gift.erl", 15).

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

-file("src/mod/item/item_gift.erl", 16).

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

-file("src/mod/item/item_gift.erl", 17).

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

-file("src/mod/item/item_gift.erl", 18).

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

-file("src/mod/item/item_gift.erl", 19).

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

-file("src/mod/item/item_gift.erl", 20).

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

-file("src/mod/item/item_gift.erl", 21).

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

-file("src/mod/item/item_gift.erl", 22).

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

-file("src/mod/item/item_gift.erl", 23).

-file("inc/package.hrl", 1).

-record(package,
        {type = 1 :: integer(),
         next_id = 1 :: pos_integer(),
         volume = 0 :: non_neg_integer(),
         free_cell = [] :: list(),
         items = [] :: [tuple()]}).

-file("src/mod/item/item_gift.erl", 24).

-file("inc/lev_break.hrl", 1).

-record(m_lev_break,
        {ver = 0,
         trial = 0 :: non_neg_integer(),
         done = 0 :: non_neg_integer(),
         times = 0 :: non_neg_integer(),
         attr_point = 0 :: non_neg_integer()}).

-file("src/mod/item/item_gift.erl", 25).

send_data([]) -> [];
send_data(GainList = [#gain{} | _]) ->
    send_data(GainList, []);
send_data(#gain{label = item_base_id,
                val = [{BaseId, Bind, Val}]}) ->
    {BaseId, Bind, Val};
send_data(V) ->
    case format:gain_to_val(V) of
        {Category, N} -> {Category, 0, N};
        R -> R
    end.

send_data([], Acc) -> Acc;
send_data([Gain | Rest], Acc) ->
    case send_data(Gain) of
        false -> send_data(Rest, Acc);
        New = {_, _, _} -> send_data(Rest, [New | Acc])
    end.

use(#item{base_id = BaseId, bind = Bind}, Num, Role) ->
    case get_list(Role, BaseId) of
        {false, Reason} -> {false, Reason};
        {_, _, []} -> {false, lang:get("您无法打开此礼包")};
        {1, Nums, List} ->
            case normal_gift(Role, Num, Nums, List) of
                {false, Reason} -> {false, Reason};
                {ok, NewRole, CastGain, Gain} ->
                    cast_msg(CastGain, NewRole, BaseId, Bind, Num),
                    logger:debug("原始数据：~w", [Gain], item_gift, 55),
                    GiftList = send_data(Gain),
                    logger:debug("发送数据：~w", [GiftList], item_gift, 57),
                    role:link_send(Role, 10339, {BaseId, GiftList}),
                    {ok, NewRole}
            end;
        {2, Nums, List} ->
            case random_gift(Role, Num, Nums, List) of
                {false, Reason} -> {false, Reason};
                {ok, NewRole, CastGain, Gain} ->
                    cast_msg(CastGain, NewRole, BaseId, Bind, Num),
                    logger:debug("原始数据：~w", [Gain], item_gift, 67),
                    GiftList = send_data(Gain),
                    logger:debug("发送的数据：~w", [GiftList], item_gift, 69),
                    role:link_send(Role, 10339, {BaseId, GiftList}),
                    {ok, NewRole}
            end;
        {3, Nums, List} ->
            case random_gift(Role, Num, Nums, List) of
                {false, Reason} -> {false, Reason};
                {ok, NewRole, CastGain, _} ->
                    cast_msg(CastGain, NewRole, BaseId, Bind, Num),
                    {ok, NewRole}
            end;
        {4, Nums, List, Times, OldVal} ->
            case limit_gift(Role, BaseId, Num, Nums, List, Times) of
                {false, Reason} -> {false, Reason};
                {ok, NewRole, CastGain, Gain} ->
                    MaxTimes = min(10000, Times + Num),
                    NewVal = lists:keystore(BaseId,
                                            1,
                                            OldVal,
                                            {BaseId, MaxTimes}),
                    cast_msg(CastGain, NewRole, BaseId, Bind, Num),
                    logger:debug("原始数据：~w", [Gain], item_gift, 91),
                    GiftList = send_data(Gain),
                    logger:debug("发送的数据：~w", [GiftList], item_gift, 93),
                    role:link_send(Role, 10339, {BaseId, GiftList}),
                    Nr = var:set_var(NewRole, acc, 1007, NewVal),
                    {ok, Nr}
            end;
        {5, Nums, List} ->
            case random_gift(Role, Num, Nums, List) of
                {false, Reason} -> {false, Reason};
                {ok, NewRole, CastGain, _} ->
                    cast_msg(CastGain, NewRole, BaseId, Bind, Num),
                    {ok, NewRole}
            end;
        {7, Nums, List, PastList} ->
            case new_limit_gift(Role,
                                BaseId,
                                Num,
                                Nums,
                                List,
                                PastList)
                of
                {false, Reason} -> {false, Reason};
                {ok, NewRole, CastGain, Gain} ->
                    cast_msg(CastGain, NewRole, BaseId, Bind, Num),
                    logger:debug("原始数据：~w", [Gain], item_gift, 126),
                    GiftList = send_data(Gain),
                    logger:debug("发送的数据：~w", [GiftList], item_gift, 128),
                    role:link_send(Role, 10339, {BaseId, GiftList}),
                    {ok, NewRole}
            end
    end.

use(#item{base_id = BaseId, bind = Bind}, Num, Role,
    Args) ->
    case lists:keyfind(1, 1, Args) of
        false -> {false, lang:get("该位置找不到配置的物品")};
        {1, TabId, _} ->
            case get_select_list(Role, BaseId, TabId) of
                {false, Reason} -> {false, Reason};
                {_, []} -> {false, lang:get("您无法打开此礼包")};
                {6, List} ->
                    case normal_gift(Role, Num, length(List), List) of
                        {false, Reason} -> {false, Reason};
                        {ok, NewRole, CastGain, Gain} ->
                            GiftList = send_data(Gain),
                            logger:debug("发送的数据：~w",
                                         [GiftList],
                                         item_gift,
                                         149),
                            role:link_send(Role, 10339, {BaseId, GiftList}),
                            cast_msg(CastGain, NewRole, BaseId, Bind, Num),
                            {ok, NewRole}
                    end
            end
    end.

cast_msg(Items, Role, ItemId = 23232, Bind, _Num) ->
    cast_msg2(Items, Role, ItemId, Bind, 1);
cast_msg(Items, Role, ItemId = 23251, Bind, _Num) ->
    cast_msg2(Items, Role, ItemId, Bind, 1);
cast_msg(Items, Role, ItemId, Bind, Num)
    when ItemId >= 22695 andalso ItemId =< 22698 ->
    cast_msg3(Items, Role, ItemId, Bind, Num);
cast_msg(Items, Role, ItemId, Bind, Num) ->
    cast_msg2(Items, Role, ItemId, Bind, Num).

cast_msg2([], _Role, _ItemId, _Bind, _Num) -> ok;
cast_msg2(Items, #role{name = RoleName}, ItemId, Bind,
          _Num) ->
    Msg = notice:format(lang:get("~ts在打开~ts时，竟获得~ts等贵重宝物"),
                        [{role_2, RoleName},
                         {item_2, ItemId, Bind, 1},
                         {item_2, Items}]),
    case [I || {I, _, _} <- Items, item_type:is_good_pet(I)]
        of
        [] -> notice:cast(all, 5, Msg);
        _ -> notice:cast(all, 10, Msg)
    end,
    ok.

cast_msg3([], _Role, _ItemId, _Bind, _Num) -> ok;
cast_msg3(Items, #role{name = RoleName}, ItemId, Bind,
          _Num) ->
    Msg = notice:format(lang:get("~ts在打开~ts时，竟获得~ts等贵重宝物"),
                        [{role_2, RoleName},
                         {item_2, ItemId, Bind, 1},
                         {item_2, Items}]),
    case [1
          || {BaseId, _, _} <- Items,
             lists:member(BaseId, [22205, 22207, 22208])]
        of
        [_ | _] ->
            notice:cast(all, 11, Msg),
            notice:cast(all, 5, Msg);
        _ -> notice:cast(all, 5, Msg)
    end.

normal_gift(Role, Num, Nums, List) ->
    case length(List) =:= Nums of
        false -> {false, lang:get("礼包数据错误, 无法开启")};
        true -> do_normal_gift(Role, Num, List, [])
    end.

do_normal_gift(Role, 0, _List, GainInfo) ->
    case special_use(Role, GainInfo) of
        {Gain = [_ | _], CastGain, Role1} ->
            case role_gain:do_notice(Gain, Role1) of
                {false, G} -> {false, G#gain.msg};
                {ok, NewRole} -> {ok, NewRole, CastGain, Gain}
            end;
        {_, _CastGain, Role1} -> {ok, Role1, [], []}
    end;
do_normal_gift(Role, Num, List, GainInfo) ->
    NewGainInfo = make_gain(List, GainInfo),
    do_normal_gift(Role, Num - 1, List, NewGainInfo).

random_gift(Role, Num, Nums, List) ->
    case length(List) < Nums of
        true -> {false, lang:get("礼包数据错误, 无法开启")};
        false -> do_random_gift(Role, Num, Nums, List, [])
    end.

do_random_gift(Role, 0, _Nums, _List, GainInfo) ->
    case special_use(Role, GainInfo) of
        {Gain = [_ | _],
         CastGain,
         Role1 = #role{p_bag =
                           #package{free_cell = FreeCell}}} ->
            case FreeCell =:= [] of
                true -> {false, lang:get("背包已满，请先整理背包")};
                _ ->
                    case role_gain:do_notice(Gain, Role1) of
                        {false, G} -> {false, G#gain.msg};
                        {ok, NewRole} -> {ok, NewRole, CastGain, Gain}
                    end
            end;
        {_, _, Role1} -> {ok, Role1, [], []}
    end;
do_random_gift(Role, Num, Nums, List, GainInfo) ->
    RandomList = get_rand_list(List, Nums),
    NewGainInfo = make_gain(RandomList, GainInfo),
    do_random_gift(Role, Num - 1, Nums, List, NewGainInfo).

limit_gift(Role, BaseId, Num, Nums, List, Times) ->
    {OutTime, LimitList} = var:get_list_var(Role,
                                            acc,
                                            1006,
                                            BaseId,
                                            {0, []}),
    limit_gift(Role,
               BaseId,
               Num,
               Nums,
               List,
               Times,
               {OutTime, LimitList},
               []).

limit_gift(Role, BaseId, 0, _Nums, _List, _Times,
           {OutTime, LimitList}, GainInfo) ->
    case special_use(Role, GainInfo) of
        {Gain = [_ | _],
         CastGain,
         Role1 = #role{p_bag =
                           #package{free_cell = FreeCell}}} ->
            case FreeCell =:= [] of
                true -> {false, lang:get("背包已满，请先整理背包")};
                _ ->
                    case role_gain:do_notice(Gain, Role1) of
                        {false, G} -> {false, G#gain.msg};
                        {ok, NewRole} ->
                            NewRole1 = var:set_list_var(NewRole,
                                                        acc,
                                                        1006,
                                                        BaseId,
                                                        {OutTime, LimitList}),
                            {ok, NewRole1, CastGain, Gain}
                    end
            end;
        {_, _, Role1} ->
            Role2 = var:set_list_var(Role1,
                                     acc,
                                     1006,
                                     BaseId,
                                     {OutTime, LimitList}),
            {ok, Role2, [], []}
    end;
limit_gift(Role, BaseId, Num, Nums, List, Times,
           {OutTime, LimitList}, GainInfo) ->
    NewList = filter_limit_list(List, LimitList),
    case get_must_out_list(NewList, 99999999999) of
        [] ->
            NewList1 = get_limit_list(NewList, Times),
            RandomList = get_rand_list(NewList1, Nums),
            GainList = RandomList,
            NewGainInfo = make_gain(GainList, GainInfo),
            NewLimitList = update_limit_list(GainList, LimitList),
            limit_gift(Role,
                       BaseId,
                       Num - 1,
                       Nums,
                       List,
                       Times + 1,
                       {OutTime, NewLimitList},
                       NewGainInfo);
        List1 ->
            OutList = get_must_out_list(List1, OutTime),
            NewList1 = get_limit_list(NewList -- OutList, Times),
            RandomList = get_rand_list(NewList1,
                                       max(0, Nums - length(OutList))),
            GainList = RandomList ++ OutList,
            NewGainInfo = make_gain(GainList, GainInfo),
            NewOutTime = case OutList of
                             [] -> OutTime + 1;
                             _ -> 0
                         end,
            NewLimitList = update_limit_list(GainList, LimitList),
            limit_gift(Role,
                       BaseId,
                       Num - 1,
                       Nums,
                       List,
                       Times + 1,
                       {NewOutTime, NewLimitList},
                       NewGainInfo)
    end.

filter_limit_list(List, LimitList) ->
    [H
     || H = #{item_id := BaseId} <- List,
        lists:member(BaseId, LimitList) =:= false].

update_limit_list([], LimitList) -> LimitList;
update_limit_list([#{item_id := BaseId, is_limit := 1}
                   | T],
                  LimitList) ->
    update_limit_list(T, [BaseId | LimitList]);
update_limit_list([_ | T], LimitList) ->
    update_limit_list(T, LimitList).

get_limit_list(List, Times) ->
    [H
     || H = #{need_time := NeedTime} <- List,
        Times >= NeedTime].

get_must_out_list(List, Times) ->
    [H
     || H = #{out_time := OutTime} <- List,
        Times >= OutTime andalso OutTime > 0].

get_rand_list(List, Nums) ->
    {Normal, RandomList} = lists:partition(fun (#{ratio :=
                                                      Ratio}) ->
                                                   Ratio =:= 0
                                           end,
                                           List),
    Len = length(Normal),
    AllRatio = lists:sum([Ratio
                          || #{ratio := Ratio} <- RandomList]),
    do_get_rand_list(RandomList, AllRatio, Nums - Len, [])
        ++ Normal.

do_get_rand_list(_List, _Rate, Num, GetList)
    when Num =< 0 ->
    GetList;
do_get_rand_list([], _Rate, _Num, GetList) ->
    logger:error("礼包数据错误，获得数量配置错误~w",
                 [{_Num, GetList}],
                 item_gift,
                 324),
    GetList;
do_get_rand_list(List, Rate, Num, GetList) ->
    Seed = util:rand(1, Rate),
    case do_get_rand_item(List, Seed, Rate) of
        {NewL, GetL, NewRate} ->
            do_get_rand_list(NewL,
                             NewRate,
                             Num - 1,
                             [GetL | GetList]);
        {false, Reason} ->
            logger:error("随机礼包发生错误，礼包内容为:~w",
                         [Reason],
                         item_gift,
                         332),
            do_get_rand_list(List, Rate, Num - 1, GetList)
    end.

do_get_rand_item(List, Seed, Rate) ->
    do_get_rand_item(List, Seed, Rate, 0, []).

do_get_rand_item([], _Seed, _Rate, _Range, _Back) ->
    {false, util:flist("~w", [_Back])};
do_get_rand_item([L = #{ratio := Ratio} | T], Seed,
                 Rate, Range, Back) ->
    case Seed =< Ratio + Range of
        true -> {T ++ Back, L, Rate - Ratio};
        false ->
            do_get_rand_item(T,
                             Seed,
                             Rate,
                             Range + Ratio,
                             [L | Back])
    end.

make_gain([], GainInfo) -> GainInfo;
make_gain([#{item_id := ItemId, num := Num,
             bind := Bind, is_cast := IsCast}
           | T],
          GainInfo) ->
    case lists:keyfind(ItemId, 1, GainInfo) of
        {ItemId, Bind, OldNum, _} ->
            make_gain(T,
                      lists:keyreplace(ItemId,
                                       1,
                                       GainInfo,
                                       {ItemId, Bind, OldNum + Num, IsCast}));
        _ ->
            make_gain(T, [{ItemId, Bind, Num, IsCast} | GainInfo])
    end.

get_list(Role = #role{m_guild = MGuild,
                      m_teacher = #m_teacher{status = STeacher}},
         BaseId) ->
    case item_gift_data:get(BaseId) of
        false -> {false, lang:get("礼包数据异常")};
        {{1, Nums}, List} ->
            NewList = check_role_cond(Role, List),
            {1, Nums, NewList};
        {{2, Nums}, List} ->
            NewList = check_role_cond(Role, List),
            {2, Nums, NewList};
        {{3, Nums}, List} ->
            case MGuild of
                #m_guild{post = Post} ->
                    NewList = check_guild_cond(Role, List, Post),
                    {3, Nums, NewList};
                _ -> {false, lang:get("需要加入公会才能打开此礼包")}
            end;
        {{4, Nums}, List} ->
            LimitList = var:get_var(Role, acc, 1007, []),
            NowTimes = case lists:keyfind(BaseId, 1, LimitList) of
                           {_, Ts} -> Ts;
                           _ -> 0
                       end,
            NewList = check_role_cond(Role, List),
            {4, Nums, NewList, NowTimes, LimitList};
        {{5, Nums}, List} ->
            NewList = check_teacher_cond(Role, List, STeacher),
            {5, Nums, NewList};
        {{7, Nums}, List} ->
            PastList = var:get_list_var(Role,
                                        acc,
                                        1023,
                                        BaseId,
                                        []),
            {7, Nums, List, PastList}
    end.

get_select_list(Role, BaseId, TabId) ->
    case item_gift_data:get_select({BaseId, TabId}) of
        false -> {false, lang:get("礼包数据异常")};
        List ->
            NewList = check_role_cond(Role, List),
            {6, NewList}
    end.

check_teacher_cond(Role, List, STeacher) ->
    Post = case STeacher of
               0 -> 0;
               1 -> 1;
               2 -> 0;
               3 -> 3;
               _ -> 0
           end,
    check_guild_cond(Role, List, Post).

check_guild_cond(#role{sex = Sex, lev = Lev,
                       classes = Classes},
                 List, Post) ->
    check_guild_cond(Sex, Lev, Classes, Post, List, []).

check_guild_cond(_Sex, _Lev, _Classes, _Post, [],
                 List) ->
    List;
check_guild_cond(Sex, Lev, Classes, Post,
                 [H = #{sex := Sex1, lev_low := LevLow,
                        lev_high := LevHigh, classes := Classes1,
                        post_list := PostList}
                  | T],
                 List)
    when (Sex1 =:= Sex orelse Sex1 =:= 2) andalso
             (Classes1 =:= Classes orelse Classes1 =:= 0) andalso
                 (LevLow =:= 0 andalso LevHigh =:= 0 orelse
                      LevLow =:= 0 andalso Lev =< LevHigh orelse
                          Lev >= LevLow andalso LevHigh =:= 0 orelse
                              Lev >= LevLow andalso Lev =< LevHigh) ->
    case lists:member(Post, PostList) of
        true ->
            check_guild_cond(Sex,
                             Lev,
                             Classes,
                             Post,
                             T,
                             [H | List]);
        false ->
            check_guild_cond(Sex, Lev, Classes, Post, T, List)
    end;
check_guild_cond(Sex, Lev, Classes, Post, [_ | T],
                 List) ->
    check_guild_cond(Sex, Lev, Classes, Post, T, List).

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

special_use(Role, GainInfo) ->
    special_use(Role, GainInfo, [], [], []).

special_use(Role, [], UseList, Gain, CastGain) ->
    NewRole = case UseList of
                  [] -> Role;
                  _ ->
                      Role1 = do_special_use(UseList, Role),
                      Role2 = attr:calc_and_push(Role1),
                      role_trigger:fire(#evt_eqm{}, Role2)
              end,
    GainList = format:val_to_gain(Gain),
    {GainList, CastGain, NewRole};
special_use(Role, [{BaseId, Bind, 1, IsCast} | T],
            UseList, Gain, CastGain)
    when BaseId < 90000 ->
    case item_data:get(BaseId) of
        #item_base{type = Type} ->
            case eqm:is_eqm(Type) of
                true ->
                    case item:make(BaseId, Bind, 1) of
                        {ok, [Item]} ->
                            special_use(Role,
                                        T,
                                        [Item | UseList],
                                        Gain,
                                        CastGain);
                        _ ->
                            special_use(Role,
                                        T,
                                        UseList,
                                        [{BaseId, Bind, 1} | Gain],
                                        CastGain)
                    end;
                false ->
                    NewBaseId = item_type:special_id(BaseId),
                    NewCastGain = case IsCast of
                                      1 ->
                                          case lists:keyfind(NewBaseId,
                                                             1,
                                                             CastGain)
                                              of
                                              {NewBaseId, Bind, N} ->
                                                  lists:keystore(NewBaseId,
                                                                 1,
                                                                 CastGain,
                                                                 {NewBaseId,
                                                                  Bind,
                                                                  N + 1});
                                              _ ->
                                                  [{NewBaseId, Bind, 1}
                                                   | CastGain]
                                          end;
                                      _ -> CastGain
                                  end,
                    special_use(Role,
                                T,
                                UseList,
                                [{NewBaseId, Bind, 1} | Gain],
                                NewCastGain)
            end;
        _ -> special_use(Role, T, UseList, Gain, CastGain)
    end;
special_use(Role, [{BaseId, Bind, Num, IsCast} | T],
            UseList, Gain, CastGain) ->
    NewBaseId = item_type:special_id(BaseId),
    case BaseId =/= NewBaseId of
        true ->
            SpecialList = to_special_item(BaseId, Bind, Num),
            NewCastGain = case IsCast of
                              1 -> SpecialList ++ CastGain;
                              _ -> CastGain
                          end,
            special_use(Role,
                        T,
                        UseList,
                        SpecialList ++ Gain,
                        NewCastGain);
        false ->
            NewCastGain = case IsCast of
                              1 ->
                                  case lists:keyfind(NewBaseId, 1, CastGain) of
                                      {NewBaseId, Bind, N} ->
                                          lists:keystore(NewBaseId,
                                                         1,
                                                         CastGain,
                                                         {NewBaseId,
                                                          Bind,
                                                          N + Num});
                                      _ -> [{NewBaseId, Bind, Num} | CastGain]
                                  end;
                              _ -> CastGain
                          end,
            special_use(Role,
                        T,
                        UseList,
                        [{NewBaseId, Bind, Num} | Gain],
                        NewCastGain)
    end;
special_use(Role, [_ | T], UseList, Gain, CastGain) ->
    special_use(Role, T, UseList, Gain, CastGain).

to_special_item(BaseId, Bind, Num) ->
    to_special_item(BaseId, Bind, Num, []).

to_special_item(_, _, Num, ItemList) when Num =< 0 ->
    ItemList;
to_special_item(BaseId, Bind, Num, ItemList) ->
    NewBaseId = item_type:special_id(BaseId),
    NewNum = case lists:keyfind(NewBaseId, 1, ItemList) of
                 {_, _, OldNum} -> OldNum + 1;
                 _ -> 1
             end,
    to_special_item(BaseId,
                    Bind,
                    Num - 1,
                    lists:keystore(NewBaseId,
                                   1,
                                   ItemList,
                                   {NewBaseId, Bind, NewNum})).

do_special_use([], Role) -> Role;
do_special_use([BagItem = #item{base_id = BaseId,
                                quantity = Quantity, type = Type, lev = BagLev}
                | T],
               Role = #role{p_eqm = Peqm}) ->
    NewRole = case package:find(by_id,
                                eqm:type_to_id(Type),
                                Peqm)
                  of
                  false ->
                      NewId = eqm:type_to_id(Type),
                      NewPos = eqm:type_to_pos(Type),
                      PutItem = BagItem#item{id = NewId, pos = NewPos},
                      case package:add(by_items, eqm, Role, [PutItem]) of
                          {ok, NewEqm} ->
                              notice:send(Role,
                                          1,
                                          {lang:get("装备~ts"),
                                           [{item_2, BaseId, Quantity}]}),
                              Role#role{p_eqm = NewEqm};
                          _ -> Role
                      end;
                  {ok, #item{lev = EqmLev}} when EqmLev >= BagLev ->
                      G = [#gain{label = items, val = [BagItem]}],
                      case role_gain:do(G, Role) of
                          {ok, Role1} -> Role1;
                          _ -> Role
                      end;
                  {ok, EqmItem = #item{lev = EqmLev}} ->
                      {NewBagItem, NewEqmItem} = eqm:change_eqm(BagItem,
                                                                EqmItem),
                      {ok, NewPeqm, _} = package:replace_item(EqmItem,
                                                              NewEqmItem,
                                                              Peqm,
                                                              Role),
                      Role1 = Role#role{p_eqm = NewPeqm},
                      G = case EqmLev =< 30 of
                              true -> [#gain{label = coin, val = 1000}];
                              false ->
                                  [#gain{label = items, val = [NewBagItem]}]
                          end,
                      notice:send(Role,
                                  1,
                                  {lang:get("装备~ts"),
                                   [{item_2, BaseId, Quantity}]}),
                      case role_gain:do(G, Role1) of
                          {ok, Role2} -> Role2;
                          _ -> Role1
                      end
              end,
    do_special_use(T, NewRole).

new_limit_gift(Role, BaseId, Num, Nums, List,
               PastList) ->
    new_limit_gift(Role,
                   BaseId,
                   Num,
                   Nums,
                   List,
                   PastList,
                   []).

new_limit_gift(Role, BaseId, 0, _Nums, _List, PastList,
               GainInfo) ->
    case special_use(Role, GainInfo) of
        {Gain = [_ | _],
         CastGain,
         Role1 = #role{p_bag =
                           #package{free_cell = FreeCell}}} ->
            case FreeCell =:= [] of
                true -> {false, lang:get("背包已满，请先整理背包")};
                _ ->
                    case role_gain:do_notice(Gain, Role1) of
                        {false, G} -> {false, G#gain.msg};
                        {ok, NewRole} ->
                            NewRole1 = var:set_list_var(NewRole,
                                                        acc,
                                                        1023,
                                                        BaseId,
                                                        PastList),
                            {ok, NewRole1, CastGain, Gain}
                    end
            end;
        {_, _, Role1} ->
            Role2 = var:set_list_var(Role1,
                                     acc,
                                     1023,
                                     BaseId,
                                     PastList),
            {ok, Role2, [], []}
    end;
new_limit_gift(Role, BaseId, Num, Nums, List, PastList,
               GainInfo) ->
    CondList = check_role_cond(Role, List),
    case catch get_spcial_gift_list(CondList) of
        no_special_gift ->
            GainList = get_rand_list(CondList, Nums),
            NewGainInfo = make_gain(GainList, GainInfo),
            new_limit_gift(Role,
                           BaseId,
                           Num - 1,
                           Nums,
                           List,
                           PastList,
                           NewGainInfo);
        SpecialGiftList when is_list(SpecialGiftList) ->
            logger:debug("~w", [SpecialGiftList], item_gift, 717),
            GainList = case get_must_appear_gift(SpecialGiftList,
                                                 PastList)
                           of
                           no_must_appear_gift ->
                               CantAppearList =
                                   get_not_appear_gift_list(SpecialGiftList,
                                                            PastList),
                               get_rand_list(CondList -- CantAppearList, Nums);
                           Item = #{item_id := _ItemId} ->
                               CantAppearList =
                                   get_not_appear_gift_list(SpecialGiftList,
                                                            PastList),
                               get_rand_list(CondList --
                                                 [Item | CantAppearList],
                                             Nums - 1)
                                   ++ [Item];
                           _ -> logger:error("匹配错误", [], item_gift, 731)
                       end,
            NewGainInfo = make_gain(GainList, GainInfo),
            NewPastList = update_pastList(CondList,
                                          GainList,
                                          PastList),
            new_limit_gift(Role,
                           BaseId,
                           Num - 1,
                           Nums,
                           List,
                           NewPastList,
                           NewGainInfo);
        _ ->
            logger:error("获取特殊物品的失败，绝大多数是匹配不上，配置有问题",
                         [],
                         item_gift,
                         738)
    end.

get_spcial_gift_list(List) ->
    get_spcial_gift_list(List, []).

get_spcial_gift_list([], []) -> no_special_gift;
get_spcial_gift_list([], List) -> lists:reverse(List);
get_spcial_gift_list([H | T], List) ->
    case H of
        Val = #{circle_times := Length} when Length /= 0 ->
            get_spcial_gift_list(T, [Val | List]);
        _ -> get_spcial_gift_list(T, List)
    end.

get_must_appear_gift([], _) -> no_must_appear_gift;
get_must_appear_gift([H = #{item_id := ItemId,
                            circle_times := CircleTimes, minTimes := MinTimes}
                      | T],
                     PastList) ->
    case lists:keyfind(ItemId, 1, PastList) of
        {ItemId,
         #{has_used_times := HasUsedTimes,
           appearTimes := AppearTimes}} ->
            case AppearTimes >= MinTimes of
                true -> get_must_appear_gift(T, PastList);
                _ ->
                    case CircleTimes - HasUsedTimes =<
                             MinTimes - AppearTimes
                        of
                        true -> H;
                        _ -> get_must_appear_gift(T, PastList)
                    end
            end;
        _ -> get_must_appear_gift(T, PastList)
    end.

get_not_appear_gift_list(SpecialGiftList, PastList) ->
    get_not_appear_gift_list(SpecialGiftList, PastList, []).

get_not_appear_gift_list([], _, CantAppearList) ->
    CantAppearList;
get_not_appear_gift_list([H = #{item_id := ItemId,
                                maxTimes := MaxTimes}
                          | T],
                         PastList, CantAppearList) ->
    case lists:keyfind(ItemId, 1, PastList) of
        {ItemId, #{appearTimes := AppearTimes}} ->
            case AppearTimes >= MaxTimes of
                true ->
                    get_not_appear_gift_list(T,
                                             PastList,
                                             [H | CantAppearList]);
                _ ->
                    get_not_appear_gift_list(T, PastList, CantAppearList)
            end;
        _ ->
            get_not_appear_gift_list(T, PastList, CantAppearList)
    end.

update_pastList([], _, PastList) -> PastList;
update_pastList(_CondList = [#{circle_times := 0} | T],
                GainList, PastList) ->
    update_pastList(T, GainList, PastList);
update_pastList(_CondList = [#{item_id := ItemId,
                               circle_times := CircleTimes}
                             | T],
                GainList, PastList) ->
    {ItemId,
     #{has_used_times := OldHasUsedTimes,
       appearTimes := OldAppearTimes}} =
        case lists:keyfind(ItemId, 1, PastList) of
            false ->
                {ItemId, #{has_used_times => 0, appearTimes => 0}};
            Oth -> Oth
        end,
    NewAppearTimes = case lists:filter(fun (#{item_id :=
                                                  PItemId}) ->
                                               PItemId =:= ItemId
                                       end,
                                       GainList)
                         of
                         [] -> OldAppearTimes;
                         _ -> OldAppearTimes + 1
                     end,
    NewState = case OldHasUsedTimes + 1 >= CircleTimes of
                   true -> #{has_used_times => 0, appearTimes => 0};
                   _ ->
                       #{has_used_times => OldHasUsedTimes + 1,
                         appearTimes => NewAppearTimes}
               end,
    NewPastList = lists:keystore(ItemId,
                                 1,
                                 PastList,
                                 {ItemId, NewState}),
    update_pastList(T, GainList, NewPastList).

