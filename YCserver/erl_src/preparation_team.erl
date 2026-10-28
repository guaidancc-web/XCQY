-file("src/mod/preparation/preparation_team.erl", 1).

-module(preparation_team).

-export([init_cache/0,
         lookup/1,
         update/1,
         delete/1,
         init/1,
         get_mates/1,
         list/1,
         pair/2]).

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

-file("src/mod/preparation/preparation_team.erl", 20).

-file("inc/preparation.hrl", 1).

-record(m_preparation,
        {ver = 0,
         pid :: undefined | pid(),
         id = 0 :: non_neg_integer(),
         status = 0 :: non_neg_integer()}).

-record(preparation_room,
        {ver = 0,
         id = 0 :: non_neg_integer(),
         pid :: undefined | pid(),
         map_id = 0 :: non_neg_integer(),
         map_pid :: undefined | pid(),
         matching = [] :: list(),
         num = 1,
         matched = 0 :: non_neg_integer(),
         match_ref :: undefined | reference(),
         mode = 1,
         is_open = true :: boolean()}).

-record(preparation_team,
        {ids = [] :: list(),
         origin_ids = [] :: list(),
         num = 1 :: non_neg_integer(),
         sum_lev = 0 :: non_neg_integer(),
         max_lev = 0 :: non_neg_integer(),
         min_lev = 0 :: non_neg_integer(),
         tried_match = 0 :: non_neg_integer(),
         room_id = 0 :: non_neg_integer(),
         order = [] :: list(),
         classes = [] :: list()}).

