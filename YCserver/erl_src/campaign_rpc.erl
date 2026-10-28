-file("src/mod/campaign/campaign_rpc.erl", 1).

-module(campaign_rpc).

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

-file("src/mod/campaign/campaign_rpc.erl", 9).

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

-file("src/mod/campaign/campaign_rpc.erl", 10).

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

-file("src/mod/campaign/campaign_rpc.erl", 11).

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

-file("src/mod/campaign/campaign_rpc.erl", 12).

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

-file("src/mod/campaign/campaign_rpc.erl", 13).

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

-file("src/mod/campaign/campaign_rpc.erl", 14).

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

-file("src/mod/campaign/campaign_rpc.erl", 15).

-file("inc/assets.hrl", 1).

-record(assets,
        {ver = 41 :: pos_integer(),
         exp = 0 :: non_neg_integer(),
         coin = 0 :: non_neg_integer(),
         coin_bind = 0 :: non_neg_integer(),
         gold = 0 :: non_neg_integer(),
         gold_bind = 0 :: non_neg_integer(),
         intelligs = 0 :: non_neg_integer(),
         guild = 0 :: non_neg_integer(),
         energy = 0 :: non_neg_integer(),
         satiety = 300 :: non_neg_integer(),
         stars_score = 0 :: non_neg_integer(),
         reserve_exp = 0 :: non_neg_integer(),
         character = 0 :: non_neg_integer(),
         alchemy = 0 :: non_neg_integer(),
         love = 0 :: non_neg_integer(),
         teacher_score = 0 :: non_neg_integer(),
         tournament = 0 :: non_neg_integer(),
         lottery_luck = 0 :: non_neg_integer(),
         endless_challenge = 0 :: non_neg_integer(),
         handbook_point = 0 :: non_neg_integer(),
         autumn_score = 0 :: non_neg_integer(),
         star_gold = 0 :: non_neg_integer(),
         halloween = 0 :: non_neg_integer(),
         thanksgiving = 0 :: non_neg_integer(),
         new_year = 0 :: non_neg_integer(),
         firecracker = 0 :: non_neg_integer(),
         glue_pudding = 0 :: non_neg_integer(),
         crystal = 0 :: non_neg_integer(),
         ticket = 0 :: non_neg_integer(),
         brother = 0 :: non_neg_integer(),
         egg = 0 :: non_neg_integer(),
         exchange = 0 :: non_neg_integer(),
         turn = 0 :: non_neg_integer(),
         father = 0 :: non_neg_integer(),
         lucky_ticket = 0 :: non_neg_integer(),
         dollar = 0 :: non_neg_integer(),
         naughty = 0 :: non_neg_integer(),
         concentric = 0 :: non_neg_integer(),
         qixiIntegral = 0 :: non_neg_integer(),
         sunshine = 0 :: non_neg_integer(),
         cut_price = 0 :: non_neg_integer(),
         single_dog = 0 :: non_neg_integer(),
         panda_score = 0 :: non_neg_integer(),
         joyful_egg = 0 :: non_neg_integer(),
         godswar = 0 :: non_neg_integer(),
         skl_unique_exp = 0 :: non_neg_integer(),
         happy_score = 0 :: non_neg_integer(),
         slot_machine = 0 :: non_neg_integer(),
         reserve_gold = 0 :: non_neg_integer(),
         zillionaire_sc = 0,
         score_exchange = 0 :: non_neg_integer(),
         new_open_turn = 0 :: non_neg_integer(),
         long_active = 0 :: non_neg_integer(),
         long_score = 0 :: non_neg_integer(),
         camp_pray_sc = 0 :: non_neg_integer()}).

-file("src/mod/campaign/campaign_rpc.erl", 16).

handle(14000, {}, Role) ->
    campaign:push_camp(Role),
    ok;
