-file("src/data/transform_data.erl", 1).

-module(transform_data).

-export([get_hard_show/1]).

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

-file("src/data/transform_data.erl", 15).

get_hard_show(30601) ->
    #{hard_show => 1, res => 30601, skin => 30601};
get_hard_show(30700) ->
    #{hard_show => 0, res => 30000, skin => 30000};
get_hard_show(30701) ->
    #{hard_show => 0, res => 30001, skin => 30001};
get_hard_show(30702) ->
    #{hard_show => 0, res => 30002, skin => 30002};
get_hard_show(30703) ->
    #{hard_show => 0, res => 30003, skin => 30003};
get_hard_show(30704) ->
    #{hard_show => 0, res => 30006, skin => 30006};
get_hard_show(30705) ->
    #{hard_show => 0, res => 30005, skin => 30005};
get_hard_show(30706) ->
    #{hard_show => 0, res => 30004, skin => 30004};
get_hard_show(30707) ->
    #{hard_show => 0, res => 30007, skin => 30007};
get_hard_show(30708) ->
    #{hard_show => 0, res => 30008, skin => 30008};
get_hard_show(30709) ->
    #{hard_show => 0, res => 30009, skin => 30009};
get_hard_show(30710) ->
    #{hard_show => 0, res => 30010, skin => 30010};
get_hard_show(30711) ->
    #{hard_show => 0, res => 30011, skin => 30011};
get_hard_show(30712) ->
    #{hard_show => 0, res => 30012, skin => 30012};
get_hard_show(30713) ->
    #{hard_show => 0, res => 30013, skin => 30013};
get_hard_show(30714) ->
    #{hard_show => 0, res => 30014, skin => 30014};
get_hard_show(30715) ->
    #{hard_show => 0, res => 30015, skin => 30015};
get_hard_show(30716) ->
    #{hard_show => 0, res => 30016, skin => 30016};
get_hard_show(30717) ->
    #{hard_show => 0, res => 30017, skin => 30017};
get_hard_show(30719) ->
    #{hard_show => 0, res => 30019, skin => 30019};
get_hard_show(30721) ->
    #{hard_show => 0, res => 30021, skin => 30021};
get_hard_show(30722) ->
    #{hard_show => 0, res => 30022, skin => 30022};
get_hard_show(30723) ->
    #{hard_show => 0, res => 30036, skin => 30036};
get_hard_show(30724) ->
    #{hard_show => 0, res => 30038, skin => 30038};
get_hard_show(30725) ->
    #{hard_show => 0, res => 30039, skin => 30039};
get_hard_show(30726) ->
    #{hard_show => 0, res => 30043, skin => 30043};
get_hard_show(30727) ->
    #{hard_show => 0, res => 30042, skin => 30042};
get_hard_show(30728) ->
    #{hard_show => 0, res => 30044, skin => 30044};
get_hard_show(30729) ->
    #{hard_show => 0, res => 30237, skin => 30237};
get_hard_show(30730) ->
    #{hard_show => 0, res => 30227, skin => 30227};
get_hard_show(30731) ->
    #{hard_show => 0, res => 30229, skin => 30229};
get_hard_show(30732) ->
    #{hard_show => 0, res => 30246, skin => 30246};
get_hard_show(30733) ->
    #{hard_show => 0, res => 30232, skin => 30232};
get_hard_show(30734) ->
    #{hard_show => 0, res => 30228, skin => 30228};
get_hard_show(30735) ->
    #{hard_show => 0, res => 30047, skin => 30047};
get_hard_show(30736) ->
    #{hard_show => 0, res => 30048, skin => 30048};
get_hard_show(30740) ->
    #{hard_show => 0, res => 30222, skin => 30622};
get_hard_show(30741) ->
    #{hard_show => 0, res => 30219, skin => 30619};
get_hard_show(30742) ->
    #{hard_show => 0, res => 30221, skin => 30621};
get_hard_show(30743) ->
    #{hard_show => 0, res => 30236, skin => 30636};
