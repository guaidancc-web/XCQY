-file("src/mod/misc/info.erl", 1).

-module(info).

-behaviour(gen_server).

-export([init/1,
         handle_call/3,
         handle_cast/2,
         handle_info/2,
         terminate/2,
         code_change/3]).

-export([start_link/0,
         auto/0,
         i/0,
         map/0,
         ets/0,
         ets/1,
         dets/0,
         map_roles/0,
         map_roles/1,
         count_map/0,
         count_proto/1,
         count_info/1,
         battle/0,
         p/1,
         p2/1,
         r/3,
         role/1,
         role/3,
         roles/0,
         roles/1,
         roles/2,
         top/3,
         dump/1,
         dump/2,
         ptop/1,
         ptop/3,
         eprof_start/0,
         eprof_start/2,
         eprof_stop/0,
         eprof_stop/1,
         unpack/1,
         unpack/2,
         cprof/0,
         cprof/1,
         cprof/2,
         xref/0,
         gc_all/0,
         etop/1,
         pstack/1,
         trace/1,
         trace/2,
         trace_stop/0,
         find_dets_by_pid/3]).

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

-file("src/mod/misc/info.erl", 57).

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

-file("src/mod/misc/info.erl", 58).

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

-file("src/mod/misc/info.erl", 59).

-file("inc/pos.hrl", 1).

-record(pos_history,
        {map = 0 :: non_neg_integer(),
         platform = "" :: list(),
         zone_id = 0 :: non_neg_integer(),
         x = 0 :: non_neg_integer(),
         y = 0 :: non_neg_integer()}).

-record(pos,
        {map = 10001 :: non_neg_integer(),
         platform = "" :: list(),
         zone_id = 0 :: non_neg_integer(),
         last :: undefined | #pos_history{},
         map_base_id = 0 :: non_neg_integer(),
         map_pid = 0 :: non_neg_integer() | pid(),
         map_grid_pid = 0 :: non_neg_integer() | pid(),
         hidden = 1 :: 0 | 1,
         x = 0 :: non_neg_integer(),
         y = 0 :: non_neg_integer(),
         dir = 0 :: 0..255}).

-file("src/mod/misc/info.erl", 60).

-file("inc/link.hrl", 1).

-record(link,
        {socket :: undefined | port(),
         conn_pid :: undefined | pid(),
         ip = {0, 0, 0, 0} :: {0..255, 0..255, 0..255, 0..255},
         port = 0 :: non_neg_integer(),
         lag = 0 :: non_neg_integer()}).

-file("src/mod/misc/info.erl", 61).

-file("inc/ip_info.hrl", 1).

-record(ip_info,
        {ip :: undefined | tuple(),
         connected = 0 :: reset | non_neg_integer(),
         max_conn = -1 :: integer(),
         conn_times = 0 :: pos_integer()}).

-file("src/mod/misc/info.erl", 62).

-file("inc/query.hrl", 1).

-record(name_index,
        {name = "" :: list(),
         id = 0 :: non_neg_integer(),
         acc = "" :: list(),
         pid :: undefined | pid(),
         conn_pid :: undefined | pid()}).

-record(id_index,
        {id = {0, "", 0} ::
             {non_neg_integer(), list(), non_neg_integer()},
         acc = "" :: list(),
         name = "" :: list(),
         pid :: undefined | pid(),
         conn_pid :: undefined | pid()}).

-record(acc_index,
        {acc = {"", "", 0} ::
             {list(), list(), non_neg_integer()},
         id = 0 :: non_neg_integer(),
         name = "" :: list(),
         pid :: undefined | pid(),
         conn_pid :: undefined | pid()}).

-file("src/mod/misc/info.erl", 63).

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

-file("src/mod/misc/info.erl", 64).

-record(state, {}).

start_link() ->
    gen_server:start_link({local, info}, info, [], []).

auto() -> info ! auto.

-spec i() -> ok.

i() ->
    SchedId = erlang:system_info(scheduler_id),
    SchedNum = erlang:system_info(schedulers),
    ProcCount = erlang:system_info(process_count),
    ProcLimit = erlang:system_info(process_limit),
    ProcMemUsed = trunc(erlang:memory(processes_used) / 1024
                            / 1024),
    ProcMemAlloc = trunc(erlang:memory(processes) / 1024 /
                             1024),
    EtsMemAlloc = trunc(erlang:memory(ets) / 1024 / 1024),
    BinaryMemAlloc = trunc(erlang:memory(binary) / 1024 /
                               1024),
    AtomMemAlloc = trunc(erlang:memory(atom) / 1024),
    AtomMemUsed = trunc(erlang:memory(atom_used) / 1024),
    CodeMem = trunc(erlang:memory(code) / 1024 / 1024),
    MemTot = trunc(erlang:memory(total) / 1024 / 1024),
    RoleNum = ets:info(role_cache, size),
    MapNum = ets:info(map_info, size),
    NodesNum = ets:info(mirrors, size),
    util:cn("   当前节点:                   ~40w~n   "
            "Scheduler id:               ~10w~n  "
            " Num scheduler:              ~10w~n "
            "  Processes(Uses):        ~10w(mb)~n "
            "  Processes:              ~10w(mb)~n "
            "  Ets:                    ~10w(mb)~n "
            "  Binary:                 ~10w(mb)~n "
            "  Atom(Used):             ~10w(kb)~n "
            "  Atom:                   ~10w(kb)~n "
            "  Code:                   ~10w(mb)~n "
            "  Total:                  ~10w(mb)~n "
            "  可创建进程数量上限:         ~10w~n   当前节点中的进程总数: "
            "      ~10w~n   集群中的节点总数:           ~10w~n "
            "  当前节点在线角色数:         ~10w~n   当前节点已启动的地图数量: "
            "  ~10w~n",
            [node(),
             SchedId,
             SchedNum,
             ProcMemUsed,
             ProcMemAlloc,
             EtsMemAlloc,
             BinaryMemAlloc,
             AtomMemUsed,
             AtomMemAlloc,
             CodeMem,
             MemTot,
             ProcLimit,
             ProcCount,
             NodesNum,
             RoleNum,
             MapNum]).

gc_all() ->
    [erlang:garbage_collect(Pid) || Pid <- processes()].

etop(reds) ->
    spawn(fun () ->
                  etop:start([{output, text},
                              {interval, 10},
                              {lines, 20},
                              {sort, reductions}])
          end);
etop(mem) ->
    spawn(fun () ->
                  etop:start([{output, text},
                              {interval, 10},
                              {lines, 20},
                              {sort, memory}])
          end);
etop(stop) -> etop:stop().

pstack(Reg) when is_atom(Reg) ->
    case whereis(Reg) of
        undefined -> undefined;
        Pid -> pstack(Pid)
    end;
