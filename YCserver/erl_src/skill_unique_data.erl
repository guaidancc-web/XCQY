-file("src/data/skill_unique_data.erl", 1).

-module(skill_unique_data).

-export([get_chief_data/1,
         get_all_chief/0,
         get_skill_unique/1,
         get_combat_exp/1,
         get_attr_ratio/2,
         get_classes_skillid/1,
         get_classes_stoneId/1]).

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

-file("src/data/skill_unique_data.erl", 18).

get_chief_data(1) ->
    #{id => 1, classes => 1, unit_id => [{91378, 90, 200}],
      reward =>
          [{23824, 1, 1, 600},
           {23825, 1, 2, 600},
           {23826, 1, 3, 600},
           {23827, 1, 4, 600},
           {23828, 1, 5, 600},
           {23829, 1, 7, 600},
           {23835, 1, 6, 600},
           {23833, 1, 0, 400}]};
get_chief_data(2) ->
    #{id => 2, classes => 2, unit_id => [{91377, 90, 200}],
      reward =>
          [{23824, 1, 1, 600},
           {23825, 1, 2, 600},
           {23826, 1, 3, 600},
           {23827, 1, 4, 600},
           {23828, 1, 5, 600},
           {23829, 1, 7, 600},
           {23835, 1, 6, 600},
           {23833, 1, 0, 400}]};
get_chief_data(3) ->
    #{id => 3, classes => 3, unit_id => [{91379, 90, 200}],
      reward =>
          [{23824, 1, 1, 600},
           {23825, 1, 2, 600},
           {23826, 1, 3, 600},
           {23827, 1, 4, 600},
           {23828, 1, 5, 600},
           {23829, 1, 7, 600},
           {23835, 1, 6, 600},
           {23833, 1, 0, 400}]};
get_chief_data(4) ->
    #{id => 4, classes => 4, unit_id => [{91380, 90, 200}],
      reward =>
          [{23824, 1, 1, 600},
           {23825, 1, 2, 600},
           {23826, 1, 3, 600},
           {23827, 1, 4, 600},
           {23828, 1, 5, 600},
           {23829, 1, 7, 600},
           {23835, 1, 6, 600},
           {23833, 1, 0, 400}]};
get_chief_data(5) ->
    #{id => 5, classes => 5, unit_id => [{91381, 90, 200}],
      reward =>
          [{23824, 1, 1, 600},
           {23825, 1, 2, 600},
           {23826, 1, 3, 600},
           {23827, 1, 4, 600},
           {23828, 1, 5, 600},
           {23829, 1, 7, 600},
           {23835, 1, 6, 600},
           {23833, 1, 0, 400}]};
get_chief_data(6) ->
    #{id => 6, classes => 6, unit_id => [{91382, 90, 200}],
      reward =>
          [{23824, 1, 1, 600},
           {23825, 1, 2, 600},
           {23826, 1, 3, 600},
           {23827, 1, 4, 600},
           {23828, 1, 5, 600},
           {23829, 1, 7, 600},
           {23835, 1, 6, 600},
           {23833, 1, 0, 400}]};
get_chief_data(7) ->
    #{id => 7, classes => 7, unit_id => [{91383, 90, 200}],
      reward =>
          [{23824, 1, 1, 600},
           {23825, 1, 2, 600},
           {23826, 1, 3, 600},
           {23827, 1, 4, 600},
           {23828, 1, 5, 600},
           {23829, 1, 7, 600},
           {23835, 1, 6, 600},
           {23833, 1, 0, 400}]};
get_chief_data(_) -> false.

get_all_chief() ->
    [#{id => 1, classes => 1, unit_id => [{91378, 90, 200}],
       reward =>
           [{23824, 1, 1, 600},
            {23825, 1, 2, 600},
            {23826, 1, 3, 600},
            {23827, 1, 4, 600},
            {23828, 1, 5, 600},
            {23829, 1, 7, 600},
            {23835, 1, 6, 600},
            {23833, 1, 0, 400}]},
     #{id => 2, classes => 2, unit_id => [{91377, 90, 200}],
       reward =>
           [{23824, 1, 1, 600},
            {23825, 1, 2, 600},
            {23826, 1, 3, 600},
            {23827, 1, 4, 600},
            {23828, 1, 5, 600},
            {23829, 1, 7, 600},
            {23835, 1, 6, 600},
            {23833, 1, 0, 400}]},
     #{id => 3, classes => 3, unit_id => [{91379, 90, 200}],
       reward =>
           [{23824, 1, 1, 600},
            {23825, 1, 2, 600},
            {23826, 1, 3, 600},
            {23827, 1, 4, 600},
            {23828, 1, 5, 600},
            {23829, 1, 7, 600},
            {23835, 1, 6, 600},
            {23833, 1, 0, 400}]},
     #{id => 4, classes => 4, unit_id => [{91380, 90, 200}],
       reward =>
           [{23824, 1, 1, 600},
            {23825, 1, 2, 600},
            {23826, 1, 3, 600},
            {23827, 1, 4, 600},
            {23828, 1, 5, 600},
            {23829, 1, 7, 600},
            {23835, 1, 6, 600},
            {23833, 1, 0, 400}]},
     #{id => 5, classes => 5, unit_id => [{91381, 90, 200}],
       reward =>
           [{23824, 1, 1, 600},
            {23825, 1, 2, 600},
            {23826, 1, 3, 600},
            {23827, 1, 4, 600},
            {23828, 1, 5, 600},
            {23829, 1, 7, 600},
            {23835, 1, 6, 600},
            {23833, 1, 0, 400}]},
     #{id => 6, classes => 6, unit_id => [{91382, 90, 200}],
       reward =>
           [{23824, 1, 1, 600},
            {23825, 1, 2, 600},
            {23826, 1, 3, 600},
            {23827, 1, 4, 600},
            {23828, 1, 5, 600},
            {23829, 1, 7, 600},
            {23835, 1, 6, 600},
            {23833, 1, 0, 400}]},
     #{id => 7, classes => 7, unit_id => [{91383, 90, 200}],
       reward =>
           [{23824, 1, 1, 600},
            {23825, 1, 2, 600},
            {23826, 1, 3, 600},
            {23827, 1, 4, 600},
            {23828, 1, 5, 600},
            {23829, 1, 7, 600},
            {23835, 1, 6, 600},
            {23833, 1, 0, 400}]}].

get_skill_unique({10009, 1}) ->
    #{id => 10009, name => lang:get("追命连环"), lev => 1,
      role_lev_limit => 90, classes => 1,
      learn_cost => [{23824, 10}], up_cost => [],
      dayly_sq_exp => 0, is_down => 1, is_break => 0};
get_skill_unique({10009, 2}) ->
    #{id => 10009, name => lang:get("追命连环"), lev => 2,
      role_lev_limit => 90, classes => 1, learn_cost => [],
      up_cost => [{90055, 9360}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({10009, 3}) ->
    #{id => 10009, name => lang:get("追命连环"), lev => 3,
      role_lev_limit => 90, classes => 1, learn_cost => [],
      up_cost => [{90055, 10800}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({10009, 4}) ->
    #{id => 10009, name => lang:get("追命连环"), lev => 4,
      role_lev_limit => 90, classes => 1, learn_cost => [],
      up_cost => [{90055, 12240}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({10009, 5}) ->
    #{id => 10009, name => lang:get("追命连环"), lev => 5,
      role_lev_limit => 90, classes => 1, learn_cost => [],
      up_cost => [{90055, 13680}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({10009, 6}) ->
    #{id => 10009, name => lang:get("追命连环"), lev => 6,
      role_lev_limit => 90, classes => 1, learn_cost => [],
      up_cost => [{90055, 15120}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({10009, 7}) ->
    #{id => 10009, name => lang:get("追命连环"), lev => 7,
      role_lev_limit => 90, classes => 1, learn_cost => [],
      up_cost => [{90055, 16560}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({10009, 8}) ->
    #{id => 10009, name => lang:get("追命连环"), lev => 8,
      role_lev_limit => 90, classes => 1, learn_cost => [],
      up_cost => [{90055, 18000}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({10009, 9}) ->
    #{id => 10009, name => lang:get("追命连环"), lev => 9,
      role_lev_limit => 90, classes => 1, learn_cost => [],
      up_cost => [{90055, 21600}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({10009, 10}) ->
    #{id => 10009, name => lang:get("追命连环"), lev => 10,
      role_lev_limit => 90, classes => 1, learn_cost => [],
      up_cost => [{90055, 25200}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({10009, 11}) ->
    #{id => 10009, name => lang:get("追命连环"), lev => 11,
      role_lev_limit => 90, classes => 1, learn_cost => [],
      up_cost => [{90055, 28800}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({10009, 12}) ->
    #{id => 10009, name => lang:get("追命连环"), lev => 12,
      role_lev_limit => 90, classes => 1, learn_cost => [],
      up_cost => [{90055, 32400}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({10009, 13}) ->
    #{id => 10009, name => lang:get("追命连环"), lev => 13,
      role_lev_limit => 90, classes => 1, learn_cost => [],
      up_cost => [{90055, 36000}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({10009, 14}) ->
    #{id => 10009, name => lang:get("追命连环"), lev => 14,
      role_lev_limit => 90, classes => 1, learn_cost => [],
      up_cost => [{90055, 39600}], dayly_sq_exp => 0,
      is_down => 1, is_break => 1};
get_skill_unique({10009, 15}) ->
    #{id => 10009, name => lang:get("追命连环"), lev => 15,
      role_lev_limit => 90, classes => 1, learn_cost => [],
      up_cost => [{23824, 10}], dayly_sq_exp => 0,
      is_down => 0, is_break => 0};
get_skill_unique({10009, 16}) ->
    #{id => 10009, name => lang:get("追命连环"), lev => 16,
      role_lev_limit => 90, classes => 1, learn_cost => [],
      up_cost => [{90055, 46800}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({10009, 17}) ->
    #{id => 10009, name => lang:get("追命连环"), lev => 17,
      role_lev_limit => 90, classes => 1, learn_cost => [],
      up_cost => [{90055, 50400}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({10009, 18}) ->
    #{id => 10009, name => lang:get("追命连环"), lev => 18,
      role_lev_limit => 90, classes => 1, learn_cost => [],
      up_cost => [{90055, 54000}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({10009, 19}) ->
    #{id => 10009, name => lang:get("追命连环"), lev => 19,
      role_lev_limit => 90, classes => 1, learn_cost => [],
      up_cost => [{90055, 57600}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({10009, 20}) ->
    #{id => 10009, name => lang:get("追命连环"), lev => 20,
      role_lev_limit => 90, classes => 1, learn_cost => [],
      up_cost => [{90055, 61200}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({10009, 21}) ->
    #{id => 10009, name => lang:get("追命连环"), lev => 21,
      role_lev_limit => 90, classes => 1, learn_cost => [],
      up_cost => [{90055, 64800}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({10009, 22}) ->
    #{id => 10009, name => lang:get("追命连环"), lev => 22,
      role_lev_limit => 90, classes => 1, learn_cost => [],
      up_cost => [{90055, 68400}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({10009, 23}) ->
    #{id => 10009, name => lang:get("追命连环"), lev => 23,
      role_lev_limit => 90, classes => 1, learn_cost => [],
      up_cost => [{90055, 72000}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({10009, 24}) ->
    #{id => 10009, name => lang:get("追命连环"), lev => 24,
      role_lev_limit => 90, classes => 1, learn_cost => [],
      up_cost => [{90055, 75600}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({10009, 25}) ->
    #{id => 10009, name => lang:get("追命连环"), lev => 25,
      role_lev_limit => 90, classes => 1, learn_cost => [],
      up_cost => [{90055, 79200}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({10009, 26}) ->
    #{id => 10009, name => lang:get("追命连环"), lev => 26,
      role_lev_limit => 90, classes => 1, learn_cost => [],
      up_cost => [{90055, 82800}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({10009, 27}) ->
    #{id => 10009, name => lang:get("追命连环"), lev => 27,
      role_lev_limit => 90, classes => 1, learn_cost => [],
      up_cost => [{90055, 86400}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({10009, 28}) ->
    #{id => 10009, name => lang:get("追命连环"), lev => 28,
      role_lev_limit => 90, classes => 1, learn_cost => [],
      up_cost => [{90055, 90000}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({10009, 29}) ->
    #{id => 10009, name => lang:get("追命连环"), lev => 29,
      role_lev_limit => 90, classes => 1, learn_cost => [],
      up_cost => [{90055, 93600}], dayly_sq_exp => 0,
      is_down => 1, is_break => 1};
get_skill_unique({10009, 30}) ->
    #{id => 10009, name => lang:get("追命连环"), lev => 30,
      role_lev_limit => 90, classes => 1, learn_cost => [],
      up_cost => [{23824, 30}], dayly_sq_exp => 6000,
      is_down => 0, is_break => 0};
get_skill_unique({10009, 31}) ->
    #{id => 10009, name => lang:get("追命连环"), lev => 31,
      role_lev_limit => 91, classes => 1, learn_cost => [],
      up_cost => [{90055, 101920}], dayly_sq_exp => 6000,
      is_down => 1, is_break => 0};
get_skill_unique({10009, 32}) ->
    #{id => 10009, name => lang:get("追命连环"), lev => 32,
      role_lev_limit => 92, classes => 1, learn_cost => [],
      up_cost => [{90055, 106720}], dayly_sq_exp => 6000,
      is_down => 1, is_break => 0};
get_skill_unique({10009, 33}) ->
    #{id => 10009, name => lang:get("追命连环"), lev => 33,
      role_lev_limit => 93, classes => 1, learn_cost => [],
      up_cost => [{90055, 111600}], dayly_sq_exp => 6000,
      is_down => 1, is_break => 0};
get_skill_unique({10009, 34}) ->
    #{id => 10009, name => lang:get("追命连环"), lev => 34,
      role_lev_limit => 94, classes => 1, learn_cost => [],
      up_cost => [{90055, 116560}], dayly_sq_exp => 6000,
      is_down => 1, is_break => 0};
get_skill_unique({10009, 35}) ->
    #{id => 10009, name => lang:get("追命连环"), lev => 35,
      role_lev_limit => 95, classes => 1, learn_cost => [],
      up_cost => [{90055, 121600}], dayly_sq_exp => 8000,
      is_down => 1, is_break => 0};
get_skill_unique({10009, 36}) ->
    #{id => 10009, name => lang:get("追命连环"), lev => 36,
      role_lev_limit => 96, classes => 1, learn_cost => [],
      up_cost => [{90055, 126720}], dayly_sq_exp => 8000,
      is_down => 1, is_break => 0};
get_skill_unique({10009, 37}) ->
    #{id => 10009, name => lang:get("追命连环"), lev => 37,
      role_lev_limit => 97, classes => 1, learn_cost => [],
      up_cost => [{90055, 131920}], dayly_sq_exp => 8000,
      is_down => 1, is_break => 0};
get_skill_unique({10009, 38}) ->
    #{id => 10009, name => lang:get("追命连环"), lev => 38,
      role_lev_limit => 98, classes => 1, learn_cost => [],
      up_cost => [{90055, 137200}], dayly_sq_exp => 8000,
      is_down => 1, is_break => 0};
get_skill_unique({10009, 39}) ->
    #{id => 10009, name => lang:get("追命连环"), lev => 39,
      role_lev_limit => 99, classes => 1, learn_cost => [],
      up_cost => [{90055, 142560}], dayly_sq_exp => 8000,
      is_down => 1, is_break => 0};
get_skill_unique({10009, 40}) ->
    #{id => 10009, name => lang:get("追命连环"), lev => 40,
      role_lev_limit => 100, classes => 1, learn_cost => [],
      up_cost => [{90055, 148000}], dayly_sq_exp => 10000,
      is_down => 1, is_break => 0};
get_skill_unique({10009, 41}) ->
    #{id => 10009, name => lang:get("追命连环"), lev => 41,
      role_lev_limit => 101, classes => 1, learn_cost => [],
      up_cost => [{90055, 153520}], dayly_sq_exp => 10400,
      is_down => 1, is_break => 0};
get_skill_unique({10009, 42}) ->
    #{id => 10009, name => lang:get("追命连环"), lev => 42,
      role_lev_limit => 102, classes => 1, learn_cost => [],
      up_cost => [{90055, 159120}], dayly_sq_exp => 10800,
      is_down => 1, is_break => 0};
get_skill_unique({10009, 43}) ->
    #{id => 10009, name => lang:get("追命连环"), lev => 43,
      role_lev_limit => 103, classes => 1, learn_cost => [],
      up_cost => [{90055, 164800}], dayly_sq_exp => 11200,
      is_down => 1, is_break => 0};
get_skill_unique({10009, 44}) ->
    #{id => 10009, name => lang:get("追命连环"), lev => 44,
      role_lev_limit => 104, classes => 1, learn_cost => [],
      up_cost => [{90055, 170560}], dayly_sq_exp => 11600,
      is_down => 1, is_break => 1};
get_skill_unique({10009, 45}) ->
    #{id => 10009, name => lang:get("追命连环"), lev => 45,
      role_lev_limit => 105, classes => 1, learn_cost => [],
      up_cost => [{23824, 50}], dayly_sq_exp => 12000,
      is_down => 0, is_break => 0};
get_skill_unique({10009, 46}) ->
    #{id => 10009, name => lang:get("追命连环"), lev => 46,
      role_lev_limit => 106, classes => 1, learn_cost => [],
      up_cost => [{90055, 182320}], dayly_sq_exp => 12400,
      is_down => 1, is_break => 0};
get_skill_unique({10009, 47}) ->
    #{id => 10009, name => lang:get("追命连环"), lev => 47,
      role_lev_limit => 107, classes => 1, learn_cost => [],
      up_cost => [{90055, 188320}], dayly_sq_exp => 12800,
      is_down => 1, is_break => 0};
get_skill_unique({10009, 48}) ->
    #{id => 10009, name => lang:get("追命连环"), lev => 48,
      role_lev_limit => 108, classes => 1, learn_cost => [],
      up_cost => [{90055, 194400}], dayly_sq_exp => 13200,
      is_down => 1, is_break => 0};
get_skill_unique({10009, 49}) ->
    #{id => 10009, name => lang:get("追命连环"), lev => 49,
      role_lev_limit => 109, classes => 1, learn_cost => [],
      up_cost => [{90055, 200560}], dayly_sq_exp => 13600,
      is_down => 1, is_break => 0};
get_skill_unique({10009, 50}) ->
    #{id => 10009, name => lang:get("追命连环"), lev => 50,
      role_lev_limit => 110, classes => 1, learn_cost => [],
      up_cost => [{90055, 206800}], dayly_sq_exp => 14000,
      is_down => 1, is_break => 0};
get_skill_unique({10009, 51}) ->
    #{id => 10009, name => lang:get("追命连环"), lev => 51,
      role_lev_limit => 111, classes => 1, learn_cost => [],
      up_cost => [{90055, 213120}], dayly_sq_exp => 15200,
      is_down => 1, is_break => 0};
get_skill_unique({10009, 52}) ->
    #{id => 10009, name => lang:get("追命连环"), lev => 52,
      role_lev_limit => 112, classes => 1, learn_cost => [],
      up_cost => [{90055, 219520}], dayly_sq_exp => 16400,
      is_down => 1, is_break => 0};
get_skill_unique({10009, 53}) ->
    #{id => 10009, name => lang:get("追命连环"), lev => 53,
      role_lev_limit => 113, classes => 1, learn_cost => [],
      up_cost => [{90055, 226000}], dayly_sq_exp => 17600,
      is_down => 1, is_break => 0};
get_skill_unique({10009, 54}) ->
    #{id => 10009, name => lang:get("追命连环"), lev => 54,
      role_lev_limit => 114, classes => 1, learn_cost => [],
      up_cost => [{90055, 237120}], dayly_sq_exp => 18800,
      is_down => 1, is_break => 1};
get_skill_unique({10009, 55}) ->
    #{id => 10009, name => lang:get("追命连环"), lev => 55,
      role_lev_limit => 115, classes => 1, learn_cost => [],
      up_cost => [{23824, 80}], dayly_sq_exp => 20000,
      is_down => 0, is_break => 0};
get_skill_unique({10009, 56}) ->
    #{id => 10009, name => lang:get("追命连环"), lev => 56,
      role_lev_limit => 116, classes => 1, learn_cost => [],
      up_cost => [{90055, 259840}], dayly_sq_exp => 20400,
      is_down => 1, is_break => 0};
get_skill_unique({10009, 57}) ->
    #{id => 10009, name => lang:get("追命连环"), lev => 57,
      role_lev_limit => 117, classes => 1, learn_cost => [],
      up_cost => [{90055, 271440}], dayly_sq_exp => 20800,
      is_down => 1, is_break => 0};
get_skill_unique({10009, 58}) ->
    #{id => 10009, name => lang:get("追命连环"), lev => 58,
      role_lev_limit => 118, classes => 1, learn_cost => [],
      up_cost => [{90055, 283200}], dayly_sq_exp => 21200,
      is_down => 1, is_break => 0};
get_skill_unique({10009, 59}) ->
    #{id => 10009, name => lang:get("追命连环"), lev => 59,
      role_lev_limit => 119, classes => 1, learn_cost => [],
      up_cost => [{90055, 295120}], dayly_sq_exp => 21600,
      is_down => 1, is_break => 0};
get_skill_unique({10009, 60}) ->
    #{id => 10009, name => lang:get("追命连环"), lev => 60,
      role_lev_limit => 120, classes => 1, learn_cost => [],
      up_cost => [{90055, 307200}], dayly_sq_exp => 22000,
      is_down => 1, is_break => 0};
get_skill_unique({10009, 61}) ->
    #{id => 10009, name => lang:get("追命连环"), lev => 61,
      role_lev_limit => 121, classes => 1, learn_cost => [],
      up_cost => [{90055, 304640}], dayly_sq_exp => 22080,
      is_down => 1, is_break => 0};
get_skill_unique({10009, 62}) ->
    #{id => 10009, name => lang:get("追命连环"), lev => 62,
      role_lev_limit => 122, classes => 1, learn_cost => [],
      up_cost => [{90055, 326400}], dayly_sq_exp => 22160,
      is_down => 1, is_break => 0};
get_skill_unique({10009, 63}) ->
    #{id => 10009, name => lang:get("追命连环"), lev => 63,
      role_lev_limit => 123, classes => 1, learn_cost => [],
      up_cost => [{90055, 348480}], dayly_sq_exp => 22240,
      is_down => 1, is_break => 0};
get_skill_unique({10009, 64}) ->
    #{id => 10009, name => lang:get("追命连环"), lev => 64,
      role_lev_limit => 124, classes => 1, learn_cost => [],
      up_cost => [{90055, 370880}], dayly_sq_exp => 22320,
      is_down => 1, is_break => 1};
get_skill_unique({10009, 65}) ->
    #{id => 10009, name => lang:get("追命连环"), lev => 65,
      role_lev_limit => 125, classes => 1, learn_cost => [],
      up_cost => [{23824, 120}], dayly_sq_exp => 22400,
      is_down => 0, is_break => 0};
get_skill_unique({10009, 66}) ->
    #{id => 10009, name => lang:get("追命连环"), lev => 66,
      role_lev_limit => 126, classes => 1, learn_cost => [],
      up_cost => [{90055, 416640}], dayly_sq_exp => 22520,
      is_down => 1, is_break => 0};
get_skill_unique({10009, 67}) ->
    #{id => 10009, name => lang:get("追命连环"), lev => 67,
      role_lev_limit => 127, classes => 1, learn_cost => [],
      up_cost => [{90055, 440000}], dayly_sq_exp => 22640,
      is_down => 1, is_break => 0};
get_skill_unique({10009, 68}) ->
    #{id => 10009, name => lang:get("追命连环"), lev => 68,
      role_lev_limit => 128, classes => 1, learn_cost => [],
      up_cost => [{90055, 463680}], dayly_sq_exp => 22760,
      is_down => 1, is_break => 0};
get_skill_unique({10009, 69}) ->
    #{id => 10009, name => lang:get("追命连环"), lev => 69,
      role_lev_limit => 129, classes => 1, learn_cost => [],
      up_cost => [{90055, 487680}], dayly_sq_exp => 22880,
      is_down => 1, is_break => 0};
get_skill_unique({10009, 70}) ->
    #{id => 10009, name => lang:get("追命连环"), lev => 70,
      role_lev_limit => 130, classes => 1, learn_cost => [],
      up_cost => [{90055, 512000}], dayly_sq_exp => 23000,
      is_down => 1, is_break => 0};
get_skill_unique({20009, 1}) ->
    #{id => 20009, name => lang:get("元素精灵"), lev => 1,
      role_lev_limit => 90, classes => 2,
      learn_cost => [{23825, 10}], up_cost => [],
      dayly_sq_exp => 0, is_down => 1, is_break => 0};
get_skill_unique({20009, 2}) ->
    #{id => 20009, name => lang:get("元素精灵"), lev => 2,
      role_lev_limit => 90, classes => 2, learn_cost => [],
      up_cost => [{90055, 9360}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({20009, 3}) ->
    #{id => 20009, name => lang:get("元素精灵"), lev => 3,
      role_lev_limit => 90, classes => 2, learn_cost => [],
      up_cost => [{90055, 10800}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({20009, 4}) ->
    #{id => 20009, name => lang:get("元素精灵"), lev => 4,
      role_lev_limit => 90, classes => 2, learn_cost => [],
      up_cost => [{90055, 12240}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({20009, 5}) ->
    #{id => 20009, name => lang:get("元素精灵"), lev => 5,
      role_lev_limit => 90, classes => 2, learn_cost => [],
      up_cost => [{90055, 13680}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({20009, 6}) ->
    #{id => 20009, name => lang:get("元素精灵"), lev => 6,
      role_lev_limit => 90, classes => 2, learn_cost => [],
      up_cost => [{90055, 15120}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({20009, 7}) ->
    #{id => 20009, name => lang:get("元素精灵"), lev => 7,
      role_lev_limit => 90, classes => 2, learn_cost => [],
      up_cost => [{90055, 16560}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({20009, 8}) ->
    #{id => 20009, name => lang:get("元素精灵"), lev => 8,
      role_lev_limit => 90, classes => 2, learn_cost => [],
      up_cost => [{90055, 18000}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({20009, 9}) ->
    #{id => 20009, name => lang:get("元素精灵"), lev => 9,
      role_lev_limit => 90, classes => 2, learn_cost => [],
      up_cost => [{90055, 21600}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({20009, 10}) ->
    #{id => 20009, name => lang:get("元素精灵"), lev => 10,
      role_lev_limit => 90, classes => 2, learn_cost => [],
      up_cost => [{90055, 25200}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({20009, 11}) ->
    #{id => 20009, name => lang:get("元素精灵"), lev => 11,
      role_lev_limit => 90, classes => 2, learn_cost => [],
      up_cost => [{90055, 28800}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({20009, 12}) ->
    #{id => 20009, name => lang:get("元素精灵"), lev => 12,
      role_lev_limit => 90, classes => 2, learn_cost => [],
      up_cost => [{90055, 32400}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({20009, 13}) ->
    #{id => 20009, name => lang:get("元素精灵"), lev => 13,
      role_lev_limit => 90, classes => 2, learn_cost => [],
      up_cost => [{90055, 36000}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({20009, 14}) ->
    #{id => 20009, name => lang:get("元素精灵"), lev => 14,
      role_lev_limit => 90, classes => 2, learn_cost => [],
      up_cost => [{90055, 39600}], dayly_sq_exp => 0,
      is_down => 1, is_break => 1};
get_skill_unique({20009, 15}) ->
    #{id => 20009, name => lang:get("元素精灵"), lev => 15,
      role_lev_limit => 90, classes => 2, learn_cost => [],
      up_cost => [{23825, 10}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({20009, 16}) ->
    #{id => 20009, name => lang:get("元素精灵"), lev => 16,
      role_lev_limit => 90, classes => 2, learn_cost => [],
      up_cost => [{90055, 46800}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({20009, 17}) ->
    #{id => 20009, name => lang:get("元素精灵"), lev => 17,
      role_lev_limit => 90, classes => 2, learn_cost => [],
      up_cost => [{90055, 50400}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({20009, 18}) ->
    #{id => 20009, name => lang:get("元素精灵"), lev => 18,
      role_lev_limit => 90, classes => 2, learn_cost => [],
      up_cost => [{90055, 54000}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({20009, 19}) ->
    #{id => 20009, name => lang:get("元素精灵"), lev => 19,
      role_lev_limit => 90, classes => 2, learn_cost => [],
      up_cost => [{90055, 57600}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({20009, 20}) ->
    #{id => 20009, name => lang:get("元素精灵"), lev => 20,
      role_lev_limit => 90, classes => 2, learn_cost => [],
      up_cost => [{90055, 61200}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({20009, 21}) ->
    #{id => 20009, name => lang:get("元素精灵"), lev => 21,
      role_lev_limit => 90, classes => 2, learn_cost => [],
      up_cost => [{90055, 64800}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({20009, 22}) ->
    #{id => 20009, name => lang:get("元素精灵"), lev => 22,
      role_lev_limit => 90, classes => 2, learn_cost => [],
      up_cost => [{90055, 68400}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({20009, 23}) ->
    #{id => 20009, name => lang:get("元素精灵"), lev => 23,
      role_lev_limit => 90, classes => 2, learn_cost => [],
      up_cost => [{90055, 72000}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({20009, 24}) ->
    #{id => 20009, name => lang:get("元素精灵"), lev => 24,
      role_lev_limit => 90, classes => 2, learn_cost => [],
      up_cost => [{90055, 75600}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({20009, 25}) ->
    #{id => 20009, name => lang:get("元素精灵"), lev => 25,
      role_lev_limit => 90, classes => 2, learn_cost => [],
      up_cost => [{90055, 79200}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({20009, 26}) ->
    #{id => 20009, name => lang:get("元素精灵"), lev => 26,
      role_lev_limit => 90, classes => 2, learn_cost => [],
      up_cost => [{90055, 82800}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({20009, 27}) ->
    #{id => 20009, name => lang:get("元素精灵"), lev => 27,
      role_lev_limit => 90, classes => 2, learn_cost => [],
      up_cost => [{90055, 86400}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({20009, 28}) ->
    #{id => 20009, name => lang:get("元素精灵"), lev => 28,
      role_lev_limit => 90, classes => 2, learn_cost => [],
      up_cost => [{90055, 90000}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({20009, 29}) ->
    #{id => 20009, name => lang:get("元素精灵"), lev => 29,
      role_lev_limit => 90, classes => 2, learn_cost => [],
      up_cost => [{90055, 93600}], dayly_sq_exp => 0,
      is_down => 1, is_break => 1};
get_skill_unique({20009, 30}) ->
    #{id => 20009, name => lang:get("元素精灵"), lev => 30,
      role_lev_limit => 90, classes => 2, learn_cost => [],
      up_cost => [{23825, 30}], dayly_sq_exp => 6000,
      is_down => 0, is_break => 0};
get_skill_unique({20009, 31}) ->
    #{id => 20009, name => lang:get("元素精灵"), lev => 31,
      role_lev_limit => 91, classes => 2, learn_cost => [],
      up_cost => [{90055, 101920}], dayly_sq_exp => 6000,
      is_down => 1, is_break => 0};
get_skill_unique({20009, 32}) ->
    #{id => 20009, name => lang:get("元素精灵"), lev => 32,
      role_lev_limit => 92, classes => 2, learn_cost => [],
      up_cost => [{90055, 106720}], dayly_sq_exp => 6000,
      is_down => 1, is_break => 0};
get_skill_unique({20009, 33}) ->
    #{id => 20009, name => lang:get("元素精灵"), lev => 33,
      role_lev_limit => 93, classes => 2, learn_cost => [],
      up_cost => [{90055, 111600}], dayly_sq_exp => 6000,
      is_down => 1, is_break => 0};
get_skill_unique({20009, 34}) ->
    #{id => 20009, name => lang:get("元素精灵"), lev => 34,
      role_lev_limit => 94, classes => 2, learn_cost => [],
      up_cost => [{90055, 116560}], dayly_sq_exp => 6000,
      is_down => 1, is_break => 0};
get_skill_unique({20009, 35}) ->
    #{id => 20009, name => lang:get("元素精灵"), lev => 35,
      role_lev_limit => 95, classes => 2, learn_cost => [],
      up_cost => [{90055, 121600}], dayly_sq_exp => 8000,
      is_down => 1, is_break => 0};
get_skill_unique({20009, 36}) ->
    #{id => 20009, name => lang:get("元素精灵"), lev => 36,
      role_lev_limit => 96, classes => 2, learn_cost => [],
      up_cost => [{90055, 126720}], dayly_sq_exp => 8000,
      is_down => 1, is_break => 0};
get_skill_unique({20009, 37}) ->
    #{id => 20009, name => lang:get("元素精灵"), lev => 37,
      role_lev_limit => 97, classes => 2, learn_cost => [],
      up_cost => [{90055, 131920}], dayly_sq_exp => 8000,
      is_down => 1, is_break => 0};
get_skill_unique({20009, 38}) ->
    #{id => 20009, name => lang:get("元素精灵"), lev => 38,
      role_lev_limit => 98, classes => 2, learn_cost => [],
      up_cost => [{90055, 137200}], dayly_sq_exp => 8000,
      is_down => 1, is_break => 0};
get_skill_unique({20009, 39}) ->
    #{id => 20009, name => lang:get("元素精灵"), lev => 39,
      role_lev_limit => 99, classes => 2, learn_cost => [],
      up_cost => [{90055, 142560}], dayly_sq_exp => 8000,
      is_down => 1, is_break => 0};
get_skill_unique({20009, 40}) ->
    #{id => 20009, name => lang:get("元素精灵"), lev => 40,
      role_lev_limit => 100, classes => 2, learn_cost => [],
      up_cost => [{90055, 148000}], dayly_sq_exp => 10000,
      is_down => 1, is_break => 0};
get_skill_unique({20009, 41}) ->
    #{id => 20009, name => lang:get("元素精灵"), lev => 41,
      role_lev_limit => 101, classes => 2, learn_cost => [],
      up_cost => [{90055, 153520}], dayly_sq_exp => 10100,
      is_down => 1, is_break => 0};
get_skill_unique({20009, 42}) ->
    #{id => 20009, name => lang:get("元素精灵"), lev => 42,
      role_lev_limit => 102, classes => 2, learn_cost => [],
      up_cost => [{90055, 159120}], dayly_sq_exp => 10200,
      is_down => 1, is_break => 0};
get_skill_unique({20009, 43}) ->
    #{id => 20009, name => lang:get("元素精灵"), lev => 43,
      role_lev_limit => 103, classes => 2, learn_cost => [],
      up_cost => [{90055, 164800}], dayly_sq_exp => 10300,
      is_down => 1, is_break => 0};
get_skill_unique({20009, 44}) ->
    #{id => 20009, name => lang:get("元素精灵"), lev => 44,
      role_lev_limit => 104, classes => 2, learn_cost => [],
      up_cost => [{90055, 170560}], dayly_sq_exp => 10400,
      is_down => 1, is_break => 1};
get_skill_unique({20009, 45}) ->
    #{id => 20009, name => lang:get("元素精灵"), lev => 45,
      role_lev_limit => 105, classes => 2, learn_cost => [],
      up_cost => [{23825, 50}], dayly_sq_exp => 12600,
      is_down => 0, is_break => 0};
get_skill_unique({20009, 46}) ->
    #{id => 20009, name => lang:get("元素精灵"), lev => 46,
      role_lev_limit => 106, classes => 2, learn_cost => [],
      up_cost => [{90055, 182320}], dayly_sq_exp => 12720,
      is_down => 1, is_break => 0};
get_skill_unique({20009, 47}) ->
    #{id => 20009, name => lang:get("元素精灵"), lev => 47,
      role_lev_limit => 107, classes => 2, learn_cost => [],
      up_cost => [{90055, 188320}], dayly_sq_exp => 12840,
      is_down => 1, is_break => 0};
get_skill_unique({20009, 48}) ->
    #{id => 20009, name => lang:get("元素精灵"), lev => 48,
      role_lev_limit => 108, classes => 2, learn_cost => [],
      up_cost => [{90055, 194400}], dayly_sq_exp => 12960,
      is_down => 1, is_break => 0};
get_skill_unique({20009, 49}) ->
    #{id => 20009, name => lang:get("元素精灵"), lev => 49,
      role_lev_limit => 109, classes => 2, learn_cost => [],
      up_cost => [{90055, 200560}], dayly_sq_exp => 13080,
      is_down => 1, is_break => 0};
get_skill_unique({20009, 50}) ->
    #{id => 20009, name => lang:get("元素精灵"), lev => 50,
      role_lev_limit => 110, classes => 2, learn_cost => [],
      up_cost => [{90055, 206800}], dayly_sq_exp => 15400,
      is_down => 1, is_break => 0};
get_skill_unique({20009, 51}) ->
    #{id => 20009, name => lang:get("元素精灵"), lev => 51,
      role_lev_limit => 111, classes => 2, learn_cost => [],
      up_cost => [{90055, 213120}], dayly_sq_exp => 15540,
      is_down => 1, is_break => 0};
get_skill_unique({20009, 52}) ->
    #{id => 20009, name => lang:get("元素精灵"), lev => 52,
      role_lev_limit => 112, classes => 2, learn_cost => [],
      up_cost => [{90055, 219520}], dayly_sq_exp => 15680,
      is_down => 1, is_break => 0};
get_skill_unique({20009, 53}) ->
    #{id => 20009, name => lang:get("元素精灵"), lev => 53,
      role_lev_limit => 113, classes => 2, learn_cost => [],
      up_cost => [{90055, 226000}], dayly_sq_exp => 15820,
      is_down => 1, is_break => 0};
