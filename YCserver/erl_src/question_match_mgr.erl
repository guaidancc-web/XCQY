-file("src/mod/question_match/question_match_mgr.erl",
      1).

-module(question_match_mgr).

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

-file("src/mod/question_match/question_match_mgr.erl",
      10).

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

-file("src/mod/question_match/question_match_mgr.erl",
      11).

-file("inc/question_match.hrl", 1).

-record(question_match_role,
        {ver = 1,
         id = {0, "", 0},
         name = "",
         lev = 0,
         classes = 0,
         sex = 0,
         looks = [],
         break_times = 0,
         fc = 0,
         right_count = 0,
         score = 0,
         choose = 1,
         answer_time = 0,
         rank = 0,
         his_items = [],
         map_id = 0,
         is_join = 0,
         lasted_right = 0}).

-record(question_match_zone,
        {map_id = 0, map_pid = 0, role_count = 0}).

-file("src/mod/question_match/question_match_mgr.erl",
      12).

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

-file("src/mod/question_match/question_match_mgr.erl",
      13).

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

-file("src/mod/question_match/question_match_mgr.erl",
      14).

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

-file("src/mod/question_match/question_match_mgr.erl",
      15).

-file("inc/examination.hrl", 1).

-record(m_examination,
        {ver = 1,
         question = 0 :: non_neg_integer(),
         started = 0 :: non_neg_integer(),
         expire = 0 :: non_neg_integer(),
         subject = 0 :: non_neg_integer(),
         next_subject = 0 :: non_neg_integer(),
         next_subjects = [],
         finish_ids = [],
         right_num = 0 :: non_neg_integer(),
         answered = 0 :: non_neg_integer(),
         successive_right = 0 :: non_neg_integer(),
         questions = [] :: list(),
         dynamics = [] :: list()}).

