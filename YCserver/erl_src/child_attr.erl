-file("src/mod/child/child_attr.erl", 1).

-module(child_attr).

-export([recalc_point/1,
         set_point/3,
         calc/1,
         calc/2,
         lev_change/2,
         batch_calc/1,
         push_client_childs/1,
         calc_all_kids/3]).

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

-file("src/mod/child/child_attr.erl", 21).

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

-file("src/mod/child/child_attr.erl", 22).

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

-file("src/mod/child/child_attr.erl", 23).

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

-file("src/mod/child/child_attr.erl", 24).

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

-file("src/mod/child/child_attr.erl", 25).

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

-file("src/mod/child/child_attr.erl", 26).

lev_change(Child = #child{stage = 3, base_id = BaseId,
                          grade = Grade, ext_growth = ExtGrowth,
                          growth_type = GrowthType},
           Role = #role{lev = Lev}) ->
    ChildLev = Lev + 5,
    GrowthVal = child_util:get_growth_val(BaseId,
                                          Grade,
                                          GrowthType,
                                          ChildLev,
                                          ExtGrowth),
    Child1 = Child#child{lev = ChildLev,
                         growth = GrowthVal},
    Child3 = recalc_point(Child1),
    Child4 = calc(Child3, Role),
    Child4;
lev_change(Child = #child{stage = 3}, Lev) ->
    Child1 = Child#child{lev = Lev},
    Child2 = child_skill:recalc_classes_skill(Child1),
    Child3 = recalc_point(Child2),
    Child4 = calc(Child3),
    Child4;
lev_change(Child, _) -> Child.

batch_calc(Role = #role{m_child =
                            #m_child{kids = Kids}}) ->
    UpdateChilds = do_batch_calc(Kids, Role, []),
    Fun = fun (Child, Role1) ->
                  Role2 = child:update_kids(Role1, Child),
                  child:update(Child),
                  Role2
          end,
    NewRole = lists:foldl(Fun, Role, UpdateChilds),
    NewRole.

do_batch_calc([], _Role, Childs) -> Childs;
do_batch_calc([Child = #child{stage = 3, status = 1,
                              follow = RoleId}
               | T],
              Role = #role{id = RoleId}, Childs) ->
    Child1 = lev_change(Child, Role),
    do_batch_calc(T, Role, [Child1 | Childs]);
do_batch_calc([_ | T], Role, Childs) ->
    do_batch_calc(T, Role, Childs).

push_client_childs(Role = #role{id = RoleId,
                                m_child = #m_child{kids = Kids}}) ->
    Childs = [Child
              || Child = #child{stage = 3, status = 1,
                                follow = Follow}
                     <- Kids,
                 Follow =:= RoleId],
    logger:debug("推送子女属性:~w", [Childs], child_attr, 75),
    case Childs of
        [_ | _] -> child_util:push(Role, 18603, Childs);
        _ -> ok
    end.

calc_all_kids([], Kids, _Role) -> Kids;
calc_all_kids([Child | T], Kids, Role) ->
    NewChild = calc(Child, Role),
    calc_all_kids(T, [NewChild | Kids], Role).

calc(Child) -> calc(Child, undefined).

calc(Child = #child{attr = #attr{}}, Role) ->
    InitCalc = #attr_calc{attr = #attr{},
                          attr_no_ratio = #attr{speed = 0},
                          ratio = #attr{speed = 0},
                          attr_no_fc = #attr{speed = 0},
                          ratio_no_fc = #attr{speed = 0}},
    AttrCalc1 = do_calc(base, InitCalc, Child, Role),
    AttrCalc2 = do_calc([point,
                         stone,
                         skill,
                         handbook,
                         mount,
                         skill_prac,
                         guild_element,
                         spirit,
                         talisman],
                        AttrCalc1,
                        Child,
                        Role),
    NewAttrCalc = AttrCalc2,
    {_, _, _, _, _, Growth} = child_skin:calc(Child, Role),
    PointAttrCalc = calc_child_point(Child,
                                     NewAttrCalc,
                                     Growth),
    NewAttr = #attr{hp_max = NewHpMax, mp_max = NewMpMax} =
                  merge_attr(Child, PointAttrCalc),
    Child1 = Child#child{hp = NewHpMax, mp = NewMpMax,
                         attr = NewAttr},
    {HandbookNum, StarHandBookNum, HandBookAttr} =
        handbook_attr:calc_child_handbook_show(Child1, Role),
    NewChild = calc_talent(Child1#child{handbook_attr =
                                            HandBookAttr,
                                        handbook_num = HandbookNum,
                                        star_handbook_num = StarHandBookNum},
                           Role),
    NewChild;
calc(Child, Role) ->
    calc(Child#child{attr = #attr{}}, Role).

do_calc([], Ac, _Child, _Role) -> Ac;
do_calc([Label | T], Ac, Child, Role) ->
    NewAc = do_calc(Label, Ac, Child, Role),
    do_calc(T, NewAc, Child, Role);
do_calc(base, Ac = #attr_calc{attr = AttrVal},
        Child = #child{lev = Lev,
                       child_attr =
                           ChildAttr = #child_attr{hp_aptitude = HpA,
                                                   phy_aptitude = PhyA,
                                                   pdef_aptitude = PdefA,
                                                   magic_aptitude = MagicA,
                                                   aspd_aptitude = AspdA}},
        Role) ->
    AptiRatio = child_data:get_apti_ratio(Lev),
    {PhyA1, PdefA1, HpA1, MagicA1, AspdA1, _Growth} =
        child_skin:calc(Child, Role),
    NewChildAttr = ChildAttr#child_attr{hp_aptitude =
                                            HpA + HpA1,
                                        phy_aptitude = PhyA + PhyA1,
                                        pdef_aptitude = PdefA + PdefA1,
                                        magic_aptitude = MagicA + MagicA1,
                                        aspd_aptitude = AspdA + AspdA1},
    Attr1 = calc_base(NewChildAttr, AptiRatio),
    Attr2 = attr:do_math_add(Attr1, AttrVal),
    Ac#attr_calc{attr = Attr2};
