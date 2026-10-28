-file("src/data/wake_data.erl", 1).

-module(wake_data).

-export([get/1,
         get_adoption/1,
         get_active/1,
         get_upgrade/1,
         get_skill/1]).

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

-file("src/data/wake_data.erl", 18).

-file("inc/wake.hrl", 1).

-record(m_wake,
        {angel_adoption = 0,
         angel_step = 0,
         angel_energy = 0,
         angel_growth = 0,
         demon_adoption = 0,
         demon_step = 0,
         demon_energy = 0,
         demon_growth = 0,
         angel_skills = [],
         demon_skills = []}).

-record(wake_base_data,
        {type = 1,
         step = 0,
         energy = 0,
         name = "",
         look_id = 0,
         attr = [],
         buff = []}).

-file("src/data/wake_data.erl", 19).

-file("inc/condition.hrl", 1).

-record(condition,
        {label :: undefined | atom(),
         op = eq ::
             ue | eq | lt | gt | le | ge | range | include,
         val :: undefined | term(),
         msg = "" :: list()}).

-file("src/data/wake_data.erl", 20).

get({1, 1, 0}) ->
    #wake_base_data{type = 1, step = 1, energy = 0,
                    name = lang:get("天使1"),
                    attr = [{1, 100}, {4, 200}, {5, 200}],
                    buff = [10000, 10002]};
get({1, 1, 1}) ->
    #wake_base_data{type = 1, step = 1, energy = 1,
                    name = lang:get("天使2"),
                    attr = [{1, 100}, {4, 200}, {5, 201}],
                    buff = [10000, 10003]};
get({1, 1, 2}) ->
    #wake_base_data{type = 1, step = 1, energy = 2,
                    name = lang:get("天使3"),
                    attr = [{1, 100}, {4, 200}, {5, 202}],
                    buff = [10000, 10004]};
get({1, 1, 3}) ->
    #wake_base_data{type = 1, step = 1, energy = 3,
                    name = lang:get("天使4"),
                    attr = [{1, 100}, {4, 200}, {5, 203}],
                    buff = [10000, 10005]};
get({1, 1, 4}) ->
    #wake_base_data{type = 1, step = 1, energy = 4,
                    name = lang:get("天使5"),
                    attr = [{1, 100}, {4, 200}, {5, 204}],
                    buff = [10000, 10006]};
get({1, 1, 5}) ->
    #wake_base_data{type = 1, step = 1, energy = 5,
                    name = lang:get("天使6"),
                    attr = [{1, 100}, {4, 200}, {5, 205}],
                    buff = [10000, 10007]};
get({1, 2, 0}) ->
    #wake_base_data{type = 1, step = 2, energy = 0,
                    name = lang:get("天使7"),
                    attr = [{1, 100}, {4, 200}, {5, 206}],
                    buff = [10000, 10004]};
get({1, 2, 1}) ->
    #wake_base_data{type = 1, step = 2, energy = 1,
                    name = lang:get("天使8"),
                    attr = [{1, 100}, {4, 200}, {5, 207}],
                    buff = [10000, 10005]};
get({1, 2, 2}) ->
    #wake_base_data{type = 1, step = 2, energy = 2,
                    name = lang:get("天使9"),
                    attr = [{1, 100}, {4, 200}, {5, 208}],
                    buff = [10000, 10006]};
get({1, 2, 3}) ->
    #wake_base_data{type = 1, step = 2, energy = 3,
                    name = lang:get("天使10"),
                    attr = [{1, 100}, {4, 200}, {5, 209}],
                    buff = [10000, 10007]};
get({1, 2, 4}) ->
    #wake_base_data{type = 1, step = 2, energy = 4,
                    name = lang:get("天使11"),
                    attr = [{1, 100}, {4, 200}, {5, 210}],
                    buff = [10000, 10008]};
get({1, 2, 5}) ->
    #wake_base_data{type = 1, step = 2, energy = 5,
                    name = lang:get("天使12"),
                    attr = [{1, 100}, {4, 200}, {5, 211}],
                    buff = [10000, 10009]};
get({1, 3, 0}) ->
    #wake_base_data{type = 1, step = 3, energy = 0,
                    name = lang:get("天使13"),
                    attr = [{1, 100}, {4, 200}, {5, 212}],
                    buff = [10000, 10002]};
