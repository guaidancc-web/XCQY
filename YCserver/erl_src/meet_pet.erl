-file("src/mod/meet_pet/meet_pet.erl", 1).

-module(meet_pet).

-behaviour(gen_fsm).

-export([start_link/0,
         switch/1,
         sign/1,
         sync_sign/2,
         accept/1,
         exit_meet_pet/1,
         sync_accept/3,
         progress/3,
         commit/1,
         sync_commit/1,
         kill/2,
         get_phase/1,
         get_self_status/1,
         apply_exit_meet_pet/2,
         change_transform/1,
         leave_team/2,
         login/1,
         logout/1,
         team_member_update/1,
         pet_list/1,
         join_to_follow/1,
         recruit_lev/3,
         join_recruitment_team/3,
         stop_recruit_msg/1,
         get_camp/1]).

-export([state_name/3,
         idle/2,
         notice/2,
         beginning/2,
         exit/2]).

-export([init/1,
         handle_event/3,
         handle_sync_event/4,
         handle_info/3,
         terminate/3,
         code_change/4]).

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

-file("src/mod/meet_pet/meet_pet.erl", 61).

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

-file("src/mod/meet_pet/meet_pet.erl", 62).

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

-file("src/mod/meet_pet/meet_pet.erl", 63).

-file("inc/looks.hrl", 1).

-file("src/mod/meet_pet/meet_pet.erl", 64).

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

-file("src/mod/meet_pet/meet_pet.erl", 65).

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

-file("src/mod/meet_pet/meet_pet.erl", 66).

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

-file("src/mod/meet_pet/meet_pet.erl", 67).

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

-file("src/mod/meet_pet/meet_pet.erl", 68).

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

-file("src/mod/meet_pet/meet_pet.erl", 69).

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

-file("src/mod/meet_pet/meet_pet.erl", 70).

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

-file("src/mod/meet_pet/meet_pet.erl", 71).

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

-file("src/mod/meet_pet/meet_pet.erl", 72).

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

-file("src/mod/meet_pet/meet_pet.erl", 73).

-file("inc/meet_pet.hrl", 1).

