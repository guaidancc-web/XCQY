-file("src/proto/proto_124.erl", 1).

-module(proto_124).

-export([pack/3, unpack/3]).

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

-file("src/proto/proto_124.erl", 14).

-file("inc/protocol.hrl", 1).

-record(module,
        {code :: undefined | pos_integer(),
         type :: undefined | game_server | monitor | tester,
         need_auth = true :: boolean(),
         caller = connector :: connector | object,
         module :: undefined | atom(),
         desc = "" :: string()}).

-record(rpc,
        {code = 0 :: non_neg_integer(),
         disable = false :: boolean(),
         autolog = false :: boolean(),
         autozip = false :: boolean(),
         condition = [] :: [tuple()],
         log_title :: undefined | string(),
         req_desc ::
             undefined |
             string() |
             {string(), [atom()]} |
             {atom(), atom(), tuple()},
         req = [] :: {atom(), [tuple()]} | [tuple()],
         reply_desc ::
             undefined |
             string() |
             {string(), [atom()]} |
             {atom(), atom(), tuple()},
         reply = [] :: {atom(), [tuple()]} | [tuple()],
         parser :: undefined | atom(),
         mod :: undefined | atom(),
         can_cache = true :: boolean()}).

-file("src/proto/proto_124.erl", 15).

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

-file("src/proto/proto_124.erl", 16).

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

-file("src/proto/proto_124.erl", 17).

-file("inc/market.hrl", 1).

-record(market_price,
        {base_id = 0,
         price = 0,
         assets = 0,
         source = 0,
         val1 = 0,
         val2 = 0,
         val3 = 0,
         val4 = 0}).

-file("src/proto/proto_124.erl", 18).

-spec pack(srv | cli, non_neg_integer(),
           tuple()) -> {ok, binary()} |
                       {error, {unknown_pack_command, non_neg_integer()}}.

pack(cli, 12400, {V0_catalg_1, V0_catalg_2}) ->
    D_a_t_a = <<V0_catalg_1:32/little,
                V0_catalg_2:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12400:16/little,
       D_a_t_a/binary>>};
pack(srv, 12400,
     {V0_catalg_1, V0_catalg_2, V0_goods}) ->
    D_a_t_a = <<V0_catalg_1:32/little,
                V0_catalg_2:32/little, (length(V0_goods)):16/little,
                (list_to_binary([<<V1_id:32/little,
                                   V1_base_id:32/little, V1_cur_price:32/little,
                                   V1_margin:32/little>>
                                 || #market_gold_item{id = V1_id,
                                                      base_id = V1_base_id,
                                                      cur_price = V1_cur_price,
                                                      margin = V1_margin}
                                        <- V0_goods]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12400:16/little,
       D_a_t_a/binary>>};
pack(cli, 12401, {V0_base_id, V0_num}) ->
    D_a_t_a = <<V0_base_id:32/little, V0_num:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12401:16/little,
       D_a_t_a/binary>>};
pack(srv, 12401, {V0_flag}) ->
    D_a_t_a = <<V0_flag:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12401:16/little,
       D_a_t_a/binary>>};
pack(cli, 12402, {V0_id, V0_num}) ->
    D_a_t_a = <<V0_id:32/little, V0_num:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12402:16/little,
       D_a_t_a/binary>>};
pack(srv, 12402, {}) ->
    {ok, <<2:32/little, 12402:16/little>>};
pack(cli, 12403, {V0_base_id, V0_num}) ->
    D_a_t_a = <<V0_base_id:32/little, V0_num:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12403:16/little,
       D_a_t_a/binary>>};
pack(srv, 12403, {V0_base_id, V0_num, V0_price}) ->
    D_a_t_a = <<V0_base_id:32/little, V0_num:16/little,
                V0_price:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12403:16/little,
       D_a_t_a/binary>>};
pack(cli, 12404,
     {V0_package_type,
      V0_item_id,
      V0_num,
      V0_percent,
      V0_cell_id}) ->
    D_a_t_a = <<V0_package_type:8/little,
                V0_item_id:32/little, V0_num:8/little,
                V0_percent:32/little, V0_cell_id:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12404:16/little,
       D_a_t_a/binary>>};
pack(srv, 12404, {}) ->
    {ok, <<2:32/little, 12404:16/little>>};
pack(cli, 12405, {V0_type, V0_id}) ->
    D_a_t_a = <<V0_type:8/little, V0_id:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12405:16/little,
       D_a_t_a/binary>>};
