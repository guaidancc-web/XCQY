-file("src/mod/campaign/campaign_card.erl", 1).

-module(campaign_card).

-export([wash_card/1,
         get_card/2,
         flush/2,
         push_info/1]).

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

-file("src/mod/campaign/campaign_card.erl", 17).

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

-file("src/mod/campaign/campaign_card.erl", 18).

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

-file("src/mod/campaign/campaign_card.erl", 19).

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

-file("src/mod/campaign/campaign_card.erl", 20).

-file("inc/agenda.hrl", 1).

-record(m_agenda,
        {ver = 1 :: non_neg_integer(),
         progress = [],
         activity = 0 :: non_neg_integer(),
         last_joined = 0 :: non_neg_integer(),
         rewarded = [] :: [non_neg_integer()],
         last_rewarded = 0 :: non_neg_integer(),
         recommends = [] :: list(),
         last_recommended = 0 :: non_neg_integer()}).

-record(agenda_prog,
        {ver = 1,
         id = 0 :: non_neg_integer(),
         joined = 0 :: non_neg_integer(),
         last_joined = 0 :: non_neg_integer()}).

-record(agenda_stat,
        {id = 0 :: non_neg_integer(), joined = 0, finised = 0}).

-record(agenda_stat_role,
        {id = {0, "", 0},
         lev = 0,
         date = {0, 0, 0},
         logs = []}).

-record(m_agenda_week,
        {ver = 1,
         id = 0,
         week_activity = 0 :: non_neg_integer(),
         rewards = [],
         last_add_activity_time = 0}).

-file("src/mod/campaign/campaign_card.erl", 21).

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

-file("src/mod/campaign/campaign_card.erl", 22).

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

-file("src/mod/campaign/campaign_card.erl", 23).

flush(Role = #role{m_campaign =
                       Mcamp = #m_campaign{camp_card = CampCard}},
      _) ->
    NewCampCard = CampCard#campaign_card{init = 0,
                                         times = 0, card_list = []},
    NewMcamp = Mcamp#m_campaign{camp_card = NewCampCard},
    NewRole = Role#role{m_campaign = NewMcamp},
    push_info(NewRole),
    {ok, NewRole}.

push_info(Role) ->
    Data = make_info(Role),
    role:link_send(Role, 14047, {Data}),
    ok.

wash_card(Role = #role{}) ->
    case check_wash_card(Role) of
        true ->
            case make_card(Role) of
                {true, NewRole} -> {ok, NewRole};
                {false, Reason} -> {false, Reason}
            end;
        {false, Reason} -> {false, Reason}
    end.

get_card(Role = #role{m_campaign =
                          Mcamp = #m_campaign{camp_card =
                                                  CampCard =
                                                      #campaign_card{card_list =
                                                                         CardList,
                                                                     times =
                                                                         Times}},
                      m_agenda = #m_agenda{activity = Activity}},
         Order) ->
    NewTimes = Times + 1,
    Fun = fun (Ca = #{flag := Flag, min_times := MinTimes,
                      max_times := MaxTimes},
               {L1, L2}) ->
                  case Flag =:= 0 andalso
                           NewTimes >= MinTimes andalso NewTimes =< MaxTimes
                      of
                      true -> {[Ca | L1], L2};
                      _ -> {L1, [Ca | L2]}
                  end
          end,
    {CardList1, CardList2} = lists:foldl(Fun,
                                         {[], []},
                                         CardList),
    CheckFlag = case CardList1 of
                    [] -> {false, lang:get("没有可翻的牌")};
                    _ ->
                        HasOrder = [O || #{flag := O} <- CardList2],
                        case lists:member(Order, HasOrder) of
                            true -> {false, lang:get("当前位置的牌已经翻开")};
                            false -> true
                        end
                end,
    case CheckFlag of
        true ->
            case campaign_card_data:get_times(NewTimes) of
                {NeedActive, NeedLoss, GainVal}
                    when Activity >= NeedActive ->
                    Loss = format:val_to_loss(NeedLoss),
                    case role_gain:do_notice(Loss, Role) of
                        {ok, NewRole} ->
                            case do_get_card(NewRole, CardList1, Order, GainVal)
                                of
                                {true, NewRole1, NewCardList1} ->
                                    NewCardList = NewCardList1 ++ CardList2,
                                    NewCampCard =
                                        CampCard#campaign_card{card_list =
                                                                   NewCardList,
                                                               times =
                                                                   NewTimes},
                                    NewMcamp = Mcamp#m_campaign{camp_card =
                                                                    NewCampCard},
                                    NewRole2 = NewRole1#role{m_campaign =
                                                                 NewMcamp},
                                    {ok, NewRole2};
                                {false, Reason} -> {false, Reason}
                            end;
                        {false, #loss{msg = Msg}} -> {false, Msg}
                    end;
                {NeedActive, _} ->
                    Msg = notice:format(lang:get("活跃度不足~ts，无法翻牌"),
                                        [{string_2, 6, NeedActive}]),
                    {false, Msg};
                _ -> {false, lang:get("没有翻牌次数")}
            end;
        {false, Reason} -> {false, Reason}
    end.

platform_flag(P) ->
    case lists:member(P, ["dev", "local"]) of
        true -> 0;
        _ -> 1
    end.

do_get_card(Role = #role{name = RoleName}, CardList,
            Order, GainVal) ->
    case util:rand_list(CardList, ratio) of
        D = #{base_id := BaseId, bind := Bind, num := Num,
              is_cast := IsCast} ->
            BaseId1 = item_type:special_id(BaseId),
            CardList1 = CardList -- [D],
            NewD = D#{flag => Order, base_id => BaseId1},
            CardList2 = [NewD | CardList1],
            Gain = format:val_to_gain([{BaseId1, Bind, Num}]),
            case role_gain:do_notice(Gain, Role) of
                {ok, NewRole} ->
                    cast(RoleName, BaseId1, Num, IsCast),
                    mail_gain(Role, GainVal),
                    {true, NewRole, CardList2};
                {false, #gain{reason = bag_full}} ->
                    Title = lang:get("活动翻牌"),
                    Content = lang:get("您在翻牌时背包已满，奖励如下:"),
                    Items = [{BaseId1, Bind, Num}],
                    mail:send(Role,
                              #{title => Title, content => Content,
                                items => Items}),
                    cast(RoleName, BaseId, Num, IsCast),
                    mail_gain(Role, GainVal),
                    {true, Role, CardList2};
                _ -> {false, lang:get("数据错误，无法获得")}
            end;
        _ -> {false, lang:get("数据错误，无法获取")}
    end.

