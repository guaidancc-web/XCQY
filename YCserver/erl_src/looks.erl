-file("src/mod/looks/looks.erl", 1).

-module(looks).

-export([add/2,
         async_add/3,
         async_del/2,
         add/3,
         del/2,
         del/3,
         calc/1,
         update_looks/2,
         find/2,
         login/1,
         check_looks/1,
         get_looks/1]).

-file("inc/role.hrl", 1).

-record(role,
        {ver = 76 :: pos_integer(),
         pid :: undefined | pid(),
         loop_counter = 1 :: pos_integer(),
         is_gain = false,
         need_sync = false :: boolean(),
         time_info = {0, 0} ::
             {non_neg_integer(), non_neg_integer()},
         time_reg = 1 :: pos_integer(),
         ip_reg = {0, 0, 0, 0} :: tuple(),
         ip_last_login = {0, 0, 0, 0} :: tuple(),
         lock_status = 0,
         id = {1, "", 0} ::
             {pos_integer(), list(), non_neg_integer()},
         platform = "" :: list(),
         zone_id = 0 :: non_neg_integer(),
         channel_reg = 0 :: non_neg_integer(),
         dispense = "",
         device_id = "",
         device_type = 1,
         device_key = "",
         account = "" :: list(),
         name = "" :: list(),
         charge = 0 :: non_neg_integer(),
         consume = 0,
         label = 0 :: 0..2,
         sex = 2 :: 0..2,
         classes = 0 :: 0..5,
         lev = 0 :: non_neg_integer(),
         realm = 0 :: non_neg_integer(),
         speed = 0 :: non_neg_integer(),
         hp = 1 :: pos_integer(),
         mp = 1 :: pos_integer(),
         hp_max = 1 :: pos_integer(),
         mp_max = 1 :: pos_integer(),
         face = 1 :: pos_integer(),
         assets :: undefined | tuple(),
         attr :: undefined | tuple(),
         link :: undefined | tuple(),
         trigger = {1, []} :: {pos_integer(), [tuple()]},
         timer :: undefined | tuple(),
         pos :: undefined | tuple(),
         extra = [] :: [{non_neg_integer(), term()}],
         status = 0 :: 0..4,
         s_action = 0 :: non_neg_integer(),
         s_ride = 0 :: 0..3,
         s_event = 0 :: non_neg_integer(),
         s_event_pid = 0 :: 0 | undefined | pid(),
         s_name = 0 :: 0 | 1,
         s_looks = [] ::
             [{non_neg_integer(),
               non_neg_integer(),
               non_neg_integer(),
               bitstring()}],
         s_follow = [] :: [tuple()],
         debug_rpc = false :: boolean(),
         name_used = "" :: string(),
         cross_type = 0,
         m_attr_point,
         m_combat,
         m_quest,
         m_pet,
         m_skill,
         m_var,
         m_guard,
         m_plot,
         m_dungeon,
         m_guild,
         m_home,
         m_option,
         m_wing,
         m_team,
         m_honor,
         m_friend,
         m_wake,
         m_arena,
         m_market_silver,
         m_escort,
         m_buff,
         m_formation,
         m_skill_life,
         m_trial,
         m_fashion,
         m_satiety,
         m_agenda,
         m_parade,
         m_mail = [],
         m_qualifying,
         m_treasure,
         m_campaign,
         m_shipping,
         m_checkin,
         m_tower,
         m_classes_challenge,
         m_fairyland,
         m_glory,
         m_examination,
         m_adm,
         m_alchemy,
         m_pet_store,
         m_store,
         m_achievement,
         m_wedding,
         m_constellation,
         m_investment,
         m_privilege,
         m_limit_return,
         m_pray,
         m_teacher,
         m_help,
         m_achieve_shop,
         m_brave_trial,
         m_camp_dragon_boat,
         m_over_seas,
         m_hook_setting,
         m_tournament,
         m_market_gold,
         m_goal,
         m_family,
         m_charge_gift,
         m_mount,
         m_camp_web,
         m_handbook,
         m_endless_challenge,
         m_lev_break,
         m_head,
         m_extension,
         m_camp_cake,
         m_rainbow_lottery,
         m_sworn,
         m_gods_duel,
         m_preparation,
         m_reward_back,
         m_child,
         m_maze,
         m_raffle,
         m_rencounter,
         m_talisman,
         m_month_gift,
         m_pay_turn,
         m_camp_box,
         m_camp_pay_continus,
         m_spirit_treasure,
         m_camp_discount,
         m_camp_7_7th,
         m_new_expression,
         m_exquisite_shelf,
         m_camp_recharge,
         m_camp_recharge_gift,
         m_camp_collection,
         m_camp_cut_price,
         m_camp_inquiry,
         m_gods_place,
         m_camp_slot_machine,
         m_camp_sign_draw,
         m_agenda_week,
         m_exp_bottle,
         m_camp_zillionaire,
         m_provocation,
         m_oracle_treasure,
         m_camp_pass_flower_language,
         m_camp_score_exchange,
         m_camp_pray,
         p_bag,
         p_store,
         p_eqm,
         p_family_store}).

