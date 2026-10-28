-file("src/mod/quest/quest_acquaintance.erl", 1).

-module(quest_acquaintance).

-export([login/1,
         reset/2,
         accept/3,
         rpc_accept/1,
         commit/1,
         add_trigger/3,
         remove_trigger/4,
         push/2,
         get_reward/2,
         patrol/3,
         dynamic_commit_loss/3,
         giveup/1,
         get_rand_find_item/2,
         check_commit/1,
         check_energy/1,
         kill/4,
         sync_quest_talk/3,
         apply_role/2,
         apply_evt/2,
         gm/2]).

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

-file("src/mod/quest/quest_acquaintance.erl", 33).

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

-file("src/mod/quest/quest_acquaintance.erl", 34).

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

-file("src/mod/quest/quest_acquaintance.erl", 35).

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

-file("src/mod/quest/quest_acquaintance.erl", 36).

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

-file("src/mod/quest/quest_acquaintance.erl", 37).

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

-file("src/mod/quest/quest_acquaintance.erl", 38).

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

-file("src/mod/quest/quest_acquaintance.erl", 39).

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

-file("src/mod/quest/quest_acquaintance.erl", 40).

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

-file("src/mod/quest/quest_acquaintance.erl", 41).

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

-file("src/mod/quest/quest_acquaintance.erl", 42).

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

-file("src/mod/quest/quest_acquaintance.erl", 43).

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

-file("src/mod/quest/quest_acquaintance.erl", 44).

-file("inc/npc_shop.hrl", 1).

-record(npc_shop_item_data,
        {base_id :: undefined | pos_integer(),
         name :: undefined | pos_integer(),
         classes = 0 :: non_neg_integer(),
         sex = 0 :: non_neg_integer(),
         step = 0 :: non_neg_integer(),
         type = 0 :: non_neg_integer(),
         group = 0 :: non_neg_integer(),
         lev_limit = 0 :: non_neg_integer(),
         price :: undefined | pos_integer(),
         item_cost :: undefined | pos_integer()}).

-file("src/mod/quest/quest_acquaintance.erl", 45).

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

-file("src/mod/quest/quest_acquaintance.erl", 46).

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

-file("src/mod/quest/quest_acquaintance.erl", 47).

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

-file("src/mod/quest/quest_acquaintance.erl", 48).

login(Role = #role{m_quest =
                       #m_quest{quest_acquaintance =
                                    #quest_acquaintance{quest_id = QuestId,
                                                        ring = Ring}}})
    when QuestId =/= 0 ->
    NRole = #role{m_quest =
                      MQuest = #m_quest{quest_acquaintance = QuestAcq}} =
                del_type(Role),
    NewQuestAcq = QuestAcq#quest_acquaintance{quest_id = 0,
                                              round = 0, partner_id = 0,
                                              partner_name = "",
                                              ring = max(0, Ring - 1)},
    NewMQuest = MQuest#m_quest{quest_acquaintance =
                                   NewQuestAcq},
    Role1 = NRole#role{m_quest = NewMQuest},
    L = [#trigger{label = evt_team_leave, a = [],
                  m = quest_acquaintance, f = apply_evt}],
    {_, NewRole} = role_trigger:add(L, Role1),
    {ok, NewRole};
login(Role) ->
    L = [#trigger{label = evt_team_leave, a = [],
                  m = quest_acquaintance, f = apply_evt}],
    {_, Role1} = role_trigger:add(L, Role),
    {ok, Role1}.

reset(Role, _OldRole) ->
    NRole = #role{m_quest =
                      MQuest = #m_quest{quest_acquaintance = QuestAcq}} =
                del_type(Role),
    NewQuestAcq = QuestAcq#quest_acquaintance{quest_id = 0,
                                              round = 0, partner_id = 0,
                                              partner_name = "",
                                              last_commited = 0,
                                              last_accepted = 0,
                                              rpc_accepted = 0, ring = 0},
    NewMQuest = MQuest#m_quest{quest_acquaintance =
                                   NewQuestAcq},
    NewRole = NRole#role{m_quest = NewMQuest},
    {ok, NewRole}.

