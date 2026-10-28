-file("src/mod/guild/guild_common.erl", 1).

-module(guild_common).

-export([join/2,
         sync_join/2,
         leave/1,
         sync_leave/3,
         appoint/3,
         expel/2,
         add_assets/2,
         modify_board/3,
         transfer/4,
         join_info/1,
         set_condition/4,
         approve/3,
         sync_approve_join/2,
         set_signature/3,
         add_event/3,
         clear_apply/3,
         get_signable/1,
         donate/2,
         send_envelop/5,
         grab_envelop/2,
         look_envelope/2,
         update_donation/2,
         add_donation/2,
         change_totem/2,
         buy_totem_chance/1,
         help_shipping/2,
         sync_help_shipping/3,
         cancel_help_shipping/3,
         sync_cancel_help_shipping/3,
         propagate/1,
         finish_propagating/1,
         usurp/1,
         sync_usurp/2,
         reject_usurping/2,
         sync_reject_usurping/3,
         invite/2,
         apply_all/1,
         sync_invite/2,
         reply_invitation/3,
         usurp_done/1,
         send_mail/3,
         sync_send_mail/2,
         mark_mail/2,
         exchange_donation/2,
         push_exchangable/1,
         exchange_assets/2,
         push_exchangable_assets/1,
         set_formalizing_lev/2,
         rename/2,
         sync_rename/2,
         msg/1,
         get_mails/1,
         del_guild_mail/1,
         sync_adm_transfer/3,
         async_dismis/1,
         sync_adm_modify_board/2,
         sync_mark_board_lock/2,
         get_guild_mail/1]).

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

-file("src/mod/guild/guild_common.erl", 71).

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

-file("src/mod/guild/guild_common.erl", 72).

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

-file("src/mod/guild/guild_common.erl", 73).

-file("inc/condition.hrl", 1).

-record(condition,
        {label :: undefined | atom(),
         op = eq ::
             ue | eq | lt | gt | le | ge | range | include,
         val :: undefined | term(),
         msg = "" :: list()}).

-file("src/mod/guild/guild_common.erl", 74).

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

-file("src/mod/guild/guild_common.erl", 75).

-file("inc/trigger.hrl", 1).

-record(trigger,
        {id = 1 :: pos_integer(),
         label :: undefined | atom(),
         m :: undefined | atom(),
         f :: undefined | function() | atom(),
         a = [] :: list()}).

-record(evt_enter_map,
        {id = 1 :: pos_integer(),
         base_id = 1 :: pos_integer(),
         x = 0 :: non_neg_integer(),
         y = 0 :: non_neg_integer()}).

-record(evt_ico, {id = 0 :: non_neg_integer()}).

-record(evt_close_guide, {id = 0 :: pos_integer()}).

-record(evt_guild, {}).

-record(evt_guild_leave, {val = 0}).

-record(evt_guild_war, {}).

-record(evt_battle_plot,
        {plot_id = 1 :: pos_integer(),
         role_id = {1, "", 0} ::
             {pos_integer(), bitstring(), non_neg_integer()},
         role_name = "" :: bitstring(),
         role_pid :: undefined | pid()}).

-record(evt_plot,
        {id = 1 :: pos_integer(), type = 1 :: pos_integer()}).

-record(evt_shop_buy,
        {assets_type = 0 :: non_neg_integer(),
         val = 0 :: non_neg_integer(),
         base_id = 0 :: non_neg_integer(),
         bind = 0 :: 0..1,
         num = 0 :: non_neg_integer()}).

-record(evt_store_buy, {s_items = []}).

-record(evt_enchant,
        {base_id = 1 :: pos_integer(),
         pre_lev = 1 :: pos_integer(),
         lev = 1 :: pos_integer(),
         type = 0 :: non_neg_integer(),
         pos = 0 :: non_neg_integer(),
         quality = 0 :: non_neg_integer()}).

-record(evt_select, {type = 0 :: non_neg_integer()}).

-record(evt_guild_lev, {}).

-record(evt_skill_up, {id = 0, lev = 0}).

-record(evt_skill_unique_up, {id = 0, lev = 0}).

-record(evt_quest_treasure, {}).

-record(evt_fc,
        {val :: undefined | pos_integer(),
         now_val = 0 :: non_neg_integer()}).

-record(evt_wedding_score, {}).

-record(evt_wedding_req_agreed, {}).

-record(evt_wedding_marry, {}).

-record(evt_wedding_divorce, {}).

-record(evt_guard, {base_id = 0, num = 0}).

-record(evt_leave_map,
        {id = 1 :: pos_integer(),
         base_id = 1 :: pos_integer(),
         x = 0 :: non_neg_integer(),
         y = 0 :: non_neg_integer()}).

-record(evt_move_map,
        {base_id = 1 :: non_neg_integer(),
         x = 0 :: non_neg_integer(),
         y = 0 :: non_neg_integer()}).

-record(evt_dungeon_enter,
        {id = 0 :: non_neg_integer()}).

-record(evt_dungeon_exit,
        {id = 0 :: non_neg_integer()}).

-record(evt_dungeon_pass,
        {id = 0 :: non_neg_integer()}).

-record(evt_dungeon_kill_unit,
        {dun_id = 0, unit_id = 0}).

-record(evt_dungeon_unit_reward,
        {id = 0 :: non_neg_integer()}).

-record(evt_get_item,
        {base_id = 1 :: pos_integer(),
         num = 1 :: pos_integer()}).

-record(evt_use_item,
        {base_id :: undefined | pos_integer(),
         num = 0 :: pos_integer()}).

-record(evt_use_item_type,
        {type = 0 :: non_neg_integer()}).

-record(evt_del_item,
        {base_id :: undefined | pos_integer(),
         num = 0 :: pos_integer()}).

-record(evt_gain_coin,
        {val = 1 :: pos_integer(),
         source :: undefined | atom()}).

-record(evt_have_coin, {val = 1 :: pos_integer()}).

-record(evt_loss_coin,
        {val = 1 :: pos_integer(),
         reason :: undefined | atom()}).

-record(evt_gain_gold,
        {val = 1 :: pos_integer(),
         source :: undefined | atom()}).

-record(evt_loss_gold,
        {val = 1 :: pos_integer(),
         reason :: undefined | atom()}).

-record(evt_loss_gold_bind, {val = 1 :: pos_integer()}).

-record(evt_levup,
        {old_lev = 0 :: non_neg_integer(),
         lev = 0 :: non_neg_integer()}).

-record(evt_logout, {}).

-record(evt_tower, {floor = 0, unit_id = 0}).

-record(evt_tower_floor, {floor = 0}).

-record(evt_glory, {lev_id = 0}).

-record(evt_reset_eqm, {type = 0}).

-record(evt_cli_loaded, {mod = 0 :: non_neg_integer()}).

-record(evt_eqm, {type = 0}).

-record(evt_pet_war, {base_id = 0}).

-record(evt_pet_skill, {base_id = 0}).

-record(evt_pet_rest, {base_id = 0}).

-record(evt_select_pet, {}).

-record(evt_get_pet,
        {base_id = 0,
         genre = 0,
         lev = 0,
         status = 0,
         is_catched = false,
         talent = 0}).

-record(evt_del_pet, {base_id = 0, num = 0}).

-record(evt_levup_pet,
        {pet_id = 0, base_id = 0, lev = 0}).

-record(evt_aptitude_pet, {base_id = 0, genre = 0}).

-record(evt_pick_flower, {id}).

-record(evt_send_flower,
        {num = 0, val = 0, base_id = 0, recv_id, items = []}).

-record(evt_recv_flower, {num = 0, val = 0, send_id}).

-record(evt_accept_quest, {id = 0 :: pos_integer()}).

-record(evt_commit_quest,
        {id = 0 :: pos_integer(), sec_type = 0}).

-record(evt_finish_quest, {id = 0 :: pos_integer()}).

-record(evt_quest_guild_round, {}).

-record(evt_commit_quest_chain,
        {id = 0 :: pos_integer(), type = 0}).

-record(evt_giveup_quest, {id = 0 :: pos_integer()}).

-record(evt_quest_del, {id = 0 :: pos_integer()}).

-record(evt_map_role_enter,
        {id = 0 :: non_neg_integer(),
         platform = <<>> :: bitstring(),
         zone_id = 0 :: non_neg_integer(),
         map_id = 1 :: pos_integer(),
         map_base_id = 1 :: pos_integer(),
         x = 0 :: non_neg_integer(),
         y = 0 :: non_neg_integer()}).

-record(evt_map_role_move,
        {role_id = {0, "", 0},
         role_pid = 0 :: non_neg_integer() | pid(),
         map_id = 1 :: pos_integer(),
         map_base_id = 1 :: pos_integer(),
         sx = 0 :: non_neg_integer(),
         sy = 0 :: non_neg_integer(),
         dx = 0 :: non_neg_integer(),
         dy = 0 :: non_neg_integer(),
         event = 0 :: non_neg_integer()}).

-record(evt_map_role_leave,
        {role_pid = 0 :: non_neg_integer() | pid(),
         map_id = 1 :: pos_integer(),
         map_base_id = 1 :: pos_integer()}).

-record(evt_combat_round,
        {round :: undefined | pos_integer(),
         self = [] :: [tuple()],
         opp = [] :: [tuple()]}).

-record(evt_combat_init,
        {self = [] :: [tuple()], opp = [] :: [tuple()]}).

-record(evt_kill_npc,
        {id = 0 :: non_neg_integer(),
         base_id = 1 :: pos_integer(),
         origin_id = {1, 1} :: tuple(),
         ratio_val = 0,
         num = 1 :: pos_integer()}).

-record(evt_kill_npc_lose,
        {id = 0 :: non_neg_integer(),
         base_id = 1 :: pos_integer(),
         num = 1 :: pos_integer()}).

-record(evt_kill_role_clone,
        {id = {0, "robot", 0}, ratio_val = 0}).

-record(evt_fight_unit,
        {id = 0 :: non_neg_integer(),
         base_id = 1 :: pos_integer(),
         num = 1 :: pos_integer()}).

-record(evt_mount_combat,
        {combat_type = 0 :: non_neg_integer(),
         is_win = 0 :: non_neg_integer()}).

-record(evt_unit_click,
        {id = 0 :: non_neg_integer(),
         role_id = {0, "", 0},
         name = "",
         pid,
         type = 0 :: non_neg_integer(),
         base_id = 0 :: non_neg_integer(),
         do_type = -1 :: integer()}).

-record(evt_online_time, {acc_time = 0, add_val = 0}).

-record(evt_battle_role_enter,
        {id = 0 :: non_neg_integer(),
         platform = "" :: bitstring(),
         zone_id = 0 :: non_neg_integer(),
         pid :: undefined | pid(),
         conn_pid :: undefined | pid(),
         name = "" :: bitstring(),
         dun_id = 0 :: non_neg_integer(),
         last_pos = {0, 0, 0} ::
             {non_neg_integer(),
              non_neg_integer(),
              non_neg_integer()},
         enter_pos = {0, 0, 0} ::
             {non_neg_integer(),
              non_neg_integer(),
              non_neg_integer()},
         dun_role :: undefined | tuple()}).

-record(evt_battle_enter_map,
        {id = {0, "", 0} ::
             {non_neg_integer(), bitstring(), non_neg_integer()},
         name = "" :: bitstring(),
         pid :: undefined | pid(),
         map_base_id = 0 :: non_neg_integer()}).

-record(evt_battle_role_login,
        {id = 0 :: non_neg_integer(),
         platform = "" :: bitstring(),
         zone_id = 0 :: non_neg_integer(),
         pid :: undefined | pid(),
         conn_pid :: undefined | pid(),
         name = "" :: bitstring(),
         last_pos = {0, 0, 0} ::
             {non_neg_integer(),
              non_neg_integer(),
              non_neg_integer()},
         enter_pos = {0, 0, 0} ::
             {non_neg_integer(),
              non_neg_integer(),
              non_neg_integer()}}).

-record(evt_battle_role_exit,
        {id = 0 :: non_neg_integer(),
         platform = "" :: bitstring(),
         zone_id = 0 :: non_neg_integer(),
         name = "" :: bitstring()}).

-record(evt_battle_role_logout,
        {id = 0 :: non_neg_integer(),
         platform = "" :: bitstring(),
         zone_id = 0 :: non_neg_integer(),
         name = "" :: bitstring(),
         ext_id = 0 :: non_neg_integer()}).

-record(evt_battle_unit_killed,
        {unit_id = {1, 1} :: {pos_integer(), pos_integer()},
         base_id = 1 :: pos_integer(),
         type = 1 :: pos_integer(),
         role_list = [] ::
             [{role_id(), list(), undefined | pid()}]}).

-record(evt_battle_unit_picked,
        {unit_id = {1, 1} :: {pos_integer(), pos_integer()},
         base_id = 1 :: pos_integer(),
         type = 102 :: pos_integer(),
         action_type = 1 :: pos_integer(),
         map_base_id = 1,
         x = 1,
         y = 1,
         role_id = {1, "", 0},
         role_name = "",
         role_pid}).

-record(evt_battle_unit_die,
        {unit_id = {1, 1} :: {pos_integer(), pos_integer()},
         base_id = 1 :: pos_integer(),
         type = 1 :: pos_integer()}).

-record(evt_create_unit,
        {unit_id = {1, 1}, base_id = 1, type = 1}).

-record(evt_team_join, {pid :: undefined | pid()}).

-record(evt_team_leave, {}).

-record(evt_team_away, {}).

-record(evt_team_follow, {}).

-record(evt_team_appoint, {status, leader_id}).

-record(evt_arena_fight, {}).

-record(evt_arena_win, {cup = 0}).

-record(evt_trial, {mode = 0}).

-record(evt_escort, {}).

-record(evt_friend, {num = 0}).

-record(evt_fairyland, {}).

-record(evt_fairyland_floor,
        {floor = 0, is_leader = 0}).

-record(evt_fairyland_box, {box_punish = 0}).

-record(evt_pet, {}).

-record(evt_pet_lev, {old_lev = 0, lev = 0}).

-record(evt_quest_offer_ring, {ring = 0, old_ring = 0}).

-record(evt_quest_offer_reward, {}).

-record(evt_qualifying_combat, {type = 0}).

-record(evt_qualifying_combat_over,
        {type = 0, win_flag = 0}).

-record(evt_guild_answer, {}).

-record(evt_parade, {}).

-record(evt_market_silver_first_on_sale, {}).

-record(evt_market_gold_bind_buy,
        {base_id = 0,
         num = 0,
         init_price = 0,
         price = 0,
         margin = 0}).

-record(evt_market_gold_bind_sold,
        {base_id = 0, price = 0}).

-record(evt_kill_guild_robber, {}).

-record(evt_shipping_sail, {type = 0}).

-record(evt_shipping_commit, {type = 0, pack_type = 0}).

-record(evt_shipping_help, {}).

-record(evt_treasure, {base_id = 0}).

-record(evt_treasure_compass, {}).

-record(evt_guild_propagate, {}).

-record(evt_pay, {sn = "", gold = 0, source = 0}).

-record(evt_kill_treasure_ghost, {}).

-record(evt_pray, {}).

-record(evt_skill_prac_levup, {id = 0, lev = 0}).

-record(evt_skill_life_levup, {id = 0, lev = 0}).

-record(evt_skill_life_produce,
        {id = 0, base_id = 0, num = 0}).

-record(evt_blacksmith_embed, {num = 0}).

-record(evt_blacksmith_embed_lev, {lev = 0}).

-record(evt_blacksmith_enchant,
        {base_id = 0,
         is_succ = 0,
         luck_list = 0,
         is_protect = 0,
         all_lev = 0,
         pre_all_lev = 0,
         sum_lev = 0,
         pre_sum_lev = 0}).

-record(evt_guild_plant_mature, {}).

-record(evt_examination, {type = 1 :: 1..3}).

-record(evt_question_match, {score = 0}).

-record(evt_question_match_answer, {is_right = 0}).

-record(evt_question_match_mvp, {}).

-record(evt_question_match_last_right, {count = 0}).

-record(evt_warrior_fight, {win_flag = 0}).

-record(evt_warrior_reward, {win_flag = 0, score = 0}).

-record(evt_warrior, {}).

-record(evt_gold_league_fight, {win_flag = 0}).

-record(evt_gold_league_reward,
        {win_flag = 0, score = 0}).

-record(evt_gold_league, {}).

-record(evt_achievement, {id = 0}).

-record(evt_gain_achieve, {val = 0}).

-record(evt_gain_gold_bind,
        {val = 1 :: pos_integer(),
         source :: undefined | atom()}).

-record(evt_have_gold_bind, {val = 1 :: pos_integer()}).

-record(evt_wing,
        {grade = 1 :: pos_integer(),
         growth = 1 :: pos_integer(),
         star = 0}).

-record(evt_wing_reset, {}).

-record(evt_wing_skill, {count = 0}).

-record(evt_wing_lev,
        {grade = 1 :: pos_integer(), star_lev = 0}).

-record(evt_fuse, {base_id = 0 :: non_neg_integer()}).

-record(evt_guild_post,
        {post = 0 :: non_neg_integer()}).

-record(evt_examination_answer,
        {is_right = 1 :: 1 | 2}).

-record(evt_pet_use_item, {base_id = 0}).

-record(evt_pet_repleace_skill, {}).

-record(evt_activity, {val = 0}).

-record(evt_pet_rename, {}).

-record(evt_pet_free, {}).

-record(evt_pet_stone_upgrade, {grade = 0}).

-record(evt_guard_upgrade_eqm, {}).

-record(evt_guard_reset_eqm, {}).

-record(evt_guard_embed_gem, {}).

-record(evt_friend_intimacy, {val = 0}).

-record(evt_friend_intimacy_camp,
        {val = 0, target_id = {0, "", 0}}).

-record(evt_friend_zone_photo, {}).

-record(evt_friend_zone_like, {val = 0}).

-record(evt_friend_zone_liked, {val = 0}).

-record(evt_friend_zone_like_baby, {val = 0}).

-record(evt_friend_zone_leave_trend, {}).

-record(evt_friend_zone_leave_trended, {val = 0}).

-record(evt_formation_lev, {id = 0, lev = 0}).

-record(evt_alchemy_produce, {item_list = []}).

-record(evt_alchemy_melt, {item_list = []}).

-record(evt_classes_challenge_order, {order = 0}).

-record(evt_classes_challenge_rank, {rank = 0}).

-record(evt_classes_challenge_up_rank, {rank = 0}).

-record(evt_market_silver_assets,
        {assets = coin, val = 0}).

-record(evt_market_silver_sold,
        {assets = [], sold_items = []}).

