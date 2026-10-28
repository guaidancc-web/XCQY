-file("src/mod/rank/rank_reward.erl", 1).

-module(rank_reward).

-export([reward/2]).

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

-file("src/mod/rank/rank_reward.erl", 13).

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

-file("src/mod/rank/rank_reward.erl", 14).

-file("inc/honor.hrl", 1).

-record(m_honor,
        {ver = 3,
         use_id = 0,
         last_id = 0,
         r_list = [] :: list(),
         pre_id = 0,
         r_pre_list = [] :: list(),
         pre_reward_list = [] :: list()}).

-record(honor,
        {id = 0 :: non_neg_integer(),
         end_time = 0 :: non_neg_integer()}).

-record(pre_honor,
        {pre_id = 0 :: non_neg_integer(),
         end_time = 0 :: non_neg_integer()}).

-record(honor_info,
        {key :: undefined | atom(),
         list = [] :: list(),
         end_time = 0 :: non_neg_integer()}).

-record(honor_base,
        {id = 0 :: non_neg_integer(),
         name = "" :: list(),
         type = 0 :: non_neg_integer(),
         mode_type = 0 :: non_neg_integer(),
         show_type = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         is_cast = 0,
         sex = 2 :: non_neg_integer(),
         attr_list = [] :: list(),
         is_can_pre = 0 :: non_neg_integer(),
         collect_val = 0 :: non_neg_integer(),
         color = 12 :: non_neg_integer()}).

-record(pre_honor_base,
        {pre_id = 0 :: non_neg_integer(),
         pre_name = "" :: list(),
         is_cast = 0,
         items = [] :: list(),
         loss_items = [] :: list()}).

-file("src/mod/rank/rank_reward.erl", 15).

reward(RankType, RankList) ->
    reward([1, 2], RankType, RankList).

reward([], _RankType, _RankList) -> ok;
reward([RewardType | T], RankType, RankList) ->
    Limit = limit_type(RewardType, RankType),
    case rank_data:get_reward({RankType, RewardType}) of
        {{Days}, RewardData} when Limit == true ->
            case check_days(RewardType, Days) of
                true ->
                    logger:info("发放[~w]类型排行榜, 发放类型[~w], 发放天数[~w]",
                                [RankType, RewardType, Days],
                                rank_reward,
                                28),
                    do_reward(RankType, RewardType, RewardData, RankList);
                false -> skip
            end;
        _ -> skip
    end,
    case rank_data:get_honor({RankType, RewardType}) of
        {{Days2}, RewardData2} when Limit ->
            case check_days(RewardType, Days2) of
                true ->
                    logger:info("发放[~w]类型排行榜称号, 发放类型[~w], 发放天数[~w]",
                                [RankType, RewardType, Days2],
                                rank_reward,
                                39),
                    do_reward_honor(RankType,
                                    RewardType,
                                    RewardData2,
                                    RankList);
                false -> skip
            end;
        _ -> skip
    end,
    reward(T, RankType, RankList).

limit_type(_RewardType = 1, _RankType = 20) ->
    case env:srv_open_time() <
             date:datetime_to_seconds({{2017, 7, 17}, {9, 0, 0}})
        of
        true -> true;
        _ -> false
    end;
limit_type(_, _) -> true.

check_days(2, Days) ->
    Today = date:day_of_the_week(date()),
    lists:member(Today, Days);
check_days(1, Days) ->
    OpenDay = date:open_srv_day(),
    lists:member(OpenDay, Days);
check_days(_, _) -> false.

do_reward(_RankType, _RewardType, [], _RankList) -> ok;
do_reward(31, _RewardType, [], _RankList) -> ok;
do_reward(RankType, RewardType,
          [#{s_idx := SIdx, e_idx := EIdx, items := Items,
             title := Title, content := Content}
           | T],
          RankList) ->
    GetList = get_index(SIdx, EIdx, RankList),
    case Items of
        [_ | _] ->
            lists:foreach(fun (#rank_rc{id = RoleId,
                                        name = Name}) ->
                                  logger:info("给[~ts]发放排行榜奖励[~ts]",
                                              [Name, Content],
                                              rank_reward,
                                              82),
                                  mail:send(RoleId,
                                            #{items => Items, title => Title,
                                              content => Content})
                          end,
                          GetList);
        _ -> skip
    end,
    do_reward(RankType, RewardType, T, RankList).

do_reward_honor(_RankType, _RewardType, [],
                _RankList) ->
    ok;
do_reward_honor(RankType, RewardType,
                [#{s_idx := SIdx, e_idx := EIdx, honor_id := HonorId}
                 | T],
                RankList) ->
    GetList = get_index(SIdx, EIdx, RankList),
    case GetList of
        [_ | _] ->
            case honor_data:get(HonorId) of
                #honor_base{} ->
                    HonorRoleList = [{{Rid, P, Z}, HonorId}
                                     || #rank_rc{role_id = Rid, platform = P,
                                                 zone_id = Z}
                                            <- GetList],
                    honor_mgr:replace(list_to_atom(lists:concat(["rank_honor_",
                                                                 RankType])),
                                      HonorRoleList,
                                      0),
                    do_reward_honor(RankType, RewardType, T, RankList);
                _ ->
                    logger:error("错误的称号数据无法发放[~w]",
                                 [HonorId],
                                 rank_reward,
                                 109),
                    do_reward_honor(RankType, RewardType, T, RankList)
            end;
        _ -> do_reward_honor(RankType, RewardType, T, RankList)
    end.

get_index(SIdx, EIdx, RankList)
    when SIdx =< EIdx andalso SIdx >= 1 ->
    get_index(SIdx, EIdx, 1, RankList, []);
get_index(_SIdx, _EIdx, _RankList) -> [].

get_index(_SIdx, _EIdx, _Idx, [], GetList) ->
    lists:reverse(GetList);
get_index(_SIdx, EIdx, Idx, _RankList, GetList)
    when Idx > EIdx ->
    lists:reverse(GetList);
get_index(SIdx, EIdx, Idx, [RankRc | T], GetList)
    when Idx >= SIdx andalso Idx =< EIdx ->
    get_index(SIdx, EIdx, Idx + 1, T, [RankRc | GetList]);
get_index(SIdx, EIdx, Idx, [_ | T], GetList) ->
    get_index(SIdx, EIdx, Idx + 1, T, GetList).

