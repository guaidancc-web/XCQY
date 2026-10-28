-file("src/data/checkin_data.erl", 1).

-module(checkin_data).

-export([get_seven_day/1,
         get_everyday/1,
         get_everyday_gold/1,
         get_charge_day/1,
         get_day_charge/1,
         get_rand/1]).

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

-file("src/data/checkin_data.erl", 19).

-file("inc/checkin.hrl", 1).

-record(checkin_everyday,
        {ver = 3,
         last_time = 0 :: non_neg_integer(),
         last_date = {0, 0, 0},
         signed = 0 :: non_neg_integer(),
         log = [],
         add_sign = 0,
         rand_reward = 0,
         rand_num = 0,
         rand_item = [],
         continue_num = 0}).

-record(m_checkin,
        {ver = 3,
         seven_day = [],
         everyday = #checkin_everyday{},
         charge_day = []}).

-record(checkin_rand_data,
        {id = 0,
         item_id = 0,
         bind = 0,
         num = 0,
         weigth = 0,
         is_cast = 0}).

-file("src/data/checkin_data.erl", 20).

get_seven_day(1) ->
    [{20006, 20, 0, 2, 0}, {20000, 1, 0, 2, 0}];
get_seven_day(2) ->
    [{21202, 1, 0, 2, 0}, {20034, 3, 0, 2, 0}];
get_seven_day(3) ->
    [{21100, 1, 0, 2, 0}, {20039, 2, 0, 2, 0}];
get_seven_day(4) ->
    [{20525, 2, 1, 1, 0},
     {20526, 2, 2, 1, 0},
     {20527, 2, 3, 1, 0},
     {20528, 2, 4, 1, 0},
     {20529, 2, 5, 1, 0},
     {21852, 2, 6, 1, 0},
     {21962, 2, 7, 1, 0},
     {23525, 2, 1, 0, 0},
     {23526, 2, 2, 0, 0},
     {23527, 2, 3, 0, 0},
     {23528, 2, 4, 0, 0},
     {23529, 2, 5, 0, 0},
     {21853, 2, 6, 0, 0},
     {21963, 2, 7, 0, 0},
     {20020, 5, 0, 2, 0}];
get_seven_day(5) ->
    [{20073, 1, 0, 2, 0}, {20002, 2, 0, 2, 0}];
get_seven_day(6) ->
    [{21100, 2, 0, 2, 0}, {20005, 3, 0, 2, 0}];
get_seven_day(7) ->
    [{20053, 1, 0, 2, 0},
     {20530, 2, 1, 1, 0},
     {20531, 2, 2, 1, 0},
     {20532, 2, 3, 1, 0},
     {20533, 2, 4, 1, 0},
     {20534, 2, 5, 1, 0},
     {21854, 2, 6, 1, 0},
     {21964, 2, 7, 1, 0},
     {23530, 2, 1, 0, 0},
     {23531, 2, 2, 0, 0},
     {23532, 2, 3, 0, 0},
     {23533, 2, 4, 0, 0},
     {23534, 2, 5, 0, 0},
     {21855, 2, 6, 0, 0},
     {21965, 2, 7, 0, 0}];
get_seven_day(8) ->
    [{23162, 1, 0, 2, 0}, {28607, 1, 0, 2, 0}];
get_seven_day(_Id) -> none.

get_everyday(1) -> [{90000, 250000}];
get_everyday(2) -> [{20006, 10}];
get_everyday(3) -> [{20007, 1}];
get_everyday(4) -> [{20025, 2}];
get_everyday(5) -> [{0, 1}];
get_everyday(6) -> [{90000, 300000}];
get_everyday(7) -> [{20006, 15}];
get_everyday(8) -> [{20007, 1}];
get_everyday(9) -> [{22532, 1}];
get_everyday(10) -> [{0, 1}];
get_everyday(11) -> [{90000, 350000}];
get_everyday(12) -> [{20006, 20}];
get_everyday(13) -> [{20007, 2}];
get_everyday(14) -> [{20025, 2}];
get_everyday(15) -> [{0, 1}];
get_everyday(16) -> [{90000, 400000}];
get_everyday(17) -> [{20006, 20}];
get_everyday(18) -> [{20007, 2}];
get_everyday(19) -> [{20075, 1}];
get_everyday(20) -> [{0, 1}];
get_everyday(21) -> [{90000, 500000}];
get_everyday(22) -> [{20006, 25}];
get_everyday(23) -> [{20007, 2}];
get_everyday(24) -> [{20025, 3}];
get_everyday(25) -> [{0, 1}];
get_everyday(26) -> [{90000, 600000}];
get_everyday(27) -> [{20006, 25}];
get_everyday(28) -> [{20011, 1}];
get_everyday(29) -> [{20617, 1}];
get_everyday(30) -> [{0, 1}];
get_everyday(31) -> [{90000, 800000}];
get_everyday(_Id) -> none.