accept(QuestData = #quest_data{id = _QuestId},
       Role = #role{}, _AccQuestId) ->
    {NewQuest, Role1} = do_accept(QuestData, Role),
    {NewQuest, Role1};
accept(_QuestData, _Role, _AccQuestId) ->
    {false, lang:get("结缘任务接受失败")}.

rpc_accept(#role{lev = Lev}) when Lev < 30 ->
    FailReason = util:flist(lang:get("角色等级达到~w才能领取结缘任务"),
                            [30]),
    {false, FailReason};
rpc_accept(Role = #role{pid = Pid,
                        m_quest =
                            MQuest = #m_quest{quest_acquaintance =
                                                  QP = #quest_acquaintance{ring
                                                                               =
                                                                               Ring,
                                                                           last_accepted
                                                                               =
                                                                               Last,
                                                                           rpc_accepted
                                                                               =
                                                                               RpcAccepted}},
                        m_team = #m_team{pid = TeamPid, status = 1}, id = Id,
                        name = Name})
    when is_pid(TeamPid) ->
    Now = date:unixtime(),
    Result = case check_accept(Role, Now) of
                 {ok, #team_mate{id = PartnerId, name = PartnerName}} ->
                     case rand_quest(Role#role{m_quest =
                                                   MQuest#m_quest{quest_acquaintance
                                                                      =
                                                                      QP#quest_acquaintance{done_list
                                                                                                =
                                                                                                [],
                                                                                            round
                                                                                                =
                                                                                                0}}},
                                     Now)
                         of
                         {true,
                          NewQacq = #quest_acquaintance{quest_id = QuestId,
                                                        round = Round}} ->
                             {NewRing, NewRpcAccepted} = case
                                                             date:is_same_day(Last,
                                                                              Now)
                                                             of
                                                             true ->
                                                                 {Ring + 1,
                                                                  RpcAccepted +
                                                                      1};
                                                             _ -> {1, 1}
                                                         end,
                             NewQuest = MQuest#m_quest{quest_acquaintance =
                                                           NewQacq#quest_acquaintance{partner_id
                                                                                          =
                                                                                          PartnerId,
                                                                                      partner_name
                                                                                          =
                                                                                          PartnerName,
                                                                                      ring
                                                                                          =
                                                                                          NewRing,
                                                                                      rpc_accepted
                                                                                          =
                                                                                          NewRpcAccepted}},
                             RoundRole = Role#role{m_quest = NewQuest},
                             case quest:callback_accept(RoundRole,
                                                        QuestId,
                                                        [loss, accept, fire])
                                 of
                                 {ok, NewRole} ->
                                     case role:apply(sync,
                                                     PartnerId,
                                                     {quest_acquaintance,
                                                      apply_role,
                                                      [{accept,
                                                        #{round => Round,
                                                          partner_name => Name,
                                                          quest_id => QuestId,
                                                          partner_id => Id,
                                                          team_pid => TeamPid,
                                                          time => Now}}]})
                                         of
                                         ok -> {ok, NewRole};
                                         {false, Why} -> {false, Why};
                                         _False ->
                                             logger:error("[~ts]领取结缘失败:~w",
                                                          [Role#role.name,
                                                           _False],
                                                          quest_acquaintance,
                                                          138),
                                             {false, lang:get("无法领取结缘任务")}
                                     end;
                                 ok -> {false, lang:get("系统繁忙, 请稍后尝试")}
                             end;
                         _ -> {false, lang:get("数据错误, 无法获取任务")}
                     end;
                 {false, Reason} -> {false, Reason}
             end,
    case Result of
        {ok, NRole} ->
            notice:send({pid, Pid}, 1, lang:get("领取成功")),
            {ok, NRole};
        {false, FailReason} -> {false, FailReason}
    end;
rpc_accept(_Role) ->
    {false, lang:get("只有与异性好友二人组队的队长才可以接任务哟")}.

commit(Role = #role{m_quest =
                        MQuest = #m_quest{quest_acquaintance =
                                              Qacq =
                                                  #quest_acquaintance{done_list
                                                                          =
                                                                          Done,
                                                                      quest_id =
                                                                          QuestId,
                                                                      partner_id
                                                                          =
                                                                          PartnerId}},
                    m_team = #m_team{pid = TeamPid, status = 1}, id = Id})
    when is_pid(TeamPid) ->
    Now = date:unixtime(),
    NewQacq = Qacq#quest_acquaintance{quest_id = 0,
                                      done_list = [QuestId | Done],
                                      last_commited = Now},
    NewMQuest = MQuest#m_quest{quest_acquaintance =
                                   NewQacq},
    case accept_next(Role#role{m_quest = NewMQuest}) of
        Role1 = #role{m_quest =
                          #m_quest{quest_acquaintance =
                                       #quest_acquaintance{quest_id = NewQid}}}
            when is_pid(TeamPid) ->
            case role:apply(sync,
                            PartnerId,
                            {quest_acquaintance,
                             apply_role,
                             [{commit,
                               #{team_pid => TeamPid, quest_id => QuestId,
                                 partner_id => Id, new_quest_id => NewQid,
                                 time => Now}}]})
                of
                ok -> {ok, Role1};
                {false, Msg} -> {error, Msg};
                _ -> {error, lang:get("提交结缘任务失败")}
            end;
        Role1 -> {ok, Role1}
    end;
commit(Role) -> {ok, Role}.

