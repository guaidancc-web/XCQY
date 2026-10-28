-file("src/data/classes_modify_data.erl", 1).

-module(classes_modify_data).

-export([get_cost_price/3,
         get_colddown/1,
         get_wing_skill/1,
         get_item_convert/1]).

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

-file("src/data/classes_modify_data.erl", 16).

get_cost_rate(1, Rate) when Rate =< 0 -> 700;
get_cost_rate(1, Rate) when Rate =< 130 -> 800;
get_cost_rate(1, Rate) when Rate =< 160 -> 850;
get_cost_rate(1, Rate) when Rate =< 180 -> 950;
get_cost_rate(1, Rate) when Rate =< 200 -> 1000;
get_cost_rate(1, Rate) when Rate =< 220 -> 1000;
get_cost_rate(1, Rate) when Rate =< 240 -> 1300;
get_cost_rate(1, Rate) when Rate =< 260 -> 1600;
get_cost_rate(1, Rate) when Rate =< 280 -> 1900;
get_cost_rate(1, Rate) when Rate =< 300 -> 2500;
get_cost_rate(1, Rate) when Rate =< 1000 -> 3500;
get_cost_rate(2, Rate) when Rate =< 0 -> 700;
get_cost_rate(2, Rate) when Rate =< 130 -> 800;
get_cost_rate(2, Rate) when Rate =< 160 -> 850;
get_cost_rate(2, Rate) when Rate =< 180 -> 950;
get_cost_rate(2, Rate) when Rate =< 200 -> 1000;
get_cost_rate(2, Rate) when Rate =< 220 -> 1000;
get_cost_rate(2, Rate) when Rate =< 240 -> 1300;
get_cost_rate(2, Rate) when Rate =< 260 -> 1600;
get_cost_rate(2, Rate) when Rate =< 280 -> 1900;
get_cost_rate(2, Rate) when Rate =< 300 -> 2500;
get_cost_rate(2, Rate) when Rate =< 1000 -> 3500;
get_cost_rate(3, Rate) when Rate =< 0 -> 700;
get_cost_rate(3, Rate) when Rate =< 130 -> 800;
get_cost_rate(3, Rate) when Rate =< 160 -> 850;
get_cost_rate(3, Rate) when Rate =< 180 -> 950;
get_cost_rate(3, Rate) when Rate =< 200 -> 1000;
get_cost_rate(3, Rate) when Rate =< 220 -> 1000;
get_cost_rate(3, Rate) when Rate =< 240 -> 1300;
get_cost_rate(3, Rate) when Rate =< 260 -> 1600;
get_cost_rate(3, Rate) when Rate =< 280 -> 1900;
get_cost_rate(3, Rate) when Rate =< 300 -> 2500;
get_cost_rate(3, Rate) when Rate =< 1000 -> 3500;
get_cost_rate(4, Rate) when Rate =< 0 -> 600;
get_cost_rate(4, Rate) when Rate =< 90 -> 650;
get_cost_rate(4, Rate) when Rate =< 105 -> 700;
get_cost_rate(4, Rate) when Rate =< 120 -> 750;
get_cost_rate(4, Rate) when Rate =< 130 -> 800;
get_cost_rate(4, Rate) when Rate =< 160 -> 850;
get_cost_rate(4, Rate) when Rate =< 180 -> 950;
get_cost_rate(4, Rate) when Rate =< 200 -> 1000;
get_cost_rate(4, Rate) when Rate =< 220 -> 1000;
get_cost_rate(4, Rate) when Rate =< 300 -> 2500;
get_cost_rate(4, Rate) when Rate =< 1000 -> 3500;
get_cost_rate(5, Rate) when Rate =< 0 -> 600;
get_cost_rate(5, Rate) when Rate =< 90 -> 650;
get_cost_rate(5, Rate) when Rate =< 105 -> 700;
get_cost_rate(5, Rate) when Rate =< 120 -> 750;
get_cost_rate(5, Rate) when Rate =< 130 -> 800;
get_cost_rate(5, Rate) when Rate =< 160 -> 850;
get_cost_rate(5, Rate) when Rate =< 180 -> 950;
get_cost_rate(5, Rate) when Rate =< 200 -> 1000;
get_cost_rate(5, Rate) when Rate =< 220 -> 1000;
get_cost_rate(5, Rate) when Rate =< 300 -> 2500;
get_cost_rate(5, Rate) when Rate =< 1000 -> 3500;
get_cost_rate(6, Rate) when Rate =< 0 -> 600;
get_cost_rate(6, Rate) when Rate =< 90 -> 700;
get_cost_rate(6, Rate) when Rate =< 105 -> 800;
get_cost_rate(6, Rate) when Rate =< 120 -> 850;
get_cost_rate(6, Rate) when Rate =< 135 -> 900;
get_cost_rate(6, Rate) when Rate =< 150 -> 1000;
get_cost_rate(6, Rate) when Rate =< 170 -> 1300;
get_cost_rate(6, Rate) when Rate =< 190 -> 1600;
get_cost_rate(6, Rate) when Rate =< 210 -> 1900;
get_cost_rate(6, Rate) when Rate =< 1000 -> 3500;
get_cost_rate(7, Rate) when Rate =< 0 -> 700;
get_cost_rate(7, Rate) when Rate =< 130 -> 800;
get_cost_rate(7, Rate) when Rate =< 160 -> 850;
get_cost_rate(7, Rate) when Rate =< 180 -> 950;
get_cost_rate(7, Rate) when Rate =< 200 -> 1000;
get_cost_rate(7, Rate) when Rate =< 220 -> 1000;
get_cost_rate(7, Rate) when Rate =< 240 -> 1300;
get_cost_rate(7, Rate) when Rate =< 260 -> 1600;
get_cost_rate(7, Rate) when Rate =< 280 -> 1900;
get_cost_rate(7, Rate) when Rate =< 300 -> 2500;
get_cost_rate(7, Rate) when Rate =< 1000 -> 3500;
get_cost_rate(_, _) -> 1000.

