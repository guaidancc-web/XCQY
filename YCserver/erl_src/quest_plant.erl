-file("src/mod/quest/quest_plant.erl", 1).

-module(quest_plant).

-behaviour(gen_server).

-export([start_link/0]).

-export([init/1,
         handle_call/3,
         handle_cast/2,
         handle_info/2,
         terminate/2,
         code_change/3]).

-export([accept/3,
         rpc_accept/1,
         sow/1,
         cultivate/1,
         commit/1,
         click_unit/3,
         add_trigger/3,
         push/2,
         get_reward/2,
         apply_role/2,
         login/1,
         notice_commit_reward/2,
         team_reward/2,
         gm_clear/0]).

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

-file("src/mod/quest/quest_plant.erl", 30).

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

-file("src/mod/quest/quest_plant.erl", 31).

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

-file("src/mod/quest/quest_plant.erl", 32).

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

-file("src/mod/quest/quest_plant.erl", 33).

-file("inc/team.hrl", 1).

-record(team,
        {ver = 0,
         pid :: undefined | pid(),
         leader,
         members = [] :: list(),
         applys = [],
         pos :: undefined | tuple(),
         member_num = 1,
         status = 0,
         matched = 0 :: non_neg_integer(),
         is_fly = 0 :: 0 | 1,
         order = [],
         team_formation = 1,
         team_formation_lev = 1,
         usurpers = [],
         type = 0,
         lev_flag = 0,
         lev_min = 0,
         lev_max = 0,
         last_join_time = 0,
         combat_num = 0,
         chat_recruit_info = [],
         target = 0,
         cross_type = 0,
         dun_id = 0}).

-record(m_team,
        {ver = 0,
         pid :: undefined | pid(),
         status = 3 :: non_neg_integer(),
         applys = [],
         mod = 0,
         speed = 0,
         recruitment_time = 0,
         recruitment_ids = lists:seq(1, 5),
         recruitment = [],
         member_num = 0}).

