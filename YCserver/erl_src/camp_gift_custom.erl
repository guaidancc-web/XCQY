-file("src/mod/campaign/camp_gift_custom.erl", 1).

-module(camp_gift_custom).

-export([login/1,
         init/0,
         zero_flush/2,
         buy/3,
         push/1,
         check_gift/1,
         reload/0,
         do_login/3]).

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

-file("src/mod/campaign/camp_gift_custom.erl", 20).

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

-file("src/mod/campaign/camp_gift_custom.erl", 21).

-file("inc/lev_break.hrl", 1).

-record(m_lev_break,
        {ver = 0,
         trial = 0 :: non_neg_integer(),
         done = 0 :: non_neg_integer(),
         times = 0 :: non_neg_integer(),
         attr_point = 0 :: non_neg_integer()}).

-file("src/mod/campaign/camp_gift_custom.erl", 22).

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

-file("src/mod/campaign/camp_gift_custom.erl", 23).

-file("inc/campaign.hrl", 1).

-record(campaign_eggs,
        {ver = 0,
         location = 0 :: non_neg_integer(),
         footprints = [],
         last_moved = 0 :: non_neg_integer(),
         rolled = 0 :: non_neg_integer(),
         rewarded = []}).

-record(camp_login,
        {camp_id = 0,
         m_time = 0,
         num = 0,
         days = [],
         buys = []}).

-record(camp_login_data,
        {day = 0, reward = [], buys = [], cost = []}).

-record(camp_login_buy_data,
        {id = 0, reward = [], cost = [], cd = 0}).

-record(campaign_bags,
        {ver = 0,
         collected = [],
         last_filled = 0 :: non_neg_integer(),
         rewarded = 0}).

-record(campaign_card,
        {ver = 0,
         card_ver = 0,
         init = 0,
         times = 0,
         card_list = []}).

-record(campaign_card_open,
        {ver = 0,
         card_ver = 0,
         times = 0,
         init = 0,
         card_list = []}).

-record(camp_wish_flower,
        {ver = 1,
         floor = 1,
         times = 0,
         all_times = 0,
         camp_id = 0}).

-record(camp_new_flop,
        {ver = 1,
         group = 0,
         times = 0,
         rewarded = [],
         camp_id = 0}).

-record(camp_consume_rebate,
        {ver = 1, limit_item = []}).

-record(camp_new_acc_charge,
        {ver = 1, charge_val = 0, get_reward = []}).

-record(camp_charge_seven_gift,
        {ver = 1, id = 0, buy_time = 0, can_reward = []}).

-record(camp_lucky_tree,
        {id = 0,
         times = 0,
         reward_list = [],
         delay_reward = []}).

-record(camp_long_active,
        {ver = 1,
         id = 0,
         lev = 0,
         token_list = [],
         reward_levs = [],
         week_box = 0,
         last_reset_time = 0}).

-record(m_campaign,
        {ver = 27,
         acc = [] :: list(),
         can_reward = [] :: list(),
         rewarded = [] :: list(),
         eggs = #campaign_eggs{},
         bags = #campaign_bags{},
         first_charge_double = [],
         camp_login = #camp_login{},
         hide_seek,
         login_roll,
         recharge = camp_series_recharge:init(),
         camp_card = #campaign_card{},
         wish_times = 0,
         camp_limit = [],
         camp_card_open = #campaign_card_open{},
         recharge_open = camp_series_recharge_open:init(),
         camp_wish_flower = #camp_wish_flower{},
         camp_doll = camp_doll:init(),
         camp_sign,
         camp_exchange,
         camp_animal_chess,
         camp_new_flop = #camp_new_flop{},
         multiplex_assert = 0,
         camp_consume_rebate = camp_consume_rebate:init(),
         camp_black_white_chess =
             camp_black_white_chess_mgr:init(),
         camp_scratch_card = camp_scratch_card:init(),
         camp_new_acc_charge = camp_new_acc_charge:init(),
         camp_charge_seven_gift = camp_charge_seven_gift:init(),
         camp_lucky_tree = camp_lucky_tree:init(),
         camp_long_active = camp_long_active:init(),
         gift_custom = camp_gift_custom:init()}).