get_everyday_gold(1) -> 1;
get_everyday_gold(2) -> 1;
get_everyday_gold(3) -> 1;
get_everyday_gold(4) -> 1;
get_everyday_gold(5) -> 1;
get_everyday_gold(6) -> 1;
get_everyday_gold(7) -> 1;
get_everyday_gold(8) -> 1;
get_everyday_gold(9) -> 1;
get_everyday_gold(10) -> 1;
get_everyday_gold(11) -> 1;
get_everyday_gold(12) -> 1;
get_everyday_gold(13) -> 1;
get_everyday_gold(14) -> 1;
get_everyday_gold(15) -> 1;
get_everyday_gold(16) -> 1;
get_everyday_gold(17) -> 1;
get_everyday_gold(18) -> 1;
get_everyday_gold(19) -> 1;
get_everyday_gold(20) -> 1;
get_everyday_gold(21) -> 1;
get_everyday_gold(22) -> 1;
get_everyday_gold(23) -> 1;
get_everyday_gold(24) -> 1;
get_everyday_gold(25) -> 1;
get_everyday_gold(26) -> 1;
get_everyday_gold(27) -> 1;
get_everyday_gold(28) -> 1;
get_everyday_gold(29) -> 1980;
get_everyday_gold(30) -> 1;
get_everyday_gold(31) -> 1;
get_everyday_gold(_) -> 0.

get_charge_day(1) ->
    {1, 80, [{20034, 1}, {20006, 8}, {20005, 1}]};
get_charge_day(2) ->
    {1, 300, [{20000, 1}, {20006, 20}, {20005, 2}]};
get_charge_day(3) ->
    {1,
     980,
     [{29008, 1}, {20002, 1}, {20007, 2}, {20025, 2}]};
get_charge_day(4) ->
    {1,
     1980,
     [{20545, 1}, {22585, 1}, {20006, 30}, {20019, 5}]};
get_charge_day(5) ->
    {1,
     2980,
     [{20616, 1}, {20087, 1}, {20006, 30}, {20005, 3}]};
get_charge_day(6) ->
    {1,
     5000,
     [{29422, 1},
      {22617, 1},
      {20075, 1},
      {20039, 1},
      {29103, 5}]};
get_charge_day(7) ->
    {2, 80, [{20025, 1}, {20006, 8}, {20005, 1}]};
get_charge_day(8) ->
    {2, 300, [{20000, 1}, {20006, 20}, {20005, 2}]};
get_charge_day(9) ->
    {2,
     980,
     [{29008, 1}, {20002, 1}, {20007, 2}, {20025, 2}]};
get_charge_day(10) ->
    {2,
     1980,
     [{20046, 1}, {20505, 1}, {20025, 2}, {20006, 30}]};
get_charge_day(11) ->
    {2,
     2980,
     [{22216, 1}, {20061, 1}, {21433, 2}, {20005, 3}]};
get_charge_day(12) ->
    {2,
     5000,
     [{22617, 1},
      {29440, 1},
      {20505, 1},
      {20601, 1},
      {29102, 2}]};
get_charge_day(13) ->
    {3, 80, [{90000, 100000}, {20006, 8}, {20005, 1}]};
get_charge_day(14) ->
    {3, 300, [{20021, 2}, {20006, 20}, {90011, 200}]};
get_charge_day(15) ->
    {3,
     980,
     [{29008, 1}, {20002, 1}, {20007, 2}, {20025, 2}]};
get_charge_day(16) ->
    {3,
     1980,
     [{20046, 1}, {20505, 1}, {20025, 2}, {20006, 30}]};
get_charge_day(17) ->
    {3,
     2980,
     [{28607, 1}, {20545, 1}, {20000, 2}, {20005, 3}]};
get_charge_day(18) ->
    {3, 5000, [{29360, 1}, {20038, 1}, {20505, 1}]};
get_charge_day(19) ->
    {4, 80, [{20002, 1}, {20020, 3}, {20005, 1}]};
get_charge_day(20) ->
    {4, 300, [{20021, 2}, {20020, 5}, {90000, 300000}]};
get_charge_day(21) ->
    {4,
     980,
     [{20008, 2}, {20020, 8}, {20013, 1}, {20005, 3}]};
get_charge_day(22) ->
    {4,
     1980,
     [{20009, 1}, {20022, 1}, {20020, 10}, {90000, 500000}]};
get_charge_day(23) ->
    {4,
     2980,
     [{20010, 1}, {20022, 1}, {20505, 1}, {20020, 12}]};
get_charge_day(24) ->
    {4,
     5000,
     [{21723, 1},
      {20053, 1},
      {22617, 1},
      {20505, 1},
      {20005, 5}]};
get_charge_day(25) ->
    {5, 80, [{20025, 1}, {20006, 8}, {20005, 1}]};
get_charge_day(26) ->
    {5, 300, [{20000, 1}, {20006, 20}, {20005, 2}]};
get_charge_day(27) ->
    {5,
     980,
     [{29008, 1}, {20002, 1}, {20007, 2}, {20025, 2}]};
