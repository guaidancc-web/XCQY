-file("src/data/guild_auction_data.erl", 1).

-module(guild_auction_data).

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

-file("src/data/guild_auction_data.erl", 13).

get(60000) ->
    #{item_id => 60000, item_name => lang:get("火焰面具"),
      min_price => 35, max_price => 150, ascending_base => 5,
      recommand_rate1 => 1, announce => 0};
get(60001) ->
    #{item_id => 60001, item_name => lang:get("火焰斗篷"),
      min_price => 35, max_price => 150, ascending_base => 5,
      recommand_rate1 => 1, announce => 0};
get(60002) ->
    #{item_id => 60002, item_name => lang:get("火焰指环"),
      min_price => 35, max_price => 150, ascending_base => 5,
      recommand_rate1 => 1, announce => 0};
get(60003) ->
    #{item_id => 60003, item_name => lang:get("火焰纹章"),
      min_price => 35, max_price => 150, ascending_base => 5,
      recommand_rate1 => 1, announce => 0};
get(60004) ->
    #{item_id => 60004, item_name => lang:get("【史诗】火焰面具"),
      min_price => 250, max_price => 1000,
      ascending_base => 10, recommand_rate1 => 2,
      announce => 1};
get(60005) ->
    #{item_id => 60005, item_name => lang:get("【史诗】火焰斗篷"),
      min_price => 250, max_price => 1000,
      ascending_base => 10, recommand_rate1 => 2,
      announce => 1};
get(60006) ->
    #{item_id => 60006, item_name => lang:get("【史诗】火焰指环"),
      min_price => 250, max_price => 1000,
      ascending_base => 10, recommand_rate1 => 2,
      announce => 1};
get(60007) ->
    #{item_id => 60007, item_name => lang:get("【史诗】火焰纹章"),
      min_price => 250, max_price => 1000,
      ascending_base => 10, recommand_rate1 => 2,
      announce => 1};
get(60008) ->
    #{item_id => 60008, item_name => lang:get("【传说】火焰面具"),
      min_price => 2500, max_price => 10000,
      ascending_base => 100, recommand_rate1 => 2,
      announce => 1};
get(60009) ->
    #{item_id => 60009, item_name => lang:get("【传说】火焰斗篷"),
      min_price => 2500, max_price => 10000,
      ascending_base => 100, recommand_rate1 => 2,
      announce => 1};
get(60010) ->
    #{item_id => 60010, item_name => lang:get("【传说】火焰指环"),
      min_price => 2500, max_price => 10000,
      ascending_base => 100, recommand_rate1 => 2,
      announce => 1};
get(60011) ->
    #{item_id => 60011, item_name => lang:get("【传说】火焰纹章"),
      min_price => 2500, max_price => 10000,
      ascending_base => 100, recommand_rate1 => 2,
      announce => 1};
get(60100) ->
    #{item_id => 60100, item_name => lang:get("剑心面具"),
      min_price => 35, max_price => 150, ascending_base => 5,
      recommand_rate1 => 1, announce => 0};
get(60101) ->
    #{item_id => 60101, item_name => lang:get("剑心斗篷"),
      min_price => 35, max_price => 150, ascending_base => 5,
      recommand_rate1 => 1, announce => 0};
get(60102) ->
    #{item_id => 60102, item_name => lang:get("剑心指环"),
      min_price => 35, max_price => 150, ascending_base => 5,
      recommand_rate1 => 1, announce => 0};
get(60103) ->
    #{item_id => 60103, item_name => lang:get("剑心纹章"),
      min_price => 35, max_price => 150, ascending_base => 5,
      recommand_rate1 => 1, announce => 0};
get(60104) ->
    #{item_id => 60104, item_name => lang:get("【史诗】剑心面具"),
      min_price => 250, max_price => 1000,
      ascending_base => 10, recommand_rate1 => 2,
      announce => 1};
get(60105) ->
    #{item_id => 60105, item_name => lang:get("【史诗】剑心斗篷"),
      min_price => 250, max_price => 1000,
      ascending_base => 10, recommand_rate1 => 2,
      announce => 1};
get(60106) ->
    #{item_id => 60106, item_name => lang:get("【史诗】剑心指环"),
      min_price => 250, max_price => 1000,
      ascending_base => 10, recommand_rate1 => 2,
      announce => 1};
get(60107) ->
    #{item_id => 60107, item_name => lang:get("【史诗】剑心纹章"),
      min_price => 250, max_price => 1000,
      ascending_base => 10, recommand_rate1 => 2,
      announce => 1};
