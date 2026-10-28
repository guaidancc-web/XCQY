-file("src/data/look_data.erl", 1).

-module(look_data).

-export([get_weapon/1, get_fashion/1]).

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

-file("src/data/look_data.erl", 17).

get_weapon({10001, 1, Enchant}) when Enchant >= 12 ->
    111120;
get_weapon({10001, 1, Enchant}) when Enchant >= 11 ->
    111090;
get_weapon({10001, 1, Enchant}) when Enchant >= 10 ->
    111090;
get_weapon({10001, 1, Enchant}) when Enchant >= 9 ->
    111090;
get_weapon({10101, 2, Enchant}) when Enchant >= 12 ->
    121120;
get_weapon({10101, 2, Enchant}) when Enchant >= 11 ->
    121090;
get_weapon({10101, 2, Enchant}) when Enchant >= 10 ->
    121090;
get_weapon({10101, 2, Enchant}) when Enchant >= 9 ->
    121090;
get_weapon({10201, 3, Enchant}) when Enchant >= 12 ->
    131120;
get_weapon({10201, 3, Enchant}) when Enchant >= 11 ->
    131090;
get_weapon({10201, 3, Enchant}) when Enchant >= 10 ->
    131090;
get_weapon({10201, 3, Enchant}) when Enchant >= 9 ->
    131090;
get_weapon({10301, 4, Enchant}) when Enchant >= 12 ->
    141120;
get_weapon({10301, 4, Enchant}) when Enchant >= 11 ->
    141090;
get_weapon({10301, 4, Enchant}) when Enchant >= 10 ->
    141090;
get_weapon({10301, 4, Enchant}) when Enchant >= 9 ->
    141090;
get_weapon({10401, 5, Enchant}) when Enchant >= 12 ->
    151120;
get_weapon({10401, 5, Enchant}) when Enchant >= 11 ->
    151090;
get_weapon({10401, 5, Enchant}) when Enchant >= 10 ->
    151090;
get_weapon({10401, 5, Enchant}) when Enchant >= 9 ->
    151090;
get_weapon({10501, 6, Enchant}) when Enchant >= 12 ->
    171120;
get_weapon({10501, 6, Enchant}) when Enchant >= 11 ->
    171090;
get_weapon({10501, 6, Enchant}) when Enchant >= 10 ->
    171090;
get_weapon({10501, 6, Enchant}) when Enchant >= 9 ->
    171090;
get_weapon({10006, 1, Enchant}) when Enchant >= 12 ->
    111120;
get_weapon({10006, 1, Enchant}) when Enchant >= 11 ->
    111090;
get_weapon({10006, 1, Enchant}) when Enchant >= 10 ->
    111090;
get_weapon({10006, 1, Enchant}) when Enchant >= 9 ->
    111090;
get_weapon({10106, 2, Enchant}) when Enchant >= 12 ->
    121120;
get_weapon({10106, 2, Enchant}) when Enchant >= 11 ->
    121090;
get_weapon({10106, 2, Enchant}) when Enchant >= 10 ->
    121090;
get_weapon({10106, 2, Enchant}) when Enchant >= 9 ->
    121090;
get_weapon({10206, 3, Enchant}) when Enchant >= 12 ->
    131120;
get_weapon({10206, 3, Enchant}) when Enchant >= 11 ->
    131090;
get_weapon({10206, 3, Enchant}) when Enchant >= 10 ->
    131090;
get_weapon({10206, 3, Enchant}) when Enchant >= 9 ->
    131090;
get_weapon({10306, 4, Enchant}) when Enchant >= 12 ->
    141120;
get_weapon({10306, 4, Enchant}) when Enchant >= 11 ->
    141090;
get_weapon({10306, 4, Enchant}) when Enchant >= 10 ->
    141090;
get_weapon({10306, 4, Enchant}) when Enchant >= 9 ->
    141090;
get_weapon({10406, 5, Enchant}) when Enchant >= 12 ->
    151120;
get_weapon({10406, 5, Enchant}) when Enchant >= 11 ->
    151090;