-record(map_role,
        {pid :: undefined | pid(),
         rid = 0 :: non_neg_integer(),
         platform = "" :: list(),
         zone_id = 0 :: non_neg_integer(),
         name = "" :: list(),
         speed = 1 :: pos_integer(),
         conn_pid :: undefined | pid(),
         map = 0 :: non_neg_integer(),
         grid_pid :: undefined | pid(),
         dir = 0 :: non_neg_integer(),
         x = 0 :: non_neg_integer(),
         y = 0 :: non_neg_integer(),
         gx = 0 :: non_neg_integer(),
         gy = 0 :: non_neg_integer(),
         status = 0 :: non_neg_integer(),
         action = 0 :: non_neg_integer(),
         ride = 0 :: non_neg_integer(),
         event = 0 :: non_neg_integer(),
         hidden = 0 :: 0..1,
         label = 0 :: 0..2,
         lev = 1 :: pos_integer(),
         sex = 0 :: 0..2,
         classes = 0 :: 0..5,
         realm = 0 :: non_neg_integer(),
         face = 1 :: pos_integer(),
         fc = 0 :: non_neg_integer(),
         prop = [] :: [{non_neg_integer(), string()}],
         looks = [] :: list(),
         follow_list = [] :: list(),
         guild = "" :: bitstring(),
         guild_post = "" :: bitstring(),
         guild_signature = "" :: bitstring(),
         guild_id = {0, "", 0} ::
             {non_neg_integer(), bitstring(), non_neg_integer()},
         team_status = 0 :: 0..4,
         team_num = 0,
         lover_rid = 0 :: non_neg_integer(),
         lover_platform = "" :: list(),
         lover_zone_id = 0 :: non_neg_integer(),
         lover_name = "" :: list(),
         lover_status = 0 :: non_neg_integer(),
         team_mark = 401 :: non_neg_integer(),
         foot_mark = 0 :: non_neg_integer()}).

-record(role_info,
        {id = 0 :: non_neg_integer(),
         platform = "" :: list(),
         zone_id = 0 :: non_neg_integer(),
         name = "" :: list(),
         lock_status = 0 :: 0..3,
         lev = 1 :: pos_integer(),
         break_times = 0 :: non_neg_integer(),
         sex = 0 :: 0..2,
         classes = 0 :: 0..5,
         fc = 0 :: pos_integer(),
         guild = "" :: list()}).

-record(role_name_used,
        {ver = 1,
         id = {0, "", 0},
         name = "",
         new_name = "",
         sex = 0,
         classes = 0,
         time = 0}).

-record(role_profile,
        {id = {0, "", 0} :: tuple(),
         name = "" :: list(),
         lev = 1 :: pos_integer(),
         sex = 0 :: 0..2,
         classes = 0 :: 0..5,
         fc = 0 :: pos_integer(),
         face = 0 :: non_neg_integer(),
         guild_id = {0, "", 0} :: tuple(),
         guild_name = "" :: list(),
         looks = [],
         achievement_point = 0 :: non_neg_integer(),
         achievement_assets_point = 0,
         achievement_list = [],
         status = 0 :: 0..4,
         team_status = 0 :: 0..4,
         team_num = 0,
         name_used = "" :: string(),
         honor_id = 0 :: non_neg_integer(),
         lover_name = "" :: string(),
         teacher_name = "" :: string(),
         tournament_lev = 0 :: non_neg_integer(),
         family_id = {0, "", 0} :: tuple(),
         break_times = 0 :: non_neg_integer(),
         pre_honor_id = 0 :: non_neg_integer()}).

