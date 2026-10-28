-file("src/merge/merge_dets_env.erl", 1).

-module(merge_dets_env).

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

-file("src/merge/merge_dets_env.erl", 12).

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

-file("src/merge/merge_dets_env.erl", 13).

do_init(Table = #merge_table{server =
                                 #merge_server{index = Size, size = Size}}) ->
    SrvList = merge_util:all_server(),
    List = [util:to_list(util:flist("~ts_~w",
                                    [Platform, ZoneId]))
            || #merge_server{platform = Platform, zone_id = ZoneId}
                   <- SrvList],
    merge(List),
    {ok, [], Table};
do_init(Table) -> {ok, [], Table}.

do_convert([], Table) -> {ok, Table}.

do_end(_Table) -> ignore.

merge(L) ->
    dets:open_file(env_file,
                   [{file, "../dets/env.dets"}, {type, set}, {keypos, 1}]),
    dets:delete_all_objects(env_file),
    ets:new(env, [named_table, public, set, {keypos, 1}]),
    merge_other(L),
    dets:close(env_file),
    ok.

merge_other([]) -> ok;
merge_other([PlatformZone | T]) ->
    {ok, DetsFlag} = util:string_to_term("env_" ++
                                             PlatformZone),
    dets:open_file(DetsFlag,
                   [{file, "../dets/" ++ PlatformZone ++ "/env.dets"},
                    {type, set}]),
    case dets:first(DetsFlag) of
        '$end_of_table' ->
            logger:info("~s 目录下没有需要合并的环境变量数据",
                        [PlatformZone],
                        merge_dets_env,
                        46);
        _ ->
            dets:traverse(DetsFlag,
                          fun (Data = {_Key, _Val}) ->
                                  handle_compare(Data),
                                  continue;
                              (_) -> continue
                          end),
            ok
    end,
    case ets:lookup(env, merge_index) of
        [] -> dets:insert(env_file, {merge_index, 1});
        [{_, Index}] ->
            dets:insert(env_file, {merge_index, Index + 1});
        _ -> skip
    end,
    dets:insert(env_file, {server_test_mode, 1}),
    dets:close(DetsFlag),
    merge_other(T).

handle_compare(Data = {Key = mail_sess_id, Id1}) ->
    case ets:lookup(env, Key) of
        [{Key, Id2}] ->
            ets:insert(env, {Key, max(Id1, Id2)}),
            dets:insert(env_file, {Key, max(Id1, Id2)});
        [] ->
            ets:insert(env, Data),
            dets:insert(env_file, Data)
    end;
handle_compare(Data = {Key = merge_index, Id1}) ->
    case ets:lookup(env, Key) of
        [{Key, Id2}] ->
            ets:insert(env, {Key, max(Id1, Id2)}),
            dets:insert(env_file, {Key, max(Id1, Id2)});
        [] ->
            ets:insert(env, Data),
            dets:insert(env_file, Data)
    end;
handle_compare(Data = {Key = goodvoice_local_submit,
                       SubList1}) ->
    case ets:lookup(env, Key) of
        [{Key, SubList2}] ->
            ets:insert(env, {Key, SubList1 ++ SubList2}),
            dets:insert(env_file, {Key, SubList1 ++ SubList2});
        [] ->
            ets:insert(env, Data),
            dets:insert(env_file, Data)
    end;
handle_compare(Data = {Key = wedding_roles,
                       RoleList1}) ->
    case ets:lookup(env, Key) of
        [{Key, RoleList2}] ->
            logger:info("结婚补偿列表1[~w],列表2[~w]",
                        [RoleList1, RoleList2],
                        merge_dets_env,
                        98),
            ets:insert(env, {Key, RoleList1 ++ RoleList2}),
            dets:insert(env_file, {Key, RoleList1 ++ RoleList2});
        [] ->
            logger:info("结婚补偿列表1[~w]",
                        [RoleList1],
                        merge_dets_env,
                        102),
            ets:insert(env, Data),
            dets:insert(env_file, Data)
    end;
handle_compare(Data = {Key = sworn_env_list,
                       RoleList1}) ->
    case ets:lookup(env, Key) of
        [{Key, RoleList2}] ->
            logger:info("结拜未完成列表1 [~w],列表2[~w]",
                        [RoleList1, RoleList2],
                        merge_dets_env,
                        109),
            ets:insert(env, {Key, RoleList1 ++ RoleList2}),
            dets:insert(env_file, {Key, RoleList1 ++ RoleList2});
        [] ->
            logger:info("结拜未完成列表1[~w]",
                        [RoleList1],
                        merge_dets_env,
                        113),
            ets:insert(env, Data),
            dets:insert(env_file, Data)
    end;
handle_compare(Data = {_Key = skill_unique_chief,
                       _ChiefInfo}) ->
    ets:insert(env, Data),
    dets:insert(env_file, Data);
handle_compare(Data = {Key = max_world_fc,
                       #{eqm := MaxEqmScore1, stone := MaxStoneScore1,
                         wing := MaxWingScore1,
                         skill_prac := MaxSkillPracScore1, ext := MaxExtScore1,
                         mount := MaxMountScore1}}) ->
    case ets:lookup(env, Key) of
        [{Key,
          #{eqm := MaxEqmScore2, stone := MaxStoneScore2,
            wing := MaxWingScore2, skill_prac := MaxSkillPracScore2,
            ext := MaxExtScore2, mount := MaxMountScore2}}] ->
            MaxEqmScore = max(MaxEqmScore1, MaxEqmScore2),
            MaxStoneScore = max(MaxStoneScore1, MaxStoneScore2),
            MaxWingScore = max(MaxWingScore1, MaxWingScore2),
            MaxSkillPracScore = max(MaxSkillPracScore1,
                                    MaxSkillPracScore2),
            MaxExtScore = max(MaxExtScore1, MaxExtScore2),
            MaxMountScore = max(MaxMountScore1, MaxMountScore2),
            NewData = #{eqm => MaxEqmScore, stone => MaxStoneScore,
                        wing => MaxWingScore, skill_prac => MaxSkillPracScore,
                        ext => MaxExtScore, ext => MaxMountScore},
            ets:insert(env, {Key, NewData}),
            dets:insert(env_file, {Key, NewData});
        [] ->
            ets:insert(env, Data),
            dets:insert(env_file, Data)
    end;