-record(evt_market_silver_buy, {num = 0}).

-record(evt_combat_statistics,
        {revive = 0,
         pet_revive = 0,
         cast_pet = 0,
         use_item = 0,
         is_win = 0,
         is_die = 0,
         guard = [],
         kill_group = 0,
         killed_group = 0,
         kill_group_pet = 0,
         kill_group_target = 0,
         killed_group_target = 0,
         kill_group_target_pet = 0}).

-record(evt_honor, {id = 0}).

-record(evt_pre_honor, {pre_id = 0}).

-record(evt_fashion, {}).

-record(evt_gain_character, {val = 1 :: pos_integer()}).

-record(evt_campaign_unit_match, {val = 0}).

-record(evt_campaign_unit_heap2, {val = 0}).

-record(evt_campaign_unit_match_boss, {val = 0}).

-record(evt_campaign_unit_card, {val = 0}).

-record(evt_campaign_unit_card_boss, {val = 0}).

-record(evt_campaign_unit_order, {val = 0}).

-record(evt_campaign_unit_order_boss, {val = 0}).

-record(evt_campaign_unit_steal, {val = 0}).

-record(evt_campaign_unit_kill, {val = 0}).

-record(evt_campaign_unit_base, {val = 0}).

-record(evt_campaign_unit_kill_boss, {val = 0}).

-record(evt_campaign_unit_fox, {val = 0}).

-record(evt_qualifying, {}).

-record(evt_gain_guild, {val = 1 :: pos_integer()}).

-record(evt_guard_score,
        {val = 0 :: non_neg_integer()}).

-record(evt_constellation,
        {lev = 0 :: non_neg_integer(),
         base_id = 0 :: non_neg_integer()}).

-record(evt_constellation_score,
        {lev = 0 :: non_neg_integer(),
         base_id = 0 :: non_neg_integer()}).

-record(evt_roll,
        {point = 0 :: non_neg_integer(),
         reward = 0 :: non_neg_integer()}).

-record(evt_finish_marriage_question, {}).

-record(evt_commit_marriage_question, {}).

-record(evt_marriage_flower, {}).

-record(evt_finish_couple_question, {}).

-record(evt_finish_couple_task, {}).

-record(evt_commit_couple_question, {}).

-record(evt_couple_flower, {}).

-record(evt_cultivate_plant, {}).

-record(evt_guild_plant_irrigate, {}).

-record(evt_teacher_score_sum, {score = 0}).

-record(evt_teacher_student, {num = 0}).

-record(evt_finish_ask_question, {fun_type = 0}).

-record(evt_teacher_to_sudent, {id = {0, "", 0}}).

-record(evt_teacher, {num = 0}).

-record(evt_commit_ask_question, {}).

-record(evt_get_pet_item_skill_guide, {}).

-record(evt_brave_trial_order, {order = 0}).

-record(evt_shipping_dun, {flag = 0}).

-record(evt_consume, {gold = 0, source = 0}).

-record(evt_guild_hero, {}).

-record(evt_hero, {}).

-record(evt_lover_combat, {win_flag = 0}).

-record(evt_wedding_treasure, {base_id = 0}).

-record(evt_constellation_first, {base_id = 0}).

-record(evt_boss_first, {base_id = 0}).

-record(evt_quest_prac_help, {}).

-record(evt_arena_win_rate, {classes = 0, rate = 0}).

-record(evt_wedding_guest, {}).

-record(evt_dragon_boat, {camp_id = 0}).

-record(evt_dragon_boat_rank, {camp_id = 0, rank = 0}).

-record(evt_dragon_boat_cplt,
        {camp_id = 0, time_span = 0}).

-record(evt_mount_dye_diff, {dye_id = 0, val = 0}).

-record(evt_arena_cup, {cup = 0}).

-record(evt_arena_cup_target, {id = 0}).

-record(evt_arena_roll, {flag = 0, num = 0}).

-record(evt_achi_num, {id = 0, num = 0}).

-record(evt_dun_first, {id = 0, floor = 0}).

-record(evt_tournament_combat, {type = 0}).

-record(evt_comprehend_eqm, {}).

-record(evt_elf_combat, {}).

-record(evt_finish_goal, {id = 0}).

-record(evt_hide_seek, {}).

-record(evt_hide_seek_help, {}).

-record(evt_hide_seek_reward, {}).

-record(evt_camp_fruit, {base_id = 0, num = 0}).

-record(evt_camp_fruit_help, {base_id = 0, num = 0}).

-record(evt_camp_fruit_reward, {}).

-record(evt_tournament,
        {awesome_kill = 0,
         awesome_kill_num = 0,
         awesome_dmg = 0,
         awesome_heal = 0,
         awesome_control = 0,
         mvp = 0,
         rank_lev = 0,
         liked = 0 :: non_neg_integer(),
         best_win_count = 0 :: non_neg_integer()}).

-record(evt_tournament_point,
        {rank_lev = 0, rank_point = 0}).

-record(evt_friend_circle,
        {photos = 0, mentions = 0, day_num = 0}).

-record(evt_friend_circle_liked, {num = 0, other = 0}).

-record(evt_friend_circle_like, {self = 0}).

-record(evt_friend_circle_commented,
        {num = 0, other = 0}).

-record(evt_friend_circle_comment, {self = 0}).

-record(evt_family_update, {type = 0, lev = 0}).

-record(evt_family, {lev = 0}).

-record(evt_family_env, {env = 0}).

-record(evt_family_self_magic_beans, {}).

-record(evt_family_help_magic_beans, {}).

-record(evt_family_furnishing, {type = 0, count = 0}).

-record(evt_own_mount, {status = 0, count = 0}).

-record(evt_mount_growth, {growth = 0}).

-record(evt_mount_appearand, {count = 0}).

-record(evt_mount_mange_pet, {}).

-record(evt_mount_lev, {lev = 0}).

-record(evt_mount_attr, {}).

-record(evt_everyday, {val = 0}).

-record(evt_campaign_reward,
        {type = 0, sec_type = 0, id = 0}).

-record(evt_wedding_day, {day = 0}).

-record(evt_lev_break, {}).

-record(evt_enjoy_moon, {}).

-record(evt_enjoy_moon_wish, {type = 1}).

-record(evt_join_glue_pudding, {}).

-record(evt_glue_pudding_answer, {result = 0}).

-record(evt_glue_pudding_win, {}).

-record(evt_join_kongming_lanterns, {camp_id = 0}).

-record(evt_kongming_lanterns_answer,
        {camp_id = 0, result = 0}).

-record(evt_kongming_lanterns_win, {camp_id = 0}).

-record(evt_join_mid_pudding, {}).

-record(evt_mid_pudding_answer, {result = 0}).

-record(evt_mid_pudding_win, {}).

-record(evt_mid_pudding_agenda, {}).

-record(evt_guild_dragon, {}).

-record(evt_lev_break_active, {}).

-record(evt_camp_cake_finish, {}).

-record(evt_camp_cake_exit, {}).

-record(evt_camp_cake_sub, {}).

-record(evt_national_wisdom, {}).

-record(evt_national_wisdom_right, {}).

-record(evt_national_wisdom_luckyer, {}).

-record(evt_campaign_bag_fill, {}).

-record(evt_rainbow_lottery_day, {}).

-record(evt_campaign_bag_reward, {}).

-record(evt_lev_break_exch, {val = 0}).

-record(evt_classes_modify_times, {times = 0}).

-record(evt_use_fruit_limit, {base_id = 0, lev = 0}).

-record(endless_challenge_cross, {wave = 0}).

-record(endless_challenge_card, {}).

-record(evt_camp_halloween, {}).

-record(evt_camp_halloween_rank, {win = 0, rank = 0}).

-record(evt_camp_halloween_first, {}).

-record(evt_sworn_finish, {times = 0}).

-record(evt_sworn_invite, {times = 0}).

-record(evt_sworn_defined_name, {times = 0}).

-record(evt_sworn_name, {times = 0}).

-record(evt_sworn_skill, {times = 0}).

-record(evt_other, {}).

-record(evt_guild_league_join, {}).

-record(evt_guild_league_cannon, {}).

-record(evt_guild_league_win, {}).

-record(evt_campaign_snow, {val = 0}).

-record(evt_child_info,
        {growth_type = 0, skills = [], talent_skills = []}).

-record(evt_child_eat, {base_id = 0, num = 0}).

-record(evt_child_study,
        {study_str = 0,
         study_con = 0,
         study_mag = 0,
         study_agi = 0,
         study_end = 0}).

-record(evt_go_to_bed, {}).

-record(evt_child_combat,
        {combat_type = 0 :: non_neg_integer(),
         is_win = 0 :: non_neg_integer()}).

-record(evt_child_deliver, {}).

-record(evt_child_grow, {stage}).

-record(evt_fashion_collect_lev, {lev = 0}).

-record(evt_maze, {times = 0}).

-record(evt_maze_sweep, {}).

-record(evt_maze_monster, {}).

-record(evt_maze_gold, {gold = 0}).

-record(evt_maze_monkey, {}).

-record(evt_maze_cat, {}).

-record(evt_may_day_bags, {}).

-record(evt_may_day_help, {}).

-record(evt_may_day_clean, {camp_id = 0}).

-record(evt_rencounter, {is_win = 0}).

-record(evt_rencounter_star,
        {rank_lev = 1, star = 0, total_star = 0}).

-record(evt_guild_siege_combat, {is_win = 0, star = 1}).

-record(evt_guild_dungeon, {}).

-record(evt_guild_pray, {}).

-record(evt_talisman, {type = 0, id = 0}).

-record(evt_camp_whiteday, {type = 0}).

-record(evt_camp_animal_chess, {}).

-record(evt_animal_chess_win, {}).

-record(evt_animal_chess_soldier, {}).

-record(evt_animal_chess_fail, {}).

-record(evt_animal_chess_coach_killed, {}).

-record(evt_animal_chess_kill_coach, {}).

-record(evt_animal_chess_kill_soldier, {}).

-record(evt_pet_add_point, {pet_id = 0, base_id = 0}).

-record(evt_combat_over,
        {combat_type = 0, win_flag = win}).

-record(evt_goodvoice, {}).

-record(evt_spirit_treasure_general, {}).

-record(evt_spirit_treasure_boss, {}).

-record(evt_spirit_treasure_offer_star, {star = 0}).

-record(evt_spirit_treasure_first_kill, {}).

-record(evt_spirit_treasure_boss_wave, {wave = 0}).

-record(evt_oracle_treasure_general, {}).

-record(evt_oracle_treasure_boss, {}).

-record(evt_oracle_treasure_offer_star, {star = 0}).

-record(evt_oracle_treasure_first_kill, {}).

-record(evt_oracle_treasure_boss_wave, {wave = 0}).

-record(evt_oracle_treasure_boss_times, {times = 0}).

-record(evt_camp_7_7th_point, {val = 0}).

-record(evt_chat_guild, {}).

-record(evt_guard_activate, {}).

-record(evt_exquisite_shelf_wave, {wave = 0}).

-record(evt_chat, {channel = undefined, content = ""}).

-record(evt_combat_wing_power, {val = 0}).

-record(evt_combat_sq_point,
        {combat_type = 0,
         is_win = lose,
         val = 0,
         unit_lev = 0}).

-record(evt_guild_dragon_times, {times = 0}).

-record(evt_guild_dragon_rank, {rank = 0}).

-record(evt_guild_dragon_total_point, {point = 0}).

-record(evt_exquisite_shelf_help, {}).

-record(evt_rushing_top_final_times, {final_times = 0}).

-record(g_evt_lev, {val = 0}).

-record(g_evt_member, {val = 0}).

-record(evt_expression, {}).

-record(evt_fuse_expression, {cost_item_id = 0}).

-record(evt_kingbadge,
        {base_id = 0 :: non_neg_integer()}).

-record(evt_sprog_mount, {}).

-record(evt_gods_duel_score, {score = 0}).

-record(evt_provocation_times, {}).

-record(evt_provocation_5v5, {}).

-record(evt_quest_offer_teacher, {}).

-record(evt_boss_teacher, {}).

-record(evt_constellation_kill, {}).

-record(evt_tower_teacher, {}).

-record(evt_gain_experience, {val = 0}).

-record(evt_provocation_use_horn, {}).

-record(evt_provocation_duel_win, {}).

-record(evt_provocation_duel_5v5_win, {}).

-record(evt_stars_trial,
        {base_id = 0,
         round = 99,
         use_item_num = 50,
         self_die_times = 0,
         pet_summon = 0,
         combat_formation = 0}).

-record(evt_stars_trial_combat_round, {dies = []}).

-record(evt_stars_trial_combat,
        {npc_dies = 0,
         after_die_done = 0,
         skill_use_times = []}).

-record(evt_camp_black_white_chess, {}).

-record(evt_black_white_chess_change_in_round,
        {change_num = 0}).

-record(evt_black_white_chess_win, {}).

-record(evt_black_white_chess_lose, {}).

-record(evt_black_white_chess_more_than_ops_chess,
        {num = 0}).

-record(evt_black_white_chess_draw_whitout_ask_draw,
        {}).

-record(evt_black_white_chess_win_remain_one_color, {}).

-record(evt_black_white_chess_lose_remain_one_color,
        {}).

-record(evt_canyon_summit_join, {}).

-record(evt_canyon_summit_cannon, {}).

-record(evt_canyon_summit_win, {}).

-record(evt_star_moon, {}).

-record(evt_truth_dare_join, {}).

-record(evt_truth_dare_lucky, {}).

-record(evt_truth_dare_lucky_choose, {type = 0}).

-record(evt_truth_dare_end, {type = 0}).

-record(evt_truth_dare_two_fail, {}).

-record(evt_truth_dare_one_shot, {}).

-record(evt_general_send_flower, {items = []}).

-file("src/mod/guild/guild_common.erl", 76).

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

-file("src/mod/guild/guild_common.erl", 77).

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

-file("src/mod/guild/guild_common.erl", 78).

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

-file("src/mod/guild/guild_common.erl", 79).

-file("inc/link.hrl", 1).

-record(link,
        {socket :: undefined | port(),
         conn_pid :: undefined | pid(),
         ip = {0, 0, 0, 0} :: {0..255, 0..255, 0..255, 0..255},
         port = 0 :: non_neg_integer(),
         lag = 0 :: non_neg_integer()}).

-file("src/mod/guild/guild_common.erl", 80).

-file("inc/arena.hrl", 1).

-record(m_arena,
        {ver = 1,
         cd_time = 0 :: non_neg_integer(),
         acc_num = 0 :: non_neg_integer(),
         cup = 1000 :: non_neg_integer(),
         roll_time = 0,
         roll_id = 0,
         roll_graph = []}).

-record(arena_role,
        {id = {0, "", 0} :: tuple(),
         ver = 6,
         name = "" :: bitstring(),
         win = 0 :: non_neg_integer(),
         acc_num = 0,
         sex = 0 :: 0..1,
         classes = 0 :: 0..4,
         lev = 0 :: non_neg_integer(),
         last_time = 0 :: non_neg_integer(),
         is_robot = 0 :: 0..1,
         cup = 0,
         next_log_id = 1,
         log = [],
         win_list = [],
         win_ratio = 0,
         day_time_flag = 0,
         enemy = [],
         day_win = 0,
         day_lost = 0,
         def_acc_num = 0,
         def_win = 0,
         max_cup = 1000,
         acc_sword_num = 0,
         acc_mage_num = 0,
         acc_archer_num = 0,
         acc_orc_num = 0,
         acc_devine_num = 0,
         acc_moon_num = 0,
         acc_templar_num = 0,
         win_sword = 0,
         win_mage = 0,
         win_archer = 0,
         win_orc = 0,
         win_devine = 0,
         win_moon = 0,
         win_templar = 0,
         init_def = 0,
         formation = 1,
         formation_lev = 1,
         guards = [],
         last_win_role}).

-record(arena_enemy,
        {order = 0,
         role_id = {0, "", 0},
         is_robot = 0,
         classes = 0,
         lev = 0,
         sex = 0,
         cup = 0,
         soul = 1}).

-record(arena_log,
        {log_id = 1,
         s_role_id = {0, "", 0} :: tuple(),
         s_name = "" :: list(),
         result = 0 :: 0..1,
         t_role_id = {0, "", 0} :: tuple(),
         t_name = "" :: list(),
         time = 0 :: non_neg_integer(),
         s_cup = 0,
         t_cup = 0,
         s_cup_change = 0,
         t_cup_change = 0,
         feedback = 0}).

-record(arena_role_index,
        {id = {0, "", 0},
         lev = 0,
         cup = 0,
         time = 0,
         day_time_flag = 0,
         day_win = 0,
         day_lost = 0,
         win_list = [],
         win_ratio = 0}).

-record(arena_robot,
        {id = {0, "robot", 0},
         lev = 0,
         name = "",
         classes = 0,
         sex = 0,
         cup = 0}).

-record(arena_graph,
        {id = 1,
         base_id = 0,
         num = 0,
         status = 0,
         quality = 0}).

-record(arena_graph_base,
        {id = 1,
         base_id = 0,
         num = 0,
         quality = 0,
         name = "",
         sex = 0,
         classes = 0,
         lev_low = 0,
         lev_high = 0,
         ratio = 0,
         times = 1,
         order_list = []}).

-file("src/mod/guild/guild_common.erl", 81).

-file("inc/mail.hrl", 1).

-record(mail,
        {sess ::
             undefined |
             {pos_integer(), bitstring(), non_neg_integer()},
         to ::
             undefined |
             {pos_integer(), bitstring(), non_neg_integer()},
         from ::
             undefined |
             {non_neg_integer(), bitstring(), non_neg_integer()},
         from_face = 0 :: non_neg_integer(),
         from_name = "" :: bitstring(),
         to_face = 0 :: non_neg_integer(),
         to_name = "" :: bitstring(),
         type = 0 :: 0..1,
         status = 0 :: 0..1,
         del_type = 0 :: 0..1,
         title = "" :: bitstring(),
         content = "" :: bitstring(),
         item_list = [] :: [tuple()],
         source = 0 :: pos_integer(),
         rev_ts = 0 :: pos_integer(),
         ts = 0 :: pos_integer(),
         read_ts = 0 :: non_neg_integer()}).

-file("src/mod/guild/guild_common.erl", 82).

-file("inc/pet.hrl", 1).

