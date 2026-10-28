-file("src/proto/proto_125.erl", 1).

-module(proto_125).

-export([pack/3, unpack/3]).

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

-file("src/proto/proto_125.erl", 14).

-file("inc/protocol.hrl", 1).

-record(module,
        {code :: undefined | pos_integer(),
         type :: undefined | game_server | monitor | tester,
         need_auth = true :: boolean(),
         caller = connector :: connector | object,
         module :: undefined | atom(),
         desc = "" :: string()}).

-record(rpc,
        {code = 0 :: non_neg_integer(),
         disable = false :: boolean(),
         autolog = false :: boolean(),
         autozip = false :: boolean(),
         condition = [] :: [tuple()],
         log_title :: undefined | string(),
         req_desc ::
             undefined |
             string() |
             {string(), [atom()]} |
             {atom(), atom(), tuple()},
         req = [] :: {atom(), [tuple()]} | [tuple()],
         reply_desc ::
             undefined |
             string() |
             {string(), [atom()]} |
             {atom(), atom(), tuple()},
         reply = [] :: {atom(), [tuple()]} | [tuple()],
         parser :: undefined | atom(),
         mod :: undefined | atom(),
         can_cache = true :: boolean()}).

-file("src/proto/proto_125.erl", 15).

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

-file("src/proto/proto_125.erl", 16).

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

-file("src/proto/proto_125.erl", 17).

-file("inc/guard.hrl", 1).

-record(m_guard,
        {ver = 1 :: pos_integer(),
         free_war_ids = [] :: [pos_integer()],
         tactics_fields = [] :: list(),
         tactics_attr = [] :: list(),
         guards = [] :: list()}).

-record(guard_eqm,
        {ver = 5,
         base_id :: undefined | non_neg_integer(),
         type :: undefined | non_neg_integer(),
         lev,
         eqm_attrs = [] :: list(),
         reset_base_id = 0,
         reset_attrs = [] :: list(),
         gem = [] :: list(),
         is_init = 1,
         timeout = 0,
         back_effect_timeout = 0,
         back_effect_attr = []}).

-record(guard_astroid,
        {ver = 2 :: non_neg_integer(),
         aroused = [] :: non_neg_integer(),
         skills = [] :: list(),
         attrs = [] :: list(),
         growth = 0 :: non_neg_integer(),
         active = 0 :: non_neg_integer()}).

-record(guard_astroid_star,
        {ver = 0,
         id = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         exp = 0 :: non_neg_integer(),
         attrs = [] :: list()}).

