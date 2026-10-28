-file("src/mod/unit/unit_action.erl", 1).

-module(unit_action).

-export([action/3,
         action/4,
         action_plot_unit/3,
         push_festival/1,
         festival_reset/2,
         treat_slave_attr/2,
         treat_unit_attr/2]).

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

-file("src/mod/unit/unit_action.erl", 19).

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

-file("src/mod/unit/unit_action.erl", 20).

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

-file("src/mod/unit/unit_action.erl", 21).

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

-file("src/mod/unit/unit_action.erl", 22).

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

-file("src/mod/unit/unit_action.erl", 23).

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

-file("src/mod/unit/unit_action.erl", 24).

-file("inc/condition.hrl", 1).

-record(condition,
        {label :: undefined | atom(),
         op = eq ::
             ue | eq | lt | gt | le | ge | range | include,
         val :: undefined | term(),
         msg = "" :: list()}).

-file("src/mod/unit/unit_action.erl", 25).

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

-file("src/mod/unit/unit_action.erl", 26).

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

-file("src/mod/unit/unit_action.erl", 27).

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

-file("src/mod/unit/unit_action.erl", 28).

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

-file("src/mod/unit/unit_action.erl", 29).

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

-file("src/mod/unit/unit_action.erl", 30).

-file("inc/package.hrl", 1).

-record(package,
        {type = 1 :: integer(),
         next_id = 1 :: pos_integer(),
         volume = 0 :: non_neg_integer(),
         free_cell = [] :: list(),
         items = [] :: [tuple()]}).

-file("src/mod/unit/unit_action.erl", 31).

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

-file("src/mod/unit/unit_action.erl", 32).

-file("inc/fairyland.hrl", 1).

-record(m_fairyland,
        {ver = 0,
         keys = [],
         forward_envoys = [],
         floor = 0 :: integer(),
         last_joined = 0 :: integer(),
         triggers = [],
         exp = 0 :: non_neg_integer(),
         boss_prizes = []}).

-record(fairyland_floor,
        {id = 0 :: integer(),
         forward_envoy = 0 :: integer(),
         map_id = 0 :: integer(),
         map_pid :: undefined | pid(),
         map_base_id = 0 :: integer()}).

-record(fairyland_role,
        {id = {0, "", 0} :: tuple(),
         name = "" :: string(),
         joined = 0 :: integer(),
         pid :: undefined | pid(),
         forward_envoys = [],
         box_boss_rewarded = 0 :: non_neg_integer(),
         exp = 0 :: non_neg_integer()}).

-file("src/mod/unit/unit_action.erl", 33).

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

-file("src/mod/unit/unit_action.erl", 34).

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

-file("src/mod/unit/unit_action.erl", 35).

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

-file("src/mod/unit/unit_action.erl", 36).

-file("inc/hero.hrl", 1).

-record(hero_ready_zone,
        {map_id = 0 :: non_neg_integer(),
         map_pid :: pid() | undefined,
         member_size = 0 :: non_neg_integer(),
         group_id = 0 :: pos_integer(),
         exit_npc}).

-record(hero_zone,
        {id = 0 :: non_neg_integer(),
         pid :: pid() | undefined,
         series = 0,
         flag = 0}).

-record(hero_group,
        {id = 0,
         score = 0,
         num = 0,
         offline_num = 0,
         all_num = 0,
         ave_fc = 0,
         sum_fc = 0}).

-record(hero_group_team,
        {group = 0, num = 0, fight = 0, match = 0}).

-record(hero_series,
        {group = 0,
         num = 0,
         ave_fc = 0,
         sum_fc = 0,
         map_id = 0 :: non_neg_integer(),
         map_pid :: pid() | undefined,
         members = []}).

-record(hero_series_ready,
        {tiger = #hero_series{},
         dragon = #hero_series{},
         series = 0,
         ave_fc = 0,
         num = 0}).

-record(hero_series_data,
        {min = 0, max = 0, series = 0, name = ""}).

-record(hero_role,
        {id = {0, "", 0},
         pid,
         status = 0,
         name = "",
         sex = 0,
         classes = 0,
         lev = 0,
         win = 0,
         win_streak = 0,
         times = 0,
         die = 4,
         rank_point = 0,
         score = 0,
         is_combat = 0,
         last_combat_over_time = 0,
         last_role_id,
         zone_id = 0,
         zone_pid,
         team_status = 0,
         team_lev = 40,
         team_len = 1,
         match = 0,
         exp = 0,
         has_enter = 0,
         looks = [],
         has_mail = 0,
         group = 1,
         box = 0,
         series = 0,
         fc = 0,
         m_time = 0}).

-record(hero_reward_data,
        {min = 0,
         max = 0,
         flag = 0,
         item_list = [],
         exp_mode = 0,
         pet_exp_mode = 0}).

-record(hero_win_data,
        {min = 0,
         max = 0,
         flag = 0,
         item_list = [],
         exp = 0,
         pet_exp = 0}).

-file("src/mod/unit/unit_action.erl", 37).

-file("inc/attr.hrl", 1).

-record(attr_base,
        {type = 0 :: non_neg_integer(),
         name = 0 :: pos_integer(),
         flag = 0 :: non_neg_integer(),
         calc_type = 0 :: non_neg_integer(),
         val = 0 :: non_neg_integer()}).

-record(attr,
        {ver = 3,
         fc = 0 :: non_neg_integer(),
         speed = 260 :: pos_integer(),
         hp_max = 0 :: non_neg_integer(),
         mp_max = 0 :: non_neg_integer(),
         atk_speed = 0 :: non_neg_integer(),
         phy_dmg = 0 :: non_neg_integer(),
         magic_dmg = 0 :: non_neg_integer(),
         phy_def = 0 :: non_neg_integer(),
         magic_def = 0 :: non_neg_integer(),
         crit = 0 :: non_neg_integer(),
         tenacity = 0 :: non_neg_integer(),
         accuracy = 0 :: non_neg_integer(),
         evasion = 0 :: non_neg_integer(),
         holy_dmg = 0 :: non_neg_integer(),
         crit_dmg = 0 :: non_neg_integer(),
         crit_dmg_def = 0 :: non_neg_integer(),
         dmg_ratio = 0 :: non_neg_integer(),
         def_ratio = 0 :: non_neg_integer(),
         enhance_control = 0 :: non_neg_integer(),
         anti_control = 0 :: non_neg_integer(),
         escape = 0 :: non_neg_integer(),
         anti_escape = 0 :: non_neg_integer(),
         capture = 0 :: non_neg_integer(),
         phy_def_ratio = 0 :: non_neg_integer(),
         magic_def_ratio = 0 :: non_neg_integer(),
         phy_accuracy = 0 :: non_neg_integer(),
         magic_accuracy = 0 :: non_neg_integer(),
         phy_evasion = 0 :: non_neg_integer(),
         magic_evasion = 0 :: non_neg_integer(),
         phy_crit = 0 :: non_neg_integer(),
         magic_crit = 0 :: non_neg_integer(),
         phy_tenacity = 0 :: non_neg_integer(),
         magic_tenacity = 0 :: non_neg_integer(),
         heal_val = 0 :: non_neg_integer(),
         heal_ratio = 0 :: non_neg_integer(),
         eff_heal_ratio = 0 :: non_neg_integer(),
         phy_dmg_ratio = 0 :: non_neg_integer(),
         magic_dmg_ratio = 0 :: non_neg_integer(),
         strength = 0,
         constitution = 0,
         magic = 0,
         agility = 0,
         endurance = 0,
         exp_ratio = 0}).