get_skill_unique({20009, 54}) ->
    #{id => 20009, name => lang:get("元素精灵"), lev => 54,
      role_lev_limit => 114, classes => 2, learn_cost => [],
      up_cost => [{90055, 237120}], dayly_sq_exp => 15960,
      is_down => 1, is_break => 1};
get_skill_unique({20009, 55}) ->
    #{id => 20009, name => lang:get("元素精灵"), lev => 55,
      role_lev_limit => 115, classes => 2, learn_cost => [],
      up_cost => [{23825, 80}], dayly_sq_exp => 23000,
      is_down => 0, is_break => 0};
get_skill_unique({20009, 56}) ->
    #{id => 20009, name => lang:get("元素精灵"), lev => 56,
      role_lev_limit => 116, classes => 2, learn_cost => [],
      up_cost => [{90055, 259840}], dayly_sq_exp => 23200,
      is_down => 1, is_break => 0};
get_skill_unique({20009, 57}) ->
    #{id => 20009, name => lang:get("元素精灵"), lev => 57,
      role_lev_limit => 117, classes => 2, learn_cost => [],
      up_cost => [{90055, 271440}], dayly_sq_exp => 23400,
      is_down => 1, is_break => 0};
get_skill_unique({20009, 58}) ->
    #{id => 20009, name => lang:get("元素精灵"), lev => 58,
      role_lev_limit => 118, classes => 2, learn_cost => [],
      up_cost => [{90055, 283200}], dayly_sq_exp => 23600,
      is_down => 1, is_break => 0};
get_skill_unique({20009, 59}) ->
    #{id => 20009, name => lang:get("元素精灵"), lev => 59,
      role_lev_limit => 119, classes => 2, learn_cost => [],
      up_cost => [{90055, 295120}], dayly_sq_exp => 23800,
      is_down => 1, is_break => 0};
get_skill_unique({20009, 60}) ->
    #{id => 20009, name => lang:get("元素精灵"), lev => 60,
      role_lev_limit => 120, classes => 2, learn_cost => [],
      up_cost => [{90055, 307200}], dayly_sq_exp => 24000,
      is_down => 1, is_break => 0};
get_skill_unique({20009, 61}) ->
    #{id => 20009, name => lang:get("元素精灵"), lev => 61,
      role_lev_limit => 121, classes => 2, learn_cost => [],
      up_cost => [{90055, 304640}], dayly_sq_exp => 22080,
      is_down => 1, is_break => 0};
get_skill_unique({20009, 62}) ->
    #{id => 20009, name => lang:get("元素精灵"), lev => 62,
      role_lev_limit => 122, classes => 2, learn_cost => [],
      up_cost => [{90055, 326400}], dayly_sq_exp => 22160,
      is_down => 1, is_break => 0};
get_skill_unique({20009, 63}) ->
    #{id => 20009, name => lang:get("元素精灵"), lev => 63,
      role_lev_limit => 123, classes => 2, learn_cost => [],
      up_cost => [{90055, 348480}], dayly_sq_exp => 22240,
      is_down => 1, is_break => 0};
get_skill_unique({20009, 64}) ->
    #{id => 20009, name => lang:get("元素精灵"), lev => 64,
      role_lev_limit => 124, classes => 2, learn_cost => [],
      up_cost => [{90055, 370880}], dayly_sq_exp => 22320,
      is_down => 1, is_break => 1};
get_skill_unique({20009, 65}) ->
    #{id => 20009, name => lang:get("元素精灵"), lev => 65,
      role_lev_limit => 125, classes => 2, learn_cost => [],
      up_cost => [{23825, 120}], dayly_sq_exp => 22400,
      is_down => 0, is_break => 0};
get_skill_unique({20009, 66}) ->
    #{id => 20009, name => lang:get("元素精灵"), lev => 66,
      role_lev_limit => 126, classes => 2, learn_cost => [],
      up_cost => [{90055, 416640}], dayly_sq_exp => 22520,
      is_down => 1, is_break => 0};
get_skill_unique({20009, 67}) ->
    #{id => 20009, name => lang:get("元素精灵"), lev => 67,
      role_lev_limit => 127, classes => 2, learn_cost => [],
      up_cost => [{90055, 440000}], dayly_sq_exp => 22640,
      is_down => 1, is_break => 0};
get_skill_unique({20009, 68}) ->
    #{id => 20009, name => lang:get("元素精灵"), lev => 68,
      role_lev_limit => 128, classes => 2, learn_cost => [],
      up_cost => [{90055, 463680}], dayly_sq_exp => 22760,
      is_down => 1, is_break => 0};
get_skill_unique({20009, 69}) ->
    #{id => 20009, name => lang:get("元素精灵"), lev => 69,
      role_lev_limit => 129, classes => 2, learn_cost => [],
      up_cost => [{90055, 487680}], dayly_sq_exp => 22880,
      is_down => 1, is_break => 0};
get_skill_unique({20009, 70}) ->
    #{id => 20009, name => lang:get("元素精灵"), lev => 70,
      role_lev_limit => 130, classes => 2, learn_cost => [],
      up_cost => [{90055, 512000}], dayly_sq_exp => 23000,
      is_down => 1, is_break => 0};
get_skill_unique({30009, 1}) ->
    #{id => 30009, name => lang:get("漫天箭雨"), lev => 1,
      role_lev_limit => 90, classes => 3,
      learn_cost => [{23826, 10}], up_cost => [],
      dayly_sq_exp => 0, is_down => 1, is_break => 0};
get_skill_unique({30009, 2}) ->
    #{id => 30009, name => lang:get("漫天箭雨"), lev => 2,
      role_lev_limit => 90, classes => 3, learn_cost => [],
      up_cost => [{90055, 9360}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({30009, 3}) ->
    #{id => 30009, name => lang:get("漫天箭雨"), lev => 3,
      role_lev_limit => 90, classes => 3, learn_cost => [],
      up_cost => [{90055, 10800}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({30009, 4}) ->
    #{id => 30009, name => lang:get("漫天箭雨"), lev => 4,
      role_lev_limit => 90, classes => 3, learn_cost => [],
      up_cost => [{90055, 12240}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({30009, 5}) ->
    #{id => 30009, name => lang:get("漫天箭雨"), lev => 5,
      role_lev_limit => 90, classes => 3, learn_cost => [],
      up_cost => [{90055, 13680}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({30009, 6}) ->
    #{id => 30009, name => lang:get("漫天箭雨"), lev => 6,
      role_lev_limit => 90, classes => 3, learn_cost => [],
      up_cost => [{90055, 15120}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({30009, 7}) ->
    #{id => 30009, name => lang:get("漫天箭雨"), lev => 7,
      role_lev_limit => 90, classes => 3, learn_cost => [],
      up_cost => [{90055, 16560}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({30009, 8}) ->
    #{id => 30009, name => lang:get("漫天箭雨"), lev => 8,
      role_lev_limit => 90, classes => 3, learn_cost => [],
      up_cost => [{90055, 18000}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({30009, 9}) ->
    #{id => 30009, name => lang:get("漫天箭雨"), lev => 9,
      role_lev_limit => 90, classes => 3, learn_cost => [],
      up_cost => [{90055, 21600}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({30009, 10}) ->
    #{id => 30009, name => lang:get("漫天箭雨"), lev => 10,
      role_lev_limit => 90, classes => 3, learn_cost => [],
      up_cost => [{90055, 25200}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({30009, 11}) ->
    #{id => 30009, name => lang:get("漫天箭雨"), lev => 11,
      role_lev_limit => 90, classes => 3, learn_cost => [],
      up_cost => [{90055, 28800}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({30009, 12}) ->
    #{id => 30009, name => lang:get("漫天箭雨"), lev => 12,
      role_lev_limit => 90, classes => 3, learn_cost => [],
      up_cost => [{90055, 32400}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({30009, 13}) ->
    #{id => 30009, name => lang:get("漫天箭雨"), lev => 13,
      role_lev_limit => 90, classes => 3, learn_cost => [],
      up_cost => [{90055, 36000}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({30009, 14}) ->
    #{id => 30009, name => lang:get("漫天箭雨"), lev => 14,
      role_lev_limit => 90, classes => 3, learn_cost => [],
      up_cost => [{90055, 39600}], dayly_sq_exp => 0,
      is_down => 1, is_break => 1};
get_skill_unique({30009, 15}) ->
    #{id => 30009, name => lang:get("漫天箭雨"), lev => 15,
      role_lev_limit => 90, classes => 3, learn_cost => [],
      up_cost => [{23826, 10}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({30009, 16}) ->
    #{id => 30009, name => lang:get("漫天箭雨"), lev => 16,
      role_lev_limit => 90, classes => 3, learn_cost => [],
      up_cost => [{90055, 46800}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({30009, 17}) ->
    #{id => 30009, name => lang:get("漫天箭雨"), lev => 17,
      role_lev_limit => 90, classes => 3, learn_cost => [],
      up_cost => [{90055, 50400}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({30009, 18}) ->
    #{id => 30009, name => lang:get("漫天箭雨"), lev => 18,
      role_lev_limit => 90, classes => 3, learn_cost => [],
      up_cost => [{90055, 54000}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({30009, 19}) ->
    #{id => 30009, name => lang:get("漫天箭雨"), lev => 19,
      role_lev_limit => 90, classes => 3, learn_cost => [],
      up_cost => [{90055, 57600}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({30009, 20}) ->
    #{id => 30009, name => lang:get("漫天箭雨"), lev => 20,
      role_lev_limit => 90, classes => 3, learn_cost => [],
      up_cost => [{90055, 61200}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({30009, 21}) ->
    #{id => 30009, name => lang:get("漫天箭雨"), lev => 21,
      role_lev_limit => 90, classes => 3, learn_cost => [],
      up_cost => [{90055, 64800}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({30009, 22}) ->
    #{id => 30009, name => lang:get("漫天箭雨"), lev => 22,
      role_lev_limit => 90, classes => 3, learn_cost => [],
      up_cost => [{90055, 68400}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({30009, 23}) ->
    #{id => 30009, name => lang:get("漫天箭雨"), lev => 23,
      role_lev_limit => 90, classes => 3, learn_cost => [],
      up_cost => [{90055, 72000}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({30009, 24}) ->
    #{id => 30009, name => lang:get("漫天箭雨"), lev => 24,
      role_lev_limit => 90, classes => 3, learn_cost => [],
      up_cost => [{90055, 75600}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({30009, 25}) ->
    #{id => 30009, name => lang:get("漫天箭雨"), lev => 25,
      role_lev_limit => 90, classes => 3, learn_cost => [],
      up_cost => [{90055, 79200}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({30009, 26}) ->
    #{id => 30009, name => lang:get("漫天箭雨"), lev => 26,
      role_lev_limit => 90, classes => 3, learn_cost => [],
      up_cost => [{90055, 82800}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({30009, 27}) ->
    #{id => 30009, name => lang:get("漫天箭雨"), lev => 27,
      role_lev_limit => 90, classes => 3, learn_cost => [],
      up_cost => [{90055, 86400}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({30009, 28}) ->
    #{id => 30009, name => lang:get("漫天箭雨"), lev => 28,
      role_lev_limit => 90, classes => 3, learn_cost => [],
      up_cost => [{90055, 90000}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({30009, 29}) ->
    #{id => 30009, name => lang:get("漫天箭雨"), lev => 29,
      role_lev_limit => 90, classes => 3, learn_cost => [],
      up_cost => [{90055, 93600}], dayly_sq_exp => 0,
      is_down => 1, is_break => 1};
get_skill_unique({30009, 30}) ->
    #{id => 30009, name => lang:get("漫天箭雨"), lev => 30,
      role_lev_limit => 90, classes => 3, learn_cost => [],
      up_cost => [{23826, 30}], dayly_sq_exp => 6000,
      is_down => 0, is_break => 0};
get_skill_unique({30009, 31}) ->
    #{id => 30009, name => lang:get("漫天箭雨"), lev => 31,
      role_lev_limit => 91, classes => 3, learn_cost => [],
      up_cost => [{90055, 101920}], dayly_sq_exp => 6000,
      is_down => 1, is_break => 0};
get_skill_unique({30009, 32}) ->
    #{id => 30009, name => lang:get("漫天箭雨"), lev => 32,
      role_lev_limit => 92, classes => 3, learn_cost => [],
      up_cost => [{90055, 106720}], dayly_sq_exp => 6000,
      is_down => 1, is_break => 0};
get_skill_unique({30009, 33}) ->
    #{id => 30009, name => lang:get("漫天箭雨"), lev => 33,
      role_lev_limit => 93, classes => 3, learn_cost => [],
      up_cost => [{90055, 111600}], dayly_sq_exp => 6000,
      is_down => 1, is_break => 0};
get_skill_unique({30009, 34}) ->
    #{id => 30009, name => lang:get("漫天箭雨"), lev => 34,
      role_lev_limit => 94, classes => 3, learn_cost => [],
      up_cost => [{90055, 116560}], dayly_sq_exp => 6000,
      is_down => 1, is_break => 0};
get_skill_unique({30009, 35}) ->
    #{id => 30009, name => lang:get("漫天箭雨"), lev => 35,
      role_lev_limit => 95, classes => 3, learn_cost => [],
      up_cost => [{90055, 121600}], dayly_sq_exp => 8000,
      is_down => 1, is_break => 0};
get_skill_unique({30009, 36}) ->
    #{id => 30009, name => lang:get("漫天箭雨"), lev => 36,
      role_lev_limit => 96, classes => 3, learn_cost => [],
      up_cost => [{90055, 126720}], dayly_sq_exp => 8000,
      is_down => 1, is_break => 0};
get_skill_unique({30009, 37}) ->
    #{id => 30009, name => lang:get("漫天箭雨"), lev => 37,
      role_lev_limit => 97, classes => 3, learn_cost => [],
      up_cost => [{90055, 131920}], dayly_sq_exp => 8000,
      is_down => 1, is_break => 0};
get_skill_unique({30009, 38}) ->
    #{id => 30009, name => lang:get("漫天箭雨"), lev => 38,
      role_lev_limit => 98, classes => 3, learn_cost => [],
      up_cost => [{90055, 137200}], dayly_sq_exp => 8000,
      is_down => 1, is_break => 0};
get_skill_unique({30009, 39}) ->
    #{id => 30009, name => lang:get("漫天箭雨"), lev => 39,
      role_lev_limit => 99, classes => 3, learn_cost => [],
      up_cost => [{90055, 142560}], dayly_sq_exp => 8000,
      is_down => 1, is_break => 0};
get_skill_unique({30009, 40}) ->
    #{id => 30009, name => lang:get("漫天箭雨"), lev => 40,
      role_lev_limit => 100, classes => 3, learn_cost => [],
      up_cost => [{90055, 148000}], dayly_sq_exp => 10000,
      is_down => 1, is_break => 0};
get_skill_unique({30009, 41}) ->
    #{id => 30009, name => lang:get("漫天箭雨"), lev => 41,
      role_lev_limit => 101, classes => 3, learn_cost => [],
      up_cost => [{90055, 153520}], dayly_sq_exp => 10100,
      is_down => 1, is_break => 0};
get_skill_unique({30009, 42}) ->
    #{id => 30009, name => lang:get("漫天箭雨"), lev => 42,
      role_lev_limit => 102, classes => 3, learn_cost => [],
      up_cost => [{90055, 159120}], dayly_sq_exp => 10200,
      is_down => 1, is_break => 0};
get_skill_unique({30009, 43}) ->
    #{id => 30009, name => lang:get("漫天箭雨"), lev => 43,
      role_lev_limit => 103, classes => 3, learn_cost => [],
      up_cost => [{90055, 164800}], dayly_sq_exp => 10300,
      is_down => 1, is_break => 0};
get_skill_unique({30009, 44}) ->
    #{id => 30009, name => lang:get("漫天箭雨"), lev => 44,
      role_lev_limit => 104, classes => 3, learn_cost => [],
      up_cost => [{90055, 170560}], dayly_sq_exp => 10400,
      is_down => 1, is_break => 1};
get_skill_unique({30009, 45}) ->
    #{id => 30009, name => lang:get("漫天箭雨"), lev => 45,
      role_lev_limit => 105, classes => 3, learn_cost => [],
      up_cost => [{23826, 50}], dayly_sq_exp => 12600,
      is_down => 0, is_break => 0};
get_skill_unique({30009, 46}) ->
    #{id => 30009, name => lang:get("漫天箭雨"), lev => 46,
      role_lev_limit => 106, classes => 3, learn_cost => [],
      up_cost => [{90055, 182320}], dayly_sq_exp => 12720,
      is_down => 1, is_break => 0};
get_skill_unique({30009, 47}) ->
    #{id => 30009, name => lang:get("漫天箭雨"), lev => 47,
      role_lev_limit => 107, classes => 3, learn_cost => [],
      up_cost => [{90055, 188320}], dayly_sq_exp => 12840,
      is_down => 1, is_break => 0};
get_skill_unique({30009, 48}) ->
    #{id => 30009, name => lang:get("漫天箭雨"), lev => 48,
      role_lev_limit => 108, classes => 3, learn_cost => [],
      up_cost => [{90055, 194400}], dayly_sq_exp => 12960,
      is_down => 1, is_break => 0};
get_skill_unique({30009, 49}) ->
    #{id => 30009, name => lang:get("漫天箭雨"), lev => 49,
      role_lev_limit => 109, classes => 3, learn_cost => [],
      up_cost => [{90055, 200560}], dayly_sq_exp => 13080,
      is_down => 1, is_break => 0};
get_skill_unique({30009, 50}) ->
    #{id => 30009, name => lang:get("漫天箭雨"), lev => 50,
      role_lev_limit => 110, classes => 3, learn_cost => [],
      up_cost => [{90055, 206800}], dayly_sq_exp => 15400,
      is_down => 1, is_break => 0};
get_skill_unique({30009, 51}) ->
    #{id => 30009, name => lang:get("漫天箭雨"), lev => 51,
      role_lev_limit => 111, classes => 3, learn_cost => [],
      up_cost => [{90055, 213120}], dayly_sq_exp => 15540,
      is_down => 1, is_break => 0};
get_skill_unique({30009, 52}) ->
    #{id => 30009, name => lang:get("漫天箭雨"), lev => 52,
      role_lev_limit => 112, classes => 3, learn_cost => [],
      up_cost => [{90055, 219520}], dayly_sq_exp => 15680,
      is_down => 1, is_break => 0};
get_skill_unique({30009, 53}) ->
    #{id => 30009, name => lang:get("漫天箭雨"), lev => 53,
      role_lev_limit => 113, classes => 3, learn_cost => [],
      up_cost => [{90055, 226000}], dayly_sq_exp => 15820,
      is_down => 1, is_break => 0};
get_skill_unique({30009, 54}) ->
    #{id => 30009, name => lang:get("漫天箭雨"), lev => 54,
      role_lev_limit => 114, classes => 3, learn_cost => [],
      up_cost => [{90055, 237120}], dayly_sq_exp => 15960,
      is_down => 1, is_break => 1};
get_skill_unique({30009, 55}) ->
    #{id => 30009, name => lang:get("漫天箭雨"), lev => 55,
      role_lev_limit => 115, classes => 3, learn_cost => [],
      up_cost => [{23826, 80}], dayly_sq_exp => 23000,
      is_down => 0, is_break => 0};
get_skill_unique({30009, 56}) ->
    #{id => 30009, name => lang:get("漫天箭雨"), lev => 56,
      role_lev_limit => 116, classes => 3, learn_cost => [],
      up_cost => [{90055, 259840}], dayly_sq_exp => 23200,
      is_down => 1, is_break => 0};
get_skill_unique({30009, 57}) ->
    #{id => 30009, name => lang:get("漫天箭雨"), lev => 57,
      role_lev_limit => 117, classes => 3, learn_cost => [],
      up_cost => [{90055, 271440}], dayly_sq_exp => 23400,
      is_down => 1, is_break => 0};
get_skill_unique({30009, 58}) ->
    #{id => 30009, name => lang:get("漫天箭雨"), lev => 58,
      role_lev_limit => 118, classes => 3, learn_cost => [],
      up_cost => [{90055, 283200}], dayly_sq_exp => 23600,
      is_down => 1, is_break => 0};
get_skill_unique({30009, 59}) ->
    #{id => 30009, name => lang:get("漫天箭雨"), lev => 59,
      role_lev_limit => 119, classes => 3, learn_cost => [],
      up_cost => [{90055, 295120}], dayly_sq_exp => 23800,
      is_down => 1, is_break => 0};
get_skill_unique({30009, 60}) ->
    #{id => 30009, name => lang:get("漫天箭雨"), lev => 60,
      role_lev_limit => 120, classes => 3, learn_cost => [],
      up_cost => [{90055, 307200}], dayly_sq_exp => 24000,
      is_down => 1, is_break => 0};
get_skill_unique({30009, 61}) ->
    #{id => 30009, name => lang:get("漫天箭雨"), lev => 61,
      role_lev_limit => 121, classes => 3, learn_cost => [],
      up_cost => [{90055, 304640}], dayly_sq_exp => 22080,
      is_down => 1, is_break => 0};
get_skill_unique({30009, 62}) ->
    #{id => 30009, name => lang:get("漫天箭雨"), lev => 62,
      role_lev_limit => 122, classes => 3, learn_cost => [],
      up_cost => [{90055, 326400}], dayly_sq_exp => 22160,
      is_down => 1, is_break => 0};
get_skill_unique({30009, 63}) ->
    #{id => 30009, name => lang:get("漫天箭雨"), lev => 63,
      role_lev_limit => 123, classes => 3, learn_cost => [],
      up_cost => [{90055, 348480}], dayly_sq_exp => 22240,
      is_down => 1, is_break => 0};
get_skill_unique({30009, 64}) ->
    #{id => 30009, name => lang:get("漫天箭雨"), lev => 64,
      role_lev_limit => 124, classes => 3, learn_cost => [],
      up_cost => [{90055, 370880}], dayly_sq_exp => 22320,
      is_down => 1, is_break => 1};
get_skill_unique({30009, 65}) ->
    #{id => 30009, name => lang:get("漫天箭雨"), lev => 65,
      role_lev_limit => 125, classes => 3, learn_cost => [],
      up_cost => [{23826, 120}], dayly_sq_exp => 22400,
      is_down => 0, is_break => 0};
get_skill_unique({30009, 66}) ->
    #{id => 30009, name => lang:get("漫天箭雨"), lev => 66,
      role_lev_limit => 126, classes => 3, learn_cost => [],
      up_cost => [{90055, 416640}], dayly_sq_exp => 22520,
      is_down => 1, is_break => 0};
get_skill_unique({30009, 67}) ->
    #{id => 30009, name => lang:get("漫天箭雨"), lev => 67,
      role_lev_limit => 127, classes => 3, learn_cost => [],
      up_cost => [{90055, 440000}], dayly_sq_exp => 22640,
      is_down => 1, is_break => 0};
get_skill_unique({30009, 68}) ->
    #{id => 30009, name => lang:get("漫天箭雨"), lev => 68,
      role_lev_limit => 128, classes => 3, learn_cost => [],
      up_cost => [{90055, 463680}], dayly_sq_exp => 22760,
      is_down => 1, is_break => 0};
get_skill_unique({30009, 69}) ->
    #{id => 30009, name => lang:get("漫天箭雨"), lev => 69,
      role_lev_limit => 129, classes => 3, learn_cost => [],
      up_cost => [{90055, 487680}], dayly_sq_exp => 22880,
      is_down => 1, is_break => 0};
get_skill_unique({30009, 70}) ->
    #{id => 30009, name => lang:get("漫天箭雨"), lev => 70,
      role_lev_limit => 130, classes => 3, learn_cost => [],
      up_cost => [{90055, 512000}], dayly_sq_exp => 23000,
      is_down => 1, is_break => 0};
get_skill_unique({40009, 1}) ->
    #{id => 40009, name => lang:get("先祖图腾"), lev => 1,
      role_lev_limit => 90, classes => 4,
      learn_cost => [{23827, 10}], up_cost => [],
      dayly_sq_exp => 0, is_down => 1, is_break => 0};
get_skill_unique({40009, 2}) ->
    #{id => 40009, name => lang:get("先祖图腾"), lev => 2,
      role_lev_limit => 90, classes => 4, learn_cost => [],
      up_cost => [{90055, 9360}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({40009, 3}) ->
    #{id => 40009, name => lang:get("先祖图腾"), lev => 3,
      role_lev_limit => 90, classes => 4, learn_cost => [],
      up_cost => [{90055, 10800}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({40009, 4}) ->
    #{id => 40009, name => lang:get("先祖图腾"), lev => 4,
      role_lev_limit => 90, classes => 4, learn_cost => [],
      up_cost => [{90055, 12240}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({40009, 5}) ->
    #{id => 40009, name => lang:get("先祖图腾"), lev => 5,
      role_lev_limit => 90, classes => 4, learn_cost => [],
      up_cost => [{90055, 13680}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({40009, 6}) ->
    #{id => 40009, name => lang:get("先祖图腾"), lev => 6,
      role_lev_limit => 90, classes => 4, learn_cost => [],
      up_cost => [{90055, 15120}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({40009, 7}) ->
    #{id => 40009, name => lang:get("先祖图腾"), lev => 7,
      role_lev_limit => 90, classes => 4, learn_cost => [],
      up_cost => [{90055, 16560}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({40009, 8}) ->
    #{id => 40009, name => lang:get("先祖图腾"), lev => 8,
      role_lev_limit => 90, classes => 4, learn_cost => [],
      up_cost => [{90055, 18000}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({40009, 9}) ->
    #{id => 40009, name => lang:get("先祖图腾"), lev => 9,
      role_lev_limit => 90, classes => 4, learn_cost => [],
      up_cost => [{90055, 21600}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({40009, 10}) ->
    #{id => 40009, name => lang:get("先祖图腾"), lev => 10,
      role_lev_limit => 90, classes => 4, learn_cost => [],
      up_cost => [{90055, 25200}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({40009, 11}) ->
    #{id => 40009, name => lang:get("先祖图腾"), lev => 11,
      role_lev_limit => 90, classes => 4, learn_cost => [],
      up_cost => [{90055, 28800}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({40009, 12}) ->
    #{id => 40009, name => lang:get("先祖图腾"), lev => 12,
      role_lev_limit => 90, classes => 4, learn_cost => [],
      up_cost => [{90055, 32400}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({40009, 13}) ->
    #{id => 40009, name => lang:get("先祖图腾"), lev => 13,
      role_lev_limit => 90, classes => 4, learn_cost => [],
      up_cost => [{90055, 36000}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({40009, 14}) ->
    #{id => 40009, name => lang:get("先祖图腾"), lev => 14,
      role_lev_limit => 90, classes => 4, learn_cost => [],
      up_cost => [{90055, 39600}], dayly_sq_exp => 0,
      is_down => 1, is_break => 1};
get_skill_unique({40009, 15}) ->
    #{id => 40009, name => lang:get("先祖图腾"), lev => 15,
      role_lev_limit => 90, classes => 4, learn_cost => [],
      up_cost => [{23827, 10}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({40009, 16}) ->
    #{id => 40009, name => lang:get("先祖图腾"), lev => 16,
      role_lev_limit => 90, classes => 4, learn_cost => [],
      up_cost => [{90055, 46800}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({40009, 17}) ->
    #{id => 40009, name => lang:get("先祖图腾"), lev => 17,
      role_lev_limit => 90, classes => 4, learn_cost => [],
      up_cost => [{90055, 50400}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({40009, 18}) ->
    #{id => 40009, name => lang:get("先祖图腾"), lev => 18,
      role_lev_limit => 90, classes => 4, learn_cost => [],
      up_cost => [{90055, 54000}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({40009, 19}) ->
    #{id => 40009, name => lang:get("先祖图腾"), lev => 19,
      role_lev_limit => 90, classes => 4, learn_cost => [],
      up_cost => [{90055, 57600}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({40009, 20}) ->
    #{id => 40009, name => lang:get("先祖图腾"), lev => 20,
      role_lev_limit => 90, classes => 4, learn_cost => [],
      up_cost => [{90055, 61200}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({40009, 21}) ->
    #{id => 40009, name => lang:get("先祖图腾"), lev => 21,
      role_lev_limit => 90, classes => 4, learn_cost => [],
      up_cost => [{90055, 64800}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({40009, 22}) ->
    #{id => 40009, name => lang:get("先祖图腾"), lev => 22,
      role_lev_limit => 90, classes => 4, learn_cost => [],
      up_cost => [{90055, 68400}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({40009, 23}) ->
    #{id => 40009, name => lang:get("先祖图腾"), lev => 23,
      role_lev_limit => 90, classes => 4, learn_cost => [],
      up_cost => [{90055, 72000}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({40009, 24}) ->
    #{id => 40009, name => lang:get("先祖图腾"), lev => 24,
      role_lev_limit => 90, classes => 4, learn_cost => [],
      up_cost => [{90055, 75600}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({40009, 25}) ->
    #{id => 40009, name => lang:get("先祖图腾"), lev => 25,
      role_lev_limit => 90, classes => 4, learn_cost => [],
      up_cost => [{90055, 79200}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({40009, 26}) ->
    #{id => 40009, name => lang:get("先祖图腾"), lev => 26,
      role_lev_limit => 90, classes => 4, learn_cost => [],
      up_cost => [{90055, 82800}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({40009, 27}) ->
    #{id => 40009, name => lang:get("先祖图腾"), lev => 27,
      role_lev_limit => 90, classes => 4, learn_cost => [],
      up_cost => [{90055, 86400}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({40009, 28}) ->
    #{id => 40009, name => lang:get("先祖图腾"), lev => 28,
      role_lev_limit => 90, classes => 4, learn_cost => [],
      up_cost => [{90055, 90000}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({40009, 29}) ->
    #{id => 40009, name => lang:get("先祖图腾"), lev => 29,
      role_lev_limit => 90, classes => 4, learn_cost => [],
      up_cost => [{90055, 93600}], dayly_sq_exp => 0,
      is_down => 1, is_break => 1};
get_skill_unique({40009, 30}) ->
    #{id => 40009, name => lang:get("先祖图腾"), lev => 30,
      role_lev_limit => 90, classes => 4, learn_cost => [],
      up_cost => [{23827, 30}], dayly_sq_exp => 6000,
      is_down => 0, is_break => 0};
get_skill_unique({40009, 31}) ->
    #{id => 40009, name => lang:get("先祖图腾"), lev => 31,
      role_lev_limit => 91, classes => 4, learn_cost => [],
      up_cost => [{90055, 101920}], dayly_sq_exp => 6000,
      is_down => 1, is_break => 0};
get_skill_unique({40009, 32}) ->
    #{id => 40009, name => lang:get("先祖图腾"), lev => 32,
      role_lev_limit => 92, classes => 4, learn_cost => [],
      up_cost => [{90055, 106720}], dayly_sq_exp => 6000,
      is_down => 1, is_break => 0};
get_skill_unique({40009, 33}) ->
    #{id => 40009, name => lang:get("先祖图腾"), lev => 33,
      role_lev_limit => 93, classes => 4, learn_cost => [],
      up_cost => [{90055, 111600}], dayly_sq_exp => 6000,
      is_down => 1, is_break => 0};
get_skill_unique({40009, 34}) ->
    #{id => 40009, name => lang:get("先祖图腾"), lev => 34,
      role_lev_limit => 94, classes => 4, learn_cost => [],
      up_cost => [{90055, 116560}], dayly_sq_exp => 6000,
      is_down => 1, is_break => 0};
get_skill_unique({40009, 35}) ->
    #{id => 40009, name => lang:get("先祖图腾"), lev => 35,
      role_lev_limit => 95, classes => 4, learn_cost => [],
      up_cost => [{90055, 121600}], dayly_sq_exp => 8000,
      is_down => 1, is_break => 0};
get_skill_unique({40009, 36}) ->
    #{id => 40009, name => lang:get("先祖图腾"), lev => 36,
      role_lev_limit => 96, classes => 4, learn_cost => [],
      up_cost => [{90055, 126720}], dayly_sq_exp => 8000,
      is_down => 1, is_break => 0};
get_skill_unique({40009, 37}) ->
    #{id => 40009, name => lang:get("先祖图腾"), lev => 37,
      role_lev_limit => 97, classes => 4, learn_cost => [],
      up_cost => [{90055, 131920}], dayly_sq_exp => 8000,
      is_down => 1, is_break => 0};
get_skill_unique({40009, 38}) ->
    #{id => 40009, name => lang:get("先祖图腾"), lev => 38,
      role_lev_limit => 98, classes => 4, learn_cost => [],
      up_cost => [{90055, 137200}], dayly_sq_exp => 8000,
      is_down => 1, is_break => 0};
get_skill_unique({40009, 39}) ->
    #{id => 40009, name => lang:get("先祖图腾"), lev => 39,
      role_lev_limit => 99, classes => 4, learn_cost => [],
      up_cost => [{90055, 142560}], dayly_sq_exp => 8000,
      is_down => 1, is_break => 0};
get_skill_unique({40009, 40}) ->
    #{id => 40009, name => lang:get("先祖图腾"), lev => 40,
      role_lev_limit => 100, classes => 4, learn_cost => [],
      up_cost => [{90055, 148000}], dayly_sq_exp => 10000,
      is_down => 1, is_break => 0};
get_skill_unique({40009, 41}) ->
    #{id => 40009, name => lang:get("先祖图腾"), lev => 41,
      role_lev_limit => 101, classes => 4, learn_cost => [],
      up_cost => [{90055, 153520}], dayly_sq_exp => 10100,
      is_down => 1, is_break => 0};
get_skill_unique({40009, 42}) ->
    #{id => 40009, name => lang:get("先祖图腾"), lev => 42,
      role_lev_limit => 102, classes => 4, learn_cost => [],
      up_cost => [{90055, 159120}], dayly_sq_exp => 10200,
      is_down => 1, is_break => 0};
get_skill_unique({40009, 43}) ->
    #{id => 40009, name => lang:get("先祖图腾"), lev => 43,
      role_lev_limit => 103, classes => 4, learn_cost => [],
      up_cost => [{90055, 164800}], dayly_sq_exp => 10300,
      is_down => 1, is_break => 0};
get_skill_unique({40009, 44}) ->
    #{id => 40009, name => lang:get("先祖图腾"), lev => 44,
      role_lev_limit => 104, classes => 4, learn_cost => [],
      up_cost => [{90055, 170560}], dayly_sq_exp => 10400,
      is_down => 1, is_break => 1};
get_skill_unique({40009, 45}) ->
    #{id => 40009, name => lang:get("先祖图腾"), lev => 45,
      role_lev_limit => 105, classes => 4, learn_cost => [],
      up_cost => [{23827, 50}], dayly_sq_exp => 12600,
      is_down => 0, is_break => 0};
get_skill_unique({40009, 46}) ->
    #{id => 40009, name => lang:get("先祖图腾"), lev => 46,
      role_lev_limit => 106, classes => 4, learn_cost => [],
      up_cost => [{90055, 182320}], dayly_sq_exp => 12720,
      is_down => 1, is_break => 0};
get_skill_unique({40009, 47}) ->
    #{id => 40009, name => lang:get("先祖图腾"), lev => 47,
      role_lev_limit => 107, classes => 4, learn_cost => [],
      up_cost => [{90055, 188320}], dayly_sq_exp => 12840,
      is_down => 1, is_break => 0};
get_skill_unique({40009, 48}) ->
    #{id => 40009, name => lang:get("先祖图腾"), lev => 48,
      role_lev_limit => 108, classes => 4, learn_cost => [],
      up_cost => [{90055, 194400}], dayly_sq_exp => 12960,
      is_down => 1, is_break => 0};
get_skill_unique({40009, 49}) ->
    #{id => 40009, name => lang:get("先祖图腾"), lev => 49,
      role_lev_limit => 109, classes => 4, learn_cost => [],
      up_cost => [{90055, 200560}], dayly_sq_exp => 13080,
      is_down => 1, is_break => 0};
get_skill_unique({40009, 50}) ->
    #{id => 40009, name => lang:get("先祖图腾"), lev => 50,
      role_lev_limit => 110, classes => 4, learn_cost => [],
      up_cost => [{90055, 206800}], dayly_sq_exp => 15400,
      is_down => 1, is_break => 0};
get_skill_unique({40009, 51}) ->
    #{id => 40009, name => lang:get("先祖图腾"), lev => 51,
      role_lev_limit => 111, classes => 4, learn_cost => [],
      up_cost => [{90055, 213120}], dayly_sq_exp => 15540,
      is_down => 1, is_break => 0};
get_skill_unique({40009, 52}) ->
    #{id => 40009, name => lang:get("先祖图腾"), lev => 52,
      role_lev_limit => 112, classes => 4, learn_cost => [],
      up_cost => [{90055, 219520}], dayly_sq_exp => 15680,
      is_down => 1, is_break => 0};
get_skill_unique({40009, 53}) ->
    #{id => 40009, name => lang:get("先祖图腾"), lev => 53,
      role_lev_limit => 113, classes => 4, learn_cost => [],
      up_cost => [{90055, 226000}], dayly_sq_exp => 15820,
      is_down => 1, is_break => 0};