-record(guard,
        {ver = 2,
         base_id = 0 :: non_neg_integer(),
         war_id = 0 :: non_neg_integer(),
         name = "" :: string(),
         alias = "" :: string(),
         classes = 0 :: non_neg_integer(),
         quality = 0 :: non_neg_integer(),
         status = 0 :: non_neg_integer(),
         tac_pos = 0 :: non_neg_integer(),
         skills = [] :: list(),
         eqm = [] :: list(),
         attr :: undefined | tuple(),
         score = 0 :: non_neg_integer(),
         astroid = #guard_astroid{} :: #guard_astroid{}}).

-record(guard_data,
        {base_id = 0 :: non_neg_integer(),
         name = "" :: binary(),
         alias = "" :: binary(),
         classes = 0 :: non_neg_integer(),
         quality = 0 :: non_neg_integer(),
         loss = [] :: tuple(),
         recruit_lev = 1 :: non_neg_integer(),
         desc = "" :: list(),
         normal_atk_id = 0 :: integer(),
         ai_id = 0 :: integer(),
         base_score = 0,
         growth = 0 :: non_neg_integer()}).

-record(guard_eqm_data,
        {base_id = 0 :: non_neg_integer(),
         lev = 1 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         type = 0 :: non_neg_integer(),
         quality = 0 :: non_neg_integer(),
         loss_coin = 0 :: [tuple()],
         reset_coin = 0 :: [tuple()],
         gem_list = [] :: list()}).

-record(guard_lev_data,
        {base_id :: undefined | non_neg_integer(),
         lev :: undefined | non_neg_integer(),
         lev_up_exp :: undefined | non_neg_integer(),
         attrs = [] :: non_neg_integer()}).

-record(guard_eqm_gem,
        {id = 0, base_id = 0, type = 0, lev = 0}).

-record(guard_eqm_gem_data,
        {base_id = 0,
         next_base_id = 0,
         name = "",
         lev = 0,
         type = 0,
         need_lev = 0,
         loss_coin = [],
         attrs = []}).

-file("src/proto/proto_125.erl", 18).

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

-file("src/proto/proto_125.erl", 19).

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

-file("src/proto/proto_125.erl", 20).

-file("inc/mount.hrl", 1).

-record(mount_goal,
        {ver = 1 :: non_neg_integer(),
         finish = [] :: list(),
         doing = [] :: list(),
         day_reward = [] :: list()}).

-record(m_mount,
        {ver = 10 :: pos_integer(),
         mounts = [] :: list(),
         mount_goal = #mount_goal{},
         next_mount_id = 1 :: non_neg_integer(),
         ride_mount = 0,
         appearance_list = [],
         combat_active_times = [],
         dye_list = [],
         dye_diff_list = [],
         pre_mount_status = 0 :: non_neg_integer(),
         evolution_list = [],
         double_ride_role = {1, "", 0} ::
             {pos_integer(), list(), non_neg_integer()},
         is_driver = 0}).

-record(mount,
        {ver = 4 :: pos_integer(),
         index = 0 :: non_neg_integer(),
         mount_base_id = 0 :: non_neg_integer(),
         transformation_id = 0 :: non_neg_integer(),
         lev = 1 :: pos_integer(),
         skill_point = 1 :: pos_integer(),
         fail_times = 0 :: non_neg_integer(),
         upgrade_lev = 0 :: non_neg_integer(),
         live_status = 0,
         skill_list = [],
         fight_times = 0 :: non_neg_integer(),
         spirit = 0 :: non_neg_integer(),
         growth = 1 :: pos_integer(),
         growth_item_num = 0 :: non_neg_integer(),
         speed_lev = 1 :: pos_integer(),
         manger_pets = [],
         tmp_growth = 1 :: pos_integer(),
         tmp_skill_list = [],
         decorate_list = [],
         score = 0,
         expire_time = 0}).

-record(mount_skill,
        {skill_index = 1 :: pos_integer(),
         skill_id = 1 :: non_neg_integer(),
         skill_lev = 0 :: non_neg_integer()}).

-record(mount_decorate,
        {decorate_index = 1 :: pos_integer(),
         decorate_base_id = 0 :: non_neg_integer(),
         is_hide = 0 :: non_neg_integer()}).

-record(mount_dye,
        {trans_id = 0, dye_id = 0, cache_dye_list = []}).

-record(mount_evolution,
        {trans_id = 0, evolution_id = 0}).

-file("src/proto/proto_125.erl", 21).

-file("inc/gods_duel.hrl", 1).

-record(gods_duel_team,
        {ver = 1 :: pos_integer(),
         id = {0, "", 0},
         name = "",
         lev = 0,
         match_group = 0,
         leader = {0, "", 0},
         member_num = 0,
         members = [],
         fight_capacity = 0,
         applys = [],
         invite_info = [],
         declaration = "",
         win_times = 0,
         loss_times = 0,
         qualification = 0,
         team_group_256 = 0,
         team_group_64 = 0,
         team_group_8 = 0,
         team_group_4 = 0,
         team_seq = 0,
         team_index = 0}).

-record(gods_duel_team_mate,
        {ver = 1,
         id = {0, "", 0},
         name = "",
         classes = 0,
         sex = 0,
         lev = 0,
         break_times = 0,
         position = 0,
         fight_capacity = 0,
         join_time = 0}).

-record(m_gods_duel,
        {ver = 2, team_id = {0, "", 0}, gods_score = 0}).

-record(gods_duel_season_data,
        {ver = 1, serial_id = 0, history_season_info = []}).

-record(gods_duel_season_info,
        {ver = 1,
         id = 0,
         status = 0,
         teams = [],
         group_order = 0,
         season_time_info = []}).

-record(invite_info,
        {id = {0, "", 0},
         name = "",
         lev = 0,
         break_times = 0,
         classes = 0,
         sex = 0,
         total_fc = 0,
         online = 0}).

-record(gods_duel_join_team,
        {id = {0, "", 0},
         team_pid = undefined,
         team_data = undefined,
         fighters = [],
         is_ready = false}).

-record(gods_duel_match,
        {id = {0, 0},
         teams = [],
         combat_pid = undefined :: pid(),
         calc_args = [],
         combat_ref = undefined,
         is_over = 0,
         map_id = 0,
         map_pid = undefined,
         roles = []}).

-record(gods_duel_match_profile,
        {id = 0,
         ver = 1,
         season_id = 0,
         match_type = 0,
         match_round = 0,
         match_id = 0,
         group_id = 0,
         combat_type = 0,
         atk_name,
         dfd_name,
         combat_pid = undefined :: pid(),
         is_over = 0,
         platform = "",
         zone_id = 0,
         time = 0,
         fc_diff = 0,
         round = 0}).

-record(gods_duel_fighter,
        {id = {0, "", 0} :: tuple(),
         name = "" :: string(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         kill_num = 0,
         dead_num = 0,
         total_heal = 0,
         control_num = 0,
         total_hurt = 0 :: non_neg_integer(),
         total_dmg = 0 :: non_neg_integer(),
         mvp_score = 0 :: non_neg_integer()}).

-record(gods_duel_vote,
        {ver = 0 :: non_neg_integer(),
         id = {0, "", 0} :: tuple(),
         name = "" :: bitstring(),
         sex = 0 :: 0..1,
         classes = 0 :: 0..4,
         lev = 0 :: non_neg_integer(),
         season = 0 :: non_neg_integer(),
         choices = [] :: list(),
         time = 0 :: non_neg_integer()}).

-record(gods_duel_vote_choice,
        {id = {0, "", 0} :: tuple(),
         match_round = 0 :: non_neg_integer(),
         match_zone = 0,
         is_right = 0 :: 0..2}).

-record(gods_duel_poll,
        {id = {0, "", 0} :: tuple(),
         match_round = 0 :: non_neg_integer(),
         voted_cnt = 0 :: non_neg_integer()}).

-record(gods_duel_profile,
        {id = {0, "", 0} :: tuple(),
         ver = 1 :: non_neg_integer(),
         name = "" :: string(),
         lev = 0 :: non_neg_integer(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         rank_lev = 1 :: non_neg_integer(),
         gods_duel_score = 0 :: non_neg_integer()}).

-record(gods_challenge_info,
        {id, combat_pid, is_over = 0}).

-record(gods_duel_team_rank,
        {ver = 1, serial_id = 0, history_season_info = []}).

-record(gods_duel_team_rank_data,
        {ver = 1,
         id = {0, "", 0},
         name = "",
         leader = {0, "", 0},
         member_num = 0,
         members = [],
         fight_capacity = 0,
         win_times = 0,
         qualification = 0,
         rank = 0}).

-record(gods_duel_team_rank_mate,
        {ver = 1,
         id = {0, "", 0},
         name = "",
         classes = 0,
         sex = 2,
         lev = 0,
         break_times = 0,
         position = 2,
         fight_capacity = 0,
         looks = []}).

-record(gods_challenge_team,
        {season_id = 0,
         team_name = "",
         member_num = 0,
         members = []}).

-record(gods_challenge_team_mate,
        {id = {0, "", 0}, name = ""}).

-file("src/proto/proto_125.erl", 22).

-spec pack(srv | cli, non_neg_integer(),
           tuple()) -> {ok, binary()} |
                       {error, {unknown_pack_command, non_neg_integer()}}.

pack(cli, 12500,
     {V0_type, V0_page, V0_num, V0_sub_type}) ->
    D_a_t_a = <<V0_type:8/little, V0_page:8/little,
                V0_num:8/little, V0_sub_type:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12500:16/little,
       D_a_t_a/binary>>};
pack(srv, 12500,
     {V0_type,
      V0_sub_type,
      V0_page,
      V0_page_total,
      V0_record_total,
      V0_rank_list}) ->
    D_a_t_a = <<V0_type:8/little, V0_sub_type:8/little,
                V0_page:8/little, V0_page_total:8/little,
                V0_record_total:16/little,
                (length(V0_rank_list)):16/little,
                (list_to_binary([<<V1_role_id:32/little,
                                   V1_rank:8/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:16/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_sex:8/little, V1_classes:8/little,
                                   V1_lev:8/little, V1_val1:32/signed-little,
                                   V1_val2:32/signed-little,
                                   V1_val3:32/signed-little,
                                   V1_val4:32/signed-little,
                                   (protocol:pack(string, V1_desc))/binary>>
                                 || #rank_rc{role_id = V1_role_id,
                                             rank = V1_rank,
                                             platform = V1_platform,
                                             zone_id = V1_zone_id,
                                             name = V1_name, sex = V1_sex,
                                             classes = V1_classes, lev = V1_lev,
                                             val1 = V1_val1, val2 = V1_val2,
                                             val3 = V1_val3, val4 = V1_val4,
                                             desc = V1_desc}
                                        <- V0_rank_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12500:16/little,
       D_a_t_a/binary>>};
pack(cli, 12501, {V0_type}) ->
    D_a_t_a = <<V0_type:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12501:16/little,
       D_a_t_a/binary>>};
pack(srv, 12501, {V0_type, V0_rank, V0_val1}) ->
    D_a_t_a = <<V0_type:8/little, V0_rank:8/little,
                V0_val1:32/signed-little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12501:16/little,
       D_a_t_a/binary>>};
pack(cli, 12502,
     {V0_type,
      V0_sub_type,
      V0_role_id,
      V0_platform,
      V0_zone_id}) ->
    D_a_t_a = <<V0_type:8/little, V0_sub_type:8/little,
                V0_role_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12502:16/little,
       D_a_t_a/binary>>};
pack(srv, 12502,
     {V0_type,
      V0_sub_type,
      V0_role_id,
      V0_platform,
      V0_zone_id,
      #pet{name = V0_name, lev = V0_lev, exp = V0_exp,
           max_exp = V0_max_exp, base_id = V0_base_id,
           happy = V0_happy, grade = V0_grade, talent = V0_talent,
           genre = V0_genre, growth = V0_growth,
           growth_type = V0_growth_type, hp = V0_hp, mp = V0_mp,
           feed_point = V0_feed_point,
           attr =
               #attr{hp_max = V0_hp_max, mp_max = V0_mp_max,
                     atk_speed = V0_atk_speed, phy_dmg = V0_phy_dmg,
                     magic_dmg = V0_magic_dmg, phy_def = V0_phy_def,
                     magic_def = V0_magic_def, strength = V0_strength,
                     constitution = V0_constitution, magic = V0_magic,
                     agility = V0_agility, endurance = V0_endurance},
           pet_attr =
               #pet_attr{hp_aptitude = V0_hp_aptitude,
                         phy_aptitude = V0_phy_aptitude,
                         pdef_aptitude = V0_pdef_aptitude,
                         magic_aptitude = V0_magic_aptitude,
                         aspd_aptitude = V0_aspd_aptitude,
                         max_hp_aptitude = V0_max_hp_aptitude,
                         max_phy_aptitude = V0_max_phy_aptitude,
                         max_pdef_aptitude = V0_max_pdef_aptitude,
                         max_magic_aptitude = V0_max_magic_aptitude,
                         max_aspd_aptitude = V0_max_aspd_aptitude},
           skills = V0_skills, stones = V0_stones,
           mount_skills = V0_mount_skills,
           pet_skin = #pet_skin{use_skin = V0_use_skin},
           handbook_attr = V0_handbook_attr,
           handbook_num = V0_handbook_num,
           star_handbook_num = V0_star_handbook_num,
           spirit_info = V0_spirit_info,
           pet_rune = V0_pet_rune}}) ->
    D_a_t_a = <<V0_type:8/little, V0_sub_type:8/little,
                V0_role_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little,
                (protocol:pack(string, V0_name))/binary,
                V0_lev:8/little, V0_exp:32/little, V0_max_exp:32/little,
                V0_base_id:32/little, V0_happy:8/little,
                V0_grade:8/little, V0_talent:16/little,
                V0_genre:8/little, V0_growth:16/little,
                V0_growth_type:8/little, V0_hp:32/little,
                V0_mp:32/little, V0_feed_point:32/little,
                V0_hp_max:32/little, V0_mp_max:32/little,
                V0_atk_speed:16/little, V0_phy_dmg:32/little,
                V0_magic_dmg:32/little, V0_phy_def:32/little,
                V0_magic_def:32/little, V0_strength:16/little,
                V0_constitution:16/little, V0_magic:16/little,
                V0_agility:16/little, V0_endurance:16/little,
                V0_hp_aptitude:16/little, V0_phy_aptitude:16/little,
                V0_pdef_aptitude:16/little, V0_magic_aptitude:16/little,
                V0_aspd_aptitude:16/little,
                V0_max_hp_aptitude:16/little,
                V0_max_phy_aptitude:16/little,
                V0_max_pdef_aptitude:16/little,
                V0_max_magic_aptitude:16/little,
                V0_max_aspd_aptitude:16/little,
                (length(V0_skills)):16/little,
                (list_to_binary([<<V1_id:32/little, V1_source:8/little>>
                                 || #pet_skill{id = V1_id, source = V1_source}
                                        <- V0_skills]))/binary,
                (length(V0_stones)):16/little,
                (list_to_binary([<<V1_id:32/little,
                                   V1_base_id:32/little,
                                   (length(V1_attr)):16/little,
                                   (list_to_binary([<<V2_type:16/little,
                                                      V2_name:32/little,
                                                      V2_flag:32/little,
                                                      V2_val:32/signed-little>>
                                                    || #attr_base{type =
                                                                      V2_type,
                                                                  name =
                                                                      V2_name,
                                                                  flag =
                                                                      V2_flag,
                                                                  val = V2_val}
                                                           <- V1_attr]))/binary,
                                   (length(V1_reset_attr)):16/little,
                                   (list_to_binary([<<V2_type:16/little,
                                                      V2_name:32/little,
                                                      V2_flag:32/little,
                                                      V2_val:32/signed-little>>
                                                    || #attr_base{type =
                                                                      V2_type,
                                                                  name =
                                                                      V2_name,
                                                                  flag =
                                                                      V2_flag,
                                                                  val = V2_val}
                                                           <- V1_reset_attr]))/binary,
                                   (length(V1_extra)):16/little,
                                   (list_to_binary([<<V2_name:32/little,
                                                      V2_value:32/little,
                                                      (protocol:pack(string,
                                                                     V2_str))/binary>>
                                                    || {V2_name,
                                                        V2_value,
                                                        V2_str}
                                                           <- V1_extra]))/binary>>
                                 || #item{id = V1_id, base_id = V1_base_id,
                                          attr = V1_attr,
                                          reset_attr = V1_reset_attr,
                                          extra = V1_extra}
                                        <- V0_stones]))/binary,
                (length(V0_mount_skills)):16/little,
                (list_to_binary([<<V1_skill_index:8/little,
                                   V1_skill_id:32/little,
                                   V1_skill_lev:32/little>>
                                 || #mount_skill{skill_index = V1_skill_index,
                                                 skill_id = V1_skill_id,
                                                 skill_lev = V1_skill_lev}
                                        <- V0_mount_skills]))/binary,
                V0_use_skin:32/little,
                (length(V0_handbook_attr)):16/little,
                (list_to_binary([<<V1_attr_name:32/little,
                                   V1_attr_val:32/little>>
                                 || {V1_attr_name, V1_attr_val}
                                        <- V0_handbook_attr]))/binary,
                V0_handbook_num:8/little, V0_star_handbook_num:8/little,
                (length(V0_spirit_info)):16/little,
                (list_to_binary([<<V1_spirit_base_id:32/little,
                                   V1_spirit_talent:32/little,
                                   V1_spirit_lev:16/little>>
                                 || {V1_spirit_base_id,
                                     V1_spirit_talent,
                                     V1_spirit_lev}
                                        <- V0_spirit_info]))/binary,
                (length(V0_pet_rune)):16/little,
                (list_to_binary([<<V1_rune_index:8/little,
                                   V1_rune_type:8/little,
                                   V1_rune_status:8/little,
                                   V1_rune_id:32/little, V1_rune_lev:8/little,
                                   V1_is_resonance:8/little,
                                   (length(V1_resonances)):16/little,
                                   (list_to_binary([<<V2_resonance_index:8/little,
                                                      V2_resonance_id:32/little,
                                                      V2_rune_index:8/little>>
                                                    || #pet_resonance{resonance_index
                                                                          =
                                                                          V2_resonance_index,
                                                                      resonance_id
                                                                          =
                                                                          V2_resonance_id,
                                                                      rune_index
                                                                          =
                                                                          V2_rune_index}
                                                           <- V1_resonances]))/binary>>
                                 || #pet_rune{rune_index = V1_rune_index,
                                              rune_type = V1_rune_type,
                                              rune_status = V1_rune_status,
                                              rune_id = V1_rune_id,
                                              rune_lev = V1_rune_lev,
                                              is_resonance = V1_is_resonance,
                                              resonances = V1_resonances}
                                        <- V0_pet_rune]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12502:16/little,
       D_a_t_a/binary>>};