get({1, 3, 1}) ->
    #wake_base_data{type = 1, step = 3, energy = 1,
                    name = lang:get("天使14"),
                    attr = [{1, 100}, {4, 200}, {5, 213}],
                    buff = [10000, 10003]};
get({1, 3, 2}) ->
    #wake_base_data{type = 1, step = 3, energy = 2,
                    name = lang:get("天使15"),
                    attr = [{1, 100}, {4, 200}, {5, 214}],
                    buff = [10000, 10004]};
get({1, 3, 3}) ->
    #wake_base_data{type = 1, step = 3, energy = 3,
                    name = lang:get("天使16"),
                    attr = [{1, 100}, {4, 200}, {5, 215}],
                    buff = [10000, 10005]};
get({1, 3, 4}) ->
    #wake_base_data{type = 1, step = 3, energy = 4,
                    name = lang:get("天使17"),
                    attr = [{1, 100}, {4, 200}, {5, 216}],
                    buff = [10000, 10006]};
get({1, 3, 5}) ->
    #wake_base_data{type = 1, step = 3, energy = 5,
                    name = lang:get("天使18"),
                    attr = [{1, 100}, {4, 200}, {5, 217}],
                    buff = [10000, 10007]};
get({1, 4, 0}) ->
    #wake_base_data{type = 1, step = 4, energy = 0,
                    name = lang:get("天使19"),
                    attr = [{1, 100}, {4, 200}, {5, 218}],
                    buff = [10000, 10002]};
get({1, 4, 1}) ->
    #wake_base_data{type = 1, step = 4, energy = 1,
                    name = lang:get("天使20"),
                    attr = [{1, 100}, {4, 200}, {5, 219}],
                    buff = [10000, 10003]};
get({1, 4, 2}) ->
    #wake_base_data{type = 1, step = 4, energy = 2,
                    name = lang:get("天使21"),
                    attr = [{1, 100}, {4, 200}, {5, 220}],
                    buff = [10000, 10004]};
get({1, 4, 3}) ->
    #wake_base_data{type = 1, step = 4, energy = 3,
                    name = lang:get("天使22"),
                    attr = [{1, 100}, {4, 200}, {5, 221}],
                    buff = [10000, 10005]};
get({1, 4, 4}) ->
    #wake_base_data{type = 1, step = 4, energy = 4,
                    name = lang:get("天使23"),
                    attr = [{1, 100}, {4, 200}, {5, 222}],
                    buff = [10000, 10006]};
get({1, 4, 5}) ->
    #wake_base_data{type = 1, step = 4, energy = 5,
                    name = lang:get("天使24"),
                    attr = [{1, 100}, {4, 200}, {5, 223}],
                    buff = [10000, 10007]};
get({1, 5, 0}) ->
    #wake_base_data{type = 1, step = 5, energy = 0,
                    name = lang:get("天使25"),
                    attr = [{1, 100}, {4, 200}, {5, 224}],
                    buff = [10000, 10002]};
get({1, 5, 1}) ->
    #wake_base_data{type = 1, step = 5, energy = 1,
                    name = lang:get("天使26"),
                    attr = [{1, 100}, {4, 200}, {5, 225}],
                    buff = [10000, 10003]};
get({1, 5, 2}) ->
    #wake_base_data{type = 1, step = 5, energy = 2,
                    name = lang:get("天使27"),
                    attr = [{1, 100}, {4, 200}, {5, 226}],
                    buff = [10000, 10004]};
get({1, 5, 3}) ->
    #wake_base_data{type = 1, step = 5, energy = 3,
                    name = lang:get("天使28"),
                    attr = [{1, 100}, {4, 200}, {5, 227}],
                    buff = [10000, 10005]};
get({1, 5, 4}) ->
    #wake_base_data{type = 1, step = 5, energy = 4,
                    name = lang:get("天使29"),
                    attr = [{1, 100}, {4, 200}, {5, 228}],
                    buff = [10000, 10006]};
get({1, 5, 5}) ->
    #wake_base_data{type = 1, step = 5, energy = 5,
                    name = lang:get("天使30"),
                    attr = [{1, 100}, {4, 200}, {5, 229}],
                    buff = [10000, 10007]};