pstack(Pid) ->
    io:format("~s~n",
              [element(2, process_info(Pid, backtrace))]).

trace(Mod) ->
    dbg:tracer(),
    dbg:tpl(Mod, '_', []),
    dbg:p(all, c).

trace(Node, Mod) ->
    dbg:tracer(),
    dbg:n(Node),
    dbg:tpl(Mod, '_', []),
    dbg:p(all, c).

trace_stop() -> dbg:stop_clear().

p(undefined) -> undefined;
p(Pid) when is_atom(Pid) -> p(whereis(Pid));
p(Pid) when is_list(Pid) -> p(list_to_pid(Pid));
p(Pid) when is_pid(Pid) -> erlang:process_info(Pid).

p2(undefined) -> undefined;
p2(Pid) when is_atom(Pid) -> p2(whereis(Pid));
p2(Pid) when is_list(Pid) -> p2(list_to_pid(Pid));
p2(Pid) when is_pid(Pid) ->
    erlang:process_info(Pid,
                        [message_queue_len,
                         current_function,
                         current_location,
                         current_stacktrace]).

ets() -> ets(0).

ets(Num) ->
    L = ets:all(),
    Data = [{Tab,
             trunc(ets:info(Tab, memory) / 1024),
             ets:info(Tab, owner),
             ets:info(Tab, size),
             ets:info(Tab, type)}
            || Tab <- L],
    NewData = case Num > 0 of
                  true ->
                      lists:sublist(lists:reverse(lists:keysort(2, Data)),
                                    Num);
                  _ -> lists:reverse(lists:keysort(2, Data))
              end,
    case os:type() of
        {win32, _} ->
            io:format("~ts",
                      [io_lib:format("已启动的ETS总数: ~w~n", [length(L)])]);
        _ ->
            io:format("~ts",
                      [io_lib:format("已启动的ETS总数: ~w~n", [length(L)])])
    end,
    case os:type() of
        {win32, _} ->
            io:format("~ts",
                      [io_lib:format("---------------------------------------------"
                                     "---------------------------------------------"
                                     "---------------~n",
                                     [])]);
        _ ->
            io:format("~ts",
                      [io_lib:format("---------------------------------------------"
                                     "---------------------------------------------"
                                     "---------------~n",
                                     [])])
    end,
    case os:type() of
        {win32, _} ->
            io:format("~ts",
                      [io_lib:format("~30ts ~20ts ~20ts ~20ts ~20ts~n",
                                     ["name",
                                      "memory",
                                      "owner",
                                      "size",
                                      "type"])]);
        _ ->
            io:format("~ts",
                      [io_lib:format("~30ts ~20ts ~20ts ~20ts ~20ts~n",
                                     ["name",
                                      "memory",
                                      "owner",
                                      "size",
                                      "type"])])
    end,
    F = fun ({Tab, Mem, Owner, Size, Type}) ->
                case os:type() of
                    {win32, _} ->
                        io:format("~ts",
                                  [io_lib:format("~30w ~20w ~20w ~20w ~20w~n",
                                                 [Tab,
                                                  Mem,
                                                  Owner,
                                                  Size,
                                                  Type])]);
                    _ ->
                        io:format("~ts",
                                  [io_lib:format("~30w ~20w ~20w ~20w ~20w~n",
                                                 [Tab,
                                                  Mem,
                                                  Owner,
                                                  Size,
                                                  Type])])
                end
        end,
    lists:map(F, NewData),
    ok.

dets() ->
    L = dets:all(),
    case os:type() of
        {win32, _} ->
            io:format("~ts",
                      [io_lib:format("已启动的DETS总数: ~w~n", [length(L)])]);
        _ ->
            io:format("~ts",
                      [io_lib:format("已启动的DETS总数: ~w~n", [length(L)])])
    end,
    case os:type() of
        {win32, _} ->
            io:format("~ts",
                      [io_lib:format("---------------------------------------------"
                                     "---------------------------------------------"
                                     "---------------~n",
                                     [])]);
        _ ->
            io:format("~ts",
                      [io_lib:format("---------------------------------------------"
                                     "---------------------------------------------"
                                     "---------------~n",
                                     [])])
    end,
    case os:type() of
        {win32, _} ->
            io:format("~ts",
                      [io_lib:format("~30ts ~10ts ~20ts ~20ts ~20ts~n",
                                     ["name",
                                      "owner",
                                      "size",
                                      "type",
                                      "file_size"])]);
        _ ->
            io:format("~ts",
                      [io_lib:format("~30ts ~10ts ~20ts ~20ts ~20ts~n",
                                     ["name",
                                      "owner",
                                      "size",
                                      "type",
                                      "file_size"])])
    end,
    F = fun (Tab) ->
                case os:type() of
                    {win32, _} ->
                        io:format("~ts",
                                  [io_lib:format("~30w ~10w ~20w ~20w ~20w~n",
                                                 [Tab,
                                                  dets:info(Tab, size),
                                                  dets:info(Tab, owner),
                                                  dets:info(Tab, type),
                                                  dets:info(Tab, file_size)])]);
                    _ ->
                        io:format("~ts",
                                  [io_lib:format("~30w ~10w ~20w ~20w ~20w~n",
                                                 [Tab,
                                                  dets:info(Tab, size),
                                                  dets:info(Tab, owner),
                                                  dets:info(Tab, type),
                                                  dets:info(Tab, file_size)])])
                end
        end,
    lists:map(F, L),
    ok.

find_dets_by_pid(A, B, C) ->
    Pid = c:pid(A, B, C),
    L = dets:all(),
    do_find_dets_by_pid(L, Pid).

do_find_dets_by_pid([], _) ->
    io:format("can not find dets~n"),
    ok;
do_find_dets_by_pid([Tab | T], Pid) ->
    case dets:info(Tab, owner) =:= Pid of
        true ->
            io:format("find dets:~w~n", [Tab]),
            ok;
        _ -> do_find_dets_by_pid(T, Pid)
    end.