-record(team_mate,
        {ver = 0,
         id = {0, "", 0},
         name = "",
         pid :: undefined | pid(),
         face_id = 0 :: non_neg_integer(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         lev_break_times = 0 :: non_neg_integer(),
         status = 3 :: non_neg_integer(),
         looks = [] :: list(),
         fc = 0 :: non_neg_integer(),
         expect_type = [] :: non_neg_integer(),
         s_ride = 0,
         team_pid :: undefined | pid(),
         matched = 0 :: non_neg_integer(),
         formation_id = 1,
         formation_lev = 1,
         mod = 0,
         speed = 0,
         join_type = 1,
         join_sub_type = 0,
         join_time = 0,
         combat_num = 0,
         constellation_lev = 0,
         lover_id = {0, "", 0},
         lover_name = "",
         lover_status = 0,
         quest_couple_round = 0}).

-record(team_recruitment,
        {ver = 0,
         id :: undefined | tuple(),
         name = "" :: string(),
         face_id = 0 :: non_neg_integer(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         pid,
         type = 0,
         status = 1,
         member_num = 1,
         inviter_status = 0,
         lev_min = 0,
         lev_max = 0,
         matched = 0 :: non_neg_integer(),
         notice_list = [] :: list(),
         cur_classes = [] :: list(),
         constellation_lev = 0,
         chat_recruit_info = [],
         lover_id = {0, "", 0},
         lover_name = "",
         lover_status = 0,
         quest_couple_round = 0,
         precision_notice_list = [] :: list(),
         cross_type = 0}).

-record(team_recruit_room,
        {lev = 0, role_num = 0, members = []}).

-record(team_usurper,
        {id = {0, "", 0} :: tuple(),
         name = "" :: string(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         leader_objected = 0 :: 0 | 1,
         total = 0 :: integer(),
         pros = 0 :: integer(),
         cons = 0 :: integer(),
         time = 0 :: integer(),
         voted_ids = []}).

-record(team_recruit_lev_range,
        {flag = 0, lev = 0, val1 = 0, val2 = 0}).

-record(team_start_args, {pos, is_fly = 0, target = 0}).

-file("src/mod/quest/quest_plant.erl", 34).

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

-file("src/mod/quest/quest_plant.erl", 35).

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

-file("src/mod/quest/quest_plant.erl", 36).

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

-file("src/mod/quest/quest_plant.erl", 37).

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

-file("src/mod/quest/quest_plant.erl", 38).

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

-file("src/mod/quest/quest_plant.erl", 39).

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

-file("src/mod/quest/quest_plant.erl", 40).

-file("inc/pet.hrl", 1).

-record(pet_attr,
        {point = 0,
         p_str = 0,
         p_con = 0,
         p_mag = 0,
         p_agi = 0,
         p_end = 0,
         pre_str = 0,
         pre_con = 0,
         pre_mag = 0,
         pre_agi = 0,
         pre_end = 0,
         max_hp_apt_used = 0,
         max_phy_apt_used = 0,
         max_pdef_apt_used = 0,
         max_magic_apt_used = 0,
         max_aspd_apt_used = 0,
         hp_aptitude = 0,
         phy_aptitude = 0,
         pdef_aptitude = 0,
         magic_aptitude = 0,
         aspd_aptitude = 0,
         max_hp_aptitude = 0,
         max_phy_aptitude = 0,
         max_pdef_aptitude = 0,
         max_magic_aptitude = 0,
         max_aspd_aptitude = 0}).

-record(pet_tmp_aptitude,
        {is_valid = 0,
         tmp_genre = 0,
         tmp_pet_attr = #pet_attr{} :: #pet_attr{},
         tmp_skills = [],
         tmp_growth = 0,
         tmp_growth_type = 0,
         tmp_happy = 0,
         talent = 0}).

-record(pet_base,
        {id = 0,
         name = "",
         type = 1,
         genre = 0,
         hp_aptitude = 0,
         phy_aptitude = 0,
         pdef_aptitude = 0,
         magic_aptitude = 0,
         aspd_aptitude = 0,
         need_lev_break = 0,
         base_skills = [],
         vari_skills = [],
         lev_break_skills = [],
         has_break_skill = 0,
         base_happy = 1000,
         min_happy_ratio = 800,
         max_happy_ratio = 1050,
         min_happy_genre_ratio = 1000,
         max_happy_genre_ratio = 1100,
         growth_blue = 0,
         growth_purple = 0,
         growth_orange = 0,
         growth_red = 0,
         model_id = 0,
         model_id1 = 0,
         model_id2 = 0,
         model_id3 = 0,
         skin_id_0 = 0,
         skin_id_1 = 0,
         skin_id_2 = 0,
         skin_id_3 = 0,
         skin_id_s0 = 0,
         skin_id_s1 = 0,
         skin_id_s2 = 0,
         skin_id_s3 = 0,
         cost = [],
         lev_break_cost = [],
         max_wash_time = 0,
         manual_level = 0}).

-record(pet_base_skill,
        {id = 0,
         name = "",
         type = 0,
         step = 0,
         lev = 0,
         max_exp = 0,
         attr = []}).

-record(pet_skill,
        {id = 0,
         lev = 1,
         exp = 1,
         step = 0,
         type = 0,
         source = 1,
         is_lock = 0,
         is_last_study = 0}).

-record(pet_skin,
        {use_skin = 0,
         has_skin = [],
         add_hp_aptitude = 0,
         add_phy_aptitude = 0,
         add_pdef_aptitude = 0,
         add_magic_aptitude = 0,
         add_aspd_aptitude = 0,
         add_growth = 0}).

-record(pet,
        {ver = 32 :: pos_integer(),
         id = 1 :: pos_integer(),
         type = 1 :: pos_integer(),
         name = "" :: bitstring(),
         lev = 1 :: pos_integer(),
         talent = 0,
         growth = 0,
         growth_type = 2,
         use_growth = 0,
         genre = 0,
         exp = 0 :: non_neg_integer(),
         max_exp = 1 :: pos_integer(),
         status = 0 :: 0 | 1,
         base_id :: undefined | pos_integer(),
         attr :: undefined | tuple(),
         hp = 1,
         mp = 1,
         hp_max = 1,
         mp_max = 1,
         pet_attr = #pet_attr{} :: #pet_attr{},
         happy = 0 :: non_neg_integer(),
         looks = [] :: list(),
         skills = [],
         comprehend_lev = 1,
         grade = 0,
         grade_attr = [],
         stones = [],
         feed_item = [],
         feed_point = 0,
         free_reset_flag = 0,
         combat_talk = [],
         lock = 0,
         wash_time = 0,
         ai_skillid = 0,
         mount_skills = [],
         break_times = 0,
         is_first = 0,
         handbook_attr = [],
         handbook_num = 0,
         star_handbook_num = 0,
         pet_tmp_aptitude = #pet_tmp_aptitude{},
         glue_pudding_used = 0,
         pet_skin = #pet_skin{},
         spirit_attached = 0 :: 0 | 1,
         spirit_attached_id = 0 :: non_neg_integer(),
         spirit_skills = [],
         spirit_info = [],
         unreal = [],
         spirit_child_flag = 0 :: 0 | 1,
         spirit_child_id = {0, "", 0} :: tuple(),
         unreal_looks_flag = 0 :: 0 | 1,
         pet_rune = []}).

-record(m_pet,
        {ver = 2 :: pos_integer(),
         fresh_id = 1,
         next_id = 1 :: pos_integer(),
         pets = [] :: list(),
         rename = 3 :: non_neg_integer(),
         pet_nums = 5,
         time = 0}).

-record(m_pet_store,
        {ver = 1 :: pos_integer(),
         next_id = 1 :: pos_integer(),
         pets = [] :: list(),
         pet_nums = 4}).

-record(pet_goods,
        {base_id :: undefined | pos_integer(),
         actv_lev :: undefined | pos_integer(),
         stock :: undefined | pos_integer()}).

-record(pet_shop_data,
        {base_id :: undefined | pos_integer(),
         name :: undefined | binary(),
         actv_lev :: undefined | pos_integer(),
         def_buy_price :: undefined | pos_integer(),
         stock :: undefined | pos_integer()}).

-record(pet_exchange_data,
        {base_id = 0,
         item_id = 0,
         item_num = 0,
         exchange_item_num = 0,
         genre = 0,
         talent = 0}).

-record(pet_stone_polish_data,
        {stone_id = 0,
         attr = [],
         attr_name = 0,
         val_list = [],
         skill_list = []}).

-record(pet_unreal, {item_id = 0, timeout = 0}).

-record(pet_unreal_data,
        {item_id = 0,
         attr = [],
         skills = [],
         model_id = 0,
         skin_id = 0}).

-record(pet_rune,
        {rune_index = 0,
         rune_type = 0,
         rune_status = 0,
         rune_id = 0,
         rune_lev = 0,
         is_resonance = 0,
         resonances = []}).

-record(pet_resonance,
        {resonance_index = 0,
         resonance_id = 0,
         rune_index = 0}).

-file("src/mod/quest/quest_plant.erl", 41).

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

-file("src/mod/quest/quest_plant.erl", 42).

-record(state, {plants = []}).

login(Role = #role{m_quest =
                       MQuest = #m_quest{quest_plant =
                                             Plant = #quest_plant{quest_id = 0,
                                                                  phase = Phase,
                                                                  last_commited
                                                                      =
                                                                      Commited,
                                                                  round = Round,
                                                                  unit_id =
                                                                      UnitId,
                                                                  pos =
                                                                      {Map,
                                                                       X,
                                                                       Y}},
                                         quest = Quests}}) ->
    Now = date:unixtime(),
    End = date:datetime_to_seconds({2020,
                                    3,
                                    14,
                                    23,
                                    59,
                                    59}),
    Start = date:datetime_to_seconds({2020,
                                      3,
                                      12,
                                      0,
                                      0,
                                      0}),
    case date:is_same_day(Commited, Now) of
        _ when Start > Now orelse Now >= End ->
            NewQuests = lists:keydelete(17,
                                        #quest.sec_type,
                                        Quests),
            NewMQuest = MQuest#m_quest{quest = NewQuests,
                                       quest_plant =
                                           Plant#quest_plant{round = 0,
                                                             quest_id = 0,
                                                             unit_id = 0,
                                                             phase = 0}},
            {ok, Role#role{m_quest = NewMQuest}};
        true when Round =:= 0 orelse Round >= 6 ->
            NewMQuest = MQuest#m_quest{quest_plant =
                                           Plant#quest_plant{round = 0,
                                                             quest_id = 0,
                                                             unit_id = 0,
                                                             phase = 0}},
            {ok, Role#role{m_quest = NewMQuest}};
        true ->
            Timeout = case Round of
                          2 -> 180;
                          3 -> 300;
                          _ -> 600
                      end,
            UnitBaseId = phase_to_base_id(Phase),
            Role1 = plot_quest:create_task_unit(Role,
                                                UnitId,
                                                [#quest_progress{param =
                                                                     [{create_unit,
                                                                       UnitId,
                                                                       UnitBaseId,
                                                                       {point,
                                                                        Map,
                                                                        X,
                                                                        Y},
                                                                       0,
                                                                       "stand"}]}]),
            case Timeout - (Now - Commited) of
                Ts when Ts > 0 ->
                    Timer = #timer{id = quest_plant_accept_next,
                                   timeout = Ts * 1000, times = 1,
                                   m = quest_plant, f = apply_role,
                                   a = [accept_next]},
                    {ok, role_timer:set(Timer, Role1)};
                _ -> {ok, accept_next(Role1)}
            end;
        _ ->
            NewMQuest = MQuest#m_quest{quest_plant =
                                           Plant#quest_plant{round = 0,
                                                             quest_id = 0,
                                                             unit_id = 0,
                                                             phase = 0}},
            {ok, Role#role{m_quest = NewMQuest}}
    end;
login(Role = #role{m_quest =
                       MQuest = #m_quest{quest_plant =
                                             Plant = #quest_plant{quest_id = Id,
                                                                  round = Round,
                                                                  unit_id =
                                                                      UnitId,
                                                                  phase = Phase,
                                                                  pos =
                                                                      {Map,
                                                                       X,
                                                                       Y},
                                                                  last_accepted
                                                                      = Last},
                                         quest = Quests}}) ->
    Now = date:unixtime(),
    End = date:datetime_to_seconds({2020,
                                    3,
                                    14,
                                    23,
                                    59,
                                    59}),
    Start = date:datetime_to_seconds({2020,
                                      3,
                                      12,
                                      0,
                                      0,
                                      0}),
    case date:is_same_day(Last, Now) of
        _ when Start > Now orelse Now >= End ->
            NewQuests = lists:keydelete(Id, #quest.id, Quests),
            NewMQuest = MQuest#m_quest{quest = NewQuests,
                                       quest_plant =
                                           Plant#quest_plant{round = 0,
                                                             quest_id = 0,
                                                             unit_id = 0,
                                                             phase = 0}},
            Role1 = Role#role{m_quest = NewMQuest},
            Role2 = plot_quest:remove_task_unit(Role1,
                                                [{create_unit,
                                                  UnitId,
                                                  UnitId,
                                                  {point, Map, X, Y},
                                                  0,
                                                  "stand"}]),
            {ok, Role2};
        true when Round =:= 1 ->
            case lists:keyfind(Id, #quest.id, Quests) of
                #quest{finish = 0} ->
                    NewMQuest = MQuest#m_quest{quest_plant =
                                                   Plant#quest_plant{phase =
                                                                         0}},
                    Role1 = Role#role{m_quest = NewMQuest},
                    {ok, Role1};
                _ ->
                    UnitBaseId = phase_to_base_id(1),
                    NewMQuest = MQuest#m_quest{quest_plant =
                                                   Plant#quest_plant{phase =
                                                                         1}},
                    Role1 = plot_quest:create_task_unit(Role#role{m_quest =
                                                                      NewMQuest},
                                                        UnitId,
                                                        [#quest_progress{param =
                                                                             [{create_unit,
                                                                               UnitId,
                                                                               UnitBaseId,
                                                                               {point,
                                                                                Map,
                                                                                X,
                                                                                Y},
                                                                               0,
                                                                               "stand"}]}]),
                    {ok, Role1}
            end;
        true ->
            UnitBaseId = phase_to_base_id(Phase),
            Role1 = plot_quest:create_task_unit(Role,
                                                UnitId,
                                                [#quest_progress{param =
                                                                     [{create_unit,
                                                                       UnitId,
                                                                       UnitBaseId,
                                                                       {point,
                                                                        Map,
                                                                        X,
                                                                        Y},
                                                                       0,
                                                                       "stand"}]}]),
            {ok, Role1};
        _ ->
            NewQuests = lists:keydelete(Id, #quest.id, Quests),
            NewMQuest = MQuest#m_quest{quest = NewQuests,
                                       quest_plant =
                                           Plant#quest_plant{round = 0,
                                                             quest_id = 0,
                                                             unit_id = 0,
                                                             phase = 0}},
            Role1 = Role#role{m_quest = NewMQuest},
            Role2 = plot_quest:remove_task_unit(Role1,
                                                [{create_unit,
                                                  UnitId,
                                                  UnitId,
                                                  {point, Map, X, Y},
                                                  0,
                                                  "stand"}]),
            {ok, Role2}
    end.

