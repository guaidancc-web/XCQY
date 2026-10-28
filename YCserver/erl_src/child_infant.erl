-file("src/mod/child/child_infant.erl", 1).

-module(child_infant).

-export([choose_classes/3,
         sync_choose_classes/3,
         study/4,
         gm_study/1,
         sync_study/4,
         grow_to_toddler/2,
         sync_grow_to_toddler/2,
         switch_classes_type/3,
         sync_switch_classes_type/3,
         set_plan/3,
         sync_set_plan/3,
         reset_study/2,
         sync_reset_study/2,
         gm_set_init/1]).

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

-file("src/mod/child/child_infant.erl", 27).

-file("inc/child.hrl", 1).

-record(m_child,
        {ver = 1,
         kids = [] :: list(),
         fertility = 0 :: non_neg_integer(),
         tonic = 0 :: non_neg_integer(),
         hungry_notice_lev = []}).

-record(child_attr,
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
         max_aspd_aptitude = 0,
         study_str = 0,
         study_con = 0,
         study_mag = 0,
         study_agi = 0,
         study_end = 0}).

-record(child_study_plan,
        {ver = 1,
         is_init = 1,
         study_str_easy = 0,
         study_con_easy = 0,
         study_mag_easy = 0,
         study_agi_easy = 0,
         study_end_easy = 0,
         study_str_hard = 0,
         study_con_hard = 0,
         study_mag_hard = 0,
         study_agi_hard = 0,
         study_end_hard = 0,
         study_str_plan_easy = 0,
         study_con_plan_easy = 0,
         study_mag_plan_easy = 0,
         study_agi_plan_easy = 0,
         study_end_plan_easy = 0,
         study_str_plan_hard = 0,
         study_con_plan_hard = 0,
         study_mag_plan_hard = 0,
         study_agi_plan_hard = 0,
         study_end_plan_hard = 0}).

-record(child_base,
        {id = 0,
         name = "",
         classes,
         sex,
         hp_aptitude = 0,
         phy_aptitude = 0,
         pdef_aptitude = 0,
         magic_aptitude = 0,
         aspd_aptitude = 0,
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
         unit_id = 0,
         unit_id_1 = 0,
         unit_id_2 = 0,
         unit_id_3 = 0,
         classes_skills = []}).

-record(child,
        {id = {0, "", 0} :: tuple(),
         ver = 5,
         parents = [] :: list(),
         custody = {0, "", 0} :: tuple(),
         name = "" :: string(),
         base_id = 0,
         sex = 0 :: 0 | 1,
         classes = 0 :: non_neg_integer(),
         classes_type = 1,
         embryo = 1 :: non_neg_integer(),
         pregnant_time = 0 :: non_neg_integer(),
         birth_time = 0 :: non_neg_integer(),
         stage = 1 :: non_neg_integer(),
         status = 0,
         follow = {0, "", 0} :: tuple(),
         maturity = 0 :: non_neg_integer(),
         growth = 0 :: non_neg_integer(),
         ext_growth = 0,
         growth_type = 5 :: non_neg_integer(),
         lev = 1 :: non_neg_integer(),
         skills = [] :: list(),
         talent_skills = [],
         hungry = 100,
         add_point = 0,
         add_point_item = [],
         grade = 0,
         grade_attr = [],
         hp = 0,
         mp = 0,
         attr,
         looks = [],
         stones = [] :: list(),
         use_growth = 0,
         study_easy = 0,
         study_hard = 0,
         day_easy = 0,
         day_hard = 0,
         study_easy_time = 0,
         study_hard_time = 0,
         talent = 0,
         child_attr = #child_attr{},
         name_changed = 0 :: non_neg_integer(),
         last_name_changed = 0 :: non_neg_integer(),
         maturity_added_log = [] :: list(),
         last_added_maturity = 0 :: non_neg_integer(),
         handbook_attr = [],
         handbook_num = 0,
         star_handbook_num = 0,
         combat_talk = [],
         free_study = 0,
         study_plan = #child_study_plan{},
         spirit_attached = 0 :: 0 | 1,
         spirit_skills = [],
         spirit_info = [],
         child_skin = []}).

-record(child_parent,
        {id = {0, "", 0} :: tuple(),
         ver = 0,
         name = "" :: string(),
         sex = 0 :: 0 | 1,
         account = "",
         lev = 1,
         classes = 0 :: non_neg_integer(),
         looks = [] :: list(),
         intimacy = 0 :: non_neg_integer()}).

-record(child_base_skill,
        {id = 0,
         name = "",
         type = 0,
         step = 0,
         lev = 0,
         max_exp = 0,
         attr = []}).

-record(child_skill,
        {id = 0,
         lev = 1,
         step = 0,
         type = 0,
         source = 1,
         is_open = 1,
         exp = 1}).

-record(child_stone,
        {id = 0,
         type = 0,
         base_id = 0,
         role_id = {0, "", 0},
         attr = [],
         extra = [],
         reset_attr = []}).

-record(child_talent_skill,
        {id = 0, grade = 0, lev = 1, exp = 0}).

-record(child_rank, {type = 1, list = []}).

-record(child_rank_rc,
        {id = {0, "", 0} :: tuple(),
         rank = 1,
         ver = 0,
         father_id = {0, "", 0},
         father_name = "",
         father_classes = 0,
         father_sex = 0,
         mother_id = {0, "", 0},
         mother_name = "",
         mother_classes = 0,
         mother_sex = 0,
         custody = {0, "", 0} :: tuple(),
         name = "" :: string(),
         base_id = 0,
         sex = 0 :: 0 | 1,
         classes = 0 :: non_neg_integer(),
         classes_type = 1,
         lev = 1 :: non_neg_integer(),
         val1 = 0 :: non_neg_integer(),
         val2 = 0 :: non_neg_integer(),
         val3 = 0 :: non_neg_integer(),
         val4 = 0 :: non_neg_integer(),
         time = 0}).

-record(child_skin,
        {ver = 2,
         skin_id = 0,
         skin_active_flag = 0,
         expire_time = 0,
         timer_flag = 0}).

-file("src/mod/child/child_infant.erl", 28).

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

-file("src/mod/child/child_infant.erl", 29).

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

-file("src/mod/child/child_infant.erl", 30).

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

-file("src/mod/child/child_infant.erl", 31).

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

-file("src/mod/child/child_infant.erl", 32).

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

-file("src/mod/child/child_infant.erl", 33).