map() ->
    case ets:info(map_info, size) of
        undefined ->
            case os:type() of
                {win32, _} ->
                    io:format("~ts", [io_lib:format("地图管理器未启动~n", [])]);
                _ -> io:format("~ts", [io_lib:format("地图管理器未启动~n", [])])
            end;
        N ->
            case os:type() of
                {win32, _} ->
                    io:format("~ts",
                              [io_lib:format("已启动的地图总数: ~w~n", [N])]);
                _ ->
                    io:format("~ts", [io_lib:format("已启动的地图总数: ~w~n", [N])])
            end,
            case os:type() of
                {win32, _} ->
                    io:format("~ts",
                              [io_lib:format("---------------------------------------------"
                                             "---------------------------------------------"
                                             "---------------~n",
                                             [])]);
                _ ->
                    io:format("~ts",
                              [io_lib:format("---------------------------------------------"
                                             "---------------------------------------------"
                                             "---------------~n",
                                             [])])
            end,
            case os:type() of
                {win32, _} ->
                    io:format("~ts",
                              [io_lib:format("~10ts ~10ts ~15ts ~10ts ~100ts ~20ts~n",
                                             ["Map Id",
                                              "Base Id",
                                              "Pid",
                                              "Role Number",
                                              "Grid Info",
                                              "Name"])]);
                _ ->
                    io:format("~ts",
                              [io_lib:format("~10ts ~10ts ~15ts ~10ts ~100ts ~20ts~n",
                                             ["Map Id",
                                              "Base Id",
                                              "Pid",
                                              "Role Number",
                                              "Grid Info",
                                              "Name"])])
            end,
            F = fun (#map{id = Id, base_id = BaseId, name = Name,
                          pid = Pid, num = Num, grid_info = GridInfo},
                     _) ->
                        case os:type() of
                            {win32, _} ->
                                io:format("~ts",
                                          [io_lib:format("~10w ~10w ~15w ~10w ~100w ~20ts~n",
                                                         [Id,
                                                          BaseId,
                                                          Pid,
                                                          Num,
                                                          GridInfo,
                                                          Name])]);
                            _ ->
                                io:format("~ts",
                                          [io_lib:format("~10w ~10w ~15w ~10w ~100w ~20ts~n",
                                                         [Id,
                                                          BaseId,
                                                          Pid,
                                                          Num,
                                                          GridInfo,
                                                          Name])])
                        end
                end,
            ets:foldl(F, 0, map_info)
    end,
    ok.

count_map() ->
    case ets:info(map_info, size) of
        undefined ->
            case os:type() of
                {win32, _} ->
                    io:format("~ts", [io_lib:format("地图管理器未启动~n", [])]);
                _ -> io:format("~ts", [io_lib:format("地图管理器未启动~n", [])])
            end;
        N ->
            case os:type() of
                {win32, _} ->
                    io:format("~ts",
                              [io_lib:format("已启动的地图总数: ~w~n", [N])]);
                _ ->
                    io:format("~ts", [io_lib:format("已启动的地图总数: ~w~n", [N])])
            end,
            case os:type() of
                {win32, _} ->
                    io:format("~ts",
                              [io_lib:format("---------------------------------------------"
                                             "---------------------------------------------"
                                             "---------------~n",
                                             [])]);
                _ ->
                    io:format("~ts",
                              [io_lib:format("---------------------------------------------"
                                             "---------------------------------------------"
                                             "---------------~n",
                                             [])])
            end,
            F = fun (#map{base_id = BaseId, name = Name, num = Num},
                     L1) ->
                        case lists:keyfind(BaseId, 1, L1) of
                            {BaseId, Name, RoleNum, V} ->
                                lists:keyreplace(BaseId,
                                                 1,
                                                 L1,
                                                 {BaseId,
                                                  Name,
                                                  Num + RoleNum,
                                                  V + 1});
                            _ -> [{BaseId, Name, Num, 1} | L1]
                        end
                end,
            L = ets:foldl(F, [], map_info),
            case os:type() of
                {win32, _} ->
                    io:format("~ts",
                              [io_lib:format("~20ts ~20ts ~20ts ~20ts~n",
                                             ["Base Id",
                                              "Num",
                                              "Role Number",
                                              "Name"])]);
                _ ->
                    io:format("~ts",
                              [io_lib:format("~20ts ~20ts ~20ts ~20ts~n",
                                             ["Base Id",
                                              "Num",
                                              "Role Number",
                                              "Name"])])
            end,
            F1 = fun ({BaseId, Name, RoleNum, MapNum}) ->
                         case os:type() of
                             {win32, _} ->
                                 io:format("~ts",
                                           [io_lib:format("~20w ~20w ~20w ~50ts~n",
                                                          [BaseId,
                                                           MapNum,
                                                           RoleNum,
                                                           Name])]);
                             _ ->
                                 io:format("~ts",
                                           [io_lib:format("~20w ~20w ~20w ~50ts~n",
                                                          [BaseId,
                                                           MapNum,
                                                           RoleNum,
                                                           Name])])
                         end
                 end,
            L1 = lists:keysort(1, L),
            lists:map(F1, L1)
    end,
    ok.

map_roles() -> map_roles(1).

map_roles(Min) ->
    case ets:info(map_info, size) of
        undefined ->
            case os:type() of
                {win32, _} ->
                    io:format("~ts", [io_lib:format("地图管理器未启动~n", [])]);
                _ -> io:format("~ts", [io_lib:format("地图管理器未启动~n", [])])
            end;
        N ->
            case os:type() of
                {win32, _} ->
                    io:format("~ts",
                              [io_lib:format("已启动的地图总数: ~w~n", [N])]);
                _ ->
                    io:format("~ts", [io_lib:format("已启动的地图总数: ~w~n", [N])])
            end,
            case os:type() of
                {win32, _} ->
                    io:format("~ts",
                              [io_lib:format("---------------------------------------------"
                                             "---------------------------------------------"
                                             "---------------~n",
                                             [])]);
                _ ->
                    io:format("~ts",
                              [io_lib:format("---------------------------------------------"
                                             "---------------------------------------------"
                                             "---------------~n",
                                             [])])
            end,
            case os:type() of
                {win32, _} ->
                    io:format("~ts",
                              [io_lib:format("~10ts ~10ts ~15ts ~10ts ~100ts ~20ts~n",
                                             ["Map Id",
                                              "Base Id",
                                              "Pid",
                                              "Role Number",
                                              "Grid Info",
                                              "Name"])]);
                _ ->
                    io:format("~ts",
                              [io_lib:format("~10ts ~10ts ~15ts ~10ts ~100ts ~20ts~n",
                                             ["Map Id",
                                              "Base Id",
                                              "Pid",
                                              "Role Number",
                                              "Grid Info",
                                              "Name"])])
            end,
            F = fun (#map{id = Id, base_id = BaseId, name = Name,
                          pid = Pid, grid_info = GridInfo, num = Num},
                     _)
                        when Num >= Min ->
                        case os:type() of
                            {win32, _} ->
                                io:format("~ts",
                                          [io_lib:format("~10w ~10w ~15w ~10w ~100w ~20ts~n",
                                                         [Id,
                                                          BaseId,
                                                          Pid,
                                                          Num,
                                                          GridInfo,
                                                          Name])]);
                            _ ->
                                io:format("~ts",
                                          [io_lib:format("~10w ~10w ~15w ~10w ~100w ~20ts~n",
                                                         [Id,
                                                          BaseId,
                                                          Pid,
                                                          Num,
                                                          GridInfo,
                                                          Name])])
                        end;
                    (_, _) -> skip
                end,
            ets:foldl(F, 0, map_info)
    end,
    ok.