accept(QuestData = #quest_data{id = _QuestId},
       Role = #role{m_quest =
                        #m_quest{quest_plant = #quest_plant{round = _Round}}},
       _AccQuestId) ->
    {NewQuest, Role1} = do_accept(QuestData, Role),
    {NewQuest, Role1}.

rpc_accept(#role{lev = Lev, pid = Pid}) when Lev < 40 ->
    FailReason = util:flist(lang:get("角色等级达到~w才能领取制作任务"),
                            [40]),
    notice:send({pid, Pid}, 1, FailReason),
    ok;
rpc_accept(Role = #role{pid = Pid, m_quest = MQuest}) ->
    Now = date:unixtime(),
    Result = case check_accept(Role, Now) of
                 true ->
                     case rand_quest(Role, Now) of
                         {true, NewQplant = #quest_plant{quest_id = QuestId}} ->
                             NewQuest = MQuest#m_quest{quest_plant = NewQplant},
                             RoundRole = Role#role{m_quest = NewQuest},
                             case quest:callback_accept(RoundRole,
                                                        QuestId,
                                                        [loss, accept, fire])
                                 of
                                 {ok, NewRole} -> {ok, NewRole};
                                 ok -> {false, lang:get("系统繁忙, 请稍后尝试")}
                             end;
                         _ -> {false, lang:get("数据错误, 无法获取任务")}
                     end;
                 {false, Reason} -> {false, Reason}
             end,
    case Result of
        {ok, NRole} ->
            push(NRole, 10224),
            notice:send({pid, Pid}, 1, lang:get("领取成功")),
            {ok, NRole};
        {false, FailReason} ->
            notice:send({pid, Pid}, 1, FailReason),
            ok
    end.

sow(#role{m_quest =
              #m_quest{quest_plant = #quest_plant{quest_id = 0}}}) ->
    {false, lang:get("当前没有制作任务")};
sow(#role{m_quest =
              #m_quest{quest_plant = #quest_plant{phase = Phase}}})
    when Phase > 0 ->
    {false, lang:get("不用再制作了")};
sow(#role{m_quest =
              #m_quest{quest_plant =
                           #quest_plant{pos = {Map2, _, _}}},
          pos = #pos{map = MapId}})
    when MapId =/= Map2 ->
    {false, lang:get("制作目的地不是当前地图")};
sow(#role{m_quest =
              #m_quest{quest_plant = #quest_plant{pos = {_, X, Y}}},
          pos = #pos{x = X1, y = Y1}})
    when abs(X - X1) > 600 orelse abs(Y - Y1) > 600 ->
    {false, lang:get("距离目的地太远")};
sow(Role = #role{m_quest =
                     MQuest = #m_quest{quest_plant =
                                           Plant = #quest_plant{phase = 0,
                                                                pos =
                                                                    {Map, X, Y},
                                                                quest_id =
                                                                    QuestId}}}) ->
    UnitBaseId = phase_to_base_id(1),
    Role1 = Role#role{m_quest =
                          MQuest#m_quest{quest_plant =
                                             Plant#quest_plant{phase = 1,
                                                               unit_id =
                                                                   QuestId}}},
    Role2 = plot_quest:create_task_unit(Role1,
                                        QuestId,
                                        [#quest_progress{param =
                                                             [{create_unit,
                                                               QuestId,
                                                               UnitBaseId,
                                                               {point,
                                                                Map,
                                                                X,
                                                                Y},
                                                               0,
                                                               "stand"}]}]),
    Role3 = role_trigger:fire(#evt_cultivate_plant{},
                              Role2),
    push(Role3, 10224),
    {ok, Role3}.

