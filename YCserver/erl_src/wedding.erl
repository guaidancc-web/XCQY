-file("src/mod/wedding/wedding.erl", 1).

-module(wedding).

-export([init/0,
         req/3,
         apply_req/9,
         agree/3,
         apply_agree/9,
         start/3,
         apply_start/1,
         apply_start_fail/1,
         apply_gain/4,
         apply_enter/3,
         enter/1,
         apply_guest_enter/6,
         leave/1,
         apply_leave/1,
         apply_pos/5,
         apply_set_event/2,
         apply_say/2,
         apply_move/4,
         agree_apply/2,
         act/3,
         act_gain/2,
         act_main_gain/3,
         act_apply/5,
         get_look/1,
         login/1,
         logout/1,
         update_looks/1,
         update_wedding/3,
         set_name/1,
         apply_set_name/3,
         barrage_apply/2,
         push_lover/1,
         apply_evt/2,
         lover/1,
         push_wedding/1,
         update_fc/1,
         calc/1,
         act_name/1,
         buff_flag/1,
         apply_love_score/3,
         add_honor/1,
         check_pick/2,
         divorce_reply/2,
         apply_divorce_reply/4,
         divorce/2,
         divorce_apply/2,
         guild_cast/1,
         is_couple/2,
         query_family_info/1,
         update_family/2,
         family_divorce/3,
         apply_family_divorce/2]).

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

-file("src/mod/wedding/wedding.erl", 64).

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

-file("src/mod/wedding/wedding.erl", 65).

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

-file("src/mod/wedding/wedding.erl", 66).

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

-file("src/mod/wedding/wedding.erl", 67).

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

-file("src/mod/wedding/wedding.erl", 68).

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

-file("src/mod/wedding/wedding.erl", 69).

-file("inc/map.hrl", 1).

-record(map,
        {id = 1 :: pos_integer(),
         platform = "" :: list(),
         zone_id = 0 :: non_neg_integer(),
         base_id = 1 :: pos_integer(),
         res_id = 0 :: non_neg_integer(),
         pid :: undefined | pid(),
         ctrl_pid :: undefined | pid(),
         grid_info = [] :: [{pid(), pos_integer()}],
         name = "" :: bitstring(),
         condition = [] :: list(),
         num = 0 :: non_neg_integer(),
         width = 1 :: pos_integer(),
         height = 1 :: pos_integer()}).

-record(map_grid,
        {map_pid :: undefined | pid(),
         map_id = 1 :: pos_integer(),
         base_id = 1 :: pos_integer(),
         width = 1 :: pos_integer(),
         height = 1 :: pos_integer()}).

-record(map_data,
        {id = 1 :: pos_integer(),
         name = "" :: list(),
         condition = [] :: [tuple()],
         revive = [] :: [tuple()],
         width = 1 :: pos_integer(),
         height = 1 :: pos_integer(),
         grid_x = 0 :: pos_integer(),
         grid_y = 0 :: pos_integer(),
         max_pre_layer = 60 :: pos_integer(),
         startup = 0 :: 0..1,
         is_single = 0 :: 0..1}).

-file("src/mod/wedding/wedding.erl", 70).

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

-file("src/mod/wedding/wedding.erl", 71).

-file("inc/looks.hrl", 1).

-file("src/mod/wedding/wedding.erl", 72).

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

-file("src/mod/wedding/wedding.erl", 73).

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

-file("src/mod/wedding/wedding.erl", 74).

-file("inc/buff.hrl", 1).

-record(m_buff, {ver = 2, r_list = [], show = 1}).

-record(buff_base,
        {id = 1,
         name = "",
         class = 0,
         lev = 0,
         cancel = 0,
         same_buff_mode = 0,
         type = 1,
         sub_type = 0,
         time_mode = 0,
         max_time_num = 1,
         duration = 0,
         max_effect_lev = 1,
         looks = [],
         attr = [],
         guard_attr = [],
         pet_attr = [],
         end_date = 0,
         extra = [],
         effect = [],
         dynamic_attr = [],
         pvp_limit = 0,
         desc = ""}).

-record(buff,
        {ver = 4,
         id = 1,
         class = 0,
         lev = 0,
         cancel = 0,
         type = 1,
         same_buff_mode = 0,
         time_mode = 0,
         duration = 0,
         max_duration = 1,
         effect_lev = 1,
         end_date = 0,
         start_time = 0,
         looks = [],
         dynamic_attr = [],
         pvped = 0,
         ext_param = [],
         args = 1}).

-file("src/mod/wedding/wedding.erl", 75).

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

-file("src/mod/wedding/wedding.erl", 76).

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

-file("src/mod/wedding/wedding.erl", 77).

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

-file("src/mod/wedding/wedding.erl", 78).

-file("inc/limit_return.hrl", 1).

-record(limit_return_server, {white = [], black = []}).

-record(m_limit_return,
        {ver = 1,
         flag = 0,
         login_time = 0,
         check_time = 0,
         start_time = 0,
         keep_time = 0,
         pay_time = 0,
         end_time = 0,
         check_time_list = [],
         acc = 0,
         return = 0,
         num = 0}).

-file("src/mod/wedding/wedding.erl", 79).

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

-file("src/mod/wedding/wedding.erl", 80).

-file("inc/teacher.hrl", 1).

-record(m_teacher,
        {id = {0, "", 0},
         ver = 2,
         name = "",
         status = 0,
         daily = [],
         daily_reward = 0,
         daily_time = 0,
         target = [],
         target_reward = [],
         target_rewarded = [],
         target_over = [],
         evaluation = [],
         study_lev = 0,
         mtime = 0,
         daily_goals = [],
         goals_times = 0}).

-record(teacher,
        {id = {0, "", 0},
         ver = 1,
         name = "",
         sex = 0,
         classes = 0,
         lev = 0,
         guild_id = {0, "", 0},
         guild_name = "",
         msg = "",
         teacher_score = 0,
         teacher_score_offline = 0,
         login_time = 0,
         fc = 0,
         students = []}).

-record(student,
        {id = {0, "", 0},
         ver = 2,
         name = "",
         sex = 0,
         classes = 0,
         lev = 0,
         status = 0,
         in_time = 0,
         out_time = 0,
         login_time = 0,
         guild_id = {0, "", 0},
         guild_name = "",
         daily = [],
         daily_time = 0,
         daily_reward = 0,
         quest_student_reward = 0,
         quest_teacher_reward = 0,
         encourage_time = 0,
         target = [],
         teacher_score = 0,
         fc = 0,
         target_reward = [],
         target_rewarded = []}).

-record(teacher_daily,
        {id = 1 :: pos_integer(),
         finish = 0 :: 0..2,
         progress = [] :: [tuple()]}).

-record(teacher_daily_data,
        {id = 1 :: pos_integer(),
         name = "" :: binary(),
         progress = [] :: [tuple()],
         reward = [],
         exp = 0}).

-record(teacher_target,
        {id = 1 :: pos_integer(),
         finish = 0 :: 0..2,
         progress = [] :: [tuple()]}).

-record(teacher_target_data,
        {id = 1 :: pos_integer(),
         name = "" :: binary(),
         progress = [] :: [tuple()],
         student_reward = [],
         teacher_reward = [],
         student_exp = 0,
         teacher_exp = 0}).

-record(teacher_sign,
        {id = {0, "", 0},
         ver = 1,
         name = "",
         sex = 0,
         classes = 0,
         lev = 0,
         online = 0,
         login_time = 0,
         logout_time = 0,
         online_time = 0,
         is_sign = 0,
         msg = ""}).

-record(teacher_quit_desc_data,
        {min = 0, max = 0, radio = 0, title = "", msg = ""}).

-record(teacher_student_sign_info,
        {id = {0, "", 0},
         name = "",
         sex = 0,
         classes = 0,
         lev = 0,
         msg = ""}).

-file("src/mod/wedding/wedding.erl", 81).

-file("inc/family.hrl", 1).

-record(beans_reward,
        {id = 0,
         giver_id = {0, "", 0},
         giver_name = "",
         belong_id = {0, "", 0},
         pos = {0, 0},
         give_time = 0}).

-record(magic_beans,
        {ver = 2,
         growth = 0 :: non_neg_integer(),
         flower_num = 0 :: non_neg_integer(),
         wake_time = 0 :: non_neg_integer(),
         event_record = [],
         fosters = [],
         inviters = [],
         beans_rewards = [],
         next_beanrw_id = 0}).

-record(family_info,
        {ver = 5 :: pos_integer(),
         id = {0, "", 0},
         master_id = {0, "", 0},
         master_name = "",
         master_classes = 0 :: pos_integer(),
         master_lev = 1 :: pos_integer(),
         master_sex = 0 :: 0..2,
         lover_id = {0, "", 0},
         lover_name = "",
         pid :: undefined | pid(),
         house_info = undefined,
         yard_info = undefined,
         visitor = [],
         last_visit_time = 0,
         visit_lock = 1,
         last_rf_time = 0,
         magic_beans = #magic_beans{},
         battle_id}).

-record(furnishing,
        {id = 0 :: non_neg_integer(),
         base_id = 0,
         num = 1,
         status = 1,
         belong = {0, "", 0},
         pos = {1, 1, 1, 1} :: tuple(),
         dir = 0 :: 0..1}).

-record(house_info,
        {ver = 3 :: pos_integer(),
         map_id = 0,
         map_pid :: undefined | pid(),
         furnishings = [] :: list(),
         env_val = 0,
         lev = 1 :: pos_integer(),
         floor_lev = 0 :: non_neg_integer(),
         bdg_info = [] :: list(),
         furishing_max_lev_info = [] :: list(),
         next_fur_id = 1,
         cleanness = 100,
         last_clean_time = 0,
         housekeeper_action_times = 0,
         is_upgrade_bdg = []}).

-record(building_info, {type = 1, lev = 0, exp = 0}).

-record(yard_info,
        {ver = 1 :: pos_integer(),
         map_id = 0,
         map_pid :: undefined | pid(),
         furnishings = [] :: list(),
         levl = 1 :: pos_integer(),
         floor_lev = 0 :: non_neg_integer()}).

-record(family_store,
        {ver = 1,
         next_time = 0 :: non_neg_integer(),
         goods_list = []}).

-record(m_family,
        {ver = 1,
         cur_id = {0, "", 0},
         pid :: undefined | pid(),
         idle_family = {0, "", 0},
         family_store = #family_store{},
         family_effect = [],
         effect_use_info = []}).

-record(family_pet_train_info,
        {id = 1, pet_id = 0, end_time = 0}).

-record(fshop_item,
        {id = 0,
         store_type = 1,
         base_id = 0,
         type = 90000,
         val = 0,
         count = 1}).

-record(family_child,
        {id = {0, "", 0},
         name = "",
         classes = 0 :: pos_integer(),
         lev = 1 :: pos_integer(),
         sex = 0 :: 0..2,
         stage = 0 :: non_neg_integer(),
         base_id = 0 :: non_neg_integer(),
         unit_id = {0, 0},
         unit_base_id = 0}).

-file("src/mod/wedding/wedding.erl", 82).

-file("inc/camp_web.hrl", 1).

-record(m_camp_web,
        {ver = 4 :: non_neg_integer(),
         acc = [] :: list(),
         can_reward = [] :: list(),
         rewarded = [] :: list(),
         overdue_time = 0 :: non_neg_integer(),
         end_reward = [] :: list(),
         time_list = [] :: list(),
         card_info = {0, 0, 0, []} :: tuple()}).

-record(camp_web_ico,
        {id = 0 :: non_neg_integer(),
         name = "" :: bitstring(),
         title = "" :: bitstring(),
         ico = "" :: bitstring(),
         alert = "" :: bitstring(),
         gif = "" :: bitstring(),
         start_time = 0 :: non_neg_integer(),
         end_time = 0 :: non_neg_integer(),
         login_open = 0 :: non_neg_integer(),
         is_show_time = 0 :: 0..1,
         menu_list = [] :: list()}).

-record(camp_web_menu,
        {id = 0 :: non_neg_integer(),
         type = 0 :: non_neg_integer(),
         sec_type = 0 :: non_neg_integer(),
         settlement = 0 :: non_neg_integer(),
         reward_mod = 0 :: non_neg_integer(),
         mail_title = "" :: bitstring(),
         mail_content = "" :: bitstring(),
         title = "" :: bitstring(),
         title2 = "" :: bitstring(),
         ico = "" :: bitstring(),
         title_ico = "" :: bitstring(),
         type_ico = "" :: bitstring(),
         total_ico = 0 :: non_neg_integer(),
         start_time = 0 :: non_neg_integer(),
         end_time = 0 :: non_neg_integer(),
         sort_val = 0 :: non_neg_integer(),
         top_banner = "" :: bitstring(),
         rule_str = "" :: bitstring(),
         time_str = "" :: bitstring(),
         bottom_alert = "" :: bitstring(),
         reward_title = "" :: bitstring(),
         panel_type = "" :: bitstring(),
         cli_reward = "" :: bitstring(),
         button_text = "" :: bitstring(),
         is_button = 0 :: 0..1,
         notice_msg = "" :: bitstring(),
         camp_list = [] :: list(),
         is_tran = 0,
         tran_info = ""}).