battle() ->
    case ets:info(battle, size) of
        undefined ->
            case os:type() of
                {win32, _} ->
                    io:format("~ts", [io_lib:format("战场管理器未启动~n", [])]);
                _ -> io:format("~ts", [io_lib:format("战场管理器未启动~n", [])])
            end;
        N ->
            case os:type() of
                {win32, _} ->
                    io:format("~ts", [io_lib:format("战场总数: ~w~n", [N])]);
                _ ->
                    io:format("~ts", [io_lib:format("战场总数: ~w~n", [N])])
            end,
            case os:type() of
                {win32, _} ->
                    io:format("~ts",
                              [io_lib:format("---------------------------------------------"
                                             "---------------------------------------------"
                                             "---------------~n",
                                             [])]);
                _ ->
                    io:format("~ts",
                              [io_lib:format("---------------------------------------------"
                                             "---------------------------------------------"
                                             "---------------~n",
                                             [])])
            end,
            F = fun (#battle{name = BName, type = Type}, L1) ->
                        case lists:keyfind(BName, 1, L1) of
                            {BName, Type, Num} ->
                                lists:keyreplace(BName,
                                                 1,
                                                 L1,
                                                 {BName, Type, Num + 1});
                            _ -> [{BName, Type, 1} | L1]
                        end
                end,
            L = ets:foldl(F, [], battle),
            case os:type() of
                {win32, _} ->
                    io:format("~ts",
                              [io_lib:format("~20ts ~20ts ~120ts~n",
                                             ["battle name", "type", "Num"])]);
                _ ->
                    io:format("~ts",
                              [io_lib:format("~20ts ~20ts ~120ts~n",
                                             ["battle name", "type", "Num"])])
            end,
            F1 = fun ({BattleName, Type, Num}) ->
                         case os:type() of
                             {win32, _} ->
                                 io:format("~ts",
                                           [io_lib:format("~20w ~20w ~120w~n",
                                                          [BattleName,
                                                           Type,
                                                           Num])]);
                             _ ->
                                 io:format("~ts",
                                           [io_lib:format("~20w ~20w ~120w~n",
                                                          [BattleName,
                                                           Type,
                                                           Num])])
                         end
                 end,
            lists:map(F1, L)
    end,
    ok.

count_proto(Pid) when is_list(Pid) ->
    count_proto(list_to_pid(Pid));
count_proto(Pid) when is_pid(Pid) ->
    {_, L} = erlang:process_info(Pid, messages),
    List = lists:foldl(fun ({send_data,
                             <<_:32, Proto:16, _/binary>>},
                            L1) ->
                               case lists:keyfind(Proto, 1, L1) of
                                   {Proto, N} ->
                                       lists:keyreplace(Proto,
                                                        1,
                                                        L1,
                                                        {Proto, N + 1});
                                   _ -> [{Proto, 1} | L1]
                               end;
                           (_, L1) -> L1
                       end,
                       [],
                       L),
    case os:type() of
        {win32, _} ->
            io:format("~ts",
                      [io_lib:format("~20ts ~20ts~n",
                                     ["Proto Code", "Num"])]);
        _ ->
            io:format("~ts",
                      [io_lib:format("~20ts ~20ts~n", ["Proto Code", "Num"])])
    end,
    Fun = fun ({Code, Num}) ->
                  case os:type() of
                      {win32, _} ->
                          io:format("~ts",
                                    [io_lib:format("~20w ~20w~n",
                                                   [Code, Num])]);
                      _ ->
                          io:format("~ts",
                                    [io_lib:format("~20w ~20w~n", [Code, Num])])
                  end
          end,
    lists:map(Fun, List),
    ok.

count_info(Pid) when is_list(Pid) ->
    count_info(list_to_pid(Pid));
count_info(Pid) when is_pid(Pid) ->
    {_, L} = erlang:process_info(Pid, messages),
    List = lists:foldl(fun (Info, L1) when is_tuple(Info) ->
                               Head = element(1, Info),
                               case lists:keyfind(Head, 1, L1) of
                                   {Head, N} ->
                                       lists:keyreplace(Head,
                                                        1,
                                                        L1,
                                                        {Head, N + 1});
                                   _ -> [{Head, 1} | L1]
                               end;
                           (_, L1) -> L1
                       end,
                       [],
                       L),
    case os:type() of
        {win32, _} ->
            io:format("~ts",
                      [io_lib:format("~150ts ~20ts~n",
                                     ["Info head", "Num"])]);
        _ ->
            io:format("~ts",
                      [io_lib:format("~150ts ~20ts~n", ["Info head", "Num"])])
    end,
    Fun = fun ({Code, Num}) ->
                  case os:type() of
                      {win32, _} ->
                          io:format("~ts",
                                    [io_lib:format("~150w ~20w~n",
                                                   [Code, Num])]);
                      _ ->
                          io:format("~ts",
                                    [io_lib:format("~150w ~20w~n",
                                                   [Code, Num])])
                  end
          end,
    lists:map(Fun, List),
    ok.

roles() -> roles(recv_cnt, 30).

roles(Num) when is_integer(Num) orelse Num =:= all ->
    roles(recv_cnt, Num);
roles(SortType) -> roles(SortType, 30).

roles(Sort, Num) ->
    case ets:info(role_cache, size) of
        undefined ->
            case os:type() of
                {win32, _} ->
                    io:format("~ts",
                              [io_lib:format("role_query模块未启动~n", [])]);
                _ ->
                    io:format("~ts",
                              [io_lib:format("role_query模块未启动~n", [])])
            end;
        N ->
            case os:type() of
                {win32, _} ->
                    io:format("~ts",
                              [io_lib:format("---------------------------------------------"
                                             "---------------------------------------------"
                                             "---------------------------------------------"
                                             "---------------------------------------------"
                                             "--~n",
                                             [])]);
                _ ->
                    io:format("~ts",
                              [io_lib:format("---------------------------------------------"
                                             "---------------------------------------------"
                                             "---------------------------------------------"
                                             "---------------------------------------------"
                                             "--~n",
                                             [])])
            end,
            case os:type() of
                {win32, _} ->
                    io:format("~ts",
                              [io_lib:format("~14ts ~14ts ~10ts ~10ts ~7ts ~5ts ~7ts "
                                             "~7ts ~6ts ~7ts ~7ts ~7ts ~7ts ~6ts ~6ts "
                                             "~6ts ~18ts ~20ts~n",
                                             ["RolePid",
                                              "ConnPid",
                                              "Rid",
                                              "Platform",
                                              "ZoneId",
                                              "Lev",
                                              "Mem(kb)",
                                              "Reds(k)",
                                              "MsgLen",
                                              "RecvAvg",
                                              "RecvCnt",
                                              "SendAvg",
                                              "SendCnt",
                                              "Status",
                                              "Action",
                                              "Event",
                                              "Account",
                                              "Name"])]);
                _ ->
                    io:format("~ts",
                              [io_lib:format("~14ts ~14ts ~10ts ~10ts ~7ts ~5ts ~7ts "
                                             "~7ts ~6ts ~7ts ~7ts ~7ts ~7ts ~6ts ~6ts "
                                             "~6ts ~18ts ~20ts~n",
                                             ["RolePid",
                                              "ConnPid",
                                              "Rid",
                                              "Platform",
                                              "ZoneId",
                                              "Lev",
                                              "Mem(kb)",
                                              "Reds(k)",
                                              "MsgLen",
                                              "RecvAvg",
                                              "RecvCnt",
                                              "SendAvg",
                                              "SendCnt",
                                              "Status",
                                              "Action",
                                              "Event",
                                              "Account",
                                              "Name"])])
            end,
            F = fun (#role_cache{pid = Pid, id = {Rid, P, Z},
                                 account = Acc, name = Name, lev = Lev,
                                 status = Status, s_action = Action,
                                 s_event = Event,
                                 link =
                                     #link{socket = Socket,
                                           conn_pid = ConnPid}},
                     {L, TotalMem}) ->
                        {RecvAvg, RecvCnt, SendAvg, SendCnt} = case
                                                                   inet:getstat(Socket,
                                                                                [recv_avg,
                                                                                 recv_cnt,
                                                                                 send_avg,
                                                                                 send_cnt])
                                                                   of
                                                                   {ok,
                                                                    [{_, Ra},
                                                                     {_, Rc},
                                                                     {_, Sa},
                                                                     {_,
                                                                      Sc}]} ->
                                                                       {Ra,
                                                                        Rc,
                                                                        Sa,
                                                                        Sc};
                                                                   _ ->
                                                                       {0,
                                                                        0,
                                                                        0,
                                                                        0}
                                                               end,
                        Mem = case process_info(Pid, memory) of
                                  {_, V1} -> V1 / 1024;
                                  _ -> 0
                              end,
                        Reds = case process_info(Pid, reductions) of
                                   {_, V2} -> round(V2 / 1000);
                                   _ -> 0
                               end,
                        MsgLen = case process_info(Pid, message_queue_len) of
                                     {_, V4} -> V4;
                                     _ -> 0
                                 end,
                        {[[Pid,
                           ConnPid,
                           Rid,
                           P,
                           Z,
                           Lev,
                           round(Mem),
                           Reds,
                           MsgLen,
                           RecvAvg,
                           RecvCnt,
                           SendAvg,
                           SendCnt,
                           Status,
                           Action,
                           Event,
                           Acc,
                           Name]
                          | L],
                         TotalMem + Mem}
                end,
            {L, TotalMemory} = ets:foldl(F, {[], 0}, role_cache),
            Nl = case Sort of
                     mem -> lists:sort(fun role_sort_mem/2, L);
                     reds -> lists:sort(fun role_sort_reds/2, L);
                     lev -> lists:sort(fun role_sort_lev/2, L);
                     send_cnt -> lists:sort(fun role_sort_send_cnt/2, L);
                     recv_cnt -> lists:sort(fun role_sort_recv_cnt/2, L);
                     _ -> lists:sort(fun role_sort_queue/2, L)
                 end,
            N1 = case is_integer(Num) of
                     true -> Num;
                     _ -> N
                 end,
            print_role(Nl, N1),
            case os:type() of
                {win32, _} ->
                    io:format("~ts",
                              [io_lib:format("---------------------------------------------"
                                             "---------------------------------------------"
                                             "---------------------------------------------"
                                             "---------------------------------------------"
                                             "--~n",
                                             [])]);
                _ ->
                    io:format("~ts",
                              [io_lib:format("---------------------------------------------"
                                             "---------------------------------------------"
                                             "---------------------------------------------"
                                             "---------------------------------------------"
                                             "--~n",
                                             [])])
            end,
            case os:type() of
                {win32, _} ->
                    io:format("~ts",
                              [io_lib:format("时间: ~w 在线角色总数: ~w 占用内存总数: ~w(mb) 可排序字段: "
                                             "mem, queue, reds, lev, send_cnt, recv_cnt~n",
                                             [erlang:localtime(),
                                              N,
                                              round(TotalMemory / 1024)])]);
                _ ->
                    io:format("~ts",
                              [io_lib:format("时间: ~w 在线角色总数: ~w 占用内存总数: ~w(mb) 可排序字段: "
                                             "mem, queue, reds, lev, send_cnt, recv_cnt~n",
                                             [erlang:localtime(),
                                              N,
                                              round(TotalMemory / 1024)])])
            end
    end.