get_reward(#quest_data{rewards_commit = Rewards},
           Role = #role{m_quest =
                            #m_quest{quest_acquaintance =
                                         #quest_acquaintance{ring = Ring}}}) ->
    case Ring > 2 of
        true ->
            Msg =
                notice:format(lang:get("您今日已领取~ts次结缘任务奖励，获得的经验下降了"),
                              [{string_2, 5, 2}]),
            notice:send(Role, 3, Msg),
            {ok, Role, format:val_to_gain([{90010, 100}])};
        _ -> {ok, Role, Rewards}
    end.

add_trigger(Prog = #quest_progress{param =
                                       [{item_type, Type}],
                                   ext_data = ExtData},
            _Qid, Role) ->
    case lists:keyfind(9, 1, ExtData) of
        {9, Type} ->
            {ok, Prog#quest_progress{ext_data = ExtData}, Role};
        false ->
            {ok,
             Prog#quest_progress{ext_data = [{9, Type} | ExtData]},
             Role}
    end;
add_trigger(Prog = #quest_progress{param = Param}, Qid,
            Role)
    when is_list(Param) ->
    case lists:keyfind(type, 1, Param) of
        {type, Type} ->
            case do_add_trigger(Type, Prog, Qid, Role) of
                {ok, NewRole} -> {ok, Prog, NewRole};
                {ok, NewProg, NewRole} -> {ok, NewProg, NewRole};
                false -> {ok, Prog, Role}
            end;
        false -> {ok, Prog, Role}
    end;
add_trigger(Prog, _Qid, Role) -> {ok, Prog, Role}.

remove_trigger(#evt_finish_quest{id = Id}, Role, Id,
               Key) ->
    NewRole = role_trigger:del(Key, Role),
    erase(quest_acquaintance_patrol_move),
    {remove, NewRole};
remove_trigger(#evt_quest_del{id = Id}, Role, Id,
               Key) ->
    NewRole = role_trigger:del(Key, Role),
    erase(quest_acquaintance_patrol_move),
    {remove, NewRole};
remove_trigger(_Evt, _Role, _Id, _Key) -> ok.

dynamic_commit_loss(#quest{progress = Progress},
                    #quest_data{commit_loss = Loss}, Role) ->
    DynLoss = do_dynamic_commit_loss(Progress, Role, []),
    lists:flatten([Loss, DynLoss]).

giveup(Role = #role{m_quest =
                        MQuest = #m_quest{quest_acquaintance =
                                              Qacq =
                                                  #quest_acquaintance{quest_id =
                                                                          QuestId},
                                          quest = Quests}})
    when QuestId =/= 0 ->
    NewQacq = Qacq#quest_acquaintance{quest_id = 0},
    NewMQuest = MQuest#m_quest{quest_acquaintance =
                                   NewQacq},
    Role1 = Role#role{m_quest = NewMQuest},
    case lists:keyfind(QuestId, #quest.id, Quests) of
        false -> ok;
        Quest ->
            case quest_data:get(QuestId) of
                QuestData = #quest_data{} ->
                    case quest:commit_handle([del_quest,
                                              flush,
                                              giveup_fire],
                                             Role1,
                                             Quest,
                                             QuestData)
                        of
                        {ok, Role2 = #role{}} -> {ok, Role2};
                        _ -> {ok, Role1}
                    end;
                _ -> ok
            end
    end;
giveup(_Role) -> ok.

check_commit(Role) ->
    case do_check_commit(Role) of
        {true, _} -> true;
        Else -> Else
    end.

kill(_DoType, _QuestData, PlotUnit,
     Role = #role{m_quest =
                      #m_quest{quest_acquaintance =
                                   #quest_acquaintance{partner_id =
                                                           PartnerId}}}) ->
    case team:is_leader(Role) of
        true ->
            case team:get_fighters(Role) of
                {ok,
                 Fighters = [_,
                             #team_mate{status = 2, id = PartnerId}]} ->
                    Enemy = convert_enemy_unit(PlotUnit, Role),
                    case Enemy of
                        {ok, EnemyFighter} ->
                            combat_mgr:start_combat(2, Fighters, EnemyFighter),
                            Role;
                        _ ->
                            logger:debug("击杀战斗单位~w",
                                         [Enemy],
                                         quest_acquaintance,
                                         281),
                            {false, lang:get("发起战斗失败")}
                    end;
                {false, Msg} -> {false, Msg};
                _ -> {false, lang:get("只有与异性好友二人组队才能进入战斗哦")}
            end;
        _ -> {false, lang:get("只有与异性好友二人组队才能进入战斗哦")}
    end;
kill(_DoType, _QuestData, _PlotUnit, Role) ->
    logger:debug("非队长无法操作该单位[~w]",
                 [_PlotUnit#plot_unit.base_id],
                 quest_acquaintance,
                 292),
    Role.

sync_quest_talk(#quest{id = QuestId}, TalkType, Role) ->
    case do_check_commit(Role) of
        {true, #team_mate{pid = TeammatePid}}
            when is_pid(TeammatePid) ->
            logger:debug("同步对话 ----", [], quest_acquaintance, 299),
            role:pack_send(TeammatePid,
                           10223,
                           {1, QuestId, TalkType}),
            ok;
        {_, Msg} ->
            notice:send(Role, 1, Msg),
            false;
        _ -> false
    end;
sync_quest_talk(_Quest, _TalkType, _Role) -> false.

del_type(Role = #role{m_quest =
                          #m_quest{quest = Quests}}) ->
    case lists:keyfind(25, #quest.sec_type, Quests) of
        Quest = #quest{} ->
            NewRole = quest:del_quest(Quest, Role),
            NewRole;
        _ -> Role
    end.

check_energy(Role) ->
    Loss = format:val_to_loss([{90006, 50}]),
    case role_gain:do_notice(Loss, Role) of
        {ok, NewRole} -> {ok, NewRole};
        {false, #loss{msg = Msg}} -> {false, Msg}
    end.

push(#role{m_quest = #m_quest{quest_acquaintance = QP}},
     Cmd = 10247) ->
    sys_conn:pack_send(Cmd, {QP}),
    ok;
push(#role{}, {Cmd, Data}) ->
    sys_conn:pack_send(Cmd, Data),
    ok.

patrol(#evt_move_map{},
       #role{m_team = #m_team{pid = Pid, status = 2}}, _Data)
    when is_pid(Pid) ->
    ok;
patrol(#evt_move_map{base_id = MapBaseId}, Role,
       Data = #{map_base_id := MapBaseId,
                unit_list := UnitList, min_move_step := MinStep,
                max_move_step := MaxStep}) ->
    case get(quest_acquaintance_patrol_move) of
        undefined ->
            put(quest_acquaintance_patrol_move, 1),
            ok;
        Step ->
            if Step >= MinStep andalso Step =< MaxStep ->
                   do_patrol(Role, Data, Step);
               Step > MaxStep ->
                   case util:rand_list(UnitList) of
                       undefined ->
                           logger:debug("找不到任务怪物", [], quest_acquaintance, 353),
                           ok;
                       {UnitBaseId, _} -> start_combat_patrol(Role, UnitBaseId)
                   end;
               true ->
                   put(quest_acquaintance_patrol_move, Step + 1),
                   ok
            end
    end;
patrol(_Evt, Role, _Data) -> {ok, Role}.

apply_role(#role{name = Name,
                 m_quest =
                     #m_quest{quest_acquaintance =
                                  #quest_acquaintance{partner_id = PartnerId}}},
           {accept, #{partner_id := Id}})
    when PartnerId =/= 0 andalso PartnerId =/= Id ->
    Fmt = lang:get("~ts今天已领取过结缘任务了，无法与你一起领取结缘任务"),
    Args = [{role_2, Name}],
    Msg = notice:format(Fmt, Args),
    {ok, {false, Msg}};
apply_role(Role = #role{m_team =
                            #m_team{status = 2, pid = TeamPid},
                        m_quest =
                            #m_quest{quest_acquaintance =
                                         #quest_acquaintance{last_accepted =
                                                                 Last,
                                                             ring = Ring}}},
           {accept,
            #{partner_id := PartnerId, quest_id := QuestId,
              partner_name := PartnerName, round := NewRound,
              team_pid := TeamPid, time := Now}})
    when is_pid(TeamPid) ->
    NewRing = case date:is_same_day(Now, Last) of
                  true -> Ring + 1;
                  _ -> 1
              end,
    Role1 = #role{m_quest =
                      MQuest = #m_quest{quest_acquaintance = QP}} =
                del_type(Role),
    Steps = [condition, loss, accept, fire],
    QuestRole = Role1#role{m_quest =
                               MQuest#m_quest{quest_acquaintance =
                                                  QP#quest_acquaintance{quest_id
                                                                            =
                                                                            QuestId,
                                                                        partner_id
                                                                            =
                                                                            PartnerId,
                                                                        partner_name
                                                                            =
                                                                            PartnerName,
                                                                        round =
                                                                            NewRound,
                                                                        last_accepted
                                                                            =
                                                                            Now,
                                                                        done_list
                                                                            =
                                                                            [QuestId],
                                                                        ring =
                                                                            NewRing}}},
    case quest:callback_accept(QuestRole, QuestId, Steps) of
        {ok, NewRole} -> {ok, ok, NewRole};
        _Else ->
            logger:debug("条件 ~w", [_Else], quest_acquaintance, 387),
            {ok, {false, lang:get("队友未满足领取结缘任务的条件，领取结缘任务失败")}}
    end;
apply_role(#role{name = Name}, {accept, _}) ->
    Fmt = lang:get("~ts当前无法领取结缘任务"),
    Args = [{role_2, Name}],
    Msg = notice:format(Fmt, Args),
    {ok, {false, Msg}};
apply_role(Role = #role{m_team =
                            #m_team{status = 2, pid = TeamPid},
                        m_quest =
                            #m_quest{quest_acquaintance =
                                         #quest_acquaintance{round = Round,
                                                             partner_id =
                                                                 PartnerId,
                                                             ring = Ring}},
                        id = _SelfId},
           {commit,
            #{team_pid := TeamPid, quest_id := QuestId,
              partner_id := PartnerId, new_quest_id := NewQid,
              time := Now}})
    when is_pid(TeamPid) ->
    Steps = case Ring > 2 of
                true ->
                    [reward_no_loss, finish, del_quest, flush, fire];
                _ -> [reward_no_loss, finish, del_quest, flush, fire]
            end,
    Role2 = case quest:finish(QuestId, Role) of
                {ok, Role1} -> Role1;
                _ -> Role
            end,
    case quest_acquaintance_data:get_type(QuestId) of
        3 -> ok;
        _ -> ok
    end,
    case quest:callback_commit(Role2, QuestId, Steps) of
        {ok,
         NRole = #role{m_quest =
                           NMQuest = #m_quest{quest_acquaintance =
                                                  NQAcq =
                                                      #quest_acquaintance{done_list
                                                                              =
                                                                              Done}}}} ->
            case NewQid of
                0 ->
                    NewQAcq = NQAcq#quest_acquaintance{round = 0,
                                                       quest_id = NewQid,
                                                       partner_id = 0},
                    NewMQuest = NMQuest#m_quest{quest_acquaintance =
                                                    NewQAcq},
                    NewRole = final_reward(NRole#role{m_quest = NewMQuest}),
                    {ok, ok, NewRole};
                _ ->
                    ASteps = [condition, loss, accept, fire],
                    QuestRole = NRole#role{m_quest =
                                               NMQuest#m_quest{quest_acquaintance
                                                                   =
                                                                   NQAcq#quest_acquaintance{quest_id
                                                                                                =
                                                                                                NewQid,
                                                                                            round
                                                                                                =
                                                                                                Round
                                                                                                    +
                                                                                                    1,
                                                                                            last_accepted
                                                                                                =
                                                                                                Now,
                                                                                            done_list
                                                                                                =
                                                                                                [NewQid,
                                                                                                 QuestId
                                                                                                 | Done]}}},
                    case quest:callback_accept(QuestRole, NewQid, ASteps) of
                        {ok, NewRole} -> {ok, ok, NewRole};
                        _ -> {ok, {false, lang:get("伴侣未满足领取结缘任务的条件，领取结缘任务失败")}}
                    end
            end;
        _Else ->
            logger:debug("失败 ~w", [_Else], quest_acquaintance, 435),
            {ok, {false, lang:get("您的异性好友提交任务失败了")}}
    end;
