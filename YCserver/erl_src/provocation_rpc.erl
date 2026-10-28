-file("src/mod/provocation/provocation_rpc.erl", 1).

-module(provocation_rpc).

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

-file("src/mod/provocation/provocation_rpc.erl", 14).

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

-file("src/mod/provocation/provocation_rpc.erl", 15).

-file("inc/provocation.hrl", 1).

-record(m_provocation,
        {ver = 3,
         room_id = 0,
         book_id = 0,
         identity = 0,
         triggers = [],
         map_id = 0,
         room_check = 1,
         book_check = 0,
         video_check = 0,
         invited_list = [],
         published_list = [],
         pick_batch_list = [],
         pick_box_num = 0,
         pick_packet_num = 0}).

-record(provocation_room,
        {ver = 1,
         id = 0,
         pid = undefined :: pid(),
         name = [],
         room_lev_min = 0,
         min_lev_break = 0,
         room_lev_max = 200,
         max_lev_break = 1,
         master_fc = 0,
         mode = 1,
         password = [],
         status = 0,
         master_id = {0, "", 0},
         master_lev = 0,
         master_break = 0,
         master_name = [],
         master_sex = 0,
         master_class = 0,
         master_head = 0,
         customer_id = {0, "", 0},
         master_team_pid = undefined :: pid(),
         customer_team_pid = undefined :: pid(),
         last_vedio_id = {0, "", 0},
         provocation_type = 0,
         target_rival = {0, "", 0},
         target_name = [],
         make_horn_role = {0, "", 0},
         horn_name = [],
         horn_start_time = 0}).

-record(provocation_team,
        {ver = 1,
         team_formation = 0,
         team_formation_lev = 0,
         order = [],
         guards = [],
         team_mate = []}).

-record(provocation_fight_team,
        {leader_id = {0, "", 0}, fighters = []}).

-record(provocation_profile,
        {ver = 2,
         id = {0, "", 0},
         pid = undefined :: pid(),
         name = "",
         classes = 0,
         lev = 0,
         sex = 0,
         break_times = 0,
         fc = 0,
         looks = [] :: list(),
         head = 0,
         formation_id = 1 :: non_neg_integer(),
         formation_lev = 1 :: non_neg_integer(),
         guards = [],
         join_time = 0}).

-record(provocation_book,
        {ver = 1,
         id = 0,
         name = [],
         book_lev_min = 0,
         min_lev_break = 0,
         book_lev_max = 200,
         max_lev_break = 0,
         master_fc = 0,
         mode = 1,
         master_id = {0, "", 0},
         master_lev = 0,
         master_name = [],
         master_sex = 0,
         master_class = 0,
         master_head = 0,
         master_break = 0,
         live_status = 1,
         time_stamp = 0,
         provocation_type = 0}).

