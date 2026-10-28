-file("src/mod/campaign/camp_doll.erl", 1).

-module(camp_doll).

-export([init/0,
         push/1,
         push_20459/1,
         open/3,
         reset/1,
         reset2/1,
         zero_flush/2,
         login/1,
         reload/0,
         check_open/0,
         gm_reset/1,
         clear_lucky/0,
         world_push/0,
         repair/0,
         repair/1,
         repair_role/2]).

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

-file("src/mod/campaign/camp_doll.erl", 31).

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

-file("src/mod/campaign/camp_doll.erl", 32).

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

-file("src/mod/campaign/camp_doll.erl", 33).

-file("inc/camp_misc.hrl", 1).

-record(camp_doll,
        {ver = 3,
         camp_id = 0,
         free_times = 0,
         lucky = 0,
         dolls = [],
         open_times = 0,
         logs = [],
         type1_times = 0,
         type2_times = 0,
         guarantee = []}).

-record(camp_doll_data,
        {pos = 0, open = 0, type = 0, reward = []}).

-record(camp_doll_item_data,
        {id = 1,
         type = 0,
         item_id = 20306,
         bind = 0,
         num = 1,
         odds = 100,
         is_cast = 1,
         lev_min = 1,
         lev_max = 100,
         sex = 0,
         classes = 0,
         min_lev_break = 0,
         max_lev_break = 0,
         min_times = 0,
         max_times = 0,
         ring_times = 0}).

-file("src/mod/campaign/camp_doll.erl", 34).

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

-file("src/mod/campaign/camp_doll.erl", 35).

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

-file("src/mod/campaign/camp_doll.erl", 36).

-file("inc/lev_break.hrl", 1).

-record(m_lev_break,
        {ver = 0,
         trial = 0 :: non_neg_integer(),
         done = 0 :: non_neg_integer(),
         times = 0 :: non_neg_integer(),
         attr_point = 0 :: non_neg_integer()}).

-file("src/mod/campaign/camp_doll.erl", 37).

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

-file("src/mod/campaign/camp_doll.erl", 38).

init() ->
    Dolls = init_dolls(0),
    #camp_doll{dolls = Dolls, free_times = 1,
               camp_id = campaign_mgr:get_camp_id(60040)}.

init_dolls(Lucky) ->
    PosList = util:shuffle(lists:seq(1, 8)),
    Odds1 = case camp_doll_data:get_odds(Lucky) of
                Odds when is_integer(Odds) -> Odds;
                _ -> 10
            end,
    TargetPos = case util:rand(1, 1000) =< Odds1 of
                    true -> util:rand_list(PosList);
                    _ when Lucky >= 100 -> util:rand_list(PosList);
                    _ -> false
                end,
    Fun = fun (Pos, DollsAcc) ->
                  case TargetPos of
                      Pos ->
                          [#camp_doll_data{pos = Pos, type = 2} | DollsAcc];
                      _ -> [#camp_doll_data{pos = Pos, type = 1} | DollsAcc]
                  end
          end,
    lists:foldl(Fun, [], PosList).

push(Role = #role{m_campaign =
                      #m_campaign{camp_doll = CampDoll}}) ->
    role:link_send(Role, 17838, {CampDoll}),
    ok.

push_20459(Role = #role{m_campaign =
                            #m_campaign{camp_doll =
                                            #camp_doll{open_times =
                                                           OpenTimes}}}) ->
    AddList = camp_doll_data:get_limit(),
    MaxTimes = lists:max(AddList),
    NeedAddList = [AddTimes
                   || AddTimes <- AddList, AddTimes > OpenTimes],
    Data = get_need_add_list(NeedAddList, []),
    LastReward = case NeedAddList of
                     [] -> camp_doll_data:get_reward(MaxTimes);
                     _ -> []
                 end,
    role:link_send(Role,
                   20459,
                   {OpenTimes, Data, LastReward}),
    ok.

get_need_add_list([], Data) -> Data;
get_need_add_list([Times | Rest], Data) ->
    case camp_doll_data:get_reward(Times) of
        [] -> get_need_add_list(Rest, Data);
        List when is_list(List) ->
            get_need_add_list(Rest, [{Times, List} | Data]);
        _ -> get_need_add_list(Rest, Data)
    end.

clear_lucky() ->
    role_group:apply(world, {camp_doll, login, []}).

world_push() ->
    role_group:apply(world, {camp_doll, push, []}).

