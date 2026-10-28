-file("src/mod/guild/guild_union.erl", 1).

-module(guild_union).

-export([get_applys/1,
         get_applied/1,
         apply_to/2,
         merge/3,
         gm/2,
         apply_guild/2,
         maintain_health/1,
         auto_merge/0,
         clear_applys/0]).

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

-file("src/mod/guild/guild_union.erl", 21).

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

-file("src/mod/guild/guild_union.erl", 22).

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

-file("src/mod/guild/guild_union.erl", 23).

-file("inc/rank.hrl", 1).

-record(rank,
        {type = 1,
         show_list = [],
         list = [],
         last_val = 0,
         len = 0}).

-record(rank_rc,
        {ver = 3 :: pos_integer(),
         id = {roleid, platform, zoneid} :: term(),
         rank = 1,
         time = 0 :: non_neg_integer(),
         role_id = 0 :: non_neg_integer(),
         platform = "" :: list(),
         zone_id = 0 :: non_neg_integer(),
         name = "" :: list(),
         sex = 0 :: 0..2,
         classes = 0 :: 0..4,
         lev = 0 :: non_neg_integer(),
         val1 = 0 :: non_neg_integer(),
         val2 = 0 :: non_neg_integer(),
         val3 = 0 :: non_neg_integer(),
         val4 = 0 :: non_neg_integer(),
         desc = "",
         pet,
         guard,
         eqm}).