get({1, 6, 0}) ->
    #wake_base_data{type = 1, step = 6, energy = 0,
                    name = lang:get("天使31"),
                    attr = [{1, 100}, {4, 200}, {5, 230}],
                    buff = [10000, 10002]};
get({1, 6, 1}) ->
    #wake_base_data{type = 1, step = 6, energy = 1,
                    name = lang:get("天使32"),
                    attr = [{1, 100}, {4, 200}, {5, 231}],
                    buff = [10000, 10003]};
get({1, 6, 2}) ->
    #wake_base_data{type = 1, step = 6, energy = 2,
                    name = lang:get("天使33"),
                    attr = [{1, 100}, {4, 200}, {5, 232}],
                    buff = [10000, 10004]};
get({1, 6, 3}) ->
    #wake_base_data{type = 1, step = 6, energy = 3,
                    name = lang:get("天使34"),
                    attr = [{1, 100}, {4, 200}, {5, 233}],
                    buff = [10000, 10005]};
get({1, 6, 4}) ->
    #wake_base_data{type = 1, step = 6, energy = 4,
                    name = lang:get("天使35"),
                    attr = [{1, 100}, {4, 200}, {5, 234}],
                    buff = [10000, 10006]};
get({1, 6, 5}) ->
    #wake_base_data{type = 1, step = 6, energy = 5,
                    name = lang:get("天使36"),
                    attr = [{1, 100}, {4, 200}, {5, 235}],
                    buff = [10000, 10007]};
get({2, 1, 0}) ->
    #wake_base_data{type = 2, step = 1, energy = 0,
                    name = lang:get("恶魔1"),
                    attr = [{1, 100}, {7, 200}, {6, 200}],
                    buff = [10000, 10002]};
get({2, 1, 1}) ->
    #wake_base_data{type = 2, step = 1, energy = 1,
                    name = lang:get("恶魔2"),
                    attr = [{1, 100}, {7, 200}, {6, 201}],
                    buff = [10000, 10003]};
get({2, 1, 2}) ->
    #wake_base_data{type = 2, step = 1, energy = 2,
                    name = lang:get("恶魔3"),
                    attr = [{1, 100}, {7, 200}, {6, 202}],
                    buff = [10000, 10004]};
get({2, 1, 3}) ->
    #wake_base_data{type = 2, step = 1, energy = 3,
                    name = lang:get("恶魔4"),
                    attr = [{1, 100}, {7, 200}, {6, 203}],
                    buff = [10000, 10005]};
get({2, 1, 4}) ->
    #wake_base_data{type = 2, step = 1, energy = 4,
                    name = lang:get("恶魔5"),
                    attr = [{1, 100}, {7, 200}, {6, 204}],
                    buff = [10000, 10006]};
get({2, 1, 5}) ->
    #wake_base_data{type = 2, step = 1, energy = 5,
                    name = lang:get("恶魔6"),
                    attr = [{1, 100}, {7, 200}, {6, 205}],
                    buff = [10000, 10007]};
get({2, 2, 0}) ->
    #wake_base_data{type = 2, step = 2, energy = 0,
                    name = lang:get("恶魔7"),
                    attr = [{1, 100}, {7, 200}, {6, 206}],
                    buff = [10000, 10004]};
get({2, 2, 1}) ->
    #wake_base_data{type = 2, step = 2, energy = 1,
                    name = lang:get("恶魔8"),
                    attr = [{1, 100}, {7, 200}, {6, 207}],
                    buff = [10000, 10005]};
get({2, 2, 2}) ->
    #wake_base_data{type = 2, step = 2, energy = 2,
                    name = lang:get("恶魔9"),
                    attr = [{1, 100}, {7, 200}, {6, 208}],
                    buff = [10000, 10006]};
get({2, 2, 3}) ->
    #wake_base_data{type = 2, step = 2, energy = 3,
                    name = lang:get("恶魔10"),
                    attr = [{1, 100}, {7, 200}, {6, 209}],
                    buff = [10000, 10007]};
get({2, 2, 4}) ->
    #wake_base_data{type = 2, step = 2, energy = 4,
                    name = lang:get("恶魔11"),
                    attr = [{1, 100}, {7, 200}, {6, 210}],
                    buff = [10000, 10008]};