pack(srv, 12405,
     {V0_err_code, V0_type, V0_id, V0_status, V0_num}) ->
    D_a_t_a = <<V0_err_code:8/little, V0_type:8/little,
                V0_id:8/little, V0_status:8/little, V0_num:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12405:16/little,
       D_a_t_a/binary>>};
pack(cli, 12406, {V0_cell_id}) ->
    D_a_t_a = <<V0_cell_id:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12406:16/little,
       D_a_t_a/binary>>};
pack(srv, 12406, {V0_cell_id, V0_flag}) ->
    D_a_t_a = <<V0_cell_id:8/little, V0_flag:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12406:16/little,
       D_a_t_a/binary>>};
pack(cli, 12407, {}) ->
    {ok, <<2:32/little, 12407:16/little>>};
pack(srv, 12407,
     {#market_silver_shop{free_ids = V0_free_ids,
                          cells = V0_cells}}) ->
    D_a_t_a = <<(length(V0_free_ids)):16/little,
                (list_to_binary([<<V1_cell_id:8/little>>
                                 || V1_cell_id <- V0_free_ids]))/binary,
                (length(V0_cells)):16/little,
                (list_to_binary([<<V1_cell_id:8/little,
                                   V1_item_base_id:32/little, V1_num:8/little,
                                   V1_price:32/little, V1_expiry:32/little,
                                   (length(V1_item_attrs)):16/little,
                                   (list_to_binary([<<V2_attr:8/little,
                                                      V2_value:32/little>>
                                                    || {V2_attr, V2_value}
                                                           <- V1_item_attrs]))/binary,
                                   V1_status:8/little>>
                                 || #market_silver_shop_cell{cell_id =
                                                                 V1_cell_id,
                                                             item_base_id =
                                                                 V1_item_base_id,
                                                             num = V1_num,
                                                             price = V1_price,
                                                             expiry = V1_expiry,
                                                             item_attrs =
                                                                 V1_item_attrs,
                                                             status = V1_status}
                                        <- V0_cells]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12407:16/little,
       D_a_t_a/binary>>};
pack(cli, 12408, {V0_item_base_id}) ->
    D_a_t_a = <<V0_item_base_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12408:16/little,
       D_a_t_a/binary>>};
pack(srv, 12408, {V0_item_base_id, V0_price}) ->
    D_a_t_a = <<V0_item_base_id:32/little,
                V0_price:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12408:16/little,
       D_a_t_a/binary>>};
pack(cli, 12409, {V0_refresh_type}) ->
    D_a_t_a = <<V0_refresh_type:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12409:16/little,
       D_a_t_a/binary>>};
pack(srv, 12409, {V0_refresh_time, V0_data}) ->
    D_a_t_a = <<V0_refresh_time:32/little,
                (length(V0_data)):16/little,
                (list_to_binary([<<V1_type:8/little,
                                   (length(V1_goods)):16/little,
                                   (list_to_binary([<<V2_id:8/little,
                                                      V2_item_base_id:32/little,
                                                      V2_num:8/little,
                                                      V2_price:32/little,
                                                      V2_status:8/little,
                                                      (length(V2_item_attrs)):16/little,
                                                      (list_to_binary([<<V3_attr:8/little,
                                                                         V3_value:32/little>>
                                                                       || {V3_attr,
                                                                           V3_value}
                                                                              <- V2_item_attrs]))/binary>>
                                                    || #market_silver_refresh{id
                                                                                  =
                                                                                  V2_id,
                                                                              item_base_id
                                                                                  =
                                                                                  V2_item_base_id,
                                                                              num
                                                                                  =
                                                                                  V2_num,
                                                                              price
                                                                                  =
                                                                                  V2_price,
                                                                              status
                                                                                  =
                                                                                  V2_status,
                                                                              item_attrs
                                                                                  =
                                                                                  V2_item_attrs}
                                                           <- V1_goods]))/binary>>
                                 || {V1_type, V1_goods} <- V0_data]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12409:16/little,
       D_a_t_a/binary>>};
pack(cli, 12410,
     {V0_type, V0_page_start, V0_page_end}) ->
    D_a_t_a = <<V0_type:8/little, V0_page_start:8/little,
                V0_page_end:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12410:16/little,
       D_a_t_a/binary>>};
