-file("src/mod/guard/guard_ver.erl", 1).

-module(guard_ver).

-export([do/1, do_guard_ver/1]).

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

-file("src/mod/guard/guard_ver.erl", 19).

-file("inc/attr.hrl", 1).

-record(attr_base,
        {type = 0 :: non_neg_integer(),
         name = 0 :: pos_integer(),
         flag = 0 :: non_neg_integer(),
         calc_type = 0 :: non_neg_integer(),
         val = 0 :: non_neg_integer()}).

-record(attr,
        {ver = 3,
         fc = 0 :: non_neg_integer(),
         speed = 260 :: pos_integer(),
         hp_max = 0 :: non_neg_integer(),
         mp_max = 0 :: non_neg_integer(),
         atk_speed = 0 :: non_neg_integer(),
         phy_dmg = 0 :: non_neg_integer(),
         magic_dmg = 0 :: non_neg_integer(),
         phy_def = 0 :: non_neg_integer(),
         magic_def = 0 :: non_neg_integer(),
         crit = 0 :: non_neg_integer(),
         tenacity = 0 :: non_neg_integer(),
         accuracy = 0 :: non_neg_integer(),
         evasion = 0 :: non_neg_integer(),
         holy_dmg = 0 :: non_neg_integer(),
         crit_dmg = 0 :: non_neg_integer(),
         crit_dmg_def = 0 :: non_neg_integer(),
         dmg_ratio = 0 :: non_neg_integer(),
         def_ratio = 0 :: non_neg_integer(),
         enhance_control = 0 :: non_neg_integer(),
         anti_control = 0 :: non_neg_integer(),
         escape = 0 :: non_neg_integer(),
         anti_escape = 0 :: non_neg_integer(),
         capture = 0 :: non_neg_integer(),
         phy_def_ratio = 0 :: non_neg_integer(),
         magic_def_ratio = 0 :: non_neg_integer(),
         phy_accuracy = 0 :: non_neg_integer(),
         magic_accuracy = 0 :: non_neg_integer(),
         phy_evasion = 0 :: non_neg_integer(),
         magic_evasion = 0 :: non_neg_integer(),
         phy_crit = 0 :: non_neg_integer(),
         magic_crit = 0 :: non_neg_integer(),
         phy_tenacity = 0 :: non_neg_integer(),
         magic_tenacity = 0 :: non_neg_integer(),
         heal_val = 0 :: non_neg_integer(),
         heal_ratio = 0 :: non_neg_integer(),
         eff_heal_ratio = 0 :: non_neg_integer(),
         phy_dmg_ratio = 0 :: non_neg_integer(),
         magic_dmg_ratio = 0 :: non_neg_integer(),
         strength = 0,
         constitution = 0,
         magic = 0,
         agility = 0,
         endurance = 0,
         exp_ratio = 0}).