get_hard_show(30744) ->
    #{hard_show => 0, res => 30638, skin => 30638};
get_hard_show(30745) ->
    #{hard_show => 0, res => 30239, skin => 30639};
get_hard_show(30746) ->
    #{hard_show => 0, res => 30243, skin => 30643};
get_hard_show(30747) ->
    #{hard_show => 0, res => 30242, skin => 30642};
get_hard_show(30748) ->
    #{hard_show => 0, res => 30244, skin => 30644};
get_hard_show(30749) ->
    #{hard_show => 0, res => 30247, skin => 30647};
get_hard_show(30750) ->
    #{hard_show => 0, res => 30248, skin => 30648};
get_hard_show(30800) ->
    #{hard_show => 0, res => 30000, skin => 30200};
get_hard_show(30801) ->
    #{hard_show => 0, res => 30001, skin => 30201};
get_hard_show(30802) ->
    #{hard_show => 0, res => 30002, skin => 30202};
get_hard_show(30803) ->
    #{hard_show => 0, res => 30003, skin => 30203};
get_hard_show(30804) ->
    #{hard_show => 0, res => 30006, skin => 30206};
get_hard_show(30805) ->
    #{hard_show => 0, res => 30005, skin => 30205};
get_hard_show(30806) ->
    #{hard_show => 0, res => 30004, skin => 30204};
get_hard_show(30807) ->
    #{hard_show => 0, res => 30007, skin => 30207};
get_hard_show(30808) ->
    #{hard_show => 0, res => 30008, skin => 30208};
get_hard_show(30809) ->
    #{hard_show => 0, res => 30009, skin => 30209};
get_hard_show(30810) ->
    #{hard_show => 0, res => 30010, skin => 30210};
get_hard_show(30811) ->
    #{hard_show => 0, res => 30011, skin => 30211};
get_hard_show(30812) ->
    #{hard_show => 0, res => 30012, skin => 30212};
get_hard_show(30813) ->
    #{hard_show => 0, res => 30013, skin => 30213};
get_hard_show(30814) ->
    #{hard_show => 0, res => 30014, skin => 30214};
get_hard_show(30815) ->
    #{hard_show => 0, res => 30015, skin => 30315};
get_hard_show(30816) ->
    #{hard_show => 0, res => 30016, skin => 30316};
get_hard_show(30817) ->
    #{hard_show => 0, res => 30017, skin => 30317};
get_hard_show(30819) ->
    #{hard_show => 0, res => 30019, skin => 30319};
get_hard_show(30821) ->
    #{hard_show => 0, res => 30021, skin => 30321};
get_hard_show(30822) ->
    #{hard_show => 0, res => 30022, skin => 30322};
get_hard_show(30823) ->
    #{hard_show => 0, res => 30036, skin => 30336};
get_hard_show(30824) ->
    #{hard_show => 0, res => 30038, skin => 30338};
get_hard_show(30825) ->
    #{hard_show => 0, res => 30039, skin => 30339};
get_hard_show(30826) ->
    #{hard_show => 0, res => 30043, skin => 30343};
get_hard_show(30827) ->
    #{hard_show => 0, res => 30042, skin => 30342};
get_hard_show(30828) ->
    #{hard_show => 0, res => 30044, skin => 30344};
get_hard_show(30829) ->
    #{hard_show => 0, res => 41005, skin => 41005};
get_hard_show(30830) ->
    #{hard_show => 0, res => 41005, skin => 41105};
get_hard_show(30831) ->
    #{hard_show => 0, res => 30047, skin => 30347};
get_hard_show(30832) ->
    #{hard_show => 0, res => 30048, skin => 30348};
get_hard_show(30833) ->
    #{hard_show => 0, res => 30722, skin => 30722};
get_hard_show(30834) ->
    #{hard_show => 0, res => 30219, skin => 30719};
get_hard_show(30835) ->
    #{hard_show => 0, res => 30221, skin => 30721};
get_hard_show(30836) ->
    #{hard_show => 0, res => 30736, skin => 30736};
