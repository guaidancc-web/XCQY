-file("src/mod/item/item.erl", 1).

-module(item).

-export([make/3,
         make/1,
         use_normal/4,
         check_expire/1,
         check_expire/2,
         check_start/1,
         attr/2,
         login/1,
         match/3,
         make_expire/3,
         match_update/2,
         make_cond/4,
         ver_store/2,
         change_id/2,
         change_item/2]).

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

-file("src/mod/item/item.erl", 26).

-file("inc/assets.hrl", 1).

-record(assets,
        {ver = 41 :: pos_integer(),
         exp = 0 :: non_neg_integer(),
         coin = 0 :: non_neg_integer(),
         coin_bind = 0 :: non_neg_integer(),
         gold = 0 :: non_neg_integer(),
         gold_bind = 0 :: non_neg_integer(),
         intelligs = 0 :: non_neg_integer(),
         guild = 0 :: non_neg_integer(),
         energy = 0 :: non_neg_integer(),
         satiety = 300 :: non_neg_integer(),
         stars_score = 0 :: non_neg_integer(),
         reserve_exp = 0 :: non_neg_integer(),
         character = 0 :: non_neg_integer(),
         alchemy = 0 :: non_neg_integer(),
         love = 0 :: non_neg_integer(),
         teacher_score = 0 :: non_neg_integer(),
         tournament = 0 :: non_neg_integer(),
         lottery_luck = 0 :: non_neg_integer(),
         endless_challenge = 0 :: non_neg_integer(),
         handbook_point = 0 :: non_neg_integer(),
         autumn_score = 0 :: non_neg_integer(),
         star_gold = 0 :: non_neg_integer(),
         halloween = 0 :: non_neg_integer(),
         thanksgiving = 0 :: non_neg_integer(),
         new_year = 0 :: non_neg_integer(),
         firecracker = 0 :: non_neg_integer(),
         glue_pudding = 0 :: non_neg_integer(),
         crystal = 0 :: non_neg_integer(),
         ticket = 0 :: non_neg_integer(),
         brother = 0 :: non_neg_integer(),
         egg = 0 :: non_neg_integer(),
         exchange = 0 :: non_neg_integer(),
         turn = 0 :: non_neg_integer(),
         father = 0 :: non_neg_integer(),
         lucky_ticket = 0 :: non_neg_integer(),
         dollar = 0 :: non_neg_integer(),
         naughty = 0 :: non_neg_integer(),
         concentric = 0 :: non_neg_integer(),
         qixiIntegral = 0 :: non_neg_integer(),
         sunshine = 0 :: non_neg_integer(),
         cut_price = 0 :: non_neg_integer(),
         single_dog = 0 :: non_neg_integer(),
         panda_score = 0 :: non_neg_integer(),
         joyful_egg = 0 :: non_neg_integer(),
         godswar = 0 :: non_neg_integer(),
         skl_unique_exp = 0 :: non_neg_integer(),
         happy_score = 0 :: non_neg_integer(),
         slot_machine = 0 :: non_neg_integer(),
         reserve_gold = 0 :: non_neg_integer(),
         zillionaire_sc = 0,
         score_exchange = 0 :: non_neg_integer(),
         new_open_turn = 0 :: non_neg_integer(),
         long_active = 0 :: non_neg_integer(),
         long_score = 0 :: non_neg_integer(),
         camp_pray_sc = 0 :: non_neg_integer()}).

-file("src/mod/item/item.erl", 27).

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

-file("src/mod/item/item.erl", 28).

-file("inc/condition.hrl", 1).

-record(condition,
        {label :: undefined | atom(),
         op = eq ::
             ue | eq | lt | gt | le | ge | range | include,
         val :: undefined | term(),
         msg = "" :: list()}).

-file("src/mod/item/item.erl", 29).

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

-file("src/mod/item/item.erl", 30).

-file("inc/package.hrl", 1).

-record(package,
        {type = 1 :: integer(),
         next_id = 1 :: pos_integer(),
         volume = 0 :: non_neg_integer(),
         free_cell = [] :: list(),
         items = [] :: [tuple()]}).