apply_role(#role{m_quest =
                     #m_quest{quest_acquaintance =
                                  #quest_acquaintance{partner_name =
                                                          PartnerName}}},
           {commit, _}) ->
    Fmt = lang:get("你今天已跟~ts接取过结缘任务，当天只能跟TA一起做结缘任务哦"),
    Args = [{role_2, PartnerName}],
    Msg = notice:format(Fmt, Args),
    {ok, {false, Msg}};
apply_role(Role = #role{m_quest =
                            #m_quest{quest_acquaintance =
                                         #quest_acquaintance{partner_id =
                                                                 PartnerId,
                                                             partner_name =
                                                                 PartnerName,
                                                             ring = Ring}}},
           {leave, PartnerId}) ->
    NRole = #role{m_quest =
                      MQuest = #m_quest{quest_acquaintance = QuestAcq}} =
                del_type(Role),
    NewQuestAcq = QuestAcq#quest_acquaintance{quest_id = 0,
                                              round = 0, partner_id = 0,
                                              partner_name = "",
                                              ring = max(0, Ring - 1)},
    NewMQuest = MQuest#m_quest{quest_acquaintance =
                                   NewQuestAcq},
    NewRole = NRole#role{m_quest = NewMQuest},
    notice:send(Role,
                3,
                notice:format(lang:get("~ts离开队伍，结缘任务已消失"),
                              [{role_2, PartnerName}])),
    {ok, NewRole};
