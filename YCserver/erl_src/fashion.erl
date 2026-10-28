-file("src/mod/dress/fashion.erl", 1).

-module(fashion).

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

-file("src/mod/dress/fashion.erl", 13).

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

-file("src/mod/dress/fashion.erl", 14).

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

-file("src/mod/dress/fashion.erl", 15).

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

-file("src/mod/dress/fashion.erl", 16).

-file("inc/looks.hrl", 1).

-file("src/mod/dress/fashion.erl", 17).

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

-file("src/mod/dress/fashion.erl", 18).

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

-file("src/mod/dress/fashion.erl", 19).

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

-file("src/mod/dress/fashion.erl", 20).

-file("inc/fashion.hrl", 1).

-record(m_fashion,
        {ver = 5,
         head = [],
         clothes = [],
         belt = [],
         ring = [],
         head_dyeing = [],
         clothes_dyeing = [],
         head_ornament = [],
         collect_lev = 0,
         collect_val = 0,
         classes_eqm = 0,
         eqm = []}).

-record(fashion_dress_data,
        {base_id = 0,
         name = "",
         type,
         quality = 0,
         classes = 0,
         sex = 2,
         lev,
         set_id = 0,
         texture_id = 0,
         is_origin = 0,
         loss = [],
         attrs = [],
         score = 0,
         can_use = 0,
         model_id = 0}).

-record(fashion_wear_data,
        {id = 0,
         base_id = 0,
         expire_type = 0,
         expire_time = 0}).

-record(fashion_dress,
        {base_id = 0,
         expire_type = 0,
         expire_time = 0,
         is_wear = 0}).

-record(fashion_dyeing, {dyeing_id = 0, is_use = 0}).

-record(fashion_time_data,
        {id = 0, expire_type = 0, expire_time = 0}).

-file("src/mod/dress/fashion.erl", 21).

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

-file("src/mod/dress/fashion.erl", 22).

-file("inc/package.hrl", 1).

-record(package,
        {type = 1 :: integer(),
         next_id = 1 :: pos_integer(),
         volume = 0 :: non_neg_integer(),
         free_cell = [] :: list(),
         items = [] :: [tuple()]}).

-file("src/mod/dress/fashion.erl", 23).

-compile({inline,
          [{get_type_list, 2}, {set_type_list, 3}]}).

-export([init/0,
         login/1,
         get_own/1,
         wear_batch/2,
         rpc_wear/2,
         get_look/1,
         check_expire_time/1,
         count/1,
         mail_compensate/2,
         rpc_buy_ornament/2,
         rpc_put_on_ornament/3,
         push/1,
         put_on_fashion/2,
         get_need_wear_list/2,
         count/2,
         fashion_classes_modify/2,
         uplev_collect/1,
         recalc_collect/2,
         add_mount_appearance_collect_val/2,
         rpc_eqm/2,
         take_off_weapon/1,
         adm_show/1,
         repaire_fashion/2,
         gm_set/3]).

init() -> #m_fashion{}.

login(Role) ->
    NRole = check_forerver(Role),
    {ok, NewRole} = check_expire_time(NRole),
    NewRole1 = check_del_dress(NewRole),
    {ok, NewRole2} = recalc_collect(NewRole1, not_push),
    {ok, NewRole2}.

recalc_collect(Role = #role{name = Name,
                            classes = Classes,
                            m_fashion =
                                Mf = #m_fashion{head = Head, clothes = Clothes,
                                                belt = Belt,
                                                head_ornament = HeadOrnament,
                                                head_dyeing = HeadDyeing,
                                                clothes_dyeing = ClothesDyeing,
                                                collect_lev = CollectLev,
                                                collect_val = OldCollectVal}},
               Flag) ->
    CollectVal = fashion_ver:calc_collect_val(Head ++
                                                  Clothes ++
                                                      Belt ++
                                                          HeadOrnament ++
                                                              HeadDyeing ++
                                                                  ClothesDyeing),
    MountCollectVal = mount:calc_collect_val(Role),
    HonorCollectVal = honor:calc_collect_val(Role),
    {NewCollectLev, NewCollectVal} =
        auto_uplev_collect(Classes,
                           CollectVal + MountCollectVal + HonorCollectVal,
                           CollectLev),
    NewMf = Mf#m_fashion{collect_lev = NewCollectLev,
                         collect_val = NewCollectVal},
    Role1 = Role#role{m_fashion = NewMf},
    case NewCollectLev =/= CollectLev orelse Flag =:= push
        of
        true ->
            logger:info("[~ts]颜值重算[~w][~w]->[~w][~w], 总值[~w]",
                        [Name,
                         CollectLev,
                         OldCollectVal,
                         NewCollectLev,
                         NewCollectVal,
                         CollectVal],
                        fashion,
                        93),
            ok;
        _ -> skip
    end,
    NewRole = case Flag of
                  push ->
                      Role2 = attr:calc_and_push(Role1),
                      push(Role2),
                      Role2;
                  _ -> Role1
              end,
    {ok, NewRole}.

auto_uplev_collect(Classes, CollectVal,
                   MaxCollectLev) ->
    auto_uplev_collect(Classes,
                       CollectVal,
                       MaxCollectLev,
                       0).

auto_uplev_collect(_Classes, CollectVal, MaxCollectLev,
                   NowCollectLev)
    when NowCollectLev >= MaxCollectLev ->
    {NowCollectLev, CollectVal};
auto_uplev_collect(Classes, CollectVal, MaxCollectLev,
                   NowCollectLev) ->
    case fashion_data:get_collect({NowCollectLev + 1,
                                   Classes})
        of
        #{loss_collect := LossCollectVal}
            when CollectVal >= LossCollectVal ->
            auto_uplev_collect(Classes,
                               CollectVal - LossCollectVal,
                               MaxCollectLev,
                               NowCollectLev + 1);
        _ -> {NowCollectLev, CollectVal}
    end.

uplev_collect(Role = #role{classes = Classes,
                           m_fashion =
                               Mf = #m_fashion{collect_lev = CollectLev,
                                               collect_val = CollectVal}}) ->
    case fashion_data:get_collect({CollectLev + 1, Classes})
        of
        #{loss := LossVal, name := Name,
          loss_collect := LossCollectVal, gain := GainVal}
            when CollectVal >= LossCollectVal ->
            Loss = format:val_to_loss(LossVal,
                                      #{item_base_id_auto_buy => 1,
                                        auto_scene => lang:get("颜值升级")}),
            case role_gain:do_notice(Loss, Role) of
                {ok, NewRole} ->
                    Gain = format:val_to_gain(GainVal),
                    case role_gain:do_notice(Gain, NewRole) of
                        {ok, NewRole1} ->
                            NewCollectLev = CollectLev + 1,
                            NewCollectVal = CollectVal - LossCollectVal,
                            NewMf = Mf#m_fashion{collect_lev = NewCollectLev,
                                                 collect_val = NewCollectVal},
                            NewRole2 = NewRole1#role{m_fashion = NewMf},
                            Msg = notice:format(lang:get("提升成功，颜值提升至~ts"),
                                                [{string_2, 1, Name}]),
                            NewRole3 = attr:calc_and_push(NewRole2),
                            {ok, NewRole3, Msg, NewCollectLev, NewCollectVal};
                        _ -> {false, lang:get("背包已满，请先整理背包")}
                    end;
                _ -> {false, lang:get("道具不足，无法提升")}
            end;
        #{loss_collect := LossCollectVal} ->
            Msg =
                notice:format(lang:get("颜值不足~ts，快去收集时装吧{face_1,1}"),
                              [{string_2, 6, LossCollectVal}]),
            {false, Msg};
        _ -> {false, lang:get("已经满级无法提升")}
    end.

