-file("src/mod/campaign/camp_box.erl", 1).

-module(camp_box).

-export([init/0,
         open/2,
         push/1,
         push/2,
         push_log/1,
         refresh/2,
         refresh_all/0]).

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

-file("src/mod/campaign/camp_box.erl", 19).

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

-file("src/mod/campaign/camp_box.erl", 20).

-file("inc/campaign.hrl", 1).

-record(campaign_eggs,
        {ver = 0,
         location = 0 :: non_neg_integer(),
         footprints = [],
         last_moved = 0 :: non_neg_integer(),
         rolled = 0 :: non_neg_integer(),
         rewarded = []}).

-record(camp_login,
        {camp_id = 0,
         m_time = 0,
         num = 0,
         days = [],
         buys = []}).

-record(camp_login_data,
        {day = 0, reward = [], buys = [], cost = []}).

-record(camp_login_buy_data,
        {id = 0, reward = [], cost = [], cd = 0}).

-record(campaign_bags,
        {ver = 0,
         collected = [],
         last_filled = 0 :: non_neg_integer(),
         rewarded = 0}).

-record(campaign_card,
        {ver = 0,
         card_ver = 0,
         init = 0,
         times = 0,
         card_list = []}).

-record(campaign_card_open,
        {ver = 0,
         card_ver = 0,
         times = 0,
         init = 0,
         card_list = []}).

-record(camp_wish_flower,
        {ver = 1,
         floor = 1,
         times = 0,
         all_times = 0,
         camp_id = 0}).

-record(camp_new_flop,
        {ver = 1,
         group = 0,
         times = 0,
         rewarded = [],
         camp_id = 0}).

-record(camp_consume_rebate,
        {ver = 1, limit_item = []}).

-record(camp_new_acc_charge,
        {ver = 1, charge_val = 0, get_reward = []}).

-record(camp_charge_seven_gift,
        {ver = 1, id = 0, buy_time = 0, can_reward = []}).

-record(camp_lucky_tree,
        {id = 0,
         times = 0,
         reward_list = [],
         delay_reward = []}).

-record(camp_long_active,
        {ver = 1,
         id = 0,
         lev = 0,
         token_list = [],
         reward_levs = [],
         week_box = 0,
         last_reset_time = 0}).

-record(m_campaign,
        {ver = 27,
         acc = [] :: list(),
         can_reward = [] :: list(),
         rewarded = [] :: list(),
         eggs = #campaign_eggs{},
         bags = #campaign_bags{},
         first_charge_double = [],
         camp_login = #camp_login{},
         hide_seek,
         login_roll,
         recharge = camp_series_recharge:init(),
         camp_card = #campaign_card{},
         wish_times = 0,
         camp_limit = [],
         camp_card_open = #campaign_card_open{},
         recharge_open = camp_series_recharge_open:init(),
         camp_wish_flower = #camp_wish_flower{},
         camp_doll = camp_doll:init(),
         camp_sign,
         camp_exchange,
         camp_animal_chess,
         camp_new_flop = #camp_new_flop{},
         multiplex_assert = 0,
         camp_consume_rebate = camp_consume_rebate:init(),
         camp_black_white_chess =
             camp_black_white_chess_mgr:init(),
         camp_scratch_card = camp_scratch_card:init(),
         camp_new_acc_charge = camp_new_acc_charge:init(),
         camp_charge_seven_gift = camp_charge_seven_gift:init(),
         camp_lucky_tree = camp_lucky_tree:init(),
         camp_long_active = camp_long_active:init(),
         gift_custom = camp_gift_custom:init()}).

-record(campaign_handle,
        {time = 0 :: non_neg_integer(),
         evt = {evt_rpc} :: tuple(),
         call_from = rpc :: evt | rpc,
         add_can_reward = 0 :: non_neg_integer(),
         camp :: undefined | tuple(),
         camp_info :: undefined | tuple(),
         push_list = [] :: [tuple()],
         push_cli = 0 :: 0..1,
         rpc_reward_num = 1 :: non_neg_integer(),
         return_acc = 0}).

-record(camp_collection,
        {camp_end_time = 0,
         reward_list = [],
         extra_data = [],
         random_index,
         red_dot}).

