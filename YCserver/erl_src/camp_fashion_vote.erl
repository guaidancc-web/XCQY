-file("src/mod/campaign/camp_fashion_vote.erl", 1).

-module(camp_fashion_vote).

-author("jia").

-behaviour(gen_server).

-export([start_link/0]).

-export([init/1,
         handle_call/3,
         handle_cast/2,
         handle_info/2,
         terminate/2,
         code_change/3,
         cast/1,
         call/1,
         info/1]).

-export([login/1,
         zero_flush/2,
         levup/1,
         vote/2,
         invite_vote/3,
         reply_invite/4,
         push_config/1,
         push_vote_role/1,
         push_lucky_dogs/1,
         role_lucky_dogs/2,
         notice_mail/1,
         refresh_mail/2,
         check_is_open/0,
         do_lucky_dogs/2,
         check_invite_state/3]).

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

-file("src/mod/campaign/camp_fashion_vote.erl", 52).

-file("inc/camp_fashion_vote.hrl", 1).

-author("jia").

-record(camp_fashion_vote_role,
        {rid = {0, "", 0},
         name = "",
         lev = 0,
         sex = 0,
         classes = 0,
         zone_name = "",
         vote_times = 0,
         voted_times = 0,
         invite_votes = 0,
         reply_invites = 0,
         update_time = 0,
         vote_groups = []}).

-record(camp_fashion_vote_group,
        {group_id = 0,
         vote_list = [],
         vote_num = 0,
         vote_time = 0}).

-record(camp_fashion_vote_lucky,
        {group_id = 0,
         lucky_list = [],
         vote_num = 0,
         vote_rate = 0}).

-record(camp_fashion_vote_invite,
        {invite_key = {{0, "", 0}, {0, "", 0}, 0},
         invite_id = {0, "", 0},
         replay_id = {0, "", 0},
         group_id = 0,
         invite_state = 1,
         invite_time = 0}).

-file("src/mod/campaign/camp_fashion_vote.erl", 53).

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

-file("src/mod/campaign/camp_fashion_vote.erl", 54).

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

-file("src/mod/campaign/camp_fashion_vote.erl", 55).

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

-file("src/mod/campaign/camp_fashion_vote.erl", 56).

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

-file("src/mod/campaign/camp_fashion_vote.erl", 57).

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

-file("src/mod/campaign/camp_fashion_vote.erl", 58).

-record(state,
        {refresh_ref = undefind,
         notice_ref = undefind,
         refresh_time = [],
         refresh_rewards = []}).

cast(Info) -> gen_server:cast(camp_fashion_vote, Info).

call(Info) ->
    case catch gen_server:call(camp_fashion_vote,
                               Info,
                               10000)
        of
        {'EXIT', {timeout, _}} -> {error, timeout};
        {'EXIT', {noproc, _}} -> {error, noproc};
        {'EXIT', {normal, _}} -> {error, exit};
        {'EXIT', _Call_Err} -> {error, _Call_Err};
        _Call_Return -> _Call_Return
    end.

info(Info) -> camp_fashion_vote ! Info.

start_link() ->
    gen_server:start_link({local, camp_fashion_vote},
                          camp_fashion_vote,
                          [],
                          []).