handle_compare(Data = {Key = guild_war_next_id, Id1}) ->
    case ets:lookup(env, Key) of
        [{Key, Id2}] ->
            ets:insert(env, {Key, Id1 + Id2}),
            dets:insert(env_file, {Key, Id1 + Id2});
        [] ->
            ets:insert(env, Data),
            dets:insert(env_file, Data)
    end;
handle_compare(Data = {Key = friend_recall, Id1}) ->
    case ets:lookup(env, Key) of
        [{Key, Id2}] ->
            ets:insert(env, {Key, max(Id1, Id2)}),
            dets:insert(env_file, {Key, max(Id1, Id2)});
        [] ->
            ets:insert(env, Data),
            dets:insert(env_file, Data)
    end;
handle_compare(Data = {Key = guild_war_precious_pool,
                       Id1}) ->
    case ets:lookup(env, Key) of
        [{Key, Id2}] ->
            ets:insert(env, {Key, max(Id1, Id2)}),
            dets:insert(env_file, {Key, max(Id1, Id2)});
        [] ->
            ets:insert(env, Data),
            dets:insert(env_file, Data)
    end;
handle_compare(Data = {Key = combat_record_id, Id1}) ->
    case ets:lookup(env, Key) of
        [{Key, Id2}] ->
            ets:insert(env, {Key, max(Id1, Id2)}),
            dets:insert(env_file, {Key, max(Id1, Id2)});
        [] ->
            ets:insert(env, Data),
            dets:insert(env_file, Data)
    end;
