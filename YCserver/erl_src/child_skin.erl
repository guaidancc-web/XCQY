-file("src/mod/child/child_skin.erl", 1).

-module(child_skin).

-author("Suhan").

-export([do/1,
         activate/3,
         use_skin/3,
         calc/2,
         check_expire_time/1,
         get_use_skin/1,
         add_skin_attr/1,
         add_skin_attr/2,
         apply_handle_expire_time/2,
         gm_set_skin_expire_time/2,
         repair_reward/0,
         repair_notice/0,
         do_repair/0]).

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

-file("src/mod/child/child_skin.erl", 30).

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

-file("src/mod/child/child_skin.erl", 31).

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

-file("src/mod/child/child_skin.erl", 32).

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

-file("src/mod/child/child_skin.erl", 33).

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

-file("src/mod/child/child_skin.erl", 34).

do(ChildSkinList) -> do(ChildSkinList, []).

do([], NewChildSkinList) ->
    lists:reverse(NewChildSkinList);
do([ChildSkin | T], ChildSkinList) ->
    case do_child_skin(ChildSkin) of
        {ok, NewChildSkin} ->
            do(T, [NewChildSkin | ChildSkinList]);
        _ -> do(T, ChildSkinList)
    end.

do_child_skin({child_skin,
               Ver = 1,
               SkinId,
               SkinActiveFlag,
               ExpireTime}) ->
    TimerFlag = 0,
    do_child_skin({child_skin,
                   Ver + 1,
                   SkinId,
                   SkinActiveFlag,
                   ExpireTime,
                   TimerFlag});
do_child_skin(Data = #child_skin{ver = 2}) ->
    {ok, Data};
do_child_skin(_Data) ->
    logger:error("子女皮肤转换版本失败~w", [_Data], child_skin, 55),
    false.

use_skin(ChildId, SkinId,
         Role = #role{id = Rid,
                      m_child = OldMChild = #m_child{kids = Kids}}) ->
    case lists:keyfind(ChildId, #child.id, Kids) of
        Child = #child{follow = FollowId,
                       child_skin = ChildSkinList} ->
            case Rid =:= FollowId of
                true ->
                    case lists:keyfind(SkinId,
                                       #child_skin.skin_id,
                                       ChildSkinList)
                        of
                        #child_skin{expire_time = ExpireTime} ->
                            Now = date:unixtime(),
                            case ExpireTime > Now of
                                true ->
                                    NewChildSkinList1 =
                                        do_use_skin(ChildSkinList, SkinId, []),
                                    NewChild1 = Child#child{child_skin =
                                                                NewChildSkinList1},
                                    child:update(NewChild1),
                                    NewKids1 = lists:keystore(ChildId,
                                                              #child.id,
                                                              Kids,
                                                              NewChild1),
                                    NewRole1 = Role#role{m_child =
                                                             OldMChild#m_child{kids
                                                                                   =
                                                                                   NewKids1}},
                                    Msg5 = lang:get("使用成功"),
                                    child_util:push(NewRole1, 18600),
                                    {true, Msg5, NewRole1};
                                _ ->
                                    NewChildSkinList = lists:keydelete(SkinId,
                                                                       #child_skin.skin_id,
                                                                       ChildSkinList),
                                    NewChild = Child#child{child_skin =
                                                               NewChildSkinList},
                                    child:update(NewChild),
                                    NewKids = lists:keystore(ChildId,
                                                             #child.id,
                                                             Kids,
                                                             NewChild),
                                    NewRole = Role#role{m_child =
                                                            OldMChild#m_child{kids
                                                                                  =
                                                                                  NewKids}},
                                    Msg4 = lang:get("皮肤已过期"),
                                    child_util:push(NewRole, 18600),
                                    {false, Msg4, NewRole}
                            end;
                        _ ->
                            Msg3 = lang:get("皮肤未激活"),
                            {false, Msg3}
                    end;
                _ ->
                    Msg2 = lang:get("不是携带状态"),
                    {false, Msg2}
            end;
        _ ->
            Msg1 = lang:get("不存在的孩子"),
            {false, Msg1}
    end.

activate(ChildId, SkinId,
         Role = #role{id = Rid,
                      m_child = OldMChild = #m_child{kids = Kids}}) ->
    case lists:keyfind(ChildId, #child.id, Kids) of
        Child = #child{name = Name, parents = Parents,
                       follow = FollowId, child_skin = OldChildSkinList,
                       sex = Sex} ->
            case Rid =:= FollowId of
                true ->
                    case child_data:get_skin(SkinId) of
                        #{skin_name := SkinName, cost := Cost,
                          duration := Duration, sex := CfgSex} ->
                            case CfgSex =:= Sex of
                                true ->
                                    Loss = format:val_to_loss(Cost),
                                    case role_gain:do(Loss, Role) of
                                        {ok, NewRole} ->
                                            case lists:keyfind(SkinId,
                                                               #child_skin.skin_id,
                                                               OldChildSkinList)
                                                of
                                                OldChildSkin =
                                                    #child_skin{expire_time =
                                                                    OldExpireTime} ->
                                                    NewExpireTime =
                                                        OldExpireTime +
                                                            Duration * 86400,
                                                    NewChildSkin =
                                                        OldChildSkin#child_skin{expire_time
                                                                                    =
                                                                                    NewExpireTime},
                                                    {NewChildSkin1, NewRole1} =
                                                        set_timer(NewChildSkin,
                                                                  Child,
                                                                  NewRole),
                                                    NewChildSkinList =
                                                        lists:keystore(SkinId,
                                                                       #child_skin.skin_id,
                                                                       OldChildSkinList,
                                                                       NewChildSkin1),
                                                    NewChild =
                                                        Child#child{child_skin =
                                                                        NewChildSkinList},
                                                    child:update(NewChild),
                                                    NewKids =
                                                        lists:keystore(ChildId,
                                                                       #child.id,
                                                                       Kids,
                                                                       NewChild),
                                                    Msg5 =
                                                        notice:format(lang:get("<color='#00ffaa'>~ts</color>皮肤持续时间增加<color='#"
                                                                               "00ffaa'>~ts</color>天"),
                                                                      [{string_1,
                                                                        SkinName},
                                                                       {string_1,
                                                                        Duration}]),
                                                    ResRole =
                                                        NewRole1#role{m_child =
                                                                          OldMChild#m_child{kids
                                                                                                =
                                                                                                NewKids}},
                                                    child_util:push(ResRole,
                                                                    18600),
                                                    {true, 2, Msg5, ResRole};
                                                _ ->
                                                    Now = date:unixtime(),
                                                    NewExpireTime1 = Now +
                                                                         Duration
                                                                             *
                                                                             86400,
                                                    NewSkinActiveFlag = case
                                                                            get_use_skin(OldChildSkinList)
                                                                            of
                                                                            #child_skin{skin_id
                                                                                            =
                                                                                            UseSkinId}
                                                                                when
                                                                                  UseSkinId
                                                                                      =/=
                                                                                      SkinId ->
                                                                                1;
                                                                            _ ->
                                                                                2
                                                                        end,
                                                    ChildSkin =
                                                        #child_skin{skin_id =
                                                                        SkinId,
                                                                    skin_active_flag
                                                                        =
                                                                        NewSkinActiveFlag,
                                                                    expire_time
                                                                        =
                                                                        NewExpireTime1},
                                                    {NewChildSkin2, NewRole2} =
                                                        set_timer(ChildSkin,
                                                                  Child,
                                                                  NewRole),
                                                    NewChildSkinList1 =
                                                        lists:keystore(SkinId,
                                                                       #child_skin.skin_id,
                                                                       OldChildSkinList,
                                                                       NewChildSkin2),
                                                    NewChild1 =
                                                        Child#child{child_skin =
                                                                        NewChildSkinList1},
                                                    child:update(NewChild1),
                                                    send_skin_mail(active,
                                                                   Parents,
                                                                   Name,
                                                                   SkinName),
                                                    NewKids1 =
                                                        lists:keystore(ChildId,
                                                                       #child.id,
                                                                       Kids,
                                                                       NewChild1),
                                                    Msg4 =
                                                        notice:format(lang:get("<color='#00ffaa'>~ts</color>成功激活<color='#00ff"
                                                                               "aa'>~ts</color>皮肤"),
                                                                      [{string_1,
                                                                        Name},
                                                                       {string_1,
                                                                        SkinName}]),
                                                    ResRole1 =
                                                        NewRole2#role{m_child =
                                                                          OldMChild#m_child{kids
                                                                                                =
                                                                                                NewKids1}},
                                                    child_util:push(ResRole1,
                                                                    18600),
                                                    {true, 1, Msg4, ResRole1}
                                            end;
                                        _ ->
                                            Msg3 = lang:get("激活失败"),
                                            {false, Msg3}
                                    end;
                                _ ->
                                    Msg6 = lang:get("性别不对哟"),
                                    {false, Msg6}
                            end;
                        _ ->
                            Msg2 = lang:get("不存在的皮肤"),
                            {false, Msg2}
                    end;
                _ ->
                    Msg1 = lang:get("不是跟随状态"),
                    {false, Msg1}
            end;
        _ ->
            Msg = lang:get("不存在的孩子"),
            {false, Msg}
    end.

