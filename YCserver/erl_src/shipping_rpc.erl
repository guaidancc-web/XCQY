-file("src/mod/shipping/shipping_rpc.erl", 1).

-module(shipping_rpc).

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

-file("src/mod/shipping/shipping_rpc.erl", 13).

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

-file("src/mod/shipping/shipping_rpc.erl", 14).

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

-file("src/mod/shipping/shipping_rpc.erl", 15).

-file("inc/shipping.hrl", 1).

-record(m_shipping, {ver = 1, total_num = 0}).

-record(shipping,
        {rid = {1, "", 0},
         world_lev = 0,
         role_lev = 0,
         type = 1,
         status = 0,
         reset_time = 0,
         start_time = 0,
         help = 0,
         show_list = [],
         cells = []}).

-record(shipping_cell,
        {ver = 1,
         id = 0,
         type = 1,
         status = 1,
         help_type = 0,
         pack_type = 0,
         normal_rewards = [],
         rewards = [],
         item_base_id = 0,
         need_num = 0,
         help_friends = [],
         help_guild = {"", 0, ""},
         quest_id = 0}).

-record(shipping_cell_data,
        {id = 0,
         classify = 0,
         classes = 0,
         lev = 0,
         item_base_id = 0,
         need_num = 0,
         weight = 0,
         exp = 0,
         ratio = 0,
         quest_id = 0}).

-record(shipping_classify_data,
        {classify = 0,
         min_num = 0,
         max_num = 0,
         is_show = 0,
         weight = 0}).

-record(shipping_cell_quset_data,
        {id = 0,
         classify = 0,
         quest_id = 0,
         item_base_id = 0,
         ratio = 0,
         week_min = 0,
         week_max = 0}).

-record(quest_shipping_data,
        {id = 0,
         type = 0,
         ring = 0,
         max_ring = 0,
         next_id = 0,
         rewards = [],
         leader_exp_mode = 0,
         leader_ratio = 0,
         exp_mode = 0,
         ratio = 0}).

-record(quest_shipping_reward_data,
        {id = 0,
         min = 0,
         max = 0,
         ratio = 0,
         rewards = [],
         need_num = 0,
         exp_mode = 0,
         mate_rewards = [],
         mate_exp_mode = 0}).

-file("src/mod/shipping/shipping_rpc.erl", 16).

-export([handle/3]).

handle(13700, _Rid, Role) ->
    case shipping:get_start_info(Role) of
        Reply = {reply, _Data} -> Reply;
        false -> ok
    end;
handle(13701, {}, #role{id = Rid}) ->
    case shipping:get_ready_info(Rid) of
        Reply = {reply, _Data} -> Reply;
        false -> ok
    end;
handle(13702, {}, Role) ->
    case shipping:start_shipping(Role) of
        {ok, NewRole} -> {ok, NewRole};
        {false, Msg} ->
            notice:send(Role, 1, Msg),
            ok;
        _False -> ok
    end;
handle(13703, {CellId}, Role) ->
    role:send_buff_begin(),
    case shipping:commit(CellId, Role) of
        {ok, NewCell, NRole} ->
            role:send_buff_flush(),
            {reply, {NewCell}, NRole};
        {false, Msg} ->
            role:send_buff_clean(),
            notice:send(Role, 1, Msg),
            ok;
        _False ->
            role:send_buff_clean(),
            ok
    end;
handle(13704, {Tag, Rid, Platform, ZoneId, CellId},
       Role) ->
    Atom = case Tag of
               1 -> guild;
               _ -> friend
           end,
    role:send_buff_begin(),
    case shipping:commit_help(Atom,
                              {Rid, Platform, ZoneId},
                              CellId,
                              Role)
        of
        {ok, NewCell, NRole} ->
            role:send_buff_flush(),
            {reply, {NewCell}, NRole};
        {false, Msg} ->
            role:send_buff_clean(),
            notice:send(Role, 1, Msg),
            ok;
        _False ->
            role:send_buff_clean(),
            ok
    end;
handle(13705, {}, Role) ->
    case shipping:sail(Role) of
        {ok, NRole} -> {reply, {1}, NRole};
        {false, Msg} ->
            notice:send(Role, 1, Msg),
            {reply, {0}};
        _False -> {reply, {0}}
    end;
handle(13706, {CellId}, Role) ->
    case shipping:help_guild(CellId, Role) of
        ok -> {reply, {1, CellId}};
        {false, Msg} ->
            notice:send(Role, 1, Msg),
            {reply, {0, CellId}};
        _False -> {reply, {0, CellId}}
    end;
handle(13707, {Friends, CellId}, Role) ->
    case shipping:help_friends(Friends, CellId, Role) of
        ok -> {reply, {1, CellId}};
        {false, Msg} ->
            notice:send(Role, 1, Msg),
            {reply, {0, CellId}};
        _False -> {reply, {0, CellId}}
    end;
handle(13708, {}, Role) ->
    case shipping:get_info(Role) of
        false -> ok;
        ok -> ok;
        _False -> ok
    end;
handle(13709, {}, Role) ->
    shipping:push_status(Role),
    ok;
handle(13710, {1, Id, Platform, ZoneId, CellId},
       Role) ->
    case shipping:get_help_cell(guild,
                                {Id, Platform, ZoneId},
                                CellId,
                                Role)
        of
        {ok, Cell} -> {reply, Cell};
        {false, Msg} ->
            notice:send(Role, 1, Msg),
            ok;
        false -> ok
    end;
handle(13710, {2, Id, Platform, ZoneId, CellId},
       Role) ->
    case shipping:get_help_cell(friend,
                                {Id, Platform, ZoneId},
                                CellId,
                                Role)
        of
        {ok, Reply} -> {reply, Reply};
        {false, Msg} ->
            notice:send(Role, 1, Msg),
            ok;
        false -> ok
    end;
handle(13712, {}, Role) ->
    shipping:timeout(Role),
    ok;
handle(13715, {CellId}, Role) ->
    case shipping:combat_start(Role, CellId) of
        {false, Reason} ->
            notice:return(Reason),
            {reply, {0}};
        ok -> {reply, {1}}
    end;
handle(13716, {BattleId, UId}, Role) ->
    role:send_buff_begin(),
    case shipping:get_box(Role, {BattleId, UId}) of
        {ok, NewRole} ->
            role:send_buff_flush(),
            {ok, NewRole};
        {false, Reason} ->
            role:send_buff_clean(),
            notice:return(Reason),
            ok
    end;
handle(_Code, _Args, _) ->
    logger:debug("接收到错误的请求:[Code:~w][Args:~w]",
                 [_Code, _Args],
                 shipping_rpc,
                 189),
    ok.

