-file("src/mod/mount/mount_rpc.erl", 1).

-module(mount_rpc).

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

-file("src/mod/mount/mount_rpc.erl", 11).

-file("inc/pray.hrl", 1).

-record(m_pray,
        {ver = 0 :: pos_integer(),
         day_best = 1 :: non_neg_integer(),
         free_rf_count = 0 :: non_neg_integer(),
         pay_rf_count = 0 :: non_neg_integer(),
         pray_result = [1, 0] :: list(),
         rewards = [] :: list(),
         is_receive = 0 :: 0..1,
         buff = 0 :: non_neg_integer()}).

-file("src/mod/mount/mount_rpc.erl", 12).

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

-file("src/mod/mount/mount_rpc.erl", 13).

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

-file("src/mod/mount/mount_rpc.erl", 14).

handle(17000, {}, Role) ->
    mount:push_mount(Role),
    ok;
handle(17001, {Index}, Role) ->
    role:send_buff_begin(),
    case mount:rpc_ride(Role, Index) of
        {ok, NewRole} ->
            role:send_buff_flush(),
            AttrRole = attr:calc_and_push(NewRole),
            LookRole = looks:calc(AttrRole),
            looks:update_looks(Role, LookRole),
            {reply, {1, ""}, LookRole};
        {false, Msg} ->
            logger:debug("骑乘坐骑错误:~w", [Msg], mount_rpc, 33),
            role:send_buff_clean(),
            {reply, {0, Msg}}
    end;
handle(17002, {Index}, Role) ->
    role:send_buff_begin(),
    case mount:rpc_aaptitude(Role, Index) of
        {ok, NewRole, Msg} ->
            role:send_buff_flush(),
            {reply, {1, Msg}, NewRole};
        {false, Msg} ->
            role:send_buff_clean(),
            {reply, {0, Msg}}
    end;
handle(17003, {Index}, Role) ->
    role:send_buff_begin(),
    case mount:rpc_train(Role, Index) of
        {ok, NewRole} ->
            role:send_buff_flush(),
            mount:push_mount(NewRole),
            {reply, {1, ""}, NewRole};
        {false, Msg} ->
            role:send_buff_clean(),
            {reply, {0, Msg}}
    end;
handle(17005, {Index, SkillIndex}, Role) ->
    role:send_buff_begin(),
    case mount:rpc_upgrade_skill(Role, Index, SkillIndex) of
        {ok, NewRole} ->
            role:send_buff_flush(),
            AttrRole = attr:calc_and_push(NewRole),
            mount:push_mount(AttrRole),
            {reply, {1, ""}, AttrRole};
        {false, Msg} ->
            logger:debug("升级技能失败:~w", [Msg], mount_rpc, 90),
            role:send_buff_clean(),
            {reply, {0, Msg}}
    end;
handle(17006, {Index, IsSureSuccess}, Role) ->
    role:send_buff_begin(),
    case mount:rpc_levup_mount(Role, Index, IsSureSuccess)
        of
        {ok, IsSuc, NewRole} ->
            role:send_buff_flush(),
            mount:push_mount(NewRole),
            {reply, {1, IsSuc, lang:get("")}, NewRole};
        {false, Msg} ->
            logger:debug("升级坐骑失败:~w", [Msg], mount_rpc, 104),
            role:send_buff_clean(),
            {reply, {0, 0, Msg}};
        _ ->
            role:send_buff_clean(),
            ok
    end;
handle(17007, {Index, PetId}, Role) ->
    role:send_buff_begin(),
    case mount:rpc_managet_pet(Role, Index, PetId) of
        {ok, NewRole} ->
            role:send_buff_flush(),
            mount:push_mount(NewRole),
            {reply, {1, lang:get("")}, NewRole};
        {false, Msg} ->
            logger:debug("契约失败:~w", [Msg], mount_rpc, 121),
            role:send_buff_clean(),
            {reply, {0, Msg}};
        _ ->
            role:send_buff_clean(),
            ok
    end;
handle(17008, {}, Role) ->
    mount_goal:push_goal(Role),
    ok;
handle(17009, {}, Role) ->
    role:send_buff_begin(),
    case mount:rpc_get_egg(Role) of
        {ok, NewRole} ->
            role:send_buff_flush(),
            AttrRole = attr:calc_and_push(NewRole),
            Msg =
                notice:format(lang:get("~ts已经激活，快去孵化它吧{face_1,3}"),
                              [{string_2, 5, lang:get("坐骑蛋")}]),
            {reply, {1, Msg}, AttrRole};
        {false, Msg} ->
            logger:debug("获取坐骑蛋失败:~w", [Msg], mount_rpc, 144),
            role:send_buff_clean(),
            {reply, {0, Msg}}
    end;
handle(17010, {}, Role) ->
    role:send_buff_begin(),
    case mount:rpc_hatch(Role) of
        {ok, NewRole, BaseId} ->
            role:send_buff_flush(),
            AttrRole = attr:calc_and_push(NewRole),
            {reply, {1, "", BaseId}, AttrRole};
        {false, Msg} ->
            role:send_buff_clean(),
            {reply, {0, Msg, 0}}
    end;