get(60108) ->
    #{item_id => 60108, item_name => lang:get("【传说】剑心面具"),
      min_price => 2500, max_price => 10000,
      ascending_base => 100, recommand_rate1 => 2,
      announce => 1};
get(60109) ->
    #{item_id => 60109, item_name => lang:get("【传说】剑心斗篷"),
      min_price => 2500, max_price => 10000,
      ascending_base => 100, recommand_rate1 => 2,
      announce => 1};
get(60110) ->
    #{item_id => 60110, item_name => lang:get("【传说】剑心指环"),
      min_price => 2500, max_price => 10000,
      ascending_base => 100, recommand_rate1 => 2,
      announce => 1};
get(60111) ->
    #{item_id => 60111, item_name => lang:get("【传说】剑心纹章"),
      min_price => 2500, max_price => 10000,
      ascending_base => 100, recommand_rate1 => 2,
      announce => 1};
get(60200) ->
    #{item_id => 60200, item_name => lang:get("幻影面具"),
      min_price => 35, max_price => 150, ascending_base => 5,
      recommand_rate1 => 1, announce => 0};
get(60201) ->
    #{item_id => 60201, item_name => lang:get("幻影斗篷"),
      min_price => 35, max_price => 150, ascending_base => 5,
      recommand_rate1 => 1, announce => 0};
get(60202) ->
    #{item_id => 60202, item_name => lang:get("幻影指环"),
      min_price => 35, max_price => 150, ascending_base => 5,
      recommand_rate1 => 1, announce => 0};
get(60203) ->
    #{item_id => 60203, item_name => lang:get("幻影纹章"),
      min_price => 35, max_price => 150, ascending_base => 5,
      recommand_rate1 => 1, announce => 0};
get(60204) ->
    #{item_id => 60204, item_name => lang:get("【史诗】幻影面具"),
      min_price => 250, max_price => 1000,
      ascending_base => 10, recommand_rate1 => 2,
      announce => 1};
get(60205) ->
    #{item_id => 60205, item_name => lang:get("【史诗】幻影斗篷"),
      min_price => 250, max_price => 1000,
      ascending_base => 10, recommand_rate1 => 2,
      announce => 1};
get(60206) ->
    #{item_id => 60206, item_name => lang:get("【史诗】幻影指环"),
      min_price => 250, max_price => 1000,
      ascending_base => 10, recommand_rate1 => 2,
      announce => 1};
get(60207) ->
    #{item_id => 60207, item_name => lang:get("【史诗】幻影纹章"),
      min_price => 250, max_price => 1000,
      ascending_base => 10, recommand_rate1 => 2,
      announce => 1};
get(60208) ->
    #{item_id => 60208, item_name => lang:get("【传说】幻影面具"),
      min_price => 2500, max_price => 10000,
      ascending_base => 100, recommand_rate1 => 2,
      announce => 1};
get(60209) ->
    #{item_id => 60209, item_name => lang:get("【传说】幻影斗篷"),
      min_price => 2500, max_price => 10000,
      ascending_base => 100, recommand_rate1 => 2,
      announce => 1};
get(60210) ->
    #{item_id => 60210, item_name => lang:get("【传说】幻影指环"),
      min_price => 2500, max_price => 10000,
      ascending_base => 100, recommand_rate1 => 2,
      announce => 1};
get(60211) ->
    #{item_id => 60211, item_name => lang:get("【传说】幻影纹章"),
      min_price => 2500, max_price => 10000,
      ascending_base => 100, recommand_rate1 => 2,
      announce => 1};
get(60300) ->
    #{item_id => 60300, item_name => lang:get("时空面具"),
      min_price => 35, max_price => 150, ascending_base => 5,
      recommand_rate1 => 1, announce => 0};
get(60301) ->
    #{item_id => 60301, item_name => lang:get("时空斗篷"),
      min_price => 35, max_price => 150, ascending_base => 5,
      recommand_rate1 => 1, announce => 0};
get(60302) ->
    #{item_id => 60302, item_name => lang:get("时空指环"),
      min_price => 35, max_price => 150, ascending_base => 5,
      recommand_rate1 => 1, announce => 0};
get(60303) ->
    #{item_id => 60303, item_name => lang:get("时空纹章"),
      min_price => 35, max_price => 150, ascending_base => 5,
      recommand_rate1 => 1, announce => 0};
