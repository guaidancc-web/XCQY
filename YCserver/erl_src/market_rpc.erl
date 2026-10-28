-file("src/mod/market/market_rpc.erl", 1).

-module(market_rpc).

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

-file("src/mod/market/market_rpc.erl", 13).

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

-file("src/mod/market/market_rpc.erl", 14).

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

-file("src/mod/market/market_rpc.erl", 15).

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

-file("src/mod/market/market_rpc.erl", 16).

-file("inc/market_gold.hrl", 1).

-record(m_market_gold, {ver = 1, limit_data = []}).

-record(market_gold_item_data,
        {id :: undefined | pos_integer(),
         base_id :: undefined | pos_integer(),
         catalg_1 :: undefined | pos_integer(),
         catalg_2 :: undefined | pos_integer(),
         init_price :: undefined | non_neg_integer(),
         init_stock :: undefined | non_neg_integer(),
         world_lev :: undefined | non_neg_integer(),
         max_price :: undefined | non_neg_integer(),
         min_price :: undefined | non_neg_integer(),
         is_exchange :: undefined | 0 | 1,
         day_limit :: undefined | non_neg_integer(),
         classes :: undefined | non_neg_integer(),
         up_ratio :: undefined | non_neg_integer(),
         down_ratio :: undefined | non_neg_integer()}).

-record(market_gold_item,
        {id :: undefined | pos_integer(),
         base_id = 0 :: pos_integer(),
         stock = 0 :: non_neg_integer(),
         init_stock = 0 :: non_neg_integer(),
         init_price = 0 :: non_neg_integer(),
         def_price = 0 :: non_neg_integer(),
         cur_price = 0 :: non_neg_integer(),
         margin = 1000 :: non_neg_integer(),
         margin_acc = 1000 :: non_neg_integer(),
         day_sold = 0 :: non_neg_integer(),
         day_buy = 0 :: non_neg_integer(),
         ver = 1 :: non_neg_integer()}).

-record(market_gold_change_item,
        {base_id = 0 :: pos_integer(),
         got_list = [] :: list(),
         catalg_1 = 0 :: pos_integer(),
         catalg_2 = 0 :: pos_integer()}).

-record(market_gold_price,
        {base_id = 0,
         margin_type = 0,
         init_price = 0,
         buy_price = 0,
         margin = 0}).

-record(market_gold_limit_data,
        {id = 0,
         min = 0,
         max = 0,
         num = 0,
         is_show = 0,
         type = 0}).

-file("src/mod/market/market_rpc.erl", 17).

-export([handle/3]).

handle(12400, {Catalg1, Catalg2}, Role) ->
    case market_gold:get_items(Catalg1, Catalg2, Role) of
        {ok, Data} -> {reply, Data};
        _ -> ok
    end;
handle(12401, {BaseId, Num}, Role) ->
    role:send_buff_begin(),
    case market_gold:buy(Role, BaseId, Num) of
        {ok, NewRole} ->
            role:send_buff_flush(),
            {reply, {1}, NewRole};
        {false, Reason} ->
            role:send_buff_clean(),
            notice:send(Role, 1, Reason),
            {reply, {0}};
        false ->
            role:send_buff_clean(),
            ok
    end;
handle(12402, {Id, Num}, Role) ->
    case market_gold:sold(Role, Id, Num) of
        Rtn = {ok, _NewRole} -> Rtn;
        false -> ok
    end;
handle(12418, Catalg, Role) ->
    market_gold:push_change_items(Role, Catalg),
    ok;
handle(12404, {Type, ItemId, Num, Percent, CellId},
       Role) ->
    role:send_buff_begin(),
    case market_silver:on_sale(Type,
                               {ItemId, Num, Percent, CellId},
                               Role)
        of
        Rtn = {reply, _Reply, _NRole} ->
            role:send_buff_flush(),
            Rtn;
        Rtn = {ok, _NRole} ->
            role:send_buff_flush(),
            notice:return(lang:get("上架成功")),
            Rtn;
        {false, Msg} ->
            role:send_buff_clean(),
            notice:return(Msg),
            ok;
        _False ->
            role:send_buff_clean(),
            ok
    end;
