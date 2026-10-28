-file("src/mod/plot/plot_quest.erl", 1).

-module(plot_quest).

-export([login/1,
         create_task_unit/3,
         create_task_unit/4,
         remove_task_unit/2,
         remove_plot_unit/2,
         make_plot_unit/5,
         kill/2,
         init_unit_rand_pos/5,
         init_unit_rand_pos/2,
         set_unit_rand_pos/2,
         get_rand_pos/3,
         get_quest_plot_unit/2,
         send_unit_plot_act/2]).

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

-file("src/mod/plot/plot_quest.erl", 24).

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

-file("src/mod/plot/plot_quest.erl", 25).

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

-file("src/mod/plot/plot_quest.erl", 26).

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

-file("src/mod/plot/plot_quest.erl", 27).

-file("inc/unit.hrl", 1).

-record(unit_order,
        {order :: undefined | move | guard | attack | atom(),
         type = 0 :: 0..2,
         arg :: undefined | tuple() | [tuple()],
         data :: undefined | term(),
         condition = [] :: list(),
         over :: undefined | defense | stop | atom()}).

-record(unit_data,
        {id = 0 :: pos_integer(),
         type = 1 :: non_neg_integer(),
         fun_type = 1 :: non_neg_integer(),
         desc = "",
         classes = 0,
         sex = 0,
         lev = 1,
         name = "" :: list(),
         activity = 0 :: 0..1,
         guide_lev = 0 :: non_neg_integer(),
         status = 0 :: non_neg_integer(),
         nature = 0 :: non_neg_integer(),
         disabled = "" :: bitstring(),
         condition = [] :: [tuple()],
         speed = 120 :: pos_integer(),
         lock = 0 :: 0 | 1,
         t_move = 3 :: pos_integer(),
         t_atk = 3 :: pos_integer(),
         range_trace = 200 :: pos_integer(),
         range_atk = 100 :: pos_integer(),
         gain = [] :: list(),
         formation = 1,
         formation_lev = 1,
         slave = [] :: list(),
         talk = [] :: list(),
         looks = [] :: list(),
         data = [] :: list(),
         def_status = defense :: defense | patrol | loaf}).

-record(unit,
        {id = {1, 1} :: {pos_integer(), pos_integer()},
         base_id = 0 :: non_neg_integer(),
         type = 1 :: non_neg_integer(),
         fun_type = 1,
         name = "" :: list(),
         pid = 0 :: non_neg_integer() | pid(),
         lev = 1,
         classes = 0,
         sex = 0,
         activity = 0 :: 0..1,
         dun_info :: undefined | {pid(), pos_integer()},
         combat_pid = 0 :: non_neg_integer() | pid(),
         status = 0 :: non_neg_integer(),
         guide_lev = 0 :: non_neg_integer(),
         nature = 0 :: non_neg_integer(),
         disabled = "" :: list(),
         condition = [] :: [tuple()],
         speed = 180 :: pos_integer(),
         lock = 0 :: 0 | 1,
         range_trace = 200 :: pos_integer(),
         range_atk = 100 :: pos_integer(),
         defxy = {0, 0, 0} :: tuple(),
         def_status = defense :: defense | patrol | loaf,
         talk = [] :: list(),
         pos :: undefined | tuple(),
         data :: undefined | term(),
         looks = [] :: [tuple()],
         evt = [] :: [atom()],
         formation = 1,
         formation_lev = 1,
         slave = [] :: list(),
         prop = [] :: [{non_neg_integer(), string()}],
         order = [] :: list(),
         path = [] :: list(),
         ts = {1, 1, 1} ::
             {pos_integer(), pos_integer(), pos_integer()},
         t_move = 3 :: pos_integer(),
         t_atk = 3 :: pos_integer(),
         ai_id = 0,
         ai = {[], []} :: {list(), list()},
         attr,
         role_id = {0, "", 0}}).

-record(map_unit,
        {id = {1, 1} :: {pos_integer(), pos_integer()},
         base_id = 0 :: non_neg_integer(),
         type = 1 :: pos_integer(),
         activity = 0 :: 0..1,
         status = 0 :: non_neg_integer(),
         classes = 0,
         sex = 0,
         guide_lev = 0 :: non_neg_integer(),
         name = "" :: list(),
         speed = 1 :: pos_integer(),
         x = 0 :: non_neg_integer(),
         y = 0 :: non_neg_integer(),
         gx = 0 :: non_neg_integer(),
         gy = 0 :: non_neg_integer(),
         looks = [] :: [tuple()],
         prop = [] :: [tuple()]}).

