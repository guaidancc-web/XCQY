-file("src/mod/campaign/camp_enjoy_moon.erl", 1).

-module(camp_enjoy_moon).

-behaviour(gen_fsm).

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

-file("src/mod/campaign/camp_enjoy_moon.erl", 12).

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

-file("src/mod/campaign/camp_enjoy_moon.erl", 13).

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

-file("src/mod/campaign/camp_enjoy_moon.erl", 14).

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

-file("src/mod/campaign/camp_enjoy_moon.erl", 15).

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

-file("src/mod/campaign/camp_enjoy_moon.erl", 16).

-file("inc/camp_mid_autumn.hrl", 1).

-record(enjoy_moon_role_info,
        {role_id = {0, "", 0},
         role_name = "",
         pid = undefined,
         lev = 0,
         guild_id = {0, "", 0},
         guild_name = "",
         total_exp = 0,
         wish_val = 0,
         status = 1}).

-record(enjoy_moon_guild_wish_info,
        {id = {0, "", 0}, name = "", wish_val = 0}).

-file("src/mod/campaign/camp_enjoy_moon.erl", 17).

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

-file("src/mod/campaign/camp_enjoy_moon.erl", 18).

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

-file("src/mod/campaign/camp_enjoy_moon.erl", 19).

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

-file("src/mod/campaign/camp_enjoy_moon.erl", 20).

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

-file("src/mod/campaign/camp_enjoy_moon.erl", 21).

-export([init/1,
         handle_event/3,
         handle_sync_event/4,
         handle_info/3,
         terminate/3,
         code_change/4]).

-export([idel/2, active/2]).

-export([start_link/0,
         apply_gain_exp/2,
         next/0,
         check_pick/2,
         set_wish_val/1,
         get_role_rank/1,
         pick_pop/1]).

-record(state,
        {ts = 0 :: tuple(),
         timeout = 0 :: non_neg_integer(),
         joins = [],
         rank_list = [],
         wish_msg = [],
         map_id = 0,
         map_pid = undefind,
         wish_val = 0,
         unit_pos = 1,
         role_rank = [],
         reward_step = 1}).

start_link() ->
    gen_fsm:start_link({local, camp_enjoy_moon},
                       camp_enjoy_moon,
                       [],
                       []).