init([]) ->
    logger:info("[~w] 正在启动...",
                [camp_fashion_vote],
                camp_fashion_vote,
                89),
    process_flag(trap_exit, true),
    ets:new(camp_fashion_vote_role,
            [set,
             named_table,
             public,
             {keypos, #camp_fashion_vote_role.rid}]),
    dets:open_file(camp_fashion_vote_role,
                   [{file, "./dets/camp_fashion_vote_role.dets"},
                    {keypos, #camp_fashion_vote_role.rid},
                    {type, set}]),
    dets:open_file(camp_fashion_vote_lucky,
                   [{file, "./dets/camp_fashion_vote_lucky.dets"},
                    {keypos, #camp_fashion_vote_lucky.group_id}]),
    ets:new(camp_fashion_vote_lucky,
            [set,
             named_table,
             public,
             {keypos, #camp_fashion_vote_lucky.group_id}]),
    dets:open_file(camp_fashion_vote_invite,
                   [{file, "./dets/camp_fashion_vote_invite.dets"},
                    {keypos, #camp_fashion_vote_invite.invite_key}]),
    ets:new(camp_fashion_vote_invite,
            [set,
             named_table,
             public,
             {keypos, #camp_fashion_vote_invite.invite_key}]),
    dets:to_ets(camp_fashion_vote_role,
                camp_fashion_vote_role),
    dets:to_ets(camp_fashion_vote_invite,
                camp_fashion_vote_invite),
    dets:to_ets(camp_fashion_vote_lucky,
                camp_fashion_vote_lucky),
    Now = date:unixtime(),
    State = case camp_fashion_vote_data:get_etc_config() of
                [#{notice_time := NoticeTime, refresh_rewards := R0,
                   refresh_times := T0}] ->
                    NoticeTime1 = date:datetime_to_seconds(NoticeTime),
                    NoticeRef = case NoticeTime1 > Now of
                                    true ->
                                        erlang:send_after((NoticeTime1 - Now) *
                                                              1000,
                                                          self(),
                                                          notice_mail);
                                    _ -> undefind
                                end,
                    {RefreshRef, T, R} = case get_first_time(T0, R0) of
                                             {ok, {Time, T1, R1}} ->
                                                 case NoticeTime1 > Now of
                                                     true ->
                                                         Ref =
                                                             erlang:send_after((Time
                                                                                    -
                                                                                    Now)
                                                                                   *
                                                                                   1000,
                                                                               self(),
                                                                               refresh_mail),
                                                         {Ref, T1, R1};
                                                     _ -> {undefind, [], []}
                                                 end;
                                             _ -> {undefind, [], []}
                                         end,
                    #state{refresh_ref = RefreshRef, notice_ref = NoticeRef,
                           refresh_rewards = R, refresh_time = T};
                _ -> #state{}
            end,
    logger:info("[~w] 启动完成",
                [camp_fashion_vote],
                camp_fashion_vote,
                133),
    {ok, State}.

get_first_time([], _) -> false;
get_first_time(_, []) -> false;
get_first_time([Time | Rest1], [Reward1 | Reset2]) ->
    Time1 = date:datetime_to_seconds(Time),
    Now = date:unixtime(),
    case Time1 >= Now of
        true ->
            {ok, {Time1, [Time | Rest1], [Reward1 | Reset2]}};
        _ -> get_first_time(Rest1, Reset2)
    end.

handle_call(_Request, _From, State) ->
    {reply, ok, State}.

handle_cast({save_vote_role, VoteRole}, State) ->
    save_vote_role(VoteRole),
    {noreply, State};
handle_cast({role_vote, Args}, State) ->
    #{rid := InviteID, group_id := GroupID} = Args,
    {ok, InviteRole} = get_vote_role(InviteID),
    #camp_fashion_vote_role{vote_times = OldVoteTimes,
                            vote_groups = VoteGroups,
                            voted_times = HaveVoteTimes} =
        InviteRole,
    VoteGroup = case lists:keyfind(GroupID, 1, VoteGroups)
                    of
                    {GroupID, TotalVote} -> {GroupID, TotalVote + 1};
                    _ -> {GroupID, 1}
                end,
    NewVoteGroups = lists:keystore(GroupID,
                                   1,
                                   VoteGroups,
                                   VoteGroup),
    NewInviteRole =
        InviteRole#camp_fashion_vote_role{vote_times =
                                              OldVoteTimes - 1,
                                          voted_times = HaveVoteTimes + 1,
                                          vote_groups = NewVoteGroups},
    save_vote_role(NewInviteRole),
    push_vote_role(NewInviteRole),
    {noreply, State};
handle_cast({reply_intive_vote, Args}, State) ->
    #{invite_id := InviteID, reply_id := ReplyID,
      group_id := GroupID} =
        Args,
    {ok, InviteRole} = get_vote_role(InviteID),
    #camp_fashion_vote_role{vote_times = OldVoteTimes,
                            invite_votes = OldInviteVotes,
                            vote_groups = VoteGroups} =
        InviteRole,
    VoteGroup = case lists:keyfind(GroupID, 1, VoteGroups)
                    of
                    {GroupID, TotalVote} -> {GroupID, TotalVote + 1};
                    _ -> {GroupID, 1}
                end,
    NewVoteGroups = lists:keystore(GroupID,
                                   1,
                                   VoteGroups,
                                   VoteGroup),
    NewInviteRole =
        InviteRole#camp_fashion_vote_role{vote_times =
                                              OldVoteTimes,
                                          invite_votes = OldInviteVotes - 1,
                                          vote_groups = NewVoteGroups},
    save_vote_role(NewInviteRole),
    push_vote_role(NewInviteRole),
    {ok,
     ReplyRole = #camp_fashion_vote_role{reply_invites =
                                             ReplyInvites}} =
        get_vote_role(ReplyID),
    NewReplyRole =
        ReplyRole#camp_fashion_vote_role{reply_invites =
                                             ReplyInvites + 1},
    save_vote_role(NewReplyRole),
    push_vote_role(NewReplyRole),
    {noreply, State};
handle_cast({save_vote_invite, VoteInvite}, State) ->
    save_vote_invite(VoteInvite),
    {noreply, State};
handle_cast({send_lucky_dogs, LuckyDogs}, State) ->
    case check_is_open() of
        {ok, _CampID} ->
            case camp_fashion_vote_data:get_etc_config() of
                [#{lucky_scroll := LuckyScroll0,
                   lucky_legend := LuckyLegend0, lucky_title := LuckyTitle,
                   lucky_content := LuckyContent0}] ->
                    notice:effect(all, 30215),
                    {LuckyNames, LuckyRoles} = lists:foldl(fun
                                                               (#camp_fashion_vote_lucky{group_id
                                                                                             =
                                                                                             GroupID,
                                                                                         lucky_list
                                                                                             =
                                                                                             LuckyList},
                                                                {Acc3, Acc4})
                                                                   when
                                                                     length(LuckyList)
                                                                         > 0 ->
                                                                   case
                                                                       camp_fashion_vote_data:get_group(GroupID,
                                                                                                        0,
                                                                                                        0)
                                                                       of
                                                                       {SetName,
                                                                        _Rewards} ->
                                                                           {LuckySName,
                                                                            LuckyRoles0} =
                                                                               lists:foldl(fun
                                                                                               ({Rid,
                                                                                                 ZoneName,
                                                                                                 Name,
                                                                                                 _Lev,
                                                                                                 _Classes,
                                                                                                 _Sex},
                                                                                                {Acc1,
                                                                                                 Acc2}) ->
                                                                                                   ZoneName0 =
                                                                                                       util:flist(lang:get("<color='#13FC60'>~ts</color><color='#23F0F7'>"
                                                                                                                           "~ts</color>\n"),
                                                                                                                  [ZoneName,
                                                                                                                   Name])
                                                                                                           ++
                                                                                                           Acc1,
                                                                                                   {ZoneName0,
                                                                                                    [{Rid,
                                                                                                      ZoneName0,
                                                                                                      GroupID}
                                                                                                     | Acc2]};
                                                                                               (_,
                                                                                                {Acc1,
                                                                                                 Acc2}) ->
                                                                                                   {Acc1,
                                                                                                    Acc2}
                                                                                           end,
                                                                                           {[],
                                                                                            []},
                                                                                           LuckyList),
                                                                           Acc5 =
                                                                               util:flist(notice:format(lang:get("获得~ts的幸运儿是：\n"),
                                                                                                        [{string_2,
                                                                                                          5,
                                                                                                          SetName}]))
                                                                                   ++
                                                                                   LuckySName
                                                                                       ++
                                                                                       Acc3,
                                                                           {Acc5,
                                                                            LuckyRoles0
                                                                                ++
                                                                                Acc4};
                                                                       _ ->
                                                                           {Acc3,
                                                                            Acc4}
                                                                   end;
                                                               (_,
                                                                {Acc3, Acc4}) ->
                                                                   {Acc3, Acc4}
                                                           end,
                                                           {[], []},
                                                           LuckyDogs),
                    LuckyRoles2 = [SName
                                   || {_Rid, SName, _GroupID} <- LuckyRoles],
                    LuckyLegend = notice:replace_msg2([{"#name#",
                                                        [util:flist(LuckyRoles2)]}],
                                                      LuckyLegend0),
                    LuckyContent = notice:replace_msg2([{"#name#",
                                                         [LuckyNames]}],
                                                       LuckyContent0),
                    ZoneRoles = ets:tab2list(camp_fashion_vote_role),
                    lists:foreach(fun (#camp_fashion_vote_role{rid = Rid,
                                                               classes =
                                                                   Classes,
                                                               sex = Sex}) ->
                                          role:pack_send(Rid,
                                                         9902,
                                                         {10, LuckyLegend, []}),
                                          role:pack_send(Rid,
                                                         9902,
                                                         {11,
                                                          LuckyScroll0,
                                                          []}),
                                          LuckyRewards = lists:foldl(fun ({Rid0,
                                                                           _,
                                                                           GroupID},
                                                                          Acc)
                                                                             when
                                                                               Rid0
                                                                                   =:=
                                                                                   Rid ->
                                                                             case
                                                                                 camp_fashion_vote_data:get_group(GroupID,
                                                                                                                  Classes,
                                                                                                                  Sex)
                                                                                 of
                                                                                 {_SetName,
                                                                                  R} ->
                                                                                     R
                                                                                         ++
                                                                                         Acc;
                                                                                 _ ->
                                                                                     Acc
                                                                             end;
                                                                         (_,
                                                                          Acc) ->
                                                                             Acc
                                                                     end,
                                                                     [],
                                                                     LuckyRoles),
                                          Mail = #{title => LuckyTitle,
                                                   content => LuckyContent,
                                                   items => LuckyRewards},
                                          mail:send(Rid, Mail),
                                          push_lucky_dogs(Rid);
                                      (_) -> ok
                                  end,
                                  ZoneRoles),
                    ok;
                _ ->
                    logger:error("配置问题", [], camp_fashion_vote, 256),
                    ok
            end,
            save_vote_lucky(LuckyDogs);
        _ -> ok
    end,
    {noreply, State};
handle_cast(init_data, State) ->
    ets:delete_all_objects(camp_fashion_vote_role),
    ets:delete_all_objects(camp_fashion_vote_lucky),
    ets:delete_all_objects(camp_fashion_vote_invite),
    dets:delete_all_objects(camp_fashion_vote_role),
    dets:delete_all_objects(camp_fashion_vote_lucky),
    dets:delete_all_objects(camp_fashion_vote_invite),
    {noreply, State};
handle_cast(reload,
            #state{refresh_ref = OldRef,
                   notice_ref = OldNoticeRef}) ->
    logger:info("区服收到重载消息", [], camp_fashion_vote, 275),
    stop_timer([OldRef, OldNoticeRef]),
    Now = date:unixtime(),
    NewState = case camp_fashion_vote_data:get_etc_config()
                   of
                   [#{notice_time := NoticeTime, refresh_rewards := R0,
                      refresh_times := T0}] ->
                       NoticeTime1 = date:datetime_to_seconds(NoticeTime),
                       NoticeRef = case NoticeTime1 > Now of
                                       true ->
                                           erlang:send_after((NoticeTime1 - Now)
                                                                 * 1000,
                                                             self(),
                                                             notice_mail);
                                       _ -> undefind
                                   end,
                       {RefreshRef, T, R} = case get_first_time(T0, R0) of
                                                {ok, {Time, T1, R1}} ->
                                                    Ref =
                                                        erlang:send_after((Time
                                                                               -
                                                                               Now)
                                                                              *
                                                                              1000,
                                                                          self(),
                                                                          refresh_mail),
                                                    {Ref, T1, R1};
                                                _ -> {undefind, [], []}
                                            end,
                       #state{refresh_ref = RefreshRef, notice_ref = NoticeRef,
                              refresh_rewards = R, refresh_time = T};
                   _ -> #state{}
               end,
    {noreply, NewState};