get(60304) ->
    #{item_id => 60304, item_name => lang:get("【史诗】时空面具"),
      min_price => 250, max_price => 1000,
      ascending_base => 10, recommand_rate1 => 2,
      announce => 1};
get(60305) ->
    #{item_id => 60305, item_name => lang:get("【史诗】时空斗篷"),
      min_price => 250, max_price => 1000,
      ascending_base => 10, recommand_rate1 => 2,
      announce => 1};
get(60306) ->
    #{item_id => 60306, item_name => lang:get("【史诗】时空指环"),
      min_price => 250, max_price => 1000,
      ascending_base => 10, recommand_rate1 => 2,
      announce => 1};
get(60307) ->
    #{item_id => 60307, item_name => lang:get("【史诗】时空纹章"),
      min_price => 250, max_price => 1000,
      ascending_base => 10, recommand_rate1 => 2,
      announce => 1};
get(60308) ->
    #{item_id => 60308, item_name => lang:get("【传说】时空面具"),
      min_price => 2500, max_price => 10000,
      ascending_base => 100, recommand_rate1 => 2,
      announce => 1};
get(60309) ->
    #{item_id => 60309, item_name => lang:get("【传说】时空斗篷"),
      min_price => 2500, max_price => 10000,
      ascending_base => 100, recommand_rate1 => 2,
      announce => 1};
get(60310) ->
    #{item_id => 60310, item_name => lang:get("【传说】时空指环"),
      min_price => 2500, max_price => 10000,
      ascending_base => 100, recommand_rate1 => 2,
      announce => 1};
get(60311) ->
    #{item_id => 60311, item_name => lang:get("【传说】时空纹章"),
      min_price => 2500, max_price => 10000,
      ascending_base => 100, recommand_rate1 => 2,
      announce => 1};
get(60400) ->
    #{item_id => 60400, item_name => lang:get("光辉面具"),
      min_price => 35, max_price => 150, ascending_base => 5,
      recommand_rate1 => 1, announce => 0};
get(60401) ->
    #{item_id => 60401, item_name => lang:get("光辉斗篷"),
      min_price => 35, max_price => 150, ascending_base => 5,
      recommand_rate1 => 1, announce => 0};
get(60402) ->
    #{item_id => 60402, item_name => lang:get("光辉指环"),
      min_price => 35, max_price => 150, ascending_base => 5,
      recommand_rate1 => 1, announce => 0};
get(60403) ->
    #{item_id => 60403, item_name => lang:get("光辉纹章"),
      min_price => 35, max_price => 150, ascending_base => 5,
      recommand_rate1 => 1, announce => 0};
get(60404) ->
    #{item_id => 60404, item_name => lang:get("【史诗】光辉面具"),
      min_price => 250, max_price => 1000,
      ascending_base => 10, recommand_rate1 => 2,
      announce => 1};
get(60405) ->
    #{item_id => 60405, item_name => lang:get("【史诗】光辉斗篷"),
      min_price => 250, max_price => 1000,
      ascending_base => 10, recommand_rate1 => 2,
      announce => 1};
get(60406) ->
    #{item_id => 60406, item_name => lang:get("【史诗】光辉指环"),
      min_price => 250, max_price => 1000,
      ascending_base => 10, recommand_rate1 => 2,
      announce => 1};
get(60407) ->
    #{item_id => 60407, item_name => lang:get("【史诗】光辉纹章"),
      min_price => 250, max_price => 1000,
      ascending_base => 10, recommand_rate1 => 2,
      announce => 1};
get(60408) ->
    #{item_id => 60408, item_name => lang:get("【传说】光辉面具"),
      min_price => 2500, max_price => 10000,
      ascending_base => 100, recommand_rate1 => 2,
      announce => 1};
get(60409) ->
    #{item_id => 60409, item_name => lang:get("【传说】光辉斗篷"),
      min_price => 2500, max_price => 10000,
      ascending_base => 100, recommand_rate1 => 2,
      announce => 1};
get(60410) ->
    #{item_id => 60410, item_name => lang:get("【传说】光辉指环"),
      min_price => 2500, max_price => 10000,
      ascending_base => 100, recommand_rate1 => 2,
      announce => 1};
get(60411) ->
    #{item_id => 60411, item_name => lang:get("【传说】光辉纹章"),
      min_price => 2500, max_price => 10000,
      ascending_base => 100, recommand_rate1 => 2,
      announce => 1};
get(60500) ->
    #{item_id => 60500, item_name => lang:get("掌控面具"),
      min_price => 35, max_price => 150, ascending_base => 5,
      recommand_rate1 => 1, announce => 0};
