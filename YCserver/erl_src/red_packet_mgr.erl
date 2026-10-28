-file("src/mod/redpacket/red_packet_mgr.erl", 1).

-module(red_packet_mgr).

-behaviour(gen_server).

-export([init/1,
         handle_call/3,
         handle_cast/2,
         handle_info/2,
         terminate/2,
         code_change/3]).

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

-file("src/mod/redpacket/red_packet_mgr.erl", 12).

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

-file("src/mod/redpacket/red_packet_mgr.erl", 13).

-file("inc/red_packet.hrl", 1).

-record(red_packet,
        {ver = 1,
         id = {0, "", 0},
         name = "",
         lev = 0,
         classes = 0,
         sex = 0,
         type = 1,
         title = "" :: string(),
         assets_type = 0,
         amount = 0 :: non_neg_integer(),
         remain = 0 :: non_neg_integer(),
         total = 0 :: non_neg_integer(),
         num = 0 :: non_neg_integer(),
         time = 0 :: non_neg_integer(),
         packs = [],
         log = [] :: list(),
         has_soul = 0}).

-record(red_packet_grab_log,
        {id = {0, "", 0},
         name = "",
         lev = 0,
         classes = 0,
         sex = 0,
         time = 0,
         value = 0,
         is_item = 0}).

-file("src/mod/redpacket/red_packet_mgr.erl", 14).

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

-file("src/mod/redpacket/red_packet_mgr.erl", 15).

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

-file("src/mod/redpacket/red_packet_mgr.erl", 16).

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

-file("src/mod/redpacket/red_packet_mgr.erl", 17).

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

-file("src/mod/redpacket/red_packet_mgr.erl", 18).

-record(state, {rp_unit_list = [], rain_ref = []}).

-export([start_link/0,
         info/1,
         cast/1,
         call/1,
         get_red_packet/1,
         get_red_packet_list/1,
         get_rain_packet_count/0]).

start_link() ->
    gen_server:start_link({local, red_packet_mgr},
                          red_packet_mgr,
                          [],
                          []).

call(Msg) ->
    case catch gen_server:call(red_packet_mgr, Msg, 10000)
        of
        {'EXIT', {timeout, _}} -> {error, timeout};
        {'EXIT', {noproc, _}} -> {error, noproc};
        {'EXIT', {normal, _}} -> {error, exit};
        {'EXIT', _Call_Err} -> {error, _Call_Err};
        _Call_Return -> _Call_Return
    end.

info(Msg) -> red_packet_mgr ! Msg.

cast(Msg) -> gen_server:cast(red_packet_mgr, Msg).

