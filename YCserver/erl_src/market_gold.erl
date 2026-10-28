-file("src/mod/market/market_gold.erl", 1).

-module(market_gold).

-behaviour(gen_server).

-export([get_items/2,
         get_items/3,
         buy/3,
         auto_buy/3,
         query_market_price/1,
         auto_buy_market_price/3,
         reload/0,
         sold/3,
         start_link/0,
         exchange_gold/2,
         exchange_gold/3,
         push_change_items/2,
         change_margin/3,
         fill_item_price/1,
         query_fill_price/1,
         role_market_init/0,
         push_12420/1,
         role_reset/2,
         get_item_init_price/1,
         get_price/1]).

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

-file("src/mod/market/market_gold.erl", 43).

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

-file("src/mod/market/market_gold.erl", 44).

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

-file("src/mod/market/market_gold.erl", 45).

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

-file("src/mod/market/market_gold.erl", 46).

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

-file("src/mod/market/market_gold.erl", 47).

-file("inc/link.hrl", 1).

-record(link,
        {socket :: undefined | port(),
         conn_pid :: undefined | pid(),
         ip = {0, 0, 0, 0} :: {0..255, 0..255, 0..255, 0..255},
         port = 0 :: non_neg_integer(),
         lag = 0 :: non_neg_integer()}).

-file("src/mod/market/market_gold.erl", 48).

-file("inc/log.hrl", 1).

-file("src/mod/market/market_gold.erl", 49).

-file("inc/package.hrl", 1).

-record(package,
        {type = 1 :: integer(),
         next_id = 1 :: pos_integer(),
         volume = 0 :: non_neg_integer(),
         free_cell = [] :: list(),
         items = [] :: [tuple()]}).

-file("src/mod/market/market_gold.erl", 50).

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

-file("src/mod/market/market_gold.erl", 51).

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

-file("src/mod/market/market_gold.erl", 52).

-file("inc/market_gold.hrl", 1).

-record(m_market_gold, {ver = 1, limit_data = []}).

-record(market_gold_item_data,
        {id :: undefined | pos_integer(),
         base_id :: undefined | pos_integer(),
         catalg_1 :: undefined | pos_integer(),
         catalg_2 :: undefined | pos_integer(),
         init_price :: undefined | non_neg_integer(),
         init_stock :: undefined | non_neg_integer(),
         world_lev :: undefined | non_neg_integer(),
         max_price :: undefined | non_neg_integer(),
         min_price :: undefined | non_neg_integer(),
         is_exchange :: undefined | 0 | 1,
         day_limit :: undefined | non_neg_integer(),
         classes :: undefined | non_neg_integer(),
         up_ratio :: undefined | non_neg_integer(),
         down_ratio :: undefined | non_neg_integer()}).

-record(market_gold_item,
        {id :: undefined | pos_integer(),
         base_id = 0 :: pos_integer(),
         stock = 0 :: non_neg_integer(),
         init_stock = 0 :: non_neg_integer(),
         init_price = 0 :: non_neg_integer(),
         def_price = 0 :: non_neg_integer(),
         cur_price = 0 :: non_neg_integer(),
         margin = 1000 :: non_neg_integer(),
         margin_acc = 1000 :: non_neg_integer(),
         day_sold = 0 :: non_neg_integer(),
         day_buy = 0 :: non_neg_integer(),
         ver = 1 :: non_neg_integer()}).

-record(market_gold_change_item,
        {base_id = 0 :: pos_integer(),
         got_list = [] :: list(),
         catalg_1 = 0 :: pos_integer(),
         catalg_2 = 0 :: pos_integer()}).

-record(market_gold_price,
        {base_id = 0,
         margin_type = 0,
         init_price = 0,
         buy_price = 0,
         margin = 0}).

-record(market_gold_limit_data,
        {id = 0,
         min = 0,
         max = 0,
         num = 0,
         is_show = 0,
         type = 0}).

-file("src/mod/market/market_gold.erl", 53).

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

-file("src/mod/market/market_gold.erl", 54).

-record(state,
        {reset_timer, platform = "", zone_id = -1}).

-record(calc_sold_price,
        {type = 1,
         price = 0,
         discount = 0,
         exchange_base_id = 0,
         exchange_num = 0,
         is_margin = 1,
         init_price = 0,
         cur_price = 0,
         cur_margin = 0}).

role_market_init() -> #m_market_gold{}.

start_link() ->
    gen_server:start_link({local, market_gold},
                          market_gold,
                          [],
                          []).

reload() ->
    gen_server:cast(market_gold, reload),
    ok.

save(Tab, Data) ->
    case catch ets:insert(Tab, Data) of
        true -> true;
        _ -> false
    end,
    case catch dets:insert(Tab, Data) of
        ok -> true;
        _ -> false
    end.

delete(Tab, Key) ->
    case catch ets:delete(Tab, Key) of
        true -> true;
        _ -> false
    end,
    case catch dets:delete(Tab, Key) of
        ok -> true;
        _ -> false
    end.

lookup(Tab, Key) ->
    case catch ets:lookup(Tab, Key) of
        [Obj] -> Obj;
        _ -> false
    end.

get_items([], Acc) -> Acc;
get_items([Id | Rest], Acc) ->
    case lookup(market_gold_item_tab, Id) of
        false -> get_items(Rest, Acc);
        Obj -> get_items(Rest, [Obj | Acc])
    end.

get_items(Catalg1, Catalg2, Role) ->
    CurWorldLev = world_lev:get_world_lev(Role),
    Catalg = {Catalg1, Catalg2},
    case market_gold_data:get_catalg_world_lev(Catalg) of
        CatalgWorldLev when CurWorldLev >= CatalgWorldLev ->
            Ids = market_gold_data:get_catalg_items(Catalg),
            NewIds = check_show(Ids,
                                Role,
                                #{cur_world_lev => CurWorldLev},
                                []),
            Items = get_items(NewIds, []),
            {ok, {Catalg1, Catalg2, Items}};
        _WorldLev -> {ok, {Catalg1, Catalg2, []}}
    end.

check_show([], _Role, _, List) -> lists:reverse(List);
check_show([{Id, ItemWorldLev, C} | T],
           Role = #role{lev = Lev, classes = Classes},
           Args = #{cur_world_lev := CurWorldLev}, List) ->
    NewList = case ItemWorldLev =< CurWorldLev andalso
                       (C =:= 0 orelse C =:= Classes)
                  of
                  true ->
                      case market_gold_data:get_limit({Id, Lev}) of
                          #market_gold_limit_data{is_show = 1} -> [Id | List];
                          #market_gold_limit_data{is_show = 0} -> List;
                          _ -> [Id | List]
                      end;
                  _ -> List
              end,
    check_show(T, Role, Args, NewList).

query_market_price(BaseId) ->
    case case lookup(market_gold_item_tab, BaseId) of
             #market_gold_item{margin = DefineMargin,
                               init_price = DefineInitPirce} ->
                 if DefineMargin >= 1100 ->
                        DefineUnitPrice = calc_price(3,
                                                     BaseId,
                                                     DefineInitPirce,
                                                     DefineMargin),
                        DefineGoldPrice = #market_gold_price{base_id = BaseId,
                                                             margin_type = 1100,
                                                             margin =
                                                                 DefineMargin,
                                                             init_price =
                                                                 DefineInitPirce,
                                                             buy_price =
                                                                 DefineUnitPrice},
                        {ok, DefineGoldPrice};
                    true ->
                        DefineUnitPrice = calc_price(4,
                                                     BaseId,
                                                     DefineInitPirce,
                                                     DefineMargin),
                        DefineGoldPrice = #market_gold_price{base_id = BaseId,
                                                             margin_type = 1000,
                                                             margin =
                                                                 DefineMargin,
                                                             init_price =
                                                                 DefineInitPirce,
                                                             buy_price =
                                                                 DefineUnitPrice},
                        {ok, DefineGoldPrice}
                 end;
             _ -> false
         end
        of
        {ok, #market_gold_price{buy_price = Price}} ->
            NewPrice = market:get_open_srv_price(BaseId, Price),
            MarketPrice = #market_price{base_id = BaseId,
                                        price = NewPrice, assets = 90003,
                                        source = 2},
            {ok, MarketPrice};
        _False -> false
    end.

