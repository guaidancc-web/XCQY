-file("src/merge/merge_dets_campaign_group_purchase.erl",
      1).

-module(merge_dets_campaign_group_purchase).

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

-file("src/merge/merge_dets_campaign_group_purchase.erl",
      13).

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

-file("src/merge/merge_dets_campaign_group_purchase.erl",
      14).

-file("inc/campaign_group_purchase.hrl", 1).

-record(campaign_group_purchase_base,
        {id = 0,
         base_id = 0,
         num = 0,
         limit_num = 0,
         price = 0,
         price_type = 90003,
         discount_list = [],
         start_time = 0,
         end_time = 0,
         check_list = [],
         lev_min = 0,
         lev_max = 0,
         base_role_num = 0,
         sex = 2}).

-record(campaign_group_purchase_item,
        {id = 0,
         ver = 2,
         base_id = 0,
         num = 0,
         limit_num = 0,
         price = 0,
         price_type = 90003,
         discount = 1000,
         discount_list = [],
         start_time = 0,
         end_time = 0,
         buy_num = 0,
         system_buy_num = 0,
         buy_roles = [],
         is_end = 0,
         lev_min = 0,
         lev_max = 0,
         sex = 2,
         list1 = [],
         list2 = []}).

-record(campaign_group_purchase_role,
        {id = {0, "", 0}, ver = 0, buy_list = []}).

-file("src/merge/merge_dets_campaign_group_purchase.erl",
      15).

do_init(Table = #merge_table{server =
                                 #merge_server{index = Size, size = Size}}) ->
    SrvList = merge_util:all_server(),
    List = [util:to_list(util:flist("~ts_~w",
                                    [Platform, ZoneId]))
            || #merge_server{platform = Platform, zone_id = ZoneId}
                   <- SrvList],
    merge(List),
    merge_util:dets_merge(campaign_group_purchase_role,
                          "campaign_group_purchase_role.dets",
                          set,
                          #campaign_group_purchase_role.id,
                          undefined),
    {ok, [], Table};
do_init(Table) -> {ok, [], Table}.

do_convert([], Table) -> {ok, Table}.

do_end(_Table) -> ignore.

merge(L) ->
    dets:open_file(campaign_group_purchase_item,
                   [{file, "../dets/campaign_group_purchase_item.dets"},
                    {type, set},
                    {keypos, #campaign_group_purchase_item.id}]),
    dets:delete_all_objects(campaign_group_purchase_item),
    ets:new(campaign_group_purchase_item,
            [named_table,
             public,
             set,
             {keypos, #campaign_group_purchase_item.id}]),
    merge_other(L),
    dets:close(campaign_group_purchase_item),
    ok.

merge_other([]) -> ok;
merge_other([PlatformZone | T]) ->
    {ok, DetsFlag} =
        util:string_to_term("campaign_group_purchase_item_" ++
                                PlatformZone),
    dets:open_file(DetsFlag,
                   [{file,
                     "../dets/" ++
                         PlatformZone ++ "/campaign_group_purchase_item.dets"},
                    {type, set},
                    {keypos, #campaign_group_purchase_item.id}]),
    case dets:first(DetsFlag) of
        '$end_of_table' ->
            logger:info("~s 目录下没有需要合并的团购数据",
                        [PlatformZone],
                        merge_dets_campaign_group_purchase,
                        47);
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

handle_compare(CampItem =
                   #campaign_group_purchase_item{discount = OldDiscount,
                                                 id = Id, buy_num = BuyNum1,
                                                 system_buy_num = SystemBuyNum1,
                                                 buy_roles = BuyRoles1,
                                                 discount_list =
                                                     DisCountList}) ->
    case ets:lookup(campaign_group_purchase_item, Id) of
        [#campaign_group_purchase_item{buy_num = BuyNum2,
                                       system_buy_num = SystemBuyNum2,
                                       buy_roles = BuyRoles2}] ->
            NewBuyNum = BuyNum1 + BuyNum2,
            NewSystemBuyNum = SystemBuyNum1 + SystemBuyNum2,
            NewBuyRoles = BuyRoles1 ++ BuyRoles2,
            NewDiscount = calc_discount(OldDiscount,
                                        DisCountList,
                                        NewBuyNum),
            NewCampItem =
                CampItem#campaign_group_purchase_item{buy_num =
                                                          NewBuyNum,
                                                      system_buy_num =
                                                          NewSystemBuyNum,
                                                      buy_roles = NewBuyRoles,
                                                      discount = NewDiscount},
            ets:insert(campaign_group_purchase_item, NewCampItem),
            dets:insert(campaign_group_purchase_item, NewCampItem);
        [] ->
            ets:insert(campaign_group_purchase_item, CampItem),
            dets:insert(campaign_group_purchase_item, CampItem)
    end;
handle_compare(_) -> ok.

calc_discount(Discount, [], _BuyNum) -> Discount;
calc_discount(_Discount, [{GetDisCount, NeedNum} | T],
              BuyNum)
    when BuyNum >= NeedNum ->
    calc_discount(GetDisCount, T, BuyNum);
calc_discount(Discount, [_ | _], _) -> Discount.

