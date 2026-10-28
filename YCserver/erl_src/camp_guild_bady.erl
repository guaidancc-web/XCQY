-file("src/mod/campaign/camp_guild_bady.erl", 1).

-module(camp_guild_bady).

-behaviour(gen_fsm).

-export([start_link/0,
         cast/1,
         call/1,
         info/1,
         reload/0,
         fire/3,
         guild_reward/2,
         push/1,
         m/0]).

-export([idel/2, active/2]).

-export([init/1,
         handle_event/3,
         handle_sync_event/4,
         handle_info/3,
         terminate/3,
         code_change/4]).

-record(state,
        {min = 0, rank = 0, rank_list = [], ts, timeout}).

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

-file("src/mod/campaign/camp_guild_bady.erl", 38).

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

-file("src/mod/campaign/camp_guild_bady.erl", 39).

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

-file("src/mod/campaign/camp_guild_bady.erl", 40).

-file("inc/camp_guild_bady.hrl", 1).

-record(camp_guild_bady,
        {id = {0, "", 0},
         name = "",
         sex = 0,
         classes = 0,
         lev = 0,
         guild_id = {0, "", 0},
         guild_name = "",
         score = 0,
         is_bady = 0,
         photo = 0,
         photo_auditing = 0,
         mtime = 0}).

-record(camp_guild_bady_rank,
        {rank = 0,
         id = {0, "", 0},
         name = "",
         sex = 0,
         classes = 0,
         lev = 0,
         guild_id = {0, "", 0},
         guild_name = "",
         score = 0,
         photo = 0,
         photo_auditing = 0,
         mtime = 0}).

-record(camp_guild_bady_data,
        {rank = 0,
         role_reward = [],
         guild_reward = [],
         honor = 0}).

-file("src/mod/campaign/camp_guild_bady.erl", 41).

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

-file("src/mod/campaign/camp_guild_bady.erl", 42).

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

-file("src/mod/campaign/camp_guild_bady.erl", 43).

start_link() ->
    gen_fsm:start_link({local, camp_guild_bady},
                       camp_guild_bady,
                       [],
                       []).

-spec m() -> ok.

m() ->
    logger:info("有人输入了下阶段", [], camp_guild_bady, 55),
    gen_fsm:send_event(camp_guild_bady, timeout).

push(Pid) -> cast({push, Pid}).

info(Info) -> camp_guild_bady ! Info.

cast(Event) ->
    gen_fsm:send_all_state_event(camp_guild_bady, Event).

call(Event) ->
    try gen_fsm:sync_send_all_state_event(camp_guild_bady,
                                          Event)
    catch
        _Type:_Reason ->
            logger:debug("Type: ~w  Reason: ~w",
                         [_Type, _Reason],
                         camp_guild_bady,
                         76),
            {error, timeout}
    end.

