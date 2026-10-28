-file("src/mod/sworn/sworn.erl", 1).

-module(sworn).

-behaviour(gen_server).

-export([init/0,
         login/1,
         update/2,
         start_link/0,
         check_role/2,
         check_roles/1,
         combat_start/1,
         combat_over/1,
         combat_over_cb/2,
         update_role_cb/3,
         leave_team_cb/1,
         sworn_over_cb/3,
         sworn_cancle/1,
         sworn_loss/1,
         get_skill/1,
         is_relation/2,
         push/1,
         push_17712/1,
         npc/1,
         start/1,
         start_cb/2,
         start_confirm/2,
         vote/3,
         vote_type/4,
         invite/3,
         invite_reply/3,
         please_leave/4,
         name_first/2,
         name_first_update/2,
         name_first_vote/2,
         name_second/2,
         name_second_update/2,
         agreement/2,
         init_root_dir/0,
         mkdir/1,
         get_photo_name/1,
         sworn_head_dir/1,
         save/1,
         delete/1,
         delete_role/1,
         fetch/1,
         fetch_role/1,
         fetch_evt/1,
         sworn_clear/1,
         sworn_play/1,
         sworn_evt/2,
         sworn_trend_timeout/4]).

-export([init/1,
         handle_call/3,
         handle_cast/2,
         handle_info/2,
         terminate/2,
         code_change/3]).

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

-file("src/mod/sworn/sworn.erl", 70).

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

-file("src/mod/sworn/sworn.erl", 71).

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

-file("src/mod/sworn/sworn.erl", 72).

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

-file("src/mod/sworn/sworn.erl", 73).

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

-file("src/mod/sworn/sworn.erl", 74).

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

-file("src/mod/sworn/sworn.erl", 75).

-file("inc/sworn.hrl", 1).

-record(m_sworn,
        {ver = 0 :: pos_integer(),
         id = {0, "", 0} ::
             {pos_integer(), list(), non_neg_integer()},
         status = 0 :: non_neg_integer(),
         name = "" :: string(),
         name_defined = "" :: string(),
         time = 0 :: list()}).

-record(sworn_role,
        {ver = 0 :: pos_integer(),
         role_id = 0 :: non_neg_integer(),
         id = 0 :: non_neg_integer(),
         name = "" :: string(),
         name_defined = "" :: string(),
         status = 0 :: non_neg_integer()}).

-record(sworn,
        {ver = 0 :: pos_integer(),
         id = {0, "", 0} ::
             {pos_integer(), list(), non_neg_integer()},
         name = "" :: string(),
         time = 0 :: non_neg_integer(),
         sworn_val = 0 :: non_neg_integer(),
         status = 0 :: non_neg_integer(),
         num = 0 :: non_neg_integer(),
         head = 0 :: non_neg_integer(),
         pos = 0 :: non_neg_integer(),
         timeout = 0 :: non_neg_integer(),
         times = 0 :: non_neg_integer(),
         members = [] :: list(),
         votes = [] :: list(),
         trends = [] :: list(),
         lists = [] :: list()}).

-record(sworn_member,
        {ver = 0 :: pos_integer(),
         pos = 0 :: non_neg_integer(),
         role_id = {0, "", 0} ::
             {pos_integer(), list(), non_neg_integer()},
         name = "" :: string(),
         name_defined = "" :: string(),
         lev = 0 :: pos_integer(),
         classes = 0 :: pos_integer(),
         sex = 0 :: pos_integer(),
         times = 0 :: pos_integer(),
         free = 0 :: pos_integer()}).

-record(sworn_trend,
        {type = 0 :: non_neg_integer(),
         id = {0, "", 0} ::
             {pos_integer(), list(), non_neg_integer()},
         name = "" :: string(),
         r_id = {0, "", 0} ::
             {pos_integer(), list(), non_neg_integer()},
         r_name = "" :: string(),
         r_lev = 0 :: non_neg_integer(),
         r_sex = 0 :: non_neg_integer(),
         r_classes = 0 :: non_neg_integer(),
         rename = "" :: string(),
         timeout = 0 :: non_neg_integer(),
         time = 0 :: non_neg_integer(),
         reason_id = 0 :: non_neg_integer(),
         reason_msg = "" :: string(),
         votes = [] :: list(),
         agree = 0 :: non_neg_integer(),
         lists = [] :: list()}).

-record(sworn_evt,
        {role_id = {0, "", 0} ::
             {pos_integer(), list(), non_neg_integer()},
         finish = 0 :: non_neg_integer(),
         skill = 0 :: non_neg_integer(),
         invite = 0 :: non_neg_integer(),
         prefix = 0 :: non_neg_integer(),
         personal = 0 :: non_neg_integer()}).

-file("src/mod/sworn/sworn.erl", 76).

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

-file("src/mod/sworn/sworn.erl", 77).

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

-file("src/mod/sworn/sworn.erl", 78).

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

-file("src/mod/sworn/sworn.erl", 79).

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

-file("src/mod/sworn/sworn.erl", 80).

-file("inc/condition.hrl", 1).

-record(condition,
        {label :: undefined | atom(),
         op = eq ::
             ue | eq | lt | gt | le | ge | range | include,
         val :: undefined | term(),
         msg = "" :: list()}).

-file("src/mod/sworn/sworn.erl", 81).

-file("inc/skill.hrl", 1).

-record(m_skill,
        {ver = 6 :: pos_integer(),
         skills = [] :: [{non_neg_integer(), non_neg_integer()}],
         is_open_skl_prac = 0 :: 0 | 1,
         selected_skl_prac = 0 :: non_neg_integer(),
         skill_prac = [] :: list(),
         skill_couple = [] :: list(),
         skill_sworn = [] :: list(),
         speed = [] :: list(),
         skill_unique = [],
         skill_clsld_done = [],
         unique_coolddown_time = 0,
         skl_unique_point = 100,
         sq_double = 0,
         is_open_sq_double = 0,
         sq_exp_statistics = []}).

-record(role_base_skill,
        {id = 0,
         lev = 0,
         type :: undefined | non_neg_integer(),
         sub_type :: undefined | non_neg_integer(),
         max_lev = 0,
         name = "",
         way = 1,
         study_lev = 1,
         cost = [],
         attr = []}).

-record(skill,
        {id = 0,
         lev = 0,
         type = 0 :: non_neg_integer(),
         sub_type = 0 :: non_neg_integer(),
         speed = 1,
         name = "",
         acc_ratio = 1000,
         acc_low = 0,
         acc_high = 1000,
         attack_type = 0 :: non_neg_integer(),
         elem_type = 0 :: non_neg_integer(),
         target_type = 1 :: non_neg_integer(),
         attack_times = 1 :: non_neg_integer(),
         target_list = [],
         self_cond = [],
         self_loss = [],
         target_cond = [],
         dmg_addt = 0 :: non_neg_integer(),
         dmg_ratio = [1000] :: non_neg_integer(),
         pre_cooldown = 0,
         cooldown = 0 :: non_neg_integer(),
         cost_mp = 0 :: non_neg_integer(),
         cost_anger = 0,
         cost_other = [] :: [{atom(), non_neg_integer()}],
         buff_self = [] :: [tuple()],
         buff_target = [] :: [tuple()],
         script_id = 0 :: non_neg_integer(),
         script_args = [] :: [integer()],
         addt_scripts = [] ::
             [{non_neg_integer(), non_neg_integer(), list()}],
         play_time = 0 :: non_neg_integer()}).

-record(chief_classes,
        {leader_id = 0,
         classes = 0,
         name = "",
         sex = 0,
         lev = 0,
         looks = []}).

-record(sq_exp_statistics,
        {combat_type = 0, times = 0, gain = 0, real_gain = 0}).

-file("src/mod/sworn/sworn.erl", 82).

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

-file("src/mod/sworn/sworn.erl", 83).

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

-file("src/mod/sworn/sworn.erl", 84).

-record(state, {next_id = 1}).

init() -> #m_sworn{}.

login(Role = #role{id = RoleId,
                   m_sworn = #m_sworn{id = {0, _P, _Z}},
                   s_event = Event}) ->
    NewEvent = case Event of
                   40 -> 0;
                   _ -> Event
               end,
    #sworn_evt{finish = Finish, skill = Skill,
               invite = Invite, prefix = Prefix, personal = Personel} =
        fetch_evt(RoleId),
    RoleEvt = role_trigger:fire([#evt_sworn_finish{times =
                                                       Finish},
                                 #evt_sworn_invite{times = Invite},
                                 #evt_sworn_defined_name{times = Personel},
                                 #evt_sworn_name{times = Prefix},
                                 #evt_sworn_skill{times = Skill}],
                                Role),
    NRole = rpaire_sworn(RoleEvt),
    {ok, NRole#role{s_event = NewEvent}};
login(Role = #role{pid = Pid, id = RoleId,
                   name = RoleName,
                   m_sworn = Sworn = #m_sworn{status = LastStatus},
                   s_event = Event, m_skill = MSkill}) ->
    #sworn_evt{finish = Finish, skill = Skill,
               invite = Invite, prefix = Prefix, personal = Personel} =
        fetch_evt(RoleId),
    RoleEvt = role_trigger:fire([#evt_sworn_finish{times =
                                                       Finish},
                                 #evt_sworn_invite{times = Invite},
                                 #evt_sworn_defined_name{times = Personel},
                                 #evt_sworn_name{times = Prefix},
                                 #evt_sworn_skill{times = Skill}],
                                Role),
    case fetch_role(RoleId) of
        #sworn_role{id = SwornId, name = Name,
                    name_defined = NameDefined, status = 1} ->
            {ok,
             RoleEvt#role{m_sworn =
                              Sworn#m_sworn{id = SwornId, name = Name,
                                            name_defined = NameDefined,
                                            status = 1}}};
        #sworn_role{id = SwornId, status = 2, name = Name,
                    name_defined = NameDefined} ->
            NewEvent = case Event of
                           40 -> 0;
                           _ -> Event
                       end,
            case fetch(SwornId) of
                #sworn{members = Members} = SwornL ->
                    case lists:keyfind(RoleId,
                                       #sworn_member.role_id,
                                       Members)
                        of
                        #sworn_member{name = OldName} = Member
                            when OldName =/= RoleName ->
                            Members1 = lists:keystore(RoleId,
                                                      #sworn_member.role_id,
                                                      Members,
                                                      Member#sworn_member{name =
                                                                              RoleName}),
                            role:pack_send(Pid,
                                           17700,
                                           {SwornL#sworn{members = Members1}}),
                            save(SwornL#sworn{members = Members1});
                        _ -> ok
                    end;
                _ -> ok
            end,
            case Name of
                "" ->
                    NewRole = case honor:del(RoleEvt, 11085, push) of
                                  {ok, Role1} -> Role1;
                                  _ -> RoleEvt
                              end,
                    delete_role(RoleId),
                    {ok,
                     NewRole#role{m_sworn =
                                      Sworn#m_sworn{id = {0, "", 0}, name = "",
                                                    name_defined = "",
                                                    status = 0},
                                  s_event = NewEvent,
                                  m_skill = MSkill#m_skill{skill_sworn = []}}};
                _ ->
                    case LastStatus of
                        2 ->
                            {ok,
                             Role#role{m_sworn =
                                           Sworn#m_sworn{name = Name,
                                                         name_defined =
                                                             NameDefined}}};
                        _ ->
                            honor:add_and_use(Pid, [11085], push),
                            SkillSworn = [{83010, 1}, {83011, 1}],
                            {ok,
                             RoleEvt#role{m_sworn =
                                              Sworn#m_sworn{name = Name,
                                                            name_defined =
                                                                NameDefined,
                                                            status = 2},
                                          s_event = NewEvent,
                                          m_skill =
                                              MSkill#m_skill{skill_sworn =
                                                                 SkillSworn}}}
                    end
            end;
        #sworn_role{status = 4} ->
            NewRole = case honor:del(RoleEvt, 11085, push) of
                          {ok, Role1} -> Role1;
                          _ -> RoleEvt
                      end,
            role:apply(async,
                       self(),
                       {friend_zone, update, [sworn, ""]}),
            {ok,
             NewRole#role{m_sworn =
                              #m_sworn{id = {0, "", 0}, name = "",
                                       name_defined = "", status = 4},
                          m_skill = MSkill#m_skill{skill_sworn = []}}};
        _ ->
            NewEvent = case Event of
                           40 -> 0;
                           _ -> Event
                       end,
            NewRole = case honor:del(RoleEvt, 11085, push) of
                          {ok, Role1} -> Role1;
                          _ -> RoleEvt
                      end,
            role:apply(async,
                       self(),
                       {friend_zone, update, [sworn, ""]}),
            {ok,
             NewRole#role{s_event = NewEvent,
                          m_sworn =
                              #m_sworn{id = {0, "", 0}, status = 0, name = "",
                                       name_defined = ""},
                          m_skill = MSkill#m_skill{skill_sworn = []}}}
    end.