apply_gain_exp(Role = #role{name = _Name, lev = Lev},
               Mod) ->
    logger:debug("对角色~ts发放泡点",
                 [_Name],
                 camp_enjoy_moon,
                 84),
    Gain1 = case levup_data:get_exp({Mod, Lev}) of
                #{exp := Exp} when Exp > 0 ->
                    [#gain{label = exp, val = Exp}];
                _ -> []
            end,
    Gain2 = case pet:get_war_pet(Role) of
                {ok, #pet{lev = PetLev}} ->
                    case levup_data:get_exp({Mod, PetLev}) of
                        #{pet_exp := PetExp} when PetExp > 0 ->
                            [#gain{label = pet_exp, val = PetExp}];
                        _ -> []
                    end;
                _ -> []
            end,
    Gain = Gain1 ++ Gain2,
    case Gain of
        [_ | _] ->
            case role_gain:do_notice(Gain, Role) of
                {false, _} -> ok;
                {ok, NRole} -> {ok, NRole}
            end;
        _ -> ok
    end.

check_pick(_Role, PickArgs) ->
    CdFlag = role_misc:check_cd({pick_camp_box_id, 74135}),
    case CdFlag of
        false -> {false, lang:get("刚采集过月宫宝箱，暂时无法继续采集")};
        true ->
            List = camp_mid_autumn_data:get_box(),
            case util:rand_list(List, ratio) of
                #{base_id := BaseId, num := Num, is_cast := IsCast} ->
                    {true,
                     PickArgs#{gain => [{BaseId, 0, Num}],
                               is_cast => IsCast}};
                _ -> {false, lang:get("无法找到宝箱数据")}
            end
    end.

pick_pop(Role) ->
    Msg = util:rand_list(camp_mid_autumn_data:get_pop()),
    notice:npc_talk(Role, 74132, Msg),
    ok.

next() -> camp_enjoy_moon ! next.

set_wish_val(WishVal) ->
    camp_enjoy_moon ! {set_wish_val, WishVal},
    ok.

get_role_rank(#role{s_event = 31, pid = RolePid}) ->
    camp_enjoy_moon ! {get_role_rank, RolePid},
    ok;
get_role_rank(_) -> ok.

init([]) ->
    process_flag(trap_exit, true),
    case map_mgr:create(51021) of
        {ok, MapPid, MapId} ->
            State = #state{ts = now(), timeout = infinity,
                           map_id = MapId, map_pid = MapPid, unit_pos = 1},
            {ok, idel, State, infinity};
        _Err ->
            logger:error("无法创建赏月地图:~w",
                         [_Err],
                         camp_enjoy_moon,
                         171),
            {stop, create_map_faild}
    end.

handle_event(_Event, StateName, State) ->
    logger:error("未知消息 ~w", [_Event], camp_enjoy_moon, 176),
    continue(StateName, State).

handle_sync_event({join,
                   RoleId,
                   RoleName,
                   RolePid,
                   Lev,
                   GuildId,
                   GuildName},
                  _From, active,
                  State = #state{joins = Joins, map_id = MapId}) ->
    logger:debug("玩家进入副本：~w",
                 [RoleId],
                 camp_enjoy_moon,
                 181),
    NewRoleInfo = case lists:keyfind(RoleId,
                                     #enjoy_moon_role_info.role_id,
                                     Joins)
                      of
                      false ->
                          #enjoy_moon_role_info{role_id = RoleId,
                                                role_name = RoleName,
                                                pid = RolePid,
                                                guild_id = GuildId, lev = Lev,
                                                guild_name = GuildName,
                                                status = 1};
                      OldRoleInfo = #enjoy_moon_role_info{} ->
                          OldRoleInfo#enjoy_moon_role_info{role_id = RoleId,
                                                           role_name = RoleName,
                                                           pid = RolePid,
                                                           guild_id = GuildId,
                                                           lev = Lev,
                                                           guild_name =
                                                               GuildName,
                                                           status = 1}
                  end,
    NewJoins = lists:keystore(RoleId,
                              #enjoy_moon_role_info.role_id,
                              Joins,
                              NewRoleInfo),
    NewState = State#state{joins = NewJoins},
    Reply = {true, MapId},
    continue(Reply, active, NewState);
handle_sync_event({join, _RoleId, _RolePid, _GuildId},
                  _From, _StateName, State = #state{}) ->
    Reply = {false, lang:get("当前活动未开放，不能进入")},
    continue(Reply, _StateName, State);
handle_sync_event({info, RoleId}, _From, active,
                  State = #state{}) ->
    Reply = enjoy_moon_info(State, RoleId),
    continue(Reply, active, State);
handle_sync_event({info, _RoleId}, _From, StateName,
                  State = #state{}) ->
    Reply = false,
    continue(Reply, StateName, State);
handle_sync_event({guild_wish_val, RoleId}, _From,
                  active,
                  State = #state{joins = Joins, rank_list = RankList}) ->
    Reply = case lists:keyfind(RoleId,
                               #enjoy_moon_role_info.role_id,
                               Joins)
                of
                #enjoy_moon_role_info{guild_id = GuildId}
                    when GuildId =/= {0, "", 0} ->
                    case lists:keyfind(GuildId,
                                       #enjoy_moon_guild_wish_info.id,
                                       RankList)
                        of
                        #enjoy_moon_guild_wish_info{wish_val = WishVal} ->
                            {true, WishVal};
                        _ -> {true, 0}
                    end;
                _ -> {true, 0}
            end,
    continue(Reply, active, State);
handle_sync_event(_Event, _From, StateName, State) ->
    logger:error("赏月进程状态:~w 收到未知消息 ~w",
                 [StateName, _Event],
                 camp_enjoy_moon,
                 218),
    Reply = false,
    continue(Reply, StateName, State).

handle_info(start_enjoy_moon, idel,
            State = #state{map_id = MapId}) ->
    role_group:pack_send(world,
                         14066,
                         {1, 1200000 div 1000}),
    NoticeMsg =
        notice:format(lang:get("中秋佳节月儿圆，~ts开启了，大家赶紧进入赏月祈愿吧{face_1,29}"),
                      [{string_2, 1, lang:get("中秋赏月会")}]),
    notice:cast(all, 5, NoticeMsg),
    GainExpRef = erlang:send_after(30000, self(), gain_exp),
    put(gainexp_ref, GainExpRef),
    erlang:send_after(5000, self(), barrage),
    UnitPos = case camp_mid_autumn_data:get_unit_pos(1) of
                  #{next_pos := NextPos, pos_x_1 := PosX1,
                    pos_y_1 := PosY1, pos_x_2 := PosX2, pos_y_2 := PosY2,
                    pos_x_3 := PosX3, pos_y_3 := PosY3, pos_x_4 := PosX4,
                    pos_y_4 := PosY4, pos_x_5 := PosX5, pos_y_5 := PosY5} ->
                      unit_mgr:create({35, 1}, 74134, {MapId, PosX1, PosY1}),
                      unit_mgr:create({35, 2}, 74139, {MapId, PosX2, PosY2}),
                      unit_mgr:create({35, 3}, 74139, {MapId, PosX3, PosY3}),
                      unit_mgr:create({35, 4}, 74140, {MapId, PosX4, PosY4}),
                      unit_mgr:create({35, 5}, 74140, {MapId, PosX5, PosY5}),
                      NextPos;
                  _ ->
                      unit_mgr:create({35, 1}, 74134, {MapId, 100, 100}),
                      unit_mgr:create({35, 2}, 74139, {MapId, 100, 100}),
                      unit_mgr:create({35, 3}, 74139, {MapId, 100, 100}),
                      unit_mgr:create({35, 4}, 74140, {MapId, 100, 100}),
                      unit_mgr:create({35, 5}, 74140, {MapId, 100, 100}),
                      1
              end,
    erlang:send_after(3000, self(), unit_move),
    LanternUnitBaseId =
        camp_mid_autumn_data:get_lantern_unit(1),
    unit_mgr:create({35, 10},
                    LanternUnitBaseId,
                    {MapId, 1530, 1530}),
    NewState = State#state{ts = now(), timeout = 1200000,
                           joins = [], wish_val = 0, rank_list = [],
                           unit_pos = UnitPos, role_rank = [], reward_step = 1},
    Ref = erlang:send_after(3 * 60 * 1000,
                            self(),
                            create_box),
    put(camp_enjoy_moon_timer, Ref),
    continue(active, NewState);
handle_info(create_box, active,
            State = #state{joins = Joins, map_id = MapId,
                           reward_step = RewardStep}) ->
    case get(camp_enjoy_moon_timer) of
        OldRef when is_reference(OldRef) ->
            erlang:cancel_timer(OldRef);
        _ -> skip
    end,
    RoleLen = length([1
                      || #enjoy_moon_role_info{status = 1} <- Joins]),
    notice:effect({map, MapId}, 30075),
    create_box(MapId, RoleLen),
    UnitName = unit:name(74134),
    Content =
        lang:get("嫦娥让我给大家带来了中秋礼物~{face_1, 3}祝大家团团圆圆，和和美美{face_1"
                 ", 18}"),
    MapContent = notice:format("~ts：~ts",
                               [{string_2, 1, UnitName}, {string_1, Content}]),
    notice:cast({map, MapId}, 22, MapContent),
    notice:pop({map, MapId}, 2, MapContent),
    NewRewardStep = RewardStep + 1,
    case NewRewardStep of
        2 ->
            Ref = erlang:send_after(6 * 60 * 1000,
                                    self(),
                                    create_box),
            put(camp_enjoy_moon_timer, Ref);
        3 ->
            Ref = erlang:send_after(6 * 60 * 1000,
                                    self(),
                                    create_box),
            put(camp_enjoy_moon_timer, Ref);
        _ -> skip
    end,
    continue(active,
             State#state{reward_step = NewRewardStep});
handle_info(create_box, StateName, State) ->
    continue(StateName, State);
handle_info(unit_move, active,
            State = #state{unit_pos = UnitPos, map_id = MapId,
                           joins = _Joins}) ->
    case camp_mid_autumn_data:get_unit_pos(UnitPos) of
        #{next_pos := NextPos, stay_time := StayTime,
          pos_x_1 := PosX1, pos_y_1 := PosY1,
          content_1 := Content1, content_2 := Content2,
          content_3 := Content3, pos_x_2 := PosX2,
          pos_y_2 := PosY2, pos_x_3 := PosX3, pos_y_3 := PosY3,
          pos_x_4 := PosX4, pos_y_4 := PosY4, pos_x_5 := PosX5,
          pos_y_5 := PosY5, effect_id := EffectId} ->
            case Content1 =/= "" of
                true ->
                    UnitName = unit:name(74134),
                    MapContent = notice:format("~ts：~ts",
                                               [{string_2, 1, UnitName},
                                                {string_1, Content1}]),
                    notice:cast({map, MapId}, 22, MapContent),
                    unit:talk({35, 1}, MapId, Content1);
                _ -> skip
            end,
            case Content2 =/= "" of
                true -> unit:talk({35, 2}, MapId, Content2);
                _ -> skip
            end,
            case Content3 =/= "" of
                true -> unit:talk({35, 3}, MapId, Content3);
                _ -> skip
            end,
            case EffectId =/= 0 of
                true -> notice:effect({map, MapId}, EffectId);
                _ -> skip
            end,
            Order1 = #unit_order{type = 0, order = direct_move,
                                 arg = {PosX1, PosY1}},
            Order2 = #unit_order{type = 0, order = direct_move,
                                 arg = {PosX2, PosY2}},
            Order3 = #unit_order{type = 0, order = direct_move,
                                 arg = {PosX3, PosY3}},
            Order4 = #unit_order{type = 0, order = direct_move,
                                 arg = {PosX4, PosY4}},
            Order5 = #unit_order{type = 0, order = direct_move,
                                 arg = {PosX5, PosY5}},
            unit:order({35, 1}, Order1),
            unit:order({35, 2}, Order2),
            unit:order({35, 3}, Order3),
            unit:order({35, 4}, Order4),
            unit:order({35, 5}, Order5),
            erlang:send_after(StayTime, self(), unit_move),
            NewState = State#state{unit_pos = NextPos},
            continue(active, NewState);
        _ ->
            logger:error("中秋活动无法获取行动点[~w]",
                         [UnitPos],
                         camp_enjoy_moon,
                         345),
            erlang:send_after(5000, self(), unit_move),
            NewState = State#state{unit_pos = 1},
            continue(active, NewState)
    end;