pack(cli, 12503,
     {V0_type,
      V0_sub_type,
      V0_role_id,
      V0_platform,
      V0_zone_id}) ->
    D_a_t_a = <<V0_type:8/little, V0_sub_type:8/little,
                V0_role_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12503:16/little,
       D_a_t_a/binary>>};
pack(srv, 12503,
     {V0_type,
      V0_sub_type,
      V0_role_id,
      V0_platform,
      V0_zone_id,
      V0_name,
      #guard{base_id = V0_base_id, score = V0_score,
             quality = V0_quality,
             attr =
                 #attr{hp_max = V0_hp_max, mp_max = V0_mp_max,
                       atk_speed = V0_atk_speed, phy_dmg = V0_phy_dmg,
                       magic_dmg = V0_magic_dmg, phy_def = V0_phy_def,
                       magic_def = V0_magic_def, heal_val = V0_heal_val},
             eqm = V0_eqm}}) ->
    D_a_t_a = <<V0_type:8/little, V0_sub_type:8/little,
                V0_role_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little,
                (protocol:pack(string, V0_name))/binary,
                V0_base_id:32/little, V0_score:32/little,
                V0_quality:8/little, V0_hp_max:32/little,
                V0_mp_max:32/little, V0_atk_speed:16/little,
                V0_phy_dmg:32/little, V0_magic_dmg:32/little,
                V0_phy_def:32/little, V0_magic_def:32/little,
                V0_heal_val:16/little, (length(V0_eqm)):16/little,
                (list_to_binary([<<V1_base_id:32/little,
                                   (length(V1_eqm_attrs)):16/little,
                                   (list_to_binary([<<V2_type:16/little,
                                                      V2_name:32/little,
                                                      V2_val:32/signed-little>>
                                                    || #attr_base{type =
                                                                      V2_type,
                                                                  name =
                                                                      V2_name,
                                                                  val = V2_val}
                                                           <- V1_eqm_attrs]))/binary,
                                   (length(V1_gem)):16/little,
                                   (list_to_binary([<<V2_id:8/little,
                                                      V2_base_id:32/little,
                                                      V2_type:8/little>>
                                                    || #guard_eqm_gem{id =
                                                                          V2_id,
                                                                      base_id =
                                                                          V2_base_id,
                                                                      type =
                                                                          V2_type}
                                                           <- V1_gem]))/binary>>
                                 || #guard_eqm{base_id = V1_base_id,
                                               eqm_attrs = V1_eqm_attrs,
                                               gem = V1_gem}
                                        <- V0_eqm]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12503:16/little,
       D_a_t_a/binary>>};