role_sort_lev([_, _, _, _, _, A | _],
              [_, _, _, _, _, B | _])
    when A =< B ->
    false;
role_sort_lev(_, _) -> true.

role_sort_mem([_, _, _, _, _, _, A | _],
              [_, _, _, _, _, _, B | _])
    when A =< B ->
    false;
role_sort_mem(_, _) -> true.

role_sort_reds([_, _, _, _, _, _, _, A | _],
               [_, _, _, _, _, _, _, B | _])
    when A =< B ->
    false;
role_sort_reds(_, _) -> true.

role_sort_queue([_, _, _, _, _, _, _, _, A | _],
                [_, _, _, _, _, _, _, _, B | _])
    when A =< B ->
    false;
role_sort_queue(_, _) -> true.

role_sort_recv_cnt([_, _, _, _, _, _, _, _, _, _, A
                    | _],
                   [_, _, _, _, _, _, _, _, _, _, B | _])
    when A =< B ->
    false;
role_sort_recv_cnt(_, _) -> true.

role_sort_send_cnt([_,
                    _,
                    _,
                    _,
                    _,
                    _,
                    _,
                    _,
                    _,
                    _,
                    _,
                    _,
                    A
                    | _],
                   [_, _, _, _, _, _, _, _, _, _, _, _, B | _])
    when A =< B ->
    false;
role_sort_send_cnt(_, _) -> true.