-record(camp_ico,
        {id = 0 :: non_neg_integer(),
         ico_id = 0 :: non_neg_integer(),
         name = "",
         is_show = 0 :: 0..1,
         start_time = 0 :: non_neg_integer() | tuple(),
         end_time = 0 :: non_neg_integer() | tuple(),
         white_list = [] :: list(),
         black_list = [] :: list(),
         min_open_time = 0 :: non_neg_integer() | tuple(),
         max_open_time = 0 :: non_neg_integer() | tuple()}).

-record(camp_cfg,
        {id = 0 :: non_neg_integer(),
         name = "" :: bitstring(),
         group_id = 0 :: non_neg_integer(),
         start_time = 0 :: non_neg_integer() | tuple(),
         end_time = 0 :: non_neg_integer() | tuple(),
         cli_start_time = 0 :: non_neg_integer() | tuple(),
         cli_end_time = 0 :: non_neg_integer() | tuple(),
         type = 0 :: pos_integer(),
         sec_type = 0 :: non_neg_integer(),
         status = 1 :: 0..1,
         reward_type = 2 :: pos_integer(),
         settlement = 2 :: non_neg_integer(),
         reward_title = "" :: bitstring(),
         reward_content = "" :: bitstring(),
         loss_items = [] :: list(),
         auto_buy = 0,
         reward = [] :: list(),
         camp_cond :: undefined | tuple(),
         reward_max = 1 :: non_neg_integer(),
         white_list = [] :: list(),
         black_list = [] :: list(),
         min_open_time = 0 :: non_neg_integer() | tuple(),
         max_open_time = 0 :: non_neg_integer() | tuple(),
         finish_id = 0 :: non_neg_integer(),
         finish_days = 0 :: non_neg_integer(),
         finish_end_days = 0 :: non_neg_integer(),
         cond_reward = [],
         merge_min = 0,
         merge_max = 0,
         is_keep_time = 0}).

-record(camp_cache,
        {id = 0 :: non_neg_integer(),
         sec_type = 0 :: non_neg_integer(),
         is_srv_open = 0 :: 0..1,
         start_time = 0 :: non_neg_integer(),
         end_time = 0 :: non_neg_integer(),
         cli_start_time = 0 :: non_neg_integer(),
         cli_end_time = 0 :: non_neg_integer()}).

-record(camp_unit,
        {id = {0, 0}, base_id = 0, map_id = 0}).

-record(camp_time,
        {id = 0, start_time = 0, end_time = 0}).

-record(camp_item,
        {item = 0,
         start_time = 0,
         end_time = 0,
         open = 0,
         msg = 0}).

-record(camp_assets_data,
        {type = 0, items = [], max = 0, var_type = day}).

-record(camp_gift_custom,
        {ver = 1,
         camp_id = 0,
         gift = [],
         buy = [],
         extra_reward = 0}).

-file("src/mod/campaign/camp_box.erl", 21).

-file("inc/camp_box.hrl", 1).

-record(m_camp_box,
        {camp_id = 0,
         pos_list = [],
         list = [],
         log = [],
         refresh_num = 0,
         auto_refresh_num = 0,
         open_num = 0}).

-record(camp_box_type_data,
        {type = 1,
         name = "",
         is_open = 0,
         day_time = [],
         cast_msg = "",
         cost = [],
         refresh_cost = [],
         gain = [],
         is_repeat = 0,
         auto_num = 0,
         total_num = 0}).

-record(camp_box_group_data,
        {group, type = 1, box_list = []}).

-record(camp_box_item_data,
        {id = 0,
         type = 1,
         group = 0,
         item_id = 0,
         bind = 0,
         num = 0,
         box_weigth = 0,
         weigth = 0,
         must = 0,
         must_no = 0,
         min_box = 0,
         max_box = 0,
         max_num = 0,
         is_cast = 0,
         is_log = 0,
         lev_min = 0,
         lev_max = 0,
         sex = 0,
         classes = 0,
         min_lev_break = 0,
         max_lev_break = 0}).

-file("src/mod/campaign/camp_box.erl", 22).

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

-file("src/mod/campaign/camp_box.erl", 23).

-file("inc/lev_break.hrl", 1).

