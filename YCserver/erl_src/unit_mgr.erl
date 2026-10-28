-file("src/mod/unit/unit_mgr.erl", 1).

-module(unit_mgr).

-behaviour(gen_server).

-export([init/1,
         handle_call/3,
         handle_cast/2,
         handle_info/2,
         terminate/2,
         code_change/3]).

-export([start_link/0,
         fetch_ids/1,
         create/1,
         create/3,
         create/4,
         create/5,
         remove/1,
         remove/2,
         sync_remove/1,
         set_element/2,
         info/1,
         info/3,
         list/2,
         combat_info/1,
         remove_map_all/1,
         remove_map_all/2,
         list_map/1,
         clear_statue/0,
         clear_statue/2,
         update_statue/2,
         classes_to_statue_type/1,
         lookup_statue/1,
         commit_statue/2,
         async_create_unit/2,
         async_create_unit/1]).

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

-file("src/mod/unit/unit_mgr.erl", 41).

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

-file("src/mod/unit/unit_mgr.erl", 42).

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

-file("src/mod/unit/unit_mgr.erl", 43).

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

-file("src/mod/unit/unit_mgr.erl", 44).

-file("inc/looks.hrl", 1).

-file("src/mod/unit/unit_mgr.erl", 45).

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

-file("src/mod/unit/unit_mgr.erl", 46).

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

-file("src/mod/unit/unit_mgr.erl", 47).

-record(state, {next_id = 1000000}).

-spec start_link() -> {ok, pid()} | {error, term()}.

start_link() ->
    gen_server:start_link({local, unit_mgr},
                          unit_mgr,
                          [],
                          []).

-spec fetch_ids(pos_integer()) -> {ok, list()} |
                                  {error, term()}.

fetch_ids(Num) ->
    case catch gen_server:call(unit_mgr,
                               {fetch_ids, Num},
                               10000)
        of
        {'EXIT', {timeout, _}} -> {error, timeout};
        {'EXIT', {noproc, _}} -> {error, noproc};
        {'EXIT', {normal, _}} -> {error, exit};
        {'EXIT', _Call_Err} -> {error, _Call_Err};
        _Call_Return -> _Call_Return
    end.

create(UnitId, Base, Pos) ->
    create(UnitId, Base, Pos, [], "").

create(UnitId, Base, Pos, {evt, Evts}) ->
    create(UnitId, Base, Pos, Evts, "");
create(UnitId, Base, Pos, {disable, Disabled}) ->
    create(UnitId, Base, Pos, [], Disabled).

create({BattleId, Id},
       UnitBase = #unit_data{activity = 0}, Pos, Evts,
       Disabled) ->
    {ok, Unit} = unit_convert:to({unit,
                                  Pos,
                                  Evts,
                                  Disabled},
                                 UnitBase),
    create({BattleId, Id}, Unit);
create({BattleId, Id}, BaseId, Pos, Evts, Disabled) ->
    create(#{id => {BattleId, Id}, base_id => BaseId,
             pos => Pos, evts => Evts, disabled => Disabled});
create(BattleId, UnitBase = #unit_data{activity = 0},
       Pos, Evts, Disabled) ->
    case fetch_ids(1) of
        {error, Reason} -> {error, Reason};
        {ok, [Id]} ->
            {ok, Unit} = unit_convert:to({unit,
                                          Pos,
                                          Evts,
                                          Disabled},
                                         UnitBase),
            create({BattleId, Id}, Unit)
    end;
create(BattleId, UnitBase = #unit_data{activity = 1},
       Pos, Evts, Disabled) ->
    case fetch_ids(1) of
        {error, Reason} -> {error, Reason};
        {ok, [Id]} ->
            {ok, Unit} = unit_convert:to({unit,
                                          Pos,
                                          Evts,
                                          Disabled},
                                         UnitBase),
            unit:create({BattleId, Id}, Unit)
    end;
create(BattleId, BaseId, Pos, Evts, Disabled) ->
    create(#{battle_id => BattleId, base_id => BaseId,
             pos => Pos, evts => Evts, disabled => Disabled}).