get_skill_unique({40009, 54}) ->
    #{id => 40009, name => lang:get("先祖图腾"), lev => 54,
      role_lev_limit => 114, classes => 4, learn_cost => [],
      up_cost => [{90055, 237120}], dayly_sq_exp => 15960,
      is_down => 1, is_break => 1};
get_skill_unique({40009, 55}) ->
    #{id => 40009, name => lang:get("先祖图腾"), lev => 55,
      role_lev_limit => 115, classes => 4, learn_cost => [],
      up_cost => [{23827, 80}], dayly_sq_exp => 23000,
      is_down => 0, is_break => 0};
get_skill_unique({40009, 56}) ->
    #{id => 40009, name => lang:get("先祖图腾"), lev => 56,
      role_lev_limit => 116, classes => 4, learn_cost => [],
      up_cost => [{90055, 259840}], dayly_sq_exp => 23200,
      is_down => 1, is_break => 0};
get_skill_unique({40009, 57}) ->
    #{id => 40009, name => lang:get("先祖图腾"), lev => 57,
      role_lev_limit => 117, classes => 4, learn_cost => [],
      up_cost => [{90055, 271440}], dayly_sq_exp => 23400,
      is_down => 1, is_break => 0};
get_skill_unique({40009, 58}) ->
    #{id => 40009, name => lang:get("先祖图腾"), lev => 58,
      role_lev_limit => 118, classes => 4, learn_cost => [],
      up_cost => [{90055, 283200}], dayly_sq_exp => 23600,
      is_down => 1, is_break => 0};
get_skill_unique({40009, 59}) ->
    #{id => 40009, name => lang:get("先祖图腾"), lev => 59,
      role_lev_limit => 119, classes => 4, learn_cost => [],
      up_cost => [{90055, 295120}], dayly_sq_exp => 23800,
      is_down => 1, is_break => 0};
get_skill_unique({40009, 60}) ->
    #{id => 40009, name => lang:get("先祖图腾"), lev => 60,
      role_lev_limit => 120, classes => 4, learn_cost => [],
      up_cost => [{90055, 307200}], dayly_sq_exp => 24000,
      is_down => 1, is_break => 0};
get_skill_unique({40009, 61}) ->
    #{id => 40009, name => lang:get("先祖图腾"), lev => 61,
      role_lev_limit => 121, classes => 4, learn_cost => [],
      up_cost => [{90055, 304640}], dayly_sq_exp => 22080,
      is_down => 1, is_break => 0};
get_skill_unique({40009, 62}) ->
    #{id => 40009, name => lang:get("先祖图腾"), lev => 62,
      role_lev_limit => 122, classes => 4, learn_cost => [],
      up_cost => [{90055, 326400}], dayly_sq_exp => 22160,
      is_down => 1, is_break => 0};
get_skill_unique({40009, 63}) ->
    #{id => 40009, name => lang:get("先祖图腾"), lev => 63,
      role_lev_limit => 123, classes => 4, learn_cost => [],
      up_cost => [{90055, 348480}], dayly_sq_exp => 22240,
      is_down => 1, is_break => 0};
get_skill_unique({40009, 64}) ->
    #{id => 40009, name => lang:get("先祖图腾"), lev => 64,
      role_lev_limit => 124, classes => 4, learn_cost => [],
      up_cost => [{90055, 370880}], dayly_sq_exp => 22320,
      is_down => 1, is_break => 1};
get_skill_unique({40009, 65}) ->
    #{id => 40009, name => lang:get("先祖图腾"), lev => 65,
      role_lev_limit => 125, classes => 4, learn_cost => [],
      up_cost => [{23827, 120}], dayly_sq_exp => 22400,
      is_down => 0, is_break => 0};
get_skill_unique({40009, 66}) ->
    #{id => 40009, name => lang:get("先祖图腾"), lev => 66,
      role_lev_limit => 126, classes => 4, learn_cost => [],
      up_cost => [{90055, 416640}], dayly_sq_exp => 22520,
      is_down => 1, is_break => 0};
get_skill_unique({40009, 67}) ->
    #{id => 40009, name => lang:get("先祖图腾"), lev => 67,
      role_lev_limit => 127, classes => 4, learn_cost => [],
      up_cost => [{90055, 440000}], dayly_sq_exp => 22640,
      is_down => 1, is_break => 0};
get_skill_unique({40009, 68}) ->
    #{id => 40009, name => lang:get("先祖图腾"), lev => 68,
      role_lev_limit => 128, classes => 4, learn_cost => [],
      up_cost => [{90055, 463680}], dayly_sq_exp => 22760,
      is_down => 1, is_break => 0};
get_skill_unique({40009, 69}) ->
    #{id => 40009, name => lang:get("先祖图腾"), lev => 69,
      role_lev_limit => 129, classes => 4, learn_cost => [],
      up_cost => [{90055, 487680}], dayly_sq_exp => 22880,
      is_down => 1, is_break => 0};
get_skill_unique({40009, 70}) ->
    #{id => 40009, name => lang:get("先祖图腾"), lev => 70,
      role_lev_limit => 130, classes => 4, learn_cost => [],
      up_cost => [{90055, 512000}], dayly_sq_exp => 23000,
      is_down => 1, is_break => 0};
get_skill_unique({50009, 1}) ->
    #{id => 50009, name => lang:get("恩惠救赎"), lev => 1,
      role_lev_limit => 90, classes => 5,
      learn_cost => [{23828, 10}], up_cost => [],
      dayly_sq_exp => 0, is_down => 1, is_break => 0};
get_skill_unique({50009, 2}) ->
    #{id => 50009, name => lang:get("恩惠救赎"), lev => 2,
      role_lev_limit => 90, classes => 5, learn_cost => [],
      up_cost => [{90055, 9360}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({50009, 3}) ->
    #{id => 50009, name => lang:get("恩惠救赎"), lev => 3,
      role_lev_limit => 90, classes => 5, learn_cost => [],
      up_cost => [{90055, 10800}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({50009, 4}) ->
    #{id => 50009, name => lang:get("恩惠救赎"), lev => 4,
      role_lev_limit => 90, classes => 5, learn_cost => [],
      up_cost => [{90055, 12240}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({50009, 5}) ->
    #{id => 50009, name => lang:get("恩惠救赎"), lev => 5,
      role_lev_limit => 90, classes => 5, learn_cost => [],
      up_cost => [{90055, 13680}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({50009, 6}) ->
    #{id => 50009, name => lang:get("恩惠救赎"), lev => 6,
      role_lev_limit => 90, classes => 5, learn_cost => [],
      up_cost => [{90055, 15120}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({50009, 7}) ->
    #{id => 50009, name => lang:get("恩惠救赎"), lev => 7,
      role_lev_limit => 90, classes => 5, learn_cost => [],
      up_cost => [{90055, 16560}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({50009, 8}) ->
    #{id => 50009, name => lang:get("恩惠救赎"), lev => 8,
      role_lev_limit => 90, classes => 5, learn_cost => [],
      up_cost => [{90055, 18000}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({50009, 9}) ->
    #{id => 50009, name => lang:get("恩惠救赎"), lev => 9,
      role_lev_limit => 90, classes => 5, learn_cost => [],
      up_cost => [{90055, 21600}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({50009, 10}) ->
    #{id => 50009, name => lang:get("恩惠救赎"), lev => 10,
      role_lev_limit => 90, classes => 5, learn_cost => [],
      up_cost => [{90055, 25200}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({50009, 11}) ->
    #{id => 50009, name => lang:get("恩惠救赎"), lev => 11,
      role_lev_limit => 90, classes => 5, learn_cost => [],
      up_cost => [{90055, 28800}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({50009, 12}) ->
    #{id => 50009, name => lang:get("恩惠救赎"), lev => 12,
      role_lev_limit => 90, classes => 5, learn_cost => [],
      up_cost => [{90055, 32400}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({50009, 13}) ->
    #{id => 50009, name => lang:get("恩惠救赎"), lev => 13,
      role_lev_limit => 90, classes => 5, learn_cost => [],
      up_cost => [{90055, 36000}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({50009, 14}) ->
    #{id => 50009, name => lang:get("恩惠救赎"), lev => 14,
      role_lev_limit => 90, classes => 5, learn_cost => [],
      up_cost => [{90055, 39600}], dayly_sq_exp => 0,
      is_down => 1, is_break => 1};
get_skill_unique({50009, 15}) ->
    #{id => 50009, name => lang:get("恩惠救赎"), lev => 15,
      role_lev_limit => 90, classes => 5, learn_cost => [],
      up_cost => [{23828, 10}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({50009, 16}) ->
    #{id => 50009, name => lang:get("恩惠救赎"), lev => 16,
      role_lev_limit => 90, classes => 5, learn_cost => [],
      up_cost => [{90055, 46800}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({50009, 17}) ->
    #{id => 50009, name => lang:get("恩惠救赎"), lev => 17,
      role_lev_limit => 90, classes => 5, learn_cost => [],
      up_cost => [{90055, 50400}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({50009, 18}) ->
    #{id => 50009, name => lang:get("恩惠救赎"), lev => 18,
      role_lev_limit => 90, classes => 5, learn_cost => [],
      up_cost => [{90055, 54000}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({50009, 19}) ->
    #{id => 50009, name => lang:get("恩惠救赎"), lev => 19,
      role_lev_limit => 90, classes => 5, learn_cost => [],
      up_cost => [{90055, 57600}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({50009, 20}) ->
    #{id => 50009, name => lang:get("恩惠救赎"), lev => 20,
      role_lev_limit => 90, classes => 5, learn_cost => [],
      up_cost => [{90055, 61200}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({50009, 21}) ->
    #{id => 50009, name => lang:get("恩惠救赎"), lev => 21,
      role_lev_limit => 90, classes => 5, learn_cost => [],
      up_cost => [{90055, 64800}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({50009, 22}) ->
    #{id => 50009, name => lang:get("恩惠救赎"), lev => 22,
      role_lev_limit => 90, classes => 5, learn_cost => [],
      up_cost => [{90055, 68400}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({50009, 23}) ->
    #{id => 50009, name => lang:get("恩惠救赎"), lev => 23,
      role_lev_limit => 90, classes => 5, learn_cost => [],
      up_cost => [{90055, 72000}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({50009, 24}) ->
    #{id => 50009, name => lang:get("恩惠救赎"), lev => 24,
      role_lev_limit => 90, classes => 5, learn_cost => [],
      up_cost => [{90055, 75600}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({50009, 25}) ->
    #{id => 50009, name => lang:get("恩惠救赎"), lev => 25,
      role_lev_limit => 90, classes => 5, learn_cost => [],
      up_cost => [{90055, 79200}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({50009, 26}) ->
    #{id => 50009, name => lang:get("恩惠救赎"), lev => 26,
      role_lev_limit => 90, classes => 5, learn_cost => [],
      up_cost => [{90055, 82800}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({50009, 27}) ->
    #{id => 50009, name => lang:get("恩惠救赎"), lev => 27,
      role_lev_limit => 90, classes => 5, learn_cost => [],
      up_cost => [{90055, 86400}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({50009, 28}) ->
    #{id => 50009, name => lang:get("恩惠救赎"), lev => 28,
      role_lev_limit => 90, classes => 5, learn_cost => [],
      up_cost => [{90055, 90000}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({50009, 29}) ->
    #{id => 50009, name => lang:get("恩惠救赎"), lev => 29,
      role_lev_limit => 90, classes => 5, learn_cost => [],
      up_cost => [{90055, 93600}], dayly_sq_exp => 0,
      is_down => 1, is_break => 1};
get_skill_unique({50009, 30}) ->
    #{id => 50009, name => lang:get("恩惠救赎"), lev => 30,
      role_lev_limit => 90, classes => 5, learn_cost => [],
      up_cost => [{23828, 30}], dayly_sq_exp => 6000,
      is_down => 0, is_break => 0};
get_skill_unique({50009, 31}) ->
    #{id => 50009, name => lang:get("恩惠救赎"), lev => 31,
      role_lev_limit => 91, classes => 5, learn_cost => [],
      up_cost => [{90055, 101920}], dayly_sq_exp => 6000,
      is_down => 1, is_break => 0};
get_skill_unique({50009, 32}) ->
    #{id => 50009, name => lang:get("恩惠救赎"), lev => 32,
      role_lev_limit => 92, classes => 5, learn_cost => [],
      up_cost => [{90055, 106720}], dayly_sq_exp => 6000,
      is_down => 1, is_break => 0};
get_skill_unique({50009, 33}) ->
    #{id => 50009, name => lang:get("恩惠救赎"), lev => 33,
      role_lev_limit => 93, classes => 5, learn_cost => [],
      up_cost => [{90055, 111600}], dayly_sq_exp => 6000,
      is_down => 1, is_break => 0};
get_skill_unique({50009, 34}) ->
    #{id => 50009, name => lang:get("恩惠救赎"), lev => 34,
      role_lev_limit => 94, classes => 5, learn_cost => [],
      up_cost => [{90055, 116560}], dayly_sq_exp => 6000,
      is_down => 1, is_break => 0};
get_skill_unique({50009, 35}) ->
    #{id => 50009, name => lang:get("恩惠救赎"), lev => 35,
      role_lev_limit => 95, classes => 5, learn_cost => [],
      up_cost => [{90055, 121600}], dayly_sq_exp => 8000,
      is_down => 1, is_break => 0};
get_skill_unique({50009, 36}) ->
    #{id => 50009, name => lang:get("恩惠救赎"), lev => 36,
      role_lev_limit => 96, classes => 5, learn_cost => [],
      up_cost => [{90055, 126720}], dayly_sq_exp => 8000,
      is_down => 1, is_break => 0};
get_skill_unique({50009, 37}) ->
    #{id => 50009, name => lang:get("恩惠救赎"), lev => 37,
      role_lev_limit => 97, classes => 5, learn_cost => [],
      up_cost => [{90055, 131920}], dayly_sq_exp => 8000,
      is_down => 1, is_break => 0};
get_skill_unique({50009, 38}) ->
    #{id => 50009, name => lang:get("恩惠救赎"), lev => 38,
      role_lev_limit => 98, classes => 5, learn_cost => [],
      up_cost => [{90055, 137200}], dayly_sq_exp => 8000,
      is_down => 1, is_break => 0};
get_skill_unique({50009, 39}) ->
    #{id => 50009, name => lang:get("恩惠救赎"), lev => 39,
      role_lev_limit => 99, classes => 5, learn_cost => [],
      up_cost => [{90055, 142560}], dayly_sq_exp => 8000,
      is_down => 1, is_break => 0};
get_skill_unique({50009, 40}) ->
    #{id => 50009, name => lang:get("恩惠救赎"), lev => 40,
      role_lev_limit => 100, classes => 5, learn_cost => [],
      up_cost => [{90055, 148000}], dayly_sq_exp => 10000,
      is_down => 1, is_break => 0};
get_skill_unique({50009, 41}) ->
    #{id => 50009, name => lang:get("恩惠救赎"), lev => 41,
      role_lev_limit => 101, classes => 5, learn_cost => [],
      up_cost => [{90055, 153520}], dayly_sq_exp => 10100,
      is_down => 1, is_break => 0};
get_skill_unique({50009, 42}) ->
    #{id => 50009, name => lang:get("恩惠救赎"), lev => 42,
      role_lev_limit => 102, classes => 5, learn_cost => [],
      up_cost => [{90055, 159120}], dayly_sq_exp => 10200,
      is_down => 1, is_break => 0};
get_skill_unique({50009, 43}) ->
    #{id => 50009, name => lang:get("恩惠救赎"), lev => 43,
      role_lev_limit => 103, classes => 5, learn_cost => [],
      up_cost => [{90055, 164800}], dayly_sq_exp => 10300,
      is_down => 1, is_break => 0};
get_skill_unique({50009, 44}) ->
    #{id => 50009, name => lang:get("恩惠救赎"), lev => 44,
      role_lev_limit => 104, classes => 5, learn_cost => [],
      up_cost => [{90055, 170560}], dayly_sq_exp => 10400,
      is_down => 1, is_break => 1};
get_skill_unique({50009, 45}) ->
    #{id => 50009, name => lang:get("恩惠救赎"), lev => 45,
      role_lev_limit => 105, classes => 5, learn_cost => [],
      up_cost => [{23828, 50}], dayly_sq_exp => 12600,
      is_down => 0, is_break => 0};
get_skill_unique({50009, 46}) ->
    #{id => 50009, name => lang:get("恩惠救赎"), lev => 46,
      role_lev_limit => 106, classes => 5, learn_cost => [],
      up_cost => [{90055, 182320}], dayly_sq_exp => 12720,
      is_down => 1, is_break => 0};
get_skill_unique({50009, 47}) ->
    #{id => 50009, name => lang:get("恩惠救赎"), lev => 47,
      role_lev_limit => 107, classes => 5, learn_cost => [],
      up_cost => [{90055, 188320}], dayly_sq_exp => 12840,
      is_down => 1, is_break => 0};
get_skill_unique({50009, 48}) ->
    #{id => 50009, name => lang:get("恩惠救赎"), lev => 48,
      role_lev_limit => 108, classes => 5, learn_cost => [],
      up_cost => [{90055, 194400}], dayly_sq_exp => 12960,
      is_down => 1, is_break => 0};
get_skill_unique({50009, 49}) ->
    #{id => 50009, name => lang:get("恩惠救赎"), lev => 49,
      role_lev_limit => 109, classes => 5, learn_cost => [],
      up_cost => [{90055, 200560}], dayly_sq_exp => 13080,
      is_down => 1, is_break => 0};
get_skill_unique({50009, 50}) ->
    #{id => 50009, name => lang:get("恩惠救赎"), lev => 50,
      role_lev_limit => 110, classes => 5, learn_cost => [],
      up_cost => [{90055, 206800}], dayly_sq_exp => 15400,
      is_down => 1, is_break => 0};
get_skill_unique({50009, 51}) ->
    #{id => 50009, name => lang:get("恩惠救赎"), lev => 51,
      role_lev_limit => 111, classes => 5, learn_cost => [],
      up_cost => [{90055, 213120}], dayly_sq_exp => 15540,
      is_down => 1, is_break => 0};
get_skill_unique({50009, 52}) ->
    #{id => 50009, name => lang:get("恩惠救赎"), lev => 52,
      role_lev_limit => 112, classes => 5, learn_cost => [],
      up_cost => [{90055, 219520}], dayly_sq_exp => 15680,
      is_down => 1, is_break => 0};
get_skill_unique({50009, 53}) ->
    #{id => 50009, name => lang:get("恩惠救赎"), lev => 53,
      role_lev_limit => 113, classes => 5, learn_cost => [],
      up_cost => [{90055, 226000}], dayly_sq_exp => 15820,
      is_down => 1, is_break => 0};
get_skill_unique({50009, 54}) ->
    #{id => 50009, name => lang:get("恩惠救赎"), lev => 54,
      role_lev_limit => 114, classes => 5, learn_cost => [],
      up_cost => [{90055, 237120}], dayly_sq_exp => 15960,
      is_down => 1, is_break => 1};
get_skill_unique({50009, 55}) ->
    #{id => 50009, name => lang:get("恩惠救赎"), lev => 55,
      role_lev_limit => 115, classes => 5, learn_cost => [],
      up_cost => [{23828, 80}], dayly_sq_exp => 23000,
      is_down => 0, is_break => 0};
get_skill_unique({50009, 56}) ->
    #{id => 50009, name => lang:get("恩惠救赎"), lev => 56,
      role_lev_limit => 116, classes => 5, learn_cost => [],
      up_cost => [{90055, 259840}], dayly_sq_exp => 23200,
      is_down => 1, is_break => 0};
get_skill_unique({50009, 57}) ->
    #{id => 50009, name => lang:get("恩惠救赎"), lev => 57,
      role_lev_limit => 117, classes => 5, learn_cost => [],
      up_cost => [{90055, 271440}], dayly_sq_exp => 23400,
      is_down => 1, is_break => 0};
get_skill_unique({50009, 58}) ->
    #{id => 50009, name => lang:get("恩惠救赎"), lev => 58,
      role_lev_limit => 118, classes => 5, learn_cost => [],
      up_cost => [{90055, 283200}], dayly_sq_exp => 23600,
      is_down => 1, is_break => 0};
get_skill_unique({50009, 59}) ->
    #{id => 50009, name => lang:get("恩惠救赎"), lev => 59,
      role_lev_limit => 119, classes => 5, learn_cost => [],
      up_cost => [{90055, 295120}], dayly_sq_exp => 23800,
      is_down => 1, is_break => 0};
get_skill_unique({50009, 60}) ->
    #{id => 50009, name => lang:get("恩惠救赎"), lev => 60,
      role_lev_limit => 120, classes => 5, learn_cost => [],
      up_cost => [{90055, 307200}], dayly_sq_exp => 24000,
      is_down => 1, is_break => 0};
get_skill_unique({50009, 61}) ->
    #{id => 50009, name => lang:get("恩惠救赎"), lev => 61,
      role_lev_limit => 121, classes => 5, learn_cost => [],
      up_cost => [{90055, 304640}], dayly_sq_exp => 22080,
      is_down => 1, is_break => 0};
get_skill_unique({50009, 62}) ->
    #{id => 50009, name => lang:get("恩惠救赎"), lev => 62,
      role_lev_limit => 122, classes => 5, learn_cost => [],
      up_cost => [{90055, 326400}], dayly_sq_exp => 22160,
      is_down => 1, is_break => 0};
get_skill_unique({50009, 63}) ->
    #{id => 50009, name => lang:get("恩惠救赎"), lev => 63,
      role_lev_limit => 123, classes => 5, learn_cost => [],
      up_cost => [{90055, 348480}], dayly_sq_exp => 22240,
      is_down => 1, is_break => 0};
get_skill_unique({50009, 64}) ->
    #{id => 50009, name => lang:get("恩惠救赎"), lev => 64,
      role_lev_limit => 124, classes => 5, learn_cost => [],
      up_cost => [{90055, 370880}], dayly_sq_exp => 22320,
      is_down => 1, is_break => 1};
get_skill_unique({50009, 65}) ->
    #{id => 50009, name => lang:get("恩惠救赎"), lev => 65,
      role_lev_limit => 125, classes => 5, learn_cost => [],
      up_cost => [{23828, 120}], dayly_sq_exp => 22400,
      is_down => 0, is_break => 0};
get_skill_unique({50009, 66}) ->
    #{id => 50009, name => lang:get("恩惠救赎"), lev => 66,
      role_lev_limit => 126, classes => 5, learn_cost => [],
      up_cost => [{90055, 416640}], dayly_sq_exp => 22520,
      is_down => 1, is_break => 0};
get_skill_unique({50009, 67}) ->
    #{id => 50009, name => lang:get("恩惠救赎"), lev => 67,
      role_lev_limit => 127, classes => 5, learn_cost => [],
      up_cost => [{90055, 440000}], dayly_sq_exp => 22640,
      is_down => 1, is_break => 0};
get_skill_unique({50009, 68}) ->
    #{id => 50009, name => lang:get("恩惠救赎"), lev => 68,
      role_lev_limit => 128, classes => 5, learn_cost => [],
      up_cost => [{90055, 463680}], dayly_sq_exp => 22760,
      is_down => 1, is_break => 0};
get_skill_unique({50009, 69}) ->
    #{id => 50009, name => lang:get("恩惠救赎"), lev => 69,
      role_lev_limit => 129, classes => 5, learn_cost => [],
      up_cost => [{90055, 487680}], dayly_sq_exp => 22880,
      is_down => 1, is_break => 0};
get_skill_unique({50009, 70}) ->
    #{id => 50009, name => lang:get("恩惠救赎"), lev => 70,
      role_lev_limit => 130, classes => 5, learn_cost => [],
      up_cost => [{90055, 512000}], dayly_sq_exp => 23000,
      is_down => 1, is_break => 0};
get_skill_unique({69009, 1}) ->
    #{id => 69009, name => lang:get("月之暗面"), lev => 1,
      role_lev_limit => 90, classes => 6,
      learn_cost => [{23835, 10}], up_cost => [],
      dayly_sq_exp => 0, is_down => 1, is_break => 0};
get_skill_unique({69009, 2}) ->
    #{id => 69009, name => lang:get("月之暗面"), lev => 2,
      role_lev_limit => 90, classes => 6, learn_cost => [],
      up_cost => [{90055, 9360}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({69009, 3}) ->
    #{id => 69009, name => lang:get("月之暗面"), lev => 3,
      role_lev_limit => 90, classes => 6, learn_cost => [],
      up_cost => [{90055, 10800}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({69009, 4}) ->
    #{id => 69009, name => lang:get("月之暗面"), lev => 4,
      role_lev_limit => 90, classes => 6, learn_cost => [],
      up_cost => [{90055, 12240}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({69009, 5}) ->
    #{id => 69009, name => lang:get("月之暗面"), lev => 5,
      role_lev_limit => 90, classes => 6, learn_cost => [],
      up_cost => [{90055, 13680}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({69009, 6}) ->
    #{id => 69009, name => lang:get("月之暗面"), lev => 6,
      role_lev_limit => 90, classes => 6, learn_cost => [],
      up_cost => [{90055, 15120}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({69009, 7}) ->
    #{id => 69009, name => lang:get("月之暗面"), lev => 7,
      role_lev_limit => 90, classes => 6, learn_cost => [],
      up_cost => [{90055, 16560}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({69009, 8}) ->
    #{id => 69009, name => lang:get("月之暗面"), lev => 8,
      role_lev_limit => 90, classes => 6, learn_cost => [],
      up_cost => [{90055, 18000}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({69009, 9}) ->
    #{id => 69009, name => lang:get("月之暗面"), lev => 9,
      role_lev_limit => 90, classes => 6, learn_cost => [],
      up_cost => [{90055, 21600}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({69009, 10}) ->
    #{id => 69009, name => lang:get("月之暗面"), lev => 10,
      role_lev_limit => 90, classes => 6, learn_cost => [],
      up_cost => [{90055, 25200}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({69009, 11}) ->
    #{id => 69009, name => lang:get("月之暗面"), lev => 11,
      role_lev_limit => 90, classes => 6, learn_cost => [],
      up_cost => [{90055, 28800}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({69009, 12}) ->
    #{id => 69009, name => lang:get("月之暗面"), lev => 12,
      role_lev_limit => 90, classes => 6, learn_cost => [],
      up_cost => [{90055, 32400}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({69009, 13}) ->
    #{id => 69009, name => lang:get("月之暗面"), lev => 13,
      role_lev_limit => 90, classes => 6, learn_cost => [],
      up_cost => [{90055, 36000}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({69009, 14}) ->
    #{id => 69009, name => lang:get("月之暗面"), lev => 14,
      role_lev_limit => 90, classes => 6, learn_cost => [],
      up_cost => [{90055, 39600}], dayly_sq_exp => 0,
      is_down => 1, is_break => 1};
get_skill_unique({69009, 15}) ->
    #{id => 69009, name => lang:get("月之暗面"), lev => 15,
      role_lev_limit => 90, classes => 6, learn_cost => [],
      up_cost => [{23835, 10}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({69009, 16}) ->
    #{id => 69009, name => lang:get("月之暗面"), lev => 16,
      role_lev_limit => 90, classes => 6, learn_cost => [],
      up_cost => [{90055, 46800}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({69009, 17}) ->
    #{id => 69009, name => lang:get("月之暗面"), lev => 17,
      role_lev_limit => 90, classes => 6, learn_cost => [],
      up_cost => [{90055, 50400}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({69009, 18}) ->
    #{id => 69009, name => lang:get("月之暗面"), lev => 18,
      role_lev_limit => 90, classes => 6, learn_cost => [],
      up_cost => [{90055, 54000}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({69009, 19}) ->
    #{id => 69009, name => lang:get("月之暗面"), lev => 19,
      role_lev_limit => 90, classes => 6, learn_cost => [],
      up_cost => [{90055, 57600}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({69009, 20}) ->
    #{id => 69009, name => lang:get("月之暗面"), lev => 20,
      role_lev_limit => 90, classes => 6, learn_cost => [],
      up_cost => [{90055, 61200}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({69009, 21}) ->
    #{id => 69009, name => lang:get("月之暗面"), lev => 21,
      role_lev_limit => 90, classes => 6, learn_cost => [],
      up_cost => [{90055, 64800}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({69009, 22}) ->
    #{id => 69009, name => lang:get("月之暗面"), lev => 22,
      role_lev_limit => 90, classes => 6, learn_cost => [],
      up_cost => [{90055, 68400}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({69009, 23}) ->
    #{id => 69009, name => lang:get("月之暗面"), lev => 23,
      role_lev_limit => 90, classes => 6, learn_cost => [],
      up_cost => [{90055, 72000}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({69009, 24}) ->
    #{id => 69009, name => lang:get("月之暗面"), lev => 24,
      role_lev_limit => 90, classes => 6, learn_cost => [],
      up_cost => [{90055, 75600}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({69009, 25}) ->
    #{id => 69009, name => lang:get("月之暗面"), lev => 25,
      role_lev_limit => 90, classes => 6, learn_cost => [],
      up_cost => [{90055, 79200}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({69009, 26}) ->
    #{id => 69009, name => lang:get("月之暗面"), lev => 26,
      role_lev_limit => 90, classes => 6, learn_cost => [],
      up_cost => [{90055, 82800}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({69009, 27}) ->
    #{id => 69009, name => lang:get("月之暗面"), lev => 27,
      role_lev_limit => 90, classes => 6, learn_cost => [],
      up_cost => [{90055, 86400}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({69009, 28}) ->
    #{id => 69009, name => lang:get("月之暗面"), lev => 28,
      role_lev_limit => 90, classes => 6, learn_cost => [],
      up_cost => [{90055, 90000}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({69009, 29}) ->
    #{id => 69009, name => lang:get("月之暗面"), lev => 29,
      role_lev_limit => 90, classes => 6, learn_cost => [],
      up_cost => [{90055, 93600}], dayly_sq_exp => 0,
      is_down => 1, is_break => 1};
get_skill_unique({69009, 30}) ->
    #{id => 69009, name => lang:get("月之暗面"), lev => 30,
      role_lev_limit => 90, classes => 6, learn_cost => [],
      up_cost => [{23835, 30}], dayly_sq_exp => 6000,
      is_down => 0, is_break => 0};
get_skill_unique({69009, 31}) ->
    #{id => 69009, name => lang:get("月之暗面"), lev => 31,
      role_lev_limit => 91, classes => 6, learn_cost => [],
      up_cost => [{90055, 101920}], dayly_sq_exp => 6000,
      is_down => 1, is_break => 0};
get_skill_unique({69009, 32}) ->
    #{id => 69009, name => lang:get("月之暗面"), lev => 32,
      role_lev_limit => 92, classes => 6, learn_cost => [],
      up_cost => [{90055, 106720}], dayly_sq_exp => 6000,
      is_down => 1, is_break => 0};
get_skill_unique({69009, 33}) ->
    #{id => 69009, name => lang:get("月之暗面"), lev => 33,
      role_lev_limit => 93, classes => 6, learn_cost => [],
      up_cost => [{90055, 111600}], dayly_sq_exp => 6000,
      is_down => 1, is_break => 0};
get_skill_unique({69009, 34}) ->
    #{id => 69009, name => lang:get("月之暗面"), lev => 34,
      role_lev_limit => 94, classes => 6, learn_cost => [],
      up_cost => [{90055, 116560}], dayly_sq_exp => 6000,
      is_down => 1, is_break => 0};
get_skill_unique({69009, 35}) ->
    #{id => 69009, name => lang:get("月之暗面"), lev => 35,
      role_lev_limit => 95, classes => 6, learn_cost => [],
      up_cost => [{90055, 121600}], dayly_sq_exp => 8000,
      is_down => 1, is_break => 0};
get_skill_unique({69009, 36}) ->
    #{id => 69009, name => lang:get("月之暗面"), lev => 36,
      role_lev_limit => 96, classes => 6, learn_cost => [],
      up_cost => [{90055, 126720}], dayly_sq_exp => 8000,
      is_down => 1, is_break => 0};
get_skill_unique({69009, 37}) ->
    #{id => 69009, name => lang:get("月之暗面"), lev => 37,
      role_lev_limit => 97, classes => 6, learn_cost => [],
      up_cost => [{90055, 131920}], dayly_sq_exp => 8000,
      is_down => 1, is_break => 0};
get_skill_unique({69009, 38}) ->
    #{id => 69009, name => lang:get("月之暗面"), lev => 38,
      role_lev_limit => 98, classes => 6, learn_cost => [],
      up_cost => [{90055, 137200}], dayly_sq_exp => 8000,
      is_down => 1, is_break => 0};
get_skill_unique({69009, 39}) ->
    #{id => 69009, name => lang:get("月之暗面"), lev => 39,
      role_lev_limit => 99, classes => 6, learn_cost => [],
      up_cost => [{90055, 142560}], dayly_sq_exp => 8000,
      is_down => 1, is_break => 0};
get_skill_unique({69009, 40}) ->
    #{id => 69009, name => lang:get("月之暗面"), lev => 40,
      role_lev_limit => 100, classes => 6, learn_cost => [],
      up_cost => [{90055, 148000}], dayly_sq_exp => 10000,
      is_down => 1, is_break => 0};
get_skill_unique({69009, 41}) ->
    #{id => 69009, name => lang:get("月之暗面"), lev => 41,
      role_lev_limit => 101, classes => 6, learn_cost => [],
      up_cost => [{90055, 153520}], dayly_sq_exp => 10100,
      is_down => 1, is_break => 0};
get_skill_unique({69009, 42}) ->
    #{id => 69009, name => lang:get("月之暗面"), lev => 42,
      role_lev_limit => 102, classes => 6, learn_cost => [],
      up_cost => [{90055, 159120}], dayly_sq_exp => 10200,
      is_down => 1, is_break => 0};
get_skill_unique({69009, 43}) ->
    #{id => 69009, name => lang:get("月之暗面"), lev => 43,
      role_lev_limit => 103, classes => 6, learn_cost => [],
      up_cost => [{90055, 164800}], dayly_sq_exp => 10300,
      is_down => 1, is_break => 0};
get_skill_unique({69009, 44}) ->
    #{id => 69009, name => lang:get("月之暗面"), lev => 44,
      role_lev_limit => 104, classes => 6, learn_cost => [],
      up_cost => [{90055, 170560}], dayly_sq_exp => 10400,
      is_down => 1, is_break => 1};
get_skill_unique({69009, 45}) ->
    #{id => 69009, name => lang:get("月之暗面"), lev => 45,
      role_lev_limit => 105, classes => 6, learn_cost => [],
      up_cost => [{23835, 50}], dayly_sq_exp => 12600,
      is_down => 0, is_break => 0};
get_skill_unique({69009, 46}) ->
    #{id => 69009, name => lang:get("月之暗面"), lev => 46,
      role_lev_limit => 106, classes => 6, learn_cost => [],
      up_cost => [{90055, 182320}], dayly_sq_exp => 12720,
      is_down => 1, is_break => 0};
get_skill_unique({69009, 47}) ->
    #{id => 69009, name => lang:get("月之暗面"), lev => 47,
      role_lev_limit => 107, classes => 6, learn_cost => [],
      up_cost => [{90055, 188320}], dayly_sq_exp => 12840,
      is_down => 1, is_break => 0};
get_skill_unique({69009, 48}) ->
    #{id => 69009, name => lang:get("月之暗面"), lev => 48,
      role_lev_limit => 108, classes => 6, learn_cost => [],
      up_cost => [{90055, 194400}], dayly_sq_exp => 12960,
      is_down => 1, is_break => 0};
get_skill_unique({69009, 49}) ->
    #{id => 69009, name => lang:get("月之暗面"), lev => 49,
      role_lev_limit => 109, classes => 6, learn_cost => [],
      up_cost => [{90055, 200560}], dayly_sq_exp => 13080,
      is_down => 1, is_break => 0};
get_skill_unique({69009, 50}) ->
    #{id => 69009, name => lang:get("月之暗面"), lev => 50,
      role_lev_limit => 110, classes => 6, learn_cost => [],
      up_cost => [{90055, 206800}], dayly_sq_exp => 15400,
      is_down => 1, is_break => 0};
get_skill_unique({69009, 51}) ->
    #{id => 69009, name => lang:get("月之暗面"), lev => 51,
      role_lev_limit => 111, classes => 6, learn_cost => [],
      up_cost => [{90055, 213120}], dayly_sq_exp => 15540,
      is_down => 1, is_break => 0};
get_skill_unique({69009, 52}) ->
    #{id => 69009, name => lang:get("月之暗面"), lev => 52,
      role_lev_limit => 112, classes => 6, learn_cost => [],
      up_cost => [{90055, 219520}], dayly_sq_exp => 15680,
      is_down => 1, is_break => 0};
get_skill_unique({69009, 53}) ->
    #{id => 69009, name => lang:get("月之暗面"), lev => 53,
      role_lev_limit => 113, classes => 6, learn_cost => [],
      up_cost => [{90055, 226000}], dayly_sq_exp => 15820,
      is_down => 1, is_break => 0};
