-file("src/log/log.erl", 1).

-module(log).

-behaviour(gen_server).

-export([init/1,
         handle_call/3,
         handle_cast/2,
         handle_info/2,
         terminate/2,
         code_change/3]).

-export([start_link/0,
         create/1,
         levup/2,
         mod/3,
         mod/4,
         mod/7,
         mod/9,
         login/5,
         pet/4,
         pet/5,
         eqm/4,
         eqm/5,
         alchemy/3,
         fuse/4,
         guard_eqm/4,
         guard_eqm/5,
         guard_astroid/4,
         gold/7,
         child/4,
         child/5,
         assets/5,
         package/4,
         extension/8,
         drop/4,
         drop/5,
         camp/5,
         item/2,
         item_gain/3,
         item_loss/3,
         item_str/1,
         write/1,
         trans_begin/0,
         trans_flush/0,
         trans_clean/0,
         format/1,
         time_format/1,
         exp/4,
         market/5,
         market_gold_server/5,
         market_silver_server/5,
         skill_prac/4,
         photo/3,
         activity/4,
         auto_buy/4,
         limit_return/3,
         treasure/5,
         achieve_shop/7,
         mail/2,
         mail/3,
         pet_create/4,
         wedding/2,
         give_present/4,
         family/3,
         add_furnishing/3,
         lottery/4,
         log_mount/3,
         camp_web/5,
         store/4,
         classes_modify/2,
         growth_fund/2,
         maze/3,
         talisman/2,
         talisman/3,
         talisman/4,
         agenda/2,
         agenda_stat/1,
         guild_auction/10,
         guild_truth_dare/0,
         guild_truth_dare/3,
         onlines/1,
         rank/2,
         shop/3,
         combat_over/4,
         combat_round/1,
         chat/4,
         combat_name/1,
         make_report/8,
         new_market/11,
         make_market_log/4,
         restart_3k_log/0,
         long_active/3]).

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

-file("src/log/log.erl", 98).

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

-file("src/log/log.erl", 99).

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

-file("src/log/log.erl", 100).

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

-file("src/log/log.erl", 101).

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

-file("src/log/log.erl", 102).

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

-file("src/log/log.erl", 103).

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

-file("src/log/log.erl", 104).

-file("inc/log.hrl", 1).

-file("src/log/log.erl", 105).

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

-file("src/log/log.erl", 106).

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

-file("src/log/log.erl", 107).

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

-file("src/log/log.erl", 108).

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

-file("src/log/log.erl", 109).

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

-file("src/log/log.erl", 110).

-file("inc/mail.hrl", 1).

-record(mail,
        {sess ::
             undefined |
             {pos_integer(), bitstring(), non_neg_integer()},
         to ::
             undefined |
             {pos_integer(), bitstring(), non_neg_integer()},
         from ::
             undefined |
             {non_neg_integer(), bitstring(), non_neg_integer()},
         from_face = 0 :: non_neg_integer(),
         from_name = "" :: bitstring(),
         to_face = 0 :: non_neg_integer(),
         to_name = "" :: bitstring(),
         type = 0 :: 0..1,
         status = 0 :: 0..1,
         del_type = 0 :: 0..1,
         title = "" :: bitstring(),
         content = "" :: bitstring(),
         item_list = [] :: [tuple()],
         source = 0 :: pos_integer(),
         rev_ts = 0 :: pos_integer(),
         ts = 0 :: pos_integer(),
         read_ts = 0 :: non_neg_integer()}).

-file("src/log/log.erl", 111).

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

-file("src/log/log.erl", 112).

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

-file("src/log/log.erl", 113).

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

-file("src/log/log.erl", 114).

-file("inc/campaign.hrl", 1).

-record(campaign_eggs,
        {ver = 0,
         location = 0 :: non_neg_integer(),
         footprints = [],
         last_moved = 0 :: non_neg_integer(),
         rolled = 0 :: non_neg_integer(),
         rewarded = []}).

-record(camp_login,
        {camp_id = 0,
         m_time = 0,
         num = 0,
         days = [],
         buys = []}).

-record(camp_login_data,
        {day = 0, reward = [], buys = [], cost = []}).

-record(camp_login_buy_data,
        {id = 0, reward = [], cost = [], cd = 0}).

-record(campaign_bags,
        {ver = 0,
         collected = [],
         last_filled = 0 :: non_neg_integer(),
         rewarded = 0}).

-record(campaign_card,
        {ver = 0,
         card_ver = 0,
         init = 0,
         times = 0,
         card_list = []}).

-record(campaign_card_open,
        {ver = 0,
         card_ver = 0,
         times = 0,
         init = 0,
         card_list = []}).

-record(camp_wish_flower,
        {ver = 1,
         floor = 1,
         times = 0,
         all_times = 0,
         camp_id = 0}).

-record(camp_new_flop,
        {ver = 1,
         group = 0,
         times = 0,
         rewarded = [],
         camp_id = 0}).

-record(camp_consume_rebate,
        {ver = 1, limit_item = []}).

-record(camp_new_acc_charge,
        {ver = 1, charge_val = 0, get_reward = []}).

-record(camp_charge_seven_gift,
        {ver = 1, id = 0, buy_time = 0, can_reward = []}).

-record(camp_lucky_tree,
        {id = 0,
         times = 0,
         reward_list = [],
         delay_reward = []}).

-record(camp_long_active,
        {ver = 1,
         id = 0,
         lev = 0,
         token_list = [],
         reward_levs = [],
         week_box = 0,
         last_reset_time = 0}).

-record(m_campaign,
        {ver = 27,
         acc = [] :: list(),
         can_reward = [] :: list(),
         rewarded = [] :: list(),
         eggs = #campaign_eggs{},
         bags = #campaign_bags{},
         first_charge_double = [],
         camp_login = #camp_login{},
         hide_seek,
         login_roll,
         recharge = camp_series_recharge:init(),
         camp_card = #campaign_card{},
         wish_times = 0,
         camp_limit = [],
         camp_card_open = #campaign_card_open{},
         recharge_open = camp_series_recharge_open:init(),
         camp_wish_flower = #camp_wish_flower{},
         camp_doll = camp_doll:init(),
         camp_sign,
         camp_exchange,
         camp_animal_chess,
         camp_new_flop = #camp_new_flop{},
         multiplex_assert = 0,
         camp_consume_rebate = camp_consume_rebate:init(),
         camp_black_white_chess =
             camp_black_white_chess_mgr:init(),
         camp_scratch_card = camp_scratch_card:init(),
         camp_new_acc_charge = camp_new_acc_charge:init(),
         camp_charge_seven_gift = camp_charge_seven_gift:init(),
         camp_lucky_tree = camp_lucky_tree:init(),
         camp_long_active = camp_long_active:init(),
         gift_custom = camp_gift_custom:init()}).

-record(campaign_handle,
        {time = 0 :: non_neg_integer(),
         evt = {evt_rpc} :: tuple(),
         call_from = rpc :: evt | rpc,
         add_can_reward = 0 :: non_neg_integer(),
         camp :: undefined | tuple(),
         camp_info :: undefined | tuple(),
         push_list = [] :: [tuple()],
         push_cli = 0 :: 0..1,
         rpc_reward_num = 1 :: non_neg_integer(),
         return_acc = 0}).

-record(camp_collection,
        {camp_end_time = 0,
         reward_list = [],
         extra_data = [],
         random_index,
         red_dot}).

-record(camp_ico,
        {id = 0 :: non_neg_integer(),
         ico_id = 0 :: non_neg_integer(),
         name = "",
         is_show = 0 :: 0..1,
         start_time = 0 :: non_neg_integer() | tuple(),
         end_time = 0 :: non_neg_integer() | tuple(),
         white_list = [] :: list(),
         black_list = [] :: list(),
         min_open_time = 0 :: non_neg_integer() | tuple(),
         max_open_time = 0 :: non_neg_integer() | tuple()}).

-record(camp_cfg,
        {id = 0 :: non_neg_integer(),
         name = "" :: bitstring(),
         group_id = 0 :: non_neg_integer(),
         start_time = 0 :: non_neg_integer() | tuple(),
         end_time = 0 :: non_neg_integer() | tuple(),
         cli_start_time = 0 :: non_neg_integer() | tuple(),
         cli_end_time = 0 :: non_neg_integer() | tuple(),
         type = 0 :: pos_integer(),
         sec_type = 0 :: non_neg_integer(),
         status = 1 :: 0..1,
         reward_type = 2 :: pos_integer(),
         settlement = 2 :: non_neg_integer(),
         reward_title = "" :: bitstring(),
         reward_content = "" :: bitstring(),
         loss_items = [] :: list(),
         auto_buy = 0,
         reward = [] :: list(),
         camp_cond :: undefined | tuple(),
         reward_max = 1 :: non_neg_integer(),
         white_list = [] :: list(),
         black_list = [] :: list(),
         min_open_time = 0 :: non_neg_integer() | tuple(),
         max_open_time = 0 :: non_neg_integer() | tuple(),
         finish_id = 0 :: non_neg_integer(),
         finish_days = 0 :: non_neg_integer(),
         finish_end_days = 0 :: non_neg_integer(),
         cond_reward = [],
         merge_min = 0,
         merge_max = 0,
         is_keep_time = 0}).

-record(camp_cache,
        {id = 0 :: non_neg_integer(),
         sec_type = 0 :: non_neg_integer(),
         is_srv_open = 0 :: 0..1,
         start_time = 0 :: non_neg_integer(),
         end_time = 0 :: non_neg_integer(),
         cli_start_time = 0 :: non_neg_integer(),
         cli_end_time = 0 :: non_neg_integer()}).

-record(camp_unit,
        {id = {0, 0}, base_id = 0, map_id = 0}).

-record(camp_time,
        {id = 0, start_time = 0, end_time = 0}).

-record(camp_item,
        {item = 0,
         start_time = 0,
         end_time = 0,
         open = 0,
         msg = 0}).

-record(camp_assets_data,
        {type = 0, items = [], max = 0, var_type = day}).

-record(camp_gift_custom,
        {ver = 1,
         camp_id = 0,
         gift = [],
         buy = [],
         extra_reward = 0}).

-file("src/log/log.erl", 115).

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

-file("src/log/log.erl", 116).

-file("inc/lottery.hrl", 1).

-record(lottery,
        {idx = 0 :: non_neg_integer(),
         ver = 2,
         idx_temp = 0 :: non_neg_integer(),
         item_idx = 0 :: non_neg_integer(),
         item_id = 0 :: non_neg_integer(),
         item_count = 0 :: non_neg_integer(),
         pos = 0 :: non_neg_integer(),
         gold_type = 0 :: non_neg_integer(),
         gold_once = 1 :: non_neg_integer(),
         times_sum = 0 :: non_neg_integer(),
         times_now = 0 :: non_neg_integer(),
         time = 0 :: non_neg_integer(),
         lucky_num = 0 :: non_neg_integer(),
         times_lottery = 0 :: non_neg_integer(),
         state = 0 :: non_neg_integer(),
         num_sum = 0 :: non_neg_integer(),
         hot = 0 :: non_neg_integer(),
         price = 0 :: non_neg_integer(),
         rare = 0 :: non_neg_integer(),
         sort = 0 :: non_neg_integer(),
         role_id = {0, "", 0},
         role_name = "" :: list(),
         history = [] :: list(),
         num_list = [] :: list(),
         id_data = 0 :: non_neg_integer(),
         left_list = [] :: list(),
         buy_list = [] :: list(),
         history_deal = [] :: list()}).

-record(lottery_history,
        {time = 0 :: non_neg_integer(),
         num = 0 :: non_neg_integer(),
         role_id = {0, "", 0} :: list(),
         role_name = "" :: list(),
         item_idx = 0 :: non_neg_integer(),
         item_id = 0 :: non_neg_integer(),
         count = 0 :: non_neg_integer()}).

-record(lottery_mail,
        {idx = 0 :: non_neg_integer(),
         role_id = {0, "", 0} :: list(),
         title = "" :: list(),
         content = "" :: list(),
         item_list = "" :: list(),
         time = 0 :: non_neg_integer(),
         type = 0 :: non_neg_integer()}).

-record(lottery_reward_log,
        {idx = 0 :: non_neg_integer(),
         role_id = {0, "", 0} :: list(),
         role_name = "" :: list(),
         item_idx = 0 :: non_neg_integer(),
         item_id = 0 :: non_neg_integer(),
         item_count = 0 :: non_neg_integer(),
         times_buy = 0 :: non_neg_integer(),
         times_sum = 0 :: non_neg_integer(),
         time = 0 :: non_neg_integer()}).

-file("src/log/log.erl", 117).

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

-file("src/log/log.erl", 118).

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

-file("src/log/log.erl", 119).

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

-file("src/log/log.erl", 120).

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

-file("src/log/log.erl", 121).

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

-file("src/log/log.erl", 122).

-file("inc/shop.hrl", 1).

-record(shop_item,
        {id = 0 :: non_neg_integer(),
         base_id = 0 :: non_neg_integer(),
         name = "" :: bitstring(),
         num = 0 :: non_neg_integer(),
         bind = 1,
         sex = 2 :: 0..2,
         lev = 1 :: pos_integer(),
         max_lev = 0 :: pos_integer(),
         classes = 0 :: 0..4,
         min_break = 0,
         max_break = 0,
         price = 1 :: integer(),
         tab = 1 :: pos_integer(),
         tab2 = 0 :: non_neg_integer(),
         label = 0,
         limit_type = normal :: normal | day | week,
         limit_role = 0 :: integer(),
         sort = 0 :: non_neg_integer(),
         assets_type = gold :: atom(),
         discount = 1000 :: non_neg_integer(),
         privilege_lev = 0,
         privilege_role = [],
         rencounter_lev = 0,
         ext_args = "",
         achievement_limit = [],
         market_change = 0}).

-record(shop, {}).

-file("src/log/log.erl", 123).

-file("inc/tournament.hrl", 1).

-record(m_tournament,
        {ver = 3 :: non_neg_integer(),
         triggers = [] :: list(),
         status = 0 :: non_neg_integer(),
         rewarded = [] :: list(),
         pk_type = 0,
         kingbadgenum = 0,
         starlev = 0,
         kingbadge = [] :: list(),
         showbadge = 0}).

