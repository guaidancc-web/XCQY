-file("src/mod/skill/skill_rpc.erl", 1).

-module(skill_rpc).

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

-file("src/mod/skill/skill_rpc.erl", 14).

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

-file("src/mod/skill/skill_rpc.erl", 15).

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

-file("src/mod/skill/skill_rpc.erl", 16).

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

-file("src/mod/skill/skill_rpc.erl", 17).

handle(10800, {}, Role) ->
    skill:push_10800(Role),
    ok;
handle(10801, {SkillId}, Role) ->
    role:send_buff_begin(),
    case skill:study(SkillId, Role) of
        {ok, NewRole} ->
            role:send_buff_flush(),
            {reply, {1, ""}, NewRole};
        {false, Reason} ->
            role:send_buff_clean(),
            {reply, {0, Reason}}
    end;
handle(10803, {}, Role) ->
    role:send_buff_begin(),
    case skill:multi_study(Role) of
        {ok, NewRole} ->
            role:send_buff_flush(),
            {reply, {1, ""}, NewRole};
        {false, Reason} ->
            role:send_buff_clean(),
            {reply, {0, Reason}}
    end;
handle(10804, {}, Role) ->
    {Skills, _, _} = skill:get_effect_skill(Role),
    {reply, {Skills}};
handle(10805, {}, Role) ->
    skill_prac:push_skl_prac(Role),
    skill_prac:push_note_times(Role),
    ok;
handle(10806, {Id}, Role) ->
    case skill_prac:set_skill_prac(Id, Role) of
        false -> {reply, {0, Id}};
        {ok, NewRole} -> {reply, {1, Id}, NewRole}
    end;
handle(10807, {Id, 1}, Role) ->
    role:send_buff_begin(),
    case skill_prac:practice(Id, 1, Role) of
        {ok, NewRole} ->
            role:send_buff_flush(),
            {ok, NewRole};
        {false, Msg} ->
            role:send_buff_clean(),
            notice:send(Role, 1, Msg),
            ok;
        _False ->
            role:send_buff_clean(),
            ok
    end;
handle(10807, {Id, Num}, Role) ->
    role:send_buff_begin(),
    case skill_prac:practice(Id, Num, Role) of
        {ok, NewRole} ->
            role:send_buff_flush(),
            {ok, NewRole};
        {false, Msg} ->
            role:send_buff_clean(),
            notice:return(Msg),
            ok;
        _False ->
            role:send_buff_clean(),
            ok
    end;
handle(10808, {}, Role) ->
    skill_life:push(Role),
    ok;
handle(10809, {Id}, Role) ->
    case skill_life:upgrade(Role, Id) of
        {ok, Msg, NewRole} -> {reply, {1, Msg}, NewRole};
        {false, Why} -> {reply, {0, Why}}
    end;
handle(10810, {Id}, Role) ->
    case skill_life:produce(Role, Id) of
        {ok, Msg, BaseId, NewRole} ->
            {reply, {1, Msg, BaseId}, NewRole};
        {false, Why} -> {reply, {0, Why, 0}}
    end;
handle(10811, {}, Role) ->
    case skill_prac:get(Role) of
        {ok, Prac} -> {reply, {1, Prac}};
        {false, Prac} -> {reply, {0, Prac}}
    end;
handle(10812, {BattleId, UnitId}, _Role) ->
    L = skill_prac_box:get_exps({BattleId, UnitId}),
    {reply, {BattleId, UnitId, L}};
handle(10813, {BattleId, UnitId}, Role) ->
    case skill_prac_box:raffle(Role, {BattleId, UnitId}) of
        {ok, Exp, GainExp, NewRole} ->
            {reply, {1, "", Exp, GainExp}, NewRole};
        {false, Why} -> {reply, {0, Why, 0, 0}}
    end;
handle(10814, {}, Role) ->
    case skill_prac_box:get_reward(Role) of
        {ok, NewRole} -> {reply, {1, ""}, NewRole};
        {false, Why} -> {reply, {0, Why}}
    end;
handle(10815, {Id}, Role) ->
    case skill_life:upgrade(Role, Id, 10) of
        {ok, Msg, NewRole} -> {reply, {1, Msg}, NewRole};
        {false, Why} -> {reply, {0, Why}}
    end;
handle(10816, {Id, BaseId}, Role) ->
    case skill_life:produce(Role, Id, BaseId) of
        {ok, Msg, BaseId, NewRole} ->
            {reply, {1, Msg, BaseId}, NewRole};
        {false, Why} -> {reply, {0, Why, 0}}
    end;