get({2, 2, 5}) ->
    #wake_base_data{type = 2, step = 2, energy = 5,
                    name = lang:get("恶魔12"),
                    attr = [{1, 100}, {7, 200}, {6, 211}],
                    buff = [10000, 10009]};
get({2, 3, 0}) ->
    #wake_base_data{type = 2, step = 3, energy = 0,
                    name = lang:get("恶魔13"),
                    attr = [{1, 100}, {7, 200}, {6, 212}],
                    buff = [10000, 10002]};
get({2, 3, 1}) ->
    #wake_base_data{type = 2, step = 3, energy = 1,
                    name = lang:get("恶魔14"),
                    attr = [{1, 100}, {7, 200}, {6, 213}],
                    buff = [10000, 10003]};
get({2, 3, 2}) ->
    #wake_base_data{type = 2, step = 3, energy = 2,
                    name = lang:get("恶魔15"),
                    attr = [{1, 100}, {7, 200}, {6, 214}],
                    buff = [10000, 10004]};
get({2, 3, 3}) ->
    #wake_base_data{type = 2, step = 3, energy = 3,
                    name = lang:get("恶魔16"),
                    attr = [{1, 100}, {7, 200}, {6, 215}],
                    buff = [10000, 10005]};
get({2, 3, 4}) ->
    #wake_base_data{type = 2, step = 3, energy = 4,
                    name = lang:get("恶魔17"),
                    attr = [{1, 100}, {7, 200}, {6, 216}],
                    buff = [10000, 10006]};
get({2, 3, 5}) ->
    #wake_base_data{type = 2, step = 3, energy = 5,
                    name = lang:get("恶魔18"),
                    attr = [{1, 100}, {7, 200}, {6, 217}],
                    buff = [10000, 10007]};
get({2, 4, 0}) ->
    #wake_base_data{type = 2, step = 4, energy = 0,
                    name = lang:get("恶魔19"),
                    attr = [{1, 100}, {7, 200}, {6, 218}],
                    buff = [10000, 10002]};
get({2, 4, 1}) ->
    #wake_base_data{type = 2, step = 4, energy = 1,
                    name = lang:get("恶魔20"),
                    attr = [{1, 100}, {7, 200}, {6, 219}],
                    buff = [10000, 10003]};
get({2, 4, 2}) ->
    #wake_base_data{type = 2, step = 4, energy = 2,
                    name = lang:get("恶魔21"),
                    attr = [{1, 100}, {7, 200}, {6, 220}],
                    buff = [10000, 10004]};
get({2, 4, 3}) ->
    #wake_base_data{type = 2, step = 4, energy = 3,
                    name = lang:get("恶魔22"),
                    attr = [{1, 100}, {7, 200}, {6, 221}],
                    buff = [10000, 10005]};
get({2, 4, 4}) ->
    #wake_base_data{type = 2, step = 4, energy = 4,
                    name = lang:get("恶魔23"),
                    attr = [{1, 100}, {7, 200}, {6, 222}],
                    buff = [10000, 10006]};
get({2, 4, 5}) ->
    #wake_base_data{type = 2, step = 4, energy = 5,
                    name = lang:get("恶魔24"),
                    attr = [{1, 100}, {7, 200}, {6, 223}],
                    buff = [10000, 10007]};
get({2, 5, 0}) ->
    #wake_base_data{type = 2, step = 5, energy = 0,
                    name = lang:get("恶魔25"),
                    attr = [{1, 100}, {7, 200}, {6, 224}],
                    buff = [10000, 10002]};
get({2, 5, 1}) ->
    #wake_base_data{type = 2, step = 5, energy = 1,
                    name = lang:get("恶魔26"),
                    attr = [{1, 100}, {7, 200}, {6, 225}],
                    buff = [10000, 10003]};
get({2, 5, 2}) ->
    #wake_base_data{type = 2, step = 5, energy = 2,
                    name = lang:get("恶魔27"),
                    attr = [{1, 100}, {7, 200}, {6, 226}],
                    buff = [10000, 10004]};
get({2, 5, 3}) ->
    #wake_base_data{type = 2, step = 5, energy = 3,
                    name = lang:get("恶魔28"),
                    attr = [{1, 100}, {7, 200}, {6, 227}],
                    buff = [10000, 10005]};