get_weapon({10406, 5, Enchant}) when Enchant >= 10 ->
    151090;
get_weapon({10406, 5, Enchant}) when Enchant >= 9 ->
    151090;
get_weapon({10502, 6, Enchant}) when Enchant >= 12 ->
    171120;
get_weapon({10502, 6, Enchant}) when Enchant >= 11 ->
    171090;
get_weapon({10502, 6, Enchant}) when Enchant >= 10 ->
    171090;
get_weapon({10502, 6, Enchant}) when Enchant >= 9 ->
    171090;
get_weapon({10005, 1, Enchant}) when Enchant >= 12 ->
    111120;
get_weapon({10005, 1, Enchant}) when Enchant >= 11 ->
    111100;
get_weapon({10005, 1, Enchant}) when Enchant >= 10 ->
    111100;
get_weapon({10005, 1, Enchant}) when Enchant >= 9 ->
    111100;
get_weapon({10102, 2, Enchant}) when Enchant >= 12 ->
    121120;
get_weapon({10102, 2, Enchant}) when Enchant >= 11 ->
    121100;
get_weapon({10102, 2, Enchant}) when Enchant >= 10 ->
    121100;
get_weapon({10102, 2, Enchant}) when Enchant >= 9 ->
    121100;
get_weapon({10207, 3, Enchant}) when Enchant >= 12 ->
    131120;
get_weapon({10207, 3, Enchant}) when Enchant >= 11 ->
    131100;
get_weapon({10207, 3, Enchant}) when Enchant >= 10 ->
    131100;
get_weapon({10207, 3, Enchant}) when Enchant >= 9 ->
    131100;
get_weapon({10307, 4, Enchant}) when Enchant >= 12 ->
    141120;
get_weapon({10307, 4, Enchant}) when Enchant >= 11 ->
    141100;
get_weapon({10307, 4, Enchant}) when Enchant >= 10 ->
    141100;
get_weapon({10307, 4, Enchant}) when Enchant >= 9 ->
    141100;
get_weapon({10407, 5, Enchant}) when Enchant >= 12 ->
    151120;
get_weapon({10407, 5, Enchant}) when Enchant >= 11 ->
    151090;
get_weapon({10407, 5, Enchant}) when Enchant >= 10 ->
    151090;
get_weapon({10407, 5, Enchant}) when Enchant >= 9 ->
    151090;
get_weapon({10503, 6, Enchant}) when Enchant >= 12 ->
    171120;
get_weapon({10503, 6, Enchant}) when Enchant >= 11 ->
    171100;
get_weapon({10503, 6, Enchant}) when Enchant >= 10 ->
    171100;
get_weapon({10503, 6, Enchant}) when Enchant >= 9 ->
    171100;
get_weapon({10601, 7, Enchant}) when Enchant >= 12 ->
    182090;
get_weapon({10601, 7, Enchant}) when Enchant >= 11 ->
    182090;
get_weapon({10601, 7, Enchant}) when Enchant >= 10 ->
    182090;
get_weapon({10601, 7, Enchant}) when Enchant >= 9 ->
    182090;
get_weapon({10602, 7, Enchant}) when Enchant >= 12 ->
    182090;
get_weapon({10602, 7, Enchant}) when Enchant >= 11 ->
    182090;
get_weapon({10602, 7, Enchant}) when Enchant >= 10 ->
    182090;
get_weapon({10602, 7, Enchant}) when Enchant >= 9 ->
    182090;
get_weapon({10603, 7, Enchant}) when Enchant >= 12 ->
    182200;
get_weapon({10603, 7, Enchant}) when Enchant >= 11 ->
    182100;
get_weapon({10603, 7, Enchant}) when Enchant >= 10 ->
    182100;
get_weapon({10603, 7, Enchant}) when Enchant >= 9 ->
    182100;
get_weapon({10701, 7, Enchant}) when Enchant >= 12 ->
    181090;
get_weapon({10701, 7, Enchant}) when Enchant >= 11 ->
    181090;