cultivate(#role{m_quest =
                    #m_quest{quest_plant =
                                 #quest_plant{phase = 1, round = Round}}})
    when Round < 2 ->
    {false, lang:get("祈福之树现在状态挺好的，不需要操劳")};
cultivate(#role{m_quest =
                    #m_quest{quest_plant =
                                 #quest_plant{phase = Phase, round = Round}}})
    when Phase > 1 andalso Round < 4 ->
    {false, lang:get("祈福之树现在状态挺好的，不需要操劳")};
cultivate(#role{m_quest =
                    #m_quest{quest_plant =
                                 #quest_plant{phase = Phase, round = Round}}})
    when Phase > 3 andalso Round < 5 ->
    {false, lang:get("祈福之树现在状态挺好的，不需要操劳")};
cultivate(Role = #role{m_quest =
                           #m_quest{quest_plant =
                                        #quest_plant{round = Round}}}) ->
    case team:get_members_follow_num(Role) of
        Mnum
            when is_integer(Mnum) andalso
                     Mnum > 2 andalso Round =:= 6 ->
            {false, lang:get("组队人数超过2人，无法种植祈福之树")};
        _ ->
            Role4 = role_trigger:fire(#evt_cultivate_plant{}, Role),
            {ok, Role4}
    end.

commit(Role = #role{m_quest =
                        MQuest = #m_quest{quest_plant =
                                              Qplant = #quest_plant{round =
                                                                        Round,
                                                                    phase =
                                                                        Phase,
                                                                    pos =
                                                                        {Map,
                                                                         X,
                                                                         Y},
                                                                    unit_id =
                                                                        UnitId,
                                                                    last_accepted
                                                                        =
                                                                        Last}}}) ->
    NewPhase = case Round > 2 of
                   true -> Phase + 1;
                   _ -> Phase
               end,
    UnitBaseId = phase_to_base_id(NewPhase),
    NewQplant = Qplant#quest_plant{quest_id = 0,
                                   last_commited = date:unixtime(),
                                   phase = NewPhase},
    NewMQuest = MQuest#m_quest{quest_plant = NewQplant},
    Role1 = Role#role{m_quest = NewMQuest},
    Role2 = plot_quest:remove_task_unit(Role1,
                                        [{create_unit,
                                          UnitId,
                                          UnitId,
                                          {point, Map, X, Y},
                                          0,
                                          "stand"}]),
    Role3 = plot_quest:create_task_unit(Role2,
                                        UnitId,
                                        [#quest_progress{param =
                                                             [{create_unit,
                                                               UnitId,
                                                               UnitBaseId,
                                                               {point,
                                                                Map,
                                                                X,
                                                                Y},
                                                               0,
                                                               "stand"}]}],
                                        [{revise, true}]),
    Role4 = case Round >= 2 andalso Round < 6 - 1 of
                true ->
                    Timeout = case Round of
                                  2 -> 180;
                                  3 -> 300;
                                  _ -> 600
                              end,
                    Now = date:unixtime(),
                    case date:is_same_day(Now, Last) of
                        true ->
                            Timer = #timer{id = quest_plant_accept_next,
                                           timeout = Timeout * 1000, times = 1,
                                           m = quest_plant, f = apply_role,
                                           a = [accept_next]},
                            role_timer:set(Timer, Role3);
                        _ -> accept_next(Role3)
                    end;
                _ -> accept_next(Role3)
            end,
    push(Role4, 10224),
    {ok, Role4}.

