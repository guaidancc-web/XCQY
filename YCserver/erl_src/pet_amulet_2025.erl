%% coding: utf-8
-module(pet_amulet_2025).

-export([roll/1, reset_skills/2, get_reset/1, get_high_stone/1]).

roll(20665) ->
    Skill1 = pick(super()),
    Skills =
        case util:rand(1, 1000) =< 250 of
            true ->
                [Skill1, pick(lists:keydelete(Skill1, 1, super()))];
            false -> [Skill1]
        end,
    {ok, Skills};
roll(76300) -> {ok, [60094]};
roll(76301) -> {ok, [60448]};
roll(76302) -> {ok, [60447]};
roll(76303) -> {ok, [60445]};
roll(76304) -> {ok, [60447, 60094]};
roll(76305) -> {ok, [60312, 60285]};
roll(76306) -> {ok, [60285, 60317]};
roll(76307) -> {ok, [60315, 60275]};
roll(76308) -> {ok, [60297, 60298]};
roll(76309) -> {ok, [60299, 60328]};
roll(78709) -> {ok, pick_n(god_special(), 2) ++ pick_n(super(), 2)};
roll(78716) -> {ok, pick_n(god_special(), 3) ++ pick_n(super(), 2)};
roll(78719) -> {ok, pick_n(god_special_limited(), 5)};
roll(79449) -> roll(78719);
roll(79450) -> roll(78719);
roll(79451) -> roll(78719);
roll(_) -> false.

reset_skills(20665, Len) when Len >= 1, Len =< 2 ->
    {ok, pick_n(super(), Len)};
reset_skills(20665, _Len) ->
    {error, lang:get("只有拥有技能的符石才能重置")};
reset_skills(78709, Len) when Len > 0 ->
    {ok, pick_n(god_special(), 2) ++ pick_n(super(), 2)};
reset_skills(78716, Len) when Len > 0 ->
    {ok, pick_n(god_special(), 3) ++ pick_n(super(), 2)};
reset_skills(78719, Len) when Len > 0 ->
    {ok, pick_n(god_special_limited(), 5)};
reset_skills(79449, Len) -> reset_skills(78719, Len);
reset_skills(79450, Len) -> reset_skills(78719, Len);
reset_skills(79451, Len) -> reset_skills(78719, Len);
reset_skills(_, _) -> false.

get_reset(20665) -> #{loss => [{20666, 1}]};
get_reset(78709) -> #{loss => [{78710, 1}]};
get_reset(78716) -> #{loss => [{78717, 1}]};
get_reset(78719) -> #{loss => [{78720, 1}]};
get_reset(79449) -> #{loss => [{78720, 1}]};
get_reset(79450) -> #{loss => [{78720, 1}]};
get_reset(79451) -> #{loss => [{78720, 1}]};
get_reset(_) -> false.

get_high_stone(78716) -> {250, 78719, 78718};
get_high_stone(_) -> false.

pick(Pool) ->
    {Id, _} = util:rand_list(Pool, 2),
    Id.

pick_n(_Pool, 0) -> [];
pick_n(Pool, N) ->
    Id = pick(Pool),
    [Id | pick_n(lists:keydelete(Id, 1, Pool), N - 1)].

super() ->
    [{60273, 100}, {60274, 100}, {60275, 100}, {60276, 100},
     {60277, 100}, {60278, 100}, {60279, 100}, {60280, 100},
     {60281, 100}, {60282, 100}, {60283, 100}, {60284, 100},
     {60285, 100}, {60286, 100}, {60287, 100}, {60288, 100},
     {60289, 100}, {60290, 100}, {60291, 100}, {60292, 100},
     {60293, 100}, {60294, 100}, {60295, 100}, {60296, 100},
     {60297, 100}, {60298, 100}, {60299, 100}, {60300, 100},
     {60301, 100}, {60302, 100}, {60303, 100}, {60304, 100},
     {60305, 100}, {60306, 100}, {60307, 100}, {60308, 100},
     {60309, 100}, {60310, 100}, {60311, 100}, {60312, 100},
     {60313, 100}, {60314, 100}, {60315, 100}, {60316, 100},
     {60317, 100}, {60318, 100}, {60319, 100}, {60320, 100},
     {60321, 100}, {60322, 100}, {60324, 100}, {60325, 100},
     {60326, 100}, {60327, 100}, {60328, 100}, {60329, 100},
     {60330, 100}].

god_special() ->
    god() ++ [{60094, 100}, {60445, 100}, {60447, 100}, {60448, 100}].

god() ->
    [{60332, 100}, {60334, 100}, {60335, 100}, {60336, 100},
     {60337, 100}, {60338, 100}, {60339, 100}, {60340, 100},
     {60341, 100}, {60343, 100}, {60344, 100}, {60350, 100},
     {60354, 100}, {60355, 100}, {60356, 100}, {60357, 100},
     {60358, 100}].

god_special_limited() ->
    god_special() ++
        [{60273, 100}, {60275, 100}, {60292, 100}, {60296, 100},
         {60298, 100}, {60299, 100}, {60307, 100}, {60315, 100},
         {60327, 100}, {60328, 100}].