-record(provocation_fighter,
        {id = {0, "", 0} :: tuple(),
         name = "" :: string(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         kill_num = 0,
         dead_num = 0,
         total_heal = 0,
         control_num = 0,
         total_hurt = 0 :: non_neg_integer(),
         total_dmg = 0 :: non_neg_integer(),
         mvp_score = 0 :: non_neg_integer()}).

-record(provocation_result,
        {id = {0, "", 0},
         ver = 1,
         is_win = 1,
         mates = [],
         rival = [],
         match_id = 0,
         record_pz = {"", 0} :: tuple(),
         time = 0}).

-record(provocation_result_role,
        {id = {0, "", 0},
         ver = 1,
         recent = [],
         last_recent = []}).

-record(provocation_slices,
        {key = {0, 0}, role_list = []}).

-record(provocation_publish,
        {help_id = 0,
         msg_id = 0,
         record_id = 0,
         channel = 0,
         map_id = 0}).

-record(provocation_box,
        {map_id = 0,
         type = 0,
         batch_id = 0,
         time_stamp = 0,
         boxlist = []}).

-file("src/mod/provocation/provocation_rpc.erl", 16).

handle(20700, {InitFlag}, Role) ->
    case provocation_role:rpc_get_roomlist(Role, InitFlag)
        of
        {ok, RoomList, NewRole} ->
            logger:debug("~w", [RoomList], provocation_rpc, 20),
            {reply, {RoomList}, NewRole};
        _ -> {reply, {[]}, Role}
    end;
handle(20701, {}, Role) ->
    case provocation_role:rpc_enter(Role) of
        {ok, NewRole} -> {reply, {1, lang:get("")}, NewRole};
        {false, Reason} ->
            logger:debug("进入地图失败:~ts",
                         [Reason],
                         provocation_rpc,
                         31),
            {reply, {0, Reason}};
        _ -> {reply, {0, lang:get("进入地图失败")}}
    end;
handle(20702, {}, Role) ->
    case provocation_role:rpc_exit(Role) of
        {ok, NewRole} -> {reply, {1, lang:get("")}, NewRole};
        {false, Reason} ->
            logger:debug("进入地图失败:~ts",
                         [Reason],
                         provocation_rpc,
                         42),
            {reply, {0, Reason}};
        _ -> {reply, {0, lang:get("进入地图失败")}}
    end;
handle(20703,
       {RoomName,
        RoomMode,
        MinLev,
        MinBreak,
        MaxLev,
        MaxBreak,
        PassWord,
        RoomType},
       Role) ->
    logger:debug("======", [], provocation_rpc, 49),
    case provocation_role:rpc_create_room(Role,
                                          {RoomName,
                                           RoomMode,
                                           MinLev,
                                           MinBreak,
                                           MaxLev,
                                           MaxBreak,
                                           PassWord,
                                           RoomType})
        of
        {ok, NewRole} -> {reply, {1, lang:get("")}, NewRole};
        {false, Reason} ->
            logger:debug("创建房间失败:~ts",
                         [Reason],
                         provocation_rpc,
                         54),
            {reply, {0, Reason}};
        _ -> {reply, {0, lang:get("创建房间失败")}}
    end;
handle(20704, {}, Role) ->
    case provocation_role:rpc_get_roominfo(Role) of
        ok -> ok;
        {ok, NewRole} ->
            {reply, {#provocation_room{}, []}, NewRole};
        _ -> ok
    end;
handle(20705, {RoomId, PassWord}, Role) ->
    case provocation_role:rpc_join_room(Role,
                                        {RoomId, PassWord})
        of
        {ok, NewRole} -> {reply, {1, lang:get("")}, NewRole};
        {false, Reason} ->
            logger:debug("加入房间失败:~ts",
                         [Reason],
                         provocation_rpc,
                         73),
            {reply, {0, Reason}};
        _ -> {reply, {0, lang:get("加入房间失败")}}
    end;
handle(20706,
       {RoomId,
        RoomName,
        RoomMode,
        MinLev,
        MinBreak,
        MaxLev,
        MaxBreak,
        PassWord,
        RoomType},
       Role) ->
    case provocation_role:rpc_change_roominfo(Role,
                                              {RoomId,
                                               RoomName,
                                               RoomMode,
                                               MinLev,
                                               MinBreak,
                                               MaxLev,
                                               MaxBreak,
                                               PassWord,
                                               RoomType})
        of
        ok -> {reply, {1, lang:get("")}};
        {false, Reason} ->
            logger:debug("修改房间信息失败:~ts",
                         [Reason],
                         provocation_rpc,
                         84),
            {reply, {0, Reason}};
        _ -> {reply, {0, lang:get("修改房间信息失败")}}
    end;
handle(20707, {}, Role) ->
    case provocation_role:rpc_exit_room(Role) of
        {ok, NewRole} -> {reply, {1, lang:get("")}, NewRole};
        {false, Reason} ->
            logger:debug("退出房间失败:~ts",
                         [Reason],
                         provocation_rpc,
                         95),
            {reply, {0, Reason}};
        _ -> {reply, {0, lang:get("退出房间失败")}}
    end;
handle(20708, KickRoleId, Role) ->
    case provocation_role:rpc_kick_rival(Role, KickRoleId)
        of
        ok -> {reply, {1, lang:get("")}};
        {false, Reason} ->
            logger:debug("踢出对手失败:~ts",
                         [Reason],
                         provocation_rpc,
                         106),
            {reply, {0, Reason}};
        _ -> {reply, {0, lang:get("踢出对手失败")}}
    end;
handle(20709, {Channel, Flag}, Role) ->
    case provocation_role:rpc_publish_help(Role,
                                           Channel,
                                           Flag)
        of
        {ok, NewRole} -> {reply, {1, lang:get("")}, NewRole};
        {false, Reason} ->
            logger:debug("发出招募失败:~ts",
                         [Reason],
                         provocation_rpc,
                         118),
            {reply, {1, Reason}};
        _ -> {reply, {0, lang:get("发出招募失败")}}
    end;
handle(20710, {}, Role) ->
    case provocation_role:rpc_team_ready(Role) of
        ok -> {reply, {1, lang:get("准备完毕，等待对方开始{face_1,3}")}};
        {ok, NewRole} ->
            {reply,
             {1, lang:get("准备完毕，等待对方开始{face_1,3}，如果提前退出钻石将自动返还")},
             NewRole};
        {false, Reason} ->
            logger:debug("准备失败:~ts",
                         [Reason],
                         provocation_rpc,
                         131),
            {reply, {0, Reason}};
        _ -> {reply, {0, lang:get("准备失败")}}
    end;
handle(20711, {}, Role) ->
    case provocation_role:rpc_combat_start(Role) of
        ok -> {reply, {1, lang:get("")}};
        {ok, NewRole} -> {reply, {1, lang:get("")}, NewRole};
        {false, Reason} -> {reply, {0, Reason}};
        _ -> {reply, {0, lang:get("开战失败")}}
    end;
handle(20712, {}, Role) ->
    case provocation_role:rpc_get_checkflag(Role) of
        {ok, FlagList} -> {reply, FlagList};
        _ -> {reply, {1, 1, 1}}
    end;
handle(20713, {}, Role) ->
    case provocation_role:rpc_fast_join(Role) of
        {ok, NewRole} -> {reply, {1, ""}, NewRole};
        {false, Reason} -> {reply, {0, Reason}}
    end;
handle(20715, {}, Role) ->
    DataList = provocation_role:rpc_get_result_role(Role),
    {reply, {DataList}};
handle(20716, {Id, P, Z}, _Role) ->
    case provocation_agent:get_result({Id, P, Z}) of
        Result = #provocation_result{} -> {reply, {Result}};
        _ -> {reply, {#provocation_result{}}}
    end;
handle(20717, {Id, P, Z}, Role) ->
    case provocation_role:rpc_replay_result(Role,
                                            {Id, P, Z})
        of
        ok -> ok;
        {false, Why} -> {reply, {0, Why}};
        _ -> {reply, {0, lang:get("录像已过期")}}
    end;
handle(20718, {RoomCheck, BookCheck, VideoCheck},
       Role) ->
    case provocation_role:rpc_change_check(Role,
                                           {RoomCheck, BookCheck, VideoCheck})
        of
        {ok, NewRole} -> {reply, {1, lang:get("")}, NewRole};
        {false, Reason} -> {reply, {0, Reason}};
        _ -> {reply, {0, lang:get("设置失败")}}
    end;
handle(20719, {}, Role) ->
    case provocation_role:rpc_cancel_ready(Role) of
        ok -> {reply, {1, lang:get("")}};
        {false, Reason} -> {reply, {0, Reason}};
        _ -> {reply, {0, lang:get("取消准备失败")}}
    end;
handle(20720, {R, P, Z, Type}, Role) ->
    logger:debug("====invite", [], provocation_rpc, 209),
    case provocation_role:rpc_invite_friend(Role,
                                            {{R, P, Z}, Type})
        of
        {ok, NewRole} -> {reply, {1, lang:get("")}, NewRole};
        {false, Reason} -> {reply, {0, Reason}};
        _ -> {reply, {0, lang:get("邀请好友失败")}}
    end;
handle(20722, {R, P, Z, Flag, Type}, Role) ->
    case provocation_role:rpc_agree_invite(Role,
                                           {{R, P, Z}, Flag, Type})
        of
        {ok, NewRole} -> {reply, {1, lang:get("")}, NewRole};
        {false, Reason} -> {reply, {0, Reason}};
        _ -> {reply, {0, lang:get("回应邀请失败")}}
    end;
handle(20723, {}, #role{id = Rid}) ->
    case provocation_agent:get_recent_role(Rid) of
        false -> {reply, {[]}};
        List ->
            logger:debug("~w", [List], provocation_rpc, 236),
            {reply, {List}}
    end;
handle(20724, {}, Role) ->
    case provocation_role:rpc_recommend_rival(Role) of
        false -> {reply, {[]}};
        List ->
            logger:debug("~w", [List], provocation_rpc, 246),
            {reply, {List}}
    end;
handle(20725, {InitFlag}, Role) ->
    case provocation_role:rpc_get_booklist(Role, InitFlag)
        of
        {ok, BookList, NewRole} ->
            logger:debug("~w", [BookList], provocation_rpc, 254),
            {reply, {BookList}, NewRole};
        _ -> {reply, {[]}, Role}
    end;
handle(20726,
       {BookName,
        BookMode,
        MinLev,
        MinBreak,
        MaxLev,
        MaxBreak,
        IsSend,
        ProvocationType},
       Role) ->
    logger:debug("======", [], provocation_rpc, 262),
    case provocation_role:rpc_create_book(Role,
                                          {BookName,
                                           BookMode,
                                           MinLev,
                                           MinBreak,
                                           MaxLev,
                                           MaxBreak,
                                           IsSend,
                                           ProvocationType})
        of
        {ok, NewRole} -> {reply, {1, lang:get("")}, NewRole};
        {false, Reason, NewRole} ->
            logger:debug("飞鸽传书失败:~ts",
                         [Reason],
                         provocation_rpc,
                         267),
            {reply, {0, Reason}, NewRole};
        {false, Reason} ->
            logger:debug("创建战书失败:~ts",
                         [Reason],
                         provocation_rpc,
                         270),
            {reply, {0, Reason}};
        _ -> {reply, {0, lang:get("创建战书失败")}}
    end;
handle(20727,
       {BookId,
        BookName,
        BookMode,
        MinLev,
        MinBreak,
        MaxLev,
        MaxBreak,
        IsSend,
        ProvocationType},
       Role) ->
    case provocation_role:rpc_change_bookinfo(Role,
                                              {BookId,
                                               BookName,
                                               BookMode,
                                               MinLev,
                                               MinBreak,
                                               MaxLev,
                                               MaxBreak,
                                               IsSend,
                                               ProvocationType})
        of
        {ok, NewRole} -> {reply, {1, lang:get("")}, NewRole};
        {false, Reason, NewRole} ->
            logger:debug("飞鸽传书失败:~ts",
                         [Reason],
                         provocation_rpc,
                         282),
            {reply, {0, Reason}, NewRole};
        {false, Reason} ->
            logger:debug("修改战书信息失败:~ts",
                         [Reason],
                         provocation_rpc,
                         285),
            {reply, {0, Reason}};
        _ -> {reply, {0, lang:get("修改战书信息失败")}}
    end;
handle(20728, {BookId}, Role) ->
    case provocation_role:rpc_revoke_bookinfo(Role, BookId)
        of
        {ok, NewRole} -> {reply, {1, lang:get("")}, NewRole};
        {false, Reason} ->
            logger:debug("撤销战书失败:~ts",
                         [Reason],
                         provocation_rpc,
                         297),
            {reply, {0, Reason}};
        _ -> {reply, {0, lang:get("撤销战书失败")}}
    end;
handle(20729, {RoomId}, Role) ->
    provocation_role:rpc_preview_roominfo(Role, RoomId),
    ok;
handle(20730, {InitFlag}, Role) ->
    case provocation_role:rpc_get_vedioroom(Role, InitFlag)
        of
        {ok, VedioRooms, NewRole} ->
            logger:debug("~w", [VedioRooms], provocation_rpc, 312),
            {reply, {VedioRooms}, NewRole};
        _ -> {reply, {[]}, Role}
    end;
handle(20731, {RoomId}, Role) ->
    case provocation_role:rpc_watch(Role, RoomId) of
        ok -> {reply, {1, lang:get("")}};
        {false, Reason} -> {reply, {0, Reason}};
        _ -> {reply, {0, lang:get("观战失败")}}
    end;
handle(20732,
       {RoomId, Type, PassWord, CombatId, RPlatform, RZoneId},
       Role) ->
    case provocation_role:rpc_answer_publish(Role,
                                             RoomId,
                                             Type,
                                             PassWord,
                                             {CombatId, RPlatform, RZoneId})
        of
        ok -> {reply, {1, lang:get("")}};
        {ok, NewRole} -> {reply, {1, lang:get("")}, NewRole};
        {false, Reason} ->
            provocation_role:rpc_preview_roominfo(Role, RoomId),
            {reply, {0, Reason}};
        _ -> {reply, {0, lang:get("未知响应")}}
    end;
handle(20733, TargetId = {_Id, _P, _Z}, Role) ->
    case provocation_role:rpc_use_horn(Role, TargetId) of
        ok -> {reply, {1, lang:get("")}};
        {ok, NewRole} -> {reply, {1, lang:get("")}, NewRole};
        {false, Reason} -> {reply, {0, Reason}};
        _ -> {reply, {0, lang:get("未知响应")}}
    end;
handle(20734, {TargetName}, Role) ->
    case provocation_role:rpc_use_horn(Role, TargetName) of
        ok -> {reply, {1, lang:get("")}};
        {ok, NewRole} -> {reply, {1, lang:get("")}, NewRole};
        {false, Reason} -> {reply, {0, Reason}};
        _ -> {reply, {0, lang:get("未知响应")}}
    end;
handle(20735, {}, Role) ->
    case provocation_role:rpc_make_red_packet(Role) of
        ok -> {reply, {1, lang:get("")}};
        {ok, NewRole} -> {reply, {1, lang:get("")}, NewRole};
        {false, Reason} -> {reply, {0, Reason}};
        _ -> {reply, {0, lang:get("未知响应")}}
    end;
handle(_Cmd, _Data, _Role) ->
    logger:debug("模块[~w]收到无效的RPC调用[~w]: ~w",
                 [provocation_rpc, _Cmd, _Data],
                 provocation_rpc,
                 381),
    {error, unknow_command}.