-file("src/mod/item/item.erl", 31).

-file("inc/blacksmith.hrl", 1).

-record(enchant_fail_reward,
        {val = 0,
         item_list = [],
         title = "",
         msg = "",
         is_break = 0}).

-file("src/mod/item/item.erl", 32).

-file("inc/gain.hrl", 1).

-record(gain,
        {label :: undefined | atom(),
         val :: undefined | term(),
         msg = "" :: list(),
         source = 0 :: non_neg_integer(),
         notice_msg = "" :: list(),
         reason :: undefined | atom(),
         ext = 0 :: term(),
         notice = 0 :: 0..1,
         ext_val = 0}).

-record(loss,
        {label :: undefined | atom(),
         val :: undefined | term(),
         msg = "" :: list(),
         notice_msg = "" :: list(),
         source = 0 :: non_neg_integer(),
         reason :: undefined | atom(),
         ext = 0 :: term(),
         ext_val = 0,
         auto_scene = "" :: list()}).

-record(gain_text_opts,
        {order = loss :: gain | loss,
         gain_tag = "" :: string(),
         loss_tag = "" :: string(),
         split_str = "，" :: string(),
         split_op_str = "，" :: string(),
         merge_type = [] :: list(),
         fly_to_bag = 0 :: non_neg_integer()}).

-file("src/mod/item/item.erl", 33).

-file("inc/var.hrl", 1).

-record(m_var,
        {ver = 1,
         last_reset_time = 0 :: non_neg_integer(),
         last_reset_five_time = 0,
         last_reset_week_five_time = 0,
         day_vars = [] :: [tuple()],
         day_five_vars = [] :: [tuple()],
         week_five_vars = [],
         last_acc_time = 0,
         acc_time = 0,
         acc_vars = [] :: [tuple()],
         other_vars = [] :: [tuple()]}).

-record(role_var,
        {id = {0, "", 0} :: tuple(),
         ver = 1,
         last_reset_time = 0 :: non_neg_integer(),
         day_vars = [] :: [tuple()],
         forever_vars = [] :: [tuple()],
         last_reset_five_time = 0,
         last_reset_week_five_time = 0,
         day_five_vars = [] :: [tuple()],
         week_five_vars = []}).

-file("src/mod/item/item.erl", 34).

-spec login(Role :: #role{}) -> {ok,
                                 NewRole :: #role{}}.

login(Role = #role{p_family_store = undefined}) ->
    PFamilyStore = package:init(family_store),
    login(Role#role{p_family_store = PFamilyStore});
login(Role = #role{p_family_store =
                       PFamilyStore = #package{type = 1}}) ->
    login(Role#role{p_family_store =
                        PFamilyStore#package{type = 4}});
login(Role = #role{id = RoleId,
                   p_eqm = Eqm = #package{items = EqmList}, p_bag = Pbag,
                   p_store = Pstore}) ->
    Now = date:unixtime(),
    NewEqmList = do_login(RoleId, Now, EqmList),
    NewPbag = update_pbag(Pbag),
    NewPstore = update_pstore(Pstore),
    Role1 = Role#role{p_eqm =
                          Eqm#package{items = NewEqmList},
                      p_bag = NewPbag, p_store = NewPstore},
    Role2 = eqm:login(Role1),
    {ok, Role2}.

update_pbag(Pbag = #package{volume = Volume,
                            free_cell = FreeCell})
    when Volume < 75 ->
    NewVolume = 75,
    AddFreeCell = lists:seq(Volume + 1, NewVolume),
    Pbag#package{volume = NewVolume,
                 free_cell = FreeCell ++ AddFreeCell};
update_pbag(Pbag) -> Pbag.

update_pstore(Pstore = #package{volume = Volume,
                                free_cell = FreeCell})
    when Volume < 25 ->
    NewVolume = 25,
    AddFreeCell = lists:seq(Volume + 1, NewVolume),
    Pstore#package{volume = NewVolume,
                   free_cell = FreeCell ++ AddFreeCell};