-record(camp_web,
        {id = 0 :: non_neg_integer(),
         n = 1 :: pos_integer(),
         key = {0, 0} :: tuple(),
         type = 0 :: non_neg_integer(),
         sec_type = 0 :: non_neg_integer(),
         third_type = 0 :: non_neg_integer(),
         settlement = 0 :: non_neg_integer(),
         reward_num = 1 :: non_neg_integer(),
         reward_can = 0 :: non_neg_integer(),
         value = 0 :: non_neg_integer(),
         tar_val = 0 :: non_neg_integer(),
         ext_val = 0 :: non_neg_integer(),
         status = 0 :: 0..2,
         cond_msg = "" :: bitstring(),
         loss_items = [] :: list(),
         items = [] :: list(),
         val1 = 0 :: non_neg_integer(),
         val2 = 0 :: non_neg_integer(),
         val3 = 0 :: non_neg_integer(),
         val4 = 0 :: non_neg_integer(),
         str1 = "" :: bitstring(),
         str2 = "" :: bitstring(),
         str3 = "" :: bitstring(),
         str4 = "" :: bitstring(),
         extra = [],
         data :: undefined | any(),
         is_desc = 0 :: 0..1}).

-record(camp_handle,
        {time = 0 :: non_neg_integer(),
         evt = {evt_rpc} :: tuple(),
         total_camp :: undefined | #camp_web_ico{},
         menu :: undefined | #camp_web_menu{},
         camp :: undefined | #camp_web{},
         call_form = rpc :: evt | rpc,
         add_can_reward = 0 :: non_neg_integer(),
         rpc_reward_num = 1 :: non_neg_integer(),
         push_cli = 0 :: 0..1,
         push_list = [] :: [tuple()],
         to_id,
         return_acc = 0}).

-file("src/mod/wedding/wedding.erl", 83).

-file("inc/honor.hrl", 1).

-record(m_honor,
        {ver = 3,
         use_id = 0,
         last_id = 0,
         r_list = [] :: list(),
         pre_id = 0,
         r_pre_list = [] :: list(),
         pre_reward_list = [] :: list()}).

-record(honor,
        {id = 0 :: non_neg_integer(),
         end_time = 0 :: non_neg_integer()}).

-record(pre_honor,
        {pre_id = 0 :: non_neg_integer(),
         end_time = 0 :: non_neg_integer()}).

-record(honor_info,
        {key :: undefined | atom(),
         list = [] :: list(),
         end_time = 0 :: non_neg_integer()}).

-record(honor_base,
        {id = 0 :: non_neg_integer(),
         name = "" :: list(),
         type = 0 :: non_neg_integer(),
         mode_type = 0 :: non_neg_integer(),
         show_type = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         is_cast = 0,
         sex = 2 :: non_neg_integer(),
         attr_list = [] :: list(),
         is_can_pre = 0 :: non_neg_integer(),
         collect_val = 0 :: non_neg_integer(),
         color = 12 :: non_neg_integer()}).

-record(pre_honor_base,
        {pre_id = 0 :: non_neg_integer(),
         pre_name = "" :: list(),
         is_cast = 0,
         items = [] :: list(),
         loss_items = [] :: list()}).

-file("src/mod/wedding/wedding.erl", 84).

-spec login(#role{}) -> ok | {ok, #role{}}.

login(Role = #role{id = RoleId, pid = RolePid,
                   s_event = Event})
    when Event =:= 14 orelse Event =:= 15 ->
    wedding_mgr:cast({login, RoleId, RolePid, Event}),
    login2(Role);
login(Role = #role{id = RoleId, s_event = 12,
                   m_wedding = MWedding}) ->
    case wedding_mgr:call({login, RoleId, self()}) of
        ok -> login2(Role);
        _ ->
            {ok, NRole} = map:role_enter(util:rand_list([{10001,
                                                          306,
                                                          3507},
                                                         {10001, 2583, 3848},
                                                         {10001, 4957, 3680},
                                                         {10001, 445, 2565},
                                                         {10001, 4646, 704},
                                                         {10001, 841, 1033},
                                                         {10001, 2098, 1834},
                                                         {10001, 3617, 1816}]),
                                         Role#role{s_event = 0,
                                                   m_wedding =
                                                       MWedding#m_wedding{status
                                                                              =
                                                                              3}}),
            login2(NRole)
    end;
login(Role = #role{id = RoleId, s_event = 13,
                   m_wedding = MWedding}) ->
    case wedding_mgr:call({login, RoleId, self()}) of
        ok -> login2(Role);
        _ ->
            {ok, NRole} = map:role_enter(util:rand_list([{10001,
                                                          306,
                                                          3507},
                                                         {10001, 2583, 3848},
                                                         {10001, 4957, 3680},
                                                         {10001, 445, 2565},
                                                         {10001, 4646, 704},
                                                         {10001, 841, 1033},
                                                         {10001, 2098, 1834},
                                                         {10001, 3617, 1816}]),
                                         Role#role{s_event = 0,
                                                   m_wedding =
                                                       MWedding#m_wedding{status
                                                                              =
                                                                              3}}),
            login2(NRole)
    end;
login(Role = #role{s_event = 0,
                   m_wedding = MWedding = #m_wedding{status = 2}}) ->
    NRole = Role#role{m_wedding =
                          MWedding#m_wedding{status = 3}},
    login2(NRole);
login(Role) -> login2(Role).

login2(TmpRole) ->
    L = [#trigger{label = evt_levup, a = [], m = wedding,
                  f = apply_evt},
         #trigger{label = evt_wedding_req_agreed, a = [],
                  m = wedding, f = apply_evt},
         #trigger{label = evt_wedding_marry, a = [], m = wedding,
                  f = apply_evt},
         #trigger{label = evt_wedding_divorce, a = [],
                  m = wedding, f = apply_evt}],
    {_, TmpRole2} = role_trigger:add(L, TmpRole),
    Role = #role{id = Id,
                 m_wedding = MWedding = #m_wedding{status = Status}} =
               login_check(TmpRole2),
    Role1 = case lover(Id) of
                {ok, #lover{status = 2, lover_id = LoverId}}
                    when Status == 3 ->
                    wedding_mgr:cast({update_lover,
                                      Id,
                                      LoverId,
                                      [{#lover.status, Status}]}),
                    Role;
                {ok, #lover{status = 3}} when Status == 1 ->
                    Role#role{m_wedding = MWedding#m_wedding{status = 3}};
                _ -> Role
            end,
    NRole1 = init_honor(Role1),
    NRole2 = repaire_honor(NRole1),
    NRole3 = init_honor2(NRole2),
    wedding_rank:fire(NRole3, #evt_wedding_score{}),
    {ok, NRole3}.

login_check(Role = #role{id = RoleId,
                         m_family = #m_family{cur_id = CurId},
                         m_wedding =
                             MWedding = #m_wedding{lover_name = LName,
                                                   lover_id = OldLoverId,
                                                   status = Status}})
    when Status > 0 ->
    case lover(RoleId) of
        {ok,
         #lover{lover_name = LoverMame, lover_id = LoverId,
                status = LoverStatus}} ->
            case CurId =:= {0, "", 0} andalso
                     (LoverStatus =:= 2 orelse LoverStatus =:= 3)
                of
                true ->
                    case family_mgr:query_role_family_id(LoverId) of
                        FamilyId
                            when is_tuple(FamilyId) andalso
                                     FamilyId =/= CurId ->
                            role:apply(async,
                                       self(),
                                       {wedding, update_family, [FamilyId]}),
                            ok;
                        false -> skip
                    end;
                false -> skip
            end,
            NewLoverId = case OldLoverId of
                             {0, _, _} -> LoverId;
                             _ -> OldLoverId
                         end,
            NewLoverStatus = case LoverStatus =:= 2 orelse
                                      LoverStatus =:= 3
                                 of
                                 true -> 3;
                                 _ -> LoverStatus
                             end,
            Role#role{m_wedding =
                          MWedding#m_wedding{lover_id = NewLoverId,
                                             lover_name = LoverMame,
                                             status = NewLoverStatus}};
        _ ->
            Role1 = Role#role{m_wedding =
                                  MWedding#m_wedding{lover_id = {0, "", 0},
                                                     status = 0,
                                                     lover_name = ""}},
            {ok, NRole1} = honor:del(Role1,
                                     [11058,
                                      11059,
                                      11060,
                                      11061,
                                      11222,
                                      11223,
                                      11224,
                                      11225],
                                     push),
            Role2 = attr:calc_and_push(NRole1),
            NRole = looks:calc(Role2),
            map:role_update(NRole),
            NewRole = var:set_var(NRole, other, 2007, 0),
            NewRole2 = var:set_var(NewRole, week, 208, 0),
            NewRole3 = var:set_var(NewRole2, acc, 1009, 0),
            NewRole4 = quest_marriage:divorce(NewRole3),
            NewRole5 = couple_skill:divorce(NewRole4),
            NewRole6 = quest_child:divorce(NewRole5),
            NewRole7 = quest_pregnancy:divorce(NewRole6),
            role:apply(async,
                       self(),
                       {friend_zone, update, [lover, ""]}),
            role:apply(async,
                       self(),
                       {wedding, apply_family_divorce, [LName]}),
            NewRole8 = role_trigger:fire(#evt_wedding_divorce{},
                                         NewRole7),
            NewRole8
    end;
login_check(Role) -> Role.

