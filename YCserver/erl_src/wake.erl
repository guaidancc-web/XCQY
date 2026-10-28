-file("src/mod/wake/wake.erl", 1).

-module(wake).

-export([init/0,
         adoption/2,
         active/2,
         upgrade/2,
         study/3,
         choose/5]).

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

-file("src/mod/wake/wake.erl", 19).

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

-file("src/mod/wake/wake.erl", 20).

-file("inc/wake.hrl", 1).

-record(m_wake,
        {angel_adoption = 0,
         angel_step = 0,
         angel_energy = 0,
         angel_growth = 0,
         demon_adoption = 0,
         demon_step = 0,
         demon_energy = 0,
         demon_growth = 0,
         angel_skills = [],
         demon_skills = []}).

-record(wake_base_data,
        {type = 1,
         step = 0,
         energy = 0,
         name = "",
         look_id = 0,
         attr = [],
         buff = []}).

-file("src/mod/wake/wake.erl", 21).

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

-file("src/mod/wake/wake.erl", 22).

init() -> #m_wake{}.

adoption(Role = #role{m_wake =
                          Mwake = #m_wake{angel_adoption = 0}},
         1) ->
    case do_adoption(Role, 1) of
        {ok, Role1} ->
            NewMwake = Mwake#m_wake{angel_adoption = 1},
            NewRole = Role1#role{m_wake = NewMwake},
            {ok, NewRole};
        {false, Reason} -> {false, Reason}
    end;
adoption(Role = #role{m_wake =
                          Mwake = #m_wake{demon_adoption = 0}},
         2) ->
    case do_adoption(Role, 2) of
        {ok, Role1} ->
            NewMwake = Mwake#m_wake{demon_adoption = 1},
            NewRole = Role1#role{m_wake = NewMwake},
            {ok, NewRole};
        {false, Reason} -> {false, Reason}
    end;
adoption(_, 1) -> {false, lang:get("已经领养天使,无法再次领养")};
adoption(_, 2) -> {false, lang:get("已经领养恶魔,无法再次领养")}.

do_adoption(Role = #role{lev = Lev}, WakeType) ->
    case wake_data:get_adoption(WakeType) of
        #{need_lev := NeedLev}
            when Lev < NeedLev andalso WakeType =:= 1 ->
            {false,
             util:flist(lang:get("等级不足~w级, 无法领养天使"), [NeedLev])};
        #{need_lev := NeedLev}
            when Lev < NeedLev andalso WakeType =:= 2 ->
            {false,
             util:flist(lang:get("等级不足~w级, 无法领养恶魔"), [NeedLev])};
        #{need_item := NeedItem} ->
            Loss = format:val_to_loss(NeedItem),
            case role_gain:do(Loss, Role) of
                {false, #loss{msg = Msg}} -> {false, Msg};
                {ok, Role1} -> {ok, Role1}
            end;
        _ -> {false, lang:get("无法找到领养条件数据")}
    end.

active(Role = #role{m_wake =
                        Mwake = #m_wake{angel_adoption = 1, angel_step = 0}},
       1) ->
    case do_active(Role, 1) of
        true ->
            Skill = {1, 0, 0, []},
            NewMwake = Mwake#m_wake{angel_step = 1,
                                    angel_skills = [Skill]},
            NewRole = Role#role{m_wake = NewMwake},
            {ok, NewRole};
        {false, Reason} -> {false, Reason}
    end;
active(Role = #role{m_wake =
                        Mwake = #m_wake{demon_adoption = 1, demon_step = 0}},
       2) ->
    case do_active(Role, 2) of
        true ->
            Skill = {1, 0, 0, []},
            NewMwake = Mwake#m_wake{demon_step = 1,
                                    demon_skills = [Skill]},
            NewRole = Role#role{m_wake = NewMwake},
            {ok, NewRole};
        {false, Reason} -> {false, Reason}
    end;
active(#role{m_wake = #m_wake{angel_adoption = 0}},
       1) ->
    {false, lang:get("未领养天使, 无法激活天使")};
active(#role{m_wake = #m_wake{demon_adoption = 0}},
       2) ->
    {false, lang:get("未领养恶魔, 无法激活恶魔")};
active(_, 1) -> {false, lang:get("已经激活天使, 无需再次激活")};
active(_, 2) -> {false, lang:get("已经激活恶魔, 无需再次激活")}.

do_active(Role, WakeType) ->
    case wake_data:get_active(WakeType) of
        Condition = [_ | _] ->
            case role_cond:check(Condition, Role) of
                true -> true;
                {false, Reason} -> {false, Reason}
            end;
        _ -> {false, lang:get("找不到对应的激活条件")}
    end.

upgrade(#role{m_wake = #m_wake{angel_adoption = 0}},
        1) ->
    {false, lang:get("没有领养天使, 无法进阶")};
