-file("src/mod/gold_league/gold_league_api.erl", 1).

-module(gold_league_api).

-export([get_phase/1,
         get_info/1,
         get_cross_id/0,
         get_group_id/1,
         get_combat_mode/1,
         get_field_info/1,
         get_id/1,
         get_guess_info/3,
         get_reward/6,
         get_rival_info/2,
         get_drug_info/1,
         get_cross_group_id/1,
         update_reward/2,
         do_update_reward/3,
         do_get_phase/3,
         do_get_guess_info/3,
         clean_drug/1,
         send_honor/3,
         get_champion/1,
         do_get_champion/2,
         push_combat_notice/3,
         clean_guess_role/2,
         do_clean_guess_role/2,
         get_combat_record/3,
         do_get_combat_record/2]).

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

-file("src/mod/gold_league/gold_league_api.erl", 41).

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

-file("src/mod/gold_league/gold_league_api.erl", 42).

-file("inc/gold_league.hrl", 1).

-record(gold_league_ready_zone,
        {cross_id = 0,
         map_id = 0 :: non_neg_integer(),
         map_zone = 0,
         map_plat = "",
         map_pid :: pid() | undefined,
         member_size = 0 :: non_neg_integer(),
         group_id = 0 :: pos_integer(),
         exit_npc,
         combat_mode = 0,
         init_combat_mode = 0}).

-record(gold_league_zone,
        {cross_id = 0,
         id = 0,
         key,
         group_id = 0 :: pos_integer(),
         seq_id = 0,
         pid,
         is_close = 0}).

-record(gold_league_field,
        {id = 0 :: non_neg_integer(),
         key,
         cross_id = 0,
         group_id = 0 :: non_neg_integer(),
         seq_id = 0 :: non_neg_integer(),
         pid :: pid() | undefined,
         map_id = 0,
         map_pid,
         map_plat = "",
         map_zone = 0,
         phase = 0,
         end_time = 0,
         combat_mode = 0,
         now_round = 0,
         max_round = 0}).

-record(gold_league_state,
        {key,
         cross_id = 0,
         group_id = 0 :: non_neg_integer(),
         state_name,
         phase = 0,
         end_time = 0,
         now_round = 0,
         max_round = 0,
         ids = []}).

-record(gold_league_zone_role,
        {id,
         pid,
         name = "",
         sex = 0,
         classes = 0,
         lev = 0 :: non_neg_integer(),
         fc = 0,
         group_id = 0 :: pos_integer(),
         field_id = 0,
         status = 0,
         is_combat = 0,
         combat_pid,
         last_combat_over_time = 0,
         rival_id = undefined,
         rival_pid = undefined,
         rival_name = "",
         ref = undefined,
         win_count = 0,
         combat_count = 0,
         score = 0,
         cross_id = 0,
         match = 0,
         pos = 0,
         match_num = 0,
         match_group_id = 0,
         is_lose = 0,
         lose_round = 0,
         rank = 0,
         is_out = 0,
         is_result = 0}).

-record(gold_league,
        {id ::
             undefined |
             {pos_integer(), bitstring(), non_neg_integer()},
         pid :: pid() | undefined,
         name = "" :: string(),
         sex = 0,
         classes = 0,
         face_id = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         break_times = 0,
         fc = 0 :: non_neg_integer(),
         looks = [] :: list(),
         group_id = 0 :: pos_integer(),
         match = 0 :: pos_integer(),
         combat_count = 0 :: pos_integer(),
         win = 0,
         lose = 0,
         rival_id = {0, "", 0} :: tuple(),
         multi_kill = 0 :: non_neg_integer(),
         win_count = 0,
         score = 0 :: non_neg_integer(),
         rank = 0 :: pos_integer(),
         ready_map_id = 0 :: non_neg_integer(),
         ready_map_pid :: pid() | undefined,
         ready_map_plat = "",
         ready_map_zone = 0,
         seq_id = 0 :: non_neg_integer(),
         field_id = 0 :: non_neg_integer(),
         field_map_id = 0 :: non_neg_integer(),
         field_map_plat = "",
         field_map_zone = 0,
         field_pid :: pid() | undefined,
         field_time = 0,
         reward = [] :: list(),
         status = 0,
         cross_id = 0,
         ref = undefined,
         match_time = 0,
         combat_time = 0,
         camp = 0,
         is_combat = 0,
         combat_mode = 0,
         is_rise = 0,
         pos = 0,
         is_lose = 0,
         lose_round = 0}).