-record(m_lev_break,
        {ver = 0,
         trial = 0 :: non_neg_integer(),
         done = 0 :: non_neg_integer(),
         times = 0 :: non_neg_integer(),
         attr_point = 0 :: non_neg_integer()}).

-file("src/mod/campaign/camp_box.erl", 24).

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

-file("src/mod/campaign/camp_box.erl", 25).

refresh_all() ->
    role_group:apply(world, {camp_box, refresh, [auto]}).

init() -> #m_camp_box{}.

push(_Role = #role{m_camp_box =
                       _MCampBox = #m_camp_box{camp_id = OldCampId,
                                               pos_list = PosList, list = List,
                                               refresh_num = RefreshNum,
                                               open_num = OpenNum}}) ->
    case get_camp_id() of
        OldCampId ->
            sys_conn:pack_send(17864,
                               {PosList, List, RefreshNum, OpenNum});
        CampId when CampId > 0 -> ok;
        _ -> sys_conn:pack_send(17864, {[], [], 0, 0})
    end.

push(Role = #role{m_camp_box =
                      _MCampBox = #m_camp_box{camp_id = OldCampId}},
     client) ->
    case get_camp_id() of
        OldCampId -> push(Role);
        CampId when CampId > 0 ->
            role:apply(async,
                       self(),
                       {camp_box, refresh, [first_auto]}),
            ok;
        _ -> push(Role)
    end.

push_log(_Role) ->
    case get_camp_id() of
        CampId when CampId > 0 ->
            List = get_log(CampId),
            sys_conn:pack_send(17865, {List}),
            ok;
        _ -> sys_conn:pack_send(17865, {[]})
    end.

refresh(Role = #role{m_camp_box =
                         MCampBox = #m_camp_box{pos_list = PosList}},
        Label = role) ->
    Now = date:unixtime(),
    case check(Role,
               [{camp_time, Now}, {camp_day_time, Now}])
        of
        {ok, NRole} ->
            case camp_box_data:get_type(1) of
                #camp_box_type_data{refresh_cost = RefreshCost} ->
                    Loss = case length(PosList) >= 3 of
                               true -> [];
                               _ -> format:val_to_loss(RefreshCost)
                           end,
                    case role_gain:do_notice(Loss, NRole) of
                        {ok, NRole1} ->
                            CampId = get_camp_id(),
                            NewMCampBox = MCampBox#m_camp_box{camp_id = CampId,
                                                              pos_list = [],
                                                              list = []},
                            TNRole1 = NRole1#role{m_camp_box = NewMCampBox},
                            case do_refresh(TNRole1, Label) of
                                {ok, NRole2} ->
                                    push(NRole2),
                                    {ok, NRole2};
                                {false, Reason} -> {false, Reason}
                            end;
                        {false, #loss{msg = Msg}} -> {false, Msg}
                    end;
                _ -> {false, lang:get("没有配置")}
            end;
        {false, Reason} -> {false, Reason}
    end;
refresh(Role = #role{m_camp_box = MCampBox},
        Label = first_auto) ->
    case check(Role,
               [{camp_time, date:unixtime()}, camp_id])
        of
        {ok, NRole} ->
            CampId = get_camp_id(),
            NewMCampBox = MCampBox#m_camp_box{camp_id = CampId,
                                              pos_list = [], list = [],
                                              refresh_num = 0,
                                              auto_refresh_num = 0,
                                              open_num = 0},
            NRole1 = NRole#role{m_camp_box = NewMCampBox},
            case do_refresh(NRole1, Label) of
                {ok, NRole2} ->
                    push(NRole2),
                    {ok, NRole2};
                {false, _Err} -> ok
            end;
        {false, _Err} -> ok
    end;
refresh(Role = #role{m_camp_box = MCampBox},
        Label = auto) ->
    case check(Role, [{camp_time, date:unixtime()}]) of
        {ok, NRole} ->
            CampId = get_camp_id(),
            NewMCampBox = MCampBox#m_camp_box{camp_id = CampId,
                                              pos_list = [], list = []},
            NRole1 = NRole#role{m_camp_box = NewMCampBox},
            case do_refresh(NRole1, Label) of
                {ok, NRole2} -> {ok, NRole2};
                {false, _Err} -> ok
            end;
        {false, _Err} -> ok
    end.

