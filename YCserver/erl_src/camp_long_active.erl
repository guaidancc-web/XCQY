-file("src/mod/campaign/camp_long_active.erl", 1).

-module(camp_long_active).

-file("inc/camp_long_active.hrl", 1).

-file("src/mod/campaign/camp_long_active.erl", 13).

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

-file("src/mod/campaign/camp_long_active.erl", 14).

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

-file("src/mod/campaign/camp_long_active.erl", 15).

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

-file("src/mod/campaign/camp_long_active.erl", 16).

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

-file("src/mod/campaign/camp_long_active.erl", 17).

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

-file("src/mod/campaign/camp_long_active.erl", 18).

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

-file("src/mod/campaign/camp_long_active.erl", 19).

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

-file("src/mod/campaign/camp_long_active.erl", 20).

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

-file("src/mod/campaign/camp_long_active.erl", 21).

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

-file("src/mod/campaign/camp_long_active.erl", 22).

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

-file("src/mod/campaign/camp_long_active.erl", 23).

-export([init/0,
         reload/0,
         zero_flush/2,
         login/1,
         send_mail/2,
         commit/2,
         update_val/1,
         check_commit/1,
         evt_callback/2,
         lev_up/1,
         push/1,
         push_has_get_reward/1,
         push_quest/1,
         rpc_buy_token/2,
         rpc_get_week_box/1,
         rpc_buy_lev/2,
         rpc_get_lev_reward/3,
         rpc_get_all_reward/1,
         repare_login/0]).

init() -> #camp_long_active{}.

evt_callback(#evt_levup{old_lev = OldLev, lev = NewLev},
             Role)
    when NewLev >= 30 andalso OldLev =< 30 ->
    case get(camp_long_active_levup) of
        V when is_tuple(V) ->
            Role1 = role_trigger:del(V, Role),
            erase(camp_long_active_levup),
            login(Role1);
        _ -> login(Role)
    end;
evt_callback(_Evt, _) -> ok.

reload() ->
    case check_is_open() of
        {true, CampId} ->
            role_group:apply(world,
                             {camp_long_active, zero_flush, [CampId]});
        false -> ok
    end.

zero_flush(#role{lev = Lev}, _) when Lev < 30 -> ok;
zero_flush(Role = #role{m_campaign =
                            #m_campaign{camp_long_active =
                                            #camp_long_active{id = CampId}}},
           CampId) ->
    QuestRole = do_zero_flush(Role),
    push(QuestRole),
    push_quest(QuestRole),
    {ok, QuestRole};
zero_flush(Role, _) -> login(Role).

lev_up(Role = #role{lev = Lev}) when Lev =< 30 ->
    case add_trigger(Role) of
        ok -> Role;
        {ok, NRole} -> NRole
    end;
lev_up(Role) -> Role.

login(Role = #role{lev = Lev}) when Lev < 30 ->
    add_trigger(Role);
login(Role = #role{m_campaign =
                       #m_campaign{camp_long_active =
                                       #camp_long_active{id = OldId,
                                                         last_reset_time =
                                                             LastReset}},
                   assets = Assets}) ->
    RepaireRole = deal_repare(Role),
    CampLongActive =
        (RepaireRole#role.m_campaign)#m_campaign.camp_long_active,
    case check_is_open() of
        {true, OldId} ->
            do_login(RepaireRole),
            case date:is_same_day(LastReset, date:unixtime()) of
                true -> {ok, RepaireRole};
                _ ->
                    NRole = do_zero_flush(RepaireRole),
                    {ok, NRole}
            end;
        {true, NewId} ->
            case camp_long_active_data:get_config(NewId) of
                {FreeId, _, _} ->
                    NewAssets = Assets#assets{long_active = 0,
                                              long_score = 0},
                    AssetsRole = RepaireRole#role{assets = NewAssets},
                    Role1 = change_m_camp(AssetsRole,
                                          #camp_long_active{id = NewId,
                                                            token_list =
                                                                [FreeId]}),
                    do_login(Role1),
                    Role2 = do_zero_flush(Role1),
                    {ok, Role2};
                _ ->
                    logger:error("战令活动id配置有误", [], camp_long_active, 109),
                    {ok, RepaireRole}
            end;
        false ->
            case OldId of
                0 -> ok;
                _ ->
                    TimeRole = role_timer:add(#timer{id = camp_long_active,
                                                     timeout = 1 * 1000,
                                                     m = camp_long_active,
                                                     f = send_mail,
                                                     a = [CampLongActive],
                                                     times = 1},
                                              RepaireRole),
                    {ok, Role1} = quest:del_sec_type(TimeRole, 35),
                    NRole = change_m_camp(Role1,
                                          CampLongActive#camp_long_active{id =
                                                                              0}),
                    {ok, NRole}
            end
    end.

send_mail(Role,
          #camp_long_active{lev = Lev, token_list = Tokens,
                            reward_levs = RewardLevs}) ->
    Items = lists:foldl(fun (Id, Rtn) ->
                                {_, MaxLev} =
                                    camp_long_active_data:get_token(Id),
                                NLev = min(MaxLev, Lev),
                                CanDraws = case lists:keyfind(Id, 1, RewardLevs)
                                               of
                                               {_, Rewards} ->
                                                   lists:seq(1, NLev) --
                                                       Rewards;
                                               _ -> lists:seq(1, NLev)
                                           end,
                                get_token_rewards(Role, Id, CanDraws) ++ Rtn
                        end,
                        [],
                        Tokens),
    {Title, Content} = case
                           camp_long_active_data:get_mail(1)
                           of
                           {_, _Title, _Content} -> {_Title, _Content};
                           _ ->
                               {lang:get("遗失的战令活动奖励"), lang:get("活动结束，尚未领取的奖励")}
                       end,
    case Items of
        [] -> ok;
        _ ->
            mail:send(Role, Title, Content, Items),
            ok
    end.

