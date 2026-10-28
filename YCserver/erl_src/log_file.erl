-file("src/log/log_file.erl", 1).

-module(log_file).

-behaviour(gen_server).

-export([log/4, do_log/3]).

-export([info/2,
         cast/2,
         call/2,
         start_num/0,
         start_link/1]).

-export([init/1,
         handle_call/3,
         handle_cast/2,
         handle_info/2,
         terminate/2,
         code_change/3]).

-record(state,
        {zone = 1,
         file,
         file_name,
         rows = 0,
         all_rows = 0,
         time}).

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

-file("src/log/log_file.erl", 17).

-file("inc/timer.hrl", 1).

-record(timer,
        {id :: undefined | term(),
         timeout = 1000 :: pos_integer(),
         m :: undefined | atom(),
         f :: undefined | function() | atom(),
         a = [] :: [term()],
         times = 1 :: integer(),
         next_tick = 0 :: non_neg_integer(),
         set_time = 1 :: pos_integer()}).

-record(rtimer,
        {ref :: undefined | reference(),
         key :: undefined | reference(),
         timers = [] :: [#timer{}]}).

-record(s_timer,
        {ref :: undefined | reference(),
         timers = [] :: [#timer{}]}).

-file("src/log/log_file.erl", 18).

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

-file("src/log/log_file.erl", 19).

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

-file("src/log/log_file.erl", 20).

-file("inc/attr.hrl", 1).

-record(attr_base,
        {type = 0 :: non_neg_integer(),
         name = 0 :: pos_integer(),
         flag = 0 :: non_neg_integer(),
         calc_type = 0 :: non_neg_integer(),
         val = 0 :: non_neg_integer()}).

-record(attr,
        {ver = 3,
         fc = 0 :: non_neg_integer(),
         speed = 260 :: pos_integer(),
         hp_max = 0 :: non_neg_integer(),
         mp_max = 0 :: non_neg_integer(),
         atk_speed = 0 :: non_neg_integer(),
         phy_dmg = 0 :: non_neg_integer(),
         magic_dmg = 0 :: non_neg_integer(),
         phy_def = 0 :: non_neg_integer(),
         magic_def = 0 :: non_neg_integer(),
         crit = 0 :: non_neg_integer(),
         tenacity = 0 :: non_neg_integer(),
         accuracy = 0 :: non_neg_integer(),
         evasion = 0 :: non_neg_integer(),
         holy_dmg = 0 :: non_neg_integer(),
         crit_dmg = 0 :: non_neg_integer(),
         crit_dmg_def = 0 :: non_neg_integer(),
         dmg_ratio = 0 :: non_neg_integer(),
         def_ratio = 0 :: non_neg_integer(),
         enhance_control = 0 :: non_neg_integer(),
         anti_control = 0 :: non_neg_integer(),
         escape = 0 :: non_neg_integer(),
         anti_escape = 0 :: non_neg_integer(),
         capture = 0 :: non_neg_integer(),
         phy_def_ratio = 0 :: non_neg_integer(),
         magic_def_ratio = 0 :: non_neg_integer(),
         phy_accuracy = 0 :: non_neg_integer(),
         magic_accuracy = 0 :: non_neg_integer(),
         phy_evasion = 0 :: non_neg_integer(),
         magic_evasion = 0 :: non_neg_integer(),
         phy_crit = 0 :: non_neg_integer(),
         magic_crit = 0 :: non_neg_integer(),
         phy_tenacity = 0 :: non_neg_integer(),
         magic_tenacity = 0 :: non_neg_integer(),
         heal_val = 0 :: non_neg_integer(),
         heal_ratio = 0 :: non_neg_integer(),
         eff_heal_ratio = 0 :: non_neg_integer(),
         phy_dmg_ratio = 0 :: non_neg_integer(),
         magic_dmg_ratio = 0 :: non_neg_integer(),
         strength = 0,
         constitution = 0,
         magic = 0,
         agility = 0,
         endurance = 0,
         exp_ratio = 0}).

-record(attr_calc,
        {attr :: undefined | #attr{},
         attr_no_ratio :: undefined | #attr{},
         ratio :: undefined | #attr{},
         attr_no_fc :: undefined | #attr{},
         ratio_no_fc :: undefined | #attr{}}).

-record(m_attr_point,
        {ver = 2,
         ext_point = [],
         first_free = 0,
         valid_plan = 1,
         plan_data = [],
         change_plan_times = 0}).

-record(attr_point_plan,
        {index = 1 :: pos_integer(),
         plan_name = [],
         strength = 0 :: pos_integer(),
         constitution = 0 :: non_neg_integer(),
         magic = 0 :: non_neg_integer(),
         agility = 0 :: non_neg_integer(),
         endurance = 0 :: non_neg_integer(),
         pre_str = 0,
         pre_con = 0,
         pre_magic = 0,
         pre_agi = 0,
         pre_end = 0}).

-file("src/log/log_file.erl", 21).

log(Mod, Code, Data, Role) ->
    case log_cfg(Mod, Code, Data) of
        {ok, Title, Msg} -> do_log(Title, Msg, Role);
        _ -> ok
    end.

do_log(Title, Msg,
       #role{id = {Rid, P, Z}, name = Name, lev = Lev,
             attr = #attr{fc = Fc},
             assets =
                 #assets{gold = Gold, coin = Coin,
                         gold_bind = GoldBind}})
    when Lev > 10 ->
    Log =
        util:fbin("[name:~ts][id:~w,~ts,~w][lev:~w][fc:~w][gold:"
                  "~w][gold_bind:~w][coin:~w]~ts,~ts==>~w~n",
                  [Name,
                   Rid,
                   P,
                   Z,
                   Lev,
                   Fc,
                   Gold,
                   GoldBind,
                   Coin,
                   Title,
                   Msg,
                   get(role_gain_log_items)]),
    info(Rid, {write, Log}),
    ok;
do_log(_Title, _Msg, _Role) -> ok.

log_cfg(async, 0, {Mod = combat_end, Fun, _Args}) ->
    case get(role_gain_log_items) of
        [_ | _] ->
            {ok,
             "角色异步调用",
             util:flist("mod:~w, fun:~w", [Mod, Fun])};
        _ -> skip
    end;
log_cfg(sync, 0, {Mod = combat_end, Fun, _Args}) ->
    case get(role_gain_log_items) of
        [_ | _] ->
            {ok,
             "角色同步调用",
             util:flist("mod:~w, fun:~w", [Mod, Fun])};
        _ -> skip
    end;
log_cfg(async, 0, {Fun, _Args}) ->
    {ok,
     "角色异步调用",
     util:flist("mod:~w, fun:~w",
                [util:fun_from_mod(Fun), Fun])};
log_cfg(async, 0, {undefined, Fun, _Args}) ->
    {ok,
     "角色异步调用",
     util:flist("mod:~w, fun:~w",
                [util:fun_from_mod(Fun), Fun])};
log_cfg(async, 0, {Mod, Fun, _Args}) ->
    {ok,
     "角色异步调用",
     util:flist("mod:~w, fun:~w", [Mod, Fun])};
log_cfg(sync, 0, {Fun, _Args}) ->
    {ok,
     "角色同步调用",
     util:flist("mod:~w, fun:~w",
                [util:fun_from_mod(Fun), Fun])};
log_cfg(sync, 0, {undefined, Fun, _Args}) ->
    {ok,
     "角色同步调用",
     util:flist("mod:~w, fun:~w",
                [util:fun_from_mod(Fun), Fun])};
log_cfg(sync, 0, {Mod, Fun, _Args}) ->
    {ok,
     "角色同步调用",
     util:flist("mod:~w, fun:~w", [Mod, Fun])};
log_cfg(timer, 0,
        {#timer{id = Id, m = undefined, f = Fun}}) ->
    {ok,
     "角色定时调用",
     util:flist("id:~w, mod:~w, fun:~w",
                [Id, util:fun_from_mod(Fun), Fun])};
log_cfg(timer, 0,
        {#timer{id = Id, m = Mod, f = Fun}}) ->
    {ok,
     "角色定时调用",
     util:flist("id:~w, mod:~w, fun:~w", [Id, Mod, Fun])};
log_cfg(_Mod, Code, Data)
    when is_integer(Code) andalso Code >= 1000 ->
    case rpc_cfg:log_title(Code, Data) of
        S = [_ | _] ->
            {ok,
             S,
             util:flist("请求信息:~w,~w",
                        [Code, rpc_cfg:log_data(Code, Data)])};
        _ ->
            {ok,
             util:flist("未知协议_~w", [Code]),
             util:flist("请求信息:~w,~w",
                        [Code, rpc_cfg:log_data(Code, Data)])}
    end;
log_cfg(_Mod, _Code, _Data) -> false.

info(N, Info) -> get_proc(N) ! Info.

cast(N, Info) -> gen_server:cast(get_proc(N), Info).

call(N, Info) ->
    case catch gen_server:call(get_proc(N), Info, 10000) of
        {'EXIT', {timeout, _}} -> {error, timeout};
        {'EXIT', {noproc, _}} -> {error, noproc};
        {'EXIT', {normal, _}} -> {error, exit};
        {'EXIT', _Call_Err} -> {error, _Call_Err};
        _Call_Return -> _Call_Return
    end.

get_proc(1) -> log_file_1;
get_proc(2) -> log_file_2;
get_proc(3) -> log_file_3;
get_proc(4) -> log_file_4;
get_proc(5) -> log_file_5;
get_proc(6) -> log_file_6;
get_proc(7) -> log_file_7;
get_proc(8) -> log_file_8;
get_proc(9) -> log_file_9;
get_proc(10) -> log_file_10;
get_proc(11) -> log_file_11;
get_proc(12) -> log_file_12;
get_proc(13) -> log_file_13;
get_proc(14) -> log_file_14;
get_proc(15) -> log_file_15;
get_proc(16) -> log_file_16;
get_proc(17) -> log_file_17;
get_proc(18) -> log_file_18;
get_proc(19) -> log_file_19;
get_proc(20) -> log_file_20;
get_proc(N) when is_integer(N) ->
    get_proc(N rem 20 + 1);
get_proc(N) -> N.

start_num() -> start_num(20).

start_num(0) -> ok;
start_num(N) ->
    start_link(N),
    start_num(N - 1).

start_link(N) ->
    gen_server:start_link({local, get_proc(N)},
                          log_file,
                          [N],
                          []).

init([N]) ->
    logger:info("[~w] 正在启动...", [log_file], log_file, 116),
    process_flag(trap_exit, true),
    FullName = lists:concat(["./log_file",
                             "/log_",
                             N,
                             ".txt"]),
    {ok, F} = file:open(FullName,
                        [append, raw, {delayed_write, 16 * 1024, 2}]),
    State = #state{file = F, file_name = FullName,
                   zone = N},
    erlang:send_after(util:rand(800000, 900000),
                      self(),
                      loop),
    erlang:send_after(date:next_diff(5, 0, 0) * 1000,
                      self(),
                      del_file),
    erlang:send_after(60000 + N * 30, self(), reset_time),
    logger:info("[~w] 启动完成", [log_file], log_file, 124),
    {ok, State}.

handle_call(_Request, _From, State) -> {noreply, State}.

handle_cast(new_file, State) ->
    {noreply, new_file(State)};
handle_cast(_Msg, State) -> {noreply, State}.

handle_info({write, Content},
            State = #state{file = F, rows = Rows,
                           all_rows = AllRows, time = undefined}) ->
    {{Y, M, D}, {H, I, S}} = erlang:localtime(),
    Time = util:fbin("~w/~w/~w ~w:~w:~w=>",
                     [Y, M, D, H, I, S]),
    case file:write(F, <<Time/binary, Content/binary>>) of
        ok ->
            {noreply,
             State#state{rows = Rows + 1, all_rows = AllRows + 1,
                         time = Time}};
        Err ->
            logger:error("写日志操作失败: ~w", [Err], log_file, 143),
            {noreply, State#state{time = Time}}
    end;
handle_info({write, Content},
            State = #state{file = F, rows = Rows,
                           all_rows = AllRows, time = Time}) ->
    case file:write(F, <<Time/binary, Content/binary>>) of
        ok ->
            {noreply,
             State#state{rows = Rows + 1, all_rows = AllRows + 1}};
        Err ->
            logger:error("写日志操作失败: ~w", [Err], log_file, 150),
            {noreply, State}
    end;
handle_info(reset_time, State) ->
    erlang:send_after(60000, self(), reset_time),
    {noreply, State#state{time = undefined}};
handle_info(loop, State) ->
    erlang:send_after(1800 * 1000, self(), loop),
    {noreply, new_file(State)};
handle_info(del_file, State = #state{zone = 1}) ->
    Now = date:unixtime(),
    del_day_file(Now, 10),
    del_day_file(Now, 10 + 1),
    erlang:send_after(date:next_diff(5, 0, 0) * 1000,
                      self(),
                      del_file),
    {noreply, State};
handle_info(_Info, State) -> {noreply, State}.

terminate(_Reason, _State = #state{file = F}) ->
    logger:info("开始关闭", [], log_file, 176),
    file:close(F),
    logger:info("关闭完成", [], log_file, 178),
    ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

new_file(State = #state{rows = 0}) -> State;
new_file(State = #state{file = F, file_name = FullName,
                        zone = N}) ->
    case F of
        undefined -> ignore;
        _ -> file:close(F)
    end,
    {{Y, M, D}, {H, I, S}} = erlang:localtime(),
    TargetDir = lists:concat(["./log_file",
                              "/",
                              Y * 10000 + M * 100 + D]),
    TargetFile = lists:concat([TargetDir,
                               "/",
                               "log_",
                               N,
                               "_",
                               H,
                               "-",
                               I,
                               "-",
                               S,
                               ".txt"]),
    make_dir(TargetDir),
    Cmd = lists:concat(["mv ", FullName, " ", TargetFile]),
    os:cmd(Cmd),
    {ok, Nf} = file:open(FullName,
                         [append, raw, {delayed_write, 16 * 1024, 2}]),
    State#state{file = Nf, rows = 0}.

make_dir(Dir) ->
    case filelib:is_dir(Dir) of
        false -> file:make_dir(Dir);
        _ -> skip
    end.

del_day_file(Now, Days) ->
    Time = Now - Days * 86400,
    {{Y, M, D}, _} = date:seconds_to_datetime(Time),
    TargetDir = lists:concat(["./log_file",
                              "/",
                              Y * 10000 + M * 100 + D]),
    Cmd = lists:concat(["rm -rf ", TargetDir]),
    logger:info("删除日志文件:~ts", [TargetDir], log_file, 213),
    os:cmd(Cmd).