get(60501) ->
    #{item_id => 60501, item_name => lang:get("掌控斗篷"),
      min_price => 35, max_price => 150, ascending_base => 5,
      recommand_rate1 => 1, announce => 0};
get(60502) ->
    #{item_id => 60502, item_name => lang:get("掌控指环"),
      min_price => 35, max_price => 150, ascending_base => 5,
      recommand_rate1 => 1, announce => 0};
get(60503) ->
    #{item_id => 60503, item_name => lang:get("掌控纹章"),
      min_price => 35, max_price => 150, ascending_base => 5,
      recommand_rate1 => 1, announce => 0};
get(60504) ->
    #{item_id => 60504, item_name => lang:get("【史诗】掌控面具"),
      min_price => 250, max_price => 1000,
      ascending_base => 10, recommand_rate1 => 2,
      announce => 1};
get(60505) ->
    #{item_id => 60505, item_name => lang:get("【史诗】掌控斗篷"),
      min_price => 250, max_price => 1000,
      ascending_base => 10, recommand_rate1 => 2,
      announce => 1};
get(60506) ->
    #{item_id => 60506, item_name => lang:get("【史诗】掌控指环"),
      min_price => 250, max_price => 1000,
      ascending_base => 10, recommand_rate1 => 2,
      announce => 1};
get(60507) ->
    #{item_id => 60507, item_name => lang:get("【史诗】掌控纹章"),
      min_price => 250, max_price => 1000,
      ascending_base => 10, recommand_rate1 => 2,
      announce => 1};
get(60508) ->
    #{item_id => 60508, item_name => lang:get("【传说】掌控面具"),
      min_price => 2500, max_price => 10000,
      ascending_base => 100, recommand_rate1 => 2,
      announce => 1};
get(60509) ->
    #{item_id => 60509, item_name => lang:get("【传说】掌控斗篷"),
      min_price => 2500, max_price => 10000,
      ascending_base => 100, recommand_rate1 => 2,
      announce => 1};
get(60510) ->
    #{item_id => 60510, item_name => lang:get("【传说】掌控指环"),
      min_price => 2500, max_price => 10000,
      ascending_base => 100, recommand_rate1 => 2,
      announce => 1};
get(60511) ->
    #{item_id => 60511, item_name => lang:get("【传说】掌控纹章"),
      min_price => 2500, max_price => 10000,
      ascending_base => 100, recommand_rate1 => 2,
      announce => 1};
get(60600) ->
    #{item_id => 60600, item_name => lang:get("[史诗]狂怒者面具"),
      min_price => 350, max_price => 1500,
      ascending_base => 10, recommand_rate1 => 2,
      announce => 1};
get(60601) ->
    #{item_id => 60601, item_name => lang:get("[史诗]狂怒者斗篷"),
      min_price => 350, max_price => 1500,
      ascending_base => 10, recommand_rate1 => 2,
      announce => 1};
get(60602) ->
    #{item_id => 60602, item_name => lang:get("[史诗]狂怒者指环"),
      min_price => 350, max_price => 1500,
      ascending_base => 10, recommand_rate1 => 2,
      announce => 1};
get(60603) ->
    #{item_id => 60603, item_name => lang:get("[史诗]狂怒者纹章"),
      min_price => 350, max_price => 1500,
      ascending_base => 10, recommand_rate1 => 2,
      announce => 1};
get(60604) ->
    #{item_id => 60604, item_name => lang:get("[传说]狂怒者面具"),
      min_price => 3000, max_price => 15000,
      ascending_base => 100, recommand_rate1 => 2,
      announce => 1};
get(60605) ->
    #{item_id => 60605, item_name => lang:get("[传说]狂怒者斗篷"),
      min_price => 3000, max_price => 15000,
      ascending_base => 100, recommand_rate1 => 2,
      announce => 1};
get(60606) ->
    #{item_id => 60606, item_name => lang:get("[传说]狂怒者指环"),
      min_price => 3000, max_price => 15000,
      ascending_base => 100, recommand_rate1 => 2,
      announce => 1};
get(60607) ->
    #{item_id => 60607, item_name => lang:get("[传说]狂怒者纹章"),
      min_price => 3000, max_price => 15000,
      ascending_base => 100, recommand_rate1 => 2,
      announce => 1};
get(60608) ->
    #{item_id => 60608, item_name => lang:get("[神]狂怒者面具"),
      min_price => 5000, max_price => 20000,
      ascending_base => 100, recommand_rate1 => 2,
      announce => 1};
