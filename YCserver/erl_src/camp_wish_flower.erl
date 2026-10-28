-file("src/mod/campaign/camp_wish_flower.erl", 1).

-module(camp_wish_flower).

-export([push/1,
         push_pmd/1,
         wish/2,
         zero_flush/2,
         camp_flush/1,
         login/1,
         reload/0,
         gm_rest/1]).

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

-file("src/mod/campaign/camp_wish_flower.erl", 22).

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

-file("src/mod/campaign/camp_wish_flower.erl", 23).

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

-file("src/mod/campaign/camp_wish_flower.erl", 24).

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

-file("src/mod/campaign/camp_wish_flower.erl", 25).

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

-file("src/mod/campaign/camp_wish_flower.erl", 26).

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

-file("src/mod/campaign/camp_wish_flower.erl", 27).

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

-file("src/mod/campaign/camp_wish_flower.erl", 28).

push(Role = #role{m_campaign =
                      #m_campaign{camp_wish_flower =
                                      #camp_wish_flower{floor = Floor,
                                                        all_times =
                                                            AllTimes}}}) ->
    case [Num
          || Num <- camp_wish_flower_data:get_limit(),
             Num > AllTimes]
        of
        [] ->
            MaxNum = lists:max(camp_wish_flower_data:get_limit()),
            NRlist = case camp_wish_flower_data:get_reward(MaxNum)
                         of
                         RList when is_list(RList) ->
                             [{Id, Num, Effect}
                              || {Id, _Bound, Num, Effect} <- RList];
                         _ -> []
                     end,
            logger:debug("~w",
                         [{Floor, AllTimes, 0, NRlist}],
                         camp_wish_flower,
                         39),
            role:link_send(Role,
                           17824,
                           {Floor, AllTimes, [{0, NRlist}]});
        AllNumList ->
            RewardList = calc_reward_list(AllNumList, AllTimes),
            logger:debug("~w",
                         [{Floor, AllTimes, RewardList}],
                         camp_wish_flower,
                         43),
            role:link_send(Role,
                           17824,
                           {Floor, AllTimes, RewardList})
    end.

calc_reward_list(AllNumList, AllTimes) ->
    calc_reward_list(AllNumList, AllTimes, []).

calc_reward_list([], _AllTimes, RewardList) ->
    lists:reverse(RewardList);
calc_reward_list([NeedNum | T], AllTimes, RewardList) ->
    Reward = case camp_wish_flower_data:get_reward(NeedNum)
                 of
                 RList when is_list(RList) ->
                     [{Id, Num, Effect}
                      || {Id, _Bound, Num, Effect} <- RList];
                 _ -> []
             end,
    calc_reward_list(T,
                     AllTimes,
                     [{NeedNum - AllTimes, Reward} | RewardList]).

reload() ->
    role_group:apply(world,
                     {camp_wish_flower, camp_flush, []}).

push_pmd(Role) ->
    SaveKey = camp_wish_flower_key(),
    case env:get(SaveKey) of
        PwdList when is_list(PwdList) ->
            role:pack_send(Role, 17827, {PwdList});
        _ -> ok
    end.

login(Role) -> camp_flush(Role).

camp_flush(Role = #role{m_campaign =
                            MCampaign = #m_campaign{camp_wish_flower =
                                                        CampWishFlower =
                                                            #camp_wish_flower{camp_id
                                                                                  =
                                                                                  OldCampId,
                                                                              times
                                                                                  =
                                                                                  Times}}}) ->
    CampId = camp_wish_flower_id(),
    NewCampWishFlower = case OldCampId =/= CampId of
                            true ->
                                #camp_wish_flower{camp_id = CampId,
                                                  times = Times};
                            _ -> CampWishFlower
                        end,
    NewRole = Role#role{m_campaign =
                            MCampaign#m_campaign{camp_wish_flower =
                                                     NewCampWishFlower}},
    push(NewRole),
    {ok, NewRole};
camp_flush(_Role) -> ok.

zero_flush(Role = #role{m_campaign =
                            MCampaign = #m_campaign{camp_wish_flower =
                                                        CampWishFlower =
                                                            #camp_wish_flower{}}},
           _) ->
    NewCampWishFlower = case camp_wish_flower_data:get_cfg()
                            of
                            #{flag := 0} -> CampWishFlower;
                            #{flag := 1} ->
                                CampWishFlower#camp_wish_flower{all_times = 0}
                        end,
    NewRole = Role#role{m_campaign =
                            MCampaign#m_campaign{camp_wish_flower =
                                                     NewCampWishFlower}},
    {ok, NewRole};
zero_flush(Role, _) -> {ok, Role}.

