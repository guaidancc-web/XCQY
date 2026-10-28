-file("src/merge/merge_dets_world_boss.erl", 1).

-module(merge_dets_world_boss).

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

-file("src/merge/merge_dets_world_boss.erl", 12).

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

-file("src/merge/merge_dets_world_boss.erl", 13).

-file("inc/world_boss.hrl", 1).

-record(world_boss,
        {ver = 1 :: non_neg_integer(),
         id = 0 :: non_neg_integer(),
         first_killer = [],
         round_first = [],
         round_killer = [],
         killer_rank = [],
         last_killed = 0 :: non_neg_integer(),
         last_respawn = 0 :: non_neg_integer(),
         total_killed = 0 :: non_neg_integer(),
         is_rewarded = false :: true | false,
         is_rewarded_first = false :: true | false,
         map_id = 0 :: non_neg_integer(),
         x = 0 :: non_neg_integer(),
         y = 0 :: non_neg_integer(),
         recent_killer = []}).

-record(world_boss_killer,
        {ver = 0,
         id = {0, "", 0},
         name = "" :: string(),
         classes = 0 :: non_neg_integer(),
         sex = 0 :: non_neg_integer(),
         looks = [],
         finished = 0 :: non_neg_integer(),
         round = 0 :: non_neg_integer(),
         is_leader = 0 :: non_neg_integer()}).

-record(world_boss_winner,
        {ver = 0,
         id = {0, "", 0},
         name = "" :: string(),
         rewarded = 0 :: non_neg_integer(),
         last_rewarded = 0 :: non_neg_integer()}).

-file("src/merge/merge_dets_world_boss.erl", 14).

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

merge([FirstDets | T]) ->
    dets:open_file(world_boss,
                   [{file, "../dets/world_boss.dets"},
                    {type, set},
                    {keypos, #world_boss.id}]),
    dets:delete_all_objects(world_boss),
    dets:open_file(world_boss_first,
                   [{file, "../dets/" ++ FirstDets ++ "/world_boss.dets"},
                    {type, set},
                    {keypos, #world_boss.id}]),
    ets:new(world_boss,
            [named_table, public, set, {keypos, #world_boss.id}]),
    case dets:first(world_boss_first) of
        '$end_of_table' ->
            logger:info("~ts 目录下没有需要合并的世界boss数据",
                        [FirstDets],
                        merge_dets_world_boss,
                        38);
        _ ->
            dets:traverse(world_boss_first,
                          fun (Data = #world_boss{}) ->
                                  NewData = Data#world_boss{killer_rank = [],
                                                            recent_killer = []},
                                  ets:insert(world_boss, NewData),
                                  dets:insert(world_boss, NewData),
                                  continue
                          end),
            ok
    end,
    merge_other(T),
    dets:close(world_boss),
    dets:close(world_boss_first),
    ok.

merge_other([]) -> ok;
merge_other([PlatformZone | T]) ->
    {ok, DetsFlag} = util:string_to_term("world_boss" ++
                                             PlatformZone),
    dets:open_file(DetsFlag,
                   [{file,
                     "../dets/" ++ PlatformZone ++ "/world_boss.dets"},
                    {type, set},
                    {keypos, #world_boss.id}]),
    case dets:first(DetsFlag) of
        '$end_of_table' ->
            logger:info("~ts 目录下没有需要合并的世界boss数据",
                        [PlatformZone],
                        merge_dets_world_boss,
                        64);
        _ ->
            dets:traverse(DetsFlag,
                          fun (Data = #world_boss{id = Id}) ->
                                  case ets:lookup(world_boss, Id) of
                                      [] ->
                                          NewData = Data#world_boss{killer_rank
                                                                        = [],
                                                                    recent_killer
                                                                        = []},
                                          ets:insert(world_boss, NewData),
                                          dets:insert(world_boss, NewData);
                                      _ -> ignore
                                  end,
                                  continue
                          end),
            ok
    end,
    dets:close(DetsFlag),
    merge_other(T).