handle_info(unit_move, StateName, State) ->
    continue(StateName, State);
handle_info({get_role_rank, RolePid}, StateName,
            State = #state{role_rank = RoleRank}) ->
    role:pack_send(RolePid, 14068, {RoleRank}),
    continue(StateName, State);
handle_info(gain_exp, active,
            State = #state{joins = Joins, rank_list = RankInfo}) ->
    logger:debug("发放泡点奖励:~w",
                 [Joins],
                 camp_enjoy_moon,
                 360),
    case get(gainexp_ref) of
        GERef when is_reference(GERef) ->
            erlang:cancel_timer(GERef);
        _ -> skip
    end,
    GainExpRef = erlang:send_after(30000,
                                   camp_enjoy_moon,
                                   gain_exp),
    put(gainexp_ref, GainExpRef),
    {WorldLev, _} = world_lev:get_world_lev(),
    NewJoins = gain_exp(WorldLev, Joins, RankInfo, []),
    NewState = State#state{joins = NewJoins},
    sync_enjoy_moon_info(NewState),
    continue(active, NewState);
handle_info(gain_exp, StateName, State) ->
    continue(StateName, State);
handle_info(barrage, active,
            State = #state{wish_msg = []}) ->
    erlang:send_after(5000, camp_enjoy_moon, barrage),
    continue(active, State);
handle_info(barrage, active,
            State = #state{map_id = MapId,
                           wish_msg = [RandMsg | WishMsgs]}) ->
    erlang:send_after(5000, camp_enjoy_moon, barrage),
    notice:cast({map, MapId}, 13, RandMsg),
    continue(active, State#state{wish_msg = WishMsgs});
handle_info(barrage, StateName, State) ->
    continue(StateName, State);
handle_info({wish,
             RoleId,
             GuildId,
             GuildName,
             WishMsg,
             ItemType,
             AddWishVal},
            active,
            State = #state{map_id = MapId, joins = Joins,
                           rank_list = RankList, wish_val = LanternWishVal,
                           wish_msg = WishMsgList, role_rank = RoleRank}) ->
    {NewJoins, NewRoleRank} = case lists:keyfind(RoleId,
                                                 #enjoy_moon_role_info.role_id,
                                                 Joins)
                                  of
                                  OldRoleInfo = #enjoy_moon_role_info{role_name
                                                                          =
                                                                          RoleName,
                                                                      wish_val =
                                                                          OldRoleWishVal} ->
                                      NewRoleInfo =
                                          OldRoleInfo#enjoy_moon_role_info{wish_val
                                                                               =
                                                                               OldRoleWishVal
                                                                                   +
                                                                                   AddWishVal,
                                                                           guild_id
                                                                               =
                                                                               GuildId,
                                                                           guild_name
                                                                               =
                                                                               GuildName},
                                      Rk = {RoleId,
                                            RoleName,
                                            GuildId,
                                            GuildName,
                                            OldRoleWishVal + AddWishVal},
                                      Joins1 = lists:keystore(RoleId,
                                                              #enjoy_moon_role_info.role_id,
                                                              Joins,
                                                              NewRoleInfo),
                                      RoleRank1 = lists:keystore(RoleId,
                                                                 1,
                                                                 RoleRank,
                                                                 Rk),
                                      RoleRank2 =
                                          lists:sublist(util:keys_sort([5],
                                                                       RoleRank1),
                                                        100),
                                      {Joins1, RoleRank2};
                                  _ -> {Joins, RoleRank}
                              end,
    NewRankList = case GuildId =/= {0, "", 0} of
                      true ->
                          case lists:keyfind(GuildId,
                                             #enjoy_moon_guild_wish_info.id,
                                             RankList)
                              of
                              GuildWishInfo =
                                  #enjoy_moon_guild_wish_info{wish_val =
                                                                  OldGuildWishVal} ->
                                  NewGuildWishInfo =
                                      GuildWishInfo#enjoy_moon_guild_wish_info{wish_val
                                                                                   =
                                                                                   OldGuildWishVal
                                                                                       +
                                                                                       AddWishVal},
                                  lists:keystore(GuildId,
                                                 #enjoy_moon_guild_wish_info.id,
                                                 RankList,
                                                 NewGuildWishInfo);
                              _ ->
                                  NewGuildWishInfo =
                                      #enjoy_moon_guild_wish_info{id = GuildId,
                                                                  name =
                                                                      GuildName,
                                                                  wish_val =
                                                                      AddWishVal},
                                  lists:keystore(GuildId,
                                                 #enjoy_moon_guild_wish_info.id,
                                                 RankList,
                                                 NewGuildWishInfo)
                          end;
                      _ -> RankList
                  end,
    SortRankInfo =
        util:keys_sort([#enjoy_moon_guild_wish_info.wish_val],
                       NewRankList),
    NewWishMsgList = case ItemType of
                         1 -> lists:sublist([WishMsg | WishMsgList], 100);
                         2 ->
                             notice:cast({map, MapId}, 9, WishMsg),
                             WishMsgList;
                         _ -> WishMsgList
                     end,
    NewLanternsWishVal = min(LanternWishVal + AddWishVal,
                             3000),
    NewState = State#state{wish_val = NewLanternsWishVal,
                           rank_list = SortRankInfo, wish_msg = NewWishMsgList,
                           joins = NewJoins, role_rank = NewRoleRank},
    continue(active, NewState);