reload() ->
    role_group:apply(world,
                     {camp_doll, zero_flush, [push]}).

zero_flush(Role, _Args) -> {ok, flush(Role, push)}.

login(Role) ->
    #role{m_campaign =
              #m_campaign{camp_doll = CampDoll} = MCampaign,
          assets = _Assets} =
        Role,
    case CampDoll of
        #camp_doll{guarantee = Gunarantee} ->
            case campaign_mgr:get_camp_id(60040) =/=
                     CampDoll#camp_doll.camp_id
                of
                true ->
                    CampDoll1 = camp_doll:init(),
                    CampDoll2 = CampDoll1#camp_doll{guarantee = Gunarantee},
                    {ok,
                     Role#role{m_campaign =
                                   MCampaign#m_campaign{camp_doll =
                                                            CampDoll2}}};
                _ -> {ok, Role}
            end;
        _ ->
            CampDoll2 = camp_doll:init(),
            {ok,
             Role#role{m_campaign =
                           MCampaign#m_campaign{camp_doll = CampDoll2}}}
    end.

flush(Role = #role{m_campaign =
                       MCamp = #m_campaign{camp_doll = CampDoll}},
      Push) ->
    NewRole = Role#role{m_campaign =
                            MCamp#m_campaign{camp_doll =
                                                 CampDoll#camp_doll{free_times =
                                                                        1}}},
    {ok, NewRole1} = login(NewRole),
    case Push of
        push -> push(NewRole1);
        _ -> skip
    end,
    NewRole1.