upgrade(#role{m_wake = #m_wake{angel_step = 0}}, 1) ->
    {false, lang:get("没有激活天使, 无法进阶")};
upgrade(#role{m_wake = #m_wake{demon_adoption = 0}},
        2) ->
    {false, lang:get("没有领养恶魔, 无法进阶")};
upgrade(#role{m_wake = #m_wake{demon_step = 0}}, 2) ->
    {false, lang:get("没有激活恶魔, 无法进阶")};
upgrade(Role = #role{m_wake =
                         Mwake = #m_wake{angel_step = AngelStep,
                                         angel_energy = AngelEnergy,
                                         angel_growth = AngelGrowth,
                                         angel_skills = AngelSkills}},
        1) ->
    case do_upgrade(Role,
                    1,
                    AngelStep,
                    AngelEnergy,
                    AngelGrowth)
        of
        {false, Reason} -> {false, Reason};
        {normal, _Flag, Role1, NewEnergy, NewGrowth} ->
            NewMwake = Mwake#m_wake{angel_energy = NewEnergy,
                                    angel_growth = NewGrowth},
            NewRole = Role1#role{m_wake = NewMwake},
            {ok, NewRole};
        {upgrade, Role1, NewStep} ->
            Skill = {NewStep, 0, 0, []},
            NewAngelSkills = lists:keystore(NewStep,
                                            1,
                                            AngelSkills,
                                            Skill),
            NewMwake = Mwake#m_wake{angel_step = NewStep,
                                    angel_energy = 0, angel_growth = 0,
                                    angel_skills = NewAngelSkills},
            NewRole = Role1#role{m_wake = NewMwake},
            {ok, NewRole}
    end;
upgrade(Role = #role{m_wake =
                         Mwake = #m_wake{demon_step = DemonStep,
                                         demon_energy = DemonEnergy,
                                         demon_growth = DemonGrowth,
                                         demon_skills = DemonSkills}},
        2) ->
    case do_upgrade(Role,
                    2,
                    DemonStep,
                    DemonEnergy,
                    DemonGrowth)
        of
        {false, Reason} -> {false, Reason};
        {normal, _Flag, Role1, NewEnergy, NewGrowth} ->
            NewMwake = Mwake#m_wake{demon_energy = NewEnergy,
                                    demon_growth = NewGrowth},
            NewRole = Role1#role{m_wake = NewMwake},
            {ok, NewRole};
        {upgrade, Role1, NewStep} ->
            Skill = {NewStep, 0, 0, []},
            NewDemonSkills = lists:keystore(NewStep,
                                            1,
                                            DemonSkills,
                                            Skill),
            NewMwake = Mwake#m_wake{demon_step = NewStep,
                                    demon_energy = 0, demon_growth = 0,
                                    demon_skills = NewDemonSkills},
            NewRole = Role1#role{m_wake = NewMwake},
            {ok, NewRole}
    end.

