-file("src/mod/guild/guild_truth_dare_mgr.erl", 1).

-module(guild_truth_dare_mgr).

-author("Suhan").

-behaviour(gen_fsm).

-export([init/1,
         handle_event/3,
         handle_sync_event/4,
         handle_info/3,
         terminate/3,
         code_change/4]).

-export([idle/2, ready/2, active/2]).

-export([start_link/0,
         next/0,
         load_sys_question/0,
         call/1,
         cast/1,
         info/1]).

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

-file("src/mod/guild/guild_truth_dare_mgr.erl", 35).

-file("inc/guild.hrl", 1).

-type guild_id() :: {non_neg_integer(),
                     list(),
                     non_neg_integer()}.

-record(guild_apply,
        {id = {0, "", 0},
         name = "",
         classes = 0,
         sex = 0,
         lev = 1,
         time = 0,
         type = 0,
         looks = [],
         cup = 0 :: non_neg_integer(),
         donation = 0 :: non_neg_integer(),
         tag = 0 :: non_neg_integer(),
         msg = "" :: string()}).

-record(guild_envelop,
        {ver = 1,
         title = "" :: string(),
         amount = 0 :: non_neg_integer(),
         remain = 0 :: non_neg_integer(),
         total = 0 :: non_neg_integer(),
         num = 0 :: non_neg_integer(),
         time = 0 :: non_neg_integer(),
         packs = [],
         log = [] :: list()}).

-record(guild_role,
        {id = {1, "", 0} ::
             {pos_integer(), list(), non_neg_integer()},
         pid :: undefined | pid(),
         name = "" :: list(),
         sex = 0 :: 0 | 1,
         classes = 0 :: 0..4,
         lev = 1 :: pos_integer(),
         lev_break_times = 0 :: non_neg_integer(),
         fc = 1 :: pos_integer(),
         synth_fc = 1 :: pos_integer(),
         post = 0 :: 0..5,
         status = 0 :: 0 | 1,
         last_login = 1 :: pos_integer(),
         last_logout = 1 :: pos_integer(),
         enter_time = 0 :: non_neg_integer(),
         signature = "" :: list(),
         value = 0,
         total_value = 0 :: non_neg_integer(),
         cup = 0 :: non_neg_integer(),
         looks = [],
         envelope = #guild_envelop{},
         requirement = [],
         signed = 0 :: non_neg_integer(),
         last_signed = 0 :: non_neg_integer(),
         mails = [],
         active = 0,
         ability = 0,
         chat_num = 0,
         doing = 0,
         chat_num_list = [],
         doing_list = [],
         element_attr = [] :: list(),
         tmp_element_attr = [] :: list()}).

-record(guild_leaver,
        {id = {1, "", 0} ::
             {pos_integer(), list(), non_neg_integer()},
         name = "" :: list(),
         guild_id = {1, "", 0} ::
             {pos_integer(), list(), non_neg_integer()},
         value = 0,
         total_value = 0 :: non_neg_integer(),
         time = 0 :: integer()}).

-record(guild_boss,
        {lev = 1 :: non_neg_integer(),
         step = 1 :: non_neg_integer(),
         unit_id = 0 :: non_neg_integer(),
         name = "",
         hp = 0 :: non_neg_integer(),
         hp_max = 0 :: non_neg_integer(),
         exp = 0 :: non_neg_integer(),
         called = 0 :: integer(),
         log = [] :: list(),
         last_renamed = 0 :: non_neg_integer()}).

-record(guild_mercenary,
        {id = {0, "", 0},
         key :: undefined | tuple(),
         lev = 0 :: non_neg_integer(),
         name = "" :: string(),
         dispatched = 0 :: non_neg_integer(),
         recruited = 0 :: non_neg_integer(),
         score = 0 :: non_neg_integer(),
         gain = [],
         guard :: undefined | tuple()}).

-record(guild_totem,
        {ver = 0 :: non_neg_integer(),
         id = util:rand_list([101, 102, 103, 104, 105]) ::
             non_neg_integer(),
         changeable = 1 :: non_neg_integer(),
         last_changed = 0 :: non_neg_integer()}).

-record(guild_question_answer,
        {ver = 0,
         id = {0, "", 0},
         name = "" :: string(),
         sex = 0 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         guild_name = "" :: string(),
         option = 0 :: 0..4,
         result = 0 :: 0 | 1,
         score = 0 :: non_neg_integer(),
         answered = 0 :: non_neg_integer(),
         totem_id = 0 :: non_neg_integer(),
         rank = 0 :: non_neg_integer()}).

