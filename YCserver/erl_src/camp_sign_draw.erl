-file("src/mod/campaign/camp_sign_draw.erl", 1).

-module(camp_sign_draw).

-author("Suhan").

-file("inc/camp_sign_draw.hrl", 1).

-author("Suhan").

-record(camp_sign_draw_config,
        {camp_id = 0,
         cost = [],
         sign_reward = [],
         title,
         content,
         guarantee_round = 10}).

-record(m_camp_sign_draw,
        {ver = 1,
         camp_id = 0,
         sign_flag = 0,
         sign_time = 0,
         draw_times = 0,
         quality_times = [],
         history_quality_times = []}).

-record(camp_sign_draw_reward,
        {base_id = 0,
         bind = 0,
         base_num = 0,
         ratio = 0,
         num_weight = [],
         draw_icon = 0,
         min_lev = 0,
         max_lev = 0,
         sex = 2,
         classes = 0,
         is_effect,
         is_zone_cast,
         quality = 0}).

-record(camp_sign_draw_reward_base,
        {base_id = 0,
         bind = 0,
         base_num = 0,
         num = 0,
         weight = 0,
         sex = 2,
         classes = 0,
         is_effect,
         is_zone_cast,
         quality = 0}).

-file("src/mod/campaign/camp_sign_draw.erl", 13).

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

-file("src/mod/campaign/camp_sign_draw.erl", 14).

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

-file("src/mod/campaign/camp_sign_draw.erl", 15).

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

-file("src/mod/campaign/camp_sign_draw.erl", 16).

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

-file("src/mod/campaign/camp_sign_draw.erl", 17).

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

-file("src/mod/campaign/camp_sign_draw.erl", 18).

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

-file("src/mod/campaign/camp_sign_draw.erl", 19).

-export([init/0,
         do/1,
         accept/3,
         draw/1,
         commit/2,
         levup/2,
         login/1,
         push_draw_info/1,
         push_quest_info/1,
         reload/0,
         sign/1,
         flush/1]).

init() -> #m_camp_sign_draw{}.

do({m_camp_sign_draw, CampId, SignFlag, SignTime}) ->
    Ver = 1,
    DrawTimes = 0,
    Quality = [],
    HistoryQualityTimes = [],
    do({m_camp_sign_draw,
        Ver,
        CampId,
        SignFlag,
        SignTime,
        DrawTimes,
        Quality,
        HistoryQualityTimes});
do(Data = #m_camp_sign_draw{ver = 1}) -> {ok, Data};
do(undefined) -> {ok, #m_camp_sign_draw{}};
do(_Err) ->
    logger:error("签到抽奖版本转换失败:~w",
                 [_Err],
                 camp_sign_draw,
                 50),
    {false, lang:get("签到抽奖版本转换失败")}.

levup(Role, NewLev) when NewLev >= 30 ->
    case check_is_open() of
        true ->
            {ok, NRole} = flush(Role),
            NRole;
        _ ->
            {ok, NewRole} = remove_all_quest(Role),
            NewRole
    end;
levup(Role, _) -> Role.

login(Role = #role{lev = Lev}) when Lev >= 30 ->
    case check_is_open() of
        true ->
            {ok, NewRole} = flush(Role),
            {ok, NewRole};
        _ -> remove_all_quest(Role)
    end;
login(_Role) -> ok.

accept(#quest_data{id = QuestId, type = Type,
                   sec_type = SecType, progress = Progress,
                   start_time = ST, end_time = ET},
       Role = #role{m_quest =
                        Mquest = #m_quest{quest = Quests,
                                          acceptable = Acceptable}},
       AccQuestId) ->
    Progress1 = quest_prog_init:do(Role, Progress, QuestId),
    {NewProgress, LoadRole} = quest:load_progress(Progress1,
                                                  quest,
                                                  QuestId,
                                                  [],
                                                  Role),
    Finish = case [false
                   || #quest_progress{finish = 0} <- NewProgress]
                 of
                 [] -> 1;
                 _ -> 0
             end,
    {_, EndT} = date:parse_time(ST, ET),
    NQuest = #quest{id = QuestId, finish = Finish,
                    type = Type, sec_type = SecType, progress = NewProgress,
                    end_time = EndT},
    quest:set_check_timer(EndT),
    NewQuests = [NQuest | Quests],
    NewAcceptable = lists:delete(AccQuestId, Acceptable),
    NewRole = LoadRole#role{m_quest =
                                Mquest#m_quest{quest = NewQuests,
                                               acceptable = NewAcceptable}},
    {NQuest, NewRole}.