handle(17011, {Index}, Role) ->
    role:send_buff_begin(),
    case mount:rpc_break_through(Role, Index) of
        {ok, NewRole, SkillList} ->
            role:send_buff_flush(),
            mount:push_mount(NewRole),
            {reply, {1, "突破成功", SkillList}, NewRole};
        {false, Msg} ->
            logger:debug("突破坐骑失败:~w", [Msg], mount_rpc, 171),
            role:send_buff_clean(),
            {reply, {0, Msg, []}}
    end;
handle(17013, {Index, SkillIndex, SkillId}, Role) ->
    role:send_buff_begin(),
    case mount:rpc_rand_skill(Role,
                              Index,
                              SkillIndex,
                              SkillId)
        of
        {ok, NewRole} ->
            role:send_buff_flush(),
            mount:push_mount(NewRole),
            {reply, {1, ""}, NewRole};
        {false, Msg} ->
            logger:debug("洗练技能失败:~w", [Msg], mount_rpc, 185),
            role:send_buff_clean(),
            {reply, {0, Msg}}
    end;
handle(17014, {Index, PetId}, Role) ->
    role:send_buff_begin(),
    case mount:rpc_free_pet(Role, Index, PetId) of
        {ok, NewRole} ->
            role:send_buff_flush(),
            {reply, {1, lang:get("")}, NewRole};
        {false, Msg} ->
            logger:debug("解除灵魂契约失败:~w", [Msg], mount_rpc, 198),
            role:send_buff_clean(),
            {reply, {0, Msg}};
        _ -> ok
    end;
handle(17015, {Index, AppearanceId}, Role) ->
    role:send_buff_begin(),
    case mount:rpc_transfrom_appearance(Role,
                                        Index,
                                        AppearanceId)
        of
        {ok, NewRole} ->
            role:send_buff_flush(),
            LookRole = looks:calc(NewRole),
            looks:update_looks(Role, LookRole),
            {reply, {1, lang:get("")}, LookRole};
        {false, Msg} ->
            logger:debug("幻化失败:~w", [Msg], mount_rpc, 213),
            role:send_buff_clean(),
            {reply, {0, Msg}};
        _ -> ok
    end;
handle(17017, {Index, DecorateId}, Role) ->
    role:send_buff_begin(),
    case mount:rpc_use_decorate(Role, Index, DecorateId) of
        {ok, NewRole, Msg} ->
            role:send_buff_flush(),
            mount:push_mount(NewRole),
            {reply, {1, Msg}, NewRole};
        {false, Msg} ->
            logger:debug("使用饰品失败:~w", [Msg], mount_rpc, 243),
            role:send_buff_clean(),
            {reply, {0, Msg}}
    end;
handle(17018, {Index, SkillIndex}, Role) ->
    role:send_buff_begin(),
    case mount:rpc_init_skill_point(Role, Index, SkillIndex)
        of
        {ok, NewRole, Msg} ->
            role:send_buff_flush(),
            mount:push_mount(NewRole),
            {reply, {1, Msg}, NewRole};
        {false, Msg} ->
            logger:debug("保存技能失败:~w", [Msg], mount_rpc, 257),
            role:send_buff_clean(),
            {reply, {0, Msg}}
    end;
handle(17019, {AppearanceId}, Role) ->
    role:send_buff_begin(),
    case mount:rpc_synthetise_appearance(Role, AppearanceId)
        of
        {ok, NewRole} ->
            role:send_buff_flush(),
            {reply, {1, "合成幻化成功", AppearanceId}, NewRole};
        {false, Msg} ->
            logger:debug("合成碎片失败:~w", [Msg], mount_rpc, 270),
            role:send_buff_clean(),
            {reply, {0, Msg, 0}}
    end;
handle(17022, {AppearanceId}, Role) ->
    case mount:mount_dye(AppearanceId, Role) of
        {ok, NewRole, DyeList} ->
            {reply, {1, "", AppearanceId, DyeList}, NewRole};
        {false, Msg} ->
            logger:debug("坐骑染色失败:~w", [Msg], mount_rpc, 300),
            {reply, {0, Msg, 0, []}};
        _ERR ->
            logger:error("坐骑染色错误:~w", [_ERR], mount_rpc, 303),
            ok
    end;
handle(17023, {AppearanceId, DyeID, Index}, Role) ->
    case mount:mount_dye_confirm(AppearanceId,
                                 DyeID,
                                 Index,
                                 Role)
        of
        {ok, NewRole} ->
            LookRole = looks:calc(NewRole),
            looks:update_looks(Role, LookRole),
            {reply, {1, lang:get("染色坐骑成功！")}, LookRole};
        {false, Msg} -> {reply, {0, Msg}};
        _ERR ->
            logger:error("坐骑选择染色错误:~w", [_ERR], mount_rpc, 318),
            ok
    end;
