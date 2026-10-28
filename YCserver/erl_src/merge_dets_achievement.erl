-file("src/merge/merge_dets_achievement.erl", 1).

-module(merge_dets_achievement).

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

-file("src/merge/merge_dets_achievement.erl", 13).

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

-file("src/merge/merge_dets_achievement.erl", 14).

-file("inc/achievement.hrl", 1).

-record(m_achievement,
        {ver = 3 :: pos_integer(),
         point = 0 :: non_neg_integer(),
         finish = [] :: [{pos_integer(), pos_integer()}],
         doing = [] :: [tuple()],
         overdue = [] :: [pos_integer()],
         assets_point = 0 :: non_neg_integer(),
         focus = []}).

-record(achievement_log,
        {id = 0,
         accept = 0 :: integer(),
         finish = 0 :: integer()}).

-file("src/merge/merge_dets_achievement.erl", 15).

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

merge([First | T]) ->
    dets:open_file(achievement_log,
                   [{file, "../dets/achievement_log.dets"},
                    {type, set},
                    {keypos, #achievement_log.id}]),
    dets:delete_all_objects(achievement_log),
    dets:open_file(achievement_log_first,
                   [{file, "../dets/" ++ First ++ "/achievement_log.dets"},
                    {type, set},
                    {keypos, #achievement_log.id}]),
    ets:new(achievement_log,
            [named_table,
             public,
             set,
             {keypos, #achievement_log.id}]),
    case dets:first(achievement_log_first) of
        '$end_of_table' ->
            logger:info("~ts 目录下没有需要合并的成就数据",
                        [First],
                        merge_dets_achievement,
                        39);
        _ ->
            dets:traverse(achievement_log_first,
                          fun (AchLog = #achievement_log{}) ->
                                  ets:insert(achievement_log, AchLog),
                                  dets:insert(achievement_log, AchLog),
                                  continue;
                              (_) -> continue
                          end),
            ok
    end,
    merge_other(T),
    dets:close(achievement_log),
    dets:close(achievement_log_first),
    ok.

merge_other([]) -> ok;
merge_other([PlatformZone | T]) ->
    {ok, DetsFlag} = util:string_to_term("achievement_log_"
                                             ++ PlatformZone),
    dets:open_file(DetsFlag,
                   [{file,
                     "../dets/" ++ PlatformZone ++ "/achievement_log.dets"},
                    {type, set},
                    {keypos, #achievement_log.id}]),
    case dets:first(DetsFlag) of
        '$end_of_table' ->
            logger:info("~ts 目录下没有需要合并的成就数据",
                        [PlatformZone],
                        merge_dets_achievement,
                        65);
        _ ->
            dets:traverse(DetsFlag,
                          fun (AchLog = #achievement_log{}) ->
                                  handle_compare(AchLog),
                                  continue;
                              (_) -> continue
                          end),
            ok
    end,
    dets:close(DetsFlag),
    merge_other(T).

handle_compare(AchLog1 = #achievement_log{id = Id,
                                          accept = Accept1,
                                          finish = Finish1}) ->
    case ets:lookup(achievement_log, Id) of
        [AchLog2 = #achievement_log{accept = Accept2,
                                    finish = Finish2}] ->
            ets:insert(achievement_log,
                       AchLog2#achievement_log{accept = Accept1 + Accept2,
                                               finish = Finish1 + Finish2}),
            dets:insert(achievement_log,
                        AchLog2#achievement_log{accept = Accept1 + Accept2,
                                                finish = Finish1 + Finish2});
        [] ->
            ets:insert(achievement_log, AchLog1),
            dets:insert(achievement_log, AchLog1)
    end.