open(Role = #role{m_campaign =
                      #m_campaign{camp_doll = #camp_doll{dolls = Dolls}}},
     Type, _PosList)
    when Type =:= 2 ->
    PosList = [Pos
               || #camp_doll_data{pos = Pos, open = 0} <- Dolls],
    case PosList of
        [] -> {false, lang:get("已打开全部")};
        _ -> do_open(Role, PosList)
    end;
open(Role = #role{m_campaign =
                      #m_campaign{camp_doll = #camp_doll{dolls = Dolls}}},
     _Type, Pos) ->
    case lists:keyfind(Pos, #camp_doll_data.pos, Dolls) of
        #camp_doll_data{open = 0} -> do_open(Role, [Pos]);
        _ -> {false, lang:get("该套娃已打开")}
    end;
open(_Role, _Type, _PosList) ->
    logger:error("套娃参数错误 ~w ~w",
                 [_Type, _PosList],
                 camp_doll,
                 166),
    {false, lang:get("参数错误")}.

do_open(Role = #role{name = Name,
                     m_campaign =
                         #m_campaign{camp_doll =
                                         CampDoll = #camp_doll{open_times =
                                                                   OpenTimes}}},
        PosList) ->
    BreakTimes = lev_break:get_times(Role),
    Fun = fun (Pos,
               {RtnCampDoll = #camp_doll{dolls = RtnDolls,
                                         lucky = RtnLucky,
                                         open_times = RtnOpenTimes,
                                         logs = RtnLogs,
                                         type1_times = Type1Times,
                                         type2_times = Type2Times},
                RtnItemsList,
                RtnCast}) ->
                  Doll = #camp_doll_data{type = Type} = lists:keyfind(Pos,
                                                                      #camp_doll_data.pos,
                                                                      RtnDolls),
                  {#camp_doll_item_data{id = Id, item_id = ItemId,
                                        bind = Bind, num = Num,
                                        is_cast = IsCast},
                   NewGuarantee} =
                      get_items(Type,
                                #{classes => Role#role.classes,
                                  sex => Role#role.sex, lev => Role#role.lev,
                                  break_times => BreakTimes,
                                  camp_doll => RtnCampDoll}),
                  ItemId1 = item_type:special_id(ItemId),
                  GItemList = [{ItemId1, Bind, Num}],
                  LogNum1 = case lists:keyfind(Id, 1, RtnLogs) of
                                {Id, LogNum, _} -> LogNum;
                                _ -> 0
                            end,
                  NewRtnLucky = min(RtnLucky + add_lucky(Type), 100),
                  NewRtnLogs = lists:keystore(Id,
                                              1,
                                              RtnLogs,
                                              {Id,
                                               LogNum1 + 1,
                                               RtnOpenTimes + 1}),
                  NewRtnDolls = lists:keystore(Pos,
                                               #camp_doll_data.pos,
                                               RtnDolls,
                                               Doll#camp_doll_data{open = 1}),
                  NewRtnItemsList = GItemList ++ RtnItemsList,
                  NewRtnOpenTimes = RtnOpenTimes + 1,
                  {NewType1Times, NewType2Times} = case Type of
                                                       1 ->
                                                           {Type1Times + 1,
                                                            Type2Times};
                                                       2 ->
                                                           {Type1Times,
                                                            Type2Times + 1}
                                                   end,
                  NewCampDoll = RtnCampDoll#camp_doll{dolls = NewRtnDolls,
                                                      lucky = NewRtnLucky,
                                                      open_times =
                                                          NewRtnOpenTimes,
                                                      logs = NewRtnLogs,
                                                      type1_times =
                                                          NewType1Times,
                                                      type2_times =
                                                          NewType2Times,
                                                      guarantee = NewGuarantee},
                  NewRtnCast = [{ItemId1, Num, IsCast} | RtnCast],
                  {NewCampDoll, NewRtnItemsList, NewRtnCast}
          end,
    {NewCampDoll = #camp_doll{open_times = NewOpenTimes},
     Rewards,
     NewCastList} =
        lists:foldl(Fun, {CampDoll, [], []}, PosList),
    NNum = length(PosList),
    Rewards2 = case camp_doll_data:get_config() of
                   #{drop_list := DropList} ->
                       DropList2 = [{ItemIdTmp, NumTmp * NNum}
                                    || {ItemIdTmp, NumTmp} <- DropList],
                       DropList2 ++ Rewards;
                   _ -> Rewards
               end,
    CostList2 = case camp_doll_data:get_config() of
                    #{cost_list := CostList} ->
                        [{ItemIDTmp, NumTmp * NNum}
                         || {ItemIDTmp, NumTmp} <- CostList];
                    _ -> [{29821, NNum}]
                end,
    Loss = format:val_to_loss(CostList2),
    Gain = format:val_to_gain(Rewards2),
    case role_gain:do(Loss, Role) of
        {ok, Role1} ->
            Result = case role_gain:do_notice(Gain, Role1) of
                         {ok, Role2} -> {ok, Role2};
                         {false, #gain{}} ->
                             case camp_doll_data:get_config() of
                                 #{title := Title, content := Content} ->
                                     mail:send(Role, Title, Content, Rewards2),
                                     {ok, Role1};
                                 _ -> {false, lang:get("背包已满")}
                             end
                     end,
            case Result of
                {ok, Role3 = #role{m_campaign = MC = #m_campaign{}}} ->
                    case camp_doll_data:get_config() of
                        #{broadcast := CastMsg} ->
                            [notice:cast(all,
                                         5,
                                         notice:replace_msg([{"#role#",
                                                              [{role_2, Name}]},
                                                             {"#item#",
                                                              [{item_2,
                                                                ItemId,
                                                                ItemNum}]}],
                                                            CastMsg))
                             || {ItemId, ItemNum, IsCast} <- NewCastList,
                                IsCast =:= 1];
                        _ -> ignore
                    end,
                    NewRole = Role3#role{m_campaign =
                                             MC#m_campaign{camp_doll =
                                                               NewCampDoll}},
                    push(NewRole),
                    push_20459(NewRole),
                    push_add_reward(NewRole, OpenTimes, NewOpenTimes),
                    check_all(NewRole),
                    {ok, NewRole, Rewards};
                {false, Reason} -> {false, Reason}
            end;
        {false, #loss{msg = _Msg}} ->
            case CostList2 of
                [{CostItem, _} | _] ->
                    Msg = notice:format(lang:get("~ts不足，快去获取吧!"),
                                        [{item_2, CostItem}]);
                _ ->
                    Msg = notice:format(lang:get("~ts不足，快去获取吧!"),
                                        [{item_2, 29821}])
            end,
            {false, Msg}
    end.

reset2(Role) ->
    case reset(Role) of
        {ok, NewRole} -> {ok, NewRole};
        _ -> ok
    end.

reset(Role = #role{m_campaign =
                       MCamp = #m_campaign{camp_doll =
                                               CampDoll = #camp_doll{dolls =
                                                                         Dolls,
                                                                     lucky =
                                                                         Lucky,
                                                                     free_times
                                                                         =
                                                                         FreeTimes}}}) ->
    logger:debug("刷新重置 ", [], camp_doll, 277),
    case get(tref) of
        TRef when is_reference(TRef) ->
            erlang:cancel_timer(TRef);
        _ -> skip
    end,
    Dolls1 = [Doll
              || Doll = #camp_doll_data{open = 1} <- Dolls],
    AddTimes = case length(Dolls1) >= 6 of
                   true -> 1;
                   _ -> 0
               end,
    FreeTimes1 = FreeTimes + AddTimes,
    {Loss, NewFreeTimes} = case FreeTimes1 > 0 of
                               true -> {[], FreeTimes1 - 1};
                               _ ->
                                   CostList2 = case camp_doll_data:get_config()
                                                   of
                                                   #{cost_list := CostList} ->
                                                       [{ItemIDTmp,
                                                         NumTmp * NumTmp}
                                                        || {ItemIDTmp, NumTmp}
                                                               <- CostList];
                                                   _ -> [{29821, 1}]
                                               end,
                                   {format:val_to_loss(CostList2), FreeTimes1}
                           end,
    case role_gain:do_notice(Loss, Role) of
        {ok, LossRole} ->
            NewDolls = init_dolls(Lucky),
            NewLucky = case Lucky >= 100 of
                           true -> 0;
                           _ ->
                               case lists:keyfind(2,
                                                  #camp_doll_data.type,
                                                  NewDolls)
                                   of
                                   #camp_doll_data{} -> 0;
                                   _ -> Lucky
                               end
                       end,
            NewRole = LossRole#role{m_campaign =
                                        MCamp#m_campaign{camp_doll =
                                                             CampDoll#camp_doll{dolls
                                                                                    =
                                                                                    NewDolls,
                                                                                free_times
                                                                                    =
                                                                                    NewFreeTimes,
                                                                                lucky
                                                                                    =
                                                                                    NewLucky}}},
            push(NewRole),
            {ok, NewRole};
        {false, #loss{msg = Msg}} -> {false, Msg}
    end.

add_lucky(1) ->
    List = camp_doll_data:get_lucky(),
    case util:rand_list(List, 2) of
        {Lucky, _Odds} -> Lucky;
        _ -> 1
    end;
add_lucky(_) -> 0.

get_items(Type,
          #{classes := Classes, sex := Sex, lev := Lev,
            break_times := BreakTimes,
            camp_doll :=
                #camp_doll{type1_times = Type1Times,
                           type2_times = Type2Times, guarantee = Guarantee}}) ->
    IdList = camp_doll_data:get_list(Type),
    GetDataFun = fun (Id, Rtn) ->
                         case camp_doll_data:get_data(Id) of
                             Data = #camp_doll_item_data{lev_min = LevMin,
                                                         lev_max = LevMax,
                                                         sex = ISex,
                                                         classes = IClasses,
                                                         min_lev_break =
                                                             MinLevBreak,
                                                         max_lev_break =
                                                             MaxLevBreak}
                                 when Lev >= LevMin andalso
                                          Lev =< LevMax andalso
                                              (ISex == 2 orelse Sex == ISex)
                                                  andalso
                                                  (IClasses == 0 orelse
                                                       IClasses == Classes)
                                                      andalso
                                                      (MinLevBreak == 0 andalso
                                                           MaxLevBreak == 0
                                                           orelse
                                                           BreakTimes >=
                                                               MinLevBreak
                                                               andalso
                                                               BreakTimes =<
                                                                   MaxLevBreak) ->
                                 [Data | Rtn];
                             _ -> Rtn
                         end
                 end,
    DataList = lists:foldl(GetDataFun, [], IdList),
    Times = case Type of
                1 -> Type1Times;
                2 -> Type2Times
            end,
    GuaranteeArgs = #{done => Guarantee, times => Times},
    guarantee_rand(DataList,
                   #camp_doll_item_data.odds,
                   GuaranteeArgs).