-record(attr_calc,
        {attr :: undefined | #attr{},
         attr_no_ratio :: undefined | #attr{},
         ratio :: undefined | #attr{},
         attr_no_fc :: undefined | #attr{},
         ratio_no_fc :: undefined | #attr{}}).

-record(m_attr_point,
        {ver = 2,
         ext_point = [],
         first_free = 0,
         valid_plan = 1,
         plan_data = [],
         change_plan_times = 0}).

-record(attr_point_plan,
        {index = 1 :: pos_integer(),
         plan_name = [],
         strength = 0 :: pos_integer(),
         constitution = 0 :: non_neg_integer(),
         magic = 0 :: non_neg_integer(),
         agility = 0 :: non_neg_integer(),
         endurance = 0 :: non_neg_integer(),
         pre_str = 0,
         pre_con = 0,
         pre_magic = 0,
         pre_agi = 0,
         pre_end = 0}).

-file("src/mod/unit/unit_action.erl", 38).

-file("inc/elf.hrl", 1).

-record(elf_role,
        {id = {0, "", 0},
         pid,
         status = 0,
         name = "",
         sex = 0,
         classes = 0,
         lev = 0,
         win = 0,
         win_streak = 0,
         times = 0,
         die = 0,
         score = 0,
         is_combat = 0,
         last_combat_over_time = 0,
         combat_protect_time = 0,
         last_role_id,
         zone_id = 0,
         zone_pid,
         has_enter = 0,
         has_mail = 0,
         group = 0,
         seq_id = 0,
         fc = 0,
         m_time = 0,
         pos,
         rank = 0,
         grade_flag = 0,
         grade_first_flag = 0,
         unit_list = [],
         match = 0,
         exp = 0,
         group_key = 0,
         open_id = 0}).

-record(elf_role_map,
        {id = 0, map_id = 0, map_base_id = 0, num = 0}).

-record(elf_ready_zone,
        {map_id = 0 :: non_neg_integer(),
         map_pid :: pid() | undefined,
         group_key = {0, 0},
         open_id = 0,
         group_id = 0 :: pos_integer(),
         members = [],
         num = 0}).

-record(elf_group_data,
        {min = 0, max = 0, group = 0, order = 0, name = ""}).

-record(elf_zone,
        {id = 0 :: non_neg_integer(),
         pid :: pid() | undefined,
         group = 0,
         group_key = {0, 0},
         open_id = 0,
         flag = 0}).

-record(elf_map,
        {id = 0 :: non_neg_integer(),
         map_pid :: pid() | undefined,
         map_id = 0,
         map_base_id = 0,
         num = 0,
         max_num = 0}).

-record(elf_map_data,
        {id = 0 :: non_neg_integer(),
         map_base_id = 0,
         num = 0,
         unit_list = [],
         boss_list = [],
         super_list = [],
         box_list = [],
         next_score = 0,
         win_score = 0,
         fail_score = 0,
         end_score = 0,
         next_base_id = 0,
         buff_id = 0,
         grade_buff_id = 0,
         grade_msg = "",
         grade_cast_msg = "",
         grade_score = 0,
         grade_dec_score = 0,
         grade_dec_msg = "",
         fail_buff_id = 0,
         fail_msg = "",
         pos_list = [],
         msg = "",
         del_buff = [],
         max_score = 0,
         max_guard = 4}).

-record(elf_unit,
        {id = {0, 0} :: non_neg_integer(), base_id = 0, pos}).

-record(elf_unit_data,
        {id = 0,
         is_del = 1,
         pos = [],
         score = 0,
         kill_num = 0,
         create_msg = "",
         item_list = [],
         buff_id = 0,
         msg = "",
         cast_msg = ""}).

-record(elf_reward_data,
        {group = 0,
         min = 0,
         max = 0,
         item_list = [],
         exp_mode = 0}).

-record(elf_first_data,
        {group = 0,
         map_base_id,
         min = 0,
         max = 0,
         item_list = [],
         cast = "",
         title = "",
         comment = ""}).

-record(elf_win_data,
        {group = 0,
         min = 0,
         max = 0,
         flag = 0,
         item_list = [],
         exp = 0,
         pet_exp = 0}).

-file("src/mod/unit/unit_action.erl", 39).

-file("inc/privilege.hrl", 1).

-record(m_privilege,
        {ver = 2,
         lev = 0,
         list = [],
         new_list = [],
         new_prilist = []}).

-record(privilege_data,
        {lev = 0,
         min = 0,
         max = 0,
         title = "",
         content = "",
         item = []}).

-record(privilege_type_data,
        {lev = 0, type = 0, val = 0, args = [], old_item = []}).

-record(privilege_role,
        {id = {0, "", 0},
         ver = 2,
         lev = 0,
         privilege_lev = 0,
         buy_list = [],
         pri_list = []}).

-record(privilege_item,
        {id = 0,
         item_id = 0,
         is_self = 0,
         bind = 0,
         num = 0,
         weigth = 0,
         is_cast = 0}).

-record(privilege_gift,
        {id = 0,
         need_val = 0,
         reward = [],
         privileges = [],
         title = "",
         content = "",
         client_show = [],
         mail_title = "",
         mail_content = ""}).

-file("src/mod/unit/unit_action.erl", 40).

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

-file("src/mod/unit/unit_action.erl", 41).

action(BattleId, Id, Action, Role) ->
    action({BattleId, Id}, Action, Role).

action(UnitId, Action,
       Role = #role{pos =
                        #pos{map = MapId, x = X, y = Y, platform = P,
                             zone_id = Z, map_base_id = _MapBaseId},
                    pid = Pid}) ->
    case unit_mgr:info(P, Z, UnitId) of
        {ok, #unit{pid = Pid, type = Type}}
            when is_pid(Pid) andalso
                     Type =/= 2 andalso Type =/= 3 ->
            {false, lang:get("您不能操作该单位")};
        {ok, #unit{disabled = DisabledMsg}}
            when DisabledMsg =/= "" ->
            {false, DisabledMsg};
        {ok, #unit{pos = #pos{map = Map}}} when Map =/= MapId ->
            {false, lang:get("您所在地图无法操作当前该单位")};
        {ok,
         #unit{base_id = _BaseId, pos = #pos{x = Tx, y = Ty}}}
            when abs(X - Tx) > 600 orelse abs(Y - Ty) > 600 ->
            logger:debug("操作[~w, ~w]单位距离过远X:~w, Y:~w, Tx:~w, Ty:~w",
                         [UnitId, _BaseId, X, Y, Tx, Ty],
                         unit_action,
                         64),
            {false, lang:get("您距离该单位太远，无法操作")};
        {ok, Unit = #unit{condition = Cond}} ->
            logger:debug("单位操作:~w", [Unit], unit_action, 67),
            case role_cond:check(Cond, Role) of
                {false, #condition{msg = Msg}} -> {false, Msg};
                true -> do(Unit, Action, Role)
            end;
        _ ->
            logger:debug("不存在的单位, 单位ID:~w, 地图ID:~w",
                         [UnitId, _MapBaseId],
                         unit_action,
                         76),
            role:pack_send(Pid, 10162, UnitId),
            {false, ""}
    end.

-spec action_plot_unit(UnitId :: tuple(),
                       PlotUnit :: #plot_unit{}, #role{}) -> {ok} |
                                                             {ok, bitstring()} |
                                                             {ok, #role{}} |
                                                             {ok,
                                                              bitstring(),
                                                              #role{}} |
                                                             {false,
                                                              bitstring()}.

action_plot_unit(Action,
                 #plot_unit{base_id = BaseId, map = Map, x = Tx, y = Ty},
                 Role = #role{pos =
                                  #pos{map = MapId, x = X, y = Y,
                                       map_base_id = _MapBaseId},
                              pid = Pid}) ->
    case unit_convert:to(unit, BaseId) of
        {ok, #unit{pid = Pid, type = Type}}
            when is_pid(Pid) andalso
                     Type =/= 2 andalso Type =/= 3 ->
            {false, lang:get("您不能操作该单位")};
        {ok, #unit{disabled = DisabledMsg}}
            when DisabledMsg =/= "" ->
            {false, DisabledMsg};
        {ok, #unit{}} when Map =/= MapId ->
            {false, lang:get("您所在地图无法操作当前该单位")};
        {ok, #unit{}}
            when abs(X - Tx) > 1200 orelse abs(Y - Ty) > 1200 ->
            {false, lang:get("您距离该单位太远，无法操作")};
        {ok, Unit = #unit{condition = Cond}} ->
            case role_cond:check(Cond, Role) of
                {false, #condition{msg = Msg}} -> {false, Msg};
                true -> do(Unit, Action, Role)
            end;
        _ ->
            UnitId = {0, BaseId},
            logger:debug("不存在的剧情单位, 单位ID:~w, 地图ID:~w",
                         [UnitId, _MapBaseId],
                         unit_action,
                         108),
            role:pack_send(Pid, 10162, UnitId),
            {false, ""}
    end.

-spec do(#unit{}, Action :: pos_integer(),
         #role{}) -> {ok} |
                     {ok, #role{}} |
                     {ok, bitstring(), #role{}} |
                     {false, bitstring()}.

do(Unit = #unit{base_id = 79630}, _Action, Role) ->
    fairyland:combat_check(Role, Unit);
do(Unit = #unit{base_id = 79619}, _Action, Role) ->
    fairyland:combat_check(Role, Unit);
do(Unit = #unit{fun_type = 16}, _Action, Role) ->
    fairyland:combat_check(Role, Unit);
do(Unit = #unit{fun_type = 23, base_id = BaseId},
   _Action, Role) ->
    case combat_mgr:check_self(26, Role, Unit) of
        true ->
            case constellation:combat_check(Role, Unit) of
                {false, Why} ->
                    notice:npc_talk(Role, BaseId, Why),
                    {ok};
                Else -> Else
            end;
        {false, Reason} -> {false, Reason}
    end;
do(Unit = #unit{fun_type = 27}, _Action, Role) ->
    guild_treasure:combat_check(Role, Unit);
do(Unit = #unit{fun_type = 36}, _Action, Role) ->
    brave_trial:combat_check(Role, Unit);
do(Unit = #unit{id = UId = {_BattleId, Id},
                fun_type = 52, base_id = BaseId},
   _Action,
   Role = #role{pos = #pos{platform = P, zone_id = Z}}) ->
    role:send_buff_begin(),
    case pick_check(Unit, Role) of
        {false, Reason} ->
            role:send_buff_clean(),
            {false, Reason};
        {true, Cfg} ->
            case cross:call(P, Z, unit_mgr, sync_remove, [Unit]) of
                ok ->
                    case camp_cake:gain_box(Role, UId, BaseId, Cfg) of
                        {ok, NewRole1} ->
                            role:send_buff_flush(),
                            Evt = #evt_unit_click{id = Id, type = 105,
                                                  base_id = BaseId},
                            NewRole2 = role_trigger:fire(Evt, NewRole1),
                            {ok, NewRole2};
                        {false, Reason} ->
                            role:send_buff_clean(),
                            notice:send(Role, 1, Reason),
                            ok
                    end;
                _ ->
                    role:send_buff_clean(),
                    notice:send(Role, 1, lang:get("请勿频繁操作")),
                    ok
            end
    end;
do(Unit = #unit{fun_type = FunType = 3}, _Action,
   Role) ->
    case check_kill_fun_type_unit(FunType, Unit, Role) of
        {false, Reason} -> {false, Reason};
        {ok, Fighters} ->
            case combat_mgr:kill_npc(Role, Fighters, Unit) of
                {ok} ->
                    team:combat(Role),
                    {ok};
                Err -> Err
            end;
        {ok, Fighters, ExtArgs} ->
            CombatArgs = #combat_start_args{ext_args = ExtArgs},
            case combat_mgr:kill_npc(Role,
                                     Fighters,
                                     Unit,
                                     CombatArgs)
                of
                {ok} ->
                    team:combat(Role),
                    {ok};
                Err -> Err
            end
    end;
do(Unit = #unit{fun_type = FunType = 2}, _Action,
   Role) ->
    case check_kill_fun_type_unit(FunType, Unit, Role) of
        {false, Reason} -> {false, Reason};
        {ok, Fighters} ->
            combat_mgr:kill_npc(Role, Fighters, Unit);
        {ok, Fighters, ExtArgs} ->
            CombatArgs = #combat_start_args{ext_args = ExtArgs},
            combat_mgr:kill_npc(Role, Fighters, Unit, CombatArgs)
    end;
do(Unit = #unit{fun_type = FunType}, SecType = 6,
   Role = #role{name = Name, id = Rid,
                m_quest = #m_quest{quest = Quest}, m_guild = MGuild,
                lev = Lev}) ->
    GuildTag = case MGuild of
                   #m_guild{pid = Pid, id = GuildId} when is_pid(Pid) ->
                       GuildId;
                   _ -> undefined
               end,
    QuestId = case lists:keyfind(SecType,
                                 #quest.sec_type,
                                 Quest)
                  of
                  #quest{id = TmpQuestId} -> TmpQuestId;
                  _ -> 0
              end,
    Args = [{name, Name},
            {rid, Rid},
            {quest_id, QuestId},
            {guild, GuildTag},
            {leader_lev, Lev}],
    case check_kill_fun_type_unit(FunType, Unit, Role) of
        {false, Reason} -> {false, Reason};
        {ok, Fighters} ->
            CombatArgs = #combat_start_args{ext_args = Args},
            combat_mgr:kill_npc(Role,
                                Fighters,
                                Unit,
                                15,
                                CombatArgs);
        {ok, Fighters, ExtArgs} ->
            CombatArgs = #combat_start_args{ext_args =
                                                ExtArgs ++ Args},
            combat_mgr:kill_npc(Role,
                                Fighters,
                                Unit,
                                15,
                                CombatArgs)
    end;
do(Unit = #unit{fun_type = FunType}, 5,
   Role = #role{lev = Lev}) ->
    Args = [{leader_lev, Lev}],
    case check_kill_fun_type_unit(FunType, Unit, Role) of
        {false, Reason} -> {false, Reason};
        {ok, Fighters} ->
            CombatArgs = #combat_start_args{ext_args = Args},
            combat_mgr:kill_npc(Role,
                                Fighters,
                                Unit,
                                25,
                                CombatArgs);
        {ok, Fighters, ExtArgs} ->
            CombatArgs = #combat_start_args{ext_args =
                                                Args ++ ExtArgs},
            combat_mgr:kill_npc(Role,
                                Fighters,
                                Unit,
                                25,
                                CombatArgs)
    end;
do(Unit = #unit{fun_type = FunType = 8}, _Action,
   Role) ->
    case check_kill_fun_type_unit(FunType, Unit, Role) of
        {false, Reason} -> {false, Reason};
        {ok, Fighters} ->
            combat_mgr:kill_npc(Role, Fighters, Unit)
    end;
do(Unit = #unit{fun_type = FunType = 13, id = Id},
   _Action, Role) ->
    case check_kill_fun_type_unit(FunType, Unit, Role) of
        {false, Reason} -> {false, Reason};
        {ok, Fighters} ->
            Lev = treasure:get_ghost_lev(Id),
            CombatArgs = #combat_start_args{ext_args =
                                                [{treasure_ratio, Lev}]},
            combat_mgr:kill_npc(Role, Fighters, Unit, CombatArgs);
        _False -> {false, lang:get("无法进入封妖战斗")}
    end;
do(Unit = #unit{fun_type = FunType = 42}, _Action,
   Role) ->
    case check_kill_fun_type_unit(FunType, Unit, Role) of
        {false, Reason} -> {false, Reason};
        {ok, Fighters} ->
            combat_mgr:kill_npc(Role, Fighters, Unit)
    end;
do(Unit = #unit{fun_type = FunType = 21}, _Action,
   Role) ->
    case check_kill_fun_type_unit(FunType, Unit, Role) of
        {false, Reason} -> {false, Reason};
        {ok, Fighters} ->
            combat_mgr:kill_npc(Role, Fighters, Unit)
    end;
do(Unit = #unit{fun_type = FunType = 22}, _Action,
   Role) ->
    case check_kill_fun_type_unit(FunType, Unit, Role) of
        {false, Reason} -> {false, Reason};
        {ok, Fighters} ->
            combat_mgr:kill_npc(Role, Fighters, Unit)
    end;
do(Unit = #unit{fun_type = FunType = 38}, _Action,
   Role) ->
    case check_kill_fun_type_unit(FunType, Unit, Role) of
        {false, Reason} -> {false, Reason};
        {ok, Fighters} ->
            team:stop_recruiting(Role),
            combat_mgr:kill_npc(Role, Fighters, Unit)
    end;
do(Unit = #unit{fun_type = FunType = 39}, _Action,
   Role) ->
    case check_kill_fun_type_unit(FunType, Unit, Role) of
        {false, Reason} -> {false, Reason};
        {ok, Fighters} ->
            team:stop_recruiting(Role),
            combat_mgr:kill_npc(Role, Fighters, Unit)
    end;
do(Unit = #unit{fun_type = FunType = 37}, _Action,
   Role) ->
    case check_kill_fun_type_unit(FunType, Unit, Role) of
        {false, Reason} -> {false, Reason};
        {ok, Fighters} ->
            combat_mgr:kill_npc(Role, Fighters, Unit)
    end;
do(Unit = #unit{fun_type = FunType = 32}, _Action,
   Role) ->
    case check_kill_fun_type_unit(FunType, Unit, Role) of
        {false, Reason} -> {false, Reason};
        {ok, Fighters} ->
            combat_mgr:kill_npc(Role, Fighters, Unit)
    end;
do(Unit = #unit{fun_type = FunType = 33}, _Action,
   Role) ->
    case check_kill_fun_type_unit(FunType, Unit, Role) of
        {false, Reason} -> {false, Reason};
        {ok, Fighters} ->
            combat_mgr:kill_npc(Role, Fighters, Unit)
    end;
do(Unit = #unit{fun_type = FunType = 55}, _Action,
   Role) ->
    case check_kill_fun_type_unit(FunType, Unit, Role) of
        {false, Reason} -> {false, Reason};
        {ok, Fighters} ->
            combat_mgr:kill_npc(Role, Fighters, Unit)
    end;
do(Unit = #unit{fun_type = FunType = 59}, _Action,
   Role) ->
    case check_kill_fun_type_unit(FunType, Unit, Role) of
        {false, Reason} -> {false, Reason};
        {ok, Fighters} ->
            combat_mgr:kill_npc(Role, Fighters, Unit)
    end;
do(Unit = #unit{fun_type = FunType = 56}, _Action,
   Role) ->
    case check_kill_fun_type_unit(FunType, Unit, Role) of
        {false, Reason} -> {false, Reason};
        {ok, Fighters} ->
            combat_mgr:kill_npc(Role, Fighters, Unit)
    end;
do(Unit = #unit{fun_type = FunType = 57}, _Action,
   Role) ->
    case check_kill_fun_type_unit(FunType, Unit, Role) of
        {false, Reason} -> {false, Reason};
        {ok, Fighters} ->
            combat_mgr:kill_npc(Role, Fighters, Unit)
    end;
do(Unit = #unit{fun_type = 11}, _Action, Role) ->
    tower:combat_start(Role, Unit);
do(Unit = #unit{fun_type = FunType = 65,
                base_id = BaseId},
   _Action, Role) ->
    case check_kill_fun_type_unit(FunType, Unit, Role) of
        {false, Reason} ->
            notice:npc_talk(Role, BaseId, Reason),
            ok;
        {ok, _Fighters} ->
            spirit_treasure_role:kill_npc(Role, BaseId)
    end;
do(Unit = #unit{fun_type = FunType = 66,
                base_id = BaseId},
   _Action, Role) ->
    case check_kill_fun_type_unit(FunType, Unit, Role) of
        {false, Reason} ->
            notice:npc_talk(Role, BaseId, Reason),
            ok;
        {ok, _Fighters} ->
            spirit_treasure_role:kill_npc(Role, BaseId)
    end;
do(Unit = #unit{fun_type = FunType = 70,
                base_id = BaseId},
   _Action, Role) ->
    case check_kill_fun_type_unit(FunType, Unit, Role) of
        {false, Reason} ->
            notice:npc_talk(Role, BaseId, Reason),
            ok;
        {ok, _Fighters} ->
            oracle_treasure_role:kill_npc(Role, BaseId)
    end;
do(Unit = #unit{fun_type = FunType = 71,
                base_id = BaseId},
   _Action, Role) ->
    case check_kill_fun_type_unit(FunType, Unit, Role) of
        {false, Reason} ->
            notice:npc_talk(Role, BaseId, Reason),
            ok;
        {ok, _Fighters} ->
            oracle_treasure_role:kill_npc(Role, BaseId)
    end;
do(Unit = #unit{fun_type = 69, base_id = BaseId},
   _Action, Role) ->
    case stars_trial_mgr:combat_check(Role, Unit) of
        {false, Reason} ->
            notice:npc_talk(Role, BaseId, Reason),
            ok;
        _ -> ok
    end;
do(Unit = #unit{fun_type = 76, base_id = BaseId},
   _Action, Role) ->
    case star_moon_mgr:combat_check(Role, Unit) of
        {false, Reason} ->
            notice:npc_talk(Role, BaseId, Reason),
            ok;
        _ -> ok
    end;
do(Unit = #unit{fun_type = 50}, _Action, Role) ->
    lev_break:fight(Role, Unit);
do(#unit{fun_type = 20, id = UnitId}, _Action, Role) ->
    case guild_plant:irrigate(Role, UnitId) of
        ok -> {ok, lang:get("浇水成功"), Role};
        Else -> Else
    end;
do(#unit{type = 101, base_id = BaseId, data = DataList},
   _, Role = #role{pos = #pos{platform = P, zone_id = Z}})
    when is_list(DataList) ->
    case lists:keyfind(tele, 1, DataList) of
        false ->
            logger:error("未找到传送阵[~w]对应的目标坐标",
                         [BaseId],
                         unit_action,
                         401),
            {ok};
        {tele, {MapId, X, Y}} ->
            case team:get_status(Role) of
                {true, 2} -> {false, lang:get("你在跟随队长中")};
                _ ->
                    case map:role_enter({P, Z, MapId, X, Y}, Role) of
                        {ok, NewRole} -> {ok, NewRole};
                        {error, Reason} -> {false, Reason}
                    end
            end
    end;
do(Unit = #unit{id = Id, fun_type = 48,
                base_id = BaseId},
   _Action,
   Role = #role{pos = #pos{platform = P, zone_id = Z}}) ->
    case pick_check(Unit, Role) of
        {false, Reason} -> {false, Reason};
        {true, PickArgs} ->
            case cross:call(P, Z, unit_mgr, sync_remove, [Unit]) of
                ok ->
                    case pick_action(Unit, Role, PickArgs) of
                        {ok, Role1} ->
                            NRole = role_trigger:fire(#evt_unit_click{id = Id,
                                                                      type =
                                                                          105,
                                                                      base_id =
                                                                          BaseId},
                                                      Role1),
                            {ok, NRole};
                        {false, Reason} -> {false, Reason}
                    end;
                _ERR ->
                    logger:error("~w", [_ERR], unit_action, 432),
                    notice:send(Role, 1, lang:get("请勿频繁操作")),
                    ok
            end
    end;
do(Unit = #unit{id = Id, fun_type = 61,
                base_id = BaseId},
   _Action, Role) ->
    case pick_check(Unit, Role) of
        {false, Reason} -> {false, Reason};
        {true, PickArgs} ->
            case unit_mgr:sync_remove(Unit) of
                ok ->
                    case pick_action(Unit, Role, PickArgs) of
                        {ok, Role1} ->
                            NRole = role_trigger:fire(#evt_unit_click{id = Id,
                                                                      type =
                                                                          105,
                                                                      base_id =
                                                                          BaseId},
                                                      Role1),
                            {ok, NRole};
                        {false, Reason} -> {false, Reason}
                    end;
                _ERR ->
                    logger:error("~w", [_ERR], unit_action, 455),
                    notice:send(Role, 1, lang:get("请勿频繁操作")),
                    ok
            end
    end;
do(Unit = #unit{id = Id, fun_type = 68,
                base_id = BaseId},
   _Action, Role) ->
    case pick_check(Unit, Role) of
        {false, Reason} -> {false, Reason};
        {true, PickArgs} ->
            case unit_mgr:sync_remove(Unit) of
                ok ->
                    case pick_action(Unit, Role, PickArgs) of
                        {ok, Role1} ->
                            NRole = role_trigger:fire(#evt_unit_click{id = Id,
                                                                      type =
                                                                          105,
                                                                      base_id =
                                                                          BaseId},
                                                      Role1),
                            {ok, NRole};
                        {false, Reason} -> {false, Reason}
                    end;
                _ERR ->
                    logger:error("~w", [_ERR], unit_action, 478),
                    notice:send(Role, 1, lang:get("请勿频繁操作")),
                    ok
            end
    end;
do(Unit = #unit{id = Id, fun_type = 73,
                base_id = BaseId},
   _Action, Role) ->
    case pick_check(Unit, Role) of
        {false, Reason} -> {false, Reason};
        {true, PickArgs} ->
            case unit_mgr:sync_remove(Unit) of
                ok ->
                    case pick_action(Unit, Role, PickArgs) of
                        {ok, Role1} ->
                            NRole = role_trigger:fire(#evt_unit_click{id = Id,
                                                                      type =
                                                                          105,
                                                                      base_id =
                                                                          BaseId},
                                                      Role1),
                            {ok, NRole};
                        {false, Reason} -> {false, Reason}
                    end;
                _ERR ->
                    logger:error("~w", [_ERR], unit_action, 501),
                    notice:send(Role, 1, lang:get("请勿频繁操作")),
                    ok
            end
    end;
do(Unit = #unit{id = Id, fun_type = 75,
                base_id = BaseId},
   _Action,
   Role = #role{pos = #pos{platform = P, zone_id = Z}}) ->
    logger:debug("+==========", [], unit_action, 510),
    case pick_check(Unit, Role) of
        {false, Reason} -> {false, Reason};
        {true, PickArgs} ->
            case cross:call(P, Z, unit_mgr, sync_remove, [Unit]) of
                ok ->
                    case pick_action(Unit, Role, PickArgs) of
                        {ok, Role1} ->
                            NRole = role_trigger:fire(#evt_unit_click{id = Id,
                                                                      type =
                                                                          105,
                                                                      base_id =
                                                                          BaseId},
                                                      Role1),
                            {ok, NRole};
                        {false, Reason} -> {false, Reason}
                    end;
                _ERR ->
                    logger:error("~w", [_ERR], unit_action, 525),
                    notice:send(Role, 1, lang:get("请勿频繁操作")),
                    ok
            end
    end;
do(Unit = #unit{type = 3, fun_type = 10,
                base_id = BaseId},
   _Action, Role) ->
    case check_kill_boss(Role) of
        {false, Reason} -> {false, Reason};
        {ok, RoleIds} ->
            Count = dungeon_mgr:unit_count(BaseId),
            CombatArgs = dungeon_util:make_combat_args(RoleIds,
                                                       BaseId),
            case dungeon_data:get_count_attr({BaseId, Count}) of
                [] ->
                    combat_mgr:kill_npc(Role, RoleIds, Unit, CombatArgs);
                Attr0 ->
                    Fighters = case unit_convert:to(fighter, Unit) of
                                   {ok, Fighter = #fighter{slave = Slave}} ->
                                       NewSlave = [{I,
                                                    N,
                                                    O,
                                                    {unit_action,
                                                     treat_slave_attr,
                                                     [Attr0]}}
                                                   || {I, N, O, _} <- Slave],
                                       [Fighter#fighter{attr =
                                                            {unit_action,
                                                             treat_unit_attr,
                                                             [Attr0]},
                                                        slave = NewSlave}];
                                   _R ->
                                       logger:error("单位转换失败 [~w] ~w",
                                                    [BaseId, _R],
                                                    unit_action,
                                                    547),
                                       []
                               end,
                    CombatType = combat_util:unit_to_combat_type(Unit),
                    combat_mgr:start_combat(CombatType,
                                            RoleIds,
                                            Fighters,
                                            CombatArgs),
                    ok
            end
    end;
do(Unit = #unit{fun_type = 10, base_id = BaseId},
   _Action, Role) ->
    case check_kill_monster(Role) of
        {false, Reason} -> {false, Reason};
        {ok, RoleIds} ->
            CombatArgs = dungeon_util:make_combat_args(RoleIds,
                                                       BaseId),
            combat_mgr:kill_npc(Role, RoleIds, Unit, CombatArgs)
    end;
do(Unit = #unit{fun_type = FunType = 64}, _Action,
   Role) ->
    case check_kill_fun_type_unit(FunType, Unit, Role) of
        {false, Reason} -> {false, Reason};
        {ok, Fighters} ->
            combat_mgr:kill_npc(Role, Fighters, Unit)
    end;
do(Unit = #unit{fun_type = 36}, _Action, Role) ->
    brave_trial:combat_check(Role, Unit);
do(Unit = #unit{fun_type = FunType = 74,
                base_id = BaseId},
   _Action, Role) ->
    case check_kill_fun_type_unit(FunType, Unit, Role) of
        {false, Reason} ->
            notice:npc_talk(Role, BaseId, Reason),
            ok;
        {ok, _Fighters} ->
            logger:debug("~w", [_Fighters], unit_action, 581),
            big_world:call(gods_challenge_mgr,
                           start_combat,
                           [Role, push]),
            ok
    end;
do(Unit = #unit{type = 2}, _Action, Role) ->
    case check_kill_monster(Role) of
        {false, Reason} -> {false, Reason};
        {ok, RoleIds} ->
            combat_mgr:kill_npc(Role, RoleIds, Unit)
    end;
do(Unit = #unit{type = 3}, _Action, Role) ->
    case check_kill_boss(Role) of
        {false, Reason} -> {false, Reason};
        {ok, RoleIds} ->
            combat_mgr:kill_npc(Role, RoleIds, Unit)
    end;
do(Unit = #unit{type = 6}, _Action, Role) ->
    world_boss:combat_check(Role, Unit);
do(Unit = #unit{type = 9}, _Action, Role) ->
    guild_robber:combat_check(Role, Unit);
do(#unit{id = Id, type = 102, base_id = BaseId},
   _Action, Role) ->
    NRole = role_trigger:fire(#evt_unit_click{id = Id,
                                              type = 102, base_id = BaseId},
                              Role),
    {ok, NRole};
do(_Unit = #unit{id = {_, Id}, type = Type = 5,
                 base_id = BaseId},
   _Action, Role) ->
    NRole = role_trigger:fire(#evt_unit_click{id = Id,
                                              type = Type, base_id = BaseId},
                              Role),
    {ok, NRole};
do(#unit{id = {_BattleId, Id}, type = 4,
         base_id = BaseId},
   _Action, Role) ->
    NRole = role_trigger:fire(#evt_unit_click{id = Id,
                                              type = 4, base_id = BaseId},
                              Role),
    {ok, NRole};
do(U = #unit{base_id = BaseId}, _Action, Role)
    when BaseId >= 79650 andalso BaseId =< 79653 ->
    fairyland:teleport(Role, U);
do(Unit = #unit{id = {_BattleId, Id},
                base_id = BaseId = 79560},
   _Action,
   Role = #role{s_event_pid = ZonePid,
                pos = #pos{platform = P, zone_id = Z}}) ->
    role:send_buff_begin(),
    case hero_role:check_box(Role, BaseId) of
        {ok, Gain} ->
            case cross:call(P, Z, unit_mgr, sync_remove, [Unit]) of
                ok ->
                    case hero_role:gain_box(Role, BaseId, Gain) of
                        {ok, NewRole1} ->
                            role:send_buff_flush(),
                            Evt = #evt_unit_click{id = Id, type = 105,
                                                  base_id = BaseId},
                            NewRole2 = role_trigger:fire(Evt, NewRole1),
                            role:apply(async,
                                       self(),
                                       {hero_role,
                                        apply_leave_zone,
                                        [ZonePid]}),
                            {ok, NewRole2};
                        {false, Reason} ->
                            role:send_buff_clean(),
                            notice:send(Role, 1, Reason),
                            ok
                    end;
                _ ->
                    role:send_buff_clean(),
                    notice:send(Role, 1, lang:get("请勿频繁操作")),
                    ok
            end;
        {false, Reason} ->
            role:send_buff_clean(),
            notice:send(Role, 1, Reason),
            ok
    end;
do(Unit = #unit{id = {_BattleId, Id}, fun_type = 25,
                base_id = BaseId},
   _Action,
   Role = #role{pos = #pos{platform = P, zone_id = Z}}) ->
    role:send_buff_begin(),
    case top_compete_util:check_box(Role, BaseId) of
        {ok, NewRole, Gain} ->
            case cross:call(P, Z, unit_mgr, sync_remove, [Unit]) of
                ok ->
                    case top_compete_util:gain_box(NewRole, BaseId, Gain) of
                        {ok, NewRole1} ->
                            role:send_buff_flush(),
                            Evt = #evt_unit_click{id = Id, type = 105,
                                                  base_id = BaseId},
                            NewRole2 = role_trigger:fire(Evt, NewRole1),
                            {ok, NewRole2};
                        {false, Reason} ->
                            role:send_buff_clean(),
                            notice:send(Role, 1, Reason),
                            ok
                    end;
                _ ->
                    role:send_buff_clean(),
                    notice:send(Role, 1, lang:get("请勿频繁操作")),
                    ok
            end;
        {false, Reason} ->
            role:send_buff_clean(),
            notice:send(Role, 1, Reason),
            ok
    end;
do(Unit = #unit{id = {_BattleId, Id}, fun_type = 35,
                base_id = BaseId},
   _Action,
   Role = #role{id = RoleId, name = Name,
                s_event_pid = BPid, pid = RolePid,
                pos = #pos{platform = P, zone_id = Z}}) ->
    role:send_buff_begin(),
    case role_misc:check_cd({rpc_ship_box, BaseId}) of
        true ->
            case cross:call(P, Z, unit_mgr, sync_remove, [Unit]) of
                ok ->
                    role:send_buff_flush(),
                    Evt = #evt_unit_click{id = Id, type = 105,
                                          base_id = BaseId, role_id = RoleId,
                                          name = Name, pid = RolePid},
                    NewRole2 = role_trigger:fire(Evt, Role),
                    battle_mgr:evt(BPid, Evt),
                    {ok, NewRole2};
                _ ->
                    role:send_buff_clean(),
                    notice:send(Role, 1, lang:get("请勿频繁操作")),
                    ok
            end;
        _ ->
            role:send_buff_clean(),
            notice:send(Role, 1, lang:get("操作太快，休息一会再继续")),
            ok
    end;
do(_Unit = #unit{base_id = BaseId}, _Action,
   _Role = #role{lev = Lev})
    when Lev < 20 ->
    sys_conn:pack_send(9910,
                       {BaseId,
                        notice:format(lang:get("当前等级不够，~ts级以后再来找我领取吧{face_1,3}"),
                                      [{string_2, 5, 20}])}),
    {ok};
do(Unit = #unit{id = {_BattleId, Id}, type = 1,
                fun_type = 30, base_id = BaseId},
   _Action, Role = #role{pos = #pos{}}) ->
    case pick_check(Unit, Role) of
        {false, Reason} -> {false, Reason};
        {true, PickArgs} ->
            role:send_buff_begin(),
            case pick_action(Unit, Role, PickArgs) of
                {ok, Role1} ->
                    NRole = role_trigger:fire(#evt_unit_click{id = Id,
                                                              type = 105,
                                                              base_id = BaseId},
                                              Role1),
                    role:send_buff_flush(),
                    {ok, NRole};
                _ ->
                    role:send_buff_clean(),
                    {false, lang:get("背包已满")}
            end
    end;
do(Unit = #unit{id = {_BattleId, Id}, fun_type = 41,
                base_id = BaseId},
   _Action,
   Role = #role{pos = #pos{platform = P, zone_id = Z}}) ->
    case pick_check(Unit, Role) of
        {false, Reason} -> {false, Reason};
        {true,
         PickArgs = #{cfg := #elf_unit_data{is_del = 0}}} ->
            case pick_action(Unit, Role, PickArgs) of
                {ok, Role1} ->
                    NRole = role_trigger:fire(#evt_unit_click{id = Id,
                                                              type = 105,
                                                              base_id = BaseId},
                                              Role1),
                    {ok, NRole};
                _ ->
                    NRole = role_trigger:fire(#evt_unit_click{id = Id,
                                                              type = 105,
                                                              base_id = BaseId},
                                              Role),
                    {ok, NRole}
            end;
        {true, PickArgs} ->
            case cross:call(P, Z, unit_mgr, sync_remove, [Unit]) of
                ok ->
                    case pick_action(Unit, Role, PickArgs) of
                        {ok, Role1} ->
                            NRole = role_trigger:fire(#evt_unit_click{id = Id,
                                                                      type =
                                                                          105,
                                                                      base_id =
                                                                          BaseId},
                                                      Role1),
                            {ok, NRole};
                        _ ->
                            NRole = role_trigger:fire(#evt_unit_click{id = Id,
                                                                      type =
                                                                          105,
                                                                      base_id =
                                                                          BaseId},
                                                      Role),
                            {ok, NRole}
                    end;
                _ ->
                    notice:send(Role, 1, lang:get("请勿频繁操作")),
                    ok
            end
    end;
do(Unit = #unit{id = {_BattleId, Id}, type = 105,
                base_id = BaseId},
   _Action,
   Role = #role{pos = #pos{platform = P, zone_id = Z}}) ->
    case pick_check(Unit, Role) of
        {false, Reason} -> {false, Reason};
        {true, PickArgs} ->
            Result = case maps:get(cross_type, PickArgs, undefined)
                         of
                         1 -> cross:call(unit_mgr, sync_remove, [Unit]);
                         _ ->
                             big_world:call(P, Z, unit_mgr, sync_remove, [Unit])
                     end,
            case Result of
                ok ->
                    case pick_action(Unit, Role, PickArgs) of
                        {ok, Role1} ->
                            NRole = role_trigger:fire(#evt_unit_click{id = Id,
                                                                      type =
                                                                          105,
                                                                      base_id =
                                                                          BaseId},
                                                      Role1),
                            {ok, NRole};
                        _ ->
                            NRole = role_trigger:fire(#evt_unit_click{id = Id,
                                                                      type =
                                                                          105,
                                                                      base_id =
                                                                          BaseId},
                                                      Role),
                            {ok, NRole}
                    end;
                _ERR ->
                    logger:debug("~w", [_ERR], unit_action, 781),
                    notice:send(Role, 1, lang:get("请勿频繁操作")),
                    ok
            end
    end;