get(60609) ->
    #{item_id => 60609, item_name => lang:get("[神]狂怒者斗篷"),
      min_price => 5000, max_price => 20000,
      ascending_base => 100, recommand_rate1 => 2,
      announce => 1};
get(60610) ->
    #{item_id => 60610, item_name => lang:get("[神]狂怒者指环"),
      min_price => 5000, max_price => 20000,
      ascending_base => 100, recommand_rate1 => 2,
      announce => 1};
get(60611) ->
    #{item_id => 60611, item_name => lang:get("[神]狂怒者纹章"),
      min_price => 5000, max_price => 20000,
      ascending_base => 100, recommand_rate1 => 2,
      announce => 1};
get(60700) ->
    #{item_id => 60700, item_name => lang:get("[史诗]毁灭者面具"),
      min_price => 350, max_price => 1500,
      ascending_base => 10, recommand_rate1 => 2,
      announce => 1};
get(60701) ->
    #{item_id => 60701, item_name => lang:get("[史诗]毁灭者斗篷"),
      min_price => 350, max_price => 1500,
      ascending_base => 10, recommand_rate1 => 2,
      announce => 1};
get(60702) ->
    #{item_id => 60702, item_name => lang:get("[史诗]毁灭者指环"),
      min_price => 350, max_price => 1500,
      ascending_base => 10, recommand_rate1 => 2,
      announce => 1};
get(60703) ->
    #{item_id => 60703, item_name => lang:get("[史诗]毁灭者纹章"),
      min_price => 350, max_price => 1500,
      ascending_base => 10, recommand_rate1 => 2,
      announce => 1};
get(60704) ->
    #{item_id => 60704, item_name => lang:get("[传说]毁灭者面具"),
      min_price => 3000, max_price => 15000,
      ascending_base => 100, recommand_rate1 => 2,
      announce => 1};
get(60705) ->
    #{item_id => 60705, item_name => lang:get("[传说]毁灭者斗篷"),
      min_price => 3000, max_price => 15000,
      ascending_base => 100, recommand_rate1 => 2,
      announce => 1};
get(60706) ->
    #{item_id => 60706, item_name => lang:get("[传说]毁灭者指环"),
      min_price => 3000, max_price => 15000,
      ascending_base => 100, recommand_rate1 => 2,
      announce => 1};
get(60707) ->
    #{item_id => 60707, item_name => lang:get("[传说]毁灭者纹章"),
      min_price => 3000, max_price => 15000,
      ascending_base => 100, recommand_rate1 => 2,
      announce => 1};
get(60708) ->
    #{item_id => 60708, item_name => lang:get("[神]毁灭者面具"),
      min_price => 5000, max_price => 20000,
      ascending_base => 100, recommand_rate1 => 2,
      announce => 1};
get(60709) ->
    #{item_id => 60709, item_name => lang:get("[神]毁灭者斗篷"),
      min_price => 5000, max_price => 20000,
      ascending_base => 100, recommand_rate1 => 2,
      announce => 1};
get(60710) ->
    #{item_id => 60710, item_name => lang:get("[神]毁灭者指环"),
      min_price => 5000, max_price => 20000,
      ascending_base => 100, recommand_rate1 => 2,
      announce => 1};
get(60711) ->
    #{item_id => 60711, item_name => lang:get("[神]毁灭者纹章"),
      min_price => 5000, max_price => 20000,
      ascending_base => 100, recommand_rate1 => 2,
      announce => 1};
get(60800) ->
    #{item_id => 60800, item_name => lang:get("[史诗]预言者面具"),
      min_price => 350, max_price => 1500,
      ascending_base => 10, recommand_rate1 => 2,
      announce => 1};
get(60801) ->
    #{item_id => 60801, item_name => lang:get("[史诗]预言者斗篷"),
      min_price => 350, max_price => 1500,
      ascending_base => 10, recommand_rate1 => 2,
      announce => 1};
get(60802) ->
    #{item_id => 60802, item_name => lang:get("[史诗]预言者指环"),
      min_price => 350, max_price => 1500,
      ascending_base => 10, recommand_rate1 => 2,
      announce => 1};
get(60803) ->
    #{item_id => 60803, item_name => lang:get("[史诗]预言者纹章"),
      min_price => 350, max_price => 1500,
      ascending_base => 10, recommand_rate1 => 2,
      announce => 1};