handle_cast(reload_camp, State) ->
    role_group:apply(world, {campaign, push_camp, []}),
    {noreply, State};
handle_cast(_Request, State) -> {noreply, State}.

handle_info(notice_mail,
            State = #state{notice_ref = NoticeRef}) ->
    stop_timer(NoticeRef),
    ZoneRoles = ets:tab2list(camp_fashion_vote_role),
    lists:foreach(fun (#camp_fashion_vote_role{rid =
                                                   Rid}) ->
                          case camp_fashion_vote_data:get_etc_config() of
                              [#{notice_title := MailTitle,
                                 notice_content := MailContent}] ->
                                  mail:send(Rid, MailTitle, MailContent),
                                  ok;
                              _ ->
                                  logger:error("camp_fashion_vote_data提醒邮件配置错误",
                                               [],
                                               camp_fashion_vote,
                                               322),
                                  ok
                          end;
                      (_) -> ok
                  end,
                  ZoneRoles),
    {noreply, State#state{notice_ref = undefind}};
handle_info(push_camp, State) ->
    {OldRef, OTimes} = case get(ref_push_camp) of
                           {ORef, T} -> {ORef, T};
                           _ -> {undefind, 0}
                       end,
    stop_timer(OldRef),
    NewRef = case check_is_open() of
                 {ok, _CampID} ->
                     role_group:apply(world, {campaign, push_camp, []}),
                     undefind;
                 _ ->
                     case OTimes < 10 of
                         true ->
                             erlang:send_after(30 * 1000, self(), push_camp);
                         _ ->
                             logger:info("推送活动10次失败",
                                         [],
                                         camp_fashion_vote,
                                         349),
                             undefind
                     end
             end,
    case NewRef of
        undefind -> ok;
        _ -> put(ref_push_camp, {NewRef, OTimes + 1})
    end,
    {noreply, State};
handle_info(refresh_mail,
            State = #state{refresh_ref = RefreshRef,
                           refresh_rewards = [_ | Rewards],
                           refresh_time = [_ | Time]}) ->
    stop_timer(RefreshRef),
    Now = date:unixtime(),
    {NRefreshRef, T, R} = case get_first_time(Time, Rewards)
                              of
                              {ok, {Time1, T1, R1}} ->
                                  Ref = erlang:send_after((Time1 - Now) * 1000,
                                                          self(),
                                                          refresh_mail),
                                  {Ref, T1, R1};
                              _ -> {undefind, [], []}
                          end,
    NewState = State#state{refresh_ref = NRefreshRef,
                           refresh_rewards = R, refresh_time = T},
    info(refresh_mail_ticker),
    {noreply, NewState};