apply_role(_, _Args) ->
    logger:error("未知回调 ~w",
                 [_Args],
                 quest_acquaintance,
                 451),
    ok.

apply_evt(#evt_team_leave{},
          Role = #role{m_quest =
                           #m_quest{quest_acquaintance =
                                        #quest_acquaintance{partner_id =
                                                                PartnerId,
                                                            ring = Ring}},
                       id = Id, name = Name})
    when PartnerId =/= 0 ->
    NRole = #role{m_quest =
                      MQuest = #m_quest{quest_acquaintance = QuestAcq}} =
                del_type(Role),
    NewQuestAcq = QuestAcq#quest_acquaintance{quest_id = 0,
                                              round = 0, partner_id = 0,
                                              partner_name = "",
                                              ring = max(0, Ring - 1)},
    NewMQuest = MQuest#m_quest{quest_acquaintance =
                                   NewQuestAcq},
    NewRole = NRole#role{m_quest = NewMQuest},
    role:apply(async,
               PartnerId,
               {quest_acquaintance, apply_role, [{leave, Id}]}),
    notice:send(Role,
                3,
                notice:format(lang:get("~ts离开队伍，结缘任务已消失"),
                              [{role_2, Name}])),
    {ok, NewRole};
apply_evt(#evt_team_leave{}, _Role) -> ok;
apply_evt(_Info, _) ->
    logger:error("未知回调 ~w",
                 [_Info],
                 quest_acquaintance,
                 466),
    ok.

gm(Role = #role{}, clear) ->
    NRole = #role{m_quest =
                      MQuest = #m_quest{quest_acquaintance = QuestAcq}} =
                del_type(Role),
    NewQuestAcq = QuestAcq#quest_acquaintance{quest_id = 0,
                                              round = 0, partner_id = 0,
                                              partner_name = "",
                                              last_commited = 0,
                                              last_accepted = 0},
    NewMQuest = MQuest#m_quest{quest_acquaintance =
                                   NewQuestAcq},
    NewRole = NRole#role{m_quest = NewMQuest},
    {ok, NewRole}.

check_accept(#role{m_quest =
                       #m_quest{quest_acquaintance =
                                    #quest_acquaintance{quest_id = QuestId}}},
             _)
    when QuestId >= 1 ->
    {false, lang:get("当前已经领取任务, 无法重复领取")};
check_accept(Role = #role{m_quest =
                              #m_quest{quest_acquaintance =
                                           #quest_acquaintance{last_accepted =
                                                                   Last,
                                                               ring = Ring,
                                                               rpc_accepted =
                                                                   RpcAccepted}}},
             Now) ->
    case date:is_same_day(Now, Last) of
        true when Ring >= 2 ->
            {false,
             notice:format(lang:get("今日已领取~ts次结缘任务奖励，无需再使用~ts接取任务啦{face_1,38}"),
                           [{string_2, 5, 2}, {string_2, 5, lang:get("同心结")}])};
        true when RpcAccepted >= 1 ->
            {false,
             notice:format(lang:get("每人只能主动接~ts次结缘任务哦，请过其他方式提升"),
                           [{string_2, 5, 1}])};
        _ -> do_check_accept(Role)
    end.

rand_quest(Role = #role{lev = _Lev,
                        m_quest =
                            #m_quest{quest_acquaintance =
                                         #quest_acquaintance{last_accepted =
                                                                 Last}}}) ->
    rand_quest(Role, Last).

rand_quest(Role = #role{lev = _Lev,
                        m_quest =
                            #m_quest{quest_acquaintance =
                                         QuestPlant = #quest_acquaintance{round
                                                                              =
                                                                              Round,
                                                                          done_list
                                                                              =
                                                                              Done}}},
           Now) ->
    NewRound = Round + 1,
    case get_acceptable(Role, NewRound, Done) of
        {ok, QuestId} ->
            NewQuestPlant = QuestPlant#quest_acquaintance{done_list
                                                              =
                                                              [QuestId | Done],
                                                          round = NewRound,
                                                          quest_id = QuestId,
                                                          last_accepted = Now},
            {true, NewQuestPlant};
        _ -> {false, lang:get("无法找到制作任务数据")}
    end.