do(Unit = #unit{id = {_BattleId, Id}, type = 106,
                base_id = BaseId},
   _Action,
   Role = #role{pos = #pos{platform = P, zone_id = Z}}) ->
    case pick_check(Unit, Role) of
        {false, Reason} -> {false, Reason};
        {true, PickArgs} ->
            case cross:call(P, Z, unit_mgr, sync_remove, [Unit]) of
                ok ->
                    case pick_action(Unit, Role, PickArgs) of
                        {ok, Role1} ->
                            NRole = role_trigger:fire(#evt_unit_click{id = Id,
                                                                      type =
                                                                          105,
                                                                      base_id =
                                                                          BaseId},
                                                      Role1),
                            {ok, NRole};
                        _ ->
                            NRole = role_trigger:fire(#evt_unit_click{id = Id,
                                                                      type =
                                                                          105,
                                                                      base_id =
                                                                          BaseId},
                                                      Role),
                            {ok, NRole}
                    end;
                _ERR ->
                    notice:send(Role, 1, lang:get("请勿频繁操作")),
                    ok
            end
    end;
do(_U, _Action, _Role) ->
    logger:debug("_U:~w _Action:~w",
                 [_U, _Action],
                 unit_action,
                 810),
    {false, lang:get("无效的单位操作")}.