get_hard_show(30837) ->
    #{hard_show => 0, res => 30738, skin => 30738};
get_hard_show(30838) ->
    #{hard_show => 0, res => 30739, skin => 30739};
get_hard_show(30839) ->
    #{hard_show => 0, res => 30743, skin => 30743};
get_hard_show(30840) ->
    #{hard_show => 0, res => 30742, skin => 30742};
get_hard_show(30841) ->
    #{hard_show => 0, res => 30744, skin => 30744};
get_hard_show(30842) ->
    #{hard_show => 0, res => 30747, skin => 30747};
get_hard_show(30843) ->
    #{hard_show => 0, res => 30748, skin => 30748};
get_hard_show(30900) ->
    #{hard_show => 0, res => 11002, skin => 11002};
get_hard_show(30901) ->
    #{hard_show => 0, res => 11012, skin => 11012};
get_hard_show(30902) ->
    #{hard_show => 0, res => 11008, skin => 11008};
get_hard_show(30903) ->
    #{hard_show => 0, res => 11018, skin => 11018};
get_hard_show(30904) ->
    #{hard_show => 0, res => 11020, skin => 11020};
get_hard_show(30905) ->
    #{hard_show => 0, res => 11014, skin => 11014};
get_hard_show(30906) ->
    #{hard_show => 0, res => 11010, skin => 11010};
get_hard_show(30907) ->
    #{hard_show => 0, res => 11019, skin => 11019};
get_hard_show(30908) ->
    #{hard_show => 0, res => 11023, skin => 11023};
get_hard_show(30909) ->
    #{hard_show => 0, res => 11015, skin => 11015};
get_hard_show(30910) ->
    #{hard_show => 0, res => 11006, skin => 11006};
get_hard_show(30911) ->
    #{hard_show => 0, res => 11021, skin => 11021};
get_hard_show(30912) ->
    #{hard_show => 0, res => 11025, skin => 11025};
get_hard_show(31901) ->
    #{hard_show => 1, res => 30056, skin => 30056};
get_hard_show(31902) ->
    #{hard_show => 1, res => 30056, skin => 30156};
get_hard_show(32032) ->
    #{hard_show => 1, res => 41035, skin => 41135};
get_hard_show(32033) ->
    #{hard_show => 1, res => 41035, skin => 41035};
get_hard_show(44000) ->
    #{hard_show => 0, res => 70122, skin => 70122};
get_hard_show(73071) ->
    #{hard_show => 1, res => 41010, skin => 41010};
get_hard_show(73075) ->
    #{hard_show => 1, res => 41012, skin => 41012};
get_hard_show(73074) ->
    #{hard_show => 1, res => 41013, skin => 41013};
get_hard_show(76010) ->
    #{hard_show => 1, res => 20042, skin => 20042};
get_hard_show(76011) ->
    #{hard_show => 1, res => 20042, skin => 20142};
get_hard_show(76012) ->
    #{hard_show => 1, res => 20042, skin => 20442};
get_hard_show(76013) ->
    #{hard_show => 1, res => 20042, skin => 20342};
get_hard_show(76014) ->
    #{hard_show => 1, res => 20042, skin => 20242};
get_hard_show(76116) ->
    #{hard_show => 1, res => 41018, skin => 41018};
get_hard_show(76117) ->
    #{hard_show => 1, res => 41021, skin => 41021};
get_hard_show(76118) ->
    #{hard_show => 1, res => 20042, skin => 20442};
get_hard_show(76119) ->
    #{hard_show => 1, res => 20044, skin => 20044};
get_hard_show(76721) ->
    #{hard_show => 1, res => 41106, skin => 41106};
get_hard_show(76722) ->
    #{hard_show => 1, res => 41206, skin => 41206};
get_hard_show(76723) ->
    #{hard_show => 1, res => 41306, skin => 41306};
get_hard_show(76880) ->
    #{hard_show => 1, res => 41005, skin => 41005};
get_hard_show(76882) ->
    #{hard_show => 1, res => 30701, skin => 30701};
get_hard_show(_) -> false.

