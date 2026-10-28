-file("src/mod/pray/pray.erl", 1).

-module(pray).

-export([init/2,
         push/2,
         reset_five/2,
         up_pray/1,
         levup_data/3,
         get_pray_reward/1,
         config_check/0,
         refresh_buff/1]).

-file("inc/pray.hrl", 1).

-record(m_pray,
        {ver = 0 :: pos_integer(),
         day_best = 1 :: non_neg_integer(),
         free_rf_count = 0 :: non_neg_integer(),
         pay_rf_count = 0 :: non_neg_integer(),
         pray_result = [1, 0] :: list(),
         rewards = [] :: list(),
         is_receive = 0 :: 0..1,
         buff = 0 :: non_neg_integer()}).

-file("src/mod/pray/pray.erl", 20).

-file("inc/link.hrl", 1).

-record(link,
        {socket :: undefined | port(),
         conn_pid :: undefined | pid(),
         ip = {0, 0, 0, 0} :: {0..255, 0..255, 0..255, 0..255},
         port = 0 :: non_neg_integer(),
         lag = 0 :: non_neg_integer()}).

-file("src/mod/pray/pray.erl", 21).

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

-file("src/mod/pray/pray.erl", 22).

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

-file("src/mod/pray/pray.erl", 23).

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

-file("src/mod/pray/pray.erl", 24).

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

-file("src/mod/pray/pray.erl", 25).

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

-file("src/mod/pray/pray.erl", 26).

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

-file("src/mod/pray/pray.erl", 27).

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

-file("src/mod/pray/pray.erl", 28).

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

-file("src/mod/pray/pray.erl", 29).

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

-file("src/mod/pray/pray.erl", 30).

-file("inc/skill_life.hrl", 1).

-record(m_skill_life, {ver = 2, skills = []}).

-record(skill_life, {id = 0, lev = 0, exp = 0}).

-file("src/mod/pray/pray.erl", 31).

init(RoleClasses, Level) when Level >= 40 ->
    case produce_items_and_buff(RoleClasses, Level, 1, [])
        of
        {true, ItemRewards, BuffId} ->
            #m_pray{rewards = ItemRewards, buff = BuffId};
        {false, _Reason} -> #m_pray{};
        _Err ->
            logger:error("pray init failed, the error info is:~w",
                         [_Err],
                         pray,
                         44),
            #m_pray{}
    end;
init(_RoleClasses, _Level) -> #m_pray{}.

reset_five(Role = #role{classes = Classes, lev = Level},
           _OldRole)
    when Level >= 40 ->
    NewRole = Role#role{m_pray = init(Classes, Level)},
    push(NewRole, 15900),
    {ok, NewRole};
reset_five(_Role, _OldRole) -> {ok, _Role}.

levup_data(Role = #role{classes = RoleClasses}, OldLev,
           NewLevel)
    when OldLev < 40 andalso NewLevel >= 40 ->
    logger:debug("role Level up  OldLev: ~w, NewLevel "
                 ":~w",
                 [OldLev, NewLevel],
                 pray,
                 62),
    PrayData = init(RoleClasses, NewLevel),
    NewRole = Role#role{m_pray = PrayData},
    push(NewRole, 15900),
    NewRole;
levup_data(Role, _OldLev, _NewLevel) -> Role.