gm_set_init(Role = #role{m_child =
                             #m_child{kids = Kids}}) ->
    case lists:keyfind(2, #child.stage, Kids) of
        Child = #child{study_plan = StudyPlan} ->
            NewChild = Child#child{study_plan =
                                       StudyPlan#child_study_plan{is_init = 0}},
            child:update(NewChild),
            NewRole = child:update_kids(Role, NewChild),
            {ok, NewRole};
        _ -> ok
    end.

choose_classes(Role = #role{id = RoleId,
                            m_child = #m_child{kids = Kids}},
               ChildId, Classes) ->
    case lists:keyfind(ChildId, #child.id, Kids) of
        Child = #child{embryo = 1} ->
            case check_choose_classes(Child, Classes) of
                {false, Reason} -> {false, Reason};
                {true, #child_base{id = BaseId, name = Name}} ->
                    NewChild = Child#child{base_id = BaseId,
                                           classes = Classes, name = Name},
                    child:update(NewChild),
                    child_util:family_update(NewChild),
                    NewRole = child:update_kids(Role, NewChild),
                    log:child(NewRole, "选职业", Child, NewChild),
                    choose_mail(NewChild),
                    {ok, NewRole, {BaseId, Classes}}
            end;
        Child = #child{} ->
            case check_choose_classes(Child, Classes) of
                {true, _} ->
                    case child:apply(sync,
                                     {child_infant,
                                      sync_choose_classes,
                                      [RoleId, ChildId, Classes]})
                        of
                        {true, {BaseId1, Classes1}} ->
                            NewChild = case child:fetch(ChildId) of
                                           [Child1 = #child{} | _] -> Child1;
                                           _ -> false
                                       end,
                            NewRole = child:update_kids(Role, NewChild),
                            {ok, NewRole, {BaseId1, Classes1}};
                        {false, Reason} -> {false, Reason};
                        _ -> {false, lang:get("系统繁忙，请稍后操作")}
                    end;
                {false, Reason} -> {false, Reason}
            end;
        _ -> {false, lang:get("找不到指定孩子")}
    end.

choose_mail(#child{custody = Custody,
                   classes = Classes}) ->
    Title = lang:get("宝贝职业选择"),
    Content =
        notice:format(lang:get("风云雷动，祥瑞天降，从今天开始，您的孩子就是一名小~ts，ta将追随您的脚步，一道闯荡大陆"
                               "，终有一天必将名扬天下{face_1,38}"),
                      [{string_2, 1, format:classes_name(Classes)}]),
    case Custody of
        {Id1, Id2} ->
            mail:send(Id1,
                      #{title => Title, content => Content, items => []}),
            mail:send(Id2,
                      #{title => Title, content => Content, items => []}),
            ok;
        {Id, P, Z} ->
            mail:send({Id, P, Z},
                      #{title => Title, content => Content, items => []}),
            ok;
        _ -> ok
    end.

sync_choose_classes(RoleId, ChildId, Classes) ->
    Reply = case child:fetch(ChildId) of
                [Child = #child{} | _] ->
                    case check_choose_classes(Child, Classes) of
                        {true, #child_base{id = BaseId, name = Name}} ->
                            NewChild = Child#child{base_id = BaseId,
                                                   classes = Classes,
                                                   name = Name},
                            child:update(NewChild),
                            child_util:family_update(NewChild),
                            log:child(RoleId, Child, "选职业", Child, NewChild),
                            child_util:notice_code(RoleId,
                                                   NewChild,
                                                   18621,
                                                   {1,
                                                    "",
                                                    ChildId,
                                                    BaseId,
                                                    Classes}),
                            child_util:notice_update(RoleId, NewChild),
                            choose_mail(NewChild),
                            {true, {BaseId, Classes}};
                        {false, Reason} -> {false, Reason}
                    end;
                _ -> {false, lang:get("找不到指定孩子")}
            end,
    {ok, Reply}.

check_choose_classes(#child{classes = Classes}, _)
    when Classes =/= 0 ->
    {false, lang:get("已有职业无法再次选择")};
check_choose_classes(#child{stage = 2,
                            classes_type = ClassesType, sex = Sex},
                     Classes) ->
    List = case ClassesType of
               1 -> [1, 3];
               2 -> [2, 6];
               3 -> [4, 5]
           end,
    case lists:member(Classes, List) of
        false -> {false, lang:get("当前职业类型无法选择此职业")};
        true ->
            BaseId = child_data:get_base_id({Classes, Sex}),
            case child_data:get_base(BaseId) of
                Base = #child_base{} -> {true, Base};
                _ -> {false, lang:get("无法选择该职业")}
            end
    end;
check_choose_classes(_, _) ->
    {false, lang:get("只有幼儿期才可以选择职业")}.

set_plan(Role = #role{id = RoleId,
                      m_child = #m_child{kids = Kids}},
         ChildId,
         {StrEasy,
          ConEasy,
          AgiEasy,
          MagEasy,
          EndEasy,
          StrHard,
          ConHard,
          AgiHard,
          MagHard,
          EndHard}) ->
    case lists:keyfind(ChildId, #child.id, Kids) of
        Child = #child{embryo = 1} ->
            case check_set_plan(Child,
                                {StrEasy,
                                 ConEasy,
                                 AgiEasy,
                                 MagEasy,
                                 EndEasy,
                                 StrHard,
                                 ConHard,
                                 AgiHard,
                                 MagHard,
                                 EndHard})
                of
                {true, NewChild} ->
                    child:update(NewChild),
                    NewRole = child:update_kids(Role, NewChild),
                    child_util:push(NewRole, 18608, NewChild),
                    {ok, NewRole};
                {false, Reason} -> {false, Reason}
            end;
        Child = #child{} ->
            case check_set_plan(Child,
                                {StrEasy,
                                 ConEasy,
                                 AgiEasy,
                                 MagEasy,
                                 EndEasy,
                                 StrHard,
                                 ConHard,
                                 AgiHard,
                                 MagHard,
                                 EndHard})
                of
                {true, _} ->
                    case child:apply(sync,
                                     {child_infant,
                                      sync_set_plan,
                                      [RoleId,
                                       ChildId,
                                       {StrEasy,
                                        ConEasy,
                                        AgiEasy,
                                        MagEasy,
                                        EndEasy,
                                        StrHard,
                                        ConHard,
                                        AgiHard,
                                        MagHard,
                                        EndHard}]})
                        of
                        true ->
                            NewChild = case child:fetch(ChildId) of
                                           [Child1 = #child{} | _] -> Child1;
                                           _ -> false
                                       end,
                            NewRole = child:update_kids(Role, NewChild),
                            child_util:push(NewRole, 18608, NewChild),
                            {ok, NewRole};
                        {false, Reason} -> {false, Reason};
                        _Err ->
                            logger:error("同步修改计划时出错:~w",
                                         [_Err],
                                         child_infant,
                                         181),
                            {ok, Role}
                    end;
                {false, Reason} -> {false, Reason}
            end;
        _ -> {false, lang:get("找不到孩子")}
    end.

check_set_plan(#child{study_plan =
                          #child_study_plan{is_init = 0}},
               _) ->
    {false, lang:get("当前孩子不能设置计划")};
check_set_plan(Child = #child{study_plan = StudyPlan,
                              stage = 2},
               {StrEasy,
                ConEasy,
                AgiEasy,
                MagEasy,
                EndEasy,
                StrHard,
                ConHard,
                AgiHard,
                MagHard,
                EndHard}) ->
    Easy = StrEasy + ConEasy + AgiEasy + MagEasy + EndEasy,
    Hard = StrHard + ConHard + AgiHard + MagHard + EndHard,
    case Easy + Hard =:= 100 of
        true ->
            case Hard =< Easy * 3 of
                true ->
                    NewStudyPlan =
                        StudyPlan#child_study_plan{study_str_plan_easy =
                                                       StrEasy,
                                                   study_con_plan_easy =
                                                       ConEasy,
                                                   study_mag_plan_easy =
                                                       MagEasy,
                                                   study_agi_plan_easy =
                                                       AgiEasy,
                                                   study_end_plan_easy =
                                                       EndEasy,
                                                   study_str_plan_hard =
                                                       StrHard,
                                                   study_con_plan_hard =
                                                       ConHard,
                                                   study_mag_plan_hard =
                                                       MagHard,
                                                   study_agi_plan_hard =
                                                       AgiHard,
                                                   study_end_plan_hard =
                                                       EndHard},
                    {true, Child#child{study_plan = NewStudyPlan}};
                false -> {false, lang:get("高级课程数量不能大于基础课程的3倍")}
            end;
        false -> {false, lang:get("课程总数等于100时才能保存")}
    end;
check_set_plan(_, _) ->
    {false, lang:get("幼儿期的孩子才可以设置计划")}.

sync_set_plan(RoleId, ChildId,
              {StrEasy,
               ConEasy,
               AgiEasy,
               MagEasy,
               EndEasy,
               StrHard,
               ConHard,
               AgiHard,
               MagHard,
               EndHard}) ->
    Reply = case child:fetch(ChildId) of
                [Child = #child{}] ->
                    case check_set_plan(Child,
                                        {StrEasy,
                                         ConEasy,
                                         AgiEasy,
                                         MagEasy,
                                         EndEasy,
                                         StrHard,
                                         ConHard,
                                         AgiHard,
                                         MagHard,
                                         EndHard})
                        of
                        {true, NewChild} ->
                            child:update(NewChild),
                            child_util:notice_code(RoleId,
                                                   NewChild,
                                                   18608,
                                                   {[NewChild]}),
                            child_util:notice_update(RoleId, NewChild),
                            true;
                        {false, Reason} -> {false, Reason}
                    end;
                _ -> {false, lang:get("找不到孩子")}
            end,
    {ok, Reply}.

reset_study(Role = #role{id = RoleId,
                         m_child = #m_child{kids = Kids}},
            ChildId) ->
    case lists:keyfind(ChildId, #child.id, Kids) of
        Child = #child{embryo = 1} ->
            case check_reset_study(RoleId, Child) of
                {true, NewChild} ->
                    child:update(NewChild),
                    NewRole = child:update_kids(Role, NewChild),
                    child_util:push(NewRole, 18608, NewChild),
                    log:child(NewRole, "重置课程", Child, NewChild),
                    {ok, NewRole};
                {false, Reason} -> {false, Reason}
            end;
        _Child = #child{} ->
            case child:apply(sync,
                             {child_infant,
                              sync_reset_study,
                              [RoleId, ChildId]})
                of
                true ->
                    NewChild = case child:fetch(ChildId) of
                                   [Child1 = #child{} | _] -> Child1;
                                   _ -> false
                               end,
                    NewRole = child:update_kids(Role, NewChild),
                    child_util:push(NewRole, 18608, NewChild),
                    {ok, NewRole};
                {false, Reason} -> {false, Reason};
                _Err ->
                    logger:error("同步重置课程出错:~w", [_Err], child_infant, 264),
                    {ok, Role}
            end;
        _ -> {false, lang:get("找不到孩子")}
    end.

check_reset_study(RoleId,
                  Child = #child{stage = 2, study_easy = StudyEasy,
                                 study_hard = StudyHard, study_plan = StudyPlan,
                                 child_attr = ChildAttr,
                                 free_study = OldFreeStudy})
    when StudyEasy + StudyHard > 0 ->
    _DayEasy = 0,
    _DayHard = 0,
    _StudyEasyTime = 0,
    _StudyHardTime = 0,
    NewStudyEasy = 0,
    NewStudyHard = 0,
    Maturity = 0,
    NewStudyPlan = StudyPlan#child_study_plan{study_str_easy
                                                  = 0,
                                              study_con_easy = 0,
                                              study_mag_easy = 0,
                                              study_agi_easy = 0,
                                              study_end_easy = 0,
                                              study_str_hard = 0,
                                              study_con_hard = 0,
                                              study_mag_hard = 0,
                                              study_agi_hard = 0,
                                              study_end_hard = 0, is_init = 1},
    NewChildAttr = ChildAttr#child_attr{study_str = 0,
                                        study_con = 0, study_mag = 0,
                                        study_agi = 0, study_end = 0},
    FreeStudy = StudyEasy + OldFreeStudy,
    send_reset_mail(RoleId, StudyPlan, StudyHard),
    NewChild = Child#child{study_easy = NewStudyEasy,
                           study_hard = NewStudyHard, study_plan = NewStudyPlan,
                           free_study = FreeStudy, child_attr = NewChildAttr,
                           maturity = Maturity},
    {true, NewChild};
check_reset_study(_, _) ->
    {false, lang:get("当前没用可重置的课程数")}.

send_reset_mail(RoleId, #child_study_plan{is_init = 0},
                StudyHard) ->
    NewStudyHard = util:ceil(StudyHard / 2),
    case NewStudyHard > 0 of
        true ->
            Item = [{23823, 0},
                    {23821, 0},
                    {23820, 0},
                    {23822, 0},
                    {23819, 0}],
            Item1 = do_calc_reset_mail(Item, NewStudyHard),
            Item2 = [{BaseId, Num}
                     || {BaseId, Num} <- Item1, Num > 0],
            case Item2 of
                [_ | _] ->
                    Title = lang:get("子女重置返还"),
                    Content = lang:get("子女重置学习课程，返还50%高级课程道具"),
                    mail:send(RoleId,
                              #{title => Title, content => Content,
                                items => Item2}),
                    ok;
                _ -> ok
            end;
        _ -> ok
    end;
send_reset_mail(RoleId,
                #child_study_plan{study_str_hard = StrHard,
                                  study_con_hard = ConHard,
                                  study_mag_hard = MagHard,
                                  study_agi_hard = AgiHard,
                                  study_end_hard = EndHard},
                _StudyHard) ->
    Item1 = case StrHard > 0 of
                true -> [{23823, util:ceil(StrHard / 2)}];
                _ -> []
            end,
    Item2 = case ConHard > 0 of
                true -> [{23821, util:ceil(ConHard / 2)}];
                _ -> []
            end,
    Item3 = case MagHard > 0 of
                true -> [{23820, util:ceil(MagHard / 2)}];
                _ -> []
            end,
    Item4 = case AgiHard > 0 of
                true -> [{23822, util:ceil(AgiHard / 2)}];
                _ -> []
            end,
    Item5 = case EndHard > 0 of
                true -> [{23819, util:ceil(EndHard / 2)}];
                _ -> []
            end,
    Item = Item1 ++ Item2 ++ Item3 ++ Item4 ++ Item5,
    case Item of
        [_ | _] ->
            Title = lang:get("子女重置返还"),
            Content = lang:get("子女重置学习课程，返还50%高级课程道具"),
            mail:send(RoleId,
                      #{title => Title, content => Content, items => Item}),
            ok;
        _ -> ok
    end.

do_calc_reset_mail(Item, StudyHard)
    when StudyHard =< 0 ->
    Item;
do_calc_reset_mail([{BaseId, Num} | T], StudyHard) ->
    do_calc_reset_mail(T ++ [{BaseId, Num + 1}],
                       StudyHard - 1).

sync_reset_study(RoleId, ChildId) ->
    Reply = case child:fetch(ChildId) of
                [Child = #child{}] ->
                    case check_reset_study(RoleId, Child) of
                        {true, NewChild} ->
                            child:update(NewChild),
                            child_util:notice_code(RoleId,
                                                   NewChild,
                                                   18608,
                                                   {[NewChild]}),
                            child_util:notice_update(RoleId, NewChild),
                            log:child(RoleId, Child, "重置课程", Child, NewChild),
                            true;
                        {false, Reason} -> {false, Reason}
                    end;
                _ -> {false, lang:get("找不到孩子")}
            end,
    {ok, Reply}.

switch_classes_type(Role = #role{id = RoleId,
                                 m_child = #m_child{kids = Kids}},
                    ChildId, ClassesType) ->
    case lists:keyfind(ChildId, #child.id, Kids) of
        Child = #child{embryo = 1} ->
            case check_switch(Child, ClassesType) of
                {true, Loss, NewChild, Msg} ->
                    case role_gain:do_notice(Loss, Role) of
                        {ok, NewRole} ->
                            child:update(NewChild),
                            NewRole1 = child:update_kids(NewRole, NewChild),
                            log:child(NewRole1, "切换职业类型", Child, NewChild),
                            {ok, NewRole1, Msg};
                        {false, #loss{msg = Msg1}} -> {false, Msg1}
                    end;
                {false, Reason} -> {false, Reason}
            end;
        Child = #child{} ->
            case check_switch(Child, ClassesType) of
                {true, Loss, _, _} ->
                    case role_gain:do_notice(Loss, Role) of
                        {ok, NewRole} ->
                            case child:apply(sync,
                                             {child_infant,
                                              sync_switch_classes_type,
                                              [RoleId, ChildId, ClassesType]})
                                of
                                {true, Msg} ->
                                    NewChild = case child:fetch(ChildId) of
                                                   [Child1 = #child{} | _] ->
                                                       Child1;
                                                   _ -> false
                                               end,
                                    NewRole1 = child:update_kids(NewRole,
                                                                 NewChild),
                                    {ok, NewRole1, Msg};
                                {false, Reason} -> {false, Reason};
                                _Err ->
                                    logger:error("同步切换职业类型时出错:~w",
                                                 [_Err],
                                                 child_infant,
                                                 408),
                                    {ok, NewRole}
                            end;
                        {false, #loss{msg = Msg}} -> {false, Msg}
                    end;
                {false, Reason} -> {false, Reason}
            end;
        _ -> {false, lang:get("找不到孩子")}
    end.

check_switch(#child{classes_type = ClassesType},
             ClassesType) ->
    {false, lang:get("相同类型，无需切换")};
check_switch(#child{classes = Classes}, _)
    when Classes =/= 0 ->
    {false, lang:get("已有职业无法切换职业类型")};
check_switch(Child = #child{name = ChildName},
             ClassesType) ->
    NewChild = Child#child{classes_type = ClassesType},
    Msg = case ClassesType of
              1 ->
                  notice:format(lang:get("~ts成功转换为物攻类型，可选择~ts或~ts职业作为发展方向"),
                                [{string_2, 1, ChildName},
                                 {string_2, 1, lang:get("狂剑")},
                                 {string_2, 1, lang:get("战弓")}]);
              2 ->
                  notice:format(lang:get("~ts成功转换为魔攻类型，可选择~ts或~ts职业作为发展方向"),
                                [{string_2, 1, ChildName},
                                 {string_2, 1, lang:get("魔导")},
                                 {string_2, 1, lang:get("月魂")}]);
              _ ->
                  notice:format(lang:get("~ts成功转换为辅助类型，可选择~ts或~ts职业作为发展方向"),
                                [{string_2, 1, ChildName},
                                 {string_2, 1, lang:get("秘言")},
                                 {string_2, 1, lang:get("兽灵")}])
          end,
    {true,
     format:val_to_loss([{90003, 50000}]),
     NewChild,
     Msg};
check_switch(_, _) -> {false, lang:get("无法切换")}.

sync_switch_classes_type(RoleId, ChildId,
                         ClassesType) ->
    Reply = case child:fetch(ChildId) of
                [Child = #child{}] ->
                    case check_switch(Child, ClassesType) of
                        {true, _, NewChild, Msg} ->
                            child:update(NewChild),
                            log:child(RoleId, Child, "切换职业类型", Child, NewChild),
                            child_util:notice_code(RoleId,
                                                   NewChild,
                                                   18622,
                                                   {1,
                                                    "",
                                                    ChildId,
                                                    ClassesType}),
                            child_util:notice_code(RoleId,
                                                   NewChild,
                                                   9902,
                                                   {3, Msg, []}),
                            child_util:notice_update(RoleId, NewChild),
                            {true, Msg};
                        {false, Reason} -> {false, Reason}
                    end;
                _ -> {false, lang:get("找不到孩子")}
            end,
    {ok, Reply}.

gm_study(Role = #role{m_child =
                          #m_child{kids = Kids}}) ->
    case [Child || Child = #child{stage = 2} <- Kids] of
        [Child = #child{embryo = 1} | _] ->
            case add_maturity(Child, 100) of
                {true, Child1} ->
                    Child2 = add_study(Child1, 1, 100),
                    Child3 = add_study(Child2, 2, 100),
                    Child4 = add_study(Child3, 3, 100),
                    Child5 = add_study(Child4, 4, 100),
                    Child6 = add_study(Child5, 5, 25),
                    NewChild = Child6,
                    {Flag, NewChild1} = child_util:stage_update(Child,
                                                                NewChild),
                    child:update(NewChild1),
                    NewRole1 = child:update_kids(Role, NewChild1),
                    update_flag(NewRole1, Flag, NewChild),
                    {ok, NewRole1};
                {false, Reason} -> {false, Reason}
            end;
        [Child = #child{} | _] ->
            case add_maturity(Child, 100) of
                {true, Child1} ->
                    Child2 = add_study(Child1, 1, 100),
                    Child3 = add_study(Child2, 2, 100),
                    Child4 = add_study(Child3, 3, 100),
                    Child5 = add_study(Child4, 4, 100),
                    Child6 = add_study(Child5, 5, 25),
                    NewChild = Child6,
                    {Flag, NewChild1} = child_util:stage_update(Child,
                                                                NewChild),
                    child:update(NewChild1),
                    NewRole1 = child:update_kids(Role, NewChild1),
                    update_flag(NewRole1, Flag, NewChild),
                    {ok, NewRole1};
                {false, Reason} -> {false, Reason}
            end;
        _ -> {false, lang:get("没有可以成长的孩子")}
    end.

study(Role = #role{id = RoleId,
                   m_child = #m_child{kids = Kids}},
      ChildId, StudyType, StudyMode) ->
    case lists:keyfind(ChildId, #child.id, Kids) of
        Child = #child{embryo = 1} ->
            case check_study(Child, StudyType, StudyMode, RoleId) of
                {true,
                 Loss,
                 NewChild = #child{child_attr =
                                       #child_attr{study_str = StudyStr,
                                                   study_con = StudyCon,
                                                   study_mag = StudyMag,
                                                   study_agi = StudyAgi,
                                                   study_end = StudyEnd}},
                 ReturnMsg} ->
                    case role_gain:do_notice(Loss, Role) of
                        {ok, NewRole} ->
                            {Flag, NewChild1} = child_util:stage_update(Child,
                                                                        NewChild),
                            child:update(NewChild1),
                            NewRole1 = child:update_kids(NewRole, NewChild1),
                            update_flag(NewRole1, Flag, NewChild),
                            Evt = case Flag of
                                      {true, 3} ->
                                          child_util:push(NewRole1,
                                                          18603,
                                                          NewChild1),
                                          [#evt_child_grow{stage = 3},
                                           #evt_child_study{study_str =
                                                                StudyStr,
                                                            study_con =
                                                                StudyCon,
                                                            study_mag =
                                                                StudyMag,
                                                            study_agi =
                                                                StudyAgi,
                                                            study_end =
                                                                StudyEnd}];
                                      _ ->
                                          [#evt_child_study{study_str =
                                                                StudyStr,
                                                            study_con =
                                                                StudyCon,
                                                            study_mag =
                                                                StudyMag,
                                                            study_agi =
                                                                StudyAgi,
                                                            study_end =
                                                                StudyEnd}]
                                  end,
                            NewRole2 = role_trigger:fire(Evt, NewRole1),
                            log:child(NewRole2, "学习课程", Child, NewChild1),
                            notice:send(NewRole2, 3, ReturnMsg),
                            {ok, child_util:evt_child(NewRole2, NewChild1)};
                        {false, #loss{label = energy, val = LossVal}} ->
                            {false,
                             util:flist(lang:get("活力不足~w，无法学习课程"), [LossVal])};
                        {false, #loss{msg = Msg}} -> {false, Msg}
                    end;
                {false, Reason} -> {false, Reason}
            end;
        Child = #child{} ->
            case check_study(Child, StudyType, StudyMode, RoleId) of
                {true, Loss, _, _} ->
                    case role_gain:do_notice(Loss, Role) of
                        {ok, NewRole} ->
                            case child:apply(sync,
                                             {child_infant,
                                              sync_study,
                                              [RoleId,
                                               ChildId,
                                               StudyType,
                                               StudyMode]})
                                of
                                {true, Flag, ReturnMsg} ->
                                    NewChild = case child:fetch(ChildId) of
                                                   [Child1 = #child{} | _] ->
                                                       Child1;
                                                   _ -> false
                                               end,
                                    NewRole1 = child:update_kids(NewRole,
                                                                 NewChild),
                                    update_flag(NewRole1, Flag, NewChild),
                                    Evt1 = case Flag of
                                               {true, 3} ->
                                                   child_util:push(NewRole1,
                                                                   18603,
                                                                   NewChild),
                                                   [#evt_child_grow{stage = 3}];
                                               _ -> []
                                           end,
                                    NewRole2 = case NewChild of
                                                   #child{child_attr =
                                                              #child_attr{study_str
                                                                              =
                                                                              StudyStr,
                                                                          study_con
                                                                              =
                                                                              StudyCon,
                                                                          study_mag
                                                                              =
                                                                              StudyMag,
                                                                          study_agi
                                                                              =
                                                                              StudyAgi,
                                                                          study_end
                                                                              =
                                                                              StudyEnd}} ->
                                                       Evt =
                                                           [#evt_child_study{study_str
                                                                                 =
                                                                                 StudyStr,
                                                                             study_con
                                                                                 =
                                                                                 StudyCon,
                                                                             study_mag
                                                                                 =
                                                                                 StudyMag,
                                                                             study_agi
                                                                                 =
                                                                                 StudyAgi,
                                                                             study_end
                                                                                 =
                                                                                 StudyEnd}
                                                            | Evt1],
                                                       role_trigger:fire(Evt,
                                                                         NewRole1);
                                                   _ -> NewRole1
                                               end,
                                    notice:send(NewRole2, 3, ReturnMsg),
                                    {ok,
                                     child_util:evt_child(NewRole2, NewChild)};
                                {false, Reason} -> {false, Reason};
                                _Err ->
                                    logger:error("同步学习课程时出错:~w",
                                                 [_Err],
                                                 child_infant,
                                                 573),
                                    {ok, NewRole}
                            end;
                        {false, #loss{label = energy, val = LossVal}} ->
                            {false,
                             util:flist(lang:get("活力不足~w，无法学习课程"), [LossVal])};
                        {false, #loss{msg = Msg}} -> {false, Msg}
                    end;
                {false, Reason} -> {false, Reason}
            end;
        _ -> {false, lang:get("找不到孩子")}
    end.

sync_study(RoleId, ChildId, StudyType, StudyMode) ->
    Reply = case child:fetch(ChildId) of
                [Child = #child{} | _] ->
                    case check_study(Child, StudyType, StudyMode, RoleId) of
                        {true, _, NewChild, ReturnMsg} ->
                            {Flag, NewChild1} = child_util:stage_update(Child,
                                                                        NewChild),
                            child:update(NewChild1),
                            log:child(RoleId, Child, "学习课程", Child, NewChild1),
                            case update_data(Flag, NewChild1) of
                                {18610, Data} ->
                                    child_util:notice_code(RoleId,
                                                           NewChild1,
                                                           18610,
                                                           Data),
                                    child_util:notice_code(RoleId,
                                                           NewChild1,
                                                           18603,
                                                           {[NewChild1]}),
                                    child_util:notice_update(RoleId, NewChild1),
                                    ok;
                                {18608, _} ->
                                    child_util:notice_code(RoleId,
                                                           NewChild1,
                                                           18608,
                                                           {[NewChild1]}),
                                    child_util:notice_update(RoleId, NewChild1),
                                    ok;
                                _ -> ok
                            end,
                            {true, Flag, ReturnMsg};
                        {false, Reason} -> {false, Reason}
                    end;
                _ -> {false, lang:get("找不到孩子")}
            end,
    {ok, Reply}.

grow_to_toddler(Role = #role{m_child =
                                 #m_child{kids = Kids}},
                ChildId) ->
    case lists:keyfind(ChildId, #child.id, Kids) of
        #child{stage = Stage} when Stage =/= 2 ->
            {false, lang:get("孩子不是幼儿期啊")};
        Child = #child{maturity = Maturity} ->
            case child_data:get_stage(2) of
                #{max_maturity := Max} when Maturity >= Max ->
                    do_grow_to_toddler(Role, Child);
                _ -> {false, lang:get("这孩子还需要继续学习学习")}
            end;
        _ -> {false, lang:get("找不到孩子")}
    end.

do_grow_to_toddler(Role, Child = #child{embryo = 1}) ->
    NewChild = Child#child{stage = 3},
    {Flag, NewChild1} = child_util:stage_update(Child,
                                                NewChild),
    child:update(NewChild1),
    NewRole1 = child:update_kids(Role, NewChild1),
    update_flag(NewRole1, Flag, NewChild1),
    mail_grow_toddler(NewChild1),
    Evt = case Flag of
              {true, 3} ->
                  child_util:push(NewRole1, 18603, NewChild1),
                  [#evt_child_grow{stage = 3}];
              _ -> []
          end,
    NewRole2 = role_trigger:fire(Evt, NewRole1),
    child_util:family_update(NewChild1),
    log:child(NewRole2, "进入成长期", Child, NewChild1),
    {ok, child_util:evt_child(NewRole2, NewChild1)};
do_grow_to_toddler(Role = #role{id = RoleId},
                   #child{id = ChildId}) ->
    case child:apply(sync,
                     {child_infant, sync_grow_to_toddler, [RoleId, ChildId]})
        of
        {true, Flag} ->
            NewChild = case child:fetch(ChildId) of
                           [Child1 = #child{} | _] -> Child1;
                           _ -> false
                       end,
            NewRole1 = child:update_kids(Role, NewChild),
            update_flag(NewRole1, Flag, NewChild),
            Evt1 = case Flag of
                       {true, 3} ->
                           child_util:push(NewRole1, 18603, NewChild),
                           [#evt_child_grow{stage = 3}];
                       _ -> []
                   end,
            NewRole2 = case NewChild of
                           #child{child_attr =
                                      #child_attr{study_str = StudyStr,
                                                  study_con = StudyCon,
                                                  study_mag = StudyMag,
                                                  study_agi = StudyAgi,
                                                  study_end = StudyEnd}} ->
                               Evt = [#evt_child_study{study_str = StudyStr,
                                                       study_con = StudyCon,
                                                       study_mag = StudyMag,
                                                       study_agi = StudyAgi,
                                                       study_end = StudyEnd}
                                      | Evt1],
                               role_trigger:fire(Evt, NewRole1);
                           _ -> NewRole1
                       end,
            {ok, child_util:evt_child(NewRole2, NewChild)};
        {false, Reason} -> {false, Reason};
        _Err ->
            logger:error("同步进入成长期出错:~w", [_Err], child_infant, 682),
            {ok, Role}
    end.

sync_grow_to_toddler(RoleId, ChildId) ->
    Reply = case child:fetch(ChildId) of
                [#child{stage = Stage} | _] when Stage =/= 2 ->
                    {false, lang:get("孩子不是幼儿期呢")};
                [Child = #child{maturity = Maturity} | _] ->
                    case child_data:get_stage(2) of
                        #{max_maturity := Max} when Maturity >= Max ->
                            NewChild = Child#child{stage = 3},
                            {Flag, NewChild1} = child_util:stage_update(Child,
                                                                        NewChild),
                            child:update(NewChild1),
                            log:child(RoleId, Child, "进入成长期", Child, NewChild1),
                            case update_data(Flag, NewChild1) of
                                {18610, Data} ->
                                    child_util:notice_code(RoleId,
                                                           NewChild1,
                                                           18610,
                                                           Data),
                                    child_util:notice_code(RoleId,
                                                           NewChild1,
                                                           18603,
                                                           {[NewChild1]}),
                                    child_util:notice_update(RoleId, NewChild1),
                                    ok;
                                {18608, _} ->
                                    child_util:notice_code(RoleId,
                                                           NewChild1,
                                                           18608,
                                                           {[NewChild1]}),
                                    child_util:notice_update(RoleId, NewChild1),
                                    ok;
                                _ -> ok
                            end,
                            child_util:family_update(NewChild1),
                            mail_grow_toddler(NewChild1),
                            {true, Flag};
                        _ -> {false, lang:get("这孩子还需要继续学习学习啊")}
                    end;
                _ -> {false, lang:get("找不到孩子")}
            end,
    {ok, Reply}.

mail_grow_toddler(#child{custody = Custody,
                         child_attr =
                             #child_attr{hp_aptitude = Hp, phy_aptitude = Phy,
                                         pdef_aptitude = Pdef,
                                         magic_aptitude = Mag,
                                         aspd_aptitude = Aspd},
                         classes = Classes, growth_type = GrowthType,
                         name = Name, sex = Sex}) ->
    Title = lang:get("孩子进入成长期"),
    Fmt =
        lang:get("恭喜您的孩子~ts进入成长期，在您的悉心栽培下，~ts成为一名优秀的小~ts，这是孩子的成"
                 "绩单：\n物攻资质：~ts\n物防资质：~ts\n生命资质：~ts\n法力资质：~ts\n"
                 "速度资质：~ts\n孩子成长：~ts\n成长期的孩子即可跟随您征战天下，相信在您的养育下~"
                 "ts必定成为少年英雄{face_1,3}"),
    SexName = case Sex of
                  0 -> lang:get("她");
                  _ -> lang:get("他")
              end,
    Args = [{role_2, Name},
            {string_1, SexName},
            {string_2, 5, format:classes_name(Classes)},
            {string_2, 5, Phy},
            {string_2, 5, Pdef},
            {string_2, 5, Hp},
            {string_2, 5, Mag},
            {string_2, 5, Aspd},
            {string_2, GrowthType, notice:growth_name(GrowthType)},
            {string_1, SexName}],
    Content = notice:format(Fmt, Args),
    mail_grow_toddler(Custody, Title, Content);
mail_grow_toddler(_) -> ok.

mail_grow_toddler({Id1, Id2}, Title, Content) ->
    mail:send(Id1,
              #{title => Title, content => Content, items => []}),
    mail:send(Id2,
              #{title => Title, content => Content, items => []});
mail_grow_toddler(Id, Title, Content) ->
    mail:send(Id,
              #{title => Title, content => Content, items => []}).

update_flag(Role, Flag, Child) ->
    case update_data(Flag, Child) of
        {Code, Data} -> child_util:push(Role, Code, Data);
        _ -> ok
    end.

update_data({true, 3},
            _Child = #child{id = ChildId, base_id = BaseId,
                            classes = Classes, sex = Sex, growth = Growth,
                            child_attr = ChildAttr}) ->
    {18610,
     {ChildId, 3, BaseId, Classes, Sex, Growth, ChildAttr}};
update_data(_, Child = #child{}) -> {18608, Child};
update_data(_, _) -> false.

check_study(#child{classes = 0}, _, _, _) ->
    {false, lang:get("请先选择职业再来学习课程")};
check_study(#child{stage = Stage}, _, _, _)
    when Stage =/= 2 ->
    {false, lang:get("幼儿期才可以学习课程")};
check_study(Child = #child{name = ChildName,
                           parents = Parents, free_study = FreeStudy,
                           study_plan =
                               ChildStudyPlan = #child_study_plan{study_str_easy
                                                                      = StrEasy,
                                                                  study_con_easy
                                                                      = ConEasy,
                                                                  study_mag_easy
                                                                      = MagEasy,
                                                                  study_agi_easy
                                                                      = AgiEasy,
                                                                  study_end_easy
                                                                      = EndEasy,
                                                                  study_str_hard
                                                                      = StrHard,
                                                                  study_con_hard
                                                                      = ConHard,
                                                                  study_mag_hard
                                                                      = MagHard,
                                                                  study_agi_hard
                                                                      = AgiHard,
                                                                  study_end_hard
                                                                      =
                                                                      EndHard}},
            StudyType, StudyMode, RoleId) ->
    case check_add_study(Child, StudyType, StudyMode) of
        {false, Reason} -> {false, Reason};
        true ->
            case add_maturity(Child, 1) of
                {false, Reason} -> {false, Reason};
                {true,
                 Child1 = #child{study_easy = StudyEasy,
                                 study_hard = StudyHard, day_easy = DayEasy,
                                 day_hard = DayHard,
                                 study_easy_time = StudyEasyTime,
                                 study_hard_time = StudyHardTime}} ->
                    Now = date:unixtime(),
                    {CheckFlag, DayCount, LastTime, MaxCheck} = case
                                                                    StudyMode
                                                                    of
                                                                    1
                                                                        when
                                                                          FreeStudy
                                                                              >
                                                                              0 ->
                                                                        Count =
                                                                            case
                                                                                date:is_today(StudyEasyTime)
                                                                                of
                                                                                true ->
                                                                                    DayEasy;
                                                                                _ ->
                                                                                    0
                                                                            end,
                                                                        {free,
                                                                         Count,
                                                                         0,
                                                                         true};
                                                                    1 ->
                                                                        Count =
                                                                            case
                                                                                date:is_today(StudyEasyTime)
                                                                                of
                                                                                true ->
                                                                                    DayEasy;
                                                                                _ ->
                                                                                    0
                                                                            end,
                                                                        {easy,
                                                                         Count,
                                                                         StudyEasyTime,
                                                                         true};
                                                                    2 ->
                                                                        Count =
                                                                            case
                                                                                date:is_today(StudyHardTime)
                                                                                of
                                                                                true ->
                                                                                    DayHard;
                                                                                _ ->
                                                                                    0
                                                                            end,
                                                                        {hard,
                                                                         Count,
                                                                         StudyHardTime,
                                                                         StudyHard
                                                                             <
                                                                             StudyEasy
                                                                                 *
                                                                                 3}
                                                                end,
                    {NewStudyEasy,
                     NewStudyHard,
                     NewDayEasy,
                     NewDayHard,
                     NewStudyEasyTime,
                     NewStudyHardTime,
                     NewFreeStudy} =
                        case CheckFlag of
                            free ->
                                {StudyEasy + 1,
                                 StudyHard,
                                 DayCount,
                                 DayHard,
                                 StudyEasyTime,
                                 StudyHardTime,
                                 max(0, FreeStudy - 1)};
                            easy ->
                                {StudyEasy + 1,
                                 StudyHard,
                                 DayCount + 1,
                                 DayHard,
                                 Now,
                                 StudyHardTime,
                                 FreeStudy};
                            _ ->
                                {StudyEasy,
                                 StudyHard + 1,
                                 DayEasy,
                                 DayCount + 1,
                                 StudyEasyTime,
                                 Now,
                                 FreeStudy}
                        end,
                    case MaxCheck of
                        false ->
                            CheckMsg =
                                notice:format(lang:get("高级课程次数不足，请学习~ts获得更多次数{face_1,26}"),
                                              [{string_2,
                                                1,
                                                lang:get("基础课程")}]),
                            {false, CheckMsg};
                        true ->
                            case child_data:get_study({StudyType, StudyMode}) of
                                #{day_limit := DayLimit}
                                    when DayCount >= DayLimit andalso
                                             CheckFlag =/= free ->
                                    case StudyMode of
                                        1 ->
                                            EasyMsg =
                                                util:flist(lang:get("今天已经学习~w节基础课程，请学习高级课程"),
                                                           [DayLimit]),
                                            {false, EasyMsg};
                                        _ ->
                                            HardMsg =
                                                util:flist(lang:get("今天已经学习~w节高级课程"),
                                                           [DayLimit]),
                                            {false, HardMsg}
                                    end;
                                #{study_time := NeedTime}
                                    when LastTime + NeedTime > Now ->
                                    {false, lang:get("学习冷却时间未到")};
                                #{name := StudyName, val := Val,
                                  study_loss := StudyLoss} ->
                                    AddIntimacy = case StudyMode of
                                                      2 -> 5;
                                                      _ -> 2
                                                  end,
                                    NewStudyLoss = case CheckFlag of
                                                       free -> [];
                                                       _ -> StudyLoss
                                                   end,
                                    NewParents = case lists:keyfind(RoleId,
                                                                    #child_parent.id,
                                                                    Parents)
                                                     of
                                                     P = #child_parent{intimacy
                                                                           =
                                                                           Intimacy} ->
                                                         lists:keyreplace(RoleId,
                                                                          #child_parent.id,
                                                                          Parents,
                                                                          P#child_parent{intimacy
                                                                                             =
                                                                                             Intimacy
                                                                                                 +
                                                                                                 AddIntimacy});
                                                     _ -> Parents
                                                 end,
                                    NewChildStudyPlan = case {StudyType,
                                                              StudyMode}
                                                            of
                                                            {1, 1} ->
                                                                ChildStudyPlan#child_study_plan{study_str_easy
                                                                                                    =
                                                                                                    StrEasy
                                                                                                        +
                                                                                                        1};
                                                            {1, 2} ->
                                                                ChildStudyPlan#child_study_plan{study_str_hard
                                                                                                    =
                                                                                                    StrHard
                                                                                                        +
                                                                                                        1};
                                                            {2, 1} ->
                                                                ChildStudyPlan#child_study_plan{study_con_easy
                                                                                                    =
                                                                                                    ConEasy
                                                                                                        +
                                                                                                        1};
                                                            {2, 2} ->
                                                                ChildStudyPlan#child_study_plan{study_con_hard
                                                                                                    =
                                                                                                    ConHard
                                                                                                        +
                                                                                                        1};
                                                            {3, 1} ->
                                                                ChildStudyPlan#child_study_plan{study_agi_easy
                                                                                                    =
                                                                                                    AgiEasy
                                                                                                        +
                                                                                                        1};
                                                            {3, 2} ->
                                                                ChildStudyPlan#child_study_plan{study_agi_hard
                                                                                                    =
                                                                                                    AgiHard
                                                                                                        +
                                                                                                        1};
                                                            {4, 1} ->
                                                                ChildStudyPlan#child_study_plan{study_mag_easy
                                                                                                    =
                                                                                                    MagEasy
                                                                                                        +
                                                                                                        1};
                                                            {4, 2} ->
                                                                ChildStudyPlan#child_study_plan{study_mag_hard
                                                                                                    =
                                                                                                    MagHard
                                                                                                        +
                                                                                                        1};
                                                            {5, 1} ->
                                                                ChildStudyPlan#child_study_plan{study_end_easy
                                                                                                    =
                                                                                                    EndEasy
                                                                                                        +
                                                                                                        1};
                                                            {5, 2} ->
                                                                ChildStudyPlan#child_study_plan{study_end_hard
                                                                                                    =
                                                                                                    EndHard
                                                                                                        +
                                                                                                        1}
                                                        end,
                                    Child2 = Child1#child{study_easy =
                                                              NewStudyEasy,
                                                          study_hard =
                                                              NewStudyHard,
                                                          day_easy = NewDayEasy,
                                                          day_hard = NewDayHard,
                                                          study_easy_time =
                                                              NewStudyEasyTime,
                                                          study_hard_time =
                                                              NewStudyHardTime,
                                                          parents = NewParents,
                                                          study_plan =
                                                              NewChildStudyPlan,
                                                          free_study =
                                                              NewFreeStudy},
                                    Child3 = add_study(Child2, StudyType, Val),
                                    Msg =
                                        notice:format(lang:get("~ts学习了~ts，~ts提升了~ts点"),
                                                      [{string_2, 5, ChildName},
                                                       {string_2, 1, StudyName},
                                                       {string_2,
                                                        1,
                                                        study_type(StudyType)},
                                                       {string_2, 1, Val}]),
                                    {true,
                                     format:val_to_loss(NewStudyLoss,
                                                        #{item_base_id_auto_buy
                                                              => 1,
                                                          auto_scene =>
                                                              lang:get("孩子学习天赋技能")}),
                                     Child3,
                                     Msg};
                                _ -> {false, lang:get("不存在的课程")}
                            end
                    end
            end
    end.

study_type(1) -> lang:get("力量");
study_type(2) -> lang:get("体质");
study_type(4) -> lang:get("智慧");
study_type(3) -> lang:get("敏捷");
study_type(5) -> lang:get("品德").

check_add_study(#child{child_attr =
                           #child_attr{study_str = StudyStr}},
                1, _)
    when StudyStr >= 100 ->
    {false, lang:get("该课程已经学习到上限，请选择其他课程")};
check_add_study(#child{child_attr =
                           #child_attr{study_con = StudyCon}},
                2, _)
    when StudyCon >= 100 ->
    {false, lang:get("该课程已经学习到上限，请选择其他课程")};
check_add_study(#child{child_attr =
                           #child_attr{study_mag = StudyMag}},
                4, _)
    when StudyMag >= 100 ->
    {false, lang:get("该课程已经学习到上限，请选择其他课程")};
check_add_study(#child{child_attr =
                           #child_attr{study_agi = StudyAgi}},
                3, _)
    when StudyAgi >= 100 ->
    {false, lang:get("该课程已经学习到上限，请选择其他课程")};
check_add_study(#child{child_attr =
                           #child_attr{study_end = StudyEnd}},
                5, _)
    when StudyEnd >= 100 ->
    {false, lang:get("该课程已经学习到上限，请选择其他课程")};
check_add_study(#child{study_plan =
                           #child_study_plan{is_init = 1,
                                             study_str_easy = StrEasy1,
                                             study_str_plan_easy = StrEasy2}},
                1, 1)
    when StrEasy1 >= StrEasy2 ->
    {false, lang:get("已学课程大于计划课程，请先更改计划再来学习")};
check_add_study(#child{study_plan =
                           #child_study_plan{is_init = 1,
                                             study_str_hard = StrHard1,
                                             study_str_plan_hard = StrHard2}},
                1, 2)
    when StrHard1 >= StrHard2 ->
    {false, lang:get("已学课程大于计划课程，请先更改计划再来学习")};
check_add_study(#child{study_plan =
                           #child_study_plan{is_init = 1,
                                             study_con_easy = ConEasy1,
                                             study_con_plan_easy = ConEasy2}},
                2, 1)
    when ConEasy1 >= ConEasy2 ->
    {false, lang:get("已学课程大于计划课程，请先更改计划再来学习")};
check_add_study(#child{study_plan =
                           #child_study_plan{is_init = 1,
                                             study_con_hard = ConHard1,
                                             study_con_plan_hard = ConHard2}},
                2, 2)
    when ConHard1 >= ConHard2 ->
    {false, lang:get("已学课程大于计划课程，请先更改计划再来学习")};
