-file("src/data/skill_effect_data.erl", 1).

-module(skill_effect_data).

-export([effect_time/1]).

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

-file("src/data/skill_effect_data.erl", 14).

effect_time(1105) ->
    [#{attack_type => 1, trigger => 3, hurt_ratio => [1],
       hit_delay => 300, delay_time => 800, fly_time => 300}];
effect_time(1106) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 350,
       delay_time => 600, fly_time => 300}];
effect_time(1125) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 550, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 50,
       delay_time => 500, fly_time => 0}];
effect_time(1126) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 50,
       delay_time => 500, fly_time => 0}];
effect_time(1109) ->
    [#{attack_type => 1, trigger => 3, hurt_ratio => [1],
       hit_delay => 300, delay_time => 800, fly_time => 300}];
effect_time(1101) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 550, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 50,
       delay_time => 500, fly_time => 0}];
effect_time(1110) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 300,
       delay_time => 600, fly_time => 300}];
effect_time(1115) ->
    [#{attack_type => 1, trigger => 3, hurt_ratio => [1],
       hit_delay => 300, delay_time => 800, fly_time => 300}];
effect_time(1117) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 300,
       delay_time => 600, fly_time => 300}];
effect_time(1123) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 550, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 50,
       delay_time => 500, fly_time => 0}];
effect_time(10001) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 100,
       delay_time => 550, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(10002) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 700, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 150,
       delay_time => 650, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 350, fly_time => 0}];
effect_time(10003) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0},
     #{attack_type => 1, trigger => 3, hit_delay => 50,
       delay_time => 250, fly_time => 0},
     #{attack_type => 1, trigger => 3, hit_delay => 50,
       delay_time => 1000, fly_time => 0}];
effect_time(10004) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1100, fly_time => 0},
     #{attack_type => 2, trigger => 6,
       hurt_ratio =>
           [{450, 1}, {150, 1}, {150, 1}, {150, 1}, {350, 20}],
       hit_delay => 450, delay_time => 1450, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(10005) ->
    [#{attack_type => 1, trigger => 6, hit_delay => 650,
       delay_time => 1200, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(10006) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 900, fly_time => 0},
     #{attack_type => 0, trigger => 3, hit_delay => 0,
       delay_time => 1300, fly_time => 0},
     #{attack_type => 1, trigger => 3, hit_delay => 150,
       delay_time => 1300, fly_time => 0},
     #{attack_type => 1, trigger => 3, hit_delay => 0,
       delay_time => 600, fly_time => 0}];
effect_time(10007) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1500, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2600, fly_time => 0},
     #{attack_type => 2, trigger => 6,
       hurt_ratio => [{850, 1}, {200, 1}, {200, 1}, {600, 5}],
       hit_delay => 850, delay_time => 2600, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(10009) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 3000, fly_time => 0},
     #{attack_type => 2, trigger => 3,
       hurt_ratio =>
           [{50, 1}, {300, 1}, {350, 1}, {450, 1}, {600, 2}],
       hit_delay => 50, delay_time => 2700, fly_time => 0},
     #{attack_type => 1, trigger => 3, hit_delay => 50,
       delay_time => 250, fly_time => 0}];
effect_time(10010) ->
    [#{attack_type => 1, trigger => 6, hit_delay => 50,
       delay_time => 1000, fly_time => 0}];
effect_time(1102) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 300,
       delay_time => 600, fly_time => 300}];
effect_time(20001) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 450,
       delay_time => 1000, fly_time => 400},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1000, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(20002) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1200, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 250,
       delay_time => 700, fly_time => 0}];
effect_time(20003) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1500, fly_time => 0},
     #{attack_type => 1, trigger => 6, hit_delay => 700,
       delay_time => 2000, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0}];
effect_time(20004) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 3300, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(20005) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 2500, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2700, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 1000,
       delay_time => 1400, fly_time => 0}];
effect_time(20006) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2300, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 3000, fly_time => 0}];
effect_time(20007) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1500, fly_time => 0},
     #{attack_type => 8, trigger => 6, hit_delay => 700,
       delay_time => 1300, fly_time => 0},
     #{attack_type => 9, trigger => 2, hit_delay => 100,
       delay_time => 800, fly_time => 0}];
effect_time(20009) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0}];
effect_time(20010) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0}];
effect_time(1103) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 200,
       delay_time => 500, fly_time => 200}];
effect_time(30001) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 200,
       delay_time => 500, fly_time => 200},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(30002) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1500, fly_time => 0},
     #{attack_type => 1, trigger => 6, hit_delay => 1350,
       delay_time => 1700, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(30003) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 200,
       delay_time => 700, fly_time => 200},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 350, fly_time => 0}];
effect_time(30004) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1200, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1500, fly_time => 0}];
effect_time(30005) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 1, trigger => 6, hit_delay => 550,
       delay_time => 1000, fly_time => 0}];
effect_time(30006) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1500, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 350,
       delay_time => 900, fly_time => 0}];
effect_time(30007) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1300, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 350,
       delay_time => 1000, fly_time => 300},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(30009) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2500, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1300, fly_time => 0},
     #{attack_type => 3, trigger => 2, hit_delay => 0,
       delay_time => 100, fly_time => 300},
     #{attack_type => 1, trigger => 2, hit_delay => 200,
       delay_time => 200, fly_time => 0}];
effect_time(1104) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 50,
       delay_time => 500, fly_time => 0}];
effect_time(40001) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 300, fly_time => 0},
     #{attack_type => 1, trigger => 6, hit_delay => 450,
       delay_time => 900, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 600, fly_time => 0}];
effect_time(40002) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 300, fly_time => 0},
     #{attack_type => 1, trigger => 6, hit_delay => 450,
       delay_time => 1400, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0}];
effect_time(40003) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 50,
       delay_time => 700, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1300, fly_time => 0}];
effect_time(40004) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1200, fly_time => 0}];
effect_time(40005) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 750,
       delay_time => 1200, fly_time => 0}];
effect_time(40006) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1000, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 600, fly_time => 0}];
effect_time(40007) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 900, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0}];
effect_time(40009) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1500, fly_time => 0}];
effect_time(50001) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 700, fly_time => 300},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 700, fly_time => 0}];
effect_time(50003) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1400, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1500, fly_time => 0}];
effect_time(50004) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 1500,
       delay_time => 2500, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 3000, fly_time => 0}];
effect_time(50014) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 1500,
       delay_time => 2500, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 3000, fly_time => 0}];
effect_time(50024) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 1500,
       delay_time => 2500, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 3000, fly_time => 0}];
effect_time(50002) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0},
     #{attack_type => 1, trigger => 6, hit_delay => 1500,
       delay_time => 2000, fly_time => 0}];
effect_time(50005) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1600, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1700, fly_time => 0}];
effect_time(50006) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 800, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 400,
       delay_time => 1000, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1000, fly_time => 0}];
effect_time(50007) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0}];
effect_time(50009) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2400, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 2500, fly_time => 0}];
effect_time(60007) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1500, fly_time => 0}];
effect_time(60008) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1350, fly_time => 0}];
effect_time(60009) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1100, fly_time => 0}];
effect_time(60011) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 450,
       delay_time => 1000, fly_time => 400}];
effect_time(60012) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 300,
       delay_time => 450, fly_time => 300}];
effect_time(60013) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 1000, fly_time => 0}];
effect_time(60014) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 300,
       delay_time => 1500, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1300, fly_time => 0}];
effect_time(60015) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 500,
       delay_time => 1500, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1800, fly_time => 0}];
effect_time(60016) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 50,
       delay_time => 1300, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1100}];
effect_time(60017) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 300,
       delay_time => 800, fly_time => 0}];
effect_time(60018) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0}];
effect_time(60019) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 1300, fly_time => 0}];
effect_time(60020) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 600, fly_time => 0}];
effect_time(60022) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 50,
       delay_time => 800, fly_time => 0}];
effect_time(60023) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1600, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1700, fly_time => 0}];
effect_time(60024) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0}];
effect_time(60025) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0}];
effect_time(60027) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 500,
       delay_time => 2100, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1500, fly_time => 0}];
effect_time(60029) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1400, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1500, fly_time => 0}];
effect_time(60030) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1500, fly_time => 0}];
effect_time(60038) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1500, fly_time => 0}];
effect_time(60065) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 200,
       delay_time => 1800, fly_time => 0}];
effect_time(60066) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 500,
       delay_time => 1000, fly_time => 0}];
effect_time(60067) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1600, fly_time => 0}];
effect_time(60068) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 100,
       delay_time => 250, fly_time => 0}];
effect_time(60069) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 950,
       delay_time => 2000, fly_time => 0}];
effect_time(60070) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 300,
       delay_time => 800, fly_time => 0}];
effect_time(60073) ->
    [#{attack_type => 1, trigger => 3, hit_delay => 550,
       delay_time => 1000, fly_time => 0}];
effect_time(60074) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 100,
       delay_time => 1300, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 800, fly_time => 0}];
effect_time(60075) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 3, trigger => 2, hit_delay => 0,
       delay_time => 100, fly_time => 300},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(60085) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 300, fly_time => 300},
     #{attack_type => 1, trigger => 2, hit_delay => 350,
       delay_time => 1000, fly_time => 0}];
effect_time(60092) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1000, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 500,
       delay_time => 1200, fly_time => 0}];
effect_time(160084) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1500, fly_time => 0},
     #{attack_type => 1, trigger => 6, hit_delay => 1050,
       delay_time => 1800, fly_time => 0}];
effect_time(160085) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1500, fly_time => 0},
     #{attack_type => 1, trigger => 6, hit_delay => 1050,
       delay_time => 1800, fly_time => 0}];
effect_time(160087) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 300,
       delay_time => 1300, fly_time => 0}];
effect_time(160088) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 300,
       delay_time => 1300, fly_time => 0}];
effect_time(71325) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 800, fly_time => 0}];
effect_time(60107) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1500, fly_time => 0}];
effect_time(60109) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1100, fly_time => 0}];
effect_time(60108) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1350, fly_time => 0}];
effect_time(60127) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 500,
       delay_time => 2100, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1500, fly_time => 0}];
effect_time(60129) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1400, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1500, fly_time => 0}];
effect_time(60130) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1500, fly_time => 0}];
effect_time(60138) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1500, fly_time => 0}];
effect_time(60077) ->
    [#{attack_type => 1, trigger => 6, hit_delay => 50,
       delay_time => 500, fly_time => 0}];
effect_time(60167) ->
    [#{attack_type => 1, trigger => 6, hit_delay => 50,
       delay_time => 500, fly_time => 0}];
effect_time(60099) ->
    [#{attack_type => 1, trigger => 6, hit_delay => 1350,
       delay_time => 2000, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0}];
effect_time(60502) ->
    [#{attack_type => 1, trigger => 6, hit_delay => 1350,
       delay_time => 2000, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0}];
effect_time(60505) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 550,
       delay_time => 1100, fly_time => 0},
     #{attack_type => 5, trigger => 2, hit_delay => 150,
       delay_time => 500, fly_time => 80},
     #{attack_type => 0, trigger => 2, hit_delay => 10,
       delay_time => 700, fly_time => 0}];
effect_time(60507) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1000, fly_time => 0}];
effect_time(60508) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 800, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 500,
       delay_time => 1000, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 500, fly_time => 0}];
effect_time(60515) ->
    [#{attack_type => 1, trigger => 6, hit_delay => 750,
       delay_time => 1500, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1200, fly_time => 0}];
effect_time(60516) ->
    [#{attack_type => 1, trigger => 6, hit_delay => 750,
       delay_time => 1500, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1500, fly_time => 0}];
effect_time(60518) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 1000,
       delay_time => 2300, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 1000,
       delay_time => 2000, fly_time => 0}];
effect_time(60519) ->
    [#{attack_type => 1, trigger => 6, hit_delay => 300,
       delay_time => 2300, fly_time => 0}];
effect_time(60523) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0},
     #{attack_type => 2, trigger => 2,
       hurt_ratio => [{300, 1}, {400, 1}, {400, 1}],
       hit_delay => 300, delay_time => 2000, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1500, fly_time => 0}];
effect_time(60526) ->
    [#{attack_type => 0, trigger => 7, hit_delay => 0,
       delay_time => 300, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 300, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 500, fly_time => 0}];
effect_time(60528) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 200,
       delay_time => 1800, fly_time => 0}];
effect_time(60529) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 500,
       delay_time => 1000, fly_time => 0}];
effect_time(60530) ->
    [#{attack_type => 1, trigger => 6, hit_delay => 930,
       delay_time => 1500, fly_time => 0}];
effect_time(60531) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0}];
effect_time(60532) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 950,
       delay_time => 2000, fly_time => 0}];
effect_time(60536) ->
    [#{attack_type => 1, trigger => 6, hit_delay => 750,
       delay_time => 800, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 800, fly_time => 0}];
effect_time(60537) ->
    [#{attack_type => 1, trigger => 6, hit_delay => 750,
       delay_time => 800, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 800, fly_time => 0}];
effect_time(60538) ->
    [#{attack_type => 1, trigger => 6, hit_delay => 750,
       delay_time => 800, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 800, fly_time => 0}];
effect_time(60539) ->
    [#{attack_type => 1, trigger => 6, hit_delay => 750,
       delay_time => 800, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 800, fly_time => 0}];
effect_time(60540) ->
    [#{attack_type => 1, trigger => 6, hit_delay => 750,
       delay_time => 800, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 800, fly_time => 0}];
effect_time(60541) ->
    [#{attack_type => 1, trigger => 6, hit_delay => 750,
       delay_time => 800, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 800, fly_time => 0}];
effect_time(60542) ->
    [#{attack_type => 1, trigger => 6, hit_delay => 750,
       delay_time => 1500, fly_time => 0}];
effect_time(60543) ->
    [#{attack_type => 1, trigger => 6, hit_delay => 750,
       delay_time => 1500, fly_time => 0}];
effect_time(60544) ->
    [#{attack_type => 1, trigger => 6, hit_delay => 750,
       delay_time => 1500, fly_time => 0}];
effect_time(60545) ->
    [#{attack_type => 1, trigger => 6, hit_delay => 750,
       delay_time => 1500, fly_time => 0}];
effect_time(60546) ->
    [#{attack_type => 1, trigger => 6, hit_delay => 750,
       delay_time => 1500, fly_time => 0}];
effect_time(60547) ->
    [#{attack_type => 1, trigger => 6, hit_delay => 750,
       delay_time => 1500, fly_time => 0}];
effect_time(60548) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 1300, fly_time => 0}];
effect_time(60550) ->
    [#{attack_type => 10, trigger => 2, hit_delay => 400,
       delay_time => 500, fly_time => 400},
     #{attack_type => 11, trigger => 2, hit_delay => 400,
       delay_time => 500, fly_time => 400},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1200, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1400, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1600, fly_time => 0}];
effect_time(60551) ->
    [#{attack_type => 10, trigger => 2, hit_delay => 400,
       delay_time => 500, fly_time => 400},
     #{attack_type => 11, trigger => 2, hit_delay => 400,
       delay_time => 500, fly_time => 400},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1200, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1400, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1600, fly_time => 0}];
effect_time(60552) ->
    [#{attack_type => 11, trigger => 2, hit_delay => 400,
       delay_time => 500, fly_time => 400},
     #{attack_type => 10, trigger => 2, hit_delay => 400,
       delay_time => 500, fly_time => 400},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1200, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1400, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1600, fly_time => 0}];
effect_time(60553) ->
    [#{attack_type => 11, trigger => 2, hit_delay => 400,
       delay_time => 500, fly_time => 400},
     #{attack_type => 10, trigger => 2, hit_delay => 400,
       delay_time => 500, fly_time => 400},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1200, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1400, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1600, fly_time => 0}];
effect_time(60555) ->
    [#{attack_type => 0, trigger => 3, hit_delay => 0,
       delay_time => 400, fly_time => 0},
     #{attack_type => 1, trigger => 3, hurt_ratio => [1],
       delay_time => 400, fly_time => 400},
     #{attack_type => 0, trigger => 3, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 1, trigger => 3, hurt_ratio => [1],
       hit_delay => 0, delay_time => 400, fly_time => 400},
     #{attack_type => 0, trigger => 3, hit_delay => 0,
       delay_time => 700, fly_time => 0},
     #{attack_type => 0, trigger => 3, hit_delay => 0,
       delay_time => 1500, fly_time => 0},
     #{attack_type => 1, trigger => 3, hurt_ratio => [2],
       hit_delay => 0, delay_time => 700, fly_time => 700}];
effect_time(60820) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0}];
effect_time(60821) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0}];
effect_time(60822) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0}];
effect_time(60823) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0}];
effect_time(61005) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 50,
       delay_time => 500, fly_time => 0}];
effect_time(61006) ->
    [#{attack_type => 2, trigger => 6,
       hurt_ratio => [{600, 1}, {500, 1}, {500, 1}],
       hit_delay => 600, delay_time => 2200, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2100, fly_time => 0}];
effect_time(61007) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 50,
       delay_time => 500, fly_time => 0}];
effect_time(61008) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0},
     #{attack_type => 1, trigger => 3, hit_delay => 50,
       delay_time => 250, fly_time => 0},
     #{attack_type => 1, trigger => 3, hit_delay => 50,
       delay_time => 1000, fly_time => 0}];
effect_time(61010) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 900, fly_time => 0},
     #{attack_type => 0, trigger => 3, hit_delay => 0,
       delay_time => 1300, fly_time => 0},
     #{attack_type => 1, trigger => 3, hit_delay => 150,
       delay_time => 1300, fly_time => 0},
     #{attack_type => 1, trigger => 3, hit_delay => 0,
       delay_time => 600, fly_time => 0}];
effect_time(61011) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1500, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2600, fly_time => 0},
     #{attack_type => 2, trigger => 6,
       hurt_ratio => [{850, 1}, {200, 1}, {200, 1}, {600, 5}],
       hit_delay => 850, delay_time => 2600, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(61030) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 100,
       delay_time => 550, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(61031) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 700, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 150,
       delay_time => 650, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 350, fly_time => 0}];
effect_time(61029) ->
    [#{attack_type => 1, trigger => 3, hit_delay => 50,
       delay_time => 250, fly_time => 0},
     #{attack_type => 1, trigger => 3, hit_delay => 50,
       delay_time => 1000, fly_time => 0}];
effect_time(61032) ->
    [#{attack_type => 1, trigger => 6, hit_delay => 650,
       delay_time => 1200, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(61036) ->
    [#{attack_type => 0, trigger => 4, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(61037) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 350,
       delay_time => 1650, fly_time => 0}];
effect_time(61038) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0}];
effect_time(61039) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 3500, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1200, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 500,
       delay_time => 2100, fly_time => 0}];
effect_time(61041) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1400, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1500, fly_time => 0}];
effect_time(61042) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0},
     #{attack_type => 1, trigger => 6, hit_delay => 1500,
       delay_time => 2000, fly_time => 0}];
effect_time(61043) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1400, fly_time => 0}];
effect_time(61044) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1400, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 500,
       delay_time => 1800, fly_time => 0}];
effect_time(61045) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 2500, fly_time => 0}];
effect_time(61046) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1400, fly_time => 0}];
effect_time(61047) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0}];
effect_time(61052) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1400, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1500, fly_time => 0}];
effect_time(61053) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0},
     #{attack_type => 1, trigger => 6, hit_delay => 1500,
       delay_time => 2000, fly_time => 0}];
effect_time(61054) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1500, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1100, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1100, fly_time => 0}];
effect_time(61055) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1200, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 500,
       delay_time => 1800, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1500, fly_time => 0}];
effect_time(61056) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2300, fly_time => 0}];
effect_time(61057) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(61058) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1500, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1100, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1100, fly_time => 0}];
effect_time(61063) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2500, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1500, fly_time => 0},
     #{attack_type => 2, trigger => 2,
       hurt_ratio =>
           [{200, 1}, {300, 1}, {300, 1}, {300, 1}, {300, 1}],
       hit_delay => 200, delay_time => 1500, fly_time => 0}];
effect_time(61065) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1200, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 100,
       delay_time => 800, fly_time => 0}];
effect_time(61066) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0}];
effect_time(61068) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 250,
       delay_time => 1700, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1200, fly_time => 0}];
effect_time(61070) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1350, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1350, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 250,
       delay_time => 1000, fly_time => 0}];
