-file("src/merge/merge_dets_friend_zone.erl", 1).

-module(merge_dets_friend_zone).

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

-file("src/merge/merge_dets_friend_zone.erl", 13).

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

-file("src/merge/merge_dets_friend_zone.erl", 14).

-file("inc/friend.hrl", 1).

-record(friendship,
        {owner = {1, "", 0} ::
             {pos_integer(), string(), non_neg_integer()},
         id = {1, "", 0} ::
             {pos_integer(), string(), non_neg_integer()},
         type = 0 :: non_neg_integer(),
         intimacy = 0 :: non_neg_integer(),
         ct = 0 :: non_neg_integer()}).

-record(friend_role,
        {id = {1, "", 0} ::
             {pos_integer(), string(), non_neg_integer()},
         ver = 6,
         name = "" :: string(),
         sex = 1 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         lev = 1 :: non_neg_integer(),
         break_times = 0,
         fc = 0 :: non_neg_integer(),
         face = 1 :: pos_integer(),
         intimacy = 0 :: non_neg_integer(),
         glamor = 0 :: non_neg_integer(),
         signature = "" :: string(),
         city = "" :: string(),
         online = 0 :: 0 | 1,
         online_time = 0 :: non_neg_integer(),
         total_fc = 0 :: non_neg_integer(),
         guild = "" :: string(),
         qualifying,
         arena,
         pet,
         guard,
         skill_prac = 0,
         achievement = 0,
         received_num = 0,
         given_num = 0,
         update_time = 0,
         looks = [] :: list(),
         offline_push = 0,
         glory_max_id = 0,
         glory_time = 0}).

-record(friend_request,
        {owner = {1, "", 0} ::
             {pos_integer(), string(), non_neg_integer()},
         id = {1, "", 0} ::
             {pos_integer(), string(), non_neg_integer()},
         name = "" :: string(),
         sex = 1 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         lev = 1 :: non_neg_integer(),
         fc = 0 :: non_neg_integer(),
         total_fc = 0 :: non_neg_integer(),
         face = 1 :: pos_integer(),
         ct = 0 :: non_neg_integer()}).

-record(friend_present,
        {ver = 0,
         giver = {0, "", 0},
         recipient = {0, "", 0},
         time = 0 :: integer(),
         num = 0 :: integer()}).

-record(m_friend,
        {ver = 2,
         signature = "星辰奇缘真好玩！" :: string(),
         num = 0 :: non_neg_integer(),
         fans = 0 :: non_neg_integer(),
         log_next_id = 1 :: pos_integer(),
         flower = 0 :: non_neg_integer(),
         intimacy = 0 :: non_neg_integer(),
         glamor = 0 :: non_neg_integer(),
         city = "" :: string(),
         set_num = 0 :: non_neg_integer(),
         cond_city = 1 :: 0..1,
         cond_sex = 1 :: 0..1,
         cond_fc = 1 :: 0..1,
         received_presents = [] :: [],
         given_presents = [] :: [],
         received_num = 0 :: non_neg_integer(),
         given_num = 0 :: non_neg_integer(),
         popularity_rewarded = [] :: list(),
         offline_push = 0}).