handle_compare(Data = {Key = tournament_season_id,
                       Id1}) ->
    case ets:lookup(env, Key) of
        [{Key, Id2}] ->
            ets:insert(env, {Key, max(Id1, Id2)}),
            dets:insert(env_file, {Key, max(Id1, Id2)});
        [] ->
            ets:insert(env, Data),
            dets:insert(env_file, Data)
    end;
handle_compare(Data = {Key = lev_break_contribution,
                       Id1}) ->
    case ets:lookup(env, Key) of
        [{Key, Id2}] ->
            ets:insert(env, {Key, max(Id1, Id2)}),
            dets:insert(env_file, {Key, max(Id1, Id2)});
        [] ->
            ets:insert(env, Data),
            dets:insert(env_file, Data)
    end;
handle_compare(Data = {Key = lev_break_boss_killed,
                       Id1}) ->
    case ets:lookup(env, Key) of
        [{Key, Id2}] ->
            ets:insert(env, {Key, max(Id1, Id2)}),
            dets:insert(env_file, {Key, max(Id1, Id2)});
        [] ->
            ets:insert(env, Data),
            dets:insert(env_file, Data)
    end;
handle_compare(Data = {Key = lev_break_boss_killed_time,
                       Id1}) ->
    case ets:lookup(env, Key) of
        [{Key, Id2}] when Id1 =/= 0 andalso Id2 =/= 0 ->
            ets:insert(env, {Key, min(Id1, Id2)}),
            dets:insert(env_file, {Key, min(Id1, Id2)});
        [{Key, Id2}] ->
            ets:insert(env, {Key, max(Id1, Id2)}),
            dets:insert(env_file, {Key, max(Id1, Id2)});
        [] ->
            ets:insert(env, Data),
            dets:insert(env_file, Data)
    end;
handle_compare(Data = {Key = lev_break_active, Id1}) ->
    case ets:lookup(env, Key) of
        [{Key, Id2}] ->
            ets:insert(env, {Key, max(Id1, Id2)}),
            dets:insert(env_file, {Key, max(Id1, Id2)});
        [] ->
            ets:insert(env, Data),
            dets:insert(env_file, Data)
    end;
handle_compare(Data = {Key = lev_break_boss_active_time,
                       Id1}) ->
    case ets:lookup(env, Key) of
        [{Key, Id2}] ->
            ets:insert(env, {Key, max(Id1, Id2)}),
            dets:insert(env_file, {Key, max(Id1, Id2)});
        [] ->
            ets:insert(env, Data),
            dets:insert(env_file, Data)
    end;
handle_compare(Data = {Key =
                           campaign_group_purchase_ver,
                       Id1}) ->
    case ets:lookup(env, Key) of
        [{Key, Id2}] ->
            ets:insert(env, {Key, max(Id1, Id2)}),
            dets:insert(env_file, {Key, max(Id1, Id2)});
        [] ->
            ets:insert(env, Data),
            dets:insert(env_file, Data)
    end;
handle_compare(Data = {Key = guild_dungeon_team_id,
                       Id1}) ->
    case ets:lookup(env, Key) of
        [{Key, Id2}] ->
            ets:insert(env, {Key, max(Id1, Id2)}),
            dets:insert(env_file, {Key, max(Id1, Id2)});
        [] ->
            ets:insert(env, Data),
            dets:insert(env_file, Data)
    end;
handle_compare(Data = {Key = lev_break_boss_active,
                       Id1}) ->
    case ets:lookup(env, Key) of
        [{Key, Id2}] ->
            ets:insert(env, {Key, max(Id1, Id2)}),
            dets:insert(env_file, {Key, max(Id1, Id2)});
        [] ->
            ets:insert(env, Data),
            dets:insert(env_file, Data)
    end;
handle_compare(Data = {Key = top_lev, Id1}) ->
    case ets:lookup(env, Key) of
        [{Key, Id2}] ->
            ets:insert(env, {Key, max(Id1, Id2)}),
            dets:insert(env_file, {Key, max(Id1, Id2)});
        [] ->
            ets:insert(env, Data),
            dets:insert(env_file, Data)
    end;