effect_time(61071) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 450,
       delay_time => 1000, fly_time => 400}];
effect_time(61072) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1350, fly_time => 0}];
effect_time(61073) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 450,
       delay_time => 1000, fly_time => 400}];
effect_time(63073) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1400, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 400,
       delay_time => 1600}];
effect_time(61074) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 1500,
       delay_time => 500, fly_time => 500},
     #{attack_type => 3, trigger => 2, hit_delay => 500,
       delay_time => 500, fly_time => 500},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1000, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(61075) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 200,
       delay_time => 1400, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(61076) ->
    [#{attack_type => 1, trigger => 6, hit_delay => 700,
       delay_time => 2000, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0}];
effect_time(61077) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1600, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1700, fly_time => 0}];
effect_time(61078) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2300, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 3000, fly_time => 0}];
effect_time(61079) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1750, fly_time => 0},
     #{attack_type => 2, trigger => 6,
       hurt_ratio => [{1350, 1}, {400, 1}, {400, 8}],
       hit_delay => 1350, delay_time => 2200, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0}];
effect_time(61080) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 2500, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2700, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 1000,
       delay_time => 1400, fly_time => 0}];
effect_time(63080) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 2500, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2700, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 1000,
       delay_time => 1400, fly_time => 0}];
effect_time(63081) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1600, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1700, fly_time => 0}];
effect_time(61081) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 200,
       delay_time => 2100, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 500, fly_time => 0}];
effect_time(61082) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0}];
effect_time(61083) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2300, fly_time => 0}];
effect_time(61084) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 250,
       delay_time => 1700, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1350, fly_time => 0}];
effect_time(61086) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1350, fly_time => 0}];
effect_time(61102) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 50,
       delay_time => 800, fly_time => 0}];
effect_time(61103) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1050, fly_time => 0}];
effect_time(61104) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 600, fly_time => 0}];
effect_time(61105) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1150, fly_time => 0}];
effect_time(61106) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 50,
       delay_time => 800, fly_time => 0}];
effect_time(63107) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 900, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0}];
effect_time(61107) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 600, fly_time => 0}];
effect_time(61109) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0}];
effect_time(63109) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 700, fly_time => 0}];
effect_time(61110) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 600, fly_time => 0}];
effect_time(61111) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 50,
       delay_time => 700, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 600, fly_time => 0}];
effect_time(61114) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 50,
       delay_time => 800, fly_time => 0}];
effect_time(61113) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 300,
       delay_time => 800, fly_time => 0}];
effect_time(61112) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 50,
       delay_time => 600, fly_time => 0}];
effect_time(61115) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0}];
effect_time(61116) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 600, fly_time => 0}];
effect_time(61118) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 50,
       delay_time => 800, fly_time => 0}];
effect_time(61119) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 700, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 150,
       delay_time => 650, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 350, fly_time => 0}];
effect_time(61121) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1350, fly_time => 0}];
effect_time(61122) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0}];
effect_time(61131) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1100, fly_time => 0}];
effect_time(61132) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1200, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 1500,
       delay_time => 2500, fly_time => 0}];
effect_time(61133) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1000, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 250,
       delay_time => 1200, fly_time => 0}];
effect_time(61134) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1600, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2300, fly_time => 0}];
effect_time(61135) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1200, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 500,
       delay_time => 1800, fly_time => 0}];
effect_time(61136) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1500, fly_time => 0},
     #{attack_type => 1, trigger => 6, hit_delay => 800,
       delay_time => 1500, fly_time => 0}];
effect_time(61138) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1700, fly_time => 0}];
effect_time(61139) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 300,
       delay_time => 1000, fly_time => 420}];
effect_time(61140) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0}];
effect_time(61141) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 350,
       delay_time => 1200, fly_time => 0}];
effect_time(61142) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2300, fly_time => 0}];
effect_time(61143) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1400, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1500, fly_time => 0}];
effect_time(61150) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 200,
       delay_time => 500, fly_time => 200},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(61151) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1500, fly_time => 0},
     #{attack_type => 1, trigger => 6, hit_delay => 1350,
       delay_time => 1700, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(61152) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 200,
       delay_time => 700, fly_time => 200},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 350, fly_time => 0}];
effect_time(61153) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 1, trigger => 6, hit_delay => 550,
       delay_time => 1000, fly_time => 0}];
effect_time(61154) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 900, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 600,
       delay_time => 1500, fly_time => 0}];
effect_time(61155) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1300, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 350,
       delay_time => 1000, fly_time => 300},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(61156) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(63112) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1000, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0}];
effect_time(63117) ->
    [#{attack_type => 1, trigger => 6, hit_delay => 460,
       delay_time => 1200, fly_time => 0}];
effect_time(63118) ->
    [#{attack_type => 1, trigger => 3, hit_delay => 50,
       delay_time => 1100, fly_time => 0},
     #{attack_type => 1, trigger => 3, hit_delay => 50,
       delay_time => 700, fly_time => 0}];
effect_time(63119) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 600, fly_time => 0}];
effect_time(63071) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1000, fly_time => 0}];
effect_time(69019) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 50,
       delay_time => 1500, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 3000, fly_time => 0}];
effect_time(69029) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 50,
       delay_time => 1500, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 3000, fly_time => 0}];
effect_time(69030) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1500, fly_time => 0}];
effect_time(69501) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 800, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 50,
       delay_time => 500, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(69502) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1000, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 50,
       delay_time => 400, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1000, fly_time => 0}];
effect_time(69503) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 350,
       delay_time => 800, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(69504) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0},
     #{attack_type => 0, trigger => 3, hit_delay => 0,
       delay_time => 800, fly_time => 0},
     #{attack_type => 1, trigger => 3, hit_delay => 150,
       delay_time => 500, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1000, fly_time => 0}];
effect_time(69505) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 200,
       delay_time => 3700, fly_time => 0}];
effect_time(69506) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 50,
       delay_time => 500, fly_time => 0}];
effect_time(69507) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1000, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 250,
       delay_time => 500, fly_time => 200},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0}];
effect_time(69509) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 50,
       delay_time => 500, fly_time => 0}];
effect_time(69510) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0}];
effect_time(69511) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1700, fly_time => 0}];
effect_time(70000) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 100,
       delay_time => 550, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(70001) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 100,
       delay_time => 550, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(70002) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 100,
       delay_time => 550, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(70003) ->
    [#{attack_type => 1, trigger => 3, hit_delay => 100,
       delay_time => 550, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(70004) ->
    [#{attack_type => 1, trigger => 3, hit_delay => 100,
       delay_time => 550, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(70005) ->
    [#{attack_type => 1, trigger => 3, hit_delay => 100,
       delay_time => 550, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(70006) ->
    [#{attack_type => 1, trigger => 3, hit_delay => 100,
       delay_time => 550, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(70009) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 50,
       delay_time => 800, fly_time => 0}];
effect_time(70010) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 50,
       delay_time => 800, fly_time => 0}];
effect_time(70011) ->
    [#{attack_type => 1, trigger => 6, hit_delay => 0,
       delay_time => 1200, fly_time => 0}];
effect_time(70012) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 50,
       delay_time => 250, fly_time => 0}];
effect_time(70020) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 600, fly_time => 0}];
effect_time(70021) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 600, fly_time => 0}];
effect_time(70036) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1350, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 300, fly_time => 0}];
effect_time(70038) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 50,
       delay_time => 500, fly_time => 0}];
effect_time(70039) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 100,
       delay_time => 600, fly_time => 0}];
effect_time(70044) ->
    [#{attack_type => 2, trigger => 6,
       hurt_ratio => [{600, 1}, {500, 1}, {500, 1}],
       hit_delay => 600, delay_time => 2200, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2100, fly_time => 0}];
effect_time(70045) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 300, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 600, fly_time => 0}];
effect_time(70046) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 50,
       delay_time => 500, fly_time => 0}];
effect_time(70047) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 50,
       delay_time => 500, fly_time => 0}];
effect_time(70048) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 1300, fly_time => 0}];
effect_time(70050) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1800, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 300, fly_time => 0}];
effect_time(70051) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 700, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 150,
       delay_time => 650, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 350, fly_time => 0}];
effect_time(70061) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 300, fly_time => 0},
     #{attack_type => 1, trigger => 6, hit_delay => 450,
       delay_time => 1400, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 700,
       delay_time => 1400, fly_time => 0}];
effect_time(70062) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 300, fly_time => 0},
     #{attack_type => 1, trigger => 6, hit_delay => 450,
       delay_time => 1400, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 700,
       delay_time => 1400, fly_time => 0}];
effect_time(70070) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 300,
       delay_time => 1000, fly_time => 300}];
effect_time(70071) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 200,
       delay_time => 1500, fly_time => 0}];
effect_time(70080) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 800, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 300,
       delay_time => 450, fly_time => 300}];
effect_time(70090) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 1000, fly_time => 0}];
effect_time(70100) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 800, fly_time => 0}];
effect_time(70101) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0}];
effect_time(70110) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1500, fly_time => 0}];
effect_time(70111) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1500, fly_time => 0}];
effect_time(70112) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1500, fly_time => 0}];
effect_time(70120) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0}];
effect_time(70121) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0}];
effect_time(70122) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0}];
effect_time(70130) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 800, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 150,
       delay_time => 1700, fly_time => 0}];
effect_time(70131) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 1200, fly_time => 0}];
effect_time(70132) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 800, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 150,
       delay_time => 1700, fly_time => 0}];
effect_time(70133) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 800, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 150,
       delay_time => 1700, fly_time => 0}];
effect_time(70140) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 350,
       delay_time => 1200, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 800, fly_time => 0}];
effect_time(70141) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 350,
       delay_time => 1200, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 800, fly_time => 0}];
effect_time(70149) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1000, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1500, fly_time => 0}];
effect_time(70150) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1000, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1500, fly_time => 0}];
effect_time(70151) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1000, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1500, fly_time => 0}];
effect_time(70152) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1100, fly_time => 0}];
effect_time(70153) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1100, fly_time => 0}];
effect_time(70154) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1000, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1500, fly_time => 0}];
effect_time(70155) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0}];
effect_time(70156) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0}];
effect_time(70157) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1000, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1500, fly_time => 0}];
effect_time(70158) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1000, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1500, fly_time => 0}];
effect_time(70160) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0}];
effect_time(70161) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0}];
effect_time(70165) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 600, fly_time => 0}];
effect_time(70166) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1500, fly_time => 0}];
effect_time(70170) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1400, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1000, fly_time => 0}];
effect_time(70171) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 300,
       delay_time => 1000, fly_time => 420}];
effect_time(70179) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 200,
       delay_time => 1800, fly_time => 0}];
effect_time(70180) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0},
     #{attack_type => 1, trigger => 6, hit_delay => 1500,
       delay_time => 2000, fly_time => 0}];
effect_time(70181) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 450,
       delay_time => 1000, fly_time => 400},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(70182) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 300,
       delay_time => 600, fly_time => 300}];
effect_time(70183) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 450,
       delay_time => 800, fly_time => 400},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(70184) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 450,
       delay_time => 1000, fly_time => 400},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(70185) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 450,
       delay_time => 800, fly_time => 400},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(70186) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 450,
       delay_time => 1000, fly_time => 400},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(70187) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 450,
       delay_time => 1000, fly_time => 400},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(70188) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 450,
       delay_time => 1000, fly_time => 400},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(70189) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 450,
       delay_time => 500, fly_time => 400}];
effect_time(70190) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 450,
       delay_time => 800, fly_time => 400},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(70200) ->
    [#{attack_type => 1, trigger => 6, hit_delay => 1100,
       delay_time => 2500, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0}];
effect_time(70210) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 300, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1500, fly_time => 0}];
effect_time(70211) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 300, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1500, fly_time => 0}];
effect_time(70220) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 2500, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 1000,
       delay_time => 1400, fly_time => 0}];
effect_time(70221) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 2500, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 1000,
       delay_time => 1400, fly_time => 0}];
effect_time(70240) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 300, fly_time => 0}];
effect_time(70241) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 300, fly_time => 0}];
effect_time(70250) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 300, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1500, fly_time => 0}];
effect_time(70260) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 300, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1500, fly_time => 0}];
effect_time(70261) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 300, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1500, fly_time => 0}];
effect_time(70280) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 2500, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 1000,
       delay_time => 1400, fly_time => 0}];
effect_time(70300) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 300, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1350, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 300, fly_time => 0}];
effect_time(70301) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 300, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1350, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 300, fly_time => 0}];
effect_time(70302) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0}];
effect_time(70310) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 700, fly_time => 0}];
effect_time(70311) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 700, fly_time => 0}];
effect_time(70320) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 200,
       delay_time => 500, fly_time => 200},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(70321) ->
    [#{attack_type => 1, trigger => 6, hit_delay => 1350,
       delay_time => 1700, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(70460) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0},
     #{attack_type => 2, trigger => 6,
       hurt_ratio =>
           [{1000, 2},
            {200, 3},
            {500, 1},
            {100, 1},
            {100, 1},
            {100, 1},
            {100, 1},
            {100, 1}],
       hit_delay => 1000, delay_time => 4000, fly_time => 0}];
effect_time(70470) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 800, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(70480) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 700, fly_time => 0}];
effect_time(70491) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2500, fly_time => 0}];
effect_time(70530) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1500, fly_time => 0},
     #{attack_type => 2, trigger => 6,
       hurt_ratio => [{800, 1}, {200, 1}, {200, 1}, {600, 5}],
       hit_delay => 800, delay_time => 2600, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(70531) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1500, fly_time => 0},
     #{attack_type => 2, trigger => 6,
       hurt_ratio => [{800, 1}, {200, 1}, {200, 1}, {600, 5}],
       hit_delay => 800, delay_time => 2600, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(170540) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1600, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2300, fly_time => 0}];
effect_time(70541) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1600, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1700, fly_time => 0}];
effect_time(70550) ->
    [#{attack_type => 1, trigger => 6, hit_delay => 1100,
       delay_time => 2500, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0}];
effect_time(70570) ->
    [#{attack_type => 1, trigger => 6, hit_delay => 1100,
       delay_time => 2500, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0}];
effect_time(70620) ->
    [#{attack_type => 2, trigger => 6,
       hurt_ratio =>
           [{600, 1}, {300, 1}, {300, 1}, {300, 1}, {300, 1}],
       hit_delay => 600, delay_time => 2200, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2100, fly_time => 0}];
effect_time(70621) ->
    [#{attack_type => 2, trigger => 6,
       hurt_ratio =>
           [{600, 1}, {300, 1}, {300, 1}, {300, 1}, {300, 1}],
       hit_delay => 600, delay_time => 2200, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2100, fly_time => 0}];
effect_time(70622) ->
    [#{attack_type => 2, trigger => 6,
       hurt_ratio =>
           [{600, 1}, {300, 1}, {300, 1}, {300, 1}, {300, 1}],
       hit_delay => 600, delay_time => 2200, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2100, fly_time => 0}];
effect_time(70630) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1350, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 250,
       delay_time => 1000, fly_time => 0}];
effect_time(70720) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 400,
       delay_time => 800, fly_time => 400}];
effect_time(70721) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 400,
       delay_time => 800, fly_time => 400}];
effect_time(70770) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 50,
       delay_time => 800, fly_time => 0}];
effect_time(70771) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 50,
       delay_time => 800, fly_time => 0}];
effect_time(70772) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 50,
       delay_time => 800, fly_time => 0}];
effect_time(70773) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 50,
       delay_time => 800, fly_time => 0}];
effect_time(70780) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 350,
       delay_time => 1200, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 800, fly_time => 0}];
effect_time(70870) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 300,
       delay_time => 800, fly_time => 0}];
effect_time(70910) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 4500, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(70911) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 4500, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(70912) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 4500, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(71070) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1700, fly_time => 0}];
effect_time(71072) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1100, fly_time => 0}];
effect_time(71076) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0}];
effect_time(71030) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 350,
       delay_time => 1200, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 800, fly_time => 0}];
effect_time(71081) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1000, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1500, fly_time => 0}];
effect_time(71082) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 700, fly_time => 0}];
effect_time(71083) ->
    [#{attack_type => 0, trigger => 6, delay_time => 3000,
       fly_time => 0},
     #{attack_type => 1, trigger => 6, hit_delay => 1000,
       delay_time => 1800, fly_time => 0}];
effect_time(71085) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 300,
       delay_time => 1500, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1300, fly_time => 0}];
effect_time(71088) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 300,
       delay_time => 800, fly_time => 0}];
effect_time(71090) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1100, fly_time => 0}];
effect_time(71092) ->
    [#{attack_type => 1, trigger => 6, hit_delay => 0,
       delay_time => 1200, fly_time => 0}];
effect_time(71093) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1700, fly_time => 0}];
effect_time(71094) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2300, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 3500, fly_time => 0}];
effect_time(71099) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(71103) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 800, fly_time => 0}];
effect_time(71104) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1100, fly_time => 0}];
effect_time(71105) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1700, fly_time => 0}];
effect_time(71106) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1700, fly_time => 0}];
effect_time(71109) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2500, fly_time => 0}];
effect_time(71110) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 3000, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 1500,
       delay_time => 2500, fly_time => 0}];
effect_time(71111) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1350, fly_time => 0}];
effect_time(71112) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1350, fly_time => 0}];
effect_time(71114) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(71124) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 800, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 150,
       delay_time => 1700, fly_time => 0}];
effect_time(71125) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1400, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1500, fly_time => 0}];
effect_time(71126) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1400, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1500, fly_time => 0}];
effect_time(71127) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1400, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1500, fly_time => 0}];
effect_time(71128) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(71129) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(71134) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 1000,
       delay_time => 500, fly_time => 0},
     #{attack_type => 0, trigger => 6, delay_time => 3000,
       fly_time => 0}];
effect_time(71135) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 300, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1500, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 700, fly_time => 0}];
effect_time(71137) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 200,
       delay_time => 1500, fly_time => 0}];
effect_time(71138) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1500, fly_time => 0}];
effect_time(71140) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1500, fly_time => 0}];
effect_time(71141) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 800, fly_time => 0}];
effect_time(71142) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 800, fly_time => 0}];
effect_time(71143) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 800, fly_time => 0}];
effect_time(71144) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 700, fly_time => 0}];
effect_time(71146) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(71147) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(71149) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1800, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 300, fly_time => 0}];
effect_time(71150) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 300,
       delay_time => 1500, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1300, fly_time => 0}];
effect_time(71151) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 600, fly_time => 0}];
effect_time(71153) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 300, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(71154) ->
    [#{attack_type => 1, trigger => 3, hit_delay => 0,
       delay_time => 300, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(71155) ->
    [#{attack_type => 1, trigger => 3, hit_delay => 0,
       delay_time => 300, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(71157) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 600, fly_time => 0}];
effect_time(71163) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 400,
       delay_time => 800, fly_time => 400}];
effect_time(71164) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1350, fly_time => 0}];
effect_time(71165) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0}];
effect_time(71166) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 700, fly_time => 0}];
effect_time(71167) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0}];
effect_time(71169) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 1700, fly_time => 0}];
effect_time(71170) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1000, fly_time => 0}];
effect_time(71172) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 300, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1500, fly_time => 0}];
effect_time(71173) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 300, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1500, fly_time => 0}];
effect_time(71174) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 300, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1500, fly_time => 0}];
effect_time(71175) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 600, fly_time => 0}];
effect_time(71177) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1500, fly_time => 0}];
effect_time(71180) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0}];
effect_time(71181) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0}];
effect_time(71182) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0}];
effect_time(71183) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1100, fly_time => 0}];
effect_time(71184) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1500, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 400,
       delay_time => 1600}];
effect_time(71185) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 450,
       delay_time => 800, fly_time => 400},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(71186) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 300,
       delay_time => 1500, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1300, fly_time => 0}];
effect_time(71187) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 100,
       delay_time => 800, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1200, fly_time => 0}];
effect_time(71188) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 50,
       delay_time => 1300, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1100}];
effect_time(71189) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 300,
       delay_time => 800, fly_time => 0}];
effect_time(71190) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 1300, fly_time => 0}];
effect_time(71192) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 2500, fly_time => 0}];
effect_time(71193) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 2500, fly_time => 0}];
effect_time(71194) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 2500, fly_time => 0}];
effect_time(71195) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 3000, fly_time => 0},
     #{attack_type => 2, trigger => 6,
       hurt_ratio => [{1350, 1}, {400, 1}, {400, 8}],
       hit_delay => 1350, delay_time => 2200, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0}];