get_skill_unique({69009, 54}) ->
    #{id => 69009, name => lang:get("月之暗面"), lev => 54,
      role_lev_limit => 114, classes => 6, learn_cost => [],
      up_cost => [{90055, 237120}], dayly_sq_exp => 15960,
      is_down => 1, is_break => 1};
get_skill_unique({69009, 55}) ->
    #{id => 69009, name => lang:get("月之暗面"), lev => 55,
      role_lev_limit => 115, classes => 6, learn_cost => [],
      up_cost => [{23835, 80}], dayly_sq_exp => 23000,
      is_down => 0, is_break => 0};
get_skill_unique({69009, 56}) ->
    #{id => 69009, name => lang:get("月之暗面"), lev => 56,
      role_lev_limit => 116, classes => 6, learn_cost => [],
      up_cost => [{90055, 259840}], dayly_sq_exp => 23200,
      is_down => 1, is_break => 0};
get_skill_unique({69009, 57}) ->
    #{id => 69009, name => lang:get("月之暗面"), lev => 57,
      role_lev_limit => 117, classes => 6, learn_cost => [],
      up_cost => [{90055, 271440}], dayly_sq_exp => 23400,
      is_down => 1, is_break => 0};
get_skill_unique({69009, 58}) ->
    #{id => 69009, name => lang:get("月之暗面"), lev => 58,
      role_lev_limit => 118, classes => 6, learn_cost => [],
      up_cost => [{90055, 283200}], dayly_sq_exp => 23600,
      is_down => 1, is_break => 0};
get_skill_unique({69009, 59}) ->
    #{id => 69009, name => lang:get("月之暗面"), lev => 59,
      role_lev_limit => 119, classes => 6, learn_cost => [],
      up_cost => [{90055, 295120}], dayly_sq_exp => 23800,
      is_down => 1, is_break => 0};
get_skill_unique({69009, 60}) ->
    #{id => 69009, name => lang:get("月之暗面"), lev => 60,
      role_lev_limit => 120, classes => 6, learn_cost => [],
      up_cost => [{90055, 307200}], dayly_sq_exp => 24000,
      is_down => 1, is_break => 0};
get_skill_unique({69009, 61}) ->
    #{id => 69009, name => lang:get("月之暗面"), lev => 61,
      role_lev_limit => 121, classes => 6, learn_cost => [],
      up_cost => [{90055, 304640}], dayly_sq_exp => 22080,
      is_down => 1, is_break => 0};
get_skill_unique({69009, 62}) ->
    #{id => 69009, name => lang:get("月之暗面"), lev => 62,
      role_lev_limit => 122, classes => 6, learn_cost => [],
      up_cost => [{90055, 326400}], dayly_sq_exp => 22160,
      is_down => 1, is_break => 0};
get_skill_unique({69009, 63}) ->
    #{id => 69009, name => lang:get("月之暗面"), lev => 63,
      role_lev_limit => 123, classes => 6, learn_cost => [],
      up_cost => [{90055, 348480}], dayly_sq_exp => 22240,
      is_down => 1, is_break => 0};
get_skill_unique({69009, 64}) ->
    #{id => 69009, name => lang:get("月之暗面"), lev => 64,
      role_lev_limit => 124, classes => 6, learn_cost => [],
      up_cost => [{90055, 370880}], dayly_sq_exp => 22320,
      is_down => 1, is_break => 1};
get_skill_unique({69009, 65}) ->
    #{id => 69009, name => lang:get("月之暗面"), lev => 65,
      role_lev_limit => 125, classes => 6, learn_cost => [],
      up_cost => [{23835, 120}], dayly_sq_exp => 22400,
      is_down => 0, is_break => 0};
get_skill_unique({69009, 66}) ->
    #{id => 69009, name => lang:get("月之暗面"), lev => 66,
      role_lev_limit => 126, classes => 6, learn_cost => [],
      up_cost => [{90055, 416640}], dayly_sq_exp => 22520,
      is_down => 1, is_break => 0};
get_skill_unique({69009, 67}) ->
    #{id => 69009, name => lang:get("月之暗面"), lev => 67,
      role_lev_limit => 127, classes => 6, learn_cost => [],
      up_cost => [{90055, 440000}], dayly_sq_exp => 22640,
      is_down => 1, is_break => 0};
get_skill_unique({69009, 68}) ->
    #{id => 69009, name => lang:get("月之暗面"), lev => 68,
      role_lev_limit => 128, classes => 6, learn_cost => [],
      up_cost => [{90055, 463680}], dayly_sq_exp => 22760,
      is_down => 1, is_break => 0};
get_skill_unique({69009, 69}) ->
    #{id => 69009, name => lang:get("月之暗面"), lev => 69,
      role_lev_limit => 129, classes => 6, learn_cost => [],
      up_cost => [{90055, 487680}], dayly_sq_exp => 22880,
      is_down => 1, is_break => 0};
get_skill_unique({69009, 70}) ->
    #{id => 69009, name => lang:get("月之暗面"), lev => 70,
      role_lev_limit => 130, classes => 6, learn_cost => [],
      up_cost => [{90055, 512000}], dayly_sq_exp => 23000,
      is_down => 1, is_break => 0};
get_skill_unique({69511, 1}) ->
    #{id => 69511, name => lang:get("圣光结界"), lev => 1,
      role_lev_limit => 90, classes => 7,
      learn_cost => [{23829, 10}], up_cost => [],
      dayly_sq_exp => 0, is_down => 1, is_break => 0};
get_skill_unique({69511, 2}) ->
    #{id => 69511, name => lang:get("圣光结界"), lev => 2,
      role_lev_limit => 90, classes => 7, learn_cost => [],
      up_cost => [{90055, 9360}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({69511, 3}) ->
    #{id => 69511, name => lang:get("圣光结界"), lev => 3,
      role_lev_limit => 90, classes => 7, learn_cost => [],
      up_cost => [{90055, 10800}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({69511, 4}) ->
    #{id => 69511, name => lang:get("圣光结界"), lev => 4,
      role_lev_limit => 90, classes => 7, learn_cost => [],
      up_cost => [{90055, 12240}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({69511, 5}) ->
    #{id => 69511, name => lang:get("圣光结界"), lev => 5,
      role_lev_limit => 90, classes => 7, learn_cost => [],
      up_cost => [{90055, 13680}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({69511, 6}) ->
    #{id => 69511, name => lang:get("圣光结界"), lev => 6,
      role_lev_limit => 90, classes => 7, learn_cost => [],
      up_cost => [{90055, 15120}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({69511, 7}) ->
    #{id => 69511, name => lang:get("圣光结界"), lev => 7,
      role_lev_limit => 90, classes => 7, learn_cost => [],
      up_cost => [{90055, 16560}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({69511, 8}) ->
    #{id => 69511, name => lang:get("圣光结界"), lev => 8,
      role_lev_limit => 90, classes => 7, learn_cost => [],
      up_cost => [{90055, 18000}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({69511, 9}) ->
    #{id => 69511, name => lang:get("圣光结界"), lev => 9,
      role_lev_limit => 90, classes => 7, learn_cost => [],
      up_cost => [{90055, 21600}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({69511, 10}) ->
    #{id => 69511, name => lang:get("圣光结界"), lev => 10,
      role_lev_limit => 90, classes => 7, learn_cost => [],
      up_cost => [{90055, 25200}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({69511, 11}) ->
    #{id => 69511, name => lang:get("圣光结界"), lev => 11,
      role_lev_limit => 90, classes => 7, learn_cost => [],
      up_cost => [{90055, 28800}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({69511, 12}) ->
    #{id => 69511, name => lang:get("圣光结界"), lev => 12,
      role_lev_limit => 90, classes => 7, learn_cost => [],
      up_cost => [{90055, 32400}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({69511, 13}) ->
    #{id => 69511, name => lang:get("圣光结界"), lev => 13,
      role_lev_limit => 90, classes => 7, learn_cost => [],
      up_cost => [{90055, 36000}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({69511, 14}) ->
    #{id => 69511, name => lang:get("圣光结界"), lev => 14,
      role_lev_limit => 90, classes => 7, learn_cost => [],
      up_cost => [{90055, 39600}], dayly_sq_exp => 0,
      is_down => 1, is_break => 1};
get_skill_unique({69511, 15}) ->
    #{id => 69511, name => lang:get("圣光结界"), lev => 15,
      role_lev_limit => 90, classes => 7, learn_cost => [],
      up_cost => [{23829, 10}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({69511, 16}) ->
    #{id => 69511, name => lang:get("圣光结界"), lev => 16,
      role_lev_limit => 90, classes => 7, learn_cost => [],
      up_cost => [{90055, 46800}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({69511, 17}) ->
    #{id => 69511, name => lang:get("圣光结界"), lev => 17,
      role_lev_limit => 90, classes => 7, learn_cost => [],
      up_cost => [{90055, 50400}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({69511, 18}) ->
    #{id => 69511, name => lang:get("圣光结界"), lev => 18,
      role_lev_limit => 90, classes => 7, learn_cost => [],
      up_cost => [{90055, 54000}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({69511, 19}) ->
    #{id => 69511, name => lang:get("圣光结界"), lev => 19,
      role_lev_limit => 90, classes => 7, learn_cost => [],
      up_cost => [{90055, 57600}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({69511, 20}) ->
    #{id => 69511, name => lang:get("圣光结界"), lev => 20,
      role_lev_limit => 90, classes => 7, learn_cost => [],
      up_cost => [{90055, 61200}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({69511, 21}) ->
    #{id => 69511, name => lang:get("圣光结界"), lev => 21,
      role_lev_limit => 90, classes => 7, learn_cost => [],
      up_cost => [{90055, 64800}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({69511, 22}) ->
    #{id => 69511, name => lang:get("圣光结界"), lev => 22,
      role_lev_limit => 90, classes => 7, learn_cost => [],
      up_cost => [{90055, 68400}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({69511, 23}) ->
    #{id => 69511, name => lang:get("圣光结界"), lev => 23,
      role_lev_limit => 90, classes => 7, learn_cost => [],
      up_cost => [{90055, 72000}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({69511, 24}) ->
    #{id => 69511, name => lang:get("圣光结界"), lev => 24,
      role_lev_limit => 90, classes => 7, learn_cost => [],
      up_cost => [{90055, 75600}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({69511, 25}) ->
    #{id => 69511, name => lang:get("圣光结界"), lev => 25,
      role_lev_limit => 90, classes => 7, learn_cost => [],
      up_cost => [{90055, 79200}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({69511, 26}) ->
    #{id => 69511, name => lang:get("圣光结界"), lev => 26,
      role_lev_limit => 90, classes => 7, learn_cost => [],
      up_cost => [{90055, 82800}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({69511, 27}) ->
    #{id => 69511, name => lang:get("圣光结界"), lev => 27,
      role_lev_limit => 90, classes => 7, learn_cost => [],
      up_cost => [{90055, 86400}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({69511, 28}) ->
    #{id => 69511, name => lang:get("圣光结界"), lev => 28,
      role_lev_limit => 90, classes => 7, learn_cost => [],
      up_cost => [{90055, 90000}], dayly_sq_exp => 0,
      is_down => 1, is_break => 0};
get_skill_unique({69511, 29}) ->
    #{id => 69511, name => lang:get("圣光结界"), lev => 29,
      role_lev_limit => 90, classes => 7, learn_cost => [],
      up_cost => [{90055, 93600}], dayly_sq_exp => 0,
      is_down => 1, is_break => 1};
get_skill_unique({69511, 30}) ->
    #{id => 69511, name => lang:get("圣光结界"), lev => 30,
      role_lev_limit => 90, classes => 7, learn_cost => [],
      up_cost => [{23829, 30}], dayly_sq_exp => 6000,
      is_down => 0, is_break => 0};
get_skill_unique({69511, 31}) ->
    #{id => 69511, name => lang:get("圣光结界"), lev => 31,
      role_lev_limit => 91, classes => 7, learn_cost => [],
      up_cost => [{90055, 101920}], dayly_sq_exp => 6000,
      is_down => 1, is_break => 0};
get_skill_unique({69511, 32}) ->
    #{id => 69511, name => lang:get("圣光结界"), lev => 32,
      role_lev_limit => 92, classes => 7, learn_cost => [],
      up_cost => [{90055, 106720}], dayly_sq_exp => 6000,
      is_down => 1, is_break => 0};
get_skill_unique({69511, 33}) ->
    #{id => 69511, name => lang:get("圣光结界"), lev => 33,
      role_lev_limit => 93, classes => 7, learn_cost => [],
      up_cost => [{90055, 111600}], dayly_sq_exp => 6000,
      is_down => 1, is_break => 0};
get_skill_unique({69511, 34}) ->
    #{id => 69511, name => lang:get("圣光结界"), lev => 34,
      role_lev_limit => 94, classes => 7, learn_cost => [],
      up_cost => [{90055, 116560}], dayly_sq_exp => 6000,
      is_down => 1, is_break => 0};
get_skill_unique({69511, 35}) ->
    #{id => 69511, name => lang:get("圣光结界"), lev => 35,
      role_lev_limit => 95, classes => 7, learn_cost => [],
      up_cost => [{90055, 121600}], dayly_sq_exp => 8000,
      is_down => 1, is_break => 0};
get_skill_unique({69511, 36}) ->
    #{id => 69511, name => lang:get("圣光结界"), lev => 36,
      role_lev_limit => 96, classes => 7, learn_cost => [],
      up_cost => [{90055, 126720}], dayly_sq_exp => 8000,
      is_down => 1, is_break => 0};
get_skill_unique({69511, 37}) ->
    #{id => 69511, name => lang:get("圣光结界"), lev => 37,
      role_lev_limit => 97, classes => 7, learn_cost => [],
      up_cost => [{90055, 131920}], dayly_sq_exp => 8000,
      is_down => 1, is_break => 0};
get_skill_unique({69511, 38}) ->
    #{id => 69511, name => lang:get("圣光结界"), lev => 38,
      role_lev_limit => 98, classes => 7, learn_cost => [],
      up_cost => [{90055, 137200}], dayly_sq_exp => 8000,
      is_down => 1, is_break => 0};
get_skill_unique({69511, 39}) ->
    #{id => 69511, name => lang:get("圣光结界"), lev => 39,
      role_lev_limit => 99, classes => 7, learn_cost => [],
      up_cost => [{90055, 142560}], dayly_sq_exp => 8000,
      is_down => 1, is_break => 0};
get_skill_unique({69511, 40}) ->
    #{id => 69511, name => lang:get("圣光结界"), lev => 40,
      role_lev_limit => 100, classes => 7, learn_cost => [],
      up_cost => [{90055, 148000}], dayly_sq_exp => 10000,
      is_down => 1, is_break => 0};
get_skill_unique({69511, 41}) ->
    #{id => 69511, name => lang:get("圣光结界"), lev => 41,
      role_lev_limit => 101, classes => 7, learn_cost => [],
      up_cost => [{90055, 153520}], dayly_sq_exp => 10100,
      is_down => 1, is_break => 0};
get_skill_unique({69511, 42}) ->
    #{id => 69511, name => lang:get("圣光结界"), lev => 42,
      role_lev_limit => 102, classes => 7, learn_cost => [],
      up_cost => [{90055, 159120}], dayly_sq_exp => 10200,
      is_down => 1, is_break => 0};
get_skill_unique({69511, 43}) ->
    #{id => 69511, name => lang:get("圣光结界"), lev => 43,
      role_lev_limit => 103, classes => 7, learn_cost => [],
      up_cost => [{90055, 164800}], dayly_sq_exp => 10300,
      is_down => 1, is_break => 0};
get_skill_unique({69511, 44}) ->
    #{id => 69511, name => lang:get("圣光结界"), lev => 44,
      role_lev_limit => 104, classes => 7, learn_cost => [],
      up_cost => [{90055, 170560}], dayly_sq_exp => 10400,
      is_down => 1, is_break => 1};
get_skill_unique({69511, 45}) ->
    #{id => 69511, name => lang:get("圣光结界"), lev => 45,
      role_lev_limit => 105, classes => 7, learn_cost => [],
      up_cost => [{23829, 50}], dayly_sq_exp => 12600,
      is_down => 0, is_break => 0};
get_skill_unique({69511, 46}) ->
    #{id => 69511, name => lang:get("圣光结界"), lev => 46,
      role_lev_limit => 106, classes => 7, learn_cost => [],
      up_cost => [{90055, 182320}], dayly_sq_exp => 12720,
      is_down => 1, is_break => 0};
get_skill_unique({69511, 47}) ->
    #{id => 69511, name => lang:get("圣光结界"), lev => 47,
      role_lev_limit => 107, classes => 7, learn_cost => [],
      up_cost => [{90055, 188320}], dayly_sq_exp => 12840,
      is_down => 1, is_break => 0};
get_skill_unique({69511, 48}) ->
    #{id => 69511, name => lang:get("圣光结界"), lev => 48,
      role_lev_limit => 108, classes => 7, learn_cost => [],
      up_cost => [{90055, 194400}], dayly_sq_exp => 12960,
      is_down => 1, is_break => 0};
get_skill_unique({69511, 49}) ->
    #{id => 69511, name => lang:get("圣光结界"), lev => 49,
      role_lev_limit => 109, classes => 7, learn_cost => [],
      up_cost => [{90055, 200560}], dayly_sq_exp => 13080,
      is_down => 1, is_break => 0};
get_skill_unique({69511, 50}) ->
    #{id => 69511, name => lang:get("圣光结界"), lev => 50,
      role_lev_limit => 110, classes => 7, learn_cost => [],
      up_cost => [{90055, 206800}], dayly_sq_exp => 15400,
      is_down => 1, is_break => 0};
get_skill_unique({69511, 51}) ->
    #{id => 69511, name => lang:get("圣光结界"), lev => 51,
      role_lev_limit => 111, classes => 7, learn_cost => [],
      up_cost => [{90055, 213120}], dayly_sq_exp => 15540,
      is_down => 1, is_break => 0};
get_skill_unique({69511, 52}) ->
    #{id => 69511, name => lang:get("圣光结界"), lev => 52,
      role_lev_limit => 112, classes => 7, learn_cost => [],
      up_cost => [{90055, 219520}], dayly_sq_exp => 15680,
      is_down => 1, is_break => 0};
get_skill_unique({69511, 53}) ->
    #{id => 69511, name => lang:get("圣光结界"), lev => 53,
      role_lev_limit => 113, classes => 7, learn_cost => [],
      up_cost => [{90055, 226000}], dayly_sq_exp => 15820,
      is_down => 1, is_break => 0};
get_skill_unique({69511, 54}) ->
    #{id => 69511, name => lang:get("圣光结界"), lev => 54,
      role_lev_limit => 114, classes => 7, learn_cost => [],
      up_cost => [{90055, 237120}], dayly_sq_exp => 15960,
      is_down => 1, is_break => 1};
get_skill_unique({69511, 55}) ->
    #{id => 69511, name => lang:get("圣光结界"), lev => 55,
      role_lev_limit => 115, classes => 7, learn_cost => [],
      up_cost => [{23829, 80}], dayly_sq_exp => 23000,
      is_down => 0, is_break => 0};
get_skill_unique({69511, 56}) ->
    #{id => 69511, name => lang:get("圣光结界"), lev => 56,
      role_lev_limit => 116, classes => 7, learn_cost => [],
      up_cost => [{90055, 259840}], dayly_sq_exp => 23200,
      is_down => 1, is_break => 0};
get_skill_unique({69511, 57}) ->
    #{id => 69511, name => lang:get("圣光结界"), lev => 57,
      role_lev_limit => 117, classes => 7, learn_cost => [],
      up_cost => [{90055, 271440}], dayly_sq_exp => 23400,
      is_down => 1, is_break => 0};
get_skill_unique({69511, 58}) ->
    #{id => 69511, name => lang:get("圣光结界"), lev => 58,
      role_lev_limit => 118, classes => 7, learn_cost => [],
      up_cost => [{90055, 283200}], dayly_sq_exp => 23600,
      is_down => 1, is_break => 0};
get_skill_unique({69511, 59}) ->
    #{id => 69511, name => lang:get("圣光结界"), lev => 59,
      role_lev_limit => 119, classes => 7, learn_cost => [],
      up_cost => [{90055, 295120}], dayly_sq_exp => 23800,
      is_down => 1, is_break => 0};
get_skill_unique({69511, 60}) ->
    #{id => 69511, name => lang:get("圣光结界"), lev => 60,
      role_lev_limit => 120, classes => 7, learn_cost => [],
      up_cost => [{90055, 307200}], dayly_sq_exp => 24000,
      is_down => 1, is_break => 0};
get_skill_unique({69511, 61}) ->
    #{id => 69511, name => lang:get("圣光结界"), lev => 61,
      role_lev_limit => 121, classes => 7, learn_cost => [],
      up_cost => [{90055, 304640}], dayly_sq_exp => 22080,
      is_down => 1, is_break => 0};
get_skill_unique({69511, 62}) ->
    #{id => 69511, name => lang:get("圣光结界"), lev => 62,
      role_lev_limit => 122, classes => 7, learn_cost => [],
      up_cost => [{90055, 326400}], dayly_sq_exp => 22160,
      is_down => 1, is_break => 0};
get_skill_unique({69511, 63}) ->
    #{id => 69511, name => lang:get("圣光结界"), lev => 63,
      role_lev_limit => 123, classes => 7, learn_cost => [],
      up_cost => [{90055, 348480}], dayly_sq_exp => 22240,
      is_down => 1, is_break => 0};
get_skill_unique({69511, 64}) ->
    #{id => 69511, name => lang:get("圣光结界"), lev => 64,
      role_lev_limit => 124, classes => 7, learn_cost => [],
      up_cost => [{90055, 370880}], dayly_sq_exp => 22320,
      is_down => 1, is_break => 1};
get_skill_unique({69511, 65}) ->
    #{id => 69511, name => lang:get("圣光结界"), lev => 65,
      role_lev_limit => 125, classes => 7, learn_cost => [],
      up_cost => [{23829, 120}], dayly_sq_exp => 22400,
      is_down => 0, is_break => 0};
get_skill_unique({69511, 66}) ->
    #{id => 69511, name => lang:get("圣光结界"), lev => 66,
      role_lev_limit => 126, classes => 7, learn_cost => [],
      up_cost => [{90055, 416640}], dayly_sq_exp => 22520,
      is_down => 1, is_break => 0};
get_skill_unique({69511, 67}) ->
    #{id => 69511, name => lang:get("圣光结界"), lev => 67,
      role_lev_limit => 127, classes => 7, learn_cost => [],
      up_cost => [{90055, 440000}], dayly_sq_exp => 22640,
      is_down => 1, is_break => 0};
get_skill_unique({69511, 68}) ->
    #{id => 69511, name => lang:get("圣光结界"), lev => 68,
      role_lev_limit => 128, classes => 7, learn_cost => [],
      up_cost => [{90055, 463680}], dayly_sq_exp => 22760,
      is_down => 1, is_break => 0};
get_skill_unique({69511, 69}) ->
    #{id => 69511, name => lang:get("圣光结界"), lev => 69,
      role_lev_limit => 129, classes => 7, learn_cost => [],
      up_cost => [{90055, 487680}], dayly_sq_exp => 22880,
      is_down => 1, is_break => 0};
get_skill_unique({69511, 70}) ->
    #{id => 69511, name => lang:get("圣光结界"), lev => 70,
      role_lev_limit => 130, classes => 7, learn_cost => [],
      up_cost => [{90055, 512000}], dayly_sq_exp => 23000,
      is_down => 1, is_break => 0};
get_skill_unique(_) -> false.

get_combat_exp({8, 130}) ->
    #{combat_type => 8, lev => 130, limit => 0,
      sq_exp => 240, sq_exp_total => 12000};
get_combat_exp({8, 129}) ->
    #{combat_type => 8, lev => 129, limit => 0,
      sq_exp => 240, sq_exp_total => 12000};
get_combat_exp({8, 128}) ->
    #{combat_type => 8, lev => 128, limit => 0,
      sq_exp => 240, sq_exp_total => 12000};
get_combat_exp({8, 127}) ->
    #{combat_type => 8, lev => 127, limit => 0,
      sq_exp => 240, sq_exp_total => 12000};
get_combat_exp({8, 126}) ->
    #{combat_type => 8, lev => 126, limit => 0,
      sq_exp => 240, sq_exp_total => 12000};
get_combat_exp({8, 125}) ->
    #{combat_type => 8, lev => 125, limit => 0,
      sq_exp => 240, sq_exp_total => 12000};
get_combat_exp({8, 124}) ->
    #{combat_type => 8, lev => 124, limit => 0,
      sq_exp => 240, sq_exp_total => 12000};
get_combat_exp({8, 123}) ->
    #{combat_type => 8, lev => 123, limit => 0,
      sq_exp => 240, sq_exp_total => 12000};
get_combat_exp({8, 122}) ->
    #{combat_type => 8, lev => 122, limit => 0,
      sq_exp => 240, sq_exp_total => 12000};
get_combat_exp({8, 121}) ->
    #{combat_type => 8, lev => 121, limit => 0,
      sq_exp => 240, sq_exp_total => 12000};
get_combat_exp({8, 120}) ->
    #{combat_type => 8, lev => 120, limit => 0,
      sq_exp => 240, sq_exp_total => 12000};
get_combat_exp({8, 119}) ->
    #{combat_type => 8, lev => 119, limit => 0,
      sq_exp => 238, sq_exp_total => 11900};
get_combat_exp({8, 118}) ->
    #{combat_type => 8, lev => 118, limit => 0,
      sq_exp => 236, sq_exp_total => 11800};
get_combat_exp({8, 117}) ->
    #{combat_type => 8, lev => 117, limit => 0,
      sq_exp => 234, sq_exp_total => 11700};
get_combat_exp({8, 116}) ->
    #{combat_type => 8, lev => 116, limit => 0,
      sq_exp => 232, sq_exp_total => 11600};
get_combat_exp({8, 115}) ->
    #{combat_type => 8, lev => 115, limit => 0,
      sq_exp => 230, sq_exp_total => 11500};
get_combat_exp({8, 114}) ->
    #{combat_type => 8, lev => 114, limit => 0,
      sq_exp => 228, sq_exp_total => 11400};
get_combat_exp({8, 113}) ->
    #{combat_type => 8, lev => 113, limit => 0,
      sq_exp => 226, sq_exp_total => 11300};
get_combat_exp({8, 112}) ->
    #{combat_type => 8, lev => 112, limit => 0,
      sq_exp => 224, sq_exp_total => 11200};
get_combat_exp({8, 111}) ->
    #{combat_type => 8, lev => 111, limit => 0,
      sq_exp => 222, sq_exp_total => 11100};
get_combat_exp({8, 110}) ->
    #{combat_type => 8, lev => 110, limit => 0,
      sq_exp => 220, sq_exp_total => 11000};
get_combat_exp({8, 109}) ->
    #{combat_type => 8, lev => 109, limit => 0,
      sq_exp => 218, sq_exp_total => 10900};
get_combat_exp({8, 108}) ->
    #{combat_type => 8, lev => 108, limit => 0,
      sq_exp => 216, sq_exp_total => 10800};
get_combat_exp({8, 107}) ->
    #{combat_type => 8, lev => 107, limit => 0,
      sq_exp => 214, sq_exp_total => 10700};
get_combat_exp({8, 106}) ->
    #{combat_type => 8, lev => 106, limit => 0,
      sq_exp => 212, sq_exp_total => 10600};
get_combat_exp({8, 105}) ->
    #{combat_type => 8, lev => 105, limit => 0,
      sq_exp => 210, sq_exp_total => 10500};
get_combat_exp({8, 104}) ->
    #{combat_type => 8, lev => 104, limit => 0,
      sq_exp => 208, sq_exp_total => 10400};
get_combat_exp({8, 103}) ->
    #{combat_type => 8, lev => 103, limit => 0,
      sq_exp => 206, sq_exp_total => 10300};
get_combat_exp({8, 102}) ->
    #{combat_type => 8, lev => 102, limit => 0,
      sq_exp => 204, sq_exp_total => 10200};
get_combat_exp({8, 101}) ->
    #{combat_type => 8, lev => 101, limit => 0,
      sq_exp => 202, sq_exp_total => 10100};
get_combat_exp({8, 100}) ->
    #{combat_type => 8, lev => 100, limit => 0,
      sq_exp => 200, sq_exp_total => 10000};
get_combat_exp({8, 99}) ->
    #{combat_type => 8, lev => 99, limit => 0,
      sq_exp => 198, sq_exp_total => 9900};
get_combat_exp({8, 98}) ->
    #{combat_type => 8, lev => 98, limit => 0,
      sq_exp => 196, sq_exp_total => 9800};
get_combat_exp({8, 97}) ->
    #{combat_type => 8, lev => 97, limit => 0,
      sq_exp => 194, sq_exp_total => 9700};
get_combat_exp({8, 96}) ->
    #{combat_type => 8, lev => 96, limit => 0,
      sq_exp => 192, sq_exp_total => 9600};
get_combat_exp({8, 95}) ->
    #{combat_type => 8, lev => 95, limit => 0,
      sq_exp => 190, sq_exp_total => 9500};
get_combat_exp({8, 94}) ->
    #{combat_type => 8, lev => 94, limit => 0,
      sq_exp => 188, sq_exp_total => 9400};
get_combat_exp({8, 93}) ->
    #{combat_type => 8, lev => 93, limit => 0,
      sq_exp => 186, sq_exp_total => 9300};
