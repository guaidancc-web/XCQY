-file("src/mod/handbook/handbook_store.erl", 1).

-module(handbook_store).

-export([reset_role/1,
         login/1,
         levup/3,
         buy/2,
         push_store/1,
         reset_item/1]).

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

-file("src/mod/handbook/handbook_store.erl", 19).

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

-file("src/mod/handbook/handbook_store.erl", 20).

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

-file("src/mod/handbook/handbook_store.erl", 21).

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

-file("src/mod/handbook/handbook_store.erl", 22).

-file("inc/timer.hrl", 1).

-record(timer,
        {id :: undefined | term(),
         timeout = 1000 :: pos_integer(),
         m :: undefined | atom(),
         f :: undefined | function() | atom(),
         a = [] :: [term()],
         times = 1 :: integer(),
         next_tick = 0 :: non_neg_integer(),
         set_time = 1 :: pos_integer()}).

-record(rtimer,
        {ref :: undefined | reference(),
         key :: undefined | reference(),
         timers = [] :: [#timer{}]}).

-record(s_timer,
        {ref :: undefined | reference(),
         timers = [] :: [#timer{}]}).

-file("src/mod/handbook/handbook_store.erl", 23).

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

-file("src/mod/handbook/handbook_store.erl", 24).

login(#role{lev = Lev}) when Lev < 50 -> ok;
login(Role = #role{m_handbook =
                       MhandBook = #m_handbook{next_time = NextTime}}) ->
    Now = date:unixtime(),
    case Now >= NextTime of
        true ->
            NewItems = reset_item(Role),
            NextDiff = date:next_diff(21, 0, 0),
            NewNextTime = Now + NextDiff,
            NewMhandBook = MhandBook#m_handbook{next_time =
                                                    NewNextTime,
                                                store_items = NewItems},
            NewRole = Role#role{m_handbook = NewMhandBook},
            NewRole1 = role_timer:set(#timer{id =
                                                 reset_handbook_nine,
                                             timeout = NextDiff * 1000,
                                             times = 1, m = handbook_store,
                                             f = reset_role, a = []},
                                      NewRole),
            {ok, NewRole1};
        false ->
            NextDiff = NextTime - Now,
            Role1 = role_timer:set(#timer{id = reset_handbook_nine,
                                          timeout = NextDiff * 1000, times = 1,
                                          m = handbook_store, f = reset_role,
                                          a = []},
                                   Role),
            {ok, Role1}
    end.

levup(Role = #role{m_handbook = MhandBook}, Lev, NewLev)
    when Lev < 50 andalso NewLev >= 50 ->
    Now = date:unixtime(),
    NewItems = reset_item(Role),
    NextDiff = date:next_diff(21, 0, 0),
    NewNextTime = Now + NextDiff,
    NewMhandBook = MhandBook#m_handbook{next_time =
                                            NewNextTime,
                                        store_items = NewItems},
    NewRole = Role#role{m_handbook = NewMhandBook},
    NewRole1 = role_timer:set(#timer{id =
                                         reset_handbook_nine,
                                     timeout = NextDiff * 1000, times = 1,
                                     m = handbook_store, f = reset_role,
                                     a = []},
                              NewRole),
    push_store(NewRole1),
    NewRole1;
levup(Role, _, _) -> Role.

push_store(Role = #role{m_handbook = MhandBook}) ->
    role:link_send(Role, 17106, {MhandBook}),
    ok.

reset_role(Role = #role{m_handbook = MhandBook}) ->
    Now = date:unixtime(),
    NewItems = reset_item(Role),
    NextDiff = date:next_diff(21, 0, 0),
    NewNextTime = Now + NextDiff,
    NewMhandBook = MhandBook#m_handbook{next_time =
                                            NewNextTime,
                                        store_items = NewItems},
    NewRole = Role#role{m_handbook = NewMhandBook},
    NewRole1 = role_timer:set(#timer{id =
                                         reset_handbook_nine,
                                     timeout = NextDiff * 1000, times = 1,
                                     m = handbook_store, f = reset_role,
                                     a = []},
                              NewRole),
    push_store(NewRole1),
    {ok, NewRole1};
reset_role(Role) -> {ok, Role}.

buy(Role = #role{m_handbook =
                     MhandBook = #m_handbook{store_items = Items}},
    Idx) ->
    case lists:keyfind(Idx, #handbook_item.idx, Items) of
        #handbook_item{flag = 1} ->
            {false, lang:get("当前商品已经购买过，无法再次购买")};
        Hitem = #handbook_item{val = Val, id = ItemId,
                               num = Num} ->
            NewItemId = item_type:special_id(ItemId),
            Result = case format:val_to_loss([{90024, Val}]) of
                         Loss = [_ | _] ->
                             case format:val_to_gain([{NewItemId, Num}]) of
                                 Gain = [_ | _] -> {true, Loss, Gain};
                                 _ -> false
                             end;
                         _ -> false
                     end,
            case Result of
                {true, Loss1, Gain1} ->
                    case role_gain:do(Loss1, Role) of
                        {ok, LossRole} ->
                            case role_gain:do(Gain1, LossRole) of
                                {ok, GainRole} ->
                                    NewHitem = Hitem#handbook_item{flag = 1},
                                    NewItems = lists:keystore(Idx,
                                                              #handbook_item.idx,
                                                              Items,
                                                              NewHitem),
                                    NewMhandBook =
                                        MhandBook#m_handbook{store_items =
                                                                 NewItems},
                                    NRole = GainRole#role{m_handbook =
                                                              NewMhandBook},
                                    NewRole = NRole,
                                    push_store(NewRole),
                                    Msg = msg(Val, NewItemId, Num),
                                    {ok, NewRole, Msg};
                                {false, #gain{reason = bag_full}} ->
                                    {false, lang:get("背包已满，请整理后再来购买")};
                                {false, _} ->
                                    logger:error("图鉴商店道具购买失败[~w]",
                                                 [Gain1],
                                                 handbook_store,
                                                 119),
                                    {false, lang:get("无法购买的道具")}
                            end;
                        {false, #loss{}} ->
                            ErrMsg = notice:format(lang:get("你的~ts不足，无法购买"),
                                                   [{assets_2, 90024}]),
                            {false, ErrMsg};
                        _Err ->
                            logger:error("神秘商店购买失败[~w]",
                                         [_Err],
                                         handbook_store,
                                         126),
                            {false, lang:get("资产不足，无法购买")}
                    end;
                _ -> {false, lang:get("当前商品不可购买")}
            end;
        false -> {false, lang:get("不存在的商品，无法购买")}
    end.

msg(Val, ItemId, Num) ->
    notice:format(lang:get("消耗~ts，获得~ts"),
                  [{assets_1, 90024, Val}, {item_2, ItemId, Num}]).

reset_item(Role) ->
    DataList = handbook_data:store_list(),
    NewDataList = check_role_cond(Role, DataList),
    GetNum = util:rand(6, 7),
    case get_item(GetNum, NewDataList, []) of
        GetItem = [_ | _] ->
            [#handbook_item{idx = Idx, id = Id, num = Num,
                            val = Val}
             || #{idx := Idx, id := Id, num := Num, val := Val}
                    <- GetItem];
        _ -> []
    end.

check_role_cond(#role{sex = Sex, lev = Lev,
                      classes = Classes},
                List) ->
    check_role_cond(Sex, Lev, Classes, List, []).

check_role_cond(_Sex, _Lev, _Classes, [], List) -> List;
check_role_cond(Sex, Lev, Classes,
                [H = #{sex := Sex1, lev_low := LevLow,
                       lev_high := LevHigh, classes := Classes1}
                 | T],
                List)
    when (Sex1 =:= Sex orelse Sex1 =:= 2) andalso
             (Classes1 =:= Classes orelse Classes1 =:= 0) andalso
                 (LevLow =:= 0 andalso LevHigh =:= 0 orelse
                      LevLow =:= 0 andalso Lev =< LevHigh orelse
                          Lev >= LevLow andalso LevHigh =:= 0 orelse
                              Lev >= LevLow andalso Lev =< LevHigh) ->
    check_role_cond(Sex, Lev, Classes, T, [H | List]);
check_role_cond(Sex, Lev, Classes, [_ | T], List) ->
    check_role_cond(Sex, Lev, Classes, T, List).

get_item(Num, _DataList, GetItem) when Num =< 0 ->
    GetItem;
get_item(_Num, [], GetItem) -> GetItem;
get_item(Num, DataList, GetItem) ->
    case do_get_item(DataList) of
        {ok, Get, NewDataList} ->
            get_item(Num - 1, NewDataList, [Get | GetItem]);
        false ->
            logger:error("无法获取神秘商店道具[~w]",
                         [DataList],
                         handbook_store,
                         179),
            GetItem
    end.

do_get_item(DataList) ->
    case util:rand_list(DataList, ratio) of
        I = #{id := Id} ->
            NewDataList = [Item
                           || Item = #{id := Id1} <- DataList, Id1 =/= Id],
            {ok, I, NewDataList};
        _ -> false
    end.