check_add_study(#child{study_plan =
                           #child_study_plan{is_init = 1,
                                             study_mag_easy = MagEasy1,
                                             study_mag_plan_easy = MagEasy2}},
                4, 1)
    when MagEasy1 >= MagEasy2 ->
    {false, lang:get("已学课程大于计划课程，请先更改计划再来学习")};
check_add_study(#child{study_plan =
                           #child_study_plan{is_init = 1,
                                             study_mag_hard = MagHard1,
                                             study_mag_plan_hard = MagHard2}},
                4, 2)
    when MagHard1 >= MagHard2 ->
    {false, lang:get("已学课程大于计划课程，请先更改计划再来学习")};
check_add_study(#child{study_plan =
                           #child_study_plan{is_init = 1,
                                             study_agi_easy = AgiEasy1,
                                             study_agi_plan_easy = AgiEasy2}},
                3, 1)
    when AgiEasy1 >= AgiEasy2 ->
    {false, lang:get("已学课程大于计划课程，请先更改计划再来学习")};
check_add_study(#child{study_plan =
                           #child_study_plan{is_init = 1,
                                             study_agi_hard = AgiHard1,
                                             study_agi_plan_hard = AgiHard2}},
                3, 2)
    when AgiHard1 >= AgiHard2 ->
    {false, lang:get("已学课程大于计划课程，请先更改计划再来学习")};
