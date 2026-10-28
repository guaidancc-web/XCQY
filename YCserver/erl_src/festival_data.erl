-file("src/data/festival_data.erl", 1).

-module(festival_data).

-export([get/1,
         get_lev/1,
         get_exp/1,
         get_pet_exp/1,
         get_msg/1]).

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

-file("src/data/festival_data.erl", 19).

get({1, 1}) -> [{22587, 1, 1}];
get({1, 17}) -> [{22587, 1, 1}];
get({1, 24}) -> [{22587, 1, 1}];
get({1, 25}) -> [{22587, 1, 1}];
get({2, 14}) -> [{22587, 1, 1}];
get({2, 8}) -> [{22587, 1, 1}];
get({3, 8}) -> [{22587, 1, 1}];
get({3, 12}) -> [{22587, 1, 1}];
get({3, 15}) -> [{22587, 1, 1}];
get({4, 1}) -> [{22587, 1, 1}];
get({4, 4}) -> [{22587, 1, 1}];
get({4, 22}) -> [{22587, 1, 1}];
get({5, 1}) -> [{22587, 1, 1}];
get({5, 4}) -> [{22587, 1, 1}];
get({5, 10}) -> [{22587, 1, 1}];
get({6, 1}) -> [{22587, 1, 1}];
get({6, 25}) -> [{22587, 1, 1}, {22617, 1, 1}];
get({6, 21}) -> [{22587, 1, 1}];
get({7, 1}) -> [{22587, 1, 1}];
get({8, 1}) -> [{22587, 1, 1}];
get({8, 25}) -> [{22587, 1, 1}];
get({9, 10}) -> [{22587, 1, 1}];
get({10, 1}) -> [{22587, 1, 1}, {23594, 1, 1}];
get({10, 25}) -> [{22587, 1, 1}];
get({10, 31}) -> [{22587, 1, 1}];
get({11, 26}) -> [{22587, 1, 1}];
get({12, 21}) -> [{22587, 1, 1}];
get({12, 25}) -> [{22587, 1, 1}];
get({0, 0}) -> [{21220, 0, 1}];
get(_) -> false.

get_lev(_) -> [].