effect_time(71196) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 600, fly_time => 0}];
effect_time(71197) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1500, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 400,
       delay_time => 1600}];
effect_time(71199) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 3000, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 1500,
       delay_time => 2500, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0}];
effect_time(71200) ->
    [#{attack_type => 2, trigger => 6,
       hurt_ratio =>
           [{1000, 2},
            {200, 3},
            {500, 1},
            {100, 1},
            {100, 1},
            {100, 1},
            {100, 1},
            {100, 1}],
       hit_delay => 1000, delay_time => 4000, fly_time => 0}];
effect_time(71201) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1000, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 250,
       delay_time => 1200, fly_time => 0}];
effect_time(71203) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 300,
       delay_time => 800, fly_time => 0}];
effect_time(71205) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 600, fly_time => 0}];
effect_time(71206) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 300,
       delay_time => 800, fly_time => 0}];
effect_time(71207) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0}];
effect_time(71208) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0}];
effect_time(71209) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 1300, fly_time => 0}];
effect_time(71210) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0}];
effect_time(71211) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 600, fly_time => 0}];
effect_time(71216) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 50,
       delay_time => 800, fly_time => 0}];
effect_time(71222) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 1, trigger => 6, hit_delay => 550,
       delay_time => 1000, fly_time => 0}];
effect_time(71223) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 200,
       delay_time => 1400, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(71224) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1350, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1350, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 250,
       delay_time => 1000, fly_time => 0}];
effect_time(71225) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1400, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 400,
       delay_time => 1600}];
effect_time(71226) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 350,
       delay_time => 900, fly_time => 0}];
effect_time(71227) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1500, fly_time => 0}];
effect_time(71229) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0},
     #{attack_type => 1, trigger => 3, hit_delay => 50,
       delay_time => 250, fly_time => 0},
     #{attack_type => 1, trigger => 3, hit_delay => 50,
       delay_time => 1000, fly_time => 0}];
effect_time(71234) ->
    [#{attack_type => 1, trigger => 6, hit_delay => 0,
       delay_time => 1000, fly_time => 0}];
effect_time(71236) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 50,
       delay_time => 1300, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1100}];
effect_time(71237) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 700, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 150,
       delay_time => 650, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 350, fly_time => 0}];
effect_time(71238) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 900, fly_time => 0},
     #{attack_type => 0, trigger => 3, hit_delay => 0,
       delay_time => 1300, fly_time => 0},
     #{attack_type => 1, trigger => 3, hit_delay => 150,
       delay_time => 1300, fly_time => 0}];
effect_time(71242) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 700, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 150,
       delay_time => 650, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 350, fly_time => 0}];
effect_time(71243) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0},
     #{attack_type => 1, trigger => 6, hit_delay => 1500,
       delay_time => 2000, fly_time => 0}];
effect_time(71244) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1000, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 250,
       delay_time => 1200, fly_time => 0}];
effect_time(71245) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 50,
       delay_time => 800, fly_time => 0}];
effect_time(71249) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 200,
       delay_time => 1400, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(71250) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 50,
       delay_time => 800, fly_time => 0}];
effect_time(71251) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 50,
       delay_time => 800, fly_time => 0}];
effect_time(71252) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 300,
       delay_time => 800, fly_time => 0}];
effect_time(71253) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 300,
       delay_time => 800, fly_time => 0}];
effect_time(71254) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1500, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 250,
       delay_time => 1000, fly_time => 0}];
effect_time(71255) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1500, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 250,
       delay_time => 1000, fly_time => 0}];
effect_time(71256) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0},
     #{attack_type => 1, trigger => 6, hit_delay => 1500,
       delay_time => 2000, fly_time => 0}];
effect_time(71259) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 300,
       delay_time => 800, fly_time => 0}];
effect_time(71260) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 700, fly_time => 0}];
effect_time(71262) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1400, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1500, fly_time => 0}];
effect_time(71266) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 100,
       delay_time => 600, fly_time => 0}];
effect_time(71268) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(71269) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 100,
       delay_time => 600, fly_time => 0}];
effect_time(71270) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 350,
       delay_time => 1200, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 800, fly_time => 0}];
effect_time(71271) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 350,
       delay_time => 1200, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 800, fly_time => 0}];
effect_time(71273) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 300,
       delay_time => 1500, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1300, fly_time => 0}];
effect_time(71274) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 100,
       delay_time => 800, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1200, fly_time => 0}];
effect_time(71276) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0}];
effect_time(71278) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 300,
       delay_time => 450, fly_time => 300}];
effect_time(71279) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1000, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1500, fly_time => 0}];
effect_time(71281) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 50,
       delay_time => 800, fly_time => 0}];
effect_time(71289) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 350,
       delay_time => 900, fly_time => 0}];
effect_time(71291) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 800, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 300,
       delay_time => 450, fly_time => 300}];
effect_time(71292) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 3300, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(71296) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(71298) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(71307) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1400, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1500, fly_time => 0}];
effect_time(71308) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1500, fly_time => 0}];
effect_time(71309) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 600, fly_time => 0}];
effect_time(71310) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1800, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 300, fly_time => 0}];
effect_time(71312) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 950,
       delay_time => 1700, fly_time => 0}];
effect_time(71319) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1700, fly_time => 0}];
effect_time(71320) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1700, fly_time => 0}];
effect_time(71321) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1700, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 600, fly_time => 0}];
effect_time(71322) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 300,
       delay_time => 1500, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1300, fly_time => 0}];
effect_time(71323) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 400,
       delay_time => 1000, fly_time => 0}];
effect_time(71326) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 1500,
       delay_time => 2500, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 3000, fly_time => 0}];
effect_time(71330) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1400, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 400,
       delay_time => 1600}];
effect_time(71336) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 200,
       delay_time => 1400, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(71338) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1000, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 250,
       delay_time => 1200, fly_time => 0}];
effect_time(71339) ->
    [#{attack_type => 1, trigger => 3, hit_delay => 550,
       delay_time => 1000, fly_time => 0}];
effect_time(71340) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 50,
       delay_time => 800, fly_time => 0}];
effect_time(71341) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0}];
effect_time(71342) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 200,
       delay_time => 1400, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(71343) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 100,
       delay_time => 500, fly_time => 50},
     #{attack_type => 0, trigger => 2, hit_delay => 100,
       delay_time => 500, fly_time => 50}];
effect_time(71344) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(71345) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(71346) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0}];
effect_time(71351) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0}];
effect_time(71352) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0}];
effect_time(71353) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0}];
effect_time(71354) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 400,
       delay_time => 800, fly_time => 400}];
effect_time(71355) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0}];
effect_time(71357) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1600, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1700, fly_time => 0}];
effect_time(71360) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 300, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1500, fly_time => 0}];
effect_time(71361) ->
    [#{attack_type => 1, trigger => 6, hit_delay => 950,
       delay_time => 1700, fly_time => 0}];
effect_time(71362) ->
    [#{attack_type => 1, trigger => 6, hit_delay => 950,
       delay_time => 1700, fly_time => 0}];
effect_time(71363) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1400, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1500, fly_time => 0}];
effect_time(71364) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 400,
       delay_time => 1000, fly_time => 0}];
effect_time(71369) ->
    [#{attack_type => 1, trigger => 3, hit_delay => 550,
       delay_time => 1000, fly_time => 0}];
effect_time(71373) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 50,
       delay_time => 800, fly_time => 0}];
effect_time(71374) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 450,
       delay_time => 1000, fly_time => 400}];
effect_time(71376) ->
    [#{attack_type => 1, trigger => 6, hit_delay => 950,
       delay_time => 1700, fly_time => 0}];
effect_time(71377) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1400, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1500, fly_time => 0}];
effect_time(71379) ->
    [#{attack_type => 3, trigger => 2, hit_delay => 450,
       delay_time => 1000, fly_time => 400}];
effect_time(71380) ->
    [#{attack_type => 3, trigger => 2, hit_delay => 50,
       delay_time => 800, fly_time => 0}];
effect_time(71381) ->
    [#{attack_type => 3, trigger => 2, hit_delay => 450,
       delay_time => 1000, fly_time => 400}];
effect_time(71382) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 3, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0}];
effect_time(71383) ->
    [#{attack_type => 3, trigger => 2, hit_delay => 450,
       delay_time => 1000, fly_time => 400}];
effect_time(71386) ->
    [#{attack_type => 3, trigger => 2, hit_delay => 100,
       delay_time => 250, fly_time => 0}];
effect_time(71388) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1500, fly_time => 0}];
effect_time(71391) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1800, fly_time => 0}];
effect_time(71392) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 50,
       delay_time => 800, fly_time => 0}];
effect_time(71393) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 200,
       delay_time => 1400, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(71394) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 2500, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2700, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 1000,
       delay_time => 1400, fly_time => 0}];
effect_time(71395) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1600, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1700, fly_time => 0}];
effect_time(71396) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1400, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1500, fly_time => 0}];
effect_time(71397) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 50,
       delay_time => 700, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1300, fly_time => 0}];
effect_time(71401) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 300, fly_time => 0},
     #{attack_type => 1, trigger => 6, hit_delay => 450,
       delay_time => 1400, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0}];
effect_time(71403) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1100, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1100, fly_time => 0}];
effect_time(71404) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0}];
effect_time(71405) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 300, fly_time => 0}];
effect_time(71406) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 100,
       delay_time => 600, fly_time => 0}];
effect_time(71407) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1100, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1100, fly_time => 0}];
effect_time(71409) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1400, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1500, fly_time => 0}];
effect_time(71410) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1350, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1350, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 250,
       delay_time => 1000, fly_time => 0}];
effect_time(71415) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 1300, fly_time => 0}];
effect_time(71416) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 300,
       delay_time => 800, fly_time => 0}];
effect_time(71417) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 450,
       delay_time => 1000, fly_time => 400}];
effect_time(71432) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0}];
effect_time(71433) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 950,
       delay_time => 1700, fly_time => 0}];
effect_time(82205) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 950,
       delay_time => 1700, fly_time => 0}];
effect_time(71438) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 200,
       delay_time => 1400, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(71439) ->
    [#{attack_type => 1, trigger => 6, hit_delay => 700,
       delay_time => 2000, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0}];
effect_time(71440) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1600, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1700, fly_time => 0}];
effect_time(71441) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2300, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 3000, fly_time => 0}];
effect_time(71442) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1750, fly_time => 0},
     #{attack_type => 2, trigger => 6,
       hurt_ratio => [{1350, 1}, {400, 1}, {400, 8}],
       hit_delay => 1350, delay_time => 2200, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0}];
effect_time(71445) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1000, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 250,
       delay_time => 1200, fly_time => 0}];
effect_time(71446) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1600, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2300, fly_time => 0}];
effect_time(71447) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1200, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 500,
       delay_time => 1800, fly_time => 0}];
effect_time(71448) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1500, fly_time => 0},
     #{attack_type => 1, trigger => 6, hit_delay => 800,
       delay_time => 1500, fly_time => 0}];
effect_time(71450) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1350, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1350, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 250,
       delay_time => 1000, fly_time => 0}];
effect_time(71451) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 450,
       delay_time => 1000, fly_time => 400}];
effect_time(71455) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1350, fly_time => 0}];
effect_time(71453) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 450,
       delay_time => 1000, fly_time => 400},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(71454) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1400, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 400,
       delay_time => 1600}];
effect_time(71456) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 100,
       delay_time => 550, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(71457) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 700, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 150,
       delay_time => 650, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 350, fly_time => 0}];
effect_time(71458) ->
    [#{attack_type => 1, trigger => 6, hit_delay => 650,
       delay_time => 1200, fly_time => 0}];
effect_time(71460) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0},
     #{attack_type => 1, trigger => 3, hit_delay => 50,
       delay_time => 250, fly_time => 0},
     #{attack_type => 1, trigger => 3, hit_delay => 50,
       delay_time => 1000, fly_time => 0}];
effect_time(71462) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 600, fly_time => 0}];
effect_time(71466) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1400, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1500, fly_time => 0}];
effect_time(71463) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 700, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 150,
       delay_time => 650, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 350, fly_time => 0}];
effect_time(71464) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 50,
       delay_time => 800, fly_time => 0}];
effect_time(71465) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1350, fly_time => 0}];
effect_time(71467) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0}];
effect_time(71476) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 2500, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2700, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 1000,
       delay_time => 1400, fly_time => 0}];
effect_time(71478) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1500, fly_time => 0},
     #{attack_type => 1, trigger => 6, hit_delay => 700,
       delay_time => 2000, fly_time => 0}];
effect_time(71479) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1400, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1500, fly_time => 0}];
effect_time(71482) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0}];
effect_time(71484) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 1300, fly_time => 0}];
effect_time(71485) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 50,
       delay_time => 700, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1300, fly_time => 0}];
effect_time(71490) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 50,
       delay_time => 800, fly_time => 0}];
effect_time(71492) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 100,
       delay_time => 250, fly_time => 0}];
effect_time(71510) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 300,
       delay_time => 450, fly_time => 300}];
effect_time(71513) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 200,
       delay_time => 1800, fly_time => 0}];
effect_time(71516) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 600, fly_time => 0}];
effect_time(71518) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0},
     #{attack_type => 2, trigger => 6,
       hurt_ratio =>
           [{1000, 2},
            {200, 3},
            {500, 1},
            {100, 1},
            {100, 1},
            {100, 1},
            {100, 1},
            {100, 1}],
       hit_delay => 1000, delay_time => 4000, fly_time => 0}];
effect_time(71519) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 600, fly_time => 0}];
effect_time(71520) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 300,
       delay_time => 1500, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1300, fly_time => 0}];
effect_time(71521) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 1500,
       delay_time => 2500, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 3000, fly_time => 0}];
effect_time(71522) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 600, fly_time => 0}];
effect_time(71523) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 600, fly_time => 0}];
effect_time(71524) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0}];
effect_time(71525) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0},
     #{attack_type => 1, trigger => 3, hit_delay => 50,
       delay_time => 250, fly_time => 0},
     #{attack_type => 1, trigger => 3, hit_delay => 50,
       delay_time => 1000, fly_time => 0}];
effect_time(71528) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1350, fly_time => 0}];
effect_time(71529) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 50,
       delay_time => 1350, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1300, fly_time => 0}];
effect_time(71530) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1600, fly_time => 0}];
effect_time(71532) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 300,
       delay_time => 800, fly_time => 0}];
effect_time(71533) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 900, fly_time => 0},
     #{attack_type => 0, trigger => 3, hit_delay => 0,
       delay_time => 1300, fly_time => 0},
     #{attack_type => 1, trigger => 3, hit_delay => 150,
       delay_time => 1300, fly_time => 0}];
effect_time(71534) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 1500,
       delay_time => 2500, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 3000, fly_time => 0}];
effect_time(71535) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 100,
       delay_time => 250, fly_time => 0}];
effect_time(71539) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 300, fly_time => 300},
     #{attack_type => 1, trigger => 2, hit_delay => 350,
       delay_time => 1000, fly_time => 0}];
effect_time(71540) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 300, fly_time => 300},
     #{attack_type => 1, trigger => 2, hit_delay => 350,
       delay_time => 1000, fly_time => 0}];
effect_time(71541) ->
    [#{attack_type => 1, trigger => 6, hit_delay => 50,
       delay_time => 500, fly_time => 0}];
effect_time(71544) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 3, trigger => 2, hit_delay => 0,
       delay_time => 100, fly_time => 300},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(71545) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 300, fly_time => 0},
     #{attack_type => 1, trigger => 6, hit_delay => 450,
       delay_time => 1400, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0}];
effect_time(71547) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 800, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 300,
       delay_time => 450, fly_time => 300}];
effect_time(71549) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 1600, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1700, fly_time => 0}];
effect_time(71551) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1600, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1700, fly_time => 0}];
effect_time(71552) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 3000, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 1500,
       delay_time => 2500, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0}];
effect_time(71553) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 500,
       delay_time => 1500, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1800, fly_time => 0}];
effect_time(71554) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 200,
       delay_time => 700, fly_time => 200},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 350, fly_time => 0}];
effect_time(71555) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1200, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1500, fly_time => 0}];
effect_time(71556) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 1, trigger => 6, hit_delay => 550,
       delay_time => 1000, fly_time => 0}];
effect_time(71557) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 1, trigger => 6, hit_delay => 550,
       delay_time => 1000, fly_time => 0}];
effect_time(71560) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 300, fly_time => 300},
     #{attack_type => 1, trigger => 2, hit_delay => 350,
       delay_time => 1000, fly_time => 0}];
effect_time(71561) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 50,
       delay_time => 800, fly_time => 0}];
effect_time(71562) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0}];
effect_time(71563) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0}];
effect_time(71564) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0}];
effect_time(71566) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 450,
       delay_time => 1000, fly_time => 400},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1000, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(71567) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 200,
       delay_time => 1400, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1200, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(71568) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1500, fly_time => 0},
     #{attack_type => 1, trigger => 6, hit_delay => 700,
       delay_time => 2000, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0}];
effect_time(71569) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 2500, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2700, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 1000,
       delay_time => 1400, fly_time => 0}];
effect_time(71571) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 300, fly_time => 300},
     #{attack_type => 1, trigger => 2, hit_delay => 350,
       delay_time => 1000, fly_time => 0}];
effect_time(71573) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1400, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1500, fly_time => 0}];
effect_time(71577) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 300, fly_time => 300},
     #{attack_type => 1, trigger => 2, hit_delay => 350,
       delay_time => 1000, fly_time => 0}];
effect_time(71580) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1000, fly_time => 0}];
effect_time(71581) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 500,
       delay_time => 1000, fly_time => 0}];
effect_time(71584) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1400, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1750, fly_time => 0},
     #{attack_type => 2, trigger => 6,
       hurt_ratio => [{1350, 1}, {400, 1}, {400, 8}],
       hit_delay => 1350, delay_time => 2200, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0}];
effect_time(71588) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1400, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1500, fly_time => 0}];
effect_time(71589) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1400, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 400,
       delay_time => 1600}];
effect_time(71590) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 2500, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2700, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 1000,
       delay_time => 1400, fly_time => 0}];
effect_time(71591) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1400, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1750, fly_time => 0},
     #{attack_type => 2, trigger => 6,
       hurt_ratio => [{1350, 1}, {400, 1}, {400, 8}],
       hit_delay => 1350, delay_time => 2200, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0}];
effect_time(71592) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 200,
       delay_time => 1400, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1200, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(71597) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 600, fly_time => 0}];
effect_time(71598) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 1300, fly_time => 0}];
effect_time(71600) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 500, fly_time => 0}];
effect_time(71605) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 600, fly_time => 0}];
effect_time(71606) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 600, fly_time => 0}];
effect_time(71607) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 300,
       delay_time => 800, fly_time => 0}];
effect_time(71615) ->
    [#{attack_type => 1, trigger => 6, hit_delay => 50,
       delay_time => 500, fly_time => 0}];
effect_time(71620) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 100,
       delay_time => 1300, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 800, fly_time => 0}];
effect_time(71622) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1200, fly_time => 0}];
effect_time(71623) ->
    [#{attack_type => 1, trigger => 6, hit_delay => 50,
       delay_time => 500, fly_time => 0}];
effect_time(71624) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 300, fly_time => 300},
     #{attack_type => 1, trigger => 2, hit_delay => 350,
       delay_time => 1000, fly_time => 0}];
effect_time(71626) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1200, fly_time => 0}];
effect_time(71627) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1400, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 400,
       delay_time => 1600}];
effect_time(71628) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 300, fly_time => 300},
     #{attack_type => 1, trigger => 2, hit_delay => 350,
       delay_time => 1000, fly_time => 0}];
effect_time(71629) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 200,
       delay_time => 1500, fly_time => 0}];
effect_time(71641) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 50,
       delay_time => 800, fly_time => 0}];
effect_time(71642) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(71644) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0}];
effect_time(71645) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 200,
       delay_time => 1500, fly_time => 0}];
effect_time(71646) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1500, fly_time => 0}];
effect_time(71647) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 3000, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 1500,
       delay_time => 2500, fly_time => 0}];
effect_time(71655) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1600, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1700, fly_time => 0}];
effect_time(71656) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1600, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1700, fly_time => 0}];
effect_time(71657) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1600, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1700, fly_time => 0}];
effect_time(71669) ->
    [#{attack_type => 1, trigger => 6, hit_delay => 50,
       delay_time => 500, fly_time => 0}];