auto_buy_market_price(Role = #role{m_market_gold =
                                       #m_market_gold{limit_data = LimitData},
                                   p_bag = Bag},
                      BaseId, Num) ->
    logger:debug("~w", [Num], market_gold, 233),
    {BaseId1, Num1} = case
                          market_gold_data:get_exchange_item(BaseId)
                          of
                          {BaseId0, Num0} -> {BaseId0, Num0 * Num};
                          _ -> {BaseId, Num}
                      end,
    {Num2, Exist} = case package:count(by_base_id,
                                       BaseId1,
                                       Bag)
                        of
                        _ when BaseId1 =:= BaseId -> {Num1, []};
                        {_, 0} -> {Num1, []};
                        {_, HadNum} when HadNum >= Num1 ->
                            {0, [{BaseId1, Num1}]};
                        {_, HadNum} ->
                            DiffNum = Num1 - HadNum,
                            {DiffNum, [{BaseId1, HadNum}]}
                    end,
    logger:debug("~w,~w", [Num2, Exist], market_gold, 248),
    case check_limit(Role, BaseId1, Num2) of
        _ when Num2 =:= 0 -> {ok, 0, Role, Exist};
        {true, Msg} -> {false, Msg};
        {false, {LimitFlag, LimitMsg}} ->
            case case lookup(market_gold_item_tab, BaseId1) of
                     #market_gold_item{margin = DefineMargin,
                                       init_price = DefineInitPirce} ->
                         if DefineMargin >= 1100 ->
                                DefineUnitPrice = calc_price(3,
                                                             BaseId1,
                                                             DefineInitPirce,
                                                             DefineMargin),
                                DefineGoldPrice = #market_gold_price{base_id =
                                                                         BaseId1,
                                                                     margin_type
                                                                         = 1100,
                                                                     margin =
                                                                         DefineMargin,
                                                                     init_price
                                                                         =
                                                                         DefineInitPirce,
                                                                     buy_price =
                                                                         DefineUnitPrice},
                                {ok, DefineGoldPrice};
                            true ->
                                DefineUnitPrice = calc_price(4,
                                                             BaseId1,
                                                             DefineInitPirce,
                                                             DefineMargin),
                                DefineGoldPrice = #market_gold_price{base_id =
                                                                         BaseId1,
                                                                     margin_type
                                                                         = 1000,
                                                                     margin =
                                                                         DefineMargin,
                                                                     init_price
                                                                         =
                                                                         DefineInitPirce,
                                                                     buy_price =
                                                                         DefineUnitPrice},
                                {ok, DefineGoldPrice}
                         end;
                     _ -> false
                 end
                of
                {ok,
                 #market_gold_price{buy_price = Price,
                                    init_price = InitPirce,
                                    margin = CurMargin}} ->
                    NewPrice = market:get_open_srv_price(BaseId, Price),
                    MarketPrice = #market_price{base_id = BaseId1,
                                                price = NewPrice,
                                                assets = 90003, source = 2},
                    LimitBuyRole = case LimitFlag of
                                       true ->
                                           NewLimitData = case
                                                              lists:keyfind(BaseId1,
                                                                            1,
                                                                            LimitData)
                                                              of
                                                              {BaseId1,
                                                               BuyCount1} ->
                                                                  lists:keystore(BaseId1,
                                                                                 1,
                                                                                 LimitData,
                                                                                 {BaseId1,
                                                                                  BuyCount1
                                                                                      +
                                                                                      Num2});
                                                              false ->
                                                                  lists:keystore(BaseId1,
                                                                                 1,
                                                                                 LimitData,
                                                                                 {BaseId1,
                                                                                  Num2})
                                                          end,
                                           notice:send(Role, 1, LimitMsg),
                                           Role#role{m_market_gold =
                                                         #m_market_gold{limit_data
                                                                            =
                                                                            NewLimitData}};
                                       false -> Role
                                   end,
                    BuyEvt = #evt_market_gold_bind_buy{base_id = BaseId1,
                                                       num = Num2,
                                                       init_price = InitPirce,
                                                       price = NewPrice,
                                                       margin = CurMargin},
                    NewRole = role_trigger:fire(BuyEvt, LimitBuyRole),
                    market:send_open_srv_notice(BaseId1, NewRole),
                    push_12420(NewRole),
                    change_margin(buy, [{BaseId1, Num2}], Role),
                    {ok,
                     MarketPrice#market_price{price = NewPrice * Num2},
                     NewRole,
                     Exist,
                     {BaseId1, Num2}};
                Else -> Else
            end
    end.

auto_buy(BaseId, Num, Role) ->
    change_margin(buy, [{BaseId, Num}], Role),
    ok.

buy(Role, BaseId, Num) ->
    case case lookup(market_gold_item_tab, BaseId) of
             #market_gold_item{margin = DefineMargin,
                               init_price = DefineInitPirce} ->
                 if DefineMargin >= 1100 ->
                        DefineUnitPrice = calc_price(3,
                                                     BaseId,
                                                     DefineInitPirce,
                                                     DefineMargin),
                        DefineGoldPrice = #market_gold_price{base_id = BaseId,
                                                             margin_type = 1100,
                                                             margin =
                                                                 DefineMargin,
                                                             init_price =
                                                                 DefineInitPirce,
                                                             buy_price =
                                                                 DefineUnitPrice},
                        {ok, DefineGoldPrice};
                    true ->
                        DefineUnitPrice = calc_price(4,
                                                     BaseId,
                                                     DefineInitPirce,
                                                     DefineMargin),
                        DefineGoldPrice = #market_gold_price{base_id = BaseId,
                                                             margin_type = 1000,
                                                             margin =
                                                                 DefineMargin,
                                                             init_price =
                                                                 DefineInitPirce,
                                                             buy_price =
                                                                 DefineUnitPrice},
                        {ok, DefineGoldPrice}
                 end;
             _ -> false
         end
        of
        {ok, GoldPrice} ->
            buy_gain(Role, BaseId, Num, GoldPrice);
        Rtn = {false, _} -> Rtn;
        _ -> false
    end.

check_limit(#role{lev = Lev,
                  m_market_gold = #m_market_gold{limit_data = LimitData},
                  classes = Classes},
            BaseId, Num) ->
    LimitCount = case market_gold_data:get_limit({BaseId,
                                                  Lev})
                     of
                     #market_gold_limit_data{is_show = 1, num = TNum} ->
                         TNum;
                     #market_gold_limit_data{is_show = 0} -> -1;
                     _ -> 0
                 end,
    case market_gold_data:get(BaseId) of
        _ when LimitCount == -1 -> {true, lang:get("该道具未开放")};
        #market_gold_item_data{classes = C}
            when C =/= 0 andalso C =/= Classes ->
            {true, lang:get("当前职业不能购买该道具")};
        #market_gold_item_data{}
            when LimitCount =/= 0 andalso
                     LimitCount =/= undefined ->
            case lists:keyfind(BaseId, 1, LimitData) of
                {BaseId, BuyCount} when BuyCount >= LimitCount ->
                    NMsg =
                        notice:format(lang:get("~ts每周限购~ts个，下周再来看看吧{face_1,9}"),
                                      [{item_2, BaseId},
                                       {string_2, 5, LimitCount}]),
                    {true, NMsg};
                {BaseId, BuyCount} when BuyCount + Num > LimitCount ->
                    NMsg = notice:format(lang:get("~ts限购额度不足，本周还能购买~ts个"),
                                         [{item_2, BaseId},
                                          {string_2,
                                           5,
                                           LimitCount - BuyCount}]),
                    {true, NMsg};
                {BaseId, BuyCount} ->
                    NMsg = notice:format(lang:get("~ts限购，本周还能购买~ts个"),
                                         [{item_2, BaseId},
                                          {string_2,
                                           5,
                                           LimitCount - BuyCount - Num}]),
                    {false, {true, NMsg}};
                false when Num > LimitCount ->
                    NMsg = notice:format(lang:get("购买~ts失败，每周限购~ts个"),
                                         [{item_2, BaseId},
                                          {string_2, 5, LimitCount}]),
                    {true, NMsg};
                false ->
                    NMsg = notice:format(lang:get("~ts限购，本周还能购买~ts个"),
                                         [{item_2, BaseId},
                                          {string_2, 5, LimitCount - Num}]),
                    {false, {true, NMsg}}
            end;
        _ -> {false, {false, []}}
    end.