do_refresh(Role = #role{name = _Name,
                        m_camp_box =
                            MCampBox = #m_camp_box{auto_refresh_num =
                                                       AutoRefreshNum,
                                                   refresh_num = RefreshNum,
                                                   log = LogList}},
           Label) ->
    case camp_box_data:get_type(1) of
        Cfg = #camp_box_type_data{total_num = TotalNum} ->
            Ids = camp_box_data:ids(),
            Groups = camp_box_data:groups(1),
            Items = get_items(Role, Ids, #{}, []),
            BoxList = rand_box(Groups, TotalNum, 0, []),
            logger:debug("抽取格子:~ts：~w",
                         [_Name, BoxList],
                         camp_box,
                         163),
            List = rand_item(Role,
                             BoxList,
                             Items,
                             #{cfg => Cfg},
                             []),
            NewAutoRefreshNum = case Label of
                                    role -> AutoRefreshNum;
                                    _ -> AutoRefreshNum + 1
                                end,
            NewRefreshNum = case Label of
                                role -> RefreshNum + 1;
                                _ -> RefreshNum
                            end,
            NewLogList = update_log(List,
                                    LogList,
                                    NewAutoRefreshNum + NewRefreshNum),
            NewMCampBox = MCampBox#m_camp_box{list = List,
                                              auto_refresh_num =
                                                  NewAutoRefreshNum,
                                              refresh_num = NewRefreshNum,
                                              log = NewLogList},
            {ok, Role#role{m_camp_box = NewMCampBox}};
        _ -> {false, lang:get("没有找到配置")}
    end.

update_log([], LogList, _) -> LogList;
update_log([Id | T], LogList, RefreshNum) ->
    NewLogList = case lists:keyfind(Id, 1, LogList) of
                     {_, OldNum, _} ->
                         lists:keystore(Id,
                                        1,
                                        LogList,
                                        {Id, OldNum, RefreshNum});
                     _ -> lists:keystore(Id, 1, LogList, {Id, 0, RefreshNum})
                 end,
    update_log(T, NewLogList, RefreshNum).

open(Role = #role{m_camp_box =
                      MCampBox = #m_camp_box{camp_id = OldCampId,
                                             pos_list = PosList,
                                             open_num = OpenNum,
                                             log = LogList}},
     Pos) ->
    case get_camp_id() of
        OldCampId ->
            PosLen = length(PosList),
            case camp_box_data:get_type(1) of
                #camp_box_type_data{is_open = 0} ->
                    {false, lang:get("配置未开启")};
                #camp_box_type_data{auto_num = AutoNum}
                    when PosLen >= AutoNum ->
                    {false, lang:get("上次没有自动刷新?")};
                #camp_box_type_data{total_num = TotalNum}
                    when Pos > TotalNum ->
                    {false, lang:get("没有这样的格子")};
                Cfg = #camp_box_type_data{auto_num = AutoNum,
                                          name = Title, cost = _Cost,
                                          total_num = TotalNum} ->
                    OpenPoses = case Pos of
                                    0 ->
                                        UsePos = [IPos || {IPos, _} <- PosList],
                                        AllPos = lists:seq(1, TotalNum),
                                        lists:sublist(AllPos -- UsePos,
                                                      AutoNum);
                                    _ -> [Pos]
                                end,
                    Now = date:unixtime(),
                    case check(Role,
                               [{camp_time, Now}, {camp_day_time, Now}])
                        of
                        {ok, NRole} ->
                            CostList = [I
                                        || I
                                               <- lists:seq(PosLen + 1,
                                                            PosLen +
                                                                length(OpenPoses))],
                            CostItems = lists:append([camp_box_data:get_cost({1,
                                                                              TPos})
                                                      || TPos <- CostList]),
                            ItemNum = get_item_num(CostItems, 0),
                            Loss = format:val_to_loss(CostItems),
                            case role_gain:do(Loss, NRole) of
                                {ok, NRole1} ->
                                    case do_open(NRole1,
                                                 OpenPoses,
                                                 #{cfg => Cfg},
                                                 [],
                                                 [],
                                                 LogList)
                                        of
                                        {ok, AddPosList, Items, NewLogList} ->
                                            AddItems = [{ItemId, Bind, Num}
                                                        || #camp_box_item_data{item_id
                                                                                   =
                                                                                   ItemId,
                                                                               bind
                                                                                   =
                                                                                   Bind,
                                                                               num
                                                                                   =
                                                                                   Num}
                                                               <- Items],
                                            AddItems1 = [{90042, ItemNum * 5}],
                                            Gain = format:val_to_gain(AddItems),
                                            Gain1 =
                                                format:val_to_gain(AddItems1),
                                            {ok, GainRole} = role_gain:do(Gain1,
                                                                          NRole1),
                                            case role_gain:do_notice(Gain,
                                                                     GainRole)
                                                of
                                                {ok, NRole2} ->
                                                    NewMCampBox =
                                                        MCampBox#m_camp_box{pos_list
                                                                                =
                                                                                PosList
                                                                                    ++
                                                                                    AddPosList,
                                                                            log
                                                                                =
                                                                                NewLogList,
                                                                            open_num
                                                                                =
                                                                                OpenNum
                                                                                    +
                                                                                    length(AddItems)},
                                                    item_cast(Role,
                                                              Cfg,
                                                              Items,
                                                              []),
                                                    item_log(Role,
                                                             OldCampId,
                                                             Items),
                                                    push_log(Role),
                                                    notice:send(Role,
                                                                1,
                                                                notice:format(lang:get("消耗~ts，获得~ts"),
                                                                              [{item_2,
                                                                                23250,
                                                                                ItemNum},
                                                                               {assets_1,
                                                                                90042,
                                                                                ItemNum
                                                                                    *
                                                                                    5}])),
                                                    NewRole =
                                                        NRole2#role{m_camp_box =
                                                                        NewMCampBox},
                                                    push(NewRole),
                                                    case length(PosList ++
                                                                    AddPosList)
                                                             >= AutoNum
                                                        of
                                                        true ->
                                                            role:apply(async,
                                                                       self(),
                                                                       {camp_box,
                                                                        refresh,
                                                                        [auto]});
                                                        _ -> false
                                                    end,
                                                    {ok, AddPosList, NewRole};
                                                _ ->
                                                    item_cast(Role,
                                                              Cfg,
                                                              Items,
                                                              []),
                                                    item_log(Role,
                                                             OldCampId,
                                                             Items),
                                                    push_log(Role),
                                                    notice:send(Role,
                                                                1,
                                                                notice:format(lang:get("消耗~ts，获得~ts"),
                                                                              [{item_2,
                                                                                23250,
                                                                                ItemNum},
                                                                               {assets_1,
                                                                                90042,
                                                                                ItemNum
                                                                                    *
                                                                                    5}])),
                                                    mail:send(Role,
                                                              Title,
                                                              lang:get("背包空间不足，您的奖励已通过邮件发放"),
                                                              AddItems),
                                                    notice:send(Role,
                                                                3,
                                                                lang:get("背包已满，奖励已通过邮件发放")),
                                                    NewMCampBox =
                                                        MCampBox#m_camp_box{pos_list
                                                                                =
                                                                                PosList
                                                                                    ++
                                                                                    AddPosList,
                                                                            open_num
                                                                                =
                                                                                OpenNum
                                                                                    +
                                                                                    length(AddItems)},
                                                    NewRole =
                                                        GainRole#role{m_camp_box
                                                                          =
                                                                          NewMCampBox},
                                                    push(NewRole),
                                                    case length(PosList ++
                                                                    AddPosList)
                                                             >= AutoNum
                                                        of
                                                        true ->
                                                            role:apply(async,
                                                                       self(),
                                                                       {camp_box,
                                                                        refresh,
                                                                        [auto]});
                                                        _ -> false
                                                    end,
                                                    {ok, AddPosList, NewRole}
                                            end;
                                        {false, Reason} -> {false, Reason}
                                    end;
                                {false, #loss{msg = Msg}} -> {false, Msg}
                            end;
                        {false, Reason} -> {false, Reason}
                    end;
                _ -> {false, lang:get("配置找不到")}
            end;
        CampId when CampId > 0 ->
            role:apply(async, self(), {camp_box, refresh, [auto]}),
            {false, lang:get("活动是旧的，重新刷新了")};
        _ -> {false, lang:get("活动未开启")}
    end.

do_open(_Role, [], _Args, AddPosList, List, LogList) ->
    {ok, AddPosList, List, LogList};
do_open(Role = #role{m_camp_box =
                         #m_camp_box{pos_list = PosList, list = RList,
                                     auto_refresh_num = AutoRefreshNum,
                                     refresh_num = RefreshNum}},
        [Pos | T], Args, AddPosList, List, LogList) ->
    PosNum = length(PosList ++ AddPosList) + 1,
    UseIds = [IId || {_, IId} <- PosList ++ AddPosList],
    List2 = RList -- UseIds,
    Items1 = [camp_box_data:get_item(IId) || IId <- List2],
    Items2 = [I
              || I = #camp_box_item_data{min_box = MinBox,
                                         max_box = MaxBox}
                     <- Items1,
                 MinBox == 0 andalso MaxBox == 0 orelse
                     PosNum >= MinBox andalso PosNum =< MaxBox],
    case lists:keyfind(Pos, 1, PosList) of
        false ->
            case util:rand_list(Items2,
                                #camp_box_item_data.box_weigth)
                of
                Item = #camp_box_item_data{id = CId} ->
                    NewLogList = case lists:keyfind(CId, 1, LogList) of
                                     {_, OldNum, OldRefresh} ->
                                         lists:keystore(CId,
                                                        1,
                                                        LogList,
                                                        {CId,
                                                         OldNum + 1,
                                                         OldRefresh});
                                     _ ->
                                         lists:keystore(CId,
                                                        1,
                                                        LogList,
                                                        {CId,
                                                         1,
                                                         AutoRefreshNum +
                                                             RefreshNum})
                                 end,
                    do_open(Role,
                            T,
                            Args,
                            [{Pos, CId} | AddPosList],
                            [Item | List],
                            NewLogList);
                _Err -> {false, lang:get("该位置开不了道具")}
            end;
        _ -> {false, lang:get("该位置已经开启了")}
    end.

rand_box([], _TotalNum, _, List) -> List;
rand_box([Group], TotalNum, Num, List) ->
    BoxNum2 = TotalNum - Num,
    rand_box([],
             TotalNum,
             Num + BoxNum2,
             [{Group, BoxNum2} | List]);
rand_box([Group | T], TotalNum, Num, List) ->
    case camp_box_data:get_group(Group) of
        #camp_box_group_data{box_list = BoxList} ->
            {BoxNum, _} = util:rand_list(BoxList, 2),
            case Num + BoxNum =< TotalNum of
                true ->
                    rand_box(T,
                             TotalNum,
                             Num + BoxNum,
                             [{Group, BoxNum} | List]);
                false ->
                    BoxNum2 = TotalNum - Num,
                    rand_box(T,
                             TotalNum,
                             Num + BoxNum2,
                             [{Group, BoxNum2} | List])
            end;
        _ -> rand_box(T, TotalNum, Num, List)
    end.

rand_item(_Role, [], _, _, List) -> List;
rand_item(Role = #role{name = _Name},
          [{Group, Num} | T], Items,
          Args = #{cfg :=
                       #camp_box_type_data{is_repeat = IsRepeat}},
          List) ->
    {Num2, MustIds} = must_item(Role,
                                Group,
                                Num,
                                Items,
                                []),
    Items2 = case IsRepeat of
                 1 ->
                     [I
                      || I = #camp_box_item_data{id = IId, group = IGroup}
                             <- Items,
                         not lists:member(IId, MustIds) andalso
                             IGroup == Group];
                 _ ->
                     [I
                      || I = #camp_box_item_data{group = IGroup} <- Items,
                         IGroup == Group]
             end,
    RandIds = rand_item2(Role,
                         Group,
                         Num2,
                         Items2,
                         Args,
                         []),
    logger:debug("抽取分组格子 ~ts：~w",
                 [_Name, {Group, MustIds, RandIds}],
                 camp_box,
                 337),
    rand_item(Role,
              T,
              Items,
              Args,
              List ++ RandIds ++ MustIds).

must_item(_Role, _Group, 0, _, List) -> {0, List};
must_item(_Role, _Group, GroupNum, [], List) ->
    {GroupNum, List};
must_item(Role, Group, GroupNum,
          [#camp_box_item_data{must = 0} | T], List) ->
    must_item(Role, Group, GroupNum, T, List);
must_item(Role = #role{m_camp_box =
                           #m_camp_box{auto_refresh_num = AutoRefreshNum,
                                       refresh_num = RefreshNum,
                                       log = LogList}},
          Group, GroupNum,
          [#camp_box_item_data{group = Group, id = Id,
                               must = Must}
           | T],
          List) ->
    Num = case lists:keyfind(Id, 1, LogList) of
              {_, _, TNum} -> TNum;
              _ -> 0
          end,
    case AutoRefreshNum + RefreshNum - Num >= Must of
        true ->
            must_item(Role, Group, GroupNum - 1, T, [Id | List]);
        _ -> must_item(Role, Group, GroupNum, T, List)
    end;