effect_time(71673) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0}];
effect_time(71674) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 200,
       delay_time => 1800, fly_time => 0}];
effect_time(71675) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 450,
       delay_time => 1000, fly_time => 400}];
effect_time(71678) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1500, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 400,
       delay_time => 1600}];
effect_time(71679) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 200,
       delay_time => 1400, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(71682) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1500, fly_time => 0}];
effect_time(71683) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 700, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 150,
       delay_time => 650, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 350, fly_time => 0}];
effect_time(71685) ->
    [#{attack_type => 2, trigger => 6,
       hurt_ratio => [{600, 1}, {500, 1}, {500, 1}],
       hit_delay => 600, delay_time => 2200, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2100, fly_time => 0}];
effect_time(71686) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1400, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1500, fly_time => 0}];
effect_time(71687) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1600, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1700, fly_time => 0}];
effect_time(71688) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 950,
       delay_time => 2000, fly_time => 0}];
effect_time(71689) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 50,
       delay_time => 800, fly_time => 0}];
effect_time(71690) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0},
     #{attack_type => 1, trigger => 3, hit_delay => 50,
       delay_time => 250, fly_time => 0},
     #{attack_type => 1, trigger => 3, hit_delay => 50,
       delay_time => 1000, fly_time => 0}];
effect_time(71691) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 600, fly_time => 0}];
effect_time(71692) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 50,
       delay_time => 800, fly_time => 0}];
effect_time(71693) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 50,
       delay_time => 700, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1300, fly_time => 0}];
effect_time(71694) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 950,
       delay_time => 2000, fly_time => 0}];
effect_time(71695) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 50,
       delay_time => 800, fly_time => 0}];
effect_time(71696) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 300,
       delay_time => 1300, fly_time => 0}];
effect_time(71697) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 300,
       delay_time => 1300, fly_time => 0}];
effect_time(71698) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1500, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 400,
       delay_time => 1600}];
effect_time(71699) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0}];
effect_time(71700) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1400, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1500, fly_time => 0}];
effect_time(71711) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1000, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 500,
       delay_time => 1200, fly_time => 0}];
effect_time(71712) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1000, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 500,
       delay_time => 1200, fly_time => 0}];
effect_time(71713) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1000, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 500,
       delay_time => 1200, fly_time => 0}];
effect_time(71714) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1000, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 500,
       delay_time => 1200, fly_time => 0}];
effect_time(71715) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1000, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 500,
       delay_time => 1200, fly_time => 0}];
effect_time(71717) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1000, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 500,
       delay_time => 1200, fly_time => 0}];
effect_time(71719) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1400, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1500, fly_time => 0}];
effect_time(71721) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1400, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1500, fly_time => 0}];
effect_time(71724) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 300, fly_time => 0},
     #{attack_type => 1, trigger => 6, hit_delay => 450,
       delay_time => 1400, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0}];
effect_time(71726) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 300,
       delay_time => 800, fly_time => 0}];
effect_time(71727) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 400,
       delay_time => 800, fly_time => 400}];
effect_time(71728) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 600, fly_time => 0}];
effect_time(71730) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 300, fly_time => 0},
     #{attack_type => 1, trigger => 6, hit_delay => 450,
       delay_time => 1400, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0}];
effect_time(71731) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 300,
       delay_time => 800, fly_time => 0}];
effect_time(71732) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 400,
       delay_time => 800, fly_time => 400}];
effect_time(71733) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 600, fly_time => 0}];
effect_time(71735) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2500, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1500, fly_time => 0},
     #{attack_type => 2, trigger => 2,
       hurt_ratio =>
           [{200, 1}, {300, 1}, {300, 1}, {300, 1}, {300, 1}],
       hit_delay => 200, delay_time => 1500, fly_time => 0}];
effect_time(71736) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 100,
       delay_time => 550, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(71737) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 100,
       delay_time => 600, fly_time => 0}];
effect_time(71739) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1200, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 100,
       delay_time => 800, fly_time => 0}];
effect_time(71741) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 600, fly_time => 0}];
effect_time(71744) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 250,
       delay_time => 1700, fly_time => 0}];
effect_time(71751) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 600, fly_time => 0}];
effect_time(71752) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 100,
       delay_time => 250, fly_time => 0}];
effect_time(71753) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 1500,
       delay_time => 2500, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 3000, fly_time => 0}];
effect_time(71754) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 700, fly_time => 0}];
effect_time(71755) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2500, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1500, fly_time => 0},
     #{attack_type => 2, trigger => 2,
       hurt_ratio =>
           [{200, 1}, {300, 1}, {300, 1}, {300, 1}, {300, 1}],
       hit_delay => 200, delay_time => 1500, fly_time => 0}];
effect_time(71756) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 50,
       delay_time => 700, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1300, fly_time => 0}];
effect_time(71757) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1200, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 100,
       delay_time => 800, fly_time => 0}];
effect_time(71758) ->
    [#{attack_type => 1, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 3300, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(71761) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 900, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 600,
       delay_time => 1500, fly_time => 0}];
effect_time(71762) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2300, fly_time => 0}];
effect_time(71763) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 200,
       delay_time => 700, fly_time => 200},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 350, fly_time => 0}];
effect_time(71764) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 1, trigger => 6, hit_delay => 550,
       delay_time => 1000, fly_time => 0}];
effect_time(71765) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1500, fly_time => 0},
     #{attack_type => 1, trigger => 6, hit_delay => 1350,
       delay_time => 1700, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(71767) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1400, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1500, fly_time => 0}];
effect_time(71768) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1200, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 250,
       delay_time => 700, fly_time => 0}];
effect_time(71769) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 2500, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2700, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 1000,
       delay_time => 1400, fly_time => 0}];
effect_time(71770) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1500, fly_time => 0},
     #{attack_type => 8, trigger => 6, hit_delay => 700,
       delay_time => 1300, fly_time => 0},
     #{attack_type => 9, trigger => 2, hit_delay => 100,
       delay_time => 800, fly_time => 0}];
effect_time(71771) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1400, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1500, fly_time => 0}];
effect_time(71772) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1600, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1700, fly_time => 0}];
effect_time(71773) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1000, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 600, fly_time => 0}];
effect_time(71774) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 50,
       delay_time => 700, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1300, fly_time => 0}];
effect_time(71775) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 1, trigger => 6, hit_delay => 750,
       delay_time => 1900, fly_time => 0}];
effect_time(71776) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 200,
       delay_time => 700, fly_time => 200},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 350, fly_time => 0}];
effect_time(71777) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 1, trigger => 6, hit_delay => 550,
       delay_time => 1000, fly_time => 0}];
effect_time(71778) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1300, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 350,
       delay_time => 1000, fly_time => 300},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(71779) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 700, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 150,
       delay_time => 650, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 350, fly_time => 0}];
effect_time(71780) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0},
     #{attack_type => 1, trigger => 3, hit_delay => 50,
       delay_time => 250, fly_time => 0},
     #{attack_type => 1, trigger => 3, hit_delay => 50,
       delay_time => 1000, fly_time => 0}];
effect_time(71781) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1500, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2600, fly_time => 0},
     #{attack_type => 2, trigger => 6,
       hurt_ratio => [{850, 1}, {200, 1}, {200, 1}, {600, 5}],
       hit_delay => 850, delay_time => 2600, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(71782) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1100, fly_time => 0},
     #{attack_type => 2, trigger => 6,
       hurt_ratio =>
           [{450, 1}, {150, 1}, {150, 1}, {150, 1}, {350, 20}],
       hit_delay => 450, delay_time => 1450, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(71783) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 950,
       delay_time => 1700, fly_time => 0}];
effect_time(71784) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1400, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1500, fly_time => 0}];
effect_time(71785) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1350, fly_time => 0}];
effect_time(71786) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 3, trigger => 2, hit_delay => 0,
       delay_time => 100, fly_time => 300},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(71787) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 100,
       delay_time => 1300, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 800, fly_time => 0}];
effect_time(71788) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 1300, fly_time => 0}];
effect_time(71794) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 950,
       delay_time => 1700, fly_time => 0}];
effect_time(71795) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1350, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1350, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 250,
       delay_time => 1000, fly_time => 0}];
effect_time(71796) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 200,
       delay_time => 1400, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(71797) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1400, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 400,
       delay_time => 1600}];
effect_time(71800) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1200, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1200, fly_time => 0}];
effect_time(71801) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1750, fly_time => 0},
     #{attack_type => 2, trigger => 6,
       hurt_ratio => [{1350, 1}, {400, 1}, {400, 8}],
       hit_delay => 1350, delay_time => 2200, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0}];
effect_time(71803) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 600, fly_time => 0}];
effect_time(71807) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 160,
       delay_time => 700}];
effect_time(71804) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1200, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1200, fly_time => 0}];
effect_time(71805) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 50,
       delay_time => 800, fly_time => 0}];
effect_time(71806) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 400,
       delay_time => 800, fly_time => 400}];
effect_time(71809) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 450,
       delay_time => 1000, fly_time => 400},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(71813) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0}];
effect_time(71814) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 400,
       delay_time => 800, fly_time => 400}];
effect_time(71815) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 50,
       delay_time => 800, fly_time => 0}];
effect_time(71816) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1750, fly_time => 0},
     #{attack_type => 2, trigger => 6,
       hurt_ratio => [{1350, 1}, {400, 1}, {400, 8}],
       hit_delay => 1350, delay_time => 2200, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0}];
effect_time(71817) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 3000, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 1500,
       delay_time => 2500, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0}];
effect_time(71818) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 2500, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2700, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 1000,
       delay_time => 1400, fly_time => 0}];
effect_time(71819) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 200,
       delay_time => 1800, fly_time => 0}];
effect_time(71821) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 300,
       delay_time => 1500, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1300, fly_time => 0}];
effect_time(71822) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1400, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1500, fly_time => 0}];
effect_time(71827) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1500, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2600, fly_time => 0},
     #{attack_type => 2, trigger => 6,
       hurt_ratio => [{850, 1}, {200, 1}, {200, 1}, {600, 5}],
       hit_delay => 850, delay_time => 2600, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(71828) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 900, fly_time => 0},
     #{attack_type => 0, trigger => 3, hit_delay => 0,
       delay_time => 1300, fly_time => 0},
     #{attack_type => 1, trigger => 3, hit_delay => 150,
       delay_time => 1300, fly_time => 0}];
effect_time(71820) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 400,
       delay_time => 800, fly_time => 400}];
effect_time(71831) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 300,
       delay_time => 1000, fly_time => 420}];
effect_time(71832) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1400, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1750, fly_time => 0},
     #{attack_type => 2, trigger => 6,
       hurt_ratio => [{1350, 1}, {400, 1}, {400, 8}],
       hit_delay => 1350, delay_time => 2200, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0}];
effect_time(71840) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 300,
       delay_time => 1500, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1300, fly_time => 0}];
effect_time(71841) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 500,
       delay_time => 1500, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1800, fly_time => 0}];
effect_time(71842) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 50,
       delay_time => 1300, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1100}];
effect_time(71850) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 700, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 150,
       delay_time => 650, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 350, fly_time => 0}];
effect_time(71851) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0},
     #{attack_type => 1, trigger => 3, hit_delay => 50,
       delay_time => 250, fly_time => 0}];
effect_time(71852) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1500, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2600, fly_time => 0},
     #{attack_type => 2, trigger => 6,
       hurt_ratio => [{850, 1}, {200, 1}, {200, 1}, {600, 5}],
       hit_delay => 850, delay_time => 2600, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(71854) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 100,
       delay_time => 550, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(71855) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 700, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 150,
       delay_time => 650, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 350, fly_time => 0}];
effect_time(71860) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 50,
       delay_time => 800, fly_time => 0}];
effect_time(71861) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 600, fly_time => 0}];
effect_time(71862) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 600, fly_time => 0}];
effect_time(71870) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 1300, fly_time => 0}];
effect_time(71871) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 300,
       delay_time => 800, fly_time => 0}];
effect_time(71873) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 600, fly_time => 0}];
effect_time(71874) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1750, fly_time => 0},
     #{attack_type => 2, trigger => 6,
       hurt_ratio => [{1350, 1}, {400, 1}, {400, 8}],
       hit_delay => 1350, delay_time => 2200, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0}];
effect_time(71882) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1600, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1700, fly_time => 0}];
effect_time(71883) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1400, fly_time => 0}];
effect_time(71890) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1000, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0}];
effect_time(71891) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 1300, fly_time => 0}];
effect_time(71892) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 300,
       delay_time => 1500, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1300, fly_time => 0}];
effect_time(71893) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 100,
       delay_time => 1300, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 800, fly_time => 0}];
effect_time(71902) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 300,
       delay_time => 1500, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1300, fly_time => 0}];
effect_time(71903) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1750, fly_time => 0},
     #{attack_type => 2, trigger => 6,
       hurt_ratio => [{1350, 1}, {400, 1}, {400, 8}],
       hit_delay => 1350, delay_time => 2200, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0}];
effect_time(71904) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1200, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 250,
       delay_time => 700, fly_time => 0}];
effect_time(71917) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1200, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 100,
       delay_time => 800, fly_time => 0}];
effect_time(71918) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 600, fly_time => 0}];
effect_time(71920) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1400, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1500, fly_time => 0}];
effect_time(71921) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 2500, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2700, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 1000,
       delay_time => 1400, fly_time => 0}];
effect_time(71926) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1600, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1700, fly_time => 0}];
effect_time(71916) ->
    [#{attack_type => 4, trigger => 2, hit_delay => 0,
       delay_time => 1000, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 300, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1200, fly_time => 0}];
effect_time(80016) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 500, fly_time => 0}];
effect_time(82049) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 100,
       delay_time => 550, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(82050) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 700, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 150,
       delay_time => 650, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 350, fly_time => 0}];
effect_time(82051) ->
    [#{attack_type => 1, trigger => 6, hit_delay => 650,
       delay_time => 1200, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(82052) ->
    [#{attack_type => 1, trigger => 3, hit_delay => 50,
       delay_time => 250, fly_time => 0},
     #{attack_type => 1, trigger => 3, hit_delay => 50,
       delay_time => 1000, fly_time => 0}];
effect_time(71932) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 300,
       delay_time => 1500, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1300, fly_time => 0}];
effect_time(71931) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1750, fly_time => 0},
     #{attack_type => 2, trigger => 6,
       hurt_ratio => [{1350, 1}, {400, 1}, {400, 8}],
       hit_delay => 1350, delay_time => 2200, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0}];
effect_time(71933) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1200, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 250,
       delay_time => 700, fly_time => 0}];
effect_time(71934) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1500, fly_time => 0},
     #{attack_type => 1, trigger => 6, hit_delay => 1250,
       delay_time => 2000, fly_time => 0}];
effect_time(71935) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1200, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 100,
       delay_time => 800, fly_time => 0}];
effect_time(71936) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 300,
       delay_time => 1500, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1300, fly_time => 0}];
effect_time(71937) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 2500, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2700, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 1000,
       delay_time => 1400, fly_time => 0}];
effect_time(71938) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1500, fly_time => 0},
     #{attack_type => 1, trigger => 6, hit_delay => 1250,
       delay_time => 2000, fly_time => 0}];
effect_time(71939) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1200, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 100,
       delay_time => 800, fly_time => 0}];
effect_time(71940) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 300,
       delay_time => 1500, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1300, fly_time => 0}];
effect_time(71941) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 2500, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2700, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 1000,
       delay_time => 1400, fly_time => 0}];
effect_time(71942) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1500, fly_time => 0},
     #{attack_type => 1, trigger => 6, hit_delay => 1250,
       delay_time => 2000, fly_time => 0}];
effect_time(72000) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1200, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 100,
       delay_time => 800, fly_time => 0}];
effect_time(72001) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0}];
effect_time(72004) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2500, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1500, fly_time => 0},
     #{attack_type => 2, trigger => 2,
       hurt_ratio =>
           [{200, 1}, {300, 1}, {300, 1}, {300, 1}, {300, 1}],
       hit_delay => 200, delay_time => 1500, fly_time => 0}];
effect_time(72006) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1400, fly_time => 0}];
effect_time(72007) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0}];
effect_time(72008) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1000, fly_time => 0}];
effect_time(72009) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0}];
effect_time(72011) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1600, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2300, fly_time => 0}];
effect_time(72012) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1600, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2300, fly_time => 0}];
effect_time(72013) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1600, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2300, fly_time => 0}];
effect_time(72014) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1600, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2300, fly_time => 0}];
effect_time(72015) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1600, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2300, fly_time => 0}];
effect_time(72018) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 900, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 600,
       delay_time => 1500, fly_time => 0}];
effect_time(72019) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 900, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 600,
       delay_time => 1500, fly_time => 0}];
effect_time(72020) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 700, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 150,
       delay_time => 650, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 350, fly_time => 0}];
effect_time(72021) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 50,
       delay_time => 800, fly_time => 0}];
effect_time(72022) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1600, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1700, fly_time => 0}];
effect_time(72034) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0},
     #{attack_type => 1, trigger => 6, hit_delay => 1500,
       delay_time => 2000, fly_time => 0}];
effect_time(72035) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1400, fly_time => 0}];
effect_time(72037) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 50,
       delay_time => 800, fly_time => 0}];
effect_time(72036) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 300,
       delay_time => 800, fly_time => 0}];
effect_time(72038) ->
    [#{attack_type => 1, trigger => 6, hit_delay => 460,
       delay_time => 1200, fly_time => 0}];
effect_time(72039) ->
    [#{attack_type => 1, trigger => 3, hit_delay => 50,
       delay_time => 1100, fly_time => 0},
     #{attack_type => 1, trigger => 3, hit_delay => 50,
       delay_time => 700, fly_time => 0}];
effect_time(72040) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1200, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 1500,
       delay_time => 2500, fly_time => 0}];
effect_time(72041) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1000, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 250,
       delay_time => 1200, fly_time => 0}];
effect_time(72042) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1500, fly_time => 0},
     #{attack_type => 1, trigger => 6, hit_delay => 800,
       delay_time => 1500, fly_time => 0}];
effect_time(72043) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 200,
       delay_time => 500, fly_time => 200},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(72044) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1500, fly_time => 0},
     #{attack_type => 1, trigger => 6, hit_delay => 1350,
       delay_time => 1700, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(72045) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 200,
       delay_time => 700, fly_time => 200},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 350, fly_time => 0}];
effect_time(72046) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 1, trigger => 6, hit_delay => 550,
       delay_time => 1000, fly_time => 0}];
effect_time(72047) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1300, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 350,
       delay_time => 1000, fly_time => 300},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(72048) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 600, fly_time => 0}];
effect_time(72050) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 50,
       delay_time => 800, fly_time => 0}];
effect_time(72049) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 700, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 150,
       delay_time => 650, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 350, fly_time => 0}];
effect_time(72051) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0}];
effect_time(72052) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 200,
       delay_time => 1400, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(72053) ->
    [#{attack_type => 1, trigger => 6, hit_delay => 700,
       delay_time => 2000, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0}];
effect_time(72054) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1750, fly_time => 0},
     #{attack_type => 2, trigger => 6,
       hurt_ratio => [{1350, 1}, {400, 1}, {400, 8}],
       hit_delay => 1350, delay_time => 2200, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0}];
effect_time(72055) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 2500, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2700, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 1000,
       delay_time => 1400, fly_time => 0}];
effect_time(72056) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1350, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1350, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 250,
       delay_time => 1000, fly_time => 0}];
effect_time(72059) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1350, fly_time => 0}];
effect_time(72057) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 450,
       delay_time => 1000, fly_time => 400}];
effect_time(72058) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1400, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 400,
       delay_time => 1600}];
effect_time(72060) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 1500,
       delay_time => 500, fly_time => 500},
     #{attack_type => 3, trigger => 2, hit_delay => 500,
       delay_time => 500, fly_time => 500},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1000, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(72061) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 4500, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(72062) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 600, fly_time => 0}];
effect_time(72063) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 50,
       delay_time => 800, fly_time => 0}];
effect_time(72064) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1800, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 300, fly_time => 0}];
effect_time(72067) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 300, fly_time => 300},
     #{attack_type => 1, trigger => 2, hit_delay => 350,
       delay_time => 1000, fly_time => 0}];
effect_time(72068) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 50,
       delay_time => 800, fly_time => 0}];