handle_info(refresh_mail_ticker, State) ->
    {OldRef, OldTimes} = case get(ref_refresh_mail_ticker)
                             of
                             {ORef, T} -> {ORef, T};
                             _ -> {undefind, 0}
                         end,
    stop_timer(OldRef),
    NewRef = case check_is_open() of
                 {ok, _CampID} ->
                     role_group:apply(world,
                                      {camp_fashion_vote, refresh_mail, [[]]}),
                     undefind;
                 _ ->
                     case OldTimes < 10 of
                         true ->
                             erlang:send_after(30 * 1000,
                                               self(),
                                               refresh_mail_ticker);
                         _ ->
                             logger:info("投票券邮件10次发送失败",
                                         [],
                                         camp_fashion_vote,
                                         396),
                             undefind
                     end
             end,
    case NewRef of
        undefind -> ok;
        _ ->
            put(ref_refresh_mail_ticker, {NewRef, OldTimes + 1})
    end,
    {noreply, State};
handle_info(_Info, State) ->
    logger:info("收到未知消息~w",
                [_Info],
                camp_fashion_vote,
                410),
    {noreply, State}.

terminate(_Reason, _State) -> ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

login(Role = #role{id = Rid, lev = Lev}) ->
    case check_is_open() of
        {ok, _CampID} when Lev >= 30 ->
            case get_vote_role(Rid) of
                {ok,
                 VoteRole1 = #camp_fashion_vote_role{update_time =
                                                         UpdateTime}} ->
                    NewVoteRole = case date:is_today(UpdateTime) of
                                      false ->
                                          VoteRole2 =
                                              refresh_vote_role(VoteRole1),
                                          cast({save_vote_role, VoteRole2}),
                                          push_vote_role(VoteRole2),
                                          VoteRole2;
                                      _ -> VoteRole1
                                  end,
                    big_world:cast(c_camp_fashion_vote,
                                   cast,
                                   [{add_vote_role, NewVoteRole}]);
                _ -> ok
            end,
            case var:get_var(Role, day, 625, 0) of
                0 ->
                    case camp_fashion_vote_data:get_etc_config() of
                        [#{refresh_title := MailTitle,
                           refresh_content := MailContent,
                           refresh_rewards := RRewards}] ->
                            case lists:keyfind(get_cur_days(), 1, RRewards) of
                                {_, Rewards} ->
                                    NewRole = var:set_var(Role, day, 625, 1),
                                    mail:send(Role,
                                              MailTitle,
                                              MailContent,
                                              Rewards),
                                    {ok, NewRole};
                                _ -> ok
                            end;
                        _ ->
                            logger:error("camp_fashion_vote_data刷新邮件配置错误",
                                         [],
                                         camp_fashion_vote,
                                         451),
                            ok
                    end;
                _ -> ok
            end;
        _ -> ok
    end.