-record(role_cache,
        {id = {1, "", 0} ::
             {pos_integer(), bitstring(), non_neg_integer()},
         pid :: undefined | pid(),
         link,
         account = "" :: bitstring(),
         name = "" :: bitstring(),
         label = 0 :: 0..2,
         face = 1,
         sex = 2 :: 0..2,
         classes = 0 :: 0..4,
         lev = 0 :: non_neg_integer(),
         hp = 1 :: pos_integer(),
         mp = 1 :: pos_integer(),
         hp_max = 1 :: pos_integer(),
         mp_max = 1 :: pos_integer(),
         status = 0 :: 0..4,
         s_action = 0 :: non_neg_integer(),
         s_event = 0 :: non_neg_integer(),
         pos,
         channel_reg = 0 :: non_neg_integer()}).

-record(card_state,
        {gold = 0,
         gold_bind = 0,
         buy_time = 0,
         state = 0,
         day = 0,
         day_sum = 0,
         daily_time = 0}).

-record(m_new_expression,
        {s_expression = [], b_expression = []}).

-file("src/mod/looks/looks.erl", 24).

-file("inc/package.hrl", 1).

-record(package,
        {type = 1 :: integer(),
         next_id = 1 :: pos_integer(),
         volume = 0 :: non_neg_integer(),
         free_cell = [] :: list(),
         items = [] :: [tuple()]}).

-file("src/mod/looks/looks.erl", 25).

-file("inc/item.hrl", 1).

-record(item_base,
        {id = 0 :: non_neg_integer(),
         name = "" :: list(),
         type = 0 :: non_neg_integer(),
         quality = 0 :: 0..4,
         overlap = 1 :: pos_integer(),
         look_id = 0 :: non_neg_integer(),
         use_type = 0 :: 0..4,
         expire_type = 0 :: non_neg_integer(),
         expire_time = 0 ::
             non_neg_integer() |
             {{pos_integer(), pos_integer(), pos_integer()},
              {non_neg_integer(),
               non_neg_integer(),
               non_neg_integer()}},
         attr = [] :: [tuple()],
         lev = 0,
         classes = 0,
         sex = 2,
         buy_source = [],
         condition = [] :: [tuple()],
         effect = [] :: [tuple()],
         alchemy = 0 :: non_neg_integer()}).

-record(item,
        {ver = 0 :: non_neg_integer(),
         id = 0 :: non_neg_integer(),
         base_id = 0 :: non_neg_integer(),
         bind = 1 :: 0 | 1,
         look_id = 0,
         type = 0 :: non_neg_integer(),
         use_type = 0 :: 0..4,
         quality = 0 :: 0..4,
         craft = 0 :: 0..5,
         enchant = -1 :: integer(),
         growth_lev = 0,
         growth_val = 0,
         step = 0 :: pos_integer(),
         quantity = 1 :: 0..250,
         pos = 0 :: non_neg_integer(),
         expire_type = 0 :: 0..4,
         expire_time = 0 :: non_neg_integer(),
         attr = [] :: [tuple()],
         reset_attr = [],
         lev = 1 :: pos_integer(),
         classes = 0 :: 0..6,
         sex = 2 :: 0..2,
         extra = [] :: [tuple()],
         data = [] :: [any()]}).

-record(item_extra_info, {source, price}).

-file("src/mod/looks/looks.erl", 26).

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

-file("src/mod/looks/looks.erl", 27).

-file("inc/looks.hrl", 1).

-file("src/mod/looks/looks.erl", 28).

-file("inc/wedding.hrl", 1).

-record(m_wedding,
        {ver = 1,
         lover_id = {0, "", 0},
         lover_name = "",
         status = 0,
         honor_ids = [],
         reward = [],
         mail = []}).

