-file("src/mod/tournament/tournament_season.erl", 1).

-module(tournament_season).

-export([init/0,
         count/1,
         reset/2,
         reward/1,
         check/1,
         auto_reward/0,
         get_icon_frame/1,
         calc_max_join/2,
         gm_compensate/0,
         gm_fix/0,
         gm_reset_mvp/0,
         backup_profile_update_season/0]).

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

-file("src/mod/tournament/tournament_season.erl", 24).

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

-file("src/mod/tournament/tournament_season.erl", 25).

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

-file("src/mod/tournament/tournament_season.erl", 26).

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

-file("src/mod/tournament/tournament_season.erl", 27).

-file("inc/tournament.hrl", 1).

-record(m_tournament,
        {ver = 3 :: non_neg_integer(),
         triggers = [] :: list(),
         status = 0 :: non_neg_integer(),
         rewarded = [] :: list(),
         pk_type = 0,
         kingbadgenum = 0,
         starlev = 0,
         kingbadge = [] :: list(),
         showbadge = 0}).

-record(tournament_profile,
        {id = {0, "", 0} :: tuple(),
         ver = 11 :: non_neg_integer(),
         name = "" :: string(),
         lev = 0 :: non_neg_integer(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         rank_lev = 1 :: non_neg_integer(),
         rank_point = 0 :: non_neg_integer(),
         liked = 0 :: non_neg_integer(),
         liked_other = 0 :: non_neg_integer(),
         last_matched = 0 :: non_neg_integer(),
         day_matched = 0 :: non_neg_integer(),
         day_win = 0 :: non_neg_integer(),
         day_win_sustained = 0 :: non_neg_integer(),
         season_rank_lev = 1 :: non_neg_integer(),
         season_rank_point = 0 :: non_neg_integer(),
         combat_count = 0 :: non_neg_integer(),
         win_count = 0 :: non_neg_integer(),
         win_sustained = 0 :: non_neg_integer(),
         season_kill = 0 :: non_neg_integer(),
         season_reverse = 0 :: non_neg_integer(),
         season_revive = 0 :: non_neg_integer(),
         season_dmg = 0 :: non_neg_integer(),
         season_bearing_dmg = 0 :: non_neg_integer(),
         season_zero_dmg = 0 :: non_neg_integer(),
         season_pet_revive = 0 :: non_neg_integer(),
         best_rank_point = 0 :: non_neg_integer(),
         best_rank_lev = 1 :: non_neg_integer(),
         best_win_count = 0 :: non_neg_integer(),
         best_win_sustained = 0 :: non_neg_integer(),
         best_partner = [] :: list(),
         week_rank_lev = 1 :: non_neg_integer(),
         week_rank_point = 0 :: non_neg_integer(),
         awesome_kill = 0 :: non_neg_integer(),
         awesome_kill_num = 0 :: non_neg_integer(),
         awesome_dmg = 0 :: non_neg_integer(),
         awesome_heal = 0 :: non_neg_integer(),
         awesome_control = 0 :: non_neg_integer(),
         mvp = 0 :: non_neg_integer(),
         loss_mvp = 0 :: non_neg_integer(),
         season_awesome_kill = 0 :: non_neg_integer(),
         season_awesome_kill_num = 0 :: non_neg_integer(),
         season_awesome_dmg = 0 :: non_neg_integer(),
         season_awesome_heal = 0 :: non_neg_integer(),
         season_awesome_control = 0 :: non_neg_integer(),
         season_mvp = 0 :: non_neg_integer(),
         season_loss_mvp = 0 :: non_neg_integer(),
         consecutive_lost = 0 :: non_neg_integer(),
         reported = 0 :: non_neg_integer(),
         reported_other = 0 :: non_neg_integer(),
         reported_logs = [] :: list(),
         banned_date = 0 :: non_neg_integer(),
         reported_single_match = 0,
         is_auto_combat = 0,
         guards = [],
         historical_high = 0 :: non_neg_integer(),
         show_badge_id = 0 :: non_neg_integer(),
         promotion_win = 0 :: non_neg_integer(),
         upgrade_point = 0 :: non_neg_integer()}).

-record(tournament_role,
        {id = {0, "", 0} :: tuple(),
         status = 0 :: non_neg_integer(),
         name = "" :: string(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         fc = 0 :: non_neg_integer(),
         looks = [] :: list(),
         times = 1 :: non_neg_integer(),
         point = 1 :: non_neg_integer(),
         rank_lev = 1 :: non_neg_integer(),
         rank_point = 0 :: non_neg_integer(),
         pid :: undefined | pid() | 0,
         is_online = 0 :: 0 | 1,
         match_id = 0 :: non_neg_integer(),
         side = 0 :: non_neg_integer(),
         is_leader = 0 :: 0 | 1,
         last_matched = 0 :: non_neg_integer(),
         team_id = [] :: list(),
         formation_id = 1 :: non_neg_integer(),
         formation_lev = 1 :: non_neg_integer(),
         partner = [] :: list(),
         consecutive_lost = 0 :: non_neg_integer(),
         reported = 0 :: non_neg_integer(),
         guards = [],
         show_badge_id = 0 :: non_neg_integer()}).

-record(tournament_team,
        {ids = [] :: list(),
         output_num = 0 :: non_neg_integer(),
         assist_num = {0, 0} ::
             {non_neg_integer(), non_neg_integer()},
         origin_ids = [] :: list(),
         num = 1 :: non_neg_integer(),
         sum_point = 0 :: non_neg_integer(),
         max_point = 0 :: non_neg_integer(),
         min_point = 0 :: non_neg_integer(),
         sum_lev = 0 :: non_neg_integer(),
         max_lev = 0 :: non_neg_integer(),
         min_lev = 0 :: non_neg_integer(),
         tried_match = 0 :: non_neg_integer(),
         match_id = 0 :: non_neg_integer(),
         usurpers = [] :: list(),
         order = [] :: list(),
         classes = [] :: list()}).

-record(tournament_match,
        {id = 0 :: non_neg_integer(),
         teams = [] :: list(),
         time = 0 :: non_neg_integer(),
         combat_pid :: undefined | pid(),
         calc_args = [] :: list()}).

-record(tournament_usurper,
        {id = {0, "", 0} :: tuple(),
         name = "" :: string(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         leader_objected = 0 :: 0 | 1,
         total = 0 :: integer(),
         pros = 0 :: integer(),
         cons = 0 :: integer(),
         time = 0 :: integer(),
         voted_ids = []}).

-record(tournament_celebrity,
        {id = {0, "", 0} :: tuple(),
         name = "" :: string(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         val1 = 0 :: non_neg_integer(),
         val2 = 0 :: non_neg_integer()}).

-record(tournament_fighter,
        {id = {0, "", 0} :: tuple(),
         name = "" :: string(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         rank_lev = 1 :: non_neg_integer(),
         rank_point = 0 :: non_neg_integer(),
         kill_num = 0,
         dead_num = 0,
         total_heal = 0,
         control_num = 0,
         total_hurt = 0 :: non_neg_integer(),
         total_dmg = 0 :: non_neg_integer(),
         mvp_score = 0 :: non_neg_integer()}).

-record(tournament_season_role,
        {ver = 0,
         id = {0, "", 0} :: tuple(),
         name = "" :: string(),
         reward_lev = 0 :: non_neg_integer(),
         rewarded = 0 :: non_neg_integer()}).

-record(tournament_result,
        {id = {0, "", 0},
         ver = 3,
         is_win = 1,
         mates = [],
         rival = [],
         match_id = 0,
         record_pz = {"", 0} :: tuple(),
         time = 0,
         rank_lev = 0}).

-record(tournament_result_role,
        {id = {0, "", 0},
         ver = 1,
         recent = [],
         last_recent = []}).

-record(king_badge,
        {id = 0,
         status = 0,
         active_effect_type = 3,
         active_attr = [],
         fc = 0}).

-record(tournament_match_report_info,
        {match_id, can_report = [], result}).

-file("src/mod/tournament/tournament_season.erl", 28).

init() ->
    dets:open_file(tournament_season_role,
                   [{file, "./dets/tournament_season_role.dets"},
                    {keypos, #tournament_season_role.id}]),
    ets:new(tournament_season_role,
            [set,
             named_table,
             public,
             {keypos, #tournament_season_role.id}]),
    load_data().

reset(Type, NewSeasonId) ->
    case erlang:date() of
        {Year, Month, 21}
            when Year =/= 2016 orelse Month =/= 8 ->
            L = ets:tab2list(tournament_profile),
            do_reset(L, Type),
            env:save(tournament_season_id, NewSeasonId),
            env:save(tournament_season_counted, date:unixtime()),
            true;
        _ when Type =:= gm_count ->
            L = ets:tab2list(tournament_profile),
            do_reset(L, count),
            env:save(tournament_season_id, NewSeasonId),
            env:save(tournament_season_counted, date:unixtime()),
            true;
        _ when Type =:= gm_reset ->
            L = ets:tab2list(tournament_profile),
            do_reset(L, reset),
            env:save(tournament_season_id, NewSeasonId),
            true;
        _ -> false
    end.

gm_reset_mvp() ->
    L = ets:tab2list(tournament_profile),
    gm_reset_mvp(L).

gm_reset_mvp([]) -> ok;
gm_reset_mvp([P = #tournament_profile{} | T]) ->
    P1 = P#tournament_profile{season_mvp = 0},
    ets:insert(tournament_profile, P1),
    dets:insert(tournament_profile, P1),
    gm_reset_mvp(T).

count(#tournament_profile{id = Id, name = Name,
                          combat_count = Num, rank_lev = SeasonLev}) ->
    SeasonRewardLev = case Num > 0 of
                          true -> SeasonLev;
                          _ -> 0
                      end,
    C = #tournament_season_role{id = Id, name = Name,
                                reward_lev = SeasonRewardLev, rewarded = 0},
    ets:insert(tournament_season_role, C),
    dets:insert(tournament_season_role, C).

reward(Role = #role{id = Id}) ->
    case ets:lookup(tournament_season_role, Id) of
        [#tournament_season_role{reward_lev = 0}] ->
            {false, lang:get("不能领取")};
        [C = #tournament_season_role{rewarded = 0,
                                     reward_lev = RewardLev}] ->
            case tournament_data:get(RewardLev) of
                #{final_reward := Rewards} ->
                    Items = [{I, 0, N} || {I, N} <- Rewards],
                    Gain = format:val_to_gain(Items),
                    C1 = C#tournament_season_role{rewarded =
                                                      date:unixtime()},
                    case role_gain:do_notice(Gain, Role) of
                        {ok, Role1} ->
                            ets:insert(tournament_season_role, C1),
                            dets:insert(tournament_season_role, C1),
                            Role2 = looks:calc(Role1),
                            {ok, Role2};
                        {false, #gain{reason = bag_full}} ->
                            Title = lang:get("武道会赛季奖励"),
                            Content = lang:get("背包已满，奖励通过邮件发送，请查收。"),
                            mail:send(Role,
                                      #{title => Title, content => Content,
                                        items => Items}),
                            ets:insert(tournament_season_role, C1),
                            dets:insert(tournament_season_role, C1),
                            Role2 = looks:calc(Role),
                            {ok, Role2};
                        {false, #gain{msg = Msg}} -> {false, Msg}
                    end;
                _ -> {false, lang:get("你的武道等级不能领取奖励")}
            end;
        [#tournament_season_role{}] ->
            {false, lang:get("你已经领取过了")};
        _ -> {false, lang:get("当前不能领取")}
    end.

check(#role{id = Id}) ->
    case ets:lookup(tournament_season_role, Id) of
        [C = #tournament_season_role{rewarded = 0,
                                     reward_lev = RewardLev}]
            when RewardLev > 0 ->
            case tournament_data:get(RewardLev) of
                #{final_reward := Rewards,
                  icon_frame_item_id := FrameId} ->
                    NewRankLev = case tournament_agent:get_profile(Id) of
                                     #tournament_profile{rank_lev = Rl} -> Rl;
                                     _ -> 1
                                 end,
                    {false,
                     {env:get(tournament_season_id),
                      NewRankLev,
                      C,
                      [{FrameId, 1} | Rewards]}};
                #{final_reward := Rewards} ->
                    NewRankLev = case tournament_agent:get_profile(Id) of
                                     #tournament_profile{rank_lev = Rl} -> Rl;
                                     _ -> 1
                                 end,
                    {false,
                     {env:get(tournament_season_id),
                      NewRankLev,
                      C,
                      Rewards}};
                _ -> true
            end;
        _ -> true
    end.

get_icon_frame(#role{id = Id}) ->
    case ets:lookup(tournament_season_role, Id) of
        [#tournament_season_role{reward_lev = RewardLev,
                                 rewarded = Rewarded}]
            when RewardLev > 0 andalso Rewarded > 0 ->
            case tournament_data:get(RewardLev) of
                #{icon_frame_id := IconFrame} -> IconFrame;
                _ -> 0
            end;
        _ -> 0
    end.

calc_max_join(Max, Acc) ->
    case erlang:date() of
        {_, _, 21} -> Max;
        _ -> Max + Acc
    end.

auto_reward() ->
    case env:get(tournament_season_counted) of
        Time when is_integer(Time) ->
            case date:is_same_day(Time, date:unixtime()) of
                true ->
                    do_auto_reward(ets:tab2list(tournament_season_role));
                _ -> ok
            end;
        _ -> ok
    end.

gm_compensate() -> do_compensate().

gm_fix() ->
    Now = date:unixtime(),
    L = ets:tab2list(tournament_profile),
    do_fix(L, Now).

do_reset([], _) -> ok;
do_reset([P = #tournament_profile{id = Id,
                                  rank_lev = OldRankLev,
                                  season_rank_lev = SeasonRankLev,
                                  season_rank_point = SeasonPoint}
          | T],
         Type) ->
    NewRankLev = case tournament_data:get(OldRankLev) of
                     #{season_new_lev := NewLv} -> NewLv;
                     _ -> 1
                 end,
    NewRankPoint = case tournament_data:get(NewRankLev) of
                       #{rank_point := Rp} -> Rp;
                       _ -> 0
                   end,
    P1 = P#tournament_profile{rank_lev = NewRankLev,
                              rank_point = NewRankPoint,
                              season_rank_lev = NewRankLev,
                              season_rank_point = NewRankPoint,
                              combat_count = 0, win_count = 0,
                              win_sustained = 0, season_kill = 0,
                              season_reverse = 0, season_revive = 0,
                              season_dmg = 0, season_bearing_dmg = 0,
                              season_zero_dmg = 0, season_pet_revive = 0,
                              season_awesome_kill = 0,
                              season_awesome_kill_num = 0,
                              season_awesome_dmg = 0, season_awesome_heal = 0,
                              season_awesome_control = 0, season_mvp = 0,
                              season_loss_mvp = 0, best_partner = [],
                              best_rank_lev = SeasonRankLev,
                              best_rank_point = SeasonPoint, promotion_win = 0,
                              upgrade_point = 0},
    ets:insert(tournament_profile, P1),
    dets:insert(tournament_profile, P1),
    case Type of
        count -> count(P);
        _ -> ok
    end,
    role:pack_send(Id, 16405, {P1}),
    do_reset(T, Type).

load_data() ->
    dets:to_ets(tournament_season_role,
                tournament_season_role).

do_auto_reward([]) -> ok;
do_auto_reward([C = #tournament_season_role{id = Rid,
                                            reward_lev = RewardLev,
                                            rewarded = 0}
                | T]) ->
    case tournament_data:get(RewardLev) of
        #{final_reward := Rewards, season_new_lev := NewLev,
          icon_frame_item_id := IconFrameItemId} ->
            Items = [{I, 0, N} || {I, N} <- Rewards],
            C1 = C#tournament_season_role{rewarded =
                                              date:unixtime()},
            Title = lang:get("武道会赛季奖励"),
            Content = case IconFrameItemId of
                          0 ->
                              Fmt =
                                  lang:get("征战了一个赛季，恭喜你获得~ts头衔。根据本赛季的表现，你获得了以下奖励。新赛季将以~ts"
                                           "作为起点，期待你在天下第一武道会一战成名！{face_1,25}"),
                              notice:format(Fmt,
                                            [{string_2,
                                              1,
                                              tournament_data:get_name(RewardLev)},
                                             {string_2,
                                              1,
                                              tournament_data:get_name(NewLev)}]);
                          _ ->
                              Fmt =
                                  lang:get("征战了一个赛季，恭喜你获得~ts头衔。根据本赛季的表现，你获得了~ts及以下奖励。新赛季将"
                                           "以~ts作为起点，期待你在天下第一武道会一战成名！{face_1,25}"),
                              notice:format(Fmt,
                                            [{string_2,
                                              1,
                                              tournament_data:get_name(RewardLev)},
                                             {item_2, IconFrameItemId},
                                             {string_2,
                                              1,
                                              tournament_data:get_name(NewLev)}])
                      end,
            mail:send(Rid,
                      #{title => Title, content => Content, items => Items}),
            ets:insert(tournament_season_role, C1),
            dets:insert(tournament_season_role, C1);
        #{final_reward := Rewards, season_new_lev := NewLev} ->
            Items = [{I, 0, N} || {I, N} <- Rewards],
            C1 = C#tournament_season_role{rewarded =
                                              date:unixtime()},
            Title = lang:get("武道会赛季奖励"),
            Fmt =
                lang:get("征战了一个赛季，恭喜你获得~ts头衔。根据本赛季的表现，你获得了以下奖励。新赛季将以~ts"
                         "作为起点，期待你在天下第一武道会一战成名！{face_1,25}"),
            Content = notice:format(Fmt,
                                    [{string_2,
                                      1,
                                      tournament_data:get_name(RewardLev)},
                                     {string_2,
                                      1,
                                      tournament_data:get_name(NewLev)}]),
            mail:send(Rid,
                      #{title => Title, content => Content, items => Items}),
            ets:insert(tournament_season_role, C1),
            dets:insert(tournament_season_role, C1);
        _ -> ok
    end,
    do_auto_reward(T);
do_auto_reward([_ | T]) -> do_auto_reward(T).

do_compensate() ->
    Now = date:unixtime(),
    do_compensate(ets:tab2list(tournament_profile), Now).

do_compensate([], _) -> ok;
do_compensate([#tournament_profile{id = Rid,
                                   best_rank_lev = Lev, last_matched = Last}
               | T],
              Now) ->
    L = [{{15508, "beta", 2}, 6},
         {{29784, "beta", 1}, 8},
         {{19588, "beta", 1}, 8},
         {{7309, "beta", 4}, 7},
         {{7968, "beta", 4}, 10},
         {{36829, "beta", 1}, 3},
         {{1109, "beta", 1}, 8},
         {{6691, "beta", 4}, 8},
         {{2725, "beta", 4}, 10},
         {{30347, "beta", 4}, 5},
         {{30758, "beta", 4}, 7},
         {{32130, "beta", 1}, 2},
         {{26302, "beta", 2}, 7},
         {{29076, "beta", 1}, 2},
         {{53, "beta", 3}, 6},
         {{45974, "beta", 1}, 7},
         {{350, "beta", 1}, 8},
         {{26759, "beta", 2}, 5},
         {{2716, "beta", 1}, 6},
         {{9757, "beta", 2}, 8},
         {{12, "beta", 2}, 8},
         {{41642, "beta", 1}, 4},
         {{25438, "beta", 4}, 8},
         {{15215, "beta", 2}, 3},
         {{48, "beta", 4}, 8},
         {{9155, "beta", 4}, 8},
         {{16039, "beta", 2}, 8},
         {{39346, "beta", 1}, 8},
         {{6416, "beta", 1}, 6},
         {{39793, "beta", 3}, 4},
         {{35751, "beta", 3}, 2},
         {{3838, "beta", 1}, 4},
         {{5723, "beta", 4}, 6},
         {{1793, "beta", 1}, 8},
         {{6547, "beta", 4}, 6},
         {{34064, "beta", 3}, 4},
         {{9203, "beta", 3}, 7},
         {{25037, "beta", 3}, 5},
         {{23322, "beta", 3}, 8},
         {{9417, "beta", 1}, 8},
         {{38707, "beta", 1}, 3},
         {{30273, "beta", 3}, 8},
         {{10864, "beta", 4}, 10},
         {{573, "beta", 1}, 7},
         {{20388, "beta", 4}, 7},
         {{945, "beta", 1}, 4},
         {{46909, "beta", 1}, 7},
         {{41306, "beta", 1}, 6},
         {{11434, "beta", 4}, 8},
         {{12627, "beta", 2}, 8},
         {{976, "beta", 3}, 6},
         {{668, "beta", 1}, 5},
         {{44682, "beta", 1}, 3},
         {{23253, "beta", 2}, 6},
         {{26963, "beta", 1}, 6},
         {{30032, "beta", 4}, 5},
         {{44463, "beta", 1}, 5},
         {{3414, "beta", 1}, 8},
         {{223, "beta", 3}, 6},
         {{5968, "beta", 1}, 7},
         {{18069, "beta", 4}, 7},
         {{30342, "beta", 3}, 5},
         {{36350, "beta", 1}, 7},
         {{143, "beta", 3}, 7},
         {{42925, "beta", 1}, 3},
         {{44856, "beta", 1}, 6},
         {{4669, "beta", 3}, 4},
         {{30048, "beta", 4}, 7},
         {{121, "beta", 3}, 6},
         {{918, "beta", 3}, 8},
         {{13, "beta", 2}, 8},
         {{6714, "beta", 4}, 7},
         {{30579, "beta", 4}, 7},
         {{2291, "beta", 4}, 7},
         {{28952, "beta", 4}, 7},
         {{495, "beta", 4}, 8},
         {{238, "beta", 2}, 5},
         {{2, "beta", 1}, 7},
         {{208, "beta", 1}, 7},
         {{41636, "beta", 1}, 7},
         {{32195, "beta", 4}, 8},
         {{47162, "beta", 1}, 5},
         {{46247, "beta", 3}, 6},
         {{41671, "beta", 1}, 7},
         {{15589, "beta", 1}, 6},
         {{34447, "beta", 3}, 8},
         {{40147, "beta", 1}, 6},
         {{45079, "beta", 3}, 7},
         {{4617, "beta", 2}, 8},
         {{45235, "beta", 3}, 5},
         {{42465, "beta", 1}, 7},
         {{45768, "beta", 1}, 3},
         {{39191, "beta", 1}, 4},
         {{3954, "beta", 4}, 7},
         {{27084, "beta", 3}, 5},
         {{17141, "beta", 2}, 5},
         {{47140, "beta", 4}, 4},
         {{42937, "beta", 1}, 4},
         {{11809, "beta", 2}, 8},
         {{35489, "beta", 1}, 5},
         {{1148, "beta", 1}, 7},
         {{19129, "beta", 1}, 5},
         {{11585, "beta", 4}, 5},
         {{42270, "beta", 3}, 5},
         {{154, "beta", 3}, 5},
         {{1247, "beta", 2}, 4},
         {{46984, "beta", 1}, 5},
         {{5237, "beta", 2}, 6},
         {{29234, "beta", 4}, 6},
         {{24640, "beta", 3}, 3},
         {{41809, "beta", 1}, 5},
         {{46297, "beta", 3}, 2},
         {{11072, "beta", 2}, 8},
         {{43284, "beta", 1}, 7},
         {{87, "beta", 4}, 8},
         {{14815, "beta", 1}, 7},
         {{5654, "beta", 3}, 8},
         {{47506, "beta", 1}, 2},
         {{45249, "beta", 1}, 4},
         {{13007, "beta", 1}, 10},
         {{35670, "beta", 1}, 6},
         {{14842, "beta", 2}, 5},
         {{46824, "beta", 1}, 3},
         {{13616, "beta", 1}, 6},
         {{5541, "beta", 2}, 8},
         {{24643, "beta", 1}, 7},
         {{47975, "beta", 1}, 4},
         {{131, "beta", 2}, 8},
         {{47711, "beta", 2}, 6},
         {{47671, "beta", 2}, 2},
         {{130, "beta", 4}, 6},
         {{15302, "beta", 2}, 6},
         {{11499, "beta", 2}, 4},
         {{163, "beta", 3}, 8},
         {{47459, "beta", 1}, 5},
         {{47785, "beta", 3}, 7},
         {{10132, "beta", 1}, 6},
         {{32716, "beta", 4}, 4},
         {{47798, "beta", 1}, 3},
         {{43735, "beta", 2}, 5},
         {{47868, "beta", 1}, 5},
         {{3800, "beta", 2}, 5},
         {{25171, "beta", 2}, 6},
         {{33355, "beta", 1}, 6},
         {{30135, "beta", 3}, 3},
         {{6470, "beta", 1}, 6},
         {{44874, "beta", 1}, 4},
         {{16, "beta", 3}, 8},
         {{18005, "beta", 2}, 8},
         {{24834, "beta", 4}, 8},
         {{370, "beta", 3}, 8},
         {{4012, "beta", 2}, 10},
         {{4374, "beta", 2}, 5},
         {{4560, "beta", 4}, 6},
         {{2389, "beta", 3}, 7},
         {{38260, "beta", 1}, 6},
         {{23557, "beta", 1}, 8},
         {{47943, "beta", 1}, 5},
         {{620, "beta", 1}, 7},
         {{23455, "beta", 3}, 7},
         {{30878, "beta", 3}, 7},
         {{1162, "beta", 4}, 8},
         {{16038, "beta", 4}, 8},
         {{47490, "beta", 1}, 6},
         {{32156, "beta", 4}, 7},
         {{47857, "beta", 3}, 2},
         {{48235, "beta", 1}, 6},
         {{30861, "beta", 4}, 8},
         {{43610, "beta", 2}, 3},
         {{2908, "beta", 2}, 8},
         {{30691, "beta", 1}, 8},
         {{11942, "beta", 2}, 8},
         {{44811, "beta", 1}, 8},
         {{17421, "beta", 2}, 5},
         {{29371, "beta", 1}, 8},
         {{18572, "beta", 4}, 4},
         {{45093, "beta", 3}, 5},
         {{48254, "beta", 2}, 4},
         {{12942, "beta", 4}, 10},
         {{14208, "beta", 1}, 6},
         {{47197, "beta", 1}, 3},
         {{8898, "beta", 4}, 8},
         {{13298, "beta", 4}, 2},
         {{32636, "beta", 4}, 7},
         {{32089, "beta", 4}, 8},
         {{27473, "beta", 2}, 4},
         {{26658, "beta", 3}, 8},
         {{47153, "beta", 2}, 4},
         {{44444, "beta", 1}, 4},
         {{45767, "beta", 1}, 2},
         {{29334, "beta", 3}, 6},
         {{25337, "beta", 4}, 5},
         {{18275, "beta", 4}, 8},
         {{4285, "beta", 4}, 2},
         {{38120, "beta", 1}, 7},
         {{29814, "beta", 3}, 8},
         {{197, "beta", 3}, 8},
         {{47824, "beta", 1}, 5},
         {{26640, "beta", 2}, 3},
         {{46646, "beta", 4}, 3},
         {{1382, "beta", 4}, 5},
         {{30277, "beta", 4}, 6},
         {{7104, "beta", 3}, 7},
         {{13251, "beta", 2}, 6},
         {{43607, "beta", 1}, 3},
         {{43024, "beta", 3}, 6},
         {{218, "beta", 4}, 8},
         {{11534, "beta", 4}, 5},
         {{37336, "beta", 1}, 5},
         {{9657, "beta", 1}, 8},
         {{20837, "beta", 2}, 8},
         {{4800, "beta", 3}, 7},
         {{25685, "beta", 4}, 8},
         {{46901, "beta", 2}, 2},
         {{48348, "beta", 1}, 2},
         {{44291, "beta", 1}, 6},
         {{7017, "beta", 1}, 8},
         {{48457, "beta", 3}, 3},
         {{27542, "beta", 4}, 8},
         {{5301, "beta", 1}, 7},
         {{43138, "beta", 1}, 5},
         {{11166, "beta", 2}, 8},
         {{40207, "beta", 3}, 3},
         {{48845, "beta", 3}, 2},
         {{51, "beta", 4}, 6},
         {{10125, "beta", 3}, 8},
         {{17313, "beta", 3}, 10},
         {{26669, "beta", 3}, 3},
         {{40099, "beta", 2}, 6},
         {{13321, "beta", 4}, 7},
         {{1326, "beta", 1}, 8},
         {{47552, "beta", 1}, 3},
         {{11220, "beta", 4}, 8},
         {{37724, "beta", 1}, 5},
         {{47054, "beta", 1}, 3},
         {{30601, "beta", 3}, 4},
         {{10038, "beta", 4}, 7},
         {{23111, "beta", 1}, 10},
         {{48619, "beta", 1}, 3},
         {{12309, "beta", 1}, 10},
         {{47746, "beta", 3}, 2},
         {{47964, "beta", 1}, 3},
         {{1237, "beta", 2}, 8},
         {{49286, "beta", 1}, 2},
         {{49059, "beta", 1}, 2},
         {{48601, "beta", 1}, 2},
         {{23497, "beta", 1}, 8},
         {{48477, "beta", 1}, 2},
         {{25118, "beta", 2}, 3},
         {{890, "beta", 4}, 6},
         {{23041, "beta", 3}, 10},
         {{49255, "beta", 1}, 2},
         {{47744, "beta", 3}, 3}],
    DayDiff = date:day_diff(Now, Last),
    case tournament_data:get(Lev) of
        _ when DayDiff > 40 -> ok;
        #{final_reward := Rewards} ->
            Items = [{I, 0, N} || {I, N} <- Rewards],
            Title = lang:get("武道会补偿"),
            Content =
                lang:get("亲爱的玩家：\n由于第二赛季武道会结算异常，部分玩家赛季奖励发放错误，现为您补发第二赛季结"
                         "算奖励，还请您笑纳，对您造成的不便我们深表歉意，还望您继续支持《星辰奇缘》！"),
            case lists:keyfind(Rid, 1, L) of
                false ->
                    mail:send(Rid,
                              #{title => Title, content => Content,
                                items => Items});
                _ -> ok
            end;
        _ -> ok
    end,
    do_compensate(T, Now).

do_fix([], _Now) -> ok;
do_fix([P = #tournament_profile{id = Id,
                                last_matched = Last}
        | T],
       Now) ->
    case date:is_same_day(Last, Now) of
        true ->
            P1 = P#tournament_profile{last_matched = Now - 86400},
            ets:insert(tournament_profile, P1),
            dets:insert(tournament_profile, P1),
            role:pack_send(Id, 16405, {P1});
        _ -> ok
    end,
    do_fix(T, Now).

backup_profile_update_season() ->
    Plat = env:get(platform),
    ZoneId = env:get(zone_id),
    Path =
        util:flist("/data/db_backup/09/data/zone/fswy_~ts_~w/dets"
                   "/tournament_profile.dets",
                   [Plat, ZoneId]),
    dets:open_file(tournament_profile_backup,
                   [{file, Path}, {keypos, #tournament_profile.id}]),
    Fun = fun (P = #tournament_profile{}, _) -> count(P);
              (_, _) -> ok
          end,
    dets:foldl(Fun, ok, tournament_profile_backup),
    dets:close(tournament_profile_backup).

