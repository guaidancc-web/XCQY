-file("src/mod/campaign/campaign_group_purchase.erl",
      1).

-module(campaign_group_purchase).

-behaviour(gen_server).

-export([buy/3,
         list/1,
         clear_role_all/0,
         clear_role/2,
         delay_login/1]).

-export([info/1, cast/1, call/1, start_link/0]).

-export([init/1,
         handle_call/3,
         handle_cast/2,
         handle_info/2,
         terminate/2,
         code_change/3]).

-record(state, {}).

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

-file("src/mod/campaign/campaign_group_purchase.erl",
      24).

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

-file("src/mod/campaign/campaign_group_purchase.erl",
      25).

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

-file("src/mod/campaign/campaign_group_purchase.erl",
      26).

-file("inc/campaign_group_purchase.hrl", 1).

-record(campaign_group_purchase_base,
        {id = 0,
         base_id = 0,
         num = 0,
         limit_num = 0,
         price = 0,
         price_type = 90003,
         discount_list = [],
         start_time = 0,
         end_time = 0,
         check_list = [],
         lev_min = 0,
         lev_max = 0,
         base_role_num = 0,
         sex = 2}).

-record(campaign_group_purchase_item,
        {id = 0,
         ver = 2,
         base_id = 0,
         num = 0,
         limit_num = 0,
         price = 0,
         price_type = 90003,
         discount = 1000,
         discount_list = [],
         start_time = 0,
         end_time = 0,
         buy_num = 0,
         system_buy_num = 0,
         buy_roles = [],
         is_end = 0,
         lev_min = 0,
         lev_max = 0,
         sex = 2,
         list1 = [],
         list2 = []}).

-record(campaign_group_purchase_role,
        {id = {0, "", 0}, ver = 0, buy_list = []}).

-file("src/mod/campaign/campaign_group_purchase.erl",
      27).

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

-file("src/mod/campaign/campaign_group_purchase.erl",
      28).

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

-file("src/mod/campaign/campaign_group_purchase.erl",
      29).

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

-file("src/mod/campaign/campaign_group_purchase.erl",
      30).

-file("inc/mail.hrl", 1).

-record(mail,
        {sess ::
             undefined |
             {pos_integer(), bitstring(), non_neg_integer()},
         to ::
             undefined |
             {pos_integer(), bitstring(), non_neg_integer()},
         from ::
             undefined |
             {non_neg_integer(), bitstring(), non_neg_integer()},
         from_face = 0 :: non_neg_integer(),
         from_name = "" :: bitstring(),
         to_face = 0 :: non_neg_integer(),
         to_name = "" :: bitstring(),
         type = 0 :: 0..1,
         status = 0 :: 0..1,
         del_type = 0 :: 0..1,
         title = "" :: bitstring(),
         content = "" :: bitstring(),
         item_list = [] :: [tuple()],
         source = 0 :: pos_integer(),
         rev_ts = 0 :: pos_integer(),
         ts = 0 :: pos_integer(),
         read_ts = 0 :: non_neg_integer()}).

-file("src/mod/campaign/campaign_group_purchase.erl",
      31).

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

-file("src/mod/campaign/campaign_group_purchase.erl",
      32).

info(Info) -> campaign_group_purchase ! Info.

cast(Info) ->
    gen_server:cast(campaign_group_purchase, Info).

call(Info) ->
    case catch gen_server:call(campaign_group_purchase,
                               Info,
                               10000)
        of
        {'EXIT', {timeout, _}} -> {error, timeout};
        {'EXIT', {noproc, _}} -> {error, noproc};
        {'EXIT', {normal, _}} -> {error, exit};
        {'EXIT', _Call_Err} -> {error, _Call_Err};
        _Call_Return -> _Call_Return
    end.

delay_login(Role) -> repair_login_info(Role).

buy(Role = #role{id = RoleId, sex = RoleSex}, Id,
    Num) ->
    case check_buy(Role, Id, Num) of
        {ok, NewRole, PriceType, BasePrice} ->
            case call({buy, RoleId, RoleSex, Id, Num, BasePrice}) of
                {true, Discount, AllBuyNum, SelfBuyNum} ->
                    NewRole1 = case PriceType of
                                   90002 ->
                                       DayGroup = var:get_var(NewRole,
                                                              day,
                                                              85,
                                                              0),
                                       case DayGroup =:= 0 of
                                           true -> send_day_reward(NewRole);
                                           _ -> NewRole
                                       end;
                                   _ -> NewRole
                               end,
                    NewDayGroup = var:get_var(NewRole1, day, 85, 0),
                    {ok,
                     NewRole1,
                     Discount,
                     AllBuyNum,
                     SelfBuyNum,
                     NewDayGroup};
                {false, Reason} -> {false, Reason};
                _Err ->
                    logger:error("[~w]同步购买团购时发生错误:~w",
                                 [RoleId, _Err],
                                 campaign_group_purchase,
                                 75),
                    {false, lang:get("系统繁忙，无法购买")}
            end;
        {false, Reason} -> {false, Reason}
    end.

send_day_reward(Role = #role{sex = Sex}) ->
    Now = date:unixtime(),
    Result = case campaign_group_purchase_data:get_day(Now,
                                                       2)
                 of
                 {BaseId0, Num0} when BaseId0 > 0 -> {BaseId0, Num0};
                 _ ->
                     case campaign_group_purchase_data:get_day(Now, Sex) of
                         {BaseId0, Num0} when BaseId0 > 0 -> {BaseId0, Num0};
                         _ -> false
                     end
             end,
    case Result of
        {BaseId, Num} ->
            {Title1, Content1} = case
                                     campaign_group_purchase_data:get_mail(1)
                                     of
                                     #{title := Title, content := Content} ->
                                         {Title,
                                          notice:format(Content,
                                                        [{item_2, BaseId}])};
                                     _ ->
                                         Title = lang:get("新春狂欢季"),
                                         Content =
                                             notice:format(lang:get("~ts！活动期间~ts团购礼包即可获得~ts，收藏完整后可获得额外2点角色属性点哦"),
                                                           [{string_2,
                                                             1,
                                                             lang:get("新春狂欢季，嗨购可返还")},
                                                            {string_2,
                                                             5,
                                                             lang:get("每日首次购买任一钻石")},
                                                            {item_2, BaseId}]),
                                         {Title, Content}
                                 end,
            Items = [{BaseId, 0, Num}],
            mail:send(Role,
                      #{title => Title1, content => Content1,
                        items => Items}),
            NewRole = var:set_var(Role, day, 85, 1),
            NewRole;
        _ -> Role
    end.