pack(cli, 12505,
     {V0_type, V0_page, V0_num, V0_sub_type}) ->
    D_a_t_a = <<V0_type:8/little, V0_page:8/little,
                V0_num:8/little, V0_sub_type:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12505:16/little,
       D_a_t_a/binary>>};
pack(srv, 12505,
     {V0_type,
      V0_sub_type,
      V0_page,
      V0_page_total,
      V0_record_total,
      V0_rank_list}) ->
    D_a_t_a = <<V0_type:8/little, V0_sub_type:8/little,
                V0_page:8/little, V0_page_total:8/little,
                V0_record_total:16/little,
                (length(V0_rank_list)):16/little,
                (list_to_binary([<<V1_role_id:32/little,
                                   V1_rank:8/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:16/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_sex:8/little, V1_classes:8/little,
                                   V1_lev:8/little, V1_val1:32/signed-little,
                                   V1_val2:32/signed-little,
                                   V1_val3:32/signed-little,
                                   V1_val4:32/signed-little,
                                   (protocol:pack(string, V1_desc))/binary>>
                                 || #rank_rc{role_id = V1_role_id,
                                             rank = V1_rank,
                                             platform = V1_platform,
                                             zone_id = V1_zone_id,
                                             name = V1_name, sex = V1_sex,
                                             classes = V1_classes, lev = V1_lev,
                                             val1 = V1_val1, val2 = V1_val2,
                                             val3 = V1_val3, val4 = V1_val4,
                                             desc = V1_desc}
                                        <- V0_rank_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12505:16/little,
       D_a_t_a/binary>>};
pack(cli, 12506,
     {V0_team_id, V0_platform, V0_zone_id, V0_group_id}) ->
    D_a_t_a = <<V0_team_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little, V0_group_id:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12506:16/little,
       D_a_t_a/binary>>};