handle(12405, {Type, RefreshId}, Role) ->
    role:send_buff_begin(),
    case market_silver:buy(Type, RefreshId, Role) of
        Rtn = {ok, #role{}} ->
            role:send_buff_flush(),
            Rtn;
        Rtn = {reply, _Reply, #role{}} ->
            logger:debug("=========:~w", [_Reply], market_rpc, 112),
            role:send_buff_flush(),
            Rtn;
        {reply, Reply, Msg, NRole = #role{}} ->
            role:send_buff_flush(),
            notice:send(NRole, 1, Msg),
            {reply, Reply, NRole};
        {reply, Reply, Msg} ->
            role:send_buff_clean(),
            notice:send(Role, 1, Msg),
            {reply, Reply};
        {false, Msg} ->
            role:send_buff_clean(),
            notice:send(Role, 1, Msg),
            ok;
        _False ->
            role:send_buff_clean(),
            ok
    end;
handle(12406, {CellId}, Role) ->
    role:send_buff_begin(),
    case market_silver:take_off(CellId, Role) of
        Rtn = {ok, #role{}} ->
            role:send_buff_flush(),
            Rtn;
        {false, Int} when is_integer(Int) ->
            role:send_buff_clean(),
            market_silver:push_shop(Role),
            ok;
        {false, Msg} ->
            role:send_buff_clean(),
            notice:send(Role, 1, Msg),
            ok;
        _ ->
            role:send_buff_clean(),
            ok
    end;
handle(12407, {}, Role) ->
    case market_silver:get_silver_shop(Role) of
        {ok, Shop} -> {reply, {Shop}};
        false -> ok
    end;
handle(12408, {BaseId}, _Role) ->
    case market_silver:get_goods_price(BaseId) of
        {ok, Price} -> {reply, {BaseId, Price}};
        false -> ok
    end;
handle(12409, {Type}, Role) ->
    case market_silver:refresh(Type, Role) of
        {ok, NRole, Rtn} -> {reply, Rtn, NRole};
        {ok, Rtn = {_, _}} -> {reply, Rtn};
        _ -> ok
    end;
handle(12410, {Type, Start, End}, Role) ->
    case market_silver:get_pages(Type, Start, End, Role) of
        List when is_list(List) -> {reply, {Type, List}};
        {false, Msg} ->
            notice:return(Msg),
            ok;
        _False -> ok
    end;
handle(12411, {CellId}, Role) ->
    case market_silver:draw(CellId, Role) of
        Rtn = {ok, #role{}} -> Rtn;
        {false, Msg} ->
            notice:return(Msg),
            ok;
        _ -> ok
    end;
handle(12412, {}, Role) ->
    role:send_buff_begin(),
    case market_silver:open_cell(Role) of
        {ok, NRole} ->
            role:send_buff_flush(),
            {ok, NRole};
        {false, Msg} ->
            role:send_buff_clean(),
            notice:return(Msg),
            ok;
        _ ->
            role:send_buff_clean(),
            ok
    end;
handle(12413, {CellId, Percent, Num}, Role) ->
    role:send_buff_begin(),
    case market_silver:on_sale_again(CellId,
                                     Percent,
                                     Num,
                                     Role)
        of
        Rtn = {ok, _NRole} ->
            role:send_buff_flush(),
            Rtn;
        {false, Msg} ->
            role:send_buff_clean(),
            notice:send(Role, 1, Msg),
            ok;
        _ ->
            role:send_buff_clean(),
            ok
    end;
handle(12414, {Type}, Role) ->
    case market_silver:one_click(Type, Role) of
        Rtn = {ok, _NRole} -> Rtn;
        {false, Msg} ->
            notice:return(Msg),
            ok;
        _False -> ok
    end;
handle(12416, {TupleList}, Role) ->
    case market:query_all_price(TupleList, Role) of
        {ok, Acc} -> {reply, {Acc}};
        false -> ok
    end;
handle(12417, {TupleList}, Role) ->
    role:send_buff_begin(),
    case market:purchs_all(TupleList, Role) of
        {ok, NewRole} ->
            role:send_buff_flush(),
            {reply, {1}, NewRole};
        false ->
            role:send_buff_clean(),
            {reply, {0}};
        {false, Reason} ->
            role:send_buff_clean(),
            notice:return(Reason),
            {reply, {0}}
    end;
handle(12420, {}, Role) ->
    market_gold:push_12420(Role),
    ok;
handle(12419, {}, Role) ->
    case market_silver:check_cell_draw_status(Role) of
        true -> {reply, {}};
        false -> ok
    end;
handle(Code, {List, Scene}, Role)
    when Code =:= 12421 orelse Code =:= 12422 ->
    case market:buy(Role, List, Scene) of
        {ok, NewRole} -> {reply, {1, ""}, NewRole};
        {false, Msg} -> {reply, {0, Msg}}
    end;
handle(_Code, _Args, _) ->
    logger:debug("接收到错误的请求:[Code:~w][Args:~w]",
                 [_Code, _Args],
                 market_rpc,
                 300),
    ok.