pack(srv, 12410, {V0_type, V0_goods}) ->
    D_a_t_a = <<V0_type:8/little,
                (length(V0_goods)):16/little,
                (list_to_binary([<<V1_id:8/little,
                                   V1_item_base_id:32/little, V1_num:8/little,
                                   V1_price:32/little, V1_status:8/little,
                                   (length(V1_item_attrs)):16/little,
                                   (list_to_binary([<<V2_attr:8/little,
                                                      V2_value:32/little>>
                                                    || {V2_attr, V2_value}
                                                           <- V1_item_attrs]))/binary>>
                                 || #market_silver_refresh{id = V1_id,
                                                           item_base_id =
                                                               V1_item_base_id,
                                                           num = V1_num,
                                                           price = V1_price,
                                                           status = V1_status,
                                                           item_attrs =
                                                               V1_item_attrs}
                                        <- V0_goods]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12410:16/little,
       D_a_t_a/binary>>};
pack(cli, 12411, {V0_cell_id}) ->
    D_a_t_a = <<V0_cell_id:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12411:16/little,
       D_a_t_a/binary>>};
pack(srv, 12411, {V0_cell_id, V0_flag}) ->
    D_a_t_a = <<V0_cell_id:8/little, V0_flag:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12411:16/little,
       D_a_t_a/binary>>};
pack(cli, 12412, {}) ->
    {ok, <<2:32/little, 12412:16/little>>};
pack(srv, 12412, {V0_cell_id, V0_flag}) ->
    D_a_t_a = <<V0_cell_id:8/little, V0_flag:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12412:16/little,
       D_a_t_a/binary>>};
pack(cli, 12413, {V0_cell_id, V0_percent, V0_num}) ->
    D_a_t_a = <<V0_cell_id:8/little, V0_percent:32/little,
                V0_num:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12413:16/little,
       D_a_t_a/binary>>};
pack(srv, 12413, {}) ->
    {ok, <<2:32/little, 12413:16/little>>};
pack(cli, 12414, {V0_type}) ->
    D_a_t_a = <<V0_type:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12414:16/little,
       D_a_t_a/binary>>};
pack(srv, 12414, {}) ->
    {ok, <<2:32/little, 12414:16/little>>};
pack(cli, 12415, {V0_item_base_id}) ->
    D_a_t_a = <<V0_item_base_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12415:16/little,
       D_a_t_a/binary>>};
pack(srv, 12415, {V0_item_base_id, V0_price}) ->
    D_a_t_a = <<V0_item_base_id:32/little,
                V0_price:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12415:16/little,
       D_a_t_a/binary>>};
pack(cli, 12416, {V0_base_ids}) ->
    D_a_t_a = <<(length(V0_base_ids)):16/little,
                (list_to_binary([<<V1_base_id:32/little>>
                                 || V1_base_id <- V0_base_ids]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12416:16/little,
       D_a_t_a/binary>>};
pack(srv, 12416, {V0_market_price}) ->
    D_a_t_a = <<(length(V0_market_price)):16/little,
                (list_to_binary([<<V1_source:8/little,
                                   V1_base_id:32/little, V1_assets:32/little,
                                   V1_price:32/little, V1_val1:32/little,
                                   V1_val2:32/little, V1_val3:32/little,
                                   V1_val4:32/little>>
                                 || #market_price{source = V1_source,
                                                  base_id = V1_base_id,
                                                  assets = V1_assets,
                                                  price = V1_price,
                                                  val1 = V1_val1,
                                                  val2 = V1_val2,
                                                  val3 = V1_val3,
                                                  val4 = V1_val4}
                                        <- V0_market_price]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12416:16/little,
       D_a_t_a/binary>>};
pack(cli, 12417, {V0_base_ids}) ->
    D_a_t_a = <<(length(V0_base_ids)):16/little,
                (list_to_binary([<<V1_base_id:32/little,
                                   V1_num:32/little>>
                                 || {V1_base_id, V1_num}
                                        <- V0_base_ids]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12417:16/little,
       D_a_t_a/binary>>};
pack(srv, 12417, {V0_flag}) ->
    D_a_t_a = <<V0_flag:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12417:16/little,
       D_a_t_a/binary>>};
pack(cli, 12418, {V0_catalg_1, V0_catalg_2}) ->
    D_a_t_a = <<V0_catalg_1:32/little,
                V0_catalg_2:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12418:16/little,
       D_a_t_a/binary>>};
