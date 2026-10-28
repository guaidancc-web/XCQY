-file("src/mod/formation/formation_rpc.erl", 1).

-module(formation_rpc).

-export([handle/3]).

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

-file("src/mod/formation/formation_rpc.erl", 14).

-file("inc/formation.hrl", 1).

-record(m_formation,
        {id = 1, lev = 1, pos = 1, forms = [], team_form = []}).

-record(formation, {id = 0, lev = 0, exp = 0}).

-record(formation_data,
        {id = 0,
         type = 1,
         lev = 0,
         max_lev = 1,
         name = "",
         pos_desc = [],
         attr_1 = [],
         attr_2 = [],
         attr_3 = [],
         attr_4 = [],
         attr_5 = [],
         pet_attr = [],
         strong_restrain = [],
         weak_restrain = [],
         next_exp = 0,
         need_item = [],
         item_id = 0}).

-file("src/mod/formation/formation_rpc.erl", 15).

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

-file("src/mod/formation/formation_rpc.erl", 16).

-file("inc/guard.hrl", 1).

-record(m_guard,
        {ver = 1 :: pos_integer(),
         free_war_ids = [] :: [pos_integer()],
         tactics_fields = [] :: list(),
         tactics_attr = [] :: list(),
         guards = [] :: list()}).

-record(guard_eqm,
        {ver = 5,
         base_id :: undefined | non_neg_integer(),
         type :: undefined | non_neg_integer(),
         lev,
         eqm_attrs = [] :: list(),
         reset_base_id = 0,
         reset_attrs = [] :: list(),
         gem = [] :: list(),
         is_init = 1,
         timeout = 0,
         back_effect_timeout = 0,
         back_effect_attr = []}).

-record(guard_astroid,
        {ver = 2 :: non_neg_integer(),
         aroused = [] :: non_neg_integer(),
         skills = [] :: list(),
         attrs = [] :: list(),
         growth = 0 :: non_neg_integer(),
         active = 0 :: non_neg_integer()}).

-record(guard_astroid_star,
        {ver = 0,
         id = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer(),
         exp = 0 :: non_neg_integer(),
         attrs = [] :: list()}).

-record(guard,
        {ver = 2,
         base_id = 0 :: non_neg_integer(),
         war_id = 0 :: non_neg_integer(),
         name = "" :: string(),
         alias = "" :: string(),
         classes = 0 :: non_neg_integer(),
         quality = 0 :: non_neg_integer(),
         status = 0 :: non_neg_integer(),
         tac_pos = 0 :: non_neg_integer(),
         skills = [] :: list(),
         eqm = [] :: list(),
         attr :: undefined | tuple(),
         score = 0 :: non_neg_integer(),
         astroid = #guard_astroid{} :: #guard_astroid{}}).

-record(guard_data,
        {base_id = 0 :: non_neg_integer(),
         name = "" :: binary(),
         alias = "" :: binary(),
         classes = 0 :: non_neg_integer(),
         quality = 0 :: non_neg_integer(),
         loss = [] :: tuple(),
         recruit_lev = 1 :: non_neg_integer(),
         desc = "" :: list(),
         normal_atk_id = 0 :: integer(),
         ai_id = 0 :: integer(),
         base_score = 0,
         growth = 0 :: non_neg_integer()}).

-record(guard_eqm_data,
        {base_id = 0 :: non_neg_integer(),
         lev = 1 :: non_neg_integer(),
         classes = 0 :: non_neg_integer(),
         type = 0 :: non_neg_integer(),
         quality = 0 :: non_neg_integer(),
         loss_coin = 0 :: [tuple()],
         reset_coin = 0 :: [tuple()],
         gem_list = [] :: list()}).

-record(guard_lev_data,
        {base_id :: undefined | non_neg_integer(),
         lev :: undefined | non_neg_integer(),
         lev_up_exp :: undefined | non_neg_integer(),
         attrs = [] :: non_neg_integer()}).

-record(guard_eqm_gem,
        {id = 0, base_id = 0, type = 0, lev = 0}).

-record(guard_eqm_gem_data,
        {base_id = 0,
         next_base_id = 0,
         name = "",
         lev = 0,
         type = 0,
         need_lev = 0,
         loss_coin = [],
         attrs = []}).

-file("src/mod/formation/formation_rpc.erl", 17).

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

-file("src/mod/formation/formation_rpc.erl", 18).

-file("inc/package.hrl", 1).

-record(package,
        {type = 1 :: integer(),
         next_id = 1 :: pos_integer(),
         volume = 0 :: non_neg_integer(),
         free_cell = [] :: list(),
         items = [] :: [tuple()]}).

-file("src/mod/formation/formation_rpc.erl", 19).

handle(12900, {},
       #role{m_formation =
                 #m_formation{id = Id, lev = Lev, forms = Forms}}) ->
    {reply, {Id, Lev, Forms}};
handle(12901, {ForId}, Role) ->
    case formation:change_form(ForId, Role) of
        {ok, NewRole, Lev} ->
            {reply, {1, "", ForId, Lev}, NewRole};
        {false, Reason} -> {reply, {0, Reason, ForId, 1}}
    end;
handle(12902, {}, Role) ->
    formation:push_self_formation(Role),
    ok;
handle(12903, {Rid, P, Z, _, _, _},
       #role{id = {Rid, P, Z}}) ->
    ok;
handle(12903, {_, _, _, Rid, P, Z},
       #role{id = {Rid, P, Z}}) ->
    ok;
handle(12903, {Rid, P, Z, Rid, P, Z}, _Role) -> ok;
handle(12903, {Rid1, P1, Z1, Rid2, P2, Z2}, Role) ->
    team:swap_role(Role, {Rid1, P1, Z1}, {Rid2, P2, Z2}),
    ok;
handle(12904, {GuardSid, GuardTid}, Role) ->
    case formation:swap_team_guard(Role, GuardSid, GuardTid)
        of
        {true, NewRole} -> {reply, {1, ""}, NewRole};
        {false, Reason} -> {reply, {0, Reason}};
        _ -> ok
    end;
handle(12905, {GuardId, _Flag, GuardId}, _Role) -> ok;
handle(12905, {GuardSid, Flag, GuardTid}, Role)
    when Flag =:= 0 orelse Flag =:= 1 ->
    case guard:swap_war_id(GuardSid, Flag, GuardTid, Role)
        of
        ok -> ok;
        {false, Reason} -> {reply, {0, Reason}};
        {ok, NewRole} -> {reply, {1, lang:get("更换成功")}, NewRole}
    end;
handle(12907, {1, _, _}, _) -> ok;
handle(12907, {ForId, ItemBaseId, ItemNum},
       Role = #role{})
    when ItemNum > 0 ->
    role:send_buff_begin(),
    case formation:use_item(ItemBaseId,
                            ItemNum,
                            ForId,
                            Role)
        of
        {ok, NewRole, Msg} ->
            role:send_buff_flush(),
            {reply, {1, Msg}, NewRole};
        {false, Reason} ->
            role:send_buff_clean(),
            {reply, {0, Reason}}
    end;
handle(12908, {},
       #role{m_formation =
                 #m_formation{team_form = TeamForm}}) ->
    {reply, {TeamForm}};
handle(_Cmd, _Data, _Role) ->
    logger:error("模块[~w]收到无效的RPC调用[~w]: ~w",
                 [formation_rpc, _Cmd, _Data],
                 formation_rpc,
                 85),
    {error, unknow_command}.