handle_info({leave, RoleId}, StateName,
            State = #state{joins = Joins}) ->
    case lists:keyfind(RoleId,
                       #enjoy_moon_role_info.role_id,
                       Joins)
        of
        OldRoleInfo = #enjoy_moon_role_info{} ->
            NewRoleInfo = OldRoleInfo#enjoy_moon_role_info{status =
                                                               0,
                                                           pid = undefind},
            NewJoins = lists:keystore(RoleId,
                                      #enjoy_moon_role_info.role_id,
                                      Joins,
                                      NewRoleInfo),
            NewState = State#state{joins = NewJoins},
            continue(StateName, NewState);
        _ -> continue(StateName, State)
    end;
handle_info({'EXIT', _, normal}, StateName, State) ->
    continue(StateName, State);
handle_info({set_wish_val, WishVal}, StateName,
            State = #state{}) ->
    NewState = State#state{wish_val = WishVal},
    continue(StateName, NewState);
handle_info(print, StateName, State) ->
    logger:info("状态:~w 赏月会信息:~w",
                [StateName, State],
                camp_enjoy_moon,
                454),
    continue(StateName, State);
handle_info(next, idel, State) ->
    self() ! start_enjoy_moon,
    continue(idel, State);
handle_info(next, active, State) ->
    gen_fsm:send_event(camp_enjoy_moon, timeout),
    continue(active, State);
handle_info(_Othe, idel, State) ->
    logger:info("活动已经关闭，未处理的消息:~w",
                [_Othe],
                camp_enjoy_moon,
                466),
    continue(idel, State);
handle_info(_Info, StateName, State) ->
    logger:error("状态:~w 未知消息 ~w",
                 [StateName, _Info],
                 camp_enjoy_moon,
                 470),
    continue(StateName, State).

terminate(_Reason, _StateName, _State) -> ok.

code_change(_OldVsn, StateName, State, _Extra) ->
    {ok, StateName, State}.

continue(StateName,
         State = #state{timeout = infinity}) ->
    {next_state, StateName, State, infinity};
continue(StateName,
         State = #state{ts = Ts, timeout = Timeout}) ->
    {next_state,
     StateName,
     State,
     util:time_left(Timeout, Ts)}.

continue(Reply, StateName,
         State = #state{timeout = infinity}) ->
    {reply, Reply, StateName, State, infinity};
continue(Reply, StateName,
         State = #state{ts = Ts, timeout = Timeout}) ->
    {reply,
     Reply,
     StateName,
     State,
     util:time_left(Timeout, Ts)}.

idel(timeout, State) -> continue(idel, State).

active(timeout,
       State = #state{joins = Joins, map_id = MapId}) ->
    kick_roles(Joins),
    role_group:pack_send(world, 14066, {0, 0}),
    calc_wish_rank_reward(State),
    NoticeMsg =
        notice:format(lang:get("花好月圆人团圆，~ts结束了，请等待下一次赏月会的到来{face_1,3}"),
                      [{string_2, 1, lang:get("中秋赏月会")}]),
    notice:cast(all, 5, NoticeMsg),
    NewState = State#state{ts = now(), timeout = infinity,
                           joins = [], rank_list = [], role_rank = [],
                           wish_msg = [], wish_val = 0, unit_pos = 1},
    unit_mgr:remove({35, 1}),
    unit_mgr:remove({35, 2}),
    unit_mgr:remove({35, 3}),
    unit_mgr:remove({35, 4}),
    unit_mgr:remove({35, 5}),
    unit_mgr:remove_map_all(MapId, {fun_type, 51}),
    continue(idel, NewState).

create_box(_, Len) when Len =< 0 -> ok;
create_box(MapId, Len) ->
    CreateNum = max(1, round(Len * 9.0e-1)),
    case unit_mgr:fetch_ids(CreateNum) of
        {ok, Ids = [_ | _]} -> do_create_box(MapId, Ids);
        _Err ->
            logger:error("无法创建赏月活动盒子:~w",
                         [_Err],
                         camp_enjoy_moon,
                         540),
            ok
    end.

do_create_box(_MapId, []) -> ok;
do_create_box(MapId, [Id | T]) ->
    case map:rand_pos(51021) of
        {X, Y} ->
            case unit_mgr:create({35, Id}, 74135, {MapId, X, Y}) of
                {ok, _} -> do_create_box(MapId, T);
                _Err ->
                    logger:error("创建赏月活动盒子时出错:~w",
                                 [_Err],
                                 camp_enjoy_moon,
                                 551),
                    do_create_box(MapId, T)
            end;
        _Err ->
            logger:error("赏月地图获取随机坐标时出错:~w",
                         [_Err],
                         camp_enjoy_moon,
                         555),
            do_create_box(MapId, T)
    end.

gain_exp(_, [], _, NewJoins) -> NewJoins;
gain_exp(WorldLev,
         [Joiner = #enjoy_moon_role_info{pid = Pid,
                                         guild_id = GuildId,
                                         total_exp = TotalExp, lev = Lev,
                                         status = 1}
          | Rest],
         RankInfo, NewJoins) ->
    WishVal = case GuildId =/= {0, "", 0} of
                  true ->
                      case lists:keyfind(GuildId,
                                         #enjoy_moon_guild_wish_info.id,
                                         RankInfo)
                          of
                          #enjoy_moon_role_info{wish_val = Val} -> Val;
                          _ -> 0
                      end;
                  _ -> 0
              end,
    Mod = camp_mid_autumn_data:get_wish_exp(WishVal),
    role:apply(async,
               Pid,
               {camp_enjoy_moon, apply_gain_exp, [Mod]}),
    AddExp1 = case levup_data:get_exp({Mod, Lev}) of
                  #{exp := AddExp} -> AddExp;
                  _ -> 0
              end,
    {_, ExpRatio, _} = world_lev:calc_exp(Lev, WorldLev),
    AddExp2 = round(AddExp1 * ExpRatio / 1000),
    NewJoiner = Joiner#enjoy_moon_role_info{total_exp =
                                                TotalExp + AddExp2},
    gain_exp(WorldLev,
             Rest,
             RankInfo,
             [NewJoiner | NewJoins]);
gain_exp(WorldLev, [_Other | Rest], RankInfo,
         NewJoins) ->
    gain_exp(WorldLev, Rest, RankInfo, [_Other | NewJoins]).

kick_roles([]) -> ok;
kick_roles([#enjoy_moon_role_info{role_id = _RoleId,
                                  pid = RolePid, status = 1}
            | Rest])
    when is_pid(RolePid) ->
    logger:debug("玩家退出孔明灯会:~w",
                 [_RoleId],
                 camp_enjoy_moon,
                 588),
    role:apply(async,
               RolePid,
               {camp_mid_autumn, apply_leave_enjoy_moon, [false]}),
    kick_roles(Rest);
kick_roles([_ | Rest]) -> kick_roles(Rest).

calc_wish_rank_reward(#state{rank_list = RankList,
                             joins = Joins}) ->
    case
        util:keys_sort([#enjoy_moon_guild_wish_info.wish_val],
                       RankList)
        of
        [#enjoy_moon_guild_wish_info{id = GuildId,
                                     name = GuildName, wish_val = WishVal}
         | _] ->
            Msg =
                notice:format(lang:get("恭喜~ts公会以~ts点祈愿值夺得第一名，参与成员获得~ts"),
                              [{string_2, 1, GuildName},
                               {string_2, 1, WishVal},
                               {item_2, [{23595, 1}]}]),
            notice:cast(all, 5, Msg),
            Title = lang:get("祈愿奖励"),
            Content = lang:get("公会祈愿获得第一名，发放奖励如下"),
            Items = [{23595, 0, 1}],
            do_calc_wish_rank_reward(GuildId,
                                     #{title => Title, content => Content,
                                       items => Items},
                                     Joins);
        _ -> skip
    end.

