-file("src/mod/campaign/campaign_two_rpc.erl", 1).

-module(campaign_two_rpc).

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

-file("src/mod/campaign/campaign_two_rpc.erl", 9).

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

-file("src/mod/campaign/campaign_two_rpc.erl", 10).

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

-file("src/mod/campaign/campaign_two_rpc.erl", 11).

-file("inc/help.hrl", 1).

-record(m_help,
        {ver = 1,
         next_id = 1,
         free_ids = [],
         send_msg = [],
         recv_msg = [],
         ext = []}).

-record(help_state,
        {next_record_id = 1, free_record_ids = []}).

-record(help_msg,
        {id = 0,
         help_rid,
         help_id = 0,
         record_id = 0,
         time = 0,
         digit_array = [],
         str_array = [],
         ext = []}).

-record(help_record, {record_id = 0, rid}).

-record(help_data,
        {id = 0 :: pos_integer(),
         title = "",
         fun_type = 0,
         type = 0,
         help_args :: undefined | term()}).

-file("src/mod/campaign/campaign_two_rpc.erl", 12).

-file("inc/camp_web_rank.hrl", 1).

-record(camp_web_rank_cfg,
        {id = 0,
         sec_type = 0,
         num = 0,
         keys = [],
         min_val = 1,
         zone}).

-record(camp_web_rank_zone,
        {id = 0, sec_type = 0, zone, pid}).

-record(camp_web_rank,
        {sec_type = 1,
         show_list = [],
         list = [],
         last_val = 0,
         len = 0}).

-record(camp_web_rank_role,
        {key,
         id = {roleid, platform, zoneid} :: term(),
         sec_type = 0,
         rank = 1,
         time = 0 :: non_neg_integer(),
         role_id = 0 :: non_neg_integer(),
         platform = "" :: list(),
         zone_id = 0 :: non_neg_integer(),
         name = "" :: list(),
         sex = 0 :: 0..2,
         classes = 0 :: 0..4,
         lev = 0 :: non_neg_integer(),
         val1 = 0 :: non_neg_integer(),
         val2 = 0 :: non_neg_integer(),
         val3 = 0 :: non_neg_integer(),
         val4 = 0 :: non_neg_integer(),
         desc = ""}).

-file("src/mod/campaign/campaign_two_rpc.erl", 13).

-file("inc/camp_mid_autumn.hrl", 1).

-record(enjoy_moon_role_info,
        {role_id = {0, "", 0},
         role_name = "",
         pid = undefined,
         lev = 0,
         guild_id = {0, "", 0},
         guild_name = "",
         total_exp = 0,
         wish_val = 0,
         status = 1}).

-record(enjoy_moon_guild_wish_info,
        {id = {0, "", 0}, name = "", wish_val = 0}).

-file("src/mod/campaign/campaign_two_rpc.erl", 14).

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

-file("src/mod/campaign/campaign_two_rpc.erl", 15).

-file("inc/camp_halloween.hrl", 1).

-record(halloween_role,
        {id = {0, "", 0},
         pid,
         status = 0,
         name = "",
         camp = 0,
         sex = 0,
         classes = 0,
         lev = 0,
         times = 0,
         times_cd = 0,
         die = 0,
         win = 0,
         score = 0,
         zone_id = 0,
         zone_pid,
         num = 0,
         pos,
         mtime = 0,
         escape_time = 0}).

-record(halloween_zone,
        {id = 0 :: non_neg_integer(),
         pid :: pid() | undefined,
         flag = 0}).

-record(halloween_rank_data,
        {min = 0,
         max = 0,
         win = 0,
         reward = [],
         exp_mode = 0,
         exp_radio = 0,
         title = "",
         content = ""}).

-record(halloween_reward_data,
        {min = 0,
         max = 0,
         win = 0,
         reward = [],
         exp_mode = 0,
         exp_radio = 0,
         pet_exp_mode = 0,
         pet_exp_radio = 0}).

-record(halloween_item_reward_data,
        {id = 0,
         type = 0,
         min_lev = 0,
         max_lev = 0,
         item_id = 0,
         num = 0,
         bind = 0,
         is_cast = 0,
         weigth = 0}).

