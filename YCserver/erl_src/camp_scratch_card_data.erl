-file("src/data/camp_scratch_card_data.erl", 1).

-module(camp_scratch_card_data).

-export([get_config/0, get_reward/0]).

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

-file("src/data/camp_scratch_card_data.erl", 15).

-file("inc/camp_scratch_card.hrl", 1).

-author("Suhan").

-record(m_camp_scratch_card,
        {camp_id = 0, first_items = [], items = []}).

-record(camp_scratch_card_data,
        {item_id, bind, num, weight}).

-file("src/data/camp_scratch_card_data.erl", 16).

get_config() -> [71385].

get_reward() ->
    [#camp_scratch_card_data{item_id = 71386, bind = 0,
                             num = 1, weight = 58},
     #camp_scratch_card_data{item_id = 71387, bind = 0,
                             num = 1, weight = 60},
     #camp_scratch_card_data{item_id = 71388, bind = 0,
                             num = 1, weight = 88},
     #camp_scratch_card_data{item_id = 71389, bind = 0,
                             num = 1, weight = 88},
     #camp_scratch_card_data{item_id = 71390, bind = 0,
                             num = 1, weight = 353},
     #camp_scratch_card_data{item_id = 71391, bind = 0,
                             num = 1, weight = 353}].