do_calc_wish_rank_reward(_GuildId, _MailInfo, []) -> ok;
do_calc_wish_rank_reward(GuildId, MailInfo,
                         [#enjoy_moon_role_info{role_id = RoleId,
                                                guild_id = GuildId}
                          | T]) ->
    mail:send(RoleId, MailInfo),
    do_calc_wish_rank_reward(GuildId, MailInfo, T);
do_calc_wish_rank_reward(GuildId, MailInfo, [_ | T]) ->
    do_calc_wish_rank_reward(GuildId, MailInfo, T).

enjoy_moon_info(#state{joins = Joins, ts = Ts,
                       timeout = Timeout, wish_val = WishVal,
                       rank_list = RankList},
                RoleId)
    when is_integer(Timeout) ->
    {_, BegSec, _} = Ts,
    {_, Sec, _} = now(),
    LeftTime = Timeout div 1000 - (Sec - BegSec),
    RankInfo = fetch_rank_info(RankList, 1, []),
    case lists:keyfind(RoleId,
                       #enjoy_moon_role_info.role_id,
                       Joins)
        of
        #enjoy_moon_role_info{total_exp = TotalExp} ->
            {LeftTime, TotalExp, WishVal, RankInfo};
        _ -> {LeftTime, 0, WishVal, RankInfo}
    end;
