-file("src/mod/buff/buff_ver.erl", 1).

-module(buff_ver).

-export([do/1]).

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

-file("src/mod/buff/buff_ver.erl", 13).

-file("inc/buff.hrl", 1).

-record(m_buff, {ver = 2, r_list = [], show = 1}).

-record(buff_base,
        {id = 1,
         name = "",
         class = 0,
         lev = 0,
         cancel = 0,
         same_buff_mode = 0,
         type = 1,
         sub_type = 0,
         time_mode = 0,
         max_time_num = 1,
         duration = 0,
         max_effect_lev = 1,
         looks = [],
         attr = [],
         guard_attr = [],
         pet_attr = [],
         end_date = 0,
         extra = [],
         effect = [],
         dynamic_attr = [],
         pvp_limit = 0,
         desc = ""}).

-record(buff,
        {ver = 4,
         id = 1,
         class = 0,
         lev = 0,
         cancel = 0,
         type = 1,
         same_buff_mode = 0,
         time_mode = 0,
         duration = 0,
         max_duration = 1,
         effect_lev = 1,
         end_date = 0,
         start_time = 0,
         looks = [],
         dynamic_attr = [],
         pvped = 0,
         ext_param = [],
         args = 1}).

-file("src/mod/buff/buff_ver.erl", 14).

do({m_buff, Ver = 1, Rlist}) ->
    NewVer = Ver + 1,
    Show = 1,
    do({m_buff, NewVer, Rlist, Show});
do(Data = #m_buff{ver = 2, r_list = Rlist}) ->
    case do_list(Rlist, []) of
        {ok, Rlist1} -> {ok, Data#m_buff{r_list = Rlist1}};
        {false, Reason} -> {false, Reason}
    end;
do(Data) ->
    logger:error("buff版本转换失败：:~w", [Data], buff_ver, 25),
    {false, lang:get("buff版本转换出错")}.

do_one({buff,
        Ver = 1,
        Id,
        Class,
        Lev,
        Cancel,
        Type,
        SameMode,
        TimeMode,
        Duration,
        MaxDuration,
        EffectLev,
        EndDate,
        StartTime,
        Looks,
        DynamicAttr}) ->
    NewVer = Ver + 1,
    Pvped = 0,
    do_one({buff,
            NewVer,
            Id,
            Class,
            Lev,
            Cancel,
            Type,
            SameMode,
            TimeMode,
            Duration,
            MaxDuration,
            EffectLev,
            EndDate,
            StartTime,
            Looks,
            DynamicAttr,
            Pvped});
do_one({buff,
        Ver = 2,
        Id,
        Class,
        Lev,
        Cancel,
        Type,
        SameMode,
        TimeMode,
        Duration,
        MaxDuration,
        EffectLev,
        EndDate,
        StartTime,
        Looks,
        DynamicAttr,
        Pvped}) ->
    NewVer = Ver + 1,
    Ext_param = [],
    do_one({buff,
            NewVer,
            Id,
            Class,
            Lev,
            Cancel,
            Type,
            SameMode,
            TimeMode,
            Duration,
            MaxDuration,
            EffectLev,
            EndDate,
            StartTime,
            Looks,
            DynamicAttr,
            Pvped,
            Ext_param});
do_one({buff,
        Ver = 3,
        Id,
        Class,
        Lev,
        Cancel,
        Type,
        SameMode,
        TimeMode,
        Duration,
        MaxDuration,
        EffectLev,
        EndDate,
        StartTime,
        Looks,
        DynamicAttr,
        Pvped,
        Ext_param}) ->
    NewVer = Ver + 1,
    Args = 1,
    do_one({buff,
            NewVer,
            Id,
            Class,
            Lev,
            Cancel,
            Type,
            SameMode,
            TimeMode,
            Duration,
            MaxDuration,
            EffectLev,
            EndDate,
            StartTime,
            Looks,
            DynamicAttr,
            Pvped,
            Ext_param,
            Args});
do_one(Data = #buff{ver = 4}) -> {ok, Data};
do_one(_Buff) ->
    logger:error("异常数据 ~w", [_Buff], buff_ver, 44),
    {false, lang:get("buff数据异常")}.

do_list([], Buffs) -> {ok, lists:reverse(Buffs)};
do_list([H | T], Buffs) ->
    case do_one(H) of
        {ok, B} -> do_list(T, [B | Buffs]);
        {false, Reason} -> {false, Reason}
    end.