zero_flush(#role{id = Rid, lev = Lev}, _) ->
    case check_is_open() of
        {ok, _CampID} when Lev >= 30 ->
            case get_vote_role(Rid) of
                {ok, VoteRole1} ->
                    NewVoteRole = refresh_vote_role(VoteRole1),
                    push_vote_role(NewVoteRole),
                    cast({save_vote_role, NewVoteRole});
                _ -> ok
            end;
        _ -> ok
    end.

levup(Role = #role{lev = Lev}) ->
    case check_is_open() of
        {ok, _CampID} when Lev >= 30 ->
            case var:get_var(Role, day, 625, 0) of
                0 ->
                    case camp_fashion_vote_data:get_etc_config() of
                        [#{refresh_title := MailTitle,
                           refresh_content := MailContent,
                           refresh_rewards := RRewards}] ->
                            case lists:keyfind(get_cur_days(), 1, RRewards) of
                                {_, Rewards} ->
                                    NewRole = var:set_var(Role, day, 625, 1),
                                    mail:send(NewRole,
                                              MailTitle,
                                              MailContent,
                                              Rewards),
                                    NewRole;
                                _ -> Role
                            end;
                        _ ->
                            logger:error("camp_fashion_vote_data刷新邮件配置错误",
                                         [],
                                         camp_fashion_vote,
                                         493),
                            Role
                    end;
                _ -> Role
            end;
        _ -> Role
    end.

vote(Role = #role{id = Rid}, GroupID) ->
    VoteRole = case get_vote_role(Rid) of
                   {ok, VoteRole1} -> VoteRole1;
                   _ ->
                       VoteRole2 = get_new_vote_role(Role),
                       cast({save_vote_role, VoteRole2}),
                       big_world:cast(c_camp_fashion_vote,
                                      cast,
                                      [{add_vote_role, VoteRole2}]),
                       VoteRole2
               end,
    #camp_fashion_vote_role{vote_times = VoteTimes,
                            voted_times = HaveVoteTimes} =
        VoteRole,
    case check_vote(Role,
                    [{vote_times, VoteTimes},
                     {vote_reward, HaveVoteTimes},
                     vote_loss,
                     camp_open])
        of
        {ok, Args} ->
            case lists:keyfind(vote_loss, 1, Args) of
                {vote_loss, VoteLoss} when length(VoteLoss) > 0 ->
                    VoteReward = case lists:keyfind(vote_reward, 1, Args) of
                                     {vote_reward, VR} when length(VR) > 0 ->
                                         VR;
                                     _ -> []
                                 end,
                    Gain = format:val_to_gain(VoteReward),
                    Loss = format:val_to_loss(VoteLoss),
                    role:send_buff_begin(),
                    case role_gain:do_notice(Gain ++ Loss,
                                             Role,
                                             lang:get("时装投票"))
                        of
                        {ok, Role1} ->
                            CArgs = #{rid => Rid, vote_num => 1,
                                      group_id => GroupID},
                            case big_world:call(c_camp_fashion_vote,
                                                call,
                                                [{vote, CArgs}])
                                of
                                {ok, {Rid, _TotalVote, _}} ->
                                    role:send_buff_flush(),
                                    SArgs = #{rid => Rid, group_id => GroupID},
                                    cast({role_vote, SArgs}),
                                    {ok, Role1};
                                {false, not_vote_role} ->
                                    role:send_buff_clean(),
                                    big_world:cast(c_camp_fashion_vote,
                                                   cast,
                                                   [{add_vote_role, VoteRole}]),
                                    {false, lang:get("服务器繁忙，请稍后重试")};
                                {false, Reason} ->
                                    role:send_buff_clean(),
                                    {false, Reason};
                                _ ->
                                    role:send_buff_clean(),
                                    {false, lang:get("服务器超时，投票失败")}
                            end;
                        {false, #loss{msg = Msg}} ->
                            role:send_buff_clean(),
                            {false, Msg};
                        {false, #gain{msg = Msg}} ->
                            role:send_buff_clean(),
                            {false, Msg};
                        _ -> {false, lang:get("投票失败")}
                    end;
                _ -> {false, lang:get("投票失败")}
            end;
        {false, Reason} -> {false, Reason};
        _ -> {false, lang:get("系统错误")}
    end.

check_vote(Role, List) -> check_vote(Role, List, []).

check_vote(_Role, [], Args) -> {ok, Args};
check_vote(Role = #role{lev = Lev}, [camp_open | T],
           Args) ->
    case check_is_open() of
        {ok, _CampID} when Lev >= 30 ->
            check_vote(Role, T, Args);
        _ -> {false, lang:get("活动尚未开启")}
    end;
check_vote(Role, [{vote_times, VoteTimes} | T], Args) ->
    case VoteTimes > 0 of
        true ->
            NArgs = [{vote_times, VoteTimes - 1} | Args],
            check_vote(Role, T, NArgs);
        _ -> {false, lang:get("今天投票都完成了，获奖几率大大提升{face_1,3}")}
    end;
check_vote(Role, [{vote_reward, VoteTimes} | T],
           Args) ->
    case camp_fashion_vote_data:get_etc_config() of
        [#{vote_rewards := VR,
           max_vote_reward := MaxVoteReward}] ->
            NArgs = case MaxVoteReward > VoteTimes of
                        true -> [{vote_reward, VR} | Args];
                        _ -> Args
                    end,
            check_vote(Role, T, NArgs);
        _ ->
            logger:error("camp_fashion_vote_data投票奖励配置错误",
                         [],
                         camp_fashion_vote,
                         600),
            {false, lang:get("投票奖励配置错误")}
    end;
check_vote(Role, [vote_loss | T], Args) ->
    case camp_fashion_vote_data:get_etc_config() of
        [#{vote_loss := VL}] when length(VL) > 0 ->
            Days = get_cur_days(),
            case lists:keyfind(Days, 1, VL) of
                {Days, Loss} ->
                    NArgs = [{vote_loss, Loss} | Args],
                    check_vote(Role, T, NArgs);
                _ ->
                    logger:error("camp_fashion_vote_data投票消耗配置错误",
                                 [],
                                 camp_fashion_vote,
                                 612),
                    {false, lang:get("投票奖励配置错误")}
            end;
        _ ->
            logger:error("camp_fashion_vote_data投票消耗配置错误",
                         [],
                         camp_fashion_vote,
                         616),
            {false, lang:get("投票奖励配置错误")}
    end.

invite_vote(Role = #role{id = Rid}, FID, GroupID) ->
    Key = {Rid, FID, GroupID},
    case check_invite_vote(Role,
                           [{group_id, GroupID},
                            {friend, FID},
                            invite_vote,
                            {invited, Key},
                            camp_open])
        of
        {ok, Args} ->
            case lists:keyfind(invited, 1, Args) of
                {invited,
                 Invite = #camp_fashion_vote_invite{invite_key = Key}} ->
                    CArgs = #{rid => Rid, friend_id => FID, invite_num => 1,
                              group_id => GroupID},
                    case big_world:call(c_camp_fashion_vote,
                                        call,
                                        [{invite_vote, CArgs}])
                        of
                        {ok, _} ->
                            cast({save_vote_invite,
                                  Invite#camp_fashion_vote_invite{invite_time =
                                                                      date:unixtime()}}),
                            ok;
                        {false, Reason} -> {false, Reason};
                        _ -> {false, lang:get("服务器超时，拉票失败")}
                    end;
                _ -> {false, lang:get("拉票好友失败了")}
            end;
        {false, Reason} -> {false, Reason};
        _ -> {false, lang:get("拉票好友失败")}
    end.

check_invite_vote(Role, Con) ->
    check_invite_vote(Role, Con, []).

check_invite_vote(_Role, [], Args) -> {ok, Args};
check_invite_vote(Role = #role{lev = Lev},
                  [camp_open | T], Args) ->
    case check_is_open() of
        {ok, _CampID} when Lev >= 30 ->
            check_vote(Role, T, Args);
        _ -> {false, lang:get("活动尚未开启")}
    end;
check_invite_vote(Role, [{group_id, GroupID} | T],
                  Args) ->
    case get_vote_role(Role) of
        {ok,
         #camp_fashion_vote_role{vote_groups = VoteGroups}} ->
            case lists:keyfind(GroupID, 1, VoteGroups) of
                {GroupID, VoteNum} when VoteNum > 0 ->
                    check_invite_vote(Role, T, Args);
                _ -> {false, lang:get("请先选择心仪的时装进行投票吧{face_1,57}")}
            end;
        _ -> {false, lang:get("找不到投票数据")}
    end;
check_invite_vote(Role, [vote_role | T], Args) ->
    case get_vote_role(Role) of
        {ok, VR = #camp_fashion_vote_role{}} ->
            NewArgs = [{vote_role, VR} | Args],
            check_invite_vote(Role, T, NewArgs);
        _ -> {false, lang:get("请先选择心仪的时装进行投票吧{face_1,57}")}
    end;
check_invite_vote(Role, [{invited, Key} | T], Args) ->
    case get_vote_invite(Key) of
        {ok,
         Invite1 = #camp_fashion_vote_invite{invite_state =
                                                 InviteState}} ->
            case InviteState of
                1 -> {false, lang:get("已发送拉票求助，耐心等候好友投票吧{face_1,54}")};
                2 -> {false, lang:get("Ta已经帮您投过票咯{face_1,56}")};
                3 -> {false, lang:get("您的好友今天已经拒绝您的拉票")};
                4 ->
                    Invite2 = Invite1#camp_fashion_vote_invite{invite_state
                                                                   = 1},
                    NewArgs1 = [{invited, Invite2} | Args],
                    check_invite_vote(Role, T, NewArgs1)
            end;
        _ ->
            {Rid, Fid, GroupID} = Key,
            Invite = #camp_fashion_vote_invite{invite_key = Key,
                                               invite_id = Rid, replay_id = Fid,
                                               group_id = GroupID},
            NewArgs = [{invited, Invite} | Args],
            check_invite_vote(Role, T, NewArgs)
    end;
check_invite_vote(Role, [invite_vote | T], Args) ->
    case get_vote_role(Role) of
        {ok,
         #camp_fashion_vote_role{invite_votes = InviteVotes}} ->
            case InviteVotes > 0 of
                true -> check_invite_vote(Role, T, Args);
                _ -> {false, lang:get("今天已经完成投票，感谢参与{face_1,3}")}
            end;
        _ -> {false, lang:get("找不到投票数据")}
    end;
check_invite_vote(Role = #role{id = Rid},
                  [{friend, FriendID} | T], Args) ->
    case friend:is_friend(Rid, FriendID) of
        true -> check_invite_vote(Role, T, Args);
        _ -> {false, lang:get("Ta还不是您的好友，添加好友后再拉票吧{face_1,3}")}
    end.

reply_invite(Role = #role{id = Rid, name = Name}, Fid,
             _Code, GroupID) ->
    Key = {Fid, Rid, GroupID},
    StateCode = 2,
    case check_reply_invite(Role,
                            [reply_times,
                             {invited, Key, StateCode},
                             {invite_role, Fid},
                             camp_open])
        of
        {ok, Args} ->
            case lists:keyfind(invited, 1, Args) of
                {invited, Invite} ->
                    CArgs = #{rid => Fid, vote_num => 1,
                              group_id => GroupID},
                    case big_world:call(c_camp_fashion_vote,
                                        call,
                                        [{vote, CArgs}])
                        of
                        {ok, {Fid, TotalVote, _}} ->
                            RArgs = #{invite_id => Fid, reply_id => Rid,
                                      group_id => GroupID,
                                      total_vote => TotalVote},
                            cast({reply_intive_vote, RArgs}),
                            cast({save_vote_invite, Invite}),
                            case camp_fashion_vote_data:get_etc_config() of
                                [#{invite_title := InviteTitle,
                                   invite_content := InviteContent,
                                   invite_rewards := InviteRewards}]
                                    when length(InviteRewards) > 0 ->
                                    Days = get_cur_days(),
                                    NewContent = notice:replace_msg2([{"#name#",
                                                                       [Name]}],
                                                                     InviteContent),
                                    NewReward = case lists:keyfind(Days,
                                                                   1,
                                                                   InviteRewards)
                                                    of
                                                    {Days, R} -> R;
                                                    _ -> []
                                                end,
                                    mail:send(Fid,
                                              InviteTitle,
                                              NewContent,
                                              NewReward),
                                    ok;
                                _ -> ok
                            end,
                            {reply_times, ReplyInvites} =
                                lists:keyfind(reply_times, 1, Args),
                            case camp_fashion_vote_data:get_etc_config() of
                                [#{max_reply_reward := MaxReplyReward,
                                   reply_rewards := ReplyReward}]
                                    when ReplyInvites < MaxReplyReward andalso
                                             length(ReplyReward) > 0 ->
                                    Gain = format:val_to_gain(ReplyReward),
                                    role:send_buff_begin(),
                                    case role_gain:do_notice(Gain,
                                                             Role,
                                                             lang:get("回应拉票奖励"))
                                        of
                                        {ok, Role1} ->
                                            role:send_buff_flush(),
                                            {ok, Role1};
                                        _ ->
                                            role:send_buff_clean(),
                                            mail:send(Role,
                                                      #{title =>
                                                            lang:get("回应拉票奖励"),
                                                        content =>
                                                            lang:get("背包已满，回应拉票奖励获得以下道具"),
                                                        items => ReplyReward}),
                                            {ok, Role}
                                    end;
                                _ -> {ok, Role}
                            end;
                        {false, Reason} -> {false, Reason};
                        _ERR -> {false, lang:get("服务器超时，回应拉票失败")}
                    end;
                _ -> {false, lang:get("拉票信息错误")}
            end;
        {false, Reason} -> {false, Reason};
        _ -> {false, lang:get("回应拉票失败")}
    end.