wish(Role = #role{name = Name,
                  m_campaign = Mc = #m_campaign{camp_wish_flower = Cwf},
                  lev = Lev},
     BuyTimes)
    when BuyTimes > 0 ->
    LossItem1 = case
                    campaign_data:get(camp_wish_flower_id())
                    of
                    #camp_cfg{loss_items = LossItem} -> LossItem;
                    _ -> [{29039, 1}]
                end,
    Loss = format:val_to_loss([{ItemId, Count * BuyTimes}
                               || {ItemId, Count} <- LossItem1]),
    case check_time() of
        ok ->
            case role_gain:do_notice(Loss, Role) of
                {ok, Role1} ->
                    GainAssets = format:val_to_gain([{90051,
                                                      5 * BuyTimes}]),
                    case role_gain:do_notice(GainAssets, Role1) of
                        {ok, Role3} ->
                            {NewCwf,
                             #{rewards := Rewards, casts := Casts, ids := Ids,
                               gift := Gift}} =
                                wish(Cwf,
                                     BuyTimes,
                                     #{rewards => [], casts => [], ids => [],
                                       num => 1, gift => []},
                                     Lev),
                            Rewards1 = reward_change(Rewards),
                            Gain = format:val_to_gain(Rewards1),
                            case role_gain:do(Gain, Role3) of
                                {ok, Role2} ->
                                    NewRole = Role2#role{m_campaign =
                                                             Mc#m_campaign{camp_wish_flower
                                                                               =
                                                                               NewCwf}},
                                    cast(Name, Casts),
                                    push(NewRole),
                                    case Gift of
                                        [] -> ignore;
                                        GiftL when is_list(GiftL) ->
                                            Title1 = lang:get("参与次数达成奖励"),
                                            Content1 =
                                                lang:get("累计参与次数已达成，请查收您的奖励^_^"),
                                            mail:send(NewRole,
                                                      #{title => Title1,
                                                        content => Content1,
                                                        items => GiftL})
                                    end,
                                    {ok, NewRole, lists:reverse(Ids)};
                                {false, _} ->
                                    NewRole = Role3#role{m_campaign =
                                                             Mc#m_campaign{camp_wish_flower
                                                                               =
                                                                               NewCwf}},
                                    Title = case camp_wish_flower_data:get_cfg()
                                                of
                                                #{title := CfgTitle} ->
                                                    CfgTitle;
                                                _ -> lang:get("冰冻星辰")
                                            end,
                                    Content =
                                        lang:get("您在领取奖励的时候背包已满，以下是您获得的奖励"),
                                    mail:send(Role3,
                                              #{title => Title,
                                                content => Content,
                                                items => Rewards1}),
                                    cast(Name, Casts),
                                    push(NewRole),
                                    case Gift of
                                        [] -> ignore;
                                        GiftL when is_list(GiftL) ->
                                            Title1 = lang:get("参与次数达成奖励"),
                                            Content1 =
                                                lang:get("累计参与次数已达成，请查收您的奖励^_^"),
                                            mail:send(NewRole,
                                                      #{title => Title1,
                                                        content => Content1,
                                                        items => GiftL})
                                    end,
                                    {ok, NewRole, lists:reverse(Ids)}
                            end;
                        {false, #gain{msg = Msg}} -> {false, Msg}
                    end;
                {false, #loss{msg = Msg}} -> {false, Msg}
            end;
        {false, Reason} -> {false, Reason}
    end.

wish(Cwf, 0, Args, _Lev) -> {Cwf, Args};
wish(Cwf = #camp_wish_flower{floor = Floor,
                             times = Times, all_times = AllTimes},
     BuyTimes,
     Args = #{rewards := Rewards, casts := Casts, ids := Ids,
              num := Num, gift := Gift},
     Lev) ->
    NewAllTimes = AllTimes + 1,
    Data = camp_wish_flower_data:list(Floor),
    Data1 = lists:filter(fun (X) ->
                                 case X of
                                     {_, _, _, _, _, _, _, MinxLev, MaxLev} ->
                                         Lev >= MinxLev andalso Lev =< MaxLev;
                                     _ -> false
                                 end
                         end,
                         Data),
    [{_, _, _, _, Max, Min, _IsCast, _, _} | _] = Data1,
    Data2 = case Times >= Min of
                true -> Data1;
                _ -> lists:keydelete(1, 4, Data1)
            end,
    Data3 = case Times >= Max of
                true ->
                    case lists:keyfind(1, 4, Data2) of
                        false -> Data2;
                        _ -> [lists:keyfind(1, 4, Data2)]
                    end;
                _ -> Data2
            end,
    {Id, _Odds, Reward, Flag, _Max, _Min, IsCast, _, _} =
        util:rand_list(Data3, 2),
    Reward1 = item_type:special_id(Reward),
    Casts1 = case IsCast of
                 1 -> [{Num, Reward1} | Casts];
                 _ -> [{Num, []} | Casts]
             end,
    Reward2 = Reward1 ++ Rewards,
    Gift1 = case lists:member(NewAllTimes,
                              camp_wish_flower_data:get_limit())
                of
                true ->
                    case camp_wish_flower_data:get_reward(NewAllTimes) of
                        RList when is_list(RList) ->
                            [{item_type:special_id(RewardId), Bound, RNum}
                             || {RewardId, Bound, RNum, _Effect} <- RList]
                                ++ Gift;
                        _ -> [] ++ Gift
                    end;
                _ -> [] ++ Gift
            end,
    {NewFloor, NewTimes} = next_floor(Floor,
                                      Flag,
                                      Min,
                                      Max,
                                      Times),
    logger:debug("当前层数~w;下一层~w;抽中唯一ID~w;物品奖励~w;Flag~w;当前次数 "
                 "~w;最大~w;最小~w;物品奖励转换~w",
                 [Floor,
                  NewFloor,
                  Id,
                  Reward,
                  Flag,
                  Times,
                  Max,
                  Min,
                  Reward1],
                 camp_wish_flower,
                 219),
    wish(Cwf#camp_wish_flower{floor = NewFloor,
                              times = NewTimes, all_times = NewAllTimes},
         BuyTimes - 1,
         Args#{rewards => Reward2, casts => Casts1,
               ids => [{Id, NewFloor} | Ids], num => Num + 1,
               gift => Gift1},
         Lev).