-record(attr_calc,
        {attr :: undefined | #attr{},
         attr_no_ratio :: undefined | #attr{},
         ratio :: undefined | #attr{},
         attr_no_fc :: undefined | #attr{},
         ratio_no_fc :: undefined | #attr{}}).

-record(m_attr_point,
        {ver = 2,
         ext_point = [],
         first_free = 0,
         valid_plan = 1,
         plan_data = [],
         change_plan_times = 0}).

-record(attr_point_plan,
        {index = 1 :: pos_integer(),
         plan_name = [],
         strength = 0 :: pos_integer(),
         constitution = 0 :: non_neg_integer(),
         magic = 0 :: non_neg_integer(),
         agility = 0 :: non_neg_integer(),
         endurance = 0 :: non_neg_integer(),
         pre_str = 0,
         pre_con = 0,
         pre_magic = 0,
         pre_agi = 0,
         pre_end = 0}).

-file("src/mod/guard/guard_ver.erl", 20).

-file("inc/guard.hrl", 1).

-record(m_guard,
        {ver = 1 :: pos_integer(),
         free_war_ids = [] :: [pos_integer()],
         tactics_fields = [] :: list(),
         tactics_attr = [] :: list(),
         guards = [] :: list()}).

-record(guard_eqm,
        {ver = 5,
         base_id :: undefined | non_neg_integer(),
         type :: undefined | non_neg_integer(),
         lev,
         eqm_attrs = [] :: list(),
         reset_base_id = 0,
         reset_attrs = [] :: list(),
         gem = [] :: list(),
         is_init = 1,
         timeout = 0,
         back_effect_timeout = 0,
         back_effect_attr = []}).

-record(guard_astroid,
        {ver = 2 :: non_neg_integer(),
         aroused = [] :: non_neg_integer(),
         skills = [] :: list(),
         attrs = [] :: list(),
         growth = 0 :: non_neg_integer(),
         active = 0 :: non_neg_integer()}).

-record(guard_astroid_star,
        {ver = 0,
         id = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         exp = 0 :: non_neg_integer(),
         attrs = [] :: list()}).

-record(guard,
        {ver = 2,
         base_id = 0 :: non_neg_integer(),
         war_id = 0 :: non_neg_integer(),
         name = "" :: string(),
         alias = "" :: string(),
         classes = 0 :: non_neg_integer(),
         quality = 0 :: non_neg_integer(),
         status = 0 :: non_neg_integer(),
         tac_pos = 0 :: non_neg_integer(),
         skills = [] :: list(),
         eqm = [] :: list(),
         attr :: undefined | tuple(),
         score = 0 :: non_neg_integer(),
         astroid = #guard_astroid{} :: #guard_astroid{}}).

-record(guard_data,
        {base_id = 0 :: non_neg_integer(),
         name = "" :: binary(),
         alias = "" :: binary(),
         classes = 0 :: non_neg_integer(),
         quality = 0 :: non_neg_integer(),
         loss = [] :: tuple(),
         recruit_lev = 1 :: non_neg_integer(),
         desc = "" :: list(),
         normal_atk_id = 0 :: integer(),
         ai_id = 0 :: integer(),
         base_score = 0,
         growth = 0 :: non_neg_integer()}).

-record(guard_eqm_data,
        {base_id = 0 :: non_neg_integer(),
         lev = 1 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         type = 0 :: non_neg_integer(),
         quality = 0 :: non_neg_integer(),
         loss_coin = 0 :: [tuple()],
         reset_coin = 0 :: [tuple()],
         gem_list = [] :: list()}).

-record(guard_lev_data,
        {base_id :: undefined | non_neg_integer(),
         lev :: undefined | non_neg_integer(),
         lev_up_exp :: undefined | non_neg_integer(),
         attrs = [] :: non_neg_integer()}).

-record(guard_eqm_gem,
        {id = 0, base_id = 0, type = 0, lev = 0}).

-record(guard_eqm_gem_data,
        {base_id = 0,
         next_base_id = 0,
         name = "",
         lev = 0,
         type = 0,
         need_lev = 0,
         loss_coin = [],
         attrs = []}).

-file("src/mod/guard/guard_ver.erl", 21).

do(MGuard = #m_guard{ver = 1, guards = Guards}) ->
    case guard_ver(Guards, []) of
        {ok, NewGuards} ->
            {ok, MGuard#m_guard{guards = NewGuards}};
        _Err ->
            {false, util:flist("守护数据版本转换失败[~w]", [{guard_ver, 41}])}
    end;
do(_MGuard) ->
    {false,
     util:flist("守护数据版本转换失败[~w]", [{guard_ver, 44}])}.

guard_ver([], Guards) -> {ok, Guards};
guard_ver([Guard | Rest], Guards) ->
    case do_guard_ver(Guard) of
        {ok, NewGuard} -> guard_ver(Rest, [NewGuard | Guards]);
        _False -> false
    end.

do_guard_ver({guard,
              Ver = 1,
              Base_id,
              War_id,
              Name,
              Alias,
              Classes,
              Quality,
              Status,
              Tac_pos,
              Skills,
              Eqm,
              Attr,
              Score}) ->
    NewVer = Ver + 1,
    Astroid = #guard_astroid{},
    do_guard_ver({guard,
                  NewVer,
                  Base_id,
                  War_id,
                  Name,
                  Alias,
                  Classes,
                  Quality,
                  Status,
                  Tac_pos,
                  Skills,
                  Eqm,
                  Attr,
                  Score,
                  Astroid});
do_guard_ver(Guard = #guard{ver = 2}) ->
    case do_field([attr, eqm, astroid], Guard) of
        {ok, NewGuard} -> {ok, NewGuard};
        _Err -> false
    end;
do_guard_ver(_Guard) -> {false, "守护版本转换失败"}.

do_field([], Guard) -> {ok, Guard};
do_field([attr | T], Guard = #guard{attr = Attr}) ->
    NewAttr = case attr_ver:do(Attr) of
                  {ok, Attr1} -> Attr1;
                  _ -> #attr{}
              end,
    do_field(T, Guard#guard{attr = NewAttr});
do_field([eqm | T], Guard = #guard{eqm = Eqms}) ->
    case guard_eqm_ver(Eqms, []) of
        {ok, NewEqms} ->
            do_field(T, Guard#guard{eqm = NewEqms});
        _Err -> false
    end;
do_field([astroid | T],
         Guard = #guard{astroid = Astroid}) ->
    case astroid_ver(Astroid) of
        {ok, NewAstroid} ->
            do_field(T, Guard#guard{astroid = NewAstroid});
        _Err -> false
    end.

astroid_ver({guard_astroid,
             Ver = 0,
             Aroused,
             Skills,
             Attrs}) ->
    NewVer = Ver + 1,
    Growth = 0,
    astroid_ver({guard_astroid,
                 NewVer,
                 Aroused,
                 Skills,
                 Attrs,
                 Growth});
astroid_ver({guard_astroid,
             Ver = 1,
             Aroused,
             Skills,
             Attrs,
             Growth}) ->
    NewVer = Ver + 1,
    Active = 0,
    astroid_ver({guard_astroid,
                 NewVer,
                 Aroused,
                 Skills,
                 Attrs,
                 Growth,
                 Active});
astroid_ver(A = #guard_astroid{ver = 2}) -> {ok, A};
astroid_ver(_A) ->
    logger:error("星阵数据转换失败 ~w", [_A], guard_ver, 123),
    false.

guard_eqm_ver([], Eqms) -> {ok, Eqms};
guard_eqm_ver([Eqm | Rest], Eqms) ->
    case do_guard_eqm_ver(Eqm) of
        {ok, NewEqm} -> guard_eqm_ver(Rest, [NewEqm | Eqms]);
        _False -> false
    end.

do_guard_eqm_ver({guard_eqm,
                  Ver = 1,
                  BaseId,
                  Type,
                  Lev,
                  EqmAttr,
                  _ResetBaseId,
                  _ResetAttrs,
                  Gem}) ->
    NewVer = Ver + 1,
    IsInit = 0,
    NewResetBaseId = 0,
    NewResetAttrs = [],
    do_guard_eqm_ver({guard_eqm,
                      NewVer,
                      BaseId,
                      Type,
                      Lev,
                      EqmAttr,
                      NewResetBaseId,
                      NewResetAttrs,
                      Gem,
                      IsInit});
do_guard_eqm_ver({guard_eqm,
                  Ver = 2,
                  BaseId,
                  Type,
                  Lev,
                  EqmAttr,
                  NewResetBaseId,
                  NewResetAttrs,
                  Gem,
                  _IsInit}) ->
    NewVer = Ver + 1,
    NewIsInit = 0,
    do_guard_eqm_ver({guard_eqm,
                      NewVer,
                      BaseId,
                      Type,
                      Lev,
                      EqmAttr,
                      NewResetBaseId,
                      NewResetAttrs,
                      Gem,
                      NewIsInit});
do_guard_eqm_ver({guard_eqm,
                  Ver = 3,
                  BaseId,
                  Type,
                  Lev,
                  EqmAttr,
                  NewResetBaseId,
                  NewResetAttrs,
                  Gem,
                  IsInit}) ->
    NewVer = Ver + 1,
    Timeout = 0,
    do_guard_eqm_ver({guard_eqm,
                      NewVer,
                      BaseId,
                      Type,
                      Lev,
                      EqmAttr,
                      NewResetBaseId,
                      NewResetAttrs,
                      Gem,
                      IsInit,
                      Timeout});
do_guard_eqm_ver({guard_eqm,
                  Ver = 4,
                  BaseId,
                  Type,
                  Lev,
                  EqmAttr,
                  NewResetBaseId,
                  NewResetAttrs,
                  Gem,
                  IsInit,
                  Timeout}) ->
    NewVer = Ver + 1,
    BackEffectTime = 0,
    BackEffectAttr = [],
    do_guard_eqm_ver({guard_eqm,
                      NewVer,
                      BaseId,
                      Type,
                      Lev,
                      EqmAttr,
                      NewResetBaseId,
                      NewResetAttrs,
                      Gem,
                      IsInit,
                      Timeout,
                      BackEffectTime,
                      BackEffectAttr});
do_guard_eqm_ver(Eqm = #guard_eqm{ver = 5}) ->
    {ok, Eqm};
do_guard_eqm_ver(_Eqm) ->
    logger:error("守护装备出错:~w", [_Eqm], guard_ver, 159),
    {false, lang:get("守护装备版本转换出错")}.