handle(17024, {AppearanceId}, Role) ->
    case mount:mount_dye_cancel(AppearanceId, Role) of
        {ok, NewRole} ->
            {reply, {1, lang:get("染色坐骑成功！")}, NewRole};
        {false, Msg} -> {reply, {0, Msg}};
        _ERR ->
            logger:error("坐骑取消染色错误:~w", [_ERR], mount_rpc, 330),
            ok
    end;
handle(17025, {AppearanceId}, Role) ->
    case mount:mount_dye_reset(AppearanceId, Role) of
        {ok, NewRole} ->
            LookRole = looks:calc(NewRole),
            looks:update_looks(Role, LookRole),
            {reply, {1, lang:get("还原染色坐骑成功！")}, LookRole};
        {false, Msg} -> {reply, {0, Msg}};
        _ERR ->
            logger:error("坐骑取消染色错误:~w", [_ERR], mount_rpc, 345),
            ok
    end;
handle(17026, {KeyId}, Role) ->
    role:send_buff_begin(),
    case mount:rpc_get_sprog_mount(KeyId, Role) of
        {ok, BaseId, NewRole} ->
            role:send_buff_flush(),
            {reply, {1, BaseId, lang:get("")}, NewRole};
        {false, BaseId, Msg} ->
            role:send_buff_clean(),
            {reply, {0, BaseId, Msg}};
        _ERR ->
            role:send_buff_clean(),
            logger:error("获取新手坐骑错误:~w", [_ERR], mount_rpc, 366),
            ok
    end;
handle(17027, {KeyId}, Role) ->
    role:send_buff_begin(),
    case mount:rpc_convert_sprog(KeyId, Role) of
        {ok, BaseId, NewRole} ->
            role:send_buff_flush(),
            {reply, {1, BaseId, lang:get("")}, NewRole};
        {false, BaseId, Msg} ->
            role:send_buff_clean(),
            {reply, {0, BaseId, Msg}};
        _ERR ->
            role:send_buff_clean(),
            logger:error("兑换新手坐骑错误:~w", [_ERR], mount_rpc, 382),
            ok
    end;
handle(17028, {}, Role) ->
    case mount:rpc_sprog_expire(Role) of
        {Flag, BaseId, Time} ->
            logger:debug("==~w,~w", [BaseId, Time], mount_rpc, 390),
            {reply, {Flag, BaseId, Time}};
        {false, _ERR} ->
            logger:debug("==~ts", [_ERR], mount_rpc, 393),
            {reply, {0, 0, 0}};
        _ERR ->
            logger:error("判断新手坐骑是否过期错误:~w", [_ERR], mount_rpc, 396),
            ok
    end;
handle(17029, {AppearanceId}, Role) ->
    case mount:rpc_buy_mount_evolution(AppearanceId, Role)
        of
        {ok, NewRole, NewId} ->
            {reply, {1, "", NewId}, NewRole};
        {false, Msg} ->
            logger:debug("购买坐骑变身失败:~ts", [Msg], mount_rpc, 406),
            {reply, {0, Msg, 0}};
        _ERR ->
            logger:error("购买坐骑变身错误:~ts", [_ERR], mount_rpc, 409),
            ok
    end;
handle(17030, {AppearanceId}, Role) ->
    case mount:rpc_mount_evolution(AppearanceId, Role) of
        {ok, NewRole, NewId} ->
            {reply, {1, "", NewId}, NewRole};
        {false, Msg} ->
            logger:debug("坐骑变身失败:~ts", [Msg], mount_rpc, 419),
            {reply, {0, Msg, 0}};
        _ERR ->
            logger:error("坐骑变身错误:~ts", [_ERR], mount_rpc, 422),
            ok
    end;
handle(17031, {Pid, Plat, ZoneId}, Role) ->
    case mount:rpc_invite_rode(Role, {Pid, Plat, ZoneId}) of
        {ok, NewRole} -> {reply, {1, ""}, NewRole};
        {false, Msg} ->
            logger:debug("邀请共骑失败:~ts", [Msg], mount_rpc, 432),
            {reply, {0, Msg}}
    end;
handle(17034, {Flag, Rid, Plat, ZoneId}, Role) ->
    case mount:rpc_is_join_rode(Role,
                                Flag,
                                {Rid, Plat, ZoneId})
        of
        {ok, NewRole} -> {reply, {1, ""}, NewRole};
        {false, Msg, NewRole} ->
            logger:debug("同意或拒绝失败:~ts", [Msg], mount_rpc, 442),
            {reply, {0, Msg}, NewRole}
    end;
handle(17035, {}, Role) ->
    case mount:rpc_exit_rode(Role) of
        {ok, NewRole} -> {reply, {1, ""}, NewRole};
        _ ->
            logger:debug("退出共骑失败", [], mount_rpc, 452),
            {reply, {0, "退出共骑失败"}}
    end;
handle(_Cmd, _Data, _Role) ->
    logger:debug("模块[~w]收到无效的RPC调用[~w]: ~w",
                 [mount_rpc, _Cmd, _Data],
                 mount_rpc,
                 458),
    {error, unknow_command}.