enjoy_moon_info(_, _) -> {0, 0, 0, []}.

sync_enjoy_moon_info(#state{joins = Joins, ts = Ts,
                            timeout = Timeout, wish_val = WishVal,
                            rank_list = RankList})
    when is_integer(Timeout) ->
    {_, BegSec, _} = Ts,
    {_, Sec, _} = now(),
    LeftTime = Timeout div 1000 - (Sec - BegSec),
    RankInfo = fetch_rank_info(RankList, 1, []),
    sync_enjoy_moon_info(Joins,
                         LeftTime,
                         WishVal,
                         RankInfo);
sync_enjoy_moon_info(_) -> ok.

fetch_rank_info([], _, RankInfo) -> RankInfo;
fetch_rank_info([#enjoy_moon_guild_wish_info{name =
                                                 Name,
                                             wish_val = Val}
                 | Rest],
                Rank, RankInfo) ->
    fetch_rank_info(Rest,
                    Rank + 1,
                    [{Rank, Name, Val} | RankInfo]);
fetch_rank_info([_ | Rest], Rank, RankInfo) ->
    fetch_rank_info(Rest, Rank, RankInfo).

sync_enjoy_moon_info([], _, _, _) -> ok;
sync_enjoy_moon_info([#enjoy_moon_role_info{pid = Pid,
                                            total_exp = TotalExp}
                      | Rest],
                     LeftTime, WishVal, RankInfo)
    when is_pid(Pid) ->
    role:pack_send(Pid,
                   14065,
                   {LeftTime, TotalExp, WishVal, RankInfo}),
    sync_enjoy_moon_info(Rest, LeftTime, WishVal, RankInfo);
sync_enjoy_moon_info([_ | Rest], LeftTime, WishVal,
                     RankInfo) ->
    sync_enjoy_moon_info(Rest, LeftTime, WishVal, RankInfo).