-record(plot_unit,
        {id = 0 :: pos_integer(),
         name = "" :: bitstring(),
         base_id = 0 :: non_neg_integer(),
         type = 1,
         fun_type = 1,
         dun_id = 0 :: non_neg_integer(),
         map = 0 :: non_neg_integer(),
         x = 0 :: non_neg_integer(),
         y = 0 :: non_neg_integer(),
         dir = 0 :: non_neg_integer(),
         act_type = "" :: bitstring(),
         looks = [] :: [tuple()],
         status = 0 :: non_neg_integer(),
         quest_id = 0 :: non_neg_integer(),
         quest_prog_id = 0 :: non_neg_integer(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer()}).

-record(unit_statue,
        {type = 0,
         id = {0, "", 0},
         name = "",
         lev = 0,
         classes = 0,
         sex = 0,
         looks = []}).

-file("src/mod/plot/plot_quest.erl", 28).

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

-file("src/mod/plot/plot_quest.erl", 29).

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

-file("src/mod/plot/plot_quest.erl", 30).

-file("inc/condition.hrl", 1).

-record(condition,
        {label :: undefined | atom(),
         op = eq ::
             ue | eq | lt | gt | le | ge | range | include,
         val :: undefined | term(),
         msg = "" :: list()}).

-file("src/mod/plot/plot_quest.erl", 31).

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

-file("src/mod/plot/plot_quest.erl", 32).

-file("inc/robot.hrl", 1).

-record(robot_role,
        {ver = 4,
         id = {0, "", 0} :: tuple(),
         name = "" :: list(),
         sex = 0 :: 0..1,
         classes = 0 :: 0..4,
         lev = 0 :: non_neg_integer(),
         fc = 0,
         face = 0,
         ai_id = 0,
         skills = [],
         talents = [],
         pet,
         backup_pets = [],
         guard,
         slave = [],
         attr :: undefined | tuple(),
         looks = [],
         time = 0,
         m_formation,
         pet_fc = 0,
         all_fc = 0,
         cup = 1000,
         m_lev_break}).

-record(robot_role_index,
        {id = {0, "", 0} :: tuple(),
         sex = 0 :: 0..1,
         classes = 0 :: 0..4,
         lev = 0 :: non_neg_integer(),
         fc = 0,
         pet_fc = 0,
         cup = 1000,
         all_fc = 0,
         time = 0}).

-file("src/mod/plot/plot_quest.erl", 33).

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

-file("src/mod/plot/plot_quest.erl", 34).

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

-file("src/mod/plot/plot_quest.erl", 35).

-file("inc/formation.hrl", 1).

-record(m_formation,
        {id = 1, lev = 1, pos = 1, forms = [], team_form = []}).

-record(formation, {id = 0, lev = 0, exp = 0}).

-record(formation_data,
        {id = 0,
         type = 1,
         lev = 0,
         max_lev = 1,
         name = "",
         pos_desc = [],
         attr_1 = [],
         attr_2 = [],
         attr_3 = [],
         attr_4 = [],
         attr_5 = [],
         pet_attr = [],
         strong_restrain = [],
         weak_restrain = [],
         next_exp = 0,
         need_item = [],
         item_id = 0}).

-file("src/mod/plot/plot_quest.erl", 36).

-file("inc/campaign_rank.hrl", 1).

-record(campaign_rank,
        {sec_type = 1,
         show_list = [],
         list = [],
         last_val = 0,
         len = 0}).

-record(campaign_rank_role,
        {key,
         id = {0, "", 0} :: term(),
         id2 = {0, "", 0} :: term(),
         sec_type = 0,
         rank = 1,
         time = 0 :: non_neg_integer(),
         role_id = 0 :: non_neg_integer(),
         platform = "" :: list(),
         zone_id = 0 :: non_neg_integer(),
         name = "" :: list(),
         sex = 0 :: 0..2,
         classes = 0 :: 0..4,
         lev = 0 :: non_neg_integer(),
         role_id2 = 0 :: non_neg_integer(),
         platform2 = "" :: list(),
         zone_id2 = 0 :: non_neg_integer(),
         name2 = "" :: list(),
         sex2 = 0 :: 0..2,
         classes2 = 0 :: 0..4,
         lev2 = 0 :: non_neg_integer(),
         val1 = 0 :: non_neg_integer(),
         val2 = 0 :: non_neg_integer(),
         val3 = 0 :: non_neg_integer(),
         val4 = 0 :: non_neg_integer(),
         desc = ""}).

-record(campaign_rank_zone,
        {id = 0, sec_type = 0, zone, pid}).

-record(campaign_rank_data,
        {id = 0,
         sec_type = 0,
         num = 0,
         keys = [],
         min_val = 1,
         zone,
         title = "",
         content = "",
         desc = "",
         cast = "",
         cast_rank = 1,
         merge_flag = 0}).

-record(camp_rank_reward_data,
        {min_rank = 0,
         max_rank = 0,
         sec_type = 0,
         item_list = [],
         title = "",
         content = "",
         limit = 0}).

-record(camp_rank_self_reward_data,
        {sec_type = 0, item_list = [], num = 0}).

-file("src/mod/plot/plot_quest.erl", 37).

-spec login(#role{}) -> #role{}.

login(Role) -> reset_quest(Role).

create_task_unit(Role, QuestId, Progs) ->
    create_task_unit(Role, QuestId, Progs, []).

create_task_unit(Role, QuestId, Progs, Args) ->
    case do_create_task_unit(Progs, Role, QuestId, Args, [])
        of
        {NRole, []} ->
            logger:debug("新建任务需求的剧情单位", [], plot_quest, 49),
            NRole;
        {NRole, AddUnitList} ->
            logger:debug("新建任务需求的剧情单位:~w",
                         [AddUnitList],
                         plot_quest,
                         52),
            send_unit_plot_act(NRole, AddUnitList),
            NRole
    end.

do_create_task_unit([], Role, _QuestId, _Args, Acc) ->
    {Role, lists:reverse(Acc)};
do_create_task_unit([Prog | Rest],
                    Role = #role{m_plot =
                                     MPlot = #m_plot{unit_list = UnitList}},
                    QuestId, Args, Acc) ->
    case make_task_unit(Prog, Role, QuestId, Args) of
        {ok, PlotUnit = #plot_unit{id = Id}} ->
            NewUnitList = lists:keystore(Id,
                                         #plot_unit.id,
                                         UnitList,
                                         PlotUnit),
            NRole = Role#role{m_plot =
                                  MPlot#m_plot{unit_list = NewUnitList}},
            do_create_task_unit(Rest,
                                NRole,
                                QuestId,
                                Args,
                                [PlotUnit | Acc]);
        {ok, {ID1, ID2}, PlotUnit1 = #plot_unit{id = Id1}} ->
            NewUnitList = lists:keystore(Id1,
                                         #plot_unit.id,
                                         UnitList,
                                         PlotUnit1),
            NRole = Role#role{m_plot =
                                  MPlot#m_plot{unit_list = NewUnitList}},
            {ok, NRole2} = quest_single_dog:set_extra(create_unit,
                                                      {ID1, ID2},
                                                      NRole),
            do_create_task_unit(Rest,
                                NRole2,
                                QuestId,
                                Args,
                                [PlotUnit1 | Acc]);
        _False ->
            do_create_task_unit(Rest, Role, QuestId, Args, Acc)
    end.

send_unit_plot_act(Role, PlotUnitList) ->
    L = [#plot_act{type =
                       plot_fun:act_to_type(plot_unit_create),
                   unit_id = Id, unit_base_id = UnitBaseId, msg = UnitName,
                   mapid = Map, x = X, y = Y, val = Dir, ext_msg = ActType,
                   looks = Looks, classes = Classes, sex = Sex}
         || #plot_unit{id = Id, base_id = UnitBaseId,
                       name = UnitName, map = Map, x = X, y = Y, dir = Dir,
                       act_type = ActType, looks = Looks, classes = Classes,
                       sex = Sex}
                <- PlotUnitList],
    role:link_send(Role,
                   11010,
                   {0,
                    "",
                    0,
                    0,
                    lists:flatten([L, [plot_act:get_end_plot_act()]])}),
    ok.

make_task_unit(P = #quest_progress{finish = 0,
                                   param = Param},
               Role = #role{m_plot = #m_plot{unit_list = UnitList}},
               QuestId, Args) ->
    case quest_data:get(QuestId) of
        QuestData = #quest_data{} ->
            case parse_param(Param, P, QuestData) of
                PlotUnitArgs = #plot_quest_unit{id = Id} ->
                    case lists:keyfind(Id, #plot_unit.id, UnitList) of
                        false ->
                            make_task_unit(PlotUnitArgs,
                                           P,
                                           Role,
                                           QuestData,
                                           Args);
                        #plot_unit{} ->
                            case lists:keyfind(revise, 1, Args) of
                                {revise, true} ->
                                    revise_plot_unit(QuestData,
                                                     P,
                                                     PlotUnitArgs,
                                                     Args,
                                                     Role);
                                _False ->
                                    logger:debug("[~ts]无法创建单位:[剧情单位Id:~w]重复[~w]",
                                                 [Role#role.name, Id, _False],
                                                 plot_quest,
                                                 94),
                                    false
                            end
                    end;
                _False -> false
            end;
        _False -> false
    end;
make_task_unit(_P, _Role, _QuestId, _Args) -> false.

make_task_unit(#plot_quest_unit{label = create_unit,
                                base_id = UnitBaseId = 73308,
                                pos = {point, Map, X, Y}, dir = Dir,
                                act_type = ActType, id = Id},
               #quest_progress{id = ProgId}, Role,
               #quest_data{id = QuestId}, _Args) ->
    case unit_data:get(UnitBaseId) of
        #unit_data{type = Type, fun_type = FunType,
                   name = UnitName} ->
            Unit0 = #plot_unit{id = Id, base_id = UnitBaseId,
                               type = Type, fun_type = FunType,
                               quest_id = QuestId, quest_prog_id = ProgId,
                               map = Map, x = X, y = Y, dir = Dir,
                               act_type = ActType},
            Unit = case guild_mgr:get_leader_id(Role) of
                       {ok, LeaderId} ->
                           case robot_mgr:get_role(LeaderId) of
                               {ok,
                                #robot_role{looks = Looks, sex = Sex,
                                            classes = Classes}} ->
                                   Unit0#plot_unit{sex = Sex, classes = Classes,
                                                   looks = Looks,
                                                   name = lang:get("会长分身")};
                               _Else -> Unit0#plot_unit{name = UnitName}
                           end;
                       _Else -> Unit0#plot_unit{name = UnitName}
                   end,
            {ok, Unit};
        _ ->
            logger:error("无法创建单位:[BaseId:~w]不存在",
                         [UnitBaseId],
                         plot_quest,
                         139),
            false
    end;