reload() ->
    Now = date:unixtime(),
    case campaign_mgr:get_camp_time(60046) of
        {StartTime, EndTime}
            when StartTime =< Now andalso Now =< EndTime ->
            role_group:apply(world, {camp_sign_draw, flush, []}),
            ok;
        _ -> ok
    end.

commit(Role = #role{m_quest =
                        MQuest = #m_quest{quest_sign_draw =
                                              #quest_sign_draw{finish = Finish,
                                                               doing = Doing}}},
       QuestId) ->
    case check_is_open() of
        true ->
            case camp_sign_draw_data:get_quest_info(QuestId) of
                {QuestId, Rewards, _Icon, _Sort} ->
                    case lists:member(QuestId, Doing) of
                        true ->
                            Gain = format:val_to_gain(Rewards),
                            NewFinish = [QuestId | Finish],
                            NewDoing = lists:delete(QuestId, Doing),
                            NewQuest = MQuest#m_quest{quest_sign_draw =
                                                          #quest_sign_draw{finish
                                                                               =
                                                                               NewFinish,
                                                                           doing
                                                                               =
                                                                               NewDoing}},
                            case role_gain:do_notice(Gain, Role) of
                                {ok, NewRole} ->
                                    ResRole = NewRole#role{m_quest = NewQuest},
                                    {ok, ResRole};
                                _ ->
                                    ResRole1 = Role#role{m_quest = NewQuest},
                                    Msg = lang:get("背包已满，奖励已通过邮件发放"),
                                    notice:send(ResRole1, 1, Msg),
                                    Title = lang:get("签到抽奖奖励"),
                                    Content =
                                        lang:get("由于领取时背包已满，奖励通过邮件发放，请查收"),
                                    mail:send(ResRole1,
                                              Title,
                                              Content,
                                              Rewards),
                                    {ok, ResRole1}
                            end;
                        false -> {ok, Role}
                    end;
                _ -> {ok, Role}
            end;
        _ -> {ok, Role}
    end.

sign(Role = #role{m_camp_sign_draw =
                      MCampSignDraw = #m_camp_sign_draw{sign_time =
                                                            SignTime}}) ->
    case check_is_open() of
        true ->
            case date:date() of
                Now when Now =/= SignTime ->
                    [#camp_sign_draw_config{sign_reward = Rewards}] =
                        camp_sign_draw_data:get_config(),
                    Gain = format:val_to_gain(Rewards),
                    case role_gain:do_notice(Gain, Role, lang:get("签到成功"))
                        of
                        {ok, Role1} ->
                            NewRole = Role1#role{m_camp_sign_draw =
                                                     MCampSignDraw#m_camp_sign_draw{sign_flag
                                                                                        =
                                                                                        1,
                                                                                    sign_time
                                                                                        =
                                                                                        Now}},
                            push_quest_info(NewRole),
                            {ok, NewRole, lang:get("签到成功")};
                        _ ->
                            Msg = lang:get("背包已满，请整理后再进行签到获得奖励"),
                            notice:send(Role, 1, Msg),
                            {false, Msg}
                    end;
                _ ->
                    Msg = lang:get("您今天已经签到过了"),
                    notice:send(Role, 1, Msg),
                    {true, lang:get("已经签到")}
            end;
        _ ->
            Msg = lang:get("活动未开启"),
            notice:send(Role, 1, Msg),
            {false, lang:get("活动未开启")}
    end.

push_draw_info(Role = #role{sex = RoleSex,
                            classes = RoleClasses, lev = RoleLevel}) ->
    ItemList = camp_sign_draw_data:get_draw_reward(),
    FilterFun = fun (#camp_sign_draw_reward{sex = CfgSex,
                                            min_lev = CfgMinLev,
                                            max_lev = CfgMaxLev,
                                            classes = CfgClasses}) ->
                        (RoleLevel >= CfgMinLev andalso RoleLevel =< CfgMaxLev)
                            andalso
                            (RoleSex =:= CfgSex orelse CfgSex =:= 2) andalso
                                (RoleClasses =:= CfgClasses orelse
                                     CfgClasses =:= 0)
                end,
    FilterItemList = lists:filter(FilterFun, ItemList),
    Rewards = [{BaseId, IsEffect, BaseNum}
               || #camp_sign_draw_reward{base_id = BaseId,
                                         is_effect = IsEffect,
                                         base_num = BaseNum}
                      <- FilterItemList],
    Number = camp_sign_draw_data:get_draw_num(),
    Data = {Rewards, Number},
    role:link_send(Role, 20438, Data),
    ok.