do_calc(skill, Ac = #attr_calc{}, Child, _Role) ->
    NewAc = child_skill:calc_attr(Ac, Child),
    NewAc;
do_calc(stone, Ac = #attr_calc{}, Child, _Role) ->
    NewAc = child_stone:calc_attr(Ac, Child),
    NewAc;
do_calc(handbook, Ac, Child, Role = #role{}) ->
    NewAc = handbook_attr:calc_child(Ac, Child, Role),
    NewAc;
do_calc(handbook, Ac, _Child, _Role) -> Ac;
do_calc(mount, Ac, _Child, Role) ->
    MountAttr = mount_attr:calc_child(Ac, Role),
    MountAttr;
do_calc(skill_prac, Ac, Child, Role = #role{}) ->
    NewAc = skill_prac_attr:calc_child(Ac, Role, Child),
    NewAc;
do_calc(skill_prac, Ac, _Child, _Role) -> Ac;
do_calc(point, Ac = #attr_calc{}, Child, _Role) ->
    #child{child_attr =
               #child_attr{p_str = Str, p_con = Con, p_mag = Mag,
                           p_agi = Agi, p_end = End}} =
        recalc_point(Child),
    Attr = attr_type:to_attr(base,
                             [{101, Str},
                              {102, Con},
                              {103, Mag},
                              {104, Agi},
                              {105, End}]),
    case attr_type:do_attr(Attr, Ac) of
        {false, Reason} ->
            logger:error("子女加点计算出错[~w,~w,~w,~w,~w]:[~w]",
                         [Str, Con, Mag, Agi, End, Reason],
                         child_attr,
                         160),
            Ac;
        {ok, NewAc} -> NewAc
    end;
do_calc(guild_element, Ac, _Child, Role) ->
    NewAc = guild_role:calc_pet(Ac, Role),
    NewAc;
do_calc(spirit, Ac, Child = #child{spirit_attached = 1},
        Role) ->
    SpiritAttr = child_spirit:calc(Ac, Child, Role),
    SpiritAttr;
do_calc(spirit, Ac, _Child, _Role) -> Ac;
do_calc(talisman, Ac, _Child, Role) ->
    talisman_attr:calc_child(Ac, Role);
do_calc(_, Ac, _Child, _Role) -> Ac.

recalc_point(Child = #child{lev = ChildLev,
                            add_point = AddPoint,
                            child_attr =
                                ChildAttr = #child_attr{pre_str = PreStr,
                                                        pre_con = PreCon,
                                                        pre_mag = PreMag,
                                                        pre_agi = PreAgi,
                                                        pre_end = PreEnd}}) ->
    All = ChildLev * 5 + AddPoint,
    {AddStr1, AddCon1, AddMag1, AddAgi1, AddEnd1} = case
                                                        PreStr + PreCon + PreMag
                                                            + PreAgi
                                                            + PreEnd
                                                            =:= 50
                                                        of
                                                        true ->
                                                            AddStr = round(All *
                                                                               PreStr
                                                                               /
                                                                               50),
                                                            AddCon = round(All *
                                                                               PreCon
                                                                               /
                                                                               50),
                                                            AddMag = round(All *
                                                                               PreMag
                                                                               /
                                                                               50),
                                                            AddAgi = round(All *
                                                                               PreAgi
                                                                               /
                                                                               50),
                                                            AddEnd = round(All *
                                                                               PreEnd
                                                                               /
                                                                               50),
                                                            List = [{s, AddStr},
                                                                    {c, AddCon},
                                                                    {m, AddMag},
                                                                    {a, AddAgi},
                                                                    {e,
                                                                     AddEnd}],
                                                            case AddStr + AddCon
                                                                     + AddMag
                                                                     + AddAgi
                                                                     + AddEnd
                                                                     - All
                                                                of
                                                                0 ->
                                                                    {AddStr,
                                                                     AddCon,
                                                                     AddMag,
                                                                     AddAgi,
                                                                     AddEnd};
                                                                Reg
                                                                    when Reg >
                                                                             0 ->
                                                                    List1 =
                                                                        lists:reverse(lists:keysort(2,
                                                                                                    List)),
                                                                    calc_point_list(List1,
                                                                                    Reg);
                                                                Reg ->
                                                                    case
                                                                        lists:reverse(lists:keysort(2,
                                                                                                    List))
                                                                        of
                                                                        [{s,
                                                                          AddStr}
                                                                         | _] ->
                                                                            {AddStr
                                                                                 +
                                                                                 Reg,
                                                                             AddCon,
                                                                             AddMag,
                                                                             AddAgi,
                                                                             AddEnd};
                                                                        [{c,
                                                                          AddCon}
                                                                         | _] ->
                                                                            {AddStr,
                                                                             AddCon
                                                                                 +
                                                                                 Reg,
                                                                             AddMag,
                                                                             AddAgi,
                                                                             AddEnd};
                                                                        [{m,
                                                                          AddMag}
                                                                         | _] ->
                                                                            {AddStr,
                                                                             AddCon,
                                                                             AddMag
                                                                                 +
                                                                                 Reg,
                                                                             AddAgi,
                                                                             AddEnd};
                                                                        [{a,
                                                                          AddAgi}
                                                                         | _] ->
                                                                            {AddStr,
                                                                             AddCon,
                                                                             AddMag,
                                                                             AddAgi
                                                                                 +
                                                                                 Reg,
                                                                             AddEnd};
                                                                        [{e,
                                                                          AddEnd}
                                                                         | _] ->
                                                                            {AddStr,
                                                                             AddCon,
                                                                             AddMag,
                                                                             AddAgi,
                                                                             AddEnd
                                                                                 +
                                                                                 Reg}
                                                                    end
                                                            end;
                                                        _ -> {0, 0, 0, 0, 0}
                                                    end,
    NewChildAttr = ChildAttr#child_attr{point = 0,
                                        p_str = ChildLev + AddStr1,
                                        p_con = ChildLev + AddCon1,
                                        p_mag = ChildLev + AddMag1,
                                        p_agi = ChildLev + AddAgi1,
                                        p_end = ChildLev + AddEnd1},
    NewChild = Child#child{child_attr = NewChildAttr},
    NewChild.