make_task_unit(#plot_quest_unit{label = create_unit,
                                base_id = UnitBaseId = 73076,
                                pos = {point, Map1, X1, Y1}, dir = Dir,
                                act_type = ActType, id = Id1},
               #quest_progress{id = ProgId}, _Role,
               #quest_data{id = QuestId}, _Args) ->
    case unit_data:get(73076) of
        #unit_data{type = Type1, fun_type = FunType1,
                   name = UnitName1} ->
            Unit1 = #plot_unit{id = Id1, base_id = 73076,
                               type = Type1, fun_type = FunType1,
                               quest_id = QuestId, quest_prog_id = ProgId,
                               map = Map1, x = X1, y = Y1, dir = Dir,
                               act_type = ActType},
            get_unit_couple_unit(Unit1, UnitName1);
        _ ->
            logger:error("无法创建单位:[BaseId:~w]不存在",
                         [UnitBaseId],
                         plot_quest,
                         161),
            false
    end;
make_task_unit(#plot_quest_unit{label = create_unit,
                                base_id = UnitBaseId,
                                pos = {point, DefMap, DefX, DefY}, dir = Dir,
                                act_type = ActType, id = Id},
               #quest_progress{id = ProgId, dyn_ext_data = DynExtData},
               _Role, #quest_data{id = QuestId, sec_type = SecType},
               Args) ->
    case unit_data:get(UnitBaseId) of
        #unit_data{type = Type, fun_type = FunType,
                   name = UnitName, sex = DefSex, classes = DefClasses} ->
            NewLooks = case lists:keyfind(looks, 1, Args) of
                           {looks, Looks} -> Looks;
                           _ -> get_special_looks(SecType, DynExtData)
                       end,
            NewUnitName = case lists:keyfind(name, 1, Args) of
                              {name, Name} -> Name;
                              _ ->
                                  get_special_name(SecType,
                                                   UnitName,
                                                   DynExtData)
                          end,
            NewUnitSex = case lists:keyfind(sex, 1, Args) of
                             {sex, Sex} -> Sex;
                             _ -> get_special_sex(SecType, DefSex, DynExtData)
                         end,
            NewUnitClasses = case lists:keyfind(classes, 1, Args) of
                                 {classes, Classes} -> Classes;
                                 _ ->
                                     get_special_classes(SecType,
                                                         DefClasses,
                                                         DynExtData)
                             end,
            {Map, X, Y} = case lists:keyfind(rand_pos,
                                             1,
                                             DynExtData)
                              of
                              {rand_pos, RandPosX, RandPosY} ->
                                  {DefMap, RandPosX, RandPosY};
                              {rand_pos, RandMap, RandPosX, RandPosY} ->
                                  {RandMap, RandPosX, RandPosY};
                              _ -> {DefMap, DefX, DefY}
                          end,
            Unit = #plot_unit{id = Id, base_id = UnitBaseId,
                              type = Type, fun_type = FunType,
                              quest_id = QuestId, quest_prog_id = ProgId,
                              name = NewUnitName, map = Map, x = X, y = Y,
                              dir = Dir, act_type = ActType, looks = NewLooks,
                              sex = NewUnitSex, classes = NewUnitClasses},
            {ok, Unit};
        _ ->
            logger:error("无法创建单位:[BaseId:~w]不存在",
                         [UnitBaseId],
                         plot_quest,
                         210),
            false
    end;