-record(examination_testee,
        {id = {0, "", 0},
         name = "" :: string(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         score = 0 :: non_neg_integer(),
         elapsed = 0 :: non_neg_integer(),
         pid :: undefined | pid(),
         coin = 0 :: non_neg_integer(),
         exp = 0 :: non_neg_integer(),
         pet_exp = 0 :: non_neg_integer()}).

-record(examination_role,
        {ver = 0,
         id = {0, "", 0},
         name = "" :: string(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         score = 0 :: non_neg_integer(),
         elapsed = 0 :: non_neg_integer(),
         rank = 0 :: non_neg_integer(),
         certified = 0 :: 0 | 1,
         results = []}).

-record(examination_question,
        {id = 0 :: non_neg_integer(),
         type = 0 :: non_neg_integer(),
         desc = "" :: string(),
         answer = 0 :: non_neg_integer(),
         options = [] :: list()}).

-record(examination_taker,
        {ver = 0,
         id = {0, "", 0},
         name = "" :: string(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         score = 0 :: non_neg_integer(),
         last_answered = 0 :: non_neg_integer(),
         double_used = 0 :: non_neg_integer(),
         eased = 0 :: non_neg_integer(),
         peeked = 0 :: non_neg_integer(),
         coin = 0 :: non_neg_integer(),
         exp = 0 :: non_neg_integer(),
         pet_exp = 0 :: non_neg_integer(),
         right_num = 0 :: non_neg_integer(),
         answered = 0 :: non_neg_integer()}).

-record(examination_answer,
        {id = {0, "", 0},
         name = "" :: string(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         choice = 0 :: 0..4,
         result = 0 :: 0 | 1,
         time = 0 :: non_neg_integer()}).

-file("src/mod/question_match/question_match_mgr.erl",
      16).

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

-file("src/mod/question_match/question_match_mgr.erl",
      17).

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

-file("src/mod/question_match/question_match_mgr.erl",
      18).

-behaviour(gen_fsm).

-export([init/1,
         handle_event/3,
         handle_sync_event/4,
         handle_info/3,
         terminate/3,
         code_change/4]).

-export([info/1,
         call/1,
         cast/1,
         start_link/0,
         next/0,
         stop/0]).

-export([idle/2,
         sign/2,
         prepare/2,
         answer/2,
         show/2,
         last_round/2,
         over/2,
         clean/2]).

-record(state,
        {ts,
         timeout = 0,
         zones = [],
         role_list = [],
         cross_type = 0,
         round = 1,
         question_list = [],
         question_id = 0,
         end_time = 0}).

info(Msg) -> question_match_mgr ! Msg.

cast(Msg) ->
    gen_fsm:send_all_state_event(question_match_mgr, Msg).

call(Msg) ->
    try
        gen_fsm:sync_send_all_state_event(question_match_mgr,
                                          Msg)
    catch
        _Type:_Reason -> {error, timeout}
    end.

next() ->
    gen_fsm:send_event(question_match_mgr, timeout).

stop() -> cast(stop).

start_link() ->
    gen_fsm:start_link({local, question_match_mgr},
                       question_match_mgr,
                       [],
                       []).

init([]) ->
    logger:info("question_match_mgr开始启动...",
                [],
                question_match_mgr,
                84),
    process_flag(trap_exit, true),
    ets:new(ets_question_match_role,
            [set,
             named_table,
             public,
             {keypos, #question_match_role.id}]),
    ets:new(ets_question_match_rank,
            [set, named_table, public, {keypos, 1}]),
    {StateName, TimeOut} = get_state(),
    logger:info("下一个状态~w",
                [{StateName, TimeOut}],
                question_match_mgr,
                92),
    State = #state{ts = date:now2(), timeout = TimeOut},
    CrossType = case env:get(is_center) of
                    true -> 1;
                    _ -> 0
                end,
    NewState = State#state{cross_type = CrossType},
    logger:info("question_match_mgr启动完成",
                [],
                question_match_mgr,
                99),
    {ok, StateName, NewState, TimeOut}.

handle_event(stop, _StateName, _State) ->
    {StateName, TimeOut} = get_state(),
    CrossType = case env:get(is_center) of
                    true -> 1;
                    _ -> 0
                end,
    NewState = #state{ts = now(), timeout = TimeOut,
                      cross_type = CrossType},
    continue(StateName, NewState);
handle_event({question_match_info, RoleId}, StateName,
             State) ->
    case lookup_match_role(RoleId) of
        {ok, Qmr = #question_match_role{}} ->
            logger:debug("=======同步数据",
                         [],
                         question_match_mgr,
                         115),
            role:pack_send(RoleId, 20107, {Qmr});
        _ -> ok
    end,
    continue(StateName, State);
handle_event({push_rank, RoleId}, StateName, State) ->
    logger:debug("========:~w",
                 [RoleId],
                 question_match_mgr,
                 122),
    case ets:lookup(ets_question_match_rank,
                    question_match_rank_list)
        of
        [{_, RankList}] ->
            ShowList = lists:sublist(RankList, 10),
            logger:debug("=======:~w",
                         [ShowList],
                         question_match_mgr,
                         126),
            role:pack_send(RoleId, 20106, {ShowList});
        _ -> role:pack_send(RoleId, 20106, {[]})
    end,
    continue(StateName, State);
handle_event({push_match_status, RoleId}, StateName,
             State) ->
    logger:debug("=======同步数据",
                 [],
                 question_match_mgr,
                 136),
    sync_join_data(StateName, State, RoleId),
    continue(StateName, State);
handle_event({push_status, RoleId}, StateName,
             State = #state{end_time = EndTime}) ->
    case StateName of
        idle -> role:pack_send(RoleId, 20100, {0, 0});
        sign ->
            SignEndTime = calc_end_time(State),
            role:pack_send(RoleId, 20100, {1, SignEndTime});
        _ -> role:pack_send(RoleId, 20100, {2, EndTime})
    end,
    continue(StateName, State);
handle_event({exit_succ, RoleId}, StateName,
             State = #state{zones = Zones}) ->
    case lookup_match_role(RoleId) of
        {ok, EtsMatchRole = #question_match_role{}} ->
            UpdateMatchRole =
                EtsMatchRole#question_match_role{is_join = 0},
            update_match_role(UpdateMatchRole),
            ok;
        _ -> ok
    end,
    NewState = case lookup_match_role(RoleId) of
                   {ok, #question_match_role{map_id = MapId}} ->
                       NewZones = zone_map_role_exit(Zones, MapId),
                       State#state{zones = NewZones};
                   _ -> State
               end,
    continue(StateName, NewState);
handle_event({join_succ,
              MatchRole = #question_match_role{id = Id, name = Name,
                                               lev = Lev, classes = Classes,
                                               sex = Sex,
                                               break_times = BreakTimes,
                                               fc = Fc,
                                               answer_time = AnswerTime,
                                               map_id = MapId, choose = Choose,
                                               looks = Looks}},
             StateName, State = #state{zones = Zones}) ->
    case lookup_match_role(Id) of
        {ok, EtsMatchRole = #question_match_role{}} ->
            UpdateMatchRole = EtsMatchRole#question_match_role{lev =
                                                                   Lev,
                                                               name = Name,
                                                               classes =
                                                                   Classes,
                                                               sex = Sex,
                                                               break_times =
                                                                   BreakTimes,
                                                               fc = Fc,
                                                               answer_time =
                                                                   AnswerTime,
                                                               map_id = MapId,
                                                               is_join = 1,
                                                               choose = Choose,
                                                               looks = Looks},
            update_match_role(UpdateMatchRole),
            ok;
        _ ->
            update_match_role(MatchRole#question_match_role{is_join
                                                                = 1}),
            ok
    end,
    NewZones = zone_map_role_join(Zones, MapId),
    NewState = State#state{zones = NewZones},
    continue(StateName, NewState);
handle_event({push_rank_info, RoleId}, StateName,
             State) ->
    Reply = case ets:lookup(ets_question_match_rank,
                            question_match_rank_list)
                of
                [{_, RankList}] -> RankList;
                _ -> []
            end,
    logger:debug("=========:~w",
                 [Reply],
                 question_match_mgr,
                 195),
    role:pack_send(RoleId, 20109, {Reply}),
    continue(StateName, State);
handle_event({update_rank, show}, StateName, State) ->
    Fun = fun (Qmr = #question_match_role{is_join = 1},
               Rtn) ->
                  [Qmr | Rtn];
              (_, Rtn) -> Rtn
          end,
    SortsList = ets:foldl(Fun, [], ets_question_match_role),
    RankList =
        lists:sublist(util:keys_sort([#question_match_role.fc,
                                      #question_match_role.score],
                                     SortsList),
                      20),
    SetNumRankList = update_rank_num(RankList, 1, 20, []),
    ets:insert(ets_question_match_rank,
               {question_match_rank_list, SetNumRankList}),
    SyncRankList = lists:sublist(SetNumRankList, 10),
    ets:foldl(fun sync_status2role/2,
              {20106, {SyncRankList}},
              ets_question_match_role),
    continue(StateName, State);
handle_event({update_rank, rank_final}, StateName,
             State = #state{cross_type = CrossType}) ->
    Fun = fun (Qmr = #question_match_role{is_join = 1},
               Rtn) ->
                  [Qmr | Rtn];
              (_, Rtn) -> Rtn
          end,
    SortsList = ets:foldl(Fun, [], ets_question_match_role),
    RankList =
        lists:sublist(util:keys_sort([#question_match_role.fc,
                                      #question_match_role.score],
                                     SortsList),
                      20),
    SetNumRankList = update_rank_num(RankList, 1, 20, []),
    ets:insert(ets_question_match_rank,
               {question_match_rank_list, SetNumRankList}),
    send_rank_reward(SetNumRankList),
    HonorFun = fun (#question_match_role{id =
                                             RoleId = {_, P, Z}},
                    _) ->
                       role_trigger:async_fire(RoleId,
                                               #evt_question_match_mvp{}),
                       case CrossType of
                           1 ->
                               cross:cast(P,
                                          Z,
                                          honor_mgr,
                                          add,
                                          [question_match_honor,
                                           [{RoleId, 11115}],
                                           date:unixtime() + 86400]);
                           _ ->
                               honor_mgr:add(question_match_honor,
                                             [{RoleId, 11115}],
                                             date:unixtime() + 86400)
                       end
               end,
    case lists:sublist(RankList, 3) of
        HonorList = [_ | _] ->
            MemberNum = length(HonorList),
            MemberNames = string:join(lists:duplicate(MemberNum,
                                                      "~ts"),
                                      "、"),
            Fmt1 =
                notice:format(lang:get("~ts结束了{face_1,7}恭喜~ts斩获前3名，获得~ts称号奖励{face_1,3}"),
                              [{string_2, 1, lang:get("小猪快跳")},
                               {string_1, MemberNames},
                               {string_2, 3, lang:get("跳跃吧！智者猪")}]),
            NamesStr = [{role_2, RoleName}
                        || #question_match_role{name = RoleName} <- HonorList],
            NoticeNames = notice:format(Fmt1, NamesStr),
            handle_cross_fun(CrossType,
                             notice,
                             cast,
                             [all, 5, NoticeNames]),
            lists:foldl(HonorFun, ok, HonorList);
        _ -> ok
    end,
    ets:foldl(fun sync_status2role/2,
              {20109, {SetNumRankList}},
              ets_question_match_role),
    continue(StateName, State);
handle_event(_Event, StateName, State) ->
    logger:info("小猪快跳收到未知协议:~w",
                [_Event],
                question_match_mgr,
                258),
    continue(StateName, State).

handle_sync_event(apply_trans_map, _From, idle,
                  State) ->
    Reply = {false, lang:get("活动未开启")},
    continue(idle, Reply, State);
handle_sync_event(apply_trans_map, _From, StateName,
                  State = #state{zones = Zones}) ->
    Platform = env:get(platform),
    ZoneId = env:get(zone_id),
    {Choose, {NX, NY}} = util:rand_list([{1,
                                          util:rand_list([{1150, 740},
                                                          {1000, 760},
                                                          {960, 660},
                                                          {1110, 600},
                                                          {900, 630},
                                                          {930, 600}])},
                                         {2,
                                          util:rand_list([{1480, 720},
                                                          {1420, 780},
                                                          {1570, 760},
                                                          {1410, 600},
                                                          {1530, 660},
                                                          {1530, 580}])}]),
    {Reply, NewState} = case query_zone_info(Zones,
                                             {-1, -1})
                            of
                            {-1, -1} ->
                                case map_mgr:create(53001) of
                                    {ok, MapPid, MapId} ->
                                        unit_mgr:create({51, 66017},
                                                        66017,
                                                        {MapId, 1142, 667}),
                                        unit_mgr:create({51, 66018},
                                                        66018,
                                                        {MapId, 1390, 680}),
                                        ZoneInfo = #question_match_zone{map_pid
                                                                            =
                                                                            MapPid,
                                                                        map_id =
                                                                            MapId},
                                        NewZones = [ZoneInfo | Zones],
                                        ZonesState = State#state{zones =
                                                                     NewZones},
                                        {{ok,
                                          Platform,
                                          ZoneId,
                                          MapId,
                                          NX,
                                          NY,
                                          Choose},
                                         ZonesState};
                                    _ -> {{false, lang:get("进入答题失败")}, State}
                                end;
                            {MapId, _Count} ->
                                {{ok, Platform, ZoneId, MapId, NX, NY, Choose},
                                 State};
                            [] -> {{false, lang:get("进入答题失败")}, State}
                        end,
    continue(StateName, Reply, NewState);
handle_sync_event({choose_answer, RoleId, Choose},
                  _From, StateName, State) ->
    logger:debug("玩家:~w答题:~w",
                 [RoleId, Choose],
                 question_match_mgr,
                 291),
    Reply = case lookup_match_role(RoleId) of
                {ok,
                 #question_match_role{is_join = 1, choose = Choose}} ->
                    ok;
                {ok, QMR = #question_match_role{is_join = 1}} ->
                    Now = date:unixtime(),
                    NewQMR = QMR#question_match_role{choose = Choose,
                                                     answer_time = Now},
                    update_match_role(NewQMR),
                    case is_rank_show_role(RoleId) of
                        true ->
                            logger:debug("同步排行选择", [], question_match_mgr, 303),
                            Data = {RoleId, Choose},
                            ets:foldl(fun sync_status2role/2,
                                      {20108, Data},
                                      ets_question_match_role);
                        _ -> ok
                    end,
                    ok;
                _ -> {false, lang:get("答题失败，没有作答记录")}
            end,
    continue(StateName, Reply, State);
handle_sync_event(_Event, _From, StateName, State) ->
    logger:info("收到未处理的协议:~w",
                [_Event],
                question_match_mgr,
                316),
    Reply = ok,
    continue(StateName, Reply, State).

handle_info(_Info, StateName, State) ->
    continue(StateName, State).

terminate(_Reason, _StateName, _State) -> ok.

code_change(_OldVsn, StateName, State, _Extra) ->
    {ok, StateName, State}.

continue(StateName,
         State = #state{timeout = infinity}) ->
    {next_state, StateName, State, infinity};
continue(StateName,
         State = #state{ts = Ts, timeout = Tidle}) ->
    {next_state,
     StateName,
     State,
     util:time_left(Tidle, Ts)}.

continue(Reply, StateName,
         State = #state{timeout = infinity}) ->
    {reply, Reply, StateName, State, infinity};
continue(StateName, Reply,
         State = #state{ts = Ts, timeout = Tidle}) ->
    {reply,
     Reply,
     StateName,
     State,
     util:time_left(Tidle, Ts)}.

get_state() ->
    case agenda:get_state_timeout(2054, 0) of
        {idle, TimeOut} -> {idle, TimeOut * 1000};
        _ ->
            Now = date:unixtime(),
            case agenda_data:get(2054) of
                Cfg = #{starttime := Start} ->
                    case Cfg of
                        #{args := []} ->
                            {idle, date:next_diff(Start, Now) * 1000};
                        #{args := WeekDays1} ->
                            {idle,
                             date:week_next_diff(WeekDays1, Now, Start) * 1000};
                        _ -> {idle, date:next_diff(Start, Now) * 1000}
                    end;
                _ -> {idle, infinity}
            end
    end.

idle(timeout, State = #state{cross_type = CrossType}) ->
    logger:debug("进入准备阶段", [], question_match_mgr, 367),
    Notice =
        notice:format(lang:get("激动人心的~ts将在5分钟后开始{face_1,1}赶快来展现您的智慧吧{face_1,25}"),
                      [{string_2, 1, lang:get("小猪快跳")}]),
    notice:cast(all, 5, Notice),
    EndTime = date:unixtime() + 965,
    handle_cross_fun(CrossType,
                     honor_mgr,
                     clear,
                     [question_match_honor]),
    NewState = State#state{ts = now(), timeout = 300000,
                           end_time = EndTime, round = 1, question_list = [],
                           question_id = 0},
    SignEndTime = calc_end_time(NewState),
    role_group:pack_send(world, 20100, {1, SignEndTime}),
    continue(sign, NewState).

sign(timeout, State = #state{end_time = EndTime}) ->
    logger:debug("开始答题", [], question_match_mgr, 391),
    Notice =
        notice:format(lang:get("~ts活动正式开始{face_1,38}看谁会变~ts{face_1,10}"),
                      [{string_2, 1, lang:get("小猪快跳")},
                       {string_2, 5, lang:get("小猪")}]),
    notice:cast(all, 5, Notice),
    role_group:pack_send(world, 20100, {2, EndTime}),
    QuestionList = case question_data:question_match_list()
                       of
                       QL = [_ | _] -> util:rand_list_n(QL, 20);
                       _ ->
                           logger:error("题库题目数目不足",
                                        [],
                                        question_match_mgr,
                                        402),
                           []
                   end,
    logger:debug("题库:~w",
                 [QuestionList],
                 question_match_mgr,
                 405),
    NewState = State#state{ts = now(), timeout = 10000,
                           question_list = QuestionList},
    sync_match_status(NewState, 2),
    continue(prepare, NewState).

prepare(timeout,
        State = #state{round = Round,
                       question_list = QuestionList}) ->
    TimeState = State#state{ts = now(), timeout = 20000},
    NewState = case catch lists:nth(Round, QuestionList) of
                   QuestionId when is_integer(QuestionId) ->
                       logger:debug("下发题目：~w",
                                    [QuestionId],
                                    question_match_mgr,
                                    425),
                       TimeState#state{question_id = QuestionId};
                   _ ->
                       logger:error("随机题库问题：~w, 不足：~w",
                                    [QuestionList, Round],
                                    question_match_mgr,
                                    428),
                       TimeState
               end,
    sync_match_status(NewState, 3),
    continue(answer, NewState).

answer(timeout,
       State = #state{question_id = _QuestionId}) ->
    logger:debug("公示答案，正确答案是：~w",
                 [question_data:get_match_answer(_QuestionId)],
                 question_match_mgr,
                 437),
    NewState = State#state{ts = now(), timeout = 5000},
    calc_answer_score(State),
    sync_match_status(NewState, 4),
    continue(show, NewState).

show(timeout,
     State = #state{round = Round,
                    question_list = QuestionList}) ->
    {StateName, TimeOut} = case is_end_round(Round) of
                               false -> {prepare, 5000};
                               true -> {last_round, 5000}
                           end,
    NewState = case StateName of
                   prepare ->
                       cast({update_rank, show}),
                       NextRound = Round + 1,
                       NewQuestionId = lists:nth(NextRound, QuestionList),
                       PrepareState = State#state{ts = now(),
                                                  timeout = TimeOut},
                       sync_match_status(PrepareState, 2),
                       PrepareState#state{round = NextRound,
                                          question_id = NewQuestionId};
                   last_round ->
                       fire_trigger(),
                       LastRoundState = State#state{ts = now(),
                                                    timeout = TimeOut},
                       sync_match_status(LastRoundState, 5),
                       LastRoundState
               end,
    continue(StateName, NewState).

last_round(timeout, State = #state{}) ->
    cast({update_rank, rank_final}),
    NewState = State#state{ts = now(), timeout = 60000},
    sync_match_status(NewState, 6),
    continue(over, NewState).

over(timeout, State = #state{cross_type = CrossType}) ->
    logger:debug("活动结束", [], question_match_mgr, 487),
    Fun = fun (#question_match_role{id = RoleId,
                                    is_join = 1},
               _) ->
                  role:apply(async,
                             RoleId,
                             {question_match_role, apply_exit, []}),
                  ok;
              (_, _) -> ok
          end,
    ets:foldl(Fun, ok, ets_question_match_role),
    sync_to_examination_role(CrossType),
    role_group:pack_send(world, 20100, {0, 0}),
    NewState = State#state{ts = now(), timeout = 60000},
    continue(clean, NewState).

clean(timeout, State = #state{zones = Zones}) ->
    [map:stop(MapPid)
     || #question_match_zone{map_pid = MapPid} <- Zones,
        is_pid(MapPid)],
    {StateName, TimeOut} = get_state(),
    ets:delete_all_objects(ets_question_match_role),
    ets:delete_all_objects(ets_question_match_rank),
    NewState = State#state{ts = now(), timeout = TimeOut,
                           round = 0, zones = [], question_id = 0,
                           question_list = []},
    continue(StateName, NewState).

lookup_match_role(RoleId) ->
    case ets:lookup(ets_question_match_role, RoleId) of
        [MR = #question_match_role{}] -> {ok, MR};
        _ -> false
    end.

update_match_role(MR) ->
    ets:insert(ets_question_match_role, MR),
    ok.

query_zone_info([], {MapId, Count}) -> {MapId, Count};
query_zone_info([#question_match_zone{role_count =
                                          RoleCount,
                                      map_id = MapId}
                 | Rest],
                {_MapId, Count})
    when RoleCount < 50 ->
    case RoleCount < Count orelse Count =:= -1 of
        true -> query_zone_info(Rest, {MapId, RoleCount});
        false -> query_zone_info(Rest, {_MapId, Count})
    end;
query_zone_info([_ | Rest], {MapId, Count}) ->
    query_zone_info(Rest, {MapId, Count}).

zone_map_role_exit(Zones, MapId) ->
    case lists:keyfind(MapId,
                       #question_match_zone.map_id,
                       Zones)
        of
        Qmz = #question_match_zone{role_count = RoleCnt} ->
            NewQmz = Qmz#question_match_zone{role_count =
                                                 max(RoleCnt - 1, 0)},
            lists:keystore(MapId,
                           #question_match_zone.map_id,
                           Zones,
                           NewQmz);
        _ -> Zones
    end.

zone_map_role_join(Zones, MapId) ->
    case lists:keyfind(MapId,
                       #question_match_zone.map_id,
                       Zones)
        of
        Qmz = #question_match_zone{role_count = RoleCnt} ->
            NewQmz = Qmz#question_match_zone{role_count =
                                                 RoleCnt + 1},
            lists:keystore(MapId,
                           #question_match_zone.map_id,
                           Zones,
                           NewQmz);
        _ -> Zones
    end.

sync_match_status(#state{timeout = infinity}, _) -> ok;
sync_match_status(State = #state{round = Round}, 2) ->
    EndTime = calc_end_time(State),
    Data = {2, EndTime, Round, 0, 0},
    logger:debug("同步状态:~w",
                 [Data],
                 question_match_mgr,
                 567),
    ets:foldl(fun sync_status2role/2,
              {20101, Data},
              ets_question_match_role);
sync_match_status(State = #state{round = Round,
                                 question_id = QuestionId},
                  3) ->
    EndTime = calc_end_time(State),
    Data = {3, EndTime, Round, QuestionId, 0},
    logger:debug("同步状态:~w",
                 [Data],
                 question_match_mgr,
                 572),
    ets:foldl(fun sync_status2role/2,
              {20101, Data},
              ets_question_match_role);
sync_match_status(State = #state{round = Round,
                                 question_id = QuestionId},
                  4) ->
    EndTime = calc_end_time(State),
    Answer = case question_data:get_match_answer(QuestionId)
                 of
                 _Answer when is_integer(_Answer) -> _Answer;
                 _ ->
                     logger:error("配置获取答案错误:~w",
                                  [QuestionId],
                                  question_match_mgr,
                                  579),
                     1
             end,
    Data = {4, EndTime, Round, QuestionId, Answer},
    logger:debug("同步状态:~w",
                 [Data],
                 question_match_mgr,
                 583),
    ets:foldl(fun sync_status2role/2,
              {20101, Data},
              ets_question_match_role);
sync_match_status(State = #state{round = Round}, 5) ->
    EndTime = calc_end_time(State),
    Data = {5, EndTime, Round, 0, 0},
    logger:debug("同步状态:~w",
                 [Data],
                 question_match_mgr,
                 588),
    ets:foldl(fun sync_status2role/2,
              {20101, Data},
              ets_question_match_role);
sync_match_status(State = #state{round = Round}, 6) ->
    EndTime = calc_end_time(State),
    Data = {6, EndTime, Round, 0, 0},
    logger:debug("同步状态:~w",
                 [Data],
                 question_match_mgr,
                 593),
    ets:foldl(fun sync_status2role/2,
              {20101, Data},
              ets_question_match_role);
sync_match_status(_, _) -> ok.

sync_status2role(#question_match_role{is_join = 1,
                                      id = RoleId},
                 {Code, Data}) ->
    role:pack_send(RoleId, Code, Data),
    {Code, Data};
sync_status2role(_, CodeData) -> CodeData.

calc_end_time(#state{ts = Ts, timeout = TimeOut}) ->
    LeftTime = util:time_left(TimeOut, Ts) div 1000,
    Now = date:unixtime(),
    logger:debug("现在时间：~w, 剩余时间:~w",
                 [Now, LeftTime],
                 question_match_mgr,
                 607),
    Now + LeftTime.

is_end_round(Round) -> Round =:= 20.

calc_answer_score(#state{question_id = QuestionId,
                         cross_type = CrossType}) ->
    Now = date:unixtime(),
    RighterAnswer =
        question_data:get_match_answer(QuestionId),
    Fun = fun (Qmr = #question_match_role{id = RoleId,
                                          name = RoleName, is_join = 1,
                                          choose = Choose,
                                          answer_time = AnswerTime,
                                          score = Score,
                                          right_count = RightCount,
                                          lasted_right = LastedRight},
               Rtn) ->
                  NewQmr = case Choose =:= RighterAnswer of
                               true ->
                                   AddScore = calc_right_score(min(20000 div
                                                                       1000,
                                                                   Now -
                                                                       AnswerTime)),
                                   NewLastedRight = LastedRight rem 20 + 1,
                                   ScoreQmr = Qmr#question_match_role{score =
                                                                          Score
                                                                              +
                                                                              AddScore,
                                                                      right_count
                                                                          =
                                                                          RightCount
                                                                              +
                                                                              1,
                                                                      lasted_right
                                                                          =
                                                                          LastedRight
                                                                              +
                                                                              1},
                                   case NewLastedRight of
                                       10 ->
                                           Evt =
                                               #evt_question_match_last_right{count
                                                                                  =
                                                                                  15},
                                           role_trigger:async_fire(RoleId, Evt);
                                       20 ->
                                           Evt =
                                               #evt_question_match_last_right{count
                                                                                  =
                                                                                  20},
                                           role_trigger:async_fire(RoleId, Evt),
                                           Msg =
                                               notice:format(lang:get("~ts在~ts活动中连续答对20题，智商碾压众生{face_1, 29}"),
                                                             [{role_2,
                                                               RoleName},
                                                              {string_2,
                                                               1,
                                                               lang:get("小猪快跳")}]),
                                           handle_cross_fun(CrossType,
                                                            notice,
                                                            cast,
                                                            [all, 5, Msg]);
                                       _ -> ok
                                   end,
                                   calc_item_reward(ScoreQmr, 1, AddScore);
                               false ->
                                   AddScore = 3,
                                   ScoreQmr = Qmr#question_match_role{score =
                                                                          Score
                                                                              +
                                                                              AddScore,
                                                                      lasted_right
                                                                          = 0},
                                   calc_item_reward(ScoreQmr, 0, AddScore)
                           end,
                  role:pack_send(RoleId, 20107, {NewQmr}),
                  [NewQmr | Rtn];
              (_, Rtn) -> Rtn
          end,
    UpdateMatchRoles = ets:foldl(Fun,
                                 [],
                                 ets_question_match_role),
    update_match_role(UpdateMatchRoles).

calc_item_reward(Qmr = #question_match_role{id = RoleId,
                                            lev = Lev, classes = Classes,
                                            his_items = HisItems},
                 IsRight, AddScore) ->
    Rewards = case question_match_data:get_reward(IsRight)
                  of
                  {0, ExpMod} ->
                      case levup_data:get_exp({ExpMod, Lev}) of
                          #{exp := Exp} -> [{90010, Exp}];
                          _ -> []
                      end;
                  {DropId, ExpMod} ->
                      ExpReward = case levup_data:get_exp({ExpMod, Lev}) of
                                      #{exp := Exp} -> [{90010, Exp}];
                                      _ -> []
                                  end,
                      DropReward = case drop:produce(DropId, Classes, Lev) of
                                       {true,
                                        _RuleType,
                                        SuperGain,
                                        NormalGain} ->
                                           Gain = SuperGain ++ NormalGain,
                                           format:gain_to_val(Gain);
                                       null -> [];
                                       {false, Reason} ->
                                           logger:error("智多星生成掉落~w失败:~w",
                                                        [DropId, Reason],
                                                        question_match_mgr,
                                                        673),
                                           []
                                   end,
                      ExpReward ++ DropReward;
                  _ -> []
              end,
    role:apply(async,
               RoleId,
               {question_match_role,
                apply_answer_reward,
                [IsRight, Rewards, AddScore]}),
    NewHisItems = format:merge_val(Rewards, HisItems),
    Qmr#question_match_role{his_items = NewHisItems}.

update_rank_num([], _Rank, _MaxRank, NewRankList) ->
    lists:reverse(NewRankList);
update_rank_num(_, Rank, MaxRank, NewRankList)
    when Rank > MaxRank ->
    lists:reverse(NewRankList);
update_rank_num([Qmr = #question_match_role{} | Rest],
                Rank, MaxRank, NewRankList) ->
    NewQmr = case Rank of
                 1 -> Qmr#question_match_role{rank = Rank};
                 _ -> Qmr#question_match_role{rank = Rank, looks = []}
             end,
    update_rank_num(Rest,
                    Rank + 1,
                    MaxRank,
                    [NewQmr | NewRankList]);
update_rank_num([_ | Rest], Rank, MaxRank,
                NewRankList) ->
    update_rank_num(Rest, Rank, MaxRank, NewRankList).

send_rank_reward([]) -> ok;
send_rank_reward([#question_match_role{id = RoleId,
                                       rank = Rank}
                  | Rest]) ->
    case question_match_data:get_rank_reward(Rank) of
        #{item_list := ItemReward, title := Title,
          content := Content} ->
            UnbindRewards = [{Assets, 0, Val}
                             || {Assets, Val} <- ItemReward],
            case UnbindRewards of
                [_ | _] ->
                    mail:send(RoleId, Title, Content, UnbindRewards);
                _ -> ok
            end,
            send_rank_reward(Rest);
        false -> send_rank_reward(Rest)
    end.

change_to_examination_role([], ExaminationRoles) ->
    ExaminationRoles;
change_to_examination_role([#question_match_role{id =
                                                     Id,
                                                 name = Name, lev = Lev,
                                                 classes = Classes, sex = Sex,
                                                 score = Score}
                            | Rest],
                           ExaminationRoles) ->
    ER = #examination_role{id = Id, name = Name, lev = Lev,
                           classes = Classes, sex = Sex, score = Score},
    change_to_examination_role(Rest,
                               [ER | ExaminationRoles]).

sync_join_data(prepare, State = #state{round = Round},
               RoleId) ->
    EndTime = calc_end_time(State),
    Data = {2, EndTime, Round, 0, 0},
    role:pack_send(RoleId, 20101, Data);
sync_join_data(answer,
               State = #state{round = Round, question_id = QuestionId},
               RoleId) ->
    EndTime = calc_end_time(State),
    Data = {3, EndTime, Round, QuestionId, 0},
    role:pack_send(RoleId, 20101, Data);
sync_join_data(show,
               State = #state{round = Round, question_id = QuestionId},
               RoleId) ->
    EndTime = calc_end_time(State),
    Answer = case question_data:get_match_answer(QuestionId)
                 of
                 _Answer when is_integer(_Answer) -> _Answer;
                 _ ->
                     logger:error("配置获取答案错误:~w",
                                  [QuestionId],
                                  question_match_mgr,
                                  730),
                     1
             end,
    Data = {4, EndTime, Round, QuestionId, Answer},
    role:pack_send(RoleId, 20101, Data);
sync_join_data(over, State = #state{round = Round},
               RoleId) ->
    EndTime = calc_end_time(State),
    Data = {2, EndTime, Round, 0, 0},
    role:pack_send(RoleId, 20101, Data);
sync_join_data(_, _, _RoleId) -> ok.

sync_to_examination_role(0) ->
    UpdateMatchRoles =
        ets:tab2list(ets_question_match_role),
    ExaminationRoles =
        change_to_examination_role(UpdateMatchRoles, []),
    logger:debug("同步到智力闯关：~w",
                 [ExaminationRoles],
                 question_match_mgr,
                 745),
    gen_fsm:send_all_state_event(examination,
                                 {question_match_result, ExaminationRoles});
sync_to_examination_role(1) ->
    GroupFun = fun (#question_match_role{id =
                                             Id = {_, P, Z},
                                         name = Name, lev = Lev,
                                         classes = Classes, sex = Sex,
                                         score = Score},
                    Rtn) ->
                       ER = #examination_role{id = Id, name = Name, lev = Lev,
                                              classes = Classes, sex = Sex,
                                              score = Score},
                       Key = {P, Z},
                       case lists:keyfind(Key, 1, Rtn) of
                           {_, ErList} ->
                               lists:keystore(Key,
                                              1,
                                              Rtn,
                                              {Key, [ER | ErList]});
                           _ -> [{Key, [ER]} | Rtn]
                       end;
                   (_, Rtn) -> Rtn
               end,
    PzExaminationRoles = ets:foldl(GroupFun,
                                   [],
                                   ets_question_match_role),
    SyncFun = fun ({{Plat, ZoneId}, MatchResult}) ->
                      cross:cast(Plat,
                                 ZoneId,
                                 gen_fsm,
                                 send_all_state_event,
                                 [examination,
                                  {question_match_result, MatchResult}])
              end,
    lists:map(SyncFun, PzExaminationRoles);
sync_to_examination_role(_) -> ok.

is_rank_show_role(RoleId) ->
    case ets:lookup(ets_question_match_rank,
                    question_match_rank_list)
        of
        [{_, RankList}] ->
            case lists:keyfind(RoleId,
                               #question_match_role.id,
                               RankList)
                of
                #question_match_role{rank = Rank} when Rank =< 10 ->
                    true;
                _ -> false
            end;
        _ -> false
    end.

fire_trigger() ->
    Fun = fun (#question_match_role{id = RoleId,
                                    is_join = 1, score = Score},
               _) ->
                  role_trigger:async_fire(RoleId,
                                          #evt_question_match{score = Score}),
                  ok;
              (_, _) -> ok
          end,
    ets:foldl(Fun, ok, ets_question_match_role).

calc_right_score(CostTime) ->
    TimeScore = case CostTime of
                    _ when CostTime >= 16 -> 3;
                    _ when CostTime >= 11 andalso CostTime =< 15 -> 2;
                    _ -> 1
                end,
    3 + TimeScore.

handle_cross_fun(CrossType, Mod, Fun, Args) ->
    case CrossType of
        1 -> cross:cast(all, Mod, Fun, Args);
        _ -> apply(Mod, Fun, Args)
    end.