must_item(Role, Group, GroupNum, [_ | T], List) ->
    must_item(Role, Group, GroupNum, T, List).

rand_item2(_Role, _Group, 0, _, _Args, List) -> List;
rand_item2(_Role = #role{id = RoleId, name = Name},
           Group, Num, [], _Args, List) ->
    logger:error("配置道具不足：~w, ~ts, ~w, 还差：~w",
                 [RoleId, Name, Group, Num],
                 camp_box,
                 361),
    List;
rand_item2(Role, Group, Num, Items,
           Args = #{cfg :=
                        #camp_box_type_data{is_repeat = IsRepeat}},
           List) ->
    I = #camp_box_item_data{id = Id} = util:rand_list(Items,
                                                      #camp_box_item_data.weigth),
    Items2 = case IsRepeat of
                 1 -> Items -- [I];
                 _ -> Items
             end,
    rand_item2(Role,
               Group,
               Num - 1,
               Items2,
               Args,
               [Id | List]).

get_items(_Role, [], _, Items) -> Items;
get_items(Role = #role{lev = Lev, classes = Classes,
                       sex = Sex, m_lev_break = #m_lev_break{times = LevBreak},
                       m_camp_box =
                           #m_camp_box{open_num = _Acc,
                                       auto_refresh_num = AutoRefreshNum,
                                       refresh_num = RefreshNum,
                                       log = LogList}},
          [Id | T], Args, List) ->
    Num = case lists:keyfind(Id, 1, LogList) of
              {_, TNum, _} -> TNum;
              _ -> 0
          end,
    ItemOpenNum = case lists:keyfind(Id, 1, LogList) of
                      {_, _, TNum1} -> TNum1;
                      _ -> 0
                  end,
    case camp_box_data:get_item(Id) of
        I = #camp_box_item_data{lev_min = LevMin,
                                lev_max = LevMax, must_no = MustNo,
                                max_num = MaxNum, classes = CClasses,
                                sex = CSex, min_lev_break = MinLevBreak,
                                max_lev_break = MaxLevBreak}
            when Lev >= LevMin andalso
                     Lev =< LevMax andalso
                         (MustNo == 0 orelse
                              AutoRefreshNum + RefreshNum - ItemOpenNum >
                                  MustNo)
                             andalso
                             (MaxNum == 0 orelse MaxNum > Num) andalso
                                 (CClasses == 0 orelse CClasses == Classes)
                                     andalso
                                     (CSex == 2 orelse CSex == Sex) andalso
                                         (MinLevBreak == 0 andalso
                                              MaxLevBreak == 0
                                              orelse
                                              LevBreak >= MinLevBreak andalso
                                                  LevBreak =< MaxLevBreak) ->
            get_items(Role, T, Args, [I | List]);
        _ -> get_items(Role, T, Args, List)
    end.

