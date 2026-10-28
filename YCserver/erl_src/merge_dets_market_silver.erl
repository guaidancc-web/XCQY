-file("src/merge/merge_dets_market_silver.erl", 1).

-module(merge_dets_market_silver).

-export([do_init/1,
         do_convert/2,
         do_end/1,
         init_price/0,
         merge/1,
         merge_shop/1]).

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

-file("src/merge/merge_dets_market_silver.erl", 17).

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

-file("src/merge/merge_dets_market_silver.erl", 18).

-file("inc/market_silver.hrl", 1).

-record(m_market_silver,
        {ver = 1,
         refresh_time = 0,
         is_first_on_sale = 1,
         refresh = []}).

-record(market_silver_shop,
        {ver = 2,
         rid,
         max_cell_id = 0,
         free_ids = [],
         cells = [],
         name = "",
         pid,
         last_logout = 0}).

-record(market_silver_shop_cell,
        {ver = 2,
         cell_id = 0,
         item_base_id = 0,
         num = 0,
         item_attrs = [],
         price = 0,
         expiry = 0,
         sold_num = 0,
         status = 0,
         system_price = 0,
         percent = 100,
         sale_time = 0}).

-record(market_silver_price,
        {ver = 3,
         item_base_id = 0,
         price = 0,
         sellers = [],
         deal_price = [],
         recover_num = 0,
         day_recover = 0,
         day_auto = 0,
         ext = []}).

-record(market_silver_refresh,
        {id = 0,
         item_base_id = 0,
         num = 0,
         item_attrs = [],
         price = 0,
         cell_id = 0,
         seller_id,
         status = 0}).

-record(market_silver_item_data,
        {base_id = 0,
         type = 0,
         step = 0,
         classes = 0,
         min_lev = 0,
         max_lev = 0,
         is_system = 1,
         is_quest_need = 0,
         def_price = 0,
         min_price = 0,
         max_price = 0,
         gain_label = coin,
         world_lev = 0,
         pre_base_id = 0,
         pre_pcnt = 1000,
         group = 0,
         group_id = 0,
         update_time,
         chain_type = 0,
         fix_price = 0}).

-record(market_silver_draw_item,
        {cell_id = 0,
         base_id = 0,
         num = 0,
         rest = 0,
         price = 0,
         pcnt = 0,
         attrs = []}).

-file("src/merge/merge_dets_market_silver.erl", 19).

do_init(Table = #merge_table{server =
                                 #merge_server{index = Size, size = Size}}) ->
    ShopFunctions = {undefined,
                     fun merge_dets_market_silver:merge_shop/1,
                     undefined},
    merge_util:dets_merge(market_silver_shop_tab,
                          "market_silver_shop.dets",
                          set,
                          #market_silver_shop.rid,
                          ShopFunctions),
    PriceFunctions = {{merge_dets_market_silver,
                       init_price,
                       []},
                      fun merge_dets_market_silver:merge/1,
                      undefined},
    merge_util:dets_merge(market_silver_price_tab,
                          "market_silver_price.dets",
                          set,
                          #market_silver_shop.rid,
                          PriceFunctions),
    {ok, [], Table};
do_init(Table) -> {ok, [], Table}.

do_convert([], Table) -> {ok, Table}.

do_end(_Table) -> ignore.

init_price() ->
    ets:new(market_silver_price_tab,
            [set,
             named_table,
             {keypos, #market_silver_price.item_base_id}]),
    ok.

merge(SilverPrice = #market_silver_price{}) ->
    Tab = market_silver_price_tab,
    merge_price(SilverPrice, Tab);
merge(Unknow) ->
    logger:error("银币市场回调错误：~w",
                 [Unknow],
                 merge_dets_market_silver,
                 44),
    {false, "未知的银币市场数据"}.

merge_shop(Shop = #market_silver_shop{cells = Cells}) ->
    NewCells = merge_shop_cell(Cells, []),
    NewShop = Shop#market_silver_shop{cells = NewCells},
    {ok, NewShop};
merge_shop(Unknow) ->
    logger:error("无法合并银币市场数据:~w",
                 [Unknow],
                 merge_dets_market_silver,
                 53),
    {false, "无法合并银币市场数据"}.

merge_price(RefSilverPrice =
                #market_silver_price{item_base_id = BaseId},
            Tab) ->
    case catch ets:lookup(Tab, BaseId) of
        [SilverPrice = #market_silver_price{}] ->
            case do_merge_price(RefSilverPrice, SilverPrice) of
                {ok, NewSilverPrice} ->
                    merge_cache(Tab, NewSilverPrice);
                Err ->
                    logger:error("无法合并银币市场价格数据[BaseId:~w]:~w",
                                 [BaseId, Err],
                                 merge_dets_market_silver,
                                 66),
                    {false, "无法合并银币市场价格数据"}
            end;
        [] ->
            catch ets:lookup(Tab, RefSilverPrice),
            {ok, RefSilverPrice};
        false -> merge_cache(Tab, RefSilverPrice);
        Err ->
            logger:error("无法合并银币市场价格数据[BaseId:~w]:~w",
                         [BaseId, Err],
                         merge_dets_market_silver,
                         75),
            {false, "无法合并银币市场价格数据"}
    end.

do_merge_price(RefSilverPrice =
                   #market_silver_price{price = RefPrice,
                                        sellers = RefSellers,
                                        deal_price = RefDealPrice},
               #market_silver_price{price = Price, sellers = Sellers,
                                    deal_price = DealPrice,
                                    item_base_id = BaseId}) ->
    case market_silver_data:get(BaseId) of
        #market_silver_item_data{min_price = MinPrice,
                                 max_price = MaxPrice} ->
            AvgPrice = util:list_avg([RefPrice, Price] ++
                                         RefDealPrice ++ DealPrice),
            NewPrice = erlang:max(MinPrice,
                                  erlang:min(MaxPrice, AvgPrice)),
            NewSilverPrice =
                RefSilverPrice#market_silver_price{price = NewPrice,
                                                   sellers =
                                                       Sellers ++ RefSellers,
                                                   deal_price = [],
                                                   day_auto = 0,
                                                   day_recover = 0,
                                                   recover_num = 0},
            {ok, NewSilverPrice};
        _ ->
            logger:error("未知的物品数据[BaseId:~w]",
                         [BaseId],
                         merge_dets_market_silver,
                         96),
            {false, util:flist("未知的物品数据[BaseId:~w]", [BaseId])}
    end.

merge_shop_cell([], Cells) -> Cells;
merge_shop_cell([Cell = #market_silver_shop_cell{}
                 | Rest],
                Cells) ->
    NewCell = Cell#market_silver_shop_cell{expiry = 0},
    merge_shop_cell(Rest, [NewCell | Cells]).

merge_cache(Tab, Objects) ->
    case catch ets:insert(Tab, Objects) of
        true -> {ok, Objects};
        Err ->
            logger:error("无法合并银币市场数据:~w",
                         [Err],
                         merge_dets_market_silver,
                         113),
            {false, "无法合并银币市场数据"}
    end.