fire(Label = add_score, Zone, AddScore) ->
    case conver(Zone) of
        {ok, CampGuildBady} ->
            cast({Label,
                  CampGuildBady#camp_guild_bady{score = AddScore}});
        _ -> ignore
    end;
fire(change_post, #guild_role{id = RoleId, post = 25},
     Args) ->
    cast({change_post_baby, RoleId, Args});
fire(change_post, #guild_role{id = RoleId, post = Post},
     #{old := #guild_role{post = 25}})
    when Post =/= 25 ->
    cast({change_post_other, RoleId});
fire(change_post, _, _) -> ok;
fire(leave_guild, RoleId, _Name) ->
    cast({leave_guild, RoleId});
fire(new_guild, RoleId, Args) ->
    cast({new_guild, RoleId, Args});
fire(photo_auditing, RoleId, Args) ->
    cast({photo_auditing, RoleId, Args});
fire(photo_del, RoleId, _) -> cast({photo_del, RoleId});
fire(_, _, _) -> ok.

conver(#role{id = RoleId, sex = Sex = 0, lev = Lev,
             classes = Classes, name = Name, m_guild = MGuild}) ->
    {GId, GName} = case MGuild of
                       #m_guild{id = TmpGuild, name = TmpGName} ->
                           {TmpGuild, TmpGName};
                       _ -> {{0, "", 0}, ""}
                   end,
    Now = date:unixtime(),
    {ok,
     #camp_guild_bady{id = RoleId, name = Name, sex = Sex,
                      classes = Classes, lev = Lev, guild_id = GId,
                      guild_name = GName, mtime = Now}};
conver(#role{}) -> false;
conver({#guild_role{id = RoleId, sex = Sex = 0,
                    lev = Lev, post = Post, classes = Classes, name = Name},
        GId,
        GName}) ->
    IsBaby = case Post of
                 25 -> 1;
                 _ -> 0
             end,
    Now = date:unixtime(),
    {ok,
     #camp_guild_bady{id = RoleId, name = Name, sex = Sex,
                      classes = Classes, lev = Lev, guild_id = GId,
                      guild_name = GName, mtime = Now, is_bady = IsBaby}};
conver(#friend_zone{id = RoleId, sex = Sex = 0,
                    lev = Lev, classes = Classes, name = Name,
                    guild = GuildName, photo = Photo,
                    photo_auditing = PhotoAuditing}) ->
    Now = date:unixtime(),
    {ok,
     #camp_guild_bady{id = RoleId, name = Name, sex = Sex,
                      classes = Classes, lev = Lev, guild_name = GuildName,
                      mtime = Now, photo = Photo,
                      photo_auditing = PhotoAuditing}};
conver(_) -> false.

