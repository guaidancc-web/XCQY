-file("src/mod/guard/guard_attr.erl", 1).

-module(guard_attr).

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

-file("src/mod/guard/guard_attr.erl", 13).

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

-file("src/mod/guard/guard_attr.erl", 14).

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

-file("src/mod/guard/guard_attr.erl", 15).

-file("inc/skill.hrl", 1).

-record(m_skill,
        {ver = 6 :: pos_integer(),
         skills = [] :: [{non_neg_integer(), non_neg_integer()}],
         is_open_skl_prac = 0 :: 0 | 1,
         selected_skl_prac = 0 :: non_neg_integer(),
         skill_prac = [] :: list(),
         skill_couple = [] :: list(),
         skill_sworn = [] :: list(),
         speed = [] :: list(),
         skill_unique = [],
         skill_clsld_done = [],
         unique_coolddown_time = 0,
         skl_unique_point = 100,
         sq_double = 0,
         is_open_sq_double = 0,
         sq_exp_statistics = []}).

-record(role_base_skill,
        {id = 0,
         lev = 0,
         type :: undefined | non_neg_integer(),
         sub_type :: undefined | non_neg_integer(),
         max_lev = 0,
         name = "",
         way = 1,
         study_lev = 1,
         cost = [],
         attr = []}).

-record(skill,
        {id = 0,
         lev = 0,
         type = 0 :: non_neg_integer(),
         sub_type = 0 :: non_neg_integer(),
         speed = 1,
         name = "",
         acc_ratio = 1000,
         acc_low = 0,
         acc_high = 1000,
         attack_type = 0 :: non_neg_integer(),
         elem_type = 0 :: non_neg_integer(),
         target_type = 1 :: non_neg_integer(),
         attack_times = 1 :: non_neg_integer(),
         target_list = [],
         self_cond = [],
         self_loss = [],
         target_cond = [],
         dmg_addt = 0 :: non_neg_integer(),
         dmg_ratio = [1000] :: non_neg_integer(),
         pre_cooldown = 0,
         cooldown = 0 :: non_neg_integer(),
         cost_mp = 0 :: non_neg_integer(),
         cost_anger = 0,
         cost_other = [] :: [{atom(), non_neg_integer()}],
         buff_self = [] :: [tuple()],
         buff_target = [] :: [tuple()],
         script_id = 0 :: non_neg_integer(),
         script_args = [] :: [integer()],
         addt_scripts = [] ::
             [{non_neg_integer(), non_neg_integer(), list()}],
         play_time = 0 :: non_neg_integer()}).

-record(chief_classes,
        {leader_id = 0,
         classes = 0,
         name = "",
         sex = 0,
         lev = 0,
         looks = []}).

-record(sq_exp_statistics,
        {combat_type = 0, times = 0, gain = 0, real_gain = 0}).

-file("src/mod/guard/guard_attr.erl", 16).

-file("inc/attr.hrl", 1).

-record(attr_base,
        {type = 0 :: non_neg_integer(),
         name = 0 :: pos_integer(),
         flag = 0 :: non_neg_integer(),
         calc_type = 0 :: non_neg_integer(),
         val = 0 :: non_neg_integer()}).

-record(attr,
        {ver = 3,
         fc = 0 :: non_neg_integer(),
         speed = 260 :: pos_integer(),
         hp_max = 0 :: non_neg_integer(),
         mp_max = 0 :: non_neg_integer(),
         atk_speed = 0 :: non_neg_integer(),
         phy_dmg = 0 :: non_neg_integer(),
         magic_dmg = 0 :: non_neg_integer(),
         phy_def = 0 :: non_neg_integer(),
         magic_def = 0 :: non_neg_integer(),
         crit = 0 :: non_neg_integer(),
         tenacity = 0 :: non_neg_integer(),
         accuracy = 0 :: non_neg_integer(),
         evasion = 0 :: non_neg_integer(),
         holy_dmg = 0 :: non_neg_integer(),
         crit_dmg = 0 :: non_neg_integer(),
         crit_dmg_def = 0 :: non_neg_integer(),
         dmg_ratio = 0 :: non_neg_integer(),
         def_ratio = 0 :: non_neg_integer(),
         enhance_control = 0 :: non_neg_integer(),
         anti_control = 0 :: non_neg_integer(),
         escape = 0 :: non_neg_integer(),
         anti_escape = 0 :: non_neg_integer(),
         capture = 0 :: non_neg_integer(),
         phy_def_ratio = 0 :: non_neg_integer(),
         magic_def_ratio = 0 :: non_neg_integer(),
         phy_accuracy = 0 :: non_neg_integer(),
         magic_accuracy = 0 :: non_neg_integer(),
         phy_evasion = 0 :: non_neg_integer(),
         magic_evasion = 0 :: non_neg_integer(),
         phy_crit = 0 :: non_neg_integer(),
         magic_crit = 0 :: non_neg_integer(),
         phy_tenacity = 0 :: non_neg_integer(),
         magic_tenacity = 0 :: non_neg_integer(),
         heal_val = 0 :: non_neg_integer(),
         heal_ratio = 0 :: non_neg_integer(),
         eff_heal_ratio = 0 :: non_neg_integer(),
         phy_dmg_ratio = 0 :: non_neg_integer(),
         magic_dmg_ratio = 0 :: non_neg_integer(),
         strength = 0,
         constitution = 0,
         magic = 0,
         agility = 0,
         endurance = 0,
         exp_ratio = 0}).