get_weapon({10701, 7, Enchant}) when Enchant >= 10 ->
    181090;
get_weapon({10701, 7, Enchant}) when Enchant >= 9 ->
    181090;
get_weapon({10702, 7, Enchant}) when Enchant >= 12 ->
    181090;
get_weapon({10702, 7, Enchant}) when Enchant >= 11 ->
    181090;
get_weapon({10702, 7, Enchant}) when Enchant >= 10 ->
    181090;
get_weapon({10702, 7, Enchant}) when Enchant >= 9 ->
    181090;
get_weapon({10703, 7, Enchant}) when Enchant >= 12 ->
    181200;
get_weapon({10703, 7, Enchant}) when Enchant >= 11 ->
    181100;
get_weapon({10703, 7, Enchant}) when Enchant >= 10 ->
    181100;
get_weapon({10703, 7, Enchant}) when Enchant >= 9 ->
    181100;
get_weapon({10010, 1, Enchant}) when Enchant >= 12 ->
    111011;
get_weapon({10011, 1, Enchant}) when Enchant >= 12 ->
    111021;
get_weapon({10012, 1, Enchant}) when Enchant >= 12 ->
    111031;
get_weapon({10013, 1, Enchant}) when Enchant >= 12 ->
    111041;
get_weapon({10109, 2, Enchant}) when Enchant >= 12 ->
    112011;
get_weapon({10111, 2, Enchant}) when Enchant >= 12 ->
    112021;
get_weapon({10110, 2, Enchant}) when Enchant >= 12 ->
    112031;
get_weapon({10112, 2, Enchant}) when Enchant >= 12 ->
    112041;
get_weapon({10210, 3, Enchant}) when Enchant >= 12 ->
    113011;
get_weapon({10211, 3, Enchant}) when Enchant >= 12 ->
    113021;
get_weapon({10212, 3, Enchant}) when Enchant >= 12 ->
    113031;
get_weapon({10213, 3, Enchant}) when Enchant >= 12 ->
    113041;
get_weapon({10310, 4, Enchant}) when Enchant >= 12 ->
    114011;
get_weapon({10309, 4, Enchant}) when Enchant >= 12 ->
    114021;
get_weapon({10308, 4, Enchant}) when Enchant >= 12 ->
    114031;
get_weapon({10311, 4, Enchant}) when Enchant >= 12 ->
    114041;
get_weapon({10410, 5, Enchant}) when Enchant >= 12 ->
    115011;
get_weapon({10411, 5, Enchant}) when Enchant >= 12 ->
    115021;
get_weapon({10412, 5, Enchant}) when Enchant >= 12 ->
    115031;
get_weapon({10413, 5, Enchant}) when Enchant >= 12 ->
    115041;
get_weapon({10504, 6, Enchant}) when Enchant >= 12 ->
    116011;
get_weapon({10505, 6, Enchant}) when Enchant >= 12 ->
    116021;
get_weapon({10506, 6, Enchant}) when Enchant >= 12 ->
    116031;
get_weapon({10507, 6, Enchant}) when Enchant >= 12 ->
    116041;
get_weapon({10010, 1, Enchant}) when Enchant >= 0 ->
    111010;
get_weapon({10011, 1, Enchant}) when Enchant >= 0 ->
    111020;
get_weapon({10012, 1, Enchant}) when Enchant >= 0 ->
    111030;
get_weapon({10013, 1, Enchant}) when Enchant >= 0 ->
    111040;
get_weapon({10109, 2, Enchant}) when Enchant >= 0 ->
    112010;
get_weapon({10111, 2, Enchant}) when Enchant >= 0 ->
    112020;
get_weapon({10110, 2, Enchant}) when Enchant >= 0 ->
    112030;
get_weapon({10112, 2, Enchant}) when Enchant >= 0 ->
    112040;
get_weapon({10210, 3, Enchant}) when Enchant >= 0 ->
    113010;
get_weapon({10211, 3, Enchant}) when Enchant >= 0 ->
    113020;
get_weapon({10212, 3, Enchant}) when Enchant >= 0 ->
    113030;