calc_point_list(List, Reg) ->
    calc_point_list(List, Reg, {0, 0, 0, 0, 0}).

calc_point_list([], _,
                {AddStr, AddCon, AddMag, AddAgi, AddEnd}) ->
    {AddStr, AddCon, AddMag, AddAgi, AddEnd};
calc_point_list([{Name, Val} | T], Reg,
                {S, C, M, A, E}) ->
    case Val >= Reg of
        true ->
            L = case Name of
                    s -> {Val - Reg, C, M, A, E};
                    c -> {S, Val - Reg, M, A, E};
                    m -> {S, C, Val - Reg, A, E};
                    a -> {S, C, M, Val - Reg, E};
                    e -> {S, C, M, A, Val - Reg}
                end,
            calc_point_list(T, 0, L);
        _ ->
            L = case Name of
                    s -> {0, C, M, A, E};
                    c -> {S, 0, M, A, E};
                    m -> {S, C, 0, A, E};
                    a -> {S, C, M, 0, E};
                    e -> {S, C, M, A, 0}
                end,
            calc_point_list(T, Reg - Val, L)
    end.

set_point(Role, ChildId, {Str, Con, Mag, Agi, End})
    when Str + Con + Mag + Agi + End =:= 50 orelse
             Str + Con + Mag + Agi + End =:= 0 ->
    AllVal = Str + Con + Mag + Agi + End,
    case child_util:find_child(Role, ChildId, [3]) of
        {true,
         #child{child_attr =
                    #child_attr{pre_str = 0, pre_con = 0, pre_mag = 0,
                                pre_agi = 0, pre_end = 0}}}
            when Str + Con + Mag + Agi + End =:= 0 ->
            {false, lang:get("当前没有设置比例，无需重置")};
        {true,
         #child{child_attr =
                    #child_attr{pre_str = PreStr, pre_con = PreCon,
                                pre_mag = PreMag, pre_agi = PreAgi,
                                pre_end = PreEnd}}}
            when PreStr + PreCon + PreMag + PreAgi + PreEnd =/= 0
                     andalso AllVal =/= 0 ->
            {false, lang:get("请先重置加点再来设置")};
        {true, Child} ->
            Flag = case AllVal =:= 0 of
                       true ->
                           Loss = [#loss{label = coin, val = 500000}],
                           case role_gain:do_notice(Loss, Role) of
                               {ok, Role1} -> {ok, Role1};
                               {false, #loss{msg = Msg}} -> {false, Msg}
                           end;
                       _ -> {ok, Role}
                   end,
            case Flag of
                {ok, NewRole} ->
                    case do_set_point(Child,
                                      {Str, Con, Mag, Agi, End},
                                      Role)
                        of
                        {ok, NewChild, NewChildAttr, ReturnMsg} ->
                            NewRole1 = child:update_kids(NewRole, NewChild),
                            case child_util:update_child(NewRole1, NewChild) of
                                true ->
                                    child_util:push(NewRole1, 18603, NewChild),
                                    {ok, NewRole1, NewChildAttr, ReturnMsg};
                                {false, Reason} -> {false, Reason}
                            end;
                        {false, Reason} -> {false, Reason}
                    end;
                {false, Reason} -> {false, Reason}
            end;
        {false, Reason} -> {false, Reason}
    end;
set_point(_Role, _, _) ->
    {false, lang:get("5项属性分配满50%才可保存方案")}.

do_set_point(Child = #child{child_attr = ChildAttr},
             {Str, Con, Mag, Agi, End}, Role) ->
    NewChildAttr = ChildAttr#child_attr{pre_str = Str,
                                        pre_con = Con, pre_mag = Mag,
                                        pre_agi = Agi, pre_end = End},
    NewChild = Child#child{child_attr = NewChildAttr},
    NewChild1 = recalc_point(NewChild),
    NewChild2 = child_attr:calc(NewChild1, Role),
    Msg = case Str + Con + Mag + Agi + End of
              0 -> lang:get("重置加点方案成功");
              _ -> lang:get("更改子女自动加点成功, 子女将按照方案重新加点")
          end,
    {ok, NewChild2, NewChildAttr, Msg}.

calc_child_point(#child{lev = Lev, growth = Growth},
                 InitCalc = #attr_calc{attr = Attr}, SkinGrowth) ->
    #attr{strength = Str1, constitution = Con1,
          magic = Mag1, agility = Agi1, endurance = End1} =
        Attr,
    Lstr = child_data:get_point_attr({101, Lev}),
    Lcon = child_data:get_point_attr({102, Lev}),
    Lmag = child_data:get_point_attr({103, Lev}),
    Lagi = child_data:get_point_attr({104, Lev}),
    Lend = child_data:get_point_attr({105, Lev}),
    V1 = attr_type:to_attr(base,
                           calc_point_attr(Lstr,
                                           Lcon,
                                           Lmag,
                                           Lagi,
                                           Lend,
                                           Str1,
                                           Con1,
                                           Mag1,
                                           Agi1,
                                           End1,
                                           Growth + SkinGrowth)),
    case attr_type:do_attr(V1, InitCalc) of
        {false, Reason} ->
            logger:error("子女点属性换算出错[~w]:[~w]",
                         [V1, Reason],
                         child_attr,
                         317),
            InitCalc;
        {ok, NewAc} -> NewAc
    end.

calc_point_attr(Lstr, Lcon, Lmag, Lagi, Lend, Str, Con,
                Mag, Agi, End, Growth) ->
    L1 = do_calc_point(Lstr, Str, Growth),
    L2 = do_calc_point(Lcon, Con, Growth),
    L3 = do_calc_point(Lmag, Mag, Growth),
    L4 = do_calc_point(Lagi, Agi, Growth),
    L5 = do_calc_point(Lend, End, Growth),
    L1 ++ L2 ++ L3 ++ L4 ++ L5.

do_calc_point(_L, 0, _) -> [];
do_calc_point(L, Val, Growth) ->
    [{Name, round(V * Val * Growth / 100000)}
     || {Name, V} <- L].

calc_talent(Child, Role) ->
    AptitudeTalent = calc_aptitude_talent(Child, Role),
    SkillTalent = calc_skill_talent(Child),
    Talent = AptitudeTalent + SkillTalent,
    Child#child{talent = round(Talent / 3)}.

calc_aptitude_talent(Child = #child{child_attr =
                                        #child_attr{hp_aptitude = HpA,
                                                    phy_aptitude = PhyA,
                                                    pdef_aptitude = PdefA,
                                                    magic_aptitude = MagicA,
                                                    aspd_aptitude = AspdA}},
                     Role) ->
    {PhyA1, PdefA1, HpA1, MagicA1, AspdA1, _Growth} =
        child_skin:calc(Child, Role),
    round(HpA + PhyA + PdefA + MagicA + AspdA + PhyA1 +
              PdefA1
              + HpA1
              + MagicA1
              + AspdA1).