get({2, 5, 4}) ->
    #wake_base_data{type = 2, step = 5, energy = 4,
                    name = lang:get("恶魔29"),
                    attr = [{1, 100}, {7, 200}, {6, 228}],
                    buff = [10000, 10006]};
get({2, 5, 5}) ->
    #wake_base_data{type = 2, step = 5, energy = 5,
                    name = lang:get("恶魔30"),
                    attr = [{1, 100}, {7, 200}, {6, 229}],
                    buff = [10000, 10007]};
get({2, 6, 0}) ->
    #wake_base_data{type = 2, step = 6, energy = 0,
                    name = lang:get("恶魔31"),
                    attr = [{1, 100}, {7, 200}, {6, 230}],
                    buff = [10000, 10002]};
get({2, 6, 1}) ->
    #wake_base_data{type = 2, step = 6, energy = 1,
                    name = lang:get("恶魔32"),
                    attr = [{1, 100}, {7, 200}, {6, 231}],
                    buff = [10000, 10003]};
get({2, 6, 2}) ->
    #wake_base_data{type = 2, step = 6, energy = 2,
                    name = lang:get("恶魔33"),
                    attr = [{1, 100}, {7, 200}, {6, 232}],
                    buff = [10000, 10004]};
get({2, 6, 3}) ->
    #wake_base_data{type = 2, step = 6, energy = 3,
                    name = lang:get("恶魔34"),
                    attr = [{1, 100}, {7, 200}, {6, 233}],
                    buff = [10000, 10005]};
get({2, 6, 4}) ->
    #wake_base_data{type = 2, step = 6, energy = 4,
                    name = lang:get("恶魔35"),
                    attr = [{1, 100}, {7, 200}, {6, 234}],
                    buff = [10000, 10006]};
get({2, 6, 5}) ->
    #wake_base_data{type = 2, step = 6, energy = 5,
                    name = lang:get("恶魔36"),
                    attr = [{1, 100}, {7, 200}, {6, 235}],
                    buff = [10000, 10007]};
get(_) -> false.

get_adoption(1) ->
    #{need_lev => 50,
      need_item => [{90000, 1000}, {21140, 2}]};
get_adoption(2) ->
    #{need_lev => 55,
      need_item => [{90000, 1000}, {21141, 2}]};
get_adoption(_) -> false.

get_active(1) ->
    [#condition{label = lev, op = gt, val = 50,
                msg = lang:get("等级不足50,无法激活")}];
get_active(2) ->
    [#condition{label = lev, op = gt, val = 55,
                msg = lang:get("等级不足55,无法激活")}];
get_active(_) -> false.

get_upgrade({1, 1, 0}) ->
    #{need_growth => 800,
      rand_growth => [{100, 500}, {500, 200}],
      need_item => [{90000, 10000}], next_step => 1};
get_upgrade({1, 1, 1}) ->
    #{need_growth => 900,
      rand_growth => [{100, 500}, {500, 200}],
      need_item => [{90000, 10000}], next_step => 2};
get_upgrade({1, 1, 2}) ->
    #{need_growth => 1000,
      rand_growth => [{100, 500}, {500, 200}],
      need_item => [{90000, 10000}], next_step => 3};
get_upgrade({1, 1, 3}) ->
    #{need_growth => 1100,
      rand_growth => [{100, 500}, {500, 200}],
      need_item => [{90000, 10000}], next_step => 4};
get_upgrade({1, 1, 4}) ->
    #{need_growth => 1200,
      rand_growth => [{100, 500}, {500, 200}],
      need_item => [{90000, 10000}], next_step => 5};
get_upgrade({1, 1, 5}) ->
    #{need_growth => 1300,
      rand_growth => [{100, 500}, {500, 200}],
      need_item => [{90000, 10000}], next_step => 0};
get_upgrade({1, 2, 0}) ->
    #{need_growth => 1400,
      rand_growth => [{100, 500}, {500, 200}],
      need_item => [{90000, 10000}], next_step => 1};
get_upgrade({1, 2, 1}) ->
    #{need_growth => 1500,
      rand_growth => [{100, 500}, {500, 200}],
      need_item => [{90000, 10000}], next_step => 2};
get_upgrade({1, 2, 2}) ->
    #{need_growth => 1600,
      rand_growth => [{100, 500}, {500, 200}],
      need_item => [{90000, 10000}], next_step => 3};