handle(14001, {Id}, Role) ->
    role:send_buff_begin(),
    case campaign:reward(Role, Id) of
        {false, Reason} ->
            role:send_buff_clean(),
            notice:send(Role, 1, Reason),
            {reply, {0, Id}};
        {ok, NRole} ->
            role:send_buff_flush(),
            {reply, {1, Id}, NRole}
    end;
handle(14003, {}, Role) ->
    campaign:push_ico(Role),
    ok;
handle(14004, {}, _Role) ->
    campaign_time:push_time_info(),
    ok;
handle(14005, {}, #role{pid = Pid}) ->
    camp_guild_bady:push(Pid),
    ok;
handle(14006, {}, Role) ->
    campaign_eggs:push(Role, 14006),
    ok;
handle(14007, {}, Role) ->
    role:send_buff_begin(),
    case campaign_eggs:roll(Role) of
        {false, Why} ->
            role:send_buff_clean(),
            {reply, {0, Why, 0, 0}};
        {ok, NRole, Point, BaseId} ->
            role:send_buff_flush(),
            {reply, {1, "", Point, BaseId}, NRole}
    end;
handle(14008, {Id}, Role) ->
    role:send_buff_begin(),
    case campaign_eggs:reward(Role, Id) of
        {false, Why} ->
            role:send_buff_clean(),
            {reply, {0, Why}};
        {ok, NRole} ->
            role:send_buff_flush(),
            {reply, {1, ""}, NRole}
    end;
handle(14009, {}, Role) ->
    campaign_bags:push(Role, 14009),
    ok;
handle(14010, {Id}, Role) ->
    role:send_buff_begin(),
    case campaign_bags:fill(Role, Id) of
        {false, Why} ->
            role:send_buff_clean(),
            {reply, {0, Why}};
        {ok, NRole} ->
            role:send_buff_flush(),
            {reply, {1, ""}, NRole}
    end;
handle(14011, {Id}, Role) ->
    role:send_buff_begin(),
    case campaign_bags:reward(Role, Id) of
        {false, Why} ->
            role:send_buff_clean(),
            {reply, {0, Why}};
        {ok, NRole} ->
            role:send_buff_flush(),
            {reply, {1, ""}, NRole}
    end;
handle(14012, {R, P, Z, Id}, Role) ->
    Now = date:unixtime(),
    Cd = 60,
    case erlang:get(rpc_14012) of
        Last when is_integer(Last) andalso Now - Last < Cd ->
            {reply,
             {0,
              notice:format(lang:get("你刚求助过了，请在~ts秒后再操作"),
                            [{string_2, 1, Cd - (Now - Last)}])}};
        _ ->
            case campaign_bags:ask_help(Role,
                                        #{item_id => Id, target_id => {R, P, Z},
                                          type => 2})
                of
                {false, Why} -> {reply, {0, Why}};
                {ok, NRole} ->
                    erlang:put(rpc_14012, Now),
                    {reply, {1, lang:get("求助成功，耐心等待帮助吧")}, NRole}
            end
    end;