-record(campaign_handle,
        {time = 0 :: non_neg_integer(),
         evt = {evt_rpc} :: tuple(),
         call_from = rpc :: evt | rpc,
         add_can_reward = 0 :: non_neg_integer(),
         camp :: undefined | tuple(),
         camp_info :: undefined | tuple(),
         push_list = [] :: [tuple()],
         push_cli = 0 :: 0..1,
         rpc_reward_num = 1 :: non_neg_integer(),
         return_acc = 0}).

-record(camp_collection,
        {camp_end_time = 0,
         reward_list = [],
         extra_data = [],
         random_index,
         red_dot}).

-record(camp_ico,
        {id = 0 :: non_neg_integer(),
         ico_id = 0 :: non_neg_integer(),
         name = "",
         is_show = 0 :: 0..1,
         start_time = 0 :: non_neg_integer() | tuple(),
         end_time = 0 :: non_neg_integer() | tuple(),
         white_list = [] :: list(),
         black_list = [] :: list(),
         min_open_time = 0 :: non_neg_integer() | tuple(),
         max_open_time = 0 :: non_neg_integer() | tuple()}).

-record(camp_cfg,
        {id = 0 :: non_neg_integer(),
         name = "" :: bitstring(),
         group_id = 0 :: non_neg_integer(),
         start_time = 0 :: non_neg_integer() | tuple(),
         end_time = 0 :: non_neg_integer() | tuple(),
         cli_start_time = 0 :: non_neg_integer() | tuple(),
         cli_end_time = 0 :: non_neg_integer() | tuple(),
         type = 0 :: pos_integer(),
         sec_type = 0 :: non_neg_integer(),
         status = 1 :: 0..1,
         reward_type = 2 :: pos_integer(),
         settlement = 2 :: non_neg_integer(),
         reward_title = "" :: bitstring(),
         reward_content = "" :: bitstring(),
         loss_items = [] :: list(),
         auto_buy = 0,
         reward = [] :: list(),
         camp_cond :: undefined | tuple(),
         reward_max = 1 :: non_neg_integer(),
         white_list = [] :: list(),
         black_list = [] :: list(),
         min_open_time = 0 :: non_neg_integer() | tuple(),
         max_open_time = 0 :: non_neg_integer() | tuple(),
         finish_id = 0 :: non_neg_integer(),
         finish_days = 0 :: non_neg_integer(),
         finish_end_days = 0 :: non_neg_integer(),
         cond_reward = [],
         merge_min = 0,
         merge_max = 0,
         is_keep_time = 0}).

-record(camp_cache,
        {id = 0 :: non_neg_integer(),
         sec_type = 0 :: non_neg_integer(),
         is_srv_open = 0 :: 0..1,
         start_time = 0 :: non_neg_integer(),
         end_time = 0 :: non_neg_integer(),
         cli_start_time = 0 :: non_neg_integer(),
         cli_end_time = 0 :: non_neg_integer()}).

-record(camp_unit,
        {id = {0, 0}, base_id = 0, map_id = 0}).

-record(camp_time,
        {id = 0, start_time = 0, end_time = 0}).

-record(camp_item,
        {item = 0,
         start_time = 0,
         end_time = 0,
         open = 0,
         msg = 0}).

-record(camp_assets_data,
        {type = 0, items = [], max = 0, var_type = day}).

-record(camp_gift_custom,
        {ver = 1,
         camp_id = 0,
         gift = [],
         buy = [],
         extra_reward = 0}).

-file("src/mod/campaign/camp_gift_custom.erl", 24).

reload() ->
    role_group:apply(world, {camp_gift_custom, login, []}).

