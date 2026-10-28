-file("src/data/warrior_data.erl", 1).

-module(warrior_data).

-export([ready_reward/1,
         get_group/1,
         group_name/1,
         buff_ids/0,
         get_buff/1,
         buff_name/1,
         get_magic_buff/1,
         get_buff_by_type/1,
         multi_kill_ratio/1,
         prevent_kill_ratio/1,
         late_revive/1,
         exchange_score/1,
         score_ratio/0,
         exp/1,
         pet_exp/1,
         drop_item/1,
         exp_score_ratio/1,
         get_spec_unit/1,
         buffs/0,
         win_item/1,
         all_win_items/0,
         phase_timer/1,
         timer/1,
         rank_type/1,
         group_order/1,
         order_group/1,
         orders/0,
         get_cross_list/1,
         get_all_cross_list/0,
         get_all_cross_id/1,
         get_all_combat_mode/0,
         get_cross_id/1,
         get_rank/1]).

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

-file("src/data/warrior_data.erl", 48).

-file("inc/warrior.hrl", 1).

-record(warrior_ready_zone,
        {cross_id = 0,
         map_id = 0 :: non_neg_integer(),
         map_zone = 0,
         map_plat = "",
         map_pid :: pid() | undefined,
         member_size = 0 :: non_neg_integer(),
         group_id = 0 :: pos_integer(),
         exit_npc,
         combat_mode = 1,
         init_combat_mode = 0}).

-record(warrior_zone,
        {cross_id = 0,
         id = 0,
         key,
         group_id = 0 :: pos_integer(),
         seq_id = 0,
         pid,
         is_close = 0}).

-record(warrior_field,
        {id = 0 :: non_neg_integer(),
         key,
         cross_id = 0,
         group_id = 0 :: non_neg_integer(),
         seq_id = 0 :: non_neg_integer(),
         pid :: pid() | undefined,
         map_id = 0,
         map_pid,
         map_plat = "",
         map_zone = 0,
         green_num = 0,
         green_score = 0,
         white_num = 0,
         white_score = 0,
         phase = 0,
         combat_mode = 1}).

-record(warrior_zone_role,
        {id,
         pid,
         name = "",
         sex = 0,
         classes = 0,
         lev = 0 :: non_neg_integer(),
         group_id = 0 :: pos_integer(),
         field_id = 0,
         camp = 0,
         revive = 0,
         status = 0,
         is_combat = 0,
         combat_pid,
         last_combat_over_time = 0,
         last_role_id,
         win_count = 0,
         combat_count = 0,
         score = 0,
         cross_id = 0}).

-record(warrior,
        {id ::
             undefined |
             {pos_integer(), bitstring(), non_neg_integer()},
         pid :: pid() | undefined,
         name = "" :: string(),
         sex = 0,
         classes = 0,
         face_id = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         fc = 0 :: non_neg_integer(),
         group_id = 0 :: pos_integer(),
         kill = 0 :: non_neg_integer(),
         multi_kill = 0 :: non_neg_integer(),
         score = 0 :: non_neg_integer(),
         rank = 0 :: pos_integer(),
         revive = 0 :: non_neg_integer(),
         death = 0 :: non_neg_integer(),
         multi_death = 0 :: non_neg_integer(),
         dead_time = 0 :: non_neg_integer(),
         camp = 0,
         ready_map_id = 0 :: non_neg_integer(),
         ready_map_pid :: pid() | undefined,
         ready_map_plat = "",
         ready_map_zone = 0,
         seq_id = 0 :: non_neg_integer(),
         field_id = 0 :: non_neg_integer(),
         field_map_id = 0 :: non_neg_integer(),
         field_map_plat = "",
         field_map_zone = 0,
         field_pid :: pid() | undefined,
         field_time = 0,
         magic_buff = [] :: list(),
         status = 0,
         looks = [],
         cross_id = 0,
         combat_mode = 1}).

-record(warrior_group_data,
        {id = 0, name = "", order = 0, members = []}).

-record(warrior_win_item_data,
        {base_id = 0,
         weight = 0,
         max = 0,
         is_notice = 0,
         num = 0}).

-record(warrior_drop_item_data,
        {base_id = 0,
         weight = 0,
         result = 0,
         is_notice = 0,
         num = 0}).

-record(warrior_scene_unit,
        {battle_id = 0,
         type = 0,
         sub_type = 0,
         buff_id = 0,
         spec_id = 0,
         item_base_id = 0,
         unit_base_id = 0,
         field_id = 0}).

-record(warrior_buff_data,
        {buff_id = 0, type = 0, unit_base_id = 0, name = ""}).

-record(warrior_magic_buff,
        {buff_id = 0,
         name = "",
         status = 0,
         type = 0,
         x = 0,
         y = 0,
         time = 0,
         owner_id,
         owner_name = "",
         next_owner_id,
         next_owner_pid,
         camp = 0}).

-record(warrior_combat, {pid, field_id = 0, field_key}).

-record(warrior_timer_data,
        {id = 0,
         phase = 0,
         type = 0,
         spec_id = 0,
         buff_id = 0,
         start = 0,
         interval = 0,
         finished = 0,
         num = 0,
         max = 0}).

-record(warrior_combat_result,
        {field_pid,
         lose_buff = 0,
         win_buff = 0,
         takeover = false,
         round = 0}).

-record(warrior_combat_win,
        {field_pid,
         lose_buff = 0,
         win_buff = 0,
         takeover = false,
         score = 0,
         round = 0,
         id,
         name,
         camp = 0,
         wish_buff = 0}).

-record(warrior_combat_lose,
        {field_pid,
         lose_buff = 0,
         win_buff = 0,
         takeover = false,
         score = 0,
         round = 0,
         id,
         name,
         camp = 0,
         revive = 0}).

-record(warrior_embattle,
        {role_id = {0, "", 0}, pets = [], guards = []}).

-record(warrior_rank_reward_data,
        {group = 0,
         min = 0,
         max = 0,
         items = [],
         title = "",
         content = ""}).

-file("src/data/warrior_data.erl", 49).

-file("inc/gain.hrl", 1).

-record(gain,
        {label :: undefined | atom(),
         val :: undefined | term(),
         msg = "" :: list(),
         source = 0 :: non_neg_integer(),
         notice_msg = "" :: list(),
         reason :: undefined | atom(),
         ext = 0 :: term(),
         notice = 0 :: 0..1,
         ext_val = 0}).

