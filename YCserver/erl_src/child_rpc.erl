-file("src/mod/child/child_rpc.erl", 1).

-module(child_rpc).

-export([handle/3]).

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

-file("src/mod/child/child_rpc.erl", 11).

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

-file("src/mod/child/child_rpc.erl", 12).

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

-file("src/mod/child/child_rpc.erl", 13).

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

-file("src/mod/child/child_rpc.erl", 14).

-file("inc/package.hrl", 1).

-record(package,
        {type = 1 :: integer(),
         next_id = 1 :: pos_integer(),
         volume = 0 :: non_neg_integer(),
         free_cell = [] :: list(),
         items = [] :: [tuple()]}).

-file("src/mod/child/child_rpc.erl", 15).

handle(18600, {}, Role) ->
    child_util:push(Role, 18600),
    ok;
handle(18609, {}, Role) ->
    case child:deliver(Role) of
        {ok, NewRole} -> {reply, {1, ""}, NewRole};
        {false, Reason} -> {reply, {0, Reason}}
    end;
handle(18611,
       {ChildRid,
        ChildPlat,
        ChildZone,
        Str,
        Con,
        Mag,
        Agi,
        End},
       Role) ->
    ChildId = {ChildRid, ChildPlat, ChildZone},
    role:send_buff_begin(),
    case child_attr:set_point(Role,
                              ChildId,
                              {Str, Con, Mag, Agi, End})
        of
        {ok, NewRole, NewPetAttr, Msg} ->
            role:send_buff_flush(),
            {reply, {ChildId, 1, Msg, NewPetAttr}, NewRole};
        {false, Reason} ->
            role:send_buff_clean(),
            {reply, {ChildId, 0, Reason, #child_attr{}}}
    end;
handle(18612, {ChildRid, ChildPlat, ChildZone},
       #role{m_child = #m_child{kids = Kids}}) ->
    ChildId = {ChildRid, ChildPlat, ChildZone},
    case lists:keyfind(ChildId, #child.id, Kids) of
        #child{child_attr = ChildAttr} ->
            {reply, {ChildId, ChildAttr}};
        _ -> ok
    end;
handle(18616,
       {ChildRid, ChildPlat, ChildZone, 0, HoleId}, Role) ->
    ChildId = {ChildRid, ChildPlat, ChildZone},
    role:send_buff_begin(),
    case child_stone:remove_stone(Role, ChildId, HoleId) of
        {false, Reason} ->
            role:send_buff_clean(),
            {reply, {0, Reason}};
        {ok, NewRole} ->
            role:send_buff_flush(),
            {reply, {1, lang:get("装备卸下成功")}, NewRole}
    end;
handle(18616,
       {ChildRid, ChildPlat, ChildZone, ItemId, HoleId},
       Role = #role{p_bag = #package{items = Items}}) ->
    ChildId = {ChildRid, ChildPlat, ChildZone},
    case lists:keyfind(ItemId, #item.id, Items) of
        Item = #item{} ->
            role:send_buff_begin(),
            case child_stone:use_stone(Role, Item, ChildId, HoleId)
                of
                {false, Reason} ->
                    role:send_buff_clean(),
                    {reply, {0, Reason}};
                {ok, Role1, Msg} ->
                    NewRole = Role1,
                    role:send_buff_flush(),
                    {reply, {1, Msg}, NewRole}
            end;
        _ -> {reply, {0, lang:get("未找到可以使用的道具")}}
    end;
handle(18617, {ChildRid, ChildPlat, ChildZone}, Role) ->
    ChildId = {ChildRid, ChildPlat, ChildZone},
    role:send_buff_begin(),
    case child_stone:upgrade(Role, ChildId) of
        {ok, NewRole, NewGrade} ->
            role:send_buff_flush(),
            {reply, {1, "", ChildId, NewGrade}, NewRole};
        {false, Reason} ->
            role:send_buff_clean(),
            {reply, {0, Reason, ChildId, 0}}
    end;
handle(18618,
       {ChildRid, ChildPlat, ChildZone, ItemBaseId}, Role) ->
    ChildId = {ChildRid, ChildPlat, ChildZone},
    case item:attr(effect, ItemBaseId) of
        [{3, SkillId}] ->
            AllowList = child_data:allow_skills(),
            case lists:member(SkillId, AllowList) of
                false -> {reply, {0, lang:get("孩子不能学习该技能")}};
                true ->
                    role:send_buff_begin(),
                    case child_skill:use_item(Role,
                                              {base_id, ItemBaseId},
                                              SkillId,
                                              ChildId)
                        of
                        {ok, Role1} ->
                            NewRole = Role1,
                            role:send_buff_flush(),
                            {reply, {1, ""}, NewRole};
                        {false, Reason} ->
                            role:send_buff_clean(),
                            {reply, {0, Reason}}
                    end
            end;
        _ -> {reply, {0, lang:get("无法读取技能数据")}}
    end;
handle(18619, {ChildRid, ChildPlat, ChildZone, ItemId},
       Role = #role{p_bag = #package{items = Items}}) ->
    ChildId = {ChildRid, ChildPlat, ChildZone},
    case lists:keyfind(ItemId, #item.id, Items) of
        #item{type = 100, base_id = BaseId} ->
            case item:attr(effect, BaseId) of
                [{3, SkillId}] ->
                    AllowList = child_data:allow_skills(),
                    case lists:member(SkillId, AllowList) of
                        false -> {reply, {0, lang:get("孩子不能学习该技能")}};
                        true ->
                            role:send_buff_begin(),
                            case child_skill:use_item(Role,
                                                      {id, ItemId},
                                                      SkillId,
                                                      ChildId)
                                of
                                {ok, Role1} ->
                                    NewRole = Role1,
                                    role:send_buff_flush(),
                                    {reply, {1, ""}, NewRole};
                                {false, Reason} ->
                                    role:send_buff_clean(),
                                    {reply, {0, Reason}}
                            end
                    end;
                _ -> {reply, {0, lang:get("无法读取技能数据")}}
            end;
        #item{type = 138, base_id = BaseId} ->
            role:send_buff_begin(),
            case child_aptitude:add_max_apt(Role,
                                            ChildId,
                                            BaseId,
                                            ItemId)
                of
                {ok, Role1} ->
                    NewRole = Role1,
                    role:send_buff_flush(),
                    {reply, {1, ""}, NewRole};
                {false, Reason} ->
                    role:send_buff_clean(),
                    {reply, {0, Reason}}
            end;
        Item = #item{type = 140} ->
            role:send_buff_begin(),
            case child_effect:add_hungry(Role, ChildId, Item) of
                {ok, Role1, Msg} ->
                    NewRole = Role1,
                    role:send_buff_flush(),
                    {reply, {1, Msg}, NewRole};
                {false, Reason} ->
                    role:send_buff_clean(),
                    {reply, {0, Reason}}
            end;
        Item = #item{type = 141} ->
            role:send_buff_begin(),
            case child_effect:add_point(Role, ChildId, Item) of
                {ok, Role1, Msg} ->
                    NewRole = Role1,
                    role:send_buff_flush(),
                    {reply, {1, Msg}, NewRole};
                {false, Reason} ->
                    role:send_buff_clean(),
                    {reply, {0, Reason}}
            end;
        #item{type = 139} ->
            role:send_buff_begin(),
            case child_aptitude:add_growth(Role, ChildId, ItemId) of
                {ok, Role1} ->
                    NewRole = Role1,
                    role:send_buff_flush(),
                    {reply, {1, ""}, NewRole};
                {false, Reason} ->
                    role:send_buff_clean(),
                    {reply, {0, Reason}}
            end;
        #item{type = Type} ->
            logger:error("非孩子道具进行使用:~w", [Type], child_rpc, 195),
            {reply, {0, lang:get("非孩子道具不可使用")}};
        _ -> {reply, {0, lang:get("未找到可以使用的道具")}}
    end;
handle(18620,
       {ChildRid, ChildPlat, ChildZone, ItemBaseId, Grade},
       Role) ->
    ChildId = {ChildRid, ChildPlat, ChildZone},
    case item:attr(effect, ItemBaseId) of
        [{60, SkillId}] ->
            role:send_buff_begin(),
            case child_talent:study(Role,
                                    ChildId,
                                    ItemBaseId,
                                    SkillId,
                                    Grade)
                of
                {ok, Role1, Msg} ->
                    NewRole = Role1,
                    role:send_buff_flush(),
                    {reply, {1, Msg}, NewRole};
                {false, Reason} ->
                    role:send_buff_clean(),
                    {reply, {0, Reason}}
            end;
        _ -> {reply, {0, lang:get("不可使用的天赋书")}}
    end;
handle(18621, {ChildRid, ChildPlat, ChildZone, Classes},
       Role)
    when Classes >= 1 andalso Classes =< 6 ->
    ChildId = {ChildRid, ChildPlat, ChildZone},
    case child_infant:choose_classes(Role, ChildId, Classes)
        of
        {ok, NewRole, {BaseId, Classes}} ->
            Msg =
                notice:format(lang:get("恭喜你的小宝贝成为一名~ts{face_1,3}"),
                              [{string_2, 1, format:classes_name(Classes)}]),
            {reply, {1, Msg, ChildId, BaseId, Classes}, NewRole};
        {false, Reason} -> {reply, {0, Reason, ChildId, 0, 0}}
    end;
handle(18622,
       {ChildRid, ChildPlat, ChildZone, ClassesType}, Role)
    when ClassesType >= 1 andalso ClassesType =< 3 ->
    ChildId = {ChildRid, ChildPlat, ChildZone},
    role:send_buff_begin(),
    case child_infant:switch_classes_type(Role,
                                          ChildId,
                                          ClassesType)
        of
        {ok, NewRole, Msg} ->
            role:send_buff_flush(),
            {reply, {1, Msg, ChildId, ClassesType}, NewRole};
        {false, Reason} ->
            role:send_buff_clean(),
            {reply, {0, Reason, ChildId, ClassesType}}
    end;
handle(18623,
       {ChildRid, ChildPlat, ChildZone, StudyType, StudyMode},
       Role)
    when StudyType >= 1 andalso
             StudyType =< 5 andalso
                 (StudyMode =:= 1 orelse StudyMode =:= 2) ->
    ChildId = {ChildRid, ChildPlat, ChildZone},
    role:send_buff_begin(),
    case child_infant:study(Role,
                            ChildId,
                            StudyType,
                            StudyMode)
        of
        {ok, NewRole} ->
            role:send_buff_flush(),
            {reply, {1, ""}, NewRole};
        {false, Reason} ->
            role:send_buff_clean(),
            {reply, {0, Reason}}
    end;
handle(18624,
       {ChildRid, ChildPlat, ChildZone, IsFollow}, Role)
    when IsFollow =:= 1 orelse IsFollow =:= 0 ->
    ChildId = {ChildRid, ChildPlat, ChildZone},
    case IsFollow of
        1 ->
            case child:follow(Role, ChildId) of
                {ok, NewRole} ->
                    {reply, {1, lang:get("携带成功")}, NewRole};
                {false, Reason} -> {reply, {0, Reason}}
            end;
        0 ->
            case child:unfollow(Role, ChildId) of
                {ok, NewRole} ->
                    {reply, {1, lang:get("休息成功")}, NewRole};
                {false, Reason} -> {reply, {0, Reason}}
            end
    end;
handle(18625,
       {ChildRid, ChildPlat, ChildZone, ItemBaseId}, Role) ->
    ChildId = {ChildRid, ChildPlat, ChildZone},
    case item:attr(effect, ItemBaseId) of
        [{60, SkillId}] ->
            role:send_buff_begin(),
            case child_talent:uplev(Role,
                                    ChildId,
                                    ItemBaseId,
                                    SkillId)
                of
                {ok, Role1, Msg} ->
                    NewRole = Role1,
                    role:send_buff_flush(),
                    {reply, {1, Msg}, NewRole};
                {false, Reason} ->
                    role:send_buff_clean(),
                    {reply, {0, Reason}}
            end;
        _ -> {reply, {0, lang:get("不可使用的天赋书")}}
    end;
handle(18626, {}, Role) ->
    child_util:push(Role, 18626),
    ok;
handle(18627, {}, Role) ->
    child_util:push(Role, 18627),
    ok;
handle(18628, {ChildRid, ChildPlat, ChildZone}, Role) ->
    ChildId = {ChildRid, ChildPlat, ChildZone},
    role:send_buff_begin(),
    case child_infant:grow_to_toddler(Role, ChildId) of
        {ok, NewRole} ->
            role:send_buff_flush(),
            {reply, {1, ""}, NewRole};
        {false, Reason} ->
            role:send_buff_clean(),
            {reply, {0, Reason}}
    end;
handle(18629, {ChildRid, ChildPlat, ChildZone, NewName},
       Role) ->
    ChildId = {ChildRid, ChildPlat, ChildZone},
    role:send_buff_begin(),
    case child:rename(Role, ChildId, NewName) of
        {ok, NewRole} ->
            role:send_buff_flush(),
            {reply, {1, lang:get("改名成功{face_1, 3}")}, NewRole};
        {false, Reason} ->
            role:send_buff_clean(),
            {reply, {0, Reason}}
    end;
handle(18630, {ChildRid, ChildPlat, ChildZone}, Role) ->
    ChildId = {ChildRid, ChildPlat, ChildZone},
    role:send_buff_begin(),
    case child:abandon(Role, ChildId) of
        {ok, NewRole, Msg} ->
            role:send_buff_flush(),
            {reply, {1, Msg}, NewRole};
        {wait, Msg} ->
            role:send_buff_flush(),
            {reply, {1, Msg}};
        {false, Reason} ->
            role:send_buff_clean(),
            {reply, {0, Reason}}
    end;
handle(18632, {Decision}, Role) ->
    role:send_buff_begin(),
    case child:reply_abandon(Role, Decision) of
        {ok, NewRole, Msg} ->
            role:send_buff_flush(),
            {reply, {1, Msg}, NewRole};
        {ok, Msg} ->
            role:send_buff_flush(),
            {reply, {1, Msg}};
        {false, Reason} ->
            role:send_buff_clean(),
            {reply, {0, Reason}}
    end;
handle(18633, {ChildRid, ChildPlat, ChildZone},
       #role{m_child = #m_child{kids = Childs}}) ->
    ChildId = {ChildRid, ChildPlat, ChildZone},
    case lists:keyfind(ChildId, #child.id, Childs) of
        #child{combat_talk = CombatTalk, stage = 3} ->
            {reply, {ChildId, CombatTalk}};
        _ -> ok
    end;
handle(18634,
       {ChildRid, ChildPlat, ChildZone, Type, Msg}, Role)
    when Type >= 1 andalso Type =< 7 ->
    ChildId = {ChildRid, ChildPlat, ChildZone},
    case child_effect:set_talk(Role, ChildId, Type, Msg) of
        {ok, NewRole} ->
            {reply,
             {ChildId, 1, lang:get("修改成功"), Type, Msg},
             NewRole};
        {false, Reason} ->
            {reply, {ChildId, 0, Reason, Type, Msg}}
    end;
handle(18635,
       {ChildRid,
        ChildPlat,
        ChildZone,
        StrEasy,
        ConEasy,
        AgiEasy,
        MagEasy,
        EndEasy,
        StrHard,
        ConHard,
        AgiHard,
        MagHard,
        EndHard},
       Role) ->
    ChildId = {ChildRid, ChildPlat, ChildZone},
    case child_infant:set_plan(Role,
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
                                EndHard})
        of
        {ok, NewRole} ->
            Msg =
                notice:format(lang:get("保存计划成功，快去~ts吧{face_1,18}"),
                              [{string_2, 5, lang:get("学习")}]),
            {reply, {ChildId, 1, Msg}, NewRole};
        {false, Reason} -> {reply, {ChildId, 0, Reason}}
    end;
handle(18636, {ChildRid, ChildPlat, ChildZone}, Role) ->
    ChildId = {ChildRid, ChildPlat, ChildZone},
    case child_infant:reset_study(Role, ChildId) of
        {ok, NewRole} ->
            Msg = lang:get("重置成功"),
            {reply, {ChildId, 1, Msg}, NewRole};
        {false, Reason} -> {reply, {ChildId, 0, Reason}}
    end;
handle(18637, {Type}, _Role) ->
    List = case child_rank:fetch(Type) of
               #child_rank{list = L} -> L;
               _ -> []
           end,
    {reply, {Type, List}};
handle(18638, {Id, Platform, ZoneId}, _Role) ->
    case child:fetch({Id, Platform, ZoneId}) of
        [Child = #child{}] ->
            {reply, {Id, Platform, ZoneId, Child}};
        _ -> ok
    end;
handle(18639, {Id, Platform, ZoneId, NoticeLev},
       Role) ->
    case child:set_hungry_notice_lev(Role,
                                     {Id, Platform, ZoneId},
                                     NoticeLev)
        of
        {ok, NewRole} ->
            {reply,
             {1, lang:get("设置成功"), Id, Platform, ZoneId, NoticeLev},
             NewRole};
        {false, Reason} -> {false, Reason};
        _ -> ok
    end;
handle(18640, {ChildId, Platform, ZoneId, SubId},
       Role = #role{}) ->
    case child_spirit:attach(Role,
                             {ChildId, Platform, ZoneId},
                             SubId)
        of
        {ok, Msg, NewRole} -> {reply, {1, Msg}, NewRole};
        {false, Reason} -> {reply, {0, Reason}}
    end;
handle(18641, {SubId}, Role = #role{}) ->
    case child_spirit:unattach(Role, SubId) of
        {ok, Msg, NewRole} -> {reply, {1, Msg}, NewRole};
        {false, Reason} -> {reply, {0, Reason}}
    end;
handle(18642, {Id, Platform, ZoneId, ChildSkinId},
       Role) ->
    ChildId = {Id, Platform, ZoneId},
    logger:debug("~w", [ChildId], child_rpc, 462),
    case child_skin:activate(ChildId, ChildSkinId, Role) of
        {true, ResultFlag, Msg, NewRole} ->
            {reply, {ResultFlag, Msg}, NewRole};
        {false, Reason} -> {reply, {0, Reason}}
    end;
handle(18643, {Id, Platform, ZoneId, ChildSkinId},
       Role) ->
    ChildId = {Id, Platform, ZoneId},
    case child_skin:use_skin(ChildId, ChildSkinId, Role) of
        {true, Msg, NewRole} -> {reply, {1, Msg}, NewRole};
        {false, Msg, NewRole} -> {reply, {0, Msg}, NewRole};
        {false, Reason} -> {reply, {0, Reason}}
    end;
handle(_Cmd, _Data, _Role) ->
    logger:error("模块[~w]收到无效的RPC调用[~w]: ~w",
                 [child_rpc, _Cmd, _Data],
                 child_rpc,
                 483),
    {error, unknow_command}.