push_quest_info(Role = #role{m_quest = MQuest,
                             m_camp_sign_draw =
                                 #m_camp_sign_draw{sign_flag = SignStatus}}) ->
    QuestList1 = camp_sign_draw_data:get_quest_list(),
    QuestList = lists:reverse(QuestList1),
    ResQuestInfo = get_quest_list_info(QuestList,
                                       MQuest,
                                       []),
    [#camp_sign_draw_config{sign_reward = SignReward}] =
        camp_sign_draw_data:get_config(),
    Data = {ResQuestInfo, [{SignReward, SignStatus}]},
    role:link_send(Role, 20439, Data),
    ok.

draw(Role = #role{m_camp_sign_draw =
                      MCampSignDraw = #m_camp_sign_draw{draw_times =
                                                            DrawTimes,
                                                        quality_times =
                                                            QualityTimes,
                                                        history_quality_times =
                                                            HistoryQualityTimes}}) ->
    case check_is_open() of
        true ->
            [#camp_sign_draw_config{cost = Cost, title = Title,
                                    content = Content,
                                    guarantee_round = GuaranteeRound}] =
                camp_sign_draw_data:get_config(),
            Loss = format:val_to_loss(Cost),
            role:send_buff_begin(),
            case role_gain:do(Loss, Role) of
                {ok, Role1} ->
                    Rewards = get_reward_list(Role1),
                    case length(Rewards) > 0 of
                        true ->
                            role:send_buff_flush(),
                            do_notice_cast(Rewards, Role),
                            [{BaseID,
                              Bind,
                              BaseNum,
                              Num,
                              IsEffect,
                              Quality,
                              _IsZoneCast}] =
                                Rewards,
                            GainRewards = [{BaseID, Bind, BaseNum * Num}],
                            Gain = format:val_to_gain(GainRewards),
                            Role4 = case (DrawTimes + 1) rem GuaranteeRound =:=
                                             0
                                        of
                                        true ->
                                            NewHistoryQualityTimes1 =
                                                list_add_quality_times(QualityTimes,
                                                                       HistoryQualityTimes),
                                            NewHistoryQualityTimes =
                                                do_add_quality_times({Quality,
                                                                      1},
                                                                     NewHistoryQualityTimes1),
                                            Role1#role{m_camp_sign_draw =
                                                           MCampSignDraw#m_camp_sign_draw{draw_times
                                                                                              =
                                                                                              DrawTimes
                                                                                                  +
                                                                                                  1,
                                                                                          quality_times
                                                                                              =
                                                                                              [],
                                                                                          history_quality_times
                                                                                              =
                                                                                              NewHistoryQualityTimes}};
                                        _ ->
                                            NewQualityTimes =
                                                do_add_quality_times({Quality,
                                                                      1},
                                                                     QualityTimes),
                                            Role1#role{m_camp_sign_draw =
                                                           MCampSignDraw#m_camp_sign_draw{draw_times
                                                                                              =
                                                                                              DrawTimes
                                                                                                  +
                                                                                                  1,
                                                                                          quality_times
                                                                                              =
                                                                                              NewQualityTimes}}
                                    end,
                            ResRewards = [{BaseID,
                                           Bind,
                                           Num,
                                           IsEffect,
                                           BaseNum}],
                            case role_gain:do(Gain, Role4) of
                                {ok, Role3} -> {ok, ResRewards, Role3};
                                _ ->
                                    mail:send(Role4,
                                              Title,
                                              Content,
                                              GainRewards),
                                    Msg = lang:get("奖励邮件发送"),
                                    {ok, Msg, ResRewards, Role4}
                            end;
                        _ ->
                            role:send_buff_clean(),
                            Msg = lang:get("服务器繁忙，请稍后再抽"),
                            notice:send(Role, 1, Msg),
                            {false, lang:get("服务器繁忙，请稍后再抽")}
                    end;
                {false, #loss{msg = Msg}} ->
                    role:send_buff_clean(),
                    notice:send(Role,
                                1,
                                lang:get("抽奖道具不足，快去做任务获取吧{face_1,18}")),
                    {false, Msg};
                _ ->
                    role:send_buff_clean(),
                    Msg = lang:get("抽奖道具不足，快去做任务获取吧{face_1,18}"),
                    notice:send(Role, 1, Msg),
                    {false, lang:get("抽奖道具不足")}
            end;
        _ ->
            notice:send(Role, 1, lang:get("活动未开启")),
            {false, lang:get("活动未开启")}
    end.

do_notice_cast([], _Role) -> ok;
do_notice_cast([{BaseID,
                 Bind,
                 BaseNum,
                 Num,
                 _IsEffect,
                 _Quality,
                 IsZoneCast}
                | T],
               Role = #role{name = Name}) ->
    case IsZoneCast of
        1 ->
            CastZoneMsg =
                notice:format(lang:get("运气爆棚！~ts在签到抽奖转转乐中抽到了~ts，真是幸运极了！"),
                              [{role_2, Name},
                               {item_2, BaseID, Bind, BaseNum * Num}]),
            notice:cast(all, 5, CastZoneMsg),
            ok;
        _ -> ok
    end,
    do_notice_cast(T, Role).

do_add_quality_times({Quality, Times}, QualityTimes) ->
    case lists:keyfind(Quality, 1, QualityTimes) of
        {Quality, PreTimes} ->
            lists:keystore(Quality,
                           1,
                           QualityTimes,
                           {Quality, Times + PreTimes});
        _ ->
            lists:keystore(Quality,
                           1,
                           QualityTimes,
                           {Quality, Times})
    end;
do_add_quality_times(_, QualityTimes) -> QualityTimes.

list_add_quality_times([], QualityTimes) ->
    QualityTimes;
list_add_quality_times([H | T], QualityTimes) ->
    NewQualityTimes = do_add_quality_times(H, QualityTimes),
    list_add_quality_times(T, NewQualityTimes).

cal_min_times([], _QualityTimes, Sum) -> Sum;
cal_min_times([Quality | T], QualityTimes, Sum) ->
    NewSum = case
                 camp_sign_draw_data:get_guarantee_info(Quality)
                 of
                 {Quality, QualityMinTimes, _QualityMaxTimes} ->
                     case lists:keyfind(Quality, 1, QualityTimes) of
                         {Quality, NowQualityTimes} ->
                             case NowQualityTimes < QualityMinTimes of
                                 true ->
                                     Sum + QualityMinTimes - NowQualityTimes;
                                 _ -> Sum
                             end;
                         _ -> Sum + QualityMinTimes
                     end;
                 _ -> Sum
             end,
    cal_min_times(T, QualityTimes, NewSum).

get_accept_quality_list([], _LeaveDrawTimes,
                        _LackDrawTimes, _QualityTimes, ResList) ->
    ResList;
get_accept_quality_list([QualityId | T], LeaveDrawTimes,
                        LackDrawTimes, QualityTimes, AcceptQualityList) ->
    {MinTimes, MaxTimes} = case
                               camp_sign_draw_data:get_guarantee_info(QualityId)
                               of
                               {QualityId, PreMinTimes, PreMaxTimes} ->
                                   {PreMinTimes, PreMaxTimes};
                               _ -> {0, 0}
                           end,
    QualityDrawTimes = case lists:keyfind(QualityId,
                                          1,
                                          QualityTimes)
                           of
                           {QualityId, PreQualityDrawTimes} ->
                               PreQualityDrawTimes;
                           _ -> 0
                       end,
    NewAcceptQualityList = case LeaveDrawTimes >
                                    LackDrawTimes
                               of
                               true ->
                                   case QualityDrawTimes < MaxTimes of
                                       true -> [QualityId | AcceptQualityList];
                                       _ -> AcceptQualityList
                                   end;
                               _ ->
                                   case LeaveDrawTimes =:= LackDrawTimes of
                                       true ->
                                           case QualityDrawTimes < MinTimes of
                                               true ->
                                                   [QualityId
                                                    | AcceptQualityList];
                                               _ -> AcceptQualityList
                                           end;
                                       _ ->
                                           NowNeedTimes =
                                               cal_min_times(AcceptQualityList,
                                                             QualityTimes,
                                                             0),
                                           case NowNeedTimes < LeaveDrawTimes of
                                               true ->
                                                   case QualityDrawTimes <
                                                            MinTimes
                                                       of
                                                       true ->
                                                           [QualityId
                                                            | AcceptQualityList];
                                                       _ -> AcceptQualityList
                                                   end;
                                               _ -> AcceptQualityList
                                           end
                                   end
                           end,
    get_accept_quality_list(T,
                            LeaveDrawTimes,
                            LackDrawTimes,
                            QualityTimes,
                            NewAcceptQualityList).

get_quest_list_info([], _MQuest, ResQuestInfo) ->
    ResQuestInfo;
get_quest_list_info([QuestId | T],
                    MQuest = #m_quest{quest = Quest}, QuestInfo) ->
    {QuestId, QuestRewards, Icon, Sort} =
        camp_sign_draw_data:get_quest_info(QuestId),
    NewQuestInfo = case lists:keyfind(QuestId,
                                      #quest.id,
                                      Quest)
                       of
                       #quest{progress = Progress} ->
                           [#quest_progress{target_val = TargetVal,
                                            value = Value}] =
                               Progress,
                           QuestStatus = case TargetVal =:= Value of
                                             true -> 1;
                                             _ -> 0
                                         end,
                           QuestInfo1 = {QuestId,
                                         QuestRewards,
                                         Icon,
                                         Value,
                                         TargetVal,
                                         QuestStatus,
                                         Sort},
                           [QuestInfo1 | QuestInfo];
                       _ ->
                           case quest_data:get(QuestId) of
                               #quest_data{progress =
                                               [#quest_progress{target_val =
                                                                    TargetVal1}]} ->
                                   QuestInfo2 = {QuestId,
                                                 QuestRewards,
                                                 Icon,
                                                 TargetVal1,
                                                 TargetVal1,
                                                 2,
                                                 Sort},
                                   [QuestInfo2 | QuestInfo];
                               _ ->
                                   logger:error("任务信息出错~w",
                                                [QuestId],
                                                camp_sign_draw,
                                                398),
                                   QuestInfo
                           end
                   end,
    get_quest_list_info(T, MQuest, NewQuestInfo).

