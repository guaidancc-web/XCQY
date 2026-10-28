-file("src/data/camp_pay_continus_data.erl", 1).

-module(camp_pay_continus_data).

-export([get/1]).

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

-file("src/data/camp_pay_continus_data.erl", 15).

-file("inc/camp_pay_continus.hrl", 1).

-record(m_camp_pay_continus,
        {camp_id = 0, mtime = 0, rewarded = [], day = 0}).

-record(camp_pay_continus_data,
        {day = 0, gold = 0, reward = []}).

-file("src/data/camp_pay_continus_data.erl", 16).

get(1) ->
    #camp_pay_continus_data{day = 1,
                            reward =
                                [{20053, 0, 1, 1, 200},
                                 {22585, 0, 1, 1, 200},
                                 {20006, 0, 30, 1, 200},
                                 {20000, 0, 1, 1, 200},
                                 {20005, 0, 5, 1, 200},
                                 {20545, 0, 1, 1, 200}],
                            gold = 0};
get(2) ->
    #camp_pay_continus_data{day = 2,
                            reward =
                                [{23740, 0, 1, 1, 200},
                                 {20014, 0, 1, 1, 200},
                                 {20025, 0, 10, 1, 200},
                                 {20755, 0, 1, 1, 200},
                                 {22216, 0, 1, 1, 79},
                                 {21098, 0, 5, 80, 200},
                                 {21322, 0, 1, 1, 200}],
                            gold = 380};
get(3) ->
    #camp_pay_continus_data{day = 3,
                            reward =
                                [{29882, 0, 2, 1, 200},
                                 {20023, 0, 1, 1, 64},
                                 {23556, 0, 10, 65, 200},
                                 {22216, 0, 1, 1, 200},
                                 {23752, 0, 1, 1, 200},
                                 {20022, 0, 3, 1, 79},
                                 {22307, 0, 3, 80, 200},
                                 {28607, 0, 1, 1, 200}],
                            gold = 880};
get(4) ->
    #camp_pay_continus_data{day = 4,
                            reward =
                                [{20617, 0, 1, 1, 200},
                                 {29314, 0, 1, 1, 200},
                                 {20755, 0, 2, 1, 200},
                                 {20034, 0, 10, 1, 79},
                                 {21098, 0, 10, 80, 200},
                                 {20006, 0, 50, 1, 200},
                                 {20002, 0, 2, 1, 200},
                                 {29101, 0, 1, 1, 200}],
                            gold = 1880};
get(_) -> false.