get_combat_exp({8, 92}) ->
    #{combat_type => 8, lev => 92, limit => 0,
      sq_exp => 184, sq_exp_total => 9200};
get_combat_exp({8, 91}) ->
    #{combat_type => 8, lev => 91, limit => 0,
      sq_exp => 182, sq_exp_total => 9100};
get_combat_exp({8, 90}) ->
    #{combat_type => 8, lev => 90, limit => 0,
      sq_exp => 180, sq_exp_total => 9000};
get_combat_exp({105, 130}) ->
    #{combat_type => 105, lev => 130, limit => 3,
      sq_exp => 2400, sq_exp_total => 0};
get_combat_exp({105, 129}) ->
    #{combat_type => 105, lev => 129, limit => 3,
      sq_exp => 2400, sq_exp_total => 0};
get_combat_exp({105, 128}) ->
    #{combat_type => 105, lev => 128, limit => 3,
      sq_exp => 2400, sq_exp_total => 0};
get_combat_exp({105, 127}) ->
    #{combat_type => 105, lev => 127, limit => 3,
      sq_exp => 2400, sq_exp_total => 0};
get_combat_exp({105, 126}) ->
    #{combat_type => 105, lev => 126, limit => 3,
      sq_exp => 2400, sq_exp_total => 0};
get_combat_exp({105, 125}) ->
    #{combat_type => 105, lev => 125, limit => 3,
      sq_exp => 2400, sq_exp_total => 0};
get_combat_exp({105, 124}) ->
    #{combat_type => 105, lev => 124, limit => 3,
      sq_exp => 2400, sq_exp_total => 0};
get_combat_exp({105, 123}) ->
    #{combat_type => 105, lev => 123, limit => 3,
      sq_exp => 2400, sq_exp_total => 0};
get_combat_exp({105, 122}) ->
    #{combat_type => 105, lev => 122, limit => 3,
      sq_exp => 2400, sq_exp_total => 0};
get_combat_exp({105, 121}) ->
    #{combat_type => 105, lev => 121, limit => 3,
      sq_exp => 2400, sq_exp_total => 0};
get_combat_exp({105, 120}) ->
    #{combat_type => 105, lev => 120, limit => 3,
      sq_exp => 2400, sq_exp_total => 0};
get_combat_exp({105, 119}) ->
    #{combat_type => 105, lev => 119, limit => 3,
      sq_exp => 2380, sq_exp_total => 0};
get_combat_exp({105, 118}) ->
    #{combat_type => 105, lev => 118, limit => 3,
      sq_exp => 2360, sq_exp_total => 0};
get_combat_exp({105, 117}) ->
    #{combat_type => 105, lev => 117, limit => 3,
      sq_exp => 2340, sq_exp_total => 0};
get_combat_exp({105, 116}) ->
    #{combat_type => 105, lev => 116, limit => 3,
      sq_exp => 2320, sq_exp_total => 0};
get_combat_exp({105, 115}) ->
    #{combat_type => 105, lev => 115, limit => 3,
      sq_exp => 2300, sq_exp_total => 0};
get_combat_exp({105, 114}) ->
    #{combat_type => 105, lev => 114, limit => 3,
      sq_exp => 2280, sq_exp_total => 0};
get_combat_exp({105, 113}) ->
    #{combat_type => 105, lev => 113, limit => 3,
      sq_exp => 2260, sq_exp_total => 0};
get_combat_exp({105, 112}) ->
    #{combat_type => 105, lev => 112, limit => 3,
      sq_exp => 2240, sq_exp_total => 0};
get_combat_exp({105, 111}) ->
    #{combat_type => 105, lev => 111, limit => 3,
      sq_exp => 2220, sq_exp_total => 0};
get_combat_exp({105, 110}) ->
    #{combat_type => 105, lev => 110, limit => 3,
      sq_exp => 2200, sq_exp_total => 0};
get_combat_exp({105, 109}) ->
    #{combat_type => 105, lev => 109, limit => 3,
      sq_exp => 2180, sq_exp_total => 0};
get_combat_exp({105, 108}) ->
    #{combat_type => 105, lev => 108, limit => 3,
      sq_exp => 2160, sq_exp_total => 0};
get_combat_exp({105, 107}) ->
    #{combat_type => 105, lev => 107, limit => 3,
      sq_exp => 2140, sq_exp_total => 0};
get_combat_exp({105, 106}) ->
    #{combat_type => 105, lev => 106, limit => 3,
      sq_exp => 2120, sq_exp_total => 0};
get_combat_exp({105, 105}) ->
    #{combat_type => 105, lev => 105, limit => 3,
      sq_exp => 2100, sq_exp_total => 0};
get_combat_exp({105, 104}) ->
    #{combat_type => 105, lev => 104, limit => 3,
      sq_exp => 2080, sq_exp_total => 0};
get_combat_exp({105, 103}) ->
    #{combat_type => 105, lev => 103, limit => 3,
      sq_exp => 2060, sq_exp_total => 0};
get_combat_exp({105, 102}) ->
    #{combat_type => 105, lev => 102, limit => 3,
      sq_exp => 2040, sq_exp_total => 0};
get_combat_exp({105, 101}) ->
    #{combat_type => 105, lev => 101, limit => 3,
      sq_exp => 2020, sq_exp_total => 0};
get_combat_exp({105, 100}) ->
    #{combat_type => 105, lev => 100, limit => 3,
      sq_exp => 2000, sq_exp_total => 0};
get_combat_exp({105, 99}) ->
    #{combat_type => 105, lev => 99, limit => 3,
      sq_exp => 1980, sq_exp_total => 0};
get_combat_exp({105, 98}) ->
    #{combat_type => 105, lev => 98, limit => 3,
      sq_exp => 1960, sq_exp_total => 0};
get_combat_exp({105, 97}) ->
    #{combat_type => 105, lev => 97, limit => 3,
      sq_exp => 1940, sq_exp_total => 0};
get_combat_exp({105, 96}) ->
    #{combat_type => 105, lev => 96, limit => 3,
      sq_exp => 1920, sq_exp_total => 0};
get_combat_exp({105, 95}) ->
    #{combat_type => 105, lev => 95, limit => 3,
      sq_exp => 1900, sq_exp_total => 0};
get_combat_exp({105, 94}) ->
    #{combat_type => 105, lev => 94, limit => 3,
      sq_exp => 1880, sq_exp_total => 0};
get_combat_exp({105, 93}) ->
    #{combat_type => 105, lev => 93, limit => 3,
      sq_exp => 1860, sq_exp_total => 0};
get_combat_exp({105, 92}) ->
    #{combat_type => 105, lev => 92, limit => 3,
      sq_exp => 1840, sq_exp_total => 0};
get_combat_exp({105, 91}) ->
    #{combat_type => 105, lev => 91, limit => 3,
      sq_exp => 1820, sq_exp_total => 0};
get_combat_exp({105, 90}) ->
    #{combat_type => 105, lev => 90, limit => 3,
      sq_exp => 1800, sq_exp_total => 0};
get_combat_exp({40, 130}) ->
    #{combat_type => 40, lev => 130, limit => 99,
      sq_exp => 2400, sq_exp_total => 0};
get_combat_exp({40, 129}) ->
    #{combat_type => 40, lev => 129, limit => 99,
      sq_exp => 2400, sq_exp_total => 0};
get_combat_exp({40, 128}) ->
    #{combat_type => 40, lev => 128, limit => 99,
      sq_exp => 2400, sq_exp_total => 0};
get_combat_exp({40, 127}) ->
    #{combat_type => 40, lev => 127, limit => 99,
      sq_exp => 2400, sq_exp_total => 0};
get_combat_exp({40, 126}) ->
    #{combat_type => 40, lev => 126, limit => 99,
      sq_exp => 2400, sq_exp_total => 0};
get_combat_exp({40, 125}) ->
    #{combat_type => 40, lev => 125, limit => 99,
      sq_exp => 2400, sq_exp_total => 0};
get_combat_exp({40, 124}) ->
    #{combat_type => 40, lev => 124, limit => 99,
      sq_exp => 2400, sq_exp_total => 0};
get_combat_exp({40, 123}) ->
    #{combat_type => 40, lev => 123, limit => 99,
      sq_exp => 2400, sq_exp_total => 0};
get_combat_exp({40, 122}) ->
    #{combat_type => 40, lev => 122, limit => 99,
      sq_exp => 2400, sq_exp_total => 0};
get_combat_exp({40, 121}) ->
    #{combat_type => 40, lev => 121, limit => 99,
      sq_exp => 2400, sq_exp_total => 0};
get_combat_exp({40, 120}) ->
    #{combat_type => 40, lev => 120, limit => 99,
      sq_exp => 2400, sq_exp_total => 0};
get_combat_exp({40, 119}) ->
    #{combat_type => 40, lev => 119, limit => 99,
      sq_exp => 2380, sq_exp_total => 0};
get_combat_exp({40, 118}) ->
    #{combat_type => 40, lev => 118, limit => 99,
      sq_exp => 2360, sq_exp_total => 0};
get_combat_exp({40, 117}) ->
    #{combat_type => 40, lev => 117, limit => 99,
      sq_exp => 2340, sq_exp_total => 0};
get_combat_exp({40, 116}) ->
    #{combat_type => 40, lev => 116, limit => 99,
      sq_exp => 2320, sq_exp_total => 0};
get_combat_exp({40, 115}) ->
    #{combat_type => 40, lev => 115, limit => 99,
      sq_exp => 2300, sq_exp_total => 0};
get_combat_exp({40, 114}) ->
    #{combat_type => 40, lev => 114, limit => 99,
      sq_exp => 2280, sq_exp_total => 0};
get_combat_exp({40, 113}) ->
    #{combat_type => 40, lev => 113, limit => 99,
      sq_exp => 2260, sq_exp_total => 0};
get_combat_exp({40, 112}) ->
    #{combat_type => 40, lev => 112, limit => 99,
      sq_exp => 2240, sq_exp_total => 0};
get_combat_exp({40, 111}) ->
    #{combat_type => 40, lev => 111, limit => 99,
      sq_exp => 2220, sq_exp_total => 0};
get_combat_exp({40, 110}) ->
    #{combat_type => 40, lev => 110, limit => 99,
      sq_exp => 2200, sq_exp_total => 0};
get_combat_exp({40, 109}) ->
    #{combat_type => 40, lev => 109, limit => 99,
      sq_exp => 2180, sq_exp_total => 0};
get_combat_exp({40, 108}) ->
    #{combat_type => 40, lev => 108, limit => 99,
      sq_exp => 2160, sq_exp_total => 0};
get_combat_exp({40, 107}) ->
    #{combat_type => 40, lev => 107, limit => 99,
      sq_exp => 2140, sq_exp_total => 0};
get_combat_exp({40, 106}) ->
    #{combat_type => 40, lev => 106, limit => 99,
      sq_exp => 2120, sq_exp_total => 0};
get_combat_exp({40, 105}) ->
    #{combat_type => 40, lev => 105, limit => 99,
      sq_exp => 2100, sq_exp_total => 0};
get_combat_exp({40, 104}) ->
    #{combat_type => 40, lev => 104, limit => 99,
      sq_exp => 2080, sq_exp_total => 0};
get_combat_exp({40, 103}) ->
    #{combat_type => 40, lev => 103, limit => 99,
      sq_exp => 2060, sq_exp_total => 0};
get_combat_exp({40, 102}) ->
    #{combat_type => 40, lev => 102, limit => 99,
      sq_exp => 2040, sq_exp_total => 0};
get_combat_exp({40, 101}) ->
    #{combat_type => 40, lev => 101, limit => 99,
      sq_exp => 2020, sq_exp_total => 0};
get_combat_exp({40, 100}) ->
    #{combat_type => 40, lev => 100, limit => 99,
      sq_exp => 2000, sq_exp_total => 0};
get_combat_exp({40, 99}) ->
    #{combat_type => 40, lev => 99, limit => 99,
      sq_exp => 1980, sq_exp_total => 0};
get_combat_exp({40, 98}) ->
    #{combat_type => 40, lev => 98, limit => 99,
      sq_exp => 1960, sq_exp_total => 0};
get_combat_exp({40, 97}) ->
    #{combat_type => 40, lev => 97, limit => 99,
      sq_exp => 1940, sq_exp_total => 0};
get_combat_exp({40, 96}) ->
    #{combat_type => 40, lev => 96, limit => 99,
      sq_exp => 1920, sq_exp_total => 0};
get_combat_exp({40, 95}) ->
    #{combat_type => 40, lev => 95, limit => 99,
      sq_exp => 1900, sq_exp_total => 0};
get_combat_exp({40, 94}) ->
    #{combat_type => 40, lev => 94, limit => 99,
      sq_exp => 1880, sq_exp_total => 0};
get_combat_exp({40, 93}) ->
    #{combat_type => 40, lev => 93, limit => 99,
      sq_exp => 1860, sq_exp_total => 0};
get_combat_exp({40, 92}) ->
    #{combat_type => 40, lev => 92, limit => 99,
      sq_exp => 1840, sq_exp_total => 0};
get_combat_exp({40, 91}) ->
    #{combat_type => 40, lev => 91, limit => 99,
      sq_exp => 1820, sq_exp_total => 0};
get_combat_exp({40, 90}) ->
    #{combat_type => 40, lev => 90, limit => 99,
      sq_exp => 1800, sq_exp_total => 0};
get_combat_exp({112, 130}) ->
    #{combat_type => 112, lev => 130, limit => 2,
      sq_exp => 1200, sq_exp_total => 0};
get_combat_exp({112, 129}) ->
    #{combat_type => 112, lev => 129, limit => 2,
      sq_exp => 1200, sq_exp_total => 0};
get_combat_exp({112, 128}) ->
    #{combat_type => 112, lev => 128, limit => 2,
      sq_exp => 1200, sq_exp_total => 0};
get_combat_exp({112, 127}) ->
    #{combat_type => 112, lev => 127, limit => 2,
      sq_exp => 1200, sq_exp_total => 0};
get_combat_exp({112, 126}) ->
    #{combat_type => 112, lev => 126, limit => 2,
      sq_exp => 1200, sq_exp_total => 0};
get_combat_exp({112, 125}) ->
    #{combat_type => 112, lev => 125, limit => 2,
      sq_exp => 1200, sq_exp_total => 0};
get_combat_exp({112, 124}) ->
    #{combat_type => 112, lev => 124, limit => 2,
      sq_exp => 1200, sq_exp_total => 0};
get_combat_exp({112, 123}) ->
    #{combat_type => 112, lev => 123, limit => 2,
      sq_exp => 1200, sq_exp_total => 0};
get_combat_exp({112, 122}) ->
    #{combat_type => 112, lev => 122, limit => 2,
      sq_exp => 1200, sq_exp_total => 0};
get_combat_exp({112, 121}) ->
    #{combat_type => 112, lev => 121, limit => 2,
      sq_exp => 1200, sq_exp_total => 0};
get_combat_exp({112, 120}) ->
    #{combat_type => 112, lev => 120, limit => 2,
      sq_exp => 1200, sq_exp_total => 0};
get_combat_exp({112, 119}) ->
    #{combat_type => 112, lev => 119, limit => 2,
      sq_exp => 1190, sq_exp_total => 0};
get_combat_exp({112, 118}) ->
    #{combat_type => 112, lev => 118, limit => 2,
      sq_exp => 1180, sq_exp_total => 0};
get_combat_exp({112, 117}) ->
    #{combat_type => 112, lev => 117, limit => 2,
      sq_exp => 1170, sq_exp_total => 0};
get_combat_exp({112, 116}) ->
    #{combat_type => 112, lev => 116, limit => 2,
      sq_exp => 1160, sq_exp_total => 0};
get_combat_exp({112, 115}) ->
    #{combat_type => 112, lev => 115, limit => 2,
      sq_exp => 1150, sq_exp_total => 0};
get_combat_exp({112, 114}) ->
    #{combat_type => 112, lev => 114, limit => 2,
      sq_exp => 1140, sq_exp_total => 0};
get_combat_exp({112, 113}) ->
    #{combat_type => 112, lev => 113, limit => 2,
      sq_exp => 1130, sq_exp_total => 0};
get_combat_exp({112, 112}) ->
    #{combat_type => 112, lev => 112, limit => 2,
      sq_exp => 1120, sq_exp_total => 0};
get_combat_exp({112, 111}) ->
    #{combat_type => 112, lev => 111, limit => 2,
      sq_exp => 1110, sq_exp_total => 0};
get_combat_exp({112, 110}) ->
    #{combat_type => 112, lev => 110, limit => 2,
      sq_exp => 1100, sq_exp_total => 0};
get_combat_exp({112, 109}) ->
    #{combat_type => 112, lev => 109, limit => 2,
      sq_exp => 1090, sq_exp_total => 0};
get_combat_exp({112, 108}) ->
    #{combat_type => 112, lev => 108, limit => 2,
      sq_exp => 1080, sq_exp_total => 0};
get_combat_exp({112, 107}) ->
    #{combat_type => 112, lev => 107, limit => 2,
      sq_exp => 1070, sq_exp_total => 0};
get_combat_exp({112, 106}) ->
    #{combat_type => 112, lev => 106, limit => 2,
      sq_exp => 1060, sq_exp_total => 0};
get_combat_exp({112, 105}) ->
    #{combat_type => 112, lev => 105, limit => 2,
      sq_exp => 1050, sq_exp_total => 0};
get_combat_exp({112, 104}) ->
    #{combat_type => 112, lev => 104, limit => 2,
      sq_exp => 1040, sq_exp_total => 0};
get_combat_exp({112, 103}) ->
    #{combat_type => 112, lev => 103, limit => 2,
      sq_exp => 1030, sq_exp_total => 0};
get_combat_exp({112, 102}) ->
    #{combat_type => 112, lev => 102, limit => 2,
      sq_exp => 1020, sq_exp_total => 0};
get_combat_exp({112, 101}) ->
    #{combat_type => 112, lev => 101, limit => 2,
      sq_exp => 1010, sq_exp_total => 0};
get_combat_exp({112, 100}) ->
    #{combat_type => 112, lev => 100, limit => 2,
      sq_exp => 1000, sq_exp_total => 0};
get_combat_exp({112, 99}) ->
    #{combat_type => 112, lev => 99, limit => 2,
      sq_exp => 990, sq_exp_total => 0};
get_combat_exp({112, 98}) ->
    #{combat_type => 112, lev => 98, limit => 2,
      sq_exp => 980, sq_exp_total => 0};
get_combat_exp({112, 97}) ->
    #{combat_type => 112, lev => 97, limit => 2,
      sq_exp => 970, sq_exp_total => 0};
get_combat_exp({112, 96}) ->
    #{combat_type => 112, lev => 96, limit => 2,
      sq_exp => 960, sq_exp_total => 0};
get_combat_exp({112, 95}) ->
    #{combat_type => 112, lev => 95, limit => 2,
      sq_exp => 950, sq_exp_total => 0};
get_combat_exp({112, 94}) ->
    #{combat_type => 112, lev => 94, limit => 2,
      sq_exp => 940, sq_exp_total => 0};
get_combat_exp({112, 93}) ->
    #{combat_type => 112, lev => 93, limit => 2,
      sq_exp => 930, sq_exp_total => 0};
get_combat_exp({112, 92}) ->
    #{combat_type => 112, lev => 92, limit => 2,
      sq_exp => 920, sq_exp_total => 0};
get_combat_exp({112, 91}) ->
    #{combat_type => 112, lev => 91, limit => 2,
      sq_exp => 910, sq_exp_total => 0};
get_combat_exp({112, 90}) ->
    #{combat_type => 112, lev => 90, limit => 2,
      sq_exp => 900, sq_exp_total => 0};
get_combat_exp({114, 130}) ->
    #{combat_type => 114, lev => 130, limit => 3,
      sq_exp => 3000, sq_exp_total => 0};
get_combat_exp({114, 129}) ->
    #{combat_type => 114, lev => 129, limit => 3,
      sq_exp => 3000, sq_exp_total => 0};
get_combat_exp({114, 128}) ->
    #{combat_type => 114, lev => 128, limit => 3,
      sq_exp => 3000, sq_exp_total => 0};
get_combat_exp({114, 127}) ->
    #{combat_type => 114, lev => 127, limit => 3,
      sq_exp => 3000, sq_exp_total => 0};
get_combat_exp({114, 126}) ->
    #{combat_type => 114, lev => 126, limit => 3,
      sq_exp => 3000, sq_exp_total => 0};
get_combat_exp({114, 125}) ->
    #{combat_type => 114, lev => 125, limit => 3,
      sq_exp => 3000, sq_exp_total => 0};
get_combat_exp({114, 124}) ->
    #{combat_type => 114, lev => 124, limit => 3,
      sq_exp => 3000, sq_exp_total => 0};
get_combat_exp({114, 123}) ->
    #{combat_type => 114, lev => 123, limit => 3,
      sq_exp => 3000, sq_exp_total => 0};
get_combat_exp({114, 122}) ->
    #{combat_type => 114, lev => 122, limit => 3,
      sq_exp => 3000, sq_exp_total => 0};
get_combat_exp({114, 121}) ->
    #{combat_type => 114, lev => 121, limit => 3,
      sq_exp => 3000, sq_exp_total => 0};
get_combat_exp({114, 120}) ->
    #{combat_type => 114, lev => 120, limit => 3,
      sq_exp => 3000, sq_exp_total => 0};
get_combat_exp({114, 119}) ->
    #{combat_type => 114, lev => 119, limit => 3,
      sq_exp => 2975, sq_exp_total => 0};
get_combat_exp({114, 118}) ->
    #{combat_type => 114, lev => 118, limit => 3,
      sq_exp => 2950, sq_exp_total => 0};
get_combat_exp({114, 117}) ->
    #{combat_type => 114, lev => 117, limit => 3,
      sq_exp => 2925, sq_exp_total => 0};
get_combat_exp({114, 116}) ->
    #{combat_type => 114, lev => 116, limit => 3,
      sq_exp => 2900, sq_exp_total => 0};
get_combat_exp({114, 115}) ->
    #{combat_type => 114, lev => 115, limit => 3,
      sq_exp => 2875, sq_exp_total => 0};
get_combat_exp({114, 114}) ->
    #{combat_type => 114, lev => 114, limit => 3,
      sq_exp => 2850, sq_exp_total => 0};
get_combat_exp({114, 113}) ->
    #{combat_type => 114, lev => 113, limit => 3,
      sq_exp => 2825, sq_exp_total => 0};
get_combat_exp({114, 112}) ->
    #{combat_type => 114, lev => 112, limit => 3,
      sq_exp => 2800, sq_exp_total => 0};
get_combat_exp({114, 111}) ->
    #{combat_type => 114, lev => 111, limit => 3,
      sq_exp => 2775, sq_exp_total => 0};
get_combat_exp({114, 110}) ->
    #{combat_type => 114, lev => 110, limit => 3,
      sq_exp => 2750, sq_exp_total => 0};
get_combat_exp({114, 109}) ->
    #{combat_type => 114, lev => 109, limit => 3,
      sq_exp => 2725, sq_exp_total => 0};
get_combat_exp({114, 108}) ->
    #{combat_type => 114, lev => 108, limit => 3,
      sq_exp => 2700, sq_exp_total => 0};
get_combat_exp({114, 107}) ->
    #{combat_type => 114, lev => 107, limit => 3,
      sq_exp => 2675, sq_exp_total => 0};
get_combat_exp({114, 106}) ->
    #{combat_type => 114, lev => 106, limit => 3,
      sq_exp => 2650, sq_exp_total => 0};
get_combat_exp({114, 105}) ->
    #{combat_type => 114, lev => 105, limit => 3,
      sq_exp => 2625, sq_exp_total => 0};
get_combat_exp({114, 104}) ->
    #{combat_type => 114, lev => 104, limit => 3,
      sq_exp => 2600, sq_exp_total => 0};
get_combat_exp({114, 103}) ->
    #{combat_type => 114, lev => 103, limit => 3,
      sq_exp => 2575, sq_exp_total => 0};
get_combat_exp({114, 102}) ->
    #{combat_type => 114, lev => 102, limit => 3,
      sq_exp => 2550, sq_exp_total => 0};
get_combat_exp({114, 101}) ->
    #{combat_type => 114, lev => 101, limit => 3,
      sq_exp => 2525, sq_exp_total => 0};
get_combat_exp({114, 100}) ->
    #{combat_type => 114, lev => 100, limit => 3,
      sq_exp => 2500, sq_exp_total => 0};
get_combat_exp({114, 99}) ->
    #{combat_type => 114, lev => 99, limit => 3,
      sq_exp => 2475, sq_exp_total => 0};
get_combat_exp({114, 98}) ->
    #{combat_type => 114, lev => 98, limit => 3,
      sq_exp => 2450, sq_exp_total => 0};
get_combat_exp({114, 97}) ->
    #{combat_type => 114, lev => 97, limit => 3,
      sq_exp => 2425, sq_exp_total => 0};
get_combat_exp({114, 96}) ->
    #{combat_type => 114, lev => 96, limit => 3,
      sq_exp => 2400, sq_exp_total => 0};
get_combat_exp({114, 95}) ->
    #{combat_type => 114, lev => 95, limit => 3,
      sq_exp => 2375, sq_exp_total => 0};
get_combat_exp({114, 94}) ->
    #{combat_type => 114, lev => 94, limit => 3,
      sq_exp => 2350, sq_exp_total => 0};
get_combat_exp({114, 93}) ->
    #{combat_type => 114, lev => 93, limit => 3,
      sq_exp => 2325, sq_exp_total => 0};
get_combat_exp({114, 92}) ->
    #{combat_type => 114, lev => 92, limit => 3,
      sq_exp => 2300, sq_exp_total => 0};
get_combat_exp({114, 91}) ->
    #{combat_type => 114, lev => 91, limit => 3,
      sq_exp => 2275, sq_exp_total => 0};
get_combat_exp({114, 90}) ->
    #{combat_type => 114, lev => 90, limit => 3,
      sq_exp => 2250, sq_exp_total => 0};
get_combat_exp({26, 130}) ->
    #{combat_type => 26, lev => 130, limit => 3,
      sq_exp => 1200, sq_exp_total => 0};
get_combat_exp({26, 129}) ->
    #{combat_type => 26, lev => 129, limit => 3,
      sq_exp => 1200, sq_exp_total => 0};
get_combat_exp({26, 128}) ->
    #{combat_type => 26, lev => 128, limit => 3,
      sq_exp => 1200, sq_exp_total => 0};
get_combat_exp({26, 127}) ->
    #{combat_type => 26, lev => 127, limit => 3,
      sq_exp => 1200, sq_exp_total => 0};
get_combat_exp({26, 126}) ->
    #{combat_type => 26, lev => 126, limit => 3,
      sq_exp => 1200, sq_exp_total => 0};
get_combat_exp({26, 125}) ->
    #{combat_type => 26, lev => 125, limit => 3,
      sq_exp => 1200, sq_exp_total => 0};
get_combat_exp({26, 124}) ->
    #{combat_type => 26, lev => 124, limit => 3,
      sq_exp => 1200, sq_exp_total => 0};
get_combat_exp({26, 123}) ->
    #{combat_type => 26, lev => 123, limit => 3,
      sq_exp => 1200, sq_exp_total => 0};
get_combat_exp({26, 122}) ->
    #{combat_type => 26, lev => 122, limit => 3,
      sq_exp => 1200, sq_exp_total => 0};
get_combat_exp({26, 121}) ->
    #{combat_type => 26, lev => 121, limit => 3,
      sq_exp => 1200, sq_exp_total => 0};
get_combat_exp({26, 120}) ->
    #{combat_type => 26, lev => 120, limit => 3,
      sq_exp => 1200, sq_exp_total => 0};
get_combat_exp({26, 119}) ->
    #{combat_type => 26, lev => 119, limit => 3,
      sq_exp => 1190, sq_exp_total => 0};
get_combat_exp({26, 118}) ->
    #{combat_type => 26, lev => 118, limit => 3,
      sq_exp => 1180, sq_exp_total => 0};
get_combat_exp({26, 117}) ->
    #{combat_type => 26, lev => 117, limit => 3,
      sq_exp => 1170, sq_exp_total => 0};
get_combat_exp({26, 116}) ->
    #{combat_type => 26, lev => 116, limit => 3,
      sq_exp => 1160, sq_exp_total => 0};
get_combat_exp({26, 115}) ->
    #{combat_type => 26, lev => 115, limit => 3,
      sq_exp => 1150, sq_exp_total => 0};
get_combat_exp({26, 114}) ->
    #{combat_type => 26, lev => 114, limit => 3,
      sq_exp => 1140, sq_exp_total => 0};
get_combat_exp({26, 113}) ->
    #{combat_type => 26, lev => 113, limit => 3,
      sq_exp => 1130, sq_exp_total => 0};
get_combat_exp({26, 112}) ->
    #{combat_type => 26, lev => 112, limit => 3,
      sq_exp => 1120, sq_exp_total => 0};
get_combat_exp({26, 111}) ->
    #{combat_type => 26, lev => 111, limit => 3,
      sq_exp => 1110, sq_exp_total => 0};
get_combat_exp({26, 110}) ->
    #{combat_type => 26, lev => 110, limit => 3,
      sq_exp => 1100, sq_exp_total => 0};
get_combat_exp({26, 109}) ->
    #{combat_type => 26, lev => 109, limit => 3,
      sq_exp => 1090, sq_exp_total => 0};
get_combat_exp({26, 108}) ->
    #{combat_type => 26, lev => 108, limit => 3,
      sq_exp => 1080, sq_exp_total => 0};
get_combat_exp({26, 107}) ->
    #{combat_type => 26, lev => 107, limit => 3,
      sq_exp => 1070, sq_exp_total => 0};
get_combat_exp({26, 106}) ->
    #{combat_type => 26, lev => 106, limit => 3,
      sq_exp => 1060, sq_exp_total => 0};
get_combat_exp({26, 105}) ->
    #{combat_type => 26, lev => 105, limit => 3,
      sq_exp => 1050, sq_exp_total => 0};
get_combat_exp({26, 104}) ->
    #{combat_type => 26, lev => 104, limit => 3,
      sq_exp => 1040, sq_exp_total => 0};
get_combat_exp({26, 103}) ->
    #{combat_type => 26, lev => 103, limit => 3,
      sq_exp => 1030, sq_exp_total => 0};
get_combat_exp({26, 102}) ->
    #{combat_type => 26, lev => 102, limit => 3,
      sq_exp => 1020, sq_exp_total => 0};
get_combat_exp({26, 101}) ->
    #{combat_type => 26, lev => 101, limit => 3,
      sq_exp => 1010, sq_exp_total => 0};
get_combat_exp({26, 100}) ->
    #{combat_type => 26, lev => 100, limit => 3,
      sq_exp => 1000, sq_exp_total => 0};
get_combat_exp({26, 99}) ->
    #{combat_type => 26, lev => 99, limit => 3,
      sq_exp => 990, sq_exp_total => 0};
get_combat_exp({26, 98}) ->
    #{combat_type => 26, lev => 98, limit => 3,
      sq_exp => 980, sq_exp_total => 0};
get_combat_exp({26, 97}) ->
    #{combat_type => 26, lev => 97, limit => 3,
      sq_exp => 970, sq_exp_total => 0};
get_combat_exp({26, 96}) ->
    #{combat_type => 26, lev => 96, limit => 3,
      sq_exp => 960, sq_exp_total => 0};
get_combat_exp({26, 95}) ->
    #{combat_type => 26, lev => 95, limit => 3,
      sq_exp => 950, sq_exp_total => 0};
get_combat_exp({26, 94}) ->
    #{combat_type => 26, lev => 94, limit => 3,
      sq_exp => 940, sq_exp_total => 0};
get_combat_exp({26, 93}) ->
    #{combat_type => 26, lev => 93, limit => 3,
      sq_exp => 930, sq_exp_total => 0};
get_combat_exp({26, 92}) ->
    #{combat_type => 26, lev => 92, limit => 3,
      sq_exp => 920, sq_exp_total => 0};
get_combat_exp({26, 91}) ->
    #{combat_type => 26, lev => 91, limit => 3,
      sq_exp => 910, sq_exp_total => 0};
get_combat_exp({26, 90}) ->
    #{combat_type => 26, lev => 90, limit => 3,
      sq_exp => 900, sq_exp_total => 0};
get_combat_exp({18, 130}) ->
    #{combat_type => 18, lev => 130, limit => 3,
      sq_exp => 2400, sq_exp_total => 0};
get_combat_exp({18, 129}) ->
    #{combat_type => 18, lev => 129, limit => 3,
      sq_exp => 2400, sq_exp_total => 0};
get_combat_exp({18, 128}) ->
    #{combat_type => 18, lev => 128, limit => 3,
      sq_exp => 2400, sq_exp_total => 0};
get_combat_exp({18, 127}) ->
    #{combat_type => 18, lev => 127, limit => 3,
      sq_exp => 2400, sq_exp_total => 0};
get_combat_exp({18, 126}) ->
    #{combat_type => 18, lev => 126, limit => 3,
      sq_exp => 2400, sq_exp_total => 0};
get_combat_exp({18, 125}) ->
    #{combat_type => 18, lev => 125, limit => 3,
      sq_exp => 2400, sq_exp_total => 0};
get_combat_exp({18, 124}) ->
    #{combat_type => 18, lev => 124, limit => 3,
      sq_exp => 2400, sq_exp_total => 0};
get_combat_exp({18, 123}) ->
    #{combat_type => 18, lev => 123, limit => 3,
      sq_exp => 2400, sq_exp_total => 0};
get_combat_exp({18, 122}) ->
    #{combat_type => 18, lev => 122, limit => 3,
      sq_exp => 2400, sq_exp_total => 0};
get_combat_exp({18, 121}) ->
    #{combat_type => 18, lev => 121, limit => 3,
      sq_exp => 2400, sq_exp_total => 0};
get_combat_exp({18, 120}) ->
    #{combat_type => 18, lev => 120, limit => 3,
      sq_exp => 2400, sq_exp_total => 0};
get_combat_exp({18, 119}) ->
    #{combat_type => 18, lev => 119, limit => 3,
      sq_exp => 2380, sq_exp_total => 0};
get_combat_exp({18, 118}) ->
    #{combat_type => 18, lev => 118, limit => 3,
      sq_exp => 2360, sq_exp_total => 0};
get_combat_exp({18, 117}) ->
    #{combat_type => 18, lev => 117, limit => 3,
      sq_exp => 2340, sq_exp_total => 0};
get_combat_exp({18, 116}) ->
    #{combat_type => 18, lev => 116, limit => 3,
      sq_exp => 2320, sq_exp_total => 0};
get_combat_exp({18, 115}) ->
    #{combat_type => 18, lev => 115, limit => 3,
      sq_exp => 2300, sq_exp_total => 0};
get_combat_exp({18, 114}) ->
    #{combat_type => 18, lev => 114, limit => 3,
      sq_exp => 2280, sq_exp_total => 0};
get_combat_exp({18, 113}) ->
    #{combat_type => 18, lev => 113, limit => 3,
      sq_exp => 2260, sq_exp_total => 0};
get_combat_exp({18, 112}) ->
    #{combat_type => 18, lev => 112, limit => 3,
      sq_exp => 2240, sq_exp_total => 0};