-record(loss,
        {label :: undefined | atom(),
         val :: undefined | term(),
         msg = "" :: list(),
         notice_msg = "" :: list(),
         source = 0 :: non_neg_integer(),
         reason :: undefined | atom(),
         ext = 0 :: term(),
         ext_val = 0,
         auto_scene = "" :: list()}).

-record(gain_text_opts,
        {order = loss :: gain | loss,
         gain_tag = "" :: string(),
         loss_tag = "" :: string(),
         split_str = "，" :: string(),
         split_op_str = "，" :: string(),
         merge_type = [] :: list(),
         fly_to_bag = 0 :: non_neg_integer()}).

-file("src/data/warrior_data.erl", 50).

ready_reward(30) -> [#gain{label = exp, val = 3209}];
ready_reward(31) -> [#gain{label = exp, val = 3401}];
ready_reward(32) -> [#gain{label = exp, val = 3496}];
ready_reward(33) -> [#gain{label = exp, val = 3509}];
ready_reward(34) -> [#gain{label = exp, val = 3632}];
ready_reward(35) -> [#gain{label = exp, val = 3708}];
ready_reward(36) -> [#gain{label = exp, val = 3703}];
ready_reward(37) -> [#gain{label = exp, val = 3744}];
ready_reward(38) -> [#gain{label = exp, val = 3841}];
ready_reward(39) -> [#gain{label = exp, val = 3903}];
ready_reward(40) -> [#gain{label = exp, val = 3967}];
ready_reward(41) -> [#gain{label = exp, val = 4118}];
ready_reward(42) -> [#gain{label = exp, val = 4194}];
ready_reward(43) -> [#gain{label = exp, val = 4253}];
ready_reward(44) -> [#gain{label = exp, val = 4303}];
ready_reward(45) -> [#gain{label = exp, val = 4372}];
ready_reward(46) -> [#gain{label = exp, val = 4416}];
ready_reward(47) -> [#gain{label = exp, val = 4484}];
ready_reward(48) -> [#gain{label = exp, val = 4525}];
ready_reward(49) -> [#gain{label = exp, val = 4600}];
ready_reward(50) -> [#gain{label = exp, val = 4662}];
ready_reward(51) -> [#gain{label = exp, val = 4717}];
ready_reward(52) -> [#gain{label = exp, val = 4774}];
ready_reward(53) -> [#gain{label = exp, val = 4847}];
ready_reward(54) -> [#gain{label = exp, val = 4911}];
ready_reward(55) -> [#gain{label = exp, val = 4967}];
ready_reward(56) -> [#gain{label = exp, val = 5135}];
ready_reward(57) -> [#gain{label = exp, val = 5193}];
ready_reward(58) -> [#gain{label = exp, val = 5268}];
ready_reward(59) -> [#gain{label = exp, val = 5326}];
ready_reward(60) -> [#gain{label = exp, val = 5384}];
ready_reward(61) -> [#gain{label = exp, val = 5563}];
ready_reward(62) -> [#gain{label = exp, val = 5628}];
ready_reward(63) -> [#gain{label = exp, val = 5692}];
ready_reward(64) -> [#gain{label = exp, val = 5748}];
ready_reward(65) -> [#gain{label = exp, val = 5813}];
ready_reward(66) -> [#gain{label = exp, val = 5877}];
ready_reward(67) -> [#gain{label = exp, val = 5944}];
ready_reward(68) -> [#gain{label = exp, val = 6013}];
ready_reward(69) -> [#gain{label = exp, val = 6077}];
ready_reward(70) -> [#gain{label = exp, val = 6132}];
ready_reward(71) -> [#gain{label = exp, val = 6199}];
ready_reward(72) -> [#gain{label = exp, val = 6265}];
ready_reward(73) -> [#gain{label = exp, val = 6331}];
ready_reward(74) -> [#gain{label = exp, val = 6397}];
ready_reward(75) -> [#gain{label = exp, val = 6464}];
ready_reward(76) -> [#gain{label = exp, val = 6531}];
ready_reward(77) -> [#gain{label = exp, val = 6599}];
ready_reward(78) -> [#gain{label = exp, val = 6666}];
ready_reward(79) -> [#gain{label = exp, val = 6732}];
ready_reward(80) -> [#gain{label = exp, val = 6797}];
ready_reward(81) -> [#gain{label = exp, val = 7308}];
ready_reward(82) -> [#gain{label = exp, val = 7388}];
ready_reward(83) -> [#gain{label = exp, val = 7455}];
ready_reward(84) -> [#gain{label = exp, val = 7522}];
ready_reward(85) -> [#gain{label = exp, val = 7589}];
ready_reward(86) -> [#gain{label = exp, val = 7655}];
ready_reward(87) -> [#gain{label = exp, val = 7721}];
ready_reward(88) -> [#gain{label = exp, val = 7801}];
ready_reward(89) -> [#gain{label = exp, val = 7868}];
ready_reward(90) -> [#gain{label = exp, val = 7934}];
ready_reward(91) -> [#gain{label = exp, val = 8000}];
ready_reward(92) -> [#gain{label = exp, val = 8081}];
ready_reward(93) -> [#gain{label = exp, val = 8148}];
ready_reward(94) -> [#gain{label = exp, val = 8214}];
ready_reward(95) -> [#gain{label = exp, val = 8294}];
ready_reward(96) -> [#gain{label = exp, val = 8360}];
ready_reward(97) -> [#gain{label = exp, val = 8427}];
ready_reward(98) -> [#gain{label = exp, val = 8507}];
ready_reward(99) -> [#gain{label = exp, val = 8574}];
ready_reward(100) -> [#gain{label = exp, val = 8640}];
ready_reward(101) -> [#gain{label = exp, val = 8726}];
ready_reward(102) -> [#gain{label = exp, val = 8813}];
ready_reward(103) -> [#gain{label = exp, val = 8901}];
ready_reward(104) -> [#gain{label = exp, val = 8990}];
ready_reward(105) -> [#gain{label = exp, val = 9079}];
ready_reward(106) -> [#gain{label = exp, val = 9169}];
ready_reward(107) -> [#gain{label = exp, val = 9260}];
ready_reward(108) -> [#gain{label = exp, val = 9352}];
ready_reward(109) -> [#gain{label = exp, val = 9445}];
ready_reward(110) -> [#gain{label = exp, val = 9539}];
ready_reward(111) -> [#gain{label = exp, val = 9634}];
ready_reward(112) -> [#gain{label = exp, val = 9730}];
ready_reward(113) -> [#gain{label = exp, val = 9827}];
ready_reward(114) -> [#gain{label = exp, val = 9925}];
ready_reward(115) -> [#gain{label = exp, val = 10024}];
ready_reward(116) -> [#gain{label = exp, val = 10124}];
ready_reward(117) -> [#gain{label = exp, val = 10225}];
ready_reward(118) -> [#gain{label = exp, val = 10327}];
ready_reward(119) -> [#gain{label = exp, val = 10430}];
ready_reward(120) -> [#gain{label = exp, val = 10534}];
ready_reward(121) -> [#gain{label = exp, val = 10535}];
ready_reward(122) -> [#gain{label = exp, val = 10536}];
ready_reward(123) -> [#gain{label = exp, val = 10537}];
ready_reward(124) -> [#gain{label = exp, val = 10538}];
ready_reward(125) -> [#gain{label = exp, val = 10539}];
ready_reward(126) -> [#gain{label = exp, val = 10540}];
ready_reward(127) -> [#gain{label = exp, val = 10541}];
ready_reward(128) -> [#gain{label = exp, val = 10542}];
ready_reward(129) -> [#gain{label = exp, val = 10543}];
ready_reward(130) -> [#gain{label = exp, val = 10544}];
ready_reward(_Lev) -> [].

get_group(Lev) when Lev >= 90 andalso Lev =< 130 ->
    #warrior_group_data{id = 1, name = lang:get("英雄组"),
                        order = 1};
get_group(Lev) when Lev >= 70 andalso Lev =< 89 ->
    #warrior_group_data{id = 2, name = lang:get("勇武组"),
                        order = 2};
get_group(Lev) when Lev >= 50 andalso Lev =< 69 ->
    #warrior_group_data{id = 3, name = lang:get("精锐组"),
                        order = 3};
get_group(Lev) when Lev >= 40 andalso Lev =< 49 ->
    #warrior_group_data{id = 4, name = lang:get("新秀组"),
                        order = 4};
get_group(_) -> false.

group_name(1) -> lang:get("英雄组");
group_name(2) -> lang:get("勇武组");
group_name(3) -> lang:get("精锐组");
group_name(4) -> lang:get("新秀组");
group_name(_GroupId) -> "".

buff_ids() -> [21001, 21002, 21003, 21004].

get_buff(21001) ->
    #warrior_buff_data{buff_id = 21001,
                       name = lang:get("攻击加成"), type = 1,
                       unit_base_id = 62300};
get_buff(21002) ->
    #warrior_buff_data{buff_id = 21002,
                       name = lang:get("防御加成"), type = 1,
                       unit_base_id = 62301};
get_buff(21003) ->
    #warrior_buff_data{buff_id = 21003,
                       name = lang:get("泰坦圣剑"), type = 2,
                       unit_base_id = 62304};
get_buff(21004) ->
    #warrior_buff_data{buff_id = 21004,
                       name = lang:get("宙斯神盾"), type = 3,
                       unit_base_id = 62305};
get_buff(_BuffId) -> false.

buff_name(21001) -> lang:get("攻击加成");
buff_name(21002) -> lang:get("防御加成");
buff_name(21003) -> lang:get("泰坦圣剑");
buff_name(21004) -> lang:get("宙斯神盾");
buff_name(_) -> "".

get_magic_buff(21003) -> {lang:get("泰坦圣剑"), 5};
get_magic_buff(21004) -> {lang:get("宙斯神盾"), 5};
get_magic_buff(_BuffId) -> 0.

get_buff_by_type(1) ->
    [#warrior_buff_data{buff_id = 21001,
                        name = lang:get("攻击加成"), type = 1,
                        unit_base_id = 62300},
     #warrior_buff_data{buff_id = 21002,
                        name = lang:get("防御加成"), type = 1,
                        unit_base_id = 62301}];
get_buff_by_type(2) ->
    [#warrior_buff_data{buff_id = 21003,
                        name = lang:get("泰坦圣剑"), type = 2,
                        unit_base_id = 62304}];
get_buff_by_type(3) ->
    [#warrior_buff_data{buff_id = 21004,
                        name = lang:get("宙斯神盾"), type = 3,
                        unit_base_id = 62305}];
get_buff_by_type(_Type) -> [].

multi_kill_ratio(MKill)
    when MKill >= 3 andalso MKill =< 4 ->
    150;
multi_kill_ratio(MKill)
    when MKill >= 5 andalso MKill =< 7 ->
    180;
multi_kill_ratio(MKill)
    when MKill >= 8 andalso MKill =< 9 ->
    200;
multi_kill_ratio(MKill)
    when MKill >= 10 andalso MKill =< 999 ->
    220;
multi_kill_ratio(_MKill) -> 1000.

prevent_kill_ratio(MKill)
    when MKill >= 3 andalso MKill =< 4 ->
    150;
prevent_kill_ratio(MKill)
    when MKill >= 5 andalso MKill =< 7 ->
    180;
prevent_kill_ratio(MKill)
    when MKill >= 8 andalso MKill =< 9 ->
    200;
prevent_kill_ratio(MKill)
    when MKill >= 10 andalso MKill =< 999 ->
    220;
prevent_kill_ratio(_MKill) -> 100.

late_revive(Sec) when Sec =< 1000 -> 1;
late_revive(_LateSec) -> 100.

exchange_score(30) -> 1000;
exchange_score(31) -> 1000;
exchange_score(32) -> 1000;
exchange_score(33) -> 1000;
exchange_score(34) -> 1000;
exchange_score(35) -> 1000;
exchange_score(36) -> 1000;
exchange_score(37) -> 1000;
exchange_score(38) -> 1000;
exchange_score(39) -> 1000;
exchange_score(40) -> 1000;
exchange_score(41) -> 1000;
exchange_score(42) -> 1000;
exchange_score(43) -> 1000;
exchange_score(44) -> 1000;
exchange_score(45) -> 1000;
exchange_score(46) -> 1000;
exchange_score(47) -> 1000;
exchange_score(48) -> 1000;
exchange_score(49) -> 1000;
exchange_score(50) -> 1000;
exchange_score(51) -> 1000;
exchange_score(52) -> 1000;
exchange_score(53) -> 1000;
exchange_score(54) -> 1000;
exchange_score(55) -> 1000;
exchange_score(56) -> 1000;
exchange_score(57) -> 1000;
exchange_score(58) -> 1000;
exchange_score(59) -> 1000;
exchange_score(60) -> 1000;
exchange_score(61) -> 1000;
exchange_score(62) -> 1000;
exchange_score(63) -> 1000;
exchange_score(64) -> 1000;
exchange_score(65) -> 1000;
exchange_score(66) -> 1000;
exchange_score(67) -> 1000;
exchange_score(68) -> 1000;
exchange_score(69) -> 1000;
exchange_score(70) -> 1000;
exchange_score(71) -> 1000;
exchange_score(72) -> 1000;
exchange_score(73) -> 1000;
exchange_score(74) -> 1000;
exchange_score(75) -> 1000;
exchange_score(76) -> 1000;
exchange_score(77) -> 1000;
exchange_score(78) -> 1000;
exchange_score(79) -> 1000;
exchange_score(80) -> 1000;
exchange_score(81) -> 1000;
exchange_score(82) -> 1000;
exchange_score(83) -> 1000;
exchange_score(84) -> 1000;
exchange_score(85) -> 1000;
exchange_score(86) -> 1000;
exchange_score(87) -> 1000;
exchange_score(88) -> 1000;
exchange_score(89) -> 1000;
exchange_score(90) -> 1000;
exchange_score(91) -> 1000;
exchange_score(92) -> 1000;
exchange_score(93) -> 1000;
exchange_score(94) -> 1000;
exchange_score(95) -> 1000;
exchange_score(96) -> 1000;
exchange_score(97) -> 1000;
exchange_score(98) -> 1000;
exchange_score(99) -> 1000;
exchange_score(100) -> 1000;
exchange_score(101) -> 1000;
exchange_score(102) -> 1000;
exchange_score(103) -> 1000;
exchange_score(104) -> 1000;
exchange_score(105) -> 1000;
exchange_score(106) -> 1000;
exchange_score(107) -> 1000;
exchange_score(108) -> 1000;
exchange_score(109) -> 1000;
exchange_score(110) -> 1000;
exchange_score(111) -> 1000;
exchange_score(112) -> 1000;
exchange_score(113) -> 1000;
exchange_score(114) -> 1000;
exchange_score(115) -> 1000;
exchange_score(116) -> 1000;
exchange_score(117) -> 1000;
exchange_score(118) -> 1000;
exchange_score(119) -> 1000;
exchange_score(120) -> 1000;
exchange_score(121) -> 1000;
exchange_score(122) -> 1000;
exchange_score(123) -> 1000;
exchange_score(124) -> 1000;
exchange_score(125) -> 1000;
exchange_score(126) -> 1000;
exchange_score(127) -> 1000;
exchange_score(128) -> 1000;
exchange_score(129) -> 1000;
exchange_score(130) -> 1000;
exchange_score(_Lev) -> false.

score_ratio() ->
    [{299, 200}, {399, 100}, {499, 50}, {999999, 30}].

exp(1) -> 0;
exp(2) -> 0;
exp(3) -> 0;
exp(4) -> 0;
exp(5) -> 0;
exp(6) -> 0;
exp(7) -> 0;
exp(8) -> 0;
exp(9) -> 0;
exp(10) -> 0;
exp(11) -> 0;
exp(12) -> 0;
exp(13) -> 0;
exp(14) -> 0;
exp(15) -> 0;
exp(16) -> 0;
exp(17) -> 0;
exp(18) -> 0;
exp(19) -> 0;
exp(20) -> 0;
exp(21) -> 0;
exp(22) -> 0;
exp(23) -> 0;
exp(24) -> 0;
exp(25) -> 0;
exp(26) -> 0;
exp(27) -> 0;
exp(28) -> 0;
exp(29) -> 0;
exp(30) -> 89847;
exp(31) -> 95233;
exp(32) -> 97879;
exp(33) -> 98260;
exp(34) -> 101685;
exp(35) -> 103824;
exp(36) -> 103676;
exp(37) -> 104843;
exp(38) -> 107537;
exp(39) -> 109279;
exp(40) -> 111086;
exp(41) -> 115293;
exp(42) -> 117444;
exp(43) -> 119089;
exp(44) -> 120473;
exp(45) -> 122419;
exp(46) -> 123649;
exp(47) -> 125539;
exp(48) -> 126706;
exp(49) -> 128810;
exp(50) -> 130541;
exp(51) -> 132086;
exp(52) -> 133675;
exp(53) -> 135721;
exp(54) -> 137509;
exp(55) -> 139081;
exp(56) -> 143793;
exp(57) -> 145412;
exp(58) -> 147510;
exp(59) -> 149132;
exp(60) -> 150751;
exp(61) -> 155759;
exp(62) -> 157588;
exp(63) -> 159368;
exp(64) -> 160957;
exp(65) -> 162762;
exp(66) -> 164553;
exp(67) -> 166443;
exp(68) -> 168358;
exp(69) -> 170169;
exp(70) -> 171709;
exp(71) -> 173569;
exp(72) -> 175414;
exp(73) -> 177270;
exp(74) -> 179121;
exp(75) -> 180993;
exp(76) -> 182880;
exp(77) -> 184771;
exp(78) -> 186636;
exp(79) -> 188494;
exp(80) -> 190317;
exp(81) -> 204620;
exp(82) -> 206860;
exp(83) -> 208734;
exp(84) -> 210606;
exp(85) -> 212490;
exp(86) -> 214327;
exp(87) -> 216192;
exp(88) -> 218439;
exp(89) -> 220304;
exp(90) -> 222151;
exp(91) -> 224011;
exp(92) -> 226270;
exp(93) -> 228134;
exp(94) -> 229988;
exp(95) -> 232237;
exp(96) -> 234084;
exp(97) -> 235960;
exp(98) -> 238203;
exp(99) -> 240072;
exp(100) -> 242472;
exp(101) -> 244896;
exp(102) -> 247344;
exp(103) -> 249817;
exp(104) -> 252315;
exp(105) -> 254838;
exp(106) -> 257386;
exp(107) -> 259959;
exp(108) -> 262558;
exp(109) -> 265183;
exp(110) -> 267834;
exp(111) -> 270512;
exp(112) -> 273217;
exp(113) -> 275949;
exp(114) -> 278708;
exp(115) -> 281495;
exp(116) -> 284309;
exp(117) -> 287152;
exp(118) -> 290023;
exp(119) -> 292923;
exp(120) -> 295852;
exp(121) -> 295852;
exp(122) -> 295852;
exp(123) -> 295852;
exp(124) -> 295852;
exp(125) -> 295852;
exp(126) -> 295852;
exp(127) -> 295852;
exp(128) -> 295852;
exp(129) -> 295852;
exp(130) -> 295852;
exp(_Lev) -> false.

pet_exp(1) -> 24471;
pet_exp(2) -> 25018;
pet_exp(3) -> 25749;
pet_exp(4) -> 26479;
pet_exp(5) -> 27027;
pet_exp(6) -> 27758;
pet_exp(7) -> 28488;
pet_exp(8) -> 29036;
pet_exp(9) -> 29766;
pet_exp(10) -> 30497;
pet_exp(11) -> 31227;
pet_exp(12) -> 31958;
pet_exp(13) -> 32506;
pet_exp(14) -> 33236;
pet_exp(15) -> 33967;
pet_exp(16) -> 34697;
pet_exp(17) -> 35428;
pet_exp(18) -> 36158;
pet_exp(19) -> 36889;
pet_exp(20) -> 37619;
pet_exp(21) -> 38349;
pet_exp(22) -> 39080;
pet_exp(23) -> 39810;
pet_exp(24) -> 40541;
pet_exp(25) -> 41271;
pet_exp(26) -> 42002;
pet_exp(27) -> 42732;
pet_exp(28) -> 43463;
pet_exp(29) -> 44193;
pet_exp(30) -> 44924;
pet_exp(31) -> 47616;
pet_exp(32) -> 48939;
pet_exp(33) -> 49130;
pet_exp(34) -> 50843;
pet_exp(35) -> 51912;
pet_exp(36) -> 51838;
pet_exp(37) -> 52422;
pet_exp(38) -> 53768;
pet_exp(39) -> 54640;
pet_exp(40) -> 55543;
pet_exp(41) -> 57647;
pet_exp(42) -> 58722;
pet_exp(43) -> 59544;
pet_exp(44) -> 60236;
pet_exp(45) -> 61209;
pet_exp(46) -> 61824;
pet_exp(47) -> 62770;
pet_exp(48) -> 63353;
pet_exp(49) -> 64405;
pet_exp(50) -> 65270;
pet_exp(51) -> 66043;
pet_exp(52) -> 66837;
pet_exp(53) -> 67861;
pet_exp(54) -> 68755;
pet_exp(55) -> 69541;
pet_exp(56) -> 71896;
pet_exp(57) -> 72706;
pet_exp(58) -> 73755;
pet_exp(59) -> 74566;
pet_exp(60) -> 75376;
pet_exp(61) -> 77880;
pet_exp(62) -> 78794;
pet_exp(63) -> 79684;
pet_exp(64) -> 80479;
pet_exp(65) -> 81381;
pet_exp(66) -> 82277;
pet_exp(67) -> 83222;
pet_exp(68) -> 84179;
pet_exp(69) -> 85085;
pet_exp(70) -> 85854;
pet_exp(71) -> 86785;
pet_exp(72) -> 87707;
pet_exp(73) -> 88635;
pet_exp(74) -> 89561;
pet_exp(75) -> 90496;
pet_exp(76) -> 91440;
pet_exp(77) -> 92386;
pet_exp(78) -> 93318;
pet_exp(79) -> 94247;
pet_exp(80) -> 95159;
pet_exp(81) -> 102310;
pet_exp(82) -> 103430;
pet_exp(83) -> 104367;
pet_exp(84) -> 105303;
pet_exp(85) -> 106245;
pet_exp(86) -> 107163;
pet_exp(87) -> 108096;
pet_exp(88) -> 109220;
pet_exp(89) -> 110152;
pet_exp(90) -> 111076;
pet_exp(91) -> 112005;
pet_exp(92) -> 113135;
pet_exp(93) -> 114067;
pet_exp(94) -> 114994;
pet_exp(95) -> 116118;
pet_exp(96) -> 117042;
pet_exp(97) -> 117980;
pet_exp(98) -> 119101;
pet_exp(99) -> 120036;
pet_exp(100) -> 121236;
pet_exp(101) -> 122448;
pet_exp(102) -> 123672;
pet_exp(103) -> 124908;
pet_exp(104) -> 126157;
pet_exp(105) -> 127418;
pet_exp(106) -> 128692;
pet_exp(107) -> 129978;
pet_exp(108) -> 131277;
pet_exp(109) -> 132589;
pet_exp(110) -> 133914;
pet_exp(111) -> 135253;
pet_exp(112) -> 136605;
pet_exp(113) -> 137971;
pet_exp(114) -> 139350;
pet_exp(115) -> 140743;
pet_exp(116) -> 142150;
pet_exp(117) -> 143571;
pet_exp(118) -> 145006;
pet_exp(119) -> 146456;
pet_exp(120) -> 147920;
pet_exp(121) -> 147920;
pet_exp(122) -> 147920;
pet_exp(123) -> 147920;
pet_exp(124) -> 147920;
pet_exp(125) -> 147920;
pet_exp(126) -> 147920;
pet_exp(127) -> 147920;
pet_exp(128) -> 147920;
pet_exp(129) -> 147920;
pet_exp(130) -> 147920;
pet_exp(_Lev) -> false.

exp_score_ratio(Score) when Score =< 99 -> 300;
exp_score_ratio(Score) when Score =< 199 -> 600;
exp_score_ratio(Score) when Score =< 299 -> 800;
exp_score_ratio(Score) when Score =< 399 -> 900;
exp_score_ratio(Score) when Score =< 449 -> 950;
exp_score_ratio(Score) when Score =< 499 -> 1000;
exp_score_ratio(Score) when Score =< 549 -> 1050;
exp_score_ratio(Score) when Score =< 599 -> 1100;
exp_score_ratio(Score) when Score =< 649 -> 1150;
exp_score_ratio(Score) when Score =< 699 -> 1150;
exp_score_ratio(Score) when Score =< 999999 -> 1180;
exp_score_ratio(_Score) -> false.

get_spec_unit(1) -> {1, 62303, 1};
get_spec_unit(2) -> {2, 62302, 2};
get_spec_unit(_Id) -> false.

buffs() ->
    [#warrior_buff_data{buff_id = 21001,
                        name = lang:get("攻击加成"), type = 1,
                        unit_base_id = 62300},
     #warrior_buff_data{buff_id = 21002,
                        name = lang:get("防御加成"), type = 1,
                        unit_base_id = 62301},
     #warrior_buff_data{buff_id = 21003,
                        name = lang:get("泰坦圣剑"), type = 2,
                        unit_base_id = 62304},
     #warrior_buff_data{buff_id = 21004,
                        name = lang:get("宙斯神盾"), type = 3,
                        unit_base_id = 62305}].

win_item(20006) ->
    #warrior_win_item_data{base_id = 20006, weight = 150,
                           num = 10, is_notice = 0};
win_item(20052) ->
    #warrior_win_item_data{base_id = 20052, weight = 140,
                           num = 2, is_notice = 0};
win_item(20046) ->
    #warrior_win_item_data{base_id = 20046, weight = 20,
                           num = 1, is_notice = 1};
win_item(20021) ->
    #warrior_win_item_data{base_id = 20021, weight = 70,
                           num = 1, is_notice = 0};
win_item(20022) ->
    #warrior_win_item_data{base_id = 20022, weight = 10,
                           num = 1, is_notice = 1};
win_item(20025) ->
    #warrior_win_item_data{base_id = 20025, weight = 130,
                           num = 1, is_notice = 0};
win_item(20000) ->
    #warrior_win_item_data{base_id = 20000, weight = 150,
                           num = 1, is_notice = 0};
win_item(20087) ->
    #warrior_win_item_data{base_id = 20087, weight = 124,
                           num = 1, is_notice = 1};
win_item(20074) ->
    #warrior_win_item_data{base_id = 20074, weight = 35,
                           num = 1, is_notice = 0};
win_item(21100) ->
    #warrior_win_item_data{base_id = 21100, weight = 26,
                           num = 1, is_notice = 1};
win_item(20095) ->
    #warrior_win_item_data{base_id = 20095, weight = 5,
                           num = 1, is_notice = 1};
win_item(20075) ->
    #warrior_win_item_data{base_id = 20075, weight = 3,
                           num = 1, is_notice = 1};
win_item(20008) ->
    #warrior_win_item_data{base_id = 20008, weight = 15,
                           num = 1, is_notice = 0};
win_item(20009) ->
    #warrior_win_item_data{base_id = 20009, weight = 3,
                           num = 1, is_notice = 1};
win_item(20010) ->
    #warrior_win_item_data{base_id = 20010, weight = 1,
                           num = 1, is_notice = 1};
win_item(20014) ->
    #warrior_win_item_data{base_id = 20014, weight = 3,
                           num = 1, is_notice = 1};
win_item(20038) ->
    #warrior_win_item_data{base_id = 20038, weight = 3,
                           num = 1, is_notice = 1};
win_item(20076) ->
    #warrior_win_item_data{base_id = 20076, weight = 2,
                           num = 1, is_notice = 1};
win_item(20616) ->
    #warrior_win_item_data{base_id = 20616, weight = 10,
                           num = 1, is_notice = 1};
win_item(22450) ->
    #warrior_win_item_data{base_id = 22450, weight = 100,
                           num = 1, is_notice = 1};
win_item(_ItemBaseId) -> false.

all_win_items() ->
    [#warrior_win_item_data{base_id = 20006, weight = 150,
                            num = 10, is_notice = 0},
     #warrior_win_item_data{base_id = 20052, weight = 140,
                            num = 2, is_notice = 0},
     #warrior_win_item_data{base_id = 20046, weight = 20,
                            num = 1, is_notice = 1},
     #warrior_win_item_data{base_id = 20021, weight = 70,
                            num = 1, is_notice = 0},
     #warrior_win_item_data{base_id = 20022, weight = 10,
                            num = 1, is_notice = 1},
     #warrior_win_item_data{base_id = 20025, weight = 130,
                            num = 1, is_notice = 0},
     #warrior_win_item_data{base_id = 20000, weight = 150,
                            num = 1, is_notice = 0},
     #warrior_win_item_data{base_id = 20087, weight = 124,
                            num = 1, is_notice = 1},
     #warrior_win_item_data{base_id = 20074, weight = 35,
                            num = 1, is_notice = 0},
     #warrior_win_item_data{base_id = 21100, weight = 26,
                            num = 1, is_notice = 1},
     #warrior_win_item_data{base_id = 20095, weight = 5,
                            num = 1, is_notice = 1},
     #warrior_win_item_data{base_id = 20075, weight = 3,
                            num = 1, is_notice = 1},
     #warrior_win_item_data{base_id = 20008, weight = 15,
                            num = 1, is_notice = 0},
     #warrior_win_item_data{base_id = 20009, weight = 3,
                            num = 1, is_notice = 1},
     #warrior_win_item_data{base_id = 20010, weight = 1,
                            num = 1, is_notice = 1},
     #warrior_win_item_data{base_id = 20014, weight = 3,
                            num = 1, is_notice = 1},
     #warrior_win_item_data{base_id = 20038, weight = 3,
                            num = 1, is_notice = 1},
     #warrior_win_item_data{base_id = 20076, weight = 2,
                            num = 1, is_notice = 1},
     #warrior_win_item_data{base_id = 20616, weight = 10,
                            num = 1, is_notice = 1},
     #warrior_win_item_data{base_id = 22450, weight = 100,
                            num = 1, is_notice = 1}].

phase_timer(4) ->
    [#warrior_timer_data{id = 1, phase = 4, type = 2,
                         buff_id = 21001, start = 30, interval = 120,
                         finished = 1650, num = 14, max = 15},
     #warrior_timer_data{id = 2, phase = 4, type = 2,
                         buff_id = 21002, start = 15, interval = 120,
                         finished = 1650, num = 14, max = 15},
     #warrior_timer_data{id = 3, phase = 4, type = 2,
                         buff_id = 21003, start = 300, max = 1},
     #warrior_timer_data{id = 6, phase = 4, type = 1,
                         spec_id = 2, start = 540, interval = 540,
                         finished = 1620, num = 7, max = 10}];
phase_timer(6) ->
    [#warrior_timer_data{id = 7, phase = 6, type = 3,
                         start = 10, interval = 60, finished = 360}];
phase_timer(_) -> [].

timer(1) ->
    #warrior_timer_data{id = 1, phase = 4, type = 2,
                        buff_id = 21001, start = 30, interval = 120,
                        finished = 1650, num = 14, max = 15};
timer(2) ->
    #warrior_timer_data{id = 2, phase = 4, type = 2,
                        buff_id = 21002, start = 15, interval = 120,
                        finished = 1650, num = 14, max = 15};
timer(3) ->
    #warrior_timer_data{id = 3, phase = 4, type = 2,
                        buff_id = 21003, start = 300, max = 1};
timer(6) ->
    #warrior_timer_data{id = 6, phase = 4, type = 1,
                        spec_id = 2, start = 540, interval = 540,
                        finished = 1620, num = 7, max = 10};
timer(7) ->
    #warrior_timer_data{id = 7, phase = 6, type = 3,
                        start = 10, interval = 60, finished = 360};
timer(_) -> false.

rank_type(1) -> {36, 1};
rank_type(2) -> {35, 1};
rank_type(3) -> {34, 1};
rank_type(4) -> {33, 1};
rank_type(_) -> false.

drop_item(1) ->
    [#warrior_drop_item_data{base_id = 20006, num = 4,
                             result = 1, weight = 319, is_notice = 0},
     #warrior_drop_item_data{base_id = 21220, num = 1,
                             result = 1, weight = 180, is_notice = 0},
     #warrior_drop_item_data{base_id = 20046, num = 1,
                             result = 1, weight = 10, is_notice = 1},
     #warrior_drop_item_data{base_id = 20020, num = 1,
                             result = 1, weight = 80, is_notice = 0},
     #warrior_drop_item_data{base_id = 20025, num = 1,
                             result = 1, weight = 60, is_notice = 0},
     #warrior_drop_item_data{base_id = 20087, num = 1,
                             result = 1, weight = 30, is_notice = 1},
     #warrior_drop_item_data{base_id = 21100, num = 1,
                             result = 1, weight = 10, is_notice = 1},
     #warrior_drop_item_data{base_id = 20095, num = 1,
                             result = 1, weight = 1, is_notice = 1},
     #warrior_drop_item_data{base_id = 20075, num = 1,
                             result = 1, weight = 1, is_notice = 1},
     #warrior_drop_item_data{base_id = 20616, num = 1,
                             result = 1, weight = 2, is_notice = 1},
     #warrior_drop_item_data{base_id = 20617, num = 1,
                             result = 1, weight = 1, is_notice = 1},
     #warrior_drop_item_data{base_id = 20021, num = 1,
                             result = 1, weight = 80, is_notice = 0},
     #warrior_drop_item_data{base_id = 20088, num = 1,
                             result = 1, weight = 50, is_notice = 0},
     #warrior_drop_item_data{base_id = 20034, num = 1,
                             result = 1, weight = 80, is_notice = 0},
     #warrior_drop_item_data{base_id = 20045, num = 1,
                             result = 1, weight = 96, is_notice = 0}];
drop_item(0) ->
    [#warrior_drop_item_data{base_id = 20006, num = 4,
                             result = 0, weight = 319, is_notice = 0},
     #warrior_drop_item_data{base_id = 21220, num = 1,
                             result = 0, weight = 180, is_notice = 0},
     #warrior_drop_item_data{base_id = 20046, num = 1,
                             result = 0, weight = 10, is_notice = 1},
     #warrior_drop_item_data{base_id = 20020, num = 1,
                             result = 0, weight = 80, is_notice = 0},
     #warrior_drop_item_data{base_id = 20025, num = 1,
                             result = 0, weight = 60, is_notice = 0},
     #warrior_drop_item_data{base_id = 20087, num = 1,
                             result = 0, weight = 30, is_notice = 1},
     #warrior_drop_item_data{base_id = 21100, num = 1,
                             result = 0, weight = 10, is_notice = 1},
     #warrior_drop_item_data{base_id = 20095, num = 1,
                             result = 0, weight = 1, is_notice = 1},
     #warrior_drop_item_data{base_id = 20075, num = 1,
                             result = 0, weight = 1, is_notice = 1},
     #warrior_drop_item_data{base_id = 20616, num = 1,
                             result = 0, weight = 2, is_notice = 1},
     #warrior_drop_item_data{base_id = 20617, num = 1,
                             result = 0, weight = 1, is_notice = 1},
     #warrior_drop_item_data{base_id = 20021, num = 1,
                             result = 0, weight = 80, is_notice = 0},
     #warrior_drop_item_data{base_id = 20088, num = 1,
                             result = 0, weight = 50, is_notice = 0},
     #warrior_drop_item_data{base_id = 20034, num = 1,
                             result = 0, weight = 80, is_notice = 0},
     #warrior_drop_item_data{base_id = 20045, num = 1,
                             result = 0, weight = 96, is_notice = 0}];
drop_item(_Result) -> [].

group_order(1) -> 1;
group_order(2) -> 2;
group_order(3) -> 3;
group_order(4) -> 4;
group_order(_) -> 0.

order_group(1) -> 1;
order_group(2) -> 2;
order_group(3) -> 3;
order_group(4) -> 4;
order_group(_) -> 0.

orders() -> [1, 2, 3, 4].

get_cross_list({"local_center", 9000}) ->
    [{{"local", 1}, 1},
     {{"local", 2}, 1},
     {{"local", 3}, 1},
     {{"local", 4}, 1}];
get_cross_list({"dev_center", 9000}) ->
    [{{"dev", 1}, 2}, {{"dev", 2}, 2}];
get_cross_list({"center", 9000}) ->
    [{{"beta", 17}, 3},
     {{"beta", 33}, 3},
     {{"mix", 49}, 30},
     {{"mix", 1}, 30},
     {{"unite", 1}, 4},
     {{"mix", 113}, 4},
     {{"mix", 177}, 5},
     {{"unite", 97}, 5},
     {{"unite", 161}, 6},
     {{"mix", 273}, 6},
     {{"unite", 177}, 20},
     {{"unite", 193}, 20},
     {{"unite", 225}, 7},
     {{"mix", 305}, 7},
     {{"mix", 337}, 8},
     {{"unite", 241}, 8},
     {{"unite", 257}, 21},
     {{"unite", 273}, 21},
     {{"unite", 289}, 11},
     {{"mix", 353}, 11},
     {{"mix", 361}, 22},
     {{"unite", 297}, 22},
     {{"unite", 305}, 23},
     {{"unite", 309}, 23},
     {{"mix", 365}, 24},
     {{"unite", 313}, 24},
     {{"mix", 369}, 25},
     {{"unite", 317}, 25},
     {{"unite", 319}, 26},
     {{"unite", 321}, 26},
     {{"unite", 323}, 27},
     {{"mix", 373}, 27},
     {{"unite", 325}, 28},
     {{"mix", 375}, 28},
     {{"mix", 377}, 29},
     {{"unite", 327}, 29},
     {{"unite", 328}, 31},
     {{"mix", 378}, 31}];
get_cross_list(_) -> [].

get_all_cross_list() ->
    [{{"local", 1}, 1},
     {{"local", 2}, 1},
     {{"local", 3}, 1},
     {{"local", 4}, 1},
     {{"dev", 1}, 2},
     {{"dev", 2}, 2},
     {{"beta", 17}, 3},
     {{"beta", 33}, 3},
     {{"mix", 49}, 30},
     {{"mix", 1}, 30},
     {{"unite", 1}, 4},
     {{"mix", 113}, 4},
     {{"mix", 177}, 5},
     {{"unite", 97}, 5},
     {{"unite", 161}, 6},
     {{"mix", 273}, 6},
     {{"unite", 177}, 20},
     {{"unite", 193}, 20},
     {{"unite", 225}, 7},
     {{"mix", 305}, 7},
     {{"mix", 337}, 8},
     {{"unite", 241}, 8},
     {{"unite", 257}, 21},
     {{"unite", 273}, 21},
     {{"unite", 289}, 11},
     {{"mix", 353}, 11},
     {{"mix", 361}, 22},
     {{"unite", 297}, 22},
     {{"unite", 305}, 23},
     {{"unite", 309}, 23},
     {{"mix", 365}, 24},
     {{"unite", 313}, 24},
     {{"mix", 369}, 25},
     {{"unite", 317}, 25},
     {{"unite", 319}, 26},
     {{"unite", 321}, 26},
     {{"unite", 323}, 27},
     {{"mix", 373}, 27},
     {{"unite", 325}, 28},
     {{"mix", 375}, 28},
     {{"mix", 377}, 29},
     {{"unite", 327}, 29},
     {{"unite", 328}, 31},
     {{"mix", 378}, 31}].

get_all_cross_id({"local_center", 9000}) -> [1];
get_all_cross_id({"dev_center", 9000}) -> [2];
get_all_cross_id({"center", 9000}) ->
    [3,
     30,
     4,
     5,
     6,
     20,
     7,
     8,
     21,
     11,
     22,
     23,
     24,
     25,
     26,
     27,
     28,
     29,
     31];
get_all_cross_id(_) -> [0].

get_all_combat_mode() ->
    [{1, [{1, 0}, {3, 50}, {2, 60}, {4, 70}]},
     {2, [{1, 0}, {3, 50}, {2, 60}, {4, 70}]},
     {3, [{1, 0}, {3, 50}]},
     {4, [{1, 0}]}].

get_cross_id({"local", 1}) -> 1;
get_cross_id({"local", 2}) -> 1;
get_cross_id({"local", 3}) -> 1;
get_cross_id({"local", 4}) -> 1;
get_cross_id({"dev", 1}) -> 2;
get_cross_id({"dev", 2}) -> 2;
get_cross_id({"beta", 17}) -> 3;
get_cross_id({"beta", 33}) -> 3;
get_cross_id({"mix", 49}) -> 30;
get_cross_id({"mix", 1}) -> 30;
get_cross_id({"unite", 1}) -> 4;
get_cross_id({"mix", 113}) -> 4;
get_cross_id({"mix", 177}) -> 5;
get_cross_id({"unite", 97}) -> 5;
get_cross_id({"unite", 161}) -> 6;
get_cross_id({"mix", 273}) -> 6;
get_cross_id({"unite", 177}) -> 20;
get_cross_id({"unite", 193}) -> 20;
get_cross_id({"unite", 225}) -> 7;
get_cross_id({"mix", 305}) -> 7;
get_cross_id({"mix", 337}) -> 8;
get_cross_id({"unite", 241}) -> 8;
get_cross_id({"unite", 257}) -> 21;
get_cross_id({"unite", 273}) -> 21;
get_cross_id({"unite", 289}) -> 11;
get_cross_id({"mix", 353}) -> 11;
get_cross_id({"mix", 361}) -> 22;
get_cross_id({"unite", 297}) -> 22;
get_cross_id({"unite", 305}) -> 23;
get_cross_id({"unite", 309}) -> 23;
get_cross_id({"mix", 365}) -> 24;
get_cross_id({"unite", 313}) -> 24;
get_cross_id({"mix", 369}) -> 25;
get_cross_id({"unite", 317}) -> 25;
get_cross_id({"unite", 319}) -> 26;
get_cross_id({"unite", 321}) -> 26;
get_cross_id({"unite", 323}) -> 27;
get_cross_id({"mix", 373}) -> 27;
get_cross_id({"unite", 325}) -> 28;
get_cross_id({"mix", 375}) -> 28;
get_cross_id({"mix", 377}) -> 29;
get_cross_id({"unite", 327}) -> 29;
get_cross_id({"unite", 328}) -> 31;
get_cross_id({"mix", 378}) -> 31;
get_cross_id(_) -> 0.

get_rank({1, Rank}) when Rank >= 1 andalso Rank =< 3 ->
    #warrior_rank_reward_data{group = 1, min = 1, max = 3,
                              items = [{21160, 1}], title = lang:get("勇士前三名奖励"),
                              content =
                                  lang:get("狭路相逢勇者胜！恭喜您夺得英雄组前三名，请查收专属奖励")};
get_rank({2, Rank}) when Rank >= 1 andalso Rank =< 3 ->
    #warrior_rank_reward_data{group = 2, min = 1, max = 3,
                              items = [{21160, 1}], title = lang:get("勇士前三名奖励"),
                              content =
                                  lang:get("狭路相逢勇者胜！恭喜您夺得勇武组前三名，请查收专属奖励")};
get_rank({3, Rank}) when Rank >= 1 andalso Rank =< 3 ->
    #warrior_rank_reward_data{group = 3, min = 1, max = 3,
                              items = [{21160, 1}], title = lang:get("勇士前三名奖励"),
                              content =
                                  lang:get("狭路相逢勇者胜！恭喜您夺得精锐组前三名，请查收专属奖励")};
get_rank(_) -> false.

