-file("src/mod/handbook/handbook_ver.erl", 1).

-module(handbook_ver).

-export([do/1]).

-file("inc/handbook.hrl", 1).

-record(m_handbook,
        {ver = 4,
         book_list = [],
         set_list = [],
         auto_book_id = 0,
         store_items = [],
         next_time = 0,
         need_list = [],
         ban_speed_set_list = []}).

-record(handbook_item,
        {idx = 0, id = 0, num = 1, val = 0, flag = 0}).

-record(handbook,
        {ver = 4,
         id = 0,
         status = 0,
         active_step = 0,
         star_step = 0,
         star_val = 0,
         transform_point = 0,
         active_effect_type = 3,
         active_attr = [],
         star_effect_type = 1,
         star_effect_list = [],
         star_attr = [],
         add_point = 0}).

-record(handbook_base,
        {id,
         name = "",
         level_limit = 0,
         lev = 0,
         grade_lev = 1,
         grade_type = 1,
         effect_type = 1,
         active_reward = [],
         set_id = [],
         allow_item = [],
         active_loss = [],
         star_loss = [],
         transform_point = 1,
         max_active_step = 2,
         max_star_step = 2,
         fc = 0,
         fc1 = 0,
         fc2 = 0,
         fuse_flag = 0,
         fuse_id = 0,
         times = 0,
         illusion_id = 0,
         fuse_num1 = 0,
         lev_num1 = 0,
         fuse_num2 = 0,
         lev_num2 = 0,
         fuse_num3 = 0,
         lev_num3 = 0,
         target_id = 0,
         universal = 0,
         bind = 1}).

-file("src/mod/handbook/handbook_ver.erl", 14).

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

-file("src/mod/handbook/handbook_ver.erl", 15).

do({m_handbook,
    Ver = 1,
    BookList,
    SetList,
    AutoBookId}) ->
    NextTime = 0,
    StoreItems = [],
    do({m_handbook,
        Ver + 1,
        BookList,
        SetList,
        AutoBookId,
        StoreItems,
        NextTime});
do({m_handbook,
    Ver = 2,
    BookList,
    SetList,
    AutoBookId,
    StoreItems,
    NextTime}) ->
    NeedList = [],
    do({m_handbook,
        Ver + 1,
        BookList,
        SetList,
        AutoBookId,
        StoreItems,
        NextTime,
        NeedList});
do({m_handbook,
    Ver = 3,
    BookList,
    SetList,
    AutoBookId,
    StoreItems,
    NextTime,
    NeedList}) ->
    BanSpeedSetList = [],
    do({m_handbook,
        Ver + 1,
        BookList,
        SetList,
        AutoBookId,
        StoreItems,
        NextTime,
        NeedList,
        BanSpeedSetList});
do(Data = #m_handbook{ver = 4, book_list = BookList}) ->
    case do_handbook_list(BookList, []) of
        {ok, NewBookList} ->
            {ok, Data#m_handbook{book_list = NewBookList}};
        {false, Reason} -> {false, Reason}
    end;
do(_Err) ->
    logger:error("角色图鉴版本转换失败:~w", [_Err], handbook_ver, 35),
    {false, lang:get("角色图鉴版本转换失败")}.

do_handbook_list([], HandBookList) ->
    {ok, HandBookList};
do_handbook_list([H | T], HandBookList) ->
    case do_handbook(H) of
        {ok, NewH} ->
            do_handbook_list(T, [NewH | HandBookList]);
        {false, Reason} -> {false, Reason}
    end.

do_handbook({handbook,
             Ver = 1,
             Id,
             Status,
             ActiveStep,
             StarStep,
             TransformPoint,
             _Attr,
             _PetAttr,
             _GuardAttr}) ->
    ActiveEffectType = 3,
    ActiveAttr = [],
    StarEffectType = 1,
    StarEffectList = [],
    StarAttr = [],
    do_handbook({handbook,
                 Ver + 1,
                 Id,
                 Status,
                 ActiveStep,
                 StarStep,
                 TransformPoint,
                 ActiveEffectType,
                 ActiveAttr,
                 StarEffectType,
                 StarEffectList,
                 StarAttr});
do_handbook({handbook,
             Ver = 2,
             Id,
             Status,
             ActiveStep,
             StarStep,
             TransformPoint,
             ActiveEffectType,
             ActiveAttr,
             StarEffectType,
             StarEffectList,
             StarAttr}) ->
    AddPoint = 0,
    do_handbook({handbook,
                 Ver + 1,
                 Id,
                 Status,
                 ActiveStep,
                 StarStep,
                 TransformPoint,
                 ActiveEffectType,
                 ActiveAttr,
                 StarEffectType,
                 StarEffectList,
                 StarAttr,
                 AddPoint});
do_handbook({handbook,
             Ver = 3,
             Id,
             Status,
             ActiveStep,
             StarStep,
             TransformPoint,
             ActiveEffectType,
             ActiveAttr,
             StarEffectType,
             StarEffectList,
             StarAttr,
             AddPoint}) ->
    StarVal = 0,
    do_handbook({handbook,
                 Ver + 1,
                 Id,
                 Status,
                 ActiveStep,
                 StarStep,
                 StarVal,
                 TransformPoint,
                 ActiveEffectType,
                 ActiveAttr,
                 StarEffectType,
                 StarEffectList,
                 StarAttr,
                 AddPoint});
do_handbook(HandBook = #handbook{ver = 4}) ->
    {ok, HandBook};
do_handbook(_Err) ->
    logger:error("图鉴版本转换失败:~w", [_Err], handbook_ver, 65),
    {false, lang:get("图鉴版本转换失败")}.