pack(srv, 12506, {V0_team_name, V0_mate_list}) ->
    D_a_t_a = <<(protocol:pack(string,
                               V0_team_name))/binary,
                (length(V0_mate_list)):16/little,
                (list_to_binary([<<V1_role_id:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:16/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_classes:8/little, V1_sex:8/little,
                                   V1_lev:8/little, V1_break_times:8/little,
                                   V1_position:8/little,
                                   (length(V1_looks)):16/little,
                                   (list_to_binary([<<V2_looks_type:32/little,
                                                      V2_looks_mode:32/little,
                                                      V2_looks_val:32/little,
                                                      (protocol:pack(string,
                                                                     V2_looks_str))/binary>>
                                                    || {V2_looks_type,
                                                        V2_looks_mode,
                                                        V2_looks_val,
                                                        V2_looks_str}
                                                           <- V1_looks]))/binary>>
                                 || #gods_duel_team_rank_mate{id =
                                                                  {V1_role_id,
                                                                   V1_platform,
                                                                   V1_zone_id},
                                                              name = V1_name,
                                                              classes =
                                                                  V1_classes,
                                                              sex = V1_sex,
                                                              lev = V1_lev,
                                                              break_times =
                                                                  V1_break_times,
                                                              position =
                                                                  V1_position,
                                                              looks = V1_looks}
                                        <- V0_mate_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12506:16/little,
       D_a_t_a/binary>>};
pack(_Type, Code, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
             binary()) -> {ok, tuple()} |
                          {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(srv, 12500, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {V1_page, _B2} = protocol:uint8(_B1),
    {V1_num, _B3} = protocol:uint8(_B2),
    {V1_sub_type, _B4} = protocol:uint8(_B3),
    {ok, {V1_type, V1_page, V1_num, V1_sub_type}};
unpack(cli, 12500, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {V1_sub_type, _B2} = protocol:uint8(_B1),
    {V1_page, _B3} = protocol:uint8(_B2),
    {V1_page_total, _B4} = protocol:uint8(_B3),
    {V1_record_total, _B5} = protocol:uint16(_B4),
    {V1_rank_list, _B21} = protocol:array(_B5,
                                          fun (_B6) ->
                                                  {V2_role_id, _B7} =
                                                      protocol:uint32(_B6),
                                                  {V2_rank, _B8} =
                                                      protocol:uint8(_B7),
                                                  {V2_platform, _B9} =
                                                      protocol:string(_B8),
                                                  {V2_zone_id, _B10} =
                                                      protocol:uint16(_B9),
                                                  {V2_name, _B11} =
                                                      protocol:string(_B10),
                                                  {V2_sex, _B12} =
                                                      protocol:uint8(_B11),
                                                  {V2_classes, _B13} =
                                                      protocol:uint8(_B12),
                                                  {V2_lev, _B14} =
                                                      protocol:uint8(_B13),
                                                  {V2_val1, _B15} =
                                                      protocol:int32(_B14),
                                                  {V2_val2, _B16} =
                                                      protocol:int32(_B15),
                                                  {V2_val3, _B17} =
                                                      protocol:int32(_B16),
                                                  {V2_val4, _B18} =
                                                      protocol:int32(_B17),
                                                  {V2_desc, _B19} =
                                                      protocol:string(_B18),
                                                  {{V2_role_id,
                                                    V2_rank,
                                                    V2_platform,
                                                    V2_zone_id,
                                                    V2_name,
                                                    V2_sex,
                                                    V2_classes,
                                                    V2_lev,
                                                    V2_val1,
                                                    V2_val2,
                                                    V2_val3,
                                                    V2_val4,
                                                    V2_desc},
                                                   _B19}
                                          end),
    {ok,
     {V1_type,
      V1_sub_type,
      V1_page,
      V1_page_total,
      V1_record_total,
      V1_rank_list}};
unpack(srv, 12501, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {ok, {V1_type}};
unpack(cli, 12501, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {V1_rank, _B2} = protocol:uint8(_B1),
    {V1_val1, _B3} = protocol:int32(_B2),
    {ok, {V1_type, V1_rank, V1_val1}};
unpack(srv, 12502, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {V1_sub_type, _B2} = protocol:uint8(_B1),
    {V1_role_id, _B3} = protocol:uint32(_B2),
    {V1_platform, _B4} = protocol:string(_B3),
    {V1_zone_id, _B5} = protocol:uint16(_B4),
    {ok,
     {V1_type,
      V1_sub_type,
      V1_role_id,
      V1_platform,
      V1_zone_id}};
unpack(cli, 12502, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {V1_sub_type, _B2} = protocol:uint8(_B1),
    {V1_role_id, _B3} = protocol:uint32(_B2),
    {V1_platform, _B4} = protocol:string(_B3),
    {V1_zone_id, _B5} = protocol:uint16(_B4),
    {V1_name, _B6} = protocol:string(_B5),
    {V1_lev, _B7} = protocol:uint8(_B6),
    {V1_exp, _B8} = protocol:uint32(_B7),
    {V1_max_exp, _B9} = protocol:uint32(_B8),
    {V1_base_id, _B10} = protocol:uint32(_B9),
    {V1_happy, _B11} = protocol:uint8(_B10),
    {V1_grade, _B12} = protocol:uint8(_B11),
    {V1_talent, _B13} = protocol:uint16(_B12),
    {V1_genre, _B14} = protocol:uint8(_B13),
    {V1_growth, _B15} = protocol:uint16(_B14),
    {V1_growth_type, _B16} = protocol:uint8(_B15),
    {V1_hp, _B17} = protocol:uint32(_B16),
    {V1_mp, _B18} = protocol:uint32(_B17),
    {V1_feed_point, _B19} = protocol:uint32(_B18),
    {V1_hp_max, _B20} = protocol:uint32(_B19),
    {V1_mp_max, _B21} = protocol:uint32(_B20),
    {V1_atk_speed, _B22} = protocol:uint16(_B21),
    {V1_phy_dmg, _B23} = protocol:uint32(_B22),
    {V1_magic_dmg, _B24} = protocol:uint32(_B23),
    {V1_phy_def, _B25} = protocol:uint32(_B24),
    {V1_magic_def, _B26} = protocol:uint32(_B25),
    {V1_strength, _B27} = protocol:uint16(_B26),
    {V1_constitution, _B28} = protocol:uint16(_B27),
    {V1_magic, _B29} = protocol:uint16(_B28),
    {V1_agility, _B30} = protocol:uint16(_B29),
    {V1_endurance, _B31} = protocol:uint16(_B30),
    {V1_hp_aptitude, _B32} = protocol:uint16(_B31),
    {V1_phy_aptitude, _B33} = protocol:uint16(_B32),
    {V1_pdef_aptitude, _B34} = protocol:uint16(_B33),
    {V1_magic_aptitude, _B35} = protocol:uint16(_B34),
    {V1_aspd_aptitude, _B36} = protocol:uint16(_B35),
    {V1_max_hp_aptitude, _B37} = protocol:uint16(_B36),
    {V1_max_phy_aptitude, _B38} = protocol:uint16(_B37),
    {V1_max_pdef_aptitude, _B39} = protocol:uint16(_B38),
    {V1_max_magic_aptitude, _B40} = protocol:uint16(_B39),
    {V1_max_aspd_aptitude, _B41} = protocol:uint16(_B40),
    {V1_skills, _B46} = protocol:array(_B41,
                                       fun (_B42) ->
                                               {V2_id, _B43} =
                                                   protocol:uint32(_B42),
                                               {V2_source, _B44} =
                                                   protocol:uint8(_B43),
                                               {{V2_id, V2_source}, _B44}
                                       end),
    {V1_stones, _B71} = protocol:array(_B46,
                                       fun (_B47) ->
                                               {V2_id, _B48} =
                                                   protocol:uint32(_B47),
                                               {V2_base_id, _B49} =
                                                   protocol:uint32(_B48),
                                               {V2_attr, _B56} =
                                                   protocol:array(_B49,
                                                                  fun (_B50) ->
                                                                          {V3_type,
                                                                           _B51} =
                                                                              protocol:uint16(_B50),
                                                                          {V3_name,
                                                                           _B52} =
                                                                              protocol:uint32(_B51),
                                                                          {V3_flag,
                                                                           _B53} =
                                                                              protocol:uint32(_B52),
                                                                          {V3_val,
                                                                           _B54} =
                                                                              protocol:int32(_B53),
                                                                          {{V3_type,
                                                                            V3_name,
                                                                            V3_flag,
                                                                            V3_val},
                                                                           _B54}
                                                                  end),
                                               {V2_reset_attr, _B63} =
                                                   protocol:array(_B56,
                                                                  fun (_B57) ->
                                                                          {V3_type,
                                                                           _B58} =
                                                                              protocol:uint16(_B57),
                                                                          {V3_name,
                                                                           _B59} =
                                                                              protocol:uint32(_B58),
                                                                          {V3_flag,
                                                                           _B60} =
                                                                              protocol:uint32(_B59),
                                                                          {V3_val,
                                                                           _B61} =
                                                                              protocol:int32(_B60),
                                                                          {{V3_type,
                                                                            V3_name,
                                                                            V3_flag,
                                                                            V3_val},
                                                                           _B61}
                                                                  end),
                                               {V2_extra, _B69} =
                                                   protocol:array(_B63,
                                                                  fun (_B64) ->
                                                                          {V3_name,
                                                                           _B65} =
                                                                              protocol:uint32(_B64),
                                                                          {V3_value,
                                                                           _B66} =
                                                                              protocol:uint32(_B65),
                                                                          {V3_str,
                                                                           _B67} =
                                                                              protocol:string(_B66),
                                                                          {{V3_name,
                                                                            V3_value,
                                                                            V3_str},
                                                                           _B67}
                                                                  end),
                                               {{V2_id,
                                                 V2_base_id,
                                                 V2_attr,
                                                 V2_reset_attr,
                                                 V2_extra},
                                                _B69}
                                       end),
    {V1_mount_skills, _B77} = protocol:array(_B71,
                                             fun (_B72) ->
                                                     {V2_skill_index, _B73} =
                                                         protocol:uint8(_B72),
                                                     {V2_skill_id, _B74} =
                                                         protocol:uint32(_B73),
                                                     {V2_skill_lev, _B75} =
                                                         protocol:uint32(_B74),
                                                     {{V2_skill_index,
                                                       V2_skill_id,
                                                       V2_skill_lev},
                                                      _B75}
                                             end),
    {V1_use_skin, _B78} = protocol:uint32(_B77),
    {V1_handbook_attr, _B83} = protocol:array(_B78,
                                              fun (_B79) ->
                                                      {V2_attr_name, _B80} =
                                                          protocol:uint32(_B79),
                                                      {V2_attr_val, _B81} =
                                                          protocol:uint32(_B80),
                                                      {{V2_attr_name,
                                                        V2_attr_val},
                                                       _B81}
                                              end),
    {V1_handbook_num, _B84} = protocol:uint8(_B83),
    {V1_star_handbook_num, _B85} = protocol:uint8(_B84),
    {V1_spirit_info, _B91} = protocol:array(_B85,
                                            fun (_B86) ->
                                                    {V2_spirit_base_id, _B87} =
                                                        protocol:uint32(_B86),
                                                    {V2_spirit_talent, _B88} =
                                                        protocol:uint32(_B87),
                                                    {V2_spirit_lev, _B89} =
                                                        protocol:uint16(_B88),
                                                    {{V2_spirit_base_id,
                                                      V2_spirit_talent,
                                                      V2_spirit_lev},
                                                     _B89}
                                            end),
    {V1_pet_rune, _B106} = protocol:array(_B91,
                                          fun (_B92) ->
                                                  {V2_rune_index, _B93} =
                                                      protocol:uint8(_B92),
                                                  {V2_rune_type, _B94} =
                                                      protocol:uint8(_B93),
                                                  {V2_rune_status, _B95} =
                                                      protocol:uint8(_B94),
                                                  {V2_rune_id, _B96} =
                                                      protocol:uint32(_B95),
                                                  {V2_rune_lev, _B97} =
                                                      protocol:uint8(_B96),
                                                  {V2_is_resonance, _B98} =
                                                      protocol:uint8(_B97),
                                                  {V2_resonances, _B104} =
                                                      protocol:array(_B98,
                                                                     fun
                                                                         (_B99) ->
                                                                             {V3_resonance_index,
                                                                              _B100} =
                                                                                 protocol:uint8(_B99),
                                                                             {V3_resonance_id,
                                                                              _B101} =
                                                                                 protocol:uint32(_B100),
                                                                             {V3_rune_index,
                                                                              _B102} =
                                                                                 protocol:uint8(_B101),
                                                                             {{V3_resonance_index,
                                                                               V3_resonance_id,
                                                                               V3_rune_index},
                                                                              _B102}
                                                                     end),
                                                  {{V2_rune_index,
                                                    V2_rune_type,
                                                    V2_rune_status,
                                                    V2_rune_id,
                                                    V2_rune_lev,
                                                    V2_is_resonance,
                                                    V2_resonances},
                                                   _B104}
                                          end),
    {ok,
     {V1_type,
      V1_sub_type,
      V1_role_id,
      V1_platform,
      V1_zone_id,
      V1_name,
      V1_lev,
      V1_exp,
      V1_max_exp,
      V1_base_id,
      V1_happy,
      V1_grade,
      V1_talent,
      V1_genre,
      V1_growth,
      V1_growth_type,
      V1_hp,
      V1_mp,
      V1_feed_point,
      V1_hp_max,
      V1_mp_max,
      V1_atk_speed,
      V1_phy_dmg,
      V1_magic_dmg,
      V1_phy_def,
      V1_magic_def,
      V1_strength,
      V1_constitution,
      V1_magic,
      V1_agility,
      V1_endurance,
      V1_hp_aptitude,
      V1_phy_aptitude,
      V1_pdef_aptitude,
      V1_magic_aptitude,
      V1_aspd_aptitude,
      V1_max_hp_aptitude,
      V1_max_phy_aptitude,
      V1_max_pdef_aptitude,
      V1_max_magic_aptitude,
      V1_max_aspd_aptitude,
      V1_skills,
      V1_stones,
      V1_mount_skills,
      V1_use_skin,
      V1_handbook_attr,
      V1_handbook_num,
      V1_star_handbook_num,
      V1_spirit_info,
      V1_pet_rune}};
unpack(srv, 12503, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {V1_sub_type, _B2} = protocol:uint8(_B1),
    {V1_role_id, _B3} = protocol:uint32(_B2),
    {V1_platform, _B4} = protocol:string(_B3),
    {V1_zone_id, _B5} = protocol:uint16(_B4),
    {ok,
     {V1_type,
      V1_sub_type,
      V1_role_id,
      V1_platform,
      V1_zone_id}};
unpack(cli, 12503, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {V1_sub_type, _B2} = protocol:uint8(_B1),
    {V1_role_id, _B3} = protocol:uint32(_B2),
    {V1_platform, _B4} = protocol:string(_B3),
    {V1_zone_id, _B5} = protocol:uint16(_B4),
    {V1_name, _B6} = protocol:string(_B5),
    {V1_base_id, _B7} = protocol:uint32(_B6),
    {V1_score, _B8} = protocol:uint32(_B7),
    {V1_quality, _B9} = protocol:uint8(_B8),
    {V1_hp_max, _B10} = protocol:uint32(_B9),
    {V1_mp_max, _B11} = protocol:uint32(_B10),
    {V1_atk_speed, _B12} = protocol:uint16(_B11),
    {V1_phy_dmg, _B13} = protocol:uint32(_B12),
    {V1_magic_dmg, _B14} = protocol:uint32(_B13),
    {V1_phy_def, _B15} = protocol:uint32(_B14),
    {V1_magic_def, _B16} = protocol:uint32(_B15),
    {V1_heal_val, _B17} = protocol:uint16(_B16),
    {V1_eqm, _B33} = protocol:array(_B17,
                                    fun (_B18) ->
                                            {V2_base_id, _B19} =
                                                protocol:uint32(_B18),
                                            {V2_eqm_attrs, _B25} =
                                                protocol:array(_B19,
                                                               fun (_B20) ->
                                                                       {V3_type,
                                                                        _B21} =
                                                                           protocol:uint16(_B20),
                                                                       {V3_name,
                                                                        _B22} =
                                                                           protocol:uint32(_B21),
                                                                       {V3_val,
                                                                        _B23} =
                                                                           protocol:int32(_B22),
                                                                       {{V3_type,
                                                                         V3_name,
                                                                         V3_val},
                                                                        _B23}
                                                               end),
                                            {V2_gem, _B31} =
                                                protocol:array(_B25,
                                                               fun (_B26) ->
                                                                       {V3_id,
                                                                        _B27} =
                                                                           protocol:uint8(_B26),
                                                                       {V3_base_id,
                                                                        _B28} =
                                                                           protocol:uint32(_B27),
                                                                       {V3_type,
                                                                        _B29} =
                                                                           protocol:uint8(_B28),
                                                                       {{V3_id,
                                                                         V3_base_id,
                                                                         V3_type},
                                                                        _B29}
                                                               end),
                                            {{V2_base_id, V2_eqm_attrs, V2_gem},
                                             _B31}
                                    end),
    {ok,
     {V1_type,
      V1_sub_type,
      V1_role_id,
      V1_platform,
      V1_zone_id,
      V1_name,
      V1_base_id,
      V1_score,
      V1_quality,
      V1_hp_max,
      V1_mp_max,
      V1_atk_speed,
      V1_phy_dmg,
      V1_magic_dmg,
      V1_phy_def,
      V1_magic_def,
      V1_heal_val,
      V1_eqm}};
unpack(srv, 12505, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {V1_page, _B2} = protocol:uint8(_B1),
    {V1_num, _B3} = protocol:uint8(_B2),
    {V1_sub_type, _B4} = protocol:uint8(_B3),
    {ok, {V1_type, V1_page, V1_num, V1_sub_type}};
unpack(cli, 12505, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {V1_sub_type, _B2} = protocol:uint8(_B1),
    {V1_page, _B3} = protocol:uint8(_B2),
    {V1_page_total, _B4} = protocol:uint8(_B3),
    {V1_record_total, _B5} = protocol:uint16(_B4),
    {V1_rank_list, _B21} = protocol:array(_B5,
                                          fun (_B6) ->
                                                  {V2_role_id, _B7} =
                                                      protocol:uint32(_B6),
                                                  {V2_rank, _B8} =
                                                      protocol:uint8(_B7),
                                                  {V2_platform, _B9} =
                                                      protocol:string(_B8),
                                                  {V2_zone_id, _B10} =
                                                      protocol:uint16(_B9),
                                                  {V2_name, _B11} =
                                                      protocol:string(_B10),
                                                  {V2_sex, _B12} =
                                                      protocol:uint8(_B11),
                                                  {V2_classes, _B13} =
                                                      protocol:uint8(_B12),
                                                  {V2_lev, _B14} =
                                                      protocol:uint8(_B13),
                                                  {V2_val1, _B15} =
                                                      protocol:int32(_B14),
                                                  {V2_val2, _B16} =
                                                      protocol:int32(_B15),
                                                  {V2_val3, _B17} =
                                                      protocol:int32(_B16),
                                                  {V2_val4, _B18} =
                                                      protocol:int32(_B17),
                                                  {V2_desc, _B19} =
                                                      protocol:string(_B18),
                                                  {{V2_role_id,
                                                    V2_rank,
                                                    V2_platform,
                                                    V2_zone_id,
                                                    V2_name,
                                                    V2_sex,
                                                    V2_classes,
                                                    V2_lev,
                                                    V2_val1,
                                                    V2_val2,
                                                    V2_val3,
                                                    V2_val4,
                                                    V2_desc},
                                                   _B19}
                                          end),
    {ok,
     {V1_type,
      V1_sub_type,
      V1_page,
      V1_page_total,
      V1_record_total,
      V1_rank_list}};
unpack(srv, 12506, _B0) ->
    {V1_team_id, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {V1_group_id, _B4} = protocol:uint8(_B3),
    {ok,
     {V1_team_id, V1_platform, V1_zone_id, V1_group_id}};
unpack(cli, 12506, _B0) ->
    {V1_team_name, _B1} = protocol:string(_B0),
    {V1_mate_list, _B20} = protocol:array(_B1,
                                          fun (_B2) ->
                                                  {V2_role_id, _B3} =
                                                      protocol:uint32(_B2),
                                                  {V2_platform, _B4} =
                                                      protocol:string(_B3),
                                                  {V2_zone_id, _B5} =
                                                      protocol:uint16(_B4),
                                                  {V2_name, _B6} =
                                                      protocol:string(_B5),
                                                  {V2_classes, _B7} =
                                                      protocol:uint8(_B6),
                                                  {V2_sex, _B8} =
                                                      protocol:uint8(_B7),
                                                  {V2_lev, _B9} =
                                                      protocol:uint8(_B8),
                                                  {V2_break_times, _B10} =
                                                      protocol:uint8(_B9),
                                                  {V2_position, _B11} =
                                                      protocol:uint8(_B10),
                                                  {V2_looks, _B18} =
                                                      protocol:array(_B11,
                                                                     fun
                                                                         (_B12) ->
                                                                             {V3_looks_type,
                                                                              _B13} =
                                                                                 protocol:uint32(_B12),
                                                                             {V3_looks_mode,
                                                                              _B14} =
                                                                                 protocol:uint32(_B13),
                                                                             {V3_looks_val,
                                                                              _B15} =
                                                                                 protocol:uint32(_B14),
                                                                             {V3_looks_str,
                                                                              _B16} =
                                                                                 protocol:string(_B15),
                                                                             {{V3_looks_type,
                                                                               V3_looks_mode,
                                                                               V3_looks_val,
                                                                               V3_looks_str},
                                                                              _B16}
                                                                     end),
                                                  {{V2_role_id,
                                                    V2_platform,
                                                    V2_zone_id,
                                                    V2_name,
                                                    V2_classes,
                                                    V2_sex,
                                                    V2_lev,
                                                    V2_break_times,
                                                    V2_position,
                                                    V2_looks},
                                                   _B18}
                                          end),
    {ok, {V1_team_name, V1_mate_list}};
unpack(_Type, Code, _Data) ->
    {error, {unknown_unpack_command, Code}}.

