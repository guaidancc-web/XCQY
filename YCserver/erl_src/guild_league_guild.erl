-file("src/mod/guild/guild_league_guild.erl", 1).

-module(guild_league_guild).

-export([find_today/1,
         get_qualified/0,
         calc_strenth/2,
         update/1,
         init_grade/0,
         pair/1,
         pre_pair/2,
         lookup/1,
         get_name/2,
         save_result/3,
         acc_win/2,
         load_data/1,
         group_by_platform/2,
         get_opposite_side/1,
         check_alliance/2,
         set_trump/1,
         sync_data/1,
         sync_log_index/0,
         update_rank/0,
         reset_rank/1,
         reset_score/0,
         update_grade_rank/1,
         round_robin/2,
         reset_grade/1,
         update_champion/2,
         subsidize_buff/1,
         test_reset_grade/0,
         clear_all/0]).

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

-file("src/mod/guild/guild_league_guild.erl", 40).

-file("inc/guild.hrl", 1).

-type guild_id() :: {non_neg_integer(),
                     list(),
                     non_neg_integer()}.

-record(guild_apply,
        {id = {0, "", 0},
         name = "",
         classes = 0,
         sex = 0,
         lev = 1,
         time = 0,
         type = 0,
         looks = [],
         cup = 0 :: non_neg_integer(),
         donation = 0 :: non_neg_integer(),
         tag = 0 :: non_neg_integer(),
         msg = "" :: string()}).

-record(guild_envelop,
        {ver = 1,
         title = "" :: string(),
         amount = 0 :: non_neg_integer(),
         remain = 0 :: non_neg_integer(),
         total = 0 :: non_neg_integer(),
         num = 0 :: non_neg_integer(),
         time = 0 :: non_neg_integer(),
         packs = [],
         log = [] :: list()}).

-record(guild_role,
        {id = {1, "", 0} ::
             {pos_integer(), list(), non_neg_integer()},
         pid :: undefined | pid(),
         name = "" :: list(),
         sex = 0 :: 0 | 1,
         classes = 0 :: 0..4,
         lev = 1 :: pos_integer(),
         lev_break_times = 0 :: non_neg_integer(),
         fc = 1 :: pos_integer(),
         synth_fc = 1 :: pos_integer(),
         post = 0 :: 0..5,
         status = 0 :: 0 | 1,
         last_login = 1 :: pos_integer(),
         last_logout = 1 :: pos_integer(),
         enter_time = 0 :: non_neg_integer(),
         signature = "" :: list(),
         value = 0,
         total_value = 0 :: non_neg_integer(),
         cup = 0 :: non_neg_integer(),
         looks = [],
         envelope = #guild_envelop{},
         requirement = [],
         signed = 0 :: non_neg_integer(),
         last_signed = 0 :: non_neg_integer(),
         mails = [],
         active = 0,
         ability = 0,
         chat_num = 0,
         doing = 0,
         chat_num_list = [],
         doing_list = [],
         element_attr = [] :: list(),
         tmp_element_attr = [] :: list()}).

-record(guild_leaver,
        {id = {1, "", 0} ::
             {pos_integer(), list(), non_neg_integer()},
         name = "" :: list(),
         guild_id = {1, "", 0} ::
             {pos_integer(), list(), non_neg_integer()},
         value = 0,
         total_value = 0 :: non_neg_integer(),
         time = 0 :: integer()}).

-record(guild_boss,
        {lev = 1 :: non_neg_integer(),
         step = 1 :: non_neg_integer(),
         unit_id = 0 :: non_neg_integer(),
         name = "",
         hp = 0 :: non_neg_integer(),
         hp_max = 0 :: non_neg_integer(),
         exp = 0 :: non_neg_integer(),
         called = 0 :: integer(),
         log = [] :: list(),
         last_renamed = 0 :: non_neg_integer()}).

-record(guild_mercenary,
        {id = {0, "", 0},
         key :: undefined | tuple(),
         lev = 0 :: non_neg_integer(),
         name = "" :: string(),
         dispatched = 0 :: non_neg_integer(),
         recruited = 0 :: non_neg_integer(),
         score = 0 :: non_neg_integer(),
         gain = [],
         guard :: undefined | tuple()}).

-record(guild_totem,
        {ver = 0 :: non_neg_integer(),
         id = util:rand_list([101, 102, 103, 104, 105]) ::
             non_neg_integer(),
         changeable = 1 :: non_neg_integer(),
         last_changed = 0 :: non_neg_integer()}).