get_exp(1) -> 1;
get_exp(2) -> 1;
get_exp(3) -> 1;
get_exp(4) -> 1;
get_exp(5) -> 1;
get_exp(6) -> 1;
get_exp(7) -> 1;
get_exp(8) -> 1;
get_exp(9) -> 1;
get_exp(10) -> 1;
get_exp(11) -> 1;
get_exp(12) -> 1;
get_exp(13) -> 1;
get_exp(14) -> 1;
get_exp(15) -> 1;
get_exp(16) -> 1;
get_exp(17) -> 1;
get_exp(18) -> 1;
get_exp(19) -> 1;
get_exp(20) -> 49440;
get_exp(21) -> 50400;
get_exp(22) -> 51360;
get_exp(23) -> 52320;
get_exp(24) -> 53280;
get_exp(25) -> 54240;
get_exp(26) -> 55200;
get_exp(27) -> 56160;
get_exp(28) -> 57120;
get_exp(29) -> 58080;
get_exp(30) -> 59040;
get_exp(31) -> 62240;
get_exp(32) -> 63200;
get_exp(33) -> 64160;
get_exp(34) -> 65120;
get_exp(35) -> 66320;
get_exp(36) -> 67280;
get_exp(37) -> 68240;
get_exp(38) -> 69200;
get_exp(39) -> 70400;
get_exp(40) -> 71360;
get_exp(41) -> 74320;
get_exp(42) -> 75520;
get_exp(43) -> 76480;
get_exp(44) -> 77680;
get_exp(45) -> 78640;
get_exp(46) -> 79600;
get_exp(47) -> 80800;
get_exp(48) -> 81760;
get_exp(49) -> 82960;
get_exp(50) -> 83920;
get_exp(51) -> 85120;
get_exp(52) -> 86080;
get_exp(53) -> 87280;
get_exp(54) -> 88480;
get_exp(55) -> 89440;
get_exp(56) -> 92640;
get_exp(57) -> 93600;
get_exp(58) -> 94800;
get_exp(59) -> 96000;
get_exp(60) -> 96960;
get_exp(61) -> 100160;
get_exp(62) -> 101360;
get_exp(63) -> 102560;
get_exp(64) -> 103520;
get_exp(65) -> 104720;
get_exp(66) -> 105920;
get_exp(67) -> 107120;
get_exp(68) -> 108320;
get_exp(69) -> 109520;
get_exp(70) -> 110480;
get_exp(71) -> 111680;
get_exp(72) -> 112880;
get_exp(73) -> 114080;
get_exp(74) -> 115280;
get_exp(75) -> 116480;
get_exp(76) -> 117680;
get_exp(77) -> 118880;
get_exp(78) -> 120080;
get_exp(79) -> 121280;
get_exp(80) -> 122480;
get_exp(81) -> 131680;
get_exp(82) -> 133120;
get_exp(83) -> 134320;
get_exp(84) -> 135520;
get_exp(85) -> 136720;
get_exp(86) -> 137920;
get_exp(87) -> 139120;
get_exp(88) -> 140560;
get_exp(89) -> 141760;
get_exp(90) -> 142960;
get_exp(91) -> 144160;
get_exp(92) -> 145600;
get_exp(93) -> 146800;
get_exp(94) -> 148000;
get_exp(95) -> 149440;
get_exp(96) -> 150640;
get_exp(97) -> 151840;
get_exp(98) -> 153280;
get_exp(99) -> 154480;
get_exp(100) -> 155680;
get_exp(101) -> 155680;
get_exp(102) -> 155680;
get_exp(103) -> 155680;
get_exp(104) -> 155680;
get_exp(105) -> 155680;
get_exp(106) -> 155680;
get_exp(107) -> 155680;
get_exp(108) -> 155680;
get_exp(109) -> 155680;
get_exp(110) -> 155680;
get_exp(111) -> 155680;
get_exp(112) -> 155680;
get_exp(113) -> 155680;
get_exp(114) -> 155680;
get_exp(115) -> 155680;
get_exp(116) -> 155680;
get_exp(117) -> 155680;
get_exp(118) -> 155680;
get_exp(119) -> 155680;
get_exp(120) -> 155680;
get_exp(121) -> 155680;
get_exp(122) -> 155680;
get_exp(123) -> 155680;
get_exp(124) -> 155680;
get_exp(125) -> 155680;
get_exp(126) -> 155680;
get_exp(127) -> 155680;
get_exp(128) -> 155680;
get_exp(129) -> 155680;
get_exp(130) -> 155680;
get_exp(131) -> 155680;
get_exp(132) -> 155680;
get_exp(133) -> 155680;
get_exp(134) -> 155680;
get_exp(135) -> 155680;
get_exp(136) -> 155680;
get_exp(137) -> 155680;
get_exp(138) -> 155680;
get_exp(139) -> 155680;
get_exp(140) -> 155680;
get_exp(141) -> 155680;
get_exp(142) -> 155680;
get_exp(143) -> 155680;
get_exp(144) -> 155680;
get_exp(145) -> 155680;
get_exp(146) -> 155680;
get_exp(147) -> 155680;
get_exp(148) -> 155680;
get_exp(149) -> 155680;
get_exp(150) -> 155680;
get_exp(_) -> 0.

