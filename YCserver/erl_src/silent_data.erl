-file("src/data/silent_data.erl", 1).

-module(silent_data).

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

-file("src/data/silent_data.erl", 14).

-export([get_check_term/1,
         get_silent_cfg/1,
         get_check_cd/1,
         get_all_type/0,
         get_whitechars/0,
         get_open_cfg/1]).

get_check_term(1) -> {500, 50};
get_check_term(5) -> {500, 50};
get_check_term(4) -> {500, 50};
get_check_term(3) -> {500, 50};
get_check_term(_) -> false.

get_silent_cfg(1) -> {3, 25, 80, 3};
get_silent_cfg(5) -> {3, 25, 80, 3};
get_silent_cfg(4) -> {3, 25, 85, 3};
get_silent_cfg(3) -> {3, 25, 85, 3};
get_silent_cfg(_) -> false.

get_check_cd(1) -> 5;
get_check_cd(5) -> 5;
get_check_cd(4) -> 2;
get_check_cd(3) -> 2;
get_check_cd(_) -> 0.

get_all_type() -> [1, 3, 4, 5].

get_whitechars() ->
    [lang:get("之"),
     lang:get("人"),
     lang:get("任"),
     lang:get("伍"),
     lang:get("会"),
     lang:get("公"),
     lang:get("副"),
     lang:get("务"),
     lang:get("助"),
     lang:get("募"),
     lang:get("发"),
     lang:get("吧"),
     lang:get("启"),
     lang:get("商"),
     lang:get("地"),
     lang:get("塔"),
     lang:get("天"),
     lang:get("妖"),
     lang:get("寒"),
     lang:get("封"),
     lang:get("币"),
     lang:get("帮"),
     lang:get("悬"),
     lang:get("我"),
     lang:get("战"),
     lang:get("招"),
     lang:get("收"),
     lang:get("本"),
     lang:get("极"),
     lang:get("水"),
     lang:get("求"),
     lang:get("浇"),
     lang:get("炼"),
     lang:get("王"),
     lang:get("空"),
     lang:get("组"),
     lang:get("航"),
     lang:get("花"),
     lang:get("试"),
     lang:get("赏"),
     lang:get("起"),
     lang:get("远"),
     lang:get("银"),
     lang:get("长"),
     lang:get("队"),
     lang:get("领"),
     lang:get("龙")].

get_open_cfg("dev") -> {[], 15};
get_open_cfg("mix") -> {[], 15};
get_open_cfg("unite") -> {[], 15};
get_open_cfg("sp") -> {[], 15};
get_open_cfg(_) -> false.