-record(pet_attr,
        {point = 0,
         p_str = 0,
         p_con = 0,
         p_mag = 0,
         p_agi = 0,
         p_end = 0,
         pre_str = 0,
         pre_con = 0,
         pre_mag = 0,
         pre_agi = 0,
         pre_end = 0,
         max_hp_apt_used = 0,
         max_phy_apt_used = 0,
         max_pdef_apt_used = 0,
         max_magic_apt_used = 0,
         max_aspd_apt_used = 0,
         hp_aptitude = 0,
         phy_aptitude = 0,
         pdef_aptitude = 0,
         magic_aptitude = 0,
         aspd_aptitude = 0,
         max_hp_aptitude = 0,
         max_phy_aptitude = 0,
         max_pdef_aptitude = 0,
         max_magic_aptitude = 0,
         max_aspd_aptitude = 0}).

-record(pet_tmp_aptitude,
        {is_valid = 0,
         tmp_genre = 0,
         tmp_pet_attr = #pet_attr{} :: #pet_attr{},
         tmp_skills = [],
         tmp_growth = 0,
         tmp_growth_type = 0,
         tmp_happy = 0,
         talent = 0}).

-record(pet_base,
        {id = 0,
         name = "",
         type = 1,
         genre = 0,
         hp_aptitude = 0,
         phy_aptitude = 0,
         pdef_aptitude = 0,
         magic_aptitude = 0,
         aspd_aptitude = 0,
         need_lev_break = 0,
         base_skills = [],
         vari_skills = [],
         lev_break_skills = [],
         has_break_skill = 0,
         base_happy = 1000,
         min_happy_ratio = 800,
         max_happy_ratio = 1050,
         min_happy_genre_ratio = 1000,
         max_happy_genre_ratio = 1100,
         growth_blue = 0,
         growth_purple = 0,
         growth_orange = 0,
         growth_red = 0,
         model_id = 0,
         model_id1 = 0,
         model_id2 = 0,
         model_id3 = 0,
         skin_id_0 = 0,
         skin_id_1 = 0,
         skin_id_2 = 0,
         skin_id_3 = 0,
         skin_id_s0 = 0,
         skin_id_s1 = 0,
         skin_id_s2 = 0,
         skin_id_s3 = 0,
         cost = [],
         lev_break_cost = [],
         max_wash_time = 0,
         manual_level = 0}).

-record(pet_base_skill,
        {id = 0,
         name = "",
         type = 0,
         step = 0,
         lev = 0,
         max_exp = 0,
         attr = []}).

-record(pet_skill,
        {id = 0,
         lev = 1,
         exp = 1,
         step = 0,
         type = 0,
         source = 1,
         is_lock = 0,
         is_last_study = 0}).

-record(pet_skin,
        {use_skin = 0,
         has_skin = [],
         add_hp_aptitude = 0,
         add_phy_aptitude = 0,
         add_pdef_aptitude = 0,
         add_magic_aptitude = 0,
         add_aspd_aptitude = 0,
         add_growth = 0}).

-record(pet,
        {ver = 32 :: pos_integer(),
         id = 1 :: pos_integer(),
         type = 1 :: pos_integer(),
         name = "" :: bitstring(),
         lev = 1 :: pos_integer(),
         talent = 0,
         growth = 0,
         growth_type = 2,
         use_growth = 0,
         genre = 0,
         exp = 0 :: non_neg_integer(),
         max_exp = 1 :: pos_integer(),
         status = 0 :: 0 | 1,
         base_id :: undefined | pos_integer(),
         attr :: undefined | tuple(),
         hp = 1,
         mp = 1,
         hp_max = 1,
         mp_max = 1,
         pet_attr = #pet_attr{} :: #pet_attr{},
         happy = 0 :: non_neg_integer(),
         looks = [] :: list(),
         skills = [],
         comprehend_lev = 1,
         grade = 0,
         grade_attr = [],
         stones = [],
         feed_item = [],
         feed_point = 0,
         free_reset_flag = 0,
         combat_talk = [],
         lock = 0,
         wash_time = 0,
         ai_skillid = 0,
         mount_skills = [],
         break_times = 0,
         is_first = 0,
         handbook_attr = [],
         handbook_num = 0,
         star_handbook_num = 0,
         pet_tmp_aptitude = #pet_tmp_aptitude{},
         glue_pudding_used = 0,
         pet_skin = #pet_skin{},
         spirit_attached = 0 :: 0 | 1,
         spirit_attached_id = 0 :: non_neg_integer(),
         spirit_skills = [],
         spirit_info = [],
         unreal = [],
         spirit_child_flag = 0 :: 0 | 1,
         spirit_child_id = {0, "", 0} :: tuple(),
         unreal_looks_flag = 0 :: 0 | 1,
         pet_rune = []}).

-record(m_pet,
        {ver = 2 :: pos_integer(),
         fresh_id = 1,
         next_id = 1 :: pos_integer(),
         pets = [] :: list(),
         rename = 3 :: non_neg_integer(),
         pet_nums = 5,
         time = 0}).

-record(m_pet_store,
        {ver = 1 :: pos_integer(),
         next_id = 1 :: pos_integer(),
         pets = [] :: list(),
         pet_nums = 4}).

-record(pet_goods,
        {base_id :: undefined | pos_integer(),
         actv_lev :: undefined | pos_integer(),
         stock :: undefined | pos_integer()}).

-record(pet_shop_data,
        {base_id :: undefined | pos_integer(),
         name :: undefined | binary(),
         actv_lev :: undefined | pos_integer(),
         def_buy_price :: undefined | pos_integer(),
         stock :: undefined | pos_integer()}).

-record(pet_exchange_data,
        {base_id = 0,
         item_id = 0,
         item_num = 0,
         exchange_item_num = 0,
         genre = 0,
         talent = 0}).

-record(pet_stone_polish_data,
        {stone_id = 0,
         attr = [],
         attr_name = 0,
         val_list = [],
         skill_list = []}).

-record(pet_unreal, {item_id = 0, timeout = 0}).

-record(pet_unreal_data,
        {item_id = 0,
         attr = [],
         skills = [],
         model_id = 0,
         skin_id = 0}).

-record(pet_rune,
        {rune_index = 0,
         rune_type = 0,
         rune_status = 0,
         rune_id = 0,
         rune_lev = 0,
         is_resonance = 0,
         resonances = []}).

-record(pet_resonance,
        {resonance_index = 0,
         resonance_id = 0,
         rune_index = 0}).

-file("src/mod/guild/guild_common.erl", 83).

-spec donate(Role :: #role{},
             Num :: pos_integer()) -> {ok, NewRole :: #role{}} |
                                      {false, Why :: string()}.

donate(#role{}, Num) when Num < 1 ->
    {false, lang:get("请至少贡献一个道具")};
donate(Role = #role{id = Id,
                    m_guild = Mg = #m_guild{pid = Pid}},
       Num)
    when is_pid(Pid) ->
    case role_gain:do([#loss{label = item_base_id,
                             val = [{20400, Num}]},
                       #gain{label = guild, val = Num * 1000, ext = donate}],
                      Role)
        of
        {ok, NewRole} ->
            case guild:apply(sync,
                             Pid,
                             {fun sync_donate/3, [Num, Id]})
                of
                {ok, #guild_role{value = Value, total_value = Total}} ->
                    NRole1 = NewRole#role{m_guild =
                                              Mg#m_guild{value = Value,
                                                         total_value = Total}},
                    {ok, NRole1};
                {false, Reason} -> {false, Reason};
                _Err ->
                    logger:error("向公会捐助资产时发生异常: ~w",
                                 [_Err],
                                 guild_common,
                                 127),
                    {ok, Role}
            end;
        _ -> {false, lang:get("道具不足")}
    end;
donate(_Role, _Num) -> {false, lang:get("你不在公会")}.

sync_donate(State = #guild{members = Members,
                           assets = A, week_assets = WA},
            Num, RoleId) ->
    AddAssets = Num * 1000,
    AddVal = Num * 10,
    case lists:keyfind(RoleId, #guild_role.id, Members) of
        R = #guild_role{value = Val, total_value = TotalValue,
                        name = Name} ->
            LogMsg =
                notice:format(lang:get("~ts捐献了~ts, 获得了~w点贡献, 增加了~w点公会资金"),
                              [{role_2, Name},
                               {item_2, 20400, Num},
                               AddVal,
                               AddAssets]),
            Nr = R#guild_role{value = Val + AddVal,
                              total_value = TotalValue + AddVal},
            NewMb = lists:keyreplace(RoleId,
                                     #guild_role.id,
                                     Members,
                                     Nr),
            NewState = State#guild{members = NewMb,
                                   assets = A + AddAssets, flag = 1,
                                   week_assets = WA + AddAssets},
            guild_build:push_11113(NewState),
            guild:cast(NewMb, 11110, {1, Nr}),
            guild:notice(NewMb, LogMsg),
            guild:sync_cache(NewState),
            {ok, {ok, Nr}, NewState};
        _ -> {ok, {false, lang:get("不是该公会的会员，不能捐献")}}
    end.

send_envelop(Role = #role{lev = Lev, sex = Sex,
                          classes = Classes, name = Name,
                          m_guild = #m_guild{pid = Pid}, id = Id},
             Title, Num, Type, 1)
    when is_pid(Pid) ->
    case guild_data:get_envelop(Type) of
        #{min := Min, max := Max}
            when Min > Num orelse Max < Num ->
            {false,
             util:flist(lang:get("数量只能在~w-~w个哦"), [Min, Max])};
        #{loss_type := Label, loss_num := Val,
          amount := Amount} ->
            Loss =
                format:val_to_loss(format:gain_to_val([#gain{label =
                                                                 Label,
                                                             val = Val}])),
            case role_gain:do(Loss, Role) of
                {ok, Role1} ->
                    case guild:apply(sync,
                                     Pid,
                                     {fun sync_send_envelop/2,
                                      [#{id => Id, name => Name,
                                         classes => Classes, sex => Sex,
                                         lev => Lev, title => Title,
                                         amount => Amount, num => Num}]})
                        of
                        ok -> {ok, Role1};
                        {false, Reason} -> {false, Reason};
                        _Err ->
                            logger:error("角色[~ts][~w]发送公会红包时发生异常:~w",
                                         [Name, Id, _Err],
                                         guild_common,
                                         173),
                            {ok, Role1}
                    end;
                {false, #loss{msg = Msg}} -> {false, Msg}
            end;
        _ -> {false, lang:get("红包数据错误")}
    end;
send_envelop(Role = #role{pid = RolePid, lev = Lev,
                          sex = Sex, classes = Classes, name = Name,
                          id = RoleId, m_guild = #m_guild{pid = Pid}},
             _Title, _Num, _Type, 2)
    when is_pid(Pid) ->
    guild:apply(async,
                Pid,
                {fun async_show_envelop/2,
                 [#{id => RoleId, name => Name, classes => Classes,
                    sex => Sex, lev => Lev, pid => RolePid}]}),
    {ok, Role};
send_envelop(_Role, _Title, _Num, _Type, _Source) ->
    {false, lang:get("不在公会中")}.

async_show_envelop(#guild{members = Members},
                   #{id := Id, name := Name, classes := Classes,
                     sex := Sex, lev := Lev, pid := RolePid}) ->
    case lists:keyfind(Id, #guild_role.id, Members) of
        #guild_role{envelope =
                        #guild_envelop{title = Title, num = Num}}
            when Num > 0 ->
            {Rid, Plat, Zone} = Id,
            guild:cast(Members,
                       11131,
                       {Title, Rid, Plat, Zone, Name, Sex, Classes, Lev}),
            ok;
        _ ->
            notice:send({pid, RolePid},
                        3,
                        lang:get("你当前没有未领取完的红包可分享")),
            ok
    end.

sync_send_envelop(State = #guild{members = Members},
                  Args = #{id := Id, name := Name, classes := Classes,
                           sex := Sex, lev := Lev, title := Title}) ->
    Res = case lists:keyfind(Id, #guild_role.id, Members) of
              #guild_role{envelope = #guild_envelop{num = N}}
                  when N > 0 ->
                  {false, lang:get("你的红包还没被抢完呢")};
              R = #guild_role{name = Name} ->
                  {Rid, Plat, Zone} = Id,
                  Nr = make_envelop(Args, R),
                  NewMb = lists:keyreplace(Id,
                                           #guild_role.id,
                                           Members,
                                           Nr),
                  NewState = State#guild{members = NewMb, flag = 1},
                  guild:cast(NewMb, 11110, {1, Nr}),
                  guild:cast(NewMb,
                             11131,
                             {Title, Rid, Plat, Zone, Name, Sex, Classes, Lev}),
                  guild_build:push_11113(NewState),
                  guild:sync_cache(NewState),
                  {ok, NewState};
              _R ->
                  logger:debug("未知结构 ~w", [_R], guild_common, 219),
                  {false, lang:get("不是该公会的会员，不能发送红包")}
          end,
    case Res of
        {ok, NewG = #guild{}} -> {ok, ok, NewG};
        {false, Reason} -> {ok, {false, Reason}}
    end.

make_envelop(#{title := Title, amount := Amount,
               num := Num},
             M = #guild_role{envelope = E = #guild_envelop{}}) ->
    NewNum = Num,
    Ave = max(1, Amount div NewNum div 3),
    L = [Ave || _I <- lists:duplicate(NewNum, 1)],
    Pks = gen_packets(Amount - lists:sum(L), L),
    NewE = E#guild_envelop{amount = Amount, title = Title,
                           num = NewNum, total = NewNum, remain = Amount,
                           packs = Pks, log = []},
    M#guild_role{envelope = NewE}.

-spec grab_envelop(Role :: #role{},
                   Id :: tuple()) -> {ok, NewRole :: #role{}} |
                                     {false, Why :: string()}.

grab_envelop(Role = #role{id = Id, name = Name,
                          m_guild = #m_guild{pid = Pid, name = GuildName}},
             Mid)
    when is_pid(Pid) ->
    case guild:apply(sync,
                     Pid,
                     {fun sync_grab_envelop/3, [Id, Mid]})
        of
        {ok, AddVal, TRoleId, TName} ->
            Gain = format:val_to_gain([{90000, AddVal}]),
            case role_gain:do_notice(Gain, Role) of
                {ok, NRole2} ->
                    look_envelope(NRole2, Mid),
                    case AddVal >= 300000 of
                        true ->
                            Announce =
                                notice:format(lang:get("~ts的~ts在公会中豪气的甩出一个红包，~ts随手拆开获得银币~ts，这手气还有谁！"),
                                              [{string_2, 2, GuildName},
                                               {role_2, TName},
                                               {role_2, Name},
                                               {string_2, 1, AddVal}]),
                            notice:cast(all, 5, Announce, []);
                        _ -> ok
                    end,
                    {ok, NRole2, TRoleId, TName};
                {false, #gain{msg = Msg}} -> {false, Msg}
            end;
        {false, Reason} -> {false, Reason};
        _Err ->
            logger:error("角色[~w][~ts]领取红包时异常:~w",
                         [Id, Name, _Err],
                         guild_common,
                         267),
            {false, lang:get("公会正忙，暂时无法领取")}
    end;
grab_envelop(_Role, _Num) -> {false, lang:get("你不在公会")}.

sync_grab_envelop(State = #guild{members = Members}, Id,
                  Mid) ->
    {SRid, SPlat, SZone} = Id,
    {TRid, TPlat, TZone} = Mid,
    case lists:keyfind(Id, #guild_role.id, Members) of
        R = #guild_role{name = Name, classes = Classes,
                        sex = Sex, lev = Lev} ->
            case lists:keyfind(Mid, #guild_role.id, Members) of
                #guild_role{envelope = #guild_envelop{num = 0}} ->
                    {ok, {false, lang:get("红包已经被抢完了")}};
                M = #guild_role{name = Tname, pid = Tpid,
                                envelope =
                                    E = #guild_envelop{remain = Remain,
                                                       log = Log, num = Num,
                                                       packs = Packs}} ->
                    Now = date:unixtime(),
                    case lists:keyfind(Id, 1, Log) of
                        {Id, Name, _Remain, _Sex, _Classes, _Lev, _Now} ->
                            {ok, {false, lang:get("你已经抢过人家的了，留点次数给别人吧")}};
                        _ when Num =:= 1 ->
                            Nr = R,
                            NewE = E#guild_envelop{remain = 0, num = 0,
                                                   log =
                                                       [{Id,
                                                         Name,
                                                         Remain,
                                                         Sex,
                                                         Classes,
                                                         Lev,
                                                         Now}
                                                        | Log],
                                                   packs = []},
                            NewM = M#guild_role{envelope = NewE},
                            case is_pid(Tpid) of
                                true when Id =/= Mid ->
                                    role:pack_send(Tpid,
                                                   11133,
                                                   {SRid,
                                                    SPlat,
                                                    SZone,
                                                    Name,
                                                    TRid,
                                                    TPlat,
                                                    TZone,
                                                    Tname});
                                _ -> skip
                            end,
                            role:apply(async,
                                       Tpid,
                                       {notice,
                                        send,
                                        [3, lang:get("你发出的红包已经被抢完")]}),
                            MailInfo = #{items => [], title => lang:get("公会红包"),
                                         content =>
                                             lang:get("你在公会中发的红包已经被大家抢夺一空")},
                            mail:send(Mid, MailInfo),
                            NewMb2 = do_sync_pray_grab(Nr, NewM, Members),
                            NewState = State#guild{members = NewMb2, flag = 1},
                            guild:sync_cache(NewState),
                            {ok, {ok, Remain, Mid, Tname}, NewState};
                        _ ->
                            AddVal = util:rand_list(Packs),
                            Nr = R,
                            {NewNum, NewRemain, NewPacks} = case Remain - AddVal
                                                                of
                                                                V when V =< 0 ->
                                                                    {0, 0, []};
                                                                V ->
                                                                    {Num - 1,
                                                                     V,
                                                                     Packs --
                                                                         [AddVal]}
                                                            end,
                            NewE = E#guild_envelop{num = NewNum,
                                                   remain = NewRemain,
                                                   log =
                                                       [{Id,
                                                         Name,
                                                         AddVal,
                                                         Sex,
                                                         Classes,
                                                         Lev,
                                                         Now}
                                                        | Log],
                                                   packs = NewPacks},
                            NewM = M#guild_role{envelope = NewE},
                            NewMb2 = do_sync_pray_grab(Nr, NewM, Members),
                            NewState = State#guild{members = NewMb2, flag = 1},
                            case Id =/= Mid andalso is_pid(Tpid) of
                                true ->
                                    role:pack_send(Tpid,
                                                   11133,
                                                   {SRid,
                                                    SPlat,
                                                    SZone,
                                                    Name,
                                                    TRid,
                                                    TPlat,
                                                    TZone,
                                                    Tname});
                                _ -> skip
                            end,
                            guild:sync_cache(NewState),
                            {ok, {ok, AddVal, Mid, Tname}, NewState}
                    end;
                _ -> {ok, {false, lang:get("红包已经被抢完了")}}
            end;
        _ -> {ok, {false, lang:get("没有发现红包")}}
    end.

