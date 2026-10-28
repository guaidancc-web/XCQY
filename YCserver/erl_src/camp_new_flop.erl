-file("src/mod/campaign/camp_new_flop.erl", 1).

-module(camp_new_flop).

-export([push_info/1,
         wash_card/1,
         get_card/2,
         get_today_groups/1,
         zero_flush/2,
         clear_role/1,
         reload/0]).

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

-file("src/mod/campaign/camp_new_flop.erl", 23).

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

-file("src/mod/campaign/camp_new_flop.erl", 24).

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

-file("src/mod/campaign/camp_new_flop.erl", 25).

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

-file("src/mod/campaign/camp_new_flop.erl", 26).

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

-file("src/mod/campaign/camp_new_flop.erl", 27).

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

-file("src/mod/campaign/camp_new_flop.erl", 28).

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

-file("src/mod/campaign/camp_new_flop.erl", 29).

reload() ->
    role_group:apply(world,
                     {camp_new_flop, zero_flush, [0]}).

clear_role(Rid = {_, _, _}) ->
    role:apply(async,
               Rid,
               {camp_new_flop, zero_flush, [0]});
clear_role(_Rid) -> ok.

zero_flush(Role = #role{assets = Assets = #assets{},
                        m_campaign =
                            OldMC = #m_campaign{camp_new_flop =
                                                    _OldCF =
                                                        #camp_new_flop{group =
                                                                           _Group,
                                                                       camp_id =
                                                                           CampId}}},
           _) ->
    logger:debug("==", [], camp_new_flop, 38),
    NRole = Role#role{assets = Assets#assets{naughty = 0}},
    role_gain:push_rest(NRole),
    {NewCampId, _St, _Et} = get_camp(),
    NewRole = #role{m_campaign =
                        OldMC1 = #m_campaign{camp_new_flop =
                                                 OldCF1 = #camp_new_flop{group =
                                                                             Group1}}} =
                  case CampId =:= NewCampId of
                      true -> NRole;
                      _ ->
                          NewCampNewFlop = #camp_new_flop{camp_id = NewCampId},
                          NRole#role{m_campaign =
                                         OldMC#m_campaign{camp_new_flop =
                                                              NewCampNewFlop}}
                  end,
    case check_group(Group1) of
        true -> {ok, NewRole};
        _ ->
            NewFlop = OldCF1#camp_new_flop{times = 4},
            NewMC = OldMC1#m_campaign{camp_new_flop = NewFlop},
            NRole2 = NewRole#role{m_campaign = NewMC},
            case wash_card(NRole2) of
                {ok, NRole3} -> {ok, NRole3};
                {false, _} -> {ok, NewRole}
            end
    end.

push_info(Role = #role{m_campaign =
                           #m_campaign{camp_new_flop =
                                           #camp_new_flop{group = Group,
                                                          times = Times}}}) ->
    case get_camp() of
        {0, -1, -1} -> ignort;
        {_Id, ST, ET} ->
            Now = date:unixtime(),
            case Now >= ST andalso Now < ET of
                true ->
                    Data = make_info(Role),
                    Data2 = format_data(Data),
                    Cost = case Group =:= 0 andalso Times =:= 0 of
                               true -> get_cost(1);
                               false -> get_cost(Group)
                           end,
                    case get_today_groups(Group) of
                        {Min, Max} ->
                            logger:debug("~w",
                                         [{Data2, Times, Cost}],
                                         camp_new_flop,
                                         79),
                            role:link_send(Role,
                                           17875,
                                           {Data2,
                                            Times,
                                            Max - Min,
                                            Cost,
                                            ST,
                                            ET});
                        _ ->
                            logger:debug("~w",
                                         [{Data2, Times, Cost}],
                                         camp_new_flop,
                                         82),
                            role:link_send(Role,
                                           17875,
                                           {Data2, Times, 0, Cost, ST, ET})
                    end;
                _ -> ignort
            end;
        _ -> ignort
    end.