-record(tournament_profile,
        {id = {0, "", 0} :: tuple(),
         ver = 11 :: non_neg_integer(),
         name = "" :: string(),
         lev = 0 :: non_neg_integer(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         rank_lev = 1 :: non_neg_integer(),
         rank_point = 0 :: non_neg_integer(),
         liked = 0 :: non_neg_integer(),
         liked_other = 0 :: non_neg_integer(),
         last_matched = 0 :: non_neg_integer(),
         day_matched = 0 :: non_neg_integer(),
         day_win = 0 :: non_neg_integer(),
         day_win_sustained = 0 :: non_neg_integer(),
         season_rank_lev = 1 :: non_neg_integer(),
         season_rank_point = 0 :: non_neg_integer(),
         combat_count = 0 :: non_neg_integer(),
         win_count = 0 :: non_neg_integer(),
         win_sustained = 0 :: non_neg_integer(),
         season_kill = 0 :: non_neg_integer(),
         season_reverse = 0 :: non_neg_integer(),
         season_revive = 0 :: non_neg_integer(),
         season_dmg = 0 :: non_neg_integer(),
         season_bearing_dmg = 0 :: non_neg_integer(),
         season_zero_dmg = 0 :: non_neg_integer(),
         season_pet_revive = 0 :: non_neg_integer(),
         best_rank_point = 0 :: non_neg_integer(),
         best_rank_lev = 1 :: non_neg_integer(),
         best_win_count = 0 :: non_neg_integer(),
         best_win_sustained = 0 :: non_neg_integer(),
         best_partner = [] :: list(),
         week_rank_lev = 1 :: non_neg_integer(),
         week_rank_point = 0 :: non_neg_integer(),
         awesome_kill = 0 :: non_neg_integer(),
         awesome_kill_num = 0 :: non_neg_integer(),
         awesome_dmg = 0 :: non_neg_integer(),
         awesome_heal = 0 :: non_neg_integer(),
         awesome_control = 0 :: non_neg_integer(),
         mvp = 0 :: non_neg_integer(),
         loss_mvp = 0 :: non_neg_integer(),
         season_awesome_kill = 0 :: non_neg_integer(),
         season_awesome_kill_num = 0 :: non_neg_integer(),
         season_awesome_dmg = 0 :: non_neg_integer(),
         season_awesome_heal = 0 :: non_neg_integer(),
         season_awesome_control = 0 :: non_neg_integer(),
         season_mvp = 0 :: non_neg_integer(),
         season_loss_mvp = 0 :: non_neg_integer(),
         consecutive_lost = 0 :: non_neg_integer(),
         reported = 0 :: non_neg_integer(),
         reported_other = 0 :: non_neg_integer(),
         reported_logs = [] :: list(),
         banned_date = 0 :: non_neg_integer(),
         reported_single_match = 0,
         is_auto_combat = 0,
         guards = [],
         historical_high = 0 :: non_neg_integer(),
         show_badge_id = 0 :: non_neg_integer(),
         promotion_win = 0 :: non_neg_integer(),
         upgrade_point = 0 :: non_neg_integer()}).

-record(tournament_role,
        {id = {0, "", 0} :: tuple(),
         status = 0 :: non_neg_integer(),
         name = "" :: string(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         fc = 0 :: non_neg_integer(),
         looks = [] :: list(),
         times = 1 :: non_neg_integer(),
         point = 1 :: non_neg_integer(),
         rank_lev = 1 :: non_neg_integer(),
         rank_point = 0 :: non_neg_integer(),
         pid :: undefined | pid() | 0,
         is_online = 0 :: 0 | 1,
         match_id = 0 :: non_neg_integer(),
         side = 0 :: non_neg_integer(),
         is_leader = 0 :: 0 | 1,
         last_matched = 0 :: non_neg_integer(),
         team_id = [] :: list(),
         formation_id = 1 :: non_neg_integer(),
         formation_lev = 1 :: non_neg_integer(),
         partner = [] :: list(),
         consecutive_lost = 0 :: non_neg_integer(),
         reported = 0 :: non_neg_integer(),
         guards = [],
         show_badge_id = 0 :: non_neg_integer()}).

-record(tournament_team,
        {ids = [] :: list(),
         output_num = 0 :: non_neg_integer(),
         assist_num = {0, 0} ::
             {non_neg_integer(), non_neg_integer()},
         origin_ids = [] :: list(),
         num = 1 :: non_neg_integer(),
         sum_point = 0 :: non_neg_integer(),
         max_point = 0 :: non_neg_integer(),
         min_point = 0 :: non_neg_integer(),
         sum_lev = 0 :: non_neg_integer(),
         max_lev = 0 :: non_neg_integer(),
         min_lev = 0 :: non_neg_integer(),
         tried_match = 0 :: non_neg_integer(),
         match_id = 0 :: non_neg_integer(),
         usurpers = [] :: list(),
         order = [] :: list(),
         classes = [] :: list()}).

-record(tournament_match,
        {id = 0 :: non_neg_integer(),
         teams = [] :: list(),
         time = 0 :: non_neg_integer(),
         combat_pid :: undefined | pid(),
         calc_args = [] :: list()}).

-record(tournament_usurper,
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

-record(tournament_celebrity,
        {id = {0, "", 0} :: tuple(),
         name = "" :: string(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         val1 = 0 :: non_neg_integer(),
         val2 = 0 :: non_neg_integer()}).

-record(tournament_fighter,
        {id = {0, "", 0} :: tuple(),
         name = "" :: string(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         rank_lev = 1 :: non_neg_integer(),
         rank_point = 0 :: non_neg_integer(),
         kill_num = 0,
         dead_num = 0,
         total_heal = 0,
         control_num = 0,
         total_hurt = 0 :: non_neg_integer(),
         total_dmg = 0 :: non_neg_integer(),
         mvp_score = 0 :: non_neg_integer()}).

-record(tournament_season_role,
        {ver = 0,
         id = {0, "", 0} :: tuple(),
         name = "" :: string(),
         reward_lev = 0 :: non_neg_integer(),
         rewarded = 0 :: non_neg_integer()}).

-record(tournament_result,
        {id = {0, "", 0},
         ver = 3,
         is_win = 1,
         mates = [],
         rival = [],
         match_id = 0,
         record_pz = {"", 0} :: tuple(),
         time = 0,
         rank_lev = 0}).

-record(tournament_result_role,
        {id = {0, "", 0},
         ver = 1,
         recent = [],
         last_recent = []}).

-record(king_badge,
        {id = 0,
         status = 0,
         active_effect_type = 3,
         active_attr = [],
         fc = 0}).

-record(tournament_match_report_info,
        {match_id, can_report = [], result}).

-file("src/log/log.erl", 124).

-file("inc/arena.hrl", 1).

-record(m_arena,
        {ver = 1,
         cd_time = 0 :: non_neg_integer(),
         acc_num = 0 :: non_neg_integer(),
         cup = 1000 :: non_neg_integer(),
         roll_time = 0,
         roll_id = 0,
         roll_graph = []}).

-record(arena_role,
        {id = {0, "", 0} :: tuple(),
         ver = 6,
         name = "" :: bitstring(),
         win = 0 :: non_neg_integer(),
         acc_num = 0,
         sex = 0 :: 0..1,
         classes = 0 :: 0..4,
         lev = 0 :: non_neg_integer(),
         last_time = 0 :: non_neg_integer(),
         is_robot = 0 :: 0..1,
         cup = 0,
         next_log_id = 1,
         log = [],
         win_list = [],
         win_ratio = 0,
         day_time_flag = 0,
         enemy = [],
         day_win = 0,
         day_lost = 0,
         def_acc_num = 0,
         def_win = 0,
         max_cup = 1000,
         acc_sword_num = 0,
         acc_mage_num = 0,
         acc_archer_num = 0,
         acc_orc_num = 0,
         acc_devine_num = 0,
         acc_moon_num = 0,
         acc_templar_num = 0,
         win_sword = 0,
         win_mage = 0,
         win_archer = 0,
         win_orc = 0,
         win_devine = 0,
         win_moon = 0,
         win_templar = 0,
         init_def = 0,
         formation = 1,
         formation_lev = 1,
         guards = [],
         last_win_role}).

-record(arena_enemy,
        {order = 0,
         role_id = {0, "", 0},
         is_robot = 0,
         classes = 0,
         lev = 0,
         sex = 0,
         cup = 0,
         soul = 1}).

-record(arena_log,
        {log_id = 1,
         s_role_id = {0, "", 0} :: tuple(),
         s_name = "" :: list(),
         result = 0 :: 0..1,
         t_role_id = {0, "", 0} :: tuple(),
         t_name = "" :: list(),
         time = 0 :: non_neg_integer(),
         s_cup = 0,
         t_cup = 0,
         s_cup_change = 0,
         t_cup_change = 0,
         feedback = 0}).

-record(arena_role_index,
        {id = {0, "", 0},
         lev = 0,
         cup = 0,
         time = 0,
         day_time_flag = 0,
         day_win = 0,
         day_lost = 0,
         win_list = [],
         win_ratio = 0}).

-record(arena_robot,
        {id = {0, "robot", 0},
         lev = 0,
         name = "",
         classes = 0,
         sex = 0,
         cup = 0}).

-record(arena_graph,
        {id = 1,
         base_id = 0,
         num = 0,
         status = 0,
         quality = 0}).

-record(arena_graph_base,
        {id = 1,
         base_id = 0,
         num = 0,
         quality = 0,
         name = "",
         sex = 0,
         classes = 0,
         lev_low = 0,
         lev_high = 0,
         ratio = 0,
         times = 1,
         order_list = []}).

-file("src/log/log.erl", 125).

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

-file("src/log/log.erl", 126).

-file("inc/formation.hrl", 1).

-record(m_formation,
        {id = 1, lev = 1, pos = 1, forms = [], team_form = []}).

-record(formation, {id = 0, lev = 0, exp = 0}).

-record(formation_data,
        {id = 0,
         type = 1,
         lev = 0,
         max_lev = 1,
         name = "",
         pos_desc = [],
         attr_1 = [],
         attr_2 = [],
         attr_3 = [],
         attr_4 = [],
         attr_5 = [],
         pet_attr = [],
         strong_restrain = [],
         weak_restrain = [],
         next_exp = 0,
         need_item = [],
         item_id = 0}).

-file("src/log/log.erl", 127).

-file("inc/guild_truth_dare.hrl", 1).

-author("Suhan").

-record(guild_truth_dare_info,
        {guild_id = {0, "", 0}, next_id = 0, his_info = []}).

-record(guild_truth_dare_his_info,
        {id = 0,
         time = 0,
         lucky_role = {0, "", 0},
         role_name = "",
         sex = 0,
         classes = 0,
         flower = 0,
         egg = 0,
         question_type = 0,
         question = ""}).

-record(guild_truth_dare_question_bank,
        {guild_id = {0, "", 0},
         ver = 0,
         next_id = 1000,
         truth_num = 0,
         dare_num = 0,
         question = []}).

-record(guild_truth_dare_question,
        {question_id = 0,
         type = 0,
         role_id = {0, "", 0},
         role_name = "",
         question = "",
         is_choose = 0}).

-record(guild_truth_dare_room_info,
        {guild_id = {0, "", 0},
         room_pid = undefined,
         num = 0,
         max_num = 0,
         role = []}).

-record(guild_truth_dare_room_log,
        {guild_id = {0, "", 0},
         scene_info = [],
         truth_num = 0,
         dare_num = 0,
         contents = []}).

-file("src/log/log.erl", 128).

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

-file("src/log/log.erl", 129).

-record(state, {next_id = 1}).

format(L) ->
    {S, Args} = do_format(L, [], []),
    io_lib:format(S, Args).

do_format([], SL, Args) ->
    {string:join(lists:reverse(SL), "$$"),
     lists:reverse(Args)};
do_format([{Type = "~ts", A} | T], SL, Args) ->
    do_format(T, [Type | SL], [A | Args]);
do_format([{Type = "~w", A} | T], SL, Args) ->
    do_format(T, [Type | SL], [A | Args]);
do_format([{Type = "~p", A} | T], SL, Args) ->
    do_format(T, [Type | SL], [A | Args]);
do_format([{_Type = "~s", A} | T], SL, Args) ->
    do_format(T, ["~ts" | SL], [A | Args]);
do_format([{Type = "~tc", A} | T], SL, Args) ->
    do_format(T, [Type | SL], [A | Args]);
do_format([A | T], SL, Args) when is_binary(A) ->
    do_format(T, ["~ts" | SL], [A | Args]);
do_format([I | T], SL, Args) ->
    do_format(T, ["~w" | SL], [I | Args]).

-spec time_format(string()) -> string().

time_format("yyyyMMddhhmmss") ->
    {{Y, M, D}, {H, I, S}} = erlang:localtime(),
    lists:concat([Y, tf(M), tf(D), tf(H), tf(I), tf(S)]);
time_format("yyyy-MM-dd hh:mm:ss") ->
    {{Y, M, D}, {H, I, S}} = erlang:localtime(),
    lists:concat([Y,
                  "-",
                  tf(M),
                  "-",
                  tf(D),
                  " ",
                  tf(H),
                  ":",
                  tf(I),
                  ":",
                  tf(S)]).

tf(0) -> "00";
tf(1) -> "01";
tf(2) -> "02";
tf(3) -> "03";
tf(4) -> "04";
tf(5) -> "05";
tf(6) -> "06";
tf(7) -> "07";
tf(8) -> "08";
tf(9) -> "09";
tf(N) -> N.

-spec start_link() -> ignore |
                      {ok, pid()} |
                      {error, any()}.

start_link() ->
    case both of
        both ->
            gen_server:start_link({local, log}, log, [], []),
            log_old:start_link();
        _ -> gen_server:start_link({local, log}, log, [], [])
    end.

-spec create(#role{}) -> ok.

create(_Role) -> ok.

-spec levup(#role{}, #role{}) -> ok.

levup(_OldRole = #role{assets = #assets{exp = OldExp}},
      Role = #role{assets = #assets{exp = Exp}}) ->
    RoleMap = role_to_map(Role, "level_up"),
    ExpMap = RoleMap#{"currently_exp" => Exp,
                      "exp" => OldExp},
    write(ExpMap),
    case both of
        both ->
            case catch log_old:levup(Role) of
                _Err = {'EXIT', _} ->
                    logger:error("日志记录时出错:~w", [_Err], log, 222),
                    ok;
                _ -> ok
            end;
        _ -> skip
    end,
    ok.

-spec mod(#role{}, atom(),
          non_neg_integer() | string() | bitstring()) -> ok.

mod(Role = #role{}, quest_accept, QuestId) ->
    Map1 = role_to_map(Role, "task-log"),
    {Type, Name} = case quest_data:get(QuestId) of
                       #quest_data{type = QuestType, name = QuestName} ->
                           {QuestType, QuestName};
                       _ -> {0, ""}
                   end,
    Map2 = Map1#{"operate" => 0, "task_id" => QuestId,
                 "name" => to_bitstring(Name),
                 "type" => to_bitstring(Type), "type_id" => Type},
    write(Map2),
    case both of
        both ->
            case catch log_old:mod(Role, quest_accept, QuestId) of
                _Err = {'EXIT', _} ->
                    logger:error("日志记录时出错:~w", [_Err], log, 241),
                    ok;
                _ -> ok
            end;
        _ -> skip
    end,
    ok;
mod(Role = #role{}, quest_giveup, QuestId) ->
    Map1 = role_to_map(Role, "task-log"),
    {Type, Name} = case quest_data:get(QuestId) of
                       #quest_data{type = QuestType, name = QuestName} ->
                           {QuestType, QuestName};
                       _ -> {0, ""}
                   end,
    Map2 = Map1#{"operate" => 2, "task_id" => QuestId,
                 "name" => to_bitstring(Name),
                 "type" => to_bitstring(Type), "type_id" => Type},
    write(Map2),
    case both of
        both ->
            case catch log_old:mod(Role, quest_giveup, QuestId) of
                _Err = {'EXIT', _} ->
                    logger:error("日志记录时出错:~w", [_Err], log, 257),
                    ok;
                _ -> ok
            end;
        _ -> skip
    end,
    ok;
mod(Role = #role{}, quest_commit, QuestId) ->
    Map1 = role_to_map(Role, "task-log"),
    {Type, Name} = case quest_data:get(QuestId) of
                       #quest_data{type = QuestType, name = QuestName} ->
                           {QuestType, QuestName};
                       _ -> {0, ""}
                   end,
    Map2 = Map1#{"operate" => 1, "task_id" => QuestId,
                 "name" => to_bitstring(Name),
                 "type" => to_bitstring(Type), "type_id" => Type},
    write(Map2),
    case both of
        both ->
            case catch log_old:mod(Role, quest_commit, QuestId) of
                _Err = {'EXIT', _} ->
                    logger:error("日志记录时出错:~w", [_Err], log, 273),
                    ok;
                _ -> ok
            end;
        _ -> skip
    end,
    ok;
mod(Role, Type, Title) when is_integer(Title) ->
    mod(Role, Type, integer_to_list(Title));
mod(Role = #role{}, Type, Title) ->
    Map1 = role_to_map(Role, "custom-event"),
    Map2 = Map1#{"title" => to_bitstring(Title),
                 "event_name" => to_bitstring(Type)},
    write(Map2),
    case both of
        both ->
            case catch log_old:mod(Role, Type, Title) of
                _Err = {'EXIT', _} ->
                    logger:error("日志记录时出错:~w", [_Err], log, 284),
                    ok;
                _ -> ok
            end;
        _ -> skip
    end,
    ok.

mod(Role = #role{}, quest_commit, QuestId, Msg) ->
    Map1 = role_to_map(Role, "task-log"),
    {Type, Name} = case quest_data:get(QuestId) of
                       #quest_data{type = Tp, name = Nm} -> {Tp, Nm};
                       _ -> {0, ""}
                   end,
    Map2 = Map1#{"operate" => 1, "task_id" => QuestId,
                 "name" => to_bitstring(Name),
                 "type" => to_bitstring(Type), "type_id" => Type,
                 "comments" => Msg},
    write(Map2),
    case both of
        both ->
            case catch log_old:mod(Role, quest_commit, QuestId) of
                _Err = {'EXIT', _} ->
                    logger:error("日志记录时出错:~w", [_Err], log, 301),
                    ok;
                _ -> ok
            end;
        _ -> skip
    end,
    ok;
mod(Role = #role{}, Type, Title, Msg) ->
    Map1 = role_to_map(Role, "custom-event"),
    Map2 = Map1#{"title" => to_bitstring(Title),
                 "event_name" => to_bitstring(Type),
                 "msg" => to_bitstring(Msg)},
    write(Map2),
    case both of
        both ->
            case catch log_old:mod(Role, Type, Title, Msg) of
                _Err = {'EXIT', _} ->
                    logger:error("日志记录时出错:~w", [_Err], log, 311),
                    ok;
                _ -> ok
            end;
        _ -> skip
    end,
    ok.

mod(Role = #role{}, Label, Title, Msg, LossMsg, OldR,
    NewR) ->
    Map1 = role_to_map(Role, "custom-event"),
    Comments = {struct,
                [{"msg", to_bitstring(Msg)},
                 {"loss", to_bitstring(loss_log(LossMsg, OldR, NewR))},
                 {"old", to_bitstring(rec_log(Label, OldR))},
                 {"new", to_bitstring(rec_log(Label, NewR))}]},
    Map2 = Map1#{"title" => to_bitstring(Title),
                 "event_name" => to_bitstring(mod),
                 "comments" => Comments},
    write(Map2),
    case both of
        both ->
            case catch log_old:mod(Role,
                                   Label,
                                   Title,
                                   Msg,
                                   LossMsg,
                                   OldR,
                                   NewR)
                of
                _Err = {'EXIT', _} ->
                    logger:error("日志记录时出错:~w", [_Err], log, 328),
                    ok;
                _ -> ok
            end;
        _ -> skip
    end,
    ok.

mod(Role = #role{}, Label, Title, Msg, LossMsg, OldR,
    NewR, OldData, NewData) ->
    Map1 = role_to_map(Role, "custom-event"),
    Comments = {struct,
                [{"msg", to_bitstring(Msg)},
                 {"loss", to_bitstring(loss_log(LossMsg, OldR, NewR))},
                 {"old", to_bitstring(rec_log(Label, OldData))},
                 {"new", to_bitstring(rec_log(Label, NewData))}]},
    Map2 = Map1#{"title" => to_bitstring(Title),
                 "event_name" => to_bitstring(mod),
                 "comments" => Comments},
    write(Map2),
    case both of
        both ->
            case catch log_old:mod(Role,
                                   Label,
                                   Title,
                                   Msg,
                                   LossMsg,
                                   OldR,
                                   NewR,
                                   OldData,
                                   NewData)
                of
                _Err = {'EXIT', _} ->
                    logger:error("日志记录时出错:~w", [_Err], log, 344),
                    ok;
                _ -> ok
            end;
        _ -> skip
    end,
    ok.

loss_log(role_gain, OldR, NewR) ->
    do_loss_log([gold, gold_bind, coin, items],
                OldR,
                NewR,
                []);
loss_log(LossMsg, _OldR, _NewR) -> LossMsg.

do_loss_log([], _OldR, _NewR, L) -> string:join(L, "");
do_loss_log([Label | T], OldR, NewR, L) ->
    L1 = do_loss_log(Label, OldR, NewR),
    do_loss_log(T, OldR, NewR, L ++ L1).

do_loss_log(gold,
            #role{assets = #assets{gold = OldVal}},
            #role{assets = #assets{gold = NewVal}})
    when OldVal > NewVal ->
    [io_lib:format("[钻石:~w]", [OldVal - NewVal])];
do_loss_log(gold_bind,
            #role{assets = #assets{gold_bind = OldVal}},
            #role{assets = #assets{gold_bind = NewVal}})
    when OldVal > NewVal ->
    [io_lib:format("[金币:~w]", [OldVal - NewVal])];
do_loss_log(coin,
            #role{assets = #assets{coin = OldVal}},
            #role{assets = #assets{coin = NewVal}})
    when OldVal > NewVal ->
    [io_lib:format("[银币:~w]", [OldVal - NewVal])];
do_loss_log(guild,
            #role{assets = #assets{guild = OldVal}},
            #role{assets = #assets{guild = NewVal}})
    when OldVal > NewVal ->
    [io_lib:format("[公会贡献:~w]", [OldVal - NewVal])];
do_loss_log(items, _OldR, _NewR) ->
    case get(role_loss_items) of
        L = [_ | _] ->
            [io_lib:format("[~ts:~w,~w]",
                           [item:attr(name, BaseId), BaseId, Num])
             || {BaseId, Num} <- L];
        _ -> []
    end;
do_loss_log(_Label, _OldR, _NewR) -> [].

rec_log(_Label, Msg) when is_binary(Msg) -> Msg;
rec_log(_Label, _R) -> "".

login(Role = #role{}, Type, _LoginT, _LogoutT, _Msg) ->
    Type1 = case Type of
                logout -> <<"session">>;
                _ -> Type
            end,
    Map1 = role_to_map(Role, Type1),
    logger:debug("记录登录日志:~w", [Map1], log, 382),
    write(Map1),
    case both of
        both ->
            case catch log_old:login(Role,
                                     Type,
                                     _LoginT,
                                     _LogoutT,
                                     _Msg)
                of
                _Err = {'EXIT', _} ->
                    logger:error("日志记录时出错:~w", [_Err], log, 384),
                    ok;
                _ -> ok
            end;
        _ -> skip
    end,
    ok.

-spec pet(#role{}, Title :: string() | bitstring(),
          #pet{}, #pet{}) -> ok.

pet(Role, Title, OldPet, NewPet) ->
    pet(Role, Title, OldPet, NewPet, false).

pet(Role = #role{}, Title, OldPet, NewPet, Flag) ->
    Map1 = role_to_map(Role, "custom-event"),
    Record = util:fbin("~w",
                       [do_record(pet, OldPet, Flag)]),
    Comments = {struct,
                [{"old_pet", to_bitstring(pet_log(OldPet))},
                 {"new_pet", to_bitstring(pet_log(NewPet))},
                 {"record", to_bitstring(Record)},
                 {"title", to_bitstring(Title)}]},
    Map2 = Map1#{"event_name" => to_bitstring(pet),
                 "comments" => Comments},
    write(Map2),
    case both of
        both ->
            case catch log_old:pet(Role, Title, OldPet, Flag) of
                _Err = {'EXIT', _} ->
                    logger:error("日志记录时出错:~w", [_Err], log, 405),
                    ok;
                _ -> ok
            end;
        _ -> skip
    end,
    ok.

child(Role = #role{id = RoleId, name = Name,
                   account = Account, lev = Lev, classes = Classes},
      Title, OldChild, NewChild) ->
    case both of
        both ->
            case catch log_old:child(Role,
                                     Title,
                                     OldChild,
                                     NewChild)
                of
                _Err = {'EXIT', _} ->
                    logger:error("日志记录时出错:~w", [_Err], log, 410),
                    ok;
                _ -> ok
            end;
        _ -> skip
    end,
    child(RoleId,
          Name,
          Account,
          Lev,
          Classes,
          Title,
          OldChild,
          NewChild);
child(_, _Title, _OldChild, _NewChild) ->
    logger:error("日志参数错误 [~w]", [_Title], log, 413),
    ok.

child(RoleId, _Child = #child{parents = Parents}, Title,
      OldChild, NewChild) ->
    case lists:keyfind(RoleId, #child_parent.id, Parents) of
        #child_parent{id = RoleId, account = Account,
                      name = Name, lev = Lev, classes = Classes} ->
            case both of
                both ->
                    case catch log_old:child(RoleId,
                                             _Child,
                                             Title,
                                             OldChild,
                                             NewChild)
                        of
                        _Err = {'EXIT', _} ->
                            logger:error("日志记录时出错:~w", [_Err], log, 418),
                            ok;
                        _ -> ok
                    end;
                _ -> skip
            end,
            child(RoleId,
                  Name,
                  Account,
                  Lev,
                  Classes,
                  Title,
                  OldChild,
                  NewChild);
        _ -> ok
    end;
child(_, _, _Title, _OldChild, _NewChild) ->
    logger:error("日志参数错误 [~w]", [_Title], log, 424),
    ok.

child({Id, Platform, ZoneId}, Name, _Account, Lev,
      Classes, Title, OldChild, NewChild) ->
    Map1 = to_map_data(#{id => {Id, Platform, ZoneId},
                         name => Name, account => "account", lev => Lev,
                         classes => Classes},
                       "custom-event"),
    Comments = {struct,
                [{"old_child", to_bitstring(child_log(OldChild))},
                 {"new_child", to_bitstring(child_log(NewChild))},
                 {"title", to_bitstring(Title)}]},
    Map2 = Map1#{"event_name" => to_bitstring(pet),
                 "comments" => Comments},
    write(Map2),
    ok.

pet_create(NewR = #role{}, OldR,
           Pet = #pet{genre = Genre}, Args = #{from := From})
    when Genre == 2 orelse
             Genre == 4 orelse Genre == 5 orelse Genre == 6 ->
    Map1 = role_to_map(NewR, "custom-event"),
    Comments = {struct,
                [{"pet", to_bitstring(pet_log(Pet))},
                 {"loss", to_bitstring(loss_log(role_gain, OldR, NewR))},
                 {"from", to_bitstring(From)}]},
    Map2 = Map1#{"event_name" => to_bitstring(pet_create),
                 "comments" => Comments},
    write(Map2),
    case both of
        both ->
            case catch log_old:pet_create(NewR, OldR, Pet, Args) of
                _Err = {'EXIT', _} ->
                    logger:error("日志记录时出错:~w", [_Err], log, 456),
                    ok;
                _ -> ok
            end;
        _ -> skip
    end,
    ok;
pet_create(NewR = #role{}, OldR,
           Pet = #pet{genre = Genre}, _Args)
    when Genre == 2 orelse
             Genre == 4 orelse Genre == 5 orelse Genre == 6 ->
    Map1 = role_to_map(NewR, "custom-event"),
    Comments = {struct,
                [{"pet", to_bitstring(pet_log(Pet))},
                 {"loss", to_bitstring(loss_log(role_gain, OldR, NewR))},
                 {"from", to_bitstring("未知")}]},
    Map2 = Map1#{"event_name" => to_bitstring(pet_create),
                 "comments" => Comments},
    write(Map2),
    case both of
        both ->
            case catch log_old:pet_create(NewR, OldR, Pet, _Args) of
                _Err = {'EXIT', _} ->
                    logger:error("日志记录时出错:~w", [_Err], log, 474),
                    ok;
                _ -> ok
            end;
        _ -> skip
    end,
    ok;
pet_create(_NewR, _OldR, _Pet, _) -> ok.

wedding(Role = #role{id = Id},
        Args = #{id := Id,
                 other_id := {ORId, ORPlatform, ORZoneId},
                 other_name := ORName, handle := Handle,
                 type := Type}) ->
    Map1 = role_to_map(Role, "custom-event"),
    Comments = {struct,
                [{"lover_name", to_bitstring(ORName)},
                 {"lover_id", to_bitstring(ORId)},
                 {"lover_platform", to_bitstring(ORPlatform)},
                 {"lover_zone_id", to_bitstring(ORZoneId)},
                 {"type", to_bitstring(Type)},
                 {"handle", to_bitstring(Handle)}]},
    Map2 = Map1#{"event_name" => to_bitstring(log_wedding),
                 "comments" => Comments},
    write(Map2),
    case both of
        both ->
            case catch log_old:wedding(Role, Args) of
                _Err = {'EXIT', _} ->
                    logger:error("日志记录时出错:~w", [_Err], log, 494),
                    ok;
                _ -> ok
            end;
        _ -> skip
    end,
    ok;
wedding(Role = #role{},
        Args = #{id := {ORId, ORPlatform, ORZoneId},
                 name := ORName, handle := Handle, type := Type}) ->
    Map1 = role_to_map(Role, "custom-event"),
    Comments = {struct,
                [{"spouse_name", to_bitstring(ORName)},
                 {"spouse_id", to_bitstring(ORId)},
                 {"spouse_platform", to_bitstring(ORPlatform)},
                 {"spouse_zone_id", to_bitstring(ORZoneId)},
                 {"type", to_bitstring(Type)},
                 {"handle", to_bitstring(Handle)}]},
    Map2 = Map1#{"event_name" => to_bitstring(log_wedding),
                 "comments" => Comments},
    write(Map2),
    case both of
        both ->
            case catch log_old:wedding(Role, Args) of
                _Err = {'EXIT', _} ->
                    logger:error("日志记录时出错:~w", [_Err], log, 511),
                    ok;
                _ -> ok
            end;
        _ -> skip
    end,
    ok.

package(Role = #role{}, Title, SItem, TItem) ->
    Map1 = role_to_map(Role, "custom-event"),
    Comments = {struct,
                [{"old_item", to_bitstring(item_log(SItem))},
                 {"new_item", to_bitstring(item_log(TItem))},
                 {"title", to_bitstring(Title)}]},
    Map2 = Map1#{"comments" => Comments,
                 "event_name" => to_bitstring(package)},
    write(Map2),
    case both of
        both ->
            case catch log_old:package(Role, Title, SItem, TItem) of
                _Err = {'EXIT', _} ->
                    logger:error("日志记录时出错:~w", [_Err], log, 527),
                    ok;
                _ -> ok
            end;
        _ -> skip
    end,
    ok.

extension(ApplyRoleId, ApplyName,
          _RoleId = {Bid, Bplat, Bzone}, RoleName, RoleLev, Title,
          AddScore, AllScore) ->
    Map1 = to_map_data(#{id => ApplyRoleId,
                         name => ApplyName, account => "account",
                         lev => RoleLev, classes => 0},
                       "custom-event"),
    Comments = {struct,
                [{"accept_id", to_bitstring(Bid)},
                 {"accept_platform", to_bitstring(Bplat)},
                 {"accept_zone_id", to_bitstring(Bzone)},
                 {"accept_name", to_bitstring(RoleName)},
                 {"add_score", to_bitstring(AddScore)},
                 {"all_score", to_bitstring(AllScore)},
                 {"title", to_bitstring(Title)}]},
    Map2 = Map1#{"event_name" => to_bitstring(extension),
                 "comments" => Comments},
    write(Map2),
    case both of
        both ->
            case catch log_old:extension(ApplyRoleId,
                                         ApplyName,
                                         _RoleId,
                                         RoleName,
                                         RoleLev,
                                         Title,
                                         AddScore,
                                         AllScore)
                of
                _Err = {'EXIT', _} ->
                    logger:error("日志记录时出错:~w", [_Err], log, 548),
                    ok;
                _ -> ok
            end;
        _ -> skip
    end,
    ok.

eqm(Role, Title, OldEqm, NewEqm) ->
    eqm(Role, Title, OldEqm, NewEqm, null).

eqm(Role = #role{}, Title, OldEqm, NewEqm, Ext) ->
    Map1 = role_to_map(Role, "custom-event"),
    Comments = {struct,
                [{"old_item", to_bitstring(item_log(OldEqm))},
                 {"new_item", to_bitstring(item_log(NewEqm))},
                 {"ext", to_bitstring(eqm_ext_log(Ext))},
                 {"title", to_bitstring(Title)}]},
    Map2 = Map1#{"event_name" => to_bitstring(eqm),
                 "comments" => Comments},
    write(Map2),
    case both of
        both ->
            case catch log_old:eqm(Role, Title, OldEqm, NewEqm, Ext)
                of
                _Err = {'EXIT', _} ->
                    logger:error("日志记录时出错:~w", [_Err], log, 567),
                    ok;
                _ -> ok
            end;
        _ -> skip
    end,
    ok.

alchemy(Role = #role{}, Title, Items) ->
    ItemLogs = [item_log2(I) || I <- Items],
    ItemLogs2 = string:join(ItemLogs, ","),
    Map1 = role_to_map(Role, "custom-event"),
    Map2 = Map1#{"title" => to_bitstring(Title),
                 "comments" => to_bitstring(ItemLogs2),
                 "event_name" => to_bitstring(alchemy)},
    write(Map2),
    case both of
        both ->
            case catch log_old:alchemy(Role, Title, Items) of
                _Err = {'EXIT', _} ->
                    logger:error("日志记录时出错:~w", [_Err], log, 581),
                    ok;
                _ -> ok
            end;
        _ -> skip
    end,
    ok.

fuse(Role = #role{}, Title, Items, NewItem) ->
    ItemLogs = [item_log2(I) || I <- Items],
    ItemLogs2 = string:join(ItemLogs, ","),
    Map1 = role_to_map(Role, "custom-event"),
    Comments = {struct,
                [{"items", to_bitstring(ItemLogs2)},
                 {"new_item", to_bitstring(item_log2(NewItem))}]},
    Map2 = Map1#{"title" => to_bitstring(Title),
                 "event_name" => to_bitstring(fuse),
                 "comments" => Comments},
    write(Map2),
    case both of
        both ->
            case catch log_old:fuse(Role, Title, Items, NewItem) of
                _Err = {'EXIT', _} ->
                    logger:error("日志记录时出错:~w", [_Err], log, 599),
                    ok;
                _ -> ok
            end;
        _ -> skip
    end,
    ok.

guard_eqm(Role, Title, OldEqm, NewEqm) ->
    guard_eqm(Role, Title, OldEqm, NewEqm, null).

guard_eqm(Role = #role{}, Title, OldEqm, NewEqm, Ext) ->
    Map1 = role_to_map(Role, "custom-event"),
    Comments = {struct,
                [{"old_item", to_bitstring(guard_eqm_log(OldEqm))},
                 {"new_item", to_bitstring(guard_eqm_log(NewEqm))},
                 {"ext", to_bitstring(eqm_ext_log(Ext))}]},
    Map2 = Map1#{"title" => to_bitstring(Title),
                 "comments" => Comments,
                 "event_name" => to_bitstring(eqm)},
    write(Map2),
    case both of
        both ->
            case catch log_old:guard_eqm(Role,
                                         Title,
                                         OldEqm,
                                         NewEqm,
                                         Ext)
                of
                _Err = {'EXIT', _} ->
                    logger:error("日志记录时出错:~w", [_Err], log, 619),
                    ok;
                _ -> ok
            end;
        _ -> skip
    end,
    ok.

guard_astroid(Role = #role{}, Title, OldA,
              _Guard = #guard{base_id = BaseId, quality = Q,
                              astroid = NewA}) ->
    Map1 = role_to_map(Role, "custom-event"),
    Comments = {struct,
                [{"old_astroid", to_bitstring(guard_astroid_log(OldA))},
                 {"new_astroid", to_bitstring(guard_astroid_log(NewA))},
                 {"base_id", BaseId},
                 {"quality", Q}]},
    Map2 = Map1#{"title" => to_bitstring(Title),
                 "comments" => Comments,
                 "event_name" => to_bitstring(guard_astroid)},
    write(Map2),
    case both of
        both ->
            case catch log_old:guard_astroid(Role,
                                             Title,
                                             OldA,
                                             _Guard)
                of
                _Err = {'EXIT', _} ->
                    logger:error("日志记录时出错:~w", [_Err], log, 638),
                    ok;
                _ -> ok
            end;
        _ -> skip
    end,
    ok.