handle(14013, {Id}, Role) ->
    Now = date:unixtime(),
    Cd = 60,
    case erlang:get(rpc_14013) of
        Last when is_integer(Last) andalso Now - Last < Cd ->
            {reply,
             {0,
              notice:format(lang:get("你刚求助过了，请在~ts秒后再操作"),
                            [{string_2, 1, Cd - (Now - Last)}])}};
        _ ->
            case campaign_bags:ask_help(Role,
                                        #{item_id => Id, type => 1})
                of
                {false, Why} -> {reply, {0, Why}};
                {ok, NRole} ->
                    erlang:put(rpc_14013, Now),
                    {reply, {1, lang:get("求助成功，耐心等待帮助吧")}, NRole}
            end
    end;
handle(14014, {}, Role) ->
    role:send_buff_begin(),
    case campaign_bags:reward(Role) of
        {false, Why} ->
            role:send_buff_clean(),
            {reply, {0, Why}};
        {ok, NRole} ->
            role:send_buff_flush(),
            {reply, {1, ""}, NRole}
    end;
handle(14019, {}, Role) ->
    campaign:push(Role, 14019),
    ok;
handle(14021, {Id, Platform, ZoneId}, Role) ->
    camp_fruit:push(Role, {Id, Platform, ZoneId}),
    ok;
handle(14022, {Type, Id, List}, Role) ->
    case role_misc:check_cd({rpc_14022, Type}) of
        true ->
            case camp_fruit:help_call(Role, Type, Id, List) of
                {false, Reason} -> notice:return(Reason);
                _ -> ok
            end;
        _ when Type == 1 -> notice:return(lang:get("好友求助过于频繁"));
        _ -> notice:return(lang:get("公会求助过于频繁"))
    end,
    ok;
handle(14023, {Id}, Role) ->
    case camp_fruit:plant(Role, Id) of
        {false, Reason} -> {reply, {0, Id, Reason}};
        {ok, NewRole} -> {reply, {1, Id, ""}, NewRole}
    end;
handle(14024,
       {RId, RPlat, RZoneId, Id, Type, BaseId, Num}, Role) ->
    case camp_fruit:help_plant(Role,
                               {RId, RPlat, RZoneId},
                               Id,
                               Type,
                               BaseId,
                               Num)
        of
        {false, Reason} ->
            notice:return(Reason),
            {reply, {0, ""}};
        {ok, NewRole} -> {reply, {1, ""}, NewRole}
    end;
handle(14025, {Id}, Role) ->
    case camp_fruit:pick(Role, Id) of
        {false, Reason} ->
            notice:return(Reason),
            {reply, {0, Id, Reason}};
        {ok, NewRole} -> {reply, {1, Id, ""}, NewRole}
    end;
handle(14026, {}, Role) ->
    case camp_fruit:reward(Role) of
        {false, Reason} ->
            notice:return(Reason),
            {reply, {0, Reason}};
        {ok, NewRole} -> {reply, {1, ""}, NewRole}
    end;
handle(14027, {}, Role) ->
    logger:debug("=====================================",
                 [],
                 campaign_rpc,
                 224),
    camp_login:push(Role),
    ok;
handle(14029, {Day}, Role) ->
    logger:debug("=====================================",
                 [],
                 campaign_rpc,
                 230),
    case camp_login:reward(Role, Day) of
        {false, Reason} ->
            logger:debug("=====================================",
                         [],
                         campaign_rpc,
                         233),
            notice:return(Reason),
            {reply, {0, Reason}};
        {ok, NewRole} ->
            logger:debug("=====================================",
                         [],
                         campaign_rpc,
                         237),
            {reply, {1, ""}, NewRole}
    end;
handle(14030, {Id}, Role) ->
    case camp_login:buy(Role, Id) of
        {false, Reason} ->
            notice:return(Reason),
            {reply, {0, Reason}};
        {ok, NewRole} -> {reply, {1, ""}, NewRole}
    end;
handle(14031, {}, Role) ->
    case camp_hide_seek:reward(Role) of
        {false, Reason} ->
            notice:npc_talk(Role, 76519, Reason),
            {reply, {0, ""}};
        {ok, NewRole} ->
            notice:return(lang:get("领奖成功")),
            {reply, {1, ""}, NewRole}
    end;
handle(14032, {}, Role) ->
    camp_hide_seek:push(Role),
    ok;
handle(14033, {}, Role) ->
    camp_hide_seek:push_unit(Role),
    ok;
handle(14034, {Type, BaseId, List}, Role) ->
    camp_hide_seek:help_call(Role, Type, BaseId, List),
    ok;
handle(14035, {Type, BaseId, List}, Role) ->
    camp_hide_seek:help(Role, Type, BaseId, List),
    ok;
handle(14037, {BaseId}, Role) ->
    case camp_hide_seek:active_npc(Role, BaseId) of
        {ok, NewRole} -> {ok, NewRole};
        _ -> ok
    end;
handle(14038, {}, Role) ->
    camp_turn:push(Role),
    ok;
handle(14039, {Type}, Role) ->
    case camp_turn:turn(Role, Type) of
        {ok, Id, NewRole} ->
            {reply, {1, Type, Id, ""}, NewRole};
        {false, Reason, NewRole} ->
            {reply, {0, Type, 0, Reason}, NewRole}
    end;
handle(14040, {}, Role) ->
    case camp_turn:reward(Role) of
        {ok, ItemList, NewRole} ->
            {reply, {1, "", ItemList}, NewRole};
        {false, Reason} -> {reply, {0, Reason, []}}
    end;
handle(14041, {Type, Num}, Role) ->
    case camp_turn:batch_turn(Role, Type, Num) of
        {ok, Ids, NewRole} ->
            {reply, {1, Type, Ids, ""}, NewRole};
        {false, Reason, NewRole} ->
            {reply, {0, Type, [], Reason}, NewRole};
        {half, Msg, NewRole} ->
            {reply, {1, Type, [], Msg}, NewRole}
    end;
handle(14043, {Order}, Role)
    when Order >= 1 andalso Order =< 3 ->
    case campaign_unit_card:get_reward(Role, Order) of
        {false, Reason} -> {reply, {0, Reason}};
        {ok, Msg, NewRole} -> {reply, {1, Msg}, NewRole}
    end;
handle(14044, {}, #role{pid = RolePid}) ->
    campaign_unit:info({get_map, RolePid}),
    ok;
handle(14045, {}, Role) ->
    Data = campaign_group_purchase:list(Role),
    {reply, Data};
handle(14046, {Id, Num}, Role) when Num > 0 ->
    role:send_buff_begin(),
    case campaign_group_purchase:buy(Role, Id, Num) of
        {ok,
         NewRole,
         Discount,
         AllBuyNum,
         SelfBuyNum,
         NewDayGroup} ->
            role:send_buff_flush(),
            {reply,
             {1,
              "",
              Id,
              Discount,
              AllBuyNum,
              SelfBuyNum,
              NewDayGroup},
             NewRole};
        {false, Reason} ->
            role:send_buff_clean(),
            {reply, {0, Reason, Id, 0, 0, 0, 0}}
    end;
handle(14047, {}, Role) ->
    campaign_card:push_info(Role),
    ok;
handle(14048, {}, Role) ->
    role:send_buff_begin(),
    case campaign_card:wash_card(Role) of
        {ok, NewRole} ->
            campaign_card:push_info(NewRole),
            role:send_buff_flush(),
            {reply, {1, lang:get("请选择")}, NewRole};
        {false, Reason} ->
            role:send_buff_clean(),
            {reply, {0, Reason}}
    end;
handle(14049, {Order}, Role)
    when Order >= 1 andalso Order =< 4 ->
    role:send_buff_begin(),
    case campaign_card:get_card(Role, Order) of
        {ok, NewRole} ->
            campaign_card:push_info(NewRole),
            role:send_buff_flush(),
            {reply, {1, ""}, NewRole};
        {false, Reason} ->
            role:send_buff_clean(),
            {reply, {0, Reason}}
    end;
handle(14050, {0}, Role) ->
    camp_web:push(Role),
    ok;
handle(14050, {Id}, Role) ->
    camp_web:push(Role, Id),
    ok;
handle(14053, {TotalId, MenuId, N, Num}, Role) ->
    case camp_web:reward(Role, TotalId, MenuId, N, Num) of
        {ok, NRole} -> {reply, {1}, NRole};
        {false, Reason} ->
            notice:return(Reason),
            {reply, {0}}
    end;
handle(14054, {Type}, _Role) ->
    logger:debug("========================:~w",
                 [Type],
                 campaign_rpc,
                 411),
    case camp_web_rank:lookup(Type) of
        #camp_web_rank{list = List} ->
            logger:debug("========================:~w",
                         [List],
                         campaign_rpc,
                         414),
            {reply, {Type, List}};
        _Err ->
            logger:debug("========================:~w",
                         [_Err],
                         campaign_rpc,
                         417),
            {reply, {Type, []}}
    end;
handle(14055, {BattleId, UnidId}, Role) ->
    logger:debug("选择的灯:~w",
                 [{BattleId, UnidId}],
                 campaign_rpc,
                 424),
    case camp_mid_autumn:rpc_open_kongming_lanterns(Role,
                                                    {BattleId, UnidId})
        of
        {ok, AskId} -> {reply, {1, "", AskId}};
        {false, Reason} ->
            logger:debug("答题失败:~w", [Reason], campaign_rpc, 429),
            notice:npc_talk(Role, 74150, Reason),
            {reply, {0, "", 0}}
    end;
handle(14056, {Answer}, Role) ->
    case camp_mid_autumn:rpc_answer_kongming_lanterns(Role,
                                                      Answer)
        of
        {ok, 1} ->
            logger:debug("回答答案:~w, 回答答案:~w",
                         [Answer, Answer],
                         campaign_rpc,
                         439),
            {reply, {1, "", Answer, Answer}};
        {ok, Result} ->
            logger:debug("回答答案:~w, 回答答案:~w",
                         [Result, Answer],
                         campaign_rpc,
                         442),
            {reply, {1, "", Result, Answer}};
        {ok, NewRole, 1} ->
            logger:debug("回答答案:~w, 回答答案:~w",
                         [Answer, Answer],
                         campaign_rpc,
                         445),
            {reply, {1, "", Answer, Answer}, NewRole};
        {ok, NewRole, Result} ->
            logger:debug("回答答案:~w, 回答答案:~w",
                         [Result, Answer],
                         campaign_rpc,
                         448),
            {reply, {1, "", Result, Answer}, NewRole};
        {false, Reason} ->
            logger:debug("答题失败:~w", [Reason], campaign_rpc, 451),
            {reply, {0, Reason, 0, Answer}}
    end;
handle(14057, {}, Role) ->
    camp_mid_autumn:rpc_kongming_lanterns_info(Role),
    ok;
handle(14059, {}, Role) ->
    case camp_mid_autumn:rpc_leave_kongming_lanterns(Role)
        of
        ok -> ok;
        {ok, NewRole} -> {reply, {1, ""}, NewRole};
        {false, Reason} -> {reply, {0, Reason}}
    end;
handle(14060, {}, Role = #role{cross_type = 0}) ->
    case camp_mid_autumn:rpc_join_enjoy_moon(Role) of
        ok -> ok;
        {ok, NewRole} -> {ok, NewRole};
        {false, Reason} -> {reply, {0, Reason}}
    end;
handle(14060, _, #role{}) ->
    {reply, {0, lang:get("跨服下不支持参与该活动")}};
handle(14061, {}, Role) ->
    case camp_mid_autumn:rpc_leave_enjoy_moon(Role) of
        ok -> ok;
        {ok, NewRole} -> {ok, NewRole};
        {false, Reason} -> {reply, {0, Reason}}
    end;
handle(14062, {WishType, WishMsg}, Role)
    when WishType >= 1 andalso
             WishType =< 2 andalso is_list(WishMsg) ->
    role:send_buff_begin(),
    case camp_mid_autumn:rpc_wish(Role, WishType, WishMsg)
        of
        {ok, NewRole, Msg} ->
            role:send_buff_flush(),
            {reply, {1, Msg}, NewRole};
        {false, Reason} ->
            role:send_buff_clean(),
            logger:debug("进行孔明灯奇缘失败:~ts",
                         [Reason],
                         campaign_rpc,
                         501),
            {reply, {0, Reason}}
    end;
handle(14065, {}, Role) ->
    camp_mid_autumn:rpc_enjoy_moon_info(Role),
    ok;
handle(14067, {Process}, Role)
    when Process >= 1 andalso Process =< 3 ->
    case camp_mid_autumn:rpc_get_wish_reward(Role, Process)
        of
        {ok, NewRole} -> {reply, {1, ""}, NewRole};
        {false, Reason} -> {reply, {0, Reason}}
    end;
handle(14068, {}, Role) ->
    camp_enjoy_moon:get_role_rank(Role),
    ok;
handle(14069, {}, Role) ->
    Flag1 = var:get_var(Role, day, 66, 0),
    Flag2 = var:get_var(Role, day, 67, 0),
    Flag3 = var:get_var(Role, day, 68, 0),
    Data = [{66, Flag1}, {67, Flag2}, {68, Flag3}],
    {reply, {Data}};
handle(14070, {}, Role) ->
    camp_national_wisdom:push_14070(Role),
    ok;
handle(14071, {}, Role) ->
    case camp_national_wisdom:rpc_join_national_wisdom(Role)
        of
        {ok, AskId, DoneAnswer, LuckyerList} ->
            _Answer =
                question_data:get_national_wisdom_answer(AskId),
            logger:debug("玩家获取到题目:~w, 正确答案：~w, 已经选择答案:~w, 上轮幸运玩家:~w",
                         [AskId, _Answer, DoneAnswer, LuckyerList],
                         campaign_rpc,
                         543),
            {reply, {1, "", AskId, DoneAnswer, LuckyerList}};
        {false, Reason} ->
            logger:debug("获取答题信息失败:~ts",
                         [Reason],
                         campaign_rpc,
                         546),
            {reply, {0, Reason, 0, 0, []}}
    end;
handle(14072, {Answer, IsWorld}, Role) ->
    case
        camp_national_wisdom:rpc_answer_national_wisdom(Role,
                                                        Answer,
                                                        IsWorld)
        of
        {ok, {RightAnswer, _, _, _, _}} ->
            logger:debug("玩家进行作答:~w, 正确答案:~w",
                         [Answer, RightAnswer],
                         campaign_rpc,
                         554),
            {reply, {1, "", RightAnswer, Answer}};
        {false, Reason} ->
            logger:debug("作答失败:~ts", [Reason], campaign_rpc, 557),
            {reply, {0, Reason, 0, 0}}
    end;
handle(14073, {}, Role) ->
    camp_rainbow_lottery:push_14073(Role),
    ok;
handle(14074, {}, Role) ->
    case
        camp_rainbow_lottery:rpc_rainbow_lottery_result(Role)
        of
        {ok, NewRole, PrizeId} ->
            logger:debug("玩家进行彩虹抽奖，抽奖结果:~w",
                         [PrizeId],
                         campaign_rpc,
                         570),
            {reply, {1, "", PrizeId}, NewRole};
        {false, Reason} ->
            logger:debug("获取抽奖结果失败:~ts",
                         [Reason],
                         campaign_rpc,
                         573),
            {reply, {0, Reason, 0}}
    end;
handle(14075, {}, Role) ->
    case
        camp_rainbow_lottery:rpc_get_rainbow_lottery_reward(Role)
        of
        {ok, NewRole, Rewards} ->
            logger:debug("获取抽奖奖励成功", [], campaign_rpc, 582),
            RtnRewards = [{Assets, Val}
                          || {Assets, _, Val} <- Rewards],
            {reply, {1, "", RtnRewards}, NewRole};
        {false, Reason} ->
            logger:debug("领取彩虹抽奖奖励失败:~ts",
                         [Reason],
                         campaign_rpc,
                         586),
            {reply, {0, Reason, []}}
    end;
handle(14076, {}, Role) ->
    role:send_buff_begin(),
    case camp_rainbow_lottery:rpc_flush_prize(Role) of
        {ok, NewRole, Msg} ->
            role:send_buff_flush(),
            {reply, {1, Msg}, NewRole};
        {false, Reason} ->
            role:send_buff_clean(),
            {reply, {0, Reason, 0}}
    end;
handle(14077, {}, Role) ->
    case camp_rainbow_lottery:rpc_rainbow_lottery_ten(Role)
        of
        {ok, NewRole, PrizeId} ->
            logger:debug("玩家进行彩虹抽奖，抽奖结果:~w",
                         [PrizeId],
                         campaign_rpc,
                         606),
            {reply, {1, "", PrizeId}, NewRole};
        {false, Reason} ->
            logger:debug("获取抽奖结果失败:~ts",
                         [Reason],
                         campaign_rpc,
                         609),
            {reply, {0, Reason, 0}}
    end;
handle(14080, {}, Role) ->
    camp_cake:push(Role),
    ok;
handle(14081, {}, Role) ->
    camp_cake:push_step(Role),
    ok;
handle(14082, {QId, Aid}, Role) ->
    case camp_cake:answer(Role, QId, Aid) of
        {ok, Code, NewRole} ->
            {reply,
             {Code, "", Aid, camp_cake_data:get_answer(QId)},
             NewRole};
        {false, Reason} -> {reply, {0, Reason, Aid, 0}}
    end;
handle(14083, {}, Role) ->
    case camp_cake:exit(Role) of
        {ok, NewRole} -> {reply, {1, ""}, NewRole};
        {false, Reason} -> {reply, {0, Reason}}
    end;
handle(14086, {}, Role) ->
    camp_cake:push_times(Role),
    ok;
handle(14087, {}, Role) ->
    camp_login_roll:push(Role),
    ok;
handle(14088, {RewardId}, Role) ->
    case camp_login_roll:reward_get(Role, RewardId) of
        {ok, NewRole} -> {reply, {RewardId, 1, ""}, NewRole};
        {false, Reason} -> {reply, {0, 0, Reason}}
    end;
handle(14089, {}, Role) ->
    case camp_login_roll:roll(Role) of
        {ok, Val, NewRole} -> {reply, {Val, 1, ""}, NewRole};
        {false, Reason} -> {reply, {0, 0, Reason}};
        _ -> {reply, {0, 0, lang:get("今天投掷次数已用完")}}
    end;
handle(14091, {}, Role) ->
    camp_series_recharge:push(Role),
    ok;
handle(14092, {Id}, Role) ->
    case camp_series_recharge:get_reward(Role, Id) of
        {ok, NewRole} -> {ok, NewRole};
        {false, Msg} -> {reply, {Id, 0, Msg}}
    end;
handle(14093, {}, Role) ->
    case camp_login_roll:roll_reward(Role) of
        {ok, NewRole} -> {ok, NewRole};
        _ -> ok
    end;
handle(14094, {}, Role) ->
    camp_login_roll:push_pmd(Role),
    ok;
handle(14095, {}, _Role) -> ok;
handle(14096, {}, Role) ->
    case campaign_wish:wish(Role) of
        {ok, NewRole, Val} ->
            {reply,
             {Val,
              1,
              notice:format(lang:get("许愿成功{face_1,3}，获得~ts"),
                            [{assets_1, 90026, Val}])},
             NewRole};
        {false, Reason} -> {reply, {0, 0, Reason}}
    end;
handle(14097, {}, Role) ->
    campaign_wish:push_times(Role),
    ok;
handle(14099, {}, Role) ->
    camp_turn:push_log(Role),
    ok;
handle(_Cmd, _Data, _Role) ->
    logger:debug("模块[~w]收到无效的RPC调用[~w]: ~w",
                 [campaign_rpc, _Cmd, _Data],
                 campaign_rpc,
                 729),
    {error, unknow_command}.