buy_gain(Role = #role{pid = Pid,
                      m_market_gold = #m_market_gold{limit_data = LimitData}},
         BaseId, Num,
         #market_gold_price{margin_type = MarginType,
                            init_price = InitPirce, buy_price = Price,
                            margin = CurMargin}) ->
    case check_limit(Role, BaseId, Num) of
        {true, NoticeMsg} -> {false, NoticeMsg};
        {false, {LimitFlag, LimitMsg}} ->
            case make_market_gold_item(BaseId, Num, Price) of
                {ok, Item} ->
                    LossMsg = case MarginType of
                                  1100 ->
                                      MoreFmt =
                                          lang:get("您的~ts不足，当前涨幅大于~ts，需花费~ts~ts"),
                                      MoreArgs = [{assets_2, 90003},
                                                  {string_2, 5, "10%"},
                                                  {string_2, 5, "130%"},
                                                  {assets_2, 90003}],
                                      notice:format(MoreFmt, MoreArgs);
                                  _ ->
                                      notice:format(lang:get("您的~ts不足"),
                                                    [{assets_2, 90003}])
                              end,
                    TotalPrice = Price * Num,
                    TotalPrice1 = market:get_open_srv_price(BaseId,
                                                            TotalPrice),
                    Loss = #loss{label = gold_bind, val = TotalPrice1,
                                 msg = LossMsg},
                    Gain = #gain{label = items, val = [Item]},
                    GL = [Loss, Gain],
                    case role_gain:auto_overlap(GL, Role) of
                        {ok, NRole, _SucL, []} ->
                            case case catch gen_server:call(market_gold,
                                                            {buy,
                                                             Pid,
                                                             {BaseId, Num}},
                                                            10000)
                                     of
                                     {'EXIT', {timeout, _}} -> {error, timeout};
                                     {'EXIT', {noproc, _}} -> {error, noproc};
                                     {'EXIT', {normal, _}} -> {error, exit};
                                     {'EXIT', _Call_Err} -> {error, _Call_Err};
                                     _Call_Return -> _Call_Return
                                 end
                                of
                                {ok, {NewPrice, NewMargin, NewStock}} ->
                                    Text = format:gain_text(GL, NRole),
                                    notice:send(NRole, 3, Text),
                                    LogArgs = {InitPirce,
                                               Price,
                                               NewPrice,
                                               NewMargin},
                                    LogText = log_purchs_text(Loss,
                                                              Item,
                                                              LogArgs),
                                    log:market(log_market_gold,
                                               Role,
                                               NRole,
                                               "购买",
                                               LogText),
                                    log:new_market(log_market_gold,
                                                   NRole,
                                                   "购买",
                                                   TotalPrice1,
                                                   Num,
                                                   BaseId,
                                                   Price,
                                                   NewStock,
                                                   0,
                                                   gold_bind,
                                                   ""),
                                    BuyEvt = #evt_market_gold_bind_buy{base_id =
                                                                           BaseId,
                                                                       num =
                                                                           Num,
                                                                       init_price
                                                                           =
                                                                           InitPirce,
                                                                       price =
                                                                           Price,
                                                                       margin =
                                                                           CurMargin},
                                    TriggerRole = role_trigger:fire(BuyEvt,
                                                                    NRole),
                                    NewRole = case LimitFlag of
                                                  true ->
                                                      NewLimitData = case
                                                                         lists:keyfind(BaseId,
                                                                                       1,
                                                                                       LimitData)
                                                                         of
                                                                         {BaseId,
                                                                          BuyCount1} ->
                                                                             lists:keystore(BaseId,
                                                                                            1,
                                                                                            LimitData,
                                                                                            {BaseId,
                                                                                             BuyCount1
                                                                                                 +
                                                                                                 Num});
                                                                         false ->
                                                                             lists:keystore(BaseId,
                                                                                            1,
                                                                                            LimitData,
                                                                                            {BaseId,
                                                                                             Num})
                                                                     end,
                                                      notice:send(Role,
                                                                  1,
                                                                  LimitMsg),
                                                      TriggerRole#role{m_market_gold
                                                                           =
                                                                           #m_market_gold{limit_data
                                                                                              =
                                                                                              NewLimitData}};
                                                  false -> TriggerRole
                                              end,
                                    market:send_open_srv_notice(BaseId, Role),
                                    push_12420(NewRole),
                                    {ok, NewRole};
                                {false, ErrMsg} -> {false, ErrMsg};
                                false -> false;
                                Err ->
                                    logger:error("购买同步调用错误:[~w]",
                                                 [Err],
                                                 market_gold,
                                                 398),
                                    false
                            end;
                        {false, #gain{msg = Msg}} -> {false, Msg};
                        {false, #loss{msg = Msg}} -> {false, Msg};
                        _False -> false
                    end;
                false -> false
            end
    end.

make_market_gold_item(BaseId, Num, Price) ->
    Price1 = case market_gold_data:get_const_price(BaseId)
                 of
                 Discount when is_integer(Discount) ->
                     util:floor(Discount / 1000 * Price);
                 _False -> util:floor(9.0e-1 * Price)
             end,
    NewPrice = market:get_open_srv_price(BaseId, Price1),
    case item:make(BaseId, 0, Num) of
        {ok, [Item]} ->
            NewItem = Item#item{extra =
                                    [{1, NewPrice, ""},
                                     {2, 1, ""},
                                     {3, 2, ""}]},
            {ok, NewItem};
        false -> false
    end.

fill_item_price(Item = #item{base_id = BaseId,
                             extra = Extra}) ->
    case lists:keyfind(1, 1, Extra) of
        Tuple when is_tuple(Tuple) -> Item;
        _ ->
            case case lookup(market_gold_item_tab, BaseId) of
                     #market_gold_item{margin = DefineMargin,
                                       init_price = DefineInitPirce} ->
                         if DefineMargin >= 1100 ->
                                DefineUnitPrice = calc_price(3,
                                                             BaseId,
                                                             DefineInitPirce,
                                                             DefineMargin),
                                DefineGoldPrice = #market_gold_price{base_id =
                                                                         BaseId,
                                                                     margin_type
                                                                         = 1100,
                                                                     margin =
                                                                         DefineMargin,
                                                                     init_price
                                                                         =
                                                                         DefineInitPirce,
                                                                     buy_price =
                                                                         DefineUnitPrice},
                                {ok, DefineGoldPrice};
                            true ->
                                DefineUnitPrice = calc_price(4,
                                                             BaseId,
                                                             DefineInitPirce,
                                                             DefineMargin),
                                DefineGoldPrice = #market_gold_price{base_id =
                                                                         BaseId,
                                                                     margin_type
                                                                         = 1000,
                                                                     margin =
                                                                         DefineMargin,
                                                                     init_price
                                                                         =
                                                                         DefineInitPirce,
                                                                     buy_price =
                                                                         DefineUnitPrice},
                                {ok, DefineGoldPrice}
                         end;
                     _ -> false
                 end
                of
                {ok, #market_gold_price{buy_price = Price}} ->
                    NewPrice = case market_gold_data:get_const_price(BaseId)
                                   of
                                   Discount when is_integer(Discount) ->
                                       util:floor(Discount / 1000 * Price);
                                   _False -> util:floor(9.0e-1 * Price)
                               end,
                    AddExtra = [{1, NewPrice, ""}, {2, 1, ""}, {3, 2, ""}],
                    NewExtra = AddExtra ++ Extra,
                    Item#item{extra = NewExtra};
                _ ->
                    case market_gold_data:get_invisible_price(BaseId) of
                        NewPrice when is_integer(NewPrice) ->
                            AddExtra = [{1, NewPrice, ""},
                                        {2, 1, ""},
                                        {3, 2, ""}],
                            NewExtra = AddExtra ++ Extra,
                            Item#item{extra = NewExtra};
                        _ ->
                            case get_exchange_price(BaseId) of
                                {true, BuyPrice} ->
                                    AddExtra = [{1, BuyPrice, ""},
                                                {2, 1, ""},
                                                {3, 2, ""}],
                                    NewExtra = AddExtra ++ Extra,
                                    Item#item{extra = NewExtra};
                                _ -> Item
                            end
                    end
            end
    end.

get_exchange_price(BaseId) ->
    case market_gold_data:get_exchange_item(BaseId) of
        {ExchangBaseId, ExchangNum} ->
            case lookup(market_gold_item_tab, ExchangBaseId) of
                #market_gold_item{margin = Margin,
                                  init_price = InitPirce} ->
                    UnitPrice = calc_price(4,
                                           ExchangBaseId,
                                           InitPirce,
                                           Margin),
                    BuyPrice = case
                                   market_gold_data:get_const_price(ExchangBaseId)
                                   of
                                   Discount when is_integer(Discount) ->
                                       util:floor(Discount / 1000 * UnitPrice);
                                   _False -> util:floor(9.0e-1 * UnitPrice)
                               end,
                    BuyPrice1 = round(BuyPrice * ExchangNum),
                    {true, BuyPrice1};
                _ -> false
            end;
        _ -> false
    end.

