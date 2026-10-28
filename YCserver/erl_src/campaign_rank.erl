-file("src/mod/campaign/campaign_rank.erl", 1).

-module(campaign_rank).

-behaviour(gen_fsm).

-export([start_link/1,
         idel/2,
         active/2,
         cast/2,
         lookup/1,
         check_open_time/1,
         m/1,
         filter_item/2]).

-compile(export_all).

-export([init/1,
         handle_event/3,
         handle_sync_event/4,
         handle_info/3,
         terminate/3,
         code_change/4]).

-record(state,
        {id = 0, sec_type = 0, zone, ts, timeout}).

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

-file("src/mod/campaign/campaign_rank.erl", 32).

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

-file("src/mod/campaign/campaign_rank.erl", 33).

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

-file("src/mod/campaign/campaign_rank.erl", 34).

-file("inc/campaign_rank.hrl", 1).

-record(campaign_rank,
        {sec_type = 1,
         show_list = [],
         list = [],
         last_val = 0,
         len = 0}).

-record(campaign_rank_role,
        {key,
         id = {0, "", 0} :: term(),
         id2 = {0, "", 0} :: term(),
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
         role_id2 = 0 :: non_neg_integer(),
         platform2 = "" :: list(),
         zone_id2 = 0 :: non_neg_integer(),
         name2 = "" :: list(),
         sex2 = 0 :: 0..2,
         classes2 = 0 :: 0..4,
         lev2 = 0 :: non_neg_integer(),
         val1 = 0 :: non_neg_integer(),
         val2 = 0 :: non_neg_integer(),
         val3 = 0 :: non_neg_integer(),
         val4 = 0 :: non_neg_integer(),
         desc = ""}).

-record(campaign_rank_zone,
        {id = 0, sec_type = 0, zone, pid}).

-record(campaign_rank_data,
        {id = 0,
         sec_type = 0,
         num = 0,
         keys = [],
         min_val = 1,
         zone,
         title = "",
         content = "",
         desc = "",
         cast = "",
         cast_rank = 1,
         merge_flag = 0}).

-record(camp_rank_reward_data,
        {min_rank = 0,
         max_rank = 0,
         sec_type = 0,
         item_list = [],
         title = "",
         content = "",
         limit = 0}).

-record(camp_rank_self_reward_data,
        {sec_type = 0, item_list = [], num = 0}).

-file("src/mod/campaign/campaign_rank.erl", 35).

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

-file("src/mod/campaign/campaign_rank.erl", 36).

-file("inc/maze.hrl", 1).

-record(m_maze,
        {ver = 4,
         status = 0,
         dungeon = 0,
         double = 0,
         emptys = [],
         opens = [],
         datas = [],
         times = 0,
         piece = [],
         time = 0,
         others = [],
         pass = [],
         piece_other = [],
         events = []}).

-record(maze_open,
        {pos = {0, 0},
         ver = 1,
         x = 0,
         y = 0,
         unique = 0,
         type = 0,
         id = 0,
         hard = 0,
         times = 0,
         flag = 0,
         special_id = 0,
         reward = [],
         show = 0}).

-record(maze_event,
        {e_pos = {0, 0},
         e_x = 0,
         e_y = 0,
         e_id = 0,
         e_type = 0,
         e_unique = 0,
         e_reward = [],
         e_flag = 0,
         e_list = []}).

-file("src/mod/campaign/campaign_rank.erl", 37).

-file("/usr/local/lib/erlang/lib/stdlib-2.1/include/"
      "ms_transform.hrl",
      1).

-file("src/mod/campaign/campaign_rank.erl", 38).

start_link(I = #campaign_rank_data{zone = Zone}) ->
    gen_fsm:start_link({local, Zone},
                       campaign_rank,
                       [I],
                       []).

cast(Pid, Info) ->
    gen_fsm:send_all_state_event(Pid, Info).

m(Pid) ->
    logger:info("下阶段", [], campaign_rank, 49),
    gen_fsm:send_event(Pid, timeout).

init([#campaign_rank_data{id = Id, zone = Zone,
                          sec_type = SecType}]) ->
    logger:info("[~w] 正在启动...", [Zone], campaign_rank, 57),
    process_flag(trap_exit, true),
    {StateName, TimeLeft} = get_idle_time(SecType),
    notice_act_end(StateName, TimeLeft),
    logger:info("下一个状态~w",
                [{StateName, TimeLeft, Zone}],
                campaign_rank,
                61),
    State = #state{id = Id, zone = Zone, sec_type = SecType,
                   ts = date:now2(), timeout = TimeLeft},
    logger:info("[~w] 启动完成", [Zone], campaign_rank, 63),
    {ok, StateName, State, TimeLeft}.

