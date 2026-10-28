-file("src/merge/merge_dets_camp_lucky_draw.erl", 1).

-module(merge_dets_camp_lucky_draw).

-author("jia").

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

-file("src/merge/merge_dets_camp_lucky_draw.erl", 20).

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

-file("src/merge/merge_dets_camp_lucky_draw.erl", 21).

-file("inc/camp_lucky_draw.hrl", 1).

-author("jia").

-record(camp_lucky_draw_reward_base,
        {group_id = 0,
         base_id = 0,
         bind = 0,
         num = 0,
         min_times = 0,
         is_free = 0,
         weight = 0,
         icon = "",
         min_lev = 0,
         max_lev = 0,
         sex = 2,
         classes = 0,
         is_record = 0,
         is_effect = 0,
         is_cast = 0,
         add_weight = 0,
         is_zone_cast = 0}).

-record(camp_lucky_draw_role,
        {rid = {0, "", 0},
         name = "",
         lev = 0,
         sex = 2,
         classes = 0,
         free_times = 0,
         draw_times = 0,
         update_time = 0}).

-record(camp_lucky_draw_info,
        {camp_id = 0, gold = 0, add_gold = 0, msg_list = []}).

-record(camp_lucky_draw_record_msg,
        {add_time = 0, msg = ""}).

-file("src/merge/merge_dets_camp_lucky_draw.erl", 22).

do_init(Table = #merge_table{server =
                                 #merge_server{index = Size, size = Size}}) ->
    SrvList = merge_util:all_server(),
    List = [util:to_list(util:flist("~ts_~w",
                                    [Platform, ZoneId]))
            || #merge_server{platform = Platform, zone_id = ZoneId}
                   <- SrvList],
    merge(List),
    merge_util:dets_merge(camp_lucky_draw_role,
                          "camp_lucky_draw_role.dets",
                          set,
                          #camp_lucky_draw_role.rid,
                          undefined),
    {ok, [], Table};
do_init(Table) -> {ok, [], Table}.

merge(L) ->
    dets:open_file(camp_lucky_draw_info,
                   [{file, "../dets/camp_lucky_draw_info.dets"},
                    {type, set},
                    {keypos, #camp_lucky_draw_info.camp_id}]),
    dets:delete_all_objects(camp_lucky_draw_info),
    ets:new(camp_lucky_draw_info,
            [named_table,
             public,
             set,
             {keypos, #camp_lucky_draw_info.camp_id}]),
    merge_other(L),
    dets:close(camp_lucky_draw_info),
    ok.

merge_other([]) -> ok;
merge_other([PlatformZone | T]) ->
    {ok, DetsFlag} =
        util:string_to_term("camp_lucky_draw_info_" ++
                                PlatformZone),
    dets:open_file(DetsFlag,
                   [{file,
                     "../dets/" ++
                         PlatformZone ++ "/camp_lucky_draw_info.dets"},
                    {type, set},
                    {keypos, #camp_lucky_draw_info.camp_id}]),
    case dets:first(DetsFlag) of
        '$end_of_table' ->
            logger:info("~s 目录下没有需要合并的转盘抽奖数据",
                        [PlatformZone],
                        merge_dets_camp_lucky_draw,
                        46);
        _ ->
            dets:traverse(DetsFlag,
                          fun (Data) ->
                                  handle_compare(Data),
                                  continue
                          end),
            ok
    end,
    dets:close(DetsFlag),
    merge_other(T).

handle_compare(CampItem = #camp_lucky_draw_info{camp_id
                                                    = CampID,
                                                msg_list = OldMsgList,
                                                add_gold = OldAddGold}) ->
    case ets:lookup(camp_lucky_draw_info, CampID) of
        [#camp_lucky_draw_info{camp_id = CampID,
                               add_gold = AddGold, msg_list = MsgList}]
            when AddGold > 0 ->
            NewMsgList = OldMsgList ++ MsgList,
            NewAddGold = OldAddGold + AddGold,
            NewCampItem = CampItem#camp_lucky_draw_info{msg_list =
                                                            NewMsgList,
                                                        add_gold = NewAddGold},
            ets:insert(camp_lucky_draw_info, NewCampItem),
            dets:insert(camp_lucky_draw_info, NewCampItem);
        _ ->
            ets:insert(camp_lucky_draw_info, CampItem),
            dets:insert(camp_lucky_draw_info, CampItem)
    end;
handle_compare(_) -> ok.

do_convert([], Table) -> {ok, Table}.

do_end(_Table) -> ignore.