push_add_reward(Role, OldTimes, NewTimes) ->
    TimesList = camp_doll_data:get_limit(),
    RewardTimesList = [Times
                       || Times <- TimesList,
                          Times > OldTimes andalso Times =< NewTimes],
    case RewardTimesList of
        [] -> ok;
        _ ->
            AddReward = get_add_reward(RewardTimesList, []),
            case AddReward of
                [] -> ok;
                _ ->
                    case camp_doll_data:get_config() of
                        #{times_title := TimesTitle,
                          times_content := TimesContent} ->
                            mail:send(Role,
                                      TimesTitle,
                                      TimesContent,
                                      AddReward);
                        _ ->
                            Title = lang:get("万圣金蛋"),
                            Content = lang:get("恭喜您累计抽取到一定次数，以下将相应奖励发放给您，请查收~"),
                            mail:send(Role, Title, Content, AddReward)
                    end,
                    ok
            end
    end.

get_add_reward([], AddReward) -> AddReward;
get_add_reward([Times | Rest], AddReward) ->
    case camp_doll_data:get_reward(Times) of
        [] -> get_add_reward(Rest, AddReward);
        List when is_list(List) ->
            Reward = [{Id, Bind, Num}
                      || {Id, Bind, Num, _} <- List],
            get_add_reward(Rest, Reward ++ AddReward);
        _ -> get_add_reward(Rest, AddReward)
    end.

