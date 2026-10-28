-file("src/mod/dungeon/dungeon_rpc.erl", 1).

-module(dungeon_rpc).

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

-file("src/mod/dungeon/dungeon_rpc.erl", 12).

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

-file("src/mod/dungeon/dungeon_rpc.erl", 13).

-file("inc/dungeon.hrl", 1).

-record(m_dungeon,
        {ver = 4,
         dun_id = 0,
         battle_id = 0,
         cards = [],
         unit_rewards = [],
         unit_rewarded = 0}).

-record(dungeon_base,
        {id = 0,
         name = "",
         type = 2,
         need_num = 1,
         cond_enter = [],
         cond_loss = [],
         cross_cond_enter = [],
         cross_cond_loss = [],
         exit_pos = last ::
             last |
             {non_neg_integer(),
              non_neg_integer(),
              non_neg_integer()},
         battle_name_list = [],
         lev_interval = 0,
         unit_list = [],
         lev_max = 0,
         team_dungeon = 0}).

-record(dungeon_role_info,
        {id = {0, "", 0} ::
             {non_neg_integer(), bitstring(), non_neg_integer()},
         score_list = [] :: [tuple()]}).

-record(dungeon_unit_count, {id = 0, num = 0}).

-record(dungeon_score,
        {id = 0,
         score = 0 :: non_neg_integer(),
         grade = 1 :: pos_integer()}).

-record(dungeon_lord_data,
        {unit_id = 0,
         id = 0,
         floor = 0,
         map_id = 0,
         is_lord = 0,
         msg = ""}).

-record(dungeon_lord,
        {key = {0, 0},
         dun_id = 0,
         floor = 0,
         lords = [],
         ranks = []}).

-record(dungeon_lord_role,
        {id,
         name,
         sex = 0 :: 0..1,
         classes = 0 :: 0..6,
         lev = 0 :: non_neg_integer(),
         looks = []}).

-record(dungeon_rank_role,
        {id,
         name,
         sex = 0 :: 0..1,
         classes = 0 :: 0..6,
         lev = 0 :: non_neg_integer(),
         fc = 0,
         looks = [],
         up = 1,
         rank = 0,
         val1 = 0,
         val2 = 0,
         val3 = 0,
         val4 = 0,
         msg1 = "",
         msg2 = "",
         msg3 = ""}).

-record(dungeon_first,
        {key = {0, 0}, dun_id = 0, floor = 0, roles = []}).

-record(dungeon_first_role,
        {id,
         name,
         sex = 0 :: 0..1,
         classes = 0 :: 0..6,
         lev = 0 :: non_neg_integer()}).

-record(dungeon_reward_data,
        {id = 0,
         floor = 0,
         type = 0,
         item_list = [],
         title = "",
         msg = "",
         cast_msg = ""}).

-record(dungeon_team,
        {id = {0, "", 0} :: tuple(),
         leader :: undefined | tuple(),
         members = [] :: list(),
         member_num = 1 :: non_neg_integer(),
         dun_id = 0 :: non_neg_integer(),
         status = 0 :: non_neg_integer(),
         kicked = [] :: list()}).

-record(dungeon_enlistment,
        {id = {0, "", 0} :: tuple(),
         member_num = 1 :: non_neg_integer(),
         dun_id = 0 :: non_neg_integer(),
         leader :: undefined | tuple()}).