make_task_unit(_PlotArgs, _Prog, _Role, _QuestData,
               _Args) ->
    false.

get_unit_couple_unit(Unit1, UnitName1) ->
    {ID1, ID2} = get_unit_couple_unit_id(),
    logger:debug("=======ID1: ~p   ID2：~p",
                 [ID1, ID2],
                 plot_quest,
                 220),
    erlang:put({plot_quest, get_unit_couple_unit},
               [{ID1, ID2}]),
    UnitT1 = case robot_mgr:get_role(ID1) of
                 {ok,
                  #robot_role{looks = Looks1, sex = Sex1,
                              classes = Classes1, name = Name1}} ->
                     Unit1#plot_unit{sex = Sex1, classes = Classes1,
                                     looks = Looks1, name = Name1};
                 _Else -> Unit1#plot_unit{name = UnitName1}
             end,
    {ok, {ID1, ID2}, UnitT1}.

get_unit_couple_unit_id() ->
    Now = date:unixtime2(),
    case campaign_mgr:get_camp_time(60019) of
        {StartTime, EndTime}
            when Now >= StartTime andalso Now =< EndTime ->
            case campaign_rank:lookup(60019) of
                #campaign_rank{list = RankList} ->
                    CoupleUnitList = [{ID1, ID2}
                                      || #campaign_rank_role{rank = Rank,
                                                             id = ID1,
                                                             id2 = ID2}
                                             <- RankList,
                                         lists:member(Rank, [1, 2, 3, 4, 5])],
                    case erlang:length(CoupleUnitList) >= 1 of
                        true ->
                            logger:debug("=======~ts",
                                         ["恩爱榜上的情侣"],
                                         plot_quest,
                                         242),
                            util:rand_list(CoupleUnitList);
                        _ -> get_unit_couple_unit_id2()
                    end;
                _ -> get_unit_couple_unit_id2()
            end;
        _ -> get_unit_couple_unit_id2()
    end.