-record(gold_league_group_data,
        {id = 0, name = "", order = 0, members = [], ids = []}).

-record(gold_league_drop_item_data,
        {base_id = 0,
         weight = 0,
         result = 0,
         is_notice = 0,
         num = 0}).

-record(gold_league_combat,
        {pid,
         field_id = 0,
         field_key,
         type = 1,
         ref,
         first_id = {0, "", 0},
         first_name = "",
         first_classes = 0,
         first_sex = 0,
         first_lev = 0,
         second_id = {0, "", 0},
         second_name = "",
         second_classes = 0,
         second_lev = 0,
         second_sex = 0,
         cross_id = 0,
         group_id = 0,
         ids = []}).

-record(gold_league_timer_data,
        {id = 0,
         phase = 0,
         type = 0,
         spec_id = 0,
         buff_id = 0,
         start = 0,
         interval = 0,
         finished = 0,
         num = 0,
         max = 0}).

-record(gold_league_combat_result,
        {field_pid, round = 0}).

-record(gold_league_combat_win,
        {field_pid,
         score = 0,
         round = 0,
         now_round = 0,
         max_round = 0,
         state_name = fight,
         is_lose = 0,
         id,
         name = "",
         time = 0,
         group_id = 0}).

-record(gold_league_combat_lose,
        {field_pid,
         score = 0,
         round = 0,
         now_round = 0,
         max_round = 0,
         state_name = fight,
         is_lose = 0,
         id,
         name = "",
         time = 0,
         group_id = 0}).

-record(gold_league_rank_reward_data,
        {group = 0,
         min = 0,
         max = 0,
         items = [],
         title = "",
         content = ""}).

-record(gold_league_16,
        {cross_id = 0,
         group_id = 0,
         key = {0, 0},
         members = []}).

-record(gold_league_guess,
        {id = 0, name = "", num = 0, amount = 0, members = []}).

-record(gold_league_guess_role,
        {id = 0, members = [], group_id = 0, cross_id = 0}).

-record(gold_league_combat_record,
        {id = 0,
         first_id = {0, "", 0},
         second_id = {0, "", 0}}).

-file("src/mod/gold_league/gold_league_api.erl", 43).

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

-file("src/mod/gold_league/gold_league_api.erl", 44).

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

-file("src/mod/gold_league/gold_league_api.erl", 45).

-file("inc/lev_break.hrl", 1).

-record(m_lev_break,
        {ver = 0,
         trial = 0 :: non_neg_integer(),
         done = 0 :: non_neg_integer(),
         times = 0 :: non_neg_integer(),
         attr_point = 0 :: non_neg_integer()}).

-file("src/mod/gold_league/gold_league_api.erl", 46).