photo(Role = #role{}, Title, N) ->
    Map1 = role_to_map(Role, "custom-event"),
    Map2 = Map1#{"title" => to_bitstring(Title),
                 "comments" => N, "event_name" => to_bitstring(photo)},
    write(Map2),
    case both of
        both ->
            case catch log_old:photo(Role, Title, N) of
                _Err = {'EXIT', _} ->
                    logger:error("日志记录时出错:~w", [_Err], log, 650),
                    ok;
                _ -> ok
            end;
        _ -> skip
    end,
    ok.

activity(Role = #role{}, Title, OldVal, NewVal) ->
    TitleStr = case Title of
                   [_ | _] -> Title;
                   #{name := ActName} -> ActName;
                   _ -> "参与"
               end,
    Map1 = role_to_map(Role, "custom-event"),
    Comments = {struct,
                [{"old_val", OldVal}, {"new_val", NewVal}]},
    Map2 = Map1#{"title" => to_bitstring(TitleStr),
                 "event_name" => to_bitstring(activity),
                 "comments" => Comments},
    write(Map2),
    case both of
        both ->
            case catch log_old:activity(Role, Title, OldVal, NewVal)
                of
                _Err = {'EXIT', _} ->
                    logger:error("日志记录时出错:~w", [_Err], log, 673),
                    ok;
                _ -> ok
            end;
        _ -> skip
    end,
    ok.

agenda(Role = #role{},
       Args = #{name := Title, id := AgendaId,
                open_leve := OpenLev, max_try := Max}) ->
    Map1 = role_to_map(Role, "join-log"),
    [Name | _] = string:tokens(Title, "<"),
    Map2 = Map1#{"type" => to_bitstring("玩法"),
                 "name" => to_bitstring(Name), "open_leve" => OpenLev,
                 "max_try" => Max, "agenda_id" => AgendaId},
    write(Map2),
    case both of
        both ->
            case catch log_old:agenda(Role, Args) of
                _Err = {'EXIT', _} ->
                    logger:error("日志记录时出错:~w", [_Err], log, 688),
                    ok;
                _ -> ok
            end;
        _ -> skip
    end,
    ok;
agenda(_, _Cfg) ->
    logger:error("日程日志配置错误:[cfg:~w]", [_Cfg], log, 691),
    ok.

agenda_stat(_Args = #{name := Title, id := AgendaId,
                      open_leve := OpenLev, lev := Lev,
                      lev_joined := LevJoined, lev_finish := LevFinish,
                      lev_total := LevTotal}) ->
    Map1 = to_map_data(#{id => {1, "beta", 1}, name => "无",
                         account => "account", lev => 1, classes => 0},
                       "custom-event"),
    Comments = {struct,
                [{"agenda_id", AgendaId},
                 {"open_lev", OpenLev},
                 {"lev", Lev},
                 {"lev_joined", LevJoined},
                 {"lev_finish", LevFinish},
                 {"lev_total", LevTotal},
                 {"title", Title}]},
    Map2 = Map1#{"event_name" => to_bitstring(activity),
                 "comments" => Comments},
    write(Map2),
    case both of
        both ->
            case catch log_old:agenda_stat(_Args) of
                _Err = {'EXIT', _} ->
                    logger:error("日志记录时出错:~w", [_Err], log, 712),
                    ok;
                _ -> ok
            end;
        _ -> skip
    end,
    ok;
agenda_stat(_Cfg) ->
    logger:error("日程日志配置错误:[cfg:~w]", [_Cfg], log, 715),
    ok.

onlines(Onlines) ->
    logger:debug("在线统计 ~w", [Onlines], log, 721),
    Platform = env:get(platform),
    ZoneId = env:get(zone_id),
    {Y, M, D} = erlang:date(),
    {H, Min, _} = erlang:time(),
    case Min rem 5 =:= 0 of
        true ->
            Info = #{"product_name" => to_bitstring("xcqy"),
                     "header_type" => to_bitstring("online"),
                     "platform_name" => to_bitstring(Platform),
                     "gameserver_no" => ZoneId,
                     "date_time" =>
                         util:fbin("~w-~2.10.0B-~2.10.0B ~2.10.0B:~2.10.0B:~2.10.0B",
                                   [Y, M, D, H, Min, 0])},
            onlines(Onlines, Info);
        _ -> ok
    end.

onlines([], _) -> ok;
onlines([{ChannelReg, Num} | T], Map) ->
    Map2 = Map#{"channel_name" => to_bitstring(ChannelReg),
                num => Num},
    write(Map2),
    onlines(T, Map).

market(Label = log_market_silver,
       Role = #role{assets = #assets{coin = OldVal}},
       #role{assets = #assets{coin = NewVal}}, Title, Msg) ->
    do_assets(Label, Role, Title, Msg, OldVal, NewVal);
market(Label = log_market_gold,
       Role = #role{assets = #assets{gold_bind = OldVal}},
       #role{assets = #assets{gold_bind = NewVal}}, Title,
       Msg) ->
    do_assets(Label, Role, Title, Msg, OldVal, NewVal);
market(Label, _OldRole, _NRole, _Title, _Msg) ->
    logger:error("市场日志标签错误:[Label:~w]", [Label], log, 752),
    ok.

new_market(Type,
           Role = #role{id = {_, _, ZoneId}, account = Account},
           Title, TotalPrice, Num, BaseId, Price, NewStock, Fee,
           Asset, Scene) ->
    ItemName = case item_data:get(BaseId) of
                   #item_base{name = Name} -> Name ++ Scene;
                   _ -> ""
               end,
    EventType = case Type of
                    log_market_gold -> to_bitstring("金币市场");
                    _ -> to_bitstring("交易市场")
                end,
    Map1 = role_to_map(Role, "market"),
    Map2 = Map1#{"account_id" =>
                     util:fbin("~w_~ts", [ZoneId, Account]),
                 "account_name" => to_bitstring(Account),
                 "market_id" => to_bitstring(""),
                 "event_type" => EventType,
                 "event" => to_bitstring(Title), "item_id" => BaseId,
                 "item_name" => to_bitstring(ItemName),
                 "item_count" => NewStock + Num,
                 "category" =>
                     to_bitstring(assets_type_to_name(label_to_baseid(Asset))),
                 "volume_count" => Num, "final_price" => TotalPrice,
                 "unit_price" => Price, "handing_fee" => Fee,
                 "handing_type" =>
                     to_bitstring(assets_type_to_name(label_to_baseid(Asset)))},
    write(Map2),
    ok.

market_gold_server(Label, Platform, ZoneId, Title,
                   Msg) ->
    Map1 = default_map_data(Platform, ZoneId),
    Comments = {struct,
                [{"msg", Msg}, {"title", to_bitstring(Title)}]},
    Map2 = Map1#{"event_name" => to_bitstring(Label),
                 "comments" => Comments},
    write(Map2),
    case both of
        both ->
            case catch log_old:market_gold_server(Label,
                                                  Platform,
                                                  ZoneId,
                                                  Title,
                                                  Msg)
                of
                _Err = {'EXIT', _} ->
                    logger:error("日志记录时出错:~w", [_Err], log, 823),
                    ok;
                _ -> ok
            end;
        _ -> skip
    end,
    ok.

market_silver_server(Label, Platform, ZoneId, Title,
                     Msg) ->
    Map1 = default_map_data(Platform, ZoneId),
    Comments = {struct,
                [{"msg", Msg}, {"title", to_bitstring(Title)}]},
    Map2 = Map1#{"event_name" => to_bitstring(Label),
                 "comments" => Comments},
    write(Map2),
    case both of
        both ->
            case catch log_old:market_silver_server(Label,
                                                    Platform,
                                                    ZoneId,
                                                    Title,
                                                    Msg)
                of
                _Err = {'EXIT', _} ->
                    logger:error("日志记录时出错:~w", [_Err], log, 838),
                    ok;
                _ -> ok
            end;
        _ -> skip
    end,
    ok.

auto_buy(Role = #role{}, Title, Gain, Loss) ->
    Label = log_market_convenient,
    Map1 = role_to_map(Role, "custom-event"),
    Comments = {struct,
                [{"gain", Gain}, {"loss", Loss}, {"title", Title}]},
    Map2 = Map1#{"event_name" => to_bitstring(Label),
                 "comments" => Comments},
    write(Map2),
    case both of
        both ->
            case catch log_old:auto_buy(Role, Title, Gain, Loss) of
                _Err = {'EXIT', _} ->
                    logger:error("日志记录时出错:~w", [_Err], log, 855),
                    ok;
                _ -> ok
            end;
        _ -> skip
    end,
    ok.