get_price(1, Times) when Times =< 1 ->
    {2000, 1190, 18000, 600, 50000, 100000};
get_price(1, Times) when Times =< 2 ->
    {3000, 1190, 18000, 600, 50000, 100000};
get_price(1, Times) when Times =< 3 ->
    {5000, 1190, 18000, 600, 50000, 100000};
get_price(1, Times) when Times =< 4 ->
    {6000, 1190, 18000, 600, 50000, 100000};
get_price(1, Times) when Times =< 5 ->
    {8000, 1190, 18000, 600, 50000, 100000};
get_price(1, Times) when Times =< 9999 ->
    {10000, 1190, 18000, 600, 50000, 100000};
get_price(2, Times) when Times =< 1 ->
    {2000, 1190, 18000, 600, 50000, 100000};
get_price(2, Times) when Times =< 2 ->
    {3000, 1190, 18000, 600, 50000, 100000};
get_price(2, Times) when Times =< 3 ->
    {5000, 1190, 18000, 600, 50000, 100000};
get_price(2, Times) when Times =< 4 ->
    {6000, 1190, 18000, 600, 50000, 100000};
get_price(2, Times) when Times =< 5 ->
    {8000, 1190, 18000, 600, 50000, 100000};
get_price(2, Times) when Times =< 9999 ->
    {10000, 1190, 18000, 600, 50000, 100000};
get_price(3, Times) when Times =< 1 ->
    {2000, 1190, 18000, 600, 50000, 100000};
get_price(3, Times) when Times =< 2 ->
    {3000, 1190, 18000, 600, 50000, 100000};
get_price(3, Times) when Times =< 3 ->
    {5000, 1190, 18000, 600, 50000, 100000};
get_price(3, Times) when Times =< 4 ->
    {6000, 1190, 18000, 600, 50000, 100000};
get_price(3, Times) when Times =< 5 ->
    {8000, 1190, 18000, 600, 50000, 100000};
get_price(3, Times) when Times =< 9999 ->
    {10000, 1190, 18000, 600, 50000, 100000};
get_price(4, Times) when Times =< 1 ->
    {2000, 1190, 18000, 600, 50000, 100000};
get_price(4, Times) when Times =< 2 ->
    {3000, 1190, 18000, 600, 50000, 100000};
get_price(4, Times) when Times =< 3 ->
    {5000, 1190, 18000, 600, 50000, 100000};
get_price(4, Times) when Times =< 4 ->
    {6000, 1190, 18000, 600, 50000, 100000};
get_price(4, Times) when Times =< 5 ->
    {8000, 1190, 18000, 600, 50000, 100000};
get_price(4, Times) when Times =< 9999 ->
    {10000, 1190, 18000, 600, 50000, 100000};
get_price(5, Times) when Times =< 1 ->
    {2000, 1190, 18000, 600, 50000, 100000};
get_price(5, Times) when Times =< 2 ->
    {3000, 1190, 18000, 600, 50000, 100000};