pack(srv, 12418, {V0_goods}) ->
    D_a_t_a = <<(length(V0_goods)):16/little,
                (list_to_binary([<<V1_id:32/little,
                                   V1_base_id:32/little, V1_cur_price:32/little,
                                   V1_margin:32/little>>
                                 || #market_gold_item{id = V1_id,
                                                      base_id = V1_base_id,
                                                      cur_price = V1_cur_price,
                                                      margin = V1_margin}
                                        <- V0_goods]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12418:16/little,
       D_a_t_a/binary>>};
pack(cli, 12419, {}) ->
    {ok, <<2:32/little, 12419:16/little>>};
pack(srv, 12419, {}) ->
    {ok, <<2:32/little, 12419:16/little>>};
pack(cli, 12420, {}) ->
    {ok, <<2:32/little, 12420:16/little>>};
pack(srv, 12420, {V0_limit_data}) ->
    D_a_t_a = <<(length(V0_limit_data)):16/little,
                (list_to_binary([<<V1_item_id:32/little,
                                   V1_count:32/little>>
                                 || {V1_item_id, V1_count}
                                        <- V0_limit_data]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12420:16/little,
       D_a_t_a/binary>>};
pack(cli, 12421, {V0_base_ids, V0_id}) ->
    D_a_t_a = <<(length(V0_base_ids)):16/little,
                (list_to_binary([<<V1_base_id:32/little,
                                   V1_num:32/little>>
                                 || {V1_base_id, V1_num}
                                        <- V0_base_ids]))/binary,
                V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12421:16/little,
       D_a_t_a/binary>>};
pack(srv, 12421, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12421:16/little,
       D_a_t_a/binary>>};
pack(cli, 12422, {V0_base_ids, V0_id}) ->
    D_a_t_a = <<(length(V0_base_ids)):16/little,
                (list_to_binary([<<V1_base_id:32/little,
                                   V1_num:32/little>>
                                 || {V1_base_id, V1_num}
                                        <- V0_base_ids]))/binary,
                V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12422:16/little,
       D_a_t_a/binary>>};
pack(srv, 12422, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 12422:16/little,
       D_a_t_a/binary>>};