check_kill_monster(Role) -> team:get_fighters(Role).

check_kill_boss(Role) -> check_kill_monster(Role).

check_kill_fun_type_unit(57, #unit{lev = UnitLev},
                         Role = #role{id = Rid, name = Name, lev = RoleLev,
                                      m_pet =
                                          #m_pet{pet_nums = PetNums,
                                                 pets = Pets}}) ->
    Len = length([P
                  || P = #pet{spirit_attached_id = 0,
                              spirit_child_flag = 0}
                         <- Pets]),
    case Len >= PetNums of
        true -> {false, lang:get("宠物背包已满，无法进入战斗")};
        false ->
            case team:is_team(Role) of
                true when UnitLev =< RoleLev ->
                    case team:get_fighters(Role) of
                        {ok, [Leader | TeamMates]} ->
                            case treasure:check_combat_cond(TeamMates,
                                                            UnitLev + 5,
                                                            Role)
                                of
                                {ok, Ids} -> {ok, [Leader | Ids]};
                                {ok, Ids, ExtArgs} ->
                                    {ok, [Leader | Ids], ExtArgs};
                                false -> {false, ""}
                            end;
                        {false, Reason} -> {false, Reason}
                    end;
                true ->
                    treasure:callback_combat_cond_notice(Role,
                                                         {Rid,
                                                          Name,
                                                          UnitLev + 5}),
                    {false, ""};
                false ->
                    case UnitLev =< RoleLev of
                        true -> {ok, [Role]};
                        false ->
                            treasure:callback_combat_cond_notice(Role,
                                                                 {Rid,
                                                                  Name,
                                                                  UnitLev + 5}),
                            {false, ""}
                    end
            end
    end;