print_role([], _N) -> ok;
print_role(_, 0) -> ok;
print_role([H | T], N) ->
    case os:type() of
        {win32, _} ->
            io:format("~ts",
                      [io_lib:format("~14w ~14w ~10w ~10s ~7w ~5w ~7w ~7w "
                                     "~6w ~7w ~7w ~7w ~7w ~6w ~6w ~6w ~18ts "
                                     "~20ts~n",
                                     H)]);
        _ ->
            io:format("~ts",
                      [io_lib:format("~14w ~14w ~10w ~10s ~7w ~5w ~7w ~7w "
                                     "~6w ~7w ~7w ~7w ~7w ~6w ~6w ~6w ~18ts "
                                     "~20ts~n",
                                     H)])
    end,
    print_role(T, N - 1).

role({pid, Pid}) ->
    NPid = case is_pid(Pid) of
               true -> Pid;
               _ -> list_to_pid(Pid)
           end,
    case ets:match_object(role_cache,
                          #role_cache{pid = NPid, _ = '_'})
        of
        [R = #role{}] -> do_role(R);
        _ -> ok
    end;
role({conn_pid, Pid}) ->
    NPid = case is_pid(Pid) of
               true -> Pid;
               _ -> list_to_pid(Pid)
           end,
    case ets:match_object(role_id_index,
                          #id_index{conn_pid = NPid, _ = '_'})
        of
        [#id_index{id = {Rid, P, Z}}] -> role(Rid, P, Z);
        _ -> ok
    end;
role(Rid) ->
    role(Rid, env:get(platform), env:get(zone_id)).

role(Rid, Platform, ZoneId) ->
    case role_query:cache(by_id, Rid, Platform, ZoneId) of
        {ok, R} -> do_role(R);
        _ ->
            case role_data:fetch(by_id, Rid, Platform, ZoneId) of
                {error, Reason} -> {error, Reason};
                {ok, R} -> do_role(R)
            end
    end.

do_role(#role{id = {Rid, P, Z}, name = Name, sex = Sex,
              classes = Classes, lev = Lev, realm = Realm, pos = Pos,
              status = Status, s_event = Event, s_action = Action}) ->
    case os:type() of
        {win32, _} ->
            io:format("~ts",
                      [io_lib:format("--- 角色信息 ------------------------------------"
                                     "---------------------------~n编号   : "
                                     "~w~n名称   : ~ts~n平台   : ~ts~n区号   : ~w~n性别 "
                                     "  : ~w~n职业   : ~ts~n等级   : ~w~n阵营   "
                                     ": ~w~n地点   : ~w~n状态   : ~w~n事件   : ~w~n动作 "
                                     "  : ~w~n-------------------------------------"
                                     "----------------------------------------~n",
                                     [Rid,
                                      Name,
                                      P,
                                      Z,
                                      Sex,
                                      role_misc:classes_to_text(Classes),
                                      Lev,
                                      Realm,
                                      Pos,
                                      Status,
                                      Event,
                                      Action])]);
        _ ->
            io:format("~ts",
                      [io_lib:format("--- 角色信息 ------------------------------------"
                                     "---------------------------~n编号   : "
                                     "~w~n名称   : ~ts~n平台   : ~ts~n区号   : ~w~n性别 "
                                     "  : ~w~n职业   : ~ts~n等级   : ~w~n阵营   "
                                     ": ~w~n地点   : ~w~n状态   : ~w~n事件   : ~w~n动作 "
                                     "  : ~w~n-------------------------------------"
                                     "----------------------------------------~n",
                                     [Rid,
                                      Name,
                                      P,
                                      Z,
                                      Sex,
                                      role_misc:classes_to_text(Classes),
                                      Lev,
                                      Realm,
                                      Pos,
                                      Status,
                                      Event,
                                      Action])])
    end.

r(Id, F, Pos) when is_integer(Id) ->
    r({by_id, Id, env:get(platform), env:get(zone_id)},
      F,
      Pos);
r({ByType, Id, P, Z}, F, Pos) ->
    case role_query:cache(ByType, Id, P, Z) of
        {ok, R} -> r(R, F, Pos);
        _ ->
            case role_data:fetch(ByType, Id, P, Z) of
                {error, Reason} -> {error, Reason};
                {ok, R} -> r(R, F, Pos)
            end
    end;
r(Role = #role{}, F, Pos) ->
    L = lists:zip([record_name | record_info(fields, role)],
                  tuple_to_list(Role)),
    Msg = case lists:keyfind(F, 1, L) of
              {_, Val} when Pos =:= 0 ->
                  util:fbin("~ts ==> ~w~n", [F, Val]);
              {_, Val} ->
                  util:fbin("~ts ==> ~w~n", [F, element(Pos, Val)]);
              _ -> <<"查找不到内容~n">>
          end,
    util:cn(Msg);
r(_R, _F, _Pos) -> error_args.

-spec top(Type, Start, Len) -> ProcList when Type ::
                                                 mem | queue | reds,
                                             Start :: pos_integer(),
                                             Len :: pos_integer(),
                                             ProcList :: list().

top(mem, Start, Len) -> do_top(memory, Start, Len);
top(queue, Start, Len) ->
    do_top(message_queue_len, Start, Len);
top(reds, Start, Len) -> do_top(reductions, Start, Len);
top(heap, Start, Len) ->
    do_top(total_heap_size, Start, Len).

-spec dump(info | procs | ip) -> ok | {error, term()}.

dump(info) ->
    case file:write_file("./system_info.txt",
                         erlang:system_info(info))
        of
        ok ->
            case os:type() of
                {win32, _} ->
                    io:format("~ts",
                              [io_lib:format("> 系统状态信息已经导出到文件:./system_info.txt~n",
                                             [])]);
                _ ->
                    io:format("~ts",
                              [io_lib:format("> 系统状态信息已经导出到文件:./system_info.txt~n",
                                             [])])
            end;
        Err -> Err
    end;
dump(procs) ->
    case file:write_file(env:get(root) ++ "/procs.txt",
                         erlang:system_info(procs))
        of
        ok ->
            case os:type() of
                {win32, _} ->
                    io:format("~ts",
                              [io_lib:format("> 所有进程的详细信息已经导出到文件:./procs.txt~n",
                                             [])]);
                _ ->
                    io:format("~ts",
                              [io_lib:format("> 所有进程的详细信息已经导出到文件:./procs.txt~n",
                                             [])])
            end;
        Err -> Err
    end;
dump(ip) ->
    L = lists:sort(fun sort_conn_times/2,
                   ets:tab2list(ip_mgr)),
    Nl = [io_lib:format("~18w ~12w ~12w ~12w~n",
                        [Ip, C, Mc, Ct])
          || #ip_info{ip = Ip, connected = C, max_conn = Mc,
                      conn_times = Ct}
                 <- L],
    Thead = io_lib:format("~18ts ~12ts ~12ts ~12ts~n",
                          ["IP addr", "connected", "max_conn", "conn_times"]),
    case file:write_file("ip_info.txt", [Thead | Nl]) of
        ok ->
            case os:type() of
                {win32, _} ->
                    io:format("~ts",
                              [io_lib:format("> 当前IP信息已经导出到文件:./ip_info.txt~n",
                                             [])]);
                _ ->
                    io:format("~ts",
                              [io_lib:format("> 当前IP信息已经导出到文件:./ip_info.txt~n",
                                             [])])
            end;
        Err -> Err
    end.

dump(top, Type) ->
    File = lists:concat([env:get(root),
                         "/top_",
                         Type,
                         ".txt"]),
    case file:open(File, [write]) of
        {ok, F} ->
            io:format(F,
                      "~20ts ~12ts ~12ts ~12ts ~12ts ~24ts "
                      "~36ts ~36ts~n",
                      ["Pid",
                       "memory(kb)",
                       "reds(k)",
                       "msg_len",
                       "t_heap_size",
                       "registered_name",
                       "initial_call",
                       "last_calls"]),
            Fun = fun (I, _) ->
                          io:format(F,
                                    "~20w ~12w ~12w ~12w ~12w ~24w ~36w ~36w~n",
                                    I),
                          ok
                  end,
            lists:foldl(Fun,
                        ignore,
                        lists:reverse(top(Type, 1, 10000))),
            file:close(F),
            case os:type() of
                {win32, _} ->
                    io:format("~ts",
                              [io_lib:format("> 排序后的进程信息已经导出到文件:./top_~ts.txt~n",
                                             [Type])]);
                _ ->
                    io:format("~ts",
                              [io_lib:format("> 排序后的进程信息已经导出到文件:./top_~ts.txt~n",
                                             [Type])])
            end;
        Err -> Err
    end;
dump(proc, P) when is_atom(P) -> dump(proc, whereis(P));
dump(proc, P) when is_list(P) ->
    dump(proc, list_to_pid(P));
dump(proc, P) when is_pid(P) ->
    N =
        lists:reverse(tl(lists:reverse(tl(pid_to_list(P))))),
    F = lists:concat([env:get(root), "/proc_", N, ".txt"]),
    case file:write_file(F,
                         io_lib:format("~p", [erlang:process_info(P)]))
        of
        ok ->
            case os:type() of
                {win32, _} ->
                    io:format("~ts",
                              [io_lib:format("> 进程~w的详细信息已经导出到文件:./proc_~ts.txt~n",
                                             [P, N])]);
                _ ->
                    io:format("~ts",
                              [io_lib:format("> 进程~w的详细信息已经导出到文件:./proc_~ts.txt~n",
                                             [P, N])])
            end;
        Err -> Err
    end;
dump(role, {Rid, Platform, ZoneId}) ->
    role_data:dump(Rid,
                   Platform,
                   ZoneId,
                   lists:concat([env:get(root),
                                 "/role_",
                                 Rid,
                                 "_",
                                 bitstring_to_list(Platform),
                                 "_",
                                 ZoneId,
                                 ".txt"])).

-spec eprof_start() -> ok.

eprof_start() -> eprof_start(pid, [self()]).

-spec eprof_start(T, Id) -> ok when T :: pid |
                                         role |
                                         map,
                                    Id :: PidList | RoleId | MapId,
                                    PidList :: list(),
                                    RoleId :: {pos_integer(), bitstring()},
                                    MapId :: pos_integer().

eprof_start(pid, Pids) ->
    case eprof:start_profiling(Pids) of
        profiling -> logger:info("eprof启动成功", [], info, 608);
        E -> logger:info("eprof启动失败: ~w", [E], info, 609)
    end;
eprof_start(role, {Rid, Platform, ZoneId}) ->
    case role_query:attr(by_id,
                         Rid,
                         Platform,
                         ZoneId,
                         [#role.pid, #role.link])
        of
        {ok, [Pid, #link{conn_pid = ConnPid}]} ->
            eprof_start(pid, [Pid, ConnPid]);
        _ ->
            logger:info("角色[Rid:~w SrvId:~w]不在线",
                        [Rid, ZoneId],
                        info,
                        614)
    end.

cprof() -> cprof(mod).

cprof(Mod) -> cprof(Mod, 10000).

cprof(mod, T) ->
    cprof:start(),
    util:sleep(T),
    Ret = cprof:analyse(),
    cprof:stop(),
    Ret;
cprof(f, T) ->
    {_, L} = cprof(mod, T),
    Fun = fun ({Mod, N, L1}, {L2, L3}) ->
                  {[{Mod, N} | L2], L3 ++ L1}
          end,
    {L4, L5} = lists:foldl(Fun, {[], []}, L),
    {lists:reverse(lists:keysort(2, L4)),
     lists:reverse(lists:keysort(2, L5))}.

-spec eprof_stop() -> ok.

eprof_stop() -> eprof_stop("eprof_analyze").

-spec eprof_stop(string()) -> ok.

eprof_stop(FileName) ->
    File = FileName ++ ".txt",
    eprof:stop_profiling(),
    eprof:log(File),
    eprof:analyze(total),
    logger:info("eprof分析结果已经输出到了:~ts", [File], info, 646).

-spec ptop(atom()) -> ok.

ptop(Type) -> ptop(Type, 1, 30).

-spec ptop(atom(), pos_integer(), pos_integer()) -> ok.

ptop(Type, Start, Len) ->
    L = top(Type, Start, Len),
    util:cn("~20ts ~12ts ~12ts ~12ts ~12ts ~48ts "
            "~36ts ~36ts~n",
            ["Pid",
             "memory(kb)",
             "reds(k)",
             "msg_len",
             "t_heap_size",
             "registered_name",
             "initial_call",
             "last_calls"]),
    print_top(lists:reverse(L)).

-spec unpack(binary() | list()) -> tuple().

unpack(L) when is_list(L) ->
    do_unpack(lists:flatten(L), []);
unpack(L) when is_binary(L) -> do_unpack([L], []).

do_unpack([], Data) -> lists:reverse(Data);
do_unpack([Bin | T], Data) ->
    D = unpack_bin(Bin),
    do_unpack(T, [D | Data]).

unpack_bin(Bin) ->
    <<Len:32/little, Code:16/little, Bin1/binary>> = Bin,
    case mapping:module(game_server, Code) of
        {ok, _, _Caller, Parser, _Mod} ->
            case catch Parser:unpack(cli, Code, Bin1) of
                {ok, Data} -> {Len, Code, Data};
                _ -> false
            end;
        _ -> false
    end.

unpack(Code, Bin) ->
    case mapping:module(game_server, Code) of
        {ok, _, _Caller, Parser, _Mod} ->
            case catch Parser:unpack(srv, Code, Bin) of
                {ok, Data} -> {Code, Data};
                _ -> false
            end;
        _ -> false
    end.

xref() ->
    Result = xref_runner:check(),
    util:cn("============================================="
            "============================================="
            "======================\n====================="
            "==========================分析结果==============="
            "===========================================\n"
            "|                 检查类型 |            "
            "                文件路径 |  行数 |        "
            "                         Mfa|~n"),
    lists:foreach(fun (#{check := CheckMod,
                         filename := FileName, line := Line,
                         source := Source}) ->
                          io:format("|~25w | ~35ts | ~5w | ~35ts|~n",
                                    [CheckMod,
                                     FileName,
                                     Line,
                                     util:to_list(Source)])
                  end,
                  Result),
    ok.

init([]) ->
    logger:info("[~w] 正在启动...", [info], info, 715),
    State = #state{},
    self() ! snapshoot,
    logger:info("[~w] 启动完成", [info], info, 718),
    {ok, State}.

handle_call(_Request, _From, State) -> {noreply, State}.

handle_cast(_Msg, State) -> {noreply, State}.

handle_info(snapshoot, State) ->
    case get(snapshoot) of
        true ->
            logger:info("正在输出系统状态快照信息:", [], info, 730),
            count_map(),
            ptop(mem),
            ptop(queue),
            i();
        _ -> skip
    end,
    erlang:send_after(10000, self(), snapshoot),
    {noreply, State};
handle_info(auto, State) ->
    put(snapshoot, get(snapshoot) =/= true),
    {noreply, State};
handle_info({set_check_memory, false, _GB}, State) ->
    logger:info("关闭自动检测内存", [], info, 748),
    put(check_memory, false),
    case get(check_memory_ref) of
        Ref when is_reference(Ref) ->
            catch erlang:cancel_timer(Ref);
        _ -> skip
    end,
    {noreply, State};
handle_info({set_check_memory, true, GB}, State) ->
    logger:info("开启自动检测内存,设置限制为~wGB", [GB], info, 757),
    put(check_memory, true),
    put(check_memory_limit, round(GB * 1073741824)),
    self() ! check_memory,
    {noreply, State};
handle_info(check_memory, State) ->
    MemUsed = erlang:memory(total),
    case get(check_memory_ref) of
        Ref when is_reference(Ref) ->
            catch erlang:cancel_timer(Ref);
        _ -> skip
    end,
    case get(check_memory_limit) of
        MemLimit when is_integer(MemLimit) ->
            case MemUsed > MemLimit of
                true ->
                    logger:info("============================================="
                                "==================",
                                [],
                                info,
                                777),
                    logger:info("当前使用内存:~w,限制内存:~w",
                                [MemUsed, MemLimit],
                                info,
                                778),
                    logger:info("============================================="
                                "==================",
                                [],
                                info,
                                779),
                    case top(mem, 1, 1) of
                        [[Pid,
                          Memory,
                          Reds,
                          MsgLen,
                          THeapSize,
                          RegName,
                          InitCall,
                          LastCall]
                         | _] ->
                            util:cn("~20ts ~12ts ~12ts ~12ts ~12ts ~48ts "
                                    "~36ts ~36ts~n",
                                    ["Pid",
                                     "memory(kb)",
                                     "reds(k)",
                                     "msg_len",
                                     "t_heap_size",
                                     "registered_name",
                                     "initial_call",
                                     "last_calls"]),
                            print_top(lists:reverse([[Pid,
                                                      Memory,
                                                      Reds,
                                                      MsgLen,
                                                      THeapSize,
                                                      RegName,
                                                      InitCall,
                                                      LastCall]])),
                            logger:info("============================================="
                                        "==================",
                                        [],
                                        info,
                                        785),
                            Result2 = p2(Pid),
                            logger:info("Result2:~w", [Result2], info, 787),
                            logger:info("============================================="
                                        "==================",
                                        [],
                                        info,
                                        788),
                            case get(check_memory) of
                                true ->
                                    NewRef = erlang:send_after(4000,
                                                               self(),
                                                               check_memory),
                                    put(check_memory_ref, NewRef);
                                _ -> skip
                            end,
                            ok;
                        _ ->
                            logger:error("无法获取最高内存进程", [], info, 798),
                            ok
                    end;
                false ->
                    case get(check_memory) of
                        true ->
                            NewRef = erlang:send_after(2000,
                                                       self(),
                                                       check_memory),
                            put(check_memory_ref, NewRef);
                        _ -> skip
                    end
            end;
        _Err ->
            logger:info("Err:~w", [_Err], info, 811),
            logger:error("没有设置警报内存，无法检测，请重新设置", [], info, 812),
            skip
    end,
    {noreply, State};
handle_info(_Info, State) -> {noreply, State}.

terminate(_Reason, _State) -> ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

print_top([]) -> ok;
print_top([H | T]) ->
    io:format("~20w ~12w ~12w ~12w ~12w ~48w ~36w ~36w~n",
              H),
    print_top(T).

do_top(Type, Start, Len) when Start > 0, Len > 0 ->
    L = do_top1(Type, erlang:processes(), []),
    NL = lists:sublist(L, Len),
    top_detail(NL, []).

do_top1(_Type, [], L) -> lists:sort(fun top_sort/2, L);
do_top1(Type, [P | Pids], L) ->
    NL = case process_info(P, Type) of
             {_, V} -> [{P, V} | L];
             _ -> L
         end,
    do_top1(Type, Pids, NL).

top_detail([], L) -> L;
top_detail([{P, _} | T], L) ->
    Mem = case process_info(P, memory) of
              {_, V1} -> trunc(V1 / 1024);
              _ -> undefined
          end,
    Reds = case process_info(P, reductions) of
               {_, V2} -> trunc(V2 / 1000);
               _ -> undefined
           end,
    InitCall = case process_info(P, initial_call) of
                   {_, V3} -> V3;
                   _ -> undefined
               end,
    MsgLen = case process_info(P, message_queue_len) of
                 {_, V4} -> V4;
                 _ -> undefined
             end,
    RegName = case process_info(P, registered_name) of
                  {_, V5} -> V5;
                  _ -> undefined
              end,
    LastCalls = case process_info(P, last_calls) of
                    {_, V6} -> V6;
                    _ -> undefined
                end,
    TotalHeapSize = case process_info(P, total_heap_size) of
                        {_, V7} -> V7;
                        _ -> undefined
                    end,
    top_detail(T,
               [[P,
                 Mem,
                 Reds,
                 MsgLen,
                 TotalHeapSize,
                 RegName,
                 InitCall,
                 LastCalls]
                | L]).

top_sort({_, A}, {_, B}) when A =< B -> false;
top_sort(_, _) -> true.

sort_conn_times(#ip_info{conn_times = C1},
                #ip_info{conn_times = C2})
    when C1 =< C2 ->
    false;
sort_conn_times(_, _) -> true.