repair() ->
    RoleList = get_role_list(),
    repair(RoleList).

repair([]) -> ok;
repair([{RoleId, OldTimes} | T]) ->
    case role_misc:is_local_role(RoleId) of
        true ->
            case role:apply(sync,
                            RoleId,
                            {camp_doll, repair_role, [OldTimes]})
                of
                ok -> ok;
                _Err ->
                    logger:error("砸蛋活动补发次数 玩家ID ~w 补发次数~w 返回值~w",
                                 [RoleId, OldTimes, _Err],
                                 camp_doll,
                                 403),
                    ok
            end;
        false -> skip
    end,
    repair(T).

repair_role(Role = #role{id = _RoleId,
                         m_campaign =
                             MCampaign = #m_campaign{camp_doll =
                                                         CampDoll =
                                                             #camp_doll{open_times
                                                                            =
                                                                            _NowOpenTimes}}},
            OldTimes) ->
    logger:info("角色ID ~w 当前次数 ~w 修改次数 ~w",
                [_RoleId, _NowOpenTimes, OldTimes],
                camp_doll,
                412),
    NewRole = Role#role{m_campaign =
                            MCampaign#m_campaign{camp_doll =
                                                     CampDoll#camp_doll{open_times
                                                                            =
                                                                            OldTimes}}},
    {ok, ok, NewRole}.

get_role_list() ->
    [{{5809, "mix", 191}, 167}, {{1888, "mix", 253}, 56}].