commit(Role = #role{m_quest =
                        MQuest = #m_quest{quest_long_active =
                                              #quest_long_active{finish =
                                                                     Finish,
                                                                 doing =
                                                                     Doing}}},
       QuestId) ->
    logger:debug("~w========~w,~w",
                 [QuestId, Finish, Doing],
                 camp_long_active,
                 147),
    case camp_long_active_data:get_quest(QuestId) of
        {_, _ActiveExp, Reward} ->
            Rewards = [{Item, Bind, Num}
                       || {Item, Bind, Num, _} <- Reward],
            case lists:member(QuestId, Doing) of
                true ->
                    Gain = format:val_to_gain(Rewards),
                    NewFinish = [QuestId | Finish],
                    NewDoing = lists:delete(QuestId, Doing),
                    NewQuest = MQuest#m_quest{quest_long_active =
                                                  #quest_long_active{finish =
                                                                         NewFinish,
                                                                     doing =
                                                                         NewDoing}},
                    Role1 = Role#role{m_quest = NewQuest},
                    push_quest(Role1),
                    case role_gain:do_notice(Gain, Role1) of
                        {ok, NewRole} ->
                            push(NewRole),
                            {ok, NewRole};
                        _ ->
                            Msg = lang:get("背包已满，奖励已通过邮件发放"),
                            notice:send(Role1, 1, Msg),
                            Title = lang:get("战令任务奖励"),
                            Content = lang:get("由于领取时背包已满，奖励通过邮件发放，请查收"),
                            mail:send(Role1, Title, Content, Rewards),
                            {ok, Role1}
                    end;
                false -> {ok, Role}
            end;
        _ -> {ok, Role}
    end.

push(#role{m_campaign =
               #m_campaign{camp_long_active =
                               #camp_long_active{id = 0}}}) ->
    ok;
push(#role{m_campaign =
               #m_campaign{camp_long_active =
                               #camp_long_active{lev = Lev, token_list = Tokens,
                                                 reward_levs = RewardLevs,
                                                 week_box = WeekBox}},
           assets = #assets{long_active = Val}}) ->
    Data = [begin
                {_, MaxLev} = camp_long_active_data:get_token(Id),
                NLev = min(MaxLev, Lev),
                case lists:keyfind(Id, 1, RewardLevs) of
                    {Id, Rewards} -> {Id, lists:seq(1, NLev) -- Rewards};
                    _ -> {Id, lists:seq(1, NLev)}
                end
            end
            || Id <- Tokens],
    Info = {Lev, Val, WeekBox, Data},
    logger:debug("~w", [Info], camp_long_active, 192),
    role:link_send(20485, Info),
    ok.

push_has_get_reward(#role{m_campaign =
                              #m_campaign{camp_long_active =
                                              #camp_long_active{id = 0}}}) ->
    ok;
push_has_get_reward(#role{m_campaign =
                              #m_campaign{camp_long_active =
                                              #camp_long_active{reward_levs =
                                                                    RewardLevs}}}) ->
    logger:debug("协议推送20495:~w",
                 [RewardLevs],
                 camp_long_active,
                 198),
    role:link_send(20495, {RewardLevs}).

push_quest(#role{m_campaign =
                     #m_campaign{camp_long_active =
                                     #camp_long_active{id = 0}}}) ->
    ok;
push_quest(#role{m_quest =
                     #m_quest{quest_long_active = QusetLongActive}}) ->
    role:link_send(10261, {QusetLongActive}),
    ok.

rpc_buy_token(#role{m_campaign =
                        #m_campaign{camp_long_active =
                                        #camp_long_active{id = 0}}},
              _) ->
    {false, lang:get("活动未开启，不能购买")};
rpc_buy_token(#role{m_campaign =
                        #m_campaign{camp_long_active =
                                        #camp_long_active{token_list =
                                                              Tokens}}},
              _)
    when length(Tokens) > 2 ->
    {false, lang:get("已经购买过高级战令，不能继续购买")};
rpc_buy_token(Role = #role{m_campaign =
                               #m_campaign{camp_long_active =
                                               CampLong = #camp_long_active{id =
                                                                                CampId,
                                                                            token_list
                                                                                =
                                                                                Tokens}}},
              Gold) ->
    TokenId = case camp_long_active_data:get_config(CampId)
                  of
                  {_, IdList, _} ->
                      lists:foldl(fun (Id, Rtn) ->
                                          case
                                              camp_long_active_data:get_token(Id)
                                              of
                                              {Gold, _} -> Id;
                                              _ -> Rtn
                                          end
                                  end,
                                  false,
                                  IdList);
                  _ -> false
              end,
    case TokenId of
        false ->
            logger:error("战令金额配置出错~p",
                         [Gold],
                         camp_long_active,
                         223),
            {false, lang:get("战令金额配置出错")};
        _ ->
            case lists:member(TokenId, Tokens) of
                true -> {false, lang:get("已经购买该战令，不能重复购买")};
                _ ->
                    NTokens = [TokenId | Tokens],
                    NRole = change_m_camp(Role,
                                          CampLong#camp_long_active{token_list =
                                                                        NTokens}),
                    push(NRole),
                    push_has_get_reward(NRole),
                    {ok, NRole}
            end
    end.

