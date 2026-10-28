-file("src/mod/repaire/repaire.erl", 1).

-module(repaire).

-export([repaire_fashion/0,
         repaire_fashion2/0,
         repaire_send_mail/0,
         do_repaire/3,
         delay_login/1,
         do_flag/2,
         make_flag/2,
         make_flag2/2,
         do_flag2/2]).

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

-file("src/mod/repaire/repaire.erl", 26).

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

-file("src/mod/repaire/repaire.erl", 27).

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

-file("src/mod/repaire/repaire.erl", 28).

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

-file("src/mod/repaire/repaire.erl", 29).

-file("inc/notice.hrl", 1).

-record(notice,
        {id = 1 :: pos_integer(),
         type = 0 :: non_neg_integer(),
         pos = 1 :: pos_integer(),
         start_time = 0 :: non_neg_integer(),
         end_time = 0 :: non_neg_integer(),
         msg = "" :: bitstring()}).

-record(notice_board,
        {id = 1,
         type = 1,
         start_time = 0,
         end_time = 0,
         title = "",
         content = "",
         msg = "",
         gain = [],
         condition = []}).

-record(notice_scroll,
        {id = 1,
         type = 1,
         start_time = 0,
         end_time = 0,
         interval_time = 0,
         content = ""}).

-record(notice_board_log, {id = 1, log_list = []}).

-record(campaign_notice,
        {title = [] :: list(),
         content = [] :: list(),
         process = [] :: list(),
         extern_content = [] :: list(),
         rewards = [] :: list()}).

-file("src/mod/repaire/repaire.erl", 30).

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

-file("src/mod/repaire/repaire.erl", 31).

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

-file("src/mod/repaire/repaire.erl", 32).

repaire_send_mail() ->
    VersionL = repaire_data:get_all_version(),
    NowVersion = lists:max(VersionL),
    ServerVersion = env:get(repaire_data_version),
    Flag = case ServerVersion of
               undefined ->
                   env:save(repaire_data_version, NowVersion),
                   true;
               Num ->
                   case Num + 1 =:= NowVersion of
                       true ->
                           env:save(repaire_data_version, NowVersion),
                           true;
                       _ -> false
                   end
           end,
    case Flag of
        false ->
            Msg = util:flist(lang:get("服务端版本为~w"), [ServerVersion]),
            {false, Msg};
        _ ->
            case repaire_data:get_all_role(NowVersion) of
                false ->
                    Msg = util:flist(lang:get("服务端版本为~w"), [ServerVersion]),
                    {false, Msg};
                RoleList ->
                    [begin
                         {{Plant, ZoneId, RoleId},
                          big_world:call(Plant,
                                         ZoneId,
                                         repaire,
                                         do_repaire,
                                         [{RoleId, Plant, ZoneId},
                                          ItemList,
                                          MailId])}
                     end
                     || {Plant, ZoneId, RoleId, ItemList, MailId}
                            <- RoleList]
            end
    end.

repaire_fashion() ->
    RoleList = repaire_data:get_all_role2(),
    Fun = fun ({Plant,
                ZoneId,
                RoleId,
                FriendName,
                ItemId,
                MailId},
               Temp) ->
                  case lists:keyfind({RoleId, Plant, ZoneId}, 1, Temp) of
                      {Rid, L} ->
                          NRL = {Rid, [{FriendName, ItemId, MailId} | L]},
                          lists:keyreplace(Rid, 1, Temp, NRL);
                      _ ->
                          [{{RoleId, Plant, ZoneId},
                            [{FriendName, ItemId, MailId}]}
                           | Temp]
                  end;
              (_, Temp) -> Temp
          end,
    NewList = lists:foldl(Fun, [], RoleList),
    [begin
         big_world:call(Plant,
                        ZoneId,
                        repaire,
                        make_flag,
                        [{RoleId, Plant, ZoneId}, L])
     end
     || {{RoleId, Plant, ZoneId}, L} <- NewList].

repaire_fashion2() ->
    RoleList = repaire_data:get_all_role3(),
    Fun = fun ({Plant,
                ZoneId,
                RoleId,
                FriendName,
                ItemId,
                MailId},
               Temp) ->
                  case lists:keyfind({RoleId, Plant, ZoneId}, 1, Temp) of
                      {Rid, L} ->
                          NRL = {Rid, [{FriendName, ItemId, MailId} | L]},
                          lists:keyreplace(Rid, 1, Temp, NRL);
                      _ ->
                          [{{RoleId, Plant, ZoneId},
                            [{FriendName, ItemId, MailId}]}
                           | Temp]
                  end;
              (_, Temp) -> Temp
          end,
    NewList = lists:foldl(Fun, [], RoleList),
    [begin
         big_world:call(Plant,
                        ZoneId,
                        repaire,
                        make_flag2,
                        [{RoleId, Plant, ZoneId}, L])
     end
     || {{RoleId, Plant, ZoneId}, L} <- NewList].

do_repaire(RoleId, ItemList, MailId) ->
    case role_misc:is_local_role(RoleId) of
        true ->
            {_, Title, Content} = repaire_data:get_mail(MailId),
            mail:send(RoleId, Title, Content, ItemList);
        false -> skip
    end.