-record(rank_cfg,
        {type = 0 :: non_neg_integer(),
         num = 100 :: non_neg_integer(),
         keys = [#rank_rc.val3, #rank_rc.val2, #rank_rc.val1] ::
             [pos_integer()],
         min_val = 1 :: pos_integer(),
         nologin = 0 :: non_neg_integer(),
         zone = rank_zone_1 :: atom()}).

-file("src/mod/guild/guild_union.erl", 24).

get_applys(#role{m_guild = #m_guild{id = Gid}}) ->
    case guild_mgr:attr(Gid, #guild.union_applys) of
        L when is_list(L) -> L;
        _ -> []
    end;
get_applys(_) -> [].

get_applied(#role{m_guild = #m_guild{id = Gid}}) ->
    case guild_mgr:attr(Gid, #guild.union_applied) of
        L when is_list(L) -> L;
        _ -> []
    end;
get_applied(_) -> [].

apply_to(#role{m_guild = #m_guild{id = Gid}}, Gid) ->
    {false, lang:get("请不要选择自己的公会")};
apply_to(#role{m_guild =
                   #m_guild{pid = Gpid, post = 60, id = Gid}},
         TargetId) ->
    case check([guild_truth_dare,
                guild_war,
                guild_hero,
                rank_open,
                self_rank,
                target_rank],
               #{self_id => Gid, target_id => TargetId})
        of
        true ->
            case guild_mgr:apply(sync,
                                 Gpid,
                                 {guild_union,
                                  apply_guild,
                                  [{apply_to, TargetId}]})
                of
                ok -> ok;
                Else -> Else
            end;
        Else -> Else
    end;
apply_to(_, _) -> {false, lang:get("只有会长才能进行此操作")}.

merge(#role{m_guild = #m_guild{id = Gid}}, Gid,
      _Decision) ->
    {false, lang:get("请不要选择自己的公会")};
merge(#role{m_guild =
                #m_guild{pid = Gpid, post = 60, id = Gid}},
      TargetId, Decision) ->
    case check([guild_truth_dare,
                guild_war,
                guild_hero,
                rank_open,
                self_rank,
                target_rank],
               #{self_id => Gid, target_id => TargetId})
        of
        true ->
            case guild_mgr:apply(sync,
                                 Gpid,
                                 {guild_union,
                                  apply_guild,
                                  [{merge, TargetId, Decision}]})
                of
                ok -> ok;
                Else -> Else
            end;
        Else -> Else
    end;
merge(_, _Id, _) -> {false, lang:get("只有会长才可以进行次操作")}.

gm(#role{m_guild = #m_guild{pid = Gpid, post = Post},
         pid = RPid},
   {set_health, Health}) ->
    guild_mgr:apply(async,
                    Gpid,
                    {guild_union,
                     apply_guild,
                     [{set_health, Health, RPid, Post}]}),
    ok;
gm(_, _Id) -> {false, lang:get("无效命令")}.

maintain_health(G = #guild{today_used_medal = UsedMedal,
                           last_medal_used = LastMedal, health = Health,
                           lev = Lev, members = Members}) ->
    OldRef = get(guild_health_ref),
    case is_reference(OldRef) of
        true -> erlang:cancel_timer(OldRef);
        false -> skip
    end,
    MedalNeed = case guild_data:uplev(Lev) of
                    #{medal_need := Mn} -> Mn;
                    _ -> 0
                end,
    logger:debug("需要勋章 ~w", [MedalNeed], guild_union, 106),
    NewHealth = case date:is_same_day(date:unixtime(),
                                      LastMedal)
                    of
                    true when UsedMedal >= MedalNeed ->
                        min(100, Health + 15);
                    true when UsedMedal * 100 div MedalNeed < 30 ->
                        max(0, Health - 20);
                    true when UsedMedal * 100 div MedalNeed < 50 ->
                        max(0, Health - 15);
                    true when UsedMedal * 100 div MedalNeed < 70 ->
                        max(0, Health - 10);
                    true when UsedMedal * 100 div MedalNeed < 90 ->
                        max(0, Health - 8);
                    true -> max(0, Health - 5);
                    _ -> max(0, Health - 20)
                end,
    case NewHealth < 100 of
        true ->
            Msg = notice:format(lang:get("当前公会健康度为~ts"),
                                [{string_2, 1, NewHealth}]),
            guild:notice(Members, Msg);
        _ -> ok
    end,
    case NewHealth =< 20 of
        true ->
            MailInfo = #{items => [], title => lang:get("公会健康度"),
                         content =>
                             notice:format(lang:get("公会健康度已经~ts（~ts），可能会被系统强制与其他公会合并，提升健康度：1.增加活跃人"
                                                    "数；2.降低公会等级可以降低活跃人数要求"),
                                           [get_health_str(NewHealth),
                                            {string_2, 1, NewHealth}])},
            mail:send([Mid || #guild_role{id = Mid} <- Members],
                      MailInfo);
        _ when NewHealth < 40 ->
            MailInfo = #{items => [], title => lang:get("公会健康度"),
                         content =>
                             notice:format(lang:get("公会健康度已经达到~ts（~ts），随时可能被其他公会合并，提升健康度：1.增加活跃人数；"
                                                    "2.降低公会等级可以降低活跃人数要求"),
                                           [get_health_str(NewHealth),
                                            {string_2, 1, NewHealth}])},
            mail:send([Mid || #guild_role{id = Mid} <- Members],
                      MailInfo);
        _ when NewHealth =< 60 ->
            MailInfo = #{items => [], title => lang:get("公会健康度"),
                         content =>
                             notice:format(lang:get("公会健康度已经达到~ts（~ts），建议管理成员加速招揽活跃人员，或者前往公会议长处申请与"
                                                    "其他公会合并，提升健康度：1.增加活跃人数；2.降低公会等级可以降低活跃人数要求"),
                                           [get_health_str(NewHealth),
                                            {string_2, 1, NewHealth}])},
            mail:send([Mid || #guild_role{id = Mid} <- Members],
                      MailInfo);
        _ -> ok
    end,
    NewLev = case NewHealth =< 20 andalso Lev > 1 of
                 true ->
                     Lev1 = Lev - 1,
                     Msg2 =
                         notice:format(lang:get("由于公会健康度达到~ts（~ts），公会等级将为~ts级"),
                                       [get_health_str(NewHealth),
                                        {string_2, 1, NewHealth},
                                        {string_2, 1, Lev1}]),
                     guild:notice(Members, Msg2),
                     MailInfo2 = #{items => [], title => lang:get("公会降级"),
                                   content =>
                                       notice:format(lang:get("由于公会健康度达到~ts（~ts），公会被降为~ts级，快选择合并公会或招揽活跃的成员吧！"),
                                                     [get_health_str(NewHealth),
                                                      {string_2, 1, NewHealth},
                                                      {string_2, 1, Lev1}])},
                     mail:send([Mid
                                || #guild_role{id = Mid, post = Post}
                                       <- Members,
                                   Post >= 40],
                               MailInfo2),
                     Lev1;
                 _ -> Lev
             end,
    HealthRef = erlang:send_after(date:next_diff(23, 55, 0)
                                      * 1000,
                                  self(),
                                  maintain_health),
    put(guild_health_ref, HealthRef),
    G#guild{health = NewHealth, lev = NewLev}.

get_health_str(NewHealth) when NewHealth =< 20 ->
    {string_2, 6, lang:get("独木难支")};
get_health_str(NewHealth) when NewHealth < 40 ->
    {string_2, 1, lang:get("危在旦夕")};
get_health_str(NewHealth) when NewHealth =< 50 ->
    {string_2, 2, lang:get("中规中矩")};
get_health_str(NewHealth) when NewHealth < 80 ->
    {string_2, 2, lang:get("生机盎然")};
get_health_str(_NewHealth) ->
    {string_2, 2, lang:get("兴旺昌盛")}.

auto_merge() ->
    Fun = fun (#guild{lev = Lev1, academy_lev = ALev1,
                      store_lev = SLev1, exchequer_lev = ELev1, assets = As1,
                      health = H1},
               #guild{lev = Lev2, academy_lev = ALev2,
                      store_lev = SLev2, exchequer_lev = ELev2, assets = As2,
                      health = H2}) ->
                  if H1 > H2 -> true;
                     H1 =:= H2 andalso Lev1 > Lev2 -> true;
                     H1 =:= H2 andalso
                         Lev1 =:= Lev2 andalso
                             ALev1 + SLev1 + ELev1 > ALev2 + SLev2 + ELev2 ->
                         true;
                     H1 =:= H2 andalso
                         Lev1 =:= Lev2 andalso
                             ALev1 + SLev1 + ELev1 =:= ALev2 + SLev2 + ELev2
                                 andalso As1 > As2 ->
                         true;
                     true -> false
                  end
          end,
    case get_top3() of
        [] -> ok;
        Top3 ->
            logger:debug("前3名公会 ~w", [Top3], guild_union, 190),
            SortL = lists:sort(Fun, ets:tab2list(guild_list)),
            L = [{Id, Health, Pid}
                 || #guild{id = Id, health = Health, pid = Pid,
                           lev = Lev}
                        <- SortL,
                    lists:member(Id, Top3) =:= false andalso
                        Health =< 50 andalso (Health > 39 orelse Lev =< 1)],
            case [O || O = {_, Health1, _} <- L, Health1 =< 39] of
                [] -> ok;
                L1 ->
                    do_auto_merge(L -- L1, L1),
                    guild_mgr ! clear_union_applys
            end
    end.

clear_applys() ->
    Fun = fun (#guild{pid = Pid}, _) ->
                  guild_mgr:apply(async,
                                  Pid,
                                  {guild_union, apply_guild, [clear_applys]})
          end,
    ets:foldl(Fun, ok, guild_list).

apply_guild(#guild{union_applys = Applys,
                   union_applied = Applied},
            get_applys) ->
    {ok, {ok, {Applys, Applied}}};
apply_guild(G = #guild{union_applied = Applied, id = Id,
                       name = Gname, leader_id = LeaderId,
                       leader_name = LeaderName},
            {apply_to, TargetId}) ->
    Res = case check_apply(G, TargetId) of
              true ->
                  Apply = #guild_union_apply{id = Id, name = Gname,
                                             leader_id = LeaderId,
                                             leader_name = LeaderName,
                                             ctime = date:unixtime()},
                  guild_mgr:apply(async,
                                  TargetId,
                                  {guild_union,
                                   apply_guild,
                                   [{be_applied, Apply}]}),
                  NewApplied = case lists:member(TargetId, Applied) of
                                   true -> Applied;
                                   _ -> [TargetId | Applied]
                               end,
                  {ok, G#guild{union_applied = NewApplied}};
              Else -> Else
          end,
    case Res of
        {ok, NewG = #guild{}} -> {ok, ok, NewG};
        _ -> {ok, Res}
    end;
apply_guild(G = #guild{union_applys = Applys,
                       leader_id = LeaderId},
            {be_applied,
             Apply = #guild_union_apply{id = Id, name = Gname}}) ->
    case lists:keyfind(Id, #guild_union_apply.id, Applys) of
        #guild_union_apply{} -> ok;
        _ ->
            MailInfo = #{items => [], title => lang:get("公会合并申请"),
                         content =>
                             notice:format(lang:get("公会管理员提醒：~ts我们公会发出合并申请，是否要同意请求（可在NPC-公会议长打开面板查看）"),
                                           [{string_2, 2, Gname}])},
            mail:send(LeaderId, MailInfo),
            role:pack_send(LeaderId, 11176, {Apply}),
            NewG = G#guild{union_applys = [Apply | Applys]},
            {ok, NewG}
    end;
apply_guild(G = #guild{union_applys = Applys},
            {merge, TargetId, 0}) ->
    Res = case lists:keyfind(TargetId,
                             #guild_union_apply.id,
                             Applys)
              of
              #guild_union_apply{} ->
                  {ok,
                   G#guild{union_applys =
                               lists:keydelete(TargetId,
                                               #guild_union_apply.id,
                                               Applys)}};
              _ -> {false, lang:get("找不到申请")}
          end,
    case Res of
        {ok, NewG = #guild{}} -> {ok, ok, NewG};
        _ -> {ok, Res}
    end;
apply_guild(G = #guild{union_applys = Applys},
            {merge, TargetId, _}) ->
    Res = case check_merge(G, TargetId) of
              true ->
                  case catch guild_mgr:apply(sync,
                                             TargetId,
                                             {guild_union,
                                              apply_guild,
                                              [be_merged]})
                      of
                      {ok, Name, NewMems} ->
                          logger:info("[~ts]公会被合并", [Name], guild_union, 275),
                          guild_mgr ! clear_union_applys,
                          do_merge(G#guild{union_applys =
                                               lists:keydelete(TargetId,
                                                               #guild_union_apply.id,
                                                               Applys)},
                                   Name,
                                   NewMems);
                      Else -> Else
                  end;
              Else -> Else
          end,
    case Res of
        {ok, NewG = #guild{}} -> {ok, ok, NewG};
        _ -> {ok, Res}
    end;
apply_guild(G = #guild{union_applys = Applys},
            {auto_merge, TargetId}) ->
    Res = case catch guild_mgr:apply(sync,
                                     TargetId,
                                     {guild_union, apply_guild, [be_merged]})
              of
              {ok, Name, NewMems} ->
                  logger:info("[~ts]公会被自动合并", [Name], guild_union, 292),
                  do_merge(G#guild{union_applys =
                                       lists:keydelete(TargetId,
                                                       #guild_union_apply.id,
                                                       Applys)},
                           Name,
                           NewMems);
              Else -> Else
          end,
    case Res of
        {ok, NewG = #guild{}} -> {ok, NewG};
        _ -> ok
    end;
apply_guild(G = #guild{members = Members, name = Name},
            be_merged) ->
    Reply = {ok, Name, Members},
    destory(G),
    {stop, normal, Reply, G};
apply_guild(G = #guild{},
            {set_health, Health, RolePid, Post}) ->
    Guild1 = G#guild{health = Health, flag = 1},
    role:pack_send(RolePid, 11100, {Guild1, Post}),
    {ok, Guild1};
apply_guild(G = #guild{union_applys = Applys},
            clear_applys) ->
    Gids = ets:select(guild_list,
                      [{#guild{id = '$1', _ = '_'}, [], ['$1']}]),
    NewApplys = [A
                 || A = #guild_union_apply{id = Aid} <- Applys,
                    lists:member(Aid, Gids)],
    Guild1 = G#guild{union_applys = NewApplys, flag = 1},
    {ok, Guild1};
apply_guild(_, _Info) ->
    logger:debug("未知回调 ~w", [_Info], guild_union, 322),
    ok.

check_apply(#guild{health = Health, id = Id}, TargetId)
    when Health =< 100 ->
    case guild_mgr:attr(TargetId, #guild.union_applys) of
        Applys when is_list(Applys) ->
            case lists:keyfind(Id, #guild_union_apply.id, Applys) of
                #guild_union_apply{} -> {false, lang:get("你已经向该公会申请过")};
                _ -> true
            end;
        _ -> {false, lang:get("找不到对方公会")}
    end;
check_apply(_, _) ->
    {false, lang:get("我们公会的健康度保持的很好，暂时不需要合并哦")}.

check_merge(#guild{health = Health,
                   union_applys = Applys},
            TargetId)
    when Health >= 40 ->
    case lists:keyfind(TargetId,
                       #guild_union_apply.id,
                       Applys)
        of
        #guild_union_apply{} ->
            case guild_mgr:info(by_id, TargetId) of
                {ok, #guild{health = THealth}} when THealth > 100 ->
                    {false, lang:get("对方公会健康度太高")};
                {ok, #guild{}} -> true;
                _ -> {false, lang:get("找不到指定公会")}
            end;
        _ -> {false, lang:get("找不到合并申请")}
    end;
check_merge(_, _) -> {false, lang:get("公会健康度不足")}.

do_merge(G = #guild{members = Members, health = Health},
         Name, NewJoin) ->
    MailInfo = #{items => [], title => lang:get("公会合并"),
                 content =>
                     notice:format(lang:get("~ts的所有成员已经合并加入我们，一起共创最强公会吧！"),
                                   [{string_2, 2, Name}])},
    lists:foreach(fun (#guild_role{id = Rid}) ->
                          mail:send(Rid, MailInfo);
                      (_) -> ok
                  end,
                  Members),
    NewG = #guild{members = NewMembers} =
               merge_mem(G#guild{health = max(Health, 80)},
                         NewJoin,
                         date:unixtime(),
                         Name),
    lists:foreach(fun (#guild_role{pid = Rpid})
                          when is_pid(Rpid) ->
                          role:pack_send(Rpid, 11173, {1, ""});
                      (_) -> ok
                  end,
                  NewMembers),
    Msg =
        notice:format(lang:get("~ts~ts的所有成员已经合并加入我们，大家一起鼓掌欢迎！"),
                      [{role_2, lang:get("公会总管:")}, {string_2, 2, Name}]),
    guild:notice(NewMembers, Msg),
    {ok, NewG}.

destory(Guild = #guild{id = GuildId,
                       mail_list = MailList}) ->
    case dets:delete(guild_list, GuildId) of
        ok ->
            catch ets:delete(guild_list, GuildId),
            rank_listener:handle(destory, Guild, 1),
            catch guild_auction:destory(Guild),
            catch guild_common:del_guild_mail(MailList),
            put(flag_destory, true),
            true;
        Err ->
            logger:error("销毁公会时发生异常:~w", [Err], guild_union, 391),
            {false, lang:get("公会系统暂时不可用，请稍后再试")}
    end.

merge_mem(Guild, [], _, _) -> Guild;
merge_mem(Guild = #guild{id = GuildId, name = GuildName,
                         pid = GuildPid, lev = GuildLev, members = Mem,
                         fresh_num = FreshNum, mem_num = MemNum},
          [Gr = #guild_role{id = RoleId, pid = RolePid,
                            post = Post}
           | T],
          EnterTime, OldGuildName) ->
    Gr1 = Gr#guild_role{mails = []},
    NewGr = case Post of
                0 -> Gr1;
                _ -> Gr1#guild_role{post = 10}
            end,
    {NewFreshNum, NewMemNum} = case Post of
                                   0 -> {FreshNum + 1, MemNum};
                                   _ -> {FreshNum, MemNum + 1}
                               end,
    guild_role:add_role(GuildId, RoleId),
    NewMem = [NewGr | Mem],
    Guild1 = Guild#guild{members = NewMem,
                         fresh_num = NewFreshNum, mem_num = NewMemNum},
    MailInfo = #{items => [], title => lang:get("公会合并"),
                 content =>
                     notice:format(lang:get("我方公会与~ts合并完成，快快努力融合新的集体吧！"),
                                   [{string_2, 2, GuildName}])},
    mail:send(RoleId, MailInfo),
    camp_guild_bady:fire(new_guild,
                         RoleId,
                         #{guild_id => GuildId, guild_name => GuildName}),
    NewGuild = case is_pid(RolePid) of
                   true ->
                       UpdateList = [{expel, OldGuildName},
                                     {create,
                                      GuildId,
                                      GuildLev,
                                      GuildPid,
                                      GuildName,
                                      NewGr}],
                       role:apply(async,
                                  RolePid,
                                  {guild_role, set, [UpdateList]}),
                       Guild1;
                   _ -> Guild1
               end,
    merge_mem(NewGuild, T, EnterTime, OldGuildName).

do_auto_merge(_, []) -> ok;
do_auto_merge([], [_]) -> ok;
do_auto_merge([], L1) ->
    Nth = length(L1) div 2,
    {L2, L3} = lists:split(Nth, L1),
    do_auto_merge(L2, L3);
do_auto_merge([{_, _, Pid} | T1], [{Id, _, _} | T2]) ->
    guild_mgr:apply(async,
                    Pid,
                    {guild_union, apply_guild, [{auto_merge, Id}]}),
    do_auto_merge(T1, T2).

check_rank(Gid) ->
    case rank:rank_index_of(31, Gid) of
        {_, Rank, _} when Rank > 0 andalso Rank < 4 -> false;
        _ -> true
    end.

check([], _) -> true;
check([guild_truth_dare | T], Args) ->
    case guild_truth_dare_mgr:call(get_status) of
        {ok, 1} ->
            {false, lang:get("真心话大冒险正在开启, 请在真心话大冒险结束后再操作")};
        _ -> check(T, Args)
    end;
check([guild_war | T], Args) ->
    case guild_war:is_matched() of
        true -> {false, lang:get("公会战现在已匹配，请在公会战结束后再操作")};
        _ -> check(T, Args)
    end;
check([guild_hero | T], Args) ->
    case guild_hero:is_arranging() of
        true -> {false, lang:get("公会英雄活动在安排队长中，请在活动结束后再操作")};
        _ -> check(T, Args)
    end;
check([rank_open | T], Args) ->
    case rank:list_show(31) of
        [] -> {false, lang:get("合服当天不能合公会，明天再来试试吧")};
        _ -> check(T, Args)
    end;
check([self_rank | T], Args = #{self_id := Gid}) ->
    case check_rank(Gid) of
        false -> {false, lang:get("本公会在本服排名前3以内，无法申请合入其他公会")};
        _ -> check(T, Args)
    end;
check([target_rank | T], Args = #{target_id := Gid}) ->
    case check_rank(Gid) of
        false -> {false, lang:get("该公会在本服排名前3以内，无法申请合入")};
        _ -> check(T, Args)
    end.

get_top3() ->
    [Id
     || #rank_rc{id = Id}
            <- lists:sublist(rank:list_show(31), 3)].