query_fill_price(BaseId) ->
    case case lookup(market_gold_item_tab, BaseId) of
             #market_gold_item{margin = DefineMargin,
                               init_price = DefineInitPirce} ->
                 if DefineMargin >= 1100 ->
                        DefineUnitPrice = calc_price(3,
                                                     BaseId,
                                                     DefineInitPirce,
                                                     DefineMargin),
                        DefineGoldPrice = #market_gold_price{base_id = BaseId,
                                                             margin_type = 1100,
                                                             margin =
                                                                 DefineMargin,
                                                             init_price =
                                                                 DefineInitPirce,
                                                             buy_price =
                                                                 DefineUnitPrice},
                        {ok, DefineGoldPrice};
                    true ->
                        DefineUnitPrice = calc_price(4,
                                                     BaseId,
                                                     DefineInitPirce,
                                                     DefineMargin),
                        DefineGoldPrice = #market_gold_price{base_id = BaseId,
                                                             margin_type = 1000,
                                                             margin =
                                                                 DefineMargin,
                                                             init_price =
                                                                 DefineInitPirce,
                                                             buy_price =
                                                                 DefineUnitPrice},
                        {ok, DefineGoldPrice}
                 end;
             _ -> false
         end
        of
        {ok, #market_gold_price{buy_price = Price}} ->
            case market_gold_data:get_const_price(BaseId) of
                Discount when is_integer(Discount) ->
                    util:floor(Discount / 1000 * Price);
                _False -> util:floor(9.0e-1 * Price)
            end;
        _ ->
            case market_gold_data:get_invisible_price(BaseId) of
                NewPrice when is_integer(NewPrice) -> NewPrice;
                _ -> 0
            end
    end.

sold(Role, Id, Num) ->
    Args = #{id => Id, num => Num},
    sold_flow([check, gain], Args, #{}, Role).

check_world_lev(BaseId, Role) ->
    {WorldLev, _NextTime} = world_lev:get_world_lev(Role),
    case market_gold_data:get(BaseId) of
        #market_gold_item_data{world_lev = LimitWorldLev}
            when WorldLev >= LimitWorldLev ->
            true;
        #market_gold_item_data{world_lev = LimitWorldLev} ->
            case item_data:get(BaseId) of
                #item_base{id = ItemId} ->
                    Fmt = lang:get("世界等级不足~ts级，~ts无法出售"),
                    Args = [{string_1, LimitWorldLev}, {item_2, ItemId}],
                    Text = notice:format(Fmt, Args),
                    notice:send(Role, 1, Text);
                _ -> false
            end,
            false;
        _ ->
            case market_gold_data:get_invisible_world_lev(BaseId) of
                InvWorldLev when WorldLev >= InvWorldLev -> true;
                InvWorldLev when is_integer(InvWorldLev) ->
                    case item_data:get(BaseId) of
                        #item_base{id = ItemId} ->
                            Fmt = lang:get("世界等级不足~ts级，~ts无法出售"),
                            Args = [{string_1, InvWorldLev}, {item_2, ItemId}],
                            Text = notice:format(Fmt, Args),
                            notice:send(Role, 1, Text);
                        _ -> false
                    end,
                    false;
                _ ->
                    case market_gold_data:get_const_world_lev(BaseId) of
                        ConstWorldLev when WorldLev >= ConstWorldLev -> true;
                        ConstWorldLev when is_integer(ConstWorldLev) ->
                            case item_data:get(BaseId) of
                                #item_base{id = ItemId} ->
                                    Fmt = lang:get("世界等级不足~ts级，~ts无法出售"),
                                    Args = [{string_1, ConstWorldLev},
                                            {item_2, ItemId}],
                                    Text = notice:format(Fmt, Args),
                                    notice:send(Role, 1, Text);
                                _ -> false
                            end,
                            false;
                        _False ->
                            case market_gold_data:get_exchange_world_lev(BaseId)
                                of
                                ExgWorldLev when WorldLev >= ExgWorldLev ->
                                    true;
                                ExgWorldLev when is_integer(ExgWorldLev) ->
                                    case item_data:get(BaseId) of
                                        #item_base{id = ItemId} ->
                                            Fmt =
                                                lang:get("世界等级不足~ts级，~ts无法出售"),
                                            Args = [{string_1, ExgWorldLev},
                                                    {item_2, ItemId}],
                                            Text = notice:format(Fmt, Args),
                                            notice:send(Role, 1, Text);
                                        _ -> false
                                    end,
                                    false;
                                _False -> false
                            end
                    end
            end
    end.

sold_check_flow(Item = #item{base_id = BaseId,
                             extra = Extra},
                Cache, Role) ->
    case lookup(market_gold_item_tab, BaseId) of
        #market_gold_item{margin = Margin} when Margin =< 900 ->
            Text = notice:format(lang:get("当前物品已下跌至~ts，无法继续出售"),
                                 [{string_2, 5, "10%"}]),
            notice:send(Role, 1, Text),
            false;
        #market_gold_item{init_price = InitPirce,
                          margin = Margin, cur_price = CurPrice} ->
            case market_gold_data:get_const_price(BaseId) of
                Discount when is_integer(Discount) ->
                    NewPrice = case lists:keyfind(1, 1, Extra) of
                                   {1, 0, _Msg} ->
                                       Price1 = calc_price(4,
                                                           BaseId,
                                                           InitPirce,
                                                           Margin),
                                       util:floor(Price1 * 9.0e-1);
                                   {1, Price, _Msg} ->
                                       case market_gold_data:get(BaseId) of
                                           #market_gold_item_data{max_price =
                                                                      MaxPrice,
                                                                  min_price =
                                                                      MinPrice} ->
                                               case
                                                   market_gold_data:get_const_price(BaseId)
                                                   of
                                                   Discount
                                                       when
                                                         is_integer(Discount) ->
                                                       Price;
                                                   false ->
                                                       erlang:max(MinPrice,
                                                                  erlang:min(MaxPrice,
                                                                             Price))
                                               end;
                                           _False -> false
                                       end;
                                   false ->
                                       Price1 = calc_price(4,
                                                           BaseId,
                                                           InitPirce,
                                                           Margin),
                                       util:floor(Price1 * Discount / 1000)
                               end,
                    CalcPrice = #calc_sold_price{type = 2, is_margin = 1,
                                                 discount = Discount,
                                                 price = NewPrice,
                                                 init_price = InitPirce,
                                                 cur_price = CurPrice,
                                                 cur_margin = Margin},
                    {ok,
                     Role,
                     Cache#{item => Item, calc_price => CalcPrice}};
                _False ->
                    NewPrice = case lists:keyfind(1, 1, Extra) of
                                   {1, 0, _Msg} ->
                                       Price1 = calc_price(4,
                                                           BaseId,
                                                           InitPirce,
                                                           Margin),
                                       util:floor(Price1 * 9.0e-1);
                                   {1, Price, _Msg} ->
                                       logger:debug("{?item_extra_market_price, Price, _Msg}:~w",
                                                    [{1, Price, _Msg}],
                                                    market_gold,
                                                    604),
                                       case market_gold_data:get(BaseId) of
                                           #market_gold_item_data{max_price =
                                                                      MaxPrice,
                                                                  min_price =
                                                                      MinPrice} ->
                                               SellMinPrice =
                                                   util:floor(MinPrice *
                                                                  9.0e-1),
                                               erlang:max(SellMinPrice,
                                                          erlang:min(MaxPrice,
                                                                     Price));
                                           _False -> false
                                       end;
                                   false ->
                                       Price1 = calc_price(4,
                                                           BaseId,
                                                           InitPirce,
                                                           Margin),
                                       util:floor(Price1 * 9.0e-1)
                               end,
                    CalcPrice = #calc_sold_price{type = 1, is_margin = 1,
                                                 price = NewPrice,
                                                 init_price = InitPirce,
                                                 cur_price = CurPrice,
                                                 cur_margin = Margin},
                    {ok,
                     Role,
                     Cache#{item => Item, calc_price => CalcPrice}}
            end;
        false ->
            case market_gold_data:get_invisible_price(BaseId) of
                SalePrice when is_integer(SalePrice) ->
                    CalcPrice = #calc_sold_price{type = 3, is_margin = 0,
                                                 price = SalePrice},
                    {ok,
                     Role,
                     Cache#{item => Item, calc_price => CalcPrice}};
                _False ->
                    case market_gold_data:get_exchange_item(BaseId) of
                        {ExchangBaseId, ExchangNum} ->
                            case lookup(market_gold_item_tab, ExchangBaseId) of
                                #market_gold_item{margin = Margin,
                                                  init_price = InitPirce} ->
                                    UnitPrice = calc_price(4,
                                                           ExchangBaseId,
                                                           InitPirce,
                                                           Margin),
                                    NewPrice = case
                                                   market_gold_data:get_const_price(ExchangBaseId)
                                                   of
                                                   ExchangDiscount
                                                       when
                                                         is_integer(ExchangDiscount) ->
                                                       util:floor(ExchangDiscount
                                                                      / 1000
                                                                      *
                                                                      UnitPrice);
                                                   _False ->
                                                       util:floor(9.0e-1 *
                                                                      UnitPrice)
                                               end,
                                    CalcPrice = #calc_sold_price{type = 4,
                                                                 is_margin = 0,
                                                                 price =
                                                                     NewPrice,
                                                                 exchange_num =
                                                                     ExchangNum,
                                                                 exchange_base_id
                                                                     =
                                                                     ExchangBaseId},
                                    {ok,
                                     Role,
                                     Cache#{item => Item,
                                            calc_price => CalcPrice}};
                                _ ->
                                    logger:error("未找到金币市场数据[Id:~w]",
                                                 [BaseId],
                                                 market_gold,
                                                 652),
                                    false
                            end;
                        _False -> false
                    end
            end
    end.