get_weapon({10213, 3, Enchant}) when Enchant >= 0 ->
    113040;
get_weapon({10310, 4, Enchant}) when Enchant >= 0 ->
    114010;
get_weapon({10309, 4, Enchant}) when Enchant >= 0 ->
    114020;
get_weapon({10308, 4, Enchant}) when Enchant >= 0 ->
    114030;
get_weapon({10311, 4, Enchant}) when Enchant >= 0 ->
    114040;
get_weapon({10410, 5, Enchant}) when Enchant >= 0 ->
    115010;
get_weapon({10411, 5, Enchant}) when Enchant >= 0 ->
    115020;
get_weapon({10412, 5, Enchant}) when Enchant >= 0 ->
    115030;
get_weapon({10413, 5, Enchant}) when Enchant >= 0 ->
    115040;
get_weapon({10504, 6, Enchant}) when Enchant >= 0 ->
    116010;
get_weapon({10505, 6, Enchant}) when Enchant >= 0 ->
    116020;
get_weapon({10506, 6, Enchant}) when Enchant >= 0 ->
    116030;
get_weapon({10507, 6, Enchant}) when Enchant >= 0 ->
    116040;
get_weapon({10014, 1, Enchant}) when Enchant >= 0 ->
    117000;
get_weapon({10016, 1, Enchant}) when Enchant >= 0 ->
    117010;
get_weapon({10015, 1, Enchant}) when Enchant >= 0 ->
    117020;
get_weapon({10021, 1, Enchant}) when Enchant >= 0 ->
    119302;
get_weapon({10022, 1, Enchant}) when Enchant >= 0 ->
    119310;
get_weapon({10026, 1, Enchant}) when Enchant >= 0 ->
    119318;
get_weapon({10027, 1, Enchant}) when Enchant >= 0 ->
    119326;
get_weapon({10028, 1, Enchant}) when Enchant >= 0 ->
    119334;
get_weapon({10029, 1, Enchant}) when Enchant >= 0 ->
    119342;
get_weapon({10030, 1, Enchant}) when Enchant >= 0 ->
    119350;
get_weapon({10031, 1, Enchant}) when Enchant >= 0 ->
    119358;
get_weapon({10032, 1, Enchant}) when Enchant >= 0 ->
    119366;
get_weapon({10114, 2, Enchant}) when Enchant >= 0 ->
    117030;
get_weapon({10116, 2, Enchant}) when Enchant >= 0 ->
    117040;
get_weapon({10115, 2, Enchant}) when Enchant >= 0 ->
    117050;
get_weapon({10121, 2, Enchant}) when Enchant >= 0 ->
    119303;
get_weapon({10122, 2, Enchant}) when Enchant >= 0 ->
    119311;
get_weapon({10125, 2, Enchant}) when Enchant >= 0 ->
    119319;
get_weapon({10126, 2, Enchant}) when Enchant >= 0 ->
    119327;
get_weapon({10127, 2, Enchant}) when Enchant >= 0 ->
    119335;
get_weapon({10128, 2, Enchant}) when Enchant >= 0 ->
    119343;
get_weapon({10129, 2, Enchant}) when Enchant >= 0 ->
    119351;
get_weapon({10130, 2, Enchant}) when Enchant >= 0 ->
    119359;
get_weapon({10131, 2, Enchant}) when Enchant >= 0 ->
    119367;
get_weapon({10214, 3, Enchant}) when Enchant >= 0 ->
    117060;
get_weapon({10216, 3, Enchant}) when Enchant >= 0 ->
    117070;
get_weapon({10215, 3, Enchant}) when Enchant >= 0 ->
    117080;
get_weapon({10221, 3, Enchant}) when Enchant >= 0 ->
    119304;
get_weapon({10222, 3, Enchant}) when Enchant >= 0 ->
    119312;
get_weapon({10225, 3, Enchant}) when Enchant >= 0 ->
    119320;
get_weapon({10226, 3, Enchant}) when Enchant >= 0 ->
    119328;