get_unit_couple_unit_id2() ->
    case wedding_rank:lookup(3) of
        [] -> get_unit_couple_unit_id3();
        RankList ->
            CoupleUnitList = [ID
                              || #wedding_rank_rc{rank = Rank, id = ID}
                                     <- RankList,
                                 lists:member(Rank, [1, 2, 3, 4, 5])],
            case erlang:length(CoupleUnitList) >= 1 of
                true ->
                    logger:debug("=======~ts", ["周榜上的情侣"], plot_quest, 262),
                    util:rand_list(CoupleUnitList);
                _ -> get_unit_couple_unit_id3()
            end
    end.

get_unit_couple_unit_id3() ->
    case wedding_rank:lookup(4) of
        [] -> {0, 0};
        RankList ->
            CoupleUnitList = [ID
                              || #wedding_rank_rc{rank = Rank, id = ID}
                                     <- RankList,
                                 lists:member(Rank, [1, 2, 3, 4, 5])],
            case erlang:length(CoupleUnitList) >= 1 of
                true ->
                    logger:debug("=======~ts", ["总榜上的情侣"], plot_quest, 277),
                    util:rand_list(CoupleUnitList);
                _ -> {0, 0}
            end
    end.

make_plot_unit(BattleId, UnitBaseId,
               Pos = #{map := Map, x := X, y := Y},
               Role = #role{m_plot = #m_plot{unit_list = UnitList}},
               Args) ->
    case lists:keyfind(BattleId, #plot_unit.id, UnitList) of
        false ->
            case unit_data:get(UnitBaseId) of
                #unit_data{type = Type, fun_type = FunType,
                           name = UnitName, sex = DefSex,
                           classes = DefClasses} ->
                    NewLooks = case lists:keyfind(looks, 1, Args) of
                                   {looks, Looks} -> Looks;
                                   _ -> []
                               end,
                    NewUnitName = case lists:keyfind(name, 1, Args) of
                                      {name, Name} -> Name;
                                      _ -> UnitName
                                  end,
                    NewUnitSex = case lists:keyfind(sex, 1, Args) of
                                     {sex, Sex} -> Sex;
                                     _ -> DefSex
                                 end,
                    NewUnitClasses = case lists:keyfind(classes, 1, Args) of
                                         {classes, Classes} -> Classes;
                                         _ -> DefClasses
                                     end,
                    Dir = maps:get(dir, Pos, 0),
                    Unit = #plot_unit{id = BattleId, base_id = UnitBaseId,
                                      type = Type, fun_type = FunType,
                                      dir = Dir, name = NewUnitName, map = Map,
                                      x = X, y = Y, looks = NewLooks,
                                      sex = NewUnitSex,
                                      classes = NewUnitClasses},
                    {ok, Unit};
                _ ->
                    logger:error("无法创建单位:[BaseId:~w]不存在",
                                 [UnitBaseId],
                                 plot_quest,
                                 320),
                    false
            end;
        #plot_unit{} ->
            logger:error("[~ts]无法创建单位:[剧情单位Id:~w][base_id:~w]",
                         [Role#role.name, BattleId, UnitBaseId],
                         plot_quest,
                         325),
            false
    end;
make_plot_unit(BattleId, UnitBaseId, Pos, Role,
               _Args) ->
    logger:error("[~ts]无法创建单位:[剧情单位Id:~w][base_id:~w][pos:~w]",
                 [Role#role.name, BattleId, UnitBaseId, Pos],
                 plot_quest,
                 330),
    false.

-spec remove_task_unit(#role{}, [term()]) -> #role{}.

remove_task_unit(Role, Param) ->
    case do_remove_task_unit(Param, Role, []) of
        {NRole, []} -> NRole;
        {NRole, DelUnitIds} ->
            L = [#plot_act{type =
                               plot_fun:act_to_type(plot_unit_del),
                           unit_id = Id}
                 || Id <- DelUnitIds],
            role:link_send(Role,
                           11010,
                           {0, "", 0, 0, L ++ [plot_act:get_end_plot_act()]}),
            NRole
    end.

do_remove_task_unit([], Role, DelUnitIds) ->
    {Role, DelUnitIds};
do_remove_task_unit([#quest_progress{param = Param}
                     | T],
                    Role, DelUnitIds) ->
    {NRole, NewDelUnitIds} = do_remove_task_unit(Param,
                                                 Role,
                                                 DelUnitIds),
    do_remove_task_unit(T, NRole, NewDelUnitIds);
do_remove_task_unit([{create_plot_unit, UnitId} | T],
                    Role = #role{m_plot =
                                     MPlot = #m_plot{unit_list = UnitList}},
                    DelUnitIds) ->
    NRole = Role#role{m_plot =
                          MPlot#m_plot{unit_list =
                                           lists:keydelete(UnitId,
                                                           #plot_unit.id,
                                                           UnitList)}},
    do_remove_task_unit(T, NRole, [UnitId | DelUnitIds]);