get_combat_exp({18, 111}) ->
    #{combat_type => 18, lev => 111, limit => 3,
      sq_exp => 2220, sq_exp_total => 0};
get_combat_exp({18, 110}) ->
    #{combat_type => 18, lev => 110, limit => 3,
      sq_exp => 2200, sq_exp_total => 0};
get_combat_exp({18, 109}) ->
    #{combat_type => 18, lev => 109, limit => 3,
      sq_exp => 2180, sq_exp_total => 0};
get_combat_exp({18, 108}) ->
    #{combat_type => 18, lev => 108, limit => 3,
      sq_exp => 2160, sq_exp_total => 0};
get_combat_exp({18, 107}) ->
    #{combat_type => 18, lev => 107, limit => 3,
      sq_exp => 2140, sq_exp_total => 0};
get_combat_exp({18, 106}) ->
    #{combat_type => 18, lev => 106, limit => 3,
      sq_exp => 2120, sq_exp_total => 0};
get_combat_exp({18, 105}) ->
    #{combat_type => 18, lev => 105, limit => 3,
      sq_exp => 2100, sq_exp_total => 0};
get_combat_exp({18, 104}) ->
    #{combat_type => 18, lev => 104, limit => 3,
      sq_exp => 2080, sq_exp_total => 0};
get_combat_exp({18, 103}) ->
    #{combat_type => 18, lev => 103, limit => 3,
      sq_exp => 2060, sq_exp_total => 0};
get_combat_exp({18, 102}) ->
    #{combat_type => 18, lev => 102, limit => 3,
      sq_exp => 2040, sq_exp_total => 0};
get_combat_exp({18, 101}) ->
    #{combat_type => 18, lev => 101, limit => 3,
      sq_exp => 2020, sq_exp_total => 0};
get_combat_exp({18, 100}) ->
    #{combat_type => 18, lev => 100, limit => 3,
      sq_exp => 2000, sq_exp_total => 0};
get_combat_exp({18, 99}) ->
    #{combat_type => 18, lev => 99, limit => 3,
      sq_exp => 1980, sq_exp_total => 0};
get_combat_exp({18, 98}) ->
    #{combat_type => 18, lev => 98, limit => 3,
      sq_exp => 1960, sq_exp_total => 0};
get_combat_exp({18, 97}) ->
    #{combat_type => 18, lev => 97, limit => 3,
      sq_exp => 1940, sq_exp_total => 0};
get_combat_exp({18, 96}) ->
    #{combat_type => 18, lev => 96, limit => 3,
      sq_exp => 1920, sq_exp_total => 0};
get_combat_exp({18, 95}) ->
    #{combat_type => 18, lev => 95, limit => 3,
      sq_exp => 1900, sq_exp_total => 0};
get_combat_exp({18, 94}) ->
    #{combat_type => 18, lev => 94, limit => 3,
      sq_exp => 1880, sq_exp_total => 0};
get_combat_exp({18, 93}) ->
    #{combat_type => 18, lev => 93, limit => 3,
      sq_exp => 1860, sq_exp_total => 0};
get_combat_exp({18, 92}) ->
    #{combat_type => 18, lev => 92, limit => 3,
      sq_exp => 1840, sq_exp_total => 0};
get_combat_exp({18, 91}) ->
    #{combat_type => 18, lev => 91, limit => 3,
      sq_exp => 1820, sq_exp_total => 0};
get_combat_exp({18, 90}) ->
    #{combat_type => 18, lev => 90, limit => 3,
      sq_exp => 1800, sq_exp_total => 0};
get_combat_exp({103, 130}) ->
    #{combat_type => 103, lev => 130, limit => 3,
      sq_exp => 3000, sq_exp_total => 0};
get_combat_exp({103, 129}) ->
    #{combat_type => 103, lev => 129, limit => 3,
      sq_exp => 3000, sq_exp_total => 0};
get_combat_exp({103, 128}) ->
    #{combat_type => 103, lev => 128, limit => 3,
      sq_exp => 3000, sq_exp_total => 0};
get_combat_exp({103, 127}) ->
    #{combat_type => 103, lev => 127, limit => 3,
      sq_exp => 3000, sq_exp_total => 0};
get_combat_exp({103, 126}) ->
    #{combat_type => 103, lev => 126, limit => 3,
      sq_exp => 3000, sq_exp_total => 0};
get_combat_exp({103, 125}) ->
    #{combat_type => 103, lev => 125, limit => 3,
      sq_exp => 3000, sq_exp_total => 0};
get_combat_exp({103, 124}) ->
    #{combat_type => 103, lev => 124, limit => 3,
      sq_exp => 3000, sq_exp_total => 0};
get_combat_exp({103, 123}) ->
    #{combat_type => 103, lev => 123, limit => 3,
      sq_exp => 3000, sq_exp_total => 0};
get_combat_exp({103, 122}) ->
    #{combat_type => 103, lev => 122, limit => 3,
      sq_exp => 3000, sq_exp_total => 0};
get_combat_exp({103, 121}) ->
    #{combat_type => 103, lev => 121, limit => 3,
      sq_exp => 3000, sq_exp_total => 0};
get_combat_exp({103, 120}) ->
    #{combat_type => 103, lev => 120, limit => 3,
      sq_exp => 3000, sq_exp_total => 0};
get_combat_exp({103, 119}) ->
    #{combat_type => 103, lev => 119, limit => 3,
      sq_exp => 2975, sq_exp_total => 0};
get_combat_exp({103, 118}) ->
    #{combat_type => 103, lev => 118, limit => 3,
      sq_exp => 2950, sq_exp_total => 0};
get_combat_exp({103, 117}) ->
    #{combat_type => 103, lev => 117, limit => 3,
      sq_exp => 2925, sq_exp_total => 0};
get_combat_exp({103, 116}) ->
    #{combat_type => 103, lev => 116, limit => 3,
      sq_exp => 2900, sq_exp_total => 0};
get_combat_exp({103, 115}) ->
    #{combat_type => 103, lev => 115, limit => 3,
      sq_exp => 2875, sq_exp_total => 0};
get_combat_exp({103, 114}) ->
    #{combat_type => 103, lev => 114, limit => 3,
      sq_exp => 2850, sq_exp_total => 0};
get_combat_exp({103, 113}) ->
    #{combat_type => 103, lev => 113, limit => 3,
      sq_exp => 2825, sq_exp_total => 0};
get_combat_exp({103, 112}) ->
    #{combat_type => 103, lev => 112, limit => 3,
      sq_exp => 2800, sq_exp_total => 0};
get_combat_exp({103, 111}) ->
    #{combat_type => 103, lev => 111, limit => 3,
      sq_exp => 2775, sq_exp_total => 0};
get_combat_exp({103, 110}) ->
    #{combat_type => 103, lev => 110, limit => 3,
      sq_exp => 2750, sq_exp_total => 0};
get_combat_exp({103, 109}) ->
    #{combat_type => 103, lev => 109, limit => 3,
      sq_exp => 2725, sq_exp_total => 0};
get_combat_exp({103, 108}) ->
    #{combat_type => 103, lev => 108, limit => 3,
      sq_exp => 2700, sq_exp_total => 0};
get_combat_exp({103, 107}) ->
    #{combat_type => 103, lev => 107, limit => 3,
      sq_exp => 2675, sq_exp_total => 0};
get_combat_exp({103, 106}) ->
    #{combat_type => 103, lev => 106, limit => 3,
      sq_exp => 2650, sq_exp_total => 0};
get_combat_exp({103, 105}) ->
    #{combat_type => 103, lev => 105, limit => 3,
      sq_exp => 2625, sq_exp_total => 0};
get_combat_exp({103, 104}) ->
    #{combat_type => 103, lev => 104, limit => 3,
      sq_exp => 2600, sq_exp_total => 0};
get_combat_exp({103, 103}) ->
    #{combat_type => 103, lev => 103, limit => 3,
      sq_exp => 2575, sq_exp_total => 0};
get_combat_exp({103, 102}) ->
    #{combat_type => 103, lev => 102, limit => 3,
      sq_exp => 2550, sq_exp_total => 0};
get_combat_exp({103, 101}) ->
    #{combat_type => 103, lev => 101, limit => 3,
      sq_exp => 2525, sq_exp_total => 0};
get_combat_exp({103, 100}) ->
    #{combat_type => 103, lev => 100, limit => 3,
      sq_exp => 2500, sq_exp_total => 0};
get_combat_exp({103, 99}) ->
    #{combat_type => 103, lev => 99, limit => 3,
      sq_exp => 2475, sq_exp_total => 0};
get_combat_exp({103, 98}) ->
    #{combat_type => 103, lev => 98, limit => 3,
      sq_exp => 2450, sq_exp_total => 0};
get_combat_exp({103, 97}) ->
    #{combat_type => 103, lev => 97, limit => 3,
      sq_exp => 2425, sq_exp_total => 0};
get_combat_exp({103, 96}) ->
    #{combat_type => 103, lev => 96, limit => 3,
      sq_exp => 2400, sq_exp_total => 0};
get_combat_exp({103, 95}) ->
    #{combat_type => 103, lev => 95, limit => 3,
      sq_exp => 2375, sq_exp_total => 0};
get_combat_exp({103, 94}) ->
    #{combat_type => 103, lev => 94, limit => 3,
      sq_exp => 2350, sq_exp_total => 0};
get_combat_exp({103, 93}) ->
    #{combat_type => 103, lev => 93, limit => 3,
      sq_exp => 2325, sq_exp_total => 0};
get_combat_exp({103, 92}) ->
    #{combat_type => 103, lev => 92, limit => 3,
      sq_exp => 2300, sq_exp_total => 0};
get_combat_exp({103, 91}) ->
    #{combat_type => 103, lev => 91, limit => 3,
      sq_exp => 2275, sq_exp_total => 0};
get_combat_exp({103, 90}) ->
    #{combat_type => 103, lev => 90, limit => 3,
      sq_exp => 2250, sq_exp_total => 0};
get_combat_exp({107, 130}) ->
    #{combat_type => 107, lev => 130, limit => 3,
      sq_exp => 2400, sq_exp_total => 0};
get_combat_exp({107, 129}) ->
    #{combat_type => 107, lev => 129, limit => 3,
      sq_exp => 2400, sq_exp_total => 0};
get_combat_exp({107, 128}) ->
    #{combat_type => 107, lev => 128, limit => 3,
      sq_exp => 2400, sq_exp_total => 0};
get_combat_exp({107, 127}) ->
    #{combat_type => 107, lev => 127, limit => 3,
      sq_exp => 2400, sq_exp_total => 0};
get_combat_exp({107, 126}) ->
    #{combat_type => 107, lev => 126, limit => 3,
      sq_exp => 2400, sq_exp_total => 0};
get_combat_exp({107, 125}) ->
    #{combat_type => 107, lev => 125, limit => 3,
      sq_exp => 2400, sq_exp_total => 0};
get_combat_exp({107, 124}) ->
    #{combat_type => 107, lev => 124, limit => 3,
      sq_exp => 2400, sq_exp_total => 0};
get_combat_exp({107, 123}) ->
    #{combat_type => 107, lev => 123, limit => 3,
      sq_exp => 2400, sq_exp_total => 0};
get_combat_exp({107, 122}) ->
    #{combat_type => 107, lev => 122, limit => 3,
      sq_exp => 2400, sq_exp_total => 0};
get_combat_exp({107, 121}) ->
    #{combat_type => 107, lev => 121, limit => 3,
      sq_exp => 2400, sq_exp_total => 0};
get_combat_exp({107, 120}) ->
    #{combat_type => 107, lev => 120, limit => 3,
      sq_exp => 2400, sq_exp_total => 0};
get_combat_exp({107, 119}) ->
    #{combat_type => 107, lev => 119, limit => 3,
      sq_exp => 2380, sq_exp_total => 0};
get_combat_exp({107, 118}) ->
    #{combat_type => 107, lev => 118, limit => 3,
      sq_exp => 2360, sq_exp_total => 0};
get_combat_exp({107, 117}) ->
    #{combat_type => 107, lev => 117, limit => 3,
      sq_exp => 2340, sq_exp_total => 0};
get_combat_exp({107, 116}) ->
    #{combat_type => 107, lev => 116, limit => 3,
      sq_exp => 2320, sq_exp_total => 0};
get_combat_exp({107, 115}) ->
    #{combat_type => 107, lev => 115, limit => 3,
      sq_exp => 2300, sq_exp_total => 0};
get_combat_exp({107, 114}) ->
    #{combat_type => 107, lev => 114, limit => 3,
      sq_exp => 2280, sq_exp_total => 0};
get_combat_exp({107, 113}) ->
    #{combat_type => 107, lev => 113, limit => 3,
      sq_exp => 2260, sq_exp_total => 0};
get_combat_exp({107, 112}) ->
    #{combat_type => 107, lev => 112, limit => 3,
      sq_exp => 2240, sq_exp_total => 0};
get_combat_exp({107, 111}) ->
    #{combat_type => 107, lev => 111, limit => 3,
      sq_exp => 2220, sq_exp_total => 0};
get_combat_exp({107, 110}) ->
    #{combat_type => 107, lev => 110, limit => 3,
      sq_exp => 2200, sq_exp_total => 0};
get_combat_exp({107, 109}) ->
    #{combat_type => 107, lev => 109, limit => 3,
      sq_exp => 2180, sq_exp_total => 0};
get_combat_exp({107, 108}) ->
    #{combat_type => 107, lev => 108, limit => 3,
      sq_exp => 2160, sq_exp_total => 0};
get_combat_exp({107, 107}) ->
    #{combat_type => 107, lev => 107, limit => 3,
      sq_exp => 2140, sq_exp_total => 0};
get_combat_exp({107, 106}) ->
    #{combat_type => 107, lev => 106, limit => 3,
      sq_exp => 2120, sq_exp_total => 0};
get_combat_exp({107, 105}) ->
    #{combat_type => 107, lev => 105, limit => 3,
      sq_exp => 2100, sq_exp_total => 0};
get_combat_exp({107, 104}) ->
    #{combat_type => 107, lev => 104, limit => 3,
      sq_exp => 2080, sq_exp_total => 0};
get_combat_exp({107, 103}) ->
    #{combat_type => 107, lev => 103, limit => 3,
      sq_exp => 2060, sq_exp_total => 0};
get_combat_exp({107, 102}) ->
    #{combat_type => 107, lev => 102, limit => 3,
      sq_exp => 2040, sq_exp_total => 0};
get_combat_exp({107, 101}) ->
    #{combat_type => 107, lev => 101, limit => 3,
      sq_exp => 2020, sq_exp_total => 0};
get_combat_exp({107, 100}) ->
    #{combat_type => 107, lev => 100, limit => 3,
      sq_exp => 2000, sq_exp_total => 0};
get_combat_exp({107, 99}) ->
    #{combat_type => 107, lev => 99, limit => 3,
      sq_exp => 1980, sq_exp_total => 0};
get_combat_exp({107, 98}) ->
    #{combat_type => 107, lev => 98, limit => 3,
      sq_exp => 1960, sq_exp_total => 0};
get_combat_exp({107, 97}) ->
    #{combat_type => 107, lev => 97, limit => 3,
      sq_exp => 1940, sq_exp_total => 0};
get_combat_exp({107, 96}) ->
    #{combat_type => 107, lev => 96, limit => 3,
      sq_exp => 1920, sq_exp_total => 0};
get_combat_exp({107, 95}) ->
    #{combat_type => 107, lev => 95, limit => 3,
      sq_exp => 1900, sq_exp_total => 0};
get_combat_exp({107, 94}) ->
    #{combat_type => 107, lev => 94, limit => 3,
      sq_exp => 1880, sq_exp_total => 0};
get_combat_exp({107, 93}) ->
    #{combat_type => 107, lev => 93, limit => 3,
      sq_exp => 1860, sq_exp_total => 0};
get_combat_exp({107, 92}) ->
    #{combat_type => 107, lev => 92, limit => 3,
      sq_exp => 1840, sq_exp_total => 0};
get_combat_exp({107, 91}) ->
    #{combat_type => 107, lev => 91, limit => 3,
      sq_exp => 1820, sq_exp_total => 0};
get_combat_exp({107, 90}) ->
    #{combat_type => 107, lev => 90, limit => 3,
      sq_exp => 1800, sq_exp_total => 0};
get_combat_exp({102, 130}) ->
    #{combat_type => 102, lev => 130, limit => 8,
      sq_exp => 600, sq_exp_total => 0};
get_combat_exp({102, 129}) ->
    #{combat_type => 102, lev => 129, limit => 8,
      sq_exp => 600, sq_exp_total => 0};
get_combat_exp({102, 128}) ->
    #{combat_type => 102, lev => 128, limit => 8,
      sq_exp => 600, sq_exp_total => 0};
get_combat_exp({102, 127}) ->
    #{combat_type => 102, lev => 127, limit => 8,
      sq_exp => 600, sq_exp_total => 0};
get_combat_exp({102, 126}) ->
    #{combat_type => 102, lev => 126, limit => 8,
      sq_exp => 600, sq_exp_total => 0};
get_combat_exp({102, 125}) ->
    #{combat_type => 102, lev => 125, limit => 8,
      sq_exp => 600, sq_exp_total => 0};
get_combat_exp({102, 124}) ->
    #{combat_type => 102, lev => 124, limit => 8,
      sq_exp => 600, sq_exp_total => 0};
get_combat_exp({102, 123}) ->
    #{combat_type => 102, lev => 123, limit => 8,
      sq_exp => 600, sq_exp_total => 0};
get_combat_exp({102, 122}) ->
    #{combat_type => 102, lev => 122, limit => 8,
      sq_exp => 600, sq_exp_total => 0};
get_combat_exp({102, 121}) ->
    #{combat_type => 102, lev => 121, limit => 8,
      sq_exp => 600, sq_exp_total => 0};
get_combat_exp({102, 120}) ->
    #{combat_type => 102, lev => 120, limit => 8,
      sq_exp => 600, sq_exp_total => 0};
get_combat_exp({102, 119}) ->
    #{combat_type => 102, lev => 119, limit => 8,
      sq_exp => 595, sq_exp_total => 0};
get_combat_exp({102, 118}) ->
    #{combat_type => 102, lev => 118, limit => 8,
      sq_exp => 590, sq_exp_total => 0};
get_combat_exp({102, 117}) ->
    #{combat_type => 102, lev => 117, limit => 8,
      sq_exp => 585, sq_exp_total => 0};
get_combat_exp({102, 116}) ->
    #{combat_type => 102, lev => 116, limit => 8,
      sq_exp => 580, sq_exp_total => 0};
get_combat_exp({102, 115}) ->
    #{combat_type => 102, lev => 115, limit => 8,
      sq_exp => 575, sq_exp_total => 0};
get_combat_exp({102, 114}) ->
    #{combat_type => 102, lev => 114, limit => 8,
      sq_exp => 570, sq_exp_total => 0};
get_combat_exp({102, 113}) ->
    #{combat_type => 102, lev => 113, limit => 8,
      sq_exp => 565, sq_exp_total => 0};
get_combat_exp({102, 112}) ->
    #{combat_type => 102, lev => 112, limit => 8,
      sq_exp => 560, sq_exp_total => 0};
get_combat_exp({102, 111}) ->
    #{combat_type => 102, lev => 111, limit => 8,
      sq_exp => 555, sq_exp_total => 0};
get_combat_exp({102, 110}) ->
    #{combat_type => 102, lev => 110, limit => 8,
      sq_exp => 550, sq_exp_total => 0};
get_combat_exp({102, 109}) ->
    #{combat_type => 102, lev => 109, limit => 8,
      sq_exp => 545, sq_exp_total => 0};
get_combat_exp({102, 108}) ->
    #{combat_type => 102, lev => 108, limit => 8,
      sq_exp => 540, sq_exp_total => 0};
get_combat_exp({102, 107}) ->
    #{combat_type => 102, lev => 107, limit => 8,
      sq_exp => 535, sq_exp_total => 0};
get_combat_exp({102, 106}) ->
    #{combat_type => 102, lev => 106, limit => 8,
      sq_exp => 530, sq_exp_total => 0};
get_combat_exp({102, 105}) ->
    #{combat_type => 102, lev => 105, limit => 8,
      sq_exp => 525, sq_exp_total => 0};
get_combat_exp({102, 104}) ->
    #{combat_type => 102, lev => 104, limit => 8,
      sq_exp => 520, sq_exp_total => 0};
get_combat_exp({102, 103}) ->
    #{combat_type => 102, lev => 103, limit => 8,
      sq_exp => 515, sq_exp_total => 0};
get_combat_exp({102, 102}) ->
    #{combat_type => 102, lev => 102, limit => 8,
      sq_exp => 510, sq_exp_total => 0};
get_combat_exp({102, 101}) ->
    #{combat_type => 102, lev => 101, limit => 8,
      sq_exp => 505, sq_exp_total => 0};
get_combat_exp({102, 100}) ->
    #{combat_type => 102, lev => 100, limit => 8,
      sq_exp => 500, sq_exp_total => 0};
get_combat_exp({102, 99}) ->
    #{combat_type => 102, lev => 99, limit => 8,
      sq_exp => 495, sq_exp_total => 0};
get_combat_exp({102, 98}) ->
    #{combat_type => 102, lev => 98, limit => 8,
      sq_exp => 490, sq_exp_total => 0};
get_combat_exp({102, 97}) ->
    #{combat_type => 102, lev => 97, limit => 8,
      sq_exp => 485, sq_exp_total => 0};
get_combat_exp({102, 96}) ->
    #{combat_type => 102, lev => 96, limit => 8,
      sq_exp => 480, sq_exp_total => 0};
get_combat_exp({102, 95}) ->
    #{combat_type => 102, lev => 95, limit => 8,
      sq_exp => 475, sq_exp_total => 0};
get_combat_exp({102, 94}) ->
    #{combat_type => 102, lev => 94, limit => 8,
      sq_exp => 470, sq_exp_total => 0};
get_combat_exp({102, 93}) ->
    #{combat_type => 102, lev => 93, limit => 8,
      sq_exp => 465, sq_exp_total => 0};
get_combat_exp({102, 92}) ->
    #{combat_type => 102, lev => 92, limit => 8,
      sq_exp => 460, sq_exp_total => 0};
get_combat_exp({102, 91}) ->
    #{combat_type => 102, lev => 91, limit => 8,
      sq_exp => 455, sq_exp_total => 0};
get_combat_exp({102, 90}) ->
    #{combat_type => 102, lev => 90, limit => 8,
      sq_exp => 450, sq_exp_total => 0};
get_combat_exp({106, 130}) ->
    #{combat_type => 106, lev => 130, limit => 2,
      sq_exp => 3600, sq_exp_total => 0};
get_combat_exp({106, 129}) ->
    #{combat_type => 106, lev => 129, limit => 2,
      sq_exp => 3600, sq_exp_total => 0};
get_combat_exp({106, 128}) ->
    #{combat_type => 106, lev => 128, limit => 2,
      sq_exp => 3600, sq_exp_total => 0};
get_combat_exp({106, 127}) ->
    #{combat_type => 106, lev => 127, limit => 2,
      sq_exp => 3600, sq_exp_total => 0};
get_combat_exp({106, 126}) ->
    #{combat_type => 106, lev => 126, limit => 2,
      sq_exp => 3600, sq_exp_total => 0};
get_combat_exp({106, 125}) ->
    #{combat_type => 106, lev => 125, limit => 2,
      sq_exp => 3600, sq_exp_total => 0};
get_combat_exp({106, 124}) ->
    #{combat_type => 106, lev => 124, limit => 2,
      sq_exp => 3600, sq_exp_total => 0};
get_combat_exp({106, 123}) ->
    #{combat_type => 106, lev => 123, limit => 2,
      sq_exp => 3600, sq_exp_total => 0};
get_combat_exp({106, 122}) ->
    #{combat_type => 106, lev => 122, limit => 2,
      sq_exp => 3600, sq_exp_total => 0};
get_combat_exp({106, 121}) ->
    #{combat_type => 106, lev => 121, limit => 2,
      sq_exp => 3600, sq_exp_total => 0};
get_combat_exp({106, 120}) ->
    #{combat_type => 106, lev => 120, limit => 2,
      sq_exp => 3600, sq_exp_total => 0};
get_combat_exp({106, 119}) ->
    #{combat_type => 106, lev => 119, limit => 2,
      sq_exp => 3570, sq_exp_total => 0};
get_combat_exp({106, 118}) ->
    #{combat_type => 106, lev => 118, limit => 2,
      sq_exp => 3540, sq_exp_total => 0};
get_combat_exp({106, 117}) ->
    #{combat_type => 106, lev => 117, limit => 2,
      sq_exp => 3510, sq_exp_total => 0};
get_combat_exp({106, 116}) ->
    #{combat_type => 106, lev => 116, limit => 2,
      sq_exp => 3480, sq_exp_total => 0};
get_combat_exp({106, 115}) ->
    #{combat_type => 106, lev => 115, limit => 2,
      sq_exp => 3450, sq_exp_total => 0};
get_combat_exp({106, 114}) ->
    #{combat_type => 106, lev => 114, limit => 2,
      sq_exp => 3420, sq_exp_total => 0};
get_combat_exp({106, 113}) ->
    #{combat_type => 106, lev => 113, limit => 2,
      sq_exp => 3390, sq_exp_total => 0};
get_combat_exp({106, 112}) ->
    #{combat_type => 106, lev => 112, limit => 2,
      sq_exp => 3360, sq_exp_total => 0};
get_combat_exp({106, 111}) ->
    #{combat_type => 106, lev => 111, limit => 2,
      sq_exp => 3330, sq_exp_total => 0};
get_combat_exp({106, 110}) ->
    #{combat_type => 106, lev => 110, limit => 2,
      sq_exp => 3300, sq_exp_total => 0};
get_combat_exp({106, 109}) ->
    #{combat_type => 106, lev => 109, limit => 2,
      sq_exp => 3270, sq_exp_total => 0};
get_combat_exp({106, 108}) ->
    #{combat_type => 106, lev => 108, limit => 2,
      sq_exp => 3240, sq_exp_total => 0};
get_combat_exp({106, 107}) ->
    #{combat_type => 106, lev => 107, limit => 2,
      sq_exp => 3210, sq_exp_total => 0};
get_combat_exp({106, 106}) ->
    #{combat_type => 106, lev => 106, limit => 2,
      sq_exp => 3180, sq_exp_total => 0};
get_combat_exp({106, 105}) ->
    #{combat_type => 106, lev => 105, limit => 2,
      sq_exp => 3150, sq_exp_total => 0};
get_combat_exp({106, 104}) ->
    #{combat_type => 106, lev => 104, limit => 2,
      sq_exp => 3120, sq_exp_total => 0};
get_combat_exp({106, 103}) ->
    #{combat_type => 106, lev => 103, limit => 2,
      sq_exp => 3090, sq_exp_total => 0};
get_combat_exp({106, 102}) ->
    #{combat_type => 106, lev => 102, limit => 2,
      sq_exp => 3060, sq_exp_total => 0};
get_combat_exp({106, 101}) ->
    #{combat_type => 106, lev => 101, limit => 2,
      sq_exp => 3030, sq_exp_total => 0};
get_combat_exp({106, 100}) ->
    #{combat_type => 106, lev => 100, limit => 2,
      sq_exp => 3000, sq_exp_total => 0};
get_combat_exp({106, 99}) ->
    #{combat_type => 106, lev => 99, limit => 2,
      sq_exp => 2970, sq_exp_total => 0};
get_combat_exp({106, 98}) ->
    #{combat_type => 106, lev => 98, limit => 2,
      sq_exp => 2940, sq_exp_total => 0};
get_combat_exp({106, 97}) ->
    #{combat_type => 106, lev => 97, limit => 2,
      sq_exp => 2910, sq_exp_total => 0};
get_combat_exp({106, 96}) ->
    #{combat_type => 106, lev => 96, limit => 2,
      sq_exp => 2880, sq_exp_total => 0};
get_combat_exp({106, 95}) ->
    #{combat_type => 106, lev => 95, limit => 2,
      sq_exp => 2850, sq_exp_total => 0};
get_combat_exp({106, 94}) ->
    #{combat_type => 106, lev => 94, limit => 2,
      sq_exp => 2820, sq_exp_total => 0};
get_combat_exp({106, 93}) ->
    #{combat_type => 106, lev => 93, limit => 2,
      sq_exp => 2790, sq_exp_total => 0};
get_combat_exp({106, 92}) ->
    #{combat_type => 106, lev => 92, limit => 2,
      sq_exp => 2760, sq_exp_total => 0};
get_combat_exp({106, 91}) ->
    #{combat_type => 106, lev => 91, limit => 2,
      sq_exp => 2730, sq_exp_total => 0};
get_combat_exp({106, 90}) ->
    #{combat_type => 106, lev => 90, limit => 2,
      sq_exp => 2700, sq_exp_total => 0};
get_combat_exp({41, 130}) ->
    #{combat_type => 41, lev => 130, limit => 3,
      sq_exp => 1800, sq_exp_total => 0};
get_combat_exp({41, 129}) ->
    #{combat_type => 41, lev => 129, limit => 3,
      sq_exp => 1800, sq_exp_total => 0};
get_combat_exp({41, 128}) ->
    #{combat_type => 41, lev => 128, limit => 3,
      sq_exp => 1800, sq_exp_total => 0};
get_combat_exp({41, 127}) ->
    #{combat_type => 41, lev => 127, limit => 3,
      sq_exp => 1800, sq_exp_total => 0};
get_combat_exp({41, 126}) ->
    #{combat_type => 41, lev => 126, limit => 3,
      sq_exp => 1800, sq_exp_total => 0};
get_combat_exp({41, 125}) ->
    #{combat_type => 41, lev => 125, limit => 3,
      sq_exp => 1800, sq_exp_total => 0};
get_combat_exp({41, 124}) ->
    #{combat_type => 41, lev => 124, limit => 3,
      sq_exp => 1800, sq_exp_total => 0};
get_combat_exp({41, 123}) ->
    #{combat_type => 41, lev => 123, limit => 3,
      sq_exp => 1800, sq_exp_total => 0};
get_combat_exp({41, 122}) ->
    #{combat_type => 41, lev => 122, limit => 3,
      sq_exp => 1800, sq_exp_total => 0};
get_combat_exp({41, 121}) ->
    #{combat_type => 41, lev => 121, limit => 3,
      sq_exp => 1800, sq_exp_total => 0};
get_combat_exp({41, 120}) ->
    #{combat_type => 41, lev => 120, limit => 3,
      sq_exp => 1800, sq_exp_total => 0};
get_combat_exp({41, 119}) ->
    #{combat_type => 41, lev => 119, limit => 3,
      sq_exp => 1785, sq_exp_total => 0};
get_combat_exp({41, 118}) ->
    #{combat_type => 41, lev => 118, limit => 3,
      sq_exp => 1770, sq_exp_total => 0};
get_combat_exp({41, 117}) ->
    #{combat_type => 41, lev => 117, limit => 3,
      sq_exp => 1755, sq_exp_total => 0};
get_combat_exp({41, 116}) ->
    #{combat_type => 41, lev => 116, limit => 3,
      sq_exp => 1740, sq_exp_total => 0};
get_combat_exp({41, 115}) ->
    #{combat_type => 41, lev => 115, limit => 3,
      sq_exp => 1725, sq_exp_total => 0};
get_combat_exp({41, 114}) ->
    #{combat_type => 41, lev => 114, limit => 3,
      sq_exp => 1710, sq_exp_total => 0};
get_combat_exp({41, 113}) ->
    #{combat_type => 41, lev => 113, limit => 3,
      sq_exp => 1695, sq_exp_total => 0};
get_combat_exp({41, 112}) ->
    #{combat_type => 41, lev => 112, limit => 3,
      sq_exp => 1680, sq_exp_total => 0};
get_combat_exp({41, 111}) ->
    #{combat_type => 41, lev => 111, limit => 3,
      sq_exp => 1665, sq_exp_total => 0};
get_combat_exp({41, 110}) ->
    #{combat_type => 41, lev => 110, limit => 3,
      sq_exp => 1650, sq_exp_total => 0};
get_combat_exp({41, 109}) ->
    #{combat_type => 41, lev => 109, limit => 3,
      sq_exp => 1635, sq_exp_total => 0};
get_combat_exp({41, 108}) ->
    #{combat_type => 41, lev => 108, limit => 3,
      sq_exp => 1620, sq_exp_total => 0};
get_combat_exp({41, 107}) ->
    #{combat_type => 41, lev => 107, limit => 3,
      sq_exp => 1605, sq_exp_total => 0};
get_combat_exp({41, 106}) ->
    #{combat_type => 41, lev => 106, limit => 3,
      sq_exp => 1590, sq_exp_total => 0};
get_combat_exp({41, 105}) ->
    #{combat_type => 41, lev => 105, limit => 3,
      sq_exp => 1575, sq_exp_total => 0};
get_combat_exp({41, 104}) ->
    #{combat_type => 41, lev => 104, limit => 3,
      sq_exp => 1560, sq_exp_total => 0};
get_combat_exp({41, 103}) ->
    #{combat_type => 41, lev => 103, limit => 3,
      sq_exp => 1545, sq_exp_total => 0};
get_combat_exp({41, 102}) ->
    #{combat_type => 41, lev => 102, limit => 3,
      sq_exp => 1530, sq_exp_total => 0};
get_combat_exp({41, 101}) ->
    #{combat_type => 41, lev => 101, limit => 3,
      sq_exp => 1515, sq_exp_total => 0};
get_combat_exp({41, 100}) ->
    #{combat_type => 41, lev => 100, limit => 3,
      sq_exp => 1500, sq_exp_total => 0};
get_combat_exp({41, 99}) ->
    #{combat_type => 41, lev => 99, limit => 3,
      sq_exp => 1485, sq_exp_total => 0};
get_combat_exp({41, 98}) ->
    #{combat_type => 41, lev => 98, limit => 3,
      sq_exp => 1470, sq_exp_total => 0};
get_combat_exp({41, 97}) ->
    #{combat_type => 41, lev => 97, limit => 3,
      sq_exp => 1455, sq_exp_total => 0};
get_combat_exp({41, 96}) ->
    #{combat_type => 41, lev => 96, limit => 3,
      sq_exp => 1440, sq_exp_total => 0};
get_combat_exp({41, 95}) ->
    #{combat_type => 41, lev => 95, limit => 3,
      sq_exp => 1425, sq_exp_total => 0};
get_combat_exp({41, 94}) ->
    #{combat_type => 41, lev => 94, limit => 3,
      sq_exp => 1410, sq_exp_total => 0};
get_combat_exp({41, 93}) ->
    #{combat_type => 41, lev => 93, limit => 3,
      sq_exp => 1395, sq_exp_total => 0};
get_combat_exp({41, 92}) ->
    #{combat_type => 41, lev => 92, limit => 3,
      sq_exp => 1380, sq_exp_total => 0};
get_combat_exp({41, 91}) ->
    #{combat_type => 41, lev => 91, limit => 3,
      sq_exp => 1365, sq_exp_total => 0};
get_combat_exp({41, 90}) ->
    #{combat_type => 41, lev => 90, limit => 3,
      sq_exp => 1350, sq_exp_total => 0};
get_combat_exp({104, 130}) ->
    #{combat_type => 104, lev => 130, limit => 3,
      sq_exp => 3600, sq_exp_total => 0};