-spec login(#role{}) -> {ok, #role{}} | ok.

login(Role) ->
    case do_login([reset, init],
                  Role,
                  #{now => date:unixtime()})
        of
        {ok, #role{}} = Result -> Result;
        _ -> ok
    end.

init() -> #camp_gift_custom{}.

-spec zero_flush(#role{}, _) -> {ok, #role{}} | ok.

zero_flush(Role, _) ->
    case do_zero_flush([init],
                       Role,
                       #{now => date:unixtime()})
        of
        {ok, #role{}} = Result -> Result;
        _ -> ok
    end.

-spec buy(Role, GiftId, ItemIds) -> {ok, Role} |
                                    {false, Msg} when Role :: #role{},
                                                      GiftId :: integer(),
                                                      ItemIds :: [] |
                                                                 [integer()],
                                                      Msg :: bitstring().

buy(Role, GiftId, ItemIds) ->
    logger:debug("buy gift_id:~w, item_ids:~w",
                 [GiftId, ItemIds],
                 camp_gift_custom,
                 68),
    do_buy([check,
            gift,
            cfg,
            limit,
            item_num,
            item,
            loss,
            gain,
            update,
            extra],
           Role,
           #{gift_id => GiftId, item_ids => ItemIds,
             now => date:unixtime()}).

-spec push(#role{}) -> ok.

push(Role = #role{m_campaign =
                      #m_campaign{gift_custom = GiftCustom}}) ->
    logger:debug("推送信息:~w",
                 [GiftCustom],
                 camp_gift_custom,
                 74),
    role:link_send(Role, 20491, {GiftCustom}).

do_login([], Role, _Args) -> {ok, Role};
do_login([reset | T],
         Role = #role{m_campaign =
                          MCamp = #m_campaign{gift_custom = undefined}},
         Args) ->
    NCampId = get_camp_id(),
    NewGiftCustom = #camp_gift_custom{camp_id = NCampId},
    NewMCamp = MCamp#m_campaign{gift_custom =
                                    NewGiftCustom},
    NewRole = Role#role{m_campaign = NewMCamp},
    do_login(T, NewRole, Args);
do_login([reset | T],
         Role = #role{m_campaign =
                          MCamp = #m_campaign{gift_custom =
                                                  #camp_gift_custom{camp_id =
                                                                        CampId}}},
         Args) ->
    NewRole = case get_camp_id() of
                  NCampId when NCampId =/= CampId andalso NCampId =/= 0 ->
                      NewGiftCustom = #camp_gift_custom{camp_id = NCampId},
                      NewMCamp = MCamp#m_campaign{gift_custom =
                                                      NewGiftCustom},
                      Role#role{m_campaign = NewMCamp};
                  _ -> Role
              end,
    do_login(T, NewRole, Args);
do_login([init | T], Role, Args) ->
    NewRole = case init_gift([check, expire, add],
                             Role,
                             Args)
                  of
                  {ok, #role{} = NRole} -> NRole;
                  _ -> Role
              end,
    do_login(T, NewRole, Args);
do_login([F | _], _Role = #role{id = RoleId}, Args) ->
    logger:error("do_login[~w][~w]:~w",
                 [RoleId, F, Args],
                 camp_gift_custom,
                 109),
    {false, lang:get("未知错误")}.

init_gift([], Role, _) -> {ok, Role};
init_gift([check | T], Role, Args) ->
    case check([is_open], Role, Args) of
        {ok, _} -> init_gift(T, Role, Args);
        Reason -> Reason
    end;
init_gift([expire | T],
          Role = #role{m_campaign =
                           #m_campaign{gift_custom =
                                           #camp_gift_custom{gift = OldGift}}},
          Args) ->
    logger:debug("expire:~w",
                 [OldGift],
                 camp_gift_custom,
                 123),
    case check_gift(Args#{gift_list => OldGift,
                          old_pos => []})
        of
        {OldGift1, OldPos1} ->
            init_gift(T,
                      Role,
                      Args#{old_gift => OldGift1, old_pos => OldPos1});
        _ -> skip
    end;
init_gift([add | T],
          Role = #role{id = RoleId,
                       m_campaign =
                           MCamp = #m_campaign{gift_custom = GiftCustom}},
          Args = #{old_gift := OldGift}) ->
    logger:debug("add[~w]args:~w",
                 [RoleId, Args],
                 camp_gift_custom,
                 132),
    case check_gift(Args#{gift_list =>
                              camp_gift_custom_data:gifts()})
        of
        {Gift = [_ | _], _} ->
            AddGift = Gift -- OldGift,
            NewGift = OldGift ++ AddGift,
            NewGiftCustom = GiftCustom#camp_gift_custom{gift =
                                                            NewGift},
            NewMCamp = MCamp#m_campaign{gift_custom =
                                            NewGiftCustom},
            NewRole = Role#role{m_campaign = NewMCamp},
            init_gift(T, NewRole, Args);
        Err ->
            logger:error("[~w]init_gift args:~w, err:~w",
                         [RoleId, Args, Err],
                         camp_gift_custom,
                         142),
            skip
    end;
init_gift([F | _], _Role = #role{id = RoleId}, Args) ->
    logger:error("init_gift[~w][~w]:~w",
                 [RoleId, F, Args],
                 camp_gift_custom,
                 146),
    {false, lang:get("未知错误")}.

do_zero_flush([], Role, _Args) -> {ok, Role};
do_zero_flush([init | T],
              Role = #role{m_campaign =
                               MCamp = #m_campaign{gift_custom = GiftCustom}},
              Args) ->
    NewGiftCustom = GiftCustom#camp_gift_custom{extra_reward
                                                    = 0},
    NewMCamp = MCamp#m_campaign{gift_custom =
                                    NewGiftCustom},
    ResetRole = Role#role{m_campaign = NewMCamp},
    NewRole = case init_gift([check, expire, add],
                             ResetRole,
                             Args)
                  of
                  {ok, #role{} = NRole} -> NRole;
                  _ -> ResetRole
              end,
    do_zero_flush(T, NewRole, Args);
do_zero_flush([F | _], _Role = #role{id = RoleId},
              Args) ->
    logger:error("do_zero_flush[~w][~w]:~w",
                 [RoleId, F, Args],
                 camp_gift_custom,
                 163),
    {false, lang:get("未知错误")}.

do_buy([], Role, _Args) -> {ok, Role};
do_buy([check | T], Role, Args) ->
    case check([is_open], Role, Args) of
        {ok, _} -> do_buy(T, Role, Args);
        Reason -> Reason
    end;
do_buy([gift | T],
       Role = #role{m_campaign =
                        #m_campaign{gift_custom =
                                        #camp_gift_custom{gift = Gift}}},
       Args = #{gift_id := GiftId}) ->
    case lists:member(GiftId, Gift) of
        true -> do_buy(T, Role, Args);
        _ -> {false, lang:get("你没有这个礼包可供购买哦")}
    end;
do_buy([cfg | T], Role,
       Args = #{gift_id := GiftId, now := Now}) ->
    case camp_gift_custom_data:gift(GiftId) of
        Cfg = #{custom_loss := [_ | _], all_loss := [_ | _],
                start_time := STime, end_time := ETime}
            when STime =< Now andalso Now =< ETime ->
            do_buy(T, Role, Args#{cfg => Cfg});
        #{} -> {false, lang:get("礼包已过期")};
        _ -> {false, lang:get("礼包不存在")}
    end;
do_buy([limit | T],
       Role = #role{m_campaign =
                        #m_campaign{gift_custom =
                                        #camp_gift_custom{buy = Buy}}},
       Args = #{gift_id := GiftId,
                cfg := #{limit_times := LimitTimes}}) ->
    case lists:keyfind(GiftId, 1, Buy) of
        {_GiftId, Times} when Times >= LimitTimes ->
            Msg = case camp_gift_custom_data:get_key_val(1) of
                      #{val_txt1 := ValTxt} -> ValTxt;
                      _ -> lang:get("已达购买上限")
                  end,
            {false, Msg};
        {GiftId, Times} ->
            do_buy(T, Role, Args#{buy_info => {GiftId, Times + 1}});
        _ -> do_buy(T, Role, Args#{buy_info => {GiftId, 1}})
    end;
do_buy([item_num | T], Role,
       Args = #{cfg := #{count := Count},
                item_ids := ItemIds = [_ | _]}) ->
    case length(ItemIds) of
        Count -> do_buy(T, Role, Args);
        _ ->
            {false,
             notice:format(lang:get("定制数量错误，必须要定制~ts个"),
                           [{string_2, 5, Count}])}
    end;
do_buy([item_num | T], Role, Args) ->
    do_buy(T, Role, Args);
do_buy([item | T], Role,
       Args = #{item_ids := ItemIds, gift_id := GiftId}) ->
    {Type, ItemIds1} = case ItemIds of
                           [_ | _] -> {custom, ItemIds};
                           _ -> {all, camp_gift_custom_data:gift_items(GiftId)}
                       end,
    case filter_item(ItemIds1,
                     [],
                     #{role => Role, pos_list => [], type => Type})
        of
        {ok, [_ | _] = Items} ->
            do_buy(T, Role, Args#{items => Items, type => Type});
        Reason -> Reason
    end;
do_buy([loss | T], Role,
       Args = #{cfg :=
                    #{all_loss := AllLoss, custom_loss := CustomLoss},
                type := Type}) ->
    Loss = case Type of
               custom -> CustomLoss;
               _ -> AllLoss
           end,
    LossFormat = format:val_to_loss(Loss),
    logger:debug("loss:~w", [Loss], camp_gift_custom, 232),
    case role_gain:do_notice(LossFormat, Role) of
        {ok, #role{} = NRole} -> do_buy(T, NRole, Args);
        {false, #loss{msg = Msg}} -> {false, Msg};
        Err ->
            logger:error("do_buy loss:~w, err:~w",
                         [Loss, Err],
                         camp_gift_custom,
                         239),
            {false, lang:get("购买失败，请稍后再试")}
    end;
do_buy([gain | T], Role, Args = #{items := Items}) ->
    logger:debug("gain:~w", [Items], camp_gift_custom, 243),
    ItemsFormat = format:val_to_gain(Items),
    case role_gain:do_notice(ItemsFormat, Role) of
        {ok, #role{} = NRole} -> do_buy(T, NRole, Args);
        _ ->
            notice:return(lang:get("背包已满，奖励通过邮件发放")),
            {Title, Content} = case
                                   camp_gift_custom_data:get_key_val(2)
                                   of
                                   #{val_txt1 := ValTxt1,
                                     val_txt2 := ValTxt2} ->
                                       {ValTxt1, ValTxt2};
                                   _ ->
                                       {lang:get("礼包定制"),
                                        lang:get("由于你背包已满，所购礼包道具通过邮件发送，请查收")}
                               end,
            MailInfo = #{title => Title, content => Content,
                         items => Items},
            mail:send(Role, MailInfo),
            do_buy(T, Role, Args)
    end;
do_buy([update | T],
       Role = #role{m_campaign =
                        MCamp = #m_campaign{gift_custom =
                                                GiftCustom =
                                                    #camp_gift_custom{buy =
                                                                          Buy}}},
       Args = #{buy_info := BuyInfo, gift_id := GiftId}) ->
    NewBuy = lists:keystore(GiftId, 1, Buy, BuyInfo),
    NewGiftCustom = GiftCustom#camp_gift_custom{buy =
                                                    NewBuy},
    NewMCamp = MCamp#m_campaign{gift_custom =
                                    NewGiftCustom},
    NewRole = Role#role{m_campaign = NewMCamp},
    push(NewRole),
    do_buy(T, NewRole, Args);
do_buy([extra | T],
       Role = #role{m_campaign =
                        MCamp = #m_campaign{gift_custom =
                                                GiftCustom =
                                                    #camp_gift_custom{extra_reward
                                                                          = 0,
                                                                      buy =
                                                                          Buy}}},
       Args) ->
    NewRole = case check_extra(Buy) of
                  {ok, [_ | _] = Reward} ->
                      {Title, Content} = case
                                             camp_gift_custom_data:get_key_val(3)
                                             of
                                             #{val_txt1 := ValTxt1,
                                               val_txt2 := ValTxt2} ->
                                                 {ValTxt1, ValTxt2};
                                             _ ->
                                                 {lang:get("礼包定制额外奖励"),
                                                  lang:get("这是您在活动中额外获得的奖励，请查收")}
                                         end,
                      MailInfo = #{title => Title, content => Content,
                                   items => Reward},
                      NewGiftCustom = GiftCustom#camp_gift_custom{extra_reward
                                                                      = 1},
                      NewMCamp = MCamp#m_campaign{gift_custom =
                                                      NewGiftCustom},
                      CampaignRole = Role#role{m_campaign = NewMCamp},
                      mail:send(CampaignRole, MailInfo),
                      CampaignRole;
                  _ -> Role
              end,
    do_buy(T, NewRole, Args);
