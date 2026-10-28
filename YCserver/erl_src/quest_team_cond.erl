-file("src/mod/quest/quest_team_cond.erl", 1).

-module(quest_team_cond).

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

-file("src/mod/quest/quest_team_cond.erl", 13).

-file("inc/condition.hrl", 1).

-record(condition,
        {label :: undefined | atom(),
         op = eq ::
             ue | eq | lt | gt | le | ge | range | include,
         val :: undefined | term(),
         msg = "" :: list()}).

-file("src/mod/quest/quest_team_cond.erl", 14).

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

-file("src/mod/quest/quest_team_cond.erl", 15).

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

-file("src/mod/quest/quest_team_cond.erl", 16).

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

-file("src/mod/quest/quest_team_cond.erl", 17).

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

-file("src/mod/quest/quest_team_cond.erl", 18).

-export([callback_team_combat_notice/4,
         callback_team_accept_notice/4,
         check/2,
         check_cond/2,
         check_combat_cond/4,
         check_kill_unit/2,
         check_teammate/2]).

-spec check(QuestData, Role) -> true |
                                {false, CondFalse} when QuestData ::
                                                            #quest_data{},
                                                        Role :: #role{},
                                                        CondFalse ::
                                                            #condition{}.

check(#quest_data{id = Id, leader_cond = LeaderConds,
                  condition = Conds},
      Role) ->
    case team:is_leader(Role) of
        true ->
            case role_cond:check(LeaderConds ++ Conds, Role) of
                true -> check_teammate(Role, Id);
                {false, #condition{msg = Msg}} -> {false, Msg}
            end;
        false ->
            case team:is_team(Role) of
                false -> {false, lang:get("组队才可接受任务")};
                true -> {false, lang:get("队长才可接受任务")}
            end
    end.

check_cond(Role = #role{},
           Conds = [#condition{} | _]) ->
    case role_cond:check(Conds, Role) of
        {false, #condition{label = Label}} ->
            {ok, {false, Label}};
        true -> {ok, true}
    end;
check_cond(Role = #role{}, QId) when is_integer(QId) ->
    case quest_data:get(QId) of
        Data = #quest_data{sec_type = SecType} ->
            case check_quest_cond(SecType, Data, Role) of
                false -> {ok, false};
                Rtn -> {ok, Rtn}
            end;
        _ -> {ok, false}
    end.

check_quest_cond(Type = 3,
                 #quest_data{lev = MinLev, max_lev = MaxLev},
                 Role = #role{lev = RoleLev}) ->
    case check_team_quest_status(Type, Role) of
        true ->
            case RoleLev >= MinLev andalso
                     (RoleLev =< MaxLev orelse MaxLev =:= 0)
                of
                true -> true;
                false -> {false, {Type, lev, MinLev}}
            end;
        false -> false;
        Rtn -> Rtn
    end;
check_quest_cond(_Type, _Data, _Role) ->
    logger:error("未知的任务类型[~w]",
                 [_Type],
                 quest_team_cond,
                 102),
    false.

check_team_quest_status(Type = 3,
                        Role = #role{m_team = #m_team{status = Status}}) ->
    case team:is_team(Role) of
        true ->
            case Status of
                2 -> true;
                Status -> {false, acc, {Type, 2}}
            end;
        false -> false
    end;
check_team_quest_status(_SecType, _Role) -> true.

check_combat_cond(Type = 3, UnitBaseId, Teammates,
                  Role) ->
    Num = length(Teammates),
    case Num + 1 >= 2 of
        false ->
            team_combat_notice(Type, 2, Teammates, Role, {}),
            false;
        true ->
            {TrueAcc, FalseAcc} = do_check_unit_cond(Teammates,
                                                     UnitBaseId,
                                                     Role,
                                                     [],
                                                     []),
            case FalseAcc of
                [] ->
                    Followers = [Id || #team_mate{id = Id} <- TrueAcc],
                    AvgLev = team:avg_lev(Role, TrueAcc),
                    {ok,
                     Followers,
                     [{team_avg_lev, AvgLev},
                      {team_member_num, length(Followers) + 1}]};
                [{Label, Args} | _] ->
                    team_combat_notice(Type, Label, Teammates, Role, Args),
                    false
            end
    end;
check_combat_cond(_Type, _UnitBaseId, Teammates,
                  Role) ->
    Followers = [Id
                 || #team_mate{id = Id, status = 2} <- Teammates],
    {ok, [Role | Followers]}.

do_check_unit_cond([], _UnitBaseId, _Role, TrueAcc,
                   FalseAcc) ->
    {lists:reverse(TrueAcc), lists:reverse(FalseAcc)};
do_check_unit_cond([Mate = #team_mate{id = Id,
                                      name = Name, pid = Pid}
                    | Rest],
                   UnitBaseId, Role, TrueAcc, FalseAcc)
    when is_pid(Pid) ->
    case role:apply(sync,
                    Pid,
                    {quest_team_cond, check_kill_unit, [UnitBaseId]})
        of
        true ->
            do_check_unit_cond(Rest,
                               UnitBaseId,
                               Role,
                               [Mate | TrueAcc],
                               FalseAcc);
        false ->
            do_check_unit_cond(Rest,
                               UnitBaseId,
                               Role,
                               TrueAcc,
                               FalseAcc);
        {false, Label} ->
            do_check_unit_cond(Rest,
                               UnitBaseId,
                               Role,
                               TrueAcc,
                               [{Label, {Id, Name}} | FalseAcc]);
        _ ->
            do_check_unit_cond(Rest,
                               UnitBaseId,
                               Role,
                               TrueAcc,
                               FalseAcc)
    end;
do_check_unit_cond([_Mate | Rest], UnitBaseId, Role,
                   TrueAcc, FalseAcc) ->
    do_check_unit_cond(Rest,
                       UnitBaseId,
                       Role,
                       TrueAcc,
                       FalseAcc).

check_kill_unit(Role, UnitBaseId) ->
    case unit_data:get(UnitBaseId) of
        #unit_data{fun_type = FunType, condition = Conds} ->
            case check_team_combat_status(FunType, Role) of
                true ->
                    case role_cond:check(Conds, Role) of
                        true -> {ok, true};
                        {false,
                         #condition{label = Label, op = Op, val = Val}} ->
                            {ok, {false, {Label, Op, Val}}}
                    end;
                false -> {ok, false};
                {false, Rtn} -> {ok, Rtn}
            end;
        _ ->
            logger:error("无法找到任务击杀的单位[~w]",
                         [UnitBaseId],
                         quest_team_cond,
                         179),
            {ok, false}
    end.

check_team_combat_status(3,
                         Role = #role{m_team = #m_team{status = Status}}) ->
    case team:is_team(Role) of
        true ->
            case Status of
                2 -> true;
                Status -> {false, Status}
            end;
        false -> false
    end;
check_team_combat_status(_Type, _Role) -> true.

check_teammate(Role, QId) when is_integer(QId) ->
    case team:get_members(Role) of
        [] -> true;
        Teammates = [_ | _] ->
            case do_check_teammate(Teammates,
                                   Role,
                                   Teammates,
                                   QId,
                                   [])
                of
                true -> true;
                false -> false;
                {false, FalseAcc} ->
                    check_special_teammate(QId, FalseAcc, Role, Teammates)
            end;
        _ -> false
    end;
check_teammate(Role, Conds) ->
    case team:get_members(Role) of
        [] -> true;
        Teammates = [_ | _] ->
            case do_check_teammate(Teammates,
                                   Role,
                                   Teammates,
                                   Conds,
                                   [])
                of
                true -> true;
                false -> false;
                {false, _FalseAcc} -> false
            end;
        _ -> false
    end.

do_check_teammate([], _, _, _, []) -> true;
do_check_teammate([], _, _, _, FalseAcc) ->
    {false, FalseAcc};
do_check_teammate([#team_mate{pid = Pid, name = Name,
                              id = MateId}
                   | Rest],
                  Role, Teammates, Args, FalseAcc)
    when is_pid(Pid) ->
    case role:apply(sync,
                    Pid,
                    {quest_team_cond, check_cond, [Args]})
        of
        true ->
            do_check_teammate(Rest,
                              Role,
                              Teammates,
                              Args,
                              FalseAcc);
        false -> false;
        {false, Err} ->
            team_accept_notice(Err,
                               Teammates,
                               Role,
                               {MateId, Name}),
            false;
        {false, acc, Rtn} ->
            do_check_teammate(Rest,
                              Role,
                              Teammates,
                              Args,
                              [{Rtn, {MateId, Name}} | FalseAcc])
    end;
do_check_teammate([_H | Rest], Role, Teammates, Args,
                  FalseAcc) ->
    do_check_teammate(Rest,
                      Role,
                      Teammates,
                      Args,
                      FalseAcc).

check_special_teammate(3, FalseAcc, Role, Teammates) ->
    FalseLen = length(FalseAcc),
    TeamLen = length(Teammates),
    case TeamLen - FalseLen >= 2 of
        true -> true;
        false ->
            {Head, RoleInfo} = hd(FalseAcc),
            team_accept_notice(Head, Teammates, Role, RoleInfo),
            false
    end;
check_special_teammate(QId, FalseAcc, Role,
                       Teammates) ->
    case quest_data:get(QId) of
        #quest_data{sec_type = SecType} ->
            check_special_teammate(SecType,
                                   FalseAcc,
                                   Role,
                                   Teammates);
        _None -> false
    end.

team_accept_notice({Type = 3, Label = lev, NeedLev},
                   Teammates, Role, Args) ->
    callback_team_accept_notice(Role,
                                Type,
                                {Label, NeedLev},
                                Args),
    [role:apply(async,
                Pid,
                {quest_team_cond,
                 callback_team_accept_notice,
                 [Type, {Label, NeedLev}, Args]})
     || #team_mate{pid = Pid} <- Teammates,
        is_pid(Pid) =:= true],
    ok;
team_accept_notice({Type = 3, Label = 2}, Teammates,
                   Role, Args) ->
    callback_team_accept_notice(Role, Type, Label, Args),
    [role:apply(async,
                Pid,
                {quest_team_cond,
                 callback_team_accept_notice,
                 [Type, Label, Args]})
     || #team_mate{pid = Pid} <- Teammates,
        is_pid(Pid) =:= true],
    ok;
team_accept_notice(_Data, _Teammates, _Role, _Args) ->
    ok.

callback_team_accept_notice(#role{id = Rid,
                                  name = _Name},
                            3, {lev, NeedLev}, {MateId, Name}) ->
    case Rid =:= MateId of
        true ->
            Msg = notice:format(lang:get("您的等级不足~w级，无法接受任务"),
                                [NeedLev]),
            notice:return(Msg);
        false ->
            Msg = notice:format(lang:get("~ts的等级不足~w级，无法接受任务"),
                                [{role_2, Name}, NeedLev]),
            notice:return(Msg)
    end,
    ok;
callback_team_accept_notice(#role{id = RId}, 3, 2,
                            {Id, Name}) ->
    case RId =:= Id of
        true -> notice:return(lang:get("您当前未处于跟随状态，无法接受任务"));
        false ->
            Msg = notice:format(lang:get("~ts当前未处于跟随状态，无法接受任务"),
                                [{role_2, Name}]),
            notice:return(Msg)
    end,
    ok;
callback_team_accept_notice(_Role, _QuestType, _Label,
                            _Args) ->
    ok.

team_combat_notice(FunType = 3, Label = 1, Teammates,
                   Role, {OffId, OffName}) ->
    callback_team_combat_notice(Role,
                                FunType,
                                Label,
                                {OffName}),
    [role:apply(async,
                Pid,
                {quest_team_cond,
                 callback_team_combat_notice,
                 [FunType, Label, {OffName}]})
     || #team_mate{id = Id, pid = Pid} <- Teammates,
        OffId =/= Id],
    ok;
team_combat_notice(FunType = 3, Label = 3, Teammates,
                   Role, {Id, Name}) ->
    callback_team_combat_notice(Role,
                                FunType,
                                Label,
                                {Id, Name}),
    [role:apply(async,
                Pid,
                {quest_team_cond,
                 callback_team_combat_notice,
                 [FunType, Label, {Id, Name}]})
     || #team_mate{pid = Pid} <- Teammates],
    ok;
team_combat_notice(FunType = 3, Label = 2, Teammates,
                   Role, {}) ->
    callback_team_combat_notice(Role, FunType, Label, {}),
    [role:apply(async,
                Pid,
                {quest_team_cond,
                 callback_team_combat_notice,
                 [FunType, Label, {}]})
     || #team_mate{pid = Pid} <- Teammates],
    ok;
team_combat_notice(FunType = 3, Label, Teammates, Role,
                   {Id, Name}) ->
    callback_team_combat_notice(Role,
                                FunType,
                                Label,
                                {Id, Name}),
    [role:apply(async,
                Pid,
                {quest_team_cond,
                 callback_team_combat_notice,
                 [FunType, Label, {Id, Name}]})
     || #team_mate{pid = Pid} <- Teammates],
    ok;
team_combat_notice(_UnitFunType, _Type, _RestMates,
                   _Role, _Args) ->
    ok.

callback_team_combat_notice(_Role, 3, 1, {Name}) ->
    Msg = notice:format(lang:get("队友~ts不在线，无法发起战斗"),
                        [{role_2, Name}]),
    notice:return(Msg),
    ok;
callback_team_combat_notice(_Role = #role{id = RId}, 3,
                            3, {Id, Name}) ->
    case RId =/= Id of
        true ->
            Msg = notice:format(lang:get("~ts当前暂离，无法发起战斗"),
                                [{role_2, Name}]),
            notice:return(Msg);
        false -> ok
    end,
    ok;
callback_team_combat_notice(_Role, 3, 2, {}) ->
    notice:return(lang:get("队伍人数不足2人，无法发起战斗")),
    ok;
callback_team_combat_notice(_Role = #role{id = RId}, 3,
                            {lev, _Op, Val}, {Id, Name}) ->
    case RId =:= Id of
        true ->
            Msg = notice:format(lang:get("您的等级不足~w级，无法加入战斗"),
                                [Val]),
            notice:return(Msg);
        false ->
            Msg = notice:format(lang:get("~ts的等级不足~w级，无法加入战斗"),
                                [{role_2, Name}, Val]),
            notice:return(Msg)
    end,
    ok;
callback_team_combat_notice(_Role, _FunType, _Type,
                            _Args) ->
    ok.