get_id(#role{s_event = 54, id = Rid}) ->
    case catch ets:lookup(gold_leagues, Rid) of
        [#gold_league{camp = Camp, field_id = SeqId}] ->
            {ok, Camp, SeqId};
        _ -> false
    end;
get_id(_Role) -> false.

get_cross_id() ->
    P = env:get(platform),
    Z = env:get(zone_id),
    gold_league_data:get_cross_id({P, Z}).

get_group_id(#role{lev = Lev,
                   m_lev_break = #m_lev_break{times = BreakTimes}}) ->
    case gold_league_data:get_group({Lev, BreakTimes}) of
        #gold_league_group_data{id = GroupId} -> GroupId;
        _ -> 4
    end.

get_cross_group_id(#role{lev = Lev,
                         m_lev_break = #m_lev_break{times = BreakTimes}}) ->
    CrossId = get_cross_id(),
    GroupId1 = case gold_league_data:get_group({Lev,
                                                BreakTimes})
                   of
                   #gold_league_group_data{id = GroupId} -> GroupId;
                   _ -> 1
               end,
    {CrossId, GroupId1}.

get_phase(Role = #role{id = Rid, pid = Pid}) ->
    {CrossId, GroupId} = case catch ets:lookup(gold_leagues,
                                               Rid)
                             of
                             [#gold_league{cross_id = CrossId0,
                                           group_id = GroupId0}] ->
                                 {CrossId0, GroupId0};
                             _ -> get_cross_group_id(Role)
                         end,
    case CrossId of
        0 -> do_get_phase(Pid, CrossId, GroupId);
        _ ->
            cross:cast(gold_league_api,
                       do_get_phase,
                       [Pid, CrossId, GroupId])
    end.

do_get_phase(Pid, CrossId, GroupId) ->
    case get_state(CrossId, GroupId, 1) of
        {ok,
         #gold_league_state{phase = Phase, end_time = Time,
                            now_round = NowRound, max_round = MaxRound,
                            ids = Ids}} ->
            role:pack_send(Pid,
                           20000,
                           {Phase, Time, NowRound, MaxRound, Ids});
        _R ->
            case ets:lookup(gold_league_state, {0, 0}) of
                [#gold_league_state{phase = Phase, end_time = Time,
                                    now_round = NowRound, max_round = MaxRound,
                                    ids = Ids}] ->
                    logger:debug("dddddddddddddddddd ~w ~w ~w",
                                 [Phase, Time, Ids],
                                 gold_league_api,
                                 106),
                    role:pack_send(Pid,
                                   20000,
                                   {Phase, Time, NowRound, MaxRound, Ids});
                _ -> role:pack_send(Pid, 20000, {0, 0, 0, 0, []})
            end
    end.

get_state(_CrossId, _GroupId, Times) when Times > 5 ->
    false;
get_state(CrossId, GroupId, Times) ->
    case ets:lookup(gold_league_state, {CrossId, GroupId})
        of
        [#gold_league_state{} = State] -> {ok, State};
        _ ->
            case GroupId >= 4 of
                true -> get_state(CrossId, 1, Times + 1);
                _ -> get_state(CrossId, GroupId + 1, Times + 1)
            end
    end.

get_combat_record(Role, FirstId, SecondId) ->
    logger:debug("============== ~w",
                 [{FirstId, SecondId}],
                 gold_league_api,
                 129),
    CrossId = get_cross_id(),
    Result = case CrossId of
                 0 -> do_get_combat_record(FirstId, SecondId);
                 _ ->
                     cross:call(gold_league_api,
                                do_get_combat_record,
                                [FirstId, SecondId])
             end,
    case Result of
        {ok, RecordId = {_, {_, P, Z} = RecordRoleId}} ->
            logger:debug("录像id ~w",
                         [RecordId],
                         gold_league_api,
                         137),
            Result1 = case role_misc:is_local_role(RecordRoleId) of
                          true -> combat_record:replay(Role, RecordId);
                          _ ->
                              cross:call(P,
                                         Z,
                                         combat_record,
                                         replay,
                                         [Role, RecordId])
                      end,
            case Result1 of
                ok ->
                    logger:debug("战斗录像id:~w",
                                 [RecordId],
                                 gold_league_api,
                                 144),
                    NRole = var:set_var(Role,
                                        other,
                                        {2072, RecordId},
                                        date:unixtime()),
                    {ok, lang:get("播放开始"), NRole};
                {false, Reason} ->
                    logger:debug("战斗录像id:~ts",
                                 [Reason],
                                 gold_league_api,
                                 148),
                    {false, Reason};
                _ -> {false, lang:get("该录像已失效")}
            end;
        {false, Reason} -> {false, Reason}
    end.

do_get_combat_record(FirstId, SecondId) ->
    MatchSpec = [{#gold_league_combat_record{first_id =
                                                 '$1',
                                             second_id = '$2', _ = '_'},
                  [{'andalso',
                    {'=:=', {const, FirstId}, '$1'},
                    {'=:=', {const, SecondId}, '$2'}}],
                  ['$_']}],
    case ets:select(gold_league_combat_record, MatchSpec) of
        [#gold_league_combat_record{id = Id}] -> {ok, Id};
        _ ->
            logger:debug("===================",
                         [],
                         gold_league_api,
                         163),
            {false, lang:get("该录像已失效")}
    end.

get_info(#role{s_event = Event, id = Rid})
    when Event =:= 52 orelse
             Event =:= 54 orelse Event =:= 53 orelse Event =:= 55 ->
    case catch ets:lookup(gold_leagues, Rid) of
        [GoldLeague = #gold_league{}] -> {ok, GoldLeague};
        _R ->
            logger:debug("勇士状态为 ~w",
                         [{_R, Event}],
                         gold_league_api,
                         177),
            false
    end;
get_info(_Role) -> false.

get_combat_mode(#role{id = Rid}) ->
    case catch ets:lookup_element(gold_leagues,
                                  Rid,
                                  #gold_league.combat_mode)
        of
        CombatMode when is_integer(CombatMode) ->
            {ok, CombatMode};
        _ -> false
    end.

get_field_info(Role = #role{id = Rid}) ->
    case catch ets:lookup(gold_leagues, Rid) of
        [GoldLeague = #gold_league{}] ->
            gold_league:get_field_info(GoldLeague, Role),
            ok;
        _ -> ok
    end;
get_field_info(_) -> ok.

get_guess_info(#role{id = {_, _P, _Z}, pid = Pid},
               RoleId1, RoleId2) ->
    case get_cross_id() of
        0 -> do_get_guess_info(Pid, RoleId1, RoleId2);
        _ ->
            cross:cast(gold_league_api,
                       do_get_guess_info,
                       [Pid, RoleId1, RoleId2])
    end.

do_get_guess_info(Pid, RoleId1, RoleId2) ->
    Num3 = case ets:lookup(gold_league_guess, RoleId1) of
               [#gold_league_guess{amount = Num1}] -> Num1;
               _ -> 0
           end,
    Num4 = case ets:lookup(gold_league_guess, RoleId2) of
               [#gold_league_guess{amount = Num2}] -> Num2;
               _ -> 0
           end,
    {Odds1, Odds2} = if Num3 + Num4 =:= 0 ->
                            {round(1000 * 1 / 5.0e-1), round(1000 * 1 / 500)};
                        Num3 =:= 0 ->
                            {round(1000 * 1 / 2.0e-1),
                             round(1000 * 1 / 8.0e-1)};
                        Num4 =:= 0 ->
                            {round(1000 * 1 / 8.0e-1),
                             round(1000 * 1 / 2.0e-1)};
                        true ->
                            {round(1000 * get_odds(Num3, Num4)),
                             round(1000 * get_odds(Num4, Num3))}
                     end,
    role:pack_send(Pid,
                   20015,
                   {RoleId1, Num3, Odds1, RoleId2, Num4, Odds2}),
    logger:debug("============= ~w",
                 [{Num3, Num4}],
                 gold_league_api,
                 228),
    ok.

get_odds(A, B) when A + B > 0 ->
    Ratio = min(8.0e-1, max(2.0e-1, A / (A + B))),
    1 / Ratio.

get_drug_info(Role = #role{pid = Pid}) ->
    Times1 = var:get_var(Role, other, 2098, 0),
    TimesUse1 = 5,
    TimesAll1 = var:get_var(Role, day, 614, 0),
    Times2 = var:get_var(Role, other, 2099, 0),
    TimesUse2 = 3,
    TimesAll2 = var:get_var(Role, day, 615, 0),
    role:pack_send(Pid,
                   20012,
                   {Times1,
                    TimesUse1,
                    TimesAll1,
                    Times2,
                    TimesUse2,
                    TimesAll2}),
    ok.

get_reward(#role{lev = Lev}, Phase, IsWin, NowRound,
           MaxRound, IsLose) ->
    Type = get_reward_type(Phase,
                           MaxRound - NowRound,
                           IsLose),
    case gold_league_data:get_reward({Type, IsWin}) of
        #{base_id := BaseId, num := Num, mod_id := ModId,
          exp_ratio := ExpRatio, pet_exp_ratio := PetExpRatio,
          coin_ratio := _CoinRatio} ->
            Reward = case levup_data:get_exp({ModId, Lev}) of
                         #{coin := _Coin, exp := Exp, pet_exp := PetExp} ->
                             [{90010, round(Exp * ExpRatio / 1000)},
                              {90005, round(PetExpRatio * PetExp / 1000)},
                              {BaseId, Num}];
                         _ -> [{BaseId, Num}]
                     end,
            {Reward, Num};
        _ -> {[], 0}
    end.

get_champion(#role{pid = Pid}) ->
    case get_cross_id() of
        CrossId when CrossId =:= 0 ->
            do_get_champion(Pid, CrossId);
        CrossId ->
            cross:cast(gold_league_api,
                       do_get_champion,
                       [Pid, CrossId])
    end.

do_get_champion(Pid, CrossId) ->
    MatchSpec = [{#gold_league{cross_id = '$1', _ = '_'},
                  [{'=:=', {const, CrossId}, '$1'}],
                  ['$_']}],
    AllList = case ets:select(gold_league_16_role,
                              MatchSpec)
                  of
                  List when is_list(List) ->
                      [GoldLeague
                       || GoldLeague = #gold_league{rank = Rank} <- List,
                          Rank =:= 1];
                  _ -> []
              end,
    role:pack_send(Pid, 20023, {AllList, [1, 2, 3, 4]}),
    ok.

push_combat_notice(RoleId = {Rid, P, Z}, RivalId,
                   DiffRound) ->
    case ets:lookup(gold_league_guess, RoleId) of
        [#gold_league_guess{members = Members, name = Name}
         | _] ->
            Msg = combat_notice(DiffRound, Name),
            [role:pack_send(ToRoleId, 20021, {Rid, P, Z, Msg})
             || {ToRoleId, _, _} <- Members,
                ToRoleId =/= RoleId andalso ToRoleId =/= RivalId];
        _ -> ok
    end;
push_combat_notice(_, _, _) -> ok.

combat_notice(0, Name) ->
    notice:format(lang:get("您支持的~ts正在进行钻石联赛决赛比赛，是否观战？"),
                  [{string_2, 5, Name}]);
combat_notice(1, Name) ->
    notice:format(lang:get("您支持的~ts正在进行钻石联赛~ts进~ts比赛，是否观战？"),
                  [{string_2, 5, Name},
                   {string_2, 5, 4},
                   {string_2, 5, 2}]);
combat_notice(2, Name) ->
    notice:format(lang:get("您支持的~ts正在进行钻石联赛~ts进~ts比赛，是否观战？"),
                  [{string_2, 5, Name},
                   {string_2, 5, 8},
                   {string_2, 5, 4}]);
combat_notice(_, Name) ->
    notice:format(lang:get("您支持的~ts正在进行钻石联赛~ts进~ts比赛，是否观战？"),
                  [{string_2, 5, Name},
                   {string_2, 5, 16},
                   {string_2, 5, 8}]).

get_reward_type(fight, _, _) -> 9;
get_reward_type(fight_out, 0, 0) -> 1;
get_reward_type(fight_out, 0, 1) -> 2;
get_reward_type(fight_out, 1, _) -> 3;
get_reward_type(fight_out, 2, _) -> 4;
get_reward_type(fight_out, 3, _) -> 5;
get_reward_type(fight_out, 4, _) -> 6;
get_reward_type(fight_out, 5, _) -> 7;
get_reward_type(fight_out, 6, _) -> 8;
get_reward_type(Phase, Round, Flag) ->
    logger:info("错误的数据 ~w",
                [Phase, Round, Flag],
                gold_league_api,
                330),
    9.

get_rival_info(Members,
               #gold_league_zone_role{match_num = Num,
                                      match_group_id = MatchGroupId}) ->
    ZoneRoles = [Role
                 || Role = #gold_league_zone_role{is_out = 0,
                                                  match_group_id = ElemGroupId}
                        <- Members,
                    ElemGroupId =:= MatchGroupId],
    RivalNum = case Num rem 2 of
                   1 -> Num + 1;
                   _ -> Num - 1
               end,
    logger:debug("自己匹配位置 ~w对手匹配位置 ~w",
                 [Num, RivalNum],
                 gold_league_api,
                 340),
    case lists:keyfind(RivalNum,
                       #gold_league_zone_role.match_num,
                       ZoneRoles)
        of
        #gold_league_zone_role{} = ZoneRole -> {ok, ZoneRole};
        _ -> false
    end.

update_reward(RoleId, Num) ->
    case catch ets:lookup(gold_leagues, RoleId) of
        [#gold_league{cross_id = CrossId}] ->
            case CrossId of
                0 -> do_update_reward(RoleId, Num, 1);
                _ -> do_update_reward(RoleId, Num, 2)
            end;
        _ -> ok
    end.

do_update_reward(RoleId, Num, CrossMod) ->
    case catch ets:lookup(gold_leagues, RoleId) of
        [GoldLeague = #gold_league{cross_id = _CrossId,
                                   reward = Reward, field_pid = Pid}] ->
            case CrossMod of
                2 ->
                    cross:cast(gold_league,
                               cast,
                               [Pid, {update_reward, RoleId, Num}]);
                _ ->
                    OldNum1 = case lists:keyfind(90026, 1, Reward) of
                                  {_, OldNum} -> OldNum;
                                  _ -> 0
                              end,
                    Reward1 = lists:keystore(90026,
                                             1,
                                             Reward,
                                             {90026, OldNum1 + Num}),
                    NewGoldLeague = GoldLeague#gold_league{reward =
                                                               Reward1},
                    ets:insert(gold_leagues, NewGoldLeague)
            end;
        _ -> ok
    end.

clean_drug(Role) ->
    Role1 = var:del_var(Role, other, [2098, 2099]),
    var:del_var(Role1, day, [614, 615]).

send_honor(Members, CrossId, GroupId) ->
    CrossList = gold_league_data:get_all_cross_list(),
    HonorRoleList = honor_rank(Members, []),
    case CrossId of
        0 ->
            logger:info("钻石联赛称号：~w,~w",
                        [CrossId, HonorRoleList],
                        gold_league_api,
                        388),
            honor_mgr:replace(list_to_atom(lists:concat(["gold_league_honor_",
                                                         GroupId])),
                              HonorRoleList,
                              0);
        _ ->
            Servers = [Server
                       || {Server, CrossId1} <- CrossList,
                          CrossId =:= CrossId1],
            [cross:cast(P,
                        Z,
                        gold_league_mgr,
                        cast,
                        [{update_honor,
                          list_to_atom(lists:concat(["gold_league_honor_",
                                                     GroupId])),
                          HonorRoleList}])
             || {P, Z} <- Servers]
    end.

honor_rank([], Acc) -> Acc;
honor_rank([#gold_league_zone_role{id = Id, rank = Rank,
                                   group_id = GroupId}
            | T],
           Acc) ->
    RankType = get_rank_type(GroupId),
    case gold_league_data:get_honor({RankType, Rank}) of
        #{honor_id := HonorId} ->
            honor_rank(T, [{Id, HonorId} | Acc]);
        _ -> honor_rank(T, Acc)
    end;
honor_rank([_ | T], Acc) -> honor_rank(T, Acc).

get_rank_type(1) -> 59;
get_rank_type(2) -> 58;
get_rank_type(3) -> 57;
get_rank_type(4) -> 56;
get_rank_type(_) -> 56.

clean_guess_role(CrossId, GroupIds) ->
    case CrossId of
        0 -> do_clean_guess_role(CrossId, GroupIds);
        _ ->
            gold_league_utils:run_mfa({cross_id, CrossId},
                                      gold_league_api,
                                      do_clean_guess_role,
                                      [CrossId, GroupIds])
    end.

do_clean_guess_role(CrossId, Ids) ->
    Roles = ets:tab2list(gold_league_guess_role),
    logger:debug("========================== ~w",
                 [{length(Roles), Ids}],
                 gold_league_api,
                 426),
    Fun = fun (#gold_league_guess_role{id = Id,
                                       cross_id = ElemCrossId,
                                       group_id = ElemGroupId})
                  when CrossId =:= ElemCrossId ->
                  case lists:member(ElemGroupId, Ids) of
                      true ->
                          logger:debug("==========================",
                                       [],
                                       gold_league_api,
                                       430),
                          ets:delete(gold_league_guess_role, Id);
                      _ -> ok
                  end;
              (_) -> ok
          end,
    lists:foreach(Fun, Roles).