-record(lover,
        {id = {0, "", 0} ::
             {non_neg_integer(), bitstring(), non_neg_integer()},
         name = "" :: bitstring(),
         lover_id = {0, "", 0} ::
             {non_neg_integer(), bitstring(), non_neg_integer()},
         lover_name = "" :: bitstring(),
         type = 1 :: 1..2,
         status = 1 :: 0..2,
         ring_lev = 0 :: non_neg_integer(),
         intimacy = 0 :: non_neg_integer(),
         order_index = 0 :: non_neg_integer(),
         order_time = 0 :: non_neg_integer(),
         atmosp = 0 :: non_neg_integer(),
         index = 0 :: non_neg_integer(),
         time = 0 :: non_neg_integer(),
         lover_sex = 2 :: 0..2,
         lover_classes = 0,
         lover_lev = 0,
         lover_fc = 0,
         lover_pet_fc = 0,
         lover_face = 0}).

-record(guest,
        {id = {0, "", 0} ::
             {non_neg_integer(), bitstring(), non_neg_integer()},
         name = "" :: bitstring(),
         pid = 0 :: 0 | pid(),
         act_list = [],
         unit_list = [],
         classes = 0,
         sex = 0,
         lev = 0,
         face = 0}).

-record(wedding_atmosp_data,
        {type = 0 :: non_neg_integer(),
         min_val = 0 :: non_neg_integer(),
         max_val = 0 :: non_neg_integer(),
         exp = 0 :: non_neg_integer(),
         scene_reward = [] :: list(),
         scene_msg = "" :: string(),
         male_reward = [] :: list(),
         famale_reward = [] :: list(),
         title = "" :: string(),
         content = "" :: string()}).

-record(wedding_act_data,
        {id = 0,
         type = 0,
         target = 1,
         free_num = 0,
         max_num = 0,
         cost = [],
         msg = "",
         log_msg = "",
         atmosp = 0,
         gain = [],
         main_gain = [],
         effect_type = 0,
         effect_id = 1,
         effect_num = 1,
         cd = 0}).

-record(wedding_rank, {type = 0, list = []}).

-record(wedding_rank_rc,
        {id = {{0, "", 0}, {0, "", 0}},
         male_id = {0, "", 0},
         male_name = "",
         rank = 1,
         time = 0 :: non_neg_integer(),
         male_sex = 0 :: 0..2,
         male_classes = 0 :: 0..4,
         male_lev = 0 :: non_neg_integer(),
         female_id = {0, "", 0},
         female_name = "",
         female_sex = 0 :: 0..2,
         female_classes = 0 :: 0..4,
         female_lev = 0 :: non_neg_integer(),
         val1 = 0 :: non_neg_integer(),
         val2 = 0 :: non_neg_integer(),
         val3 = 0 :: non_neg_integer(),
         val4 = 0 :: non_neg_integer(),
         desc = ""}).