pack(_Type, Code, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
             binary()) -> {ok, tuple()} |
                          {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(srv, 12400, _B0) ->
    {V1_catalg_1, _B1} = protocol:uint32(_B0),
    {V1_catalg_2, _B2} = protocol:uint32(_B1),
    {ok, {V1_catalg_1, V1_catalg_2}};
unpack(cli, 12400, _B0) ->
    {V1_catalg_1, _B1} = protocol:uint32(_B0),
    {V1_catalg_2, _B2} = protocol:uint32(_B1),
    {V1_goods, _B9} = protocol:array(_B2,
                                     fun (_B3) ->
                                             {V2_id, _B4} =
                                                 protocol:uint32(_B3),
                                             {V2_base_id, _B5} =
                                                 protocol:uint32(_B4),
                                             {V2_cur_price, _B6} =
                                                 protocol:uint32(_B5),
                                             {V2_margin, _B7} =
                                                 protocol:uint32(_B6),
                                             {{V2_id,
                                               V2_base_id,
                                               V2_cur_price,
                                               V2_margin},
                                              _B7}
                                     end),
    {ok, {V1_catalg_1, V1_catalg_2, V1_goods}};
unpack(srv, 12401, _B0) ->
    {V1_base_id, _B1} = protocol:uint32(_B0),
    {V1_num, _B2} = protocol:uint16(_B1),
    {ok, {V1_base_id, V1_num}};
unpack(cli, 12401, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {ok, {V1_flag}};
unpack(srv, 12402, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_num, _B2} = protocol:uint16(_B1),
    {ok, {V1_id, V1_num}};
unpack(cli, 12402, _B0) -> {ok, {}};
unpack(srv, 12403, _B0) ->
    {V1_base_id, _B1} = protocol:uint32(_B0),
    {V1_num, _B2} = protocol:uint16(_B1),
    {ok, {V1_base_id, V1_num}};
unpack(cli, 12403, _B0) ->
    {V1_base_id, _B1} = protocol:uint32(_B0),
    {V1_num, _B2} = protocol:uint16(_B1),
    {V1_price, _B3} = protocol:uint32(_B2),
    {ok, {V1_base_id, V1_num, V1_price}};
unpack(srv, 12404, _B0) ->
    {V1_package_type, _B1} = protocol:uint8(_B0),
    {V1_item_id, _B2} = protocol:uint32(_B1),
    {V1_num, _B3} = protocol:uint8(_B2),
    {V1_percent, _B4} = protocol:uint32(_B3),
    {V1_cell_id, _B5} = protocol:uint8(_B4),
    {ok,
     {V1_package_type,
      V1_item_id,
      V1_num,
      V1_percent,
      V1_cell_id}};
unpack(cli, 12404, _B0) -> {ok, {}};
unpack(srv, 12405, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {V1_id, _B2} = protocol:uint8(_B1),
    {ok, {V1_type, V1_id}};
unpack(cli, 12405, _B0) ->
    {V1_err_code, _B1} = protocol:uint8(_B0),
    {V1_type, _B2} = protocol:uint8(_B1),
    {V1_id, _B3} = protocol:uint8(_B2),
    {V1_status, _B4} = protocol:uint8(_B3),
    {V1_num, _B5} = protocol:uint8(_B4),
    {ok, {V1_err_code, V1_type, V1_id, V1_status, V1_num}};
unpack(srv, 12406, _B0) ->
    {V1_cell_id, _B1} = protocol:uint8(_B0),
    {ok, {V1_cell_id}};
unpack(cli, 12406, _B0) ->
    {V1_cell_id, _B1} = protocol:uint8(_B0),
    {V1_flag, _B2} = protocol:uint8(_B1),
    {ok, {V1_cell_id, V1_flag}};
unpack(srv, 12407, _B0) -> {ok, {}};
unpack(cli, 12407, _B0) ->
    {V1_free_ids, _B4} = protocol:array(_B0,
                                        fun (_B1) ->
                                                {V2_cell_id, _B2} =
                                                    protocol:uint8(_B1),
                                                {{V2_cell_id}, _B2}
                                        end),
    {V1_cells, _B18} = protocol:array(_B4,
                                      fun (_B5) ->
                                              {V2_cell_id, _B6} =
                                                  protocol:uint8(_B5),
                                              {V2_item_base_id, _B7} =
                                                  protocol:uint32(_B6),
                                              {V2_num, _B8} =
                                                  protocol:uint8(_B7),
                                              {V2_price, _B9} =
                                                  protocol:uint32(_B8),
                                              {V2_expiry, _B10} =
                                                  protocol:uint32(_B9),
                                              {V2_item_attrs, _B15} =
                                                  protocol:array(_B10,
                                                                 fun (_B11) ->
                                                                         {V3_attr,
                                                                          _B12} =
                                                                             protocol:uint8(_B11),
                                                                         {V3_value,
                                                                          _B13} =
                                                                             protocol:uint32(_B12),
                                                                         {{V3_attr,
                                                                           V3_value},
                                                                          _B13}
                                                                 end),
                                              {V2_status, _B16} =
                                                  protocol:uint8(_B15),
                                              {{V2_cell_id,
                                                V2_item_base_id,
                                                V2_num,
                                                V2_price,
                                                V2_expiry,
                                                V2_item_attrs,
                                                V2_status},
                                               _B16}
                                      end),
    {ok, {V1_free_ids, V1_cells}};
unpack(srv, 12408, _B0) ->
    {V1_item_base_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_item_base_id}};
unpack(cli, 12408, _B0) ->
    {V1_item_base_id, _B1} = protocol:uint32(_B0),
    {V1_price, _B2} = protocol:uint32(_B1),
    {ok, {V1_item_base_id, V1_price}};
unpack(srv, 12409, _B0) ->
    {V1_refresh_type, _B1} = protocol:uint8(_B0),
    {ok, {V1_refresh_type}};
unpack(cli, 12409, _B0) ->
    {V1_refresh_time, _B1} = protocol:uint32(_B0),
    {V1_data, _B18} = protocol:array(_B1,
                                     fun (_B2) ->
                                             {V2_type, _B3} =
                                                 protocol:uint8(_B2),
                                             {V2_goods, _B16} =
                                                 protocol:array(_B3,
                                                                fun (_B4) ->
                                                                        {V3_id,
                                                                         _B5} =
                                                                            protocol:uint8(_B4),
                                                                        {V3_item_base_id,
                                                                         _B6} =
                                                                            protocol:uint32(_B5),
                                                                        {V3_num,
                                                                         _B7} =
                                                                            protocol:uint8(_B6),
                                                                        {V3_price,
                                                                         _B8} =
                                                                            protocol:uint32(_B7),
                                                                        {V3_status,
                                                                         _B9} =
                                                                            protocol:uint8(_B8),
                                                                        {V3_item_attrs,
                                                                         _B14} =
                                                                            protocol:array(_B9,
                                                                                           fun
                                                                                               (_B10) ->
                                                                                                   {V4_attr,
                                                                                                    _B11} =
                                                                                                       protocol:uint8(_B10),
                                                                                                   {V4_value,
                                                                                                    _B12} =
                                                                                                       protocol:uint32(_B11),
                                                                                                   {{V4_attr,
                                                                                                     V4_value},
                                                                                                    _B12}
                                                                                           end),
                                                                        {{V3_id,
                                                                          V3_item_base_id,
                                                                          V3_num,
                                                                          V3_price,
                                                                          V3_status,
                                                                          V3_item_attrs},
                                                                         _B14}
                                                                end),
                                             {{V2_type, V2_goods}, _B16}
                                     end),
    {ok, {V1_refresh_time, V1_data}};
unpack(srv, 12410, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {V1_page_start, _B2} = protocol:uint8(_B1),
    {V1_page_end, _B3} = protocol:uint8(_B2),
    {ok, {V1_type, V1_page_start, V1_page_end}};
unpack(cli, 12410, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {V1_goods, _B14} = protocol:array(_B1,
                                      fun (_B2) ->
                                              {V2_id, _B3} =
                                                  protocol:uint8(_B2),
                                              {V2_item_base_id, _B4} =
                                                  protocol:uint32(_B3),
                                              {V2_num, _B5} =
                                                  protocol:uint8(_B4),
                                              {V2_price, _B6} =
                                                  protocol:uint32(_B5),
                                              {V2_status, _B7} =
                                                  protocol:uint8(_B6),
                                              {V2_item_attrs, _B12} =
                                                  protocol:array(_B7,
                                                                 fun (_B8) ->
                                                                         {V3_attr,
                                                                          _B9} =
                                                                             protocol:uint8(_B8),
                                                                         {V3_value,
                                                                          _B10} =
                                                                             protocol:uint32(_B9),
                                                                         {{V3_attr,
                                                                           V3_value},
                                                                          _B10}
                                                                 end),
                                              {{V2_id,
                                                V2_item_base_id,
                                                V2_num,
                                                V2_price,
                                                V2_status,
                                                V2_item_attrs},
                                               _B12}
                                      end),
    {ok, {V1_type, V1_goods}};
unpack(srv, 12411, _B0) ->
    {V1_cell_id, _B1} = protocol:uint8(_B0),
    {ok, {V1_cell_id}};
unpack(cli, 12411, _B0) ->
    {V1_cell_id, _B1} = protocol:uint8(_B0),
    {V1_flag, _B2} = protocol:uint8(_B1),
    {ok, {V1_cell_id, V1_flag}};
unpack(srv, 12412, _B0) -> {ok, {}};
unpack(cli, 12412, _B0) ->
    {V1_cell_id, _B1} = protocol:uint8(_B0),
    {V1_flag, _B2} = protocol:uint8(_B1),
    {ok, {V1_cell_id, V1_flag}};
unpack(srv, 12413, _B0) ->
    {V1_cell_id, _B1} = protocol:uint8(_B0),
    {V1_percent, _B2} = protocol:uint32(_B1),
    {V1_num, _B3} = protocol:uint8(_B2),
    {ok, {V1_cell_id, V1_percent, V1_num}};
unpack(cli, 12413, _B0) -> {ok, {}};
unpack(srv, 12414, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {ok, {V1_type}};
unpack(cli, 12414, _B0) -> {ok, {}};
unpack(srv, 12415, _B0) ->
    {V1_item_base_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_item_base_id}};
unpack(cli, 12415, _B0) ->
    {V1_item_base_id, _B1} = protocol:uint32(_B0),
    {V1_price, _B2} = protocol:uint32(_B1),
    {ok, {V1_item_base_id, V1_price}};
unpack(srv, 12416, _B0) ->
    {V1_base_ids, _B4} = protocol:array(_B0,
                                        fun (_B1) ->
                                                {V2_base_id, _B2} =
                                                    protocol:uint32(_B1),
                                                {{V2_base_id}, _B2}
                                        end),
    {ok, {V1_base_ids}};
unpack(cli, 12416, _B0) ->
    {V1_market_price, _B11} = protocol:array(_B0,
                                             fun (_B1) ->
                                                     {V2_source, _B2} =
                                                         protocol:uint8(_B1),
                                                     {V2_base_id, _B3} =
                                                         protocol:uint32(_B2),
                                                     {V2_assets, _B4} =
                                                         protocol:uint32(_B3),
                                                     {V2_price, _B5} =
                                                         protocol:uint32(_B4),
                                                     {V2_val1, _B6} =
                                                         protocol:uint32(_B5),
                                                     {V2_val2, _B7} =
                                                         protocol:uint32(_B6),
                                                     {V2_val3, _B8} =
                                                         protocol:uint32(_B7),
                                                     {V2_val4, _B9} =
                                                         protocol:uint32(_B8),
                                                     {{V2_source,
                                                       V2_base_id,
                                                       V2_assets,
                                                       V2_price,
                                                       V2_val1,
                                                       V2_val2,
                                                       V2_val3,
                                                       V2_val4},
                                                      _B9}
                                             end),
    {ok, {V1_market_price}};
unpack(srv, 12417, _B0) ->
    {V1_base_ids, _B5} = protocol:array(_B0,
                                        fun (_B1) ->
                                                {V2_base_id, _B2} =
                                                    protocol:uint32(_B1),
                                                {V2_num, _B3} =
                                                    protocol:uint32(_B2),
                                                {{V2_base_id, V2_num}, _B3}
                                        end),
    {ok, {V1_base_ids}};
unpack(cli, 12417, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {ok, {V1_flag}};
unpack(srv, 12418, _B0) ->
    {V1_catalg_1, _B1} = protocol:uint32(_B0),
    {V1_catalg_2, _B2} = protocol:uint32(_B1),
    {ok, {V1_catalg_1, V1_catalg_2}};
unpack(cli, 12418, _B0) ->
    {V1_goods, _B7} = protocol:array(_B0,
                                     fun (_B1) ->
                                             {V2_id, _B2} =
                                                 protocol:uint32(_B1),
                                             {V2_base_id, _B3} =
                                                 protocol:uint32(_B2),
                                             {V2_cur_price, _B4} =
                                                 protocol:uint32(_B3),
                                             {V2_margin, _B5} =
                                                 protocol:uint32(_B4),
                                             {{V2_id,
                                               V2_base_id,
                                               V2_cur_price,
                                               V2_margin},
                                              _B5}
                                     end),
    {ok, {V1_goods}};
unpack(srv, 12419, _B0) -> {ok, {}};
unpack(cli, 12419, _B0) -> {ok, {}};
unpack(srv, 12420, _B0) -> {ok, {}};
unpack(cli, 12420, _B0) ->
    {V1_limit_data, _B5} = protocol:array(_B0,
                                          fun (_B1) ->
                                                  {V2_item_id, _B2} =
                                                      protocol:uint32(_B1),
                                                  {V2_count, _B3} =
                                                      protocol:uint32(_B2),
                                                  {{V2_item_id, V2_count}, _B3}
                                          end),
    {ok, {V1_limit_data}};
unpack(srv, 12421, _B0) ->
    {V1_base_ids, _B5} = protocol:array(_B0,
                                        fun (_B1) ->
                                                {V2_base_id, _B2} =
                                                    protocol:uint32(_B1),
                                                {V2_num, _B3} =
                                                    protocol:uint32(_B2),
                                                {{V2_base_id, V2_num}, _B3}
                                        end),
    {V1_id, _B6} = protocol:uint32(_B5),
    {ok, {V1_base_ids, V1_id}};
unpack(cli, 12421, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 12422, _B0) ->
    {V1_base_ids, _B5} = protocol:array(_B0,
                                        fun (_B1) ->
                                                {V2_base_id, _B2} =
                                                    protocol:uint32(_B1),
                                                {V2_num, _B3} =
                                                    protocol:uint32(_B2),
                                                {{V2_base_id, V2_num}, _B3}
                                        end),
    {V1_id, _B6} = protocol:uint32(_B5),
    {ok, {V1_base_ids, V1_id}};
unpack(cli, 12422, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(_Type, Code, _Data) ->
    {error, {unknown_unpack_command, Code}}.

