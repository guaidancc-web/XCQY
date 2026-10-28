-file("src/mod/role/role_classes_modify.erl", 1).

-module(role_classes_modify).

-export([five_flush/2]).

-export([rpc_query_classes_modify_fee/2,
         rpc_role_classes_modify/4,
         back_modify/2,
         gm_role_classes_modify/3,
         change_classes_stone/3]).

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

-file("src/mod/role/role_classes_modify.erl", 24).

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

-file("src/mod/role/role_classes_modify.erl", 25).

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

-file("src/mod/role/role_classes_modify.erl", 26).

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

-file("src/mod/role/role_classes_modify.erl", 27).

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

-file("src/mod/role/role_classes_modify.erl", 28).

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

-file("src/mod/role/role_classes_modify.erl", 29).

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

-file("src/mod/role/role_classes_modify.erl", 30).

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

-file("src/mod/role/role_classes_modify.erl", 31).

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

-file("src/mod/role/role_classes_modify.erl", 32).

-file("inc/blacksmith.hrl", 1).

-record(enchant_fail_reward,
        {val = 0,
         item_list = [],
         title = "",
         msg = "",
         is_break = 0}).

-file("src/mod/role/role_classes_modify.erl", 33).

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

-file("src/mod/role/role_classes_modify.erl", 34).

-file("inc/rank.hrl", 1).

-record(rank,
        {type = 1,
         show_list = [],
         list = [],
         last_val = 0,
         len = 0}).

-record(rank_rc,
        {ver = 3 :: pos_integer(),
         id = {roleid, platform, zoneid} :: term(),
         rank = 1,
         time = 0 :: non_neg_integer(),
         role_id = 0 :: non_neg_integer(),
         platform = "" :: list(),
         zone_id = 0 :: non_neg_integer(),
         name = "" :: list(),
         sex = 0 :: 0..2,
         classes = 0 :: 0..4,
         lev = 0 :: non_neg_integer(),
         val1 = 0 :: non_neg_integer(),
         val2 = 0 :: non_neg_integer(),
         val3 = 0 :: non_neg_integer(),
         val4 = 0 :: non_neg_integer(),
         desc = "",
         pet,
         guard,
         eqm}).

-record(rank_cfg,
        {type = 0 :: non_neg_integer(),
         num = 100 :: non_neg_integer(),
         keys = [#rank_rc.val3, #rank_rc.val2, #rank_rc.val1] ::
             [pos_integer()],
         min_val = 1 :: pos_integer(),
         nologin = 0 :: non_neg_integer(),
         zone = rank_zone_1 :: atom()}).

-file("src/mod/role/role_classes_modify.erl", 35).

-file("inc/lev_break.hrl", 1).

-record(m_lev_break,
        {ver = 0,
         trial = 0 :: non_neg_integer(),
         done = 0 :: non_neg_integer(),
         times = 0 :: non_neg_integer(),
         attr_point = 0 :: non_neg_integer()}).

-file("src/mod/role/role_classes_modify.erl", 36).

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

-file("src/mod/role/role_classes_modify.erl", 36).

-file("inc/package.hrl", 1).

-record(package,
        {type = 1 :: integer(),
         next_id = 1 :: pos_integer(),
         volume = 0 :: non_neg_integer(),
         free_cell = [] :: list(),
         items = [] :: [tuple()]}).

-file("src/mod/role/role_classes_modify.erl", 37).

-file("inc/talisman.hrl", 1).

-record(m_talisman,
        {ver = 5,
         next_id = 1,
         use_plan = 1,
         plan_1 = [],
         plan_2 = [],
         items = [],
         fusion_lev = 0,
         fusion_val = 0,
         skills = [],
         fc = 0,
         remold_formula = [],
         last_gain_id = 0,
         volume = 48}).

-record(talisman,
        {ver = 3,
         id = 1,
         base_id = 0,
         type = 0,
         quality = 0,
         lev = 0,
         attr = [],
         num = 1,
         fc = 0}).

-record(talisman_base,
        {base_id = 0,
         name = "",
         type = 0,
         quality = 0,
         lev = 0,
         need_lev = 0,
         need_lev_break = 0,
         set_id = 0,
         fusion_val = 0,
         base_attr = [],
         grade = 0}).

-file("src/mod/role/role_classes_modify.erl", 39).

five_flush(Role = #role{}, _) ->
    LastCmTime = var:get_var(Role, other, 2046, 0),
    Now = date:unixtime(),
    logger:debug("5点更新判断是否发宝石转换提醒:~w",
                 [{LastCmTime, Now}],
                 role_classes_modify,
                 45),
    case (Now - LastCmTime) div 86400 of
        6 ->
            Tiltle = lang:get("宝石转换提醒"),
            Content =
                notice:format(lang:get("宝石免费转换服务~ts。您在转职后还没有进行宝石转换，请抓紧时间前往~ts进行~ts。过期"
                                       "转换窗口将关闭。一定要记得转换宝石哦！"),
                              [{string_2, 1, lang:get("明天到期")},
                               {string_2, 5, lang:get("转职导师")},
                               {string_2, 1, lang:get("宝石转换")}]),
            mail:send(Role, Tiltle, Content),
            ok;
        Day when Day >= 7 ->
            case var:get_var(Role, other, 2048, 0) of
                1 ->
                    logger:debug("清除精炼次数", [], role_classes_modify, 57),
                    VarRole1 = var:set_var(Role, other, 2048, 0),
                    NewRole = eqm:del_classes_modify_free_times(VarRole1),
                    NewRole1 = talisman_flag_reset(NewRole),
                    {ok, NewRole1};
                _ -> ok
            end;
        _ -> ok
    end.

back_modify(Role = #role{id = RoleId, classes = Classes,
                         lev = Lev,
                         m_lev_break = #m_lev_break{times = LevBreakTimes}},
            TargetClasses) ->
    LastList = var:get_var(Role, other, 2053, []),
    BaseClasses = case Lev >= 85 andalso LevBreakTimes >= 0
                      of
                      true -> [1, 2, 3, 4, 5, 6, 7];
                      _ ->
                          case Classes of
                              1 -> [3, 7];
                              2 -> [6];
                              3 -> [1, 7];
                              4 -> [5];
                              5 -> [4];
                              6 -> [2];
                              7 -> [3, 1]
                          end
                  end,
    case LastList of
        [_ | _] ->
            IsBackModify = case LastList of
                               [TargetClasses | _] -> 1;
                               _ -> 0
                           end,
            {IsBackModify, BaseClasses};
        _ ->
            case get_last_data(RoleId) of
                TargetClasses -> {1, [TargetClasses | BaseClasses]};
                _ ->
                    IsBackModify = 0,
                    {IsBackModify, BaseClasses}
            end
    end.

rpc_query_classes_modify_fee(Role, TargetClasses) ->
    case check_can_modify([lev, last_time], Role) of
        {false, Reason} -> {false, Reason};
        true ->
            Rate =
                role_classes_statistics:get_classes_rate(TargetClasses),
            ClassesModifyTimes = var:get_var(Role, other, 2047, 0),
            {IsBackModify, _AllowedClasses} = back_modify(Role,
                                                          TargetClasses),
            case calc_classes_modify_cost(TargetClasses,
                                          ClassesModifyTimes,
                                          IsBackModify)
                of
                false -> {false, lang:get("未知的职业")};
                {CostGold, CostGoldBind, _} ->
                    logger:debug("查询转职费用:~w",
                                 [{CostGold, CostGoldBind}],
                                 role_classes_modify,
                                 120),
                    {ok, CostGold, CostGoldBind, Rate}
            end;
        _ -> ok
    end.

rpc_role_classes_modify(#role{classes = Classes},
                        Classes, _CostType, _IsBackModify) ->
    {false, lang:get("您选择的目标职业就是您当前的职业，无需进行转职")};
rpc_role_classes_modify(Role = #role{id = RoleId,
                                     classes = OldClasses, name = RoleName},
                        TargetClasses, CostType, IsBackModify) ->
    case check_can_modify([lev,
                           team,
                           combat,
                           last_time,
                           classes_quest,
                           shipping,
                           guild_quest,
                           chain_quest,
                           {costType, CostType, TargetClasses}],
                          Role)
        of
        {false, Reason} -> {false, Reason};
        true ->
            ClassesModifyTimes = var:get_var(Role, other, 2047, 0),
            {Gold, GoldBind, _GoldBindDeposit} =
                calc_classes_modify_cost(TargetClasses,
                                         ClassesModifyTimes,
                                         IsBackModify),
            Loss = case CostType of
                       2 -> format:val_to_loss([{90002, Gold}]);
                       1 -> format:val_to_loss([{90003, GoldBind}])
                   end,
            case role_gain:do_notice(Loss, Role) of
                {ok, LossRole} ->
                    Now = date:unixtime(),
                    role:link_send(Role,
                                   10029,
                                   {TargetClasses,
                                    Now,
                                    ClassesModifyTimes + 1}),
                    logger:debug("扣除专职费用成功:~w",
                                 [Loss],
                                 role_classes_modify,
                                 148),
                    logger:debug("原来职业:~w",
                                 [OldClasses],
                                 role_classes_modify,
                                 150),
                    OldStoneId =
                        skill_unique_data:get_classes_stoneId(OldClasses),
                    NewStoneId =
                        skill_unique_data:get_classes_stoneId(TargetClasses),
                    logger:debug("获取石头的ID...~w,~w,",
                                 [OldStoneId, NewStoneId],
                                 role_classes_modify,
                                 153),
                    StoneRole = case catch change_classes_stone(LossRole,
                                                                OldStoneId,
                                                                NewStoneId)
                                    of
                                    Trole = #role{} -> Trole;
                                    _Oth ->
                                        logger:debug("ERROR",
                                                     [],
                                                     role_classes_modify,
                                                     156),
                                        LossRole
                                end,
                    logger:debug("晶石转化成功...", [], role_classes_modify, 159),
                    ItemRole = classes_modify_item_convert(OldClasses,
                                                           TargetClasses,
                                                           StoneRole),
                    SkillRole = skill:skill_classes_modify(ItemRole,
                                                           TargetClasses),
                    SkillUniqueRole =
                        skill_unique:skill_classes_modify(SkillRole,
                                                          TargetClasses),
                    logger:debug("变更职业技能成功...",
                                 [],
                                 role_classes_modify,
                                 168),
                    PointRole = attr:point_classes_modify(SkillUniqueRole,
                                                          TargetClasses),
                    logger:debug("重置加点方案成功...",
                                 [],
                                 role_classes_modify,
                                 171),
                    MountRole = mount:mount_classes_modify(PointRole,
                                                           TargetClasses),
                    logger:debug("进行坐骑转化成功...",
                                 [],
                                 role_classes_modify,
                                 175),
                    TalismanRole =
                        talisman:talisman_classes_modify(MountRole,
                                                         TargetClasses),
                    StatueType = case OldClasses of
                                     1 -> 20;
                                     2 -> 21;
                                     3 -> 22;
                                     4 -> 23;
                                     5 -> 24;
                                     6 -> 66;
                                     7 -> 85;
                                     _ -> 20
                                 end,
                    case unit_mgr:lookup_statue(StatueType) of
                        {ok, #unit_statue{id = RoleId}} ->
                            logger:debug("雕像数据:~w",
                                         [{StatueType, OldClasses}],
                                         role_classes_modify,
                                         195),
                            unit_mgr:clear_statue(OldClasses, StatueType),
                            honor_mgr:del(top_compete_rank, RoleId);
                        _ -> skip
                    end,
                    ShippingRole =
                        shipping:shipping_classes_modify(TalismanRole,
                                                         TargetClasses),
                    {ok, StoreRole} = store:reset_role(ShippingRole),
                    HookRole =
                        combat_hook_setting:hook_class_modify(StoreRole,
                                                              TargetClasses),
                    VarRole1 = var:set_var(HookRole, other, 2046, Now),
                    VarRole2 = var:add_var(VarRole1, other, 2047, 1),
                    VarRole3 = var:set_var(VarRole2, other, 2048, 1),
                    RriggerRole =
                        role_trigger:fire(#evt_classes_modify_times{times =
                                                                        ClassesModifyTimes
                                                                            +
                                                                            1},
                                          VarRole3),
                    FashionRole =
                        fashion:fashion_classes_modify(RriggerRole,
                                                       TargetClasses),
                    WingRole = wing:wing_classes_modify(FashionRole,
                                                        TargetClasses),
                    EqmRole = eqm:eqm_classes_modify(WingRole,
                                                     TargetClasses),
                    logger:debug("进行装备转化成功...",
                                 [],
                                 role_classes_modify,
                                 222),
                    FcHonorRole = fc_update:honor_class_modify(EqmRole,
                                                               TargetClasses),
                    NewRole = FcHonorRole#role{classes = TargetClasses},
                    role_classes_statistics:classes_modify(NewRole),
                    friend_zone:update(Role, classes, TargetClasses),
                    arena_mgr:rename(NewRole),
                    OldRankType = case OldClasses of
                                      1 -> 21;
                                      2 -> 22;
                                      3 -> 23;
                                      4 -> 24;
                                      5 -> 25;
                                      6 -> 26;
                                      7 -> 27;
                                      _ -> 26
                                  end,
                    rank_listener:exit_rank(OldRankType, RoleId),
                    send_classes_modify_mail(NewRole),
                    OldClassesName = get_classes_name(OldClasses),
                    NewClassesName = get_classes_name(TargetClasses),
                    Msg =
                        notice:format(lang:get("~ts放弃了~ts身份，成功转职成为了一名~ts，星辰大陆又将掀起新的风浪{face_1, "
                                               "18}"),
                                      [{role_2, RoleName},
                                       {string_2, 1, OldClassesName},
                                       {string_2, 1, NewClassesName}]),
                    notice:cast(all, 5, Msg),
                    log:classes_modify(Role, TargetClasses),
                    {ok, NewRole};
                {false, #loss{msg = Msg}} -> {false, Msg};
                _ -> {false, lang:get("金币不足，不能进行转职")}
            end
    end.

talisman_flag_reset(Role = #role{m_talisman =
                                     MTalisman}) ->
    NewMTalisman = MTalisman#m_talisman{last_gain_id = 0},
    NewRole = Role#role{m_talisman = NewMTalisman},
    NewRole.

classes_modify_item_convert(OldClasses, TargetClasses,
                            Role = #role{p_bag = Bag, p_store = Store,
                                         p_family_store = FamilyStore}) ->
    case classes_modify_data:get_item_convert({OldClasses,
                                               TargetClasses})
        of
        ConvertList when is_list(ConvertList) ->
            NewBag =
                classes_modify_item_convert_package(ConvertList,
                                                    Bag,
                                                    Role),
            NewStore =
                classes_modify_item_convert_package(ConvertList,
                                                    Store,
                                                    Role),
            NewFamilyStore =
                classes_modify_item_convert_package(ConvertList,
                                                    FamilyStore,
                                                    Role),
            NewRole = Role#role{p_bag = NewBag, p_store = NewStore,
                                p_family_store = NewFamilyStore},
            NewRole;
        _ -> Role
    end.