init([]) ->
    logger:info("~ts正在启动...",
                [red_packet_mgr],
                red_packet_mgr,
                53),
    dets:open_file(red_packet_list,
                   [{file, "./dets/red_packet_list.dets"},
                    {keypos, #red_packet.id},
                    {type, set}]),
    ets:new(red_packet_list,
            [set, named_table, public, {keypos, #red_packet.id}]),
    dets:to_ets(red_packet_list, red_packet_list),
    ValidCheckRef = erlang:send_after(1800000,
                                      self(),
                                      valid_check),
    put(valid_check_ref, ValidCheckRef),
    State = #state{},
    {ok, State}.

handle_call({query_packet, RoleId}, _From, State) ->
    logger:debug("查询红包信息", [], red_packet_mgr, 68),
    Reply = get_red_packet(RoleId),
    {reply, Reply, State};
handle_call({grab_red_packet,
             GrabRoleId,
             GrabName,
             GrabLev,
             GrabClasses,
             GrabSex,
             RedPacketId},
            _From, State) ->
    Reply = case get_red_packet(RedPacketId) of
                {ok, #red_packet{num = Num}} when Num =< 0 ->
                    {false, lang:get("红包已经抢完了")};
                {ok,
                 RedPacket = #red_packet{name = SendName, packs = Packs,
                                         num = Num, remain = Remain,
                                         log = Log}} ->
                    case lists:keymember(GrabRoleId,
                                         #red_packet_grab_log.id,
                                         Log)
                        of
                        true -> {false, lang:get("您已经打开过此红包了")};
                        _ ->
                            Reward = util:rand_list(Packs),
                            NewPacks = Packs -- [Reward],
                            RedPacket1 = RedPacket#red_packet{packs = NewPacks},
                            Now = date:unixtime(),
                            RedPacket2 = case Reward of
                                             [{_, RewardVal}] ->
                                                 GrabLog =
                                                     #red_packet_grab_log{id =
                                                                              GrabRoleId,
                                                                          name =
                                                                              GrabName,
                                                                          lev =
                                                                              GrabLev,
                                                                          classes
                                                                              =
                                                                              GrabClasses,
                                                                          sex =
                                                                              GrabSex,
                                                                          value
                                                                              =
                                                                              RewardVal,
                                                                          is_item
                                                                              =
                                                                              0,
                                                                          time =
                                                                              Now},
                                                 NewLog = [GrabLog | Log],
                                                 RedPacket1#red_packet{remain =
                                                                           Remain
                                                                               -
                                                                               RewardVal,
                                                                       log =
                                                                           NewLog};
                                             [{_, _, _ItemId},
                                              {_, RewardVal}] ->
                                                 NoticeMsg1 =
                                                     notice:format(lang:get("~ts伸出神圣之手从~ts的红包里摸出了~ts！真是羡煞旁人{face_1, "
                                                                            "31}"),
                                                                   [{role_2,
                                                                     GrabName},
                                                                    {role_2,
                                                                     SendName},
                                                                    {item_2,
                                                                     [{23213,
                                                                       1}]}]),
                                                 notice:cast(all,
                                                             5,
                                                             NoticeMsg1),
                                                 GrabLog =
                                                     #red_packet_grab_log{id =
                                                                              GrabRoleId,
                                                                          name =
                                                                              GrabName,
                                                                          lev =
                                                                              GrabLev,
                                                                          classes
                                                                              =
                                                                              GrabClasses,
                                                                          sex =
                                                                              GrabSex,
                                                                          value
                                                                              =
                                                                              RewardVal,
                                                                          is_item
                                                                              =
                                                                              1,
                                                                          time =
                                                                              Now},
                                                 NewLog = [GrabLog | Log],
                                                 RedPacket1#red_packet{remain =
                                                                           Remain
                                                                               -
                                                                               RewardVal,
                                                                       log =
                                                                           NewLog};
                                             _Err ->
                                                 logger:error("错误的红包开奖产出：~w",
                                                              [_Err],
                                                              red_packet_mgr,
                                                              97),
                                                 RedPacket1
                                         end,
                            Now = date:unixtime(),
                            RedPacket3 = RedPacket2#red_packet{num = Num - 1,
                                                               time = Now},
                            case Num =:= 1 of
                                true ->
                                    LuckyerName = get_luckyer_name(RedPacket3),
                                    NoticeMsg2 =
                                        notice:format(lang:get("~ts的红包被一抢而空，~ts幸运爆棚，成为运气王！恭喜恭喜{face_1, "
                                                               "31}"),
                                                      [{role_2, SendName},
                                                       {role_2, LuckyerName}]),
                                    notice:cast(all, 5, NoticeMsg2);
                                false -> ok
                            end,
                            save_red_packet(RedPacket3),
                            {ok, Reward}
                    end;
                _ -> {false, lang:get("该红包已经过期了")}
            end,
    {reply, Reply, State};