check(Role, []) -> {ok, Role};
check(Role, [Label | T]) ->
    case check(Role, Label) of
        {ok, NewRole} -> check(NewRole, T);
        {false, Reason} -> {false, Reason}
    end;
check(Role = #role{m_camp_box =
                       #m_camp_box{camp_id = OldCampId}},
      camp_id) ->
    case get_camp_id() of
        OldCampId -> {false, lang:get("活动id相同")};
        CampId when CampId > 0 -> {ok, Role};
        _ -> {false, lang:get("活动id不对")}
    end;
check(Role, {camp_time, Now}) ->
    {StartTime, EndTime} = case
                               campaign_mgr:get_camp_time(60031)
                               of
                               {-1, -1} ->
                                   {date:datetime_to_seconds({{2017, 3, 20},
                                                              {0, 0, 0}}),
                                    date:datetime_to_seconds({{2017, 4, 20},
                                                              {0, 0, 0}})};
                               {S, E} -> {S, E};
                               _ ->
                                   {date:datetime_to_seconds({{2017, 3, 20},
                                                              {0, 0, 0}}),
                                    date:datetime_to_seconds({{2017, 4, 20},
                                                              {0, 0, 0}})}
                           end,
    case Now >= StartTime andalso Now < EndTime of
        true -> {ok, Role};
        _ -> {false, lang:get("活动未开启")}
    end;