get_combat_exp({104, 129}) ->
    #{combat_type => 104, lev => 129, limit => 3,
      sq_exp => 3600, sq_exp_total => 0};
get_combat_exp({104, 128}) ->
    #{combat_type => 104, lev => 128, limit => 3,
      sq_exp => 3600, sq_exp_total => 0};
get_combat_exp({104, 127}) ->
    #{combat_type => 104, lev => 127, limit => 3,
      sq_exp => 3600, sq_exp_total => 0};
get_combat_exp({104, 126}) ->
    #{combat_type => 104, lev => 126, limit => 3,
      sq_exp => 3600, sq_exp_total => 0};
get_combat_exp({104, 125}) ->
    #{combat_type => 104, lev => 125, limit => 3,
      sq_exp => 3600, sq_exp_total => 0};
get_combat_exp({104, 124}) ->
    #{combat_type => 104, lev => 124, limit => 3,
      sq_exp => 3600, sq_exp_total => 0};
get_combat_exp({104, 123}) ->
    #{combat_type => 104, lev => 123, limit => 3,
      sq_exp => 3600, sq_exp_total => 0};
get_combat_exp({104, 122}) ->
    #{combat_type => 104, lev => 122, limit => 3,
      sq_exp => 3600, sq_exp_total => 0};
get_combat_exp({104, 121}) ->
    #{combat_type => 104, lev => 121, limit => 3,
      sq_exp => 3600, sq_exp_total => 0};
get_combat_exp({104, 120}) ->
    #{combat_type => 104, lev => 120, limit => 3,
      sq_exp => 3600, sq_exp_total => 0};
get_combat_exp({104, 119}) ->
    #{combat_type => 104, lev => 119, limit => 3,
      sq_exp => 3570, sq_exp_total => 0};
get_combat_exp({104, 118}) ->
    #{combat_type => 104, lev => 118, limit => 3,
      sq_exp => 3540, sq_exp_total => 0};
get_combat_exp({104, 117}) ->
    #{combat_type => 104, lev => 117, limit => 3,
      sq_exp => 3510, sq_exp_total => 0};
get_combat_exp({104, 116}) ->
    #{combat_type => 104, lev => 116, limit => 3,
      sq_exp => 3480, sq_exp_total => 0};
get_combat_exp({104, 115}) ->
    #{combat_type => 104, lev => 115, limit => 3,
      sq_exp => 3450, sq_exp_total => 0};
get_combat_exp({104, 114}) ->
    #{combat_type => 104, lev => 114, limit => 3,
      sq_exp => 3420, sq_exp_total => 0};
get_combat_exp({104, 113}) ->
    #{combat_type => 104, lev => 113, limit => 3,
      sq_exp => 3390, sq_exp_total => 0};
get_combat_exp({104, 112}) ->
    #{combat_type => 104, lev => 112, limit => 3,
      sq_exp => 3360, sq_exp_total => 0};
get_combat_exp({104, 111}) ->
    #{combat_type => 104, lev => 111, limit => 3,
      sq_exp => 3330, sq_exp_total => 0};
get_combat_exp({104, 110}) ->
    #{combat_type => 104, lev => 110, limit => 3,
      sq_exp => 3300, sq_exp_total => 0};
get_combat_exp({104, 109}) ->
    #{combat_type => 104, lev => 109, limit => 3,
      sq_exp => 3270, sq_exp_total => 0};
get_combat_exp({104, 108}) ->
    #{combat_type => 104, lev => 108, limit => 3,
      sq_exp => 3240, sq_exp_total => 0};
get_combat_exp({104, 107}) ->
    #{combat_type => 104, lev => 107, limit => 3,
      sq_exp => 3210, sq_exp_total => 0};
get_combat_exp({104, 106}) ->
    #{combat_type => 104, lev => 106, limit => 3,
      sq_exp => 3180, sq_exp_total => 0};
get_combat_exp({104, 105}) ->
    #{combat_type => 104, lev => 105, limit => 3,
      sq_exp => 3150, sq_exp_total => 0};
get_combat_exp({104, 104}) ->
    #{combat_type => 104, lev => 104, limit => 3,
      sq_exp => 3120, sq_exp_total => 0};
get_combat_exp({104, 103}) ->
    #{combat_type => 104, lev => 103, limit => 3,
      sq_exp => 3090, sq_exp_total => 0};
get_combat_exp({104, 102}) ->
    #{combat_type => 104, lev => 102, limit => 3,
      sq_exp => 3060, sq_exp_total => 0};
get_combat_exp({104, 101}) ->
    #{combat_type => 104, lev => 101, limit => 3,
      sq_exp => 3030, sq_exp_total => 0};
get_combat_exp({104, 100}) ->
    #{combat_type => 104, lev => 100, limit => 3,
      sq_exp => 3000, sq_exp_total => 0};
get_combat_exp({104, 99}) ->
    #{combat_type => 104, lev => 99, limit => 3,
      sq_exp => 2970, sq_exp_total => 0};
get_combat_exp({104, 98}) ->
    #{combat_type => 104, lev => 98, limit => 3,
      sq_exp => 2940, sq_exp_total => 0};
get_combat_exp({104, 97}) ->
    #{combat_type => 104, lev => 97, limit => 3,
      sq_exp => 2910, sq_exp_total => 0};
get_combat_exp({104, 96}) ->
    #{combat_type => 104, lev => 96, limit => 3,
      sq_exp => 2880, sq_exp_total => 0};
get_combat_exp({104, 95}) ->
    #{combat_type => 104, lev => 95, limit => 3,
      sq_exp => 2850, sq_exp_total => 0};
get_combat_exp({104, 94}) ->
    #{combat_type => 104, lev => 94, limit => 3,
      sq_exp => 2820, sq_exp_total => 0};
get_combat_exp({104, 93}) ->
    #{combat_type => 104, lev => 93, limit => 3,
      sq_exp => 2790, sq_exp_total => 0};
get_combat_exp({104, 92}) ->
    #{combat_type => 104, lev => 92, limit => 3,
      sq_exp => 2760, sq_exp_total => 0};
get_combat_exp({104, 91}) ->
    #{combat_type => 104, lev => 91, limit => 3,
      sq_exp => 2730, sq_exp_total => 0};
get_combat_exp({104, 90}) ->
    #{combat_type => 104, lev => 90, limit => 3,
      sq_exp => 2700, sq_exp_total => 0};
get_combat_exp({113, 130}) ->
    #{combat_type => 113, lev => 130, limit => 99,
      sq_exp => 600, sq_exp_total => 0};
get_combat_exp({113, 129}) ->
    #{combat_type => 113, lev => 129, limit => 99,
      sq_exp => 600, sq_exp_total => 0};
get_combat_exp({113, 128}) ->
    #{combat_type => 113, lev => 128, limit => 99,
      sq_exp => 600, sq_exp_total => 0};
get_combat_exp({113, 127}) ->
    #{combat_type => 113, lev => 127, limit => 99,
      sq_exp => 600, sq_exp_total => 0};
get_combat_exp({113, 126}) ->
    #{combat_type => 113, lev => 126, limit => 99,
      sq_exp => 600, sq_exp_total => 0};
get_combat_exp({113, 125}) ->
    #{combat_type => 113, lev => 125, limit => 99,
      sq_exp => 600, sq_exp_total => 0};
get_combat_exp({113, 124}) ->
    #{combat_type => 113, lev => 124, limit => 99,
      sq_exp => 600, sq_exp_total => 0};
get_combat_exp({113, 123}) ->
    #{combat_type => 113, lev => 123, limit => 99,
      sq_exp => 600, sq_exp_total => 0};
get_combat_exp({113, 122}) ->
    #{combat_type => 113, lev => 122, limit => 99,
      sq_exp => 600, sq_exp_total => 0};
get_combat_exp({113, 121}) ->
    #{combat_type => 113, lev => 121, limit => 99,
      sq_exp => 600, sq_exp_total => 0};
get_combat_exp({113, 120}) ->
    #{combat_type => 113, lev => 120, limit => 99,
      sq_exp => 600, sq_exp_total => 0};
get_combat_exp({113, 119}) ->
    #{combat_type => 113, lev => 119, limit => 99,
      sq_exp => 595, sq_exp_total => 0};
get_combat_exp({113, 118}) ->
    #{combat_type => 113, lev => 118, limit => 99,
      sq_exp => 590, sq_exp_total => 0};
get_combat_exp({113, 117}) ->
    #{combat_type => 113, lev => 117, limit => 99,
      sq_exp => 585, sq_exp_total => 0};
get_combat_exp({113, 116}) ->
    #{combat_type => 113, lev => 116, limit => 99,
      sq_exp => 580, sq_exp_total => 0};
get_combat_exp({113, 115}) ->
    #{combat_type => 113, lev => 115, limit => 99,
      sq_exp => 575, sq_exp_total => 0};
get_combat_exp({113, 114}) ->
    #{combat_type => 113, lev => 114, limit => 99,
      sq_exp => 570, sq_exp_total => 0};
get_combat_exp({113, 113}) ->
    #{combat_type => 113, lev => 113, limit => 99,
      sq_exp => 565, sq_exp_total => 0};
get_combat_exp({113, 112}) ->
    #{combat_type => 113, lev => 112, limit => 99,
      sq_exp => 560, sq_exp_total => 0};
get_combat_exp({113, 111}) ->
    #{combat_type => 113, lev => 111, limit => 99,
      sq_exp => 555, sq_exp_total => 0};
get_combat_exp({113, 110}) ->
    #{combat_type => 113, lev => 110, limit => 99,
      sq_exp => 550, sq_exp_total => 0};
get_combat_exp({113, 109}) ->
    #{combat_type => 113, lev => 109, limit => 99,
      sq_exp => 545, sq_exp_total => 0};
get_combat_exp({113, 108}) ->
    #{combat_type => 113, lev => 108, limit => 99,
      sq_exp => 540, sq_exp_total => 0};
get_combat_exp({113, 107}) ->
    #{combat_type => 113, lev => 107, limit => 99,
      sq_exp => 535, sq_exp_total => 0};
get_combat_exp({113, 106}) ->
    #{combat_type => 113, lev => 106, limit => 99,
      sq_exp => 530, sq_exp_total => 0};
get_combat_exp({113, 105}) ->
    #{combat_type => 113, lev => 105, limit => 99,
      sq_exp => 525, sq_exp_total => 0};
get_combat_exp({113, 104}) ->
    #{combat_type => 113, lev => 104, limit => 99,
      sq_exp => 520, sq_exp_total => 0};
get_combat_exp({113, 103}) ->
    #{combat_type => 113, lev => 103, limit => 99,
      sq_exp => 515, sq_exp_total => 0};
get_combat_exp({113, 102}) ->
    #{combat_type => 113, lev => 102, limit => 99,
      sq_exp => 510, sq_exp_total => 0};
get_combat_exp({113, 101}) ->
    #{combat_type => 113, lev => 101, limit => 99,
      sq_exp => 505, sq_exp_total => 0};
get_combat_exp({113, 100}) ->
    #{combat_type => 113, lev => 100, limit => 99,
      sq_exp => 500, sq_exp_total => 0};
get_combat_exp({113, 99}) ->
    #{combat_type => 113, lev => 99, limit => 99,
      sq_exp => 495, sq_exp_total => 0};
get_combat_exp({113, 98}) ->
    #{combat_type => 113, lev => 98, limit => 99,
      sq_exp => 490, sq_exp_total => 0};
get_combat_exp({113, 97}) ->
    #{combat_type => 113, lev => 97, limit => 99,
      sq_exp => 485, sq_exp_total => 0};
get_combat_exp({113, 96}) ->
    #{combat_type => 113, lev => 96, limit => 99,
      sq_exp => 480, sq_exp_total => 0};
get_combat_exp({113, 95}) ->
    #{combat_type => 113, lev => 95, limit => 99,
      sq_exp => 475, sq_exp_total => 0};
get_combat_exp({113, 94}) ->
    #{combat_type => 113, lev => 94, limit => 99,
      sq_exp => 470, sq_exp_total => 0};
get_combat_exp({113, 93}) ->
    #{combat_type => 113, lev => 93, limit => 99,
      sq_exp => 465, sq_exp_total => 0};
get_combat_exp({113, 92}) ->
    #{combat_type => 113, lev => 92, limit => 99,
      sq_exp => 460, sq_exp_total => 0};
get_combat_exp({113, 91}) ->
    #{combat_type => 113, lev => 91, limit => 99,
      sq_exp => 455, sq_exp_total => 0};
get_combat_exp({113, 90}) ->
    #{combat_type => 113, lev => 90, limit => 99,
      sq_exp => 450, sq_exp_total => 0};
get_combat_exp({58, 130}) ->
    #{combat_type => 58, lev => 130, limit => 99,
      sq_exp => 2400, sq_exp_total => 0};
get_combat_exp({58, 129}) ->
    #{combat_type => 58, lev => 129, limit => 99,
      sq_exp => 2400, sq_exp_total => 0};
get_combat_exp({58, 128}) ->
    #{combat_type => 58, lev => 128, limit => 99,
      sq_exp => 2400, sq_exp_total => 0};
get_combat_exp({58, 127}) ->
    #{combat_type => 58, lev => 127, limit => 99,
      sq_exp => 2400, sq_exp_total => 0};
get_combat_exp({58, 126}) ->
    #{combat_type => 58, lev => 126, limit => 99,
      sq_exp => 2400, sq_exp_total => 0};
get_combat_exp({58, 125}) ->
    #{combat_type => 58, lev => 125, limit => 99,
      sq_exp => 2400, sq_exp_total => 0};
get_combat_exp({58, 124}) ->
    #{combat_type => 58, lev => 124, limit => 99,
      sq_exp => 2400, sq_exp_total => 0};
get_combat_exp({58, 123}) ->
    #{combat_type => 58, lev => 123, limit => 99,
      sq_exp => 2400, sq_exp_total => 0};
get_combat_exp({58, 122}) ->
    #{combat_type => 58, lev => 122, limit => 99,
      sq_exp => 2400, sq_exp_total => 0};
get_combat_exp({58, 121}) ->
    #{combat_type => 58, lev => 121, limit => 99,
      sq_exp => 2400, sq_exp_total => 0};
get_combat_exp({58, 120}) ->
    #{combat_type => 58, lev => 120, limit => 99,
      sq_exp => 2400, sq_exp_total => 0};
get_combat_exp({58, 119}) ->
    #{combat_type => 58, lev => 119, limit => 99,
      sq_exp => 2380, sq_exp_total => 0};
get_combat_exp({58, 118}) ->
    #{combat_type => 58, lev => 118, limit => 99,
      sq_exp => 2360, sq_exp_total => 0};
get_combat_exp({58, 117}) ->
    #{combat_type => 58, lev => 117, limit => 99,
      sq_exp => 2340, sq_exp_total => 0};
get_combat_exp({58, 116}) ->
    #{combat_type => 58, lev => 116, limit => 99,
      sq_exp => 2320, sq_exp_total => 0};
get_combat_exp({58, 115}) ->
    #{combat_type => 58, lev => 115, limit => 99,
      sq_exp => 2300, sq_exp_total => 0};
get_combat_exp({58, 114}) ->
    #{combat_type => 58, lev => 114, limit => 99,
      sq_exp => 2280, sq_exp_total => 0};
get_combat_exp({58, 113}) ->
    #{combat_type => 58, lev => 113, limit => 99,
      sq_exp => 2260, sq_exp_total => 0};
get_combat_exp({58, 112}) ->
    #{combat_type => 58, lev => 112, limit => 99,
      sq_exp => 2240, sq_exp_total => 0};
get_combat_exp({58, 111}) ->
    #{combat_type => 58, lev => 111, limit => 99,
      sq_exp => 2220, sq_exp_total => 0};
get_combat_exp({58, 110}) ->
    #{combat_type => 58, lev => 110, limit => 99,
      sq_exp => 2200, sq_exp_total => 0};
get_combat_exp({58, 109}) ->
    #{combat_type => 58, lev => 109, limit => 99,
      sq_exp => 2180, sq_exp_total => 0};
get_combat_exp({58, 108}) ->
    #{combat_type => 58, lev => 108, limit => 99,
      sq_exp => 2160, sq_exp_total => 0};
get_combat_exp({58, 107}) ->
    #{combat_type => 58, lev => 107, limit => 99,
      sq_exp => 2140, sq_exp_total => 0};
get_combat_exp({58, 106}) ->
    #{combat_type => 58, lev => 106, limit => 99,
      sq_exp => 2120, sq_exp_total => 0};
get_combat_exp({58, 105}) ->
    #{combat_type => 58, lev => 105, limit => 99,
      sq_exp => 2100, sq_exp_total => 0};
get_combat_exp({58, 104}) ->
    #{combat_type => 58, lev => 104, limit => 99,
      sq_exp => 2080, sq_exp_total => 0};
get_combat_exp({58, 103}) ->
    #{combat_type => 58, lev => 103, limit => 99,
      sq_exp => 2060, sq_exp_total => 0};
get_combat_exp({58, 102}) ->
    #{combat_type => 58, lev => 102, limit => 99,
      sq_exp => 2040, sq_exp_total => 0};
get_combat_exp({58, 101}) ->
    #{combat_type => 58, lev => 101, limit => 99,
      sq_exp => 2020, sq_exp_total => 0};
get_combat_exp({58, 100}) ->
    #{combat_type => 58, lev => 100, limit => 99,
      sq_exp => 2000, sq_exp_total => 0};
get_combat_exp({58, 99}) ->
    #{combat_type => 58, lev => 99, limit => 99,
      sq_exp => 1980, sq_exp_total => 0};
get_combat_exp({58, 98}) ->
    #{combat_type => 58, lev => 98, limit => 99,
      sq_exp => 1960, sq_exp_total => 0};
get_combat_exp({58, 97}) ->
    #{combat_type => 58, lev => 97, limit => 99,
      sq_exp => 1940, sq_exp_total => 0};
get_combat_exp({58, 96}) ->
    #{combat_type => 58, lev => 96, limit => 99,
      sq_exp => 1920, sq_exp_total => 0};
get_combat_exp({58, 95}) ->
    #{combat_type => 58, lev => 95, limit => 99,
      sq_exp => 1900, sq_exp_total => 0};
get_combat_exp({58, 94}) ->
    #{combat_type => 58, lev => 94, limit => 99,
      sq_exp => 1880, sq_exp_total => 0};
get_combat_exp({58, 93}) ->
    #{combat_type => 58, lev => 93, limit => 99,
      sq_exp => 1860, sq_exp_total => 0};
get_combat_exp({58, 92}) ->
    #{combat_type => 58, lev => 92, limit => 99,
      sq_exp => 1840, sq_exp_total => 0};
get_combat_exp({58, 91}) ->
    #{combat_type => 58, lev => 91, limit => 99,
      sq_exp => 1820, sq_exp_total => 0};
get_combat_exp({58, 90}) ->
    #{combat_type => 58, lev => 90, limit => 99,
      sq_exp => 1800, sq_exp_total => 0};
get_combat_exp(_) -> 0.

get_attr_ratio(Times, 1) when Times < 1 -> 1400;
get_attr_ratio(Times, 1) when Times < 2 -> 1390;
get_attr_ratio(Times, 1) when Times < 3 -> 1380;
get_attr_ratio(Times, 1) when Times < 4 -> 1370;
get_attr_ratio(Times, 1) when Times < 5 -> 1360;
get_attr_ratio(Times, 1) when Times < 6 -> 1350;
get_attr_ratio(Times, 1) when Times < 7 -> 1340;
get_attr_ratio(Times, 1) when Times < 8 -> 1330;
get_attr_ratio(Times, 1) when Times < 9 -> 1320;
get_attr_ratio(Times, 1) when Times < 10 -> 1310;
get_attr_ratio(Times, 1) when Times < 11 -> 1300;
get_attr_ratio(Times, 1) when Times < 12 -> 1290;
get_attr_ratio(Times, 1) when Times < 13 -> 1280;
get_attr_ratio(Times, 1) when Times < 14 -> 1270;
get_attr_ratio(Times, 1) when Times < 15 -> 1260;
get_attr_ratio(Times, 1) when Times < 16 -> 1250;
get_attr_ratio(Times, 1) when Times < 17 -> 1240;
get_attr_ratio(Times, 1) when Times < 18 -> 1230;
get_attr_ratio(Times, 1) when Times < 19 -> 1220;
get_attr_ratio(Times, 1) when Times < 20 -> 1210;
get_attr_ratio(Times, 1) when Times < 21 -> 1200;
get_attr_ratio(Times, 1) when Times < 22 -> 1190;
get_attr_ratio(Times, 1) when Times < 23 -> 1180;
get_attr_ratio(Times, 1) when Times < 24 -> 1170;
get_attr_ratio(Times, 1) when Times < 25 -> 1160;
get_attr_ratio(Times, 1) when Times < 26 -> 1150;
get_attr_ratio(Times, 1) when Times < 27 -> 1140;
get_attr_ratio(Times, 1) when Times < 28 -> 1130;
get_attr_ratio(Times, 1) when Times < 29 -> 1120;
get_attr_ratio(Times, 1) when Times < 30 -> 1110;
get_attr_ratio(Times, 1) when Times < 31 -> 1100;
get_attr_ratio(Times, 1) when Times < 32 -> 1090;
get_attr_ratio(Times, 1) when Times < 33 -> 1080;
get_attr_ratio(Times, 1) when Times < 34 -> 1070;
get_attr_ratio(Times, 1) when Times < 35 -> 1060;
get_attr_ratio(Times, 1) when Times < 36 -> 1050;
get_attr_ratio(Times, 1) when Times < 37 -> 1040;
get_attr_ratio(Times, 1) when Times < 38 -> 1030;
get_attr_ratio(Times, 1) when Times < 39 -> 1020;
get_attr_ratio(Times, 1) when Times < 40 -> 1010;
get_attr_ratio(Times, 1) when Times < 41 -> 1000;
get_attr_ratio(Times, 1) when Times < 42 -> 990;
get_attr_ratio(Times, 1) when Times < 43 -> 980;
get_attr_ratio(Times, 1) when Times < 44 -> 970;
get_attr_ratio(Times, 1) when Times < 45 -> 960;
get_attr_ratio(Times, 1) when Times < 46 -> 950;
get_attr_ratio(Times, 1) when Times < 47 -> 940;
get_attr_ratio(Times, 1) when Times < 48 -> 930;
get_attr_ratio(Times, 1) when Times < 49 -> 920;
get_attr_ratio(Times, 1) when Times < 50 -> 910;
get_attr_ratio(Times, 1) when Times < 51 -> 900;
get_attr_ratio(Times, 2) when Times < 1 -> 1400;
get_attr_ratio(Times, 2) when Times < 2 -> 1390;
get_attr_ratio(Times, 2) when Times < 3 -> 1380;
get_attr_ratio(Times, 2) when Times < 4 -> 1370;
get_attr_ratio(Times, 2) when Times < 5 -> 1360;
get_attr_ratio(Times, 2) when Times < 6 -> 1350;
get_attr_ratio(Times, 2) when Times < 7 -> 1340;
get_attr_ratio(Times, 2) when Times < 8 -> 1330;
get_attr_ratio(Times, 2) when Times < 9 -> 1320;
get_attr_ratio(Times, 2) when Times < 10 -> 1310;
get_attr_ratio(Times, 2) when Times < 11 -> 1300;
get_attr_ratio(Times, 2) when Times < 12 -> 1290;
get_attr_ratio(Times, 2) when Times < 13 -> 1280;
get_attr_ratio(Times, 2) when Times < 14 -> 1270;
get_attr_ratio(Times, 2) when Times < 15 -> 1260;
get_attr_ratio(Times, 2) when Times < 16 -> 1250;
get_attr_ratio(Times, 2) when Times < 17 -> 1240;
get_attr_ratio(Times, 2) when Times < 18 -> 1230;
get_attr_ratio(Times, 2) when Times < 19 -> 1220;
get_attr_ratio(Times, 2) when Times < 20 -> 1210;
get_attr_ratio(Times, 2) when Times < 21 -> 1200;
get_attr_ratio(Times, 2) when Times < 22 -> 1190;
get_attr_ratio(Times, 2) when Times < 23 -> 1180;
get_attr_ratio(Times, 2) when Times < 24 -> 1170;
get_attr_ratio(Times, 2) when Times < 25 -> 1160;
get_attr_ratio(Times, 2) when Times < 26 -> 1150;
get_attr_ratio(Times, 2) when Times < 27 -> 1140;
get_attr_ratio(Times, 2) when Times < 28 -> 1130;
get_attr_ratio(Times, 2) when Times < 29 -> 1120;
get_attr_ratio(Times, 2) when Times < 30 -> 1110;
get_attr_ratio(Times, 2) when Times < 31 -> 1100;
get_attr_ratio(Times, 2) when Times < 32 -> 1090;
get_attr_ratio(Times, 2) when Times < 33 -> 1080;
get_attr_ratio(Times, 2) when Times < 34 -> 1070;
get_attr_ratio(Times, 2) when Times < 35 -> 1060;
get_attr_ratio(Times, 2) when Times < 36 -> 1050;
get_attr_ratio(Times, 2) when Times < 37 -> 1040;
get_attr_ratio(Times, 2) when Times < 38 -> 1030;
get_attr_ratio(Times, 2) when Times < 39 -> 1020;
get_attr_ratio(Times, 2) when Times < 40 -> 1010;
get_attr_ratio(Times, 2) when Times < 41 -> 1000;
get_attr_ratio(Times, 2) when Times < 42 -> 990;
get_attr_ratio(Times, 2) when Times < 43 -> 980;
get_attr_ratio(Times, 2) when Times < 44 -> 970;
get_attr_ratio(Times, 2) when Times < 45 -> 960;
get_attr_ratio(Times, 2) when Times < 46 -> 950;
get_attr_ratio(Times, 2) when Times < 47 -> 940;
get_attr_ratio(Times, 2) when Times < 48 -> 930;
get_attr_ratio(Times, 2) when Times < 49 -> 920;
get_attr_ratio(Times, 2) when Times < 50 -> 910;
get_attr_ratio(Times, 2) when Times < 51 -> 900;
get_attr_ratio(Times, 3) when Times < 1 -> 1400;
get_attr_ratio(Times, 3) when Times < 2 -> 1390;
get_attr_ratio(Times, 3) when Times < 3 -> 1380;
get_attr_ratio(Times, 3) when Times < 4 -> 1370;
get_attr_ratio(Times, 3) when Times < 5 -> 1360;
get_attr_ratio(Times, 3) when Times < 6 -> 1350;
get_attr_ratio(Times, 3) when Times < 7 -> 1340;
get_attr_ratio(Times, 3) when Times < 8 -> 1330;
get_attr_ratio(Times, 3) when Times < 9 -> 1320;
get_attr_ratio(Times, 3) when Times < 10 -> 1310;
get_attr_ratio(Times, 3) when Times < 11 -> 1300;
get_attr_ratio(Times, 3) when Times < 12 -> 1290;
get_attr_ratio(Times, 3) when Times < 13 -> 1280;
get_attr_ratio(Times, 3) when Times < 14 -> 1270;
get_attr_ratio(Times, 3) when Times < 15 -> 1260;
get_attr_ratio(Times, 3) when Times < 16 -> 1250;
get_attr_ratio(Times, 3) when Times < 17 -> 1240;
get_attr_ratio(Times, 3) when Times < 18 -> 1230;
get_attr_ratio(Times, 3) when Times < 19 -> 1220;
get_attr_ratio(Times, 3) when Times < 20 -> 1210;
get_attr_ratio(Times, 3) when Times < 21 -> 1200;
get_attr_ratio(Times, 3) when Times < 22 -> 1190;
get_attr_ratio(Times, 3) when Times < 23 -> 1180;
get_attr_ratio(Times, 3) when Times < 24 -> 1170;
get_attr_ratio(Times, 3) when Times < 25 -> 1160;
get_attr_ratio(Times, 3) when Times < 26 -> 1150;
get_attr_ratio(Times, 3) when Times < 27 -> 1140;
get_attr_ratio(Times, 3) when Times < 28 -> 1130;
get_attr_ratio(Times, 3) when Times < 29 -> 1120;
get_attr_ratio(Times, 3) when Times < 30 -> 1110;
get_attr_ratio(Times, 3) when Times < 31 -> 1100;
get_attr_ratio(Times, 3) when Times < 32 -> 1090;
get_attr_ratio(Times, 3) when Times < 33 -> 1080;
get_attr_ratio(Times, 3) when Times < 34 -> 1070;
get_attr_ratio(Times, 3) when Times < 35 -> 1060;
get_attr_ratio(Times, 3) when Times < 36 -> 1050;
get_attr_ratio(Times, 3) when Times < 37 -> 1040;
get_attr_ratio(Times, 3) when Times < 38 -> 1030;
get_attr_ratio(Times, 3) when Times < 39 -> 1020;
get_attr_ratio(Times, 3) when Times < 40 -> 1010;
get_attr_ratio(Times, 3) when Times < 41 -> 1000;
get_attr_ratio(Times, 3) when Times < 42 -> 990;
get_attr_ratio(Times, 3) when Times < 43 -> 980;
get_attr_ratio(Times, 3) when Times < 44 -> 970;
get_attr_ratio(Times, 3) when Times < 45 -> 960;
get_attr_ratio(Times, 3) when Times < 46 -> 950;
get_attr_ratio(Times, 3) when Times < 47 -> 940;
get_attr_ratio(Times, 3) when Times < 48 -> 930;
get_attr_ratio(Times, 3) when Times < 49 -> 920;
get_attr_ratio(Times, 3) when Times < 50 -> 910;
get_attr_ratio(Times, 3) when Times < 51 -> 900;
get_attr_ratio(Times, 4) when Times < 1 -> 1400;
get_attr_ratio(Times, 4) when Times < 2 -> 1390;
get_attr_ratio(Times, 4) when Times < 3 -> 1380;
get_attr_ratio(Times, 4) when Times < 4 -> 1370;
get_attr_ratio(Times, 4) when Times < 5 -> 1360;
get_attr_ratio(Times, 4) when Times < 6 -> 1350;
get_attr_ratio(Times, 4) when Times < 7 -> 1340;
get_attr_ratio(Times, 4) when Times < 8 -> 1330;
get_attr_ratio(Times, 4) when Times < 9 -> 1320;
get_attr_ratio(Times, 4) when Times < 10 -> 1310;
get_attr_ratio(Times, 4) when Times < 11 -> 1300;
get_attr_ratio(Times, 4) when Times < 12 -> 1290;
get_attr_ratio(Times, 4) when Times < 13 -> 1280;
get_attr_ratio(Times, 4) when Times < 14 -> 1270;
get_attr_ratio(Times, 4) when Times < 15 -> 1260;
get_attr_ratio(Times, 4) when Times < 16 -> 1250;
get_attr_ratio(Times, 4) when Times < 17 -> 1240;
get_attr_ratio(Times, 4) when Times < 18 -> 1230;
get_attr_ratio(Times, 4) when Times < 19 -> 1220;
get_attr_ratio(Times, 4) when Times < 20 -> 1210;
get_attr_ratio(Times, 4) when Times < 21 -> 1200;
get_attr_ratio(Times, 4) when Times < 22 -> 1190;
get_attr_ratio(Times, 4) when Times < 23 -> 1180;
get_attr_ratio(Times, 4) when Times < 24 -> 1170;
get_attr_ratio(Times, 4) when Times < 25 -> 1160;
get_attr_ratio(Times, 4) when Times < 26 -> 1150;
get_attr_ratio(Times, 4) when Times < 27 -> 1140;
get_attr_ratio(Times, 4) when Times < 28 -> 1130;
get_attr_ratio(Times, 4) when Times < 29 -> 1120;
get_attr_ratio(Times, 4) when Times < 30 -> 1110;
get_attr_ratio(Times, 4) when Times < 31 -> 1100;
get_attr_ratio(Times, 4) when Times < 32 -> 1090;
get_attr_ratio(Times, 4) when Times < 33 -> 1080;
get_attr_ratio(Times, 4) when Times < 34 -> 1070;
get_attr_ratio(Times, 4) when Times < 35 -> 1060;
get_attr_ratio(Times, 4) when Times < 36 -> 1050;
get_attr_ratio(Times, 4) when Times < 37 -> 1040;
get_attr_ratio(Times, 4) when Times < 38 -> 1030;
get_attr_ratio(Times, 4) when Times < 39 -> 1020;
get_attr_ratio(Times, 4) when Times < 40 -> 1010;
get_attr_ratio(Times, 4) when Times < 41 -> 1000;
get_attr_ratio(Times, 4) when Times < 42 -> 990;
get_attr_ratio(Times, 4) when Times < 43 -> 980;
get_attr_ratio(Times, 4) when Times < 44 -> 970;
get_attr_ratio(Times, 4) when Times < 45 -> 960;
get_attr_ratio(Times, 4) when Times < 46 -> 950;
get_attr_ratio(Times, 4) when Times < 47 -> 940;
get_attr_ratio(Times, 4) when Times < 48 -> 930;
get_attr_ratio(Times, 4) when Times < 49 -> 920;
get_attr_ratio(Times, 4) when Times < 50 -> 910;
get_attr_ratio(Times, 4) when Times < 51 -> 900;
get_attr_ratio(Times, 5) when Times < 1 -> 1400;
get_attr_ratio(Times, 5) when Times < 2 -> 1390;
get_attr_ratio(Times, 5) when Times < 3 -> 1380;
get_attr_ratio(Times, 5) when Times < 4 -> 1370;
get_attr_ratio(Times, 5) when Times < 5 -> 1360;
get_attr_ratio(Times, 5) when Times < 6 -> 1350;
get_attr_ratio(Times, 5) when Times < 7 -> 1340;
get_attr_ratio(Times, 5) when Times < 8 -> 1330;
get_attr_ratio(Times, 5) when Times < 9 -> 1320;
get_attr_ratio(Times, 5) when Times < 10 -> 1310;
get_attr_ratio(Times, 5) when Times < 11 -> 1300;
get_attr_ratio(Times, 5) when Times < 12 -> 1290;
get_attr_ratio(Times, 5) when Times < 13 -> 1280;
get_attr_ratio(Times, 5) when Times < 14 -> 1270;
get_attr_ratio(Times, 5) when Times < 15 -> 1260;
get_attr_ratio(Times, 5) when Times < 16 -> 1250;
get_attr_ratio(Times, 5) when Times < 17 -> 1240;
get_attr_ratio(Times, 5) when Times < 18 -> 1230;
get_attr_ratio(Times, 5) when Times < 19 -> 1220;
get_attr_ratio(Times, 5) when Times < 20 -> 1210;
get_attr_ratio(Times, 5) when Times < 21 -> 1200;
get_attr_ratio(Times, 5) when Times < 22 -> 1190;
get_attr_ratio(Times, 5) when Times < 23 -> 1180;
get_attr_ratio(Times, 5) when Times < 24 -> 1170;
get_attr_ratio(Times, 5) when Times < 25 -> 1160;
get_attr_ratio(Times, 5) when Times < 26 -> 1150;
get_attr_ratio(Times, 5) when Times < 27 -> 1140;
get_attr_ratio(Times, 5) when Times < 28 -> 1130;
get_attr_ratio(Times, 5) when Times < 29 -> 1120;
get_attr_ratio(Times, 5) when Times < 30 -> 1110;
get_attr_ratio(Times, 5) when Times < 31 -> 1100;
get_attr_ratio(Times, 5) when Times < 32 -> 1090;
get_attr_ratio(Times, 5) when Times < 33 -> 1080;
get_attr_ratio(Times, 5) when Times < 34 -> 1070;
get_attr_ratio(Times, 5) when Times < 35 -> 1060;
get_attr_ratio(Times, 5) when Times < 36 -> 1050;
get_attr_ratio(Times, 5) when Times < 37 -> 1040;
get_attr_ratio(Times, 5) when Times < 38 -> 1030;
get_attr_ratio(Times, 5) when Times < 39 -> 1020;
get_attr_ratio(Times, 5) when Times < 40 -> 1010;
get_attr_ratio(Times, 5) when Times < 41 -> 1000;
get_attr_ratio(Times, 5) when Times < 42 -> 990;
get_attr_ratio(Times, 5) when Times < 43 -> 980;
get_attr_ratio(Times, 5) when Times < 44 -> 970;
get_attr_ratio(Times, 5) when Times < 45 -> 960;
get_attr_ratio(Times, 5) when Times < 46 -> 950;
get_attr_ratio(Times, 5) when Times < 47 -> 940;
get_attr_ratio(Times, 5) when Times < 48 -> 930;
get_attr_ratio(Times, 5) when Times < 49 -> 920;
get_attr_ratio(Times, 5) when Times < 50 -> 910;
get_attr_ratio(Times, 5) when Times < 51 -> 900;
get_attr_ratio(Times, 6) when Times < 1 -> 1400;
get_attr_ratio(Times, 6) when Times < 2 -> 1390;
get_attr_ratio(Times, 6) when Times < 3 -> 1380;
get_attr_ratio(Times, 6) when Times < 4 -> 1370;
get_attr_ratio(Times, 6) when Times < 5 -> 1360;
get_attr_ratio(Times, 6) when Times < 6 -> 1350;
get_attr_ratio(Times, 6) when Times < 7 -> 1340;
get_attr_ratio(Times, 6) when Times < 8 -> 1330;
get_attr_ratio(Times, 6) when Times < 9 -> 1320;
get_attr_ratio(Times, 6) when Times < 10 -> 1310;
get_attr_ratio(Times, 6) when Times < 11 -> 1300;
get_attr_ratio(Times, 6) when Times < 12 -> 1290;
get_attr_ratio(Times, 6) when Times < 13 -> 1280;
get_attr_ratio(Times, 6) when Times < 14 -> 1270;
get_attr_ratio(Times, 6) when Times < 15 -> 1260;
get_attr_ratio(Times, 6) when Times < 16 -> 1250;
get_attr_ratio(Times, 6) when Times < 17 -> 1240;
get_attr_ratio(Times, 6) when Times < 18 -> 1230;
get_attr_ratio(Times, 6) when Times < 19 -> 1220;
get_attr_ratio(Times, 6) when Times < 20 -> 1210;
get_attr_ratio(Times, 6) when Times < 21 -> 1200;
get_attr_ratio(Times, 6) when Times < 22 -> 1190;
get_attr_ratio(Times, 6) when Times < 23 -> 1180;
get_attr_ratio(Times, 6) when Times < 24 -> 1170;
get_attr_ratio(Times, 6) when Times < 25 -> 1160;
get_attr_ratio(Times, 6) when Times < 26 -> 1150;
get_attr_ratio(Times, 6) when Times < 27 -> 1140;
get_attr_ratio(Times, 6) when Times < 28 -> 1130;
get_attr_ratio(Times, 6) when Times < 29 -> 1120;
get_attr_ratio(Times, 6) when Times < 30 -> 1110;
get_attr_ratio(Times, 6) when Times < 31 -> 1100;
get_attr_ratio(Times, 6) when Times < 32 -> 1090;
get_attr_ratio(Times, 6) when Times < 33 -> 1080;
get_attr_ratio(Times, 6) when Times < 34 -> 1070;
get_attr_ratio(Times, 6) when Times < 35 -> 1060;
get_attr_ratio(Times, 6) when Times < 36 -> 1050;
get_attr_ratio(Times, 6) when Times < 37 -> 1040;
get_attr_ratio(Times, 6) when Times < 38 -> 1030;
get_attr_ratio(Times, 6) when Times < 39 -> 1020;
get_attr_ratio(Times, 6) when Times < 40 -> 1010;
get_attr_ratio(Times, 6) when Times < 41 -> 1000;
get_attr_ratio(Times, 6) when Times < 42 -> 990;
get_attr_ratio(Times, 6) when Times < 43 -> 980;
get_attr_ratio(Times, 6) when Times < 44 -> 970;
get_attr_ratio(Times, 6) when Times < 45 -> 960;
get_attr_ratio(Times, 6) when Times < 46 -> 950;
get_attr_ratio(Times, 6) when Times < 47 -> 940;
get_attr_ratio(Times, 6) when Times < 48 -> 930;
get_attr_ratio(Times, 6) when Times < 49 -> 920;
get_attr_ratio(Times, 6) when Times < 50 -> 910;
get_attr_ratio(Times, 6) when Times < 51 -> 900;
get_attr_ratio(Times, 7) when Times < 1 -> 1400;
get_attr_ratio(Times, 7) when Times < 2 -> 1390;
get_attr_ratio(Times, 7) when Times < 3 -> 1380;
get_attr_ratio(Times, 7) when Times < 4 -> 1370;
get_attr_ratio(Times, 7) when Times < 5 -> 1360;
get_attr_ratio(Times, 7) when Times < 6 -> 1350;
get_attr_ratio(Times, 7) when Times < 7 -> 1340;
get_attr_ratio(Times, 7) when Times < 8 -> 1330;
get_attr_ratio(Times, 7) when Times < 9 -> 1320;
get_attr_ratio(Times, 7) when Times < 10 -> 1310;
get_attr_ratio(Times, 7) when Times < 11 -> 1300;
get_attr_ratio(Times, 7) when Times < 12 -> 1290;
get_attr_ratio(Times, 7) when Times < 13 -> 1280;
get_attr_ratio(Times, 7) when Times < 14 -> 1270;
get_attr_ratio(Times, 7) when Times < 15 -> 1260;
get_attr_ratio(Times, 7) when Times < 16 -> 1250;
get_attr_ratio(Times, 7) when Times < 17 -> 1240;
get_attr_ratio(Times, 7) when Times < 18 -> 1230;
get_attr_ratio(Times, 7) when Times < 19 -> 1220;
get_attr_ratio(Times, 7) when Times < 20 -> 1210;
get_attr_ratio(Times, 7) when Times < 21 -> 1200;
get_attr_ratio(Times, 7) when Times < 22 -> 1190;
get_attr_ratio(Times, 7) when Times < 23 -> 1180;
get_attr_ratio(Times, 7) when Times < 24 -> 1170;
get_attr_ratio(Times, 7) when Times < 25 -> 1160;
get_attr_ratio(Times, 7) when Times < 26 -> 1150;
get_attr_ratio(Times, 7) when Times < 27 -> 1140;
get_attr_ratio(Times, 7) when Times < 28 -> 1130;
get_attr_ratio(Times, 7) when Times < 29 -> 1120;
get_attr_ratio(Times, 7) when Times < 30 -> 1110;
get_attr_ratio(Times, 7) when Times < 31 -> 1100;
get_attr_ratio(Times, 7) when Times < 32 -> 1090;
get_attr_ratio(Times, 7) when Times < 33 -> 1080;
get_attr_ratio(Times, 7) when Times < 34 -> 1070;
get_attr_ratio(Times, 7) when Times < 35 -> 1060;
get_attr_ratio(Times, 7) when Times < 36 -> 1050;
get_attr_ratio(Times, 7) when Times < 37 -> 1040;
get_attr_ratio(Times, 7) when Times < 38 -> 1030;
get_attr_ratio(Times, 7) when Times < 39 -> 1020;
get_attr_ratio(Times, 7) when Times < 40 -> 1010;
get_attr_ratio(Times, 7) when Times < 41 -> 1000;
get_attr_ratio(Times, 7) when Times < 42 -> 990;
get_attr_ratio(Times, 7) when Times < 43 -> 980;
get_attr_ratio(Times, 7) when Times < 44 -> 970;
get_attr_ratio(Times, 7) when Times < 45 -> 960;
get_attr_ratio(Times, 7) when Times < 46 -> 950;
get_attr_ratio(Times, 7) when Times < 47 -> 940;
get_attr_ratio(Times, 7) when Times < 48 -> 930;
get_attr_ratio(Times, 7) when Times < 49 -> 920;
get_attr_ratio(Times, 7) when Times < 50 -> 910;
get_attr_ratio(Times, 7) when Times < 51 -> 900;
get_attr_ratio(_, _) -> 1000.