do_buy([extra | T], Role, Args) ->
    do_buy(T, Role, Args);
do_buy([F | _], _Role = #role{id = RoleId}, Args) ->
    logger:error("do_buy[~w][~w]:~w",
                 [RoleId, F, Args],
                 camp_gift_custom,
                 287),
    {false, lang:get("未知错误")}.

filter_item([], Items, _Args) -> {ok, Items};
filter_item([Id | T], Items,
            Args = #{role :=
                         #role{classes = Classes, sex = Sex, lev = Lev,
                               m_lev_break = #m_lev_break{times = Break}},
                     pos_list := PosList, type := Type}) ->
    logger:debug("礼包id:~w", [Id], camp_gift_custom, 294),
    case camp_gift_custom_data:gift_item(Id) of
        #{classes := ClassesTemp, sex := SexTemp,
          lev_min := LevMin, lev_max := LevMax,
          break_min := BreakMin, break_max := BreakMax,
          pos := Pos, item_id := ItemId, item_num := ItemNum}
            when (ClassesTemp =:= 0 orelse ClassesTemp =:= Classes)
                     andalso
                     (SexTemp =:= 2 orelse SexTemp =:= Sex) andalso
                         LevMin =< Lev andalso
                             Lev =< LevMax andalso
                                 BreakMin =< Break andalso Break =< BreakMax ->
            case Type of
                all ->
                    filter_item(T, [{ItemId, 0, ItemNum} | Items], Args);
                _ ->
                    case lists:member(Pos, PosList) of
                        false ->
                            filter_item(T,
                                        [{ItemId, 0, ItemNum} | Items],
                                        Args#{pos_list => [Pos | PosList]});
                        _ -> {false, lang:get("不能购买同一个位置的多个道具")}
                    end
            end;
        _ ->
            case Type of
                all -> filter_item(T, Items, Args);
                _ -> {false, lang:get("不存在的礼包道具")}
            end
    end;
filter_item(_ItemIds, _Items, _Args) ->
    logger:error("礼包定制过滤礼包道具失败 ids:~w, items:~w",
                 [_ItemIds, _Items],
                 camp_gift_custom,
                 323),
    {false, lang:get("礼包道具不存在")}.

check_extra(Buy) ->
    Now = date:unixtime(),
    TodayBuyFun = fun ({Id, _}) ->
                          case camp_gift_custom_data:gift(Id) of
                              #{start_time := StartTime, end_time := EndTime}
                                  when Now >= StartTime andalso
                                           Now =< EndTime ->
                                  true;
                              _ -> false
                          end
                  end,
    TodayBuy = lists:filter(TodayBuyFun, Buy),
    logger:debug("今日购买列表:~w",
                 [TodayBuy],
                 camp_gift_custom,
                 336),
    F = fun (GiftId) -> lists:keymember(GiftId, 1, TodayBuy)
        end,
    List = camp_gift_custom_data:extra_reward(),
    do_check_extra(List, F).

do_check_extra([], _Fun) -> false;
do_check_extra([#{need_gift := NeedGift,
                  reward := Reward}
                | T],
               Fun) ->
    case lists:all(Fun, NeedGift) of
        true -> {ok, Reward};
        _ -> do_check_extra(T, Fun)
    end.