get_upgrade({1, 2, 3}) ->
    #{need_growth => 1700,
      rand_growth => [{100, 500}, {500, 200}],
      need_item => [{90000, 10000}], next_step => 4};
get_upgrade({1, 2, 4}) ->
    #{need_growth => 1800,
      rand_growth => [{100, 500}, {500, 200}],
      need_item => [{90000, 10000}], next_step => 5};
get_upgrade({1, 2, 5}) ->
    #{need_growth => 1900,
      rand_growth => [{100, 500}, {500, 200}],
      need_item => [{90000, 10000}], next_step => 0};
get_upgrade({1, 3, 0}) ->
    #{need_growth => 2000,
      rand_growth => [{100, 500}, {500, 200}],
      need_item => [{90000, 10000}], next_step => 1};
get_upgrade({1, 3, 1}) ->
    #{need_growth => 2100,
      rand_growth => [{100, 500}, {500, 200}],
      need_item => [{90000, 10000}], next_step => 2};
get_upgrade({1, 3, 2}) ->
    #{need_growth => 2200,
      rand_growth => [{100, 500}, {500, 200}],
      need_item => [{90000, 10000}], next_step => 3};
get_upgrade({1, 3, 3}) ->
    #{need_growth => 2300,
      rand_growth => [{100, 500}, {500, 200}],
      need_item => [{90000, 10000}], next_step => 4};
get_upgrade({1, 3, 4}) ->
    #{need_growth => 2400,
      rand_growth => [{100, 500}, {500, 200}],
      need_item => [{90000, 10000}], next_step => 5};
get_upgrade({1, 3, 5}) ->
    #{need_growth => 2500,
      rand_growth => [{100, 500}, {500, 200}],
      need_item => [{90000, 10000}], next_step => 0};
get_upgrade({1, 4, 0}) ->
    #{need_growth => 2600,
      rand_growth => [{100, 500}, {500, 200}],
      need_item => [{90000, 10000}], next_step => 1};
get_upgrade({1, 4, 1}) ->
    #{need_growth => 2700,
      rand_growth => [{100, 500}, {500, 200}],
      need_item => [{90000, 10000}], next_step => 2};
get_upgrade({1, 4, 2}) ->
    #{need_growth => 2800,
      rand_growth => [{100, 500}, {500, 200}],
      need_item => [{90000, 10000}], next_step => 3};
get_upgrade({1, 4, 3}) ->
    #{need_growth => 2900,
      rand_growth => [{100, 500}, {500, 200}],
      need_item => [{90000, 10000}], next_step => 4};
get_upgrade({1, 4, 4}) ->
    #{need_growth => 3000,
      rand_growth => [{100, 500}, {500, 200}],
      need_item => [{90000, 10000}], next_step => 5};
get_upgrade({1, 4, 5}) ->
    #{need_growth => 3100,
      rand_growth => [{100, 500}, {500, 200}],
      need_item => [{90000, 10000}], next_step => 0};
get_upgrade({1, 5, 0}) ->
    #{need_growth => 3200,
      rand_growth => [{100, 500}, {500, 200}],
      need_item => [{90000, 10000}, {21142, 1}],
      next_step => 1};
get_upgrade({1, 5, 1}) ->
    #{need_growth => 3300,
      rand_growth => [{100, 500}, {500, 200}],
      need_item => [{90000, 10000}, {21142, 2}],
      next_step => 2};
get_upgrade({1, 5, 2}) ->
    #{need_growth => 3400,
      rand_growth => [{100, 500}, {500, 200}],
      need_item => [{90000, 10000}, {21142, 3}],
      next_step => 3};
get_upgrade({1, 5, 3}) ->
    #{need_growth => 3500,
      rand_growth => [{100, 500}, {500, 200}],
      need_item => [{90000, 10000}, {21142, 4}],
      next_step => 4};
get_upgrade({1, 5, 4}) ->
    #{need_growth => 3600,
      rand_growth => [{100, 500}, {500, 200}],
      need_item => [{90000, 10000}, {21142, 5}],
      next_step => 5};
get_upgrade({1, 5, 5}) ->
    #{need_growth => 3700,
      rand_growth => [{100, 500}, {500, 200}],
      need_item => [{90000, 10000}, {21142, 6}],
      next_step => 0};