get_pet_exp(1) -> 32160;
get_pet_exp(2) -> 32880;
get_pet_exp(3) -> 33840;
get_pet_exp(4) -> 34800;
get_pet_exp(5) -> 35520;
get_pet_exp(6) -> 36480;
get_pet_exp(7) -> 37440;
get_pet_exp(8) -> 38160;
get_pet_exp(9) -> 39120;
get_pet_exp(10) -> 40080;
get_pet_exp(11) -> 41040;
get_pet_exp(12) -> 42000;
get_pet_exp(13) -> 42720;
get_pet_exp(14) -> 43680;
get_pet_exp(15) -> 44640;
get_pet_exp(16) -> 45600;
get_pet_exp(17) -> 46560;
get_pet_exp(18) -> 47520;
get_pet_exp(19) -> 48480;
get_pet_exp(20) -> 49440;
get_pet_exp(21) -> 49880;
get_pet_exp(22) -> 50600;
get_pet_exp(23) -> 51280;
get_pet_exp(24) -> 51960;
get_pet_exp(25) -> 52600;
get_pet_exp(26) -> 53280;
get_pet_exp(27) -> 53920;
get_pet_exp(28) -> 54560;
get_pet_exp(29) -> 55160;
get_pet_exp(30) -> 55800;
get_pet_exp(31) -> 58520;
get_pet_exp(32) -> 59080;
get_pet_exp(33) -> 59680;
get_pet_exp(34) -> 60240;
get_pet_exp(35) -> 61000;
get_pet_exp(36) -> 61560;
get_pet_exp(37) -> 62080;
get_pet_exp(38) -> 62640;
get_pet_exp(39) -> 63360;
get_pet_exp(40) -> 63880;
get_pet_exp(41) -> 66160;
get_pet_exp(42) -> 66840;
get_pet_exp(43) -> 67320;
get_pet_exp(44) -> 67960;
get_pet_exp(45) -> 68400;
get_pet_exp(46) -> 68840;
get_pet_exp(47) -> 69480;
get_pet_exp(48) -> 69920;
get_pet_exp(49) -> 70520;
get_pet_exp(50) -> 70920;
get_pet_exp(51) -> 71520;
get_pet_exp(52) -> 71880;
get_pet_exp(53) -> 72440;
get_pet_exp(54) -> 73000;
get_pet_exp(55) -> 73360;
get_pet_exp(56) -> 75520;
get_pet_exp(57) -> 75800;
get_pet_exp(58) -> 76320;
get_pet_exp(59) -> 76800;
get_pet_exp(60) -> 77080;
get_pet_exp(61) -> 79120;
get_pet_exp(62) -> 79560;
get_pet_exp(63) -> 80000;
get_pet_exp(64) -> 80240;
get_pet_exp(65) -> 80640;
get_pet_exp(66) -> 81040;
get_pet_exp(67) -> 81400;
get_pet_exp(68) -> 81800;
get_pet_exp(69) -> 82160;
get_pet_exp(70) -> 82320;
get_pet_exp(71) -> 82640;
get_pet_exp(72) -> 82960;
get_pet_exp(73) -> 83280;
get_pet_exp(74) -> 83560;
get_pet_exp(75) -> 83880;
get_pet_exp(76) -> 84160;
get_pet_exp(77) -> 84400;
get_pet_exp(78) -> 84640;
get_pet_exp(79) -> 84880;
get_pet_exp(80) -> 85720;
get_pet_exp(81) -> 92160;
get_pet_exp(82) -> 93200;
get_pet_exp(83) -> 94040;
get_pet_exp(84) -> 94880;
get_pet_exp(85) -> 95720;
get_pet_exp(86) -> 96560;
get_pet_exp(87) -> 97400;
get_pet_exp(88) -> 98400;
get_pet_exp(89) -> 99240;
get_pet_exp(90) -> 100080;
get_pet_exp(91) -> 100920;
get_pet_exp(92) -> 101920;
get_pet_exp(93) -> 102760;
get_pet_exp(94) -> 103600;
get_pet_exp(95) -> 104600;
get_pet_exp(96) -> 105440;
get_pet_exp(97) -> 106280;
get_pet_exp(98) -> 107280;
get_pet_exp(99) -> 108120;
get_pet_exp(100) -> 108960;
get_pet_exp(101) -> 108960;
get_pet_exp(102) -> 108960;
get_pet_exp(103) -> 108960;
get_pet_exp(104) -> 108960;
get_pet_exp(105) -> 108960;
get_pet_exp(106) -> 108960;
get_pet_exp(107) -> 108960;
get_pet_exp(108) -> 108960;
get_pet_exp(109) -> 108960;
get_pet_exp(110) -> 108960;
get_pet_exp(111) -> 108960;
get_pet_exp(112) -> 108960;
get_pet_exp(113) -> 108960;
get_pet_exp(114) -> 108960;
get_pet_exp(115) -> 108960;
get_pet_exp(116) -> 108960;
get_pet_exp(117) -> 108960;
get_pet_exp(118) -> 108960;
get_pet_exp(119) -> 108960;
get_pet_exp(120) -> 108960;
get_pet_exp(121) -> 108960;
get_pet_exp(122) -> 108960;
get_pet_exp(123) -> 108960;
get_pet_exp(124) -> 108960;
get_pet_exp(125) -> 108960;
get_pet_exp(126) -> 108960;
get_pet_exp(127) -> 108960;
get_pet_exp(128) -> 108960;
get_pet_exp(129) -> 108960;
get_pet_exp(130) -> 108960;
get_pet_exp(131) -> 108960;
get_pet_exp(132) -> 108960;
get_pet_exp(133) -> 108960;
get_pet_exp(134) -> 108960;
get_pet_exp(135) -> 108960;
get_pet_exp(136) -> 108960;
get_pet_exp(137) -> 108960;
get_pet_exp(138) -> 108960;
get_pet_exp(139) -> 108960;
get_pet_exp(140) -> 108960;
get_pet_exp(141) -> 108960;
get_pet_exp(142) -> 108960;
get_pet_exp(143) -> 108960;
get_pet_exp(144) -> 108960;
get_pet_exp(145) -> 108960;
get_pet_exp(146) -> 108960;
get_pet_exp(147) -> 108960;
get_pet_exp(148) -> 108960;
get_pet_exp(149) -> 108960;
get_pet_exp(150) -> 108960;
get_pet_exp(_) -> 0.

get_msg({1, 1}) ->
    lang:get("<color='#ffff00'>元旦节</color>快乐~新年新气象{face_1,29}");
get_msg({1, 17}) ->
    lang:get("<color='#ffff00'>小年</color>快乐~记得要吃灶糖哦{face_1,18}");