wash_card(Role = #role{m_campaign =
                           OldMC = #m_campaign{camp_new_flop =
                                                   OldCF = #camp_new_flop{group
                                                                              =
                                                                              Group,
                                                                          times
                                                                              =
                                                                              Times}}}) ->
    logger:debug("~w", [{Times, Group}], camp_new_flop, 94),
    case Times =:= 4 orelse Times =:= 0 andalso Group =:= 0
        of
        true ->
            case get_today_groups(Group + 1) of
                {Min, Max} ->
                    NewFlop = OldCF#camp_new_flop{group = Min, times = 0,
                                                  rewarded = []},
                    NewMC = OldMC#m_campaign{camp_new_flop = NewFlop},
                    NRole = Role#role{m_campaign = NewMC},
                    case make_info(NRole) of
                        Data when length(Data) =:= 4 ->
                            Cost = get_cost(Min),
                            Data2 = format_data(Data),
                            {_Id, ST, ET} = get_camp(),
                            role:link_send(Role,
                                           17875,
                                           {Data2, 0, Max - Min, Cost, ST, ET}),
                            logger:debug("~w",
                                         [{Data2, Times, Cost}],
                                         camp_new_flop,
                                         108),
                            {ok, NRole};
                        Data when length(Data) =:= 0 andalso Group =:= 0 ->
                            logger:debug("未达到活动等级", [], camp_new_flop, 111),
                            {false, lang:get("未达到活动等级，发牌失败")};
                        Data when length(Data) =:= 0 ->
                            {false, lang:get("全部奖励已获得")};
                        _ -> {false, lang:get("发牌失败")}
                    end;
                false ->
                    logger:debug("所有奖励已领取", [], camp_new_flop, 119),
                    {false, lang:get("所有奖励已领取")}
            end;
        false ->
            logger:debug("没有打开所有贝壳，无法再次发牌", [], camp_new_flop, 124),
            {false, lang:get("还没有打开所有贝壳，无法进入下一轮")}
    end.

get_card(Role = #role{name = RoleName,
                      assets = #assets{naughty = Activity},
                      m_campaign =
                          OldMC = #m_campaign{camp_new_flop =
                                                  OldCF = #camp_new_flop{group =
                                                                             Group,
                                                                         times =
                                                                             Times,
                                                                         rewarded
                                                                             =
                                                                             Rewarded}}},
         Order) ->
    case lists:keymember(Order, 2, Rewarded) of
        true -> {false, lang:get("当前位置的贝壳已经打开")};
        false ->
            case campaign_new_flop_data:get_cost({Group, Times + 1})
                of
                {NeedActivity, Cost} when Activity >= NeedActivity ->
                    Loss = format:val_to_loss(Cost),
                    case role_gain:do_notice(Loss, Role) of
                        {ok, NRole} ->
                            Cards = make_info(NRole),
                            Cards2 = check_times_rewarded_flag(Cards,
                                                               Times + 1,
                                                               Rewarded),
                            #{reward_id := Id, item_id := Rewards,
                              is_cast := IsCast} =
                                util:rand_list(Cards2, ratio),
                            [{Item_Id, Num}] = Rewards,
                            BaseId = item_type:special_id(Item_Id),
                            Gain = format:val_to_gain([{BaseId, 0, Num}]),
                            logger:debug("~w", [Gain], camp_new_flop, 145),
                            case role_gain:do_notice(Gain, NRole) of
                                {ok, NewRole} ->
                                    NRewarded = [{Id, Order} | Rewarded],
                                    NewFlop = OldCF#camp_new_flop{times =
                                                                      Times + 1,
                                                                  rewarded =
                                                                      NRewarded},
                                    NewMC = OldMC#m_campaign{camp_new_flop =
                                                                 NewFlop},
                                    NRole2 = NewRole#role{m_campaign = NewMC},
                                    cast(RoleName, Item_Id, Num, IsCast),
                                    {ok, NRole2};
                                {false, #gain{reason = bag_full}} ->
                                    Title = lang:get("幸运贝壳活动"),
                                    Content = lang:get("您在打开幸运贝壳时背包已满"),
                                    mail:send(Role,
                                              #{title => Title,
                                                content => Content,
                                                items => Rewards}),
                                    NRewarded = [{Id, Order} | Rewarded],
                                    NewFlop = OldCF#camp_new_flop{times =
                                                                      Times + 1,
                                                                  rewarded =
                                                                      NRewarded},
                                    NewMC = OldMC#m_campaign{camp_new_flop =
                                                                 NewFlop},
                                    NRole2 = NRole#role{m_campaign = NewMC},
                                    cast(RoleName, Item_Id, Num, IsCast),
                                    {ok, NRole2};
                                _ -> {false, lang:get("数据错误，无法获得")}
                            end;
                        {false, #loss{msg = _Msg}} ->
                            logger:debug("~w", [_Msg], camp_new_flop, 170),
                            {false, lang:get("钻石不足，无法打开贝壳")}
                    end;
                {NeedActive, _} ->
                    Msg = notice:format(lang:get("淘气值不足~ts，无法打开贝壳"),
                                        [{string_2, 6, NeedActive}]),
                    {false, Msg};
                _ -> {false, lang:get("没有打开贝壳次数")}
            end
    end.

make_info(Role = #role{m_campaign =
                           #m_campaign{camp_new_flop =
                                           #camp_new_flop{group = Group,
                                                          times = Times,
                                                          rewarded =
                                                              Rewarded}}}) ->
    CardList = campaign_new_flop_data:get_card_list(Group),
    Cards = check_role_cond(Role, CardList),
    case length(Cards) =:= 4 of
        true ->
            case Times =:= length(Rewarded) of
                true ->
                    Fun = fun (Card = #{reward_id := Reward_id}) ->
                                  case lists:keyfind(Reward_id, 1, Rewarded) of
                                      {_, Order} -> Card#{flag => Order};
                                      false -> Card#{flag => 0}
                                  end
                          end,
                    Cards2 = [Fun(C) || C <- Cards],
                    Cards2;
                false ->
                    logger:debug("角色参数错误", [], camp_new_flop, 201),
                    []
            end;
        false ->
            logger:debug("没有可打开贝壳，分组：~w",
                         [Group],
                         camp_new_flop,
                         205),
            []
    end.

get_cost(Group) ->
    [campaign_new_flop_data:get_cost({Group, Times})
     || Times <- [1, 2, 3, 4]].

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

check_times_rewarded_flag([], _, _) -> [];
check_times_rewarded_flag(Cards, Times, Rewarded) ->
    check_times_rewarded_flag(Cards, Times, Rewarded, []).

check_times_rewarded_flag([], _Times, _Rewarded,
                          List) ->
    List;
check_times_rewarded_flag([H = #{min_times := Min,
                                 max_times := Max, reward_id := Id,
                                 flag := Flag}
                           | T],
                          Times, Rewarded, List) ->
    case Times > Max orelse
             Times < Min orelse
                 lists:keymember(Id, 1, Rewarded) orelse Flag =/= 0
        of
        true ->
            check_times_rewarded_flag(T, Times, Rewarded, List);
        false ->
            check_times_rewarded_flag(T,
                                      Times,
                                      Rewarded,
                                      [H | List])
    end.