skill_prac(NewRole = #role{}, Title, Msg, _OldRole) ->
    Map1 = role_to_map(NewRole, "custom-event"),
    Comments = {struct, [{"msg", Msg}, {"title", Title}]},
    Map2 = Map1#{"event_name" => to_bitstring(skill_prac),
                 "comments" => Comments},
    write(Map2),
    case both of
        both ->
            case catch log_old:skill_prac(NewRole,
                                          Title,
                                          Msg,
                                          _OldRole)
                of
                _Err = {'EXIT', _} ->
                    logger:error("日志记录时出错:~w", [_Err], log, 870),
                    ok;
                _ -> ok
            end;
        _ -> skip
    end,
    ok.

limit_return(Role = #role{}, Sn, Gold) ->
    Map1 = role_to_map(Role, "custom-event"),
    Comments = {struct,
                [{"gold", Gold}, {"sn", to_bitstring(Sn)}]},
    Map2 = Map1#{"event_name" => to_bitstring(limit_return),
                 "comments" => Comments},
    write(Map2),
    case both of
        both ->
            case catch log_old:limit_return(Role, Sn, Gold) of
                _Err = {'EXIT', _} ->
                    logger:error("日志记录时出错:~w", [_Err], log, 885),
                    ok;
                _ -> ok
            end;
        _ -> skip
    end,
    ok.

treasure(Role = #role{}, TypeName, UseId, ItemId,
         Val) ->
    Map1 = role_to_map(Role, "custom-event"),
    Comments = {struct,
                [{"use_id", UseId},
                 {"TypeName", to_bitstring(TypeName)},
                 {"item_id", ItemId},
                 {"val", Val}]},
    Map2 = Map1#{"event_name" => to_bitstring(treasure),
                 "comments" => Comments},
    write(Map2),
    case both of
        both ->
            case catch log_old:treasure(Role,
                                        TypeName,
                                        UseId,
                                        ItemId,
                                        Val)
                of
                _Err = {'EXIT', _} ->
                    logger:error("日志记录时出错:~w", [_Err], log, 902),
                    ok;
                _ -> ok
            end;
        _ -> skip
    end,
    ok.

achieve_shop(Role = #role{}, Operate, BeforeScore,
             Score, GoodsId, GoodsName, ShopType) ->
    Map1 = role_to_map(Role, "custom-event"),
    Comments = {struct,
                [{"operate", Operate},
                 {"before_sc", BeforeScore},
                 {"Score", Score},
                 {"goods_id", GoodsId},
                 {"goods_name", to_bitstring(GoodsName)},
                 {"shop_type", ShopType}]},
    Map2 = Map1#{"event_name" => to_bitstring(achieve_shop),
                 "comments" => Comments},
    write(Map2),
    case both of
        both ->
            case catch log_old:achieve_shop(Role,
                                            Operate,
                                            BeforeScore,
                                            Score,
                                            GoodsId,
                                            GoodsName,
                                            ShopType)
                of
                _Err = {'EXIT', _} ->
                    logger:error("日志记录时出错:~w", [_Err], log, 921),
                    ok;
                _ -> ok
            end;
        _ -> skip
    end,
    ok.

give_present(Giver = #role{}, {RID, RPlatform, RZoneId},
             ReceiverName, ItemInfo) ->
    Map1 = role_to_map(Giver, "custom-event"),
    Comments = {struct,
                [{"receiver_name", ReceiverName},
                 {"receiver_id", RID},
                 {"receiver_plat", to_bitstring(RPlatform)},
                 {"receiver_zone", RZoneId},
                 {"item_info", to_bitstring(ItemInfo)}]},
    Map2 = Map1#{"event_name" => to_bitstring(give_present),
                 "comments" => Comments},
    write(Map2),
    case both of
        both ->
            case catch log_old:give_present(Giver,
                                            {RID, RPlatform, RZoneId},
                                            ReceiverName,
                                            ItemInfo)
                of
                _Err = {'EXIT', _} ->
                    logger:error("日志记录时出错:~w", [_Err], log, 939),
                    ok;
                _ -> ok
            end;
        _ -> skip
    end,
    ok.

family(Role = #role{}, Operate,
       FmId = {FamilyId, _, _}) ->
    Map1 = role_to_map(Role, "custom-event"),
    Comments = {struct,
                [{"family_id", FamilyId},
                 {"operate", to_bitstring(Operate)}]},
    Map2 = Map1#{"event_name" => to_bitstring(family),
                 "comments" => Comments},
    write(Map2),
    case both of
        both ->
            case catch log_old:family(Role, Operate, FmId) of
                _Err = {'EXIT', _} ->
                    logger:error("日志记录时出错:~w", [_Err], log, 953),
                    ok;
                _ -> ok
            end;
        _ -> skip
    end,
    ok.

add_furnishing(Role = #role{}, FmId = {FamilyId, _, _},
               FurBaseId) ->
    Map1 = role_to_map(Role, "custom-event"),
    Comments = {struct,
                [{"family_id", FamilyId}, {"fur_base_id", FurBaseId}]},
    Map2 = Map1#{"event_name" =>
                     to_bitstring(add_furnishing),
                 "comments" => Comments},
    write(Map2),
    case both of
        both ->
            case catch log_old:add_furnishing(Role, FmId, FurBaseId)
                of
                _Err = {'EXIT', _} ->
                    logger:error("日志记录时出错:~w", [_Err], log, 968),
                    ok;
                _ -> ok
            end;
        _ -> skip
    end,
    ok.

lottery(Role = #role{},
        Lottery = #lottery{idx = Idx, item_idx = ItemIdx,
                           item_id = ItemId, item_count = ItemCount,
                           gold_type = GoldType, gold_once = GoldOnce},
        Count, Flag) ->
    Map1 = role_to_map(Role, "custom-event"),
    Comments = {struct,
                [{"idx", to_bitstring(Idx)},
                 {"item_idx", ItemIdx},
                 {"item_id", ItemId},
                 {"item_count", ItemCount},
                 {"gold_type", GoldType},
                 {"gold_once", GoldOnce},
                 {"total_gold", GoldOnce * Count},
                 {"flag", Flag},
                 {"count", Count}]},
    Map2 = Map1#{"event_name" => to_bitstring(lottery),
                 "comments" => Comments},
    write(Map2),
    case both of
        both ->
            case catch log_old:lottery(Role, Lottery, Count, Flag)
                of
                _Err = {'EXIT', _} ->
                    logger:error("日志记录时出错:~w", [_Err], log, 991),
                    ok;
                _ -> ok
            end;
        _ -> skip
    end,
    ok;
lottery(MapArgs,
        _Lottery = #lottery{idx = Idx, item_idx = ItemIdx,
                            item_id = ItemId, item_count = ItemCount,
                            gold_type = GoldType, gold_once = GoldOnce},
        Count, Flag) ->
    Map1 = to_map_data(MapArgs, "custom-event"),
    Comments = {struct,
                [{"idx", to_bitstring(Idx)},
                 {"item_idx", ItemIdx},
                 {"item_id", ItemId},
                 {"item_count", ItemCount},
                 {"gold_type", GoldType},
                 {"gold_once", GoldOnce},
                 {"total_gold", GoldOnce * Count},
                 {"flag", Flag},
                 {"count", Count}]},
    Map2 = Map1#{"event_name" => to_bitstring(lottery),
                 "comments" => Comments},
    write(Map2),
    case both of
        both ->
            case catch log_old:lottery(MapArgs,
                                       _Lottery,
                                       Count,
                                       Flag)
                of
                _Err = {'EXIT', _} ->
                    logger:error("日志记录时出错:~w", [_Err], log, 1011),
                    ok;
                _ -> ok
            end;
        _ -> skip
    end,
    ok.

log_mount(Role = #role{m_mount =
                           #m_mount{mounts = Mounts}},
          Opt, Index) ->
    case lists:keyfind(Index, #mount.index, Mounts) of
        #mount{lev = MountLev, skill_list = SkillList,
               decorate_list = DecorateList, upgrade_lev = UpgradeLev,
               live_status = Status, skill_point = SkillPoint,
               spirit = Spirit, fight_times = FightTimes,
               score = Score} ->
            SklFun = fun (#mount_skill{skill_id = SID,
                                       skill_lev = SLEV},
                          SklInfo) ->
                             SklInfo ++ util:flist("~w:~w;", [SID, SLEV]);
                         (_, SklInfo) -> SklInfo
                     end,
            SkillInfo = lists:foldl(SklFun, [], SkillList),
            DcoFun = fun (#mount_decorate{decorate_index = DcoId,
                                          decorate_base_id = DcoBaseId},
                          DcoInfo) ->
                             DcoInfo ++
                                 util:flist("~w:~w;", [DcoId, DcoBaseId]);
                         (_, DcoInfo) -> DcoInfo
                     end,
            DecorateInfo = lists:foldl(DcoFun, [], DecorateList),
            Map1 = role_to_map(Role, "custom-event"),
            Comments = {struct,
                        [{"operate", to_bitstring(Opt)},
                         {"index", Index},
                         {"status", Status},
                         {"mount_lev", MountLev},
                         {"upgrade_lev", UpgradeLev},
                         {"skill_point", SkillPoint},
                         {"skill_info", to_bitstring(SkillInfo)},
                         {"decorate_info", to_bitstring(DecorateInfo)},
                         {"spirit", Spirit},
                         {"score", Score},
                         {"fight_times", FightTimes}]},
            Map2 = Map1#{"event_name" => to_bitstring(mount),
                         "comments" => Comments},
            write(Map2),
            case both of
                both ->
                    case catch log_old:log_mount(Role, Opt, Index) of
                        _Err = {'EXIT', _} ->
                            logger:error("日志记录时出错:~w", [_Err], log, 1052),
                            ok;
                        _ -> ok
                    end;
                _ -> skip
            end,
            ok;
        _ ->
            logger:debug("==============", [], log, 1055),
            skip
    end.

classes_modify(Role = #role{}, TargetClasses) ->
    Map1 = role_to_map(Role, "custom-event"),
    Map2 = Map1#{"event_name" =>
                     to_bitstring(classes_modify),
                 "comments" => TargetClasses},
    write(Map2),
    case both of
        both ->
            case catch log_old:classes_modify(Role, TargetClasses)
                of
                _Err = {'EXIT', _} ->
                    logger:error("日志记录时出错:~w", [_Err], log, 1066),
                    ok;
                _ -> ok
            end;
        _ -> skip
    end,
    ok.

growth_fund(Role = #role{}, BuyLev) ->
    Map1 = role_to_map(Role, "custom-event"),
    Map2 = Map1#{"event_name" => to_bitstring(growth_fund),
                 "comments" => BuyLev},
    write(Map2),
    case both of
        both ->
            case catch log_old:growth_fund(Role, BuyLev) of
                _Err = {'EXIT', _} ->
                    logger:error("日志记录时出错:~w", [_Err], log, 1077),
                    ok;
                _ -> ok
            end;
        _ -> skip
    end,
    ok.

maze(Role = #role{}, Items, Des) ->
    Map1 = role_to_map(Role, "custom-event"),
    Comments = {struct,
                [{"items", to_bitstring(item_str(Items))},
                 {"des", Des}]},
    Map2 = Map1#{"event_name" => to_bitstring(maze),
                 "comments" => Comments},
    write(Map2),
    case both of
        both ->
            case catch log_old:maze(Role, Items, Des) of
                _Err = {'EXIT', _} ->
                    logger:error("日志记录时出错:~w", [_Err], log, 1093),
                    ok;
                _ -> ok
            end;
        _ -> skip
    end,
    ok.

guild_auction({Id, Platform, ZoneId}, Name, Classes,
              AuName, AuQuality, IsUnsold, IsMax, Price, GuideName,
              Lev) ->
    Map1 = to_map_data(#{id => {Id, Platform, ZoneId},
                         name => Name, account => "account", lev => Lev,
                         classes => Classes},
                       "custom-event"),
    Comments = {struct,
                [{"au_name", to_bitstring(AuName)},
                 {"au_quality", AuQuality},
                 {"is_unsold", IsUnsold},
                 {"is_max", IsMax},
                 {"price", Price},
                 {"guide_name", to_bitstring(GuideName)}]},
    Map2 = Map1#{"event_name" => to_bitstring(maze),
                 "comments" => Comments},
    write(Map2),
    case both of
        both ->
            case catch log_old:guild_auction({Id, Platform, ZoneId},
                                             Name,
                                             Classes,
                                             AuName,
                                             AuQuality,
                                             IsUnsold,
                                             IsMax,
                                             Price,
                                             GuideName,
                                             Lev)
                of
                _Err = {'EXIT', _} ->
                    logger:error("日志记录时出错:~w", [_Err], log, 1112),
                    ok;
                _ -> ok
            end;
        _ -> skip
    end,
    ok.

guild_truth_dare() ->
    LogInfoList = case guild_mgr:list_truth_dare_log() of
                      {ok, L} -> L;
                      _ -> []
                  end,
    case LogInfoList =/= 0 andalso
             length(LogInfoList) =:= guild_mgr:get_guild_num()
        of
        true ->
            guild_mgr:empty_truth_dare_log(),
            guild_truth_dare(LogInfoList, 0, []);
        _ -> ok
    end.

guild_truth_dare([], SceneSum, RoundInfoList) ->
    GuildNum = guild_mgr:get_guild_num(),
    AvgScene = SceneSum / GuildNum,
    NewRoundInfoList =
        string:join([io_lib:format("[场次：~w,~ts ]",
                                   [Scene,
                                    string:join([io_lib:format("轮次：~w，平均人数：~w",
                                                               [R,
                                                                N / GuildNum])
                                                 || {R, N} <- Info],
                                                "")])
                     || {Scene, Info} <- RoundInfoList],
                    ""),
    Platform = env:get(platform),
    ZoneId = env:get(zone_id),
    Map1 = default_map_data(Platform, ZoneId),
    Comments = {struct,
                [{"avg_scene", AvgScene},
                 {"avg_scene_info",
                  to_bitstring(util:flist(NewRoundInfoList))}]},
    Map2 = Map1#{"event_name" =>
                     to_bitstring(guild_truth_dare),
                 "comments" => Comments},
    write(Map2),
    ok;
guild_truth_dare([#guild_truth_dare_room_log{guild_id =
                                                 GuildId,
                                             scene_info = SceneInfo,
                                             truth_num = TruthNum,
                                             dare_num = DareNum,
                                             contents = Contents}
                  | T],
                 SceneSum, RoundInfoList) ->
    Name = guild_mgr:attr(GuildId, #guild.name),
    TruthRatio = case catch TruthNum / (TruthNum + DareNum)
                     of
                     {'EXIT', _} -> 0;
                     R -> R
                 end,
    DareRatio = case catch DareNum / (TruthNum + DareNum) of
                    {'EXIT', _} -> 0;
                    R1 -> R1
                end,
    NewSceneInfo =
        string:join([io_lib:format("[场次：~w,~ts ]",
                                   [Scene,
                                    string:join([io_lib:format(" 轮次：~w，人数：~w",
                                                               [R, N])
                                                 || {R, N} <- Info],
                                                "")])
                     || {Scene, Info} <- SceneInfo],
                    ""),
    NewContents =
        string:join([io_lib:format("类型：~w，内容：~ts ", [Type, C])
                     || {Type, C} <- Contents],
                    ""),
    NewSceneSum = SceneSum + length(SceneInfo),
    Fun1 = fun ({R, Num}, Acc3) ->
                   case lists:keyfind(R, 1, Acc3) of
                       {R, Num1} ->
                           lists:keyreplace(R, 1, Acc3, {R, Num1 + Num});
                       _ -> Acc3
                   end
           end,
    Fun2 = fun ({Scene, Info}, Acc2) ->
                   case lists:keyfind(Scene, 1, Acc2) of
                       {Scene, RoundInfo} ->
                           NewRoundInfo = lists:foldl(Fun1, RoundInfo, Info),
                           lists:keyreplace(Scene,
                                            1,
                                            Acc2,
                                            {Scene, NewRoundInfo});
                       _ -> util:flist([Acc2, {Scene, Info}])
                   end
           end,
    NewRoundInfoList = lists:foldl(Fun2,
                                   RoundInfoList,
                                   SceneInfo),
    Map1 = to_map_data(#{id => GuildId, name => Name,
                         account => "account", lev => 0, classes => 0},
                       "custom-event"),
    Comments = {struct,
                [{"scene", length(SceneInfo)},
                 {"scene_info", to_bitstring(util:flist(NewSceneInfo))},
                 {"truth_num", TruthNum},
                 {"dare_num", DareNum},
                 {"truth_ratio", TruthRatio},
                 {"dare_ratio", DareRatio},
                 {"content", to_bitstring(util:flist(NewContents))}]},
    Map2 = Map1#{"event_name" =>
                     to_bitstring(guild_truth_dare),
                 "comments" => Comments},
    write(Map2),
    guild_truth_dare(T, NewSceneSum, NewRoundInfoList).

-spec gold(#role{}, #role{},
           Title :: bitstring() | string(),
           Msg :: bitstring() | string(), Sn :: string(),
           Money :: integer(), IsTest :: integer()) -> ok.

gold(Role = #role{assets = #assets{gold = OldGold}},
     NRole = #role{assets = #assets{gold = NewGold}}, Title,
     Msg, Sn, Money, IsTest) ->
    Gold = NewGold - OldGold,
    logger:debug("充值--------", [], log, 1216),
    PayCategory = case IsTest of
                      0 -> 1;
                      1 -> 3;
                      _ -> 3
                  end,
    Map1 = role_to_map(NRole, "payment"),
    Map2 = Map1#{"order_id" => to_bitstring(Sn),
                 "currency_type" => to_bitstring("CNY"),
                 "currency_amount" => Money,
                 "pay_category" => PayCategory,
                 "package_name" => to_bitstring(Msg),
                 "virtual_amount" => Gold},
    write(Map2),
    assets([gold, gold_bind, 90026],
           Role,
           NRole,
           Title,
           Msg),
    case both of
        both ->
            case catch log_old:gold(Role, NRole, Title, Msg) of
                _Err = {'EXIT', _} ->
                    logger:error("日志记录时出错:~w", [_Err], log, 1235),
                    ok;
                _ -> ok
            end;
        _ -> skip
    end,
    ok.

shop(Role = #role{},
     _ShopItem = #shop_item{base_id = ItemBaseId,
                            name = Name, num = Num, assets_type = Label,
                            tab = Tab1, tab2 = Tab2},
     Costs) ->
    Map1 = role_to_map(Role, "shop"),
    {AssetsType, NewCosts} = case
                                 format:gain_to_val(#gain{label = Label,
                                                          val = Costs})
                                 of
                                 {_AssetsType, _NewCosts} ->
                                     {_AssetsType, _NewCosts};
                                 _ -> {Label, Costs}
                             end,
    Map2 = Map1#{"type" =>
                     to_bitstring(shop_mgr:shop_tab_name(Tab1, Tab2)),
                 "item_id" => ItemBaseId,
                 "item_name" => to_bitstring(Name), "item_count" => Num,
                 "category" =>
                     to_bitstring(assets_type_to_name(AssetsType)),
                 "category_count" => NewCosts},
    write(Map2),
    ok.

combat_over(Role = #role{attr = #attr{fc = Fc}},
            CombatType, WinOrLose, Round) ->
    case check_combat_type(CombatType) of
        true ->
            Map1 = role_to_map(Role, "pvp"),
            Result = case WinOrLose of
                         win -> 1;
                         _ -> 2
                     end,
            {Phase, PhaseMark} = get_phase(Role, CombatType),
            Map2 = Map1#{"type" =>
                             to_bitstring(combat_name(CombatType)),
                         "bout" => Round, "bout_result" => Result,
                         "result" => Result, "mark" => Fc,
                         "phase" => to_bitstring(Phase),
                         "phase_mark" => PhaseMark, "info" => to_bitstring("")},
            write(Map2),
            ok;
        _ -> ok
    end.