-record(wedding_rank_cfg,
        {type = 0 :: non_neg_integer(),
         num = 100 :: non_neg_integer(),
         keys =
             [#wedding_rank_rc.val3,
              #wedding_rank_rc.val2,
              #wedding_rank_rc.val1]
             :: [pos_integer()],
         min_val = 1 :: pos_integer()}).

-record(wedding_unit_data,
        {id = 0, target = 0, rand = [], limit = 0}).

-record(wedding_rank_honor_data,
        {type = 0,
         rank = 0,
         male_honor = 0,
         female_honor = 0,
         reward = [],
         title = "",
         content = ""}).

-record(wedding_rank_honor_type_data,
        {type = 0, day = day}).

-file("src/mod/looks/looks.erl", 29).

-file("inc/fashion.hrl", 1).

-record(m_fashion,
        {ver = 5,
         head = [],
         clothes = [],
         belt = [],
         ring = [],
         head_dyeing = [],
         clothes_dyeing = [],
         head_ornament = [],
         collect_lev = 0,
         collect_val = 0,
         classes_eqm = 0,
         eqm = []}).

-record(fashion_dress_data,
        {base_id = 0,
         name = "",
         type,
         quality = 0,
         classes = 0,
         sex = 2,
         lev,
         set_id = 0,
         texture_id = 0,
         is_origin = 0,
         loss = [],
         attrs = [],
         score = 0,
         can_use = 0,
         model_id = 0}).

-record(fashion_wear_data,
        {id = 0,
         base_id = 0,
         expire_type = 0,
         expire_time = 0}).

-record(fashion_dress,
        {base_id = 0,
         expire_type = 0,
         expire_time = 0,
         is_wear = 0}).

-record(fashion_dyeing, {dyeing_id = 0, is_use = 0}).

-record(fashion_time_data,
        {id = 0, expire_type = 0, expire_time = 0}).

-file("src/mod/looks/looks.erl", 30).

-spec login(Role :: #role{}) -> {ok,
                                 NewRole :: #role{}}.

login(Role = #role{}) ->
    NewRole = calc(Role),
    {ok, NewRole}.

async_add(RolePid, {Type, Mode, Val, Str}, Flag) ->
    role:apply(async,
               RolePid,
               {fun do_async_add/3, [{Type, Mode, Val, Str}, Flag]}),
    ok.

do_async_add(Role, {Type, Mode, Val, Str}, Flag) ->
    NewRole = add({Type, Mode, Val, Str}, Role, Flag),
    update_looks(Role, NewRole),
    {ok, NewRole}.

async_del(RolePid, Type) ->
    role:apply(async,
               RolePid,
               {fun do_async_del/2, [Type]}),
    ok.

do_async_del(Role, Type) ->
    NewRole = del(Type, Role),
    update_looks(Role, NewRole),
    {ok, NewRole}.

-spec add({Type, Mode, Val, Str},
          #role{}) -> #role{} when Type :: non_neg_integer(),
                                   Mode :: non_neg_integer(),
                                   Val :: non_neg_integer(), Str :: bitstring().

add({Type, Mode, Val, Str},
    Role = #role{s_looks = Looks}) ->
    Role#role{s_looks = [{Type, Mode, Val, Str} | Looks]}.

-spec add({Type, Mode, Val, Str}, #role{},
          Flag) -> #role{} when Type :: non_neg_integer(),
                                Mode :: non_neg_integer(),
                                Val :: non_neg_integer(), Str :: bitstring(),
                                Flag :: check_only | replace.

add({Type, Mode, Val, Str},
    Role = #role{s_looks = Looks}, check_only) ->
    case lists:keyfind(Type, 1, Looks) of
        false ->
            Role#role{s_looks = [{Type, Mode, Val, Str} | Looks]};
        _ -> Role
    end;
add({Type, Mode, Val, Str},
    Role = #role{s_looks = Looks}, replace) ->
    case lists:keyfind(Type, 1, Looks) of
        false ->
            Role#role{s_looks = [{Type, Mode, Val, Str} | Looks]};
        _ ->
            Role#role{s_looks =
                          lists:keyreplace(Type,
                                           1,
                                           Looks,
                                           {Type, Mode, Val, Str})}
    end.

-spec del(Type, #role{}) -> #role{} when Type ::
                                             non_neg_integer() | list().

del(Types, Role = #role{s_looks = Looks})
    when is_list(Types) ->
    NewLooks = [{Type1, Mode, Val, Str}
                || {Type1, Mode, Val, Str} <- Looks,
                   lists:member(Type1, Types) =:= false],
    Role#role{s_looks = NewLooks};
del(Type, Role = #role{s_looks = Looks}) ->
    NewLooks = lists:keydelete(Type, 1, Looks),
    Role#role{s_looks = NewLooks}.

-spec del(Type, #role{}, Flag) -> #role{} when Type ::
                                                   non_neg_integer() | list(),
                                               Flag :: all.

del(Types, Role = #role{s_looks = Looks}, all)
    when is_list(Types) ->
    NewLooks = [{Type1, Mode, Val, Str}
                || {Type1, Mode, Val, Str} <- Looks,
                   lists:member(Type1, Types) =:= false],
    Role#role{s_looks = NewLooks};
del(Type, Role = #role{s_looks = Looks}, all) ->
    NewLooks = [{Type1, Mode, Val, Str}
                || {Type1, Mode, Val, Str} <- Looks, Type1 =/= Type],
    Role#role{s_looks = NewLooks}.

-spec calc(#role{}) -> #role{}.

calc(Role = #role{s_event = SEvent})
    when SEvent == 37 orelse SEvent == 38 ->
    CampLooks = camp_halloween_mgr:get_look(Role),
    Role#role{s_looks = CampLooks};
calc(Role = #role{id = RoleId, s_event = SEvent,
                  sex = Sex})
    when SEvent == 13 ->
    MountRole = mount:calc_ride_status(Role),
    MarryLooks = case wedding:lover(RoleId) of
                     {ok, #lover{type = 1}} when Sex == 0 ->
                         [{2, 50042, 50042, ""}, {3, 51042, 51042, ""}];
                     {ok, #lover{type = 1}} when Sex == 1 ->
                         [{2, 50043, 50043, ""}, {3, 51043, 51043, ""}];
                     _ when Sex == 0 ->
                         [{2, 50046, 50046, ""}, {3, 51046, 51046, ""}];
                     _ -> [{2, 50047, 50047, ""}, {3, 51047, 51047, ""}]
                 end,
    WeddingLooks = wedding:get_look(MountRole),
    IconFrameLooks = case
                         tournament_season:get_icon_frame(Role)
                         of
                         0 -> [];
                         IconId -> [{66, IconId}]
                     end,
    NewAllLooks = MarryLooks ++
                      WeddingLooks ++ IconFrameLooks,
    Role#role{s_looks = NewAllLooks};
calc(Role) ->
    logger:debug("计算角色外观", [], looks, 132),
    LooksRole = #role{s_looks = BaseLooks} = del([1,
                                                  7,
                                                  50,
                                                  2,
                                                  3,
                                                  4,
                                                  52,
                                                  53,
                                                  58,
                                                  62,
                                                  6,
                                                  20,
                                                  21,
                                                  22,
                                                  66,
                                                  67,
                                                  68,
                                                  74,
                                                  55,
                                                  80,
                                                  81,
                                                  76],
                                                 Role),
    NewRole = mount:calc_ride_status(LooksRole),
    Looks = do_calc_eqm(NewRole),
    FashionLooks = fashion:get_look(NewRole),
    WingLooks = wing:get_look(NewRole),
    BuffLooks = buff:calc_looks(NewRole),
    ParadeLooks = parade:calc_looks(NewRole),
    HonorLooks = honor:get_looks(NewRole),
    WeddingLooks = wedding:get_look(NewRole),
    MountLooks = mount:get_look(NewRole),
    LevBreakLooks = lev_break:get_looks(NewRole),
    CampCakeLooks = camp_cake:get_look(NewRole),
    DoublerRideLooks = mount:get_double_look(NewRole),
    IconFrameLooks = case
                         tournament_season:get_icon_frame(Role)
                         of
                         0 -> [];
                         IconId -> [{66, IconId, IconId, ""}]
                     end,
    NewAllLooks = LevBreakLooks ++
                      BaseLooks ++
                          Looks ++
                              ParadeLooks ++
                                  BuffLooks ++
                                      WingLooks ++
                                          FashionLooks ++
                                              HonorLooks ++
                                                  WeddingLooks ++
                                                      MountLooks ++
                                                          IconFrameLooks ++
                                                              CampCakeLooks ++
                                                                  DoublerRideLooks,
    NewRole#role{s_looks = NewAllLooks}.

-spec update_looks(#role{}, #role{}) -> ok.

update_looks(_OldRole = #role{s_looks = Looks},
             NewRole = #role{s_looks = NewLooks}) ->
    case length(Looks) =:= length(NewLooks) of
        true ->
            case comp(Looks, NewLooks) of
                true -> skip;
                false -> map:role_update(NewRole)
            end;
        false -> map:role_update(NewRole)
    end,
    ok.

-spec find(Type :: non_neg_integer(),
           Role :: #role{}) -> true | false.

find(Type, #role{s_looks = Looks}) ->
    case lists:keyfind(Type, 1, Looks) of
        false -> false;
        Look -> {true, Look}
    end.

check_looks(#role{s_looks = Looks}) ->
    check_looks(Looks, []);
check_looks(Looks) when is_list(Looks) ->
    check_looks(Looks, []).

check_looks([], Looks) -> lists:reverse(Looks);
check_looks([{2, 0, _, _} | T], Looks) ->
    check_looks(T, Looks);
check_looks([{3, 0, _, _} | T], Looks) ->
    check_looks(T, Looks);
check_looks([H | T], Looks) ->
    check_looks(T, [H | Looks]).

get_looks(#role{s_looks = Looks}) -> {ok, Looks}.

do_calc_eqm(Role = #role{classes = Classes,
                         p_eqm = #package{items = Items}}) ->
    BaseLooks = do_calc_eqm(Role, Items, []),
    HaloLooks = do_calc_halo(Classes, Items),
    BaseLooks ++ HaloLooks.

do_calc_halo(Classes, Eqm) ->
    AllLev = case eqm_attr:get_all_enchant(Eqm, 1000, 0) of
                 false -> 0;
                 {ok, _, _, Lev} -> Lev
             end,
    case blacksmith_data:get_halo_id({AllLev, Classes}) of
        HaloId when is_integer(HaloId) -> [{7, 0, HaloId, ""}];
        _ -> []
    end.

do_calc_eqm(_Role, [], Looks) -> Looks;
do_calc_eqm(Role, [Item | T], Looks) ->
    EqmLook = item_to_look(Role, Item),
    NewLooks = Looks ++ EqmLook,
    do_calc_eqm(Role, T, NewLooks).

item_to_look(#role{m_fashion =
                       #m_fashion{classes_eqm = ClassesEqm, eqm = FEqm}},
             #item{base_id = BaseId, type = Type, look_id = LookId,
                   enchant = Enchant, extra = Extra}) ->
    IsWeapon = lists:member(Type, [1, 4, 2, 3, 5, 21, 22]),
    FashionLook = case lists:keyfind(1,
                                     #fashion_dress.is_wear,
                                     FEqm)
                      of
                      #fashion_dress{base_id = EBaseId} ->
                          case fashion_data:get_dress(EBaseId) of
                              #fashion_dress_data{model_id = ModelId} ->
                                  ModelId;
                              _ -> 0
                          end;
                      _E -> 0
                  end,
    NewBaseId = case lists:keyfind(9, 1, Extra) of
                    _ when ClassesEqm == 1 andalso IsWeapon == true ->
                        BaseId;
                    {_, CompId, _} -> CompId;
                    _ -> BaseId
                end,
    NewLookId = case item:attr(look_id, NewBaseId) of
                    _ when IsWeapon == true andalso FashionLook > 0 ->
                        FashionLook;
                    LookId1 when LookId1 =/= 0 -> LookId1;
                    _ -> LookId
                end,
    case Type of
        1 ->
            Mode = look_data:get_weapon({NewLookId, 1, Enchant}),
            [{1, Mode, NewLookId, ""}];
        2 ->
            Mode = look_data:get_weapon({NewLookId, 2, Enchant}),
            [{1, Mode, NewLookId, ""}];
        3 ->
            Mode = look_data:get_weapon({NewLookId, 3, Enchant}),
            [{1, Mode, NewLookId, ""}];
        4 ->
            Mode = look_data:get_weapon({NewLookId, 4, Enchant}),
            [{1, Mode, NewLookId, ""}];
        5 ->
            Mode = look_data:get_weapon({NewLookId, 5, Enchant}),
            [{1, Mode, NewLookId, ""}];
        21 ->
            Mode = look_data:get_weapon({NewLookId, 6, Enchant}),
            [{1, Mode, NewLookId, ""}];
        22 ->
            Mode = look_data:get_weapon({NewLookId, 7, Enchant}),
            [{1, Mode, NewLookId, ""}];
        _ -> []
    end.

comp([], []) -> true;
comp([], _) -> false;
comp([{Type, Mode, Val, Str} | T], Looks) ->
    case do_find_look({Type, Mode, Val, Str}, Looks) of
        false -> false;
        NewLooks -> comp(T, NewLooks)
    end.

do_find_look({Type, Mode, Val, Str}, Looks) ->
    do_find_look({Type, Mode, Val, Str}, Looks, []).

do_find_look(_, [], _) -> false;
do_find_look({Type, Mode, Val, Str},
             [{Type, Mode, Val, Str} | T], Head) ->
    Head ++ T;
do_find_look({Type, Mode, Val, Str}, [L | T], Head) ->
    do_find_look({Type, Mode, Val, Str}, T, [L | Head]).