get_classes_skillid({1, 1}) -> 10009;
get_classes_skillid({1, 2}) -> 10009;
get_classes_skillid({1, 3}) -> 10009;
get_classes_skillid({1, 4}) -> 10009;
get_classes_skillid({1, 5}) -> 10009;
get_classes_skillid({1, 6}) -> 10009;
get_classes_skillid({1, 7}) -> 10009;
get_classes_skillid({1, 8}) -> 10009;
get_classes_skillid({1, 9}) -> 10009;
get_classes_skillid({1, 10}) -> 10009;
get_classes_skillid({1, 11}) -> 10009;
get_classes_skillid({1, 12}) -> 10009;
get_classes_skillid({1, 13}) -> 10009;
get_classes_skillid({1, 14}) -> 10009;
get_classes_skillid({1, 15}) -> 10009;
get_classes_skillid({1, 16}) -> 10009;
get_classes_skillid({1, 17}) -> 10009;
get_classes_skillid({1, 18}) -> 10009;
get_classes_skillid({1, 19}) -> 10009;
get_classes_skillid({1, 20}) -> 10009;
get_classes_skillid({1, 21}) -> 10009;
get_classes_skillid({1, 22}) -> 10009;
get_classes_skillid({1, 23}) -> 10009;
get_classes_skillid({1, 24}) -> 10009;
get_classes_skillid({1, 25}) -> 10009;
get_classes_skillid({1, 26}) -> 10009;
get_classes_skillid({1, 27}) -> 10009;
get_classes_skillid({1, 28}) -> 10009;
get_classes_skillid({1, 29}) -> 10009;
get_classes_skillid({1, 30}) -> 10009;
get_classes_skillid({1, 31}) -> 10009;
get_classes_skillid({1, 32}) -> 10009;
get_classes_skillid({1, 33}) -> 10009;
get_classes_skillid({1, 34}) -> 10009;
get_classes_skillid({1, 35}) -> 10009;
get_classes_skillid({1, 36}) -> 10009;
get_classes_skillid({1, 37}) -> 10009;
get_classes_skillid({1, 38}) -> 10009;
get_classes_skillid({1, 39}) -> 10009;
get_classes_skillid({1, 40}) -> 10009;
get_classes_skillid({1, 41}) -> 10009;
get_classes_skillid({1, 42}) -> 10009;
get_classes_skillid({1, 43}) -> 10009;
get_classes_skillid({1, 44}) -> 10009;
get_classes_skillid({1, 45}) -> 10009;
get_classes_skillid({1, 46}) -> 10009;
get_classes_skillid({1, 47}) -> 10009;
get_classes_skillid({1, 48}) -> 10009;
get_classes_skillid({1, 49}) -> 10009;
get_classes_skillid({1, 50}) -> 10009;
get_classes_skillid({1, 51}) -> 10009;
get_classes_skillid({1, 52}) -> 10009;
get_classes_skillid({1, 53}) -> 10009;
get_classes_skillid({1, 54}) -> 10009;
get_classes_skillid({1, 55}) -> 10009;
get_classes_skillid({1, 56}) -> 10009;
get_classes_skillid({1, 57}) -> 10009;
get_classes_skillid({1, 58}) -> 10009;
get_classes_skillid({1, 59}) -> 10009;
get_classes_skillid({1, 60}) -> 10009;
get_classes_skillid({1, 61}) -> 10009;
get_classes_skillid({1, 62}) -> 10009;
get_classes_skillid({1, 63}) -> 10009;
get_classes_skillid({1, 64}) -> 10009;
get_classes_skillid({1, 65}) -> 10009;
get_classes_skillid({1, 66}) -> 10009;
get_classes_skillid({1, 67}) -> 10009;
get_classes_skillid({1, 68}) -> 10009;
get_classes_skillid({1, 69}) -> 10009;
get_classes_skillid({1, 70}) -> 10009;
get_classes_skillid({2, 1}) -> 20009;
get_classes_skillid({2, 2}) -> 20009;
get_classes_skillid({2, 3}) -> 20009;
get_classes_skillid({2, 4}) -> 20009;
get_classes_skillid({2, 5}) -> 20009;
get_classes_skillid({2, 6}) -> 20009;
get_classes_skillid({2, 7}) -> 20009;
get_classes_skillid({2, 8}) -> 20009;
get_classes_skillid({2, 9}) -> 20009;
get_classes_skillid({2, 10}) -> 20009;
get_classes_skillid({2, 11}) -> 20009;
get_classes_skillid({2, 12}) -> 20009;
get_classes_skillid({2, 13}) -> 20009;
get_classes_skillid({2, 14}) -> 20009;
get_classes_skillid({2, 15}) -> 20009;
get_classes_skillid({2, 16}) -> 20009;
get_classes_skillid({2, 17}) -> 20009;
get_classes_skillid({2, 18}) -> 20009;
get_classes_skillid({2, 19}) -> 20009;
get_classes_skillid({2, 20}) -> 20009;
get_classes_skillid({2, 21}) -> 20009;
get_classes_skillid({2, 22}) -> 20009;
get_classes_skillid({2, 23}) -> 20009;
get_classes_skillid({2, 24}) -> 20009;
get_classes_skillid({2, 25}) -> 20009;
get_classes_skillid({2, 26}) -> 20009;
get_classes_skillid({2, 27}) -> 20009;
get_classes_skillid({2, 28}) -> 20009;
get_classes_skillid({2, 29}) -> 20009;
get_classes_skillid({2, 30}) -> 20009;
get_classes_skillid({2, 31}) -> 20009;
get_classes_skillid({2, 32}) -> 20009;
get_classes_skillid({2, 33}) -> 20009;
get_classes_skillid({2, 34}) -> 20009;
get_classes_skillid({2, 35}) -> 20009;
get_classes_skillid({2, 36}) -> 20009;
get_classes_skillid({2, 37}) -> 20009;
get_classes_skillid({2, 38}) -> 20009;
get_classes_skillid({2, 39}) -> 20009;
get_classes_skillid({2, 40}) -> 20009;
get_classes_skillid({2, 41}) -> 20009;
get_classes_skillid({2, 42}) -> 20009;
get_classes_skillid({2, 43}) -> 20009;
get_classes_skillid({2, 44}) -> 20009;
get_classes_skillid({2, 45}) -> 20009;
get_classes_skillid({2, 46}) -> 20009;
get_classes_skillid({2, 47}) -> 20009;
get_classes_skillid({2, 48}) -> 20009;
get_classes_skillid({2, 49}) -> 20009;
get_classes_skillid({2, 50}) -> 20009;
get_classes_skillid({2, 51}) -> 20009;
get_classes_skillid({2, 52}) -> 20009;
get_classes_skillid({2, 53}) -> 20009;
get_classes_skillid({2, 54}) -> 20009;
get_classes_skillid({2, 55}) -> 20009;
get_classes_skillid({2, 56}) -> 20009;
get_classes_skillid({2, 57}) -> 20009;
get_classes_skillid({2, 58}) -> 20009;
get_classes_skillid({2, 59}) -> 20009;
get_classes_skillid({2, 60}) -> 20009;
get_classes_skillid({2, 61}) -> 20009;
get_classes_skillid({2, 62}) -> 20009;
get_classes_skillid({2, 63}) -> 20009;
get_classes_skillid({2, 64}) -> 20009;
get_classes_skillid({2, 65}) -> 20009;
get_classes_skillid({2, 66}) -> 20009;
get_classes_skillid({2, 67}) -> 20009;
get_classes_skillid({2, 68}) -> 20009;
get_classes_skillid({2, 69}) -> 20009;
get_classes_skillid({2, 70}) -> 20009;
get_classes_skillid({3, 1}) -> 30009;
get_classes_skillid({3, 2}) -> 30009;
get_classes_skillid({3, 3}) -> 30009;
get_classes_skillid({3, 4}) -> 30009;
get_classes_skillid({3, 5}) -> 30009;
get_classes_skillid({3, 6}) -> 30009;
get_classes_skillid({3, 7}) -> 30009;
get_classes_skillid({3, 8}) -> 30009;
get_classes_skillid({3, 9}) -> 30009;
get_classes_skillid({3, 10}) -> 30009;
get_classes_skillid({3, 11}) -> 30009;
get_classes_skillid({3, 12}) -> 30009;
get_classes_skillid({3, 13}) -> 30009;
get_classes_skillid({3, 14}) -> 30009;
get_classes_skillid({3, 15}) -> 30009;
get_classes_skillid({3, 16}) -> 30009;
get_classes_skillid({3, 17}) -> 30009;
get_classes_skillid({3, 18}) -> 30009;
get_classes_skillid({3, 19}) -> 30009;
get_classes_skillid({3, 20}) -> 30009;
get_classes_skillid({3, 21}) -> 30009;
get_classes_skillid({3, 22}) -> 30009;
get_classes_skillid({3, 23}) -> 30009;
get_classes_skillid({3, 24}) -> 30009;
get_classes_skillid({3, 25}) -> 30009;
get_classes_skillid({3, 26}) -> 30009;
get_classes_skillid({3, 27}) -> 30009;
get_classes_skillid({3, 28}) -> 30009;
get_classes_skillid({3, 29}) -> 30009;
get_classes_skillid({3, 30}) -> 30009;
get_classes_skillid({3, 31}) -> 30009;
get_classes_skillid({3, 32}) -> 30009;
get_classes_skillid({3, 33}) -> 30009;
get_classes_skillid({3, 34}) -> 30009;
get_classes_skillid({3, 35}) -> 30009;
get_classes_skillid({3, 36}) -> 30009;
get_classes_skillid({3, 37}) -> 30009;
get_classes_skillid({3, 38}) -> 30009;
get_classes_skillid({3, 39}) -> 30009;
get_classes_skillid({3, 40}) -> 30009;
get_classes_skillid({3, 41}) -> 30009;
get_classes_skillid({3, 42}) -> 30009;
get_classes_skillid({3, 43}) -> 30009;
get_classes_skillid({3, 44}) -> 30009;
get_classes_skillid({3, 45}) -> 30009;
get_classes_skillid({3, 46}) -> 30009;
get_classes_skillid({3, 47}) -> 30009;
get_classes_skillid({3, 48}) -> 30009;
get_classes_skillid({3, 49}) -> 30009;
get_classes_skillid({3, 50}) -> 30009;
get_classes_skillid({3, 51}) -> 30009;
get_classes_skillid({3, 52}) -> 30009;
get_classes_skillid({3, 53}) -> 30009;
get_classes_skillid({3, 54}) -> 30009;
get_classes_skillid({3, 55}) -> 30009;
get_classes_skillid({3, 56}) -> 30009;
get_classes_skillid({3, 57}) -> 30009;
get_classes_skillid({3, 58}) -> 30009;
get_classes_skillid({3, 59}) -> 30009;
get_classes_skillid({3, 60}) -> 30009;
get_classes_skillid({3, 61}) -> 30009;
get_classes_skillid({3, 62}) -> 30009;
get_classes_skillid({3, 63}) -> 30009;
get_classes_skillid({3, 64}) -> 30009;
get_classes_skillid({3, 65}) -> 30009;
get_classes_skillid({3, 66}) -> 30009;
get_classes_skillid({3, 67}) -> 30009;
get_classes_skillid({3, 68}) -> 30009;
get_classes_skillid({3, 69}) -> 30009;
get_classes_skillid({3, 70}) -> 30009;
get_classes_skillid({4, 1}) -> 40009;
get_classes_skillid({4, 2}) -> 40009;
get_classes_skillid({4, 3}) -> 40009;
get_classes_skillid({4, 4}) -> 40009;
get_classes_skillid({4, 5}) -> 40009;
get_classes_skillid({4, 6}) -> 40009;
get_classes_skillid({4, 7}) -> 40009;
get_classes_skillid({4, 8}) -> 40009;
get_classes_skillid({4, 9}) -> 40009;
get_classes_skillid({4, 10}) -> 40009;
get_classes_skillid({4, 11}) -> 40009;
get_classes_skillid({4, 12}) -> 40009;
get_classes_skillid({4, 13}) -> 40009;
get_classes_skillid({4, 14}) -> 40009;
get_classes_skillid({4, 15}) -> 40009;
get_classes_skillid({4, 16}) -> 40009;
get_classes_skillid({4, 17}) -> 40009;
get_classes_skillid({4, 18}) -> 40009;
get_classes_skillid({4, 19}) -> 40009;
get_classes_skillid({4, 20}) -> 40009;
get_classes_skillid({4, 21}) -> 40009;
get_classes_skillid({4, 22}) -> 40009;
get_classes_skillid({4, 23}) -> 40009;
get_classes_skillid({4, 24}) -> 40009;
get_classes_skillid({4, 25}) -> 40009;
get_classes_skillid({4, 26}) -> 40009;
get_classes_skillid({4, 27}) -> 40009;
get_classes_skillid({4, 28}) -> 40009;
get_classes_skillid({4, 29}) -> 40009;
get_classes_skillid({4, 30}) -> 40009;
get_classes_skillid({4, 31}) -> 40009;
get_classes_skillid({4, 32}) -> 40009;
get_classes_skillid({4, 33}) -> 40009;
get_classes_skillid({4, 34}) -> 40009;
get_classes_skillid({4, 35}) -> 40009;
get_classes_skillid({4, 36}) -> 40009;
get_classes_skillid({4, 37}) -> 40009;
get_classes_skillid({4, 38}) -> 40009;
get_classes_skillid({4, 39}) -> 40009;
get_classes_skillid({4, 40}) -> 40009;
get_classes_skillid({4, 41}) -> 40009;
get_classes_skillid({4, 42}) -> 40009;
get_classes_skillid({4, 43}) -> 40009;
get_classes_skillid({4, 44}) -> 40009;
get_classes_skillid({4, 45}) -> 40009;
get_classes_skillid({4, 46}) -> 40009;
get_classes_skillid({4, 47}) -> 40009;
get_classes_skillid({4, 48}) -> 40009;
get_classes_skillid({4, 49}) -> 40009;
get_classes_skillid({4, 50}) -> 40009;
get_classes_skillid({4, 51}) -> 40009;
get_classes_skillid({4, 52}) -> 40009;
get_classes_skillid({4, 53}) -> 40009;
get_classes_skillid({4, 54}) -> 40009;
get_classes_skillid({4, 55}) -> 40009;
get_classes_skillid({4, 56}) -> 40009;
get_classes_skillid({4, 57}) -> 40009;
get_classes_skillid({4, 58}) -> 40009;
get_classes_skillid({4, 59}) -> 40009;
get_classes_skillid({4, 60}) -> 40009;
get_classes_skillid({4, 61}) -> 40009;
get_classes_skillid({4, 62}) -> 40009;
get_classes_skillid({4, 63}) -> 40009;
get_classes_skillid({4, 64}) -> 40009;
get_classes_skillid({4, 65}) -> 40009;
get_classes_skillid({4, 66}) -> 40009;
get_classes_skillid({4, 67}) -> 40009;
get_classes_skillid({4, 68}) -> 40009;
get_classes_skillid({4, 69}) -> 40009;
get_classes_skillid({4, 70}) -> 40009;
get_classes_skillid({5, 1}) -> 50009;
get_classes_skillid({5, 2}) -> 50009;
get_classes_skillid({5, 3}) -> 50009;
get_classes_skillid({5, 4}) -> 50009;
get_classes_skillid({5, 5}) -> 50009;
get_classes_skillid({5, 6}) -> 50009;
get_classes_skillid({5, 7}) -> 50009;
get_classes_skillid({5, 8}) -> 50009;
get_classes_skillid({5, 9}) -> 50009;
get_classes_skillid({5, 10}) -> 50009;
get_classes_skillid({5, 11}) -> 50009;
get_classes_skillid({5, 12}) -> 50009;
get_classes_skillid({5, 13}) -> 50009;
get_classes_skillid({5, 14}) -> 50009;
get_classes_skillid({5, 15}) -> 50009;
get_classes_skillid({5, 16}) -> 50009;
get_classes_skillid({5, 17}) -> 50009;
get_classes_skillid({5, 18}) -> 50009;
get_classes_skillid({5, 19}) -> 50009;
get_classes_skillid({5, 20}) -> 50009;
get_classes_skillid({5, 21}) -> 50009;
get_classes_skillid({5, 22}) -> 50009;
get_classes_skillid({5, 23}) -> 50009;
get_classes_skillid({5, 24}) -> 50009;
get_classes_skillid({5, 25}) -> 50009;
get_classes_skillid({5, 26}) -> 50009;
get_classes_skillid({5, 27}) -> 50009;
get_classes_skillid({5, 28}) -> 50009;
get_classes_skillid({5, 29}) -> 50009;
get_classes_skillid({5, 30}) -> 50009;
get_classes_skillid({5, 31}) -> 50009;
get_classes_skillid({5, 32}) -> 50009;
get_classes_skillid({5, 33}) -> 50009;
get_classes_skillid({5, 34}) -> 50009;
get_classes_skillid({5, 35}) -> 50009;
get_classes_skillid({5, 36}) -> 50009;
get_classes_skillid({5, 37}) -> 50009;
get_classes_skillid({5, 38}) -> 50009;
get_classes_skillid({5, 39}) -> 50009;
get_classes_skillid({5, 40}) -> 50009;
get_classes_skillid({5, 41}) -> 50009;
get_classes_skillid({5, 42}) -> 50009;
get_classes_skillid({5, 43}) -> 50009;
get_classes_skillid({5, 44}) -> 50009;
get_classes_skillid({5, 45}) -> 50009;
get_classes_skillid({5, 46}) -> 50009;
get_classes_skillid({5, 47}) -> 50009;
get_classes_skillid({5, 48}) -> 50009;
get_classes_skillid({5, 49}) -> 50009;
get_classes_skillid({5, 50}) -> 50009;
get_classes_skillid({5, 51}) -> 50009;
get_classes_skillid({5, 52}) -> 50009;
get_classes_skillid({5, 53}) -> 50009;
get_classes_skillid({5, 54}) -> 50009;
get_classes_skillid({5, 55}) -> 50009;
get_classes_skillid({5, 56}) -> 50009;
get_classes_skillid({5, 57}) -> 50009;
get_classes_skillid({5, 58}) -> 50009;
get_classes_skillid({5, 59}) -> 50009;
get_classes_skillid({5, 60}) -> 50009;
get_classes_skillid({5, 61}) -> 50009;
get_classes_skillid({5, 62}) -> 50009;
get_classes_skillid({5, 63}) -> 50009;
get_classes_skillid({5, 64}) -> 50009;
get_classes_skillid({5, 65}) -> 50009;
get_classes_skillid({5, 66}) -> 50009;
get_classes_skillid({5, 67}) -> 50009;
get_classes_skillid({5, 68}) -> 50009;
get_classes_skillid({5, 69}) -> 50009;
get_classes_skillid({5, 70}) -> 50009;
get_classes_skillid({6, 1}) -> 69009;
get_classes_skillid({6, 2}) -> 69009;
get_classes_skillid({6, 3}) -> 69009;
get_classes_skillid({6, 4}) -> 69009;
get_classes_skillid({6, 5}) -> 69009;
get_classes_skillid({6, 6}) -> 69009;
get_classes_skillid({6, 7}) -> 69009;
get_classes_skillid({6, 8}) -> 69009;
get_classes_skillid({6, 9}) -> 69009;
get_classes_skillid({6, 10}) -> 69009;
get_classes_skillid({6, 11}) -> 69009;
get_classes_skillid({6, 12}) -> 69009;
get_classes_skillid({6, 13}) -> 69009;
get_classes_skillid({6, 14}) -> 69009;
get_classes_skillid({6, 15}) -> 69009;
get_classes_skillid({6, 16}) -> 69009;
get_classes_skillid({6, 17}) -> 69009;
get_classes_skillid({6, 18}) -> 69009;
get_classes_skillid({6, 19}) -> 69009;
get_classes_skillid({6, 20}) -> 69009;
get_classes_skillid({6, 21}) -> 69009;
get_classes_skillid({6, 22}) -> 69009;
get_classes_skillid({6, 23}) -> 69009;
get_classes_skillid({6, 24}) -> 69009;
get_classes_skillid({6, 25}) -> 69009;
get_classes_skillid({6, 26}) -> 69009;
get_classes_skillid({6, 27}) -> 69009;
get_classes_skillid({6, 28}) -> 69009;
get_classes_skillid({6, 29}) -> 69009;
get_classes_skillid({6, 30}) -> 69009;
get_classes_skillid({6, 31}) -> 69009;
get_classes_skillid({6, 32}) -> 69009;
get_classes_skillid({6, 33}) -> 69009;
get_classes_skillid({6, 34}) -> 69009;
get_classes_skillid({6, 35}) -> 69009;
get_classes_skillid({6, 36}) -> 69009;
get_classes_skillid({6, 37}) -> 69009;
get_classes_skillid({6, 38}) -> 69009;
get_classes_skillid({6, 39}) -> 69009;
get_classes_skillid({6, 40}) -> 69009;
get_classes_skillid({6, 41}) -> 69009;
get_classes_skillid({6, 42}) -> 69009;
get_classes_skillid({6, 43}) -> 69009;
get_classes_skillid({6, 44}) -> 69009;
get_classes_skillid({6, 45}) -> 69009;
get_classes_skillid({6, 46}) -> 69009;
get_classes_skillid({6, 47}) -> 69009;
get_classes_skillid({6, 48}) -> 69009;
get_classes_skillid({6, 49}) -> 69009;
get_classes_skillid({6, 50}) -> 69009;
get_classes_skillid({6, 51}) -> 69009;
get_classes_skillid({6, 52}) -> 69009;
get_classes_skillid({6, 53}) -> 69009;
get_classes_skillid({6, 54}) -> 69009;
get_classes_skillid({6, 55}) -> 69009;
get_classes_skillid({6, 56}) -> 69009;
get_classes_skillid({6, 57}) -> 69009;
get_classes_skillid({6, 58}) -> 69009;
get_classes_skillid({6, 59}) -> 69009;
get_classes_skillid({6, 60}) -> 69009;
get_classes_skillid({6, 61}) -> 69009;
get_classes_skillid({6, 62}) -> 69009;
get_classes_skillid({6, 63}) -> 69009;
get_classes_skillid({6, 64}) -> 69009;
get_classes_skillid({6, 65}) -> 69009;
get_classes_skillid({6, 66}) -> 69009;
get_classes_skillid({6, 67}) -> 69009;
get_classes_skillid({6, 68}) -> 69009;
get_classes_skillid({6, 69}) -> 69009;
get_classes_skillid({6, 70}) -> 69009;
get_classes_skillid({7, 1}) -> 69511;
get_classes_skillid({7, 2}) -> 69511;
get_classes_skillid({7, 3}) -> 69511;
get_classes_skillid({7, 4}) -> 69511;
get_classes_skillid({7, 5}) -> 69511;
get_classes_skillid({7, 6}) -> 69511;
get_classes_skillid({7, 7}) -> 69511;
get_classes_skillid({7, 8}) -> 69511;
get_classes_skillid({7, 9}) -> 69511;
get_classes_skillid({7, 10}) -> 69511;
get_classes_skillid({7, 11}) -> 69511;
get_classes_skillid({7, 12}) -> 69511;
get_classes_skillid({7, 13}) -> 69511;
get_classes_skillid({7, 14}) -> 69511;
get_classes_skillid({7, 15}) -> 69511;
get_classes_skillid({7, 16}) -> 69511;
get_classes_skillid({7, 17}) -> 69511;
get_classes_skillid({7, 18}) -> 69511;
get_classes_skillid({7, 19}) -> 69511;
get_classes_skillid({7, 20}) -> 69511;
get_classes_skillid({7, 21}) -> 69511;
get_classes_skillid({7, 22}) -> 69511;
get_classes_skillid({7, 23}) -> 69511;
get_classes_skillid({7, 24}) -> 69511;
get_classes_skillid({7, 25}) -> 69511;
get_classes_skillid({7, 26}) -> 69511;
get_classes_skillid({7, 27}) -> 69511;
get_classes_skillid({7, 28}) -> 69511;
get_classes_skillid({7, 29}) -> 69511;
get_classes_skillid({7, 30}) -> 69511;
get_classes_skillid({7, 31}) -> 69511;
get_classes_skillid({7, 32}) -> 69511;
get_classes_skillid({7, 33}) -> 69511;
get_classes_skillid({7, 34}) -> 69511;
get_classes_skillid({7, 35}) -> 69511;
get_classes_skillid({7, 36}) -> 69511;
get_classes_skillid({7, 37}) -> 69511;
get_classes_skillid({7, 38}) -> 69511;
get_classes_skillid({7, 39}) -> 69511;
get_classes_skillid({7, 40}) -> 69511;
get_classes_skillid({7, 41}) -> 69511;
get_classes_skillid({7, 42}) -> 69511;
get_classes_skillid({7, 43}) -> 69511;
get_classes_skillid({7, 44}) -> 69511;
get_classes_skillid({7, 45}) -> 69511;
get_classes_skillid({7, 46}) -> 69511;
get_classes_skillid({7, 47}) -> 69511;
get_classes_skillid({7, 48}) -> 69511;
get_classes_skillid({7, 49}) -> 69511;
get_classes_skillid({7, 50}) -> 69511;
get_classes_skillid({7, 51}) -> 69511;
get_classes_skillid({7, 52}) -> 69511;
get_classes_skillid({7, 53}) -> 69511;
get_classes_skillid({7, 54}) -> 69511;
get_classes_skillid({7, 55}) -> 69511;
get_classes_skillid({7, 56}) -> 69511;
get_classes_skillid({7, 57}) -> 69511;
get_classes_skillid({7, 58}) -> 69511;
get_classes_skillid({7, 59}) -> 69511;
get_classes_skillid({7, 60}) -> 69511;
get_classes_skillid({7, 61}) -> 69511;
get_classes_skillid({7, 62}) -> 69511;
get_classes_skillid({7, 63}) -> 69511;
get_classes_skillid({7, 64}) -> 69511;
get_classes_skillid({7, 65}) -> 69511;
get_classes_skillid({7, 66}) -> 69511;
get_classes_skillid({7, 67}) -> 69511;
get_classes_skillid({7, 68}) -> 69511;
get_classes_skillid({7, 69}) -> 69511;
get_classes_skillid({7, 70}) -> 69511;
get_classes_skillid(_) -> 0.

get_classes_stoneId(1) -> 23824;
get_classes_stoneId(2) -> 23825;
get_classes_stoneId(3) -> 23826;
get_classes_stoneId(4) -> 23827;
get_classes_stoneId(5) -> 23828;
get_classes_stoneId(6) -> 23835;
get_classes_stoneId(7) -> 23829;
get_classes_stoneId(_) -> 0.