get_weapon({10227, 3, Enchant}) when Enchant >= 0 ->
    119336;
get_weapon({10228, 3, Enchant}) when Enchant >= 0 ->
    119344;
get_weapon({10229, 3, Enchant}) when Enchant >= 0 ->
    119352;
get_weapon({10230, 3, Enchant}) when Enchant >= 0 ->
    119360;
get_weapon({10231, 3, Enchant}) when Enchant >= 0 ->
    119368;
get_weapon({10314, 4, Enchant}) when Enchant >= 0 ->
    117090;
get_weapon({10316, 4, Enchant}) when Enchant >= 0 ->
    117100;
get_weapon({10315, 4, Enchant}) when Enchant >= 0 ->
    117110;
get_weapon({10321, 4, Enchant}) when Enchant >= 0 ->
    119305;
get_weapon({10322, 4, Enchant}) when Enchant >= 0 ->
    119313;
get_weapon({10325, 4, Enchant}) when Enchant >= 0 ->
    119321;
get_weapon({10326, 4, Enchant}) when Enchant >= 0 ->
    119329;
get_weapon({10327, 4, Enchant}) when Enchant >= 0 ->
    119337;
get_weapon({10328, 4, Enchant}) when Enchant >= 0 ->
    119345;
get_weapon({10329, 4, Enchant}) when Enchant >= 0 ->
    119353;
get_weapon({10330, 4, Enchant}) when Enchant >= 0 ->
    119361;
get_weapon({10331, 4, Enchant}) when Enchant >= 0 ->
    119369;
get_weapon({10414, 5, Enchant}) when Enchant >= 0 ->
    117120;
get_weapon({10416, 5, Enchant}) when Enchant >= 0 ->
    117130;
get_weapon({10415, 5, Enchant}) when Enchant >= 0 ->
    117140;
get_weapon({10421, 5, Enchant}) when Enchant >= 0 ->
    119306;
get_weapon({10422, 5, Enchant}) when Enchant >= 0 ->
    119314;
get_weapon({10425, 5, Enchant}) when Enchant >= 0 ->
    119322;
get_weapon({10426, 5, Enchant}) when Enchant >= 0 ->
    119330;
get_weapon({10427, 5, Enchant}) when Enchant >= 0 ->
    119338;
get_weapon({10428, 5, Enchant}) when Enchant >= 0 ->
    119346;
get_weapon({10429, 5, Enchant}) when Enchant >= 0 ->
    119354;
get_weapon({10430, 5, Enchant}) when Enchant >= 0 ->
    119362;
get_weapon({10431, 5, Enchant}) when Enchant >= 0 ->
    119370;
get_weapon({10514, 6, Enchant}) when Enchant >= 0 ->
    117150;
get_weapon({10516, 6, Enchant}) when Enchant >= 0 ->
    117160;
get_weapon({10515, 6, Enchant}) when Enchant >= 0 ->
    117170;
get_weapon({10521, 6, Enchant}) when Enchant >= 0 ->
    119307;
get_weapon({10522, 6, Enchant}) when Enchant >= 0 ->
    119315;
get_weapon({10525, 6, Enchant}) when Enchant >= 0 ->
    119323;
get_weapon({10526, 6, Enchant}) when Enchant >= 0 ->
    119331;
get_weapon({10527, 6, Enchant}) when Enchant >= 0 ->
    119339;
get_weapon({10528, 6, Enchant}) when Enchant >= 0 ->
    119347;
get_weapon({10529, 6, Enchant}) when Enchant >= 0 ->
    119355;
get_weapon({10530, 6, Enchant}) when Enchant >= 0 ->
    119363;
get_weapon({10531, 6, Enchant}) when Enchant >= 0 ->
    119371;
get_weapon({10014, 1, Enchant}) when Enchant >= 12 ->
    117000;
get_weapon({10016, 1, Enchant}) when Enchant >= 12 ->
    117010;
get_weapon({10015, 1, Enchant}) when Enchant >= 12 ->
    117020;
get_weapon({10021, 1, Enchant}) when Enchant >= 12 ->
    119302;