effect_time(72069) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 50,
       delay_time => 800, fly_time => 0}];
effect_time(72070) ->
    [#{attack_type => 1, trigger => 6, hit_delay => 1350,
       delay_time => 2000, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0}];
effect_time(72072) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1500, fly_time => 0},
     #{attack_type => 2, trigger => 6,
       hurt_ratio => [{800, 1}, {200, 1}, {200, 1}, {600, 5}],
       hit_delay => 800, delay_time => 2600, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(72073) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0},
     #{attack_type => 1, trigger => 3, hit_delay => 50,
       delay_time => 250, fly_time => 0},
     #{attack_type => 1, trigger => 3, hit_delay => 50,
       delay_time => 1000, fly_time => 0}];
effect_time(72074) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 700, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 150,
       delay_time => 650, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 350, fly_time => 0}];
effect_time(72076) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1800, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 300, fly_time => 0}];
effect_time(72077) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 600, fly_time => 0}];
effect_time(72078) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1800, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 300, fly_time => 0}];
effect_time(72079) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 600, fly_time => 0}];
effect_time(82100) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1500, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(82101) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 150,
       delay_time => 800, fly_time => 0}];
effect_time(82103) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 600, fly_time => 0}];
effect_time(82104) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1200, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(82105) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1200, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(82107) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 400, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1700, fly_time => 0}];
effect_time(82108) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1200, fly_time => 0}];
effect_time(82109) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1350, fly_time => 0}];
effect_time(82110) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1200, fly_time => 0}];
effect_time(82111) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1800, fly_time => 0}];
effect_time(82120) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1200, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(82123) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 400, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1700, fly_time => 0}];
effect_time(82124) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1500, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(82125) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1350, fly_time => 0}];
effect_time(82126) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 150,
       delay_time => 800, fly_time => 0}];
effect_time(82127) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1200, fly_time => 0}];
effect_time(82128) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1800, fly_time => 0}];
effect_time(82150) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1000, fly_time => 0}];
effect_time(82152) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 300,
       delay_time => 700, fly_time => 300}];
effect_time(82153) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 300,
       delay_time => 700, fly_time => 300},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 500, fly_time => 0}];
effect_time(82154) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 300,
       delay_time => 700, fly_time => 300},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 500, fly_time => 0}];
effect_time(82157) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1000, fly_time => 0}];
effect_time(82158) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1000, fly_time => 0}];
effect_time(82161) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 700, fly_time => 0}];
effect_time(82163) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 300,
       delay_time => 700, fly_time => 300},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 500, fly_time => 0}];
effect_time(82165) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1000, fly_time => 0}];
effect_time(82166) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 300,
       delay_time => 700, fly_time => 300}];
effect_time(82167) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 300,
       delay_time => 700, fly_time => 300}];
effect_time(82168) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 300,
       delay_time => 700, fly_time => 300},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 500, fly_time => 0}];
effect_time(82169) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 300,
       delay_time => 700, fly_time => 300},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 500, fly_time => 0}];
effect_time(82172) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1000, fly_time => 0}];
effect_time(82173) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1000, fly_time => 0}];
effect_time(82174) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1000, fly_time => 0}];
effect_time(82175) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1000, fly_time => 0}];
effect_time(82192) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 300,
       delay_time => 1500, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1300, fly_time => 0}];
effect_time(82193) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 500,
       delay_time => 1500, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1800, fly_time => 0}];
effect_time(82194) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 50,
       delay_time => 1300, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1100}];
effect_time(82196) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1500, fly_time => 0},
     #{attack_type => 1, trigger => 6, hit_delay => 1250,
       delay_time => 2000, fly_time => 0}];
effect_time(82197) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1800, fly_time => 0}];
effect_time(82200) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 250,
       delay_time => 800, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0}];
effect_time(82201) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 100,
       delay_time => 500, fly_time => 0}];
effect_time(82202) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 250,
       delay_time => 800, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0}];
effect_time(82203) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 350,
       delay_time => 1300, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0}];
effect_time(82206) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 50,
       delay_time => 800, fly_time => 0}];
effect_time(82208) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 250,
       delay_time => 800, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0}];
effect_time(82209) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 100,
       delay_time => 500, fly_time => 0}];
effect_time(82210) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 250,
       delay_time => 800, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0}];
effect_time(82211) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 350,
       delay_time => 1300, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0}];
effect_time(82212) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 250,
       delay_time => 800, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0}];
effect_time(82213) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 100,
       delay_time => 500, fly_time => 0}];
effect_time(82214) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 250,
       delay_time => 800, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0}];
effect_time(82215) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 350,
       delay_time => 1300, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0}];
effect_time(82216) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 250,
       delay_time => 800, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0}];
effect_time(82217) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 100,
       delay_time => 500, fly_time => 0}];
effect_time(82218) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 250,
       delay_time => 800, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0}];
effect_time(82219) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 350,
       delay_time => 1300, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0}];
effect_time(82220) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 250,
       delay_time => 800, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0}];
effect_time(82221) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 100,
       delay_time => 500, fly_time => 0}];
effect_time(82222) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 250,
       delay_time => 800, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0}];
effect_time(82223) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 350,
       delay_time => 1300, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0}];
effect_time(82224) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 250,
       delay_time => 800, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0}];
effect_time(82225) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 100,
       delay_time => 500, fly_time => 0}];
effect_time(82226) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 250,
       delay_time => 800, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0}];
effect_time(82227) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 350,
       delay_time => 1300, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0}];
effect_time(82228) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 250,
       delay_time => 800, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0}];
effect_time(82229) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 100,
       delay_time => 500, fly_time => 0}];
effect_time(82230) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 250,
       delay_time => 800, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0}];
effect_time(82231) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 350,
       delay_time => 1300, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0}];
effect_time(82232) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 250,
       delay_time => 800, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0}];
effect_time(82233) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 100,
       delay_time => 500, fly_time => 0}];
effect_time(82234) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 250,
       delay_time => 800, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0}];
effect_time(82235) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 350,
       delay_time => 1300, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0}];
effect_time(82236) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 250,
       delay_time => 800, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0}];
effect_time(82237) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 100,
       delay_time => 500, fly_time => 0}];
effect_time(82238) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 250,
       delay_time => 800, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0}];
effect_time(82239) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 350,
       delay_time => 1300, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0}];
effect_time(83001) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1500, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 600, fly_time => 0}];
effect_time(83002) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 600, fly_time => 0}];
effect_time(83000) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1500, fly_time => 0}];
effect_time(83030) ->
    [#{attack_type => 3, trigger => 2, hit_delay => 100,
       delay_time => 250, fly_time => 0}];
effect_time(84054) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 600, fly_time => 0}];
effect_time(84059) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 600, fly_time => 0}];
effect_time(84055) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1200, fly_time => 0}];
effect_time(84154) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 600, fly_time => 0}];
effect_time(84159) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 600, fly_time => 0}];
effect_time(84155) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1200, fly_time => 0}];
effect_time(85052) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1200, fly_time => 0}];
effect_time(85055) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1200, fly_time => 0}];
effect_time(85152) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1200, fly_time => 0}];
effect_time(85155) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1200, fly_time => 0}];
effect_time(85252) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1200, fly_time => 0}];
effect_time(85255) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1200, fly_time => 0}];
effect_time(84254) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 600, fly_time => 0}];
effect_time(84259) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 600, fly_time => 0}];
effect_time(84255) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1200, fly_time => 0}];
effect_time(85057) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1200, fly_time => 0}];
effect_time(85157) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1200, fly_time => 0}];
effect_time(85257) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1200, fly_time => 0}];
effect_time(86008) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 50,
       delay_time => 700, fly_time => 0}];
effect_time(86004) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1400, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1500, fly_time => 0}];
effect_time(86006) ->
    [#{attack_type => 0, trigger => 2, delay_time => 1000}];
effect_time(86007) ->
    [#{attack_type => 0, trigger => 2, delay_time => 300}];
effect_time(86009) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 160,
       delay_time => 700}];
effect_time(86100) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 100,
       delay_time => 550, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(86101) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0},
     #{attack_type => 1, trigger => 3, hit_delay => 50,
       delay_time => 250, fly_time => 0}];
effect_time(86102) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1100, fly_time => 0},
     #{attack_type => 2, trigger => 6,
       hurt_ratio =>
           [{450, 1}, {150, 1}, {150, 1}, {150, 1}, {350, 20}],
       hit_delay => 450, delay_time => 1450, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(86103) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1200, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 250,
       delay_time => 700, fly_time => 0}];
effect_time(86104) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1500, fly_time => 0},
     #{attack_type => 1, trigger => 6, hit_delay => 700,
       delay_time => 2000, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0}];
effect_time(86105) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 2500, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2700, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 1000,
       delay_time => 1400, fly_time => 0}];
effect_time(86106) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1500, fly_time => 0},
     #{attack_type => 1, trigger => 6, hit_delay => 1350,
       delay_time => 1700, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(86107) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 1, trigger => 6, hit_delay => 550,
       delay_time => 1000, fly_time => 0}];
effect_time(86108) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 200,
       delay_time => 700, fly_time => 200},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 350, fly_time => 0}];
effect_time(86109) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1000, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 600, fly_time => 0}];
effect_time(86110) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 50,
       delay_time => 700, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1300, fly_time => 0}];
effect_time(86111) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 900, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0}];
effect_time(86112) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1400, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1500, fly_time => 0}];
effect_time(86113) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1600, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1700, fly_time => 0}];
effect_time(86115) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1200, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1200, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 450,
       delay_time => 1200, fly_time => 0}];
effect_time(86116) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1200, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 150,
       delay_time => 500, fly_time => 0}];
effect_time(86117) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 300,
       delay_time => 1000, fly_time => 300},
     #{attack_type => 0, trigger => 6, hit_delay => 1500,
       delay_time => 700, fly_time => 0}];
effect_time(86121) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 1500,
       delay_time => 1000, fly_time => 0}];
effect_time(86122) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1400, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1500, fly_time => 0}];
effect_time(86123) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1400, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 500,
       delay_time => 1800, fly_time => 0}];
effect_time(86124) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1400, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1500, fly_time => 0}];
effect_time(86125) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1200, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 500,
       delay_time => 1800, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1500, fly_time => 0}];
effect_time(86126) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1100, fly_time => 0}];
effect_time(86127) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1200, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 500,
       delay_time => 1800, fly_time => 0}];
effect_time(88001) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 100,
       delay_time => 400, fly_time => 0}];
effect_time(88002) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 250,
       delay_time => 400, fly_time => 0}];
effect_time(88003) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1400, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(88004) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1600, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(88005) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1400, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(88006) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1600, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(88007) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(88008) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 700, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(88009) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 400, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1600, fly_time => 0}];
effect_time(88010) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 400, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1700, fly_time => 0}];
effect_time(88011) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 400, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1700, fly_time => 0}];
effect_time(88012) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 400, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1500, fly_time => 0}];
effect_time(88013) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1000, fly_time => 0}];
effect_time(88014) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 400, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1000, fly_time => 0}];
effect_time(88015) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 400, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1500, fly_time => 0}];
effect_time(88016) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(88017) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0}];
effect_time(88018) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 700, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1400, fly_time => 0}];
effect_time(88019) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1000, fly_time => 0}];
effect_time(88020) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0}];
effect_time(88021) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1350, fly_time => 0}];
effect_time(88022) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 700, fly_time => 0}];
effect_time(88023) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0}];
effect_time(88024) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 600, fly_time => 0}];
effect_time(88025) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 900, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 600,
       delay_time => 900, fly_time => 0}];
effect_time(88026) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1300, fly_time => 0}];
effect_time(88027) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1800, fly_time => 0}];
effect_time(88028) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 900, fly_time => 0}];
effect_time(88029) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 900, fly_time => 0}];
effect_time(88030) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0}];
effect_time(88031) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0}];
effect_time(88032) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1200, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0}];
effect_time(88033) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 400, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1000, fly_time => 0}];
effect_time(88034) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 400, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1600, fly_time => 0}];
effect_time(88035) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 400, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1000, fly_time => 0}];
effect_time(88037) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1000, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 300, fly_time => 0}];
effect_time(88200) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1500, fly_time => 0}];
effect_time(88201) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1500, fly_time => 0}];
effect_time(88126) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 600, fly_time => 0}];
effect_time(88127) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 600, fly_time => 0}];
effect_time(88128) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 600, fly_time => 0}];
effect_time(88129) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 600, fly_time => 0}];
effect_time(88202) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1500, fly_time => 0}];
effect_time(88203) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1500, fly_time => 0}];
effect_time(88301) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 100,
       delay_time => 400, fly_time => 0}];
effect_time(88302) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 250,
       delay_time => 400, fly_time => 0}];
effect_time(88311) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 400, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1700, fly_time => 0}];
effect_time(88307) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(88313) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1000, fly_time => 0}];
effect_time(88317) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0}];
effect_time(88318) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1200, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(89001) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 100,
       delay_time => 400, fly_time => 0}];
effect_time(89002) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 250,
       delay_time => 400, fly_time => 0}];
effect_time(89003) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1400, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(89004) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1600, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(89005) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1400, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(89006) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1600, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(89007) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(89008) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 700, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(89009) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 400, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1600, fly_time => 0}];
effect_time(89010) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 400, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1700, fly_time => 0}];
effect_time(89011) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 400, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1700, fly_time => 0}];
effect_time(89012) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 400, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1500, fly_time => 0}];
effect_time(89013) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1000, fly_time => 0}];
effect_time(89014) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 400, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1000, fly_time => 0}];
effect_time(89015) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 400, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1500, fly_time => 0}];
effect_time(89016) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(89017) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0}];
effect_time(89018) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 700, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1400, fly_time => 0}];
effect_time(89019) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1000, fly_time => 0}];
effect_time(89020) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0}];
effect_time(89021) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1350, fly_time => 0}];
effect_time(89022) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 700, fly_time => 0}];
effect_time(89023) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0}];
effect_time(89024) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 600, fly_time => 0}];
effect_time(89025) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 900, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 600,
       delay_time => 900, fly_time => 0}];
effect_time(89026) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1300, fly_time => 0}];
effect_time(89027) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1800, fly_time => 0}];
effect_time(89028) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 900, fly_time => 0}];
effect_time(89029) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 900, fly_time => 0}];
effect_time(89030) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0}];
effect_time(89031) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0}];
effect_time(89032) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1200, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0}];
effect_time(89033) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 400, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1000, fly_time => 0}];
effect_time(89034) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 400, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1600, fly_time => 0}];
effect_time(89035) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 400, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1000, fly_time => 0}];
effect_time(89120) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 100,
       delay_time => 400, fly_time => 0}];
effect_time(89121) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 250,
       delay_time => 400, fly_time => 0}];
effect_time(89122) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1400, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(89123) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1600, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(89124) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1400, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(89125) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1600, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(89126) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(89127) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 700, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(89128) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 400, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1600, fly_time => 0}];
effect_time(89129) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 400, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1700, fly_time => 0}];
effect_time(89130) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 400, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1700, fly_time => 0}];
effect_time(89131) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 400, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1500, fly_time => 0}];
effect_time(89132) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1000, fly_time => 0}];
effect_time(89133) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 400, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1000, fly_time => 0}];
effect_time(89134) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 400, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1500, fly_time => 0}];
effect_time(89135) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(89136) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0}];
effect_time(89137) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 700, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1400, fly_time => 0}];
effect_time(89138) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1000, fly_time => 0}];
effect_time(89139) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0}];
effect_time(89140) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1350, fly_time => 0}];
effect_time(89141) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 700, fly_time => 0}];
effect_time(89142) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0}];
effect_time(89143) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 600, fly_time => 0}];
effect_time(89144) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 900, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 600,
       delay_time => 900, fly_time => 0}];
effect_time(89145) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1300, fly_time => 0}];
effect_time(89146) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1800, fly_time => 0}];
effect_time(89147) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 900, fly_time => 0}];
effect_time(89148) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 900, fly_time => 0}];
effect_time(89149) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0}];
effect_time(89150) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0}];
effect_time(89151) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1200, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0}];
effect_time(89152) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 400, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1000, fly_time => 0}];
effect_time(89153) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 400, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1600, fly_time => 0}];
effect_time(89154) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 400, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1000, fly_time => 0}];
effect_time(89213) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1000, fly_time => 0}];
effect_time(91001) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 100,
       delay_time => 550, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(91002) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 700, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 150,
       delay_time => 650, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 350, fly_time => 0}];
effect_time(91003) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0},
     #{attack_type => 1, trigger => 3, hit_delay => 50,
       delay_time => 250, fly_time => 0},
     #{attack_type => 1, trigger => 3, hit_delay => 50,
       delay_time => 1000, fly_time => 0}];
effect_time(91004) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1100, fly_time => 0},
     #{attack_type => 2, trigger => 6,
       hurt_ratio =>
           [{450, 1}, {150, 1}, {150, 1}, {150, 1}, {350, 20}],
       hit_delay => 450, delay_time => 1450, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(91005) ->
    [#{attack_type => 1, trigger => 6, hit_delay => 650,
       delay_time => 1200, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(91006) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1300, fly_time => 0},
     #{attack_type => 1, trigger => 6, hit_delay => 150,
       delay_time => 1300, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 900, fly_time => 0},
     #{attack_type => 0, trigger => 3, hit_delay => 0,
       delay_time => 1300, fly_time => 0},
     #{attack_type => 1, trigger => 3, hit_delay => 150,
       delay_time => 1300, fly_time => 0}];
effect_time(91007) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1500, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2600, fly_time => 0},
     #{attack_type => 2, trigger => 6,
       hurt_ratio => [{850, 1}, {200, 1}, {200, 1}, {600, 5}],
       hit_delay => 850, delay_time => 2600, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(92001) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 450,
       delay_time => 1000, fly_time => 400},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1000, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(92002) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1200, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 250,
       delay_time => 700, fly_time => 0}];
effect_time(92003) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1500, fly_time => 0},
     #{attack_type => 1, trigger => 6, hit_delay => 700,
       delay_time => 2000, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0}];
effect_time(92004) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 3300, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(92005) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 2500, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2700, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 1000,
       delay_time => 1400, fly_time => 0}];
effect_time(92006) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2300, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 3000, fly_time => 0}];
effect_time(92007) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1500, fly_time => 0},
     #{attack_type => 8, trigger => 6, hit_delay => 700,
       delay_time => 1300, fly_time => 0},
     #{attack_type => 9, trigger => 2, hit_delay => 100,
       delay_time => 800, fly_time => 0}];
effect_time(93001) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 200,
       delay_time => 500, fly_time => 200},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(93002) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1500, fly_time => 0},
     #{attack_type => 1, trigger => 6, hit_delay => 1350,
       delay_time => 1700, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(93003) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 200,
       delay_time => 700, fly_time => 200},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 350, fly_time => 0}];
effect_time(93004) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1200, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1500, fly_time => 0}];
effect_time(93005) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 1, trigger => 6, hit_delay => 550,
       delay_time => 1000, fly_time => 0}];
effect_time(93006) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1500, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 350,
       delay_time => 900, fly_time => 0}];
effect_time(93007) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1300, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 350,
       delay_time => 1000, fly_time => 300},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(94001) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 300, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 900, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 600, fly_time => 0}];
effect_time(94002) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 300, fly_time => 0},
     #{attack_type => 1, trigger => 6, hit_delay => 450,
       delay_time => 1400, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0}];
effect_time(94003) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 50,
       delay_time => 700, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1300, fly_time => 0}];
effect_time(94004) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1350, fly_time => 0}];
effect_time(94005) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 1, trigger => 6, hit_delay => 750,
       delay_time => 1900, fly_time => 0}];
effect_time(94006) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 600, fly_time => 0}];
effect_time(94007) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 900, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0}];
effect_time(95001) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 700, fly_time => 300},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 700, fly_time => 0}];
effect_time(95003) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1400, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1500, fly_time => 0}];
effect_time(95004) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 1500,
       delay_time => 2500, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 3000, fly_time => 0}];
effect_time(95002) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0},
     #{attack_type => 1, trigger => 6, hit_delay => 1500,
       delay_time => 2000, fly_time => 0}];
effect_time(95005) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1600, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1700, fly_time => 0}];
effect_time(95006) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0},
     #{attack_type => 2, trigger => 6,
       hurt_ratio =>
           [{1000, 2},
            {200, 3},
            {500, 1},
            {100, 1},
            {100, 1},
            {100, 1},
            {100, 1},
            {100, 1}],
       hit_delay => 1000, delay_time => 4000, fly_time => 0}];
