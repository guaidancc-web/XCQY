-file("src/merge/merge_dets_market_gold.erl", 1).

-module(merge_dets_market_gold).

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

-file("src/merge/merge_dets_market_gold.erl", 13).

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

-file("src/merge/merge_dets_market_gold.erl", 14).

-file("inc/market_gold.hrl", 1).

-record(m_market_gold, {ver = 1, limit_data = []}).

-record(market_gold_item_data,
        {id :: undefined | pos_integer(),
         base_id :: undefined | pos_integer(),
         catalg_1 :: undefined | pos_integer(),
         catalg_2 :: undefined | pos_integer(),
         init_price :: undefined | non_neg_integer(),
         init_stock :: undefined | non_neg_integer(),
         world_lev :: undefined | non_neg_integer(),
         max_price :: undefined | non_neg_integer(),
         min_price :: undefined | non_neg_integer(),
         is_exchange :: undefined | 0 | 1,
         day_limit :: undefined | non_neg_integer(),
         classes :: undefined | non_neg_integer(),
         up_ratio :: undefined | non_neg_integer(),
         down_ratio :: undefined | non_neg_integer()}).

-record(market_gold_item,
        {id :: undefined | pos_integer(),
         base_id = 0 :: pos_integer(),
         stock = 0 :: non_neg_integer(),
         init_stock = 0 :: non_neg_integer(),
         init_price = 0 :: non_neg_integer(),
         def_price = 0 :: non_neg_integer(),
         cur_price = 0 :: non_neg_integer(),
         margin = 1000 :: non_neg_integer(),
         margin_acc = 1000 :: non_neg_integer(),
         day_sold = 0 :: non_neg_integer(),
         day_buy = 0 :: non_neg_integer(),
         ver = 1 :: non_neg_integer()}).

-record(market_gold_change_item,
        {base_id = 0 :: pos_integer(),
         got_list = [] :: list(),
         catalg_1 = 0 :: pos_integer(),
         catalg_2 = 0 :: pos_integer()}).

-record(market_gold_price,
        {base_id = 0,
         margin_type = 0,
         init_price = 0,
         buy_price = 0,
         margin = 0}).

-record(market_gold_limit_data,
        {id = 0,
         min = 0,
         max = 0,
         num = 0,
         is_show = 0,
         type = 0}).