handle_event({update_role,
              R = #campaign_rank_role{key = Key, id = Id,
                                      id2 = TargetId, val1 = Val1,
                                      classes2 = Classes2, sex2 = Sex2,
                                      lev2 = Lev2, name2 = Name2,
                                      classes = Classes, sex = Sex, lev = Lev,
                                      name = Name}},
             StateName = active,
             State = #state{sec_type = SecType = 60019}) ->
    NR = case ets:lookup(campaign_rank_role, Key) of
             [#campaign_rank_role{val1 = OldVal1}] ->
                 ets:insert(campaign_rank_role,
                            R#campaign_rank_role{val1 = OldVal1 + Val1,
                                                 classes2 = Classes2,
                                                 sex2 = Sex2, lev2 = Lev2,
                                                 name2 = Name2,
                                                 classes = Classes, sex = Sex,
                                                 lev = Lev, name = Name}),
                 dets:insert(campaign_rank_role,
                             R#campaign_rank_role{val1 = OldVal1 + Val1,
                                                  classes2 = Classes2,
                                                  sex2 = Sex2, lev2 = Lev2,
                                                  name2 = Name2,
                                                  classes = Classes, sex = Sex,
                                                  lev = Lev, name = Name}),
                 R#campaign_rank_role{val1 = OldVal1 + Val1,
                                      classes2 = Classes2, sex2 = Sex2,
                                      lev2 = Lev2, name2 = Name2,
                                      classes = Classes, sex = Sex, lev = Lev,
                                      name = Name};
             _ ->
                 ets:insert(campaign_rank_role, R),
                 dets:insert(campaign_rank_role, R),
                 R
         end,
    role:pack_send(Id, 17859, {SecType, [NR]}),
    role:pack_send(TargetId, 17859, {SecType, [NR]}),
    in_rank(NR, State),
    continue(StateName, State);