-record(attr_calc,
        {attr :: undefined | #attr{},
         attr_no_ratio :: undefined | #attr{},
         ratio :: undefined | #attr{},
         attr_no_fc :: undefined | #attr{},
         ratio_no_fc :: undefined | #attr{}}).

-record(m_attr_point,
        {ver = 2,
         ext_point = [],
         first_free = 0,
         valid_plan = 1,
         plan_data = [],
         change_plan_times = 0}).

-record(attr_point_plan,
        {index = 1 :: pos_integer(),
         plan_name = [],
         strength = 0 :: pos_integer(),
         constitution = 0 :: non_neg_integer(),
         magic = 0 :: non_neg_integer(),
         agility = 0 :: non_neg_integer(),
         endurance = 0 :: non_neg_integer(),
         pre_str = 0,
         pre_con = 0,
         pre_magic = 0,
         pre_agi = 0,
         pre_end = 0}).

-file("src/mod/guard/guard_attr.erl", 17).

-file("inc/buff.hrl", 1).

-record(m_buff, {ver = 2, r_list = [], show = 1}).

-record(buff_base,
        {id = 1,
         name = "",
         class = 0,
         lev = 0,
         cancel = 0,
         same_buff_mode = 0,
         type = 1,
         sub_type = 0,
         time_mode = 0,
         max_time_num = 1,
         duration = 0,
         max_effect_lev = 1,
         looks = [],
         attr = [],
         guard_attr = [],
         pet_attr = [],
         end_date = 0,
         extra = [],
         effect = [],
         dynamic_attr = [],
         pvp_limit = 0,
         desc = ""}).

-record(buff,
        {ver = 4,
         id = 1,
         class = 0,
         lev = 0,
         cancel = 0,
         type = 1,
         same_buff_mode = 0,
         time_mode = 0,
         duration = 0,
         max_duration = 1,
         effect_lev = 1,
         end_date = 0,
         start_time = 0,
         looks = [],
         dynamic_attr = [],
         pvped = 0,
         ext_param = [],
         args = 1}).

-file("src/mod/guard/guard_attr.erl", 18).

-export([calc/2,
         calc_eqm/1,
         init_eqm/2,
         recalc_tactics/1,
         recalc_tactics/2,
         calc_tactics_attr/1,
         calc_tactics_effect/2,
         batch_calc/2]).

batch_calc(Guards, Role = #role{m_guard = MGuard}) ->
    TacGuards = [Guard
                 || Guard = #guard{status = 2} <- Guards],
    NewTacGuards = [calc(Guard, Role)
                    || Guard <- TacGuards],
    TacticsAttr = calc_tactics_attr(NewTacGuards, Role, []),
    NewMGuard = MGuard#m_guard{tactics_attr = TacticsAttr},
    do_batch_calc(Guards,
                  Role#role{m_guard = NewMGuard},
                  []).

do_batch_calc([], Role = #role{m_guard = MGuard},
              Guards) ->
    Role#role{m_guard = MGuard#m_guard{guards = Guards}};
do_batch_calc([Guard | T], Role, Guards) ->
    NewGuard = calc(Guard, Role),
    do_batch_calc(T, Role, [NewGuard | Guards]).

calc(Guard = #guard{}, Role) ->
    InitCalc = #attr_calc{attr = #attr{speed = 0},
                          attr_no_ratio = #attr{speed = 0},
                          ratio = #attr{speed = 0},
                          attr_no_fc = #attr{speed = 0},
                          ratio_no_fc = #attr{speed = 0}},
    AttrCalc = do_calc_guard([base,
                              eqm,
                              skill,
                              skill_prac,
                              buff,
                              handbook,
                              astroid],
                             InitCalc,
                             Guard,
                             Role),
    AttrCalc1 = calc_guard_point(Guard, AttrCalc, Role),
    AttrRec = attr:merge_attr(AttrCalc1),
    Score = calc_guard_score(Guard, AttrRec),
    NewAttrCalc = do_calc_guard([tactics],
                                AttrCalc1,
                                Guard,
                                Role),
    AttrRec1 = attr:merge_attr(NewAttrCalc),
    NewGuard = Guard#guard{attr = AttrRec1, score = Score},
    rank_listener:handle(guard, Role, NewGuard),
    NewGuard.

recalc_tactics(#guard{status = 2}, Role) ->
    recalc_tactics(Role);
recalc_tactics(_Guard, Role) -> Role.

recalc_tactics(Role = #role{m_guard =
                                Mguard = #m_guard{guards = Guards}}) ->
    TacticsAttr = calc_tactics_attr(Role),
    NewMguard = Mguard#m_guard{tactics_attr = TacticsAttr},
    NewGuards = calc_tactics_effect(Guards,
                                    Role#role{m_guard = NewMguard}),
    NewMguard1 = NewMguard#m_guard{guards = NewGuards},
    Role#role{m_guard = NewMguard1}.

calc_eqm(GuardEqm = #guard_eqm{eqm_attrs = EqmAttrs,
                               lev = Lev, type = Type}) ->
    OldBaseAttr = [A
                   || A = #attr_base{type = 0} <- EqmAttrs],
    OldSpecialAttr = [A
                      || A = #attr_base{type = 2} <- EqmAttrs],
    OldEffectAttr = [A
                     || A = #attr_base{type = 4} <- EqmAttrs],
    {CalcBaseAttr, SpecialAttr} =
        eqm_attr:get_guard_recalc_attr(Type,
                                       Lev,
                                       OldBaseAttr,
                                       OldSpecialAttr),
    EnchantAttr = calc_enchant_attr(CalcBaseAttr,
                                    OldEffectAttr),
    NewEqmAttrs = CalcBaseAttr ++
                      EnchantAttr ++ SpecialAttr ++ OldEffectAttr,
    GuardEqm#guard_eqm{eqm_attrs = NewEqmAttrs}.

calc_enchant_attr(CalcBaseAttr, EffectAttr) ->
    case lists:keyfind(150, #attr_base.name, EffectAttr) of
        #attr_base{val = Ratio} ->
            [Attr#attr_base{type = 1,
                            val = erlang:round(Val * Ratio / 1000)}
             || Attr = #attr_base{val = Val} <- CalcBaseAttr];
        _ -> []
    end.

init_eqm(GuardEqm = #guard_eqm{lev = Lev, type = Type},
         Classes) ->
    {CalcBaseAttr, SpecialAttr} =
        eqm_attr:get_guard_init_attr(Type, Lev, Classes),
    NewEqmAttrs = CalcBaseAttr ++ SpecialAttr,
    GuardEqm#guard_eqm{eqm_attrs = NewEqmAttrs,
                       is_init = 1}.

do_calc_guard([], AttrCalc, _, _) -> AttrCalc;
do_calc_guard([base | Rest], AttrCalc,
              Guard = #guard{base_id = BaseId,
                             astroid = #guard_astroid{growth = Growth}},
              Role = #role{lev = Lev}) ->
    #{base_attrs := BaseAttrs, extra_attrs := ExtraAttrs} =
        guard_data:get_lev_cfg({BaseId, Lev}),
    Attrs = BaseAttrs ++
                [{N, round(V * Growth / 1000)} || {N, V} <- ExtraAttrs],
    AttrBases = attr_type:to_attr(base, Attrs),
    case attr_type:do_attr(AttrBases, AttrCalc) of
        {false, Reason} ->
            logger:error("守护属性计算错误:~w", [Reason], guard_attr, 122),
            AttrCalc;
        {ok, NewAttrCalc} ->
            do_calc_guard(Rest, NewAttrCalc, Guard, Role)
    end;
do_calc_guard([eqm | Rest], AttrCalc, Guard, Role) ->
    NewAttrCalc = guard_eqm:calc_eqm_attr(AttrCalc, Guard),
    do_calc_guard(Rest, NewAttrCalc, Guard, Role);
do_calc_guard([handbook | Rest], AttrCalc, Guard,
              Role) ->
    NewAttrCalc = handbook_attr:calc_guard(AttrCalc,
                                           Guard,
                                           Role),
    do_calc_guard(Rest, NewAttrCalc, Guard, Role);
do_calc_guard([skill | Rest], AttrCalc,
              Guard = #guard{skills = Skills, eqm = Eqms},
              Role = #role{lev = Lev}) ->
    {_, AddSkills, _} = skill:get_effect_skill(Eqms, []),
    AttrBases = calc_skill_attrs(Skills,
                                 AddSkills,
                                 Lev,
                                 [],
                                 []),
    case attr_type:do_attr(AttrBases, AttrCalc) of
        {false, Reason} ->
            logger:error("守护技能属性计算错误:~w",
                         [Reason],
                         guard_attr,
                         138),
            AttrCalc;
        {ok, NewAttrCalc} ->
            do_calc_guard(Rest, NewAttrCalc, Guard, Role)
    end;
do_calc_guard([skill_prac | Rest], AttrCalc, Guard,
              Role = #role{m_skill =
                               #m_skill{is_open_skl_prac = Flag}}) ->
    NewAttrCalc = case Flag of
                      1 -> skill_prac_attr:calc_guard(AttrCalc, Role);
                      _ -> AttrCalc
                  end,
    do_calc_guard(Rest, NewAttrCalc, Guard, Role);
do_calc_guard([buff | Rest], AttrCalc, Guard,
              Role = #role{m_buff = #m_buff{r_list = [_ | _]}}) ->
    NewAttrCalc = buff_attr:calc_guard(AttrCalc, Role),
    do_calc_guard(Rest, NewAttrCalc, Guard, Role);
do_calc_guard([buff | Rest], AttrCalc, Guard, Role) ->
    do_calc_guard(Rest, AttrCalc, Guard, Role);
do_calc_guard([tactics | Rest], AttrCalc,
              Guard = #guard{status = 1},
              Role = #role{m_guard =
                               #m_guard{tactics_attr =
                                            TacticsAttr = [_ | _]}}) ->
    AttrBases = attr_type:to_attr(base, TacticsAttr),
    case attr_type:do_attr(AttrBases, AttrCalc) of
        {false, Reason} ->
            logger:error("守护助战属性计算错误:~w",
                         [Reason],
                         guard_attr,
                         164),
            AttrCalc;
        {ok, NewAttrCalc} ->
            do_calc_guard(Rest, NewAttrCalc, Guard, Role)
    end;
do_calc_guard([tactics | Rest], AttrCalc, Guard,
              Role) ->
    do_calc_guard(Rest, AttrCalc, Guard, Role);
do_calc_guard([astroid | Rest], AttrCalc, Guard,
              Role) ->
    NewAttrCalc = guard_astroid:calc(AttrCalc, Guard),
    do_calc_guard(Rest, NewAttrCalc, Guard, Role);
do_calc_guard([Flag | Rest], AttrCalc, Guard, Role) ->
    logger:error("未知守护属性计算类型:~w", [Flag], guard_attr, 175),
    do_calc_guard(Rest, AttrCalc, Guard, Role).

calc_tactics_attr(Role = #role{m_guard =
                                   #m_guard{guards = Guards}}) ->
    calc_tactics_attr(Guards, Role, []).

calc_tactics_attr([], _Role, Acc) -> Acc;
calc_tactics_attr([#guard{status = 2, tac_pos = Pos,
                          score = Score}
                   | RestGuards],
                  Role = #role{lev = Lev}, Acc) ->
    FieldAttrs = guard_data:get_tactic_pos_attr({Pos, Lev}),
    CalcFieldAttrs = do_calc_tactics_attr(FieldAttrs,
                                          Score,
                                          []),
    calc_tactics_attr(RestGuards,
                      Role,
                      CalcFieldAttrs ++ Acc);
calc_tactics_attr([_H | RestGuards], Role, Acc) ->
    calc_tactics_attr(RestGuards, Role, Acc).

do_calc_tactics_attr([], _Score, Acc) -> Acc;
do_calc_tactics_attr([{Name, Val} | Rest], Score,
                     Acc) ->
    NewVal = max(1, round(Score / 600 * Val)),
    do_calc_tactics_attr(Rest,
                         Score,
                         [{Name, NewVal} | Acc]).

calc_tactics_effect(Guards, Role) ->
    calc_tactics_effect(Guards, Role, []).

calc_tactics_effect([], _, Guards) -> Guards;
calc_tactics_effect([Guard = #guard{} | T], Role,
                    Guards) ->
    NewGuard = calc(Guard, Role),
    guard_api:push_guard(Role, NewGuard),
    calc_tactics_effect(T, Role, [NewGuard | Guards]);
calc_tactics_effect([Guard | T], Role, Guards) ->
    calc_tactics_effect(T, Role, [Guard | Guards]).

calc_guard_point(#guard{classes = Classes},
                 InitCalc = #attr_calc{attr = Attr}, #role{lev = Lev}) ->
    #attr{strength = Str1, constitution = Con1,
          magic = Mag1, agility = Agi1, endurance = End1} =
        Attr,
    Lstr = attr_data:get_point_attr({101, Classes, Lev}),
    Lcon = attr_data:get_point_attr({102, Classes, Lev}),
    Lmag = attr_data:get_point_attr({103, Classes, Lev}),
    Lagi = attr_data:get_point_attr({104, Classes, Lev}),
    Lend = attr_data:get_point_attr({105, Classes, Lev}),
    V1 = attr_type:to_attr(base,
                           calc_point_attr(Lstr,
                                           Lcon,
                                           Lmag,
                                           Lagi,
                                           Lend,
                                           Str1,
                                           Con1,
                                           Mag1,
                                           Agi1,
                                           End1)),
    case attr_type:do_attr(V1, InitCalc) of
        {false, Reason} ->
            logger:error("宠物点属性换算出错[~w]:[~w]",
                         [V1, Reason],
                         guard_attr,
                         226),
            InitCalc;
        {ok, NewAc} -> NewAc
    end.

calc_point_attr(Lstr, Lcon, Lmag, Lagi, Lend, Str, Con,
                Mag, Agi, End) ->
    L1 = do_calc_point(Lstr, Str),
    L2 = do_calc_point(Lcon, Con),
    L3 = do_calc_point(Lmag, Mag),
    L4 = do_calc_point(Lagi, Agi),
    L5 = do_calc_point(Lend, End),
    L1 ++ L2 ++ L3 ++ L4 ++ L5.

do_calc_point(_L, 0) -> [];
do_calc_point(L, Val) ->
    [{Name, round(V * Val / 100)} || {Name, V} <- L].

calc_skill_attrs([], [], Lev, AttrBases, EffAttr) ->
    AttrBases1 = skill:dynamic_skill_attr(AttrBases, Lev),
    AttrBases2 = attr_type:to_attr(base,
                                   AttrBases1 ++ EffAttr),
    AttrBases2;
calc_skill_attrs([], [Id | T], Lev, AttrBases,
                 EffAttr) ->
    case skill_data:get_effect({Id, 1}) of
        #{attr := Attr} ->
            calc_skill_attrs([],
                             T,
                             Lev,
                             AttrBases,
                             EffAttr ++ Attr);
        _ -> calc_skill_attrs([], T, Lev, AttrBases, EffAttr)
    end;
calc_skill_attrs([Id | T], AddSkills, Lev, AttrBases,
                 EffAttr) ->
    case skill_data:get_guard({Id, 1}) of
        AttrBase = [_ | _] ->
            calc_skill_attrs(T,
                             AddSkills,
                             Lev,
                             AttrBase ++ AttrBases,
                             EffAttr);
        _ ->
            calc_skill_attrs(T, AddSkills, Lev, AttrBases, EffAttr)
    end.

calc_guard_score(Guard = #guard{base_id = GuardBaseId,
                                classes = Classes},
                 Attr) ->
    NewAttr = attr:to_list(Attr),
    BaseScore = case guard_data:get_guard_cfg(GuardBaseId)
                    of
                    #guard_data{base_score = Bs} -> Bs;
                    _ -> 0
                end,
    AstroidScore = guard_astroid:calc_score(Guard),
    calc_guard_score(NewAttr,
                     Classes,
                     BaseScore + AstroidScore,
                     0).

calc_guard_score([], _Classes, BaseScore, Score) ->
    erlang:round(BaseScore + Score / 11000 * 200);
calc_guard_score([{Name, Val} | Rest], Classes,
                 BaseScore, Score) ->
    S = guard_data:get_score({Classes, Name}),
    calc_guard_score(Rest,
                     Classes,
                     BaseScore,
                     S * Val / 1000 + Score).