classes_modify_item_convert_package([], Package,
                                    _Role) ->
    Package;
classes_modify_item_convert_package([#{old_item_id :=
                                           OldItemId,
                                       new_item_id := NewItemId}
                                     | T],
                                    Package = #package{type = Type,
                                                       items = Items},
                                    Role) ->
    {ChangeItems, OtherItems} = lists:partition(fun
                                                    (#item{base_id = BaseId}) ->
                                                        BaseId =:= OldItemId
                                                end,
                                                Items),
    NewChangeItems = [Item#item{base_id = NewItemId}
                      || Item <- ChangeItems],
    package:push_item_info(del,
                           Role,
                           [{Type, ChangeItems}]),
    package:push_item_info(add,
                           Role,
                           [{Type, NewChangeItems}]),
    NewItems = OtherItems ++ NewChangeItems,
    classes_modify_item_convert_package(T,
                                        Package#package{items = NewItems},
                                        Role);
classes_modify_item_convert_package([_ | T], Package,
                                    Role) ->
    classes_modify_item_convert_package(T, Package, Role).

check_can_modify([Type | Rest], Role) ->
    case check_can_modify(Type, Role) of
        true -> check_can_modify(Rest, Role);
        _Else -> _Else
    end;
check_can_modify(lev, #role{lev = Lev}) when Lev < 60 ->
    Msg = notice:format(lang:get("您的等级不足~ts级，不能进行转职"),
                        [{string_2, 5, 60}]),
    {false, Msg};
check_can_modify(team,
                 #role{m_team = #m_team{pid = Pid}})
    when is_pid(Pid) ->
    {false, lang:get("您正在队伍中，不能进行转职")};
check_can_modify(combat,
                 #role{m_combat = #m_combat{pid = Pid}})
    when is_pid(Pid) ->
    {false, lang:get("您正在战斗中，不能进行转职")};
check_can_modify(last_time, Role) ->
    LastTime = var:get_var(Role, other, 2046, 0),
    CmTimes = var:get_var(Role, other, 2047, 0),
    ColdDown = classes_modify_data:get_colddown(CmTimes),
    Now = date:unixtime(),
    case Now - LastTime =< ColdDown of
        true ->
            Msg = notice:format(lang:get("您距离上次转职不足~ts天，无法再次进行转职"),
                                [{string_2, 5, ColdDown div 86400}]),
            {false, Msg};
        false -> true
    end;
check_can_modify(shipping, Role = #role{}) ->
    case shipping:is_in_shipping(Role) of
        true ->
            Msg = notice:format(lang:get("请先完成~ts再进行转职"),
                                [{string_2, 5, lang:get("远航任务")}]),
            {false, Msg};
        _ -> true
    end;
check_can_modify(classes_quest, Role = #role{}) ->
    case quest_classes:is_in_quest(Role) of
        true ->
            Msg = notice:format(lang:get("请先完成~ts再进行转职"),
                                [{string_2, 5, lang:get("职业任务")}]),
            {false, Msg};
        _ -> true
    end;
check_can_modify(guild_quest, Role = #role{}) ->
    case quest_guild:is_in_guild_task(Role) of
        true ->
            Msg = notice:format(lang:get("请先完成~ts再进行转职"),
                                [{string_2, 5, lang:get("公会任务")}]),
            {false, Msg};
        _ -> true
    end;
check_can_modify(chain_quest, Role = #role{}) ->
    case quest_chain:is_had_chain(Role) of
        true ->
            Msg = notice:format(lang:get("请先完成~ts再进行转职"),
                                [{string_2, 5, lang:get("历练任务")}]),
            {false, Msg};
        _ -> true
    end;
check_can_modify({costType, CostType, TargetClasses},
                 Role = #role{assets = #assets{gold_bind = GoldBind}}) ->
    case CostType of
        2 -> true;
        1 ->
            Times = var:get_var(Role, other, 2047, 0),
            {IsBackModify, _AllowedClasses} = back_modify(Role,
                                                          TargetClasses),
            {_, _CostGoldBind, GoldBindDeposit} =
                calc_classes_modify_cost(TargetClasses,
                                         Times,
                                         IsBackModify),
            case GoldBind >= GoldBindDeposit of
                true -> true;
                _ ->
                    logger:debug("~w, ~w",
                                 [GoldBind, GoldBindDeposit],
                                 role_classes_modify,
                                 382),
                    {false, lang:get("金币不足")}
            end;
        _ -> {false, lang:get("数据错误")}
    end;
check_can_modify(_, _) -> true.

calc_classes_modify_cost(Classes, Times,
                         IsBackModify) ->
    Rate =
        role_classes_statistics:get_classes_rate(Classes),
    {CostGold, CostGoldBind, GoldBindDeposit} =
        classes_modify_data:get_cost_price(Classes,
                                           Times,
                                           Rate),
    case IsBackModify of
        1 ->
            {round(CostGold / 2),
             round(CostGoldBind / 2),
             round(GoldBindDeposit / 2)};
        _ -> {CostGold, CostGoldBind, GoldBindDeposit}
    end.

get_classes_name(1) -> lang:get("狂剑");
get_classes_name(2) -> lang:get("魔导");
get_classes_name(3) -> lang:get("战弓");
get_classes_name(4) -> lang:get("兽灵");
get_classes_name(5) -> lang:get("秘言");
get_classes_name(6) -> lang:get("月魂");
get_classes_name(7) -> lang:get("圣骑");
get_classes_name(_) -> lang:get("无名").

send_classes_modify_mail(Role = #role{classes =
                                          Classes}) ->
    Title = lang:get("转职成功"),
    Content = case Classes of
                  1 ->
                      notice:format(lang:get("恭喜您转职成功，你所转换的~ts以~ts著称，推荐增加~ts属性。\n~ts\n1.~ts"
                                             "已同步转为新职业技能\n2.装备~ts和~ts已同步转移\n3.装备~ts已随机转为新特效\n"
                                             "4.装备~ts已对应转换\n5.人物属性加点已~ts\n6.~ts已转为新职业坐骑数据\n"
                                             "转职后~ts可~ts进行一次~ts和~ts,一定要记得进行转换哦！"),
                                    [{string_2, 5, lang:get("狂剑")},
                                     {string_2, 5, lang:get("强大物理爆发能力")},
                                     {string_2, 1, lang:get("力量")},
                                     {string_2, 5, lang:get("本次转职已经完成以下转换：")},
                                     {string_2, 5, lang:get("职业技能")},
                                     {string_2, 5, lang:get("强化等级")},
                                     {string_2, 5, lang:get("附加属性")},
                                     {string_2, 5, lang:get("附加特效")},
                                     {string_2, 5, lang:get("精炼属性")},
                                     {string_2, 5, lang:get("全部重置")},
                                     {string_2, 5, lang:get("坐骑数据")},
                                     {string_2, 1, lang:get("7天内")},
                                     {string_2, 5, lang:get("免费")},
                                     {string_2, 5, lang:get("宝石")},
                                     {string_2, 5, lang:get("英雄宝石转换")}]);
                  2 ->
                      notice:format(lang:get("恭喜您转职成功，你所转换的~ts以~ts著称，推荐增加~ts属性。\n~ts\n1.~ts"
                                             "已同步转为新职业技能\n2.装备~ts和~ts已同步转移\n3.装备~ts已随机转为新特效\n"
                                             "4.装备~ts已对应转换\n5.人物属性加点已~ts\n6.~ts已转为新职业坐骑数据\n"
                                             "转职后~ts可~ts进行一次~ts和~ts,一定要记得进行转换哦！"),
                                    [{string_2, 5, lang:get("魔导")},
                                     {string_2, 5, lang:get("卓越魔法群伤能力")},
                                     {string_2, 1, lang:get("智力")},
                                     {string_2, 5, lang:get("本次转职已经完成以下转换：")},
                                     {string_2, 5, lang:get("职业技能")},
                                     {string_2, 5, lang:get("强化等级")},
                                     {string_2, 5, lang:get("附加属性")},
                                     {string_2, 5, lang:get("附加特效")},
                                     {string_2, 5, lang:get("精炼属性")},
                                     {string_2, 5, lang:get("全部重置")},
                                     {string_2, 5, lang:get("坐骑数据")},
                                     {string_2, 1, lang:get("7天内")},
                                     {string_2, 5, lang:get("免费")},
                                     {string_2, 5, lang:get("宝石")},
                                     {string_2, 5, lang:get("英雄宝石转换")}]);
                  3 ->
                      notice:format(lang:get("恭喜您转职成功，你所转换的~ts以~ts著称，推荐增加~ts属性。\n~ts\n1.~ts"
                                             "已同步转为新职业技能\n2.装备~ts和~ts已同步转移\n3.装备~ts已随机转为新特效\n"
                                             "4.装备~ts已对应转换\n5.人物属性加点已~ts\n6.~ts已转为新职业坐骑数据\n"
                                             "转职后~ts可~ts进行一次~ts和~ts,一定要记得进行转换哦！"),
                                    [{string_2, 5, lang:get("战弓")},
                                     {string_2, 5, lang:get("强大物理群伤能力")},
                                     {string_2, 1, lang:get("力量、敏捷")},
                                     {string_2, 5, lang:get("本次转职已经完成以下转换：")},
                                     {string_2, 5, lang:get("职业技能")},
                                     {string_2, 5, lang:get("强化等级")},
                                     {string_2, 5, lang:get("附加属性")},
                                     {string_2, 5, lang:get("附加特效")},
                                     {string_2, 5, lang:get("精炼属性")},
                                     {string_2, 5, lang:get("全部重置")},
                                     {string_2, 5, lang:get("坐骑数据")},
                                     {string_2, 1, lang:get("7天内")},
                                     {string_2, 5, lang:get("免费")},
                                     {string_2, 5, lang:get("宝石")},
                                     {string_2, 5, lang:get("英雄宝石转换")}]);
                  4 ->
                      notice:format(lang:get("恭喜您转职成功，你所转换的~ts以~ts著称，推荐增加~ts属性。\n~ts\n1.~ts"
                                             "已同步转为新职业技能\n2.装备~ts和~ts已同步转移\n3.装备~ts已随机转为新特效\n"
                                             "4.装备~ts已对应转换\n5.人物属性加点已~ts\n6.~ts已转为新职业坐骑数据\n"
                                             "转职后~ts可~ts进行一次~ts和~ts,一定要记得进行转换哦！"),
                                    [{string_2, 5, lang:get("兽灵")},
                                     {string_2, 5, lang:get("强大战斗控场能力")},
                                     {string_2, 1, lang:get("敏捷")},
                                     {string_2, 5, lang:get("本次转职已经完成以下转换：")},
                                     {string_2, 5, lang:get("职业技能")},
                                     {string_2, 5, lang:get("强化等级")},
                                     {string_2, 5, lang:get("附加属性")},
                                     {string_2, 5, lang:get("附加特效")},
                                     {string_2, 5, lang:get("精炼属性")},
                                     {string_2, 5, lang:get("全部重置")},
                                     {string_2, 5, lang:get("坐骑数据")},
                                     {string_2, 1, lang:get("7天内")},
                                     {string_2, 5, lang:get("免费")},
                                     {string_2, 5, lang:get("宝石")},
                                     {string_2, 5, lang:get("英雄宝石转换")}]);
                  5 ->
                      notice:format(lang:get("恭喜您转职成功，你所转换的~ts以~ts著称，推荐增加~ts属性。\n~ts\n1.~ts"
                                             "已同步转为新职业技能\n2.装备~ts和~ts已同步转移\n3.装备~ts已随机转为新特效\n"
                                             "4.装备~ts已对应转换\n5.人物属性加点已~ts\n6.~ts已转为新职业坐骑数据\n"
                                             "转职后~ts可~ts进行一次~ts和~ts,一定要记得进行转换哦！"),
                                    [{string_2, 5, lang:get("秘言")},
                                     {string_2, 5, lang:get("强大治疗辅助能力")},
                                     {string_2, 1, lang:get("体质、耐力、敏捷")},
                                     {string_2, 5, lang:get("本次转职已经完成以下转换：")},
                                     {string_2, 5, lang:get("职业技能")},
                                     {string_2, 5, lang:get("强化等级")},
                                     {string_2, 5, lang:get("附加属性")},
                                     {string_2, 5, lang:get("附加特效")},
                                     {string_2, 5, lang:get("精炼属性")},
                                     {string_2, 5, lang:get("全部重置")},
                                     {string_2, 5, lang:get("坐骑数据")},
                                     {string_2, 1, lang:get("7天内")},
                                     {string_2, 5, lang:get("免费")},
                                     {string_2, 5, lang:get("宝石")},
                                     {string_2, 5, lang:get("英雄宝石转换")}]);
                  6 ->
                      notice:format(lang:get("恭喜您转职成功，你所转换的~ts以~ts著称，推荐增加~ts属性。\n~ts\n1.~ts"
                                             "已同步转为新职业技能\n2.装备~ts和~ts已同步转移\n3.装备~ts已随机转为新特效\n"
                                             "4.装备~ts已对应转换\n5.人物属性加点已~ts\n6.~ts已转为新职业坐骑数据\n"
                                             "转职后~ts可~ts进行一次~ts和~ts,一定要记得进行转换哦！"),
                                    [{string_2, 5, lang:get("月魂")},
                                     {string_2, 5, lang:get("持续输出能力")},
                                     {string_2, 1, lang:get("智力")},
                                     {string_2, 5, lang:get("本次转职已经完成以下转换：")},
                                     {string_2, 5, lang:get("职业技能")},
                                     {string_2, 5, lang:get("强化等级")},
                                     {string_2, 5, lang:get("附加属性")},
                                     {string_2, 5, lang:get("附加特效")},
                                     {string_2, 5, lang:get("精炼属性")},
                                     {string_2, 5, lang:get("全部重置")},
                                     {string_2, 5, lang:get("坐骑数据")},
                                     {string_2, 1, lang:get("7天内")},
                                     {string_2, 5, lang:get("免费")},
                                     {string_2, 5, lang:get("宝石")},
                                     {string_2, 5, lang:get("英雄宝石转换")}]);
                  7 ->
                      notice:format(lang:get("恭喜您转职成功，你所转换的~ts以~ts著称，推荐增加~ts属性。\n~ts\n1.~ts"
                                             "已同步转为新职业技能\n2.装备~ts和~ts已同步转移\n3.装备~ts已随机转为新特效\n"
                                             "4.装备~ts已对应转换\n5.人物属性加点已~ts\n6.~ts已转为新职业坐骑数据\n"
                                             "转职后~ts可~ts进行一次~ts和~ts,一定要记得进行转换哦！"),
                                    [{string_2, 5, lang:get("圣骑")},
                                     {string_2, 5, lang:get("强悍的持续输出续航")},
                                     {string_2, 1, lang:get("力量")},
                                     {string_2, 5, lang:get("本次转职已经完成以下转换：")},
                                     {string_2, 5, lang:get("职业技能")},
                                     {string_2, 5, lang:get("强化等级")},
                                     {string_2, 5, lang:get("附加属性")},
                                     {string_2, 5, lang:get("附加特效")},
                                     {string_2, 5, lang:get("精炼属性")},
                                     {string_2, 5, lang:get("全部重置")},
                                     {string_2, 5, lang:get("坐骑数据")},
                                     {string_2, 1, lang:get("7天内")},
                                     {string_2, 5, lang:get("免费")},
                                     {string_2, 5, lang:get("宝石")},
                                     {string_2, 5, lang:get("英雄宝石转换")}]);
                  _ ->
                      notice:format(lang:get("恭喜您转职成功，请记得进行~ts。\n1.宝石转换将按照~ts折算为新宝石\n2.高价宝石"
                                             "转为低价宝石，最多可转换为~ts宝石\n3.低价宝石转高价宝石，根据市场价宝石等级会降低，"
                                             "降低后超出部分通过~ts新宝石\n4.宝石转换最少可以转为~ts\n5.转职后~ts可进行"
                                             "免费宝石转换，过期转换窗口将~ts,一定要记得赶紧转换宝石哦！"),
                                    [{string_2, 5, lang:get("装备宝石转换")},
                                     {string_2, 5, lang:get("市场价格")},
                                     {string_2, 5, lang:get("同等级")},
                                     {string_2, 5, lang:get("邮件返还")},
                                     {string_2, 5, lang:get("1级新宝石")},
                                     {string_2, 1, lang:get("7天内")},
                                     {string_2, 5, lang:get("关闭")}])
              end,
    mail:send(Role, Title, Content).

gm_role_classes_modify(TargetClasses, CostType,
                       Role = #role{classes = Classes})
    when TargetClasses >= 1 andalso TargetClasses =< 7 ->
    logger:debug("~w",
                 [{TargetClasses, CostType}],
                 role_classes_modify,
                 441),
    LastList = var:get_var(Role, other, 2053, []),
    {IsBackModify, AllowedClasses} =
        role_classes_modify:back_modify(Role, TargetClasses),
    logger:debug("~w",
                 [AllowedClasses],
                 role_classes_modify,
                 444),
    case lists:member(TargetClasses, AllowedClasses) of
        true ->
            case gm_rpc_role_classes_modify(Role,
                                            TargetClasses,
                                            CostType,
                                            IsBackModify)
                of
                {ok, NewRole} ->
                    AttrRole = attr:calc_and_push(NewRole),
                    LookRole = looks:calc(AttrRole),
                    looks:update_looks(Role, LookRole),
                    map:role_update(LookRole),
                    NewLastList = [Classes | LastList],
                    NewRole1 = var:set_var(LookRole,
                                           other,
                                           2053,
                                           NewLastList),
                    {ok, NewRole1};
                {false, Reason} -> {reply, Reason}
            end;
        false -> {reply, lang:get("只允许同类型职业之间转换")}
    end;
gm_role_classes_modify(_TargetClasses, _CostType,
                       Role) ->
    {ok, Role}.

gm_rpc_role_classes_modify(#role{classes = Classes},
                           Classes, _CostType, _IsBackModify) ->
    {false, lang:get("您选择的目标职业就是您当前的职业，无需进行转职")};
gm_rpc_role_classes_modify(Role = #role{id = RoleId,
                                        classes = OldClasses, name = RoleName},
                           TargetClasses, CostType, IsBackModify) ->
    case check_can_modify([lev,
                           {costType, CostType, TargetClasses}],
                          Role)
        of
        {false, Reason} -> {false, Reason};
        true ->
            ClassesModifyTimes = var:get_var(Role, other, 2047, 0),
            {Gold, GoldBind, _GoldBindDeposit} =
                calc_classes_modify_cost(TargetClasses,
                                         ClassesModifyTimes,
                                         IsBackModify),
            Loss = case CostType of
                       2 -> format:val_to_loss([{90002, Gold}]);
                       1 -> format:val_to_loss([{90003, GoldBind}])
                   end,
            case role_gain:do_notice(Loss, Role) of
                {ok, LossRole} ->
                    Now = date:unixtime(),
                    role:link_send(Role,
                                   10029,
                                   {TargetClasses,
                                    Now,
                                    ClassesModifyTimes + 1}),
                    logger:debug("扣除专职费用成功:~w",
                                 [Loss],
                                 role_classes_modify,
                                 486),
                    OldStoneId =
                        skill_unique_data:get_classes_stoneId(OldClasses),
                    NewStoneId =
                        skill_unique_data:get_classes_stoneId(TargetClasses),
                    logger:debug("获取石头的ID...~w,~w,",
                                 [OldStoneId, NewStoneId],
                                 role_classes_modify,
                                 490),
                    StoneRole = case catch change_classes_stone(LossRole,
                                                                OldStoneId,
                                                                NewStoneId)
                                    of
                                    Trole = #role{} -> Trole;
                                    _Oth ->
                                        logger:debug("ERROR",
                                                     [],
                                                     role_classes_modify,
                                                     493),
                                        LossRole
                                end,
                    logger:debug("晶石转化成功...", [], role_classes_modify, 496),
                    ItemRole = classes_modify_item_convert(OldClasses,
                                                           TargetClasses,
                                                           StoneRole),
                    SkillRole = skill:skill_classes_modify(ItemRole,
                                                           TargetClasses),
                    SkillUniqueRole =
                        skill_unique:skill_classes_modify(SkillRole,
                                                          TargetClasses),
                    logger:debug("变更职业技能成功...",
                                 [],
                                 role_classes_modify,
                                 505),
                    PointRole = attr:point_classes_modify(SkillUniqueRole,
                                                          TargetClasses),
                    logger:debug("重置加点方案成功...",
                                 [],
                                 role_classes_modify,
                                 508),
                    MountRole = mount:mount_classes_modify(PointRole,
                                                           TargetClasses),
                    logger:debug("进行坐骑转化成功...",
                                 [],
                                 role_classes_modify,
                                 512),
                    TalismanRole =
                        talisman:talisman_classes_modify(MountRole,
                                                         TargetClasses),
                    StatueType = case OldClasses of
                                     1 -> 20;
                                     2 -> 21;
                                     3 -> 22;
                                     4 -> 23;
                                     5 -> 24;
                                     6 -> 66;
                                     7 -> 85;
                                     _ -> 20
                                 end,
                    case unit_mgr:lookup_statue(StatueType) of
                        {ok, #unit_statue{id = RoleId}} ->
                            logger:debug("雕像数据:~w",
                                         [{StatueType, OldClasses}],
                                         role_classes_modify,
                                         531),
                            unit_mgr:clear_statue(OldClasses, StatueType),
                            honor_mgr:del(top_compete_rank, RoleId);
                        _ -> skip
                    end,
                    ShippingRole =
                        shipping:shipping_classes_modify(TalismanRole,
                                                         TargetClasses),
                    {ok, StoreRole} = store:reset_role(ShippingRole),
                    HookRole =
                        combat_hook_setting:hook_class_modify(StoreRole,
                                                              TargetClasses),
                    VarRole1 = var:set_var(HookRole, other, 2046, Now),
                    VarRole2 = var:add_var(VarRole1, other, 2047, 1),
                    VarRole3 = var:set_var(VarRole2, other, 2048, 1),
                    RriggerRole =
                        role_trigger:fire(#evt_classes_modify_times{times =
                                                                        ClassesModifyTimes
                                                                            +
                                                                            1},
                                          VarRole3),
                    FashionRole =
                        fashion:fashion_classes_modify(RriggerRole,
                                                       TargetClasses),
                    WingRole = wing:wing_classes_modify(FashionRole,
                                                        TargetClasses),
                    EqmRole = eqm:eqm_classes_modify(WingRole,
                                                     TargetClasses),
                    logger:debug("进行装备转化成功...",
                                 [],
                                 role_classes_modify,
                                 558),
                    FcHonorRole = fc_update:honor_class_modify(EqmRole,
                                                               TargetClasses),
                    NewRole = FcHonorRole#role{classes = TargetClasses},
                    role_classes_statistics:classes_modify(NewRole),
                    friend_zone:update(Role, classes, TargetClasses),
                    arena_mgr:rename(NewRole),
                    OldRankType = case OldClasses of
                                      1 -> 21;
                                      2 -> 22;
                                      3 -> 23;
                                      4 -> 24;
                                      5 -> 25;
                                      6 -> 26;
                                      7 -> 27;
                                      _ -> 26
                                  end,
                    rank_listener:exit_rank(OldRankType, RoleId),
                    send_classes_modify_mail(NewRole),
                    OldClassesName = get_classes_name(OldClasses),
                    NewClassesName = get_classes_name(TargetClasses),
                    Msg =
                        notice:format(lang:get("~ts放弃了~ts身份，成功转职成为了一名~ts，星辰大陆又将掀起新的风浪{face_1, "
                                               "18}"),
                                      [{role_2, RoleName},
                                       {string_2, 1, OldClassesName},
                                       {string_2, 1, NewClassesName}]),
                    notice:cast(all, 5, Msg),
                    log:classes_modify(Role, TargetClasses),
                    {ok, NewRole};
                {false, #loss{msg = Msg}} -> {false, Msg};
                _ -> {false, lang:get("金币不足，不能进行转职")}
            end
    end.

change_classes_stone(Role = #role{p_bag = PBag,
                                  p_store = PStore,
                                  p_family_store = PFamilyStore},
                     OldStoneId, NewStoneId) ->
    logger:debug("0000000", [], role_classes_modify, 617),
    PBagRole = change_classes_stone_from_package(OldStoneId,
                                                 NewStoneId,
                                                 PBag,
                                                 Role),
    PStoreRole =
        change_classes_stone_from_package(OldStoneId,
                                          NewStoneId,
                                          PStore,
                                          PBagRole),
    PFamilyStoreRole =
        change_classes_stone_from_package(OldStoneId,
                                          NewStoneId,
                                          PFamilyStore,
                                          PStoreRole),
    VarRole = var:set_var(PFamilyStoreRole, other, 2121, 1),
    VarRole.

change_classes_stone_from_package(OldStoneId,
                                  NewStoneId, Package = #package{type = 1},
                                  Role) ->
    case catch
             do_change_classes_stone_from_package(OldStoneId,
                                                  NewStoneId,
                                                  Package,
                                                  Role)
        of
        NewPackage = #package{} ->
            logger:debug("Cur ", [], role_classes_modify, 633),
            Role#role{p_bag = NewPackage};
        _Oth ->
            logger:debug("ERROR:", [], role_classes_modify, 634),
            Role
    end;
change_classes_stone_from_package(OldStoneId,
                                  NewStoneId, Package = #package{type = 2},
                                  Role) ->
    case catch
             do_change_classes_stone_from_package(OldStoneId,
                                                  NewStoneId,
                                                  Package,
                                                  Role)
        of
        NewPackage = #package{} ->
            Role#role{p_store = NewPackage};
        _Oth ->
            logger:debug("ERROR:", [], role_classes_modify, 639),
            Role
    end;
change_classes_stone_from_package(OldStoneId,
                                  NewStoneId, Package = #package{type = 4},
                                  Role) ->
    case catch
             do_change_classes_stone_from_package(OldStoneId,
                                                  NewStoneId,
                                                  Package,
                                                  Role)
        of
        NewPackage = #package{} ->
            Role#role{p_family_store = NewPackage};
        _Oth ->
            logger:debug("ERROR:", [], role_classes_modify, 645),
            Role
    end;
change_classes_stone_from_package(_OldStoneId,
                                  _NewStoneId,
                                  _Package = #package{type = _Type}, Role) ->
    logger:debug("Type~w",
                 [_Type],
                 role_classes_modify,
                 648),
    Role;
change_classes_stone_from_package(_OldStoneId,
                                  _NewStoneId, _Package, Role) ->
    logger:debug("错大发了", [], role_classes_modify, 651),
    Role.

do_change_classes_stone_from_package(OldStoneId,
                                     NewStoneId,
                                     Package = #package{type = PackType,
                                                        items = Items},
                                     Role) ->
    Fun = fun (#item{base_id = BaseId}) ->
                  BaseId =:= OldStoneId
          end,
    {NeedToChangeList, NotChangeList} = case catch
                                                 lists:partition(Fun, Items)
                                            of
                                            {A, B} when is_list(A) -> {A, B};
                                            _Oth ->
                                                logger:debug("Error",
                                                             [],
                                                             role_classes_modify,
                                                             658),
                                                {[], Items}
                                        end,
    logger:debug("NeedToChangList~w",
                 [NeedToChangeList],
                 role_classes_modify,
                 660),
    ChangeList = [Item#item{base_id = NewStoneId}
                  || Item <- NeedToChangeList],
    logger:debug("ChangeList:~w",
                 [ChangeList],
                 role_classes_modify,
                 663),
    NewItemList = ChangeList ++ NotChangeList,
    package:push_item_info(del,
                           Role,
                           [{PackType, NeedToChangeList}]),
    package:push_item_info(add,
                           Role,
                           [{PackType, ChangeList}]),
    Package#package{items = NewItemList}.

get_last_data({1, "beta", 1}) -> 1;
get_last_data({3, "beta", 1}) -> 1;
get_last_data({11, "beta", 1}) -> 2;
get_last_data({1243, "beta", 1}) -> 5;
get_last_data({4591, "beta", 1}) -> 2;
get_last_data({6470, "beta", 1}) -> 5;
get_last_data({13007, "beta", 1}) -> 2;
get_last_data({19555, "beta", 1}) -> 2;
get_last_data({23557, "beta", 1}) -> 1;
get_last_data({31548, "beta", 1}) -> 2;
get_last_data({34221, "beta", 1}) -> 2;
get_last_data({38120, "beta", 1}) -> 4;
get_last_data({45232, "beta", 1}) -> 4;
get_last_data({774, "beta", 10}) -> 1;
get_last_data({159, "beta", 11}) -> 2;
get_last_data({559, "beta", 11}) -> 3;
get_last_data({807, "beta", 11}) -> 5;
get_last_data({2286, "beta", 11}) -> 3;
get_last_data({2936, "beta", 11}) -> 2;
get_last_data({12551, "beta", 11}) -> 2;
get_last_data({13059, "beta", 11}) -> 4;
get_last_data({16355, "beta", 11}) -> 2;
get_last_data({23428, "beta", 11}) -> 3;
get_last_data({2397, "beta", 12}) -> 2;
get_last_data({399, "beta", 13}) -> 3;
get_last_data({1370, "beta", 13}) -> 2;
get_last_data({3546, "beta", 13}) -> 5;
get_last_data({1579, "beta", 14}) -> 3;
get_last_data({4521, "beta", 14}) -> 2;
get_last_data({10389, "beta", 14}) -> 2;
get_last_data({336, "beta", 15}) -> 1;
get_last_data({1017, "beta", 15}) -> 3;
get_last_data({1488, "beta", 15}) -> 1;
get_last_data({141, "beta", 16}) -> 3;
get_last_data({1359, "beta", 16}) -> 2;
get_last_data({3372, "beta", 16}) -> 1;
get_last_data({14102, "beta", 16}) -> 5;
get_last_data({8353, "beta", 17}) -> 2;
get_last_data({612, "beta", 18}) -> 1;
get_last_data({30785, "beta", 19}) -> 1;
get_last_data({12, "beta", 2}) -> 2;
get_last_data({311, "beta", 2}) -> 1;
get_last_data({9757, "beta", 2}) -> 3;
get_last_data({15296, "beta", 2}) -> 2;
get_last_data({15508, "beta", 2}) -> 2;
get_last_data({16532, "beta", 2}) -> 4;
get_last_data({49965, "beta", 2}) -> 6;
get_last_data({179, "beta", 20}) -> 2;
get_last_data({541, "beta", 20}) -> 2;
get_last_data({781, "beta", 20}) -> 2;
get_last_data({7352, "beta", 20}) -> 1;
get_last_data({12664, "beta", 20}) -> 3;
get_last_data({27418, "beta", 20}) -> 1;
get_last_data({17, "beta", 21}) -> 3;
get_last_data({701, "beta", 21}) -> 2;
get_last_data({2869, "beta", 21}) -> 1;
get_last_data({5340, "beta", 21}) -> 2;
get_last_data({9585, "beta", 21}) -> 2;
get_last_data({1189, "beta", 22}) -> 3;
get_last_data({2077, "beta", 22}) -> 2;
get_last_data({18476, "beta", 22}) -> 1;
get_last_data({215, "beta", 23}) -> 2;
get_last_data({28877, "beta", 23}) -> 1;
get_last_data({4637, "beta", 24}) -> 3;
get_last_data({6193, "beta", 24}) -> 3;
get_last_data({14412, "beta", 24}) -> 1;
get_last_data({14835, "beta", 25}) -> 5;
get_last_data({21303, "beta", 25}) -> 3;
get_last_data({11, "beta", 26}) -> 2;
get_last_data({1113, "beta", 26}) -> 1;
get_last_data({1128, "beta", 26}) -> 3;
get_last_data({12306, "beta", 26}) -> 1;
get_last_data({72, "beta", 27}) -> 4;
get_last_data({167, "beta", 27}) -> 2;
get_last_data({1705, "beta", 27}) -> 2;
get_last_data({6865, "beta", 27}) -> 2;
get_last_data({19290, "beta", 27}) -> 1;
get_last_data({204, "beta", 28}) -> 1;
get_last_data({208, "beta", 28}) -> 4;
get_last_data({448, "beta", 28}) -> 3;
get_last_data({229, "beta", 29}) -> 4;
get_last_data({1626, "beta", 29}) -> 3;
get_last_data({2431, "beta", 29}) -> 2;
get_last_data({5172, "beta", 29}) -> 3;
get_last_data({9782, "beta", 29}) -> 3;
get_last_data({1, "beta", 3}) -> 3;
get_last_data({69, "beta", 3}) -> 5;
get_last_data({17400, "beta", 3}) -> 2;
get_last_data({1528, "beta", 30}) -> 3;
get_last_data({2563, "beta", 30}) -> 4;
get_last_data({8596, "beta", 30}) -> 2;
get_last_data({17590, "beta", 30}) -> 2;
get_last_data({22955, "beta", 30}) -> 2;
get_last_data({29099, "beta", 30}) -> 3;
get_last_data({38930, "beta", 30}) -> 5;
get_last_data({74, "beta", 31}) -> 3;
get_last_data({1035, "beta", 31}) -> 5;
get_last_data({1363, "beta", 31}) -> 2;
get_last_data({1714, "beta", 31}) -> 5;
get_last_data({2937, "beta", 31}) -> 2;
get_last_data({3113, "beta", 31}) -> 1;
get_last_data({4344, "beta", 31}) -> 2;
get_last_data({5522, "beta", 31}) -> 1;
get_last_data({2143, "beta", 32}) -> 4;
get_last_data({390, "beta", 33}) -> 1;
get_last_data({620, "beta", 33}) -> 2;
get_last_data({6927, "beta", 33}) -> 3;
get_last_data({8017, "beta", 33}) -> 1;
get_last_data({9605, "beta", 33}) -> 1;
get_last_data({12659, "beta", 33}) -> 2;
get_last_data({22560, "beta", 33}) -> 1;
get_last_data({24489, "beta", 33}) -> 3;
get_last_data({26856, "beta", 33}) -> 4;
get_last_data({28163, "beta", 33}) -> 2;
get_last_data({32008, "beta", 33}) -> 1;
get_last_data({100, "beta", 34}) -> 5;
get_last_data({537, "beta", 34}) -> 2;
get_last_data({4562, "beta", 34}) -> 1;
get_last_data({6198, "beta", 34}) -> 2;
get_last_data({11958, "beta", 34}) -> 4;
get_last_data({590, "beta", 36}) -> 1;
get_last_data({16809, "beta", 36}) -> 3;
get_last_data({20095, "beta", 36}) -> 2;
get_last_data({159, "beta", 37}) -> 5;
get_last_data({229, "beta", 37}) -> 1;
get_last_data({498, "beta", 37}) -> 4;
get_last_data({1034, "beta", 37}) -> 2;
get_last_data({1178, "beta", 37}) -> 3;
get_last_data({2030, "beta", 37}) -> 3;
get_last_data({11568, "beta", 37}) -> 3;
get_last_data({14462, "beta", 37}) -> 3;
get_last_data({27309, "beta", 37}) -> 3;
get_last_data({354, "beta", 38}) -> 3;
get_last_data({726, "beta", 38}) -> 2;
get_last_data({992, "beta", 38}) -> 1;
get_last_data({18426, "beta", 38}) -> 1;
get_last_data({22625, "beta", 38}) -> 2;
get_last_data({35, "beta", 39}) -> 2;
get_last_data({1625, "beta", 39}) -> 1;
get_last_data({1675, "beta", 39}) -> 2;
get_last_data({3985, "beta", 39}) -> 1;
get_last_data({15878, "beta", 39}) -> 5;
get_last_data({300, "beta", 4}) -> 2;
get_last_data({495, "beta", 4}) -> 3;
get_last_data({1100, "beta", 4}) -> 5;
get_last_data({2725, "beta", 4}) -> 1;
get_last_data({3073, "beta", 4}) -> 3;
get_last_data({6691, "beta", 4}) -> 2;
get_last_data({20388, "beta", 4}) -> 3;
get_last_data({28952, "beta", 4}) -> 5;
get_last_data({30347, "beta", 4}) -> 2;
get_last_data({30769, "beta", 4}) -> 5;
get_last_data({91, "beta", 40}) -> 2;
get_last_data({955, "beta", 40}) -> 1;
get_last_data({13778, "beta", 40}) -> 1;
get_last_data({19990, "beta", 40}) -> 3;
get_last_data({21620, "beta", 40}) -> 1;
get_last_data({24117, "beta", 40}) -> 1;
get_last_data({27981, "beta", 40}) -> 2;
get_last_data({31659, "beta", 40}) -> 5;
get_last_data({8423, "beta", 41}) -> 2;
get_last_data({13350, "beta", 41}) -> 3;
get_last_data({15652, "beta", 41}) -> 5;
get_last_data({4306, "beta", 42}) -> 3;
get_last_data({5120, "beta", 42}) -> 2;
get_last_data({8159, "beta", 42}) -> 2;
get_last_data({11259, "beta", 42}) -> 1;
get_last_data({984, "beta", 43}) -> 2;
get_last_data({3060, "beta", 43}) -> 1;
get_last_data({11116, "beta", 43}) -> 2;
get_last_data({17866, "beta", 43}) -> 2;
get_last_data({5804, "beta", 44}) -> 2;
get_last_data({6660, "beta", 44}) -> 5;
get_last_data({13520, "beta", 44}) -> 3;
get_last_data({303, "beta", 45}) -> 4;
get_last_data({459, "beta", 45}) -> 2;
get_last_data({2380, "beta", 45}) -> 2;
get_last_data({10192, "beta", 45}) -> 3;
get_last_data({10622, "beta", 45}) -> 2;
get_last_data({17405, "beta", 45}) -> 5;
get_last_data({12, "beta", 46}) -> 3;
get_last_data({316, "beta", 46}) -> 2;
get_last_data({383, "beta", 46}) -> 5;
get_last_data({5040, "beta", 46}) -> 5;
get_last_data({7709, "beta", 46}) -> 1;
get_last_data({9413, "beta", 46}) -> 2;
get_last_data({12505, "beta", 46}) -> 3;
get_last_data({16705, "beta", 46}) -> 2;
get_last_data({19548, "beta", 46}) -> 3;
get_last_data({279, "beta", 47}) -> 4;
get_last_data({1119, "beta", 47}) -> 2;
get_last_data({1363, "beta", 47}) -> 2;
get_last_data({1685, "beta", 47}) -> 3;
get_last_data({2189, "beta", 47}) -> 2;
get_last_data({5169, "beta", 47}) -> 3;
get_last_data({8791, "beta", 47}) -> 4;
get_last_data({14596, "beta", 47}) -> 3;
get_last_data({16451, "beta", 47}) -> 1;
get_last_data({67, "beta", 48}) -> 5;
get_last_data({610, "beta", 48}) -> 4;
get_last_data({929, "beta", 48}) -> 2;
get_last_data({7561, "beta", 48}) -> 4;
get_last_data({385, "beta", 49}) -> 5;
get_last_data({448, "beta", 49}) -> 3;
get_last_data({568, "beta", 49}) -> 1;
get_last_data({587, "beta", 49}) -> 1;
get_last_data({1868, "beta", 49}) -> 4;
get_last_data({3062, "beta", 49}) -> 2;
get_last_data({3331, "beta", 49}) -> 2;
get_last_data({3949, "beta", 49}) -> 2;
get_last_data({4040, "beta", 49}) -> 2;
get_last_data({9068, "beta", 49}) -> 3;
get_last_data({9129, "beta", 49}) -> 3;
get_last_data({10486, "beta", 49}) -> 2;
get_last_data({11388, "beta", 49}) -> 4;
get_last_data({16313, "beta", 49}) -> 5;
get_last_data({16645, "beta", 49}) -> 2;
get_last_data({16830, "beta", 49}) -> 1;
get_last_data({21739, "beta", 49}) -> 5;
get_last_data({22010, "beta", 49}) -> 2;
get_last_data({24153, "beta", 49}) -> 2;
get_last_data({20, "beta", 5}) -> 2;
get_last_data({8264, "beta", 5}) -> 2;
get_last_data({10131, "beta", 5}) -> 2;
get_last_data({12103, "beta", 5}) -> 1;
get_last_data({152, "beta", 50}) -> 5;
get_last_data({194, "beta", 50}) -> 4;
get_last_data({701, "beta", 50}) -> 2;
get_last_data({2328, "beta", 50}) -> 5;
get_last_data({2434, "beta", 50}) -> 2;
get_last_data({2751, "beta", 50}) -> 2;
get_last_data({4109, "beta", 50}) -> 1;
get_last_data({4823, "beta", 50}) -> 5;
get_last_data({4876, "beta", 50}) -> 5;
get_last_data({6518, "beta", 50}) -> 1;
get_last_data({7068, "beta", 50}) -> 5;
get_last_data({8879, "beta", 50}) -> 1;
get_last_data({9806, "beta", 50}) -> 5;
get_last_data({11800, "beta", 50}) -> 2;
get_last_data({19553, "beta", 50}) -> 2;
get_last_data({119, "beta", 51}) -> 1;
get_last_data({381, "beta", 51}) -> 4;
get_last_data({1012, "beta", 51}) -> 1;
get_last_data({1925, "beta", 51}) -> 2;
get_last_data({4703, "beta", 51}) -> 1;
get_last_data({6836, "beta", 51}) -> 1;
get_last_data({8330, "beta", 51}) -> 2;
get_last_data({11044, "beta", 51}) -> 2;
get_last_data({12482, "beta", 51}) -> 1;
get_last_data({15874, "beta", 51}) -> 2;
get_last_data({22734, "beta", 51}) -> 4;
get_last_data({1669, "beta", 52}) -> 2;
get_last_data({1756, "beta", 52}) -> 2;
get_last_data({3017, "beta", 52}) -> 5;
get_last_data({3088, "beta", 52}) -> 1;
get_last_data({5884, "beta", 52}) -> 5;
get_last_data({5997, "beta", 52}) -> 3;
get_last_data({8804, "beta", 52}) -> 1;
get_last_data({9802, "beta", 52}) -> 3;
get_last_data({12647, "beta", 52}) -> 5;
get_last_data({13150, "beta", 52}) -> 1;
get_last_data({13407, "beta", 52}) -> 2;
get_last_data({13566, "beta", 52}) -> 5;
get_last_data({18413, "beta", 52}) -> 2;
get_last_data({180, "beta", 53}) -> 2;
get_last_data({692, "beta", 53}) -> 4;
get_last_data({188, "beta", 54}) -> 1;
get_last_data({479, "beta", 54}) -> 4;
get_last_data({880, "beta", 54}) -> 5;
get_last_data({4570, "beta", 54}) -> 3;
get_last_data({4799, "beta", 54}) -> 5;
get_last_data({4993, "beta", 54}) -> 3;
get_last_data({5833, "beta", 54}) -> 1;
get_last_data({18447, "beta", 54}) -> 1;
get_last_data({66, "beta", 55}) -> 5;
get_last_data({143, "beta", 55}) -> 1;
get_last_data({178, "beta", 55}) -> 3;
get_last_data({1946, "beta", 55}) -> 2;
get_last_data({7361, "beta", 55}) -> 5;
get_last_data({10765, "beta", 55}) -> 3;
get_last_data({12174, "beta", 55}) -> 3;
get_last_data({16488, "beta", 55}) -> 3;
get_last_data({556, "beta", 56}) -> 5;
get_last_data({1049, "beta", 56}) -> 2;
get_last_data({1192, "beta", 56}) -> 5;
get_last_data({2250, "beta", 56}) -> 3;
get_last_data({2932, "beta", 56}) -> 3;
get_last_data({5290, "beta", 56}) -> 3;
get_last_data({5479, "beta", 56}) -> 2;
get_last_data({6812, "beta", 56}) -> 2;
get_last_data({7383, "beta", 56}) -> 5;
get_last_data({17586, "beta", 56}) -> 2;
get_last_data({19984, "beta", 56}) -> 1;
get_last_data({21681, "beta", 56}) -> 2;
get_last_data({44, "beta", 57}) -> 1;
get_last_data({4236, "beta", 57}) -> 1;
get_last_data({4393, "beta", 57}) -> 4;
get_last_data({4804, "beta", 57}) -> 5;
get_last_data({5388, "beta", 57}) -> 4;
get_last_data({7061, "beta", 57}) -> 2;
get_last_data({10655, "beta", 57}) -> 5;
get_last_data({12153, "beta", 57}) -> 2;
get_last_data({81, "beta", 58}) -> 6;
get_last_data({84, "beta", 58}) -> 6;
get_last_data({211, "beta", 58}) -> 6;
get_last_data({320, "beta", 58}) -> 3;
get_last_data({373, "beta", 58}) -> 6;
get_last_data({418, "beta", 58}) -> 6;
get_last_data({510, "beta", 58}) -> 4;
get_last_data({526, "beta", 58}) -> 6;
get_last_data({716, "beta", 58}) -> 6;
get_last_data({1340, "beta", 58}) -> 6;
get_last_data({1454, "beta", 58}) -> 1;
get_last_data({1752, "beta", 58}) -> 3;
get_last_data({1942, "beta", 58}) -> 6;
get_last_data({3483, "beta", 58}) -> 6;
get_last_data({3735, "beta", 58}) -> 6;
get_last_data({3843, "beta", 58}) -> 5;
get_last_data({4012, "beta", 58}) -> 6;
get_last_data({4434, "beta", 58}) -> 6;
get_last_data({5564, "beta", 58}) -> 4;
get_last_data({7010, "beta", 58}) -> 1;
get_last_data({7415, "beta", 58}) -> 6;
get_last_data({9772, "beta", 58}) -> 6;
get_last_data({14668, "beta", 58}) -> 2;
get_last_data({20435, "beta", 58}) -> 6;
get_last_data({50, "beta", 59}) -> 6;
get_last_data({148, "beta", 59}) -> 6;
get_last_data({511, "beta", 59}) -> 2;
get_last_data({990, "beta", 59}) -> 6;
get_last_data({1953, "beta", 59}) -> 5;
get_last_data({7967, "beta", 59}) -> 1;
get_last_data({9896, "beta", 59}) -> 6;
get_last_data({11807, "beta", 59}) -> 3;
get_last_data({955, "beta", 6}) -> 1;
get_last_data({2868, "beta", 6}) -> 2;
get_last_data({3630, "beta", 6}) -> 3;
get_last_data({4023, "beta", 6}) -> 4;
get_last_data({28464, "beta", 6}) -> 3;
get_last_data({40462, "beta", 6}) -> 5;
get_last_data({5, "beta", 60}) -> 6;
get_last_data({1538, "beta", 60}) -> 6;
get_last_data({2290, "beta", 60}) -> 1;
get_last_data({3602, "beta", 60}) -> 6;
get_last_data({3878, "beta", 60}) -> 6;
get_last_data({4363, "beta", 60}) -> 1;
get_last_data({7439, "beta", 60}) -> 6;
get_last_data({7689, "beta", 7}) -> 3;
get_last_data({10959, "beta", 7}) -> 5;
get_last_data({11412, "beta", 7}) -> 1;
get_last_data({16861, "beta", 7}) -> 3;
get_last_data({26250, "beta", 7}) -> 2;
get_last_data({34226, "beta", 7}) -> 1;
get_last_data({39884, "beta", 7}) -> 5;
get_last_data({202, "beta", 8}) -> 2;
get_last_data({6711, "beta", 8}) -> 2;
get_last_data({13280, "beta", 8}) -> 2;
get_last_data({15337, "beta", 8}) -> 3;
get_last_data({19089, "beta", 8}) -> 2;
get_last_data({41763, "beta", 8}) -> 2;
get_last_data({43192, "beta", 8}) -> 5;
get_last_data({47177, "beta", 8}) -> 1;
get_last_data({984, "beta", 9}) -> 2;
get_last_data({1210, "beta", 9}) -> 5;
get_last_data({3133, "beta", 9}) -> 5;
get_last_data({5995, "beta", 9}) -> 1;
get_last_data({6177, "beta", 9}) -> 2;
get_last_data({19128, "beta", 9}) -> 2;
get_last_data({27584, "beta", 9}) -> 2;
get_last_data({36622, "beta", 9}) -> 1;
get_last_data({2, "ios", 1}) -> 5;
get_last_data({385, "ios", 1}) -> 2;
get_last_data({618, "ios", 1}) -> 2;
get_last_data({736, "ios", 1}) -> 2;
get_last_data({929, "ios", 1}) -> 3;
get_last_data({1503, "ios", 1}) -> 2;
get_last_data({1658, "ios", 1}) -> 5;
get_last_data({1686, "ios", 1}) -> 4;
get_last_data({1715, "ios", 1}) -> 5;
get_last_data({5134, "ios", 1}) -> 1;
get_last_data({10394, "ios", 1}) -> 3;
get_last_data({13004, "ios", 1}) -> 2;
get_last_data({14118, "ios", 1}) -> 5;
get_last_data({14556, "ios", 1}) -> 1;
get_last_data({16004, "ios", 1}) -> 5;
get_last_data({17798, "ios", 1}) -> 1;
get_last_data({19483, "ios", 1}) -> 2;
get_last_data({21521, "ios", 1}) -> 1;
get_last_data({22971, "ios", 1}) -> 3;
get_last_data({23672, "ios", 1}) -> 2;
get_last_data({25195, "ios", 1}) -> 2;
get_last_data({29341, "ios", 1}) -> 4;
get_last_data({41009, "ios", 1}) -> 2;
get_last_data({45296, "ios", 1}) -> 3;
get_last_data({47006, "ios", 1}) -> 5;
get_last_data({55265, "ios", 1}) -> 5;
get_last_data({201, "ios", 10}) -> 2;
get_last_data({842, "ios", 10}) -> 4;
get_last_data({2264, "ios", 10}) -> 2;
get_last_data({6546, "ios", 10}) -> 2;
get_last_data({6947, "ios", 10}) -> 4;
get_last_data({79, "ios", 11}) -> 5;
get_last_data({4274, "ios", 11}) -> 1;
get_last_data({7562, "ios", 11}) -> 3;
get_last_data({12318, "ios", 11}) -> 1;
get_last_data({14533, "ios", 11}) -> 1;
get_last_data({1423, "ios", 12}) -> 3;
get_last_data({9125, "ios", 12}) -> 2;
get_last_data({15246, "ios", 12}) -> 2;
get_last_data({374, "ios", 13}) -> 2;
get_last_data({2599, "ios", 13}) -> 2;
get_last_data({6323, "ios", 13}) -> 3;
get_last_data({30138, "ios", 13}) -> 2;
get_last_data({32989, "ios", 13}) -> 3;
get_last_data({33201, "ios", 13}) -> 2;
get_last_data({401, "ios", 14}) -> 2;
get_last_data({1891, "ios", 14}) -> 4;
get_last_data({3786, "ios", 14}) -> 1;
get_last_data({18277, "ios", 14}) -> 2;
get_last_data({18688, "ios", 14}) -> 4;
get_last_data({23156, "ios", 14}) -> 1;
get_last_data({25260, "ios", 14}) -> 2;
get_last_data({30846, "ios", 14}) -> 5;
get_last_data({156, "ios", 15}) -> 3;
get_last_data({701, "ios", 15}) -> 2;
get_last_data({4261, "ios", 15}) -> 2;
get_last_data({5300, "ios", 15}) -> 5;
get_last_data({9778, "ios", 15}) -> 1;
get_last_data({12824, "ios", 15}) -> 3;
get_last_data({17857, "ios", 15}) -> 5;
get_last_data({19912, "ios", 15}) -> 2;
get_last_data({22842, "ios", 15}) -> 1;
get_last_data({23223, "ios", 15}) -> 3;
get_last_data({460, "ios", 16}) -> 3;
get_last_data({965, "ios", 16}) -> 4;
get_last_data({1142, "ios", 16}) -> 2;
get_last_data({1295, "ios", 16}) -> 2;
get_last_data({3849, "ios", 16}) -> 2;
get_last_data({8296, "ios", 16}) -> 2;
get_last_data({11208, "ios", 16}) -> 1;
get_last_data({908, "ios", 17}) -> 1;
get_last_data({25439, "ios", 18}) -> 1;
get_last_data({25791, "ios", 18}) -> 2;
get_last_data({1266, "ios", 19}) -> 2;
get_last_data({2425, "ios", 19}) -> 3;
get_last_data({1538, "ios", 2}) -> 2;
get_last_data({1849, "ios", 2}) -> 2;
get_last_data({2215, "ios", 2}) -> 3;
get_last_data({4328, "ios", 2}) -> 2;
get_last_data({4575, "ios", 2}) -> 1;
get_last_data({5108, "ios", 2}) -> 1;
get_last_data({8304, "ios", 2}) -> 2;
get_last_data({8473, "ios", 2}) -> 5;
get_last_data({14760, "ios", 2}) -> 3;
get_last_data({21439, "ios", 2}) -> 5;
get_last_data({22103, "ios", 2}) -> 1;
get_last_data({26638, "ios", 2}) -> 2;
get_last_data({139, "ios", 21}) -> 5;
get_last_data({1028, "ios", 21}) -> 1;
get_last_data({17415, "ios", 21}) -> 2;
get_last_data({9380, "ios", 22}) -> 2;
get_last_data({243, "ios", 23}) -> 2;
get_last_data({1743, "ios", 23}) -> 3;
get_last_data({4733, "ios", 23}) -> 2;
get_last_data({10484, "ios", 23}) -> 2;
get_last_data({12756, "ios", 23}) -> 5;
get_last_data({18542, "ios", 23}) -> 2;
get_last_data({877, "ios", 24}) -> 4;
get_last_data({3065, "ios", 24}) -> 2;
get_last_data({3348, "ios", 24}) -> 2;
get_last_data({16712, "ios", 24}) -> 3;
get_last_data({46, "ios", 25}) -> 1;
get_last_data({1341, "ios", 25}) -> 2;
get_last_data({1442, "ios", 25}) -> 5;
get_last_data({3214, "ios", 25}) -> 2;
get_last_data({3924, "ios", 25}) -> 5;
get_last_data({5613, "ios", 25}) -> 5;
get_last_data({6961, "ios", 25}) -> 2;
get_last_data({10376, "ios", 25}) -> 2;
get_last_data({14208, "ios", 25}) -> 3;
get_last_data({15138, "ios", 25}) -> 1;
get_last_data({16407, "ios", 25}) -> 2;
get_last_data({16640, "ios", 25}) -> 1;
get_last_data({17113, "ios", 25}) -> 2;
get_last_data({218, "ios", 26}) -> 2;
get_last_data({851, "ios", 26}) -> 1;
get_last_data({4505, "ios", 26}) -> 3;
get_last_data({5622, "ios", 26}) -> 2;
get_last_data({6814, "ios", 26}) -> 2;
get_last_data({8501, "ios", 26}) -> 3;
get_last_data({11008, "ios", 26}) -> 2;
get_last_data({11160, "ios", 26}) -> 5;
get_last_data({11302, "ios", 26}) -> 2;
get_last_data({14472, "ios", 26}) -> 2;
get_last_data({795, "ios", 27}) -> 2;
get_last_data({1293, "ios", 27}) -> 1;
get_last_data({1596, "ios", 27}) -> 2;
get_last_data({10912, "ios", 27}) -> 5;
get_last_data({11033, "ios", 27}) -> 5;
get_last_data({12984, "ios", 27}) -> 1;
get_last_data({13180, "ios", 27}) -> 1;
get_last_data({13598, "ios", 27}) -> 2;
get_last_data({16388, "ios", 27}) -> 2;
get_last_data({314, "ios", 28}) -> 4;
get_last_data({418, "ios", 28}) -> 1;
get_last_data({641, "ios", 28}) -> 2;
get_last_data({743, "ios", 28}) -> 1;
get_last_data({2265, "ios", 28}) -> 1;
get_last_data({3142, "ios", 28}) -> 3;
get_last_data({3611, "ios", 28}) -> 2;
get_last_data({5267, "ios", 28}) -> 2;
get_last_data({7171, "ios", 28}) -> 4;
get_last_data({7452, "ios", 28}) -> 1;
get_last_data({8120, "ios", 28}) -> 2;
get_last_data({16336, "ios", 28}) -> 3;
get_last_data({19423, "ios", 28}) -> 5;
get_last_data({142, "ios", 29}) -> 3;
get_last_data({4381, "ios", 29}) -> 4;
get_last_data({5533, "ios", 29}) -> 2;
get_last_data({11064, "ios", 29}) -> 1;
get_last_data({58, "ios", 3}) -> 2;
get_last_data({3883, "ios", 3}) -> 2;
get_last_data({4967, "ios", 3}) -> 2;
get_last_data({5948, "ios", 3}) -> 2;
get_last_data({15144, "ios", 3}) -> 2;
get_last_data({15544, "ios", 3}) -> 2;
get_last_data({35716, "ios", 3}) -> 2;
get_last_data({99, "ios", 30}) -> 1;
get_last_data({188, "ios", 30}) -> 2;
get_last_data({250, "ios", 30}) -> 5;
get_last_data({796, "ios", 30}) -> 2;
get_last_data({2107, "ios", 30}) -> 2;
get_last_data({7333, "ios", 30}) -> 1;
get_last_data({12608, "ios", 30}) -> 1;
get_last_data({13231, "ios", 30}) -> 2;
get_last_data({16194, "ios", 30}) -> 1;
get_last_data({270, "ios", 31}) -> 2;
get_last_data({536, "ios", 31}) -> 2;
get_last_data({1347, "ios", 31}) -> 5;
get_last_data({7600, "ios", 31}) -> 2;
get_last_data({7703, "ios", 31}) -> 2;
get_last_data({8519, "ios", 31}) -> 3;
get_last_data({8858, "ios", 31}) -> 2;
get_last_data({9330, "ios", 31}) -> 1;
get_last_data({11418, "ios", 31}) -> 3;
get_last_data({15178, "ios", 31}) -> 3;
get_last_data({15514, "ios", 31}) -> 2;
get_last_data({17314, "ios", 31}) -> 1;
get_last_data({17890, "ios", 31}) -> 2;
get_last_data({19842, "ios", 31}) -> 2;
get_last_data({20422, "ios", 31}) -> 5;
get_last_data({140, "ios", 32}) -> 3;
get_last_data({229, "ios", 32}) -> 2;
get_last_data({625, "ios", 32}) -> 3;
get_last_data({1908, "ios", 32}) -> 2;
get_last_data({2378, "ios", 32}) -> 2;
get_last_data({4203, "ios", 32}) -> 5;
get_last_data({7524, "ios", 32}) -> 4;
get_last_data({8931, "ios", 32}) -> 1;
get_last_data({9223, "ios", 32}) -> 3;
get_last_data({10265, "ios", 32}) -> 1;
get_last_data({13282, "ios", 32}) -> 1;
get_last_data({13303, "ios", 32}) -> 4;
get_last_data({18, "ios", 33}) -> 5;
get_last_data({252, "ios", 33}) -> 4;
get_last_data({361, "ios", 33}) -> 2;
get_last_data({580, "ios", 33}) -> 2;
get_last_data({744, "ios", 33}) -> 5;
get_last_data({1569, "ios", 33}) -> 1;
get_last_data({2088, "ios", 33}) -> 2;
get_last_data({2199, "ios", 33}) -> 1;
get_last_data({3329, "ios", 33}) -> 2;
get_last_data({6998, "ios", 33}) -> 2;
get_last_data({8138, "ios", 33}) -> 3;
get_last_data({13426, "ios", 33}) -> 2;
get_last_data({15012, "ios", 33}) -> 2;
get_last_data({174, "ios", 34}) -> 2;
get_last_data({495, "ios", 34}) -> 3;
get_last_data({573, "ios", 34}) -> 3;
get_last_data({1065, "ios", 34}) -> 2;
get_last_data({1495, "ios", 34}) -> 2;
get_last_data({1834, "ios", 34}) -> 2;
get_last_data({3526, "ios", 34}) -> 2;
get_last_data({5076, "ios", 34}) -> 2;
get_last_data({5202, "ios", 34}) -> 3;
get_last_data({6281, "ios", 34}) -> 3;
get_last_data({7799, "ios", 34}) -> 3;
get_last_data({9015, "ios", 34}) -> 1;
get_last_data({10442, "ios", 34}) -> 4;
get_last_data({16287, "ios", 34}) -> 1;
get_last_data({24959, "ios", 34}) -> 5;
get_last_data({46, "ios", 35}) -> 1;
get_last_data({494, "ios", 35}) -> 4;
get_last_data({1425, "ios", 35}) -> 5;
get_last_data({1699, "ios", 35}) -> 5;
get_last_data({2568, "ios", 35}) -> 5;
get_last_data({6426, "ios", 35}) -> 1;
get_last_data({3771, "ios", 36}) -> 1;
get_last_data({5034, "ios", 36}) -> 5;
get_last_data({23116, "ios", 36}) -> 5;
get_last_data({1777, "ios", 38}) -> 4;
get_last_data({93, "ios", 39}) -> 3;
get_last_data({335, "ios", 39}) -> 3;
get_last_data({721, "ios", 39}) -> 1;
get_last_data({1273, "ios", 39}) -> 2;
get_last_data({1727, "ios", 39}) -> 3;
get_last_data({2443, "ios", 39}) -> 4;
get_last_data({4383, "ios", 39}) -> 5;
get_last_data({4712, "ios", 39}) -> 3;
get_last_data({8391, "ios", 39}) -> 2;
get_last_data({8562, "ios", 39}) -> 3;
get_last_data({9896, "ios", 39}) -> 4;
get_last_data({11335, "ios", 39}) -> 2;
get_last_data({12130, "ios", 39}) -> 2;
get_last_data({12650, "ios", 39}) -> 2;
get_last_data({12908, "ios", 39}) -> 2;
get_last_data({14174, "ios", 39}) -> 2;
get_last_data({14279, "ios", 39}) -> 3;
get_last_data({17764, "ios", 39}) -> 5;
get_last_data({18562, "ios", 39}) -> 2;
get_last_data({22092, "ios", 39}) -> 2;
get_last_data({328, "ios", 4}) -> 2;
get_last_data({679, "ios", 4}) -> 4;
get_last_data({2381, "ios", 4}) -> 5;
get_last_data({3030, "ios", 4}) -> 2;
get_last_data({10074, "ios", 4}) -> 1;
get_last_data({17229, "ios", 4}) -> 1;
get_last_data({24309, "ios", 4}) -> 2;
get_last_data({24541, "ios", 4}) -> 4;
get_last_data({29343, "ios", 4}) -> 4;
get_last_data({216, "ios", 40}) -> 4;
get_last_data({299, "ios", 40}) -> 4;
get_last_data({536, "ios", 40}) -> 2;
get_last_data({640, "ios", 40}) -> 2;
get_last_data({851, "ios", 40}) -> 1;
get_last_data({1113, "ios", 40}) -> 5;
get_last_data({3462, "ios", 40}) -> 3;
get_last_data({3466, "ios", 40}) -> 2;
get_last_data({4939, "ios", 40}) -> 2;
get_last_data({5293, "ios", 40}) -> 1;
get_last_data({5774, "ios", 40}) -> 2;
get_last_data({8427, "ios", 40}) -> 5;
get_last_data({10381, "ios", 40}) -> 3;
get_last_data({12098, "ios", 40}) -> 5;
get_last_data({163, "ios", 41}) -> 2;
get_last_data({476, "ios", 41}) -> 1;
get_last_data({833, "ios", 41}) -> 1;
get_last_data({1633, "ios", 41}) -> 4;
get_last_data({2341, "ios", 41}) -> 2;
get_last_data({2731, "ios", 41}) -> 2;
get_last_data({4123, "ios", 41}) -> 1;
get_last_data({5058, "ios", 41}) -> 1;
get_last_data({6898, "ios", 41}) -> 1;
get_last_data({9400, "ios", 41}) -> 1;
get_last_data({9574, "ios", 41}) -> 2;
get_last_data({10254, "ios", 41}) -> 5;
get_last_data({10383, "ios", 41}) -> 4;
get_last_data({11015, "ios", 41}) -> 4;
get_last_data({11182, "ios", 41}) -> 5;
get_last_data({12898, "ios", 41}) -> 2;
get_last_data({13424, "ios", 41}) -> 2;
get_last_data({14532, "ios", 41}) -> 3;
get_last_data({16050, "ios", 41}) -> 5;
get_last_data({21240, "ios", 41}) -> 2;
get_last_data({98, "ios", 42}) -> 1;
get_last_data({141, "ios", 42}) -> 2;
get_last_data({146, "ios", 42}) -> 1;
get_last_data({234, "ios", 42}) -> 1;
get_last_data({240, "ios", 42}) -> 5;
get_last_data({288, "ios", 42}) -> 2;
get_last_data({701, "ios", 42}) -> 2;
get_last_data({1178, "ios", 42}) -> 2;
get_last_data({1492, "ios", 42}) -> 3;
get_last_data({2207, "ios", 42}) -> 3;
get_last_data({2353, "ios", 42}) -> 2;
get_last_data({2380, "ios", 42}) -> 2;
get_last_data({3090, "ios", 42}) -> 3;
get_last_data({3169, "ios", 42}) -> 1;
get_last_data({4067, "ios", 42}) -> 2;
get_last_data({4991, "ios", 42}) -> 4;
get_last_data({5542, "ios", 42}) -> 1;
get_last_data({7757, "ios", 42}) -> 2;
get_last_data({9069, "ios", 42}) -> 2;
get_last_data({13413, "ios", 42}) -> 3;
get_last_data({14256, "ios", 42}) -> 2;
get_last_data({14260, "ios", 42}) -> 1;
get_last_data({7, "ios", 43}) -> 4;
get_last_data({47, "ios", 43}) -> 5;
get_last_data({89, "ios", 43}) -> 5;
get_last_data({161, "ios", 43}) -> 2;
get_last_data({165, "ios", 43}) -> 1;
get_last_data({350, "ios", 43}) -> 2;
get_last_data({422, "ios", 43}) -> 3;
get_last_data({797, "ios", 43}) -> 5;
get_last_data({858, "ios", 43}) -> 1;
get_last_data({1131, "ios", 43}) -> 3;
get_last_data({1414, "ios", 43}) -> 1;
get_last_data({1579, "ios", 43}) -> 5;
get_last_data({1909, "ios", 43}) -> 2;
get_last_data({2104, "ios", 43}) -> 3;
get_last_data({2184, "ios", 43}) -> 2;
get_last_data({2790, "ios", 43}) -> 3;
get_last_data({2888, "ios", 43}) -> 5;
get_last_data({3561, "ios", 43}) -> 3;
get_last_data({4135, "ios", 43}) -> 5;
get_last_data({4142, "ios", 43}) -> 4;
get_last_data({4286, "ios", 43}) -> 1;
get_last_data({4388, "ios", 43}) -> 4;
get_last_data({6203, "ios", 43}) -> 2;
get_last_data({6254, "ios", 43}) -> 1;
get_last_data({7077, "ios", 43}) -> 1;
get_last_data({8878, "ios", 43}) -> 1;
get_last_data({10226, "ios", 43}) -> 1;
get_last_data({10613, "ios", 43}) -> 1;
get_last_data({13647, "ios", 43}) -> 3;
get_last_data({13739, "ios", 43}) -> 2;
get_last_data({14041, "ios", 43}) -> 5;
get_last_data({16496, "ios", 43}) -> 3;
get_last_data({19339, "ios", 43}) -> 5;
get_last_data({116, "ios", 44}) -> 4;
get_last_data({120, "ios", 44}) -> 2;
get_last_data({154, "ios", 44}) -> 2;
get_last_data({241, "ios", 44}) -> 1;
get_last_data({359, "ios", 44}) -> 3;
get_last_data({375, "ios", 44}) -> 3;
get_last_data({572, "ios", 44}) -> 1;
get_last_data({1361, "ios", 44}) -> 3;
get_last_data({2012, "ios", 44}) -> 5;
get_last_data({2434, "ios", 44}) -> 1;
get_last_data({2623, "ios", 44}) -> 1;
get_last_data({6105, "ios", 44}) -> 1;
get_last_data({8397, "ios", 44}) -> 3;
get_last_data({8741, "ios", 44}) -> 4;
get_last_data({8757, "ios", 44}) -> 2;
get_last_data({8775, "ios", 44}) -> 3;
get_last_data({10878, "ios", 44}) -> 1;
get_last_data({10980, "ios", 44}) -> 4;
get_last_data({11794, "ios", 44}) -> 2;
get_last_data({12174, "ios", 44}) -> 1;
get_last_data({12993, "ios", 44}) -> 1;
get_last_data({17257, "ios", 44}) -> 4;
get_last_data({17607, "ios", 44}) -> 1;
get_last_data({52, "ios", 45}) -> 2;
get_last_data({115, "ios", 45}) -> 3;
get_last_data({250, "ios", 45}) -> 4;
get_last_data({270, "ios", 45}) -> 3;
get_last_data({275, "ios", 45}) -> 1;
get_last_data({342, "ios", 45}) -> 1;
get_last_data({644, "ios", 45}) -> 1;
get_last_data({796, "ios", 45}) -> 5;
get_last_data({2059, "ios", 45}) -> 3;
get_last_data({3552, "ios", 45}) -> 3;
get_last_data({5523, "ios", 45}) -> 2;
get_last_data({6172, "ios", 45}) -> 4;
get_last_data({6770, "ios", 45}) -> 2;
get_last_data({7709, "ios", 45}) -> 2;
get_last_data({8529, "ios", 45}) -> 3;
get_last_data({8866, "ios", 45}) -> 3;
get_last_data({9874, "ios", 45}) -> 2;
get_last_data({9904, "ios", 45}) -> 4;
get_last_data({13390, "ios", 45}) -> 2;
get_last_data({37, "ios", 46}) -> 2;
get_last_data({92, "ios", 46}) -> 3;
get_last_data({189, "ios", 46}) -> 3;
get_last_data({340, "ios", 46}) -> 2;
get_last_data({449, "ios", 46}) -> 1;
get_last_data({609, "ios", 46}) -> 5;
get_last_data({1071, "ios", 46}) -> 1;
get_last_data({1298, "ios", 46}) -> 5;
get_last_data({1339, "ios", 46}) -> 2;
get_last_data({1405, "ios", 46}) -> 4;
get_last_data({1628, "ios", 46}) -> 4;
get_last_data({1673, "ios", 46}) -> 3;
get_last_data({2159, "ios", 46}) -> 3;
get_last_data({3877, "ios", 46}) -> 2;
get_last_data({6047, "ios", 46}) -> 5;
get_last_data({6422, "ios", 46}) -> 3;
get_last_data({6720, "ios", 46}) -> 1;
get_last_data({7367, "ios", 46}) -> 3;
get_last_data({9532, "ios", 46}) -> 3;
get_last_data({11380, "ios", 46}) -> 1;
get_last_data({13681, "ios", 46}) -> 3;
get_last_data({15068, "ios", 46}) -> 6;
get_last_data({13, "ios", 47}) -> 6;
get_last_data({45, "ios", 47}) -> 6;
get_last_data({81, "ios", 47}) -> 3;
get_last_data({129, "ios", 47}) -> 6;
get_last_data({209, "ios", 47}) -> 6;
get_last_data({212, "ios", 47}) -> 6;
get_last_data({221, "ios", 47}) -> 6;
get_last_data({313, "ios", 47}) -> 6;
get_last_data({335, "ios", 47}) -> 6;
get_last_data({523, "ios", 47}) -> 6;
get_last_data({569, "ios", 47}) -> 6;
get_last_data({784, "ios", 47}) -> 6;
get_last_data({837, "ios", 47}) -> 6;
get_last_data({872, "ios", 47}) -> 5;
get_last_data({899, "ios", 47}) -> 2;
get_last_data({963, "ios", 47}) -> 2;
get_last_data({995, "ios", 47}) -> 6;
get_last_data({1104, "ios", 47}) -> 3;
get_last_data({1138, "ios", 47}) -> 6;
get_last_data({1197, "ios", 47}) -> 6;
get_last_data({1386, "ios", 47}) -> 6;
get_last_data({1728, "ios", 47}) -> 2;
get_last_data({1760, "ios", 47}) -> 6;
get_last_data({2034, "ios", 47}) -> 4;
get_last_data({2046, "ios", 47}) -> 2;
get_last_data({2163, "ios", 47}) -> 6;
get_last_data({2311, "ios", 47}) -> 1;
get_last_data({2374, "ios", 47}) -> 6;
get_last_data({2452, "ios", 47}) -> 6;
get_last_data({2856, "ios", 47}) -> 6;
get_last_data({3105, "ios", 47}) -> 6;
get_last_data({3404, "ios", 47}) -> 2;
get_last_data({3465, "ios", 47}) -> 6;
get_last_data({3735, "ios", 47}) -> 6;
get_last_data({3814, "ios", 47}) -> 2;
get_last_data({4183, "ios", 47}) -> 6;
get_last_data({4431, "ios", 47}) -> 6;
get_last_data({4573, "ios", 47}) -> 1;
get_last_data({6025, "ios", 47}) -> 6;
get_last_data({6496, "ios", 47}) -> 6;
get_last_data({6613, "ios", 47}) -> 6;
get_last_data({7980, "ios", 47}) -> 6;
get_last_data({8202, "ios", 47}) -> 1;
get_last_data({9181, "ios", 47}) -> 3;
get_last_data({9956, "ios", 47}) -> 6;
get_last_data({9989, "ios", 47}) -> 6;
get_last_data({10150, "ios", 47}) -> 4;
get_last_data({10197, "ios", 47}) -> 1;
get_last_data({10350, "ios", 47}) -> 6;
get_last_data({11999, "ios", 47}) -> 6;
get_last_data({12470, "ios", 47}) -> 6;
get_last_data({13084, "ios", 47}) -> 1;
get_last_data({16739, "ios", 47}) -> 5;
get_last_data({17019, "ios", 47}) -> 6;
get_last_data({228, "ios", 48}) -> 6;
get_last_data({1285, "ios", 48}) -> 5;
get_last_data({1392, "ios", 48}) -> 1;
get_last_data({2025, "ios", 48}) -> 4;
get_last_data({3976, "ios", 48}) -> 6;
get_last_data({4212, "ios", 48}) -> 3;
get_last_data({7751, "ios", 48}) -> 5;
get_last_data({7776, "ios", 48}) -> 1;
get_last_data({102, "ios", 5}) -> 5;
get_last_data({169, "ios", 5}) -> 3;
get_last_data({248, "ios", 5}) -> 1;
get_last_data({826, "ios", 5}) -> 3;
get_last_data({2234, "ios", 5}) -> 3;
get_last_data({7351, "ios", 5}) -> 2;
get_last_data({9891, "ios", 5}) -> 4;
get_last_data({12257, "ios", 5}) -> 2;
get_last_data({21824, "ios", 5}) -> 2;
get_last_data({22802, "ios", 5}) -> 3;
get_last_data({17, "ios", 6}) -> 2;
get_last_data({193, "ios", 6}) -> 2;
get_last_data({481, "ios", 6}) -> 2;
get_last_data({1339, "ios", 6}) -> 1;
get_last_data({1590, "ios", 6}) -> 5;
get_last_data({1807, "ios", 6}) -> 3;
get_last_data({12478, "ios", 6}) -> 2;
get_last_data({15659, "ios", 6}) -> 2;
get_last_data({15736, "ios", 6}) -> 5;
get_last_data({20, "ios", 7}) -> 5;
get_last_data({457, "ios", 7}) -> 2;
get_last_data({606, "ios", 7}) -> 4;
get_last_data({872, "ios", 7}) -> 5;
get_last_data({4731, "ios", 7}) -> 2;
get_last_data({12113, "ios", 7}) -> 3;
get_last_data({13184, "ios", 7}) -> 5;
get_last_data({392, "ios", 8}) -> 2;
get_last_data({3618, "ios", 8}) -> 2;
get_last_data({4607, "ios", 8}) -> 4;
get_last_data({10952, "ios", 8}) -> 4;
get_last_data({469, "ios", 9}) -> 1;
get_last_data({1022, "ios", 9}) -> 5;
get_last_data({2691, "ios", 9}) -> 2;
get_last_data({4677, "ios", 9}) -> 1;
get_last_data({6272, "ios", 9}) -> 4;
get_last_data({9095, "ios", 9}) -> 2;
get_last_data({9586, "ios", 9}) -> 2;
get_last_data({1996, "mix", 1}) -> 4;
get_last_data({3503, "mix", 1}) -> 5;
get_last_data({12580, "mix", 1}) -> 3;
get_last_data({20536, "mix", 1}) -> 2;
get_last_data({37190, "mix", 1}) -> 2;
get_last_data({40410, "mix", 1}) -> 3;
get_last_data({112, "mix", 10}) -> 2;
get_last_data({6271, "mix", 10}) -> 2;
get_last_data({198, "mix", 11}) -> 5;
get_last_data({1061, "mix", 11}) -> 3;
get_last_data({18234, "mix", 11}) -> 2;
get_last_data({19006, "mix", 11}) -> 3;
get_last_data({19098, "mix", 11}) -> 2;
get_last_data({681, "mix", 12}) -> 2;
get_last_data({11549, "mix", 12}) -> 1;
get_last_data({13932, "mix", 12}) -> 3;
get_last_data({8320, "mix", 13}) -> 2;
get_last_data({16616, "mix", 13}) -> 4;
get_last_data({599, "mix", 14}) -> 5;
get_last_data({8342, "mix", 14}) -> 1;
get_last_data({10693, "mix", 14}) -> 4;
get_last_data({234, "mix", 15}) -> 1;
get_last_data({1852, "mix", 15}) -> 2;
get_last_data({2059, "mix", 15}) -> 3;
get_last_data({6046, "mix", 15}) -> 3;
get_last_data({18443, "mix", 15}) -> 3;
get_last_data({2354, "mix", 16}) -> 5;
get_last_data({4114, "mix", 16}) -> 2;
get_last_data({5920, "mix", 16}) -> 3;
get_last_data({7503, "mix", 16}) -> 3;
get_last_data({7620, "mix", 16}) -> 3;
get_last_data({175, "mix", 17}) -> 1;
get_last_data({6753, "mix", 17}) -> 1;
get_last_data({11239, "mix", 17}) -> 3;
get_last_data({853, "mix", 18}) -> 2;
get_last_data({2169, "mix", 18}) -> 1;
get_last_data({3122, "mix", 18}) -> 1;
get_last_data({26781, "mix", 19}) -> 4;
get_last_data({132, "mix", 2}) -> 1;
get_last_data({410, "mix", 2}) -> 5;
get_last_data({4533, "mix", 2}) -> 2;
get_last_data({5555, "mix", 2}) -> 3;
get_last_data({8244, "mix", 2}) -> 1;
get_last_data({12863, "mix", 2}) -> 2;
get_last_data({13524, "mix", 2}) -> 2;
get_last_data({318, "mix", 20}) -> 2;
get_last_data({2768, "mix", 20}) -> 5;
get_last_data({11439, "mix", 20}) -> 1;
get_last_data({1958, "mix", 21}) -> 2;
get_last_data({2938, "mix", 21}) -> 3;
get_last_data({17760, "mix", 21}) -> 3;
get_last_data({494, "mix", 22}) -> 5;
get_last_data({1966, "mix", 22}) -> 1;
get_last_data({7742, "mix", 22}) -> 1;
get_last_data({363, "mix", 23}) -> 2;
get_last_data({5852, "mix", 23}) -> 1;
get_last_data({10845, "mix", 24}) -> 2;
get_last_data({316, "mix", 26}) -> 2;
get_last_data({1083, "mix", 26}) -> 5;
get_last_data({6549, "mix", 26}) -> 3;
get_last_data({7350, "mix", 26}) -> 2;
get_last_data({425, "mix", 28}) -> 4;
get_last_data({273, "mix", 29}) -> 1;
get_last_data({3201, "mix", 29}) -> 2;
get_last_data({251, "mix", 3}) -> 4;
get_last_data({353, "mix", 3}) -> 2;
get_last_data({3726, "mix", 3}) -> 2;
get_last_data({127, "mix", 30}) -> 2;
get_last_data({287, "mix", 30}) -> 2;
get_last_data({353, "mix", 30}) -> 2;
get_last_data({4026, "mix", 30}) -> 1;
get_last_data({4182, "mix", 30}) -> 3;
get_last_data({3940, "mix", 31}) -> 1;
get_last_data({8536, "mix", 31}) -> 2;
get_last_data({12731, "mix", 31}) -> 3;
get_last_data({13724, "mix", 31}) -> 2;
get_last_data({14037, "mix", 31}) -> 1;
get_last_data({297, "mix", 32}) -> 1;
get_last_data({586, "mix", 32}) -> 2;
get_last_data({1450, "mix", 32}) -> 2;
get_last_data({1810, "mix", 32}) -> 3;
get_last_data({20636, "mix", 32}) -> 2;
get_last_data({464, "mix", 33}) -> 2;
get_last_data({757, "mix", 33}) -> 2;
get_last_data({126, "mix", 34}) -> 2;
get_last_data({10725, "mix", 34}) -> 3;
get_last_data({12588, "mix", 34}) -> 2;
get_last_data({25101, "mix", 34}) -> 5;
get_last_data({332, "mix", 35}) -> 3;
get_last_data({488, "mix", 35}) -> 3;
get_last_data({13886, "mix", 35}) -> 2;
get_last_data({471, "mix", 36}) -> 3;
get_last_data({2499, "mix", 36}) -> 1;
get_last_data({8846, "mix", 36}) -> 2;
get_last_data({20121, "mix", 36}) -> 2;
get_last_data({20124, "mix", 36}) -> 3;
get_last_data({1470, "mix", 37}) -> 2;
get_last_data({3934, "mix", 37}) -> 2;
get_last_data({11389, "mix", 37}) -> 3;
get_last_data({14734, "mix", 37}) -> 3;
get_last_data({16217, "mix", 37}) -> 2;
get_last_data({18375, "mix", 37}) -> 2;
get_last_data({18664, "mix", 37}) -> 2;
get_last_data({1006, "mix", 38}) -> 5;
get_last_data({2000, "mix", 38}) -> 1;
get_last_data({3190, "mix", 38}) -> 4;
get_last_data({14942, "mix", 38}) -> 5;
get_last_data({31, "mix", 39}) -> 2;
get_last_data({55, "mix", 39}) -> 3;
get_last_data({106, "mix", 39}) -> 1;
get_last_data({182, "mix", 39}) -> 4;
get_last_data({262, "mix", 39}) -> 5;
get_last_data({632, "mix", 39}) -> 2;
get_last_data({1141, "mix", 39}) -> 2;
get_last_data({1516, "mix", 39}) -> 2;
get_last_data({2614, "mix", 39}) -> 1;
get_last_data({10486, "mix", 39}) -> 3;
get_last_data({14142, "mix", 39}) -> 4;
get_last_data({18349, "mix", 39}) -> 1;
get_last_data({19281, "mix", 39}) -> 5;
get_last_data({19314, "mix", 39}) -> 1;
get_last_data({625, "mix", 4}) -> 5;
get_last_data({1649, "mix", 4}) -> 5;
get_last_data({2300, "mix", 4}) -> 2;
get_last_data({33015, "mix", 4}) -> 2;
get_last_data({17, "mix", 40}) -> 2;
get_last_data({191, "mix", 40}) -> 2;
get_last_data({618, "mix", 40}) -> 5;
get_last_data({708, "mix", 40}) -> 5;
get_last_data({1174, "mix", 40}) -> 3;
get_last_data({1479, "mix", 40}) -> 1;
get_last_data({1564, "mix", 40}) -> 2;
get_last_data({4022, "mix", 40}) -> 4;
get_last_data({5841, "mix", 40}) -> 1;
get_last_data({6311, "mix", 40}) -> 1;
get_last_data({7555, "mix", 40}) -> 4;
get_last_data({9098, "mix", 40}) -> 5;
get_last_data({11941, "mix", 40}) -> 3;
get_last_data({13175, "mix", 40}) -> 2;
get_last_data({13734, "mix", 40}) -> 1;
get_last_data({14126, "mix", 40}) -> 1;
get_last_data({256, "mix", 41}) -> 3;
get_last_data({343, "mix", 41}) -> 3;
get_last_data({491, "mix", 41}) -> 2;
get_last_data({2365, "mix", 41}) -> 1;
get_last_data({5379, "mix", 41}) -> 2;
get_last_data({5432, "mix", 41}) -> 1;
get_last_data({6267, "mix", 41}) -> 2;
get_last_data({7785, "mix", 41}) -> 1;
get_last_data({7921, "mix", 41}) -> 3;
get_last_data({11719, "mix", 41}) -> 2;
get_last_data({13583, "mix", 41}) -> 3;
get_last_data({13721, "mix", 41}) -> 2;
get_last_data({15774, "mix", 41}) -> 2;
get_last_data({22487, "mix", 41}) -> 5;
get_last_data({88, "mix", 42}) -> 4;
get_last_data({756, "mix", 42}) -> 4;
get_last_data({1048, "mix", 42}) -> 2;
get_last_data({3211, "mix", 42}) -> 2;
get_last_data({6250, "mix", 42}) -> 2;
get_last_data({6501, "mix", 42}) -> 2;
get_last_data({12442, "mix", 42}) -> 5;
get_last_data({15534, "mix", 42}) -> 2;
get_last_data({119, "mix", 43}) -> 4;
get_last_data({436, "mix", 43}) -> 5;
get_last_data({493, "mix", 43}) -> 2;
get_last_data({1090, "mix", 43}) -> 2;
get_last_data({1096, "mix", 43}) -> 3;
get_last_data({1744, "mix", 43}) -> 4;
get_last_data({1748, "mix", 43}) -> 3;
get_last_data({8853, "mix", 43}) -> 3;
get_last_data({16547, "mix", 43}) -> 4;
get_last_data({158, "mix", 44}) -> 2;
get_last_data({256, "mix", 44}) -> 4;
get_last_data({316, "mix", 44}) -> 4;
get_last_data({837, "mix", 44}) -> 2;
get_last_data({1683, "mix", 44}) -> 2;
get_last_data({4732, "mix", 44}) -> 1;
get_last_data({5524, "mix", 44}) -> 2;
get_last_data({8422, "mix", 44}) -> 3;
get_last_data({9451, "mix", 44}) -> 1;
get_last_data({19209, "mix", 44}) -> 2;
get_last_data({18, "mix", 45}) -> 4;
get_last_data({142, "mix", 45}) -> 1;
get_last_data({1247, "mix", 45}) -> 3;
get_last_data({3378, "mix", 45}) -> 2;
get_last_data({5474, "mix", 45}) -> 1;
get_last_data({11719, "mix", 45}) -> 1;
get_last_data({12742, "mix", 45}) -> 4;
get_last_data({18054, "mix", 45}) -> 3;
get_last_data({303, "mix", 46}) -> 1;
get_last_data({394, "mix", 46}) -> 5;
get_last_data({699, "mix", 46}) -> 4;
get_last_data({834, "mix", 46}) -> 2;
get_last_data({2615, "mix", 46}) -> 2;
get_last_data({3186, "mix", 46}) -> 5;
get_last_data({6419, "mix", 46}) -> 2;
get_last_data({8014, "mix", 46}) -> 1;
get_last_data({13559, "mix", 46}) -> 4;
get_last_data({112, "mix", 47}) -> 2;
get_last_data({353, "mix", 47}) -> 2;
get_last_data({372, "mix", 47}) -> 2;
get_last_data({455, "mix", 47}) -> 1;
get_last_data({581, "mix", 47}) -> 2;
get_last_data({614, "mix", 47}) -> 2;
get_last_data({820, "mix", 47}) -> 1;
get_last_data({909, "mix", 47}) -> 2;
get_last_data({1166, "mix", 47}) -> 3;
get_last_data({3655, "mix", 47}) -> 3;
get_last_data({3921, "mix", 47}) -> 3;
get_last_data({5163, "mix", 47}) -> 4;
get_last_data({7339, "mix", 47}) -> 5;
get_last_data({10528, "mix", 47}) -> 3;
get_last_data({12758, "mix", 47}) -> 5;
get_last_data({70, "mix", 48}) -> 6;
get_last_data({164, "mix", 48}) -> 5;
get_last_data({207, "mix", 48}) -> 6;
get_last_data({329, "mix", 48}) -> 6;
get_last_data({465, "mix", 48}) -> 4;
get_last_data({615, "mix", 48}) -> 6;
get_last_data({769, "mix", 48}) -> 3;
get_last_data({873, "mix", 48}) -> 6;
get_last_data({1038, "mix", 48}) -> 3;
get_last_data({1182, "mix", 48}) -> 6;
get_last_data({1217, "mix", 48}) -> 6;
get_last_data({1653, "mix", 48}) -> 6;
get_last_data({1817, "mix", 48}) -> 6;
get_last_data({1862, "mix", 48}) -> 3;
get_last_data({1921, "mix", 48}) -> 6;
get_last_data({2656, "mix", 48}) -> 2;
get_last_data({2885, "mix", 48}) -> 6;
get_last_data({2931, "mix", 48}) -> 6;
get_last_data({3389, "mix", 48}) -> 6;
get_last_data({3822, "mix", 48}) -> 6;
get_last_data({4063, "mix", 48}) -> 6;
get_last_data({4792, "mix", 48}) -> 3;
get_last_data({5458, "mix", 48}) -> 6;
get_last_data({5627, "mix", 48}) -> 6;
get_last_data({6319, "mix", 48}) -> 4;
get_last_data({6476, "mix", 48}) -> 3;
get_last_data({10202, "mix", 48}) -> 2;
get_last_data({10494, "mix", 48}) -> 5;
get_last_data({10542, "mix", 48}) -> 6;
get_last_data({10826, "mix", 48}) -> 6;
get_last_data({11516, "mix", 48}) -> 2;
get_last_data({12219, "mix", 48}) -> 6;
get_last_data({12435, "mix", 48}) -> 1;
get_last_data({15454, "mix", 48}) -> 6;
get_last_data({16609, "mix", 48}) -> 6;
get_last_data({632, "mix", 49}) -> 1;
get_last_data({905, "mix", 49}) -> 4;
get_last_data({5290, "mix", 49}) -> 1;
get_last_data({3983, "mix", 5}) -> 2;
get_last_data({21073, "mix", 5}) -> 3;
get_last_data({23241, "mix", 5}) -> 4;
get_last_data({30813, "mix", 5}) -> 1;
get_last_data({32435, "mix", 5}) -> 3;
get_last_data({42868, "mix", 5}) -> 1;
get_last_data({431, "mix", 6}) -> 5;
get_last_data({564, "mix", 6}) -> 2;
get_last_data({708, "mix", 6}) -> 4;
get_last_data({908, "mix", 6}) -> 2;
get_last_data({1281, "mix", 6}) -> 2;
get_last_data({2377, "mix", 6}) -> 4;
get_last_data({12888, "mix", 6}) -> 2;
get_last_data({1358, "mix", 7}) -> 2;
get_last_data({410, "mix", 8}) -> 4;
get_last_data({478, "mix", 8}) -> 1;
get_last_data({727, "mix", 8}) -> 1;
get_last_data({4982, "mix", 8}) -> 2;
get_last_data({9922, "mix", 8}) -> 5;
get_last_data({388, "mix", 9}) -> 2;
get_last_data({12884, "ios", 14}) -> 2;
get_last_data({42866, "mix", 5}) -> 6;
get_last_data({9478, "ios", 37}) -> 2;
get_last_data({2264, "beta", 47}) -> 4;
get_last_data({1429, "mix", 188}) -> 7;
get_last_data(_) -> false.