list(Role = #role{id = RoleId, lev = Lev,
                  sex = RoleSex}) ->
    Now = date:unixtime(),
    Match = #campaign_group_purchase_item{id = '$1',
                                          base_id = '$2', num = '$3',
                                          price = '$4', price_type = '$5',
                                          discount = '$6', start_time = '$7',
                                          end_time = '$8', buy_num = '$9',
                                          limit_num = '$10',
                                          discount_list = '$11',
                                          lev_min = '$12', lev_max = '$13',
                                          sex = '$14', list1 = '$15',
                                          list2 = '$16', _ = '_'},
    F = fun ([Id,
              BaseId,
              Num,
              Price,
              PriceType,
              Discount,
              StartTime,
              EndTime,
              BuyNum,
              LimitNum,
              DiscountList,
              LevMin,
              LevMax,
              Sex,
              List1,
              List2]) ->
                #campaign_group_purchase_item{id = Id, base_id = BaseId,
                                              num = Num, price = Price,
                                              price_type = PriceType,
                                              discount = Discount,
                                              start_time = StartTime,
                                              end_time = EndTime,
                                              buy_num = BuyNum,
                                              limit_num = LimitNum,
                                              discount_list = DiscountList,
                                              lev_min = LevMin,
                                              lev_max = LevMax, sex = Sex,
                                              list1 = List1, list2 = List2}
        end,
    ItemList = case catch
                        ets:select(campaign_group_purchase_item,
                                   [{Match,
                                     [{'orelse',
                                       {'=:=', '$14', 2},
                                       {'=:=', '$14', RoleSex}}],
                                     ['$$']}])
                   of
                   L when is_list(L) -> [F(C) || C <- L];
                   _ -> []
               end,
    ItemList2 = [I
                 || I = #campaign_group_purchase_item{lev_min = Lmin,
                                                      lev_max = Lmax,
                                                      start_time = Stime,
                                                      end_time = Etime}
                        <- ItemList,
                    Lev >= Lmin andalso
                        Lev =< Lmax andalso Now >= Stime andalso Now =< Etime],
    BuyList1 = case lookup_role(RoleId) of
                   {ok,
                    #campaign_group_purchase_role{buy_list = BuyList}} ->
                       BuyList;
                   _ -> []
               end,
    {RewardBaseId, RewardNum} = case
                                    campaign_group_purchase_data:get_day(Now, 2)
                                    of
                                    {Bid, Num} when Bid > 0 -> {Bid, Num};
                                    _ ->
                                        case
                                            campaign_group_purchase_data:get_day(Now,
                                                                                 RoleSex)
                                            of
                                            {Bid, Num} when Bid > 0 ->
                                                {Bid, Num};
                                            _ -> {0, 0}
                                        end
                                end,
    DayGroup = var:get_var(Role, day, 85, 0),
    {ItemList2,
     BuyList1,
     RewardBaseId,
     RewardNum,
     DayGroup}.

lookup_item(Id) ->
    case catch ets:lookup(campaign_group_purchase_item, Id)
        of
        [CampItem = #campaign_group_purchase_item{}] ->
            {ok, CampItem};
        _ -> false
    end.

insert_item([]) -> ok;
insert_item([H | T]) ->
    insert_item(H),
    insert_item(T);
insert_item(CampItem =
                #campaign_group_purchase_item{}) ->
    ets:insert(campaign_group_purchase_item, CampItem),
    dets:insert(campaign_group_purchase_item, CampItem),
    ok;
insert_item(_) -> ok.

lookup_role(RoleId) ->
    case catch ets:lookup(campaign_group_purchase_role,
                          RoleId)
        of
        [CampRole = #campaign_group_purchase_role{ver =
                                                      OldVer}] ->
            Ver = campaign_group_purchase_data:get_ver(),
            case Ver =:= OldVer of
                true -> {ok, CampRole};
                _ -> false
            end;
        _ -> false
    end.

update_role_item(RoleId, Id, BuyNum) ->
    Ver = campaign_group_purchase_data:get_ver(),
    OldBuyList = case lookup_role(RoleId) of
                     {ok,
                      #campaign_group_purchase_role{buy_list = BuyList}} ->
                         BuyList;
                     _ -> []
                 end,
    NewBuyList = lists:keystore(Id,
                                1,
                                OldBuyList,
                                {Id, BuyNum}),
    NewCampRole = #campaign_group_purchase_role{id = RoleId,
                                                ver = Ver,
                                                buy_list = NewBuyList},
    ets:insert(campaign_group_purchase_role, NewCampRole),
    dets:insert(campaign_group_purchase_role, NewCampRole),
    ok.

clear_role_all() ->
    List = role_data:get_recover_list(),
    ClearRole = [Id
                 || Id <- List, role_misc:is_local_role(Id) =:= true],
    case ClearRole of
        [_ | _] ->
            Ver = campaign_group_purchase_data:get_ver(),
            [clear_role(RoleId, Ver) || RoleId <- ClearRole];
        _ -> ok
    end.

clear_role(RoleId = {Rid, P, Z}, Ver) ->
    CampRole = #campaign_group_purchase_role{id = RoleId,
                                             ver = Ver, buy_list = []},
    ets:insert(campaign_group_purchase_role, CampRole),
    dets:insert(campaign_group_purchase_role, CampRole),
    logger:info("清空[~w:~ts:~w]的团购数据",
                [Rid, P, Z],
                campaign_group_purchase,
                206),
    ok.

start_link() ->
    gen_server:start_link({local, campaign_group_purchase},
                          campaign_group_purchase,
                          [],
                          []).

init([]) ->
    logger:info("[~w] 正在启动...",
                [campaign_group_purchase],
                campaign_group_purchase,
                218),
    process_flag(trap_exit, true),
    ets:new(campaign_group_purchase_item,
            [set,
             named_table,
             public,
             {keypos, #campaign_group_purchase_item.id}]),
    dets:open_file(campaign_group_purchase_item,
                   [{file, "./dets/campaign_group_purchase_item.dets"},
                    {keypos, #campaign_group_purchase_item.id},
                    {type, set}]),
    case dets:first(campaign_group_purchase_item) of
        '$end_of_table' ->
            logger:info("没有数据需要加载",
                        [],
                        campaign_group_purchase,
                        224),
            [];
        _ ->
            dets:traverse(campaign_group_purchase_item,
                          fun (Item) ->
                                  case campaign_group_purchase_ver:do(Item) of
                                      {ok,
                                       Item1 =
                                           #campaign_group_purchase_item{}} ->
                                          insert_item(Item1),
                                          continue;
                                      _ ->
                                          logger:error("无法转换团购物品版本数据:~w",
                                                       [Item],
                                                       campaign_group_purchase,
                                                       234),
                                          {done, false}
                                  end
                          end)
    end,
    ets:new(campaign_group_purchase_role,
            [set,
             named_table,
             public,
             {keypos, #campaign_group_purchase_role.id}]),
    dets:open_file(campaign_group_purchase_role,
                   [{file, "./dets/campaign_group_purchase_role.dets"},
                    {keypos, #campaign_group_purchase_role.id},
                    {type, set}]),
    dets:to_ets(campaign_group_purchase_role,
                campaign_group_purchase_role),
    erlang:send_after(10 * 1000, self(), init),
    State = #state{},
    logger:info("[~w] 启动完成",
                [campaign_group_purchase],
                campaign_group_purchase,
                245),
    {ok, State}.

handle_call({buy, RoleId, RoleSex, Id, Num, BasePrice},
            _From, State) ->
    Now = date:unixtime(),
    Reply = case lookup_item(Id) of
                {ok, #campaign_group_purchase_item{is_end = 1}} ->
                    {false, lang:get("该礼包已经下架")};
                {ok,
                 #campaign_group_purchase_item{start_time = StartTime}}
                    when Now < StartTime ->
                    {false, lang:get("该礼包还未上架")};
                {ok, #campaign_group_purchase_item{end_time = EndTime}}
                    when Now >= EndTime ->
                    {false, lang:get("该礼包已经下架")};
                {ok, #campaign_group_purchase_item{sex = Sex}}
                    when Sex =/= 2 andalso Sex =/= RoleSex ->
                    {false, lang:get("你的性别不符合要求,不能购买")};
                {ok,
                 CampItem = #campaign_group_purchase_item{base_id =
                                                              BaseId,
                                                          buy_roles = BuyRoles,
                                                          limit_num = LimitNum,
                                                          buy_num = AllBuyNum,
                                                          discount =
                                                              OldDiscount,
                                                          discount_list =
                                                              DiscountList}} ->
                    {OldBuyNum, OldBuyList} = case lists:keyfind(RoleId,
                                                                 1,
                                                                 BuyRoles)
                                                  of
                                                  {_, Bnum, Blist} ->
                                                      {Bnum, Blist};
                                                  _ -> {0, []}
                                              end,
                    NewBuyNum = OldBuyNum + Num,
                    case NewBuyNum > LimitNum of
                        true -> {false, lang:get("无法购买更多次礼包")};
                        false ->
                            OldPriceNum = case lists:keyfind(BasePrice,
                                                             1,
                                                             OldBuyList)
                                              of
                                              {_, Oldn} -> Oldn;
                                              _ -> 0
                                          end,
                            NewBuyList = lists:keystore(BasePrice,
                                                        1,
                                                        OldBuyList,
                                                        {BasePrice,
                                                         OldPriceNum + Num}),
                            RoleData = {RoleId, NewBuyNum, NewBuyList},
                            NewBuyRoles = lists:keystore(RoleId,
                                                         1,
                                                         BuyRoles,
                                                         RoleData),
                            NewAllBuyNum = AllBuyNum + Num,
                            NewDiscount = calc_discount(OldDiscount,
                                                        DiscountList,
                                                        NewAllBuyNum),
                            NewCampItem =
                                CampItem#campaign_group_purchase_item{buy_roles
                                                                          =
                                                                          NewBuyRoles,
                                                                      discount =
                                                                          NewDiscount,
                                                                      buy_num =
                                                                          NewAllBuyNum},
                            update_role_item(RoleId, Id, NewBuyNum),
                            case OldDiscount =/= NewDiscount of
                                true ->
                                    Dc = NewDiscount / 100,
                                    Dname = util:flist(lang:get("~w折"), [Dc]),
                                    Msg = case
                                              campaign_group_purchase_data:get_mail(3)
                                              of
                                              #{content := Content} ->
                                                  notice:format(Content,
                                                                [{item_2,
                                                                  BaseId},
                                                                 {string_2,
                                                                  1,
                                                                  Dname}]);
                                              _ ->
                                                  notice:format(lang:get("好消息！~ts现以~ts优惠待购啦！{face_1,7}，打开圣诞活动即可购买，抢先购买返"
                                                                         "利更多这波必不亏！"),
                                                                [{item_2,
                                                                  BaseId},
                                                                 {string_2,
                                                                  1,
                                                                  Dname}])
                                          end,
                                    notice:cast(all, 5, Msg),
                                    NewCampItem1 = deal_item(NewCampItem),
                                    insert_item(NewCampItem1);
                                _ ->
                                    insert_item(NewCampItem),
                                    skip
                            end,
                            {true, NewDiscount, NewAllBuyNum, NewBuyNum}
                    end;
                _ -> {false, lang:get("没有此礼包购买")}
            end,
    {reply, Reply, State};
handle_call(_Request, _From, State) -> {noreply, State}.

handle_cast(_Msg, State) -> {noreply, State}.

handle_info(clear_role_item, State) ->
    List = role_data:get_recover_list(),
    ClearRoles = [Id
                  || Id <- List, role_misc:is_local_role(Id) =:= true],
    Ids = [10, 11, 12, 13],
    clear_role_item(Ids, ClearRoles),
    {noreply, State};
handle_info(init, State) ->
    OldVer = env:get(campaign_group_purchase_ver),
    load_data(OldVer),
    NewVer = campaign_group_purchase_data:get_ver(),
    env:save(campaign_group_purchase_ver, NewVer),
    get_next_time(),
    erlang:send_after(10 * 1000, self(), discount_check),
    {noreply, State};
handle_info(reload, State) ->
    OldVer = env:get(campaign_group_purchase_ver),
    load_data(OldVer),
    NewVer = campaign_group_purchase_data:get_ver(),
    env:save(campaign_group_purchase_ver, NewVer),
    get_next_time(),
    {noreply, State};
handle_info(clear, State) ->
    ets:delete_all_objects(campaign_group_purchase_item),
    dets:delete_all_objects(campaign_group_purchase_item),
    ets:delete_all_objects(campaign_group_purchase_role),
    dets:delete_all_objects(campaign_group_purchase_role),
    OldVer = env:get(campaign_group_purchase_ver),
    load_data(OldVer),
    NewVer = campaign_group_purchase_data:get_ver(),
    env:save(campaign_group_purchase_ver, NewVer),
    get_next_time(),
    {noreply, State};
handle_info(discount_check, State) ->
    Now = date:unixtime(),
    {H, _, _} = erlang:time(),
    DataList = campaign_group_purchase_data:get_item(),
    Fun = fun (CampItem = #campaign_group_purchase_item{id =
                                                            Id,
                                                        base_id = BaseId,
                                                        discount = OldDiscount,
                                                        buy_num = AllBuyNum,
                                                        system_buy_num =
                                                            SystemBuyNum,
                                                        discount_list =
                                                            DiscountList},
               Rtn) ->
                  case lists:keyfind(Id,
                                     #campaign_group_purchase_base.id,
                                     DataList)
                      of
                      #campaign_group_purchase_base{start_time = StartTime,
                                                    end_time = EndTime,
                                                    check_list = CheckList}
                          when Now >= StartTime andalso Now =< EndTime ->
                          case [{NeedDis, RandNum1, RandNum2}
                                || {H1, H2, NeedDis, RandNum1, RandNum2}
                                       <- CheckList,
                                   H >= H1 andalso H =< H2]
                              of
                              [{GetDis, GetR1, GetR2}]
                                  when OldDiscount > GetDis ->
                                  AddNum = util:rand(GetR1, GetR2),
                                  NewAllBuyNum = AllBuyNum + AddNum,
                                  NewDiscount = calc_discount(OldDiscount,
                                                              DiscountList,
                                                              NewAllBuyNum),
                                  NewCampItem =
                                      CampItem#campaign_group_purchase_item{buy_num
                                                                                =
                                                                                NewAllBuyNum,
                                                                            system_buy_num
                                                                                =
                                                                                SystemBuyNum
                                                                                    +
                                                                                    AddNum,
                                                                            discount
                                                                                =
                                                                                NewDiscount},
                                  logger:info("团购自动补充[~w],当前折扣[~w],本次补充[~w]人,最新折扣[~w]",
                                              [BaseId,
                                               OldDiscount,
                                               AddNum,
                                               NewDiscount],
                                              campaign_group_purchase,
                                              362),
                                  case OldDiscount =/= NewDiscount of
                                      true ->
                                          Dc = NewDiscount / 100,
                                          Dname = util:flist(lang:get("~w折"),
                                                             [Dc]),
                                          Msg = case
                                                    campaign_group_purchase_data:get_mail(3)
                                                    of
                                                    #{content := Content} ->
                                                        notice:format(Content,
                                                                      [{item_2,
                                                                        BaseId},
                                                                       {string_2,
                                                                        1,
                                                                        Dname}]);
                                                    _ ->
                                                        notice:format(lang:get("好消息！~ts现以~ts优惠待购啦！{face_1,7}，打开圣诞活动即可购买，抢先购买返"
                                                                               "利更多这波必不亏！"),
                                                                      [{item_2,
                                                                        BaseId},
                                                                       {string_2,
                                                                        1,
                                                                        Dname}])
                                                end,
                                          notice:cast(all, 5, Msg),
                                          NewCampItem1 = deal_item(NewCampItem),
                                          [NewCampItem1 | Rtn];
                                      _ -> [NewCampItem | Rtn]
                                  end;
                              _ -> Rtn
                          end;
                      _ -> Rtn
                  end
          end,
    UpdateData = ets:foldl(Fun,
                           [],
                           campaign_group_purchase_item),
    insert_item(UpdateData),
    erlang:send_after(10 * 1000, self(), discount_check),
    {noreply, State};
handle_info(check_timer, State) ->
    OldRef = get(campaign_group_purchase_ref),
    case is_reference(OldRef) of
        true -> catch erlang:cancel_timer(OldRef);
        false -> skip
    end,
    ItemList = ets:tab2list(campaign_group_purchase_item),
    Now = date:unixtime(),
    lists:foreach(fun (Item =
                           #campaign_group_purchase_item{id = Id,
                                                         end_time = EndTime,
                                                         is_end = 0})
                          when Now >= EndTime ->
                          deal_item(Item),
                          ets:delete(campaign_group_purchase_item, Id),
                          dets:delete(campaign_group_purchase_item, Id),
                          ok;
                      (_) -> ok
                  end,
                  ItemList),
    get_next_time(),
    {noreply, State};
handle_info(gm_check, State) ->
    ItemList = ets:tab2list(campaign_group_purchase_item),
    lists:foreach(fun (Item =
                           #campaign_group_purchase_item{is_end = 0}) ->
                          deal_item(Item),
                          ok;
                      (_) -> ok
                  end,
                  ItemList),
    {noreply, State};
handle_info(_Info, State) -> {noreply, State}.

terminate(_Reason, _State) ->
    logger:info("开始关闭", [], campaign_group_purchase, 427),
    logger:info("关闭完成", [], campaign_group_purchase, 428),
    ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

load_data(OldVer) ->
    Ver = campaign_group_purchase_data:get_ver(),
    OldItemList =
        ets:tab2list(campaign_group_purchase_item),
    NewItemList = campaign_group_purchase_data:get_item(),
    case Ver =:= OldVer of
        true ->
            logger:info("版本[~w和~w]一致,加载团购数据",
                        [OldVer, Ver],
                        campaign_group_purchase,
                        443),
            do_load_data(NewItemList, OldItemList);
        false ->
            logger:info("版本[~w和~w]不一致,加载团购数据",
                        [OldVer, Ver],
                        campaign_group_purchase,
                        447),
            ets:delete_all_objects(campaign_group_purchase_item),
            dets:delete_all_objects(campaign_group_purchase_item),
            ets:delete_all_objects(campaign_group_purchase_role),
            dets:delete_all_objects(campaign_group_purchase_role),
            do_load_data(NewItemList, [])
    end.

do_load_data(ItemList, OldList) ->
    Now = date:unixtime(),
    do_load_data(ItemList, Now, OldList).

do_load_data([], _Now, OldList) ->
    lists:foreach(fun (#campaign_group_purchase_item{id =
                                                         Id}) ->
                          ets:delete(campaign_group_purchase_item, Id),
                          dets:delete(campaign_group_purchase_item, Id)
                  end,
                  OldList),
    ok;
do_load_data([#campaign_group_purchase_base{id = Id,
                                            base_id = BaseId, num = Num,
                                            limit_num = LimitNum, price = Price,
                                            price_type = PriceType,
                                            discount_list = DiscountList,
                                            start_time = StartTime,
                                            end_time = EndTime,
                                            lev_min = LevMin, lev_max = LevMax,
                                            base_role_num = BaseRoleNum,
                                            sex = Sex}
              | T],
             Now, OldList)
    when Now < EndTime ->
    case lists:keyfind(Id,
                       #campaign_group_purchase_item.id,
                       OldList)
        of
        #campaign_group_purchase_item{is_end = IsEnd,
                                      discount = OldDiscount,
                                      buy_num = AllBuyNum, buy_roles = BuyRoles,
                                      system_buy_num = SystemBuyNum} ->
            NewDiscount = calc_discount(OldDiscount,
                                        DiscountList,
                                        AllBuyNum),
            {List1, List2} = case
                                 campaign_group_purchase_data:get_show_item(BaseId)
                                 of
                                 #{list1 := L1, list2 := L2} -> {L1, L2};
                                 #{list1 := L3} -> {L3, []};
                                 #{list2 := L4} -> {[], L4};
                                 _ -> {[], []}
                             end,
            CampItem = #campaign_group_purchase_item{id = Id,
                                                     base_id = BaseId,
                                                     num = Num,
                                                     limit_num = LimitNum,
                                                     price = Price,
                                                     price_type = PriceType,
                                                     discount_list =
                                                         DiscountList,
                                                     start_time = StartTime,
                                                     end_time = EndTime,
                                                     buy_roles = BuyRoles,
                                                     buy_num = AllBuyNum,
                                                     discount = NewDiscount,
                                                     is_end = IsEnd,
                                                     lev_min = LevMin,
                                                     lev_max = LevMax,
                                                     system_buy_num =
                                                         SystemBuyNum,
                                                     sex = Sex, list1 = List1,
                                                     list2 = List2},
            insert_item(CampItem),
            do_load_data(T,
                         Now,
                         lists:keydelete(Id,
                                         #campaign_group_purchase_item.id,
                                         OldList));
        _ ->
            NewDiscount = calc_discount(1000,
                                        DiscountList,
                                        BaseRoleNum),
            {List1, List2} = case
                                 campaign_group_purchase_data:get_show_item(BaseId)
                                 of
                                 #{list1 := L1, list2 := L2} -> {L1, L2};
                                 #{list1 := L3} -> {L3, []};
                                 #{list2 := L4} -> {[], L4};
                                 _ -> {[], []}
                             end,
            CampItem = #campaign_group_purchase_item{id = Id,
                                                     base_id = BaseId,
                                                     num = Num,
                                                     limit_num = LimitNum,
                                                     price = Price,
                                                     price_type = PriceType,
                                                     discount_list =
                                                         DiscountList,
                                                     start_time = StartTime,
                                                     end_time = EndTime,
                                                     lev_min = LevMin,
                                                     lev_max = LevMax,
                                                     discount = NewDiscount,
                                                     buy_num = BaseRoleNum,
                                                     system_buy_num =
                                                         BaseRoleNum,
                                                     sex = Sex, list1 = List1,
                                                     list2 = List2},
            insert_item(CampItem),
            do_load_data(T, Now, OldList)
    end;
do_load_data([_ | T], Now, OldList) ->
    do_load_data(T, Now, OldList).

deal_item(CampItem =
              #campaign_group_purchase_item{is_end = 1}) ->
    CampItem;
deal_item(CampItem =
              #campaign_group_purchase_item{discount = Discount,
                                            price_type = PriceType,
                                            price = Price, buy_roles = BuyRoles,
                                            base_id = BaseId,
                                            buy_num = BuyNum}) ->
    NowPrice = round(Price * Discount / 1000),
    logger:info("团购道具进行[~w]补偿购买人数[~w]当前折扣[~w]当前价格[~w:~w]",
                [BaseId, BuyNum, Discount, PriceType, NowPrice],
                campaign_group_purchase,
                504),
    Title = case campaign_group_purchase_data:get_mail(2) of
                #{title := Title0} -> Title0;
                _ -> lang:get("新春抢购日")
            end,
    Dc = Discount / 100,
    Dname = util:flist(lang:get("~w折"), [Dc]),
    Fun = fun ({RoleId, RbuyNum, PriceList}, DoBuyRoles) ->
                  send_mail(RoleId,
                            PriceList,
                            {BaseId, PriceType, NowPrice, Title, Dname},
                            0,
                            0),
                  [{RoleId, RbuyNum, [{NowPrice, RbuyNum}]} | DoBuyRoles]
          end,
    NewBuyRoles = lists:foldl(Fun, [], BuyRoles),
    CampItem#campaign_group_purchase_item{buy_roles =
                                              NewBuyRoles}.

send_mail(RoleId, [],
          {BaseId, PriceType, _Price, Title, Dname}, Val,
          BackCoin)
    when Val > 0 ->
    Content = case campaign_group_purchase_data:get_mail(2)
                  of
                  #{content := Content0} ->
                      notice:format(Content0,
                                    [{item_2, BaseId},
                                     {string_2, 1, Dname},
                                     {assets_1, PriceType, round(Val)},
                                     {assets_1, 90000, BackCoin}]);
                  _ ->
                      notice:format(lang:get("亲爱的玩家，您在~ts中所购买的~ts上架后抢购火爆，现已低至~ts！根据您所购买价格现返"
                                             "还您~ts差价及~ts的额外返利，达到下一折扣还将继续获得返还哦！越早购买越划算，赶快叫上"
                                             "小伙伴来抢购吧！祝您节日快乐！{face_1,3}"),
                                    [{string_2, 1, lang:get("新春抢购日")},
                                     {item_2, BaseId},
                                     {string_2, 1, Dname},
                                     {assets_1, PriceType, round(Val)},
                                     {assets_1, 90000, BackCoin}])
              end,
    Items = [{PriceType, round(Val)},
             {90000, round(BackCoin)}],
    mail:send(RoleId,
              #{title => Title, content => Content, items => Items}),
    ok;
send_mail(_, [], _, _, _) -> ok;
send_mail(RoleId, [{Rprice, Num} | T],
          {BaseId, PriceType, Price, Title, Dname}, Val, BackCoin)
    when Rprice > Price ->
    Dis = (Rprice - Price) * Num,
    AddCoin = case PriceType of
                  90002 -> Dis * 600;
                  _ -> Dis * 30
              end,
    send_mail(RoleId,
              T,
              {BaseId, PriceType, Price, Title, Dname},
              Val + Dis,
              BackCoin + AddCoin);
send_mail(RoleId, [_ | T],
          {BaseId, PriceType, Price, Title, Dname}, Val,
          BackCoin) ->
    send_mail(RoleId,
              T,
              {BaseId, PriceType, Price, Title, Dname},
              Val,
              BackCoin).

get_next_time() ->
    EndTimeList = ets:select(campaign_group_purchase_item,
                             [{#campaign_group_purchase_item{end_time = '$1',
                                                             _ = '_'},
                               [],
                               ['$1']}]),
    Now = date:unixtime(),
    do_get_next_time(Now, EndTimeList, 0).

do_get_next_time(_, [], Diff) when Diff =< 0 -> ok;
do_get_next_time(_, [], Diff) ->
    Ref = erlang:send_after((Diff + 1) * 1000,
                            self(),
                            check_timer),
    put(campaign_group_purchase_ref, Ref),
    ok;
do_get_next_time(Now, [End | T], Diff) ->
    case End > Now of
        true ->
            D = End - Now,
            case Diff =:= 0 of
                true -> do_get_next_time(Now, T, D);
                _ -> do_get_next_time(Now, T, min(D, Diff))
            end;
        false -> do_get_next_time(Now, T, Diff)
    end.

calc_discount(Discount, [], _BuyNum) -> Discount;
calc_discount(_Discount, [{GetDisCount, NeedNum} | T],
              BuyNum)
    when BuyNum >= NeedNum ->
    calc_discount(GetDisCount, T, BuyNum);
calc_discount(Discount, [_ | _], _) -> Discount.

check_buy(Role = #role{id = RoleId}, Id, Num) ->
    Now = date:unixtime(),
    case lookup_item(Id) of
        {ok, #campaign_group_purchase_item{is_end = 1}} ->
            {false, lang:get("该礼包已经下架")};
        {ok,
         #campaign_group_purchase_item{start_time = StartTime}}
            when Now < StartTime ->
            {false, lang:get("该礼包还未上架")};
        {ok, #campaign_group_purchase_item{end_time = EndTime}}
            when Now >= EndTime ->
            {false, lang:get("该礼包已经下架")};
        {ok,
         #campaign_group_purchase_item{base_id = BaseId,
                                       num = BaseNum, limit_num = LimitNum,
                                       price = Price, price_type = PriceType,
                                       discount = Discount}} ->
            OldBuyNum = case lookup_role(RoleId) of
                            {ok,
                             #campaign_group_purchase_role{buy_list =
                                                               BuyList}} ->
                                case lists:keyfind(Id, 1, BuyList) of
                                    {_, HasBuyNum} -> HasBuyNum;
                                    _ -> 0
                                end;
                            _ -> 0
                        end,
            case OldBuyNum + Num > LimitNum of
                true -> {false, lang:get("无法购买更多此礼包")};
                false ->
                    Gain = format:val_to_gain([{BaseId, 0, BaseNum * Num}]),
                    BasePrice = round(Price * Discount / 1000),
                    Loss = format:val_to_loss([{PriceType,
                                                BasePrice * Num}]),
                    case role_gain:do_notice(Loss, Role) of
                        {ok, NewRole} ->
                            case role_gain:do_notice(Gain, NewRole) of
                                {ok, NewRole1} ->
                                    {ok, NewRole1, PriceType, BasePrice};
                                {false, _} -> {false, lang:get("背包没有足够的空间")}
                            end;
                        {false, #loss{msg = Reason}} -> {false, Reason}
                    end
            end;
        #campaign_group_purchase_base{} ->
            {false, lang:get("不在活动期间")};
        _ -> {false, lang:get("不存在的道具无法团购")}
    end.

clear_role_item([], _) -> ok;
clear_role_item([Id | T], RoleIdList) ->
    case lookup_item(Id) of
        {ok,
         CampItem = #campaign_group_purchase_item{buy_roles =
                                                      BuyRoles}} ->
            NewBuyRoles = [{RoleId, BuyNum, BuyList}
                           || {RoleId, BuyNum, BuyList} <- BuyRoles,
                              lists:member(RoleId, RoleIdList) =:= false],
            NewCampItem =
                CampItem#campaign_group_purchase_item{buy_roles =
                                                          NewBuyRoles},
            insert_item(NewCampItem),
            clear_role_item(T, RoleIdList);
        _ -> clear_role_item(T, RoleIdList)
    end.

repair_login_info(Role = #role{id = RoleId,
                               assets = #assets{gold = Gold}}) ->
    PrbRoles = desc_gold_list(),
    case var:get_var(Role, other, 2124, 0) of
        0 ->
            VarRole = var:set_var(Role, other, 2124, 1),
            case lists:keyfind(RoleId, 1, PrbRoles) of
                {_, LossGold} ->
                    case check_err_mail(RoleId) of
                        {true, M} ->
                            dets:delete_object(mailbox, M),
                            {ok, VarRole};
                        _ ->
                            Title = "账号异常资源处理",
                            Content =
                                "尊敬的玩家您好，由于您的账号在夏日乐购活动中出现异常，返还了较高的钻石，现已对您的账号进行"
                                "处理，异常的钻石已经扣除，钻石不足将消耗相应金币进行抵扣。维护公平游戏环境是我们一直以来的"
                                "标准，账号数据出现异常请及时联系客服，切勿使用异常资源，夏日乐购额外返还的大量银币，将作为"
                                "本次临时封禁处理的补偿，请知悉！\n（金币若扣至负值后，将持续显示为0，直到获得相应数量的"
                                "金币后恢复正常）",
                            mail:send(Role, Title, Content),
                            case Gold >= LossGold of
                                true ->
                                    logger:info("campaign_group_purchase_loss_gold玩家钻石不足:扣除钻石:~w",
                                                [Gold],
                                                campaign_group_purchase,
                                                650),
                                    Loss = format:val_to_loss([{90002,
                                                                LossGold}]),
                                    case role_gain:do(Loss, VarRole) of
                                        {ok, LossRole} -> {ok, LossRole};
                                        _ ->
                                            logger:error("钻石不足:玩家:~w,应扣除:~w,身上剩余:~w",
                                                         [RoleId,
                                                          LossGold,
                                                          Gold],
                                                         campaign_group_purchase,
                                                         656),
                                            ok
                                    end;
                                _ ->
                                    GoldBind = (LossGold - Gold) * 50,
                                    Loss = format:val_to_loss([{90002, Gold}]),
                                    case role_gain:do(Loss, VarRole) of
                                        {ok, LossGoldRole} ->
                                            logger:info("campaign_group_purchase_loss_gold玩家钻石不足:扣除全部钻"
                                                        "石:~w, 扣除金币:~w",
                                                        [Gold, GoldBind],
                                                        campaign_group_purchase,
                                                        665),
                                            adm:loss_gold_bind(RoleId,
                                                               GoldBind),
                                            {ok, LossGoldRole};
                                        _ ->
                                            logger:error("钻石不足:玩家:~w,应扣除:~w,身上剩余:~w",
                                                         [RoleId,
                                                          LossGold,
                                                          Gold],
                                                         campaign_group_purchase,
                                                         669),
                                            ok
                                    end
                            end
                    end;
                _ -> {ok, VarRole}
            end;
        _ -> ok
    end.

desc_gold_list() ->
    [{{15326, "beta", 32}, 33470},
     {{6908, "beta", 32}, 33470},
     {{75312, "beta", 25}, 33470},
     {{168, "beta", 27}, 33470},
     {{10947, "beta", 20}, 33470},
     {{5112, "beta", 32}, 33470},
     {{15538, "beta", 17}, 33470},
     {{44784, "beta", 17}, 33470},
     {{21247, "beta", 17}, 33470},
     {{7414, "mix", 5}, 33470},
     {{107387, "mix", 16}, 33470},
     {{117379, "mix", 5}, 33470},
     {{13804, "mix", 3}, 33470},
     {{117085, "mix", 4}, 33470},
     {{121673, "mix", 5}, 33470},
     {{118152, "mix", 2}, 33470},
     {{86804, "mix", 5}, 33470},
     {{117382, "mix", 1}, 33470},
     {{7657, "mix", 55}, 33470},
     {{14077, "mix", 59}, 33470},
     {{7413, "mix", 58}, 33470},
     {{2187, "mix", 50}, 33470},
     {{368, "mix", 62}, 33470},
     {{222, "mix", 50}, 33470},
     {{10174, "mix", 54}, 33470},
     {{1707, "mix", 57}, 33470},
     {{303, "unite", 12}, 33470},
     {{15626, "unite", 10}, 33470},
     {{5470, "unite", 16}, 33470},
     {{2242, "unite", 6}, 33470},
     {{11108, "unite", 1}, 33470},
     {{6524, "unite", 12}, 33470},
     {{10926, "unite", 6}, 33470},
     {{30363, "unite", 1}, 33470},
     {{8267, "unite", 16}, 33470},
     {{12565, "unite", 15}, 33470},
     {{283, "mix", 126}, 33470},
     {{26885, "mix", 121}, 33470},
     {{35360, "mix", 121}, 33470},
     {{4647, "mix", 131}, 33470},
     {{1281, "mix", 126}, 33470},
     {{9412, "mix", 129}, 33470},
     {{1887, "mix", 130}, 33470},
     {{10124, "mix", 191}, 33470},
     {{292, "mix", 183}, 33470},
     {{6257, "mix", 191}, 33470},
     {{1532, "mix", 191}, 33470},
     {{7142, "mix", 185}, 33470},
     {{397, "mix", 185}, 33470},
     {{15634, "mix", 187}, 33470},
     {{15633, "mix", 187}, 33470},
     {{274, "mix", 189}, 33470},
     {{383, "unite", 129}, 33470},
     {{89, "unite", 129}, 33470},
     {{2731, "unite", 129}, 33470},
     {{992, "unite", 129}, 33470},
     {{6213, "unite", 130}, 33470},
     {{468, "unite", 130}, 33470},
     {{207, "unite", 130}, 33470},
     {{6938, "mix", 212}, 33470},
     {{1883, "mix", 214}, 33470},
     {{14045, "mix", 214}, 33470},
     {{5435, "mix", 213}, 33470},
     {{634, "mix", 213}, 33470},
     {{242, "mix", 211}, 33470},
     {{363, "mix", 215}, 33470},
     {{706, "mix", 215}, 33470},
     {{261, "mix", 243}, 33470},
     {{3958, "mix", 244}, 33470},
     {{5876, "mix", 244}, 33470},
     {{1861, "mix", 244}, 33470},
     {{44, "mix", 243}, 33470},
     {{5207, "mix", 243}, 33470},
     {{467, "mix", 243}, 33470},
     {{215, "mix", 244}, 33470},
     {{1555, "mix", 243}, 33470},
     {{891, "mix", 148}, 33470},
     {{975, "mix", 172}, 33470},
     {{281, "mix", 159}, 33470},
     {{7398, "mix", 145}, 33470},
     {{811, "mix", 164}, 33470},
     {{19264, "mix", 164}, 33470},
     {{16811, "mix", 165}, 33470},
     {{61, "mix", 169}, 33470},
     {{387, "mix", 161}, 33470},
     {{6481, "mix", 247}, 33470},
     {{6902, "mix", 247}, 33470},
     {{6761, "mix", 248}, 33470},
     {{165, "mix", 248}, 33470},
     {{2841, "mix", 247}, 33470},
     {{136, "mix", 248}, 33470},
     {{268, "mix", 247}, 33470},
     {{32, "mix", 247}, 33470},
     {{247, "mix", 247}, 33470},
     {{107, "mix", 247}, 33470},
     {{187, "mix", 238}, 33380},
     {{1393, "unite", 137}, 33380},
     {{2117, "unite", 137}, 33380},
     {{2804, "unite", 138}, 33380},
     {{441, "unite", 138}, 33380},
     {{4579, "unite", 138}, 33380},
     {{9312, "mix", 228}, 33380},
     {{2530, "mix", 228}, 33380},
     {{126, "mix", 228}, 33380},
     {{4922, "mix", 249}, 33380},
     {{1540, "mix", 250}, 33380},
     {{115, "mix", 250}, 33380},
     {{51, "mix", 250}, 33380},
     {{1092, "mix", 250}, 33380},
     {{859, "mix", 250}, 33380},
     {{972, "unite", 139}, 33380},
     {{119, "unite", 139}, 33380},
     {{2467, "unite", 139}, 33380},
     {{210, "unite", 140}, 33380},
     {{250, "unite", 140}, 33380},
     {{303, "unite", 140}, 33380},
     {{2883, "unite", 140}, 33380},
     {{1560, "unite", 131}, 33380},
     {{2, "unite", 132}, 33380},
     {{3930, "unite", 132}, 33380},
     {{1657, "unite", 131}, 33380},
     {{454, "mix", 240}, 33380},
     {{32, "mix", 240}, 33380},
     {{4042, "unite", 141}, 33380},
     {{477, "unite", 141}, 33380},
     {{516, "unite", 141}, 33380},
     {{149, "unite", 141}, 33380},
     {{93, "mix", 236}, 33380},
     {{563, "mix", 233}, 33380},
     {{8799, "mix", 232}, 33380},
     {{680, "mix", 230}, 33380},
     {{3405, "mix", 230}, 33380},
     {{706, "mix", 232}, 33380},
     {{10095, "mix", 241}, 33380},
     {{5436, "mix", 241}, 33380},
     {{6428, "mix", 242}, 33380},
     {{4047, "mix", 242}, 33380},
     {{41, "mix", 242}, 33380},
     {{3112, "mix", 219}, 33380},
     {{4783, "mix", 220}, 33380},
     {{290, "mix", 217}, 33380},
     {{828, "mix", 218}, 33380},
     {{2087, "unite", 52}, 31060},
     {{863, "unite", 56}, 31060},
     {{10938, "unite", 54}, 31060},
     {{20515, "unite", 60}, 31060},
     {{10974, "unite", 54}, 31060},
     {{129, "unite", 62}, 31060},
     {{15394, "unite", 57}, 31060},
     {{7025, "unite", 49}, 31060},
     {{11175, "unite", 54}, 31060},
     {{36, "unite", 53}, 31060},
     {{1490, "unite", 50}, 31060},
     {{325, "unite", 64}, 31060},
     {{6762, "unite", 60}, 31060},
     {{31, "unite", 63}, 31060},
     {{5852, "unite", 60}, 31060},
     {{1801, "unite", 97}, 31060},
     {{300, "unite", 103}, 31060},
     {{406, "unite", 104}, 31060},
     {{9830, "unite", 99}, 31060},
     {{232, "unite", 100}, 31060},
     {{10111, "unite", 103}, 31060},
     {{217, "unite", 100}, 31060},
     {{10794, "unite", 104}, 31060},
     {{3018, "unite", 97}, 31060},
     {{89, "unite", 103}, 31060},
     {{78, "unite", 98}, 31060},
     {{440, "unite", 104}, 31060},
     {{744, "unite", 98}, 31060},
     {{6419, "unite", 97}, 31060},
     {{4270, "unite", 102}, 31060},
     {{2415, "mix", 202}, 31060},
     {{9491, "mix", 204}, 31060},
     {{6113, "mix", 194}, 31060},
     {{353, "mix", 193}, 31060},
     {{25, "mix", 202}, 31060},
     {{4594, "mix", 197}, 31060},
     {{84, "mix", 198}, 31060},
     {{323, "mix", 204}, 31060},
     {{164, "mix", 203}, 31060},
     {{581, "mix", 206}, 31060},
     {{47, "mix", 199}, 31060},
     {{12758, "mix", 207}, 31060},
     {{6124, "mix", 194}, 31060},
     {{799, "unite", 125}, 31060},
     {{13235, "unite", 125}, 31060},
     {{5038, "unite", 128}, 31060},
     {{11578, "unite", 127}, 31060},
     {{7270, "unite", 127}, 31060},
     {{6286, "unite", 127}, 31060},
     {{1177, "unite", 127}, 31060},
     {{4825, "unite", 128}, 31060},
     {{3236, "unite", 126}, 31060},
     {{45, "unite", 128}, 31060},
     {{186, "unite", 128}, 31060},
     {{129, "unite", 126}, 31060},
     {{90, "unite", 127}, 31060},
     {{817, "unite", 127}, 31060},
     {{51, "unite", 125}, 31060},
     {{1266, "mix", 245}, 31060},
     {{4891, "mix", 245}, 31060},
     {{3868, "mix", 245}, 31060},
     {{122, "mix", 246}, 31060},
     {{289, "mix", 245}, 31060},
     {{32, "mix", 246}, 31060},
     {{5622, "mix", 246}, 31060},
     {{53, "mix", 245}, 31060},
     {{7, "mix", 246}, 31060},
     {{387, "mix", 245}, 31060},
     {{1756, "mix", 245}, 31060},
     {{6614, "mix", 245}, 31060},
     {{8933, "mix", 245}, 31060},
     {{3814, "mix", 245}, 31060},
     {{518, "mix", 246}, 31060},
     {{4146, "unite", 135}, 31060},
     {{522, "unite", 136}, 31060},
     {{135, "unite", 135}, 31060},
     {{7193, "unite", 135}, 31060},
     {{664, "unite", 136}, 31060},
     {{233, "unite", 136}, 31060},
     {{186, "unite", 135}, 31060},
     {{464, "unite", 135}, 31060},
     {{2639, "unite", 136}, 31060},
     {{5, "unite", 136}, 31060},
     {{8972, "unite", 136}, 31060},
     {{2428, "ios", 1}, 33470},
     {{3557, "ios", 1}, 33470},
     {{690, "unite", 121}, 33470}].

check_err_mail([]) -> false;
check_err_mail([M = #mail{item_list = Items} | Rest]) ->
    case [ok
          || #item{base_id = 90002, quantity = Quantity} <- Items,
             Quantity > 20000]
        of
        [] -> check_err_mail(Rest);
        _ -> {true, M}
    end;
check_err_mail(RoleId) ->
    Sp = [{#mail{_ = '_', to = '$1'},
           [{'=:=', '$1', {RoleId}}],
           ['$_']}],
    MailList = dets:select(mailbox, Sp),
    check_err_mail(MailList).