-record(guild_question,
        {ver = 0,
         id = 0 :: non_neg_integer(),
         answer = 0 :: 0..4,
         asked = 0 :: non_neg_integer(),
         answers = [] :: [#guild_question_answer{}],
         cheat_off = [],
         asked_num = 0 :: non_neg_integer(),
         cheat_nums = []}).

-record(guild_robber,
        {ver = 0 :: non_neg_integer(),
         id :: undefined | tuple(),
         today_generated = 0 :: non_neg_integer(),
         gen_hour = 0 :: non_neg_integer(),
         gen_time = 0 :: non_neg_integer(),
         total_killed = 0 :: non_neg_integer(),
         last_killed = 0 :: non_neg_integer(),
         killed_time = 0 :: non_neg_integer(),
         fighters = [],
         picker = []}).

-record(guild_treasure,
        {ver = 1 :: non_neg_integer(),
         added = 0 :: non_neg_integer(),
         setting_chance = 0 :: non_neg_integer(),
         setting_time = 0 :: non_neg_integer(),
         gen_time = 0 :: non_neg_integer(),
         generated = 0 :: non_neg_integer(),
         unit_num = 0 :: non_neg_integer(),
         total_killed = 0 :: non_neg_integer(),
         last_killed = 0 :: non_neg_integer(),
         killed_time = 0 :: non_neg_integer(),
         can_open = 0 :: 0,
         fighters = [],
         picker = [],
         type = win}).

-record(guild_loot,
        {ver = 0, items = [], log = [], allocated = []}).

-record(guild_usurper,
        {ver = 0,
         id :: undefined | tuple(),
         name = "" :: string(),
         classes = 0,
         sex = 0,
         ctime = 0 :: integer()}).

-record(guild_invitation,
        {ver = 0,
         id :: undefined | tuple(),
         name = "" :: string(),
         classes = 0,
         sex = 0,
         lev = 0,
         ctime = 0 :: integer(),
         guild_id :: undefined | tuple(),
         guild_name = "" :: string()}).

-record(guild_plant_irrigator,
        {id = {0, "", 0} :: tuple(),
         name = "" :: string(),
         classes = 0,
         sex = 0,
         ctime = 0 :: integer()}).

-record(guild_plant,
        {ver = 0,
         pos = {0, 0},
         owner_rid = {0, "", 0},
         owner_name = "",
         irrigations = [],
         phase = 0,
         sowed = 0,
         matured = 0,
         fired = 0 :: 0 | 1,
         unit_id = {0, 0},
         unit_base_id = 0}).

-record(guild_union_apply,
        {ver = 0,
         id = {0, "", 0},
         name = "" :: string(),
         leader_id = {0, "", 0},
         leader_name = "" :: string(),
         ctime = 0 :: integer()}).

-record(guild_campaign,
        {acc = [] :: list(),
         can_reward = [] :: list(),
         rewarded = [] :: list()}).

-record(guild_camp_web,
        {acc = [] :: list(),
         can_reward = [] :: list(),
         rewarded = [] :: list(),
         overdue_time = 0 :: non_neg_integer(),
         end_reward = [] :: list(),
         time_list = [] :: list()}).

-record(element_info,
        {ver = 1, build_type = 0, lev = 1, time = 0}).

-record(guild,
        {id = {0, "", 0} ::
             {non_neg_integer(), list(), non_neg_integer()},
         ver = 21 :: non_neg_integer(),
         name = "" :: list(),
         assets = 5000000,
         max_assets = 5000000,
         upkeep = 0,
         pid :: undefined | pid(),
         leader_name = "" :: list(),
         leader_id = {0, "", 0} ::
             {non_neg_integer(), list(), non_neg_integer()},
         leader_sex = 0 :: 0 | 1,
         leader_classes = 0 :: 0..6,
         leader_lev = 0 :: non_neg_integer(),
         members = [] :: [#guild_role{}],
         mem_num = 0 :: non_neg_integer(),
         fresh_num = 0 :: non_neg_integer(),
         max_mem_num = 90,
         max_fresh_num = 100,
         board = "" :: list(),
         health = 100,
         join_type = 2,
         join_condition = [],
         apply_list = [],
         event_list = [],
         lev = 1 :: pos_integer(),
         lev_time = 0 :: non_neg_integer(),
         academy_lev = 0 :: non_neg_integer(),
         academy_time = 0 :: non_neg_integer(),
         store_lev = 0 :: non_neg_integer(),
         store_time = 0 :: non_neg_integer(),
         exchequer_lev = 0 :: non_neg_integer(),
         exchequer_time = 0 :: non_neg_integer(),
         lev_ref :: undefined | reference(),
         welfare_time = 0,
         welfare_list = [],
         store_tick_time = 0,
         store_list = [],
         create_time = 0,
         flag = 0,
         map_pid = 0,
         map_id = 0,
         boss = #guild_boss{},
         mercenarys = [] :: [#guild_mercenary{}],
         totem = #guild_totem{} :: #guild_totem{},
         question = #guild_question{},
         robber_num = 0 :: non_neg_integer(),
         robber_total_num = 0 :: non_neg_integer(),
         usurpers = [],
         activity = 0,
         plants = [],
         announcement = "" :: string(),
         union_applys = [] :: list(),
         union_applied = [] :: list(),
         today_used_medal = 0 :: integer(),
         last_medal_used = 0 :: integer(),
         today_upgraded_build = 0 :: integer(),
         last_build_upgraded = 0 :: integer(),
         today_destory_build = 0 :: integer(),
         last_build_destory = 0 :: integer(),
         treasure = #guild_treasure{},
         loot = #guild_loot{},
         week_assets = 0 :: integer(),
         formalizing_lev = 35 :: integer(),
         name_used = "" :: string(),
         create_id = {0, "", 0},
         create_name = "",
         guild_camp = #guild_campaign{},
         guild_camp_web = #guild_camp_web{},
         max_chat_num = 0,
         max_doing = 0,
         max_fc = 0,
         max_synth_fc = 0,
         element_info = [],
         uplev_element_times = 0,
         last_uplev_element = 0,
         upgrade_element_time = 0,
         mail_list = [],
         limit_mode = 0,
         is_lock_board = 0,
         board_id = {0, "", 0},
         announce_id = {0, "", 0}}).

-record(guild_element_attr,
        {ver = 1,
         effect_obj = 1,
         attr = [],
         attr_snd = [],
         add_skill_list = [],
         high_attr = [],
         end_time = 0}).

-record(m_guild,
        {ver = 3 :: pos_integer(),
         id = {0, "", 0} ::
             {non_neg_integer(), list(), non_neg_integer()},
         name = "" :: list(),
         pid :: undefined | pid(),
         enter_time = 0,
         guild_lev = 1,
         post = 0 :: non_neg_integer(),
         value = 0,
         total_value = 0 :: non_neg_integer(),
         signature = "" :: list(),
         element_attr = [] :: list(),
         tmp_element_attr = [] :: list(),
         build_speed_num = 0 :: non_neg_integer()}).

-record(guild_emblem,
        {ver = 0, id = 0, type = 0, lev = 0}).

-record(m_guild_emblem,
        {ver = 0 :: non_neg_integer(),
         remain_point = 0 :: non_neg_integer(),
         total_point = 0 :: non_neg_integer(),
         emblems = []}).

-file("src/mod/guild/guild_truth_dare_mgr.erl", 36).

-file("inc/guild_truth_dare.hrl", 1).

-author("Suhan").

-record(guild_truth_dare_info,
        {guild_id = {0, "", 0}, next_id = 0, his_info = []}).

-record(guild_truth_dare_his_info,
        {id = 0,
         time = 0,
         lucky_role = {0, "", 0},
         role_name = "",
         sex = 0,
         classes = 0,
         flower = 0,
         egg = 0,
         question_type = 0,
         question = ""}).

-record(guild_truth_dare_question_bank,
        {guild_id = {0, "", 0},
         ver = 0,
         next_id = 1000,
         truth_num = 0,
         dare_num = 0,
         question = []}).

-record(guild_truth_dare_question,
        {question_id = 0,
         type = 0,
         role_id = {0, "", 0},
         role_name = "",
         question = "",
         is_choose = 0}).

-record(guild_truth_dare_room_info,
        {guild_id = {0, "", 0},
         room_pid = undefined,
         num = 0,
         max_num = 0,
         role = []}).

-record(guild_truth_dare_room_log,
        {guild_id = {0, "", 0},
         scene_info = [],
         truth_num = 0,
         dare_num = 0,
         contents = []}).

-file("src/mod/guild/guild_truth_dare_mgr.erl", 37).

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

-file("src/mod/guild/guild_truth_dare_mgr.erl", 38).

-record(state, {ts = 0, timeout = 0, room_info = []}).

start_link() ->
    gen_fsm:start_link({local, guild_truth_dare_mgr},
                       guild_truth_dare_mgr,
                       [],
                       []).

next() ->
    gen_fsm:send_event(guild_truth_dare_mgr, timeout).

call(Msg) ->
    try
        gen_fsm:sync_send_all_state_event(guild_truth_dare_mgr,
                                          Msg)
    catch
        _Type:_Reason ->
            logger:debug("真心话大冒险调用失败 Type:~w Reason: ~w",
                         [guild_truth_dare_mgr, Msg],
                         guild_truth_dare_mgr,
                         62),
            {error, timeout}
    end.

cast(Msg) ->
    gen_fsm:send_all_state_event(guild_truth_dare_mgr, Msg).

info(Msg) -> guild_truth_dare_mgr ! Msg.

init([]) ->
    process_flag(trap_exit, true),
    dets:open_file(guild_truth_dare_question_bank,
                   [{file, "./dets/guild_truth_dare_question_bank.dets"},
                    {keypos, #guild_truth_dare_question_bank.guild_id}]),
    ets:new(guild_truth_dare_question_bank,
            [named_table,
             public,
             set,
             {keypos, #guild_truth_dare_question_bank.guild_id}]),
    dets:to_ets(guild_truth_dare_question_bank,
                guild_truth_dare_question_bank),
    dets:open_file(guild_truth_dare_his,
                   [{file, "./dets/guild_truth_dare_his.dets"},
                    {keypos, #guild_truth_dare_info.guild_id}]),
    ets:new(guild_truth_dare_his,
            [named_table,
             public,
             set,
             {keypos, #guild_truth_dare_info.guild_id}]),
    dets:to_ets(guild_truth_dare_his, guild_truth_dare_his),
    load_sys_question(),
    Time = date:next_diff({1, 0, 0}) * 1000,
    Ref = erlang:send_after(Time, self(), clean_dets),
    put(clean_dets, Ref),
    case get_idle_time() of
        Timeout when is_integer(Timeout) ->
            Now = date:now2(),
            State = #state{ts = Now, timeout = Timeout},
            {ok, idle, State, util:time_left(Timeout, Now)};
        _ -> {ok, idle, #state{}, infinity}
    end.

handle_event(_Event, StateName, State) ->
    continue(StateName, State).

handle_sync_event(get_status, _From, StateName,
                  State) ->
    Reply = case StateName of
                idle -> 0;
                _ -> 1
            end,
    continue({ok, Reply}, StateName, State);
handle_sync_event(get_room_status, _From, StateName,
                  State = #state{ts = {M, S, _}, timeout = Timeout}) ->
    case StateName of
        ready ->
            Time = M * 1000000 + S + util:floor(Timeout / 1000),
            continue({ready, Time}, StateName, State);
        _ -> continue(StateName, StateName, State)
    end;
handle_sync_event({add_question,
                   GuildId,
                   RoleId,
                   RoleName,
                   Type,
                   Question},
                  _From, StateName, State) ->
    case lookup_question_bank(GuildId) of
        {ok, QuestionBank} ->
            case add_question(QuestionBank,
                              RoleId,
                              RoleName,
                              Type,
                              Question)
                of
                ok -> continue(ok, StateName, State);
                {false, Reason} ->
                    continue({false, Reason}, StateName, State)
            end;
        _ ->
            continue({false, lang:get("系统繁忙")}, StateName, State)
    end;
handle_sync_event({del_question,
                   GuildId,
                   Type,
                   QuestionId},
                  _From, StateName, State) ->
    case lookup_question_bank(GuildId) of
        {ok, QuestionBank} ->
            case del_question(QuestionBank, Type, QuestionId) of
                ok -> continue(ok, StateName, State);
                {false, Reason} ->
                    continue({fasle, Reason}, StateName, State)
            end;
        _ ->
            continue({false, lang:get("系统繁忙")}, StateName, State)
    end;
handle_sync_event({choose_question,
                   GuildId,
                   Type,
                   Id,
                   Flag},
                  _From, StateName,
                  State = #state{room_info = RoomInfo}) ->
    case lookup_question_bank(GuildId) of
        {ok,
         QuestionBank = #guild_truth_dare_question_bank{question
                                                            = QuestionList}} ->
            case lists:keyfind(Id,
                               #guild_truth_dare_question.question_id,
                               QuestionList)
                of
                Question = #guild_truth_dare_question{type = Type,
                                                      question = _AddQuestion,
                                                      is_choose = IsChoose}
                    when IsChoose =/= Flag ->
                    case Flag =:= 0 of
                        true ->
                            ChooseList = [true
                                          || #guild_truth_dare_question{type =
                                                                            QuestionType,
                                                                        is_choose
                                                                            =
                                                                            IsChoose1}
                                                 <- QuestionList,
                                             IsChoose1 =:= 1 andalso
                                                 QuestionType =:= Type],
                            ChooseNum = erlang:length(ChooseList),
                            [#{min_question := MinQuestion}] =
                                guild_truth_dare_data:get_cfg(),
                            case ChooseNum =< MinQuestion of
                                true ->
                                    Msg =
                                        notice:format("题库数量不能少于~w条哦，快添加搞事情的题目吧！{face_1,15}",
                                                      [MinQuestion]),
                                    continue({false, Msg}, StateName, State);
                                _ ->
                                    NewQuestionList = lists:keystore(Id,
                                                                     #guild_truth_dare_question.question_id,
                                                                     QuestionList,
                                                                     Question#guild_truth_dare_question{is_choose
                                                                                                            =
                                                                                                            Flag}),
                                    NewQuestionBank =
                                        QuestionBank#guild_truth_dare_question_bank{question
                                                                                        =
                                                                                        NewQuestionList},
                                    update_question_bank(NewQuestionBank),
                                    case lists:keyfind(GuildId, 1, RoomInfo) of
                                        {_, RoomPid} ->
                                            guild_truth_dare_room:info(RoomPid,
                                                                       {del_question,
                                                                        Id});
                                        _ -> ok
                                    end,
                                    continue({ok,
                                              lang:get("已移出题库，幸运儿将不会抽到该题目{face_1,32}")},
                                             StateName,
                                             State)
                            end;
                        _ ->
                            NewQuestionList = lists:keystore(Id,
                                                             #guild_truth_dare_question.question_id,
                                                             QuestionList,
                                                             Question#guild_truth_dare_question{is_choose
                                                                                                    =
                                                                                                    Flag}),
                            NewQuestionBank =
                                QuestionBank#guild_truth_dare_question_bank{question
                                                                                =
                                                                                NewQuestionList},
                            update_question_bank(NewQuestionBank),
                            case lists:keyfind(GuildId, 1, RoomInfo) of
                                {_, RoomPid} ->
                                    case lists:keyfind(Id,
                                                       #guild_truth_dare_question.question_id,
                                                       NewQuestionList)
                                        of
                                        #guild_truth_dare_question{role_name =
                                                                       RoleName} ->
                                            guild_truth_dare_room:info(RoomPid,
                                                                       {add_question,
                                                                        Id,
                                                                        RoleName,
                                                                        Type,
                                                                        Flag});
                                        _ -> ok
                                    end;
                                _ -> ok
                            end,
                            continue({ok,
                                      lang:get("已加入题库，幸运儿将可能抽到该题目{face_1,15}")},
                                     StateName,
                                     State)
                    end;
                #guild_truth_dare_question{is_choose = Flag} ->
                    case Flag of
                        1 ->
                            continue({ok,
                                      lang:get("已加入题库，幸运儿将可能抽到该题目{face_1,15}")},
                                     StateName,
                                     State);
                        _ ->
                            continue({ok,
                                      lang:get("已移出题库，幸运儿将不会抽到该题目{face_1,32}")},
                                     StateName,
                                     State)
                    end;
                _ ->
                    continue({false, lang:get("该题目已被删除")}, StateName, State)
            end;
        _ ->
            continue({false, lang:get("系统繁忙")}, StateName, State)
    end;
handle_sync_event({get_room_pid, GuildId}, _From,
                  StateName, State = #state{room_info = RoomInfo}) ->
    case lists:keyfind(GuildId, 1, RoomInfo) of
        {_, RoomPid} ->
            continue({ok, RoomPid}, StateName, State);
        _ ->
            continue({false, lang:get("系统繁忙")}, StateName, State)
    end;
handle_sync_event(_Event, _From, StateName, State) ->
    Reply = ok,
    continue(Reply, StateName, State).

handle_info(load_sys_question, _StateName, State) ->
    load_sys_question(),
    continue(_StateName, State);
handle_info(reload, _StateName, State) ->
    case get_idle_time() of
        Timeout when is_integer(Timeout) ->
            Now = date:now2(),
            NewState = #state{ts = Now, timeout = Timeout},
            continue(idle, NewState);
        _ ->
            continue(idle,
                     State#state{ts = date:now2(), timeout = infinity})
    end;
handle_info({create_guild, GuildId}, StateName,
            State = #state{room_info = RoomInfo}) ->
    case lookup_question_bank(GuildId) of
        {ok, #guild_truth_dare_question_bank{}} -> ok;
        _ ->
            QuestionList =
                guild_truth_dare_data:get_question_list(),
            NewQuestionBank =
                #guild_truth_dare_question_bank{guild_id = GuildId},
            load_sys_question(NewQuestionBank, QuestionList)
    end,
    NewRoomInfo = case StateName of
                      active -> create_room([#guild{id = GuildId}], RoomInfo);
                      _ -> RoomInfo
                  end,
    continue(StateName,
             State#state{room_info = NewRoomInfo});
handle_info({get_guild_question_bank,
             Role = #role{m_guild = #m_guild{id = GuildId}}},
            StateName, State) ->
    case lookup_question_bank(GuildId) of
        {ok,
         #guild_truth_dare_question_bank{ver = Ver,
                                         question = QuestionList}} ->
            ReplyQuestion = [{Type,
                              Id,
                              Question,
                              RoleName,
                              IsChoose}
                             || #guild_truth_dare_question{question_id = Id,
                                                           type = Type,
                                                           question = Question,
                                                           role_name = RoleName,
                                                           is_choose = IsChoose}
                                    <- QuestionList],
            role:link_send(Role, 19525, {Ver, ReplyQuestion}),
            ok;
        _ -> ok
    end,
    continue(StateName, State);
handle_info({get_lucky_board,
             Role = #role{m_guild = #m_guild{id = GuildId}}},
            StateName, State) ->
    case lookup_his_info(GuildId) of
        {ok, #guild_truth_dare_info{his_info = HisInfo}} ->
            Data = [{RoleId,
                     RoleName,
                     Classes,
                     Sex,
                     Type,
                     Flower,
                     Egg,
                     Question}
                    || #guild_truth_dare_his_info{lucky_role = RoleId,
                                                  role_name = RoleName,
                                                  classes = Classes, sex = Sex,
                                                  question_type = Type,
                                                  flower = Flower, egg = Egg,
                                                  question = Question}
                           <- HisInfo],
            role:link_send(Role, 19527, Data),
            ok;
        _ -> ok
    end,
    continue(StateName, State);
handle_info(clean_dets, StateName, State) ->
    case get(clean_dets) of
        OldRef when is_reference(OldRef) ->
            erlang:cancel_timer(OldRef);
        _ -> ok
    end,
    clean_question_bank(),
    clean_lucky_info(),
    Time = date:next_diff({1, 0, 0}) * 1000,
    Ref = erlang:send_after(Time, self(), clean_dets),
    put(clean_dets, Ref),
    continue(StateName, State);
handle_info({stop_room, GuildId}, StateName,
            State = #state{room_info = RoomInfo}) ->
    NewRoomInfo = lists:keydelete(GuildId, 1, RoomInfo),
    guild:cast(GuildId, 19508, {0}),
    continue(StateName,
             State#state{room_info = NewRoomInfo});
handle_info(_Info, StateName, State) ->
    continue(StateName, State).

terminate(_Reason, _StateName, _State) -> ok.

code_change(_OldVsn, StateName, State, _Extra) ->
    {ok, StateName, State}.

idle(timeout, #state{room_info = RoomInfo}) ->
    stop_room(RoomInfo),
    Now = {M, S, _} = date:now2(),
    Timeout = 2 * 60 + 30,
    case guild_mgr:list() of
        {ok, GuildList} ->
            push_19508(GuildList, {1}),
            push_19509(GuildList, {0, M * 1000000 + S + Timeout}),
            continue(ready,
                     #state{ts = Now, timeout = Timeout * 1000});
        _ -> continue(idle, #state{})
    end.

ready(timeout, _State) ->
    case get_end_time() of
        Timeout when is_integer(Timeout) ->
            Now = date:now2(),
            case guild_mgr:list() of
                {ok, GuildList} ->
                    NewRoomInfo = create_room(GuildList, []),
                    continue(active,
                             #state{ts = Now, timeout = Timeout,
                                    room_info = NewRoomInfo});
                _ ->
                    role_group:pack_send(world, 19508, {0}),
                    continue(idle, #state{})
            end;
        _ ->
            role_group:pack_send(world, 19508, {0}),
            continue(idle, #state{})
    end.

active(timeout, State = #state{room_info = RoomInfo}) ->
    NewRoomInfo = stop_room(RoomInfo, []),
    case get_idle_time() of
        Timeout when is_integer(Timeout) ->
            Now = date:now2(),
            continue(idle,
                     State#state{ts = Now, timeout = Timeout,
                                 room_info = NewRoomInfo});
        _ ->
            continue(idle,
                     State#state{timeout = infinity,
                                 room_info = NewRoomInfo})
    end.

continue(StateName,
         State = #state{timeout = infinity}) ->
    {next_state, StateName, State, infinity};
continue(StateName,
         State = #state{ts = Ts, timeout = Timeout}) ->
    {next_state,
     StateName,
     State,
     util:time_left(Timeout, Ts)}.

continue(Reply, StateName,
         State = #state{timeout = infinity}) ->
    {reply, Reply, StateName, State, infinity};
continue(Reply, StateName,
         State = #state{ts = Ts, timeout = Timeout}) ->
    {reply,
     Reply,
     StateName,
     State,
     util:time_left(Timeout, Ts)}.

get_idle_time() ->
    case agenda_data:get(2110) of
        #{args := Days, starttime := StartTime} ->
            date:week_next_diff(Days, StartTime) * 1000;
        _Err ->
            logger:error("真心话大冒险配置：~w",
                         [2110],
                         guild_truth_dare_mgr,
                         359),
            infinity
    end.

get_end_time() ->
    case agenda_data:get(2110) of
        #{args := Days, endtime := EndTime} ->
            date:week_next_diff(Days, EndTime) * 1000;
        _Err ->
            logger:error("真心话大冒险配置：~w",
                         [2110],
                         guild_truth_dare_mgr,
                         368),
            infinity
    end.

lookup_question_bank(GuildId) ->
    case catch ets:lookup(guild_truth_dare_question_bank,
                          GuildId)
        of
        [GuildTruthDareQuestionBank =
             #guild_truth_dare_question_bank{}] ->
            {ok, GuildTruthDareQuestionBank};
        _ -> false
    end.

update_question_bank(Data) ->
    ets:insert(guild_truth_dare_question_bank, Data),
    dets:insert(guild_truth_dare_question_bank, Data),
    ok.

lookup_his_info(GuildId) ->
    case catch ets:lookup(guild_truth_dare_his, GuildId) of
        [GuildTruthDareInfo = #guild_truth_dare_info{}] ->
            {ok, GuildTruthDareInfo};
        _ -> false
    end.

update_his_info(Data) ->
    ets:insert(guild_truth_dare_his, Data),
    dets:insert(guild_truth_dare_his, Data),
    ok.

create_room([], RoomInfo) -> RoomInfo;
create_room([#guild{id = GuildId} | Rest], RoomInfo) ->
    Msg =
        lang:get("紧张刺激的<color='#ffff00'>真心话大冒险</color>开始啦！各种搞怪有"
                 "趣题目由你来定义！可在公会频道直接参与哦，快约小伙伴一起来玩吧！"),
    guild:notice(GuildId, Msg),
    case guild_truth_dare_room:start_link(GuildId) of
        {ok, RoomPid} ->
            create_room(Rest, [{GuildId, RoomPid} | RoomInfo]);
        _ERR ->
            logger:error("真心话大冒险公会~w创建房间失败~w",
                         [GuildId, _ERR],
                         guild_truth_dare_mgr,
                         407),
            create_room(Rest, RoomInfo)
    end.

stop_room([]) -> ok;
stop_room([{_, RoomPid} | Rest]) ->
    guild_truth_dare_room:info(RoomPid, stop_room),
    stop_room(Rest).

stop_room([], NewRoomInfo) -> NewRoomInfo;
stop_room([{GuildId, RoomPid} | Rest], RoomInfo) ->
    case guild_truth_dare_room:call(RoomPid, get_status) of
        {ok, Status, _} when Status =:= 1 orelse Status =:= 2 ->
            guild:cast(GuildId, 19508, {0}),
            guild_truth_dare_room:info(RoomPid, stop_room),
            stop_room(Rest, RoomInfo);
        _Err -> stop_room(Rest, [{GuildId, RoomPid} | RoomInfo])
    end.

push_19508([], _Data) -> ok;
push_19508([#guild{id = GuildId} | Rest], Data) ->
    guild:cast(GuildId, 19508, Data),
    push_19508(Rest, Data).

push_19509([], _Data) -> ok;
push_19509([#guild{id = GuildId} | Rest], Data) ->
    guild:cast(GuildId, 19509, Data),
    Msg =
        lang:get("紧张刺激的<color='#ffff00'>真心话大冒险</color>即将开始，各种搞怪"
                 "有趣题目由你来定义！可在公会频道直接参与哦，快约小伙伴一起来玩吧！"),
    guild:notice(GuildId, Msg),
    push_19509(Rest, Data).

load_sys_question() ->
    case guild_mgr:list() of
        {ok, L} -> load_sys_question(L);
        _ -> ok
    end.

load_sys_question([]) -> ok;
load_sys_question([#guild{id = GuildId} | Rest]) ->
    QuestionList =
        guild_truth_dare_data:get_question_list(),
    logger:debug("获取系统题库：~w",
                 [QuestionList],
                 guild_truth_dare_mgr,
                 452),
    case lookup_question_bank(GuildId) of
        {ok,
         OldQuestionBank =
             #guild_truth_dare_question_bank{question =
                                                 OldQuestionList}} ->
            NewQuestionList = [Q
                               || Q = #guild_truth_dare_question{question_id =
                                                                     Qid}
                                      <- OldQuestionList,
                                  Qid >= 1000],
            load_sys_question(OldQuestionBank#guild_truth_dare_question_bank{question
                                                                                 =
                                                                                 NewQuestionList},
                              QuestionList);
        _ ->
            NewQuestionBank =
                #guild_truth_dare_question_bank{guild_id = GuildId},
            load_sys_question(NewQuestionBank, QuestionList)
    end,
    load_sys_question(Rest).

load_sys_question(QuestionBank, []) ->
    update_question_bank(QuestionBank);
load_sys_question(QuestionBank =
                      #guild_truth_dare_question_bank{ver = Ver,
                                                      truth_num = TruthNum,
                                                      dare_num = DareNum,
                                                      question = QuestionList},
                  [QuestionId | Rest]) ->
    case guild_truth_dare_data:get_question(QuestionId) of
        #{type := Type, question := Question} ->
            NewQuestion = #guild_truth_dare_question{question_id =
                                                         QuestionId,
                                                     type = Type,
                                                     question = Question,
                                                     is_choose = 1},
            case Type of
                1 ->
                    load_sys_question(QuestionBank#guild_truth_dare_question_bank{ver
                                                                                      =
                                                                                      Ver
                                                                                          +
                                                                                          1,
                                                                                  truth_num
                                                                                      =
                                                                                      TruthNum
                                                                                          +
                                                                                          1,
                                                                                  question
                                                                                      =
                                                                                      [NewQuestion
                                                                                       | QuestionList]},
                                      Rest);
                2 ->
                    load_sys_question(QuestionBank#guild_truth_dare_question_bank{ver
                                                                                      =
                                                                                      Ver
                                                                                          +
                                                                                          1,
                                                                                  dare_num
                                                                                      =
                                                                                      DareNum
                                                                                          +
                                                                                          1,
                                                                                  question
                                                                                      =
                                                                                      [NewQuestion
                                                                                       | QuestionList]},
                                      Rest);
                _ ->
                    logger:error("真心话大冒险未知题目~w 类型:~w",
                                 [QuestionId, Type],
                                 guild_truth_dare_mgr,
                                 476),
                    load_sys_question(QuestionBank, Rest)
            end;
        _ -> load_sys_question(QuestionBank, Rest)
    end.

add_question(QuestionBank =
                 #guild_truth_dare_question_bank{next_id = NextId,
                                                 truth_num = TruthNum,
                                                 dare_num = DareNum,
                                                 question = QuestionList},
             RoleId, RoleName, Type, Question) ->
    [#{max_question := MaxQuestion}] =
        guild_truth_dare_data:get_cfg(),
    case Type of
        1 ->
            case TruthNum < MaxQuestion of
                true ->
                    NewQuestion = #guild_truth_dare_question{question_id =
                                                                 NextId + 1,
                                                             type = Type,
                                                             role_id = RoleId,
                                                             role_name =
                                                                 RoleName,
                                                             question =
                                                                 Question},
                    NewQuestionBank =
                        QuestionBank#guild_truth_dare_question_bank{next_id =
                                                                        NextId +
                                                                            1,
                                                                    truth_num =
                                                                        TruthNum
                                                                            + 1,
                                                                    question =
                                                                        [NewQuestion
                                                                         | QuestionList]},
                    update_question_bank(NewQuestionBank);
                _ -> {false, lang:get("题库数目过多，请适当调整删除后再添加吧~{face_1,3}")}
            end;
        2 ->
            case TruthNum < MaxQuestion of
                true ->
                    NewQuestion = #guild_truth_dare_question{question_id =
                                                                 NextId + 1,
                                                             type = Type,
                                                             role_id = RoleId,
                                                             role_name =
                                                                 RoleName,
                                                             question =
                                                                 Question},
                    NewQuestionBank =
                        QuestionBank#guild_truth_dare_question_bank{next_id =
                                                                        NextId +
                                                                            1,
                                                                    dare_num =
                                                                        DareNum
                                                                            + 1,
                                                                    question =
                                                                        [NewQuestion
                                                                         | QuestionList]},
                    update_question_bank(NewQuestionBank);
                _ -> {false, lang:get("题库数目过多，请适当调整删除后再添加吧~{face_1,3}")}
            end;
        _ -> {false, lang:get("题目类型出错")}
    end.

del_question(QuestionBank =
                 #guild_truth_dare_question_bank{truth_num = TruthNum,
                                                 dare_num = DareNum,
                                                 question = QuestionList},
             Type, QuestionId) ->
    case lists:keyfind(QuestionId, 1, QuestionList) of
        #guild_truth_dare_question{type = Type} ->
            case Type of
                1 ->
                    NewQuestionList = lists:keydelete(QuestionId,
                                                      #guild_truth_dare_question.question_id,
                                                      QuestionList),
                    update_question_bank(QuestionBank#guild_truth_dare_question_bank{truth_num
                                                                                         =
                                                                                         TruthNum
                                                                                             -
                                                                                             1,
                                                                                     question
                                                                                         =
                                                                                         NewQuestionList});
                2 ->
                    NewQuestionList = lists:keydelete(QuestionId,
                                                      #guild_truth_dare_question.question_id,
                                                      QuestionList),
                    update_question_bank(QuestionBank#guild_truth_dare_question_bank{dare_num
                                                                                         =
                                                                                         DareNum
                                                                                             -
                                                                                             1,
                                                                                     question
                                                                                         =
                                                                                         NewQuestionList});
                _ -> {false, lang:get("错误的题目类型")}
            end;
        _ -> {false, lang:get("题目已删除")}
    end.

clean_question_bank() ->
    case guild_mgr:list() of
        {ok, GuildList} ->
            Fun = fun (#guild_truth_dare_question_bank{guild_id =
                                                           GuildId},
                       DelList) ->
                          case lists:keyfind(GuildId, #guild.id, GuildList) of
                              false -> [GuildId | DelList];
                              _ -> DelList
                          end
                  end,
            List = ets:foldl(Fun,
                             [],
                             guild_truth_dare_question_bank),
            clean_question_bank(List);
        _ -> ok
    end.

clean_question_bank([]) -> ok;
clean_question_bank([GuildId | Rest]) ->
    ets:delete(guild_truth_dare_question_bank, GuildId),
    dets:delete(guild_truth_dare_question_bank, GuildId),
    ets:delete(guild_truth_dare_his, GuildId),
    dets:delete(guild_truth_dare_his, GuildId),
    clean_question_bank(Rest).

clean_lucky_info() ->
    case guild_mgr:list() of
        {ok, GuildList} -> clean_lucky_info(GuildList);
        _ -> ok
    end.

clean_lucky_info([]) -> ok;
clean_lucky_info([#guild{id = GuildId} | Rest]) ->
    case lookup_his_info(GuildId) of
        {ok,
         GuildTruthDareInfo = #guild_truth_dare_info{his_info =
                                                         HisInfo}} ->
            SortHis =
                lists:reverse(lists:keysort(#guild_truth_dare_his_info.id,
                                            HisInfo)),
            NewHisInfo = lists:sublist(SortHis, 20),
            update_his_info(GuildTruthDareInfo#guild_truth_dare_info{his_info
                                                                         =
                                                                         NewHisInfo});
        _ -> ok
    end,
    clean_lucky_info(Rest).