check_reply_invite(Role, Cons) ->
    check_reply_invite(Role, Cons, []).

check_reply_invite(_Role, [], Args) -> {ok, Args};
check_reply_invite(Role = #role{lev = Lev},
                   [camp_open | T], Args) ->
    case check_is_open() of
        {ok, _CampID} when Lev >= 30 ->
            check_reply_invite(Role, T, Args);
        _ -> {false, lang:get("活动已关闭")}
    end;
check_reply_invite(Role, [reply_times | T], Args) ->
    VoteRole = case get_vote_role(Role) of
                   {ok, VR} -> VR;
                   _ ->
                       VR1 = get_new_vote_role(Role),
                       cast({save_vote_role, VR1}),
                       big_world:cast(c_camp_fashion_vote,
                                      cast,
                                      [{add_vote_role, VR1}]),
                       VR1
               end,
    #camp_fashion_vote_role{reply_invites = ReplyInvites} =
        VoteRole,
    case camp_fashion_vote_data:get_etc_config() of
        [#{max_reply := MaxReply}] ->
            case ReplyInvites >= MaxReply of
                true ->
                    {false,
                     notice:format(lang:get("今天的~ts次拉票已完成，祝您好运{face_1,9}"),
                                   [{string_2, 5, MaxReply}])};
                _ ->
                    check_reply_invite(Role,
                                       T,
                                       [{reply_times, ReplyInvites} | Args])
            end;
        _ ->
            logger:error("回应拉票次数限制配置错误",
                         [],
                         camp_fashion_vote,
                         817),
            {false, lang:get("回应拉票次数限制配置错误")}
    end;
check_reply_invite(Role, [{invite_role, Fid} | T],
                   Args) ->
    case get_vote_role(Fid) of
        {ok,
         #camp_fashion_vote_role{invite_votes = InviteVotes}} ->
            case InviteVotes =< 0 of
                true -> {false, lang:get("已有好友帮对方投票了哟{face_1,21}")};
                _ -> check_reply_invite(Role, T, Args)
            end;
        _ -> {false, lang:get("好友尚未向拉票")}
    end;
check_reply_invite(Role,
                   [{invited, Key, StateCode} | T], Args) ->
    case get_vote_invite(Key) of
        {ok,
         Invite = #camp_fashion_vote_invite{invite_state =
                                                InviteState}} ->
            case InviteState of
                1 ->
                    NewInvite = Invite#camp_fashion_vote_invite{invite_state
                                                                    =
                                                                    StateCode},
                    NewArgs = [{invited, NewInvite} | Args],
                    check_reply_invite(Role, T, NewArgs);
                2 -> {false, lang:get("您已经帮TA投上一票了哟{face_1,3}")};
                3 -> {false, lang:get("您已经拒绝了好友的拉票")};
                4 -> {false, lang:get("拉票信息已过期，感谢你的帮助{face_1,3}")}
            end
    end.