cast(RoleName, BaseId, Num, 1) ->
    Msg =
        notice:format(lang:get("~ts豪爽的掏出一张牌，翻开居然是~ts，不禁乐开了花{face_1,10}"),
                      [{role_2, RoleName}, {item_2, BaseId, Num}]),
    notice:cast(all, 4, Msg),
    ok;
cast(_, _, _, _) -> ok.

mail_gain(Role, GainVal) when GainVal > 0 ->
    Title = lang:get("幸运翻牌"),
    Content =
        notice:format(lang:get("~ts您在幸运翻牌中使用~ts翻牌，额外获赠~ts，使用~ts还可在感恩兑换商店中兑换精美"
                               "物品哦{face_1,3}"),
                      [{string_2, 1, lang:get("感恩有你！")},
                       {assets_2, 90002},
                       {assets_1, 90028, GainVal},
                       {assets_2, 90028}]),
    Items = [{90028, GainVal}],
    mail:send(Role,
              #{title => Title, content => Content, items => Items}),
    ok;
mail_gain(_, _) -> ok.

make_info(#role{m_campaign =
                    #m_campaign{camp_card =
                                    #campaign_card{card_list = CardList}}}) ->
    Data = [{Flag, BaseId, Bind, Num}
            || #{flag := Flag, base_id := BaseId, bind := Bind,
                 num := Num}
                   <- CardList],
    Data.

make_card(Role = #role{m_campaign =
                           Mcamp = #m_campaign{camp_card = CampCard}}) ->
    List1 = campaign_card_data:get_card_list(1),
    List2 = campaign_card_data:get_card_list(2),
    List3 = campaign_card_data:get_card_list(3),
    List4 = campaign_card_data:get_card_list(4),
    List11 = check_role_cond(Role, List1),
    List21 = check_role_cond(Role, List2),
    List31 = check_role_cond(Role, List3),
    List41 = check_role_cond(Role, List4),
    D1 = util:rand_list(List11, ratio1),
    D2 = util:rand_list(List21, ratio1),
    D3 = util:rand_list(List31, ratio1),
    D4 = util:rand_list(List41, ratio1),
    case D1 =/= undefined andalso
             D2 =/= undefined andalso
                 D3 =/= undefined andalso D4 =/= undefined
        of
        true ->
            CardList = [#{flag => 0, base_id => BaseId,
                          bind => Bind, num => Num, ratio => Ratio,
                          is_cast => IsCast, min_times => MinTimes,
                          max_times => MaxTimes}
                        || #{base_id := BaseId, bind := Bind, num := Num,
                             ratio2 := Ratio, is_cast := IsCast,
                             min_times := MinTimes, max_times := MaxTimes}
                               <- [D1, D2, D3, D4]],
            NewCampCard = CampCard#campaign_card{card_list =
                                                     CardList,
                                                 times = 0,
                                                 init = date:unixtime()},
            NewMcamp = Mcamp#m_campaign{camp_card = NewCampCard},
            NewRole = Role#role{m_campaign = NewMcamp},
            {true, NewRole};
        _ -> {false, lang:get("无法找到发牌数据")}
    end.

check_wash_card(#role{id = {_, P, _},
                      m_campaign =
                          #m_campaign{camp_card =
                                          #campaign_card{init = InitTime,
                                                         card_list =
                                                             CardList}}}) ->
    Now = date:unixtime(),
    case campaign_card_data:get_info(platform_flag(P)) of
        {StartTime, _} when Now < StartTime ->
            {false, lang:get("活动还未开始")};
        {_, EndTime} when Now > EndTime ->
            {false, lang:get("活动已经结束")};
        {_, _} ->
            InitFlag = case InitTime =:= 0 of
                           true -> CardList =:= [];
                           false ->
                               case date:is_same_five_reset(InitTime, Now) of
                                   true -> false;
                                   false -> true
                               end
                       end,
            case InitFlag of
                true -> true;
                _ -> {false, lang:get("今天已经发牌，无法再次发牌")}
            end
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