combat_round(_Combat = #combat{type = CombatType,
                               round = Round, winner = Winner,
                               loser = Loser}) ->
    case check_combat_type_round(CombatType) of
        true ->
            RoleWinner = [Fighter
                          || Fighter = #fighter{type = FighterType} <- Winner,
                             FighterType =:= 1],
            {Platform, ZoneId} = case RoleWinner of
                                     [#fighter{platform = Platform1,
                                               zone_id = ZoneId1}
                                      | _] ->
                                         {Platform1, ZoneId1};
                                     _ -> {env:get(platform), env:get(zone_id)}
                                 end,
            Map1 = to_map_data(#{id => {0, Platform, ZoneId},
                                 name => "null",
                                 account => to_bitstring("account"), lev => 1,
                                 classes => 0},
                               "pvp"),
            WinnerLev = [Lev
                         || #fighter{type = FighterType, lev = Lev} <- Winner,
                            FighterType =:= 1],
            LoserLev = [Lev
                        || #fighter{type = FighterType, lev = Lev} <- Loser,
                           FighterType =:= 1],
            Lev = WinnerLev ++ LoserLev,
            MaxLev = lists:max(Lev),
            MinLev = lists:min(Lev),
            Info = "min_lev:" ++
                       integer_to_list(MinLev) ++
                           ";max_lev:" ++ integer_to_list(MaxLev),
            Map2 = Map1#{"type" =>
                             to_bitstring(combat_name(CombatType)),
                         "bout" => Round, "bout_result" => 1, "result" => 1,
                         "mark" => 1, "phase" => to_bitstring(""),
                         "phase_mark" => 1, "info" => to_bitstring(Info)},
            write(Map2),
            ok;
        _ -> ok
    end.