get_charge_day(28) ->
    {5,
     1980,
     [{20046, 1}, {20505, 1}, {20025, 2}, {20006, 30}]};
get_charge_day(29) ->
    {5,
     2980,
     [{20028, 1}, {20061, 1}, {21433, 2}, {20005, 3}]};
get_charge_day(30) ->
    {5, 5000, [{29384, 1}, {20505, 1}, {20087, 2}]};
get_charge_day(31) ->
    {6, 80, [{20021, 2}, {20006, 20}, {90011, 200}]};
get_charge_day(32) ->
    {6,
     300,
     [{29008, 1}, {20002, 1}, {20007, 2}, {20025, 2}]};
get_charge_day(33) ->
    {6,
     980,
     [{21100, 1}, {20000, 1}, {20545, 1}, {20006, 20}]};
get_charge_day(34) ->
    {6,
     1980,
     [{29100, 1}, {20505, 1}, {20025, 2}, {20006, 30}]};
get_charge_day(35) ->
    {6,
     2980,
     [{20617, 1}, {29008, 2}, {22585, 1}, {29102, 2}]};
get_charge_day(36) ->
    {6,
     5000,
     [{21724, 1}, {20076, 2}, {22617, 1}, {20505, 1}]};
get_charge_day(37) ->
    {7, 80, [{20000, 1}, {20006, 20}, {20005, 2}]};
get_charge_day(38) ->
    {7,
     300,
     [{29008, 1}, {20002, 1}, {20007, 2}, {20025, 2}]};
get_charge_day(39) ->
    {7,
     980,
     [{20545, 1}, {22585, 1}, {20006, 30}, {20019, 5}]};
get_charge_day(40) ->
    {7,
     1980,
     [{20616, 1}, {20087, 1}, {20006, 30}, {20005, 3}]};
get_charge_day(41) ->
    {7,
     2980,
     [{22301, 1}, {22617, 1}, {22219, 3}, {20005, 5}]};
get_charge_day(42) ->
    {7, 5000, [{29351, 1}, {20505, 1}, {20087, 2}]};
get_charge_day(_) -> none.

get_day_charge(1) -> [1, 2, 3, 4, 5, 6];
get_day_charge(2) -> [7, 8, 9, 10, 11, 12];
get_day_charge(3) -> [13, 14, 15, 16, 17, 18];
get_day_charge(4) -> [19, 20, 21, 22, 23, 24];
get_day_charge(5) -> [25, 26, 27, 28, 29, 30];
get_day_charge(6) -> [31, 32, 33, 34, 35, 36];
get_day_charge(7) -> [37, 38, 39, 40, 41, 42];
get_day_charge(_) -> [].

get_rand(1) ->
    #checkin_rand_data{id = 1, item_id = 20061, bind = 0,
                       num = 2, weigth = 500};
get_rand(2) ->
    #checkin_rand_data{id = 2, item_id = 20038, bind = 0,
                       num = 1, weigth = 500};
get_rand(3) ->
    #checkin_rand_data{id = 3, item_id = 20545, bind = 0,
                       num = 1, weigth = 500};
get_rand(4) ->
    #checkin_rand_data{id = 4, item_id = 20616, bind = 0,
                       num = 1, weigth = 500};
get_rand(5) ->
    #checkin_rand_data{id = 5, item_id = 20075, bind = 0,
                       num = 1, weigth = 500};
get_rand(6) ->
    #checkin_rand_data{id = 6, item_id = 20053, bind = 0,
                       num = 1, weigth = 500};
get_rand(7) ->
    #checkin_rand_data{id = 7, item_id = 22300, bind = 0,
                       num = 1, weigth = 500};
get_rand(8) ->
    #checkin_rand_data{id = 8, item_id = 20095, bind = 0,
                       num = 1, weigth = 500};
get_rand(9) ->
    #checkin_rand_data{id = 9, item_id = 23740, bind = 0,
                       num = 1, weigth = 500};
get_rand(10) ->
    #checkin_rand_data{id = 10, item_id = 20087, bind = 0,
                       num = 2, weigth = 500};
get_rand(11) ->
    #checkin_rand_data{id = 11, item_id = 20036, bind = 0,
                       num = 1, weigth = 500};
get_rand(12) ->
    #checkin_rand_data{id = 12, item_id = 20040, bind = 0,
                       num = 1, weigth = 500};
get_rand(13) ->
    #checkin_rand_data{id = 13, item_id = 22585, bind = 0,
                       num = 2, weigth = 500};
get_rand(14) ->
    #checkin_rand_data{id = 14, item_id = 20046, bind = 0,
                       num = 2, weigth = 500};
get_rand(15) ->
    #checkin_rand_data{id = 15, item_id = 21102, bind = 0,
                       num = 1, weigth = 500};
get_rand(16) ->
    #checkin_rand_data{id = 16, item_id = 21101, bind = 0,
                       num = 1, weigth = 500};
get_rand(17) ->
    #checkin_rand_data{id = 17, item_id = 29041, bind = 0,
                       num = 1, weigth = 500};
get_rand(_) -> false.

