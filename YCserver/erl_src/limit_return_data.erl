-file("src/data/limit_return_data.erl", 1).

-module(limit_return_data).

-export([get/1,
         get_return/1,
         get_type/1,
         groups/0,
         get_group/1,
         get_extra_rand/1,
         get_num/1]).

-file("inc/limit_return.hrl", 1).

-record(limit_return_server, {white = [], black = []}).

-record(m_limit_return,
        {ver = 1,
         flag = 0,
         login_time = 0,
         check_time = 0,
         start_time = 0,
         keep_time = 0,
         pay_time = 0,
         end_time = 0,
         check_time_list = [],
         acc = 0,
         return = 0,
         num = 0}).

-file("src/data/limit_return_data.erl", 21).

groups() -> [1, 999].

get_group(1) ->
    #limit_return_server{white = [{"mix", -1, ""}]};
get_group(999) -> #limit_return_server{};
get_group(_) -> false.

get({999, 1}) -> 150;
get({999, 2}) -> 300;
get({999, 3}) -> 450;
get({999, 4}) -> 550;
get({999, 5}) -> 700;
get({999, 6}) -> 850;
get({999, 7}) -> 1000;
get({1, 1}) -> 150;
get({1, 2}) -> 300;
get({1, 3}) -> 450;
get({1, 4}) -> 550;
get({1, 5}) -> 700;
get({1, 6}) -> 850;
get({1, 7}) -> 1000;
get(_) -> 0.

get_extra_rand({999, 1}) -> 0;
get_extra_rand({999, 2}) -> 0;
get_extra_rand({999, 3}) -> 0;
get_extra_rand({999, 4}) -> 0;
get_extra_rand({999, 5}) -> 0;
get_extra_rand({999, 6}) -> 300;
get_extra_rand({999, 7}) -> 1000;
get_extra_rand({1, 1}) -> 0;
get_extra_rand({1, 2}) -> 0;
get_extra_rand({1, 3}) -> 0;
get_extra_rand({1, 4}) -> 0;
get_extra_rand({1, 5}) -> 0;
get_extra_rand({1, 6}) -> 300;
get_extra_rand({1, 7}) -> 1000;
get_extra_rand(_) -> 0.