chat(Role, Channel, TargetId, Msg) ->
    Map1 = role_to_map(Role, "custom-event"),
    IsSensitive = util:word_is_sensitive_kernel_3(Msg),
    Comments = {struct,
                [{"channel", to_bitstring(get_channel_name(Channel))},
                 {"target_id", to_bitstring(to_chr_id(TargetId))},
                 {"msg", to_bitstring(Msg)},
                 {"is_sensitive", IsSensitive}]},
    Map2 = Map1#{"event_name" => to_bitstring(chat),
                 "comments" => Comments},
    write(Map2),
    case lists:member(env:get(platform),
                      ["unite", "ios", "beta", "mix", "sp"])
        of
        true ->
            Data = make_data(Role, Channel, TargetId, Msg),
            log_web_3k:post(chat,
                            Data#{"callback_info" => IsSensitive});
        _ -> ok
    end,
    ok.

-spec assets(Label :: atom(), #role{}, #role{},
             Title :: bitstring() | string(),
             Msg :: bitstring() | string()) -> ok.

assets(Label = shop,
       Role = #role{assets = #assets{gold = OldVal}},
       #role{assets = #assets{gold = NewVal}}, Title, Msg)
    when OldVal =/= NewVal ->
    do_assets(Label, Role, Title, Msg, OldVal, NewVal);
assets(Label = shop,
       Role = #role{assets = #assets{gold_bind = OldVal}},
       #role{assets = #assets{gold_bind = NewVal}}, Title, Msg)
    when OldVal =/= NewVal ->
    do_assets(Label, Role, Title, Msg, OldVal, NewVal);
assets(Label = shop,
       Role = #role{assets = #assets{stars_score = OldVal}},
       #role{assets = #assets{stars_score = NewVal}}, Title,
       Msg)
    when OldVal =/= NewVal ->
    do_assets(Label, Role, Title, Msg, OldVal, NewVal);
assets(Label = shop,
       Role = #role{assets = #assets{character = OldVal}},
       #role{assets = #assets{character = NewVal}}, Title, Msg)
    when OldVal =/= NewVal ->
    do_assets(Label, Role, Title, Msg, OldVal, NewVal);
assets(Label = shop,
       Role = #role{assets = #assets{egg = OldVal}},
       #role{assets = #assets{egg = NewVal}}, Title, Msg)
    when OldVal =/= NewVal ->
    do_assets(Label, Role, Title, Msg, OldVal, NewVal);
assets(Label = shop,
       Role = #role{assets = #assets{father = OldVal}},
       #role{assets = #assets{father = NewVal}}, Title, Msg)
    when OldVal =/= NewVal ->
    do_assets(Label, Role, Title, Msg, OldVal, NewVal);
assets(Label = shop,
       Role = #role{assets = #assets{turn = OldVal}},
       #role{assets = #assets{turn = NewVal}}, Title, Msg)
    when OldVal =/= NewVal ->
    do_assets(Label, Role, Title, Msg, OldVal, NewVal);
assets(Label = log_market_gold,
       Role = #role{assets = #assets{gold_bind = OldVal}},
       #role{assets = #assets{gold_bind = NewVal}}, Title, Msg)
    when OldVal =/= NewVal ->
    do_assets(Label, Role, Title, Msg, OldVal, NewVal);
assets(Label = log_market_gold,
       Role = #role{assets = #assets{gold = OldVal}},
       #role{assets = #assets{gold = NewVal}}, Title, Msg)
    when OldVal =/= NewVal ->
    do_assets(Label, Role, Title, Msg, OldVal, NewVal);
assets(Label = gold,
       Role = #role{assets = #assets{gold = OldVal}},
       #role{assets = #assets{gold = NewVal}}, Title = "充值",
       Msg)
    when OldVal == NewVal ->
    do_assets(Label, Role, Title, Msg, OldVal, NewVal);
assets(_Label = gold,
       Role = #role{assets = #assets{gold = OldVal}},
       #role{assets = #assets{gold = NewVal}}, Title, Msg)
    when OldVal =/= NewVal ->
    do_assets(90002, Role, Title, Msg, OldVal, NewVal);
assets(_Label = gold_bind,
       Role = #role{assets = #assets{gold_bind = OldVal}},
       #role{assets = #assets{gold_bind = NewVal}}, Title, Msg)
    when OldVal =/= NewVal ->
    do_assets(90003, Role, Title, Msg, OldVal, NewVal);
assets(_Label = coin,
       Role = #role{assets = #assets{coin = OldVal}},
       #role{assets = #assets{coin = NewVal}}, Title, Msg)
    when OldVal =/= NewVal ->
    do_assets(90000, Role, Title, Msg, OldVal, NewVal);
assets(Label = log_npc_shop,
       Role = #role{assets = #assets{coin = OldVal}},
       #role{assets = #assets{coin = NewVal}}, Title, Msg)
    when OldVal =/= NewVal ->
    do_assets(Label, Role, Title, Msg, OldVal, NewVal);
assets(Label = 90010,
       Role = #role{assets = #assets{exp = OldVal}},
       #role{assets = #assets{exp = NewVal}}, Title, Msg)
    when OldVal =/= NewVal ->
    do_assets(Label, Role, Title, Msg, OldVal, NewVal);
assets(ValType = 90011,
       Role = #role{assets = #assets{guild = OldVal}},
       #role{assets = #assets{guild = NewVal}}, Title, Msg)
    when OldVal =/= NewVal ->
    do_score(Role, Title, Msg, ValType, OldVal, NewVal);
assets(ValType = 90012,
       Role = #role{assets = #assets{stars_score = OldVal}},
       #role{assets = #assets{stars_score = NewVal}}, Title,
       Msg)
    when OldVal =/= NewVal ->
    do_score(Role, Title, Msg, ValType, OldVal, NewVal);
assets(ValType = 90007,
       Role = #role{assets = #assets{character = OldVal}},
       #role{assets = #assets{character = NewVal}}, Title, Msg)
    when OldVal =/= NewVal ->
    do_score(Role, Title, Msg, ValType, OldVal, NewVal);
assets(ValType = 90014,
       Role = #role{assets = #assets{satiety = OldVal}},
       #role{assets = #assets{satiety = NewVal}}, Title, Msg)
    when OldVal =/= NewVal ->
    do_score(Role, Title, Msg, ValType, OldVal, NewVal);
assets(ValType = 90004,
       Role = #role{assets = #assets{intelligs = OldVal}},
       #role{assets = #assets{intelligs = NewVal}}, Title, Msg)
    when OldVal =/= NewVal ->
    do_score(Role, Title, Msg, ValType, OldVal, NewVal);
assets(ValType = 90017,
       Role = #role{assets = #assets{alchemy = OldVal}},
       #role{assets = #assets{alchemy = NewVal}}, Title, Msg)
    when OldVal =/= NewVal ->
    do_score(Role, Title, Msg, ValType, OldVal, NewVal);
assets(ValType = 90006,
       Role = #role{assets = #assets{energy = OldVal}},
       #role{assets = #assets{energy = NewVal}}, Title, Msg)
    when OldVal =/= NewVal ->
    do_score(Role, Title, Msg, ValType, OldVal, NewVal);
assets(ValType = 90018,
       Role = #role{assets = #assets{love = OldVal}},
       #role{assets = #assets{love = NewVal}}, Title, Msg)
    when OldVal =/= NewVal ->
    do_score(Role, Title, Msg, ValType, OldVal, NewVal);
assets(ValType = 90036,
       Role = #role{assets = #assets{brother = OldVal}},
       #role{assets = #assets{brother = NewVal}}, Title, Msg)
    when OldVal =/= NewVal ->
    do_score(Role, Title, Msg, ValType, OldVal, NewVal);
assets(ValType = 90019,
       Role = #role{assets = #assets{teacher_score = OldVal}},
       #role{assets = #assets{teacher_score = NewVal}}, Title,
       Msg)
    when OldVal =/= NewVal ->
    do_score(Role, Title, Msg, ValType, OldVal, NewVal);
assets(ValType = 90020,
       Role = #role{assets = #assets{tournament = OldVal}},
       #role{assets = #assets{tournament = NewVal}}, Title,
       Msg)
    when OldVal =/= NewVal ->
    do_score(Role, Title, Msg, ValType, OldVal, NewVal);
assets(ValType = 90024,
       Role = #role{assets = #assets{handbook_point = OldVal}},
       #role{assets = #assets{handbook_point = NewVal}}, Title,
       Msg)
    when OldVal =/= NewVal ->
    do_score(Role, Title, Msg, ValType, OldVal, NewVal);
assets(ValType = 90026,
       Role = #role{assets = #assets{star_gold = OldVal}},
       #role{assets = #assets{star_gold = NewVal}}, Title, Msg)
    when OldVal =/= NewVal ->
    do_score(Role, Title, Msg, ValType, OldVal, NewVal);
assets(ValType = 90025,
       Role = #role{assets = #assets{autumn_score = OldVal}},
       #role{assets = #assets{autumn_score = NewVal}}, Title,
       Msg)
    when OldVal =/= NewVal ->
    do_score(Role, Title, Msg, ValType, OldVal, NewVal);
assets(ValType = 90029,
       Role = #role{assets = #assets{new_year = OldVal}},
       #role{assets = #assets{new_year = NewVal}}, Title, Msg)
    when OldVal =/= NewVal ->
    do_score(Role, Title, Msg, ValType, OldVal, NewVal);
assets(ValType = 90022,
       Role = #role{assets = #assets{lottery_luck = OldVal}},
       #role{assets = #assets{lottery_luck = NewVal}}, Title,
       Msg)
    when OldVal =/= NewVal ->
    do_score(Role, Title, Msg, ValType, OldVal, NewVal);
assets(ValType = 90033,
       Role = #role{assets = #assets{firecracker = OldVal}},
       #role{assets = #assets{firecracker = NewVal}}, Title,
       Msg)
    when OldVal =/= NewVal ->
    do_score(Role, Title, Msg, ValType, OldVal, NewVal);
assets(ValType = 90035,
       Role = #role{assets = #assets{crystal = OldVal}},
       #role{assets = #assets{crystal = NewVal}}, Title, Msg)
    when OldVal =/= NewVal ->
    do_score(Role, Title, Msg, ValType, OldVal, NewVal);
assets(ValType = 90037,
       Role = #role{assets = #assets{ticket = OldVal}},
       #role{assets = #assets{ticket = NewVal}}, Title, Msg)
    when OldVal =/= NewVal ->
    do_score(Role, Title, Msg, ValType, OldVal, NewVal);
assets(ValType = 90038,
       Role = #role{assets = #assets{egg = OldVal}},
       #role{assets = #assets{egg = NewVal}}, Title, Msg)
    when OldVal =/= NewVal ->
    do_score(Role, Title, Msg, ValType, OldVal, NewVal);
assets(ValType = 90041,
       Role = #role{assets = #assets{father = OldVal}},
       #role{assets = #assets{father = NewVal}}, Title, Msg)
    when OldVal =/= NewVal ->
    do_score(Role, Title, Msg, ValType, OldVal, NewVal);
assets(ValType = 90040,
       Role = #role{assets = #assets{turn = OldVal}},
       #role{assets = #assets{turn = NewVal}}, Title, Msg)
    when OldVal =/= NewVal ->
    do_score(Role, Title, Msg, ValType, OldVal, NewVal);
assets(ValType = 90039,
       Role = #role{assets = #assets{exchange = OldVal}},
       #role{assets = #assets{exchange = NewVal}}, Title, Msg)
    when OldVal =/= NewVal ->
    do_score(Role, Title, Msg, ValType, OldVal, NewVal);
assets(ValType = 90042,
       Role = #role{assets = #assets{exchange = OldVal}},
       #role{assets = #assets{exchange = NewVal}}, Title, Msg)
    when OldVal =/= NewVal ->
    do_score(Role, Title, Msg, ValType, OldVal, NewVal);
assets(ValType = 90044,
       Role = #role{assets = #assets{dollar = OldVal}},
       #role{assets = #assets{dollar = NewVal}}, Title, Msg)
    when OldVal =/= NewVal ->
    do_score(Role, Title, Msg, ValType, OldVal, NewVal);
assets(ValType = 90045,
       Role = #role{assets = #assets{naughty = OldVal}},
       #role{assets = #assets{naughty = NewVal}}, Title, Msg)
    when OldVal =/= NewVal ->
    do_score(Role, Title, Msg, ValType, OldVal, NewVal);
assets(ValType = 90046,
       Role = #role{assets = #assets{concentric = OldVal}},
       #role{assets = #assets{concentric = NewVal}}, Title,
       Msg)
    when OldVal =/= NewVal ->
    do_score(Role, Title, Msg, ValType, OldVal, NewVal);
assets(ValType = 90047,
       Role = #role{assets = #assets{qixiIntegral = OldVal}},
       #role{assets = #assets{qixiIntegral = NewVal}}, Title,
       Msg)
    when OldVal =/= NewVal ->
    do_score(Role, Title, Msg, ValType, OldVal, NewVal);
assets(ValType = 90055,
       Role = #role{assets = #assets{skl_unique_exp = OldVal}},
       #role{assets = #assets{skl_unique_exp = NewVal}}, Title,
       Msg)
    when OldVal =/= NewVal ->
    do_score(Role, Title, Msg, ValType, OldVal, NewVal);
assets(ValType = 90061,
       Role = #role{assets = #assets{slot_machine = OldVal}},
       #role{assets = #assets{slot_machine = NewVal}}, Title,
       Msg)
    when OldVal =/= NewVal ->
    do_score(Role, Title, Msg, ValType, OldVal, NewVal);
assets(ValType = 90062,
       Role = #role{assets = #assets{reserve_gold = OldVal}},
       #role{assets = #assets{reserve_gold = NewVal}}, Title,
       Msg)
    when OldVal =/= NewVal ->
    do_score(Role, Title, Msg, ValType, OldVal, NewVal);
assets(ValType = 90063,
       Role = #role{assets = #assets{zillionaire_sc = OldVal}},
       #role{assets = #assets{zillionaire_sc = NewVal}}, Title,
       Msg)
    when OldVal =/= NewVal ->
    do_score(Role, Title, Msg, ValType, OldVal, NewVal);
assets(ValType = 90066,
       Role = #role{assets = #assets{score_exchange = OldVal}},
       #role{assets = #assets{score_exchange = NewVal}}, Title,
       Msg)
    when OldVal =/= NewVal ->
    do_score(Role, Title, Msg, ValType, OldVal, NewVal);
assets(ValType = 90067,
       Role = #role{assets = #assets{new_open_turn = OldVal}},
       #role{assets = #assets{new_open_turn = NewVal}}, Title,
       Msg)
    when OldVal =/= NewVal ->
    do_score(Role, Title, Msg, ValType, OldVal, NewVal);
assets(ValType = 90068,
       Role = #role{assets = #assets{long_active = OldVal}},
       #role{assets = #assets{long_active = NewVal}}, Title,
       Msg)
    when OldVal =/= NewVal ->
    do_score(Role, Title, Msg, ValType, OldVal, NewVal);
assets(ValType = 90069,
       Role = #role{assets = #assets{long_score = OldVal}},
       #role{assets = #assets{long_score = NewVal}}, Title,
       Msg)
    when OldVal =/= NewVal ->
    do_score(Role, Title, Msg, ValType, OldVal, NewVal);
assets([Label | T], Role, NRole, Title, Msg) ->
    assets(Label, Role, NRole, Title, Msg),
    assets(T, Role, NRole, Title, Msg);
assets(_Label, _Role, _NRole, _Title, _Msg) -> ok.

do_assets(Label, Role = #role{}, Title, Msg, OldVal,
          NewVal) ->
    Val = NewVal - OldVal,
    Map2 = case is_atom(Label) of
               false when Val =/= 0 ->
                   Map1 = role_to_map(Role, "virtual-currencies"),
                   Map1#{"project" => to_bitstring(Title),
                         "category" => to_bitstring(assets_type_to_name(Label)),
                         "info" => to_bitstring(Msg),
                         "quantity_before" => round(OldVal), "op_count" => Val};
               _ ->
                   Map1 = role_to_map(Role, "custom-event"),
                   Comments = {struct,
                               [{"msg", to_bitstring(Msg)},
                                {"old_val", OldVal},
                                {"new_val", NewVal},
                                {"title", to_bitstring(Title)}]},
                   Map1#{"event_name" => to_bitstring(Label),
                         "comments" => Comments}
           end,
    write(Map2),
    ok.

store(Role, NRole, Gain, Title) ->
    Loss = loss_log(role_gain, Role, NRole),
    ItemMsg = item_str(Gain),
    Map1 = role_to_map(NRole, "custom-event"),
    Comments = {struct,
                [{"loss", to_bitstring(Loss)},
                 {"gain", to_bitstring(ItemMsg)},
                 {"title", Title}]},
    Map2 = Map1#{"event_name" => to_bitstring(log_store),
                 "comments" => Comments},
    write(Map2),
    case both of
        both ->
            case catch log_old:store(Role, NRole, Gain, Title) of
                _Err = {'EXIT', _} ->
                    logger:error("日志记录时出错:~w", [_Err], log, 1495),
                    ok;
                _ -> ok
            end;
        _ -> skip
    end,
    ok.

do_score(Role = #role{}, Title, Msg, ValType, OldVal,
         NewVal) ->
    Val = NewVal - OldVal,
    Map1 = role_to_map(Role, "virtual-currencies"),
    Map2 = Map1#{"project" => to_bitstring(Title),
                 "category" =>
                     to_bitstring(assets_type_to_name(ValType)),
                 "info" => to_bitstring(Msg),
                 "quantity_before" => round(OldVal), "op_count" => Val},
    write(Map2),
    ok.

camp(Role = #role{}, _Role, LossItems, GainItems,
     CampHandle = #campaign_handle{camp =
                                       #camp_cfg{id = CampId,
                                                 name = CampName}}) ->
    case {LossItems, GainItems} of
        {[], []} -> ok;
        _ ->
            Map1 = role_to_map(Role, "custom-event"),
            Comments = {struct,
                        [{"loss_items", to_bitstring(item_str(LossItems))},
                         {"gain_items", to_bitstring(item_str(GainItems))},
                         {"camp_id", CampId},
                         {"camp_name", CampName}]},
            Map2 = Map1#{"event_name" => to_bitstring(camp),
                         "comments" => Comments},
            write(Map2),
            case both of
                both ->
                    case catch log_old:camp(Role,
                                            _Role,
                                            LossItems,
                                            GainItems,
                                            CampHandle)
                        of
                        _Err = {'EXIT', _} ->
                            logger:error("日志记录时出错:~w", [_Err], log, 1530),
                            ok;
                        _ -> ok
                    end;
                _ -> skip
            end,
            ok
    end.

-spec camp_web(#role{}, #role{}, list(), list(),
               #camp_handle{}) -> ok.

camp_web(Role = #role{assets = #assets{gold = OldGold}},
         _Role = #role{assets = #assets{gold = NewGold}},
         LossItems, GainItems,
         CampHandle = #camp_handle{menu =
                                       #camp_web_menu{title = Title},
                                   camp = #camp_web{str1 = Str}}) ->
    case LossItems of
        [] when NewGold =:= OldGold -> ok;
        _ ->
            Gold = NewGold - OldGold,
            Map1 = role_to_map(Role, "custom-event"),
            Comments = {struct,
                        [{"loss_items", to_bitstring(item_str(LossItems))},
                         {"gain_items", to_bitstring(item_str(GainItems))},
                         {"old_gold", OldGold},
                         {"new_gold", NewGold},
                         {"gold", Gold},
                         {"title", Title},
                         {"str", Str}]},
            Map2 = Map1#{"event_name" => to_bitstring(camp),
                         "comments" => Comments},
            write(Map2),
            case both of
                both ->
                    case catch log_old:camp_web(Role,
                                                _Role,
                                                LossItems,
                                                GainItems,
                                                CampHandle)
                        of
                        _Err = {'EXIT', _} ->
                            logger:error("日志记录时出错:~w", [_Err], log, 1557),
                            ok;
                        _ -> ok
                    end;
                _ -> skip
            end,
            ok
    end.

drop(Role, GL, Title, Msg) ->
    drop(drop,
         Role,
         [G || G = #gain{ext = {drop, _}} <- GL],
         Title,
         Msg).

drop(Label,
     Role = #role{attr = #attr{fc = Fc},
                  pos = #pos{map_base_id = MapBaseId}},
     GL = [_ | _], Title, Msg) ->
    case item_str(GL) of
        "" -> ok;
        ItemMsg ->
            Map1 = role_to_map(Role, "custom-event"),
            Comments = {struct,
                        [{"fc", to_bitstring(Fc)},
                         {"map_id", MapBaseId},
                         {"msg", Msg},
                         {"item_msg", ItemMsg},
                         {"title", to_bitstring(Title)}]},
            Map2 = Map1#{"event_name" => to_bitstring(Label),
                         "comments" => Comments},
            write(Map2),
            case both of
                both ->
                    case catch log_old:drop(Label, Role, GL, Title, Msg) of
                        _Err = {'EXIT', _} ->
                            logger:error("日志记录时出错:~w", [_Err], log, 1583),
                            ok;
                        _ -> ok
                    end;
                _ -> skip
            end,
            ok
    end;
drop(_Label, _Role, _GL, _Title, _Msg) -> ok.

mail(new,
     _Mail = #mail{sess = {SessId, SessP, SessZ},
                   to = {ToId, ToP, ToZ}, title = Title, content = Content,
                   item_list = Items}) ->
    Map1 = to_map_data(#{id => {ToId, ToP, ToZ},
                         name => to_bitstring("无"), account => "account",
                         lev => 1, classes => 0},
                       "mail"),
    ContentList = re:split(Content,
                           lang:get("\n"),
                           [{return, list}, unicode]),
    ContentList2 = [I ++ ["[换行]"] || I <- ContentList],
    NewContent = lists:append(ContentList2),
    MailSess = to_chr_id({SessId, SessP, SessZ}),
    Map2 = Map1#{"title" => to_bitstring(Title),
                 "content" => to_bitstring(NewContent),
                 "options" => to_bitstring(item_str(Items)),
                 "op_type" => to_bitstring(new),
                 "info" => to_bitstring(MailSess)},
    write(Map2),
    case both of
        both ->
            case catch log_old:mail(new, _Mail) of
                _Err = {'EXIT', _} ->
                    logger:error("日志记录时出错:~w", [_Err], log, 1606),
                    ok;
                _ -> ok
            end;
        _ -> skip
    end,
    ok.

mail(mark, Role = #role{},
     _Mail = #mail{sess = {SessId, SessP, SessZ},
                   title = Title, content = Content, item_list = Items}) ->
    Map1 = role_to_map(Role, "mail"),
    ContentList = re:split(Content,
                           lang:get("\n"),
                           [{return, list}, unicode]),
    ContentList2 = [I ++ ["[换行]"] || I <- ContentList],
    NewContent = lists:append(ContentList2),
    MailSess = to_chr_id({SessId, SessP, SessZ}),
    Map2 = Map1#{"title" => to_bitstring(Title),
                 "content" => to_bitstring(NewContent),
                 "options" => to_bitstring(item_str(Items)),
                 "op_type" => to_bitstring(new),
                 "info" => to_bitstring(MailSess)},
    write(Map2),
    case both of
        both ->
            case catch log_old:mail(mark, Role, _Mail) of
                _Err = {'EXIT', _} ->
                    logger:error("日志记录时出错:~w", [_Err], log, 1624),
                    ok;
                _ -> ok
            end;
        _ -> skip
    end,
    ok;
mail(guild_mail, Role = #role{},
     _Mail = #mail{sess = {SessId, SessP, SessZ},
                   title = Title, content = Content, item_list = Items}) ->
    Map1 = role_to_map(Role, "mail"),
    ContentList = re:split(Content,
                           lang:get("\n"),
                           [{return, list}, unicode]),
    ContentList2 = [I ++ ["[换行]"] || I <- ContentList],
    NewContent = lists:append(ContentList2),
    MailSess = to_chr_id({SessId, SessP, SessZ}),
    Map2 = Map1#{"title" => to_bitstring(Title),
                 "content" => to_bitstring(NewContent),
                 "options" => to_bitstring(item_str(Items)),
                 "op_type" => to_bitstring(new),
                 "info" => to_bitstring(MailSess)},
    write(Map2),
    case both of
        both ->
            case catch log_old:mail(guild_mail, Role, _Mail) of
                _Err = {'EXIT', _} ->
                    logger:error("日志记录时出错:~w", [_Err], log, 1642),
                    ok;
                _ -> ok
            end;
        _ -> skip
    end,
    ok;
mail(recv_rewards, Role = #role{},
     _Mail = #mail{sess = {SessId, SessP, SessZ},
                   title = Title, content = Content, item_list = Items}) ->
    Map1 = role_to_map(Role, "mail"),
    ContentList = re:split(Content,
                           lang:get("\n"),
                           [{return, list}, unicode]),
    ContentList2 = [I ++ ["[换行]"] || I <- ContentList],
    NewContent = lists:append(ContentList2),
    MailSess = to_chr_id({SessId, SessP, SessZ}),
    Map2 = Map1#{"title" => to_bitstring(Title),
                 "content" => to_bitstring(NewContent),
                 "options" => to_bitstring(item_str(Items)),
                 "op_type" => to_bitstring(new),
                 "info" => to_bitstring(MailSess)},
    write(Map2),
    case both of
        both ->
            case catch log_old:mail(recv_rewards, Role, _Mail) of
                _Err = {'EXIT', _} ->
                    logger:error("日志记录时出错:~w", [_Err], log, 1660),
                    ok;
                _ -> ok
            end;
        _ -> skip
    end,
    ok.

item(Role, Title) ->
    case both of
        both ->
            case catch log_old:item(Role, Title) of
                _Err = {'EXIT', _} ->
                    logger:error("日志记录时出错:~w", [_Err], log, 1667),
                    ok;
                _ -> ok
            end;
        _ -> skip
    end,
    Items = [{BaseId, Num}
             || {shop_item, BaseId, Num, _Price, _BuyType, _Tab}
                    <- get(shop_auto_buy_items)],
    GainItems = get(role_gain_items) ++ Items,
    LossItems = get(role_loss_items) ++
                    get(role_loss_auto_buy_items),
    Map1 = role_to_map(Role, "virtual-items"),
    Map2 = Map1#{"type_name" => to_bitstring(Title)},
    item_gain(GainItems, Map2),
    item_loss(LossItems, Map2).

item_gain([{BaseId, Num} | T], Map1) ->
    write(Map1#{item_id => BaseId, op_count => Num,
                item_name => to_bitstring(item:attr(name, BaseId))}),
    item_gain(T, Map1);
item_gain([{BaseId, _, Num} | T], Map1) ->
    write(Map1#{item_id => BaseId, op_count => Num,
                item_name => to_bitstring(item:attr(name, BaseId))}),
    item_gain(T, Map1);
item_gain([#item{base_id = BaseId, quantity = Num} | T],
          Map1) ->
    write(Map1#{item_id => BaseId, op_count => Num,
                item_name => to_bitstring(item:attr(name, BaseId))}),
    item_gain(T, Map1);
item_gain([BaseId | T], Map1) when is_integer(BaseId) ->
    Num = 1,
    write(Map1#{item_id => BaseId, op_count => Num,
                item_name => to_bitstring(item:attr(name, BaseId))}),
    item_gain(T, Map1);
item_gain([#gain{label = item_base_id, val = Val} | T],
          Map1) ->
    item_gain(Val, Map1),
    item_gain(T, Map1);
item_gain([#gain{label = items, val = Val} | T],
          Map1) ->
    item_gain(Val, Map1),
    item_gain(T, Map1);
item_gain([#gain{label = Label, val = Num} | T],
          Map1) ->
    BaseId = label_to_baseid(Label),
    Map2 = Map1#{item_id => BaseId, op_count => Num,
                 item_name => to_bitstring(item:attr(name, BaseId))},
    write(Map2),
    item_gain(T, Map1);
item_gain([_H | T], Map1) ->
    logger:error("未知道具类型 ~w", [_H], log, 1708),
    item_gain(T, Map1);
item_gain(_Role, _Items) -> ok.

item_gain(Role = #role{}, Items = [_ | _], Title) ->
    Map1 = role_to_map(Role, "virtual-items"),
    Map2 = Map1#{"type_name" => to_bitstring(Title)},
    item_gain(Items, Map2);
item_gain(_Role, _Items, _Title) -> ok.

item_loss([{BaseId, Num} | T], Map1) ->
    write(Map1#{item_id => BaseId, op_count => -Num,
                item_name => to_bitstring(item:attr(name, BaseId))}),
    item_loss(T, Map1);
item_loss([{BaseId, _, Num} | T], Map1) ->
    write(Map1#{item_id => BaseId, op_count => -Num,
                item_name => to_bitstring(item:attr(name, BaseId))}),
    item_loss(T, Map1);
item_loss([#item{base_id = BaseId, quantity = Num} | T],
          Map1) ->
    write(Map1#{item_id => BaseId, op_count => -Num,
                item_name => to_bitstring(item:attr(name, BaseId))}),
    item_loss(T, Map1);
item_loss([BaseId | T], Map1) when is_integer(BaseId) ->
    Num = 1,
    write(Map1#{item_id => BaseId, op_count => -Num,
                item_name => to_bitstring(item:attr(name, BaseId))}),
    item_loss(T, Map1);
item_loss([#loss{label = item_base_id, val = Val} | T],
          Map1) ->
    item_loss(Val, Map1),
    item_loss(T, Map1);
item_loss([#loss{label = items, val = Val} | T],
          Map1) ->
    item_loss(Val, Map1),
    item_loss(T, Map1);
item_loss([#loss{label = Label, val = Num} | T],
          Map1) ->
    BaseId = label_to_baseid(Label),
    Map2 = Map1#{item_id => BaseId, op_count => -Num,
                 item_name => to_bitstring(item:attr(name, BaseId))},
    write(Map2),
    item_loss(T, Map1);
item_loss([_H | T], Map1) ->
    logger:error("未知道具类型 ~w", [_H], log, 1749),
    item_loss(T, Map1);
item_loss(_Role, _Items) -> ok.

item_loss(Role = #role{}, Items = [_ | _], Title) ->
    Map1 = role_to_map(Role, "virtual-items"),
    Map2 = Map1#{"type_name" => to_bitstring(Title)},
    item_loss(Items, Map2);
item_loss(_Role, _Items, _Title) -> ok.

talisman(Role = #role{m_talisman =
                          #m_talisman{fusion_lev = FuSionLev,
                                      fusion_val = FusionVal}},
         Title) ->
    GainTalismans = get(role_gain_talisman),
    case GainTalismans of
        [_ | _] ->
            ItemsMap = role_to_map(Role, "virtual-items"),
            TalismanItems = [{BaseId, 1}
                             || #talisman{base_id = BaseId} <- GainTalismans],
            item_gain(TalismanItems,
                      ItemsMap#{type_name => to_bitstring(Title)}),
            TalismanStr = talisman_str(GainTalismans),
            Map1 = role_to_map(Role, "custom-event"),
            Comments = {struct,
                        [{"title", to_bitstring(Title)},
                         {"fusion_lev", FuSionLev},
                         {"fusion_val", FusionVal},
                         {"talisman_str", to_bitstring(TalismanStr)}]},
            Map2 = Map1#{"event_name" => to_bitstring(talisman),
                         "comments" => Comments},
            write(Map2),
            case both of
                both ->
                    case catch log_old:talisman(Role, Title) of
                        _Err = {'EXIT', _} ->
                            logger:error("日志记录时出错:~w", [_Err], log, 1788),
                            ok;
                        _ -> ok
                    end;
                _ -> skip
            end,
            ok;
        _ -> ok
    end.

talisman(Role = #role{m_talisman =
                          #m_talisman{fusion_lev = FuSionLev,
                                      fusion_val = FusionVal}},
         Title, LossTalisman) ->
    TalismanStr = talisman_str(LossTalisman),
    Map1 = role_to_map(Role, "custom-event"),
    Comments = {struct,
                [{"title", to_bitstring(Title)},
                 {"fusion_lev", FuSionLev},
                 {"fusion_val", FusionVal},
                 {"talisman_str", to_bitstring(TalismanStr)}]},
    Map2 = Map1#{"event_name" => to_bitstring(talisman),
                 "comments" => Comments},
    write(Map2),
    case both of
        both ->
            case catch log_old:talisman(Role, Title, LossTalisman)
                of
                _Err = {'EXIT', _} ->
                    logger:error("日志记录时出错:~w", [_Err], log, 1809),
                    ok;
                _ -> ok
            end;
        _ -> skip
    end,
    ok.

talisman(Role = #role{m_talisman =
                          #m_talisman{fusion_lev = FuSionLev,
                                      fusion_val = FusionVal}},
         Title, Talisman1, Talisman2) ->
    TalismanStr1 = talisman_str(Talisman1),
    TalismanStr2 = talisman_str(Talisman2),
    Map1 = role_to_map(Role, "custom-event"),
    Comments = case Title of
                   "重塑" ->
                       [talisman(Role, "被重塑", LossTalisman)
                        || LossTalisman <- Talisman1],
                       Comments1 = {struct,
                                    [{"title", to_bitstring(Title)},
                                     {"fusion_lev", FuSionLev},
                                     {"fusion_val", FusionVal},
                                     {"talisman_str",
                                      to_bitstring(TalismanStr2)}]},
                       Comments1;
                   _ ->
                       Comments2 = {struct,
                                    [{"title", to_bitstring(Title)},
                                     {"fusion_lev", FuSionLev},
                                     {"fusion_val", FusionVal},
                                     {"talisman_str1",
                                      to_bitstring(TalismanStr1)},
                                     {"talisman_str2",
                                      to_bitstring(TalismanStr2)}]},
                       Comments2
               end,
    Map2 = Map1#{"event_name" => to_bitstring(talisman),
                 "comments" => Comments},
    write(Map2),
    case both of
        both ->
            case catch log_old:talisman(Role,
                                        Title,
                                        Talisman1,
                                        Talisman2)
                of
                _Err = {'EXIT', _} ->
                    logger:error("日志记录时出错:~w", [_Err], log, 1846),
                    ok;
                _ -> ok
            end;
        _ -> skip
    end,
    ok;
talisman(_, _, _, _) -> ok.

exp(Role = #role{lev = Lev,
                 assets = #assets{exp = Exp}},
    Role = #role{lev = NewLev,
                 assets = #assets{exp = NewExp}},
    Title, Msg)
    when NewLev >= 40 andalso
             (NewLev > Lev orelse NewExp - Exp > 10000) ->
    AddExp = calc_get_exp(Lev, NewLev, Exp, NewExp, 0),
    Map2 = case AddExp > 0 of
               true ->
                   Map1 = role_to_map(Role, "virtual-currencies"),
                   Map1#{"project" => to_bitstring(Title),
                         "category" => to_bitstring(assets_type_to_name(90010)),
                         "info" => to_bitstring(Msg),
                         "quantity_before" => round(Exp), "op_count" => AddExp};
               _ ->
                   Map1 = role_to_map(Role, "custom-event"),
                   Comments = {struct,
                               [{"project", to_bitstring(Title)},
                                {"category",
                                 to_bitstring(assets_type_to_name(90010))},
                                {"info", to_bitstring(Msg)},
                                {"quantity_before", round(Exp)},
                                {"op_count", AddExp}]},
                   Map1#{"comments" => Comments,
                         "event_name" => to_bitstring(exp)}
           end,
    write(Map2),
    case both of
        both ->
            case catch log_old:exp(Role, Title, Msg) of
                _Err = {'EXIT', _} ->
                    logger:error("日志记录时出错:~w", [_Err], log, 1879),
                    ok;
                _ -> ok
            end;
        _ -> skip
    end,
    ok;
exp(_Role, _NewRole, _Title, _Msg) -> ok.

calc_get_exp(Lev, Lev, Exp, NewExp, AddExp) ->
    NewExp - Exp + AddExp;
calc_get_exp(Lev, NewLev, Exp, NewExp, AddExp)
    when NewLev > Lev ->
    calc_get_exp(Lev,
                 NewLev - 1,
                 Exp,
                 levup_data:get(NewLev - 1),
                 AddExp + NewExp);
calc_get_exp(_Lev, _NewLev, _Exp, _NewExp, AddExp) ->
    AddExp.

rank([], _RankType) -> ok;
rank([RankRc = #rank_rc{} | Rest], RankType) ->
    rank(RankRc, RankType),
    rank(Rest, RankType);
rank(RankRc = #rank_rc{rank = Rank, val1 = Val1,
                       val2 = Val2, val3 = Val3, val4 = Val4},
     RankType) ->
    Map1 = to_map_data(RankRc, "rank-list"),
    Comments = {struct,
                [{"val1", Val1},
                 {"val2", Val2},
                 {"val3", Val3},
                 {"val4", Val4}]},
    Map2 = Map1#{"rank" => Rank, "value" => Val1,
                 "comments" => to_bitstring(Comments),
                 "type" => to_bitstring(rank:type_name(RankType))},
    write(Map2),
    ok.

write(Msg) ->
    case get(log_transaction) of
        undefined -> gen_server:cast(log, {write, Msg});
        [] -> gen_server:cast(log, {write, Msg});
        [H] -> put(log_transaction, [[Msg | H]]);
        [H | T] -> put(log_transaction, [[Msg | H] | T])
    end.

trans_begin() ->
    case get(is_role_process) of
        true ->
            put(log_transaction, [[] | get(log_transaction)]);
        _ ->
            logger:error("不能在非角色进程内使用日志缓冲区", [], log, 1924),
            ignore
    end,
    ok.

trans_flush() ->
    case get(log_transaction) of
        [] ->
            logger:error("写入日志数据时发生异常:缓冲区为空: ~w",
                         [util:get_stacktrace()],
                         log,
                         1932);
        [[]] -> put(log_transaction, []);
        [H] ->
            put(log_transaction, []),
            [write(Msg) || Msg <- H];
        [H, H1 | T] ->
            put(log_transaction,
                [lists:concat([lists:reverse(H), H1]) | T]);
        [H | T] ->
            put(log_transaction,
                [lists:concat([lists:reverse(H), T])])
    end,
    ok.

trans_clean() ->
    case get(log_transaction) of
        [] -> logger:error("日志事务数据时发生异常:缓冲区为空", [], log, 1948);
        [_H] -> put(log_transaction, []);
        [_H | T] -> put(log_transaction, T)
    end,
    ok.

do_record(Label, Rec, Flag = true)
    when not is_list(Rec) ->
    do_record(Label, [Rec], Flag);
do_record(pet, Pets, true) ->
    [Pet#pet{attr = undefined, pet_attr = undefined}
     || Pet <- Pets];
do_record(_, _, _Flag) -> "".

child_log(Childs) when is_list(Childs) ->
    string:join([util:to_list(child_log(Child))
                 || Child <- Childs],
                "");
child_log(#child{id = {Id, P, Z}, name = Name,
                 base_id = BaseId, sex = Sex, classes = Classes,
                 embryo = Embryo, pregnant_time = PregnantTime,
                 birth_time = BirthTime, stage = 3,
                 ext_growth = ExtGrowth, growth_type = GrowthType,
                 skills = Skills, talent_skills = TalentSkills,
                 add_point = AddPoint, grade_attr = GradeAttr,
                 grade = Grade, stones = Stones, use_growth = UseGrowth,
                 talent = Talent,
                 child_attr =
                     #child_attr{max_hp_apt_used = HpUsed,
                                 max_phy_apt_used = PhyUsed,
                                 max_pdef_apt_used = PdefUsed,
                                 max_magic_apt_used = MagicUsed,
                                 max_aspd_apt_used = AspdUsed,
                                 hp_aptitude = HpApt, phy_aptitude = PhyApt,
                                 pdef_aptitude = PdefApt,
                                 magic_aptitude = MagicApt,
                                 aspd_aptitude = AspdApt,
                                 max_hp_aptitude = MaxHpApt,
                                 max_phy_aptitude = MaxPhyApt,
                                 max_pdef_aptitude = MaxPdefApt,
                                 max_magic_aptitude = MaxMagicApt,
                                 max_aspd_aptitude = MaxAspdApt}}) ->
    SkillStr = string:join([io_lib:format("[技能:~ts,~w,~w]",
                                          [child_skill:skill_name(SId),
                                           SId,
                                           Source])
                            || #child_skill{id = SId, source = Source}
                                   <- Skills],
                           ""),
    SkillStr2 =
        string:join([io_lib:format("[天赋技能:~ts,~w,~w,~w]",
                                   [child_talent:skill_name(SId),
                                    SId,
                                    Lev,
                                    Exp])
                     || #child_talent_skill{id = SId, lev = Lev, exp = Exp}
                            <- TalentSkills],
                    ""),
    StoneStr = string:join([io_lib:format("[装备:~ts,~w,~ts]",
                                          [item:attr(name, ItemBaseId),
                                           ItemBaseId,
                                           attr_log(StoneAttr)])
                            || #child_stone{base_id = ItemBaseId,
                                            attr = StoneAttr}
                                   <- Stones],
                           ""),
    util:flist("[~ts][成年期:~w][~w:~ts:~w][性别:~w][职业:~w][孕育方式:~"
               "w][受孕时间:~w][出生时间:~w][天资:~w][额外成长:~w][成长类型:~w]"
               "[额外属性点:~w][阶数:~w][成长丹:~w][已用资质:~w,~w,~w,~w,~w"
               "][当前资质:~w,~w,~w,~w,~w][资质上限:~w,~w,~w,~w,~w][进"
               "阶属性:~ts][技能:~ts][天赋技能:~ts][装备:~ts]",
               [Name,
                BaseId,
                Id,
                P,
                Z,
                Sex,
                Classes,
                Embryo,
                PregnantTime,
                BirthTime,
                Talent,
                ExtGrowth,
                GrowthType,
                AddPoint,
                Grade,
                UseGrowth,
                HpUsed,
                PhyUsed,
                PdefUsed,
                MagicUsed,
                AspdUsed,
                HpApt,
                PhyApt,
                PdefApt,
                MagicApt,
                AspdApt,
                MaxHpApt,
                MaxPhyApt,
                MaxPdefApt,
                MaxMagicApt,
                MaxAspdApt,
                attr_log(GradeAttr),
                SkillStr,
                SkillStr2,
                StoneStr]);
child_log(#child{id = {Id, P, Z}, name = Name,
                 base_id = BaseId, sex = Sex, classes = Classes,
                 embryo = Embryo, pregnant_time = PregnantTime,
                 birth_time = BirthTime, stage = 2, maturity = Maturity,
                 study_easy = StudyEasy, study_hard = StudyHard,
                 day_easy = DayEasy, day_hard = DayHard,
                 study_easy_time = StudyEasyTime,
                 study_hard_time = StudyHardTime,
                 child_attr =
                     #child_attr{study_str = StudyStr, study_con = StudyCon,
                                 study_mag = StudyMag, study_agi = StudyAgi,
                                 study_end = StudyEnd}}) ->
    util:flist("[~ts][幼儿期:~w][~w:~ts:~w][性别:~w][职业:~w][孕育方式:~"
               "w][受孕时间:~w][出生时间:~w][发育值:~w][课程次数:~w,~w][今日次数"
               ":~w,~w][上次时间:~w,~w][课程:~w,~w,~w,~w,~w]",
               [Name,
                BaseId,
                Id,
                P,
                Z,
                Sex,
                Classes,
                Embryo,
                PregnantTime,
                BirthTime,
                Maturity,
                StudyEasy,
                StudyHard,
                DayEasy,
                DayHard,
                StudyEasyTime,
                StudyHardTime,
                StudyStr,
                StudyCon,
                StudyMag,
                StudyAgi,
                StudyEnd]);
child_log(#child{id = {Id, P, Z}, name = Name,
                 base_id = BaseId, sex = Sex, classes = Classes,
                 embryo = Embryo, pregnant_time = PregnantTime,
                 birth_time = BirthTime, stage = 1,
                 maturity = Maturity}) ->
    util:flist("[~ts][幼儿期~w][~w:~ts:~w][性别:~w][职业:~w][孕育方式:~w"
               "][受孕时间:~w][出生时间:~w][发育值:~w]",
               [Name,
                BaseId,
                Id,
                P,
                Z,
                Sex,
                Classes,
                Embryo,
                PregnantTime,
                BirthTime,
                Maturity]);
child_log(_) -> not_child_record.

pet_log(Pets) when is_list(Pets) ->
    string:join([util:to_list(pet_log(Pet)) || Pet <- Pets],
                "");
pet_log(#pet{id = Id, name = Name, base_id = BaseId,
             lev = Lev, exp = Exp, talent = Talent, growth = Growth,
             feed_point = FeedPoint, genre = Genre,
             pet_attr =
                 #pet_attr{max_hp_apt_used = HpUsed,
                           max_phy_apt_used = PhyUsed,
                           max_pdef_apt_used = PdefUsed,
                           max_magic_apt_used = MagicUsed,
                           max_aspd_apt_used = AspdUsed, hp_aptitude = HpApt,
                           phy_aptitude = PhyApt, pdef_aptitude = PdefApt,
                           magic_aptitude = MagicApt, aspd_aptitude = AspdApt,
                           max_hp_aptitude = MaxHpApt,
                           max_phy_aptitude = MaxPhyApt,
                           max_pdef_aptitude = MaxPdefApt,
                           max_magic_aptitude = MaxMagicApt,
                           max_aspd_aptitude = MaxAspdApt},
             skills = Skills, grade = Grade, grade_attr = GradeAttr,
             stones = Stones, pet_rune = Runes}) ->
    SkillStr = string:join([io_lib:format("[技能:~ts,~w,~w]",
                                          [pet_skill:skill_name(SId),
                                           SId,
                                           Source])
                            || #pet_skill{id = SId, source = Source} <- Skills],
                           ""),
    StoneStr = string:join([io_lib:format("[符石:~ts,~w]",
                                          [item:attr(name, ItemBaseId),
                                           ItemBaseId])
                            || #item{base_id = ItemBaseId} <- Stones],
                           ""),
    RuneStr1 =
        string:join([io_lib:format("[普通内丹:~ts,等级:~w,状态:~ts]",
                                   [pet_rune:rune_name(RuneId),
                                    RuneLev,
                                    convert_rune(RuneStatus, Resonance)])
                     || #pet_rune{rune_id = RuneId, rune_status = RuneStatus,
                                  rune_lev = RuneLev, is_resonance = Resonance,
                                  rune_type = 1}
                            <- Runes],
                    ""),
    RuneStr2 =
        string:join([io_lib:format("[高级内丹:~ts,等级:~w,状态:~ts,共鸣技能:~ts]",
                                   [pet_rune:rune_name(RuneId),
                                    RuneLev,
                                    convert_rune(RuneStatus),
                                    convert_resonance(Resonances)])
                     || #pet_rune{rune_id = RuneId, rune_status = RuneStatus,
                                  rune_lev = RuneLev, resonances = Resonances,
                                  rune_type = 2}
                            <- Runes],
                    ""),
    util:flist("[~ts:~w:~w][等级:~w][经验:~w][天资:~w][成长:~w][类型:~w"
               "][进阶次数:~w][进阶属性:~ts][使用兽王丹:~w][已使用资质丹:~w,~w,~"
               "w,~w,~w][当前资质:~w,~w,~w,~w,~w][资质上限:~w,~w,~w,~"
               "w,~w]~ts~ts~ts~ts",
               [Name,
                Id,
                BaseId,
                Lev,
                Exp,
                Talent,
                Growth,
                Genre,
                Grade,
                attr_log(GradeAttr),
                FeedPoint,
                HpUsed,
                PhyUsed,
                PdefUsed,
                MagicUsed,
                AspdUsed,
                HpApt,
                PhyApt,
                PdefApt,
                MagicApt,
                AspdApt,
                MaxHpApt,
                MaxPhyApt,
                MaxPdefApt,
                MaxMagicApt,
                MaxAspdApt,
                StoneStr,
                SkillStr,
                RuneStr1,
                RuneStr2]);
pet_log(_Pet) -> not_pet_record.

item_log(#item{base_id = BaseId, craft = Craft,
               enchant = Enchant, quantity = Quantity,
               reset_attr = BackUpAttr, quality = Quality, attr = Attr,
               growth_lev = GrowthLev, growth_val = GrowthVal,
               extra = Extra}) ->
    Name = item:attr(name, BaseId),
    util:flist("[~ts:~w:~w][品质:~ts][前缀:~ts][强化:~w][成长等级:~w][成"
               "长值:~w][属性:~ts][备份属性:~ts][额外属性:~w]",
               [Name,
                BaseId,
                Quantity,
                notice:quality_name(Quality),
                notice:craft_name(Craft),
                Enchant,
                GrowthLev,
                GrowthVal,
                attr_log(Attr),
                attr_log(BackUpAttr),
                Extra]);