rpc_get_week_box(#role{m_campaign =
                           #m_campaign{camp_long_active =
                                           #camp_long_active{id = 0}}}) ->
    {false, lang:get("活动已结束，不能领取")};
rpc_get_week_box(#role{m_campaign =
                           #m_campaign{camp_long_active =
                                           #camp_long_active{week_box = 1}}}) ->
    {false, lang:get("本周宝箱已经领取过了，下周再来吧")};
rpc_get_week_box(Role = #role{m_campaign =
                                  #m_campaign{camp_long_active =
                                                  #camp_long_active{lev = _Lev,
                                                                    token_list =
                                                                        Tokens}}}) ->
    case length(Tokens) > 1 of
        true ->
            case camp_long_active_data:get_week_box() of
                [{WeekReward}] ->
                    Gain = format:val_to_gain(WeekReward),
                    case role_gain:do_notice(Gain, Role) of
                        {ok,
                         Role1 = #role{m_campaign =
                                           #m_campaign{camp_long_active =
                                                           CampLong}}} ->
                            Role3 = change_m_camp(Role1,
                                                  CampLong#camp_long_active{week_box
                                                                                =
                                                                                1}),
                            push(Role3),
                            {ok, Role3};
                        _ -> {false, lang:get("背包已满，请整理后再来")}
                    end;
                _Err ->
                    logger:error("每周宝箱配置异常~p",
                                 [_Err],
                                 camp_long_active,
                                 259),
                    {false, lang:get("噢噢，出现异常，请联系gm")}
            end;
        _ -> {false, lang:get("激活高级战令才可领取")}
    end.

rpc_buy_lev(#role{m_campaign =
                      #m_campaign{camp_long_active =
                                      #camp_long_active{id = 0}}},
            _) ->
    {false, lang:get("活动已结束，不能购买")};
rpc_buy_lev(Role = #role{m_campaign =
                             #m_campaign{camp_long_active =
                                             CampLongActive =
                                                 #camp_long_active{id = CampId,
                                                                   lev = Lev}}},
            LevNum) ->
    case get(camp_long_active_max_lev) of
        MaxLev when is_integer(MaxLev) andalso Lev >= MaxLev ->
            {false, lang:get("当前已满级，不可购买")};
        _ ->
            case camp_long_active_data:get_config(CampId) of
                {_, _, ExpRate} ->
                    case camp_long_active_data:buy_lev_box(LevNum) of
                        {Cost, Discount}
                            when is_list(Cost) andalso is_integer(Discount) ->
                            NCost = [{AssetsId, Num * Discount div 100}
                                     || {AssetsId, Num} <- Cost],
                            Exp = ExpRate * LevNum,
                            Gain = format:val_to_gain([{90068, Exp}]),
                            Loss = format:val_to_loss(NCost),
                            role:send_buff_begin(),
                            case role_gain:do_notice(Gain ++ Loss, Role) of
                                {ok, Role1} ->
                                    role:send_buff_flush(),
                                    push(Role1),
                                    catch log:long_active(Role,
                                                          buy_lev,
                                                          CampLongActive),
                                    {ok, Role1};
                                {false, #loss{}} ->
                                    role:send_buff_clean(),
                                    {false, lang:get("资金不足")};
                                _Err ->
                                    role:send_buff_clean(),
                                    logger:error("战令活动购买等级失败~p",
                                                 [_Err],
                                                 camp_long_active,
                                                 293),
                                    {false, lang:get("购买失败，请联系gm")}
                            end;
                        _ -> {false, lang:get("购买等级配置有误")}
                    end;
                _ -> {false, lang:get("活动配置有问题")}
            end
    end.

rpc_get_lev_reward(#role{m_campaign =
                             #m_campaign{camp_long_active =
                                             #camp_long_active{id = 0}}},
                   _, _) ->
    {false, lang:get("活动已结束，不能领取")};
rpc_get_lev_reward(#role{m_campaign =
                             #m_campaign{camp_long_active =
                                             #camp_long_active{lev = NowLev}}},
                   _, Lev)
    when Lev > NowLev ->
    {false, lang:get("等级不足，不能领取，继续加油升级吧")};
rpc_get_lev_reward(Role, Tokens, Lev)
    when is_integer(Lev) ->
    get_lev_reward(Role, Tokens, [Lev]).

get_lev_reward(_, _, []) -> false;
get_lev_reward(Role = #role{m_campaign =
                                #m_campaign{camp_long_active =
                                                CampLongActive =
                                                    #camp_long_active{token_list
                                                                          =
                                                                          Tokens,
                                                                      reward_levs
                                                                          =
                                                                          RewardLevs}}},
               TokenId, LevList) ->
    case lists:member(TokenId, Tokens) of
        true ->
            OldLevs = case lists:keyfind(TokenId, 1, RewardLevs) of
                          {_, TokenLevs} -> TokenLevs;
                          _ -> []
                      end,
            case LevList -- OldLevs of
                Levs = [_ | _] ->
                    NReward = get_token_rewards(Role, TokenId, Levs),
                    case NReward of
                        [] -> {false, lang:get("战令等级奖励配置有误")};
                        _ ->
                            Gain = format:val_to_gain(NReward),
                            role:send_buff_begin(),
                            {Role2 = #role{m_campaign =
                                               #m_campaign{camp_long_active =
                                                               CampLong}},
                             MailFlag} =
                                case role_gain:do_notice(Gain, Role) of
                                    {ok, Role1} ->
                                        role:send_buff_flush(),
                                        {Role1, false};
                                    _ ->
                                        role:send_buff_clean(),
                                        {Title, Content} = case
                                                               camp_long_active_data:get_mail(3)
                                                               of
                                                               {_,
                                                                _Title,
                                                                _Content} ->
                                                                   {_Title,
                                                                    _Content};
                                                               _ ->
                                                                   {lang:get("战令等级奖励"),
                                                                    lang:get("背包已满，奖励通过邮件发放")}
                                                           end,
                                        mail:send(Role,
                                                  Title,
                                                  Content,
                                                  NReward),
                                        {Role, true}
                                end,
                            NLevs = OldLevs ++ Levs,
                            NRewardLevs = lists:keystore(TokenId,
                                                         1,
                                                         RewardLevs,
                                                         {TokenId, NLevs}),
                            Role3 = change_m_camp(Role2,
                                                  CampLong#camp_long_active{reward_levs
                                                                                =
                                                                                NRewardLevs}),
                            push(Role3),
                            push_has_get_reward(Role3),
                            catch log:long_active(Role,
                                                  get_lev_reward,
                                                  CampLongActive),
                            case MailFlag of
                                true -> {ok, Role3, lang:get("背包已满，奖励通过邮件发放")};
                                _ -> {ok, Role3}
                            end
                    end;
                _ -> {false, lang:get("已经领取过该奖励，不能重复领取")}
            end;
        _ -> {false, lang:get("未激活该战令，不能领取")}
    end.