do_remove_task_unit([{create_unit,
                      UnitId,
                      _UnitBaseId,
                      _Pos,
                      _Dir,
                      _ActType}
                     | T],
                    Role = #role{m_plot =
                                     MPlot = #m_plot{unit_list = UnitList}},
                    DelUnitIds) ->
    NRole = Role#role{m_plot =
                          MPlot#m_plot{unit_list =
                                           lists:keydelete(UnitId,
                                                           #plot_unit.id,
                                                           UnitList)}},
    do_remove_task_unit(T, NRole, [UnitId | DelUnitIds]);
do_remove_task_unit([{create_rand_unit,
                      UnitId,
                      _UnitBaseId,
                      _Pos,
                      _Dir,
                      _ActType}
                     | T],
                    Role = #role{m_plot =
                                     MPlot = #m_plot{unit_list = UnitList}},
                    DelUnitIds) ->
    NRole = Role#role{m_plot =
                          MPlot#m_plot{unit_list =
                                           lists:keydelete(UnitId,
                                                           #plot_unit.id,
                                                           UnitList)}},
    do_remove_task_unit(T, NRole, [UnitId | DelUnitIds]);
do_remove_task_unit([_ | T], Role, DelUnitIds) ->
    do_remove_task_unit(T, Role, DelUnitIds).

