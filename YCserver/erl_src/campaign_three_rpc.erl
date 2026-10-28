-file("src/mod/campaign/campaign_three_rpc.erl", 1).

-module(campaign_three_rpc).

-export([handle/3]).

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

-file("src/mod/campaign/campaign_three_rpc.erl", 9).

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

-file("src/mod/campaign/campaign_three_rpc.erl", 10).

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

-file("src/mod/campaign/campaign_three_rpc.erl", 11).

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

-file("src/mod/campaign/campaign_three_rpc.erl", 12).

handle(20400, {TarRoleID, Platform, ZoneID}, Role) ->
    {ok, NewRole} = camp_cut_price:info({TarRoleID,
                                         Platform,
                                         ZoneID},
                                        Role),
    {ok, NewRole};
handle(20401, {_TarRoleID, _Platform, _ZoneID}, Role) ->
    {ok, NewRole} = camp_cut_price:close_tab(Role),
    {ok, NewRole};
handle(20402, {TarRoleID, Platform, ZoneID}, Role) ->
    {ok, NewRole} = camp_cut_price:cut_price({TarRoleID,
                                              Platform,
                                              ZoneID},
                                             Role),
    {ok, NewRole};
handle(20403, {ItemID}, Role) ->
    case camp_cut_price:buy(ItemID, Role) of
        {ok, NewRole} -> {ok, NewRole};
        _ -> {ok, Role}
    end;
handle(20404, {}, Role) ->
    camp_pet_egg:get_log(Role),
    {ok, Role};
handle(20405, {}, Role) ->
    camp_pet_egg:pet_egg_state(Role),
    {ok, Role};
