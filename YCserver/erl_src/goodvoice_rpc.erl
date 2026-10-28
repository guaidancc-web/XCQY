-file("src/mod/goodvoice/goodvoice_rpc.erl", 1).

-module(goodvoice_rpc).

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

-file("src/mod/goodvoice/goodvoice_rpc.erl", 14).

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

-file("src/mod/goodvoice/goodvoice_rpc.erl", 15).

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

-file("src/mod/goodvoice/goodvoice_rpc.erl", 16).

-file("inc/condition.hrl", 1).

-record(condition,
        {label :: undefined | atom(),
         op = eq ::
             ue | eq | lt | gt | le | ge | range | include,
         val :: undefined | term(),
         msg = "" :: list()}).

-file("src/mod/goodvoice/goodvoice_rpc.erl", 17).

-file("inc/goodvoice.hrl", 1).

-record(goodvoice,
        {ver = 4,
         role_id = {0, "", 0},
         id = 0,
         platform = "",
         zone_id = 0,
         name = "",
         sex = 0,
         lev = 0,
         classes = 0,
         time = 0,
         summary = "",
         update_time = 0,
         file_name = "",
         liked = 0,
         likers = [],
         flower_likers = [],
         today_flower = 0,
         update_flower = 0,
         caster_num = 0,
         caster = [],
         logs = [],
         only_liked = 0,
         flower = 0}).

-record(goodvoice_report_info,
        {id, time, lev, name, report = []}).

-record(goodvoice_report,
        {id, order, name, lev, time, filename}).

-record(goodvoice_rank,
        {ver = 1,
         role_id = {0, "", 0},
         id = 0,
         platform = "",
         zone_id = 0,
         name = "",
         sex = 0,
         lev = 0,
         classes = 0,
         time = 0,
         summary = "",
         update_time = 0,
         file_name = "",
         liked = 0,
         today_flower = 0,
         update_flower = 0,
         caster_num = 0,
         rank = 0,
         only_liked = 0,
         flower = 0}).

-file("src/mod/goodvoice/goodvoice_rpc.erl", 18).