get_vote_role(#role{id = Rid}) -> get_vote_role(Rid);
get_vote_role(Rid) ->
    case ets:lookup(camp_fashion_vote_role, Rid) of
        [VoteRole = #camp_fashion_vote_role{} | _] ->
            {ok, VoteRole};
        _ -> false
    end.

get_vote_invite(Key) ->
    case ets:lookup(camp_fashion_vote_invite, Key) of
        [Invite = #camp_fashion_vote_invite{invite_key = Key,
                                            invite_time = InviteTime}
         | _] ->
            NewInvite = case date:is_today(InviteTime) of
                            true -> Invite;
                            _ ->
                                Invite#camp_fashion_vote_invite{invite_state =
                                                                    4}
                        end,
            {ok, NewInvite};
        _ -> false
    end.

push_config(Role) ->
    case camp_fashion_vote_data:get_etc_config() of
        [#{init_vote := InitVote, init_invite := InitInvite,
           camp_id := CampID, show_start_time := ShowStartTime,
           vote_loss := VoteLoss, max_vote_reward := MaxVoteReward,
           max_reply := MaxReply,
           max_reply_reward := MaxReplyReward}] ->
            case campaign_data:get(CampID) of
                #camp_cfg{start_time = StartTime,
                          end_time = _EndTime} ->
                    Groups = camp_fashion_vote_data:group_list(),
                    ShowTime = date:datetime_to_seconds(ShowStartTime),
                    Data = {InitVote,
                            InitInvite,
                            StartTime,
                            ShowTime,
                            Groups,
                            VoteLoss,
                            MaxVoteReward,
                            MaxReply,
                            MaxReplyReward},
                    role:pack_send(Role, 20409, Data),
                    ok;
                _ ->
                    logger:error(lang:get("campaign_data配置错误"),
                                 [],
                                 camp_fashion_vote,
                                 889),
                    ok
            end;
        _ ->
            logger:error("camp_fashion_vote_data配置错误",
                         [],
                         camp_fashion_vote,
                         893),
            ok
    end.

push_vote_role(Rid = {_, _, _}) ->
    case get_vote_role(Rid) of
        {ok, VR} -> push_vote_role(VR);
        _ -> ok
    end;
push_vote_role(Role = #role{id = Rid, lev = Lev}) ->
    case check_is_open() of
        {ok, _CampID} when Lev >= 30 ->
            VoteRole = case get_vote_role(Rid) of
                           {ok, VR} -> VR;
                           _ ->
                               VoteRole1 = get_new_vote_role(Role),
                               cast({save_vote_role, VoteRole1}),
                               big_world:cast(c_camp_fashion_vote,
                                              cast,
                                              [{add_vote_role, VoteRole1}]),
                               VoteRole1
                       end,
            push_vote_role(VoteRole);
        _ -> ok
    end;
push_vote_role(#camp_fashion_vote_role{rid = Rid,
                                       vote_times = VoteTimes,
                                       invite_votes = InviteVotes,
                                       vote_groups = VoteGroups,
                                       reply_invites = ReplyInvites,
                                       voted_times = HaveVotes}) ->
    Data = {VoteTimes,
            InviteVotes,
            VoteGroups,
            ReplyInvites,
            HaveVotes},
    role:pack_send(Rid, 20410, Data),
    ok.

push_lucky_dogs(all) ->
    Groups = get_all_group(),
    role_group:pack_send(world, 20414, {Groups});
push_lucky_dogs(Rid = {_, _, _}) ->
    Groups = get_all_group(),
    role_group:pack_send(Rid, 20414, {Groups});
push_lucky_dogs(#role{id = Rid, lev = Lev}) ->
    Groups = get_all_group(),
    case Groups of
        [] ->
            case check_is_open() of
                {ok, _CampID} when Lev >= 30 ->
                    CArgs = #{rid => Rid},
                    big_world:cast(c_camp_fashion_vote,
                                   cast,
                                   [{get_lucky_dogs, CArgs}]),
                    ok;
                _ -> ok
            end;
        _ -> ok
    end,
    role:pack_send(Rid, 20414, {Groups}),
    ok.

notice_mail(Role) ->
    case camp_fashion_vote_data:get_etc_config() of
        [#{notice_title := MailTitle,
           notice_content := MailContent}] ->
            mail:send(Role, MailTitle, MailContent),
            ok;
        _ ->
            logger:error("camp_fashion_vote_data提醒邮件配置错误",
                         [],
                         camp_fashion_vote,
                         957),
            ok
    end.