check_add_study(#child{study_plan =
                           #child_study_plan{is_init = 1,
                                             study_end_easy = EndEasy1,
                                             study_end_plan_easy = EndEasy2}},
                5, 1)
    when EndEasy1 >= EndEasy2 ->
    {false, lang:get("已学课程大于计划课程，请先更改计划再来学习")};
check_add_study(#child{study_plan =
                           #child_study_plan{is_init = 1,
                                             study_end_hard = EndHard1,
                                             study_end_plan_hard = EndHard2}},
                5, 2)
    when EndHard1 >= EndHard2 ->
    {false, lang:get("已学课程大于计划课程，请先更改计划再来学习")};
check_add_study(_, _, _) -> true.

add_study(Child = #child{child_attr =
                             ChildAttr = #child_attr{study_str = StudyStr}},
          1, Val) ->
    Child#child{child_attr =
                    ChildAttr#child_attr{study_str =
                                             min(100, StudyStr + Val)}};
add_study(Child = #child{child_attr =
                             ChildAttr = #child_attr{study_con = StudyCon}},
          2, Val) ->
    Child#child{child_attr =
                    ChildAttr#child_attr{study_con =
                                             min(100, StudyCon + Val)}};
add_study(Child = #child{child_attr =
                             ChildAttr = #child_attr{study_mag = StudyMag}},
          4, Val) ->
    Child#child{child_attr =
                    ChildAttr#child_attr{study_mag =
                                             min(100, StudyMag + Val)}};