get_reward_list(#role{sex = Sex, classes = Classes,
                      lev = Level,
                      m_camp_sign_draw =
                          #m_camp_sign_draw{draw_times = DrawTimes,
                                            quality_times = QualityTimes}}) ->
    QualityList = camp_sign_draw_data:get_quality_list(),
    [#camp_sign_draw_config{guarantee_round =
                                ConfigGuaranteeRound}] =
        camp_sign_draw_data:get_config(),
    LeaveDrawTimes = case ConfigGuaranteeRound of
                         0 -> 10;
                         _ ->
                             case (DrawTimes + 1) rem ConfigGuaranteeRound of
                                 AnswerRem when AnswerRem > 0 ->
                                     ConfigGuaranteeRound - AnswerRem + 1;
                                 _ -> 1
                             end
                     end,
    LackTimes = cal_min_times(QualityList, QualityTimes, 0),
    SortFun = fun (A, B) -> A > B end,
    SortQualityList = lists:sort(SortFun, QualityList),
    AcceptQualityList =
        get_accept_quality_list(SortQualityList,
                                LeaveDrawTimes,
                                LackTimes,
                                QualityTimes,
                                []),
    IndexList = camp_sign_draw_data:get_draw_reward(),
    ClassesFun = fun (_Cfg = #camp_sign_draw_reward{min_lev
                                                        = CfgMinLev,
                                                    max_lev = CfgMaxLev,
                                                    sex = CfgSex,
                                                    classes = CfgClasses}) ->
                         (Level >= CfgMinLev andalso Level =< CfgMaxLev) andalso
                             (Sex =:= CfgSex orelse CfgSex =:= 2) andalso
                                 (Classes =:= CfgClasses orelse
                                      CfgClasses =:= 0)
                 end,
    FilterClassesList = lists:filter(ClassesFun, IndexList),
    QualityFun = fun (#camp_sign_draw_reward{quality =
                                                 Quality}) ->
                         lists:member(Quality, AcceptQualityList)
                 end,
    FilterQualityList = lists:filter(QualityFun,
                                     FilterClassesList),
    case util:rand_list(FilterQualityList,
                        #camp_sign_draw_reward.ratio)
        of
        #camp_sign_draw_reward{base_id = BaseID, bind = Bind,
                               base_num = BaseNum, is_effect = IsEffect,
                               quality = Quality, num_weight = NumWeight,
                               is_zone_cast = IsZoneCast} ->
            case util:rand_list(NumWeight, 2) of
                {Num, _} ->
                    [{BaseID,
                      Bind,
                      BaseNum,
                      Num,
                      IsEffect,
                      Quality,
                      IsZoneCast}];
                _ -> []
            end;
        _ -> []
    end.