click_unit(Role = #role{m_quest =
                            #m_quest{quest_plant =
                                         #quest_plant{unit_id = UnitId}}},
           #plot_unit{id = UnitId}, _) ->
    cultivate(Role);
click_unit(Role, PlotUnit, _) ->
    plot_quest:kill(Role, PlotUnit).

get_reward(#quest_data{rewards_commit = _Rewards},
           Role = #role{lev = Lev,
                        m_quest =
                            #m_quest{quest_plant =
                                         #quest_plant{round = Round}}}) ->
    Rate = case Round of
               1 -> 4.0e-1;
               2 -> 5.99999999999999977796e-1;
               3 -> 8.0e-1;
               4 -> 1.19999999999999995559;
               5 -> 1.5;
               _ ->
                   case team:get_members_follow_num(Role) of
                       Mnum when is_integer(Mnum) andalso Mnum > 1 -> 10;
                       _ -> 5
                   end
           end,
    logger:debug("阶段~w, 比例 ~w",
                 [Round, Rate],
                 quest_plant,
                 330),
    Gain1 = case levup_data:get_exp({3304, Lev}) of
                #{exp := Exp} ->
                    G1 = [{90010, Exp}],
                    case pet:get_war_pet(Role) of
                        {ok, #pet{lev = PetLev}} ->
                            case levup_data:get_exp({3304, PetLev}) of
                                #{pet_exp := PetExp} -> [{90005, PetExp} | G1];
                                _ -> G1
                            end;
                        _ -> G1
                    end;
                _R ->
                    logger:debug("找不到经验模型 ~w ~w",
                                 [Lev, _R],
                                 quest_plant,
                                 343),
                    []
            end,
    Gain2 = [{K, round(V * Rate)} || {K, V} <- Gain1],
    Gain3 = case Round of
                6 ->
                    case util:rand_list(quest_plant_data:get_fruit_reward(),
                                        item_weight)
                        of
                        #{item_id := FruitId, item_num := FruitNum} ->
                            FruitId0 = item_type:special_id(FruitId),
                            [{FruitId0, 0, FruitNum} | Gain2];
                        _ -> Gain2
                    end;
                _ -> Gain2
            end,
    {Gain4, RewardMsgArgs} = case Round of
                                 6 ->
                                     case
                                         util:rand_list(quest_plant_data:get_rand_reward(),
                                                        item_weight)
                                         of
                                         #{item_id := ItemId,
                                           item_num := ItemNum,
                                           announce := Announce} ->
                                             ItemId0 =
                                                 item_type:special_id(ItemId),
                                             MsgArgs = #{item_base_id =>
                                                             ItemId0,
                                                         is_announce =>
                                                             Announce,
                                                         round => Round},
                                             {[{ItemId0, 0, ItemNum} | Gain3],
                                              MsgArgs};
                                         _ -> {Gain3, #{}}
                                     end;
                                 _ -> {Gain3, #{}}
                             end,
    NewRewards = Gain4,
    logger:debug("奖励信息 ~w", [NewRewards], quest_plant, 371),
    {ok, Role, NewRewards, RewardMsgArgs}.

notice_commit_reward(Role = #role{name = RName},
                     #{item_base_id := ItemId, is_announce := IsAnnounce,
                       round := 6}) ->
    case IsAnnounce of
        1 ->
            Fmt = lang:get("丰厚收获，~ts在收获[~ts]的时候获得一个~ts{face_1,18}"),
            Args = [{role_2, RName},
                    {string_2, 1, lang:get("祈福之树")},
                    {item_2, ItemId}],
            Msg = notice:format(Fmt, Args),
            notice:cast(all, 5, Msg);
        _ -> skip
    end,
    Msg2 = notice:format(lang:get("~ts获得~ts"),
                         [{role_2, RName}, {item_2, ItemId}]),
    team:notice(Role, Msg2),
    ok;
notice_commit_reward(_Role, _Args) -> ok.

team_reward(Role, #{round := 6}) ->
    team:leader_async(Role,
                      {quest_plant, apply_role, [reward]}),
    ok;
team_reward(_, _) -> ok.

gm_clear() -> quest_plant ! gm_clear.

add_trigger(Prog, _Qid, Role) -> {ok, Prog, Role}.

push(#role{m_quest = #m_quest{quest_plant = Plant}},
     Cmd = 10224) ->
    sys_conn:pack_send(Cmd, {Plant}),
    ok.

apply_role(Role, accept_next) ->
    Role1 = #role{m_quest =
                      #m_quest{quest_plant = #quest_plant{round = Round}}} =
                accept_next(Role),
    Msg = case Round of
              3 -> lang:get("可恶的害虫又来想要侵蚀小树苗的叶子了，快赶跑他们吧");
              4 -> lang:get("祈福植树快结出美味的果实了哟，快给他施肥吧");
              _ ->
                  lang:get("祈福之树已经结出美味的果实咯！不好，有些贪吃的小怪过来抢夺果实，快来<color='#ff"
                           "ff00'>守卫果实</color>吧")
          end,
    notice:pop(Role1, 2, Msg),
    push(Role1, 10224),
    {ok, Role1};
apply_role(Role = #role{lev = Lev, name = RName,
                        m_team = #m_team{status = 2}},
           reward)
    when Lev >= 40 ->
    case var:get_var(Role, day_five, 118, 0) >= 3 of
        true ->
            Msg =
                notice:format(lang:get("今天已经收获过他人种植的果实~ts次，不能再获得奖励"),
                              [{string_2, 5, 3}]),
            notice:send(Role, 3, Msg),
            ok;
        _ ->
            Rate = 2,
            Gain1 = case levup_data:get_exp({3304, Lev}) of
                        #{exp := Exp} ->
                            G1 = [{90010, Exp}],
                            case pet:get_war_pet(Role) of
                                {ok, #pet{lev = PetLev}} ->
                                    case levup_data:get_exp({3304, PetLev}) of
                                        #{pet_exp := PetExp} ->
                                            [{90005, PetExp} | G1];
                                        _ -> G1
                                    end;
                                _ -> G1
                            end;
                        _R ->
                            logger:debug("找不到经验模型 ~w ~w",
                                         [Lev, _R],
                                         quest_plant,
                                         439),
                            []
                    end,
            Gain2 = [{K, round(V * Rate)} || {K, V} <- Gain1],
            Gain3 = case
                        util:rand_list(quest_plant_data:get_rand_reward(),
                                       item_weight)
                        of
                        #{item_id := ItemId, item_num := ItemNum,
                          announce := Announce} ->
                            ItemId0 = item_type:special_id(ItemId),
                            case Announce of
                                1 ->
                                    Msg =
                                        notice:format(lang:get("喜从天降，~ts在收获[~ts]时获得一个~ts{face_1,18}"),
                                                      [{role_2, RName},
                                                       {string_2,
                                                        1,
                                                        lang:get("糖果蛋糕")},
                                                       {item_2, ItemId0}]),
                                    notice:cast(all, 5, Msg);
                                _ -> ok
                            end,
                            Msg2 = notice:format(lang:get("~ts获得~ts"),
                                                 [{role_2, RName},
                                                  {item_2, ItemId0}]),
                            team:notice(Role, Msg2),
                            [{ItemId0, 0, ItemNum} | Gain2];
                        _ -> Gain2
                    end,
            logger:debug("奖励信息 ~w", [Gain3], quest_plant, 458),
            NewRewards = format:val_to_gain(Gain3),
            Role1 = var:acc_var(Role, day_five, 118),
            NRole = case role_gain:do_notice(NewRewards, Role1) of
                        {ok, Role2} -> Role2;
                        _ -> Role
                    end,
            {ok, NRole}
    end;
apply_role(_, reward) -> ok;
apply_role(_, _Args) ->
    logger:error("未知回调 ~w", [_Args], quest_plant, 470),
    ok.

start_link() ->
    gen_server:start_link({local, quest_plant},
                          quest_plant,
                          [],
                          []).

init([]) ->
    logger:info("正在启动...", [], quest_plant, 481),
    State = #state{},
    logger:info("启动完成", [], quest_plant, 483),
    {ok, State}.

handle_call(_Request, _From, State) -> {noreply, State}.

handle_cast(_Msg, State) -> {noreply, State}.

handle_info({sow_outside, MapId, Name},
            State = #state{plants = Plants}) ->
    NewPlants = do_sow_outside(MapId, Name, Plants),
    {noreply, State#state{plants = NewPlants}};
handle_info(gm_clear,
            State = #state{plants = Plants}) ->
    do_gm_clear(Plants),
    {noreply, State};
handle_info(_Info, State) -> {noreply, State}.

terminate(_Reason, _State) -> ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

check_accept(#role{m_quest =
                       #m_quest{quest_plant =
                                    #quest_plant{quest_id = QuestId}}},
             _)
    when QuestId >= 1 ->
    {false, lang:get("当前已经领取任务, 无法重复领取")};
check_accept(Role = #role{m_quest =
                              #m_quest{quest_plant =
                                           #quest_plant{last_accepted = Last,
                                                        round = Round,
                                                        last_commited =
                                                            Commited}}},
             Now) ->
    End = date:datetime_to_seconds({2020,
                                    3,
                                    14,
                                    23,
                                    59,
                                    59}),
    Start = date:datetime_to_seconds({2020,
                                      3,
                                      12,
                                      0,
                                      0,
                                      0}),
    Timeout = case Round of
                  2 -> 180;
                  3 -> 300;
                  _ -> 600
              end,
    case date:is_same_day(Now, Last) of
        _ when Start > Now ->
            {false,
             notice:format(lang:get("植树节活动在~ts正式开启，敬请期待"),
                           [{string_2, 5, lang:get("3月12日")}])};
        _ when Now >= End -> {false, lang:get("活动已结束")};
        true when Round =:= 0 orelse Round >= 6 ->
            {false, lang:get("今日次数已经用完了")};
        true when Now - Commited < Timeout ->
            TimeStr = case Timeout - (Now - Commited) of
                          Ts when Ts > 60 ->
                              util:flist(lang:get("~w分钟"), [Ts div 60]);
                          Ts -> util:flist(lang:get("~w秒"), [Ts])
                      end,
            {false,
             notice:format(lang:get("请~ts后再来看看有没有任务"),
                           [{string_2, 5, TimeStr}])};
        _ ->
            case team:get_members_follow_num(Role) of
                Num when is_integer(Num) andalso Num > 1 ->
                    {false, lang:get("只能单人参与种植")};
                _ -> true
            end
    end.

rand_quest(Role = #role{lev = _Lev,
                        m_quest =
                            #m_quest{quest_plant =
                                         QuestPlant = #quest_plant{last_accepted
                                                                       = Last,
                                                                   round =
                                                                       Round,
                                                                   done_list =
                                                                       Done,
                                                                   pos = OldPos,
                                                                   phase =
                                                                       Phase}}},
           Now) ->
    {NewRound, NewDone} = case date:is_same_day(Last, Now)
                              of
                              true -> {Round + 1, Done};
                              _ -> {1, []}
                          end,
    case get_acceptable(Role, NewRound, NewDone) of
        {ok, QuestId} ->
            Pos = case NewRound of
                      1 ->
                          Map = util:rand_list([10001,
                                                10002,
                                                10003,
                                                10004,
                                                10007]),
                          {X, Y} = util:rand_list(get_sow_pos(Map)),
                          {Map, X, Y};
                      _ -> OldPos
                  end,
            NewPhase = case NewRound of
                           1 -> 0;
                           _ -> Phase
                       end,
            NewQuestPlant = QuestPlant#quest_plant{done_list =
                                                       [QuestId | NewDone],
                                                   round = NewRound,
                                                   quest_id = QuestId,
                                                   last_accepted = Now,
                                                   pos = Pos, phase = NewPhase},
            {true, NewQuestPlant};
        _ -> {false, lang:get("无法找到制作任务数据")}
    end.