add_study(Child = #child{child_attr =
                             ChildAttr = #child_attr{study_agi = StudyAgi}},
          3, Val) ->
    Child#child{child_attr =
                    ChildAttr#child_attr{study_agi =
                                             min(100, StudyAgi + Val)}};
add_study(Child = #child{child_attr =
                             ChildAttr = #child_attr{study_end = StudyEnd}},
          5, Val) ->
    Child#child{child_attr =
                    ChildAttr#child_attr{study_end =
                                             min(100, StudyEnd + Val)}}.

add_maturity(Child = #child{stage = 2,
                            maturity = Maturity},
             Val) ->
    case check_add_maturity(Child) of
        {false, Reason} -> {false, Reason};
        true ->
            case child_data:get_stage(2) of
                #{max_maturity := Max} when Maturity >= Max ->
                    {false, lang:get("孩子当前可以进入成长期，不用学习了")};
                #{max_maturity := Max} when Maturity + Val >= Max ->
                    {true, Child#child{maturity = Max}};
                #{max_maturity := _Max} ->
                    {true, Child#child{maturity = Maturity + Val}};
                _ -> {false, lang:get("当前阶段不可学习课程")}
            end
    end;
add_maturity(_, _) -> {false, lang:get("当前阶段不可学习课程")}.

check_add_maturity(#child{stage = 2, base_id = BaseId,
                          classes = Classes}) ->
    case Classes =:= 0 of
        true -> {false, lang:get("请先选择职业")};
        _ ->
            case child_data:get_base(BaseId) of
                #child_base{} -> true;
                _ -> {false, lang:get("请先选择职业")}
            end
    end;
check_add_maturity(_) -> true.