handle_call({grab_rain_packet,
             GrabRoleId,
             GrabName,
             GrabLev,
             GrabClasses,
             GrabSex,
             UnitId},
            _From,
            State = #state{rp_unit_list = RedPacketUnitList}) ->
    Reply = case lists:keyfind({48, UnitId},
                               1,
                               RedPacketUnitList)
                of
                {_, RedPacketId} ->
                    case get_red_packet(RedPacketId) of
                        {ok, #red_packet{num = Num}} when Num =< 0 ->
                            {false, lang:get("红包已经抢完了")};
                        {ok,
                         RedPacket = #red_packet{name = SendName, packs = Packs,
                                                 num = Num, remain = Remain,
                                                 log = Log}} ->
                            case lists:keymember(GrabRoleId,
                                                 #red_packet_grab_log.id,
                                                 Log)
                                of
                                true -> {false, lang:get("您已经打开过此红包了")};
                                _ ->
                                    Reward = util:rand_list(Packs),
                                    NewPacks = Packs -- [Reward],
                                    RedPacket1 = RedPacket#red_packet{packs =
                                                                          NewPacks},
                                    Now = date:unixtime(),
                                    RedPacket2 = case Reward of
                                                     [{_, RewardVal}] ->
                                                         GrabLog =
                                                             #red_packet_grab_log{id
                                                                                      =
                                                                                      GrabRoleId,
                                                                                  name
                                                                                      =
                                                                                      GrabName,
                                                                                  lev
                                                                                      =
                                                                                      GrabLev,
                                                                                  classes
                                                                                      =
                                                                                      GrabClasses,
                                                                                  sex
                                                                                      =
                                                                                      GrabSex,
                                                                                  value
                                                                                      =
                                                                                      RewardVal,
                                                                                  is_item
                                                                                      =
                                                                                      0,
                                                                                  time
                                                                                      =
                                                                                      Now},
                                                         NewLog = [GrabLog
                                                                   | Log],
                                                         RedPacket1#red_packet{remain
                                                                                   =
                                                                                   Remain
                                                                                       -
                                                                                       RewardVal,
                                                                               log
                                                                                   =
                                                                                   NewLog};
                                                     [{_, _, _ItemId},
                                                      {_, RewardVal}] ->
                                                         NoticeMsg1 =
                                                             notice:format(lang:get("~ts的红包被一抢而空，~ts抢到了红包里的~ts！真是好运连连{face_1, "
                                                                                    "31}"),
                                                                           [{role_2,
                                                                             SendName},
                                                                            {role_2,
                                                                             GrabName},
                                                                            {item_2,
                                                                             [{23213,
                                                                               1}]}]),
                                                         notice:cast(all,
                                                                     5,
                                                                     NoticeMsg1),
                                                         GrabLog =
                                                             #red_packet_grab_log{id
                                                                                      =
                                                                                      GrabRoleId,
                                                                                  name
                                                                                      =
                                                                                      GrabName,
                                                                                  lev
                                                                                      =
                                                                                      GrabLev,
                                                                                  classes
                                                                                      =
                                                                                      GrabClasses,
                                                                                  sex
                                                                                      =
                                                                                      GrabSex,
                                                                                  value
                                                                                      =
                                                                                      RewardVal,
                                                                                  is_item
                                                                                      =
                                                                                      1,
                                                                                  time
                                                                                      =
                                                                                      Now},
                                                         NewLog = [GrabLog
                                                                   | Log],
                                                         RedPacket1#red_packet{remain
                                                                                   =
                                                                                   Remain
                                                                                       -
                                                                                       RewardVal,
                                                                               log
                                                                                   =
                                                                                   NewLog};
                                                     _Err ->
                                                         logger:error("错误的红包产出:~w",
                                                                      [_Err],
                                                                      red_packet_mgr,
                                                                      146),
                                                         RedPacket1
                                                 end,
                                    Now = date:unixtime(),
                                    RedPacket3 = RedPacket2#red_packet{num =
                                                                           Num -
                                                                               1,
                                                                       time =
                                                                           Now},
                                    case Num =:= 1 of
                                        true ->
                                            LuckyerName =
                                                get_luckyer_name(RedPacket3),
                                            NoticeMsg2 =
                                                notice:format(lang:get("~ts的红包被一抢而空，~ts幸运爆棚，获得运气王！恭喜恭喜{face_1, "
                                                                       "31}"),
                                                              [{role_2,
                                                                SendName},
                                                               {role_2,
                                                                LuckyerName}]),
                                            notice:cast(all, 5, NoticeMsg2);
                                        false -> ok
                                    end,
                                    save_red_packet(RedPacket3),
                                    {ok, Reward, RedPacketId}
                            end;
                        _ -> {false, lang:get("该红包已经过期了")}
                    end;
                _ -> {false, lang:get("手慢了，红包已经被拆开了")}
            end,
    NewState = case Reply of
                   {false, _} -> State;
                   _ ->
                       unit_mgr:remove({48, UnitId}),
                       NewRedPacketUnitList = lists:keydelete({48, UnitId},
                                                              1,
                                                              RedPacketUnitList),
                       State#state{rp_unit_list = NewRedPacketUnitList}
               end,
    {reply, Reply, NewState};