handle(10817, {Id}, Role) ->
    role:send_buff_begin(),
    case skill_prac:use_note(Id, Role) of
        {ok, NewRole} ->
            role:send_buff_flush(),
            {ok, NewRole};
        {false, Msg} ->
            role:send_buff_clean(),
            notice:return(Msg),
            ok;
        _False ->
            role:send_buff_clean(),
            ok
    end;
handle(10819, {}, Role) ->
    skill_prac:push_prac_note_limit(Role),
    ok;
handle(10821, {SkillId}, Role) ->
    role:send_buff_begin(),
    case couple_skill:study(Role, SkillId) of
        {ok, NewRole} ->
            role:send_buff_flush(),
            {reply, {1, lang:get("激活成功")}, NewRole};
        {false, Reason} ->
            role:send_buff_clean(),
            {reply, {0, Reason}}
    end;
handle(10822, {},
       Role = #role{m_skill =
                        #m_skill{skill_couple = CoupleSkills}}) ->
    CoupleSkillsLev = couple_skill:calc_lev(Role,
                                            CoupleSkills),
    logger:debug("夫妻技能数据为:~w",
                 [CoupleSkillsLev],
                 skill_rpc,
                 206),
    {reply, {CoupleSkillsLev}};
handle(10823, {Id, Num}, Role) ->
    role:send_buff_begin(),
    case skill_life:upgrade_exp_skill(Role, Id, Num) of
        {ok, Reply, NewRole} ->
            role:send_buff_flush(),
            {reply, Reply, NewRole};
        {false, Msg} ->
            role:send_buff_clean(),
            notice:send(Role, 1, Msg),
            ok;
        _ ->
            role:send_buff_clean(),
            ok
    end;
handle(10824, {SkillId, Flag}, Role) ->
    case skill:speed_attr(Role, SkillId, Flag) of
        {ok, NewRole} ->
            Msg = case Flag of
                      1 -> lang:get("成功取消攻速加成效果");
                      _ -> lang:get("成功开启攻速加成效果")
                  end,
            {reply, {1, Msg}, NewRole};
        {false, Reason} -> {reply, {0, Reason}}
    end;
handle(10825, {}, Role) ->
    skill_unique:push(Role, 10825),
    ok;
handle(10826, {ChiefId}, Role) ->
    case skill_unique:rpc_challenge_chief(Role, ChiefId) of
        {ok, NewRole} -> {reply, {1, ""}, NewRole};
        {false, Reason} -> {reply, {0, Reason}};
        ok -> ok
    end;
handle(10828, {}, Role) ->
    case skill_unique:rpc_double_sq_point(Role) of
        {ok, NewRole} ->
            {reply, {1, lang:get("您开启了绝招历练双倍")}, NewRole};
        {false, Reason} ->
            logger:debug("开启绝招历练双倍失败:~w", [Reason], skill_rpc, 258),
            {reply, {0, Reason}}
    end;
handle(10829, {SkillId}, Role) ->
    case skill_unique:rpc_understand_skill_unique(Role,
                                                  SkillId)
        of
        {ok, NewRole} -> {reply, {1, ""}, NewRole};
        {false, Reason} ->
            logger:debug("领悟绝招技能:~w", [Reason], skill_rpc, 268),
            {reply, {0, Reason}}
    end;
handle(10830, {SkillId}, Role) ->
    case skill_unique:rpc_uplev_skill_unique(Role, SkillId)
        of
        {ok, NewRole} -> {reply, {1, ""}, NewRole};
        {false, Reason} ->
            logger:debug("==========升级失败:~w",
                         [Reason],
                         skill_rpc,
                         278),
            {reply, {0, Reason}}
    end;
handle(10831, {}, Role) ->
    skill_unique:push(Role, 10831),
    ok;
handle(10832, {}, Role) ->
    skill_unique:push(Role, 10832),
    ok;
handle(10833, {}, Role) ->
    skill_unique:push(Role, 10833),
    ok;
handle(10834, {}, Role) ->
    skill_unique:push(Role, 10834),
    ok;
handle(_Cmd, _Data, _Role) ->
    logger:debug("模块[~w]收到无效的RPC调用[~w]: ~w",
                 [skill_rpc, _Cmd, _Data],
                 skill_rpc,
                 307),
    {error, unknow_command}.