up_pray(#role{m_pray =
                  #m_pray{is_receive = ReceiveTimes}})
    when ReceiveTimes >= 1 ->
    logger:debug("已经领取过奖励不能进行提升", [], pray, 74),
    {false, lang:get("您已经领取过奖励，不需要进行提升了")};
up_pray(Role = #role{m_pray =
                         #m_pray{free_rf_count = Free_rf_cnt,
                                 pay_rf_count = PayRFCount}}) ->
    case 1 =< Free_rf_cnt of
        true ->
            Result = case pray_data:get_cost(PayRFCount + 1) of
                         {GainLabel, Cost} ->
                             {true, [#loss{label = GainLabel, val = Cost}]};
                         false -> false
                     end,
            case Result of
                {true, Loss1} ->
                    case role_gain:do_notice(Loss1, Role) of
                        {ok, LossRole} -> refresh_pray(LossRole, 2);
                        {false, #loss{label = gold}} ->
                            {false, lang:get("钻石不足，无法进行提升")};
                        {false, #loss{label = gold_bind}} ->
                            {false, lang:get("购买失败，金币不足")};
                        {false, #loss{label = coin}} ->
                            {false, lang:get("购买失败，银币不足")};
                        _Err ->
                            logger:error("每日运势提升失败[~w]", [_Err], pray, 101),
                            {false, lang:get("资产不足,提示运势失败")}
                    end;
                _Err1 ->
                    logger:error("运势升级费用ganin loss失败:[~w]",
                                 [_Err1],
                                 pray,
                                 105),
                    {false, lang:get("当前不能进行每日运势提升")}
            end;
        false -> refresh_pray(Role, 1)
    end.

get_pray_reward(#role{m_pray =
                          #m_pray{is_receive = IsReceive}})
    when IsReceive >= 1 ->
    logger:debug("已经领取过奖励不能再次领取", [], pray, 118),
    {false, lang:get("已经领取过奖励")};
get_pray_reward(Role = #role{name = RoleName,
                             m_pray =
                                 #m_pray{rewards = RewardsInfo,
                                         buff = BuffId}}) ->
    Gain = format:val_to_gain(RewardsInfo),
    case role_gain:do_notice(Gain, Role) of
        {false, G} -> {false, G#gain.msg};
        {ok, NewRole} ->
            case buff:add_and_calc(NewRole, [BuffId]) of
                {ok,
                 CalcRole = #role{m_pray =
                                      Pray1 = #m_pray{is_receive =
                                                          ReceiveTimes}}} ->
                    check_item_notice(NewRole, RewardsInfo),
                    Hearsay = case pray_data:get_pray_buff(BuffId) of
                                  #{is_hearsay := IsHearsay} ->
                                      {true, IsHearsay};
                                  _ -> false
                              end,
                    {BuffName, Desc} = case buff_data:get(BuffId) of
                                           #buff_base{name = BuffName1,
                                                      desc = Desc1} ->
                                               {BuffName1, Desc1};
                                           false -> {lang:get("无名buff"), 0}
                                       end,
                    case Hearsay of
                        {true, IsHearsay1} when IsHearsay1 =:= 1 ->
                            Format = lang:get("~ts~ts惊人，竟然获得了~ts"),
                            Msg = notice:format(Format,
                                                [{string_2, 2, RoleName},
                                                 {string_2,
                                                  1,
                                                  lang:get("今日运势")},
                                                 {string_2,
                                                  5,
                                                  util:flist("[~ts]",
                                                             [BuffName])}]),
                            notice:cast(all, 4, Msg),
                            ok;
                        _ -> ok
                    end,
                    RewardRole = CalcRole#role{m_pray =
                                                   Pray1#m_pray{is_receive =
                                                                    ReceiveTimes
                                                                        + 1}},
                    RewardBuffMsg = notice:format(lang:get("领取~ts成功, ~ts"),
                                                  [{string_2,
                                                    5,
                                                    util:flist("[~ts]",
                                                               [BuffName])},
                                                   {string_1, Desc}]),
                    FireRole = role_trigger:fire(#evt_pray{}, RewardRole),
                    notice:pop(FireRole, 2, RewardBuffMsg),
                    notice:send(FireRole, 7, RewardBuffMsg),
                    {ok, RewardBuffMsg, FireRole};
                _ -> {false, lang:get("添加buff失败")}
            end
    end.

refresh_buff(Role = #role{m_pray =
                              PrayData = #m_pray{day_best = PrayId,
                                                 free_rf_count = FreeRFCount,
                                                 pay_rf_count = PayRFCount,
                                                 buff = CurBuff}})
    when FreeRFCount >= 1 ->
    Result = case pray_data:get_cost(PayRFCount + 1) of
                 {GainLabel, Cost} ->
                     {true, [#loss{label = GainLabel, val = Cost}]};
                 false -> false
             end,
    case Result of
        false -> Role;
        {true, Loss} ->
            case role_gain:do_notice(Loss, Role) of
                {ok, LossRole} ->
                    IgnoreBuffList1 = get_ignore_list(Role),
                    IgnoreBuffList = [CurBuff | IgnoreBuffList1],
                    case rand_buff_id(PrayId, IgnoreBuffList) of
                        {true, BuffId} ->
                            BuffName = case buff_data:get(BuffId) of
                                           #buff_base{name = Name} -> Name;
                                           _ -> lang:get("无名BUFF")
                                       end,
                            Msg = notice:format("成功刷新至~ts{face_1,18}",
                                                [{string_2,
                                                  5,
                                                  util:flist("[~ts]",
                                                             [BuffName])}]),
                            {ok,
                             Msg,
                             LossRole#role{m_pray =
                                               PrayData#m_pray{buff = BuffId,
                                                               pay_rf_count =
                                                                   PayRFCount +
                                                                       1}}};
                        {false, Reason} -> {false, Reason}
                    end;
                {false, #loss{label = gold}} ->
                    {false, lang:get("钻石不足，无法进行提升")};
                {false, #loss{label = gold_bind}} ->
                    {false, lang:get("购买失败，金币不足")};
                {false, #loss{label = coin}} ->
                    {false, lang:get("购买失败，银币不足")};
                _Err ->
                    logger:error("每日运势提升失败[~w]", [_Err], pray, 196),
                    {false, lang:get("资产不足,提示运势失败")}
            end
    end;
refresh_buff(_Role) ->
    logger:debug("目前不能进行刷新，请先使用免费次数", [], pray, 201),
    {false, lang:get("目前不能进行刷新，请先使用免费次数")}.

push(#role{lev = Level, link = Link, m_pray = Pray},
     Cmd = 15900)
    when Level >= 40 ->
    logger:debug("role query pray data...~w",
                 [Pray],
                 pray,
                 207),
    role:link_send(Link, Cmd, {Pray}),
    ok;
push(_Role, _Cmd) -> ok.

get_item_ration_list(RoleClasses, Level, PrayId) ->
    case pray_data:get_item_reward(PrayId) of
        ItmeRewardsList = [_ | _] ->
            get_item_rewards(ItmeRewardsList, RoleClasses, Level);
        [] -> []
    end.

get_item_rewards(ItmeRewardsList, RoleClasses, Level) ->
    get_item_rewards(ItmeRewardsList,
                     [],
                     RoleClasses,
                     Level).

get_item_rewards([], RationList, _RoleClasses,
                 _Level) ->
    RationList;
get_item_rewards([#{item_id := ItemId, is_bind := Bind,
                    count := Count, ratio := Ratio, classes := Classes,
                    level_limit := NeedLevel}
                  | L],
                 RationList, RoleClasses, Level)
    when (Classes =:= 0 orelse Classes =:= RoleClasses)
             andalso Level >= NeedLevel ->
    get_item_rewards(L,
                     [{ItemId, Bind, Count, Ratio} | RationList],
                     Classes,
                     Level);
get_item_rewards([_ | T], RationList, Classes, Level) ->
    get_item_rewards(T, RationList, Classes, Level).

get_buff_ration_list(PrayId, IgnoreBuffList) ->
    BuffList = pray_data:list_buff(),
    BuffList1 = BuffList -- IgnoreBuffList,
    get_buff_ration_list(BuffList1, [], PrayId).

get_buff_ration_list([], List, _) -> List;
get_buff_ration_list([BuffId | T], List, PrayId) ->
    case pray_data:get_pray_buff(BuffId) of
        #{buff_lv := BuffLv, ratio := Ratio}
            when BuffLv =:= PrayId ->
            get_buff_ration_list(T,
                                 [{Ratio, BuffId} | List],
                                 PrayId);
        _ -> get_buff_ration_list(T, List, PrayId)
    end.

refresh_pray(Role = #role{m_pray =
                              #m_pray{day_best = DayBest}},
             UpType) ->
    case check_up_success(DayBest) of
        true -> produce_pray_reward(Role, DayBest + 1, UpType);
        false -> produce_pray_reward(Role, DayBest, UpType)
    end.

check_up_success(PrayId) ->
    case is_max_pray(PrayId) of
        true -> false;
        {false, UpRation} ->
            case util:rand(0, 1000) < UpRation of
                true -> true;
                false -> false
            end;
        _ -> false
    end.

is_max_pray(PrayId) ->
    case pray_data:get(PrayId + 1) of
        {none, _} -> true;
        #{upratio := UpRation} -> {false, UpRation};
        _ -> false
    end.

produce_pray_reward(Role = #role{name = RoleName,
                                 classes = Classes, lev = Level,
                                 m_pray =
                                     PrayData = #m_pray{day_best = DayBest,
                                                        free_rf_count =
                                                            FreeRFCount,
                                                        pay_rf_count =
                                                            PayRFCount,
                                                        pray_result =
                                                            ResultList}},
                    PrayId, UpType) ->
    DayBestPray = max(PrayId, DayBest),
    NewResultList = case PrayId >= DayBest of
                        true -> [PrayId, DayBest];
                        false -> ResultList
                    end,
    IsSuccess = PrayId > DayBest,
    IgnoreBuffList = get_ignore_list(Role),
    logger:debug("由于未达到指定条件，提升时以下buff~w不会出现在随机列表",
                 [IgnoreBuffList],
                 pray,
                 308),
    case PrayId =:= 5 of
        true ->
            MaxLevelPrayMsg =
                notice:format(lang:get("洪福齐天,~ts在~ts里运势惊人，竟转出了5阶星辰运势{face_1,31}"),
                              [{role_2, RoleName},
                               {string_2, 1, lang:get("[每日祝福]")}]),
            notice:cast(all, 4, MaxLevelPrayMsg);
        false -> ok
    end,
    case produce_items_and_buff(Classes,
                                Level,
                                DayBestPray,
                                IgnoreBuffList)
        of
        {true, ItemRewards, BuffId} ->
            case UpType of
                1 ->
                    case PrayId =< DayBest of
                        true ->
                            NewRole = Role#role{m_pray =
                                                    PrayData#m_pray{day_best =
                                                                        DayBestPray,
                                                                    free_rf_count
                                                                        =
                                                                        FreeRFCount
                                                                            + 1,
                                                                    pray_result
                                                                        =
                                                                        NewResultList,
                                                                    rewards =
                                                                        ItemRewards,
                                                                    buff =
                                                                        BuffId}},
                            {true,
                             result_txt(DayBestPray, BuffId, IsSuccess),
                             NewRole};
                        false ->
                            NewRole = Role#role{m_pray =
                                                    PrayData#m_pray{day_best =
                                                                        DayBestPray,
                                                                    pray_result
                                                                        =
                                                                        NewResultList,
                                                                    rewards =
                                                                        ItemRewards,
                                                                    buff =
                                                                        BuffId}},
                            {true,
                             result_txt(DayBestPray, BuffId, IsSuccess),
                             NewRole}
                    end;
                2 ->
                    NewRole = Role#role{m_pray =
                                            PrayData#m_pray{day_best =
                                                                DayBestPray,
                                                            pay_rf_count =
                                                                PayRFCount + 1,
                                                            pray_result =
                                                                NewResultList,
                                                            rewards =
                                                                ItemRewards,
                                                            buff = BuffId}},
                    {true,
                     result_txt(DayBestPray, BuffId, IsSuccess),
                     NewRole}
            end;
        {false, Reason} -> {false, Reason};
        _Err ->
            logger:error("生成每日运势道具奖励错误:~w", [_Err], pray, 338),
            #m_pray{}
    end.