update_pstore(Pstore) -> Pstore.

ver_store(1, #package{}) -> package:init(store);
ver_store(_, PStore) -> PStore.

-spec make(BaseId :: pos_integer(), Bind :: 1,
           Quantity :: pos_integer()) -> false |
                                         {ok, [Item :: #item{}]}.

make(_BaseId, _Bind, 0) -> false;
make(BaseId, Bind, Quantity) ->
    make(#{base_id => BaseId, bind => Bind,
           quantity => Quantity}).

make([], Items) -> {ok, Items};
make([H | Rest], Items) ->
    NewItems = case make(H) of
                   {ok, AddItems} -> AddItems ++ Items;
                   _ -> Items
               end,
    make(Rest, NewItems).

make({BaseId, Bind, Quantity}) ->
    make(#{base_id => BaseId, bind => Bind,
           quantity => Quantity});
make(Item = #item{}) -> {ok, [Item]};
make(Args = #{base_id := BaseId, bind := Bind,
              quantity := Quantity}) ->
    case item_data:get(BaseId) of
        #item_base{type = 9999} ->
            logger:error("错误的道具发放[BaseId:~w] From:~w",
                         [BaseId, util:get_stacktrace()],
                         item,
                         91),
            false;
        #item_base{look_id = LookId, quality = Quality,
                   attr = Attr, type = Type, use_type = UseType,
                   condition = Condition, overlap = OverLap,
                   expire_type = OldExpireType,
                   expire_time = OldExpireTime, lev = Lev,
                   classes = Classes, sex = Sex} ->
            case lists:member(Type, [147, 148, 149, 150]) of
                false ->
                    {_NewCond, ReLev, ReClasses, ReSex} = make_cond(Lev,
                                                                    Classes,
                                                                    Sex,
                                                                    Condition),
                    {ExpireType, ExpireTime} = make_expire(BaseId,
                                                           OldExpireType,
                                                           OldExpireTime),
                    Enchant = case lists:member(Type,
                                                [1,
                                                 4,
                                                 2,
                                                 3,
                                                 5,
                                                 21,
                                                 22,
                                                 6,
                                                 7,
                                                 9,
                                                 10,
                                                 11,
                                                 12,
                                                 14])
                                  of
                                  true -> 0;
                                  false -> -1
                              end,
                    Step = case Args of
                               #{step := Step0} when is_integer(Step0) -> Step0;
                               _ -> 0
                           end,
                    Item = #item{ver = 0, bind = Bind, base_id = BaseId,
                                 look_id = LookId, quality = Quality,
                                 attr = Attr, quantity = Quantity, type = Type,
                                 enchant = Enchant, use_type = UseType,
                                 lev = ReLev, classes = ReClasses, sex = ReSex,
                                 expire_type = ExpireType,
                                 expire_time = ExpireTime, step = Step},
                    case Quantity =< OverLap of
                        true ->
                            Item1 = item_type:recalc(Item),
                            NewItem = eqm_attr:calc_eqm(Item1),
                            {ok, [NewItem]};
                        false ->
                            make(Item#item{quantity = OverLap},
                                 OverLap,
                                 Quantity,
                                 [])
                    end;
                _ ->
                    logger:error("错误的道具发放[BaseId:~w] From:~w",
                                 [BaseId, util:get_stacktrace()],
                                 item,
                                 120),
                    false
            end;
        _Err -> false
    end;
make(ItemInfo) when is_list(ItemInfo) ->
    make(ItemInfo, []);
make(_Unkown) ->
    logger:error("生成一个物品错误Err:~w", [_Unkown], item, 127),
    false.