handle(16800, {Summary, Voice, Time},
       Role = #role{lev = Lev}) ->
    logger:debug("好声音文件内容 ~w", [Voice], goodvoice_rpc, 21),
    case Lev >= 40 of
        true ->
            case util:check_text(Summary, 20, lang:get("简介")) of
                {false, Reason} -> {reply, {0, Reason, 0}};
                ok ->
                    role:send_buff_begin(),
                    case goodvoice:submit(Summary, Voice, Time, Role) of
                        {ok, NewRole, SongId, Msg} ->
                            role:send_buff_flush(),
                            {reply, {1, Msg, SongId}, NewRole};
                        {fail, NewRole, Msg} ->
                            role:send_buff_flush(),
                            {reply, {0, Msg, 0}, NewRole};
                        {false, Reason} ->
                            role:send_buff_clean(),
                            {reply, {0, Reason, 0}}
                    end
            end;
        false -> {reply, {0, lang:get("等级不足40级，无法报名"), 0}}
    end;
handle(16801, {}, Role) ->
    SongList = goodvoice_mgr:get_list(),
    FollowList = goodvoice:follow_list(Role),
    {reply, {SongList, FollowList}};
handle(16802, {Rid, P, Z}, #role{id = CastId}) ->
    case goodvoice:get_song({Rid, P, Z}, CastId) of
        {true, SongId, UpdateTime, Voice} ->
            {reply, {1, "", SongId, Rid, P, Z, UpdateTime, Voice}};
        {false, Reason} ->
            {reply, {0, Reason, 0, 0, "", 0, 0, <<>>}}
    end;
handle(16803, {}, #role{id = RoleId}) ->
    case goodvoice_mgr:lookup(RoleId) of
        {true, Gv} -> {reply, {Gv}};
        _ -> {reply, {#goodvoice{}}}
    end;
handle(16804, {Voice, Time}, Role) ->
    case goodvoice:update_voice(Voice, Time, Role) of
        {ok, SongId, Msg} -> {reply, {1, Msg, SongId}};
        {fail, Msg} -> {reply, {0, Msg, 0}};
        {false, Reason} -> {reply, {0, Reason, 0}}
    end;
handle(16805, {Summary}, Role) ->
    case util:check_text(Summary, 20, lang:get("简介")) of
        {false, Reason} -> {reply, {0, Reason, 0}};
        ok ->
            case goodvoice:update_summary(Summary, Role) of
                {ok, SongId, Msg} -> {reply, {1, Msg, SongId}};
                {fail, Msg} -> {reply, {0, Msg, 0}};
                {false, Reason} -> {reply, {0, Reason, 0}}
            end
    end;
handle(16806, {Rid, P, Z, 1}, Role) ->
    case goodvoice:follow({Rid, P, Z}, Role) of
        {false, Reason} -> {reply, {0, Reason, 0, "", 0, 0}};
        {ok, NewRole} ->
            {reply, {1, lang:get("关注成功"), Rid, P, Z, 1}, NewRole}
    end;
handle(16806, {Rid, P, Z, 0}, Role) ->
    case goodvoice:unfollow({Rid, P, Z}, Role) of
        {false, Reason} -> {reply, {0, Reason, 0, "", 0, 0}};
        {ok, NewRole} ->
            {reply, {1, lang:get("取消关注成功"), Rid, P, Z, 0}, NewRole}
    end;
handle(16807, _, #role{lev = Lev}) when Lev < 20 ->
    {reply, {0, lang:get("等级不足20级，无法提交举报")}};
handle(16807, {Rid, Plat, Zone},
       #role{id = {Rid, Plat, Zone}}) ->
    {reply, {0, lang:get("不要举报自己")}};
handle(16807, {Rid, Plat, Zone}, Role = #role{}) ->
    Times = var:get_var(Role, day, 57, 0),
    case Times > 10 of
        true -> {reply, {0, lang:get("今日举报次数已满10次，无法再次提交")}};
        false ->
            Cond = #condition{label = energy, op = ge, val = 10},
            case role_cond:check([Cond], Role) of
                {false, #condition{msg = FailMsg}} ->
                    {reply, {0, FailMsg}};
                true ->
                    case role_misc:check_cd(rpc_16807) of
                        false -> {reply, {0, lang:get("提交过于频繁，请稍后再来提交")}};
                        true ->
                            case goodvoice:report(Role, {Rid, Plat, Zone}) of
                                {true, NewRole} ->
                                    NewTimes = Times + 1,
                                    NewRole1 = var:set_var(NewRole,
                                                           day,
                                                           57,
                                                           NewTimes),
                                    {reply, {1, ""}, NewRole1};
                                {false, FailReason} -> {reply, {0, FailReason}}
                            end
                    end
            end
    end;
handle(16808, {Rid, P, Z}, _Role) ->
    Result = case role_misc:is_local_role({Rid, P, Z}) of
                 true -> goodvoice_mgr:lookup({Rid, P, Z});
                 false ->
                     big_world:call(P,
                                    Z,
                                    goodvoice_mgr,
                                    lookup,
                                    [{Rid, P, Z}])
             end,
    case Result of
        {true, Gv} -> {reply, {Gv}};
        _ -> {reply, {#goodvoice{}}}
    end;
handle(16809, {}, _Role) ->
    Status = goodvoice_mgr:get_status(),
    {reply, {Status}};
handle(16810, {Rid, P, Z}, Role) ->
    case goodvoice:vote(Role, {Rid, P, Z}) of
        {true, Liked, Time, Msg, NewRole} ->
            {reply, {1, Msg, Rid, P, Z, Liked, Time}, NewRole};
        {false, Reason} ->
            {reply, {0, Reason, Rid, P, Z, 0, 0}};
        {fail, OldLiked, Time, Msg, NewRole} ->
            {reply, {1, Msg, Rid, P, Z, OldLiked, Time}, NewRole}
    end;
handle(16811, {Rid, P, Z}, _Role) ->
    Result = case role_misc:is_local_role({Rid, P, Z}) of
                 true -> goodvoice_mgr:get_log({Rid, P, Z});
                 false ->
                     big_world:call(P,
                                    Z,
                                    goodvoice_mgr,
                                    get_log,
                                    [{Rid, P, Z}])
             end,
    case Result of
        Log when is_list(Log) -> {reply, {Log}};
        _ -> {reply, {[]}}
    end;
handle(16812, {}, #role{id = RoleId}) ->
    SubmitList = goodvoice_mgr:get_submit(),
    case lists:keymember(RoleId, 1, SubmitList) of
        true -> {reply, {1}};
        _ -> {reply, {0}}
    end;
handle(16813, {}, Role) ->
    DayVote = var:get_var(Role, day, 106, []),
    {reply, {DayVote}};
handle(16814, {Type}, _Role) ->
    L = goodvoice_mgr:get_rank(Type),
    {reply, {Type, L}};
handle(16815, {Rid, P, Z}, #role{id = _CastId}) ->
    case goodvoice:play_rank({Rid, P, Z}) of
        {true, SongId, UpdateTime, Voice} ->
            {reply, {1, "", SongId, Rid, P, Z, UpdateTime, Voice}};
        {false, Reason} ->
            {reply, {0, Reason, 0, 0, "", 0, 0, <<>>}}
    end;
handle(_Cmd, _Data, _Role) ->
    logger:debug("模块[~w]收到无效的RPC调用[~w]: ~w",
                 [goodvoice_rpc, _Cmd, _Data],
                 goodvoice_rpc,
                 223),
    {error, unknow_command}.