-record(friend_zone,
        {ver = 14 :: non_neg_integer(),
         id = {1, "", 0} ::
             {pos_integer(), string(), non_neg_integer()},
         name = "" :: string(),
         sex = 1 :: non_neg_integer(),
         classes = 1 :: non_neg_integer(),
         lev = 1 :: non_neg_integer(),
         photo = [] :: non_neg_integer(),
         birth = "" :: non_neg_integer(),
         constellation = 0 :: non_neg_integer(),
         abo = 0 :: non_neg_integer(),
         signature = "" :: string(),
         spouse_id = {0, "", 0} :: tuple(),
         spouse_name = "" :: string(),
         region = "" :: string(),
         online_time = 0 :: non_neg_integer(),
         guild = "" :: string(),
         subscribed = [],
         fans = [],
         visitors = [],
         visited = 0 :: non_neg_integer(),
         tags = [],
         liked = 0 :: non_neg_integer(),
         likes = [],
         privacy = 0 :: 0 | 1,
         prize_num = 0 :: non_neg_integer(),
         own_trends = [] :: [non_neg_integer()],
         subscribed_trends = [] :: [non_neg_integer()],
         photo_auditing = 0 :: non_neg_integer(),
         photo_audited = 0 :: non_neg_integer(),
         present_num = 0 :: non_neg_integer(),
         name_used = "" :: string(),
         week_liked = 0 :: non_neg_integer(),
         last_liked = 0 :: non_neg_integer(),
         honor_id = 0 :: non_neg_integer(),
         lover_name = "" :: string(),
         theme = 401 :: non_neg_integer(),
         badges = [] :: list(),
         photo_frame = 0 :: non_neg_integer(),
         teacher_name = "" :: string(),
         own_trend_num = 0,
         city = "" :: string(),
         is_shared_region = 1 :: 0 | 1,
         sworn_name = "" :: string(),
         show_honor = 0 :: non_neg_integer(),
         pre_honor_id = 0 :: non_neg_integer(),
         privacy_zone = 0 :: 0 | 1,
         privacy_moments = 0 :: 0 | 1}).

-record(friend_trend,
        {ver = 0 :: non_neg_integer(),
         zone_id = {0, "", 0},
         rid = {0, "", 0},
         name = "" :: string(),
         sex = 1 :: non_neg_integer(),
         classes = 1 :: non_neg_integer(),
         photo = 1 :: pos_integer(),
         id = 0 :: non_neg_integer(),
         type = 0 :: 0 | 1,
         content = "" :: string(),
         liked = 0 :: non_neg_integer(),
         likes = [],
         presents = [],
         ctime = 0 :: non_neg_integer()}).

-record(friend_visitor,
        {id = {0, "", 0},
         ver = 0,
         name = "" :: string(),
         sex = 0 :: 0 | 1,
         classes = 0 :: non_neg_integer(),
         photo = 0 :: non_neg_integer(),
         time = 0 :: non_neg_integer()}).

-record(friend_subscription,
        {id = {0, "", 0},
         ver = 0,
         name = "" :: string(),
         sex = 0 :: 0 | 1,
         classes = 0 :: non_neg_integer(),
         photo = 0 :: non_neg_integer(),
         time = 0 :: non_neg_integer(),
         cared = 0 :: non_neg_integer(),
         interacted = 0 :: non_neg_integer()}).

-record(friend_zone_rank,
        {id = {0, "", 0},
         ver = 0,
         name = "" :: string(),
         sex = 0 :: 0 | 1,
         classes = 0 :: non_neg_integer(),
         photo = 0 :: non_neg_integer(),
         liked = 0 :: non_neg_integer(),
         prize_num = 0 :: non_neg_integer()}).

-record(friend_zone_rank_week,
        {id = {0, "", 0},
         ver = 0,
         name = "" :: string(),
         sex = 0 :: 0 | 1,
         classes = 0 :: non_neg_integer(),
         photo = 0 :: non_neg_integer(),
         liked = 0 :: non_neg_integer(),
         last_liked = 0 :: non_neg_integer(),
         prize_num = 0 :: non_neg_integer()}).

-record(friend_like,
        {id = {0, "", 0},
         ver = 0,
         name = "" :: string(),
         sex = 0 :: 0 | 1,
         classes = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         got_prize = 0 :: 0 | 1,
         time = 0 :: non_neg_integer()}).

-record(friend_zone_photo,
        {id = 1,
         ver = 0,
         uploaded = 0,
         auditing = 0,
         audited = 0,
         default = 0}).

-record(friend_circle,
        {ver = 3 :: non_neg_integer(),
         id = {1, "", 0} ::
             {pos_integer(), string(), non_neg_integer()},
         name = "" :: string(),
         sex = 1 :: non_neg_integer(),
         classes = 1 :: non_neg_integer(),
         lev = 1 :: non_neg_integer(),
         region = "" :: string(),
         city = "" :: string(),
         moments = [] :: list(),
         subscriptions = [] :: list(),
         block = [] :: list(),
         unsubscribed = [] :: list(),
         notifications = [] :: list(),
         is_shared_region = 1 :: 0 | 1,
         unread_num = 0 :: non_neg_integer(),
         privacy_moments = 0 :: 0 | 1}).