calc(_Child = #child{child_skin = ChildSkin}, _Role) ->
    calc_skin(ChildSkin).

check_expire_time(Role = #role{m_child =
                                   #m_child{kids = Kids}}) ->
    Now = date:unixtime(),
    NewRole = check_expire_time_for_kids(Role, Kids, Now),
    NewRole.

get_use_skin(ChildSkinList) ->
    case lists:keyfind(2,
                       #child_skin.skin_active_flag,
                       ChildSkinList)
        of
        ChildSkin = #child_skin{} -> ChildSkin;
        _ -> false
    end.

add_skin_attr(Child = #child{}) ->
    [NewChild | _] = add_skin_attr([Child], []),
    NewChild.

add_skin_attr([], Kids) -> lists:reverse(Kids);
add_skin_attr([Child = #child{growth = Growth,
                              child_attr =
                                  ChildAttr = #child_attr{hp_aptitude =
                                                              HpAtitude,
                                                          phy_aptitude =
                                                              PhyAptitude,
                                                          pdef_aptitude =
                                                              PdefAptitude,
                                                          magic_aptitude =
                                                              MagicAptitude,
                                                          aspd_aptitude =
                                                              AspdAptitude,
                                                          max_hp_aptitude =
                                                              MaxHpAptitude,
                                                          max_phy_aptitude =
                                                              MaxPhyAptitude,
                                                          max_pdef_aptitude =
                                                              MaxPdefAptitude,
                                                          max_magic_aptitude =
                                                              MaxMagicAptitude,
                                                          max_aspd_aptitude =
                                                              MaxAspdAptitude},
                              child_skin = ChildSkin}
               | T],
              Kids) ->
    {PhyA, PdefA, HpA, MagicA, AspdA, AddGrowth} =
        calc_skin(ChildSkin),
    NewChildAttr = ChildAttr#child_attr{hp_aptitude =
                                            HpAtitude + HpA,
                                        phy_aptitude = PhyAptitude + PhyA,
                                        pdef_aptitude = PdefAptitude + PdefA,
                                        magic_aptitude = MagicAptitude + MagicA,
                                        aspd_aptitude = AspdAptitude + AspdA,
                                        max_hp_aptitude = MaxHpAptitude + HpA,
                                        max_phy_aptitude =
                                            MaxPhyAptitude + PhyA,
                                        max_pdef_aptitude =
                                            MaxPdefAptitude + PdefA,
                                        max_magic_aptitude =
                                            MaxMagicAptitude + MagicA,
                                        max_aspd_aptitude =
                                            MaxAspdAptitude + AspdA},
    NewChild = Child#child{growth = Growth + AddGrowth,
                           child_attr = NewChildAttr},
    add_skin_attr(T, [NewChild | Kids]).

apply_handle_expire_time(Role = #role{m_child =
                                          MChild = #m_child{kids = Kids}},
                         {ChildId, SkinId}) ->
    case lists:keyfind(ChildId, #child.id, Kids) of
        Child = #child{name = ChildName,
                       child_skin = ChildSkinList, parents = Parents} ->
            case lists:keyfind(SkinId,
                               #child_skin.skin_id,
                               ChildSkinList)
                of
                #child_skin{expire_time = ExpireTime} ->
                    Now = date:unixtime(),
                    case ExpireTime > Now of
                        false ->
                            NewChildSkinList = lists:keydelete(SkinId,
                                                               #child_skin.skin_id,
                                                               ChildSkinList),
                            NewChild = Child#child{child_skin =
                                                       NewChildSkinList},
                            child:update(NewChild),
                            NewKids = lists:keystore(ChildId,
                                                     #child.id,
                                                     Kids,
                                                     NewChild),
                            NewMChild = MChild#m_child{kids = NewKids},
                            NewRole = Role#role{m_child = NewMChild},
                            child_util:push(NewRole, 18600),
                            #{skin_name := SkinName} =
                                child_data:get_skin(SkinId),
                            send_skin_mail(expire,
                                           Parents,
                                           ChildName,
                                           SkinName),
                            {remove, NewRole};
                        _ -> {remove, Role}
                    end;
                _ -> {remove, Role}
            end;
        _ -> {remove, Role}
    end.

gm_set_skin_expire_time(Time,
                        Role = #role{id = Rid,
                                     m_child = #m_child{kids = Kids}}) ->
    FollowKids = [Child
                  || Child = #child{follow = Follow, status = Status}
                         <- Kids,
                     Status =:= 1 andalso Rid =:= Follow],
    NewRole = gm_set_skin_expire_time(Role,
                                      FollowKids,
                                      Time),
    {ok, NewRole}.

gm_set_skin_expire_time(Role, [], _Time) -> Role;
gm_set_skin_expire_time(Role,
                        [Child = #child{child_skin = ChildSkinList} | T],
                        Time) ->
    NewRole = gm_set_skin_expire_time_add_time(Role,
                                               ChildSkinList,
                                               Child,
                                               Time),
    gm_set_skin_expire_time(NewRole, T, Time).

gm_set_skin_expire_time_add_time(Role, [], _Child,
                                 _Time) ->
    Role;
gm_set_skin_expire_time_add_time(Role = #role{m_child =
                                                  MChild = #m_child{kids =
                                                                        Kids}},
                                 [ChildSkin = #child_skin{skin_id = SkinId}
                                  | T],
                                 Child = #child{id = ChildId,
                                                child_skin = ChildSkinList},
                                 Time) ->
    NewChildSkin = ChildSkin#child_skin{expire_time =
                                            date:unixtime() + Time * 60},
    {NewChildSkin1, NewRole1} = set_timer(NewChildSkin,
                                          Child,
                                          Role),
    NewChildSkinList = lists:keystore(SkinId,
                                      #child_skin.skin_id,
                                      ChildSkinList,
                                      NewChildSkin1),
    NewChild = Child#child{child_skin = NewChildSkinList},
    child:update(NewChild),
    NewKids = lists:keystore(ChildId,
                             #child.id,
                             Kids,
                             NewChild),
    NewMChild = MChild#m_child{kids = NewKids},
    NewRole = NewRole1#role{m_child = NewMChild},
    gm_set_skin_expire_time_add_time(NewRole,
                                     T,
                                     NewChild,
                                     Time).

do_use_skin([], _ActiveSkinId, NewSkinList) ->
    NewSkinList;
do_use_skin([OldSkin = #child_skin{skin_id = SkinId}
             | T],
            ActiveSkinId, NewSkinList) ->
    case SkinId =:= ActiveSkinId of
        true ->
            do_use_skin(T,
                        ActiveSkinId,
                        [OldSkin#child_skin{skin_active_flag = 2}
                         | NewSkinList]);
        _ ->
            do_use_skin(T,
                        ActiveSkinId,
                        [OldSkin#child_skin{skin_active_flag = 1}
                         | NewSkinList])
    end.

calc_skin(ChildSkinList) ->
    case get_use_skin(ChildSkinList) of
        #child_skin{skin_id = SkinId} ->
            case child_data:get_skin(SkinId) of
                #{phy_aptitude := PhyA, pdef_aptitude := PdefA,
                  hp_aptitude := HpA, magic_aptitude := MagicA,
                  aspd_aptitude := AspdA, growth := Growth} ->
                    {PhyA, PdefA, HpA, MagicA, AspdA, Growth};
                _ -> {0, 0, 0, 0, 0, 0}
            end;
        _ -> {0, 0, 0, 0, 0, 0}
    end.