rpc_get_all_reward(#role{m_campaign =
                             #m_campaign{camp_long_active =
                                             #camp_long_active{id = 0}}}) ->
    {false, lang:get("活动已结束，不能领取")};
rpc_get_all_reward(Role = #role{m_campaign =
                                    #m_campaign{camp_long_active =
                                                    CampLongActive =
                                                        #camp_long_active{lev =
                                                                              Lev,
                                                                          token_list
                                                                              =
                                                                              Tokens,
                                                                          reward_levs
                                                                              =
                                                                              RewardLevs}}}) ->
    {NRole, MailFlag} = lists:foldl(fun (Id, {Rtn, F}) ->
                                            {_, MaxLev} =
                                                camp_long_active_data:get_token(Id),
                                            NLev = min(MaxLev, Lev),
                                            CanDraws = case lists:keyfind(Id,
                                                                          1,
                                                                          RewardLevs)
                                                           of
                                                           {_, Rewards} ->
                                                               lists:seq(1,
                                                                         NLev)
                                                                   -- Rewards;
                                                           _ ->
                                                               lists:seq(1,
                                                                         NLev)
                                                       end,
                                            case get_lev_reward(Rtn,
                                                                Id,
                                                                CanDraws)
                                                of
                                                {ok, NRtn} -> {NRtn, F};
                                                {ok, NRtn, _} -> {NRtn, 1};
                                                _ -> {Rtn, F}
                                            end
                                    end,
                                    {Role, 0},
                                    Tokens),
    catch log:long_active(Role,
                          get_all_reward,
                          CampLongActive),
    case NRole of
        Role -> ok;
        _ when MailFlag == 1 ->
            {ok, NRole, lang:get("背包已满，奖励通过邮件发放")};
        _ -> {ok, NRole}
    end.

update_val(Role = #role{assets =
                            #assets{long_active = Val},
                        m_campaign =
                            #m_campaign{camp_long_active =
                                            #camp_long_active{id = CampId,
                                                              lev = OldLev,
                                                              token_list =
                                                                  [TokenId]}}}) ->
    case camp_long_active_data:get_config(CampId) of
        {_, _, ExpRate} ->
            Lev = Val div ExpRate,
            case camp_long_active_data:get_token(TokenId) of
                {_, MaxLev}
                    when Lev >= MaxLev andalso OldLev < MaxLev ->
                    case camp_long_active_data:get_mail(2) of
                        {_, Title, Content} -> mail:send(Role, Title, Content);
                        _ -> ok
                    end;
                _ -> ok
            end,
            do_exchange_val(Role, Lev, Val);
        _ -> Role
    end;