get_upgrade({1, 6, 0}) ->
    #{need_growth => 3800,
      rand_growth => [{100, 500}, {500, 200}],
      need_item => [{90000, 10000}, {21142, 7}],
      next_step => 1};
get_upgrade({1, 6, 1}) ->
    #{need_growth => 3900,
      rand_growth => [{100, 500}, {500, 200}],
      need_item => [{90000, 10000}, {21142, 8}],
      next_step => 2};
get_upgrade({1, 6, 2}) ->
    #{need_growth => 4000,
      rand_growth => [{100, 500}, {500, 200}],
      need_item => [{90000, 10000}, {21142, 9}],
      next_step => 3};
get_upgrade({1, 6, 3}) ->
    #{need_growth => 4100,
      rand_growth => [{100, 500}, {500, 200}],
      need_item => [{90000, 10000}, {21142, 10}],
      next_step => 4};
get_upgrade({1, 6, 4}) ->
    #{need_growth => 4200,
      rand_growth => [{100, 500}, {500, 200}],
      need_item => [{90000, 10000}, {21142, 11}],
      next_step => 5};
get_upgrade({1, 6, 5}) ->
    #{need_growth => 4300,
      rand_growth => [{100, 500}, {500, 200}],
      need_item => [{90000, 10000}, {21142, 12}],
      next_step => 0};
get_upgrade({2, 1, 0}) ->
    #{rand_growth => [], next_step => 1};
get_upgrade({2, 1, 1}) ->
    #{need_growth => 800,
      rand_growth => [{100, 500}, {500, 200}],
      need_item => [{90000, 10000}], next_step => 2};
get_upgrade({2, 1, 2}) ->
    #{need_growth => 900,
      rand_growth => [{100, 500}, {500, 200}],
      need_item => [{90000, 10000}], next_step => 3};
get_upgrade({2, 1, 3}) ->
    #{need_growth => 1000,
      rand_growth => [{100, 500}, {500, 200}],
      need_item => [{90000, 10000}], next_step => 4};
get_upgrade({2, 1, 4}) ->
    #{need_growth => 1100,
      rand_growth => [{100, 500}, {500, 200}],
      need_item => [{90000, 10000}], next_step => 5};
get_upgrade({2, 1, 5}) ->
    #{need_growth => 1200,
      rand_growth => [{100, 500}, {500, 200}],
      need_item => [{90000, 10000}], next_step => 0};
get_upgrade({2, 2, 0}) ->
    #{need_growth => 1300,
      rand_growth => [{100, 500}, {500, 200}],
      need_item => [{90000, 10000}], next_step => 1};
get_upgrade({2, 2, 1}) ->
    #{need_growth => 1400,
      rand_growth => [{100, 500}, {500, 200}],
      need_item => [{90000, 10000}], next_step => 2};
get_upgrade({2, 2, 2}) ->
    #{need_growth => 1500,
      rand_growth => [{100, 500}, {500, 200}],
      need_item => [{90000, 10000}], next_step => 3};
get_upgrade({2, 2, 3}) ->
    #{need_growth => 1600,
      rand_growth => [{100, 500}, {500, 200}],
      need_item => [{90000, 10000}], next_step => 4};
get_upgrade({2, 2, 4}) ->
    #{need_growth => 1700,
      rand_growth => [{100, 500}, {500, 200}],
      need_item => [{90000, 10000}], next_step => 5};
get_upgrade({2, 2, 5}) ->
    #{need_growth => 1800,
      rand_growth => [{100, 500}, {500, 200}],
      need_item => [{90000, 10000}], next_step => 0};
get_upgrade({2, 3, 0}) ->
    #{need_growth => 1900,
      rand_growth => [{100, 500}, {500, 200}],
      need_item => [{90000, 10000}], next_step => 1};
get_upgrade({2, 3, 1}) ->
    #{need_growth => 2000,
      rand_growth => [{100, 500}, {500, 200}],
      need_item => [{90000, 10000}], next_step => 2};
get_upgrade({2, 3, 2}) ->
    #{need_growth => 2100,
      rand_growth => [{100, 500}, {500, 200}],
      need_item => [{90000, 10000}], next_step => 3};
get_upgrade({2, 3, 3}) ->
    #{need_growth => 2200,
      rand_growth => [{100, 500}, {500, 200}],
      need_item => [{90000, 10000}], next_step => 4};
