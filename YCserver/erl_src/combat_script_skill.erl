-file("src/mod/combat/combat_script_skill.erl", 1).

-module(combat_script_skill).

-export([convert_skill/1,
         to_combat_skill/1,
         convert_anger_skill/1,
         calc_special_self_changes/2]).

-export([script_10000/4,
         script_10001/4,
         script_10002/4,
         script_10003/4,
         script_10004/4,
         script_10005/4,
         script_10006/4,
         script_10007/4,
         script_10008/4,
         script_10009/4,
         script_20000/4,
         script_20001/4,
         script_20002/4,
         script_20003/4,
         script_20004/4,
         script_20005/4,
         script_20006/4,
         script_20007/4,
         script_20008/4,
         script_20009/4,
         script_20010/4,
         script_20011/4,
         script_20012/4,
         script_20013/4,
         script_20014/4,
         script_20015/4,
         script_20016/4,
         script_20017/4,
         script_20018/4,
         script_20019/4,
         script_20020/4,
         script_20021/4,
         script_20022/4,
         script_20023/4,
         script_20024/4,
         script_20025/4,
         script_20026/4,
         script_20027/4,
         script_20028/4,
         script_20029/4,
         script_20030/4,
         script_20031/4,
         script_20032/4,
         script_20033/4,
         script_20034/4,
         script_20035/4,
         script_20036/4,
         script_20037/4,
         script_20038/4,
         script_20039/4,
         script_20040/4,
         script_20041/4,
         script_20042/4,
         script_20043/4,
         script_20044/4,
         script_20045/4,
         script_20046/4,
         script_20047/4,
         script_20048/4,
         script_20049/4,
         script_20050/4,
         script_20051/4,
         script_20052/4,
         script_20053/4,
         script_20054/4,
         script_20055/4,
         script_20056/4,
         script_20057/4,
         script_20058/4,
         script_20059/4,
         script_20060/4,
         script_20061/4,
         script_20062/4,
         script_20063/4,
         script_20064/4,
         script_20065/4,
         script_20066/4,
         script_20067/4,
         script_20068/4,
         script_20069/4,
         script_20070/4,
         script_20071/4,
         script_20072/4,
         script_20073/4,
         script_20074/4,
         script_20075/4,
         script_20076/4,
         script_20077/4,
         script_20078/4,
         script_20079/4,
         script_20080/4,
         script_20081/4,
         script_20082/4,
         script_20083/4,
         script_20084/4,
         script_31000/4,
         script_31001/4,
         script_31002/4,
         script_31003/4,
         script_31004/4,
         script_31100/4,
         script_32000/4,
         script_32001/4,
         script_33000/4,
         script_33001/4,
         script_33002/4,
         script_33003/4,
         script_33004/4,
         script_34000/4,
         script_35000/4,
         script_35001/4,
         script_35002/4,
         script_35003/4,
         script_50000/4,
         script_50001/4,
         script_50002/4,
         script_50003/4,
         script_50004/4,
         script_50005/4,
         script_50006/4,
         script_50007/4,
         script_50008/4,
         script_50009/4,
         script_50010/4,
         script_50011/4,
         script_50012/4,
         script_50013/4,
         script_50014/4,
         script_50015/4,
         script_50016/4,
         script_50017/4,
         script_50018/4,
         script_50019/4,
         script_50020/4,
         script_50021/4,
         script_50022/4,
         script_50023/4,
         script_50024/4,
         script_50025/4,
         script_50026/4,
         script_50027/4,
         script_50028/4,
         script_50029/4,
         script_60000/4,
         script_60001/4,
         script_60002/4,
         script_60003/4,
         script_60004/4,
         script_60005/4,
         script_60006/4,
         script_60007/4,
         script_60008/4,
         script_60009/4,
         script_60010/4,
         script_60011/4,
         script_60012/4,
         script_60013/4,
         script_60014/4,
         script_60015/4,
         script_60016/4,
         script_60017/4,
         script_60018/4,
         script_60019/4,
         script_60020/4,
         script_60021/4,
         script_60022/4,
         script_60023/4,
         script_60024/4,
         script_60025/4,
         script_60026/4,
         script_60027/4,
         script_60028/4,
         script_60029/4,
         script_60030/4,
         script_60031/4,
         script_60032/4,
         script_60033/4,
         script_60034/4,
         script_60035/4,
         script_60036/4,
         script_60037/4,
         script_60038/4,
         script_60039/4,
         script_60040/4,
         script_60041/4,
         script_60042/4,
         script_60043/4,
         script_60044/4,
         script_60045/4,
         script_60046/4,
         script_60047/4,
         script_60048/4,
         script_60049/4,
         script_60050/4,
         script_60051/4,
         script_60052/4,
         script_60053/4,
         script_60054/4,
         script_60055/4,
         script_60056/4,
         script_60057/4,
         script_60058/4,
         script_60059/4,
         script_60060/4,
         script_60061/4,
         script_60062/4,
         script_60063/4,
         script_60064/4,
         script_60065/4,
         script_60066/4,
         script_60067/4,
         script_60068/4,
         script_60069/4,
         script_60070/4,
         script_60071/4,
         script_60072/4,
         script_60073/4,
         script_60074/4,
         script_60075/4,
         script_60076/4,
         script_60077/4,
         script_60078/4,
         script_60079/4,
         script_60080/4,
         script_60081/4,
         script_60082/4,
         script_60083/4,
         script_60084/4,
         script_60085/4,
         script_60086/4,
         script_60087/4,
         script_60088/4,
         script_60089/4,
         script_60090/4,
         script_60091/4,
         script_60092/4,
         script_60093/4,
         script_60094/4,
         script_60095/4,
         script_60096/4,
         script_60097/4,
         script_60098/4,
         script_60099/4,
         script_60100/4,
         script_60101/4,
         script_60102/4,
         script_60103/4,
         script_60104/4,
         script_60105/4,
         script_60106/4,
         script_60107/4,
         script_60108/4,
         script_60109/4,
         script_60110/4,
         script_60111/4,
         script_60112/4,
         script_60113/4,
         script_60114/4,
         script_60115/4,
         script_60116/4,
         script_60117/4,
         script_60118/4,
         script_60119/4,
         script_60120/4,
         script_60121/4,
         script_60122/4,
         script_60123/4,
         script_60124/4,
         script_60125/4,
         script_60126/4,
         script_60127/4,
         script_60128/4,
         script_60129/4,
         script_60130/4,
         script_60131/4,
         script_60132/4,
         script_60133/4,
         script_60134/4,
         script_60135/4,
         script_60136/4,
         script_60137/4,
         script_60138/4,
         script_60139/4,
         script_60140/4,
         script_60141/4,
         script_60142/4,
         script_60143/4,
         script_60144/4,
         script_60145/4,
         script_60146/4,
         script_60147/4,
         script_60148/4,
         script_60149/4,
         script_60150/4,
         script_60151/4,
         script_60152/4,
         script_60153/4,
         script_60154/4,
         script_60155/4,
         script_60156/4,
         script_60157/4,
         script_60158/4,
         script_60159/4,
         script_60160/4,
         script_60161/4,
         script_60162/4,
         script_60163/4,
         script_60164/4,
         script_60165/4,
         script_60166/4,
         script_60167/4,
         script_60168/4,
         script_60169/4,
         script_60170/4,
         script_60171/4,
         script_60172/4,
         script_60173/4,
         script_60174/4,
         script_60175/4,
         script_60176/4,
         script_60177/4,
         script_60178/4,
         script_60179/4,
         script_60180/4,
         script_60181/4,
         script_60182/4,
         script_60183/4,
         script_60184/4,
         script_60185/4,
         script_60186/4,
         script_60187/4,
         script_60188/4,
         script_60189/4,
         script_60190/4,
         script_700001/4,
         script_700002/4,
         script_700003/4,
         script_700004/4,
         script_700005/4,
         script_700006/4,
         script_700007/4,
         script_700008/4,
         script_700009/4,
         script_700010/4,
         script_700011/4,
         script_700012/4,
         script_60191/4,
         script_60192/4,
         script_60193/4,
         script_60194/4,
         script_60195/4,
         script_60196/4,
         script_60197/4,
         script_60198/4]).

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

-file("src/mod/combat/combat_script_skill.erl", 374).

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

-file("src/mod/combat/combat_script_skill.erl", 375).

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

-file("src/mod/combat/combat_script_skill.erl", 376).

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

-file("src/mod/combat/combat_script_skill.erl", 377).

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

-file("src/mod/combat/combat_script_skill.erl", 378).

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

-file("src/mod/combat/combat_script_skill.erl", 379).

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

-file("src/mod/combat/combat_script_skill.erl", 380).

-file("inc/looks.hrl", 1).

-file("src/mod/combat/combat_script_skill.erl", 381).

convert_skill(Skills) when is_list(Skills) ->
    convert_skill(Skills, {[], [], []});
convert_skill(_) -> {[], [], []}.

convert_skill([],
              {ActiveSkills, PassiveSkills, Halos}) ->
    {ActiveSkills, PassiveSkills, Halos};
convert_skill([{SkillId, Lev} | T],
              {ActiveSkills, PassiveSkills, Halos}) ->
    case to_combat_skill({SkillId, Lev}) of
        Cskill = #c_skill{} ->
            {NewActiveSkills, NewPassiveSkills, NewHalos} =
                merge_skill(Cskill,
                            {ActiveSkills, PassiveSkills, Halos}),
            convert_skill(T,
                          {NewActiveSkills, NewPassiveSkills, NewHalos});
        _Err ->
            convert_skill(T, {ActiveSkills, PassiveSkills, Halos})
    end;
convert_skill([_Err | T],
              {ActiveSkills, PassiveSkills, Halos}) ->
    logger:error("无法匹配的技能列表参数:~w",
                 [_Err],
                 combat_script_skill,
                 400),
    convert_skill(T, {ActiveSkills, PassiveSkills, Halos}).

convert_anger_skill(Skills = [_ | _]) ->
    convert_anger_skill(Skills, [], []);
convert_anger_skill(_) -> {[], []}.

convert_anger_skill([], AngerSkill, PassAngerSkill) ->
    {AngerSkill, PassAngerSkill};
convert_anger_skill([{SkillId, Lev} | T], AngerSkill,
                    PassAngerSkill) ->
    case to_combat_skill({SkillId, Lev}) of
        Cskill = #c_skill{special_type = SpecialType,
                          skill = #skill{type = Type}} ->
            Cskill1 = Cskill#c_skill{special_type =
                                         [anger_skill | SpecialType]},
            {NewAngerSkill, NewPassAngerSkill} = case Type of
                                                     0 ->
                                                         {lists:keystore(SkillId,
                                                                         #c_skill.id,
                                                                         AngerSkill,
                                                                         Cskill1),
                                                          PassAngerSkill};
                                                     1 ->
                                                         {AngerSkill,
                                                          lists:keystore(SkillId,
                                                                         #c_skill.id,
                                                                         PassAngerSkill,
                                                                         Cskill1)};
                                                     _ ->
                                                         {AngerSkill,
                                                          PassAngerSkill}
                                                 end,
            convert_anger_skill(T,
                                NewAngerSkill,
                                NewPassAngerSkill);
        _ -> convert_anger_skill(T, AngerSkill, PassAngerSkill)
    end;
convert_anger_skill([_Err | T], AngerSkill,
                    PassAngerSkill) ->
    logger:error("无法匹配的技能列表参数:~w",
                 [_Err],
                 combat_script_skill,
                 425),
    convert_anger_skill(T, AngerSkill, PassAngerSkill).

merge_skill(Cskill = #c_skill{id = SkillId,
                              skill = #skill{type = Type}},
            {ActiveSkills, PassiveSkills, Halos}) ->
    case Type of
        0 ->
            case lists:keyfind(SkillId, #c_skill.id, ActiveSkills)
                of
                false ->
                    {[Cskill | ActiveSkills], PassiveSkills, Halos};
                _ -> {ActiveSkills, PassiveSkills, Halos}
            end;
        1 ->
            case lists:keyfind(SkillId, #c_skill.id, PassiveSkills)
                of
                false ->
                    {ActiveSkills, [Cskill | PassiveSkills], Halos};
                _ -> {ActiveSkills, PassiveSkills, Halos}
            end;
        2 ->
            case lists:keyfind(SkillId, #c_skill.id, Halos) of
                false ->
                    {ActiveSkills, PassiveSkills, [Cskill | Halos]};
                _ -> {ActiveSkills, PassiveSkills, Halos}
            end;
        4 ->
            case lists:keyfind(SkillId, #c_skill.id, ActiveSkills)
                of
                false ->
                    {[Cskill | ActiveSkills], PassiveSkills, Halos};
                _ -> {ActiveSkills, PassiveSkills, Halos}
            end
    end.

-spec to_combat_skill(Skill) -> Cskill :: undefined |
                                          #c_skill{} when Skill :: #skill{} |
                                                                   #c_skill{} |
                                                                   {Id ::
                                                                        non_neg_integer(),
                                                                    Lev ::
                                                                        non_neg_integer()}.

to_combat_skill(#skill{lev = 0}) -> undefined;
to_combat_skill(#skill{id = Id, lev = Lev}) ->
    to_combat_skill({Id, Lev});
to_combat_skill({_Id, 0}) -> undefined;
to_combat_skill({Id, Lev}) ->
    case skill_combat_data:get_combat({Id, Lev}) of
        Skill = #skill{script_id = ScriptId}
            when ScriptId > 0 ->
            Cs = #c_skill{id = Id, lev = Lev, skill = Skill},
            to_combat_skill(Cs);
        _Err -> undefined
    end;
to_combat_skill(CSkill = #c_skill{skill =
                                      #skill{script_id = ScriptId}})
    when ScriptId > 0 ->
    Cs = append_action(CSkill),
    Cs1 = combat_script_skill_ext:append_trigger(Cs),
    Cs1;
to_combat_skill(Other) ->
    logger:error("无法转化为战斗技能:~w",
                 [Other],
                 combat_script_skill,
                 475),
    undefined.

append_action(Cs = #c_skill{skill =
                                S = #skill{script_id = ScriptId, buff_self = Bs,
                                           buff_target = Bt}}) ->
    BuffSelf = combat_script_buff:convert_buff(Bs),
    BuffTarget = combat_script_buff:convert_buff(Bt, multi),
    Skill = Cs#c_skill{skill =
                           S#skill{buff_self = BuffSelf,
                                   buff_target = BuffTarget}},
    case ScriptId of
        10000 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_10000}};
        10001 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_10001}};
        10002 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_10002}};
        10003 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_10003}};
        10004 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_10004}};
        10005 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_10005}};
        10006 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_10006}};
        10007 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_10007}};
        10008 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_10008}};
        10009 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_10009}};
        20000 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_20000}};
        20001 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_20001}};
        20002 ->
            Skill#c_skill{type_flag = heal,
                          action = {combat_script_skill, script_20002}};
        20003 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_20003}};
        20004 ->
            Skill#c_skill{type_flag = revive,
                          action = {combat_script_skill, script_20004},
                          use_type = {die, die}};
        20005 ->
            Skill#c_skill{type_flag = heal,
                          action = {combat_script_skill, script_20005}};
        20006 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_20006}};
        20007 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_20007}};
        20008 ->
            Skill#c_skill{type_flag = hp_low,
                          action = {combat_script_skill, script_20008}};
        20009 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_20009}};
        20010 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_20010}};
        20011 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_20011}};
        20012 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_20012}};
        20013 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_20013}};
        20014 ->
            Skill#c_skill{type_flag = clear_buff,
                          action = {combat_script_skill, script_20014}};
        20015 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_20015},
                          act_flag = pursue};
        20016 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_20016}};
        20017 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_20017}};
        20018 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_20018}};
        20019 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_20019}};
        20020 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_20020},
                          act_flag = pursue, special_type = [immunity_next]};
        20021 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_20021},
                          act_flag = pursue};
        20022 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_20022}};
        20023 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_20023}};
        20024 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_20024}};
        20025 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_20025}};
        20026 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_20026}};
        20027 ->
            Skill#c_skill{type_flag = revive,
                          action = {combat_script_skill, script_20027},
                          use_type = {all, all}};
        20028 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_20028}};
        20029 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_20029}};
        20030 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_20030},
                          use_type = {live, die}};
        20031 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_20031}};
        20032 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_20032}};
        20033 ->
            Skill#c_skill{type_flag = hp_low,
                          action = {combat_script_skill, script_20033},
                          act_flag = last_dmg};
        20034 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_20034}};
        20035 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_20035},
                          act_flag = pursue};
        20036 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_20036},
                          act_flag = variety_1};
        20037 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_20037}};
        20038 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_20038}};
        20039 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_20039}};
        20040 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_20040}};
        20041 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_20041}};
        20042 ->
            Skill#c_skill{type_flag = revive,
                          action = {combat_script_skill, script_20042},
                          use_type = {all, all}, act_flag = revive_all};
        20043 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_20043}};
        20044 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_20044},
                          act_flag = variety_2};
        20045 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_20045},
                          act_flag = magic_suck};
        20046 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_20046},
                          act_flag = special_pursue};
        20047 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_20047}};
        20048 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_20048},
                          special_type = [immunity_next]};
        20049 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_20049}};
        20050 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_20050}};
        20051 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_20051}};
        20052 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_20052}};
        20053 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_20053}};
        20054 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_20054}};
        20055 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_20055},
                          act_flag = pursue, special_type = [immunity_next]};
        20056 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_20056}};
        20057 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_20057}};
        20058 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_20058}};
        20059 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_20059},
                          act_flag = last_dmg};
        20060 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_20060},
                          act_flag = double_target};
        20061 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_20061}};
        20062 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_20062}};
        20063 ->
            Skill#c_skill{type_flag = revive,
                          action = {combat_script_skill, script_20063},
                          use_type = {die, die}};
        20064 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_20064},
                          act_flag = buff_target_templar};
        20065 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_20065}};
        20066 ->
            Skill#c_skill{type_flag = revive,
                          action = {combat_script_skill, script_20066},
                          use_type = {all, all}};
        20067 ->
            Skill#c_skill{type_flag = hp_low,
                          action = {combat_script_skill, script_20067}};
        20068 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_20068}};
        20069 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_20069}};
        20070 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_20070}};
        20071 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_20071}};
        20072 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_20072}};
        20073 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_20073}};
        20074 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_20074},
                          act_flag = last_dmg};
        20075 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_20075}};
        20076 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_20076},
                          use_type = {all, all}};
        20077 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_20077}};
        20078 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_20078}};
        20079 ->
            Skill#c_skill{type_flag = heal,
                          action = {combat_script_skill, script_20079}};
        20080 ->
            Skill#c_skill{type_flag = heal,
                          action = {combat_script_skill, script_20080}};
        20081 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_20081},
                          special_type = [suck_immune, buff_immune]};
        20082 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_20082}};
        20083 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_20083}};
        20084 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_20084}};
        31000 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_31000},
                          passive_type = [5]};
        31001 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_31001},
                          passive_type = [5]};
        31002 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_31002},
                          passive_type = [5]};
        31003 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_31003},
                          passive_type = [5]};
        31004 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_31004},
                          passive_type = [5]};
        31100 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_31100},
                          passive_type = [110]};
        32000 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_32000},
                          passive_type = [7]};
        32001 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_32001},
                          passive_type = [6]};
        33000 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_33000},
                          passive_type = [12]};
        33001 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_33001},
                          passive_type = [12]};
        33002 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_33002},
                          passive_type = [12]};
        33003 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_33003},
                          passive_type = [12]};
        33004 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_33004},
                          passive_type = [12]};
        34000 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_34000},
                          passive_type = [13]};
        35000 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_35000},
                          passive_type = [12]};
        35001 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_35001},
                          passive_type = [12]};
        35002 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_35002},
                          passive_type = [12]};
        35003 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_35003},
                          passive_type = [12]};
        40000 ->
            Skill#c_skill{action =
                              {combat_script_item, script_40000}};
        40001 ->
            Skill#c_skill{action =
                              {combat_script_item, script_40001}};
        40002 ->
            Skill#c_skill{action =
                              {combat_script_item, script_40002}};
        40003 ->
            Skill#c_skill{action =
                              {combat_script_item, script_40003}};
        40004 ->
            Skill#c_skill{action =
                              {combat_script_item, script_40004}};
        40005 ->
            Skill#c_skill{action =
                              {combat_script_item, script_40005}};
        40006 ->
            Skill#c_skill{action =
                              {combat_script_item, script_40006}};
        40007 ->
            Skill#c_skill{action =
                              {combat_script_item, script_40007}};
        40008 ->
            Skill#c_skill{action =
                              {combat_script_item, script_40008}};
        50000 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_50000}};
        50001 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_50001}};
        50002 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_50002}};
        50003 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_50003}};
        50004 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_50004}};
        50005 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_50005}};
        50006 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_50006}};
        50007 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_50007},
                          special_type = [under_control]};
        50008 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_50008}};
        50009 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_50009}};
        50010 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_50010}};
        50011 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_50011},
                          act_flag = variety_3};
        50012 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_50012},
                          act_flag = magic_suck};
        50013 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_50013},
                          act_flag = magic_suck};
        50014 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_50014}};
        50015 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_50015},
                          act_flag = snow_atk};
        50016 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_50016},
                          act_flag = variety_4};
        50017 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_50017}};
        50018 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_50018}};
        50019 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_50019},
                          act_flag = magic_suck};
        50020 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_50020}};
        50021 ->
            Skill#c_skill{type_flag = clear_buff,
                          action = {combat_script_skill, script_50021}};
        50022 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_50022}};
        50023 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_50023}};
        50024 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_50024}};
        50025 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_50025}};
        50026 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_50026}};
        50027 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_50027}};
        50028 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_50028},
                          act_flag = variety_6};
        50029 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_50029}};
        60000 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60000},
                          passive_type = [1]};
        60001 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60001},
                          act_flag = more_attack, passive_type = [3]};
        60002 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60002},
                          act_flag = more_attack, passive_type = [3]};
        60003 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60003},
                          passive_type = [1]};
        60004 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60004},
                          passive_type = [1], special_type = [anti_attack]};
        60005 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60005},
                          passive_type = [1], special_type = [anti_attack]};
        60006 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60006},
                          passive_type = [1], special_type = [anti_attack]};
        60007 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60007},
                          passive_type = [2]};
        60008 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60008},
                          passive_type = [1]};
        60009 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60009},
                          act_flag = pursue, passive_type = [3]};
        60010 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60010},
                          act_flag = pursue, passive_type = [3]};
        60011 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60011},
                          passive_type = [100, 8]};
        60012 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60012},
                          passive_type = [100]};
        60013 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60013},
                          passive_type = [1]};
        60014 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60014},
                          passive_type = [9]};
        60015 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60015},
                          passive_type = [2]};
        60016 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60016},
                          passive_type = [1]};
        60017 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60017},
                          passive_type = [1]};
        60018 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60018},
                          passive_type = [1]};
        60019 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60019},
                          passive_type = [1]};
        60020 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60020},
                          passive_type = [1]};
        60021 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60021},
                          passive_type = [2]};
        60022 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60022},
                          passive_type = [2]};
        60023 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60023},
                          passive_type = [1], special_type = [anti_attack]};
        60024 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60024},
                          passive_type = [100]};
        60025 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60025},
                          passive_type = [100, 1],
                          special_type = [anti_attack]};
        60026 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60026},
                          passive_type = [100, 10]};
        60027 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60027},
                          passive_type = [100]};
        60028 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60028},
                          passive_type = [1], special_type = [anti_attack]};
        60029 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60029},
                          passive_type = [1], special_type = [anti_attack]};
        60030 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60030},
                          passive_type = [100]};
        60031 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60031},
                          passive_type = [100]};
        60032 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60032},
                          passive_type = [1]};
        60033 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60033},
                          passive_type = [100]};
        60034 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60034},
                          passive_type = [2]};
        60035 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60035},
                          passive_type = [3, 4]};
        60036 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60036},
                          passive_type = [100]};
        60037 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60037},
                          passive_type = [11]};
        60038 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60038},
                          passive_type = [10]};
        60039 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60039},
                          passive_type = [100]};
        60040 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60040},
                          passive_type = [100]};
        60041 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60041},
                          passive_type = [100]};
        60042 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60042},
                          passive_type = [100, 1]};
        60043 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60043},
                          passive_type = [102]};
        60044 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60044},
                          passive_type = [102]};
        60045 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60045},
                          passive_type = [100]};
        60046 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60046},
                          passive_type = [100]};
        60047 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60047},
                          passive_type = [1], special_type = [anti_attack]};
        60048 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60048},
                          passive_type = [14]};
        60049 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60049},
                          passive_type = [2]};
        60050 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60050},
                          passive_type = [1]};
        60051 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60051},
                          passive_type = [100]};
        60052 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60052},
                          passive_type = [1]};
        60053 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60053},
                          passive_type = [100, 8]};
        60054 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60054},
                          passive_type = [1]};
        60055 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60055},
                          passive_type = [1]};
        60056 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60056},
                          passive_type = [1]};
        60057 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60057},
                          passive_type = [102]};
        60058 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60058},
                          passive_type = [1]};
        60059 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60059},
                          passive_type = [2]};
        60060 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60060},
                          passive_type = [103]};
        60061 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60061},
                          act_flag = more_attack, passive_type = [3]};
        60062 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60062},
                          passive_type = [100]};
        60063 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60063},
                          passive_type = [100]};
        60064 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60064},
                          passive_type = [100]};
        60065 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60065},
                          passive_type = [11, 100]};
        60066 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60066},
                          passive_type = [1]};
        60067 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60067},
                          passive_type = [2, 1]};
        60068 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60068},
                          passive_type = [3, 100]};
        60069 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60069},
                          passive_type = [100]};
        60070 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60070},
                          passive_type = [100]};
        60071 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60071},
                          passive_type = [100, 11]};
        60072 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60072},
                          passive_type = [11]};
        60073 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60073},
                          passive_type = [11]};
        60074 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60074},
                          passive_type = [1, 105]};
        60075 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60075},
                          passive_type = [100, 11]};
        60076 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60076},
                          passive_type = [1, 104]};
        60077 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60077},
                          passive_type = [106]};
        60078 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60078},
                          passive_type = [107]};
        60079 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60079},
                          passive_type = [100]};
        60080 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60080},
                          passive_type = [100]};
        60081 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60081},
                          passive_type = [1]};
        60082 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60082},
                          passive_type = [100, 11]};
        60083 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60083},
                          passive_type = [3]};
        60084 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60084},
                          act_flag = more_attack, passive_type = [3]};
        60085 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60085},
                          passive_type = [106]};
        60086 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60086},
                          passive_type = [100]};
        60087 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60087},
                          passive_type = [108]};
        60088 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60088},
                          passive_type = [11]};
        60089 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60089},
                          passive_type = [100]};
        60090 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60090},
                          passive_type = [111]};
        60091 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60091},
                          passive_type = [15]};
        60092 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60092},
                          passive_type = [1]};
        60093 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60093},
                          passive_type = [2]};
        60094 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60094},
                          passive_type = [2]};
        60095 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60095},
                          passive_type = [1]};
        60096 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60096},
                          passive_type = [1, 1]};
        60097 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60097},
                          passive_type = [100]};
        60098 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60098},
                          passive_type = [112]};
        60099 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60099},
                          passive_type = [100]};
        60100 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60100},
                          passive_type = [113, 1]};
        60101 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60101},
                          passive_type = [1]};
        60102 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60102},
                          passive_type = [114]};
        60103 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60103},
                          passive_type = [2]};
        60104 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60104},
                          passive_type = [102]};
        60105 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60105},
                          passive_type = [114]};
        60106 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60106},
                          passive_type = [11]};
        60107 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60107},
                          passive_type = [100, 8]};
        60108 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60108},
                          passive_type = [11]};
        60109 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60109},
                          passive_type = [100, 2]};
        60110 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60110},
                          passive_type = [114]};
        60111 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60111},
                          passive_type = [100]};
        60112 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60112},
                          passive_type = [3], act_flag = special_pursue};
        60113 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60113},
                          passive_type = [100, 16]};
        60114 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60114},
                          passive_type = [1], special_type = [anti_attack]};
        60115 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60115},
                          passive_type = [17]};
        60116 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60116},
                          passive_type = [114]};
        60117 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60117},
                          passive_type = [115]};
        60118 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60118},
                          passive_type = [8]};
        60119 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60119},
                          passive_type = [100]};
        60120 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60120},
                          passive_type = [2]};
        60121 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60121},
                          passive_type = [9, 11]};
        60122 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60122},
                          passive_type = [18, 11, 2]};
        60123 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60123},
                          passive_type = [1]};
        60124 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60124},
                          passive_type = [1]};
        60125 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60125},
                          passive_type = [1]};
        60126 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60126},
                          passive_type = [1, 2]};
        60127 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60127},
                          passive_type = [2]};
        60128 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60128},
                          passive_type = [11]};
        60129 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60129},
                          passive_type = [1]};
        60130 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60130},
                          passive_type = [100, 11]};
        60131 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60131},
                          passive_type = [1]};
        60132 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60132},
                          passive_type = [100]};
        60133 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60133},
                          passive_type = [19]};
        60134 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60134},
                          passive_type = [3]};
        60135 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60135},
                          passive_type = [20]};
        60136 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60136},
                          passive_type = [100]};
        60137 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60137},
                          passive_type = [100, 22]};
        60138 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60138},
                          passive_type = [2]};
        60139 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60139},
                          passive_type = [1, 100]};
        60140 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60140},
                          passive_type = [2]};
        60141 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60141},
                          passive_type = [1]};
        60142 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60142},
                          passive_type = [2]};
        60143 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60143},
                          passive_type = [100, 1]};
        60144 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60144},
                          passive_type = [1, 2]};
        60145 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60145},
                          passive_type = [1, 2], special_type = [anti_attack]};
        60146 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60146},
                          passive_type = [100, 11, 5]};
        60147 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60147},
                          passive_type = [1]};
        60148 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60148},
                          passive_type = [1]};
        60149 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60149},
                          passive_type = [100, 114]};
        60150 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60150},
                          passive_type = [1]};
        60151 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60151},
                          passive_type = [1, 23]};
        60152 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60152},
                          passive_type = [1]};
        60153 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60153},
                          passive_type = [18, 2]};
        60154 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60154},
                          passive_type = [18, 4]};
        60155 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60155},
                          passive_type = [24]};
        60156 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60156},
                          passive_type = [18, 23]};
        60157 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60157},
                          passive_type = [114]};
        60158 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60158},
                          passive_type = [1]};
        60159 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60159},
                          passive_type = [1, 2]};
        60160 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60160},
                          special_type = [anti_attack],
                          passive_type = [100, 1]};
        60161 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60161},
                          passive_type = [1]};
        60162 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60162},
                          passive_type = [2]};
        60163 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60163},
                          passive_type = [1]};
        60164 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60164},
                          passive_type = [1, 18], act_flag = variety_7};
        60165 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60165},
                          passive_type = [1], act_flag = magic_suck};
        60166 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60166},
                          passive_type = [5]};
        60167 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60167},
                          passive_type = [2]};
        60168 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60168},
                          passive_type = [114]};
        60169 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60169},
                          passive_type = [1]};
        60170 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60170},
                          special_type = [anti_attack], passive_type = [1]};
        60171 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60171},
                          passive_type = [2]};
        60172 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60172},
                          passive_type = [100, 1]};
        60173 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60173},
                          passive_type = [1]};
        60174 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60174},
                          passive_type = [5, 114]};
        60175 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60175},
                          passive_type = [1]};
        60176 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60176},
                          passive_type = [1, 3]};
        60177 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60177},
                          passive_type = [1]};
        60178 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60178},
                          passive_type = [100]};
        60179 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60179},
                          passive_type = [12]};
        60180 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60180},
                          passive_type = [100, 1]};
        60181 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60181},
                          passive_type = [100]};
        60182 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60182},
                          passive_type = [100]};
        60183 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60183},
                          passive_type = [1]};
        60184 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60184},
                          passive_type = [1]};
        60185 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60185},
                          passive_type = [1]};
        60186 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60186},
                          passive_type = [1]};
        60187 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60187},
                          passive_type = [2]};
        60188 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60188},
                          passive_type = [100]};
        60189 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60189},
                          passive_type = [1]};
        60190 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60190},
                          passive_type = [1]};
        60191 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60191},
                          passive_type = [1]};
        60192 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60192},
                          passive_type = [1]};
        60193 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60193},
                          passive_type = [1]};
        700001 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_700001}};
        700002 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_700002},
                          passive_type = [1, 2]};
        700003 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_700003},
                          passive_type = [1]};
        700004 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_700004},
                          passive_type = [100, 11, 5, 1, 2]};
        700005 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_700005},
                          passive_type = [100, 11, 5, 1, 2]};
        700006 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_700006},
                          passive_type = [1, 2], special_type = [anti_attack]};
        700007 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_700007},
                          passive_type = [9, 11]};
        700008 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_700008},
                          passive_type = [100, 10]};
        700009 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_700009},
                          passive_type = [10]};
        700010 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_700010},
                          passive_type = [1]};
        700011 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_700011},
                          passive_type = [100, 10]};
        700012 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_700012},
                          passive_type = [1, 2]};
        60194 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60194},
                          passive_type = [23]};
        60195 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60195},
                          passive_type = [5, 1, 23]};
        60196 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60196},
                          passive_type = [100]};
        60197 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60197},
                          passive_type = [100, 107]};
        60198 ->
            Skill#c_skill{action =
                              {combat_script_skill, script_60198},
                          passive_type = [24]};
        _ -> undefined
    end.

script_10000(Skill = #c_skill{id = 1000,
                              skill = S = #skill{attack_type = AttackType}},
             Self = #fighter{type = Type, classes = Classes}, Target,
             SkillAddtArg) ->
    NewAttackType = combat_util:classes_to_attack_type(Type,
                                                       Classes,
                                                       AttackType),
    combat_script_skill_calc:attack(Skill#c_skill{skill =
                                                      S#skill{attack_type =
                                                                  NewAttackType}},
                                    Self,
                                    Target,
                                    SkillAddtArg,
                                    #action_effect{});
script_10000(Skill = #c_skill{}, Self, Target,
             SkillAddtArg) ->
    combat_script_skill_calc:attack(Skill,
                                    Self,
                                    Target,
                                    SkillAddtArg,
                                    #action_effect{}).

script_10001(Skill, Self, Target, SkillAddtArg) ->
    combat_script_skill_calc:defence(Skill,
                                     Self,
                                     Target,
                                     SkillAddtArg,
                                     #action_effect{}).

script_10002(Skill, Self, Target, SkillAddtArg) ->
    combat_script_skill_calc:escape(Skill,
                                    Self,
                                    Target,
                                    SkillAddtArg,
                                    #action_effect{}).

script_10003(Skill, Self, Target, SkillAddtArg) ->
    combat_script_skill_calc:protect(Skill,
                                     Self,
                                     Target,
                                     SkillAddtArg,
                                     #action_effect{}).

script_10004(Skill, Self, Target, SkillAddtArg) ->
    combat_script_skill_calc:use_item(Skill,
                                      Self,
                                      Target,
                                      SkillAddtArg,
                                      #action_effect{}).

script_10005(Skill, Self, _Target, _SkillAddtArg) ->
    combat_play:add_sub_play(combat_play:gen_sub_skill_play(wait,
                                                            {Self, Skill})).

script_10006(Skill, Self, Target, SkillAddtArg) ->
    combat_script_skill_calc:catch_pet(Skill,
                                       Self,
                                       Target,
                                       SkillAddtArg,
                                       #action_effect{}).

script_10007(Skill, Self, Target, SkillAddtArg) ->
    combat_script_skill_calc:suicide(Skill,
                                     Self,
                                     Target,
                                     SkillAddtArg,
                                     #action_effect{}).

script_10008(Skill, Self, Target, SkillAddtArg) ->
    combat_script_skill_calc:summon_pet(Skill,
                                        Self,
                                        Target,
                                        SkillAddtArg,
                                        #action_effect{}).

script_10009(Skill, Self, Target, SkillAddtArg) ->
    combat_script_skill_calc:summon_child(Skill,
                                          Self,
                                          Target,
                                          SkillAddtArg,
                                          #action_effect{}).

script_20000(Skill, Self, Target, SkillAddtArg) ->
    ActionEffect = #action_effect{},
    combat_script_skill_calc:cast(attack,
                                  Skill,
                                  Self,
                                  Target,
                                  SkillAddtArg,
                                  ActionEffect).

script_20001(Skill, Self, Target, SkillAddtArg) ->
    ActionEffect = #action_effect{hit_ratio = 100000},
    combat_script_skill_calc:attack(Skill,
                                    Self,
                                    Target,
                                    SkillAddtArg,
                                    ActionEffect).

script_20002(Skill = #c_skill{skill =
                                  #skill{script_args = [HealRatio, HealHp]}},
             Self, Target = #fighter{hp_max = HpMax},
             SkillAddtArg) ->
    AllHealHp = round(HealHp + HpMax * HealRatio / 1000),
    ActionEffect = #action_effect{heal_hp = AllHealHp},
    combat_script_skill_calc:heal(Skill,
                                  Self,
                                  Target,
                                  SkillAddtArg,
                                  ActionEffect#action_effect{can_anti_heal =
                                                                 1});
script_20002(Skill, Self, _, _) -> err_ai(Skill, Self).

script_20003(Skill = #c_skill{skill =
                                  #skill{script_args = [Ratio, Base]}},
             Self = #fighter{attr = #attr{magic_dmg = MagicDmg}},
             Target, SkillAddtArg) ->
    HolyAddt = round(Base + MagicDmg * Ratio / 1000),
    ActionEffect = #action_effect{holy_addt = HolyAddt},
    combat_script_skill_calc:attack(Skill,
                                    Self,
                                    Target,
                                    SkillAddtArg,
                                    ActionEffect);
script_20003(Skill, Self, _, _) -> err_ai(Skill, Self).

script_20004(_Skill, _Self, #fighter{is_die = 0},
             _SkillAddtArg) ->
    ok;
script_20004(Skill = #c_skill{skill =
                                  #skill{script_args = [Ratio, Val]}},
             Self,
             Target = #fighter{hp_max = HpMax,
                               combat_init_attr =
                                   #combat_init_attr{eff_revive_ratio =
                                                         EffReviceRatio}},
             SkillAddtArg) ->
    HealHp = round(max(1,
                       Val + HpMax * (Ratio + EffReviceRatio) / 1000)),
    ActionEffect = #action_effect{heal_hp = HealHp},
    Tvc = [{is_die, 0, 0}],
    Tc = [{2, 0, 0}],
    SkillAddtArg1 =
        SkillAddtArg#c_skill_addt_arg{target_val_changed = Tvc,
                                      target_changed = Tc},
    combat_stat:update_revive(Target),
    combat_script_skill_calc:heal(Skill,
                                  Self,
                                  Target,
                                  SkillAddtArg1,
                                  ActionEffect);
script_20004(Skill, Self, _, _) -> err_ai(Skill, Self).

script_20005(Skill = #c_skill{skill =
                                  #skill{script_args =
                                             [HealRatio,
                                              HealHp,
                                              HpLine,
                                              AddRatio,
                                              ClearNum]}},
             Self = #fighter{id = Sid},
             Target = #fighter{id = Tid, hp = Hp, hp_max = HpMax,
                               buffs = Buffs},
             SkillAddtArg) ->
    ExtRatio = case Hp / HpMax < HpLine / 1000 of
                   true -> AddRatio;
                   false -> 0
               end,
    AllHealHp = round((HealHp + HpMax * HealRatio / 1000) *
                          (1000 + ExtRatio)
                          / 1000),
    ClearBuff = lists:sublist([Buff
                               || Buff = #c_buff{can_dispel = 1,
                                                 eff_type = debuff}
                                      <- Buffs],
                              ClearNum),
    lists:foreach(fun (Buff) ->
                          combat_buff:buff_del(Tid, Sid, Buff)
                  end,
                  ClearBuff),
    combat_stat:update_dispel_num(Sid, ClearBuff),
    combat_pet:dispel_pet(ClearBuff, Skill, Self, Target),
    ActionEffect = #action_effect{heal_hp = AllHealHp,
                                  can_anti_heal = 1},
    combat_script_skill_calc:heal(Skill,
                                  Self,
                                  Target,
                                  SkillAddtArg,
                                  ActionEffect);
script_20005(Skill, Self, _, _) -> err_ai(Skill, Self).

script_20006(Skill = #c_skill{skill =
                                  #skill{script_args =
                                             [LayerRatio0,
                                              LayerRatio1,
                                              LayerRatio2,
                                              LayerRatio3,
                                              DmgMpRatio]}},
             Self,
             Target = #fighter{attr = #attr{mp_max = MpMax},
                               special_status = #special_status{bleed = Bleed}},
             SkillAddtArg) ->
    Ratio = case Bleed of
                0 -> LayerRatio0;
                1 -> LayerRatio1;
                2 -> LayerRatio2;
                _ -> LayerRatio3
            end,
    DmgMp = round(MpMax * DmgMpRatio / 1000),
    Tvc = [{mp, 1, -DmgMp}],
    Tc = [{1, -DmgMp, 0}],
    ActionEffect = #action_effect{suck_hp = Ratio,
                                  target_val_changes = Tvc,
                                  target_changes = Tc},
    combat_script_skill_calc:attack(Skill,
                                    Self,
                                    Target,
                                    SkillAddtArg,
                                    ActionEffect);
script_20006(Skill, Self, _, _) -> err_ai(Skill, Self).

script_20007(Skill = #c_skill{skill =
                                  S = #skill{script_args =
                                                 [Ratio0,
                                                  Ratio1,
                                                  Ratio2,
                                                  Ratio3],
                                             buff_target = BuffTarget}},
             Self,
             Target = #fighter{special_status =
                                   #special_status{bleed = Bleed}},
             SkillAddtArg) ->
    Ratio = case Bleed of
                0 -> Ratio0;
                1 -> Ratio1;
                2 -> Ratio2;
                _ -> Ratio3
            end,
    NewBuffTarget = case util:rand(1, 1000) =< Ratio of
                        true -> BuffTarget;
                        false -> []
                    end,
    NewSkill = Skill#c_skill{skill =
                                 S#skill{buff_target = NewBuffTarget}},
    ActionEffect = #action_effect{},
    combat_script_skill_calc:attack(NewSkill,
                                    Self,
                                    Target,
                                    SkillAddtArg,
                                    ActionEffect);
script_20007(Skill, Self, _, _) -> err_ai(Skill, Self).

script_20008(Skill = #c_skill{target_no = ActionNo,
                              special_type = SpecialType, skill = S = #skill{}},
             Self = #fighter{}, Target = #fighter{}, SkillAddtArg) ->
    NewActionNo = case ActionNo > 2 of
                      true -> 2;
                      _ -> ActionNo
                  end,
    Sc = [{7, NewActionNo, 0}],
    NewSkill = case lists:member(max_energy, SpecialType)
                        =:= true
                   of
                   true -> Skill;
                   false ->
                       Skill#c_skill{skill = S#skill{buff_target = []}}
               end,
    ActionEffect = #action_effect{},
    SkillAddtArg1 =
        SkillAddtArg#c_skill_addt_arg{self_changed = Sc},
    combat_script_skill_calc:attack(NewSkill,
                                    Self,
                                    Target,
                                    SkillAddtArg1,
                                    ActionEffect);
script_20008(Skill, Self, _, _) -> err_ai(Skill, Self).

script_20009(Skill = #c_skill{skill =
                                  #skill{script_args = [Ratio, Base]}},
             Self = #fighter{attr =
                                 #attr{phy_dmg = SelfPhyDmg,
                                       magic_dmg = SelfMagicDmg}},
             Target = #fighter{attr =
                                   #attr{phy_dmg = PhyDmg,
                                         magic_dmg = MagicDmg}},
             SkillAddtArg) ->
    Dmg = max(PhyDmg, MagicDmg),
    SelfDmg = max(SelfPhyDmg, SelfMagicDmg),
    HolyAddt = round(min(Dmg * Ratio / 1000 + Base,
                         SelfDmg * 2.5)),
    ActionEffect = #action_effect{holy_addt = HolyAddt},
    combat_script_skill_calc:attack(Skill,
                                    Self,
                                    Target,
                                    SkillAddtArg,
                                    ActionEffect);
script_20009(Skill, Self, _, _) -> err_ai(Skill, Self).

script_20010(Skill = #c_skill{skill =
                                  #skill{script_args = [Ratio]}},
             Self = #fighter{},
             Target = #fighter{hp = Hp, hp_max = HpMax},
             SkillAddtArg) ->
    HolyAddt = round((HpMax - Hp) * Ratio / 1000),
    ActionEffect = #action_effect{holy_addt = HolyAddt},
    combat_script_skill_calc:attack(Skill,
                                    Self,
                                    Target,
                                    SkillAddtArg,
                                    ActionEffect);
script_20010(Skill, Self, _, _) -> err_ai(Skill, Self).

script_20011(Skill = #c_skill{skill =
                                  #skill{script_args = [Ratio]}},
             Self = #fighter{}, Target = #fighter{}, SkillAddtArg) ->
    ActionEffect = #action_effect{dec_def_ratio = Ratio},
    combat_script_skill_calc:attack(Skill,
                                    Self,
                                    Target,
                                    SkillAddtArg,
                                    ActionEffect);
script_20011(Skill, Self, _, _) -> err_ai(Skill, Self).

script_20012(Skill = #c_skill{skill =
                                  #skill{script_args = [AddRatio]}},
             Self = #fighter{attr = #attr{atk_speed = AtkSpeed1}},
             Target = #fighter{attr = #attr{atk_speed = AtkSpeed2}},
             SkillAddtArg) ->
    ActDmgRatio = case AtkSpeed1 > AtkSpeed2 of
                      true -> AddRatio;
                      false -> 0
                  end,
    ActionEffect = #action_effect{act_dmg_ratio =
                                      ActDmgRatio},
    combat_script_skill_calc:attack(Skill,
                                    Self,
                                    Target,
                                    SkillAddtArg,
                                    ActionEffect);
script_20012(Skill, Self, _, _) -> err_ai(Skill, Self).

script_20013(Skill = #c_skill{skill = #skill{}},
             Self = #fighter{},
             Target = #fighter{attr =
                                   #attr{phy_dmg = PhyDmg,
                                         magic_dmg = MagicDmg}},
             SkillAddtArg) ->
    Ratio = MagicDmg / PhyDmg,
    CritRatio = if Ratio >= 2 -> 150;
                   Ratio >= 1 -> 50;
                   true -> 0
                end,
    ActionEffect = #action_effect{crit_ratio = CritRatio},
    combat_script_skill_calc:attack(Skill,
                                    Self,
                                    Target,
                                    SkillAddtArg,
                                    ActionEffect);
script_20013(Skill, Self, _, _) -> err_ai(Skill, Self).

script_20014(Skill = #c_skill{skill =
                                  #skill{script_args =
                                             [HealRatio,
                                              HealHp,
                                              Type,
                                              HealLevRatio]}},
             Self = #fighter{id = Sid},
             Target = #fighter{id = Tid, buffs = Buffs,
                               hp_max = HpMax, lev = Tlev},
             SkillAddtArg) ->
    ClearBuff = case Type of
                    1 ->
                        [Buff
                         || Buff = #c_buff{can_dispel = 1, eff_type = buff}
                                <- Buffs];
                    2 ->
                        [Buff
                         || Buff = #c_buff{can_dispel = 1, eff_type = debuff}
                                <- Buffs];
                    3 ->
                        [Buff
                         || Buff = #c_buff{can_dispel = 1, eff_type = debuff,
                                           sec_type = SecType}
                                <- Buffs,
                            SecType =/= control];
                    4 ->
                        [Buff
                         || Buff = #c_buff{can_dispel = 1, sec_type = control}
                                <- Buffs];
                    5 -> [Buff || Buff = #c_buff{} <- Buffs];
                    _ -> []
                end,
    lists:foreach(fun (Buff) ->
                          combat_buff:buff_del(Tid, Sid, Buff)
                  end,
                  ClearBuff),
    combat_stat:update_dispel_num(Sid, ClearBuff),
    combat_pet:dispel_pet(ClearBuff, Skill, Self, Target),
    AllHealHp = round(HealHp + HpMax * HealRatio / 1000),
    AllHealHp1 = case HealLevRatio > 0 of
                     true -> min(AllHealHp, round(Tlev * HealLevRatio));
                     _ -> AllHealHp
                 end,
    ActionEffect = #action_effect{heal_hp = AllHealHp1,
                                  can_anti_heal = 1},
    combat_script_skill_calc:heal(Skill,
                                  Self,
                                  Target,
                                  SkillAddtArg,
                                  ActionEffect);
script_20014(Skill, Self, _, _) -> err_ai(Skill, Self).

script_20015(Skill = #c_skill{skill =
                                  #skill{script_args =
                                             [_Ratio,
                                              _KillMoreNum,
                                              _DmgRatioList]}},
             Self, Target, SkillAddtArg) ->
    ActionEffect = #action_effect{},
    combat_script_skill_calc:attack(Skill,
                                    Self,
                                    Target,
                                    SkillAddtArg,
                                    ActionEffect),
    script_20015_end(Skill, Self, Target);
script_20015(Skill, Self, _, _) -> err_ai(Skill, Self).

script_20015_end(#c_skill{id = SkillId,
                          skill =
                              #skill{script_args =
                                         [Ratio, KillMoreNum, DmgRatioList]}},
                 #fighter{id = Sid}, #fighter{id = Tid}) ->
    CheckNumFlag = case combat_cache:f(by_id, Sid) of
                       #fighter{is_die = 0} ->
                           case combat_cache:f(by_id, Tid) of
                               #fighter{is_die = 1} ->
                                   case
                                       combat_cache:get_context_elem([#combat_context.pursue_attack_list])
                                       of
                                       [PursueAttack]
                                           when is_list(PursueAttack) ->
                                           Len = length(PursueAttack),
                                           case Len < KillMoreNum of
                                               true -> {true, Len};
                                               false -> false
                                           end;
                                       _ -> false
                                   end;
                               _ -> false
                           end;
                       _ -> false
                   end,
    case CheckNumFlag of
        {true, HasAttack} ->
            DmgRatio = case length(DmgRatioList) > HasAttack of
                           true -> lists:nth(HasAttack + 1, DmgRatioList);
                           false ->
                               logger:error("无法找到[~w]追击参数[~w][~w][~w]",
                                            [SkillId,
                                             HasAttack,
                                             KillMoreNum,
                                             DmgRatioList],
                                            combat_script_skill,
                                            1487),
                               1000
                       end,
            case util:rand(1, 1000) =< Ratio of
                true ->
                    combat_cache:save_context([{#combat_context.pursue_attack,
                                                {true, DmgRatio}}]);
                false -> skip
            end;
        false -> skip
    end.

script_20016(Skill = #c_skill{special_type =
                                  SpecialType},
             Self = #fighter{id = Sid},
             Target = #fighter{id = Tid, buffs = TBuffs},
             SkillAddtArg) ->
    case lists:member(max_energy, SpecialType) =:= true of
        true ->
            ClearBuff = [Buff
                         || Buff = #c_buff{can_dispel = 1, eff_type = buff}
                                <- TBuffs],
            ClearBuff1 = case util:rand(1, 1000) =< 150 of
                             true ->
                                 lists:keydelete(30006, #c_buff.id, ClearBuff);
                             _ -> ClearBuff
                         end,
            lists:foreach(fun (Buff) ->
                                  combat_buff:buff_del(Tid, Sid, Buff)
                          end,
                          ClearBuff1),
            ok;
        false -> skip
    end,
    ActionEffect = #action_effect{},
    combat_script_skill_calc:attack(Skill,
                                    Self,
                                    Target,
                                    SkillAddtArg,
                                    ActionEffect);
script_20016(Skill, Self, _, _) -> err_ai(Skill, Self).

script_20017(Skill = #c_skill{skill =
                                  #skill{script_args = [SkillId, CdReduce]}},
             Self = #fighter{skill_cooldown = Cds},
             Target = #fighter{}, SkillAddtArg) ->
    NewCds = case lists:keyfind(SkillId, 1, Cds) of
                 {_, CdTimeLeft} ->
                     lists:keyreplace(SkillId,
                                      1,
                                      Cds,
                                      {SkillId, max(CdTimeLeft - CdReduce, 0)});
                 _ -> Cds
             end,
    Svc = [{skill_cooldown, 0, NewCds}],
    NewSkillAddtArg =
        SkillAddtArg#c_skill_addt_arg{self_val_changed = Svc},
    ActionEffect = #action_effect{},
    combat_script_skill_calc:cast(attack,
                                  Skill,
                                  Self,
                                  Target,
                                  NewSkillAddtArg,
                                  ActionEffect);
script_20017(Skill, Self, _, _) -> err_ai(Skill, Self).

script_20018(Skill = #c_skill{skill =
                                  #skill{script_args = [SkillId, SkillLev]}},
             Self = #fighter{}, Target = #fighter{id = Tid},
             SkillAddtArg) ->
    Svc = [{pre_action, 0, {SkillId, SkillLev, Tid}}],
    NewSkillAddtArg =
        SkillAddtArg#c_skill_addt_arg{self_val_changed = Svc},
    ActionEffect = #action_effect{hit_ratio = 100000},
    combat_script_skill_calc:cast(attack,
                                  Skill,
                                  Self,
                                  Target,
                                  NewSkillAddtArg,
                                  ActionEffect);
script_20018(Skill, Self, _, _) -> err_ai(Skill, Self).

script_20019(Skill = #c_skill{skill =
                                  #skill{script_args = [HolyRatio, Base]}},
             Self = #fighter{attr = #attr{phy_dmg = PhyDmg}},
             Target = #fighter{}, SkillAddtArg) ->
    HolyAddt = round(PhyDmg * HolyRatio / 1000 + Base),
    ActionEffect = #action_effect{holy_addt = HolyAddt},
    combat_script_skill_calc:attack(Skill,
                                    Self,
                                    Target,
                                    SkillAddtArg,
                                    ActionEffect);
script_20019(Skill, Self, _, _) -> err_ai(Skill, Self).

script_20020(Skill = #c_skill{skill =
                                  #skill{script_args =
                                             [_KillMoreNum, DmgRatioList]}},
             Self, Target,
             SkillAddtArg = #c_skill_addt_arg{skip_exec = SkipExec})
    when is_list(DmgRatioList) ->
    ActionEffect = #action_effect{},
    case SkipExec of
        1 -> skip;
        _ ->
            combat_script_skill_calc:attack(Skill,
                                            Self,
                                            Target,
                                            SkillAddtArg,
                                            ActionEffect)
    end,
    script_20020_end(Skill, Self, Target);
script_20020(Skill, Self, _, _) -> err_ai(Skill, Self).

script_20020_end(#c_skill{id = SkillId,
                          skill =
                              #skill{script_args =
                                         [KillMoreNum, DmgRatioList]}},
                 #fighter{id = Sid}, #fighter{}) ->
    CheckNumFlag = case combat_cache:f(by_id, Sid) of
                       #fighter{is_die = 0} ->
                           case
                               combat_cache:get_context_elem([#combat_context.pursue_attack_list])
                               of
                               [PursueAttack] when is_list(PursueAttack) ->
                                   Len = length(PursueAttack),
                                   case Len < KillMoreNum of
                                       true -> {true, Len};
                                       false -> false
                                   end;
                               _ -> false
                           end;
                       _ -> false
                   end,
    case CheckNumFlag of
        {true, HasAttack} ->
            DmgRatio = case length(DmgRatioList) > HasAttack of
                           true -> lists:nth(HasAttack + 1, DmgRatioList);
                           false ->
                               logger:error("无法找到[~w]追击参数[~w][~w][~w]",
                                            [SkillId,
                                             HasAttack,
                                             KillMoreNum,
                                             DmgRatioList],
                                            combat_script_skill,
                                            1582),
                               1000
                       end,
            combat_cache:save_context([{#combat_context.pursue_attack,
                                        {true, DmgRatio}}]);
        false -> skip
    end.

script_20021(Skill = #c_skill{skill =
                                  #skill{script_args =
                                             [_Ratio,
                                              _KillMoreNum,
                                              DmgRatioList]}},
             Self, Target, SkillAddtArg)
    when is_list(DmgRatioList) ->
    ActionEffect = #action_effect{},
    combat_script_skill_calc:attack(Skill,
                                    Self,
                                    Target,
                                    SkillAddtArg,
                                    ActionEffect),
    script_20021_end(Skill, Self, Target);
script_20021(Skill, Self, _, _) -> err_ai(Skill, Self).

script_20021_end(#c_skill{id = SkillId,
                          skill =
                              #skill{script_args =
                                         [Ratio, KillMoreNum, DmgRatioList]}},
                 #fighter{id = Sid}, #fighter{id = Tid}) ->
    Flag = case combat_cache:f(by_id, Sid) of
               #fighter{is_die = 0} ->
                   case combat_cache:f(by_id, Tid) of
                       #fighter{is_die = 1} -> true;
                       _ ->
                           case
                               combat_cache:get_context_elem([#combat_context.skill_pursue_crit])
                               of
                               [true] -> true;
                               _ -> false
                           end
                   end;
               _ -> false
           end,
    CheckNumFlag = case Flag of
                       true ->
                           case
                               combat_cache:get_context_elem([#combat_context.pursue_attack_list])
                               of
                               [PursueAttack] when is_list(PursueAttack) ->
                                   Len = length(PursueAttack),
                                   case Len < KillMoreNum of
                                       true -> {true, Len};
                                       false -> false
                                   end;
                               _ -> false
                           end;
                       false -> false
                   end,
    case CheckNumFlag of
        {true, HasAttack} ->
            DmgRatio = case length(DmgRatioList) > HasAttack of
                           true -> lists:nth(HasAttack + 1, DmgRatioList);
                           false ->
                               logger:error("无法找到[~w]追击参数[~w][~w][~w]",
                                            [SkillId,
                                             HasAttack,
                                             KillMoreNum,
                                             DmgRatioList],
                                            combat_script_skill,
                                            1631),
                               1000
                       end,
            case util:rand(1, 1000) =< Ratio of
                true ->
                    combat_cache:save_context([{#combat_context.pursue_attack,
                                                {true, DmgRatio}}]);
                false -> skip
            end;
        _ -> skip
    end.

script_20022(Skill = #c_skill{action_no = ActionNo,
                              skill =
                                  #skill{elem_type = ElemType,
                                         script_args =
                                             [ActNo, AtkRatio, HolyRatio]}},
             Self = #fighter{attr =
                                 #attr{phy_dmg = PhyDmg, magic_dmg = MagicDmg}},
             Target, SkillAddtArg) ->
    ActionEffect = case ActionNo =:= ActNo of
                       true ->
                           Atk = case ElemType of
                                     1 -> MagicDmg;
                                     _ -> PhyDmg
                                 end,
                           NewAtk = round(Atk * AtkRatio / 1000),
                           HolyAddt = round(Atk * HolyRatio / 1000),
                           #action_effect{default_atk = NewAtk,
                                          holy_addt = HolyAddt};
                       false -> #action_effect{}
                   end,
    combat_script_skill_calc:attack(Skill,
                                    Self,
                                    Target,
                                    SkillAddtArg,
                                    ActionEffect);
script_20022(Skill, Self, _, _) -> err_ai(Skill, Self).

script_20023(Skill = #c_skill{skill =
                                  #skill{elem_type = ElemType,
                                         script_args = [Type, Ratio, MaxVal]}},
             Self = #fighter{attr =
                                 #attr{phy_dmg = PhyDmg, magic_dmg = MagicDmg}},
             Target = #fighter{hp = Hp, hp_max = HpMax},
             SkillAddtArg) ->
    DirectDmg = case Type of
                    1 -> round(Hp * Ratio / 1000);
                    _ -> round(HpMax * Ratio / 1000)
                end,
    Atk = case ElemType of
              1 -> MagicDmg;
              _ -> PhyDmg
          end,
    NewDirectDmg = case MaxVal > 0 of
                       true -> min(round(Atk * MaxVal / 1000), DirectDmg);
                       false -> DirectDmg
                   end,
    ActionEffect = #action_effect{direct_dmg =
                                      NewDirectDmg},
    combat_script_skill_calc:attack(Skill,
                                    Self,
                                    Target,
                                    SkillAddtArg,
                                    ActionEffect);
script_20023(Skill, Self, _, _) -> err_ai(Skill, Self).

script_20024(Skill = #c_skill{skill =
                                  #skill{script_args =
                                             [Holy1,
                                              Holy2,
                                              Holy3,
                                              Holy4,
                                              Holy5]}},
             Self = #fighter{},
             Target = #fighter{hp = Hp, hp_max = HpMax},
             SkillAddtArg) ->
    V1 = Hp / HpMax * 100,
    Holy = if V1 > 40 andalso V1 =< 50 -> Holy1;
              V1 > 30 andalso V1 =< 40 -> Holy2;
              V1 > 20 andalso V1 =< 30 -> Holy3;
              V1 > 10 andalso V1 =< 20 -> Holy4;
              V1 =< 10 -> Holy5;
              true -> 0
           end,
    ActionEffect = #action_effect{holy_addt = Holy},
    combat_script_skill_calc:attack(Skill,
                                    Self,
                                    Target,
                                    SkillAddtArg,
                                    ActionEffect);
script_20024(Skill, Self, _, _) -> err_ai(Skill, Self).

script_20025(Skill = #c_skill{skill =
                                  #skill{script_args = [ValA, ValB]}},
             Self = #fighter{lev = Lev}, Target = #fighter{},
             SkillAddtArg) ->
    HolyAddt = round(Lev * ValA + ValB),
    ActionEffect = #action_effect{holy_addt = HolyAddt},
    combat_script_skill_calc:attack(Skill,
                                    Self,
                                    Target,
                                    SkillAddtArg,
                                    ActionEffect);
script_20025(Skill, Self, _, _) -> err_ai(Skill, Self).

script_20026(Skill = #c_skill{skill =
                                  #skill{script_args = [Type]}},
             Self = #fighter{id = Sid},
             Target = #fighter{id = Tid, buffs = Buffs},
             SkillAddtArg) ->
    ClearBuff = case Type of
                    1 ->
                        [Buff
                         || Buff = #c_buff{can_dispel = 1, eff_type = buff}
                                <- Buffs];
                    2 ->
                        [Buff
                         || Buff = #c_buff{can_dispel = 1, eff_type = debuff}
                                <- Buffs];
                    3 ->
                        [Buff
                         || Buff = #c_buff{can_dispel = 1, eff_type = debuff,
                                           sec_type = SecType}
                                <- Buffs,
                            SecType =/= control];
                    4 ->
                        [Buff
                         || Buff = #c_buff{can_dispel = 1, sec_type = control}
                                <- Buffs];
                    _ -> []
                end,
    lists:foreach(fun (Buff) ->
                          combat_buff:buff_del(Tid, Sid, Buff)
                  end,
                  ClearBuff),
    combat_stat:update_dispel_num(Sid, ClearBuff),
    combat_pet:dispel_pet(ClearBuff, Skill, Self, Target),
    combat_script_skill_calc:cast(attack,
                                  Skill,
                                  Self,
                                  Target,
                                  SkillAddtArg,
                                  #action_effect{});
script_20026(Skill, Self, _, _) -> err_ai(Skill, Self).

script_20027(Skill = #c_skill{skill =
                                  S = #skill{script_args =
                                                 [Ratio,
                                                  Val,
                                                  DelRatio,
                                                  DelType],
                                             buff_target = BuffTarget}},
             Self = #fighter{id = Sid},
             Target = #fighter{id = Tid, hp_max = HpMax,
                               is_die = IsDie, buffs = Buffs,
                               combat_init_attr =
                                   #combat_init_attr{eff_revive_ratio =
                                                         EffReviceRatio}},
             SkillAddtArg) ->
    {Tvc, Tc, NewBuffTarget, HealHp, CanAntiHeal} = case
                                                        IsDie
                                                        of
                                                        1 ->
                                                            combat_stat:update_revive(Target),
                                                            {[{is_die, 0, 0}],
                                                             [{2, 0, 0}],
                                                             [],
                                                             round(max(1,
                                                                       Val +
                                                                           HpMax
                                                                               *
                                                                               (Ratio
                                                                                    +
                                                                                    EffReviceRatio)
                                                                               /
                                                                               1000)),
                                                             0};
                                                        0 ->
                                                            {[],
                                                             [],
                                                             BuffTarget,
                                                             round(max(1,
                                                                       Val +
                                                                           HpMax
                                                                               *
                                                                               Ratio
                                                                               /
                                                                               1000)),
                                                             1}
                                                    end,
    case util:rand(1, 1000) =< DelRatio of
        true ->
            ClearBuff = case DelType of
                            1 ->
                                [Buff
                                 || Buff = #c_buff{can_dispel = 1,
                                                   eff_type = buff}
                                        <- Buffs];
                            2 ->
                                [Buff
                                 || Buff = #c_buff{can_dispel = 1,
                                                   eff_type = debuff}
                                        <- Buffs];
                            3 ->
                                [Buff
                                 || Buff = #c_buff{can_dispel = 1,
                                                   eff_type = debuff,
                                                   sec_type = SecType}
                                        <- Buffs,
                                    SecType =/= control];
                            4 ->
                                [Buff
                                 || Buff = #c_buff{can_dispel = 1,
                                                   sec_type = control}
                                        <- Buffs];
                            _ -> []
                        end,
            lists:foreach(fun (Buff) ->
                                  combat_buff:buff_del(Tid, Sid, Buff)
                          end,
                          ClearBuff);
        false -> skip
    end,
    ActionEffect = #action_effect{heal_hp = HealHp,
                                  can_anti_heal = CanAntiHeal},
    NewS = S#skill{buff_target = NewBuffTarget},
    NewSkill = Skill#c_skill{skill = NewS},
    SkillAddtArg1 =
        SkillAddtArg#c_skill_addt_arg{target_val_changed = Tvc,
                                      target_changed = Tc},
    combat_script_skill_calc:heal(NewSkill,
                                  Self,
                                  Target,
                                  SkillAddtArg1,
                                  ActionEffect);
script_20027(Skill, Self, _, _) -> err_ai(Skill, Self).

script_20028(Skill = #c_skill{skill =
                                  #skill{script_args = [Ratio, Val]}},
             Self = #fighter{hp_max = HpMax}, Target = #fighter{},
             SkillAddtArg) ->
    HealHp = round(Val + HpMax * Ratio / 1000),
    {Svc, Sc} = case HealHp > 0 of
                    true -> {[{hp, 1, HealHp}], [{0, HealHp, 0}]};
                    false -> {[], []}
                end,
    SkillAddtArg1 =
        SkillAddtArg#c_skill_addt_arg{self_val_changed = Svc,
                                      self_changed = Sc},
    ActionEffect = #action_effect{can_anti_heal = 1},
    combat_script_skill_calc:heal(Skill,
                                  Self,
                                  Target,
                                  SkillAddtArg1,
                                  ActionEffect);
script_20028(Skill, Self, _, _) -> err_ai(Skill, Self).

script_20029(Skill = #c_skill{skill =
                                  #skill{script_args = [Ratio]}},
             Self = #fighter{id = Sid},
             Target = #fighter{id = Tid, buffs = Buffs},
             SkillAddtArg) ->
    case util:rand(1, 1000) =< Ratio of
        true ->
            ClearBuff = [Buff
                         || Buff = #c_buff{can_dispel = 1,
                                           sec_type = round_heal}
                                <- Buffs],
            lists:foreach(fun (Buff) ->
                                  combat_buff:buff_del(Tid, Sid, Buff)
                          end,
                          ClearBuff);
        false -> skip
    end,
    ActionEffect = #action_effect{},
    combat_script_skill_calc:attack(Skill,
                                    Self,
                                    Target,
                                    SkillAddtArg,
                                    ActionEffect);
script_20029(Skill, Self, _, _) -> err_ai(Skill, Self).

script_20030(Skill = #c_skill{skill =
                                  #skill{script_args =
                                             [ReviveRatio, HealRatio]}},
             Self = #fighter{id = Sid, hp = SHp, hp_max = SHpMax},
             Target = #fighter{id = Tid, hp_max = THpMax,
                               combat_init_attr =
                                   #combat_init_attr{eff_revive_ratio =
                                                         EffReviceRatio}},
             SkillAddtArg) ->
    {Tvc, Tc, HealHp, CanAntiHeal} = case Sid =:= Tid of
                                         true ->
                                             Heal = round(max(1,
                                                              (SHpMax - SHp) *
                                                                  HealRatio
                                                                  / 1000)),
                                             {[], [], Heal, 1};
                                         false ->
                                             Heal = round(max(1,
                                                              THpMax *
                                                                  (ReviveRatio +
                                                                       EffReviceRatio)
                                                                  / 1000)),
                                             combat_stat:update_revive(Target),
                                             {[{is_die, 0, 0}],
                                              [{2, 0, 0}],
                                              Heal,
                                              0}
                                     end,
    ActionEffect = #action_effect{heal_hp = HealHp,
                                  can_anti_heal = CanAntiHeal},
    SkillAddtArg1 =
        SkillAddtArg#c_skill_addt_arg{target_val_changed = Tvc,
                                      target_changed = Tc},
    combat_script_skill_calc:heal(Skill,
                                  Self,
                                  Target,
                                  SkillAddtArg1,
                                  ActionEffect);
script_20030(Skill, Self, _, _) -> err_ai(Skill, Self).

script_20031(Skill = #c_skill{skill =
                                  #skill{script_args = [BuffId, CritRatio]}},
             Self = #fighter{buffs = Buffs}, Target = #fighter{},
             SkillAddtArg) ->
    ActionEffect = case lists:keyfind(BuffId,
                                      #c_buff.id,
                                      Buffs)
                       of
                       #c_buff{} -> #action_effect{crit_ratio = CritRatio};
                       _ -> #action_effect{}
                   end,
    combat_script_skill_calc:attack(Skill,
                                    Self,
                                    Target,
                                    SkillAddtArg,
                                    ActionEffect);
script_20031(Skill, Self, _, _) -> err_ai(Skill, Self).

script_20032(Skill = #c_skill{skill =
                                  #skill{script_args = [ModelId]}},
             Self = #fighter{}, Target = #fighter{}, SkillAddtArg) ->
    Svc = [{model_id, 0, ModelId}],
    Sc = [{3, ModelId, 0}],
    ActionEffect = #action_effect{},
    SkillAddtArg1 =
        SkillAddtArg#c_skill_addt_arg{self_val_changed = Svc,
                                      self_changed = Sc},
    combat_script_skill_calc:cast(attack,
                                  Skill,
                                  Self,
                                  Target,
                                  SkillAddtArg1,
                                  ActionEffect);
script_20032(Skill, Self, _, _) -> err_ai(Skill, Self).

script_20033(Skill = #c_skill{target_no = TargetNo,
                              skill = #skill{script_args = [Ratio]}},
             Self = #fighter{}, Target = #fighter{}, SkillAddtArg) ->
    Sc = [{7, TargetNo, 0}],
    ActionEffect = case TargetNo of
                       1 -> #action_effect{hit_ratio = 10000};
                       _ ->
                           case
                               combat_cache:get_context_elem([#combat_context.skill_dmg])
                               of
                               [SkillDmg] when SkillDmg > 0 ->
                                   DirectDmg = round(SkillDmg * Ratio / 1000),
                                   #action_effect{can_protect = 0, calc_def = 1,
                                                  direct_dmg = DirectDmg,
                                                  hit_ratio = 10000};
                               _ ->
                                   #action_effect{can_protect = 0,
                                                  direct_dmg = 0,
                                                  hit_ratio = 10000}
                           end
                   end,
    SkillAddtArg1 =
        SkillAddtArg#c_skill_addt_arg{self_changed = Sc},
    combat_script_skill_calc:attack(Skill,
                                    Self,
                                    Target,
                                    SkillAddtArg1,
                                    ActionEffect);
script_20033(Skill, Self, _, _) -> err_ai(Skill, Self).

script_20034(Skill = #c_skill{skill =
                                  S = #skill{script_args = [Ratio],
                                             buff_target = BuffTarget}},
             Self = #fighter{}, Target = #fighter{}, SkillAddtArg) ->
    Ae = #action_effect{suck_buff = {Ratio, BuffTarget}},
    NewSkill = Skill#c_skill{skill =
                                 S#skill{buff_target = []}},
    combat_script_skill_calc:attack(NewSkill,
                                    Self,
                                    Target,
                                    SkillAddtArg,
                                    Ae);
script_20034(Skill, Self, _, _) -> err_ai(Skill, Self).

script_20035(Skill = #c_skill{skill =
                                  #skill{script_args =
                                             [BuffId,
                                              DmgRatio,
                                              ContinueRatio,
                                              ContinueDmgRatio]}},
             Self = #fighter{id = Sid, buffs = Buffs,
                             action = Action},
             Target = #fighter{}, SkillAddtArg) ->
    ActionEffect = case lists:keyfind(BuffId,
                                      #c_buff.id,
                                      Buffs)
                       of
                       #c_buff{} -> #action_effect{act_dmg_ratio = DmgRatio};
                       _ -> #action_effect{}
                   end,
    combat_script_skill_calc:attack(Skill,
                                    Self,
                                    Target,
                                    SkillAddtArg,
                                    ActionEffect),
    case util:rand(1, 1000) =< ContinueRatio of
        true ->
            case
                combat_cache:get_context_elem([#combat_context.pursue_attack_list])
                of
                [PursueAttack]
                    when is_list(PursueAttack) andalso
                             length(PursueAttack) < 1 ->
                    case Action of
                        {Cs = #c_skill{skill = UseSkill}, _} ->
                            NewCSkill = Cs#c_skill{skill =
                                                       UseSkill#skill{dmg_ratio
                                                                          =
                                                                          ContinueDmgRatio}},
                            PassiveAttackSkills = [{0, 1, NewCSkill}],
                            combat_skill:add_skill_cooldown(Sid, Skill, 1),
                            combat_cache:save_context([{#combat_context.passive_skill_attack,
                                                        PassiveAttackSkills}]),
                            #passive_effect{show_passive_skills =
                                                [{Sid, 30010, 2}]};
                        _ -> #passive_effect{}
                    end;
                _ -> #passive_effect{}
            end;
        _ -> #passive_effect{}
    end;
script_20035(Skill, Self, _, _) -> err_ai(Skill, Self).

script_20036(Skill, Self, _, _) -> err_ai(Skill, Self).

script_20037(Skill = #c_skill{skill =
                                  #skill{script_args = [DelBuffRatio]}},
             Self = #fighter{id = Sid},
             Target = #fighter{id = Tid, buffs = Buffs},
             SkillAddtArg) ->
    ClearBuff = [Buff
                 || Buff = #c_buff{can_dispel = 1, sec_type = control}
                        <- Buffs],
    case ClearBuff of
        [_ | _] ->
            case util:rand(1, 1000) =< DelBuffRatio of
                true ->
                    lists:foreach(fun (Buff) ->
                                          combat_buff:buff_del(Tid, Sid, Buff)
                                  end,
                                  ClearBuff),
                    combat_stat:update_dispel_num(Sid, ClearBuff),
                    combat_pet:dispel_pet(ClearBuff, Skill, Self, Target),
                    ActionEffect = #action_effect{},
                    combat_script_skill_calc:cast(attack,
                                                  Skill,
                                                  Self,
                                                  Target,
                                                  SkillAddtArg,
                                                  ActionEffect);
                _ ->
                    ActionEffect = #action_effect{},
                    combat_script_skill_calc:cast(attack,
                                                  Skill,
                                                  Self,
                                                  Target,
                                                  SkillAddtArg,
                                                  ActionEffect)
            end;
        _ ->
            ActionEffect = #action_effect{},
            combat_script_skill_calc:cast(attack,
                                          Skill,
                                          Self,
                                          Target,
                                          SkillAddtArg,
                                          ActionEffect)
    end;
script_20037(Skill, Self, _, _) -> err_ai(Skill, Self).

script_20038(Skill = #c_skill{skill =
                                  #skill{script_args = ArgsList}},
             Self = #fighter{hp_max = SHpMax},
             Target = #fighter{hp_max = THpMax}, SkillAddtArg) ->
    HpRatio = THpMax / SHpMax * 100,
    ActDmgRatio = gen_args_20038(HpRatio, ArgsList),
    ActionEffect = #action_effect{act_dmg_ratio =
                                      ActDmgRatio},
    combat_script_skill_calc:attack(Skill,
                                    Self,
                                    Target,
                                    SkillAddtArg,
                                    ActionEffect);
script_20038(Skill, Self, _, _) -> err_ai(Skill, Self).

gen_args_20038(_HpRatio, []) -> 0;
gen_args_20038(HpRatio, [{Ratio, Val} | _T])
    when HpRatio >= Ratio ->
    Val;
gen_args_20038(HpRatio, [_ | T]) ->
    gen_args_20038(HpRatio, T).

script_20039(Skill = #c_skill{skill =
                                  #skill{script_args = [LossAnger]}},
             Self = #fighter{}, Target = #fighter{},
             SkillAddtArg = #c_skill_addt_arg{target_val_changed =
                                                  Tvc,
                                              target_changed = Tc}) ->
    AddTvc = [{anger, 1, -LossAnger}],
    AddTc = [{9, -LossAnger, 0}],
    Tvc1 = AddTvc ++ Tvc,
    Tc1 = AddTc ++ Tc,
    SkillAddtArg1 =
        SkillAddtArg#c_skill_addt_arg{target_val_changed = Tvc1,
                                      target_changed = Tc1},
    ActionEffect = #action_effect{},
    combat_script_skill_calc:cast(attack,
                                  Skill,
                                  Self,
                                  Target,
                                  SkillAddtArg1,
                                  ActionEffect);
script_20039(Skill, Self, _, _) -> err_ai(Skill, Self).

script_20040(Skill = #c_skill{skill =
                                  #skill{script_args = [Num]}},
             Self = #fighter{},
             Target = #fighter{skill_cooldown = SkillCds},
             SkillAddtArg = #c_skill_addt_arg{target_val_changed =
                                                  Tvc}) ->
    SkillCds1 = lists:reverse(lists:keysort(2,
                                            [{SkillId, CdTimeLeft}
                                             || {SkillId, CdTimeLeft}
                                                    <- SkillCds,
                                                CdTimeLeft > 0,
                                                is_endless_challenge_skill(SkillId)
                                                    =:= false])),
    NeedReduce = case Num > 0 of
                     true -> lists:sublist(SkillCds1, Num);
                     false -> SkillCds1
                 end,
    Fun = fun ({SkillId, CdTimeLeft}, SkillCds2) ->
                  case lists:keymember(SkillId, 1, NeedReduce) of
                      true -> [{SkillId, 0} | SkillCds2];
                      false -> [{SkillId, CdTimeLeft} | SkillCds2]
                  end
          end,
    NewSkillCds2 = lists:foldl(Fun, [], SkillCds),
    AddTvc = [{skill_cooldown, 0, NewSkillCds2}],
    Tvc1 = AddTvc ++ Tvc,
    SkillAddtArg1 =
        SkillAddtArg#c_skill_addt_arg{target_val_changed =
                                          Tvc1},
    ActionEffect = #action_effect{},
    combat_script_skill_calc:cast(attack,
                                  Skill,
                                  Self,
                                  Target,
                                  SkillAddtArg1,
                                  ActionEffect);
script_20040(Skill, Self, _, _) -> err_ai(Skill, Self).

script_20041(Skill = #c_skill{skill =
                                  #skill{script_args = [DieRound, HpRatio]}},
             Self = #fighter{name = _Sname, group = Sgroup,
                             base_id = _BaseId, id = _Sid},
             Target = #fighter{type = TargetType, is_die = IsDie,
                               is_escape = IsEscape},
             SkillAddtArg) ->
    logger:debug("傀儡秘术:~w",
                 [{DieRound, HpRatio}],
                 combat_script_skill,
                 1975),
    case (TargetType =:= 3 orelse TargetType =:= 6) andalso
             IsDie =:= 0 andalso IsEscape =:= 0
        of
        true ->
            NewTarget = gen_args_20041(Target, Sgroup, HpRatio),
            case combat_fighter:add_fighters(pet_clone,
                                             Sgroup,
                                             [NewTarget])
                of
                Summons = [#fighter{id = Fid}] ->
                    [KillList] =
                        combat_cache:get_context_elem([#combat_context.kill_by_self_list]),
                    NewKillList = [{Sgroup, Fid, DieRound} | KillList],
                    combat_cache:save_context([{#combat_context.kill_by_self_list,
                                                NewKillList}]),
                    combat_script_skill_calc:cast(attack,
                                                  Skill,
                                                  Self,
                                                  Target,
                                                  SkillAddtArg,
                                                  #action_effect{}),
                    combat_play:add_sub_play(combat_play:gen_sub_summon_play(0,
                                                                             Self,
                                                                             Summons));
                _ -> skip
            end;
        _ -> skip
    end;
script_20041(Skill, Self, _, _) -> err_ai(Skill, Self).

gen_args_20041(Target = #fighter{hp_max = HpMax,
                                 mp_max = MpMax, attr = Attr},
               Group, HpRatio) ->
    SelfPresideStatus = 0,
    SelfPresideText = "",
    TargetPresideStatus = 0,
    TargetPresideText = "",
    CombatStatistics = #combat_statistics{},
    MasterPid = 0,
    MasterFid = 0,
    MasterPos = 0,
    NewHpMax = round(HpMax * HpRatio / 1000),
    Target#fighter{hp = NewHpMax, hp_max = NewHpMax,
                   mp = MpMax, attr = Attr#attr{hp_max = NewHpMax},
                   group = Group, self_preside_status = SelfPresideStatus,
                   self_preside_text = SelfPresideText,
                   target_preside_status = TargetPresideStatus,
                   target_preside_text = TargetPresideText,
                   combat_statistics = CombatStatistics,
                   master_pid = MasterPid, master_fid = MasterFid,
                   master_pos = MasterPos, pos = 11, buffs = [],
                   skill_cooldown = [], skill_plan = []}.

script_20042(Skill = #c_skill{skill =
                                  #skill{script_args = [Ratio, Val]}},
             Self,
             Target = #fighter{hp_max = HpMax, is_die = IsDie,
                               combat_init_attr =
                                   #combat_init_attr{eff_revive_ratio =
                                                         EffReviceRatio}},
             SkillAddtArg) ->
    case IsDie of
        1 ->
            HealHp = round(max(1,
                               Val + HpMax * (Ratio + EffReviceRatio) / 1000)),
            ActionEffect = #action_effect{heal_hp = HealHp},
            Tvc = [{is_die, 0, 0}],
            Tc = [{2, 0, 0}],
            SkillAddtArg1 =
                SkillAddtArg#c_skill_addt_arg{target_val_changed = Tvc,
                                              target_changed = Tc},
            combat_stat:update_revive(Target),
            combat_script_skill_calc:heal(Skill,
                                          Self,
                                          Target,
                                          SkillAddtArg1,
                                          ActionEffect);
        _ ->
            ActionEffect = #action_effect{},
            combat_script_skill_calc:cast(attack,
                                          Skill,
                                          Self,
                                          Target,
                                          SkillAddtArg,
                                          ActionEffect)
    end;
script_20042(Skill, Self, _, _) -> err_ai(Skill, Self).

script_20043(Skill = #c_skill{skill =
                                  #skill{script_args =
                                             [DieRound,
                                              HpRatio,
                                              SkillIds,
                                              AiId,
                                              AtkRatio]}},
             Self = #fighter{name = _Sname, group = Sgroup,
                             base_id = _BaseId, id = _Sid},
             #fighter{}, SkillAddtArg) ->
    NewTarget = gen_args_20043(Self,
                               Sgroup,
                               HpRatio,
                               AtkRatio,
                               SkillIds,
                               AiId),
    case combat_fighter:add_fighters(guard_clone,
                                     Sgroup,
                                     [NewTarget])
        of
        Summons = [#fighter{id = Fid}] ->
            [AvatarList] =
                combat_cache:get_context_elem([#combat_context.avatar_list]),
            NewK = {Fid, DieRound},
            NewAvatarList = lists:keystore(Fid,
                                           1,
                                           AvatarList,
                                           NewK),
            combat_cache:save_context([{#combat_context.avatar_list,
                                        NewAvatarList}]),
            combat_script_skill_calc:cast(attack,
                                          Skill,
                                          Self,
                                          Self,
                                          SkillAddtArg,
                                          #action_effect{}),
            combat_play:add_sub_play(combat_play:gen_sub_summon_play(0,
                                                                     Self,
                                                                     Summons));
        _ -> skip
    end;
script_20043(Skill, Self, _, _) -> err_ai(Skill, Self).

gen_args_20043(Target = #fighter{hp_max = HpMax,
                                 mp_max = MpMax, active_skills = ActiveSkills,
                                 attr =
                                     Attr = #attr{phy_dmg = PhyDmg,
                                                  magic_dmg = MagicDmg},
                                 looks = Looks},
               Group, HpRatio, AtkRatio, SkillIds, AiId) ->
    SelfPresideStatus = 0,
    SelfPresideText = "",
    TargetPresideStatus = 0,
    TargetPresideText = "",
    CombatStatistics = #combat_statistics{},
    NewHpMax = round(HpMax * HpRatio / 1000),
    NewPhyDmg = round(PhyDmg * AtkRatio / 1000),
    NewMagicDmg = round(MagicDmg * AtkRatio / 1000),
    NewLooks = [{LookType, LookMode, LookVal, LookStr}
                || {LookType, LookMode, LookVal, LookStr} <- Looks,
                   LookType =/= 72],
    ActiveSkills1 = [Skill
                     || Skill = #c_skill{id = SkillId} <- ActiveSkills,
                        lists:member(SkillId, SkillIds) =:= true],
    Target#fighter{hp = NewHpMax, hp_max = NewHpMax,
                   mp = MpMax,
                   attr =
                       Attr#attr{hp_max = NewHpMax, phy_dmg = NewPhyDmg,
                                 magic_dmg = NewMagicDmg},
                   pos = 0, group = Group,
                   self_preside_status = SelfPresideStatus,
                   self_preside_text = SelfPresideText,
                   target_preside_status = TargetPresideStatus,
                   target_preside_text = TargetPresideText,
                   combat_statistics = CombatStatistics,
                   active_skills = ActiveSkills1, ai_id = AiId, buffs = [],
                   skill_cooldown = [], looks = NewLooks}.

script_20044(Skill, Self, _, _) -> err_ai(Skill, Self).

script_20045(Skill = #c_skill{skill =
                                  #skill{script_args =
                                             [DecMagicDefRatio,
                                              SuckRatio,
                                              CritRatio]}},
             Self = #fighter{id = Sid, buffs = Buffs},
             Target = #fighter{}, SkillAddtArg) ->
    case lists:keyfind(energy, #c_buff.sec_type, Buffs) of
        EnergyBuff = #c_buff{} ->
            combat_buff:buff_del(Sid, Sid, EnergyBuff);
        _ -> ignore
    end,
    ActionEffect = #action_effect{dec_magic_def_ratio =
                                      DecMagicDefRatio,
                                  suck_hp = SuckRatio, crit_ratio = CritRatio},
    combat_script_skill_calc:attack(Skill,
                                    Self,
                                    Target,
                                    SkillAddtArg,
                                    ActionEffect);
script_20045(Skill, Self, _, _) -> err_ai(Skill, Self).

script_20046(Skill = #c_skill{skill =
                                  S = #skill{attack_type = AttackType}},
             Self = #fighter{type = Type, classes = Classes}, Target,
             SkillAddtArg) ->
    NewAttackType = combat_util:classes_to_attack_type(Type,
                                                       Classes,
                                                       AttackType),
    combat_script_skill_calc:attack(Skill#c_skill{skill =
                                                      S#skill{attack_type =
                                                                  NewAttackType}},
                                    Self,
                                    Target,
                                    SkillAddtArg,
                                    #action_effect{});
script_20046(Skill = #c_skill{}, Self, Target,
             SkillAddtArg) ->
    combat_script_skill_calc:attack(Skill,
                                    Self,
                                    Target,
                                    SkillAddtArg,
                                    #action_effect{}).

script_20047(Skill = #c_skill{action_no = ActionNo,
                              target_no = TargetNo,
                              skill =
                                  S = #skill{attack_type = AttackType,
                                             script_args =
                                                 [BuffId,
                                                  HitRate,
                                                  Duration,
                                                  Dispel,
                                                  BuffArgs]}},
             Self = #fighter{type = Type, classes = Classes}, Target,
             SkillAddtArg) ->
    NewAttackType = combat_util:classes_to_attack_type(Type,
                                                       Classes,
                                                       AttackType),
    NewSkill = Skill#c_skill{skill =
                                 S#skill{attack_type = NewAttackType}},
    case ActionNo =< 1 andalso TargetNo =< 1 of
        true ->
            AddBuff = combat_script_buff:convert_buff([{BuffId,
                                                        HitRate,
                                                        Duration,
                                                        Dispel,
                                                        BuffArgs}]),
            lists:foreach(fun (Buff) ->
                                  combat_buff:buff_add(Buff, Self, Self, true)
                          end,
                          AddBuff);
        false -> skip
    end,
    combat_script_skill_calc:attack(NewSkill,
                                    Self,
                                    Target,
                                    SkillAddtArg,
                                    #action_effect{});
script_20047(Skill = #c_skill{action_no = ActionNo,
                              target_no = TargetNo,
                              skill =
                                  #skill{script_args =
                                             [BuffId,
                                              HitRate,
                                              Duration,
                                              Dispel,
                                              BuffArgs]}},
             Self, Target, SkillAddtArg) ->
    case ActionNo =< 1 andalso TargetNo =< 1 of
        true ->
            AddBuff = combat_script_buff:convert_buff([{BuffId,
                                                        HitRate,
                                                        Duration,
                                                        Dispel,
                                                        BuffArgs}]),
            lists:foreach(fun (Buff) ->
                                  combat_buff:buff_add(Buff, Self, Self, true)
                          end,
                          AddBuff);
        false -> skip
    end,
    combat_script_skill_calc:attack(Skill,
                                    Self,
                                    Target,
                                    SkillAddtArg,
                                    #action_effect{});
script_20047(Skill, Self, _, _) -> err_ai(Skill, Self).

script_20048(Skill = #c_skill{skill =
                                  #skill{script_args =
                                             [CloneType,
                                              HpRatio,
                                              AspdRatio,
                                              DmgRatio,
                                              AiList]}},
             Self = #fighter{name = _Sname, group = Sgroup,
                             base_id = _BaseId},
             Target = #fighter{}, SkillAddtArg) ->
    case gen_args_20048(CloneType,
                        Target,
                        Sgroup,
                        HpRatio,
                        AspdRatio,
                        DmgRatio,
                        AiList)
        of
        TargetList = [_ | _] ->
            case combat_fighter:add_fighters(by_matching,
                                             Sgroup,
                                             TargetList)
                of
                Summons = [_ | _] ->
                    combat_script_skill_calc:cast(attack,
                                                  Skill,
                                                  Self,
                                                  Target,
                                                  SkillAddtArg,
                                                  #action_effect{}),
                    combat_play:add_sub_play(combat_play:gen_sub_summon_play(0,
                                                                             Self,
                                                                             Summons));
                _ -> skip
            end;
        _ -> skip
    end;
script_20048(Skill, Self, _, _) -> err_ai(Skill, Self).

script_20049(Skill = #c_skill{skill =
                                  #skill{script_args = [Ratio, Val]}},
             Self = #fighter{}, Target = #fighter{mp_max = MpMax},
             SkillAddtArg) ->
    AddMp = round(Val + MpMax * Ratio / 1000),
    {Svc, Sc} = case AddMp > 0 of
                    true -> {[{mp, 1, AddMp}], [{1, AddMp, 0}]};
                    false -> {[], []}
                end,
    SkillAddtArg1 =
        SkillAddtArg#c_skill_addt_arg{target_val_changed = Svc,
                                      target_changed = Sc},
    combat_script_skill_calc:cast(attack,
                                  Skill,
                                  Self,
                                  Target,
                                  SkillAddtArg1,
                                  #action_effect{});
script_20049(Skill, Self, _, _) -> err_ai(Skill, Self).

script_20050(Skill = #c_skill{skill =
                                  #skill{script_args = [HpRatio]}},
             Self = #fighter{id = Sid},
             Target = #fighter{id = Tid, buffs = Buffs,
                               hp_max = HpMax},
             SkillAddtArg) ->
    ClearBuff = [Buff
                 || Buff = #c_buff{can_dispel = 1, eff_type = debuff}
                        <- Buffs],
    AddHp = round(HpMax * HpRatio / 1000),
    {Svc, Sc} = case AddHp > 0 of
                    true -> {[{hp, 1, AddHp}], [{0, AddHp, 0}]};
                    false -> {[], []}
                end,
    SkillAddtArg1 =
        SkillAddtArg#c_skill_addt_arg{target_val_changed = Svc,
                                      target_changed = Sc},
    case ClearBuff of
        [_ | _] ->
            lists:foreach(fun (Buff) ->
                                  combat_buff:buff_del(Tid, Sid, Buff)
                          end,
                          ClearBuff),
            combat_stat:update_dispel_num(Sid, ClearBuff),
            combat_pet:dispel_pet(ClearBuff, Skill, Self, Target),
            combat_script_skill_calc:heal(Skill,
                                          Self,
                                          Target,
                                          SkillAddtArg1,
                                          #action_effect{heal_hp = AddHp,
                                                         can_anti_heal = 1});
        _ ->
            combat_script_skill_calc:heal(Skill,
                                          Self,
                                          Target,
                                          SkillAddtArg1,
                                          #action_effect{heal_hp = AddHp,
                                                         can_anti_heal = 1})
    end;
script_20050(Skill, Self, _, _) -> err_ai(Skill, Self).

script_20051(Skill = #c_skill{skill =
                                  #skill{script_args =
                                             [BuffId,
                                              HitRate,
                                              Duration,
                                              Dispel,
                                              DmgRatio]}},
             Self = #fighter{attr =
                                 #attr{phy_dmg = PhyDmg, magic_dmg = MagicDmg}},
             Target, SkillAddtArg) ->
    AddVal = round(max(PhyDmg, MagicDmg) * DmgRatio / 1000),
    BuffArgs = [AddVal],
    AddBuff = combat_script_buff:convert_buff([{BuffId,
                                                HitRate,
                                                Duration,
                                                Dispel,
                                                BuffArgs}]),
    lists:foreach(fun (Buff) ->
                          combat_buff:buff_add(Buff, Self, Target, true)
                  end,
                  AddBuff),
    combat_script_skill_calc:cast(attack,
                                  Skill,
                                  Self,
                                  Target,
                                  SkillAddtArg,
                                  #action_effect{});
script_20051(Skill, Self, _, _) -> err_ai(Skill, Self).

script_20052(Skill = #c_skill{skill =
                                  #skill{script_args = Skills}},
             Self = #fighter{},
             Target = #fighter{skill_cooldown = Cds},
             SkillAddtArg) ->
    Fun = fun ({SkillId, CD}) ->
                  case lists:member(SkillId, Skills) of
                      true -> {SkillId, 0};
                      _ -> {SkillId, CD}
                  end;
              (CD) -> CD
          end,
    NewCds = [Fun(Cd) || Cd <- Cds],
    Svc = [{skill_cooldown, 0, NewCds}],
    NewSkillAddtArg =
        SkillAddtArg#c_skill_addt_arg{target_val_changed = Svc},
    combat_script_skill_calc:cast(attack,
                                  Skill,
                                  Self,
                                  Target,
                                  NewSkillAddtArg,
                                  #action_effect{});
script_20052(Skill, Self, _, _) -> err_ai(Skill, Self).

script_20053(Skill = #c_skill{skill =
                                  #skill{script_args =
                                             [BuffId,
                                              HitRate,
                                              Duration,
                                              Dispel,
                                              DmgRatio]}},
             Self = #fighter{}, Target = #fighter{}, SkillAddtArg) ->
    AddBuff = combat_script_buff:convert_buff([{BuffId,
                                                HitRate,
                                                Duration,
                                                Dispel,
                                                []}]),
    DmgBuff = {DmgRatio, AddBuff},
    combat_script_skill_calc:attack(Skill,
                                    Self,
                                    Target,
                                    SkillAddtArg,
                                    #action_effect{dmg_buff = DmgBuff});
script_20053(Skill, Self, _, _) -> err_ai(Skill, Self).

script_20054(Skill = #c_skill{skill =
                                  #skill{script_args = [DmgRatio, MaxVal]}},
             Self = #fighter{lev = _Slev},
             Target = #fighter{hp_max = ThpMax}, SkillAddtArg) ->
    AddtDmg = min(MaxVal, round(DmgRatio * ThpMax / 1000)),
    combat_script_skill_calc:attack(Skill,
                                    Self,
                                    Target,
                                    SkillAddtArg,
                                    #action_effect{extern_dmg = AddtDmg,
                                                   can_crit = 0});
script_20054(Skill, Self, _, _) -> err_ai(Skill, Self).

script_20055(Skill = #c_skill{skill =
                                  #skill{script_args =
                                             [_KillMoreNum,
                                              DmgRatioList,
                                              BaseId,
                                              RatioList]}},
             Self = #fighter{id = Sid, group = Group}, Target,
             SkillAddtArg = #c_skill_addt_arg{skip_exec = SkipExec})
    when is_list(DmgRatioList) ->
    case SkipExec of
        1 -> skip;
        _ ->
            AllLiving = combat_cache:all_living(Group),
            Len = length([1
                          || #fighter{id = Fid, type = 3, base_id = Bid}
                                 <- AllLiving,
                             Fid =/= Sid andalso Bid =:= BaseId]),
            ActionEffect = case Len > 0 of
                               true ->
                                   case lists:keyfind(Len, 1, RatioList) of
                                       {_, Ratio} ->
                                           #action_effect{act_hurt_multi =
                                                              -Ratio};
                                       _ -> #action_effect{}
                                   end;
                               _ -> #action_effect{}
                           end,
            combat_script_skill_calc:attack(Skill,
                                            Self,
                                            Target,
                                            SkillAddtArg,
                                            ActionEffect)
    end,
    script_20055_end(Skill, Self, Target);
script_20055(Skill, Self, _, _) -> err_ai(Skill, Self).

script_20055_end(#c_skill{id = SkillId,
                          skill =
                              #skill{script_args =
                                         [KillMoreNum, DmgRatioList, _, _]}},
                 #fighter{id = Sid, passive_skills = PassiveSkills},
                 #fighter{id = Tid}) ->
    AddKillMoreNum = gen_args_20055(Tid, PassiveSkills),
    KillMoreNum1 = AddKillMoreNum + KillMoreNum,
    CheckNumFlag = case combat_cache:f(by_id, Sid) of
                       #fighter{is_die = 0} ->
                           case
                               combat_cache:get_context_elem([#combat_context.pursue_attack_list])
                               of
                               [PursueAttack] when is_list(PursueAttack) ->
                                   Len = length(PursueAttack),
                                   case Len < KillMoreNum1 of
                                       true -> {true, Len};
                                       false -> false
                                   end;
                               _ -> false
                           end;
                       _ -> false
                   end,
    case CheckNumFlag of
        {true, HasAttack} ->
            DmgRatio = case length(DmgRatioList) > HasAttack of
                           true -> lists:nth(HasAttack + 1, DmgRatioList);
                           false ->
                               logger:error("无法找到[~w]追击参数[~w][~w][~w]",
                                            [SkillId,
                                             HasAttack,
                                             KillMoreNum,
                                             DmgRatioList],
                                            combat_script_skill,
                                            2245),
                               1000
                       end,
            combat_cache:save_context([{#combat_context.pursue_attack,
                                        {true, DmgRatio}}]);
        false -> skip
    end.

gen_args_20055(Tid, PassiveSkills) ->
    [AddKillMoreNum] =
        combat_cache:get_context_elem([#combat_context.multi_pursue_num]),
    CritAdd = case combat_cache:f(by_script_id,
                                  PassiveSkills,
                                  60009)
                  of
                  #c_skill{skill =
                               #skill{script_args =
                                          [Ratio1, KillMoreNum1, _]}} ->
                      case AddKillMoreNum < KillMoreNum1 of
                          true ->
                              case
                                  combat_cache:get_context_elem([#combat_context.skill_pursue_crit])
                                  of
                                  [true] ->
                                      case util:rand(1, 1000) =< Ratio1 of
                                          true -> 1;
                                          _ -> 0
                                      end;
                                  _ -> 0
                              end;
                          _ -> 0
                      end;
                  _ -> 0
              end,
    AddKillMoreNum1 = AddKillMoreNum + CritAdd,
    KillAdd = case combat_cache:f(by_script_id,
                                  PassiveSkills,
                                  60010)
                  of
                  #c_skill{skill =
                               #skill{script_args =
                                          [Ratio2, KillMoreNum2, _]}} ->
                      case AddKillMoreNum1 < KillMoreNum2 of
                          true ->
                              case combat_cache:f(by_id, Tid) of
                                  #fighter{is_die = 1} ->
                                      case util:rand(1, 1000) =< Ratio2 of
                                          true -> 1;
                                          _ -> 0
                                      end;
                                  _ -> 0
                              end;
                          _ -> 0
                      end;
                  _ -> 0
              end,
    AddKillMoreNum2 = AddKillMoreNum1 + KillAdd,
    combat_cache:save_context([{#combat_context.multi_pursue_num,
                                AddKillMoreNum2}]),
    AddKillMoreNum2.

script_20056(Skill = #c_skill{skill =
                                  S = #skill{script_args = BuffRatioList,
                                             buff_target = BuffTarget}},
             Self, Target, SkillAddtArg) ->
    {BuffId, _} = util:rand_list(BuffRatioList, 2),
    NewBuffTarget = [Buff
                     || Buff = #c_buff{id = Bid} <- BuffTarget,
                        Bid =:= BuffId],
    NewSkill = Skill#c_skill{skill =
                                 S#skill{buff_target = NewBuffTarget}},
    ActionEffect = #action_effect{},
    combat_script_skill_calc:cast(attack,
                                  NewSkill,
                                  Self,
                                  Target,
                                  SkillAddtArg,
                                  ActionEffect);
script_20056(Skill, Self, _, _) -> err_ai(Skill, Self).

script_20057(Skill = #c_skill{skill =
                                  #skill{script_args = [Ratio, MaxHpRatio]}},
             Self = #fighter{hp_max = HpMax,
                             special_attr =
                                 #special_attr{round_hurt = RoundHurt}},
             Target, SkillAddtArg) ->
    MaxVal = round(HpMax * MaxHpRatio / 1000),
    Val = round(RoundHurt * Ratio / 1000),
    Val1 = min(Val, MaxVal),
    ActionEffect = #action_effect{holy_addt = Val1},
    combat_script_skill_calc:attack(Skill,
                                    Self,
                                    Target,
                                    SkillAddtArg,
                                    ActionEffect);
script_20057(Skill, Self, _, _) -> err_ai(Skill, Self).

script_20058(Skill = #c_skill{skill =
                                  #skill{script_args = [DmgRatio, MaxRatio]}},
             Self = #fighter{lev = Slev},
             Target = #fighter{hp = Thp}, SkillAddtArg) ->
    MaxVal = round(MaxRatio * Slev / 1000),
    AddtDmg = min(MaxVal, round(DmgRatio * Thp / 1000)),
    combat_script_skill_calc:attack(Skill,
                                    Self,
                                    Target,
                                    SkillAddtArg,
                                    #action_effect{extern_dmg = AddtDmg});
script_20058(Skill, Self, _, _) -> err_ai(Skill, Self).

script_20059(Skill = #c_skill{target_no = TargetNo,
                              skill = #skill{script_args = [Ratio]}},
             Self = #fighter{}, Target = #fighter{}, SkillAddtArg) ->
    {Sc, ActionEffect} = case TargetNo of
                             1 ->
                                 ScPlay = [{7, TargetNo, 0}],
                                 DoActionEffect = #action_effect{hit_ratio =
                                                                     10000},
                                 {ScPlay, DoActionEffect};
                             _ ->
                                 ScPlay = [{7, 2, 0}],
                                 DoActionEffect = case
                                                      combat_cache:get_context_elem([#combat_context.skill_dmg])
                                                      of
                                                      [SkillDmg]
                                                          when SkillDmg > 0 ->
                                                          DirectDmg =
                                                              round(SkillDmg *
                                                                        Ratio
                                                                        / 1000),
                                                          #action_effect{can_protect
                                                                             =
                                                                             0,
                                                                         calc_def
                                                                             =
                                                                             0,
                                                                         direct_dmg
                                                                             =
                                                                             DirectDmg,
                                                                         hit_ratio
                                                                             =
                                                                             10000};
                                                      _ ->
                                                          #action_effect{can_protect
                                                                             =
                                                                             0,
                                                                         direct_dmg
                                                                             =
                                                                             0,
                                                                         hit_ratio
                                                                             =
                                                                             10000}
                                                  end,
                                 {ScPlay, DoActionEffect}
                         end,
    SkillAddtArg1 =
        SkillAddtArg#c_skill_addt_arg{self_changed = Sc},
    combat_script_skill_calc:attack(Skill,
                                    Self,
                                    Target,
                                    SkillAddtArg1,
                                    ActionEffect),
    script_20059_end(Skill, Self, Target);
script_20059(Skill, Self, _, _) -> err_ai(Skill, Self).

gen_args_20059(Tid, PassiveSkills) ->
    [AddKillMoreNum] =
        combat_cache:get_context_elem([#combat_context.multi_pursue_num]),
    {CritAdd, ReduceDmg1} = case
                                combat_cache:f(by_script_id,
                                               PassiveSkills,
                                               60009)
                                of
                                #c_skill{skill =
                                             #skill{script_args =
                                                        [Ratio1,
                                                         KillMoreNum1,
                                                         CritReduceDmg]}} ->
                                    case AddKillMoreNum < KillMoreNum1 of
                                        true ->
                                            case
                                                combat_cache:get_context_elem([#combat_context.skill_pursue_crit])
                                                of
                                                [true] ->
                                                    case util:rand(1, 1000) =<
                                                             Ratio1
                                                        of
                                                        true ->
                                                            {min(1,
                                                                 KillMoreNum1),
                                                             CritReduceDmg};
                                                        _ -> {0, 0}
                                                    end;
                                                _ -> {0, 0}
                                            end;
                                        _ -> {0, 0}
                                    end;
                                _ -> {0, 0}
                            end,
    {KillAdd, ReduceDmg2} = case
                                combat_cache:f(by_script_id,
                                               PassiveSkills,
                                               60010)
                                of
                                #c_skill{skill =
                                             #skill{script_args =
                                                        [Ratio2,
                                                         KillMoreNum2,
                                                         KillReduceDmg]}} ->
                                    case AddKillMoreNum < KillMoreNum2 of
                                        true ->
                                            case combat_cache:f(by_id, Tid) of
                                                #fighter{is_die = 1} ->
                                                    case util:rand(1, 1000) =<
                                                             Ratio2
                                                        of
                                                        true ->
                                                            {min(1,
                                                                 KillMoreNum2),
                                                             KillReduceDmg};
                                                        _ -> {0, 0}
                                                    end;
                                                _ -> {0, 0}
                                            end;
                                        _ -> {0, 0}
                                    end;
                                _Else -> {0, 0}
                            end,
    case CritAdd > KillAdd of
        true -> {CritAdd, ReduceDmg1};
        _ -> {KillAdd, ReduceDmg2}
    end.

script_20059_end(Skill = #c_skill{id = SkillId,
                                  skill = #skill{}},
                 Self = #fighter{id = Sid, action = Action,
                                 passive_skills = PassiveSkills},
                 #fighter{id = Tid}) ->
    {AddKillMoreNum, ReduceDmg} = gen_args_20059(Tid,
                                                 PassiveSkills),
    logger:debug("追击参数:~w",
                 [{AddKillMoreNum, ReduceDmg}],
                 combat_script_skill,
                 2391),
    {DoneCskill, _} = Action,
    case
        combat_cache:get_context_elem([#combat_context.pursue_attack_list])
        of
        [PursueAttack] when is_list(PursueAttack) ->
            logger:debug("=======:~w",
                         [PursueAttack],
                         combat_script_skill,
                         2396),
            Len = length(PursueAttack),
            case Len < AddKillMoreNum of
                true when is_list(ReduceDmg) ->
                    ReduceSKillDgm = lists:nth(Len + 1, ReduceDmg),
                    NewCs = combat_skill:passive_to_variety_skill(Self,
                                                                  DoneCskill,
                                                                  ReduceSKillDgm),
                    combat_skill:add_skill_cooldown(Sid, Skill, 1),
                    PassiveAttackSkills = [{0, 1, NewCs}],
                    combat_cache:save_context([{#combat_context.passive_skill_attack,
                                                PassiveAttackSkills}]),
                    #passive_effect{show_passive_skills =
                                        [{Sid, SkillId, 2}]};
                _ -> #passive_effect{}
            end;
        _Err -> #passive_effect{}
    end.

script_20060(Skill = #c_skill{target_no = TargetNo,
                              skill =
                                  #skill{script_args =
                                             [InjuryRatio,
                                              LinkHurtRatio,
                                              TargetNnum,
                                              MgRatioList]}},
             Self = #fighter{id = Sid, buffs = Buffs,
                             pet_attr = PetAttr, lev = Slev},
             Target = #fighter{id = Tid, hp_max = HpMax},
             SkillAddtArg) ->
    ExternDmg = case PetAttr of
                    {Pstr, Pcon, Pmag, Pagi, Pend} ->
                        AllPoint = Pstr + Pcon + Pmag + Pagi + Pend,
                        PmagRatio = max(Pmag / AllPoint * 100, 0),
                        logger:debug("宠物智力比率:~w",
                                     [PmagRatio],
                                     combat_script_skill,
                                     2420),
                        Fun = fun ({PointRatio, DmgRatio, MaxDmgRatioVal},
                                   Rtn) ->
                                      case PmagRatio < PointRatio of
                                          true -> {DmgRatio, MaxDmgRatioVal};
                                          _ -> Rtn
                                      end
                              end,
                        {HolyDmgRatio, MaxHolyDmg} = lists:foldl(Fun,
                                                                 {0, 0},
                                                                 MgRatioList),
                        logger:debug("目标最大血量:~w",
                                     [HpMax],
                                     combat_script_skill,
                                     2428),
                        MaxVal = round(MaxHolyDmg * Slev / 1000),
                        min(MaxVal, round(HolyDmgRatio * HpMax / 1000));
                    _ -> 0
                end,
    logger:debug("附加伤害:~w",
                 [ExternDmg],
                 combat_script_skill,
                 2434),
    [combat_buff:buff_del(Sid, Sid, ThunderBuff)
     || ThunderBuff = #c_buff{id = 70043} <- Buffs],
    ActionEffect = case TargetNo =< TargetNnum of
                       true ->
                           case
                               combat_cache:get_context_elem([#combat_context.link_hurt])
                               of
                               [LinkHurtInfo] ->
                                   combat_cache:save_context([{#combat_context.link_hurt,
                                                               [{Tid,
                                                                 TargetNo,
                                                                 0}
                                                                | LinkHurtInfo]}]);
                               _ ->
                                   combat_cache:save_context([{#combat_context.link_hurt,
                                                               [{Tid,
                                                                 TargetNo,
                                                                 0}]}])
                           end,
                           #action_effect{injury_ratio = InjuryRatio};
                       _ ->
                           case
                               combat_cache:get_context_elem([#combat_context.link_hurt])
                               of
                               [LinkHurtInfo = [_ | _]] ->
                                   TargetIndex = TargetNo rem TargetNnum,
                                   case lists:keyfind(TargetIndex,
                                                      2,
                                                      LinkHurtInfo)
                                       of
                                       {SourceId, _, SkillDmg} ->
                                           DirectDmg = round(SkillDmg *
                                                                 LinkHurtRatio
                                                                 / 1000),
                                           TargetSc = [{12, SourceId, 0}],
                                           #action_effect{can_protect = 0,
                                                          calc_def = 0,
                                                          direct_dmg =
                                                              DirectDmg,
                                                          hit_ratio = 10000,
                                                          target_changes =
                                                              TargetSc,
                                                          injury_ratio =
                                                              InjuryRatio};
                                       _ ->
                                           #action_effect{injury_ratio =
                                                              InjuryRatio}
                                   end;
                               _ -> #action_effect{injury_ratio = InjuryRatio}
                           end
                   end,
    DoTargetNo = (TargetNo - 1) div TargetNnum + 1,
    Sc = [{7, DoTargetNo, 0}],
    SkillAddtArg1 =
        SkillAddtArg#c_skill_addt_arg{self_changed = Sc},
    combat_script_skill_calc:attack(Skill,
                                    Self,
                                    Target,
                                    SkillAddtArg1,
                                    ActionEffect#action_effect{extern_dmg =
                                                                   ExternDmg});
script_20060(Skill, Self, _, _) -> err_ai(Skill, Self).

script_20061(Skill = #c_skill{target_no = TargetNo,
                              skill =
                                  #skill{script_args =
                                             [Ratio,
                                              Ratio2,
                                              Ratio3,
                                              Dmg,
                                              Dmg2,
                                              Dmg3]}},
             Self = #fighter{id = Sid,
                             passive_skills = PassiveSkills},
             Target = #fighter{id = Tid, buffs = Buffs},
             SkillAddtArg) ->
    Sc = [{7, TargetNo, 0}],
    case TargetNo of
        1 ->
            NRatio = case combat_cache:f(by_script_id,
                                         PassiveSkills,
                                         60050)
                         of
                         #c_skill{} -> 1000;
                         _ -> Ratio
                     end,
            case util:rand(1, 1000) =< NRatio of
                true ->
                    ClearBuff = lists:sublist([Buff
                                               || Buff = #c_buff{can_dispel = 1,
                                                                 eff_type =
                                                                     buff,
                                                                 id = BuffId}
                                                      <- Buffs,
                                                  BuffId =/= 30006 andalso
                                                      BuffId =/= 40009],
                                              1),
                    lists:foreach(fun (Buff) ->
                                          combat_buff:buff_del(Tid, Sid, Buff)
                                  end,
                                  ClearBuff);
                _ -> skip
            end;
        2 ->
            case util:rand(1, 1000) =< Ratio2 of
                true ->
                    ClearBuff = lists:sublist([Buff
                                               || Buff = #c_buff{can_dispel = 1,
                                                                 eff_type =
                                                                     buff,
                                                                 id = BuffId}
                                                      <- Buffs,
                                                  BuffId =/= 30006 andalso
                                                      BuffId =/= 40009],
                                              1),
                    lists:foreach(fun (Buff) ->
                                          combat_buff:buff_del(Tid, Sid, Buff)
                                  end,
                                  ClearBuff);
                _ -> skip
            end;
        _ ->
            case util:rand(1, 1000) =< Ratio3 of
                true ->
                    ClearBuff = lists:sublist([Buff
                                               || Buff = #c_buff{can_dispel = 1,
                                                                 eff_type =
                                                                     buff,
                                                                 id = BuffId}
                                                      <- Buffs,
                                                  BuffId =/= 30006 andalso
                                                      BuffId =/= 40009],
                                              1),
                    lists:foreach(fun (Buff) ->
                                          combat_buff:buff_del(Tid, Sid, Buff)
                                  end,
                                  ClearBuff);
                _ -> skip
            end
    end,
    ActionEffect = case TargetNo of
                       1 -> #action_effect{act_dmg_ratio = Dmg};
                       2 -> #action_effect{act_dmg_ratio = Dmg2};
                       _ -> #action_effect{act_dmg_ratio = Dmg3}
                   end,
    SkillAddtArg1 =
        SkillAddtArg#c_skill_addt_arg{self_changed = Sc},
    combat_script_skill_calc:attack(Skill,
                                    Self,
                                    Target,
                                    SkillAddtArg1,
                                    ActionEffect);
script_20061(Skill, Self, _, _) ->
    err_ai(Skill, Self),
    true.

script_20062(Skill = #c_skill{skill =
                                  #skill{script_args =
                                             [Ratio,
                                              SuckAdd,
                                              MaxHpRatio,
                                              IsEffSelf,
                                              HolyConDmgRatio,
                                              BuffTargetArgsOnBuff,
                                              BuffTargetArgsNormal]}},
             Self = #fighter{attr = #attr{constitution = Con}},
             Target = #fighter{}, SkillAddtArg) ->
    Fun = fun (SourceF = #fighter{id = Sid, hp_max = HpMax,
                                  group = Sgroup, buffs = Buffs},
               Dmg) ->
                  [SuckList] =
                      combat_cache:get_context_elem([#combat_context.mate_suck_list]),
                  SuckTarget = case IsEffSelf =:= 1 andalso
                                        not lists:member(Sid, SuckList)
                                   of
                                   true -> SourceF;
                                   _ ->
                                       case combat_util:get_not_die_label(Sid,
                                                                          Sgroup,
                                                                          SuckList,
                                                                          [],
                                                                          min_hp)
                                           of
                                           _SuckTarget = #fighter{} ->
                                               _SuckTarget;
                                           _ -> false
                                       end
                               end,
                  case SuckTarget of
                      #fighter{id = Tid} ->
                          [SuckList] =
                              combat_cache:get_context_elem([#combat_context.mate_suck_list]),
                          SuckHp = min(Dmg * Ratio div 1000,
                                       HpMax * MaxHpRatio div 1000)
                                       + SuckAdd,
                          SuckSvc = [{hp, 1, SuckHp}],
                          SuckSc = [{0, SuckHp, 0}],
                          combat_cache:u(Tid, SuckSvc),
                          SuckPlay = combat_play:gen_sub_skill_play(feedback,
                                                                    {Self,
                                                                     SuckTarget,
                                                                     SuckSc,
                                                                     0}),
                          combat_cache:save_context([{#combat_context.mate_suck_list,
                                                      [Tid | SuckList]}]),
                          BuffTargetNormal =
                              combat_script_buff:convert_buff(BuffTargetArgsNormal),
                          combat_play:add_sub_play(SuckPlay),
                          BuffTarget = case lists:keymember(69506,
                                                            #c_buff.id,
                                                            Buffs)
                                           of
                                           true ->
                                               BuffTargetOnBuff =
                                                   combat_script_buff:convert_buff(BuffTargetArgsOnBuff),
                                               BuffTargetNormal ++
                                                   BuffTargetOnBuff;
                                           _ -> BuffTargetNormal
                                       end,
                          combat_stat:update_total_heal(Sid, SuckHp),
                          [combat_buff:buff_add(Buff, SourceF, SuckTarget, true)
                           || Buff <- BuffTarget];
                      _ -> skip
                  end
          end,
    HolyDmg = Con * HolyConDmgRatio,
    ActionEffect = #action_effect{mate_suck_hp = Fun,
                                  extern_dmg = HolyDmg},
    combat_script_skill_calc:attack(Skill,
                                    Self,
                                    Target,
                                    SkillAddtArg,
                                    ActionEffect);
script_20062(Skill, Self, _, _) ->
    err_ai(Skill, Self),
    true.

script_20063(_Skill, _Self, #fighter{is_die = 0},
             _SkillAddtArg) ->
    ok;
script_20063(Skill = #c_skill{skill =
                                  #skill{script_args = [Ratio, Val]}},
             Self,
             Target = #fighter{hp_max = HpMax,
                               combat_init_attr =
                                   #combat_init_attr{eff_revive_ratio =
                                                         EffReviceRatio}},
             SkillAddtArg) ->
    HealHp = round(max(1,
                       Val + HpMax * (Ratio + EffReviceRatio) / 1000)),
    ActionEffect = #action_effect{heal_hp = HealHp},
    Tvc = [{is_die, 0, 0}],
    Tc = [{2, 0, 0}],
    SkillAddtArg1 =
        SkillAddtArg#c_skill_addt_arg{target_val_changed = Tvc,
                                      target_changed = Tc},
    combat_stat:update_revive(Target),
    combat_script_skill_calc:heal(Skill,
                                  Self,
                                  Target,
                                  SkillAddtArg1,
                                  ActionEffect);
script_20063(Skill, Self, _, _) ->
    err_ai(Skill, Self),
    true.

script_20064(CSkill = #c_skill{target_no = TargetNo,
                               skill =
                                   Skill = #skill{script_args =
                                                      [Ratio, DmgRatio]}},
             Self = #fighter{action = {DoneCskill, _}}, Target,
             SkillAddtArg) ->
    NewTargetNo = case TargetNo of
                      1 -> TargetNo;
                      _ -> 2
                  end,
    Sc = [{7, NewTargetNo, 0}],
    [SkillRangeFlag] =
        combat_cache:get_context_elem([#combat_context.is_skill_range]),
    case SkillRangeFlag =:= false andalso TargetNo =:= 1 of
        true ->
            case util:rand(1, 1000) =< Ratio of
                true ->
                    NewDoneCskill = DoneCskill#c_skill{skill =
                                                           Skill#skill{script_args
                                                                           =
                                                                           [0,
                                                                            DmgRatio]}},
                    NewCs = combat_skill:passive_to_variety_skill(Self,
                                                                  NewDoneCskill,
                                                                  DmgRatio),
                    [PassiveAttacks] =
                        combat_cache:get_context_elem([#combat_context.passive_attack]),
                    combat_cache:save_context([{#combat_context.passive_attack,
                                                [{0, 1, NewCs}
                                                 | PassiveAttacks]},
                                               {#combat_context.is_skill_range,
                                                true}]),
                    ok;
                _ -> ok
            end;
        _ -> ok
    end,
    SkillAddtArg1 =
        SkillAddtArg#c_skill_addt_arg{self_changed = Sc},
    combat_script_skill_calc:attack(CSkill,
                                    Self,
                                    Target,
                                    SkillAddtArg1,
                                    #action_effect{});
script_20064(Skill, Self, _, _) ->
    err_ai(Skill, Self),
    true.

script_20065(Skill = #c_skill{skill =
                                  #skill{script_args = [Ratio, MaxRatio]}},
             Self = #fighter{attr =
                                 #attr{phy_dmg = PhyDmg, magic_dmg = MagicDmg},
                             special_attr =
                                 #special_attr{round_hurt = RoundHurt}},
             Target, SkillAddtArg) ->
    Dmg = max(PhyDmg, MagicDmg),
    MaxVal = round(Dmg * MaxRatio / 1000),
    Val = min(round(RoundHurt * Ratio / 1000), MaxVal),
    ActionEffect = #action_effect{holy_addt = Val},
    combat_script_skill_calc:attack(Skill,
                                    Self,
                                    Target,
                                    SkillAddtArg,
                                    ActionEffect);
script_20065(Skill, Self, _, _) ->
    err_ai(Skill, Self),
    true.

script_20066(Skill = #c_skill{skill =
                                  S = #skill{script_args =
                                                 [Ratio,
                                                  Val,
                                                  DelRatio,
                                                  DelType],
                                             buff_target = BuffTarget}},
             Self = #fighter{id = Sid},
             Target = #fighter{id = Tid, hp_max = HpMax,
                               is_die = IsDie, buffs = Buffs,
                               combat_init_attr =
                                   #combat_init_attr{eff_revive_ratio =
                                                         EffReviceRatio}},
             SkillAddtArg) ->
    {Tvc, Tc, NewBuffTarget, HealHp, CanAntiHeal} = case
                                                        IsDie
                                                        of
                                                        1 ->
                                                            combat_stat:update_revive(Target),
                                                            {[{is_die, 0, 0}],
                                                             [{2, 0, 0}],
                                                             [],
                                                             round(max(1,
                                                                       Val +
                                                                           HpMax
                                                                               *
                                                                               (Ratio
                                                                                    +
                                                                                    EffReviceRatio)
                                                                               /
                                                                               1000)),
                                                             0};
                                                        0 ->
                                                            {[],
                                                             [],
                                                             BuffTarget,
                                                             round(max(1,
                                                                       Val +
                                                                           HpMax
                                                                               *
                                                                               Ratio
                                                                               /
                                                                               1000)),
                                                             1}
                                                    end,
    case util:rand(1, 1000) =< DelRatio of
        true ->
            ClearBuff = case DelType of
                            1 ->
                                [Buff
                                 || Buff = #c_buff{can_dispel = 1,
                                                   eff_type = buff}
                                        <- Buffs];
                            2 ->
                                [Buff
                                 || Buff = #c_buff{can_dispel = 1,
                                                   eff_type = debuff}
                                        <- Buffs];
                            3 ->
                                [Buff
                                 || Buff = #c_buff{can_dispel = 1,
                                                   eff_type = debuff,
                                                   sec_type = SecType}
                                        <- Buffs,
                                    SecType =/= control];
                            4 ->
                                [Buff
                                 || Buff = #c_buff{can_dispel = 1,
                                                   sec_type = control}
                                        <- Buffs];
                            _ -> []
                        end,
            lists:foreach(fun (Buff) ->
                                  combat_buff:buff_del(Tid, Sid, Buff)
                          end,
                          ClearBuff);
        false -> skip
    end,
    case IsDie of
        1 ->
            [ReviveCount] =
                combat_cache:get_context_elem([#combat_context.revive_count]),
            case ReviveCount < 2 of
                true ->
                    NewReviveCount = ReviveCount + 1,
                    combat_cache:save_context([{#combat_context.revive_count,
                                                NewReviveCount}]),
                    ActionEffect = #action_effect{heal_hp = HealHp,
                                                  can_anti_heal = CanAntiHeal},
                    NewS = S#skill{buff_target = NewBuffTarget},
                    NewSkill = Skill#c_skill{skill = NewS},
                    SkillAddtArg1 =
                        SkillAddtArg#c_skill_addt_arg{target_val_changed = Tvc,
                                                      target_changed = Tc},
                    combat_script_skill_calc:heal(NewSkill,
                                                  Self,
                                                  Target,
                                                  SkillAddtArg1,
                                                  ActionEffect);
                _ -> ok
            end;
        _ ->
            ActionEffect = #action_effect{heal_hp = HealHp,
                                          can_anti_heal = CanAntiHeal},
            NewS = S#skill{buff_target = NewBuffTarget},
            NewSkill = Skill#c_skill{skill = NewS},
            SkillAddtArg1 =
                SkillAddtArg#c_skill_addt_arg{target_val_changed = Tvc,
                                              target_changed = Tc},
            combat_script_skill_calc:heal(NewSkill,
                                          Self,
                                          Target,
                                          SkillAddtArg1,
                                          ActionEffect)
    end;
script_20066(Skill, Self, _, _) -> err_ai(Skill, Self).

script_20067(Skill = #c_skill{}, Self, Target,
             SkillAddtArg) ->
    combat_script_skill_calc:attack(Skill,
                                    Self,
                                    Target,
                                    SkillAddtArg,
                                    #action_effect{}).

script_20068(Skill = #c_skill{skill =
                                  #skill{script_args = [Ratio]}},
             Self = #fighter{attr = #attr{phy_dmg = PhyDmg}}, Target,
             SkillAddtArg) ->
    DefAtk = round(PhyDmg * (1 + Ratio / 1000)),
    logger:debug("攻击:~w",
                 [DefAtk],
                 combat_script_skill,
                 2698),
    combat_script_skill_calc:attack(Skill,
                                    Self,
                                    Target,
                                    SkillAddtArg,
                                    #action_effect{default_atk = DefAtk});
script_20068(Skill, Self, _, _) -> err_ai(Skill, Self).

script_20069(Skill = #c_skill{target_no = TargetNo},
             Self, Target, SkillAddtArg) ->
    Sc = [{7, TargetNo, 0}],
    SkillAddtArg1 =
        SkillAddtArg#c_skill_addt_arg{self_changed = Sc},
    combat_script_skill_calc:attack(Skill,
                                    Self,
                                    Target,
                                    SkillAddtArg1,
                                    #action_effect{}).

script_20070(Skill = #c_skill{skill =
                                  #skill{script_args =
                                             [UnitId,
                                              DieRound,
                                              HpRatio,
                                              DefRatio]}},
             Self = #fighter{name = _Sname, group = Sgroup,
                             base_id = _BaseId, id = _Sid},
             #fighter{}, SkillAddtArg) ->
    case combat_cache:f(by_baseid, UnitId) of
        #fighter{is_die = 0, is_escape = 0} -> skip;
        _ ->
            Summon = case unit_convert:to(unit_base_id_to_fighter,
                                          UnitId)
                         of
                         {ok, _Summon} -> _Summon;
                         _ -> #fighter{}
                     end,
            NewSummon = gen_args_20070(Summon,
                                       Self,
                                       Sgroup,
                                       HpRatio,
                                       DefRatio),
            case combat_fighter:add_fighters(pet_clone,
                                             Sgroup,
                                             [NewSummon])
                of
                Summons = [SmF = #fighter{id = Fid}] ->
                    effect_enter_war_skill_20070(SmF),
                    [KillList] =
                        combat_cache:get_context_elem([#combat_context.kill_by_self_list]),
                    NewK = {Sgroup, Fid, DieRound},
                    NewKillList = lists:keystore(Sgroup, 1, KillList, NewK),
                    combat_cache:save_context([{#combat_context.kill_by_self_list,
                                                NewKillList}]),
                    combat_script_skill_calc:cast(attack,
                                                  Skill,
                                                  Self,
                                                  Self,
                                                  SkillAddtArg,
                                                  #action_effect{}),
                    combat_play:add_sub_play(combat_play:gen_sub_summon_play(0,
                                                                             Self,
                                                                             Summons));
                _ -> skip
            end
    end;
script_20070(Skill, Self, _, _) -> err_ai(Skill, Self).

gen_args_20070(Summon = #fighter{},
               #fighter{hp_max = HpMax, mp_max = MpMax,
                        attr =
                            Attr = #attr{magic_def = MagicDef, phy_def = PhyDef,
                                         enhance_control = EnhanceControl}},
               Group, HpRatio, DefRatio) ->
    SelfPresideStatus = 0,
    SelfPresideText = "",
    TargetPresideStatus = 0,
    TargetPresideText = "",
    CombatStatistics = #combat_statistics{},
    NewHpMax = round(HpMax * HpRatio / 1000),
    NewMagicDef = round(MagicDef * DefRatio / 1000),
    NewPhyDef = round(PhyDef * DefRatio / 1000),
    Summon#fighter{hp = NewHpMax, hp_max = NewHpMax,
                   mp = MpMax,
                   attr =
                       Attr#attr{hp_max = NewHpMax, magic_def = NewMagicDef,
                                 phy_def = NewPhyDef,
                                 enhance_control = EnhanceControl},
                   group = Group, self_preside_status = SelfPresideStatus,
                   self_preside_text = SelfPresideText,
                   target_preside_status = TargetPresideStatus,
                   target_preside_text = TargetPresideText,
                   combat_statistics = CombatStatistics, buffs = [],
                   skill_cooldown = []}.

effect_enter_war_skill_20070(Self =
                                 #fighter{passive_skills = PassiveSkills}) ->
    logger:debug("=========:~w",
                 [PassiveSkills],
                 combat_script_skill,
                 2749),
    case lists:filter(fun (#c_skill{passive_type =
                                        PsType}) ->
                              lists:member(12, PsType)
                      end,
                      PassiveSkills)
        of
        CSkillList = [_ | _] ->
            logger:debug("========effect_enter_war_skill_20070====:~w",
                         [CSkillList],
                         combat_script_skill,
                         2752),
            effect_enter_war_skill_20070(CSkillList, Self);
        _ ->
            logger:debug("========effect_enter_war_skill_20070====:",
                         [],
                         combat_script_skill,
                         2755),
            ok
    end.

effect_enter_war_skill_20070([], _Pet) -> ok;
effect_enter_war_skill_20070([CSkill = #c_skill{action =
                                                    {Mod, Act}}
                              | T],
                             Pet) ->
    SkillAddtArg = #c_skill_addt_arg{},
    Mod:Act(CSkill, Pet, Pet, SkillAddtArg),
    effect_enter_war_skill_20070(T, Pet).

script_20071(Skill = #c_skill{target_no = TargetNo,
                              skill = #skill{script_args = [AddBuffs]}},
             Self = #fighter{},
             Target = #fighter{id = Tid, type = Ttype,
                               buffs = Buffs},
             SkillAddtArg) ->
    case lists:member(Ttype, [6, 3, 5]) of
        true ->
            case TargetNo of
                1 ->
                    case lists:keyfind(129001, #c_buff.script_id, Buffs) of
                        #c_buff{duration_left = Left} when Left > 0 -> skip;
                        _ ->
                            logger:debug("第一目标========:~w",
                                         [Tid],
                                         combat_script_skill,
                                         2781),
                            combat_cache:save_context([{#combat_context.fisrt_target_id,
                                                        Tid}]),
                            ActionEffect = #action_effect{},
                            combat_script_skill_calc:cast(attack,
                                                          Skill,
                                                          Self,
                                                          Target,
                                                          SkillAddtArg,
                                                          ActionEffect)
                    end;
                _ ->
                    [FirstTargetId] =
                        combat_cache:get_context_elem([#combat_context.fisrt_target_id]),
                    logger:debug("目标========:~w, 序号======:~w",
                                 [FirstTargetId, TargetNo],
                                 combat_script_skill,
                                 2789),
                    case combat_cache:f(by_id, FirstTargetId) of
                        FirstTarget = #fighter{} ->
                            HaloBuffs =
                                combat_script_buff:convert_buff(AddBuffs),
                            [combat_buff:buff_add(HaloBuff, FirstTarget, Target)
                             || HaloBuff <- HaloBuffs];
                        _ -> skip
                    end
            end;
        _ -> skip
    end;
script_20071(Skill, Self, _, _) -> err_ai(Skill, Self).

script_20072(Skill = #c_skill{skill =
                                  #skill{script_args = [DmgRatio, MaxRatio]}},
             Self = #fighter{lev = SLev},
             Target = #fighter{hp_max = TMaxHP}, SkillAddtArg) ->
    MaxVal = round(MaxRatio * SLev / 1000),
    AddtDmg = min(MaxVal, round(DmgRatio * TMaxHP / 1000)),
    logger:debug("~w",
                 [AddtDmg],
                 combat_script_skill,
                 2807),
    combat_script_skill_calc:attack(Skill,
                                    Self,
                                    Target,
                                    SkillAddtArg,
                                    #action_effect{extern_dmg = AddtDmg});
script_20072(Skill, Self, _, _) -> err_ai(Skill, Self).

script_20073(Skill = #c_skill{skill =
                                  #skill{script_args = [SelfLossHpRatio]}},
             Self = #fighter{id = Sid, hp_max = HpMax},
             Target = #fighter{}, SkillAddtArg) ->
    SelfLossHp = round(SelfLossHpRatio * HpMax / 1000),
    FeedSvc = [{hp, 1, -SelfLossHp}],
    combat_cache:u(Sid, FeedSvc),
    FeedSc = [{0, -SelfLossHp, 0}],
    FeedSubPlay = combat_play:gen_sub_skill_play(feedback,
                                                 {Target, Self, FeedSc, 0, []}),
    combat_play:add_sub_play(FeedSubPlay),
    combat_script_skill_calc:attack(Skill,
                                    Self,
                                    Target,
                                    SkillAddtArg,
                                    #action_effect{});
script_20073(Skill, Self, _, _) -> err_ai(Skill, Self).

script_20074(Skill = #c_skill{target_no = TargetNo,
                              skill =
                                  #skill{script_args =
                                             [Ratio, OtherRatio, BuffList]}},
             Self = #fighter{buffs = SelfBuffs}, Target = #fighter{},
             SkillAddtArg) ->
    case TargetNo of
        1 ->
            Buffs = combat_script_buff:convert_buff(BuffList),
            [combat_buff:buff_add(CBuff, Self, Target)
             || CBuff <- Buffs],
            ScPlay = [{7, TargetNo, 0}],
            DoActionEffect = #action_effect{dec_def_ratio = Ratio},
            SkillAddtArg1 =
                SkillAddtArg#c_skill_addt_arg{self_changed = ScPlay},
            combat_script_skill_calc:attack(Skill,
                                            Self,
                                            Target,
                                            SkillAddtArg1,
                                            DoActionEffect);
        _ ->
            case lists:keymember(30006, #c_buff.id, SelfBuffs) of
                true ->
                    ScPlay = [{7, 2, 0}],
                    DoActionEffect = case
                                         combat_cache:get_context_elem([#combat_context.skill_dmg])
                                         of
                                         [SkillDmg] when SkillDmg > 0 ->
                                             DirectDmg = round(SkillDmg *
                                                                   OtherRatio
                                                                   / 1000),
                                             #action_effect{can_protect = 0,
                                                            calc_def = 0,
                                                            direct_dmg =
                                                                DirectDmg,
                                                            hit_ratio = 10000};
                                         _ ->
                                             #action_effect{can_protect = 0,
                                                            direct_dmg = 0,
                                                            hit_ratio = 10000}
                                     end,
                    SkillAddtArg1 =
                        SkillAddtArg#c_skill_addt_arg{self_changed = ScPlay},
                    combat_script_skill_calc:attack(Skill,
                                                    Self,
                                                    Target,
                                                    SkillAddtArg1,
                                                    DoActionEffect);
                _ -> ok
            end
    end;
script_20074(Skill, Self, _, _) -> err_ai(Skill, Self).

script_20075(Skill = #c_skill{skill =
                                  #skill{script_args = [SkillId]}},
             Self = #fighter{id = Fid}, Target = #fighter{},
             SkillAddtArg) ->
    logger:debug("执行脚本=======:~w",
                 [20075],
                 combat_script_skill,
                 2865),
    case combat_skill:is_skill_in_cooldown(Fid, SkillId) of
        false ->
            AddSkill = combat_script_skill:to_combat_skill({SkillId,
                                                            1}),
            combat_skill:add_skill_cooldown(Fid, AddSkill, 1),
            [PassiveAttacks] =
                combat_cache:get_context_elem([#combat_context.passive_attack]),
            combat_cache:save_context([{#combat_context.passive_attack,
                                        [{0, 1, AddSkill} | PassiveAttacks]}]);
        _ -> skip
    end,
    ActionEffect = #action_effect{},
    combat_script_skill_calc:attack(Skill,
                                    Self,
                                    Target,
                                    SkillAddtArg,
                                    ActionEffect);
script_20075(Skill, Self, _, _) -> err_ai(Skill, Self).

script_20076(Skill, Self, Target, SkillAddtArg) ->
    ActionEffect = #action_effect{},
    combat_script_skill_calc:cast(attack,
                                  Skill,
                                  Self,
                                  Target,
                                  SkillAddtArg,
                                  ActionEffect).

script_20077(CSkill = #c_skill{skill =
                                   Skill = #skill{script_args =
                                                      [DmgRatio, HpRatio],
                                                  buff_target = BuffTarget}},
             Self = #fighter{lev = _Slev},
             Target = #fighter{hp = THp, hp_max = ThpMax},
             SkillAddtArg) ->
    AddtDmg = round(DmgRatio * ThpMax / 1000),
    CurrHpRatio = round(THp * 100 / ThpMax),
    NewBuffTarget = case CurrHpRatio < HpRatio of
                        true -> BuffTarget;
                        _ -> []
                    end,
    combat_script_skill_calc:attack(CSkill#c_skill{skill =
                                                       Skill#skill{buff_target =
                                                                       NewBuffTarget}},
                                    Self,
                                    Target,
                                    SkillAddtArg,
                                    #action_effect{extern_dmg = AddtDmg,
                                                   can_crit = 0});
script_20077(Skill, Self, _, _) -> err_ai(Skill, Self).

script_20078(Skill = #c_skill{target_no = TargetNo,
                              skill = #skill{script_args = [AddBuffs]}},
             Self = #fighter{}, Target = #fighter{id = Tid},
             SkillAddtArg) ->
    case TargetNo of
        1 ->
            logger:debug("第一目标========:~w",
                         [Tid],
                         combat_script_skill,
                         2907),
            combat_cache:save_context([{#combat_context.fisrt_target_id,
                                        Tid}]),
            ActionEffect = #action_effect{},
            combat_script_skill_calc:cast(attack,
                                          Skill,
                                          Self,
                                          Target,
                                          SkillAddtArg,
                                          ActionEffect);
        _ ->
            [FirstTargetId] =
                combat_cache:get_context_elem([#combat_context.fisrt_target_id]),
            logger:debug("目标========:~w, 序号======:~w",
                         [FirstTargetId, TargetNo],
                         combat_script_skill,
                         2914),
            case combat_cache:f(by_id, FirstTargetId) of
                FirstTarget = #fighter{} ->
                    HaloBuffs = combat_script_buff:convert_buff(AddBuffs),
                    [combat_buff:buff_add(HaloBuff, FirstTarget, Target)
                     || HaloBuff <- HaloBuffs];
                _ -> skip
            end
    end;
script_20078(Skill, Self, _, _) -> err_ai(Skill, Self).

script_20079(Skill = #c_skill{skill =
                                  #skill{script_args = [HealRatio, HealHp]}},
             Self = #fighter{id = Sid},
             Target = #fighter{id = Tid, hp_max = HpMax,
                               buffs = Buffs},
             SkillAddtArg) ->
    AllHealHp = round(HealHp + HpMax * HealRatio / 1000),
    ActionEffect = #action_effect{heal_hp = AllHealHp},
    case [Buff
          || Buff = #c_buff{can_dispel = 1, eff_type = debuff,
                            sec_type = SecType}
                 <- Buffs,
             SecType =/= control]
        of
        DelBuffs = [_ | _] ->
            case util:rand_list(DelBuffs) of
                DelBuff = #c_buff{} ->
                    combat_buff:buff_del(Tid, Sid, DelBuff);
                _ -> ok
            end;
        _ -> ok
    end,
    combat_script_skill_calc:heal(Skill,
                                  Self,
                                  Target,
                                  SkillAddtArg,
                                  ActionEffect#action_effect{can_anti_heal =
                                                                 1});
script_20079(Skill, Self, _, _) -> err_ai(Skill, Self).

script_20080(Skill = #c_skill{target_no = TargetNo,
                              skill = S = #skill{buff_target = BuffTarget}},
             Self = #fighter{}, Target, SkillAddtArg) ->
    NewBuffTarget = case TargetNo of
                        1 -> BuffTarget;
                        _ -> []
                    end,
    combat_script_skill_calc:attack(Skill#c_skill{skill =
                                                      S#skill{buff_target =
                                                                  NewBuffTarget}},
                                    Self,
                                    Target,
                                    SkillAddtArg,
                                    #action_effect{});
script_20080(Skill = #c_skill{}, Self, Target,
             SkillAddtArg) ->
    combat_script_skill_calc:attack(Skill,
                                    Self,
                                    Target,
                                    SkillAddtArg,
                                    #action_effect{}).

script_20081(Skill = #c_skill{skill =
                                  #skill{dmg_ratio = [DmgRatio]}},
             Self = #fighter{special_status =
                                 #special_status{is_tempt = 1,
                                                 tempt_dmg = TemptDmg}},
             Target, SkillAddtArg) ->
    Dmg = round(DmgRatio * TemptDmg / 1000),
    DirectDmg = max(1, Dmg),
    logger:debug("~w",
                 [DirectDmg],
                 combat_script_skill,
                 2961),
    combat_script_skill_calc:attack(Skill,
                                    Self,
                                    Target,
                                    SkillAddtArg,
                                    #action_effect{direct_dmg = DirectDmg});
script_20081(Skill, Self, _, _) -> err_ai(Skill, Self).

script_20082(Skill = #c_skill{target_no = TargetNo,
                              skill =
                                  BaseSkill = #skill{script_args =
                                                         [AttackTimes,
                                                          SuckRatio,
                                                          SuckMax,
                                                          Flag1,
                                                          Flag2]}},
             Self = #fighter{lev = Lev,
                             passive_skills = PassiveSkills},
             Target, SkillAddtArg) ->
    SelfBuff = case lists:keyfind(60554,
                                  #c_skill.id,
                                  PassiveSkills)
                   of
                   #c_skill{skill = #skill{buff_self = Buffs}} ->
                       logger:debug("=========~w",
                                    [Buffs],
                                    combat_script_skill,
                                    2971),
                       BuffId = case Flag1 == 1 of
                                    true -> 70081;
                                    _ -> 70080
                                end,
                       case lists:keyfind(BuffId, #c_buff.id, Buffs) of
                           CBuff = #c_buff{} -> [CBuff];
                           _ -> []
                       end;
                   _ -> []
               end,
    logger:debug("~w",
                 [SelfBuff],
                 combat_script_skill,
                 2985),
    {NewSkill, ActionEffect, NSc} = case TargetNo =<
                                             AttackTimes
                                        of
                                        true ->
                                            Sc = [{17, Flag1, 0}],
                                            {Skill,
                                             #action_effect{hit_ratio = 10000,
                                                            suck_hp = SuckRatio,
                                                            alice_suck_max =
                                                                SuckMax * Lev},
                                             Sc};
                                        _ ->
                                            Sc = [{17, Flag2, 0}],
                                            {Skill#c_skill{skill =
                                                               BaseSkill#skill{buff_target
                                                                                   =
                                                                                   []}},
                                             #action_effect{},
                                             Sc}
                                    end,
    SkillAddtArg1 =
        SkillAddtArg#c_skill_addt_arg{self_changed = NSc,
                                      self_buff = SelfBuff},
    logger:debug("使用魔幻卡牌技能:~w",
                 [{NewSkill, SkillAddtArg1, ActionEffect}],
                 combat_script_skill,
                 2995),
    combat_script_skill_calc:attack(NewSkill,
                                    Self,
                                    Target,
                                    SkillAddtArg1,
                                    ActionEffect);
script_20082(Skill, Self, _, _) -> err_ai(Skill, Self).

script_20083(Skill = #c_skill{action_no = ActionNo,
                              skill =
                                  #skill{script_args = AttackRatio = [_ | _]}},
             Self = #fighter{lev = Lev}, Target, SkillAddtArg) ->
    Ratio = lists:nth(ActionNo, AttackRatio),
    logger:debug("攻击次数:~w",
                 [{ActionNo, Lev, AttackRatio}],
                 combat_script_skill,
                 3003),
    DefAtk = round(Lev * Ratio / 1000),
    combat_script_skill_calc:attack(Skill,
                                    Self,
                                    Target,
                                    SkillAddtArg,
                                    #action_effect{act_dmg = DefAtk});
script_20083(Skill, Self, _, _) -> err_ai(Skill, Self).

script_20084(Skill = #c_skill{target_no = TargetNo,
                              skill = #skill{script_args = [AtkRatio, Ratio]}},
             Self = #fighter{hp = Hp,
                             attr = #attr{phy_dmg = PhyDmg, hp_max = HpMax},
                             passive_skills = PassiveSkills},
             Target = #fighter{}, SkillAddtArg) ->
    Sc = [{7, TargetNo, 0}],
    SuckHp = case combat_cache:f(by_script_id,
                                 PassiveSkills,
                                 60006)
                 of
                 #c_skill{skill =
                              #skill{script_args = [_, SuckRatio]}} ->
                     SuckBase = case combat_cache:f(by_script_id,
                                                    PassiveSkills,
                                                    60186)
                                    of
                                    #c_skill{skill =
                                                 #skill{script_args =
                                                            [Base1,
                                                             Base2,
                                                             Base3]}} ->
                                        V1 = Hp / HpMax * 100,
                                        if V1 =< 20 -> Base3;
                                           V1 =< 50 -> Base2;
                                           true -> Base1
                                        end;
                                    _ -> 0
                                end,
                     SuckBase + SuckRatio;
                 _ -> 0
             end,
    ActionEffect = case TargetNo of
                       1 ->
                           logger:debug("计算吸血比例:~w",
                                        [SuckHp],
                                        combat_script_skill,
                                        3030),
                           ActDmg = round(PhyDmg * AtkRatio / 1000),
                           #action_effect{act_dmg = ActDmg, suck_hp = SuckHp,
                                          hit_ratio = 10000};
                       _ ->
                           case
                               combat_cache:get_context_elem([#combat_context.skill_dmg])
                               of
                               [SkillDmg] when SkillDmg > 0 ->
                                   DirectDmg = round(SkillDmg * Ratio / 1000),
                                   #action_effect{can_protect = 0, calc_def = 1,
                                                  direct_dmg = DirectDmg,
                                                  suck_hp = SuckHp,
                                                  hit_ratio = 10000};
                               _ ->
                                   #action_effect{can_protect = 0,
                                                  direct_dmg = 0,
                                                  suck_hp = SuckHp,
                                                  hit_ratio = 10000}
                           end
                   end,
    SkillAddtArg1 =
        SkillAddtArg#c_skill_addt_arg{self_changed = Sc},
    combat_script_skill_calc:attack(Skill,
                                    Self,
                                    Target,
                                    SkillAddtArg1,
                                    ActionEffect);
script_20084(Skill, Self, _, _) -> err_ai(Skill, Self).

gen_args_20048(1, Target, Group, HpRatio, AspdRatio,
               DmgRatio, AiList) ->
    List = [Target],
    do_gen_args_20048(List,
                      Group,
                      HpRatio,
                      AspdRatio,
                      DmgRatio,
                      AiList,
                      [],
                      []);
gen_args_20048(2, #fighter{group = Tgroup}, Group,
               HpRatio, AspdRatio, DmgRatio, AiList) ->
    List =
        combat_util:filter_fighter(combat_cache:all(Tgroup),
                                   [1, 5]),
    do_gen_args_20048(List,
                      Group,
                      HpRatio,
                      AspdRatio,
                      DmgRatio,
                      AiList,
                      [],
                      []);
gen_args_20048(_, _, _, _, _, _, _) -> [].

do_gen_args_20048([], _, _, _, _, _, TargetList1,
                  TargetList2) ->
    lists:sublist(TargetList1 ++ TargetList2, 5);
do_gen_args_20048([Target = #fighter{} | T], Group,
                  HpRatio, AspdRatio, DmgRatio, AiList, TargetList1,
                  TargetList2) ->
    case do_gen_args_20048(Target,
                           Group,
                           HpRatio,
                           AspdRatio,
                           DmgRatio,
                           AiList)
        of
        NewTarget = #fighter{type = 4} ->
            do_gen_args_20048(T,
                              Group,
                              HpRatio,
                              AspdRatio,
                              DmgRatio,
                              AiList,
                              [NewTarget | TargetList1],
                              TargetList2);
        NewTarget = #fighter{type = 5} ->
            do_gen_args_20048(T,
                              Group,
                              HpRatio,
                              AspdRatio,
                              DmgRatio,
                              AiList,
                              TargetList1,
                              [NewTarget | TargetList2]);
        _ ->
            do_gen_args_20048(T,
                              Group,
                              HpRatio,
                              AspdRatio,
                              DmgRatio,
                              AiList,
                              TargetList1,
                              TargetList2)
    end;
do_gen_args_20048([_ | T], Group, HpRatio, AspdRatio,
                  DmgRatio, AiList, TargetList1, TargetList2) ->
    do_gen_args_20048(T,
                      Group,
                      HpRatio,
                      AspdRatio,
                      DmgRatio,
                      AiList,
                      TargetList1,
                      TargetList2).

do_gen_args_20048(Target = #fighter{type = 1,
                                    name = Name, hp_max = HpMax, mp_max = MpMax,
                                    classes = Classes,
                                    attr =
                                        Attr = #attr{atk_speed = AtkSpeed,
                                                     phy_dmg = PhyDmg,
                                                     magic_dmg = MagicDmg},
                                    backup_pets = BackUpPets, is_die = 0,
                                    is_escape = 0, active_pet = ActivePet},
                  Group, HpRatio, AspdRatio, DmgRatio, AiList) ->
    SelfPresideStatus = 0,
    SelfPresideText = "",
    TargetPresideStatus = 0,
    TargetPresideText = "",
    CombatStatistics = #combat_statistics{},
    NewHpMax = round(HpMax * HpRatio / 1000),
    NewAtkSpeed = round(AtkSpeed * AspdRatio / 1000),
    NewPhyDmg = round(PhyDmg * DmgRatio / 1000),
    NewMagicDmg = round(MagicDmg * DmgRatio / 1000),
    NewBackUpPets = [Cpet#c_pet{can_summon = 1,
                                skill_plan = []}
                     || Cpet = #c_pet{} <- BackUpPets],
    NewActivePet = case ActivePet of
                       #c_pet{} -> ActivePet#c_pet{skill_plan = []};
                       _ -> ActivePet
                   end,
    Name1 = util:flist(lang:get("~ts的灵魂"), [Name]),
    AiId = case lists:keyfind(Classes, 1, AiList) of
               {_, Aid} -> Aid;
               _ -> 0
           end,
    Target#fighter{type = 4, pid = undefined, is_hosted = 1,
                   name = Name1, hp = NewHpMax, hp_max = NewHpMax,
                   mp = MpMax,
                   attr =
                       Attr#attr{hp_max = NewHpMax, atk_speed = NewAtkSpeed,
                                 phy_dmg = NewPhyDmg, magic_dmg = NewMagicDmg},
                   group = Group, active_pet = NewActivePet,
                   backup_pets = NewBackUpPets,
                   self_preside_status = SelfPresideStatus,
                   self_preside_text = SelfPresideText,
                   target_preside_status = TargetPresideStatus,
                   target_preside_text = TargetPresideText,
                   combat_statistics = CombatStatistics, buffs = [],
                   skill_cooldown = [], ai_id = AiId, pos = 0,
                   active_guard = []};
do_gen_args_20048(Target = #fighter{type = 5,
                                    name = Name, hp_max = HpMax, mp_max = MpMax,
                                    attr =
                                        Attr = #attr{atk_speed = AtkSpeed,
                                                     phy_dmg = PhyDmg,
                                                     magic_dmg = MagicDmg},
                                    is_die = 0, is_escape = 0},
                  Group, HpRatio, AspdRatio, DmgRatio, _AiList) ->
    SelfPresideStatus = 0,
    SelfPresideText = "",
    TargetPresideStatus = 0,
    TargetPresideText = "",
    GuardPid = 0,
    GuardFid = 0,
    GuardPos = 0,
    CombatStatistics = #combat_statistics{},
    NewHpMax = round(HpMax * HpRatio / 1000),
    NewAtkSpeed = round(AtkSpeed * AspdRatio / 1000),
    NewPhyDmg = round(PhyDmg * DmgRatio / 1000),
    NewMagicDmg = round(MagicDmg * DmgRatio / 1000),
    Name1 = util:flist(lang:get("~ts的灵魂"), [Name]),
    Target#fighter{hp = NewHpMax, hp_max = NewHpMax,
                   mp = MpMax,
                   attr =
                       Attr#attr{hp_max = NewHpMax, atk_speed = NewAtkSpeed,
                                 phy_dmg = NewPhyDmg, magic_dmg = NewMagicDmg},
                   name = Name1, guard_pid = GuardPid,
                   guard_fid = GuardFid, guard_pos = GuardPos, pos = 0,
                   group = Group, self_preside_status = SelfPresideStatus,
                   self_preside_text = SelfPresideText,
                   target_preside_status = TargetPresideStatus,
                   target_preside_text = TargetPresideText,
                   combat_statistics = CombatStatistics, buffs = [],
                   skill_cooldown = []};
do_gen_args_20048(_, _, _, _, _, _) -> false.

script_50000(Skill = #c_skill{skill =
                                  #skill{script_args = [Ratio]}},
             Self, Target, SkillAddtArg) ->
    ActionEffect = #action_effect{crit_ratio = Ratio},
    combat_script_skill_calc:attack(Skill,
                                    Self,
                                    Target,
                                    SkillAddtArg,
                                    ActionEffect);
script_50000(Skill, Self, _, _) -> err_ai(Skill, Self).

script_50001(Skill = #c_skill{skill =
                                  #skill{script_args = [Ratio]}},
             Self, Target, SkillAddtArg) ->
    ActionEffect = #action_effect{hit_ratio = Ratio * 10},
    combat_script_skill_calc:attack(Skill,
                                    Self,
                                    Target,
                                    SkillAddtArg,
                                    ActionEffect);
script_50001(Skill, Self, _, _) -> err_ai(Skill, Self).

script_50002(Skill = #c_skill{skill =
                                  S = #skill{script_args =
                                                 [Num, Repeat, UnitList],
                                             buff_target = BuffTarget}},
             Self = #fighter{name = _Sname, base_id = _BaseId,
                             group = Sgroup},
             Target, SkillAddtArg) ->
    Args1 = gen_args_50002(Num, Repeat, UnitList),
    case combat_fighter:add_fighters(by_summon,
                                     Sgroup,
                                     Args1)
        of
        Summons = [_ | _] ->
            {NewSummons, _AddFs} = case BuffTarget of
                                       [_ | _] ->
                                           case util:rand_list(Summons) of
                                               Fighter = #fighter{id = Fid} ->
                                                   lists:foreach(fun (Buff) ->
                                                                         combat_buff:buff_add(Buff,
                                                                                              Self,
                                                                                              Fighter,
                                                                                              false)
                                                                 end,
                                                                 BuffTarget),
                                                   NewFighter =
                                                       combat_cache:f(by_id,
                                                                      Fid),
                                                   BuffInfos =
                                                       combat_buff:gen_buff_infos(NewFighter),
                                                   NewFighter1 =
                                                       NewFighter#fighter{buff_infos
                                                                              =
                                                                              BuffInfos},
                                                   combat_cache:u(NewFighter1),
                                                   {lists:keystore(Fid,
                                                                   #fighter.id,
                                                                   Summons,
                                                                   NewFighter1),
                                                    [NewFighter1]};
                                               _ -> {Summons, []}
                                           end;
                                       _ -> {Summons, []}
                                   end,
            combat_script_skill_calc:cast(attack,
                                          Skill#c_skill{skill =
                                                            S#skill{buff_target
                                                                        = []}},
                                          Self,
                                          Target,
                                          SkillAddtArg,
                                          #action_effect{}),
            combat_play:add_sub_play(combat_play:gen_sub_summon_play(0,
                                                                     Self,
                                                                     NewSummons)),
            [combat_fighter:unit_talk(AddF, 1) || AddF <- Summons],
            ok;
        _ -> ignore
    end;
script_50002(Skill, Self, _, _) -> err_ai(Skill, Self).

gen_args_50002(Num, Repeat, UnitList) ->
    NewNum = case Num > 9 of
                 true -> 9;
                 _ -> max(1, Num)
             end,
    gen_args_50002(NewNum, Repeat, UnitList, []).

gen_args_50002(Num, _Repeat, _UnitList, Result)
    when Num =< 0 ->
    Result;
gen_args_50002(Num, Repeat, UnitList = [_ | _],
               Result) ->
    UnitId = util:rand_list(UnitList),
    NewUnitList = case Repeat of
                      0 -> UnitList -- [UnitId];
                      _ -> UnitList
                  end,
    gen_args_50002(Num - 1,
                   Repeat,
                   NewUnitList,
                   [UnitId | Result]);
gen_args_50002(Num, _Repeat, UnitList, _Result) ->
    logger:error("错误的召唤列表Num:~w UnitList:~w",
                 [Num, UnitList],
                 combat_script_skill,
                 3178),
    [].

script_50003(Skill = #c_skill{skill =
                                  #skill{elem_type = ElemType,
                                         script_args =
                                             [Rate, HurtMulti, HealRatio]}},
             Self = #fighter{attr =
                                 #attr{phy_dmg = PhyDmg, magic_dmg = MagicDmg,
                                       holy_dmg = HolyDmg}},
             Target = #fighter{attr =
                                   #attr{phy_def = Pdef, magic_def = Mdef}},
             SkillAddtArg) ->
    case util:rand(1, 1000) < Rate of
        true ->
            combat_script_skill_calc:attack(Skill,
                                            Self,
                                            Target,
                                            SkillAddtArg,
                                            #action_effect{hurt_multi =
                                                               HurtMulti});
        _ ->
            Atk = case ElemType of
                      1 -> MagicDmg;
                      _ -> PhyDmg
                  end,
            Def = case ElemType of
                      1 -> Mdef;
                      _ -> Pdef
                  end,
            HealHp = round((max(round(Atk / 10), Atk - Def) +
                                HolyDmg)
                               * HealRatio
                               / 1000),
            combat_script_skill_calc:heal(Skill,
                                          Self,
                                          Target,
                                          SkillAddtArg,
                                          #action_effect{heal_hp = HealHp,
                                                         can_anti_heal = 1})
    end;
script_50003(Skill, Self, _, _) -> err_ai(Skill, Self).

script_50004(Skill = #c_skill{skill =
                                  #skill{script_args =
                                             [HpRatio, Ratio1, Ratio2]}},
             Self, Target = #fighter{hp = Hp, hp_max = HpMax},
             SkillAddtArg) ->
    Ratio = case Hp / HpMax < HpRatio / 1000 of
                true -> Ratio1;
                false -> Ratio2
            end,
    ActionEffect = #action_effect{act_dmg_ratio = Ratio},
    combat_script_skill_calc:attack(Skill,
                                    Self,
                                    Target,
                                    SkillAddtArg,
                                    ActionEffect);
script_50004(Skill, Self, _, _) -> err_ai(Skill, Self).

script_50005(Skill = #c_skill{skill =
                                  #skill{script_args = [Rate]}},
             Self = #fighter{id = Sid},
             Target = #fighter{id = Tid, buffs = Buffs},
             SkillAddtArg) ->
    case util:rand(1, 1000) =< Rate of
        true ->
            ClearBuff = [Buff
                         || Buff = #c_buff{can_dispel = 1, sec_type = control}
                                <- Buffs],
            lists:foreach(fun (Buff) ->
                                  combat_buff:buff_del(Tid, Sid, Buff)
                          end,
                          ClearBuff),
            combat_stat:update_dispel_num(Sid, ClearBuff);
        false -> skip
    end,
    ActionEffect = #action_effect{},
    combat_script_skill_calc:cast(attack,
                                  Skill,
                                  Self,
                                  Target,
                                  SkillAddtArg,
                                  ActionEffect);
script_50005(Skill, Self, _, _) -> err_ai(Skill, Self).

script_50006(Skill = #c_skill{skill =
                                  #skill{script_args = [Type]}},
             Self = #fighter{name = _Sname, group = Sgroup,
                             base_id = _BaseId, id = _Sid},
             Target = #fighter{}, SkillAddtArg) ->
    Flist = gen_args_50006(Type, Target),
    case combat_fighter:add_fighters(by_matching,
                                     Sgroup,
                                     Flist)
        of
        Summons = [_ | _] ->
            combat_script_skill_calc:cast(attack,
                                          Skill,
                                          Self,
                                          Target,
                                          SkillAddtArg,
                                          #action_effect{}),
            combat_play:add_sub_play(combat_play:gen_sub_summon_play(0,
                                                                     Self,
                                                                     Summons));
        _ -> ignore
    end;
script_50006(Skill, Self, _, _) -> err_ai(Skill, Self).

gen_args_50006(1, Target = #fighter{type = 1}) ->
    do_gen_args_50006([Target]);
gen_args_50006(2, #fighter{group = Tgroup}) ->
    L = combat_util:filter_fighter(combat_cache:all(Tgroup),
                                   [1]),
    do_gen_args_50006(L);
gen_args_50006(_Type, _) ->
    logger:error("克隆脚本出错:[~w]",
                 [_Type],
                 combat_script_skill,
                 3254),
    [].

do_gen_args_50006(L) -> do_gen_args_50006(L, []).

do_gen_args_50006([], FL) -> FL;
do_gen_args_50006([F | T], FL) ->
    case robot:fighter_clone(skill, F) of
        {true, NewF} -> do_gen_args_50006(T, [NewF | FL]);
        _ -> do_gen_args_50006(T, FL)
    end.

script_50007(Skill = #c_skill{skill =
                                  #skill{script_args = []}},
             Self = #fighter{id = Sid, buffs = Buffs}, Target,
             SkillAddtArg) ->
    ClearBuff = [Buff
                 || Buff = #c_buff{can_dispel = 1, sec_type = control}
                        <- Buffs],
    lists:foreach(fun (Buff) ->
                          combat_buff:buff_del(Sid, Sid, Buff)
                  end,
                  ClearBuff),
    combat_stat:update_dispel_num(Sid, ClearBuff),
    ActionEffect = #action_effect{},
    combat_script_skill_calc:cast(attack,
                                  Skill,
                                  Self,
                                  Target,
                                  SkillAddtArg,
                                  ActionEffect);
script_50007(Skill, Self, _, _) -> err_ai(Skill, Self).

script_50008(Skill = #c_skill{skill =
                                  #skill{script_args = [HealRatio]}},
             Self = #fighter{},
             Target = #fighter{hp = Hp, hp_max = HpMax},
             SkillAddtArg) ->
    AllHealHp = round((HpMax - Hp) * HealRatio / 1000),
    ActionEffect = #action_effect{heal_hp = AllHealHp,
                                  can_anti_heal = 1},
    combat_script_skill_calc:heal(Skill,
                                  Self,
                                  Target,
                                  SkillAddtArg,
                                  ActionEffect);
script_50008(Skill, Self, _, _) -> err_ai(Skill, Self).

script_50009(Skill, Self, Target, SkillAddtArg) ->
    combat_script_skill_calc:loss_coin(Skill,
                                       Self,
                                       Target,
                                       SkillAddtArg,
                                       #action_effect{}).

script_50010(Skill = #c_skill{skill =
                                  #skill{script_args = [HpRatio, HurtRatio]}},
             Self = #fighter{hp_max = SHpMax},
             Target = #fighter{hp_max = THpMax, type = TargetType},
             SkillAddtArg) ->
    Ratio = case lists:member(TargetType, [3, 6]) of
                true ->
                    case THpMax >= SHpMax * HpRatio / 1000 of
                        true -> HurtRatio;
                        false -> 0
                    end;
                false -> 0
            end,
    ActionEffect = #action_effect{act_dmg_ratio = Ratio},
    combat_script_skill_calc:attack(Skill,
                                    Self,
                                    Target,
                                    SkillAddtArg,
                                    ActionEffect);
script_50010(Skill, Self, _, _) -> err_ai(Skill, Self).

script_50011(Skill, Self, _, _) -> err_ai(Skill, Self).

script_50012(Skill = #c_skill{skill =
                                  #skill{script_args =
                                             [BuffId, HurtRatio, SuckRatio]}},
             Self = #fighter{id = Sid},
             Target = #fighter{id = Tid, buffs = Buffs},
             SkillAddtArg) ->
    BuffHurtRatio = case lists:keymember(BuffId,
                                         #c_buff.id,
                                         Buffs)
                        of
                        true ->
                            ClearBuff = [Buff
                                         || Buff = #c_buff{can_dispel = 1,
                                                           id = BuffId1}
                                                <- Buffs,
                                            BuffId1 =:= BuffId],
                            lists:foreach(fun (Buff) ->
                                                  combat_buff:buff_del(Tid,
                                                                       Sid,
                                                                       Buff)
                                          end,
                                          ClearBuff),
                            HurtRatio;
                        _ -> 0
                    end,
    ActionEffect = #action_effect{act_dmg_ratio =
                                      BuffHurtRatio,
                                  hit_ratio = 10000, suck_hp = SuckRatio},
    combat_script_skill_calc:attack(Skill,
                                    Self,
                                    Target,
                                    SkillAddtArg,
                                    ActionEffect);
script_50012(Skill, Self, _, _) -> err_ai(Skill, Self).

script_50013(Skill = #c_skill{skill =
                                  #skill{script_args = [SuckRatio]}},
             Self, Target, SkillAddtArg) ->
    ActionEffect = #action_effect{hit_ratio = 10000,
                                  suck_hp = SuckRatio},
    combat_script_skill_calc:attack(Skill,
                                    Self,
                                    Target,
                                    SkillAddtArg,
                                    ActionEffect);
script_50013(Skill, Self, _, _) -> err_ai(Skill, Self).

script_50014(Skill = #c_skill{skill =
                                  #skill{script_args = [AddAtk, MaxAtk]}},
             Self = #fighter{id = Sid, name = _Sname,
                             ext_args = ExtArgs},
             Target, SkillAddtArg) ->
    BaseAtk = combat_cache:get_ext_val(Self, 1, 0),
    NewAtk = min(MaxAtk, BaseAtk + AddAtk),
    NewExtArgs = combat_cache:set_ext_val(ExtArgs,
                                          1,
                                          NewAtk),
    combat_cache:u(Sid,
                   [{fighter_ext_args, 0, NewExtArgs}, {mp, 0, 1}]),
    campaign_snow:add_snow_atk_buff_val(Self, AddAtk),
    ActionEffect = #action_effect{},
    combat_script_skill_calc:cast(attack,
                                  Skill,
                                  Self,
                                  Target,
                                  SkillAddtArg,
                                  ActionEffect);
script_50014(Skill, Self, _, _) -> err_ai(Skill, Self).

script_50015(Skill = #c_skill{},
             Self = #fighter{id = Sid, ext_args = SelfExtArgs,
                             buffs = SelfBuffs},
             Target = #fighter{special_status =
                                   #special_status{is_stun = 1}},
             SkillAddtArg) ->
    ClearSelfBuff = [Buff
                     || Buff = #c_buff{sec_type = snow_atk} <- SelfBuffs],
    lists:foreach(fun (Buff) ->
                          combat_buff:buff_del(Sid, Sid, Buff)
                  end,
                  ClearSelfBuff),
    NewSelfExtArgs = combat_cache:set_ext_val(SelfExtArgs,
                                              1,
                                              0),
    combat_cache:u(Sid,
                   [{fighter_ext_args, 0, NewSelfExtArgs}]),
    ActionEffect = #action_effect{can_crit = 0,
                                  calc_def = 0, direct_dmg = 0,
                                  hit_ratio = 100000},
    combat_script_skill_calc:attack(Skill,
                                    Self,
                                    Target,
                                    SkillAddtArg,
                                    ActionEffect);
script_50015(Skill = #c_skill{skill =
                                  #skill{script_args = [_Dmg, LineVal]}},
             Self = #fighter{id = Sid, name = _Sname,
                             ext_args = SelfExtArgs, buffs = SelfBuffs},
             Target = #fighter{id = Tid, name = _Tname,
                               ext_args = TargetExtArgs, buffs = TargetBuffs,
                               action = Taction},
             SkillAddtArg) ->
    Atk = combat_cache:get_ext_val(Self, 1, 0),
    TAtk = combat_cache:get_ext_val(Target, 1, 0),
    Def = combat_cache:get_ext_val(Target, 2, 0),
    logger:debug("防御值:~w",
                 [Def],
                 combat_script_skill,
                 3357),
    Val = combat_cache:get_ext_val(Target, 3, 0),
    {DirectDmg, IsDefence, NewDef, NewVal, AtkVal} = case
                                                         Atk > Def
                                                         of
                                                         true ->
                                                             Atk1 = Atk - Def,
                                                             Def1 = 0,
                                                             Val1 = Val + Atk1,
                                                             {1,
                                                              0,
                                                              Def1,
                                                              Val1,
                                                              Atk1};
                                                         false ->
                                                             Def1 = Def - Atk,
                                                             Val1 = Val,
                                                             {0,
                                                              1,
                                                              Def1,
                                                              Val1,
                                                              0}
                                                     end,
    {IsFull, NewVal1} = case NewVal >= LineVal of
                            true -> {1, 0};
                            false -> {0, NewVal}
                        end,
    OneAfterOther = case Atk >= 2 andalso Def =:= 0 of
                        true -> 1;
                        false -> 0
                    end,
    SelfExtArgsOneAfterOther =
        combat_cache:set_ext_val(SelfExtArgs, 4, OneAfterOther),
    ClearSelfBuff = [Buff
                     || Buff = #c_buff{sec_type = snow_atk} <- SelfBuffs],
    lists:foreach(fun (Buff) ->
                          combat_buff:buff_del(Sid, Sid, Buff)
                  end,
                  ClearSelfBuff),
    NewSelfExtArgs =
        combat_cache:set_ext_val(SelfExtArgsOneAfterOther,
                                 1,
                                 0),
    combat_cache:u(Sid,
                   [{fighter_ext_args, 0, NewSelfExtArgs}]),
    case NewDef =< 0 of
        true ->
            ClearTargetBuff1 = [Buff
                                || Buff = #c_buff{sec_type = snow_def}
                                       <- TargetBuffs],
            lists:foreach(fun (Buff) ->
                                  combat_buff:buff_del(Tid, Tid, Buff)
                          end,
                          ClearTargetBuff1),
            ok;
        _ -> skip
    end,
    case IsFull of
        1 ->
            ClearTargetBuff2 = [Buff
                                || Buff = #c_buff{sec_type = SecType}
                                       <- TargetBuffs,
                                   SecType =:= snow_val orelse
                                       SecType =:= snow_atk],
            lists:foreach(fun (Buff) ->
                                  combat_buff:buff_del(Tid, Tid, Buff)
                          end,
                          ClearTargetBuff2),
            campaign_snow:add_snow_stun_buff(Self, Target),
            ok;
        _ ->
            case IsDefence of
                1 -> ok;
                _ ->
                    campaign_snow:add_snow_val_buff(Target, NewVal1, AtkVal)
            end
    end,
    TargetExtArgs1 = combat_cache:set_ext_val(TargetExtArgs,
                                              5,
                                              {0, 0}),
    NewTargetExtArgs =
        combat_cache:set_ext_val(TargetExtArgs1, 2, NewDef),
    NewTargetExtArgs1 =
        combat_cache:set_ext_val(NewTargetExtArgs, 3, NewVal1),
    {NewTargetExtArgs3, Tvc, Tc} = case IsFull of
                                       1 ->
                                           NewTargetExtArgs2 =
                                               combat_cache:set_ext_val(NewTargetExtArgs1,
                                                                        1,
                                                                        0),
                                           {NewTargetExtArgs2,
                                            [{mp, 0, 0}],
                                            [{1, -1, 0}]};
                                       _ ->
                                           case Taction of
                                               {#c_skill{skill =
                                                             #skill{script_id =
                                                                        50014}},
                                                _} ->
                                                   case TAtk > 0 of
                                                       true ->
                                                           add_50016_play(drop,
                                                                          Self,
                                                                          Target,
                                                                          Atk),
                                                           NewTAtk = TAtk - 1,
                                                           ClearTargetBuff3 =
                                                               [Buff
                                                                || Buff =
                                                                       #c_buff{sec_type
                                                                                   =
                                                                                   snow_atk}
                                                                       <- TargetBuffs],
                                                           lists:foreach(fun
                                                                             (Buff) ->
                                                                                 combat_buff:buff_del(Tid,
                                                                                                      Tid,
                                                                                                      Buff)
                                                                         end,
                                                                         ClearTargetBuff3),
                                                           case NewTAtk > 0 of
                                                               true ->
                                                                   NewTargetExtArgs2 =
                                                                       combat_cache:set_ext_val(NewTargetExtArgs1,
                                                                                                1,
                                                                                                NewTAtk),
                                                                   campaign_snow:add_snow_atk_buff_val(Target,
                                                                                                       NewTAtk),
                                                                   {NewTargetExtArgs2,
                                                                    [],
                                                                    []};
                                                               _ ->
                                                                   NewTargetExtArgs2 =
                                                                       combat_cache:set_ext_val(NewTargetExtArgs1,
                                                                                                1,
                                                                                                0),
                                                                   {NewTargetExtArgs2,
                                                                    [{mp,
                                                                      0,
                                                                      0}],
                                                                    [{1,
                                                                      -1,
                                                                      0}]}
                                                           end;
                                                       _ ->
                                                           add_50016_play(hurt,
                                                                          Self,
                                                                          Target,
                                                                          {AtkVal,
                                                                           Atk}),
                                                           {NewTargetExtArgs1,
                                                            [],
                                                            []}
                                                   end;
                                               _ ->
                                                   case IsDefence of
                                                       1 ->
                                                           add_50016_play(def,
                                                                          Self,
                                                                          Target,
                                                                          Atk);
                                                       _ ->
                                                           add_50016_play(hurt,
                                                                          Self,
                                                                          Target,
                                                                          {AtkVal,
                                                                           Atk})
                                                   end,
                                                   {NewTargetExtArgs1, [], []}
                                           end
                                   end,
    combat_cache:u(Tid,
                   [{fighter_ext_args, 0, NewTargetExtArgs3}]),
    case Def > 0 of
        true ->
            case combat_cache:get_ext_val(Target, 5, {0, 0}) of
                {FreeShielderId, RecyleSnowVal}
                    when FreeShielderId =/= 0 ->
                    case combat_cache:f(by_id, FreeShielderId) of
                        FreeShielder = #fighter{ext_args =
                                                    FreeShielderExtArgs} ->
                            FreeShielderSnowVal =
                                combat_cache:get_ext_val(FreeShielder, 1, 0),
                            SetVal = min(FreeShielderSnowVal + RecyleSnowVal,
                                         3),
                            NewFreeShielderExtArgs =
                                combat_cache:set_ext_val(FreeShielderExtArgs,
                                                         1,
                                                         SetVal),
                            combat_cache:u(FreeShielderId,
                                           [{fighter_ext_args,
                                             0,
                                             NewFreeShielderExtArgs},
                                            {mp, 0, 1}]),
                            AddSnowVal = SetVal - FreeShielderSnowVal,
                            campaign_snow:add_snow_atk_buff(FreeShielder,
                                                            AddSnowVal);
                        _Err ->
                            logger:debug("查询施加者失败:~w",
                                         [_Err],
                                         combat_script_skill,
                                         3479),
                            ok
                    end;
                _ -> ok
            end;
        _ -> ok
    end,
    ActionEffect = #action_effect{can_crit = 0,
                                  calc_def = 0, direct_dmg = DirectDmg,
                                  hit_ratio = 100000, target_val_changes = Tvc,
                                  target_changes = Tc},
    combat_script_skill_calc:attack(Skill,
                                    Self,
                                    Target,
                                    SkillAddtArg,
                                    ActionEffect);
script_50015(Skill, Self, _, _) -> err_ai(Skill, Self).

script_50016(Skill, Self, _, _) -> err_ai(Skill, Self).

add_50016_play(drop, Self = #fighter{name = Sname},
               Target = #fighter{name = Tname}, Atk) ->
    BallName = get_50016_ball_name(Atk),
    ActionMsg =
        notice:format(lang:get("~ts丢了一个~ts，打坏了~ts刚做的雪球！"),
                      [{role_2, Sname},
                       {string_2, 5, BallName},
                       {role_2, Tname}]),
    ActionSkill = combat_script_skill:to_combat_skill({1005,
                                                       1}),
    ActionSkill1 = ActionSkill#c_skill{action_msg =
                                           ActionMsg},
    Play = combat_play:gen_sub_skill_play(special_wait,
                                          {Self, Target, ActionSkill1, [], []}),
    combat_play:add_sub_play(Play),
    ok;
add_50016_play(def, Self = #fighter{name = Sname},
               Target = #fighter{name = Tname}, Atk) ->
    BallName = get_50016_ball_name(Atk),
    ActionMsg =
        notice:format(lang:get("~ts丢了一个~ts，被~ts狡猾的~ts了！"),
                      [{role_2, Sname},
                       {string_2, 5, BallName},
                       {role_2, Tname},
                       {string_2, 5, lang:get("格挡")}]),
    ActionSkill = combat_script_skill:to_combat_skill({1005,
                                                       1}),
    ActionSkill1 = ActionSkill#c_skill{action_msg =
                                           ActionMsg},
    Play = combat_play:gen_sub_skill_play(special_wait,
                                          {Self, Target, ActionSkill1, [], []}),
    combat_play:add_sub_play(Play),
    ok;
add_50016_play(hurt, Self = #fighter{name = Sname},
               Target = #fighter{name = Tname}, {Hurt, Atk}) ->
    BallName = get_50016_ball_name(Atk),
    ActionMsg =
        notice:format(lang:get("~ts丢了一个~ts，使~ts多了~ts层~ts"),
                      [{role_2, Sname},
                       {string_2, 5, BallName},
                       {role_2, Tname},
                       {string_2, 5, Hurt},
                       {string_2, 5, lang:get("冰冻")}]),
    ActionSkill = combat_script_skill:to_combat_skill({1005,
                                                       1}),
    ActionSkill1 = ActionSkill#c_skill{action_msg =
                                           ActionMsg},
    Play = combat_play:gen_sub_skill_play(special_wait,
                                          {Self, Target, ActionSkill1, [], []}),
    combat_play:add_sub_play(Play),
    ok.

get_50016_ball_name(1) -> lang:get("小雪球");
get_50016_ball_name(2) -> lang:get("大雪球");
get_50016_ball_name(_) -> lang:get("巨大雪球").

script_50017(Skill = #c_skill{skill =
                                  S = #skill{buff_target = BuffTarget}},
             Self, Target, SkillAddtArg) ->
    lists:foreach(fun (Buff) ->
                          combat_buff:buff_add(Buff, Self, Target, true)
                  end,
                  BuffTarget),
    lists:foreach(fun (Buff) ->
                          combat_buff:buff_add(Buff, Target, Self, true)
                  end,
                  BuffTarget),
    NewSkill = Skill#c_skill{skill =
                                 S#skill{buff_target = []}},
    ActionEffect = #action_effect{},
    combat_script_skill_calc:cast(attack,
                                  NewSkill,
                                  Self,
                                  Target,
                                  SkillAddtArg,
                                  ActionEffect);
script_50017(Skill, Self, _, _) -> err_ai(Skill, Self).

script_50018(Skill = #c_skill{skill = #skill{}}, Self,
             Target, SkillAddtArg) ->
    ActionEffect = #action_effect{},
    combat_script_skill_calc:attack(Skill,
                                    Self,
                                    Target,
                                    SkillAddtArg,
                                    ActionEffect),
    script_50018_end(Skill, Self, Target);
script_50018(Skill, Self, _, _) -> err_ai(Skill, Self).

script_50018_end(Skill = #c_skill{skill =
                                      #skill{script_args =
                                                 [BaseRatio,
                                                  CastSkillId,
                                                  BuffId,
                                                  Ratio]}},
                 #fighter{id = Sid, buffs = Buffs}, #fighter{}) ->
    Flag = case combat_cache:f(by_id, Sid) of
               #fighter{is_die = 0} ->
                   AddRatio = case lists:keyfind(BuffId, #c_buff.id, Buffs)
                                  of
                                  Buff = #c_buff{layer = Layer} ->
                                      combat_buff:buff_del(Sid, Sid, Buff),
                                      Layer * Ratio;
                                  _ -> 0
                              end,
                   AllRatio = BaseRatio + AddRatio,
                   case util:rand(1, 1000) =< AllRatio of
                       true ->
                           Cs =
                               combat_script_skill:to_combat_skill({CastSkillId,
                                                                    1}),
                           {true, Cs, 1};
                       _ -> false
                   end;
               _ -> false
           end,
    case Flag of
        {true, GetCs, AttackTimes} ->
            combat_skill:add_skill_cooldown(Sid, Skill),
            combat_cache:save_context([{#combat_context.passive_attack,
                                        [{0, AttackTimes, GetCs}]}]),
            ok;
        false -> skip
    end.

script_50019(Skill = #c_skill{skill =
                                  #skill{script_args = [SuckRatio]}},
             Self, Target, SkillAddtArg) ->
    ActionEffect = #action_effect{suck_hp = SuckRatio},
    combat_script_skill_calc:attack(Skill,
                                    Self,
                                    Target,
                                    SkillAddtArg,
                                    ActionEffect);
script_50019(Skill, Self, _, _) -> err_ai(Skill, Self).

script_50020(Skill = #c_skill{skill =
                                  S = #skill{buff_target = BuffTarget}},
             Self = #fighter{group = Sgroup},
             Target = #fighter{group = Tgroup}, SkillAddtArg) ->
    NewBuffTarget = case BuffTarget of
                        [Buff1, Buff2] ->
                            case Sgroup =:= Tgroup of
                                true -> [Buff1];
                                _ -> [Buff2]
                            end;
                        _ -> []
                    end,
    NewSkill = Skill#c_skill{skill =
                                 S#skill{buff_target = NewBuffTarget}},
    ActionEffect = #action_effect{},
    combat_script_skill_calc:cast(attack,
                                  NewSkill,
                                  Self,
                                  Target,
                                  SkillAddtArg,
                                  ActionEffect);
script_50020(Skill, Self, _, _) -> err_ai(Skill, Self).

script_50021(Skill = #c_skill{skill =
                                  #skill{script_args = [Type]}},
             Self = #fighter{id = Sid},
             Target = #fighter{id = Tid, buffs = Buffs},
             SkillAddtArg) ->
    ClearBuffs = case Type of
                     1 ->
                         [Buff
                          || Buff = #c_buff{can_dispel = 1, eff_type = buff}
                                 <- Buffs];
                     2 ->
                         [Buff
                          || Buff = #c_buff{can_dispel = 1, eff_type = debuff}
                                 <- Buffs];
                     3 ->
                         [Buff
                          || Buff = #c_buff{can_dispel = 1, eff_type = debuff,
                                            sec_type = SecType}
                                 <- Buffs,
                             SecType =/= control];
                     4 ->
                         [Buff
                          || Buff = #c_buff{can_dispel = 1, sec_type = control}
                                 <- Buffs];
                     _ -> []
                 end,
    ClearBuff = case ClearBuffs of
                    [_ | _] -> [util:rand_list(ClearBuffs)];
                    _ -> []
                end,
    lists:foreach(fun (Buff) ->
                          combat_buff:buff_del(Tid, Sid, Buff)
                  end,
                  ClearBuff),
    combat_stat:update_dispel_num(Sid, [ClearBuff]),
    combat_pet:dispel_pet(ClearBuff, Skill, Self, Target),
    ActionEffect = #action_effect{},
    combat_script_skill_calc:cast(attack,
                                  Skill,
                                  Self,
                                  Target,
                                  SkillAddtArg,
                                  ActionEffect);
script_50021(Skill, Self, _, _) -> err_ai(Skill, Self).

script_50022(Skill, Self,
             Target = #fighter{type = Ttype}, SkillAddtArg) ->
    case lists:member(Ttype, [6, 3]) of
        true ->
            ActionEffect = #action_effect{},
            combat_script_skill_calc:cast(attack,
                                          Skill,
                                          Self,
                                          Target,
                                          SkillAddtArg,
                                          ActionEffect);
        _ -> ok
    end;
script_50022(Skill, Self, _, _) -> err_ai(Skill, Self).

script_50023(Skill = #c_skill{}, Self,
             Target = #fighter{id = Tid, ext_args = TargetExtArgs,
                               special_status = #special_status{is_stun = 1}},
             SkillAddtArg) ->
    campaign_snow:remove_snow_stun_buff(Target),
    NewVal = 1,
    NewTargetExtArgs =
        combat_cache:set_ext_val(TargetExtArgs, 3, NewVal),
    combat_cache:u(Tid,
                   [{fighter_ext_args, 0, NewTargetExtArgs}]),
    campaign_snow:add_snow_val_buff(Target, NewVal, NewVal),
    campaign_snow:remove_snow_stun_buff(Target),
    ActionEffect = #action_effect{can_crit = 0,
                                  calc_def = 0, hit_ratio = 100000,
                                  target_val_changes = [], target_changes = []},
    combat_script_skill_calc:cast(attack,
                                  Skill,
                                  Self,
                                  Target,
                                  SkillAddtArg,
                                  ActionEffect);
script_50023(Skill = #c_skill{skill =
                                  #skill{script_args = [CostVal]}},
             Self,
             Target = #fighter{id = Tid, ext_args = TargetExtArgs,
                               buffs = TargetBuffs},
             SkillAddtArg) ->
    Val = combat_cache:get_ext_val(Target, 3, 0),
    NewVal = max(Val - CostVal, 0),
    logger:debug("目标雪球层数:~w",
                 [{Val, NewVal}],
                 combat_script_skill,
                 3658),
    NewTargetExtArgs =
        combat_cache:set_ext_val(TargetExtArgs, 3, NewVal),
    combat_cache:u(Tid,
                   [{fighter_ext_args, 0, NewTargetExtArgs}]),
    case NewVal > 0 of
        true ->
            ClearTargetBuff = [Buff
                               || Buff = #c_buff{sec_type = SecType}
                                      <- TargetBuffs,
                                  SecType =:= snow_val],
            lists:foreach(fun (Buff) ->
                                  combat_buff:buff_del(Tid, Tid, Buff)
                          end,
                          ClearTargetBuff),
            campaign_snow:add_snow_val_buff(Target, NewVal, NewVal);
        false ->
            ClearTargetBuff = [Buff
                               || Buff = #c_buff{sec_type = SecType}
                                      <- TargetBuffs,
                                  SecType =:= snow_val],
            lists:foreach(fun (Buff) ->
                                  combat_buff:buff_del(Tid, Tid, Buff)
                          end,
                          ClearTargetBuff)
    end,
    campaign_snow:remove_snow_stun_buff(Target),
    ActionEffect = #action_effect{can_crit = 0,
                                  calc_def = 0, hit_ratio = 100000,
                                  target_val_changes = [], target_changes = []},
    combat_script_skill_calc:cast(attack,
                                  Skill,
                                  Self,
                                  Target,
                                  SkillAddtArg,
                                  ActionEffect).

script_50024(Skill = #c_skill{},
             Self = #fighter{id = Sid, ext_args = SelfExtArgs,
                             buffs = SelfBuffs},
             Target = #fighter{special_status =
                                   #special_status{is_stun = 1}},
             SkillAddtArg) ->
    ClearSelfBuff = [Buff
                     || Buff = #c_buff{sec_type = snow_atk} <- SelfBuffs],
    lists:foreach(fun (Buff) ->
                          combat_buff:buff_del(Sid, Sid, Buff)
                  end,
                  ClearSelfBuff),
    NewSelfExtArgs = combat_cache:set_ext_val(SelfExtArgs,
                                              1,
                                              0),
    combat_cache:u(Sid,
                   [{fighter_ext_args, 0, NewSelfExtArgs}]),
    ActionEffect = #action_effect{can_crit = 0,
                                  calc_def = 0, direct_dmg = 0,
                                  hit_ratio = 100000},
    combat_script_skill_calc:attack(Skill,
                                    Self,
                                    Target,
                                    SkillAddtArg,
                                    ActionEffect);
script_50024(Skill = #c_skill{skill =
                                  DoSkill = #skill{script_args = [Atk],
                                                   buff_target = BuffTarget}},
             Self = #fighter{name = _Sname},
             Target = #fighter{id = Tid, name = _Tname,
                               ext_args = TargetExtArgs, buffs = TargetBuffs,
                               action = Taction},
             SkillAddtArg) ->
    Def = combat_cache:get_ext_val(Target, 2, 0),
    Val = combat_cache:get_ext_val(Target, 3, 0),
    logger:debug("目标防御值:~w",
                 [Def],
                 combat_script_skill,
                 3693),
    {DirectDmg, IsDefence, NewVal} = case Def > 0 of
                                         false ->
                                             Val1 = Val + Atk,
                                             {1, 0, Val1};
                                         true -> {0, 1, Val}
                                     end,
    {IsFull, NewVal1} = case NewVal >= 3 of
                            true -> {1, 0};
                            false -> {0, NewVal}
                        end,
    ClearTargetBuff1 = [Buff
                        || Buff = #c_buff{sec_type = snow_def} <- TargetBuffs],
    lists:foreach(fun (Buff) ->
                          combat_buff:buff_del(Tid, Tid, Buff)
                  end,
                  ClearTargetBuff1),
    case IsFull of
        1 ->
            ClearTargetBuff2 = [Buff
                                || Buff = #c_buff{sec_type = SecType}
                                       <- TargetBuffs,
                                   SecType =:= snow_val orelse
                                       SecType =:= snow_atk],
            lists:foreach(fun (Buff) ->
                                  combat_buff:buff_del(Tid, Tid, Buff)
                          end,
                          ClearTargetBuff2),
            campaign_snow:add_snow_stun_buff(Self, Target),
            ok;
        _ ->
            case IsDefence of
                1 -> ok;
                _ ->
                    campaign_snow:add_snow_val_buff(Target, NewVal1, Atk)
            end
    end,
    TargetExtArgs1 = combat_cache:set_ext_val(TargetExtArgs,
                                              5,
                                              {0, 0}),
    SetSnowValTargetExtArgs =
        combat_cache:set_ext_val(TargetExtArgs1, 3, NewVal1),
    NewTargetExtArgs1 =
        combat_cache:set_ext_val(SetSnowValTargetExtArgs, 2, 0),
    {NewTargetExtArgs3, Tvc, Tc} = case IsFull of
                                       1 ->
                                           NewTargetExtArgs2 =
                                               combat_cache:set_ext_val(NewTargetExtArgs1,
                                                                        1,
                                                                        0),
                                           {NewTargetExtArgs2,
                                            [{mp, 0, 0}],
                                            [{1, -1, 0}]};
                                       _ ->
                                           case Taction of
                                               {#c_skill{skill =
                                                             #skill{script_id =
                                                                        50014}},
                                                _} ->
                                                   add_50016_play(hurt,
                                                                  Self,
                                                                  Target,
                                                                  {Atk, Atk}),
                                                   {NewTargetExtArgs1, [], []};
                                               _ ->
                                                   case IsDefence of
                                                       1 ->
                                                           add_50016_play(def,
                                                                          Self,
                                                                          Target,
                                                                          Atk);
                                                       _ ->
                                                           add_50016_play(hurt,
                                                                          Self,
                                                                          Target,
                                                                          {Atk,
                                                                           Atk})
                                                   end,
                                                   {NewTargetExtArgs1, [], []}
                                           end
                                   end,
    NewSkill = case IsDefence of
                   0 ->
                       Skill#c_skill{skill =
                                         DoSkill#skill{buff_target =
                                                           BuffTarget}};
                   _ -> Skill
               end,
    combat_cache:u(Tid,
                   [{fighter_ext_args, 0, NewTargetExtArgs3}]),
    case Def > 0 of
        true ->
            case combat_cache:get_ext_val(Target, 5, {0, 0}) of
                {FreeShielderId, RecyleSnowVal}
                    when FreeShielderId =/= 0 ->
                    case combat_cache:f(by_id, FreeShielderId) of
                        FreeShielder = #fighter{ext_args =
                                                    FreeShielderExtArgs} ->
                            FreeShielderSnowVal =
                                combat_cache:get_ext_val(FreeShielder, 1, 0),
                            SetVal = min(FreeShielderSnowVal + RecyleSnowVal,
                                         3),
                            NewFreeShielderExtArgs =
                                combat_cache:set_ext_val(FreeShielderExtArgs,
                                                         1,
                                                         SetVal),
                            combat_cache:u(FreeShielderId,
                                           [{fighter_ext_args,
                                             0,
                                             NewFreeShielderExtArgs},
                                            {mp, 0, 1}]),
                            AddSnowVal = SetVal - FreeShielderSnowVal,
                            campaign_snow:add_snow_atk_buff(FreeShielder,
                                                            AddSnowVal);
                        _Err ->
                            logger:debug("查询施加者失败:~w",
                                         [_Err],
                                         combat_script_skill,
                                         3777),
                            ok
                    end;
                _ -> ok
            end;
        _ -> ok
    end,
    ActionEffect = #action_effect{can_crit = 0,
                                  calc_def = 0, direct_dmg = DirectDmg,
                                  hit_ratio = 100000, target_val_changes = Tvc,
                                  target_changes = Tc},
    combat_script_skill_calc:attack(NewSkill,
                                    Self,
                                    Target,
                                    SkillAddtArg,
                                    ActionEffect);
script_50024(Skill, Self, _, _) -> err_ai(Skill, Self).

script_50025(Skill = #c_skill{skill =
                                  #skill{script_args = [RecyleSnowVal]}},
             Self = #fighter{id = Sid},
             Target = #fighter{id = Tid, ext_args = TargetExtArgs},
             SkillAddtArg) ->
    NewTargetExtArgs =
        combat_cache:set_ext_val(TargetExtArgs,
                                 5,
                                 {Sid, RecyleSnowVal}),
    combat_cache:u(Tid,
                   [{fighter_ext_args, 0, NewTargetExtArgs}]),
    ActionEffect = #action_effect{},
    combat_script_skill_calc:cast(attack,
                                  Skill,
                                  Self,
                                  Target,
                                  SkillAddtArg,
                                  ActionEffect);
script_50025(Skill, Self, _, _) -> err_ai(Skill, Self).

script_50026(Skill = #c_skill{skill =
                                  #skill{script_args = [CritSuckRatio]}},
             Self = #fighter{id = Fid, hp = Hp, hp_max = HpMax,
                             passive_skills = PassiveSkills},
             Target, SkillAddtArg) ->
    Ae = case combat_skill:is_skill_in_cooldown(Fid, Skill)
             of
             false ->
                 case combat_cache:f(by_script_id, PassiveSkills, 60186)
                     of
                     #c_skill{skill =
                                  #skill{script_args =
                                             [Base1, Base2, Base3]}} ->
                         V1 = Hp / HpMax * 100,
                         DmgRatio = if V1 =< 20 -> Base3;
                                       V1 =< 50 -> Base2;
                                       true -> Base1
                                    end,
                         #action_effect{crit_suck_hp =
                                            CritSuckRatio + DmgRatio};
                     _ -> #action_effect{crit_suck_hp = CritSuckRatio}
                 end;
             _ -> #action_effect{}
         end,
    combat_script_skill_calc:attack(Skill,
                                    Self,
                                    Target,
                                    SkillAddtArg,
                                    Ae);
script_50026(Skill, Self, _, _) -> err_ai(Skill, Self).

script_50027(Skill = #c_skill{skill =
                                  #skill{script_args = [AddAnger]}},
             Self = #fighter{}, Target = #fighter{},
             SkillAddtArg = #c_skill_addt_arg{target_val_changed =
                                                  Tvc,
                                              target_changed = Tc}) ->
    AddTvc = [{anger, 1, AddAnger}],
    AddTc = [{9, AddAnger, 0}],
    Tvc1 = AddTvc ++ Tvc,
    Tc1 = AddTc ++ Tc,
    SkillAddtArg1 =
        SkillAddtArg#c_skill_addt_arg{target_val_changed = Tvc1,
                                      target_changed = Tc1},
    ActionEffect = #action_effect{},
    combat_script_skill_calc:cast(attack,
                                  Skill,
                                  Self,
                                  Target,
                                  SkillAddtArg1,
                                  ActionEffect);
script_50027(Skill, Self, _, _) -> err_ai(Skill, Self).

script_50028(Skill, Self, _, _) -> err_ai(Skill, Self).

script_50029(Skill = #c_skill{skill =
                                  S = #skill{buff_target = BuffTarget}},
             Self = #fighter{name = _Sname, pos = MasterPos,
                             lev = Lev, group = Sgroup},
             Target, SkillAddtArg) ->
    SummonUnitId = gen_args_50029(Lev),
    NewPos = if MasterPos =:= 1 -> 8;
                MasterPos =:= 2 -> 7;
                MasterPos =:= 3 -> 9;
                MasterPos =:= 4 -> 6;
                true -> 10
             end,
    case combat_fighter:add_fighters(by_summon,
                                     Sgroup,
                                     [{NewPos, SummonUnitId}])
        of
        Summons = [_ | _] ->
            {NewSummons, _AddFs} = case BuffTarget of
                                       [_ | _] ->
                                           case util:rand_list(Summons) of
                                               Fighter = #fighter{id = Fid} ->
                                                   lists:foreach(fun (Buff) ->
                                                                         combat_buff:buff_add(Buff,
                                                                                              Self,
                                                                                              Fighter,
                                                                                              false)
                                                                 end,
                                                                 BuffTarget),
                                                   NewFighter =
                                                       combat_cache:f(by_id,
                                                                      Fid),
                                                   BuffInfos =
                                                       combat_buff:gen_buff_infos(NewFighter),
                                                   NewFighter1 =
                                                       NewFighter#fighter{buff_infos
                                                                              =
                                                                              BuffInfos},
                                                   combat_cache:u(NewFighter1),
                                                   {lists:keystore(Fid,
                                                                   #fighter.id,
                                                                   Summons,
                                                                   NewFighter1),
                                                    [NewFighter1]};
                                               _ -> {Summons, []}
                                           end;
                                       _ -> {Summons, []}
                                   end,
            combat_script_skill_calc:cast(attack,
                                          Skill#c_skill{skill =
                                                            S#skill{buff_target
                                                                        = []}},
                                          Self,
                                          Target,
                                          SkillAddtArg,
                                          #action_effect{}),
            combat_play:add_sub_play(combat_play:gen_sub_summon_play(0,
                                                                     Self,
                                                                     NewSummons)),
            [combat_fighter:unit_talk(AddF, 1) || AddF <- Summons],
            ok;
        _ -> ignore
    end;
script_50029(Skill, Self, _, _) -> err_ai(Skill, Self).

gen_args_50029(Lev) ->
    PetSlave = case stars_trial_data:get_pet_slave(Lev) of
                   [] ->
                       Lev1 = round(Lev / 5) * 5,
                       logger:debug("平均等级:~w",
                                    [Lev1],
                                    combat_script_skill,
                                    3886),
                       case stars_trial_data:get_pet_slave(Lev1) of
                           [] ->
                               Lev2 = round(Lev / 5) * 5 + 5,
                               logger:debug("平均等级:~w",
                                            [Lev2],
                                            combat_script_skill,
                                            3890),
                               case stars_trial_data:get_pet_slave(Lev2) of
                                   [] -> [];
                                   _PetSlave2 -> _PetSlave2
                               end;
                           _PetSlave1 -> _PetSlave1
                       end;
                   _PetSlave -> _PetSlave
               end,
    util:rand_list(PetSlave).

script_60000(Skill = #c_skill{id = SkillId,
                              skill =
                                  #skill{script_args = [Rate],
                                         buff_self = BuffSelf,
                                         buff_target = BuffTarget}},
             _Self = #fighter{id = Fid}, _Target, _SkillAddtArg) ->
    case combat_skill:is_skill_in_cooldown(Fid, Skill) of
        false ->
            case util:rand(1, 1000) =< Rate of
                false -> #passive_effect{};
                true ->
                    NewBuffTarget = case length(BuffTarget) >= 1 of
                                        true -> lists:nth(1, BuffTarget);
                                        false -> []
                                    end,
                    combat_skill:add_skill_cooldown(Fid, Skill),
                    #passive_effect{buff_self_to_self = BuffSelf,
                                    buff_self_to_target = NewBuffTarget,
                                    show_passive_skills = [{Fid, SkillId, 1}]}
            end;
        true -> #passive_effect{}
    end;
script_60000(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 3924),
    #passive_effect{}.

script_60001(Skill = #c_skill{id = SkillId,
                              skill =
                                  #skill{script_args =
                                             [Rate,
                                              Rate2,
                                              ReduceDmg1,
                                              ReduceDmg2]}},
             Self = #fighter{id = Fid, name = _Name, action = Action,
                             buffs = Buffs,
                             special_attr =
                                 #special_attr{has_multi_atk = HasMultiAtk}},
             Target = #fighter{is_die = IsDie}, _SkillAddtArg) ->
    logger:debug("~w", [Rate], combat_script_skill, 3929),
    AddRate = case lists:keyfind(163000,
                                 #c_buff.script_id,
                                 Buffs)
                  of
                  Buff = #c_buff{args = [_AddRatio]} ->
                      combat_buff:buff_del(Fid, Fid, Buff),
                      _AddRatio;
                  _ -> 0
              end,
    Flag = case IsDie =:= 0 andalso HasMultiAtk =:= 0 of
               true ->
                   case Action of
                       {Cs = #c_skill{id = UseId, skill = UseSkill,
                                      ext_args = OldExtArgs},
                        _} ->
                           case combat_skill:base_skill(Self) of
                               UseId ->
                                   case combat_skill:is_skill_in_cooldown(Fid,
                                                                          Skill)
                                       of
                                       false ->
                                           case util:rand(1, 1000) =<
                                                    Rate + AddRate
                                               of
                                               true ->
                                                   {DmgAddt, ShowPassive} =
                                                       calc_continue_dmg_attr(Self,
                                                                              Target),
                                                   NewCs = Cs#c_skill{skill =
                                                                          UseSkill#skill{dmg_ratio
                                                                                             =
                                                                                             [ReduceDmg1,
                                                                                              ReduceDmg2],
                                                                                         dmg_addt
                                                                                             =
                                                                                             DmgAddt},
                                                                      ext_args =
                                                                          [{passive_attack_type,
                                                                            phy}
                                                                           | OldExtArgs]},
                                                   case util:rand(1, 1000) =<
                                                            Rate2
                                                       of
                                                       true ->
                                                           {true,
                                                            NewCs,
                                                            2,
                                                            ShowPassive};
                                                       false ->
                                                           {true,
                                                            NewCs,
                                                            1,
                                                            ShowPassive}
                                                   end;
                                               false -> false
                                           end;
                                       true -> false
                                   end;
                               _ -> false
                           end;
                       _ -> false
                   end;
               _ -> false
           end,
    case Flag of
        {true, GetCs, AttackTimes, ShowPassives} ->
            combat_skill:add_skill_cooldown(Fid, Skill, 1),
            combat_cache:save_context([{#combat_context.passive_attack,
                                        [{0, AttackTimes, GetCs}]}]),
            #passive_effect{show_passive_skills =
                                [{Fid, SkillId, 2} | ShowPassives]};
        false -> #passive_effect{}
    end;
script_60001(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 3982),
    #passive_effect{}.

calc_continue_dmg_attr(_Self = #fighter{id = Fid,
                                        lev = Lev,
                                        passive_skills = SelfPassiveSkills},
                       _Target = #fighter{passive_skills =
                                              TargetPassiveSkills}) ->
    case combat_cache:f(by_script_id,
                        SelfPassiveSkills,
                        60181)
        of
        #c_skill{skill =
                     #skill{script_args = [Ratio, Skills]}} ->
            Val = round(Lev * Ratio / 10),
            logger:debug("===========================~w",
                         [Val],
                         combat_script_skill,
                         3989),
            case [1
                  || #c_skill{skill = #skill{id = SkillId}}
                         <- TargetPassiveSkills,
                     lists:member(SkillId, Skills)]
                of
                [_ | _] -> {Val * 2, [{Fid, 65221, 1}]};
                _ -> {Val, []}
            end;
        _ -> {0, []}
    end.

script_60002(Skill = #c_skill{id = SkillId,
                              skill =
                                  #skill{script_args =
                                             [Rate, SkillIds, ReduceDmg]}},
             Self = #fighter{id = Fid, name = _Name, action = Action,
                             group = Sgroup, passive_skills = PassiveSkills},
             Target, _SkillAddtArg) ->
    logger:debug("============",
                 [],
                 combat_script_skill,
                 4000),
    Flag = case combat_util:get_not_die(Fid,
                                        combat_cache:op(Sgroup),
                                        [],
                                        [{is_stealth, 0}])
               of
               undefined -> false;
               _ ->
                   case Action of
                       {Cs = #c_skill{id = ASkillId, ext_args = OldExtArgs},
                        _} ->
                           logger:debug("====技能参数===:~w",
                                        [Cs],
                                        combat_script_skill,
                                        4008),
                           case lists:member(ASkillId, SkillIds) of
                               true ->
                                   case combat_skill:is_skill_in_cooldown(Fid,
                                                                          Skill)
                                       of
                                       false ->
                                           case util:rand(1, 1000) =< Rate of
                                               true ->
                                                   AttackCs =
                                                       Cs#c_skill{ext_args =
                                                                      [{passive_attack_type,
                                                                        magic}
                                                                       | OldExtArgs]},
                                                   {true, AttackCs};
                                               false -> fail_rand
                                           end;
                                       _ -> false
                                   end;
                               _ -> false
                           end;
                       _ -> false
                   end
           end,
    case Flag of
        {true, GetCs = #c_skill{skill = _ContinueSkill}} ->
            ReduceDmg1 = case combat_cache:f(by_script_id,
                                             PassiveSkills,
                                             60178)
                             of
                             #c_skill{skill =
                                          #skill{script_args =
                                                     [ReduceDmgRatio,
                                                      AddDmg]}} ->
                                 case util:rand(1, 1000) =< ReduceDmgRatio of
                                     true -> ReduceDmg + AddDmg;
                                     _ -> ReduceDmg
                                 end;
                             _ -> ReduceDmg
                         end,
            logger:debug("法连伤害率:~w",
                         [ReduceDmg1],
                         combat_script_skill,
                         4037),
            NewGetCs = #c_skill{skill =
                                    NS = #skill{dmg_addt = DmgAddt}} =
                           combat_skill:passive_to_variety_skill(Self,
                                                                 GetCs,
                                                                 ReduceDmg1),
            {CalcDmgAddt, ShowPassive} =
                calc_skill_continue_dmg_attr(Self, Target),
            NewCs = NewGetCs#c_skill{skill =
                                         NS#skill{dmg_addt =
                                                      DmgAddt + CalcDmgAddt}},
            logger:debug("技能参数:~w",
                         [NewCs],
                         combat_script_skill,
                         4041),
            combat_skill:add_skill_cooldown(Fid, Skill, 1),
            [PassiveAttacks] =
                combat_cache:get_context_elem([#combat_context.passive_attack]),
            combat_cache:save_context([{#combat_context.passive_attack,
                                        [{1, 1, NewCs} | PassiveAttacks]}]),
            #passive_effect{show_passive_skills =
                                [{Fid, SkillId, 2} | ShowPassive]};
        fail_rand ->
            combat_skill:add_skill_cooldown(Fid, Skill, 1),
            #passive_effect{};
        false -> #passive_effect{}
    end;
script_60002(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 4053),
    #passive_effect{}.

calc_skill_continue_dmg_attr(_Self = #fighter{id = Fid,
                                              lev = Lev,
                                              passive_skills =
                                                  SelfPassiveSkills},
                             _Target = #fighter{passive_skills =
                                                    TargetPassiveSkills}) ->
    case combat_cache:f(by_script_id,
                        SelfPassiveSkills,
                        60182)
        of
        #c_skill{skill =
                     #skill{script_args = [Ratio, Skills]}} ->
            Val = round(Lev * Ratio / 10),
            case [1
                  || #c_skill{skill = #skill{id = SkillId}}
                         <- TargetPassiveSkills,
                     lists:member(SkillId, Skills)]
                of
                [_ | _] -> {Val * 2, [{Fid, 65311, 1}]};
                _ -> {Val, []}
            end;
        _ -> {0, []}
    end.

script_60003(#c_skill{skill =
                          #skill{script_args = [Ratio1, Ratio2]}},
             #fighter{action = Action}, _Target, _SkillAddtArg) ->
    case Action of
        {#c_skill{skill = #skill{elem_type = 1}}, _} ->
            Ratio = util:rand(Ratio1, Ratio2),
            #passive_effect{float_dmg = Ratio};
        _ -> #passive_effect{}
    end;
script_60003(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 4078),
    #passive_effect{}.

script_60004(#c_skill{skill =
                          #skill{script_args = [Ratio]}},
             #fighter{action = Action}, _Target, _SkillAddtArg) ->
    case Action of
        {#c_skill{skill = #skill{elem_type = 0}}, _} ->
            #passive_effect{crit_ratio = Ratio};
        _ -> #passive_effect{}
    end;
script_60004(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 4090),
    #passive_effect{}.

script_60005(#c_skill{skill =
                          #skill{script_args = [Ratio]}},
             #fighter{action = Action}, _Target, _SkillAddtArg) ->
    case Action of
        {#c_skill{skill = #skill{elem_type = 1}}, _} ->
            #passive_effect{crit_ratio = Ratio};
        _ -> #passive_effect{}
    end;
script_60005(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 4102),
    #passive_effect{}.

script_60006(#c_skill{id = SkillId,
                      skill = #skill{script_args = [Rate, Ratio]}},
             _Self = #fighter{id = Fid, action = Action}, _Target,
             _SkillAddtArg) ->
    case Action of
        {#c_skill{skill =
                      #skill{elem_type = 0, attack_type = 0}},
         _} ->
            case util:rand(1, 1000) =< Rate of
                false -> #passive_effect{};
                true ->
                    #passive_effect{suck_hp = Ratio,
                                    show_passive_skills = [{Fid, SkillId, 1}]}
            end;
        _ -> #passive_effect{}
    end;
script_60006(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 4117),
    #passive_effect{}.

script_60007(#c_skill{skill =
                          #skill{script_args = [Ratio]}},
             _Self, _Target, _SkillAddtArg) ->
    #passive_effect{crit_ratio = -Ratio};
script_60007(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 4124),
    #passive_effect{}.

script_60008(#c_skill{skill =
                          #skill{script_args = [BaseRatio, Ratio]}},
             #fighter{hp = Hp, hp_max = HpMax}, _Target,
             _SkillAddtArg) ->
    #passive_effect{dmg_ratio =
                        round(BaseRatio + Ratio * (HpMax - Hp) / HpMax)};
script_60008(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 4131),
    #passive_effect{}.

script_60009(#c_skill{id = SkillId,
                      skill =
                          #skill{script_args =
                                     [Ratio, KillMoreNum, DmgRatioList]}},
             #fighter{action = Action}, #fighter{}, _SkillAddtArg)
    when is_list(DmgRatioList) ->
    CanPursueAttack = case Action of
                          {Cskill = #c_skill{act_flag = ActFlag}, _} ->
                              case combat_skill:can_pursue_attack(Cskill) of
                                  true -> {true, ActFlag};
                                  _ -> false
                              end;
                          _ -> false
                      end,
    CheckNumFlag = case CanPursueAttack of
                       false -> false;
                       {true, GetActFlag} ->
                           case
                               combat_cache:get_context_elem([#combat_context.skill_pursue_crit])
                               of
                               [true] ->
                                   case
                                       combat_cache:get_context_elem([#combat_context.pursue_attack_list])
                                       of
                                       [PursueAttack]
                                           when is_list(PursueAttack) ->
                                           Len = length(PursueAttack),
                                           case Len < KillMoreNum of
                                               true -> {true, Len, GetActFlag};
                                               false -> false
                                           end;
                                       _ -> false
                                   end;
                               _ -> false
                           end
                   end,
    case CheckNumFlag of
        {true, HasAttack, GetActFlag1} ->
            DmgRatio = case length(DmgRatioList) > HasAttack of
                           true -> lists:nth(HasAttack + 1, DmgRatioList);
                           false ->
                               logger:error("无法找到[~w]追击参数[~w][~w][~w]",
                                            [SkillId,
                                             HasAttack,
                                             KillMoreNum,
                                             DmgRatioList],
                                            combat_script_skill,
                                            4169),
                               1000
                       end,
            case util:rand(1, 1000) =< Ratio of
                true ->
                    PursueData = case GetActFlag1 of
                                     special_pursue -> {true, DmgRatio};
                                     _ -> {true, passive, DmgRatio}
                                 end,
                    combat_cache:save_context([{#combat_context.pursue_attack,
                                                PursueData}]);
                false -> skip
            end;
        false -> skip
    end,
    #passive_effect{};
script_60009(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 4185),
    #passive_effect{}.

script_60010(#c_skill{id = SkillId,
                      skill =
                          #skill{script_args =
                                     [Ratio, KillMoreNum, DmgRatioList]}},
             #fighter{id = Sid, action = Action}, #fighter{id = Tid},
             _SkillAddtArg)
    when is_list(DmgRatioList) ->
    CanPursueAttack = case Action of
                          {Cskill = #c_skill{act_flag = ActFlag}, _} ->
                              case combat_skill:can_pursue_attack(Cskill) of
                                  true -> {true, ActFlag};
                                  _ -> false
                              end;
                          _ -> false
                      end,
    CheckNumFlag = case CanPursueAttack of
                       {true, GetActFlag} ->
                           case combat_cache:f(by_id, Sid) of
                               #fighter{is_die = 0} ->
                                   case
                                       combat_cache:get_context_elem([#combat_context.pursue_attack_list])
                                       of
                                       [PursueAttack]
                                           when is_list(PursueAttack) ->
                                           Len = length(PursueAttack),
                                           case Len < KillMoreNum of
                                               true -> {true, Len, GetActFlag};
                                               false -> false
                                           end;
                                       _ -> false
                                   end;
                               _ -> false
                           end;
                       false -> false
                   end,
    case CheckNumFlag of
        {true, HasAttack, GetActFlag1} ->
            case combat_cache:f(by_id, Tid) of
                #fighter{is_die = 1} ->
                    DmgRatio = case length(DmgRatioList) > HasAttack of
                                   true ->
                                       lists:nth(HasAttack + 1, DmgRatioList);
                                   false ->
                                       logger:error("无法找到[~w]追击参数[~w][~w][~w]",
                                                    [SkillId,
                                                     HasAttack,
                                                     KillMoreNum,
                                                     DmgRatioList],
                                                    combat_script_skill,
                                                    4229),
                                       1000
                               end,
                    case util:rand(1, 1000) =< Ratio of
                        true ->
                            PursueData = case GetActFlag1 of
                                             special_pursue -> {true, DmgRatio};
                                             _ -> {true, passive, DmgRatio}
                                         end,
                            combat_cache:save_context([{#combat_context.pursue_attack,
                                                        PursueData}]);
                        false -> skip
                    end;
                _ -> skip
            end;
        false -> skip
    end,
    #passive_effect{};
script_60010(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 4247),
    #passive_effect{}.

script_60011(#c_skill{skill =
                          #skill{script_args = [_Rate, _HpRatio, _HpBase]}},
             #fighter{id = Sid}, #fighter{},
             #c_skill_addt_arg{passive_flag = init}) ->
    Svc = [{has_revive_self, 0, 1}],
    combat_cache:u(Sid, Svc),
    #passive_effect{};
script_60011(Skill = #c_skill{skill =
                                  #skill{script_args = [Rate, HpRatio, HpBase],
                                         buff_self = BuffSelf}},
             #fighter{id = Fid, hp_max = HpMax,
                      special_attr =
                          #special_attr{has_nirvana = HasNirvana,
                                        nirvaning = Nirvaning}},
             #fighter{},
             #c_skill_addt_arg{passive_flag = revive_self}) ->
    IsNirvana = HasNirvana =:= 1 andalso Nirvaning =:= 1,
    Flag = IsNirvana =:= false andalso
               util:rand(1, 1000) =< Rate,
    case Flag =:= true andalso
             combat_skill:is_skill_in_cooldown(Fid, Skill) =:= false
        of
        true ->
            combat_skill:add_skill_cooldown(Fid, Skill),
            HealHp = round(HpMax * HpRatio / 1000 + HpBase),
            Ae = #action_effect{heal_hp = HealHp},
            [ReviveSelf] =
                combat_cache:get_context_elem([#combat_context.revive_self]),
            NewReviveSelf = lists:keystore(Fid,
                                           1,
                                           ReviveSelf,
                                           {Fid, Skill, Ae, BuffSelf}),
            combat_cache:save_context([{#combat_context.revive_self,
                                        NewReviveSelf}]),
            #passive_effect{};
        false -> #passive_effect{}
    end;
script_60011(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 4271),
    #passive_effect{}.

script_60012(#c_skill{skill =
                          #skill{script_args = [AntiRatio, ReducePhyDmg]}},
             #fighter{id = Fid}, #fighter{}, _SkillAddtArg) ->
    combat_cache:u(Fid,
                   [{anti_control_ratio, 1, AntiRatio},
                    {reduce_phy_dmg, 1, ReducePhyDmg}]),
    #passive_effect{};
script_60012(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 4279),
    #passive_effect{}.

script_60013(#c_skill{skill =
                          #skill{script_args = [HpLine, PerRatio, MaxRatio]}},
             #fighter{hp = Hp, hp_max = HpMax}, #fighter{},
             _SkillAddtArg) ->
    V1 = Hp / HpMax,
    V2 = HpLine / 1000,
    Ratio = case V1 < V2 of
                true ->
                    round(min(MaxRatio, (V2 - V1) * 100 * PerRatio));
                false -> 0
            end,
    #passive_effect{crit_ratio = Ratio, dmg_ratio = Ratio};
script_60013(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 4292),
    #passive_effect{}.

script_60014(#c_skill{skill =
                          #skill{script_args = [], buff_self = BuffSelf}},
             Self, #fighter{}, _SkillAddtArg) ->
    lists:foreach(fun (Buff) ->
                          combat_buff:buff_add(Buff, Self, Self, true)
                  end,
                  BuffSelf),
    #passive_effect{};
script_60014(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 4300),
    #passive_effect{}.

script_60015(Skill = #c_skill{id = SkillId,
                              skill =
                                  #skill{script_args = [Rate],
                                         buff_self = BuffSelf,
                                         buff_target = BuffTarget}},
             _Self = #fighter{id = Fid, name = _Name}, _Target,
             _SkillAddtArg) ->
    case combat_skill:is_skill_in_cooldown(Fid, Skill) of
        false ->
            case util:rand(1, 1000) =< Rate of
                false -> #passive_effect{};
                true ->
                    NewBuffTarget = case length(BuffTarget) >= 1 of
                                        true -> lists:nth(1, BuffTarget);
                                        false -> []
                                    end,
                    combat_skill:add_skill_cooldown(Fid, Skill),
                    #passive_effect{buff_self_to_self = BuffSelf,
                                    buff_self_to_target = NewBuffTarget,
                                    show_passive_skills = [{Fid, SkillId, 1}]}
            end;
        true -> #passive_effect{}
    end;
script_60015(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 4321),
    #passive_effect{}.

script_60016(#c_skill{skill =
                          #skill{script_args = [Ratio]}},
             #fighter{attr = #attr{atk_speed = Saspd}},
             #fighter{attr = #attr{atk_speed = Taspd}},
             _SkillAddtArg) ->
    case Saspd > Taspd of
        true -> #passive_effect{crit_ratio = Ratio};
        false -> #passive_effect{}
    end;
script_60016(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 4331),
    #passive_effect{}.

script_60017(#c_skill{skill =
                          #skill{script_args = [Ratio]}},
             #fighter{},
             #fighter{special_status =
                          #special_status{is_silent = IsSilent,
                                          is_taunt = IsTaunt, is_seal = IsSeal,
                                          is_stun = IsStun, is_sleep = IsSleep,
                                          is_stone = IsStone}},
             _SkillAddtArg) ->
    case IsSilent =:= 1 orelse
             IsTaunt =:= 1 orelse
                 IsSeal =:= 1 orelse
                     IsStun =:= 1 orelse IsSleep =:= 1 orelse IsStone =:= 1
        of
        true -> #passive_effect{dmg_ratio = Ratio};
        false -> #passive_effect{}
    end;
script_60017(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 4341),
    #passive_effect{}.

script_60018(#c_skill{skill =
                          #skill{script_args = [Ratio]}},
             #fighter{}, #fighter{}, _SkillAddtArg) ->
    #passive_effect{dec_def_ratio = Ratio};
script_60018(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 4348),
    #passive_effect{}.

script_60019(#c_skill{skill =
                          #skill{script_args = [Base1, Base2, Base3]}},
             #fighter{hp = Hp, hp_max = HpMax}, #fighter{},
             _SkillAddtArg) ->
    V1 = Hp / HpMax * 100,
    DmgRatio = if V1 =< 10 -> Base1;
                  V1 =< 30 -> Base2;
                  V1 =< 50 -> Base3;
                  true -> 0
               end,
    #passive_effect{dmg_ratio = DmgRatio};
script_60019(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 4362),
    #passive_effect{}.

script_60020(#c_skill{skill =
                          #skill{script_args = [DmgMpRatio, DmgMp]}},
             #fighter{},
             #fighter{mp_max = MpMax,
                      special_attr =
                          #special_attr{be_dmg_mp_times = BeTimes}},
             _SkillAddtArg) ->
    logger:debug("被破魔次数:~w",
                 [BeTimes],
                 combat_script_skill,
                 4367),
    AllDmgMp = round(MpMax * DmgMpRatio / 1000 + DmgMp),
    DoDmgMp = round(AllDmgMp * math:pow(2 / 3, BeTimes)),
    Tvc = [{mp, 1, -DoDmgMp}, {be_dmg_mp_times, 1, 1}],
    Tc = [{1, -DoDmgMp, 0}],
    #passive_effect{target_val_changed = Tvc,
                    target_changed = Tc};
script_60020(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 4374),
    #passive_effect{}.

script_60021(#c_skill{skill =
                          #skill{script_args = [Rate, Ratio]}},
             #fighter{}, #fighter{}, _SkillAddtArg) ->
    case util:rand(1, 1000) =< Rate of
        true -> #passive_effect{feedback = Ratio};
        false -> #passive_effect{}
    end;
script_60021(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 4384),
    #passive_effect{}.

script_60022(#c_skill{skill =
                          #skill{script_args = [Rate, Skills, Lev]}},
             #fighter{}, #fighter{action = Action}, _SkillAddtArg) ->
    Flag = case Action of
               {#c_skill{}, _} -> util:rand(1, 1000) =< Rate;
               _ -> false
           end,
    case Flag of
        true ->
            #passive_effect{anti_skill =
                                {util:rand_list(Skills), Lev}};
        false -> #passive_effect{}
    end;
script_60022(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 4398),
    #passive_effect{}.

script_60023(#c_skill{skill =
                          #skill{script_args = [Ratio]}},
             #fighter{}, #fighter{buffs = Buffs}, _SkillAddtArg) ->
    case lists:keyfind(buff, #c_buff.eff_type, Buffs) of
        #c_buff{} -> #passive_effect{dmg_ratio = Ratio};
        _ -> #passive_effect{}
    end;
script_60023(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 4408),
    #passive_effect{}.

script_60024(#c_skill{skill =
                          #skill{script_args = [PhyRatio]}},
             #fighter{id = Fid}, #fighter{}, _SkillAddtArg) ->
    Svc = [{can_feedback, 0, 0},
           {can_anti_attack, 0, 0},
           {i_phy_dmg_raito, 1, PhyRatio}],
    combat_cache:u(Fid, Svc),
    #passive_effect{};
script_60024(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 4417),
    #passive_effect{}.

script_60025(#c_skill{skill =
                          #skill{script_args = [AccRatio, _, _DmgRatio]}},
             #fighter{id = Fid}, #fighter{},
             #c_skill_addt_arg{passive_flag = init}) ->
    Svc = [{can_attack_stealth, 0, 1},
           {accuracy, 1, AccRatio}],
    combat_cache:u(Fid, Svc),
    #passive_effect{};
script_60025(#c_skill{skill =
                          #skill{script_args = [_, Ratio, DmgRatio]}},
             #fighter{id = Sid},
             #fighter{id = Tid,
                      special_status =
                          #special_status{is_stealth = IsStealth},
                      buffs = Buffs},
             #c_skill_addt_arg{passive_flag = attack}) ->
    case IsStealth of
        1 ->
            case util:rand(1, 1000) =< Ratio of
                true ->
                    ClearBuff = [Buff
                                 || Buff = #c_buff{can_dispel = 1,
                                                   sec_type = stealth}
                                        <- Buffs],
                    lists:foreach(fun (Buff) ->
                                          combat_buff:buff_del(Tid, Sid, Buff)
                                  end,
                                  ClearBuff);
                false -> skip
            end,
            #passive_effect{dmg_ratio = DmgRatio};
        _ -> #passive_effect{}
    end;
script_60025(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 4440),
    #passive_effect{}.

script_60026(#c_skill{skill =
                          #skill{script_args = [_Round, _Ratio, _RoundRatio],
                                 buff_self = BuffSelf}},
             #fighter{id = Fid}, #fighter{},
             #c_skill_addt_arg{passive_flag = init}) ->
    Svc = [{has_ghost, 0, 1}, {is_die_disappear, 0, 0}],
    combat_cache:u(Fid, Svc),
    #passive_effect{buff_self_to_self = BuffSelf};
script_60026(CSkill = #c_skill{skill =
                                   #skill{script_args =
                                              [Round, RoundRatio, Ratio]}},
             #fighter{id = Fid, pet_attr = PetAttr, hp_max = HpMax,
                      special_attr = #special_attr{has_ghost = HasGhost},
                      master_fid = MasterFid, type = Type,
                      combat_init_attr =
                          #combat_init_attr{dec_ghost_ratio = DecGhostRatio}},
             #fighter{}, #c_skill_addt_arg{passive_flag = die}) ->
    Flag = case MasterFid =:= 0 andalso
                    lists:member(Type, [3, 6])
               of
               true -> 0;
               false -> 1
           end,
    NewRound = case lists:member(Type, [3, 6]) of
                   true ->
                       AddRound1 = case PetAttr of
                                       {Pstr, Pcon, Pmag, Pagi, Pend} ->
                                           AllPoint = Pstr + Pcon + Pmag + Pagi
                                                          + Pend,
                                           PconRatio = Pcon / AllPoint * 100,
                                           case PconRatio >= 30 of
                                               true -> 1;
                                               false ->
                                                   {AddRound, _} =
                                                       util:rand_list([{0, 150},
                                                                       {1, 50}],
                                                                      2),
                                                   AddRound
                                           end;
                                       _ ->
                                           {AddRound, _} = util:rand_list([{0,
                                                                            150},
                                                                           {1,
                                                                            50}],
                                                                          2),
                                           AddRound
                                   end,
                       DecRound = case util:rand(1, 1000) =< DecGhostRatio of
                                      true -> -1;
                                      false -> 0
                                  end,
                       Round + AddRound1 + DecRound;
                   false -> Round
               end,
    case HasGhost =:= 1 andalso Flag =:= 1 of
        true ->
            logger:debug("触发鬼魂， 回合:~w",
                         [NewRound],
                         combat_script_skill,
                         4488),
            HealHp = round(HpMax * Ratio / 1000),
            [GhostList] =
                combat_cache:get_context_elem([#combat_context.ghost_list]),
            NewGhostList = lists:keystore(Fid,
                                          1,
                                          GhostList,
                                          {Fid,
                                           NewRound,
                                           HealHp,
                                           0,
                                           RoundRatio,
                                           CSkill}),
            combat_cache:u(Fid, [{ghosting, 0, 1}]),
            combat_cache:save_context([{#combat_context.ghost_list,
                                        NewGhostList}]);
        false -> skip
    end,
    #passive_effect{};
script_60026(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 4500),
    #passive_effect{}.

script_60027(#c_skill{skill =
                          #skill{script_args = [], buff_self = BuffSelf}},
             #fighter{}, #fighter{}, _SkillAddtArg) ->
    logger:debug("技能==========:~w",
                 [BuffSelf],
                 combat_script_skill,
                 4505),
    #passive_effect{buff_self_to_self = BuffSelf};
script_60027(#c_skill{skill =
                          #skill{script_args = [ScriptId],
                                 buff_self = BuffSelf}},
             #fighter{passive_skills = PassiveSkills}, #fighter{},
             _SkillAddtArg) ->
    case combat_cache:f(by_script_id,
                        PassiveSkills,
                        ScriptId)
        of
        #c_skill{} ->
            logger:debug("拥有连击技能，加buff==========:~w",
                         [BuffSelf],
                         combat_script_skill,
                         4510),
            #passive_effect{buff_self_to_self = BuffSelf};
        _ -> #passive_effect{}
    end;
script_60027(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 4516),
    #passive_effect{}.

script_60028(#c_skill{skill =
                          #skill{script_args = [DmgRatio]}},
             #fighter{},
             #fighter{type = Ttype, passive_skills = TpassSkills,
                      special_attr =
                          #special_attr{has_revive_self = HasReviveSelf,
                                        anti_trial = AntiTrial}},
             _SkillAddtArg) ->
    case AntiTrial of
        1 -> #passive_effect{};
        _ ->
            case HasReviveSelf of
                1 ->
                    case lists:member(Ttype, [3, 6, 2]) of
                        true ->
                            #passive_effect{dmg_ratio = DmgRatio,
                                            revive_self_atk = 1};
                        _ -> #passive_effect{}
                    end;
                0 ->
                    case lists:keymember(60030, #c_skill.id, TpassSkills) of
                        true -> #passive_effect{dmg_ratio = DmgRatio};
                        _ ->
                            case lists:keymember(60130,
                                                 #c_skill.id,
                                                 TpassSkills)
                                of
                                true -> #passive_effect{dmg_ratio = DmgRatio};
                                _ -> #passive_effect{}
                            end
                    end
            end
    end;
script_60028(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 4543),
    #passive_effect{}.

script_60029(#c_skill{skill =
                          #skill{script_args = [HurtRatio, DecPhyRatio]}},
             #fighter{},
             #fighter{special_attr =
                          #special_attr{has_ghost = HasGhost}},
             _SkillAddtArg) ->
    case HasGhost of
        1 ->
            #passive_effect{hurt_multi = HurtRatio, ghost_atk = 1,
                            dec_phy_def_ratio = DecPhyRatio};
        0 -> #passive_effect{dec_phy_def_ratio = DecPhyRatio}
    end;
script_60029(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 4553),
    #passive_effect{}.

script_60030(#c_skill{skill = #skill{script_args = []}},
             #fighter{id = Fid}, #fighter{}, _SkillAddtArg) ->
    Svc = [{is_die_disappear, 0, 0}],
    combat_cache:u(Fid, Svc),
    #passive_effect{};
script_60030(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 4562),
    #passive_effect{}.

script_60031(#c_skill{skill =
                          #skill{script_args = [FixedDmg]}},
             #fighter{id = Fid}, #fighter{}, _SkillAddtArg) ->
    Svc = [{fixed_dmg, 0, FixedDmg}],
    combat_cache:u(Fid, Svc),
    #passive_effect{};
script_60031(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 4571),
    #passive_effect{}.

script_60032(Skill = #c_skill{id = SkillId,
                              skill =
                                  #skill{script_args = [NeedSkillId, Rate],
                                         buff_self = BuffSelf,
                                         buff_target = BuffTarget}},
             _Self = #fighter{id = Fid, action = Action}, _Target,
             _SkillAddtArg) ->
    Flag = case Action of
               {#c_skill{skill = #skill{id = NeedSkillId}}, _} -> true;
               _ -> false
           end,
    case Flag of
        true ->
            case combat_skill:is_skill_in_cooldown(Fid, Skill) of
                false ->
                    case util:rand(1, 1000) =< Rate of
                        false -> #passive_effect{};
                        true ->
                            NewBuffTarget = case length(BuffTarget) >= 1 of
                                                true ->
                                                    lists:nth(1, BuffTarget);
                                                false -> []
                                            end,
                            combat_skill:add_skill_cooldown(Fid, Skill),
                            #passive_effect{buff_self_to_self = BuffSelf,
                                            buff_self_to_target = NewBuffTarget,
                                            show_passive_skills =
                                                [{Fid, SkillId, 1}]}
                    end;
                true -> #passive_effect{}
            end;
        false -> #passive_effect{}
    end;
script_60032(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 4601),
    #passive_effect{}.

script_60033(#c_skill{skill =
                          #skill{script_args = [Ratio]}},
             #fighter{id = Fid}, #fighter{}, _SkillAddtArg) ->
    Svc = [{i_heal_ratio, 1, Ratio}],
    combat_cache:u(Fid, Svc),
    #passive_effect{};
script_60033(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 4610),
    #passive_effect{}.

script_60034(#c_skill{id = SkillId,
                      skill =
                          #skill{script_args = [ClassesList, Type, Ratio]}},
             #fighter{hp_max = HpMax, id = Fid},
             #fighter{classes = Classes}, _SkillAddtArg)
    when is_list(ClassesList) ->
    case lists:member(Classes, ClassesList) of
        true ->
            case Type of
                1 ->
                    #passive_effect{atk_holy_addt = HpMax,
                                    show_passive_skills = [{Fid, SkillId, 1}]};
                2 ->
                    #passive_effect{dmg_ratio = Ratio,
                                    show_passive_skills = [{Fid, SkillId, 1}]};
                _ -> #passive_effect{}
            end;
        false -> #passive_effect{}
    end;
script_60034(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 4629),
    #passive_effect{}.

script_60035(Skill = #c_skill{id = SkillId,
                              skill =
                                  #skill{name = _SkillName,
                                         script_args = [Ratio, Rate],
                                         buff_self = BuffSelf}},
             _Self = #fighter{id = Fid, hp = Hp, hp_max = HpMax},
             _Target, _SkillAddtArg) ->
    case combat_skill:is_skill_in_cooldown(Fid, Skill) of
        false ->
            case Hp / HpMax =< Ratio / 1000 of
                true ->
                    case util:rand(1, 1000) =< Rate of
                        false -> #passive_effect{};
                        true ->
                            combat_skill:add_skill_cooldown(Fid, Skill),
                            #passive_effect{buff_self_to_self = BuffSelf,
                                            show_passive_skills =
                                                [{Fid, SkillId, 1}]}
                    end;
                false -> #passive_effect{}
            end;
        true -> #passive_effect{}
    end;
script_60035(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~s]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 4651),
    #passive_effect{}.

script_60036(#c_skill{skill =
                          #skill{script_args = [Ratio]}},
             #fighter{id = Fid}, #fighter{}, _SkillAddtArg) ->
    combat_cache:u(Fid, [{i_add_chaos_ratio, 1, Ratio}]),
    #passive_effect{};
script_60036(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 4659),
    #passive_effect{}.

script_60037(#c_skill{skill =
                          #skill{script_args = [SkillIdList, UpdateArgs]}},
             #fighter{}, #fighter{}, _SkillAddtArg) ->
    Talents = [{SkillId, [{14, [UpdateArgs]}]}
               || SkillId <- SkillIdList],
    #passive_effect{talents = Talents};
script_60037(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 4667),
    #passive_effect{}.

script_60038(Cskill = #c_skill{skill =
                                   #skill{script_args =
                                              [Round, RoundRatio, Ratio]}},
             #fighter{id = Fid, hp_max = HpMax}, #fighter{},
             #c_skill_addt_arg{passive_flag = die}) ->
    HealHp = round(HpMax * Ratio / 1000),
    [ReviveList] =
        combat_cache:get_context_elem([#combat_context.revive_list]),
    NewReviveList = lists:keystore(Fid,
                                   1,
                                   ReviveList,
                                   {Fid, Round, HealHp, 0, RoundRatio, Cskill}),
    combat_cache:u(Fid, [{reviving, 0, 1}]),
    combat_cache:save_context([{#combat_context.revive_list,
                                NewReviveList}]),
    #passive_effect{};
script_60038(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 4679),
    #passive_effect{}.

script_60039(#c_skill{skill =
                          #skill{script_args = [ReduceSelfPhyDmg],
                                 buff_self = BuffSelf}},
             #fighter{id = Fid}, #fighter{}, _SkillAddtArg) ->
    combat_cache:u(Fid,
                   [{reduce_self_phy_dmg, 1, ReduceSelfPhyDmg}]),
    #passive_effect{buff_self_to_self = BuffSelf};
script_60039(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 4687),
    #passive_effect{}.

script_60040(#c_skill{skill =
                          #skill{script_args =
                                     [AntiRatio, ReducePhyDmg, Evasion]}},
             #fighter{id = Fid}, #fighter{}, _SkillAddtArg) ->
    combat_cache:u(Fid,
                   [{anti_control_ratio, 1, AntiRatio},
                    {reduce_phy_dmg, 1, ReducePhyDmg},
                    {evasion, 1, Evasion}]),
    #passive_effect{};
script_60040(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 4695),
    #passive_effect{}.

script_60041(#c_skill{skill =
                          #skill{script_args = [Evasion]}},
             #fighter{id = Fid}, #fighter{}, _SkillAddtArg) ->
    combat_cache:u(Fid,
                   [{i_can_be_crit, 0, 0}, {magic_evasion, 1, Evasion}]),
    #passive_effect{};
script_60041(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 4703),
    #passive_effect{}.

script_60042(#c_skill{skill =
                          #skill{script_args = [_Ratio, AntiRatio]}},
             #fighter{id = Fid}, #fighter{},
             #c_skill_addt_arg{passive_flag = init}) ->
    Svc = [{i_anti_poison, 1, AntiRatio}],
    combat_cache:u(Fid, Svc),
    #passive_effect{};
script_60042(Skill = #c_skill{id = SkillId,
                              skill =
                                  #skill{script_args = [Ratio, _AntiRatio],
                                         buff_target = BuffTarget}},
             #fighter{id = Fid, action = Action},
             #fighter{combat_init_attr =
                          #combat_init_attr{anti_poison = AntiRatio}},
             #c_skill_addt_arg{passive_flag = attack}) ->
    Flag = case Action of
               {#c_skill{skill = #skill{elem_type = 0}}, _} ->
                   case combat_skill:is_skill_in_cooldown(Fid, Skill) of
                       false -> true;
                       true -> false
                   end;
               _ -> false
           end,
    case Flag of
        true ->
            NewRatio = Ratio - AntiRatio,
            case util:rand(1, 1000) =< NewRatio of
                false -> #passive_effect{};
                true ->
                    NewBuffTarget = case length(BuffTarget) >= 1 of
                                        true -> lists:nth(1, BuffTarget);
                                        false -> []
                                    end,
                    combat_skill:add_skill_cooldown(Fid, Skill),
                    #passive_effect{buff_self_to_target = NewBuffTarget,
                                    show_passive_skills = [{Fid, SkillId, 1}]}
            end;
        _ -> #passive_effect{}
    end;
script_60042(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 4739),
    #passive_effect{}.

script_60043(#c_skill{skill =
                          #skill{script_args = [Ratio, Base]}},
             #fighter{lev = Lev}, #fighter{},
             #c_skill_addt_arg{ext_args = ExtArgs}) ->
    case lists:keyfind(is_die, 1, ExtArgs) of
        {_, 0} ->
            HealHp = round(Ratio * Lev / 10 + Base),
            Svc = [{hp, 1, HealHp}],
            Sc = [{0, HealHp, 0}],
            #passive_effect{self_val_changed = Svc,
                            self_changed = Sc};
        _ -> #passive_effect{}
    end;
script_60043(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 4754),
    #passive_effect{}.

script_60044(#c_skill{skill =
                          #skill{script_args = [HpLine, Rate, Ratio, Base]}},
             #fighter{hp = Hp, hp_max = HpMax}, #fighter{},
             #c_skill_addt_arg{ext_args = ExtArgs}) ->
    case lists:keyfind(is_die, 1, ExtArgs) of
        {_, 0} ->
            case Hp / HpMax < HpLine / 1000 of
                true ->
                    case util:rand(1, 1000) =< Rate of
                        true ->
                            HealHp = round(Ratio * HpMax / 1000 + Base),
                            Svc = [{hp, 1, HealHp}],
                            Sc = [{0, HealHp, 0}],
                            #passive_effect{self_val_changed = Svc,
                                            self_changed = Sc};
                        false -> #passive_effect{}
                    end;
                _ -> #passive_effect{}
            end;
        _ -> #passive_effect{}
    end;
script_60044(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 4779),
    #passive_effect{}.

script_60045(#c_skill{skill =
                          #skill{script_args = [Ratio]}},
             #fighter{id = Fid}, #fighter{}, _SkillAddtArg) ->
    combat_cache:u(Fid, [{i_item_effect_ratio, 1, Ratio}]),
    #passive_effect{};
script_60045(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 4787),
    #passive_effect{}.

script_60046(#c_skill{skill =
                          #skill{script_args = [Ratio]}},
             #fighter{id = Fid}, #fighter{}, _SkillAddtArg) ->
    combat_cache:u(Fid,
                   [{i_eff_item_effect_ratio, 1, Ratio}]),
    #passive_effect{};
script_60046(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 4795),
    #passive_effect{}.

script_60047(#c_skill{skill =
                          #skill{script_args = [Ratio]}},
             #fighter{}, #fighter{}, _SkillAddtArg) ->
    #passive_effect{dec_phy_def_ratio = Ratio};
script_60047(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 4802),
    #passive_effect{}.

script_60048(#c_skill{skill =
                          #skill{script_args = [Ratio]}},
             #fighter{pet_attr = PetAttr}, #fighter{},
             _SkillAddtArg) ->
    NewRatio = case PetAttr of
                   {Pstr, Pcon, Pmag, Pagi, Pend} ->
                       AllPoint = Pstr + Pcon + Pmag + Pagi + Pend,
                       PconRatio = Pcon / AllPoint * 100,
                       case PconRatio >= 35 of
                           true -> round(Ratio * 2.99999999999999988898e-1);
                           false -> Ratio
                       end;
                   _ -> Ratio
               end,
    logger:debug("闪现触发:~w",
                 [NewRatio],
                 combat_script_skill,
                 4817),
    case util:rand(1, 1000) =< NewRatio of
        true -> #passive_effect{flag = 1};
        false -> #passive_effect{flag = 0}
    end;
script_60048(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 4824),
    #passive_effect{}.

script_60049(#c_skill{id = SkillId,
                      skill = #skill{script_args = [ModelList]}},
             #fighter{id = Fid,
                      special_attr =
                          #special_attr{model_id = ModelId,
                                        model_order = LastOrder}},
             #fighter{}, _SkillAddtArg) ->
    Order = combat_play:get_order(),
    case Order =:= LastOrder of
        true -> #passive_effect{};
        false ->
            NextModelId = do_gen_args_60049(ModelId, ModelList),
            case NextModelId =/= ModelId of
                true ->
                    Svc = [{model_id, 0, NextModelId},
                           {model_order, 0, Order}],
                    Sc = [{3, NextModelId, 0}],
                    #passive_effect{self_val_changed = Svc,
                                    self_changed = Sc,
                                    show_passive_skills = [{Fid, SkillId, 1}]};
                false -> #passive_effect{}
            end
    end;
script_60049(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 4845),
    #passive_effect{}.

do_gen_args_60049(ModelId, []) -> ModelId;
do_gen_args_60049(ModelId,
                  [{ModelId, NextModelId, Ratio} | _T]) ->
    case util:rand(1, 100) =< Ratio of
        true -> NextModelId;
        false -> ModelId
    end;
do_gen_args_60049(ModelId, [_ | T]) ->
    do_gen_args_60049(ModelId, T).

script_60050(#c_skill{skill =
                          #skill{script_args = [Ratio]}},
             #fighter{action = Action}, _Target, _SkillAddtArg) ->
    case Action of
        {#c_skill{skill = #skill{elem_type = 1}}, _} ->
            #passive_effect{dmg_ratio_add = Ratio};
        _ -> #passive_effect{}
    end;
script_60050(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 4866),
    #passive_effect{}.

script_60051(#c_skill{skill =
                          #skill{script_args = [Ratio]}},
             #fighter{id = Sid}, #fighter{},
             #c_skill_addt_arg{passive_flag = init}) ->
    Svc = [{has_fearless, 0, 1}, {def_ratio, 1, Ratio}],
    combat_cache:u(Sid, Svc),
    #passive_effect{};
script_60051(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 4875),
    #passive_effect{}.

script_60052(#c_skill{skill =
                          #skill{id = SkillId,
                                 script_args =
                                     [BaseHurtRatio, HpRatio, HurtRatio]}},
             #fighter{id = Fid, hp_max = SHpMax},
             #fighter{hp_max = THpMax, type = TargetType},
             _SkillAddtArg) ->
    case lists:member(TargetType, [3, 6]) of
        true ->
            case THpMax >= SHpMax * HpRatio / 1000 of
                true ->
                    #passive_effect{dmg_ratio_add =
                                        BaseHurtRatio + HurtRatio,
                                    show_passive_skills = [{Fid, SkillId, 1}]};
                false -> #passive_effect{dmg_ratio_add = BaseHurtRatio}
            end;
        false -> #passive_effect{}
    end;
script_60052(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 4889),
    #passive_effect{}.

script_60053(#c_skill{skill =
                          #skill{script_args =
                                     [_Rate1,
                                      _Rate2,
                                      _Rate3,
                                      _Rate4,
                                      _HpRatio,
                                      _HpBase]}},
             #fighter{id = Sid}, #fighter{},
             #c_skill_addt_arg{passive_flag = init}) ->
    Svc = [{has_revive_self, 0, 1}],
    combat_cache:u(Sid, Svc),
    #passive_effect{};
script_60053(Skill = #c_skill{skill =
                                  #skill{script_args =
                                             [Rate1,
                                              Rate2,
                                              Rate3,
                                              Rate4,
                                              HpRatio,
                                              HpBase],
                                         buff_self = BuffSelf}},
             #fighter{id = Fid, hp_max = HpMax, pet_attr = PetAttr,
                      special_attr =
                          #special_attr{has_nirvana = HasNirvana,
                                        nirvaning = Nirvaning}},
             #fighter{},
             #c_skill_addt_arg{passive_flag = revive_self}) ->
    Rate = case PetAttr of
               {Pstr, Pcon, Pmag, Pagi, Pend} ->
                   combat_pet:calc_revive_ratio({Pstr,
                                                 Pcon,
                                                 Pmag,
                                                 Pagi,
                                                 Pend},
                                                [Rate1, Rate2, Rate3, Rate4]);
               _ -> Rate1
           end,
    IsNirvana = HasNirvana =:= 1 andalso Nirvaning =:= 1,
    Flag = IsNirvana =:= false andalso
               util:rand(1, 1000) =< Rate,
    case Flag =:= true andalso
             combat_skill:is_skill_in_cooldown(Fid, Skill) =:= false
        of
        true ->
            combat_skill:add_skill_cooldown(Fid, Skill),
            HealHp = round(HpMax * HpRatio / 1000 + HpBase),
            Ae = #action_effect{heal_hp = HealHp},
            [ReviveSelf] =
                combat_cache:get_context_elem([#combat_context.revive_self]),
            NewReviveSelf = lists:keystore(Fid,
                                           1,
                                           ReviveSelf,
                                           {Fid, Skill, Ae, BuffSelf}),
            combat_cache:save_context([{#combat_context.revive_self,
                                        NewReviveSelf}]),
            #passive_effect{};
        false -> #passive_effect{}
    end;
script_60053(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 4919),
    #passive_effect{}.

script_60054(Skill = #c_skill{id = SkillId,
                              skill =
                                  #skill{script_args =
                                             [Rate1, Rate2, Rate3, Rate4],
                                         buff_self = BuffSelf,
                                         buff_target = BuffTarget}},
             _Self = #fighter{id = Fid, pet_attr = PetAttr}, _Target,
             _SkillAddtArg) ->
    case combat_skill:is_skill_in_cooldown(Fid, Skill) of
        false ->
            Rate = case PetAttr of
                       {Pstr, Pcon, Pmag, Pagi, Pend} ->
                           combat_pet:calc_stun_ratio({Pstr,
                                                       Pcon,
                                                       Pmag,
                                                       Pagi,
                                                       Pend},
                                                      [Rate1,
                                                       Rate2,
                                                       Rate3,
                                                       Rate4]);
                       _ -> Rate1
                   end,
            case util:rand(1, 1000) =< Rate of
                false -> #passive_effect{};
                true ->
                    NewBuffTarget = case length(BuffTarget) >= 1 of
                                        true -> lists:nth(1, BuffTarget);
                                        false -> []
                                    end,
                    combat_skill:add_skill_cooldown(Fid, Skill),
                    #passive_effect{buff_self_to_self = BuffSelf,
                                    buff_self_to_target = NewBuffTarget,
                                    show_passive_skills = [{Fid, SkillId, 1}]}
            end;
        true -> #passive_effect{}
    end;
script_60054(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 4947),
    #passive_effect{}.

script_60055(Skill = #c_skill{id = SkillId,
                              skill =
                                  #skill{script_args =
                                             [Rate1, Rate2, Rate3, Rate4],
                                         buff_self = BuffSelf,
                                         buff_target = BuffTarget}},
             _Self = #fighter{id = Fid, pet_attr = PetAttr,
                              action = Action},
             _Target, _SkillAddtArg) ->
    Flag = case combat_skill:is_skill_in_cooldown(Fid,
                                                  Skill)
               of
               false ->
                   case Action of
                       {#c_skill{skill = #skill{elem_type = 1}}, _} -> true;
                       _ -> false
                   end;
               _ -> false
           end,
    case Flag of
        true ->
            Rate = case PetAttr of
                       {Pstr, Pcon, Pmag, Pagi, Pend} ->
                           combat_pet:calc_mag_ratio({Pstr,
                                                      Pcon,
                                                      Pmag,
                                                      Pagi,
                                                      Pend},
                                                     [Rate1,
                                                      Rate2,
                                                      Rate3,
                                                      Rate4]);
                       _ -> Rate1
                   end,
            case util:rand(1, 1000) =< Rate of
                false -> #passive_effect{};
                true ->
                    NewBuffTarget = case length(BuffTarget) >= 1 of
                                        true -> lists:nth(1, BuffTarget);
                                        false -> []
                                    end,
                    combat_skill:add_skill_cooldown(Fid, Skill),
                    #passive_effect{buff_self_to_self = BuffSelf,
                                    buff_self_to_target = NewBuffTarget,
                                    show_passive_skills = [{Fid, SkillId, 1}]}
            end;
        _ -> #passive_effect{}
    end;
script_60055(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 4983),
    #passive_effect{}.

script_60056(#c_skill{id = SkillId,
                      skill = #skill{script_args = [Rate, Ratio]}},
             _Self = #fighter{id = Fid, action = Action}, _Target,
             _SkillAddtArg) ->
    case Action of
        {#c_skill{skill =
                      #skill{elem_type = 0, attack_type = 0}},
         _} ->
            case util:rand(1, 1000) =< Rate of
                true ->
                    Fun = fun (Dmg) -> round(Dmg * Ratio / 1000) end,
                    #passive_effect{master_suck_hp = Fun,
                                    show_passive_skills = [{Fid, SkillId, 1}]};
                false -> #passive_effect{}
            end;
        _ -> #passive_effect{}
    end;
script_60056(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 4999),
    #passive_effect{}.

script_60057(#c_skill{skill =
                          #skill{script_args = [Ratio, Base]}},
             #fighter{mp_max = MpMax}, #fighter{},
             #c_skill_addt_arg{ext_args = ExtArgs}) ->
    case lists:keyfind(is_die, 1, ExtArgs) of
        {_, 0} ->
            HealMp = round(MpMax * Ratio / 1000 + Base),
            Svc = [{mp, 1, HealMp}],
            Sc = [{1, HealMp, 0}],
            #passive_effect{self_val_changed = Svc,
                            self_changed = Sc};
        _ -> #passive_effect{}
    end;
script_60057(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 5014),
    #passive_effect{}.

script_60058(#c_skill{skill =
                          #skill{script_args = [Ratio]}},
             #fighter{}, #fighter{}, _SkillAddtArg) ->
    #passive_effect{dec_magic_def_ratio = Ratio};
script_60058(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 5021),
    #passive_effect{}.

script_60059(#c_skill{id = SkillId,
                      skill = #skill{script_args = [Rate, Ratio]}},
             #fighter{id = Fid, pet_attr = PetAttr}, #fighter{},
             _SkillAddtArg) ->
    NewRate = case PetAttr of
                  {Pstr, Pcon, Pmag, Pagi, Pend} ->
                      AllPoint = Pstr + Pcon + Pmag + Pagi + Pend,
                      PconRatio = Pcon / AllPoint * 100,
                      case PconRatio >= 30 of
                          true -> round(Rate * 2.99999999999999988898e-1);
                          false -> Rate
                      end;
                  _ -> Rate
              end,
    case util:rand(1, 1000) =< NewRate of
        true ->
            #passive_effect{float_dmg = -Ratio,
                            show_passive_skills = [{Fid, SkillId, 1}]};
        false -> #passive_effect{}
    end;
script_60059(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 5041),
    #passive_effect{}.

script_60060(#c_skill{skill =
                          #skill{script_args =
                                     [ClashSkill,
                                      HasSkill,
                                      UpdateArgs,
                                      AddSkillId,
                                      AddSkillArgs]}},
             #fighter{}, #fighter{}, _SkillAddtArg) ->
    PetEffect = [{1,
                  ClashSkill,
                  HasSkill,
                  UpdateArgs,
                  AddSkillId,
                  AddSkillArgs}],
    #passive_effect{pet_effect = PetEffect};
script_60060(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 5049),
    #passive_effect{}.

script_60061(Skill = #c_skill{id = SkillId,
                              skill =
                                  #skill{script_args =
                                             [Rate, SkillIds, ReduceDmg]}},
             #fighter{id = Fid, name = _Name, action = Action,
                      group = Sgroup},
             _Target, _SkillAddtArg) ->
    Flag = case combat_util:get_not_die(Fid,
                                        combat_cache:op(Sgroup),
                                        [],
                                        [{is_stealth, 0}])
               of
               undefined -> false;
               _ ->
                   case Action of
                       {Cs = #c_skill{id = ASkillId}, _} ->
                           case lists:member(ASkillId, SkillIds) of
                               true ->
                                   case combat_skill:is_skill_in_cooldown(Fid,
                                                                          Skill)
                                       of
                                       false ->
                                           case util:rand(1, 1000) =< Rate of
                                               true -> {true, Cs};
                                               false -> fail_rand
                                           end;
                                       _ -> false
                                   end;
                               _ -> false
                           end;
                       _ -> false
                   end
           end,
    case Flag of
        {true,
         GetCs = #c_skill{skill =
                              AS = #skill{dmg_ratio = ADmgRatio}}} ->
            NewDmgRatio = [round(D * ReduceDmg / 1000)
                           || D <- ADmgRatio],
            NewAS = AS#skill{dmg_ratio = NewDmgRatio},
            NewCs = GetCs#c_skill{skill = NewAS},
            combat_skill:add_skill_cooldown(Fid, Skill, 1),
            combat_cache:save_context([{#combat_context.passive_attack,
                                        [{1, 1, NewCs}]}]),
            #passive_effect{show_passive_skills =
                                [{Fid, SkillId, 2}]};
        fail_rand ->
            combat_skill:add_skill_cooldown(Fid, Skill, 1),
            #passive_effect{};
        false -> #passive_effect{}
    end;
script_60061(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 5090),
    #passive_effect{}.

script_60062(#c_skill{skill =
                          #skill{script_args = [AddRatio]}},
             #fighter{id = Sid}, #fighter{}, _SkillAddtArg) ->
    Svc = [{def_anger_ratio, 1, AddRatio}],
    combat_cache:u(Sid, Svc),
    #passive_effect{};
script_60062(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 5099),
    #passive_effect{}.

script_60063(#c_skill{skill =
                          #skill{script_args = [DecRatio]}},
             #fighter{id = Sid}, #fighter{}, _SkillAddtArg) ->
    Svc = [{use_anger_ratio, 1, -DecRatio}],
    combat_cache:u(Sid, Svc),
    #passive_effect{};
script_60063(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 5108),
    #passive_effect{}.

script_60064(#c_skill{skill =
                          #skill{script_args = [Ratio]}},
             #fighter{id = Fid}, #fighter{}, _SkillAddtArg) ->
    Svc = [{i_eff_heal_ratio, 1, Ratio}],
    combat_cache:u(Fid, Svc),
    #passive_effect{};
script_60064(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 5117),
    #passive_effect{}.

script_60065(#c_skill{skill =
                          #skill{script_args =
                                     [_SkillList, _UpdateArgs, Ratio]}},
             #fighter{id = Fid}, #fighter{},
             #c_skill_addt_arg{passive_flag = init}) ->
    Svc = [{anti_ratio, 1, Ratio}],
    combat_cache:u(Fid, Svc),
    #passive_effect{};
script_60065(#c_skill{skill =
                          #skill{script_args =
                                     [SkillIdList, UpdateArgs, _Ratio]}},
             #fighter{}, #fighter{},
             #c_skill_addt_arg{passive_flag = talent}) ->
    Talents = [{SkillId, [{14, [UpdateArgs]}]}
               || SkillId <- SkillIdList],
    #passive_effect{talents = Talents};
script_60065(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 5129),
    #passive_effect{}.

script_60066(#c_skill{id = SkillId,
                      skill = #skill{script_args = [HpRatio, Ratio]}},
             _Self = #fighter{id = Fid, action = Action},
             _Target = #fighter{hp = Hp, hp_max = HpMax,
                                type = Ttype},
             _SkillAddtArg) ->
    case lists:member(Ttype, [3, 6, 5, 1, 4]) of
        true ->
            case Action of
                {#c_skill{skill = #skill{elem_type = 0}}, _} ->
                    case Hp / HpMax < HpRatio / 1000 of
                        true ->
                            #passive_effect{dmg_ratio = Ratio,
                                            show_passive_skills =
                                                [{Fid, SkillId, 1}]};
                        false -> #passive_effect{}
                    end;
                _ -> #passive_effect{}
            end;
        _ -> #passive_effect{}
    end;
script_60066(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 5151),
    #passive_effect{}.

script_60067(#c_skill{skill =
                          #skill{script_args = [SuckRatio, _DecCritRatio]}},
             _Self = #fighter{action = Action}, _Target = #fighter{},
             #c_skill_addt_arg{passive_flag = attack}) ->
    case Action of
        {#c_skill{skill =
                      #skill{elem_type = 0, attack_type = 0}},
         _} ->
            #passive_effect{suck_hp = SuckRatio};
        _ -> #passive_effect{}
    end;
script_60067(#c_skill{skill =
                          #skill{script_args = [_SuckRatio, DecCritRatio]}},
             _Self, _Target = #fighter{action = Action},
             #c_skill_addt_arg{passive_flag = defence}) ->
    case Action of
        {#c_skill{skill = #skill{elem_type = 0}}, _} ->
            #passive_effect{crit_ratio = -DecCritRatio};
        _Err -> #passive_effect{}
    end;
script_60067(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 5170),
    #passive_effect{}.

script_60068(#c_skill{skill =
                          #skill{script_args = [_AddPhy, _Layer, DecRatio]}},
             _Self = #fighter{id = Fid}, _Target,
             #c_skill_addt_arg{passive_flag = init}) ->
    Svc = [{i_dec_ghost_ratio, 1, DecRatio}],
    combat_cache:u(Fid, Svc),
    #passive_effect{};
script_60068(#c_skill{skill =
                          #skill{script_args = [AddPhy, MaxLayer, _]}},
             _Self = #fighter{id = Sid,
                              special_attr =
                                  #special_attr{add_phy_layer = AddPhyLayer}},
             _Target = #fighter{id = Tid},
             #c_skill_addt_arg{passive_flag = attack_after}) ->
    case AddPhyLayer >= MaxLayer of
        true -> #passive_effect{};
        false ->
            case combat_cache:f(by_id, Tid) of
                #fighter{is_die = 1} ->
                    Svc = [{phy_dmg, 1, AddPhy}, {add_phy_layer, 1, 1}],
                    combat_cache:u(Sid, Svc),
                    #passive_effect{};
                _ -> #passive_effect{}
            end
    end;
script_60068(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 5192),
    #passive_effect{}.

script_60069(#c_skill{skill =
                          #skill{script_args = [CritRatio]}},
             _Self = #fighter{id = Fid}, _Target, _SkillAddtArg) ->
    Svc = [{i_crit_hurt_ratio, 1, -CritRatio}],
    combat_cache:u(Fid, Svc),
    #passive_effect{};
script_60069(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 5201),
    #passive_effect{}.

script_60070(#c_skill{skill =
                          #skill{script_args = [HealVal]}},
             _Self = #fighter{id = Fid}, _Target, _SkillAddtArg) ->
    Svc = [{i_eff_heal_val, 1, HealVal}],
    combat_cache:u(Fid, Svc),
    #passive_effect{};
script_60070(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 5210),
    #passive_effect{}.

script_60071(#c_skill{skill =
                          #skill{script_args =
                                     [_SkillList, _UpdateArgs, Ratio]}},
             #fighter{id = Fid}, #fighter{},
             #c_skill_addt_arg{passive_flag = init}) ->
    Svc = [{i_eff_heal_ratio, 1, Ratio}],
    combat_cache:u(Fid, Svc),
    #passive_effect{};
script_60071(#c_skill{skill =
                          #skill{script_args =
                                     [SkillIdList, UpdateArgs, _Ratio]}},
             #fighter{}, #fighter{},
             #c_skill_addt_arg{passive_flag = talent}) ->
    Talents = [{SkillId, [{14, [UpdateArgs]}]}
               || SkillId <- SkillIdList],
    #passive_effect{talents = Talents};
script_60071(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 5222),
    #passive_effect{}.

script_60072(#c_skill{skill =
                          #skill{script_args = [SkillIdList, UpdateArgs]}},
             #fighter{}, #fighter{},
             #c_skill_addt_arg{passive_flag = talent}) ->
    Talents = [{SkillId, [{5, [[], UpdateArgs]}]}
               || SkillId <- SkillIdList],
    #passive_effect{talents = Talents};
script_60072(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 5230),
    #passive_effect{}.

script_60073(#c_skill{skill =
                          #skill{script_args =
                                     [Ratio,
                                      SkillIdList,
                                      CleanArgs,
                                      UpdateArgs,
                                      AddArgs]}},
             #fighter{}, #fighter{},
             #c_skill_addt_arg{passive_flag = talent}) ->
    case util:rand(1, 1000) =< Ratio of
        true ->
            Talents = [{SkillId,
                        [{3, [CleanArgs, UpdateArgs, AddArgs]}]}
                       || SkillId <- SkillIdList],
            #passive_effect{talents = Talents};
        _ -> #passive_effect{}
    end;
script_60073(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 5243),
    #passive_effect{}.

script_60074(_CSkill,
             #fighter{special_attr =
                          #special_attr{last_dispel_phy_dmg_ratio =
                                            LastDispelPhyDmgRatio}},
             #fighter{}, #c_skill_addt_arg{passive_flag = attack})
    when LastDispelPhyDmgRatio =< 0 ->
    #passive_effect{};
script_60074(#c_skill{id = SkillId},
             #fighter{id = Sid,
                      special_attr =
                          #special_attr{last_dispel_phy_dmg_ratio =
                                            LastDispelPhyDmgRatio}},
             #fighter{}, #c_skill_addt_arg{passive_flag = attack}) ->
    Svc = [{last_dispel_phy_dmg_ratio, 0, 0}],
    combat_cache:u(Sid, Svc),
    #passive_effect{phy_dmg_ratio = LastDispelPhyDmgRatio,
                    show_passive_skills = [{Sid, SkillId, 1}]};
script_60074(#c_skill{skill =
                          #skill{script_args = [DmgRatio]}},
             #fighter{id = Sid}, #fighter{},
             #c_skill_addt_arg{passive_flag = dispel}) ->
    Svc = [{last_dispel_phy_dmg_ratio, 0, DmgRatio}],
    combat_cache:u(Sid, Svc),
    #passive_effect{};
script_60074(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 5259),
    #passive_effect{}.

script_60075(#c_skill{skill =
                          #skill{script_args =
                                     [_SkillList, _UpdateArgs, Ratio]}},
             #fighter{id = Fid}, #fighter{},
             #c_skill_addt_arg{passive_flag = init}) ->
    Svc = [{anti_dmg_ratio, 1, Ratio}],
    combat_cache:u(Fid, Svc),
    #passive_effect{};
script_60075(#c_skill{skill =
                          #skill{script_args =
                                     [SkillIdList, UpdateArgs, _Ratio]}},
             #fighter{}, #fighter{},
             #c_skill_addt_arg{passive_flag = talent}) ->
    Talents = [{SkillId, [{14, [UpdateArgs]}]}
               || SkillId <- SkillIdList],
    #passive_effect{talents = Talents};
script_60075(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 5271),
    #passive_effect{}.

script_60076(#c_skill{skill =
                          #skill{script_args = [_DmgRaito, SuckRatio]}},
             #fighter{action = Action,
                      special_attr =
                          #special_attr{last_eva_phy_dmg_ratio =
                                            LastEvaPhyDmgRatio}},
             #fighter{}, #c_skill_addt_arg{passive_flag = attack})
    when LastEvaPhyDmgRatio =< 0 ->
    case Action of
        {#c_skill{skill =
                      #skill{elem_type = 0, attack_type = 0}},
         _} ->
            #passive_effect{suck_hp = SuckRatio};
        _ -> #passive_effect{}
    end;
script_60076(#c_skill{id = SkillId,
                      skill = #skill{script_args = [_DmgRaito, SuckRatio]}},
             #fighter{id = Sid, action = Action,
                      special_attr =
                          #special_attr{last_eva_phy_dmg_ratio =
                                            LastEvaPhyDmgRatio}},
             #fighter{}, #c_skill_addt_arg{passive_flag = attack}) ->
    Svc = [{last_eva_phy_dmg_ratio, 0, 0}],
    combat_cache:u(Sid, Svc),
    SuckRatio1 = case Action of
                     {#c_skill{skill =
                                   #skill{elem_type = 0, attack_type = 0}},
                      _} ->
                         SuckRatio;
                     _ -> 0
                 end,
    #passive_effect{phy_dmg_ratio = LastEvaPhyDmgRatio,
                    suck_hp = SuckRatio1,
                    show_passive_skills = [{Sid, SkillId, 1}]};
script_60076(#c_skill{skill =
                          #skill{script_args = [DmgRatio, _SuckRatio]}},
             #fighter{id = Sid}, #fighter{},
             #c_skill_addt_arg{passive_flag = dodge}) ->
    Svc = [{last_eva_phy_dmg_ratio, 0, DmgRatio}],
    combat_cache:u(Sid, Svc),
    #passive_effect{};
script_60076(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 5295),
    #passive_effect{}.

script_60077(#c_skill{skill =
                          #skill{script_args = [HealRatio]}},
             #fighter{type = Stype, id = Sid}, #fighter{},
             #c_skill_addt_arg{passive_flag = heal}) ->
    case Stype =:= 1 orelse Stype =:= 4 of
        true ->
            Pet = combat_cache:f(by_master_id, Sid),
            case Pet of
                #fighter{is_escape = 0, is_die = 0} ->
                    #passive_effect{};
                _ -> #passive_effect{heal_ratio = HealRatio}
            end;
        false -> #passive_effect{}
    end;
script_60077(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 5313),
    #passive_effect{}.

script_60078(Skill = #c_skill{id = SkillId,
                              skill = #skill{script_args = [MpVal, AngerVal]}},
             Self = #fighter{id = Sid, master_fid = MasterFid},
             #fighter{},
             #c_skill_addt_arg{passive_flag = die_master_effect}) ->
    case combat_skill:is_skill_in_cooldown(Sid, Skill) of
        false ->
            case combat_cache:f(by_id, MasterFid) of
                Master = #fighter{is_escape = 0, is_die = 0} ->
                    combat_skill:add_skill_cooldown(Sid, Skill),
                    Tvc = [{mp, 1, MpVal}, {anger, 1, AngerVal}],
                    Tc = [{1, MpVal, 0}, {9, AngerVal, 0}],
                    combat_cache:u(MasterFid, Tvc),
                    DieEffect =
                        combat_play:gen_sub_skill_play(die_master_effect,
                                                       {Self,
                                                        Master,
                                                        Tc,
                                                        1,
                                                        0,
                                                        [{Sid, SkillId, 1}]}),
                    combat_play:add_sub_play(DieEffect),
                    #passive_effect{};
                _ -> #passive_effect{}
            end;
        _ -> #passive_effect{}
    end;
script_60078(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 5336),
    #passive_effect{}.

script_60079(#c_skill{skill =
                          #skill{script_args =
                                     [AntiRatio, ReducePhyDmg, Evasion]}},
             #fighter{id = Fid}, #fighter{}, _SkillAddtArg) ->
    combat_cache:u(Fid,
                   [{anti_control_ratio, 1, AntiRatio},
                    {reduce_self_phy_dmg, 1, ReducePhyDmg},
                    {phy_evasion, 1, Evasion}]),
    #passive_effect{};
script_60079(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 5344),
    #passive_effect{}.

script_60080(#c_skill{skill =
                          #skill{script_args = [EffReviceRatio]}},
             #fighter{id = Fid}, #fighter{}, _SkillAddtArg) ->
    combat_cache:u(Fid,
                   [{i_eff_revive_ratio, 1, EffReviceRatio}]),
    #passive_effect{};
script_60080(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 5352),
    #passive_effect{}.

script_60081(#c_skill{skill =
                          #skill{script_args = [BuffIdList, MagicDmgRatio]}},
             #fighter{buffs = Buffs}, #fighter{},
             #c_skill_addt_arg{}) ->
    case gen_args_60081(BuffIdList, Buffs) of
        true ->
            #passive_effect{magic_dmg_ratio = MagicDmgRatio};
        false -> #passive_effect{}
    end;
script_60081(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 5362),
    #passive_effect{}.

gen_args_60081([], _Buffs) -> false;
gen_args_60081([BuffId | T], Buffs) ->
    case lists:keymember(BuffId, #c_buff.id, Buffs) of
        true -> true;
        false -> gen_args_60081(T, Buffs)
    end.

script_60082(#c_skill{skill =
                          #skill{script_args = [_, HealCritRatio]}},
             #fighter{id = Fid}, #fighter{},
             #c_skill_addt_arg{passive_flag = init}) ->
    combat_cache:u(Fid,
                   [{i_heal_crit_ratio, 1, HealCritRatio}]),
    #passive_effect{};
script_60082(#c_skill{skill =
                          #skill{script_args = [SkillIdList, _]}},
             #fighter{}, #fighter{},
             #c_skill_addt_arg{passive_flag = talent}) ->
    Talents = [{SkillId, [{17, [heal_crit]}]}
               || SkillId <- SkillIdList],
    #passive_effect{talents = Talents};
script_60082(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 5382),
    #passive_effect{}.

script_60083(#c_skill{id = PassSkillId,
                      skill =
                          #skill{script_args = [Ratio, SkillIdList],
                                 buff_target = BuffTarget}},
             Self = #fighter{id = Sid, action = Action},
             Target = #fighter{id = Tid},
             #c_skill_addt_arg{passive_flag = attack_after}) ->
    Flag = case util:rand(1, 1000) =< Ratio of
               true ->
                   case Action of
                       {#c_skill{id = SkillId}, _} ->
                           case lists:member(SkillId, SkillIdList) of
                               true ->
                                   case combat_cache:f(by_id, Tid) of
                                       #fighter{is_die = 1} -> true;
                                       _ -> false
                                   end;
                               _ when SkillIdList =:= [] ->
                                   case Action of
                                       {#c_skill{skill = #skill{elem_type = 0}},
                                        _} ->
                                           false;
                                       _ ->
                                           case combat_cache:f(by_id, Tid) of
                                               #fighter{is_die = 1} -> true;
                                               _ -> false
                                           end
                                   end;
                               _ -> false
                           end;
                       _ -> false
                   end;
               _ -> false
           end,
    case Flag of
        true ->
            NewBuffTarget = case length(BuffTarget) >= 1 of
                                true -> lists:nth(1, BuffTarget);
                                false -> []
                            end,
            lists:foreach(fun (Buff) ->
                                  combat_buff:buff_add(Buff, Self, Target, true)
                          end,
                          NewBuffTarget),
            #passive_effect{show_passive_skills =
                                [{Sid, PassSkillId, 1}]};
        _ -> #passive_effect{}
    end;
script_60083(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 5425),
    #passive_effect{}.

script_60084(Skill = #c_skill{id = SkillId,
                              skill =
                                  #skill{script_args =
                                             [Rate,
                                              SkillIds,
                                              PassSkillId,
                                              ReduceDmg]}},
             Self = #fighter{id = Fid, name = _Name, action = Action,
                             group = Sgroup},
             _Target, _SkillAddtArg) ->
    Flag = case combat_util:get_not_die(Fid,
                                        combat_cache:op(Sgroup),
                                        [],
                                        [{is_stealth, 0}])
               of
               undefined -> false;
               _ ->
                   case Action of
                       {ActionCs = #c_skill{id = ASkillId}, _} ->
                           case lists:member(ASkillId, SkillIds) of
                               true ->
                                   case combat_skill:is_skill_in_cooldown(Fid,
                                                                          Skill)
                                       of
                                       false ->
                                           case util:rand(1, 1000) =< Rate of
                                               true ->
                                                   Cs = case ASkillId =:= 60068
                                                            of
                                                            true -> ActionCs;
                                                            false ->
                                                                combat_script_skill:to_combat_skill({PassSkillId,
                                                                                                     1})
                                                        end,
                                                   {true, Cs};
                                               false -> fail_rand
                                           end;
                                       _ -> false
                                   end;
                               _ -> false
                           end;
                       _ -> false
                   end
           end,
    case Flag of
        {true, GetCs = #c_skill{}} ->
            NewCs = combat_skill:passive_to_variety_skill(Self,
                                                          GetCs,
                                                          ReduceDmg),
            combat_skill:add_skill_cooldown(Fid, Skill, 1),
            [PassiveAttacks] =
                combat_cache:get_context_elem([#combat_context.passive_attack]),
            combat_cache:save_context([{#combat_context.passive_attack,
                                        [{1, 1, NewCs} | PassiveAttacks]}]),
            #passive_effect{show_passive_skills =
                                [{Fid, SkillId, 2}]};
        fail_rand ->
            combat_skill:add_skill_cooldown(Fid, Skill, 1),
            #passive_effect{};
        false -> #passive_effect{}
    end;
script_60084(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 5474),
    #passive_effect{}.

script_60085(Skill = #c_skill{skill =
                                  #skill{script_args =
                                             [SkillIdList, HealRatio]}},
             #fighter{type = Stype, id = Sid, action = Action},
             #fighter{}, #c_skill_addt_arg{passive_flag = heal}) ->
    case Stype =:= 1 orelse Stype =:= 4 of
        true ->
            case combat_skill:is_skill_in_cooldown(Sid, Skill) of
                false ->
                    case Action of
                        {#c_skill{id = UseSkillId}, _} ->
                            case lists:member(UseSkillId, SkillIdList) of
                                true ->
                                    combat_skill:add_skill_cooldown(Sid,
                                                                    Skill,
                                                                    1),
                                    #passive_effect{heal_ratio = HealRatio};
                                false -> #passive_effect{}
                            end;
                        _ -> #passive_effect{}
                    end;
                _ -> #passive_effect{}
            end;
        false -> #passive_effect{}
    end;
script_60085(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 5502),
    #passive_effect{}.

script_60086(#c_skill{skill =
                          #skill{script_args =
                                     [NeedDuration,
                                      DeBuffExpireRatio,
                                      ControlBuffExpireRatio]}},
             #fighter{id = Fid}, #fighter{},
             #c_skill_addt_arg{passive_flag = init}) ->
    combat_cache:u(Fid,
                   [{i_debuff_buff_expire_ratio,
                     0,
                     {NeedDuration,
                      DeBuffExpireRatio,
                      ControlBuffExpireRatio}}]),
    #passive_effect{};
script_60086(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 5510),
    #passive_effect{}.

script_60087(#c_skill{skill =
                          #skill{script_args = [RatioHp, RatioMp]}},
             #fighter{hp_max = HpMax, mp_max = MpMax}, #fighter{},
             _SkillAddtArg) ->
    HealHp = round(HpMax * RatioHp / 1000),
    HealMp = round(MpMax * RatioMp / 1000),
    Svc = [{hp, 1, HealHp}, {mp, 1, HealMp}],
    Sc = [{0, HealHp, 0}, {1, HealMp, 0}],
    #passive_effect{self_val_changed = Svc,
                    self_changed = Sc};
script_60087(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 5521),
    #passive_effect{}.

script_60088(#c_skill{skill =
                          #skill{script_args =
                                     [Ratio,
                                      SkillIdList,
                                      CleanArgs,
                                      UpdateArgs,
                                      AddArgs]}},
             #fighter{}, #fighter{},
             #c_skill_addt_arg{passive_flag = talent}) ->
    case util:rand(1, 1000) =< Ratio of
        true ->
            Talents = [{SkillId,
                        [{4, [1, CleanArgs, UpdateArgs, AddArgs]}]}
                       || SkillId <- SkillIdList],
            #passive_effect{talents = Talents};
        _ -> #passive_effect{}
    end;
script_60088(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 5534),
    #passive_effect{}.

script_60089(#c_skill{skill =
                          #skill{script_args = [EffRatio, CritDmgRatio]}},
             #fighter{id = Fid}, #fighter{}, _SkillAddtArg) ->
    combat_cache:u(Fid,
                   [{i_eff_item_effect_ratio, 1, EffRatio},
                    {i_crit_dmg_ratio, 1, CritDmgRatio}]),
    #passive_effect{};
script_60089(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 5542),
    #passive_effect{}.

script_60090(#c_skill{skill =
                          #skill{script_args = [HpBase, HpRatio]}},
             #fighter{hp_max = HpMax}, #fighter{},
             #c_skill_addt_arg{passive_flag = dodge}) ->
    HealHp = round(HpBase + HpMax * HpRatio / 1000),
    Svc = [{hp, 1, HealHp}],
    Sc = [{0, HealHp, 0}],
    #passive_effect{self_val_changed = Svc,
                    self_changed = Sc};
script_60090(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 5552),
    #passive_effect{}.

script_60091(#c_skill{}, #fighter{}, #fighter{},
             #c_skill_addt_arg{}) ->
    #passive_effect{};
script_60091(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 5559),
    #passive_effect{}.

script_60092(#c_skill{skill =
                          #skill{script_args =
                                     [SkillIdList,
                                      LossRatio,
                                      SuckRatio,
                                      LevRatio]}},
             #fighter{lev = Slev, action = Action}, _Target,
             _SkillAddtArg) ->
    case Action of
        {#c_skill{id = UseSkillId}, _} ->
            case lists:member(UseSkillId, SkillIdList) of
                true ->
                    MaxVal = Slev * LevRatio,
                    #passive_effect{suck_mp = SuckRatio,
                                    suck_mp_loss = LossRatio,
                                    suck_mp_max = MaxVal};
                _ -> #passive_effect{}
            end;
        _ -> #passive_effect{}
    end;
script_60092(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 5577),
    #passive_effect{}.

script_60093(#c_skill{skill =
                          #skill{script_args = [Rate]}},
             #fighter{action = Action}, #fighter{}, _SkillAddtArg) ->
    Flag = case Action of
               {#c_skill{id = 1001}, _} -> util:rand(1, 1000) =< Rate;
               _ -> false
           end,
    case Flag of
        true -> #passive_effect{def_anti = 1};
        false -> #passive_effect{}
    end;
script_60093(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 5591),
    #passive_effect{}.

script_60094(#c_skill{id = SkillId,
                      skill = #skill{script_args = [Rate, Ratio]}},
             #fighter{id = Fid,
                      special_attr =
                          #special_attr{iron_body_times = IronBodyTimes}},
             #fighter{action = Action}, _SkillAddtArg) ->
    Flag = case Action of
               {#c_skill{skill = #skill{elem_type = 0}}, _} -> true;
               _ -> false
           end,
    X = math:pow(2, IronBodyTimes),
    NewRate = Rate / X,
    case Flag =:= true andalso util:rand(1, 1000) =< NewRate
        of
        true ->
            Svc = [{iron_body_times, 0, IronBodyTimes + 1}],
            combat_cache:u(Fid, Svc),
            #passive_effect{float_dmg = -Ratio,
                            show_passive_skills = [{Fid, SkillId, 1}]};
        _ -> #passive_effect{}
    end;
script_60094(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 5611),
    #passive_effect{}.

script_60095(#c_skill{id = SkillId,
                      skill =
                          #skill{script_args = [BaseRatio, ControlRatio]}},
             _Self = #fighter{id = Fid}, _Target, _SkillAddtArg) ->
    #passive_effect{stone_suck_hp =
                        {BaseRatio, ControlRatio},
                    show_passive_skills = [{Fid, SkillId, 1}]};
script_60095(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 5618),
    #passive_effect{}.

script_60096(#c_skill{id = SkillId,
                      skill =
                          #skill{script_args =
                                     [Rate, BuffIds, SkillList, DecMagicDef]}},
             _Self = #fighter{id = Sid, action = Action},
             _Target = #fighter{id = Tid, buffs = Buffs},
             _SkillAddtArg) ->
    Flag = case util:rand(1, 1000) =< Rate of
               true ->
                   case Action of
                       {#c_skill{id = UseSkillId}, _} ->
                           case lists:member(UseSkillId, SkillList) of
                               true ->
                                   HasBuff = [Buff
                                              || Buff = #c_buff{id = BuffId}
                                                     <- Buffs,
                                                 lists:member(BuffId, BuffIds)
                                                     =:= true],
                                   Fun = fun (#c_buff{duration_left =
                                                          DurationLeft,
                                                      args = [Val]},
                                              AllVal) ->
                                                 AddVal = max(0,
                                                              round(DurationLeft
                                                                        * Val)),
                                                 AllVal + AddVal;
                                             (_, AllVal) -> AllVal
                                         end,
                                   LossVal = lists:foldl(Fun, 0, HasBuff),
                                   case LossVal > 0 of
                                       true -> {true, LossVal, HasBuff};
                                       _ -> false
                                   end;
                               _ -> false
                           end;
                       _ -> false
                   end;
               _ -> false
           end,
    case Flag of
        {true, DmgVal, NeedDelBuff} when DmgVal > 0 ->
            lists:foreach(fun (DelBuff) ->
                                  combat_buff:buff_del(Tid, Sid, DelBuff)
                          end,
                          NeedDelBuff),
            #passive_effect{dec_magic_def_ratio = DecMagicDef,
                            buff_holy_addt = DmgVal,
                            show_passive_skills = [{Tid, SkillId, 1}]};
        _ -> #passive_effect{dec_magic_def_ratio = DecMagicDef}
    end;
script_60096(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 5660),
    #passive_effect{}.

script_60097(#c_skill{skill = #skill{}},
             #fighter{id = Sid}, #fighter{},
             #c_skill_addt_arg{passive_flag = init}) ->
    Svc = [{anti_trial, 0, 1}],
    combat_cache:u(Sid, Svc),
    #passive_effect{};
script_60097(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 5669),
    #passive_effect{}.

script_60098(#c_skill{}, #fighter{sworn_id = {0, _, _}},
             #fighter{}, #c_skill_addt_arg{}) ->
    #passive_effect{};
script_60098(#c_skill{},
             #fighter{special_attr =
                          #special_attr{is_sworn_heal = 1}},
             #fighter{}, #c_skill_addt_arg{}) ->
    #passive_effect{};
script_60098(#c_skill{id = SkillId,
                      skill = #skill{script_args = [Ratio, HealRatio]}},
             Self = #fighter{id = _Sid}, #fighter{},
             #c_skill_addt_arg{ext_args = ExtArgs}) ->
    case util:rand(1, 1000) =< Ratio of
        true ->
            case lists:keyfind(heal_val, 1, ExtArgs) of
                {_, HealVal} ->
                    HealVal1 = round(HealVal * HealRatio / 1000),
                    case HealVal1 > 0 of
                        true -> combat_sworn:heal(Self, HealVal1, SkillId);
                        _ -> skip
                    end;
                _ -> skip
            end;
        _ -> skip
    end,
    #passive_effect{};
script_60098(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 5693),
    #passive_effect{}.

script_60099(#c_skill{skill =
                          #skill{script_args = [Ratio, HpLine, ProtectRatio]}},
             #fighter{id = Sid}, #fighter{},
             #c_skill_addt_arg{passive_flag = init}) ->
    Svc = [{i_sworn_protect,
            0,
            {Ratio, HpLine, ProtectRatio}}],
    combat_cache:u(Sid, Svc),
    #passive_effect{};
script_60099(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 5703),
    #passive_effect{}.

script_60100(Skill = #c_skill{id = SkillId,
                              skill =
                                  #skill{script_args = [Rate],
                                         buff_self = BuffSelf}},
             _Self = #fighter{id = Fid}, _Target, _SkillAddtArg) ->
    case combat_skill:is_skill_in_cooldown(Fid, Skill) of
        false ->
            case util:rand(1, 1000) =< Rate of
                false -> #passive_effect{};
                true ->
                    combat_skill:add_skill_cooldown(Fid, Skill),
                    #passive_effect{buff_self_to_self = BuffSelf,
                                    show_passive_skills = [{Fid, SkillId, 1}]}
            end;
        true -> #passive_effect{}
    end;
script_60100(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 5720),
    #passive_effect{}.

script_60101(#c_skill{id = Skid,
                      skill =
                          #skill{script_args = [SkillList, SkillId, Num]}},
             #fighter{id = Sid, action = Action,
                      skill_cooldown = SkillCds},
             #fighter{}, #c_skill_addt_arg{}) ->
    case Action of
        {#c_skill{id = UseId}, _} ->
            case lists:member(UseId, SkillList) of
                true ->
                    NewCdTimeLeft = case lists:keyfind(SkillId, 1, SkillCds)
                                        of
                                        {_, CdTimeLeft} ->
                                            max(0, CdTimeLeft - Num);
                                        _ -> 0
                                    end,
                    NewSkillCds = lists:keystore(SkillId,
                                                 1,
                                                 SkillCds,
                                                 {SkillId, NewCdTimeLeft}),
                    Svc = [{skill_cooldown, 0, NewSkillCds}],
                    combat_cache:u(Sid, Svc),
                    #passive_effect{show_passive_skills = [{Sid, Skid, 0}]};
                false -> #passive_effect{}
            end;
        _ -> #passive_effect{}
    end;
script_60101(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 5744),
    #passive_effect{}.

script_60102(Skill = #c_skill{id = SkillId,
                              skill = #skill{buff_target = BuffTarget}},
             Self = #fighter{id = Sid}, Target = #fighter{},
             #c_skill_addt_arg{passive_flag = die_effect}) ->
    case combat_skill:is_skill_in_cooldown(Sid, Skill) of
        false ->
            combat_skill:add_skill_cooldown(Sid, Skill),
            NewBuffTarget = case length(BuffTarget) >= 1 of
                                true -> lists:nth(1, BuffTarget);
                                false -> []
                            end,
            lists:foreach(fun (Buff) ->
                                  combat_buff:buff_add(Buff, Self, Target)
                          end,
                          NewBuffTarget),
            #passive_effect{show_passive_skills =
                                [{Sid, SkillId, 1}]};
        _ -> #passive_effect{}
    end;
script_60102(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 5762),
    #passive_effect{}.

script_60103(#c_skill{skill =
                          #skill{script_args = [Ratio]}},
             #fighter{hp = Hp, hp_max = HpMax,
                      attr = #attr{phy_def = PhyDef, magic_def = MagicDef}},
             _Target, _SkillAddtArg) ->
    Def = max(PhyDef, MagicDef),
    AddRatio = Ratio * (HpMax - Hp) / HpMax,
    AddDef = round(Def * AddRatio / 1000),
    #passive_effect{defence = AddDef};
script_60103(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 5772),
    #passive_effect{}.

script_60104(#c_skill{skill =
                          #skill{script_args = [Ratio, Base]}},
             #fighter{attr = #attr{magic_dmg = MagicDmg}},
             #fighter{}, #c_skill_addt_arg{}) ->
    Val = round(MagicDmg * Ratio / 1000 + Base),
    Svc = [{round_add_magic_dmg, 1, Val}],
    #passive_effect{self_val_changed = Svc};
script_60104(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 5781),
    #passive_effect{}.

script_60105(Skill = #c_skill{id = SkillId,
                              skill =
                                  #skill{script_args =
                                             [BuffId,
                                              HitRate,
                                              Duration,
                                              Dispel,
                                              DmgRatio]}},
             Self = #fighter{id = Sid, group = Sgroup,
                             attr =
                                 #attr{phy_dmg = PhyDmg, magic_dmg = MagicDmg}},
             #fighter{},
             #c_skill_addt_arg{passive_flag = die_effect}) ->
    case combat_skill:is_skill_in_cooldown(Sid, Skill) of
        false ->
            case combat_util:get_not_die(Sid, Sgroup, [Sid], []) of
                Target = #fighter{} ->
                    combat_skill:add_skill_cooldown(Sid, Skill),
                    AddVal = round(max(PhyDmg, MagicDmg) * DmgRatio / 1000),
                    BuffArgs = [AddVal],
                    AddBuff = combat_script_buff:convert_buff([{BuffId,
                                                                HitRate,
                                                                Duration,
                                                                Dispel,
                                                                BuffArgs}]),
                    lists:foreach(fun (Buff) ->
                                          combat_buff:buff_add(Buff,
                                                               Self,
                                                               Target)
                                  end,
                                  AddBuff),
                    #passive_effect{show_passive_skills =
                                        [{Sid, SkillId, 1}]};
                _ -> #passive_effect{}
            end;
        _ -> #passive_effect{}
    end;
script_60105(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 5803),
    #passive_effect{}.

script_60106(#c_skill{skill =
                          #skill{script_args = [SkillIdList, UpdateArgs]}},
             #fighter{}, #fighter{},
             #c_skill_addt_arg{passive_flag = talent}) ->
    Talents1 = [{SkillId, [{17, [under_special_control]}]}
                || SkillId <- SkillIdList],
    Talents2 = [{SkillId, [{6, [[], UpdateArgs]}]}
                || SkillId <- SkillIdList],
    #passive_effect{talents = Talents1 ++ Talents2};
script_60106(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 5812),
    #passive_effect{}.

script_60107(#c_skill{skill =
                          #skill{script_args = [_Rate, _HpRatio, _HpBase, _]}},
             #fighter{id = Sid}, #fighter{},
             #c_skill_addt_arg{passive_flag = init}) ->
    Svc = [{has_revive_self, 0, 1}],
    combat_cache:u(Sid, Svc),
    #passive_effect{};
script_60107(Skill = #c_skill{skill =
                                  #skill{script_args =
                                             [Rate, HpRatio, HpBase, Skills],
                                         buff_self = BuffSelf}},
             #fighter{id = Fid, hp_max = HpMax,
                      skill_cooldown = SkillCds,
                      special_attr =
                          #special_attr{has_nirvana = HasNirvana,
                                        nirvaning = Nirvaning}},
             #fighter{},
             #c_skill_addt_arg{passive_flag = revive_self}) ->
    Flag = util:rand(1, 1000) =< Rate,
    IsNirvana = HasNirvana =:= 1 andalso Nirvaning =:= 1,
    case IsNirvana =:= false andalso
             Flag =:= true andalso
                 combat_skill:is_skill_in_cooldown(Fid, Skill) =:= false
        of
        true ->
            NewSkillCds = [Cd
                           || Cd = {Skid, _} <- SkillCds,
                              lists:member(Skid, Skills) =:= false],
            Svc = [{skill_cooldown, 0, NewSkillCds}],
            combat_cache:u(Fid, Svc),
            combat_skill:add_skill_cooldown(Fid, Skill),
            HealHp = round(HpMax * HpRatio / 1000 + HpBase),
            Ae = #action_effect{heal_hp = HealHp},
            [ReviveSelf] =
                combat_cache:get_context_elem([#combat_context.revive_self]),
            NewReviveSelf = lists:keystore(Fid,
                                           1,
                                           ReviveSelf,
                                           {Fid, Skill, Ae, BuffSelf}),
            combat_cache:save_context([{#combat_context.revive_self,
                                        NewReviveSelf}]),
            #passive_effect{};
        false -> #passive_effect{}
    end;
script_60107(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 5839),
    #passive_effect{}.

script_60108(#c_skill{skill =
                          #skill{script_args =
                                     [SkillIdDmgList,
                                      SkillIdBeforeList,
                                      SkillIdAfterList]}},
             #fighter{}, #fighter{},
             #c_skill_addt_arg{passive_flag = talent}) ->
    Talents1 = [{SkillId, [{11, [AddDmgRatio]}]}
                || {SkillId, AddDmgRatio} <- SkillIdDmgList],
    Talents2 = [{SkillId, [{5, [[], UpdateArgs]}]}
                || {SkillId, UpdateArgs} <- SkillIdBeforeList],
    Talents3 = [{SkillId, [{6, [[], UpdateArgs]}]}
                || {SkillId, UpdateArgs} <- SkillIdAfterList],
    #passive_effect{talents =
                        Talents1 ++ Talents2 ++ Talents3};
script_60108(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 5849),
    #passive_effect{}.

script_60109(#c_skill{skill =
                          #skill{script_args = [Rate, Ratio, DecDmgVal]}},
             #fighter{id = Sid}, #fighter{},
             #c_skill_addt_arg{passive_flag = init}) ->
    Svc = [{dec_dmg, 0, {Rate, Ratio, DecDmgVal}}],
    combat_cache:u(Sid, Svc),
    #passive_effect{};
script_60109(#c_skill{id = SkillId,
                      skill = #skill{script_args = [Rate, _, _]}},
             #fighter{id = Fid,
                      special_attr = #special_attr{dec_dmg = DecDmg}},
             #fighter{},
             #c_skill_addt_arg{passive_flag = defence}) ->
    case util:rand(1, 1000) =< Rate of
        true when DecDmg > 0 ->
            #passive_effect{dec_dmg_flag = 1,
                            show_passive_skills = [{Fid, SkillId, 1}]};
        _ -> #passive_effect{}
    end;
script_60109(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 5865),
    #passive_effect{}.

script_60110(#c_skill{id = SkillId,
                      skill =
                          #skill{script_args = [BaseId, ModelList, ValList]}},
             #fighter{id = Sid, group = Sgroup},
             Target = #fighter{name = Tname},
             #c_skill_addt_arg{passive_flag = die_effect}) ->
    case lists:keyfind(BaseId,
                       #fighter.base_id,
                       combat_cache:all(Sgroup))
        of
        BaseTarget = #fighter{id = Tid, is_die = 0,
                              is_escape = 0,
                              special_attr =
                                  #special_attr{model_id = ModelId,
                                                model_val = ModelVal}} ->
            {Val, _} = util:rand_list(ValList, 2),
            NewModelVal = max(0, ModelVal + Val),
            NewModelId = calc_model_id(NewModelVal,
                                       ModelList,
                                       ModelId),
            ValStr = case Val > 0 of
                         true -> util:flist("+~w", [Val]);
                         _ -> util:flist("~w", [Val])
                     end,
            Msg1 = case Val > 0 of
                       true ->
                           if NewModelVal >= 100 ->
                                  lang:get("{face_1, 36}超完美！获得额外奖励！{face_1, 36}");
                              ModelVal < 30 andalso NewModelVal >= 30 ->
                                  lang:get("{face_1, 36}雪人进阶，奖励进阶！{face_1, 36}");
                              ModelVal < 80 andalso NewModelVal >= 80 ->
                                  lang:get("{face_1, 36}雪人进阶，奖励进阶！{face_1, 36}");
                              Val =:= 8 ->
                                  notice:format(lang:get("~ts为雪人堆了一个~ts，结算奖励获得了提升"),
                                                [{string_2, 1, Tname},
                                                 {string_2,
                                                  5,
                                                  lang:get("财富雪团")}]);
                              Val =:= 12 ->
                                  notice:format(lang:get("~ts堆了一个~ts，奖励获得~ts提升{face_1,29}"),
                                                [{string_2, 1, Tname},
                                                 {string_2,
                                                  5,
                                                  lang:get("天赐大雪团")},
                                                 {string_2,
                                                  1,
                                                  lang:get("大幅")}]);
                              true ->
                                  notice:format(lang:get("堆雪人进度~ts，总进度~ts/100"),
                                                [{string_2, 1, ValStr},
                                                 {string_1, NewModelVal}])
                           end;
                       _ ->
                           case Val =:= -12 of
                               true ->
                                   notice:format(lang:get("~ts堆进一块~ts，结算奖励~ts了{face_1,11}"),
                                                 [{string_2, 1, Tname},
                                                  {string_2, 5, lang:get("石头")},
                                                  {string_2,
                                                   6,
                                                   lang:get("下降")}]);
                               _ ->
                                   notice:format(lang:get("堆雪人进度~ts，总进度~ts/100"),
                                                 [{string_2, 6, ValStr},
                                                  {string_1, NewModelVal}])
                           end
                   end,
            case NewModelId =/= ModelId of
                true ->
                    Tvc = [{model_id, 0, NewModelId},
                           {model_val, 0, NewModelVal}],
                    Tc = [{3, NewModelId, 0}],
                    gen_60110_play(Target, BaseTarget, Tvc, Tc, Msg1),
                    #passive_effect{show_passive_skills =
                                        [{Sid, SkillId, 1}]};
                _ ->
                    Tvc = [{model_val, 0, NewModelVal}],
                    Tc = [],
                    combat_cache:u(Tid, Tvc),
                    gen_60110_play(Target, BaseTarget, Tvc, Tc, Msg1),
                    #passive_effect{show_passive_skills =
                                        [{Sid, SkillId, 1}]}
            end;
        _ -> #passive_effect{}
    end;
script_60110(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 5922),
    #passive_effect{}.

gen_60110_play(Self = #fighter{},
               Target = #fighter{id = Tid}, Tvc, Tc, ActMsg) ->
    combat_cache:u(Tid, Tvc),
    NewSkill = combat_script_skill:to_combat_skill({1005,
                                                    1}),
    NewSkill1 = NewSkill#c_skill{action_msg = ActMsg},
    Play = combat_play:gen_sub_skill_play(special_wait,
                                          {Self, Target, NewSkill1, [], Tc}),
    combat_play:add_sub_play(Play),
    ok.

calc_model_id(_Val, [], ModelId) -> ModelId;
calc_model_id(Val, [{H, NeedVal} | T], _ModelId)
    when Val >= NeedVal ->
    calc_model_id(Val, T, H);
calc_model_id(_Val, [_ | _], ModelId) -> ModelId.

script_60111(#c_skill{skill =
                          #skill{script_args = [FixedDmg1, FixedDmg2]}},
             #fighter{id = Fid}, #fighter{}, _SkillAddtArg) ->
    Svc = [{fixed_dmg, 0, {FixedDmg1, FixedDmg2}}],
    combat_cache:u(Fid, Svc),
    #passive_effect{};
script_60111(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 5955),
    #passive_effect{}.

script_60112(Skill = #c_skill{id = SkillId,
                              skill =
                                  #skill{script_args =
                                             [_KillMoreNum,
                                              Skills,
                                              ReduceDmg]}},
             Self = #fighter{id = Sid, action = Action},
             #fighter{id = Tid}, _SkillAddtArg)
    when is_list(Skills) ->
    logger:debug("使用技能:~w, 触发判断：~w",
                 [Action, SkillId],
                 combat_script_skill,
                 5960),
    CanPursueAttack = case Action of
                          {Cskill = #c_skill{id = UseSkillId}, _} ->
                              case lists:member(UseSkillId, Skills) of
                                  true -> {true, Cskill};
                                  _ -> false
                              end;
                          _ -> false
                      end,
    CheckNumFlag = case CanPursueAttack of
                       {true, DoneUseSkill} ->
                           case combat_cache:f(by_id, Sid) of
                               #fighter{is_die = 0} ->
                                   case combat_skill:is_skill_in_cooldown(Sid,
                                                                          Skill)
                                       of
                                       false -> {true, DoneUseSkill};
                                       _ -> false
                                   end;
                               _ -> false
                           end;
                       false -> false
                   end,
    case CheckNumFlag of
        {true, GetCs} ->
            case combat_cache:f(by_id, Tid) of
                #fighter{is_die = 1} ->
                    NewCs = combat_skill:passive_to_variety_skill(Self,
                                                                  GetCs,
                                                                  ReduceDmg),
                    combat_skill:add_skill_cooldown(Sid, Skill, 1),
                    OldPassAttack = case
                                        combat_cache:get_context_elem([#combat_context.passive_attack])
                                        of
                                        [_OldPassAttack] -> _OldPassAttack;
                                        _ -> []
                                    end,
                    NewPassiveSkills = OldPassAttack ++ [{1, 1, NewCs}],
                    combat_cache:save_context([{#combat_context.passive_attack,
                                                NewPassiveSkills}]),
                    #passive_effect{show_passive_skills =
                                        [{Sid, SkillId, 2}]};
                _ -> #passive_effect{}
            end;
        false -> #passive_effect{}
    end;
script_60112(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 6008),
    #passive_effect{}.

script_60113(#c_skill{skill =
                          #skill{script_args =
                                     [_Round, _EggRatio, _HealRatio, _Buff],
                                 buff_self = BuffSelf}},
             #fighter{id = Fid}, #fighter{},
             #c_skill_addt_arg{passive_flag = init}) ->
    Svc = [{has_nirvana, 0, 1}],
    combat_cache:u(Fid, Svc),
    #passive_effect{buff_self_to_self = BuffSelf};
script_60113(CSkill = #c_skill{id = SkillId,
                               skill =
                                   #skill{script_args =
                                              [Round,
                                               EggRatio,
                                               HealRatio,
                                               AddBuffs]}},
             Self = #fighter{id = Fid, hp_max = HpMax,
                             special_attr =
                                 #special_attr{has_nirvana = HasNirvana,
                                               nirvaning = Nirvaning},
                             buffs = Buffs},
             #fighter{},
             #c_skill_addt_arg{passive_flag = nirvana}) ->
    case HasNirvana =:= 1 of
        true ->
            logger:debug("涅槃特性", [], combat_script_skill, 6020),
            case combat_skill:is_skill_in_cooldown(Fid, CSkill) of
                true ->
                    logger:debug("涅槃cd", [], combat_script_skill, 6024),
                    #passive_effect{};
                false ->
                    case Nirvaning =:= 1 of
                        true ->
                            logger:debug("蛋形态死亡，蛋形态消亡，走死亡流程:",
                                         [],
                                         combat_script_skill,
                                         6030),
                            combat_skill:add_skill_cooldown(Fid, CSkill),
                            [NirvanaList] =
                                combat_cache:get_context_elem([#combat_context.nirvana_list]),
                            NewNirvanaList = lists:keydelete(Fid,
                                                             1,
                                                             NirvanaList),
                            Svc = [{nirvaning, 0, 0}],
                            combat_cache:u(Fid, Svc),
                            ClearBuff = lists:filter(fun (#c_buff{id = Bfid}) ->
                                                             lists:keymember(Bfid,
                                                                             1,
                                                                             AddBuffs)
                                                     end,
                                                     Buffs),
                            lists:foreach(fun (Buff) ->
                                                  combat_buff:buff_del(Fid,
                                                                       Fid,
                                                                       Buff)
                                          end,
                                          ClearBuff),
                            combat_cache:save_context([{#combat_context.nirvana_list,
                                                        NewNirvanaList}]),
                            #passive_effect{};
                        false ->
                            logger:debug("鸟形态死亡，变蛋形态:",
                                         [],
                                         combat_script_skill,
                                         6046),
                            HealHp = round(HpMax * HealRatio / 1000),
                            EggHp = round(HpMax * EggRatio / 1000),
                            [NirvanaList] =
                                combat_cache:get_context_elem([#combat_context.nirvana_list]),
                            NewNirvanaList = lists:keystore(Fid,
                                                            1,
                                                            NirvanaList,
                                                            {Fid,
                                                             Round,
                                                             HealHp,
                                                             0,
                                                             1000,
                                                             CSkill}),
                            Svc = [{is_die, 0, 0},
                                   {hp, 0, EggHp},
                                   {nirvaning, 0, 1}],
                            Sc = [{2, 0, 0}, {0, EggHp, 0}],
                            combat_cache:u(Fid, Svc),
                            ConvertBuffs =
                                combat_script_buff:convert_buff(AddBuffs),
                            lists:foreach(fun (Buff) ->
                                                  combat_buff:buff_add(Buff,
                                                                       Self,
                                                                       Self,
                                                                       true)
                                          end,
                                          ConvertBuffs),
                            combat_cache:save_context([{#combat_context.nirvana_list,
                                                        NewNirvanaList}]),
                            #passive_effect{self_changed = Sc,
                                            show_passive_skills =
                                                [{Fid, SkillId, 1}],
                                            flag = 1}
                    end
            end;
        false -> #passive_effect{}
    end;
script_60113(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 6068),
    #passive_effect{}.

script_60114(#c_skill{id = SkillId,
                      skill = #skill{script_args = [Rate, Ratio]}},
             _Self = #fighter{id = Fid, action = Action}, _Target,
             _SkillAddtArg) ->
    case Action of
        {#c_skill{skill = #skill{elem_type = 1}}, _} ->
            case util:rand(1, 1000) =< Rate of
                false -> #passive_effect{};
                true ->
                    #passive_effect{suck_hp = Ratio,
                                    show_passive_skills = [{Fid, SkillId, 1}]}
            end;
        _ -> #passive_effect{}
    end;
script_60114(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 6082),
    #passive_effect{}.

script_60115(#c_skill{skill =
                          #skill{script_args = [Ratio]}},
             #fighter{}, #fighter{}, _SkillAddtArg) ->
    case util:rand(1, 1000) =< Ratio of
        true -> #passive_effect{flag = 1};
        false -> #passive_effect{flag = 0}
    end;
script_60115(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 6092),
    #passive_effect{}.

script_60116(Skill = #c_skill{id = SkillId,
                              skill =
                                  #skill{script_args = [Rate],
                                         buff_target = BuffTarget}},
             Self = #fighter{id = Sid, group = Group}, #fighter{},
             #c_skill_addt_arg{passive_flag = die_effect}) ->
    case util:rand(1, 1000) =< Rate of
        false -> #passive_effect{};
        true ->
            case combat_skill:is_skill_in_cooldown(Sid, Skill) of
                false ->
                    case gen_script_60116(Self, Group) of
                        {true, Target} ->
                            combat_skill:add_skill_cooldown(Sid, Skill),
                            NewBuffTarget = case length(BuffTarget) >= 1 of
                                                true ->
                                                    lists:nth(1, BuffTarget);
                                                false -> []
                                            end,
                            lists:foreach(fun (Buff) ->
                                                  combat_buff:buff_add(Buff,
                                                                       Self,
                                                                       Target)
                                          end,
                                          NewBuffTarget),
                            #passive_effect{show_passive_skills =
                                                [{Sid, SkillId, 1}]};
                        _ -> #passive_effect{}
                    end;
                _ -> #passive_effect{}
            end
    end;
script_60116(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 6119),
    #passive_effect{}.

gen_script_60116(Self, Group) ->
    List = combat_cache:all(combat_cache:op(Group)),
    List1 = [F
             || F = #fighter{is_die = 0, is_escape = 0} <- List,
                combat_util:can_choose_stealth(Self, F) =:= true],
    case util:rand_list(List1) of
        Target = #fighter{} -> {true, Target};
        _ -> false
    end.

script_60117(#c_skill{skill =
                          #skill{script_args = [DieRound, HpRatio]}},
             Self = #fighter{name = _Sname, group = Sgroup,
                             base_id = _BaseId, id = _Sid},
             Target = #fighter{type = TargetType, is_die = IsDie,
                               is_escape = IsEscape},
             #c_skill_addt_arg{passive_flag = kill_effect}) ->
    case TargetType =:= 3 andalso
             IsDie =:= 1 andalso IsEscape =:= 0
        of
        true ->
            NewTarget = gen_args_60117(Target, Sgroup, HpRatio),
            case combat_fighter:add_fighters(pet_clone,
                                             Sgroup,
                                             [NewTarget])
                of
                Summons = [#fighter{id = Fid}] ->
                    case DieRound > 0 of
                        true ->
                            [KillList] =
                                combat_cache:get_context_elem([#combat_context.kill_by_self_list]),
                            NewK = {Sgroup, Fid, DieRound},
                            NewKillList = lists:keystore(Sgroup,
                                                         1,
                                                         KillList,
                                                         NewK),
                            combat_cache:save_context([{#combat_context.kill_by_self_list,
                                                        NewKillList}]);
                        _ -> ok
                    end,
                    combat_play:add_sub_play(combat_play:gen_sub_summon_play(0,
                                                                             Self,
                                                                             Summons)),
                    #passive_effect{};
                _ -> #passive_effect{}
            end;
        _ -> #passive_effect{}
    end;
script_60117(Skill, Self, _, _) -> err_ai(Skill, Self).

gen_args_60117(Target = #fighter{hp_max = HpMax,
                                 mp_max = MpMax, attr = Attr},
               Group, HpRatio) ->
    SelfPresideStatus = 0,
    SelfPresideText = "",
    TargetPresideStatus = 0,
    TargetPresideText = "",
    CombatStatistics = #combat_statistics{},
    MasterPid = 0,
    MasterFid = 0,
    MasterPos = 0,
    NewHpMax = round(HpMax * HpRatio / 1000),
    Target#fighter{hp = NewHpMax, is_die = 0,
                   hp_max = NewHpMax, mp = MpMax,
                   attr = Attr#attr{hp_max = NewHpMax}, group = Group,
                   self_preside_status = SelfPresideStatus,
                   self_preside_text = SelfPresideText,
                   target_preside_status = TargetPresideStatus,
                   target_preside_text = TargetPresideText,
                   combat_statistics = CombatStatistics,
                   master_pid = MasterPid, master_fid = MasterFid,
                   master_pos = MasterPos, buffs = [],
                   skill_cooldown = []}.

script_60118(Skill = #c_skill{skill =
                                  #skill{script_args = [Rate, HpRatio, HpBase],
                                         buff_self = BuffSelf}},
             #fighter{id = Fid, hp_max = HpMax,
                      special_attr =
                          #special_attr{save_life_times = SaveLifeTimes,
                                        has_nirvana = HasNirvana,
                                        nirvaning = Nirvaning}},
             #fighter{},
             #c_skill_addt_arg{passive_flag = revive_self}) ->
    NewRate = Rate - SaveLifeTimes * 100,
    IsNirvana = HasNirvana =:= 1 andalso Nirvaning =:= 1,
    Flag = IsNirvana =:= false andalso
               util:rand(1, 1000) =< NewRate,
    case Flag =:= true andalso
             combat_skill:is_skill_in_cooldown(Fid, Skill) =:= false
        of
        true ->
            Svc = [{save_life_times, 0, SaveLifeTimes + 1}],
            combat_cache:u(Fid, Svc),
            combat_skill:add_skill_cooldown(Fid, Skill),
            HealHp = round(HpMax * HpRatio / 1000 + HpBase),
            Ae = #action_effect{heal_hp = HealHp},
            [ReviveSelf] =
                combat_cache:get_context_elem([#combat_context.revive_self]),
            NewReviveSelf = lists:keystore(Fid,
                                           1,
                                           ReviveSelf,
                                           {Fid, Skill, Ae, BuffSelf}),
            combat_cache:save_context([{#combat_context.revive_self,
                                        NewReviveSelf}]),
            #passive_effect{};
        false -> #passive_effect{}
    end;
script_60118(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 6192),
    #passive_effect{}.

script_60119(#c_skill{skill =
                          #skill{script_args = [AntiCritRatio]}},
             #fighter{id = Fid}, #fighter{}, _SkillAddtArg) ->
    Svc = [{i_anti_crit_ratio, 0, AntiCritRatio}],
    combat_cache:u(Fid, Svc),
    #passive_effect{};
script_60119(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 6201),
    #passive_effect{}.

script_60120(#c_skill{id = SkillId,
                      skill =
                          #skill{buff_self = BuffSelf,
                                 script_args = [DefRatio]}},
             #fighter{id = Fid}, _Target = #fighter{action = Action},
             _SkillAddtArg) ->
    case Action of
        {#c_skill{skill = #skill{elem_type = 0}}, _} ->
            #passive_effect{buff_self_to_self = BuffSelf,
                            def_ratio = DefRatio,
                            show_passive_skills = [{Fid, SkillId, 1}]};
        _ -> #passive_effect{def_ratio = DefRatio}
    end;
script_60120(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 6213),
    #passive_effect{}.

script_60121(#c_skill{skill =
                          #skill{script_args = [SkillIdList, UpdateArgs]}},
             #fighter{}, #fighter{},
             #c_skill_addt_arg{passive_flag = talent}) ->
    Talents = [{SkillId, [{5, [[], UpdateArgs]}]}
               || SkillId <- SkillIdList],
    #passive_effect{talents = Talents};
script_60121(#c_skill{skill =
                          #skill{script_args = [], buff_self = BuffSelf}},
             Self, #fighter{},
             #c_skill_addt_arg{passive_flag = kill}) ->
    lists:foreach(fun (Buff) ->
                          combat_buff:buff_add(Buff, Self, Self, true)
                  end,
                  BuffSelf),
    #passive_effect{};
script_60121(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 6224),
    #passive_effect{}.

script_60122(_Skill = #c_skill{skill =
                                   #skill{script_args =
                                              [SkillIdList,
                                               UpdateArgs1,
                                               UpdateArgs2,
                                               _Rate,
                                               _ShowId]}},
             _Self = #fighter{id = _Fid, name = _Name}, _Target,
             _SkillAddtArg = #c_skill_addt_arg{passive_flag =
                                                   talent}) ->
    Talents1 = [{SkillId, [{6, [[], UpdateArgs1]}]}
                || SkillId <- SkillIdList],
    Talents2 = [{SkillId, [{5, [[], UpdateArgs2]}]}
                || SkillId <- SkillIdList],
    #passive_effect{talents = Talents1 ++ Talents2};
script_60122(_Skill = #c_skill{skill =
                                   #skill{script_args =
                                              [_SkillIdList,
                                               _UpdateArgs1,
                                               _UpdateArgs2,
                                               Rate,
                                               ShowId],
                                          buff_self = BuffSelf,
                                          buff_target = BuffTarget}},
             _Self = #fighter{id = Fid, name = _Name}, _Target,
             _SkillAddtArg = #c_skill_addt_arg{passive_flag =
                                                   defence}) ->
    case util:rand(1, 1000) =< Rate of
        false -> #passive_effect{};
        true ->
            NewBuffTarget = case length(BuffTarget) >= 1 of
                                true -> lists:nth(1, BuffTarget);
                                false -> []
                            end,
            #passive_effect{buff_self_to_self = BuffSelf,
                            buff_self_to_target = NewBuffTarget,
                            show_passive_skills = [{Fid, ShowId, 1}]}
    end;
script_60122(Skill = #c_skill{id = SkillId,
                              skill = #skill{}},
             Self = #fighter{is_die = SelfIsDie, id = Fid,
                             name = _Name, action = Action,
                             special_attr =
                                 #special_attr{multi_atk_num = MultiAtkNum}},
             _Target = #fighter{is_die = IsDie},
             #c_skill_addt_arg{passive_flag = attack_after_2}) ->
    Flag = case SelfIsDie =:= 0 andalso
                    IsDie =:= 0 andalso MultiAtkNum > 0
               of
               true ->
                   case Action of
                       {Cs = #c_skill{id = UseId}, _} ->
                           case combat_skill:base_skill(Self) of
                               UseId ->
                                   case combat_skill:is_skill_in_cooldown(Fid,
                                                                          Skill)
                                       of
                                       false -> {true, Cs, MultiAtkNum};
                                       true -> false
                                   end;
                               _ -> false
                           end;
                       _ -> false
                   end;
               _ -> false
           end,
    case Flag of
        {true, GetCs, AttackTimes} ->
            combat_skill:add_skill_cooldown(Fid, Skill, 1),
            AddShow = [{Fid, SkillId, 0}],
            [OldPass] =
                combat_cache:get_context_elem([#combat_context.passive_attack]),
            NewPass = OldPass ++ [{0, AttackTimes, AddShow, GetCs}],
            combat_cache:save_context([{#combat_context.passive_attack,
                                        NewPass}]),
            Svc = [{has_multi_atk, 0, 1}],
            combat_cache:u(Fid, Svc),
            #passive_effect{};
        false -> #passive_effect{}
    end;
script_60122(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 6275),
    #passive_effect{}.

script_60123(#c_skill{skill =
                          #skill{script_args = [HpLine, DmgRatio]}},
             _Self, #fighter{hp = Hp, hp_max = HpMax},
             #c_skill_addt_arg{}) ->
    V1 = Hp / HpMax,
    V2 = HpLine / 1000,
    Ratio = case V1 >= V2 of
                true -> DmgRatio;
                false -> 0
            end,
    #passive_effect{dmg_ratio = Ratio};
script_60123(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 6288),
    #passive_effect{}.

script_60124(#c_skill{id = SkillId,
                      skill = #skill{script_args = [HpLine, DmgRatio]}},
             #fighter{id = Sid}, #fighter{hp = Hp, hp_max = HpMax},
             #c_skill_addt_arg{}) ->
    V1 = Hp / HpMax,
    V2 = HpLine / 1000,
    Ratio = case V1 =< V2 of
                true -> DmgRatio;
                false -> 0
            end,
    case Ratio > 0 of
        true ->
            #passive_effect{dmg_ratio = Ratio,
                            show_passive_skills = [{Sid, SkillId, 1}]};
        _ -> #passive_effect{}
    end;
script_60124(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 6304),
    #passive_effect{}.

script_60125(#c_skill{id = SkillId,
                      skill = #skill{script_args = [Ratio, MaxRatio]}},
             #fighter{id = Sid,
                      attr = #attr{phy_dmg = PhyDmg, magic_dmg = MagicDmg},
                      special_attr = #special_attr{round_hurt = RoundHurt}},
             _, #c_skill_addt_arg{ext_args = _ExtArgs}) ->
    Dmg = max(PhyDmg, MagicDmg),
    MaxVal = round(Dmg * MaxRatio / 1000),
    Val = min(round(RoundHurt * Ratio / 1000), MaxVal),
    case Val > 0 of
        true ->
            #passive_effect{atk_holy_addt = Val,
                            show_passive_skills = [{Sid, SkillId, 1}]};
        _ -> #passive_effect{}
    end;
script_60125(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 6317),
    #passive_effect{}.

script_60126(#c_skill{id = SkillId,
                      skill = #skill{script_args = [DmgRatio, _]}},
             #fighter{id = Sid, order = Sorder},
             #fighter{order = Torder},
             #c_skill_addt_arg{passive_flag = attack}) ->
    case Sorder < Torder of
        true ->
            #passive_effect{dmg_ratio = DmgRatio,
                            show_passive_skills = [{Sid, SkillId, 1}]};
        false -> #passive_effect{}
    end;
script_60126(#c_skill{id = SkillId,
                      skill = #skill{script_args = [_, DefRatio]}},
             #fighter{id = Sid, order = Sorder},
             #fighter{order = Torder},
             #c_skill_addt_arg{passive_flag = defence}) ->
    case Sorder < Torder of
        true ->
            #passive_effect{def_ratio = DefRatio,
                            show_passive_skills = [{Sid, SkillId, 1}]};
        false -> #passive_effect{}
    end;
script_60126(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 6332),
    #passive_effect{}.

script_60127(#c_skill{id = _SkillId,
                      skill = #skill{script_args = [Rate, Ratio]}},
             #fighter{}, #fighter{}, _SkillAddtArg) ->
    case util:rand(1, 1000) =< Rate of
        true -> #passive_effect{float_dmg = -Ratio};
        false -> #passive_effect{}
    end;
script_60127(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 6342),
    #passive_effect{}.

script_60128(_Skill = #c_skill{skill =
                                   #skill{script_args =
                                              [SkillIdList, UpdateArgs1]}},
             _Self = #fighter{id = _Fid, name = _Name}, _Target,
             _SkillAddtArg = #c_skill_addt_arg{passive_flag =
                                                   talent}) ->
    Talents = [{SkillId, [{6, [[], UpdateArgs1]}]}
               || SkillId <- SkillIdList],
    #passive_effect{talents = Talents};
script_60128(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 6350),
    #passive_effect{}.

script_60129(_Skill = #c_skill{skill =
                                   #skill{script_args = [AddSnowVal]}},
             Self = #fighter{id = Sid, name = _Name,
                             ext_args = SelfExtArgs},
             _Target,
             _SkillAddtArg = #c_skill_addt_arg{passive_flag =
                                                   attack}) ->
    logger:debug("被动触发:", [], combat_script_skill, 6355),
    IsOneAfterOther = combat_cache:get_ext_val(Self, 4, 0),
    case IsOneAfterOther of
        1 ->
            logger:debug("触发接二连三：~w",
                         [AddSnowVal],
                         combat_script_skill,
                         6361),
            NewSelfExtArgs = combat_cache:set_ext_val(SelfExtArgs,
                                                      1,
                                                      AddSnowVal),
            combat_cache:u(Sid,
                           [{fighter_ext_args, 0, NewSelfExtArgs}, {mp, 0, 1}]),
            campaign_snow:add_snow_atk_buff_val(Self, AddSnowVal),
            Svc = [{mp, 0, 1}],
            Sc = [{1, 1, 0}],
            #passive_effect{self_val_changed = Svc,
                            self_changed = Sc};
        0 -> #passive_effect{}
    end;
script_60129(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _Else) ->
    logger:error("[~ts]触发错误的被动技能ID[~w],参数：~w",
                 [Name, SkillId, _Else],
                 combat_script_skill,
                 6374),
    #passive_effect{}.

script_60130(#c_skill{skill =
                          #skill{script_args =
                                     [_SkillList, _UpdateArgs, Ratio]}},
             #fighter{id = Fid}, #fighter{},
             #c_skill_addt_arg{passive_flag = init}) ->
    Svc = [{anti_dmg_ratio, 1, Ratio},
           {fixed_feedback, 1, 1}],
    combat_cache:u(Fid, Svc),
    #passive_effect{};
script_60130(#c_skill{skill =
                          #skill{script_args =
                                     [SkillIdList, UpdateArgs, _Ratio]}},
             #fighter{}, #fighter{},
             #c_skill_addt_arg{passive_flag = talent}) ->
    Talents = [{SkillId, [{14, [UpdateArgs]}]}
               || SkillId <- SkillIdList],
    #passive_effect{talents = Talents};
script_60130(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 6386),
    #passive_effect{}.

script_60131(#c_skill{skill =
                          #skill{script_args = [SkillTypeList, DecDefRatio]}},
             _Self = #fighter{}, #fighter{type = TargetType},
             _SkillAddtArg) ->
    case lists:member(TargetType, SkillTypeList) of
        true ->
            #passive_effect{dec_phy_def_ratio = DecDefRatio,
                            dec_magic_def_ratio = DecDefRatio};
        false -> #passive_effect{}
    end;
script_60131(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 6397),
    #passive_effect{}.

script_60132(#c_skill{skill =
                          #skill{script_args = [SkillIdList],
                                 buff_self = BuffSelf}},
             #fighter{passive_skills = PassiveSkills}, #fighter{},
             _SkillAddtArg) ->
    case combat_util:check_contain_skilll(PassiveSkills,
                                          SkillIdList)
        of
        true -> #passive_effect{buff_self_to_self = BuffSelf};
        false -> #passive_effect{}
    end;
script_60132(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 6409),
    #passive_effect{}.

script_60133(#c_skill{skill =
                          #skill{script_args = [], buff_self = BuffSelf}},
             Self, #fighter{}, _SkillAddtArg) ->
    lists:foreach(fun (Buff) ->
                          combat_buff:buff_add(Buff, Self, Self)
                  end,
                  BuffSelf),
    #passive_effect{};
script_60133(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 6417),
    #passive_effect{}.

script_60134(#c_skill{skill =
                          #skill{id = SkillId, script_args = [HealHpRatio],
                                 buff_self = BuffSelf}},
             Self = #fighter{id = Fid, lev = Lev},
             #fighter{id = Tid}, _SkillAddtArg) ->
    case combat_cache:f(by_id, Tid) of
        #fighter{is_die = 1} ->
            lists:foreach(fun (Buff) ->
                                  combat_buff:buff_add(Buff, Self, Self, true)
                          end,
                          BuffSelf),
            HealHp = HealHpRatio * Lev,
            Svc = [{hp, 1, HealHp}],
            Sc = [{0, HealHp, 0}],
            #passive_effect{self_changed = Sc,
                            self_val_changed = Svc,
                            buff_self_to_self = BuffSelf,
                            show_passive_skills = [{Fid, SkillId, 1}]};
        _ -> #passive_effect{}
    end;
script_60134(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 6434),
    #passive_effect{}.

script_60135(#c_skill{skill =
                          #skill{id = SkillId, script_args = [],
                                 buff_self = BuffSelf}},
             Self = #fighter{id = Sid}, #fighter{}, _SkillAddtArg) ->
    lists:foreach(fun (Buff) ->
                          combat_buff:buff_add(Buff, Self, Self, true)
                  end,
                  BuffSelf),
    #passive_effect{show_passive_skills =
                        [{Sid, SkillId, 1}]};
script_60135(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 6445),
    #passive_effect{}.

script_60136(#c_skill{skill =
                          #skill{script_args = [Ratio, HurtRatio]}},
             #fighter{id = Sid}, #fighter{}, _SkillAddtArg) ->
    logger:debug("协助技能初始化:~w",
                 [{Ratio, HurtRatio}],
                 combat_script_skill,
                 6450),
    combat_cache:u(Sid,
                   [{assist_atk_ratio, 1, Ratio},
                    {assist_atk_hurt_ratio, 1, HurtRatio}]),
    #passive_effect{flag = 1};
script_60136(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 6454),
    #passive_effect{}.

script_60137(#c_skill{skill =
                          #skill{script_args = [_Rate, _HpBase]}},
             #fighter{id = Sid}, #fighter{},
             #c_skill_addt_arg{passive_flag = init}) ->
    Svc = [{has_revive_self, 0, 1}],
    combat_cache:u(Sid, Svc),
    #passive_effect{};
script_60137(Skill = #c_skill{skill =
                                  #skill{script_args = [Rate, HpBase],
                                         buff_self = BuffSelf}},
             #fighter{id = Fid,
                      special_attr =
                          _S = #special_attr{has_nirvana = HasNirvana,
                                             nirvaning = Nirvaning}},
             #fighter{},
             #c_skill_addt_arg{passive_flag = revive_self_2}) ->
    IsNirvana = HasNirvana =:= 1 andalso Nirvaning =:= 1,
    Flag = IsNirvana =:= false andalso
               util:rand(1, 1000) =< Rate,
    [ReviveSelf] =
        combat_cache:get_context_elem([#combat_context.revive_self]),
    IsReviving = lists:keymember(Fid, 1, ReviveSelf),
    case Flag =:= true andalso
             combat_skill:is_skill_in_cooldown(Fid, Skill) =:= false
                 andalso IsReviving =:= false
        of
        true ->
            combat_skill:add_skill_cooldown(Fid, Skill),
            HealHp = HpBase,
            Ae = #action_effect{heal_hp = HealHp},
            Svc = [{is_radiance, 0, 1}],
            combat_cache:u(Fid, Svc),
            NewReviveSelf = lists:keystore(Fid,
                                           1,
                                           ReviveSelf,
                                           {Fid, Skill, Ae, BuffSelf}),
            combat_cache:save_context([{#combat_context.revive_self,
                                        NewReviveSelf}]),
            #passive_effect{};
        false -> #passive_effect{}
    end;
script_60137(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 6482),
    #passive_effect{}.

script_60138(_Skill = #c_skill{skill =
                                   #skill{script_args = [Multi, Base]}},
             #fighter{lev = Lev}, #fighter{},
             #c_skill_addt_arg{passive_flag = defence}) ->
    PhyDmgDec = round(Lev * Multi / 10 + Base),
    #passive_effect{phy_dmg_dec = PhyDmgDec};
script_60138(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 6490),
    #passive_effect{}.

script_60139(_Skill = #c_skill{skill =
                                   #skill{script_args =
                                              [_, _, MagicHurtRatio]}},
             #fighter{id = Sid}, #fighter{},
             #c_skill_addt_arg{passive_flag = init}) ->
    Svc = [{i_magic_hurt_ratio, 1, MagicHurtRatio}],
    combat_cache:u(Sid, Svc),
    #passive_effect{};
script_60139(_Skill = #c_skill{skill =
                                   #skill{script_args = [Multi, Base, _]}},
             #fighter{lev = Lev}, #fighter{},
             #c_skill_addt_arg{passive_flag = attack}) ->
    DecPhyDef = round(Lev * Multi / 10 + Base),
    #passive_effect{dec_phy_def = DecPhyDef};
script_60139(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 6502),
    #passive_effect{}.

script_60140(_Skill = #c_skill{skill =
                                   #skill{script_args = [Multi, Base]}},
             #fighter{lev = Lev}, #fighter{type = Ttype},
             #c_skill_addt_arg{passive_flag = defence}) ->
    case Ttype =:= 1 orelse Ttype =:= 4 of
        true ->
            DmgExt = -round(Lev * Multi / 10 + Base),
            #passive_effect{dmg_ext = DmgExt};
        _ -> #passive_effect{}
    end;
script_60140(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 6515),
    #passive_effect{}.

script_60141(_Skill = #c_skill{skill =
                                   #skill{script_args = [Multi, Base]}},
             #fighter{lev = Lev}, #fighter{type = Ttype},
             #c_skill_addt_arg{passive_flag = attack}) ->
    case Ttype =:= 1 orelse Ttype =:= 4 of
        true ->
            DmgExt = round(Lev * Multi / 10 + Base),
            #passive_effect{dmg_ext = DmgExt};
        _ -> #passive_effect{}
    end;
script_60141(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 6528),
    #passive_effect{}.

script_60142(Skill = #c_skill{id = SkillId,
                              skill = #skill{script_args = [Ratio, HurtRatio]}},
             #fighter{id = Sid}, #fighter{}, _SkillAddtArg) ->
    case combat_skill:is_skill_in_cooldown(Sid, Skill) of
        false ->
            case util:rand(1, 1000) =< Ratio of
                true ->
                    combat_skill:add_skill_cooldown(Sid, Skill, 1),
                    #passive_effect{hurt_multi = -HurtRatio,
                                    show_passive_skills = [{Sid, SkillId, 1}]};
                _ -> #passive_effect{}
            end;
        _ -> #passive_effect{}
    end;
script_60142(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 6546),
    #passive_effect{}.

script_60143(_Skill = #c_skill{skill =
                                   #skill{script_args = [_]}},
             #fighter{id = Sid}, #fighter{},
             #c_skill_addt_arg{passive_flag = init}) ->
    Svc = [{i_atk_not_anger, 0, 1}],
    combat_cache:u(Sid, Svc),
    #passive_effect{};
script_60143(Skill = #c_skill{id = SkillId,
                              skill = #skill{script_args = [DecAnger]}},
             #fighter{id = Fid}, #fighter{type = Ttype},
             #c_skill_addt_arg{passive_flag = attack}) ->
    case Ttype =:= 1 of
        true ->
            case combat_skill:is_skill_in_cooldown(Fid, Skill) of
                false ->
                    Tvc = [{anger, 1, -DecAnger}],
                    Tc = [{9, -DecAnger, 0}],
                    combat_skill:add_skill_cooldown(Fid, Skill, 1),
                    #passive_effect{target_val_changed = Tvc,
                                    target_changed = Tc,
                                    show_passive_skills = [{Fid, SkillId, 1}]};
                _ -> #passive_effect{}
            end;
        _ -> #passive_effect{}
    end;
script_60143(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 6570),
    #passive_effect{}.

script_60144(#c_skill{skill =
                          #skill{script_args = [Ratio, _DefRatio]}},
             #fighter{}, #fighter{},
             #c_skill_addt_arg{passive_flag = attack}) ->
    #passive_effect{dec_phy_def_ratio = Ratio};
script_60144(#c_skill{skill =
                          #skill{script_args = [_Ratio, DefRatio]}},
             #fighter{}, #fighter{},
             #c_skill_addt_arg{passive_flag = defence}) ->
    #passive_effect{def_ratio = DefRatio};
script_60144(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 6579),
    #passive_effect{}.

script_60145(Skill = #c_skill{id = SkillId,
                              skill =
                                  #skill{script_args = [Rate, _, _],
                                         buff_self = BuffSelf,
                                         buff_target = BuffTarget}},
             _Self = #fighter{id = Fid, name = _Name}, _Target,
             #c_skill_addt_arg{passive_flag = defence}) ->
    case combat_skill:is_skill_in_cooldown(Fid, Skill) of
        false ->
            case util:rand(1, 1000) =< Rate of
                false -> #passive_effect{};
                true ->
                    NewBuffTarget = case length(BuffTarget) >= 1 of
                                        true -> lists:nth(1, BuffTarget);
                                        false -> []
                                    end,
                    combat_skill:add_skill_cooldown(Fid, Skill),
                    #passive_effect{buff_self_to_self = BuffSelf,
                                    buff_self_to_target = NewBuffTarget,
                                    show_passive_skills = [{Fid, SkillId, 1}]}
            end;
        true -> #passive_effect{}
    end;
script_60145(#c_skill{id = SkillId,
                      skill = #skill{script_args = [_, Rate, Ratio]}},
             _Self = #fighter{id = Fid, action = Action}, _Target,
             #c_skill_addt_arg{passive_flag = attack}) ->
    case Action of
        {#c_skill{skill = #skill{elem_type = 1}}, _} ->
            case util:rand(1, 1000) =< Rate of
                false -> #passive_effect{};
                true ->
                    #passive_effect{suck_hp = Ratio,
                                    show_passive_skills = [{Fid, SkillId, 1}]}
            end;
        _ -> #passive_effect{}
    end;
script_60145(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 6611),
    #passive_effect{}.

script_60146(#c_skill{skill =
                          #skill{script_args = [_, _, Ratio]}},
             #fighter{id = Fid}, #fighter{},
             #c_skill_addt_arg{passive_flag = init}) ->
    Svc = [{i_hit_ratio, 1, Ratio * 10}],
    combat_cache:u(Fid, Svc),
    #passive_effect{};
script_60146(Skill = #c_skill{skill =
                                  #skill{id = Id, buff_self = BuffSelf}},
             #fighter{id = Sid}, #fighter{},
             #c_skill_addt_arg{passive_flag = pre_action}) ->
    case BuffSelf of
        [] -> #passive_effect{};
        _ ->
            case combat_skill:is_skill_in_cooldown(Sid, Skill) of
                false ->
                    combat_skill:add_skill_cooldown(Sid, Skill),
                    #passive_effect{buff_self_to_self = BuffSelf,
                                    show_passive_skills = [{Sid, Id, 0}],
                                    flag = 1};
                _Else -> #passive_effect{}
            end
    end;
script_60146(#c_skill{skill =
                          #skill{script_args =
                                     [SkillIdList, UpdateArgs, _Ratio]}},
             #fighter{}, #fighter{},
             #c_skill_addt_arg{passive_flag = talent}) ->
    Talents = [{SkillId, [{14, [UpdateArgs]}]}
               || SkillId <- SkillIdList],
    #passive_effect{talents = Talents};
script_60146(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 6637),
    #passive_effect{}.

script_60147(#c_skill{skill =
                          #skill{script_args = [Ratio]}},
             #fighter{}, _Target, _SkillAddtArg) ->
    #passive_effect{dmg_ratio_add = Ratio};
script_60147(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 6643),
    #passive_effect{}.

script_60148(#c_skill{skill =
                          #skill{script_args = [BaseId, RatioList]}},
             #fighter{id = Sid, group = Group}, _Target,
             _SkillAddtArg) ->
    AllLiving = combat_cache:all_living(Group),
    Len = length([1
                  || #fighter{id = Fid, type = 3, base_id = Bid}
                         <- AllLiving,
                     Fid =/= Sid andalso Bid =:= BaseId]),
    case Len > 0 of
        true ->
            case lists:keyfind(Len, 1, RatioList) of
                {_, Ratio} -> #passive_effect{dmg_ratio = -Ratio};
                _ -> #passive_effect{}
            end;
        _ -> #passive_effect{}
    end;
script_60148(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 6659),
    #passive_effect{}.

script_60149(#c_skill{skill =
                          #skill{script_args = [_, AntiRatio]}},
             #fighter{id = Fid}, #fighter{},
             #c_skill_addt_arg{passive_flag = init}) ->
    Svc = [{anti_ratio, 1, AntiRatio}],
    combat_cache:u(Fid, Svc),
    #passive_effect{};
script_60149(Skill = #c_skill{id = SkillId,
                              skill =
                                  #skill{script_args = [Rate, _],
                                         buff_target = BuffTarget}},
             Self = #fighter{id = Sid, group = Sgroup}, #fighter{},
             #c_skill_addt_arg{passive_flag = die_effect}) ->
    case util:rand(1, 1000) =< Rate of
        false -> #passive_effect{};
        true ->
            case combat_skill:is_skill_in_cooldown(Sid, Skill) of
                false ->
                    case combat_util:get_not_die_label(Sid,
                                                       Sgroup,
                                                       [Sid],
                                                       [],
                                                       min_hp)
                        of
                        Target = #fighter{} ->
                            combat_skill:add_skill_cooldown(Sid, Skill),
                            NewBuffTarget = case length(BuffTarget) >= 1 of
                                                true ->
                                                    lists:nth(1, BuffTarget);
                                                false -> []
                                            end,
                            lists:foreach(fun (Buff) ->
                                                  combat_buff:buff_add(Buff,
                                                                       Self,
                                                                       Target)
                                          end,
                                          NewBuffTarget),
                            #passive_effect{show_passive_skills =
                                                [{Sid, SkillId, 1}]};
                        _ -> #passive_effect{}
                    end;
                _ -> #passive_effect{}
            end
    end;
script_60149(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 6691),
    #passive_effect{}.

script_60150(_Skill, _Self = #fighter{}, _, _) ->
    #passive_effect{}.

script_60151(_Skill = #c_skill{skill =
                                   #skill{script_args =
                                              [_SkipSkil,
                                               _DelBuff,
                                               HurtRatio]}},
             Self = #fighter{}, _,
             #c_skill_addt_arg{passive_flag = attack}) ->
    case combat_cache:get_ext_val(Self, 6, 0) of
        1 -> #passive_effect{dmg_ratio_add = HurtRatio};
        _ -> #passive_effect{}
    end;
script_60151(_Skill = #c_skill{id = _SkillId,
                               skill =
                                   #skill{script_args = [SkipSkil, DelBuff, _],
                                          buff_target = _BuffTarget}},
             _Self = #fighter{id = Sid, action = Action,
                              buffs = Buffs},
             _, _) ->
    case Action of
        {_Cs = #c_skill{id = UseId}, _} ->
            case lists:member(UseId, SkipSkil) of
                false ->
                    ClearBuff = lists:filter(fun (#c_buff{id = Bfid}) ->
                                                     lists:member(Bfid, DelBuff)
                                             end,
                                             Buffs),
                    lists:foreach(fun (Buff) ->
                                          combat_buff:buff_del(Sid, Buff)
                                  end,
                                  ClearBuff);
                _ -> skip
            end;
        _ -> skip
    end,
    #passive_effect{}.

script_60152(Skill = #c_skill{skill =
                                  #skill{script_args = [Ratio]}},
             _Self = #fighter{id = Fid}, _,
             #c_skill_addt_arg{ext_args = ExtArgs}) ->
    case lists:keyfind(passive_attack_type, 1, ExtArgs) of
        {_, phy} ->
            case combat_skill:is_skill_in_cooldown(Fid, Skill) of
                false ->
                    combat_skill:add_skill_cooldown(Fid, Skill, 1),
                    #passive_effect{suck_hp = Ratio};
                _ -> #passive_effect{}
            end;
        {_, magic} -> #passive_effect{suck_hp = Ratio};
        _ -> #passive_effect{}
    end;
script_60152(_Skill, _Self = #fighter{}, _, _) ->
    logger:debug("触发60152", [], combat_script_skill, 6752),
    #passive_effect{}.

script_60153(_Skill = #c_skill{skill =
                                   #skill{id = SkillId, script_args = [Rate],
                                          buff_self = BuffSelf}},
             _Self = #fighter{id = Fid, name = _Name}, _Target,
             _SkillAddtArg = #c_skill_addt_arg{passive_flag =
                                                   defence}) ->
    case util:rand(1, 1000) =< Rate of
        false -> #passive_effect{};
        true ->
            logger:debug("==========增加怒气并加buff脚本buff:~w",
                         [BuffSelf],
                         combat_script_skill,
                         6761),
            #passive_effect{buff_self_to_self = BuffSelf,
                            show_passive_skills = [{Fid, SkillId, 1}]}
    end;
script_60153(#c_skill{skill =
                          #skill{buff_self = BuffSelf}},
             #fighter{id = Fid, name = _Name, action = Action},
             _Target,
             #c_skill_addt_arg{passive_flag = attack_after_2}) ->
    Flag = case Action of
               {#c_skill{skill = #skill{sub_type = SkillSubType}}, _}
                   when SkillSubType =:= 0 orelse SkillSubType =:= 2 ->
                   true;
               _ -> false
           end,
    case Flag of
        true ->
            logger:debug("==========删除错误:~w",
                         [BuffSelf],
                         combat_script_skill,
                         6773),
            [combat_buff:buff_del(Fid, Fid, Buff)
             || Buff <- BuffSelf],
            #passive_effect{};
        false -> #passive_effect{}
    end;
script_60153(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 6781),
    #passive_effect{}.

script_60154(#c_skill{skill =
                          #skill{buff_self = BuffSelf}},
             Self = #fighter{}, _Target,
             #c_skill_addt_arg{passive_flag = attack_after_2}) ->
    case
        combat_cache:get_context_elem([#combat_context.skill_crit])
        of
        [true] ->
            lists:foreach(fun (Buff) ->
                                  combat_buff:buff_add(Buff, Self, Self)
                          end,
                          BuffSelf),
            #passive_effect{};
        _ -> #passive_effect{}
    end;
script_60154(_Skill, _Self, _, _) -> #passive_effect{}.

script_60155(#c_skill{skill =
                          #skill{script_args = [Ratio, BuffLists]}},
             _Self = #fighter{id = Sid, buffs = Buffs}, _Target,
             _) ->
    case util:rand(1, 1000) =< Ratio of
        true ->
            [combat_buff:buff_del(Sid, Sid, Buff)
             || Buff = #c_buff{id = BuffId} <- Buffs,
                lists:member(BuffId, BuffLists)];
        _ -> ok
    end,
    #passive_effect{};
script_60155(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 6818),
    #passive_effect{}.

script_60156(#c_skill{skill =
                          #skill{buff_self = BuffSelf}},
             _Self = #fighter{id = Sid}, _Target,
             #c_skill_addt_arg{passive_flag = attack_after_2}) ->
    case
        combat_cache:get_context_elem([#combat_context.skill_crit])
        of
        [true] ->
            lists:foreach(fun (Buff) ->
                                  combat_buff:buff_del(Sid, Sid, Buff)
                          end,
                          BuffSelf),
            #passive_effect{};
        _ -> #passive_effect{}
    end;
script_60156(#c_skill{skill =
                          #skill{buff_self = BuffSelf}},
             Self = #fighter{}, _Target,
             #c_skill_addt_arg{passive_flag = action_end}) ->
    case
        combat_cache:get_context_elem([#combat_context.skill_crit])
        of
        [true] -> #passive_effect{};
        _ ->
            lists:foreach(fun (Buff) ->
                                  combat_buff:buff_add(Buff, Self, Self)
                          end,
                          BuffSelf),
            #passive_effect{}
    end;
script_60156(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 6841),
    #passive_effect{}.

script_60157(Skill = #c_skill{skill =
                                  #skill{id = SkillId,
                                         script_args =
                                             [Count, Ratio, HpBase, HpRatio]}},
             Self = #fighter{id = Sid, group = Sgroup}, _Target,
             _) ->
    case util:rand(1, 1000) =< Ratio of
        false -> #passive_effect{};
        true ->
            case combat_skill:is_skill_in_cooldown(Sid, Skill) of
                false ->
                    case combat_util:get_not_die_label_count(Sid,
                                                             Sgroup,
                                                             [Sid],
                                                             [],
                                                             min_hp,
                                                             Count)
                        of
                        TargetList = [_ | _] ->
                            combat_skill:add_skill_cooldown(Sid, Skill),
                            Fun = fun (Tf = #fighter{id = TFid,
                                                     hp_max = HpMax}) ->
                                          HpVal = round(HpBase +
                                                            HpRatio * HpMax /
                                                                1000),
                                          Tvc = [{hp, 1, HpVal}],
                                          Tc = [{0, HpVal, 0}],
                                          combat_cache:u(TFid, Tvc),
                                          DieEffect =
                                              combat_play:gen_sub_skill_play(die_master_effect,
                                                                             {Self,
                                                                              Tf,
                                                                              Tc,
                                                                              1,
                                                                              0,
                                                                              [{Sid,
                                                                                SkillId,
                                                                                1}]}),
                                          combat_play:add_sub_play(DieEffect)
                                  end,
                            lists:foreach(Fun, TargetList),
                            #passive_effect{show_passive_skills =
                                                [{Sid, SkillId, 1}]};
                        _ -> #passive_effect{}
                    end;
                _ -> #passive_effect{}
            end
    end;
script_60157(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 6873),
    #passive_effect{}.

script_60158(#c_skill{skill =
                          #skill{script_args = [Ratio, DecDefRatio]}},
             #fighter{group = Sgroup}, _Target, _) ->
    DieCount = length([true
                       || #fighter{type = Type, is_escape = 0, is_die = 1}
                              <- combat_cache:all(Sgroup),
                          Type =:= 1 orelse Type =:= 5 orelse Type =:= 4]),
    DmgRatio = DieCount * Ratio,
    #passive_effect{dmg_ratio = DmgRatio,
                    dec_def_ratio = DecDefRatio};
script_60158(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 6883),
    #passive_effect{}.

script_60159(#c_skill{skill =
                          #skill{script_args = [_, _, MaxAttackRate]}},
             #fighter{id = Sid,
                      attr = #attr{phy_dmg = PhyDmg, magic_dmg = MagicDmg},
                      action = Action,
                      special_attr =
                          #special_attr{elem_dmg_absorb = AbsorbDmg}},
             _Target, #c_skill_addt_arg{passive_flag = attack}) ->
    MaxDmg = case Action of
                 {#c_skill{skill = #skill{elem_type = 0}}, _} ->
                     round(PhyDmg * MaxAttackRate / 1000);
                 _ -> round(MagicDmg * MaxAttackRate / 1000)
             end,
    DmgAdd = min(AbsorbDmg, MaxDmg),
    logger:debug("吸收的伤害:~w",
                 [DmgAdd],
                 combat_script_skill,
                 6896),
    Svc = [{elem_dmg_absorb, 0, 0}],
    combat_cache:u(Sid, Svc),
    #passive_effect{atk_holy_addt = DmgAdd};
script_60159(Skill = #c_skill{skill =
                                  #skill{id = SkillId,
                                         script_args =
                                             [Ratio, DmgSuckRatio, _]}},
             #fighter{id = Sid, buffs = Buffs},
             _Target = #fighter{action = Action},
             #c_skill_addt_arg{passive_flag = defence}) ->
    ElemType = case Action of
                   {#c_skill{skill = #skill{elem_type = _ElemType}}, _} ->
                       _ElemType;
                   _ -> 0
               end,
    case combat_skill:is_skill_in_cooldown(Sid, Skill) of
        true -> #passive_effect{};
        _ ->
            case util:rand(1, 1000) =< Ratio of
                true when ElemType =:= 1 ->
                    logger:debug("buff:~w",
                                 [Buffs],
                                 combat_script_skill,
                                 6913),
                    case [1
                          || #c_buff{script_id = ScriptId} <- Buffs,
                             lists:member(ScriptId,
                                          [120000, 120001, 120010, 120011])]
                        of
                        [_ | _] ->
                            logger:debug("有护盾buff,不触发元素护盾:",
                                         [],
                                         combat_script_skill,
                                         6916),
                            #passive_effect{};
                        _ ->
                            combat_skill:add_skill_cooldown(Sid, Skill, 1),
                            logger:debug("触发元素护盾",
                                         [],
                                         combat_script_skill,
                                         6920),
                            Svc = [{absorb_shield_type, 0, 1},
                                   {absorb_shield, 0, 0},
                                   {absorb_shield_suck, 0, DmgSuckRatio}],
                            combat_cache:u(Sid, Svc),
                            #passive_effect{show_passive_skills =
                                                [{Sid, SkillId, 1}]}
                    end;
                _ ->
                    logger:debug("没触发元素=======",
                                 [],
                                 combat_script_skill,
                                 6929),
                    #passive_effect{}
            end
    end;
script_60159(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _Attack) ->
    logger:error("[~ts]触发错误的被动技能ID[~w], ~w",
                 [Name, SkillId, _Attack],
                 combat_script_skill,
                 6934),
    #passive_effect{}.

script_60160(#c_skill{skill =
                          #skill{script_args =
                                     [_SkillList,
                                      _DmgRatio,
                                      _SkillDmgRatio,
                                      HitRatio]}},
             #fighter{id = Sid}, _Target = #fighter{},
             #c_skill_addt_arg{passive_flag = init}) ->
    Svc = [{i_hit_ratio, 1, HitRatio * 10}],
    combat_cache:u(Sid, Svc),
    #passive_effect{};
script_60160(#c_skill{skill =
                          #skill{id = SkillId,
                                 script_args =
                                     [SkillList, DmgRatio, SkillDmgRatio, _]}},
             #fighter{id = Sid, action = Action, lev = Lev},
             _Target = #fighter{hp_max = HpMax},
             #c_skill_addt_arg{passive_flag = attack}) ->
    logger:debug("触发被动:~w",
                 [SkillList],
                 combat_script_skill,
                 6945),
    case Action of
        {#c_skill{skill = #skill{id = 1000}}, _} ->
            case util:rand_list(SkillList, 1) of
                {_, SkillId, _} ->
                    #passive_effect{dmg_ratio = DmgRatio};
                {_, 60515, [Ratio]} ->
                    logger:debug("触发被动:~w",
                                 [60515],
                                 combat_script_skill,
                                 6953),
                    #passive_effect{dmg_ratio = SkillDmgRatio,
                                    dec_def_ratio = Ratio,
                                    show_passive_skills =
                                        [{Sid, 60515, 3}, {Sid, 86121, 1}]};
                {_, 60516, [{HpRatio, LevRatio}, BuffList]} ->
                    CBuffToTarget =
                        combat_script_buff:convert_buff(BuffList),
                    logger:debug("触发被动:~w",
                                 [CBuffToTarget],
                                 combat_script_skill,
                                 6957),
                    DmgAdd = min(Lev * LevRatio,
                                 round(HpMax * HpRatio / 1000)),
                    #passive_effect{dmg_ratio = SkillDmgRatio,
                                    atk_holy_addt = DmgAdd,
                                    buff_self_to_target = CBuffToTarget,
                                    show_passive_skills =
                                        [{Sid, 60516, 3}, {Sid, 86121, 1}]};
                _ -> #passive_effect{dmg_ratio = DmgRatio}
            end;
        _ -> #passive_effect{}
    end;
script_60160(_Skill = #c_skill{id = SkillId,
                               skill = #skill{script_args = Args}},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w], 技能参数:[~w]",
                 [Name, SkillId, Args],
                 combat_script_skill,
                 6967),
    #passive_effect{}.

script_60161(Skill = #c_skill{skill =
                                  #skill{script_args =
                                             [Ratio, DmgRatio, InjuryRatio]}},
             #fighter{id = Fid}, #fighter{}, _) ->
    case combat_skill:is_skill_in_cooldown(Fid, Skill) of
        false ->
            case util:rand(1, 1000) =< Ratio of
                true ->
                    combat_skill:add_skill_cooldown(Fid, Skill, 1),
                    #passive_effect{dmg_ratio = DmgRatio,
                                    injury_ratio = InjuryRatio};
                _ -> #passive_effect{}
            end;
        _ -> #passive_effect{}
    end;
script_60161(#c_skill{id = SkillId,
                      skill = #skill{script_args = Args}},
             #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w], 技能参数:[~w]",
                 [Name, SkillId, Args],
                 combat_script_skill,
                 6984),
    #passive_effect{}.

script_60162(#c_skill{skill =
                          #skill{id = SkillId, script_args = [IgnoreRatio]}},
             #fighter{id = Tid}, #fighter{},
             #c_skill_addt_arg{passive_flag = defence}) ->
    case util:rand(1, 1000) =< IgnoreRatio of
        true ->
            #passive_effect{tar_ignore_die_ratio = IgnoreRatio,
                            show_passive_skills = [{Tid, SkillId, 2}]};
        _ -> #passive_effect{}
    end;
script_60162(#c_skill{id = SkillId,
                      skill = #skill{script_args = Args}},
             #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w], 技能参数:[~w]",
                 [Name, SkillId, Args],
                 combat_script_skill,
                 6995),
    #passive_effect{}.

script_60163(#c_skill{skill =
                          #skill{script_args =
                                     [MpRatio1,
                                      MpRatio2,
                                      MpRatio3,
                                      DmpRatio1,
                                      DmpRatio2,
                                      DmpRatio3]}},
             #fighter{}, #fighter{mp = Mp, mp_max = MpMax},
             #c_skill_addt_arg{}) ->
    MpRatio = round(Mp * 1000 / MpMax),
    DmgRatio = if MpRatio =< MpRatio3 -> DmpRatio3;
                  MpRatio =< MpRatio2 -> DmpRatio2;
                  MpRatio =< MpRatio1 -> DmpRatio1;
                  true -> DmpRatio1
               end,
    #passive_effect{dmg_ratio = DmgRatio};
script_60163(#c_skill{id = SkillId,
                      skill = #skill{script_args = Args}},
             #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w], 技能参数:[~w]",
                 [Name, SkillId, Args],
                 combat_script_skill,
                 7009),
    #passive_effect{}.

script_60164(#c_skill{skill =
                          #skill{script_args = [DmgRatio, _ChangeSkillId]}},
             #fighter{special_status =
                          #special_status{is_stealth = IsStealth}},
             _Target = #fighter{},
             #c_skill_addt_arg{passive_flag = attack}) ->
    AddDmgRatio = case IsStealth of
                      1 -> DmgRatio;
                      _ -> 0
                  end,
    #passive_effect{dmg_ratio = AddDmgRatio};
script_60164(#c_skill{skill =
                          #skill{buff_self = Buffs}},
             Self = #fighter{}, _Target = #fighter{},
             #c_skill_addt_arg{passive_flag = attack_after_2}) ->
    case
        combat_cache:get_context_elem([#combat_context.kill_someone])
        of
        [true] ->
            combat_buff:buff_add(Buffs, Self, Self),
            #passive_effect{};
        _Else -> #passive_effect{}
    end;
script_60164(_Skill = #c_skill{id = SkillId,
                               skill = #skill{script_args = Args}},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w], 技能参数:[~w]",
                 [Name, SkillId, Args],
                 combat_script_skill,
                 7030),
    #passive_effect{}.

script_60165(#c_skill{skill =
                          #skill{script_args = [HpRatio, MagicSuck]}},
             #fighter{}, _Target = #fighter{hp = Hp, hp_max = HpMax},
             #c_skill_addt_arg{passive_flag = attack}) ->
    case round(Hp / HpMax * 1000) < HpRatio of
        true -> #passive_effect{suck_hp = MagicSuck};
        _ -> #passive_effect{}
    end;
script_60165(_Skill = #c_skill{id = SkillId,
                               skill = #skill{script_args = Args}},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w], 技能参数:[~w]",
                 [Name, SkillId, Args],
                 combat_script_skill,
                 7042),
    #passive_effect{}.

script_60166(Skill = #c_skill{skill =
                                  #skill{id = Id, script_args = [Rate],
                                         buff_self = BuffSelf}},
             #fighter{id = Sid}, #fighter{},
             #c_skill_addt_arg{passive_flag = pre_action}) ->
    case BuffSelf of
        [] -> #passive_effect{};
        _ ->
            case util:rand(1, 1000) =< Rate of
                true ->
                    logger:debug("增加buff:~w",
                                 [BuffSelf],
                                 combat_script_skill,
                                 7053),
                    case combat_skill:is_skill_in_cooldown(Sid, Skill) of
                        false ->
                            logger:debug("增加buff:~w",
                                         [BuffSelf],
                                         combat_script_skill,
                                         7056),
                            combat_skill:add_skill_cooldown(Sid, Skill),
                            #passive_effect{buff_self_to_self = BuffSelf,
                                            show_passive_skills =
                                                [{Sid, Id, 0}],
                                            flag = 1};
                        _Else -> #passive_effect{}
                    end;
                _ -> #passive_effect{}
            end
    end;
script_60166(_Skill = #c_skill{id = SkillId,
                               skill = #skill{script_args = Args}},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w], 技能参数:[~w]",
                 [Name, SkillId, Args],
                 combat_script_skill,
                 7067),
    #passive_effect{}.

script_60167(#c_skill{skill =
                          #skill{script_args = [SkillList]}},
             #fighter{id = Sid}, #fighter{action = Action},
             #c_skill_addt_arg{})
    when is_list(SkillList) ->
    case Action of
        {#c_skill{skill = #skill{id = SkillId}}, _} ->
            case lists:member(SkillId, SkillList) of
                true -> #passive_effect{};
                _ ->
                    Svc = [{absorb_shield_type, 0, 1},
                           {absorb_shield, 0, 0},
                           {absorb_shield_suck, 0, 1}],
                    combat_cache:u(Sid, Svc),
                    #passive_effect{}
            end;
        _ -> #passive_effect{}
    end;
script_60167(_Skill = #c_skill{id = SkillId,
                               skill = #skill{script_args = Args}},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w], 技能参数:[~w]",
                 [Name, SkillId, Args],
                 combat_script_skill,
                 7089),
    #passive_effect{}.

script_60168(#c_skill{skill =
                          #skill{script_args = [RandBuff]}},
             Self = #fighter{id = Sid}, #fighter{},
             #c_skill_addt_arg{}) ->
    case util:rand_list(RandBuff, 3) of
        {BuffList, Group, _Rate, ShowSkillId} ->
            logger:debug("触发被动脚本60168:~w",
                         [{BuffList, Group, _Rate, ShowSkillId}],
                         combat_script_skill,
                         7096),
            SideFighters = combat_cache:all(Group),
            Buffs = combat_script_buff:convert_buff(BuffList),
            [combat_buff:buff_add(Buffs, Self, T)
             || T = #fighter{} <- SideFighters],
            ShowPassiveSkills = case ShowSkillId =/= 0 of
                                    true -> [{Sid, ShowSkillId, 1}];
                                    _ -> []
                                end,
            #passive_effect{show_passive_skills =
                                ShowPassiveSkills};
        _ -> #passive_effect{}
    end;
script_60168(_Skill = #c_skill{id = SkillId,
                               skill = #skill{script_args = Args}},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w], 技能参数:[~w]",
                 [Name, SkillId, Args],
                 combat_script_skill,
                 7109),
    #passive_effect{}.

script_60169(Skill = #c_skill{id = SkillId,
                              skill =
                                  #skill{script_args = [Rate],
                                         buff_self = BuffSelf,
                                         buff_target = BuffTarget}},
             _Self = #fighter{id = Fid}, _Target, _SkillAddtArg) ->
    case combat_skill:is_skill_in_cooldown(Fid, Skill) of
        false ->
            combat_skill:add_skill_cooldown(Fid, Skill, 1),
            case util:rand(1, 1000) =< Rate of
                false -> #passive_effect{};
                true ->
                    NewBuffTarget = case length(BuffTarget) >= 1 of
                                        true -> lists:nth(1, BuffTarget);
                                        false -> []
                                    end,
                    combat_skill:add_skill_cooldown(Fid, Skill),
                    #passive_effect{buff_self_to_self = BuffSelf,
                                    buff_self_to_target = NewBuffTarget,
                                    show_passive_skills = [{Fid, SkillId, 1}]}
            end;
        true -> #passive_effect{}
    end;
script_60169(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 7131),
    #passive_effect{}.

script_60170(#c_skill{skill =
                          #skill{id = SkillId, script_args = [SkillList]}},
             #fighter{}, _Target = #fighter{},
             #c_skill_addt_arg{passive_flag = attack}) ->
    logger:debug("触发被动:~w",
                 [SkillList],
                 combat_script_skill,
                 7137),
    case util:rand_list(SkillList, 1) of
        {_, SkillId, _} -> #passive_effect{};
        {_, 60515, [Ratio]} ->
            logger:debug("触发被动:~w",
                         [60515],
                         combat_script_skill,
                         7143),
            #passive_effect{dec_def_ratio = Ratio};
        {_, 60516, [DmgRatio]} ->
            #passive_effect{dmg_ratio_add = DmgRatio};
        _ -> #passive_effect{}
    end;
script_60170(_Skill = #c_skill{id = SkillId,
                               skill = #skill{script_args = Args}},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w], 技能参数:[~w]",
                 [Name, SkillId, Args],
                 combat_script_skill,
                 7151),
    #passive_effect{}.

script_60171(Skill = #c_skill{id = _SkillId,
                              skill =
                                  #skill{script_args =
                                             [Ratio, DmgHpRatio, DefRatio],
                                         buff_self = BuffSelf}},
             #fighter{id = Sid}, #fighter{}, _SkillAddtArg) ->
    case combat_skill:is_skill_in_cooldown(Sid, Skill) of
        false ->
            case util:rand(1, 1000) =< Ratio of
                true ->
                    logger:debug("触发被动脚本60171 ~w",
                                 [{Ratio, DmgHpRatio, DefRatio, BuffSelf}],
                                 combat_script_skill,
                                 7160),
                    #passive_effect{target_def_add_buff =
                                        [{DmgHpRatio,
                                          DefRatio,
                                          BuffSelf,
                                          Skill}]};
                _ -> #passive_effect{}
            end;
        _ -> #passive_effect{}
    end;
script_60171(_Skill = #c_skill{id = SkillId,
                               skill = #skill{script_args = Args}},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w] [~w]",
                 [Name, SkillId, Args],
                 combat_script_skill,
                 7169),
    #passive_effect{}.

script_60172(#c_skill{skill = #skill{}},
             #fighter{id = Sid}, _Target = #fighter{},
             #c_skill_addt_arg{passive_flag = init}) ->
    logger:debug("添加命中:~w",
                 [1000],
                 combat_script_skill,
                 7174),
    Svc = [{i_hit_ratio, 1, 10000}],
    combat_cache:u(Sid, Svc),
    #passive_effect{};
script_60172(Skill = #c_skill{id = _SkillId,
                              skill =
                                  #skill{script_args =
                                             [SkillRandList, RoleRatio]}},
             Self = #fighter{action = Action, pet_attr = PetAttr,
                             id = Fid, attr = #attr{phy_dmg = PhyDmg},
                             special_attr =
                                 #special_attr{wheel_dmg = WheelDmg,
                                               wheel_skill = WheelSkill}},
             _Target = #fighter{type = TargetType}, _SkillAddtArg) ->
    logger:debug("script_60172=============:~w",
                 [SkillRandList],
                 combat_script_skill,
                 7179),
    case Action of
        {#c_skill{skill = #skill{elem_type = 0}}, _} ->
            case combat_skill:is_skill_in_cooldown(Fid, Skill) of
                false ->
                    case util:rand_list(SkillRandList) of
                        {PassiveSkillId, AtkSkillId, DmgRatio, Buff, _} ->
                            logger:debug("=============:~w",
                                         [{PassiveSkillId, DmgRatio, Buff}],
                                         combat_script_skill,
                                         7186),
                            combat_skill:add_skill_cooldown(Fid, Skill, 1),
                            BuffAdd = combat_script_buff:convert_buff(Buff),
                            combat_buff:buff_add(BuffAdd, Self, Self),
                            PetPointRatio = case PetAttr of
                                                {PStr,
                                                 PCon,
                                                 PMag,
                                                 PAgi,
                                                 PEnd} ->
                                                    AllPoint = PStr + PCon +
                                                                   PMag
                                                                   + PAgi
                                                                   + PEnd,
                                                    PStrRatio = PStr / AllPoint
                                                                    * 100,
                                                    logger:debug("加点衰减:~w",
                                                                 [PStrRatio],
                                                                 combat_script_skill,
                                                                 7196),
                                                    if PStrRatio >= 50 -> 1000;
                                                       PStrRatio >= 40 -> 800;
                                                       true -> 600
                                                    end;
                                                _ -> 1000
                                            end,
                            logger:debug("加点衰减:~w",
                                         [PetPointRatio],
                                         combat_script_skill,
                                         7204),
                            HolyDmg = round(PhyDmg * DmgRatio / 1000 *
                                                PetPointRatio
                                                / 1000),
                            HolyDmg1 = case TargetType of
                                           1 ->
                                               round(HolyDmg * RoleRatio /
                                                         1000);
                                           _ -> HolyDmg
                                       end,
                            Svc = [{wheel_dmg, 1, HolyDmg},
                                   {wheel_skill, 1, AtkSkillId}],
                            combat_cache:u(Fid, Svc),
                            combat_play:add_sub_play(combat_play:gen_sub_skill_play(attack,
                                                                                    {Self,
                                                                                     Self,
                                                                                     to_combat_skill({2000,
                                                                                                      1}),
                                                                                     [],
                                                                                     [],
                                                                                     1,
                                                                                     0,
                                                                                     0,
                                                                                     0,
                                                                                     [{Fid,
                                                                                       PassiveSkillId,
                                                                                       3}]})),
                            combat_play:commit_play(),
                            ActionShowPassive = case Action of
                                                    {#c_skill{id = 1000}, _} ->
                                                        [{Fid, AtkSkillId, 3}];
                                                    _ ->
                                                        logger:debug("技能====:~w",
                                                                     [Action],
                                                                     combat_script_skill,
                                                                     7222),
                                                        []
                                                end,
                            ShowPassiveSkills = case AtkSkillId of
                                                    60547 ->
                                                        ActionShowPassive ++
                                                            [{Fid, 86121, 1}];
                                                    _ -> ActionShowPassive
                                                end,
                            logger:debug("神圣伤害:~w",
                                         [HolyDmg1],
                                         combat_script_skill,
                                         7232),
                            #passive_effect{atk_holy_addt = HolyDmg1,
                                            show_passive_skills =
                                                ShowPassiveSkills};
                        _ -> #passive_effect{}
                    end;
                _ ->
                    HolyDmg1 = case TargetType of
                                   1 -> round(WheelDmg * RoleRatio / 1000);
                                   _ -> WheelDmg
                               end,
                    ShowPassiveSkills = case WheelSkill of
                                            60547 ->
                                                [{Fid, WheelSkill, 3},
                                                 {Fid, 86121, 1}];
                                            _ -> [{Fid, WheelSkill, 3}]
                                        end,
                    logger:debug("神圣伤害:~w",
                                 [HolyDmg1],
                                 combat_script_skill,
                                 7250),
                    #passive_effect{atk_holy_addt = HolyDmg1,
                                    show_passive_skills = ShowPassiveSkills}
            end;
        _ -> #passive_effect{}
    end;
script_60172(_Skill = #c_skill{id = SkillId,
                               skill = #skill{script_args = Args}},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w] [~w]",
                 [Name, SkillId, Args],
                 combat_script_skill,
                 7257),
    #passive_effect{}.

script_60173(Skill = #c_skill{id = SkillId,
                              skill =
                                  #skill{script_args = [Rate1, Rate2],
                                         buff_target = BuffTarget}},
             _Self = #fighter{id = Fid, type = SType,
                              pet_attr = PetAttr},
             _Target, _SkillAddtArg) ->
    case combat_skill:is_skill_in_cooldown(Fid, Skill) of
        false ->
            NewRate = case SType =:= 3 of
                          false -> Rate1;
                          true ->
                              case PetAttr of
                                  {PStr, PCon, PMag, PAgi, PEnd} ->
                                      AllPoint = PStr + PCon + PMag + PAgi +
                                                     PEnd,
                                      PConRatio = PCon / AllPoint * 100,
                                      case PConRatio >= 35 of
                                          true -> Rate2;
                                          false -> Rate1
                                      end;
                                  _ -> Rate1
                              end
                      end,
            case util:rand(1, 1000) =< NewRate of
                false -> #passive_effect{};
                true ->
                    NewBuffTarget = case length(BuffTarget) >= 1 of
                                        true -> lists:nth(1, BuffTarget);
                                        false -> []
                                    end,
                    combat_skill:add_skill_cooldown(Fid, Skill),
                    #passive_effect{buff_self_to_target = NewBuffTarget,
                                    show_passive_skills = [{Fid, SkillId, 1}]}
            end;
        true -> #passive_effect{}
    end;
script_60173(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 7296),
    #passive_effect{}.

script_60174(Skill = #c_skill{skill =
                                  #skill{script_args = [Rate],
                                         buff_self = BuffSelf}},
             #fighter{id = Sid}, #fighter{},
             #c_skill_addt_arg{passive_flag = pre_action}) ->
    case
        combat_cache:get_context_elem([#combat_context.round])
        of
        [Round] when Round > 1 ->
            case BuffSelf of
                [] -> #passive_effect{};
                _ ->
                    case util:rand(1, 1000) =< Rate of
                        true ->
                            case combat_skill:is_skill_in_cooldown(Sid, Skill)
                                of
                                false ->
                                    logger:debug("增加buff:~w",
                                                 [BuffSelf],
                                                 combat_script_skill,
                                                 7310),
                                    combat_skill:add_skill_cooldown(Sid, Skill),
                                    #passive_effect{buff_self_to_self =
                                                        BuffSelf,
                                                    flag = 1};
                                _Else -> #passive_effect{}
                            end;
                        _ -> #passive_effect{}
                    end
            end;
        _ -> #passive_effect{}
    end;
script_60174(#c_skill{skill =
                          #skill{buff_self = BuffSelf}},
             #fighter{id = Sid}, _Target,
             #c_skill_addt_arg{passive_flag = die_effect}) ->
    lists:foreach(fun (Buff) ->
                          combat_buff:buff_del(Sid, Sid, Buff)
                  end,
                  BuffSelf),
    #passive_effect{};
script_60174(_Skill = #c_skill{id = SkillId,
                               skill = #skill{script_args = Args}},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w], 技能参数:[~w]",
                 [Name, SkillId, Args],
                 combat_script_skill,
                 7327),
    #passive_effect{}.

script_60175(#c_skill{skill =
                          #skill{id = SkillId,
                                 script_args = [DmgRatio, CritRatio]}},
             #fighter{id = Sid, buffs = Buffs}, _Target = #fighter{},
             #c_skill_addt_arg{passive_flag = attack}) ->
    logger:debug("触发被动:~w",
                 [{DmgRatio, CritRatio}],
                 combat_script_skill,
                 7332),
    case lists:keyfind(129001, #c_buff.script_id, Buffs) of
        Buff = #c_buff{duration_left = 1} ->
            combat_buff:buff_del(Sid, Sid, Buff),
            #passive_effect{dmg_ratio = DmgRatio,
                            crit_ratio = CritRatio,
                            show_passive_skills = [{Sid, SkillId, 1}]};
        _ -> #passive_effect{}
    end;
script_60175(_Skill = #c_skill{id = SkillId,
                               skill = #skill{script_args = Args}},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w], 技能参数:[~w]",
                 [Name, SkillId, Args],
                 combat_script_skill,
                 7341),
    #passive_effect{}.

script_60176(#c_skill{skill = #skill{id = SkillId}},
             #fighter{id = Sid, passive_skills = PassiveSkills},
             #fighter{id = Tid},
             #c_skill_addt_arg{passive_flag = attack_after}) ->
    case combat_cache:f(by_script_id, PassiveSkills, 60006)
        of
        #c_skill{} ->
            case combat_cache:f(by_id, Tid) of
                #fighter{is_die = 1} ->
                    logger:debug("击杀喊招", [], combat_script_skill, 7350),
                    #passive_effect{show_passive_skills =
                                        [{Sid, SkillId, 1}]};
                _ -> #passive_effect{}
            end;
        _ -> #passive_effect{}
    end;
script_60176(#c_skill{skill =
                          #skill{script_args = [Ratio]}},
             #fighter{passive_skills = PassiveSkills}, #fighter{},
             _SkillAddtArg) ->
    case combat_cache:f(by_script_id, PassiveSkills, 60006)
        of
        #c_skill{} ->
            logger:debug("击杀吸血:~w",
                         [Ratio],
                         combat_script_skill,
                         7361),
            #passive_effect{kill_suck_hp = Ratio};
        _ -> #passive_effect{}
    end;
script_60176(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 7367),
    #passive_effect{}.

script_60177(#c_skill{skill =
                          #skill{script_args = [Rate1, Rate2, Rate3, Rate4]}},
             #fighter{pet_attr = PetAttr}, #fighter{},
             _SkillAddtArg) ->
    Ratio = case PetAttr of
                {Pstr, Pcon, Pmag, Pagi, Pend} ->
                    AllPoint = Pstr + Pcon + Pmag + Pagi + Pend,
                    PmagRatio = Pmag / AllPoint * 100,
                    if PmagRatio >= 60 -> Rate1;
                       PmagRatio >= 50 -> Rate2;
                       PmagRatio >= 40 -> Rate3;
                       true -> Rate4
                    end;
                _ -> Rate1
            end,
    logger:debug("忽视模范:~w",
                 [Ratio],
                 combat_script_skill,
                 7385),
    #passive_effect{dec_magic_def_ratio = Ratio};
script_60177(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 7388),
    #passive_effect{}.

script_60178(_Skill, _Self = #fighter{}, _, _) ->
    #passive_effect{}.

script_60179(#c_skill{skill =
                          #skill{buff_self = BuffSelf}},
             #fighter{}, #fighter{}, _SkillAddtArg) ->
    #passive_effect{buff_self_to_self = BuffSelf};
script_60179(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 7400),
    #passive_effect{}.

script_60180(#c_skill{skill =
                          #skill{script_args = [Type, Ratio, _]}},
             #fighter{id = Fid, lev = Lev}, #fighter{},
             #c_skill_addt_arg{passive_flag = init}) ->
    Dmg = round(Lev * Ratio / 10),
    logger:debug("增加暴击附加伤害:~w",
                 [Dmg],
                 combat_script_skill,
                 7406),
    case Type of
        0 ->
            logger:debug("增加暴击附加伤害:~w",
                         [Dmg],
                         combat_script_skill,
                         7409),
            combat_cache:u(Fid, [{phy_crit_extra_dmg, 1, Dmg}]);
        _ ->
            logger:debug("增加暴击附加伤害:~w",
                         [Dmg],
                         combat_script_skill,
                         7412),
            combat_cache:u(Fid, [{mag_crit_extra_dmg, 1, Dmg}])
    end,
    #passive_effect{};
script_60180(#c_skill{skill =
                          #skill{id = SkillId,
                                 script_args = [Type, Ratio, SkillList]}},
             #fighter{id = Fid, lev = Lev},
             #fighter{passive_skills = PassiveSkills},
             #c_skill_addt_arg{passive_flag = attack}) ->
    case [1
          || #c_skill{skill = #skill{id = Id}} <- PassiveSkills,
             lists:member(Id, SkillList)]
        of
        [_ | _] ->
            Dmg = round(Lev * Ratio / 10),
            logger:debug("发生克制关系:~w",
                         [Dmg],
                         combat_script_skill,
                         7420),
            case Type of
                0 ->
                    #passive_effect{phy_crit_extra_dmg = Dmg,
                                    show_passive_skills = [{Fid, SkillId, 1}]};
                _ ->
                    #passive_effect{mag_crit_extra_dmg = Dmg,
                                    show_passive_skills = [{Fid, SkillId, 1}]}
            end;
        _ -> #passive_effect{}
    end;
script_60180(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 7431),
    #passive_effect{}.

script_60181(_Skill, _Self = #fighter{}, _, _) ->
    #passive_effect{}.

script_60182(_Skill, _Self = #fighter{}, _, _) ->
    #passive_effect{}.

script_60183(#c_skill{skill =
                          #skill{id = SkillId,
                                 script_args = [Type, Ratio, SkillList]}},
             #fighter{id = Fid, action = Action},
             #fighter{passive_skills = PassiveSkills},
             #c_skill_addt_arg{passive_flag = attack}) ->
    case Action of
        {#c_skill{skill = #skill{elem_type = Type}}, _} ->
            case [1
                  || #c_skill{skill = #skill{id = Id}} <- PassiveSkills,
                     lists:member(Id, SkillList)]
                of
                [_ | _] ->
                    #passive_effect{dmg_ratio = Ratio,
                                    show_passive_skills = [{Fid, SkillId, 1}]};
                _ -> #passive_effect{}
            end;
        _ -> #passive_effect{}
    end;
script_60183(#c_skill{skill =
                          #skill{id = SkillId,
                                 script_args = [Ratio, SkillList]}},
             #fighter{id = Fid, action = Action},
             #fighter{passive_skills = PassiveSkills},
             #c_skill_addt_arg{passive_flag = attack}) ->
    case Action of
        {#c_skill{skill = #skill{}}, _} ->
            case [1
                  || #c_skill{skill = #skill{id = Id}} <- PassiveSkills,
                     lists:member(Id, SkillList)]
                of
                [_ | _] ->
                    #passive_effect{dmg_ratio = Ratio,
                                    show_passive_skills = [{Fid, SkillId, 1}]};
                _ -> #passive_effect{}
            end;
        _ -> #passive_effect{}
    end;
script_60183(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 7468),
    #passive_effect{}.

script_60184(Skill = #c_skill{skill =
                                  #skill{id = SkillId,
                                         script_args = [Ratio, AngerVal]}},
             Self = #fighter{id = Sid, master_fid = MasterFid},
             #fighter{}, #c_skill_addt_arg{passive_flag = attack}) ->
    case combat_skill:is_skill_in_cooldown(Sid, Skill) of
        false ->
            combat_skill:add_skill_cooldown(Sid, Skill, 1),
            case util:rand(1, 1000) =< Ratio of
                true ->
                    case combat_cache:f(by_id, MasterFid) of
                        Master = #fighter{is_escape = 0, is_die = 0} ->
                            Tvc = [{anger, 1, AngerVal}],
                            Tc = [{9, AngerVal, 0}],
                            Effect =
                                combat_play:gen_sub_skill_play(die_master_effect,
                                                               {Self,
                                                                Master,
                                                                Tc,
                                                                0,
                                                                0,
                                                                [{Sid,
                                                                  SkillId,
                                                                  1}]}),
                            combat_play:add_sub_play(Effect),
                            combat_cache:u(MasterFid, Tvc),
                            #passive_effect{};
                        _ -> #passive_effect{}
                    end;
                _ -> #passive_effect{}
            end;
        _ -> #passive_effect{}
    end;
script_60184(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 7501),
    #passive_effect{}.

script_60185(#c_skill{skill =
                          #skill{script_args = [Ratio]}},
             #fighter{buffs = Buffs}, #fighter{},
             #c_skill_addt_arg{passive_flag = attack}) ->
    case lists:keyfind(129001, #c_buff.script_id, Buffs) of
        #c_buff{} -> #passive_effect{crit_ratio = Ratio};
        _ -> #passive_effect{}
    end;
script_60185(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 7513),
    #passive_effect{}.

script_60186(#c_skill{skill =
                          #skill{script_args = [Base1, Base2, Base3]}},
             #fighter{action = Action, hp = Hp, hp_max = HpMax},
             #fighter{}, _SkillAddtArg) ->
    case Action of
        {#c_skill{skill =
                      #skill{elem_type = 0, attack_type = 0}},
         _} ->
            V1 = Hp / HpMax * 100,
            DmgRatio = if V1 =< 20 -> Base3;
                          V1 =< 50 -> Base2;
                          true -> Base1
                       end,
            #passive_effect{suck_hp = DmgRatio};
        _ -> #passive_effect{}
    end;
script_60186(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 7531),
    #passive_effect{}.

script_60187(#c_skill{skill =
                          #skill{id = SkillId,
                                 script_args = [Ratio1, Ratio2, Ratio3]}},
             #fighter{id = Sid,
                      special_status =
                          #special_status{be_attack_skills = BeAttackSkills}},
             #fighter{id = Fid, action = Action},
             #c_skill_addt_arg{passive_flag = defence}) ->
    {NewBeAttackSkills, Ratio, ShowPassive} = case Action of
                                                  {#c_skill{skill =
                                                                #skill{id =
                                                                           SkillId2}},
                                                   _} ->
                                                      case
                                                          lists:member(SkillId2,
                                                                       [1000,
                                                                        1101,
                                                                        1102,
                                                                        1103,
                                                                        1104,
                                                                        1105,
                                                                        1106,
                                                                        1126])
                                                          of
                                                          true ->
                                                              {BeAttackSkills,
                                                               0,
                                                               []};
                                                          _ ->
                                                              logger:debug("60187:~w,~w",
                                                                           [Fid,
                                                                            BeAttackSkills],
                                                                           combat_script_skill,
                                                                           7546),
                                                              case
                                                                  lists:keyfind(SkillId2,
                                                                                1,
                                                                                BeAttackSkills)
                                                                  of
                                                                  {_,
                                                                   FL,
                                                                   Num} ->
                                                                      {NBeAttackSkills,
                                                                       NewNum} =
                                                                          case
                                                                              lists:member(Fid,
                                                                                           FL)
                                                                              of
                                                                              true ->
                                                                                  {BeAttackSkills,
                                                                                   Num
                                                                                       -
                                                                                       1};
                                                                              _ ->
                                                                                  {lists:keystore(SkillId2,
                                                                                                  1,
                                                                                                  BeAttackSkills,
                                                                                                  {SkillId2,
                                                                                                   [Fid
                                                                                                    | FL],
                                                                                                   Num
                                                                                                       +
                                                                                                       1}),
                                                                                   Num}
                                                                          end,
                                                                      _R = if
                                                                               NewNum
                                                                                   =<
                                                                                   0 ->
                                                                                   0;
                                                                               NewNum
                                                                                   =<
                                                                                   1 ->
                                                                                   Ratio1;
                                                                               NewNum
                                                                                   =<
                                                                                   2 ->
                                                                                   Ratio2;
                                                                               true ->
                                                                                   Ratio3
                                                                           end,
                                                                      case _R >
                                                                               0
                                                                          of
                                                                          true ->
                                                                              {NBeAttackSkills,
                                                                               _R,
                                                                               [{Sid,
                                                                                 SkillId,
                                                                                 1}]};
                                                                          _ ->
                                                                              {NBeAttackSkills,
                                                                               _R,
                                                                               []}
                                                                      end;
                                                                  _ ->
                                                                      {[{SkillId2,
                                                                         [Fid],
                                                                         1}
                                                                        | BeAttackSkills],
                                                                       0,
                                                                       []}
                                                              end
                                                      end;
                                                  _ -> {BeAttackSkills, 0, []}
                                              end,
    logger:debug("~w,~w",
                 [NewBeAttackSkills, Ratio],
                 combat_script_skill,
                 7574),
    Svc = [{be_attack_skills, 0, NewBeAttackSkills}],
    combat_cache:u(Sid, Svc),
    #passive_effect{float_dmg = -Ratio,
                    show_passive_skills = ShowPassive};
script_60187(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 7579),
    #passive_effect{}.

script_60188(_Skill, _Self = #fighter{}, _, _) ->
    #passive_effect{}.

script_60189(Skill = #c_skill{skill =
                                  #skill{id = SkillId,
                                         script_args = [Ratio1, Ratio2]}},
             _Self = #fighter{id = Sid,
                              special_attr =
                                  #special_attr{first_target_id =
                                                    FirstTargetId}},
             #fighter{id = Tid,
                      special_attr =
                          #special_attr{be_attack_times = AttackTimes}},
             #c_skill_addt_arg{passive_flag = attack}) ->
    logger:debug("~w:~w",
                 [FirstTargetId, AttackTimes],
                 combat_script_skill,
                 7588),
    case combat_skill:is_skill_in_cooldown(Sid, Skill) of
        false ->
            combat_skill:add_skill_cooldown(Sid, Skill, 1),
            case AttackTimes of
                {_, Times} ->
                    R = min(Ratio1 * Times, Ratio2),
                    case R > 0 of
                        true ->
                            logger:debug("~w",
                                         [AttackTimes],
                                         combat_script_skill,
                                         7597),
                            logger:debug("========记录初始目标~w:~w",
                                         [Tid, R],
                                         combat_script_skill,
                                         7598),
                            combat_cache:u(Sid, [{first_target_id, 0, Tid}]),
                            #passive_effect{dmg_ratio = R,
                                            show_passive_skills =
                                                [{Sid, SkillId, 1}]};
                        _ -> #passive_effect{}
                    end;
                _ -> #passive_effect{}
            end;
        _ ->
            case
                combat_cache:get_context_elem([#combat_context.is_passive_attack])
                of
                [true] ->
                    case FirstTargetId of
                        Tid ->
                            case AttackTimes of
                                {_, Times} ->
                                    logger:debug("==========",
                                                 [],
                                                 combat_script_skill,
                                                 7614),
                                    R = min(Ratio1 * (Times - 1), Ratio2),
                                    #passive_effect{dmg_ratio = R,
                                                    show_passive_skills =
                                                        [{Sid, SkillId, 1}]};
                                _ -> #passive_effect{}
                            end;
                        _ -> #passive_effect{}
                    end;
                _ -> #passive_effect{}
            end
    end;
script_60189(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 7628),
    #passive_effect{}.

script_60190(#c_skill{skill =
                          #skill{script_args = [Rate]}},
             #fighter{lev = Lev}, #fighter{}, #c_skill_addt_arg{}) ->
    Val = round(Lev * Rate / 10),
    #passive_effect{dmg_addt = Val};
script_60190(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 7635),
    #passive_effect{}.

script_60191(Skill = #c_skill{skill =
                                  #skill{id = SkillId, buff_self = BuffSelf,
                                         script_args = [Rate, Ratio1, Ratio2]}},
             #fighter{id = Sid, action = Action,
                      attr = #attr{phy_def = PhyDef}},
             #fighter{}, #c_skill_addt_arg{}) ->
    case combat_skill:is_skill_in_cooldown(Sid, Skill) of
        false ->
            case util:rand(1, 1000) =< Rate of
                true ->
                    combat_skill:add_skill_cooldown(Sid, Skill, 1),
                    Val = util:check_min(round(PhyDef * (Ratio1 / 1000)),
                                         0),
                    logger:debug("原物防值：~w降低的物防值：~w",
                                 [PhyDef, Val],
                                 combat_script_skill,
                                 7645),
                    #passive_effect{buff_self_to_self = BuffSelf,
                                    atk_addt = Val, phy_dmg_ratio = Ratio2,
                                    show_passive_skills = [{Sid, SkillId, 3}]};
                _ ->
                    case Action of
                        {#c_skill{skill = #skill{script_id = 50026}}, _} ->
                            combat_skill:add_skill_cooldown(Sid, Skill, 1);
                        _ -> ok
                    end,
                    #passive_effect{}
            end;
        _ -> #passive_effect{}
    end;
script_60191(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 7660),
    #passive_effect{}.

script_60192(Skill = #c_skill{skill =
                                  #skill{script_args = [Ratio, BuffList]}},
             #fighter{id = Fid}, #fighter{}, _) ->
    logger:debug("给目标上buff:~w",
                 [Ratio],
                 combat_script_skill,
                 7666),
    case combat_skill:is_skill_in_cooldown(Fid, Skill) of
        false ->
            case util:rand(1, 1000) =< Ratio of
                true ->
                    combat_skill:add_skill_cooldown(Fid, Skill, 1),
                    Buff = combat_script_buff:convert_buff(BuffList),
                    logger:debug("给目标上buff:~w",
                                 [Buff],
                                 combat_script_skill,
                                 7673),
                    #passive_effect{buff_self_to_target = Buff};
                _ -> #passive_effect{}
            end;
        _ -> #passive_effect{}
    end;
script_60192(#c_skill{id = SkillId,
                      skill = #skill{script_args = Args}},
             #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w], 技能参数:[~w]",
                 [Name, SkillId, Args],
                 combat_script_skill,
                 7682),
    #passive_effect{}.

script_60193(#c_skill{skill =
                          #skill{script_args = [Ratio]}},
             #fighter{attr = #attr{phy_dmg = PhyDmg}}, #fighter{},
             _) ->
    HolyDmg = round(PhyDmg * Ratio / 1000),
    logger:debug("script_60193=====================:~w",
                 [HolyDmg],
                 combat_script_skill,
                 7687),
    #passive_effect{atk_holy_addt = HolyDmg}.

script_60194(#c_skill{skill =
                          #skill{script_args = [Ratio], buff_self = BuffSelf,
                                 buff_target = [BuffTarget]}},
             Self = #fighter{master_fid = MasterFid}, #fighter{},
             _) ->
    logger:debug("script_60194=====================:",
                 [],
                 combat_script_skill,
                 7692),
    case
        combat_cache:get_context_elem([#combat_context.action_dmg])
        of
        [ActionDmg] when ActionDmg > 0 ->
            DmgVal = round(ActionDmg * Ratio / 1000),
            logger:debug("script_60194=====================:~w",
                         [{ActionDmg, DmgVal}],
                         combat_script_skill,
                         7696),
            [combat_buff:buff_add(Buff#c_buff{args = [DmgVal]},
                                  Self,
                                  Self)
             || Buff <- BuffSelf],
            case combat_cache:f(by_id, MasterFid) of
                Master = #fighter{is_escape = 0, is_die = 0} ->
                    [combat_buff:buff_add(Buff#c_buff{args = [DmgVal]},
                                          Self,
                                          Master)
                     || Buff <- BuffTarget],
                    #passive_effect{};
                _ -> #passive_effect{}
            end;
        _ ->
            logger:debug("script_60194=====================:",
                         [],
                         combat_script_skill,
                         7706),
            #passive_effect{}
    end.

script_60195(_Skill = #c_skill{id = Id,
                               skill =
                                   #skill{buff_self = BuffSelf,
                                          script_args = [_DelBuff]}},
             #fighter{id = Sid}, _,
             #c_skill_addt_arg{passive_flag = pre_action}) ->
    #passive_effect{buff_self_to_self = BuffSelf,
                    show_passive_skills = [{Sid, Id, 0}], flag = 1};
script_60195(_Skill = #c_skill{id = _SkillId,
                               skill =
                                   #skill{script_args = [DelBuff],
                                          buff_target = _BuffTarget}},
             _Self = #fighter{id = Sid, buffs = Buffs}, _, _) ->
    ClearBuff = lists:filter(fun (#c_buff{id = Bfid}) ->
                                     Bfid =:= DelBuff
                             end,
                             Buffs),
    lists:foreach(fun (Buff) ->
                          combat_buff:buff_del(Sid, Buff)
                  end,
                  ClearBuff),
    #passive_effect{}.

script_60196(_Skill = #c_skill{skill =
                                   #skill{script_args = [Ratio]}},
             Self = #fighter{}, _Target, #c_skill_addt_arg{}) ->
    Svc = [{hp_link, 0, Ratio}],
    combat_cache:u(Self, Svc),
    #passive_effect{}.

script_60197(_Skill = #c_skill{skill =
                                   #skill{buff_self = BuffSelf,
                                          buff_target = BuffTarget}},
             Self = #fighter{master_fid = MasterFid}, _Target,
             #c_skill_addt_arg{passive_flag = init}) ->
    case combat_cache:f(by_id, MasterFid) of
        Master = #fighter{} ->
            combat_buff:buff_add(BuffTarget, Self, Master),
            combat_buff:buff_add(BuffSelf, Master, Self),
            ok;
        _ -> ok
    end,
    #passive_effect{};
script_60197(_Skill = #c_skill{skill =
                                   #skill{script_args = [DelBuffIdList]}},
             _Self = #fighter{master_fid = MasterFid}, _Target,
             #c_skill_addt_arg{}) ->
    case combat_cache:f(by_id, MasterFid) of
        #fighter{buffs = Buffs} ->
            NeedClearBuffs = [Buff
                              || Buff = #c_buff{id = Id} <- Buffs,
                                 lists:member(Id, DelBuffIdList)],
            [combat_buff:buff_del(MasterFid, Buff)
             || Buff <- NeedClearBuffs],
            ok;
        _ -> ok
    end,
    #passive_effect{}.

script_60198(_Skill = #c_skill{skill =
                                   #skill{script_args = [BuffId, Ratio]}},
             _Self = #fighter{is_die = 0, is_escape = 0,
                              group = Group, buffs = Buffs,
                              special_attr =
                                  #special_attr{round_hurt = RoundHurt}},
             _Target, #c_skill_addt_arg{}) ->
    case lists:keyfind(BuffId, #c_buff.id, Buffs) of
        #c_buff{} ->
            GroupList = combat_cache:all(Group),
            SortList = lists:keysort(2,
                                     [{Fid, round(Hp / HpMax * 1000), FBuffs}
                                      || #fighter{id = Fid, hp = Hp,
                                                  hp_max = HpMax, is_escape = 0,
                                                  is_die = 0, buffs = FBuffs}
                                             <- GroupList]),
            case SortList of
                [{Tid, _, TargetBuffs} | _] ->
                    NeedClearBuff = [Buff
                                     || Buff = #c_buff{eff_type = debuff,
                                                       can_dispel = 1}
                                            <- TargetBuffs],
                    lists:foreach(fun (Buff) ->
                                          combat_buff:buff_del(Tid, Buff)
                                  end,
                                  NeedClearBuff),
                    HealHp = round(RoundHurt * Ratio / 1000),
                    combat_cache:u(Tid, [{hp, 1, HealHp}]),
                    ok;
                _ -> ok
            end;
        _ -> ok
    end,
    #passive_effect{};
script_60198(_Skill, _Self, _Target,
             #c_skill_addt_arg{}) ->
    #passive_effect{}.

script_31000(Skill = #c_skill{id = SkillId,
                              skill =
                                  #skill{script_args = [Rate],
                                         buff_self = BuffSelf,
                                         buff_target = BuffTarget}},
             _Self = #fighter{id = Fid}, _Target, _SkillAddtArg) ->
    case combat_skill:is_skill_in_cooldown(Fid, Skill) of
        false ->
            case util:rand(1, 1000) =< Rate of
                false -> #passive_effect{};
                true ->
                    NewBuffTarget = case length(BuffTarget) >= 1 of
                                        true -> lists:nth(1, BuffTarget);
                                        false -> []
                                    end,
                    combat_skill:add_skill_cooldown(Fid, Skill),
                    #passive_effect{buff_self_to_self = BuffSelf,
                                    buff_self_to_target = NewBuffTarget,
                                    show_passive_skills = [{Fid, SkillId, 0}],
                                    flag = 1}
            end;
        true -> #passive_effect{}
    end.

script_31001(Skill = #c_skill{id = SkillId,
                              skill =
                                  #skill{script_args =
                                             [Rate, HealRatio, Base]}},
             _Self = #fighter{id = Fid},
             _Target = #fighter{hp_max = HpMax}, _SkillAddtArg) ->
    case combat_skill:is_skill_in_cooldown(Fid, Skill) of
        false ->
            case util:rand(1, 1000) =< Rate of
                false -> #passive_effect{};
                true ->
                    HealHp = round(HpMax * HealRatio / 1000 + Base),
                    combat_skill:add_skill_cooldown(Fid, Skill),
                    Tvc = [{hp, 1, HealHp}],
                    Tc = [{0, HealHp, 0}],
                    #passive_effect{target_val_changed = Tvc,
                                    target_changed = Tc,
                                    show_passive_skills = [{Fid, SkillId, 0}],
                                    flag = 1}
            end;
        true -> #passive_effect{}
    end.

script_31002(Skill = #c_skill{id = SkillId,
                              skill =
                                  #skill{script_args =
                                             [Rate, HealRatio, Base]}},
             _Self = #fighter{id = Fid},
             _Target = #fighter{mp_max = MpMax}, _SkillAddtArg) ->
    case combat_skill:is_skill_in_cooldown(Fid, Skill) of
        false ->
            case util:rand(1, 1000) =< Rate of
                false -> #passive_effect{};
                true ->
                    HealMp = round(MpMax * HealRatio / 1000 + Base),
                    combat_skill:add_skill_cooldown(Fid, Skill),
                    Tvc = [{mp, 1, HealMp}],
                    Tc = [{1, HealMp, 0}],
                    #passive_effect{target_val_changed = Tvc,
                                    target_changed = Tc,
                                    show_passive_skills = [{Fid, SkillId, 0}],
                                    flag = 1}
            end;
        true -> #passive_effect{}
    end.

script_31003(Skill = #c_skill{id = SkillId,
                              skill =
                                  #skill{script_args =
                                             [Rate, HealRatio, Base]}},
             _Self = #fighter{id = Fid, hp_max = HpMax},
             _Target = #fighter{}, _SkillAddtArg) ->
    case combat_skill:is_skill_in_cooldown(Fid, Skill) of
        false ->
            case util:rand(1, 1000) =< Rate of
                false -> #passive_effect{};
                true ->
                    HealHp = round(HpMax * HealRatio / 1000 + Base),
                    combat_skill:add_skill_cooldown(Fid, Skill),
                    Svc = [{hp, 1, HealHp}],
                    Sc = [{0, HealHp, 0}],
                    #passive_effect{self_val_changed = Svc,
                                    self_changed = Sc,
                                    show_passive_skills = [{Fid, SkillId, 0}],
                                    flag = 1}
            end;
        true -> #passive_effect{}
    end.

script_31004(Skill = #c_skill{id = SkillId,
                              skill =
                                  #skill{script_args =
                                             [Rate, HealRatio, Base]}},
             _Self = #fighter{id = Fid},
             _Target = #fighter{mp_max = MpMax}, _SkillAddtArg) ->
    case combat_skill:is_skill_in_cooldown(Fid, Skill) of
        false ->
            case util:rand(1, 1000) =< Rate of
                false -> #passive_effect{};
                true ->
                    HealMp = round(MpMax * HealRatio / 1000 + Base),
                    combat_skill:add_skill_cooldown(Fid, Skill),
                    Svc = [{mp, 1, HealMp}],
                    Sc = [{1, HealMp, 0}],
                    #passive_effect{self_val_changed = Svc,
                                    self_changed = Sc,
                                    show_passive_skills = [{Fid, SkillId, 0}],
                                    flag = 1}
            end;
        true -> #passive_effect{}
    end.

script_31100(Skill = #c_skill{id = SkillId,
                              skill =
                                  #skill{script_args = [Rate],
                                         buff_target = BuffTarget}},
             _Self = #fighter{id = Fid}, _Target = #fighter{},
             _SkillAddtArg) ->
    case combat_skill:is_skill_in_cooldown(Fid, Skill) of
        false ->
            case util:rand(1, 1000) =< Rate of
                false -> #passive_effect{};
                true ->
                    NewBuffTarget = case length(BuffTarget) >= 1 of
                                        true -> lists:nth(1, BuffTarget);
                                        false -> []
                                    end,
                    combat_skill:add_skill_cooldown(Fid, Skill),
                    #passive_effect{buff_self_to_self = NewBuffTarget,
                                    show_passive_skills = [{Fid, SkillId, 1}],
                                    flag = 1}
            end;
        _ -> #passive_effect{}
    end;
script_31100(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 7877),
    #passive_effect{}.

script_32000(_Skill = #c_skill{skill =
                                   #skill{script_args =
                                              [Rate, Ratio, ReduceRatio]}},
             #fighter{type = SummonType, master_fid = MasterFid},
             #fighter{id = MasterFid},
             #c_skill_addt_arg{ext_args = [Dmg, DmgHoly]})
    when Ratio < 1000 andalso
             (SummonType =:= 6 orelse SummonType =:= 3) ->
    case util:rand(1, 1000) =< Rate of
        true ->
            NewDmg = round(Dmg * (1000 - Ratio) / 1000),
            NewDmgHoly = round(DmgHoly * (1000 - Ratio) / 1000),
            PetDmg = round((Dmg - NewDmg) * ReduceRatio / 1000),
            PetDmgHoly = round((DmgHoly - NewDmgHoly) * ReduceRatio
                                   / 1000),
            {true, NewDmg, NewDmgHoly, PetDmg, PetDmgHoly};
        false -> {false, 0, 0, 0, 0}
    end;
script_32000(_Skill, _Self, _Target, _SkillAddtArg) ->
    {false, 0, 0, 0, 0}.

script_32001(Skill = #c_skill{skill =
                                  S = #skill{script_args =
                                                 [Rate, Ratio, Val, XRatio]}},
             Self = #fighter{type = SummonType, id = Fid,
                             master_fid = MasterFid},
             Target = #fighter{id = MasterFid, lev = TargetLev,
                               combat_init_attr =
                                   #combat_init_attr{eff_revive_ratio =
                                                         EffReviceRatio}},
             SkillAddtArg)
    when SummonType =:= 6 orelse SummonType =:= 3 ->
    Flag = util:rand(1, 1000) =< Rate,
    Skill1 = Skill#c_skill{skill =
                               S#skill{cooldown = 999999}},
    case Flag =:= true andalso
             combat_skill:is_skill_in_cooldown(Fid, Skill1) =:= false
        of
        true ->
            combat_skill:add_skill_cooldown(Fid, Skill1),
            MaxVal = round(TargetLev * XRatio),
            HealHp = min(round(Target#fighter.hp_max *
                                   (Ratio + EffReviceRatio)
                                   / 1000
                                   + Val),
                         MaxVal),
            AE = #action_effect{heal_hp = HealHp},
            Tvc = [{is_die, 0, 0}],
            Tc = [{2, 0, 0}],
            combat_stat:update_pet_revive(Target),
            SkillAddtArg1 =
                SkillAddtArg#c_skill_addt_arg{target_val_changed = Tvc,
                                              target_changed = Tc},
            combat_script_skill_calc:heal(Skill1,
                                          Self,
                                          Target,
                                          SkillAddtArg1,
                                          AE),
            true;
        false -> false
    end;
script_32001(_Skill, _Self, _Target, _SkillAddtArg) ->
    false.

script_33000(Skill = #c_skill{skill =
                                  #skill{script_args =
                                             [Ratio, BaseVal, MaxLevRatio]}},
             Self = #fighter{lev = Slev},
             Target = #fighter{is_die = IsDie, lev = Tlev},
             SkillAddtArg) ->
    case IsDie of
        0 ->
            ReduceRatio1 = 1 - (Tlev - Slev) / Tlev,
            ReduceRatio2 = util:check_range(ReduceRatio1,
                                            2.99999999999999988898e-1,
                                            1),
            Ratio1 = round(Ratio * ReduceRatio2),
            HealHp = round(Target#fighter.hp_max * Ratio1 / 1000 +
                               BaseVal),
            HealHp1 = min(HealHp, round(Tlev * MaxLevRatio)),
            AE = #action_effect{heal_hp = HealHp1},
            combat_script_skill_calc:heal(Skill,
                                          Self,
                                          Target,
                                          SkillAddtArg,
                                          AE#action_effect{can_anti_heal = 1}),
            true;
        _ -> false
    end;
script_33000(Skill, Self, _, _) ->
    err_ai(Skill, Self),
    true.

script_33001(Skill = #c_skill{skill =
                                  #skill{script_args = [CdReduce]}},
             Self,
             Target = #fighter{is_die = IsDie, skill_cooldown = Cds},
             SkillAddtArg) ->
    case IsDie of
        0 ->
            Fun = fun ({SkId, CdTimeLeft}, Rtn) ->
                          case is_endless_challenge_skill(SkId) of
                              true -> [{SkId, CdTimeLeft} | Rtn];
                              false ->
                                  [{SkId, max(CdTimeLeft - CdReduce, 0)} | Rtn]
                          end;
                      (Other, Rtn) -> [Other | Rtn]
                  end,
            NewCds = lists:foldr(Fun, [], Cds),
            Tvc = [{skill_cooldown, 0, NewCds}],
            NewSkillAddtArg =
                SkillAddtArg#c_skill_addt_arg{target_val_changed = Tvc},
            ActionEffect = #action_effect{},
            combat_script_skill_calc:cast(attack,
                                          Skill,
                                          Self,
                                          Target,
                                          NewSkillAddtArg,
                                          ActionEffect),
            true;
        _ -> false
    end;
script_33001(Skill, Self, _, _) ->
    err_ai(Skill, Self),
    true.

script_33002(Skill = #c_skill{skill =
                                  S = #skill{buff_target = BuffTarget}},
             Self = #fighter{id = Sid},
             Target = #fighter{is_die = IsDie, id = Tid,
                               buffs = Buffs},
             SkillAddtArg) ->
    case IsDie of
        0 ->
            ClearBuff = [Buff
                         || Buff = #c_buff{can_dispel = 1, eff_type = debuff}
                                <- Buffs],
            lists:foreach(fun (Buff) ->
                                  combat_buff:buff_del(Tid, Sid, Buff)
                          end,
                          ClearBuff),
            combat_stat:update_dispel_num(Sid, ClearBuff),
            NewBuffTarget = lists:nth(1, BuffTarget),
            NewSkill = Skill#c_skill{skill =
                                         S#skill{buff_target = NewBuffTarget}},
            combat_script_skill_calc:cast(attack,
                                          NewSkill,
                                          Self,
                                          Target,
                                          SkillAddtArg,
                                          #action_effect{}),
            true;
        _ -> false
    end;
script_33002(Skill, Self, _, _) ->
    err_ai(Skill, Self),
    true.

script_33003(Skill = #c_skill{skill =
                                  S = #skill{buff_target = BuffTarget}},
             Self, Target = #fighter{is_die = IsDie},
             SkillAddtArg) ->
    case IsDie of
        0 ->
            NewBuffTarget = lists:nth(1, BuffTarget),
            NewSkill = Skill#c_skill{skill =
                                         S#skill{buff_target = NewBuffTarget}},
            combat_script_skill_calc:cast(attack,
                                          NewSkill,
                                          Self,
                                          Target,
                                          SkillAddtArg,
                                          #action_effect{}),
            true;
        _ -> false
    end;
script_33003(Skill, Self, _, _) ->
    err_ai(Skill, Self),
    true.

script_33004(#c_skill{skill =
                          #skill{buff_self = BuffSelf}},
             Self = #fighter{}, #fighter{}, _SkillAddtArg) ->
    logger:debug("=============",
                 [],
                 combat_script_skill,
                 8008),
    lists:foreach(fun (Buff) ->
                          combat_buff:buff_add(Buff, Self, Self, false)
                  end,
                  BuffSelf),
    true;
script_33004(Skill, Self, _, _) ->
    err_ai(Skill, Self),
    true.

script_34000(#c_skill{skill =
                          #skill{buff_target = BuffTarget}},
             _Self, _Target, _SkillAddtArg) ->
    NewBuffTarget = case length(BuffTarget) >= 1 of
                        true -> lists:nth(1, BuffTarget);
                        false -> []
                    end,
    #passive_effect{buff_self_to_target = NewBuffTarget};
script_34000(_Skill = #c_skill{id = SkillId},
             _Self = #fighter{name = Name}, _, _) ->
    logger:error("[~ts]触发错误的被动技能ID[~w]",
                 [Name, SkillId],
                 combat_script_skill,
                 8025),
    #passive_effect{}.

script_35000(Skill = #c_skill{skill =
                                  #skill{script_args = [Rate, Ratio, BaseVal]}},
             Self = #fighter{}, #fighter{group = Group},
             SkillAddtArg) ->
    logger:debug("触发神圣治愈:~w",
                 [Rate],
                 combat_script_skill,
                 8034),
    case util:rand(1, 1000) =< Rate of
        true ->
            logger:debug("进行治疗:~w",
                         [Group],
                         combat_script_skill,
                         8037),
            case gen_script_35000(Group) of
                {true, Target = #fighter{hp_max = THpMax}} ->
                    HealHp = round(THpMax * Ratio / 1000 + BaseVal),
                    AE = #action_effect{heal_hp = HealHp},
                    combat_script_skill_calc:heal(Skill,
                                                  Self,
                                                  Target,
                                                  SkillAddtArg,
                                                  AE#action_effect{can_anti_heal
                                                                       = 1}),
                    true;
                _ -> false
            end;
        false -> false
    end;
script_35000(Skill, Self, _, _) ->
    err_ai(Skill, Self),
    true.

gen_script_35000(Group) ->
    List = combat_cache:all(Group),
    List1 = [{Hp / max(1, HpMax), Tf}
             || Tf = #fighter{hp = Hp, hp_max = HpMax, is_die = 0,
                              is_escape = 0}
                    <- List],
    List2 = lists:keysort(1, List1),
    case List2 of
        [{_, Target = #fighter{}} | _] -> {true, Target};
        _ -> false
    end.

script_35001(#c_skill{skill =
                          #skill{script_args = [Rate, Skills]}},
             Self = #fighter{id = Sid, classes = Classes},
             #fighter{group = Group}, SkillAddtArg) ->
    case util:rand(1, 1000) =< Rate of
        true ->
            case gen_script_35001(Sid, Group) of
                {true, Target = #fighter{id = Tid}} ->
                    case lists:keyfind(Classes, 1, Skills) of
                        {_, SkillId, Lev} ->
                            ActionSkill =
                                combat_script_skill:to_combat_skill({SkillId,
                                                                     Lev}),
                            NSkill = #c_skill{skill =
                                                  #skill{attack_times =
                                                             AttackTimes,
                                                         target_list =
                                                             TargetList,
                                                         buff_self =
                                                             BuffSelf}} =
                                         combat_script_skill_ext:exec_trigger_before(ActionSkill,
                                                                                     Self,
                                                                                     Target),
                            lists:foreach(fun (Buff) ->
                                                  combat_buff:buff_add(Buff,
                                                                       Self,
                                                                       Self)
                                          end,
                                          BuffSelf),
                            Self2 = combat_cache:f(by_id, Sid),
                            NewSelf = Self2#fighter{action = {NSkill, Tid}},
                            combat:for_attack_start(1,
                                                    AttackTimes,
                                                    NSkill,
                                                    NewSelf,
                                                    Target,
                                                    SkillAddtArg,
                                                    TargetList),
                            combat_script_skill_ext:exec_trigger_after(NSkill,
                                                                       NewSelf,
                                                                       Target),
                            true;
                        _ -> false
                    end;
                _ -> false
            end;
        _ -> false
    end;
script_35001(Skill, Self, _, _) ->
    err_ai(Skill, Self),
    true.

gen_script_35001(Self, Group) ->
    List = combat_cache:all(combat_cache:op(Group)),
    List1 = [{Hp / max(1, HpMax), F}
             || F = #fighter{hp = Hp, hp_max = HpMax, is_die = 0,
                             is_escape = 0}
                    <- List,
                combat_util:can_choose_stealth(Self, F) =:= true],
    List2 = lists:keysort(1, List1),
    case List2 of
        [{_, Target = #fighter{}} | _] -> {true, Target};
        _ -> false
    end.

script_35002(CSkill = #c_skill{skill =
                                   Skill = #skill{script_args = [Rate],
                                                  buff_target = BuffTarget}},
             Self, #fighter{group = Group}, SkillAddtArg) ->
    logger:debug("========script_35002===:",
                 [],
                 combat_script_skill,
                 8113),
    case util:rand(1, 1000) =< Rate of
        true ->
            case gen_script_35002(Self, Group) of
                {true, Target = #fighter{}} ->
                    NewBuffTarget = case length(BuffTarget) >= 1 of
                                        true -> lists:nth(1, BuffTarget);
                                        false -> []
                                    end,
                    NewCSkill = CSkill#c_skill{skill =
                                                   Skill#skill{buff_target =
                                                                   NewBuffTarget}},
                    combat_script_skill_calc:cast(attack,
                                                  NewCSkill,
                                                  Self,
                                                  Target,
                                                  SkillAddtArg,
                                                  #action_effect{}),
                    true;
                _ -> false
            end;
        _ -> false
    end;
script_35002(Skill, Self, _, _) ->
    err_ai(Skill, Self),
    true.

gen_script_35002(Self, Group) ->
    List = combat_cache:all(combat_cache:op(Group)),
    List1 = [{combat_util:is_control(F), F}
             || F = #fighter{is_die = 0, is_escape = 0} <- List,
                combat_util:can_choose_stealth(Self, F) =:= true],
    List2 = lists:keysort(1, List1),
    case List2 of
        [{_, Target = #fighter{}} | _] -> {true, Target};
        _ -> false
    end.

script_35003(Skill = #c_skill{skill =
                                  S = #skill{buff_self = BuffSelf,
                                             buff_target = BuffTarget}},
             Self, Target = #fighter{is_die = IsDie},
             SkillAddtArg) ->
    lists:foreach(fun (Buff) ->
                          combat_buff:buff_add(Buff, Self, Self, false)
                  end,
                  BuffSelf),
    case IsDie of
        0 ->
            NewBuffTarget = lists:nth(1, BuffTarget),
            NewSkill = Skill#c_skill{skill =
                                         S#skill{buff_target = NewBuffTarget}},
            combat_script_skill_calc:cast(attack,
                                          NewSkill,
                                          Self,
                                          Target,
                                          SkillAddtArg,
                                          #action_effect{}),
            true;
        _ -> false
    end;
script_35003(Skill, Self, _, _) ->
    err_ai(Skill, Self),
    true.

err_ai(Skill = #c_skill{id = Id,
                        skill =
                            #skill{script_id = ScriptId,
                                   script_args = ScriptArgs}},
       Self) ->
    Talk =
        util:flist(lang:get("哎呀, 坏掉了, 编号是~w-~w, 捡到请联系我。"),
                   [Id, ScriptId]),
    logger:error("错误的技能[~w]脚本[~w,~w]",
                 [Id, ScriptId, ScriptArgs],
                 combat_script_skill,
                 8169),
    combat_play:add_sub_play(combat_play:gen_sub_skill_play(defence,
                                                            {Self#fighter{talk =
                                                                              Talk},
                                                             Skill})).

is_endless_challenge_skill(SkillId) ->
    case skill_data:get_endless_challenge(SkillId) of
        false -> false;
        _ -> true
    end.

calc_special_self_changes(_Skill = #c_skill{target_no =
                                                TargetNo,
                                            skill =
                                                #skill{script_id = ScriptId}},
                          _Self = #fighter{}) ->
    case ScriptId of
        20059 ->
            ScPlay = [{7, TargetNo, 0}],
            {[], ScPlay};
        20060 ->
            ScPlay = [{7, TargetNo, 0}],
            {[], ScPlay};
        20064 ->
            ScPlay = [{7, TargetNo, 0}],
            {[], ScPlay};
        _ -> {[], []}
    end;
calc_special_self_changes(_, _) -> {[], {}}.


%% 2025 pet skill: true damage = own phy_dmg * Ratio / 1000
script_700001(Skill = #c_skill{skill =
                                   #skill{script_args = [Ratio]}},
              Self = #fighter{attr = #attr{phy_dmg = PhyDmg}},
              Target, SkillAddtArg) ->
    DirectDmg = round(PhyDmg * Ratio / 1000),
    ActionEffect = #action_effect{direct_dmg = DirectDmg},
    combat_script_skill_calc:attack(Skill,
                                    Self,
                                    Target,
                                    SkillAddtArg,
                                    ActionEffect);
script_700001(Skill, Self, _, _) -> err_ai(Skill, Self).


%% 2025 pet skill: on being hit, chance to gain a damage-reduction buff.
script_700002(Skill = #c_skill{id = SkillId,
                               skill = #skill{script_args = [Chance, Ratio, Duration]}},
              #fighter{id = Sid}, #fighter{},
              #c_skill_addt_arg{passive_flag = defence}) ->
    case combat_skill:is_skill_in_cooldown(Sid, Skill) of
        true -> #passive_effect{};
        _ ->
            case util:rand(1, 1000) =< Chance of
                true ->
                    combat_skill:add_skill_cooldown(Sid, Skill, 1),
                    #passive_effect{
                        buff_self_to_self =
                            [{90273, 1000, Duration, 1, [Ratio]}],
                        show_passive_skills = [{Sid, SkillId, 1}]};
                false -> #passive_effect{}
            end
    end;
script_700002(_Skill, _Self, _Target, _AddtArg) ->
    #passive_effect{}.


%% 2025 pet skill: burn target MP by a ratio of target max MP (decays per hit).
script_700003(#c_skill{skill =
                           #skill{script_args = [DmgMpRatio, DmgMp]}},
              #fighter{},
              #fighter{mp_max = MpMax,
                       special_attr =
                           #special_attr{be_dmg_mp_times = BeTimes}},
              _SkillAddtArg) ->
    AllDmgMp = round(MpMax * DmgMpRatio / 1000 + DmgMp),
    DoDmgMp = round(AllDmgMp * math:pow(2 / 3, BeTimes)),
    Tvc = [{mp, 1, -DoDmgMp}, {be_dmg_mp_times, 1, 1}],
    Tc = [{1, -DoDmgMp, 0}],
    #passive_effect{target_val_changed = Tvc,
                    target_changed = Tc};
script_700003(_Skill, _Self, _Target, _AddtArg) ->
    #passive_effect{}.


%% 2025 pet skill: battle-start shield + on-hit damage reduction.
script_700004(Skill = #c_skill{id = SkillId,
                               skill = #skill{script_args = [ShieldRatio, ShieldDur, _, _, _]}},
              #fighter{id = Sid}, #fighter{},
              #c_skill_addt_arg{passive_flag = pre_action}) ->
    case combat_skill:is_skill_in_cooldown(Sid, Skill) of
        true -> #passive_effect{};
        _ ->
            combat_skill:add_skill_cooldown(Sid, Skill, 99),
            #passive_effect{
                buff_self_to_self =
                    [{70055, 1000, ShieldDur, 0, [ShieldRatio, 0]}],
                show_passive_skills = [{Sid, SkillId, 0}],
                flag = 1}
    end;
script_700004(Skill = #c_skill{id = SkillId,
                               skill = #skill{script_args = [_, _, Chance, ReduceRatio, ReduceDur]}},
              #fighter{id = Sid}, #fighter{},
              #c_skill_addt_arg{passive_flag = defence}) ->
    case combat_skill:is_skill_in_cooldown(Sid, Skill) of
        true -> #passive_effect{};
        _ ->
            case util:rand(1, 1000) =< Chance of
                true ->
                    combat_skill:add_skill_cooldown(Sid, Skill, 1),
                    #passive_effect{
                        buff_self_to_self =
                            [{90502, 1000, ReduceDur, 1, [ReduceRatio]}],
                        show_passive_skills = [{Sid, SkillId, 1}]};
                false -> #passive_effect{}
            end
    end;
script_700004(_, _, _, _) -> #passive_effect{}.

%% 2025 pet skill: permanent reduction/reflect + on-hit silence.
script_700005(Skill = #c_skill{id = SkillId,
                               skill = #skill{script_args = [ReduceRatio, ReflectNum, ReflectRatio, _, _]}},
              #fighter{id = Sid}, #fighter{},
              #c_skill_addt_arg{passive_flag = pre_action}) ->
    case combat_skill:is_skill_in_cooldown(Sid, Skill) of
        true -> #passive_effect{};
        _ ->
            combat_skill:add_skill_cooldown(Sid, Skill, 99),
            #passive_effect{
                buff_self_to_self =
                    [{69514, 1000, 999, 1, [ReduceRatio]},
                     {70065, 1000, 999, 0, [ReflectNum, ReflectRatio]}],
                show_passive_skills = [{Sid, SkillId, 0}],
                flag = 1}
    end;
script_700005(Skill = #c_skill{id = SkillId,
                               skill = #skill{script_args = [_, _, _, Chance, Dur]}},
              #fighter{id = Sid}, #fighter{},
              #c_skill_addt_arg{passive_flag = defence}) ->
    case combat_skill:is_skill_in_cooldown(Sid, Skill) of
        true -> #passive_effect{};
        _ ->
            case util:rand(1, 1000) =< Chance of
                true ->
                    combat_skill:add_skill_cooldown(Sid, Skill, 1),
                    #passive_effect{
                        buff_self_to_target =
                            [{90338, 1000, Dur, 1, [1000]}],
                        show_passive_skills = [{Sid, SkillId, 1}]};
                false -> #passive_effect{}
            end
    end;
script_700005(_, _, _, _) -> #passive_effect{}.


%% 2025 pet skill: magic lifesteal + on-hit damage reduction.
script_700006(Skill = #c_skill{id = SkillId,
                               skill = #skill{script_args = [_, Chance, ReduceRatio, Duration]}},
              #fighter{id = Sid}, #fighter{},
              #c_skill_addt_arg{passive_flag = defence}) ->
    case combat_skill:is_skill_in_cooldown(Sid, Skill) of
        true -> #passive_effect{};
        _ ->
            case util:rand(1, 1000) =< Chance of
                true ->
                    combat_skill:add_skill_cooldown(Sid, Skill, 1),
                    #passive_effect{
                        buff_self_to_self =
                            [{69514, 1000, Duration, 1, [ReduceRatio]}],
                        show_passive_skills = [{Sid, SkillId, 1}]};
                false -> #passive_effect{}
            end
    end;
script_700006(#c_skill{id = SkillId,
                       skill = #skill{script_args = [SuckRatio, _, _, _]}},
              #fighter{id = Fid, action = Action}, _Target, _AddtArg) ->
    case Action of
        {#c_skill{skill = #skill{elem_type = 0, attack_type = 0}}, _} ->
            #passive_effect{suck_hp = SuckRatio,
                            show_passive_skills = [{Fid, SkillId, 1}]};
        _ -> #passive_effect{}
    end;
script_700006(_, _, _, _) -> #passive_effect{}.

%% 2025 pet skill: on kill heal self and gain a damage buff.
script_700007(#c_skill{id = SkillId,
                       skill = #skill{script_args = [HpBase, HpRatio, DmgRatio, Duration]}},
              #fighter{id = Sid, hp_max = HpMax}, #fighter{},
              #c_skill_addt_arg{passive_flag = kill}) ->
    HealHp = round(HpBase + HpMax * HpRatio / 1000),
    Svc = [{hp, 1, HealHp}],
    Sc = [{0, HealHp, 0}],
    #passive_effect{self_val_changed = Svc,
                    self_changed = Sc,
                    buff_self_to_self =
                        [{90350, 1000, Duration, 1, [DmgRatio]}],
                    show_passive_skills = [{Sid, SkillId, 1}]};
script_700007(_, _, _, _) -> #passive_effect{}.


%% 2025 pet skill: on entering battle heal the master.
script_700008(#c_skill{skill =
                           #skill{script_args = [HpRatio, HpBase, LevRatio]}},
              #fighter{master_fid = MasterFid}, #fighter{},
              #c_skill_addt_arg{passive_flag = init})
    when MasterFid =/= 0 ->
    case combat_cache:f(by_id, MasterFid) of
        #fighter{id = Mid, hp_max = HpMax, lev = Lev, is_die = 0} ->
            HealHp = min(round(HpMax * HpRatio / 1000 + HpBase),
                         Lev * LevRatio),
            combat_cache:u(Mid, [{hp, 1, HealHp}]),
            #passive_effect{};
        _ -> #passive_effect{}
    end;
script_700008(_, _, _, _) -> #passive_effect{}.

%% 2025 pet skill: on death heal all living allies.
script_700009(#c_skill{skill = #skill{script_args = [HealRatio]}},
              #fighter{id = Sid, group = Group}, #fighter{},
              #c_skill_addt_arg{passive_flag = die}) ->
    lists:foreach(fun
                      (#fighter{id = Tid, hp_max = HpMax, is_die = 0})
                          when Tid =/= Sid ->
                          HealHp = round(HpMax * HealRatio / 1000),
                          combat_cache:u(Tid, [{hp, 1, HealHp}]);
                      (_) -> ok
                  end,
                  combat_cache:all_living(Group)),
    #passive_effect{};
script_700009(_, _, _, _) -> #passive_effect{}.

%% 2025 pet skill: random double/triple damage, plus speed advantage damage.
script_700010(#c_skill{id = SkillId,
                       skill = #skill{script_args = [DblChance, DblAdd, TripleChance, TripleAdd, SpeedAdd]}},
              #fighter{id = Sid, attr = #attr{speed = SSpeed}},
              #fighter{attr = #attr{speed = TSpeed}},
              #c_skill_addt_arg{passive_flag = attack}) ->
    R = util:rand(1, 1000),
    Add = if R =< TripleChance -> TripleAdd;
             R =< TripleChance + DblChance -> DblAdd;
             SSpeed > TSpeed -> SpeedAdd;
             true -> 0
          end,
    #passive_effect{dmg_ratio_add = Add,
                    show_passive_skills = [{Sid, SkillId, 1}]};
script_700010(_, _, _, _) -> #passive_effect{}.


%% 2025 pet skill: on entering battle cleanse the master and grant control immunity.
script_700011(#c_skill{skill = #skill{script_args = [Duration]}},
              Self = #fighter{id = Sid, master_fid = MasterFid}, #fighter{},
              #c_skill_addt_arg{passive_flag = init})
    when MasterFid =/= 0 ->
    case combat_cache:f(by_id, MasterFid) of
        Master = #fighter{id = Mid, buffs = Buffs, is_die = 0} ->
            Clear = [B || B = #c_buff{can_dispel = 1, eff_type = debuff}
                              <- Buffs],
            lists:foreach(fun (B) ->
                                  combat_buff:buff_del(Mid, Sid, B)
                          end,
                          Clear),
            Buffs1 = combat_script_buff:convert_buff([{70025, 1000, Duration, 1, [1000]}]),
            lists:foreach(fun (B) ->
                                  combat_buff:buff_add(B, Self, Master, true)
                          end,
                          Buffs1),
            #passive_effect{};
        _ -> #passive_effect{}
    end;
script_700011(_, _, _, _) -> #passive_effect{}.

%% 2025 pet skill: speed advantage -> +15% damage; when hit by slower target -30%.
script_700012(#c_skill{id = SkillId},
              #fighter{id = Sid, attr = #attr{speed = SSpeed}},
              #fighter{attr = #attr{speed = TSpeed}},
              #c_skill_addt_arg{passive_flag = attack}) ->
    case SSpeed > TSpeed of
        true -> #passive_effect{dmg_ratio_add = 150,
                                show_passive_skills = [{Sid, SkillId, 1}]};
        false -> #passive_effect{}
    end;
script_700012(#c_skill{id = SkillId},
              #fighter{id = Sid, attr = #attr{speed = SSpeed}},
              #fighter{attr = #attr{speed = TSpeed}},
              #c_skill_addt_arg{passive_flag = defence}) ->
    case SSpeed > TSpeed of
        true -> #passive_effect{
                    buff_self_to_self = [{69514, 1000, 1, 1, [300]}],
                    show_passive_skills = [{Sid, SkillId, 1}]};
        false -> #passive_effect{}
    end;
script_700012(_, _, _, _) -> #passive_effect{}.