sold_flow(check, #{id := Id}, Cache,
          Role = #role{p_bag = Bag}) ->
    case package:find(by_id, Id, Bag) of
        false -> false;
        {ok, #item{bind = 1}} -> false;
        {ok, Item = #item{base_id = BaseId}} ->
            case check_world_lev(BaseId, Role) of
                true -> sold_check_flow(Item, Cache, Role);
                false -> false
            end
    end;
sold_flow(gain, #{id := Id, num := Num},
          #{item := #item{base_id = BaseId},
            calc_price :=
                CalcPrice = #calc_sold_price{is_margin = IsMargin,
                                             price = UnitPrice, type = Type,
                                             exchange_num = ExchangNum,
                                             cur_price = CurPrice,
                                             cur_margin = CurMargin}},
          Role) ->
    PriceNum = case Type of
                   4 -> ExchangNum * Num;
                   _ -> Num
               end,
    TotalPrice = UnitPrice * PriceNum,
    Gain = #gain{label = gold_bind, val = TotalPrice},
    GL = [#loss{label = item_id, val = [{Id, Num}]}, Gain],
    TextOpts = #gain_text_opts{loss_tag = lang:get("出售")},
    Text = format:gain_text(GL, TextOpts, Role),
    case role_gain:do(GL, Role) of
        {ok, NewRole} ->
            UpdateData = case IsMargin of
                             1 ->
                                 case change_margin(sold,
                                                    {BaseId, Num},
                                                    NewRole)
                                     of
                                     {ok, RtnUpdateData} -> RtnUpdateData;
                                     _ -> {CurPrice, CurMargin, 0}
                                 end;
                             0 -> {CurPrice, CurMargin, 0}
                         end,
            LogText = log_sold_out_text({BaseId, Num},
                                        Gain,
                                        CalcPrice,
                                        UpdateData),
            log:market(log_market_gold,
                       Role,
                       NewRole,
                       "出售",
                       LogText),
            NewStock = case UpdateData of
                           {_, _, Stock} -> Stock;
                           _ -> 0
                       end,
            log:new_market(log_market_gold,
                           Role,
                           "出售",
                           TotalPrice,
                           Num,
                           BaseId,
                           UnitPrice,
                           NewStock,
                           0,
                           gold_bind,
                           ""),
            notice:send(NewRole, 3, Text),
            SoleEvt = #evt_market_gold_bind_sold{base_id = BaseId,
                                                 price = TotalPrice},
            TrgRole = role_trigger:fire(SoleEvt, NewRole),
            {ok, TrgRole};
        _ ->
            notice:return(lang:get("出售物品失败")),
            false
    end;
sold_flow([], _, _, Role) -> {ok, Role};
sold_flow([Step | Rest], Args, Cache, Role) ->
    case sold_flow(Step, Args, Cache, Role) of
        {ok, NewRole} -> sold_flow(Rest, Args, Cache, NewRole);
        {ok, NewRole, NewCache} ->
            sold_flow(Rest, Args, NewCache, NewRole);
        Rtn -> Rtn
    end.

change_margin(buy, Data, _Role) ->
    logger:debug("=========++++~w",
                 [Data],
                 market_gold,
                 735),
    gen_server:cast(market_gold, {buy_margin, Data});
change_margin(sold, Data, #role{pid = Pid}) ->
    case catch gen_server:call(market_gold,
                               {sold, Pid, Data},
                               10000)
        of
        {'EXIT', {timeout, _}} -> {error, timeout};
        {'EXIT', {noproc, _}} -> {error, noproc};
        {'EXIT', {normal, _}} -> {error, exit};
        {'EXIT', _Call_Err} -> {error, _Call_Err};
        _Call_Return -> _Call_Return
    end;
change_margin(Label, Data, _Role) ->
    logger:error("无法改变涨幅，未知的操作[Label:~w][Data:~w]",
                 [Label, Data],
                 market_gold,
                 740),
    false.

exchange_gold(GoldBind, Role = #role{}) ->
    {WorldLev, _T} = world_lev:get_world_lev(Role),
    case market_gold_data:get_exchange(WorldLev) of
        Rate when is_integer(Rate) ->
            {ok, util:ceil(GoldBind / Rate)};
        _False -> false
    end.

exchange_gold(BaseId, Num, Role = #role{}) ->
    {WorldLev, _T} = world_lev:get_world_lev(Role),
    exchange_gold(BaseId, Num, WorldLev);
exchange_gold(BaseId, Num, WorldLev) ->
    case market_gold_data:get_exchange(WorldLev) of
        Rate when is_integer(Rate) ->
            case lookup(market_gold_item_tab, BaseId) of
                #market_gold_item{margin = Margin,
                                  init_price = InitPirce} ->
                    if Margin >= 1100 ->
                           UnitPrice = calc_price(3, BaseId, InitPirce, Margin),
                           TotalPrice = UnitPrice * Num,
                           {ok, util:ceil(TotalPrice / Rate)};
                       true ->
                           UnitPrice = calc_price(4, BaseId, InitPirce, Margin),
                           TotalPrice = UnitPrice * Num,
                           {ok, util:ceil(TotalPrice / Rate)}
                    end;
                false ->
                    case market_gold_data:get_invisible_price(BaseId) of
                        ConstPrice when is_integer(ConstPrice) ->
                            TotalPrice = ConstPrice * Num,
                            {ok, util:ceil(TotalPrice / Rate)};
                        _False ->
                            logger:error("未找到金币市场数据[Id:~w][Err:~w]",
                                         [BaseId, _False],
                                         market_gold,
                                         776),
                            false
                    end
            end;
        _None -> false
    end.

role_reset(Role = #role{m_market_gold =
                            MMarketGold = #m_market_gold{}},
           _) ->
    logger:debug("周更新金币市场限购数据", [], market_gold, 784),
    {ok,
     Role#role{m_market_gold =
                   MMarketGold#m_market_gold{limit_data = []}}}.

push_12420(Role = #role{m_market_gold =
                            #m_market_gold{limit_data = LimitData}}) ->
    role:link_send(Role, 12420, {LimitData}).

get_item_init_price(BaseId) ->
    case case lookup(market_gold_item_tab, BaseId) of
             #market_gold_item{margin = DefineMargin,
                               init_price = DefineInitPirce} ->
                 if DefineMargin >= 1100 ->
                        DefineUnitPrice = calc_price(3,
                                                     BaseId,
                                                     DefineInitPirce,
                                                     DefineMargin),
                        DefineGoldPrice = #market_gold_price{base_id = BaseId,
                                                             margin_type = 1100,
                                                             margin =
                                                                 DefineMargin,
                                                             init_price =
                                                                 DefineInitPirce,
                                                             buy_price =
                                                                 DefineUnitPrice},
                        {ok, DefineGoldPrice};
                    true ->
                        DefineUnitPrice = calc_price(4,
                                                     BaseId,
                                                     DefineInitPirce,
                                                     DefineMargin),
                        DefineGoldPrice = #market_gold_price{base_id = BaseId,
                                                             margin_type = 1000,
                                                             margin =
                                                                 DefineMargin,
                                                             init_price =
                                                                 DefineInitPirce,
                                                             buy_price =
                                                                 DefineUnitPrice},
                        {ok, DefineGoldPrice}
                 end;
             _ -> false
         end
        of
        {ok, #market_gold_price{init_price = InitPrice}} ->
            InitPrice;
        _ -> false
    end.

init([]) ->
    logger:info("金币市场正在启动:[~w]",
                [market_gold],
                market_gold,
                804),
    process_flag(trap_exit, true),
    case catch load_item_data() of
        ok ->
            reload_data(),
            TRef = reset_timer(),
            logger:info("金币市场启动完成:[~w]",
                        [market_gold],
                        market_gold,
                        810),
            Pltm = case env:get(platform) of
                       undefined -> "";
                       TmpPltm -> TmpPltm
                   end,
            ZoneId = case env:get(zone_id) of
                         undefined -> 0;
                         TmpZoneId -> TmpZoneId
                     end,
            {ok,
             #state{reset_timer = TRef, platform = Pltm,
                    zone_id = ZoneId}};
        {error, LoadErr} ->
            logger:error("金币市场启动失败:[~w][Err:~w]",
                         [market_gold, LoadErr],
                         market_gold,
                         815),
            {stop, abnormal};
        Exit ->
            logger:error("金币市场启动失败:[~w][Err:~w]",
                         [market_gold, Exit],
                         market_gold,
                         818),
            {stop, abnormal}
    end.

handle_call({buy, Pid, Data}, _From, State) ->
    Reply = update_bill_board(buy, Pid, Data, State),
    {reply, Reply, State};
handle_call({buy, Data}, _From, State)
    when is_list(Data) ->
    Reply = update_batch_bill_board(buy, Data, State),
    {reply, Reply, State};
handle_call({sold, Pid, Data}, _From, State) ->
    Reply = update_bill_board(sold, Pid, Data, State),
    {reply, Reply, State};
handle_call(reset, _From, State) ->
    Reply = refresh(),
    {reply, Reply, State};
handle_call(_Request, _From, State) ->
    {reply, false, State}.

handle_cast({buy_margin, Data}, State)
    when is_list(Data) ->
    catch update_batch_bill_board(buy, Data, State),
    {noreply, State};
handle_cast({got_list, Rid, Ids}, State) ->
    update_got_list(Ids, Rid, []),
    {noreply, State};
handle_cast(reload, State) ->
    reload_data(),
    logger:info("金币市场重载完成", [], market_gold, 845),
    {noreply, State};
handle_cast(Msg, State) ->
    logger:error("[~w]收到错误的消息:[~w]",
                 [market_gold, Msg],
                 market_gold,
                 848),
    {noreply, State}.

handle_info(reset,
            #state{reset_timer = TRef} = State) ->
    erlang:cancel_timer(TRef),
    refresh(),
    NewTRef = reset_timer(),
    logger:info("0点重置金币市场完成", [], market_gold, 856),
    {noreply, State#state{reset_timer = NewTRef}};
handle_info(_Info, State) ->
    logger:error("[~w]收到错误的消息:[~w]",
                 [market_gold, _Info],
                 market_gold,
                 859),
    {noreply, State}.

terminate(Reason, State) ->
    clean(State),
    case Reason of
        normal ->
            logger:info("金币市场正常关闭:[~w]",
                        [market_gold],
                        market_gold,
                        865);
        shutdown ->
            logger:error("由Supervisor主动shutdown金币市场进程",
                         [],
                         market_gold,
                         866);
        _Unknow ->
            logger:error("金币市场关闭异常:[Reason:~w]",
                         [_Unknow],
                         market_gold,
                         867)
    end,
    ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

load_item_data() ->
    market_gold_change_tab = ets:new(market_gold_change_tab,
                                     [set,
                                      named_table,
                                      public,
                                      {keypos,
                                       #market_gold_change_item.base_id}]),
    market_gold_item_tab = ets:new(market_gold_item_tab,
                                   [set,
                                    named_table,
                                    public,
                                    {keypos, #market_gold_item.base_id}]),
    {ok, market_gold_item_tab} =
        dets:open_file(market_gold_item_tab,
                       [{file, "dets/market_gold_item.dets"},
                        {keypos, #market_gold_item.base_id},
                        {type, set}]),
    market_gold_item_tab = dets:to_ets(market_gold_item_tab,
                                       market_gold_item_tab),
    load_data(),
    ok.

reload_data() ->
    AllItems = market_gold_data:get_all_items(),
    ItemList = ets:tab2list(market_gold_item_tab),
    {AddItems, DelItems} = reload_data(ItemList,
                                       AllItems,
                                       [],
                                       []),
    [delete(market_gold_item_tab, Id) || Id <- DelItems],
    save(market_gold_item_tab, AddItems),
    garbage_collect(),
    ok.

reload_data([], OpenItems, DelItems, UpdateItems) ->
    AddItems = [#market_gold_item{id = Id, base_id = BaseId,
                                  stock = InitStock, cur_price = InitPirce,
                                  init_price = InitPirce, def_price = InitPirce,
                                  margin = 1000, margin_acc = 1000,
                                  init_stock = InitStock}
                || #market_gold_item_data{id = Id, base_id = BaseId,
                                          init_price = InitPirce,
                                          init_stock = InitStock}
                       <- OpenItems],
    {UpdateItems ++ AddItems, DelItems};
reload_data([Item = #market_gold_item{base_id = BaseId,
                                      def_price = PreDefPrice, margin = _Margin,
                                      margin_acc = _MarginAcc,
                                      init_price = PreInitPrice,
                                      cur_price = PreCurPrice}
             | Rest],
            OpenItems, DelItems, UpdateItems) ->
    case lists:keytake(BaseId,
                       #market_gold_item_data.base_id,
                       OpenItems)
        of
        false ->
            reload_data(Rest,
                        OpenItems,
                        [BaseId | DelItems],
                        UpdateItems);
        {value,
         #market_gold_item_data{id = Id,
                                init_price = PreDefPrice, min_price = MinPrice,
                                max_price = MaxPrice},
         RestOpenItems} ->
            InitPirce = erlang:max(erlang:min(PreInitPrice,
                                              MaxPrice),
                                   MinPrice),
            CurPrice = erlang:max(erlang:min(PreCurPrice, MaxPrice),
                                  MinPrice),
            NewItem = Item#market_gold_item{id = Id,
                                            init_price = InitPirce,
                                            cur_price = CurPrice},
            NewItem2 = reset_mergin(NewItem),
            reload_data(Rest,
                        RestOpenItems,
                        DelItems,
                        [NewItem2 | UpdateItems]);
        {value,
         #market_gold_item_data{id = Id, init_price = DefPirce,
                                min_price = MinPrice, max_price = MaxPrice},
         RestOpenItems} ->
            InitPirce = erlang:max(erlang:min(PreInitPrice,
                                              MaxPrice),
                                   MinPrice),
            CurPrice = erlang:max(erlang:min(PreCurPrice, MaxPrice),
                                  MinPrice),
            NewItem = Item#market_gold_item{id = Id,
                                            init_price = InitPirce,
                                            cur_price = CurPrice,
                                            def_price = DefPirce},
            NewItem2 = reset_mergin(NewItem),
            reload_data(Rest,
                        RestOpenItems,
                        DelItems,
                        [NewItem2 | UpdateItems])
    end.

reset_mergin(Item = #market_gold_item{}) ->
    {Today, _} = date:seconds_to_datetime(date:unixtime2()),
    case Today =:= {2018, 6, 8} of
        true -> Item#market_gold_item{margin = 1000};
        _ -> Item
    end.

reset_timer() ->
    Now = date:unixtime(),
    Time = date:unixtime({next_day, Now}),
    erlang:send_after((Time - Now) * 1000, self(), reset).

calc_price(Type,
           #market_gold_item_data{min_price = MinPrice,
                                  max_price = MaxPrice},
           InitPrice, Margin) ->
    CurPrice = calc_price(Type, InitPrice, Margin),
    erlang:max(MinPrice, erlang:min(MaxPrice, CurPrice));
calc_price(Type, BaseId, InitPrice, Margin) ->
    case market_gold_data:get(BaseId) of
        Data = #market_gold_item_data{} ->
            calc_price(Type, Data, InitPrice, Margin);
        _False ->
            logger:error("未知的金币市场道具[BaseId:~w][False:~w]",
                         [BaseId, _False],
                         market_gold,
                         964),
            calc_price(3, InitPrice, Margin)
    end.

calc_price(4, InitPirce, Margin) ->
    erlang:round(InitPirce * (Margin / 1000));
calc_price(3, InitPirce, Margin) ->
    erlang:round(InitPirce * (Margin / 1000) * 1.3).

clean(#state{reset_timer = TRef}) ->
    erlang:cancel_timer(TRef),
    util:close_dets(market_gold_item_tab).

refresh() ->
    List = ets:tab2list(market_gold_item_tab),
    NewList = refresh(List, []),
    save(market_gold_item_tab, NewList),
    garbage_collect(),
    {ok, NewList}.

refresh([], Acc) -> Acc;
refresh([Item = #market_gold_item{base_id = Id,
                                  margin = Margin, margin_acc = MarginAcc,
                                  def_price = _PreDefPrice,
                                  cur_price = CurPrice}
         | Rest],
        Acc) ->
    case market_gold_data:get(Id) of
        #market_gold_item_data{init_stock = InitStock,
                               init_price = DefPrice, min_price = MinPrice,
                               max_price = MaxPrice} ->
            CalcCurPrice = CurPrice,
            NewCurPrice = erlang:min(erlang:max(CalcCurPrice,
                                                MinPrice),
                                     MaxPrice),
            NewMarginAcc = erlang:round(Margin * MarginAcc / 1000),
            NewItem = Item#market_gold_item{stock = InitStock,
                                            init_stock = InitStock,
                                            margin = 1000,
                                            margin_acc = NewMarginAcc,
                                            cur_price = NewCurPrice,
                                            init_price = NewCurPrice,
                                            def_price = DefPrice, day_sold = 0,
                                            day_buy = 0},
            refresh(Rest, [NewItem | Acc]);
        _False ->
            logger:error("没有金币市场数据[baseId:~w][Err:~w]",
                         [Id, _False],
                         market_gold,
                         1021),
            delete(market_gold_item_tab, Id),
            refresh(Rest, Acc)
    end.

update_bill_board(buy, Pid, {BaseId, Num}, State) ->
    case update_buy_bill_board(BaseId, Num, State) of
        {ok,
         Goods = #market_gold_item{margin = Margin,
                                   cur_price = CurPrice, stock = CurStock}} ->
            save(market_gold_item_tab, Goods),
            change_item(BaseId, Pid),
            {ok, {CurPrice, Margin, CurStock}};
        _False -> false
    end;
update_bill_board(sold, Pid, {BaseId, Num}, State) ->
    case lookup(market_gold_item_tab, BaseId) of
        Goods = #market_gold_item{init_price = InitPirce,
                                  cur_price = CurPrice, init_stock = InitStock,
                                  stock = Stock, margin = Margin,
                                  day_buy = DayBuy, day_sold = DaySold} ->
            case market_gold_data:get(BaseId) of
                Data = #market_gold_item_data{max_price = MaxPrice,
                                              min_price = MinPrice,
                                              init_stock = CfgStock,
                                              down_ratio = DownRatio,
                                              up_ratio = UpRatio} ->
                    NewStock = case CurPrice =< MinPrice of
                                   true -> Stock;
                                   false -> Stock + Num
                               end,
                    NewDaySold = DaySold + Num,
                    DefInitStock = case InitStock of
                                       0 -> CfgStock;
                                       _ -> InitStock
                                   end,
                    NewMargin = case MaxPrice =:= MinPrice of
                                    true -> Margin;
                                    false ->
                                        calc_margin(NewStock,
                                                    DefInitStock,
                                                    UpRatio,
                                                    DownRatio,
                                                    DayBuy,
                                                    NewDaySold)
                                end,
                    NewPrice = calc_price(4, Data, InitPirce, NewMargin),
                    logger:debug("价格：~w, 库存：~w, 起始库存：~w, 涨幅:~w",
                                 [NewPrice, NewStock, DefInitStock, NewMargin],
                                 market_gold,
                                 1056),
                    NewGoods = Goods#market_gold_item{stock = NewStock,
                                                      margin = NewMargin,
                                                      cur_price = NewPrice,
                                                      day_sold = NewDaySold},
                    log_server("出售", State, BaseId, Num, Goods, NewGoods),
                    save(market_gold_item_tab, NewGoods),
                    change_item(BaseId, Pid),
                    {ok, {NewPrice, NewMargin, NewStock}};
                _False ->
                    logger:error("无法找到金币市场物品[BaseId:~w][Err:~w]",
                                 [BaseId, _False],
                                 market_gold,
                                 1065),
                    false
            end;
        _False ->
            logger:error("无法找到金币市场物品[BaseId:~w][Err:~w]",
                         [BaseId, _False],
                         market_gold,
                         1069),
            false
    end.