delay_login(Role = #role{id = Rid}) ->
    logger:debug("~w", [Rid], repaire, 125),
    RepaireL = var:get_var(Role, other, 2125, []),
    case lists:keyfind(fashion_repaire, 1, RepaireL) of
        {fashion_repaire, 1} -> ok;
        _ ->
            RoleList = repaire_data:get_all_role2(),
            Fun = fun ({Plant,
                        ZoneId,
                        RoleId,
                        FriendName,
                        ItemId,
                        MailId},
                       Temp) ->
                          case lists:keyfind({RoleId, Plant, ZoneId}, 1, Temp)
                              of
                              {Rid, L} ->
                                  NRL = {Rid,
                                         [{FriendName, ItemId, MailId} | L]},
                                  lists:keyreplace(Rid, 1, Temp, NRL);
                              _ ->
                                  [{{RoleId, Plant, ZoneId},
                                    [{FriendName, ItemId, MailId}]}
                                   | Temp]
                          end;
                      (_, Temp) -> Temp
                  end,
            NewList = lists:foldl(Fun, [], RoleList),
            NRole = case lists:keyfind(Rid, 1, NewList) of
                        {Rid, L} ->
                            logger:debug("~w", [Rid], repaire, 144),
                            {ok, _Msg, NewRole} = do_flag(Role, L),
                            NewRole;
                        _ ->
                            logger:debug("~w", [Rid], repaire, 148),
                            var:set_var(Role,
                                        other,
                                        2125,
                                        [{fashion_repaire, 1} | RepaireL])
                    end,
            {ok, NRole}
    end.

make_flag(RoleId, List) ->
    case role_misc:is_local_role(RoleId) of
        true ->
            role:apply(sync, RoleId, {repaire, do_flag, [List]});
        _ -> {error, lang:get("角色平台配错")}
    end.

do_flag(Role = #role{id = Rid}, List) ->
    RepaireL = var:get_var(Role, other, 2125, []),
    {NewRole, Msg} = case lists:keyfind(fashion_repaire,
                                        1,
                                        RepaireL)
                         of
                         {fashion_repaire, 1} ->
                             {Role,
                              util:flist(lang:get("角色id:~w,已经执行过修复"), [Rid])};
                         _ ->
                             Fun = fun ({FriendName, ItemId, MailId},
                                        {ORole, OMsgList}) ->
                                           {_, Title, Content} =
                                               repaire_data:get_mail(MailId),
                                           Content2 = case MailId of
                                                          1 ->
                                                              notice:format(Content,
                                                                            [{item_2,
                                                                              ItemId},
                                                                             {role_2,
                                                                              FriendName},
                                                                             {role_2,
                                                                              FriendName}]);
                                                          2 ->
                                                              notice:format(Content,
                                                                            [{item_2,
                                                                              ItemId}])
                                                      end,
                                           case item_data:get(ItemId) of
                                               #item_base{effect =
                                                              EffectList} ->
                                                   case lists:keyfind(25,
                                                                      1,
                                                                      EffectList)
                                                       of
                                                       {25, DressList} ->
                                                           {ok, MsgL1, Role1} =
                                                               fashion:repaire_fashion(ORole,
                                                                                       {deduction,
                                                                                        DressList}),
                                                           mail:send(Role1,
                                                                     Title,
                                                                     Content2),
                                                           case
                                                               lists:keyfind(28,
                                                                             1,
                                                                             EffectList)
                                                               of
                                                               {28, Num} ->
                                                                   {ok,
                                                                    MsgL2,
                                                                    Role2} =
                                                                       attr:repaire_fashion(Role1,
                                                                                            {deduction,
                                                                                             Num}),
                                                                   {Role2,
                                                                    MsgL1 ++
                                                                        MsgL2 ++
                                                                            OMsgList};
                                                               _ ->
                                                                   {Role1,
                                                                    MsgL1 ++
                                                                        OMsgList}
                                                           end;
                                                       _ ->
                                                           {ORole,
                                                            [ignore | OMsgList]}
                                                   end;
                                               _ -> {ORole, [ignore | OMsgList]}
                                           end;
                                       (_, Temp) -> Temp
                                   end,
                             {Role3, MsgL} = lists:foldl(Fun, {Role, []}, List),
                             {var:set_var(Role3,
                                          other,
                                          2125,
                                          [{fashion_repaire, 1} | RepaireL]),
                              MsgL}
                     end,
    {ok, Msg, NewRole}.

make_flag2(RoleId, List) ->
    case role_misc:is_local_role(RoleId) of
        true ->
            role:apply(sync, RoleId, {repaire, do_flag2, [List]});
        _ -> {error, lang:get("角色平台配错")}
    end.

do_flag2(Role, List) ->
    Fun = fun ({_FriendName, ItemId, _MailId},
               {ORole, OMsgList}) ->
                  case item_data:get(ItemId) of
                      #item_base{effect = EffectList} ->
                          case lists:keyfind(25, 1, EffectList) of
                              {25, DressList} ->
                                  {ok, MsgL1, Role1} =
                                      fashion:repaire_fashion(ORole,
                                                              {deduction,
                                                               DressList}),
                                  {Role1, MsgL1 ++ OMsgList};
                              _ -> {ORole, [ignore | OMsgList]}
                          end;
                      _ -> {ORole, [ignore | OMsgList]}
                  end;
              (_, Temp) -> Temp
          end,
    {NewRole, Msg} = lists:foldl(Fun, {Role, []}, List),
    {ok, Msg, NewRole}.