get_acceptable(Role, Round, Done) ->
    TaskList = quest_acquaintance_data:list(),
    TaskList1 = [Data
                 || Data = #{in_round := InRound} <- TaskList,
                    lists:member(Round, InRound) =:= true],
    TaskList2 = case [Data
                      || Data = #{id := Qid} <- TaskList1,
                         lists:member(Qid, Done) =:= false]
                    of
                    [H | T] -> [H | T];
                    _ -> TaskList1
                end,
    logger:debug("可选任务列表 ~w, done ~w",
                 [TaskList2, Done],
                 quest_acquaintance,
                 520),
    case util:rand_list(TaskList2, weight) of
        #{type := 4} ->
            case get_find_type_quest_id(Role) of
                {true, Id} -> {ok, Id};
                _ ->
                    logger:error("找不到寻物任务", [], quest_acquaintance, 526),
                    false
            end;
        #{id := QuestId} -> {ok, QuestId};
        _ ->
            logger:error("找不到任务", [], quest_acquaintance, 532),
            false
    end.

get_find_type_quest_id(#role{lev = Lev}) ->
    Classify = quest_acquaintance_data:get_classify(),
    Classify1 = [{Type, Ratio}
                 || {Type, Ratio, NeedLev} <- Classify, Lev >= NeedLev],
    case Classify1 of
        [_ | _] ->
            {GetType, _} = util:rand_list(Classify1, 2),
            case
                quest_acquaintance_data:get_find_type_quest_id(GetType)
                of
                QuestId when is_integer(QuestId) -> {true, QuestId};
                _ -> false
            end;
        _ -> false
    end.

do_accept(#quest_data{id = QuestId, type = Type,
                      sec_type = SecType, progress = Progress},
          Role = #role{m_quest =
                           Mquest = #m_quest{quest = Quests,
                                             quest_acquaintance = QuestAcq}}) ->
    Now = date:unixtime(),
    Progress0 = quest_prog_init:do(Role, Progress, QuestId),
    {NewProgress, LoadRole} = quest:load_progress(Progress0,
                                                  quest_acquaintance,
                                                  QuestId,
                                                  [],
                                                  Role),
    NewQuestAcq = QuestAcq#quest_acquaintance{quest_id =
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
                               quest_acquaintance = NewQuestAcq},
    NewRole = UnitRole#role{m_quest = NewMquest},
    {NQuest, NewRole}.