get(60804) ->
    #{item_id => 60804, item_name => lang:get("[传说]预言者面具"),
      min_price => 3000, max_price => 15000,
      ascending_base => 100, recommand_rate1 => 2,
      announce => 1};
get(60805) ->
    #{item_id => 60805, item_name => lang:get("[传说]预言者斗篷"),
      min_price => 3000, max_price => 15000,
      ascending_base => 100, recommand_rate1 => 2,
      announce => 1};
get(60806) ->
    #{item_id => 60806, item_name => lang:get("[传说]预言者指环"),
      min_price => 3000, max_price => 15000,
      ascending_base => 100, recommand_rate1 => 2,
      announce => 1};
get(60807) ->
    #{item_id => 60807, item_name => lang:get("[传说]预言者纹章"),
      min_price => 3000, max_price => 15000,
      ascending_base => 100, recommand_rate1 => 2,
      announce => 1};
get(60808) ->
    #{item_id => 60808, item_name => lang:get("[神]预言者面具"),
      min_price => 5000, max_price => 20000,
      ascending_base => 100, recommand_rate1 => 2,
      announce => 1};
get(60809) ->
    #{item_id => 60809, item_name => lang:get("[神]预言者斗篷"),
      min_price => 5000, max_price => 20000,
      ascending_base => 100, recommand_rate1 => 2,
      announce => 1};
get(60810) ->
    #{item_id => 60810, item_name => lang:get("[神]预言者指环"),
      min_price => 5000, max_price => 20000,
      ascending_base => 100, recommand_rate1 => 2,
      announce => 1};
get(60811) ->
    #{item_id => 60811, item_name => lang:get("[神]预言者纹章"),
      min_price => 5000, max_price => 20000,
      ascending_base => 100, recommand_rate1 => 2,
      announce => 1};
get(60900) ->
    #{item_id => 60900, item_name => lang:get("[史诗]守护者面具"),
      min_price => 350, max_price => 1500,
      ascending_base => 10, recommand_rate1 => 2,
      announce => 1};
get(60901) ->
    #{item_id => 60901, item_name => lang:get("[史诗]守护者斗篷"),
      min_price => 350, max_price => 1500,
      ascending_base => 10, recommand_rate1 => 2,
      announce => 1};
get(60902) ->
    #{item_id => 60902, item_name => lang:get("[史诗]守护者指环"),
      min_price => 350, max_price => 1500,
      ascending_base => 10, recommand_rate1 => 2,
      announce => 1};
get(60903) ->
    #{item_id => 60903, item_name => lang:get("[史诗]守护者纹章"),
      min_price => 350, max_price => 1500,
      ascending_base => 10, recommand_rate1 => 2,
      announce => 1};
get(60904) ->
    #{item_id => 60904, item_name => lang:get("[传说]守护者面具"),
      min_price => 3000, max_price => 15000,
      ascending_base => 100, recommand_rate1 => 2,
      announce => 1};
get(60905) ->
    #{item_id => 60905, item_name => lang:get("[传说]守护者斗篷"),
      min_price => 3000, max_price => 15000,
      ascending_base => 100, recommand_rate1 => 2,
      announce => 1};
get(60906) ->
    #{item_id => 60906, item_name => lang:get("[传说]守护者指环"),
      min_price => 3000, max_price => 15000,
      ascending_base => 100, recommand_rate1 => 2,
      announce => 1};
get(60907) ->
    #{item_id => 60907, item_name => lang:get("[传说]守护者纹章"),
      min_price => 3000, max_price => 15000,
      ascending_base => 100, recommand_rate1 => 2,
      announce => 1};
get(60908) ->
    #{item_id => 60908, item_name => lang:get("[神]守护者面具"),
      min_price => 5000, max_price => 20000,
      ascending_base => 100, recommand_rate1 => 2,
      announce => 1};
get(60909) ->
    #{item_id => 60909, item_name => lang:get("[神]守护者斗篷"),
      min_price => 5000, max_price => 20000,
      ascending_base => 100, recommand_rate1 => 2,
      announce => 1};
get(60910) ->
    #{item_id => 60910, item_name => lang:get("[神]守护者指环"),
      min_price => 5000, max_price => 20000,
      ascending_base => 100, recommand_rate1 => 2,
      announce => 1};
get(60911) ->
    #{item_id => 60911, item_name => lang:get("[神]守护者纹章"),
      min_price => 5000, max_price => 20000,
      ascending_base => 100, recommand_rate1 => 2,
      announce => 1};
get(_BaseId) -> false.