update_val(Role = #role{assets =
                            #assets{long_active = Val},
                        m_campaign =
                            #m_campaign{camp_long_active =
                                            #camp_long_active{id = CampId}}}) ->
    case camp_long_active_data:get_config(CampId) of
        {_, _, ExpRate} ->
            Lev = Val div ExpRate,
            do_exchange_val(Role, Lev, Val);
        _ -> Role
    end.

check_commit(#role{m_campaign =
                       #m_campaign{camp_long_active =
                                       #camp_long_active{lev = _Lev}}}) ->
    true.

check_is_open() ->
    Now = date:unixtime(),
    case campaign_mgr:get_camp_info(60063) of
        #camp_cache{id = Id, start_time = StartTime,
                    end_time = EndTime}
            when StartTime =< Now andalso Now =< EndTime ->
            {true, Id};
        _ -> false
    end.

zone_cast(#role{name = Name}, [{ItemId, _, _} | _],
          IsCast)
    when IsCast =:= 1 ->
    case camp_long_active_data:get_other_info() of
        [{Content}] ->
            Msg = notice:format(Content,
                                [{role_2, Name}, {item_2, ItemId}]),
            notice:cast(all, 5, Msg);
        _ -> ok
    end;
zone_cast(_, _, _) -> ok.

get_token_rewards(Role = #role{lev = RLev, sex = RSex,
                               classes = RClasses},
                  TokenId, Levs) ->
    Rewards = [begin
                   case camp_long_active_data:get_token_reward({TokenId,
                                                                Lev})
                       of
                       {Rewards, IsCast} ->
                           Rewards1 = lists:foldl(fun ({ItemId, Bind, Num},
                                                       Acc) ->
                                                          [{ItemId, Bind, Num}
                                                           | Acc];
                                                      ({ItemId,
                                                        Bind,
                                                        Num,
                                                        LevMin,
                                                        LevMax},
                                                       Acc)
                                                          when LevMin =< RLev
                                                                   andalso
                                                                   RLev =<
                                                                       LevMax ->
                                                          [{ItemId, Bind, Num}
                                                           | Acc];
                                                      ({ItemId,
                                                        Bind,
                                                        Num,
                                                        LevMin,
                                                        LevMax,
                                                        Sex},
                                                       Acc)
                                                          when LevMin =< RLev
                                                                   andalso
                                                                   RLev =<
                                                                       LevMax
                                                                       andalso
                                                                       (Sex =:=
                                                                            RSex
                                                                            orelse
                                                                            Sex
                                                                                =:=
                                                                                2) ->
                                                          [{ItemId, Bind, Num}
                                                           | Acc];
                                                      ({ItemId,
                                                        Bind,
                                                        Num,
                                                        LevMin,
                                                        LevMax,
                                                        Sex,
                                                        Classes},
                                                       Acc)
                                                          when LevMin =< RLev
                                                                   andalso
                                                                   RLev =<
                                                                       LevMax
                                                                       andalso
                                                                       (Sex =:=
                                                                            RSex
                                                                            orelse
                                                                            Sex
                                                                                =:=
                                                                                2)
                                                                           andalso
                                                                           (Classes
                                                                                =:=
                                                                                RClasses
                                                                                orelse
                                                                                Classes
                                                                                    =:=
                                                                                    0) ->
                                                          [{ItemId, Bind, Num}
                                                           | Acc];
                                                      ({ItemId,
                                                        Bind,
                                                        Num,
                                                        LevMin,
                                                        LevMax,
                                                        Sex,
                                                        Classes,
                                                        _,
                                                        _},
                                                       Acc)
                                                          when LevMin =< RLev
                                                                   andalso
                                                                   RLev =<
                                                                       LevMax
                                                                       andalso
                                                                       (Sex =:=
                                                                            RSex
                                                                            orelse
                                                                            Sex
                                                                                =:=
                                                                                2)
                                                                           andalso
                                                                           (Classes
                                                                                =:=
                                                                                RClasses
                                                                                orelse
                                                                                Classes
                                                                                    =:=
                                                                                    0) ->
                                                          [{ItemId, Bind, Num}
                                                           | Acc];
                                                      (_, Acc) -> Acc
                                                  end,
                                                  [],
                                                  Rewards),
                           zone_cast(Role, Rewards1, IsCast),
                           Rewards1;
                       _ -> []
                   end
               end
               || Lev <- Levs],
    lists:flatten(Rewards).

do_zero_flush(Role = #role{m_campaign =
                               #m_campaign{camp_long_active =
                                               CampLong =
                                                   #camp_long_active{week_box =
                                                                         WeekBox,
                                                                     last_reset_time
                                                                         =
                                                                         LastTime}}}) ->
    QuestList = camp_long_active_data:get_quest_list(),
    {FixL, RandomL} = lists:foldl(fun (QuestId,
                                       {Rtn1, Rtn2}) ->
                                          case
                                              camp_long_active_data:get_quest(QuestId)
                                              of
                                              {1000, _, _} ->
                                                  {[QuestId | Rtn1], Rtn2};
                                              {Rate, _, _} ->
                                                  {Rtn1,
                                                   [{QuestId, Rate} | Rtn2]};
                                              _ -> {Rtn1, Rtn2}
                                          end
                                  end,
                                  {[], []},
                                  QuestList),
    RandL = [Id
             || {Id, _} <- util:rand_list_n(RandomL, 2, 3)],
    Quests = FixL ++ RandL,
    Role1 = case quest:del_sec_type(Role, 35) of
                {ok, TRole = #role{m_quest = MQ}} ->
                    TRole#role{m_quest =
                                   MQ#m_quest{quest_long_active =
                                                  #quest_long_active{}}};
                _ -> Role
            end,
    Fun = fun (QuestId, RtnRole) ->
                  case quest:callback_accept(RtnRole,
                                             QuestId,
                                             [condition, accept])
                      of
                      {ok,
                       AcceptRole = #role{m_quest =
                                              MQuest =
                                                  #m_quest{quest_long_active =
                                                               QuestLongActive =
                                                                   #quest_long_active{doing
                                                                                          =
                                                                                          Doing}}}} ->
                          NewDoing = [QuestId | Doing],
                          NewQuestLongActive =
                              QuestLongActive#quest_long_active{doing =
                                                                    NewDoing},
                          NewMQuest = MQuest#m_quest{quest_long_active =
                                                         NewQuestLongActive},
                          AcceptRole#role{m_quest = NewMQuest};
                      _Err ->
                          logger:debug("接受任务失败：~w 原因:~w",
                                       [QuestId, _Err],
                                       camp_long_active,
                                       503),
                          RtnRole
                  end
          end,
    Role2 = lists:foldl(Fun, Role1, Quests),
    Now = date:unixtime(),
    NWeekBox = case date:is_same_week(LastTime, Now) of
                   true -> WeekBox;
                   _ -> 0
               end,
    change_m_camp(Role2,
                  CampLong#camp_long_active{week_box = NWeekBox,
                                            last_reset_time = date:unixtime()}).