-file("src/merge/merge_dets_market_gold.erl", 15).

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
    dets:open_file(market_gold_item_tab,
                   [{file, "../dets/market_gold_item.dets"},
                    {type, set},
                    {keypos, #market_gold_item.base_id}]),
    dets:delete_all_objects(market_gold_item_tab),
    ets:new(market_gold_item_tab,
            [named_table,
             public,
             set,
             {keypos, #market_gold_item.base_id}]),
    dets:open_file(market_gold_item_tab_first,
                   [{file,
                     "../dets/" ++ First ++ "/market_gold_item.dets"},
                    {type, set},
                    {keypos, #market_gold_item.base_id}]),
    case dets:first(market_gold_item_tab_first) of
        '$end_of_table' ->
            logger:info("~ts 目录下没有需要合并的金币市场数据",
                        [First],
                        merge_dets_market_gold,
                        39);
        _ ->
            dets:traverse(market_gold_item_tab_first,
                          fun (MarketItem = #market_gold_item{}) ->
                                  ets:insert(market_gold_item_tab, MarketItem),
                                  dets:insert(market_gold_item_tab, MarketItem),
                                  continue;
                              (_) -> continue
                          end),
            ok
    end,
    merge_other(T),
    reload_data(),
    dets:close(market_gold_item_tab),
    dets:close(market_gold_item_tab_first),
    ok.

merge_other([]) -> ok;
merge_other([PlatformZone | T]) ->
    {ok, DetsFlag} =
        util:string_to_term("market_gold_item_tab_" ++
                                PlatformZone),
    dets:open_file(DetsFlag,
                   [{file,
                     "../dets/" ++ PlatformZone ++ "/market_gold_item.dets"},
                    {type, set},
                    {keypos, #market_gold_item.base_id}]),
    case dets:first(DetsFlag) of
        '$end_of_table' ->
            logger:info("~ts 目录下没有需要合并的金币市场数据",
                        [PlatformZone],
                        merge_dets_market_gold,
                        67);
        _ ->
            dets:traverse(DetsFlag,
                          fun (MarketItem = #market_gold_item{}) ->
                                  handle_compare(MarketItem),
                                  continue;
                              (_) -> continue
                          end),
            ok
    end,
    dets:close(DetsFlag),
    merge_other(T).

handle_compare(MarketItem = #market_gold_item{base_id =
                                                  BaseId,
                                              margin_acc = MarginAcc1}) ->
    case ets:lookup(market_gold_item_tab, BaseId) of
        [#market_gold_item{margin_acc = MarginAcc2}] ->
            NewMarginAcc = round((MarginAcc1 + MarginAcc2) / 2),
            ets:insert(market_gold_item_tab,
                       MarketItem#market_gold_item{margin_acc = NewMarginAcc}),
            dets:insert(market_gold_item_tab,
                        MarketItem#market_gold_item{margin_acc = NewMarginAcc});
        [] ->
            ets:insert(market_gold_item_tab, MarketItem),
            dets:insert(market_gold_item_tab, MarketItem)
    end.

reload_data() ->
    AllItems = market_gold_data:get_all_items(),
    ItemList = ets:tab2list(market_gold_item_tab),
    {NowItems, DelItems} = reload_data(ItemList,
                                       AllItems,
                                       [],
                                       []),
    ets:delete(market_gold_item_tab, DelItems),
    dets:delete(market_gold_item_tab, DelItems),
    ets:insert(market_gold_item_tab, NowItems),
    dets:insert(market_gold_item_tab, NowItems),
    ok.

reload_data([], OpenItems, DelItems, UpdateItems) ->
    AddItems = [to_market_item(ItemData)
                || ItemData <- OpenItems],
    {AddItems ++ UpdateItems, DelItems};
reload_data([#market_gold_item{base_id = BaseId,
                               margin_acc = MarginAcc}
             | T],
            OpenItems, DelItems, UpdateItems) ->
    case lists:keytake(BaseId,
                       #market_gold_item_data.base_id,
                       OpenItems)
        of
        false ->
            reload_data(T,
                        OpenItems,
                        [BaseId | DelItems],
                        UpdateItems);
        {value,
         ItemData = #market_gold_item_data{},
         RestOpenItems} ->
            MarketItem = to_market_item(ItemData, MarginAcc),
            reload_data(T,
                        RestOpenItems,
                        DelItems,
                        [MarketItem | UpdateItems])
    end.

to_market_item(#market_gold_item_data{id = Id,
                                      base_id = BaseId, init_price = InitPrice,
                                      init_stock = InitStock}) ->
    #market_gold_item{id = Id, base_id = BaseId,
                      stock = InitStock, cur_price = InitPrice,
                      init_price = InitPrice, def_price = InitPrice,
                      margin = 1000, margin_acc = 1000,
                      init_stock = InitStock}.

to_market_item(#market_gold_item_data{id = Id,
                                      base_id = BaseId, init_price = InitPrice,
                                      init_stock = InitStock,
                                      min_price = MinPrice,
                                      max_price = MaxPrice},
               MarginAcc) ->
    InitPrice1 = erlang:round(InitPrice * MarginAcc / 1000),
    InitPrice2 = util:check_range(InitPrice1,
                                  MinPrice,
                                  MaxPrice),
    #market_gold_item{id = Id, base_id = BaseId,
                      stock = InitStock, cur_price = InitPrice2,
                      init_price = InitPrice2, def_price = InitPrice,
                      margin = 1000, margin_acc = MarginAcc,
                      init_stock = InitStock}.