handle_call(_Request, _From, State) -> {noreply, State}.

handle_cast({send_red_packet,
             RedPacket = #red_packet{id = PacketId, name = SendName,
                                     type = PacketType}},
            State = #state{rain_ref = RainRefList}) ->
    save_red_packet(RedPacket),
    NewState = case PacketType of
                   3 ->
                       MapId = util:rand_list([10002,
                                               10007,
                                               10004,
                                               10003,
                                               10001]),
                       MapName = case map_data:get(MapId) of
                                     {ok, #map_data{name = _Name}} -> _Name;
                                     _ -> lang:get("各地")
                                 end,
                       NoticeMsg =
                           notice:format(lang:get("~ts为大家准备一份红包大礼，将在~ts后于~ts撒下红包雨，大家做好准备{face_1, 7}"),
                                         [{role_2, SendName},
                                          {string_2, 4, lang:get("1分钟")},
                                          {string_2, 4, MapName}]),
                       notice:cast(all, 10, NoticeMsg),
                       notice:cast(all, 11, NoticeMsg),
                       RainRef = erlang:send_after(60000,
                                                   self(),
                                                   {create_red_packet_unit,
                                                    RedPacket,
                                                    MapId}),
                       NewRainRefList = [{PacketId, RainRef} | RainRefList],
                       State#state{rain_ref = NewRainRefList};
                   _ ->
                       role_group:pack_send(world, 18501, {RedPacket}),
                       State
               end,
    {noreply, NewState};
handle_cast({repetition_send, RoleId}, State) ->
    case get_red_packet(RoleId) of
        {ok, RedPacket = #red_packet{num = Num}} when Num > 0 ->
            logger:debug("~w", [RedPacket], red_packet_mgr, 214),
            role_group:pack_send(world, 18501, {RedPacket}),
            ok;
        _ -> ok
    end,
    {noreply, State};
handle_cast(_Msg, State) ->
    logger:error("红包进程收到未知消息:~w",
                 [_Msg],
                 red_packet_mgr,
                 224),
    {noreply, State}.

handle_info(valid_check,
            State = #state{rp_unit_list = UnitList}) ->
    case get(valid_check_ref) of
        Ref when is_reference(Ref) -> erlang:cancel_timer(Ref);
        _ -> ok
    end,
    ValidCheckRef = erlang:send_after(1800000,
                                      self(),
                                      valid_check),
    put(valid_check_ref, ValidCheckRef),
    Now = date:unixtime(),
    Fun = fun (#red_packet{id = RedPacketId,
                           time = SendTime, assets_type = AssetsType,
                           remain = Remain, type = PacketType},
               RtnUnitList) ->
                  ValidTime = case PacketType of
                                  1 -> SendTime + 86400;
                                  2 -> SendTime + 86400;
                                  3 -> SendTime + 3600;
                                  _ -> SendTime + 86400
                              end,
                  case Now >= ValidTime of
                      true ->
                          case Remain > 0 of
                              true ->
                                  Title = lang:get("红包返还"),
                                  Content =
                                      lang:get("由于您发送的世界红包过期但未被抢完，剩余红包礼金返还给您:"),
                                  mail:send(RedPacketId,
                                            Title,
                                            Content,
                                            [{AssetsType, Remain}]),
                                  ok;
                              false -> ok
                          end,
                          NewRtnUnitList = lists:foldl(fun ({UnitId,
                                                             ToPacketId},
                                                            PramUnitList)
                                                               when ToPacketId
                                                                        =:=
                                                                        RedPacketId ->
                                                               logger:debug("删除单位信息:~w",
                                                                            [UnitId],
                                                                            red_packet_mgr,
                                                                            263),
                                                               unit_mgr:remove(UnitId),
                                                               lists:keydelete(RedPacketId,
                                                                               2,
                                                                               PramUnitList);
                                                           (_, PramUnitList) ->
                                                               PramUnitList
                                                       end,
                                                       RtnUnitList,
                                                       RtnUnitList),
                          delete_red_packet(RedPacketId),
                          NewRtnUnitList;
                      false -> RtnUnitList
                  end;
              (_, RtnUnitList) -> RtnUnitList
          end,
    NewUnitList = ets:foldl(Fun, UnitList, red_packet_list),
    {noreply, State#state{rp_unit_list = NewUnitList}};
handle_info({create_red_packet_unit,
             RedPacket = #red_packet{id = PacketId},
             MapId},
            State = #state{rp_unit_list = UnitList,
                           rain_ref = RainRefList}) ->
    State1 = case lists:keyfind(PacketId, 1, RainRefList) of
                 {_, RainRef} when erlang:is_reference(RainRef) ->
                     erlang:cancel_timer(RainRef),
                     State#state{rain_ref =
                                     lists:keydelete(PacketId, 1, RainRefList)};
                 _ ->
                     State#state{rain_ref =
                                     lists:keydelete(PacketId, 1, RainRefList)}
             end,
    notice:effect(all, 30169),
    RedPacketUnitList = create_red_packet_unit(RedPacket,
                                               MapId),
    NewState = State1#state{rp_unit_list =
                                UnitList ++ RedPacketUnitList},
    {noreply, NewState};