handle_compare(Data = {Key = guild_league_phase,
                       Id1}) ->
    case ets:lookup(env, Key) of
        [{Key, Id2}] ->
            ets:insert(env, {Key, max(Id1, Id2)}),
            dets:insert(env_file, {Key, max(Id1, Id2)});
        [] ->
            ets:insert(env, Data),
            dets:insert(env_file, Data)
    end;
handle_compare(Data = {Key = guild_league_season,
                       Id1}) ->
    case ets:lookup(env, Key) of
        [{Key, Id2}] ->
            ets:insert(env, {Key, max(Id1, Id2)}),
            dets:insert(env_file, {Key, max(Id1, Id2)});
        [] ->
            ets:insert(env, Data),
            dets:insert(env_file, Data)
    end;
handle_compare(Data = {Key = guild_league_champion,
                       Id1}) ->
    case ets:lookup(env, Key) of
        [{Key, Id2}] ->
            ets:insert(env, {Key, max(Id1, Id2)}),
            dets:insert(env_file, {Key, max(Id1, Id2)});
        [] ->
            ets:insert(env, Data),
            dets:insert(env_file, Data)
    end;
handle_compare(Data = {Key = tournament_result_id,
                       Id1}) ->
    case ets:lookup(env, Key) of
        [{Key, Id2}] ->
            ets:insert(env, {Key, max(Id1, Id2)}),
            dets:insert(env_file, {Key, max(Id1, Id2)});
        [] ->
            ets:insert(env, Data),
            dets:insert(env_file, Data)
    end;
handle_compare(Data = {Key = child_id, Id1}) ->
    case ets:lookup(env, Key) of
        [{Key, Id2}] ->
            ets:insert(env, {Key, max(Id1, Id2)}),
            dets:insert(env_file, {Key, max(Id1, Id2)});
        [] ->
            ets:insert(env, Data),
            dets:insert(env_file, Data)
    end;
handle_compare(Data = {Key = tower_first, _Id}) ->
    case ets:lookup(env, Key) of
        [{_Key, _Id2}] -> ok;
        [] ->
            ets:insert(env, Data),
            dets:insert(env_file, Data)
    end;
handle_compare(Data = {Key = friend_group_id, Id1}) ->
    case ets:lookup(env, Key) of
        [{Key, Id2}] ->
            ets:insert(env, {Key, max(Id1, Id2)}),
            dets:insert(env_file, {Key, max(Id1, Id2)});
        [] ->
            ets:insert(env, Data),
            dets:insert(env_file, Data)
    end;
handle_compare(Data = {Key = review_id, Id1}) ->
    case ets:lookup(env, Key) of
        [{Key, Id2}] ->
            ets:insert(env, {Key, max(Id1, Id2)}),
            dets:insert(env_file, {Key, max(Id1, Id2)});
        [] ->
            ets:insert(env, Data),
            dets:insert(env_file, Data)
    end;
handle_compare(Data = {Key = rencounter_season_id,
                       Id1}) ->
    case ets:lookup(env, Key) of
        [{Key, Id2}] ->
            ets:insert(env, {Key, max(Id1, Id2)}),
            dets:insert(env_file, {Key, max(Id1, Id2)});
        [] ->
            ets:insert(env, Data),
            dets:insert(env_file, Data)
    end;
handle_compare(Data = {Key = friend_offer_medal_id,
                       Id1}) ->
    case ets:lookup(env, Key) of
        [{Key, Id2}] ->
            ets:insert(env, {Key, max(Id1, Id2)}),
            dets:insert(env_file, {Key, max(Id1, Id2)});
        [] ->
            ets:insert(env, Data),
            dets:insert(env_file, Data)
    end;
handle_compare(Data = {Key = spirit_treasure_is_cross,
                       _Id}) ->
    case ets:lookup(env, Key) of
        [_] -> ok;
        [] ->
            ets:insert(env, Data),
            dets:insert(env_file, Data)
    end;
handle_compare(_) -> ok.