result_txt(Pray, BuffId, IsSuccess) ->
    PrayName = case pray_data:get(Pray) of
                   #{name := PrayName1} -> PrayName1;
                   _ -> lang:get("无名运势")
               end,
    case IsSuccess of
        true ->
            notice:format(lang:get("提升至[~ts],额外获得了~ts次提升机会{face_1, 9}"),
                          [{string_2, 5, PrayName},
                           {string_2, 5, lang:get("1")}]);
        false ->
            case buff_data:get(BuffId) of
                #buff_base{name = BuffName} ->
                    notice:format(lang:get("获得[~ts]祝福,领取即可生效,祝你有美好的一天{face_1, 3}"),
                                  [{string_2, 5, BuffName}]);
                _ ->
                    notice:format(lang:get("获得[~ts]祝福,领取即可生效,祝你有美好的一天{face_1, 3}"),
                                  [{string_2, 5, lang:get("无名BUFF")}])
            end
    end.

produce_items_and_buff(RoleClasses, Level, PrayId,
                       IgnoreBuffList) ->
    {MinN1, MaxN1} = case pray_data:get(PrayId) of
                         #{min_cnt := MinN, max_cnt := MaxN} -> {MinN, MaxN};
                         _ -> {1, 1}
                     end,
    ItemCount = util:rand(MinN1, MaxN1),
    case get_item_ration_list(RoleClasses, Level, PrayId) of
        RationList when is_list(RationList) ->
            case util:rand_list_n(RationList, 4, ItemCount) of
                ItemRewardsInfo when is_list(ItemRewardsInfo) ->
                    case get_buff_ration_list(PrayId, IgnoreBuffList) of
                        BuffRandList = [_ | _] ->
                            case util:rand_list(BuffRandList, 1) of
                                {_Ration, BuffId} ->
                                    Rewards = [{ItemId, Bind, Count}
                                               || {ItemId, Bind, Count, _}
                                                      <- ItemRewardsInfo],
                                    {true, Rewards, BuffId};
                                _Err -> {false, lang:get("获取buff失败")}
                            end;
                        {false, Reason} -> {false, Reason};
                        _Err -> {false, lang:get("获取buff列表错误")}
                    end;
                _ ->
                    logger:error("获取物品随机列表失败", [], pray, 391),
                    {false, lang:get("获取物品随机列表失败")}
            end;
        _Err ->
            logger:error("物品列表错误~w", [_Err], pray, 395),
            {false, lang:get("物品列表错误")}
    end.