handle_info(_Info, State) ->
    logger:error("红包进程收到未知消息:~w",
                 [_Info],
                 red_packet_mgr,
                 301),
    {noreply, State}.

terminate(_Reason, _State) -> ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

save_red_packet(RedPacket) ->
    ets:insert(red_packet_list, RedPacket),
    dets:insert(red_packet_list, RedPacket),
    ok.

delete_red_packet(RedPacketId) ->
    ets:delete(red_packet_list, RedPacketId),
    dets:delete(red_packet_list, RedPacketId),
    ok.

get_red_packet(RoleId) ->
    case ets:lookup(red_packet_list, RoleId) of
        [RedPacket = #red_packet{}] -> {ok, RedPacket};
        _ -> false
    end.

get_red_packet_list(RoleId) ->
    Fun = fun (RedPacket = #red_packet{num = 0,
                                       type = PacketType},
               {RtnSelf, RtnGeting, RtnDone})
                  when PacketType =:= 1 orelse PacketType =:= 2 ->
                  {RtnSelf, RtnGeting, [RedPacket | RtnDone]};
              (RedPacket = #red_packet{id = PacketId,
                                       type = PacketType},
               {RtnSelf, RtnGeting, RtnDone})
                  when PacketType =:= 1 orelse PacketType =:= 2 ->
                  case PacketId =:= RoleId of
                      true -> {[RedPacket | RtnSelf], RtnGeting, RtnDone};
                      false -> {RtnSelf, [RedPacket | RtnGeting], RtnDone}
                  end;
              (_RedPacket, Rtn) -> Rtn
          end,
    {SelfPackets, GetingPackets, DonePackets} =
        ets:foldl(Fun, {[], [], []}, red_packet_list),
    GetingPksCount = length(SelfPackets ++ GetingPackets),
    NewDonePackets = lists:sublist(DonePackets,
                                   20 - GetingPksCount),
    {ok, SelfPackets, GetingPackets, NewDonePackets}.