check_expire_time_for_kids(Role, [], _Now) -> Role;
check_expire_time_for_kids(Role,
                           [Child = #child{child_skin = ChildSkin} | T], Now) ->
    NewRole = check_expire_time_for_skin(Role,
                                         ChildSkin,
                                         Child,
                                         Now),
    check_expire_time_for_kids(NewRole, T, Now).

check_expire_time_for_skin(Role, [], _Child, _Now) ->
    Role;
check_expire_time_for_skin(Role = #role{m_child =
                                            MChild = #m_child{kids = Kids}},
                           [ChildSkin = #child_skin{skin_id = SkinId,
                                                    expire_time = ExpireTime,
                                                    timer_flag = TimerFlag}
                            | T],
                           Child = #child{id = ChildId,
                                          child_skin = ChildSkinList},
                           Now) ->
    case TimerFlag of
        0 ->
            case date:day_diff(ExpireTime, Now) > 20 of
                false ->
                    NewChildSkin = ChildSkin#child_skin{timer_flag = 1},
                    NewChildSkinList = lists:keystore(SkinId,
                                                      #child_skin.skin_id,
                                                      ChildSkinList,
                                                      NewChildSkin),
                    NewChild = Child#child{child_skin = NewChildSkinList},
                    child:update(NewChild),
                    NewKids = lists:keystore(ChildId,
                                             #child.id,
                                             Kids,
                                             NewChild),
                    NewMChild = MChild#m_child{kids = NewKids},
                    NewRole1 = Role#role{m_child = NewMChild},
                    NewRole = role_timer:add(#timer{id = {ChildId, SkinId},
                                                    timeout =
                                                        max(1,
                                                            ExpireTime -
                                                                date:unixtime())
                                                            * 1000,
                                                    m = child_skin,
                                                    f =
                                                        apply_handle_expire_time,
                                                    a = [{ChildId, SkinId}],
                                                    times = 1},
                                             NewRole1),
                    check_expire_time_for_skin(NewRole, T, Child, Now);
                _ -> check_expire_time_for_skin(Role, T, Child, Now)
            end;
        _ ->
            case ExpireTime < Now of
                true ->
                    NewRole1 = role_timer:set(#timer{id = {ChildId, SkinId},
                                                     timeout =
                                                         max(1,
                                                             ExpireTime -
                                                                 date:unixtime())
                                                             * 1000,
                                                     m = child_skin,
                                                     f =
                                                         apply_handle_expire_time,
                                                     a = [{ChildId, SkinId}],
                                                     times = 1},
                                              Role),
                    check_expire_time_for_skin(NewRole1, T, Child, Now);
                _ -> check_expire_time_for_skin(Role, T, Child, Now)
            end
    end.

set_timer(ChildSkin = #child_skin{skin_id = SkinId,
                                  expire_time = ExpireTime,
                                  timer_flag = TimerFlag},
          #child{id = ChildId}, Role) ->
    Now = date:unixtime(),
    case TimerFlag of
        1 ->
            case ExpireTime < Now of
                true ->
                    NewRole4 = role_timer:set(#timer{id = {ChildId, SkinId},
                                                     timeout =
                                                         max(1,
                                                             ExpireTime - Now)
                                                             * 1000,
                                                     m = child_skin,
                                                     f =
                                                         apply_handle_expire_time,
                                                     a = [{ChildId, SkinId}],
                                                     times = 1},
                                              Role),
                    {ChildSkin, NewRole4};
                _ ->
                    case date:day_diff(ExpireTime, Now) > 20 of
                        true ->
                            NewRole3 = role_timer:del({ChildId, SkinId}, Role),
                            NewChildSkin3 = ChildSkin#child_skin{timer_flag =
                                                                     0},
                            {NewChildSkin3, NewRole3};
                        _ ->
                            NewRole2 = role_timer:set(#timer{id =
                                                                 {ChildId,
                                                                  SkinId},
                                                             timeout =
                                                                 max(1,
                                                                     ExpireTime
                                                                         - Now)
                                                                     * 1000,
                                                             m = child_skin,
                                                             f =
                                                                 apply_handle_expire_time,
                                                             a =
                                                                 [{ChildId,
                                                                   SkinId}],
                                                             times = 1},
                                                      Role),
                            {ChildSkin, NewRole2}
                    end
            end;
        _ ->
            case ExpireTime < Now of
                true ->
                    NewRole1 = role_timer:add(#timer{id = {ChildId, SkinId},
                                                     timeout =
                                                         max(1,
                                                             ExpireTime - Now)
                                                             * 1000,
                                                     m = child_skin,
                                                     f =
                                                         apply_handle_expire_time,
                                                     a = [{ChildId, SkinId}],
                                                     times = 1},
                                              Role),
                    NewChildSkin1 = ChildSkin#child_skin{timer_flag = 1},
                    {NewChildSkin1, NewRole1};
                _ ->
                    case date:day_diff(ExpireTime, Now) > 20 of
                        true -> {ChildSkin, Role};
                        _ ->
                            NewRole = role_timer:add(#timer{id =
                                                                {ChildId,
                                                                 SkinId},
                                                            timeout =
                                                                max(1,
                                                                    ExpireTime -
                                                                        Now)
                                                                    * 1000,
                                                            m = child_skin,
                                                            f =
                                                                apply_handle_expire_time,
                                                            a =
                                                                [{ChildId,
                                                                  SkinId}],
                                                            times = 1},
                                                     Role),
                            NewChildSkin = ChildSkin#child_skin{timer_flag = 1},
                            {NewChildSkin, NewRole}
                    end
            end
    end.