remove_plot_unit(BattleId,
                 Role = #role{m_plot =
                                  MPlot = #m_plot{unit_list = UnitList}}) ->
    case lists:keyfind(BattleId, #plot_unit.id, UnitList) of
        #plot_unit{} ->
            logger:debug("[~ts]根据战场Id删除剧情单位[~w]",
                         [Role#role.name, BattleId],
                         plot_quest,
                         366),
            L = [#plot_act{type =
                               plot_fun:act_to_type(plot_unit_del),
                           unit_id = BattleId}],
            role:link_send(Role,
                           11010,
                           {0, "", 0, 0, L ++ [plot_act:get_end_plot_act()]}),
            NewUnitList = lists:keydelete(BattleId,
                                          #plot_unit.id,
                                          UnitList),
            NewMPlot = MPlot#m_plot{unit_list = NewUnitList},
            Role#role{m_plot = NewMPlot};
        _False ->
            logger:debug("[~ts]根据战场Id删除剧情单位~w",
                         [Role#role.name, _False],
                         plot_quest,
                         373),
            Role
    end.

-spec kill(#role{}, #plot_unit{}) -> #role{}.

kill(Role = #role{s_action = 4}, _PlotUnit) -> Role;
kill(Role = #role{m_quest = #m_quest{quest = Quests},
                  s_event = 2},
     PlotUnit = #plot_unit{base_id = UnitBaseId = 73308}) ->
    case check_task_unit(Quests, PlotUnit) of
        true ->
            case unit_convert:to(unit, UnitBaseId) of
                {ok, Unit0 = #unit{}} ->
                    Unit = case robot:make_robot(quest_guild,
                                                 #{attr_ratio => 100},
                                                 Role)
                               of
                               {true, Robot = #robot_role{}} -> [Robot];
                               _Else -> Unit0
                           end,
                    logger:debug("击杀任务剧情单位事件:~w",
                                 [UnitBaseId],
                                 plot_quest,
                                 392),
                    combat_mgr:start_combat(14, Role, Unit),
                    Role;
                _ ->
                    logger:error("转换单位出错[type:~w][~w]",
                                 [unit, UnitBaseId],
                                 plot_quest,
                                 396),
                    Role
            end;
        _ ->
            logger:error("不符合任务单位要求", [], plot_quest, 400),
            Role
    end;
kill(Role = #role{m_quest = #m_quest{quest = Quests},
                  s_event = 2},
     PlotUnit = #plot_unit{base_id = UnitBaseId}) ->
    case check_task_unit(Quests, PlotUnit) of
        true ->
            case unit_convert:to(unit, UnitBaseId) of
                {ok, Unit = #unit{}} ->
                    logger:debug("击杀任务剧情单位事件:~w",
                                 [UnitBaseId],
                                 plot_quest,
                                 408),
                    combat_mgr:start_combat(2, Role, Unit),
                    Role;
                _ ->
                    logger:error("转换单位出错[type:~w][~w]",
                                 [unit, UnitBaseId],
                                 plot_quest,
                                 412),
                    Role
            end;
        _ ->
            logger:error("不符合任务单位要求", [], plot_quest, 416),
            Role
    end;
kill(Role = #role{s_event = 19},
     PlotUnit = #plot_unit{fun_type = 31}) ->
    meet_pet:kill(Role, PlotUnit);
kill(Role = #role{m_quest = #m_quest{quest = Quests}},
     PlotUnit = #plot_unit{base_id = UnitBaseId}) ->
    case role_misc:check_event(Role) of
        true ->
            case check_task_unit(Quests, PlotUnit) of
                true ->
                    case unit_convert:to(unit, UnitBaseId) of
                        {ok, Unit = #unit{}} ->
                            logger:debug("击杀任务剧情单位事件:~w",
                                         [UnitBaseId],
                                         plot_quest,
                                         428),
                            combat_mgr:start_combat(2, Role, Unit),
                            Role;
                        _ ->
                            logger:error("转换单位出错[type:~w][~w]",
                                         [unit, UnitBaseId],
                                         plot_quest,
                                         432),
                            Role
                    end;
                _ ->
                    logger:debug("不符合任务单位要求", [], plot_quest, 436),
                    Role
            end;
        _Err ->
            logger:error("地图事件错误, [Err:~w]",
                         [_Err],
                         plot_quest,
                         440),
            Role
    end;
kill(Role, #plot_unit{}) -> Role.

get_quest_plot_unit(Data = #quest_data{progress =
                                           Progs},
                    Role) ->
    get_quest_plot_unit(Progs, Data, Role, []);
get_quest_plot_unit(#quest{id = QuestId}, Role) ->
    case quest_data:get(QuestId) of
        Data = #quest_data{} -> get_quest_plot_unit(Data, Role);
        _ -> []
    end.

get_quest_plot_unit([], _Data, _Role, Acc) ->
    lists:reverse(Acc);
get_quest_plot_unit([Prog = #quest_progress{param =
                                                Param}
                     | Rest],
                    QuestData, Role, Acc) ->
    Rtn = case parse_param(Param, Prog, QuestData) of
              PlotUnitArgs = #plot_quest_unit{} ->
                  make_task_unit(PlotUnitArgs, Prog, Role, QuestData, []);
              _False -> false
          end,
    case Rtn of
        {ok, PlotUnit} ->
            get_quest_plot_unit(Rest,
                                QuestData,
                                Role,
                                [PlotUnit | Acc]);
        _ -> get_quest_plot_unit(Rest, QuestData, Role, Acc)
    end.

check_task_unit([], _PlotUnit) -> false;
check_task_unit([#quest{progress = Progs} | T],
                PlotUnit) ->
    case check_task_unit(Progs, PlotUnit) of
        true -> true;
        false -> check_task_unit(T, PlotUnit)
    end;
check_task_unit([#quest_progress{target = UnitBaseId,
                                 param =
                                     [{create_unit,
                                       UnitId,
                                       UnitBaseId,
                                       _Pos,
                                       _Dir,
                                       _ActType}],
                                 finish = 0}
                 | _T],
                #plot_unit{id = UnitId, base_id = UnitBaseId}) ->
    true;
check_task_unit([#quest_progress{target = UnitBaseId,
                                 param =
                                     [{create_rand_unit,
                                       UnitId,
                                       UnitBaseId,
                                       _Pos,
                                       _Dir,
                                       _ActType}],
                                 finish = 0}
                 | _T],
                #plot_unit{id = UnitId, base_id = UnitBaseId}) ->
    true;
check_task_unit([#quest_progress{target = UnitBaseId,
                                 param =
                                     [{create_rand_unit,
                                       UnitId,
                                       _UnitBaseId,
                                       _Pos,
                                       _Dir,
                                       _ActType}],
                                 finish = 0}
                 | _T],
                #plot_unit{id = UnitId, base_id = UnitBaseId}) ->
    true;
check_task_unit([#quest_progress{target = UnitBaseId,
                                 finish = 0}
                 | _T],
                #plot_unit{base_id = UnitBaseId}) ->
    true;
check_task_unit([_H | T], PlotUnit) ->
    check_task_unit(T, PlotUnit).

reset_quest(Role = #role{m_quest =
                             #m_quest{quest = Quests}}) ->
    do_quest(Quests, Role).

do_quest([], Role) -> Role;
do_quest([Quest = #quest{id = QuestId, progress = Progs}
          | T],
         Role) ->
    Role1 = do_quest_progs(Progs, Quest, Role),
    {NRole, _AddUnitList} = do_create_task_unit(Progs,
                                                Role1,
                                                QuestId,
                                                [{revise, true}],
                                                []),
    do_quest(T, NRole).

do_quest_progs([], _Quest, Role) -> Role;
do_quest_progs([_ | T], Quest, Role) ->
    do_quest_progs(T, Quest, Role).

get_rand_pos(MapBaseId, X, Y) ->
    case map:rand_pos2(MapBaseId) of
        {PosX, PosY} -> {PosX, PosY};
        _Reason ->
            logger:error("剧情单位随机的位置错误[MapBaseId:~w][Reason:~w]",
                         [MapBaseId, _Reason],
                         plot_quest,
                         510),
            {X, Y}
    end.

init_unit_rand_pos([], _QuestData, _Role, ProgAcc,
                   PosAcc) ->
    {lists:reverse(ProgAcc), PosAcc};
init_unit_rand_pos([Prog | Rest], QuestData, Role,
                   ProgAcc, PosAcc) ->
    case init_unit_rand_pos(Prog, QuestData) of
        {ok, NewProg, Pos} ->
            NewProgAcc = [NewProg | ProgAcc],
            NewPosAcc = [Pos | PosAcc],
            init_unit_rand_pos(Rest,
                               QuestData,
                               Role,
                               NewProgAcc,
                               NewPosAcc);
        _ ->
            NewProgAcc = [Prog | ProgAcc],
            init_unit_rand_pos(Rest,
                               QuestData,
                               Role,
                               NewProgAcc,
                               PosAcc)
    end.

init_unit_rand_pos(Prog = #quest_progress{id = ProgId,
                                          dyn_ext_data = DynExtData,
                                          param =
                                              [{create_rand_unit,
                                                _Id,
                                                _UnitBaseId,
                                                {point, Map, DefX, DefY},
                                                _Dir,
                                                _ActType}]},
                   _QuestData) ->
    {X, Y} = get_rand_pos(Map, DefX, DefY),
    NewProg = Prog#quest_progress{dyn_ext_data =
                                      [{rand_pos, X, Y} | DynExtData]},
    {ok, NewProg, {ProgId, X, Y}};
init_unit_rand_pos(_Prog, _QuestData) -> false.

set_unit_rand_pos([], Progs) -> lists:reverse(Progs);
set_unit_rand_pos([{ProgId, X, Y} | Rest], Progs) ->
    case lists:keyfind(ProgId, #quest_progress.id, Progs) of
        Prog = #quest_progress{dyn_ext_data = DynExtData} ->
            NewProg = Prog#quest_progress{dyn_ext_data =
                                              [{rand_pos, X, Y} | DynExtData]},
            NewProgs = lists:keystore(ProgId,
                                      #quest_progress.id,
                                      Progs,
                                      NewProg),
            set_unit_rand_pos(Rest, NewProgs);
        _False -> set_unit_rand_pos(Rest, Progs)
    end;
set_unit_rand_pos([_ | Rest], Progs) ->
    set_unit_rand_pos(Rest, Progs).

revise_plot_unit(_QuestData = #quest_data{sec_type =
                                              _SecType},
                 _P, _PlotUnitArgs = #plot_quest_unit{is_rand_pos = 1},
                 _Args, _Role) ->
    false;
revise_plot_unit(QuestData, P,
                 PlotUnitArgs = #plot_quest_unit{is_rand_pos = 0}, Args,
                 Role) ->
    make_task_unit(PlotUnitArgs, P, Role, QuestData, Args).

parse_param([], _P, _QuestData) -> false;
parse_param([{create_unit,
              Id,
              UnitBaseId,
              Pos,
              Dir,
              ActType}
             | _Rest],
            _P, _QuestData) ->
    #plot_quest_unit{label = create_unit, id = Id,
                     base_id = UnitBaseId, pos = Pos, dir = Dir,
                     act_type = ActType};
parse_param([{create_rand_unit,
              Id,
              _UnitBaseId,
              Pos,
              Dir,
              ActType}
             | _Rest],
            #quest_progress{ext_data = ExtData},
            #quest_data{sec_type = 14}) ->
    case lists:keyfind(4, 1, ExtData) of
        {_, UnitBaseId} ->
            #plot_quest_unit{label = create_unit, id = Id,
                             base_id = UnitBaseId, pos = Pos, dir = Dir,
                             act_type = ActType, is_rand_pos = 1};
        _ -> false
    end;
parse_param([{create_rand_unit,
              Id,
              UnitBaseId,
              Pos,
              Dir,
              ActType}
             | _Rest],
            _P, _QuestData) ->
    #plot_quest_unit{label = create_unit, id = Id,
                     base_id = UnitBaseId, pos = Pos, dir = Dir,
                     act_type = ActType, is_rand_pos = 1};
parse_param([_H | Rest], P, QuestData) ->
    parse_param(Rest, P, QuestData).

get_special_looks(4, DynExtData) ->
    quest_classes:get_challange_looks(DynExtData);
get_special_looks(15, DynExtData) ->
    quest_marriage:get_challange_looks(DynExtData);
get_special_looks(16, DynExtData) ->
    quest_couple:get_challange_looks(DynExtData);
get_special_looks(_SecType, _DynExtData) -> [].

get_special_sex(15, DefSex, DynExtData) ->
    quest_marriage:get_special_sex(DynExtData, DefSex);
get_special_sex(16, DefSex, DynExtData) ->
    quest_couple:get_special_sex(DynExtData, DefSex);
get_special_sex(4, DefSex, DynExtData) ->
    quest_classes:get_special_sex(DynExtData, DefSex);
get_special_sex(_SecType, DefSex, _DynExtData) ->
    DefSex.

get_special_classes(15, DefClasses, DynExtData) ->
    quest_marriage:get_special_classes(DynExtData,
                                       DefClasses);
get_special_classes(4, DefClasses, DynExtData) ->
    quest_classes:get_special_classes(DynExtData,
                                      DefClasses);
get_special_classes(16, DefClasses, DynExtData) ->
    quest_couple:get_special_classes(DynExtData,
                                     DefClasses);
get_special_classes(_SecType, DefClasses,
                    _DynExtData) ->
    DefClasses.

get_special_name(4, DefName, DynExtData) ->
    quest_classes:get_special_name(DynExtData, DefName);
get_special_name(_SecType, DefName, _DynExtData) ->
    DefName.

