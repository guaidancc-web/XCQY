-file("src/data/exchange_data.erl", 1).

-module(exchange_data).

-export([const_exchange/1, get_gift_ratio/1]).

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

-file("src/data/exchange_data.erl", 18).

const_exchange(1) -> {60, gold_bind, 3000, 0};
const_exchange(2) -> {160, gold_bind, 8000, 0};
const_exchange(3) -> {320, gold_bind, 16000, 0};
const_exchange(4) -> {640, gold_bind, 32000, 0};
const_exchange(5) -> {1280, gold_bind, 64000, 0};
const_exchange(6) -> {2560, gold_bind, 128000, 0};
const_exchange(7) -> {60, coin, 300000, 0};
const_exchange(8) -> {160, coin, 800000, 0};
const_exchange(9) -> {320, coin, 1600000, 0};
const_exchange(10) -> {640, coin, 3200000, 0};
const_exchange(11) -> {1280, coin, 6400000, 0};
const_exchange(12) -> {2560, coin, 12800000, 0};
const_exchange(_Id) -> false.

get_gift_ratio({6, Lev}) when Lev >= 130 -> 600;
get_gift_ratio({6, Lev}) when Lev >= 125 -> 575;
get_gift_ratio({6, Lev}) when Lev >= 120 -> 550;
get_gift_ratio({6, Lev}) when Lev >= 115 -> 525;
get_gift_ratio({6, Lev}) when Lev >= 110 -> 500;
get_gift_ratio({6, Lev}) when Lev >= 105 -> 475;
get_gift_ratio({6, Lev}) when Lev >= 100 -> 450;
get_gift_ratio({6, Lev}) when Lev >= 95 -> 425;
get_gift_ratio({6, Lev}) when Lev >= 90 -> 400;
get_gift_ratio({6, Lev}) when Lev >= 85 -> 375;
get_gift_ratio({6, Lev}) when Lev >= 80 -> 350;
get_gift_ratio({6, Lev}) when Lev >= 75 -> 325;
get_gift_ratio({6, Lev}) when Lev >= 70 -> 300;
get_gift_ratio({6, Lev}) when Lev >= 65 -> 275;
get_gift_ratio({6, Lev}) when Lev >= 1 -> 200;
get_gift_ratio({5, Lev}) when Lev >= 130 -> 550;
get_gift_ratio({5, Lev}) when Lev >= 125 -> 525;
get_gift_ratio({5, Lev}) when Lev >= 120 -> 500;
get_gift_ratio({5, Lev}) when Lev >= 115 -> 475;
get_gift_ratio({5, Lev}) when Lev >= 110 -> 450;
get_gift_ratio({5, Lev}) when Lev >= 105 -> 425;
get_gift_ratio({5, Lev}) when Lev >= 100 -> 400;
get_gift_ratio({5, Lev}) when Lev >= 95 -> 375;
get_gift_ratio({5, Lev}) when Lev >= 90 -> 350;
get_gift_ratio({5, Lev}) when Lev >= 85 -> 325;
get_gift_ratio({5, Lev}) when Lev >= 80 -> 300;
get_gift_ratio({5, Lev}) when Lev >= 75 -> 275;
get_gift_ratio({5, Lev}) when Lev >= 70 -> 250;
get_gift_ratio({5, Lev}) when Lev >= 65 -> 225;
get_gift_ratio({5, Lev}) when Lev >= 1 -> 150;
get_gift_ratio({4, Lev}) when Lev >= 130 -> 500;
get_gift_ratio({4, Lev}) when Lev >= 125 -> 475;
get_gift_ratio({4, Lev}) when Lev >= 120 -> 450;
get_gift_ratio({4, Lev}) when Lev >= 115 -> 425;
get_gift_ratio({4, Lev}) when Lev >= 110 -> 400;
get_gift_ratio({4, Lev}) when Lev >= 105 -> 375;
get_gift_ratio({4, Lev}) when Lev >= 100 -> 350;
get_gift_ratio({4, Lev}) when Lev >= 95 -> 325;
get_gift_ratio({4, Lev}) when Lev >= 90 -> 300;
get_gift_ratio({4, Lev}) when Lev >= 85 -> 275;
get_gift_ratio({4, Lev}) when Lev >= 80 -> 250;
get_gift_ratio({4, Lev}) when Lev >= 75 -> 225;
get_gift_ratio({4, Lev}) when Lev >= 70 -> 200;
get_gift_ratio({4, Lev}) when Lev >= 65 -> 175;
get_gift_ratio({4, Lev}) when Lev >= 1 -> 100;
get_gift_ratio({3, Lev}) when Lev >= 130 -> 450;
get_gift_ratio({3, Lev}) when Lev >= 125 -> 425;
get_gift_ratio({3, Lev}) when Lev >= 120 -> 400;
get_gift_ratio({3, Lev}) when Lev >= 115 -> 375;
get_gift_ratio({3, Lev}) when Lev >= 110 -> 350;
get_gift_ratio({3, Lev}) when Lev >= 105 -> 325;
get_gift_ratio({3, Lev}) when Lev >= 100 -> 300;
get_gift_ratio({3, Lev}) when Lev >= 95 -> 275;
get_gift_ratio({3, Lev}) when Lev >= 90 -> 250;
get_gift_ratio({3, Lev}) when Lev >= 85 -> 225;
get_gift_ratio({3, Lev}) when Lev >= 80 -> 200;
get_gift_ratio({3, Lev}) when Lev >= 75 -> 175;
get_gift_ratio({3, Lev}) when Lev >= 70 -> 150;
get_gift_ratio({3, Lev}) when Lev >= 65 -> 125;
get_gift_ratio({3, Lev}) when Lev >= 1 -> 50;
get_gift_ratio({2, Lev}) when Lev >= 130 -> 400;
get_gift_ratio({2, Lev}) when Lev >= 125 -> 375;
get_gift_ratio({2, Lev}) when Lev >= 120 -> 350;
get_gift_ratio({2, Lev}) when Lev >= 115 -> 325;
get_gift_ratio({2, Lev}) when Lev >= 110 -> 300;
get_gift_ratio({2, Lev}) when Lev >= 105 -> 275;
get_gift_ratio({2, Lev}) when Lev >= 100 -> 250;
get_gift_ratio({2, Lev}) when Lev >= 95 -> 225;
get_gift_ratio({2, Lev}) when Lev >= 90 -> 200;
get_gift_ratio({2, Lev}) when Lev >= 85 -> 175;
get_gift_ratio({2, Lev}) when Lev >= 80 -> 150;
get_gift_ratio({2, Lev}) when Lev >= 75 -> 125;
get_gift_ratio({2, Lev}) when Lev >= 70 -> 100;
get_gift_ratio({2, Lev}) when Lev >= 65 -> 75;
get_gift_ratio({2, Lev}) when Lev >= 1 -> 0;
get_gift_ratio({12, Lev}) when Lev >= 130 -> 600;
get_gift_ratio({12, Lev}) when Lev >= 125 -> 575;
get_gift_ratio({12, Lev}) when Lev >= 120 -> 550;
get_gift_ratio({12, Lev}) when Lev >= 115 -> 525;
get_gift_ratio({12, Lev}) when Lev >= 110 -> 500;
get_gift_ratio({12, Lev}) when Lev >= 105 -> 475;
get_gift_ratio({12, Lev}) when Lev >= 100 -> 450;
get_gift_ratio({12, Lev}) when Lev >= 95 -> 425;
get_gift_ratio({12, Lev}) when Lev >= 90 -> 400;
get_gift_ratio({12, Lev}) when Lev >= 85 -> 375;
get_gift_ratio({12, Lev}) when Lev >= 80 -> 350;
get_gift_ratio({12, Lev}) when Lev >= 75 -> 325;
get_gift_ratio({12, Lev}) when Lev >= 70 -> 300;
get_gift_ratio({12, Lev}) when Lev >= 65 -> 275;
get_gift_ratio({12, Lev}) when Lev >= 1 -> 200;
get_gift_ratio({11, Lev}) when Lev >= 130 -> 550;
get_gift_ratio({11, Lev}) when Lev >= 125 -> 525;
get_gift_ratio({11, Lev}) when Lev >= 120 -> 500;
get_gift_ratio({11, Lev}) when Lev >= 115 -> 475;
get_gift_ratio({11, Lev}) when Lev >= 110 -> 450;
get_gift_ratio({11, Lev}) when Lev >= 105 -> 425;
get_gift_ratio({11, Lev}) when Lev >= 100 -> 400;
get_gift_ratio({11, Lev}) when Lev >= 95 -> 375;
get_gift_ratio({11, Lev}) when Lev >= 90 -> 350;
get_gift_ratio({11, Lev}) when Lev >= 85 -> 325;
get_gift_ratio({11, Lev}) when Lev >= 80 -> 300;
get_gift_ratio({11, Lev}) when Lev >= 75 -> 275;
get_gift_ratio({11, Lev}) when Lev >= 70 -> 250;
get_gift_ratio({11, Lev}) when Lev >= 65 -> 225;
get_gift_ratio({11, Lev}) when Lev >= 1 -> 150;
get_gift_ratio({10, Lev}) when Lev >= 130 -> 500;
get_gift_ratio({10, Lev}) when Lev >= 125 -> 475;
get_gift_ratio({10, Lev}) when Lev >= 120 -> 450;
get_gift_ratio({10, Lev}) when Lev >= 115 -> 425;
get_gift_ratio({10, Lev}) when Lev >= 110 -> 400;
get_gift_ratio({10, Lev}) when Lev >= 105 -> 375;
get_gift_ratio({10, Lev}) when Lev >= 100 -> 350;
get_gift_ratio({10, Lev}) when Lev >= 95 -> 325;
get_gift_ratio({10, Lev}) when Lev >= 90 -> 300;
get_gift_ratio({10, Lev}) when Lev >= 85 -> 275;
get_gift_ratio({10, Lev}) when Lev >= 80 -> 250;
get_gift_ratio({10, Lev}) when Lev >= 75 -> 225;
get_gift_ratio({10, Lev}) when Lev >= 70 -> 200;
get_gift_ratio({10, Lev}) when Lev >= 65 -> 175;
get_gift_ratio({10, Lev}) when Lev >= 1 -> 100;
get_gift_ratio({9, Lev}) when Lev >= 130 -> 450;
get_gift_ratio({9, Lev}) when Lev >= 125 -> 425;
get_gift_ratio({9, Lev}) when Lev >= 120 -> 400;
get_gift_ratio({9, Lev}) when Lev >= 115 -> 375;
get_gift_ratio({9, Lev}) when Lev >= 110 -> 350;
get_gift_ratio({9, Lev}) when Lev >= 105 -> 325;
get_gift_ratio({9, Lev}) when Lev >= 100 -> 300;
get_gift_ratio({9, Lev}) when Lev >= 95 -> 275;
get_gift_ratio({9, Lev}) when Lev >= 90 -> 250;
get_gift_ratio({9, Lev}) when Lev >= 85 -> 225;
get_gift_ratio({9, Lev}) when Lev >= 80 -> 200;
get_gift_ratio({9, Lev}) when Lev >= 75 -> 175;
get_gift_ratio({9, Lev}) when Lev >= 70 -> 150;
get_gift_ratio({9, Lev}) when Lev >= 65 -> 125;
get_gift_ratio({9, Lev}) when Lev >= 1 -> 50;
get_gift_ratio({8, Lev}) when Lev >= 130 -> 400;
get_gift_ratio({8, Lev}) when Lev >= 125 -> 375;
get_gift_ratio({8, Lev}) when Lev >= 120 -> 350;
get_gift_ratio({8, Lev}) when Lev >= 115 -> 325;
get_gift_ratio({8, Lev}) when Lev >= 110 -> 300;
get_gift_ratio({8, Lev}) when Lev >= 105 -> 275;
get_gift_ratio({8, Lev}) when Lev >= 100 -> 250;
get_gift_ratio({8, Lev}) when Lev >= 95 -> 225;
get_gift_ratio({8, Lev}) when Lev >= 90 -> 200;
get_gift_ratio({8, Lev}) when Lev >= 85 -> 175;
get_gift_ratio({8, Lev}) when Lev >= 80 -> 150;
get_gift_ratio({8, Lev}) when Lev >= 75 -> 125;
get_gift_ratio({8, Lev}) when Lev >= 70 -> 100;
get_gift_ratio({8, Lev}) when Lev >= 65 -> 75;
get_gift_ratio({8, Lev}) when Lev >= 1 -> 0;
get_gift_ratio(_) -> 0.