do_upgrade(Role, WakeType, Step, Energy, Growth) ->
    case wake_data:get_upgrade({WakeType, Step, Energy}) of
        #{need_growth := NeedGrowth, rand_growth := RandGrowth,
          need_item := NeedItem, next_step := Step} ->
            Loss = format:val_to_loss(NeedItem),
            case role_gain:do(Loss, Role) of
                {false, #loss{msg = Msg}} -> {false, Msg};
                {ok, Role1} ->
                    {Val, _} = util:rand_list(RandGrowth, 2),
                    Growth1 = Growth + Val,
                    {Flag, NewEnergy, NewGrowth} = case Growth1 >=
                                                            NeedGrowth
                                                       of
                                                       true ->
                                                           {true,
                                                            Energy + 1,
                                                            0};
                                                       false ->
                                                           {false,
                                                            Energy,
                                                            Growth1}
                                                   end,
                    {normal, Flag, Role1, NewEnergy, NewGrowth}
            end;
        #{next_step := 0} -> {false, lang:get("已经进阶到顶阶, 无法进阶")};
        #{need_item := NeedItem, next_step := NextStep} ->
            Loss = format:val_to_loss(NeedItem),
            case role_gain:do(Loss, Role) of
                {false, #loss{msg = Msg}} -> {false, Msg};
                {ok, Role1} -> {upgrade, Role1, NextStep}
            end;
        _ -> {false, lang:get("已经达到进阶条件, 无需培养")}
    end.

study(WakeType, Pos, Role = #role{m_wake = Mwake}) ->
    Loss = [#loss{label = item_base_id,
                  val = [{21144, 1}]}],
    case role_gain:do(Loss, Role) of
        {false, Reason} -> {false, Reason};
        {ok, NewRole} ->
            case do_study(WakeType, Pos, Mwake) of
                {true, NewMwake} ->
                    NRole = NewRole#role{m_wake = NewMwake},
                    {ok, NRole};
                {false, Reason} -> {false, Reason}
            end
    end.

do_study(1, Pos,
         Mwake = #m_wake{angel_step = AngelStep,
                         angel_skills = AngelSkills}) ->
    case lists:keyfind(Pos, 1, AngelSkills) of
        {Pos, SkillId, Lev, _BackSkill} ->
            case wake_data:get_skill({1, AngelStep}) of
                AllSkill = [_ | _] ->
                    {Skill1, _} = util:rand_list(AllSkill, 2),
                    {Skill2, _} = util:rand_list(lists:keydelete(Skill1,
                                                                 1,
                                                                 AllSkill),
                                                 2),
                    NewBackSkill = [Skill1, Skill2],
                    AngelSkill = {Pos, SkillId, Lev, NewBackSkill},
                    NewAngelSkills = lists:keystore(Pos,
                                                    1,
                                                    AngelSkills,
                                                    AngelSkill),
                    {true, Mwake#m_wake{angel_skills = NewAngelSkills}};
                _ -> {false, lang:get("无法找到对应技能数据")}
            end;
        _ -> {false, lang:get("该技能槽还未开放")}
    end;
do_study(2, Pos,
         Mwake = #m_wake{demon_step = DemonStep,
                         demon_skills = DemonSkills}) ->
    case lists:keyfind(Pos, 1, DemonSkills) of
        {Pos, SkillId, Lev, _BackSkill} ->
            case wake_data:get_skill({2, DemonStep}) of
                AllSkill = [_ | _] ->
                    {Skill1, _} = util:rand_list(AllSkill, 2),
                    {Skill2, _} = util:rand_list(lists:keydelete(Skill1,
                                                                 1,
                                                                 AllSkill),
                                                 2),
                    NewBackSkill = [Skill1, Skill2],
                    DemonSkill = {Pos, SkillId, Lev, NewBackSkill},
                    NewDemonSkills = lists:keystore(Pos,
                                                    1,
                                                    DemonSkills,
                                                    DemonSkill),
                    {true, Mwake#m_wake{demon_skills = NewDemonSkills}};
                _ -> {false, lang:get("无法找到对应技能数据")}
            end;
        _ -> {false, lang:get("该技能槽还未开放")}
    end.

choose(WakeType, Pos, Mode, SkillId,
       Role = #role{m_wake = Mwake}) ->
    case do_choose(WakeType, Pos, Mode, SkillId, Mwake) of
        {false, Reason} -> {false, Reason};
        {true, NewMwake} ->
            NewRole = Role#role{m_wake = NewMwake},
            {ok, NewRole}
    end.

do_choose(1, Pos, Mode, NewSkillId,
          Mwake = #m_wake{angel_skills = AngelSkills}) ->
    case lists:keyfind(Pos, 1, AngelSkills) of
        {_Pos, 0, _Lev, _BackSkill} when Mode =:= old ->
            {false, lang:get("未学习过技能, 无法保留")};
        {Pos, SkillId, Lev, BackSkill} ->
            case Mode of
                old ->
                    AngelSkill = {Pos, SkillId, Lev, []},
                    NewAngelSkills = lists:keystore(Pos,
                                                    1,
                                                    AngelSkills,
                                                    AngelSkill),
                    NewMwake = Mwake#m_wake{angel_skills = NewAngelSkills},
                    {true, NewMwake};
                new ->
                    case lists:member(SkillId, BackSkill) of
                        true ->
                            AngelSkill = {Pos, NewSkillId, Lev, []},
                            NewAngelSkills = lists:keystore(Pos,
                                                            1,
                                                            AngelSkills,
                                                            AngelSkill),
                            NewMwake = Mwake#m_wake{angel_skills =
                                                        NewAngelSkills},
                            {true, NewMwake};
                        false -> {false, lang:get("没有该技能可以选择")}
                    end
            end;
        _ -> {false, lang:get("未开放的技能槽, 无法选择")}
    end;
do_choose(2, Pos, Mode, NewSkillId,
          Mwake = #m_wake{demon_skills = DemonSkills}) ->
    case lists:keyfind(Pos, 1, DemonSkills) of
        {_Pos, 0, _Lev, _BackSkill} when Mode =:= old ->
            {false, lang:get("未学习过技能, 无法保留")};
        {Pos, SkillId, Lev, BackSkill} ->
            case Mode of
                old ->
                    DemonSkill = {Pos, SkillId, Lev, []},
                    NewDemonSkills = lists:keystore(Pos,
                                                    1,
                                                    DemonSkills,
                                                    DemonSkill),
                    NewMwake = Mwake#m_wake{demon_skills = NewDemonSkills},
                    {true, NewMwake};
                new ->
                    case lists:member(SkillId, BackSkill) of
                        true ->
                            DemonSkill = {Pos, NewSkillId, Lev, []},
                            NewDemonSkills = lists:keystore(Pos,
                                                            1,
                                                            DemonSkills,
                                                            DemonSkill),
                            NewMwake = Mwake#m_wake{demon_skills =
                                                        NewDemonSkills},
                            {true, NewMwake};
                        false -> {false, lang:get("没有该技能可以选择")}
                    end
            end;
        _ -> {false, lang:get("未开放的技能槽, 无法选择")}
    end.