check([], _Role, Args) -> {ok, Args};
check([is_open | T], Role, Args = #{now := Now}) ->
    CampId = get_camp_id(),
    case campaign_mgr:get_camp_info(60064) of
        #camp_cache{start_time = STime, end_time = ETime}
            when STime =< Now andalso ETime > Now ->
            check(T, Role, Args#{camp_id => CampId});
        _ -> {false, lang:get("活动尚未开启")}
    end;
check([F | _], _Role, Args) ->
    logger:error("check[~w]:~w",
                 [F, Args],
                 camp_gift_custom,
                 362),
    {false, lang:get("未知错误")}.

get_camp_id() -> campaign_mgr:get_camp_id(60064).

check_gift(#{gift_list := GiftList, now := Now,
             old_pos := OldPos}) ->
    F = fun (GiftId, Acc = {GiftIdAcc, PosAcc}) ->
                case camp_gift_custom_data:gift(GiftId) of
                    #{start_time := StartTime, end_time := EndTime,
                      pos := Pos}
                        when StartTime =< Now andalso Now =< EndTime ->
                        case lists:member(Pos, PosAcc) of
                            false -> {[GiftId | GiftIdAcc], [Pos | PosAcc]};
                            _ -> Acc
                        end;
                    _ -> Acc
                end
        end,
    lists:foldl(F, {[], OldPos}, GiftList).