check_kill_fun_type_unit(FunType = 3,
                         #unit{base_id = BaseId}, Role) ->
    case team:get_fighters(Role) of
        {ok, [Leader | TeamMates]} ->
            case quest_team_cond:check_combat_cond(FunType,
                                                   BaseId,
                                                   TeamMates,
                                                   Role)
                of
                {ok, Ids} -> {ok, [Leader | Ids]};
                {ok, Ids, ExtArgs} -> {ok, [Leader | Ids], ExtArgs};
                false -> {false, ""}
            end;
        {false, Reason} -> {false, Reason}
    end;
check_kill_fun_type_unit(42, #unit{}, Role) ->
    case team:get_fighters(Role) of
        {ok, Mates} ->
            case campaign_unit:check_combat_start(42, Mates) of
                true -> {ok, Mates};
                {false, Reason} -> {false, Reason}
            end;
        {false, Reason} -> {false, Reason}
    end;
check_kill_fun_type_unit(21, #unit{}, Role) ->
    case team:get_fighters(Role) of
        {ok, Mates} ->
            case campaign_unit:check_combat_start(21, Mates) of
                true -> {ok, Mates};
                {false, Reason} -> {false, Reason}
            end;
        {false, Reason} -> {false, Reason}
    end;
check_kill_fun_type_unit(22, #unit{}, Role) ->
    case team:get_fighters(Role) of
        {ok, Mates} ->
            case campaign_unit:check_combat_start(22, Mates) of
                true -> {ok, Mates};
                {false, Reason} -> {false, Reason}
            end;
        {false, Reason} -> {false, Reason}
    end;
check_kill_fun_type_unit(38, #unit{}, Role) ->
    case team:get_fighters(Role) of
        {ok, Mates} ->
            case campaign_unit:check_combat_start(38, Mates) of
                true -> {ok, Mates};
                {false, Reason} -> {false, Reason}
            end;
        {false, Reason} -> {false, Reason}
    end;
check_kill_fun_type_unit(39, #unit{}, Role) ->
    case team:get_fighters(Role) of
        {ok, Mates} ->
            case campaign_unit:check_combat_start(39, Mates) of
                true -> {ok, Mates};
                {false, Reason} -> {false, Reason}
            end;
        {false, Reason} -> {false, Reason}
    end;
check_kill_fun_type_unit(32, #unit{}, Role) ->
    case team:get_fighters(Role) of
        {ok, Mates} ->
            case campaign_unit:check_combat_start(32, Mates) of
                true -> {ok, Mates};
                {false, Reason} -> {false, Reason}
            end;
        {false, Reason} -> {false, Reason}
    end;
check_kill_fun_type_unit(33, #unit{}, Role) ->
    case team:get_fighters(Role) of
        {ok, Mates} ->
            case campaign_unit:check_combat_start(33, Mates) of
                true -> {ok, Mates};
                {false, Reason} -> {false, Reason}
            end;
        {false, Reason} -> {false, Reason}
    end;
check_kill_fun_type_unit(55, #unit{}, Role) ->
    case team:get_fighters(Role) of
        {ok, Mates} ->
            case campaign_unit:check_combat_start(55, Mates) of
                true -> {ok, Mates};
                {false, Reason} -> {false, Reason}
            end;
        {false, Reason} -> {false, Reason}
    end;
check_kill_fun_type_unit(59, #unit{}, Role) ->
    case team:get_fighters(Role) of
        {ok, Mates} ->
            case campaign_unit:check_combat_start(59, Mates) of
                true -> {ok, Mates};
                {false, Reason} -> {false, Reason}
            end;
        {false, Reason} -> {false, Reason}
    end;
check_kill_fun_type_unit(64, #unit{}, Role) ->
    case team:get_fighters(Role) of
        {ok, Mates} ->
            logger:debug("aaaaaaaaaaaaaaaaaaaaaaaa",
                         [],
                         unit_action,
                         960),
            case campaign_unit:check_combat_start(64, Mates) of
                true -> {ok, Mates};
                {false, Reason} -> {false, Reason}
            end;
        {false, Reason} -> {false, Reason}
    end;
check_kill_fun_type_unit(56, #unit{}, Role) ->
    case team:get_fighters(Role) of
        {ok, Mates} ->
            case campaign_unit:check_combat_start(56, Mates) of
                true ->
                    case campaign_unit_card:leader_check(Role) of
                        true -> {ok, Mates};
                        {false, Reason} -> {false, Reason}
                    end;
                {false, Reason} -> {false, Reason}
            end;
        {false, Reason} -> {false, Reason}
    end;
check_kill_fun_type_unit(37, #unit{}, Role) ->
    case team:get_status(Role) of
        false ->
            case campaign_unit:check_combat_start(37, Role) of
                true -> {ok, Role};
                {false, Reason} -> {false, Reason}
            end;
        _ -> {false, lang:get("太多人会吓跑金钱狐，退出队伍再来捕捉吧")}
    end;
check_kill_fun_type_unit(13, _,
                         _Role = #role{s_event = 24}) ->
    {false, lang:get("武道会中不能参与")};
check_kill_fun_type_unit(13, _,
                         _Role = #role{s_event = 25}) ->
    {false, lang:get("武道会中不能参与")};
check_kill_fun_type_unit(13, #unit{id = Id},
                         Role = #role{lev = RoleLev, id = Rid, name = Name}) ->
    UnitLev = treasure:get_ghost_lev(Id),
    case team:is_team(Role) of
        true when UnitLev - 5 =< RoleLev ->
            case team:get_fighters(Role) of
                {ok, [Leader | TeamMates]} ->
                    case treasure:check_combat_cond(TeamMates,
                                                    UnitLev,
                                                    Role)
                        of
                        {ok, Ids} -> {ok, [Leader | Ids]};
                        {ok, Ids, ExtArgs} -> {ok, [Leader | Ids], ExtArgs};
                        false -> {false, ""}
                    end;
                {false, Reason} -> {false, Reason}
            end;
        true ->
            treasure:callback_combat_cond_notice(Role,
                                                 {Rid, Name, UnitLev}),
            {false, ""};
        false ->
            case UnitLev - 5 =< RoleLev of
                true -> {ok, [Role]};
                false ->
                    treasure:callback_combat_cond_notice(Role,
                                                         {Rid, Name, UnitLev}),
                    {false, ""}
            end
    end;
check_kill_fun_type_unit(8, #unit{}, Role) ->
    {ok, Role};
check_kill_fun_type_unit(FunType = 65,
                         #unit{base_id = BaseId}, Role) ->
    case spirit_treasure_role:check_fight_general(Role,
                                                  BaseId)
        of
        true ->
            case team:get_fighters(Role) of
                {ok, [Leader | TeamMates]} ->
                    case quest_team_cond:check_combat_cond(FunType,
                                                           BaseId,
                                                           TeamMates,
                                                           Role)
                        of
                        {ok, Ids} -> {ok, [Leader | Ids]};
                        {ok, Ids, ExtArgs} -> {ok, [Leader | Ids], ExtArgs};
                        false -> {false, ""}
                    end;
                {false, Reason} -> {false, Reason}
            end;
        {false, Reason} -> {false, Reason}
    end;
check_kill_fun_type_unit(FunType = 66,
                         #unit{base_id = BaseId}, Role) ->
    case spirit_treasure_role:check_fight_final(Role,
                                                BaseId)
        of
        true ->
            case team:get_fighters(Role) of
                {ok, [Leader | TeamMates]} ->
                    case quest_team_cond:check_combat_cond(FunType,
                                                           BaseId,
                                                           TeamMates,
                                                           Role)
                        of
                        {ok, Ids} -> {ok, [Leader | Ids]};
                        {ok, Ids, ExtArgs} -> {ok, [Leader | Ids], ExtArgs};
                        false -> {false, ""}
                    end;
                {false, Reason} -> {false, Reason}
            end;
        {false, Reason} -> {false, Reason}
    end;
check_kill_fun_type_unit(FunType = 70,
                         #unit{base_id = BaseId}, Role) ->
    case oracle_treasure_role:check_fight_general(Role,
                                                  BaseId)
        of
        true ->
            case team:get_fighters(Role) of
                {ok, [Leader | TeamMates]} ->
                    case quest_team_cond:check_combat_cond(FunType,
                                                           BaseId,
                                                           TeamMates,
                                                           Role)
                        of
                        {ok, Ids} -> {ok, [Leader | Ids]};
                        {ok, Ids, ExtArgs} -> {ok, [Leader | Ids], ExtArgs};
                        false -> {false, ""}
                    end;
                {false, Reason} -> {false, Reason}
            end;
        {false, Reason} -> {false, Reason}
    end;
check_kill_fun_type_unit(FunType = 71,
                         #unit{base_id = BaseId}, Role) ->
    case oracle_treasure_role:check_fight_final(Role,
                                                BaseId)
        of
        true ->
            case team:get_fighters(Role) of
                {ok, [Leader | TeamMates]} ->
                    case quest_team_cond:check_combat_cond(FunType,
                                                           BaseId,
                                                           TeamMates,
                                                           Role)
                        of
                        {ok, Ids} -> {ok, [Leader | Ids]};
                        {ok, Ids, ExtArgs} -> {ok, [Leader | Ids], ExtArgs};
                        false -> {false, ""}
                    end;
                {false, Reason} -> {false, Reason}
            end;
        {false, Reason} -> {false, Reason}
    end;
check_kill_fun_type_unit(FunType = 74,
                         #unit{base_id = BaseId}, Role) ->
    case gods_place_role:check_fight_boss(Role,
                                          [members, status, time])
        of
        true ->
            case team:get_fighters(Role) of
                {ok, [Leader | TeamMates]} ->
                    case quest_team_cond:check_combat_cond(FunType,
                                                           BaseId,
                                                           TeamMates,
                                                           Role)
                        of
                        {ok, Ids} -> {ok, [Leader | Ids]};
                        {ok, Ids, ExtArgs} -> {ok, [Leader | Ids], ExtArgs};
                        false -> {false, ""}
                    end;
                {false, Reason} -> {false, Reason}
            end;
        {false, Reason} -> {false, Reason}
    end;
check_kill_fun_type_unit(_Type, _Unit, Role) ->
    team:get_fighters(Role).

pick_check(Unit, Role) ->
    pick_check(Unit, Role, [fun_type], #{}).

pick_check(_Unit, _Role, [], PickArgs) ->
    {true, PickArgs};
pick_check(Unit = #unit{id = UId, fun_type = FunType,
                        base_id = BaseId, data = Data, name = UnitName},
           Role = #role{lev = Lev, id = RoleId}, [fun_type | T],
           PickArgs) ->
    Result = case FunType of
                 24 ->
                     wedding:check_pick(Role,
                                        PickArgs#{fun_type => FunType,
                                                  base_id => BaseId});
                 7 -> roll:team_roll_check(Role, PickArgs);
                 9 ->
                     guild_robber:check_pick(Role,
                                             PickArgs#{fun_type => FunType,
                                                       base_id => BaseId});
                 51 ->
                     camp_enjoy_moon:check_pick(Role,
                                                PickArgs#{fun_type => FunType,
                                                          base_id => BaseId});
                 14 ->
                     guild_robber:check_pick(Role,
                                             PickArgs#{fun_type => FunType,
                                                       base_id => BaseId});
                 17 ->
                     fairyland:check_pick(Role,
                                          PickArgs#{fun_type => FunType,
                                                    base_id => BaseId});
                 28 ->
                     guild_treasure:check_pick(Role,
                                               PickArgs#{fun_type => FunType,
                                                         base_id => BaseId});
                 29 ->
                     guild_treasure:check_pick(Role,
                                               PickArgs#{fun_type => FunType,
                                                         base_id => BaseId});
                 26 ->
                     guild_war:check_pick(Role,
                                          PickArgs#{fun_type => FunType,
                                                    base_id => BaseId});
                 53 ->
                     guild_league_role:check_pick(Role,
                                                  PickArgs#{fun_type => FunType,
                                                            base_id => BaseId});
                 34 ->
                     guild_hero:check_pick(Role,
                                           PickArgs#{fun_type => FunType,
                                                     base_id => BaseId});
                 41 ->
                     elf_role:check_pick(Role,
                                         PickArgs#{fun_type => FunType,
                                                   uid => UId,
                                                   base_id => BaseId});
                 52 ->
                     camp_cake:check_pick(Role,
                                          PickArgs#{fun_type => FunType,
                                                    uid => UId,
                                                    base_id => BaseId});
                 61 ->
                     campaign_world_gift:check_pick(Role,
                                                    PickArgs#{fun_type =>
                                                                  FunType,
                                                              uid => UId,
                                                              base_id =>
                                                                  BaseId});
                 49 ->
                     lev_break:check_pick(Role,
                                          PickArgs#{fun_type => FunType,
                                                    base_id => BaseId});
                 68 ->
                     gods_place_role:check_pick(Role,
                                                PickArgs#{fun_type => FunType,
                                                          uid => UId,
                                                          base_id => BaseId});
                 73 ->
                     provocation_role:check_pick(Role,
                                                 PickArgs#{fun_type => FunType,
                                                           uid => UId,
                                                           base_id => BaseId});
                 75 ->
                     canyon_summit_role:check_pick(Role,
                                                   PickArgs#{fun_type =>
                                                                 FunType,
                                                             base_id =>
                                                                 BaseId});
                 48 ->
                     CdFlag = role_misc:check_cd({pick_flower_bag, BaseId}),
                     [{_, Group}, {role_id, TargetId} | _] = Data,
                     Num = var:get_list_var(Role, day, 60, Group, 0),
                     AccNum = var:get_list_var(Role, other, 2027, BaseId, 0),
                     Max = 2,
                     IsSelf = case TargetId == RoleId of
                                  true when AccNum == 0 -> 1;
                                  _ -> 0
                              end,
                     case Num >= Max of
                         true ->
                             {false,
                              notice:format(lang:get("~ts你已经获得~ts个了，把祝福留给别人吧"),
                                            [{string_2, 5, UnitName},
                                             {string_2, 1, Max}])};
                         _ when CdFlag == false ->
                             {false, lang:get("你刚刚获得仙子的祝福，先休息一会再来吧")};
                         _ ->
                             case privilege_data:get_box({BaseId, IsSelf}) of
                                 [] ->
                                     {true,
                                      #{gain => [], is_cast => 0,
                                        group => Group}};
                                 List ->
                                     #privilege_item{item_id = ItemId,
                                                     bind = Bind, num = INum,
                                                     is_cast = IsCast} =
                                         util:rand_list(List,
                                                        #privilege_item.weigth),
                                     {true,
                                      #{gain => [{ItemId, Bind, INum}],
                                        is_cast => IsCast, group => Group,
                                        num => Num, acc_num => AccNum}}
                             end
                     end;
                 30 ->
                     Today = {Y, M, D} = erlang:date(),
                     FestivalLog = var:get_list_var(Role,
                                                    other,
                                                    2008,
                                                    Today,
                                                    0),
                     Week = calendar:day_of_the_week(erlang:date()),
                     {M1, D1} = case festival_data:get({M, D}) of
                                    [_ | _] -> {M, D};
                                    _ ->
                                        case Week of
                                            3 -> {0, 0};
                                            _ -> {M, D}
                                        end
                                end,
                     case festival_data:get({M1, D1}) of
                         _ when FestivalLog > 0 ->
                             {false, lang:get("一人一份，你已经领过了，不要调皮哦")};
                         FestivalGain = [_ | _] ->
                             LevGain = case festival_data:get_lev(Lev) of
                                           [_ | _] = TmpLevGain -> TmpLevGain;
                                           _ -> []
                                       end,
                             Mode = 3352,
                             LevExpGain = case levup_data:get_exp({Mode, Lev})
                                              of
                                              #{exp := TExp, coin := Coin}
                                                  when is_integer(TExp) ->
                                                  case {M1, D1} of
                                                      {0, 0} ->
                                                          [{90010,
                                                            round(TExp / 2)}]
                                                              ++
                                                              [{90000, Coin}];
                                                      _ ->
                                                          [{90010, TExp}] ++
                                                              [{90000, Coin}]
                                                  end;
                                              _ -> []
                                          end,
                             LevPetExpGain = case pet:get_war_pet(Role) of
                                                 {ok, #pet{lev = PetLev}} ->
                                                     case
                                                         levup_data:get_exp({Mode,
                                                                             PetLev})
                                                         of
                                                         #{pet_exp := TPetExp}
                                                             when
                                                               is_integer(TPetExp) ->
                                                             case {M1, D1} of
                                                                 {0, 0} ->
                                                                     [{90005,
                                                                       round(TPetExp
                                                                                 /
                                                                                 2)}];
                                                                 _ ->
                                                                     [{90005,
                                                                       TPetExp}]
                                                             end;
                                                         _ -> []
                                                     end;
                                                 _ -> []
                                             end,
                             {true,
                              #{gain =>
                                    FestivalGain ++
                                        LevGain ++ LevExpGain ++ LevPetExpGain,
                                today => {Y, M1, D1}}};
                         _ -> {false, lang:get("不是节日，我是不发东西的哦")}
                     end;
                 12 -> {false, lang:get("不能采集")};
                 _ -> {true, PickArgs}
             end,
    case Result of
        {true, NewPickArgs} ->
            pick_check(Unit, Role, T, NewPickArgs);
        {false, Reason} -> {false, Reason}
    end.

pick_action(_U = #unit{base_id = BaseId, fun_type = 7},
            _Role, PickArgs) ->
    case maps:get(team_roll_list, PickArgs, undefined) of
        TeamRollList when is_list(TeamRollList) ->
            roll:team_roll(BaseId, TeamRollList);
        _ -> skip
    end;
pick_action(_U = #unit{fun_type = 24, base_id = BaseId,
                       name = UnitName},
            Role = #role{name = Name, pid = _Pid, id = RoleId,
                         pos = #pos{map = MapId}},
            #{gain := Gain, is_cast := IsCast}) ->
    Gain1 = format:val_to_gain(Gain),
    case role_gain:do_notice(Gain1, Role) of
        {ok, Role1} ->
            case IsCast of
                1 ->
                    CastMsg =
                        notice:format(lang:get("喜从天降，~ts在打开~ts的时候惊喜的获得一个~ts{face_1,3}"),
                                      [{role_2, Name},
                                       {string_2, 1, UnitName},
                                       {item_2, Gain}]),
                    notice:cast({map, MapId}, 4, CastMsg);
                _ -> ignore
            end,
            wedding_mgr:cast({pick_unit, RoleId, BaseId}),
            {ok, Role1};
        {false, #gain{msg = Msg}} ->
            notice:return(Msg),
            ok;
        _R ->
            logger:debug("未知返回 ~w", [_R], unit_action, 1255),
            ok
    end;
pick_action(_U = #unit{fun_type = 51, name = UnitName},
            Role = #role{name = Name},
            #{gain := Gain, is_cast := IsCast}) ->
    Gain1 = format:val_to_gain(Gain),
    case role_gain:do_notice(Gain1, Role) of
        {ok, Role1} ->
            case IsCast of
                1 ->
                    CastMsg =
                        notice:format(lang:get("喜从天降，~ts在打开~ts的时候惊喜的获得一个~ts{face_1,3}"),
                                      [{role_2, Name},
                                       {string_2, 1, UnitName},
                                       {item_2, Gain}]),
                    notice:cast(all, 4, CastMsg);
                _ -> ignore
            end,
            camp_enjoy_moon:pick_pop(Role1),
            {ok, Role1};
        {false, #gain{reason = bag_full}} ->
            case IsCast of
                1 ->
                    CastMsg =
                        notice:format(lang:get("喜从天降，~ts在打开~ts的时候惊喜的获得一个~ts{face_1,3}"),
                                      [{role_2, Name},
                                       {string_2, 1, UnitName},
                                       {item_2, Gain}]),
                    notice:cast(all, 4, CastMsg);
                _ -> ignore
            end,
            camp_enjoy_moon:pick_pop(Role),
            mail:send(Role,
                      lang:get("采集月宫宝箱"),
                      lang:get("采集月宫宝箱时，背包空间已满"),
                      Gain),
            Msg = lang:get("背包已满，奖励已发送到邮件"),
            notice:return(Msg),
            ok;
        {false, #gain{msg = Msg}} ->
            notice:return(Msg),
            ok;
        _R ->
            logger:debug("未知返回 ~w", [_R], unit_action, 1288),
            ok
    end;
pick_action(_U = #unit{fun_type = 30, base_id = BaseId,
                       name = UnitName},
            Role = #role{name = Name, pid = _Pid, id = RoleId,
                         pos = #pos{map = MapId}},
            #{gain := Gain, is_cast := IsCast}) ->
    Gain1 = format:val_to_gain(Gain),
    case role_gain:do_notice(Gain1, Role) of
        {ok, Role1} ->
            case IsCast of
                1 ->
                    CastMsg =
                        notice:format(lang:get("喜从天降，~ts在打开~ts的时候惊喜的获得一个~ts{face_1,3}"),
                                      [{role_2, Name},
                                       {string_2, 1, UnitName},
                                       {item_2, Gain}]),
                    notice:cast({map, MapId}, 4, CastMsg);
                _ -> ignore
            end,
            wedding_mgr:cast({pick_unit, RoleId, BaseId}),
            {ok, Role1};
        {false, #gain{msg = Msg}} ->
            notice:return(Msg),
            ok;
        _R ->
            logger:debug("未知返回 ~w", [_R], unit_action, 1308),
            ok
    end;
pick_action(_U = #unit{fun_type = 9},
            Role = #role{pid = Pid}, #{gain := Gain}) ->
    Gain1 = format:val_to_gain(Gain),
    case role_gain:do_notice(Gain1, Role) of
        {ok, Role1} ->
            notice:gain_item(Pid, 1, Gain),
            {ok, Role1};
        {false, #gain{msg = Msg}} ->
            notice:return(Msg),
            ok;
        _R ->
            logger:debug("未知返回 ~w", [_R], unit_action, 1321),
            ok
    end;
pick_action(_U = #unit{fun_type = 28},
            Role = #role{pid = Pid}, #{gain := Gain}) ->
    Gain1 = format:val_to_gain(Gain),
    case role_gain:do_notice(Gain1, Role) of
        {ok, Role1} ->
            notice:gain_item(Pid, 1, Gain),
            {ok, Role1};
        {false, #gain{msg = _Msg}} ->
            Title = lang:get("公会秘藏宝箱奖励"),
            Content = lang:get("由于您背包已满，奖励通过邮件发放，请查收~"),
            mail:send(Role, Title, Content, Gain),
            notice:return(lang:get("背包已满，奖励已通过邮件发放")),
            ok;
        _R ->
            logger:debug("未知返回 ~w", [_R], unit_action, 1337),
            ok
    end;
pick_action(_U = #unit{fun_type = 48, base_id = BaseId,
                       name = _UnitName,
                       data =
                           [_, {role_id, TargetId}, {name, TargetName} | _]},
            Role = #role{name = Name, id = RoleId},
            #{gain := Gain, is_cast := IsCast, group := Group,
              num := Num, acc_num := AccNum}) ->
    Gain1 = format:val_to_gain(Gain),
    NRole = var:set_list_var(Role, day, 60, Group, Num + 1),
    NRole1 = case role_gain:do_notice(Gain1, NRole) of
                 {ok, Role1} -> Role1;
                 {false, _} ->
                     mail:send(Role,
                               lang:get("采集花篮奖励"),
                               lang:get("采集花篮，背包空间已满"),
                               Gain),
                     NRole
             end,
    case IsCast of
        1 ->
            Gain2 = format:gain_to_val(Gain1),
            CastMsg =
                notice:format(lang:get("~ts打开了<color=#00ff00>百花宝箱</color>，惊喜的发现了~ts放在"
                                       "宝箱里的~ts"),
                              [{role_2, Name},
                               {role_2, TargetName},
                               {item_2, Gain2}]),
            notice:cast(all, 4, CastMsg);
        _ -> ignore
    end,
    Msg =
        notice:format(lang:get("幸运地得到~ts洒出的~ts{face_1,34}"),
                      [{role_2, TargetName}, {unit_3, BaseId}]),
    Role2 = case RoleId == TargetId of
                false ->
                    friend_zone:add_trend_no_check(Role,
                                                   0,
                                                   #{content =>
                                                         notice:format(lang:get("我幸运地得到了你洒出的~ts，么么哒{face_1,34}"),
                                                                       [{string_2,
                                                                         1,
                                                                         unit:name(BaseId)}]),
                                                     zone_id => TargetId,
                                                     presents => [],
                                                     popularity => 1}),
                    NRole1;
                _ ->
                    var:set_list_var(NRole1,
                                     other,
                                     2027,
                                     BaseId,
                                     AccNum + 1)
            end,
    notice:send(Role, 3, Msg),
    {ok, Role2};
pick_action(_U = #unit{fun_type = 61}, Role,
            PickArgs) ->
    campaign_world_gift:pick_gain(Role, PickArgs);
pick_action(_U = #unit{fun_type = 68}, Role,
            PickArgs) ->
    gods_place_role:pick_gain(Role, PickArgs);
pick_action(_U = #unit{fun_type = 73}, Role,
            PickArgs) ->
    provocation_role:pick_gain(Role, PickArgs);
pick_action(_U = #unit{fun_type = 30, base_id = BaseId},
            Role = #role{pid = Pid},
            #{gain := Gain, today := {_, M, D}}) ->
    Gain1 = format:val_to_gain(Gain),
    case role_gain:do_notice(Gain1, Role) of
        {ok, Role1} ->
            Today = erlang:date(),
            Role2 = var:set_list_var(Role1, other, 2008, Today, 1),
            notice:gain_item(Pid, 1, Gain),
            Msg = festival_data:get_msg({M, D}),
            sys_conn:pack_send(9910, {BaseId, Msg}),
            push_festival(Role2),
            {ok, Role2};
        {false, #gain{msg = Msg}} ->
            notice:return(Msg),
            ok;
        _R ->
            logger:debug("未知返回 ~w", [_R], unit_action, 1393),
            ok
    end;
pick_action(_U = #unit{fun_type = 26}, Role,
            #{gain := Gain}) ->
    guild_war:pick_gain(Role, Gain);
pick_action(_U = #unit{fun_type = 53}, Role,
            #{gain := Gain}) ->
    guild_league_role:pick_gain(Role, Gain);
pick_action(_U = #unit{fun_type = 17}, Role,
            PickArgs) ->
    fairyland:pick_gain(Role, PickArgs);
pick_action(_U = #unit{fun_type = 34}, Role,
            PickArgs) ->
    guild_hero:pick_gain(Role, PickArgs);
pick_action(_U = #unit{fun_type = 41}, Role,
            PickArgs) ->
    elf_role:pick_gain(Role, PickArgs);
pick_action(_U = #unit{fun_type = 52}, Role,
            PickArgs) ->
    camp_cake:pick_gain(Role, PickArgs);
pick_action(_U = #unit{fun_type = 49}, Role,
            PickArgs) ->
    lev_break:pick_gain(Role, PickArgs);
pick_action(_U = #unit{fun_type = 75}, Role,
            #{gain := Gain}) ->
    canyon_summit_role:pick_gain(Role, Gain);
pick_action(_Unit, _Role, _PickArgs) -> ok.

push_festival(Role) ->
    Today = {_, M, D} = erlang:date(),
    FestivalLog = var:get_list_var(Role,
                                   other,
                                   2008,
                                   Today,
                                   0),
    Week = calendar:day_of_the_week(erlang:date()),
    {M1, D1} = case festival_data:get({M, D}) of
                   [_ | _] -> {M, D};
                   _ ->
                       case Week of
                           3 -> {0, 0};
                           _ -> {M, D}
                       end
               end,
    Result = case festival_data:get({M1, D1}) of
                 _ when FestivalLog > 0 -> 0;
                 [_ | _] -> 1;
                 _ -> 0
             end,
    role:link_send(Role, 10228, {Result}).

festival_reset(Role, _) ->
    push_festival(Role),
    ok.

treat_slave_attr(Fighter, Attr0) ->
    Fighter#fighter{attr =
                        {unit_action, treat_unit_attr, [Attr0]}}.

treat_unit_attr(Attr, Attr0) -> do_attr(Attr0, Attr).

do_attr([], Attr) -> Attr;
do_attr([{51, Rate} | T], Attr = #attr{hp_max = Val}) ->
    do_attr(T,
            Attr#attr{hp_max = round(Val * Rate / 1000)});
do_attr([{54, Rate} | T],
        Attr = #attr{phy_dmg = Val}) ->
    do_attr(T,
            Attr#attr{phy_dmg = round(Val * Rate / 1000)});
do_attr([{55, Rate} | T],
        Attr = #attr{magic_dmg = Val}) ->
    do_attr(T,
            Attr#attr{magic_dmg = round(Val * Rate / 1000)});
do_attr([{53, Rate} | T],
        Attr = #attr{atk_speed = Val}) ->
    do_attr(T,
            Attr#attr{atk_speed = round(Val * Rate / 1000)});
do_attr([{Type, Rate} | T], Attr) ->
    logger:error("未知属性 ~w, ~w",
                 [Type, Rate],
                 unit_action,
                 1461),
    do_attr(T, Attr).