accept_next(Role = #role{m_quest =
                             MQuest = #m_quest{quest_acquaintance =
                                                   Qacq =
                                                       #quest_acquaintance{round
                                                                               =
                                                                               Round,
                                                                           last_accepted
                                                                               =
                                                                               Last}}}) ->
    Limit = get_max_round(),
    case Round + 1 > Limit of
        true ->
            NewQacq = Qacq#quest_acquaintance{round = 0,
                                              quest_id = 0, partner_id = 0},
            NewMQuest = MQuest#m_quest{quest_acquaintance =
                                           NewQacq},
            final_reward(Role#role{m_quest = NewMQuest});
        false ->
            case date:is_same_day(date:unixtime(), Last) of
                true when Round =:= 0 -> Role;
                _ ->
                    case rand_quest(Role) of
                        {true,
                         NewQacq = #quest_acquaintance{quest_id = QuestId}} ->
                            NewMQuest = MQuest#m_quest{quest_acquaintance =
                                                           NewQacq},
                            Role2 = Role#role{m_quest = NewMQuest},
                            case quest:callback_accept(Role2,
                                                       QuestId,
                                                       [condition,
                                                        loss,
                                                        accept,
                                                        fire])
                                of
                                {ok, NewRole} -> NewRole;
                                ok -> Role
                            end;
                        _R ->
                            logger:error("接受不了公会任务 ~w",
                                         [_R],
                                         quest_acquaintance,
                                         599),
                            Role
                    end
            end
    end.

do_check_accept(Role = #role{sex = Sex, id = SelfId,
                             m_quest =
                                 #m_quest{quest_acquaintance =
                                              #quest_acquaintance{partner_id =
                                                                      PartnerId,
                                                                  partner_name =
                                                                      PartnerName}}}) ->
    case team:is_leader(Role) of
        true ->
            case team:get_members(Role) of
                [#team_mate{sex = Sex}] ->
                    Msg = lang:get("对不起，只有与异性好友组队才能接取结缘任务哦"),
                    {false, Msg};
                [Mate = #team_mate{status = 2, id = MateId}]
                    when PartnerId =:= MateId orelse PartnerId =:= 0 ->
                    case friend:is_friend(SelfId, MateId) of
                        true -> {ok, Mate};
                        false -> {false, lang:get("对不起，只有与异性好友组队才能接取结缘任务哦")}
                    end;
                [#team_mate{status = 2}] ->
                    Fmt = lang:get("你今天已跟~ts接取过结缘任务，当天只能跟TA一起做结缘任务哦"),
                    Args = [{role_2, PartnerName}],
                    Msg = notice:format(Fmt, Args),
                    {false, Msg};
                [#team_mate{status = 3}] ->
                    Msg = lang:get("队友暂时离开队伍了，赶紧叫TA归队吧"),
                    {false, Msg};
                [#team_mate{status = 4}] ->
                    {false, lang:get("需二人一起组队才能领取任务哦")};
                _ ->
                    {false,
                     lang:get("结缘任务只能与异性好友组队接取哟，不如我帮你物色一名异性知己{face_1,9}")}
            end;
        _ -> {false, lang:get("带上您的异性好友才能领取任务")}
    end.

do_add_trigger(patrol,
               P = #quest_progress{ext_data = ExtData}, Id, Role) ->
    Patrol = quest_acquaintance_data:get_patrol(Id),
    case util:rand_list(Patrol, weight) of
        Data = #{map_base_id := MapBaseId} ->
            T1 = #trigger{label = evt_move_map,
                          m = quest_acquaintance, f = patrol, a = [Data]},
            {Key, Role1} = role_trigger:add(T1, Role),
            T2 = [#trigger{label = evt_finish_quest,
                           m = quest_acquaintance, f = remove_trigger,
                           a = [Id, Key]},
                  #trigger{label = evt_quest_del, m = quest_acquaintance,
                           f = remove_trigger, a = [Id, Key]}],
            {_, NewRole} = role_trigger:add(T2, Role1),
            {ok,
             P#quest_progress{ext_data = [{1, MapBaseId} | ExtData]},
             NewRole};
        undefined -> false
    end;
do_add_trigger(item,
               P = #quest_progress{ext_data = ExtData}, QuestId,
               Role) ->
    case lists:keyfind(3, 1, ExtData) of
        {3, BaseId} ->
            {ok,
             P#quest_progress{target = BaseId, ext_data = ExtData},
             Role};
        false ->
            case get_rand_find_item(QuestId, Role) of
                {_Type, ItemBaseId} ->
                    {ok,
                     P#quest_progress{target = ItemBaseId,
                                      ext_data = [{3, ItemBaseId} | ExtData]},
                     Role};
                Unknow ->
                    logger:error("没有找到寻物物品[~w]",
                                 [Unknow],
                                 quest_acquaintance,
                                 668),
                    false
            end;
        _False -> false
    end;
do_add_trigger(_Type, _P = #quest_progress{}, _Id,
               _Role) ->
    false.

get_rand_find_item(QuestId, Role = #role{}) ->
    case quest_acquaintance_data:get_find_type(QuestId) of
        5 -> get_market_shop_item(5, Role);
        6 -> get_market_shop_item(6, Role);
        1 -> get_npc_shop_item(1, Role);
        2 -> get_npc_shop_item(2, Role);
        3 -> get_npc_shop_item(3, Role);
        4 -> get_npc_shop_item(4, Role);
        _ -> false
    end.

get_market_shop_item(Type, #role{lev = RoleLev}) ->
    ItemList = quest_acquaintance_data:get_item_list(),
    FilterList = [{Id, Weight}
                  || #{id := Id, weight := Weight, type := Type1,
                       role_lev := Lev}
                         <- ItemList,
                     RoleLev >= Lev andalso Type1 =:= Type],
    case FilterList of
        [_ | _] ->
            {BaseId, _} = util:rand_list(FilterList, 2),
            {Type, BaseId};
        _ -> false
    end.

get_npc_shop_item(From, #role{classes = Classes}) ->
    {ShopType, Group} = case From of
                            1 -> {1, 0};
                            2 -> {2, 10};
                            3 -> {2, 20};
                            4 -> {2, 30}
                        end,
    Normal = npc_shop_data:get_item_list({ShopType, 0}),
    ClassesList = npc_shop_data:get_item_list({ShopType,
                                               Classes}),
    All = Normal ++ ClassesList,
    All1 = [A
            || A = #npc_shop_item_data{group = Group1} <- All,
               Group =:= Group1],
    case util:rand_list(All1) of
        #npc_shop_item_data{base_id = BaseId, type = Type} ->
            {Type, BaseId};
        _False -> false
    end.

do_patrol(Role, #{pcnt := Pcnt, unit_list := UnitList},
          Step) ->
    case util:rand(1, 1000) =< Pcnt of
        true ->
            case util:rand_list(UnitList, 2) of
                undefined ->
                    put(quest_acquaintance_patrol_move, Step + 1),
                    ok;
                {UnitBaseId, _Weight} ->
                    start_combat_patrol(Role, UnitBaseId)
            end;
        false ->
            put(quest_acquaintance_patrol_move, Step + 1),
            ok
    end.

start_combat_patrol(Role, UnitList)
    when is_list(UnitList) ->
    case util:rand_list(UnitList, 2) of
        undefined ->
            logger:error("巡逻任务没有单位列表", [], quest_acquaintance, 748),
            ok;
        {UnitBaseId, _Weight} ->
            start_combat_patrol(Role, UnitBaseId)
    end;
start_combat_patrol(Role, UnitBaseId)
    when is_integer(UnitBaseId) ->
    case role_misc:check_event_map(Role) of
        true ->
            case unit_convert:to(unit, UnitBaseId) of
                {ok, Unit = #unit{}} ->
                    case team:get_fighters(Role) of
                        {false, _Msg} -> false;
                        {ok, RoleIds} ->
                            combat_mgr:start_combat(2, RoleIds, Unit),
                            erase(quest_acquaintance_patrol_move),
                            ok
                    end;
                _ -> ok
            end;
        _ -> ok
    end.

do_dynamic_commit_loss([], _Role, Acc) -> Acc;
do_dynamic_commit_loss([#quest_progress{param = Param,
                                        target = Target, target_val = TargetVal}
                        | Rest],
                       Role, Acc) ->
    case lists:keyfind(type, 1, Param) of
        {type, classes_pet} ->
            Loss = #loss{label = pet, val = Target},
            do_dynamic_commit_loss(Rest, Role, [Loss | Acc]);
        {type, item} ->
            Loss = #loss{label = item_base_id,
                         val = [{Target, TargetVal}]},
            do_dynamic_commit_loss(Rest, Role, [Loss | Acc]);
        _False -> do_dynamic_commit_loss(Rest, Role, Acc)
    end.

get_max_round() -> 4.

final_reward(Role = #role{name = Name,
                          m_quest =
                              MQuest = #m_quest{quest_acquaintance =
                                                    Qacq =
                                                        #quest_acquaintance{ring
                                                                                =
                                                                                Ring,
                                                                            partner_name
                                                                                =
                                                                                PartnerName}}})
    when Ring =< 2 ->
    Role1 = Role#role{m_quest =
                          MQuest#m_quest{quest_acquaintance =
                                             Qacq#quest_acquaintance{partner_name
                                                                         =
                                                                         ""}}},
    case quest_acquaintance_data:get_final_reward() of
        L = [_ | _] ->
            case util:rand_list(L, item_weight) of
                #{item_id := ItemId, item_num := ItemNum,
                  announce := Announce} ->
                    ItemId0 = item_type:special_id(ItemId),
                    case Announce of
                        1 ->
                            AnStr =
                                notice:format(lang:get("刚结良缘，又获珍品，~ts在结缘任务中竟然获得了~ts，好眼红啊{face_1,29}"),
                                              [{role_2, Name},
                                               {item_2, ItemId0, ItemNum}]),
                            notice:cast(all, 5, AnStr);
                        _ -> ok
                    end,
                    Gain = format:val_to_gain([{ItemId0, 0, ItemNum}]),
                    case role_gain:do_notice(Gain, Role1) of
                        {ok, Role2} ->
                            Msg =
                                notice:format(lang:get("恭喜您和~ts完成了结缘任务，获得~ts，茫茫人海，相聚乃缘，要珍惜哦{face_1,2}"),
                                              [{role_2, PartnerName},
                                               {item_2, ItemId0, ItemNum}]),
                            notice:pop(Role, 2, Msg),
                            Role2;
                        {false, #gain{reason = bag_full}} ->
                            Title = lang:get("结缘任务奖励"),
                            Content = lang:get("背包已满，奖励通过邮件发送，请查收。"),
                            mail:send(Role,
                                      #{title => Title, content => Content,
                                        items => [{ItemId0, 0, ItemNum}]}),
                            Msg =
                                notice:format(lang:get("恭喜您和~ts完成了结缘任务，获得~ts，茫茫人海，相聚乃缘，要珍惜哦{face_1,2}"),
                                              [{role_2, PartnerName},
                                               {item_2, ItemId0, ItemNum}]),
                            notice:pop(Role, 2, Msg),
                            Role1;
                        _ -> Role1
                    end;
                _ -> Role1
            end;
        _ -> Role1
    end;