handle_event({update_role,
              R = #campaign_rank_role{id = Id}},
             StateName = active,
             State = #state{sec_type = SecType = 60020}) ->
    ets:insert(campaign_rank_role, R),
    dets:insert(campaign_rank_role, R),
    role:pack_send(Id, 17859, {SecType, [R]}),
    in_rank(R, State),
    continue(StateName, State);
handle_event({update_role,
              R = #campaign_rank_role{id = Id}},
             StateName = active,
             State = #state{sec_type = SecType = 60021}) ->
    ets:insert(campaign_rank_role, R),
    dets:insert(campaign_rank_role, R),
    role:pack_send(Id, 17859, {SecType, [R]}),
    in_rank(R, State),
    continue(StateName, State);
handle_event({update_role,
              R = #campaign_rank_role{id = Id}},
             StateName = active,
             State = #state{sec_type = SecType = 60030}) ->
    ets:insert(campaign_rank_role, R),
    dets:insert(campaign_rank_role, R),
    role:pack_send(Id, 17859, {SecType, [R]}),
    in_rank(R, State),
    continue(StateName, State);
handle_event({update_role,
              R = #campaign_rank_role{id = Id, val1 = Val1,
                                      classes = Classes, sex = Sex, lev = Lev,
                                      name = Name}},
             StateName = active,
             State = #state{sec_type = SecType = 60022}) ->
    Key = {Id, SecType},
    NR = case ets:lookup(campaign_rank_role, Key) of
             [RankRole = #campaign_rank_role{val1 = OldVal1}] ->
                 NewRankRole = RankRole#campaign_rank_role{val1 =
                                                               OldVal1 + Val1,
                                                           classes = Classes,
                                                           sex = Sex, lev = Lev,
                                                           name = Name},
                 ets:insert(campaign_rank_role, NewRankRole),
                 dets:insert(campaign_rank_role, NewRankRole),
                 NewRankRole;
             _ ->
                 ets:insert(campaign_rank_role, R),
                 dets:insert(campaign_rank_role, R),
                 R
         end,
    role:pack_send(Id, 17859, {SecType, [NR]}),
    in_rank(NR, State),
    continue(StateName, State);
handle_event({update_role,
              R = #campaign_rank_role{id = Id}},
             StateName = active,
             State = #state{sec_type = SecType = 60023}) ->
    ets:insert(campaign_rank_role, R),
    dets:insert(campaign_rank_role, R),
    role:pack_send(Id, 17859, {SecType, [R]}),
    in_rank(R, State),
    continue(StateName, State);
handle_event({update_role,
              R = #campaign_rank_role{id = Id, val1 = Val1,
                                      classes = Classes, sex = Sex, lev = Lev,
                                      name = Name}},
             StateName = active,
             State = #state{sec_type = SecType = 60024}) ->
    Key = {Id, SecType},
    NR = case ets:lookup(campaign_rank_role, Key) of
             [RankRole = #campaign_rank_role{val1 = OldVal1}]
                 when Val1 > OldVal1 ->
                 NewRankRole = RankRole#campaign_rank_role{val1 = Val1,
                                                           classes = Classes,
                                                           sex = Sex, lev = Lev,
                                                           name = Name},
                 ets:insert(campaign_rank_role, NewRankRole),
                 dets:insert(campaign_rank_role, NewRankRole),
                 NewRankRole;
             [RankRole = #campaign_rank_role{}] -> RankRole;
             _ ->
                 ets:insert(campaign_rank_role, R),
                 dets:insert(campaign_rank_role, R),
                 R
         end,
    role:pack_send(Id, 17859, {SecType, [NR]}),
    in_rank(NR, State),
    continue(StateName, State);
handle_event({update_role,
              R = #campaign_rank_role{id = Id, val1 = Val1,
                                      val2 = Val2, classes = Classes, sex = Sex,
                                      lev = Lev, name = Name}},
             StateName = active,
             State = #state{sec_type = SecType = 60025}) ->
    Key = {Id, SecType},
    NR = case ets:lookup(campaign_rank_role, Key) of
             [RankRole = #campaign_rank_role{val1 = OldVal}]
                 when OldVal < Val1 ->
                 NewRankRole = RankRole#campaign_rank_role{val1 = Val1,
                                                           val2 = Val2,
                                                           classes = Classes,
                                                           sex = Sex, lev = Lev,
                                                           name = Name},
                 ets:insert(campaign_rank_role, NewRankRole),
                 dets:insert(campaign_rank_role, NewRankRole),
                 NewRankRole;
             [RankRole = #campaign_rank_role{}] -> RankRole;
             _ ->
                 ets:insert(campaign_rank_role, R),
                 dets:insert(campaign_rank_role, R),
                 R
         end,
    role:pack_send(Id, 17859, {SecType, [NR]}),
    in_rank(NR, State),
    continue(StateName, State);
handle_event({update_role,
              R = #campaign_rank_role{id = Id}},
             StateName = active,
             State = #state{sec_type = SecType = 60026}) ->
    ets:insert(campaign_rank_role, R),
    dets:insert(campaign_rank_role, R),
    role:pack_send(Id, 17859, {SecType, [R]}),
    in_rank(R, State),
    continue(StateName, State);
handle_event({update_role,
              R = #campaign_rank_role{id = Id}},
             StateName = active,
             State = #state{sec_type = SecType = 60027}) ->
    ets:insert(campaign_rank_role, R),
    dets:insert(campaign_rank_role, R),
    role:pack_send(Id, 17859, {SecType, [R]}),
    in_rank(R, State),
    continue(StateName, State);
handle_event({update_role,
              R = #campaign_rank_role{id = Id}},
             StateName = active,
             State = #state{sec_type = SecType = 60028}) ->
    ets:insert(campaign_rank_role, R),
    dets:insert(campaign_rank_role, R),
    role:pack_send(Id, 17859, {SecType, [R]}),
    in_rank(R, State),
    continue(StateName, State);
handle_event({update_role,
              R = #campaign_rank_role{id = Id}},
             StateName = active,
             State = #state{sec_type = SecType = 60029}) ->
    ets:insert(campaign_rank_role, R),
    dets:insert(campaign_rank_role, R),
    role:pack_send(Id, 17859, {SecType, [R]}),
    in_rank(R, State),
    continue(StateName, State);
handle_event({update_role,
              R = #campaign_rank_role{id = Id, val1 = Val1,
                                      classes = Classes, sex = Sex, lev = Lev,
                                      name = Name}},
             StateName = active,
             State = #state{sec_type = SecType = 60052}) ->
    Key = {Id, SecType},
    NR = case ets:lookup(campaign_rank_role, Key) of
             [RankRole = #campaign_rank_role{val1 = OldVal1}] ->
                 NewRankRole = RankRole#campaign_rank_role{val1 =
                                                               OldVal1 + Val1,
                                                           classes = Classes,
                                                           sex = Sex, lev = Lev,
                                                           name = Name},
                 ets:insert(campaign_rank_role, NewRankRole),
                 dets:insert(campaign_rank_role, NewRankRole),
                 NewRankRole;
             _ ->
                 ets:insert(campaign_rank_role, R),
                 dets:insert(campaign_rank_role, R),
                 R
         end,
    role:pack_send(Id, 17859, {SecType, [NR]}),
    in_rank(NR, State),
    continue(StateName, State);
handle_event({update_role,
              R = #campaign_rank_role{id = Id, val1 = Val1,
                                      val2 = Val2, val3 = Val3, val4 = Val4}},
             StateName = active,
             State = #state{sec_type = SecType = 60032}) ->
    Key = {Id, SecType},
    NR = case ets:lookup(campaign_rank_role, Key) of
             [#campaign_rank_role{val1 = OldVal1}] ->
                 ets:insert(campaign_rank_role,
                            R#campaign_rank_role{val1 = OldVal1 + Val1,
                                                 val2 = Val2, val3 = Val3}),
                 dets:insert(campaign_rank_role,
                             R#campaign_rank_role{val1 = OldVal1 + Val1,
                                                  val2 = Val2, val3 = Val3}),
                 R#campaign_rank_role{val1 = OldVal1 + Val1};
             _ ->
                 ets:insert(campaign_rank_role, R),
                 dets:insert(campaign_rank_role, R),
                 R
         end,
    role:apply(async,
               Id,
               {campaign_rank_mgr, notice, [60032, Val4, Val1]}),
    role:pack_send(Id, 17859, {SecType, [NR]}),
    in_rank(NR, State),
    continue(StateName, State);
handle_event({update_role,
              R = #campaign_rank_role{id = Id, val1 = Val1,
                                      val2 = Val2, val3 = Val3,
                                      classes = Classes, sex = Sex, lev = Lev,
                                      name = Name}},
             StateName = active,
             State = #state{sec_type = SecType}) ->
    Key = {Id, SecType},
    NR = case ets:lookup(campaign_rank_role, Key) of
             [#campaign_rank_role{val1 = OldVal1}] ->
                 ets:insert(campaign_rank_role,
                            R#campaign_rank_role{val1 = OldVal1 + Val1,
                                                 val2 = Val2, val3 = Val3,
                                                 classes = Classes, sex = Sex,
                                                 lev = Lev, name = Name}),
                 dets:insert(campaign_rank_role,
                             R#campaign_rank_role{val1 = OldVal1 + Val1,
                                                  val2 = Val2, val3 = Val3,
                                                  classes = Classes, sex = Sex,
                                                  lev = Lev, name = Name}),
                 R#campaign_rank_role{val1 = OldVal1 + Val1};
             _ ->
                 ets:insert(campaign_rank_role, R),
                 dets:insert(campaign_rank_role, R),
                 R
         end,
    role:pack_send(Id, 17859, {SecType, [NR]}),
    in_rank(NR, State),
    continue(StateName, State);
handle_event({set_role,
              R = #campaign_rank_role{id = Id}},
             StateName = active,
             State = #state{sec_type = SecType}) ->
    Key = {Id, SecType},
    ets:lookup(campaign_rank_role, Key),
    ets:insert(campaign_rank_role, R),
    dets:insert(campaign_rank_role, R),
    in_rank(R, State),
    continue(StateName, State);
handle_event(_Event, StateName, State) ->
    continue(StateName, State).

handle_sync_event(_Event, _From, StateName, State) ->
    Reply = ok,
    continue(StateName, Reply, State).

handle_info(reload, _,
            State = #state{sec_type = SecType}) ->
    {StateName, TimeLeft} = get_idle_time(SecType),
    notice_act_end(StateName, TimeLeft),
    continue(StateName,
             State#state{ts = date:now2(), timeout = TimeLeft});
handle_info({all_info, tournament_season},
            StateName = active,
            State = #state{sec_type = SecType = 60023}) ->
    #campaign_rank{list = RankList} = lookup(SecType),
    MatchSpec = [{{campaign_rank_role,
                   '$2',
                   '_',
                   '_',
                   '$1',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_'},
                  [{'==', '$1', {const, SecType}}],
                  [true]}],
    ets:select_delete(campaign_rank_role, MatchSpec),
    dets:select_delete(campaign_rank_role, MatchSpec),
    ets:delete(campaign_rank, SecType),
    dets:delete(campaign_rank, SecType),
    logger:info("武道会赛季重置，重新通知上榜:~w",
                [RankList],
                campaign_rank,
                260),
    [role:apply(async,
                RoleId,
                {campaign_rank_mgr, refire, [tournament_season]})
     || #campaign_rank_role{id = RoleId} <- RankList],
    continue(StateName, State);
handle_info({all_info, rencounter_season},
            StateName = active,
            State = #state{sec_type = SecType = 60020}) ->
    #campaign_rank{list = RankList} = lookup(SecType),
    MatchSpec = [{{campaign_rank_role,
                   '$2',
                   '_',
                   '_',
                   '$1',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_'},
                  [{'=:=', '$1', {const, SecType}}],
                  [true]}],
    ets:select_delete(campaign_rank_role, MatchSpec),
    dets:select_delete(campaign_rank_role, MatchSpec),
    ets:delete(campaign_rank, SecType),
    dets:delete(campaign_rank, SecType),
    logger:info("英雄擂台赛季重置，重新通知上榜:~w",
                [RankList],
                campaign_rank,
                271),
    [role:apply(async,
                RoleId,
                {campaign_rank_mgr, refire, [rencounter_season]})
     || #campaign_rank_role{id = RoleId} <- RankList],
    continue(StateName, State);
handle_info(gm_reward, active, State) ->
    active(timeout, State);
handle_info(notice_act_end, StateName = active,
            State) ->
    logger:info("~p", [notice_act_end], campaign_rank, 281),
    do_notice_act_end(State),
    continue(StateName, State);
handle_info(_Info, StateName, State) ->
    continue(StateName, State).

terminate(_Reason, _StateName, _State) -> ok.

code_change(_OldVsn, StateName, State, _Extra) ->
    {ok, StateName, State}.

idel(timeout, State = #state{sec_type = SecType}) ->
    {StateName, TimeLeft} = get_idle_time(SecType),
    notice_act_end(StateName, TimeLeft),
    logger:info("下一个状态~w",
                [{StateName, TimeLeft, State}],
                campaign_rank,
                301),
    NState = State#state{ts = date:now2(),
                         timeout = TimeLeft},
    MatchSpec = [{{campaign_rank_role,
                   '$2',
                   '_',
                   '_',
                   '$1',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_'},
                  [{'==', '$1', {const, SecType}}],
                  [true]}],
    ets:select_delete(campaign_rank_role, MatchSpec),
    dets:select_delete(campaign_rank_role, MatchSpec),
    ets:delete(campaign_rank, SecType),
    dets:delete(campaign_rank, SecType),
    continue(StateName, NState);
idel(_Any, State) -> continue(idel, State).

active(timeout,
       State = #state{sec_type = SecType, id = CfgId}) ->
    {_, TimeLeft} = get_idle_time(SecType),
    logger:info("下一个状态~w",
                [{idel, TimeLeft, State}],
                campaign_rank,
                316),
    #campaign_rank{list = Rank} = lookup(SecType),
    {ShowName, CastName} = reward(Rank, 1, State),
    MatchSpec = [{{campaign_rank_role,
                   '_',
                   '_',
                   '_',
                   '$1',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_'},
                  [{'==', '$1', {const, SecType}}],
                  ['$_']}],
    List = ets:select(campaign_rank_role, MatchSpec),
    case campaign_rank_data:get(CfgId) of
        #campaign_rank_data{title = Title, content = Content,
                            cast = Cast} ->
            NewCastMsg = notice:replace_msg2([{"#name#",
                                               [ShowName]}],
                                             Content),
            case Cast of
                "" -> ignore;
                _ ->
                    NewCast = notice:replace_msg2([{"#name#", [CastName]}],
                                                  Cast),
                    logger:info("传闻：~ts", [NewCast], campaign_rank, 328),
                    notice:cast(all, 4, NewCast),
                    notice:cast(all, 11, NewCast)
            end,
            logger:info("邮件~ts：~ts",
                        [Title, NewCastMsg],
                        campaign_rank,
                        332),
            List2 = merge_id(List, []),
            all_mail(List2, Title, NewCastMsg, State);
        _ -> ""
    end,
    continue(idel,
             State#state{ts = date:now2(), timeout = TimeLeft});
active(_Any, State) -> continue(idel, State).

get_idle_time(SecType) ->
    Now = date:unixtime(),
    OpenFlag = check_open_time(SecType),
    logger:debug("活动[~w]校验开服时间:~w",
                 [SecType, OpenFlag],
                 campaign_rank,
                 348),
    {StartTime, EndTime} = case get_camp(SecType) of
                               {_, -1, -1} ->
                                   {date:datetime_to_seconds({{2017, 6, 2},
                                                              {0, 0, 0}}),
                                    date:datetime_to_seconds({{2017, 6, 4},
                                                              {23, 59, 59}})};
                               {_, S, E} when OpenFlag =:= true -> {S, E};
                               _ ->
                                   {date:datetime_to_seconds({{2017, 6, 2},
                                                              {0, 0, 0}}),
                                    date:datetime_to_seconds({{2017, 6, 4},
                                                              {23, 59, 59}})}
                           end,
    if Now < StartTime ->
           {idel, max((StartTime - Now) * 1000, 1)};
       Now >= StartTime andalso Now < EndTime ->
           {active, max((EndTime - Now) * 1000, 1)};
       true -> {idel, date:next_diff(0) * 1000}
    end.

check_open_time(SecType) ->
    ServerOpenTime = env:get(srv_open_time),
    case SecType of
        60020 -> ServerOpenTime > 1495123200;
        60021 -> ServerOpenTime > 1495123200;
        60022 -> ServerOpenTime > 1495123200;
        60023 -> ServerOpenTime > 1493568000;
        60024 -> ServerOpenTime > 1493568000;
        60025 -> ServerOpenTime > 1493568000;
        60028 -> ServerOpenTime > 1492358400;
        60026 -> ServerOpenTime > 1493740800;
        60029 -> ServerOpenTime > 1492099200;
        60027 -> ServerOpenTime > 1493827200;
        60030 -> ServerOpenTime > 1493654400;
        _ -> true
    end.

lookup(SecType) ->
    case ets:lookup(campaign_rank, SecType) of
        [I = #campaign_rank{}] -> I;
        _ -> #campaign_rank{sec_type = SecType}
    end.

update(Data) ->
    ets:insert(campaign_rank, Data),
    dets:insert(campaign_rank, Data).

in_rank(NewData = #campaign_rank_role{key = Key,
                                      id = _Id, val1 = Value},
        State = #state{sec_type = SecType}) ->
    Rank = #campaign_rank{list = RankList, len = Len,
                          last_val = LastValue} =
               lookup(SecType),
    #campaign_rank_data{num = Max, keys = SortKeys,
                        min_val = MinVal} =
        lists:keyfind(SecType,
                      #campaign_rank_data.sec_type,
                      campaign_rank_mgr:cfg()),
    case lists:keyfind(Key,
                       #campaign_rank_role.key,
                       RankList)
        of
        _ when Value < MinVal -> ignore;
        false ->
            case Value >= LastValue orelse Max > Len of
                false -> {noreply, State};
                true ->
                    ToSortList = [NewData | lists:reverse(RankList)],
                    {NewRankList1, NewLastValue} =
                        rank_zone:update_rank(Max, SortKeys, ToSortList),
                    NewRankList = rank(NewRankList1, 1, []),
                    NewRank = Rank#campaign_rank{list = NewRankList,
                                                 last_val = NewLastValue},
                    update(NewRank)
            end;
        OldData ->
            case campare(SecType, OldData, NewData) of
                true ->
                    logger:debug("对比新旧数据:~w",
                                 [{OldData, NewData}],
                                 campaign_rank,
                                 411),
                    NRandList = lists:keyreplace(Key,
                                                 #campaign_rank_role.key,
                                                 RankList,
                                                 NewData),
                    ToSortList = lists:reverse(NRandList),
                    {NewRankList1, NewLastValue} =
                        rank_zone:update_rank(Max, SortKeys, ToSortList),
                    NewRankList = rank(NewRankList1, 1, []),
                    NewRank = Rank#campaign_rank{list = NewRankList,
                                                 last_val = NewLastValue},
                    update(NewRank);
                _ ->
                    logger:debug("对比新旧数据:~w",
                                 [{OldData, NewData}],
                                 campaign_rank,
                                 420),
                    {noreply, State}
            end
    end.

rank([], _, List) -> lists:reverse(List);
rank([I | T], Rank, List) ->
    rank(T,
         Rank + 1,
         [I#campaign_rank_role{rank = Rank} | List]).

reward(List, Rank, State = #state{sec_type = 60019}) ->
    do_reward2(List, Rank, State, "", "", []);
reward(List, Rank, State) ->
    do_reward(List, Rank, State, "", "").

do_reward([], _, _, String, CastStr) ->
    {String, CastStr};
do_reward([#campaign_rank_role{id = Id, name = Name} =
               RankRole
           | T],
          Rank, State = #state{sec_type = SecType, id = CfgId},
          String, CastStr) ->
    AddStr = case campaign_rank_data:get_rank({SecType,
                                               Rank})
                 of
                 #camp_rank_reward_data{title = Title, content = Content,
                                        item_list = ItemList0} ->
                     ItemList = filter_item(RankRole, ItemList0),
                     RankContent = notice:format(Content,
                                                 [{string_2, 1, Rank}]),
                     mail:send(Id, Title, RankContent, ItemList),
                     case Rank of
                         _ when Rank =< 3 ->
                             notice:format(lang:get("\n第~ts名：~ts"),
                                           [{string_2, 5, Rank},
                                            {role_2, Name}]);
                         _ -> ""
                     end;
                 _ -> ""
             end,
    AddCastStr = case campaign_rank_data:get(CfgId) of
                     #campaign_rank_data{cast_rank = CastRank}
                         when CastRank >= Rank ->
                         notice:format(lang:get("第~ts名：~ts"),
                                       [{string_2, 5, Rank}, {role_2, Name}]);
                     _ -> ""
                 end,
    do_reward(T,
              Rank + 1,
              State,
              String ++ AddStr,
              CastStr ++ AddCastStr).

do_reward2([], _, _, String, CastStr, _) ->
    {String, CastStr};
do_reward2([#campaign_rank_role{id = Id, name = Name,
                                id2 = Id2, name2 = Name2, val1 = Val1} =
                RankRole
            | T],
           Rank, State = #state{sec_type = SecType, id = CfgId},
           String, CastStr, List) ->
    Desc1 = case campaign_rank_data:get(CfgId) of
                #campaign_rank_data{desc = Desc} -> Desc;
                _ -> ""
            end,
    AddStr = case campaign_rank_data:get_rank({SecType,
                                               Rank})
                 of
                 #camp_rank_reward_data{title = Title, content = Content,
                                        item_list = ItemList0, limit = Limit} ->
                     ItemList = filter_item(RankRole, ItemList0),
                     case lists:member(Id, List) of
                         false when Val1 >= Limit ->
                             logger:info("活动排行榜：~w，~ts, ~ts， ~ts， ~w",
                                         [Id, Name, Title, Content, ItemList],
                                         campaign_rank,
                                         469),
                             mail:send(Id, Title, Content, ItemList);
                         _ -> ignore
                     end,
                     case lists:member(Id2, List) of
                         false when Val1 >= Limit ->
                             logger:info("活动排行榜：~w，~ts, ~ts， ~ts， ~w",
                                         [Id2, Name2, Title, Content, ItemList],
                                         campaign_rank,
                                         476),
                             mail:send(Id2, Title, Content, ItemList);
                         _ -> ignore
                     end,
                     case String of
                         _ ->
                             notice:format(lang:get("\n第~ts名：~ts与~ts\n~ts:~ts"),
                                           [{string_2, 5, Rank},
                                            {role_2, Name},
                                            {role_2, Name2},
                                            {string_1, Desc1},
                                            {string_2, 5, Val1}])
                     end;
                 _ -> ""
             end,
    AddCastStr = case campaign_rank_data:get(CfgId) of
                     #campaign_rank_data{cast_rank = CastRank}
                         when CastRank >= Rank ->
                         case CastStr of
                             "" ->
                                 notice:format(lang:get("~ts与~ts"),
                                               [{role_2, Name},
                                                {role_2, Name2}]);
                             _ ->
                                 notice:format(lang:get(",~ts与~ts"),
                                               [{role_2, Name},
                                                {role_2, Name2}])
                         end;
                     _ -> ""
                 end,
    do_reward2(T,
               Rank + 1,
               State,
               String ++ AddStr,
               CastStr ++ AddCastStr,
               [Id, Id2 | List]).

merge_id([], List) -> List;
merge_id([#campaign_rank_role{id = Id, id2 = Id2} | T],
         List) ->
    List1 = case lists:member(Id, List) of
                false -> [Id | List];
                _ -> List
            end,
    List2 = case lists:member(Id2, List1) of
                false -> [Id2 | List1];
                _ -> List1
            end,
    merge_id(T, List2).

all_mail([], _Title, _Content, _State) -> ok;
all_mail([Id | T], Title, Content, State) ->
    mail:send(Id, Title, Content),
    all_mail(T, Title, Content, State).

get_camp(CampSec) ->
    case campaign_mgr:get_camp_info(CampSec) of
        #camp_cache{id = Id, start_time = St, end_time = ET} ->
            {Id, St, ET};
        _ -> {0, -1, -1}
    end.

filter_item(#role{id = {RoleId, Platform, ZoneId},
                  name = Name, sex = Sex, classes = Classes, lev = Lev},
            ItemList) ->
    RankRole = #campaign_rank_role{id =
                                       {RoleId, Platform, ZoneId},
                                   role_id = RoleId, platform = Platform,
                                   zone_id = ZoneId, name = Name, sex = Sex,
                                   classes = Classes, lev = Lev},
    filter_item(RankRole, ItemList);
filter_item(RankRole, ItemList) ->
    do_filter_item(ItemList, RankRole, []).

do_filter_item([], _RankRole, ItemList) -> ItemList;
do_filter_item([{ItemId, Bind, Num} | T], RankRole,
               ItemList) ->
    do_filter_item(T,
                   RankRole,
                   [{ItemId, Bind, Num} | ItemList]);
do_filter_item([{ItemId, Bind, Num, _SpecialEffects}
                | T],
               RankRole, ItemList) ->
    do_filter_item(T,
                   RankRole,
                   [{ItemId, Bind, Num} | ItemList]);
do_filter_item([{ItemId,
                 Bind,
                 Num,
                 _SpecialEffects,
                 MinLev,
                 MaxLev}
                | T],
               RankRole = #campaign_rank_role{lev = Lev}, ItemList) ->
    case MinLev =< Lev andalso Lev =< MaxLev of
        true ->
            do_filter_item(T,
                           RankRole,
                           [{ItemId, Bind, Num} | ItemList]);
        _ -> do_filter_item(T, RankRole, ItemList)
    end.

notice_act_end(active, LeftEndTime) ->
    Now = date:unixtime(),
    EndTime = Now + LeftEndTime div 1000 - 1,
    {EndPreDate, _} = date:seconds_to_datetime(EndTime -
                                                   86400),
    case date:datetime_to_seconds({EndPreDate, {23, 58, 0}})
             - Now
        of
        DiffTime when DiffTime > 0 ->
            Ref = erlang:send_after(DiffTime * 1000,
                                    erlang:self(),
                                    notice_act_end),
            update_act_end_ref(Ref);
        _ -> ignore
    end;
notice_act_end(_, _) -> ignore.

update_act_end_ref(Ref) ->
    case erlang:erase(act_end_ref) of
        OldRef when erlang:is_reference(OldRef) ->
            erlang:cancel_timer(OldRef),
            erlang:put(act_end_ref, Ref);
        _ -> erlang:put(act_end_ref, Ref)
    end.

do_notice_act_end(#state{sec_type = SecType} = State) ->
    case get_mail_info(State) of
        {"", ""} -> ignore;
        {Title, Content} ->
            SendList = get_rank_role_list(SecType),
            all_mail(SendList, Title, Content, State)
    end.

get_rank_role_list(SecType) ->
    MatchSpec = [{{campaign_rank_role,
                   '_',
                   '_',
                   '_',
                   '$1',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_',
                   '_'},
                  [{'==', '$1', {const, SecType}}],
                  ['$_']}],
    List = ets:select(campaign_rank_role, MatchSpec),
    merge_id(List, []).

get_mail_info(#state{id = CfgID, ts = {M, S, _},
                     timeout = TimeLeft} =
                  State) ->
    case campaign_rank_data:get(CfgID) of
        #campaign_rank_data{title = Title} ->
            ActName = Title -- "排行公示",
            {{_Year, Month, Day}, {Hour, Min, _Sec}} =
                date:seconds_to_datetime(M * 1000000 + S +
                                             TimeLeft div 1000),
            TopName = get_top_name(State),
            Title2 = io_lib:format("~ts排行榜冲刺", [ActName]),
            Content2 =
                io_lib:format("~ts活动排行榜已进入冲刺阶段，将于~p月~p日~p时~p分结算，目前以下玩家暂列前三名，"
                              "大家一起加油吧！\n",
                              [ActName, Month, Day, Hour, Min]),
            {Title2, Content2 ++ TopName};
        _ -> {"", ""}
    end.

get_top_name(#state{sec_type = SecType} = State) ->
    #campaign_rank{list = Rank} = lookup(SecType),
    get_top_name2(Rank, 1, State).

get_top_name2(List, Rank,
              #state{sec_type = 60019, id = CfgID}) ->
    get_top_name4(List, Rank, CfgID, "");
get_top_name2(List, Rank, #state{id = CfgID}) ->
    get_top_name3(List, Rank, CfgID, "").

get_top_name3([], _, _, String) -> String;
get_top_name3([#campaign_rank_role{name = Name} | T],
              Rank, CfgId, String) ->
    AddStr = case Rank =< 3 of
                 true ->
                     notice:format(lang:get("\n第~ts名：~ts"),
                                   [{string_2, 5, Rank}, {role_2, Name}]);
                 _ -> ""
             end,
    get_top_name3(T, Rank + 1, CfgId, String ++ AddStr).

get_top_name4([], _, _, String) -> String;
get_top_name4([#campaign_rank_role{name = Name,
                                   name2 = Name2}
               | T],
              Rank, CfgID, String) ->
    AddStr = case Rank =< 3 of
                 true ->
                     notice:format(lang:get("\n第~ts名：~ts与~ts"),
                                   [{string_2, 5, Rank},
                                    {role_2, Name},
                                    {role_2, Name2}]);
                 _ -> ""
             end,
    get_top_name4(T, Rank + 1, CfgID, String ++ AddStr).

continue(StateName,
         State = #state{ts = Ts, timeout = Tidle}) ->
    {next_state,
     StateName,
     State,
     util:time_left(Tidle, Ts)}.

continue(StateName, Reply,
         State = #state{ts = Ts, timeout = Tidle}) ->
    {reply,
     Reply,
     StateName,
     State,
     util:time_left(Tidle, Ts)}.

campare(60026,
        _OldDat = #campaign_rank_role{val1 = OldVal1},
        _NewData = #campaign_rank_role{val1 = NewVal1}) ->
    case OldVal1 < NewVal1 of
        true -> true;
        _ -> false
    end;
campare(60025,
        _OldDat = #campaign_rank_role{val1 = OldVal1},
        _NewData = #campaign_rank_role{val1 = NewVal1}) ->
    case OldVal1 < NewVal1 of
        true -> true;
        _ -> false
    end;
campare(60029,
        _OldDat = #campaign_rank_role{val1 = OldVal1},
        _NewData = #campaign_rank_role{val1 = NewVal1}) ->
    case OldVal1 < NewVal1 of
        true -> true;
        _ -> false
    end;
campare(_, _OldData, _NewData) -> true.