check_is_open() ->
    Now = date:unixtime(),
    case campaign_mgr:get_camp_time(60046) of
        {StartTime, EndTime}
            when StartTime =< Now andalso Now =< EndTime ->
            true;
        _ -> false
    end.

flush(Role = #role{m_camp_sign_draw =
                       MCampSignDraw = #m_camp_sign_draw{camp_id = CampId,
                                                         sign_time =
                                                             SignTime}}) ->
    Cid = get_camp_id(),
    {ok, NRole} = case CampId =/= Cid of
                      true ->
                          NewRole = Role#role{m_camp_sign_draw =
                                                  #m_camp_sign_draw{camp_id =
                                                                        Cid,
                                                                    sign_flag =
                                                                        0,
                                                                    sign_time =
                                                                        0,
                                                                    draw_times =
                                                                        0,
                                                                    quality_times
                                                                        = [],
                                                                    history_quality_times
                                                                        = []}},
                          {ok, NRole1} = accept_quest_list(NewRole, true),
                          {ok, NRole1};
                      _ ->
                          Now = date:date(),
                          {ok, NewRole} = accept_quest_list(Role, false),
                          case Now =/= SignTime of
                              true ->
                                  {ok,
                                   NewRole#role{m_camp_sign_draw =
                                                    MCampSignDraw#m_camp_sign_draw{sign_flag
                                                                                       =
                                                                                       0}}};
                              _ -> {ok, NewRole}
                          end
                  end,
    {ok, NRole};