final_reward(Role = #role{m_quest =
                              MQuest = #m_quest{quest_acquaintance = Qacq}}) ->
    Msg =
        notice:format(lang:get("您今日已领取~ts次结缘任务奖励，无法再获得道具奖励"),
                      [{string_2, 5, 2}]),
    notice:send(Role, 3, Msg),
    Role#role{m_quest =
                  MQuest#m_quest{quest_acquaintance =
                                     Qacq#quest_acquaintance{partner_name =
                                                                 ""}}}.

convert_enemy_unit(#plot_unit{base_id = UnitBaseId},
                   Role) ->
    case unit_convert:to(unit, UnitBaseId) of
        {ok, Unit} -> {ok, Unit};
        _False ->
            logger:error("[~ts]发起战斗失败，无法转换敌人[BaseId:~w]数据:~w",
                         [Role#role.name, UnitBaseId, _False],
                         quest_acquaintance,
                         847),
            false
    end.

do_check_commit(Role = #role{m_quest =
                                 #m_quest{quest_acquaintance =
                                              #quest_acquaintance{partner_id =
                                                                      PartnerId,
                                                                  partner_name =
                                                                      PartnerName}}}) ->
    case team:is_leader(Role) of
        true ->
            case team:get_members(Role) of
                [Mate = #team_mate{status = 2, id = PartnerId}] ->
                    {true, Mate};
                [#team_mate{status = 2}] ->
                    Fmt = lang:get("你今天已跟~ts接取过结缘任务，当天只能跟TA一起做结缘任务哦"),
                    Args = [{role_2, PartnerName}],
                    Msg = notice:format(Fmt, Args),
                    {error, Msg};
                [#team_mate{status = 3}] ->
                    Msg = notice:format(lang:get("~ts暂时离开队伍了，赶紧叫TA归队吧"),
                                        [{role_2, PartnerName}]),
                    {error, Msg};
                [#team_mate{status = 4}] ->
                    {error,
                     notice:format(lang:get("需与~ts一起组队才能提交任务哦"),
                                   [{role_2, PartnerName}])};
                _ ->
                    {error,
                     notice:format(lang:get("需与~ts一起组队才能提交任务哦"),
                                   [{role_2, PartnerName}])}
            end;
        _ ->
            case team:is_team(Role) of
                true -> {error, lang:get("只有队长才可以提交任务")};
                false ->
                    {error,
                     notice:format(lang:get("需与~ts一起组队才能提交任务哦"),
                                   [{role_2, PartnerName}])}
            end
    end.