update_batch_bill_board(buy, Batch, State) ->
    do_update_batch_bill_board(Batch, State, [], []).

do_update_batch_bill_board([], _State, Acc,
                           MarginAcc) ->
    save(market_gold_item_tab, Acc),
    {ok, MarginAcc};
do_update_batch_bill_board([{BaseId, Num} | Rest],
                           State, Acc, MarginAcc) ->
    case update_buy_bill_board(BaseId, Num, State) of
        {ok,
         Goods = #market_gold_item{margin = Margin,
                                   cur_price = Price}} ->
            NewMarginAcc = [{BaseId, Price, Margin} | MarginAcc],
            do_update_batch_bill_board(Rest,
                                       State,
                                       [Goods | Acc],
                                       NewMarginAcc);
        _False -> false
    end.

update_buy_bill_board(BaseId, Num, State) ->
    case lookup(market_gold_item_tab, BaseId) of
        Goods = #market_gold_item{init_price = InitPirce,
                                  cur_price = CurPrice, stock = Stock,
                                  init_stock = InitStock, margin = Margin,
                                  day_buy = DayBuy, day_sold = DaySold} ->
            case market_gold_data:get(BaseId) of
                Data = #market_gold_item_data{max_price = MaxPrice,
                                              min_price = MinPrice,
                                              init_stock = CfgStock,
                                              down_ratio = DownRatio,
                                              up_ratio = UpRatio} ->
                    NewStock = case CurPrice >= MaxPrice of
                                   true -> Stock;
                                   false -> Stock - Num
                               end,
                    NewDayBuy = DayBuy + Num,
                    DefInitStock = case CfgStock of
                                       0 -> CfgStock;
                                       _ -> InitStock
                                   end,
                    NewMargin = case MaxPrice =:= MinPrice of
                                    true -> Margin;
                                    false ->
                                        calc_margin(NewStock,
                                                    DefInitStock,
                                                    UpRatio,
                                                    DownRatio,
                                                    NewDayBuy,
                                                    DaySold)
                                end,
                    NewPrice = calc_price(4, Data, InitPirce, NewMargin),
                    logger:debug("价格：~w, 库存：~w, 起始库存：~w, 涨幅:~w",
                                 [NewPrice, NewStock, DefInitStock, NewMargin],
                                 market_gold,
                                 1111),
                    NewGoods = Goods#market_gold_item{margin = NewMargin,
                                                      cur_price = NewPrice,
                                                      stock = NewStock,
                                                      day_buy = NewDayBuy},
                    log_server("购买", State, BaseId, Num, Goods, NewGoods),
                    {ok, NewGoods};
                _False ->
                    logger:error("无法找到金币市场物品[BaseId:~w][Err:~w]",
                                 [BaseId, _False],
                                 market_gold,
                                 1118),
                    false
            end;
        _False ->
            logger:error("无法找到金币市场物品[BaseId:~w][Err:~w]",
                         [BaseId, _False],
                         market_gold,
                         1122),
            false
    end.

