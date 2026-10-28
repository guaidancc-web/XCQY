-file("src/data/quest_trial_data.erl", 1).

-module(quest_trial_data).

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

-file("src/data/quest_trial_data.erl", 15).

get(1) -> 50000;
get(2) -> 50001;
get(3) -> 50002;
get(4) -> 50003;
get(5) -> 50004;
get(6) -> 50005;
get(7) -> 50006;
get(8) -> 50007;
get(9) -> 50008;
get(10) -> 50009;
get(11) -> 50010;
get(12) -> 50011;
get(13) -> 50012;
get(14) -> 50013;
get(15) -> 50014;
get(16) -> 50015;
get(17) -> 50016;
get(18) -> 50017;
get(19) -> 50018;
get(20) -> 50019;
get(21) -> 50020;
get(22) -> 50021;
get(23) -> 50022;
get(24) -> 50023;
get(_) -> false.