handle(20406, {}, Role) ->
    camp_sales_promotion:send_info(Role#role.id, Role),
    ok;
handle(20407, {}, Role) ->
    case camp_sales_promotion:get_today_purchase(Role) of
        {ok, PurchaseNum} ->
            {reply, {1, "", PurchaseNum}, Role};
        {false, Msg} -> {reply, {0, Msg, 0}}
    end;
handle(20408, {ID, Num}, Role) ->
    logger:debug("--------------------------------",
                 [],
                 campaign_three_rpc,
                 63),
    case camp_sales_promotion:buy(ID, Num, Role) of
        {ok, NRole} -> {reply, {1, ""}, NRole};
        {false, Msg} -> {reply, {0, Msg}}
    end;
handle(20409, {}, Role) ->
    camp_fashion_vote:push_config(Role),
    ok;
handle(20410, {}, Role) ->
    camp_fashion_vote:push_vote_role(Role),
    ok;
handle(20411, {GroupID}, Role) ->
    case camp_fashion_vote:vote(Role, GroupID) of
        {ok, NRole} -> {reply, {GroupID, 1, ""}, NRole};
        {false, Msg} -> {reply, {GroupID, 0, Msg}}
    end;
handle(20412, {GroupID, FRoleID, FPlatform, FZone},
       Role) ->
    case camp_fashion_vote:invite_vote(Role,
                                       {FRoleID, FPlatform, FZone},
                                       GroupID)
        of
        ok ->
            {reply, {GroupID, FRoleID, FPlatform, FZone, 1, ""}};
        {false, Msg} ->
            {reply, {GroupID, FRoleID, FPlatform, FZone, 0, Msg}};
        _ ->
            {reply,
             {GroupID,
              FRoleID,
              FPlatform,
              FZone,
              0,
              lang:get("未知错误，拉票失败")}}
    end;
handle(20413,
       {GroupID, FRoleID, FPlatform, FZone, Code}, Role) ->
    case camp_fashion_vote:reply_invite(Role,
                                        {FRoleID, FPlatform, FZone},
                                        Code,
                                        GroupID)
        of
        {ok, NRole} ->
            {reply,
             {GroupID, FRoleID, FPlatform, FZone, 1, ""},
             NRole};
        {false, Msg} ->
            {reply, {GroupID, FRoleID, FPlatform, FZone, 0, Msg}};
        _ ->
            {reply,
             {GroupID,
              FRoleID,
              FPlatform,
              FZone,
              0,
              lang:get("未知错误，拉票失败")}}
    end;
handle(20414, {}, Role) ->
    camp_fashion_vote:push_lucky_dogs(Role),
    ok;
handle(20415, {GroupID, FRoleID, FPlatform, FZone},
       Role) ->
    case camp_fashion_vote:check_invite_state(Role,
                                              {FRoleID, FPlatform, FZone},
                                              GroupID)
        of
        {ok, Code} ->
            {reply, {GroupID, FRoleID, FPlatform, FZone, Code}};
        _ -> {reply, {GroupID, FRoleID, FPlatform, FZone, 0}}
    end;
handle(20416, {}, Role) ->
    camp_fashion_promote:send_info(Role#role.id, Role),
    ok;
handle(20417, {PlanID, Num, Sex}, Role) ->
    case camp_fashion_promote:buy(Role, PlanID, Num, Sex) of
        {ok, NewRole} -> {ok, NewRole};
        {false, Msg} -> {false, Msg}
    end;
handle(20418, {}, Role) ->
    camp_lucky_draw:push_config(Role),
    ok;
handle(20419, {}, Role) ->
    camp_lucky_draw:push_draw_role(Role),
    ok;
handle(20420, {DrawNum}, Role) ->
    case camp_lucky_draw:lucky_draw(Role, DrawNum) of
        {ok, {RtnGroupID, Rewards}, NewRole} ->
            {reply, {1, "", DrawNum, Rewards, RtnGroupID}, NewRole};
        {false, Msg} ->
            logger:debug("wwwwwwwwwwww~ts",
                         [Msg],
                         campaign_three_rpc,
                         148),
            {reply, {0, Msg, DrawNum, [], 0}};
        _ -> {reply, {0, lang:get("抽奖失败，请稍后重试")}}
    end;
handle(20421, {}, Role) ->
    camp_rushing_top:push_config(Role),
    ok;
handle(20422, {}, Role) ->
    camp_rushing_top:push_state(Role),
    ok;
handle(20423, {}, Role) ->
    case camp_rushing_top:sign(Role) of
        {ok, NewRole, Msg} -> {reply, {1, Msg}, NewRole};
        {false, Msg} -> {reply, {0, Msg}};
        _ -> {reply, {0, lang:get("报名失败，请稍后重试")}}
    end;
handle(20424, {1}, Role) ->
    case camp_rushing_top:enter_map(Role) of
        {ok, NewRole} -> {reply, {1, 1, ""}, NewRole};
        {false, Msg} -> {reply, {1, 0, Msg}};
        _ -> {reply, {1, 0, lang:get("进入地图失败，请稍后重试")}}
    end;
handle(20424, {2}, Role) ->
    case camp_rushing_top:leave_map(Role) of
        {ok, NewRole} -> {reply, {2, 1, ""}, NewRole};
        {false, Msg} -> {reply, {2, 0, Msg}};
        _ -> {reply, {2, 0, lang:get("退出场景，请稍后重试")}}
    end;
handle(20426, {Index, Option}, Role) ->
    logger:debug("yyyyyyyyyyyyyyyyyyyyyyyy~w",
                 [{Index, Option}],
                 campaign_three_rpc,
                 199),
    case camp_rushing_top:answer(Role, Index, Option) of
        ok -> {reply, {1, ""}};
        {false, Msg} -> {reply, {0, Msg}};
        _ -> {reply, {0, lang:get("作答失败，请稍后重试")}}
    end;
handle(20428, {}, Role) ->
    case camp_rushing_top:revive(Role) of
        {ok, NewRole} -> {reply, {1, ""}, NewRole};
        {false, Msg} -> {reply, {0, Msg}};
        _ -> {reply, {0, lang:get("复活失败，请稍后重试")}}
    end;
handle(20429, {}, Role) ->
    camp_rushing_top:push_rush_role(Role),
    ok;
handle(20430, {Msg}, Role) ->
    case camp_rushing_top:send_barrage(Role, Msg) of
        ok -> {reply, {1, ""}};
        {false, Msg} -> {reply, {0, Msg}};
        _ -> {reply, {0, lang:get("发送弹幕失败，请稍后重试")}}
    end;
handle(20431, {Type, Value}, Role) ->
    case camp_rushing_top:set_barrage(Role, Type, Value) of
        ok -> {reply, {Type, Value, 1, ""}};
        {false, Reason} -> {reply, {Type, Value, 0, Reason}};
        _ERR ->
            logger:error("设置弹幕错误~w",
                         [_ERR],
                         campaign_three_rpc,
                         245),
            {reply, {Type, Value, 0, lang:get("设置弹幕错误")}}
    end;
handle(20433, {}, Role) ->
    camp_rushing_top:re_login(Role),
    ok;
handle(20434, {Num}, Role) ->
    case camp_slot_machine:rpc_turn_rand(Role, Num) of
        ok -> ok;
        {false, Reason} ->
            logger:debug("摇摇乐错误:~ts",
                         [Reason],
                         campaign_three_rpc,
                         260),
            {reply, {0, Reason, []}};
        {ok, NewRole, Result} ->
            {reply, {1, "", Result}, NewRole}
    end;
handle(20435, {}, Role) ->
    case camp_slot_machine:rpc_get_reward(Role) of
        {false, Reason} ->
            logger:debug("摇摇乐错误:~ts",
                         [Reason],
                         campaign_three_rpc,
                         269),
            {reply, {0, Reason}};
        {ok, NewRole} -> {reply, {1, ""}, NewRole}
    end;
handle(20436, {}, Role) ->
    case camp_sign_draw:sign(Role) of
        {false, Msg} -> {reply, {0, Msg}};
        {true, Msg} -> {reply, {1, Msg}};
        {ok, NewRole, Msg} -> {reply, {1, Msg}, NewRole}
    end;
handle(20437, {}, Role) ->
    case camp_sign_draw:draw(Role) of
        {false, Msg} -> {reply, {0, Msg, []}};
        {ok, Msg, Rewards, NewRole} ->
            {reply, {1, Msg, Rewards}, NewRole};
        {ok, Rewards, NewRole} ->
            {reply, {1, "", Rewards}, NewRole}
    end;
handle(20438, {}, Role) ->
    camp_sign_draw:push_draw_info(Role),
    ok;
handle(20439, {}, Role) ->
    camp_sign_draw:push_quest_info(Role),
    ok;
handle(20440, {}, Role) ->
    L = camp_slot_machine:rpc_world_reward_role(Role),
    {reply, {L}};
handle(20441, {}, Role) ->
    camp_zero_buy:push(Role),
    ok;
handle(20442, {Id, Period}, Role) ->
    case camp_zero_buy:reward(Role, Id, Period) of
        {ok, Msg1, NRole} -> {reply, {1, Msg1}, NRole};
        {false, Msg2} -> {reply, {0, Msg2}}
    end;
handle(20443, {Id}, Role) ->
    camp_zero_buy:drop_point(Role, Id),
    ok;
handle(20445, {}, Role) ->
    case camp_zillionaire:rpc_throw_dice(Role) of
        {false, Msg} ->
            logger:debug("投掷骰子失败:~ts",
                         [Msg],
                         campaign_three_rpc,
                         328),
            {reply, {0, Msg}};
        {false, Msg, ErrCode} -> {reply, {ErrCode, Msg}};
        {ok, NewRole} -> {reply, {1, ""}, NewRole}
    end;
handle(20446, {Result}, Role) ->
    case camp_zillionaire:rpc_throw_lucky_dice(Role, Result)
        of
        {false, Msg} ->
            logger:debug("投掷骰子失败:~ts",
                         [Msg],
                         campaign_three_rpc,
                         338),
            {reply, {0, Msg}};
        {ok, NewRole} -> {reply, {1, ""}, NewRole}
    end;
handle(20447, {Flag}, Role) ->
    case camp_zillionaire:rpc_active_event(Role, Flag) of
        {false, Msg} ->
            logger:debug("大富翁领取出错:~ts",
                         [Msg],
                         campaign_three_rpc,
                         348),
            {reply, {0, Msg, 0}};
        {ok, NewRole, EventId} ->
            {reply, {1, "", EventId}, NewRole}
    end;
handle(20448, {Times}, Role) ->
    case camp_zillionaire:rpc_get_ring_reward(Role, Times)
        of
        {false, Msg} ->
            logger:debug("领取轮回奖励出错:~ts",
                         [Msg],
                         campaign_three_rpc,
                         358),
            {reply, {0, Msg}};
        {ok, NewRole} -> {reply, {1, ""}, NewRole}
    end;
handle(20449, {}, Role) ->
    camp_zillionaire:push(Role, 20449),
    ok;
handle(20450, {}, Role) ->
    camp_zillionaire:push(Role, 20450),
    ok;
handle(20451, {}, Role) ->
    camp_pass_flower_language:push_info(Role),
    ok;
handle(20452, {Type, Id}, Role) ->
    logger:debug("~w",
                 [{Type, Id}],
                 campaign_three_rpc,
                 377),
    case camp_pass_flower_language:reward(Role, Type, Id) of
        {false, Msg} -> {reply, {0, Msg}};
        {ok, Msg, NewRole} -> {reply, {1, Msg}, NewRole}
    end;
handle(20453, {FlowerId, Rid, Platform, ZoneId},
       Role) ->
    Id = {Rid, Platform, ZoneId},
    case camp_pass_flower_language:pass_flower(Role,
                                               FlowerId,
                                               Id)
        of
        {ok, Msg, NewRole} ->
            logger:debug("~ts", [Msg], campaign_three_rpc, 389),
            {reply, {1, Msg}, NewRole};
        {false, Msg} ->
            logger:debug("~ts", [Msg], campaign_three_rpc, 392),
            {reply, {0, Msg}}
    end;
handle(20455, {FlowerId}, Role) ->
    camp_pass_flower_language:push_friend(Role, FlowerId),
    ok;
handle(20456, {}, Role) ->
    camp_consume_rebate:rpc_send(Role),
    ok;
handle(20457, {ItemList}, Role) ->
    logger:debug("~w", [ItemList], campaign_three_rpc, 405),
    case camp_consume_rebate:rpc_buy(Role, ItemList) of
        {ok, NRole} ->
            logger:debug("=====", [], campaign_three_rpc, 408),
            {reply, {1, lang:get("")}, NRole};
        {false, Reason} ->
            logger:debug("~ts", [Reason], campaign_three_rpc, 411),
            {reply, {0, Reason}}
    end;
handle(20458, {}, Role) ->
    star_moon_mgr:push(Role),
    ok;
handle(20459, {}, Role) ->
    camp_doll:push_20459(Role),
    ok;
handle(20460, {}, Role) ->
    camp_score_exchange:push_items_info(Role),
    ok;
handle(20461, {}, Role) ->
    camp_score_exchange:push_quest_info(Role),
    ok;
handle(20462, {GroupId, OrderId, ItemId}, Role) ->
    case camp_score_exchange:exchange_item(Role,
                                           {GroupId, OrderId, ItemId})
        of
        {ok, NRole} ->
            logger:debug("=====", [], campaign_three_rpc, 434),
            {reply, {1, lang:get("")}, NRole};
        {false, Reason} ->
            logger:debug("~ts", [Reason], campaign_three_rpc, 437),
            {reply, {0, Reason}}
    end;
handle(20463, {Type}, Role) ->
    case camp_scratch_card:use_card(Role, Type) of
        {ok, Id, NewRole} ->
            {reply, {1, lang:get(""), Id}, NewRole};
        {false, Reason} -> {reply, {0, Reason, 0}}
    end;
handle(20464, {Flag}, Role) ->
    case camp_scratch_card:get_reward(Role, Flag) of
        {ok, NewRole} -> {reply, {1, lang:get("")}, NewRole};
        {false, Reason} -> {reply, {0, Reason}}
    end;
handle(20465, {}, Role) ->
    camp_new_discount:push(Role),
    ok;
handle(20466, {Id, Num}, Role) ->
    case camp_new_discount:buy(Role,
                               #{id => Id, num => Num})
        of
        {ok, Msg, NewRole} -> {reply, {1, Msg}, NewRole};
        {false, Reason} -> {reply, {0, Reason}}
    end;
handle(20467, {}, Role) ->
    camp_collect_word:push_info(Role),
    ok;
handle(20468, {PlanId}, Role) ->
    case camp_collect_word:exchange(Role, PlanId) of
        {ok, NRole} ->
            logger:debug("=====", [], campaign_three_rpc, 476),
            {reply, {1, lang:get("兑换成功")}, NRole};
        {ok, NRole, Msg} -> {reply, {1, Msg}, NRole};
        {false, Reason} ->
            logger:debug("~ts", [Reason], campaign_three_rpc, 481),
            {reply, {0, Reason}}
    end;
handle(20469, {}, Role) ->
    case camp_scratch_card:push_card(Role) of
        {ok, Id} -> {reply, {Id}};
        {ok, Id, NewRole} -> {reply, {Id}, NewRole};
        {false, Id} -> {reply, {Id}}
    end;
handle(20470, {}, Role) ->
    camp_new_series_recharge:push_20470(Role);
handle(20471, {}, Role) ->
    camp_new_series_recharge:zero_flush(Role);
handle(20472, {DayId}, Role) ->
    case camp_new_series_recharge:get_reward(Role, DayId) of
        {ok, NRole} ->
            logger:debug("=====", [], campaign_three_rpc, 504),
            {reply, {1, lang:get("领取成功")}, NRole};
        {ok, NRole, Msg} -> {reply, {1, Msg}, NRole};
        {false, Reason} ->
            logger:debug("~ts", [Reason], campaign_three_rpc, 509),
            {reply, {0, Reason}}
    end;
handle(20473, {}, Role) ->
    camp_bring_up_open:push(Role);
handle(20474, {}, Role) ->
    case camp_bring_up_open:active_reward(Role) of
        {ok, NRole} ->
            logger:debug("=====", [], campaign_three_rpc, 519),
            {reply, {1, lang:get("领取成功")}, NRole};
        {ok, NRole, Msg} -> {reply, {1, Msg}, NRole};
        {false, Reason} ->
            logger:debug("~ts", [Reason], campaign_three_rpc, 524),
            {reply, {0, Reason}}
    end;
handle(20475, {}, Role) -> camp_new_limit:push(Role);
handle(20476, {GroupID}, Role) ->
    case camp_new_limit:buy(Role, GroupID) of
        {ok, NRole} ->
            logger:debug("=====", [], campaign_three_rpc, 534),
            {reply, {1, lang:get("购买成功")}, NRole};
        {ok, NRole, Msg} -> {reply, {1, Msg}, NRole};
        {false, Reason} ->
            logger:debug("~ts", [Reason], campaign_three_rpc, 539),
            {reply, {0, Reason}}
    end;
handle(20477, {}, Role) ->
    camp_new_acc_charge:push(Role);
handle(20478, {GroupID}, Role) ->
    role:send_buff_begin(),
    case camp_new_acc_charge:get(Role, GroupID) of
        {ok, NRole} ->
            role:send_buff_flush(),
            logger:debug("=====", [], campaign_three_rpc, 551),
            {reply, {1, lang:get("领取成功")}, NRole};
        {ok, NRole, Msg} ->
            role:send_buff_flush(),
            {reply, {1, Msg}, NRole};
        {false, Reason} ->
            role:send_buff_clean(),
            logger:debug("~ts", [Reason], campaign_three_rpc, 558),
            {reply, {0, Reason}}
    end;
handle(20479, {}, Role) ->
    camp_charge_seven_gift:push(Role);
handle(20480, {GroupID}, Role) ->
    logger:debug("=====~w",
                 [GroupID],
                 campaign_three_rpc,
                 566),
    case camp_charge_seven_gift:get(Role, GroupID) of
        {ok, NRole} ->
            logger:debug("=====", [], campaign_three_rpc, 569),
            {reply, {1, lang:get("领取成功")}, NRole};
        {ok, NRole, Msg} -> {reply, {1, Msg}, NRole};
        {false, Reason} ->
            logger:debug("~ts", [Reason], campaign_three_rpc, 574),
            {reply, {0, Reason}}
    end;
handle(20481, {}, Role) ->
    camp_charge_seven_gift:push_info(Role);
handle(20482, {}, Role) -> camp_lucky_tree:get(Role);
handle(20483, {}, Role) ->
    case camp_lucky_tree:turn(Role) of
        {ok, NRole, ItemId} ->
            {reply, {ItemId, lang:get("")}, NRole};
        {false, Reason} ->
            logger:debug("~ts", [Reason], campaign_three_rpc, 589),
            {reply, {0, Reason}}
    end;
handle(20484, {}, Role) ->
    {ok, NRole, ItemIds} = camp_lucky_tree:get_reward(Role,
                                                      client),
    {reply, {ItemIds}, NRole};
handle(20485, {}, Role) -> camp_long_active:push(Role);
handle(20487, {}, Role) ->
    case camp_long_active:rpc_get_week_box(Role) of
        {ok, NRole} -> {reply, {1, lang:get("领取成功")}, NRole};
        {ok, NRole, Msg} -> {reply, {1, Msg}, NRole};
        {false, Reason} ->
            logger:debug("~ts", [Reason], campaign_three_rpc, 618),
            {reply, {0, Reason}}
    end;
handle(20488, {LevNum}, Role) ->
    case camp_long_active:rpc_buy_lev(Role, LevNum) of
        {ok, NRole} -> {reply, {1, lang:get("购买成功")}, NRole};
        {ok, NRole, Msg} -> {reply, {1, Msg}, NRole};
        {false, Reason} ->
            logger:debug("~ts", [Reason], campaign_three_rpc, 629),
            {reply, {0, Reason}}
    end;
handle(20489, {TokenId, Lev}, Role) ->
    case camp_long_active:rpc_get_lev_reward(Role,
                                             TokenId,
                                             Lev)
        of
        {ok, NRole} -> {reply, {1, lang:get("领取成功")}, NRole};
        {ok, NRole, Msg} -> {reply, {1, Msg}, NRole};
        {false, Reason} ->
            logger:debug("~ts", [Reason], campaign_three_rpc, 640),
            {reply, {0, Reason}}
    end;
handle(20490, {}, Role) ->
    case camp_long_active:rpc_get_all_reward(Role) of
        ok -> ok;
        {ok, NRole} -> {reply, {1, lang:get("领取成功")}, NRole};
        {ok, NRole, Msg} -> {reply, {1, Msg}, NRole};
        {false, Reason} ->
            logger:debug("~ts", [Reason], campaign_three_rpc, 652),
            {reply, {0, Reason}}
    end;
handle(20491, {}, Role) ->
    camp_gift_custom:push(Role),
    ok;
handle(20492, {GiftId, ItemIds}, Role) ->
    NewItemIds = [ItemId || {ItemId} <- ItemIds],
    role:send_buff_begin(),
    case camp_gift_custom:buy(Role, GiftId, NewItemIds) of
        {ok, NewRole} ->
            logger:debug("购买成功", [], campaign_three_rpc, 671),
            role:send_buff_flush(),
            Reply = {1, lang:get(""), ItemIds},
            {reply, Reply, NewRole};
        {false, Reason} ->
            logger:debug("购买失败:~w",
                         [Reason],
                         campaign_three_rpc,
                         676),
            role:send_buff_clean(),
            Reply = {0, Reason, []},
            {reply, Reply};
        _Err ->
            role:send_buff_clean(),
            logger:debug("购买错误:~w",
                         [_Err],
                         campaign_three_rpc,
                         682),
            ok
    end;
handle(20493, {}, Role) -> bring_up:push(Role);
handle(20494, {}, Role) ->
    case bring_up:active_reward(Role) of
        {ok, NRole} ->
            logger:debug("=====", [], campaign_three_rpc, 692),
            {reply, {1, lang:get("领取成功")}, NRole};
        {ok, NRole, Msg} -> {reply, {1, Msg}, NRole};
        {false, Reason} ->
            logger:debug("~ts", [Reason], campaign_three_rpc, 697),
            {reply, {0, Reason}}
    end;
handle(20495, {}, Role) ->
    camp_long_active:push_has_get_reward(Role),
    ok;
handle(_Cmd, _Data, _Role) ->
    logger:debug("模块[~w]收到无效的RPC调用[~w]: ~w",
                 [campaign_three_rpc, _Cmd, _Data],
                 campaign_three_rpc,
                 707),
    {error, unknow_command}.