get_acceptable(_Role, Round, _Done) ->
    QuestId = round_to_id(Round),
    {ok, QuestId}.

do_accept(#quest_data{id = QuestId, type = Type,
                      sec_type = SecType, progress = Progress},
          Role = #role{m_quest =
                           Mquest = #m_quest{quest = Quests,
                                             quest_plant = QuestPlant}}) ->
    Now = date:unixtime(),
    Progress0 = quest_prog_init:do(Role, Progress, QuestId),
    ProgressPos = reset_unit_pos(Progress0, Role),
    {NewProgress, LoadRole} =
        quest:load_progress(ProgressPos,
                            quest_plant,
                            QuestId,
                            [],
                            Role),
    NewQuestPlant = QuestPlant#quest_plant{quest_id =
                                               QuestId},
    UnitRole = plot_quest:create_task_unit(LoadRole,
                                           QuestId,
                                           NewProgress),
    Finish = case lists:keyfind(0,
                                #quest_progress.finish,
                                NewProgress)
                 of
                 false -> 1;
                 _ -> 0
             end,
    NQuest = #quest{id = QuestId, finish = Finish,
                    type = Type, sec_type = SecType, progress = NewProgress,
                    accept_time = Now},
    NewQuests = [NQuest | Quests],
    NewMquest = Mquest#m_quest{quest = NewQuests,
                               quest_plant = NewQuestPlant},
    NewRole = UnitRole#role{m_quest = NewMquest},
    {NQuest, NewRole}.

