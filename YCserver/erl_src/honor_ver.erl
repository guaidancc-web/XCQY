-file("src/mod/honor/honor_ver.erl", 1).

-module(honor_ver).

-author("jia").

-export([convert/1]).

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

-file("src/mod/honor/honor_ver.erl", 17).

-file("inc/honor.hrl", 1).

-record(m_honor,
        {ver = 3,
         use_id = 0,
         last_id = 0,
         r_list = [] :: list(),
         pre_id = 0,
         r_pre_list = [] :: list(),
         pre_reward_list = [] :: list()}).

-record(honor,
        {id = 0 :: non_neg_integer(),
         end_time = 0 :: non_neg_integer()}).

-record(pre_honor,
        {pre_id = 0 :: non_neg_integer(),
         end_time = 0 :: non_neg_integer()}).

-record(honor_info,
        {key :: undefined | atom(),
         list = [] :: list(),
         end_time = 0 :: non_neg_integer()}).

-record(honor_base,
        {id = 0 :: non_neg_integer(),
         name = "" :: list(),
         type = 0 :: non_neg_integer(),
         mode_type = 0 :: non_neg_integer(),
         show_type = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         is_cast = 0,
         sex = 2 :: non_neg_integer(),
         attr_list = [] :: list(),
         is_can_pre = 0 :: non_neg_integer(),
         collect_val = 0 :: non_neg_integer(),
         color = 12 :: non_neg_integer()}).

-record(pre_honor_base,
        {pre_id = 0 :: non_neg_integer(),
         pre_name = "" :: list(),
         is_cast = 0,
         items = [] :: list(),
         loss_items = [] :: list()}).

-file("src/mod/honor/honor_ver.erl", 18).

convert({m_honor, Ver = 1, UseID, LastID, Honors}) ->
    NewVer = Ver + 1,
    UsePreID = 0,
    PreList = [],
    convert({m_honor,
             NewVer,
             UseID,
             LastID,
             Honors,
             UsePreID,
             PreList});
convert({m_honor,
         Ver = 2,
         UseID,
         LastID,
         Honors,
         UsePreID,
         PreList}) ->
    NewVer = Ver + 1,
    PreRewardList = [],
    convert({m_honor,
             NewVer,
             UseID,
             LastID,
             Honors,
             UsePreID,
             PreList,
             PreRewardList});
convert(MHonor = #m_honor{ver = 3}) -> {ok, MHonor};
convert(_Err) ->
    logger:error("m_honor_ver版本错误:~w",
                 [_Err],
                 honor_ver,
                 33),
    {false, "m_honor_ver版本转换失败"}.