-record(friend_moment,
        {ver = 1 :: non_neg_integer(),
         id = {0, "", 0},
         rid = {0, "", 0},
         name = "" :: string(),
         sex = 1 :: non_neg_integer(),
         classes = 1 :: non_neg_integer(),
         content = "" :: string(),
         liked = 0 :: non_neg_integer(),
         likes = [],
         mentions = [],
         ctime = 0 :: non_neg_integer(),
         type = 1}).

-record(friend_comment,
        {ver = 0 :: non_neg_integer(),
         id = {0, "", 0},
         moment_id = {0, "", 0},
         rid = {0, "", 0},
         name = "" :: string(),
         sex = 1 :: non_neg_integer(),
         classes = 1 :: non_neg_integer(),
         msg = "" :: string(),
         mentions = [],
         ctime = 0 :: non_neg_integer()}).

-record(friend_moment_like,
        {ver = 0 :: non_neg_integer(),
         moment_id = {0, "", 0},
         rid = {0, "", 0},
         name = "" :: string(),
         sex = 1 :: non_neg_integer(),
         classes = 1 :: non_neg_integer(),
         ctime = 0 :: non_neg_integer()}).

-record(friend_moment_photo,
        {id = 1,
         moment_id = {0, "", 0},
         rid = {0, "", 0},
         ver = 0,
         uploaded = 0,
         auditing = 1,
         audited = 0}).

-record(friend_circle_report,
        {id = {{0, "", 0}, 0, 0},
         rid = {0, "", 0},
         moment_id = {0, "", 0},
         spec_id = 0,
         type = 0,
         name = "",
         lev = 1,
         time = 0,
         content = "",
         reporter_id = {0, "", 0},
         reporter_name = "",
         reporter_lev = 0}).

-record(friend_circle_region,
        {ver = 0 :: non_neg_integer(),
         region = "" :: string(),
         city = "" :: string(),
         moments = [] :: list()}).

-record(friend_recall,
        {role_id = {0, "", 0},
         role_name = "",
         id = 0 :: non_neg_integer(),
         activity = 0 :: non_neg_integer(),
         status = 0 :: non_neg_integer(),
         role_id_bind = {0, "", 0},
         role_name_bind = "",
         lists = [] :: list(),
         rewards = [] :: list(),
         lists_time = [] :: list(),
         time_return = 0 :: non_neg_integer()}).

-record(friend_recalled,
        {role_id = {0, "", 0},
         status = 0 :: non_neg_integer(),
         bind = 0 :: non_neg_integer(),
         time_return = 0 :: non_neg_integer(),
         time = 0 :: non_neg_integer(),
         activity = 0 :: non_neg_integer(),
         rewards = [] :: list(),
         lists = [] :: list(),
         recall_list = [] :: list(),
         role_id_recall = {0, "", 0},
         role_name_recall = "" :: string(),
         login = 0 :: non_neg_integer(),
         activity_id = 0 :: non_neg_integer()}).

-record(friend_group,
        {ver = 0,
         id = {0, "", 0},
         name = "",
         content = "",
         owner_id = {0, "", 0},
         owner_name = "",
         owner_classes = 0,
         owner_sex = 0,
         owner_lev = 1,
         owner_fc = 0,
         owner_face = 1,
         time = 0,
         members = [],
         trends = [],
         historys = [],
         invites = []}).

-record(friend_group_role,
        {ver = 1,
         id = {0, "", 0},
         groups = [],
         inviteds = [],
         create = 0,
         join = 0,
         unlock = 0,
         applys = []}).

-record(friend_group_trend,
        {type = 0, string1 = "", string2 = "", time = 0}).

-record(friend_group_chat,
        {role_id = 0, msgs = "", time = 0}).

-record(friend_group_data,
        {group_id = {0, "", 0},
         group_name = "",
         group_content = "",
         owner_id = {0, "", 0},
         owner_name = "",
         owner_classes = 0,
         owner_sex = 0,
         time = 0}).

