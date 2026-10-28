-file("src/mod/market/market_ver.erl", 1).

-module(market_ver).

-export([silver_shop_ver/1,
         market_gold_ver/1,
         silver_price_ver/1]).

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

-file("src/mod/market/market_ver.erl", 19).

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

-file("src/mod/market/market_ver.erl", 20).

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

-file("src/mod/market/market_ver.erl", 21).

silver_shop_ver(Shop = #market_silver_shop{ver = 2,
                                           cells = Cells}) ->
    case shop_cell_ver(Cells, []) of
        {ok, NewCells} ->
            {ok, Shop#market_silver_shop{cells = NewCells}};
        _Err -> {false, "商店数据版本转换错误"}
    end.

market_gold_ver(_D = {market_gold_item,
                      Id,
                      BaseId,
                      Stock,
                      InitStock,
                      InitPrice,
                      DefPrice,
                      CurPrice,
                      Margin,
                      MarginAcc}) ->
    DaySold = 0,
    DayBuy = 0,
    Ver = 1,
    market_gold_ver({market_gold_item,
                     Id,
                     BaseId,
                     Stock,
                     InitStock,
                     InitPrice,
                     DefPrice,
                     CurPrice,
                     Margin,
                     MarginAcc,
                     DaySold,
                     DayBuy,
                     Ver});
market_gold_ver(Data = #market_gold_item{ver = 1}) ->
    {ok, Data};
market_gold_ver(_D) ->
    logger:debug("数据版本 ~w", [_D], market_ver, 44),
    {false, lang:get("金币市场版本转换失败")}.

shop_cell_ver([], Cells) -> {ok, Cells};
shop_cell_ver([Cell | Rest], Cells) ->
    NewCell = do_shop_cell_ver(Cell),
    shop_cell_ver(Rest, [NewCell | Cells]).

do_shop_cell_ver({market_silver_shop_cell,
                  Ver = 1,
                  CellId,
                  ItemBaseId,
                  Num,
                  ItemAttrs,
                  Price,
                  Expiry,
                  SoldNum,
                  Status,
                  SystemPrice,
                  Percent}) ->
    NewVer = Ver + 1,
    SaleTime = 0,
    NewCell = {market_silver_shop_cell,
               NewVer,
               CellId,
               ItemBaseId,
               Num,
               ItemAttrs,
               Price,
               Expiry,
               SoldNum,
               Status,
               SystemPrice,
               Percent,
               SaleTime},
    do_shop_cell_ver(NewCell);
do_shop_cell_ver(Cell = #market_silver_shop_cell{ver =
                                                     2}) ->
    Cell.

silver_price_ver({market_silver_price,
                  Ver = 1,
                  BaseId,
                  Price,
                  Sellers,
                  DealPrice,
                  RecoverNum}) ->
    DayRecover = 0,
    DayAuto = 0,
    SilverPrice = {market_silver_price,
                   Ver + 1,
                   BaseId,
                   Price,
                   Sellers,
                   DealPrice,
                   RecoverNum,
                   DayRecover,
                   DayAuto},
    silver_price_ver(SilverPrice);
silver_price_ver({market_silver_price,
                  Ver = 2,
                  BaseId,
                  Price,
                  Sellers,
                  DealPrice,
                  RecoverNum,
                  DayRecover,
                  DayAuto}) ->
    Ext = [],
    SilverPrice = {market_silver_price,
                   Ver + 1,
                   BaseId,
                   Price,
                   Sellers,
                   DealPrice,
                   RecoverNum,
                   DayRecover,
                   DayAuto,
                   Ext},
    silver_price_ver(SilverPrice);
silver_price_ver(Price = #market_silver_price{ver =
                                                  3}) ->
    {ok, Price};
silver_price_ver(_False) ->
    logger:debug("~w", [_False], market_ver, 94),
    {false, "银币市场商品价格版本转换错误"}.