get_weapon({10022, 1, Enchant}) when Enchant >= 12 ->
    119310;
get_weapon({10026, 1, Enchant}) when Enchant >= 12 ->
    119318;
get_weapon({10027, 1, Enchant}) when Enchant >= 12 ->
    119326;
get_weapon({10028, 1, Enchant}) when Enchant >= 12 ->
    119334;
get_weapon({10029, 1, Enchant}) when Enchant >= 12 ->
    119342;
get_weapon({10030, 1, Enchant}) when Enchant >= 12 ->
    119350;
get_weapon({10031, 1, Enchant}) when Enchant >= 12 ->
    119358;
get_weapon({10032, 1, Enchant}) when Enchant >= 12 ->
    119366;
get_weapon({10114, 2, Enchant}) when Enchant >= 12 ->
    117030;
get_weapon({10116, 2, Enchant}) when Enchant >= 12 ->
    117040;
get_weapon({10115, 2, Enchant}) when Enchant >= 12 ->
    117050;
get_weapon({10121, 2, Enchant}) when Enchant >= 12 ->
    119303;
get_weapon({10122, 2, Enchant}) when Enchant >= 12 ->
    119311;
get_weapon({10125, 2, Enchant}) when Enchant >= 12 ->
    119319;
get_weapon({10126, 2, Enchant}) when Enchant >= 12 ->
    119327;
get_weapon({10127, 2, Enchant}) when Enchant >= 12 ->
    119335;
get_weapon({10128, 2, Enchant}) when Enchant >= 12 ->
    119343;
get_weapon({10129, 2, Enchant}) when Enchant >= 12 ->
    119351;
get_weapon({10130, 2, Enchant}) when Enchant >= 12 ->
    119359;
get_weapon({10131, 2, Enchant}) when Enchant >= 12 ->
    119367;
get_weapon({10214, 3, Enchant}) when Enchant >= 12 ->
    117060;
get_weapon({10216, 3, Enchant}) when Enchant >= 12 ->
    117070;
get_weapon({10215, 3, Enchant}) when Enchant >= 12 ->
    117080;
get_weapon({10221, 3, Enchant}) when Enchant >= 12 ->
    119304;
get_weapon({10222, 3, Enchant}) when Enchant >= 12 ->
    119312;
get_weapon({10225, 3, Enchant}) when Enchant >= 12 ->
    119320;
get_weapon({10226, 3, Enchant}) when Enchant >= 12 ->
    119328;
get_weapon({10227, 3, Enchant}) when Enchant >= 12 ->
    119336;
get_weapon({10228, 3, Enchant}) when Enchant >= 12 ->
    119344;
get_weapon({10229, 3, Enchant}) when Enchant >= 12 ->
    119352;
get_weapon({10230, 3, Enchant}) when Enchant >= 12 ->
    119360;
get_weapon({10231, 3, Enchant}) when Enchant >= 12 ->
    119368;
get_weapon({10314, 4, Enchant}) when Enchant >= 12 ->
    117090;
get_weapon({10316, 4, Enchant}) when Enchant >= 12 ->
    117100;
get_weapon({10315, 4, Enchant}) when Enchant >= 12 ->
    117110;
get_weapon({10321, 4, Enchant}) when Enchant >= 12 ->
    119305;
get_weapon({10322, 4, Enchant}) when Enchant >= 12 ->
    119313;
get_weapon({10325, 4, Enchant}) when Enchant >= 12 ->
    119321;
get_weapon({10326, 4, Enchant}) when Enchant >= 12 ->
    119329;
get_weapon({10327, 4, Enchant}) when Enchant >= 12 ->
    119337;
get_weapon({10328, 4, Enchant}) when Enchant >= 12 ->
    119345;
get_weapon({10329, 4, Enchant}) when Enchant >= 12 ->
    119353;
get_weapon({10330, 4, Enchant}) when Enchant >= 12 ->
    119361;
get_weapon({10331, 4, Enchant}) when Enchant >= 12 ->
    119369;