-record(friend_group_role_data,
        {role_id = {0, "", 0},
         role_name = "",
         role_classes = 0,
         role_lev = 0,
         role_sex = 0,
         online = 0,
         online_time = 0,
         post = 0,
         notice = 1,
         pid = undefined}).

-record(friend_moment_wish_audit,
        {ver = 1,
         moment_id = {0, "", 0},
         role_id = {0, "", 0},
         audit_time = 0,
         reward_title = 0,
         camp_id = 0}).

-file("src/merge/merge_dets_friend_zone.erl", 15).

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
    dets:open_file(friend_zone,
                   [{file, "../dets/friend_zone.dets"},
                    {type, set},
                    {keypos, #friend_zone.id}]),
    dets:open_file(friend_zone_ids,
                   [{file, "../dets/friend_zone_ids.dets"}, {keypos, 1}]),
    dets:open_file(friend_trend,
                   [{file, "../dets/friend_trend.dets"},
                    {keypos, #friend_trend.id}]),
    dets:open_file(friend_zone_rank,
                   [{file, "../dets/friend_zone_rank.dets"},
                    {keypos, #friend_zone_rank.id}]),
    dets:open_file(friend_zone_rank_week,
                   [{file, "../dets/friend_zone_rank_week.dets"},
                    {keypos, #friend_zone_rank_week.id}]),
    dets:delete_all_objects(friend_zone),
    dets:delete_all_objects(friend_zone_ids),
    dets:delete_all_objects(friend_trend),
    dets:delete_all_objects(friend_zone_rank),
    dets:delete_all_objects(friend_zone_rank_week),
    dets:open_file(friend_zone_first,
                   [{file, "../dets/" ++ First ++ "/friend_zone.dets"},
                    {type, set},
                    {keypos, #friend_zone.id}]),
    dets:open_file(friend_zone_ids_first,
                   [{file, "../dets/" ++ First ++ "/friend_zone_ids.dets"},
                    {type, set},
                    {keypos, 1}]),
    dets:open_file(friend_trend_first,
                   [{file, "../dets/" ++ First ++ "/friend_trend.dets"},
                    {keypos, #friend_trend.id}]),
    dets:open_file(friend_zone_rank_first,
                   [{file,
                     "../dets/" ++ First ++ "/friend_zone_rank.dets"},
                    {keypos, #friend_zone_rank.id}]),
    dets:open_file(friend_zone_rank_week_first,
                   [{file,
                     "../dets/" ++ First ++ "/friend_zone_rank_week.dets"},
                    {keypos, #friend_zone_rank_week.id}]),
    ets:new(friend_zone_rank,
            [set,
             named_table,
             public,
             {keypos, #friend_zone_rank.id}]),
    ets:new(friend_zone_rank_week,
            [set,
             named_table,
             public,
             {keypos, #friend_zone_rank_week.id}]),
    case dets:first(friend_zone_first) of
        '$end_of_table' ->
            logger:info("~ts 目录下没有需要合并的空间数据",
                        [First],
                        merge_dets_friend_zone,
                        52);
        _ ->
            dets:traverse(friend_zone_first,
                          fun (Z = #friend_zone{}) ->
                                  dets:insert(friend_zone, Z),
                                  continue;
                              (_) -> continue
                          end),
            ok
    end,
    case dets:first(friend_zone_ids_first) of
        '$end_of_table' ->
            logger:info("~ts 目录下没有需要合并的空间id数据",
                        [First],
                        merge_dets_friend_zone,
                        66);
        _ ->
            dets:traverse(friend_zone_ids_first,
                          fun ({K, V}) ->
                                  dets:insert(friend_zone_ids, {K, V}),
                                  continue;
                              (_) -> continue
                          end),
            ok
    end,
    case dets:first(friend_trend_first) of
        '$end_of_table' ->
            logger:info("~ts 目录下没有需要合并的空间动态数据",
                        [First],
                        merge_dets_friend_zone,
                        80);
        _ ->
            dets:traverse(friend_trend_first,
                          fun (Trend = #friend_trend{}) ->
                                  dets:insert(friend_trend, Trend),
                                  continue;
                              (_) -> continue
                          end),
            ok
    end,
    case dets:first(friend_zone_rank_first) of
        '$end_of_table' ->
            logger:info("~ts 目录下没有需要合并的空间排行数据",
                        [First],
                        merge_dets_friend_zone,
                        95);
        _ ->
            dets:traverse(friend_zone_rank_first,
                          fun (Rk = #friend_zone_rank{}) ->
                                  ets:insert(friend_zone_rank, Rk),
                                  continue;
                              (_) -> continue
                          end),
            ok
    end,
    case dets:first(friend_zone_rank_week_first) of
        '$end_of_table' ->
            logger:info("~ts 目录下没有需要合并的空间排行数据",
                        [First],
                        merge_dets_friend_zone,
                        110);
        _ ->
            dets:traverse(friend_zone_rank_week_first,
                          fun (Rkw = #friend_zone_rank_week{}) ->
                                  ets:insert(friend_zone_rank_week, Rkw),
                                  continue;
                              (_) -> continue
                          end),
            ok
    end,
    TrendId = case dets:lookup(friend_zone_ids,
                               friend_trend)
                  of
                  [{friend_trend, Tid}] -> Tid;
                  _ ->
                      logger:info("~ts 目录下没有空间动态自增id数据",
                                  [First],
                                  merge_dets_friend_zone,
                                  128),
                      1
              end,
    Now = date:unixtime(),
    merge_other(T, TrendId, Now),
    dets:close(friend_zone),
    dets:close(friend_trend),
    dets:close(friend_zone_ids),
    dets:close(friend_zone_rank),
    dets:close(friend_zone_rank_week),
    dets:close(friend_zone_first),
    dets:close(friend_trend_first),
    dets:close(friend_zone_ids_first),
    dets:close(friend_zone_rank_first),
    dets:close(friend_zone_rank_week_first),
    ok.

merge_other([], TrendId, _) ->
    dets:insert(friend_zone_ids, {friend_trend, TrendId}),
    ets:to_dets(friend_zone_rank, friend_zone_rank),
    ets:to_dets(friend_zone_rank_week,
                friend_zone_rank_week),
    ok;
merge_other([PlatformZone | T], StartId, Now) ->
    {ok, DetsFlag} = util:string_to_term("friend_zone_" ++
                                             PlatformZone),
    dets:open_file(DetsFlag,
                   [{file,
                     "../dets/" ++ PlatformZone ++ "/friend_zone.dets"},
                    {type, set},
                    {keypos, #friend_zone.id}]),
    case dets:first(DetsFlag) of
        '$end_of_table' ->
            logger:info("~ts 目录下没有需要合并的空间数据",
                        [PlatformZone],
                        merge_dets_friend_zone,
                        157);
        _ ->
            dets:traverse(DetsFlag,
                          fun (Z = #friend_zone{own_trends = OwnTrends,
                                                subscribed_trends = Subs}) ->
                                  Z1 = Z#friend_zone{own_trends =
                                                         [StartId + I
                                                          || I <- OwnTrends],
                                                     subscribed_trends =
                                                         [StartId + I
                                                          || I <- Subs]},
                                  dets:insert(friend_zone, Z1),
                                  continue;
                              (_) -> continue
                          end),
            ok
    end,
    dets:close(DetsFlag),
    {ok, DetsFlag2} = util:string_to_term("friend_trend_" ++
                                              PlatformZone),
    dets:open_file(DetsFlag2,
                   [{file,
                     "../dets/" ++ PlatformZone ++ "/friend_trend.dets"},
                    {type, set},
                    {keypos, #friend_trend.id}]),
    case dets:first(DetsFlag2) of
        '$end_of_table' ->
            logger:info("~ts 目录下没有需要合并的空间动态数据",
                        [PlatformZone],
                        merge_dets_friend_zone,
                        176);
        _ ->
            dets:traverse(DetsFlag2,
                          fun (Trend = #friend_trend{id = TrendId}) ->
                                  Trend1 = Trend#friend_trend{id =
                                                                  TrendId +
                                                                      StartId},
                                  dets:insert(friend_trend, Trend1),
                                  continue;
                              (_) -> continue
                          end),
            ok
    end,
    dets:close(DetsFlag2),
    {ok, DetsFlagRank} =
        util:string_to_term("friend_zone_rank_" ++
                                PlatformZone),
    dets:open_file(DetsFlagRank,
                   [{file,
                     "../dets/" ++ PlatformZone ++ "/friend_zone_rank.dets"},
                    {type, set},
                    {keypos, #friend_zone_rank.id}]),
    case dets:first(DetsFlagRank) of
        '$end_of_table' ->
            logger:info("~ts 目录下没有需要合并的空间排行数据",
                        [PlatformZone],
                        merge_dets_friend_zone,
                        196);
        _ ->
            dets:traverse(DetsFlagRank,
                          fun (Rk = #friend_zone_rank{}) ->
                                  ets:insert(friend_zone_rank, Rk),
                                  continue;
                              (_) -> continue
                          end),
            ok
    end,
    L = ets:tab2list(friend_zone_rank),
    NewL = util:keys_sort([#friend_zone_rank.liked], L),
    LastL = lists:sublist(NewL, 100),
    ets:delete_all_objects(friend_zone_rank),
    ets:insert(friend_zone_rank, LastL),
    dets:close(DetsFlagRank),
    {ok, DetsFlagRankWeek} =
        util:string_to_term("friend_zone_rank_" ++
                                PlatformZone),
    dets:open_file(DetsFlagRankWeek,
                   [{file,
                     "../dets/" ++
                         PlatformZone ++ "/friend_zone_rank_week.dets"},
                    {type, set},
                    {keypos, #friend_zone_rank_week.id}]),
    case dets:first(DetsFlagRankWeek) of
        '$end_of_table' ->
            logger:info("~ts 目录下没有需要合并的空间排行数据",
                        [PlatformZone],
                        merge_dets_friend_zone,
                        220);
        _ ->
            dets:traverse(DetsFlagRankWeek,
                          fun (Rkw = #friend_zone_rank_week{}) ->
                                  ets:insert(friend_zone_rank_week, Rkw),
                                  continue;
                              (_) -> continue
                          end),
            ok
    end,
    LW = [R
          || R = #friend_zone_rank_week{last_liked = Last}
                 <- ets:tab2list(friend_zone_rank_week),
             date:is_same_week(Now, Last)],
    NewLW = util:keys_sort([#friend_zone_rank_week.liked],
                           LW),
    LastLW = lists:sublist(NewLW, 100),
    ets:delete_all_objects(friend_zone_rank_week),
    ets:insert(friend_zone_rank_week, LastLW),
    dets:close(DetsFlagRankWeek),
    {ok, DetsFlag3} = util:string_to_term("friend_zone_ids_"
                                              ++ PlatformZone),
    dets:open_file(DetsFlag3,
                   [{file,
                     "../dets/" ++ PlatformZone ++ "/friend_zone_ids.dets"},
                    {type, set},
                    {keypos, 1}]),
    NewStartId = case dets:lookup(DetsFlag3, friend_trend)
                     of
                     [{friend_trend, MaxId}] -> StartId + MaxId;
                     _ ->
                         logger:info("~ts 目录下没有空间动态自增id数据",
                                     [PlatformZone],
                                     merge_dets_friend_zone,
                                     247),
                         StartId
                 end,
    case dets:first(DetsFlag3) of
        '$end_of_table' ->
            logger:info("~ts 目录下没有需要合并的自增id数据",
                        [PlatformZone],
                        merge_dets_friend_zone,
                        252);
        _ ->
            dets:traverse(DetsFlag3,
                          fun ({K, V}) when K =/= friend_trend ->
                                  case dets:lookup(friend_zone_ids, K) of
                                      [{_, OldV}] when OldV >= V -> ok;
                                      _ -> dets:insert(friend_zone_ids, {K, V})
                                  end,
                                  continue;
                              (_) -> continue
                          end),
            ok
    end,
    dets:close(DetsFlag3),
    merge_other(T, NewStartId, Now).