create_red_packet_unit(RedPacket = #red_packet{num =
                                                   Num,
                                               name = RoleName},
                       MapId) ->
    MapName = case map_data:get(MapId) of
                  {ok, #map_data{name = _Name}} -> _Name;
                  _ -> lang:get("各地")
              end,
    NoticeMsg =
        notice:format(lang:get("~ts撒下了~ts，红包散落在~ts的各个角落，赶紧抢红包去咯{face_1, 7}"),
                      [{role_2, RoleName},
                       {string_2, 4, lang:get("红包雨")},
                       {string_2, 4, MapName}]),
    notice:cast(all, 5, NoticeMsg),
    notice:cast(all, 11, NoticeMsg),
    create_red_packet_unit(RedPacket, [MapId], Num, []).

create_red_packet_unit(_Redpacket, _, Num,
                       RedPacketUnitList)
    when Num < 1 ->
    RedPacketUnitList;
create_red_packet_unit(RedPacket = #red_packet{id =
                                                   RoleId,
                                               name = SendName},
                       Maps, Num, RedPacketUnitList) ->
    BaseId = 62321,
    MapId = lists:nth(Num rem length(Maps) + 1, Maps),
    case map:rand_pos(MapId) of
        {X, Y} ->
            case unit_data:get(BaseId) of
                UnitBase = #unit_data{} ->
                    UnitName = util:flist(lang:get("~ts的红包"), [SendName]),
                    case unit_mgr:create(48,
                                         UnitBase#unit_data{name = UnitName},
                                         {MapId, X, Y})
                        of
                        {ok, #unit{id = UnitId}} ->
                            create_red_packet_unit(RedPacket,
                                                   Maps,
                                                   Num - 1,
                                                   [{UnitId, RoleId}
                                                    | RedPacketUnitList]);
                        _False ->
                            logger:error("刷新红包失败:~w",
                                         [_False],
                                         red_packet_mgr,
                                         378),
                            create_red_packet_unit(RedPacket,
                                                   Maps,
                                                   Num - 1,
                                                   RedPacketUnitList)
                    end;
                _ ->
                    create_red_packet_unit(RedPacket,
                                           Maps,
                                           Num - 1,
                                           RedPacketUnitList)
            end;
        _ ->
            logger:error("找不到地图坐标 map:~w",
                         [MapId],
                         red_packet_mgr,
                         385),
            create_red_packet_unit(RoleId,
                                   Maps,
                                   Num - 1,
                                   RedPacketUnitList)
    end.

get_luckyer_name(#red_packet{has_soul = HasSoul,
                             log = Log}) ->
    case HasSoul of
        1 ->
            case lists:filter(fun (#red_packet_grab_log{is_item =
                                                            IsItem}) ->
                                      IsItem =:= 1
                              end,
                              Log)
                of
                [#red_packet_grab_log{name = _LuckyerName}] ->
                    _LuckyerName;
                _ -> lang:get("一位神秘玩家")
            end;
        0 ->
            Fun = fun (GrabLog = #red_packet_grab_log{value = Val,
                                                      is_item = 0},
                       Rtn = #red_packet_grab_log{value = RtnVal}) ->
                          case Val > RtnVal of
                              true -> GrabLog;
                              false -> Rtn
                          end;
                      (_, Rtn) -> Rtn
                  end,
            case lists:foldl(Fun, #red_packet_grab_log{}, Log) of
                #red_packet_grab_log{name = _LuckyerName} ->
                    _LuckyerName;
                _ -> lang:get("一位神秘玩家")
            end
    end.

get_rain_packet_count() ->
    MatchSpec = [{#red_packet{type = '$1', _ = '_'},
                  [],
                  [{'=:=', '$1', 3}]}],
    ets:select_count(red_packet_list, MatchSpec).