send_skin_mail(_Type, [], _ChildName, _SkinName) -> ok;
send_skin_mail(active, [#child_parent{id = Id} | T],
               ChildName, SkinName) ->
    Title = lang:get("子女皮肤激活"),
    Content =
        notice:format(lang:get("成功激活了<color='#ffff00'>~ts</color>的<color='#ff"
                               "ff00'>~ts</color>皮肤，感觉自己萌萌哒{face_1, "
                               "25}。快带宝宝出去耍酷啦{face_1, 38}"),
                      [{string_1, ChildName}, {string_1, SkinName}]),
    mail:send(Id, Title, Content),
    send_skin_mail(active, T, ChildName, SkinName);
send_skin_mail(expire, [#child_parent{id = Id} | T],
               ChildName, SkinName) ->
    Title = lang:get("子女皮肤到期"),
    Content =
        notice:format(lang:get("<color='#ffff00'>~ts</color>的<color='#ffff00'"
                               ">~ts</color>皮肤到期了，不能陪你们一起愉快玩耍了。可是，人家还是想变成可爱的乖"
                               "宝宝{face_1, 10}"),
                      [{string_1, ChildName}, {string_1, SkinName}]),
    mail:send(Id, Title, Content),
    send_skin_mail(expire, T, ChildName, SkinName).

repair_reward() ->
    repair_send_item(repair_reward_list()).

repair_notice() ->
    repair_send_content(repair_notice_list()).

do_repair() ->
    repair_send_item(repair_reward_list()),
    repair_send_content(repair_notice_list()).

repair_send_item([]) -> ok;
repair_send_item([{RoleId, Item} | RoleList]) ->
    case role_misc:is_local_role(RoleId) of
        true ->
            Title = lang:get("子女皮肤补偿"),
            Content =
                lang:get("亲爱的玩家：\n系统检测您的子女皮肤在更新后出现异常，现已修复问题，并根据您的情况补发相应"
                         "道具，请查收并重新激活"),
            mail:send(RoleId, Title, Content, Item);
        false -> skip
    end,
    repair_send_item(RoleList).

repair_send_content([]) -> ok;
repair_send_content([RoleId | RoleList]) ->
    case role_misc:is_local_role(RoleId) of
        true ->
            Title = lang:get("子女皮肤通知"),
            Content =
                lang:get("亲爱的玩家：\n系统检测您的子女皮肤在更新后出现异常，现已修复问题，并已<color='#"
                         "ffff00'>发放相应的道具给您的伴侣</color>，重新激活即可。若有其他疑问，欢迎"
                         "联系GM进行反馈。"),
            mail:send(RoleId, Title, Content);
        false -> skip
    end,
    repair_send_content(RoleList).

repair_reward_list() ->
    [{{208, "beta", 1}, [{70056, 1}]},
     {{208, "beta", 1}, [{70056, 1}]},
     {{11395, "beta", 16}, [{70056, 1}]},
     {{18969, "beta", 13}, [{70056, 1}]},
     {{38942, "beta", 10}, [{70056, 1}]},
     {{72582, "beta", 1}, [{70056, 1}]},
     {{18969, "beta", 13}, [{70056, 1}]},
     {{18969, "beta", 13}, [{70056, 1}]},
     {{18143, "beta", 10}, [{70056, 1}]},
     {{72569, "beta", 1}, [{70056, 1}]},
     {{33549, "beta", 13}, [{70056, 1}]},
     {{2868, "beta", 6}, [{70056, 1}]},
     {{20116, "beta", 1}, [{70056, 1}]},
     {{29347, "beta", 5}, [{70056, 1}]},
     {{4728, "beta", 13}, [{70056, 1}]},
     {{2868, "beta", 6}, [{70056, 1}]},
     {{47708, "beta", 8}, [{70056, 1}]},
     {{25999, "beta", 5}, [{70056, 1}]},
     {{2868, "beta", 6}, [{70056, 1}]},
     {{495, "beta", 4}, [{70056, 1}]},
     {{5539, "beta", 5}, [{70056, 1}]},
     {{3890, "beta", 14}, [{70056, 1}]},
     {{16, "beta", 3}, [{70056, 1}]},
     {{23428, "beta", 11}, [{70056, 1}]},
     {{5342, "beta", 5}, [{70056, 1}]},
     {{253, "beta", 11}, [{70056, 1}]},
     {{16, "beta", 3}, [{70056, 1}]},
     {{23041, "beta", 3}, [{70056, 1}]},
     {{23041, "beta", 3}, [{70056, 1}]},
     {{11809, "beta", 2}, [{70060, 1}]},
     {{11942, "beta", 2}, [{70056, 1}]},
     {{969, "beta", 10}, [{70056, 1}]},
     {{131, "beta", 2}, [{70056, 1}]},
     {{14919, "beta", 5}, [{70056, 1}]},
     {{9757, "beta", 2}, [{70056, 1}]},
     {{253, "beta", 11}, [{70056, 1}]},
     {{17313, "beta", 3}, [{70056, 1}]},
     {{17313, "beta", 3}, [{70056, 1}]},
     {{17313, "beta", 3}, [{70056, 1}]},
     {{52321, "beta", 11}, [{70056, 1}]},
     {{34447, "beta", 3}, [{70056, 1}]},
     {{52321, "beta", 11}, [{70056, 1}]},
     {{34447, "beta", 3}, [{70056, 1}]},
     {{34447, "beta", 3}, [{70056, 1}]},
     {{12551, "beta", 11}, [{70056, 1}]},
     {{1109, "beta", 1}, [{70056, 1}]},
     {{46957, "beta", 7}, [{70056, 1}]},
     {{19849, "beta", 13}, [{70056, 1}]},
     {{10365, "beta", 6}, [{70056, 1}]},
     {{10365, "beta", 6}, [{70056, 1}]},
     {{27416, "beta", 13}, [{70056, 1}]},
     {{27416, "beta", 13}, [{70056, 1}]},
     {{27416, "beta", 13}, [{70056, 1}]},
     {{2, "beta", 1}, [{70056, 1}]},
     {{2, "beta", 1}, [{70056, 1}]},
     {{208, "beta", 1}, [{70056, 1}]},
     {{2, "beta", 1}, [{70056, 1}]},
     {{2, "beta", 1}, [{70056, 1}]},
     {{2, "beta", 1}, [{70060, 1}]},
     {{208, "beta", 1}, [{70059, 1}]},
     {{208, "beta", 1}, [{70056, 1}]},
     {{2, "beta", 1}, [{70059, 1}]},
     {{2, "beta", 1}, [{70056, 1}]},
     {{2, "beta", 1}, [{70056, 1}]},
     {{208, "beta", 1}, [{70056, 1}]},
     {{208, "beta", 1}, [{70056, 1}]},
     {{7817, "mix", 177}, [{70056, 1}]},
     {{16509, "mix", 183}, [{70056, 1}]},
     {{13148, "mix", 183}, [{70056, 1}]},
     {{287, "mix", 177}, [{70056, 1}]},
     {{9001, "mix", 183}, [{70056, 1}]},
     {{9001, "mix", 183}, [{70056, 1}]},
     {{292, "mix", 183}, [{70056, 1}]},
     {{10430, "mix", 183}, [{70056, 1}]},
     {{10430, "mix", 183}, [{70056, 1}]},
     {{807, "mix", 181}, [{70060, 1}]},
     {{19979, "mix", 180}, [{70056, 1}]},
     {{14529, "mix", 179}, [{70060, 1}]},
     {{520, "mix", 177}, [{70056, 1}]},
     {{287, "mix", 177}, [{70056, 1}]},
     {{211, "mix", 183}, [{70056, 1}]},
     {{1665, "mix", 178}, [{70056, 1}]},
     {{8846, "mix", 181}, [{70056, 1}]},
     {{18, "mix", 184}, [{70056, 1}]},
     {{409, "mix", 180}, [{70056, 1}]},
     {{4100, "mix", 183}, [{70056, 1}]},
     {{257, "mix", 183}, [{70056, 1}]},
     {{182, "mix", 183}, [{70056, 1}]},
     {{297, "mix", 177}, [{70056, 1}]},
     {{14392, "mix", 177}, [{70056, 1}]},
     {{69, "mix", 183}, [{70056, 1}]},
     {{69, "mix", 183}, [{70056, 1}]},
     {{17857, "mix", 183}, [{70056, 1}]},
     {{15375, "mix", 183}, [{70056, 1}]},
     {{15375, "mix", 183}, [{70056, 1}]},
     {{228, "mix", 183}, [{70056, 1}]},
     {{228, "mix", 183}, [{70056, 1}]},
     {{744, "mix", 179}, [{70056, 1}]},
     {{7930, "mix", 178}, [{70056, 1}]},
     {{7930, "mix", 178}, [{70056, 1}]},
     {{19104, "mix", 180}, [{70056, 1}]},
     {{651, "mix", 180}, [{70056, 1}]},
     {{5214, "mix", 183}, [{70056, 1}]},
     {{5214, "mix", 183}, [{70056, 1}]},
     {{240, "mix", 179}, [{70056, 1}]},
     {{11638, "mix", 183}, [{70056, 1}]},
     {{6687, "mix", 181}, [{70056, 1}]},
     {{4730, "mix", 183}, [{70056, 1}]},
     {{69, "mix", 183}, [{70056, 1}]},
     {{2088, "mix", 180}, [{70056, 1}]},
     {{3274, "mix", 179}, [{70056, 1}]},
     {{3274, "mix", 179}, [{70056, 1}]},
     {{9771, "mix", 183}, [{70056, 1}]},
     {{994, "mix", 179}, [{70056, 1}]},
     {{4801, "mix", 179}, [{70056, 1}]},
     {{17902, "mix", 183}, [{70056, 1}]},
     {{17902, "mix", 183}, [{70056, 1}]},
     {{345, "mix", 184}, [{70056, 1}]},
     {{5, "mix", 179}, [{70056, 1}]},
     {{97, "mix", 184}, [{70059, 1}]},
     {{1463, "mix", 180}, [{70056, 1}]},
     {{994, "mix", 179}, [{70060, 1}]},
     {{9841, "mix", 183}, [{70056, 1}]},
     {{13810, "mix", 180}, [{70056, 1}]},
     {{292, "mix", 183}, [{70056, 1}]},
     {{292, "mix", 183}, [{70056, 1}]},
     {{5269, "mix", 183}, [{70056, 1}]},
     {{17007, "mix", 183}, [{70056, 1}]},
     {{17007, "mix", 183}, [{70056, 1}]},
     {{16509, "mix", 183}, [{70056, 1}]},
     {{14188, "mix", 189}, [{70056, 1}]},
     {{1314, "mix", 185}, [{70056, 1}]},
     {{606, "mix", 186}, [{70056, 1}]},
     {{160, "mix", 191}, [{70056, 1}]},
     {{369, "mix", 192}, [{70056, 1}]},
     {{856, "mix", 187}, [{70056, 1}]},
     {{91, "mix", 189}, [{70056, 1}]},
     {{14188, "mix", 189}, [{70056, 1}]},
     {{14188, "mix", 189}, [{70056, 1}]},
     {{5329, "mix", 185}, [{70056, 1}]},
     {{1985, "mix", 187}, [{70056, 1}]},
     {{10738, "mix", 191}, [{70056, 1}]},
     {{14858, "mix", 189}, [{70056, 1}]},
     {{12294, "mix", 185}, [{70056, 1}]},
     {{202, "mix", 191}, [{70056, 1}]},
     {{13134, "mix", 190}, [{70056, 1}]},
     {{59, "mix", 191}, [{70056, 1}]},
     {{6257, "mix", 191}, [{70056, 1}]},
     {{5828, "mix", 191}, [{70056, 1}]},
     {{2564, "mix", 190}, [{70056, 1}]},
     {{8977, "mix", 188}, [{70056, 1}]},
     {{8367, "mix", 185}, [{70056, 1}]},
     {{4185, "mix", 185}, [{70056, 1}]},
     {{1636, "mix", 190}, [{70056, 1}]},
     {{5673, "mix", 189}, [{70056, 1}]},
     {{226, "mix", 188}, [{70056, 1}]},
     {{1825, "mix", 190}, [{70056, 1}]},
     {{2586, "mix", 185}, [{70056, 1}]},
     {{797, "mix", 186}, [{70056, 1}]},
     {{12293, "mix", 185}, [{70056, 1}]},
     {{7534, "mix", 185}, [{70056, 1}]},
     {{3946, "mix", 189}, [{70056, 1}]},
     {{43, "mix", 187}, [{70056, 1}]},
     {{43, "mix", 187}, [{70056, 1}]},
     {{2797, "mix", 191}, [{70056, 1}]},
     {{196, "mix", 189}, [{70056, 1}]},
     {{59, "mix", 187}, [{70056, 1}]},
     {{59, "mix", 187}, [{70056, 1}]},
     {{9480, "mix", 189}, [{70056, 1}]},
     {{3965, "mix", 187}, [{70056, 1}]},
     {{5809, "mix", 191}, [{70056, 1}]},
     {{274, "mix", 189}, [{70056, 1}]},
     {{274, "mix", 189}, [{70056, 1}]},
     {{5809, "mix", 191}, [{70056, 1}]},
     {{5807, "mix", 191}, [{70056, 1}]},
     {{528, "mix", 185}, [{70056, 1}]},
     {{6220, "mix", 190}, [{70056, 1}]},
     {{6220, "mix", 190}, [{70056, 1}]},
     {{216, "mix", 214}, [{70056, 1}]},
     {{12470, "mix", 214}, [{70056, 1}]},
     {{2213, "mix", 214}, [{70056, 1}]},
     {{148, "mix", 214}, [{70056, 1}]},
     {{159, "mix", 213}, [{70056, 1}]},
     {{1019, "mix", 214}, [{70056, 1}]},
     {{9428, "mix", 214}, [{70056, 1}]},
     {{12789, "mix", 214}, [{70056, 1}]},
     {{701, "mix", 213}, [{70056, 1}]},
     {{4821, "mix", 213}, [{70056, 1}]},
     {{2959, "mix", 214}, [{70056, 1}]},
     {{4635, "mix", 213}, [{70056, 1}]},
     {{4214, "mix", 213}, [{70056, 1}]},
     {{565, "mix", 213}, [{70056, 1}]},
     {{238, "mix", 214}, [{70056, 1}]},
     {{12470, "mix", 214}, [{70056, 1}]},
     {{1883, "mix", 214}, [{70056, 1}]},
     {{172, "mix", 214}, [{70056, 1}]},
     {{221, "mix", 214}, [{70056, 1}]},
     {{221, "mix", 214}, [{70056, 1}]},
     {{694, "mix", 214}, [{70056, 1}]},
     {{225, "mix", 214}, [{70056, 1}]},
     {{64, "mix", 213}, [{70056, 1}]},
     {{2478, "mix", 216}, [{70056, 1}]},
     {{28, "mix", 215}, [{70056, 1}]},
     {{4120, "mix", 216}, [{70056, 1}]},
     {{1941, "mix", 216}, [{70056, 1}]},
     {{5662, "mix", 216}, [{70056, 1}]},
     {{308, "mix", 216}, [{70056, 1}]},
     {{2478, "mix", 216}, [{70056, 1}]},
     {{1097, "mix", 216}, [{70056, 1}]},
     {{377, "mix", 216}, [{70056, 1}]},
     {{2424, "mix", 216}, [{70056, 1}]},
     {{1716, "mix", 215}, [{70056, 1}]},
     {{3132, "mix", 215}, [{70056, 1}]},
     {{857, "mix", 216}, [{70056, 1}]},
     {{216, "mix", 215}, [{70056, 1}]},
     {{279, "mix", 227}, [{70056, 1}]},
     {{1256, "mix", 227}, [{70056, 1}]},
     {{8819, "mix", 227}, [{70056, 1}]},
     {{115, "mix", 228}, [{70056, 1}]},
     {{2738, "mix", 228}, [{70056, 1}]},
     {{853, "mix", 204}, [{70056, 1}]},
     {{3595, "mix", 207}, [{70056, 1}]},
     {{248, "mix", 208}, [{70056, 1}]},
     {{1432, "mix", 208}, [{70056, 1}]},
     {{9674, "mix", 208}, [{70056, 1}]},
     {{9468, "mix", 205}, [{70056, 1}]},
     {{11481, "mix", 202}, [{70056, 1}]},
     {{13259, "mix", 207}, [{70056, 1}]},
     {{53, "mix", 206}, [{70056, 1}]},
     {{568, "mix", 206}, [{70056, 1}]},
     {{282, "mix", 205}, [{70056, 1}]},
     {{718, "mix", 205}, [{70056, 1}]},
     {{1173, "mix", 208}, [{70056, 1}]},
     {{4200, "mix", 208}, [{70056, 1}]},
     {{2436, "mix", 206}, [{70056, 1}]},
     {{6268, "mix", 205}, [{70056, 1}]},
     {{7809, "mix", 208}, [{70056, 1}]},
     {{4477, "mix", 206}, [{70056, 1}]},
     {{5294, "mix", 204}, [{70056, 1}]},
     {{4794, "mix", 204}, [{70056, 1}]},
     {{417, "mix", 202}, [{70056, 1}]},
     {{1023, "mix", 204}, [{70056, 1}]},
     {{218, "mix", 202}, [{70056, 1}]},
     {{1173, "mix", 208}, [{70056, 1}]},
     {{159, "mix", 205}, [{70056, 1}]},
     {{33, "mix", 202}, [{70056, 1}]},
     {{991, "mix", 201}, [{70056, 1}]},
     {{1374, "mix", 206}, [{70056, 1}]},
     {{1051, "mix", 204}, [{70056, 1}]},
     {{1219, "mix", 204}, [{70056, 1}]},
     {{1051, "mix", 204}, [{70056, 1}]},
     {{573, "mix", 201}, [{70056, 1}]},
     {{1590, "mix", 201}, [{70056, 1}]},
     {{8621, "mix", 203}, [{70056, 1}]},
     {{218, "mix", 202}, [{70056, 1}]},
     {{201, "mix", 202}, [{70056, 1}]},
     {{975, "mix", 202}, [{70056, 1}]},
     {{201, "mix", 202}, [{70056, 1}]},
     {{805, "mix", 204}, [{70056, 1}]},
     {{861, "mix", 204}, [{70056, 1}]},
     {{10877, "mix", 202}, [{70056, 1}]},
     {{708, "mix", 201}, [{70056, 1}]},
     {{805, "mix", 204}, [{70056, 1}]},
     {{805, "mix", 204}, [{70056, 1}]},
     {{355, "mix", 207}, [{70056, 1}]},
     {{355, "mix", 207}, [{70056, 1}]},
     {{60, "mix", 207}, [{70056, 1}]},
     {{2466, "mix", 208}, [{70056, 1}]},
     {{13707, "mix", 205}, [{70056, 1}]},
     {{463, "mix", 205}, [{70056, 1}]},
     {{545, "mix", 205}, [{70056, 1}]},
     {{642, "mix", 205}, [{70056, 1}]},
     {{463, "mix", 205}, [{70056, 1}]},
     {{1070, "mix", 206}, [{70056, 1}]},
     {{12, "mix", 207}, [{70056, 1}]},
     {{86, "mix", 206}, [{70056, 1}]},
     {{12673, "mix", 207}, [{70056, 1}]},
     {{14728, "mix", 206}, [{70056, 1}]},
     {{9697, "mix", 143}, [{70056, 1}]},
     {{248, "mix", 137}, [{70056, 1}]},
     {{831, "mix", 139}, [{70056, 1}]},
     {{854, "mix", 130}, [{70056, 1}]},
     {{112, "mix", 144}, [{70056, 1}]},
     {{17281, "mix", 141}, [{70056, 1}]},
     {{23257, "mix", 141}, [{70056, 1}]},
     {{23257, "mix", 141}, [{70056, 1}]},
     {{23257, "mix", 141}, [{70056, 1}]},
     {{17281, "mix", 141}, [{70056, 1}]},
     {{23257, "mix", 141}, [{70056, 1}]},
     {{23257, "mix", 141}, [{70056, 1}]},
     {{17281, "mix", 141}, [{70056, 1}]},
     {{8576, "mix", 137}, [{70056, 1}]},
     {{16429, "mix", 138}, [{70056, 1}]},
     {{1853, "mix", 139}, [{70056, 1}]},
     {{246, "mix", 139}, [{70056, 1}]},
     {{201, "mix", 140}, [{70056, 1}]},
     {{9697, "mix", 143}, [{70056, 1}]},
     {{25634, "mix", 130}, [{70056, 1}]},
     {{7599, "mix", 130}, [{70056, 1}]},
     {{1985, "mix", 131}, [{70056, 1}]},
     {{11048, "mix", 132}, [{70056, 1}]},
     {{31358, "mix", 138}, [{70056, 1}]},
     {{2376, "mix", 131}, [{70056, 1}]},
     {{20863, "mix", 139}, [{70056, 1}]},
     {{6506, "mix", 139}, [{70056, 1}]},
     {{20863, "mix", 139}, [{70056, 1}]},
     {{1207, "mix", 138}, [{70056, 1}]},
     {{39678, "mix", 140}, [{70056, 1}]},
     {{39678, "mix", 140}, [{70056, 1}]},
     {{5147, "mix", 140}, [{70060, 1}]},
     {{39678, "mix", 140}, [{70056, 1}]},
     {{5147, "mix", 140}, [{70056, 1}]},
     {{4655, "mix", 131}, [{70056, 1}]},
     {{4655, "mix", 131}, [{70056, 1}]},
     {{48, "mix", 133}, [{70056, 1}]},
     {{624, "mix", 140}, [{70056, 1}]},
     {{17717, "mix", 132}, [{70056, 1}]},
     {{365, "mix", 131}, [{70060, 1}]},
     {{129, "mix", 138}, [{70056, 1}]},
     {{129, "mix", 138}, [{70056, 1}]},
     {{10452, "mix", 132}, [{70056, 1}]},
     {{111, "mix", 131}, [{70056, 1}]},
     {{573, "mix", 140}, [{70056, 1}]},
     {{1346, "mix", 225}, [{70056, 1}]},
     {{7194, "mix", 225}, [{70056, 1}]},
     {{78, "mix", 226}, [{70056, 1}]},
     {{899, "mix", 226}, [{70056, 1}]},
     {{9573, "mix", 226}, [{70056, 1}]},
     {{311, "mix", 226}, [{70056, 1}]},
     {{7151, "mix", 226}, [{70056, 1}]},
     {{4243, "unite", 109}, [{70056, 1}]},
     {{255, "unite", 109}, [{70056, 1}]},
     {{9406, "unite", 110}, [{70056, 1}]},
     {{6016, "unite", 109}, [{70056, 1}]},
     {{740, "unite", 109}, [{70056, 1}]},
     {{80, "unite", 109}, [{70056, 1}]},
     {{63, "unite", 109}, [{70056, 1}]},
     {{7918, "unite", 109}, [{70056, 1}]},
     {{9097, "unite", 110}, [{70056, 1}]},
     {{7783, "unite", 110}, [{70056, 1}]},
     {{12, "unite", 109}, [{70056, 1}]},
     {{4109, "unite", 109}, [{70056, 1}]},
     {{9141, "unite", 110}, [{70056, 1}]},
     {{1290, "unite", 110}, [{70056, 1}]},
     {{1389, "unite", 110}, [{70056, 1}]},
     {{22, "unite", 111}, [{70056, 1}]},
     {{8038, "unite", 111}, [{70056, 1}]},
     {{8038, "unite", 111}, [{70056, 1}]},
     {{6226, "unite", 112}, [{70056, 1}]},
     {{40, "unite", 111}, [{70056, 1}]},
     {{5909, "unite", 112}, [{70056, 1}]},
     {{586, "unite", 112}, [{70056, 1}]},
     {{2431, "unite", 111}, [{70056, 1}]},
     {{301, "unite", 112}, [{70056, 1}]},
     {{489, "unite", 111}, [{70056, 1}]},
     {{4818, "unite", 111}, [{70056, 1}]},
     {{4818, "unite", 111}, [{70056, 1}]},
     {{586, "unite", 112}, [{70056, 1}]},
     {{6509, "unite", 111}, [{70056, 1}]},
     {{6509, "unite", 111}, [{70056, 1}]},
     {{4443, "unite", 111}, [{70056, 1}]},
     {{4443, "unite", 111}, [{70056, 1}]},
     {{144, "unite", 111}, [{70056, 1}]},
     {{7790, "unite", 112}, [{70056, 1}]},
     {{120, "unite", 111}, [{70056, 1}]},
     {{89, "unite", 111}, [{70056, 1}]},
     {{89, "unite", 111}, [{70056, 1}]},
     {{4439, "unite", 111}, [{70056, 1}]},
     {{4439, "unite", 111}, [{70056, 1}]},
     {{1400, "unite", 119}, [{70056, 1}]},
     {{5456, "unite", 119}, [{70056, 1}]},
     {{134, "unite", 119}, [{70056, 1}]},
     {{134, "unite", 119}, [{70056, 1}]},
     {{2834, "unite", 119}, [{70056, 1}]},
     {{2924, "unite", 119}, [{70056, 1}]},
     {{910, "unite", 97}, [{70056, 1}]},
     {{8194, "unite", 98}, [{70056, 1}]},
     {{1852, "unite", 102}, [{70056, 1}]},
     {{930, "unite", 101}, [{70056, 1}]},
     {{775, "unite", 99}, [{70056, 1}]},
     {{1548, "unite", 101}, [{70056, 1}]},
     {{5740, "unite", 98}, [{70056, 1}]},
     {{4031, "unite", 102}, [{70056, 1}]},
     {{5058, "unite", 97}, [{70056, 1}]},
     {{309, "unite", 97}, [{70056, 1}]},
     {{309, "unite", 97}, [{70056, 1}]},
     {{7407, "unite", 101}, [{70056, 1}]},
     {{7407, "unite", 101}, [{70056, 1}]},
     {{157, "unite", 101}, [{70056, 1}]},
     {{2705, "unite", 99}, [{70056, 1}]},
     {{10665, "unite", 103}, [{70056, 1}]},
     {{1091, "unite", 103}, [{70056, 1}]},
     {{3999, "unite", 97}, [{70056, 1}]},
     {{428, "unite", 98}, [{70056, 1}]},
     {{3750, "unite", 101}, [{70056, 1}]},
     {{13042, "unite", 102}, [{70056, 1}]},
     {{718, "unite", 99}, [{70056, 1}]},
     {{665, "unite", 99}, [{70056, 1}]},
     {{5976, "unite", 98}, [{70056, 1}]},
     {{2303, "unite", 104}, [{70056, 1}]},
     {{1005, "unite", 97}, [{70056, 1}]},
     {{283, "unite", 99}, [{70056, 1}]},
     {{403, "unite", 103}, [{70056, 1}]},
     {{403, "unite", 103}, [{70056, 1}]},
     {{5289, "unite", 98}, [{70056, 1}]},
     {{36, "unite", 98}, [{70056, 1}]},
     {{7449, "unite", 103}, [{70056, 1}]},
     {{6238, "unite", 104}, [{70056, 1}]},
     {{71, "unite", 103}, [{70056, 1}]},
     {{3278, "unite", 100}, [{70056, 1}]},
     {{1045, "unite", 99}, [{70056, 1}]},
     {{811, "unite", 99}, [{70056, 1}]},
     {{48, "unite", 101}, [{70056, 1}]},
     {{7289, "unite", 99}, [{70056, 1}]},
     {{5835, "unite", 97}, [{70056, 1}]},
     {{5207, "unite", 101}, [{70056, 1}]},
     {{924, "unite", 98}, [{70056, 1}]},
     {{214, "unite", 99}, [{70056, 1}]},
     {{391, "unite", 100}, [{70056, 1}]},
     {{3642, "unite", 102}, [{70056, 1}]},
     {{292, "unite", 101}, [{70056, 1}]},
     {{292, "unite", 101}, [{70056, 1}]},
     {{292, "unite", 101}, [{70056, 1}]},
     {{789, "unite", 97}, [{70056, 1}]},
     {{97, "unite", 104}, [{70056, 1}]},
     {{3967, "unite", 101}, [{70056, 1}]},
     {{4643, "unite", 102}, [{70056, 1}]},
     {{1071, "unite", 104}, [{70056, 1}]},
     {{8566, "unite", 104}, [{70056, 1}]},
     {{6327, "unite", 97}, [{70056, 1}]},
     {{1022, "unite", 98}, [{70056, 1}]},
     {{5165, "unite", 97}, [{70056, 1}]},
     {{2690, "unite", 98}, [{70056, 1}]},
     {{744, "unite", 98}, [{70056, 1}]},
     {{5870, "unite", 99}, [{70056, 1}]},
     {{8365, "unite", 100}, [{70056, 1}]},
     {{3958, "unite", 100}, [{70056, 1}]},
     {{3958, "unite", 100}, [{70056, 1}]},
     {{2362, "unite", 98}, [{70056, 1}]},
     {{5585, "unite", 98}, [{70056, 1}]},
     {{403, "unite", 100}, [{70060, 1}]},
     {{2224, "unite", 98}, [{70056, 1}]},
     {{2224, "unite", 98}, [{70056, 1}]},
     {{1801, "unite", 97}, [{70056, 1}]},
     {{702, "unite", 98}, [{70056, 1}]},
     {{6026, "unite", 97}, [{70056, 1}]},
     {{702, "unite", 98}, [{70056, 1}]},
     {{92, "unite", 99}, [{70056, 1}]},
     {{5100, "unite", 98}, [{70056, 1}]},
     {{910, "unite", 97}, [{70056, 1}]},
     {{4979, "unite", 101}, [{70056, 1}]},
     {{5056, "unite", 98}, [{70056, 1}]},
     {{4616, "unite", 98}, [{70056, 1}]},
     {{5056, "unite", 98}, [{70056, 1}]},
     {{296, "unite", 99}, [{70056, 1}]},
     {{296, "unite", 99}, [{70056, 1}]},
     {{629, "unite", 98}, [{70056, 1}]},
     {{5058, "unite", 97}, [{70056, 1}]},
     {{4777, "unite", 99}, [{70056, 1}]},
     {{7573, "unite", 99}, [{70056, 1}]},
     {{1627, "unite", 97}, [{70056, 1}]},
     {{2390, "unite", 103}, [{70056, 1}]},
     {{8677, "unite", 103}, [{70056, 1}]},
     {{2507, "unite", 104}, [{70056, 1}]},
     {{174, "unite", 102}, [{70056, 1}]},
     {{20, "unite", 102}, [{70056, 1}]},
     {{8009, "unite", 101}, [{70056, 1}]},
     {{5552, "unite", 102}, [{70056, 1}]},
     {{3810, "unite", 102}, [{70056, 1}]},
     {{3810, "unite", 102}, [{70056, 1}]},
     {{2928, "unite", 102}, [{70056, 1}]},
     {{1852, "unite", 102}, [{70056, 1}]},
     {{940, "unite", 103}, [{70056, 1}]},
     {{2223, "unite", 103}, [{70056, 1}]},
     {{2223, "unite", 103}, [{70056, 1}]},
     {{1012, "unite", 101}, [{70056, 1}]},
     {{2507, "unite", 104}, [{70056, 1}]},
     {{25923, "mix", 121}, [{70056, 1}]},
     {{25923, "mix", 121}, [{70056, 1}]},
     {{202, "mix", 118}, [{70056, 1}]},
     {{4846, "mix", 118}, [{70056, 1}]},
     {{202, "mix", 118}, [{70056, 1}]},
     {{2708, "mix", 114}, [{70056, 1}]},
     {{2543, "mix", 114}, [{70056, 1}]},
     {{9177, "mix", 114}, [{70056, 1}]},
     {{28313, "mix", 114}, [{70056, 1}]},
     {{28313, "mix", 114}, [{70056, 1}]},
     {{13969, "mix", 113}, [{70056, 1}]},
     {{13969, "mix", 113}, [{70056, 1}]},
     {{11317, "mix", 122}, [{70056, 1}]},
     {{11317, "mix", 122}, [{70056, 1}]},
     {{6556, "mix", 121}, [{70056, 1}]},
     {{6556, "mix", 121}, [{70056, 1}]},
     {{1119, "mix", 115}, [{70056, 1}]},
     {{18447, "mix", 115}, [{70056, 1}]},
     {{1119, "mix", 115}, [{70056, 1}]},
     {{1119, "mix", 115}, [{70056, 1}]},
     {{18447, "mix", 115}, [{70056, 1}]},
     {{18447, "mix", 115}, [{70056, 1}]},
     {{25161, "mix", 125}, [{70059, 1}]},
     {{6100, "mix", 128}, [{70056, 1}]},
     {{6100, "mix", 128}, [{70056, 1}]},
     {{172, "mix", 125}, [{70059, 1}]},
     {{172, "mix", 125}, [{70059, 1}]},
     {{4630, "mix", 126}, [{70056, 1}]},
     {{4630, "mix", 126}, [{70056, 1}]},
     {{8392, "mix", 113}, [{70056, 1}]},
     {{8392, "mix", 113}, [{70056, 1}]},
     {{19125, "mix", 116}, [{70056, 1}]},
     {{2242, "mix", 116}, [{70056, 1}]},
     {{1590, "mix", 117}, [{70056, 1}]},
     {{4456, "mix", 124}, [{70056, 1}]},
     {{21592, "mix", 124}, [{70056, 1}]},
     {{1968, "mix", 117}, [{70056, 1}]},
     {{1590, "mix", 117}, [{70056, 1}]},
     {{1036, "mix", 127}, [{70056, 1}]},
     {{1036, "mix", 127}, [{70056, 1}]},
     {{290, "mix", 127}, [{70056, 1}]},
     {{290, "mix", 127}, [{70056, 1}]},
     {{290, "mix", 127}, [{70056, 1}]},
     {{4609, "mix", 125}, [{70056, 1}]},
     {{4609, "mix", 125}, [{70056, 1}]},
     {{290, "mix", 127}, [{70056, 1}]},
     {{4915, "mix", 113}, [{70056, 1}]},
     {{4915, "mix", 113}, [{70056, 1}]},
     {{4915, "mix", 113}, [{70056, 1}]},
     {{13981, "mix", 113}, [{70056, 1}]},
     {{13981, "mix", 113}, [{70056, 1}]},
     {{13981, "mix", 113}, [{70056, 1}]},
     {{13981, "mix", 113}, [{70056, 1}]},
     {{13981, "mix", 113}, [{70056, 1}]},
     {{4915, "mix", 113}, [{70056, 1}]},
     {{6874, "mix", 114}, [{70056, 1}]},
     {{6874, "mix", 114}, [{70056, 1}]},
     {{6874, "mix", 114}, [{70056, 1}]},
     {{6874, "mix", 114}, [{70056, 1}]},
     {{8392, "mix", 113}, [{70056, 1}]},
     {{13969, "mix", 113}, [{70056, 1}]},
     {{20057, "mix", 126}, [{70056, 1}]},
     {{26261, "mix", 126}, [{70056, 1}]},
     {{26261, "mix", 126}, [{70056, 1}]},
     {{2043, "unite", 120}, [{70056, 1}]},
     {{2619, "unite", 120}, [{70056, 1}]}].

repair_notice_list() ->
    [{230, "beta", 9},
     {10125, "beta", 3},
     {5430, "beta", 11},
     {25513, "beta", 5},
     {23428, "beta", 11},
     {12551, "beta", 11},
     {6711, "beta", 8},
     {208, "beta", 1},
     {16130, "mix", 183},
     {252, "mix", 177},
     {9894, "mix", 183},
     {5269, "mix", 183},
     {4577, "mix", 183},
     {1279, "mix", 179},
     {106, "mix", 183},
     {260, "mix", 184},
     {12700, "mix", 177},
     {11701, "mix", 183},
     {17871, "mix", 183},
     {14392, "mix", 177},
     {297, "mix", 177},
     {4730, "mix", 183},
     {15375, "mix", 183},
     {17857, "mix", 183},
     {1298, "mix", 183},
     {20416, "mix", 179},
     {551, "mix", 178},
     {651, "mix", 180},
     {19104, "mix", 180},
     {1462, "mix", 184},
     {447, "mix", 179},
     {7466, "mix", 183},
     {69, "mix", 183},
     {976, "mix", 179},
     {4801, "mix", 179},
     {2424, "mix", 179},
     {2373, "mix", 183},
     {18809, "mix", 180},
     {16852, "mix", 178},
     {292, "mix", 183},
     {1519, "mix", 183},
     {161, "mix", 190},
     {7439, "mix", 186},
     {10738, "mix", 191},
     {926, "mix", 187},
     {1334, "mix", 189},
     {7142, "mix", 185},
     {528, "mix", 185},
     {3707, "mix", 185},
     {283, "mix", 185},
     {2786, "mix", 190},
     {208, "mix", 191},
     {5673, "mix", 189},
     {13398, "mix", 190},
     {6780, "mix", 188},
     {971, "mix", 185},
     {4510, "mix", 190},
     {9966, "mix", 188},
     {3311, "mix", 189},
     {172, "mix", 185},
     {3769, "mix", 189},
     {14125, "mix", 187},
     {9480, "mix", 189},
     {13799, "mix", 187},
     {94, "mix", 187},
     {196, "mix", 189},
     {5807, "mix", 191},
     {241, "mix", 189},
     {5809, "mix", 191},
     {11856, "mix", 185},
     {5290, "mix", 190},
     {172, "mix", 214},
     {1413, "mix", 214},
     {10194, "mix", 214},
     {346, "mix", 213},
     {4298, "mix", 214},
     {2959, "mix", 214},
     {1883, "mix", 214},
     {1361, "mix", 213},
     {4887, "mix", 213},
     {9428, "mix", 214},
     {2374, "mix", 213},
     {819, "mix", 213},
     {225, "mix", 214},
     {12789, "mix", 214},
     {12470, "mix", 214},
     {96, "mix", 214},
     {2087, "mix", 214},
     {238, "mix", 214},
     {213, "mix", 216},
     {8049, "mix", 215},
     {1747, "mix", 216},
     {4367, "mix", 216},
     {6570, "mix", 216},
     {2424, "mix", 216},
     {377, "mix", 216},
     {169, "mix", 215},
     {870, "mix", 215},
     {4120, "mix", 216},
     {51, "mix", 215},
     {5022, "mix", 227},
     {1279, "mix", 227},
     {1810, "mix", 227},
     {127, "mix", 228},
     {3189, "mix", 208},
     {248, "mix", 208},
     {6182, "mix", 208},
     {13954, "mix", 205},
     {975, "mix", 202},
     {3585, "mix", 207},
     {11465, "mix", 206},
     {564, "mix", 206},
     {545, "mix", 205},
     {1522, "mix", 205},
     {1432, "mix", 208},
     {1610, "mix", 208},
     {1204, "mix", 208},
     {9491, "mix", 204},
     {18, "mix", 204},
     {31, "mix", 202},
     {201, "mix", 202},
     {184, "mix", 205},
     {25, "mix", 202},
     {714, "mix", 201},
     {1219, "mix", 204},
     {8587, "mix", 201},
     {2006, "mix", 201},
     {6951, "mix", 204},
     {218, "mix", 202},
     {974, "mix", 202},
     {24, "mix", 204},
     {751, "mix", 207},
     {2277, "mix", 205},
     {12331, "mix", 205},
     {6840, "mix", 205},
     {8975, "mix", 207},
     {1253, "mix", 206},
     {528, "mix", 207},
     {345, "mix", 205},
     {1853, "mix", 139},
     {246, "mix", 139},
     {184, "mix", 143},
     {23257, "mix", 141},
     {17281, "mix", 141},
     {23087, "mix", 140},
     {831, "mix", 139},
     {34, "mix", 140},
     {5313, "mix", 130},
     {30426, "mix", 131},
     {16798, "mix", 132},
     {3589, "mix", 138},
     {20863, "mix", 139},
     {6506, "mix", 139},
     {3894, "mix", 138},
     {5147, "mix", 140},
     {39678, "mix", 140},
     {30924, "mix", 131},
     {369, "mix", 138},
     {1415, "mix", 140},
     {4362, "mix", 225},
     {9168, "mix", 225},
     {3004, "mix", 226},
     {3569, "mix", 226},
     {5915, "mix", 226},
     {142, "mix", 226},
     {598, "mix", 226},
     {3261, "unite", 110},
     {4254, "unite", 109},
     {31, "unite", 109},
     {6644, "unite", 109},
     {3089, "unite", 109},
     {444, "unite", 109},
     {329, "unite", 110},
     {105, "unite", 109},
     {3519, "unite", 109},
     {686, "unite", 110},
     {9049, "unite", 110},
     {214, "unite", 110},
     {8036, "unite", 111},
     {9554, "unite", 112},
     {2037, "unite", 112},
     {583, "unite", 112},
     {2415, "unite", 111},
     {4677, "unite", 111},
     {5951, "unite", 111},
     {4441, "unite", 111},
     {743, "unite", 111},
     {89, "unite", 111},
     {120, "unite", 111},
     {4453, "unite", 111},
     {1620, "unite", 119},
     {4816, "unite", 119},
     {9382, "unite", 119},
     {509, "unite", 119},
     {904, "unite", 97},
     {727, "unite", 98},
     {2699, "unite", 102},
     {3304, "unite", 99},
     {59, "unite", 101},
     {78, "unite", 98},
     {13195, "unite", 102},
     {362, "unite", 97},
     {1586, "unite", 97},
     {157, "unite", 101},
     {7407, "unite", 101},
     {7613, "unite", 99},
     {1091, "unite", 103},
     {10665, "unite", 103},
     {4008, "unite", 97},
     {198, "unite", 97},
     {7865, "unite", 99},
     {283, "unite", 99},
     {440, "unite", 104},
     {665, "unite", 99},
     {1598, "unite", 103},
     {7683, "unite", 98},
     {10311, "unite", 98},
     {97, "unite", 104},
     {3859, "unite", 100},
     {811, "unite", 99},
     {1045, "unite", 99},
     {1103, "unite", 101},
     {7155, "unite", 99},
     {428, "unite", 99},
     {468, "unite", 100},
     {111, "unite", 101},
     {391, "unite", 104},
     {2220, "unite", 101},
     {1155, "unite", 102},
     {1071, "unite", 104},
     {7473, "unite", 97},
     {2706, "unite", 98},
     {192, "unite", 98},
     {3401, "unite", 99},
     {2646, "unite", 100},
     {8946, "unite", 100},
     {7773, "unite", 98},
     {1140, "unite", 98},
     {1005, "unite", 100},
     {5100, "unite", 98},
     {3018, "unite", 97},
     {3408, "unite", 97},
     {6419, "unite", 97},
     {8032, "unite", 99},
     {2224, "unite", 98},
     {4616, "unite", 98},
     {5056, "unite", 98},
     {378, "unite", 99},
     {8116, "unite", 99},
     {120, "unite", 99},
     {7061, "unite", 97},
     {642, "unite", 103},
     {7695, "unite", 104},
     {20, "unite", 102},
     {174, "unite", 102},
     {4979, "unite", 101},
     {12910, "unite", 102},
     {5552, "unite", 102},
     {1107, "unite", 103},
     {4846, "mix", 118},
     {2708, "mix", 114},
     {9177, "mix", 114},
     {300, "mix", 122},
     {18447, "mix", 115},
     {1119, "mix", 115},
     {25161, "mix", 125},
     {3621, "mix", 126},
     {13969, "mix", 113},
     {19125, "mix", 116},
     {4456, "mix", 124},
     {1968, "mix", 117},
     {1036, "mix", 127},
     {4915, "mix", 113},
     {13981, "mix", 113},
     {8392, "mix", 113},
     {20057, "mix", 126},
     {2043, "unite", 120}].