do_login(#role{m_campaign =
                   #m_campaign{camp_long_active =
                                   #camp_long_active{token_list = Tokens}}}) ->
    case get(camp_long_active_max_lev) of
        Num when is_integer(Num) -> ok;
        _ ->
            MaxLev = lists:max([begin
                                    case camp_long_active_data:get_token(Id) of
                                        {_, _Lev} -> _Lev;
                                        _ -> 0
                                    end
                                end
                                || Id <- Tokens]),
            put(camp_long_active_max_lev, MaxLev)
    end.

change_m_camp(Role = #role{m_campaign =
                               MCamp = #m_campaign{}},
              NCampLongActive = #camp_long_active{}) ->
    NMCamp = MCamp#m_campaign{camp_long_active =
                                  NCampLongActive},
    Role#role{m_campaign = NMCamp}.

add_trigger(Role) ->
    case check_is_open() of
        {true, _} ->
            case get(camp_long_active_levup) of
                V when is_tuple(V) -> ok;
                _ ->
                    {TriId, NRole} = role_trigger:add(#trigger{label =
                                                                   evt_levup,
                                                               m =
                                                                   camp_long_active,
                                                               f = evt_callback,
                                                               a = []},
                                                      Role),
                    put(camp_long_active_levup, TriId),
                    {ok, NRole}
            end;
        _ -> ok
    end.