calc_margin(_Stock, 0, _, _, _, _) -> 1300;
calc_margin(_Stock, InitStock, UpRatio, DownRatio,
            DayBuy, DaySold) ->
    Margin = erlang:round((1 +
                               (UpRatio * DayBuy - DownRatio * DaySold) /
                                   InitStock
                                   / 10
                                   / 1000)
                              * 1000),
    erlang:min(erlang:max(Margin, 900), 1300).

change_item(BaseId, Pid) ->
    case do_change_item(BaseId) of
        true ->
            role:apply(async,
                       Pid,
                       {market_gold, push_change_items, [BaseId]});
        _False -> false
    end.

do_change_item(BaseId) ->
    case market_gold_data:get(BaseId) of
        #market_gold_item_data{catalg_1 = C1, catalg_2 = C2} ->
            case catch ets:lookup(market_gold_change_tab, BaseId) of
                [#market_gold_change_item{}] ->
                    case catch ets:insert(market_gold_change_tab,
                                          #market_gold_change_item{base_id =
                                                                       BaseId,
                                                                   catalg_1 =
                                                                       C1,
                                                                   catalg_2 =
                                                                       C2})
                        of
                        true -> true;
                        _ -> false
                    end;
                [] ->
                    case catch ets:insert(market_gold_change_tab,
                                          #market_gold_change_item{base_id =
                                                                       BaseId,
                                                                   catalg_1 =
                                                                       C1,
                                                                   catalg_2 =
                                                                       C2})
                        of
                        true -> true;
                        _ -> false
                    end;
                _ -> false
            end;
        _ -> false
    end.