-record(halloween_exp_reward_data,
        {type = 0,
         min = 0,
         max = 0,
         exp_mode = 0,
         exp_radio = 0,
         pet_exp_mode = 0,
         pet_exp_radio = 0}).

-file("src/mod/campaign/campaign_two_rpc.erl", 16).

handle(17800, {}, _Role = #role{cross_type = 1}) ->
    cross:cast(camp_halloween_mgr,
               cast,
               [{push, #{pid => self()}}]),
    ok;
handle(17800, {}, _Role) ->
    camp_halloween_mgr:cast({push, #{pid => self()}}),
    ok;
handle(17801, {}, Role) ->
    case camp_halloween_mgr:sign(Role) of
        {false, ""} -> {reply, {0, ""}};
        {false, Reason} ->
            notice:return(Reason),
            {reply, {0, ""}};
        ok -> ok
    end;
handle(17802, {}, Role) ->
    case camp_halloween_mgr:leave(Role) of
        {false, Reason} -> {reply, {0, Reason}};
        ok -> ok
    end;
handle(17803, {},
       #role{id = RoleId, pid = Pid, s_event = Event,
             s_event_pid = ZonePid})
    when Event == 37 orelse Event == 38 ->
    camp_halloween:cast(ZonePid,
                        {push_role, #{pid => Pid, id => RoleId}}),
    ok;
handle(17803, {}, _) -> ok;
handle(17804, {}, Role) ->
    camp_halloween:push_rank(Role),
    ok;
handle(17806, {Type, Id, Platform, ZoneId}, Role) ->
    case camp_halloween_mgr:aim(Role,
                                Type,
                                {Id, Platform, ZoneId})
        of
        {false, Reason} -> {reply, {0, Reason}};
        {ok, 1, Msg, NRole} ->
            notice:send(Role, 3, Msg),
            {reply, {1, ""}, NRole};
        {ok, _, Msg, NRole} ->
            notice:send(Role, 3, Msg),
            {reply, {2, ""}, NRole}
    end;
handle(17807, {}, Role) ->
    Num = var:get_var(Role, day, 83, 0),
    {reply, {Num}};
handle(17808, {}, Role) ->
    camp_halloween_mgr:push_pre(Role),
    ok;
handle(17812, {}, Role) ->
    campaign_limit:push(Role),
    ok;
handle(17813, {Id}, Role) ->
    case campaign_limit:buy(Role, Id) of
        {ok, NewRole} ->
            {reply, {Id, 1, lang:get("购买成功")}, NewRole};
        {false, Reason} -> {reply, {0, 0, Reason}}
    end;
handle(17814, {}, Role) ->
    campaign_card_open:push_info(Role),
    ok;
handle(17815, {}, Role) ->
    role:send_buff_begin(),
    case campaign_card_open:wash_card(Role) of
        {ok, NewRole} ->
            campaign_card_open:push_info(NewRole),
            role:send_buff_flush(),
            {reply, {1, lang:get("请选择")}, NewRole};
        {false, Reason} ->
            logger:debug("================~ts",
                         [Reason],
                         campaign_two_rpc,
                         110),
            role:send_buff_clean(),
            {reply, {0, Reason}}
    end;
handle(17816, {Order}, Role)
    when Order >= 1 andalso Order =< 4 ->
    role:send_buff_begin(),
    case campaign_card_open:get_card(Role, Order) of
        {ok, NewRole} ->
            campaign_card_open:push_info(NewRole),
            role:send_buff_flush(),
            {reply, {1, ""}, NewRole};
        {false, Reason} ->
            logger:debug("================~ts",
                         [Reason],
                         campaign_two_rpc,
                         124),
            role:send_buff_clean(),
            {reply, {0, Reason}}
    end;
handle(17817, {}, Role) ->
    camp_series_recharge_open:push(Role),
    ok;
handle(17818, {Id}, Role) ->
    case camp_series_recharge_open:get_reward(Role, Id) of
        {ok, NewRole} -> {ok, NewRole};
        {false, Msg} -> {reply, {Id, 0, Msg}}
    end;
handle(17819, {}, _Role) ->
    {StartTime, EndTime, Val} =
        campaign_world_gift:get_info(),
    {reply, {StartTime, EndTime, Val}};
handle(17820, {Type}, Role) ->
    role:send_buff_begin(),
    case campaign_world_gift:submit(Role, Type) of
        {ok, NewRole, Msg} ->
            role:send_buff_flush(),
            {reply, {1, Msg}, NewRole};
        {false, Reason} ->
            role:send_buff_clean(),
            {reply, {0, Reason}}
    end;
handle(17821, {}, Role) ->
    camp_colorful_flower:push(Role),
    ok;
handle(17822, {}, Role) ->
    case camp_colorful_flower:reward(Role) of
        {ok, NewRole} -> {reply, {1, ""}, NewRole};
        {false, Msg} -> {reply, {0, Msg}}
    end;
handle(17823, {Count}, Role) ->
    case camp_colorful_flower:buy(Role, Count) of
        {ok, NewRole} -> {reply, {1, ""}, NewRole};
        {false, Msg} -> {reply, {0, Msg}}
    end;
handle(17824, {}, Role) ->
    camp_wish_flower:push(Role),
    ok;
handle(17825, {Times}, Role) ->
    role:send_buff_begin(),
    case camp_wish_flower:wish(Role, Times) of
        {ok, NewRole, List} ->
            role:send_buff_flush(),
            {reply, {List}, NewRole};
        {false, Msg} ->
            role:send_buff_clean(),
            notice:send(Role, 1, Msg),
            {reply, {[]}}
    end;
handle(17827, {}, Role) ->
    camp_wish_flower:push_pmd(Role),
    ok;
handle(17828, {}, Role) ->
    camp_whiteday:push(Role),
    ok;
handle(17829, {Wish, Type}, Role) ->
    role:send_buff_begin(),
    case camp_whiteday:wish(Role, Wish, Type) of
        {ok, NewRole} ->
            role:send_buff_flush(),
            {reply,
             {1, "爱神收起你的许愿笺等待有缘人拾取，祝您愿望成真！{face_1,3}"},
             NewRole};
        {false, Msg} ->
            role:send_buff_clean(),
            {reply, {0, Msg}}
    end;
handle(17830, {Id}, Role) ->
    VotiveTime = case get(votive_time) of
                     Val when is_integer(Val) -> Val;
                     _ -> 0
                 end,
    Now = date:unixtime(),
    RTime = Now - VotiveTime,
    TimeLen = 600,
    case Now - VotiveTime >= TimeLen of
        true ->
            case camp_whiteday:look(Role, Id) of
                {ok, NewRole} -> {ok, NewRole};
                {false, Msg} ->
                    notice:send(Role, 1, Msg),
                    ok
            end;
        _ when TimeLen - RTime =< 60 ->
            notice:return(notice:format(lang:get("~ts秒后再来还愿吧{face_1,3}"),
                                        [{string_2, 1, TimeLen - RTime}])),
            ok;
        _ ->
            notice:return(notice:format(lang:get("~ts分钟后再来还愿吧{face_1,3}"),
                                        [{string_2,
                                          1,
                                          (TimeLen - RTime) div 60}])),
            ok
    end;
handle(17831, {Type}, Role) ->
    role:send_buff_begin(),
    case camp_whiteday:votive(Role, Type) of
        {ok, NewRole, Msg} ->
            role:send_buff_flush(),
            put(votive_time, date:unixtime()),
            {reply, {1, Msg}, NewRole};
        {false, Msg} ->
            role:send_buff_clean(),
            {reply, {0, Msg}}
    end;
handle(17832, {}, Role) ->
    role:send_buff_begin(),
    case camp_whiteday:get(Role) of
        {ok, NewRole} ->
            role:send_buff_flush(),
            {reply, {1, ""}, NewRole};
        {false, Msg} ->
            role:send_buff_clean(),
            logger:debug("收到错误提示 ~ts",
                         [Msg],
                         campaign_two_rpc,
                         272),
            {reply, {0, Msg}}
    end;
handle(17833, {}, Role) ->
    Reply = camp_halloween_mgr:push_skill_cd(Role),
    logger:debug("技能刷新信息:~w",
                 [Reply],
                 campaign_two_rpc,
                 280),
    {reply, Reply};
handle(17834, {}, Role) ->
    case role_misc:check_cd(rpc_17834) of
        true ->
            case camp_halloween_mgr:rpc_flash_appear(Role) of
                {ok, NewRole} ->
                    Reply = camp_halloween_mgr:push_skill_cd(Role),
                    role:link_send(Role, 17833, Reply),
                    {reply, {1, lang:get("")}, NewRole};
                {false, Reason} -> {reply, {0, Reason}};
                _ -> {reply, {0, lang:get("无效的技能")}}
            end;
        _ -> {reply, {0, lang:get("技能冷却中，无法使用")}}
    end;
handle(17835, {}, Role) ->
    case camp_halloween_mgr:rpc_clear_aim_cd(Role) of
        ok ->
            case role_misc:check_cd(rpc_17835) of
                true ->
                    Reply = camp_halloween_mgr:push_skill_cd(Role),
                    role:link_send(Role, 17833, Reply),
                    {reply, {1, lang:get("识破cd清空了{face_1, 36}")}};
                _ -> {reply, {0, lang:get("技能冷却中，无法使用")}}
            end;
        {false, Reason} -> {reply, {0, Reason}};
        _ -> {reply, {0, lang:get("技能冷却中，无法使用")}}
    end;
handle(17836, {Index}, Role) ->
    case role_misc:check_cd(rpc_17836) of
        true ->
            Msg = lang:get("弹幕发送成功"),
            notice:return(Msg),
            camp_halloween_mgr:rpc_send_screen_msg(Role, Index);
        false ->
            Msg = lang:get("发送弹幕cd中"),
            notice:return(Msg)
    end,
    ok;
handle(17837, {}, Role) ->
    VotiveTime = case get(votive_time) of
                     Val when is_integer(Val) -> Val;
                     _ -> 0
                 end,
    Now = date:unixtime(),
    RTime = Now - VotiveTime,
    case Now - VotiveTime >= 600 of
        true ->
            role:send_buff_begin(),
            case camp_whiteday:get_votive(Role) of
                {ok, NewRole} ->
                    role:send_buff_flush(),
                    {reply,
                     {1, "缘分天定！打开背包帮助有人缘之人实现愿望还可获得惊喜大礼哦！{face_1,7}"},
                     NewRole};
                {false, Msg} ->
                    role:send_buff_clean(),
                    {reply, {0, Msg}}
            end;
        _ when RTime =< 60 ->
            notice:return(notice:format(lang:get("~ts秒之后再来许愿"),
                                        [{string_2, 1, RTime}])),
            ok;
        _ when RTime ->
            notice:return(notice:format(lang:get("~ts分钟之后再来许愿"),
                                        [{string_2, 1, RTime div 60}])),
            ok
    end;
handle(17838, {}, Role) ->
    camp_doll:push(Role),
    ok;
handle(17839, {Type, Pos}, Role) ->
    logger:debug("打开套娃 ~w ~w",
                 [Type, Pos],
                 campaign_two_rpc,
                 362),
    case camp_doll:check_open() of
        true ->
            case camp_doll:open(Role, Type, Pos) of
                {ok, NewRole, Reward} ->
                    {reply, {Type, Pos, Reward}, NewRole};
                {false, Reason} ->
                    logger:debug("=-===== ~ts",
                                 [Reason],
                                 campaign_two_rpc,
                                 369),
                    notice:send(Role, 1, Reason),
                    ok
            end;
        _ ->
            notice:send(Role, 1, lang:get("当前不是活动时间")),
            ok
    end;
handle(17840, {}, Role) ->
    logger:debug("套娃刷新", [], campaign_two_rpc, 380),
    case camp_doll:check_open() of
        true ->
            case camp_doll:reset(Role) of
                {ok, NewRole} -> {reply, {1, ""}, NewRole};
                {false, Reason} ->
                    logger:debug("=-===== ~ts",
                                 [Reason],
                                 campaign_two_rpc,
                                 387),
                    {reply, {0, Reason}}
            end;
        _ -> {reply, {0, lang:get("当前不是活动时间")}}
    end;
handle(17842, {}, #role{pid = Pid}) ->
    campaign_unit:cast({get_info, Pid}),
    ok;
handle(17843, {}, Role) ->
    camp_sign:push(Role),
    ok;
handle(17844, {}, Role) ->
    case camp_sign:reward(Role) of
        {ok, NewRole} -> {reply, {1, ""}, NewRole};
        {false, Reason} -> {reply, {0, Reason}}
    end;
handle(17845, {}, Role) ->
    camp_exchange:push(Role),
    ok;
handle(17846, {Lev, Id}, Role) ->
    case camp_exchange:reward(Role, Lev, Id) of
        {ok, NewRole} -> {reply, {1, Lev, Id, ""}, NewRole};
        {false, Reason} -> {reply, {0, Lev, Id, Reason}}
    end;
handle(17847, {}, Role) ->
    logger:debug("斗兽棋开始匹配", [], campaign_two_rpc, 429),
    case camp_animal_chess_mgr:new_match(Role) of
        ok -> ok;
        {ok, NewRole, Msg} -> {reply, {1, Msg}, NewRole};
        {false, Reason} ->
            logger:debug("=-===== ~ts",
                         [Reason],
                         campaign_two_rpc,
                         435),
            {reply, {0, Reason}}
    end;
handle(17848, {},
       #role{pid = Pid, s_event = Event, s_event_pid = ZonePid,
             cross_type = CrossType})
    when Event =:= 49 andalso CrossType =:= 1 ->
    cross:cast(camp_animal_chess,
               cast,
               [ZonePid, {push_role, #{pid => Pid}}]),
    ok;
handle(17848, {},
       #role{pid = Pid, s_event = Event,
             s_event_pid = ZonePid})
    when Event =:= 49 ->
    camp_animal_chess:cast(ZonePid,
                           {push_role, #{pid => Pid}}),
    ok;
handle(17848, {}, _Role) -> ok;
handle(17849, {StartX, StartY, EndX, EndY},
       #role{id = RoleId, s_event = Event, s_event_pid = Pid,
             cross_type = CrossType})
    when Event =:= 49 ->
    logger:debug("斗兽棋开始移动 ~w",
                 [{{StartX, StartY}, {EndX, EndY}}],
                 campaign_two_rpc,
                 453),
    case camp_animal_chess:check_move({StartX, StartY},
                                      {EndX, EndY})
        of
        ok ->
            Result = case CrossType of
                         1 ->
                             cross:call(camp_animal_chess,
                                        call,
                                        [Pid,
                                         {move,
                                          #{start_pos => {StartX, StartY},
                                            end_pos => {EndX, EndY},
                                            role_id => RoleId}}]);
                         _ ->
                             camp_animal_chess:call(Pid,
                                                    {move,
                                                     #{start_pos =>
                                                           {StartX, StartY},
                                                       end_pos => {EndX, EndY},
                                                       role_id => RoleId}})
                     end,
            case Result of
                ok -> {reply, {1, ""}};
                {false, Reason} ->
                    logger:debug("=-===== ~ts",
                                 [Reason],
                                 campaign_two_rpc,
                                 466),
                    {reply, {0, Reason}};
                _ -> {reply, {0, lang:get("系统繁忙")}}
            end;
        {false, Reason} -> {reply, {0, Reason}}
    end;
handle(17850, {},
       #role{id = RoleId, pid = Pid, s_event = Event,
             s_event_pid = SPid, cross_type = 1})
    when Event =:= 49 ->
    logger:debug("斗兽棋直接认输", [], campaign_two_rpc, 477),
    cross:cast(camp_animal_chess,
               cast,
               [SPid, {give_up, #{role_id => RoleId, pid => Pid}}]),
    ok;
handle(17850, {},
       #role{id = RoleId, pid = Pid, s_event = Event,
             s_event_pid = SPid})
    when Event =:= 49 ->
    logger:debug("斗兽棋直接认输", [], campaign_two_rpc, 481),
    camp_animal_chess:cast(SPid,
                           {give_up, #{role_id => RoleId, pid => Pid}}),
    ok;
handle(17851, {}, Role) ->
    logger:debug("斗兽棋状态次数", [], campaign_two_rpc, 487),
    camp_animal_chess:push_times(Role),
    ok;
handle(17852, {X, Y},
       #role{id = RoleId, s_event = Event, s_event_pid = Pid,
             cross_type = CrossType})
    when Event =:= 49 ->
    logger:debug("斗兽棋开箱子 ~w",
                 [{X, Y}],
                 campaign_two_rpc,
                 493),
    Result = case CrossType of
                 1 ->
                     cross:call(camp_animal_chess,
                                call,
                                [Pid,
                                 {open, #{role_id => RoleId, pos => {X, Y}}}]);
                 _ ->
                     camp_animal_chess:call(Pid,
                                            {open,
                                             #{role_id => RoleId,
                                               pos => {X, Y}}})
             end,
    case Result of
        ok ->
            logger:debug("=-===== ", [], campaign_two_rpc, 502),
            ok;
        {false, Reason} ->
            logger:debug("=-===== ~ts",
                         [Reason],
                         campaign_two_rpc,
                         505),
            {reply, {0, Reason}};
        _R ->
            logger:debug("=-===== ~w", [_R], campaign_two_rpc, 508),
            {reply, {0, lang:get("系统繁忙")}}
    end;
handle(17854, {},
       #role{id = RoleId, pid = Pid, s_event = Event,
             s_event_pid = SPid, cross_type = 1})
    when Event =:= 49 ->
    logger:debug("斗兽棋发起求和", [], campaign_two_rpc, 514),
    cross:cast(camp_animal_chess,
               cast,
               [SPid, {ask_draw, #{role_id => RoleId, pid => Pid}}]),
    ok;
handle(17854, {},
       #role{id = RoleId, pid = Pid, s_event = Event,
             s_event_pid = SPid})
    when Event =:= 49 ->
    logger:debug("斗兽棋发起求和", [], campaign_two_rpc, 518),
    camp_animal_chess:cast(SPid,
                           {ask_draw, #{role_id => RoleId, pid => Pid}}),
    ok;
handle(17855, {Flag},
       #role{id = RoleId, pid = Pid, s_event = Event,
             s_event_pid = SPid, cross_type = 1})
    when Event =:= 49 ->
    logger:debug("斗兽棋回应求和 ~w",
                 [Flag],
                 campaign_two_rpc,
                 524),
    cross:cast(camp_animal_chess,
               cast,
               [SPid,
                {reply_draw,
                 #{role_id => RoleId, pid => Pid, flag => Flag}}]),
    ok;
handle(17855, {Flag},
       #role{id = RoleId, pid = Pid, s_event = Event,
             s_event_pid = SPid})
    when Event =:= 49 ->
    logger:debug("斗兽棋回应求和 ~w",
                 [Flag],
                 campaign_two_rpc,
                 528),
    camp_animal_chess:cast(SPid,
                           {reply_draw,
                            #{role_id => RoleId, pid => Pid, flag => Flag}}),
    ok;
handle(17856, {}, Role) ->
    logger:debug("斗兽棋请求积分 ", [], campaign_two_rpc, 534),
    camp_animal_chess:push_score(Role),
    ok;
handle(17858, {SecType}, Role) ->
    campaign_rank_mgr:push_rank(Role, SecType),
    ok;
handle(17859, {SecType}, Role) ->
    campaign_rank_mgr:push(Role, SecType),
    ok;
handle(17860, {SecType}, Role) ->
    campaign_rank_mgr:push_role(Role, SecType),
    ok;
handle(17861, {SecType, Num}, Role) ->
    case campaign_rank_mgr:reward(Role, SecType, Num) of
        {ok, NewRole} -> {reply, {1, ""}, NewRole};
        {false, Reason} -> {reply, {0, Reason}}
    end;
handle(17862, {Id, Count}, Role) ->
    role:send_buff_begin(),
    case camp_rice_dumpling:make(Role, Id, Count) of
        {ok, NewRole, List} ->
            role:send_buff_flush(),
            {reply, {1, "", List}, NewRole};
        {false, Reason} ->
            role:send_buff_clean(),
            {reply, {0, Reason, []}, Role}
    end;
handle(17863, {}, Role) ->
    camp_rice_dumpling:push(Role),
    ok;
handle(17864, {}, Role) ->
    camp_box:push(Role, client),
    ok;
handle(17865, {}, Role) ->
    camp_box:push_log(Role),
    ok;
handle(17866, {Pos}, Role) ->
    case camp_box:open(Role, Pos) of
        {ok, AddPosList, NewRole} ->
            {reply, {1, "", AddPosList}, NewRole};
        {false, Msg} -> {reply, {0, Msg, []}}
    end;
handle(17867, {}, Role) ->
    case camp_box:refresh(Role, role) of
        {ok, NewRole} -> {reply, {1, ""}, NewRole};
        {false, Msg} -> {reply, {0, Msg}}
    end;
handle(17868, {CampId}, Role) ->
    campaign_mgr:rpc_quest_camp_time(Role, CampId),
    ok;
handle(17869, {}, Role) ->
    camp_pay_continus:push(Role),
    ok;
handle(17870, {TargetDay}, Role) ->
    case camp_pay_continus:reward(Role, TargetDay) of
        {ok, NewRole} -> {reply, {1, ""}, NewRole};
        {false, Reason} -> {reply, {0, Reason}}
    end;
handle(17871, {}, Role) ->
    case camp_discount:push(Role) of
        {ok, NewRole} -> {ok, NewRole};
        _ -> ok
    end;
handle(17872, {ShopID}, Role) ->
    case camp_discount:reward(ShopID, Role) of
        {ok, NewRole} -> {reply, {1, ""}, NewRole};
        {ok, NewRole, Reason} -> {reply, {0, Reason}, NewRole};
        {false, Reason} -> {reply, {0, Reason}}
    end;
handle(17873, {}, Role) ->
    case camp_discount:refresh(Role) of
        {ok, NewRole} -> {reply, {1, ""}, NewRole};
        {false, Reason} -> {reply, {0, Reason}}
    end;
handle(17874, {}, Role) ->
    logger:debug("handle 17874~w",
                 [{1}],
                 campaign_two_rpc,
                 654),
    camp_exchange:push_item(Role),
    ok;
handle(17875, {}, Role) ->
    camp_new_flop:push_info(Role),
    ok;
handle(17876, {}, Role) ->
    role:send_buff_begin(),
    case camp_new_flop:wash_card(Role) of
        {ok, NewRole} ->
            role:send_buff_flush(),
            {reply, {1, lang:get("请选择")}, NewRole};
        {false, Reason} ->
            role:send_buff_clean(),
            {reply, {0, Reason}}
    end;
handle(17877, {Order}, Role)
    when Order >= 1 andalso Order =< 4 ->
    role:send_buff_begin(),
    case camp_new_flop:get_card(Role, Order) of
        {ok, NewRole} ->
            camp_new_flop:push_info(NewRole),
            role:send_buff_flush(),
            {reply, {1, ""}, NewRole};
        {false, Reason} ->
            role:send_buff_clean(),
            {reply, {0, Reason}}
    end;
handle(17878, {Msg}, Role) ->
    case camp_7_7th_mgr:sign(Role, Msg) of
        {ok, RtnMsg} -> {reply, {1, RtnMsg}};
        {false, Reason} -> {reply, {0, Reason}}
    end;
handle(17879, {}, Role) ->
    case camp_7_7th_mgr:get_sign_list(Role) of
        {false, Msg} -> notice:return(Msg);
        _ -> ignore
    end,
    ok;
handle(17880, {}, Role) ->
    camp_7_7th_mgr:push(Role),
    ok;
handle(17881, {}, Role) ->
    case camp_7_7th_mgr:join(Role) of
        {ok, NewRole} -> {reply, {1, ""}, NewRole};
        {ok, NewRole, Reason} -> {reply, {0, Reason}, NewRole};
        {false, Reason} ->
            notice:npc_talk(Role, 32020, Reason),
            {reply, {0, Reason}}
    end;
handle(17882, {}, Role) ->
    case camp_7_7th_mgr:reward(Role) of
        {ok, NewRole} -> {reply, {1, ""}, NewRole};
        {ok, NewRole, Reason} -> {reply, {0, Reason}, NewRole};
        {false, Reason} -> {reply, {0, Reason}}
    end;
handle(17883, {Days}, Role) ->
    camp_recharge:push(Role, Days),
    ok;
handle(17884, {Days}, Role) ->
    case camp_recharge:random_reward(Role, Days) of
        {ok, NewRole, Index} ->
            {reply, {Days, Index, 1, ""}, NewRole};
        {false, Reason} -> {reply, {Days, 0, 0, Reason}}
    end;
handle(17885, {Days}, Role) ->
    case camp_recharge:reward(Role, Days) of
        {ok, NewRole, Items} ->
            {reply, {Days, Items, 1, ""}, NewRole};
        {false, Reason} -> {reply, {Days, [], 0, Reason}}
    end;
handle(17886, {Days, BoxID}, Role) ->
    case camp_recharge:box_reward(Role, Days, BoxID) of
        {ok, NewRole} -> {reply, {Days, BoxID, 1, ""}, NewRole};
        {false, Reason} -> {reply, {Days, BoxID, 0, Reason}}
    end;
handle(17887, {}, Role) ->
    camp_recharge:push_cur_day(Role),
    ok;
handle(17888, {Days}, Role) ->
    camp_recharge_gift:push(Role, Days),
    ok;
handle(17889, {}, Role) ->
    camp_recharge_gift:push_cur_day(Role),
    ok;
handle(17890, {}, Role) ->
    {ok, Role2} = campaign_collection:info(Role),
    {ok, Role2};
handle(17891, {}, Role) ->
    case campaign_collection:roll_start(Role) of
        {ok, NewRole, Index} ->
            {reply, {Index, 1, ""}, NewRole};
        {false, Msg} -> {reply, {0, 0, Msg}}
    end;
handle(17892, {}, Role) ->
    case campaign_collection:roll_end(Role) of
        {ok, NewRole} -> {ok, NewRole};
        {false, Msg} -> {reply, {[], [], 0, Msg}}
    end;
handle(17893, {}, Role) ->
    case campaign_collection:get_login_reward(Role) of
        {ok, NewRole} -> {reply, {1, ""}, NewRole};
        {false, Msg} -> {reply, {0, Msg}}
    end;
handle(17894, {}, Role) ->
    case campaign_collection:get_final_reward(Role) of
        {ok, ItemID, Num, NewRole} ->
            {reply, {ItemID, Num, 1, ""}, NewRole};
        {false, Msg} -> {reply, {0, 0, 0, Msg}}
    end;
handle(17895, {}, Role) ->
    {ok, BoxInfo} = campaign_collection:get_box_info(Role),
    {reply, {BoxInfo}};
handle(17896, {TarRoleID, Items}, Role) ->
    case campaign_collection:give_present(Role,
                                          TarRoleID,
                                          Items)
        of
        {ok, NewRole} -> {reply, {1, ""}, NewRole};
        {false, Msg} -> {reply, {0, Msg}}
    end;
handle(17897, {Index}, Role) ->
    case campaign_collection:buy(Role, Index) of
        {ok, NewRole} -> {reply, {1, ""}, NewRole};
        {false, Msg} -> {reply, {0, Msg}}
    end;
handle(17898, {}, Role) ->
    case campaign_collection:present_info(Role) of
        {ok, PresentInfo, NewRole} ->
            {reply, {PresentInfo}, NewRole};
        {false, Msg} -> {reply, {0, Msg}}
    end;
handle(17899, {}, Role) ->
    stars_trial_mgr:push(Role),
    ok;
handle(_Cmd, _Data, _Role) ->
    logger:debug("模块[~w]收到无效的RPC调用[~w]: ~w",
                 [campaign_two_rpc, _Cmd, _Data],
                 campaign_two_rpc,
                 845),
    {error, unknow_command}.