next_floor(_Floor, 2, _Min, _Max, _Times) -> {1, 0};
next_floor(Floor, 1, _Min, _Max, Times) ->
    {Floor + 1, Times + 1};
next_floor(1, 0, _Min, _Max, Times) -> {1, Times + 1};
next_floor(Floor, 0, Min, Max, Times)
    when Min =:= 0 andalso Max =:= 0 ->
    {Floor - 1, Times + 1};
next_floor(Floor, 0, _Min, Max, Times)
    when Times >= Max ->
    {Floor, Times + 1};
next_floor(Floor, 0, _Min, _Max, Times) ->
    {Floor - 1, Times + 1}.

cast(_Name, []) -> ok;
cast(Name, [{_Num, []} | Casts]) -> cast(Name, Casts);
cast(Name, [{Num, [{ItemId, Count}]} | Casts]) ->
    logger:debug("广播  ~n", [], camp_wish_flower, 236),
    Des = util:rand_list([lang:get("福气无双"),
                          lang:get("鸿运当头"),
                          lang:get("天降鸿福")]),
    Msg = notice:format(lang:get("~ts!~ts抽中了~ts"),
                        [{string_1, Des},
                         {role_2, Name},
                         {item_2, ItemId, 0, Count}]),
    Msg2 =
        notice:format(lang:get("~ts，~ts在~ts时意外挖到了~ts{face_1,20}"),
                      [{string_1, Des},
                       {role_2, Name},
                       {string_2, 1, lang:get("步步高升")},
                       {item_2, ItemId, Count}]),
    SaveKey = camp_wish_flower_key(),
    PwdList1 = case env:get(SaveKey) of
                   PwdList when is_list(PwdList) ->
                       lists:sublist(lists:reverse(lists:keysort(2, PwdList)),
                                     19);
                   _ -> []
               end,
    env:save(SaveKey, [{Msg, date:unixtime()} | PwdList1]),
    timer:apply_after(2 * Num * 1000,
                      role_group,
                      pack_send,
                      [world, 17826, {Msg}]),
    timer:apply_after(2 * Num * 1000,
                      notice,
                      cast,
                      [all, 5, Msg2]),
    cast(Name, Casts).

reward_change(Reward) ->
    lists:foldl(fun ({ItemId, Count}, Acc) ->
                        [{ItemId, 0, Count} | Acc];
                    ({ItemId, Bind, Count}, Acc) ->
                        [{ItemId, Bind, Count} | Acc]
                end,
                [],
                Reward).

check_time() -> ok.

gm_rest(Role = #role{m_campaign =
                         Mc = #m_campaign{camp_wish_flower = Cwf}}) ->
    NewRole = Role#role{m_campaign =
                            Mc#m_campaign{camp_wish_flower =
                                              Cwf#camp_wish_flower{floor = 1,
                                                                   times = 0}}},
    push(NewRole),
    {ok, NewRole}.

camp_wish_flower_id() ->
    case campaign_mgr:get_camp_info(60013) of
        #camp_cache{id = Id} -> Id;
        _ -> 0
    end.

camp_wish_flower_key() ->
    CampId = camp_wish_flower_id(),
    {camp_wish_flower, CampId}.

