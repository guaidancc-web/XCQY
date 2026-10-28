-file("src/merge/merge_dets_guild_league.erl", 1).

-module(merge_dets_guild_league).

-export([do_init/1, do_convert/2, do_end/1]).

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

-file("src/merge/merge_dets_guild_league.erl", 14).

-file("inc/merge.hrl", 1).

-record(merge_table,
        {name = <<>>,
         table = <<>>,
         dao,
         server,
         next_key = 0,
         process = merge_main_proc,
         state,
         new_srv_id,
         old_srv_id}).

-record(merge_server,
        {platform = "",
         zone_id = 1,
         data_source,
         schema,
         target_schema,
         index = 0,
         size = 0}).

-record(merge_role_name,
        {key = {0, <<>>, 0},
         name = <<>>,
         lev = 0,
         exp = 0,
         data_source}).

-file("src/merge/merge_dets_guild_league.erl", 15).

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

-file("src/merge/merge_dets_guild_league.erl", 16).

do_init(Table = #merge_table{server =
                                 #merge_server{index = Size, size = Size}}) ->
    merge_util:dets_merge(guild_league_rank,
                          "guild_league_rank.dets",
                          set,
                          1,
                          undefined),
    merge_util:dets_merge(guild_league_summary,
                          "guild_league_summary.dets",
                          set,
                          #guild_league_summary.id,
                          undefined),
    merge_util:dets_merge(guild_league_guild_log,
                          "guild_league_guild_log.dets",
                          set,
                          #guild_league_guild.key,
                          undefined),
    merge_util:dets_merge(guild_league_alliance_log,
                          "guild_league_alliance_log.dets",
                          set,
                          #guild_league_alliance.id,
                          undefined),
    merge_util:dets_merge(guild_league_unit,
                          "guild_league_unit.dets",
                          set,
                          #guild_league_unit.id,
                          undefined),
    merge_util:dets_merge(guild_league_live,
                          "guild_league_live.dets",
                          set,
                          #guild_league_live.id,
                          undefined),
    merge_util:dets_merge(guild_league_poll,
                          "guild_league_poll.dets",
                          set,
                          #guild_league_poll.gid,
                          undefined),
    merge_util:dets_merge(guild_league_guess,
                          "guild_league_guess.dets",
                          set,
                          #guild_league_guess.id,
                          undefined),
    merge_util:dets_merge(guild_league_champion,
                          "guild_league_champion.dets",
                          set,
                          #guild_league_champion.season,
                          undefined),
    merge([]),
    {ok, [], Table};
do_init(Table) -> {ok, [], Table}.

do_convert([], Table) -> {ok, Table}.

do_end(_Table) -> ignore.

merge([]) -> ok;
merge([First | T]) ->
    dets:open_file(guild_league_guild_log,
                   [{file, "../dets/guild_league_guild.dets"},
                    {type, set},
                    {keypos, #guild_league_guild.id}]),
    dets:delete_all_objects(guild_league_guild_log),
    dets:open_file(guild_league_guild_log_first,
                   [{file,
                     "../dets/" ++ First ++ "/guild_league_guild.dets"},
                    {type, set},
                    {keypos, #guild_league_guild.id}]),
    ets:new(guild_name_used,
            [named_table, public, set, {keypos, 1}]),
    StartId = case dets:first(guild_league_guild_log_first)
                  of
                  '$end_of_table' ->
                      logger:info("~ts 目录下没有需要合并的冠军联赛数据",
                                  [First],
                                  merge_dets_guild_league,
                                  52),
                      0;
                  _ ->
                      dets:traverse(guild_league_guild_log_first,
                                    fun (G = #guild_league_guild{name =
                                                                     Name}) ->
                                            ets:insert(guild_name_used,
                                                       {Name, 1}),
                                            dets:insert(guild_league_guild_log,
                                                        G),
                                            continue;
                                        (_) -> continue
                                    end),
                      case dets:match(guild_league_guild_log_first,
                                      [{#guild_league_guild{match_id = '$1',
                                                            _ = '_'},
                                        [],
                                        ['$1']}])
                          of
                          [] ->
                              logger:info("~ts 目录下没有需要合并的冠军联赛对阵id数据",
                                          [First],
                                          merge_dets_guild_league,
                                          66),
                              0;
                          Mids -> lists:max(Mids)
                      end
              end,
    merge_other(T, StartId),
    dets:close(guild_league_guild_log),
    dets:close(guild_league_guild_log_first),
    ok.

merge_other([], _) -> ok;
merge_other([PlatformZone | T], StartId) ->
    {ok, DetsFlag} =
        util:string_to_term("guild_league_guild_log_" ++
                                PlatformZone),
    dets:open_file(DetsFlag,
                   [{file,
                     "../dets/" ++
                         PlatformZone ++ "/guild_league_guild.dets"},
                    {type, set},
                    {keypos, #guild_league_guild.id}]),
    MaxId = case dets:first(DetsFlag) of
                '$end_of_table' ->
                    logger:info("~ts 目录下没有需要合并的冠军联赛数据",
                                [PlatformZone],
                                merge_dets_guild_league,
                                84),
                    0;
                _ ->
                    dets:traverse(DetsFlag,
                                  fun (G = #guild_league_guild{match_id =
                                                                   MatchId}) ->
                                          handle_compare(G#guild_league_guild{match_id
                                                                                  =
                                                                                  MatchId
                                                                                      +
                                                                                      StartId}),
                                          continue;
                                      (_) -> continue
                                  end),
                    case dets:match(DetsFlag,
                                    [{#guild_league_guild{match_id = '$1',
                                                          _ = '_'},
                                      [],
                                      ['$1']}])
                        of
                        [] ->
                            logger:info("~ts 目录下没有需要合并的冠军联赛对阵id数据",
                                        [PlatformZone],
                                        merge_dets_guild_league,
                                        97),
                            0;
                        Mids -> lists:max(Mids)
                    end
            end,
    dets:close(DetsFlag),
    merge_other(T, StartId + MaxId).

handle_compare(G = #guild_league_guild{name = Name,
                                       id = {_, _, ZoneId}}) ->
    case ets:lookup(guild_name_used, Name) of
        [{Name, 1}] ->
            NewName = util:flist(lang:get("[s~w]~ts"),
                                 [ZoneId, Name]),
            ets:insert(guild_name_used, [{Name, 2}, {NewName, 1}]),
            dets:insert(guild_league_guild_log,
                        G#guild_league_guild{name = NewName});
        [{Name, N}] ->
            NewName = util:flist(lang:get("[s~w]~w~ts"),
                                 [ZoneId, N, Name]),
            ets:insert(guild_name_used,
                       [{Name, N + 1}, {NewName, 1}]),
            dets:insert(guild_league_guild_log,
                        G#guild_league_guild{name = NewName});
        _ ->
            ets:insert(guild_name_used, [{Name, 1}]),
            dets:insert(guild_league_guild_log, G)
    end.