calc_skill_talent(#child{skills = Skills}) ->
    Fun = fun (#child_skill{step = Step}, Point) ->
                  case Step of
                      1 -> 300 + Point;
                      2 -> 600 + Point;
                      _ -> Point
                  end
          end,
    lists:foldl(Fun, 0, Skills).

calc_base(#child_attr{hp_aptitude = HpA,
                      phy_aptitude = PhyA, pdef_aptitude = PdefA,
                      magic_aptitude = MagicA, aspd_aptitude = AspdA},
          {AptiHp,
           AptiMp,
           AptiPhy,
           AptiPdef,
           AptiMagic,
           AptiMdef,
           AptiAspd}) ->
    #attr{hp_max = round(HpA * AptiHp / 1000),
          mp_max = round(MagicA * AptiMp / 1000),
          phy_dmg = round(PhyA * AptiPhy / 1000),
          magic_dmg = round(MagicA * AptiMagic / 1000),
          phy_def = round(PdefA * AptiPdef / 1000),
          magic_def = round(MagicA * AptiMdef / 1000),
          atk_speed = round(AspdA * AptiAspd / 1000)};
calc_base(_ChildAttr, _AptiRatio) ->
    logger:error("错误的子女属性计算[AptiRatio:~w]",
                 [_AptiRatio],
                 child_attr,
                 391),
    #attr{}.

merge_attr(_Child,
           _InitCalc = #attr_calc{attr = Attr,
                                  attr_no_ratio = AttrNoRatio,
                                  ratio = AttrRatio, attr_no_fc = AttrNoFc,
                                  ratio_no_fc = AttrRatioNoFc}) ->
    Attr1 = attr:do_math_ratio(Attr,
                               attr:do_math_add(AttrRatio, AttrRatioNoFc)),
    Attr2 = attr:do_math_add(Attr1, AttrNoRatio),
    Attr3 = attr:do_math_add(Attr2, AttrNoFc),
    NewAttr = attr:round_attr(Attr3),
    NewAttr.