guarantee_rand(RandList, Pos, Args) ->
    GraranteeItem = [Data
                     || Data = #camp_doll_item_data{ring_times = Ring}
                            <- RandList,
                        Ring > 0],
    logger:debug("保底道具:~w",
                 [GraranteeItem],
                 camp_doll,
                 430),
    SortGraranteeItem =
        lists:keysort(#camp_doll_item_data.id, GraranteeItem),
    NewGuaranteeDone = reset_guarantee(SortGraranteeItem,
                                       Args),
    guarantee_rand(SortGraranteeItem,
                   RandList,
                   Pos,
                   Args#{done => NewGuaranteeDone}).

reset_guarantee([], #{done := GuaranteeDone}) ->
    GuaranteeDone;
reset_guarantee([#camp_doll_item_data{item_id =
                                          GtItemId,
                                      ring_times = RingTimes}
                 | Rest],
                Args = #{done := GuaranteeDone, times := Times}) ->
    case lists:keyfind(GtItemId, 1, GuaranteeDone) of
        {_, _GtDoneTimes} ->
            case Times rem RingTimes =:= 0 of
                true ->
                    NewGuaranteeDone = lists:keydelete(GtItemId,
                                                       1,
                                                       GuaranteeDone),
                    reset_guarantee(Rest, Args#{done => NewGuaranteeDone});
                _ -> reset_guarantee(Rest, Args)
            end;
        _ -> reset_guarantee(Rest, Args)
    end;
reset_guarantee([_ | Rest], Args) ->
    reset_guarantee(Rest, Args).

guarantee_rand([], RandList, Pos,
               _Args = #{done := GuaranteeDone}) ->
    case util:rand_list(RandList, Pos) of
        Data = #camp_doll_item_data{item_id = ItemId,
                                    ring_times = Ring}
            when Ring > 0 ->
            NewGuaranteeDone = case lists:keyfind(ItemId,
                                                  1,
                                                  GuaranteeDone)
                                   of
                                   {ItemId, Times} ->
                                       lists:keystore(ItemId,
                                                      1,
                                                      GuaranteeDone,
                                                      {ItemId, Times + 1});
                                   _ -> GuaranteeDone
                               end,
            {Data, NewGuaranteeDone};
        Data -> {Data, GuaranteeDone}
    end;
guarantee_rand([#camp_doll_item_data{ring_times = Ring,
                                     min_times = MinTimes, max_times = MaxTimes,
                                     item_id = GtItemId}
                | Rest],
               RandList, Pos,
               Args = #{done := GuaranteeDone, times := Times}) ->
    TurnTimes = Times rem Ring,
    LeftTimes = Ring - TurnTimes,
    GtDoneTimes = case lists:keyfind(GtItemId,
                                     1,
                                     GuaranteeDone)
                      of
                      {_, _GtDoneTimes} ->
                          case TurnTimes of
                              0 -> 0;
                              _ -> _GtDoneTimes
                          end;
                      _ -> 0
                  end,
    LeftGuaranteeTimes = MinTimes - GtDoneTimes,
    logger:debug("本轮剩余:~w, 本轮抽取:~w, 剩余保底:~w",
                 [LeftTimes, TurnTimes, LeftGuaranteeTimes],
                 camp_doll,
                 482),
    case LeftGuaranteeTimes > 0 andalso
             LeftTimes =< LeftGuaranteeTimes
        of
        true ->
            GuaranteeRandL = [Data
                              || Data = #camp_doll_item_data{item_id = ItemId}
                                     <- RandList,
                                 ItemId =:= GtItemId],
            NewGuaranteeDone = lists:keystore(GtItemId,
                                              1,
                                              GuaranteeDone,
                                              {GtItemId, GtDoneTimes + 1}),
            {util:rand_list(GuaranteeRandL, Pos), NewGuaranteeDone};
        _ ->
            case GtDoneTimes >= MaxTimes of
                true ->
                    logger:debug("保底达到上限:~w", [GtItemId], camp_doll, 494),
                    NewRandList = [Data
                                   || Data = #camp_doll_item_data{item_id =
                                                                      ItemId}
                                          <- RandList,
                                      ItemId =/= GtItemId],
                    NewGuaranteeDone = lists:keystore(GtItemId,
                                                      1,
                                                      GuaranteeDone,
                                                      {GtItemId, GtDoneTimes}),
                    guarantee_rand(Rest,
                                   NewRandList,
                                   Pos,
                                   Args#{done => NewGuaranteeDone});
                _ ->
                    NewGuaranteeDone = lists:keystore(GtItemId,
                                                      1,
                                                      GuaranteeDone,
                                                      {GtItemId, GtDoneTimes}),
                    guarantee_rand(Rest,
                                   RandList,
                                   Pos,
                                   Args#{done => NewGuaranteeDone})
            end
    end;
guarantee_rand([_Else | Rest], RandList, Pos, Args) ->
    logger:debug("========:~w",
                 [{_Else, Args}],
                 camp_doll,
                 504),
    guarantee_rand(Rest, RandList, Pos, Args).

check_all(#role{m_campaign =
                    #m_campaign{camp_doll = #camp_doll{dolls = Dolls}}}) ->
    Dolls1 = [Doll
              || Doll = #camp_doll_data{open = 1} <- Dolls],
    case length(Dolls1) of
        8 ->
            NewTref = erlang:send_after(2 * 1000,
                                        self(),
                                        {apply_async, {camp_doll, reset2, []}}),
            put(ref, NewTref),
            ok;
        _ -> ok
    end.

check_open() ->
    case camp_doll_data:get_config() of
        #{open := Open, time := Time} when Open =:= 1 ->
            Predicate = fun ({H1, M1, S1, H2, M2, S2}) ->
                                Now = date:unixtime(),
                                {{Year, Month, Day}, _} =
                                    date:seconds_to_datetime(Now),
                                Seconds1 = date:datetime_to_seconds({Year,
                                                                     Month,
                                                                     Day,
                                                                     H1,
                                                                     M1,
                                                                     S1}),
                                Seconds2 = date:datetime_to_seconds({Year,
                                                                     Month,
                                                                     Day,
                                                                     H2,
                                                                     M2,
                                                                     S2}),
                                Seconds1 =< Now andalso Now =< Seconds2
                        end,
            TimeList = lists:filter(Predicate, Time),
            TimeList =/= [];
        _ -> false
    end.

gm_reset(Role = #role{m_campaign = MCamp}) ->
    NewDolls = init_dolls(0),
    NewRole = Role#role{m_campaign =
                            MCamp#m_campaign{camp_doll =
                                                 #camp_doll{dolls = NewDolls,
                                                            open_times = 0,
                                                            free_times = 1,
                                                            logs = [],
                                                            lucky = 0,
                                                            type1_times = 0,
                                                            type2_times = 0}}},
    push(NewRole),
    {ok, NewRole}.