flush(Role) ->
    NewRole = Role#role{m_camp_sign_draw =
                            #m_camp_sign_draw{}},
    flush(NewRole).

accept_quest_list(Role = #role{m_quest =
                                   #m_quest{quest_sign_draw =
                                                #quest_sign_draw{doing =
                                                                     CurDoing,
                                                                 finish =
                                                                     CurFinish}}},
                  Flag) ->
    QuestList = camp_sign_draw_data:get_quest_list(),
    {Role1, AcceptQuestList} = case Flag of
                                   true ->
                                       {ok, Role2} = remove_all_quest(Role),
                                       {Role2, QuestList};
                                   _ ->
                                       {Role,
                                        QuestList -- CurDoing ++ CurFinish}
                               end,
    Fun = fun (QuestId, RtnRole) ->
                  case quest:callback_accept(RtnRole,
                                             QuestId,
                                             [condition, accept, fire])
                      of
                      {ok,
                       AcceptRole = #role{m_quest =
                                              MQuest = #m_quest{quest_sign_draw
                                                                    =
                                                                    QuestSignDraw =
                                                                        #quest_sign_draw{doing
                                                                                             =
                                                                                             Doing}}}} ->
                          NewDoing = [QuestId | Doing],
                          NewQuestSignDraw = QuestSignDraw#quest_sign_draw{doing
                                                                               =
                                                                               NewDoing},
                          NewMQuest = MQuest#m_quest{quest_sign_draw =
                                                         NewQuestSignDraw},
                          AcceptRole#role{m_quest = NewMQuest};
                      _Err ->
                          logger:debug("接受任务失败：~w 原因:~w",
                                       [QuestId, _Err],
                                       camp_sign_draw,
                                       514),
                          Role
                  end
          end,
    NewRole = lists:foldl(Fun, Role1, AcceptQuestList),
    {ok, NewRole}.

remove_all_quest(Role = #role{m_quest =
                                  MQuest = #m_quest{quest = Quests}}) ->
    Fun = fun (#quest{sec_type = SecType}) ->
                  SecType =/= 31;
              (_) -> false
          end,
    LeftQuests = lists:filter(Fun, Quests),
    NewRole = Role#role{m_quest =
                            MQuest#m_quest{quest = LeftQuests,
                                           quest_sign_draw =
                                               #quest_sign_draw{}}},
    {ok, NewRole}.

get_camp_id() -> campaign_mgr:get_camp_id(60046).