effect_time(95007) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0}];
effect_time(96001) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 300,
       delay_time => 1200, fly_time => 250},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1200, fly_time => 0}];
effect_time(96002) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1200, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1200, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 450,
       delay_time => 1200, fly_time => 0}];
effect_time(96003) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 700, fly_time => 0},
     #{attack_type => 1, trigger => 6, hit_delay => 830,
       delay_time => 1400, fly_time => 0}];
effect_time(96004) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1200, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 150,
       delay_time => 500, fly_time => 0}];
effect_time(96005) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1200, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1200, fly_time => 0}];
effect_time(96006) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 300,
       delay_time => 1000, fly_time => 300},
     #{attack_type => 0, trigger => 6, hit_delay => 1500,
       delay_time => 700, fly_time => 0}];
effect_time(96007) ->
    [#{attack_type => 1, trigger => 6, hit_delay => 1600,
       delay_time => 2200, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2200, fly_time => 0}];
effect_time(100769) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 800, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 50,
       delay_time => 500, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(100770) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1000, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 50,
       delay_time => 400, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1000, fly_time => 0}];
effect_time(100771) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 350,
       delay_time => 800, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(100772) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0},
     #{attack_type => 0, trigger => 3, hit_delay => 0,
       delay_time => 800, fly_time => 0},
     #{attack_type => 1, trigger => 3, hit_delay => 150,
       delay_time => 500, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1000, fly_time => 0}];
effect_time(100773) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 50,
       delay_time => 500, fly_time => 0}];
effect_time(100774) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1000, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 250,
       delay_time => 500, fly_time => 200},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0}];
effect_time(97001) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 800, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 50,
       delay_time => 500, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(97002) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1000, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 50,
       delay_time => 400, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1000, fly_time => 0}];
effect_time(97003) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 350,
       delay_time => 800, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(97004) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0},
     #{attack_type => 0, trigger => 3, hit_delay => 0,
       delay_time => 800, fly_time => 0},
     #{attack_type => 1, trigger => 3, hit_delay => 150,
       delay_time => 500, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1000, fly_time => 0}];
effect_time(97005) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 200,
       delay_time => 3700, fly_time => 0}];
effect_time(97006) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 50,
       delay_time => 500, fly_time => 0}];
effect_time(97007) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1000, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 250,
       delay_time => 500, fly_time => 200},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0}];
effect_time(97009) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 50,
       delay_time => 500, fly_time => 0}];
effect_time(91009) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 3000, fly_time => 0},
     #{attack_type => 2, trigger => 3,
       hurt_ratio =>
           [{50, 1}, {300, 1}, {350, 1}, {450, 1}, {600, 2}],
       hit_delay => 50, delay_time => 2700, fly_time => 0},
     #{attack_type => 1, trigger => 3, hit_delay => 50,
       delay_time => 250, fly_time => 0}];
effect_time(93009) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2500, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1300, fly_time => 0},
     #{attack_type => 3, trigger => 2, hit_delay => 0,
       delay_time => 100, fly_time => 300},
     #{attack_type => 1, trigger => 2, hit_delay => 200,
       delay_time => 200, fly_time => 0}];
effect_time(94009) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1500, fly_time => 0}];
effect_time(95009) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2400, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 2500, fly_time => 0}];
effect_time(96019) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 50,
       delay_time => 1500, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 3000, fly_time => 0}];
effect_time(96029) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 50,
       delay_time => 1500, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 3000, fly_time => 0}];
effect_time(100311) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 100,
       delay_time => 550, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(100312) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 700, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 150,
       delay_time => 650, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 350, fly_time => 0}];
effect_time(100313) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0},
     #{attack_type => 1, trigger => 3, hit_delay => 50,
       delay_time => 250, fly_time => 0},
     #{attack_type => 1, trigger => 3, hit_delay => 50,
       delay_time => 1000, fly_time => 0}];
effect_time(100314) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1100, fly_time => 0},
     #{attack_type => 2, trigger => 6,
       hurt_ratio =>
           [{450, 1}, {150, 1}, {150, 1}, {150, 1}, {350, 20}],
       hit_delay => 450, delay_time => 1450, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(100315) ->
    [#{attack_type => 1, trigger => 6, hit_delay => 650,
       delay_time => 1200, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(100316) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 900, fly_time => 0},
     #{attack_type => 0, trigger => 3, hit_delay => 0,
       delay_time => 1300, fly_time => 0},
     #{attack_type => 1, trigger => 3, hit_delay => 150,
       delay_time => 1300, fly_time => 0},
     #{attack_type => 1, trigger => 3, hit_delay => 0,
       delay_time => 600, fly_time => 0}];
effect_time(100317) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1500, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2600, fly_time => 0},
     #{attack_type => 2, trigger => 6,
       hurt_ratio => [{850, 1}, {200, 1}, {200, 1}, {600, 5}],
       hit_delay => 850, delay_time => 2600, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(100321) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 450,
       delay_time => 1000, fly_time => 400},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1000, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(100322) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1200, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 250,
       delay_time => 700, fly_time => 0}];
effect_time(100323) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1500, fly_time => 0},
     #{attack_type => 1, trigger => 6, hit_delay => 700,
       delay_time => 2000, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0}];
effect_time(100324) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 3300, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(100325) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 2500, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2700, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 1000,
       delay_time => 1400, fly_time => 0}];
effect_time(100326) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2300, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 3000, fly_time => 0}];
effect_time(100327) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1500, fly_time => 0},
     #{attack_type => 8, trigger => 6, hit_delay => 700,
       delay_time => 1300, fly_time => 0},
     #{attack_type => 9, trigger => 2, hit_delay => 100,
       delay_time => 800, fly_time => 0}];
effect_time(100331) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 200,
       delay_time => 500, fly_time => 200},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(100332) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1500, fly_time => 0},
     #{attack_type => 1, trigger => 6, hit_delay => 1350,
       delay_time => 1700, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(100333) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 200,
       delay_time => 700, fly_time => 200},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 350, fly_time => 0}];
effect_time(100334) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1200, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1500, fly_time => 0}];
effect_time(100335) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 1, trigger => 6, hit_delay => 550,
       delay_time => 1000, fly_time => 0}];
effect_time(100336) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1500, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 350,
       delay_time => 900, fly_time => 0}];
effect_time(100337) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1300, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 350,
       delay_time => 1000, fly_time => 300},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(100341) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 300, fly_time => 0},
     #{attack_type => 1, trigger => 6, hit_delay => 450,
       delay_time => 900, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 600, fly_time => 0}];
effect_time(100342) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 300, fly_time => 0},
     #{attack_type => 1, trigger => 6, hit_delay => 450,
       delay_time => 1400, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0}];
effect_time(100343) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 50,
       delay_time => 700, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1300, fly_time => 0}];
effect_time(100344) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1350, fly_time => 0}];
effect_time(100345) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 1, trigger => 6, hit_delay => 750,
       delay_time => 1900, fly_time => 0}];
effect_time(100346) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 600, fly_time => 0}];
effect_time(100347) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 900, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0}];
effect_time(100351) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 700, fly_time => 300},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 700, fly_time => 0}];
effect_time(100353) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1400, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1500, fly_time => 0}];
effect_time(100354) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 1500,
       delay_time => 2500, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 3000, fly_time => 0}];
effect_time(100352) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0},
     #{attack_type => 1, trigger => 6, hit_delay => 1500,
       delay_time => 2000, fly_time => 0}];
effect_time(100355) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1600, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1700, fly_time => 0}];
effect_time(100356) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0},
     #{attack_type => 2, trigger => 6,
       hurt_ratio =>
           [{1000, 2},
            {200, 3},
            {500, 1},
            {100, 1},
            {100, 1},
            {100, 1},
            {100, 1},
            {100, 1}],
       hit_delay => 1000, delay_time => 4000, fly_time => 0}];
effect_time(100357) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0}];
effect_time(100511) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 100,
       delay_time => 550, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(100512) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 700, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 150,
       delay_time => 650, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 350, fly_time => 0}];
effect_time(100513) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0},
     #{attack_type => 1, trigger => 3, hit_delay => 50,
       delay_time => 250, fly_time => 0},
     #{attack_type => 1, trigger => 3, hit_delay => 50,
       delay_time => 1000, fly_time => 0}];
effect_time(100514) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1100, fly_time => 0},
     #{attack_type => 2, trigger => 6,
       hurt_ratio =>
           [{450, 1}, {150, 1}, {150, 1}, {150, 1}, {350, 20}],
       hit_delay => 450, delay_time => 1450, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(100515) ->
    [#{attack_type => 1, trigger => 6, hit_delay => 650,
       delay_time => 1200, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(100516) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 900, fly_time => 0},
     #{attack_type => 0, trigger => 3, hit_delay => 0,
       delay_time => 1300, fly_time => 0},
     #{attack_type => 1, trigger => 3, hit_delay => 150,
       delay_time => 1300, fly_time => 0},
     #{attack_type => 1, trigger => 3, hit_delay => 0,
       delay_time => 600, fly_time => 0}];
effect_time(100517) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1500, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2600, fly_time => 0},
     #{attack_type => 2, trigger => 6,
       hurt_ratio => [{850, 1}, {200, 1}, {200, 1}, {600, 5}],
       hit_delay => 850, delay_time => 2600, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(100521) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 450,
       delay_time => 1000, fly_time => 400},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1000, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(100522) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1200, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 250,
       delay_time => 700, fly_time => 0}];
effect_time(100523) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1500, fly_time => 0},
     #{attack_type => 1, trigger => 6, hit_delay => 700,
       delay_time => 2000, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0}];
effect_time(100524) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 3300, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(100525) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 2500, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2700, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 1000,
       delay_time => 1400, fly_time => 0}];
effect_time(100526) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2300, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 3000, fly_time => 0}];
effect_time(100527) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1500, fly_time => 0},
     #{attack_type => 8, trigger => 6, hit_delay => 700,
       delay_time => 1300, fly_time => 0},
     #{attack_type => 9, trigger => 2, hit_delay => 100,
       delay_time => 800, fly_time => 0}];
effect_time(100531) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 200,
       delay_time => 500, fly_time => 200},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(100532) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1500, fly_time => 0},
     #{attack_type => 1, trigger => 6, hit_delay => 1350,
       delay_time => 1700, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(100533) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 200,
       delay_time => 700, fly_time => 200},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 350, fly_time => 0}];
effect_time(100534) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1200, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1500, fly_time => 0}];
effect_time(100535) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 1, trigger => 6, hit_delay => 550,
       delay_time => 1000, fly_time => 0}];
effect_time(100536) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1500, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 350,
       delay_time => 900, fly_time => 0}];
effect_time(100537) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1300, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 350,
       delay_time => 1000, fly_time => 300},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(100541) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 300, fly_time => 0},
     #{attack_type => 1, trigger => 6, hit_delay => 450,
       delay_time => 900, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 600, fly_time => 0}];
effect_time(100542) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 300, fly_time => 0},
     #{attack_type => 1, trigger => 6, hit_delay => 450,
       delay_time => 1400, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0}];
effect_time(100543) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 50,
       delay_time => 700, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1300, fly_time => 0}];
effect_time(100544) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1350, fly_time => 0}];
effect_time(100545) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 1, trigger => 6, hit_delay => 750,
       delay_time => 1900, fly_time => 0}];
effect_time(100546) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 600, fly_time => 0}];
effect_time(100547) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 900, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0}];
effect_time(100551) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 700, fly_time => 300},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 700, fly_time => 0}];
effect_time(100553) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1400, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1500, fly_time => 0}];
effect_time(100554) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 1500,
       delay_time => 2500, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 3000, fly_time => 0}];
effect_time(100552) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0},
     #{attack_type => 1, trigger => 6, hit_delay => 1500,
       delay_time => 2000, fly_time => 0}];
effect_time(100555) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1600, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1700, fly_time => 0}];
effect_time(100556) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0},
     #{attack_type => 2, trigger => 6,
       hurt_ratio =>
           [{1000, 2},
            {200, 3},
            {500, 1},
            {100, 1},
            {100, 1},
            {100, 1},
            {100, 1},
            {100, 1}],
       hit_delay => 1000, delay_time => 4000, fly_time => 0}];
effect_time(100557) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0}];
effect_time(100711) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 100,
       delay_time => 550, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(100712) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 700, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 150,
       delay_time => 650, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 350, fly_time => 0}];
effect_time(100713) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0},
     #{attack_type => 1, trigger => 3, hit_delay => 50,
       delay_time => 250, fly_time => 0},
     #{attack_type => 1, trigger => 3, hit_delay => 50,
       delay_time => 1000, fly_time => 0}];
effect_time(100714) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1100, fly_time => 0},
     #{attack_type => 2, trigger => 6,
       hurt_ratio =>
           [{450, 1}, {150, 1}, {150, 1}, {150, 1}, {350, 20}],
       hit_delay => 450, delay_time => 1450, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(100715) ->
    [#{attack_type => 1, trigger => 6, hit_delay => 650,
       delay_time => 1200, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(100716) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 900, fly_time => 0},
     #{attack_type => 0, trigger => 3, hit_delay => 0,
       delay_time => 1300, fly_time => 0},
     #{attack_type => 1, trigger => 3, hit_delay => 150,
       delay_time => 1300, fly_time => 0},
     #{attack_type => 1, trigger => 3, hit_delay => 0,
       delay_time => 600, fly_time => 0}];
effect_time(100717) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1500, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2600, fly_time => 0},
     #{attack_type => 2, trigger => 6,
       hurt_ratio => [{850, 1}, {200, 1}, {200, 1}, {600, 5}],
       hit_delay => 850, delay_time => 2600, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(100721) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 450,
       delay_time => 1000, fly_time => 400},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1000, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(100722) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1200, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 250,
       delay_time => 700, fly_time => 0}];
effect_time(100723) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1500, fly_time => 0},
     #{attack_type => 1, trigger => 6, hit_delay => 700,
       delay_time => 2000, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0}];
effect_time(100724) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 3300, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(100725) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 2500, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2700, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 1000,
       delay_time => 1400, fly_time => 0}];
effect_time(100726) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2300, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 3000, fly_time => 0}];
effect_time(100727) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1500, fly_time => 0},
     #{attack_type => 8, trigger => 6, hit_delay => 700,
       delay_time => 1300, fly_time => 0},
     #{attack_type => 9, trigger => 2, hit_delay => 100,
       delay_time => 800, fly_time => 0}];
effect_time(100731) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 200,
       delay_time => 500, fly_time => 200},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(100732) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1500, fly_time => 0},
     #{attack_type => 1, trigger => 6, hit_delay => 1350,
       delay_time => 1700, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(100733) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 200,
       delay_time => 700, fly_time => 200},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 350, fly_time => 0}];
effect_time(100734) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1200, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1500, fly_time => 0}];
effect_time(100735) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 1, trigger => 6, hit_delay => 550,
       delay_time => 1000, fly_time => 0}];
effect_time(100736) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1500, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 350,
       delay_time => 900, fly_time => 0}];
effect_time(100737) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1300, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 350,
       delay_time => 1000, fly_time => 300},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(100741) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 300, fly_time => 0},
     #{attack_type => 1, trigger => 6, hit_delay => 450,
       delay_time => 900, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 600, fly_time => 0}];
effect_time(100742) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 300, fly_time => 0},
     #{attack_type => 1, trigger => 6, hit_delay => 450,
       delay_time => 1400, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0}];
effect_time(100743) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 50,
       delay_time => 700, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1300, fly_time => 0}];
effect_time(100744) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1350, fly_time => 0}];
effect_time(100745) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 1, trigger => 6, hit_delay => 750,
       delay_time => 1900, fly_time => 0}];
effect_time(100746) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 600, fly_time => 0}];
effect_time(100747) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 900, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0}];
effect_time(100751) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 700, fly_time => 300},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 700, fly_time => 0}];
effect_time(100753) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1400, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1500, fly_time => 0}];
effect_time(100754) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 1500,
       delay_time => 2500, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 3000, fly_time => 0}];
effect_time(100752) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0},
     #{attack_type => 1, trigger => 6, hit_delay => 1500,
       delay_time => 2000, fly_time => 0}];
effect_time(100755) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1600, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1700, fly_time => 0}];
effect_time(100756) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0},
     #{attack_type => 2, trigger => 6,
       hurt_ratio =>
           [{1000, 2},
            {200, 3},
            {500, 1},
            {100, 1},
            {100, 1},
            {100, 1},
            {100, 1},
            {100, 1}],
       hit_delay => 1000, delay_time => 4000, fly_time => 0}];
effect_time(100757) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0}];
effect_time(100761) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 300,
       delay_time => 1200, fly_time => 250},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1200, fly_time => 0}];
effect_time(100762) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1200, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1200, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 450,
       delay_time => 1200, fly_time => 0}];
effect_time(100763) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 700, fly_time => 0},
     #{attack_type => 1, trigger => 6, hit_delay => 830,
       delay_time => 1400, fly_time => 0}];
effect_time(100764) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1200, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 150,
       delay_time => 500, fly_time => 0}];
effect_time(100765) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1200, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1200, fly_time => 0}];
effect_time(100766) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 300,
       delay_time => 1000, fly_time => 300},
     #{attack_type => 0, trigger => 6, hit_delay => 1500,
       delay_time => 700, fly_time => 0}];
effect_time(100767) ->
    [#{attack_type => 1, trigger => 6, hit_delay => 1600,
       delay_time => 2200, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2200, fly_time => 0}];
effect_time(100768) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0}];
effect_time(111005) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 50,
       delay_time => 500, fly_time => 0}];
effect_time(111006) ->
    [#{attack_type => 2, trigger => 6,
       hurt_ratio => [{600, 1}, {500, 1}, {500, 1}],
       hit_delay => 600, delay_time => 2200, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2100, fly_time => 0}];
effect_time(111007) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 50,
       delay_time => 500, fly_time => 0}];
effect_time(111008) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0},
     #{attack_type => 1, trigger => 3, hit_delay => 50,
       delay_time => 250, fly_time => 0},
     #{attack_type => 1, trigger => 3, hit_delay => 50,
       delay_time => 1000, fly_time => 0}];
effect_time(111010) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 900, fly_time => 0},
     #{attack_type => 0, trigger => 3, hit_delay => 0,
       delay_time => 1300, fly_time => 0},
     #{attack_type => 1, trigger => 3, hit_delay => 150,
       delay_time => 1300, fly_time => 0},
     #{attack_type => 1, trigger => 3, hit_delay => 0,
       delay_time => 600, fly_time => 0}];
effect_time(111011) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1500, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2600, fly_time => 0},
     #{attack_type => 2, trigger => 6,
       hurt_ratio => [{850, 1}, {200, 1}, {200, 1}, {600, 5}],
       hit_delay => 850, delay_time => 2600, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(111030) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 100,
       delay_time => 550, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(111031) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 700, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 150,
       delay_time => 650, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 350, fly_time => 0}];
effect_time(111029) ->
    [#{attack_type => 1, trigger => 3, hit_delay => 50,
       delay_time => 250, fly_time => 0},
     #{attack_type => 1, trigger => 3, hit_delay => 50,
       delay_time => 1000, fly_time => 0}];
effect_time(111032) ->
    [#{attack_type => 1, trigger => 6, hit_delay => 650,
       delay_time => 1200, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(111036) ->
    [#{attack_type => 0, trigger => 4, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(111037) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 350,
       delay_time => 1650, fly_time => 0}];
effect_time(111038) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0}];
effect_time(111039) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 3500, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1200, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 500,
       delay_time => 2100, fly_time => 0}];
effect_time(111041) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1400, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1500, fly_time => 0}];
effect_time(111042) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0},
     #{attack_type => 1, trigger => 6, hit_delay => 1500,
       delay_time => 2000, fly_time => 0}];
effect_time(111043) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1400, fly_time => 0}];
effect_time(111044) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1400, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 500,
       delay_time => 1800, fly_time => 0}];
effect_time(111045) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 2500, fly_time => 0}];
effect_time(111046) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1400, fly_time => 0}];
effect_time(111047) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0}];
effect_time(111052) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1400, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1500, fly_time => 0}];
effect_time(111053) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0},
     #{attack_type => 1, trigger => 6, hit_delay => 1500,
       delay_time => 2000, fly_time => 0}];