-spec use_normal(Role :: #role{}, Item :: #item{},
                 ItemBase :: #item_base{},
                 Num :: pos_integer()) -> {false,
                                           Reason :: bitstring()} |
                                          {ok, NewRole :: #role{}}.

use_normal(Role = #role{lev = Lev},
           #item{base_id = 20185, extra = ExtraList},
           ItemBase = #item_base{effect = Effect}, Num) ->
    case Lev >= 75 of
        true ->
            case lists:keyfind(31, 1, ExtraList) of
                {31, AccVal, ""} when AccVal >= 300 ->
                    NRole = var:set_var(Role, other, 2135, 1),
                    case do_use_normal(Effect, Num, ItemBase, NRole) of
                        {ok, NewRole} ->
                            item_effect:msg(ItemBase, Num, NewRole),
                            {ok, NewRole};
                        {false, Reason} -> {false, Reason}
                    end;
                _ -> {false, lang:get("洗髓消耗星辰精华达300才能使用{face_1,25}")}
            end;
        _ -> {false, lang:get("75级才能使用，努力升级吧{face_1,110}")}
    end;
use_normal(Role, _Item,
           ItemBase = #item_base{effect = Effect}, Num) ->
    case do_use_normal(Effect, Num, ItemBase, Role) of
        {ok, NewRole} ->
            item_effect:msg(ItemBase, Num, NewRole),
            {ok, NewRole};
        {false, Reason} -> {false, Reason}
    end.

-spec check_expire(Item :: #item{}) -> true | false.

check_expire(#item{expire_type = 0}) -> false;
check_expire(#item{expire_type = 4}) -> false;
check_expire(#item{expire_type = 3}) -> false;
check_expire(#item{expire_type = 6}) -> false;
check_expire(#item{expire_type = 5}) -> false;
check_expire(#item{base_id = BaseId,
                   expire_time = 0}) ->
    logger:error("[~w]的过期时间设置错误", [BaseId], item, 169),
    false;
check_expire(#item{expire_time = EndTime}) ->
    Now = date:unixtime(),
    Now >= EndTime.

-spec check_expire(Now :: pos_integer(),
                   Item :: #item{}) -> true | false.

check_expire(_Now, #item{expire_type = 0}) -> false;
check_expire(_Now, #item{expire_type = 4}) -> false;
check_expire(_Now, #item{expire_type = 3}) -> false;
check_expire(_Now, #item{expire_type = 6}) -> false;
check_expire(_Now, #item{expire_type = 5}) -> false;
check_expire(_Now,
             #item{base_id = BaseId, expire_time = 0}) ->
    logger:error("[~w]的过期时间设置错误", [BaseId], item, 183),
    false;
check_expire(Now, #item{expire_time = EndTime}) ->
    Now >= EndTime.

-spec check_start(Item :: #item{}) -> true | false.

check_start(#item{expire_type = 0}) -> true;
check_start(#item{expire_type = 2}) -> true;
check_start(#item{expire_type = 1}) -> true;
check_start(#item{expire_type = 5}) -> true;
check_start(#item{expire_type = 6}) -> true;
check_start(#item{base_id = BaseId, expire_time = 0}) ->
    logger:error("[~w]的开启时间设置错误", [BaseId], item, 196),
    false;
check_start(#item{expire_time = StartTime}) ->
    Now = date:unixtime(),
    Now >= StartTime.

-spec attr(Atom,
           Item :: #item{} | pos_integer()) -> bitstring() |
                                               list() |
                                               non_neg_integer() when Atom ::
                                                                          name |
                                                                          set_id |
                                                                          base_attr |
                                                                          effect.

attr(name, #item{base_id = BaseId}) ->
    case item_data:get(BaseId) of
        #item_base{name = Name} -> Name;
        _ ->
            logger:error("发现错误的道具,[~w]", [BaseId], item, 209),
            lang:get("未知物体")
    end;
attr(name, 90000) -> lang:get("银币");
attr(name, 90002) -> lang:get("钻石");
attr(name, 90003) -> lang:get("金币");
attr(name, 90010) -> lang:get("经验");
attr(name, BaseId) ->
    case item_data:get(BaseId) of
        #item_base{name = Name} -> Name;
        _ ->
            logger:error("发现错误的道具,[~w]", [BaseId], item, 220),
            lang:get("未知物体")
    end;
attr(base_attr, #item{base_id = BaseId}) ->
    case item_data:get(BaseId) of
        #item_base{attr = Attr} -> Attr;
        _ -> []
    end;
attr(base_attr, BaseId) ->
    case item_data:get(BaseId) of
        #item_base{attr = Attr} -> Attr;
        _ -> []
    end;
attr(effect, #item{base_id = BaseId}) ->
    case item_data:get(BaseId) of
        #item_base{effect = Effect} -> Effect;
        _ -> []
    end;
attr(effect, BaseId) ->
    case item_data:get(BaseId) of
        #item_base{effect = Effect} -> Effect;
        _ -> []
    end;
attr(type, BaseId) ->
    case item_data:get(BaseId) of
        #item_base{type = Type} -> Type;
        _ -> 0
    end;
attr(buy_source, BaseId) ->
    case item_data:get(BaseId) of
        #item_base{buy_source = BuySource} -> BuySource;
        _ -> []
    end;
attr(quality, BaseId) ->
    case item_data:get(BaseId) of
        #item_base{quality = Quality} -> Quality;
        _ -> 0
    end;
attr(use_type, BaseId) ->
    case item_data:get(BaseId) of
        #item_base{use_type = UseType} -> UseType;
        _ -> 0
    end;
attr(look_id, BaseId) ->
    case item_data:get(BaseId) of
        #item_base{look_id = LookId} -> LookId;
        _ -> 0
    end;
attr(expire, BaseId) ->
    case item_data:get(BaseId) of
        #item_base{expire_type = ExpireType,
                   expire_time = ExpireTime} ->
            {ExpireType, ExpireTime};
        _ -> {0, 0}
    end.

-spec match(ExtraVal :: pos_integer(), #item{},
            DefaultVal :: non_neg_integer()) -> Val ::
                                                    non_neg_integer().

match(_Err, _, Val) ->
    logger:error("匹配不存在的字段:~w", [_Err], item, 279),
    Val.

-spec match_update({pos_integer(),
                    pos_integer() | bitstring()},
                   #item{}) -> #item{}.

match_update(_Err, Item) ->
    logger:error("匹配更新不存在:~w", [_Err], item, 285),
    Item.

change_id(Role, Id) ->
    case package:fetch(1, Id, Role) of
        {ok, #item{base_id = BaseId, bind = Bind}} ->
            case item_data:get_change_id(BaseId) of
                NewBaseId when is_integer(NewBaseId) ->
                    Loss = [#loss{label = item_id, val = [{Id, 1}]}],
                    Gain = format:val_to_gain([{NewBaseId, Bind, 1}]),
                    case role_gain:do(Loss ++ Gain, Role) of
                        {ok, NewRole} -> {ok, NewRole};
                        {false, #loss{msg = Msg}} -> {false, Msg};
                        {false, #gain{msg = Msg}} -> {false, Msg}
                    end;
                _ -> {false, lang:get("该物品不能转换")}
            end;
        _ -> {false, lang:get("该物品不存在")}
    end.

change_item(Role, Id) ->
    case package:fetch(1,
                       Id,
                       #role{classes = Classes} = Role)
        of
        {ok, #item{base_id = BaseId, bind = Bind}} ->
            case item_data:get_change_group(BaseId) of
                GroupID when is_integer(GroupID) ->
                    case item_data:get_change_item({GroupID, Classes}) of
                        NewBaseId when is_integer(NewBaseId) ->
                            Loss = [#loss{label = item_id, val = [{Id, 1}]}],
                            Gain = format:val_to_gain([{NewBaseId, Bind, 1}]),
                            case role_gain:do(Loss ++ Gain, Role) of
                                {ok, NewRole} -> {ok, NewRole};
                                {false, #loss{msg = Msg}} -> {false, Msg};
                                {false, #gain{msg = Msg}} -> {false, Msg}
                            end;
                        _ -> {false, lang:get("该物品不能转换")}
                    end;
                _ -> {false, lang:get("该物品不能转换")}
            end;
        _ -> {false, lang:get("该物品不存在")}
    end.

do_login(RoleId, Now, Eqm) ->
    do_login(RoleId, Now, Eqm, []).

do_login(_RoleId, _Now, [], Eqm) -> Eqm;
do_login(RoleId, Now, [Item = #item{} | T], Eqm) ->
    case check_expire(Now, Item) of
        true ->
            notice_expire(RoleId, Item),
            do_login(RoleId, Now, T, Eqm);
        false -> do_login(RoleId, Now, T, [Item | Eqm])
    end.

notice_expire({_RoleId, _Platform, _ZoneI}, _Item) ->
    ok.

make_cond(Lev, Classes, Sex, Condition) ->
    {LevCond, NewLev} = case Lev >= 0 of
                            true ->
                                {[#condition{label = lev, op = ge, val = Lev}],
                                 Lev};
                            false -> {[], 0}
                        end,
    {ClassesCond, NewClasses} = case lists:member(Classes,
                                                  [1, 2, 3, 4, 5, 6, 7])
                                    of
                                    true ->
                                        {[#condition{label = classes, op = eq,
                                                     val = Classes}],
                                         Classes};
                                    false ->
                                        {[#condition{label = classes, op = eq,
                                                     val = 0}],
                                         0}
                                end,
    {SexCond, NewSex} = case Sex >= 0 andalso Sex =< 2 of
                            true ->
                                {[#condition{label = sex, op = eq, val = Sex}],
                                 Sex};
                            false -> {[], 2}
                        end,
    {LevCond ++ ClassesCond ++ SexCond ++ Condition,
     NewLev,
     NewClasses,
     NewSex}.

make_expire(_, 0, 0) -> {0, 0};
make_expire(_BaseId, _, 0) ->
    logger:error("[~w]的过期时间设置错误", [_BaseId], item, 379),
    {0, 0};
make_expire(_BaseId, 5, _Minute) -> {5, 0};
make_expire(_BaseId, 6, _Data) -> {6, 0};
make_expire(_BaseId, 1, Minute) ->
    EndTime = date:unixtime() + Minute * 60,
    {1, EndTime};
make_expire(_BaseId, 3, Minute) ->
    StartTime = date:unixtime() + Minute * 60,
    {3, StartTime};
make_expire(_BaseId, 2,
            {{Year, Month, Day}, {Hour, Minute, Seconds}}) ->
    case date:datetime_to_seconds({{Year, Month, Day},
                                   {Hour, Minute, Seconds}})
        of
        false ->
            logger:error("[~w]的过期时间设置错误", [_BaseId], item, 401),
            {0, 0};
        End -> {2, End}
    end;
make_expire(_BaseId, 4,
            {{Year, Month, Day}, {Hour, Minute, Seconds}}) ->
    case date:datetime_to_seconds({{Year, Month, Day},
                                   {Hour, Minute, Seconds}})
        of
        false ->
            logger:error("[~w]的开启时间设置错误", [_BaseId], item, 408),
            {0, 0};
        Start -> {4, Start}
    end;
make_expire(_BaseId, _, _) ->
    logger:error("[~w]的过期时间设置错误", [_BaseId], item, 412).

make(_BaseItem, _OverLap, 0, Items) -> {ok, Items};
make(BaseItem, OverLap, Quantity, Items)
    when Quantity >= OverLap ->
    Item1 = item_type:recalc(BaseItem),
    NewItem = eqm_attr:calc_eqm(Item1),
    make(BaseItem,
         OverLap,
         Quantity - OverLap,
         [NewItem | Items]);
make(BaseItem, OverLap, Quantity, Items)
    when OverLap > Quantity ->
    Item1 = item_type:recalc(BaseItem#item{quantity =
                                               Quantity}),
    make(BaseItem, OverLap, 0, [Item1 | Items]).

do_use_normal(_Effect, 0, _, Role) -> {ok, Role};
do_use_normal(Effect, Num, ItemBase, Role) ->
    case item_effect:do(Effect, ItemBase, Role) of
        {false, Reason} -> {false, Reason};
        {ok, NewRole} ->
            do_use_normal(Effect, Num - 1, ItemBase, NewRole)
    end.