phase_to_base_id(1) -> 76180;
phase_to_base_id(2) -> 76181;
phase_to_base_id(3) -> 76182;
phase_to_base_id(_) -> 76183.

accept_next(Role = #role{m_quest =
                             MQuest = #m_quest{quest_plant =
                                                   Qplant = #quest_plant{round =
                                                                             Round,
                                                                         last_accepted
                                                                             =
                                                                             Last,
                                                                         pos =
                                                                             {Map,
                                                                              X,
                                                                              Y},
                                                                         unit_id
                                                                             =
                                                                             UnitId}},
                         name = Name}) ->
    Now = date:unixtime(),
    End = date:datetime_to_seconds({2020,
                                    3,
                                    14,
                                    23,
                                    59,
                                    59}),
    Start = date:datetime_to_seconds({2020,
                                      3,
                                      12,
                                      0,
                                      0,
                                      0}),
    Limit = 6,
    case date:is_same_day(Now, Last) andalso
             Round + 1 > Limit
        of
        _ when Start > Now orelse Now >= End ->
            NewQplant = Qplant#quest_plant{round = 0, quest_id = 0,
                                           phase = 0, unit_id = 0},
            NewMQuest = MQuest#m_quest{quest_plant = NewQplant},
            plot_quest:remove_task_unit(Role#role{m_quest =
                                                      NewMQuest},
                                        [{create_unit,
                                          UnitId,
                                          UnitId,
                                          {point, Map, X, Y},
                                          0,
                                          "stand"}]);
        true ->
            NewQplant = Qplant#quest_plant{round = 0, quest_id = 0,
                                           phase = 0, unit_id = 0},
            NewMQuest = MQuest#m_quest{quest_plant = NewQplant},
            quest_plant ! {sow_outside, Map, Name},
            plot_quest:remove_task_unit(Role#role{m_quest =
                                                      NewMQuest},
                                        [{create_unit,
                                          UnitId,
                                          UnitId,
                                          {point, Map, X, Y},
                                          0,
                                          "stand"}]);
        false ->
            case rand_quest(Role, Now) of
                {true,
                 NewQplant = #quest_plant{quest_id = QuestId,
                                          round = NewRound}} ->
                    Role1 = case NewRound of
                                1 when UnitId =/= 0 ->
                                    plot_quest:remove_task_unit(Role,
                                                                [{create_unit,
                                                                  UnitId,
                                                                  UnitId,
                                                                  {point,
                                                                   Map,
                                                                   X,
                                                                   Y},
                                                                  0,
                                                                  "stand"}]);
                                _ -> Role
                            end,
                    NewMQuest = MQuest#m_quest{quest_plant = NewQplant},
                    Role2 = Role1#role{m_quest = NewMQuest},
                    case quest:callback_accept(Role2,
                                               QuestId,
                                               [condition, loss, accept, fire])
                        of
                        {ok, NewRole} -> NewRole;
                        ok -> Role
                    end;
                _R ->
                    logger:error("接受不了公会任务 ~w", [_R], quest_plant, 645),
                    Role
            end
    end.

round_to_id(1) -> 83684;
round_to_id(2) -> 83685;
round_to_id(3) -> 83686;
round_to_id(4) -> 83687;
round_to_id(5) -> 83688;
round_to_id(_) -> 83689.