get_msg({1, 24}) ->
    lang:get("<color='#ffff00'>除夕</color>快乐~岁岁平安{face_1,18}");
get_msg({1, 25}) ->
    lang:get("<color='#ffff00'>春节</color>快乐~大吉大利{face_1,18}");
get_msg({2, 14}) ->
    lang:get("<color='#ffff00'>情人节</color>快乐~甜甜蜜蜜哦{face_1,18}");
get_msg({2, 8}) ->
    lang:get("<color='#ffff00'>元宵</color>快乐~团团圆圆{face_1,18}");
get_msg({3, 8}) ->
    lang:get("<color='#ffff00'>妇女节</color>快乐~{face_1,18}");
get_msg({3, 12}) -> lang:get("爱护植被，从我做起~{face_1,18}");
get_msg({3, 15}) -> lang:get("诚信经营，合理维权~{face_1,18}");
get_msg({4, 1}) ->
    lang:get("<color='#ffff00'>愚人节</color>快乐~别被人骗咯{face_1,10}");
get_msg({4, 4}) ->
    lang:get("让我们在<color='#ffff00'>清明节</color>缅怀先人{face_1,2"
             "1}，逝去的不会再回来，所以让我们好好珍惜现在吧");
get_msg({4, 22}) ->
    lang:get("大家不要只在<color='#ffff00'>地球日</color>才想起好好对待我们的地"
             "球呀{face_1,10}");
get_msg({5, 1}) ->
    lang:get("<color='#ffff00'>劳动节</color>快乐~劳动最光荣！{face_1,10}");
get_msg({5, 4}) ->
    lang:get("<color='#ffff00'>青年节</color>快乐~不管你的年龄是否还年轻，但只"
             "要你有年轻的心，我们一样一起快乐过节{face_1,10}");
get_msg({5, 10}) ->
    lang:get("<color='#ffff00'>母亲节</color>快乐~为自己亲爱的母亲送上一份真挚"
             "的祝福吧{face_1,10}");
get_msg({6, 1}) ->
    lang:get("<color='#ffff00'>儿童节</color>快乐~愿天下所有的孩子都能健康快乐"
             "的成长{face_1,38}");
get_msg({6, 25}) ->
    lang:get("<color='#ffff00'>端午节</color>快乐~一起去吃粽子划龙舟吧~{fa"
             "ce_1,18}");
get_msg({6, 21}) ->
    lang:get("<color='#ffff00'>父亲节</color>快乐~为自己亲爱的父亲送上一份真挚"
             "的祝福吧{face_1,3}");
get_msg({7, 1}) ->
    lang:get("<color='#ffff00'>建党节</color>快乐~为带领我们走出黑暗走向光明的"
             "伟大党献上自己的祝福吧！{face_1,6}");
get_msg({8, 1}) ->
    lang:get("<color='#ffff00'>建军节</color>快乐~军队守护我们国门，保卫我们安"
             "宁，让我们向军人致敬！{face_1,25}");
get_msg({8, 25}) ->
    lang:get("<color='#ffff00'>七夕节</color>快乐~牛郎和织女今天会在鹊桥相会呢"
             "，如果你还单身，今天就去表白吧{face_1,34}");
get_msg({9, 10}) ->
    lang:get("<color='#ffff00'>教师节</color>快乐~我的第二母亲,老师你辛苦了!"
             "教师节快乐！{face_1,3}");
get_msg({10, 1}) ->
    lang:get("<color='#ffff00'>国庆节</color>快乐~希望我们的国家永远繁荣昌盛{"
             "face_1,18}");
get_msg({10, 25}) ->
    lang:get("<color='#ffff00'>重阳节</color>快乐~一起去登高吧{face_1,26}");
get_msg({10, 31}) ->
    lang:get("<color='#ffff00'>Trick or treat</color>，交出糖果吧"
             "，不然就捣乱{face_1,22}");
get_msg({11, 26}) ->
    lang:get("Happy<color='#ffff00'>Thanksgiving</color>Day"
             "，今天火鸡又要被烤了{face_1,15}");
get_msg({12, 21}) ->
    lang:get("<color='#ffff00'>冬至节</color>快乐~今天有吃饺子/汤圆吗{fac"
             "e_1,10}");
get_msg({12, 25}) ->
    lang:get("<color='#ffff00'>圣诞节</color>快乐~圣诞老人今晚上可能会去你家哦"
             "~{face_1,29}");
get_msg({0, 0}) ->
    lang:get("<color='#ffff00'>星期三</color>来啦~一周又过去一半了呢~离周末越"
             "来越近了，加油{face_1, 18}");
get_msg(_) -> "".

