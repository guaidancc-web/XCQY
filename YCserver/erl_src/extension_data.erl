-file("src/data/extension_data.erl", 1).

-module(extension_data).

-export([get/1, get_activity/1]).

-file("inc/extension.hrl", 1).

-record(m_extension,
        {ver = 3,
         init = 0,
         key = "",
         key_time = 0,
         ships = [],
         apply_id = {0, "", 0},
         apply_key = "",
         apply_name = "",
         day_score = 0,
         day_flag = 0}).

-record(extension_key,
        {key, role_id, role_name = "", time}).

-record(extension_role,
        {ver = 2,
         id,
         name,
         apply_id = {0, "", 0},
         apply_key = "",
         apply_name = "",
         key = "",
         key_time = 0,
         ships = [],
         rewarded = [],
         day_score = 0,
         day_flag = 0}).

-record(extension_ship,
        {ver = 2,
         id = {0, "", 0},
         name = "",
         score = 0,
         key = "",
         time = 0,
         activity_score = 0,
         activity_time = []}).

-file("src/data/extension_data.erl", 17).

get(0) ->
    #{need_lev => 0,
      gain_list =>
          [{0, 2, 20006, 0, 20},
           {0, 2, 90000, 0, 50000},
           {0, 2, 20034, 0, 2}]};
get(1) ->
    #{need_lev => 55,
      gain_list =>
          [{0, 2, 20006, 0, 30},
           {0, 2, 20020, 0, 5},
           {0, 2, 20025, 0, 1},
           {0, 2, 22219, 0, 1}]};
get(2) ->
    #{need_lev => 65,
      gain_list =>
          [{0, 2, 20006, 0, 40},
           {0, 2, 22585, 0, 1},
           {0, 2, 20008, 0, 1},
           {0, 2, 22250, 0, 1}]};
get(3) ->
    #{need_lev => 75,
      gain_list =>
          [{0, 2, 20006, 0, 50},
           {0, 2, 20616, 0, 1},
           {0, 2, 22251, 0, 1}]};
get(4) ->
    #{need_lev => 85,
      gain_list =>
          [{0, 2, 20006, 0, 50},
           {0, 2, 20617, 0, 1},
           {0, 2, 23556, 0, 5}]};
get(_Id) -> false.

get_activity(RoleLev)
    when RoleLev >= 1 andalso RoleLev =< 40 ->
    {1, 1};
get_activity(RoleLev)
    when RoleLev >= 41 andalso RoleLev =< 50 ->
    {2, 2};
get_activity(RoleLev)
    when RoleLev >= 51 andalso RoleLev =< 60 ->
    {3, 3};
get_activity(RoleLev)
    when RoleLev >= 61 andalso RoleLev =< 70 ->
    {4, 3};
get_activity(RoleLev)
    when RoleLev >= 71 andalso RoleLev =< 80 ->
    {5, 4};
get_activity(RoleLev)
    when RoleLev >= 81 andalso RoleLev =< 90 ->
    {6, 5};
get_activity(RoleLev)
    when RoleLev >= 91 andalso RoleLev =< 200 ->
    {7, 6};
get_activity(_) -> false.