reset_unit_pos([], _) -> [];
reset_unit_pos([P = #quest_progress{dyn_ext_data =
                                        DynExtData,
                                    param =
                                        [{create_rand_unit,
                                          _Id,
                                          _UnitBaseId,
                                          _Pos,
                                          _Dir,
                                          _ActType}]}
                | T],
               Role = #role{m_quest =
                                #m_quest{quest_plant =
                                             #quest_plant{pos =
                                                              {MapId,
                                                               PosX,
                                                               PosY}}}})
    when MapId =/= 0 ->
    X = PosX - 100 + util:rand(1, 200),
    Y = PosY + util:rand(1, 100),
    NewP = P#quest_progress{dyn_ext_data =
                                [{rand_pos, MapId, X, Y} | DynExtData]},
    [NewP | reset_unit_pos(T, Role)];
reset_unit_pos([P = #quest_progress{dyn_ext_data =
                                        DynExtData,
                                    param =
                                        [{create_unit,
                                          _Id,
                                          _UnitBaseId,
                                          _Pos,
                                          _Dir,
                                          _ActType}]}
                | T],
               Role = #role{m_quest =
                                #m_quest{quest_plant =
                                             #quest_plant{pos =
                                                              {MapId,
                                                               PosX,
                                                               PosY}}}})
    when MapId =/= 0 ->
    X = PosX - 100 + util:rand(1, 200),
    Y = PosY + util:rand(1, 100),
    NewP = P#quest_progress{dyn_ext_data =
                                [{rand_pos, MapId, X, Y} | DynExtData]},
    [NewP | reset_unit_pos(T, Role)];
reset_unit_pos([P | T], Role) ->
    [P | reset_unit_pos(T, Role)].

do_sow_outside(MapId, Name, Plants) ->
    case make_unit(Name) of
        UnitBase = #unit_data{} ->
            case lists:keyfind(MapId, 1, Plants) of
                {MapId, Units} ->
                    Limit = get_max_num(MapId),
                    NewUnits = case length(Units) of
                                   N when N >= Limit ->
                                       {UnitId, _X, _Y} = lists:last(Units),
                                       Rest = lists:keydelete(UnitId, 1, Units),
                                       {X, Y} = get_rest_pos(MapId, Rest),
                                       unit_mgr:remove(UnitId),
                                       unit_mgr:create(UnitId,
                                                       UnitBase,
                                                       {MapId, X, Y}),
                                       [{UnitId, X, Y} | Rest];
                                   _ ->
                                       {X, Y} = get_rest_pos(MapId, Units),
                                       {ok, #unit{id = UnitId}} =
                                           unit_mgr:create(23,
                                                           UnitBase,
                                                           {MapId, X, Y}),
                                       [{UnitId, X, Y} | Units]
                               end,
                    lists:keyreplace(MapId, 1, Plants, {MapId, NewUnits});
                _ ->
                    {X, Y} = get_rest_pos(MapId, []),
                    {ok, #unit{id = UnitId}} = unit_mgr:create(23,
                                                               UnitBase,
                                                               {MapId, X, Y}),
                    NewUnits = [{UnitId, X, Y}],
                    [{MapId, NewUnits} | Plants]
            end;
        _ -> Plants
    end.

make_unit(RoleName) ->
    BaseId = phase_to_base_id(6),
    case unit_data:get(BaseId) of
        UnitBase = #unit_data{name = Name} ->
            NewUnitName = util:flist(lang:get("~ts的~ts"),
                                     [RoleName, Name]),
            UnitBase#unit_data{name = NewUnitName};
        _ ->
            logger:debug("找不到单位配置 ~w", [BaseId], quest_plant, 722),
            false
    end.

get_rest_pos(MapId, Rest) ->
    Used = [{Rx, Ry} || {_, Rx, Ry} <- Rest],
    util:rand_list(get_outsied_pos(MapId) -- Used).

get_outsied_pos(10001) ->
    [{3117, 1530},
     {4266, 625},
     {4219, 2499},
     {3051, 2899},
     {2000, 2464},
     {647, 2449},
     {1110, 2711},
     {1937, 1526},
     {4871, 1338},
     {4515, 3470}];
get_outsied_pos(10002) ->
    [{1096, 1519},
     {2955, 1936},
     {3015, 1305},
     {1567, 1037},
     {1407, 385}];
get_outsied_pos(10003) ->
    [{2312, 2565},
     {2288, 1332},
     {1101, 1501},
     {1634, 2073},
     {2078, 293},
     {1033, 285}];
get_outsied_pos(10004) ->
    [{1875, 422},
     {2586, 580},
     {1821, 935},
     {2702, 1702},
     {834, 2208}];
get_outsied_pos(10007) ->
    [{1124, 2747},
     {1373, 1523},
     {673, 942},
     {1112, 273},
     {287, 523}].

get_sow_pos(10001) ->
    [{468, 1218},
     {379, 1131},
     {732, 2568},
     {1390, 2944},
     {1876, 3264},
     {2278, 3430},
     {2549, 3828},
     {4498, 706}];
get_sow_pos(10002) ->
    [{1358, 1593},
     {1574, 1626},
     {2525, 1728},
     {1589, 402},
     {2615, 496}];
get_sow_pos(10003) ->
    [{2044, 2783},
     {607, 2252},
     {765, 1482},
     {1621, 279},
     {1212, 280}];
get_sow_pos(10004) ->
    [{850, 1559},
     {965, 1558},
     {2084, 430},
     {2307, 486},
     {1777, 2274}];
get_sow_pos(10007) ->
    [{664, 321},
     {843, 313},
     {1618, 337},
     {800, 1553},
     {1320, 2737}].

get_max_num(10001) -> 10;
get_max_num(_) -> 5.

do_gm_clear([]) -> ok;
do_gm_clear([{_, Units} | T]) ->
    lists:foreach(fun ({UnitId, _, _}) ->
                          unit_mgr:remove(UnitId);
                      (_) -> ok
                  end,
                  Units),
    do_gm_clear(T).