do_exchange_val(Role = #role{id = RoleId,
                             assets = Assets,
                             m_campaign =
                                 #m_campaign{camp_long_active =
                                                 CampLong = #camp_long_active{id
                                                                                  =
                                                                                  Id}}},
                Lev, Val) ->
    case get(camp_long_active_max_lev) of
        MaxLev when is_integer(MaxLev) andalso Lev > MaxLev ->
            {_, _, Exp} = camp_long_active_data:get_config(Id),
            MaxVal = MaxLev * Exp,
            ExVal = Val - MaxVal,
            Num = ExVal div Exp * 15,
            RemVal = MaxVal + Val rem Exp,
            LossVal = Val - RemVal,
            LossL = format:val_to_loss([{90068, LossVal}]),
            LossMsg = format:gain_text(LossL, Role),
            notice:send(Role, 3, lang:get("氛围值溢出将转换为奖励，请前往邮件查收")),
            notice:send(Role,
                        3,
                        notice:format("~ts", [{string_1, LossMsg}])),
            Items = [{90069, Num}],
            fun_call:exec(mail,
                          send,
                          [RoleId,
                           lang:get("春日祭氛围值溢出奖励"),
                           lang:get("亲爱的玩家，这是您春日祭氛围值溢出100后获得的奖励，请查收~"),
                           Items]),
            Role1 = Role#role{assets =
                                  Assets#assets{long_active = RemVal}},
            change_m_camp(Role1,
                          CampLong#camp_long_active{lev = MaxLev});
        _ ->
            change_m_camp(Role,
                          CampLong#camp_long_active{lev = Lev})
    end;
do_exchange_val(Role, _, _) -> Role.

deal_repare(Role) ->
    case check_is_open() of
        {true, 3152} ->
            RepaireList = get_repaire_list(),
            case lists:member(Role#role.id, RepaireList) of
                true ->
                    case rpc_buy_token(Role, 980) of
                        {ok, NewRole} -> NewRole;
                        _Err ->
                            logger:error("修复玩家[~w]数据错误:~w",
                                         [Role#role.id, _Err],
                                         camp_long_active,
                                         579),
                            Role
                    end;
                _ -> Role
            end;
        _ -> Role
    end.

get_repaire_list() ->
    [{6040, "unite", 288},
     {23041, "beta", 3},
     {362, "beta", 3},
     {93047, "beta", 1},
     {3203, "beta", 23},
     {34045, "beta", 20},
     {442, "beta", 22},
     {36097, "beta", 38},
     {958, "ios", 14},
     {63708, "ios", 2},
     {47092, "ios", 4},
     {6072, "ios", 24},
     {19557, "ios", 12},
     {5491, "ios", 12},
     {17515, "ios", 23},
     {21960, "ios", 3},
     {1807, "ios", 6},
     {25167, "ios", 14},
     {13634, "mix", 38},
     {27871, "mix", 10},
     {86804, "mix", 5},
     {40979, "mix", 7},
     {4454, "mix", 30},
     {141939, "mix", 3},
     {121088, "mix", 1},
     {43581, "mix", 1},
     {8671, "mix", 112},
     {13829, "mix", 59},
     {1693, "mix", 76},
     {10, "mix", 76},
     {11351, "mix", 89},
     {5661, "mix", 61},
     {13540, "mix", 97},
     {215, "mix", 170},
     {4564, "mix", 168},
     {1780, "mix", 163},
     {43, "mix", 220},
     {4301, "mix", 238},
     {3365, "mix", 189},
     {5792, "mix", 221},
     {6522, "mix", 233},
     {66, "mix", 223},
     {8030, "mix", 231},
     {6677, "mix", 224},
     {562, "mix", 290},
     {386, "mix", 264},
     {3636, "mix", 289},
     {54, "mix", 287},
     {5207, "mix", 243},
     {7919, "mix", 289},
     {692, "mix", 263},
     {3320, "mix", 323},
     {1787, "mix", 330},
     {38, "mix", 329},
     {826, "mix", 323},
     {77, "mix", 318},
     {3784, "mix", 323},
     {759, "mix", 330},
     {40950, "mix", 326},
     {31, "mix", 330},
     {432, "mix", 335},
     {539, "mix", 349},
     {8650, "mix", 350},
     {53, "mix", 363},
     {4066, "mix", 368},
     {55, "mix", 363},
     {312, "mix", 360},
     {2389, "mix", 355},
     {1161, "mix", 360},
     {6618, "mix", 356},
     {2947, "mix", 366},
     {285, "mix", 358},
     {8323, "mix", 355},
     {1633, "mix", 357},
     {215, "mix", 388},
     {5157, "mix", 385},
     {541, "mix", 385},
     {125, "mix", 389},
     {16, "mix", 385},
     {1342, "mix", 389},
     {2333, "mix", 392},
     {2301, "mix", 394},
     {1155, "mix", 395},
     {427, "mix", 395},
     {62, "mix", 396},
     {85, "mix", 395},
     {902, "mix", 395},
     {2883, "mix", 398},
     {81, "mix", 398},
     {413, "mix", 400},
     {30, "mix", 402},
     {7108, "mix", 401},
     {216, "mix", 401},
     {3829, "mix", 403},
     {885, "mix", 403},
     {402, "mix", 404},
     {124, "mix", 404},
     {7223, "mix", 404},
     {2284, "mix", 404},
     {1700, "mix", 404},
     {177, "unite", 27},
     {2215, "unite", 1},
     {4756, "unite", 62},
     {16918, "unite", 6},
     {325, "unite", 64},
     {7754, "unite", 40},
     {1071, "unite", 36},
     {12820, "unite", 17},
     {453, "unite", 60},
     {9050, "unite", 18},
     {30041, "unite", 11},
     {7603, "unite", 20},
     {31, "unite", 63},
     {1855, "unite", 28},
     {1093, "unite", 113},
     {9614, "unite", 103},
     {99, "unite", 90},
     {138, "unite", 80},
     {2589, "unite", 105},
     {8677, "unite", 103},
     {30, "unite", 121},
     {999, "unite", 71},
     {2186, "unite", 87},
     {255, "unite", 109},
     {813, "unite", 79},
     {2956, "unite", 107},
     {340, "unite", 76},
     {4716, "unite", 76},
     {6014, "unite", 107},
     {2523, "unite", 93},
     {255, "unite", 73},
     {7353, "unite", 103},
     {6383, "unite", 159},
     {69, "unite", 157},
     {1001, "unite", 145},
     {194, "unite", 163},
     {1020, "unite", 172},
     {1472, "unite", 174},
     {2594, "unite", 132},
     {2203, "unite", 162},
     {165, "unite", 165},
     {5452, "unite", 159},
     {496, "unite", 169},
     {805, "unite", 171},
     {1321, "unite", 172},
     {7193, "unite", 135},
     {854, "unite", 173},
     {225, "unite", 173},
     {124, "unite", 151},
     {803, "unite", 163},
     {830, "unite", 180},
     {196, "unite", 182},
     {325, "unite", 181},
     {6526, "unite", 182},
     {1600, "unite", 195},
     {4110, "unite", 209},
     {62, "unite", 197},
     {1235, "unite", 198},
     {156, "unite", 195},
     {201, "unite", 216},
     {481, "unite", 216},
     {1106, "unite", 198},
     {2835, "unite", 210},
     {4442, "unite", 203},
     {8738, "unite", 219},
     {52, "unite", 204},
     {6621, "unite", 223},
     {7, "unite", 195},
     {6819, "unite", 245},
     {1552, "unite", 255},
     {432, "unite", 253},
     {2412, "unite", 256},
     {3334, "unite", 255},
     {11537, "unite", 239},
     {1986, "unite", 232},
     {254, "unite", 230},
     {744, "unite", 253},
     {2295, "unite", 225},
     {84, "unite", 252},
     {2283, "unite", 244},
     {66, "unite", 247},
     {339, "unite", 226},
     {567, "unite", 250},
     {79, "unite", 266},
     {4174, "unite", 259},
     {12911, "unite", 258},
     {2515, "unite", 274},
     {22, "unite", 270},
     {1926, "unite", 285},
     {1987, "unite", 261},
     {370, "unite", 270},
     {5602, "unite", 266},
     {2117, "unite", 258},
     {101, "unite", 264},
     {5802, "unite", 274},
     {851, "unite", 262},
     {3324, "unite", 263},
     {813, "unite", 266},
     {544, "unite", 267},
     {98, "unite", 266},
     {133, "unite", 266},
     {3862, "unite", 273},
     {581, "unite", 278},
     {4391, "unite", 264},
     {8750, "unite", 279},
     {869, "unite", 269},
     {1084, "unite", 275},
     {123, "unite", 281},
     {31, "unite", 266},
     {14248, "unite", 268},
     {11816, "unite", 270},
     {871, "unite", 290},
     {5881, "unite", 303},
     {5418, "unite", 292},
     {8024, "unite", 299},
     {2560, "unite", 296},
     {6735, "unite", 294},
     {6434, "unite", 300},
     {6238, "unite", 301},
     {254, "unite", 304},
     {247, "unite", 296},
     {24, "unite", 298},
     {172, "unite", 320},
     {3306, "unite", 307},
     {21, "unite", 306},
     {2992, "unite", 307},
     {986, "unite", 314},
     {9187, "unite", 314},
     {1761, "unite", 314},
     {9609, "unite", 319},
     {5310, "unite", 320},
     {6105, "unite", 313},
     {370, "unite", 325},
     {771, "unite", 327},
     {6850, "unite", 328},
     {241, "unite", 328},
     {3128, "unite", 325},
     {5012, "unite", 332},
     {343, "unite", 334},
     {2385, "unite", 336},
     {404, "unite", 331},
     {3214, "unite", 332},
     {3389, "unite", 331},
     {4822, "unite", 331},
     {103, "unite", 330},
     {5543, "unite", 330},
     {2409, "unite", 339},
     {2707, "unite", 338},
     {1900, "unite", 342},
     {1312, "unite", 346},
     {1842, "unite", 346},
     {319, "unite", 345},
     {1393, "unite", 346},
     {170, "unite", 345},
     {797, "unite", 346},
     {4321, "unite", 347},
     {216, "unite", 348},
     {285, "unite", 348},
     {111, "unite", 348},
     {2481, "unite", 352},
     {20, "unite", 351},
     {45, "unite", 351},
     {550, "unite", 349},
     {97, "unite", 349},
     {420, "unite", 349},
     {1473, "unite", 356},
     {5591, "unite", 356},
     {105, "unite", 354},
     {39, "unite", 355},
     {1270, "unite", 354},
     {442, "unite", 356},
     {6090, "unite", 356},
     {121, "unite", 356},
     {315, "unite", 355},
     {6287, "unite", 356},
     {3208, "unite", 354},
     {53, "unite", 354},
     {1067, "unite", 356},
     {899, "unite", 356},
     {1918, "unite", 358},
     {183, "unite", 357},
     {7, "unite", 358},
     {2822, "unite", 358},
     {458, "unite", 357},
     {363, "unite", 357},
     {3832, "unite", 358},
     {3079, "unite", 357},
     {497, "unite", 358},
     {286, "unite", 358},
     {17, "unite", 358},
     {3434, "unite", 358},
     {57, "unite", 358},
     {303, "unite", 357},
     {574, "unite", 358},
     {2318, "unite", 359},
     {222, "unite", 359},
     {5327, "unite", 359},
     {3499, "unite", 359},
     {4241, "unite", 359},
     {4739, "unite", 359},
     {3005, "unite", 359},
     {232, "unite", 359},
     {649, "unite", 360},
     {548, "unite", 360},
     {116, "unite", 361},
     {197, "unite", 361},
     {4642, "unite", 361},
     {2067, "unite", 362},
     {534, "unite", 362},
     {1718, "unite", 362},
     {1253, "unite", 362},
     {6, "mix", 384},
     {2123, "mix", 381},
     {205, "mix", 376},
     {12, "mix", 382},
     {81, "mix", 373},
     {2410, "mix", 377},
     {208, "mix", 376},
     {87, "mix", 379},
     {2983, "mix", 383},
     {19, "mix", 369},
     {204, "mix", 384},
     {2, "mix", 382},
     {9095, "mix", 370},
     {9, "mix", 380},
     {3612, "mix", 376},
     {5347, "mix", 371},
     {1876, "mix", 382},
     {45, "mix", 371},
     {320, "mix", 380},
     {4812, "mix", 376},
     {6197, "mix", 401},
     {789, "mix", 401},
     {44, "mix", 402},
     {54, "mix", 402},
     {5003, "mix", 401},
     {457, "mix", 401},
     {934, "mix", 402},
     {729, "mix", 402},
     {9439, "mix", 406},
     {2185, "mix", 406},
     {768, "mix", 406},
     {9051, "mix", 406},
     {410, "mix", 406},
     {1075, "mix", 406},
     {46, "mix", 406},
     {3829, "mix", 403},
     {885, "mix", 403},
     {773, "mix", 403},
     {2048, "mix", 403},
     {162, "mix", 403},
     {2494, "mix", 399},
     {1217, "mix", 400},
     {3979, "mix", 399},
     {3862, "mix", 400},
     {2546, "mix", 399},
     {12278, "mix", 399},
     {8178, "mix", 400},
     {42, "mix", 399},
     {671, "mix", 399},
     {12015, "mix", 399},
     {3630, "mix", 399},
     {5673, "mix", 189},
     {207, "mix", 359},
     {53, "mix", 363},
     {4066, "mix", 368},
     {55, "mix", 363},
     {312, "mix", 360},
     {2389, "mix", 355},
     {1161, "mix", 360},
     {6618, "mix", 356},
     {2947, "mix", 366},
     {285, "mix", 358},
     {8323, "mix", 355}].

repare_login() ->
    role_group:apply(world, {camp_long_active, login, []}).