item_log(_Item) -> not_item_record.

item_log2(#item{base_id = BaseId,
                reset_attr = BackUpAttr, quantity = Quantity,
                attr = Attr, extra = Extra}) ->
    Name = item:attr(name, BaseId),
    util:flist("{[~ts:~w:~w][属性:~ts][备份属性:~ts][额外属性:~w]}",
               [Name,
                BaseId,
                Quantity,
                attr_log(Attr),
                attr_log(BackUpAttr),
                Extra]);
item_log2(_Item) -> "not_item_record".

guard_eqm_log(#guard_eqm{base_id = BaseId,
                         eqm_attrs = EqmAttrs, reset_attrs = BackUpAttrs,
                         gem = Gem}) ->
    Name = item:attr(name, BaseId),
    util:flist("[~ts:~w][属性:~ts][备份属性:~ts][宝石:~ts]",
               [Name,
                BaseId,
                attr_log(EqmAttrs),
                attr_log(BackUpAttrs),
                guard_gem_log(Gem)]);
guard_eqm_log(_Item) -> not_item_record.

guard_astroid_log(#guard_astroid{growth = Growth,
                                 active = Active, skills = Skills,
                                 aroused = Aroused}) ->
    util:flist("[成长:~w][激活:~w][技能:~w][充能:~ts]",
               [Growth, Active, Skills, guard_astroid_star(Aroused)]);
guard_astroid_log(_Item) -> not_item_record.

guard_astroid_star(Stars) ->
    string:join([io_lib:format("[ID:~w,等级:~w,经验:~w]",
                               [Id, Lev, Exp])
                 || #guard_astroid_star{id = Id, lev = Lev, exp = Exp}
                        <- Stars],
                "").

eqm_ext_log({enchant, Ratio, IsProtect}) ->
    util:flist("[成功率:~w][保护符:~w]", [Ratio, IsProtect]);
eqm_ext_log({stone_skill, Attr}) -> attr_log(Attr);
eqm_ext_log(_) -> "".

guard_gem_log(Gem) ->
    string:join([io_lib:format("[ID:~w,类型:~w,等级:~w]",
                               [BaseId, Type, Lev])
                 || #guard_eqm_gem{base_id = BaseId, type = Type,
                                   lev = Lev}
                        <- Gem],
                "").

attr_log(Attr) ->
    string:join([io_lib:format("[类:~ts,标识:~w,值:~ts]",
                               [notice:to_attr_type(Type),
                                Flag,
                                notice:to_attr_msg(Name, Val)])
                 || #attr_base{type = Type, name = Name, flag = Flag,
                               val = Val}
                        <- Attr],
                "").

talisman_str("") -> "null";
talisman_str(Talismans) when is_list(Talismans) ->
    Fun = fun (Talisman, L1) ->
                  case talisman_str(Talisman) of
                      "" -> L1;
                      S -> [S | L1]
                  end
          end,
    L = lists:foldl(Fun, [], Talismans),
    string:join(L, ",");
talisman_str(#talisman{base_id = BaseId, type = Type,
                       quality = Quality, attr = Attr}) ->
    util:flist("[~w:~w:~w][属性:~ts]",
               [BaseId, Type, Quality, attr_log(Attr)]);
talisman_str(_Talisman) -> not_talisman_record.

-spec item_str([Item] | Item) -> string() when Item ::
                                                   #item{} |
                                                   {BaseId :: pos_integer(),
                                                    Num :: pos_integer()} |
                                                   {BaseId :: pos_integer(),
                                                    Bind :: pos_integer(),
                                                    Num :: pos_integer()}.

item_str(Items) when is_list(Items) ->
    Fun = fun (Item, L1) ->
                  case item_str(Item) of
                      "" -> L1;
                      S -> [S | L1]
                  end
          end,
    L = lists:foldl(Fun, [], Items),
    string:join(L, ",");
item_str(#gain{label = item_base_id,
               val = [{BaseId, _Bind, Num}], ext = {drop, UnitId}}) ->
    io_lib:format("{~w,~ts,~w,~w,~ts}",
                  [BaseId,
                   item:attr(name, BaseId),
                   Num,
                   UnitId,
                   info(unit_name, UnitId)]);
