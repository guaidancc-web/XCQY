-file("src/mod/gods_duel/gods_place_zone.erl", 1).

-module(gods_place_zone).

-author("Liyf").

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

-file("src/mod/gods_duel/gods_place_zone.erl", 13).

-file("inc/battle.hrl", 1).

-record(battle_base,
        {id = 1 :: pos_integer(),
         type = 1 :: pos_integer(),
         sub_id = 0,
         sub_type = 0,
         name :: undefined | atom(),
         pid :: undefined | undefine | pid(),
         global = [] :: list(),
         map = [] :: list(),
         unit = [] :: list(),
         point = [] :: list(),
         trigger = [] :: list(),
         enter_point = {0, 0, 0} ::
             {non_neg_integer(),
              non_neg_integer(),
              non_neg_integer()}}).

-record(battle,
        {id = 1 :: pos_integer(),
         type = 1 :: pos_integer(),
         sub_id = 0,
         sub_type = 0,
         name :: undefined | atom(),
         pid :: undefined | undefine | pid(),
         map = [] :: list(),
         enter_point = {0, 0, 0} ::
             {non_neg_integer(),
              non_neg_integer(),
              non_neg_integer()},
         ext = [],
         role_id = {0, "", 0}}).

-record(battle_context,
        {grade = 1 :: pos_integer(),
         score = 0 :: non_neg_integer(),
         round = 0 :: non_neg_integer(),
         max_dmg = 0 :: non_neg_integer(),
         hurt = 0 :: non_neg_integer(),
         ratio_val = 0,
         die_num = 0}).