check_item_notice(_Role, []) -> ok;
check_item_notice(NewRole = #role{name = RoleName,
                                  m_pray = #m_pray{day_best = PrayLv}},
                  [{ItemId, _B, Count} | Rest]) ->
    case pray_data:get_item_info({PrayLv, ItemId}) of
        #{is_hearsay := IsHearsay} when IsHearsay =:= 1 ->
            ItemHearsayMsg =
                notice:format(lang:get("喜从天降，~ts在[~ts]中幸运的获得~ts{face_1,20}"),
                              [{role_2, RoleName},
                               {string_2, 1, lang:get("每日祝福")},
                               {item_2, ItemId, Count}]),
            notice:cast(all, 4, ItemHearsayMsg);
        _ -> check_item_notice(NewRole, Rest)
    end.

config_check() ->
    buff_check(pray_data:list_buff()),
    item_check().

buff_check([BuffId | Rest]) ->
    case buff_data:get(BuffId) of
        #buff_base{} -> ok;
        false ->
            logger:error("运势表配置的BUFF:~w在buff_data未找到,玩家将领取此buff不成功",
                         [BuffId],
                         pray,
                         423)
    end,
    buff_check(Rest);
buff_check([]) -> ok.

item_check() ->
    PrayList = lists:seq(1, 5),
    item_check(PrayList).