get_upgrade({2, 3, 4}) ->
    #{need_growth => 2300,
      rand_growth => [{100, 500}, {500, 200}],
      need_item => [{90000, 10000}], next_step => 5};
get_upgrade({2, 3, 5}) ->
    #{need_growth => 2400,
      rand_growth => [{100, 500}, {500, 200}],
      need_item => [{90000, 10000}], next_step => 0};
get_upgrade({2, 4, 0}) ->
    #{need_growth => 2500,
      rand_growth => [{100, 500}, {500, 200}],
      need_item => [{90000, 10000}], next_step => 1};
get_upgrade({2, 4, 1}) ->
    #{need_growth => 2600,
      rand_growth => [{100, 500}, {500, 200}],
      need_item => [{90000, 10000}], next_step => 2};
get_upgrade({2, 4, 2}) ->
    #{need_growth => 2700,
      rand_growth => [{100, 500}, {500, 200}],
      need_item => [{90000, 10000}], next_step => 3};
get_upgrade({2, 4, 3}) ->
    #{need_growth => 2800,
      rand_growth => [{100, 500}, {500, 200}],
      need_item => [{90000, 10000}], next_step => 4};
get_upgrade({2, 4, 4}) ->
    #{need_growth => 2900,
      rand_growth => [{100, 500}, {500, 200}],
      need_item => [{90000, 10000}], next_step => 5};
get_upgrade({2, 4, 5}) ->
    #{need_growth => 3000,
      rand_growth => [{100, 500}, {500, 200}],
      need_item => [{90000, 10000}], next_step => 0};
get_upgrade({2, 5, 0}) ->
    #{need_growth => 3100,
      rand_growth => [{100, 500}, {500, 200}],
      need_item => [{90000, 10000}], next_step => 1};
get_upgrade({2, 5, 1}) ->
    #{need_growth => 3200,
      rand_growth => [{100, 500}, {500, 200}],
      need_item => [{90000, 10000}, {21143, 1}],
      next_step => 2};
get_upgrade({2, 5, 2}) ->
    #{need_growth => 3300,
      rand_growth => [{100, 500}, {500, 200}],
      need_item => [{90000, 10000}, {21143, 2}],
      next_step => 3};
get_upgrade({2, 5, 3}) ->
    #{need_growth => 3400,
      rand_growth => [{100, 500}, {500, 200}],
      need_item => [{90000, 10000}, {21143, 3}],
      next_step => 4};
get_upgrade({2, 5, 4}) ->
    #{need_growth => 3500,
      rand_growth => [{100, 500}, {500, 200}],
      need_item => [{90000, 10000}, {21143, 4}],
      next_step => 5};
get_upgrade({2, 5, 5}) ->
    #{need_growth => 3600,
      rand_growth => [{100, 500}, {500, 200}],
      need_item => [{90000, 10000}, {21143, 5}],
      next_step => 0};
get_upgrade({2, 6, 0}) ->
    #{need_growth => 3700,
      rand_growth => [{100, 500}, {500, 200}],
      need_item => [{90000, 10000}, {21143, 6}],
      next_step => 1};
get_upgrade({2, 6, 1}) ->
    #{need_growth => 3800,
      rand_growth => [{100, 500}, {500, 200}],
      need_item => [{90000, 10000}, {21143, 7}],
      next_step => 2};
get_upgrade({2, 6, 2}) ->
    #{need_growth => 3900,
      rand_growth => [{100, 500}, {500, 200}],
      need_item => [{90000, 10000}, {21143, 8}],
      next_step => 3};
get_upgrade({2, 6, 3}) ->
    #{need_growth => 4000,
      rand_growth => [{100, 500}, {500, 200}],
      need_item => [{90000, 10000}, {21143, 9}],
      next_step => 4};
get_upgrade({2, 6, 4}) ->
    #{need_growth => 4100,
      rand_growth => [{100, 500}, {500, 200}],
      need_item => [{90000, 10000}, {21143, 10}],
      next_step => 5};
get_upgrade({2, 6, 5}) ->
    #{need_growth => 4200,
      rand_growth => [{100, 500}, {500, 200}],
      need_item => [{90000, 10000}, {21143, 11}],
      next_step => 0};
get_upgrade(_) -> false.

get_skill(_) -> false.