effect_time(111054) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1500, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1100, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1100, fly_time => 0}];
effect_time(111055) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1200, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 500,
       delay_time => 1800, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1500, fly_time => 0}];
effect_time(111056) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2300, fly_time => 0}];
effect_time(111057) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(111058) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1500, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1100, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1100, fly_time => 0}];
effect_time(111063) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2500, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1500, fly_time => 0},
     #{attack_type => 2, trigger => 2,
       hurt_ratio =>
           [{200, 1}, {300, 1}, {300, 1}, {300, 1}, {300, 1}],
       hit_delay => 200, delay_time => 1500, fly_time => 0}];
effect_time(111065) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1200, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 100,
       delay_time => 800, fly_time => 0}];
effect_time(111066) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0}];
effect_time(111068) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 250,
       delay_time => 1700, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1200, fly_time => 0}];
effect_time(111070) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1350, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1350, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 250,
       delay_time => 1000, fly_time => 0}];
effect_time(111071) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 450,
       delay_time => 1000, fly_time => 400}];
effect_time(111072) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1350, fly_time => 0}];
effect_time(111073) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 450,
       delay_time => 1000, fly_time => 400}];
effect_time(113073) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1400, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 400,
       delay_time => 1600}];
effect_time(111074) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 1500,
       delay_time => 500, fly_time => 500},
     #{attack_type => 3, trigger => 2, hit_delay => 500,
       delay_time => 500, fly_time => 500},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1000, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(111075) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 200,
       delay_time => 1400, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(111076) ->
    [#{attack_type => 1, trigger => 6, hit_delay => 700,
       delay_time => 2000, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0}];
effect_time(111077) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1600, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1700, fly_time => 0}];
effect_time(111078) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2300, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 3000, fly_time => 0}];
effect_time(111079) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1750, fly_time => 0},
     #{attack_type => 2, trigger => 6,
       hurt_ratio => [{1350, 1}, {400, 1}, {400, 8}],
       hit_delay => 1350, delay_time => 2200, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0}];
effect_time(111080) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 2500, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2700, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 1000,
       delay_time => 1400, fly_time => 0}];
effect_time(113080) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 2500, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2700, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 1000,
       delay_time => 1400, fly_time => 0}];
effect_time(113081) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1600, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1700, fly_time => 0}];
effect_time(111081) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 200,
       delay_time => 2100, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 500, fly_time => 0}];
effect_time(111082) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0}];
effect_time(111083) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2300, fly_time => 0}];
effect_time(111084) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 250,
       delay_time => 1700, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1350, fly_time => 0}];
effect_time(111086) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1350, fly_time => 0}];
effect_time(111102) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 50,
       delay_time => 800, fly_time => 0}];
effect_time(111103) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1050, fly_time => 0}];
effect_time(111104) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 600, fly_time => 0}];
effect_time(111105) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1150, fly_time => 0}];
effect_time(111106) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 50,
       delay_time => 800, fly_time => 0}];
effect_time(113107) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 900, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0}];
effect_time(111107) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 600, fly_time => 0}];
effect_time(111109) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0}];
effect_time(113109) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 700, fly_time => 0}];
effect_time(111110) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 600, fly_time => 0}];
effect_time(111111) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 50,
       delay_time => 700, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 600, fly_time => 0}];
effect_time(111114) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 50,
       delay_time => 800, fly_time => 0}];
effect_time(111113) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 300,
       delay_time => 800, fly_time => 0}];
effect_time(111112) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 50,
       delay_time => 600, fly_time => 0}];
effect_time(111115) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0}];
effect_time(111116) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 600, fly_time => 0}];
effect_time(111118) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 50,
       delay_time => 800, fly_time => 0}];
effect_time(111119) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 700, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 150,
       delay_time => 650, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 350, fly_time => 0}];
effect_time(111121) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1350, fly_time => 0}];
effect_time(111122) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0}];
effect_time(111131) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1100, fly_time => 0}];
effect_time(111132) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1200, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 1500,
       delay_time => 2500, fly_time => 0}];
effect_time(111133) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1000, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 250,
       delay_time => 1200, fly_time => 0}];
effect_time(111134) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1600, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2300, fly_time => 0}];
effect_time(111135) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1200, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 500,
       delay_time => 1800, fly_time => 0}];
effect_time(111136) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1500, fly_time => 0},
     #{attack_type => 1, trigger => 6, hit_delay => 800,
       delay_time => 1500, fly_time => 0}];
effect_time(111138) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1700, fly_time => 0}];
effect_time(111139) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 300,
       delay_time => 1000, fly_time => 420}];
effect_time(111140) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0}];
effect_time(111141) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 350,
       delay_time => 1200, fly_time => 0}];
effect_time(111142) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2300, fly_time => 0}];
effect_time(111143) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1400, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1500, fly_time => 0}];
effect_time(111150) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 200,
       delay_time => 500, fly_time => 200},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(111151) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1500, fly_time => 0},
     #{attack_type => 1, trigger => 6, hit_delay => 1350,
       delay_time => 1700, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(111152) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 200,
       delay_time => 700, fly_time => 200},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 350, fly_time => 0}];
effect_time(111153) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 1, trigger => 6, hit_delay => 550,
       delay_time => 1000, fly_time => 0}];
effect_time(111154) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 900, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 600,
       delay_time => 1500, fly_time => 0}];
effect_time(111155) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1300, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 350,
       delay_time => 1000, fly_time => 300},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(111156) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(113112) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1000, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0}];
effect_time(113117) ->
    [#{attack_type => 1, trigger => 6, hit_delay => 460,
       delay_time => 1200, fly_time => 0}];
effect_time(113118) ->
    [#{attack_type => 1, trigger => 3, hit_delay => 50,
       delay_time => 1100, fly_time => 0},
     #{attack_type => 1, trigger => 3, hit_delay => 50,
       delay_time => 700, fly_time => 0}];
effect_time(113119) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 600, fly_time => 0}];
effect_time(113071) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1000, fly_time => 0}];
effect_time(99995) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1500, fly_time => 0},
     #{attack_type => 8, trigger => 6, hit_delay => 700,
       delay_time => 1300, fly_time => 0},
     #{attack_type => 9, trigger => 2, hit_delay => 100,
       delay_time => 800, fly_time => 0}];
effect_time(60088) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 700, fly_time => 0},
     #{attack_type => 1, trigger => 6, hit_delay => 400,
       delay_time => 700, fly_time => 0}];
effect_time(60090) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1500, fly_time => 0},
     #{attack_type => 1, trigger => 6, hit_delay => 1250,
       delay_time => 2000, fly_time => 0}];
effect_time(60093) ->
    [#{attack_type => 1, trigger => 6, hit_delay => 930,
       delay_time => 1500, fly_time => 0}];
effect_time(60096) ->
    [#{attack_type => 4, trigger => 2, hit_delay => 0,
       delay_time => 1000, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 300, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1200, fly_time => 0}];
effect_time(61000) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 200,
       delay_time => 500, fly_time => 200}];
effect_time(61001) ->
    [#{attack_type => 1, trigger => 6, hit_delay => 1200,
       delay_time => 1500, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(61002) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 200,
       delay_time => 500, fly_time => 200},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(161013) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 200,
       delay_time => 700, fly_time => 200}];
effect_time(61003) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 200,
       delay_time => 700, fly_time => 200},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 350, fly_time => 0}];
effect_time(69001) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 300,
       delay_time => 1200, fly_time => 250},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1200, fly_time => 0}];
effect_time(69002) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1200, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1200, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 450,
       delay_time => 1200, fly_time => 0}];
effect_time(69003) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 700, fly_time => 0},
     #{attack_type => 1, trigger => 6, hit_delay => 830,
       delay_time => 1400, fly_time => 0}];
effect_time(69004) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1200, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 150,
       delay_time => 500, fly_time => 0}];
effect_time(69005) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1200, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1200, fly_time => 0}];
effect_time(69006) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 300,
       delay_time => 1000, fly_time => 300},
     #{attack_type => 0, trigger => 6, hit_delay => 1500,
       delay_time => 700, fly_time => 0}];
effect_time(69007) ->
    [#{attack_type => 1, trigger => 6, hit_delay => 1600,
       delay_time => 2200, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2200, fly_time => 0}];
effect_time(69008) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0}];
effect_time(99991) ->
    [#{attack_type => 3, trigger => 2, hit_delay => 450,
       delay_time => 1000, fly_time => 400}];
effect_time(99992) ->
    [#{attack_type => 3, trigger => 2, hit_delay => 100,
       delay_time => 250, fly_time => 0}];
effect_time(99994) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 100, fly_time => 300},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(99993) ->
    [#{attack_type => 3, trigger => 2, hit_delay => 0,
       delay_time => 100, fly_time => 200},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(120001) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 400, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1700, fly_time => 0}];
effect_time(120002) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0}];
effect_time(120003) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 400, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1600, fly_time => 0}];
effect_time(120004) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 400, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1500, fly_time => 0}];
effect_time(120005) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 400, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1000, fly_time => 0}];
effect_time(120007) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1400, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1500, fly_time => 0}];
effect_time(120008) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0}];
effect_time(120009) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 800, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 400,
       delay_time => 1000, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1000, fly_time => 0}];
effect_time(120010) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1600, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1700, fly_time => 0}];
effect_time(120011) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1200, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 250,
       delay_time => 700, fly_time => 0}];
effect_time(120012) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 2500, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2700, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 1000,
       delay_time => 1400, fly_time => 0}];
effect_time(120013) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1500, fly_time => 0},
     #{attack_type => 8, trigger => 6, hit_delay => 700,
       delay_time => 1300, fly_time => 0},
     #{attack_type => 9, trigger => 2, hit_delay => 100,
       delay_time => 800, fly_time => 0}];
effect_time(120014) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1500, fly_time => 0},
     #{attack_type => 1, trigger => 6, hit_delay => 700,
       delay_time => 2000, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0}];
effect_time(120015) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 450,
       delay_time => 1000, fly_time => 400},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1000, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(120016) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 700, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 150,
       delay_time => 650, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 350, fly_time => 0}];
effect_time(120017) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0},
     #{attack_type => 1, trigger => 3, hit_delay => 50,
       delay_time => 250, fly_time => 0},
     #{attack_type => 1, trigger => 3, hit_delay => 50,
       delay_time => 1000, fly_time => 0}];
effect_time(120018) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1500, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2600, fly_time => 0},
     #{attack_type => 2, trigger => 6,
       hurt_ratio => [{850, 1}, {200, 1}, {200, 1}, {600, 5}],
       hit_delay => 850, delay_time => 2600, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(120019) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 900, fly_time => 0},
     #{attack_type => 0, trigger => 3, hit_delay => 0,
       delay_time => 1300, fly_time => 0},
     #{attack_type => 1, trigger => 3, hit_delay => 150,
       delay_time => 1300, fly_time => 0},
     #{attack_type => 1, trigger => 3, hit_delay => 0,
       delay_time => 600, fly_time => 0}];
effect_time(120020) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1100, fly_time => 0},
     #{attack_type => 2, trigger => 6,
       hurt_ratio =>
           [{450, 1}, {150, 1}, {150, 1}, {150, 1}, {350, 20}],
       hit_delay => 450, delay_time => 1450, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(120021) ->
    [#{attack_type => 1, trigger => 6, hit_delay => 650,
       delay_time => 1200, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(120022) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 100,
       delay_time => 550, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(120023) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1200, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1200, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 450,
       delay_time => 1200, fly_time => 0}];
effect_time(120024) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1200, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 150,
       delay_time => 500, fly_time => 0}];
effect_time(120025) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 300,
       delay_time => 1000, fly_time => 300},
     #{attack_type => 0, trigger => 6, hit_delay => 1500,
       delay_time => 700, fly_time => 0}];
effect_time(120026) ->
    [#{attack_type => 1, trigger => 6, hit_delay => 1600,
       delay_time => 2200, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2200, fly_time => 0}];
effect_time(120027) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 700, fly_time => 0},
     #{attack_type => 1, trigger => 6, hit_delay => 830,
       delay_time => 1400, fly_time => 0}];
effect_time(120028) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 300,
       delay_time => 1200, fly_time => 250},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1200, fly_time => 0}];
effect_time(120029) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1200, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1500, fly_time => 0}];
effect_time(120030) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 1, trigger => 6, hit_delay => 550,
       delay_time => 1000, fly_time => 0}];
effect_time(120031) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1500, fly_time => 0},
     #{attack_type => 1, trigger => 6, hit_delay => 1350,
       delay_time => 1700, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(120032) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1500, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 350,
       delay_time => 900, fly_time => 0}];
effect_time(120033) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 200,
       delay_time => 700, fly_time => 200},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 350, fly_time => 0}];
effect_time(120034) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1300, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 350,
       delay_time => 1000, fly_time => 300},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(120035) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 200,
       delay_time => 500, fly_time => 200},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(120036) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0},
     #{attack_type => 0, trigger => 3, hit_delay => 0,
       delay_time => 800, fly_time => 0},
     #{attack_type => 1, trigger => 3, hit_delay => 150,
       delay_time => 500, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1000, fly_time => 0}];
effect_time(120037) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1000, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 50,
       delay_time => 400, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1000, fly_time => 0}];
effect_time(120038) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 350,
       delay_time => 800, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(120039) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 50,
       delay_time => 500, fly_time => 0}];
effect_time(120040) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1000, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 250,
       delay_time => 500, fly_time => 200},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0}];
effect_time(120041) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 800, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 50,
       delay_time => 500, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(120042) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 900, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0}];
effect_time(120043) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 50,
       delay_time => 700, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1300, fly_time => 0}];
effect_time(120044) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 300, fly_time => 0},
     #{attack_type => 1, trigger => 6, hit_delay => 450,
       delay_time => 1400, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0}];
effect_time(120045) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1000, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 600, fly_time => 0}];
effect_time(120046) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 300,
       delay_time => 1500, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1300, fly_time => 0}];
effect_time(120047) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0}];
effect_time(120048) ->
    [#{attack_type => 1, trigger => 6, hit_delay => 930,
       delay_time => 1500, fly_time => 0}];
effect_time(120049) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 950,
       delay_time => 2000, fly_time => 0}];
effect_time(120050) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 100,
       delay_time => 250, fly_time => 0}];
effect_time(120051) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 600, fly_time => 0}];
effect_time(120052) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 100,
       delay_time => 1300, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 800, fly_time => 0}];
effect_time(120053) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 3, trigger => 2, hit_delay => 0,
       delay_time => 100, fly_time => 300},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(120054) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 1300, fly_time => 0}];
effect_time(120055) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1500, fly_time => 0},
     #{attack_type => 1, trigger => 6, hit_delay => 1050,
       delay_time => 1800, fly_time => 0}];
effect_time(120056) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 300, fly_time => 300},
     #{attack_type => 1, trigger => 2, hit_delay => 350,
       delay_time => 1000, fly_time => 0}];
effect_time(120057) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 1300, fly_time => 0}];
effect_time(120058) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 700, fly_time => 0},
     #{attack_type => 1, trigger => 6, hit_delay => 400,
       delay_time => 700, fly_time => 0}];
effect_time(120059) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1500, fly_time => 0},
     #{attack_type => 1, trigger => 6, hit_delay => 1250,
       delay_time => 2000, fly_time => 0}];
effect_time(120060) -> [#{}];
effect_time(120061) ->
    [#{attack_type => 1, trigger => 6, hit_delay => 1350,
       delay_time => 2000, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0}];
effect_time(120062) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 1300, fly_time => 0}];
effect_time(120063) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 800, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 500,
       delay_time => 1000, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 500, fly_time => 0}];
effect_time(120200) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 1300, fly_time => 0}];
effect_time(120201) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 100,
       delay_time => 250, fly_time => 0}];
effect_time(120202) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 100,
       delay_time => 400, fly_time => 0}];
effect_time(120203) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1200, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1500, fly_time => 0}];
effect_time(120204) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 1, trigger => 6, hit_delay => 550,
       delay_time => 1000, fly_time => 0}];
effect_time(120205) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 500,
       delay_time => 1500, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1800, fly_time => 0}];
effect_time(120206) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 600, fly_time => 0}];
effect_time(120207) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 250,
       delay_time => 400, fly_time => 0}];
effect_time(120208) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1400, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1500, fly_time => 0}];
effect_time(120209) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0}];
effect_time(120210) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 800, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 400,
       delay_time => 1000, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1000, fly_time => 0}];
effect_time(120211) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1600, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1700, fly_time => 0}];
effect_time(120212) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1000, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 600, fly_time => 0}];
effect_time(120213) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 900, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0}];
effect_time(120214) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1300, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 350,
       delay_time => 1000, fly_time => 300},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(120215) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 700, fly_time => 0},
     #{attack_type => 1, trigger => 6, hit_delay => 830,
       delay_time => 1400, fly_time => 0}];
effect_time(120216) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 300, fly_time => 300},
     #{attack_type => 1, trigger => 2, hit_delay => 350,
       delay_time => 1000, fly_time => 0}];
effect_time(120217) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 3, trigger => 2, hit_delay => 0,
       delay_time => 100, fly_time => 300},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(120218) ->
    [#{attack_type => 1, trigger => 6, hit_delay => 930,
       delay_time => 1500, fly_time => 0}];
effect_time(120219) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0}];
effect_time(120220) ->
    [#{attack_type => 1, trigger => 6, hit_delay => 650,
       delay_time => 1200, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(120221) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 100,
       delay_time => 1300, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 800, fly_time => 0}];
effect_time(120222) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0},
     #{attack_type => 1, trigger => 3, hit_delay => 50,
       delay_time => 250, fly_time => 0},
     #{attack_type => 1, trigger => 3, hit_delay => 50,
       delay_time => 1000, fly_time => 0}];
effect_time(120223) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 900, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0}];
effect_time(120224) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 100,
       delay_time => 400, fly_time => 0}];
effect_time(120225) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 950,
       delay_time => 2000, fly_time => 0}];
effect_time(120226) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 1, trigger => 6, hit_delay => 1100,
       delay_time => 2600, fly_time => 0}];
effect_time(120227) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1200, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 150,
       delay_time => 500, fly_time => 0}];
effect_time(120229) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 950,
       delay_time => 2000, fly_time => 0}];
effect_time(120231) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1500, fly_time => 0}];
effect_time(120232) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1500, fly_time => 0}];
effect_time(120233) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 100,
       delay_time => 400, fly_time => 0}];
effect_time(120234) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 300, fly_time => 300},
     #{attack_type => 1, trigger => 2, hit_delay => 350,
       delay_time => 1000, fly_time => 0}];
effect_time(120235) ->
    [#{attack_type => 1, trigger => 6, hit_delay => 650,
       delay_time => 1200, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(120236) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 400, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1500, fly_time => 0}];
effect_time(120301) ->
    [#{attack_type => 1, trigger => 3, hit_delay => 50,
       delay_time => 1100, fly_time => 0},
     #{attack_type => 0, trigger => 3, hit_delay => 50,
       delay_time => 700, fly_time => 0}];
effect_time(120302) ->
    [#{attack_type => 1, trigger => 6, hit_delay => 460,
       delay_time => 1200, fly_time => 0}];
effect_time(120303) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 300,
       delay_time => 800, fly_time => 0}];
effect_time(120304) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1500, fly_time => 0}];
effect_time(120306) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 300,
       delay_time => 1500, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1300, fly_time => 0}];
effect_time(120307) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 100,
       delay_time => 800, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1200, fly_time => 0}];
effect_time(120308) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 300,
       delay_time => 1300, fly_time => 0}];
effect_time(120309) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 300,
       delay_time => 1300, fly_time => 0}];
effect_time(120310) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 300,
       delay_time => 1300, fly_time => 0}];
effect_time(120311) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1000, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 250,
       delay_time => 1200, fly_time => 0}];
effect_time(120312) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0}];
effect_time(120313) ->
    [#{attack_type => 1, trigger => 6, hit_delay => 1350,
       delay_time => 2000, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0}];
effect_time(120314) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 600, fly_time => 0}];
effect_time(120315) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1000, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0}];
effect_time(120316) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1400, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1500, fly_time => 0}];
effect_time(120317) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0},
     #{attack_type => 1, trigger => 6, hit_delay => 1500,
       delay_time => 2000, fly_time => 0}];