get_weapon({10414, 5, Enchant}) when Enchant >= 12 ->
    117120;
get_weapon({10416, 5, Enchant}) when Enchant >= 12 ->
    117130;
get_weapon({10415, 5, Enchant}) when Enchant >= 12 ->
    117140;
get_weapon({10421, 5, Enchant}) when Enchant >= 12 ->
    119306;
get_weapon({10422, 5, Enchant}) when Enchant >= 12 ->
    119314;
get_weapon({10425, 5, Enchant}) when Enchant >= 12 ->
    119322;
get_weapon({10426, 5, Enchant}) when Enchant >= 12 ->
    119330;
get_weapon({10427, 5, Enchant}) when Enchant >= 12 ->
    119338;
get_weapon({10428, 5, Enchant}) when Enchant >= 12 ->
    119346;
get_weapon({10429, 5, Enchant}) when Enchant >= 12 ->
    119354;
get_weapon({10430, 5, Enchant}) when Enchant >= 12 ->
    119362;
get_weapon({10431, 5, Enchant}) when Enchant >= 12 ->
    119370;
get_weapon({10514, 6, Enchant}) when Enchant >= 12 ->
    117150;
get_weapon({10516, 6, Enchant}) when Enchant >= 12 ->
    117160;
get_weapon({10515, 6, Enchant}) when Enchant >= 12 ->
    117170;
get_weapon({10521, 6, Enchant}) when Enchant >= 12 ->
    119307;
get_weapon({10522, 6, Enchant}) when Enchant >= 12 ->
    119315;
get_weapon({10525, 6, Enchant}) when Enchant >= 12 ->
    119323;
get_weapon({10526, 6, Enchant}) when Enchant >= 12 ->
    119331;
get_weapon({10527, 6, Enchant}) when Enchant >= 12 ->
    119339;
get_weapon({10528, 6, Enchant}) when Enchant >= 12 ->
    119347;
get_weapon({10529, 6, Enchant}) when Enchant >= 12 ->
    119355;
get_weapon({10530, 6, Enchant}) when Enchant >= 12 ->
    119363;
get_weapon({10531, 6, Enchant}) when Enchant >= 12 ->
    119371;
get_weapon({10704, 7, Enchant}) when Enchant >= 12 ->
    118011;
get_weapon({10705, 7, Enchant}) when Enchant >= 12 ->
    118021;
get_weapon({10707, 7, Enchant}) when Enchant >= 12 ->
    118031;
get_weapon({10706, 7, Enchant}) when Enchant >= 12 ->
    118041;
get_weapon({10704, 7, Enchant}) when Enchant >= 0 ->
    118010;
get_weapon({10705, 7, Enchant}) when Enchant >= 0 ->
    118020;
get_weapon({10707, 7, Enchant}) when Enchant >= 0 ->
    118030;
get_weapon({10706, 7, Enchant}) when Enchant >= 0 ->
    118040;
get_weapon({10604, 7, Enchant}) when Enchant >= 12 ->
    119011;
get_weapon({10605, 7, Enchant}) when Enchant >= 12 ->
    119021;
get_weapon({10607, 7, Enchant}) when Enchant >= 12 ->
    119031;
get_weapon({10606, 7, Enchant}) when Enchant >= 12 ->
    119041;
get_weapon({10604, 7, Enchant}) when Enchant >= 0 ->
    119010;
get_weapon({10605, 7, Enchant}) when Enchant >= 0 ->
    119020;
get_weapon({10607, 7, Enchant}) when Enchant >= 0 ->
    119030;
get_weapon({10606, 7, Enchant}) when Enchant >= 0 ->
    119040;
get_weapon({10708, 7, Enchant}) when Enchant >= 12 ->
    119100;
get_weapon({10709, 7, Enchant}) when Enchant >= 12 ->
    119101;
get_weapon({10708, 7, Enchant}) when Enchant >= 0 ->
    119100;
get_weapon({10709, 7, Enchant}) when Enchant >= 0 ->
    119101;
get_weapon({10608, 7, Enchant}) when Enchant >= 12 ->
    119200;
