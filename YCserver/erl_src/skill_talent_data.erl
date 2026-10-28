-file("src/data/skill_talent_data.erl", 1).

-module(skill_talent_data).

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

-file("src/data/skill_talent_data.erl", 14).

get(10001) ->
    #{id => 10001,
      talent3_eff =>
          [{4, [1, [], [], [{10001, 500, 3, 1, [10]}]]}],
      score => 15000};
get(10002) ->
    #{id => 10002,
      talent3_eff =>
          [{17, [first_buff]},
           {4, [1, [], [], [{10001, 1000, 3, 1, [10]}]]}],
      score => 15000};
get(10003) ->
    #{id => 10003, talent3_eff => [{7, [1, [{2, 1}]]}],
      score => 15000};
get(10004) ->
    #{id => 10004,
      talent3_eff =>
          [{14, [[{20015, [{2, add, 1}, {3, [1000]}]}]]}],
      score => 15000};
get(10005) ->
    #{id => 10005,
      talent3_eff =>
          [{14,
            [[{20006,
               [{1, add, 300},
                {2, add, 300},
                {3, add, 300},
                {4, add, 300}]}]]}],
      score => 15000};
get(10006) ->
    #{id => 10006, talent3_eff => [{7, [1, [{1, 3}]]}],
      score => 15000};
get(10007) ->
    #{id => 10007, talent3_eff => [{9, [1, 1]}],
      score => 15000};
get(20001) ->
    #{id => 20001,
      talent3_eff =>
          [{3, [[], [], [{20001, 1000, 5, 1, [10]}]]}],
      score => 15000};
get(20002) ->
    #{id => 20002, talent3_eff => [{9, [1, 1]}],
      score => 15000};
get(20003) ->
    #{id => 20003,
      talent3_eff =>
          [{4, [1, [], [{20002, 0, 0, 0, [300]}], []]}],
      score => 15000};
get(20006) ->
    #{id => 20006, talent3_eff => [{9, [1, 1]}],
      score => 15000};
get(20005) ->
    #{id => 20005,
      talent3_eff => [{5, [[], [{1013, [-1]}]]}],
      score => 15000};
get(20004) ->
    #{id => 20004, talent3_eff => [{1, [2]}],
      score => 15000};
get(20007) ->
    #{id => 20007,
      talent3_eff => [{5, [[], [{1013, [-1]}]]}],
      score => 15000};
get(30001) ->
    #{id => 30001,
      talent3_eff => [{14, [[{20011, [{1, add, 200}]}]]}],
      score => 15000};
get(30002) ->
    #{id => 30002, talent3_eff => [{11, [100]}],
      score => 15000};
get(30003) ->
    #{id => 30003, talent3_eff => [{11, [100]}],
      score => 15000};
get(30004) ->
    #{id => 30004, talent3_eff => [{17, [under_weakness]}],
      score => 15000};
get(30005) ->
    #{id => 30005,
      talent3_eff =>
          [{14, [[{20020, [{1, add, 1}, {2, [850]}]}]]}],
      score => 15000};
get(30006) ->
    #{id => 30006,
      talent3_eff =>
          [{4, [1, [], [{30005, 1000, 0, 1, [200]}], []]}],
      score => 15000};
get(30007) ->
    #{id => 30007,
      talent3_eff =>
          [{4, [1, [], [{30009, 0, 1, 0, [0, 0, 0]}], []]}],
      score => 15000};
get(40001) ->
    #{id => 40001,
      talent3_eff =>
          [{4, [1, [], [], [{40006, 1000, 3, 1, [200]}]]}],
      score => 15000};
get(40002) ->
    #{id => 40002,
      talent3_eff =>
          [{4, [1, [], [], [{40007, 1000, 3, 1, [500]}]]}],
      score => 15000};
get(40003) ->
    #{id => 40003, talent3_eff => [{9, [1, 1]}],
      score => 15000};
get(40004) ->
    #{id => 40004,
      talent3_eff =>
          [{17, [under_control]},
           {14, [[{20037, [{1, add, 800}]}]]}],
      score => 15000};