rpaire_sworn(Role = #role{id = RoleId,
                          m_sworn = MSworn = #m_sworn{status = 2}}) ->
    case fetch_role(RoleId) of
        #sworn_role{id = SwornId, status = 2} ->
            Role#role{m_sworn = MSworn#m_sworn{id = SwornId}};
        _ -> Role
    end;
rpaire_sworn(Role) -> Role.

update(#role{m_sworn = #m_sworn{id = {0, _P, _Z}}},
       _Lev) ->
    ok;
update(Role, Lev) ->
    Data = convert(Role),
    sworn ! {update, Data, Lev}.

npc(Role = #role{m_team =
                     #m_team{pid = Pid, status = Status}})
    when is_pid(Pid) andalso Status =:= 1 ->
    team:send(Role, 17713, {});
npc(Role = #role{m_sworn = #m_sworn{}}) ->
    role:pack_send(Role, 17713, {}).

get_skill(#role{m_skill =
                    #m_skill{skill_sworn = SkillSworn}}) ->
    SkillSworn;
get_skill(_) -> [].

start(Role = #role{id = RoleId, m_sworn = MSworn,
                   m_team = #m_team{pid = Pid, status = Status}})
    when is_pid(Pid) andalso Status =:= 1 ->
    Members = team:get_members(Role),
    Result = case check_start([leader,
                               team,
                               wedding,
                               role,
                               intimacy],
                              Role,
                              Members)
                 of
                 ok -> ok;
                 {false, Reason} -> {false, Reason}
             end,
    case Result of
        ok ->
            case catch gen_server:call(sworn,
                                       {start, convert(Role), Members})
                of
                {ok, SwornId} ->
                    [save(#sworn_role{role_id = Id, id = SwornId,
                                      status = 1})
                     || #team_mate{id = Id} <- Members],
                    [role:apply(async, Id, {sworn, start_cb, [SwornId]})
                     || #team_mate{id = Id} <- Members],
                    save(#sworn_role{role_id = RoleId, id = SwornId,
                                     status = 1}),
                    {ok, Role#role{m_sworn = MSworn#m_sworn{id = SwornId}}};
                {false, Msg} -> {false, Msg};
                _ -> {false, lang:get("系统繁忙,请稍后重试")}
            end;
        {false, Msg} -> {false, Msg}
    end;
start(_Role = #role{m_team = #m_team{pid = Pid}})
    when is_pid(Pid) ->
    {false, lang:get("等待队长发起结拜吧{face_1,26}")};
start(_Role) ->
    {false, lang:get("结拜需要2-5人组队进行{face_1,26}")}.

start_confirm(#role{m_sworn = #m_sworn{id = {0, _, _}}},
              _Flag) ->
    {false, lang:get("有玩家拒绝投票,本次结拜已取消")};
start_confirm(Role = #role{id = RoleId, name = Name,
                           m_sworn = #m_sworn{id = SwornId}},
              Flag) ->
    case role_cond:check([#condition{label = coin, op = ge,
                                     val = 1000000}],
                         Role)
        of
        true ->
            case catch gen_server:call(sworn,
                                       {start_confirm, convert(Role), Flag})
                of
                {ok, Msg} -> {ok, Msg};
                {false, Reason} -> {false, Reason};
                _ -> {false, lang:get("系统繁忙,请稍后再试")}
            end;
        _ ->
            case fetch(SwornId) of
                #sworn{} = Sworn ->
                    broadcast(Sworn,
                              RoleId,
                              notice:format(lang:get("~ts{assets_2,90000}不足1000000，无法结拜{face_1,14}"),
                                            [{role_2, Name}]));
                _ -> ignore
            end,
            {false,
             lang:get("您的{assets_2,90000}不足1000000，无法参与结拜{face_1,28}")}
    end.

combat_start(Role = #role{m_team =
                              #m_team{pid = Pid, status = Status},
                          m_sworn = #m_sworn{id = SwornId}})
    when is_pid(Pid) andalso Status =:= 1 ->
    Result = case team:get_fighters(Role) of
                 {ok, Mates} -> {ok, Mates};
                 Else -> Else
             end,
    case Result of
        {ok, TeamMates} ->
            case catch gen_server:call(sworn,
                                       {check_combat_start, convert(Role)})
                of
                ok ->
                    {ok, Unit} = unit_convert:to(unit, 73040),
                    _Res = combat_mgr:start_combat(49,
                                                   TeamMates,
                                                   Unit,
                                                   #combat_start_args{ext_args =
                                                                          SwornId,
                                                                      max_guard
                                                                          = 0}),
                    team:send(Role, 17708, {1, lang:get("结拜试炼，宠物和守护不能出战")}),
                    {ok, lang:get("")};
                {false, Msg} -> {false, Msg}
            end;
        {false, Msg} -> {false, Msg}
    end;
combat_start(_Role) ->
    {false, lang:get("等待队长发起结拜吧{face_1,26}")}.

vote(Role, OtherRoleId, Pos) ->
    case catch gen_server:call(sworn,
                               {vote_pos, convert(Role), OtherRoleId, Pos})
        of
        {ok, Msg} -> {ok, Msg};
        {false, Reason} -> {false, Reason};
        _ -> {false, lang:get("系统繁忙,请稍后再试")}
    end.

name_first(Role = #role{m_team =
                            #m_team{pid = Pid, status = Status}},
           {NameHead, NameTail})
    when is_pid(Pid) andalso Status =:= 1 ->
    case check_first_name(NameHead, NameTail) of
        ok ->
            case catch gen_server:call(sworn,
                                       {name_first,
                                        convert(Role),
                                        {NameHead, NameTail}})
                of
                {ok, Msg} -> {ok, Msg};
                {false, Reason} -> {false, Reason};
                _ -> {false, lang:get("系统繁忙,请稍后再试")}
            end;
        {false, Reason} -> {false, Reason}
    end;
name_first(_Role, _Name) ->
    {false, lang:get("结拜称号必须要队长才能设置")}.

name_second(Role, Name) ->
    case check_second_name(Name, "") of
        ok ->
            case catch gen_server:call(sworn,
                                       {name_second, convert(Role), Name})
                of
                {ok, Msg} -> {ok, Msg};
                {false, Reason} -> {false, Reason};
                _ -> {false, lang:get("系统繁忙,请稍后再试")}
            end;
        {false, Reason} -> {false, Reason}
    end.

name_first_update(Role, {NameHead, NameTail}) ->
    case check_first_name(NameHead, NameTail) of
        ok ->
            Gold = loss_get(Role, prefix),
            Loss = format:val_to_loss([{90002, Gold}]),
            case role_gain:do_notice(Loss, Role) of
                {ok, NewRole} ->
                    case catch gen_server:call(sworn,
                                               {name_first_update,
                                                convert(Role),
                                                {NameHead, NameTail}})
                        of
                        {ok, Msg} -> {ok, NewRole, Msg};
                        {_, timeout} -> {ok, NewRole, lang:get("")};
                        {false, Reason} -> {false, Reason};
                        _ -> {false, lang:get("系统繁忙,请稍后再试")}
                    end;
                {false, #loss{msg = Msg}} -> {false, Msg}
            end;
        {false, Reason} -> {false, Reason}
    end.

name_first_vote(Role, Flag) ->
    case catch gen_server:call(sworn,
                               {name_first_vote, convert(Role), Flag})
        of
        {ok, Msg} -> {ok, Msg};
        {_, timeout} -> {ok, lang:get("")};
        {false, Reason} -> {false, Reason};
        _ -> {false, lang:get("系统繁忙,请稍后再试")}
    end.

name_second_update(Role = #role{m_sworn =
                                    #m_sworn{name_defined = NameDefined}},
                   Name) ->
    case check_second_name(Name, NameDefined) of
        ok ->
            Coin = loss_get(Role, personal),
            Loss = format:val_to_loss([{90000, Coin}]),
            case role_gain:do_notice(Loss, Role) of
                {ok, NewRole} ->
                    case catch gen_server:call(sworn,
                                               {name_second_update,
                                                convert(Role),
                                                Name})
                        of
                        {ok, Msg} -> {ok, Msg, NewRole};
                        {_, timeout} -> {ok, lang:get(""), NewRole};
                        {false, Reason} -> {false, Reason};
                        _ -> {false, lang:get("系统繁忙,请稍后再试")}
                    end;
                {false, #loss{msg = Msg}} -> {false, Msg}
            end;
        {false, Reason} -> {false, Reason}
    end.

agreement(Role, Flag) ->
    case catch gen_server:call(sworn,
                               {agreement, convert(Role), Flag})
        of
        {ok, Msg} -> {ok, Msg};
        {false, Reason} -> {false, Reason};
        _ -> {false, lang:get("系统繁忙,请稍后再试")}
    end.

invite(#role{m_sworn = #m_sworn{id = {0, _P, _Z}}},
       _OtherRoleId, _OtherRoleName) ->
    {false, lang:get("您还未结拜,不能邀请其他玩家加入")};
invite(Role = #role{name = Name,
                    m_sworn =
                        #m_sworn{id = {Id, Platform, ZoneId} = SwornId}},
       OtherRoleId, _OtherRoleName) ->
    case fetch(SwornId) of
        #sworn{status = 9, lists = Lists} = Sworn ->
            Result = case role_query:local_cache(by_id, OtherRoleId)
                         of
                         {ok, #role_cache{} = Cache} -> {ok, Cache};
                         _R -> {false, lang:get("该玩家不在线,不能邀请该好友")}
                     end,
            Now = date:unixtime2(),
            NewList = check_lists_timeout(Lists, [], Now),
            NewSworn = Sworn#sworn{lists = NewList},
            case Result of
                {ok, #role_cache{name = OtherRoleName1} = RoleCache} ->
                    case check_invited(OtherRoleId,
                                       OtherRoleName1,
                                       NewSworn)
                        of
                        ok ->
                            case catch gen_server:call(sworn,
                                                       {invite,
                                                        convert(Role),
                                                        RoleCache})
                                of
                                {ok, #sworn{name = SwornName}} ->
                                    role:pack_send(OtherRoleId,
                                                   17717,
                                                   {Id,
                                                    Platform,
                                                    ZoneId,
                                                    SwornName,
                                                    Name}),
                                    {ok, lang:get("已发送邀请,等待玩家确认")};
                                {false, Reason} -> {false, Reason}
                            end;
                        {false, Reason} -> {false, Reason}
                    end;
                {false, Reason} -> {false, Reason}
            end;
        {false, Reason} -> {false, Reason};
        _ -> {false, lang:get("系统繁忙,请稍后再试")}
    end.

invite_reply(Role = #role{id = RoleId}, SwornId,
             Flag) ->
    Loss = format:val_to_loss([{90000, 1000000}]),
    case role_gain:do_notice(Loss, Role) of
        {ok, Role1} ->
            case catch gen_server:call(sworn,
                                       {invite_reply,
                                        convert(Role),
                                        SwornId,
                                        Flag})
                of
                {ok, Msg} ->
                    save(#sworn_role{id = SwornId, role_id = RoleId,
                                     status = 3}),
                    logger:debug("============~w", [SwornId], sworn, 466),
                    {ok,
                     Msg,
                     Role1#role{m_sworn =
                                    #m_sworn{id = SwornId, status = 3}}};
                {false, Reason} -> {false, Reason};
                _ -> {false, lang:get("系统繁忙,请稍后再试")}
            end;
        {false, #loss{msg = _Msg}} ->
            catch gen_server:call(sworn,
                                  {invite_reply, convert(Role), SwornId, 0}),
            {false,
             notice:format(lang:get("您的（~ts）不足，无法加入结拜"),
                           [{assets_2, 90000}])}
    end.

vote_type(Role, Type, OtherRoleId, Flag) ->
    case catch gen_server:call(sworn,
                               {vote_type,
                                convert(Role),
                                Type,
                                OtherRoleId,
                                Flag})
        of
        {ok, Msg} -> {ok, Msg};
        {false, Reason} -> {false, Reason};
        _ -> {false, lang:get("系统繁忙,请稍后再试")}
    end.

please_leave(Role = #role{id = OtherRoleId},
             OtherRoleId, _ReasonId, _ReasonMsg) ->
    case catch gen_server:call(sworn,
                               {leave, convert(Role)})
        of
        {ok, Msg} -> {ok, Msg};
        {false, Reason} -> {false, Reason};
        _ -> {false, lang:get("系统繁忙,请稍后再试")}
    end;
please_leave(Role, OtherRoleId, ReasonId, ReasonMsg) ->
    case catch gen_server:call(sworn,
                               {please_leave,
                                convert(Role),
                                OtherRoleId,
                                ReasonId,
                                ReasonMsg})
        of
        {ok, Msg} -> {ok, Msg};
        {false, Reason} -> {false, Reason};
        _ -> {false, lang:get("系统繁忙,请稍后再试")}
    end.

check_start([], _Role, _Members) -> ok;
check_start([leader | T], Role, Members) ->
    case check_leader(Role) of
        ok -> check_start(T, Role, Members);
        {false, Reason} -> {false, Reason}
    end;
check_start([team | _T], _Role, []) ->
    {false, lang:get("结拜需要2-5人组队进行{face_1,26}")};
check_start([team | T], Role, Members) ->
    case check_team(Members) of
        ok -> check_start(T, Role, Members);
        {false, Reason} -> {false, Reason}
    end;
check_start([intimacy | T], Role, Members) ->
    case check_intimacy(Role, Members) of
        ok -> check_start(T, Role, Members);
        {false, Reason} -> {false, Reason}
    end;
check_start([wedding | T], Role, Members) ->
    case check_wedding(Role, Members) of
        ok -> check_start(T, Role, Members);
        {false, Reason} -> {false, Reason}
    end;
check_start([role | T], Role, Members) ->
    case check_roles(Members) of
        ok -> check_start(T, Role, Members);
        {false, Reason} -> {false, Reason}
    end.

check_invited(_RoleId, _RoleName, #sworn{num = Num})
    when Num >= 10 ->
    {false, lang:get("已达人数上限")};
check_invited(RoleId, RoleName,
              #sworn{members = Members, trends = Trends,
                     lists = Lists}) ->
    case lists:keyfind(RoleId,
                       #sworn_member.role_id,
                       Members)
        of
        false ->
            Trends1 = [Trend
                       || #sworn_trend{type = Type} = Trend <- Trends,
                          Type =:= 1],
            Lists1 = [L
                      || #sworn_trend{type = Type} = L <- Lists, Type =:= 1],
            case length(Members) + length(Trends1) + length(Lists1)
                     < 10
                of
                true -> check_invited(RoleId, RoleName, Members);
                _ -> {false, lang:get("邀请人数已达上限,无法继续邀请")}
            end;
        _ -> {false, lang:get("该玩家已经是该结拜团体成员,不需要再次邀请")}
    end;
check_invited(RoleId, RoleName, Members) ->
    case check_invited([wedding], Members, RoleId, RoleName)
        of
        ok ->
            case role:apply(sync,
                            RoleId,
                            {sworn, check_role, [[id, lev, loss]]})
                of
                ok ->
                    case check_invited([intimacy],
                                       Members,
                                       RoleId,
                                       RoleName)
                        of
                        ok -> ok;
                        {false, Msg} -> {false, Msg}
                    end;
                {false, Msg} -> {false, Msg};
                _ -> {false, lang:get("该玩家不在线,不能邀请")}
            end;
        {false, Msg} -> {false, Msg}
    end.

check_invited([], _Members, _RoleId, _RoleName) -> ok;
check_invited([intimacy | T], Members, RoleId,
              RoleName) ->
    case check_invited_intimacy(Members,
                                RoleId,
                                RoleName,
                                "")
        of
        {ok, []} -> check_invited(T, Members, RoleId, RoleName);
        {ok, List} ->
            Reason = case List of
                         [Name1] ->
                             notice:format(lang:get("~ts与~ts亲密度不足300"),
                                           [{role_2, Name1},
                                            {role_2, RoleName}]);
                         [Name1, Name2] ->
                             notice:format(lang:get("~ts、~ts与~ts亲密度不足300"),
                                           [{role_2, Name1},
                                            {role_2, Name2},
                                            {role_2, RoleName}]);
                         [Name1, Name2, Name3] ->
                             notice:format(lang:get("~ts、~ts、~ts与~ts亲密度不足300"),
                                           [{role_2, Name1},
                                            {role_2, Name2},
                                            {role_2, Name3},
                                            {role_2, RoleName}]);
                         [Name1, Name2, Name3, Name4] ->
                             notice:format(lang:get("~ts、~ts、~ts、~ts与~ts亲密度不足300"),
                                           [{role_2, Name1},
                                            {role_2, Name2},
                                            {role_2, Name3},
                                            {role_2, Name4},
                                            {role_2, RoleName}]);
                         [Name1, Name2, Name3, Name4, Name5 | _] ->
                             notice:format(lang:get("~ts、~ts、~ts、~ts、~ts与~ts亲密度不足300"),
                                           [{role_2, Name1},
                                            {role_2, Name2},
                                            {role_2, Name3},
                                            {role_2, Name4},
                                            {role_2, Name5},
                                            {role_2, RoleName}])
                     end,
            {false, Reason}
    end;
check_invited([wedding | T], Members, RoleId,
              RoleName) ->
    case check_invited_wedding(Members, RoleId, RoleName) of
        ok -> check_invited(T, Members, RoleId, RoleName);
        {false, Msg} -> {false, Msg}
    end.

check_invited_intimacy([], _Id, _Name, List) ->
    {ok, List};
check_invited_intimacy([#sworn_member{role_id = Id,
                                      name = Name}
                        | T],
                       RoleId, RoleName, List) ->
    case friend:get_intimacy(Id, RoleId) of
        Intimacy when Intimacy >= 300 ->
            check_invited_intimacy(T, RoleId, RoleName, List);
        _R ->
            check_invited_intimacy(T,
                                   RoleId,
                                   RoleName,
                                   [Name | List])
    end.

check_invited_wedding([], _Id, _Name) -> ok;
check_invited_wedding([#sworn_member{role_id = Id,
                                     name = Name}
                       | T],
                      RoleId, RoleName) ->
    case wedding:lover(RoleId) of
        {ok, #lover{lover_id = Id}} ->
            {false,
             notice:format(lang:get("~ts与~ts是夫妻关系,不能结拜{face_1, 30}"),
                           [{role_2, Name}, {role_2, RoleName}])};
        _ -> check_invited_wedding(T, RoleId, RoleName)
    end.

check_role(_Role, []) -> {ok, ok};
check_role(#role{name = Name,
                 m_sworn = #m_sworn{id = _Id}} =
               Role,
           [loss | Label]) ->
    case role_cond:check([#condition{label = coin, op = ge,
                                     val = 1000000}],
                         Role)
        of
        true -> check_role(Role, Label);
        _ ->
            role:pack_send(Role,
                           9902,
                           {1,
                            "您的{assets_2,90000}不足1000000，无法参与结拜{face_1,28}",
                            []}),
            {ok,
             {false,
              notice:format(lang:get("~ts{assets_2,90000}不足1000000，无法结拜{face_1,14}"),
                            [{role_2, Name}])}}
    end;
check_role(#role{name = Name, id = RoleId,
                 m_sworn = #m_sworn{id = _Id}} =
               Role,
           [loss_role_id | Label]) ->
    case role_cond:check([#condition{label = coin, op = ge,
                                     val = 1000000}],
                         Role)
        of
        true -> check_role(Role, Label);
        _ ->
            role:pack_send(Role,
                           9902,
                           {1,
                            "您的{assets_2,90000}不足1000000，无法参与结拜{face_1,28}",
                            []}),
            {ok,
             {false,
              RoleId,
              notice:format(lang:get("~ts{assets_2,90000}不足1000000，无法结拜{face_1,14}"),
                            [{role_2, Name}])}}
    end;
check_role(#role{lev = Lev, name = Name} = Role,
           [lev | Label]) ->
    case Lev >= 50 of
        true -> check_role(Role, Label);
        _ ->
            {ok,
             {false,
              notice:format(lang:get("玩家~ts等级不足~ts级，不能参与结拜{face_1,21}"),
                            [{role_2, Name}, {string_2, 5, 50}])}}
    end;
check_role(#role{m_sworn =
                     #m_sworn{id = {Id, _Platform, _ZoneId}},
                 name = Name} =
               Role,
           [id | Label]) ->
    case Id =:= 0 of
        true -> check_role(Role, Label);
        _ ->
            {ok,
             {false,
              notice:format(lang:get("~ts已经结拜或者与其他玩家正在结拜,无法再次结拜"),
                            [{role_2, Name}])}}
    end.

check_roles([]) -> ok;
check_roles([Role | T]) when is_record(Role, role) ->
    case check_role(Role, [id, lev, loss]) of
        {ok, {false, Msg}} -> {false, Msg};
        _ -> check_roles(T)
    end;
check_roles([{_, Role, _} | T]) ->
    case check_role(Role, [id, lev, loss]) of
        {ok, {false, Msg}} -> {false, Msg};
        _ -> check_roles(T)
    end;
check_roles([#team_mate{id = Id} | T]) ->
    case role:apply(sync,
                    Id,
                    {sworn, check_role, [[id, lev, loss]]})
        of
        ok -> check_roles(T);
        {false, Msg} -> {false, Msg};
        _ -> {false, lang:get("系统繁忙")}
    end;
check_roles([#sworn_member{role_id = RoleId} | T]) ->
    case role:apply(sync,
                    RoleId,
                    {sworn, check_role, [[loss_role_id]]})
        of
        ok -> check_roles(T);
        {false, Msg} -> {false, Msg};
        {false, RoleId1, Msg} -> {false, RoleId1, Msg};
        _ -> {false, lang:get("系统繁忙")}
    end.

check_leader(#role{lev = Lev}) when Lev < 50 ->
    {false, lang:get("等级不知50级,无法结拜")};
check_leader(#role{m_team =
                       #m_team{pid = Pid, status = Status}})
    when is_pid(Pid) andalso Status =/= 1 ->
    {false, lang:get("只有队长能操作")};
check_leader(Role) ->
    case role_cond:check([#condition{label = coin, op = ge,
                                     val = 1000000}],
                         Role)
        of
        true -> ok;
        _ ->
            {false,
             lang:get("您的{assets_2,90000}不足1000000，不能发起结拜{face_1,28}")}
    end.

check_team([]) -> ok;
check_team([#team_mate{status = 2} | T]) ->
    check_team(T);
check_team([#team_mate{name = Name} | _]) ->
    {false,
     notice:format(lang:get("请~ts归队后再来结拜吧{face_1,2}"),
                   [{role_2, Name}])}.

check_intimacy(#role{id = RoleId, name = Name},
               TeamMates) ->
    check_intimacy([#team_mate{id = RoleId, name = Name}
                    | TeamMates]).

check_intimacy([]) -> ok;
check_intimacy([_]) -> ok;
check_intimacy([TeamMate | T]) ->
    case do_check_intimacy(TeamMate, T) of
        ok -> check_intimacy(T);
        {false, Msg} -> {false, Msg}
    end.

do_check_intimacy(_Mate, []) -> ok;
do_check_intimacy(Mate = #team_mate{id = Id,
                                    name = Name},
                  [#team_mate{id = RId, name = RName} | T]) ->
    case friend:get_intimacy(Id, RId) of
        Intimacy when Intimacy >= 300 ->
            do_check_intimacy(Mate, T);
        _ ->
            {false,
             notice:format(lang:get("~ts和~ts的亲密度未到达300,无法结拜"),
                           [{role_2, Name}, {role_2, RName}])}
    end.

check_wedding(#role{id = RoleId, name = Name},
              TeamMates) ->
    check_wedding([#team_mate{id = RoleId, name = Name}
                   | TeamMates]).

check_wedding([]) -> ok;
check_wedding([_]) -> ok;
check_wedding([TeamMate | T]) ->
    case do_check_wedding(TeamMate, T) of
        ok -> check_wedding(T);
        {false, Msg} -> {false, Msg}
    end.

do_check_wedding(_TeamMate, []) -> ok;
do_check_wedding(Mate = #team_mate{id = Id,
                                   name = Name},
                 [#team_mate{id = RId, name = RName} | T]) ->
    case wedding:lover(Id) of
        {ok, #lover{lover_id = RId}} ->
            {false,
             notice:format(lang:get("~ts与~ts是夫妻关系,不能结拜{face_1, 30}"),
                           [{role_2, Name}, {role_2, RName}])};
        _ -> do_check_wedding(Mate, T)
    end.

combat_over(#combat{start_args =
                        #combat_start_args{ext_args = SwornId},
                    winner = Winner}) ->
    case [F || #fighter{type = 1} = F <- Winner] of
        [] -> ok;
        _ -> sworn ! {combat_over, Winner, SwornId}
    end,
    ok;
combat_over(_) -> ok.

start_link() ->
    gen_server:start_link({local, sworn}, sworn, [], []).

init([]) ->
    logger:info("开始启动...", [], sworn, 758),
    process_flag(trap_exit, true),
    init_root_dir(),
    dets:open_file(sworn,
                   [{file, "./dets/sworn.dets"},
                    {keypos, #sworn.id},
                    {type, set}]),
    dets:open_file(sworn_role,
                   [{file, "./dets/sworn_role.dets"},
                    {keypos, #sworn_role.role_id},
                    {type, set}]),
    dets:open_file(sworn_evt,
                   [{file, "./dets/sworn_evt.dets"},
                    {keypos, #sworn_evt.role_id},
                    {type, set}]),
    ets:new(sworn,
            [set, named_table, public, {keypos, #sworn.id}]),
    ets:new(sworn_role,
            [set,
             named_table,
             public,
             {keypos, #sworn_role.role_id}]),
    ets:new(sworn_evt,
            [set,
             named_table,
             public,
             {keypos, #sworn_evt.role_id}]),
    dets:to_ets(sworn_evt, sworn_evt),
    dets:to_ets(sworn_role, sworn_role),
    dets:traverse(sworn,
                  fun (#sworn{id = SwornId} = Sworn) ->
                          update_sworn_id(SwornId),
                          ets:insert(sworn, Sworn),
                          timer_ref_add(Sworn),
                          continue
                  end),
    case env:get(sworn_env_list) of
        [_ | _] ->
            erlang:send_after(13 * 1000, self(), sworn_compensate);
        _ -> ignore
    end,
    evt_init(),
    case get(max_sworn_id) of
        MaxId when is_integer(MaxId) ->
            logger:info("[~w] 启动完成", [sworn], sworn, 786),
            State1 = #state{next_id = MaxId + 1},
            {ok, State1};
        undefined ->
            logger:info("[~w] 启动完成", [sworn], sworn, 790),
            {ok, #state{next_id = 1}}
    end.

handle_call({start,
             #{id := RoleId, lev := Lev, sex := Sex, name := Name,
               classes := Classes},
             TeamMates},
            _From, #state{next_id = IdNext} = State) ->
    logger:debug("结拜信息初始化", [], sworn, 796),
    Members = to_member(TeamMates),
    Member = #sworn_member{role_id = RoleId, name = Name,
                           sex = Sex, classes = Classes, lev = Lev},
    Members1 = [Member | Members],
    logger:debug("结拜信息 ~w", [length(Members)], sworn, 800),
    SwornId = {IdNext, env:get(platform), env:get(zone_id)},
    Sworn = #sworn{id = SwornId, num = length(Members1),
                   votes = [RoleId], members = Members1, status = 1,
                   pos = 0, name = "", timeout = date:unixtime() + 30},
    [save(#sworn_role{role_id = RoleId1, id = SwornId,
                      status = 1})
     || #sworn_member{role_id = RoleId1} <- Members],
    save(Sworn),
    broadcast(Sworn),
    sworn_env_add(SwornId),
    timer_ref_add(SwornId, 30, {start_timeout, SwornId}),
    {reply,
     {ok, SwornId},
     State#state{next_id = IdNext + 1}};
handle_call({start_confirm,
             #{id := RoleId, name := Name, sworn_id := SwornId},
             Flag},
            _From, State) ->
    logger:debug("是否确定结拜  ~w",
                 [{SwornId, RoleId, Flag}],
                 sworn,
                 811),
    Reply = case fetch(SwornId) of
                #sworn{status = 1, num = Num, votes = Votes} = Sworn ->
                    case lists:member(RoleId, Votes) of
                        false ->
                            case Flag of
                                1 ->
                                    broadcast(Sworn,
                                              RoleId,
                                              notice:format(lang:get("~ts同意加入结拜"),
                                                            [{role_2, Name}])),
                                    save(Sworn#sworn{votes = [RoleId | Votes]}),
                                    case length(Votes) + 1 >= Num of
                                        true ->
                                            timer_ref_add(SwornId,
                                                          0,
                                                          {start_confirm_timeout,
                                                           SwornId});
                                        _ -> ignore
                                    end,
                                    {ok,
                                     notice:format(lang:get("~ts同意加入结拜"),
                                                   [{role_2, Name}])};
                                _ ->
                                    broadcast(Sworn,
                                              RoleId,
                                              notice:format(lang:get("~ts~ts加入结拜"),
                                                            [{role_2, Name},
                                                             {string_2,
                                                              5,
                                                              lang:get("拒绝")}])),
                                    timer_ref_add(SwornId,
                                                  0,
                                                  {start_confirm_timeout,
                                                   SwornId}),
                                    {false,
                                     notice:format(lang:get("~ts~ts加入结拜"),
                                                   [{role_2, Name},
                                                    {string_2,
                                                     5,
                                                     lang:get("拒绝")}])}
                            end;
                        _ -> {false, lang:get("您已确定结拜,不需要重复确定")}
                    end;
                _R -> {false, lang:get("结拜确认已结束")}
            end,
    {reply, Reply, State};
handle_call({check_combat_start,
             Role = #{id := RoleId, sworn_id := SwornId,
                      pid := Pid}},
            _From, State) ->
    Reply = case fetch(SwornId) of
                #sworn{status = 2, members = Members} ->
                    TeamMate = team:get_members(#role{id = RoleId,
                                                      m_team =
                                                          #m_team{pid = Pid}}),
                    case check_team_mate([Role | TeamMate], Members) of
                        ok -> ok;
                        {false, Reason} -> {false, Reason}
                    end;
                _R -> {false, lang:get("当前状态不能开始试炼")}
            end,
    {reply, Reply, State};
handle_call({vote_pos,
             #{id := RoleId, name := Name, sworn_id := SwornId},
             OtherRoleId,
             Pos},
            _From, State) ->
    Reply = case fetch(SwornId) of
                #sworn{status = 4, num = Num, pos = PosNow} = Sworn
                    when Pos =:= PosNow ->
                    case check_vote(RoleId, OtherRoleId, Sworn) of
                        {ok, Sworn1 = #sworn{votes = VoteList1}} ->
                            save(Sworn1),
                            broadcast(Sworn1),
                            broadcast(Sworn1,
                                      RoleId,
                                      notice:format(lang:get("~ts已投票"),
                                                    [{role_2, Name}])),
                            case length(VoteList1) >= Num of
                                true ->
                                    timer_ref_add(SwornId,
                                                  0,
                                                  {vote_pos_timeout, SwornId});
                                _ -> ignore
                            end,
                            {ok, lang:get("投票成功，请稍候")};
                        {false, Reason} -> {false, Reason}
                    end;
                #sworn{status = 4} ->
                    {false, lang:get("该位置已投完,请投票另一个位置")};
                _R ->
                    logger:debug("投票状态错误 ~w", [_R], sworn, 873),
                    {false, lang:get("当前没有票可投,不能投票")}
            end,
    {reply, Reply, State};
handle_call({name_first,
             #{id := RoleId, sworn_id := SwornId},
             {NameHead, NameTail}},
            _From, State) ->
    Reply = case fetch(SwornId) of
                #sworn{status = 5, members = Members, num = Num,
                       name = ""} =
                    Sworn ->
                    case lists:keyfind(RoleId,
                                       #sworn_member.role_id,
                                       Members)
                        of
                        #sworn_member{} ->
                            NameFirst = num_name_get(Num, NameHead, NameTail),
                            NewSworn = Sworn#sworn{name = NameFirst,
                                                   lists =
                                                       [{name,
                                                         NameHead,
                                                         NameTail}]},
                            save(NewSworn),
                            timer_ref_add(SwornId,
                                          0,
                                          {name_first_timeout, SwornId}),
                            {ok, lang:get("结拜称号设置成功")};
                        _ ->
                            logger:debug("不是该结拜团 没有权限", [], sworn, 887),
                            {false, lang:get("没有该权限")}
                    end;
                #sworn{status = 5} -> {false, lang:get("已经设置,不可重复设置")};
                _ ->
                    logger:debug("当前状态不可已设置结拜称号", [], sworn, 892),
                    {false, lang:get("当前状态不可已设置结拜称号")}
            end,
    {reply, Reply, State};
handle_call({name_second,
             #{id := RoleId, name := RoleName, sworn_id := SwornId},
             NameSecond},
            _From, State) ->
    Reply = case fetch(SwornId) of
                #sworn{status = 6, members = Members, votes = Votes,
                       num = Num, name = SwornName} =
                    Sworn ->
                    case lists:keyfind(RoleId,
                                       #sworn_member.role_id,
                                       Members)
                        of
                        #sworn_member{name_defined = "", pos = Pos} = Member ->
                            NameSecond1 = pos_name_get(Pos, NameSecond),
                            NewMember = lists:keystore(RoleId,
                                                       #sworn_member.role_id,
                                                       Members,
                                                       Member#sworn_member{name_defined
                                                                               =
                                                                               NameSecond}),
                            NewSworn = Sworn#sworn{members = NewMember,
                                                   votes = [RoleId | Votes]},
                            save(NewSworn),
                            broadcast(NewSworn),
                            case length(Votes) + 1 =:= Num of
                                true ->
                                    timer_ref_add(SwornId,
                                                  0,
                                                  {name_second_timeout,
                                                   SwornId});
                                _ -> ignore
                            end,
                            SwornName1 = util:flist(lang:get("~ts之~ts"),
                                                    [SwornName, NameSecond1]),
                            broadcast(Sworn,
                                      RoleId,
                                      notice:format("~ts~ts称号为~ts",
                                                    [{string_2,
                                                      5,
                                                      pos_name_get(Pos)},
                                                     {role_2, RoleName},
                                                     {string_2,
                                                      5,
                                                      SwornName1}])),
                            {ok,
                             notice:format(lang:get("您的称号为~ts"),
                                           [{string_2, 5, SwornName1}])};
                        #sworn_member{} -> {ok, lang:get("你已设过自定义称号,不能再次设置")};
                        _ -> {false, lang:get("没有结拜数据")}
                    end;
                _ -> {false, lang:get("当前状态不可已设置自定义称号")}
            end,
    {reply, Reply, State};
handle_call({name_first_update,
             #{id := RoleId, name := Name, sworn_id := SwornId},
             {NameHead, NameTail}},
            _From, State) ->
    Reply = case fetch(SwornId) of
                #sworn{status = 9, trends = Trends, num = Num,
                       lists = Lists, members = Members} =
                    Sworn ->
                    Result = case lists:keyfind(name, 1, Lists) of
                                 {name, NameHead, NameTail} ->
                                     {false, lang:get("称号相同，无需修改")};
                                 _ -> ok
                             end,
                    case Result of
                        ok ->
                            case lists:keyfind(3, #sworn_trend.type, Trends) of
                                false ->
                                    Rename = num_name_get(Num,
                                                          NameHead,
                                                          NameTail),
                                    SwornTrend = #sworn_trend{agree = 1,
                                                              votes =
                                                                  [{RoleId, 1}],
                                                              time =
                                                                  date:unixtime(),
                                                              timeout =
                                                                  date:unixtime()
                                                                      + 86400,
                                                              type = 3,
                                                              id = RoleId,
                                                              name = Name,
                                                              rename = Rename,
                                                              lists =
                                                                  [{name,
                                                                    NameHead,
                                                                    NameTail}]},
                                    NewSworn = Sworn#sworn{trends =
                                                               [SwornTrend
                                                                | Trends]},
                                    save(NewSworn),
                                    broadcast(NewSworn),
                                    timer_ref_add(NewSworn),
                                    #sworn_member{pos = Pos} =
                                        lists:keyfind(RoleId,
                                                      #sworn_member.role_id,
                                                      Members),
                                    PosName = pos_name_get(Pos),
                                    Content =
                                        notice:format(lang:get("~ts~ts将结拜称号前缀修改为~ts，请前往[关系-结拜]投票表态吧{face_1,7}"),
                                                      [{string_2, 5, PosName},
                                                       {role_2, Name},
                                                       {string_2, 5, Rename}]),
                                    [mail:send(RoleId1,
                                               lang:get("结拜名称变更"),
                                               Content)
                                     || #sworn_member{role_id = RoleId1}
                                            <- Members],
                                    {ok, lang:get("发起投票成功")};
                                _ -> {false, lang:get("已经有玩家发起重命名投票,不能重复操作")}
                            end;
                        {false, Reason} -> {false, Reason}
                    end;
                _ -> {false, lang:get("当前状态不可以修改结拜称号")}
            end,
    {reply, Reply, State};
handle_call({name_first_vote,
             #{id := RoleId, sworn_id := SwornId},
             Flag},
            _From, State) ->
    Reply = case fetch(SwornId) of
                #sworn{status = 9, trends = Trends, num = Num} =
                    Sworn ->
                    case lists:keyfind(3, #sworn_trend.type, Trends) of
                        #sworn_trend{votes = Votes, agree = Agree} = Trend ->
                            case lists:keyfind(RoleId, 1, Votes) of
                                false ->
                                    Agree1 = case Flag of
                                                 1 -> Agree + 1;
                                                 _ -> Agree
                                             end,
                                    NewTrend = case Agree1 >= Num / 2 of
                                                   true ->
                                                       Trend#sworn_trend{agree =
                                                                             Agree1,
                                                                         votes =
                                                                             [{RoleId,
                                                                               Flag}
                                                                              | Votes],
                                                                         timeout
                                                                             =
                                                                             date:unixtime()};
                                                   _ ->
                                                       case length(Votes) + 1 >=
                                                                Num
                                                           of
                                                           true ->
                                                               Trend#sworn_trend{agree
                                                                                     =
                                                                                     Agree1,
                                                                                 votes
                                                                                     =
                                                                                     [{RoleId,
                                                                                       Flag}
                                                                                      | Votes],
                                                                                 timeout
                                                                                     =
                                                                                     date:unixtime()};
                                                           _ ->
                                                               Trend#sworn_trend{agree
                                                                                     =
                                                                                     Agree1,
                                                                                 votes
                                                                                     =
                                                                                     [{RoleId,
                                                                                       Flag}
                                                                                      | Votes]}
                                                       end
                                               end,
                                    NewSworn = Sworn#sworn{trends =
                                                               lists:keystore(3,
                                                                              #sworn_trend.type,
                                                                              Trends,
                                                                              NewTrend)},
                                    save(NewSworn),
                                    broadcast(NewSworn),
                                    timer_ref_add(NewSworn),
                                    {ok, lang:get("投票成功")};
                                _ -> {false, lang:get("您已投过票,不能重复投票")}
                            end;
                        _ -> {false, lang:get("该投票已过期")}
                    end;
                _ -> {false, lang:get("当前状态不可以修改结拜称号")}
            end,
    {reply, Reply, State};
handle_call({name_second_update,
             #{id := RoleId, sworn_id := SwornId},
             Rename},
            _From, State) ->
    Reply = case fetch(SwornId) of
                #sworn{status = 9, members = Members} = Sworn ->
                    case lists:keytake(RoleId,
                                       #sworn_member.role_id,
                                       Members)
                        of
                        {value,
                         #sworn_member{pos = Pos, times = Times, free = Free,
                                       name_defined = NameLast} =
                             Member,
                         Members1} ->
                            case Rename of
                                NameLast -> {false, "自定义称号相同，无需修改"};
                                _ ->
                                    Times1 = case Free of
                                                 1 -> Times;
                                                 _ -> Times + 1
                                             end,
                                    Rename1 = pos_name_get(Pos, Rename),
                                    Member1 = Member#sworn_member{name_defined =
                                                                      Rename,
                                                                  times =
                                                                      Times1,
                                                                  free = 0},
                                    update_role(RoleId, name_defined, Rename1),
                                    save(Sworn#sworn{members =
                                                         [Member1 | Members1]}),
                                    sworn_evt(RoleId, defined_name),
                                    broadcast(Sworn#sworn{members =
                                                              [Member1
                                                               | Members1]}),
                                    {ok, lang:get("改名成功")}
                            end;
                        _ -> {false, lang:get("结拜数据错误")}
                    end;
                _ -> {false, lang:get("当前状态不可以修改结拜称号")}
            end,
    {reply, Reply, State};
handle_call({agreement,
             #{id := RoleId, name := RoleName, sworn_id := SwornId},
             _Flag},
            _From, State) ->
    Reply = case fetch(SwornId) of
                #sworn{status = 7, votes = Votes, num = Num,
                       members = Members} =
                    Sworn ->
                    case lists:member(RoleId, Votes) of
                        true -> {false, lang:get("结拜契约已签订")};
                        _ ->
                            Pos1 = case lists:keyfind(RoleId,
                                                      #sworn_member.role_id,
                                                      Members)
                                       of
                                       #sworn_member{pos = Pos} -> Pos;
                                       _ -> 1
                                   end,
                            Sworn1 = Sworn#sworn{votes = [RoleId | Votes]},
                            save(Sworn1),
                            broadcast(Sworn1),
                            case length(Votes) + 1 >= Num of
                                true ->
                                    timer_ref_add(SwornId,
                                                  2,
                                                  {agreement_timeout, SwornId});
                                _ -> ignore
                            end,
                            broadcast(Sworn,
                                      RoleId,
                                      notice:format("~ts~ts已完成契约",
                                                    [{string_2,
                                                      5,
                                                      pos_name_get(Pos1)},
                                                     {role_2, RoleName}])),
                            {ok, lang:get("结拜契约签订成功")}
                    end;
                _ -> {false, lang:get("当前状态不可以签订结拜契约")}
            end,
    {reply, Reply, State};
handle_call({invite,
             Role = #{id := RoleId, name := Name,
                      sworn_id := SwornId},
             #role_cache{id = OtherRoleId, name = OtherRoleName,
                         sex = Sex, classes = Classes, lev = Lev}},
            _From, State) ->
    Reply = case fetch(SwornId) of
                #sworn{status = 9, lists = Lists} = Sworn ->
                    case check([invite], Role, OtherRoleId, Sworn) of
                        ok ->
                            Trend = #sworn_trend{type = 1, id = RoleId,
                                                 name = Name,
                                                 r_id = OtherRoleId,
                                                 r_name = OtherRoleName,
                                                 r_lev = Lev,
                                                 r_classes = Classes,
                                                 r_sex = Sex,
                                                 time = date:unixtime(),
                                                 timeout =
                                                     date:unixtime() + 30},
                            NewSworn = Sworn#sworn{lists =
                                                       lists:keystore(1,
                                                                      #sworn_trend.type,
                                                                      Lists,
                                                                      Trend)},
                            save(NewSworn),
                            {ok, NewSworn};
                        {false, Reason} -> {false, Reason}
                    end;
                _ -> {false, lang:get("当前状态不可以邀请好友加入")}
            end,
    {reply, Reply, State};
handle_call({invite_reply,
             Role = #{id := RoleId, name := RoleName, lev := Lev,
                      sex := Sex, classes := Classes},
             SwornId,
             Flag},
            _From, State) ->
    Reply = case fetch(SwornId) of
                #sworn{status = 9, trends = Trends, lists = Lists,
                       name = SwornName, members = Members} =
                    Sworn ->
                    case check([invited], Role, RoleId, Sworn) of
                        ok ->
                            #sworn_trend{id = Id, name = Name} =
                                lists:keyfind(RoleId, #sworn_trend.r_id, Lists),
                            case Flag of
                                1 ->
                                    Trend = #sworn_trend{agree = 1,
                                                         votes = [{Id, 1}],
                                                         id = Id, name = Name,
                                                         r_id = RoleId,
                                                         r_name = RoleName,
                                                         type = 1, r_lev = Lev,
                                                         r_sex = Sex,
                                                         r_classes = Classes,
                                                         time = date:unixtime(),
                                                         timeout =
                                                             date:unixtime() +
                                                                 86400},
                                    NewSworn = Sworn#sworn{lists =
                                                               lists:keydelete(RoleId,
                                                                               #sworn_trend.r_id,
                                                                               Lists),
                                                           trends =
                                                               [Trend
                                                                | Trends]},
                                    save(NewSworn),
                                    broadcast(NewSworn),
                                    notice:send(Id,
                                                1,
                                                notice:format(lang:get("~ts已同意加入结拜，请留意投票信息"),
                                                              [{role_2,
                                                                RoleName}])),
                                    [mail:send(MRoleId,
                                               lang:get("结拜新成员加入"),
                                               notice:format(lang:get("~ts邀请~ts加入~ts，请在[关系-结拜]界面投票支持吧{face_1,18}"),
                                                             [{role_2, Name},
                                                              {role_2,
                                                               RoleName},
                                                              {string_2,
                                                               5,
                                                               SwornName}]))
                                     || #sworn_member{role_id = MRoleId}
                                            <- Members],
                                    timer_ref_add(NewSworn),
                                    {ok, lang:get("等待结拜成员投票通过即可加入{face_1,18}")};
                                _ ->
                                    NewSworn = Sworn#sworn{lists =
                                                               lists:keydelete(RoleId,
                                                                               #sworn_trend.r_id,
                                                                               Lists)},
                                    save(NewSworn),
                                    notice:send(Id,
                                                1,
                                                notice:format(lang:get("~ts拒绝加入结拜"),
                                                              [{role_2,
                                                                RoleName}])),
                                    {false, lang:get("你拒绝了邀请")}
                            end;
                        {false, Reason} -> {false, Reason}
                    end;
                _ -> {false, lang:get("")}
            end,
    {reply, Reply, State};
handle_call({vote_type,
             Role = #{id := RoleId, sworn_id := SwornId},
             Type,
             OtherRoleId,
             _Flag},
            _From, State)
    when Type =:= 4 ->
    Reply = case fetch(SwornId) of
                #sworn{status = 9, trends = Trends} = Sworn ->
                    case check([{vote_type, Type}],
                               Role,
                               OtherRoleId,
                               Sworn)
                        of
                        ok ->
                            case RoleId =:= OtherRoleId of
                                true ->
                                    Trends1 = [T
                                               || T = #sworn_trend{type = Type1}
                                                      <- Trends,
                                                  Type1 =:= Type],
                                    Trends2 = [T
                                               || T = #sworn_trend{type = Type1}
                                                      <- Trends,
                                                  Type1 =/= Type],
                                    Trends3 = lists:keydelete(OtherRoleId,
                                                              #sworn_trend.r_id,
                                                              Trends1)
                                                  ++ Trends2,
                                    NewSworn = Sworn#sworn{trends = Trends3},
                                    save(NewSworn),
                                    broadcast(NewSworn),
                                    {false, lang:get("取消成功")};
                                _ -> {false, lang:get("该动态不是你的,不能处理")}
                            end;
                        {false, Reason} -> {false, Reason}
                    end;
                _ -> {false, lang:get("当前状态不能取消")}
            end,
    {reply, Reply, State};
handle_call({vote_type,
             Role = #{id := RoleId, sworn_id := SwornId},
             Type,
             OtherRoleId,
             Flag},
            _From, State) ->
    Reply = case fetch(SwornId) of
                #sworn{status = 9, trends = Trends, num = Num} =
                    Sworn ->
                    case check([{vote_type, Type}],
                               Role,
                               OtherRoleId,
                               Sworn)
                        of
                        ok ->
                            Trends1 = [Trend
                                       || Trend = #sworn_trend{type = T}
                                              <- Trends,
                                          T =:= Type],
                            Trends2 = [Trend
                                       || Trend = #sworn_trend{type = T}
                                              <- Trends,
                                          T =/= Type],
                            Trend = #sworn_trend{votes = Votes, agree = Agree} =
                                        lists:keyfind(OtherRoleId,
                                                      #sworn_trend.r_id,
                                                      Trends1),
                            Agree1 = case Flag of
                                         1 -> Agree + 1;
                                         _ -> Agree
                                     end,
                            Trend1 = case Agree1 >= Num / 2 of
                                         true ->
                                             Trend#sworn_trend{agree = Agree1,
                                                               votes =
                                                                   [{RoleId,
                                                                     Flag}
                                                                    | Votes],
                                                               timeout =
                                                                   date:unixtime()};
                                         _ ->
                                             case length(Votes) + 1 >= Num of
                                                 true ->
                                                     Trend#sworn_trend{agree =
                                                                           Agree1,
                                                                       votes =
                                                                           [{RoleId,
                                                                             Flag}
                                                                            | Votes],
                                                                       timeout =
                                                                           date:unixtime()};
                                                 _ ->
                                                     Trend#sworn_trend{agree =
                                                                           Agree1,
                                                                       votes =
                                                                           [{RoleId,
                                                                             Flag}
                                                                            | Votes]}
                                             end
                                     end,
                            Trends3 = lists:keystore(OtherRoleId,
                                                     #sworn_trend.r_id,
                                                     Trends1,
                                                     Trend1),
                            NewSworn = Sworn#sworn{trends = Trends3 ++ Trends2},
                            save(NewSworn),
                            broadcast(NewSworn),
                            timer_ref_add(NewSworn),
                            {ok, lang:get("你已成功投出一票")};
                        {false, Reason} -> {false, Reason}
                    end;
                _ -> {false, lang:get("当前状态不可以投票")}
            end,
    {reply, Reply, State};
handle_call({please_leave,
             Role = #{id := RoleId, name := Name,
                      sworn_id := SwornId},
             OtherRoleId,
             ReasonId,
             ReasonMsg},
            _From, State) ->
    Reply = case fetch(SwornId) of
                #sworn{status = 9, trends = Trends, members = Members} =
                    Sworn ->
                    case check([member_other, please_leave],
                               Role,
                               OtherRoleId,
                               Sworn)
                        of
                        ok ->
                            #sworn_member{name = OtherRoleName} =
                                lists:keyfind(OtherRoleId,
                                              #sworn_member.role_id,
                                              Members),
                            Trend = #sworn_trend{agree = 1,
                                                 votes = [{RoleId, 1}],
                                                 id = RoleId, name = Name,
                                                 r_id = OtherRoleId,
                                                 r_name = OtherRoleName,
                                                 reason_id = ReasonId,
                                                 reason_msg = ReasonMsg,
                                                 type = 2,
                                                 time = date:unixtime(),
                                                 timeout =
                                                     date:unixtime() + 86400},
                            NewSworn = Sworn#sworn{trends = [Trend | Trends]},
                            save(NewSworn),
                            broadcast(NewSworn),
                            timer_ref_add(NewSworn),
                            {ok, lang:get("已发起投票，请耐心等待结果")};
                        {false, Reason} -> {false, Reason}
                    end;
                _ -> {false, lang:get("当前状态不可以请离操作")}
            end,
    {reply, Reply, State};
handle_call({leave,
             Role = #{classes := Classes, sex := Sex, lev := Lev,
                      id := RoleId, name := Name, sworn_id := SwornId}},
            _From, State) ->
    Reply = case fetch(SwornId) of
                #sworn{status = 9, trends = Trends} = Sworn ->
                    case check([member, leave], Role, RoleId, Sworn) of
                        ok ->
                            Trend = #sworn_trend{id = RoleId, name = Name,
                                                 r_id = RoleId, r_name = Name,
                                                 r_classes = Classes,
                                                 r_lev = Lev, r_sex = Sex,
                                                 type = 4,
                                                 time = date:unixtime(),
                                                 timeout =
                                                     date:unixtime() + 86400},
                            NewSworn = Sworn#sworn{trends = [Trend | Trends]},
                            save(NewSworn),
                            broadcast(NewSworn),
                            timer_ref_add(NewSworn),
                            {ok, lang:get("24小时内可取消退出，再考虑一下吧{face_1,21}")};
                        {false, Reason} -> {false, Reason}
                    end;
                _ -> {false, lang:get("当前状态不可以退出结拜")}
            end,
    {reply, Reply, State};
handle_call(_Request, _From, State) -> {noreply, State}.

handle_cast(_Msg, State) -> {noreply, State}.

handle_info({start_timeout, SwornId}, State) ->
    case fetch(SwornId) of
        #sworn{members = Members, status = 1} ->
            [delete_role(RoleId)
             || #sworn_member{role_id = RoleId} <- Members],
            delete(SwornId);
        _ -> logger:debug("试炼结束出错啦", [], sworn, 1194)
    end,
    {noreply, State};
handle_info({combat_over, _Winner, SwornId}, State) ->
    case fetch(SwornId) of
        #sworn{members = Members} = Sworn ->
            [role:apply(async,
                        RoleId,
                        {sworn, combat_over_cb, [SwornId]})
             || #sworn_member{role_id = RoleId} <- Members],
            Sworn1 = Sworn#sworn{status = 4, pos = 1, name = "",
                                 timeout = date:unixtime() + 300},
            save(Sworn1),
            broadcast(Sworn1),
            timer_ref_add(SwornId,
                          300,
                          {vote_pos_timeout, SwornId});
        _ -> logger:error("试炼超时 ~w", [SwornId], sworn, 1207)
    end,
    {noreply, State};
handle_info({start_confirm_timeout, SwornId}, State) ->
    case fetch(SwornId) of
        #sworn{status = 1, votes = Votes, num = Num,
               members = Members} =
            Sworn ->
            case length(Votes) =:= Num of
                true ->
                    case check_roles(Members) of
                        ok ->
                            [role:apply(async, RoleId, {sworn, sworn_loss, []})
                             || #sworn_member{role_id = RoleId} <- Members],
                            Sworn1 = Sworn#sworn{status = 2, pos = 1, name = "",
                                                 timeout =
                                                     date:unixtime() + 3600,
                                                 votes = []},
                            save(Sworn1),
                            broadcast(Sworn1),
                            timer_ref_add(SwornId,
                                          3600,
                                          {end_confirm_timeout, SwornId});
                        Else ->
                            case Else of
                                {false, Reason} ->
                                    broadcast(Sworn, {0, "", 0}, Reason);
                                {false, LossRoleId, Reason} ->
                                    broadcast(Sworn, LossRoleId, Reason)
                            end,
                            [delete_role(RoleId)
                             || #sworn_member{role_id = RoleId} <- Members],
                            delete(SwornId)
                    end;
                _ ->
                    [delete_role(RoleId)
                     || #sworn_member{role_id = RoleId} <- Members],
                    delete(SwornId),
                    ok
            end;
        _ -> logger:error("投票超时错误 ~w", [SwornId], sworn, 1239)
    end,
    {noreply, State};
handle_info({end_confirm_timeout, SwornId}, State) ->
    logger:debug("试炼超时 ~w", [SwornId], sworn, 1243),
    case fetch(SwornId) of
        #sworn{status = 2, members = Members} ->
            [delete_role(RoleId)
             || #sworn_member{role_id = RoleId} <- Members],
            delete(SwornId),
            Title = lang:get("结拜资金返还"),
            Content =
                lang:get("在规定时间内您未能通过结拜试炼，现返还80%结拜资金。建议询问结拜NPC布莱恩<color"
                         "='#00ff00'>结拜试炼攻略</color>，齐心协力、共克难关{face_1,6}"
                         ""),
            [mail:send(RoleId, Title, Content, [{90000, 800000}])
             || #sworn_member{role_id = RoleId} <- Members],
            ok;
        _ -> logger:error("投票超时错误 ~w", [SwornId], sworn, 1253)
    end,
    {noreply, State};
handle_info({vote_pos_timeout, SwornId}, State) ->
    case fetch(SwornId) of
        #sworn{pos = PosNow, status = 4, lists = Lists,
               members = Members, num = Num} =
            Sworn ->
            RoleId = case Lists of
                         [] ->
                             RoleIds = [RoleId
                                        || #sworn_member{pos = Pos,
                                                         role_id = RoleId}
                                               <- Members,
                                           Pos =:= 0],
                             util:rand_list(RoleIds);
                         _ -> cal_vote(Lists)
                     end,
            Member = #sworn_member{name = RoleName} =
                         lists:keyfind(RoleId, #sworn_member.role_id, Members),
            Members1 = lists:keystore(RoleId,
                                      #sworn_member.role_id,
                                      Members,
                                      Member#sworn_member{pos = PosNow}),
            case Lists of
                [] ->
                    broadcast(Sworn,
                              notice:format(lang:get("投票超时，~ts自动当选~ts"),
                                            [{role_2, RoleName},
                                             {string_2,
                                              5,
                                              pos_name_get(PosNow)}]));
                _ ->
                    broadcast(Sworn,
                              notice:format(lang:get("~ts由大家投票成为~ts"),
                                            [{role_2, RoleName},
                                             {string_2,
                                              5,
                                              pos_name_get(PosNow)}]))
            end,
            case PosNow + 2 > Num of
                true ->
                    Members2 = case lists:keyfind(0,
                                                  #sworn_member.pos,
                                                  Members1)
                                   of
                                   #sworn_member{role_id = RoleIdLast,
                                                 name = RoleName2} =
                                       MemberLast ->
                                       broadcast(Sworn,
                                                 notice:format(lang:get("~ts自动成为~ts"),
                                                               [{role_2,
                                                                 RoleName2},
                                                                {string_2,
                                                                 5,
                                                                 pos_name_get(Num)}])),
                                       lists:keystore(RoleIdLast,
                                                      #sworn_member.role_id,
                                                      Members1,
                                                      MemberLast#sworn_member{pos
                                                                                  =
                                                                                  Num});
                                   _ -> Members1
                               end,
                    logger:debug("投票超时 倒数第二个 不需要再次投票 ~w",
                                 [{length(Members2), PosNow, Num, Members2}],
                                 sworn,
                                 1284),
                    NewSworn = Sworn#sworn{members = Members2, status = 5,
                                           timeout = date:unixtime() + 1800,
                                           pos = 0, votes = [], lists = []},
                    save(NewSworn),
                    broadcast(NewSworn),
                    timer_ref_add(SwornId,
                                  1800,
                                  {name_first_timeout, SwornId});
                _ ->
                    NewSworn = Sworn#sworn{pos = PosNow + 1,
                                           members = Members1, votes = [],
                                           lists = [], time = date:unixtime(),
                                           timeout = date:unixtime() + 300},
                    save(NewSworn),
                    broadcast(NewSworn),
                    timer_ref_add(SwornId, 300, {vote_pos_timeout, SwornId})
            end;
        _ -> logger:error("投票超时错误 ~w", [SwornId], sworn, 1296)
    end,
    {noreply, State};
handle_info({name_first_timeout, SwornId}, State) ->
    logger:debug("称号前缀超时 ~w", [SwornId], sworn, 1300),
    case fetch(SwornId) of
        #sworn{status = 5, name = Name, num = Num,
               lists = Lists} =
            Sworn ->
            NameHead = util:rand_list([lang:get("星辰"),
                                       lang:get("时空"),
                                       lang:get("翡翠"),
                                       lang:get("天涯"),
                                       lang:get("光辉")]),
            NameTail = util:rand_list([lang:get("帅"),
                                       lang:get("神"),
                                       lang:get("虎"),
                                       lang:get("怪"),
                                       lang:get("杰"),
                                       lang:get("胖")]),
            Name1 = case Name of
                        "" ->
                            case Num of
                                2 ->
                                    util:flist([NameHead,
                                                lang:get("二"),
                                                NameTail]);
                                3 ->
                                    util:flist([NameHead,
                                                lang:get("三"),
                                                NameTail]);
                                4 ->
                                    util:flist([NameHead,
                                                lang:get("四"),
                                                NameTail]);
                                5 ->
                                    util:flist([NameHead,
                                                lang:get("五"),
                                                NameTail])
                            end;
                        _ -> Name
                    end,
            Lists1 = case lists:keyfind(name, 1, Lists) of
                         false -> [{name, NameHead, NameTail}];
                         _ -> Lists
                     end,
            NewSworn = Sworn#sworn{lists = Lists1, name = Name1,
                                   status = 6, time = date:unixtime(),
                                   timeout = date:unixtime() + 600},
            save(NewSworn),
            broadcast(NewSworn),
            timer_ref_add(SwornId,
                          600,
                          {name_second_timeout, SwornId});
        _ -> logger:error("称号超时错误 ~w", [SwornId], sworn, 1324)
    end,
    {noreply, State};
handle_info({name_second_timeout, SwornId}, State) ->
    case fetch(SwornId) of
        #sworn{status = 6, members = Members, lists = _Lists} =
            Sworn ->
            Fun = fun (#sworn_member{name_defined = Name,
                                     sex = Sex} =
                           Member,
                       Acc)
                          when Name =:= "" orelse Name =:= [] ->
                          logger:debug("自定义名字 没命名", [], sworn, 1331),
                          NameDefined1 = case Sex of
                                             1 -> lang:get("哥");
                                             _ -> lang:get("姐")
                                         end,
                          [Member#sworn_member{name_defined = NameDefined1}
                           | Acc];
                      (Member, Acc) -> [Member | Acc]
                  end,
            Members1 = lists:foldl(Fun, [], Members),
            NewSworn = Sworn#sworn{status = 7, members = Members1,
                                   timeout = date:unixtime() + 180, votes = []},
            save(NewSworn),
            broadcast(NewSworn),
            timer_ref_add(SwornId,
                          180,
                          {agreement_timeout, SwornId});
        _ ->
            logger:error("称号后缀超时出错啦? ~w", [SwornId], sworn, 1346)
    end,
    {noreply, State};
handle_info({agreement_timeout, SwornId}, State) ->
    case fetch(SwornId) of
        #sworn{status = 7, name = _Name, members = _Members} =
            Sworn ->
            NewSworn = Sworn#sworn{status = 8,
                                   timeout = date:unixtime() + 15,
                                   time = date:unixtime(), votes = []},
            save(NewSworn),
            broadcast(NewSworn),
            timer_ref_add(SwornId,
                          15,
                          {sworn_play_timeout, SwornId});
        _ ->
            logger:error("结拜契约超时错误啦 ~w", [SwornId], sworn, 1357)
    end,
    {noreply, State};
handle_info({sworn_play_timeout, SwornId}, State) ->
    case fetch(SwornId) of
        #sworn{status = 8, members = Members,
               name = SwornName} =
            Sworn ->
            NewSworn = Sworn#sworn{status = 9, timeout = 0,
                                   time = date:unixtime(), votes = []},
            [save(#sworn_role{role_id = RoleId, id = SwornId,
                              status = 2, name = SwornName,
                              name_defined = pos_name_get(Pos, NameDefined)})
             || #sworn_member{role_id = RoleId,
                              name_defined = NameDefined, pos = Pos}
                    <- Members],
            [role:apply(async,
                        RoleId,
                        {sworn,
                         sworn_over_cb,
                         [SwornName, pos_name_get(Pos, NameDefined)]})
             || #sworn_member{role_id = RoleId,
                              name_defined = NameDefined, pos = Pos}
                    <- Members],
            [sworn_evt(RoleId, finish)
             || #sworn_member{role_id = RoleId} <- Members],
            save(NewSworn),
            sworn_env_del(SwornId),
            sworn_success_mail_send(Members, SwornName),
            Members1 = lists:keysort(#sworn_member.pos, Members),
            Content = case Members1 of
                          [#sworn_member{name = Name1},
                           #sworn_member{name = Name2}] ->
                              notice:format(lang:get("~ts、~ts通过了重重试炼，终以~ts的名义完成结拜，愿他们以后能保持初心、相互帮扶{f"
                                                     "ace_1,38}"),
                                            [{role_2, Name1},
                                             {role_2, Name2},
                                             {role_2, SwornName}]);
                          [#sworn_member{name = Name1},
                           #sworn_member{name = Name2},
                           #sworn_member{name = Name3}] ->
                              notice:format(lang:get("~ts、~ts、~ts通过了重重试炼，终以~ts的名义完成结拜，愿他们以后能保持初心、相互"
                                                     "帮扶{face_1,38}"),
                                            [{role_2, Name1},
                                             {role_2, Name2},
                                             {role_2, Name3},
                                             {role_2, SwornName}]);
                          [#sworn_member{name = Name1},
                           #sworn_member{name = Name2},
                           #sworn_member{name = Name3},
                           #sworn_member{name = Name4}] ->
                              notice:format(lang:get("~ts、~ts、~ts、~ts通过了重重试炼，终以~ts的名义完成结拜，愿他们以后能保持初"
                                                     "心、相互帮扶{face_1,38}"),
                                            [{role_2, Name1},
                                             {role_2, Name2},
                                             {role_2, Name3},
                                             {role_2, Name4},
                                             {role_2, SwornName}]);
                          [#sworn_member{name = Name1},
                           #sworn_member{name = Name2},
                           #sworn_member{name = Name3},
                           #sworn_member{name = Name4},
                           #sworn_member{name = Name5}] ->
                              notice:format(lang:get("~ts、~ts、~ts、~ts、~ts通过了重重试炼，终以~ts的名义完成结拜，愿他们以后"
                                                     "能保持初心、相互帮扶{face_1,38}"),
                                            [{role_2, Name1},
                                             {role_2, Name2},
                                             {role_2, Name3},
                                             {role_2, Name4},
                                             {role_2, Name5},
                                             {role_2, SwornName}])
                      end,
            notice:cast(all, 5, Content),
            notice:cast(all, 11, Content),
            broadcast(NewSworn);
        _ -> logger:error("投票超时错误 ~w", [SwornId], sworn, 1385)
    end,
    {noreply, State};
handle_info({sworn_trend_timeout, SwornId}, State) ->
    case fetch(SwornId) of
        #sworn{trends = Trends} = Sworn ->
            Now = date:unixtime(),
            NewSworn = #sworn{members = Members} =
                           sworn_trend_timeout(Trends, Sworn, Now, []),
            case length(Members) > 1 of
                true ->
                    save(NewSworn),
                    broadcast(NewSworn),
                    timer_ref_add(NewSworn);
                _ ->
                    [begin
                         delete_role(RoleId),
                         mail:send(RoleId,
                                   lang:get("结拜解散通知"),
                                   lang:get("由于结拜成员均已退出，结拜团体将自动解散，期待你与兄弟们再创辉煌{face_1,16}"))
                     end
                     || #sworn_member{role_id = RoleId} <- Members],
                    delete(SwornId)
            end;
        _ ->
            logger:error("结拜动态超时处理 c错误 ~w", [SwornId], sworn, 1405)
    end,
    {noreply, State};
handle_info({update,
             #{id := RoleId, name := Name, classes := Classes,
               sex := Sex, sworn_id := SwornId},
             NewLev},
            State) ->
    case fetch(SwornId) of
        #sworn{members = Members} = Sworn ->
            case lists:keyfind(RoleId,
                               #sworn_member.role_id,
                               Members)
                of
                #sworn_member{} = Member ->
                    Members1 = lists:keystore(RoleId,
                                              #sworn_member.role_id,
                                              Members,
                                              Member#sworn_member{lev = NewLev,
                                                                  name = Name,
                                                                  classes =
                                                                      Classes,
                                                                  sex = Sex}),
                    role:pack_send(RoleId,
                                   17700,
                                   {Sworn#sworn{members = Members1}}),
                    save(Sworn#sworn{members = Members1});
                _ ->
                    logger:debug("更新个人信息错误 ~w",
                                 [{RoleId, SwornId}],
                                 sworn,
                                 1418)
            end;
        _ ->
            logger:error("更新个人信息错误 ~w",
                         [{SwornId, RoleId}],
                         sworn,
                         1421)
    end,
    {noreply, State};
handle_info(sworn_compensate, State) ->
    case env:get(sworn_env_list) of
        [_ | _] = List ->
            Fun = fun (SwornId) ->
                          case fetch(SwornId) of
                              #sworn{members = Members} ->
                                  [delete_role(RoleId)
                                   || #sworn_member{role_id = RoleId}
                                          <- Members],
                                  delete(SwornId);
                              _ -> logger:error("没数据啦?", [], sworn, 1433)
                          end
                  end,
            lists:foreach(Fun, List);
        _ -> logger:debug("没数据不需要", [], sworn, 1438)
    end,
    env:del(sworn_env_list),
    {noreply, State};
handle_info({update_evt, finish, RoleId}, State) ->
    SwornEvt = #sworn_evt{finish = Finish} =
                   fetch_evt(RoleId),
    save(SwornEvt#sworn_evt{finish = Finish + 1}),
    role_trigger:async_fire(RoleId,
                            #evt_sworn_finish{times = Finish + 1}),
    {noreply, State};
handle_info({update_evt, name, RoleId}, State) ->
    SwornEvt = #sworn_evt{prefix = Prefix} =
                   fetch_evt(RoleId),
    save(SwornEvt#sworn_evt{prefix = Prefix + 1}),
    role_trigger:async_fire(RoleId,
                            #evt_sworn_name{times = Prefix + 1}),
    {noreply, State};
handle_info({update_evt, defined_name, RoleId},
            State) ->
    SwornEvt = #sworn_evt{personal = Personal} =
                   fetch_evt(RoleId),
    save(SwornEvt#sworn_evt{personal = Personal + 1}),
    role_trigger:async_fire(RoleId,
                            #evt_sworn_defined_name{times = Personal + 1}),
    {noreply, State};
handle_info({update_evt, invite, RoleId}, State) ->
    SwornEvt = #sworn_evt{invite = Invite} =
                   fetch_evt(RoleId),
    save(SwornEvt#sworn_evt{invite = Invite + 1}),
    role_trigger:async_fire(RoleId,
                            #evt_sworn_invite{times = Invite + 1}),
    {noreply, State};
handle_info({update_evt, skill, RoleId}, State) ->
    SwornEvt = #sworn_evt{skill = Skill} =
                   fetch_evt(RoleId),
    save(SwornEvt#sworn_evt{skill = Skill + 1}),
    role_trigger:async_fire(RoleId,
                            #evt_sworn_skill{times = Skill + 1}),
    {noreply, State};
handle_info({del_role, SwornId, RoleId}, State) ->
    case fetch(SwornId) of
        #sworn{members = Members, lists = Lists, trends = T} =
            Sworn ->
            Members1 = lists:keydelete(RoleId,
                                       #sworn_member.role_id,
                                       Members),
            Members2 = member_refresh(Members1),
            SwornName = num_name_get(length(Members2), Lists),
            delete_role(RoleId),
            [update_role(RId, name, SwornName)
             || #sworn_member{role_id = RId} <- Members2],
            [update_role(RoleId1,
                         name_defined,
                         pos_name_get(Pos, NameDefined))
             || #sworn_member{role_id = RoleId1, pos = Pos,
                              name_defined = NameDefined}
                    <- Members2],
            T1 = sworn_trend_timeout_other(T, RoleId, 4),
            T2 = sworn_trend_timeout_other(T1, RoleId, 2),
            NewSworn = Sworn#sworn{name = SwornName,
                                   members = Members2, num = length(Members2),
                                   trends = T2},
            case length(Members2) > 1 of
                true ->
                    save(NewSworn),
                    broadcast(NewSworn),
                    timer_ref_add(NewSworn);
                _ ->
                    [begin
                         delete_role(RId),
                         mail:send(RId,
                                   lang:get("结拜解散通知"),
                                   lang:get("由于结拜成员均已退出，结拜团体将自动解散，期待你与兄弟们再创辉煌{face_1,16}"))
                     end
                     || #sworn_member{role_id = RId} <- Members2],
                    delete(SwornId)
            end,
            logger:info("删除结拜玩家成功", [], sworn, 1490);
        _ -> logger:info("改结拜ID不存在", [], sworn, 1492)
    end,
    {noreply, State};
handle_info(_Info, State) ->
    logger:debug("未处理信息~w", [_Info], sworn, 1496),
    {noreply, State}.

terminate(_Reason, _State) ->
    logger:info("[~w] 正在关闭...", [sworn], sworn, 1500),
    util:close_dets(sworn),
    util:close_dets(sworn_role),
    logger:info("[~w] 关闭完成", [sworn], sworn, 1503),
    ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

sworn_trend_timeout([], Sworn, _Now, NewTrends) ->
    Sworn#sworn{trends = NewTrends};
sworn_trend_timeout([#sworn_trend{timeout = Timeout,
                                  type = 1, id = InviteRoleId, r_id = RRoleId,
                                  r_name = RName, r_sex = RSex, r_lev = RLev,
                                  r_classes = RClasses, agree = Agree}
                     | T],
                    Sworn = #sworn{name = SwornNameLast, id = SwornId,
                                   num = Num, members = Members, lists = Lists},
                    Now, NewTrends)
    when Timeout =< Now ->
    Num1 = agree_num_get(Num),
    case Agree >= Num1 of
        true ->
            Title = lang:get("成功加入结拜"),
            Names = name_split_joint(Members),
            {name, NameHead, NameTail} = lists:keyfind(name,
                                                       1,
                                                       Lists),
            SwornName = num_name_get(Num + 1, NameHead, NameTail),
            Content =
                notice:format(lang:get("恭喜你成功加入结拜，从此~ts就是你的兄弟姐妹了。结拜称号为~ts，可前往【关系-结拜】面"
                                       "板设置{face_1,38}"),
                              [{string_1, Names}, {string_2, 5, SwornName}]),
            mail:send(RRoleId, Title, Content),
            NameDefined = pos_name_get(Num + 1, NameTail),
            save(#sworn_role{role_id = RRoleId, name = SwornName,
                             status = 2, name_defined = NameDefined,
                             id = SwornId}),
            role:apply(async,
                       RRoleId,
                       {sworn, sworn_over_cb, [SwornName, NameDefined]}),
            [update_role(RoleId, name, SwornName)
             || #sworn_member{role_id = RoleId} <- Members,
                RoleId =/= RRoleId],
            sworn_evt(InviteRoleId, invite),
            sworn_evt(RRoleId, finish),
            [mail:send(RoleId,
                       lang:get("欢迎新兄弟加入"),
                       notice:format(lang:get("~ts正式加入~ts，从此以后就是~ts啦，齐心协力、让威名响彻星辰大陆吧{face_1,29}"),
                                     [{role_2, RName},
                                      {string_2, 5, SwornNameLast},
                                      {string_2, 5, SwornName}]))
             || #sworn_member{role_id = RoleId} <- Members],
            Member = #sworn_member{role_id = RRoleId, name = RName,
                                   name_defined = NameTail, lev = RLev,
                                   sex = RSex, classes = RClasses,
                                   pos = Num + 1, free = 0},
            Members1 = lists:keystore(RRoleId,
                                      #sworn_member.role_id,
                                      Members,
                                      Member),
            sworn_trend_timeout(T,
                                Sworn#sworn{members = Members1, num = Num + 1,
                                            name = SwornName},
                                Now,
                                NewTrends);
        _ ->
            Title = lang:get("结拜资金返还"),
            Names = name_split_joint(Members),
            Content =
                notice:format(lang:get("很遗憾未能通过结拜称投票，建议您多与~ts沟通相处，这是返还给您的结拜资金，请查收{fac"
                                       "e_1,3}"),
                              [{string_1, Names}]),
            mail:send(RRoleId, Title, Content, [{90000, 1000000}]),
            delete_role(RRoleId),
            sworn_trend_timeout(T, Sworn, Now, NewTrends)
    end;
sworn_trend_timeout([#sworn_trend{timeout = Timeout,
                                  type = 2, r_id = RRoleId, agree = Agree,
                                  reason_msg = Reason}
                     | T],
                    Sworn = #sworn{name = Name, num = Num,
                                   members = Members, lists = Lists},
                    Now, NewTrends)
    when Timeout =< Now ->
    Num1 = agree_num_get(Num),
    case Agree >= Num1 of
        true ->
            Title = lang:get("退出结拜通知"),
            Content =
                notice:format(lang:get("由于~ts，您被请离出~ts{face_1,14}"),
                              [{string_2, 5, Reason}, {string_2, 5, Name}]),
            mail:send(RRoleId, Title, Content),
            Members1 = lists:keydelete(RRoleId,
                                       #sworn_member.role_id,
                                       Members),
            Members2 = member_refresh(Members1),
            update_role(RRoleId, status, 2),
            SwornName = num_name_get(length(Members2), Lists),
            [update_role(RoleId, name, SwornName)
             || #sworn_member{role_id = RoleId} <- Members2],
            [update_role(RoleId,
                         name_defined,
                         pos_name_get(Pos, NameDefined))
             || #sworn_member{role_id = RoleId, pos = Pos,
                              name_defined = NameDefined}
                    <- Members2],
            T1 = sworn_trend_timeout_other(T, RRoleId, 4),
            NewTrends1 = sworn_trend_timeout_other(NewTrends,
                                                   RRoleId,
                                                   4),
            sworn_trend_timeout(T1,
                                Sworn#sworn{name = SwornName,
                                            members = Members2,
                                            num = length(Members2)},
                                Now,
                                NewTrends1);
        _ -> sworn_trend_timeout(T, Sworn, Now, NewTrends)
    end;
sworn_trend_timeout([#sworn_trend{timeout = Timeout,
                                  type = 3, id = RRoleId, name = RRoleName,
                                  rename = _ReName, agree = Agree,
                                  lists = NameLists}
                     | T],
                    Sworn = #sworn{times = Times, num = Num,
                                   members = Members, lists = Lists},
                    Now, NewTrends)
    when Timeout =< Now ->
    {NameHead, NameTail, Flag} = case lists:keyfind(name,
                                                    1,
                                                    NameLists)
                                     of
                                     {name, NameHead0, NameTail0} ->
                                         {NameHead0, NameTail0, 1};
                                     _R ->
                                         logger:error("改名出现错误啦 ~w",
                                                      [_R],
                                                      sworn,
                                                      1563),
                                         {lang:get("星辰"), lang:get("帅"), 0}
                                 end,
    Num1 = agree_num_get(Num),
    case Agree >= Num1 andalso Flag =:= 1 of
        true ->
            ReName = num_name_get(Num, NameHead, NameTail),
            [begin
                 update_role(RoleId, name, ReName),
                 mail:send(RoleId,
                           lang:get("结拜称号变更"),
                           notice:format(lang:get("~ts修改结拜称号为~ts，已通过大家投票{face_1,52}"),
                                         [{role_2, RRoleName},
                                          {string_2, 5, ReName}]))
             end
             || #sworn_member{role_id = RoleId} <- Members],
            sworn_evt(RRoleId, name),
            sworn_trend_timeout(T,
                                Sworn#sworn{times = Times + 1, name = ReName,
                                            lists =
                                                lists:keystore(name,
                                                               1,
                                                               Lists,
                                                               {name,
                                                                NameHead,
                                                                NameTail})},
                                Now,
                                NewTrends);
        _ ->
            {Prefix, _Personal} = loss_data_get(Times + 1),
            mail:send(RRoleId,
                      lang:get("结拜称号变更"),
                      lang:get("您修改的结拜称号未能通过大家投票，现返还80%改名资金，建议先与成员沟通、再作修改{fac"
                               "e_1,6}"),
                      [{90002, util:ceil(Prefix * 8.0e-1)}]),
            sworn_trend_timeout(T, Sworn, Now, NewTrends)
    end;
sworn_trend_timeout([#sworn_trend{timeout = Timeout,
                                  type = 4, id = RoleId, agree = _Agree,
                                  r_name = RRoleName}
                     | T],
                    Sworn = #sworn{name = LSwornName, members = Members,
                                   num = _Num, lists = Lists},
                    Now, NewTrends)
    when Timeout =< Now ->
    Members1 = lists:keydelete(RoleId,
                               #sworn_member.role_id,
                               Members),
    Members2 = member_refresh(Members1),
    SwornName = num_name_get(length(Members2), Lists),
    delete_role(RoleId),
    mail:send(RoleId,
              lang:get("退出结拜"),
              notice:format(lang:get("经过24小时的深思熟虑，您还是离开了~ts，不要忘记兄弟们，常联系哟{face_1,21}"),
                            [{string_2, 5, LSwornName}])),
    [update_role(RId, name, SwornName)
     || #sworn_member{role_id = RId} <- Members2],
    [update_role(RoleId1,
                 name_defined,
                 pos_name_get(Pos, NameDefined))
     || #sworn_member{role_id = RoleId1, pos = Pos,
                      name_defined = NameDefined}
            <- Members2],
    [mail:send(RoleId1,
               lang:get("结拜成员变动"),
               notice:format(lang:get("~ts经过24小时深思熟虑，最终还是离开了~ts，好兄弟常联系哟{face_1,54}"),
                             [{role_2, RRoleName}, {string_2, 5, LSwornName}]))
     || #sworn_member{role_id = RoleId1} <- Members2],
    T1 = sworn_trend_timeout_other(T, RoleId, 2),
    NewTrends1 = sworn_trend_timeout_other(NewTrends,
                                           RoleId,
                                           2),
    sworn_trend_timeout(T1,
                        Sworn#sworn{name = SwornName, members = Members2,
                                    num = length(Members2)},
                        Now,
                        NewTrends1);
sworn_trend_timeout([Trend | T], Sworn, Now,
                    NewTrends) ->
    sworn_trend_timeout(T, Sworn, Now, [Trend | NewTrends]).

sworn_trend_timeout_other(T, RoleId, Type) ->
    T1 = [Trend
          || Trend = #sworn_trend{r_id = ToRoleId, type = ToType}
                 <- T,
             ToRoleId =:= RoleId andalso ToType =:= Type],
    logger:debug("=被清除动态列表=~w", [T1], sworn, 1596),
    T -- T1.

member_refresh(Members) ->
    member_refresh(lists:seq(1, length(Members)),
                   lists:keysort(#sworn_member.pos, Members),
                   []).

member_refresh([], _, NewMembers) -> NewMembers;
member_refresh([Pos | PosList], [Member | Members],
               NewMembers) ->
    member_refresh(PosList,
                   Members,
                   [Member#sworn_member{pos = Pos} | NewMembers]).

sworn_evt(RoleId, finish) ->
    sworn ! {update_evt, finish, RoleId};
sworn_evt(RoleId, name) ->
    sworn ! {update_evt, name, RoleId};
sworn_evt(RoleId, defined_name) ->
    sworn ! {update_evt, defined_name, RoleId};
sworn_evt(RoleId, invite) ->
    sworn ! {update_evt, invite, RoleId};
sworn_evt(RoleId = {_Id, Platform, ZoneId}, skill) ->
    big_world:cast(Platform,
                   ZoneId,
                   sworn,
                   sworn_evt,
                   [RoleId, skill_add]);
sworn_evt(RoleId, skill_add) ->
    sworn ! {update_evt, skill, RoleId};
sworn_evt(_RoleId, _Type) ->
    logger:error("错误类型 ~w", [_Type], sworn, 1621).

check([], _Role, _OtherRoleId, _Sworn) -> ok;
check([member | T], Role = #{id := RoleId}, OtherRoleId,
      Sworn = #sworn{members = Members}) ->
    case lists:keyfind(RoleId,
                       #sworn_member.role_id,
                       Members)
        of
        false -> {false, lang:get("不是该结拜成员,数据错误")};
        _ -> check(T, Role, OtherRoleId, Sworn)
    end;
check([member_other | T], Role, OtherRoleId,
      Sworn = #sworn{members = Members}) ->
    case lists:keyfind(OtherRoleId,
                       #sworn_member.role_id,
                       Members)
        of
        false -> {false, lang:get("不是该结拜成员")};
        _ -> check(T, Role, OtherRoleId, Sworn)
    end;
check([invite | T], Role, OtherRoleId,
      Sworn = #sworn{members = Members, trends = Trends,
                     lists = Lists}) ->
    case lists:keyfind(OtherRoleId,
                       #sworn_member.role_id,
                       Members)
        of
        false ->
            Lists1 = [L
                      || L = #sworn_trend{type = 1, timeout = Timeout}
                             <- Lists,
                         Timeout > date:unixtime()],
            Trends1 = [Trend
                       || Trend = #sworn_trend{type = 1} <- Trends],
            logger:debug("邀请列表 ~w ~w",
                         [length(Lists1), length(Trends1)],
                         sworn,
                         1641),
            case Lists1 ++ Trends1 of
                [] -> check(T, Role, OtherRoleId, Sworn);
                _ -> {false, lang:get("当前有邀请投票进行中，请稍候再邀请")}
            end;
        _ -> {false, lang:get("已经是该结拜成员,不需要再次邀请")}
    end;
check([invited | T], Role, OtherRoleId,
      Sworn = #sworn{lists = Lists}) ->
    logger:debug("邀请超时 ~w ", [Lists], sworn, 1651),
    Now = date:unixtime(),
    case lists:keyfind(OtherRoleId,
                       #sworn_trend.r_id,
                       Lists)
        of
        false -> {false, lang:get("没有结拜成员邀请您,不能同意加入")};
        #sworn_trend{timeout = Timeout} when Timeout < Now ->
            logger:debug("邀请超时 ~w ~w", [Timeout, Now], sworn, 1657),
            {false, lang:get("该邀请已超时")};
        _ -> check(T, Role, OtherRoleId, Sworn)
    end;
check([please_leave | T], Role, OtherRoleId,
      Sworn = #sworn{trends = Trends}) ->
    case lists:keyfind(2, #sworn_trend.type, Trends) of
        false -> check(T, Role, OtherRoleId, Sworn);
        _ -> {false, lang:get("当前有玩家正在被请离,请投票")}
    end;
check([leave | T], Role = #{}, OtherRoleId,
      Sworn = #sworn{members = Members, trends = Trends}) ->
    case lists:keyfind(OtherRoleId,
                       #sworn_member.role_id,
                       Members)
        of
        false -> {false, lang:get("已经不是该结拜成员")};
        _ ->
            Trends1 = [Trend
                       || Trend = #sworn_trend{type = 4} <- Trends],
            case lists:keyfind(OtherRoleId,
                               #sworn_trend.r_id,
                               Trends1)
                of
                false -> check(T, Role, OtherRoleId, Sworn);
                _ -> {false, lang:get("正在离开,不需要再次申请")}
            end
    end;
check([vote | T], Role = #{id := RoleId}, OtherRoleId,
      Sworn = #sworn{votes = Votes}) ->
    case lists:member(RoleId, Votes) of
        false -> check(T, Role, OtherRoleId, Sworn);
        _ -> {false, lang:get("您已经投过票,不能重复投票")}
    end;
check([{vote_type, Type} | T], Role = #{id := RoleId},
      OtherRoleId, Sworn = #sworn{trends = Trends}) ->
    Trends1 = [Trend
               || Trend = #sworn_trend{type = Type1} <- Trends,
                  Type =:= Type1],
    case lists:keyfind(OtherRoleId,
                       #sworn_trend.r_id,
                       Trends1)
        of
        #sworn_trend{votes = Votes} ->
            case lists:keyfind(RoleId, 1, Votes) of
                false -> check(T, Role, OtherRoleId, Sworn);
                _ -> {false, lang:get("您已经投过票,不能重复投票")}
            end;
        _ -> {false, lang:get("该投票已过期,不能投票")}
    end.

check_team_mate([], []) -> ok;
check_team_mate([], [#sworn_member{name = Name} | _]) ->
    {false,
     notice:format(lang:get("玩家~ts未归队,不能结拜"),
                   [{role_2, Name}])};
check_team_mate([#team_mate{name = Name} | _], []) ->
    {false,
     notice:format(lang:get("玩家~ts不是该结拜团体成员,不能结拜"),
                   [{role_2, Name}])};
check_team_mate([#{id := Id, name := Name} | TeamMate],
                Members) ->
    case lists:keytake(Id, #sworn_member.role_id, Members)
        of
        {value, _, Members1} ->
            check_team_mate(TeamMate, Members1);
        _ ->
            {false,
             notice:format(lang:get("玩家~ts不是该结拜团体成员,不能结拜"),
                           [{role_2, Name}])}
    end;
check_team_mate([#team_mate{id = Id, name = Name,
                            status = 2}
                 | TeamMate],
                Members) ->
    case lists:keytake(Id, #sworn_member.role_id, Members)
        of
        {value, _, Members1} ->
            check_team_mate(TeamMate, Members1);
        _ ->
            {false,
             notice:format(lang:get("玩家~ts不是该结拜团体成员,不能结拜"),
                           [{role_2, Name}])}
    end;
check_team_mate([#team_mate{id = _Id, name = Name}
                 | _TeamMate],
                _Members) ->
    {false,
     notice:format(lang:get("玩家~ts未归队,不能结拜"),
                   [{role_2, Name}])}.

check_first_name(NameHead, NameTail) ->
    case check_first_name_same(NameHead, NameTail) of
        ok ->
            case util:utf8_len(NameHead) > 2 of
                true -> {false, lang:get("称号前半部分最多2个字哟{face_1,47}")};
                _ ->
                    case util:utf8_len(NameHead) of
                        0 -> {false, lang:get("称号前半部分不能为空哟{face_1,47}")};
                        _ ->
                            case util:utf8_len(NameTail) =:= 1 of
                                true ->
                                    case util:check_name(NameHead) of
                                        ok -> util:check_name(NameTail);
                                        {false, Reason} -> {false, Reason}
                                    end;
                                _ ->
                                    {false,
                                     lang:get("称号后半部分只能输入1个字{face_1,59}")}
                            end
                    end
            end;
        {false, Reason} -> {false, Reason}
    end.

check_first_name_same(NameHead, NameTail) ->
    SwornLists = ets:tab2list(sworn),
    check_first_name_same(SwornLists, NameHead, NameTail).

check_first_name_same([], _NameHead, _NameTail) -> ok;
check_first_name_same([#sworn{lists = Lists} | T],
                      NameHead, NameTail) ->
    case lists:keyfind(name, 1, Lists) of
        {name, NameHead, NameTail} ->
            {false, lang:get("称号前缀已被占用，请换一个名号吧{face_1,11}")};
        _ -> check_first_name_same(T, NameHead, NameTail)
    end.

check_second_name(Name, Name) ->
    {false, lang:get("自定义称号相同，无需修改")};
check_second_name(Name, _NameLast) ->
    case util:utf8_len(Name) > 1 of
        true -> {false, lang:get("自定义称号只能输入1个字{face_1,59}")};
        _ ->
            case util:utf8_len(Name) of
                0 -> {false, lang:get("自定义称号不能为空{face_1,59}")};
                _ -> util:check_name(Name)
            end
    end.

check_lists_timeout([], List, _Now) ->
    lists:reverse(List);
check_lists_timeout([SwornTrend = #sworn_trend{type = 1,
                                               timeout = Timeout}
                     | Rest],
                    List, Now) ->
    case Timeout < Now of
        true -> check_lists_timeout(Rest, List, Now);
        _ -> check_lists_timeout(Rest, [SwornTrend | Rest], Now)
    end;
check_lists_timeout([Other | Rest], List, Now) ->
    check_lists_timeout(Rest, [Other | List], Now).

push(#role{m_sworn =
               #m_sworn{id = {0, _Platform, _ZoneId}}}) ->
    ok;
push(Role = #role{m_sworn = #m_sworn{id = SwornId}}) ->
    case fetch(SwornId) of
        Sworn when is_record(Sworn, sworn) ->
            role:pack_send(Role, 17700, {Sworn});
        _ -> logger:debug("错误啦", [], sworn, 1786)
    end.

push_17712(#role{m_sworn = #m_sworn{id = {0, _, _}}}) ->
    ok;
push_17712(Role = #role{m_sworn =
                            #m_sworn{id = SwornId}}) ->
    case fetch(SwornId) of
        #sworn{head = 1} ->
            case file:read_file(get_photo_name(SwornId)) of
                {ok, Bin} -> role:pack_send(Role, 17712, {Bin});
                _Else -> ok
            end;
        _ -> ok
    end.

start_cb(Role, Id) ->
    MSworn = #m_sworn{id = Id, status = 1},
    role:pack_send(Role, 17714, {}),
    {ok, Role#role{m_sworn = MSworn}}.

sworn_loss(#role{id = Id} = Role) ->
    Loss = format:val_to_loss([{90000, 1000000}]),
    case role_gain:do_notice(Loss, Role) of
        {ok, NewRole} -> {ok, NewRole};
        {false, #loss{msg = _Msg}} ->
            logger:error("结拜未正常扣除结拜费用~w", [Id], sworn, 1814),
            ok
    end.

sworn_cancle(Role = #role{id = RoleId, s_event = Event,
                          m_skill = MSkill}) ->
    role:pack_send(Role, 17700, {#sworn{}}),
    honor:del(RoleId, 11085, push),
    NewEvent = case Event of
                   40 -> 0;
                   _ -> Event
               end,
    {ok,
     Role#role{m_sworn = #m_sworn{}, s_event = NewEvent,
               m_skill = MSkill#m_skill{skill_sworn = []}}}.

combat_over_cb(Role = #role{m_team =
                                #m_team{pid = Pid, status = Status}},
               SwornId)
    when is_pid(Pid) andalso Status =:= 1 ->
    MSworn = #m_sworn{id = SwornId, status = 1},
    Teammate = team:get_members(Role),
    case fetch(SwornId) of
        #sworn{members = Members} ->
            Ids1 = [Id || #team_mate{id = Id} <- Teammate],
            Ids2 = [Id || #sworn_member{role_id = Id} <- Members],
            case Ids1 -- Ids2 of
                [] -> skip;
                Ids3 ->
                    [role:apply(async, RoleId, {sworn, leave_team_cb, []})
                     || RoleId <- Ids3]
            end;
        _ -> skip
    end,
    {ok, Role#role{m_sworn = MSworn, s_event = 40}};
combat_over_cb(Role, Id) ->
    MSworn = #m_sworn{id = Id, status = 1},
    {ok, Role#role{m_sworn = MSworn, s_event = 40}}.

sworn_over_cb(Role = #role{m_sworn = MSworn,
                           m_skill = MSkill},
              Name, NameDefined) ->
    logger:debug("liyufei~w", [MSworn], sworn, 1850),
    SkillSworn = [{83010, 1}, {83011, 1}],
    MSworn1 = MSworn#m_sworn{status = 2, name = Name,
                             name_defined = NameDefined},
    honor:add_and_use(self(), [11085], push),
    {ok,
     Role#role{m_sworn = MSworn1, s_event = 0,
               m_skill = MSkill#m_skill{skill_sworn = SkillSworn}}}.

update_role_cb(Role = #role{id = RoleId,
                            m_sworn = MSworn},
               status, Status)
    when Status =:= 2 orelse Status =:= 4 ->
    honor:del(RoleId, 11085, push),
    role:pack_send(Role, 17700, {#sworn{}}),
    role:apply(async,
               self(),
               {friend_zone, update, [sworn, ""]}),
    {ok,
     Role#role{m_sworn =
                   MSworn#m_sworn{status = Status, id = {0, "", 0},
                                  name = "", name_defined = ""}}};
update_role_cb(Role = #role{m_sworn = MSworn}, status,
               Status) ->
    {ok,
     Role#role{m_sworn = MSworn#m_sworn{status = Status}}};
update_role_cb(Role = #role{id = RoleId,
                            m_sworn =
                                MSworn = #m_sworn{name_defined = _NameDefined}},
               name, Name) ->
    honor:del(RoleId, 11085, push),
    honor:add_and_use(self(), [11085], push),
    {ok, Role#role{m_sworn = MSworn#m_sworn{name = Name}}};
update_role_cb(Role = #role{id = RoleId, pid = Pid,
                            m_sworn = MSworn = #m_sworn{name = _Name}},
               name_defined, NameDefined) ->
    honor:del(RoleId, 11085, push),
    honor:add_and_use(Pid, [11085], push),
    {ok,
     Role#role{m_sworn =
                   MSworn#m_sworn{name_defined = NameDefined}}}.

leave_team_cb(Role) ->
    case team:leave(Role) of
        {ok, NewRole} ->
            role:pack_send(Role,
                           11708,
                           {1, lang:get("队长结拜中，非结拜成员自动离队")}),
            {ok, NewRole};
        _ -> ok
    end.

fetch(SwornId) ->
    case ets:lookup(sworn, SwornId) of
        [#sworn{} = Sworn] -> Sworn;
        _ -> false
    end.

fetch_role(RoleId) ->
    case ets:lookup(sworn_role, RoleId) of
        [#sworn_role{} = SwornRole] -> SwornRole;
        _ -> false
    end.

fetch_evt(#role{id = RoleId}) -> fetch_evt(RoleId);
fetch_evt(RoleId) ->
    case ets:lookup(sworn_evt, RoleId) of
        [#sworn_evt{} = SwornEvt] ->
            logger:debug("sworn evt data ~w",
                         [SwornEvt],
                         sworn,
                         1896),
            SwornEvt;
        _ -> #sworn_evt{role_id = RoleId}
    end.

update_role(#sworn_role{role_id = RoleId} = SwornRole,
            status, Status)
    when Status =:= 2 orelse Status =:= 4 ->
    save(SwornRole#sworn_role{status = 4, name = "",
                              name_defined = ""}),
    role:apply(async,
               RoleId,
               {sworn, update_role_cb, [status, Status]});
update_role(#sworn_role{} = _SwornRole, status,
            _Status) ->
    logger:error("=结拜未处理状态=~w ~w",
                 [_Status, _SwornRole],
                 sworn,
                 1904);
update_role(#sworn_role{role_id = RoleId} = SwornRole,
            name_defined, NameDefined) ->
    save(SwornRole#sworn_role{name_defined = NameDefined}),
    role:apply(async,
               RoleId,
               {sworn, update_role_cb, [name_defined, NameDefined]});
update_role(#sworn_role{role_id = RoleId} = SwornRole,
            name, Name) ->
    save(SwornRole#sworn_role{name = Name}),
    role:apply(async,
               RoleId,
               {sworn, update_role_cb, [name, Name]});
update_role(RoleId, Type, Value) ->
    case fetch_role(RoleId) of
        #sworn_role{} = SwornRole ->
            update_role(SwornRole, Type, Value);
        _ -> logger:error("结拜系统更新个人数据错误", [], sworn, 1918)
    end.

save(SwornRole) when is_record(SwornRole, sworn_role) ->
    ets:insert(sworn_role, SwornRole),
    dets:insert(sworn_role, SwornRole);
save(Sworn) when is_record(Sworn, sworn) ->
    ets:insert(sworn, Sworn),
    dets:insert(sworn, Sworn);
save(SwornEvt) when is_record(SwornEvt, sworn_evt) ->
    ets:insert(sworn_evt, SwornEvt),
    dets:insert(sworn_evt, SwornEvt);
save(_R) ->
    logger:error("结拜系统存储数据错误 ~w", [_R], sworn, 1931).

delete_role(RoleId) ->
    ets:delete(sworn_role, RoleId),
    dets:delete(sworn_role, RoleId),
    role:apply(async, RoleId, {sworn, sworn_cancle, []}).

delete(SwornId) ->
    ets:delete(sworn, SwornId),
    dets:delete(sworn, SwornId),
    sworn_env_del(SwornId).

cal_vote(Lists) ->
    [{RoleId, _} | _] = lists:reverse(lists:keysort(2,
                                                    Lists)),
    RoleId.

check_vote(RoleId, OtherRoleId,
           #sworn{members = Members, votes = VoteList,
                  lists = Lists} =
               Sworn) ->
    case lists:member(RoleId, VoteList) of
        false ->
            case lists:keyfind(RoleId,
                               #sworn_member.role_id,
                               Members)
                of
                Member when is_record(Member, sworn_member) ->
                    case lists:keyfind(OtherRoleId,
                                       #sworn_member.role_id,
                                       Members)
                        of
                        #sworn_member{pos = Pos} when Pos =:= 0 ->
                            Lists2 = case lists:keytake(OtherRoleId, 1, Lists)
                                         of
                                         {value, {OtherRoleId, Vote}, Lists1} ->
                                             [{OtherRoleId, Vote + 1} | Lists1];
                                         _ -> [{OtherRoleId, 1} | Lists]
                                     end,
                            {ok,
                             Sworn#sworn{lists = Lists2,
                                         votes = [RoleId | VoteList]}};
                        #sworn_member{sex = Sex, pos = RolePos,
                                      name = RoleName} ->
                            PosName = pos_name_get(RolePos, Sex),
                            {false,
                             notice:format(lang:get("~ts已经是~ts了，请选择其他兄弟{face_1,25}"),
                                           [{role_2, RoleName},
                                            {string_2, 5, PosName}])};
                        _ -> {false, lang:get("该玩家不是结拜成员,不能投Ta")}
                    end;
                _ -> {false, lang:get("你不是该结拜成员,不能进行投票")}
            end;
        _ -> {false, lang:get("你已经投过票了,不能重复投票")}
    end.

pos_name_get(1) -> lang:get("老大");
pos_name_get(2) -> lang:get("老二");
pos_name_get(3) -> lang:get("老三");
pos_name_get(4) -> lang:get("老四");
pos_name_get(5) -> lang:get("老五");
pos_name_get(6) -> lang:get("老六");
pos_name_get(7) -> lang:get("老七");
pos_name_get(8) -> lang:get("老八");
pos_name_get(9) -> lang:get("老九");
pos_name_get(10) -> lang:get("老十");
pos_name_get(_) -> lang:get("老大").

pos_name_get(1, Name) ->
    util:flist([lang:get("大"), Name]);
pos_name_get(2, Name) ->
    util:flist([lang:get("二"), Name]);
pos_name_get(3, Name) ->
    util:flist([lang:get("三"), Name]);
pos_name_get(4, Name) ->
    util:flist([lang:get("四"), Name]);
pos_name_get(5, Name) ->
    util:flist([lang:get("五"), Name]);
pos_name_get(6, Name) ->
    util:flist([lang:get("六"), Name]);
pos_name_get(7, Name) ->
    util:flist([lang:get("七"), Name]);
pos_name_get(8, Name) ->
    util:flist([lang:get("八"), Name]);
pos_name_get(9, Name) ->
    util:flist([lang:get("九"), Name]);
pos_name_get(10, Name) ->
    util:flist([lang:get("十"), Name]);
pos_name_get(_, Name) ->
    util:flist([lang:get("二"), Name]).

num_name_get(Num, Lists) ->
    case lists:keyfind(name, 1, Lists) of
        {name, NameHead, NameTail} ->
            num_name_get(Num, NameHead, NameTail);
        _ -> ""
    end.

num_name_get(1, NameHead, NameTail) ->
    util:flist([NameHead, lang:get("一"), NameTail]);
num_name_get(2, NameHead, NameTail) ->
    util:flist([NameHead, lang:get("双"), NameTail]);
num_name_get(3, NameHead, NameTail) ->
    util:flist([NameHead, lang:get("三"), NameTail]);
num_name_get(4, NameHead, NameTail) ->
    util:flist([NameHead, lang:get("四"), NameTail]);
num_name_get(5, NameHead, NameTail) ->
    util:flist([NameHead, lang:get("五"), NameTail]);
num_name_get(6, NameHead, NameTail) ->
    util:flist([NameHead, lang:get("六"), NameTail]);
num_name_get(7, NameHead, NameTail) ->
    util:flist([NameHead, lang:get("七"), NameTail]);
num_name_get(8, NameHead, NameTail) ->
    util:flist([NameHead, lang:get("八"), NameTail]);
num_name_get(9, NameHead, NameTail) ->
    util:flist([NameHead, lang:get("九"), NameTail]);
num_name_get(10, NameHead, NameTail) ->
    util:flist([NameHead, lang:get("十"), NameTail]);
num_name_get(_, NameHead, NameTail) ->
    util:flist([NameHead, lang:get("双"), NameTail]).

name_split_joint(Members) ->
    name_split_joint(Members, "").

name_split_joint([], String) -> String;
name_split_joint([#sworn_member{name = Name} | T],
                 "") ->
    String1 = notice:format(lang:get("~ts"),
                            [{role_2, Name}]),
    name_split_joint(T, String1);
name_split_joint([#sworn_member{name = Name} | T],
                 String) ->
    String1 = notice:format(lang:get("~ts、~ts"),
                            [{string_1, String}, {role_2, Name}]),
    name_split_joint(T, String1).

agree_num_get(Num) ->
    case Num of
        2 -> 2;
        _ -> Num / 2
    end.

loss_get(#role{m_sworn = #m_sworn{id = {0, _P, _Z}}},
         _Type) ->
    5000000;
loss_get(#role{m_sworn = #m_sworn{id = SwornId}},
         prefix) ->
    case fetch(SwornId) of
        #sworn{times = Times} ->
            {Prefix, _Personal} = loss_data_get(Times + 1),
            Prefix;
        _R -> 500
    end;
loss_get(#role{id = RoleId,
               m_sworn = #m_sworn{id = SwornId}},
         personal) ->
    case fetch(SwornId) of
        #sworn{members = Members} ->
            case lists:keyfind(RoleId,
                               #sworn_member.role_id,
                               Members)
                of
                #sworn_member{free = 1} -> 0;
                #sworn_member{times = Times} ->
                    {_Prefix, Personal} = loss_data_get(Times + 1),
                    Personal;
                _ -> 1000000
            end;
        _ -> 1000000
    end.

loss_data_get(Times) ->
    TimesList = sworn_data:list(),
    Max = lists:max(TimesList),
    Times1 = min(Times, Max),
    case sworn_data:get_loss({Times1}) of
        #{prefix := Prefix, personal := Personal} ->
            {Prefix, Personal};
        _R -> {500, 1000000}
    end.

update_sworn_id({SwornId, _Platform, _ZoneId}) ->
    case get(max_sworn_id) of
        undefined -> put(max_sworn_id, max(1, SwornId));
        ID -> put(max_sworn_id, max(ID, SwornId))
    end.

timer_ref_add(SwornId, _TimeOut, cancle) ->
    case get({sworn, SwornId}) of
        undefined -> ignore;
        TimeRef -> erlang:cancel_timer(TimeRef)
    end;
timer_ref_add(SwornId, TimeOut, Info) ->
    case get({sworn, SwornId}) of
        undefined -> ignore;
        TimeRef -> erlang:cancel_timer(TimeRef)
    end,
    NewTref = erlang:send_after(TimeOut * 1000,
                                sworn,
                                Info),
    put({sworn, SwornId}, NewTref).

timer_ref_add(#sworn{trends = []}) -> ignore;
timer_ref_add(#sworn{id = SwornId, trends = Trends}) ->
    [#sworn_trend{timeout = Timeout} | _] =
        lists:keysort(#sworn_trend.timeout, Trends),
    case get({sworn_trend, SwornId}) of
        TimeRef when is_reference(TimeRef) ->
            erlang:cancel_timer(TimeRef);
        _ -> ignore
    end,
    NewTref = erlang:send_after(max(Timeout -
                                        date:unixtime(),
                                    0)
                                    * 1000,
                                sworn,
                                {sworn_trend_timeout, SwornId}),
    put({sworn_trend, SwornId}, NewTref).

to_member(TeamMates) ->
    [#sworn_member{role_id = RId, name = Name, sex = Sex,
                   classes = Classes, lev = Lev}
     || #team_mate{id = RId, status = 2, name = Name,
                   sex = Sex, lev = Lev, classes = Classes}
            <- TeamMates].

broadcast(Sworn = #sworn{members = Members}) ->
    do_broadcast(Members, Sworn).

broadcast(#sworn{members = Members}, Msg) ->
    [notice:send(Id, 1, Msg)
     || #sworn_member{role_id = Id} <- Members].

broadcast(#sworn{members = Members}, RoleId, Msg) ->
    [notice:send(Id, 1, Msg)
     || #sworn_member{role_id = Id} <- Members,
        Id =/= RoleId].

do_broadcast([], _Data) -> ok;
do_broadcast([#sworn_member{role_id = RoleId} | T],
             Data) ->
    role:pack_send(RoleId, 17700, {Data}),
    do_broadcast(T, Data);
do_broadcast([_ | T], Data) -> do_broadcast(T, Data).

is_relation(#role{m_sworn = #m_sworn{id = {0, _P, _Z}}},
            _RoleId) ->
    false;
is_relation(#role{m_sworn = #m_sworn{id = SwornId1}},
            RoleId) ->
    case fetch_role(RoleId) of
        #sworn_role{id = SwornId2, status = Status}
            when Status =:= 1 orelse
                     Status =:= 2 orelse Status =:= 3 ->
            SwornId1 =:= SwornId2;
        _ -> false
    end;
is_relation(OwnerId, RoleId) ->
    case fetch_role(OwnerId) of
        #sworn_role{id = SwornId1, status = Status1}
            when Status1 =:= 1 orelse
                     Status1 =:= 2 orelse Status1 =:= 3 ->
            case fetch_role(RoleId) of
                #sworn_role{id = SwornId2, status = Status2}
                    when Status2 =:= 1 orelse
                             Status2 =:= 2 orelse Status2 =:= 3 ->
                    SwornId1 =:= SwornId2;
                _ -> false
            end;
        _ -> false
    end.

sworn_env_add(SwornId) ->
    case env:get(sworn_env_list) of
        List when is_list(List) ->
            env:save(sworn_env_list, [SwornId | List]);
        _ -> env:save(sworn_env_list, [SwornId])
    end.

sworn_env_del(SwornId) ->
    case env:get(sworn_env_list) of
        List when is_list(List) ->
            env:save(sworn_env_list, lists:delete(SwornId, List));
        _ -> skip
    end.

sworn_success_mail_send(Members, SwornName) ->
    sworn_success_mail_send(Members, Members, SwornName).

sworn_success_mail_send([], _Members, _SwornName) -> ok;
sworn_success_mail_send([#sworn_member{role_id = RoleId}
                         | T],
                        Members, SwornName) ->
    Members1 = lists:keydelete(RoleId,
                               #sworn_member.role_id,
                               Members),
    Content = case Members1 of
                  [#sworn_member{name = Name1}] ->
                      notice:format(lang:get("您与~ts历经重重试炼，以~ts的名义结拜成功。您获得了以下奖励，愿您将这份喜悦分享给更多"
                                             "的好友{face_1,3}"),
                                    [{role_2, Name1},
                                     {string_2, 5, SwornName}]);
                  [#sworn_member{name = Name1},
                   #sworn_member{name = Name2}] ->
                      notice:format(lang:get("您与~ts、~ts历经重重试炼，以~ts的名义结拜成功。您获得了以下奖励，愿您将这份喜悦分"
                                             "享给更多的好友{face_1,3}"),
                                    [{role_2, Name1},
                                     {role_2, Name2},
                                     {string_2, 5, SwornName}]);
                  [#sworn_member{name = Name1},
                   #sworn_member{name = Name2},
                   #sworn_member{name = Name3}] ->
                      notice:format(lang:get("您与~ts、~ts、~ts历经重重试炼，以~ts的名义结拜成功。您获得了以下奖励，愿您将这"
                                             "份喜悦分享给更多的好友{face_1,3}"),
                                    [{role_2, Name1},
                                     {role_2, Name2},
                                     {role_2, Name3},
                                     {string_2, 5, SwornName}]);
                  [#sworn_member{name = Name1},
                   #sworn_member{name = Name2},
                   #sworn_member{name = Name3},
                   #sworn_member{name = Name4}] ->
                      notice:format(lang:get("您与~ts、~ts、~ts、~ts历经重重试炼，以~ts的名义结拜成功。您获得了以下奖励，"
                                             "愿您将这份喜悦分享给更多的好友{face_1,3}"),
                                    [{role_2, Name1},
                                     {role_2, Name2},
                                     {role_2, Name3},
                                     {role_2, Name4},
                                     {string_2, 5, SwornName}]);
                  _ ->
                      notice:format(lang:get("以~ts的名义结拜成功。您获得了以下奖励，愿您将这份喜悦分享给更多的好友{face_1,3}"),
                                    [{string_2, 5, SwornName}])
              end,
    mail:send(RoleId,
              lang:get("恭喜结拜成功"),
              Content,
              [{29171, 0, 5}]),
    sworn_success_mail_send(T, Members, SwornName).

convert(#role{classes = Classes, sex = Sex, lev = Lev,
              id = RoleId, name = Name,
              m_sworn = #m_sworn{id = SwornId},
              m_team = #m_team{pid = Pid}}) ->
    #{id => RoleId, classes => Classes, sex => Sex,
      lev => Lev, id => RoleId, name => Name,
      sworn_id => SwornId, pid => Pid}.

get_photo_name(Rid) -> sworn_head_dir(Rid) ++ "/1.png".

mkdir(Id) ->
    case file:make_dir(sworn_head_dir(Id)) of
        ok -> ok;
        {error, eexist} -> ok;
        _R ->
            logger:error("无法创建结拜系统头像目录 ~w", [_R], sworn, 2202),
            ok
    end.

sworn_head_dir(#role{m_sworn = #m_sworn{id = Id}}) ->
    sworn_head_dir(Id);
sworn_head_dir({R, P, Z}) ->
    Rstr = integer_to_list(R),
    Zstr = integer_to_list(Z),
    case filelib:is_dir("sworn_head/" ++ P ++ "_" ++ Zstr)
        of
        true ->
            "sworn_head/" ++
                P ++ "_" ++ Zstr ++ "/" ++ Rstr ++ P ++ Zstr;
        _ -> "sworn_head/" ++ Rstr ++ P ++ Zstr
    end.

evt_init() ->
    SwornEvt = ets:tab2list(sworn_evt),
    Sworn = ets:tab2list(sworn),
    case Sworn of
        [] -> skip;
        _ ->
            case SwornEvt of
                [] -> evt_init(Sworn);
                _ -> skip
            end
    end.

evt_init([]) -> ok;
evt_init([#sworn{members = Members} | T]) ->
    evt_init(Members),
    evt_init(T);
evt_init([#sworn_member{role_id = RoleId} | T]) ->
    logger:debug("=========~w", [RoleId], sworn, 2237),
    save(#sworn_evt{role_id = RoleId, finish = 1}),
    evt_init(T).

init_root_dir() ->
    case filelib:is_dir("sworn_head/") of
        true -> ok;
        _ ->
            case file:make_dir("sworn_head/") of
                ok -> ok;
                _Res ->
                    logger:error("无法创结拜系统目录 ~w", [_Res], sworn, 2250),
                    ok
            end
    end.

sworn_clear(Role = #role{m_sworn =
                             #m_sworn{id = SwornId}}) ->
    case fetch(SwornId) of
        #sworn{members = Members} ->
            [delete_role(RoleId)
             || #sworn_member{role_id = RoleId} <- Members],
            delete(SwornId),
            ok;
        _ -> ok
    end,
    {ok, Role#role{m_sworn = #m_sworn{}}}.

sworn_play(#role{m_sworn = #m_sworn{id = SwornId}}) ->
    case fetch(SwornId) of
        #sworn{} = Sworn ->
            NewSworn = Sworn#sworn{status = 7},
            save(NewSworn),
            timer_ref_add(SwornId, 0, {agreement_timeout, SwornId}),
            ok;
        _ -> ok
    end.