push_change_items(Role = #role{id = Rid},
                  Catalg = {_C1, _C2}) ->
    case get_change_items(Role, Catalg) of
        {ok, []} -> ok;
        {ok, Items} ->
            Ids = [TmpBaseId
                   || #market_gold_item{base_id = TmpBaseId} <- Items],
            gen_server:cast(market_gold, {got_list, Rid, Ids}),
            role:link_send(Role, 12418, {Items}),
            ok;
        _False -> ok
    end;
push_change_items(Role = #role{id = Rid}, BaseId) ->
    case market_gold_data:get(BaseId) of
        #market_gold_item_data{catalg_1 = C1, catalg_2 = C2} ->
            Catalg = {C1, C2},
            case get_change_items(Role, Catalg) of
                {ok, []} -> ok;
                {ok, Items} ->
                    Ids = [TmpBaseId
                           || #market_gold_item{base_id = TmpBaseId} <- Items],
                    gen_server:cast(market_gold, {got_list, Rid, Ids}),
                    role:link_send(Role, 12418, {Items}),
                    ok;
                _False -> ok
            end;
        _False ->
            logger:error("金币市场无法找到物品[BaseId:~w]",
                         [BaseId],
                         market_gold,
                         1197),
            ok
    end.

get_change_items(Role = #role{id = Rid},
                 Catalg = {C1, C2}) ->
    CurWorldLev = world_lev:get_world_lev(Role),
    case market_gold_data:get_catalg_world_lev(Catalg) of
        CatalgWorldLev when CurWorldLev >= CatalgWorldLev ->
            Ms = [{#market_gold_change_item{catalg_1 = '$1',
                                            catalg_2 = '$2', _ = '_'},
                   [{'=:=', '$1', C1}, {'=:=', '$2', C2}],
                   ['$_']}],
            case catch ets:select(market_gold_change_tab, Ms) of
                List = [_ | _] ->
                    Items = filter_change_items(List, CurWorldLev, Rid, []),
                    {ok, Items};
                _False -> false
            end;
        _WorldLev -> ok
    end.

filter_change_items([], _WorldLev, _Rid, Acc) -> Acc;
filter_change_items([#market_gold_change_item{base_id =
                                                  BaseId,
                                              got_list = GotList}
                     | Rest],
                    CurWorldLev, Rid, Acc) ->
    case market_gold_data:get(BaseId) of
        #market_gold_item_data{world_lev = WorldLev}
            when WorldLev =< CurWorldLev ->
            case catch ets:lookup(market_gold_item_tab, BaseId) of
                [Goods = #market_gold_item{}] ->
                    case lists:member(Rid, GotList) of
                        true ->
                            filter_change_items(Rest, CurWorldLev, Rid, Acc);
                        false ->
                            filter_change_items(Rest,
                                                CurWorldLev,
                                                Rid,
                                                [Goods | Acc])
                    end;
                _ -> filter_change_items(Rest, CurWorldLev, Rid, Acc)
            end;
        _ -> filter_change_items(Rest, CurWorldLev, Rid, Acc)
    end.

update_got_list([], _Rid, Acc) ->
    case catch ets:insert(market_gold_change_tab, Acc) of
        true -> true;
        _ -> false
    end,
    ok;
update_got_list([Id | Rest], Rid, Acc) ->
    case catch ets:lookup(market_gold_change_tab, Id) of
        [Change = #market_gold_change_item{got_list =
                                               GotList}] ->
            update_got_list(Rest,
                            Rid,
                            [Change#market_gold_change_item{got_list =
                                                                [Rid | GotList]}
                             | Acc]);
        _ -> update_got_list(Rest, Rid, Acc)
    end.

load_data() ->
    case dets:first(market_gold_item_tab) of
        '$end_of_table' ->
            logger:info("没有数据需要加载", [], market_gold, 1248),
            [];
        _ ->
            dets:traverse(market_gold_item_tab,
                          fun (I) ->
                                  case market_ver:market_gold_ver(I) of
                                      {false, Reason} ->
                                          logger:error("金币市场数据转换失败:~w",
                                                       [Reason],
                                                       market_gold,
                                                       1255),
                                          {done, false};
                                      {ok, I1 = #market_gold_item{}} ->
                                          ets:insert(market_gold_item_tab, I1),
                                          dets:insert(market_gold_item_tab, I1),
                                          continue
                                  end
                          end)
    end.

log_server(Title,
           #state{platform = Pltm, zone_id = ZoneId}, BaseId, Num,
           #market_gold_item{stock = OldStock,
                             cur_price = OldPrice, margin = OldMargin},
           #market_gold_item{stock = NewStock,
                             cur_price = NewPrice, margin = NewMargin,
                             init_price = InitPrice, init_stock = InitStock,
                             margin_acc = MarginAcc}) ->
    ItemStr = log:item_str({BaseId, Num}),
    FmtStr = "~ts$$~w$$~w$$~w$$~w$$~w$$~w$$~w$$~w$$~w",
    Args = [ItemStr,
            InitPrice,
            OldPrice,
            NewPrice,
            MarginAcc,
            OldMargin,
            NewMargin,
            InitStock,
            OldStock,
            NewStock],
    LogText = util:flist(FmtStr, Args),
    log:market_gold_server(log_market_gold_server,
                           Pltm,
                           ZoneId,
                           Title,
                           LogText),
    ok.

log_purchs_text(Loss,
                #item{base_id = BaseId, quantity = Num},
                {InitPirce, Price, CurPrice, Margin}) ->
    GoldStr = log:item_str(Loss),
    ItemStr = log:item_str({BaseId, Num}),
    Info = log_extra_info([{init_price, InitPirce},
                           {cur_price, CurPrice},
                           {price, Price},
                           {margin, Margin},
                           {base_id, BaseId},
                           {num, Num}],
                          []),
    InfoStr = json:encode(Info),
    util:flist("~ts$$~ts$$~ts",
               [GoldStr, ItemStr, InfoStr]).

log_sold_out_text(Loss = {BaseId, Num}, Gain,
                  #calc_sold_price{type = Type, price = Price,
                                   discount = Discount,
                                   exchange_num = ExchangeNum,
                                   exchange_base_id = ExchangeBaseId,
                                   init_price = InitPirce},
                  {CurPrice, NewMargin, _}) ->
    LossStr = log:item_str(Loss),
    GainStr = log:item_str(Gain),
    DefList = [{base_id, BaseId},
               {num, Num},
               {price, Price},
               {cur_price, CurPrice},
               {margin, NewMargin},
               {init_price, InitPirce}],
    List = case Type of
               2 -> [{discount, Discount}];
               4 ->
                   [{exchange_num, ExchangeNum},
                    {exchange_base_id, ExchangeBaseId}];
               _ -> []
           end,
    Info = log_extra_info(List ++ DefList, []),
    InfoStr = json:encode(Info),
    util:flist("~ts$$~ts$$~ts",
               [LossStr, GainStr, InfoStr]).

log_extra_info([], StructJson) -> {struct, StructJson};
log_extra_info([{price, Val} | Rest], StructJson) ->
    log_extra_info(Rest, [{<<"price">>, Val} | StructJson]);
log_extra_info([{init_price, Val} | Rest],
               StructJson) ->
    log_extra_info(Rest,
                   [{<<"init_price">>, Val} | StructJson]);
log_extra_info([{cur_price, Val} | Rest], StructJson) ->
    log_extra_info(Rest,
                   [{<<"cur_price">>, Val} | StructJson]);
log_extra_info([{margin, Val} | Rest], StructJson) ->
    log_extra_info(Rest,
                   [{<<"margin">>, Val} | StructJson]);
log_extra_info([{base_id, Val} | Rest], StructJson) ->
    log_extra_info(Rest,
                   [{<<"base_id">>, Val} | StructJson]);
log_extra_info([{num, Val} | Rest], StructJson) ->
    log_extra_info(Rest, [{<<"num">>, Val} | StructJson]);
log_extra_info([{discount, Val} | Rest], StructJson) ->
    log_extra_info(Rest,
                   [{<<"discount">>, Val} | StructJson]);
log_extra_info([{exchange_num, Val} | Rest],
               StructJson) ->
    log_extra_info(Rest,
                   [{<<"exchange_num">>, Val} | StructJson]);
log_extra_info([{exchange_base_id, Val} | Rest],
               StructJson) ->
    log_extra_info(Rest,
                   [{<<"exchange_base_id">>, Val} | StructJson]);
log_extra_info([_H | Rest], StructJson) ->
    log_extra_info(Rest, StructJson).

get_price(BaseId) ->
    case lookup(market_gold_item_tab, BaseId) of
        #market_gold_item{init_price = InitPirce,
                          margin = Margin} ->
            case market_gold_data:get_const_price(BaseId) of
                Discount when is_integer(Discount) ->
                    Price1 = calc_price(4, BaseId, InitPirce, Margin),
                    util:floor(Price1 * Discount / 1000);
                _False ->
                    Price1 = calc_price(4, BaseId, InitPirce, Margin),
                    util:floor(Price1 * 9.0e-1)
            end;
        _ ->
            case market_gold_data:get_invisible_price(BaseId) of
                SalePrice when is_integer(SalePrice) -> SalePrice;
                _False ->
                    case market_gold_data:get_exchange_item(BaseId) of
                        {ExchangBaseId, ExchangNum} ->
                            case lookup(market_gold_item_tab, ExchangBaseId) of
                                #market_gold_item{margin = Margin,
                                                  init_price = InitPirce} ->
                                    UnitPrice = calc_price(4,
                                                           ExchangBaseId,
                                                           InitPirce,
                                                           Margin),
                                    case
                                        market_gold_data:get_const_price(ExchangBaseId)
                                        of
                                        ExchangDiscount
                                            when is_integer(ExchangDiscount) ->
                                            util:floor(ExchangDiscount / 1000 *
                                                           UnitPrice)
                                                * ExchangNum;
                                        _False ->
                                            util:floor(9.0e-1 * UnitPrice) *
                                                ExchangNum
                                    end;
                                _ ->
                                    logger:error("未找到金币市场数据[Id:~w]",
                                                 [BaseId],
                                                 market_gold,
                                                 1360),
                                    0
                            end;
                        _False -> 0
                    end
            end
    end.