get_weapon({10609, 7, Enchant}) when Enchant >= 12 ->
    119201;
get_weapon({10608, 7, Enchant}) when Enchant >= 0 ->
    119200;
get_weapon({10609, 7, Enchant}) when Enchant >= 0 ->
    119201;
get_weapon({10710, 7, Enchant}) when Enchant >= 0 ->
    119300;
get_weapon({10710, 7, Enchant}) when Enchant >= 12 ->
    119300;
get_weapon({10610, 7, Enchant}) when Enchant >= 0 ->
    119301;
get_weapon({10610, 7, Enchant}) when Enchant >= 12 ->
    119301;
get_weapon({10715, 7, Enchant}) when Enchant >= 0 ->
    119308;
get_weapon({10715, 7, Enchant}) when Enchant >= 12 ->
    119308;
get_weapon({10615, 7, Enchant}) when Enchant >= 0 ->
    119309;
get_weapon({10615, 7, Enchant}) when Enchant >= 12 ->
    119309;
get_weapon({10716, 7, Enchant}) when Enchant >= 0 ->
    119316;
get_weapon({10716, 7, Enchant}) when Enchant >= 12 ->
    119316;
get_weapon({10616, 7, Enchant}) when Enchant >= 0 ->
    119317;
get_weapon({10616, 7, Enchant}) when Enchant >= 12 ->
    119317;
get_weapon({10719, 7, Enchant}) when Enchant >= 0 ->
    119324;
get_weapon({10719, 7, Enchant}) when Enchant >= 12 ->
    119324;
get_weapon({10619, 7, Enchant}) when Enchant >= 0 ->
    119325;
get_weapon({10619, 7, Enchant}) when Enchant >= 12 ->
    119325;
get_weapon({10720, 7, Enchant}) when Enchant >= 0 ->
    119332;
get_weapon({10720, 7, Enchant}) when Enchant >= 12 ->
    119332;
get_weapon({10620, 7, Enchant}) when Enchant >= 0 ->
    119333;
get_weapon({10620, 7, Enchant}) when Enchant >= 12 ->
    119333;
get_weapon({10721, 7, Enchant}) when Enchant >= 0 ->
    119340;
get_weapon({10721, 7, Enchant}) when Enchant >= 12 ->
    119340;
get_weapon({10621, 7, Enchant}) when Enchant >= 0 ->
    119341;
get_weapon({10621, 7, Enchant}) when Enchant >= 12 ->
    119341;
get_weapon({10722, 7, Enchant}) when Enchant >= 0 ->
    119348;
get_weapon({10722, 7, Enchant}) when Enchant >= 12 ->
    119348;
get_weapon({10622, 7, Enchant}) when Enchant >= 0 ->
    119349;
get_weapon({10622, 7, Enchant}) when Enchant >= 12 ->
    119349;
get_weapon({10723, 7, Enchant}) when Enchant >= 0 ->
    119356;
get_weapon({10723, 7, Enchant}) when Enchant >= 12 ->
    119356;
get_weapon({10623, 7, Enchant}) when Enchant >= 0 ->
    119357;
get_weapon({10623, 7, Enchant}) when Enchant >= 12 ->
    119357;
get_weapon({10724, 7, Enchant}) when Enchant >= 0 ->
    119364;
get_weapon({10724, 7, Enchant}) when Enchant >= 12 ->
    119364;
get_weapon({10624, 7, Enchant}) when Enchant >= 0 ->
    119365;
get_weapon({10624, 7, Enchant}) when Enchant >= 12 ->
    119365;
get_weapon({10725, 7, Enchant}) when Enchant >= 0 ->
    119372;
get_weapon({10725, 7, Enchant}) when Enchant >= 12 ->
    119372;
get_weapon({10625, 7, Enchant}) when Enchant >= 0 ->
    119373;
get_weapon({10625, 7, Enchant}) when Enchant >= 12 ->
    119373;
get_weapon(_) -> 0.

get_fashion(52023) -> 101100;
get_fashion(_) -> 0.