check(Role, {camp_day_time, Now}) ->
    case camp_box_data:get_type(1) of
        #camp_box_type_data{is_open = 0} ->
            {false, lang:get("配置没有开启")};
        #camp_box_type_data{day_time = DayTime} ->
            Zero = date:unixtime(zero),
            DayTime2 = [{Zero + SH * 3600 + SM * 60 + SS,
                         Zero + EH * 3600 + EM * 60 + ES}
                        || {SH, SM, SS, EH, EM, ES} <- DayTime],
            case [1
                  || {S, E} <- DayTime2, Now >= S andalso Now =< E]
                of
                [_ | _] -> {ok, Role};
                _ -> {false, lang:get("晚上19:00-23:00开放哟{face_1, 3}")}
            end;
        _ -> {false, lang:get("该转盘没有配置")}
    end;
check(_Role, _Err) ->
    logger:error("位置条件：~w", [_Err], camp_box, 449),
    {false, lang:get("未知条件")}.

item_log(_Role, _, []) -> ok;
item_log(Role = #role{id = RoleId, name = Name}, CampId,
         [#camp_box_item_data{is_log = 1, item_id = ItemId,
                              bind = Bind, num = Num}
          | T]) ->
    set_log(CampId, RoleId, Name, ItemId, Bind, Num),
    item_log(Role, CampId, T);