refresh_mail(Role = #role{lev = Lev}, _Rewards) ->
    logger:debug("收到发送邮件", [], camp_fashion_vote, 963),
    case check_is_open() of
        {ok, _CampID} when Lev >= 30 ->
            case var:get_var(Role, day, 625, 0) of
                0 ->
                    case camp_fashion_vote_data:get_etc_config() of
                        [#{refresh_title := MailTitle,
                           refresh_content := MailContent,
                           refresh_rewards := RRewards}] ->
                            case lists:keyfind(get_cur_days(), 1, RRewards) of
                                {_, Rewards} ->
                                    NewRole = var:set_var(Role, day, 625, 1),
                                    mail:send(NewRole,
                                              MailTitle,
                                              MailContent,
                                              Rewards),
                                    {ok, NewRole};
                                _ -> ok
                            end;
                        _ ->
                            logger:error("camp_fashion_vote_data刷新邮件配置错误",
                                         [],
                                         camp_fashion_vote,
                                         979),
                            ok
                    end;
                _ -> ok
            end;
        _ ->
            logger:debug("kkkkkkkkkkkkkkkkkkkkkkkkk",
                         [],
                         camp_fashion_vote,
                         986),
            ok
    end.

do_lucky_dogs(#role{id = Rid, classes = Classes,
                    sex = Sex},
              Args) ->
    #{lucky_scroll := LuckyScroll,
      lucky_legend := LuckyLegend, lucky_title := LuckyTitle,
      lucky_content := LuckyContent,
      lucky_roles := LuckyRoles} =
        Args,
    role:pack_send(Rid, 9902, {10, LuckyLegend, []}),
    role:pack_send(Rid, 9902, {11, LuckyScroll, []}),
    LuckyRewards = lists:foldl(fun ({Rid0, _, GroupID}, Acc)
                                       when Rid0 =:= Rid ->
                                       case
                                           camp_fashion_vote_data:get_group(GroupID,
                                                                            Classes,
                                                                            Sex)
                                           of
                                           {_SetName, R} -> R ++ Acc;
                                           _ -> Acc
                                       end;
                                   (_, Acc) -> Acc
                               end,
                               [],
                               LuckyRoles),
    Mail = #{title => LuckyTitle, content => LuckyContent,
             items => LuckyRewards},
    mail:send(Rid, Mail),
    push_lucky_dogs(Rid),
    ok.

role_lucky_dogs(LuckyDogs, Rid) ->
    case check_is_open() of
        {ok, _CampID} ->
            save_vote_lucky(LuckyDogs),
            push_lucky_dogs(Rid);
        _ -> ok
    end.

check_is_open() ->
    case camp_fashion_vote_data:get_etc_config() of
        [#{camp_id := CampID}] ->
            Now = date:unixtime(),
            case campaign_mgr:lookup_camp(CampID) of
                #camp_cache{id = CampID, start_time = ST, end_time = ET}
                    when Now >= ST andalso Now < ET ->
                    {ok, CampID};
                _ -> 0
            end;
        _ ->
            logger:error("camp_fashion_vote_data活动id配置错误",
                         [],
                         camp_fashion_vote,
                         1031),
            0
    end.

check_invite_state(#role{id = Rid}, Fid, GroupID) ->
    Key = {Fid, Rid, GroupID},
    case get_vote_invite(Key) of
        {ok,
         #camp_fashion_vote_invite{invite_state =
                                       InviteState}} ->
            {ok, InviteState};
        _ -> {ok, 0}
    end.

refresh_vote_role(OldVoteRole) ->
    {VoteTimes, InviteVotes} = case
                                   camp_fashion_vote_data:get_etc_config()
                                   of
                                   [#{init_vote := VTimes,
                                      init_invite := IVotes}] ->
                                       {VTimes, IVotes};
                                   _ ->
                                       logger:error("camp_fashion_vote_data投票次数配置错误",
                                                    [],
                                                    camp_fashion_vote,
                                                    1050),
                                       {1, 1}
                               end,
    OldVoteRole#camp_fashion_vote_role{voted_times = 0,
                                       reply_invites = 0,
                                       vote_times = VoteTimes,
                                       invite_votes = InviteVotes,
                                       update_time = date:unixtime()}.

get_server_name({_Id, Platform, ZoneId}) ->
    case server_list_data:get_server_name({Platform,
                                           ZoneId})
        of
        false -> lang:get("神秘大陆");
        ServerName -> ServerName
    end.

get_cur_days() ->
    case camp_fashion_vote_data:get_etc_config() of
        [#{camp_id := CampID}] ->
            case campaign_mgr:lookup_camp(CampID) of
                #camp_cache{id = CampID, start_time = StatTime} ->
                    date:day_diff(StatTime, date:unixtime()) + 1;
                _ -> 0
            end;
        _ ->
            logger:error("camp_fashion_vote_data活动id配置错误",
                         [],
                         camp_fashion_vote,
                         1073),
            0
    end.

get_new_vote_role(#role{id = Rid, name = Name,
                        lev = Lev, classes = Classes, sex = Sex}) ->
    {VoteTimes, InviteVotes} = case
                                   camp_fashion_vote_data:get_etc_config()
                                   of
                                   [#{init_vote := VTimes,
                                      init_invite := IVotes}] ->
                                       {VTimes, IVotes};
                                   _ ->
                                       logger:error("camp_fashion_vote_data投票次数配置错误",
                                                    [],
                                                    camp_fashion_vote,
                                                    1083),
                                       {1, 1}
                               end,
    ZoneName = get_server_name(Rid),
    #camp_fashion_vote_role{rid = Rid, name = Name,
                            lev = Lev, classes = Classes, sex = Sex,
                            vote_times = VoteTimes, invite_votes = InviteVotes,
                            update_time = date:unixtime(),
                            zone_name = ZoneName}.

get_all_group() ->
    ets:tab2list(camp_fashion_vote_lucky).

save_vote_role(VoteRole) ->
    ets:insert(camp_fashion_vote_role, VoteRole),
    dets:insert(camp_fashion_vote_role, VoteRole).

save_vote_invite(VoteInvite) ->
    ets:insert(camp_fashion_vote_invite, VoteInvite),
    dets:insert(camp_fashion_vote_invite, VoteInvite).

save_vote_lucky(VoteLucky) ->
    ets:insert(camp_fashion_vote_lucky, VoteLucky),
    dets:insert(camp_fashion_vote_lucky, VoteLucky).

stop_timer([]) -> ok;
stop_timer([Ref | T]) ->
    stop_timer(Ref),
    stop_timer(T);
stop_timer(Ref) when is_reference(Ref) ->
    catch erlang:cancel_timer(Ref);
stop_timer(_) -> ok.