item_str(#gain{label = item_base_id, val = Val}) ->
    item_str(Val);
item_str(#gain{label = items, val = Val}) ->
    item_str(Val);
item_str(#loss{label = item_base_id, val = Val}) ->
    item_str(Val);
item_str(#loss{label = items, val = Val}) ->
    item_str(Val);
item_str(#loss{label = Label, val = Val}) ->
    item_str({label_to_baseid(Label), Val});
item_str(#gain{label = Label, val = Val,
               ext = {drop, UnitId}})
    when is_integer(Val) ->
    case label_to_baseid(Label) of
        0 -> "";
        BaseId ->
            io_lib:format("{~w,~ts,~w,~w,~ts}",
                          [BaseId,
                           item:attr(name, BaseId),
                           Val,
                           UnitId,
                           info(unit_name, UnitId)])
    end;
item_str(#gain{label = Label, val = Val}) ->
    item_str({label_to_baseid(Label), Val});
item_str(#item{base_id = BaseId, quantity = Num}) ->
    item_str({BaseId, Num});
item_str({BaseId, _Bind, Num}) ->
    item_str({BaseId, Num});
item_str({BaseId, Num}) when BaseId >= 90000 ->
    io_lib:format("{~w,~ts,~w}",
                  [BaseId, item:attr(name, BaseId), Num]);
item_str({BaseId, Num}) when BaseId > 0 ->
    io_lib:format("{~w,~ts,~w}",
                  [BaseId, item:attr(name, BaseId), Num]);
item_str(BaseId) when is_integer(BaseId) ->
    item_str({BaseId, 1});
item_str(Map = #{base_id := BaseId}) ->
    KVs = maps:to_list(Map),
    TupleList = item_str([quantity, step],
                         KVs,
                         BaseId,
                         [{"~ts", item:attr(name, BaseId)}, {"~w", BaseId}]),
    Fun = fun ({S, Val}, {[], []}) -> {[S], [Val]};
              ({S, Val}, {SAcc, VAcc}) ->
                  {[S, "," | SAcc], [Val | VAcc]};
              (_, Acc) -> Acc
          end,
    {StrAcc, ValAcc} = lists:foldl(Fun,
                                   {[], []},
                                   TupleList),
    NewStrAcc = lists:flatten(["{", StrAcc, "}"]),
    io_lib:format(NewStrAcc, ValAcc);
item_str(_) -> "".

item_str(_Lables, [], _BaseId, Str) -> Str;
item_str([], _KVs, _BaseId, Str) -> Str;
item_str([Key | Rest], KVs, BaseId, Str) ->
    case lists:keyfind(Key, 1, KVs) of
        {Key, Val} ->
            item_str(Rest, KVs, BaseId, [{"~w", Val} | Str]);
        _ -> item_str(Rest, KVs, BaseId, Str)
    end.

label_to_baseid(coin) -> 90000;
label_to_baseid(gold) -> 90002;
label_to_baseid(gold_bind) -> 90003;
label_to_baseid(energy) -> 90006;
label_to_baseid(alchemy) -> 90017;
label_to_baseid(exp) -> 90010;
label_to_baseid(pet_exp) -> 90005;
label_to_baseid(guild) -> 90011;
label_to_baseid(stars_score) -> 90012;
label_to_baseid(character) -> 90007;
label_to_baseid(love) -> 90018;
label_to_baseid(brother) -> 90036;
label_to_baseid(teacher_score) -> 90019;
label_to_baseid(tournament) -> 90020;
label_to_baseid(lottery_luck) -> 90022;
label_to_baseid(handbook_point) -> 90024;
label_to_baseid(star_gold) -> 90026;
label_to_baseid(autumn_score) -> 90025;
label_to_baseid(new_year) -> 90029;
label_to_baseid(firecracker) -> 90033;
label_to_baseid(egg) -> 90038;
label_to_baseid(turn) -> 90040;
label_to_baseid(lucky_ticket) -> 90042;
label_to_baseid(dollar) -> 90044;
label_to_baseid(naughty) -> 90045;
label_to_baseid(concentric) -> 90046;
label_to_baseid(qixiIntegral) -> 90047;
label_to_baseid(sunshine) -> 90048;
label_to_baseid(cut_price) -> 90049;
label_to_baseid(single_dog) -> 90050;
label_to_baseid(penda_score) -> 90051;
label_to_baseid(joyful_egg) -> 90052;
label_to_baseid(godswar) -> 90056;
label_to_baseid(gold_bind_or_gold) -> 90003;
label_to_baseid(coin_or_gold) -> 90000;
label_to_baseid(star_gold_or_gold) -> 90026;
label_to_baseid(camp_pray_sc) -> 90071;
label_to_baseid(_) -> 0.

info(unit_name, UnitId) ->
    case unit_data:get(UnitId) of
        #unit_data{name = Name} -> Name;
        _ -> ""
    end;
info(map_name, MapId) ->
    case map_data:get(MapId) of
        {ok, #map_data{name = Name}} -> Name;
        _ -> ""
    end;
info(_Label, _Data) -> "".

init([]) ->
    logger:info("[~w] 正在启动...", [log], log, 2170),
    process_flag(trap_exit, true),
    start_proc(10),
    start_db_proc(2),
    start_web_proc(3),
    start_3k_proc(),
    log_file:start_num(),
    put(next_web_id, 1),
    BootTimes = env:get(sys_boot_times),
    case env:get(log_next_id) of
        undefined when BootTimes =:= 0 ->
            env:save(log_next_id, 1);
        undefined ->
            logger:error("警告!环境变量中不存在log_next_id值，可能系统出现过故障，请恢复log_next"
                         "_id的值再使用系统，否则可能会出现日志丢失!",
                         [],
                         log,
                         2183);
        _ -> ignore
    end,
    case env:get(log_next_id) of
        NextId when is_integer(NextId) ->
            self() ! loop,
            State = #state{next_id = NextId},
            logger:info("[~w] 启动完成", [log], log, 2190),
            {ok, State};
        _ -> {stop, normal}
    end.

handle_call(_Request, _From, State) -> {noreply, State}.

handle_cast({write, Content},
            State = #state{next_id = Id}) ->
    Pid = get(Id rem 10 + 1),
    Pid ! {write, Id, Content},
    NextId = Id + 1,
    {noreply, State#state{next_id = NextId}};
handle_cast({web, Content}, State = #state{}) ->
    Pid = get({web, get(next_web_id) rem 3 + 1}),
    Pid ! {web, Content},
    put(next_web_id, get(next_web_id) + 1),
    {noreply, State#state{}};
handle_cast(_Msg, State) -> {noreply, State}.

handle_info(loop, State = #state{next_id = NextId}) ->
    env:save(log_next_id, NextId),
    erlang:send_after(5000, self(), loop),
    {noreply, State};
handle_info(start_3k_log, State) ->
    case log_web_3k:start_link() of
        {ok, Pid} -> put(web_3k, Pid);
        _R -> logger:info("~p", [_R], log, 2223)
    end,
    {noreply, State};
handle_info(_Info, State) -> {noreply, State}.

terminate(_Reason, #state{next_id = NextId}) ->
    logger:info("[~w] 正在关闭...", [log], log, 2230),
    env:save(log_next_id, NextId),
    logger:info("[~w] 关闭完成", [log], log, 2232),
    ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

start_proc(0) -> ok;
start_proc(N) ->
    {ok, Pid} = log_proc:start_link(lists:concat(["log_",
                                                  N])),
    put(N, Pid),
    start_proc(N - 1).

start_db_proc(0) -> ok;
start_db_proc(N) ->
    {ok, Pid} = log_db:start_link(N),
    put({db, N}, Pid),
    start_db_proc(N - 1).

start_web_proc(0) -> ok;
start_web_proc(N) ->
    {ok, Pid} = log_web:start_link(N),
    put({web, N}, Pid),
    start_web_proc(N - 1).

start_3k_proc() ->
    {ok, Pid} = log_web_3k:start_link(),
    put(web_3k, Pid).

to_chr_id({Id, Platform, ZoneId}) ->
    lists:concat([Id, "_", Platform, "_", ZoneId]).

role_to_map(#role{id = {Id, Platform, ZoneId},
                  ip_last_login = {IP1, IP2, IP3, IP4}, account = Account,
                  channel_reg = ChannelReg, classes = Classes, lev = Lev,
                  name = Name, device_id = DeviceId,
                  device_type = DeviceType, sex = Sex,
                  time_info = {LoginT, _}, device_key = DeviceKey},
            Type) ->
    {Y, M, D} = erlang:date(),
    {H, Min, S} = erlang:time(),
    ChrId = to_chr_id({Id, Platform, ZoneId}),
    NewDeviceId = case DeviceId of
                      [_ | _] -> DeviceId;
                      _ -> "device_id_is_null"
                  end,
    #{"product_name" => to_bitstring("xcqy"),
      "header_type" => to_bitstring(Type),
      "platform_name" => to_bitstring(Platform),
      "channel_name" => to_bitstring(ChannelReg),
      "gameserver_no" => ZoneId,
      "ip" => util:fbin("~w.~w.~w.~w", [IP1, IP2, IP3, IP4]),
      "date_time" =>
          util:fbin("~w-~2.10.0B-~2.10.0B ~2.10.0B:~2.10.0B:~2.10.0B",
                    [Y, M, D, H, Min, S]),
      "account_id" => to_bitstring(Account),
      "chr_id" => to_bitstring(ChrId),
      "chr_name" => to_bitstring(Name),
      "chr_level" => max(1, Lev),
      "career" =>
          to_bitstring(role_misc:classes_to_text(Classes)),
      "gender" => gender_name(Sex),
      "device_id" => to_bitstring(NewDeviceId),
      "device_type" => to_bitstring(DeviceType),
      "device_key" => to_bitstring(DeviceKey),
      "session_id" =>
          util:fbin("~w~ts~w_~w", [Id, Platform, ZoneId, LoginT]),
      "version" => to_bitstring(env:get(version))}.

to_map_data(#{id := {Id, Platform, ZoneId},
              name := Name, account := Account, lev := Lev,
              classes := Classes},
            Type) ->
    {Y, M, D} = erlang:date(),
    {H, Min, S} = erlang:time(),
    ChrId = to_chr_id({Id, Platform, ZoneId}),
    #{"product_name" => to_bitstring("xcqy"),
      "header_type" => to_bitstring(Type),
      "platform_name" => to_bitstring(Platform),
      "channel_name" => to_bitstring("default"),
      "gameserver_no" => ZoneId,
      "date_time" =>
          util:fbin("~w-~2.10.0B-~2.10.0B ~2.10.0B:~2.10.0B:~2.10.0B",
                    [Y, M, D, H, Min, S]),
      "account_id" => to_bitstring(Account),
      "chr_id" => to_bitstring(ChrId),
      "chr_name" => to_bitstring(Name),
      "chr_level" => max(1, Lev),
      "career" =>
          to_bitstring(role_misc:classes_to_text(Classes)),
      "session_id" => to_bitstring("game-event"),
      "version" => to_bitstring(env:get(version))};
to_map_data(#rank_rc{id = {Id, Platform, ZoneId},
                     name = Name, lev = Lev, classes = Classes},
            Type) ->
    {Y, M, D} = erlang:date(),
    {H, Min, S} = erlang:time(),
    ChrId = to_chr_id({Id, Platform, ZoneId}),
    #{"product_name" => to_bitstring("xcqy"),
      "header_type" => to_bitstring(Type),
      "platform_name" => to_bitstring(Platform),
      "channel_name" => to_bitstring("default"),
      "gameserver_no" => ZoneId,
      "date_time" =>
          util:fbin("~w-~2.10.0B-~2.10.0B ~2.10.0B:~2.10.0B:~2.10.0B",
                    [Y, M, D, H, Min, S]),
      "account_id" => to_bitstring("account"),
      "chr_id" => to_bitstring(ChrId),
      "chr_name" => to_bitstring(Name),
      "chr_level" => max(1, Lev),
      "career" =>
          to_bitstring(role_misc:classes_to_text(Classes)),
      "session_id" => to_bitstring("game-event"),
      "version" => to_bitstring(env:get(version))}.

default_map_data(Platform, ZoneId) ->
    to_map_data(#{id => {0, Platform, ZoneId},
                  name => "null", account => to_bitstring("account"),
                  lev => 1, classes => 0},
                "custom-event").

assets_type_to_name(AssetsType) ->
    case AssetsType of
        90000 -> "银币";
        90001 -> "绑定银币(未用)";
        90002 -> "钻石";
        90003 -> "绑定钻石/金币";
        90004 -> "灵气";
        90005 -> "宠物经验";
        90006 -> "活力值";
        90007 -> "人品值";
        90008 -> "成就点";
        90010 -> "经验";
        90011 -> "公会积分";
        90012 -> "星辰积分";
        90013 -> "经脉技能经验值";
        90014 -> "饱食度";
        90015 -> "公会资金";
        90016 -> "储备经验";
        90017 -> "魔法炼化值";
        90018 -> "恩爱值";
        90019 -> "师道值";
        90020 -> "武道值";
        90021 -> "坐骑精力值";
        90022 -> "一元夺宝幸运值";
        90023 -> "无尽挑战心得";
        90024 -> "图鉴积分";
        90025 -> "中秋积分";
        90026 -> "红钻(原星钻 紫钻)";
        90027 -> "南瓜币";
        90028 -> "感恩积分";
        90029 -> "元旦积分";
        90030 -> "孕育值";
        90031 -> "孕育滋补值";
        90032 -> "胎儿发育值";
        90033 -> "新春鞭炮";
        90034 -> "元宵积分";
        90035 -> "水晶积分";
        90036 -> "兄弟积分";
        90037 -> "游乐卷";
        90038 -> "扭蛋积分";
        90039 -> "兑换积分";
        90040 -> "转盘积分";
        90041 -> "父亲节积分";
        90042 -> "幸运宝券";
        90043 -> "元宝";
        90044 -> "扭蛋积分";
        90045 -> "淘气值";
        90046 -> "同心值";
        90047 -> "七夕积分";
        90048 -> "阳光币";
        90051 -> "熊猫庆典积分";
        90052 -> "欢乐彩蛋";
        90053 -> "元旦礼券";
        90054 -> "绝招历练点";
        90056 -> "诸神荣誉积分";
        90061 -> "摇摇乐积分";
        90062 -> "储备钻石";
        90063 -> "大富翁积分";
        29255 -> "红钻Or蓝钻";
        29915 -> "圣诞雪花";
        29811 -> "南瓜灯";
        90066 -> "积分兑换活动积分";
        90067 -> "新开服转盘活动积分";
        90068 -> "战令经验值";
        90069 -> "战令活动资产";
        _ -> AssetsType
    end.

gender_name(1) -> <<"男"/utf8>>;
gender_name(_) -> <<"女"/utf8>>.

to_bitstring(Str) when is_list(Str) ->
    unicode:characters_to_binary(Str);
to_bitstring(A) -> util:to_binary(A).

check_combat_type(40) -> true;
check_combat_type(58) -> true;
check_combat_type(68) -> true;
check_combat_type(72) -> true;
check_combat_type(CombatType) when CombatType >= 100 ->
    true;
check_combat_type(_) -> false.

check_combat_type_round(40) -> true;
check_combat_type_round(58) -> true;
check_combat_type_round(113) -> true;
check_combat_type_round(110) -> true;
check_combat_type_round(111) -> true;
check_combat_type_round(104) -> true;
check_combat_type_round(114) -> true;
check_combat_type_round(_) -> false.

combat_name(100) -> "竞技场";
combat_name(102) -> "段位赛";
combat_name(103) -> "勇士战场";
combat_name(104) -> "巅峰对决";
combat_name(105) -> "公会战";
combat_name(106) -> "公会精英战";
combat_name(107) -> "荣耀战场";
combat_name(108) -> "公会联赛";
combat_name(109) -> "跨服公会战";
combat_name(110) -> "诸神之战小组赛";
combat_name(111) -> "诸神之战淘汰赛";
combat_name(112) -> "公会攻城战";
combat_name(113) -> "星辰擂台";
combat_name(114) -> "钻石联赛";
combat_name(115) -> "跨服约战";
combat_name(68) -> "银月贤者";
combat_name(116) -> "峡谷之巅";
combat_name(72) -> "幻月灵兽";
combat_name(40) -> "武道会";
combat_name(58) -> "武道会2v2";
combat_name(6) -> "擂台切磋";
combat_name(_CombatType) -> to_bitstring(_CombatType).

get_channel_name(world) -> "世界";
get_channel_name(center_world) -> "跨服";
get_channel_name(guild) -> "公会";
get_channel_name(guild_others) -> "公会";
get_channel_name(team) -> "队伍";
get_channel_name(map) -> "当前";
get_channel_name(spirit_treasure) -> "龙王";
get_channel_name(friend) -> "私聊";
get_channel_name(oracle_treasure) -> "天启";
get_channel_name(_) -> "其它".

get_phase(#role{id = RoleId}, 40) ->
    case tournament_agent:local_profile(RoleId) of
        #tournament_profile{rank_lev = RankLev,
                            rank_point = RankPoint} ->
            case tournament_data:get(RankLev) of
                #{name := RankName} -> {RankName, RankPoint};
                _ -> {"星辰学徒", 1}
            end;
        _ -> {"星辰学徒", 1}
    end;
get_phase(#role{id = RoleId}, 58) ->
    case tournament_agent:local_profile(RoleId) of
        #tournament_profile{rank_lev = RankLev,
                            rank_point = RankPoint} ->
            case tournament_data:get(RankLev) of
                #{name := RankName} -> {RankName, RankPoint};
                _ -> {"星辰学徒", 1}
            end;
        _ -> {"星辰学徒", 1}
    end;
get_phase(#role{m_arena = #m_arena{cup = Cup}}, 100) ->
    {"未设置", Cup};
get_phase(Role, 68) ->
    case team:info(Role) of
        {ok,
         #team{team_formation = Formation,
               team_formation_lev = FormationLev}} ->
            case formation_data:get({Formation, FormationLev}) of
                #formation_data{name = Name} -> {Name, FormationLev};
                _ -> {"未设置", 1}
            end;
        _ -> {"未设置", 1}
    end;
get_phase(_Role, _) -> {"未设置", 1}.

convert_rune(Status, Resonance) ->
    case Status of
        0 -> lang:get("未学习");
        1 -> lang:get("未领悟");
        2 -> lang:get("已领悟");
        3 when Resonance == 1 -> lang:get("共鸣");
        3 -> lang:get("满级")
    end.

convert_rune(Status) ->
    case Status of
        0 -> lang:get("未学习");
        1 -> lang:get("未领悟");
        2 -> lang:get("已领悟");
        3 -> lang:get("满级")
    end.

convert_resonance(Resonances) ->
    NameL = [pet_rune:rune_name(Id)
             || #pet_resonance{resonance_id = Id} <- Resonances],
    string:join(NameL, ",").

make_data(Role = #role{id = RoleId, platform = Platform,
                       zone_id = ZoneId, ip_last_login = {IP1, IP2, IP3, IP4},
                       name = Name, account = Account, lev = Lev,
                       channel_reg = ChannelReg, charge = Charge,
                       m_privilege = #m_privilege{lev = PLev}},
          Channel, TRI = {TI, TP, TZ}, Msg) ->
    logger:debug("=======", [], log, 2526),
    MGuild = Role#role.m_guild,
    GName = case MGuild of
                #m_guild{id = GuildId} ->
                    case guild_mgr:info(by_id, GuildId) of
                        {ok, #guild{name = _GName}} -> _GName;
                        _ -> ""
                    end;
                _ -> ""
            end,
    {RUserId, RRoleId, RName} = case role_query:cache(by_id,
                                                      TI,
                                                      TP,
                                                      TZ)
                                    of
                                    {ok,
                                     #role{account = ReceiverUserId,
                                           id = ReceiverRoleId,
                                           name = ReceiverName}} ->
                                        {ReceiverUserId,
                                         to_chr_id(ReceiverRoleId),
                                         ReceiverName};
                                    _
                                        when (TI == 0) and (TP == []) and
                                                 (TZ == 0) ->
                                        {"", "", ""};
                                    _ -> {"", to_chr_id(TRI), ""}
                                end,
    ServerName = case
                     server_list_data:get_server_name({Platform, ZoneId})
                     of
                     false -> lang:get("神秘大陆");
                     _ServerName -> _ServerName
                 end,
    ChrId = to_chr_id(RoleId),
    #{"channel" => ChannelReg,
      "server_id" =>
          to_bitstring(util:flist("~ts_~w", [Platform, ZoneId])),
      "server_name" => to_bitstring(ServerName),
      "user_id" => to_bitstring(Account),
      "role_id" => to_bitstring(ChrId),
      "role_name" => to_bitstring(Name), "role_level" => Lev,
      "vip_level" => PLev, "role_charge" => Charge,
      "guild_name" => to_bitstring(GName),
      "chat_type" => to_bitstring(get_channel_name(Channel)),
      "chat_content" => to_bitstring(Msg),
      "receiver_user_id" => to_bitstring(RUserId),
      "receiver_role_id" => to_bitstring(RRoleId),
      "receiver_role_name" => to_bitstring(RName),
      "chat_time" => date:unixtime(),
      "ip" =>
          to_bitstring(util:flist("~w.~w.~w.~w",
                                  [IP1, IP2, IP3, IP4]))};
make_data(#role{id = _RoleId, platform = _ServerName,
                zone_id = _ZoneId,
                ip_last_login = {_IP1, _IP2, _IP3, _IP4}, name = _Name,
                account = _Account, lev = _Lev,
                channel_reg = _ChannelReg, charge = _Charge,
                m_privilege = #m_privilege{lev = _PLev},
                m_guild = #m_guild{id = _GuildId}},
          _, _, _) ->
    logger:debug("=======", [], log, 2569),
    #{}.

make_report(#role{id = RoleId, platform = Platform,
                  zone_id = ZoneId, ip_last_login = {IP1, IP2, IP3, IP4},
                  name = Name, account = Account,
                  channel_reg = ChannelReg},
            Channel, ReportRId,
            #{account := ReportAccount, name := ReportName,
              lev := ReportLev, charge := ReportCharge,
              guild_name := ReportGName},
            Msg, ChatTime, ReportType, ReportContent) ->
    RRoleId = to_chr_id(ReportRId),
    NReportType = case ReportType of
                      1 -> "昵称不雅";
                      2 -> "骚扰谩骂";
                      3 -> "广告刷屏";
                      4 -> "色情暴力";
                      5 -> "反动政治";
                      _ -> "其他"
                  end,
    ServerName = case
                     server_list_data:get_server_name({Platform, ZoneId})
                     of
                     false -> lang:get("神秘大陆");
                     _ServerName -> _ServerName
                 end,
    ChrId = to_chr_id(RoleId),
    #{"channel" => ChannelReg,
      "server_id" =>
          to_bitstring(util:flist("~ts_~w", [Platform, ZoneId])),
      "server_name" => to_bitstring(ServerName),
      "user_id" => to_bitstring(ReportAccount),
      "role_id" => to_bitstring(RRoleId),
      "role_name" => to_bitstring(ReportName),
      "role_level" => ReportLev, "vip_level" => 0,
      "role_charge" => ReportCharge,
      "guild_name" => to_bitstring(ReportGName),
      "report_user_id" => to_bitstring(Account),
      "report_role_id" => to_bitstring(ChrId),
      "report_role_name" => to_bitstring(Name),
      "chat_type" => to_bitstring(Channel),
      "chat_content" => to_bitstring(Msg),
      "chat_time" => ChatTime,
      "report_type" => to_bitstring(NReportType),
      "report_content" => to_bitstring(ReportContent),
      "report_time" => date:unixtime(),
      "ip" =>
          to_bitstring(util:flist("~w.~w.~w.~w",
                                  [IP1, IP2, IP3, IP4])),
      "callback_info" => to_bitstring("")}.

make_market_log(Role, AutoScene,
                [#loss{label = item_base_id} | T], Log) ->
    make_market_log(Role, AutoScene, T, Log);
make_market_log(Role, AutoScene, [#loss{val = 0} | T],
                Log) ->
    make_market_log(Role, AutoScene, T, Log);
make_market_log(_, _, [], _) -> ok;
make_market_log(_, _, _, []) -> ok;
make_market_log(Role, AutoScene,
                [#loss{label = Label, val = AllCost} | T1],
                [{BaseId, Num, Source, TotalPrice} | T2]) ->
    Type = case Source of
               4 -> log_market_silver;
               _ -> log_market_gold
           end,
    new_market(Type,
               Role,
               "购买",
               AllCost,
               Num,
               BaseId,
               erlang:round(TotalPrice / Num),
               0,
               0,
               Label,
               AutoScene),
    make_market_log(Role, AutoScene, T1, T2).

restart_3k_log() -> log ! start_3k_log.

long_active(Role, Title, _CampLongActive) ->
    CampLongActive =
        (Role#role.m_campaign)#m_campaign.camp_long_active,
    logger:debug("记录日志:~w", [CampLongActive], log, 2638),
    Map1 = role_to_map(Role, "custom-event"),
    Comments = {struct,
                [{"camp_id", CampLongActive#camp_long_active.id},
                 {"lev", CampLongActive#camp_long_active.lev},
                 {"token_list",
                  to_bitstring(length(CampLongActive#camp_long_active.token_list))},
                 {"recv_rewards",
                  to_bitstring(CampLongActive#camp_long_active.reward_levs)}]},
    Map2 = Map1#{"event_name" => to_bitstring(long_active),
                 "title" => to_bitstring(Title), "comments" => Comments},
    write(Map2),
    ok.