get_price(5, Times) when Times =< 3 ->
    {5000, 1190, 18000, 600, 50000, 100000};
get_price(5, Times) when Times =< 4 ->
    {6000, 1190, 18000, 600, 50000, 100000};
get_price(5, Times) when Times =< 5 ->
    {8000, 1190, 18000, 600, 50000, 100000};
get_price(5, Times) when Times =< 9999 ->
    {10000, 1190, 18000, 600, 50000, 100000};
get_price(6, Times) when Times =< 1 ->
    {2000, 1190, 18000, 600, 50000, 100000};
get_price(6, Times) when Times =< 2 ->
    {3000, 1190, 18000, 600, 50000, 100000};
get_price(6, Times) when Times =< 3 ->
    {5000, 1190, 18000, 600, 50000, 100000};
get_price(6, Times) when Times =< 4 ->
    {6000, 1190, 18000, 600, 50000, 100000};
get_price(6, Times) when Times =< 5 ->
    {8000, 1190, 18000, 600, 50000, 100000};
get_price(6, Times) when Times =< 9999 ->
    {10000, 1190, 18000, 600, 50000, 100000};
get_price(7, Times) when Times =< 1 ->
    {2000, 1190, 18000, 600, 50000, 100000};
get_price(7, Times) when Times =< 2 ->
    {3000, 1190, 18000, 600, 50000, 100000};
get_price(7, Times) when Times =< 3 ->
    {5000, 1190, 18000, 600, 50000, 100000};
get_price(7, Times) when Times =< 4 ->
    {6000, 1190, 18000, 600, 50000, 100000};
get_price(7, Times) when Times =< 5 ->
    {8000, 1190, 18000, 600, 50000, 100000};
get_price(7, Times) when Times =< 9999 ->
    {10000, 1190, 18000, 600, 50000, 100000};
get_price(_, _) -> false.

get_colddown(Times) when Times =< 1 -> 604800;
get_colddown(Times) when Times =< 2 -> 604800;
get_colddown(Times) when Times =< 3 -> 604800;
get_colddown(Times) when Times =< 4 -> 604800;
get_colddown(Times) when Times =< 5 -> 604800;
get_colddown(Times) when Times =< 9999 -> 604800;
get_colddown(_) -> 2592000.

get_wing_skill({1, 2, 88001}) -> 88002;
get_wing_skill({1, 6, 88001}) -> 88002;
get_wing_skill({3, 2, 88001}) -> 88002;
get_wing_skill({3, 6, 88001}) -> 88002;
get_wing_skill({7, 2, 88001}) -> 88002;
get_wing_skill({7, 6, 88001}) -> 88002;
get_wing_skill({2, 1, 88002}) -> 88001;
get_wing_skill({2, 3, 88002}) -> 88001;
get_wing_skill({2, 7, 88002}) -> 88001;
get_wing_skill({6, 1, 88002}) -> 88001;
get_wing_skill({6, 3, 88002}) -> 88001;
get_wing_skill({6, 7, 88002}) -> 88001;
get_wing_skill({1, 2, 88301}) -> 88302;
get_wing_skill({1, 6, 88301}) -> 88302;
get_wing_skill({3, 2, 88301}) -> 88302;
get_wing_skill({3, 6, 88301}) -> 88302;
get_wing_skill({7, 2, 88301}) -> 88302;
get_wing_skill({7, 6, 88301}) -> 88302;
get_wing_skill({2, 1, 88302}) -> 88301;
get_wing_skill({2, 3, 88302}) -> 88301;
get_wing_skill({2, 7, 88302}) -> 88301;
get_wing_skill({6, 1, 88302}) -> 88301;
get_wing_skill({6, 3, 88302}) -> 88301;
get_wing_skill({6, 7, 88302}) -> 88301;
get_wing_skill(_) -> false.

get_item_convert(_) -> false.

get_cost_price(Classes, Times, Rate) ->
    case get_price(Classes, Times) of
        {Price, Min, Max, Gold, GoldBind, GoldBindDeposit} ->
            Ratio = case Rate =:= 1001 of
                        true -> 1000;
                        false -> get_cost_rate(Classes, Rate)
                    end,
            NewPrice = max(min(Max, round(Ratio * Price / 1000)),
                           Min),
            {round(NewPrice * Gold / 1000),
             round(NewPrice * GoldBind / 1000),
             round(NewPrice * GoldBindDeposit / 1000)};
        false -> false
    end.