guild_reward(#guild{members = Members}, Args) ->
    guild_reward(Members, Args),
    ok;
guild_reward([], _) -> ok;
guild_reward([#guild_role{id = RoleId} | T],
             Args = #{role_id := RoleId}) ->
    guild_reward(T, Args);
guild_reward([#guild_role{post = 0} | T], Args) ->
    guild_reward(T, Args);
guild_reward([#guild_role{last_login = LastLogin} | T],
             Args = #{now := Now})
    when LastLogin + 48 * 3600 < Now ->
    guild_reward(T, Args);
guild_reward([#guild_role{id = Id} | T],
             Args = #{name := Name, rank := Rank,
                      reward := Reward}) ->
    mail:send(Id,
              lang:get("星辰宝贝活动"),
              notice:format(lang:get("可喜可贺！我们公会的宝贝~ts在星辰宝贝排行榜活动中获得第~ts名，作为同一个公会的成员，"
                                     "这是你的奖励！"),
                            [{role_2, Name}, {string_2, 5, Rank}]),
              Reward),
    guild_reward(T, Args).

reload() ->
    camp_guild_bady ! reload,
    ok.

init([]) ->
    logger:info("开始启动...", [], camp_guild_bady, 162),
    process_flag(trap_exit, true),
    dets:open_file(camp_guild_bady,
                   [{file, "./dets/camp_guild_bady.dets"},
                    {keypos, #camp_guild_bady.id}]),
    ets:new(camp_guild_bady,
            [set,
             named_table,
             public,
             {keypos, #camp_guild_bady.id}]),
    dets:to_ets(camp_guild_bady, camp_guild_bady),
    NewRankList = case env:get(camp_guild_bady_rank) of
                      undefined ->
                          env:save(camp_guild_bady_rank, []),
                          [];
                      RankList -> RankList
                  end,
    {Num, Min} = load_rank(NewRankList, 0, 0),
    {StateName, TimeLeft} = get_idle_time(),
    NewState = #state{ts = date:now2(), timeout = TimeLeft,
                      rank = Num, min = Min, rank_list = NewRankList},
    logger:info("启动完成", [], camp_guild_bady, 177),
    {ok, StateName, NewState}.

handle_event({add_score,
              CampGuildBady = #camp_guild_bady{id = RoleId,
                                               name = Name, lev = Lev,
                                               guild_name = GuildName,
                                               score = AddScore, mtime = MTime,
                                               photo = Photo,
                                               photo_auditing = PhotoAuditing}},
             StateName = active, State) ->
    {NGid, IsBaby} = case guild_mgr:info(by_name, GuildName)
                         of
                         {ok, #guild{id = GId, members = Members}} ->
                             case lists:keyfind(RoleId, #guild_role.id, Members)
                                 of
                                 #guild_role{post = 25} -> {GId, 1};
                                 _ -> {GId, 0}
                             end;
                         _ -> {{0, "", 0}, 0}
                     end,
    NewData = case lookup(camp_guild_bady, RoleId) of
                  Old = #camp_guild_bady{score = Score} ->
                      Data = Old#camp_guild_bady{id = RoleId, name = Name,
                                                 guild_id = NGid,
                                                 is_bady = IsBaby, lev = Lev,
                                                 photo = Photo,
                                                 photo_auditing = PhotoAuditing,
                                                 guild_name = GuildName,
                                                 score = AddScore + Score,
                                                 mtime = MTime},
                      update_data(camp_guild_bady, Data),
                      Data;
                  _ ->
                      Data = CampGuildBady#camp_guild_bady{guild_id = NGid,
                                                           is_bady = IsBaby},
                      update_data(camp_guild_bady, Data),
                      Data
              end,
    case IsBaby of
        1 when Photo > 0 andalso PhotoAuditing == 1 ->
            cast({in_rank, NewData});
        _ -> ignore
    end,
    continue(StateName, State);
handle_event({in_rank,
              #camp_guild_bady{id = RoleId, name = Name, sex = Sex,
                               classes = Classes, lev = Lev, guild_id = GuildId,
                               guild_name = GuildName, score = Score,
                               is_bady = 1, mtime = MTime, photo = Photo,
                               photo_auditing = PhotoAuditing = 1}},
             StateName = active,
             State = #state{rank_list = RankList})
    when Photo > 0 ->
    R = #camp_guild_bady_rank{id = RoleId, name = Name,
                              sex = Sex, classes = Classes, lev = Lev,
                              guild_id = GuildId, guild_name = GuildName,
                              score = Score, mtime = MTime, photo = Photo,
                              photo_auditing = PhotoAuditing},
    NRankList = lists:keystore(RoleId,
                               #camp_guild_bady_rank.id,
                               RankList,
                               R),
    NRankList2 = util:keys_sort([#camp_guild_bady_rank.lev,
                                 {asc, #camp_guild_bady_rank.mtime},
                                 #camp_guild_bady_rank.score],
                                NRankList),
    ShowNum = camp_guild_bady_data:get(show_num),
    NRankList3 = lists:sublist(NRankList2, ShowNum * 2),
    NewRankList = set_rank(NRankList3, 1, []),
    env:save(camp_guild_bady_rank, NewRankList),
    continue(StateName,
             State#state{rank_list = NewRankList});
handle_event({del_rank, RoleId}, StateName = active,
             State = #state{rank_list = RankList}) ->
    NRankList = lists:keydelete(RoleId,
                                #camp_guild_bady_rank.id,
                                RankList),
    NRankList2 = util:keys_sort([#camp_guild_bady_rank.lev,
                                 {asc, #camp_guild_bady_rank.mtime},
                                 #camp_guild_bady_rank.score],
                                NRankList),
    ShowNum = camp_guild_bady_data:get(show_num),
    NRankList3 = lists:sublist(NRankList2, ShowNum * 2),
    NewRankList = set_rank(NRankList3, 1, []),
    env:save(camp_guild_bady_rank, NewRankList),
    continue(StateName,
             State#state{rank_list = NewRankList});
handle_event({change_post_baby,
              RoleId,
              #{guild_id := GuildId, guild_name := GuildName}},
             StateName, State) ->
    case lookup(camp_guild_bady, RoleId) of
        Old = #camp_guild_bady{photo = Photo,
                               photo_auditing = PhotoAuditing} ->
            Data = Old#camp_guild_bady{is_bady = 1,
                                       guild_id = GuildId,
                                       guild_name = GuildName},
            update_data(camp_guild_bady, Data),
            case Photo > 0 andalso PhotoAuditing == 1 of
                true -> cast({in_rank, Data});
                _ -> ignore
            end;
        _ -> ignore
    end,
    continue(StateName, State);
handle_event({photo_auditing,
              RoleId,
              #{photo := Photo, photo_auditing := PhotoAuditing}},
             StateName = active, State) ->
    case lookup(camp_guild_bady, RoleId) of
        Old = #camp_guild_bady{is_bady = IsBaby} ->
            Data = Old#camp_guild_bady{photo = Photo,
                                       photo_auditing = PhotoAuditing},
            update_data(camp_guild_bady, Data),
            case Photo > 0 andalso PhotoAuditing == 1 of
                true when IsBaby == 1 -> cast({in_rank, Data});
                _ -> cast({del_rank, RoleId})
            end;
        _ -> ignore
    end,
    continue(StateName, State);
handle_event({photo_del, RoleId}, StateName = active,
             State) ->
    case lookup(camp_guild_bady, RoleId) of
        Old = #camp_guild_bady{} ->
            Data = Old#camp_guild_bady{photo = 0,
                                       photo_auditing = 0},
            update_data(camp_guild_bady, Data),
            cast({del_rank, RoleId});
        _ -> ignore
    end,
    continue(StateName, State);
handle_event({change_post_other, RoleId}, StateName,
             State) ->
    case lookup(camp_guild_bady, RoleId) of
        Old = #camp_guild_bady{} ->
            Data = Old#camp_guild_bady{is_bady = 0},
            update_data(camp_guild_bady, Data),
            cast({del_rank, RoleId});
        _ -> ignore
    end,
    continue(StateName, State);
handle_event({leave_guild, RoleId}, StateName, State) ->
    case lookup(camp_guild_bady, RoleId) of
        Old = #camp_guild_bady{} ->
            Data = Old#camp_guild_bady{is_bady = 0,
                                       guild_id = {0, "", 0}, guild_name = ""},
            update_data(camp_guild_bady, Data),
            cast({del_rank, RoleId});
        _ -> ignore
    end,
    continue(StateName, State);
handle_event({new_guild,
              RoleId,
              #{guild_id := GuildId, guild_name := GuildName}},
             StateName, State) ->
    case lookup(camp_guild_bady, RoleId) of
        Old = #camp_guild_bady{} ->
            Data = Old#camp_guild_bady{is_bady = 0,
                                       guild_id = GuildId,
                                       guild_name = GuildName},
            update_data(camp_guild_bady, Data),
            cast({del_rank, RoleId});
        _ -> ignore
    end,
    continue(StateName, State);
handle_event({push, Pid}, StateName = active,
             State = #state{rank_list = RankList}) ->
    ShowNum = camp_guild_bady_data:get(show_num),
    List = show(lists:sublist(RankList, ShowNum), []),
    role:pack_send(Pid, 14005, {List}),
    continue(StateName, State);
handle_event({push, Pid}, StateName, State) ->
    role:pack_send(Pid, 14005, {[]}),
    continue(StateName, State);
handle_event(_Event, StateName, State) ->
    continue(StateName, State).

handle_sync_event(_Event, _From, StateName, State) ->
    Reply = ok,
    continue(StateName, Reply, State).

handle_info(reload, _StateName, State) ->
    {StateName, TimeLeft} = get_idle_time(),
    {next_state,
     StateName,
     State#state{ts = date:now2(), timeout = TimeLeft},
     TimeLeft};
handle_info(_Info, StateName, State) ->
    continue(StateName, State).

terminate(_Reason, _StateName, _State) -> ok.

code_change(_OldVsn, StateName, State, _Extra) ->
    {ok, StateName, State}.

idel(timeout, State) ->
    {StateName, TimeLeft} = get_idle_time(),
    ets:delete_all_objects(camp_guild_bady),
    dets:delete_all_objects(camp_guild_bady),
    env:save(camp_guild_bady_rank, []),
    continue(StateName,
             State#state{ts = date:now2(), timeout = TimeLeft,
                         rank_list = []});
idel(_Any, State) -> continue(idel, State).

active(timeout, State) ->
    case env:get(camp_guild_bady_rank) of
        List = [_ | _] ->
            Now = date:unixtime(),
            NewList = rank_reward(List, Now, []),
            guild_rank_reward(NewList, Now);
        _Err ->
            logger:info("公会宝贝没有人参加活动：~w",
                        [_Err],
                        camp_guild_bady,
                        363)
    end,
    {_, TimeLeft} = get_idle_time(),
    ets:delete_all_objects(camp_guild_bady),
    dets:delete_all_objects(camp_guild_bady),
    env:save(camp_guild_bady_rank, []),
    continue(idel,
             State#state{ts = date:now2(), timeout = TimeLeft,
                         rank_list = []});
active(_Any, State) -> continue(idel, State).

get_idle_time() ->
    Now = date:unixtime(),
    {StartTime, EndTime} = case
                               campaign_mgr:get_camp_time(60004)
                               of
                               {-1, -1} ->
                                   {date:datetime_to_seconds({{2016, 3, 29},
                                                              {0, 0, 0}}),
                                    date:datetime_to_seconds({{2016, 3, 29},
                                                              {0, 0, 0}})};
                               {S, E} -> {S, E};
                               _ ->
                                   {date:datetime_to_seconds({{2016, 3, 29},
                                                              {0, 0, 0}}),
                                    date:datetime_to_seconds({{2016, 3, 29},
                                                              {0, 0, 0}})}
                           end,
    if Now < StartTime ->
           {idel, max((StartTime - Now) * 1000, 1)};
       Now >= StartTime andalso Now < EndTime ->
           {active, (EndTime - Now) * 1000};
       true -> {idel, date:next_diff(0) * 1000}
    end.

set_rank([], _, List) -> lists:reverse(List);
set_rank([I | T], R, List) ->
    set_rank(T,
             R + 1,
             [I#camp_guild_bady_rank{rank = R} | List]).

rank_reward([], _Now, List) -> List;
rank_reward([I = #camp_guild_bady_rank{rank = Rank,
                                       id = RoleId, name = Name,
                                       guild_id = GuildId,
                                       guild_name = GuildName, score = Score}
             | T],
            Now, List) ->
    case camp_guild_bady_data:get_reward(Rank) of
        #camp_guild_bady_data{role_reward = RoleReward,
                              guild_reward = GuildReward, honor = Honor} ->
            case Honor of
                0 -> ignore;
                _ ->
                    honor_mgr:del(camp_guild_bady_rank, RoleId),
                    honor_mgr:add(camp_guild_bady_rank, {RoleId, Honor}, 0)
            end,
            logger:info("公会个人宝贝：名次：~w;role_id:~w;name:~ts;guildId:~w;g"
                        "uildName:~ts;人气:~w;个人奖励:~w;公会奖励:~w",
                        [Rank,
                         RoleId,
                         Name,
                         GuildId,
                         GuildName,
                         Score,
                         RoleReward,
                         GuildReward],
                        camp_guild_bady,
                        408),
            mail:send(RoleId,
                      util:flist(lang:get("星辰宝贝第~w名"), [Rank]),
                      notice:format(lang:get("恭喜你！星辰宝贝排行榜活动中获得第~ts名，继续保持哦！"),
                                    [{string_2, 5, Rank}]),
                      RoleReward);
        _ -> ignore
    end,
    NewList = case lists:keyfind(GuildId,
                                 #camp_guild_bady_rank.guild_id,
                                 List)
                  of
                  false -> [I | List];
                  #camp_guild_bady_rank{rank = OldRank}
                      when OldRank > Rank ->
                      [I | lists:keydelete(GuildId,
                                           #camp_guild_bady_rank.guild_id,
                                           List)];
                  _ -> List
              end,
    rank_reward(T, Now, NewList).

guild_rank_reward([], _Now) -> ok;
guild_rank_reward([#camp_guild_bady_rank{rank = Rank,
                                         id = RoleId, name = Name,
                                         guild_id = GuildId,
                                         guild_name = GuildName, score = Score}
                   | T],
                  Now) ->
    case camp_guild_bady_data:get_reward(Rank) of
        #camp_guild_bady_data{guild_reward = GuildReward} ->
            logger:info("公会公会宝贝：名次：~w;role_id:~w;name:~ts;guildId:~w;g"
                        "uildName:~ts;人气:~w;公会奖励:~w",
                        [Rank,
                         RoleId,
                         Name,
                         GuildId,
                         GuildName,
                         Score,
                         GuildReward],
                        camp_guild_bady,
                        429),
            guild:apply(async,
                        GuildId,
                        {camp_guild_bady,
                         guild_reward,
                         [#{role_id => RoleId, name => Name, rank => Rank,
                            now => Now, reward => GuildReward}]});
        _ -> ignore
    end,
    guild_rank_reward(T, Now).

load_rank([], Num, Min) -> {Num, Min};
load_rank([#camp_guild_bady_rank{score = Score} | T],
          Num, 0) ->
    load_rank(T, Num + 1, Score);
load_rank([#camp_guild_bady_rank{score = Score} | T],
          Num, Min) ->
    load_rank(T, Num + 1, min(Score, Min)).

lookup(Tab, RoleId) ->
    case ets:lookup(Tab, RoleId) of
        [] -> false;
        [R | _] -> R
    end.

update_data(Tab, R) ->
    update_ets(Tab, R),
    update_dets(Tab, R).

update_ets(Tab, Data) -> ets:insert(Tab, Data).

update_dets(Tab, Data) -> dets:insert(Tab, Data).

show([], List) -> List;
show([#camp_guild_bady_rank{rank = Rank, id = RoleId,
                            name = Name, photo = Photo,
                            photo_auditing = PhotoAuditing, sex = Sex,
                            classes = Classes, lev = Lev, guild_id = GuildId,
                            guild_name = GuildName, score = Score}
      | T],
     List) ->
    Info = case camp_guild_bady_data:get_reward(Rank) of
               #camp_guild_bady_data{role_reward = RoleReward,
                                     guild_reward = GuildReward,
                                     honor = Honor} ->
                   {Rank,
                    RoleId,
                    Name,
                    Sex,
                    Classes,
                    Lev,
                    Photo,
                    PhotoAuditing,
                    GuildId,
                    GuildName,
                    Score,
                    RoleReward,
                    GuildReward,
                    Honor};
               _ ->
                   {Rank,
                    RoleId,
                    Name,
                    Sex,
                    Classes,
                    Lev,
                    Photo,
                    PhotoAuditing,
                    GuildId,
                    GuildName,
                    Score,
                    [],
                    [],
                    0}
           end,
    show(T, [Info | List]).

continue(StateName,
         State = #state{ts = Ts, timeout = Tidle}) ->
    {next_state,
     StateName,
     State,
     util:time_left(Tidle, Ts)}.

continue(StateName, Reply,
         State = #state{ts = Ts, timeout = Tidle}) ->
    {reply,
     Reply,
     StateName,
     State,
     util:time_left(Tidle, Ts)}.