item_log(Role, CampId, [_ | T]) ->
    item_log(Role, CampId, T).

set_log(CampId, RoleId, Name, ItemId, Bind, Num) ->
    List = get_log(CampId),
    NewList = [{RoleId, Name, ItemId, Bind, Num} | List],
    NewList2 = lists:sublist(NewList, 10),
    env:save({camp_box, CampId}, NewList2).

get_log(CampId) ->
    case env:get({camp_box, CampId}) of
        List when is_list(List) -> List;
        _ -> []
    end.

item_cast(_Role, _, [], []) -> ok;
item_cast(#role{name = Name},
          #camp_box_type_data{cast_msg = CastMsg}, [], List) ->
    NewCastMsg = notice:replace_msg([{"#role#",
                                      [{role_2, Name}]},
                                     {"#item#", [{item_2, List}]}],
                                    CastMsg),
    notice:cast(all, 5, NewCastMsg);
item_cast(Role, Cfg,
          [#camp_box_item_data{item_id = ItemId, bind = Bind,
                               num = Num, is_cast = 1}
           | T],
          List) ->
    item_cast(Role, Cfg, T, [{ItemId, Bind, Num} | List]);
item_cast(Role, Cfg, [_ | T], List) ->
    item_cast(Role, Cfg, T, List).

get_camp_id() ->
    case campaign_mgr:get_camp_info(60031) of
        #camp_cache{id = Id} -> Id;
        _ -> 0
    end.

get_item_num([], Num) -> Num;
get_item_num([{23250, CostNum} | T], Num) ->
    get_item_num(T, Num + CostNum);
get_item_num([{23250, _Bind, CostNum} | T], Num) ->
    get_item_num(T, Num + CostNum);
get_item_num([_ | T], Num) -> get_item_num(T, Num).