cast(RoleName, BaseId, Num, 1) ->
    Msg =
        notice:format(lang:get("~ts点开了一个贝壳，居然是~ts，不禁乐开了花{face_1,10}"),
                      [{role_2, RoleName}, {item_2, BaseId, Num}]),
    notice:cast(all, 4, Msg),
    ok;
cast(_, _, _, _) -> ok.

format_data([]) -> [];
format_data(Data) ->
    [{Flag, Group, RId, IId, LevLow, Effect}
     || #{flag := Flag, group := Group, reward_id := RId,
          item_id := IId, lev_low := LevLow, effect := Effect}
            <- Data].

get_today_groups(Group) ->
    case check_group(Group) of
        true -> get_groups(Group + 1, Group);
        false -> get_today_groups(Group + 1);
        {false, end_of_group} -> false;
        {false, _Reason} -> false
    end.

get_groups(Group, Min) ->
    case check_group(Group) of
        true -> get_groups(Group + 1, Min);
        _ -> {Min, Group - 1}
    end.

check_group(Group) ->
    Now = date:unixtime(),
    case get_camp() of
        {_Id, ST, ET} when ST =< Now andalso ET >= Now ->
            Days = date:day_diff(ST, Now),
            case campaign_new_flop_data:get_days(Group) of
                {Min, Max} when Min =< Days andalso Max >= Days -> true;
                false -> {false, end_of_group};
                _ -> false
            end;
        _ ->
            logger:debug("不在活动期间", [], camp_new_flop, 280),
            {false, lang:get("不在活动期间")}
    end.

get_camp() ->
    case campaign_mgr:get_camp_info(30009) of
        #camp_cache{id = Id, start_time = St, end_time = ET} ->
            {Id, St, ET};
        _ -> {0, -1, -1}
    end.