do_sync_pray_grab(R = #guild_role{id = Id},
                  #guild_role{id = Id, envelope = E}, Members) ->
    Nr = R#guild_role{envelope = E},
    NewMb2 = lists:keyreplace(Id,
                              #guild_role.id,
                              Members,
                              Nr),
    guild:cast(NewMb2, 11110, {1, Nr}),
    NewMb2;
do_sync_pray_grab(R = #guild_role{id = Id},
                  M = #guild_role{id = Mid}, Members) ->
    NewMb1 = lists:keyreplace(Id,
                              #guild_role.id,
                              Members,
                              R),
    NewMb2 = lists:keyreplace(Mid,
                              #guild_role.id,
                              NewMb1,
                              M),
    guild:cast(NewMb2, 11110, {1, R}),
    guild:cast(NewMb2, 11110, {1, M}),
    NewMb2.

look_envelope(#role{m_guild = #m_guild{pid = GPid},
                    pid = Pid},
              Mid) ->
    Fun = fun (#guild{members = Mems}) ->
                  case lists:keyfind(Mid, #guild_role.id, Mems) of
                      #guild_role{id = Id, name = Name, sex = Sex,
                                  classes = Classes, lev = Lev,
                                  envelope = E = #guild_envelop{}} ->
                          role:pack_send(Pid,
                                         11132,
                                         {Id, Name, Sex, Classes, Lev, E}),
                          ok;
                      _ ->
                          notice:send({pid, Pid}, 3, lang:get("红包不存在")),
                          ok
                  end
          end,
    guild_mgr:apply(async, GPid, {Fun}).

help_shipping(CellId,
              #role{id = Rid, m_guild = #m_guild{pid = Pid}})
    when is_pid(Pid) ->
    case guild:apply(sync,
                     Pid,
                     {fun sync_help_shipping/3, [CellId, Rid]})
        of
        ok -> ok;
        false -> false;
        {false, Reason} -> {false, Reason};
        _Err ->
            logger:error("远航商人公会求助异常: ~w",
                         [_Err],
                         guild_common,
                         385),
            false
    end;
help_shipping(_CellId, _Role) ->
    {false, lang:get("远航商人公会求助失败")}.

cancel_help_shipping(CellId, Rid,
                     GuildId = {_Id, _Platform, _Zone}) ->
    case guild_mgr:pid(GuildId) of
        {ok, Pid} ->
            case guild:apply(sync,
                             Pid,
                             {fun sync_cancel_help_shipping/3, [CellId, Rid]})
                of
                ok -> ok;
                false -> false;
                {false, Reason} -> {false, Reason};
                _Err ->
                    logger:error("远航商人取消公会求助异常: ~w",
                                 [_Err],
                                 guild_common,
                                 403),
                    false
            end;
        _False -> {false, lang:get("远航商人取消公会求助失败")}
    end;
cancel_help_shipping(_CellId, _Rid, _GuildId) ->
    {false, lang:get("远航商人取消公会求助失败")}.

sync_help_shipping(State = #guild{members = Members},
                   CellId, Rid) ->
    case lists:keyfind(Rid, #guild_role.id, Members) of
        GRole = #guild_role{requirement = Requirements} ->
            Type = 1,
            case lists:keytake(Type, 1, Requirements) of
                {value, {Type, Ids}, Rest} ->
                    case lists:keyfind(CellId, 2, Ids) of
                        {_, CellId} -> {ok, ok, State};
                        _False ->
                            NRequirements = lists:keystore(Type,
                                                           1,
                                                           Rest,
                                                           {Type,
                                                            [{1, CellId}
                                                             | Ids]}),
                            NewGRole = GRole#guild_role{requirement =
                                                            NRequirements},
                            guild:cast(Members, 11110, {1, NewGRole}),
                            {ok,
                             ok,
                             State#guild{members =
                                             lists:keystore(Rid,
                                                            #guild_role.id,
                                                            Members,
                                                            NewGRole)}}
                    end;
                _False ->
                    NRequirements = [{Type, [{1, CellId}]} | Requirements],
                    NewGRole = GRole#guild_role{requirement =
                                                    NRequirements},
                    guild:cast(Members, 11110, {1, NewGRole}),
                    {ok,
                     ok,
                     State#guild{members =
                                     lists:keystore(Rid,
                                                    #guild_role.id,
                                                    Members,
                                                    NewGRole)}}
            end;
        _ -> {ok, false}
    end.

sync_cancel_help_shipping(State = #guild{members =
                                             Members},
                          CellId, Rid) ->
    case lists:keyfind(Rid, #guild_role.id, Members) of
        GRole = #guild_role{requirement = Requirements} ->
            Type = 1,
            case lists:keytake(Type, 1, Requirements) of
                {value, {Type, Ids}, Rest} ->
                    case CellId of
                        all ->
                            NewGRole = GRole#guild_role{requirement = Rest},
                            guild:cast(Members, 11110, {1, NewGRole}),
                            {ok,
                             ok,
                             State#guild{members =
                                             lists:keystore(Rid,
                                                            #guild_role.id,
                                                            Members,
                                                            NewGRole)}};
                        _ ->
                            case lists:keydelete(CellId, 2, Ids) of
                                [] ->
                                    NewGRole = GRole#guild_role{requirement =
                                                                    Rest},
                                    guild:cast(Members, 11110, {1, NewGRole}),
                                    {ok,
                                     ok,
                                     State#guild{members =
                                                     lists:keystore(Rid,
                                                                    #guild_role.id,
                                                                    Members,
                                                                    NewGRole)}};
                                RestIds when is_list(RestIds) ->
                                    NRequirements = lists:keystore(Type,
                                                                   1,
                                                                   Rest,
                                                                   {Type,
                                                                    RestIds}),
                                    NewGRole = GRole#guild_role{requirement =
                                                                    NRequirements},
                                    guild:cast(Members, 11110, {1, NewGRole}),
                                    {ok,
                                     ok,
                                     State#guild{members =
                                                     lists:keystore(Rid,
                                                                    #guild_role.id,
                                                                    Members,
                                                                    NewGRole)}};
                                _ -> {ok, false}
                            end
                    end;
                _False -> {ok, false}
            end;
        _ -> {ok, false}
    end.