get_look(#role{sex = Sex, classes = Classes,
               m_fashion =
                   #m_fashion{head = Head, clothes = Clothes, belt = Belt,
                              ring = Ring, head_dyeing = HeadDying,
                              clothes_dyeing = ClothesDying,
                              head_ornament = HeadOrnaments}}) ->
    List1 = case lists:keyfind(1,
                               #fashion_dress.is_wear,
                               Head)
                of
                #fashion_dress{base_id = BaseId1} ->
                    case get_dress_skin(BaseId1) of
                        {SkinId1, ModelId1} -> [{2, SkinId1, ModelId1, ""}];
                        _ -> []
                    end;
                _ -> []
            end,
    List2 = case lists:keyfind(1,
                               #fashion_dress.is_wear,
                               Clothes)
                of
                #fashion_dress{base_id = BaseId2} ->
                    case get_dress_skin(BaseId2) of
                        {SkinId2, ModelId2} -> [{3, SkinId2, ModelId2, ""}];
                        _ -> []
                    end;
                _ -> []
            end,
    List3 = case lists:keyfind(1,
                               #fashion_dress.is_wear,
                               Belt)
                of
                #fashion_dress{base_id = BaseId3} ->
                    [{4, look_data:get_fashion(BaseId3), BaseId3, ""}];
                _ -> []
            end,
    List4 = case lists:keyfind(1,
                               #fashion_dress.is_wear,
                               Ring)
                of
                #fashion_dress{base_id = BaseId4} ->
                    [{5, 0, BaseId4, ""}];
                _ -> []
            end,
    List5 = case lists:keyfind(1,
                               #fashion_dress.is_wear,
                               HeadOrnaments)
                of
                #fashion_dress{base_id = BaseId5} ->
                    [{6, 0, BaseId5, ""}];
                _ -> []
            end,
    FashionLooks = List1 ++
                       List2 ++ List3 ++ List4 ++ List5,
    DyeHead = case lists:keyfind(1,
                                 #fashion_dyeing.is_use,
                                 HeadDying)
                  of
                  #fashion_dyeing{dyeing_id = Dyeing1} ->
                      case get_dyeing_skin(2, Classes, Sex, Dyeing1) of
                          {SkinIdHead, ModelIdHead} ->
                              [{2, SkinIdHead, ModelIdHead, ""}];
                          _ -> []
                      end;
                  _ -> []
              end,
    DyeClothes = case lists:keyfind(1,
                                    #fashion_dyeing.is_use,
                                    ClothesDying)
                     of
                     #fashion_dyeing{dyeing_id = Dyeing2} ->
                         case get_dyeing_skin(3, Classes, Sex, Dyeing2) of
                             {SkinIdClothes, ModelIdClothes} ->
                                 [{3, SkinIdClothes, ModelIdClothes, ""}];
                             _ -> []
                         end;
                     _ -> []
                 end,
    DyeLooks = DyeHead ++ DyeClothes,
    replace_base(DyeLooks, FashionLooks).

replace_base([], Looks) -> Looks;
replace_base([Look = {Type, _, _BaseId, _Str} | Rest],
             Looks) ->
    replace_base(Rest,
                 lists:keystore(Type, 1, Looks, Look)).

rpc_buy_ornament(Role,
                 {HeadOrnament,
                  HeadTimeId,
                  BeltOrnamentId,
                  BeltTimeId}) ->
    case check_buy_Ornament({HeadOrnament,
                             HeadTimeId,
                             BeltOrnamentId,
                             BeltTimeId})
        of
        {true, BuyOrnament = [_ | _], PutOnList} ->
            logger:debug("检查购买成功：~w", [BuyOrnament], fashion, 222),
            TotalPrice = get_ornament_price(BuyOrnament),
            logger:debug("计算价格成功：~w", [TotalPrice], fashion, 225),
            Loss = format:val_to_loss([{90002, TotalPrice}]),
            case role_gain:do_notice(Loss, Role) of
                {ok, LossRole} ->
                    logger:debug("扣除玩家资源成功:~w",
                                 [BuyOrnament],
                                 fashion,
                                 230),
                    case wear_batch(BuyOrnament, LossRole) of
                        {ok, BuyRole} ->
                            logger:debug("购买后进行穿戴:~w",
                                         [PutOnList],
                                         fashion,
                                         234),
                            put_on_fashion(PutOnList, BuyRole);
                        BuyResult -> BuyResult
                    end;
                {false, #gain{msg = Msg}} -> {false, Msg};
                _ -> {false, lang:get("资产不足")}
            end;
        {false, Reason} -> {false, Reason}
    end;
rpc_buy_ornament(_, _) -> {false, lang:get("购买参数错误")}.

rpc_put_on_ornament(Role, HeadOrnamentId,
                    BeltOrnamentId) ->
    logger:debug("穿戴饰品:~w, ~w",
                 [HeadOrnamentId, BeltOrnamentId],
                 fashion,
                 250),
    List = [{6, HeadOrnamentId}, {4, BeltOrnamentId}],
    put_on_fashion(List, Role).

get_own(#role{m_fashion =
                  #m_fashion{head = Head, clothes = Clothes, eqm = Eqm,
                             classes_eqm = _ClassesEqm, belt = Belt,
                             head_dyeing = HeadDyeing,
                             clothes_dyeing = ClothesDyeing,
                             head_ornament = HeadOrnaments,
                             collect_val = CollectVal,
                             collect_lev = CollectLev}}) ->
    Dress = [{2, Head},
             {3, Clothes},
             {4, Belt},
             {6, HeadOrnaments},
             {1, Eqm}],
    Dyeing = [{2, HeadDyeing}, {3, ClothesDyeing}],
    {Dress, Dyeing, CollectLev, CollectVal}.

count(#role{m_fashion =
                #m_fashion{head = Head, clothes = Clothes, belt = Belt,
                           ring = Ring, head_ornament = HeadOrnament}}) ->
    length(Head) + length(Clothes) + length(Belt) +
        length(Ring)
        + length(HeadOrnament).

count(#role{m_fashion =
                #m_fashion{head = Head, clothes = Clothes}},
      suit) ->
    max(length(Head), length(Clothes));
count(#role{m_fashion = #m_fashion{clothes = Clothes}},
      1) ->
    length(Clothes);
count(#role{m_fashion =
                #m_fashion{clothes_dyeing = List, head_dyeing = List1}},
      2) ->
    length(List ++ List1);
count(#role{m_fashion =
                #m_fashion{belt = List, head_ornament = List1}},
      3) ->
    length(List ++ List1);
count(_, _) -> 0.

fashion_classes_modify(Role = #role{sex = Sex,
                                    m_fashion =
                                        Mfashion = #m_fashion{head_dyeing =
                                                                  HeadDyeing,
                                                              clothes_dyeing =
                                                                  ClothesDyeing,
                                                              eqm = Eqm}},
                       TargetClasses) ->
    NewHeadDyeing = calc_classes_modify(TargetClasses,
                                        Sex,
                                        2,
                                        HeadDyeing,
                                        []),
    NewClothesDyeing = calc_classes_modify(TargetClasses,
                                           Sex,
                                           3,
                                           ClothesDyeing,
                                           []),
    NewEqm = calc_classes_modify(TargetClasses,
                                 Sex,
                                 1,
                                 Eqm,
                                 []),
    NewRole = Role#role{m_fashion =
                            Mfashion#m_fashion{head_dyeing = NewHeadDyeing,
                                               clothes_dyeing =
                                                   NewClothesDyeing,
                                               eqm = NewEqm}},
    push(NewRole, 0),
    NewRole.

calc_classes_modify(_Classes, _Sex, _DyeingType, [],
                    NewDyeing) ->
    NewDyeing;
calc_classes_modify(TargetClasses, Sex, _DyeingType,
                    [FashionData = #fashion_dyeing{dyeing_id = Id} | Rest],
                    NewDyeing) ->
    case
        fashion_data:get_fashion_class_modify({TargetClasses,
                                               Sex,
                                               Id})
        of
        NewId when is_integer(NewId) ->
            NewfashionData = FashionData#fashion_dyeing{dyeing_id =
                                                            NewId},
            calc_classes_modify(TargetClasses,
                                Sex,
                                _DyeingType,
                                Rest,
                                [NewfashionData | NewDyeing]);
        _ ->
            calc_classes_modify(TargetClasses,
                                Sex,
                                _DyeingType,
                                Rest,
                                NewDyeing)
    end;
calc_classes_modify(TargetClasses, Sex, _DyeingType = 1,
                    [FashionData = #fashion_dress{base_id = Id} | Rest],
                    NewDyeing) ->
    case
        fashion_data:get_fashion_class_modify({TargetClasses,
                                               2,
                                               Id})
        of
        NewId when is_integer(NewId) ->
            NewfashionData = FashionData#fashion_dress{base_id =
                                                           NewId},
            calc_classes_modify(TargetClasses,
                                Sex,
                                _DyeingType,
                                Rest,
                                [NewfashionData | NewDyeing]);
        _ ->
            calc_classes_modify(TargetClasses,
                                Sex,
                                _DyeingType,
                                Rest,
                                NewDyeing)
    end.

wear_batch(FashionList, Role)
    when is_list(FashionList) ->
    wear_batch(FashionList, Role, []);
wear_batch(_, _Role) -> {false, lang:get("没有可以使用的时装")}.