-record(meet_pet_camp,
        {ver = 1,
         rid,
         camp_id = 0,
         camp_val = 0,
         status = 1,
         round = 0,
         day_round = 0,
         camp_list = [],
         pet_base_id = 0,
         ext = #{rand_pos => undefined, triggers => []}}).

-record(meet_pet_camp_data,
        {camp_id = 0,
         round = 0,
         weight = 0,
         unit_base_id = 0,
         battle_id = 0,
         map_base_id = 0}).

-record(meet_pet,
        {switch = close,
         ts,
         timeout,
         phase = idle,
         pet_ids = [],
         battle_ids = [],
         ext =
             #{pet_queue => queue:new(), notice_ref => undefined}}).

-record(meet_pet_item_reward,
        {base_id = 0,
         classes = 0,
         weight = 0,
         num = 0,
         is_notice = 0}).

-file("src/mod/meet_pet/meet_pet.erl", 74).

-compile({inline, [{phase_enum, 1}]}).

-export([m/0, gm_clean_meet_pet/1]).

-spec m() -> ok.

m() -> gen_fsm:send_event(meet_pet, timeout).

gm_clean_meet_pet(Role = #role{id = Id}) ->
    catch ets:delete(meet_pet, Id),
    exit_meet_pet(Role).

switch(close) ->
    gen_fsm:send_all_state_event(meet_pet, {switch, close});
switch(open) ->
    gen_fsm:send_all_state_event(meet_pet, {switch, open});
switch(_) -> ok.

login(_Role) -> ok.

logout(_Role) -> ok.

-spec sign(Role :: #role{}) -> {ok,
                                pos_integer(),
                                #role{}} |
                               {ok, pos_integer(), string(), #role{}} |
                               {false, string()}.

sign(#role{s_event = 19}) ->
    {false, lang:get("当前已参加宠物祝福活动")};
sign(Role = #role{s_event = 0, id = SelfId}) ->
    case check_team_sign(Role) of
        {ok, single_sign} ->
            case case catch
                          gen_fsm:sync_send_all_state_event(meet_pet,
                                                            {sign, SelfId})
                     of
                     {'EXIT', {timeout, _}} -> {error, timeout};
                     {'EXIT', {noproc, _}} -> {error, noproc};
                     {'EXIT', {normal, _}} -> {error, exit};
                     {'EXIT', _Call_Err} -> {error, _Call_Err};
                     _Call_Return -> _Call_Return
                 end
                of
                {ok, PetBaseId} ->
                    case sign(PetBaseId, Role, sign) of
                        {ok, NewRole} -> {ok, PetBaseId, NewRole};
                        Rtn -> Rtn
                    end;
                {false, Msg} -> {false, Msg};
                _False ->
                    logger:debug("[~ts]无法参加宠物祝福活动~w",
                                 [Role#role.name, _False],
                                 meet_pet,
                                 174),
                    {false, lang:get("无法参加宠物祝福活动")}
            end;
        {ok, team_sign, #team_mate{pid = MatePid}} ->
            case case catch
                          gen_fsm:sync_send_all_state_event(meet_pet,
                                                            {sign, SelfId})
                     of
                     {'EXIT', {timeout, _}} -> {error, timeout};
                     {'EXIT', {noproc, _}} -> {error, noproc};
                     {'EXIT', {normal, _}} -> {error, exit};
                     {'EXIT', _Call_Err} -> {error, _Call_Err};
                     _Call_Return -> _Call_Return
                 end
                of
                {ok, PetBaseId} when is_pid(MatePid) ->
                    case sign(PetBaseId, Role, sign) of
                        {ok, NewRole} ->
                            Fmt = lang:get("亲密度≥~ts，宠物祝福报名成功"),
                            Msg = notice:format(Fmt, [{string_1, 100}]),
                            role:apply(async,
                                       MatePid,
                                       {meet_pet, sync_sign, [PetBaseId]}),
                            {ok, PetBaseId, Msg, NewRole};
                        Rtn -> Rtn
                    end;
                {false, Msg} -> {false, Msg};
                _False ->
                    logger:debug("[~ts]无法参加宠物祝福活动~w",
                                 [Role#role.name, _False],
                                 meet_pet,
                                 190),
                    {false, lang:get("无法参加宠物祝福活动")}
            end;
        {false, Msg} -> {false, Msg};
        _False ->
            logger:debug("[~ts]无法参加宠物祝福活动~w",
                         [Role#role.name, _False],
                         meet_pet,
                         195),
            {false, lang:get("当前无法参加宠物祝福活动")}
    end;
sign(_Role) -> {false, lang:get("当前无法参加宠物祝福活动")}.

-spec sign(PetBaseId, Role, Action) -> {ok, NewRole} |
                                       {false, Msg} when PetBaseId ::
                                                             pos_integer(),
                                                         Role :: #role{},
                                                         NewRole :: #role{},
                                                         Action :: login | sign,
                                                         Msg :: string().

sign(PetBaseId, Role, Action) ->
    case meet_pet_data:look_id(PetBaseId) of
        LookId when is_integer(LookId) ->
            case buff:add(Role, LookId) of
                {ok, BuffRole} ->
                    LookRole = case Action of
                                   login -> BuffRole;
                                   _ ->
                                       CalcLookRole = looks:calc(BuffRole),
                                       looks:update_looks(Role, CalcLookRole),
                                       CalcLookRole
                               end,
                    {ok, FlyRole} = case role_fly:landing(LookRole) of
                                        {ok, TmpFlyRole} -> {ok, TmpFlyRole};
                                        _ -> {ok, LookRole}
                                    end,
                    NewRole = FlyRole#role{s_event = 19},
                    {ok, NewRole};
                {false, Msg} -> {false, Msg};
                _ -> {false, lang:get("变身失败，无法参加活动")}
            end;
        _ ->
            logger:error("[~ts]没有对应外观[PetBaseId:~w]",
                         [Role#role.name, PetBaseId],
                         meet_pet,
                         228),
            {false, lang:get("变身失败，无法参与活动")}
    end.

sync_sign(Role = #role{s_event = 0, id = SelfId},
          PetBaseId) ->
    case case catch
                  gen_fsm:sync_send_all_state_event(meet_pet,
                                                    {sign, SelfId, PetBaseId})
             of
             {'EXIT', {timeout, _}} -> {error, timeout};
             {'EXIT', {noproc, _}} -> {error, noproc};
             {'EXIT', {normal, _}} -> {error, exit};
             {'EXIT', _Call_Err} -> {error, _Call_Err};
             _Call_Return -> _Call_Return
         end
        of
        ok ->
            case sign(PetBaseId, Role, sign) of
                {ok, NewRole} ->
                    Fmt = lang:get("亲密度≥~ts，宠物祝福报名成功"),
                    Msg = notice:format(Fmt, [{string_1, 100}]),
                    role:link_send(NewRole, 15602, {1, Msg, PetBaseId}),
                    {ok, NewRole};
                _ -> ok
            end;
        _ -> ok
    end;
sync_sign(_Role, _PetBaseId) -> ok.

check_team_sign(Role = #role{m_team =
                                 #m_team{member_num = MemNum,
                                         status = TeamStatus}}) ->
    case team:is_leader(Role) of
        true ->
            case MemNum =:= 1 of
                true -> {ok, single_sign};
                false ->
                    case team:get_members(Role) of
                        [] -> {ok, single_sign};
                        [Mate = #team_mate{status = 2}] ->
                            check_teammate_sign(Mate, Role);
                        [#team_mate{}] ->
                            {false, lang:get("快让你的伙伴归队吧{face_1,7}")};
                        _ -> {false, lang:get("请退出队伍后再报名")}
                    end
            end;
        _ ->
            case team:is_team(Role) of
                true ->
                    case TeamStatus of
                        2 -> {false, lang:get("跟随状态不能参加活动")};
                        _ -> {false, lang:get("请退出队伍后再报名")}
                    end;
                _ -> {ok, single_sign}
            end
    end.

check_teammate_sign(Mate = #team_mate{id = MateId},
                    #role{id = SelfId}) ->
    case friend:is_friend(SelfId, MateId) of
        true ->
            IntimacyVal = friend:get_intimacy(SelfId, MateId),
            case IntimacyVal >= 100 of
                true ->
                    case lookup(meet_pet, MateId) of
                        [] -> {ok, team_sign, Mate};
                        [_] -> {ok, single_sign};
                        _ -> {false, lang:get("队友无法报名宠物祝福活动")}
                    end;
                false -> {false, lang:get("请退出队伍后再报名")}
            end;
        _ -> {false, lang:get("请退出队伍后再报名")}
    end.

exit_meet_pet(Role = #role{s_event = 19,
                           id = SelfId}) ->
    case lookup(meet_pet, SelfId) of
        [Camp = #meet_pet_camp{pet_base_id = PetBaseId}] ->
            case exit_meet_pet(Role, Camp) of
                {ok, NewRole} ->
                    gen_fsm:send_all_state_event(meet_pet,
                                                 {exit_meet_pet, PetBaseId}),
                    {ok, NewRole};
                Rtn -> Rtn
            end;
        _ -> {false, lang:get("未参与活动，无需退出")}
    end;
exit_meet_pet(_Role) -> {false, lang:get("未参与活动，无需退出")}.

exit_meet_pet(Role,
              Camp = #meet_pet_camp{pet_base_id = PetBaseId}) ->
    case meet_pet_data:look_id(PetBaseId) of
        LookId when is_integer(LookId) ->
            {ok, DelRole} = buff:del(Role, [LookId]),
            {ok, NewCamp, RemoveRole} = clean_camp(DelRole, Camp),
            save(meet_pet, NewCamp),
            NewRole = RemoveRole#role{s_event = 0},
            {ok, NewRole};
        _ ->
            logger:error("[~ts]没有对应外观[PetId:~w]",
                         [Role#role.name, PetBaseId],
                         meet_pet,
                         319),
            {false, lang:get("未参与活动，无需退出")}
    end.

apply_exit_meet_pet(Role = #role{s_event = 19}, Camp) ->
    case exit_meet_pet(Role, Camp) of
        {ok, NewRole} -> {ok, NewRole};
        _ -> ok
    end;
apply_exit_meet_pet(_Role, _Camp) -> ok.

get_phase(#role{pid = Pid}) ->
    gen_fsm:send_all_state_event(meet_pet,
                                 {get_phase, Pid}),
    ok.

pet_list(#role{pid = Pid}) ->
    gen_fsm:send_all_state_event(meet_pet, {pet_list, Pid}),
    ok.

change_transform(Role = #role{s_event = 19,
                              id = SelfId}) ->
    case role_gain:do_notice([#loss{label = coin,
                                    val = 500000}],
                             Role)
        of
        {ok, LossRole} ->
            case case catch
                          gen_fsm:sync_send_all_state_event(meet_pet,
                                                            {change_transform,
                                                             SelfId})
                     of
                     {'EXIT', {timeout, _}} -> {error, timeout};
                     {'EXIT', {noproc, _}} -> {error, noproc};
                     {'EXIT', {normal, _}} -> {error, exit};
                     {'EXIT', _Call_Err} -> {error, _Call_Err};
                     _Call_Return -> _Call_Return
                 end
                of
                {ok, PetBaseId} ->
                    case meet_pet_data:look_id(PetBaseId) of
                        LookId when is_integer(LookId) ->
                            case buff:add(LossRole, LookId) of
                                {ok, BuffRole} ->
                                    LookRole = looks:calc(BuffRole),
                                    looks:update_looks(Role, LookRole),
                                    NewRole = LookRole,
                                    {ok, PetBaseId, NewRole};
                                {false, Msg} -> {false, Msg};
                                _ -> {false, lang:get("变身失败")}
                            end;
                        _ ->
                            logger:error("[~ts]没有对应外观[PetBaseId:~w]",
                                         [Role#role.name, PetBaseId],
                                         meet_pet,
                                         359),
                            {false, lang:get("变身失败，无法参与活动")}
                    end;
                {false, Msg} -> {false, Msg};
                _ -> {false, lang:get("变身失败")}
            end;
        {false, _} ->
            Msg = notice:format(lang:get("~ts不足，无法变身"),
                                [{assets_2, 90000}]),
            {false, Msg};
        _ -> {false, lang:get("变身失败")}
    end;
change_transform(_Role) ->
    {false, lang:get("当前未参加宠物祝福活动，无法改变宠物外观")}.

team_member_update(Role = #role{s_event = 19,
                                m_team = #m_team{member_num = Num},
                                id = SelfId})
    when Num < 2 ->
    case lookup(meet_pet, SelfId) of
        [Camp = #meet_pet_camp{status = Status}]
            when Status =:= 1 orelse Status =:= 2 ->
            {ok, NewCamp, NewRole} = clean_camp(Role, Camp),
            save(meet_pet, NewCamp),
            notice:send(NewRole,
                        3,
                        lang:get("由于队伍不足2人，宠物祝福任务进度已清空")),
            case get_self_status(Role, NewCamp) of
                {ok, Reply} -> role:link_send(NewRole, 15605, Reply);
                _ -> skip
            end,
            NewRole;
        _ -> Role
    end;
team_member_update(Role) -> Role.

get_self_status(Role = #role{id = SelfId,
                             s_event = Event}) ->
    case lookup(meet_pet, SelfId) of
        [Camp = #meet_pet_camp{}] ->
            get_self_status(Role, Camp);
        _ when Event =/= 19 -> {ok, {1, 0}};
        _ -> false
    end.

get_self_status(#role{s_event = Event},
                #meet_pet_camp{status = Status, pet_base_id = PetBaseId,
                               round = Round}) ->
    case Status of
        2 -> false;
        Status
            when Event =:= 19 andalso
                     Status =:= 1 andalso Round > 0 ->
            {ok, {4, PetBaseId}};
        Status when Event =:= 19 andalso Status =:= 1 ->
            {ok, {2, PetBaseId}};
        Status when Event =:= 19 andalso Status =:= 3 ->
            {ok, {3, PetBaseId}};
        _ -> false
    end.

kill(Role, #plot_unit{base_id = BaseId, id = Id}) ->
    case check_kill_cond(Role) of
        {true, Fighters} ->
            case unit_convert:to(unit, BaseId) of
                {ok, Unit} ->
                    NewUnit = Unit#unit{id = {0, Id}},
                    notice:send(Role, 1, lang:get("宠物祝福活动中，守护不能出战")),
                    combat_mgr:start_combat(29, Fighters, NewUnit),
                    Role;
                _False ->
                    logger:debug("[~ts]发起战斗失败:~w",
                                 [Role#role.name, _False],
                                 meet_pet,
                                 430),
                    {false, lang:get("发起战斗失败")}
            end;
        {false, Msg} -> {false, Msg};
        _ -> {false, lang:get("无法发起战斗")}
    end.

check_kill_cond(Role = #role{id = SelfId}) ->
    case team:is_leader(Role) of
        true ->
            case lookup(meet_pet, SelfId) of
                [#meet_pet_camp{pet_base_id = PetBaseId,
                                camp_id = CampId}] ->
                    case team:get_fighters(Role) of
                        {ok,
                         Fighters = [_, #team_mate{status = 2, id = MateId}]} ->
                            case lookup(meet_pet, MateId) of
                                [#meet_pet_camp{camp_id = CampId,
                                                pet_base_id = PetBaseId}] ->
                                    {true, Fighters};
                                _False -> {false, lang:get("发起战斗失败")}
                            end;
                        {false, Msg} -> {false, Msg};
                        _False ->
                            logger:debug("[~ts]发起战斗失败:~w",
                                         [Role#role.name, _False],
                                         meet_pet,
                                         453),
                            {false, lang:get("宠物祝福需2人组队完成，请队员归队")}
                    end;
                _False ->
                    logger:debug("[~ts]发起战斗失败:~w",
                                 [Role#role.name, _False],
                                 meet_pet,
                                 457),
                    {false, lang:get("发起战斗失败")}
            end;
        _ -> {false, lang:get("只有队长才能发起战斗")}
    end.

accept(Role = #role{s_event = 19, id = SelfId}) ->
    case lookup(meet_pet, SelfId) of
        [Camp = #meet_pet_camp{camp_id = 0}] ->
            accept_next(Camp, Role);
        [_] -> {false, lang:get("您已领取宠物祝福任务")};
        _ -> {false, lang:get("请先报名再领取任务")}
    end;
accept(_Role) -> {false, lang:get("请先报名再领取任务")}.

accept_next(Camp = #meet_pet_camp{status = 1,
                                  round = Round},
            Role) ->
    case check_teammate_accept_cond(Camp, Role) of
        {true, #team_mate{pid = MatePid}, _MateCamp} ->
            NextRound = Round + 1,
            logger:debug("[~ts]接受下一个任务NextRound:~w",
                         [Role#role.name, NextRound],
                         meet_pet,
                         485),
            CampList = meet_pet_data:camp_list(NextRound),
            case util:rand_list(CampList, 2) of
                Data = #meet_pet_camp_data{map_base_id = MapBaseId} ->
                    RandPos = map:rand_pos2(MapBaseId),
                    MFA = {meet_pet, sync_accept, [Data, RandPos]},
                    case role:apply(sync, MatePid, MFA) of
                        ok -> accept_camp(Data, Camp, RandPos, Role);
                        {false, Msg} -> {false, Msg};
                        _ -> {false, lang:get("两人变身一致才能接取情缘任务哟{face_1,21}")}
                    end;
                _False ->
                    logger:error("[~ts]无法领取下一个任务:~w",
                                 [Role#role.name, _False],
                                 meet_pet,
                                 498),
                    {false, lang:get("没有可以领取的任务")}
            end;
        False -> False
    end;
accept_next(#meet_pet_camp{status = 3}, _Role) ->
    {false, lang:get("您已完成今日的宠物祝福活动，请明天再来参加")};
accept_next(#meet_pet_camp{status = 2}, _Role) ->
    {false, lang:get("今日的宠物祝福活动已结束，请明日再来参加")};
accept_next(_Camp, _Role) -> false.

accept_camp(Data = #meet_pet_camp_data{camp_id = CampId,
                                       round = NextRound},
            Camp, RandPos, Role) ->
    {ok, DelCamp = #meet_pet_camp{ext = Ext}, RemoveRole} =
        del_camp(Role, Camp),
    RandPosExt = Ext#{rand_pos => RandPos},
    case create_plot_unit(RemoveRole, Data, RandPos) of
        {ok, PlotRole} ->
            Args = [CampId],
            Tri = #trigger{label = evt_kill_npc, m = meet_pet,
                           f = progress, a = Args},
            TeamTri = #trigger{label = evt_team_leave, m = meet_pet,
                               f = leave_team, a = []},
            {TriIds, TriRole} = role_trigger:add([Tri, TeamTri],
                                                 PlotRole),
            NewExt = RandPosExt#{triggers => TriIds},
            NewCamp = DelCamp#meet_pet_camp{camp_id = CampId,
                                            ext = NewExt, round = NextRound},
            NewRole = TriRole,
            role:link_send(NewRole, 15608, {NextRound, CampId, 0}),
            save(meet_pet, NewCamp),
            logger:debug("[~ts]接受任务CampId:~w, Round:~w",
                         [Role#role.name,
                          NewCamp#meet_pet_camp.camp_id,
                          NewCamp#meet_pet_camp.round],
                         meet_pet,
                         529),
            {ok, NewRole};
        _ -> {false, lang:get("创建单位失败")}
    end.

sync_accept(Role = #role{id = SelfId, name = Name},
            Data, RandPos) ->
    case lookup(meet_pet, SelfId) of
        [Camp] ->
            case accept_camp(Data, Camp, RandPos, Role) of
                {ok, NewRole} -> {ok, ok, NewRole};
                {false, Msg} -> {ok, {false, Msg}};
                _ ->
                    Msg = notice:format(lang:get("~ts无法创建单位"),
                                        [{role_2, Name}]),
                    {ok, {false, Msg}}
            end;
        _ ->
            Msg = notice:format(lang:get("~ts无法领取任务"),
                                [{role_2, Name}]),
            {ok, {false, Msg}}
    end.

progress(#evt_kill_npc{origin_id = {0, Id},
                       base_id = BaseId},
         Role = #role{id = SelfId, s_event = 19}, CampId) ->
    case meet_pet_data:camp(CampId) of
        #meet_pet_camp_data{battle_id = Id,
                            unit_base_id = BaseId} ->
            case lookup(meet_pet, SelfId) of
                [Camp = #meet_pet_camp{ext = Ext}] ->
                    RemoveRole = plot_quest:remove_plot_unit(Id, Role),
                    Triggers = maps:get(triggers, Ext, []),
                    DelRole = role_trigger:del(Triggers, RemoveRole),
                    RewardRole = camp_reward(Camp, BaseId, DelRole),
                    NewCamp = update_progress_camp(Camp, RewardRole),
                    case check_next_accept(NewCamp, RewardRole) of
                        {ok, NewRole} ->
                            logger:debug("[~ts]当前环数:~w, 已完成环数~w",
                                         [Role#role.name,
                                          NewCamp#meet_pet_camp.round,
                                          NewCamp#meet_pet_camp.day_round],
                                         meet_pet,
                                         579),
                            {remove, NewRole};
                        _ ->
                            save(meet_pet, NewCamp),
                            logger:debug("[~ts]保存当前环数:~w, 已完成环数~w",
                                         [Role#role.name,
                                          NewCamp#meet_pet_camp.round,
                                          NewCamp#meet_pet_camp.day_round],
                                         meet_pet,
                                         583),
                            {remove, RewardRole}
                    end;
                _False ->
                    logger:error("无法找到[~ts]的宠物祝福数据:~w",
                                 [Role#role.name, _False],
                                 meet_pet,
                                 587),
                    DelRole = plot_quest:remove_plot_unit(Id, Role),
                    {remove, DelRole}
            end;
        #meet_pet_camp_data{} ->
            RemoveRole = plot_quest:remove_plot_unit(Id, Role),
            logger:debug("*************[~ts]任务完成事件监听[CampId:~w][BattleI"
                         "d:~w]",
                         [Role#role.name, CampId, Id],
                         meet_pet,
                         593),
            {ok, RemoveRole};
        _False ->
            logger:error("[~ts]的宠物祝福配置[活动Id:~w]",
                         [Role#role.name, CampId],
                         meet_pet,
                         596),
            ok
    end;
progress(#evt_kill_npc{}, _Role, _CampId) -> ok.

commit(Role = #role{s_event = 19, id = SelfId}) ->
    case lookup(meet_pet, SelfId) of
        [Camp = #meet_pet_camp{day_round = DayRound}] ->
            case DayRound >= 3 of
                true ->
                    case check_teammate_commit_cond(Camp, Role) of
                        {true, Mate, _MateCamp} -> do_commit(Mate, Camp, Role);
                        {false, Msg} -> {false, Msg};
                        _ -> {false, lang:get("无法提交宠物祝福任务")}
                    end;
                false -> {false, lang:get("任务未完成，无法提交宠物祝福")}
            end;
        _ -> {false, lang:get("无法提交宠物祝福任务")}
    end;
commit(_Role) -> {false, lang:get("无法提交宠物祝福任务")}.

do_commit(#team_mate{pid = MatePid}, Camp, Role)
    when is_pid(MatePid) ->
    case role:apply(sync,
                    MatePid,
                    {meet_pet, sync_commit, []})
        of
        ok ->
            NewCamp = Camp#meet_pet_camp{status = 3},
            case exit_meet_pet(Role, NewCamp) of
                {ok, ExitRole} ->
                    save(meet_pet, NewCamp),
                    {ok, NewRole} = gain_meet_pet_reward(ExitRole, NewCamp),
                    {ok, NewRole};
                _ -> {false, lang:get("提交任务失败")}
            end;
        {false, Msg} -> {false, Msg};
        _ -> {false, lang:get("队友无法提交任务")}
    end;
do_commit(_Mate, _Camp, _Role) ->
    {false, lang:get("需两人组队才能提交任务哟")}.

sync_commit(Role = #role{s_event = 19, id = SelfId,
                         name = Name}) ->
    case lookup(meet_pet, SelfId) of
        [Camp = #meet_pet_camp{day_round = DayRound}]
            when DayRound >= 3 ->
            NewCamp = Camp#meet_pet_camp{status = 3},
            case exit_meet_pet(Role, NewCamp) of
                {ok, ExitRole} ->
                    save(meet_pet, NewCamp),
                    {ok, NewRole} = gain_meet_pet_reward(ExitRole, NewCamp),
                    {ok, ok, NewRole};
                _ -> {ok, {false, lang:get("队友提交任务失败")}}
            end;
        [_] ->
            Msg = notice:format(lang:get("~ts未完成宠物祝福活动，无法提交"),
                                [{role_2, Name}]),
            {ok, {false, Msg}};
        _ ->
            Msg = notice:format(lang:get("~ts已退出宠物祝福活动，无法提交"),
                                [{role_2, Name}]),
            {ok, {false, Msg}}
    end;
sync_commit(#role{name = Name}) ->
    Msg = notice:format(lang:get("~ts已退出宠物祝福活动，无法提交"),
                        [{role_2, Name}]),
    {ok, {false, Msg}}.

gain_meet_pet_reward(Role, Camp) ->
    {Notice, Gains} = meet_pet_reward(Role, Camp),
    case Gains of
        [_ | _] ->
            case role_gain:do_notice(Gains, Role) of
                {ok, NewRole} ->
                    notice:cast(all, 4, Notice),
                    {ok, NewRole};
                _False ->
                    logger:debug("[~ts]提交任务奖励:~w, ~w",
                                 [Role#role.name, _False, Gains],
                                 meet_pet,
                                 669),
                    notice:send(Role, 1, lang:get("背包已满，无法获得奖励")),
                    {ok, Role}
            end;
        _ -> {ok, Role}
    end.

meet_pet_reward(#role{classes = Classes, name = Name},
                #meet_pet_camp{pet_base_id = PetBaseId}) ->
    CombatRewads = meet_pet_data:commit_rewards(),
    ClassesRewards = [Item
                      || Item = #meet_pet_item_reward{classes = CfgClasses}
                             <- CombatRewads,
                         CfgClasses =:= Classes],
    case util:rand_list(ClassesRewards,
                        #meet_pet_item_reward.weight)
        of
        #meet_pet_item_reward{base_id = BaseId, num = Num,
                              is_notice = IsNotice} ->
            Msg = case IsNotice of
                      0 -> "";
                      1 ->
                          Fmt =
                              lang:get("~ts变身~ts表现优秀，提交~ts任务时获得菲菲奖励的~ts {face_1,2}"),
                          Args = [{role_2, Name},
                                  {pet_2, PetBaseId},
                                  {string_2, 1, lang:get("宠物祝福")},
                                  {item_2, BaseId, Num}],
                          notice:format(Fmt, Args)
                  end,
            {Msg,
             [#gain{label = item_base_id,
                    val = [{BaseId, 0, Num}]}]};
        _ -> {"", []}
    end.

check_teammate_commit_cond(#meet_pet_camp{pet_base_id =
                                              PetBaseId},
                           Role) ->
    case team:is_leader(Role) of
        true ->
            case team:get_members(Role) of
                [Mate = #team_mate{status = 2, id = MateId}] ->
                    case lookup(meet_pet, MateId) of
                        [MateCamp = #meet_pet_camp{status = 1,
                                                   pet_base_id = PetBaseId,
                                                   day_round = DayRound}]
                            when DayRound >= 3 ->
                            {true, Mate, MateCamp};
                        [#meet_pet_camp{status = 1, pet_base_id = PetBaseId}] ->
                            {false, lang:get("队友没有完成任务，无法提交")};
                        [#meet_pet_camp{status = PetBaseId}] ->
                            {false, lang:get("队友已完成今日的宠物祝福任务")};
                        [#meet_pet_camp{}] ->
                            {team_false,
                             lang:get("两人变身一致才能提交情缘任务哟{face_1,21}")};
                        _ -> {false, lang:get("队友无法提交任务")}
                    end;
                [#team_mate{}] ->
                    {false, lang:get("快让你的伙伴归队吧{face_1,7}")};
                _ -> {false, lang:get("只能相同宠物外观的二人组队才能提交任务哟")}
            end;
        _ -> {false, lang:get("只有队长才能提交任务哟")}
    end.

camp_reward(Camp, UnitBaseId, Role) ->
    case check_camp_reward(Camp) of
        true -> gain_camp_reward(Camp, UnitBaseId, Role);
        {false, Msg} ->
            notice:send(Role, 1, Msg),
            Role;
        _ -> Role
    end.

check_camp_reward(#meet_pet_camp{round = Round,
                                 day_round = DayRound})
    when Round > DayRound ->
    true;
check_camp_reward(_) -> false.

gain_camp_reward(Camp, UnitBaseId,
                 Role = #role{lev = Lev}) ->
    case meet_pet_data:camp_ratio(UnitBaseId) of
        RatioMaps when is_map(RatioMaps) ->
            ExpRatio = maps:get(exp, RatioMaps, 0),
            PracExpRatio = maps:get(prac_exp, RatioMaps, 0),
            PetExpRatio = maps:get(pet_exp, RatioMaps, 0),
            case meet_pet_data:lev_reward(Lev) of
                LevReward when is_map(LevReward) ->
                    ExpVal = util:floor(maps:get(exp, LevReward, 0) *
                                            ExpRatio
                                            / 1000),
                    PracExpVal = util:floor(maps:get(prac_exp, LevReward, 0)
                                                * PracExpRatio
                                                / 1000),
                    PetExpVal = util:floor(maps:get(pet_exp, LevReward, 0) *
                                               PetExpRatio
                                               / 1000),
                    Gains = [#gain{label = exp, val = ExpVal},
                             #gain{label = pet_exp, val = PetExpVal}],
                    {Notice, ItemRewards} = camp_item_reward(Role),
                    case role_gain:do_notice(ItemRewards ++ Gains, Role) of
                        {ok, GainRole} ->
                            case Notice of
                                "" -> ok;
                                _ -> notice:cast(all, 4, Notice)
                            end,
                            PracExpGain = [#gain{label = prac_exp,
                                                 val = PracExpVal}],
                            case role_gain:do(PracExpGain, GainRole) of
                                {ok, NewRole} -> NewRole;
                                _False -> GainRole
                            end;
                        _False ->
                            logger:error("[~ts]无法获得奖励[Lev:~w][False:~w]",
                                         [Role#role.name, Lev, _False],
                                         meet_pet,
                                         770),
                            Role
                    end;
                _False ->
                    logger:error("[~ts]没有奖励配置[Lev:~w][False:~w]",
                                 [Role#role.name, Lev, _False],
                                 meet_pet,
                                 775),
                    Role
            end;
        _False ->
            logger:error("[~ts]没有奖励配置[CampId:~w][False:~w]",
                         [Role#role.name, Camp#meet_pet_camp.camp_id, _False],
                         meet_pet,
                         780),
            Role
    end.

camp_item_reward(#role{classes = Classes,
                       name = Name}) ->
    case util:rand(1, 100) =< 50 of
        true ->
            CombatRewads = meet_pet_data:combat_rewards(),
            ClassesRewards = [Item
                              || Item = #meet_pet_item_reward{classes =
                                                                  CfgClasses}
                                     <- CombatRewads,
                                 CfgClasses =:= Classes],
            case util:rand_list(ClassesRewards,
                                #meet_pet_item_reward.weight)
                of
                #meet_pet_item_reward{base_id = BaseId, num = Num,
                                      is_notice = IsNotice} ->
                    Msg = case IsNotice of
                              0 -> "";
                              1 ->
                                  Fmt =
                                      lang:get("~ts参加宠物祝福活动时，打跑守关小怪，意外获得了~ts {face_1,10}"),
                                  Args = [{role_2, Name},
                                          {item_2, BaseId, Num}],
                                  notice:format(Fmt, Args)
                          end,
                    {Msg,
                     [#gain{label = item_base_id,
                            val = [{BaseId, 0, Num}]}]};
                _ -> {"", []}
            end;
        _ -> {"", []}
    end.

update_progress_camp(Camp = #meet_pet_camp{day_round =
                                               DayRound,
                                           round = Round, camp_id = CampId,
                                           camp_list = CampList},
                     _Role) ->
    NewDayRound = erlang:max(DayRound, Round),
    NewCampList = [CampId | CampList],
    Camp#meet_pet_camp{day_round = NewDayRound,
                       camp_list = NewCampList}.

check_next_accept(#meet_pet_camp{status = 2},
                  Role = #role{s_event = 19}) ->
    Msg = lang:get("今日的宠物祝福活动已结束，请明日准时参加"),
    notice:send(Role, 3, Msg),
    logger:debug("检查接受下一个任务:~w",
                 [util:get_stacktrace()],
                 meet_pet,
                 826),
    ok;
check_next_accept(Camp = #meet_pet_camp{status = 1,
                                        round = Round},
                  Role = #role{s_event = 19})
    when Round < 3 ->
    case team:is_leader(Role) of
        true -> accept_next(Camp, Role);
        false -> ok
    end;
check_next_accept(#meet_pet_camp{camp_id = CampId,
                                 round = Round},
                  Role = #role{s_event = 19}) ->
    role:link_send(Role, 15608, {Round, CampId, 1}),
    Msg = lang:get("您已完成今日的宠物祝福任务，请前往提交"),
    notice:send(Role, 3, Msg),
    ok;
check_next_accept(_Camp, Role = #role{name = Name}) ->
    case team:is_team(Role) of
        true ->
            TeamFmt = lang:get("~ts已退出宠物祝福活动，无法领取取下一任务"),
            TeamMsg = notice:format(TeamFmt, [{role_2, Name}]),
            MFA = {notice, send, [3, TeamMsg]},
            team:async_teammate(Role, MFA),
            ok;
        false -> ok
    end,
    Msg = lang:get("您已退出宠物祝福活动，无法领取取下一任务"),
    notice:send(Role, 3, Msg),
    ok.

create_plot_unit(Role = #role{m_plot =
                                  MPlot = #m_plot{unit_list = UnitList}},
                 #meet_pet_camp_data{battle_id = BattleId,
                                     unit_base_id = UnitBaseId,
                                     map_base_id = MapBaseId},
                 {X, Y}) ->
    Pos = #{map => MapBaseId, x => X, y => Y},
    case plot_quest:make_plot_unit(BattleId,
                                   UnitBaseId,
                                   Pos,
                                   Role,
                                   [])
        of
        {ok, PlotUnit} ->
            NewUnitList = lists:keystore(BattleId,
                                         #plot_unit.id,
                                         UnitList,
                                         PlotUnit),
            NRole = Role#role{m_plot =
                                  MPlot#m_plot{unit_list = NewUnitList}},
            plot_quest:send_unit_plot_act(NRole, [PlotUnit]),
            {ok, NRole};
        False ->
            logger:error("[~ts]无法创建宠物祝福单位[id:~w][base_id:~w][pos:~w][Fa"
                         "lse:~w]",
                         [Role#role.name, BattleId, UnitBaseId, Pos, False],
                         meet_pet,
                         877),
            false
    end;
create_plot_unit(Role, _Data, Pos) ->
    logger:error("[~ts]无法创建宠物祝福单位[pos:~w]",
                 [Role#role.name, Pos],
                 meet_pet,
                 881),
    false.

check_teammate_accept_cond(#meet_pet_camp{pet_base_id =
                                              PetBaseId},
                           Role) ->
    case team:is_leader(Role) of
        true ->
            case team:get_members(Role) of
                [Mate = #team_mate{status = 2, id = MateId}] ->
                    case lookup(meet_pet, MateId) of
                        [MateCamp = #meet_pet_camp{status = 1,
                                                   pet_base_id = PetBaseId}] ->
                            {true, Mate, MateCamp};
                        [#meet_pet_camp{status = PetBaseId}] ->
                            {false, lang:get("队友已完成今日的宠物祝福任务")};
                        [#meet_pet_camp{status = 1}] ->
                            {team_false,
                             lang:get("两人变身一致才能接取情缘任务哟{face_1,21}")};
                        _ -> {false, lang:get("队友未进行宠物祝福报名，无法领取任务")}
                    end;
                [#team_mate{}] ->
                    {false, lang:get("快让你的伙伴归队吧{face_1,7}")};
                _ -> {false, lang:get("只能相同宠物外观的二人组队才能领取任务哟")}
            end;
        _ -> {false, lang:get("只有队长才能领取任务哟")}
    end.

leave_team(#evt_team_leave{},
           Role = #role{s_event = 19, id = SelfId}) ->
    case lookup(meet_pet, SelfId) of
        [Camp = #meet_pet_camp{ext = Ext}] ->
            Triggers = maps:get(triggers, Ext, []),
            DelRole = role_trigger:del(Triggers, Role),
            {ok, NewCamp, RemoveRole} = clean_camp(DelRole, Camp),
            save(meet_pet, NewCamp#meet_pet_camp{round = 0}),
            NewRole = RemoveRole,
            case get_self_status(Role, NewCamp) of
                {ok, Reply} -> role:link_send(NewRole, 15605, Reply);
                _ -> skip
            end,
            notice:send(NewRole, 3, lang:get("退队成功，宠物祝福任务进度已清空")),
            {remove, NewRole};
        _ -> {remove, Role}
    end;
leave_team(#evt_team_leave{}, _Role) -> ok.

join_to_follow(Role) ->
    Flag = case role_misc:check_event(Role) of
               {false, Reason} -> {false, Reason};
               true -> sign(Role)
           end,
    case Flag of
        {ok, PetBaseId, NewRole} ->
            role:link_send(NewRole,
                           15602,
                           {1, lang:get("报名成功"), PetBaseId}),
            team:follow(NewRole),
            {ok, NewRole};
        {false, Reason1} ->
            Msg = util:flist(lang:get("队长正在宠物祝福活动中，~ts"),
                             [Reason1]),
            notice:send(Role, 3, Msg),
            ok;
        _ ->
            Msg = util:flist(lang:get("队长正在宠物祝福活动中")),
            notice:send(Role, 3, Msg),
            ok
    end.

recruit_lev(LevRangeCfg, Flag,
            Role = #role{s_event = 19, id = SelfId,
                         name = _Name}) ->
    case lookup(meet_pet, SelfId) of
        [#meet_pet_camp{status = 1, pet_base_id = PetBaseId}] ->
            case team:make_recruit_cond(LevRangeCfg, Flag, Role) of
                {True, LevMin, LevMax, Info} ->
                    Add = {2, PetBaseId},
                    {True, LevMin, LevMax, [Add | Info]};
                Rtn -> Rtn
            end;
        _ -> {false, lang:get("当前无法进行宠物祝福招募")}
    end;
recruit_lev(_LevRangeCfg, _Flag, _Role) ->
    {false, lang:get("请先报名参加宠物祝福活动，再进行招募")}.

join_recruitment_team(Role = #role{id = SelfId,
                                   cross_type = CrossType},
                      Recruitment = #team_recruitment{pid = TeamPid},
                      Mate = #team_mate{id = MateId}) ->
    case lookup(meet_pet, SelfId) of
        [#meet_pet_camp{status = 1}] ->
            team_mgr:accept_recruitment_join(Role,
                                             Recruitment,
                                             Mate);
        [] ->
            case lookup(meet_pet, MateId) of
                [#meet_pet_camp{status = 1}] ->
                    case sign(Role) of
                        {ok, PetBaseId, SignRole} ->
                            Fmt = lang:get("已自动参与宠物祝福活动，变身~ts"),
                            Args = [{pet_2, PetBaseId}],
                            Msg = notice:format(Fmt, Args),
                            Data = {1, Msg, PetBaseId},
                            role:link_send(SignRole, 15602, Data),
                            team_mgr:accept_recruitment_join(SignRole,
                                                             Recruitment,
                                                             Mate);
                        Rtn -> Rtn
                    end;
                _ ->
                    team_recruit:push_recruitment_info(Role,
                                                       del,
                                                       0,
                                                       TeamPid,
                                                       #{cross_type =>
                                                             CrossType}),
                    NewRecruitment = Recruitment#team_recruitment{type = 0},
                    team_mgr:accept_recruitment_join(Role,
                                                     NewRecruitment,
                                                     Mate)
            end;
        _ -> {false, lang:get("您已完成宠物祝福任务，无法加入队伍")}
    end;
join_recruitment_team(_Role, _Recruitment, _Mate) ->
    Msg = notice:format(lang:get("请参加~ts活动后再入队"),
                        [{string_2, 1, lang:get("宠物祝福")}]),
    {false, Msg}.

stop_recruit_msg(Members) ->
    Mates = [GotMate
             || GotMate = #team_mate{status = Status} <- Members,
                Status =/= 1],
    case Mates of
        [#team_mate{id = MateId, name = MateName}] ->
            case lookup(meet_pet, MateId) of
                [#meet_pet_camp{pet_base_id = PetBaseId}] ->
                    Fmt = lang:get("~ts-~ts加入队伍，招募自动停止"),
                    Args = [{role_2, MateName}, {pet_2, PetBaseId}],
                    notice:format(Fmt, Args);
                _ -> lang:get("已停止招募")
            end;
        _ -> lang:get("已停止招募")
    end.

get_camp(#role{id = SelfId}) ->
    case lookup(meet_pet, SelfId) of
        [#meet_pet_camp{status = 1, camp_id = CampId,
                        round = Round, day_round = DayRound}]
            when CampId > 0 ->
            Boolean = case DayRound =:= Round of
                          true -> 1;
                          false -> 0
                      end,
            {ok, {Round, CampId, Boolean}};
        _ -> false
    end.

lookup(Tab, Key) -> catch ets:lookup(Tab, Key).

save(Tab, Data) ->
    catch ets:insert(Tab, Data),
    ok.

start_link() ->
    gen_fsm:start_link({local, meet_pet},
                       meet_pet,
                       [],
                       [{debug, [trace]}]).

init([]) ->
    logger:info("[~w] 正在启动...", [meet_pet], meet_pet, 1054),
    {Timeout, NextTime} = case get_idle_time() of
                              IdleTime when is_integer(IdleTime) ->
                                  {IdleTime, IdleTime * 1000};
                              _ -> {undefined, infinity}
                          end,
    meet_pet = ets:new(meet_pet,
                       [named_table,
                        public,
                        set,
                        {keypos, #meet_pet_camp.rid}]),
    logger:info("[~w] 启动完成...下次活动时间:~w",
                [meet_pet, NextTime],
                meet_pet,
                1062),
    {ok,
     idle,
     #meet_pet{ts = erlang:now(), timeout = Timeout},
     NextTime}.

idle(timeout, MeetPet = #meet_pet{switch = close}) ->
    logger:info("空闲阶段处于close状态，无需开启", [], meet_pet, 1067),
    continue(idle, MeetPet#meet_pet{timeout = undefined});
idle(timeout, MeetPet) ->
    ets:delete_all_objects(meet_pet),
    {WorldLev, _} = world_lev:get_world_lev(),
    PetCfgList = meet_pet_data:pet_list(),
    PetList = [{PetId, Weight}
               || {PetId, WorldLevCfg, Weight} <- PetCfgList,
                  WorldLev >= WorldLevCfg],
    case util:rand_list_n(PetList, 2, 2) of
        [{PetId1, _}, {PetId2, _}] ->
            PetIds = [{PetId1, 0}, {PetId2, 0}],
            Map = 10001,
            PosList = [{Map, 4038, 1305}, {Map, 4245, 1326}],
            PetUnits = make_pet_unit(PetIds, PosList, []),
            BattleIds = create_battle_unit(PetUnits),
            Timeout = (16 - 13) * 3600,
            Fmt =
                lang:get("~ts活动将在16:00进行，今天的幸运宠物是~ts和~ts {face_1,9}"),
            Args = [{string_2, 1, lang:get("宠物祝福")},
                    {pet_2, PetId1},
                    {pet_2, PetId2}],
            Msg = notice:format(Fmt, Args),
            broadcast(8, Msg),
            broadcast_phase(2, Timeout),
            NewMeetPet = MeetPet#meet_pet{ts = erlang:now(),
                                          timeout = Timeout, pet_ids = PetIds,
                                          battle_ids = BattleIds},
            logger:info("宠物祝福进入公告阶段，距离下一阶段[~w]时间:~w",
                        [notice, Timeout],
                        meet_pet,
                        1090),
            continue(notice, NewMeetPet);
        _False ->
            logger:debug("宠物祝福：~w", [_False], meet_pet, 1093),
            Timeout = get_idle_time(),
            Fmt =
                lang:get("宠物正在酣睡中，所以今日的~ts活动将暂停开放，请各位明天再来参加{face_1,9}"),
            Args = [{string_2, 1, lang:get("宠物祝福")}],
            Msg = notice:format(Fmt, Args),
            broadcast(8, Msg),
            continue(idle, MeetPet#meet_pet{timeout = Timeout})
    end;
idle(Event, MeetPet) ->
    logger:info("空闲阶段收到未知事件:~w", [Event], meet_pet, 1102),
    continue(idle, MeetPet).

notice(timeout,
       MeetPet = #meet_pet{pet_ids =
                               [{PetId1, _Num1}, {PetId2, _Num2}]}) ->
    Fmt =
        lang:get("~ts活动已经开始，参加活动将变身~ts或~ts，和搭档一起闯关冒险{face_1,38}"),
    Args = [{string_2, 1, lang:get("宠物祝福")},
            {pet_2, PetId1},
            {pet_2, PetId2}],
    Msg = notice:format(Fmt, Args),
    Timeout = 3600,
    broadcast(8, Msg),
    broadcast_phase(3, Timeout),
    TimerMeetPet = set_beginning_prog_notice(MeetPet),
    NewMeetPet = TimerMeetPet#meet_pet{ts = erlang:now(),
                                       timeout = Timeout},
    logger:info("宠物祝福进入活动阶段，距离下一阶段[~w]时间:~w",
                [beginning, Timeout],
                meet_pet,
                1115),
    continue(beginning, NewMeetPet);
notice(Event, MeetPet) ->
    logger:info("公告阶段收到未知事件:~w", [Event], meet_pet, 1118),
    continue(notice, MeetPet).

beginning(timeout,
          MeetPet = #meet_pet{pet_ids =
                                  [{PetId1, _Num1}, {PetId2, _Num2}]}) ->
    async_exit(MeetPet),
    Fmt = lang:get("~ts活动已结束，威武呆萌的~ts和~ts表现不错哟{face_1,22}"),
    Args = [{string_2, 1, lang:get("宠物祝福")},
            {pet_2, PetId1},
            {pet_2, PetId2}],
    Msg = notice:format(Fmt, Args),
    Timeout = 120,
    broadcast(8, Msg),
    broadcast_phase(4, Timeout),
    TimerMeetPet = clean_beginning_prog_notice(MeetPet),
    NewMeetPet = TimerMeetPet#meet_pet{ts = erlang:now(),
                                       timeout = Timeout},
    logger:info("宠物祝福进入退出阶段，距离下一阶段[~w]时间:~w",
                [exit, Timeout],
                meet_pet,
                1132),
    continue(exit, NewMeetPet);
beginning(Event, MeetPet) ->
    logger:info("活动阶段收到未知事件:~w", [Event], meet_pet, 1135),
    continue(beginning, MeetPet).

exit(timeout,
     MeetPet = #meet_pet{battle_ids = BattleIds}) ->
    logger:debug("删除宠物NPC~w", [BattleIds], meet_pet, 1140),
    [unit_mgr:remove(BattleId) || BattleId <- BattleIds],
    Timeout = get_idle_time(),
    NewMeetPet = MeetPet#meet_pet{ts = erlang:now(),
                                  timeout = Timeout, pet_ids = [],
                                  battle_ids = [],
                                  ext =
                                      #{pet_queue => queue:new(),
                                        notice_ref => undefined}},
    logger:info("宠物祝福进入下一空闲阶段，距离下一阶段[~w]时间:~w",
                [idle, Timeout],
                meet_pet,
                1147),
    continue(idle, NewMeetPet);
exit(Event, MeetPet) ->
    logger:info("结束阶段收到未知事件:~w", [Event], meet_pet, 1150),
    continue(exit, MeetPet).

state_name(_Event, _From, MeetPet) ->
    Reply = ok,
    {reply, Reply, state_name, MeetPet}.

handle_event(_, Phase,
             MeetPet = #meet_pet{timeout = undefined}) ->
    continue(Phase, MeetPet);
handle_event({switch, Switch}, Phase,
             MeetPet = #meet_pet{switch = Before}) ->
    Timeout = case {Phase, Switch} of
                  {idle, close} -> get_idle_time();
                  _ -> undefined
              end,
    logger:info("活动开关，之前:~w, 之后:~w, 当前阶段:~w, 下一阶段时间:~w",
                [Before, Switch, Phase, Timeout],
                meet_pet,
                1165),
    NewMeetPet = MeetPet#meet_pet{switch = Switch,
                                  ts = erlang:now(), timeout = Timeout},
    continue(Phase, NewMeetPet);
handle_event({get_phase, FromPid}, Phase,
             MeetPet = #meet_pet{ts = Ts, timeout = Timeout}) ->
    LeftTime = util:time_left(Timeout * 1000, Ts) div 1000,
    PhaseEnum = phase_enum(Phase),
    role:pack_send(FromPid, 15600, {PhaseEnum, LeftTime}),
    continue(Phase, MeetPet);
handle_event({pet_list, FromPid}, Phase,
             MeetPet = #meet_pet{pet_ids = PetIds})
    when Phase =:= notice orelse Phase =:= beginning ->
    PetBaseIds = [PetBaseId || {PetBaseId, _} <- PetIds],
    role:pack_send(FromPid, 15601, {PetBaseIds}),
    continue(Phase, MeetPet);
handle_event({exit_meet_pet, PetBaseId}, Phase,
             MeetPet) ->
    NewMeetPet = case update_pet_stats(MeetPet,
                                       desc,
                                       PetBaseId)
                     of
                     {ok, NewPetIds} ->
                         MeetPet#meet_pet{pet_ids = NewPetIds};
                     _ -> MeetPet
                 end,
    continue(Phase, NewMeetPet);
handle_event(_Event, Phase, MeetPet) ->
    continue(Phase, MeetPet).

handle_sync_event(_, _From, Phase,
                  MeetPet = #meet_pet{timeout = undefined}) ->
    continue(Phase, false, MeetPet);
handle_sync_event({sign, Rid}, _From, Phase = beginning,
                  MeetPet) ->
    {Reply, NewMeetPet} = case server_sign(MeetPet, Rid) of
                              {ok, PetId, RtnMeetPet} ->
                                  {{ok, PetId}, RtnMeetPet};
                              FalseReply -> {FalseReply, MeetPet}
                          end,
    continue(Phase, Reply, NewMeetPet);
handle_sync_event({sign, Rid, PetBaseId}, _From,
                  Phase = beginning, MeetPet) ->
    {Reply, NewMeetPet} = case server_sign(MeetPet,
                                           Rid,
                                           PetBaseId)
                              of
                              {ok, RtnMeetPet} -> {ok, RtnMeetPet};
                              FalseReply -> {FalseReply, MeetPet}
                          end,
    continue(Phase, Reply, NewMeetPet);
handle_sync_event({sign, _Rid}, _From, Phase = exit,
                  MeetPet) ->
    continue(Phase,
             {false, lang:get("今日宠物祝福已结束，请明日再来参加")},
             MeetPet);
handle_sync_event({sign, _Rid}, _From, Phase,
                  MeetPet) ->
    continue(Phase,
             {false, lang:get("宠物祝福活动将在16:00-17:00进行")},
             MeetPet);
handle_sync_event({change_transform, Rid}, _From,
                  Phase = beginning,
                  MeetPet = #meet_pet{pet_ids = PetIds}) ->
    {Reply, NewMeetPet} = case lookup(meet_pet, Rid) of
                              [Camp = #meet_pet_camp{pet_base_id = PetBaseId,
                                                     status = 1}] ->
                                  case lists:keytake(PetBaseId, 1, PetIds) of
                                      {value,
                                       {PetBaseId, Num},
                                       [{RestPetBaseId, RestNum}]} ->
                                          NewCamp =
                                              Camp#meet_pet_camp{pet_base_id =
                                                                     RestPetBaseId},
                                          save(meet_pet, NewCamp),
                                          DescPetIds = lists:keystore(PetBaseId,
                                                                      1,
                                                                      PetIds,
                                                                      {PetBaseId,
                                                                       Num -
                                                                           1}),
                                          IncPetIds =
                                              lists:keystore(RestPetBaseId,
                                                             1,
                                                             DescPetIds,
                                                             {RestPetBaseId,
                                                              RestNum + 1}),
                                          RtnMeetPet = MeetPet#meet_pet{pet_ids
                                                                            =
                                                                            IncPetIds},
                                          {{ok, RestPetBaseId}, RtnMeetPet};
                                      _ ->
                                          {{false, lang:get("没有找到对应的变身宠物")},
                                           MeetPet}
                                  end;
                              _ -> {{false, lang:get("无需变换宠物外观")}, MeetPet}
                          end,
    continue(Phase, Reply, NewMeetPet);
handle_sync_event({change_transform, _Rid}, _From,
                  Phase = exit, MeetPet) ->
    continue(Phase,
             {false, lang:get("宠物祝福活动已结束，无需变换外观")},
             MeetPet);
handle_sync_event({change_transform, _Rid}, _From,
                  Phase, MeetPet) ->
    continue(Phase,
             {false, lang:get("宠物祝福活动还未开启，无需变换外观")},
             MeetPet);
handle_sync_event(_Event, _From, Phase, MeetPet) ->
    continue(Phase, false, MeetPet).

handle_info(_, Phase,
            MeetPet = #meet_pet{timeout = undefined}) ->
    continue(Phase, MeetPet);
handle_info(beginning_prog_notice, Phase = beginning,
            MeetPet) ->
    Time = erlang:round(now_diff(MeetPet) / 60),
    Notice = if Time >= 45 ->
                    {ok, lang:get("宠物祝福活动还剩15分钟，抓紧时间完成情缘任务吧{face_1,7}")};
                Time >= 15 orelse Time >= 30 ->
                    {ok, lang:get("宠物祝福活动正在进行中，还没参加的小伙伴快报名吧{face_1,9}")};
                true -> false
             end,
    NewMeetPet = case Notice of
                     {ok, Msg} ->
                         broadcast(8, Msg),
                         set_beginning_prog_notice(MeetPet);
                     _ -> MeetPet
                 end,
    continue(Phase, NewMeetPet);
handle_info(_Info, Phase, MeetPet) ->
    continue(Phase, MeetPet).

terminate(_Reason, _Phase, _MeetPet) ->
    logger:info("[~w] 正在关闭[~w]...",
                [meet_pet, _Reason],
                meet_pet,
                1260),
    logger:info("[~w] 完成关闭...", [meet_pet], meet_pet, 1261),
    ok.

code_change(_OldVsn, Phase, MeetPet, _Extra) ->
    {ok, Phase, MeetPet}.

continue(Phase,
         #meet_pet{timeout = undefined} = MeetPet) ->
    {next_state, Phase, MeetPet, infinity};
continue(Phase,
         #meet_pet{ts = Ts, timeout = Timeout} = MeetPet) ->
    {next_state,
     Phase,
     MeetPet,
     util:time_left(Timeout * 1000, Ts)}.

continue(Phase, Reply,
         #meet_pet{timeout = undefined} = MeetPet) ->
    {reply, Reply, Phase, MeetPet, infinity};
continue(Phase, Reply,
         #meet_pet{ts = Ts, timeout = Timeout} = MeetPet) ->
    {reply,
     Reply,
     Phase,
     MeetPet,
     util:time_left(Timeout * 1000, Ts)}.

phase_enum(idle) -> 1;
phase_enum(notice) -> 2;
phase_enum(beginning) -> 3;
phase_enum(exit) -> 4;
phase_enum(_) -> 4.

broadcast(Type, Msg) ->
    role_group:pack_send(world, 9902, {Type, Msg, []}).

broadcast_phase(Phase, LeftTime) ->
    role_group:pack_send(world, 15600, {Phase, LeftTime}).

get_idle_time() ->
    case agenda_data:get(2016) of
        #{args := Days} -> date:week_next_diff(Days, 13 * 3600);
        _False ->
            logger:error("错误的日程活动配置[Id:~w][Err:~w]",
                         [2016, _False],
                         meet_pet,
                         1303),
            undefined
    end.

server_sign(MeetPet, Rid) ->
    case lookup(meet_pet, Rid) of
        [#meet_pet_camp{pet_base_id = PetBaseId, status = 1}] ->
            {ok, PetBaseId};
        [] ->
            case sign_rand_pet(MeetPet, Rid) of
                {ok, PetBaseId, RtnMeetPet} ->
                    case update_pet_stats(RtnMeetPet, add, PetBaseId) of
                        {ok, NewPetIds} ->
                            NewMeetPet = RtnMeetPet#meet_pet{pet_ids =
                                                                 NewPetIds},
                            {ok, PetBaseId, NewMeetPet};
                        _ -> {ok, PetBaseId, RtnMeetPet}
                    end;
                Rtn -> Rtn
            end;
        [#meet_pet_camp{status = 3}] ->
            {false, lang:get("您已完成今日的宠物祝福任务，请明天再来领取")};
        _ -> {false, lang:get("无法报名参加宠物祝福活动")}
    end.

server_sign(MeetPet = #meet_pet{ext = Ext}, Rid,
            PetBaseId) ->
    case lookup(meet_pet, Rid) of
        [] ->
            case update_pet_stats(MeetPet, add, PetBaseId) of
                {ok, NewPetIds} ->
                    PetQueue = maps:get(pet_queue, Ext, queue:new()),
                    NewPetQueue = queue:in(PetBaseId, PetQueue),
                    NewExt = Ext#{pet_queue => NewPetQueue},
                    Camp = #meet_pet_camp{rid = Rid,
                                          pet_base_id = PetBaseId,
                                          ext = NewExt},
                    save(meet_pet, Camp),
                    NewMeetPet = MeetPet#meet_pet{pet_ids = NewPetIds},
                    {ok, NewMeetPet};
                Rtn -> Rtn
            end;
        [#meet_pet_camp{status = 1, pet_base_id = PetBaseId}] ->
            {ok, MeetPet};
        _ -> ok
    end.

sign_rand_pet(MeetPet = #meet_pet{pet_ids = PetIds,
                                  ext = Ext},
              Rid) ->
    TimeTag = 15 * 60,
    PhaseTime = now_diff(MeetPet),
    case PhaseTime =< TimeTag of
        true ->
            PetQueue = maps:get(pet_queue, Ext, queue:new()),
            case queue:is_empty(PetQueue) of
                false ->
                    {{value, PetBaseId}, NewPetQueue} = queue:out(PetQueue),
                    Camp = #meet_pet_camp{rid = Rid,
                                          pet_base_id = PetBaseId},
                    save(meet_pet, Camp),
                    {ok,
                     PetBaseId,
                     MeetPet#meet_pet{ext = Ext#{pet_queue => NewPetQueue}}};
                true ->
                    case util:rand_list(PetIds) of
                        {PetBaseId, _} ->
                            Camp = #meet_pet_camp{rid = Rid,
                                                  pet_base_id = PetBaseId},
                            NewPetQueue = queue:in(PetBaseId, PetQueue),
                            save(meet_pet, Camp),
                            {ok,
                             PetBaseId,
                             MeetPet#meet_pet{ext =
                                                  Ext#{pet_queue =>
                                                           NewPetQueue}}};
                        _ ->
                            logger:error("无法参与活动，没有宠物[pet_ids:~w]",
                                         [PetIds],
                                         meet_pet,
                                         1368),
                            {false, lang:get("变身失败，无法参与活动")}
                    end
            end;
        false ->
            case lists:keysort(2, PetIds) of
                [{PetBaseId, _} | _] ->
                    NewExt = Ext#{pet_queue => queue:new()},
                    Camp = #meet_pet_camp{rid = Rid,
                                          pet_base_id = PetBaseId,
                                          ext = NewExt},
                    save(meet_pet, Camp),
                    {ok, PetBaseId, MeetPet};
                _ -> {false, lang:get("变身失败，无法参与活动")}
            end
    end.

make_pet_unit([], _, Acc) -> Acc;
make_pet_unit([{PetId, _Num} | Rest],
              [{Map, X, Y} | RestPos], Acc) ->
    case meet_pet_data:pet_unit_id(PetId) of
        PetUnitId when is_integer(PetUnitId) ->
            Unit = {PetUnitId, Map, X, Y},
            make_pet_unit(Rest, RestPos, [Unit | Acc]);
        _ -> make_pet_unit(Rest, RestPos, Acc)
    end.

create_battle_unit(Units) ->
    Len = length(Units),
    case unit_mgr:fetch_ids(Len) of
        {ok, Ids} -> create_battle_unit(Ids, Units, []);
        _False ->
            logger:error("无法创建宠物祝福战场单位:~w",
                         [_False],
                         meet_pet,
                         1401),
            false
    end.

create_battle_unit([], _, Acc) -> Acc;
create_battle_unit(_, [], Acc) -> Acc;
create_battle_unit([Id | RestIds],
                   [{PetId, Map, X, Y} | RestPetIds], Acc) ->
    BattleId = {21, Id},
    NewAcc = case unit_mgr:create(BattleId,
                                  PetId,
                                  {Map, X, Y})
                 of
                 {ok, _} -> [BattleId | Acc];
                 _ -> Acc
             end,
    create_battle_unit(RestIds, RestPetIds, NewAcc).

async_exit(_MeetPet) ->
    Fun = fun (Camp = #meet_pet_camp{status = 1}, Acc) ->
                  NewCamp = Camp#meet_pet_camp{status = 2},
                  [NewCamp | Acc];
              (_, Acc) -> Acc
          end,
    List = ets:foldl(Fun, [], meet_pet),
    save(meet_pet, List),
    async_apply(List,
                local_pid,
                meet_pet,
                apply_exit_meet_pet,
                []).

async_apply([], _Label, _M, _F, _A) -> ok;
async_apply([Camp = #meet_pet_camp{rid = Rid} | Rest],
            Label = local_pid, M, F, A) ->
    case role_query:local_pid(by_id, Rid) of
        {ok, Pid} ->
            send_async_apply(M, F, A, Camp, Pid),
            async_apply(Rest, Label, M, F, A);
        _False -> async_apply(Rest, Label, M, F, A)
    end;
async_apply([_Wid | Rest], Label, M, F, A) ->
    async_apply(Rest, Label, M, F, A).

send_async_apply(meet_pet, F = apply_exit_meet_pet,
                 _Args, Camp, Pid) ->
    role:apply(async, Pid, {meet_pet, F, [Camp]}),
    ok;
send_async_apply(_M, _F, _Args, _Camp, _Pid) ->
    logger:debug("异步回调~w, Camp:~w",
                 [{_M, _F, _Args}, _Camp],
                 meet_pet,
                 1445),
    ok.

del_camp(Role,
         Camp = #meet_pet_camp{camp_id = CampId}) ->
    case CampId > 0 of
        true ->
            case meet_pet_data:camp(CampId) of
                #meet_pet_camp_data{battle_id = BattleId} ->
                    RemoveRole = plot_quest:remove_plot_unit(BattleId,
                                                             Role),
                    NewRole = RemoveRole,
                    role:link_send(NewRole, 15609, {CampId}),
                    NewCamp = Camp#meet_pet_camp{camp_id = 0},
                    {ok, NewCamp, NewRole};
                _ -> {ok, Camp, Role}
            end;
        _ -> {ok, Camp, Role}
    end.

clean_camp(Role, Camp) ->
    {ok, DelCamp, NewRole} = del_camp(Role, Camp),
    NewCamp = DelCamp#meet_pet_camp{round = 0},
    {ok, NewCamp, NewRole}.

update_pet_stats(#meet_pet{pet_ids = PetIds}, Op,
                 PetBaseId) ->
    case lists:keyfind(PetBaseId, 1, PetIds) of
        {_, Num} ->
            NewNum = case Op of
                         add -> Num + 1;
                         desc -> Num - 1;
                         _ -> Num
                     end,
            NewPetIds = lists:keystore(PetBaseId,
                                       1,
                                       PetIds,
                                       {PetBaseId, NewNum}),
            {ok, NewPetIds};
        _False -> {false, lang:get("没有找到对应的变身宠物")}
    end.

now_diff(#meet_pet{ts = Begin}) ->
    erlang:round(timer:now_diff(erlang:now(), Begin) /
                     1000000).

set_beginning_prog_notice(MeetPet = #meet_pet{ext =
                                                  Ext}) ->
    Ref = maps:get(notice_ref, Ext, undefined),
    case is_reference(Ref) of
        true -> erlang:cancel_timer(Ref);
        _ -> skip
    end,
    NewRef = erlang:send_after(15 * 60 * 1000,
                               self(),
                               beginning_prog_notice),
    MeetPet#meet_pet{ext = Ext#{notice_ref => NewRef}}.

clean_beginning_prog_notice(MeetPet = #meet_pet{ext =
                                                    Ext}) ->
    Ref = maps:get(notice_ref, Ext, undefined),
    case is_reference(Ref) of
        true -> erlang:cancel_timer(Ref);
        _ -> MeetPet
    end,
    MeetPet#meet_pet{ext = Ext#{notice_ref => undefined}}.