propagate(Role = #role{m_guild =
                           #m_guild{id = GuildId, name = GuildName}}) ->
    Now = date:unixtime(),
    case erlang:get(guild_propagating) of
        T when is_integer(T) andalso Now < T + 5 ->
            {false, lang:get("当前已经在宣传中")};
        _ ->
            case catch ets:lookup_element(guild_list,
                                          GuildId,
                                          #guild.board)
                of
                "" ->
                    Msg = notice:format(lang:get("~ts公会：~ts"),
                                        [{string_2, 2, GuildName},
                                         {string_1, guild_common:msg(1)}]),
                    chat:send_chat_msg(pop, Msg, Role),
                    FireRole = role_trigger:fire(#evt_guild_propagate{},
                                                 Role),
                    erlang:put(guild_propagating, Now),
                    {ok, FireRole};
                Board when is_list(Board) ->
                    Msg = notice:format(lang:get("~ts公会：~ts"),
                                        [{string_2, 2, GuildName},
                                         {string_1, Board}]),
                    chat:send_chat_msg(pop, Msg, Role),
                    FireRole = role_trigger:fire(#evt_guild_propagate{},
                                                 Role),
                    erlang:put(guild_propagating, Now),
                    {ok, FireRole};
                _ -> {false, lang:get("你不在公会")}
            end
    end;
propagate(_Role) -> {false, lang:get("你不在公会")}.

finish_propagating(Role) ->
    Now = date:unixtime(),
    case erlang:get(guild_propagating) of
        T when is_integer(T) andalso Now > T + 4 ->
            FireRole = role_trigger:fire(#evt_guild_propagate{},
                                         Role),
            erlang:put(guild_propagating, 0),
            {ok, FireRole};
        _T ->
            logger:debug("宣传时间 ~w, ~w",
                         [_T, Now],
                         guild_common,
                         505),
            {false, lang:get("还没开始宣传呢")}
    end.

update_donation(#role{m_guild =
                          #m_guild{pid = GuildPid},
                      id = Id},
                NewVal) ->
    guild:apply(async,
                GuildPid,
                {fun async_update_donation/3, [Id, NewVal]});
update_donation(_, _) -> ok.

add_donation(#role{m_guild = #m_guild{pid = GuildPid},
                   id = Id},
             GainL = [_ | _]) ->
    logger:debug("gain list----> ~w",
                 [GainL],
                 guild_common,
                 517),
    case lists:sum([Val
                    || #gain{label = guild, val = Val, ext = 0} <- GainL])
        of
        0 -> ok;
        NewVal ->
            guild:apply(async,
                        GuildPid,
                        {fun async_add_donation/3, [Id, NewVal]})
    end;
add_donation(_, _) -> ok.

async_update_donation(State = #guild{members = Members},
                      Id, NewVal) ->
    case lists:keyfind(Id, #guild_role.id, Members) of
        M = #guild_role{} ->
            NewM = M#guild_role{total_value = NewVal},
            NewMembers = lists:keyreplace(Id,
                                          #guild_role.id,
                                          Members,
                                          NewM),
            guild:cast(NewMembers, 11110, {1, NewM}),
            {ok, State#guild{members = NewMembers, flag = 1}};
        _ -> ok
    end.

async_add_donation(State = #guild{members = Members},
                   Id, AddVal) ->
    case lists:keyfind(Id, #guild_role.id, Members) of
        M = #guild_role{value = Value} ->
            NewM = M#guild_role{value = Value + AddVal},
            NewMembers = lists:keyreplace(Id,
                                          #guild_role.id,
                                          Members,
                                          NewM),
            guild:cast(NewMembers, 11110, {1, NewM}),
            {ok, State#guild{members = NewMembers, flag = 1}};
        _ -> ok
    end.

join({_GuildId, 0, ""}, _Role) ->
    {false, lang:get("请自我介绍一下哦")};
join({_GuildId, 1, ""}, _Role) ->
    {false, lang:get("请自我介绍一下哦")};
join({GuildId, Tag, Msg}, Role) ->
    case Tag of
        1 ->
            case util:check_text(Msg, 15, lang:get("留言")) of
                {false, Reason} -> {false, Reason};
                _ ->
                    join([self_check, is_local, convert, join_check],
                         GuildId,
                         Role,
                         #{tag => Tag, msg => Msg})
            end;
        _ ->
            join([self_check, is_local, convert, join_check],
                 GuildId,
                 Role,
                 #{tag => Tag, msg => Msg})
    end.

join([], _GuildId, Role, Args) ->
    case Args of
        #{join_type := direct, guild_name := GuildName} ->
            Msg = util:flist(lang:get("你已经成功加入~ts公会"), [GuildName]),
            {ok, Msg, Role};
        #{join_type := apply} -> ok;
        _ -> {ok, "", Role}
    end;
join([self_check | _T], _GuildId, #role{lev = Lev},
     _Args)
    when Lev < 30 ->
    {false, util:flist(lang:get("需要升到~w级才能加入公会"), [30])};
join([self_check | T], GuildId,
     Role = #role{id = RoleId}, Args) ->
    case guild_role:find_role(RoleId) of
        false -> join(T, GuildId, Role, Args);
        {ok, _OldGuildId} ->
            {false, lang:get("您已经有公会了，不能再次加入公会")};
        _Err ->
            logger:error("查询角色公会信息出错:~w",
                         [_Err],
                         guild_common,
                         584),
            {false, lang:get("系统繁忙，请稍后尝试")}
    end;
join([is_local | T], GuildId, Role, Args) ->
    case role_misc:is_local_role(GuildId) of
        true -> join(T, GuildId, Role, Args);
        _ -> {false, lang:get("不能加入外服的公会哦")}
    end;
join([convert | T], GuildId, Role, Args) ->
    case guild_role:to_guild_role(Role) of
        {ok, GuildRole = #guild_role{post = Post}} ->
            Now = date:unixtime(),
            NewGuildRole = GuildRole#guild_role{status = 1,
                                                last_login = Now,
                                                enter_time = Now, post = Post},
            join(T,
                 GuildId,
                 Role,
                 Args#{guild_role => NewGuildRole});
        _ -> {false, lang:get("角色数据异常，无法加入公会")}
    end;
join([join_check | T], GuildId, Role, Args) ->
    case join_check(active, Role, GuildId, Args) of
        {true, GuildPid} ->
            join([sync_join | T],
                 GuildId,
                 Role,
                 Args#{guild_pid => GuildPid});
        {apply, GuildPid, GuildName} ->
            join([apply | T],
                 GuildId,
                 Role,
                 Args#{guild_pid => GuildPid, guild_name => GuildName,
                       join_type => apply});
        {false, Reason} -> {false, Reason}
    end;
join([invite_check | T], GuildId, Role, Args) ->
    case join_check(invite, Role, GuildId, Args) of
        {true, GuildPid} ->
            join([sync_join | T],
                 GuildId,
                 Role,
                 Args#{guild_pid => GuildPid});
        {apply, GuildPid, GuildName} ->
            join([apply | T],
                 GuildId,
                 Role,
                 Args#{guild_pid => GuildPid, guild_name => GuildName,
                       join_type => apply});
        {false, Reason} -> {false, Reason}
    end;
join([sync_join | T], GuildId, Role, Args) ->
    case Args of
        #{guild_pid := GuildPid, guild_role := GuildRole} ->
            case guild_mgr:apply(sync,
                                 GuildPid,
                                 {guild_common, sync_join, [GuildRole]})
                of
                {ok, Mg} ->
                    Role1 = guild_role:alters([{m_guild, Mg}], Role),
                    NewRole = role_trigger:fire(#evt_guild{}, Role1),
                    join(T,
                         GuildId,
                         NewRole,
                         Args#{join_type => direct,
                               guild_name => Mg#m_guild.name});
                {false, Reason} -> {false, Reason};
                _Err -> {false, lang:get("公会繁忙，请稍后再尝试")}
            end;
        #{guild_pid := _} -> {false, lang:get("无法转换角色数据")};
        _ -> {false, lang:get("无法找到对应公会")}
    end;
join([apply | T], GuildId,
     Role = #role{id = RoleId, name = Name, sex = Sex,
                  classes = Classes, lev = Lev, pid = RolePid,
                  s_looks = Looks, m_arena = #m_arena{cup = Cup},
                  assets = #assets{guild = Donation}},
     Args) ->
    case Args of
        #{guild_pid := GuildPid, tag := Tag, msg := Msg} ->
            GuildApply = #guild_apply{id = RoleId, name = Name,
                                      time = date:unixtime(), sex = Sex,
                                      classes = Classes, looks = Looks,
                                      lev = Lev, cup = Cup, donation = Donation,
                                      tag = Tag, msg = Msg},
            guild_mgr:apply(async,
                            GuildPid,
                            {fun async_apply/3, [GuildApply, RolePid]}),
            join(T, GuildId, Role, Args);
        _ -> {false, lang:get("无法找到对应公会")}
    end.

join_check(active, Role = #role{id = RoleId}, GuildId,
           #{guild_role := #guild_role{post = Post}}) ->
    case guild_mgr:info(by_id, GuildId) of
        {ok,
         #guild{pid = GuildPid, join_type = 2,
                apply_list = ApplyList, name = GuildName}} ->
            check_apply(RoleId, ApplyList, GuildPid, GuildName);
        {ok,
         #guild{pid = GuildPid, join_condition = Cond,
                mem_num = MemNum, max_mem_num = MaxMemNum0,
                apply_list = ApplyList, name = GuildName,
                exchequer_lev = ExchequerLev}}
            when Post =:= 10 ->
            MaxMemNum = case guild_data:exchequer(ExchequerLev) of
                            #{mem := MMemNum} -> MMemNum;
                            _ -> MaxMemNum0
                        end,
            case MemNum >= MaxMemNum of
                true ->
                    check_apply(RoleId, ApplyList, GuildPid, GuildName);
                false ->
                    case do_join_check(Cond, Role) of
                        true -> {true, GuildPid};
                        apply ->
                            check_apply(RoleId, ApplyList, GuildPid, GuildName)
                    end
            end;
        {ok,
         #guild{pid = GuildPid, join_condition = Cond,
                fresh_num = FreshNum, max_fresh_num = MaxFreshNum0,
                apply_list = ApplyList, name = GuildName,
                exchequer_lev = ExchequerLev}}
            when Post =:= 0 ->
            MaxFreshNum = case guild_data:exchequer(ExchequerLev) of
                              #{fresh := MFreshNum} -> MFreshNum;
                              _ -> MaxFreshNum0
                          end,
            case FreshNum >= MaxFreshNum of
                true ->
                    check_apply(RoleId, ApplyList, GuildPid, GuildName);
                false ->
                    case do_join_check(Cond, Role) of
                        true -> {true, GuildPid};
                        apply ->
                            check_apply(RoleId, ApplyList, GuildPid, GuildName)
                    end
            end;
        {error, guild_not_exists} ->
            {false, lang:get("公会不存在，无法加入")};
        _ -> {false, lang:get("系统繁忙，请稍后再尝试")}
    end;
join_check(invite, Role = #role{id = RoleId}, GuildId,
           #{inviter_id := InviterId,
             guild_role := #guild_role{post = Post}}) ->
    case guild_mgr:info(by_id, GuildId) of
        {ok,
         #guild{pid = GuildPid, join_condition = Cond,
                mem_num = MemNum, max_mem_num = MaxMemNum0,
                apply_list = ApplyList, name = GuildName,
                members = Members, exchequer_lev = ExchequerLev}}
            when Post =:= 10 ->
            MaxMemNum = case guild_data:exchequer(ExchequerLev) of
                            #{mem := MMemNum} -> MMemNum;
                            _ -> MaxMemNum0
                        end,
            case lists:keyfind(InviterId, #guild_role.id, Members)
                of
                #guild_role{post = IPost}
                    when IPost >= 40 andalso MemNum < MaxMemNum ->
                    case do_join_check(Cond, Role) of
                        true -> {true, GuildPid};
                        apply ->
                            check_apply(RoleId, ApplyList, GuildPid, GuildName)
                    end;
                _ -> check_apply(RoleId, ApplyList, GuildPid, GuildName)
            end;
        {ok,
         #guild{pid = GuildPid, join_condition = Cond,
                fresh_num = FreshNum, max_fresh_num = MaxFreshNum0,
                apply_list = ApplyList, name = GuildName,
                members = Members, exchequer_lev = ExchequerLev}}
            when Post =:= 0 ->
            MaxFreshNum = case guild_data:exchequer(ExchequerLev) of
                              #{fresh := MFreshNum} -> MFreshNum;
                              _ -> MaxFreshNum0
                          end,
            case lists:keyfind(InviterId, #guild_role.id, Members)
                of
                #guild_role{post = IPost}
                    when IPost >= 40 andalso FreshNum < MaxFreshNum ->
                    case do_join_check(Cond, Role) of
                        true -> {true, GuildPid};
                        apply ->
                            check_apply(RoleId, ApplyList, GuildPid, GuildName)
                    end;
                _ -> check_apply(RoleId, ApplyList, GuildPid, GuildName)
            end;
        {error, guild_not_exists} ->
            {false, lang:get("公会不存在，无法加入")};
        _ -> {false, lang:get("系统繁忙，请稍后再尝试")}
    end.

apply_all(#role{m_guild = #m_guild{pid = Pid}})
    when is_pid(Pid) ->
    {false, lang:get("你当前已经有公会了")};
apply_all(Role = #role{id = RoleId, name = Name,
                       sex = Sex, classes = Classes, lev = Lev,
                       s_looks = Looks, m_arena = #m_arena{cup = Cup},
                       assets = #assets{guild = Donation}}) ->
    case var:get_var(Role, day, 27, 0) of
        Val when Val > 0 -> {false, lang:get("你已经申请过所有公会")};
        _ ->
            Role1 = var:acc_var(Role, day, 27),
            L = ets:match(guild_list, #guild{pid = '$1', _ = '_'}),
            GuildApply = #guild_apply{id = RoleId, name = Name,
                                      time = date:unixtime(), sex = Sex,
                                      classes = Classes, looks = Looks,
                                      lev = Lev, cup = Cup, donation = Donation,
                                      tag = util:rand(2, 3)},
            lists:foreach(fun ([GuildPid]) ->
                                  guild_mgr:apply(async,
                                                  GuildPid,
                                                  {fun async_apply/2,
                                                   [GuildApply]})
                          end,
                          L),
            {ok, Role1}
    end.

check_apply(RoleId, ApplyList, GuildPid, GuildName) ->
    case lists:keyfind(RoleId, #guild_apply.id, ApplyList)
        of
        false -> {apply, GuildPid, GuildName};
        _ -> {false, lang:get("你已申请过该公会，请等待公会管理人员审核")}
    end.

do_join_check(Cond, Role) ->
    RCond = do_change_cond(Cond, []),
    case role_cond:check(RCond, Role) of
        {false, #condition{}} -> apply;
        true -> true
    end.

do_change_cond([], RCond) -> RCond;
do_change_cond([{1, 0} | T], RCond) ->
    do_change_cond(T, RCond);
do_change_cond([{1, Fc} | T], RCond) ->
    R = #condition{label = fc, val = Fc, op = ge},
    do_change_cond(T, [R | RCond]);
do_change_cond([{2, 0} | T], RCond) ->
    do_change_cond(T, RCond);
do_change_cond([{2, Lev} | T], RCond) ->
    R = #condition{label = lev, val = Lev, op = ge},
    do_change_cond(T, [R | RCond]);
do_change_cond([_Err | T], RCond) ->
    logger:error("未知加入公会限制条件:~w",
                 [_Err],
                 guild_common,
                 769),
    do_change_cond(T, RCond).

sync_join(State = #guild{id = GuildId, name = GuildName,
                         members = Members, mem_num = MemNum,
                         max_mem_num = MaxMemNum0, fresh_num = FreshNum,
                         max_fresh_num = MaxFreshNum0, pid = GuildPid,
                         lev = GuildLev, apply_list = ApplyList,
                         exchequer_lev = ExchequerLev,
                         formalizing_lev = FormalizingLev},
          GuildRole = #guild_role{id = RoleId, name = RoleName,
                                  pid = RolePid, enter_time = Now,
                                  lev = RoleLev}) ->
    {MaxMemNum, MaxFreshNum} = case
                                   guild_data:exchequer(ExchequerLev)
                                   of
                                   #{mem := MMemNum, fresh := MFreshNum} ->
                                       {MMemNum, MFreshNum};
                                   _ -> {MaxMemNum0, MaxFreshNum0}
                               end,
    Post = case RoleLev >= FormalizingLev of
               true -> 10;
               _ -> 0
           end,
    Flag = case Post of
               0 -> FreshNum + 1 =< MaxFreshNum;
               10 -> MemNum + 1 =< MaxMemNum
           end,
    case Flag of
        true ->
            Value = case guild_role:get_last_guild(RoleId) of
                        {ok, #guild_leaver{guild_id = GuildId, value = V}} -> V;
                        _ -> 0
                    end,
            guild_role:add_role(GuildId, RoleId),
            Gr = GuildRole#guild_role{value = Value},
            guild:cast(Members, 11110, {1, Gr}),
            NewMembers = lists:keystore(RoleId,
                                        #guild_role.id,
                                        Members,
                                        Gr),
            {NewMemNum, NewFreshNum} = guild_role:count(NewMembers),
            NewApplyList = lists:keydelete(RoleId,
                                           #guild_apply.id,
                                           ApplyList),
            State1 = State#guild{flag = 1, mem_num = NewMemNum,
                                 fresh_num = NewFreshNum, members = NewMembers,
                                 apply_list = NewApplyList},
            State2 = add_event(State1, 5, [RoleId, RoleName]),
            NewState = State2,
            guild_role:push_11100(RolePid, NewState, GuildRole),
            guild:sync_cache(NewState),
            Mg = #m_guild{id = GuildId, pid = GuildPid,
                          name = GuildName, enter_time = Now,
                          guild_lev = GuildLev, post = Post},
            guild_mgr:refresh_applys(),
            camp_web:guild_push(NewState),
            {ok,
             {ok, Mg},
             guild_trigger:fire(#g_evt_member{}, NewState)};
        false -> {ok, {false, lang:get("公会人数已达上限，无法加入")}}
    end.

async_apply(State = #guild{apply_list = ApplyList,
                           members = Members},
            GuildApply = #guild_apply{id = RoleId}, RolePid) ->
    case lists:keyfind(RoleId, #guild_apply.id, ApplyList)
        of
        false ->
            NewApplyList = lists:sublist([GuildApply | ApplyList],
                                         20),
            NewState = State#guild{apply_list = NewApplyList,
                                   flag = 1},
            role:pack_send(RolePid,
                           11104,
                           {0, lang:get("申请成功，请等待对方公会管理审核")}),
            push_applys(NewApplyList, Members),
            guild:sync_cache(NewState),
            {ok, NewState};
        _ ->
            role:pack_send(RolePid,
                           11104,
                           {0, lang:get("你已申请过该公会，请等待公会管理人员审核")}),
            ok
    end.

async_apply(State = #guild{apply_list = ApplyList,
                           members = Members},
            GuildApply = #guild_apply{id = RoleId}) ->
    case lists:keyfind(RoleId, #guild_apply.id, ApplyList)
        of
        false ->
            NewApplyList = lists:sublist([GuildApply | ApplyList],
                                         20),
            NewState = State#guild{apply_list = NewApplyList,
                                   flag = 1},
            push_applys(NewApplyList, Members),
            guild:sync_cache(NewState),
            {ok, NewState};
        _ -> ok
    end.

join_info(#guild{join_type = JoinType,
                 join_condition = JoinCond}) ->
    Lev = case lists:keyfind(2, 1, JoinCond) of
              {_, L} -> L;
              _ -> 0
          end,
    {1, JoinType, Lev}.

set_condition(GuildPid, {Type, Lev}, RoleId, RolePid) ->
    guild_mgr:apply(async,
                    GuildPid,
                    {fun async_set_condition/4,
                     [RoleId, RolePid, {Type, Lev}]}),
    ok.

async_set_condition(State = #guild{members = Members},
                    RoleId, RolePid, {Type, Lev}) ->
    case guild_role:check_fun(RoleId, Members, set_cond) of
        false ->
            notice:send({pid, RolePid}, 1, lang:get("权限不足, 无法设置")),
            ok;
        {true, _} ->
            Cond = case Type of
                       1 -> [{2, Lev}];
                       _ -> []
                   end,
            NewState = State#guild{join_type = Type,
                                   join_condition = Cond, flag = 1},
            role:pack_send(RolePid, 11122, {2, Type, Lev}),
            guild:sync_cache(NewState),
            {ok, NewState}
    end.

set_formalizing_lev(#role{m_guild =
                              #m_guild{post = Post, pid = Pid}},
                    Lev)
    when Post >= 50 ->
    case Lev >= 35 of
        _ when Lev > 100 -> {false, lang:get("无效的等级")};
        true ->
            Fun = fun (G = #guild{}) ->
                          G1 = G#guild{formalizing_lev = Lev},
                          guild_build:push_11113(G1),
                          {ok, G1}
                  end,
            guild_mgr:apply(async, Pid, {Fun}),
            ok;
        _ ->
            {false,
             notice:format(lang:get("新秀转为正式成员最低不可小于~ts级"),
                           [{string_2, 5, 35}])}
    end;
set_formalizing_lev(_, _) ->
    {false, lang:get("会长与副会长才可进行设置哦")}.

rename(Role = #role{m_guild =
                        #m_guild{post = 60, pid = Pid, name = OldName}},
       Name) ->
    case ets:lookup(guild_name_used, Name) of
        [_ | _] -> {false, lang:get("名字已经被使用过")};
        _ ->
            case util:check_name(Name) of
                {false, Reason} -> {false, Reason};
                ok ->
                    Loss = case OldName of
                               [$[ | _] ->
                                   logger:info("合并过的公会免费改名 ~ts",
                                               [OldName],
                                               guild_common,
                                               909),
                                   [];
                               _ -> format:val_to_loss([{90002, 1680}])
                           end,
                    case role_gain:do_notice(Loss, Role) of
                        {ok, Role1} ->
                            case guild_mgr:apply(sync,
                                                 Pid,
                                                 {guild_common,
                                                  sync_rename,
                                                  [Name]})
                                of
                                {ok, NameUsed} -> {ok, NameUsed, Role1};
                                {error, timeout} -> {ok, "", Role1};
                                _ -> {false, lang:get("公会系统忙碌")}
                            end;
                        {false, #loss{msg = Msg}} -> {false, Msg}
                    end
            end
    end;
rename(_, _) -> {false, lang:get("会长与副会长才可进行改名哦")}.

sync_rename(G = #guild{name = OldName,
                       members = Members, leader_name = LeadName},
            Name) ->
    G1 = G#guild{name = Name, name_used = OldName},
    guild_mgr:update_name_used(G1),
    Ann1 =
        notice:format(lang:get("~ts的会长~ts夜观天象，最终决定把公会的名字改为~ts，请大家牢记！"),
                      [{string_2, 2, OldName},
                       {role_2, LeadName},
                       {string_2, 2, Name}]),
    notice:cast(all, 5, Ann1),
    [role:apply(async,
                MPid,
                {guild_role, set, [{name, Name}]})
     || #guild_role{status = 1, pid = MPid} <- Members,
        is_pid(MPid)],
    Ann = notice:format(lang:get("会长~ts把公会名改为~ts"),
                        [{role_2, LeadName}, {string_2, 2, Name}]),
    guild:notice(Members, Ann),
    {ok, G2} = sync_send_mail(G1,
                              #{title => lang:get("公会改名"), content => Ann}),
    {ok, {ok, OldName}, G2}.

leave(Role) ->
    leave([guild_war, guild_hero, check, result], Role, []).

leave([], Role = #role{m_pet = #m_pet{pets = Pets}},
      _Args) ->
    Role2 = case honor:del(Role,
                           [30109, 30110 | lists:seq(11010, 11017)],
                           push)
                of
                {ok, Role1} -> Role1;
                _ -> Role
            end,
    Role4 = case quest_guild:giveup(Role2) of
                {ok, Role3 = #role{}} -> Role3;
                _R ->
                    logger:debug("清理公会任务结果 ~w", [_R], guild_common, 955),
                    Role2
            end,
    Role6 = case team:away(Role4) of
                {ok, Role5} -> Role5;
                _ -> Role4
            end,
    Role7 = role_trigger:fire(#evt_guild_leave{}, Role6),
    Role8 = attr:calc_and_push(Role7),
    Role9 = pet_attr:batch_calc(Pets, Role8),
    {ok, NewRole} = guild_war:handle_buff(Role9),
    buff:pack_list(NewRole),
    Msg = lang:get("成功离开公会，从此您就是一个自由人了"),
    map:role_update(NewRole),
    {ok, Msg, NewRole};
leave([guild_war | T], Role, Args) ->
    case guild_war:is_opening() of
        true -> {false, lang:get("公会战活动中,不可进行退出公会操作")};
        _ -> leave(T, Role, Args)
    end;
leave([guild_hero | T], Role, Args) ->
    case guild_hero:is_arranging() of
        true -> {false, lang:get("公会英雄活动中,不可进行退出公会操作")};
        _ -> leave(T, Role, Args)
    end;
leave([check | _T], #role{m_guild = undefined},
      _Args) ->
    {false, lang:get("你未加入公会, 无法执行退出操作")};
leave([check | _T], #role{status = 2}, _Args) ->
    {false, lang:get("战斗中,不可进行退出公会操作")};
leave([check | _T], #role{s_event = Event}, _Args)
    when Event =:= 17 orelse Event =:= 18 ->
    {false, lang:get("公会战中不能退出公会")};
leave([check | _T], #role{s_event = Event}, _Args)
    when Event =:= 32 orelse Event =:= 33 ->
    {false, lang:get("公会联赛中不能退出公会")};
leave([check | T],
      Role = #role{id = RoleId, name = RoleName,
                   m_guild = #m_guild{pid = GuildPid},
                   assets = #assets{guild = Donation}},
      Args) ->
    Loss = case Donation of
               0 -> [];
               _ -> format:val_to_loss([{90011, min(100, Donation)}])
           end,
    case guild_mgr:apply(sync,
                         GuildPid,
                         {guild_common, sync_leave, [RoleId, RoleName]})
        of
        {true, Coin} ->
            case role_gain:do([#gain{label = coin, val = Coin}
                               | Loss],
                              Role)
                of
                {ok, NewRole} ->
                    leave(T, NewRole, [{result, true} | Args]);
                _Else ->
                    logger:error("~s获取铜币失败 ~w",
                                 [RoleName, _Else],
                                 guild_common,
                                 1005),
                    leave(T, Role, [{result, true} | Args])
            end;
        old_data -> leave(T, Role, [{result, old_data} | Args]);
        {false, Reason} -> {false, Reason};
        {destory, Coin} ->
            case role_gain:do([#gain{label = coin, val = Coin}],
                              Role)
                of
                {ok, NewRole} ->
                    leave(T, NewRole, [{result, destory} | Args]);
                _Else ->
                    logger:error("~s获取铜币失败 ~w",
                                 [RoleName, _Else],
                                 guild_common,
                                 1017),
                    leave(T, Role, [{result, destory} | Args])
            end;
        _Err ->
            logger:error("角色[~ts]退出公会失败[~w]",
                         [RoleName, _Err],
                         guild_common,
                         1021),
            {false, lang:get("公会系统暂时不可用，请稍后再试")}
    end;
leave([result | T], Role, Args) ->
    case lists:keyfind(result, 1, Args) of
        {result, true} ->
            case guild:leave(Role#role{m_guild = undefined}) of
                {ok, NewRole} -> leave(T, NewRole, Args);
                Else -> Else
            end;
        {_, _Flag} ->
            NewRole = Role#role{m_guild = undefined},
            leave(T, NewRole, Args);
        _ -> {false, lang:get("公会系统暂时不可用, 请稍后尝试")}
    end.

sync_leave(State = #guild{members = Members,
                          mem_num = MemNum, fresh_num = FreshNum, id = Gid},
           RoleId, RoleName) ->
    IsGuildWarMatched = guild_war:is_matched(),
    IsGuildHeroArranging = guild_hero:is_arranging(),
    case lists:keyfind(RoleId, #guild_role.id, Members) of
        false -> {ok, old_data};
        #guild_role{post = 60}
            when MemNum =/= 1 orelse FreshNum =/= 0 ->
            {ok, {false, lang:get("只有会长一人时，才能解散公会")}};
        #guild_role{post = 60} when IsGuildWarMatched ->
            {ok, {false, lang:get("公会战现在已匹配，请在公会战结束后再操作")}};
        #guild_role{post = 60} when IsGuildHeroArranging ->
            {ok, {false, lang:get("公会英雄正在进行中，请在活动结束后再操作")}};
        #guild_role{post = 60} ->
            case guild:destory(State) of
                {false, Reason} -> {ok, {false, Reason}};
                true ->
                    {Coin, _NewState} = guild_mercenary:auto_recall(State,
                                                                    RoleId),
                    guild_hero:leader_leave(RoleId, Gid),
                    {stop, normal, {destory, Coin}, State}
            end;
        M = #guild_role{} ->
            NewMembers = lists:keydelete(RoleId,
                                         #guild_role.id,
                                         Members),
            {NewMemNum, NewFreshNum} = guild_role:count(NewMembers),
            State1 = State#guild{flag = 1, members = NewMembers,
                                 mem_num = NewMemNum, fresh_num = NewFreshNum},
            State2 = add_event(State1, 6, [RoleId, RoleName]),
            {Coin, NewState} = guild_mercenary:auto_recall(State2,
                                                           RoleId),
            guild:cast(NewMembers, 11110, {2, M}),
            guild_role:del_role(RoleId),
            guild:sync_cache(NewState),
            guild_role:update_last_guild({M, State#guild.id}),
            guild_hero:leader_leave(RoleId, Gid),
            {ok, {true, Coin}, NewState}
    end.

appoint(#role{id = RoleId}, RoleId, _Post) ->
    {false, lang:get("不可对自身职务进行操作")};
appoint(#role{m_guild = #m_guild{pid = GuildPid},
              id = RoleId, pid = RolePid},
        AppRoleId, Post) ->
    case guild_mgr:apply(sync,
                         GuildPid,
                         {fun sync_appoint/5,
                          [RoleId, RolePid, AppRoleId, Post]})
        of
        {false, Reason} -> {false, Reason};
        {ok, Msg} -> {ok, Msg};
        _Err ->
            logger:error("设置会员职位时发生异常: ~w",
                         [_Err],
                         guild_common,
                         1088),
            {false, lang:get("公会系统暂时不可用，请稍后再试")}
    end.

sync_appoint(State = #guild{id = GuildId,
                            name = GuildName, members = Members},
             RoleId, _RolePid, AppRoleId, Post) ->
    case guild_role:check_fun(RoleId, Members, appoint) of
        false -> {ok, {false, lang:get("权限不足, 无法设置")}};
        {true, #guild_role{post = Post1}} when Post1 =< Post ->
            {ok, {false, lang:get("权限不足，无法设置职位")}};
        {true, #guild_role{post = Post1}} ->
            case lists:keyfind(AppRoleId, #guild_role.id, Members)
                of
                false -> {ok, {false, lang:get("不是该公会的成员，不能设置职位")}};
                #guild_role{post = Post2} when Post2 >= Post1 ->
                    {ok, {false, lang:get("权限不足，无法设置职位")}};
                #guild_role{post = Post} ->
                    {ok, {false, lang:get("职务相同, 无需设置")}};
                #guild_role{sex = 1} when Post =:= 25 ->
                    {ok, {false, lang:get("宝贝只能给妹子担任的哦")}};
                R = #guild_role{name = AppName, post = _OldPost} ->
                    case guild_role:check_post(State, R, Post) of
                        true ->
                            NewR = R#guild_role{post = Post},
                            guild:cast(Members, 11110, {1, NewR}),
                            NewMb = lists:keyreplace(AppRoleId,
                                                     #guild_role.id,
                                                     Members,
                                                     NewR),
                            guild_role:async_info(NewR),
                            State1 = State#guild{members = NewMb, flag = 1},
                            State2 = add_event(State1,
                                               1,
                                               [AppRoleId, AppName, Post]),
                            NewState = guild_util:update_num(State2),
                            guild:sync_cache(NewState),
                            camp_guild_bady:fire(change_post,
                                                 NewR,
                                                 #{old => R,
                                                   guild_id => GuildId,
                                                   guild_name => GuildName}),
                            {ok, {ok, lang:get("设置成功")}, NewState};
                        {false, Reason} -> {ok, {false, Reason}}
                    end
            end
    end.

modify_board(#role{m_guild = #m_guild{pid = GuildPid},
                   id = RoleId},
             Type, Content) ->
    Board1 = case Content of
                 "" when Type =:= 1 -> guild_common:msg(1);
                 "" -> guild_common:msg(2);
                 _ -> Content
             end,
    case guild_mgr:apply(sync,
                         GuildPid,
                         {fun sync_modify_board/4, [RoleId, Type, Board1]})
        of
        {false, Reason} -> {false, Reason};
        {ok, Msg} -> {ok, Msg};
        _Err ->
            logger:error("设置公告时发生异常: ~w",
                         [_Err],
                         guild_common,
                         1143),
            {false, lang:get("公会系统暂时不可用，请稍后再试")}
    end.

sync_modify_board(#guild{is_lock_board = 1}, _RoleId,
                  _Type, _Board) ->
    {ok, {false, lang:get("当前公告和宗旨已违规被锁定")}};
sync_modify_board(State = #guild{members = Members},
                  RoleId, Type, Board) ->
    case guild_role:check_fun(RoleId, Members, modify) of
        false -> {ok, {false, lang:get("权限不足, 无法设置")}};
        {true, _} ->
            Msg = case Type of
                      1 ->
                          notice:format(lang:get("公会宗旨修改为:~ts"),
                                        [{string_1, Board}]);
                      _ ->
                          notice:format(lang:get("公会公告修改为:~ts"),
                                        [{string_1, Board}])
                  end,
            guild:notice(Members, Msg),
            NewState = case Type of
                           1 ->
                               State#guild{board = Board, flag = 1,
                                           board_id = RoleId};
                           _ ->
                               State#guild{announcement = Board, flag = 1,
                                           announce_id = RoleId}
                       end,
            guild:sync_cache(NewState),
            {ok, {ok, lang:get("设置成功")}, NewState}
    end.

change_totem(#role{m_guild = #m_guild{pid = GuildPid},
                   id = RoleId},
             Totem) ->
    case guild_mgr:apply(sync,
                         GuildPid,
                         {fun sync_change_totem/3, [RoleId, Totem]})
        of
        {false, Reason} -> {false, Reason};
        ok -> ok;
        _Err ->
            logger:error("设置公告时发生异常: ~w",
                         [_Err],
                         guild_common,
                         1177),
            {false, lang:get("公会系统暂时不可用，请稍后再试")}
    end.

sync_change_totem(#guild{totem =
                             #guild_totem{changeable = 0}},
                  _RoleId, _TotemId) ->
    {ok, {false, lang:get("没有修改次数了")}};
sync_change_totem(State = #guild{members = Members,
                                 totem =
                                     Totem = #guild_totem{changeable = Chance}},
                  RoleId, TotemId) ->
    case guild_role:check_fun(RoleId, Members, modify) of
        false -> {ok, {false, lang:get("权限不足, 无法设置")}};
        {true, _} ->
            Now = date:unixtime(),
            NewState = State#guild{totem =
                                       Totem#guild_totem{id = TotemId,
                                                         last_changed = Now,
                                                         changeable =
                                                             max(0,
                                                                 Chance - 1)},
                                   flag = 1},
            guild:sync_cache(NewState),
            {ok, ok, NewState}
    end.

buy_totem_chance(Role = #role{m_guild =
                                  #m_guild{pid = GuildPid},
                              id = RoleId}) ->
    case guild_mgr:apply(sync,
                         GuildPid,
                         {fun sync_buy_totem_chance/2, [RoleId]})
        of
        {false, Reason} -> {false, Reason};
        {ok, NewChance} -> {ok, NewChance, Role};
        {error, timeout} ->
            {false, lang:get("公会系统暂时不可用，请稍后再试")};
        _Err ->
            logger:error("设置公告时发生异常: ~w",
                         [_Err],
                         guild_common,
                         1210),
            {false, lang:get("公会系统暂时不可用，请稍后再试")}
    end.

sync_buy_totem_chance(State = #guild{members = Members,
                                     totem =
                                         Totem = #guild_totem{changeable =
                                                                  Chance},
                                     assets = Assets},
                      RoleId) ->
    case guild_role:check_fun(RoleId, Members, modify) of
        false -> {ok, {false, lang:get("权限不足, 无法设置")}};
        {true, _} when Assets >= 300000 ->
            NewState = State#guild{totem =
                                       Totem#guild_totem{changeable =
                                                             Chance + 1},
                                   assets = Assets - 300000, flag = 1},
            guild_build:push_11113(NewState),
            guild:sync_cache(NewState),
            {ok, {ok, Chance + 1}, NewState};
        _ ->
            {ok,
             {false,
              util:flist(lang:get("修改公会图腾需要消耗~w公会资金"), [300000])}}
    end.

expel(Role = #role{m_guild =
                       #m_guild{pid = GuildPid, id = GuildId},
                   id = RoleId, name = RoleName, pid = RolePid},
      ExpelRoleId) ->
    IsGuildWar = guild_war:is_opening(),
    IsGuildHero = guild_hero:is_arranging(),
    Res = case catch ets:lookup_element(guild_list,
                                        GuildId,
                                        #guild.members)
              of
              _ when IsGuildWar ->
                  {false, lang:get("公会战活动中，不能进行开除成员操作")};
              _ when IsGuildHero ->
                  {false, lang:get("公会英雄活动中，不能进行开除成员操作")};
              Members = [_ | _] ->
                  case lists:keyfind(ExpelRoleId, #guild_role.id, Members)
                      of
                      #guild_role{post = Post} when Post =/= 0 ->
                          Loss = format:val_to_loss([{90006, 5}]),
                          role_gain:do_notice(Loss, Role);
                      _ -> {ok, Role}
                  end;
              _ -> {ok, Role}
          end,
    case Res of
        {ok, Role1} ->
            case guild_mgr:apply(sync,
                                 GuildPid,
                                 {fun sync_expel/2,
                                  [#{role_id => RoleId, role_name => RoleName,
                                     role_pid => RolePid,
                                     expel_id => ExpelRoleId}]})
                of
                {false, Reason} -> {false, Reason};
                {ok, Msg} -> {ok, Msg, Role1};
                _Err ->
                    logger:error("开除公会成员时发生异常:~w",
                                 [_Err],
                                 guild_common,
                                 1261),
                    {false, lang:get("公会繁忙，请稍后再尝试")}
            end;
        {false, #loss{msg = Msg}} -> {false, Msg};
        {false, Msg} -> {false, Msg};
        _Err ->
            logger:error("开除公会成员时发生异常:~w",
                         [_Err],
                         guild_common,
                         1269),
            {false, lang:get("公会繁忙，请稍后再尝试")}
    end.

sync_expel(State = #guild{name = GuildName,
                          members = Members},
           #{role_id := RoleId, role_name := RoleName,
             expel_id := ExpelRoleId}) ->
    case guild_role:check_fun(RoleId, Members, expel) of
        false -> {ok, {false, lang:get("权限不足，无法操作")}};
        {true, #guild_role{post = Post}} ->
            case lists:keyfind(ExpelRoleId, #guild_role.id, Members)
                of
                false -> {ok, {false, lang:get("无法开除非本公会的成员")}};
                #guild_role{post = 60} ->
                    {ok, {false, lang:get("无权限开除会长")}};
                #guild_role{post = Lpost} when Lpost >= Post ->
                    {ok, {false, lang:get("不能开除权限比自己高的成员")}};
                Gr = #guild_role{name = ExpelRoleName} ->
                    NewMembers = lists:keydelete(ExpelRoleId,
                                                 #guild_role.id,
                                                 Members),
                    State1 = guild_util:update_num(State#guild{flag = 1,
                                                               members =
                                                                   NewMembers}),
                    State2 = add_event(State1,
                                       7,
                                       [RoleId,
                                        RoleName,
                                        ExpelRoleId,
                                        ExpelRoleName]),
                    NewState = State2,
                    guild_role:async_expel(Gr, GuildName),
                    guild_role:del_role(ExpelRoleId),
                    guild_role:update_last_guild({Gr, State#guild.id}),
                    guild:cast(NewMembers, 11110, {2, Gr}),
                    guild:sync_cache(NewState),
                    Date = util:flist(lang:get("~w-~w-~w"),
                                      erlang:tuple_to_list(date())),
                    MailInfo = #{items => [], title => lang:get("公会变更"),
                                 content =>
                                     notice:format(lang:get("您于~ts被~ts请离~ts公会"),
                                                   [{string_2, 6, Date},
                                                    {role_2, RoleName},
                                                    {string_2, 2, GuildName}])},
                    mail:send(ExpelRoleId, MailInfo),
                    {ok, {ok, lang:get("开除成功")}, NewState}
            end
    end.

transfer(GuildPid, RoleId, RolePid, TransferId) ->
    case guild_mgr:apply(sync,
                         GuildPid,
                         {fun sync_transfer/4, [RoleId, RolePid, TransferId]})
        of
        {false, Reason} -> {false, Reason};
        ok -> ok;
        _Err ->
            logger:error("转让会长时发生异常: ~w",
                         [_Err],
                         guild_common,
                         1322),
            {false, lang:get("公会系统暂时不可用，请稍后再试")}
    end.

sync_transfer(State = #guild{members = Members}, RoleId,
              _RolePid, Tid) ->
    case lists:keyfind(RoleId, #guild_role.id, Members) of
        OldLeader = #guild_role{post = 60, name = RoleName} ->
            case lists:keyfind(Tid, #guild_role.id, Members) of
                R = #guild_role{post = 50, name = Tname, sex = Tsex,
                                classes = Tclasses, lev = Tlev} ->
                    NewR = R#guild_role{post = 60},
                    NewLeader = OldLeader#guild_role{post = 10},
                    NewMb = lists:keyreplace(Tid,
                                             #guild_role.id,
                                             Members,
                                             NewR),
                    NewMb1 = lists:keyreplace(RoleId,
                                              #guild_role.id,
                                              NewMb,
                                              NewLeader),
                    guild:cast(NewMb1, 11110, {1, NewR}),
                    guild:cast(NewMb1, 11110, {1, NewLeader}),
                    guild_role:async_info(NewR),
                    guild_role:async_info(NewLeader),
                    State1 = State#guild{leader_name = Tname,
                                         leader_id = Tid, leader_sex = Tsex,
                                         leader_classes = Tclasses,
                                         leader_lev = Tlev, members = NewMb1,
                                         flag = 1},
                    State2 = add_event(State1,
                                       9,
                                       [RoleId, RoleName, Tid, Tname]),
                    NewState = State2,
                    guild:sync_cache(NewState),
                    {ok, ok, NewState};
                _ -> {ok, {false, lang:get("只能转让给副会长")}}
            end;
        _ -> {ok, {false, lang:get("只有会长才能转让")}}
    end.

approve(AppRoleId, Flag,
        #role{id = ActRoleId, pid = ActRolePid,
              m_guild = #m_guild{pid = GuildPid}}) ->
    guild_mgr:apply(async,
                    GuildPid,
                    {fun async_approve/5,
                     [AppRoleId, Flag, ActRoleId, ActRolePid]}),
    ok.

async_approve(Guild = #guild{id = GuildId,
                             name = GuildName, pid = GuildPid, lev = GuildLev,
                             members = Members, apply_list = ApplyList},
              AppRoleId, Flag, ActRoleId, ActRolePid) ->
    case guild_role:check_fun(ActRoleId, Members, approve)
        of
        false ->
            role:pack_send(ActRolePid,
                           11124,
                           {0, lang:get("权限不足，无法操作"), 0, AppRoleId}),
            ok;
        {true, _} when Flag =:= 0 ->
            case lists:keyfind(AppRoleId,
                               #guild_apply.id,
                               ApplyList)
                of
                false ->
                    role:pack_send(ActRolePid,
                                   11124,
                                   {0, lang:get("申请不存在, 无需处理"), 1, AppRoleId}),
                    ok;
                _ ->
                    NewApplyList = lists:keydelete(AppRoleId,
                                                   #guild_apply.id,
                                                   ApplyList),
                    NewGuild = Guild#guild{flag = 1,
                                           apply_list = NewApplyList},
                    push_applys(NewApplyList, Members),
                    guild:sync_cache(NewGuild),
                    role:pack_send(ActRolePid,
                                   11124,
                                   {1, lang:get("拒绝成功"), 1, AppRoleId}),
                    {ok, guild_trigger:fire(#g_evt_member{}, NewGuild)}
            end;
        {true, _} when Flag =:= 1 ->
            case lists:keyfind(AppRoleId,
                               #guild_apply.id,
                               ApplyList)
                of
                false ->
                    role:pack_send(ActRolePid,
                                   11124,
                                   {0, lang:get("申请不存在, 无需处理"), 1, AppRoleId}),
                    ok;
                GuildApply ->
                    case check_approve(GuildApply, Guild) of
                        {false, Reason} ->
                            role:pack_send(ActRolePid,
                                           11124,
                                           {0, Reason, 0, AppRoleId}),
                            ok;
                        {ok, NewGuildApply} ->
                            Reply = guild_mgr:sync_approve(NewGuildApply,
                                                           {GuildId,
                                                            GuildPid,
                                                            GuildName,
                                                            GuildLev}),
                            NewGuild = handle_approve(Reply,
                                                      AppRoleId,
                                                      ActRolePid,
                                                      Guild),
                            camp_web:guild_push(NewGuild),
                            {ok, guild_trigger:fire(#g_evt_member{}, NewGuild)}
                    end
            end
    end.

sync_approve_join(Role = #role{m_guild = undefined,
                               sex = Sex},
                  #{info := {GuildId, GuildPid, GuildName, GuildLev},
                    tag := Tag, msg := SMsg}) ->
    Now = date:unixtime(),
    case guild_role:to_guild_role(Role) of
        {ok, GuildRole = #guild_role{post = Post}} ->
            NewGuildRole = GuildRole#guild_role{status = 1,
                                                last_login = Now,
                                                enter_time = Now},
            Mg = #m_guild{id = GuildId, pid = GuildPid,
                          name = GuildName, enter_time = Now,
                          guild_lev = GuildLev, post = Post},
            Role1 = guild_role:alters([{m_guild, Mg}], Role),
            NewRole = role_trigger:fire([#evt_guild{},
                                         #evt_guild_post{post = Post}],
                                        Role1),
            role:link_send(NewRole, 11104, {1, lang:get("成功加入公会")}),
            map:role_update(NewRole),
            Msgs1 = [lang:get("老司机带带我{face_1,1}"),
                     lang:get("这里管饭吗{face_1,20}"),
                     lang:get("听说会长聪明又善良{face_1,15}"),
                     lang:get("教练，我想打球{face_1,5}"),
                     lang:get("别人笑我太疯癫{face_1,35}"),
                     lang:get("天王盖地虎{face_1,35}"),
                     lang:get("骰子赢我叫声哥{face_1,1001}"),
                     lang:get("猜拳赢我发红包{face_1,1000}")],
            Msgs2 = case Sex of
                        0 -> [lang:get("都说咱公会帅哥多{face_1,29}") | Msgs1];
                        _ -> [lang:get("都说咱公会美女多{face_1,29}") | Msgs1]
                    end,
            Msg = case catch env:update_counter(guild_auto_chat_num,
                                                1)
                      of
                      _ when Tag =:= 1 -> SMsg;
                      I when is_integer(I) ->
                          lists:nth((I - 1) rem length(Msgs2) + 1, Msgs2);
                      _ -> util:rand_list(Msgs2)
                  end,
            chat:send_chat_msg(guild_others, Msg, NewRole),
            {ok, {true, NewGuildRole}, NewRole};
        _ -> {ok, false}
    end;
sync_approve_join(_Role, _GuildInfo) -> {ok, false}.

check_approve(GuildApply = #guild_apply{lev = Lev},
              #guild{mem_num = MemNum, max_mem_num = MaxMemNum0,
                     fresh_num = FreshNum, max_fresh_num = MaxFreshNum0,
                     exchequer_lev = ExchequerLev,
                     formalizing_lev = FormalizingLev}) ->
    {MaxMemNum, MaxFreshNum} = case
                                   guild_data:exchequer(ExchequerLev)
                                   of
                                   #{mem := MMemNum, fresh := MFreshNum} ->
                                       {MMemNum, MFreshNum};
                                   _ -> {MaxMemNum0, MaxFreshNum0}
                               end,
    case Lev >= FormalizingLev of
        true ->
            case MaxMemNum =< MemNum of
                true when MaxFreshNum =< FreshNum ->
                    {false, lang:get("成员位置数量不足, 无法通过申请")};
                true -> {ok, GuildApply#guild_apply{type = 0}};
                _ -> {ok, GuildApply#guild_apply{type = 10}}
            end;
        false ->
            case MaxFreshNum =< FreshNum of
                true -> {false, lang:get("公会人数已满, 无法通过申请")};
                false -> {ok, GuildApply#guild_apply{type = 0}}
            end
    end.

handle_approve({Type, Args}, RoleId, ActRolePid,
               Guild = #guild{members = Members, id = GuildId,
                              apply_list = ApplyList, name = GuildName}) ->
    NewApplyList = lists:keydelete(RoleId,
                                   #guild_apply.id,
                                   ApplyList),
    Value = case guild_role:get_last_guild(RoleId) of
                {ok, #guild_leaver{guild_id = GuildId, value = V}} -> V;
                _ -> 0
            end,
    MailInfo = #{items => [],
                 title =>
                     notice:format(lang:get("欢迎加入~ts"),
                                   [{string_2, 6, GuildName}]),
                 content =>
                     notice:format(lang:get("你的加入公会申请已经通过啦，以后就是~ts公会的一员了，快快努力融入集体吧！"),
                                   [{string_2, 2, GuildName}])},
    NewGuild = case {Type, Args} of
                   {online_join,
                    Gr = #guild_role{id = RoleId, name = RoleName}} ->
                       NewMembers = lists:keystore(RoleId,
                                                   #guild_role.id,
                                                   Members,
                                                   Gr#guild_role{value =
                                                                     Value}),
                       guild:cast(Members, 11110, {1, Gr}),
                       {NewMemNum, NewFreshNum} = guild_role:count(NewMembers),
                       Msg = notice:format(lang:get("~ts加入公会"),
                                           [{role_2, RoleName}]),
                       role:pack_send(ActRolePid, 11124, {1, Msg, 1, RoleId}),
                       Guild1 = Guild#guild{apply_list = NewApplyList,
                                            members = NewMembers,
                                            mem_num = NewMemNum,
                                            fresh_num = NewFreshNum, flag = 1},
                       Guild2 = add_event(Guild1, 5, [RoleId, RoleName]),
                       mail:send(RoleId, MailInfo),
                       guild_mgr:refresh_applys(),
                       Guild2;
                   {off_join,
                    Gr0 = #guild_role{id = RoleId, name = RoleName}} ->
                       Now = date:unixtime(),
                       Gr = Gr0#guild_role{enter_time = Now},
                       NewMembers = lists:keystore(RoleId,
                                                   #guild_role.id,
                                                   Members,
                                                   Gr#guild_role{value =
                                                                     Value}),
                       guild:cast(Members, 11110, {1, Gr}),
                       {NewMemNum, NewFreshNum} = guild_role:count(NewMembers),
                       Msg = notice:format(lang:get("~ts加入公会"),
                                           [{role_2, RoleName}]),
                       role:pack_send(ActRolePid, 11124, {1, Msg, 1, RoleId}),
                       Guild1 = Guild#guild{apply_list = NewApplyList,
                                            members = NewMembers,
                                            mem_num = NewMemNum,
                                            fresh_num = NewFreshNum, flag = 1},
                       Guild2 = add_event(Guild1, 5, [RoleId, RoleName]),
                       mail:send(RoleId, MailInfo),
                       guild_mgr:refresh_applys(),
                       Guild2;
                   {has_guild, _} ->
                       role:pack_send(ActRolePid,
                                      11124,
                                      {0, lang:get("对方已有公会"), 1, RoleId}),
                       Guild#guild{apply_list = NewApplyList, flag = 1};
                   _Err ->
                       roll_back(RoleId, GuildId),
                       role:pack_send(ActRolePid,
                                      11124,
                                      {0, lang:get("系统正在处理申请请求"), 1, RoleId}),
                       Guild#guild{apply_list = NewApplyList, flag = 1}
               end,
    push_applys(NewApplyList, Members),
    guild:sync_cache(NewGuild),
    NewGuild.

roll_back(RoleId, GuildId) ->
    case guild_role:find_role(RoleId) of
        {ok, GuildId} -> guild_role:del_role(RoleId);
        _ -> skip
    end,
    case role_query:pid(by_id, RoleId) of
        {ok, RolePid} ->
            role:apply(async,
                       RolePid,
                       {fun async_roll_back/2, [GuildId]});
        _ -> skip
    end,
    ok.

async_roll_back(Role = #role{m_guild =
                                 #m_guild{id = GuildId}},
                GuildId) ->
    NewRole = Role#role{m_guild = undefined},
    {ok, NewRole};
async_roll_back(_, _) -> ok.

set_signature(Role = #role{m_guild =
                               #m_guild{pid = GuildPid, post = Post},
                           id = RoleId},
              ToRoleId, Signature) ->
    case guild_mgr:apply(sync,
                         GuildPid,
                         {fun sync_set_signature/4,
                          [RoleId, ToRoleId, Signature]})
        of
        ok when RoleId =:= ToRoleId ->
            {ok, NewRole} = guild_role:set(Role,
                                           {signature, Signature, Post}),
            {ok, NewRole};
        Else -> Else
    end.

sync_set_signature(Guild = #guild{members = Members,
                                  lev = GuildLev},
                   RoleId, ToRoleId, Signature) ->
    case guild_role:check_fun(RoleId,
                              Members,
                              set_signature)
        of
        false ->
            Reply = {false, lang:get("没有足够的权限修改个性签名")},
            {ok, Reply};
        {true, #guild_role{post = Post}} ->
            case lists:keyfind(ToRoleId, #guild_role.id, Members) of
                R = #guild_role{pid = ToRolePid} ->
                    case set_week_signed(R#guild_role{signature =
                                                          Signature},
                                         GuildLev)
                        of
                        NewR = #guild_role{} ->
                            NewMb = lists:keyreplace(ToRoleId,
                                                     #guild_role.id,
                                                     Members,
                                                     NewR),
                            NewGuild = Guild#guild{members = NewMb, flag = 1},
                            case RoleId =/= ToRoleId andalso is_pid(ToRolePid)
                                of
                                true ->
                                    role:apply(async,
                                               ToRolePid,
                                               {guild_role,
                                                set,
                                                [{signature,
                                                  Signature,
                                                  Post}]});
                                _ -> ok
                            end,
                            guild:cast(NewMb, 11110, {1, NewR}),
                            guild:sync_cache(NewGuild),
                            {ok, ok, NewGuild};
                        Else -> {ok, Else}
                    end;
                _ -> {0, lang:get("对方不在本公会, 无法修改")}
            end
    end.

set_week_signed(R = #guild_role{last_signed =
                                    LastSigned,
                                signed = Signed},
                GuildLev) ->
    Now = date:unixtime(),
    case date:is_same_week(Now, LastSigned) of
        true ->
            case guild_common:get_signable(GuildLev) > Signed of
                true ->
                    R#guild_role{last_signed = Now, signed = Signed + 1};
                _ -> {false, lang:get("本周修改签名次数已用完")}
            end;
        _ -> R#guild_role{last_signed = Now, signed = 1}
    end.

clear_apply(GuildPid, RoleId, RolePid) ->
    guild_mgr:apply(async,
                    GuildPid,
                    {fun async_clear_apply/3, [RoleId, RolePid]}),
    ok.

async_clear_apply(Guild = #guild{members = Members},
                  RoleId, RolePid) ->
    case guild_role:check_fun(RoleId, Members, approve) of
        false ->
            role:pack_send(RolePid,
                           11127,
                           {0, lang:get("没有足够的权限清空申请列表")}),
            ok;
        {true, _} ->
            NewApplyList = [],
            NewGuild = Guild#guild{apply_list = NewApplyList,
                                   flag = 1},
            role:pack_send(RolePid,
                           11127,
                           {1, lang:get("成功清空申请列表")}),
            guild:sync_cache(NewGuild),
            {ok, NewGuild}
    end.

add_event(Guild = #guild{members = Members}, EventType,
          Args) ->
    case do_event(EventType, Args) of
        {true, Msg} ->
            guild:notice(Members, Msg),
            Guild#guild{event_list = []};
        _ -> Guild
    end.

do_event(1, [_RoleId, RoleName, Post]) ->
    Msg = notice:format(lang:get("~ts成为本公会的~ts"),
                        [{role_2, RoleName},
                         {string_2, 1, guild_util:post_to_name(Post)}]),
    {true, Msg};
do_event(3, [Type, Lev]) ->
    Msg = notice:format(lang:get("由于公会维护需要，~ts降低至~ts级"),
                        [{string_2, 1, guild_util:build_to_name(Type)},
                         {string_2, 5, Lev}]),
    {true, Msg};
do_event(4, [_UpKeep]) -> false;
do_event(5, [_RoleId, RoleName]) ->
    Msg =
        notice:format(lang:get("~ts欢迎~ts加入公会，使我们公会的实力更强大了，大家一起鼓掌欢迎！"),
                      [{role_2, lang:get("公会总管:")}, {role_2, RoleName}]),
    {true, Msg};
do_event(6, [RoleId, RoleName]) ->
    camp_guild_bady:fire(leave_guild, RoleId, RoleName),
    Msg = notice:format(lang:get("~ts离开了公会"),
                        [{role_2, RoleName}]),
    {true, Msg};
do_event(7,
         [_RoleId, RoleName, KickRoleId, KickRoleName]) ->
    camp_guild_bady:fire(leave_guild,
                         KickRoleId,
                         KickRoleName),
    Msg = notice:format(lang:get("~ts被~ts开除出公会"),
                        [{role_2, KickRoleName}, {role_2, RoleName}]),
    {true, Msg};
do_event(9, [_RoleId, RoleName, _TRoleId, TRoleName]) ->
    Msg = notice:format(lang:get("~ts把会长职务转让给~ts"),
                        [{role_2, RoleName}, {role_2, TRoleName}]),
    {true, Msg};
do_event(8, [#{msg := Msg}]) -> {true, Msg};
do_event(_, _) -> false.

add_assets(Value,
           #role{m_guild = #m_guild{pid = GuildPid}}) ->
    guild_mgr:apply(async,
                    GuildPid,
                    {fun async_add_assets/2, [Value]}),
    ok;
add_assets({Gid, Platform, ZoneId}, Value) ->
    guild_mgr:apply(async,
                    {Gid, Platform, ZoneId},
                    {fun async_add_assets/2, [Value]}),
    ok;
add_assets(_, _) -> ok.

async_add_assets(State = #guild{assets = Assets,
                                max_assets = Max, name = Name, id = Id},
                 {not_weekly, Value}) ->
    NewAssets = min(Assets + Value, Max),
    logger:info("公会 ~w[~ts]获得活动资金:~w, 原值:~w，max: ~w, "
                "新值:~w",
                [Id, Name, Value, Assets, Max, NewAssets],
                guild_common,
                1654),
    NewState = State#guild{assets = NewAssets, flag = 1},
    guild_build:push_11113(NewState),
    {ok, NewState};
async_add_assets(State = #guild{assets = Assets,
                                max_assets = Max, week_assets = WeekAssets},
                 Value) ->
    NewAssets = min(Assets + Value, Max),
    NewState = State#guild{assets = NewAssets,
                           week_assets =
                               WeekAssets + max(0, NewAssets - Assets),
                           flag = 1},
    guild_build:push_11113(NewState),
    {ok, NewState}.

get_signable(GuildLev) ->
    case guild_data:uplev(GuildLev) of
        #{signable := Num} -> Num;
        _ -> 0
    end.

usurp(Role = #role{id = Id,
                   m_guild = #m_guild{pid = GuildPid}, sex = Sex,
                   classes = Classes, name = Name}) ->
    Usurper = #guild_usurper{id = Id, name = Name,
                             sex = Sex, classes = Classes,
                             ctime = date:unixtime()},
    Loss = format:val_to_loss([{90000, 500000}]),
    case role_gain:do_notice(Loss, Role) of
        {ok, Role1} ->
            case guild_mgr:apply(sync,
                                 GuildPid,
                                 {guild_common, sync_usurp, [Usurper]})
                of
                ok -> {ok, Role1};
                {error, timeout} ->
                    {ok, lang:get("公会系统暂时不可用，请稍后再试"), Role1};
                Else -> Else
            end;
        {false, #loss{msg = Msg}} -> {false, Msg}
    end;
usurp(_) -> {false, lang:get("你还没加入公会")}.

sync_usurp(#guild{usurpers = Usurpers}, _Id)
    when length(Usurpers) >= 3 ->
    {ok,
     {false, util:flist(lang:get("现在已经有~w个自荐者了"), [3])}};
sync_usurp(G = #guild{members = Members,
                      usurpers = Usurpers},
           Usurper = #guild_usurper{id = Id, name = Name}) ->
    Now = date:unixtime(),
    Res = case lists:keyfind(60, #guild_role.post, Members)
              of
              #guild_role{status = 1} ->
                  {false, lang:get("会长大人现在正在线呢，你想干嘛？！！")};
              #guild_role{last_logout = Logout}
                  when Now - Logout < 3600 * 48 ->
                  {false, lang:get("会长离线时间还不够48小时啊！！")};
              #guild_role{id = LeaderId} ->
                  case lists:keyfind(Id, #guild_usurper.id, Usurpers) of
                      #guild_usurper{} -> {false, lang:get("你已经自荐过了")};
                      _ ->
                          Msg =
                              notice:format(lang:get("~ts自荐成为会长，~ts如果有长老及以上成员反对，则自荐失败"),
                                            [{role_2, Name},
                                             {string_2, 5, lang:get("48小时")}]),
                          guild:notice(Members, Msg),
                          MailInfo = #{items => [], title => lang:get("自荐会长"),
                                       content =>
                                           notice:format(lang:get("由于您48小时内没有登录游戏，公会成员~ts自荐成为会长，~ts如果有长老及以上成员反对，"
                                                                  "则自荐失败"),
                                                         [{role_2, Name},
                                                          {string_2,
                                                           5,
                                                           lang:get("48小时")}])},
                          mail:send(LeaderId, MailInfo),
                          {ok, G#guild{usurpers = [Usurper | Usurpers]}}
                  end
          end,
    case Res of
        {false, _} -> {ok, Res};
        {ok, NewG = #guild{}} -> {ok, ok, NewG};
        _ -> Res
    end.

reject_usurping(#role{m_guild =
                          #m_guild{post = Post, pid = GuildPid},
                      id = ExeId},
                Id)
    when Post >= 40 ->
    guild_mgr:apply(sync,
                    GuildPid,
                    {guild_common, sync_reject_usurping, [ExeId, Id]});
reject_usurping(_, _) ->
    {false, lang:get("只有长老以上职位才能反对自荐")}.

sync_reject_usurping(G = #guild{members = Members,
                                usurpers = Usurpers},
                     ExeId, Id) ->
    Res = case lists:keyfind(ExeId, #guild_role.id, Members)
              of
              #guild_role{post = Post} when Post < 40 ->
                  {false, lang:get("只有长老以上职位才能反对自荐")};
              #guild_role{name = ExeName, post = Post} ->
                  case lists:keyfind(Id, #guild_usurper.id, Usurpers) of
                      #guild_usurper{name = UName} ->
                          Msg =
                              notice:format(lang:get("由于公会~ts~ts的反对，~ts自荐会长失败。"),
                                            [{string_2,
                                              1,
                                              guild_util:post_to_name(Post)},
                                             {role_2, ExeName},
                                             {role_2, UName}]),
                          guild:notice(Members, Msg),
                          MailInfo = #{items => [], title => lang:get("公会通知"),
                                       content =>
                                           notice:format(lang:get("很遗憾，由于48小时内受到公会~ts~ts的反对，您自荐会长失败，可以与公会成员商量后再行"
                                                                  "自荐哦！"),
                                                         [{string_2,
                                                           1,
                                                           guild_util:post_to_name(Post)},
                                                          {role_2, ExeName}])},
                          mail:send(Id, MailInfo),
                          case lists:keyfind(60, #guild_role.post, Members) of
                              #guild_role{id = LeaderId} ->
                                  MailInfo2 = #{items => [],
                                                title => lang:get("公会通知"),
                                                content =>
                                                    notice:format(lang:get("由于48小时内受到公会~ts~ts的反对，~ts自荐会长失败。"),
                                                                  [{string_2,
                                                                    1,
                                                                    guild_util:post_to_name(Post)},
                                                                   {role_2,
                                                                    ExeName},
                                                                   {role_2,
                                                                    UName}])},
                                  mail:send(LeaderId, MailInfo2);
                              _ -> ok
                          end,
                          {ok,
                           G#guild{usurpers =
                                       lists:keydelete(Id,
                                                       #guild_usurper.id,
                                                       Usurpers)}};
                      _ -> {false, lang:get("对方暂时没有这方面野心")}
                  end
          end,
    case Res of
        {false, _} -> {ok, Res};
        {ok, NewG = #guild{}} -> {ok, ok, NewG};
        _ -> Res
    end.

calc_usurper_timeout([]) -> false;
calc_usurper_timeout(Usurpers) ->
    Fun = fun (#guild_usurper{ctime = Ts1},
               #guild_usurper{ctime = Ts2}) ->
                  Ts1 < Ts2
          end,
    [#guild_usurper{ctime = Ts, id = Id} | _] =
        lists:sort(Fun, Usurpers),
    case Ts + 3600 * 48 - date:unixtime() of
        Timeout when Timeout > 0 -> false;
        _ -> {ok, Id}
    end.

usurp_done(State = #guild{usurpers = []}) -> State;
usurp_done(State = #guild{members = Members,
                          usurpers = Usurpers}) ->
    case calc_usurper_timeout(Usurpers) of
        {ok, Tid} ->
            case lists:keyfind(60, #guild_role.post, Members) of
                OldLeader = #guild_role{id = RoleId, name = RoleName} ->
                    case lists:keyfind(Tid, #guild_role.id, Members) of
                        R = #guild_role{post = Post, name = Tname, sex = Tsex,
                                        classes = Tclasses, lev = Tlev} ->
                            NewR = R#guild_role{post = 60},
                            NewLeader = OldLeader#guild_role{post = Post},
                            NewMb = lists:keyreplace(Tid,
                                                     #guild_role.id,
                                                     Members,
                                                     NewR),
                            NewMb1 = lists:keyreplace(RoleId,
                                                      #guild_role.id,
                                                      NewMb,
                                                      NewLeader),
                            MailInfo = #{items => [], title => lang:get("公会通知"),
                                         content =>
                                             notice:format(lang:get("由于~ts没有长老及以上成员反对，~ts通过自荐成功当选为本公会会长，相信TA定能够将公会"
                                                                    "发扬光大，成就一方霸业！"),
                                                           [{string_2,
                                                             5,
                                                             lang:get("48小时")},
                                                            {role_2, Tname}])},
                            lists:foreach(fun (#guild_role{id = Mid}) ->
                                                  mail:send(Mid, MailInfo);
                                              (_) -> ok
                                          end,
                                          NewMb1),
                            guild_role:async_info(NewR),
                            guild_role:async_info(NewLeader),
                            State1 = State#guild{leader_name = Tname,
                                                 leader_id = Tid,
                                                 leader_sex = Tsex,
                                                 leader_classes = Tclasses,
                                                 leader_lev = Tlev,
                                                 members = NewMb1, flag = 1,
                                                 usurpers = []},
                            State2 = add_event(State1,
                                               9,
                                               [RoleId, RoleName, Tid, Tname]),
                            NewState = State2,
                            guild:sync_cache(NewState),
                            NewState;
                        _ -> State
                    end;
                _ -> State
            end;
        _ -> State
    end.

invite(#role{id = Id,
             m_guild = #m_guild{id = GuildId, name = GuildName},
             lev = Lev, sex = Sex, classes = Classes, name = Name},
       RecipientId) ->
    case role_misc:is_local_role(RecipientId) of
        true ->
            case guild_war:is_opening() orelse
                     guild_hero:is_arranging()
                of
                _ ->
                    Invitation = #guild_invitation{id = Id, name = Name,
                                                   sex = Sex, classes = Classes,
                                                   lev = Lev,
                                                   ctime = date:unixtime(),
                                                   guild_id = GuildId,
                                                   guild_name = GuildName},
                    role:apply(sync,
                               RecipientId,
                               {guild_common, sync_invite, [Invitation]})
            end;
        _ -> {false, lang:get("暂时不支持邀请非本服玩家")}
    end;
invite(_, _) -> {false, lang:get("请先加入公会再去邀请别人")}.

sync_invite(#role{m_guild = #m_guild{pid = Pid}},
            _Invitation)
    when is_pid(Pid) ->
    {ok, {false, lang:get("对方已经有公会")}};
sync_invite(#role{lev = Lev}, _Invitation)
    when Lev < 30 ->
    {ok, {false, lang:get("不能向低于30级的玩家发起邀请")}};
sync_invite(_Role = #role{link =
                              #link{conn_pid = ConnPid}},
            Invitation = #guild_invitation{id = Id}) ->
    Res = case erlang:get(guild_invitation) of
              L when is_list(L) ->
                  case lists:keyfind(Id, #guild_invitation.id, L) of
                      #guild_invitation{} ->
                          {false, lang:get("你已邀请过对方，请等待回复")};
                      _ ->
                          sys_conn:pack_send(ConnPid, 11185, {Invitation}),
                          erlang:put(guild_invitation,
                                     lists:keystore(Id,
                                                    #guild_invitation.id,
                                                    L,
                                                    Invitation)),
                          ok
                  end;
              _ ->
                  sys_conn:pack_send(ConnPid, 11185, {Invitation}),
                  erlang:put(guild_invitation, [Invitation]),
                  ok
          end,
    {ok, Res}.

reply_invitation(_Role, Id, 0) ->
    case erlang:get(guild_invitation) of
        L when is_list(L) ->
            erlang:put(guild_invitation,
                       lists:keydelete(Id, #guild_invitation.id, L));
        _ -> erlang:put(guild_invitation, [])
    end,
    ok;
reply_invitation(Role, Id, _) ->
    case guild_war:is_opening() orelse
             guild_hero:is_arranging()
        of
        true -> {false, lang:get("公会活动中，请在活动结束后再操作")};
        _ ->
            case erlang:get(guild_invitation) of
                L when is_list(L) ->
                    case lists:keyfind(Id, #guild_invitation.id, L) of
                        #guild_invitation{guild_id = GuildId} ->
                            erlang:put(guild_invitation,
                                       lists:keydelete(Id,
                                                       #guild_invitation.id,
                                                       L)),
                            join([self_check, convert, invite_check],
                                 GuildId,
                                 Role,
                                 #{inviter_id => Id});
                        _ -> {false, lang:get("邀请不存在")}
                    end;
                _ -> {false, lang:get("邀请不存在")}
            end
    end.

send_mail(_, _Title, "") ->
    {false, lang:get("邮件内容不能为空")};
send_mail(Role = #role{id = Id = {_, Platform, ZoneId},
                       name = Name,
                       m_guild = #m_guild{pid = GuildPid, post = Post}},
          _Title, Content)
    when Post >= 50 ->
    Now = date:unixtime(),
    Mail = #mail{sess =
                     {env:update_counter(mail_sess_id, 1), Platform, ZoneId},
                 type = 2, from = Id, from_name = Name,
                 title = lang:get("公会邮件"), content = Content, ts = Now,
                 rev_ts = Now},
    Loss = format:val_to_loss([{90006, 30}]),
    case role_gain:do_notice(Loss, Role) of
        {ok, Role1} ->
            case guild_mgr:apply(sync,
                                 GuildPid,
                                 {guild_common, sync_send_mail, [Mail]})
                of
                ok ->
                    log:mail(guild_mail, Role1, Mail),
                    {ok, Role1};
                {error, timeout} -> {ok, lang:get("公会系统暂时不可用，请稍后再试")};
                Else -> Else
            end;
        {false, #loss{msg = Msg}} -> {false, Msg}
    end;
send_mail(Gid = {_, _Platform, _ZoneId}, Title,
          Content) ->
    guild_mgr:apply(async,
                    Gid,
                    {guild_common,
                     sync_send_mail,
                     [#{title => Title, content => Content}]});
send_mail(_, _, _) ->
    {false, lang:get("只有会长与副会长才可以发公会邮件")}.

sync_send_mail(G = #guild{id = {_, Platform, ZoneId},
                          members = Members, leader_id = _LeaderId,
                          leader_name = _LeaderName, mail_list = OldMailList},
               Info = #{content := Content}) ->
    FromName = case Info of
                   #{from_name := FName} -> FName;
                   _ -> lang:get("公会管家")
               end,
    Now = date:unixtime(),
    MailId = {env:update_counter(mail_sess_id, 1),
              Platform,
              ZoneId},
    Mail = #mail{sess = MailId, from = {0, "", 0},
                 from_name = FromName, type = 2,
                 title = lang:get("公会邮件"), content = Content, ts = Now,
                 rev_ts = Now},
    NewMailList = lists:sublist([MailId | OldMailList], 20),
    insert_guild_mail(Mail),
    DelMail = OldMailList -- NewMailList,
    del_guild_mail(DelMail),
    lists:foreach(fun (Gr) -> notice_mail(Gr, Mail) end,
                  Members),
    {ok, G#guild{mail_list = NewMailList}};
sync_send_mail(G = #guild{members = Members,
                          mail_list = OldMailList},
               Mail = #mail{sess = MailId, from = From}) ->
    Res = case lists:keyfind(From, #guild_role.id, Members)
              of
              #guild_role{post = Post} when Post < 50 ->
                  {false, lang:get("只有会长与副会长才可以发公会邮件")};
              #guild_role{} ->
                  NewMailList = lists:sublist([MailId | OldMailList], 20),
                  insert_guild_mail(Mail),
                  DelMail = OldMailList -- NewMailList,
                  del_guild_mail(DelMail),
                  {ok, G#guild{mail_list = NewMailList}}
          end,
    case Res of
        {false, _} -> {ok, Res};
        {ok, NewG = #guild{}} ->
            lists:foreach(fun (Gr) -> notice_mail(Gr, Mail) end,
                          Members),
            {ok, ok, NewG};
        _ -> Res
    end.

notice_mail(#guild_role{id = To, name = ToName,
                        pid = ToPid},
            Mail = #mail{})
    when is_pid(ToPid) ->
    Mail1 = Mail#mail{to = To, to_name = ToName},
    role:apply(async, ToPid, {mail, new_arrive, [[Mail1]]}),
    ok;
notice_mail(_, _) -> ok.

insert_guild_mail(Mail = #mail{}) ->
    ets:insert(guild_mail, Mail),
    dets:insert(guild_mail, Mail),
    ok;
insert_guild_mail(_Err) ->
    logger:error("公会邮件插入错误数据:~w",
                 [_Err],
                 guild_common,
                 1989),
    ok.

del_guild_mail([]) -> ok;
del_guild_mail([H | T]) ->
    do_del_guild_mail(H),
    del_guild_mail(T).

do_del_guild_mail(MailId = {_, _, _}) ->
    ets:delete(guild_mail, MailId),
    dets:delete(guild_mail, MailId),
    ok;
do_del_guild_mail(_) -> ok.

lookup_guild_mail(MailId) ->
    case catch ets:lookup(guild_mail, MailId) of
        [Mail = #mail{}] -> {ok, Mail};
        _ -> false
    end.

get_mails(Role = #role{m_guild = Mguild}) ->
    case Mguild of
        #m_guild{id = GuildId} ->
            NewMailList = case catch ets:lookup_element(guild_list,
                                                        GuildId,
                                                        #guild.mail_list)
                              of
                              MailList when is_list(MailList) -> MailList;
                              _ -> []
                          end,
            MailRead = var:get_var(Role, other, 2087, []),
            NewMailRead = do_init_mail(NewMailList, MailRead, []),
            NewRole = var:set_var(Role, other, 2087, NewMailRead),
            Mails = do_get_mails(NewMailRead, []),
            {true, Mails, NewRole};
        _ -> ok
    end.

do_get_mails([], Mails) -> Mails;
do_get_mails([{MailId, RecvTime} | T], Mails) ->
    case lookup_guild_mail(MailId) of
        {ok, Mail} ->
            case RecvTime > 0 of
                true ->
                    do_get_mails(T,
                                 [Mail#mail{status = 1, read_ts = RecvTime}
                                  | Mails]);
                _ -> do_get_mails(T, [Mail | Mails])
            end;
        _ -> do_get_mails(T, Mails)
    end.

do_init_mail([], _MailRead, ReadList) -> ReadList;
do_init_mail([MailId | T], MailRead, ReadList) ->
    case lists:keyfind(MailId, 1, MailRead) of
        {_, ReadTime} ->
            do_init_mail(T,
                         MailRead,
                         [{MailId, ReadTime} | ReadList]);
        _ -> do_init_mail(T, MailRead, [{MailId, 0} | ReadList])
    end.

mark_mail(Role, Sess) ->
    MailRead = var:get_var(Role, other, 2087, []),
    Now = date:unixtime(),
    NewMailRead = lists:keystore(Sess,
                                 1,
                                 MailRead,
                                 {Sess, Now}),
    NewRole = var:set_var(Role, other, 2087, NewMailRead),
    {ok, NewRole}.

exchange_donation(Role = #role{m_guild = #m_guild{}},
                  Type) ->
    V = var:get_var(Role, week, 207, 0),
    case V >= 1000 of
        true -> {false, lang:get("本周可兑换贡献不足")};
        _ ->
            case guild_data:get_donation_exchanging(Type) of
                #{donation := Donation} when Donation + V > 1000 ->
                    {false, lang:get("本周可兑换贡献不足")};
                #{loss_type := Label, loss_num := Val,
                  donation := Donation} ->
                    Loss =
                        format:val_to_loss(format:gain_to_val([#gain{label =
                                                                         Label,
                                                                     val =
                                                                         Val}])),
                    Gain = format:val_to_gain([{90011, Donation}]),
                    case role_gain:do_notice(Loss ++ Gain,
                                             var:add_var(Role,
                                                         week,
                                                         207,
                                                         Donation))
                        of
                        {ok, NewRole} ->
                            push_exchangable(NewRole),
                            {ok, NewRole};
                        {false, #loss{msg = Msg}} -> {false, Msg}
                    end;
                _ -> {false, lang:get("不能兑换")}
            end
    end;
exchange_donation(_, _) ->
    {false, lang:get("不在公会中不能兑换")}.

exchange_assets(Role = #role{m_guild =
                                 Mguild = #m_guild{id = GuildId}},
                Type) ->
    case {guild_mgr:attr(GuildId, #guild.lev),
          guild_mgr:attr(GuildId, #guild.assets)}
        of
        {GLev, GAssets}
            when is_integer(GLev) andalso is_integer(GAssets) ->
            case guild_data:uplev(GLev) of
                #{assets_limit := AssetsLimit}
                    when GAssets >= AssetsLimit ->
                    {false, lang:get("公会资金已达到上限，无法购买")};
                #{assets_limit := AssetsLimit} ->
                    case guild_data:get_assets_exchanging(Type) of
                        #{assets := Donation}
                            when Donation + GAssets > AssetsLimit ->
                            {false, lang:get("公会资金达到上限，无法购买")};
                        #{loss_type := Label, loss_num := Val,
                          assets := Donation, donation := Donation2} ->
                            Loss =
                                format:val_to_loss(format:gain_to_val([#gain{label
                                                                                 =
                                                                                 Label,
                                                                             val
                                                                                 =
                                                                                 Val}])),
                            Gain = format:val_to_gain([{90015, Donation},
                                                       {90011, Donation2}]),
                            case role_gain:do_notice(Loss ++ Gain,
                                                     var:add_var(Role,
                                                                 week,
                                                                 213,
                                                                 Donation))
                                of
                                {ok, NewRole} ->
                                    push_exchangable_assets(NewRole),
                                    guild:notice(Mguild,
                                                 notice:format(lang:get("~ts豪情一掷，为公会增加了~ts公会资金{face_1, 25}"),
                                                               [{role_2, Role},
                                                                {string_2,
                                                                 5,
                                                                 Donation}])),
                                    {ok, NewRole};
                                {false, #loss{msg = Msg}} -> {false, Msg}
                            end;
                        _ -> {false, lang:get("不能兑换")}
                    end;
                _ -> {false, lang:get("购买失败，查不到公会资金上限")}
            end;
        _ -> {false, lang:get("没有找到公会信息")}
    end;
exchange_assets(_, _) -> {false, lang:get("不在公会中不能兑换")}.

push_exchangable(Role = #role{link =
                                  #link{conn_pid = ConnPid}}) ->
    Remain = max(0, 1000 - var:get_var(Role, week, 207, 0)),
    sys_conn:pack_send(ConnPid, 11175, {Remain}).

push_exchangable_assets(Role = #role{link =
                                         #link{conn_pid = ConnPid}}) ->
    Remain = max(0,
                 90000000 - var:get_var(Role, week, 213, 0)),
    sys_conn:pack_send(ConnPid, 11196, {Remain}).

gen_packets(Amount, L) when Amount < 1 -> L;
gen_packets(Amount, L) ->
    O = util:rand_list(L),
    R = util:rand(1, max(1, Amount div 3)),
    NL = L -- [O],
    gen_packets(Amount - R, [O + R | NL]).

push_applys(NewApplyList, Members) ->
    lists:foreach(fun (#guild_role{pid = MPid, post = Post})
                          when is_pid(MPid) andalso Post > 20 ->
                          role:pack_send(MPid, 11123, {NewApplyList});
                      (_) -> ok
                  end,
                  Members).

msg(1) -> lang:get("招收各职业成员，公会战勇夺第一！");
msg(2) ->
    lang:get("每天必做玩法：做满10次职业任务，打满10张藏宝图，30环悬赏任务，2次多人副本，天空之塔"
             "尽量打满");
msg(_) -> lang:get("").

sync_adm_transfer(State = #guild{members = Members},
                  RoleId, Msg) ->
    case lists:keyfind(RoleId, #guild_role.id, Members) of
        false -> {ok, {false, lang:get("不是该公会的成员，不能设置职位")}};
        #guild_role{post = 60} ->
            {ok, {false, lang:get("已经是会长")}};
        R = #guild_role{name = AppName, post = Post} ->
            case lists:keyfind(60, #guild_role.post, Members) of
                OL = #guild_role{id = Oid} ->
                    NOL = OL#guild_role{post = Post},
                    Members1 = lists:keyreplace(Oid,
                                                #guild_role.id,
                                                Members,
                                                NOL),
                    NewR = R#guild_role{post = 60},
                    NewMb = lists:keyreplace(RoleId,
                                             #guild_role.id,
                                             Members1,
                                             NewR),
                    guild_role:async_info(NewR),
                    guild_role:async_info(NOL),
                    guild:cast(Members, 11110, {1, NewR}),
                    guild:cast(Members, 11110, {1, NOL}),
                    State1 = State#guild{members = NewMb, flag = 1},
                    State2 = add_event(State1, 1, [RoleId, AppName, Post]),
                    NewState = guild_util:update_num(State2),
                    MailInfo = #{items => [], title => lang:get("公会变更"),
                                 content => Msg},
                    mail:send(RoleId, MailInfo),
                    guild:sync_cache(NewState),
                    {ok, {ok, lang:get("设置成功")}, NewState};
                _ -> {ok, {false, "找不到旧会长"}}
            end
    end.

async_dismis(State = #guild{name = GuildName,
                            members = Members, id = Gid}) ->
    Fun = fun (Gr = #guild_role{id = Rid}) ->
                  guild_role:async_expel(Gr, GuildName),
                  guild_role:del_role(Rid),
                  MailInfo = #{items => [], title => lang:get("公会解散"),
                               content =>
                                   notice:format(lang:get("~ts公会会长等管理涉嫌发布违规信息，为保障玩家权益，现解散此公会，请重新加入其他公会。十"
                                                          "分感谢您的支持与配合，祝您游戏愉快。"),
                                                 [{string_2, 2, GuildName}])},
                  mail:send(Rid, MailInfo);
              (_) -> ok
          end,
    [Fun(R) || R <- Members],
    case guild:destory(State) of
        {false, Reason} ->
            logger:error("仙盟 ~ts ~w 解散失败 ~w",
                         [GuildName, Gid, Reason],
                         guild_common,
                         2203),
            ok;
        true -> ok
    end,
    {stop, normal, State#guild{members = []}}.

sync_adm_modify_board(State = #guild{}, Board) ->
    logger:debug("设置公会公告--------", [], guild_common, 2213),
    NewState = case Board of
                   "" ->
                       State#guild{board = guild_common:msg(1),
                                   announcement = guild_common:msg(2), flag = 1,
                                   board_id = {0, "", 0},
                                   announce_id = {0, "", 0}};
                   _ ->
                       State#guild{board = Board, announcement = Board,
                                   flag = 1, board_id = {0, "", 0},
                                   announce_id = {0, "", 0}}
               end,
    guild:sync_cache(NewState),
    {ok, NewState}.

sync_mark_board_lock(State = #guild{}, Flag) ->
    NewState = State#guild{is_lock_board = Flag, flag = 1},
    guild:sync_cache(NewState),
    {ok, NewState}.

get_guild_mail(MailId) ->
    case catch ets:lookup(guild_mail, MailId) of
        [Mail = #mail{}] -> Mail;
        _ -> #mail{}
    end.