-record(dungeon_mate,
        {id = {0, "", 0} :: tuple(),
         name = "" :: string(),
         pid :: undefined | pid(),
         face_id = 0 :: non_neg_integer(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         lev_break_times = 0 :: non_neg_integer(),
         status = 3 :: non_neg_integer(),
         looks = [] :: list(),
         fc = 0 :: non_neg_integer(),
         dun_id = 0 :: non_neg_integer(),
         team_id = {0, "", 0} :: tuple(),
         matched = 0 :: non_neg_integer(),
         join_time = 0 :: non_neg_integer(),
         origin_ids = [] :: list()}).

-record(dungeon_invitation,
        {id = {0, "", 0},
         name = "",
         lev = 0,
         classes = 0,
         sex = 0,
         type = 1,
         team_id = {0, "", 0},
         dun_id = 0,
         dun_name = "",
         time = 0}).

-record(dungeon_card,
        {item_id = 0,
         item_num = 0,
         announce = 0,
         selected = 0}).

-file("src/mod/dungeon/dungeon_rpc.erl", 14).

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

-file("src/mod/dungeon/dungeon_rpc.erl", 15).

handle(12100, {DunId, BattleFlag}, Role)
    when BattleFlag > 0 ->
    case dungeon_util:team_check(enter, Role) of
        false -> {reply, {0, lang:get("您在队伍中, 全员归队后队长才能操作")}};
        {true, TeamList} ->
            role:send_buff_begin(),
            case dungeon:role_enter(Role,
                                    TeamList,
                                    DunId,
                                    BattleFlag)
                of
                {false, Reason} ->
                    role:send_buff_clean(),
                    {reply, {0, Reason}};
                {true, NewRole} ->
                    role:send_buff_flush(),
                    {reply, {1, lang:get("进入副本成功")}, NewRole}
            end
    end;
handle(12100, {_, _}, _Role) ->
    {reply, {0, lang:get("错误的进入副本参数")}};
handle(12101, {}, Role) ->
    case dungeon_util:team_check(exit, Role) of
        false -> {reply, {0, lang:get("您在队伍中, 只有队长和暂离队员才能操作")}};
        {true, Status} ->
            role:send_buff_begin(),
            case dungeon:role_exit(Status, Role) of
                {false, Reason} ->
                    role:send_buff_clean(),
                    {reply, {0, Reason}};
                {ok, NewRole} ->
                    role:send_buff_flush(),
                    {reply, {1, lang:get("")}, NewRole}
            end
    end;
handle(12102, {}, Role = #role{s_event = 1}) ->
    dungeon_util:push_dun_info(Role),
    ok;
handle(12102, {}, _Role) -> ok;
handle(12112, {DunId}, Role) ->
    Reply = case dungeon_data:get(DunId) of
                #dungeon_base{type = 2} ->
                    DunLog = var:get_var(Role, day_five, 100, []),
                    case lists:keyfind(DunId, 1, DunLog) of
                        false -> {DunId, []};
                        {_, Log} -> {DunId, Log}
                    end;
                #dungeon_base{type = 3} ->
                    DunLog = var:get_var(Role, week_five, 203, []),
                    case lists:keyfind(DunId, 1, DunLog) of
                        false -> {DunId, []};
                        {_, Log} -> {DunId, Log}
                    end;
                _ -> {DunId, []}
            end,
    {reply, Reply};
handle(12120, {List},
       _Role = #role{pid = Pid, cross_type = 1}) ->
    cross:cast(dungeon_mgr, push_unit_count, [Pid, List]),
    ok;
handle(12120, {List}, _Role = #role{pid = Pid}) ->
    dungeon_mgr:push_unit_count(Pid, List),
    ok;
handle(12121, {DunId, Floor}, _Role) ->
    List = dungeon_mgr:rank_list(DunId, Floor),
    {reply, {DunId, Floor, List}};
handle(12122, {DunId}, Role) ->
    FloorList = dungeon:floor_list(Role, DunId),
    {reply, {DunId, lists:min(FloorList)}};
handle(12123, {}, Role = #role{}) ->
    dungeon_util:push_role_info(Role),
    ok;
handle(12130, {}, Role = #role{}) ->
    dungeon_team:push(Role, 12130),
    ok;
handle(12131, {DunId}, _Role) ->
    List = dungeon_team:list_enlistment(DunId),
    {reply, {DunId, List}};
handle(12132, {DunId}, Role) ->
    case dungeon_team:enlist(Role, DunId) of
        {ok, NewRole} ->
            {reply, {1, lang:get("开始招募")}, NewRole};
        {false, Why} -> {reply, {0, Why}}
    end;
handle(12133, {}, Role) ->
    case dungeon_team:leave_enlisting(Role) of
        {ok, NewRole} ->
            {reply, {1, lang:get("已取消招募")}, NewRole};
        ok -> {reply, {1, ""}};
        {false, Why} -> {reply, {0, Why}}
    end;
handle(12134, {DunId}, Role) ->
    case dungeon_team:match(Role, DunId) of
        {ok, NewRole} ->
            {reply, {1, lang:get("开始匹配")}, NewRole};
        {false, Why} -> {reply, {0, Why}}
    end;
handle(12135, {}, Role) ->
    case dungeon_team:unmatch(Role) of
        {ok, NewRole} ->
            {reply, {1, lang:get("已取消匹配")}, NewRole};
        ok -> {reply, {1, ""}};
        {false, Why} -> {reply, {0, Why}}
    end;
handle(12136, {I, P, Z, DunId}, Role) ->
    case dungeon_team:join(Role, {I, P, Z}, DunId) of
        {ok, NewRole} ->
            {reply, {1, lang:get("进入队伍")}, NewRole};
        {false, Why} -> {reply, {0, Why}}
    end;
handle(12137, {}, Role) ->
    case dungeon_team:leave(Role) of
        {ok, NewRole} ->
            {reply, {1, lang:get("已离开队伍")}, NewRole};
        ok -> {reply, {1, ""}};
        {false, Why} -> {reply, {0, Why}}
    end;
handle(12138, {R, P, Z}, Role) ->
    case dungeon_team:kickout(Role, {R, P, Z}) of
        {ok, NewRole} ->
            {reply, {1, lang:get("已踢出队伍")}, NewRole};
        ok -> {reply, {1, ""}};
        {false, Why} -> {reply, {0, Why}}
    end;
handle(12139, {}, Role) ->
    case dungeon_team:start(Role) of
        {ok, NewRole} -> {reply, {1, ""}, NewRole};
        {false, Why} -> {reply, {0, Why}}
    end;
handle(12140, {}, Role = #role{}) ->
    dungeon_team:push(Role, 12140),
    ok;
handle(12143, {R, P, Z}, Role) ->
    case dungeon_team:ask_help(Role,
                               #{type => 1, id => {R, P, Z}})
        of
        ok -> {reply, {1, lang:get("成功发送求助信息")}};
        {ok, Role1} -> {reply, {1, ""}, Role1};
        {false, Why} -> {reply, {0, Why}}
    end;
handle(12144, {R, P, Z, T}, Role) ->
    case dungeon_team:answer_help(Role, {R, P, Z}, T) of
        ok -> {reply, {1, ""}};
        {ok, Role1} -> {reply, {1, ""}, Role1};
        {false, Why} -> {reply, {0, Why}}
    end;
handle(12147, {}, Role) ->
    case dungeon_util:open_card(Role) of
        {ok, NewRole} -> {reply, {1, ""}, NewRole};
        {false, Why} -> {reply, {0, Why}}
    end;
handle(12148, {}, Role) ->
    case dungeon_util:buy_cards(Role) of
        {ok, NewRole} -> {reply, {1, ""}, NewRole};
        {false, Why} -> {reply, {0, Why}}
    end;
handle(12149, {DunId}, Role) ->
    case dungeon_team:choose(Role, DunId) of
        ok -> {reply, {1, "", DunId}};
        {false, Why} -> {reply, {0, Why, 0}}
    end;
handle(12150, {}, Role = #role{}) ->
    dungeon_util:push_summary(Role),
    ok;
handle(12151, {}, Role = #role{}) ->
    {ok, NewRole, Reply} = dungeon_util:push_cards(Role),
    logger:debug("副本翻牌数据:~w", [Reply], dungeon_rpc, 246),
    {reply, Reply, NewRole};
handle(12152, {}, Role = #role{}) ->
    dungeon_util:push_has_cards(Role),
    ok;
handle(_Cmd, _Data, _Role) ->
    logger:debug("模块[~w]收到无效的RPC调用[~w]: ~w",
                 [dungeon_rpc, _Cmd, _Data],
                 dungeon_rpc,
                 255),
    {error, unknow_command}.