create(Args = #{id := {BattleId, Id}, base_id := BaseId,
                pos := Pos}) ->
    Evts = maps:get(evts, Args, []),
    Disabled = maps:get(disabled, Args, []),
    case unit_data:get(BaseId) of
        {error, Reason} -> {error, Reason};
        UnitBase = #unit_data{activity = 0} ->
            {ok, Unit} = unit_convert:to({unit,
                                          Pos,
                                          Evts,
                                          Disabled},
                                         UnitBase),
            create({BattleId, Id}, Unit);
        UnitBase = #unit_data{activity = 1} ->
            {ok, Unit} = unit_convert:to({unit,
                                          Pos,
                                          Evts,
                                          Disabled},
                                         UnitBase),
            unit:create({BattleId, Id}, Unit)
    end;
create(Args = #{battle_id := BattleId,
                base_id := BaseId, pos := Pos}) ->
    Evts = maps:get(evts, Args, []),
    Disabled = maps:get(disabled, Args, []),
    Prop = maps:get(prop, Args, []),
    case unit_data:get(BaseId) of
        {error, Reason} -> {error, Reason};
        UnitBase = #unit_data{activity = 0} ->
            {ok, Unit} = unit_convert:to({unit,
                                          Pos,
                                          Evts,
                                          Disabled},
                                         UnitBase),
            case fetch_ids(1) of
                {error, Reason} -> {error, Reason};
                {ok, [Id]} ->
                    create({BattleId, Id}, Unit#unit{prop = Prop})
            end;
        UnitBase = #unit_data{activity = 1} ->
            {ok, Unit} = unit_convert:to({unit,
                                          Pos,
                                          Evts,
                                          Disabled},
                                         UnitBase),
            case fetch_ids(1) of
                {error, Reason} -> {error, Reason};
                {ok, [Id]} ->
                    unit:create({BattleId, Id}, Unit#unit{prop = Prop})
            end
    end.

async_create_unit(List, Msg) ->
    gen_server:cast(unit_mgr, {create_unit, List, Msg}).

async_create_unit(List) ->
    gen_server:cast(unit_mgr, {create_unit, List}).

-spec remove_map_all(MapId :: pos_integer()) -> ok.

remove_map_all(MapId) ->
    UnitL = list_map(MapId),
    remove(UnitL).

-spec remove_map_all(MapId :: pos_integer(),
                     Args :: list()) -> ok.

remove_map_all(MapId, Args) ->
    UnitL = list_map(MapId, Args),
    remove(UnitL).

-spec list_map(MapId :: non_neg_integer()) -> [#unit{}].

list_map(MapId) ->
    case catch ets:match_object(unit_info,
                                #unit{pos = #pos{map = MapId, _ = '_'},
                                      _ = '_'})
        of
        L = [_ | _] -> L;
        _Err -> []
    end.

list_map(MapId, {fun_type, FunType}) ->
    case catch ets:match_object(unit_info,
                                #unit{fun_type = FunType,
                                      pos = #pos{map = MapId, _ = '_'},
                                      _ = '_'})
        of
        L = [_ | _] -> L;
        _Err -> []
    end.

remove(MapId, BaseId) ->
    List = unit_mgr:list(MapId, BaseId),
    unit_mgr:remove(List).

-spec remove(Unit :: tuple() |
                     #unit{} |
                     [tuple() | #unit{}]) -> ok.

remove([]) -> ok;
remove([I | T]) ->
    remove(I),
    remove(T);
remove(#unit{pid = Pid}) when is_pid(Pid) ->
    unit:stop(Pid),
    ok;
remove(#unit{id = UnitId,
             pos = #pos{map_pid = MapPid}}) ->
    map:unit_leave(MapPid, UnitId),
    catch ets:delete(unit_info, UnitId),
    ok;
remove(UnitId) ->
    case info(UnitId) of
        {ok, #unit{pid = Pid}} when is_pid(Pid) ->
            unit:stop(Pid);
        {ok, #unit{pos = #pos{map_pid = MapPid}}} ->
            map:unit_leave(MapPid, UnitId),
            catch ets:delete(unit_info, UnitId);
        _E ->
            logger:error("无法删除的地图单位：~w ~w ~w",
                         [UnitId, _E, util:get_stacktrace()],
                         unit_mgr,
                         204)
    end,
    ok.

-spec sync_remove(Unit :: tuple() | #unit{}) -> ok |
                                                {error, any()}.

sync_remove(#unit{pid = Pid}) when is_pid(Pid) ->
    unit:sync_stop(Pid);
sync_remove(#unit{id = UnitId,
                  pos = #pos{map_pid = MapPid}}) ->
    map:unit_leave(MapPid, UnitId),
    catch ets:delete(unit_info, UnitId),
    ok;
sync_remove(UnitId) ->
    case info(UnitId) of
        {ok, #unit{pid = Pid}} when is_pid(Pid) ->
            unit:sync_stop(Pid);
        {ok, #unit{pos = #pos{map_pid = MapPid}}} ->
            map:unit_leave(MapPid, UnitId),
            catch ets:delete(unit_info, UnitId),
            ok;
        _E ->
            logger:error("无法删除的地图单位：~w", [_E], unit_mgr, 228),
            {error, null_unit}
    end.

combat_info(UnitId) ->
    case catch ets:lookup_element(unit_info,
                                  UnitId,
                                  #unit.combat_pid)
        of
        Pid when is_pid(Pid) -> {true, Pid};
        _ -> false
    end.

-spec info(UnitId) -> {ok, #unit{}} |
                      {error, not_found} when UnitId :: {pos_integer(),
                                                         pos_integer()} |
                                                        pos_integer().

info(UnitId) ->
    case catch ets:lookup(unit_info, UnitId) of
        [U] -> {ok, U};
        _ -> {error, not_found}
    end.

-spec info(bitstring(), non_neg_integer(),
           UnitId) -> {ok, #unit{}} |
                      {error, term()} when UnitId :: {pos_integer(),
                                                      pos_integer()} |
                                                     pos_integer().

info(Platform, ZoneId = 9999, UnitId) ->
    big_world:call(Platform,
                   ZoneId,
                   unit_mgr,
                   info,
                   [UnitId]);
info(Platform, ZoneId, UnitId) ->
    cross:call(Platform, ZoneId, unit_mgr, info, [UnitId]).

-spec list(MapId :: non_neg_integer(),
           UnitBaseId :: non_neg_integer()) -> [#unit{}].

list(MapId, UnitBaseId) ->
    case catch ets:match_object(unit_info,
                                #unit{base_id = UnitBaseId,
                                      pos = #pos{map = MapId, _ = '_'},
                                      _ = '_'})
        of
        L = [_ | _] -> L;
        _Err -> []
    end.

set_element(UnitPid, ElemPos) when is_pid(UnitPid) ->
    UnitPid ! {set_element, ElemPos},
    ok;
set_element(#unit{pid = Pid}, ElemPos)
    when is_pid(Pid) ->
    Pid ! {set_element, ElemPos},
    ok;
set_element(Unit = #unit{}, ElemPos) ->
    NewU = unit:set_element(Unit, ElemPos),
    catch ets:insert(unit_info, NewU),
    ok;
set_element(UnitId, ElemPos) ->
    case unit_mgr:info(UnitId) of
        {ok, #unit{pid = Pid}} when is_pid(Pid) ->
            Pid ! {set_element, ElemPos};
        {ok, U = #unit{}} ->
            NewU = unit:set_element(U, ElemPos),
            catch ets:insert(unit_info, NewU);
        _ -> ok
    end,
    ok.

lookup_statue(Type) ->
    case catch ets:lookup(unit_statue_cache, Type) of
        [UnitStatue = #unit_statue{}] -> {ok, UnitStatue};
        [] -> null;
        _Err ->
            logger:error("无法找到雕像角色数据:~w", [_Err], unit_mgr, 304),
            {false, _Err}
    end.

clear_statue() ->
    gen_server:cast(unit_mgr, clear_statue).

clear_statue(Classes, StateType) ->
    gen_server:cast(unit_mgr,
                    {clear_statue, Classes, StateType}).

update_statue(Type,
              {{Rid, P, Z}, Name, Lev, Classes, Sex, Looks}) ->
    Looks1 = [{LooksType, LooksMode, LooksVal, LooksStr}
              || {LooksType, LooksMode, LooksVal, LooksStr} <- Looks,
                 lists:member(LooksType, [1, 2, 3, 4, 6])],
    UnitStatue = #unit_statue{type = Type, id = {Rid, P, Z},
                              name = Name, lev = Lev, classes = Classes,
                              sex = Sex, looks = Looks1},
    gen_server:cast(unit_mgr, {update_statue, UnitStatue}).

commit_statue(#role{id = {Rid, P, Z}, name = Name,
                    lev = Lev, classes = Classes, sex = Sex,
                    s_looks = Looks},
              Type) ->
    Looks1 = [{LooksType, LooksMode, LooksVal, LooksStr}
              || {LooksType, LooksMode, LooksVal, LooksStr} <- Looks,
                 lists:member(LooksType, [1, 2, 3, 4, 6])],
    UnitStatue = #unit_statue{type = Type, id = {Rid, P, Z},
                              name = Name, lev = Lev, classes = Classes,
                              sex = Sex, looks = Looks1},
    gen_server:cast(unit_mgr,
                    {commit_statue, Type, {Rid, P, Z}, UnitStatue}).

init([]) ->
    logger:info("[~w] 正在启动...", [unit_mgr], unit_mgr, 334),
    process_flag(trap_exit, true),
    ets:new(unit_info,
            [set, named_table, public, {keypos, #unit.id}]),
    State = #state{},
    dets:open_file(unit_statue,
                   [{file, "./dets/unit_statue.dets"},
                    {type, set},
                    {keypos, #unit_statue.type}]),
    ets:new(unit_statue_cache,
            [set,
             named_table,
             public,
             {keypos, #unit_statue.type}]),
    dets:to_ets(unit_statue, unit_statue_cache),
    erlang:send_after(10 * 1000, self(), load_statue),
    logger:info("[~w] 启动完成...", [unit_mgr], unit_mgr, 342),
    {ok, State}.

handle_call({fetch_ids, Num}, _From,
            State = #state{next_id = NextId}) ->
    {reply,
     {ok, lists:seq(NextId, NextId + Num - 1)},
     State#state{next_id = NextId + Num}};
handle_call(_Request, _From, State) -> {noreply, State}.

handle_cast({update_statue, UnitStatue}, State) ->
    catch do_update_statue(UnitStatue),
    {noreply, State};
handle_cast({create_unit, List, Msg}, State) ->
    catch [create(Id, Unit) || {Id, Unit} <- List],
    notice:cast(all, 4, Msg),
    {noreply, State};
handle_cast({create_unit, List}, State) ->
    catch [create(Id, Unit) || {Id, Unit} <- List],
    {noreply, State};
handle_cast({commit_statue, Type, RoleId, UnitStatue},
            State) ->
    case lookup_statue(Type) of
        {ok, UnitStatue} -> skip;
        {ok, #unit_statue{id = RoleId}} ->
            catch do_update_statue(UnitStatue);
        _ -> skip
    end,
    {noreply, State};
handle_cast(clear_statue, State) ->
    catch do_clear_statue(),
    {noreply, State};
handle_cast({clear_statue, Classes, StateType},
            State) ->
    catch do_clear_statue(Classes, StateType),
    {noreply, State};
handle_cast(_Msg, State) -> {noreply, State}.

handle_info(load_statue, State) ->
    logger:debug("加载主城雕像数据", [], unit_mgr, 393),
    load_statue(),
    erlang:send_after(60 * 1000,
                      self(),
                      notice_role_update_statue),
    {noreply, State};
handle_info(notice_role_update_statue, State) ->
    do_notice_role_update_statue(),
    erlang:send_after(60 * 1000,
                      self(),
                      notice_role_update_statue),
    {noreply, State};
handle_info(_Info, State) -> {noreply, State}.

terminate(_Reason, _State) ->
    logger:info("[~w] 正在关闭...", [unit_mgr], unit_mgr, 408),
    logger:info("[~w] 关闭完成", [unit_mgr], unit_mgr, 409),
    ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

create(Id,
       Unit = #unit{base_id = _BaseId,
                    pos = Pos = #pos{map = MapId}}) ->
    U = Unit#unit{id = Id},
    {ok, MapUnit} = unit_convert:to(map_unit, U),
    case map:unit_enter(MapId, MapUnit) of
        error ->
            logger:error("单位[~w]进入地图[~w]失败",
                         [_BaseId, MapId],
                         unit_mgr,
                         424),
            {error, enter_map_failed};
        {ok, MapBaseId, MapPid, GridPid} ->
            NewU = U#unit{pos =
                              Pos#pos{map_base_id = MapBaseId, map_pid = MapPid,
                                      map_grid_pid = GridPid}},
            catch ets:insert(unit_info, NewU),
            {ok, NewU}
    end.

load_statue() ->
    load_statue(20),
    load_statue(21),
    load_statue(22),
    load_statue(23),
    load_statue(24),
    load_statue(66),
    load_statue(85).

load_statue(Type) ->
    UnitId = {1, Type},
    case lookup_statue(Type) of
        {ok,
         #unit_statue{name = Name, lev = Lev, classes = Classes,
                      sex = Sex, looks = Looks}} ->
            FilterLooks = looks:check_looks(Looks),
            ElemPos = [{#unit.name, Name},
                       {#unit.lev, Lev},
                       {#unit.classes, Classes},
                       {#unit.looks, FilterLooks},
                       {#unit.sex, Sex}],
            unit_mgr:set_element(UnitId, ElemPos),
            ok;
        null -> ok;
        _Err ->
            logger:error("查询雕像类型[~w]所属角色数据失败:~w",
                         [Type, _Err],
                         unit_mgr,
                         453),
            ok
    end.

do_notice_role_update_statue() ->
    do_notice_role_update_statue(20),
    do_notice_role_update_statue(21),
    do_notice_role_update_statue(22),
    do_notice_role_update_statue(23),
    do_notice_role_update_statue(24),
    do_notice_role_update_statue(66),
    do_notice_role_update_statue(85).

do_notice_role_update_statue(Type) ->
    case lookup_statue(Type) of
        {ok, #unit_statue{id = RoleId}} ->
            case role_query:pid(by_id, RoleId) of
                {ok, Pid} ->
                    role:apply(async,
                               Pid,
                               {unit_mgr, commit_statue, [Type]});
                _ -> ok
            end;
        _ -> ok
    end.

do_update_statue(UnitStatue = #unit_statue{type = Type,
                                           name = Name, lev = Lev,
                                           classes = Classes, sex = Sex,
                                           looks = Looks}) ->
    UnitId = {1, Type},
    case unit_mgr:info(UnitId) of
        {ok, #unit{}} ->
            ElemPos = [{#unit.name, Name},
                       {#unit.lev, Lev},
                       {#unit.classes, Classes},
                       {#unit.sex, Sex},
                       {#unit.looks, Looks}],
            unit_mgr:set_element(UnitId, ElemPos),
            ets:insert(unit_statue_cache, UnitStatue),
            dets:insert(unit_statue, UnitStatue),
            ok;
        _Err ->
            logger:error("更新雕像时,无法找到对应雕像单位:~w",
                         [_Err],
                         unit_mgr,
                         492),
            ok
    end.

do_clear_statue() ->
    ElemPos = [{#unit.name, ""},
               {#unit.lev, 0},
               {#unit.classes, 0},
               {#unit.sex, 0},
               {#unit.looks, []}],
    UnitId2 = {1, 20},
    UnitId3 = {1, 21},
    UnitId4 = {1, 22},
    UnitId5 = {1, 23},
    UnitId6 = {1, 24},
    UnitId7 = {1, 66},
    UnitId8 = {1, 85},
    unit_mgr:set_element(UnitId2, ElemPos),
    unit_mgr:set_element(UnitId3, ElemPos),
    unit_mgr:set_element(UnitId4, ElemPos),
    unit_mgr:set_element(UnitId5, ElemPos),
    unit_mgr:set_element(UnitId6, ElemPos),
    unit_mgr:set_element(UnitId7, ElemPos),
    unit_mgr:set_element(UnitId8, ElemPos),
    ets:delete_all_objects(unit_statue_cache),
    dets:delete_all_objects(unit_statue),
    ok.

do_clear_statue(Classes, StatueType) ->
    ElemPos = [{#unit.name, ""},
               {#unit.lev, 0},
               {#unit.classes, 0},
               {#unit.sex, 0},
               {#unit.looks, []}],
    UnitId = case Classes of
                 1 -> {1, 20};
                 2 -> {1, 21};
                 3 -> {1, 22};
                 4 -> {1, 23};
                 5 -> {1, 24};
                 6 -> {1, 66};
                 7 -> {1, 85};
                 _ -> {1, 0}
             end,
    unit_mgr:set_element(UnitId, ElemPos),
    ets:delete(unit_statue_cache, StatueType),
    dets:delete(unit_statue, StatueType),
    ok.

classes_to_statue_type(Classes) ->
    case Classes of
        1 -> 20;
        2 -> 21;
        3 -> 22;
        4 -> 23;
        5 -> 24;
        6 -> 66;
        7 -> 85;
        _ -> 20
    end.