effect_time(120318) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1200, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 500,
       delay_time => 1800, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1500, fly_time => 0}];
effect_time(120319) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1500, fly_time => 0}];
effect_time(120320) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 950,
       delay_time => 2000, fly_time => 0}];
effect_time(120321) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 700, fly_time => 0},
     #{attack_type => 1, trigger => 6, hit_delay => 400,
       delay_time => 700, fly_time => 0}];
effect_time(120322) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 200,
       delay_time => 1400, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(120323) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 800, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 150,
       delay_time => 1700, fly_time => 0}];
effect_time(120324) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 600, fly_time => 0}];
effect_time(120325) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0}];
effect_time(120326) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1500, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1100, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1100, fly_time => 0}];
effect_time(120327) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 1500,
       delay_time => 2500, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 3000, fly_time => 0}];
effect_time(120328) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1000, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 600, fly_time => 0}];
effect_time(120329) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1400, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1500, fly_time => 0}];
effect_time(120330) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1200, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 500,
       delay_time => 1800, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1500, fly_time => 0}];
effect_time(120332) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 700, fly_time => 0}];
effect_time(120333) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1000, fly_time => 0}];
effect_time(120334) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 600, fly_time => 0}];
effect_time(120335) ->
    [#{attack_type => 1, trigger => 6, hit_delay => 650,
       delay_time => 1200, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(120336) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 100,
       delay_time => 550, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(120337) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 900, fly_time => 0},
     #{attack_type => 0, trigger => 3, hit_delay => 0,
       delay_time => 1300, fly_time => 0},
     #{attack_type => 1, trigger => 3, hit_delay => 150,
       delay_time => 1300, fly_time => 0},
     #{attack_type => 0, trigger => 3, hit_delay => 0,
       delay_time => 600, fly_time => 0}];
effect_time(120338) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 700, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 150,
       delay_time => 650, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 350, fly_time => 0}];
effect_time(120339) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0},
     #{attack_type => 1, trigger => 3, hit_delay => 50,
       delay_time => 250, fly_time => 0},
     #{attack_type => 0, trigger => 3, hit_delay => 50,
       delay_time => 250, fly_time => 0},
     #{attack_type => 0, trigger => 3, hit_delay => 50,
       delay_time => 1000, fly_time => 0}];
effect_time(120340) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 200,
       delay_time => 3700, fly_time => 0}];
effect_time(120341) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1000, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 50,
       delay_time => 400, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1000, fly_time => 0}];
effect_time(120342) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0},
     #{attack_type => 0, trigger => 3, hit_delay => 0,
       delay_time => 800, fly_time => 0},
     #{attack_type => 1, trigger => 3, hit_delay => 150,
       delay_time => 500, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1000, fly_time => 0}];
effect_time(120343) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 50,
       delay_time => 500, fly_time => 0}];
effect_time(120344) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1400, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1500, fly_time => 0}];
effect_time(120345) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1200, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 500,
       delay_time => 1800, fly_time => 0}];
effect_time(120346) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1100, fly_time => 0}];
effect_time(120348) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0}];
effect_time(120349) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 1500,
       delay_time => 2500, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 3000, fly_time => 0}];
effect_time(120350) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1700, fly_time => 0}];
effect_time(120351) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0},
     #{attack_type => 0, trigger => 3, hit_delay => 0,
       delay_time => 800, fly_time => 0},
     #{attack_type => 1, trigger => 3, hit_delay => 150,
       delay_time => 500, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1000, fly_time => 0}];
effect_time(120352) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 350,
       delay_time => 800, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(120353) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1000, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 50,
       delay_time => 400, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1000, fly_time => 0}];
effect_time(120355) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 2500, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2700, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 1000,
       delay_time => 1400, fly_time => 0}];
effect_time(120356) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1500, fly_time => 0},
     #{attack_type => 8, trigger => 6, hit_delay => 700,
       delay_time => 1300, fly_time => 0},
     #{attack_type => 9, trigger => 2, hit_delay => 100,
       delay_time => 800, fly_time => 0}];
effect_time(120357) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 3, trigger => 2, hit_delay => 0,
       delay_time => 100, fly_time => 300},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(120358) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 300, fly_time => 300},
     #{attack_type => 1, trigger => 2, hit_delay => 350,
       delay_time => 1000, fly_time => 0}];
effect_time(120359) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1350, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1350, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 250,
       delay_time => 1000, fly_time => 0}];
effect_time(120360) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1400, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 400,
       delay_time => 1600}];
effect_time(120361) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1200, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 100,
       delay_time => 800, fly_time => 0}];
effect_time(120362) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0},
     #{attack_type => 2, trigger => 2,
       hurt_ratio => [{300, 1}, {400, 1}, {400, 1}],
       hit_delay => 300, delay_time => 2000, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1500, fly_time => 0}];
effect_time(120363) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1500, fly_time => 0},
     #{attack_type => 1, trigger => 6, hit_delay => 1350,
       delay_time => 1700, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(120364) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1500, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 350,
       delay_time => 900, fly_time => 0}];
effect_time(120365) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1300, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 350,
       delay_time => 1000, fly_time => 300},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(120366) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2500, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1300, fly_time => 0},
     #{attack_type => 3, trigger => 2, hit_delay => 0,
       delay_time => 100, fly_time => 300},
     #{attack_type => 1, trigger => 2, hit_delay => 200,
       delay_time => 200, fly_time => 0}];
effect_time(120367) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1200, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 250,
       delay_time => 700, fly_time => 0}];
effect_time(120368) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1500, fly_time => 0},
     #{attack_type => 1, trigger => 6, hit_delay => 700,
       delay_time => 2000, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0}];
effect_time(120369) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1500, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1100, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1100, fly_time => 0}];
effect_time(120370) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 1500,
       delay_time => 500, fly_time => 500},
     #{attack_type => 3, trigger => 2, hit_delay => 500,
       delay_time => 500, fly_time => 500},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1000, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(120372) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 3000, fly_time => 0},
     #{attack_type => 2, trigger => 3,
       hurt_ratio =>
           [{50, 1}, {300, 1}, {350, 1}, {450, 1}, {600, 2}],
       hit_delay => 50, delay_time => 2700, fly_time => 0},
     #{attack_type => 1, trigger => 3, hit_delay => 50,
       delay_time => 250, fly_time => 0}];
effect_time(120373) ->
    [#{attack_type => 1, trigger => 6, hit_delay => 650,
       delay_time => 1200, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(120375) ->
    [#{attack_type => 1, trigger => 6, hit_delay => 750,
       delay_time => 1500, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1200, fly_time => 0}];
effect_time(120376) ->
    [#{attack_type => 1, trigger => 6, hit_delay => 750,
       delay_time => 1500, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1500, fly_time => 0}];
effect_time(120377) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1600, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1700, fly_time => 0}];
effect_time(120378) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1400, fly_time => 0}];
effect_time(120379) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1400, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 500,
       delay_time => 1800, fly_time => 0}];
effect_time(120380) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0}];
effect_time(120381) ->
    [#{attack_type => 1, trigger => 6, hit_delay => 700,
       delay_time => 2000, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0}];
effect_time(120382) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 200,
       delay_time => 1400, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(120383) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1750, fly_time => 0},
     #{attack_type => 2, trigger => 6,
       hurt_ratio => [{1350, 1}, {400, 1}, {400, 8}],
       hit_delay => 1350, delay_time => 2200, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0}];
effect_time(120384) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 1000, fly_time => 0}];
effect_time(120385) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 1500,
       delay_time => 500, fly_time => 500},
     #{attack_type => 3, trigger => 2, hit_delay => 500,
       delay_time => 500, fly_time => 500},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1000, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(120386) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 450,
       delay_time => 1000, fly_time => 400}];
effect_time(120387) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 300,
       delay_time => 450, fly_time => 300}];
effect_time(120388) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 300,
       delay_time => 1000, fly_time => 420}];
effect_time(120389) ->
    [#{attack_type => 1, trigger => 3, hit_delay => 100,
       delay_time => 550, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(120390) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 550,
       delay_time => 1100, fly_time => 0},
     #{attack_type => 5, trigger => 2, hit_delay => 150,
       delay_time => 500, fly_time => 80},
     #{attack_type => 0, trigger => 2, hit_delay => 10,
       delay_time => 700, fly_time => 0}];
effect_time(120391) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1400, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1500, fly_time => 0}];
effect_time(120392) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 600, fly_time => 0}];
effect_time(120393) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 700, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 150,
       delay_time => 650, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 350, fly_time => 0}];
effect_time(120394) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 50,
       delay_time => 800, fly_time => 0}];
effect_time(120396) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 300,
       delay_time => 1300, fly_time => 0}];
effect_time(120397) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1200, fly_time => 0}];
effect_time(120075) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1400, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1500, fly_time => 0}];
effect_time(120076) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1200, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 500,
       delay_time => 1800, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1500, fly_time => 0}];
effect_time(120399) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1600, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1700, fly_time => 0}];
effect_time(120400) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 300,
       delay_time => 1300, fly_time => 0}];
effect_time(120401) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 300,
       delay_time => 1300, fly_time => 0}];
effect_time(120402) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 300,
       delay_time => 1300, fly_time => 0}];
effect_time(120403) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 950,
       delay_time => 2000, fly_time => 0}];
effect_time(120404) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 700, fly_time => 0},
     #{attack_type => 1, trigger => 6, hit_delay => 400,
       delay_time => 700, fly_time => 0}];
effect_time(120406) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1600, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1700, fly_time => 0}];
effect_time(120407) ->
    [#{attack_type => 1, trigger => 1, hit_delay => 2000,
       delay_time => 4500, fly_time => 0}];
effect_time(120413) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1500, fly_time => 0}];
effect_time(120414) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1000, fly_time => 0}];
effect_time(120415) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1400, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1500, fly_time => 0}];
effect_time(120416) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1400, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1500, fly_time => 0}];
effect_time(120417) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1200, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 500,
       delay_time => 1800, fly_time => 0}];
effect_time(120418) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1400, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1500, fly_time => 0}];
effect_time(120419) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 400, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1500, fly_time => 0}];
effect_time(120421) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1200, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 100,
       delay_time => 800, fly_time => 0}];
effect_time(120422) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0},
     #{attack_type => 2, trigger => 2,
       hurt_ratio => [{300, 1}, {400, 1}, {400, 1}],
       hit_delay => 300, delay_time => 2000, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1500, fly_time => 0}];
effect_time(120423) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1350, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1350, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 250,
       delay_time => 1000, fly_time => 0}];
effect_time(120424) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1400, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 400,
       delay_time => 1600}];
effect_time(120425) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1600, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1700, fly_time => 0}];
effect_time(120426) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1600, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1700, fly_time => 0}];
effect_time(120427) ->
    [#{attack_type => 4, trigger => 2, hit_delay => 50,
       delay_time => 1000, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 200, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 500, fly_time => 0}];
effect_time(120428) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 100,
       delay_time => 2000, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1000, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 500, fly_time => 0}];
effect_time(120430) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 100,
       delay_time => 2000, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1000, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 500, fly_time => 0}];
effect_time(120431) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1600, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1700, fly_time => 0}];
effect_time(120432) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1400, fly_time => 0}];
effect_time(120433) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1200, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 500,
       delay_time => 1800, fly_time => 0}];
effect_time(120438) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 400, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1700, fly_time => 0}];
effect_time(120439) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 400, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1700, fly_time => 0}];
effect_time(120440) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 400, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1700, fly_time => 0}];
effect_time(120441) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 400, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1700, fly_time => 0}];
effect_time(120442) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 400, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1700, fly_time => 0}];
effect_time(120447) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 3000, fly_time => 0},
     #{attack_type => 2, trigger => 3,
       hurt_ratio =>
           [{50, 1}, {300, 1}, {350, 1}, {450, 1}, {600, 2}],
       hit_delay => 50, delay_time => 2700, fly_time => 0},
     #{attack_type => 1, trigger => 3, hit_delay => 50,
       delay_time => 250, fly_time => 0},
     #{attack_type => 0, trigger => 3, hit_delay => 50,
       delay_time => 250, fly_time => 0}];
effect_time(120448) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1500, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2600, fly_time => 0},
     #{attack_type => 2, trigger => 6,
       hurt_ratio => [{850, 1}, {200, 1}, {200, 1}, {600, 5}],
       hit_delay => 850, delay_time => 2600, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(120449) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1600, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(120450) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1500, fly_time => 0}];
effect_time(120451) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1600, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1700, fly_time => 0}];
effect_time(120452) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1600, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1700, fly_time => 0}];
effect_time(120500) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0}];
effect_time(120501) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 800, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1600, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1700, fly_time => 0}];
effect_time(120502) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0}];
effect_time(120503) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 1, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0}];
effect_time(120504) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1750, fly_time => 0},
     #{attack_type => 2, trigger => 6,
       hurt_ratio => [{1350, 1}, {400, 1}, {400, 8}],
       hit_delay => 1350, delay_time => 2200, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0}];
effect_time(120505) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0}];
effect_time(120506) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0}];
effect_time(120510) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1200, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 250,
       delay_time => 700, fly_time => 0}];
effect_time(120511) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 2500, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2700, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 1000,
       delay_time => 1400, fly_time => 0}];
effect_time(120512) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0}];
effect_time(120513) ->
    [#{attack_type => 1, trigger => 6, hit_delay => 930,
       delay_time => 1500, fly_time => 0}];
effect_time(120514) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 950,
       delay_time => 2000, fly_time => 0}];
effect_time(120515) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 100,
       delay_time => 800, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1200, fly_time => 0}];
effect_time(120516) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0}];
effect_time(120517) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1200, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 1500,
       delay_time => 2500, fly_time => 0}];
effect_time(120518) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 200,
       delay_time => 1800, fly_time => 0}];
effect_time(120519) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1400, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1500, fly_time => 0}];
effect_time(120520) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 500,
       delay_time => 1000, fly_time => 0}];
effect_time(120521) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 300,
       delay_time => 1500, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1300, fly_time => 0}];
effect_time(120522) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 1300, fly_time => 0}];
effect_time(120523) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 300, fly_time => 300},
     #{attack_type => 1, trigger => 2, hit_delay => 350,
       delay_time => 1000, fly_time => 0}];
effect_time(120524) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 300, fly_time => 300},
     #{attack_type => 1, trigger => 2, hit_delay => 350,
       delay_time => 1000, fly_time => 0}];
effect_time(120525) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1400, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1500, fly_time => 0}];
effect_time(120526) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 700, fly_time => 0},
     #{attack_type => 1, trigger => 6, hit_delay => 400,
       delay_time => 700, fly_time => 0}];
effect_time(120527) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 700, fly_time => 0},
     #{attack_type => 1, trigger => 6, hit_delay => 400,
       delay_time => 700, fly_time => 0}];
effect_time(120528) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 700, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 150,
       delay_time => 650, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 350, fly_time => 0}];
effect_time(120529) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 900, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0}];
effect_time(120530) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 50,
       delay_time => 700, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1300, fly_time => 0}];
effect_time(120531) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1400, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1500, fly_time => 0}];
effect_time(120532) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1400, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1500, fly_time => 0}];
effect_time(120537) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0}];
effect_time(120538) ->
    [#{attack_type => 1, trigger => 6, hit_delay => 930,
       delay_time => 1500, fly_time => 0}];
effect_time(120539) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 950,
       delay_time => 2000, fly_time => 0}];
effect_time(120540) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 100,
       delay_time => 800, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1200, fly_time => 0}];
effect_time(120541) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0}];
effect_time(120547) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 1300, fly_time => 0}];
effect_time(120550) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1600, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1700, fly_time => 0}];
effect_time(120551) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 600, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 400, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1700, fly_time => 0}];
effect_time(120552) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0}];
effect_time(120560) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 500, fly_time => 0}];
effect_time(120561) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1200, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 500,
       delay_time => 1800, fly_time => 0}];
effect_time(120562) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0}];
effect_time(120566) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 700, fly_time => 0},
     #{attack_type => 1, trigger => 6, hit_delay => 400,
       delay_time => 700, fly_time => 0}];
effect_time(120567) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0}];
effect_time(120568) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0}];
effect_time(120569) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 700, fly_time => 0},
     #{attack_type => 1, trigger => 6, hit_delay => 400,
       delay_time => 700, fly_time => 0}];
effect_time(120570) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0}];
effect_time(120571) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1200, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 500,
       delay_time => 1800, fly_time => 0}];
effect_time(120572) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 200,
       delay_time => 1800, fly_time => 0}];
effect_time(120573) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1200, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 1500,
       delay_time => 2500, fly_time => 0}];
effect_time(120574) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1400, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1500, fly_time => 0}];
effect_time(120575) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0},
     #{attack_type => 1, trigger => 3, hit_delay => 50,
       delay_time => 250, fly_time => 0},
     #{attack_type => 0, trigger => 3, hit_delay => 50,
       delay_time => 250, fly_time => 0},
     #{attack_type => 0, trigger => 3, hit_delay => 50,
       delay_time => 1000, fly_time => 0}];
effect_time(120576) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 300,
       delay_time => 1300, fly_time => 0}];
effect_time(120577) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0}];
effect_time(120583) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1200, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 500,
       delay_time => 1800, fly_time => 0}];
effect_time(120584) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1500, fly_time => 0}];
effect_time(120586) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 300,
       delay_time => 1500, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1300, fly_time => 0}];
effect_time(120587) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 2000, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1200, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 250,
       delay_time => 700, fly_time => 0}];
effect_time(120588) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1700, fly_time => 0}];
effect_time(120589) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 1500,
       delay_time => 500, fly_time => 500},
     #{attack_type => 3, trigger => 2, hit_delay => 500,
       delay_time => 500, fly_time => 500},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1000, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(120590) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 300,
       delay_time => 1500, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1300, fly_time => 0}];
effect_time(120591) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 3, trigger => 2, hit_delay => 0,
       delay_time => 100, fly_time => 300},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(120594) ->
    [#{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0},
     #{attack_type => 1, trigger => 3, hit_delay => 150,
       delay_time => 500, fly_time => 0},
     #{attack_type => 0, trigger => 3, hit_delay => 0,
       delay_time => 800, fly_time => 0},
     #{attack_type => 0, trigger => 3, hit_delay => 150,
       delay_time => 500, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1000, fly_time => 0}];
effect_time(120595) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1000, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 50,
       delay_time => 400, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1000, fly_time => 0}];
effect_time(120596) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 350,
       delay_time => 800, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 500, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 400, fly_time => 0}];
effect_time(120600) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1350, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1350, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 250,
       delay_time => 1000, fly_time => 0}];
effect_time(120601) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1200, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 500,
       delay_time => 1800, fly_time => 0}];
effect_time(120606) ->
    [#{attack_type => 1, trigger => 6, hit_delay => 750,
       delay_time => 1500, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1200, fly_time => 0}];
effect_time(120607) ->
    [#{attack_type => 1, trigger => 6, hit_delay => 750,
       delay_time => 1500, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1500, fly_time => 0}];
effect_time(120608) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 700, fly_time => 0},
     #{attack_type => 1, trigger => 6, hit_delay => 400,
       delay_time => 700, fly_time => 0}];
effect_time(120609) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1400, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1500, fly_time => 0}];
effect_time(120610) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1200, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 1500,
       delay_time => 2500, fly_time => 0}];
effect_time(120615) ->
    [#{attack_type => 1, trigger => 6, hit_delay => 930,
       delay_time => 1500, fly_time => 0}];
effect_time(120616) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 0,
       delay_time => 800, fly_time => 0}];
effect_time(120620) ->
    [#{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 700, fly_time => 0},
     #{attack_type => 1, trigger => 2, hit_delay => 150,
       delay_time => 650, fly_time => 0},
     #{attack_type => 0, trigger => 1, hit_delay => 0,
       delay_time => 350, fly_time => 0}];
effect_time(120623) ->
    [#{attack_type => 1, trigger => 2, hit_delay => 50,
       delay_time => 1300, fly_time => 0},
     #{attack_type => 0, trigger => 2, hit_delay => 0,
       delay_time => 1100}];
effect_time(120624) ->
    [#{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1400, fly_time => 0},
     #{attack_type => 0, trigger => 6, hit_delay => 0,
       delay_time => 1500, fly_time => 0}];
effect_time(120628) ->
    [#{attack_type => 1, trigger => 6, hit_delay => 50,
       delay_time => 500, fly_time => 0}];
effect_time(_) -> [].