item_check([PrayId | Rest]) ->
    case pray_data:get_item_reward(PrayId) of
        ItemRewardList when is_list(ItemRewardList) ->
            reward_item_check(ItemRewardList);
        _Err ->
            logger:error("运势等级~w获取道具奖励配置失败,错误~w",
                         [PrayId, _Err],
                         pray,
                         437)
    end,
    item_check(Rest);
item_check([]) -> ok.

reward_item_check([#{item_id := ItemId} | Rest]) ->
    case item_data:get(ItemId) of
        #item_base{} -> ok;
        false ->
            logger:error("运势奖励道具~w在item_data里面查询不到",
                         [ItemId],
                         pray,
                         448)
    end,
    reward_item_check(Rest);
reward_item_check([]) -> ok.

get_ignore_list(Role) ->
    ClassesIgnoreBuffList = case var:get_var(Role,
                                             day,
                                             14,
                                             0)
                                of
                                ClassesCount when ClassesCount >= 20 ->
                                    [12010, 12011];
                                _ -> []
                            end,
    ChainIgnoreBuffList = case var:get_var(Role,
                                           week_five,
                                           206,
                                           0)
                              of
                              ChainCount when ChainCount >= 40 ->
                                  [12090, 12091];
                              _ -> []
                          end,
    IgnoreBuffList3 = get_skill_life_ignore_list(Role,
                                                 [{10005, [12211]},
                                                  {10006, [12201]},
                                                  {10000, [12181]}],
                                                 []),
    ClassesIgnoreBuffList ++
        ChainIgnoreBuffList ++ IgnoreBuffList3.

get_skill_life_ignore_list(_Role, [],
                           SkillIgnoreList) ->
    SkillIgnoreList;
get_skill_life_ignore_list(Role = #role{m_skill_life =
                                            #m_skill_life{skills = Skills}},
                           [{SkillId, IgnoreList} | Rest], SkillIgnoreList) ->
    case lists:keyfind(SkillId, #skill_life.id, Skills) of
        #skill_life{lev = Lev} when Lev < 30 ->
            logger:debug("~w生活技能不足30级,BUFF~w不会出现在祝福列表",
                         [SkillId, IgnoreList],
                         pray,
                         476),
            get_skill_life_ignore_list(Role,
                                       Rest,
                                       IgnoreList ++ SkillIgnoreList);
        _ ->
            get_skill_life_ignore_list(Role, Rest, SkillIgnoreList)
    end;
get_skill_life_ignore_list(Role, [_Bad | Rest],
                           SkillIgnoreList) ->
    get_skill_life_ignore_list(Role, Rest, SkillIgnoreList).

rand_buff_id(PrayId, IgnoreBuffList) ->
    case get_buff_ration_list(PrayId, IgnoreBuffList) of
        BuffRandList = [_ | _] ->
            case util:rand_list(BuffRandList, 1) of
                {_Ration, BuffId} -> {true, BuffId};
                _Err -> {false, lang:get("获取buff失败")}
            end;
        {false, Reason} -> {false, Reason};
        _Err -> {false, lang:get("获取buff列表错误")}
    end.