logout(#role{id = RoleId, s_event = Event})
    when Event =:= 14 orelse Event =:= 15 ->
    wedding_mgr:cast({logout, RoleId}),
    ok;
logout(_Role) -> ok.

apply_evt(#evt_levup{},
          #role{id = RoleId,
                m_wedding =
                    #m_wedding{lover_id = LoverId, status = Status},
                lev = Lev})
    when Status >= 1 ->
    case lover(LoverId) of
        {ok, #lover{lover_id = RoleId}} ->
            wedding_mgr:cast({update_lover,
                              LoverId,
                              RoleId,
                              [{#lover.lover_lev, Lev}]});
        _ -> ignore
    end,
    ok;
apply_evt(#evt_wedding_req_agreed{}, Role) ->
    team:sync_info(Role),
    team_mgr:update_match_mate(Role),
    team_recruit:update(Role),
    ok;
apply_evt(#evt_wedding_marry{}, Role) ->
    team:sync_info(Role),
    team_mgr:update_match_mate(Role),
    team_recruit:update(Role),
    ok;
apply_evt(#evt_wedding_divorce{}, Role) ->
    team:sync_info(Role),
    team_mgr:update_match_mate(Role),
    team_recruit:update(Role),
    ok;
apply_evt(_, _) -> ok.

calc(Role = #role{s_event = 13}) ->
    Role#role{speed = 100};
calc(Role) -> Role.

update_fc(#role{id = RoleId,
                m_wedding =
                    #m_wedding{lover_id = LoverId, status = Status},
                attr = #attr{fc = Fc}})
    when Status >= 1 ->
    case lover(LoverId) of
        {ok, #lover{lover_id = RoleId}} ->
            wedding_mgr:cast({update_lover,
                              LoverId,
                              RoleId,
                              [{#lover.lover_fc, Fc}]});
        _ -> ignore
    end,
    ok;
update_fc(_Role) -> ok.

init() -> #m_wedding{}.

lover(RoleId) ->
    case catch ets:lookup(lover, RoleId) of
        [] -> null;
        [Lover] -> {ok, Lover};
        _ -> false
    end.

push_lover(_Role = #role{id = RoleId}) ->
    case lover(RoleId) of
        {ok,
         #lover{lover_id = LoverId, lover_name = LoverName,
                lover_classes = Classes, lover_sex = Sex,
                lover_lev = Lev, lover_face = Face, time = Time,
                status = Status, lover_fc = Fc}} ->
            {#friend_zone{signature = Signature}} =
                friend_zone:info(#role{id = LoverId}),
            Intimacy = friend:get_intimacy(RoleId, LoverId),
            sys_conn:pack_send(15014,
                               {LoverId,
                                LoverName,
                                Classes,
                                Sex,
                                Lev,
                                Face,
                                Fc,
                                Time,
                                Intimacy,
                                Status,
                                Signature});
        _ -> ignore
    end.

push_wedding(#role{m_wedding =
                       #m_wedding{lover_id = LoverId, lover_name = LoverName,
                                  status = Status}}) ->
    sys_conn:pack_send(15016, {LoverId, LoverName, Status}),
    ok.

buff_flag(Role) ->
    buff_flag(Role, [22000, 22004, 22005, 22006, 12250]).

buff_flag(_Role, []) -> true;
buff_flag(Role, [I | T]) ->
    case buff:lookup(Role, I) of
        #buff{} ->
            case util:rand(1, 100) =< 50 of
                true -> false;
                false -> true
            end;
        _ -> buff_flag(Role, T)
    end.

req(#role{id = RoleId}, RoleId, _Str) ->
    {false, lang:get("不能跟自己结缘")};
req(#role{lev = Lev}, _OtherRoleId, _Str)
    when Lev < 40 ->
    {false, lang:get("等级不足")};
req(#role{m_teacher =
              #m_teacher{id = OtherRoleId, status = 1}},
    OtherRoleId, _Str) ->
    {false, lang:get("对方是你师傅，不能申请结缘")};
req(Role = #role{sex = Sex, id = RoleId, name = Name,
                 classes = Classes, face = Face, lev = Lev,
                 m_team = #m_team{pid = TeamPid, status = 1}},
    OtherRoleId, Str)
    when is_pid(TeamPid) ->
    Now = date:unixtime(),
    {_, ItemNum} = package:count(by_base_id,
                                 20044,
                                 Role#role.p_bag),
    ReqFlag = case get(wedding_req) of
                  {OtherRoleId, ReqTime} when ReqTime + 20 =< Now -> true;
                  {OtherRoleId, _ReqTime} -> false;
                  _ -> true
              end,
    case role_misc:is_local_role(OtherRoleId) of
        true ->
            case role_query:local_pid(by_id, OtherRoleId) of
                _ when ReqFlag == false ->
                    {false, lang:get("你刚对对方进行结缘申请，请等待对方回应")};
                _ when ItemNum < 1 ->
                    {false,
                     lang:get("购买<color='#ffff00'>喜结良缘戒指</color>后才能结缘哦！")};
                {ok, Pid} ->
                    case team:get_members(Role) of
                        [_, _ | _] -> {false, lang:get("队伍中存在第三者，结缘被打扰了")};
                        [#team_mate{id = OtherRoleId, status = 2}] ->
                            Int = friend:get_intimacy(RoleId, OtherRoleId),
                            {NeedInt, Msg} = {999,
                                              notice:format(lang:get("亲密度达到 ~ts 才能结缘哦"),
                                                            [{string_1, 999}])},
                            case Int < NeedInt of
                                true -> {false, Msg};
                                _ ->
                                    case lover(RoleId) of
                                        null ->
                                            put(wedding_req,
                                                {OtherRoleId, Now}),
                                            role:apply(async,
                                                       Pid,
                                                       {wedding,
                                                        apply_req,
                                                        [RoleId,
                                                         self(),
                                                         Name,
                                                         Sex,
                                                         Str,
                                                         Classes,
                                                         Face,
                                                         Lev]}),
                                            ok;
                                        _ ->
                                            {false,
                                             lang:get("你已经结缘啦，好好珍惜对方不要朝三暮四哦")}
                                    end
                            end;
                        [#team_mate{id = OtherRoleId}] ->
                            {false, lang:get("让对方归队才能申请结缘")};
                        [_] -> {false, lang:get("心仪的对象不在队伍中，不能申请结缘")};
                        _ -> {false, lang:get("需要组上你心仪的对象才能过来申请结缘")}
                    end;
                _ -> {false, lang:get("对方不在线")}
            end;
        _ -> {false, lang:get("暂时不能向非本服的玩家申请结缘")}
    end;
req(#role{m_team = #m_team{pid = Pid}}, _, _)
    when is_pid(Pid) ->
    {false, lang:get("队长才能申请结缘")};
req(_, _, _) -> {false, lang:get("组上你心仪的对象才能过来申请结缘")}.

apply_req(#role{lev = Lev}, _ReqRoleId, ReqRolePid,
          _ReqName, _Sex, _Str, _Classes, _Face, _Lev)
    when Lev < 40 ->
    notice:send({pid, ReqRolePid},
                1,
                lang:get("对方等级不足"),
                []),
    ok;
apply_req(#role{sex = Sex}, _ReqRoleId, ReqRolePid,
          _ReqName, Sex, _Str, _Classes, _Face, _Lev) ->
    notice:send({pid, ReqRolePid},
                1,
                lang:get("暂时不支持同性结缘"),
                []),
    ok;
apply_req(#role{m_teacher =
                    #m_teacher{id = ReqRoleId, status = 1}},
          ReqRoleId, ReqRolePid, _ReqName, _Sex, _Str, _Classes,
          _Face, _Lev) ->
    notice:send({pid, ReqRolePid},
                1,
                lang:get("对方是你授业的徒弟，不能申请结缘"),
                []),
    ok;
apply_req(Role = #role{id = RoleId, pid = Pid},
          ReqRoleId, ReqRolePid, ReqName, Sex, Str, Classes, Face,
          Lev) ->
    SwornFlag = sworn:is_relation(Role, ReqRoleId),
    case lover(RoleId) of
        _ when SwornFlag == true ->
            notice:send({pid, ReqRolePid},
                        1,
                        notice:format(lang:get("您与~ts是结拜关系，不能申请结缘哟{face_1,30}"),
                                      [{role_2, Role}]),
                        []);
        null ->
            notice:effect({role_pid, Pid}, 30066),
            notice:effect({role_pid, ReqRolePid}, 30066),
            notice:send({pid, ReqRolePid},
                        1,
                        notice:format(lang:get("已向 ~ts 发出结缘申请，祝你成功！"),
                                      [{role_2, ReqName}])),
            sys_conn:pack_send(15001,
                               {1,
                                ReqRoleId,
                                Classes,
                                Sex,
                                Lev,
                                Face,
                                ReqName,
                                Str});
        _ ->
            notice:send({pid, ReqRolePid},
                        1,
                        lang:get("对方已结缘啦，好好祝福对方吧"),
                        [])
    end,
    ok.

agree(#role{id = RoleId, name = Name, sex = Sex,
            classes = Classes, lev = Lev, face = Face,
            attr = #attr{fc = Fc}},
      OtherId, Agree) ->
    case role_query:local_pid(by_id, OtherId) of
        {ok, Pid} ->
            Lover = #lover{id = RoleId, name = Name},
            role:apply(async,
                       Pid,
                       {wedding,
                        apply_agree,
                        [Lover, self(), Sex, Classes, Lev, Face, Fc, Agree]});
        _ -> notice:return(lang:get("对方不在线了"))
    end.

apply_agree(Role, Lover = #lover{id = OtherRoleId},
            OtherRolePid, Sex, Classes, Lev, Face, Fc, Agree) ->
    SwornFlag = sworn:is_relation(Role, OtherRoleId),
    case erase(wedding_req) of
        _ when SwornFlag == true ->
            notice:return(lang:get("您与对方是结拜关系，不能结缘哟{face_1,30}")),
            ok;
        {OtherRoleId, _Time} ->
            do_agree(Role,
                     Lover,
                     OtherRolePid,
                     Sex,
                     Classes,
                     Lev,
                     Face,
                     Fc,
                     Agree);
        _ ->
            notice:send({pid, OtherRolePid},
                        1,
                        lang:get("操作过期"),
                        []),
            ok
    end.

do_agree(Role = #role{id = RoleId, name = Name,
                      sex = RSex, classes = RClasses, lev = RLev,
                      face = RFace, attr = #attr{fc = RFc}},
         Lover = #lover{id = OtherId, name = OtherName},
         OtherRolePid, Sex, Classes, Lev, Face, Fc, 1) ->
    GL = [#loss{label = item_base_id_auto_buy,
                val = [{20044, 1}], auto_scene = lang:get("结婚")}],
    role:send_buff_begin(),
    case role_gain:do_notice(GL, Role, lang:get("申请结缘")) of
        {false, #loss{}} ->
            notice:return(lang:get("钻石不足")),
            notice:send({pid, OtherRolePid},
                        1,
                        lang:get("对方钻石不足"),
                        []),
            role:send_buff_clean(),
            ok;
        {ok, NRole} ->
            Lover1 = Lover#lover{lover_id = RoleId,
                                 lover_name = Name, lover_classes = RClasses,
                                 lover_lev = RLev, lover_fc = RFc,
                                 lover_face = RFace, lover_sex = RSex},
            Lover2 = #lover{id = RoleId, name = Name,
                            lover_id = OtherId, lover_name = OtherName,
                            lover_sex = Sex, lover_classes = Classes,
                            lover_lev = Lev, lover_fc = Fc, lover_face = Face},
            case wedding_mgr:call({order, Lover1, Lover2}) of
                RoleId ->
                    role:send_buff_clean(),
                    notice:return(lang:get("您已有结缘对象")),
                    notice:send({pid, OtherRolePid},
                                1,
                                lang:get("对方已有结缘对象"),
                                []),
                    ok;
                OtherId ->
                    role:send_buff_clean(),
                    notice:return(lang:get("对方已有结缘对象")),
                    notice:send({pid, OtherRolePid},
                                1,
                                lang:get("您已有结缘对象"),
                                []),
                    ok;
                {false, Reason} ->
                    role:send_buff_clean(),
                    notice:return(Reason),
                    notice:send({pid, OtherRolePid}, 1, Reason, []),
                    ok;
                _ ->
                    Msg = util:flist(lang:get("你同意了~ts的结缘申请，与Ta成为有缘人"),
                                     [Name]),
                    notice:send({pid, OtherRolePid}, 1, Msg, []),
                    role:apply(async, self(), {wedding, update_looks, []}),
                    role:apply(async,
                               OtherRolePid,
                               {wedding, update_looks, []}),
                    role:apply(async,
                               OtherRolePid,
                               {wedding,
                                update_wedding,
                                [agree_req,
                                 #m_wedding{lover_id = RoleId,
                                            lover_name = Name, status = 1}]}),
                    role:apply(async,
                               self(),
                               {friend_zone, update, [lover, OtherName]}),
                    role:send_buff_flush(),
                    sys_conn:pack_send(15001,
                                       {2,
                                        OtherId,
                                        Classes,
                                        Sex,
                                        Lev,
                                        Face,
                                        OtherName,
                                        ""}),
                    AgreeRole = NRole#role{m_wedding =
                                               #m_wedding{lover_id = OtherId,
                                                          lover_name =
                                                              OtherName,
                                                          status = 1}},
                    Evt = #evt_wedding_req_agreed{},
                    FireRole = role_trigger:fire(Evt, AgreeRole),
                    NewRole = FireRole,
                    push_wedding(NewRole),
                    map:role_update(NewRole),
                    add_honor(NewRole),
                    notice:cast(all,
                                4,
                                notice:format(lang:get("~ts向~ts申请结缘成功，又将有一对新人结合，恭喜他们{face_1,18}"),
                                              [{role_2, Role},
                                               {role_2, OtherName}])),
                    log:wedding(NewRole,
                                #{id => RoleId, name => Name,
                                  other_id => OtherId, other_name => OtherName,
                                  handle => "申请结缘", type => 1}),
                    {ok, NewRole}
            end
    end;
do_agree(Role = #role{name = Name},
         #lover{id = OtherRoleId, name = OtherName},
         OtherRolePid, Sex, Classes, Lev, Face, _Fc, _Agree) ->
    GL = [#loss{label = item_base_id, val = [{20044, 1}]},
          #gain{label = item_base_id, val = [{20047, 1, 1}]}],
    notice:send({pid, OtherRolePid},
                1,
                util:flist(lang:get("你拒绝了~ts的结缘申请"), [Name]),
                []),
    case role_gain:do_notice(GL, Role, lang:get("结缘申请")) of
        {false, #loss{msg = Msg}} ->
            notice:return(Msg),
            ok;
        {false, #gain{msg = Msg}} ->
            notice:return(Msg),
            ok;
        {ok, NRole} ->
            sys_conn:pack_send(15001,
                               {3,
                                OtherRoleId,
                                Classes,
                                Sex,
                                Lev,
                                Face,
                                OtherName,
                                ""}),
            {ok, NRole}
    end.

guild_cast(#role{id = RoleId, pid = Pid,
                 m_guild = #m_guild{id = GId}}) ->
    case role_misc:check_cd(rpc_wedding_guild) of
        true ->
            wedding_mgr:cast({guild_cast, RoleId, Pid, GId}),
            ok;
        _ -> {false, lang:get("你刚发过通知了，稍等一会吧")}
    end;
guild_cast(_Role) -> {false, lang:get("你还没有加入公会")}.

-spec start(#role{}, Type :: non_neg_integer(),
            FamilyId :: tuple()) -> {false, bitstring()} |
                                    {ok, #role{}}.

start(#role{cross_type = 1}, _, _) ->
    {false, lang:get("跨服状态不能开启典礼")};
start(Role = #role{id = Id,
                   m_wedding = #m_wedding{lover_id = LoverId, status = 1}},
      _Type = 0, _) ->
    case var:get_var(Role, other, 2007, 0) of
        0 ->
            mail:send(Id,
                      lang:get("申请结缘成功"),
                      lang:get("恭喜！你们离喜结连理还差最后一步，请尽快安排时间到<color='#ffff00'>圣心城"
                               "-丘比特</color>处举办典礼吧！"),
                      []),
            mail:send(LoverId,
                      lang:get("申请结缘成功"),
                      lang:get("恭喜！你们离喜结连理还差最后一步，请尽快安排时间到<color='#ffff00'>圣心城"
                               "-丘比特</color>处举办典礼吧！"),
                      []),
            Role1 = var:set_var(Role, other, 2007, 1),
            {ok, Role1};
        _ -> ok
    end;
start(#role{lev = Lev}, _Type, _) when Lev < 40 ->
    {false, lang:get("等级不足")};
start(Role = #role{m_team =
                       #m_team{pid = Pid, status = 1}},
      Type, FamilyId)
    when (Type =:= 1 orelse Type =:= 2) andalso
             is_pid(Pid) ->
    do_start(Role, Type, FamilyId);
start(_Role, Type, _)
    when Type =:= 1 orelse Type =:= 2 ->
    {false, lang:get("只有队长才能发起典礼")};
start(_Role, _Type, _) -> {false, lang:get("类型不正确")}.

do_start(Role = #role{id = RoleId, name = Name,
                      pid = SelfPid, m_team = #m_team{}, sex = _Sex,
                      m_wedding = MWedding},
         Type, CliFamilyId) ->
    case role_misc:check_event(Role) of
        {false, Reason} -> {false, Reason};
        _ ->
            case lover(RoleId) of
                {ok,
                 Lover = #lover{status = 1, lover_id = LoverId,
                                lover_name = LoverName,
                                lover_classes = LoverClasses,
                                lover_sex = LoverSex, lover_lev = LoverLev,
                                lover_face = LoverFace}} ->
                    SwornFlag = sworn:is_relation(Role, LoverId),
                    case role_query:pid(by_id, LoverId) of
                        _ when SwornFlag == true ->
                            notice:return(notice:format(lang:get("您与~ts是结拜关系，不能结缘哟{face_1,30}"),
                                                        [{role_2, LoverName}]));
                        {ok, Pid} ->
                            case team:get_members(Role) of
                                [_, _ | _] ->
                                    {false, lang:get("队伍中存在第三者，不能举办典礼")};
                                [#team_mate{id = LoverId, status = 2}] ->
                                    {Loss, LossMsg} = type_loss(Type, false),
                                    case role_gain:do_notice(Loss,
                                                             Role,
                                                             LossMsg)
                                        of
                                        {false, #loss{msg = Msg}} ->
                                            {false, Msg};
                                        {false, #gain{msg = Msg}} ->
                                            {false, Msg};
                                        {ok, NRole} ->
                                            case make_family_id(Role,
                                                                CliFamilyId)
                                                of
                                                FamilyId
                                                    when is_tuple(FamilyId) ->
                                                    case role:apply(sync,
                                                                    Pid,
                                                                    {wedding,
                                                                     apply_start,
                                                                     []})
                                                        of
                                                        {false, Reason} ->
                                                            {false,
                                                             util:flist(lang:get("对方~ts"),
                                                                        [Reason])};
                                                        ok ->
                                                            {ok, OtherLover} =
                                                                lover(LoverId),
                                                            Wedding =
                                                                init_wedding(Type,
                                                                             NRole,
                                                                             Lover#lover{type
                                                                                             =
                                                                                             Type},
                                                                             OtherLover#lover{type
                                                                                                  =
                                                                                                  Type},
                                                                             Pid,
                                                                             LoverClasses,
                                                                             LoverSex,
                                                                             LoverLev,
                                                                             LoverFace),
                                                            case
                                                                role_fly:force_landing(NRole)
                                                                of
                                                                {ok, NRole2} ->
                                                                    case
                                                                        wedding_mgr:call({start,
                                                                                          Wedding#{type
                                                                                                       =>
                                                                                                       Type}})
                                                                        of
                                                                        ok ->
                                                                            logger:debug("婚礼房间是：~w",
                                                                                         [FamilyId],
                                                                                         wedding,
                                                                                         534),
                                                                            role:apply(async,
                                                                                       SelfPid,
                                                                                       {team,
                                                                                        async_leave,
                                                                                        []}),
                                                                            role:apply(async,
                                                                                       Pid,
                                                                                       {team,
                                                                                        async_leave,
                                                                                        []}),
                                                                            role:apply(async,
                                                                                       Pid,
                                                                                       {wedding,
                                                                                        update_wedding,
                                                                                        [start_wedding,
                                                                                         #m_wedding{status
                                                                                                        =
                                                                                                        2}]}),
                                                                            role:apply(async,
                                                                                       Pid,
                                                                                       {wedding,
                                                                                        update_family,
                                                                                        [FamilyId]}),
                                                                            role:apply(async,
                                                                                       SelfPid,
                                                                                       {wedding,
                                                                                        update_family,
                                                                                        [FamilyId]}),
                                                                            NewRole =
                                                                                NRole2#role{s_event
                                                                                                =
                                                                                                12,
                                                                                            m_wedding
                                                                                                =
                                                                                                MWedding#m_wedding{status
                                                                                                                       =
                                                                                                                       2}},
                                                                            push_wedding(NewRole),
                                                                            map:role_update(NewRole),
                                                                            send_friend_mail(Role,
                                                                                             RoleId,
                                                                                             LoverId),
                                                                            log:wedding(NewRole,
                                                                                        #{id
                                                                                              =>
                                                                                              RoleId,
                                                                                          name
                                                                                              =>
                                                                                              Name,
                                                                                          other_id
                                                                                              =>
                                                                                              LoverId,
                                                                                          other_name
                                                                                              =>
                                                                                              LoverName,
                                                                                          handle
                                                                                              =>
                                                                                              "开始典礼",
                                                                                          type
                                                                                              =>
                                                                                              Type}),
                                                                            {ok,
                                                                             role_trigger:fire(#evt_wedding_marry{},
                                                                                               NewRole)};
                                                                        {false,
                                                                         Reason} ->
                                                                            role:apply(async,
                                                                                       Pid,
                                                                                       {wedding,
                                                                                        apply_start_fail,
                                                                                        []}),
                                                                            {false,
                                                                             Reason};
                                                                        _ ->
                                                                            role:apply(async,
                                                                                       Pid,
                                                                                       {wedding,
                                                                                        apply_start_fail,
                                                                                        []}),
                                                                            {false,
                                                                             lang:get("系统繁忙")}
                                                                    end;
                                                                _False ->
                                                                    logger:debug("进入准备区地图失败[Err:~w]",
                                                                                 [_False],
                                                                                 wedding,
                                                                                 554),
                                                                    {false,
                                                                     lang:get("降落失败")}
                                                            end;
                                                        _ ->
                                                            {false,
                                                             lang:get("请求对方信息失败")}
                                                    end;
                                                _ ->
                                                    role:apply(async,
                                                               Pid,
                                                               {wedding,
                                                                apply_start_fail,
                                                                []}),
                                                    {false,
                                                     lang:get("不能以此家园作为新房")}
                                            end
                                    end;
                                [#team_mate{id = LoverId}] ->
                                    {false, lang:get("让对方归队才能发起典礼")};
                                [_] -> {false, lang:get("你已经名花有主，还想跟谁结缘")};
                                _ -> {false, lang:get("需要与你的另一半组队才能举办典礼哦")}
                            end;
                        _ -> {false, lang:get("你的同伴没在线哦")}
                    end;
                {ok, _} -> {false, lang:get("不能重复举办典礼")};
                _ -> {false, lang:get("要先订婚才能举行典礼哦！")}
            end
    end.

apply_start(Role = #role{}) ->
    case role_misc:check_event(Role) of
        {false, Reason} -> {ok, {false, Reason}};
        _ ->
            case role_fly:force_landing(Role) of
                {ok, NRole} -> {ok, ok, NRole#role{s_event = 12}};
                _ -> {ok, {false, lang:get("降落失败")}}
            end
    end.

apply_start_fail(Role = #role{s_event = 12}) ->
    {ok, Role#role{s_event = 0}};
apply_start_fail(_Role) -> ok.

apply_enter(#role{s_event = 12,
                  pos = #pos{map = MapId}},
            MapId, _Type) ->
    ok;
apply_enter(Role = #role{s_event = 12, id = RoleId,
                         pid = Pid},
            MapId, _Type) ->
    {ok, #map_data{revive = [{X, Y}]}} =
        map_data:get(30002),
    Role1 = looks:calc(Role),
    {ok, NRole} = map:role_enter({MapId, X, Y}, Role1),
    sys_conn:pack_send(15008, {1}),
    wedding_mgr:cast({enter_succ, RoleId, Pid}),
    {ok, NRole};
apply_enter(_Role, _MapId, _Type) -> ok.

update_wedding(Role, agree_req,
               MWedding = #m_wedding{lover_id = _OtherId,
                                     lover_name = LoverName}) ->
    AgreeRole = Role#role{m_wedding = MWedding},
    Evt = #evt_wedding_req_agreed{},
    FireRole = role_trigger:fire(Evt, AgreeRole),
    NewRole = FireRole,
    push_wedding(NewRole),
    add_honor(NewRole),
    role:apply(async,
               self(),
               {friend_zone, update, [lover, LoverName]}),
    {ok, NewRole};
update_wedding(Role = #role{id = RoleId,
                            m_wedding =
                                MWedding = #m_wedding{lover_id = LoverId}},
               Label, #m_wedding{status = Status})
    when Label == start_wedding orelse
             Label == end_wedding ->
    NewRole = Role#role{m_wedding =
                            MWedding#m_wedding{status = Status}},
    push_wedding(NewRole),
    map:role_update(NewRole),
    NewRole2 = case Label of
                   start_wedding ->
                       send_friend_mail(Role, RoleId, LoverId),
                       role_trigger:fire(#evt_wedding_marry{}, NewRole);
                   _ -> NewRole
               end,
    {ok, NewRole2};
update_wedding(_Role, _, _) -> ok.

update_looks(Role) ->
    NRole = looks:calc(Role),
    map:role_update(NRole),
    {ok, NRole}.

get_look(#role{}) -> [];
get_look(_Role) -> [].

enter(#role{cross_type = 1}) ->
    {false, lang:get("跨服不能参加典礼")};
enter(#role{id = RoleId, name = Name, pid = RolePid,
            s_event = Event})
    when Event =:= 12 orelse Event =:= 13 ->
    wedding_mgr:cast({enter,
                      #guest{id = RoleId, name = Name, pid = RolePid}}),
    ok;
enter(#role{lev = Lev}) when Lev < 30 ->
    notice:return(lang:get("等级不足")),
    ok;
enter(#role{m_team = #m_team{pid = TeamPid}})
    when is_pid(TeamPid) ->
    notice:return(lang:get("不能组队进入")),
    ok;
enter(Role = #role{id = RoleId, pid = RolePid,
                   name = Name, classes = Classes, sex = Sex, lev = Lev,
                   face = Face}) ->
    case role_misc:check_event(Role) of
        {false, Reason} -> notice:return(Reason);
        _ ->
            wedding_mgr:cast({enter,
                              #guest{id = RoleId, name = Name, pid = RolePid,
                                     classes = Classes, sex = Sex, lev = Lev,
                                     face = Face}})
    end,
    ok.

apply_guest_enter(#role{m_team =
                            #m_team{pid = TeamPid}},
                  _MapId, _X, _Y, _Event, _)
    when is_pid(TeamPid) ->
    notice:return(lang:get("不能组队进入")),
    ok;
apply_guest_enter(Role = #role{id = RoleId, pid = Pid},
                  MapId, X, Y, Event,
                  {MaleId, MaleName, _FemaleId, FemaleName}) ->
    case role_misc:check_event(Role) of
        {false, Reason} ->
            notice:return(Reason),
            ok;
        _ ->
            case role_fly:force_landing(Role) of
                {ok, NRole} ->
                    {ok, NRole2} = map:role_enter({MapId, X, Y},
                                                  NRole#role{s_event = Event}),
                    notice:return(notice:format(lang:get("你来到~ts和~ts的典礼殿堂"),
                                                [{role_2, MaleName},
                                                 {role_2, FemaleName}])),
                    wedding_mgr:cast({enter_succ, RoleId, Pid}),
                    LastWedding = var:get_var(NRole2, other, 2133, 0),
                    case LastWedding =:= MaleId of
                        true -> {ok, NRole2};
                        _ ->
                            NRole3 = var:set_var(NRole2, other, 2133, MaleId),
                            {ok,
                             role_trigger:fire(#evt_wedding_guest{}, NRole3)}
                    end;
                _ -> ok
            end
    end.

leave(Role = #role{s_event = Event, id = RoleId})
    when Event =:= 14 orelse Event =:= 15 ->
    {ok, NRole} = map:role_enter(util:rand_list([{10001,
                                                  306,
                                                  3507},
                                                 {10001, 2583, 3848},
                                                 {10001, 4957, 3680},
                                                 {10001, 445, 2565},
                                                 {10001, 4646, 704},
                                                 {10001, 841, 1033},
                                                 {10001, 2098, 1834},
                                                 {10001, 3617, 1816}]),
                                 Role#role{s_event = 0}),
    wedding_mgr:cast({leave, RoleId}),
    {ok, NRole};
leave(#role{s_event = Event}) when Event =:= 13 ->
    notice:return(lang:get("正在典礼中，不能逃跑哦")),
    ok;
leave(#role{s_event = Event, id = RoleId})
    when Event =:= 12 ->
    wedding_mgr:cast({leave, RoleId}),
    ok;
leave(_Role) ->
    notice:return(lang:get("不是宾客，不能退出教堂")),
    ok.

apply_leave(Role = #role{s_event = 12,
                         m_wedding = MWedding}) ->
    {ok, NRole} = map:role_enter(util:rand_list([{10001,
                                                  306,
                                                  3507},
                                                 {10001, 2583, 3848},
                                                 {10001, 4957, 3680},
                                                 {10001, 445, 2565},
                                                 {10001, 4646, 704},
                                                 {10001, 841, 1033},
                                                 {10001, 2098, 1834},
                                                 {10001, 3617, 1816}]),
                                 Role#role{s_event = 0,
                                           m_wedding =
                                               MWedding#m_wedding{status = 3}}),
    Role1 = looks:calc(NRole),
    Role2 = attr:calc_and_push(Role1),
    push_wedding(Role2),
    {ok, NRole};
apply_leave(Role = #role{s_event = 13,
                         m_wedding = MWedding}) ->
    {ok, NRole} = map:role_enter(util:rand_list([{10001,
                                                  306,
                                                  3507},
                                                 {10001, 2583, 3848},
                                                 {10001, 4957, 3680},
                                                 {10001, 445, 2565},
                                                 {10001, 4646, 704},
                                                 {10001, 841, 1033},
                                                 {10001, 2098, 1834},
                                                 {10001, 3617, 1816}]),
                                 Role#role{s_event = 0,
                                           m_wedding =
                                               MWedding#m_wedding{status = 3}}),
    Role1 = looks:calc(NRole),
    Role2 = attr:calc_and_push(Role1),
    push_wedding(Role2),
    {ok, NRole};
apply_leave(Role = #role{s_event = 14}) ->
    {ok, NRole} = map:role_enter(util:rand_list([{10001,
                                                  306,
                                                  3507},
                                                 {10001, 2583, 3848},
                                                 {10001, 4957, 3680},
                                                 {10001, 445, 2565},
                                                 {10001, 4646, 704},
                                                 {10001, 841, 1033},
                                                 {10001, 2098, 1834},
                                                 {10001, 3617, 1816}]),
                                 Role#role{s_event = 0}),
    {ok, NRole};
apply_leave(Role = #role{s_event = 15}) ->
    {ok, NRole} = map:role_enter(util:rand_list([{10001,
                                                  306,
                                                  3507},
                                                 {10001, 2583, 3848},
                                                 {10001, 4957, 3680},
                                                 {10001, 445, 2565},
                                                 {10001, 4646, 704},
                                                 {10001, 841, 1033},
                                                 {10001, 2098, 1834},
                                                 {10001, 3617, 1816}]),
                                 Role#role{s_event = 0}),
    {ok, NRole};
apply_leave(_Role) -> ok.

apply_pos(Role = #role{id = RoleId, s_event = Event,
                       pos = Pos = #pos{map = MapId}},
          X, Y, Dir, NewEvent)
    when Event =:= 12 orelse Event =:= 14 ->
    case map:role_enter({MapId, X, Y},
                        Role#role{s_event = NewEvent})
        of
        {ok, Role1 = #role{pos = Pos1}} ->
            Role2 = attr:calc_and_push(Role1),
            NRole = Role2#role{pos = Pos1#pos{dir = Dir}},
            NewRole = looks:calc(NRole),
            map:role_update(NewRole),
            map:pack_send_to_all(MapId, 10168, {RoleId, Dir}),
            {ok, NewRole};
        _ ->
            Role2 = attr:calc_and_push(Role),
            NRole = map:role_transmit(4,
                                      1,
                                      X,
                                      Y,
                                      Role2#role{s_event = NewEvent,
                                                 pos = Pos#pos{dir = Dir}}),
            NewRole = looks:calc(NRole),
            map:role_update(NewRole),
            map:pack_send_to_all(MapId, 10168, {RoleId, Dir}),
            {ok, NewRole}
    end;
apply_pos(_Role, _X, _Y, _Dir, _Event) -> ok.

apply_set_event(Role = #role{name = _Name,
                             s_event = Event, s_looks = _OSLooks},
                NewEvent)
    when Event =:= 13 orelse Event =:= 15 ->
    NRole = looks:calc(Role#role{s_event = NewEvent}),
    Role2 = #role{s_looks = _SLooks} =
                attr:calc_and_push(NRole),
    map:role_update(Role2),
    logger:debug("仪式结束改变状态：~ts, oldlook:~w, newloos:~w",
                 [_Name, _OSLooks, _SLooks],
                 wedding,
                 769),
    {ok, Role2};
apply_set_event(_Role, _Event) -> ok.

apply_move(Role, X, Y, Dir) ->
    NewRole = map:role_move(X, Y, Dir, Role),
    {ok, NewRole}.

apply_say(Role, Msg) ->
    chat:send_chat_msg(map, Msg, Role),
    ok.

agree_apply(#role{id = RoleId, name = Name},
            RoleList) ->
    wedding_mgr:cast({agree_apply, RoleId, Name, RoleList}),
    ok.

apply_gain(Role = #role{lev = Lev, s_event = Event},
           _Type, {WeddingType, Atmosp}, _N)
    when Event =:= 12 orelse
             Event =:= 13 orelse Event =:= 14 orelse Event =:= 15 ->
    Exp = wedding_data:exp({WeddingType, Lev}),
    AddVal1 = Exp,
    AddVal = case wedding_data:atmosp_reward({WeddingType,
                                              Atmosp})
                 of
                 #wedding_atmosp_data{exp = ExpRatio}
                     when ExpRatio > 0 ->
                     round(AddVal1 * (1000 + ExpRatio) / 1000);
                 _ -> AddVal1
             end,
    case AddVal =< 0 of
        true -> ok;
        _ ->
            role_gain:do_notice([#gain{label = exp, val = AddVal}],
                                Role,
                                lang:get("典礼殿堂中"))
    end;
apply_gain(_, _, _, _) -> ok.

apply_love_score(Role, Num, Msg) ->
    case role_gain:do_notice(format:val_to_gain([{90018,
                                                  Num}]),
                             Role,
                             Msg)
        of
        {ok, NewRole} -> {ok, NewRole};
        _ -> ok
    end.

check_pick(_Role = #role{id = RoleId},
           PickArgs = #{base_id := BaseId}) ->
    case role_misc:check_cd({pick_wedding_box, BaseId}) of
        true ->
            case wedding_mgr:call({check_pick, RoleId, BaseId}) of
                {ok, #wedding_unit_data{rand = Rand}} ->
                    {ItemId, Bind, Num, _, IsCast} = util:rand_list(Rand,
                                                                    4),
                    ItemId1 = item_type:special_id(ItemId),
                    {true,
                     PickArgs#{gain => [{ItemId1, Bind, Num}],
                               is_cast => IsCast}};
                {false, Reason} -> {false, Reason};
                _ -> {false, lang:get("系统繁忙")}
            end;
        _ ->
            {false,
             notice:format(lang:get("你刚采集过~ts，这个还是留给别人吧！"),
                           [{unit_1, BaseId}])}
    end.

act(#role{id = RoleId, name = Name, s_event = Event,
          sex = Sex, pid = Pid, pos = Pos},
    Id, Msg)
    when Event == 12 orelse
             Event == 13 orelse Event == 14 orelse Event == 15 ->
    Target = case Event of
                 12 when Sex == 1 -> 1;
                 12 -> 2;
                 13 when Sex == 1 -> 1;
                 13 -> 2;
                 _ -> 3
             end,
    case Event of
        12 ->
            wedding_mgr:cast({act,
                              RoleId,
                              Name,
                              Pid,
                              Pos,
                              Id,
                              Target,
                              Msg}),
            ok;
        13 ->
            wedding_mgr:cast({act,
                              RoleId,
                              Name,
                              Pid,
                              Pos,
                              Id,
                              Target,
                              Msg}),
            ok;
        _ ->
            wedding_mgr:cast({guest_act,
                              RoleId,
                              Name,
                              Pid,
                              Pos,
                              Id,
                              Target,
                              Msg}),
            ok
    end;
act(_Role, _Id, _) -> {false, lang:get("不在典礼中，不能操作")}.

act_apply(Role = #role{id = RoleId, name = Name,
                       pos = Pos},
          Label, Now,
          Data = #wedding_act_data{id = ActId, cost = Cost},
          RoleMsg) ->
    Loss = format:val_to_loss(Cost),
    case role_gain:do_notice(Loss, Role, act_name(ActId)) of
        {ok, NRole} ->
            wedding_mgr:info({to_act,
                              Label,
                              RoleId,
                              self(),
                              Name,
                              Now,
                              Pos,
                              Data,
                              RoleMsg}),
            {ok, NRole};
        {false, #loss{msg = Msg}} ->
            notice:return(Msg),
            {ok, Role}
    end.

act_gain(Role, #wedding_act_data{gain = []}) ->
    {ok, Role};
act_gain(Role,
         #wedding_act_data{id = ActId, gain = List}) ->
    Gain = format:val_to_gain(List),
    NewGain = mark_source(Gain, []),
    case role_gain:do_notice(NewGain, Role, act_name(ActId))
        of
        {ok, NRole} -> {ok, NRole};
        _ -> {ok, Role}
    end.

mark_source([], Acc) -> Acc;
mark_source([H | Rest], Acc) ->
    NewH = H#gain{source = 9},
    mark_source(Rest, [NewH | Acc]).

act_main_gain(Role, _RoleName,
              #wedding_act_data{main_gain = []}) ->
    {ok, Role};
act_main_gain(Role, RoleName,
              #wedding_act_data{id = ActId, main_gain = List}) ->
    Gain = format:val_to_gain(List),
    case role_gain:do_notice(Gain,
                             Role,
                             util:flist(lang:get("~ts ~ts"),
                                        [RoleName, act_name(ActId)]))
        of
        {ok, NRole} -> {ok, NRole};
        _ -> {ok, Role}
    end.

barrage_apply(Role, Msg) ->
    chat:send_chat_msg(barrage, Msg, Role),
    notice:return(lang:get("你的祝福已经成功发出")),
    ok.

-spec set_name(#role{}) -> ok.

set_name(#role{id = RoleId, name = Name}) ->
    case lover(RoleId) of
        {ok, Lover1 = #lover{lover_id = LoverId}} ->
            {ok, Lover2} = lover(LoverId),
            NewLover1 = Lover1#lover{name = Name},
            NewLover2 = Lover2#lover{lover_name = Name},
            wedding_mgr:update_ets([NewLover1, NewLover2], all),
            case role_query:pid(by_id, LoverId) of
                {ok, Pid} ->
                    role:apply(async,
                               Pid,
                               {wedding, apply_set_name, [RoleId, Name]});
                _ -> ok
            end;
        _ -> ok
    end.

apply_set_name(Role = #role{m_wedding =
                                MWedding = #m_wedding{lover_id = RoleId}},
               RoleId, Name) ->
    NRole = Role#role{m_wedding =
                          MWedding#m_wedding{lover_name = Name}},
    {ok, NRole2} = update_looks(NRole),
    push_wedding(NRole2),
    role:apply(async,
               self(),
               {friend_zone, update, [lover, Name]}),
    push_lover(NRole2),
    {ok, NRole2};
apply_set_name(_Role, _RoleId, _Name) -> ok.

add_honor(_Role = #role{pid = Pid, sex = 1,
                        m_wedding = #m_wedding{status = 1}}) ->
    honor:add_and_use(Pid, 11222, push),
    ok;
add_honor(_Role = #role{pid = Pid, sex = 0,
                        m_wedding = #m_wedding{status = 1}}) ->
    honor:add_and_use(Pid, 11223, push),
    ok;
add_honor(_Role = #role{pid = Pid, sex = 1,
                        m_wedding = #m_wedding{status = Status}})
    when Status == 3 orelse Status == 2 ->
    honor:add_and_use(Pid, 11224, push),
    ok;
add_honor(_Role = #role{pid = Pid, sex = 0,
                        m_wedding = #m_wedding{status = Status}})
    when Status == 3 orelse Status == 2 ->
    honor:add_and_use(Pid, 11225, push),
    ok;
add_honor(_) -> ok.

init_honor2(Role = #role{m_wedding =
                             MWedding = #m_wedding{honor_ids =
                                                       Honors = [_ | _]}}) ->
    Flag = var:get_var(Role, other, 2137, 0),
    case Flag of
        0 ->
            List = [{11058, 11222},
                    {11059, 11223},
                    {11060, 11224},
                    {11061, 11225}],
            Fun = fun ({OId, NId}, Temp) ->
                          case lists:member(OId, Temp) of
                              true -> [NId | lists:delete(OId, Temp)];
                              false -> Temp
                          end;
                      (_, Temp) -> Temp
                  end,
            NHonors = lists:foldl(Fun, Honors, List),
            Fun2 = fun ({OId, NId}, Temp) ->
                           case honor:has_honor(Temp, OId) of
                               true ->
                                   case honor:add(Role, NId, not_push) of
                                       {ok, NewRole} -> NewRole;
                                       _ -> Temp
                                   end;
                               _ -> Temp
                           end;
                       (_, Temp) -> Temp
                   end,
            Role1 = lists:foldl(Fun2, Role, List),
            Role2 = Role1#role{m_wedding =
                                   MWedding#m_wedding{honor_ids = NHonors}},
            var:set_var(Role2, other, 2137, 1);
        _ -> Role
    end;
init_honor2(Role) -> var:set_var(Role, other, 2137, 1).

init_honor(Role = #role{m_wedding =
                            #m_wedding{honor_ids = [_ | _]}}) ->
    Role;
init_honor(Role = #role{sex = 1,
                        m_wedding = #m_wedding{status = 1}}) ->
    case honor:has_honor(Role, 11222) of
        true -> Role;
        _ ->
            case honor:add(Role, 11222, not_push) of
                {ok, NewRole} -> NewRole;
                _ -> Role
            end
    end;
init_honor(Role = #role{sex = 0,
                        m_wedding = #m_wedding{status = 1}}) ->
    case honor:has_honor(Role, 11223) of
        true -> Role;
        _ ->
            case honor:add(Role, 11223, not_push) of
                {ok, NewRole} -> NewRole;
                _ -> Role
            end
    end;
init_honor(Role = #role{sex = 1,
                        m_wedding = #m_wedding{status = Status}})
    when Status == 3 orelse Status == 2 ->
    case honor:has_honor(Role, 11224) of
        true -> Role;
        _ ->
            case honor:add(Role, 11224, not_push) of
                {ok, NewRole} -> NewRole;
                _ -> Role
            end
    end;
init_honor(Role = #role{sex = 0,
                        m_wedding = #m_wedding{status = Status}})
    when Status == 3 orelse Status == 2 ->
    case honor:has_honor(Role, 11225) of
        true -> Role;
        _ ->
            case honor:add(Role, 11225, not_push) of
                {ok, NewRole} -> NewRole;
                _ -> Role
            end
    end;
init_honor(Role) -> Role.

repaire_honor(Role = #role{sex = Sex,
                           m_wedding = #m_wedding{status = 3, honor_ids = []},
                           m_honor = #m_honor{r_list = List}}) ->
    Flag = var:get_var(Role, other, 2134, 0),
    case Flag of
        0 ->
            HId = case Sex of
                      1 -> 11224;
                      _ -> 11225
                  end,
            Role1 = case lists:keyfind(HId, #honor.id, List) of
                        false ->
                            case honor:add(Role, HId, not_push) of
                                {ok, NewRole} -> NewRole;
                                _ -> Role
                            end;
                        _ -> Role
                    end,
            var:set_var(Role1, other, 2134, 1);
        _ -> Role
    end;
repaire_honor(Role) ->
    var:set_var(Role, other, 2134, 1).

divorce(#role{cross_type = 1}, _Type) ->
    {false, lang:get("跨服状态不能解除结缘")};
divorce(#role{m_wedding = #m_wedding{status = 2}},
        _Type) ->
    {false, lang:get("典礼中不能解除结缘")};
divorce(#role{m_wedding = #m_wedding{status = 0}},
        _Type) ->
    {false, lang:get("你还没有结缘")};
divorce(Role = #role{id = RoleId,
                     m_wedding = #m_wedding{lover_id = LoverId}},
        Type) ->
    Now = date:unixtime(),
    case lover(RoleId) of
        {ok, #lover{time = Time}} when Now < Time + 86400 ->
            {false, lang:get("结缘不是儿戏，刚结缘怎么就想着解除结缘啦")};
        {ok, Lover = #lover{lover_id = LoverId}} ->
            do_divorce(Role, Lover, Type);
        {ok, _Lover} -> {false, lang:get("伴侣信息对不上")};
        _ -> {false, lang:get("没有找到结缘信息")}
    end.

do_divorce(Role = #role{id = RoleId, name = Name},
           Lover = #lover{status = Status, lover_id = LoverId,
                          lover_name = LoverName},
           Type = 3) ->
    LossList = case Status of
                   1 -> [{90000, 500000}];
                   _ -> [{90002, 500}]
               end,
    Loss = format:val_to_loss(LossList),
    case role_gain:do_notice(Loss, Role) of
        {false, #loss{msg = Msg}} -> {false, Msg};
        {ok, Role0} ->
            log:wedding(Role0,
                        #{id => RoleId, name => Name, other_id => LoverId,
                          other_name => LoverName, handle => "离婚",
                          type => Type}),
            succ_divorce(Role0, Lover, Type)
    end;
do_divorce(Role = #role{id = RoleId, name = Name},
           Lover = #lover{lover_id = LoverId, status = Status,
                          lover_name = LoverName},
           Type = 2) ->
    case friend:fetch(by_id, LoverId) of
        #friend_role{online_time = OnlineTime} ->
            Now = date:unixtime(),
            case Now - OnlineTime < 864000 of
                true -> {false, lang:get("你的对象离线时间还没超过10天呢，怎么就无奈啦")};
                false ->
                    LossList = case Status of
                                   1 -> [{90000, 500000}];
                                   _ -> [{90003, 10000}]
                               end,
                    Loss = format:val_to_loss(LossList),
                    case role_gain:do_notice(Loss, Role) of
                        {false, #loss{msg = Msg}} -> {false, Msg};
                        {ok, Role0} ->
                            log:wedding(Role0,
                                        #{id => RoleId, name => Name,
                                          other_id => LoverId,
                                          other_name => LoverName,
                                          handle => "离婚", type => Type}),
                            succ_divorce(Role0, Lover, Type)
                    end
            end;
        _ -> {false, lang:get("找不到对方数据")}
    end;
do_divorce(Role = #role{id = RoleId, name = Name},
           #lover{lover_id = LoverId, status = Status}, _Type) ->
    case role_query:pid(by_id, LoverId) of
        {ok, Pid} ->
            case team:get_members(Role) of
                [_, _ | _] -> {false, lang:get("队伍中存在第三者，被打扰了")};
                [#team_mate{id = LoverId, status = 2}] ->
                    Now = date:unixtime(),
                    put(divorce_req, Now),
                    role:pack_send(Pid,
                                   15021,
                                   {1,
                                    0,
                                    lang:get("等待对方同意"),
                                    RoleId,
                                    Name,
                                    Status}),
                    ok;
                [#team_mate{id = LoverId}] when Status == 1 ->
                    {false, lang:get("让对方归队才能取消结缘")};
                [#team_mate{id = LoverId}] ->
                    {false, lang:get("让对方归队才能取消结缘")};
                _ when Status == 1 ->
                    {false, lang:get("你的伴侣不在队伍中，不能取消结缘")};
                _ -> {false, lang:get("你的伴侣不在队伍中，不能取消结缘")}
            end;
        _ -> {false, lang:get("对方不在线")}
    end;
do_divorce(_Role, _, _Type) ->
    {false, lang:get("你还没有结缘哦！")}.

divorce_reply(#role{m_wedding = #m_wedding{status = 2}},
              _Type) ->
    {false, lang:get("典礼中不能解除结缘")};
divorce_reply(#role{m_wedding = #m_wedding{status = 0}},
              _Type) ->
    {false, lang:get("你还没有结缘")};
divorce_reply(#role{id = RoleId, pid = RolePid,
                    m_wedding = #m_wedding{lover_id = LoverId}},
              Type) ->
    case role_query:pid(by_id, LoverId) of
        {ok, Pid} ->
            case lover(RoleId) of
                {ok, #lover{lover_id = LoverId}} ->
                    role:apply(async,
                               Pid,
                               {wedding,
                                apply_divorce_reply,
                                [RoleId, RolePid, Type]}),
                    ok;
                {ok, #lover{lover_id = LoverId}} ->
                    {false, lang:get("伴侣信息对不上啊")};
                _ -> {false, lang:get("没有找到结缘信息啊")}
            end;
        _ -> {false, lang:get("对方已下线")}
    end;
divorce_reply(_Role, _) ->
    {false, lang:get("你还没有结缘哦！")}.

apply_divorce_reply(_Role = #role{}, _, RolePid,
                    _Type = 0) ->
    erase(divorce_req),
    notice:send({pid, RolePid}, 1, lang:get("拒绝成功"), []),
    notice:return(lang:get("对方拒绝, 有什么事情都可以先坐下来喝杯茶慢慢聊！")),
    ok;
apply_divorce_reply(Role = #role{id = RoleId,
                                 name = Name,
                                 m_wedding =
                                     #m_wedding{status = Status,
                                                lover_id = LoverId,
                                                lover_name = LoverName}},
                    _, RolePid, Type) ->
    Now = date:unixtime(),
    case erase(divorce_req) of
        T
            when is_integer(T) andalso Now - T > 600 orelse
                     T =:= undefined ->
            notice:send({pid, RolePid}, 1, lang:get("操作超时"), []),
            notice:return(lang:get("对方操作超时")),
            ok;
        T when is_integer(T) ->
            case lover(RoleId) of
                {ok, Lover} ->
                    LossList = case Status of
                                   1 -> [{90000, 500000}];
                                   _ -> [{90000, 1000000}]
                               end,
                    Loss = format:val_to_loss(LossList),
                    case role_gain:do_notice(Loss, Role) of
                        {false, #loss{msg = Msg}} ->
                            notice:return(Msg),
                            ok;
                        {ok, Role1} ->
                            log:wedding(Role1,
                                        #{id => RoleId, name => Name,
                                          other_id => LoverId,
                                          other_name => LoverName,
                                          handle => "离婚", type => Type}),
                            succ_divorce(Role1, Lover, 1)
                    end;
                _ ->
                    notice:return(lang:get("没有找到结缘信息")),
                    ok
            end;
        _ ->
            notice:send({pid, RolePid},
                        1,
                        lang:get("对方没有发起过解除结缘"),
                        []),
            notice:return(lang:get("没有发起过解除结缘")),
            ok
    end;
apply_divorce_reply(_Role, _RolePid, _Lover, _Reply) ->
    notice:return(lang:get("你还没有结缘哦！")),
    ok.

divorce_apply(Role = #role{m_wedding =
                               MWedding = #m_wedding{status = Status}},
              Type) ->
    case Status of
        1 when Type == 3 ->
            notice:return(lang:get("被强制解除关系，期待您下一段美好的结缘！"));
        1 when Type == 2 ->
            notice:return(lang:get("被无奈解除关系，期待您下一段美好的结缘！"));
        1 -> notice:return(lang:get("你与对方和平解除关系，期待您下一段美好的情缘！"));
        _ when Type == 3 ->
            notice:return(lang:get("被强制解除关系，期待您下一段美好的情缘！"));
        _ when Type == 2 ->
            notice:return(lang:get("被无奈解除关系，期待您下一段美好的情缘！"));
        _ -> notice:return(lang:get("你与对方和平解除关系，期待您下一段美好情缘！"))
    end,
    Role1 = Role#role{m_wedding =
                          MWedding#m_wedding{lover_id = {0, "", 0}, status = 0,
                                             lover_name = ""}},
    {ok, NRole1} = honor:del(Role1,
                             [11058,
                              11059,
                              11060,
                              11061,
                              11222,
                              11223,
                              11224,
                              11225],
                             push),
    Role2 = attr:calc_and_push(NRole1),
    NRole = looks:calc(Role2),
    map:role_update(NRole),
    NewRole = var:set_var(NRole, other, 2007, 0),
    NewRole2 = var:set_var(NewRole, week, 208, 0),
    NewRole3 = var:set_var(NewRole2, acc, 1009, 0),
    NewRole4 = quest_marriage:divorce(NewRole3),
    NewRole5 = couple_skill:divorce(NewRole4),
    NewRole6 = quest_child:divorce(NewRole5),
    NewRole7 = quest_pregnancy:divorce(NewRole6),
    push_wedding(NewRole7),
    role:apply(async,
               self(),
               {friend_zone, update, [lover, ""]}),
    {ok,
     role_trigger:fire(#evt_wedding_divorce{}, NewRole7)}.

succ_divorce(Role = #role{id = RoleId, name = Name,
                          m_wedding = MWedding},
             Lover = #lover{lover_id = LoverId, lover_name = LName,
                            status = Status},
             Type) ->
    case Status of
        1 -> notice:return(lang:get("取消结缘成功，期待您下一段美好的结缘！"));
        _ -> notice:return(lang:get("取消结缘成功，期待您下一段美好的结缘！"))
    end,
    divorce_mail(RoleId,
                 Name,
                 Status,
                 Type,
                 LoverId,
                 LName),
    wedding_mgr:del_ets(Lover),
    Role1 = Role#role{m_wedding =
                          MWedding#m_wedding{lover_id = {0, "", 0}, status = 0,
                                             lover_name = "", reward = [],
                                             mail = [], honor_ids = []}},
    {ok, NRole1} = honor:del(Role1,
                             [11058,
                              11059,
                              11060,
                              11061,
                              11222,
                              11223,
                              11224,
                              11225],
                             push),
    Role2 = attr:calc_and_push(NRole1),
    NRole = looks:calc(Role2),
    map:role_update(NRole),
    NewRole = var:set_var(NRole, other, 2007, 0),
    NewRole2 = var:set_var(NewRole, week, 208, 0),
    NewRole3 = var:set_var(NewRole2, acc, 1009, 0),
    NewRole4 = quest_marriage:divorce(NewRole3),
    NewRole5 = couple_skill:divorce(NewRole4),
    NewRole6 = var:set_var(NewRole5, other, 2037, []),
    NewRole7 = child:divorce(NewRole6, LoverId),
    NewRole8 = quest_child:divorce(NewRole7),
    NewRole9 = quest_pregnancy:divorce(NewRole8),
    wedding_mgr:cast({divorce, Lover}),
    push_wedding(NewRole9),
    role:apply(async,
               LoverId,
               {wedding, divorce_apply, [Type]}),
    role:apply(async,
               self(),
               {friend_zone, update, [lover, ""]}),
    role:apply(async,
               self(),
               {wedding, family_divorce, [LoverId, LName]}),
    {ok,
     role_trigger:fire(#evt_wedding_divorce{}, NewRole9)}.

send_friend_mail(Role = #role{name = Name}, MaleId,
                 FemaleId) ->
    List = friend:list(Role),
    FrdRoleList = [FrdRole || {_FrdShip, FrdRole} <- List],
    [mail:send(RoleId,
               lang:get("好友举办典礼"),
               notice:format(lang:get("你的好友~ts将在丘比特处举办典礼，快去给TA送去一份祝福吧{face_1,3}"),
                             [{role_2, Name}]),
               [])
     || #friend_role{id = RoleId} <- FrdRoleList,
        RoleId =/= MaleId, RoleId =/= FemaleId].

type_loss(1, _) ->
    case calc_discount_price(1) of
        {true, Loss} -> {Loss, lang:get("举办挚爱典礼")};
        false ->
            Val = case camp_web_mgr:list_type(now, 30008) of
                      [{_,
                        #camp_web_menu{camp_list =
                                           [#camp_web{val1 = Val1} | _]}}
                       | _] ->
                          Val1;
                      _ -> 1800000
                  end,
            {[#loss{label = coin, val = Val}], lang:get("举办挚爱典礼")}
    end;
type_loss(2, _) ->
    case calc_discount_price(2) of
        {true, Loss} -> {Loss, lang:get("举办豪华典礼")};
        false ->
            Val = case camp_web_mgr:list_type(now, 30008) of
                      [{_,
                        #camp_web_menu{camp_list =
                                           [#camp_web{val2 = Val1} | _]}}
                       | _] ->
                          Val1;
                      _ -> 1314
                  end,
            {[#loss{label = gold, val = Val}], lang:get("举办豪华典礼")}
    end.

calc_discount_price(WeddingType) ->
    Now = date:unixtime(),
    DisCountList =
        wedding_data:get_wedding_discount_price(WeddingType),
    DisCountPrice = [#loss{label = GainLabel, val = Price}
                     || #{start_time := ST, end_time := ET,
                          label := GainLabel, discount_price := Price}
                            <- DisCountList,
                        Now =< date:parse_time(ET), Now >= date:parse_time(ST)],
    case DisCountPrice of
        [Loss | _] -> {true, [Loss]};
        _ -> false
    end.

init_wedding(1,
             #role{sex = Sex = 1, id = RoleId, pid = Pid,
                   name = Name, classes = Classes, lev = Lev, face = Face},
             Lover,
             OtherLover = #lover{id = OtherId, name = OtherName},
             OtherPid, LoverClasses, LoverSex, LoverLev,
             LoverFace) ->
    #{male_id => RoleId, male_pid => Pid, male_name => Name,
      male_classes => Classes, male_sex => Sex,
      male_lev => Lev, male_face => Face, male_lover => Lover,
      female_id => OtherId, female_pid => OtherPid,
      female_name => OtherName,
      female_classes => LoverClasses, female_sex => LoverSex,
      female_lev => LoverLev, female_face => LoverFace,
      female_lover => OtherLover, atmosp => 0,
      guest_max => 50};
init_wedding(1,
             #role{sex = Sex = 0, id = RoleId, pid = Pid,
                   name = Name, classes = Classes, lev = Lev, face = Face},
             Lover,
             OtherLover = #lover{id = OtherId, name = OtherName},
             OtherPid, LoverClasses, LoverSex, LoverLev,
             LoverFace) ->
    #{female_id => RoleId, female_pid => Pid,
      female_name => Name, female_classes => Classes,
      female_sex => Sex, female_lev => Lev,
      female_face => Face, female_lover => Lover,
      male_id => OtherId, male_pid => OtherPid,
      male_name => OtherName, male_classes => LoverClasses,
      male_sex => LoverSex, male_lev => LoverLev,
      male_face => LoverFace, male_lover => OtherLover,
      atmosp => 0, guest_max => 50};
init_wedding(2,
             #role{sex = Sex = 1, id = RoleId, pid = Pid,
                   name = Name, classes = Classes, lev = Lev, face = Face},
             Lover,
             OtherLover = #lover{id = OtherId, name = OtherName},
             OtherPid, LoverClasses, LoverSex, LoverLev,
             LoverFace) ->
    #{male_id => RoleId, male_pid => Pid, male_name => Name,
      male_classes => Classes, male_sex => Sex,
      male_lev => Lev, male_face => Face, male_lover => Lover,
      female_id => OtherId, female_pid => OtherPid,
      female_name => OtherName,
      female_classes => LoverClasses, female_sex => LoverSex,
      female_lev => LoverLev, female_face => LoverFace,
      female_lover => OtherLover, atmosp => 300,
      guest_max => 70};
init_wedding(2,
             #role{sex = Sex = 0, id = RoleId, pid = Pid,
                   name = Name, classes = Classes, lev = Lev, face = Face},
             Lover,
             OtherLover = #lover{id = OtherId, name = OtherName},
             OtherPid, LoverClasses, LoverSex, LoverLev,
             LoverFace) ->
    #{female_id => RoleId, female_pid => Pid,
      female_classes => Classes, female_sex => Sex,
      female_lev => Lev, female_face => Face,
      female_name => Name, female_lover => Lover,
      male_id => OtherId, male_pid => OtherPid,
      male_name => OtherName, male_classes => LoverClasses,
      male_sex => LoverSex, male_lev => LoverLev,
      male_face => LoverFace, male_lover => OtherLover,
      atmosp => 300, guest_max => 70}.

divorce_mail(RoleId, Name, 1, 3, LoverId, LName) ->
    mail:send(RoleId,
              lang:get("取消结缘通知"),
              notice:format(lang:get("请求结缘后你发现 ~ts 不是你心仪的伴侣，强制取消结缘，恢复单身。"),
                            [{role_2, LName}])),
    mail:send(LoverId,
              lang:get("取消结缘通知"),
              notice:format(lang:get("~ts已经强制和你取消结缘，不要灰心继续寻找真正属于你的另一半吧。"),
                            [{role_2, Name}]));
divorce_mail(RoleId, Name, _, 3, LoverId, LName) ->
    mail:send(RoleId,
              lang:get("解除结缘通知"),
              notice:format(lang:get("结缘后你发现 ~ts 不是你心仪的伴侣，强制发起了解除关系，恢复单身。"),
                            [{role_2, LName}])),
    mail:send(LoverId,
              lang:get("解除结缘通知"),
              notice:format(lang:get("~ts已经强制和你发起解除关系，不要灰心继续寻找真正属于你的另一半吧。"),
                            [{role_2, Name}]));
divorce_mail(RoleId, Name, 1, 2, LoverId, LName) ->
    mail:send(RoleId,
              lang:get("取消结缘通知"),
              notice:format(lang:get("由于你的伴侣~ts长期不在线，你无奈的取消结缘，恢复单身。"),
                            [{role_2, LName}])),
    mail:send(LoverId,
              lang:get("取消结缘通知"),
              notice:format(lang:get("由于你长期不在线，~ts已经和你取消结缘。"),
                            [{role_2, Name}]));
divorce_mail(RoleId, Name, _, 2, LoverId, LName) ->
    mail:send(RoleId,
              lang:get("解除结缘通知"),
              notice:format(lang:get("由于你的对象~ts长期不在线，你无奈的发起了解除关系，恢复单身。"),
                            [{role_2, LName}])),
    mail:send(LoverId,
              lang:get("解除结缘通知"),
              notice:format(lang:get("由于你长期不在线，~ts已经和你解除关系。"),
                            [{role_2, Name}]));
divorce_mail(RoleId, Name, 1, _, LoverId, LName) ->
    mail:send(RoleId,
              lang:get("取消结缘通知"),
              notice:format(lang:get("你与~ts已经和平取消结缘，恢复单身。"),
                            [{role_2, LName}])),
    mail:send(LoverId,
              lang:get("取消结缘通知"),
              notice:format(lang:get("你与~ts已经和平解除关系，恢复单身。"),
                            [{role_2, Name}]));
divorce_mail(RoleId, Name, _, _, LoverId, LName) ->
    mail:send(RoleId,
              lang:get("解除结缘通知"),
              notice:format(lang:get("你与~ts已经和平解除关系，恢复单身。"),
                            [{role_2, LName}])),
    mail:send(LoverId,
              lang:get("解除结缘通知"),
              notice:format(lang:get("你与~ts已经和平解除关系，恢复单身。"),
                            [{role_2, Name}])).

act_name(1) -> lang:get("发真爱果实");
act_name(2) -> lang:get("放礼炮");
act_name(3) -> lang:get("发红包");
act_name(4) -> lang:get("敬酒");
act_name(5) -> lang:get("撒花");
act_name(6) -> lang:get("发弹幕");
act_name(_) -> "".

is_couple(#role{m_wedding =
                    #m_wedding{lover_id = Target}},
          Target) ->
    true;
is_couple(_, _) -> false.

query_family_info(Role = #role{m_family =
                                   #m_family{cur_id = SelfFamilyId},
                               m_team = #m_team{pid = Pid, status = 1}})
    when is_pid(Pid) ->
    case team:get_members(Role) of
        [_, _ | _] -> false;
        [#team_mate{id = LoverId, status = 2}] ->
            FamilyIdList = case role_query:attr(by_id,
                                                LoverId,
                                                [#role.m_family])
                               of
                               {ok, [#m_family{cur_id = LoverFamilyId}]} ->
                                   [SelfFamilyId, LoverFamilyId];
                               _ -> [SelfFamilyId]
                           end,
            query_family_info(FamilyIdList, []);
        _ -> false
    end;
query_family_info(_) -> false.

query_family_info([], FamilyInfo) -> FamilyInfo;
query_family_info([FamilyId | Rest], FamilyInfo) ->
    case family_mgr:info(by_id, FamilyId) of
        #family_info{master_name = MasterName,
                     house_info = #house_info{lev = LoverHouseLev}} ->
            query_family_info(Rest,
                              [{FamilyId, MasterName, LoverHouseLev}
                               | FamilyInfo]);
        _ -> query_family_info(Rest, FamilyInfo)
    end.

update_family(Role = #role{id = RoleId,
                           m_family = #m_family{cur_id = FamilyId}},
              FamilyId) ->
    case family_mgr:info(by_id, FamilyId) of
        #family_info{house_info =
                         #house_info{lev = HouseLev}} ->
            FamilyName = case family_data:get_family(HouseLev) of
                             #{name2 := Name2} -> Name2;
                             _ -> lang:get("小屋")
                         end,
            LoverName = case lover(RoleId) of
                            {ok, #lover{lover_name = TmpLoverName}} ->
                                TmpLoverName;
                            _ -> lang:get("")
                        end,
            Title = lang:get("结缘迁居通知"),
            Content =
                notice:format(lang:get("您与~ts结缘并选择了您的家园作为伴侣二人的家园，今后此家园将作为你们伴侣二人共同的家园，"
                                       "小暖已把~ts家园中所有家具放置到你们共同家园的家具仓库中，一起努力营造属于你们二人的温馨"
                                       "家园吧。"),
                              [{role_2, LoverName}, {string_2, 5, FamilyName}]),
            mail:send(Role, Title, Content);
        _ -> skip
    end,
    ok;
update_family(Role = #role{id = RoleId, name = RoleName,
                           m_family = #m_family{cur_id = CurId}},
              FamilyId)
    when CurId =/= {0, "", 0} ->
    logger:debug("结缘搬离自己的住房:~w，选择了新房:~w",
                 [CurId, FamilyId],
                 wedding,
                 1426),
    case case catch gen_server:call(family_mgr,
                                    {move_out_family, CurId, RoleId},
                                    10000)
             of
             {'EXIT', {timeout, _}} -> {error, timeout};
             {'EXIT', {noproc, _}} -> {error, noproc};
             {'EXIT', {normal, _}} -> {error, exit};
             {'EXIT', _Call_Err} -> {error, _Call_Err};
             _Call_Return -> _Call_Return
         end
        of
        true ->
            log:family(Role, lang:get("迁出"), CurId),
            case catch gen_server:call(family_mgr,
                                       {move_to_family,
                                        FamilyId,
                                        RoleId,
                                        RoleName})
                of
                true ->
                    log:family(Role, lang:get("迁入"), FamilyId),
                    case family_mgr:info(by_id, FamilyId) of
                        #family_info{master_name = LoverName,
                                     house_info =
                                         #house_info{lev = HouseLev}} ->
                            FamilyName = case family_data:get_family(HouseLev)
                                             of
                                             #{name2 := Name2} -> Name2;
                                             _ -> lang:get("小屋")
                                         end,
                            Title = lang:get("结缘迁居通知"),
                            Content =
                                notice:format(lang:get("您与~ts结缘并选择~ts的~ts作为伴侣二人的家园，今后此家园将作为你们伴侣二人共同的家"
                                                       "园，小暖已帮助您将家园中所有家具放置到你们共同家园的家具仓库中，一起努力营造属于你们二人的"
                                                       "温馨家园吧。"),
                                              [{role_2, LoverName},
                                               {role_2, LoverName},
                                               {string_2, 5, FamilyName}]),
                            mail:send(Role, Title, Content);
                        _ -> skip
                    end,
                    StoreRole = #role{m_family = StoreFamily} =
                                    family_shop:open_store(Role),
                    NewRole = StoreRole#role{m_family =
                                                 StoreFamily#m_family{cur_id =
                                                                          FamilyId,
                                                                      idle_family
                                                                          =
                                                                          CurId}},
                    family_logic:push_11206(NewRole),
                    {ok, NewRole};
                _MoveToErr ->
                    logger:error("结缘时迁入家园失败:~w",
                                 [_MoveToErr],
                                 wedding,
                                 1454),
                    ok
            end;
        false ->
            logger:error("搬离住宅[~w]出错", [CurId], wedding, 1458),
            ok;
        _MoveOutErr ->
            logger:error("搬离住宅[~w]出错:~w",
                         [CurId, _MoveOutErr],
                         wedding,
                         1461),
            ok
    end;
update_family(Role = #role{id = RoleId, name = RoleName,
                           m_family = #m_family{}},
              FamilyId)
    when FamilyId =/= {0, "", 0} ->
    logger:debug("通知入住房间:~w",
                 [update_family],
                 wedding,
                 1465),
    case catch gen_server:call(family_mgr,
                               {move_to_family, FamilyId, RoleId, RoleName})
        of
        true ->
            log:family(Role, lang:get("迁入"), FamilyId),
            case family_mgr:info(by_id, FamilyId) of
                #family_info{master_name = LoverName,
                             house_info = #house_info{lev = HouseLev}} ->
                    FamilyName = case family_data:get_family(HouseLev) of
                                     #{name2 := Name2} -> Name2;
                                     _ -> lang:get("小屋")
                                 end,
                    Title = lang:get("结缘迁居通知"),
                    Content =
                        notice:format(lang:get("您与~ts结缘并选择~ts的~ts为伴侣二人的家园，今后此家园将作为你们伴侣二人共同的家园"
                                               "，一起努力营造属于你们二人的温馨家园吧。"),
                                      [{role_2, LoverName},
                                       {role_2, LoverName},
                                       {string_2, 5, FamilyName}]),
                    mail:send(Role, Title, Content);
                _ -> skip
            end,
            StoreRole = #role{m_family = StoreFamily} =
                            family_shop:open_store(Role),
            NewRole = StoreRole#role{m_family =
                                         StoreFamily#m_family{cur_id =
                                                                  FamilyId}},
            family_logic:push_11206(NewRole),
            {ok, NewRole};
        _MoveToErr ->
            logger:error("结缘时迁入家园失败:~w",
                         [_MoveToErr],
                         wedding,
                         1487),
            ok
    end;
update_family(_, _FamilyId) -> ok.

family_divorce(Role = #role{id = RoleId,
                            name = RoleName,
                            m_family =
                                MFimaly = #m_family{cur_id = CurId,
                                                    idle_family =
                                                        IdleFamilyId}},
               LeverId, LoverName) ->
    case family_mgr:family_divorce(RoleId, CurId) of
        true ->
            case family_mgr:info(by_id, CurId) of
                #family_info{master_id = MasterId}
                    when MasterId =/= RoleId ->
                    log:family(Role, lang:get("迁出"), CurId),
                    case IdleFamilyId =/= {0, "", 0} of
                        true ->
                            case catch gen_server:call(family_mgr,
                                                       {move_to_family,
                                                        IdleFamilyId,
                                                        RoleId,
                                                        RoleName})
                                of
                                true ->
                                    log:family(Role,
                                               lang:get("迁入"),
                                               IdleFamilyId),
                                    Title = lang:get("解除结缘迁居通知"),
                                    Content =
                                        notice:format(lang:get("很遗憾，您与~ts选择结束关系，您将搬离你们的共同家园，今后您将居住在自己的家园中，属于您"
                                                               "的家具小暖已经搬至您的家园的家具仓库中。"),
                                                      [{role_2, LoverName}]),
                                    mail:send(Role, Title, Content),
                                    NewRole = Role#role{m_family =
                                                            MFimaly#m_family{cur_id
                                                                                 =
                                                                                 IdleFamilyId,
                                                                             idle_family
                                                                                 =
                                                                                 {0,
                                                                                  "",
                                                                                  0}}},
                                    family_logic:push_11206(NewRole),
                                    {ok, NewRole};
                                _MoveToErr ->
                                    logger:error("玩家[~w]迁入家园失败:~w",
                                                 [RoleId, _MoveToErr],
                                                 wedding,
                                                 1514),
                                    {ok, Role}
                            end;
                        false ->
                            Title = lang:get("解除结缘迁居通知"),
                            Content =
                                notice:format(lang:get("很遗憾，您与~ts选择结束关系，您将搬离你们的共同家园，当您购买属于自己的家园后，您的家具"
                                                       "小暖将帮助您搬回到您的家具仓库中。"),
                                              [{role_2, LoverName}]),
                            mail:send(Role, Title, Content),
                            NewRole = Role#role{m_family =
                                                    MFimaly#m_family{cur_id =
                                                                         {0,
                                                                          "",
                                                                          0}}},
                            family_logic:push_11206(NewRole),
                            {ok, NewRole}
                    end;
                _ ->
                    Title = lang:get("解除结缘迁居通知"),
                    Content =
                        notice:format(lang:get("很遗憾，您与~ts选择结束关系，~ts将搬离你们的共同家园，同时属于ta的家具将从家园中搬离。"),
                                      [{role_2, LoverName},
                                       {role_2, LoverName}]),
                    mail:send(Role, Title, Content),
                    role:apply(async,
                               LeverId,
                               {wedding, apply_family_divorce, [RoleName]}),
                    ok
            end;
        no_need -> ok;
        _Err ->
            logger:error("离婚时[~w]整理房间[~w]出错：~w",
                         [RoleId, CurId, _Err],
                         wedding,
                         1536),
            {ok, Role}
    end.

apply_family_divorce(Role = #role{id = RoleId,
                                  name = RoleName,
                                  m_family =
                                      MFimaly = #m_family{cur_id = CurId,
                                                          idle_family =
                                                              IdleFamilyId}},
                     LoverName) ->
    case family_mgr:info(by_id, CurId) of
        #family_info{master_id = MasterId}
            when MasterId =/= RoleId ->
            log:family(Role, lang:get("迁出"), CurId),
            case IdleFamilyId =/= {0, "", 0} of
                true ->
                    case catch gen_server:call(family_mgr,
                                               {move_to_family,
                                                IdleFamilyId,
                                                RoleId,
                                                RoleName})
                        of
                        true ->
                            log:family(Role, lang:get("迁入"), IdleFamilyId),
                            Title = lang:get("解除结缘迁居通知"),
                            Content =
                                notice:format(lang:get("很遗憾，您与~ts结束关系，您将搬离你们的共同家园，今后您将居住在自己的家园中，属于您的家"
                                                       "具小暖已经搬至您的家园的家具仓库中。"),
                                              [{role_2, LoverName}]),
                            mail:send(Role, Title, Content),
                            NewRole = Role#role{m_family =
                                                    MFimaly#m_family{cur_id =
                                                                         IdleFamilyId,
                                                                     idle_family
                                                                         =
                                                                         {0,
                                                                          "",
                                                                          0}}},
                            family_logic:push_11206(NewRole),
                            {ok, NewRole};
                        _MoveToErr ->
                            logger:error("玩家[~w]迁入家园失败:~w",
                                         [RoleId, _MoveToErr],
                                         wedding,
                                         1559),
                            {ok, Role}
                    end;
                false ->
                    family_mgr ! {family_divorce_none, RoleId},
                    Title = lang:get("解除结缘迁居通知"),
                    Content =
                        notice:format(lang:get("很遗憾，您与~ts结束关系，您将搬离你们的共同家园，今后您将居住在自己的家园中，属于您的家"
                                               "具小暖已经搬至您的家园的家具仓库中。"),
                                      [{role_2, LoverName}]),
                    mail:send(Role, Title, Content),
                    {ok,
                     Role#role{m_family =
                                   MFimaly#m_family{cur_id = {0, "", 0}}}}
            end;
        _ -> ok
    end.

make_family_id(Role, CliFamilyId) ->
    case query_family_info(Role) of
        false -> false;
        FamilyInfo ->
            logger:debug("婚礼的家园信息：~w", [FamilyInfo], wedding, 1578),
            case length(FamilyInfo) of
                2 ->
                    case lists:keymember(CliFamilyId, 1, FamilyInfo) of
                        true -> CliFamilyId;
                        _ -> false
                    end;
                1 ->
                    case FamilyInfo of
                        [{FamilyId, _, _}] -> FamilyId;
                        _ -> false
                    end;
                _ -> {0, "", 0}
            end
    end.