-record(guild_question_answer,
        {ver = 0,
         id = {0, "", 0},
         name = "" :: string(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         guild_name = "" :: string(),
         option = 0 :: 0..4,
         result = 0 :: 0 | 1,
         score = 0 :: non_neg_integer(),
         answered = 0 :: non_neg_integer(),
         totem_id = 0 :: non_neg_integer(),
         rank = 0 :: non_neg_integer()}).

-record(guild_question,
        {ver = 0,
         id = 0 :: non_neg_integer(),
         answer = 0 :: 0..4,
         asked = 0 :: non_neg_integer(),
         answers = [] :: [#guild_question_answer{}],
         cheat_off = [],
         asked_num = 0 :: non_neg_integer(),
         cheat_nums = []}).

-record(guild_robber,
        {ver = 0 :: non_neg_integer(),
         id :: undefined | tuple(),
         today_generated = 0 :: non_neg_integer(),
         gen_hour = 0 :: non_neg_integer(),
         gen_time = 0 :: non_neg_integer(),
         total_killed = 0 :: non_neg_integer(),
         last_killed = 0 :: non_neg_integer(),
         killed_time = 0 :: non_neg_integer(),
         fighters = [],
         picker = []}).

-record(guild_treasure,
        {ver = 1 :: non_neg_integer(),
         added = 0 :: non_neg_integer(),
         setting_chance = 0 :: non_neg_integer(),
         setting_time = 0 :: non_neg_integer(),
         gen_time = 0 :: non_neg_integer(),
         generated = 0 :: non_neg_integer(),
         unit_num = 0 :: non_neg_integer(),
         total_killed = 0 :: non_neg_integer(),
         last_killed = 0 :: non_neg_integer(),
         killed_time = 0 :: non_neg_integer(),
         can_open = 0 :: 0,
         fighters = [],
         picker = [],
         type = win}).

-record(guild_loot,
        {ver = 0, items = [], log = [], allocated = []}).

-record(guild_usurper,
        {ver = 0,
         id :: undefined | tuple(),
         name = "" :: string(),
         classes = 0,
         sex = 0,
         ctime = 0 :: integer()}).

-record(guild_invitation,
        {ver = 0,
         id :: undefined | tuple(),
         name = "" :: string(),
         classes = 0,
         sex = 0,
         lev = 0,
         ctime = 0 :: integer(),
         guild_id :: undefined | tuple(),
         guild_name = "" :: string()}).

-record(guild_plant_irrigator,
        {id = {0, "", 0} :: tuple(),
         name = "" :: string(),
         classes = 0,
         sex = 0,
         ctime = 0 :: integer()}).

-record(guild_plant,
        {ver = 0,
         pos = {0, 0},
         owner_rid = {0, "", 0},
         owner_name = "",
         irrigations = [],
         phase = 0,
         sowed = 0,
         matured = 0,
         fired = 0 :: 0 | 1,
         unit_id = {0, 0},
         unit_base_id = 0}).

-record(guild_union_apply,
        {ver = 0,
         id = {0, "", 0},
         name = "" :: string(),
         leader_id = {0, "", 0},
         leader_name = "" :: string(),
         ctime = 0 :: integer()}).

-record(guild_campaign,
        {acc = [] :: list(),
         can_reward = [] :: list(),
         rewarded = [] :: list()}).

-record(guild_camp_web,
        {acc = [] :: list(),
         can_reward = [] :: list(),
         rewarded = [] :: list(),
         overdue_time = 0 :: non_neg_integer(),
         end_reward = [] :: list(),
         time_list = [] :: list()}).

-record(element_info,
        {ver = 1, build_type = 0, lev = 1, time = 0}).

-record(guild,
        {id = {0, "", 0} ::
             {non_neg_integer(), list(), non_neg_integer()},
         ver = 21 :: non_neg_integer(),
         name = "" :: list(),
         assets = 5000000,
         max_assets = 5000000,
         upkeep = 0,
         pid :: undefined | pid(),
         leader_name = "" :: list(),
         leader_id = {0, "", 0} ::
             {non_neg_integer(), list(), non_neg_integer()},
         leader_sex = 0 :: 0 | 1,
         leader_classes = 0 :: 0..6,
         leader_lev = 0 :: non_neg_integer(),
         members = [] :: [#guild_role{}],
         mem_num = 0 :: non_neg_integer(),
         fresh_num = 0 :: non_neg_integer(),
         max_mem_num = 90,
         max_fresh_num = 100,
         board = "" :: list(),
         health = 100,
         join_type = 2,
         join_condition = [],
         apply_list = [],
         event_list = [],
         lev = 1 :: pos_integer(),
         lev_time = 0 :: non_neg_integer(),
         academy_lev = 0 :: non_neg_integer(),
         academy_time = 0 :: non_neg_integer(),
         store_lev = 0 :: non_neg_integer(),
         store_time = 0 :: non_neg_integer(),
         exchequer_lev = 0 :: non_neg_integer(),
         exchequer_time = 0 :: non_neg_integer(),
         lev_ref :: undefined | reference(),
         welfare_time = 0,
         welfare_list = [],
         store_tick_time = 0,
         store_list = [],
         create_time = 0,
         flag = 0,
         map_pid = 0,
         map_id = 0,
         boss = #guild_boss{},
         mercenarys = [] :: [#guild_mercenary{}],
         totem = #guild_totem{} :: #guild_totem{},
         question = #guild_question{},
         robber_num = 0 :: non_neg_integer(),
         robber_total_num = 0 :: non_neg_integer(),
         usurpers = [],
         activity = 0,
         plants = [],
         announcement = "" :: string(),
         union_applys = [] :: list(),
         union_applied = [] :: list(),
         today_used_medal = 0 :: integer(),
         last_medal_used = 0 :: integer(),
         today_upgraded_build = 0 :: integer(),
         last_build_upgraded = 0 :: integer(),
         today_destory_build = 0 :: integer(),
         last_build_destory = 0 :: integer(),
         treasure = #guild_treasure{},
         loot = #guild_loot{},
         week_assets = 0 :: integer(),
         formalizing_lev = 35 :: integer(),
         name_used = "" :: string(),
         create_id = {0, "", 0},
         create_name = "",
         guild_camp = #guild_campaign{},
         guild_camp_web = #guild_camp_web{},
         max_chat_num = 0,
         max_doing = 0,
         max_fc = 0,
         max_synth_fc = 0,
         element_info = [],
         uplev_element_times = 0,
         last_uplev_element = 0,
         upgrade_element_time = 0,
         mail_list = [],
         limit_mode = 0,
         is_lock_board = 0,
         board_id = {0, "", 0},
         announce_id = {0, "", 0}}).

-record(guild_element_attr,
        {ver = 1,
         effect_obj = 1,
         attr = [],
         attr_snd = [],
         add_skill_list = [],
         high_attr = [],
         end_time = 0}).

-record(m_guild,
        {ver = 3 :: pos_integer(),
         id = {0, "", 0} ::
             {non_neg_integer(), list(), non_neg_integer()},
         name = "" :: list(),
         pid :: undefined | pid(),
         enter_time = 0,
         guild_lev = 1,
         post = 0 :: non_neg_integer(),
         value = 0,
         total_value = 0 :: non_neg_integer(),
         signature = "" :: list(),
         element_attr = [] :: list(),
         tmp_element_attr = [] :: list(),
         build_speed_num = 0 :: non_neg_integer()}).

-record(guild_emblem,
        {ver = 0, id = 0, type = 0, lev = 0}).

-record(m_guild_emblem,
        {ver = 0 :: non_neg_integer(),
         remain_point = 0 :: non_neg_integer(),
         total_point = 0 :: non_neg_integer(),
         emblems = []}).

-file("src/mod/guild/guild_league_guild.erl", 41).

-file("inc/rank.hrl", 1).

-record(rank,
        {type = 1,
         show_list = [],
         list = [],
         last_val = 0,
         len = 0}).

-record(rank_rc,
        {ver = 3 :: pos_integer(),
         id = {roleid, platform, zoneid} :: term(),
         rank = 1,
         time = 0 :: non_neg_integer(),
         role_id = 0 :: non_neg_integer(),
         platform = "" :: list(),
         zone_id = 0 :: non_neg_integer(),
         name = "" :: list(),
         sex = 0 :: 0..2,
         classes = 0 :: 0..4,
         lev = 0 :: non_neg_integer(),
         val1 = 0 :: non_neg_integer(),
         val2 = 0 :: non_neg_integer(),
         val3 = 0 :: non_neg_integer(),
         val4 = 0 :: non_neg_integer(),
         desc = "",
         pet,
         guard,
         eqm}).

-record(rank_cfg,
        {type = 0 :: non_neg_integer(),
         num = 100 :: non_neg_integer(),
         keys = [#rank_rc.val3, #rank_rc.val2, #rank_rc.val1] ::
             [pos_integer()],
         min_val = 1 :: pos_integer(),
         nologin = 0 :: non_neg_integer(),
         zone = rank_zone_1 :: atom()}).

-file("src/mod/guild/guild_league_guild.erl", 42).

-file("inc/guild_league.hrl", 1).

-record(guild_league_role,
        {id = {0, "", 0} :: tuple(),
         gid = {0, "", 0} :: tuple(),
         ver = 1,
         name = "" :: bitstring(),
         sex = 0 :: 0..1,
         classes = 0 :: 0..4,
         lev = 0 :: non_neg_integer(),
         win = 0 :: non_neg_integer(),
         lost = 0 :: non_neg_integer(),
         to_war = 0,
         movability = 500 :: non_neg_integer(),
         match_id = 0 :: non_neg_integer(),
         side = 1,
         pid :: undefined | reference(),
         phase = 0 :: non_neg_integer(),
         season = 0 :: non_neg_integer(),
         key = {{0, "", 0}, 0},
         last_killed = 0 :: non_neg_integer(),
         picked = 0 :: non_neg_integer(),
         last_win = 0 :: non_neg_integer(),
         score = 0 :: non_neg_integer(),
         is_trump = 0,
         operating_unit = 0 :: 0 | tuple(),
         last_operated = 0 :: non_neg_integer(),
         attacked_unit = 0 :: non_neg_integer(),
         guarded_unit = 0 :: non_neg_integer(),
         cannon_attacked = 0 :: non_neg_integer(),
         cannon_used = 0 :: non_neg_integer(),
         guarding_unit = 0 :: non_neg_integer(),
         operating_num = 0 :: non_neg_integer()}).

-record(guild_league_guild,
        {id = {0, "", 0} :: tuple(),
         key = {{0, "", 0}, 0, 0},
         ver = 5,
         name = "" :: bitstring(),
         lev = 0 :: non_neg_integer(),
         leader_name = "" :: list(),
         leader_id = {0, "", 0} ::
             {non_neg_integer(), list(), non_neg_integer()},
         match_id = 0 :: non_neg_integer(),
         member_num = 0 :: non_neg_integer(),
         win = 0 :: non_neg_integer(),
         side = 1,
         totem = 0 :: non_neg_integer(),
         phase = 0 :: non_neg_integer(),
         grade = 4 :: non_neg_integer(),
         season = 0 :: non_neg_integer(),
         group = 0 :: non_neg_integer(),
         order = 0 :: non_neg_integer(),
         time = 0 :: non_neg_integer(),
         is_win = 0 :: non_neg_integer(),
         score = 0 :: non_neg_integer(),
         strenth = 0 :: non_neg_integer(),
         members = [],
         trumps = [],
         attacked_unit = 0 :: non_neg_integer(),
         consecutive_win = 0 :: non_neg_integer(),
         season_consecutive_win = 0 :: non_neg_integer(),
         avg_lev = 0 :: non_neg_integer(),
         eliminated = 8 :: non_neg_integer()}).

-record(guild_league_match,
        {id = {0, 0} :: {non_neg_integer(), non_neg_integer()},
         pid :: undefined | pid(),
         map_id = 0 :: non_neg_integer(),
         map_pid = 0 :: pid(),
         battle_id = 0 :: non_neg_integer(),
         battle_pid = 0 :: pid(),
         win_side = 0,
         time = 0 :: non_neg_integer(),
         phase = 0,
         season = 0 :: non_neg_integer(),
         combat_time = 0,
         is_judge = false,
         can_join = false,
         cannon_ready = false,
         later_phase = 0 :: non_neg_integer(),
         grade = 0 :: non_neg_integer(),
         type = 0 :: non_neg_integer()}).

-record(guild_league_alliance,
        {id = {0, 0} :: {integer(), integer()},
         gids = [] :: list(),
         names = [],
         totems = [] :: list(),
         win = 0 :: non_neg_integer(),
         lost = 0 :: non_neg_integer(),
         movability = 0 :: non_neg_integer(),
         member_num = 0 :: non_neg_integer(),
         members = [],
         remain_num = 0,
         match_id = 0 :: non_neg_integer(),
         side = 1,
         totem = 0 :: non_neg_integer(),
         map_id = 0 :: non_neg_integer(),
         map_pid = 0 :: pid(),
         phase = 0 :: non_neg_integer(),
         season = 0 :: non_neg_integer(),
         time = 0 :: non_neg_integer(),
         is_win = 0 :: non_neg_integer(),
         score = 0 :: non_neg_integer(),
         duration = 0 :: non_neg_integer(),
         attacked_unit = 0 :: non_neg_integer(),
         guarded_unit = 0 :: non_neg_integer(),
         remain_unit = 3 :: non_neg_integer(),
         grade = 4 :: non_neg_integer(),
         subsidize_buff = [] :: list()}).

-record(guild_league_trump,
        {id = {0, "", 0} :: tuple(),
         gid = {0, "", 0} :: tuple(),
         name = "" :: bitstring(),
         sex = 0 :: 0..1,
         classes = 0 :: 0..4,
         lev = 0 :: non_neg_integer(),
         pos = 1 :: non_neg_integer()}).

-record(guild_league_unit,
        {id = {0, 0} :: tuple(),
         phase = 0,
         season = 0 :: non_neg_integer(),
         grade = 4 :: non_neg_integer(),
         match_id = 0 :: non_neg_integer(),
         battle_id = 0 :: non_neg_integer(),
         side = 0,
         duration = 1000 :: non_neg_integer(),
         operators = [] :: list(),
         last_operated = 0 :: non_neg_integer()}).

-record(guild_league_operator,
        {id = {0, "", 0} :: tuple(),
         gid = {0, "", 0} :: tuple(),
         name = "" :: bitstring(),
         sex = 0 :: 0..1,
         classes = 0 :: 0..4,
         lev = 0 :: non_neg_integer(),
         side = 0,
         timeout = 0 :: non_neg_integer()}).

-record(guild_league_summary,
        {id = {0, "", 0} :: tuple(),
         ver = 4,
         name = "" :: bitstring(),
         lev = 0 :: non_neg_integer(),
         leader_name = "" :: list(),
         leader_id = {0, "", 0} ::
             {non_neg_integer(), list(), non_neg_integer()},
         member_num = 0 :: non_neg_integer(),
         season_win = 0 :: non_neg_integer(),
         season_lost = 0 :: non_neg_integer(),
         season_draw = 0 :: non_neg_integer(),
         total_win = 0 :: non_neg_integer(),
         totem = 0 :: non_neg_integer(),
         season_score = 0 :: non_neg_integer(),
         total_score = 0 :: non_neg_integer(),
         grade = 4 :: non_neg_integer(),
         rank = 0 :: non_neg_integer(),
         group = 0 :: non_neg_integer(),
         order = 0 :: non_neg_integer(),
         recent_matchs = [] :: list(),
         absence = 0 :: non_neg_integer(),
         attacked_unit = 0 :: non_neg_integer(),
         last_result = 0 :: non_neg_integer(),
         strenth = 0 :: non_neg_integer(),
         consecutive_win = 0 :: non_neg_integer(),
         season_consecutive_win = 0 :: non_neg_integer(),
         eliminated = 8 :: non_neg_integer()}).

-record(guild_league_guess,
        {id = {0, "", 0} :: tuple(),
         ver = 0 :: non_neg_integer(),
         name = "" :: bitstring(),
         sex = 0 :: 0..1,
         classes = 0 :: 0..4,
         lev = 0 :: non_neg_integer(),
         season = 0 :: non_neg_integer(),
         choices = [] :: list(),
         time = 0 :: non_neg_integer()}).

-record(guild_league_guess_choice,
        {gid = {0, "", 0} :: tuple(),
         phase = 0 :: non_neg_integer(),
         bingo = 0 :: 0..2}).

-record(guild_league_poll,
        {gid = {0, "", 0} :: tuple(),
         phase = 0 :: non_neg_integer(),
         voted = 0 :: non_neg_integer()}).

-record(guild_league_live,
        {id = 0 :: non_neg_integer(),
         phase = 0 :: non_neg_integer(),
         season = 0 :: non_neg_integer(),
         grade = 0 :: non_neg_integer(),
         type = 0 :: non_neg_integer(),
         time = 0 :: non_neg_integer(),
         names1 = [] :: string(),
         names2 = [] :: string(),
         logs = [] :: list()}).

-record(guild_league_champion,
        {season = 0 :: non_neg_integer(), top3 = []}).

-file("src/mod/guild/guild_league_guild.erl", 43).

find_today(#{phase := Phase, season := Season}) ->
    Now = date:unixtime(),
    case [G
          || G = #guild_league_guild{time = Time}
                 <- ets:match_object(guild_league_guild_log,
                                     #guild_league_guild{key =
                                                             {'_',
                                                              Phase,
                                                              Season},
                                                         score = 0, _ = '_'}),
             date:is_same_day(Time, Now)]
        of
        [] -> false;
        L -> do_find_today(L, [], [], [])
    end.

get_qualified() ->
    Now = date:unixtime(),
    Conds = [{'>=', '$3', 3}],
    MatchSpec = [{#guild{id = '$1', name = '$2', lev = '$3',
                         leader_id = '$4', leader_name = '$5', totem = '$6',
                         members = '$7', mem_num = '$8', _ = '_'},
                  Conds,
                  [{#guild_league_guild{id = '$1', name = '$2',
                                        lev = '$3', leader_id = '$4',
                                        leader_name = '$5', totem = '$6',
                                        members = '$7', member_num = '$8',
                                        key = ""}}]}],
    L = ets:select(guild_list, MatchSpec),
    calc_strenth(L, Now).

update([G = #guild_league_guild{} | T]) ->
    ets:insert(guild_league_guild, [G | T]),
    ets:insert(guild_league_guild_log, [G | T]),
    dets:insert(guild_league_guild_log, [G | T]);
update(G = #guild_league_guild{}) -> update([G]);
update([A = #guild_league_alliance{} | T]) ->
    ets:insert(guild_league_alliance, [A | T]),
    ets:insert(guild_league_alliance_log, [A | T]),
    dets:insert(guild_league_alliance_log, [A | T]);
update(A = #guild_league_alliance{}) -> update([A]);
update([R = #guild_league_role{} | T]) ->
    ets:insert(guild_league_role, [R | T]);
update(R = #guild_league_role{}) -> update([R]);
update([S = #guild_league_summary{} | T]) ->
    ets:insert(guild_league_summary, [S | T]),
    dets:insert(guild_league_summary, [S | T]);
update(S = #guild_league_summary{}) -> update([S]);
update([P = #guild_league_poll{} | T]) ->
    ets:insert(guild_league_poll, [P | T]),
    dets:insert(guild_league_poll, [P | T]);
update(P = #guild_league_poll{}) -> update([P]);
update([P = #guild_league_champion{} | T]) ->
    ets:insert(guild_league_champion, [P | T]),
    dets:insert(guild_league_champion, [P | T]);
update(P = #guild_league_champion{}) -> update([P]);
update(_R) ->
    logger:debug("未知数据 ~w", [_R], guild_league_guild, 106),
    ok.

delete([G = #guild_league_guild{} | T]) ->
    [ets:delete(guild_league_guild, I)
     || #guild_league_guild{id = I} <- [G | T]],
    [ets:delete(guild_league_guild_log, K)
     || #guild_league_guild{key = K} <- [G | T]],
    [dets:delete(guild_league_guild_log, K)
     || #guild_league_guild{key = K} <- [G | T]];
delete(G = #guild_league_guild{}) -> delete([G]);
delete([A = #guild_league_alliance{} | T]) ->
    [ets:delete(guild_league_alliance, I)
     || #guild_league_alliance{id = I} <- [A | T]],
    [ets:delete(guild_league_alliance_log, I)
     || #guild_league_alliance{id = I} <- [A | T]],
    [dets:delete(guild_league_alliance_log, I)
     || #guild_league_alliance{id = I} <- [A | T]];
delete(A = #guild_league_alliance{}) -> delete([A]);
delete([R = #guild_league_role{} | T]) ->
    [ets:delete(guild_league_role, I)
     || #guild_league_role{id = I} <- [R | T]];
delete(R = #guild_league_role{}) -> delete([R]);
delete([S = #guild_league_summary{} | T]) ->
    [ets:delete(guild_league_summary, I)
     || #guild_league_summary{id = I} <- [S | T]],
    [dets:delete(guild_league_summary, I)
     || #guild_league_summary{id = I} <- [S | T]];
delete(S = #guild_league_summary{}) -> delete([S]);
delete(_R) ->
    logger:debug("未知数据 ~w", [_R], guild_league_guild, 132),
    ok.

pair(Args = #{phase := 7}) ->
    L1 = ets:tab2list(guild_league_guild),
    ets:delete_all_objects(guild_league_guild),
    RL = ets:tab2list(guild_league_summary),
    L2 = set_grades(RL, L1),
    {LS, _L3} = lists:partition(fun
                                    (#guild_league_guild{grade = Grade}) ->
                                        Grade =:= 1
                                end,
                                L2),
    Args1 = Args#{time => date:unixtime()},
    pair_super(LS, Args1);
pair(Args) ->
    L1 = ets:tab2list(guild_league_guild),
    ets:delete_all_objects(guild_league_guild),
    RL = ets:tab2list(guild_league_summary),
    L2 = set_grades(RL, L1),
    {LS, L3} = lists:partition(fun
                                   (#guild_league_guild{grade = Grade}) ->
                                       Grade =:= 1
                               end,
                               L2),
    {LA, L4} = lists:partition(fun
                                   (#guild_league_guild{grade = Grade}) ->
                                       Grade =:= 2
                               end,
                               L3),
    {LB, LC} = lists:partition(fun
                                   (#guild_league_guild{grade = Grade}) ->
                                       Grade =:= 3
                               end,
                               L4),
    Args1 = Args#{time => date:unixtime()},
    NextId1 = pair_super(LS, Args1),
    NextId2 = group_pair(sort(LA),
                         Args1#{next_id := NextId1}),
    NextId3 = group_pair(sort(LB),
                         Args1#{next_id := NextId2}),
    group_pair(sort(LC), Args1#{next_id := NextId3}).

pre_pair(LS, Args) ->
    LS1 = sort(LS),
    do_pair_super_group(LS1, Args).

init_grade() ->
    L1 = ets:tab2list(guild_league_guild),
    Size = ets:info(guild_league_guild, size),
    ets:delete_all_objects(guild_league_guild),
    L2 = util:keys_sort([#guild_league_guild.strenth], L1),
    {LA, L3} = case Size >= 32 of
                   true -> lists:split(32, L2);
                   _ -> {L2, []}
               end,
    {LB, LC} = case Size >= 64 of
                   true -> lists:split(32, L3);
                   _ -> {L3, []}
               end,
    AGNum = length(LA) div 4,
    LA1 = arrange_group([G#guild_league_guild{grade = 2}
                         || G <- LA],
                        {1, 1},
                        AGNum),
    init_summary(LA1, init),
    BGNum = length(LB) div 4,
    LB1 = arrange_group([G#guild_league_guild{grade = 3}
                         || G <- LB],
                        {1, 1},
                        BGNum),
    init_summary(LB1, init),
    LC1 = lists:sublist([G#guild_league_guild{grade = 4}
                         || G <- LC],
                        64),
    CGNum = length(LC1) div 4,
    LC2 = arrange_group(LC1, {1, 1}, CGNum),
    init_summary(LC2, init),
    update_rank().

lookup(Id) -> ets:lookup(guild_league_guild, Id).

get_name(by_rid, Rid) ->
    case ets:lookup(guild_league_role, Rid) of
        [#guild_league_role{gid = Gid}] ->
            get_name(by_gid, Gid);
        _ -> ""
    end;
get_name(by_gid, Gid) ->
    case lookup(Gid) of
        [#guild_league_guild{name = Name}] -> Name;
        _ -> ""
    end;
get_name(by_aid, Aid) ->
    case ets:lookup(guild_league_alliance, Aid) of
        [#guild_league_alliance{names = Names}] ->
            string:join(Names, "、");
        _ -> ""
    end.

save_result([], _, _) -> ok;
save_result([Gid | T], Result, Score) ->
    case lookup(Gid) of
        [G = #guild_league_guild{consecutive_win =
                                     ConsecutiveWin,
                                 season_consecutive_win =
                                     SeasonConsecutiveWin}] ->
            NewConsecutiveWin = case Result of
                                    2 -> 0;
                                    _ -> ConsecutiveWin + 1
                                end,
            NewSeasonConsecutiveWin = max(NewConsecutiveWin,
                                          SeasonConsecutiveWin),
            G1 = G#guild_league_guild{is_win = Result,
                                      score = Score,
                                      consecutive_win = NewConsecutiveWin,
                                      season_consecutive_win =
                                          NewSeasonConsecutiveWin},
            update(G1),
            statistic_sum([G1]);
        _ -> ok
    end,
    save_result(T, Result, Score).

acc_win({win, _}, Gid) ->
    case lookup(Gid) of
        [G = #guild_league_guild{win = Win}] ->
            update(G#guild_league_guild{win = Win + 1});
        _ -> ok
    end;
acc_win(_, _) -> ok.

statistic_sum([]) -> ok;
statistic_sum([#guild_league_guild{id = Id, name = Name,
                                   leader_name = LeaderName,
                                   leader_id = LeaderId, lev = Lev,
                                   totem = Totem, score = AddScore,
                                   member_num = MemNum, key = Key,
                                   grade = Grade, group = Group, order = Order,
                                   is_win = IsWin, attacked_unit = AddAttacked,
                                   phase = Phase}
               | T]) ->
    {AddWin, AddLost, AddDraw} = case IsWin of
                                     1 -> {1, 0, 0};
                                     2 -> {0, 1, 0};
                                     _ -> {0, 0, 1}
                                 end,
    AddAbsence = case MemNum < 1 of
                     true -> 1;
                     _ -> 0
                 end,
    NewS = case ets:lookup(guild_league_summary, Id) of
               [S = #guild_league_summary{season_score = SeasonScore,
                                          season_win = SeaonWin,
                                          total_win = TotalWin,
                                          total_score = TotalScore,
                                          recent_matchs = Recent,
                                          attacked_unit = Attacked,
                                          absence = Absence,
                                          season_lost = SeasonLost,
                                          season_draw = SeasonDraw,
                                          consecutive_win = ConsecutiveWin,
                                          season_consecutive_win =
                                              SeasonConsecutiveWin,
                                          eliminated = Eliminated}] ->
                   NewConsecutiveWin = case AddWin of
                                           0 -> 0;
                                           _ -> ConsecutiveWin + 1
                                       end,
                   NewSeasonConsecutiveWin = max(NewConsecutiveWin,
                                                 SeasonConsecutiveWin),
                   NewEliminated = case {Grade, IsWin} of
                                       {1, 2} when Phase < Eliminated -> Phase;
                                       _ -> Eliminated
                                   end,
                   S#guild_league_summary{leader_id = LeaderId,
                                          leader_name = LeaderName,
                                          totem = Totem, lev = Lev,
                                          season_score = AddScore + SeasonScore,
                                          season_win = AddWin + SeaonWin,
                                          season_lost = AddLost + SeasonLost,
                                          season_draw = AddDraw + SeasonDraw,
                                          total_win = TotalWin + AddWin,
                                          total_score = TotalScore + AddScore,
                                          grade = Grade, group = Group,
                                          order = Order,
                                          recent_matchs =
                                              lists:sublist([Key | Recent], 2),
                                          attacked_unit =
                                              Attacked + AddAttacked,
                                          last_result = IsWin,
                                          absence = Absence + AddAbsence,
                                          consecutive_win = NewConsecutiveWin,
                                          season_consecutive_win =
                                              NewSeasonConsecutiveWin,
                                          eliminated = NewEliminated};
               _ ->
                   NewEliminated = case {Grade, IsWin} of
                                       {1, 2} -> Phase;
                                       _ -> 8
                                   end,
                   #guild_league_summary{id = Id, name = Name,
                                         leader_id = LeaderId,
                                         leader_name = LeaderName,
                                         totem = Totem, lev = Lev,
                                         member_num = MemNum,
                                         season_score = AddScore,
                                         season_win = AddWin,
                                         season_lost = AddLost,
                                         season_draw = AddDraw,
                                         total_win = AddWin,
                                         total_score = AddScore, grade = Grade,
                                         group = Group, order = Order,
                                         recent_matchs = [Key],
                                         attacked_unit = AddAttacked,
                                         last_result = IsWin,
                                         absence = AddAbsence,
                                         consecutive_win = AddWin,
                                         season_consecutive_win = AddWin,
                                         eliminated = NewEliminated}
           end,
    ets:insert(guild_league_summary, NewS),
    dets:insert(guild_league_summary, NewS),
    sync_data(NewS),
    statistic_sum(T).

get_opposite_side(1) -> 2;
get_opposite_side(_) -> 1.

check_alliance({gid, Gid}, {gid, Gid}) -> true;
check_alliance({gid, Gid1}, {gid, Gid2}) ->
    case {lookup(Gid1), lookup(Gid2)} of
        {[#guild_league_guild{match_id = MatchId, side = Side}],
         [#guild_league_guild{match_id = MatchId,
                              side = Side}]} ->
            true;
        _ -> false
    end;
check_alliance(Rid1, Rid2) ->
    case {ets:lookup(guild_league_role, Rid1),
          ets:lookup(guild_league_role, Rid2)}
        of
        {[#guild_league_role{match_id = MatchId, side = Side}],
         [#guild_league_role{match_id = MatchId,
                             side = Side}]} ->
            true;
        _ -> false
    end.

set_trump(Trump = #guild_league_trump{gid = Gid}) ->
    case lookup(Gid) of
        [G = #guild_league_guild{}] -> do_set_trump(G, Trump);
        _ -> {false, lang:get("你公会没参赛哦")}
    end.

sync_data([]) -> ok;
sync_data([H | T]) ->
    sync_data(H),
    sync_data(T);
sync_data(G = #guild_league_guild{match_id =
                                      MatchId}) ->
    Gids1 = case ets:lookup(guild_league_alliance,
                            {MatchId, 1})
                of
                [#guild_league_alliance{gids = Ids1}] -> Ids1;
                _ -> []
            end,
    Gids2 = case ets:lookup(guild_league_alliance,
                            {MatchId, 2})
                of
                [#guild_league_alliance{gids = Ids2}] -> Ids2;
                _ -> []
            end,
    do_sync_data(group_by_platform(Gids1 ++ Gids2, []), G);
sync_data(U = #guild_league_unit{grade = 1,
                                 phase = Phase})
    when Phase > 4 ->
    big_world:cast(all, guild_league_agent, sync_data, [U]);
sync_data(U = #guild_league_unit{match_id = MatchId}) ->
    Gids1 = case ets:lookup(guild_league_alliance,
                            {MatchId, 1})
                of
                [#guild_league_alliance{gids = Ids1}] -> Ids1;
                _ -> []
            end,
    Gids2 = case ets:lookup(guild_league_alliance,
                            {MatchId, 2})
                of
                [#guild_league_alliance{gids = Ids2}] -> Ids2;
                _ -> []
            end,
    do_sync_data(group_by_platform(Gids1 ++ Gids2, []), U);
sync_data(A = #guild_league_alliance{grade = 1,
                                     phase = Phase})
    when Phase > 4 ->
    big_world:cast(all, guild_league_agent, sync_data, [A]);
sync_data(A = #guild_league_alliance{gids = Gids1,
                                     match_id = MatchId, side = Side}) ->
    Gids2 = case ets:lookup(guild_league_alliance,
                            {MatchId,
                             guild_league_guild:get_opposite_side(Side)})
                of
                [#guild_league_alliance{gids = Ids2}] -> Ids2;
                _ -> []
            end,
    do_sync_data(group_by_platform(Gids1 ++ Gids2, []), A);
sync_data(R = #guild_league_role{id = {_, P, Z}}) ->
    big_world:cast(P,
                   Z,
                   guild_league_agent,
                   sync_data,
                   [R]);
sync_data(S = #guild_league_summary{id = {_, P, Z}}) ->
    big_world:cast(P,
                   Z,
                   guild_league_agent,
                   sync_data,
                   [S]);
sync_data(B = #guild_league_live{}) ->
    big_world:cast(all, guild_league_agent, sync_data, [B]);
sync_data(P = #guild_league_poll{}) ->
    big_world:cast(all, guild_league_agent, sync_data, [P]).

sync_log_index() ->
    L = ets:tab2list(guild_league_guild),
    big_world:cast(all,
                   guild_league_agent,
                   sync_log_index,
                   [L]).

update_rank() ->
    L1 = ets:tab2list(guild_league_summary),
    {LS, L3} = lists:partition(fun
                                   (#guild_league_summary{grade = Grade}) ->
                                       Grade =:= 1
                               end,
                               L1),
    {LA, L4} = lists:partition(fun
                                   (#guild_league_summary{grade = Grade}) ->
                                       Grade =:= 2
                               end,
                               L3),
    {LB, LC} = lists:partition(fun
                                   (#guild_league_summary{grade = Grade}) ->
                                       Grade =:= 3
                               end,
                               L4),
    LS1 = update_rank(LS),
    LA1 = update_rank(LA),
    LB1 = update_rank(LB),
    LC1 = update_rank(LC),
    update(LS1),
    update(LA1),
    update(LB1),
    update(LC1),
    LC2 = lists:sublist(LC1, 100),
    RankL = [{1, LS1}, {2, LA1}, {3, LB1}, {4, LC2}],
    ets:delete_all_objects(guild_league_rank),
    dets:delete_all_objects(guild_league_rank),
    ets:insert(guild_league_rank, RankL),
    dets:insert(guild_league_rank, RankL),
    do_sync_data(group_by_platform(LS1, [])),
    do_sync_data(group_by_platform(LA1, [])),
    do_sync_data(group_by_platform(LB1, [])),
    do_sync_data(group_by_platform(LC1, [])),
    big_world:cast(all,
                   guild_league_agent,
                   update_rank,
                   [RankL]).

update_grade_rank(Grade) ->
    L1 = ets:tab2list(guild_league_summary),
    L2 = [S
          || S = #guild_league_summary{grade = SG} <- L1,
             SG =:= Grade],
    L3 = update_rank(L2),
    update(L3),
    L4 = lists:sublist(L3, 100),
    RankL = [{Grade, L4}],
    ets:insert(guild_league_rank, RankL),
    dets:insert(guild_league_rank, RankL),
    do_sync_data(group_by_platform(L3, [])),
    big_world:cast(all,
                   guild_league_agent,
                   update_grade_rank,
                   [RankL]).

reset_rank(Phase) ->
    L1 = ets:tab2list(guild_league_summary),
    {LS, L3} = lists:partition(fun
                                   (#guild_league_summary{grade = Grade}) ->
                                       Grade =:= 1
                               end,
                               L1),
    {LA, L4} = lists:partition(fun
                                   (#guild_league_summary{grade = Grade}) ->
                                       Grade =:= 2
                               end,
                               L3),
    {LB, LC} = lists:partition(fun
                                   (#guild_league_summary{grade = Grade}) ->
                                       Grade =:= 3
                               end,
                               L4),
    LS1 = do_reset_rank(Phase, LS),
    LA1 = do_reset_rank(Phase, LA),
    LB1 = do_reset_rank(Phase, LB),
    LC1 = do_reset_rank(Phase, LC),
    LS2 = [S#guild_league_summary{season_score = 0,
                                  season_win = 0, season_consecutive_win = 0,
                                  consecutive_win = 0, season_lost = 0,
                                  season_draw = 0}
           || S <- LS1],
    LA2 = [S#guild_league_summary{season_score = 0,
                                  season_win = 0, season_consecutive_win = 0,
                                  consecutive_win = 0, season_lost = 0,
                                  season_draw = 0}
           || S <- LA1],
    LB2 = [S#guild_league_summary{season_score = 0,
                                  season_win = 0, season_consecutive_win = 0,
                                  consecutive_win = 0, season_lost = 0,
                                  season_draw = 0}
           || S <- LB1],
    LC2 = [S#guild_league_summary{season_score = 0,
                                  season_win = 0, season_consecutive_win = 0,
                                  consecutive_win = 0, season_lost = 0,
                                  season_draw = 0}
           || S <- LC1],
    update(LS2),
    update(LA2),
    update(LB2),
    update(LC2),
    RankL = [{1, LS2}, {2, LA2}, {3, LB2}, {4, LC2}],
    ets:delete_all_objects(guild_league_rank),
    dets:delete_all_objects(guild_league_rank),
    ets:insert(guild_league_rank, RankL),
    dets:insert(guild_league_rank, RankL),
    do_sync_data(group_by_platform(LS2, [])),
    do_sync_data(group_by_platform(LA2, [])),
    do_sync_data(group_by_platform(LB2, [])),
    do_sync_data(group_by_platform(LC2, [])),
    big_world:cast(all,
                   guild_league_agent,
                   update_rank,
                   [RankL]).

reset_score() ->
    LS1 = case ets:lookup(guild_league_rank, 1) of
              [{_, LS}] -> LS;
              _ -> []
          end,
    LA1 = case ets:lookup(guild_league_rank, 2) of
              [{_, LA}] -> LA;
              _ -> []
          end,
    LB1 = case ets:lookup(guild_league_rank, 3) of
              [{_, LB}] -> LB;
              _ -> []
          end,
    LC1 = case ets:lookup(guild_league_rank, 4) of
              [{_, LC}] -> LC;
              _ -> []
          end,
    LS2 = [S#guild_league_summary{season_score = 0,
                                  season_win = 0, season_consecutive_win = 0,
                                  consecutive_win = 0, season_lost = 0,
                                  season_draw = 0}
           || S <- LS1],
    LA2 = [S#guild_league_summary{season_score = 0,
                                  season_win = 0, season_consecutive_win = 0,
                                  consecutive_win = 0, season_lost = 0,
                                  season_draw = 0}
           || S <- LA1],
    LB2 = [S#guild_league_summary{season_score = 0,
                                  season_win = 0, season_consecutive_win = 0,
                                  consecutive_win = 0, season_lost = 0,
                                  season_draw = 0}
           || S <- LB1],
    LC2 = [S#guild_league_summary{season_score = 0,
                                  season_win = 0, season_consecutive_win = 0,
                                  consecutive_win = 0, season_lost = 0,
                                  season_draw = 0}
           || S <- LC1],
    update(LS2),
    update(LA2),
    update(LB2),
    update(LC2),
    RankL = [{1, LS2}, {2, LA2}, {3, LB2}, {4, LC2}],
    ets:insert(guild_league_rank, RankL),
    dets:insert(guild_league_rank, RankL),
    do_sync_data(group_by_platform(LS2, [])),
    do_sync_data(group_by_platform(LA2, [])),
    do_sync_data(group_by_platform(LB2, [])),
    do_sync_data(group_by_platform(LC2, [])),
    big_world:cast(all,
                   guild_league_agent,
                   update_rank,
                   [RankL]).

update_champion(8, Season) ->
    L = ets:tab2list(guild_league_rank),
    do_update_champion(L, Season),
    ok;
update_champion(_, _) -> ok.

reset_grade(8) ->
    L1 = [S#guild_league_summary{season_score = 0,
                                 season_win = 0, season_consecutive_win = 0,
                                 consecutive_win = 0, season_lost = 0,
                                 season_draw = 0, eliminated = 8}
          || S <- ets:tab2list(guild_league_summary)],
    {LS, L3} = lists:partition(fun
                                   (#guild_league_summary{grade = Grade}) ->
                                       Grade =:= 1
                               end,
                               L1),
    {LA, L4} = lists:partition(fun
                                   (#guild_league_summary{grade = Grade}) ->
                                       Grade =:= 2
                               end,
                               L3),
    {LB, LC} = lists:partition(fun
                                   (#guild_league_summary{grade = Grade}) ->
                                       Grade =:= 3
                               end,
                               L4),
    {LS1, LS2} = lists:partition(fun
                                     (#guild_league_summary{absence = Lk}) ->
                                         Lk >= 1
                                 end,
                                 LS),
    {LA1, LA2} = lists:partition(fun
                                     (#guild_league_summary{absence = Lk}) ->
                                         Lk >= 1
                                 end,
                                 LA),
    {LB1, LB2} = lists:partition(fun
                                     (#guild_league_summary{absence = Lk}) ->
                                         Lk >= 1
                                 end,
                                 LB),
    {LC1, LC2} = lists:partition(fun
                                     (#guild_league_summary{absence = Lk}) ->
                                         Lk >= 1
                                 end,
                                 LC),
    delete([S#guild_league_summary{grade = 4,
                                   season_score = 0}
            || S <- LS1]),
    delete([S#guild_league_summary{grade = 4,
                                   season_score = 0}
            || S <- LA1]),
    delete([S#guild_league_summary{grade = 4,
                                   season_score = 0}
            || S <- LB1]),
    delete([S#guild_league_summary{grade = 4,
                                   season_score = 0}
            || S <- LC1]),
    LSd = [S#guild_league_summary{grade = 2}
           || S = #guild_league_summary{} <- LS2],
    update(LSd),
    LAd = group_demote(LA2, 2),
    LAd1 = case length(LSd) + length(LA2) - 32 of
               LAdNum when LAdNum > 0 ->
                   [S#guild_league_summary{grade = 3}
                    || S = #guild_league_summary{}
                           <- lists:sublist(LAd, LAdNum)];
               _ -> []
           end,
    update([S#guild_league_summary{rank = RankA + 16}
            || S = #guild_league_summary{rank = RankA} <- LA2]),
    update(LAd1),
    LBd = group_demote(LB2, 2),
    LBd1 = case length(LAd1) + length(LB2) - 32 of
               LBdNum when LBdNum > 0 ->
                   [S#guild_league_summary{grade = 4}
                    || S <- lists:sublist(LBd, LBdNum)];
               _ -> []
           end,
    update([S#guild_league_summary{rank = RankB + 32}
            || S = #guild_league_summary{rank = RankB} <- LB2]),
    update(LBd1),
    LCd = group_demote(LC2, 2),
    update([S#guild_league_summary{rank = RankC + 32}
            || S = #guild_league_summary{rank = RankC} <- LC2]),
    delete(LCd),
    [ets:delete(guild_league_guild, Did)
     || #guild_league_summary{id = Did} <- L1],
    NewL = ets:tab2list(guild_league_guild),
    Size = ets:info(guild_league_guild, size),
    ets:delete_all_objects(guild_league_guild),
    NewL2 = util:keys_sort([#guild_league_guild.strenth],
                           NewL),
    NewL3 = case 64 -
                     (length(LC2) + length(LBd1) - length(LCd))
                of
                NeedNew when NeedNew < Size ->
                    lists:sublist(NewL2, NeedNew);
                _ -> NewL2
            end,
    [send_invitation(S, new)
     || S <- ets:tab2list(guild_league_summary)],
    init_summary(NewL3, new),
    rearrange_group(season),
    ets:delete_all_objects(guild_league_live),
    dets:delete_all_objects(guild_league_live),
    ets:delete_all_objects(guild_league_poll),
    dets:delete_all_objects(guild_league_poll),
    ok;
reset_grade(_) ->
    L1 = ets:tab2list(guild_league_summary),
    {_LS, L3} = lists:partition(fun
                                    (#guild_league_summary{grade = Grade}) ->
                                        Grade =:= 1
                                end,
                                L1),
    {LA, L4} = lists:partition(fun
                                   (#guild_league_summary{grade = Grade}) ->
                                       Grade =:= 2
                               end,
                               L3),
    {LB, LC} = lists:partition(fun
                                   (#guild_league_summary{grade = Grade}) ->
                                       Grade =:= 3
                               end,
                               L4),
    {UpScoreA, _DownScoreA} = up_and_down_score(LA),
    {UpScoreB, _DownScoreB} = up_and_down_score(LB),
    {_UpScoreC, _DownScoreC} = up_and_down_score(LC),
    LAu = group_promote(LA, 2),
    LAu1 = [S#guild_league_summary{grade = 1} || S <- LAu],
    notice_up_grade(LAu1),
    update(LAu1),
    LBu = group_promote(LB, 2),
    LBu1 = [S#guild_league_summary{grade = 2,
                                   season_score = UpScoreA}
            || S <- LBu],
    notice_up_grade(LBu1),
    update(LBu1),
    LCu = group_promote(LC, 1),
    LCu1 = [S#guild_league_summary{grade = 3,
                                   season_score = UpScoreB}
            || S <- LCu],
    notice_up_grade(LCu1),
    update(LCu1),
    rearrange_group(middle),
    ok.

test_reset_grade() ->
    L1 = ets:tab2list(guild_league_summary),
    Size = ets:info(guild_league_summary, size),
    delete(L1),
    L2 = util:keys_sort([#guild_league_summary.season_win,
                         #guild_league_summary.season_score],
                        L1),
    {LA, L3} = case Size >= 32 of
                   true -> lists:split(32, L2);
                   _ -> {L2, []}
               end,
    {LB, LC} = case Size >= 64 of
                   true -> lists:split(32, L3);
                   _ -> {L3, []}
               end,
    AGNum = length(LA) div 4,
    LA1 = arrange_group([G#guild_league_summary{grade = 2}
                         || G <- LA],
                        {1, 1},
                        AGNum),
    BGNum = length(LB) div 4,
    LB1 = arrange_group([G#guild_league_summary{grade = 3}
                         || G <- LB],
                        {1, 1},
                        BGNum),
    LC1 = lists:sublist([G#guild_league_summary{grade = 4}
                         || G <- LC],
                        64),
    CGNum = length(LC1) div 4,
    LC2 = arrange_group(LC1, {1, 1}, CGNum),
    update(LA1),
    update(LB1),
    update(LC2),
    update_rank(),
    ok.

subsidize_buff(Diff) when Diff > 10 ->
    [{90229, 1000, 0, 0, [0, 3526]},
     {90227, 1000, 0, 0, [613]},
     {90228, 1000, 0, 0, [490]}];
subsidize_buff(Diff) when Diff > 7 ->
    [{90229, 1000, 0, 0, [0, 2821]},
     {90227, 1000, 0, 0, [490]},
     {90228, 1000, 0, 0, [392]}];
subsidize_buff(Diff) when Diff > 5 ->
    [{90229, 1000, 0, 0, [0, 2115]},
     {90227, 1000, 0, 0, [368]},
     {90228, 1000, 0, 0, [294]}];
subsidize_buff(Diff) when Diff > 3 ->
    [{90229, 1000, 0, 0, [0, 1410]},
     {90227, 1000, 0, 0, [245]},
     {90228, 1000, 0, 0, [196]}];
subsidize_buff(Diff) when Diff > 1 ->
    [{90229, 1000, 0, 0, [0, 705]},
     {90227, 1000, 0, 0, [123]},
     {90228, 1000, 0, 0, [98]}];
subsidize_buff(_) -> [].

clear_all() ->
    ets:delete_all_objects(guild_league_role),
    ets:delete_all_objects(guild_league_unit),
    ets:delete_all_objects(guild_league_guild),
    ets:delete_all_objects(guild_league_guild_log),
    dets:delete_all_objects(guild_league_guild_log),
    ets:delete_all_objects(guild_league_alliance),
    ets:delete_all_objects(guild_league_alliance_log),
    dets:delete_all_objects(guild_league_alliance_log),
    catch ets:delete_all_objects(guild_league_guild_index),
    ets:delete_all_objects(guild_league_summary),
    dets:delete_all_objects(guild_league_summary),
    ets:delete_all_objects(guild_league_rank),
    dets:delete_all_objects(guild_league_rank),
    ets:delete_all_objects(guild_league_unit),
    dets:delete_all_objects(guild_league_unit),
    ets:delete_all_objects(guild_league_live),
    dets:delete_all_objects(guild_league_live),
    ets:delete_all_objects(guild_league_poll),
    dets:delete_all_objects(guild_league_poll),
    catch ets:delete_all_objects(guild_league_guess),
    catch dets:delete_all_objects(guild_league_guess).

do_find_today([], Matches, Alliances, Guilds) ->
    {ok, Matches, Alliances, Guilds};
do_find_today([G = #guild_league_guild{match_id =
                                           MatchId,
                                       phase = Phase, time = Now}
               | T],
              Matches, Alliances, Guilds) ->
    Fun = fun (#guild_league_guild{match_id = Mid}) ->
                  Mid =:= MatchId
          end,
    Fun2 = fun (#guild_league_guild{side = Side}) ->
                   Side =:= 1
           end,
    case lists:partition(Fun, T) of
        {Sat = [_ | _], UnSat} ->
            case lists:partition(Fun2, [G | Sat]) of
                {Red, Black} ->
                    Ids1 = [Id1 || #guild_league_guild{id = Id1} <- Red],
                    Names1 = [Name1
                              || #guild_league_guild{name = Name1} <- Red],
                    Totems1 = [Totem1
                               || #guild_league_guild{totem = Totem1} <- Red],
                    WA1 = #guild_league_alliance{id = {MatchId, 1},
                                                 gids = Ids1, names = Names1,
                                                 totems = Totems1, side = 1,
                                                 phase = Phase, time = Now,
                                                 match_id = MatchId},
                    Ids2 = [Id2 || #guild_league_guild{id = Id2} <- Black],
                    Names2 = [Name2
                              || #guild_league_guild{name = Name2} <- Black],
                    Totems2 = [Totem2
                               || #guild_league_guild{totem = Totem2} <- Black],
                    WA2 = #guild_league_alliance{id = {MatchId, 2},
                                                 gids = Ids2, names = Names2,
                                                 totems = Totems2, side = 2,
                                                 phase = Phase, time = Now,
                                                 match_id = MatchId},
                    B = #guild_league_match{id = MatchId, time = Now,
                                            phase = Phase},
                    do_find_today(UnSat,
                                  [B | Matches],
                                  [WA1, WA2 | Alliances],
                                  [G | Sat ++ Guilds]);
                _ -> false
            end;
        _ -> false
    end.

calc_strenth([], _Now) -> [];
calc_strenth([#guild_league_guild{id = Id,
                                  member_num = Num}
              | T],
             Now)
    when Num < 100 ->
    Content =
        notice:format(lang:get("由于本公会人数不足~ts人，暂不参与本次冠军联赛，请招纳更多人员、期待你的参战。"),
                      [{string_2, 5, 100}]),
    guild_common:send_mail(Id, "", Content),
    calc_strenth(T, Now);
calc_strenth([H = #guild_league_guild{members = Members}
              | T],
             Now) ->
    L1 = [R
          || R = #guild_role{lev = Lev, last_logout = Last,
                             status = Ol}
                 <- Members,
             Lev >= 70 andalso
                 (Ol =:= 1 orelse date:day_diff(Now, Last) =< 2)],
    L2 = util:keys_sort([#guild_role.fc], L1),
    L3 = [Fc || #guild_role{fc = Fc} <- L2],
    LvSort = util:keys_sort([#guild_role.lev,
                             #guild_role.lev_break_times],
                            L1),
    AvgLv = util:list_avg(lists:sublist([Lv + 6 * BreakTimes
                                         || #guild_role{lev = Lv,
                                                        lev_break_times =
                                                            BreakTimes}
                                                <- LvSort],
                                        20)),
    Strenth = round(util:list_avg(lists:sublist(L3, 20)) *
                        30
                        +
                        lists:sum(lists:sublist(L3, 100)) *
                            (1 + (AvgLv - 80) / 40)),
    [H#guild_league_guild{strenth = Strenth,
                          avg_lev = AvgLv, member_num = 0, members = []}
     | calc_strenth(T, Now)].

sort([]) -> [];
sort(L2) -> sort(L2, []).

sort([], L) -> L;
sort([G = #guild_league_guild{group = Group} | T], L) ->
    case lists:keyfind(Group, 1, L) of
        {_, L1} ->
            sort(T,
                 lists:keyreplace(Group, 1, L, {Group, [G | L1]}));
        _ -> sort(T, [{Group, [G]} | L])
    end;
sort([G = #guild_league_summary{group = Group} | T],
     L) ->
    case lists:keyfind(Group, 1, L) of
        {_, L1} ->
            sort(T,
                 lists:keyreplace(Group, 1, L, {Group, [G | L1]}));
        _ -> sort(T, [{Group, [G]} | L])
    end.

set_grades([], _L) -> [];
set_grades([#guild_league_summary{id = Id, name = Name,
                                  lev = Lev, leader_id = LeaderId,
                                  leader_name = LeaderName, totem = Totem,
                                  grade = Grade, order = Order, group = Group,
                                  consecutive_win = ConsecutiveWin,
                                  season_consecutive_win = SeasonConsecutiveWin,
                                  eliminated = Eliminated}
            | T],
           L) ->
    case lists:keytake(Id, #guild_league_guild.id, L) of
        {value, G1 = #guild_league_guild{}, L2} ->
            [G1#guild_league_guild{grade = Grade, group = Group,
                                   order = Order,
                                   consecutive_win = ConsecutiveWin,
                                   season_consecutive_win =
                                       SeasonConsecutiveWin,
                                   eliminated = Eliminated}
             | set_grades(T, L2)];
        _ ->
            [#guild_league_guild{id = Id, name = Name, lev = Lev,
                                 leader_id = LeaderId, leader_name = LeaderName,
                                 totem = Totem, grade = Grade, order = Order,
                                 group = Group,
                                 consecutive_win = ConsecutiveWin,
                                 season_consecutive_win = SeasonConsecutiveWin,
                                 eliminated = Eliminated}
             | set_grades(T, L)]
    end.

round_robin(_, []) -> [];
round_robin(_, [One]) -> [One];
round_robin(0, L) ->
    Len = erlang:length(L) div 2,
    {L1, L2} = lists:split(Len, L),
    L3 = lists:reverse(L2),
    do_round_robin(L1, L3);
round_robin(N, [G1 | L]) ->
    Len = erlang:length(L),
    SLen = min(N, Len),
    L1 = lists:reverse(L),
    {L2, L3} = lists:split(SLen, L1),
    L4 = lists:reverse(L2),
    L5 = lists:reverse(L3),
    L6 = [G1 | L4] ++ L5,
    {L7, L8} = lists:split((Len + 1) div 2, L6),
    do_round_robin(L7, lists:reverse(L8)).

do_round_robin([], L) -> L;
do_round_robin(L, []) -> L;
do_round_robin([H1 | T1], [H2 | T2]) ->
    [H1, H2 | do_round_robin(T1, T2)].

do_pair_super_group([], _) -> [];
do_pair_super_group([{_, []} | T], Args) ->
    do_pair_super_group(T, Args);
do_pair_super_group([{_, L} | T],
                    Args = #{next_id := NextId, phase := 4}) ->
    L1 = [G#guild_league_guild{is_win = 0, win = 0}
          || G <- lists:keysort(#guild_league_guild.order, L)],
    Len = erlang:length(L1) div 2,
    {L2, L3} = lists:split(Len, L1),
    L4 = do_round_robin(L2, L3),
    {L5, NewNextId} = do_pair_super(L4, NextId, []),
    L5 ++
        do_pair_super_group(T, Args#{next_id := NewNextId});
do_pair_super_group([{_, L} | T],
                    Args = #{next_id := NextId}) ->
    L1 = [G#guild_league_guild{is_win = 0, win = 0}
          || G = #guild_league_guild{consecutive_win = Win} <- L,
             Win > 0],
    {L2, NextId1} = do_pair_super(L1, NextId, []),
    L3 = [G#guild_league_guild{is_win = 0, win = 0}
          || G = #guild_league_guild{consecutive_win = Win} <- L,
             Win < 1],
    {L4, NewNextId} = do_pair_super(L3, NextId1, []),
    L2 ++
        L4 ++
            do_pair_super_group(T, Args#{next_id := NewNextId}).

do_pair_super([], NextId, L) -> {L, NextId};
do_pair_super([_], NextId, L) -> {L, NextId};
do_pair_super([A, B | T], NextId, L) ->
    do_pair_super(T,
                  NextId + 1,
                  [A#guild_league_guild{match_id = NextId},
                   B#guild_league_guild{match_id = NextId}
                   | L]).

pair_super(LS, Args) when length(LS) < 3 ->
    do_pair(LS, Args);
pair_super(LS, Args = #{phase := 6}) ->
    LS1 = [G#guild_league_guild{is_win = 0, win = 0}
           || G <- lists:keysort(#guild_league_guild.group, LS)],
    {LS2, LSe1} = lists:partition(fun
                                      (#guild_league_guild{consecutive_win =
                                                               ConsecutiveWin}) ->
                                          ConsecutiveWin >= 2
                                  end,
                                  LS1),
    Len = erlang:length(LS2) div 2,
    {L2, L3} = lists:split(Len, LS2),
    L4 = do_round_robin(L2, L3),
    NextId1 = do_pair(L4, Args),
    logger:debug("晋级部分 ~w, next_id ~w",
                 [length(LS2), NextId1],
                 guild_league_guild,
                 810),
    {LS3, LSe2} = lists:partition(fun
                                      (#guild_league_guild{eliminated = Eld}) ->
                                          Eld > 4
                                  end,
                                  LSe1),
    Len2 = erlang:length(LS3) div 2,
    {L5, L6} = lists:split(Len2, LS3),
    L7 = do_round_robin(L5, L6),
    NextId2 = do_pair(L7, Args#{next_id := NextId1}),
    logger:debug("最后淘汰 ~w, next_id ~w",
                 [length(LS3), NextId2],
                 guild_league_guild,
                 817),
    {LS4, LS5} = lists:partition(fun
                                     (#guild_league_guild{consecutive_win =
                                                              ConsecutiveWin}) ->
                                         ConsecutiveWin >= 1
                                 end,
                                 LSe2),
    Len3 = erlang:length(LS4) div 2,
    {L8, L9} = lists:split(Len3, LS4),
    L10 = do_round_robin(L8, L9),
    NextId3 = do_pair(L10, Args#{next_id := NextId2}),
    logger:debug("上场胜利淘汰 ~w, next_id ~w",
                 [length(LS4), NextId3],
                 guild_league_guild,
                 824),
    Len4 = erlang:length(LS5) div 2,
    {L11, L12} = lists:split(Len4, LS5),
    L13 = do_round_robin(L11, L12),
    do_pair(L13, Args#{next_id := NextId3});
pair_super(LS, Args = #{phase := 7}) ->
    LS1 =
        lists:sublist(util:keys_sort([#guild_league_guild.season_consecutive_win,
                                      #guild_league_guild.eliminated],
                                     LS),
                      4),
    LS2 = [G#guild_league_guild{is_win = 0, win = 0}
           || G <- LS1],
    do_pair(LS2, Args);
pair_super(LS, Args) ->
    LS1 = do_pair_super_group(sort(LS), Args),
    do_pair(LS1, Args).

group_pair([], #{next_id := NextId}) -> NextId;
group_pair([{_, L} | T], Args = #{phase := Phase}) ->
    L1 = lists:keysort(#guild_league_guild.order, L),
    L2 = round_robin(Phase rem 3, L1),
    NextId = do_pair(L2, Args),
    group_pair(T, Args#{next_id := NextId}).

do_pair([], #{next_id := NextId}) ->
    env:del(guild_league_match_fail),
    NextId;
do_pair([G1 = #guild_league_guild{id =
                                      Id1 = {_, P, Z}}],
        Args = #{next_id := NextId}) ->
    env:save(guild_league_match_fail, Id1),
    WG1 = set(1, G1, Args),
    statistic_sum([WG1#guild_league_guild{score = 2}]),
    big_world:cast(P,
                   Z,
                   guild_league_agent,
                   match_fail,
                   [WG1]),
    NextId + 1;
do_pair([G1 = #guild_league_guild{id = Id1,
                                  name = Name1, grade = Grade},
         G2 = #guild_league_guild{id = Id2, name = Name2},
         G3 = #guild_league_guild{id = Id3, name = Name3},
         G4 = #guild_league_guild{id = Id4, name = Name4}
         | T],
        Args = #{next_id := NextId, time := Now,
                 phase := Phase = guild_league_phase_fourth,
                 season := Season}) ->
    WG1 = #guild_league_guild{totem = TotemId1} = set(1,
                                                      G1,
                                                      Args),
    WG2 = #guild_league_guild{totem = TotemId2} = set(2,
                                                      G2,
                                                      Args),
    WG3 = #guild_league_guild{totem = TotemId3} = set(2,
                                                      G3,
                                                      Args),
    WG4 = #guild_league_guild{totem = TotemId4} = set(1,
                                                      G4,
                                                      Args),
    B = #guild_league_match{id = NextId, time = Now,
                            phase = Phase, grade = Grade, season = Season},
    WA1 = #guild_league_alliance{id = {NextId, 1},
                                 gids = [Id1, Id4], names = [Name1, Name4],
                                 totems = [TotemId1, TotemId4], side = 1,
                                 phase = Phase, time = Now, match_id = NextId,
                                 grade = Grade},
    WA2 = #guild_league_alliance{id = {NextId, 2},
                                 gids = [Id2, Id3], names = [Name2, Name3],
                                 totems = [TotemId2, TotemId3], side = 2,
                                 phase = Phase, time = Now, match_id = NextId,
                                 grade = Grade},
    guild_league_match:update(B),
    update([WG1, WG2, WG3, WG4]),
    update([WA1, WA2]),
    cast_matched(group_by_platform([Id1, Id2, Id3, Id4],
                                   []),
                 #{alliances => [WA1, WA2],
                   guilds => [WG1, WG2, WG3, WG4], season => Season,
                   phase => Phase}),
    do_pair(T, Args#{next_id := NextId + 1});
do_pair([G1 = #guild_league_guild{id = Id1,
                                  name = Name1, grade = Grade},
         G2 = #guild_league_guild{id = Id2, name = Name2},
         G3 = #guild_league_guild{id = Id3, name = Name3}
         | T],
        Args = #{next_id := NextId, time := Now,
                 phase := Phase = guild_league_phase_fourth,
                 season := Season}) ->
    WG1 = #guild_league_guild{totem = TotemId1} = set(1,
                                                      G1,
                                                      Args),
    WG2 = #guild_league_guild{totem = TotemId2} = set(2,
                                                      G2,
                                                      Args),
    WG3 = #guild_league_guild{totem = TotemId3} = set(2,
                                                      G3,
                                                      Args),
    B = #guild_league_match{id = NextId, time = Now,
                            phase = Phase, grade = Grade, season = Season},
    WA1 = #guild_league_alliance{id = {NextId, 1},
                                 gids = [Id1], names = [Name1],
                                 totems = [TotemId1], side = 1, phase = Phase,
                                 time = Now, match_id = NextId, grade = Grade},
    WA2 = #guild_league_alliance{id = {NextId, 2},
                                 gids = [Id2, Id3], names = [Name2, Name3],
                                 totems = [TotemId2, TotemId3], side = 2,
                                 phase = Phase, time = Now, match_id = NextId,
                                 grade = Grade},
    guild_league_match:update(B),
    update([WG1, WG2, WG3]),
    update([WA1, WA2]),
    cast_matched(group_by_platform([Id1, Id2, Id3], []),
                 #{alliances => [WA1, WA2], guilds => [WG1, WG2, WG3],
                   phase => Phase, season => Season}),
    do_pair(T, Args#{next_id := NextId + 1});
do_pair([G1 = #guild_league_guild{id = Id1,
                                  name = Name1, grade = Grade,
                                  season_consecutive_win = ConsecutiveWin,
                                  avg_lev = _AvgLv1, eliminated = Eliminated},
         G2 = #guild_league_guild{id = Id2, name = Name2,
                                  avg_lev = _AvgLv2}
         | T],
        Args = #{next_id := NextId, time := Now, phase := Phase,
                 season := Season}) ->
    WG1 = #guild_league_guild{totem = TotemId1} = set(1,
                                                      G1,
                                                      Args),
    WG2 = #guild_league_guild{totem = TotemId2} = set(2,
                                                      G2,
                                                      Args),
    Type = case {Phase, ConsecutiveWin} of
               {7, 3} -> 1;
               {7, _} -> 2;
               _ ->
                   case Grade =:= 1 andalso min(6, Phase) > Eliminated of
                       true -> 4;
                       _ -> 3
                   end
           end,
    B = #guild_league_match{id = NextId, time = Now,
                            phase = Phase, grade = Grade, season = Season,
                            type = Type},
    WA1 = #guild_league_alliance{id = {NextId, 1},
                                 gids = [Id1], names = [Name1],
                                 totems = [TotemId1], side = 1, phase = Phase,
                                 time = Now, match_id = NextId, grade = Grade,
                                 subsidize_buff = []},
    WA2 = #guild_league_alliance{id = {NextId, 2},
                                 gids = [Id2], names = [Name2],
                                 totems = [TotemId2], side = 2, phase = Phase,
                                 time = Now, match_id = NextId, grade = Grade,
                                 subsidize_buff = []},
    guild_league_match:update(B),
    update([WG1, WG2]),
    update([WA1, WA2]),
    sync_data([WA1, WA2]),
    cast_matched(group_by_platform([Id1, Id2], []),
                 #{alliances => [WA1, WA2], guilds => [WG1, WG2],
                   phase => Phase, season => Season}),
    logger:debug("args ---> ~w, next_id ----> ~w",
                 [Args, NextId],
                 guild_league_guild,
                 925),
    do_pair(T, Args#{next_id := NextId + 1}).

set(Side,
    G = #guild_league_guild{id = Id,
                            totem = #guild_totem{id = TotemId}},
    #{next_id := NextId, time := Time, phase := Phase,
      season := Season}) ->
    G#guild_league_guild{id = Id, side = Side,
                         match_id = NextId, totem = TotemId, time = Time,
                         phase = Phase, season = Season,
                         key = {Id, Phase, Season}};
set(Side, G = #guild_league_guild{id = Id},
    #{next_id := NextId, time := Time, phase := Phase,
      season := Season}) ->
    G#guild_league_guild{id = Id, side = Side,
                         match_id = NextId, time = Time, phase = Phase,
                         season = Season, key = {Id, Phase, Season}}.

cast_matched([], _) -> ok;
cast_matched([{{P, Z}, _} | T], Args) ->
    big_world:cast(P,
                   Z,
                   guild_league_agent,
                   sync_matched,
                   [Args]),
    cast_matched(T, Args).

group_by_platform([], Groups) -> Groups;
group_by_platform([Id = {_, P, Z} | T], Groups) ->
    K = c_big_world:get_zone_mapping(P, Z),
    Groups1 = case lists:keyfind(K, 1, Groups) of
                  {K, L} -> lists:keyreplace(K, 1, Groups, {K, [Id | L]});
                  _ -> [{K, [Id]} | Groups]
              end,
    group_by_platform(T, Groups1);
group_by_platform([S = #guild_league_summary{id =
                                                 {_, P, Z}}
                   | T],
                  Groups) ->
    K = c_big_world:get_zone_mapping(P, Z),
    Groups1 = case lists:keyfind(K, 1, Groups) of
                  {K, L} -> lists:keyreplace(K, 1, Groups, {K, [S | L]});
                  _ -> [{K, [S]} | Groups]
              end,
    group_by_platform(T, Groups1).

load_data([]) -> ok;
load_data([guild | T]) ->
    F1 = fun (G) ->
                 case guild_league_ver:do_guild(G) of
                     {ok, G1 = #guild_league_guild{}} ->
                         ets:insert(guild_league_guild_log, G1),
                         continue;
                     {false, Why} ->
                         logger:error("公会联赛数据转换失败:~w",
                                      [Why],
                                      guild_league_guild,
                                      983),
                         {done, false}
                 end
         end,
    case dets:first(guild_league_guild_log) of
        '$end_of_table' -> ok;
        _ -> dets:traverse(guild_league_guild_log, F1)
    end,
    load_data(T);
load_data([alliance | T]) ->
    F1 = fun (A) ->
                 case guild_league_ver:do_alliance(A) of
                     {ok, A1 = #guild_league_alliance{}} ->
                         ets:insert(guild_league_alliance_log, A1),
                         continue;
                     {false, Why} ->
                         logger:error("公会联赛数据转换失败:~w",
                                      [Why],
                                      guild_league_guild,
                                      1000),
                         {done, false}
                 end
         end,
    case dets:first(guild_league_alliance_log) of
        '$end_of_table' -> ok;
        _ -> dets:traverse(guild_league_alliance_log, F1)
    end,
    load_data(T);
load_data([rank | T]) ->
    F2 = fun (R) ->
                 case guild_league_ver:do_rank(R) of
                     {ok, {K, L}} ->
                         ets:insert(guild_league_rank, {K, L}),
                         continue;
                     {false, Why} ->
                         logger:error("公会联赛数据转换失败:~w",
                                      [Why],
                                      guild_league_guild,
                                      1017),
                         {done, false}
                 end
         end,
    case dets:first(guild_league_rank) of
        '$end_of_table' -> ok;
        _ -> dets:traverse(guild_league_rank, F2)
    end,
    load_data(T);
load_data([summary | T]) ->
    F2 = fun (S) ->
                 case guild_league_ver:do_summary(S) of
                     {ok, S1 = #guild_league_summary{}} ->
                         ets:insert(guild_league_summary, S1),
                         continue;
                     {false, Why} ->
                         logger:error("公会联赛数据转换失败:~w",
                                      [Why],
                                      guild_league_guild,
                                      1034),
                         {done, false}
                 end
         end,
    case dets:first(guild_league_summary) of
        '$end_of_table' -> ok;
        _ -> dets:traverse(guild_league_summary, F2)
    end,
    load_data(T);
load_data([guess | T]) ->
    F1 = fun (G = #guild_league_guess{}) ->
                 ets:insert(guild_league_guess, G),
                 continue;
             (_) -> continue
         end,
    case dets:first(guild_league_guess) of
        '$end_of_table' -> ok;
        _ -> dets:traverse(guild_league_guess, F1)
    end,
    load_data(T);
load_data([unit | T]) ->
    F1 = fun (G = #guild_league_unit{}) ->
                 ets:insert(guild_league_unit, G),
                 continue;
             (_) -> continue
         end,
    case dets:first(guild_league_unit) of
        '$end_of_table' -> ok;
        _ -> dets:traverse(guild_league_unit, F1)
    end,
    load_data(T);
load_data([live | T]) ->
    F1 = fun (G = #guild_league_live{}) ->
                 ets:insert(guild_league_live, G),
                 continue;
             (_) -> continue
         end,
    case dets:first(guild_league_live) of
        '$end_of_table' -> ok;
        _ -> dets:traverse(guild_league_live, F1)
    end,
    load_data(T);
load_data([poll | T]) ->
    F1 = fun (G = #guild_league_poll{}) ->
                 ets:insert(guild_league_poll, G),
                 continue;
             (_) -> continue
         end,
    case dets:first(guild_league_poll) of
        '$end_of_table' -> ok;
        _ -> dets:traverse(guild_league_poll, F1)
    end,
    load_data(T);
load_data([champion | T]) ->
    F1 = fun (G = #guild_league_champion{}) ->
                 ets:insert(guild_league_champion, G),
                 continue;
             (_) -> continue
         end,
    case dets:first(guild_league_champion) of
        '$end_of_table' -> ok;
        _ -> dets:traverse(guild_league_champion, F1)
    end,
    load_data(T).

do_set_trump(G = #guild_league_guild{trumps = List},
             Trump = #guild_league_trump{id = Id, pos = Pos}) ->
    List1 = lists:keydelete(Pos,
                            #guild_league_trump.pos,
                            List),
    List2 = lists:keystore(Id,
                           #guild_league_trump.id,
                           List1,
                           Trump),
    G1 = G#guild_league_guild{trumps = List2},
    update(G1),
    {ok, G1}.

do_sync_data([], _) -> ok;
do_sync_data([{{P, Z}, _} | T], Args) ->
    big_world:cast(P,
                   Z,
                   guild_league_agent,
                   sync_data,
                   [Args]),
    do_sync_data(T, Args).

do_sync_data([]) -> ok;
do_sync_data([{{P, Z}, Data} | T]) ->
    big_world:cast(P,
                   Z,
                   guild_league_agent,
                   sync_data,
                   [Data]),
    do_sync_data(T).

update_rank([H = #guild_league_summary{grade = 1}
             | T]) ->
    L2 = util:keys_sort([#guild_league_summary.season_win,
                         #guild_league_summary.season_consecutive_win,
                         #guild_league_summary.eliminated],
                        [H | T]),
    update_rank(L2, 1);
update_rank(L) ->
    L2 = util:keys_sort([#guild_league_summary.strenth,
                         #guild_league_summary.attacked_unit,
                         #guild_league_summary.season_win,
                         #guild_league_summary.season_score],
                        L),
    update_rank(L2, 1).

update_rank([], _) -> [];
update_rank([S = #guild_league_summary{} | T], N) ->
    [S#guild_league_summary{rank = N} | update_rank(T,
                                                    N + 1)].

do_reset_rank(8, L) ->
    L1 = util:keys_sort([#guild_league_summary.strenth,
                         {asc, #guild_league_summary.rank}],
                        L),
    update_rank(L1, 1);
do_reset_rank(_, L) -> update_rank(L).

rearrange_group(Type) ->
    L1 = ets:tab2list(guild_league_summary),
    L2 = case Type of
             season ->
                 util:keys_sort([#guild_league_summary.strenth,
                                 {asc, #guild_league_summary.rank}],
                                L1);
             _ ->
                 util:keys_sort([#guild_league_summary.strenth,
                                 #guild_league_summary.attacked_unit,
                                 #guild_league_summary.season_win,
                                 #guild_league_summary.season_score],
                                L1)
         end,
    {LS, L3} = lists:partition(fun
                                   (#guild_league_summary{grade = Grade}) ->
                                       Grade =:= 1
                               end,
                               L2),
    {LA, L4} = lists:partition(fun
                                   (#guild_league_summary{grade = Grade}) ->
                                       Grade =:= 2
                               end,
                               L3),
    {LB, LC} = lists:partition(fun
                                   (#guild_league_summary{grade = Grade}) ->
                                       Grade =:= 3
                               end,
                               L4),
    SGNum = length(LS) div 4,
    LS1 = arrange_super_group(LS, SGNum),
    AGNum = length(LA) div 4,
    LA1 = arrange_group(LA, {1, 1}, AGNum),
    BGNum = length(LB) div 4,
    LB1 = arrange_group(LB, {1, 1}, BGNum),
    LC1 = lists:sublist(LC, 64),
    CGNum = length(LC1) div 4,
    LC2 = arrange_group(LC1, {1, 1}, CGNum),
    update(LS1),
    update(LA1),
    update(LB1),
    update(LC2),
    ok.

arrange_group([], _, _) -> [];
arrange_group(L, _, GNum) when GNum < 2 ->
    do_arrange_group(L, 1, 1);
arrange_group([G = #guild_league_guild{} | T],
              {Group, Order}, GNum) ->
    {NewGroup, NewOrder} = case Group >= GNum of
                               true -> {1, Order + 1};
                               _ -> {Group + 1, Order}
                           end,
    NewG = G#guild_league_guild{group = Group,
                                order = Order},
    [NewG | arrange_group(T, {NewGroup, NewOrder}, GNum)];
arrange_group([G = #guild_league_summary{} | T],
              {Group, Order}, GNum) ->
    {NewGroup, NewOrder} = case Group >= GNum of
                               true -> {1, Order + 1};
                               _ -> {Group + 1, Order}
                           end,
    NewG = G#guild_league_summary{group = Group,
                                  order = Order},
    [NewG | arrange_group(T, {NewGroup, NewOrder}, GNum)].

do_arrange_group([], _, _) -> [];
do_arrange_group([G = #guild_league_guild{} | T], Group,
                 N) ->
    NewG = G#guild_league_guild{group = 1, order = N},
    [NewG | do_arrange_group(T, Group, N + 1)];
do_arrange_group([G = #guild_league_summary{} | T],
                 Group, N) ->
    NewG = G#guild_league_summary{group = Group, order = N},
    [NewG | do_arrange_group(T, Group, N + 1)].

arrange_super_group([], _SGNum) -> [];
arrange_super_group(L, SGNum) when SGNum < 2 ->
    do_arrange_group(L, 1, 1);
arrange_super_group(L, SGNum) ->
    do_arrange_super_group(L, SGNum, 1, []).

do_arrange_super_group([], _, _, Groups) ->
    arrange_super_order([{I, lists:reverse(L)}
                         || {I, L} <- Groups],
                        1);
do_arrange_super_group([H | T], SGNum, N, L) ->
    N1 = (N - 1) rem SGNum + 1,
    case lists:keyfind(N1, 1, L) of
        {N1, Exist} ->
            Gids = [G1
                    || #guild_league_summary{group = G1} <- Exist],
            case [S
                  || S = #guild_league_summary{group = G2} <- [H | T],
                     lists:member(G2, Gids) =:= false]
                of
                [H2 = #guild_league_summary{id = Id} | _T2] ->
                    L1 = lists:keyreplace(N1, 1, L, {N1, [H2 | Exist]}),
                    do_arrange_super_group(lists:keydelete(Id,
                                                           #guild_league_summary.id,
                                                           [H | T]),
                                           SGNum,
                                           N + 1,
                                           L1);
                _ ->
                    L1 = lists:keyreplace(N1, 1, L, {N1, [H | Exist]}),
                    do_arrange_super_group(T, SGNum, N + 1, L1)
            end;
        _ ->
            do_arrange_super_group(T, SGNum, N + 1, [{N1, [H]} | L])
    end.

arrange_super_order([], _) -> [];
arrange_super_order([{_, []} | T], _) ->
    arrange_super_order(T, 1);
arrange_super_order([{Group, [H | T]} | Rest], Order) ->
    [H#guild_league_summary{group = Group, order = Order,
                            season_score = 0, season_win = 0,
                            consecutive_win = 0, season_consecutive_win = 0,
                            eliminated = 8}
     | arrange_super_order([{Group, T} | Rest], Order + 1)].

up_and_down_score([]) -> {0, 0};
up_and_down_score([_]) -> {0, 0};
up_and_down_score(L) ->
    L1 = lists:sort([Score
                     || #guild_league_summary{season_score = Score} <- L]),
    L2 = lists:sublist(L1, 100),
    Up = erlang:hd(L2),
    {_, L3} = lists:split(length(L2) div 2, L2),
    Down = erlang:hd(L3),
    {Up, Down}.

get_grade_name(1) -> lang:get("冠军");
get_grade_name(2) -> lang:get("甲级");
get_grade_name(3) -> lang:get("乙级");
get_grade_name(_) -> lang:get("丙级").

notice_up_grade([]) -> ok;
notice_up_grade([#guild_league_summary{id =
                                           Id = {_, P, Z},
                                       grade = Grade = 1}
                 | T]) ->
    Content =
        notice:format(lang:get("经历一轮公会~ts联赛腥风血雨，我们公会成功突围而出，获得了参加~ts联赛的资格，我们将与"
                               "其他获得冠军联赛资格的公会共同竞争，夺取冠军联赛的总冠军，总冠军不但能获得丰厚的奖励，还能"
                               "获得公会联赛奖杯。为了奖励，为了荣誉而战吧！{face_1,7}"),
                      [{string_2, 5, get_grade_name(Grade + 1)},
                       {string_2, 5, get_grade_name(Grade)}]),
    big_world:cast(P,
                   Z,
                   guild_common,
                   send_mail,
                   [Id, "", Content]),
    notice_up_grade(T);
notice_up_grade([#guild_league_summary{id =
                                           Id = {_, P, Z},
                                       grade = Grade}
                 | T]) ->
    Content =
        notice:format(lang:get("我们公会众志成城，在~ts联赛的战绩有目共睹，恭喜晋级~ts联赛，初始积分为~ts，祝贵公"
                               "会越战越勇、再创佳绩{face_1,18}"),
                      [{string_2, 5, get_grade_name(Grade + 1)},
                       {string_2, 5, get_grade_name(Grade)},
                       {string_2, 5, 0}]),
    big_world:cast(P,
                   Z,
                   guild_common,
                   send_mail,
                   [Id, "", Content]),
    notice_up_grade(T).

send_invitation(#guild_league_guild{id = Id = {_, P, Z},
                                    grade = Grade = 2},
                init) ->
    Fmt =
        lang:get("第一届冠军联赛正式开打，本公会获得~ts联赛资格，将与各大服务器公会同台竞技。甲级联赛前~"
                 "ts名的公会将获得种子公会的头衔、并参与~ts联赛的争夺{face_1,7} "
                 ""),
    Content = notice:format(Fmt,
                            [{string_2, 5, get_grade_name(Grade)},
                             {string_2, 5, 16},
                             {string_2, 5, get_grade_name(Grade - 1)}]),
    big_world:cast(P,
                   Z,
                   guild_common,
                   send_mail,
                   [Id, "", Content]);
send_invitation(#guild_league_guild{id = Id = {_, P, Z},
                                    grade = Grade = 3},
                init) ->
    Fmt =
        lang:get("第一届冠军联赛正式开打，本公会获得~ts联赛资格，将与各大服务器公会同台竞技。乙级联赛前~"
                 "ts名的公会将晋级~ts联赛，齐心协力捍卫公会荣誉吧{face_1,7}"),
    Content = notice:format(Fmt,
                            [{string_2, 5, get_grade_name(Grade)},
                             {string_2, 5, 16},
                             {string_2, 5, get_grade_name(Grade - 1)}]),
    big_world:cast(P,
                   Z,
                   guild_common,
                   send_mail,
                   [Id, "", Content]);
send_invitation(#guild_league_guild{id = Id = {_, P, Z},
                                    grade = Grade = 4},
                init) ->
    Fmt =
        lang:get("第一届冠军联赛正式开打，本公会获得~ts联赛资格，将与各大服务器公会同台竞技。丙级联赛前~"
                 "ts名的公会将晋级~ts联赛，齐心协力捍卫公会荣誉吧{face_1,7}"),
    Content = notice:format(Fmt,
                            [{string_2, 5, get_grade_name(Grade)},
                             {string_2, 5, 16},
                             {string_2, 5, get_grade_name(Grade - 1)}]),
    big_world:cast(P,
                   Z,
                   guild_common,
                   send_mail,
                   [Id, "", Content]);
send_invitation(#guild_league_summary{id =
                                          Id = {_, P, Z},
                                      grade = Grade = 2},
                _) ->
    Fmt =
        lang:get("新的一届冠军联赛正式开打，本公会获得~ts联赛资格，将与各大服务器公会同台竞技。甲级联赛前"
                 "~ts名的公会将获得种子公会的头衔、并参与~ts联赛的争夺{face_1,7} "
                 ""),
    Content = notice:format(Fmt,
                            [{string_2, 5, get_grade_name(Grade)},
                             {string_2, 5, 16},
                             {string_2, 5, get_grade_name(Grade - 1)}]),
    big_world:cast(P,
                   Z,
                   guild_common,
                   send_mail,
                   [Id, "", Content]);
send_invitation(#guild_league_summary{id =
                                          Id = {_, P, Z},
                                      grade = Grade = 3},
                _) ->
    Fmt =
        lang:get("新的一届冠军联赛正式开打，本公会获得~ts联赛资格，将与各大服务器公会同台竞技。乙级联赛前"
                 "~ts名的公会将晋级~ts联赛，齐心协力捍卫公会荣誉吧{face_1,7}"),
    Content = notice:format(Fmt,
                            [{string_2, 5, get_grade_name(Grade)},
                             {string_2, 5, 16},
                             {string_2, 5, get_grade_name(Grade - 1)}]),
    big_world:cast(P,
                   Z,
                   guild_common,
                   send_mail,
                   [Id, "", Content]);
send_invitation(#guild_league_summary{id =
                                          Id = {_, P, Z},
                                      grade = Grade = 4},
                _) ->
    Fmt =
        lang:get("新的一届冠军联赛正式开打，本公会获得~ts联赛资格，将与各大服务器公会同台竞技。丙级联赛前"
                 "~ts名的公会将晋级~ts联赛，齐心协力捍卫公会荣誉吧{face_1,7}"),
    Content = notice:format(Fmt,
                            [{string_2, 5, get_grade_name(Grade)},
                             {string_2, 5, 16},
                             {string_2, 5, get_grade_name(Grade - 1)}]),
    big_world:cast(P,
                   Z,
                   guild_common,
                   send_mail,
                   [Id, "", Content]);
send_invitation(#guild_league_guild{id = Id = {_, P, Z},
                                    grade = Grade = 4},
                _) ->
    Fmt =
        lang:get("新的一届冠军联赛正式开打，本公会获得~ts联赛资格，将与各大服务器公会同台竞技。丙级联赛前"
                 "~ts名的公会将晋级~ts联赛，齐心协力捍卫公会荣誉吧{face_1,7}"),
    Content = notice:format(Fmt,
                            [{string_2, 5, get_grade_name(Grade)},
                             {string_2, 5, 16},
                             {string_2, 5, get_grade_name(Grade - 1)}]),
    big_world:cast(P,
                   Z,
                   guild_common,
                   send_mail,
                   [Id, "", Content]);
send_invitation(_, _) -> ok.

group_promote(L, N) ->
    L1 = sort(L),
    do_group_promote(L1, N).

do_group_promote([], _N) -> [];
do_group_promote([{_, L} | T], N) ->
    L1 = lists:keysort(#guild_league_summary.rank, L),
    lists:sublist(L1, N) ++ do_group_promote(T, N).

group_demote(L, N) ->
    L1 = sort(L),
    do_group_demote(L1, N).

do_group_demote([], _N) -> [];
do_group_demote([{_, L} | T], N) ->
    L1 = util:keys_sort([#guild_league_summary.rank], L),
    case 4 - length(L1) of
        N1 when N > N1 ->
            lists:sublist(L1, N - N1) ++ do_group_demote(T, N);
        _ -> do_group_demote(T, N)
    end.

init_summary(L, Type) ->
    [send_invitation(G, Type) || G <- L],
    Fun = fun (#guild_league_guild{id = Id, name = Name,
                                   lev = Lev, leader_id = LeaderId,
                                   leader_name = LeaderName,
                                   totem = #guild_totem{id = Totem},
                                   grade = Grade, order = Order, group = Group,
                                   strenth = Strenth}) ->
                  #guild_league_summary{id = Id, name = Name, lev = Lev,
                                        leader_id = LeaderId,
                                        leader_name = LeaderName, totem = Totem,
                                        grade = Grade, order = Order,
                                        group = Group, strenth = Strenth,
                                        rank = 130};
              (#guild_league_guild{id = Id, name = Name, lev = Lev,
                                   leader_id = LeaderId,
                                   leader_name = LeaderName, totem = Totem,
                                   grade = Grade, order = Order, group = Group,
                                   strenth = Strenth}) ->
                  #guild_league_summary{id = Id, name = Name, lev = Lev,
                                        leader_id = LeaderId,
                                        leader_name = LeaderName, totem = Totem,
                                        grade = Grade, order = Order,
                                        group = Group, strenth = Strenth,
                                        rank = 130}
          end,
    L1 = [Fun(G) || G <- L],
    update(L1).

do_update_champion([], _) -> ok;
do_update_champion([{1, L} | T], Season) ->
    case [{Id, Name, Rank, Totem}
          || #guild_league_summary{id = Id, name = Name,
                                   rank = Rank, totem = Totem}
                 <- lists:sublist(L, 3)]
        of
        Top = [{Cid, _, _, _} | _] ->
            env:save(guild_league_champion, Cid),
            Champion = #guild_league_champion{season = Season,
                                              top3 = Top},
            update(Champion),
            big_world:cast(all,
                           guild_league_agent,
                           sync_champion,
                           [Champion]);
        _ -> ok
    end,
    do_reward_rank(L),
    do_update_champion(T, Season);
do_update_champion([{_, L} | T], Season) ->
    do_reward_rank(L),
    do_update_champion(T, Season).

do_reward_rank([]) -> ok;
do_reward_rank([#guild_league_summary{id =
                                          Id = {_, P, Z},
                                      grade = Grade, rank = Rank}
                | T]) ->
    case guild_league_data:get_rank_reward(Grade, Rank) of
        #{items := Items, guild_assets := Assets} ->
            Msg = notice:format(lang:get("冠军联赛排行榜勇夺~ts组第~ts，"),
                                [{string_2, 5, get_grade_name(Grade)},
                                 {string_2, 5, Rank}]),
            big_world:cast(P, Z, guild_loot, add, [Id, Items, Msg]),
            big_world:cast(P,
                           Z,
                           guild_common,
                           add_assets,
                           [Id, {not_weekly, Assets}]),
            GroupName = util:flist(lang:get("~ts组"),
                                   [get_grade_name(Grade)]),
            Notice = case {Grade, Rank} of
                         {1, 1} ->
                             notice:format(lang:get("雄起！公会成员万众一心，在本届冠军联赛中力压群雄，勇夺冠军！获得~ts公会资金和~ts奖励"
                                                    "{face_1, 18}，~ts已发放至公会领地，赶紧去膜拜一下吧"),
                                           [{string_2, 1, Assets},
                                            {item_2, Items},
                                            {string_2, 1, lang:get("冠军奖杯")}]);
                         _ ->
                             notice:format(lang:get("公会成员万众一心，在本届冠军联赛中夺得了~ts第~ts名！获得了~ts公会资金和~ts奖励"
                                                    "，会长快快论功行赏吧{face_1, 18}"),
                                           [{string_2, 1, GroupName},
                                            {string_2, 1, Rank},
                                            {string_2, 1, Assets},
                                            {item_2, Items}])
                     end,
            Content = case {Grade, Rank} of
                          {1, 1} ->
                              notice:format(lang:get("雄起！公会成员万众一心，在本届冠军联赛中力压群雄，勇夺冠军！获得~ts公会资金和~ts奖励"
                                                     "，~ts已发放至公会领地，赶紧去膜拜一下吧"),
                                            [{string_2, 1, Assets},
                                             {item_2, Items},
                                             {string_2, 1, lang:get("冠军奖杯")}]);
                          _ ->
                              notice:format(lang:get("公会成员万众一心，在本届冠军联赛中夺得了~ts第~ts名！获得了~ts公会资金和~ts奖励"
                                                     "，会长快快论功行赏吧"),
                                            [{string_2, 1, GroupName},
                                             {string_2, 1, Rank},
                                             {string_2, 1, Assets},
                                             {item_2, Items}])
                      end,
            big_world:cast(P,
                           Z,
                           guild_common,
                           send_mail,
                           [Id, "", Content]),
            big_world:cast(P, Z, guild, notice, [Id, Notice]);
        _ -> ok
    end,
    do_reward_rank(T).