wear_batch([], Role, Acc) ->
    case Acc of
        [_ | _] ->
            Now = date:unixtime(),
            wear_batch_notice(Acc, Now, Role),
            NewRole = role_trigger:fire(#evt_fashion{}, Role),
            push(NewRole),
            NewRole1 = looks:calc(NewRole),
            NewRole2 = attr:calc_and_push(NewRole1),
            {ok, NewRole2};
        _ -> {false, lang:get("当前已拥有永久时装，无法增加使用时间")}
    end;
wear_batch([{BaseId, TimeId} | Rest],
           Role = #role{id = Id, name = Name}, Acc) ->
    case do_wear(BaseId, TimeId, Role) of
        {ok, {SwapDress, SwapDyeing}, WearRole} ->
            wear_batch(Rest,
                       WearRole,
                       [{BaseId, SwapDress, SwapDyeing} | Acc]);
        {false, _ERR} -> wear_batch(Rest, Role, Acc);
        _Err ->
            logger:error("时装使用错误:~w, ~ts, ~w",
                         [Id, Name, _Err],
                         fashion,
                         354),
            wear_batch(Rest, Role, Acc)
    end;
wear_batch([_H | Rest], Role, Acc) ->
    logger:error("错误的时装穿戴数据:~w", [_H], fashion, 358),
    wear_batch(Rest, Role, Acc).

wear_batch_notice([], _Now, _Role) -> ok;
wear_batch_notice([{BaseId, SwapDress, _SwapDyeing}
                   | Rest],
                  Now, Role) ->
    Msg = find_wear(BaseId, SwapDress, Now),
    notice:send(Role, 3, Msg),
    wear_batch_notice(Rest, Now, Role);
wear_batch_notice([_H | Rest], Now, Role) ->
    wear_batch_notice(Rest, Now, Role).

find_wear(BaseId, [], _Now) ->
    notice:format(lang:get("成功穿戴~ts"), [{item_2, BaseId}]);
find_wear(BaseId, [{_Type, Swap} | T], Now) ->
    case lists:keyfind(BaseId, #fashion_dress.base_id, Swap)
        of
        #fashion_dress{expire_type = 5, expire_time = Expire} ->
            Day = util:floor((Expire - Now) / 86400),
            notice:format(lang:get("获得~ts，使用期限~ts天"),
                          [{item_2, BaseId}, {string_2, 5, Day}]);
        #fashion_dress{} ->
            notice:format(lang:get("成功穿戴~ts"), [{item_2, BaseId}]);
        _ -> find_wear(BaseId, T, Now)
    end.

do_wear(BaseId, TimeId, Role) ->
    case check_wear(BaseId, Role) of
        {true, DressCfg = #fashion_dress_data{type = Type}} ->
            List = get_type_list(Type, Role),
            case fashion_data:get_time(TimeId) of
                TimeCfg = #fashion_time_data{} ->
                    case lists:keyfind(BaseId, #fashion_dress.base_id, List)
                        of
                        #fashion_dress{expire_type = 0} ->
                            {false, lang:get("您已永久拥有这件时装")};
                        _ -> swap_wear({Type, 1, DressCfg}, {TimeCfg, 0}, Role)
                    end;
                _ -> {false, lang:get("无法穿戴")}
            end;
        {false, Msg} -> {false, Msg};
        _ -> {false, lang:get("无法穿戴")}
    end.

rpc_wear({HairDyeing, HairId, ClothesDyeing, ClothesId},
         Role) ->
    List = [{2, HairDyeing, HairId},
            {3, ClothesDyeing, ClothesId}],
    put_on_fashion(List, Role).

rpc_eqm(EqmId, Role) ->
    List = [{1, EqmId}],
    put_on_fashion(List, Role).

do_rpc_wear([], Role, {SwapDress, SwapDyeing}) ->
    {ok, {SwapDress, SwapDyeing}, Role};
do_rpc_wear([{use, Type, 2, DyeingId} | T],
            Role = #role{classes = Classes, sex = Sex},
            {SwapDress, SwapDyeing}) ->
    case fashion_data:get_dyeing({DyeingId,
                                  Classes,
                                  Sex,
                                  Type})
        of
        Args = #{id := DyeingId} ->
            case swap_wear({Type, 2, Args}, {undefined, 1}, Role) of
                {ok, {AddSwapDress, AddSwapDyeing}, NewRole} ->
                    do_rpc_wear(T,
                                NewRole,
                                {AddSwapDress ++ SwapDress,
                                 AddSwapDyeing ++ SwapDyeing});
                {false, Reason} -> {false, Reason}
            end;
        _ ->
            logger:error("无法找到染色配置[~w,~w,~w,~w]",
                         [DyeingId, Classes, Sex, Type],
                         fashion,
                         435),
            {false, lang:get("无法找到染色配置")}
    end;
do_rpc_wear([{use, Type = 1, 1, BaseId} | T],
            Role = #role{}, {SwapDress, SwapDyeing}) ->
    case fashion_data:get_dress(BaseId) of
        Data = #fashion_dress_data{} ->
            case swap_wear({Type, 1, Data}, {undefined, 1}, Role) of
                {ok,
                 {AddSwapDress, AddSwapDyeing},
                 NRole = #role{m_fashion = MFashion}} ->
                    NewMFashion = MFashion#m_fashion{classes_eqm = 0},
                    NewRole = NRole#role{m_fashion = NewMFashion},
                    do_rpc_wear(T,
                                NewRole,
                                {AddSwapDress ++ SwapDress,
                                 AddSwapDyeing ++ SwapDyeing});
                {false, Reason} -> {false, Reason}
            end;
        _ -> {false, lang:get("无法找到时装配置")}
    end;
do_rpc_wear([{use, Type, 1, BaseId} | T],
            Role = #role{}, {SwapDress, SwapDyeing}) ->
    case fashion_data:get_dress(BaseId) of
        Data = #fashion_dress_data{} ->
            case swap_wear({Type, 1, Data}, {undefined, 1}, Role) of
                {ok, {AddSwapDress, AddSwapDyeing}, NewRole} ->
                    do_rpc_wear(T,
                                NewRole,
                                {AddSwapDress ++ SwapDress,
                                 AddSwapDyeing ++ SwapDyeing});
                {false, Reason} -> {false, Reason}
            end;
        _ -> {false, lang:get("无法找到时装配置")}
    end;
do_rpc_wear([{take_off, Type = 1, EqmId} | T], Role,
            {SwapDress, SwapDyeing}) ->
    DressList = get_type_list(Type, Role),
    DyeingList = get_dyeing_list(Type, Role),
    {NewDressList,
     NewDyeingList,
     AddSwapDress,
     AddSwapDyeing} =
        swap(Type, DressList, DyeingList, undefined),
    DressRole = set_type_list(Type, NewDressList, Role),
    DyeingRole = #role{m_fashion = MFashion} =
                     set_dyeing_list(Type, NewDyeingList, DressRole),
    NewRole = DyeingRole#role{m_fashion =
                                  MFashion#m_fashion{classes_eqm = EqmId}},
    do_rpc_wear(T,
                NewRole,
                {[{Type, AddSwapDress} | SwapDress],
                 [{Type, AddSwapDyeing} | SwapDyeing]});
do_rpc_wear([{take_off, Type} | T], Role,
            {SwapDress, SwapDyeing}) ->
    DressList = get_type_list(Type, Role),
    DyeingList = get_dyeing_list(Type, Role),
    {NewDressList,
     NewDyeingList,
     AddSwapDress,
     AddSwapDyeing} =
        swap(Type, DressList, DyeingList, undefined),
    DressRole = set_type_list(Type, NewDressList, Role),
    DyeingRole = set_dyeing_list(Type,
                                 NewDyeingList,
                                 DressRole),
    NewRole = DyeingRole,
    do_rpc_wear(T,
                NewRole,
                {[{Type, AddSwapDress} | SwapDress],
                 [{Type, AddSwapDyeing} | SwapDyeing]});
do_rpc_wear([_Err | T], Role,
            {SwapDress, SwapDyeing}) ->
    logger:error("无法处理的穿戴参数:~w", [_Err], fashion, 501),
    do_rpc_wear(T, Role, {SwapDress, SwapDyeing}).

check_rpc_wear([], _Mfashion, Result) -> {true, Result};
check_rpc_wear([{2, DyeId, HairId} | T],
               Mf = #m_fashion{head = Head, head_dyeing = HeadDyeing},
               Result) ->
    case {DyeId, HairId} of
        {0, 0} ->
            case lists:keyfind(1, #fashion_dress.is_wear, Head) of
                false ->
                    case lists:keyfind(1,
                                       #fashion_dyeing.is_use,
                                       HeadDyeing)
                        of
                        false -> check_rpc_wear(T, Mf, Result);
                        _ -> check_rpc_wear(T, Mf, [{take_off, 2} | Result])
                    end;
                _ -> check_rpc_wear(T, Mf, [{take_off, 2} | Result])
            end;
        {0, HairId} ->
            case lists:keyfind(HairId, #fashion_dress.base_id, Head)
                of
                #fashion_dress{is_wear = 1} ->
                    check_rpc_wear(T, Mf, Result);
                #fashion_dress{} ->
                    R = [{use, 2, 1, HairId}],
                    check_rpc_wear(T, Mf, R ++ Result);
                _ -> {false, lang:get("未购买的发型，不能使用")}
            end;
        {DyeId, _} ->
            case lists:keyfind(DyeId,
                               #fashion_dyeing.dyeing_id,
                               HeadDyeing)
                of
                #fashion_dyeing{is_use = 1} ->
                    check_rpc_wear(T, Mf, Result);
                _ ->
                    R = [{use, 2, 2, DyeId}],
                    check_rpc_wear(T, Mf, R ++ Result)
            end
    end;
check_rpc_wear([{3, DyeId, ClothesId} | T],
               Mf = #m_fashion{clothes = Clothes,
                               clothes_dyeing = ClothesDyeing},
               Result) ->
    case {DyeId, ClothesId} of
        {0, 0} ->
            case lists:keyfind(1, #fashion_dress.is_wear, Clothes)
                of
                false ->
                    case lists:keyfind(1,
                                       #fashion_dyeing.is_use,
                                       ClothesDyeing)
                        of
                        false -> check_rpc_wear(T, Mf, Result);
                        _ -> check_rpc_wear(T, Mf, [{take_off, 3} | Result])
                    end;
                _ -> check_rpc_wear(T, Mf, [{take_off, 3} | Result])
            end;
        {0, ClothesId} ->
            case lists:keyfind(ClothesId,
                               #fashion_dress.base_id,
                               Clothes)
                of
                #fashion_dress{is_wear = 1} ->
                    check_rpc_wear(T, Mf, Result);
                #fashion_dress{} ->
                    R = [{use, 3, 1, ClothesId}],
                    check_rpc_wear(T, Mf, R ++ Result);
                _ -> {false, lang:get("未购买的时装，不能使用")}
            end;
        {DyeId, _} ->
            case lists:keyfind(DyeId,
                               #fashion_dyeing.dyeing_id,
                               ClothesDyeing)
                of
                #fashion_dyeing{is_use = 1} ->
                    check_rpc_wear(T, Mf, Result);
                _ ->
                    R = [{use, 3, 2, DyeId}],
                    check_rpc_wear(T, Mf, R ++ Result)
            end
    end;
check_rpc_wear([{1, EqmId} | T],
               Mf = #m_fashion{eqm = Eqm, classes_eqm = ClassesEqm},
               Result) ->
    case EqmId of
        _ when EqmId == 1 andalso ClassesEqm == EqmId ->
            check_rpc_wear(T, Mf, Result);
        _ when EqmId == 1 ->
            case lists:keyfind(1, #fashion_dress.is_wear, Eqm) of
                false -> check_rpc_wear(T, Mf, [{use_weapon} | Result]);
                _ ->
                    check_rpc_wear(T, Mf, [{take_off, 1, EqmId} | Result])
            end;
        _ when EqmId == 0 ->
            case lists:keyfind(1, #fashion_dress.is_wear, Eqm) of
                false ->
                    check_rpc_wear(T, Mf, [{use_superweapon} | Result]);
                _ ->
                    check_rpc_wear(T, Mf, [{take_off, 1, EqmId} | Result])
            end;
        EqmId ->
            case lists:keyfind(EqmId, #fashion_dress.base_id, Eqm)
                of
                #fashion_dress{is_wear = 1} ->
                    check_rpc_wear(T, Mf, Result);
                #fashion_dress{} ->
                    R = [{use, 1, 1, EqmId}],
                    check_rpc_wear(T, Mf, R ++ Result);
                _ -> {false, lang:get("未购买的饰品，不能使用")}
            end
    end;
check_rpc_wear([{4, Belt} | T],
               Mf = #m_fashion{belt = Belts}, Result) ->
    case Belt of
        0 ->
            case lists:keyfind(1, #fashion_dress.is_wear, Belts) of
                false -> check_rpc_wear(T, Mf, Result);
                _ -> check_rpc_wear(T, Mf, [{take_off, 4} | Result])
            end;
        BeltId ->
            case lists:keyfind(BeltId,
                               #fashion_dress.base_id,
                               Belts)
                of
                #fashion_dress{is_wear = 1} ->
                    check_rpc_wear(T, Mf, Result);
                #fashion_dress{} ->
                    R = [{use, 4, 1, BeltId}],
                    check_rpc_wear(T, Mf, R ++ Result);
                _ -> {false, lang:get("未购买的饰品，不能使用")}
            end
    end;
check_rpc_wear([{6, HeadOrnament} | T],
               Mf = #m_fashion{head_ornament = HeadOrnaments},
               Result) ->
    case HeadOrnament of
        0 ->
            case lists:keyfind(1,
                               #fashion_dress.is_wear,
                               HeadOrnaments)
                of
                false -> check_rpc_wear(T, Mf, Result);
                _ -> check_rpc_wear(T, Mf, [{take_off, 6} | Result])
            end;
        HdnmtId ->
            case lists:keyfind(HdnmtId,
                               #fashion_dress.base_id,
                               HeadOrnaments)
                of
                #fashion_dress{is_wear = 1} ->
                    check_rpc_wear(T, Mf, Result);
                #fashion_dress{} ->
                    R = [{use, 6, 1, HdnmtId}],
                    check_rpc_wear(T, Mf, R ++ Result);
                _ -> {false, lang:get("未购买的饰品，不能使用")}
            end
    end;
check_rpc_wear([_Err | T], Mf, Result) ->
    logger:error("无法识别的参数:~w", [_Err], fashion, 666),
    check_rpc_wear(T, Mf, Result).

get_type_list(2,
              #role{m_fashion = #m_fashion{head = Head}}) ->
    Head;
get_type_list(3,
              #role{m_fashion = #m_fashion{clothes = Clothes}}) ->
    Clothes;
get_type_list(4,
              #role{m_fashion = #m_fashion{belt = Belt}}) ->
    Belt;
get_type_list(5,
              #role{m_fashion = #m_fashion{ring = Ring}}) ->
    Ring;
get_type_list(6,
              #role{m_fashion =
                        #m_fashion{head_ornament = HeadOrnaments}}) ->
    HeadOrnaments;
get_type_list(1,
              #role{m_fashion = #m_fashion{eqm = Eqm}}) ->
    Eqm;
get_type_list(_Type, _Role) -> [].

set_type_list(2, Head, Role = #role{m_fashion = MF}) ->
    Role#role{m_fashion = MF#m_fashion{head = Head}};
set_type_list(3, Clothes,
              Role = #role{m_fashion = MF}) ->
    Role#role{m_fashion = MF#m_fashion{clothes = Clothes}};
set_type_list(4, Belt, Role = #role{m_fashion = MF}) ->
    Role#role{m_fashion = MF#m_fashion{belt = Belt}};
set_type_list(5, Ring, Role = #role{m_fashion = MF}) ->
    Role#role{m_fashion = MF#m_fashion{ring = Ring}};
set_type_list(6, HeadOrnaments,
              Role = #role{m_fashion = MF}) ->
    Role#role{m_fashion =
                  MF#m_fashion{head_ornament = HeadOrnaments}};
set_type_list(1, Eqm, Role = #role{m_fashion = MF}) ->
    Role#role{m_fashion = MF#m_fashion{eqm = Eqm}};
set_type_list(_Type, _Unknow, Role) ->
    logger:error("未知类型[~w]", [_Type], fashion, 699),
    Role.

get_dyeing_list(2,
                #role{m_fashion =
                          #m_fashion{head_dyeing = HeadDyeing}}) ->
    HeadDyeing;
get_dyeing_list(3,
                #role{m_fashion =
                          #m_fashion{clothes_dyeing = ClothesDyeing}}) ->
    ClothesDyeing;
get_dyeing_list(_, _) -> [].

set_dyeing_list(2, HeadDyeing,
                Role = #role{m_fashion = Mf}) ->
    Role#role{m_fashion =
                  Mf#m_fashion{head_dyeing = HeadDyeing}};
set_dyeing_list(3, ClothesDyeing,
                Role = #role{m_fashion = Mf}) ->
    Role#role{m_fashion =
                  Mf#m_fashion{clothes_dyeing = ClothesDyeing}};
set_dyeing_list(_, _, Role) -> Role.

swap_wear({Type,
           2,
           #{id := DyeingId, change_loss := ChangeLoss,
             loss := Loss}},
          _TimeCfg, Role) ->
    DyeingList = get_dyeing_list(Type, Role),
    DressList = get_type_list(Type, Role),
    case lists:keytake(DyeingId,
                       #fashion_dyeing.dyeing_id,
                       DyeingList)
        of
        false ->
            {ok, NewLoss} = format:loss_to_auto_buy(Loss),
            case role_gain:do_notice(NewLoss,
                                     Role,
                                     lang:get("获得染色，"))
                of
                {ok, LossRole} ->
                    F = #fashion_dyeing{dyeing_id = DyeingId, is_use = 1},
                    {NewDressList, NewDyeingList, SwapDress, SwapDyeing} =
                        swap(Type, DressList, DyeingList, {2, F}),
                    DressRole = set_type_list(Type, NewDressList, LossRole),
                    DyeingRole = set_dyeing_list(Type,
                                                 NewDyeingList,
                                                 DressRole),
                    NewRole = DyeingRole,
                    NewRole1 = add_collect_val(NewRole, DyeingId),
                    {ok,
                     {[{Type, SwapDress}], [{Type, SwapDyeing}]},
                     NewRole1};
                {false, #loss{msg = Msg}} -> {false, Msg}
            end;
        {value, F, RestF} ->
            {ok, NewLoss} = format:loss_to_auto_buy(ChangeLoss),
            case role_gain:do_notice(NewLoss,
                                     Role,
                                     lang:get("切换染色，"))
                of
                {ok, LossRole} ->
                    NewF = F#fashion_dyeing{is_use = 1},
                    {NewDressList, NewDyeingList, SwapDress, SwapDyeing} =
                        swap(Type, DressList, RestF, {2, NewF}),
                    DressRole = set_type_list(Type, NewDressList, LossRole),
                    DyeingRole = set_dyeing_list(Type,
                                                 NewDyeingList,
                                                 DressRole),
                    NewRole = DyeingRole,
                    {ok,
                     {[{Type, SwapDress}], [{Type, SwapDyeing}]},
                     NewRole};
                {false, #loss{msg = Msg}} -> {false, Msg}
            end
    end;
swap_wear({Type,
           1,
           #fashion_dress_data{base_id = BaseId, type = Type}},
          {TimeCfg, NeedWear}, Role) ->
    DressList = get_type_list(Type, Role),
    DyeingList = get_dyeing_list(Type, Role),
    case lists:keytake(BaseId,
                       #fashion_dress.base_id,
                       DressList)
        of
        false ->
            F = #fashion_dress{base_id = BaseId,
                               is_wear = NeedWear},
            {Flag, NewF} = wear_time(TimeCfg, F),
            {NewDressList, NewDyeingList, SwapDress, SwapDyeing} =
                swap(Type, DressList, DyeingList, {1, NewF}),
            DressRole = set_type_list(Type, NewDressList, Role),
            DyeingRole = set_dyeing_list(Type,
                                         NewDyeingList,
                                         DressRole),
            NewRole = case Flag of
                          true -> set_timer(DyeingRole);
                          _ -> DyeingRole
                      end,
            NewRole1 = add_collect_val(NewRole, TimeCfg, BaseId),
            {ok,
             {[{Type, SwapDress}], [{Type, SwapDyeing}]},
             NewRole1};
        {value,
         F = #fashion_dress{expire_type = OldExpireType},
         RestF} ->
            {Flag,
             NewF = #fashion_dress{expire_type = NewExpireType}} =
                wear_time(TimeCfg, F#fashion_dress{is_wear = NeedWear}),
            case NewExpireType of
                0 when OldExpireType =/= 0 ->
                    role:link_send(Role, 13208, {BaseId}),
                    case TimeCfg of
                        #fashion_time_data{expire_type = 0} -> ok;
                        _ ->
                            Msg =
                                notice:format(lang:get("~ts期限达到~ts天，自动转换为永久{face_1,25}"),
                                              [{item_2, BaseId},
                                               {string_2,
                                                5,
                                                fashion_data:get_fashion_forever_time(BaseId)}]),
                            notice:send(Role, 3, Msg)
                    end;
                _ -> ignore
            end,
            {NewDressList, NewDyeingList, SwapDress, SwapDyeing} =
                swap(Type, RestF, DyeingList, {1, NewF}),
            DressRole = set_type_list(Type, NewDressList, Role),
            DyeingRole = set_dyeing_list(Type,
                                         NewDyeingList,
                                         DressRole),
            NewRole = case Flag of
                          true -> set_timer(DyeingRole);
                          _ -> DyeingRole
                      end,
            NewRole1 = add_collect_val(NewRole, TimeCfg, BaseId),
            {ok,
             {[{Type, SwapDress}], [{Type, SwapDyeing}]},
             NewRole1}
    end.

swap(_Type, DressList, DyeingList,
     {2, F = #fashion_dyeing{dyeing_id = DyeingId}}) ->
    {NewDressList, SwapDress} = case lists:keytake(1,
                                                   #fashion_dress.is_wear,
                                                   DressList)
                                    of
                                    false -> {DressList, []};
                                    {value, SwapF1, ResetList1} ->
                                        NewSwapF1 = SwapF1#fashion_dress{is_wear
                                                                             =
                                                                             0},
                                        {[NewSwapF1 | ResetList1], [NewSwapF1]}
                                end,
    {NewDyeingList, SwapDyeing} = case lists:keytake(1,
                                                     #fashion_dyeing.is_use,
                                                     DyeingList)
                                      of
                                      false ->
                                          DyeingList1 = lists:keystore(DyeingId,
                                                                       #fashion_dyeing.dyeing_id,
                                                                       DyeingList,
                                                                       F),
                                          {DyeingList1, [F]};
                                      {value, SwapF2, ResetList2} ->
                                          NewSwapF2 =
                                              SwapF2#fashion_dyeing{is_use = 0},
                                          DyeingList1 = [NewSwapF2
                                                         | ResetList2],
                                          DyeingList2 = lists:keystore(DyeingId,
                                                                       #fashion_dyeing.dyeing_id,
                                                                       DyeingList1,
                                                                       F),
                                          {DyeingList2, [NewSwapF2, F]}
                                  end,
    {NewDressList, NewDyeingList, SwapDress, SwapDyeing};
swap(_Type, DressList, DyeingList,
     {1,
      F = #fashion_dress{base_id = BaseId, is_wear = 0}}) ->
    NewDressList = lists:keystore(BaseId,
                                  #fashion_dress.base_id,
                                  DressList,
                                  F),
    SwapDress = [F],
    {NewDressList, DyeingList, SwapDress, []};
swap(_Type, DressList, DyeingList,
     {1, F = #fashion_dress{base_id = BaseId}}) ->
    {NewDressList, SwapDress} = case lists:keytake(1,
                                                   #fashion_dress.is_wear,
                                                   DressList)
                                    of
                                    false ->
                                        DressList1 = lists:keystore(BaseId,
                                                                    #fashion_dress.base_id,
                                                                    DressList,
                                                                    F),
                                        {DressList1, [F]};
                                    {value, SwapF1, ResetList1} ->
                                        NewSwapF1 = SwapF1#fashion_dress{is_wear
                                                                             =
                                                                             0},
                                        DressList1 = [NewSwapF1 | ResetList1],
                                        DressList2 = lists:keystore(BaseId,
                                                                    #fashion_dress.base_id,
                                                                    DressList1,
                                                                    F),
                                        {DressList2, [NewSwapF1, F]}
                                end,
    {NewDyeingList, SwapDyeing} = case lists:keytake(1,
                                                     #fashion_dyeing.is_use,
                                                     DyeingList)
                                      of
                                      false -> {DyeingList, []};
                                      {value, SwapF2, ResetList2} ->
                                          NewSwapF2 =
                                              SwapF2#fashion_dyeing{is_use = 0},
                                          {[NewSwapF2 | ResetList2],
                                           [NewSwapF2]}
                                  end,
    {NewDressList, NewDyeingList, SwapDress, SwapDyeing};
swap(_Type, DressList, DyeingList, undefined) ->
    {NewDressList, SwapDress} = case lists:keytake(1,
                                                   #fashion_dress.is_wear,
                                                   DressList)
                                    of
                                    false -> {DressList, []};
                                    {value, SwapF1, ResetList1} ->
                                        NewSwapF1 = SwapF1#fashion_dress{is_wear
                                                                             =
                                                                             0},
                                        {[NewSwapF1 | ResetList1], [NewSwapF1]}
                                end,
    {NewDyeingList, SwapDyeing} = case lists:keytake(1,
                                                     #fashion_dyeing.is_use,
                                                     DyeingList)
                                      of
                                      false -> {DyeingList, []};
                                      {value, SwapF2, ResetList2} ->
                                          NewSwapF2 =
                                              SwapF2#fashion_dyeing{is_use = 0},
                                          {[NewSwapF2 | ResetList2],
                                           [NewSwapF2]}
                                  end,
    {NewDressList, NewDyeingList, SwapDress, SwapDyeing}.

wear_time(undefined, F) -> {false, F};
wear_time(#fashion_time_data{expire_type =
                                 ExpireType = 0},
          F) ->
    {false,
     F#fashion_dress{expire_type = ExpireType,
                     expire_time = 0}};
wear_time(#fashion_time_data{expire_type = 5,
                             expire_time = CfgTime},
          F = #fashion_dress{expire_type = 5,
                             expire_time = Expire, base_id = BaseId}) ->
    Now = date:unixtime(),
    NewF = case check_forever_time(BaseId,
                                   Now,
                                   CfgTime * 60 + Expire)
               of
               true ->
                   F#fashion_dress{expire_type = 0, expire_time = 0};
               _ ->
                   F#fashion_dress{expire_time = CfgTime * 60 + Expire}
           end,
    {true, NewF};
wear_time(#fashion_time_data{expire_type =
                                 ExpireType = 5,
                             expire_time = CfgTime},
          F) ->
    Now = date:unixtime(),
    NewF = F#fashion_dress{expire_time = CfgTime * 60 + Now,
                           expire_type = ExpireType},
    {true, NewF};
wear_time(#fashion_time_data{expire_type =
                                 ExpireType = 6,
                             expire_time = CfgTime},
          F) ->
    case item:make_expire(0, 2, CfgTime) of
        {2, End} ->
            Now = date:unixtime(),
            Expire = erlang:max(1, End - Now),
            NewF = F#fashion_dress{expire_time = Expire,
                                   expire_type = ExpireType},
            {true, NewF};
        _False ->
            logger:error("错误的日期:~w", [_False], fashion, 915),
            {false, F#fashion_dress{expire_time = 1}}
    end;
wear_time(_Dress, F) ->
    logger:error("错误的配置:~w", [_Dress], fashion, 920),
    {false, F#fashion_dress{expire_time = 1}}.

check_expire_time(Role) ->
    Now = date:unixtime(),
    {Remove, ExpireRole} = check_expire_time([2,
                                              3,
                                              4,
                                              5,
                                              1,
                                              6],
                                             [],
                                             Now,
                                             Role),
    case Remove of
        [_ | _] ->
            push(ExpireRole),
            looks:update_looks(Role, ExpireRole);
        _ -> skip
    end,
    NewRole = set_timer(ExpireRole),
    {ok, NewRole}.

check_expire_time([], Remove, _Now, Role) ->
    {Remove, Role};
check_expire_time([Type | Rest], Remove, Now, Role) ->
    List = get_type_list(Type, Role),
    {NewRemove, NewRole} = check_type_expire_time(List,
                                                  Type,
                                                  Now,
                                                  Remove,
                                                  Role),
    check_expire_time(Rest, NewRemove, Now, NewRole).

check_type_expire_time([], _Type, _Now, Remove, Role) ->
    {Remove, Role};
check_type_expire_time([#fashion_dress{expire_type = 0}
                        | Rest],
                       Type, Now, Remove, Role) ->
    check_type_expire_time(Rest, Type, Now, Remove, Role);
check_type_expire_time([F = #fashion_dress{expire_time =
                                               Expire}
                        | Rest],
                       Type, Now, Remove, Role)
    when Now + 5 > Expire ->
    NewRole = do_remove(F, Type, Role),
    check_type_expire_time(Rest,
                           Type,
                           Now,
                           [F | Remove],
                           NewRole);
check_type_expire_time([_ | Rest], Type, Now, Remove,
                       Role) ->
    check_type_expire_time(Rest, Type, Now, Remove, Role).

set_timer(Role) ->
    Now = date:unixtime(),
    case sort_expire_time([2, 3, 4, 5, 1, 6], Role, Now, 0)
        of
        0 -> Role;
        MinExpire ->
            Expire = MinExpire - Now,
            NewExpire = case Expire > 0 of
                            true -> Expire;
                            _ -> 1
                        end,
            Timer = #timer{id = fashion_expire,
                           timeout = 1000 * NewExpire, m = fashion,
                           f = check_expire_time, a = []},
            role_timer:set(Timer, Role)
    end.

sort_expire_time([], _Role, _Now, MinExpire) ->
    MinExpire;
sort_expire_time([Type | Rest], Role, Now, MinExpire) ->
    List = get_type_list(Type, Role),
    List1 = [I
             || I = #fashion_dress{expire_time = ET} <- List,
                ET > 0],
    case lists:keysort(#fashion_dress.expire_time, List1) of
        [#fashion_dress{expire_time = Expire} | _]
            when MinExpire =:= 0 ->
            sort_expire_time(Rest, Role, Now, Expire);
        [#fashion_dress{expire_time = Expire} | _]
            when Expire < MinExpire ->
            sort_expire_time(Rest, Role, Now, Expire);
        _Dress -> sort_expire_time(Rest, Role, Now, MinExpire)
    end.

do_remove(#fashion_dress{is_wear = 0, base_id = BaseId},
          Type, RemoveRole) ->
    List = get_type_list(Type, RemoveRole),
    NewList = lists:keydelete(BaseId,
                              #fashion_dress.base_id,
                              List),
    set_type_list(Type, NewList, RemoveRole);
do_remove(#fashion_dress{is_wear = 1, base_id = BaseId},
          Type, RemoveRole) ->
    DelRole = looks:del(Type, RemoveRole),
    List = get_type_list(Type, DelRole),
    NewList = lists:keydelete(BaseId,
                              #fashion_dress.base_id,
                              List),
    set_type_list(Type, NewList, DelRole).

get_dress_skin(BaseId) ->
    case fashion_data:get_dress(BaseId) of
        #fashion_dress_data{texture_id = TextureId} ->
            {TextureId, BaseId};
        _ -> false
    end.

get_dyeing_skin(Type, Classes, Sex, DyeingId) ->
    case fashion_data:get_dyeing({DyeingId,
                                  Classes,
                                  Sex,
                                  Type})
        of
        #{skin_id := SkinId, model_id := ModelId} ->
            {SkinId, ModelId};
        _ -> false
    end.

check_wear(BaseId, Role) ->
    check_wear(BaseId, [can_use, sex, classes, lev], Role).

check_wear(DressCfg = #fashion_dress_data{}, Steps,
           Role) ->
    case check_wear_cond(Steps, DressCfg, Role) of
        true -> {true, DressCfg};
        {false, Msg} -> {false, Msg}
    end;
check_wear(BaseId, Steps, Role) ->
    case fashion_data:get_dress(BaseId) of
        DressCfg = #fashion_dress_data{} ->
            check_wear(DressCfg, Steps, Role);
        _Other ->
            logger:error("没有时装[BaseId:~w][~w]配置",
                         [BaseId, _Other],
                         fashion,
                         1022),
            {false, lang:get("没有发现该时装配置")}
    end.

check_wear_cond([], _Cfg, _Role) -> true;
check_wear_cond([can_use | Rest],
                Cfg = #fashion_dress_data{can_use = 1}, Role) ->
    check_wear_cond(Rest, Cfg, Role);
check_wear_cond([can_use | _Rest],
                _Cfg = #fashion_dress_data{}, _Role) ->
    {false, lang:get("该时装不能使用")};
check_wear_cond([sex | Rest],
                Cfg = #fashion_dress_data{sex = CfgSex},
                Role = #role{sex = Sex}) ->
    case CfgSex of
        2 -> check_wear_cond(Rest, Cfg, Role);
        Sex -> check_wear_cond(Rest, Cfg, Role);
        _ -> {false, lang:get("性别不符合")}
    end;
check_wear_cond([classes | Rest],
                Cfg = #fashion_dress_data{classes = CfgClasses},
                Role = #role{classes = Classes}) ->
    case CfgClasses of
        0 -> check_wear_cond(Rest, Cfg, Role);
        Classes -> check_wear_cond(Rest, Cfg, Role);
        _ -> {false, lang:get("职业不匹配")}
    end;
check_wear_cond([lev | Rest],
                Cfg = #fashion_dress_data{lev = ActvLev},
                Role = #role{lev = Lev}) ->
    case Lev >= ActvLev of
        true -> check_wear_cond(Rest, Cfg, Role);
        false -> {false, lang:get("等级不足")}
    end;
check_wear_cond(_Cond, _Cfg, _Role) ->
    {false, lang:get("未知的判定条件")}.

check_del_dress(Role = #role{name = Name, pid = Pid,
                             m_fashion =
                                 Mf = #m_fashion{head = Head,
                                                 clothes = Clothes}}) ->
    {NewHead, Gain1} = do_check_del(Name, Head, [], []),
    {NewClothes, Gain2} = do_check_del(Name,
                                       Clothes,
                                       [],
                                       []),
    Gain = merge_gain(Gain1 ++ Gain2, []),
    case Gain of
        [_ | _] ->
            role:apply(async,
                       Pid,
                       {fashion, mail_compensate, [Gain]});
        _ -> skip
    end,
    Role#role{m_fashion =
                  Mf#m_fashion{head = NewHead, clothes = NewClothes}}.

merge_gain([], Gain) -> Gain;
merge_gain([{BaseId, Bind, Num} | T], Gain) ->
    case lists:keyfind(BaseId, 1, Gain) of
        {BaseId, Bind, Val} ->
            NewGain = lists:keystore(BaseId,
                                     1,
                                     Gain,
                                     {BaseId, Bind, Val + Num}),
            merge_gain(T, NewGain);
        _ -> merge_gain(T, [{BaseId, Bind, Num} | Gain])
    end;
merge_gain([H | T], Gain) -> merge_gain(T, [H | Gain]).

mail_compensate(Role = #role{}, Gain) ->
    Title = lang:get("时装材料补偿"),
    Content =
        lang:get("好消息！时装部门近期对各职业的时装做出重大改版，考虑到大家的选择自由，现将原来所有时装消耗"
                 "材料返还，您现在可以重新选择喜爱的时装染色了！"),
    Items = Gain,
    mail:send(Role,
              #{title => Title, content => Content, items => Items}).

do_check_del(_Name, [], Dress, Gain) ->
    {lists:reverse(Dress), Gain};
do_check_del(Name,
             [H = #fashion_dress{base_id = BaseId} | T], Dress,
             Gain) ->
    case fashion_data:get_dress(BaseId) of
        #fashion_dress_data{is_origin = 1} ->
            do_check_del(Name, T, Dress, Gain);
        #fashion_dress_data{} ->
            do_check_del(Name, T, [H | Dress], Gain);
        _ ->
            case fashion_data:get_compensate(BaseId) of
                G = [_ | _] ->
                    logger:info("[~ts]删除时装[~w]",
                                [Name, BaseId],
                                fashion,
                                1094),
                    do_check_del(Name, T, Dress, G ++ Gain);
                _ ->
                    logger:error("删除[~w]时装,但是找不到补偿",
                                 [BaseId],
                                 fashion,
                                 1097),
                    do_check_del(Name, T, Dress, Gain)
            end
    end.

take_off_weapon(Role = #role{m_fashion =
                                 Mfashion = #m_fashion{eqm = Eqm}}) ->
    NewEqm = case lists:keyfind(1,
                                #fashion_dress.is_wear,
                                Eqm)
                 of
                 F = #fashion_dress{base_id = BaseId} ->
                     lists:keyreplace(BaseId,
                                      #fashion_dress.base_id,
                                      Eqm,
                                      F#fashion_dress{is_wear = 0});
                 _ -> Eqm
             end,
    NewMfashion = Mfashion#m_fashion{eqm = NewEqm,
                                     classes_eqm = 0},
    NewRole = Role#role{m_fashion = NewMfashion},
    push(NewRole),
    {ok, NewRole}.

put_on_fashion(List = [_ | _],
               Role = #role{m_fashion = Mfashion}) ->
    case check_rpc_wear(List, Mfashion, []) of
        {true, []} -> {false, lang:get("没有改变，无需保存")};
        {true, [{use_weapon}]} ->
            NewMfashion = Mfashion#m_fashion{classes_eqm = 1},
            Role2 = Role#role{m_fashion = NewMfashion},
            NewRole2 = looks:calc(Role2),
            {ok, [], NewRole2};
        {true, [{use_superweapon}]} ->
            NewMfashion = Mfashion#m_fashion{classes_eqm = 0},
            Role2 = Role#role{m_fashion = NewMfashion},
            NewRole2 = looks:calc(Role2),
            {ok, [], NewRole2};
        {true, Result = [_ | _]} ->
            case do_rpc_wear(Result, Role, {[], []}) of
                {ok, Update, NewRole} ->
                    NewRole1 = role_trigger:fire(#evt_fashion{}, NewRole),
                    NewRole2 = looks:calc(NewRole1),
                    {ok, Update, NewRole2};
                {false, Reason} -> {false, Reason}
            end;
        {false, Reason} ->
            logger:debug("穿戴时装错误：~w", [Reason], fashion, 1144),
            {false, Reason}
    end;
put_on_fashion(BaseId, Role) when is_integer(BaseId) ->
    List = case fashion_data:get_dress(BaseId) of
               #fashion_dress_data{type = Type} -> [{Type, BaseId}];
               _ -> []
           end,
    put_on_fashion(List, Role);
put_on_fashion(_, _) -> {false, lang:get("没有时装需要穿戴")}.

check_buy_Ornament({HeadOrnament,
                    HeadTimeId,
                    BeltOrnamentId,
                    BeltTimeId}) ->
    case HeadOrnament =:= 0 of
        true ->
            case BeltOrnamentId =:= 0 of
                true -> {false, lang:get("请选择需要购买的饰品")};
                false ->
                    BuyList = [{BeltOrnamentId, BeltTimeId}],
                    PutOnList = [{4, BeltOrnamentId}],
                    {true, BuyList, PutOnList}
            end;
        false ->
            case BeltOrnamentId =:= 0 of
                true ->
                    BuyList = [{HeadOrnament, HeadTimeId}],
                    PutOnList = [{6, HeadOrnament}],
                    {true, BuyList, PutOnList};
                false ->
                    BuyList = [{HeadOrnament, HeadTimeId},
                               {BeltOrnamentId, BeltTimeId}],
                    PutOnList = [{6, HeadOrnament}, {4, BeltOrnamentId}],
                    {true, BuyList, PutOnList}
            end
    end.

get_ornament_price(Ornaments) ->
    get_ornament_price(Ornaments, 0).

get_ornament_price([Ornmt | Rest], TotalPrice) ->
    case fashion_data:get_ornament_price(Ornmt) of
        Price when is_integer(Price) ->
            get_ornament_price(Rest, Price + TotalPrice);
        _ -> get_ornament_price(Rest, TotalPrice)
    end;
get_ornament_price([], TotalPrice) -> TotalPrice.

push(Role) -> push(Role, 1).

push(Role = #role{m_fashion =
                      #m_fashion{classes_eqm = ClassesEqm},
                  p_eqm = #package{items = Items}},
     Flag) ->
    {Dress, Dyeing, CollectLev, CollectVal} = get_own(Role),
    Weapon = case lists:keyfind(1, #item.pos, Items) of
                 #item{base_id = WBaseId} -> WBaseId;
                 _ -> 0
             end,
    role:link_send(Role,
                   13200,
                   {Dress,
                    Dyeing,
                    CollectLev,
                    CollectVal,
                    ClassesEqm,
                    Weapon,
                    Flag}).

get_need_wear_list(List, Role) ->
    get_need_wear_list(List, Role, []).

get_need_wear_list([], _, RetList) -> RetList;
get_need_wear_list([{BaseId, _TimeId} | Rest], Role,
                   RetList) ->
    case check_wear(BaseId, Role) of
        {true, #fashion_dress_data{type = 4}} ->
            get_need_wear_list(Rest, Role, [{4, BaseId} | RetList]);
        {true, #fashion_dress_data{type = 6}} ->
            get_need_wear_list(Rest, Role, [{6, BaseId} | RetList]);
        {true, #fashion_dress_data{type = 1}} ->
            get_need_wear_list(Rest, Role, [{1, BaseId} | RetList]);
        _ -> get_need_wear_list(Rest, Role, RetList)
    end.

add_collect_val(Role = #role{m_fashion =
                                 Mfashion = #m_fashion{collect_val = Cval}},
                DyeingId) ->
    Val = fashion_data:get_dyeing_collect_val(DyeingId),
    NewMfashion = Mfashion#m_fashion{collect_val =
                                         Cval + Val},
    case Val > 0 of
        true ->
            Msg = notice:format(lang:get("增加~ts点颜值"),
                                [{string_2, 1, Val}]),
            notice:send(Role, 3, Msg);
        _ -> ok
    end,
    Role#role{m_fashion = NewMfashion};
add_collect_val(Role, _) -> Role.

add_collect_val(Role = #role{m_fashion =
                                 Mfashion = #m_fashion{collect_val = Cval}},
                #fashion_time_data{expire_type = 0}, BaseId) ->
    Val = fashion_data:get_dress_collect_val(BaseId),
    NewMfashion = Mfashion#m_fashion{collect_val =
                                         Cval + Val},
    case Val > 0 of
        true ->
            Msg = notice:format(lang:get("增加~ts点颜值"),
                                [{string_2, 1, Val}]),
            notice:send(Role, 3, Msg);
        _ -> ok
    end,
    Role#role{m_fashion = NewMfashion};
add_collect_val(Role, _, _) -> Role.

add_mount_appearance_collect_val(Role = #role{m_fashion
                                                  =
                                                  Mfashion =
                                                      #m_fashion{collect_val =
                                                                     Cval}},
                                 Val) ->
    NewMfashion = Mfashion#m_fashion{collect_val =
                                         Cval + Val},
    case Val > 0 of
        true ->
            Msg = notice:format(lang:get("增加~ts点颜值"),
                                [{string_2, 1, Val}]),
            notice:send(Role, 3, Msg);
        _ -> ok
    end,
    NRole = Role#role{m_fashion = NewMfashion},
    push(NRole),
    NRole.

check_forerver(Role = #role{m_fashion =
                                #m_fashion{}}) ->
    TypeList = [2, 3, 4, 5, 6, 1],
    check_forerver(Role, TypeList).

check_forerver(Role, []) -> Role;
check_forerver(Role, [H | T]) ->
    NRole = check_forerver2(H, Role),
    check_forerver(NRole, T).

check_forerver2(2,
                Role = #role{m_fashion =
                                 MF = #m_fashion{head = Head}}) ->
    NHead = forever_convert(Head, []),
    NMF = MF#m_fashion{head = NHead},
    NRole = Role#role{m_fashion = NMF},
    NRole;
check_forerver2(3,
                Role = #role{m_fashion =
                                 MF = #m_fashion{clothes = Clothes}}) ->
    NClothes = forever_convert(Clothes, []),
    NMF = MF#m_fashion{clothes = NClothes},
    NRole = Role#role{m_fashion = NMF},
    NRole;
check_forerver2(4,
                Role = #role{m_fashion =
                                 MF = #m_fashion{belt = Belt}}) ->
    NBelt = forever_convert(Belt, []),
    NMF = MF#m_fashion{belt = NBelt},
    NRole = Role#role{m_fashion = NMF},
    NRole;
check_forerver2(5,
                Role = #role{m_fashion =
                                 MF = #m_fashion{ring = Ring}}) ->
    NRing = forever_convert(Ring, []),
    NMF = MF#m_fashion{ring = NRing},
    NRole = Role#role{m_fashion = NMF},
    NRole;
check_forerver2(6,
                Role = #role{m_fashion =
                                 MF = #m_fashion{head_ornament =
                                                     HeadOrnaments}}) ->
    NHO = forever_convert(HeadOrnaments, []),
    NMF = MF#m_fashion{head_ornament = NHO},
    NRole = Role#role{m_fashion = NMF},
    NRole;
check_forerver2(1,
                Role = #role{m_fashion = MF = #m_fashion{eqm = Eqm}}) ->
    NEqm = forever_convert(Eqm, []),
    NMF = MF#m_fashion{eqm = NEqm},
    NRole = Role#role{m_fashion = NMF},
    NRole;
check_forerver2(_Type, Role) -> Role.

forever_convert([], List) -> lists:reverse(List);
forever_convert([F = #fashion_dress{expire_type = 5,
                                    expire_time = Expire, base_id = BaseId}
                 | T],
                List) ->
    Now = date:unixtime(),
    NewF = case check_forever_time(BaseId, Now, Expire) of
               true ->
                   F#fashion_dress{expire_type = 0, expire_time = 0};
               _ -> F
           end,
    forever_convert(T, [NewF | List]);
forever_convert([F | T], List) ->
    forever_convert(T, [F | List]).

check_forever_time(BaseId, Now, Time) ->
    case fashion_data:get_fashion_forever_time(BaseId) of
        Day when is_integer(Day) -> Time - Now > Day * 86400;
        _ -> false
    end.

adm_show(_Role = #role{m_fashion =
                           #m_fashion{collect_lev = CollectLev,
                                      collect_val = CollectVal, head = Head,
                                      eqm = Eqm, clothes = Clothes, belt = Belt,
                                      head_dyeing = HeadDyeing,
                                      clothes_dyeing = ClothesDyeing,
                                      head_ornament = HeadOrnament}}) ->
    ShowDress = adm_show(dress,
                         Head ++ Clothes ++ Eqm ++ Belt ++ HeadOrnament,
                         []),
    ShowDyeing = adm_show(dyeing,
                          HeadDyeing ++ ClothesDyeing,
                          []),
    {ok,
     [{collect_lev, CollectLev},
      {collect_val, CollectVal},
      {dress, ShowDress},
      {dyeing, ShowDyeing}]}.

adm_show(_, [], List) -> List;
adm_show(Label = dress,
         [#fashion_dress{base_id = BaseId} | T], List) ->
    SName = case fashion_data:get_dress(BaseId) of
                #fashion_dress_data{name = Name} -> Name;
                _ -> ""
            end,
    Add = [{base_id, BaseId}, {name, SName}],
    adm_show(Label, T, [Add | List]);
adm_show(Label = dyeing,
         [#fashion_dress{base_id = BaseId} | T], List) ->
    SName = case fashion_data:get_dress(BaseId) of
                #fashion_dress_data{name = Name} -> Name;
                _ -> ""
            end,
    Add = [{base_id, BaseId}, {name, SName}],
    adm_show(Label, T, [Add | List]);
adm_show(Label, [_ | T], List) ->
    adm_show(Label, T, List).

repaire_fashion(Role = #role{id = Rid, name = Name,
                             m_fashion =
                                 #m_fashion{head = Head, clothes = Clothes,
                                            belt = Belt,
                                            head_ornament = HeadOrnament}},
                {deduction, DressList})
    when is_list(DressList) ->
    Fun = fun ({FashionId, 13}, {ORole, MsgL}) ->
                  case lists:keyfind(FashionId,
                                     #fashion_dress.base_id,
                                     Head)
                      of
                      F = #fashion_dress{} ->
                          Msg =
                              util:flist(lang:get("角色id:~w,角色名:~ts,扣除~w套装:~w"),
                                         [Rid, Name, 2, FashionId]),
                          logger:info(Msg, [], fashion, 1354),
                          {do_remove(F, 2, ORole), [Msg | MsgL]};
                      _ ->
                          case lists:keyfind(FashionId,
                                             #fashion_dress.base_id,
                                             Clothes)
                              of
                              F = #fashion_dress{} ->
                                  Msg =
                                      util:flist(lang:get("角色id:~w,角色名:~ts,扣除~w套装:~w"),
                                                 [Rid, Name, 3, FashionId]),
                                  logger:info(Msg, [], fashion, 1360),
                                  {do_remove(F, 3, ORole), [Msg | MsgL]};
                              _ ->
                                  case lists:keyfind(FashionId,
                                                     #fashion_dress.base_id,
                                                     Belt)
                                      of
                                      F = #fashion_dress{} ->
                                          Msg =
                                              util:flist(lang:get("角色id:~w,角色名:~ts,扣除~w背饰:~w"),
                                                         [Rid,
                                                          Name,
                                                          4,
                                                          FashionId]),
                                          logger:info(Msg, [], fashion, 1366),
                                          {do_remove(F, 4, ORole),
                                           [Msg | MsgL]};
                                      _ ->
                                          case lists:keyfind(FashionId,
                                                             #fashion_dress.base_id,
                                                             HeadOrnament)
                                              of
                                              F = #fashion_dress{} ->
                                                  Msg =
                                                      util:flist(lang:get("角色id:~w,角色名:~ts,扣除~w头饰:~w"),
                                                                 [Rid,
                                                                  Name,
                                                                  6,
                                                                  FashionId]),
                                                  logger:info(Msg,
                                                              [],
                                                              fashion,
                                                              1372),
                                                  {do_remove(F, 6, ORole),
                                                   [Msg | MsgL]};
                                              _ ->
                                                  Msg =
                                                      util:flist(lang:get("角色id:~w,角色名:~ts,未查到时装id:~w"),
                                                                 [Rid,
                                                                  Name,
                                                                  FashionId]),
                                                  logger:info(Msg,
                                                              [],
                                                              fashion,
                                                              1376),
                                                  {ORole, [Msg | MsgL]}
                                          end
                                  end
                          end
                  end;
              (_, Temp) -> Temp
          end,
    {NRole, MsgL} = lists:foldl(Fun, {Role, []}, DressList),
    Role2 = attr:calc_and_push(NRole),
    push(Role2),
    looks:update_looks(Role, Role2),
    {ok, MsgL, Role2};
repaire_fashion(Role = #role{id = Rid, name = Name,
                             m_fashion =
                                 #m_fashion{head = Head, clothes = Clothes,
                                            belt = Belt,
                                            head_ornament = HeadOrnament}},
                {deduction, {FashionId, 13}}) ->
    {NRole, NMsg} = case lists:keyfind(FashionId,
                                       #fashion_dress.base_id,
                                       Head)
                        of
                        F = #fashion_dress{} ->
                            Msg =
                                util:flist(lang:get("角色id:~w,角色名:~ts,扣除~w套装:~w"),
                                           [Rid, Name, 2, FashionId]),
                            logger:info(Msg, [], fashion, 1393),
                            {do_remove(F, 2, Role), Msg};
                        _ ->
                            case lists:keyfind(FashionId,
                                               #fashion_dress.base_id,
                                               Clothes)
                                of
                                F = #fashion_dress{} ->
                                    Msg =
                                        util:flist(lang:get("角色id:~w,角色名:~ts,扣除~w套装:~w"),
                                                   [Rid, Name, 3, FashionId]),
                                    logger:info(Msg, [], fashion, 1399),
                                    {do_remove(F, 3, Role), Msg};
                                _ ->
                                    case lists:keyfind(FashionId,
                                                       #fashion_dress.base_id,
                                                       Belt)
                                        of
                                        F = #fashion_dress{} ->
                                            Msg =
                                                util:flist(lang:get("角色id:~w,角色名:~ts,扣除~w背饰:~w"),
                                                           [Rid,
                                                            Name,
                                                            4,
                                                            FashionId]),
                                            logger:info(Msg, [], fashion, 1405),
                                            {do_remove(F, 4, Role), Msg};
                                        _ ->
                                            case lists:keyfind(FashionId,
                                                               #fashion_dress.base_id,
                                                               HeadOrnament)
                                                of
                                                F = #fashion_dress{} ->
                                                    Msg =
                                                        util:flist(lang:get("角色id:~w,角色名:~ts,扣除~w头饰:~w"),
                                                                   [Rid,
                                                                    Name,
                                                                    6,
                                                                    FashionId]),
                                                    logger:info(Msg,
                                                                [],
                                                                fashion,
                                                                1411),
                                                    {do_remove(F, 6, Role),
                                                     Msg};
                                                _ ->
                                                    Msg =
                                                        util:flist(lang:get("角色id:~w,角色名:~ts,未查到时装id:~w"),
                                                                   [Rid,
                                                                    Name,
                                                                    FashionId]),
                                                    logger:info(Msg,
                                                                [],
                                                                fashion,
                                                                1415),
                                                    {Role, Msg}
                                            end
                                    end
                            end
                    end,
    Role2 = attr:calc_and_push(NRole),
    push(Role2),
    looks:update_looks(Role, Role2),
    {ok, [NMsg], Role2};
repaire_fashion(_Role, _Msg) ->
    logger:error("无法识别的参数:~w", [_Msg], fashion, 1426),
    {ok,
     util:flist(lang:get("未执行fashion:repaire_fashion,~w"),
                [_Msg]),
     _Role}.

gm_set(Role = #role{m_fashion = Mf}, Lev, Val) ->
    NMf = Mf#m_fashion{collect_lev = Lev,
                       collect_val = Val},
    NRole = Role#role{m_fashion = NMf},
    push(NRole),
    {ok, NRole}.

