-file("src/merge/merge_dets_guild_auction.erl", 1).

-module(merge_dets_guild_auction).

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

-file("src/merge/merge_dets_guild_auction.erl", 14).

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

-file("src/merge/merge_dets_guild_auction.erl", 15).

-file("inc/guild_auction.hrl", 1).

-record(guild_auction,
        {id = {0, "", 0} :: tuple(),
         name = "" :: string(),
         goods = [] :: list(),
         last_goods = [] :: list(),
         next_id = 1 :: non_neg_integer()}).

-record(guild_auction_goods,
        {id = 0 :: non_neg_integer(),
         ver = 0 :: non_neg_integer(),
         item_id = 0 :: non_neg_integer(),
         item_num = 0 :: non_neg_integer(),
         current_price = 0 :: non_neg_integer(),
         max_price = 0 :: non_neg_integer(),
         last_bidden = 0 :: non_neg_integer(),
         bidden = 0 :: non_neg_integer(),
         timeout = 0 :: non_neg_integer(),
         deadline = 0 :: non_neg_integer(),
         status = 0 :: non_neg_integer(),
         added = 0 :: non_neg_integer(),
         start_time = 0 :: non_neg_integer(),
         bidders = [] :: list(),
         subscribers = [] :: list()}).

-record(guild_auction_bidder,
        {id = {0, "", 0} :: tuple(),
         name = "" :: string(),
         classes = 0,
         sex = 0,
         lev = 1,
         price = 0 :: non_neg_integer(),
         loss = [] :: list()}).

-file("src/merge/merge_dets_guild_auction.erl", 16).

do_init(Table = #merge_table{server =
                                 #merge_server{index = Size, size = Size}}) ->
    merge_util:dets_merge(guild_auction,
                          "guild_auction.dets",
                          set,
                          #guild_auction.id,
                          undefined),
    {ok, [], Table};
do_init(Table) -> {ok, [], Table}.

do_convert([], Table) -> {ok, Table}.

do_end(_Table) -> ignore.