-record(battle_role,
        {id,
         status = 1,
         pid,
         name,
         sex = 0 :: 0..1,
         classes = 0 :: 0..6,
         lev = 0 :: non_neg_integer(),
         is_kill_boss = 0 :: 0..1,
         sub_id = 0 :: non_neg_integer(),
         flip_cards = [] :: [],
         has_reward_floor = [],
         context = #battle_context{}}).

-record(battle_combat_info,
        {sub_id = 0, sub_type = 0, gains = []}).

-record(battle_trigger,
        {name :: undefined | bitstring(),
         status = open :: open | close,
         event = [] :: [tuple()],
         vars = [] :: [tuple()],
         condition = [] :: [tuple()],
         action = [] :: list()}).

-record(tri_timer,
        {mode :: undefined | cycle | count,
         times = 0 :: integer(),
         timeout = 1000 :: pos_integer()}).

-record(cfg_act,
        {tpl :: undefined | atom(), cfg = [] :: list()}).

-record(tpl_act,
        {name = "" :: string(),
         type :: undefined | atom(),
         code = "" :: string(),
         args = [] :: list(),
         desc = "" :: string()}).

-record(cfg_cond,
        {tpl = "" :: string(), cfg = [] :: list()}).

-record(tpl_cond,
        {name = "" :: string(),
         code = "" :: string(),
         args = [] :: list(),
         desc = "" :: string()}).

-record(cfg_evt,
        {tpl = "" :: string(), cfg = [] :: list()}).

-record(tpl_evt,
        {name = "" :: string(),
         code = "" :: string(),
         args = [] :: list(),
         desc = "" :: string()}).

-record(cfg_val,
        {tpl = "" :: string(), cfg = [] :: list()}).

-record(tpl_val,
        {name = "" :: string(),
         code = "" :: string(),
         args = [] :: list(),
         desc = "" :: string()}).

-record(cfg_unit,
        {tpl = "" :: string(), cfg = [] :: list()}).

-record(tpl_unit,
        {name = "" :: string(),
         code = "" :: string(),
         args = [] :: list(),
         desc = "" :: string()}).

-record(point,
        {map = 1 :: pos_integer(),
         x = 0 :: non_neg_integer(),
         y = 0 :: non_neg_integer()}).

-record(tpl_fun,
        {name :: undefined | atom(),
         return :: undefined | unit | point,
         args = [] :: [atom()],
         code = "" :: string(),
         mfa_code = "" :: string(),
         label = "" :: string(),
         desc = "" :: string()}).

-file("src/mod/gods_duel/gods_place_zone.erl", 14).

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

-file("src/mod/gods_duel/gods_place_zone.erl", 15).

-file("inc/gods_place.hrl", 1).

-record(gods_place_team_statue,
        {ver = 1,
         team_id = 0,
         id = {0, "", 0},
         name = "",
         lev = 0,
         members = [],
         qualification = 0,
         serial_id = 0,
         team_leader = {0, "", 0}}).

-record(gods_place_team_mate_statue,
        {ver = 1,
         id = {0, "", 0},
         name = "",
         lev = 0,
         classes = 0,
         sex = 0,
         break_times = 0,
         looks = []}).

-record(m_gods_place,
        {ver = 3,
         group_id = 0,
         zone_id = 0,
         zone_pid = 0,
         pick_chest = 0,
         worship_times = 0,
         total_num = 0,
         sys_barrage = 1,
         ply_barrage = 1,
         barrage_time = 0,
         efficiency_flag = 0,
         pick_flag = 0}).

-file("src/mod/gods_duel/gods_place_zone.erl", 16).

-file("inc/looks.hrl", 1).

-file("src/mod/gods_duel/gods_place_zone.erl", 17).

-file("inc/unit.hrl", 1).

-record(unit_order,
        {order :: undefined | move | guard | attack | atom(),
         type = 0 :: 0..2,
         arg :: undefined | tuple() | [tuple()],
         data :: undefined | term(),
         condition = [] :: list(),
         over :: undefined | defense | stop | atom()}).

-record(unit_data,
        {id = 0 :: pos_integer(),
         type = 1 :: non_neg_integer(),
         fun_type = 1 :: non_neg_integer(),
         desc = "",
         classes = 0,
         sex = 0,
         lev = 1,
         name = "" :: list(),
         activity = 0 :: 0..1,
         guide_lev = 0 :: non_neg_integer(),
         status = 0 :: non_neg_integer(),
         nature = 0 :: non_neg_integer(),
         disabled = "" :: bitstring(),
         condition = [] :: [tuple()],
         speed = 120 :: pos_integer(),
         lock = 0 :: 0 | 1,
         t_move = 3 :: pos_integer(),
         t_atk = 3 :: pos_integer(),
         range_trace = 200 :: pos_integer(),
         range_atk = 100 :: pos_integer(),
         gain = [] :: list(),
         formation = 1,
         formation_lev = 1,
         slave = [] :: list(),
         talk = [] :: list(),
         looks = [] :: list(),
         data = [] :: list(),
         def_status = defense :: defense | patrol | loaf}).

-record(unit,
        {id = {1, 1} :: {pos_integer(), pos_integer()},
         base_id = 0 :: non_neg_integer(),
         type = 1 :: non_neg_integer(),
         fun_type = 1,
         name = "" :: list(),
         pid = 0 :: non_neg_integer() | pid(),
         lev = 1,
         classes = 0,
         sex = 0,
         activity = 0 :: 0..1,
         dun_info :: undefined | {pid(), pos_integer()},
         combat_pid = 0 :: non_neg_integer() | pid(),
         status = 0 :: non_neg_integer(),
         guide_lev = 0 :: non_neg_integer(),
         nature = 0 :: non_neg_integer(),
         disabled = "" :: list(),
         condition = [] :: [tuple()],
         speed = 180 :: pos_integer(),
         lock = 0 :: 0 | 1,
         range_trace = 200 :: pos_integer(),
         range_atk = 100 :: pos_integer(),
         defxy = {0, 0, 0} :: tuple(),
         def_status = defense :: defense | patrol | loaf,
         talk = [] :: list(),
         pos :: undefined | tuple(),
         data :: undefined | term(),
         looks = [] :: [tuple()],
         evt = [] :: [atom()],
         formation = 1,
         formation_lev = 1,
         slave = [] :: list(),
         prop = [] :: [{non_neg_integer(), string()}],
         order = [] :: list(),
         path = [] :: list(),
         ts = {1, 1, 1} ::
             {pos_integer(), pos_integer(), pos_integer()},
         t_move = 3 :: pos_integer(),
         t_atk = 3 :: pos_integer(),
         ai_id = 0,
         ai = {[], []} :: {list(), list()},
         attr,
         role_id = {0, "", 0}}).

-record(map_unit,
        {id = {1, 1} :: {pos_integer(), pos_integer()},
         base_id = 0 :: non_neg_integer(),
         type = 1 :: pos_integer(),
         activity = 0 :: 0..1,
         status = 0 :: non_neg_integer(),
         classes = 0,
         sex = 0,
         guide_lev = 0 :: non_neg_integer(),
         name = "" :: list(),
         speed = 1 :: pos_integer(),
         x = 0 :: non_neg_integer(),
         y = 0 :: non_neg_integer(),
         gx = 0 :: non_neg_integer(),
         gy = 0 :: non_neg_integer(),
         looks = [] :: [tuple()],
         prop = [] :: [tuple()]}).

-record(plot_unit,
        {id = 0 :: pos_integer(),
         name = "" :: bitstring(),
         base_id = 0 :: non_neg_integer(),
         type = 1,
         fun_type = 1,
         dun_id = 0 :: non_neg_integer(),
         map = 0 :: non_neg_integer(),
         x = 0 :: non_neg_integer(),
         y = 0 :: non_neg_integer(),
         dir = 0 :: non_neg_integer(),
         act_type = "" :: bitstring(),
         looks = [] :: [tuple()],
         status = 0 :: non_neg_integer(),
         quest_id = 0 :: non_neg_integer(),
         quest_prog_id = 0 :: non_neg_integer(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer()}).

-record(unit_statue,
        {type = 0,
         id = {0, "", 0},
         name = "",
         lev = 0,
         classes = 0,
         sex = 0,
         looks = []}).

-file("src/mod/gods_duel/gods_place_zone.erl", 18).

-file("inc/map.hrl", 1).

-record(map,
        {id = 1 :: pos_integer(),
         platform = "" :: list(),
         zone_id = 0 :: non_neg_integer(),
         base_id = 1 :: pos_integer(),
         res_id = 0 :: non_neg_integer(),
         pid :: undefined | pid(),
         ctrl_pid :: undefined | pid(),
         grid_info = [] :: [{pid(), pos_integer()}],
         name = "" :: bitstring(),
         condition = [] :: list(),
         num = 0 :: non_neg_integer(),
         width = 1 :: pos_integer(),
         height = 1 :: pos_integer()}).

-record(map_grid,
        {map_pid :: undefined | pid(),
         map_id = 1 :: pos_integer(),
         base_id = 1 :: pos_integer(),
         width = 1 :: pos_integer(),
         height = 1 :: pos_integer()}).

-record(map_data,
        {id = 1 :: pos_integer(),
         name = "" :: list(),
         condition = [] :: [tuple()],
         revive = [] :: [tuple()],
         width = 1 :: pos_integer(),
         height = 1 :: pos_integer(),
         grid_x = 0 :: pos_integer(),
         grid_y = 0 :: pos_integer(),
         max_pre_layer = 60 :: pos_integer(),
         startup = 0 :: 0..1,
         is_single = 0 :: 0..1}).

-file("src/mod/gods_duel/gods_place_zone.erl", 19).

-behaviour(gen_server).

-export([cast/2, call/2, start_link/2]).

-export([init/1,
         handle_call/3,
         handle_cast/2,
         handle_info/2,
         terminate/2,
         code_change/3]).

-record(state,
        {zone_id = 1,
         map_id = 0,
         map_pid = 0,
         status = 1,
         group = 0,
         box_list = [],
         name = [],
         members = [],
         role_num = 0}).

start_link(Seq, ZoneId) ->
    gen_server:start_link({local,
                           list_to_atom(lists:concat([gods_place_zone,
                                                      "_",
                                                      ZoneId]))},
                          gods_place_zone,
                          [Seq, ZoneId],
                          []).

cast(ZonePid, Info) when is_pid(ZonePid) ->
    gen_server:cast(ZonePid, Info);
cast(_, Info) ->
    logger:error("错误的请求:~w", [Info], gods_place_zone, 59),
    ok.

call(ZonePid, Info) when is_pid(ZonePid) ->
    gen_server:call(ZonePid, Info);
call(_, Info) ->
    logger:error("错误的请求:~w", [Info], gods_place_zone, 65),
    ok.

init([Seq, ZoneId]) ->
    process_flag(trap_exit, true),
    logger:info("[~w] 正在启动...",
                [gods_place_zone],
                gods_place_zone,
                74),
    case map_mgr:create(53011) of
        {error, Err} ->
            logger:error("启动诸神殿堂失败:~w:~w",
                         [ZoneId, Err],
                         gods_place_zone,
                         77),
            {stop, normal};
        {ok, MapPid, MapId} ->
            State = #state{zone_id = ZoneId, map_id = MapId,
                           map_pid = MapPid, group = Seq},
            erlang:send_after(180 * 1000, self(), gain_exp),
            logger:info("[~w] 启动完成...",
                        [gods_place_zone],
                        gods_place_zone,
                        83),
            {ok, State}
    end.

handle_call(quest_map_id, _From,
            State = #state{map_id = MapId}) ->
    {reply, MapId, State};
handle_call({enter, EnterNum}, _From,
            State = #state{map_id = MapId, group = GId,
                           zone_id = HouseId, role_num = Num}) ->
    Platform = env:get(platform),
    ZoneId = env:get(zone_id),
    NewState = State#state{role_num = Num + EnterNum},
    {reply,
     {self(), MapId, Platform, ZoneId, GId, HouseId},
     NewState};
handle_call(_Request, _From, State) ->
    {reply, {false, lang:get("未知请求")}, State}.

handle_cast({enter, RolePid},
            State = #state{map_id = MapId, group = GId,
                           zone_id = HouseId, role_num = Num}) ->
    Platform = env:get(platform),
    ZoneId = env:get(zone_id),
    NewState = State#state{role_num = Num + 1},
    role:apply(async,
               RolePid,
               {gods_place_role,
                role_callback,
                [{apply_enter,
                  self(),
                  MapId,
                  Platform,
                  ZoneId,
                  GId,
                  HouseId}]}),
    {noreply, NewState};
handle_cast({exit_place},
            State = #state{role_num = Num}) ->
    NewState = State#state{role_num = Num - 1},
    {noreply, NewState};
handle_cast({send_barrage, Msg},
            State = #state{map_pid = MapPId}) ->
    map:async_apply(MapPId,
                    {gods_place_role,
                     role_callback,
                     [{send_barrage, 0, Msg}]}),
    {noreply, State};
handle_cast(close, #state{map_pid = MapPId}) ->
    map:async_apply(MapPId,
                    {gods_place_role, role_callback, [{apply_exit}]}),
    {stop,
     normal,
     #state{zone_id = 1, map_id = 0, map_pid = 0, status = 1,
            group = 0, role_num = 0}};
handle_cast(create_box, State) ->
    self() ! {create_box, 1},
    {noreply, State};
handle_cast(close_box, State) ->
    self() ! close_box,
    {noreply, State};
handle_cast(rand_barrage, State) ->
    self() ! rand_barrage,
    {noreply, State};
handle_cast({pick_box, UnitId, RoleName, BarrageFlag},
            State = #state{box_list = BoxList, name = TeamName,
                           map_pid = _MapPId}) ->
    BoxList1 = lists:delete(UnitId, BoxList),
    case BarrageFlag of
        1 ->
            Msg = case util:rand(1, 3) of
                      1 ->
                          util:flist(lang:get("<color='#ffff00'>~ts</color><color='#FAF0E6'>"
                                              "：感谢</color><color='#ffff00'>~ts</color><color"
                                              "='#FAF0E6'>大大们洒下的币，祝愿你们一统星辰</color>"),
                                     [RoleName, TeamName]);
                      2 ->
                          util:flist(lang:get("<color='#ffff00'>~ts</color><color='#FAF0E6'>"
                                              "：我抢到了</color><color='#ffff00'>~ts</color><col"
                                              "or='#FAF0E6'>洒下的冠军宝箱，简直美滋滋</color>"),
                                     [RoleName, TeamName]);
                      _ ->
                          util:flist(lang:get("<color='#ffff00'>~ts</color><color='#FAF0E6'>"
                                              "：冠军宝箱太容易抢到了，下一个也还是我的</color>"),
                                     [RoleName])
                  end,
            NewMsg = case get(barrage_msg) of
                         L when is_list(L) -> [Msg | L];
                         _ -> [Msg]
                     end,
            put(barrage_msg, NewMsg);
        _ -> ignore
    end,
    {noreply, State#state{box_list = BoxList1}};
handle_cast(stop_barrage, State) ->
    case get(gods_place_rand_barrage) of
        OldRef when is_reference(OldRef) ->
            erlang:cancel_timer(OldRef);
        _ -> ok
    end,
    {noreply, State};
handle_cast(creat_statue, State) ->
    NewState = load_statue(State),
    {noreply, NewState};
handle_cast({create_box, LeftTime, NextRound}, State) ->
    case get(gods_place_create_box) of
        OldRef when is_reference(OldRef) ->
            erlang:cancel_timer(OldRef);
        _ -> ok
    end,
    Ref = erlang:send_after(LeftTime * 1000,
                            self(),
                            {create_box, NextRound}),
    put(gods_place_create_box, Ref),
    {noreply, State};
handle_cast(make_npc,
            State = #state{zone_id = ZoneId, map_id = MapId}) ->
    unit_mgr:create({55, ZoneId * 10 + 10},
                    58501,
                    {MapId, 2041, 1510}),
    {noreply, State};
handle_cast(clear_npc,
            State = #state{zone_id = ZoneId}) ->
    unit_mgr:remove({55, ZoneId * 10 + 10}),
    {noreply, State};
handle_cast({push_17955, Reply},
            State = #state{map_pid = MapPid}) ->
    map:async_apply(MapPid,
                    {gods_place_role,
                     role_callback,
                     [{push_17955, Reply}]}),
    {noreply, State};
handle_cast(_Msg, State) -> {noreply, State}.

handle_info(gain_exp,
            State = #state{status = 1, map_pid = MapPId}) ->
    map:async_apply(MapPId,
                    {gods_place_role, role_callback, [{apply_gain_exp}]}),
    erlang:send_after(60 * 1000, self(), gain_exp),
    {noreply, State};
handle_info(gain_exp, State) -> {noreply, State};
handle_info(rand_barrage,
            State = #state{map_pid = MapPId}) ->
    case get(gods_place_rand_barrage) of
        OldRef when is_reference(OldRef) ->
            erlang:cancel_timer(OldRef);
        _ -> ok
    end,
    RandId =
        util:rand_list(gods_place_data:get_all_barrage()),
    RandMsg = gods_place_data:get_rand_barrage(RandId),
    map:async_apply(MapPId,
                    {gods_place_role,
                     role_callback,
                     [{send_barrage, 0, RandMsg}]}),
    Ref = erlang:send_after(2 * 60 * 1000,
                            self(),
                            rand_barrage),
    put(gods_place_rand_barrage, Ref),
    {noreply, State};
handle_info(send_pick_barrage,
            State = #state{map_pid = MapPId}) ->
    case get(gods_place_pick_barrage) of
        OldRef when is_reference(OldRef) ->
            erlang:cancel_timer(OldRef);
        _ -> ok
    end,
    NewList = case get(barrage_msg) of
                  List = [_ | _] ->
                      MsgList = lists:sublist(List, util:rand(10, 15)),
                      map:async_apply(MapPId,
                                      {gods_place_role,
                                       role_callback,
                                       [{send_barrage, 1, MsgList}]}),
                      List -- MsgList;
                  _ -> []
              end,
    RTime = util:rand(7, 15),
    Ref = erlang:send_after(RTime * 1000,
                            self(),
                            send_pick_barrage),
    put(gods_place_pick_barrage, Ref),
    put(barrage_msg, NewList),
    {noreply, State};
handle_info(close_box, State) ->
    case get(gods_place_create_box) of
        OldRef when is_reference(OldRef) ->
            erlang:cancel_timer(OldRef);
        _ -> ok
    end,
    case get(gods_place_pick_barrage) of
        OldRef2 when is_reference(OldRef2) ->
            erlang:cancel_timer(OldRef2);
        _ -> ok
    end,
    State1 = clean_box(State),
    {noreply, State1};
handle_info({create_box, Time},
            State = #state{map_pid = MapPId, role_num = RoleNum}) ->
    case get(gods_place_create_box) of
        OldRef when is_reference(OldRef) ->
            erlang:cancel_timer(OldRef);
        _ -> ok
    end,
    map:async_apply(MapPId,
                    {gods_place_role, role_callback, [create_box]}),
    State1 = clean_box(State),
    GoldNum = max(1, round(RoleNum / 10)),
    SilverNum = max(1, round(RoleNum / 2)),
    logger:debug("刷新第[~w]轮[~w]个金宝箱[~w]个银宝箱",
                 [Time, GoldNum, SilverNum],
                 gods_place_zone,
                 280),
    NewState = case gods_place_data:get(2) of
                   {{GBoxId, _}, _} ->
                       State4 = case create_map_box(State1, GBoxId, GoldNum) of
                                    State2 = #state{} ->
                                        case gods_place_data:get(3) of
                                            {{SBoxId, _}, _} ->
                                                case create_map_box(State2,
                                                                    SBoxId,
                                                                    SilverNum)
                                                    of
                                                    State3 = #state{} ->
                                                        map:async_apply(MapPId,
                                                                        {gods_place_role,
                                                                         role_callback,
                                                                         [{send_barrage,
                                                                           1,
                                                                           lang:get("冠军已经撒币啦，快去抢冠军宝箱")}]}),
                                                        State3;
                                                    _ -> State1
                                                end;
                                            _ -> State1
                                        end;
                                    _ -> State1
                                end,
                       Ref1 = erlang:send_after(5 * 1000,
                                                self(),
                                                send_pick_barrage),
                       put(gods_place_pick_barrage, Ref1),
                       Ref2 = erlang:send_after(5 * 60 * 1000,
                                                self(),
                                                {create_box, Time + 1}),
                       put(gods_place_create_box, Ref2),
                       State4;
                   _ -> State1
               end,
    {noreply, NewState};
handle_info(_Info, State) ->
    logger:debug("收到未知消息:~w",
                 [_Info],
                 gods_place_zone,
                 314),
    {noreply, State}.

terminate(_Reason, _State) ->
    logger:info("[~w] 正在关闭...",
                [gods_place_zone],
                gods_place_zone,
                318),
    logger:info("[~w] 关闭完成",
                [gods_place_zone],
                gods_place_zone,
                319),
    ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

load_statue(State = #state{zone_id = ZoneId,
                           map_id = MapId, group = Group}) ->
    case catch ets:lookup(gods_place_season, season_id) of
        [] -> State;
        L when is_list(L) ->
            case ets:match_object(gods_place_team_statue,
                                  #gods_place_team_statue{lev = Group,
                                                          serial_id =
                                                              ets:lookup_element(gods_place_season,
                                                                                 season_id,
                                                                                 2),
                                                          _ = '_'})
                of
                [] -> State;
                [#gods_place_team_statue{name = Name,
                                         members = Members}] ->
                    case length(Members) of
                        7 ->
                            unit_mgr:create({55, ZoneId * 10 + 1},
                                            43082,
                                            {MapId, 2021, 1700}),
                            unit_mgr:create({55, ZoneId * 10 + 2},
                                            43083,
                                            {MapId, 1700, 1620}),
                            unit_mgr:create({55, ZoneId * 10 + 3},
                                            43084,
                                            {MapId, 1665, 1459}),
                            unit_mgr:create({55, ZoneId * 10 + 4},
                                            43085,
                                            {MapId, 1900, 1343}),
                            unit_mgr:create({55, ZoneId * 10 + 5},
                                            43086,
                                            {MapId, 2222, 1339}),
                            unit_mgr:create({55, ZoneId * 10 + 6},
                                            43087,
                                            {MapId, 2323, 1460}),
                            unit_mgr:create({55, ZoneId * 10 + 7},
                                            43088,
                                            {MapId, 2260, 1700});
                        6 ->
                            unit_mgr:create({55, ZoneId * 10 + 1},
                                            43082,
                                            {MapId, 2180, 1660}),
                            unit_mgr:create({55, ZoneId * 10 + 2},
                                            43083,
                                            {MapId, 1900, 1660}),
                            unit_mgr:create({55, ZoneId * 10 + 3},
                                            43084,
                                            {MapId, 1700, 1500}),
                            unit_mgr:create({55, ZoneId * 10 + 4},
                                            43085,
                                            {MapId, 1900, 1340}),
                            unit_mgr:create({55, ZoneId * 10 + 5},
                                            43086,
                                            {MapId, 2180, 1340}),
                            unit_mgr:create({55, ZoneId * 10 + 6},
                                            43088,
                                            {MapId, 2380, 1500});
                        _ ->
                            unit_mgr:create({55, ZoneId * 10 + 1},
                                            43082,
                                            {MapId, 2020, 1700}),
                            unit_mgr:create({55, ZoneId * 10 + 2},
                                            43083,
                                            {MapId, 1700, 1540}),
                            unit_mgr:create({55, ZoneId * 10 + 3},
                                            43084,
                                            {MapId, 1860, 1340}),
                            unit_mgr:create({55, ZoneId * 10 + 4},
                                            43085,
                                            {MapId, 2220, 1340}),
                            unit_mgr:create({55, ZoneId * 10 + 5},
                                            43088,
                                            {MapId, 2380, 1540})
                    end,
                    update_champion_statue(ZoneId, Members),
                    MemberId = [Id
                                || #gods_place_team_mate_statue{id = Id}
                                       <- Members],
                    State#state{name = Name, members = MemberId}
            end;
        _Err ->
            logger:error("~w", [_Err], gods_place_zone, 367),
            State
    end.

update_champion_statue(ZoneId, MembersList) ->
    update_champion_statue(ZoneId,
                           MembersList,
                           ZoneId * 10 + 1).

update_champion_statue(_ZoneId, [], _Index) -> ok;
update_champion_statue(ZoneId, _, Index)
    when Index > ZoneId * 10 + 7 ->
    ok;
update_champion_statue(ZoneId,
                       [TeamMate = #gods_place_team_mate_statue{} | Rest],
                       Index) ->
    update_statue(Index, TeamMate),
    update_champion_statue(ZoneId, Rest, Index + 1).

update_statue(Type,
              TeamMate = #gods_place_team_mate_statue{looks =
                                                          Looks}) ->
    Looks1 = [{LooksType, LooksMode, LooksVal, LooksStr}
              || {LooksType, LooksMode, LooksVal, LooksStr} <- Looks,
                 lists:member(LooksType, [1, 2, 3, 4, 6])],
    do_update_statue(Type,
                     TeamMate#gods_place_team_mate_statue{looks = Looks1}).

do_update_statue(Type,
                 #gods_place_team_mate_statue{name = Name, lev = Lev,
                                              classes = Classes, sex = Sex,
                                              looks = Looks}) ->
    UnitId = {55, Type},
    logger:debug("生成雕像:~w", [UnitId], gods_place_zone, 393),
    case unit_mgr:info(UnitId) of
        {ok, #unit{}} ->
            ElemPos = [{#unit.name, Name},
                       {#unit.lev, Lev},
                       {#unit.classes, Classes},
                       {#unit.sex, Sex},
                       {#unit.looks, Looks}],
            unit_mgr:set_element(UnitId, ElemPos),
            ok;
        _Err ->
            logger:error("更新雕像时,无法找到对应雕像单位:~w",
                         [_Err],
                         gods_place_zone,
                         400),
            ok
    end.

clean_box(State = #state{box_list = BoxList}) ->
    [unit_mgr:remove(UnitId) || UnitId <- BoxList],
    State#state{box_list = []}.

create_map_box(State = #state{map_id = MapId,
                              box_list = BoxList},
               BoxId, Num) ->
    case unit_mgr:fetch_ids(Num) of
        {ok, Ids} ->
            BoxList1 = do_create_box(Ids, Num, BoxId, MapId, []),
            State#state{box_list = BoxList ++ BoxList1};
        _ -> State
    end.

do_create_box([], _Num, _BoxId, _MapId, BoxList) ->
    BoxList;
do_create_box(_, Num, _BoxId, _MapId, BoxList)
    when Num =< 0 ->
    BoxList;
do_create_box([Id | T], Num, BoxId, MapId, BoxList) ->
    case map:rand_pos(53011) of
        {X, Y} ->
            case unit_mgr:create({55, Id}, BoxId, {MapId, X, Y}) of
                {ok, #unit{id = UnitId}} ->
                    do_create_box(T,
                                  Num - 1,
                                  BoxId,
                                  MapId,
                                  [UnitId | BoxList]);
                _ -> do_create_box(T, Num - 1, BoxId, MapId, BoxList)
            end;
        _ -> do_create_box(T, Num - 1, BoxId, MapId, BoxList)
    end.