get_return({999, 0}) -> [{300, 1000}];
get_return({999, 1}) -> [{300, 1000}];
get_return({999, 2}) -> [{300, 1000}];
get_return({999, 3}) -> [{300, 1000}];
get_return({999, 4}) -> [{300, 1000}];
get_return({999, 5}) -> [{300, 1000}];
get_return({999, 6}) -> [{300, 1000}];
get_return({999, 7}) -> [{300, 1000}];
get_return({999, 8}) -> [{300, 1000}];
get_return({999, 9}) -> [{300, 1000}];
get_return({999, 10}) -> [{300, 1000}];
get_return({999, 11}) -> [{300, 1000}];
get_return({999, 12}) -> [{300, 1000}];
get_return({999, 13}) -> [{300, 1000}];
get_return({999, 14}) -> [{300, 1000}];
get_return({999, 15}) -> [{300, 1000}];
get_return({999, 16}) -> [{300, 1000}];
get_return({999, 17}) -> [{300, 1000}];
get_return({999, 18}) -> [{300, 1000}];
get_return({999, 19}) -> [{300, 1000}];
get_return({999, 20}) -> [{300, 1000}];
get_return({999, 21}) -> [{300, 1000}];
get_return({999, 22}) -> [{300, 1000}];
get_return({999, 23}) -> [{300, 1000}];
get_return({999, 24}) -> [{300, 1000}];
get_return({999, 25}) -> [{300, 1000}];
get_return({999, 26}) -> [{300, 1000}];
get_return({999, 27}) -> [{300, 1000}];
get_return({999, 28}) -> [{300, 1000}];
get_return({999, 29}) -> [{300, 1000}];
get_return({999, 30}) -> [{300, 1000}];
get_return({999, 31}) -> [{300, 1000}];
get_return({999, 32}) -> [{300, 1000}];
get_return({999, 33}) -> [{300, 1000}];
get_return({999, 34}) -> [{300, 1000}];
get_return({999, 35}) -> [{300, 1000}];
get_return({999, 36}) -> [{300, 1000}];
get_return({999, 37}) -> [{300, 1000}];
get_return({999, 38}) -> [{300, 1000}];
get_return({999, 39}) -> [{300, 1000}];
get_return({999, 40}) -> [{300, 1000}];
get_return({999, 41}) -> [{300, 1000}];
get_return({999, 42}) -> [{300, 1000}];
get_return({999, 43}) -> [{300, 1000}];
get_return({999, 44}) -> [{300, 1000}];
get_return({999, 45}) -> [{300, 1000}];
get_return({999, 46}) -> [{300, 1000}];
get_return({999, 47}) -> [{300, 1000}];
get_return({999, 48}) -> [{300, 1000}];
get_return({999, 49}) -> [{300, 1000}];
get_return({999, 50}) -> [{300, 1000}];
get_return({999, 51}) -> [{300, 1000}];
get_return({999, 52}) -> [{300, 1000}];
get_return({999, 53}) -> [{300, 1000}];
get_return({999, 54}) -> [{300, 1000}];
get_return({999, 55}) -> [{300, 1000}];
get_return({1, 0}) -> [{300, 1000}];
get_return({1, 1}) -> [{300, 1000}];
get_return({1, 2}) -> [{300, 1000}];
get_return({1, 3}) -> [{300, 1000}];
get_return({1, 4}) -> [{300, 1000}];
get_return({1, 5}) -> [{300, 1000}];
get_return({1, 6}) -> [{300, 1000}];
get_return({1, 7}) -> [{300, 1000}];
get_return({1, 8}) -> [{300, 1000}];
get_return({1, 9}) -> [{300, 1000}];
get_return({1, 10}) -> [{300, 1000}];
get_return({1, 11}) -> [{300, 1000}];
get_return({1, 12}) -> [{300, 1000}];
get_return({1, 13}) -> [{300, 1000}];
get_return({1, 14}) -> [{300, 1000}];
get_return({1, 15}) -> [{300, 1000}];
get_return({1, 16}) -> [{300, 1000}];
get_return({1, 17}) -> [{300, 1000}];
get_return({1, 18}) -> [{300, 1000}];
get_return({1, 19}) -> [{300, 1000}];
get_return({1, 20}) -> [{300, 1000}];
get_return({1, 21}) -> [{300, 1000}];
get_return({1, 22}) -> [{300, 1000}];
get_return({1, 23}) -> [{300, 1000}];
get_return({1, 24}) -> [{300, 1000}];
get_return({1, 25}) -> [{300, 1000}];
get_return({1, 26}) -> [{300, 1000}];
get_return({1, 27}) -> [{300, 1000}];
get_return({1, 28}) -> [{300, 1000}];
get_return({1, 29}) -> [{300, 1000}];
get_return({1, 30}) -> [{300, 1000}];
get_return({1, 31}) -> [{300, 1000}];
get_return({1, 32}) -> [{300, 1000}];
get_return({1, 33}) -> [{300, 1000}];
get_return({1, 34}) -> [{300, 1000}];
get_return({1, 35}) -> [{300, 1000}];
get_return({1, 36}) -> [{300, 1000}];
get_return({1, 37}) -> [{300, 1000}];
get_return({1, 38}) -> [{300, 1000}];
get_return({1, 39}) -> [{300, 1000}];
get_return({1, 40}) -> [{300, 1000}];
get_return({1, 41}) -> [{300, 1000}];
get_return({1, 42}) -> [{300, 1000}];
get_return({1, 43}) -> [{300, 1000}];
get_return({1, 44}) -> [{300, 1000}];
get_return({1, 45}) -> [{300, 1000}];
get_return({1, 46}) -> [{300, 1000}];
get_return({1, 47}) -> [{300, 1000}];
get_return({1, 48}) -> [{300, 1000}];
get_return({1, 49}) -> [{300, 1000}];
get_return({1, 50}) -> [{300, 1000}];
get_return({1, 51}) -> [{300, 1000}];
get_return({1, 52}) -> [{300, 1000}];
get_return({1, 53}) -> [{300, 1000}];
get_return({1, 54}) -> [{300, 1000}];
get_return({1, 55}) -> [{300, 1000}];
get_return(_) -> [{300, 1000}].

get_type({999, 1}) -> 4;
get_type({1, 1}) -> 4;
get_type(_) -> 0.

get_num(999) -> 1;
get_num(1) -> 1;
get_num(_) -> 0.