-record(preparation_role,
        {ver = 0,
         id = {0, "", 0},
         name = "",
         pid :: undefined | pid(),
         face_id = 0 :: non_neg_integer(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         lev_break_times = 0 :: non_neg_integer(),
         status = 0 :: non_neg_integer(),
         looks = [] :: list(),
         fc = 0 :: non_neg_integer(),
         room_id = 0 :: non_neg_integer(),
         s_ride = 0,
         preparation_pid :: undefined | pid(),
         matched = 0 :: non_neg_integer(),
         formation_id = 1,
         formation_lev = 1,
         team_id = [] :: list(),
         partner = [] :: list(),
         group = 1 :: non_neg_integer()}).

-record(preparation_show_role,
        {id = {0, "", 0},
         name = "",
         face_id = 0 :: non_neg_integer(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         group = 1 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         lev_break_times = 0 :: non_neg_integer(),
         looks = [] :: list()}).

-file("src/mod/preparation/preparation_team.erl", 21).

init_cache() ->
    ets:new(preparation_team,
            [set,
             named_table,
             public,
             {keypos, #preparation_team.ids}]).

lookup(Id) -> ets:lookup(preparation_team, Id).

update(R = #preparation_team{}) ->
    ets:insert(preparation_team, R).

delete(#preparation_team{ids = Id}) -> delete(Id);
delete(Id) -> ets:delete(preparation_team, Id).

init(TeamMates) ->
    Ids = lists:sort([Id
                      || #preparation_role{id = Id} <- TeamMates]),
    Classes = [C
               || #preparation_role{classes = C} <- TeamMates],
    SumLev = lists:sum([Lv
                        || #preparation_role{lev = Lv} <- TeamMates]),
    MaxLev = lists:max([Lv
                        || #preparation_role{lev = Lv} <- TeamMates]),
    MinLev = lists:min([Lv
                        || #preparation_role{lev = Lv} <- TeamMates]),
    MaxLev = lists:max([Lv
                        || #preparation_role{lev = Lv} <- TeamMates]),
    #preparation_team{ids = Ids, origin_ids = [Ids],
                      num = length(Ids), sum_lev = SumLev, max_lev = MaxLev,
                      min_lev = MinLev, classes = Classes}.

get_mates([]) -> [];
get_mates([Id | T]) ->
    case preparation_role:lookup(Id) of
        [R = #preparation_role{}] -> [R | get_mates(T)];
        _ -> get_mates(T)
    end.

list([]) -> [];
list([H | T]) ->
    case lookup(H) of
        [Team = #preparation_team{}] -> [Team | list(T)];
        _ -> list(T)
    end.

pair(Matching, Cfg) ->
    L = list(Matching),
    L1 = util:keys_sort([#preparation_team.num,
                         #preparation_team.tried_match],
                        L),
    {Matched, UnMatched} = do_pair(L1, Cfg, [], []),
    UnMatchedIds = acc_tried_matched(UnMatched),
    matched_action(Matched, UnMatchedIds, Cfg).

do_pair([], _, Matched, UnMatched) ->
    {Matched, UnMatched};
do_pair([H = #preparation_team{num = Num} | T],
        Cfg = #{max_num := Max}, Matched, UnMatched)
    when Num >= Max div 2 ->
    do_pair(T, Cfg, [H | Matched], UnMatched);
do_pair([H = #preparation_team{} | T], Cfg, Matched,
        UnMatched) ->
    case pair_mates(T, H, Cfg, []) of
        {ok, NewH, Rest} ->
            do_pair(Rest, Cfg, [NewH | Matched], UnMatched);
        _ -> do_pair(T, Cfg, Matched, [H | UnMatched])
    end.

pair_mates([], Nomi = #preparation_team{num = Num},
           #{min_num := Min, max_num := Max,
             subtrahend := Subtrahend},
           UnMatched)
    when Num >= Min div 2 andalso
             (Max div 2 - Num) rem Subtrahend div 2 =:= 0 ->
    {ok, Nomi, UnMatched};
pair_mates([], _, _, _) -> false;
pair_mates([Candi = #preparation_team{num = Num1} | T],
           Nomi = #preparation_team{num = Num2},
           Cfg = #{max_num := Max}, UnMatched)
    when Num1 + Num2 > Max div 2 ->
    pair_mates(T, Nomi, Cfg, [Candi | UnMatched]);
pair_mates([#preparation_team{ids = Ids1, num = Num1,
                              max_lev = MaxLev1, sum_lev = SumLev1,
                              classes = Classes1}
            | T],
           Nomi = #preparation_team{ids = Ids2, classes = Classes2,
                                    num = Num2, max_lev = MaxLev2,
                                    sum_lev = SumLev2, origin_ids = Origins},
           Cfg = #{max_num := Max}, UnMatched) ->
    Classes3 = Classes1 ++ Classes2,
    Nomi1 = Nomi#preparation_team{max_lev =
                                      max(MaxLev1, MaxLev2),
                                  sum_lev = SumLev1 + SumLev2,
                                  origin_ids = [Ids1 | Origins],
                                  num = Num1 + Num2, classes = Classes3},
    case Num1 + Num2 >= Max div 2 of
        true ->
            {ok,
             Nomi1#preparation_team{ids = Ids1 ++ Ids2},
             UnMatched ++ T};
        _ ->
            pair_mates(T,
                       Nomi1#preparation_team{ids = Ids1 ++ Ids2},
                       Cfg,
                       UnMatched)
    end.

matched_action([], UnMatched, _) -> UnMatched;
matched_action([#preparation_team{origin_ids =
                                      Origins}],
               UnMatched, _) ->
    acc_tried_matched(list(Origins)) ++ UnMatched;
matched_action([A, B | T], UnMatched, Cfg) ->
    matched_action(Cfg, {A, B}),
    matched_action(T, UnMatched, Cfg).

matched_action(#{id := RoomId},
               {#preparation_team{ids = Ids1, origin_ids = Origins1,
                                  max_lev = MaxLev1, classes = Classes1,
                                  sum_lev = SumLev1, num = Num1},
                #preparation_team{ids = Ids2, origin_ids = Origins2,
                                  max_lev = MaxLev2, classes = Classes2,
                                  sum_lev = SumLev2, num = Num2}}) ->
    [delete(DelIds) || DelIds <- Origins1],
    [delete(DelIds) || DelIds <- Origins2],
    Mates1 = get_mates(Ids1),
    Mates2 = get_mates(Ids2),
    NewIds = lists:sort(Ids1 ++ Ids2),
    Team = #preparation_team{ids = NewIds,
                             origin_ids = Origins1 ++ Origins2,
                             max_lev = max(MaxLev1, MaxLev2),
                             sum_lev = SumLev1 + SumLev2, num = Num1 + Num2,
                             classes = Classes1 ++ Classes2},
    NewMates1 = [Mate#preparation_role{status = 2,
                                       group = 1}
                 || Mate <- Mates1],
    NewMates2 = [Mate#preparation_role{status = 2,
                                       group = 2}
                 || Mate <- Mates2],
    case
        (preparation_cfg:get_module(RoomId)):apply_matched(NewMates1
                                                               ++ NewMates2,
                                                           self(),
                                                           RoomId)
        of
        {delay, Timeout, M, F, A} ->
            update(Team),
            [role:apply(async,
                        Mpid,
                        {preparation_role, callback, [{set_status, RoomId, 2}]})
             || #preparation_role{pid = Mpid} <- Mates1,
                is_pid(Mpid)],
            [role:apply(async,
                        Mpid,
                        {preparation_role, callback, [{set_status, RoomId, 2}]})
             || #preparation_role{pid = Mpid} <- Mates2,
                is_pid(Mpid)],
            preparation_role:update(NewMates1),
            preparation_role:update(NewMates2),
            preparation_room:delay_action(Timeout, NewIds, M, F, A),
            ok;
        ok ->
            [preparation_role:delete(Mid) || Mid <- NewIds],
            [role:apply(async,
                        Mpid,
                        {preparation_role, callback, [{set_status, RoomId, 0}]})
             || #preparation_role{pid = Mpid} <- Mates1,
                is_pid(Mpid)],
            [role:apply(async,
                        Mpid,
                        {preparation_role, callback, [{set_status, RoomId, 0}]})
             || #preparation_role{pid = Mpid} <- Mates2,
                is_pid(Mpid)],
            ok
    end.

acc_tried_matched([]) -> [];
acc_tried_matched([H = #preparation_team{ids = Ids,
                                         tried_match = Tried}
                   | T]) ->
    update(H#preparation_team{tried_match = Tried + 1}),
    [Ids | acc_tried_matched(T)].