get(40005) ->
    #{id => 40005,
      talent3_eff =>
          [{4, [1, [], [{80050, 0, 1, 0, [0, 0]}], []]}],
      score => 15000};
get(40006) ->
    #{id => 40006,
      talent3_eff =>
          [{4, [1, [], [{40003, 15, 0, 0, [0, 0, 0, 0]}], []]}],
      score => 15000};
get(40007) ->
    #{id => 40007,
      talent3_eff =>
          [{4, [1, [], [{40010, 1000, 0, 0, [0, 1000, 0]}], []]}],
      score => 15000};
get(50001) ->
    #{id => 50001,
      talent3_eff =>
          [{3, [[], [], [{50004, 1000, 3, 1, [200]}]]}],
      score => 15000};
get(50002) ->
    #{id => 50002, talent3_eff => [{17, [suck_control]}],
      score => 15000};
get(50003) ->
    #{id => 50003,
      talent3_eff =>
          [{5, [[], [{1015, [{0, 400}, {1, 600}]}]]}],
      score => 15000};
get(50004) ->
    #{id => 50004, talent3_eff => [{1, [1]}],
      score => 15000};
get(50005) ->
    #{id => 50005,
      talent3_eff =>
          [{4, [1, [], [{50003, 0, 1, 0, [0]}], []]}],
      score => 15000};
get(50006) ->
    #{id => 50006,
      talent3_eff =>
          [{4, [1, [], [], [{80053, 1000, 4, 0, [400]}]]}],
      score => 15000};
get(50007) ->
    #{id => 50007,
      talent3_eff =>
          [{4,
            [1,
             [],
             [],
             [{50005, 1000, 2, 1, [0, 800, 50100, 10, 0]}]]}],
      score => 15000};
get(69001) ->
    #{id => 69001,
      talent3_eff => [{14, [[{20053, [{3, add, 1}]}]]}],
      score => 15000};
get(69002) ->
    #{id => 69002, talent3_eff => [{9, [1, 1]}],
      score => 15000};
get(69003) ->
    #{id => 69003,
      talent3_eff =>
          [{4, [1, [], [{69003, 0, 1, 0, [0, 0, 0]}], []]}],
      score => 15000};
get(69004) ->
    #{id => 69004, talent3_eff => [{7, [1, [{2, 1}]]}],
      score => 15000};
get(69005) ->
    #{id => 69005, talent3_eff => [{9, [1, 1]}],
      score => 15000};
get(69006) ->
    #{id => 69006, talent3_eff => [{1, [2]}],
      score => 15000};
get(69007) ->
    #{id => 69007,
      talent3_eff => [{14, [[{20053, [{5, add, 300}]}]]}],
      score => 15000};
get(69501) ->
    #{id => 69501,
      talent3_eff =>
          [{3, [[], [], [{69507, 1000, 2, 1, [150]}]]}],
      score => 15000};
get(69502) ->
    #{id => 69502, talent3_eff => [{9, [1, 1]}],
      score => 15000};
get(69503) ->
    #{id => 69503,
      talent3_eff => [{14, [[{20062, [{1, add, 200}]}]]}],
      score => 15000};
get(69504) ->
    #{id => 69504,
      talent3_eff => [{14, [[{20064, [{1, add, 500}]}]]}],
      score => 15000};
get(69505) ->
    #{id => 69505,
      talent3_eff =>
          [{4, [1, [], [], [{69507, 1000, 2, 1, [200]}]]}],
      score => 15000};
get(69506) ->
    #{id => 69506, talent3_eff => [{1, [1]}],
      score => 15000};
get(69507) ->
    #{id => 69507,
      talent3_eff =>
          [{4,
            [1,
             [],
             [],
             [{69508,
               1000,
               1,
               0,
               [69509, 150, 0, [{1, 1000}, {0, 1000}], 20000]}]]}],
      score => 15000};
get(_Id) -> false.

