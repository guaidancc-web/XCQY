-file("src/proto/proto_111.erl", 1).

-module(proto_111).

-export([pack/3, unpack/3]).

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

-file("src/proto/proto_111.erl", 14).

-file("inc/protocol.hrl", 1).

-record(module,
        {code :: undefined | pos_integer(),
         type :: undefined | game_server | monitor | tester,
         need_auth = true :: boolean(),
         caller = connector :: connector | object,
         module :: undefined | atom(),
         desc = "" :: string()}).

-record(rpc,
        {code = 0 :: non_neg_integer(),
         disable = false :: boolean(),
         autolog = false :: boolean(),
         autozip = false :: boolean(),
         condition = [] :: [tuple()],
         log_title :: undefined | string(),
         req_desc ::
             undefined |
             string() |
             {string(), [atom()]} |
             {atom(), atom(), tuple()},
         req = [] :: {atom(), [tuple()]} | [tuple()],
         reply_desc ::
             undefined |
             string() |
             {string(), [atom()]} |
             {atom(), atom(), tuple()},
         reply = [] :: {atom(), [tuple()]} | [tuple()],
         parser :: undefined | atom(),
         mod :: undefined | atom(),
         can_cache = true :: boolean()}).

-file("src/proto/proto_111.erl", 15).

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

-file("src/proto/proto_111.erl", 16).

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

-file("src/proto/proto_111.erl", 17).

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

-file("src/proto/proto_111.erl", 18).

-spec pack(srv | cli, non_neg_integer(),
           tuple()) -> {ok, binary()} |
                       {error, {unknown_pack_command, non_neg_integer()}}.

pack(cli, 11100, {}) ->
    {ok, <<2:32/little, 11100:16/little>>};
pack(srv, 11100,
     {#guild{id = {V0_guild_id, V0_platform, V0_zone_id},
             name = V0_name, name_used = V0_name_used, lev = V0_lev,
             totem =
                 #guild_totem{id = V0_id, changeable = V0_changeable,
                              last_changed = V0_last_changed},
             academy_lev = V0_academy_lev,
             exchequer_lev = V0_exchequer_lev,
             store_lev = V0_store_lev, lev_time = V0_lev_time,
             academy_time = V0_academy_time,
             exchequer_time = V0_exchequer_time,
             store_time = V0_store_time, board = V0_board,
             announcement = V0_announcement, assets = V0_assets,
             max_assets = V0_max_assets, upkeep = V0_upkeep,
             leader_name = V0_leader_name,
             leader_id = {V0_rid, V0_r_platform, V0_r_zone_id},
             leader_sex = V0_leader_sex,
             leader_classes = V0_leader_classes,
             leader_lev = V0_leader_lev, mem_num = V0_mem_num,
             max_mem_num = V0_max_mem_num, fresh_num = V0_fresh_num,
             max_fresh_num = V0_max_fresh_num, health = V0_health,
             create_time = V0_create_time,
             formalizing_lev = V0_formalizing_lev,
             element_info = V0_element_info,
             upgrade_element_time = V0_upgrade_element_time,
             limit_mode = V0_limit_mode},
      V0_post}) ->
    D_a_t_a = <<V0_guild_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little,
                (protocol:pack(string, V0_name))/binary,
                (protocol:pack(string, V0_name_used))/binary,
                V0_lev:8/little, V0_id:8/little,
                V0_changeable:32/little, V0_last_changed:32/little,
                V0_academy_lev:8/little, V0_exchequer_lev:8/little,
                V0_store_lev:8/little, V0_lev_time:32/little,
                V0_academy_time:32/little, V0_exchequer_time:32/little,
                V0_store_time:32/little,
                (protocol:pack(string, V0_board))/binary,
                (protocol:pack(string, V0_announcement))/binary,
                V0_assets:32/signed-little, V0_max_assets:32/little,
                V0_upkeep:32/little,
                (protocol:pack(string, V0_leader_name))/binary,
                V0_rid:32/little,
                (protocol:pack(string, V0_r_platform))/binary,
                V0_r_zone_id:16/little, V0_leader_sex:8/little,
                V0_leader_classes:8/little, V0_leader_lev:8/little,
                V0_mem_num:16/little, V0_max_mem_num:16/little,
                V0_fresh_num:16/little, V0_max_fresh_num:16/little,
                V0_health:16/little, V0_create_time:32/little,
                V0_formalizing_lev:8/little,
                (length(V0_element_info)):16/little,
                (list_to_binary([<<V1_build_type:8/little,
                                   V1_lev:16/little, V1_time:32/little>>
                                 || #element_info{build_type = V1_build_type,
                                                  lev = V1_lev, time = V1_time}
                                        <- V0_element_info]))/binary,
                V0_upgrade_element_time:32/little,
                V0_limit_mode:8/little, V0_post:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11100:16/little,
       D_a_t_a/binary>>};
pack(cli, 11101, {}) ->
    {ok, <<2:32/little, 11101:16/little>>};
pack(srv, 11101,
     {V0_members,
      V0_mem_num,
      V0_max_mem_num,
      V0_fresh_num,
      V0_max_fresh_num,
      V0_insist_pray,
      V0_pious_pray,
      V0_grace_pray}) ->
    D_a_t_a = <<(length(V0_members)):16/little,
                (list_to_binary([<<V1_rid:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:16/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_sex:8/little, V1_classes:8/little,
                                   V1_lev:8/little, V1_post:8/little,
                                   V1_enter_time:32/little,
                                   V1_last_login:32/little, V1_status:8/little,
                                   (protocol:pack(string, V1_signature))/binary,
                                   V1_value:32/little, V1_total_value:32/little,
                                   V1_cup:32/little, V1_signed:16/little,
                                   V1_last_signed:32/little, V1_fc:32/little,
                                   V1_num:32/little, V1_remain:32/little,
                                   V1_amount:32/little,
                                   (length(V1_requirement)):16/little,
                                   (list_to_binary([<<V2_requirement_type:8/little,
                                                      (length(V2_requirement_digit)):16/little,
                                                      (list_to_binary([<<V3_digit_key:8/little,
                                                                         V3_digit_value:32/little>>
                                                                       || {V3_digit_key,
                                                                           V3_digit_value}
                                                                              <- V2_requirement_digit]))/binary>>
                                                    || {V2_requirement_type,
                                                        V2_requirement_digit}
                                                           <- V1_requirement]))/binary,
                                   V1_active:32/little, V1_ability:32/little>>
                                 || #guild_role{id =
                                                    {V1_rid,
                                                     V1_platform,
                                                     V1_zone_id},
                                                name = V1_name, sex = V1_sex,
                                                classes = V1_classes,
                                                lev = V1_lev, post = V1_post,
                                                enter_time = V1_enter_time,
                                                last_login = V1_last_login,
                                                status = V1_status,
                                                signature = V1_signature,
                                                value = V1_value,
                                                total_value = V1_total_value,
                                                cup = V1_cup,
                                                signed = V1_signed,
                                                last_signed = V1_last_signed,
                                                fc = V1_fc,
                                                envelope =
                                                    #guild_envelop{num = V1_num,
                                                                   remain =
                                                                       V1_remain,
                                                                   amount =
                                                                       V1_amount},
                                                requirement = V1_requirement,
                                                active = V1_active,
                                                ability = V1_ability}
                                        <- V0_members]))/binary,
                V0_mem_num:16/little, V0_max_mem_num:16/little,
                V0_fresh_num:16/little, V0_max_fresh_num:16/little,
                V0_insist_pray:8/little, V0_pious_pray:8/little,
                V0_grace_pray:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11101:16/little,
       D_a_t_a/binary>>};
pack(cli, 11102, {V0_name}) ->
    D_a_t_a = <<(protocol:pack(string, V0_name))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11102:16/little,
       D_a_t_a/binary>>};
pack(srv, 11102, {V0_guild_list}) ->
    D_a_t_a = <<(length(V0_guild_list)):16/little,
                (list_to_binary([<<V1_guild_id:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:16/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_lev:8/little, V1_id:8/little,
                                   (protocol:pack(string,
                                                  V1_leader_name))/binary,
                                   V1_rid:32/little,
                                   (protocol:pack(string,
                                                  V1_r_platform))/binary,
                                   V1_r_zone_id:16/little,
                                   V1_leader_sex:8/little,
                                   V1_leader_classes:8/little,
                                   V1_leader_lev:8/little, V1_mem_num:16/little,
                                   V1_max_mem_num:16/little,
                                   V1_fresh_num:16/little,
                                   V1_max_fresh_num:16/little,
                                   V1_health:16/little>>
                                 || #guild{id =
                                               {V1_guild_id,
                                                V1_platform,
                                                V1_zone_id},
                                           name = V1_name, lev = V1_lev,
                                           totem = #guild_totem{id = V1_id},
                                           leader_name = V1_leader_name,
                                           leader_id =
                                               {V1_rid,
                                                V1_r_platform,
                                                V1_r_zone_id},
                                           leader_sex = V1_leader_sex,
                                           leader_classes = V1_leader_classes,
                                           leader_lev = V1_leader_lev,
                                           mem_num = V1_mem_num,
                                           max_mem_num = V1_max_mem_num,
                                           fresh_num = V1_fresh_num,
                                           max_fresh_num = V1_max_fresh_num,
                                           health = V1_health}
                                        <- V0_guild_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11102:16/little,
       D_a_t_a/binary>>};
pack(cli, 11103, {V0_name, V0_notice}) ->
    D_a_t_a = <<(protocol:pack(string, V0_name))/binary,
                (protocol:pack(string, V0_notice))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11103:16/little,
       D_a_t_a/binary>>};
pack(srv, 11103, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11103:16/little,
       D_a_t_a/binary>>};
pack(cli, 11104,
     {V0_guild_id,
      V0_platform,
      V0_zone_id,
      V0_tag,
      V0_msg}) ->
    D_a_t_a = <<V0_guild_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little, V0_tag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11104:16/little,
       D_a_t_a/binary>>};
pack(srv, 11104, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11104:16/little,
       D_a_t_a/binary>>};
pack(cli, 11105, {}) ->
    {ok, <<2:32/little, 11105:16/little>>};
pack(srv, 11105, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11105:16/little,
       D_a_t_a/binary>>};
pack(cli, 11106, {}) ->
    {ok, <<2:32/little, 11106:16/little>>};
pack(srv, 11106, {V0_guild_list}) ->
    D_a_t_a = <<(length(V0_guild_list)):16/little,
                (list_to_binary([<<V1_guild_id:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:16/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_lev:8/little, V1_id:8/little,
                                   (protocol:pack(string,
                                                  V1_leader_name))/binary,
                                   V1_rid:32/little,
                                   (protocol:pack(string,
                                                  V1_r_platform))/binary,
                                   V1_r_zone_id:16/little,
                                   V1_leader_sex:8/little,
                                   V1_leader_classes:8/little,
                                   V1_leader_lev:8/little, V1_mem_num:16/little,
                                   V1_max_mem_num:16/little,
                                   V1_fresh_num:16/little,
                                   V1_max_fresh_num:16/little,
                                   (protocol:pack(string, V1_board))/binary,
                                   (protocol:pack(string,
                                                  V1_announcement))/binary,
                                   V1_activity:16/little, V1_health:16/little>>
                                 || #guild{id =
                                               {V1_guild_id,
                                                V1_platform,
                                                V1_zone_id},
                                           name = V1_name, lev = V1_lev,
                                           totem = #guild_totem{id = V1_id},
                                           leader_name = V1_leader_name,
                                           leader_id =
                                               {V1_rid,
                                                V1_r_platform,
                                                V1_r_zone_id},
                                           leader_sex = V1_leader_sex,
                                           leader_classes = V1_leader_classes,
                                           leader_lev = V1_leader_lev,
                                           mem_num = V1_mem_num,
                                           max_mem_num = V1_max_mem_num,
                                           fresh_num = V1_fresh_num,
                                           max_fresh_num = V1_max_fresh_num,
                                           board = V1_board,
                                           announcement = V1_announcement,
                                           activity = V1_activity,
                                           health = V1_health}
                                        <- V0_guild_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11106:16/little,
       D_a_t_a/binary>>};
pack(cli, 11107, {}) ->
    {ok, <<2:32/little, 11107:16/little>>};
pack(srv, 11107, {V0_post}) ->
    D_a_t_a = <<V0_post:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11107:16/little,
       D_a_t_a/binary>>};
pack(cli, 11108,
     {V0_rid, V0_platform, V0_zone_id, V0_post}) ->
    D_a_t_a = <<V0_rid:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little, V0_post:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11108:16/little,
       D_a_t_a/binary>>};
pack(srv, 11108, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11108:16/little,
       D_a_t_a/binary>>};
pack(cli, 11109, {V0_rid, V0_platform, V0_zone_id}) ->
    D_a_t_a = <<V0_rid:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11109:16/little,
       D_a_t_a/binary>>};
pack(srv, 11109, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11109:16/little,
       D_a_t_a/binary>>};
pack(cli, 11110, {}) ->
    {ok, <<2:32/little, 11110:16/little>>};
pack(srv, 11110,
     {V0_flag,
      #guild_role{id = {V0_rid, V0_platform, V0_zone_id},
                  name = V0_name, sex = V0_sex, classes = V0_classes,
                  lev = V0_lev, post = V0_post,
                  enter_time = V0_enter_time, last_login = V0_last_login,
                  status = V0_status, signature = V0_signature,
                  value = V0_value, total_value = V0_total_value,
                  cup = V0_cup, signed = V0_signed,
                  last_signed = V0_last_signed, fc = V0_fc,
                  envelope =
                      #guild_envelop{num = V0_num, remain = V0_remain,
                                     amount = V0_amount},
                  requirement = V0_requirement, active = V0_active,
                  ability = V0_ability}}) ->
    D_a_t_a = <<V0_flag:8/little, V0_rid:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little,
                (protocol:pack(string, V0_name))/binary,
                V0_sex:8/little, V0_classes:8/little, V0_lev:8/little,
                V0_post:8/little, V0_enter_time:32/little,
                V0_last_login:32/little, V0_status:8/little,
                (protocol:pack(string, V0_signature))/binary,
                V0_value:32/little, V0_total_value:32/little,
                V0_cup:32/little, V0_signed:16/little,
                V0_last_signed:32/little, V0_fc:32/little,
                V0_num:32/little, V0_remain:32/little,
                V0_amount:32/little, (length(V0_requirement)):16/little,
                (list_to_binary([<<V1_requirement_type:8/little,
                                   (length(V1_requirement_digit)):16/little,
                                   (list_to_binary([<<V2_digit_key:8/little,
                                                      V2_digit_value:32/little>>
                                                    || {V2_digit_key,
                                                        V2_digit_value}
                                                           <- V1_requirement_digit]))/binary>>
                                 || {V1_requirement_type, V1_requirement_digit}
                                        <- V0_requirement]))/binary,
                V0_active:32/little, V0_ability:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11110:16/little,
       D_a_t_a/binary>>};
pack(cli, 11111, {V0_type, V0_mode}) ->
    D_a_t_a = <<V0_type:8/little, V0_mode:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11111:16/little,
       D_a_t_a/binary>>};
pack(srv, 11111, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11111:16/little,
       D_a_t_a/binary>>};
pack(cli, 11112, {V0_type, V0_mode}) ->
    D_a_t_a = <<V0_type:8/little, V0_mode:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11112:16/little,
       D_a_t_a/binary>>};
pack(srv, 11112, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11112:16/little,
       D_a_t_a/binary>>};
pack(cli, 11113, {}) ->
    {ok, <<2:32/little, 11113:16/little>>};
pack(srv, 11113,
     {#guild{lev = V0_lev, academy_lev = V0_academy_lev,
             exchequer_lev = V0_exchequer_lev,
             store_lev = V0_store_lev,
             formalizing_lev = V0_formalizing_lev,
             lev_time = V0_lev_time, academy_time = V0_academy_time,
             exchequer_time = V0_exchequer_time,
             store_time = V0_store_time, assets = V0_assets,
             element_info = V0_element_info,
             upgrade_element_time = V0_upgrade_element_time,
             limit_mode = V0_limit_mode}}) ->
    D_a_t_a = <<V0_lev:8/little, V0_academy_lev:8/little,
                V0_exchequer_lev:8/little, V0_store_lev:8/little,
                V0_formalizing_lev:8/little, V0_lev_time:32/little,
                V0_academy_time:32/little, V0_exchequer_time:32/little,
                V0_store_time:32/little, V0_assets:32/little,
                (length(V0_element_info)):16/little,
                (list_to_binary([<<V1_build_type:8/little,
                                   V1_lev:16/little, V1_time:32/little>>
                                 || #element_info{build_type = V1_build_type,
                                                  lev = V1_lev, time = V1_time}
                                        <- V0_element_info]))/binary,
                V0_upgrade_element_time:32/little,
                V0_limit_mode:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11113:16/little,
       D_a_t_a/binary>>};
pack(cli, 11114, {V0_type, V0_content}) ->
    D_a_t_a = <<V0_type:8/little,
                (protocol:pack(string, V0_content))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11114:16/little,
       D_a_t_a/binary>>};
pack(srv, 11114,
     {V0_result, V0_msg, V0_type, V0_content}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary,
                V0_type:8/little,
                (protocol:pack(string, V0_content))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11114:16/little,
       D_a_t_a/binary>>};
pack(cli, 11115, {}) ->
    {ok, <<2:32/little, 11115:16/little>>};
pack(srv, 11115, {V0_daily, V0_weekly}) ->
    D_a_t_a = <<V0_daily:8/little, V0_weekly:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11115:16/little,
       D_a_t_a/binary>>};
pack(cli, 11116, {V0_type}) ->
    D_a_t_a = <<V0_type:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11116:16/little,
       D_a_t_a/binary>>};
pack(srv, 11116, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11116:16/little,
       D_a_t_a/binary>>};
pack(cli, 11117, {V0_type}) ->
    D_a_t_a = <<V0_type:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11117:16/little,
       D_a_t_a/binary>>};
pack(srv, 11117, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11117:16/little,
       D_a_t_a/binary>>};
pack(cli, 11118, {}) ->
    {ok, <<2:32/little, 11118:16/little>>};
pack(srv, 11118, {V0_store_list, V0_normal_goods}) ->
    D_a_t_a = <<(length(V0_store_list)):16/little,
                (list_to_binary([<<V1_id:16/little,
                                   V1_base_id:32/little, V1_num:16/little,
                                   (length(V1_price)):16/little,
                                   (list_to_binary([<<V2_name:32/little,
                                                      V2_val:32/little>>
                                                    || {V2_name, V2_val}
                                                           <- V1_price]))/binary,
                                   V1_limit:16/little, V1_role_num:16/little>>
                                 || {V1_id,
                                     V1_base_id,
                                     V1_num,
                                     V1_price,
                                     V1_limit,
                                     V1_role_num}
                                        <- V0_store_list]))/binary,
                (length(V0_normal_goods)):16/little,
                (list_to_binary([<<V1_id:16/little,
                                   V1_base_id:32/little,
                                   (length(V1_price)):16/little,
                                   (list_to_binary([<<V2_name:32/little,
                                                      V2_val:32/little>>
                                                    || {V2_name, V2_val}
                                                           <- V1_price]))/binary,
                                   V1_limit:16/little, V1_role_num:16/little>>
                                 || {V1_id,
                                     V1_base_id,
                                     V1_price,
                                     V1_limit,
                                     V1_role_num}
                                        <- V0_normal_goods]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11118:16/little,
       D_a_t_a/binary>>};
pack(cli, 11119, {V0_id, V0_num}) ->
    D_a_t_a = <<V0_id:16/little, V0_num:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11119:16/little,
       D_a_t_a/binary>>};
pack(srv, 11119, {V0_result, V0_msg, V0_flag}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary,
                V0_flag:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11119:16/little,
       D_a_t_a/binary>>};
pack(cli, 11120, {}) ->
    {ok, <<2:32/little, 11120:16/little>>};
pack(srv, 11120, {V0_time}) ->
    D_a_t_a = <<V0_time:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11120:16/little,
       D_a_t_a/binary>>};
pack(cli, 11121, {V0_rid, V0_platform, V0_zone_id}) ->
    D_a_t_a = <<V0_rid:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11121:16/little,
       D_a_t_a/binary>>};
pack(srv, 11121, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11121:16/little,
       D_a_t_a/binary>>};
pack(cli, 11122, {V0_flag, V0_type, V0_lev}) ->
    D_a_t_a = <<V0_flag:8/little, V0_type:8/little,
                V0_lev:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11122:16/little,
       D_a_t_a/binary>>};
pack(srv, 11122, {V0_flag, V0_type, V0_lev}) ->
    D_a_t_a = <<V0_flag:8/little, V0_type:8/little,
                V0_lev:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11122:16/little,
       D_a_t_a/binary>>};
pack(cli, 11123, {}) ->
    {ok, <<2:32/little, 11123:16/little>>};
pack(srv, 11123, {V0_apply_list}) ->
    D_a_t_a = <<(length(V0_apply_list)):16/little,
                (list_to_binary([<<V1_rid:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:16/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_lev:8/little, V1_classes:8/little,
                                   V1_sex:8/little, V1_time:32/little,
                                   V1_tag:8/little,
                                   (protocol:pack(string, V1_msg))/binary>>
                                 || #guild_apply{id =
                                                     {V1_rid,
                                                      V1_platform,
                                                      V1_zone_id},
                                                 name = V1_name, lev = V1_lev,
                                                 classes = V1_classes,
                                                 sex = V1_sex, time = V1_time,
                                                 tag = V1_tag, msg = V1_msg}
                                        <- V0_apply_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11123:16/little,
       D_a_t_a/binary>>};
pack(cli, 11124,
     {V0_rid, V0_platform, V0_zone_id, V0_type}) ->
    D_a_t_a = <<V0_rid:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little, V0_type:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11124:16/little,
       D_a_t_a/binary>>};
pack(srv, 11124,
     {V0_result,
      V0_msg,
      V0_flag,
      {V0_rid, V0_platform, V0_zone_id}}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary,
                V0_flag:8/little, V0_rid:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11124:16/little,
       D_a_t_a/binary>>};
pack(cli, 11125,
     {V0_rid, V0_platform, V0_zone_id, V0_signature}) ->
    D_a_t_a = <<V0_rid:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little,
                (protocol:pack(string, V0_signature))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11125:16/little,
       D_a_t_a/binary>>};
pack(srv, 11125,
     {V0_result,
      V0_msg,
      {V0_rid, V0_platform, V0_zone_id}}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary,
                V0_rid:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11125:16/little,
       D_a_t_a/binary>>};
pack(cli, 11126, {}) ->
    {ok, <<2:32/little, 11126:16/little>>};
pack(srv, 11126, {V0_event_list}) ->
    D_a_t_a = <<(length(V0_event_list)):16/little,
                (list_to_binary([<<V1_time:32/little, V1_type:8/little,
                                   (protocol:pack(string, V1_msg))/binary>>
                                 || {V1_time, V1_type, V1_msg}
                                        <- V0_event_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11126:16/little,
       D_a_t_a/binary>>};
pack(cli, 11127, {}) ->
    {ok, <<2:32/little, 11127:16/little>>};
pack(srv, 11127, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11127:16/little,
       D_a_t_a/binary>>};
pack(cli, 11128, {}) ->
    {ok, <<2:32/little, 11128:16/little>>};
pack(srv, 11128, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11128:16/little,
       D_a_t_a/binary>>};
pack(cli, 11129, {}) ->
    {ok, <<2:32/little, 11129:16/little>>};
pack(srv, 11129, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11129:16/little,
       D_a_t_a/binary>>};
pack(cli, 11130, {V0_num}) ->
    D_a_t_a = <<V0_num:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11130:16/little,
       D_a_t_a/binary>>};
pack(srv, 11130, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11130:16/little,
       D_a_t_a/binary>>};
pack(cli, 11131,
     {V0_title, V0_num, V0_type, V0_source}) ->
    D_a_t_a = <<(protocol:pack(string, V0_title))/binary,
                V0_num:16/little, V0_type:8/little,
                V0_source:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11131:16/little,
       D_a_t_a/binary>>};
pack(srv, 11131,
     {V0_title,
      V0_id,
      V0_platform,
      V0_zone_id,
      V0_name,
      V0_sex,
      V0_classes,
      V0_lev}) ->
    D_a_t_a = <<(protocol:pack(string, V0_title))/binary,
                V0_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little,
                (protocol:pack(string, V0_name))/binary,
                V0_sex:8/little, V0_classes:8/little, V0_lev:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11131:16/little,
       D_a_t_a/binary>>};
pack(cli, 11132, {V0_id, V0_platform, V0_zone_id}) ->
    D_a_t_a = <<V0_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11132:16/little,
       D_a_t_a/binary>>};
pack(srv, 11132,
     {{V0_rid, V0_platform, V0_zone_id},
      V0_name,
      V0_sex,
      V0_classes,
      V0_lev,
      #guild_envelop{title = V0_title, amount = V0_amount,
                     remain = V0_remain, num = V0_num, total = V0_total,
                     time = V0_time, log = V0_log}}) ->
    D_a_t_a = <<V0_rid:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little,
                (protocol:pack(string, V0_name))/binary,
                V0_sex:8/little, V0_classes:8/little, V0_lev:8/little,
                (protocol:pack(string, V0_title))/binary,
                V0_amount:32/little, V0_remain:32/little,
                V0_num:32/signed-little, V0_total:32/signed-little,
                V0_time:32/little, (length(V0_log)):16/little,
                (list_to_binary([<<V1_rid:32/little,
                                   (protocol:pack(string,
                                                  V1_r_platform))/binary,
                                   V1_r_zone_id:16/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_val:32/little, V1_sex:8/little,
                                   V1_classes:8/little, V1_lev:8/little,
                                   V1_time:32/little>>
                                 || {{V1_rid, V1_r_platform, V1_r_zone_id},
                                     V1_name,
                                     V1_val,
                                     V1_sex,
                                     V1_classes,
                                     V1_lev,
                                     V1_time}
                                        <- V0_log]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11132:16/little,
       D_a_t_a/binary>>};
pack(cli, 11133, {V0_id, V0_platform, V0_zone_id}) ->
    D_a_t_a = <<V0_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11133:16/little,
       D_a_t_a/binary>>};
pack(srv, 11133,
     {V0_s_id,
      V0_s_platform,
      V0_s_zone_id,
      V0_s_name,
      V0_t_id,
      V0_t_platform,
      V0_t_zone_id,
      V0_t_name}) ->
    D_a_t_a = <<V0_s_id:32/little,
                (protocol:pack(string, V0_s_platform))/binary,
                V0_s_zone_id:16/little,
                (protocol:pack(string, V0_s_name))/binary,
                V0_t_id:32/little,
                (protocol:pack(string, V0_t_platform))/binary,
                V0_t_zone_id:16/little,
                (protocol:pack(string, V0_t_name))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11133:16/little,
       D_a_t_a/binary>>};
pack(cli, 11134, {}) ->
    {ok, <<2:32/little, 11134:16/little>>};
pack(srv, 11134,
     {#guild_boss{name = V0_name, lev = V0_lev,
                  step = V0_step, exp = V0_exp, called = V0_called,
                  last_renamed = V0_last_renamed, log = V0_log}}) ->
    D_a_t_a = <<(protocol:pack(string, V0_name))/binary,
                V0_lev:8/little, V0_step:8/little,
                V0_exp:32/signed-little, V0_called:8/little,
                V0_last_renamed:32/little, (length(V0_log)):16/little,
                (list_to_binary([<<V1_rid:32/little,
                                   (protocol:pack(string,
                                                  V1_r_platform))/binary,
                                   V1_r_zone_id:16/little,
                                   (protocol:pack(string, V1_rname))/binary,
                                   V1_type:8/little, V1_exp:32/little>>
                                 || {{V1_rid, V1_r_platform, V1_r_zone_id},
                                     V1_rname,
                                     V1_type,
                                     V1_exp}
                                        <- V0_log]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11134:16/little,
       D_a_t_a/binary>>};
pack(cli, 11135, {}) ->
    {ok, <<2:32/little, 11135:16/little>>};
pack(srv, 11135, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11135:16/little,
       D_a_t_a/binary>>};
pack(cli, 11136, {}) ->
    {ok, <<2:32/little, 11136:16/little>>};
pack(srv, 11136, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11136:16/little,
       D_a_t_a/binary>>};
pack(cli, 11137, {}) ->
    {ok, <<2:32/little, 11137:16/little>>};
pack(srv, 11137, {V0_mercenarys}) ->
    D_a_t_a = <<(length(V0_mercenarys)):16/little,
                (list_to_binary([<<V1_rid:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:16/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_lev:32/little, V1_recruited:8/little,
                                   V1_dispatched:32/little,
                                   V1_base_id:32/little>>
                                 || #guild_mercenary{id =
                                                         {V1_rid,
                                                          V1_platform,
                                                          V1_zone_id},
                                                     name = V1_name,
                                                     lev = V1_lev,
                                                     recruited = V1_recruited,
                                                     dispatched = V1_dispatched,
                                                     guard =
                                                         #guard{base_id =
                                                                    V1_base_id}}
                                        <- V0_mercenarys]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11137:16/little,
       D_a_t_a/binary>>};
pack(cli, 11138, {V0_base_id}) ->
    D_a_t_a = <<V0_base_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11138:16/little,
       D_a_t_a/binary>>};
pack(srv, 11138, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11138:16/little,
       D_a_t_a/binary>>};
pack(cli, 11139, {V0_base_id}) ->
    D_a_t_a = <<V0_base_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11139:16/little,
       D_a_t_a/binary>>};
pack(srv, 11139, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11139:16/little,
       D_a_t_a/binary>>};
pack(cli, 11140, {V0_rid, V0_platform, V0_zone_id}) ->
    D_a_t_a = <<V0_rid:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11140:16/little,
       D_a_t_a/binary>>};
pack(srv, 11140, {V0_looks}) ->
    D_a_t_a = <<(length(V0_looks)):16/little,
                (list_to_binary([<<V1_looks_type:32/little,
                                   V1_looks_mode:32/little,
                                   V1_looks_val:32/little,
                                   (protocol:pack(string,
                                                  V1_looks_str))/binary>>
                                 || {V1_looks_type,
                                     V1_looks_mode,
                                     V1_looks_val,
                                     V1_looks_str}
                                        <- V0_looks]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11140:16/little,
       D_a_t_a/binary>>};
pack(cli, 11141, {}) ->
    {ok, <<2:32/little, 11141:16/little>>};
pack(srv, 11141, {V0_mercenarys}) ->
    D_a_t_a = <<(length(V0_mercenarys)):16/little,
                (list_to_binary([<<V1_rid:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:16/little, V1_lev:32/little,
                                   V1_recruited:8/little,
                                   V1_dispatched:32/little, V1_score:32/little,
                                   V1_base_id:32/little>>
                                 || #guild_mercenary{id =
                                                         {V1_rid,
                                                          V1_platform,
                                                          V1_zone_id},
                                                     lev = V1_lev,
                                                     recruited = V1_recruited,
                                                     dispatched = V1_dispatched,
                                                     score = V1_score,
                                                     guard =
                                                         #guard{base_id =
                                                                    V1_base_id}}
                                        <- V0_mercenarys]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11141:16/little,
       D_a_t_a/binary>>};
pack(cli, 11142,
     {V0_rid, V0_platform, V0_zone_id, V0_base_id}) ->
    D_a_t_a = <<V0_rid:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little, V0_base_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11142:16/little,
       D_a_t_a/binary>>};
pack(srv, 11142,
     {#guild_mercenary{id =
                           {V0_rid, V0_platform, V0_zone_id},
                       name = V0_name, lev = V0_lev, recruited = V0_recruited,
                       dispatched = V0_dispatched,
                       guard =
                           #guard{base_id = V0_base_id,
                                  attr =
                                      #attr{hp_max = V0_hp_max,
                                            mp_max = V0_mp_max,
                                            atk_speed = V0_atk_speed,
                                            phy_dmg = V0_phy_dmg,
                                            magic_dmg = V0_magic_dmg,
                                            phy_def = V0_phy_def,
                                            magic_def = V0_magic_def},
                                  eqm = V0_eqm, score = V0_score}}}) ->
    D_a_t_a = <<V0_rid:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little,
                (protocol:pack(string, V0_name))/binary,
                V0_lev:32/little, V0_recruited:8/little,
                V0_dispatched:32/little, V0_base_id:32/little,
                V0_hp_max:32/little, V0_mp_max:32/little,
                V0_atk_speed:16/little, V0_phy_dmg:32/little,
                V0_magic_dmg:32/little, V0_phy_def:32/little,
                V0_magic_def:32/little, (length(V0_eqm)):16/little,
                (list_to_binary([<<V1_base_id:32/little,
                                   (length(V1_eqm_attrs)):16/little,
                                   (list_to_binary([<<V2_type:16/little,
                                                      V2_name:32/little,
                                                      V2_val:32/signed-little>>
                                                    || #attr_base{type =
                                                                      V2_type,
                                                                  name =
                                                                      V2_name,
                                                                  val = V2_val}
                                                           <- V1_eqm_attrs]))/binary>>
                                 || #guard_eqm{base_id = V1_base_id,
                                               eqm_attrs = V1_eqm_attrs}
                                        <- V0_eqm]))/binary,
                V0_score:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11142:16/little,
       D_a_t_a/binary>>};
pack(cli, 11143, {V0_name}) ->
    D_a_t_a = <<(protocol:pack(string, V0_name))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11143:16/little,
       D_a_t_a/binary>>};
pack(srv, 11143, {V0_result, V0_msg, V0_name}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary,
                (protocol:pack(string, V0_name))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11143:16/little,
       D_a_t_a/binary>>};
pack(cli, 11144, {V0_totem}) ->
    D_a_t_a = <<V0_totem:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11144:16/little,
       D_a_t_a/binary>>};
pack(srv, 11144, {V0_result, V0_msg, V0_totem}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary,
                V0_totem:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11144:16/little,
       D_a_t_a/binary>>};
pack(cli, 11145, {}) ->
    {ok, <<2:32/little, 11145:16/little>>};
pack(srv, 11145, {V0_result, V0_msg, V0_changeable}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary,
                V0_changeable:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11145:16/little,
       D_a_t_a/binary>>};
pack(cli, 11146, {}) ->
    {ok, <<2:32/little, 11146:16/little>>};
pack(srv, 11146, {V0_result, V0_timeout}) ->
    D_a_t_a = <<V0_result:8/little, V0_timeout:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11146:16/little,
       D_a_t_a/binary>>};
pack(cli, 11147, {}) ->
    {ok, <<2:32/little, 11147:16/little>>};
pack(srv, 11147,
     {#guild_question{id = V0_id, asked = V0_asked,
                      answer = V0_answer, asked_num = V0_asked_num,
                      answers = V0_answers},
      V0_cheat_off,
      V0_cheat_num,
      V0_today_right,
      V0_today_max}) ->
    D_a_t_a = <<V0_id:32/little, V0_asked:32/little,
                V0_answer:8/little, V0_asked_num:16/little,
                (length(V0_answers)):16/little,
                (list_to_binary([<<V1_rid:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:16/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_option:8/little, V1_result:8/little,
                                   V1_answered:32/little>>
                                 || #guild_question_answer{id =
                                                               {V1_rid,
                                                                V1_platform,
                                                                V1_zone_id},
                                                           name = V1_name,
                                                           option = V1_option,
                                                           result = V1_result,
                                                           answered =
                                                               V1_answered}
                                        <- V0_answers]))/binary,
                V0_cheat_off:8/little, V0_cheat_num:16/little,
                V0_today_right:16/little, V0_today_max:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11147:16/little,
       D_a_t_a/binary>>};
pack(cli, 11148, {V0_option}) ->
    D_a_t_a = <<V0_option:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11148:16/little,
       D_a_t_a/binary>>};
pack(srv, 11148, {V0_result, V0_msg, V0_option}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary,
                V0_option:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11148:16/little,
       D_a_t_a/binary>>};
pack(cli, 11149, {}) ->
    {ok, <<2:32/little, 11149:16/little>>};
pack(srv, 11149, {V0_answers}) ->
    D_a_t_a = <<(length(V0_answers)):16/little,
                (list_to_binary([<<V1_rid:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:16/little, V1_sex:8/little,
                                   V1_classes:8/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   (protocol:pack(string,
                                                  V1_guild_name))/binary,
                                   V1_totem_id:32/little, V1_score:32/little>>
                                 || #guild_question_answer{id =
                                                               {V1_rid,
                                                                V1_platform,
                                                                V1_zone_id},
                                                           sex = V1_sex,
                                                           classes = V1_classes,
                                                           name = V1_name,
                                                           guild_name =
                                                               V1_guild_name,
                                                           totem_id =
                                                               V1_totem_id,
                                                           score = V1_score}
                                        <- V0_answers]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11149:16/little,
       D_a_t_a/binary>>};
pack(cli, 11150, {}) ->
    {ok, <<2:32/little, 11150:16/little>>};
pack(srv, 11150, {V0_option}) ->
    D_a_t_a = <<V0_option:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11150:16/little,
       D_a_t_a/binary>>};
pack(cli, 11151, {}) ->
    {ok, <<2:32/little, 11151:16/little>>};
pack(srv, 11151,
     {#guild_question_answer{id =
                                 {V0_rid, V0_platform, V0_zone_id},
                             name = V0_name, option = V0_option,
                             result = V0_result, answered = V0_answered}}) ->
    D_a_t_a = <<V0_rid:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little,
                (protocol:pack(string, V0_name))/binary,
                V0_option:8/little, V0_result:8/little,
                V0_answered:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11151:16/little,
       D_a_t_a/binary>>};
pack(cli, 11152, {V0_rid, V0_platform, V0_zone_id}) ->
    D_a_t_a = <<V0_rid:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11152:16/little,
       D_a_t_a/binary>>};
pack(srv, 11152, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11152:16/little,
       D_a_t_a/binary>>};
pack(cli, 11153, {}) ->
    {ok, <<2:32/little, 11153:16/little>>};
pack(srv, 11153, {V0_exp}) ->
    D_a_t_a = <<V0_exp:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11153:16/little,
       D_a_t_a/binary>>};
pack(cli, 11154, {}) ->
    {ok, <<2:32/little, 11154:16/little>>};
pack(srv, 11154, {V0_guild_name}) ->
    D_a_t_a = <<(protocol:pack(string,
                               V0_guild_name))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11154:16/little,
       D_a_t_a/binary>>};
pack(cli, 11155, {}) ->
    {ok, <<2:32/little, 11155:16/little>>};
pack(srv, 11155,
     {V0_my_score,
      V0_my_rank,
      #guild_question_answer{id =
                                 {V0_rid, V0_platform, V0_zone_id},
                             sex = V0_sex, classes = V0_classes, name = V0_name,
                             guild_name = V0_guild_name, totem_id = V0_totem_id,
                             score = V0_score}}) ->
    D_a_t_a = <<V0_my_score:32/little, V0_my_rank:32/little,
                V0_rid:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little, V0_sex:8/little,
                V0_classes:8/little,
                (protocol:pack(string, V0_name))/binary,
                (protocol:pack(string, V0_guild_name))/binary,
                V0_totem_id:32/little, V0_score:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11155:16/little,
       D_a_t_a/binary>>};
pack(cli, 11156, {V0_battle_id, V0_id}) ->
    D_a_t_a = <<V0_battle_id:32/little, V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11156:16/little,
       D_a_t_a/binary>>};
pack(srv, 11156, {V0_battle_id, V0_id, V0_time}) ->
    D_a_t_a = <<V0_battle_id:32/little, V0_id:32/little,
                V0_time:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11156:16/little,
       D_a_t_a/binary>>};
pack(cli, 11157, {}) ->
    {ok, <<2:32/little, 11157:16/little>>};
pack(srv, 11157, {V0_usurpers}) ->
    D_a_t_a = <<(length(V0_usurpers)):16/little,
                (list_to_binary([<<V1_rid:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:16/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_sex:8/little, V1_classes:8/little,
                                   V1_ctime:32/little>>
                                 || #guild_usurper{id =
                                                       {V1_rid,
                                                        V1_platform,
                                                        V1_zone_id},
                                                   name = V1_name, sex = V1_sex,
                                                   classes = V1_classes,
                                                   ctime = V1_ctime}
                                        <- V0_usurpers]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11157:16/little,
       D_a_t_a/binary>>};
pack(cli, 11158, {}) ->
    {ok, <<2:32/little, 11158:16/little>>};
pack(srv, 11158, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11158:16/little,
       D_a_t_a/binary>>};
pack(cli, 11159, {V0_rid, V0_platform, V0_zone_id}) ->
    D_a_t_a = <<V0_rid:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11159:16/little,
       D_a_t_a/binary>>};
pack(srv, 11159, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11159:16/little,
       D_a_t_a/binary>>};
pack(cli, 11160, {}) ->
    {ok, <<2:32/little, 11160:16/little>>};
pack(srv, 11160, {}) ->
    {ok, <<2:32/little, 11160:16/little>>};
pack(cli, 11161, {}) ->
    {ok, <<2:32/little, 11161:16/little>>};
pack(srv, 11161, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11161:16/little,
       D_a_t_a/binary>>};
pack(cli, 11162, {V0_id, V0_num}) ->
    D_a_t_a = <<V0_id:16/little, V0_num:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11162:16/little,
       D_a_t_a/binary>>};
pack(srv, 11162, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11162:16/little,
       D_a_t_a/binary>>};
pack(cli, 11163, {}) ->
    {ok, <<2:32/little, 11163:16/little>>};
pack(srv, 11163, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11163:16/little,
       D_a_t_a/binary>>};
pack(cli, 11164, {}) ->
    {ok, <<2:32/little, 11164:16/little>>};
pack(srv, 11164, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11164:16/little,
       D_a_t_a/binary>>};
pack(cli, 11165, {V0_x, V0_y}) ->
    D_a_t_a = <<V0_x:32/little, V0_y:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11165:16/little,
       D_a_t_a/binary>>};
pack(srv, 11165, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11165:16/little,
       D_a_t_a/binary>>};
pack(cli, 11166, {V0_battle_id, V0_id}) ->
    D_a_t_a = <<V0_battle_id:32/little, V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11166:16/little,
       D_a_t_a/binary>>};
pack(srv, 11166,
     {#guild_plant{owner_rid =
                       {V0_owner_id, V0_owner_platform, V0_owner_zone_id},
                   owner_name = V0_owner_name, sowed = V0_sowed,
                   unit_base_id = V0_unit_base_id,
                   unit_id = {V0_battle_id, V0_uid},
                   irrigations = V0_irrigations}}) ->
    D_a_t_a = <<V0_owner_id:32/little,
                (protocol:pack(string, V0_owner_platform))/binary,
                V0_owner_zone_id:16/little,
                (protocol:pack(string, V0_owner_name))/binary,
                V0_sowed:32/little, V0_unit_base_id:32/little,
                V0_battle_id:32/little, V0_uid:32/little,
                (length(V0_irrigations)):16/little,
                (list_to_binary([<<V1_rid:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:16/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_sex:8/little, V1_classes:8/little,
                                   V1_ctime:32/little>>
                                 || #guild_plant_irrigator{id =
                                                               {V1_rid,
                                                                V1_platform,
                                                                V1_zone_id},
                                                           name = V1_name,
                                                           sex = V1_sex,
                                                           classes = V1_classes,
                                                           ctime = V1_ctime}
                                        <- V0_irrigations]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11166:16/little,
       D_a_t_a/binary>>};
pack(cli, 11167, {V0_battle_id, V0_id}) ->
    D_a_t_a = <<V0_battle_id:32/little, V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11167:16/little,
       D_a_t_a/binary>>};
pack(srv, 11167, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11167:16/little,
       D_a_t_a/binary>>};
pack(cli, 11168, {V0_title, V0_content}) ->
    D_a_t_a = <<(protocol:pack(string, V0_title))/binary,
                (protocol:pack(string, V0_content))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11168:16/little,
       D_a_t_a/binary>>};
pack(srv, 11168, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11168:16/little,
       D_a_t_a/binary>>};
pack(cli, 11169, {}) ->
    {ok, <<2:32/little, 11169:16/little>>};
pack(srv, 11169, {V0_battle_id, V0_id}) ->
    D_a_t_a = <<V0_battle_id:32/little, V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11169:16/little,
       D_a_t_a/binary>>};
pack(cli, 11170, {}) ->
    {ok, <<2:32/little, 11170:16/little>>};
pack(srv, 11170, {V0_applys}) ->
    D_a_t_a = <<(length(V0_applys)):16/little,
                (list_to_binary([<<V1_g_id:32/little,
                                   (protocol:pack(string,
                                                  V1_g_platform))/binary,
                                   V1_g_zone_id:16/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_r_id:32/little,
                                   (protocol:pack(string,
                                                  V1_r_platform))/binary,
                                   V1_r_zone_id:16/little,
                                   (protocol:pack(string,
                                                  V1_leader_name))/binary,
                                   V1_ctime:32/little>>
                                 || #guild_union_apply{id =
                                                           {V1_g_id,
                                                            V1_g_platform,
                                                            V1_g_zone_id},
                                                       name = V1_name,
                                                       leader_id =
                                                           {V1_r_id,
                                                            V1_r_platform,
                                                            V1_r_zone_id},
                                                       leader_name =
                                                           V1_leader_name,
                                                       ctime = V1_ctime}
                                        <- V0_applys]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11170:16/little,
       D_a_t_a/binary>>};
pack(cli, 11171, {}) ->
    {ok, <<2:32/little, 11171:16/little>>};
pack(srv, 11171, {V0_applyed}) ->
    D_a_t_a = <<(length(V0_applyed)):16/little,
                (list_to_binary([<<V1_a_id:32/little,
                                   (protocol:pack(string,
                                                  V1_a_platform))/binary,
                                   V1_a_zone_id:16/little>>
                                 || {{V1_a_id, V1_a_platform, V1_a_zone_id}}
                                        <- V0_applyed]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11171:16/little,
       D_a_t_a/binary>>};
pack(cli, 11172, {V0_id, V0_platform, V0_zone_id}) ->
    D_a_t_a = <<V0_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11172:16/little,
       D_a_t_a/binary>>};
pack(srv, 11172, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11172:16/little,
       D_a_t_a/binary>>};
pack(cli, 11173,
     {V0_id, V0_platform, V0_zone_id, V0_decision}) ->
    D_a_t_a = <<V0_id:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little, V0_decision:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11173:16/little,
       D_a_t_a/binary>>};
pack(srv, 11173, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11173:16/little,
       D_a_t_a/binary>>};
pack(cli, 11174, {V0_type}) ->
    D_a_t_a = <<V0_type:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11174:16/little,
       D_a_t_a/binary>>};
pack(srv, 11174, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11174:16/little,
       D_a_t_a/binary>>};
pack(cli, 11175, {}) ->
    {ok, <<2:32/little, 11175:16/little>>};
pack(srv, 11175, {V0_remain}) ->
    D_a_t_a = <<V0_remain:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11175:16/little,
       D_a_t_a/binary>>};
pack(cli, 11176, {}) ->
    {ok, <<2:32/little, 11176:16/little>>};
pack(srv, 11176,
     {#guild_union_apply{id =
                             {V0_g_id, V0_g_platform, V0_g_zone_id},
                         name = V0_name,
                         leader_id = {V0_r_id, V0_r_platform, V0_r_zone_id},
                         leader_name = V0_leader_name, ctime = V0_ctime}}) ->
    D_a_t_a = <<V0_g_id:32/little,
                (protocol:pack(string, V0_g_platform))/binary,
                V0_g_zone_id:16/little,
                (protocol:pack(string, V0_name))/binary,
                V0_r_id:32/little,
                (protocol:pack(string, V0_r_platform))/binary,
                V0_r_zone_id:16/little,
                (protocol:pack(string, V0_leader_name))/binary,
                V0_ctime:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11176:16/little,
       D_a_t_a/binary>>};
pack(cli, 11177, {}) ->
    {ok, <<2:32/little, 11177:16/little>>};
pack(srv, 11177,
     {#guild_treasure{can_open = V0_can_open,
                      setting_chance = V0_setting_chance,
                      setting_time = V0_setting_time},
      V0_is_win}) ->
    D_a_t_a = <<V0_can_open:8/little,
                V0_setting_chance:8/little, V0_setting_time:32/little,
                V0_is_win:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11177:16/little,
       D_a_t_a/binary>>};
pack(cli, 11178, {V0_time}) ->
    D_a_t_a = <<V0_time:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11178:16/little,
       D_a_t_a/binary>>};
pack(srv, 11178, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11178:16/little,
       D_a_t_a/binary>>};
pack(cli, 11179, {}) ->
    {ok, <<2:32/little, 11179:16/little>>};
pack(srv, 11179, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11179:16/little,
       D_a_t_a/binary>>};
pack(cli, 11180, {}) ->
    {ok, <<2:32/little, 11180:16/little>>};
pack(srv, 11180,
     {#guild_loot{items = V0_items, allocated = V0_allocated,
                  log = V0_log}}) ->
    D_a_t_a = <<(length(V0_items)):16/little,
                (list_to_binary([<<V1_base_id:32/little,
                                   V1_num:16/little>>
                                 || {V1_base_id, V1_num} <- V0_items]))/binary,
                (length(V0_allocated)):16/little,
                (list_to_binary([<<V1_rid:32/little,
                                   (protocol:pack(string,
                                                  V1_r_platform))/binary,
                                   V1_r_zone_id:16/little, V1_base_id:16/little,
                                   V1_num:16/little, V1_time:32/little>>
                                 || {{{V1_rid, V1_r_platform, V1_r_zone_id},
                                      V1_base_id},
                                     V1_num,
                                     V1_time}
                                        <- V0_allocated]))/binary,
                (length(V0_log)):16/little,
                (list_to_binary([<<(protocol:pack(string,
                                                  V1_msg))/binary,
                                   V1_base_id:16/little, V1_ctime:32/little>>
                                 || {V1_msg, V1_base_id, V1_ctime}
                                        <- V0_log]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11180:16/little,
       D_a_t_a/binary>>};
pack(cli, 11181, {V0_alloc}) ->
    D_a_t_a = <<(length(V0_alloc)):16/little,
                (list_to_binary([<<V1_rid:32/little,
                                   (protocol:pack(string,
                                                  V1_r_platform))/binary,
                                   V1_r_zone_id:16/little, V1_base_id:32/little,
                                   V1_num:16/little>>
                                 || {V1_rid,
                                     V1_r_platform,
                                     V1_r_zone_id,
                                     V1_base_id,
                                     V1_num}
                                        <- V0_alloc]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11181:16/little,
       D_a_t_a/binary>>};
pack(srv, 11181, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11181:16/little,
       D_a_t_a/binary>>};
pack(cli, 11182, {V0_rid, V0_platform, V0_zone_id}) ->
    D_a_t_a = <<V0_rid:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11182:16/little,
       D_a_t_a/binary>>};
pack(srv, 11182, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11182:16/little,
       D_a_t_a/binary>>};
pack(cli, 11183,
     {V0_rid, V0_platform, V0_zone_id, V0_type}) ->
    D_a_t_a = <<V0_rid:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little, V0_type:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11183:16/little,
       D_a_t_a/binary>>};
pack(srv, 11183, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11183:16/little,
       D_a_t_a/binary>>};
pack(cli, 11184, {}) ->
    {ok, <<2:32/little, 11184:16/little>>};
pack(srv, 11184, {V0_invitations}) ->
    D_a_t_a = <<(length(V0_invitations)):16/little,
                (list_to_binary([<<V1_rid:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:16/little,
                                   (protocol:pack(string, V1_name))/binary,
                                   V1_lev:8/little, V1_classes:8/little,
                                   V1_sex:8/little, V1_ctime:32/little,
                                   V1_gid:32/little,
                                   (protocol:pack(string,
                                                  V1_g_platform))/binary,
                                   V1_g_zone_id:16/little,
                                   (protocol:pack(string,
                                                  V1_guild_name))/binary>>
                                 || #guild_invitation{id =
                                                          {V1_rid,
                                                           V1_platform,
                                                           V1_zone_id},
                                                      name = V1_name,
                                                      lev = V1_lev,
                                                      classes = V1_classes,
                                                      sex = V1_sex,
                                                      ctime = V1_ctime,
                                                      guild_id =
                                                          {V1_gid,
                                                           V1_g_platform,
                                                           V1_g_zone_id},
                                                      guild_name =
                                                          V1_guild_name}
                                        <- V0_invitations]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11184:16/little,
       D_a_t_a/binary>>};
pack(cli, 11185, {}) ->
    {ok, <<2:32/little, 11185:16/little>>};
pack(srv, 11185,
     {#guild_invitation{id =
                            {V0_rid, V0_platform, V0_zone_id},
                        name = V0_name, lev = V0_lev, classes = V0_classes,
                        sex = V0_sex, ctime = V0_ctime,
                        guild_id = {V0_gid, V0_g_platform, V0_g_zone_id},
                        guild_name = V0_guild_name}}) ->
    D_a_t_a = <<V0_rid:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:16/little,
                (protocol:pack(string, V0_name))/binary,
                V0_lev:8/little, V0_classes:8/little, V0_sex:8/little,
                V0_ctime:32/little, V0_gid:32/little,
                (protocol:pack(string, V0_g_platform))/binary,
                V0_g_zone_id:16/little,
                (protocol:pack(string, V0_guild_name))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11185:16/little,
       D_a_t_a/binary>>};
pack(cli, 11186, {V0_lev}) ->
    D_a_t_a = <<V0_lev:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11186:16/little,
       D_a_t_a/binary>>};
pack(srv, 11186, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11186:16/little,
       D_a_t_a/binary>>};
pack(cli, 11187, {V0_name}) ->
    D_a_t_a = <<(protocol:pack(string, V0_name))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11187:16/little,
       D_a_t_a/binary>>};
pack(srv, 11187,
     {V0_result, V0_msg, V0_name, V0_name_used}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary,
                (protocol:pack(string, V0_name))/binary,
                (protocol:pack(string, V0_name_used))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11187:16/little,
       D_a_t_a/binary>>};
pack(cli, 11188, {}) ->
    {ok, <<2:32/little, 11188:16/little>>};
pack(srv, 11188, {V0_num, V0_left_num}) ->
    D_a_t_a = <<V0_num:32/little, V0_left_num:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11188:16/little,
       D_a_t_a/binary>>};
pack(cli, 11189, {}) ->
    {ok, <<2:32/little, 11189:16/little>>};
pack(srv, 11189, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11189:16/little,
       D_a_t_a/binary>>};
pack(cli, 11190,
     {V0_type, V0_use_type, V0_cost_type}) ->
    D_a_t_a = <<V0_type:8/little, V0_use_type:8/little,
                V0_cost_type:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11190:16/little,
       D_a_t_a/binary>>};
pack(srv, 11190, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11190:16/little,
       D_a_t_a/binary>>};
pack(cli, 11191, {V0_type}) ->
    D_a_t_a = <<V0_type:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11191:16/little,
       D_a_t_a/binary>>};
pack(srv, 11191, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11191:16/little,
       D_a_t_a/binary>>};
pack(cli, 11192, {}) ->
    {ok, <<2:32/little, 11192:16/little>>};
pack(srv, 11192,
     {V0_element_attr, V0_tmp_element_attr}) ->
    D_a_t_a = <<(length(V0_element_attr)):16/little,
                (list_to_binary([<<V1_effect_obj:8/little,
                                   (length(V1_attr)):16/little,
                                   (list_to_binary([<<V2_effect_type:32/little,
                                                      V2_val:32/little>>
                                                    || {V2_effect_type, V2_val}
                                                           <- V1_attr]))/binary,
                                   (length(V1_high_attr)):16/little,
                                   (list_to_binary([<<V2_effect_type:32/little,
                                                      V2_val:32/little>>
                                                    || {V2_effect_type, V2_val}
                                                           <- V1_high_attr]))/binary,
                                   (length(V1_add_skill_list)):16/little,
                                   (list_to_binary([<<V2_skill_id:32/little,
                                                      V2_lev:32/little>>
                                                    || {V2_skill_id, V2_lev}
                                                           <- V1_add_skill_list]))/binary,
                                   V1_end_time:32/little>>
                                 || #guild_element_attr{effect_obj =
                                                            V1_effect_obj,
                                                        attr = V1_attr,
                                                        high_attr =
                                                            V1_high_attr,
                                                        add_skill_list =
                                                            V1_add_skill_list,
                                                        end_time = V1_end_time}
                                        <- V0_element_attr]))/binary,
                (length(V0_tmp_element_attr)):16/little,
                (list_to_binary([<<V1_effect_obj:8/little,
                                   (length(V1_attr)):16/little,
                                   (list_to_binary([<<V2_effect_type:32/little,
                                                      V2_val:32/little>>
                                                    || {V2_effect_type, V2_val}
                                                           <- V1_attr]))/binary,
                                   (length(V1_high_attr)):16/little,
                                   (list_to_binary([<<V2_effect_type:32/little,
                                                      V2_val:32/little>>
                                                    || {V2_effect_type, V2_val}
                                                           <- V1_high_attr]))/binary,
                                   (length(V1_add_skill_list)):16/little,
                                   (list_to_binary([<<V2_skill_id:32/little,
                                                      V2_lev:32/little>>
                                                    || {V2_skill_id, V2_lev}
                                                           <- V1_add_skill_list]))/binary,
                                   V1_end_time:32/little>>
                                 || #guild_element_attr{effect_obj =
                                                            V1_effect_obj,
                                                        attr = V1_attr,
                                                        high_attr =
                                                            V1_high_attr,
                                                        add_skill_list =
                                                            V1_add_skill_list,
                                                        end_time = V1_end_time}
                                        <- V0_tmp_element_attr]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11192:16/little,
       D_a_t_a/binary>>};
pack(cli, 11193, {V0_build_type}) ->
    D_a_t_a = <<V0_build_type:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11193:16/little,
       D_a_t_a/binary>>};
pack(srv, 11193, {V0_cost}) ->
    D_a_t_a = <<V0_cost:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11193:16/little,
       D_a_t_a/binary>>};
pack(cli, 11194, {}) ->
    {ok, <<2:32/little, 11194:16/little>>};
pack(srv, 11194, {V0_element_info}) ->
    D_a_t_a = <<(length(V0_element_info)):16/little,
                (list_to_binary([<<V1_build_type:8/little,
                                   V1_lev:16/little>>
                                 || #element_info{build_type = V1_build_type,
                                                  lev = V1_lev}
                                        <- V0_element_info]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11194:16/little,
       D_a_t_a/binary>>};
pack(cli, 11195, {V0_type}) ->
    D_a_t_a = <<V0_type:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11195:16/little,
       D_a_t_a/binary>>};
pack(srv, 11195, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11195:16/little,
       D_a_t_a/binary>>};
pack(cli, 11196, {}) ->
    {ok, <<2:32/little, 11196:16/little>>};
pack(srv, 11196, {V0_remain}) ->
    D_a_t_a = <<V0_remain:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11196:16/little,
       D_a_t_a/binary>>};
pack(cli, 11197, {V0_mode}) ->
    D_a_t_a = <<V0_mode:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11197:16/little,
       D_a_t_a/binary>>};
pack(srv, 11197, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11197:16/little,
       D_a_t_a/binary>>};
pack(cli, 11198, {}) ->
    {ok, <<2:32/little, 11198:16/little>>};
pack(srv, 11198, {V0_total_donate}) ->
    D_a_t_a = <<V0_total_donate:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11198:16/little,
       D_a_t_a/binary>>};
pack(cli, 11199, {}) ->
    {ok, <<2:32/little, 11199:16/little>>};
pack(srv, 11199, {V0_limit_mode}) ->
    D_a_t_a = <<V0_limit_mode:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 11199:16/little,
       D_a_t_a/binary>>};
pack(_Type, Code, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
             binary()) -> {ok, tuple()} |
                          {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(srv, 11100, _B0) -> {ok, {}};
unpack(cli, 11100, _B0) ->
    {V1_guild_id, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {V1_name, _B4} = protocol:string(_B3),
    {V1_name_used, _B5} = protocol:string(_B4),
    {V1_lev, _B6} = protocol:uint8(_B5),
    {V1_id, _B7} = protocol:uint8(_B6),
    {V1_changeable, _B8} = protocol:uint32(_B7),
    {V1_last_changed, _B9} = protocol:uint32(_B8),
    {V1_academy_lev, _B10} = protocol:uint8(_B9),
    {V1_exchequer_lev, _B11} = protocol:uint8(_B10),
    {V1_store_lev, _B12} = protocol:uint8(_B11),
    {V1_lev_time, _B13} = protocol:uint32(_B12),
    {V1_academy_time, _B14} = protocol:uint32(_B13),
    {V1_exchequer_time, _B15} = protocol:uint32(_B14),
    {V1_store_time, _B16} = protocol:uint32(_B15),
    {V1_board, _B17} = protocol:string(_B16),
    {V1_announcement, _B18} = protocol:string(_B17),
    {V1_assets, _B19} = protocol:int32(_B18),
    {V1_max_assets, _B20} = protocol:uint32(_B19),
    {V1_upkeep, _B21} = protocol:uint32(_B20),
    {V1_leader_name, _B22} = protocol:string(_B21),
    {V1_rid, _B23} = protocol:uint32(_B22),
    {V1_r_platform, _B24} = protocol:string(_B23),
    {V1_r_zone_id, _B25} = protocol:uint16(_B24),
    {V1_leader_sex, _B26} = protocol:uint8(_B25),
    {V1_leader_classes, _B27} = protocol:uint8(_B26),
    {V1_leader_lev, _B28} = protocol:uint8(_B27),
    {V1_mem_num, _B29} = protocol:uint16(_B28),
    {V1_max_mem_num, _B30} = protocol:uint16(_B29),
    {V1_fresh_num, _B31} = protocol:uint16(_B30),
    {V1_max_fresh_num, _B32} = protocol:uint16(_B31),
    {V1_health, _B33} = protocol:uint16(_B32),
    {V1_create_time, _B34} = protocol:uint32(_B33),
    {V1_formalizing_lev, _B35} = protocol:uint8(_B34),
    {V1_element_info, _B41} = protocol:array(_B35,
                                             fun (_B36) ->
                                                     {V2_build_type, _B37} =
                                                         protocol:uint8(_B36),
                                                     {V2_lev, _B38} =
                                                         protocol:uint16(_B37),
                                                     {V2_time, _B39} =
                                                         protocol:uint32(_B38),
                                                     {{V2_build_type,
                                                       V2_lev,
                                                       V2_time},
                                                      _B39}
                                             end),
    {V1_upgrade_element_time, _B42} = protocol:uint32(_B41),
    {V1_limit_mode, _B43} = protocol:uint8(_B42),
    {V1_post, _B44} = protocol:uint8(_B43),
    {ok,
     {V1_guild_id,
      V1_platform,
      V1_zone_id,
      V1_name,
      V1_name_used,
      V1_lev,
      V1_id,
      V1_changeable,
      V1_last_changed,
      V1_academy_lev,
      V1_exchequer_lev,
      V1_store_lev,
      V1_lev_time,
      V1_academy_time,
      V1_exchequer_time,
      V1_store_time,
      V1_board,
      V1_announcement,
      V1_assets,
      V1_max_assets,
      V1_upkeep,
      V1_leader_name,
      V1_rid,
      V1_r_platform,
      V1_r_zone_id,
      V1_leader_sex,
      V1_leader_classes,
      V1_leader_lev,
      V1_mem_num,
      V1_max_mem_num,
      V1_fresh_num,
      V1_max_fresh_num,
      V1_health,
      V1_create_time,
      V1_formalizing_lev,
      V1_element_info,
      V1_upgrade_element_time,
      V1_limit_mode,
      V1_post}};
unpack(srv, 11101, _B0) -> {ok, {}};
unpack(cli, 11101, _B0) ->
    {V1_members, _B35} = protocol:array(_B0,
                                        fun (_B1) ->
                                                {V2_rid, _B2} =
                                                    protocol:uint32(_B1),
                                                {V2_platform, _B3} =
                                                    protocol:string(_B2),
                                                {V2_zone_id, _B4} =
                                                    protocol:uint16(_B3),
                                                {V2_name, _B5} =
                                                    protocol:string(_B4),
                                                {V2_sex, _B6} =
                                                    protocol:uint8(_B5),
                                                {V2_classes, _B7} =
                                                    protocol:uint8(_B6),
                                                {V2_lev, _B8} =
                                                    protocol:uint8(_B7),
                                                {V2_post, _B9} =
                                                    protocol:uint8(_B8),
                                                {V2_enter_time, _B10} =
                                                    protocol:uint32(_B9),
                                                {V2_last_login, _B11} =
                                                    protocol:uint32(_B10),
                                                {V2_status, _B12} =
                                                    protocol:uint8(_B11),
                                                {V2_signature, _B13} =
                                                    protocol:string(_B12),
                                                {V2_value, _B14} =
                                                    protocol:uint32(_B13),
                                                {V2_total_value, _B15} =
                                                    protocol:uint32(_B14),
                                                {V2_cup, _B16} =
                                                    protocol:uint32(_B15),
                                                {V2_signed, _B17} =
                                                    protocol:uint16(_B16),
                                                {V2_last_signed, _B18} =
                                                    protocol:uint32(_B17),
                                                {V2_fc, _B19} =
                                                    protocol:uint32(_B18),
                                                {V2_num, _B20} =
                                                    protocol:uint32(_B19),
                                                {V2_remain, _B21} =
                                                    protocol:uint32(_B20),
                                                {V2_amount, _B22} =
                                                    protocol:uint32(_B21),
                                                {V2_requirement, _B31} =
                                                    protocol:array(_B22,
                                                                   fun (_B23) ->
                                                                           {V3_requirement_type,
                                                                            _B24} =
                                                                               protocol:uint8(_B23),
                                                                           {V3_requirement_digit,
                                                                            _B29} =
                                                                               protocol:array(_B24,
                                                                                              fun
                                                                                                  (_B25) ->
                                                                                                      {V4_digit_key,
                                                                                                       _B26} =
                                                                                                          protocol:uint8(_B25),
                                                                                                      {V4_digit_value,
                                                                                                       _B27} =
                                                                                                          protocol:uint32(_B26),
                                                                                                      {{V4_digit_key,
                                                                                                        V4_digit_value},
                                                                                                       _B27}
                                                                                              end),
                                                                           {{V3_requirement_type,
                                                                             V3_requirement_digit},
                                                                            _B29}
                                                                   end),
                                                {V2_active, _B32} =
                                                    protocol:uint32(_B31),
                                                {V2_ability, _B33} =
                                                    protocol:uint32(_B32),
                                                {{V2_rid,
                                                  V2_platform,
                                                  V2_zone_id,
                                                  V2_name,
                                                  V2_sex,
                                                  V2_classes,
                                                  V2_lev,
                                                  V2_post,
                                                  V2_enter_time,
                                                  V2_last_login,
                                                  V2_status,
                                                  V2_signature,
                                                  V2_value,
                                                  V2_total_value,
                                                  V2_cup,
                                                  V2_signed,
                                                  V2_last_signed,
                                                  V2_fc,
                                                  V2_num,
                                                  V2_remain,
                                                  V2_amount,
                                                  V2_requirement,
                                                  V2_active,
                                                  V2_ability},
                                                 _B33}
                                        end),
    {V1_mem_num, _B36} = protocol:uint16(_B35),
    {V1_max_mem_num, _B37} = protocol:uint16(_B36),
    {V1_fresh_num, _B38} = protocol:uint16(_B37),
    {V1_max_fresh_num, _B39} = protocol:uint16(_B38),
    {V1_insist_pray, _B40} = protocol:uint8(_B39),
    {V1_pious_pray, _B41} = protocol:uint8(_B40),
    {V1_grace_pray, _B42} = protocol:uint8(_B41),
    {ok,
     {V1_members,
      V1_mem_num,
      V1_max_mem_num,
      V1_fresh_num,
      V1_max_fresh_num,
      V1_insist_pray,
      V1_pious_pray,
      V1_grace_pray}};
unpack(srv, 11102, _B0) ->
    {V1_name, _B1} = protocol:string(_B0),
    {ok, {V1_name}};
unpack(cli, 11102, _B0) ->
    {V1_guild_list, _B21} = protocol:array(_B0,
                                           fun (_B1) ->
                                                   {V2_guild_id, _B2} =
                                                       protocol:uint32(_B1),
                                                   {V2_platform, _B3} =
                                                       protocol:string(_B2),
                                                   {V2_zone_id, _B4} =
                                                       protocol:uint16(_B3),
                                                   {V2_name, _B5} =
                                                       protocol:string(_B4),
                                                   {V2_lev, _B6} =
                                                       protocol:uint8(_B5),
                                                   {V2_id, _B7} =
                                                       protocol:uint8(_B6),
                                                   {V2_leader_name, _B8} =
                                                       protocol:string(_B7),
                                                   {V2_rid, _B9} =
                                                       protocol:uint32(_B8),
                                                   {V2_r_platform, _B10} =
                                                       protocol:string(_B9),
                                                   {V2_r_zone_id, _B11} =
                                                       protocol:uint16(_B10),
                                                   {V2_leader_sex, _B12} =
                                                       protocol:uint8(_B11),
                                                   {V2_leader_classes, _B13} =
                                                       protocol:uint8(_B12),
                                                   {V2_leader_lev, _B14} =
                                                       protocol:uint8(_B13),
                                                   {V2_mem_num, _B15} =
                                                       protocol:uint16(_B14),
                                                   {V2_max_mem_num, _B16} =
                                                       protocol:uint16(_B15),
                                                   {V2_fresh_num, _B17} =
                                                       protocol:uint16(_B16),
                                                   {V2_max_fresh_num, _B18} =
                                                       protocol:uint16(_B17),
                                                   {V2_health, _B19} =
                                                       protocol:uint16(_B18),
                                                   {{V2_guild_id,
                                                     V2_platform,
                                                     V2_zone_id,
                                                     V2_name,
                                                     V2_lev,
                                                     V2_id,
                                                     V2_leader_name,
                                                     V2_rid,
                                                     V2_r_platform,
                                                     V2_r_zone_id,
                                                     V2_leader_sex,
                                                     V2_leader_classes,
                                                     V2_leader_lev,
                                                     V2_mem_num,
                                                     V2_max_mem_num,
                                                     V2_fresh_num,
                                                     V2_max_fresh_num,
                                                     V2_health},
                                                    _B19}
                                           end),
    {ok, {V1_guild_list}};
unpack(srv, 11103, _B0) ->
    {V1_name, _B1} = protocol:string(_B0),
    {V1_notice, _B2} = protocol:string(_B1),
    {ok, {V1_name, V1_notice}};
unpack(cli, 11103, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 11104, _B0) ->
    {V1_guild_id, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {V1_tag, _B4} = protocol:uint8(_B3),
    {V1_msg, _B5} = protocol:string(_B4),
    {ok,
     {V1_guild_id, V1_platform, V1_zone_id, V1_tag, V1_msg}};
unpack(cli, 11104, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 11105, _B0) -> {ok, {}};
unpack(cli, 11105, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 11106, _B0) -> {ok, {}};
unpack(cli, 11106, _B0) ->
    {V1_guild_list, _B24} = protocol:array(_B0,
                                           fun (_B1) ->
                                                   {V2_guild_id, _B2} =
                                                       protocol:uint32(_B1),
                                                   {V2_platform, _B3} =
                                                       protocol:string(_B2),
                                                   {V2_zone_id, _B4} =
                                                       protocol:uint16(_B3),
                                                   {V2_name, _B5} =
                                                       protocol:string(_B4),
                                                   {V2_lev, _B6} =
                                                       protocol:uint8(_B5),
                                                   {V2_id, _B7} =
                                                       protocol:uint8(_B6),
                                                   {V2_leader_name, _B8} =
                                                       protocol:string(_B7),
                                                   {V2_rid, _B9} =
                                                       protocol:uint32(_B8),
                                                   {V2_r_platform, _B10} =
                                                       protocol:string(_B9),
                                                   {V2_r_zone_id, _B11} =
                                                       protocol:uint16(_B10),
                                                   {V2_leader_sex, _B12} =
                                                       protocol:uint8(_B11),
                                                   {V2_leader_classes, _B13} =
                                                       protocol:uint8(_B12),
                                                   {V2_leader_lev, _B14} =
                                                       protocol:uint8(_B13),
                                                   {V2_mem_num, _B15} =
                                                       protocol:uint16(_B14),
                                                   {V2_max_mem_num, _B16} =
                                                       protocol:uint16(_B15),
                                                   {V2_fresh_num, _B17} =
                                                       protocol:uint16(_B16),
                                                   {V2_max_fresh_num, _B18} =
                                                       protocol:uint16(_B17),
                                                   {V2_board, _B19} =
                                                       protocol:string(_B18),
                                                   {V2_announcement, _B20} =
                                                       protocol:string(_B19),
                                                   {V2_activity, _B21} =
                                                       protocol:uint16(_B20),
                                                   {V2_health, _B22} =
                                                       protocol:uint16(_B21),
                                                   {{V2_guild_id,
                                                     V2_platform,
                                                     V2_zone_id,
                                                     V2_name,
                                                     V2_lev,
                                                     V2_id,
                                                     V2_leader_name,
                                                     V2_rid,
                                                     V2_r_platform,
                                                     V2_r_zone_id,
                                                     V2_leader_sex,
                                                     V2_leader_classes,
                                                     V2_leader_lev,
                                                     V2_mem_num,
                                                     V2_max_mem_num,
                                                     V2_fresh_num,
                                                     V2_max_fresh_num,
                                                     V2_board,
                                                     V2_announcement,
                                                     V2_activity,
                                                     V2_health},
                                                    _B22}
                                           end),
    {ok, {V1_guild_list}};
unpack(srv, 11107, _B0) -> {ok, {}};
unpack(cli, 11107, _B0) ->
    {V1_post, _B1} = protocol:uint8(_B0),
    {ok, {V1_post}};
unpack(srv, 11108, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {V1_post, _B4} = protocol:uint8(_B3),
    {ok, {V1_rid, V1_platform, V1_zone_id, V1_post}};
unpack(cli, 11108, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 11109, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {ok, {V1_rid, V1_platform, V1_zone_id}};
unpack(cli, 11109, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 11110, _B0) -> {ok, {}};
unpack(cli, 11110, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_rid, _B2} = protocol:uint32(_B1),
    {V1_platform, _B3} = protocol:string(_B2),
    {V1_zone_id, _B4} = protocol:uint16(_B3),
    {V1_name, _B5} = protocol:string(_B4),
    {V1_sex, _B6} = protocol:uint8(_B5),
    {V1_classes, _B7} = protocol:uint8(_B6),
    {V1_lev, _B8} = protocol:uint8(_B7),
    {V1_post, _B9} = protocol:uint8(_B8),
    {V1_enter_time, _B10} = protocol:uint32(_B9),
    {V1_last_login, _B11} = protocol:uint32(_B10),
    {V1_status, _B12} = protocol:uint8(_B11),
    {V1_signature, _B13} = protocol:string(_B12),
    {V1_value, _B14} = protocol:uint32(_B13),
    {V1_total_value, _B15} = protocol:uint32(_B14),
    {V1_cup, _B16} = protocol:uint32(_B15),
    {V1_signed, _B17} = protocol:uint16(_B16),
    {V1_last_signed, _B18} = protocol:uint32(_B17),
    {V1_fc, _B19} = protocol:uint32(_B18),
    {V1_num, _B20} = protocol:uint32(_B19),
    {V1_remain, _B21} = protocol:uint32(_B20),
    {V1_amount, _B22} = protocol:uint32(_B21),
    {V1_requirement, _B31} = protocol:array(_B22,
                                            fun (_B23) ->
                                                    {V2_requirement_type,
                                                     _B24} =
                                                        protocol:uint8(_B23),
                                                    {V2_requirement_digit,
                                                     _B29} =
                                                        protocol:array(_B24,
                                                                       fun
                                                                           (_B25) ->
                                                                               {V3_digit_key,
                                                                                _B26} =
                                                                                   protocol:uint8(_B25),
                                                                               {V3_digit_value,
                                                                                _B27} =
                                                                                   protocol:uint32(_B26),
                                                                               {{V3_digit_key,
                                                                                 V3_digit_value},
                                                                                _B27}
                                                                       end),
                                                    {{V2_requirement_type,
                                                      V2_requirement_digit},
                                                     _B29}
                                            end),
    {V1_active, _B32} = protocol:uint32(_B31),
    {V1_ability, _B33} = protocol:uint32(_B32),
    {ok,
     {V1_flag,
      V1_rid,
      V1_platform,
      V1_zone_id,
      V1_name,
      V1_sex,
      V1_classes,
      V1_lev,
      V1_post,
      V1_enter_time,
      V1_last_login,
      V1_status,
      V1_signature,
      V1_value,
      V1_total_value,
      V1_cup,
      V1_signed,
      V1_last_signed,
      V1_fc,
      V1_num,
      V1_remain,
      V1_amount,
      V1_requirement,
      V1_active,
      V1_ability}};
unpack(srv, 11111, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {V1_mode, _B2} = protocol:uint8(_B1),
    {ok, {V1_type, V1_mode}};
unpack(cli, 11111, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 11112, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {V1_mode, _B2} = protocol:uint8(_B1),
    {ok, {V1_type, V1_mode}};
unpack(cli, 11112, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 11113, _B0) -> {ok, {}};
unpack(cli, 11113, _B0) ->
    {V1_lev, _B1} = protocol:uint8(_B0),
    {V1_academy_lev, _B2} = protocol:uint8(_B1),
    {V1_exchequer_lev, _B3} = protocol:uint8(_B2),
    {V1_store_lev, _B4} = protocol:uint8(_B3),
    {V1_formalizing_lev, _B5} = protocol:uint8(_B4),
    {V1_lev_time, _B6} = protocol:uint32(_B5),
    {V1_academy_time, _B7} = protocol:uint32(_B6),
    {V1_exchequer_time, _B8} = protocol:uint32(_B7),
    {V1_store_time, _B9} = protocol:uint32(_B8),
    {V1_assets, _B10} = protocol:uint32(_B9),
    {V1_element_info, _B16} = protocol:array(_B10,
                                             fun (_B11) ->
                                                     {V2_build_type, _B12} =
                                                         protocol:uint8(_B11),
                                                     {V2_lev, _B13} =
                                                         protocol:uint16(_B12),
                                                     {V2_time, _B14} =
                                                         protocol:uint32(_B13),
                                                     {{V2_build_type,
                                                       V2_lev,
                                                       V2_time},
                                                      _B14}
                                             end),
    {V1_upgrade_element_time, _B17} = protocol:uint32(_B16),
    {V1_limit_mode, _B18} = protocol:uint8(_B17),
    {ok,
     {V1_lev,
      V1_academy_lev,
      V1_exchequer_lev,
      V1_store_lev,
      V1_formalizing_lev,
      V1_lev_time,
      V1_academy_time,
      V1_exchequer_time,
      V1_store_time,
      V1_assets,
      V1_element_info,
      V1_upgrade_element_time,
      V1_limit_mode}};
unpack(srv, 11114, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {V1_content, _B2} = protocol:string(_B1),
    {ok, {V1_type, V1_content}};
unpack(cli, 11114, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_type, _B3} = protocol:uint8(_B2),
    {V1_content, _B4} = protocol:string(_B3),
    {ok, {V1_result, V1_msg, V1_type, V1_content}};
unpack(srv, 11115, _B0) -> {ok, {}};
unpack(cli, 11115, _B0) ->
    {V1_daily, _B1} = protocol:uint8(_B0),
    {V1_weekly, _B2} = protocol:uint8(_B1),
    {ok, {V1_daily, V1_weekly}};
unpack(srv, 11116, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {ok, {V1_type}};
unpack(cli, 11116, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 11117, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {ok, {V1_type}};
unpack(cli, 11117, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 11118, _B0) -> {ok, {}};
unpack(cli, 11118, _B0) ->
    {V1_store_list, _B13} = protocol:array(_B0,
                                           fun (_B1) ->
                                                   {V2_id, _B2} =
                                                       protocol:uint16(_B1),
                                                   {V2_base_id, _B3} =
                                                       protocol:uint32(_B2),
                                                   {V2_num, _B4} =
                                                       protocol:uint16(_B3),
                                                   {V2_price, _B9} =
                                                       protocol:array(_B4,
                                                                      fun
                                                                          (_B5) ->
                                                                              {V3_name,
                                                                               _B6} =
                                                                                  protocol:uint32(_B5),
                                                                              {V3_val,
                                                                               _B7} =
                                                                                  protocol:uint32(_B6),
                                                                              {{V3_name,
                                                                                V3_val},
                                                                               _B7}
                                                                      end),
                                                   {V2_limit, _B10} =
                                                       protocol:uint16(_B9),
                                                   {V2_role_num, _B11} =
                                                       protocol:uint16(_B10),
                                                   {{V2_id,
                                                     V2_base_id,
                                                     V2_num,
                                                     V2_price,
                                                     V2_limit,
                                                     V2_role_num},
                                                    _B11}
                                           end),
    {V1_normal_goods, _B25} = protocol:array(_B13,
                                             fun (_B14) ->
                                                     {V2_id, _B15} =
                                                         protocol:uint16(_B14),
                                                     {V2_base_id, _B16} =
                                                         protocol:uint32(_B15),
                                                     {V2_price, _B21} =
                                                         protocol:array(_B16,
                                                                        fun
                                                                            (_B17) ->
                                                                                {V3_name,
                                                                                 _B18} =
                                                                                    protocol:uint32(_B17),
                                                                                {V3_val,
                                                                                 _B19} =
                                                                                    protocol:uint32(_B18),
                                                                                {{V3_name,
                                                                                  V3_val},
                                                                                 _B19}
                                                                        end),
                                                     {V2_limit, _B22} =
                                                         protocol:uint16(_B21),
                                                     {V2_role_num, _B23} =
                                                         protocol:uint16(_B22),
                                                     {{V2_id,
                                                       V2_base_id,
                                                       V2_price,
                                                       V2_limit,
                                                       V2_role_num},
                                                      _B23}
                                             end),
    {ok, {V1_store_list, V1_normal_goods}};
unpack(srv, 11119, _B0) ->
    {V1_id, _B1} = protocol:uint16(_B0),
    {V1_num, _B2} = protocol:uint16(_B1),
    {ok, {V1_id, V1_num}};
unpack(cli, 11119, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_flag, _B3} = protocol:uint8(_B2),
    {ok, {V1_result, V1_msg, V1_flag}};
unpack(srv, 11120, _B0) -> {ok, {}};
unpack(cli, 11120, _B0) ->
    {V1_time, _B1} = protocol:uint32(_B0),
    {ok, {V1_time}};
unpack(srv, 11121, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {ok, {V1_rid, V1_platform, V1_zone_id}};
unpack(cli, 11121, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 11122, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_type, _B2} = protocol:uint8(_B1),
    {V1_lev, _B3} = protocol:uint8(_B2),
    {ok, {V1_flag, V1_type, V1_lev}};
unpack(cli, 11122, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_type, _B2} = protocol:uint8(_B1),
    {V1_lev, _B3} = protocol:uint8(_B2),
    {ok, {V1_flag, V1_type, V1_lev}};
unpack(srv, 11123, _B0) -> {ok, {}};
unpack(cli, 11123, _B0) ->
    {V1_apply_list, _B13} = protocol:array(_B0,
                                           fun (_B1) ->
                                                   {V2_rid, _B2} =
                                                       protocol:uint32(_B1),
                                                   {V2_platform, _B3} =
                                                       protocol:string(_B2),
                                                   {V2_zone_id, _B4} =
                                                       protocol:uint16(_B3),
                                                   {V2_name, _B5} =
                                                       protocol:string(_B4),
                                                   {V2_lev, _B6} =
                                                       protocol:uint8(_B5),
                                                   {V2_classes, _B7} =
                                                       protocol:uint8(_B6),
                                                   {V2_sex, _B8} =
                                                       protocol:uint8(_B7),
                                                   {V2_time, _B9} =
                                                       protocol:uint32(_B8),
                                                   {V2_tag, _B10} =
                                                       protocol:uint8(_B9),
                                                   {V2_msg, _B11} =
                                                       protocol:string(_B10),
                                                   {{V2_rid,
                                                     V2_platform,
                                                     V2_zone_id,
                                                     V2_name,
                                                     V2_lev,
                                                     V2_classes,
                                                     V2_sex,
                                                     V2_time,
                                                     V2_tag,
                                                     V2_msg},
                                                    _B11}
                                           end),
    {ok, {V1_apply_list}};
unpack(srv, 11124, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {V1_type, _B4} = protocol:uint8(_B3),
    {ok, {V1_rid, V1_platform, V1_zone_id, V1_type}};
unpack(cli, 11124, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_flag, _B3} = protocol:uint8(_B2),
    {V1_rid, _B4} = protocol:uint32(_B3),
    {V1_platform, _B5} = protocol:string(_B4),
    {V1_zone_id, _B6} = protocol:uint16(_B5),
    {ok,
     {V1_result,
      V1_msg,
      V1_flag,
      V1_rid,
      V1_platform,
      V1_zone_id}};
unpack(srv, 11125, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {V1_signature, _B4} = protocol:string(_B3),
    {ok, {V1_rid, V1_platform, V1_zone_id, V1_signature}};
unpack(cli, 11125, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_rid, _B3} = protocol:uint32(_B2),
    {V1_platform, _B4} = protocol:string(_B3),
    {V1_zone_id, _B5} = protocol:uint16(_B4),
    {ok,
     {V1_result, V1_msg, V1_rid, V1_platform, V1_zone_id}};
unpack(srv, 11126, _B0) -> {ok, {}};
unpack(cli, 11126, _B0) ->
    {V1_event_list, _B6} = protocol:array(_B0,
                                          fun (_B1) ->
                                                  {V2_time, _B2} =
                                                      protocol:uint32(_B1),
                                                  {V2_type, _B3} =
                                                      protocol:uint8(_B2),
                                                  {V2_msg, _B4} =
                                                      protocol:string(_B3),
                                                  {{V2_time, V2_type, V2_msg},
                                                   _B4}
                                          end),
    {ok, {V1_event_list}};
unpack(srv, 11127, _B0) -> {ok, {}};
unpack(cli, 11127, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 11128, _B0) -> {ok, {}};
unpack(cli, 11128, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 11129, _B0) -> {ok, {}};
unpack(cli, 11129, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 11130, _B0) ->
    {V1_num, _B1} = protocol:uint32(_B0),
    {ok, {V1_num}};
unpack(cli, 11130, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 11131, _B0) ->
    {V1_title, _B1} = protocol:string(_B0),
    {V1_num, _B2} = protocol:uint16(_B1),
    {V1_type, _B3} = protocol:uint8(_B2),
    {V1_source, _B4} = protocol:uint8(_B3),
    {ok, {V1_title, V1_num, V1_type, V1_source}};
unpack(cli, 11131, _B0) ->
    {V1_title, _B1} = protocol:string(_B0),
    {V1_id, _B2} = protocol:uint32(_B1),
    {V1_platform, _B3} = protocol:string(_B2),
    {V1_zone_id, _B4} = protocol:uint16(_B3),
    {V1_name, _B5} = protocol:string(_B4),
    {V1_sex, _B6} = protocol:uint8(_B5),
    {V1_classes, _B7} = protocol:uint8(_B6),
    {V1_lev, _B8} = protocol:uint8(_B7),
    {ok,
     {V1_title,
      V1_id,
      V1_platform,
      V1_zone_id,
      V1_name,
      V1_sex,
      V1_classes,
      V1_lev}};
unpack(srv, 11132, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {ok, {V1_id, V1_platform, V1_zone_id}};
unpack(cli, 11132, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {V1_name, _B4} = protocol:string(_B3),
    {V1_sex, _B5} = protocol:uint8(_B4),
    {V1_classes, _B6} = protocol:uint8(_B5),
    {V1_lev, _B7} = protocol:uint8(_B6),
    {V1_title, _B8} = protocol:string(_B7),
    {V1_amount, _B9} = protocol:uint32(_B8),
    {V1_remain, _B10} = protocol:uint32(_B9),
    {V1_num, _B11} = protocol:int32(_B10),
    {V1_total, _B12} = protocol:int32(_B11),
    {V1_time, _B13} = protocol:uint32(_B12),
    {V1_log, _B25} = protocol:array(_B13,
                                    fun (_B14) ->
                                            {V2_rid, _B15} =
                                                protocol:uint32(_B14),
                                            {V2_r_platform, _B16} =
                                                protocol:string(_B15),
                                            {V2_r_zone_id, _B17} =
                                                protocol:uint16(_B16),
                                            {V2_name, _B18} =
                                                protocol:string(_B17),
                                            {V2_val, _B19} =
                                                protocol:uint32(_B18),
                                            {V2_sex, _B20} =
                                                protocol:uint8(_B19),
                                            {V2_classes, _B21} =
                                                protocol:uint8(_B20),
                                            {V2_lev, _B22} =
                                                protocol:uint8(_B21),
                                            {V2_time, _B23} =
                                                protocol:uint32(_B22),
                                            {{V2_rid,
                                              V2_r_platform,
                                              V2_r_zone_id,
                                              V2_name,
                                              V2_val,
                                              V2_sex,
                                              V2_classes,
                                              V2_lev,
                                              V2_time},
                                             _B23}
                                    end),
    {ok,
     {V1_rid,
      V1_platform,
      V1_zone_id,
      V1_name,
      V1_sex,
      V1_classes,
      V1_lev,
      V1_title,
      V1_amount,
      V1_remain,
      V1_num,
      V1_total,
      V1_time,
      V1_log}};
unpack(srv, 11133, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {ok, {V1_id, V1_platform, V1_zone_id}};
unpack(cli, 11133, _B0) ->
    {V1_s_id, _B1} = protocol:uint32(_B0),
    {V1_s_platform, _B2} = protocol:string(_B1),
    {V1_s_zone_id, _B3} = protocol:uint16(_B2),
    {V1_s_name, _B4} = protocol:string(_B3),
    {V1_t_id, _B5} = protocol:uint32(_B4),
    {V1_t_platform, _B6} = protocol:string(_B5),
    {V1_t_zone_id, _B7} = protocol:uint16(_B6),
    {V1_t_name, _B8} = protocol:string(_B7),
    {ok,
     {V1_s_id,
      V1_s_platform,
      V1_s_zone_id,
      V1_s_name,
      V1_t_id,
      V1_t_platform,
      V1_t_zone_id,
      V1_t_name}};
unpack(srv, 11134, _B0) -> {ok, {}};
unpack(cli, 11134, _B0) ->
    {V1_name, _B1} = protocol:string(_B0),
    {V1_lev, _B2} = protocol:uint8(_B1),
    {V1_step, _B3} = protocol:uint8(_B2),
    {V1_exp, _B4} = protocol:int32(_B3),
    {V1_called, _B5} = protocol:uint8(_B4),
    {V1_last_renamed, _B6} = protocol:uint32(_B5),
    {V1_log, _B15} = protocol:array(_B6,
                                    fun (_B7) ->
                                            {V2_rid, _B8} =
                                                protocol:uint32(_B7),
                                            {V2_r_platform, _B9} =
                                                protocol:string(_B8),
                                            {V2_r_zone_id, _B10} =
                                                protocol:uint16(_B9),
                                            {V2_rname, _B11} =
                                                protocol:string(_B10),
                                            {V2_type, _B12} =
                                                protocol:uint8(_B11),
                                            {V2_exp, _B13} =
                                                protocol:uint32(_B12),
                                            {{V2_rid,
                                              V2_r_platform,
                                              V2_r_zone_id,
                                              V2_rname,
                                              V2_type,
                                              V2_exp},
                                             _B13}
                                    end),
    {ok,
     {V1_name,
      V1_lev,
      V1_step,
      V1_exp,
      V1_called,
      V1_last_renamed,
      V1_log}};
unpack(srv, 11135, _B0) -> {ok, {}};
unpack(cli, 11135, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 11136, _B0) -> {ok, {}};
unpack(cli, 11136, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 11137, _B0) -> {ok, {}};
unpack(cli, 11137, _B0) ->
    {V1_mercenarys, _B11} = protocol:array(_B0,
                                           fun (_B1) ->
                                                   {V2_rid, _B2} =
                                                       protocol:uint32(_B1),
                                                   {V2_platform, _B3} =
                                                       protocol:string(_B2),
                                                   {V2_zone_id, _B4} =
                                                       protocol:uint16(_B3),
                                                   {V2_name, _B5} =
                                                       protocol:string(_B4),
                                                   {V2_lev, _B6} =
                                                       protocol:uint32(_B5),
                                                   {V2_recruited, _B7} =
                                                       protocol:uint8(_B6),
                                                   {V2_dispatched, _B8} =
                                                       protocol:uint32(_B7),
                                                   {V2_base_id, _B9} =
                                                       protocol:uint32(_B8),
                                                   {{V2_rid,
                                                     V2_platform,
                                                     V2_zone_id,
                                                     V2_name,
                                                     V2_lev,
                                                     V2_recruited,
                                                     V2_dispatched,
                                                     V2_base_id},
                                                    _B9}
                                           end),
    {ok, {V1_mercenarys}};
unpack(srv, 11138, _B0) ->
    {V1_base_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_base_id}};
unpack(cli, 11138, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 11139, _B0) ->
    {V1_base_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_base_id}};
unpack(cli, 11139, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 11140, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {ok, {V1_rid, V1_platform, V1_zone_id}};
unpack(cli, 11140, _B0) ->
    {V1_looks, _B7} = protocol:array(_B0,
                                     fun (_B1) ->
                                             {V2_looks_type, _B2} =
                                                 protocol:uint32(_B1),
                                             {V2_looks_mode, _B3} =
                                                 protocol:uint32(_B2),
                                             {V2_looks_val, _B4} =
                                                 protocol:uint32(_B3),
                                             {V2_looks_str, _B5} =
                                                 protocol:string(_B4),
                                             {{V2_looks_type,
                                               V2_looks_mode,
                                               V2_looks_val,
                                               V2_looks_str},
                                              _B5}
                                     end),
    {ok, {V1_looks}};
unpack(srv, 11141, _B0) -> {ok, {}};
unpack(cli, 11141, _B0) ->
    {V1_mercenarys, _B11} = protocol:array(_B0,
                                           fun (_B1) ->
                                                   {V2_rid, _B2} =
                                                       protocol:uint32(_B1),
                                                   {V2_platform, _B3} =
                                                       protocol:string(_B2),
                                                   {V2_zone_id, _B4} =
                                                       protocol:uint16(_B3),
                                                   {V2_lev, _B5} =
                                                       protocol:uint32(_B4),
                                                   {V2_recruited, _B6} =
                                                       protocol:uint8(_B5),
                                                   {V2_dispatched, _B7} =
                                                       protocol:uint32(_B6),
                                                   {V2_score, _B8} =
                                                       protocol:uint32(_B7),
                                                   {V2_base_id, _B9} =
                                                       protocol:uint32(_B8),
                                                   {{V2_rid,
                                                     V2_platform,
                                                     V2_zone_id,
                                                     V2_lev,
                                                     V2_recruited,
                                                     V2_dispatched,
                                                     V2_score,
                                                     V2_base_id},
                                                    _B9}
                                           end),
    {ok, {V1_mercenarys}};
unpack(srv, 11142, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {V1_base_id, _B4} = protocol:uint32(_B3),
    {ok, {V1_rid, V1_platform, V1_zone_id, V1_base_id}};
unpack(cli, 11142, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {V1_name, _B4} = protocol:string(_B3),
    {V1_lev, _B5} = protocol:uint32(_B4),
    {V1_recruited, _B6} = protocol:uint8(_B5),
    {V1_dispatched, _B7} = protocol:uint32(_B6),
    {V1_base_id, _B8} = protocol:uint32(_B7),
    {V1_hp_max, _B9} = protocol:uint32(_B8),
    {V1_mp_max, _B10} = protocol:uint32(_B9),
    {V1_atk_speed, _B11} = protocol:uint16(_B10),
    {V1_phy_dmg, _B12} = protocol:uint32(_B11),
    {V1_magic_dmg, _B13} = protocol:uint32(_B12),
    {V1_phy_def, _B14} = protocol:uint32(_B13),
    {V1_magic_def, _B15} = protocol:uint32(_B14),
    {V1_eqm, _B25} = protocol:array(_B15,
                                    fun (_B16) ->
                                            {V2_base_id, _B17} =
                                                protocol:uint32(_B16),
                                            {V2_eqm_attrs, _B23} =
                                                protocol:array(_B17,
                                                               fun (_B18) ->
                                                                       {V3_type,
                                                                        _B19} =
                                                                           protocol:uint16(_B18),
                                                                       {V3_name,
                                                                        _B20} =
                                                                           protocol:uint32(_B19),
                                                                       {V3_val,
                                                                        _B21} =
                                                                           protocol:int32(_B20),
                                                                       {{V3_type,
                                                                         V3_name,
                                                                         V3_val},
                                                                        _B21}
                                                               end),
                                            {{V2_base_id, V2_eqm_attrs}, _B23}
                                    end),
    {V1_score, _B26} = protocol:uint32(_B25),
    {ok,
     {V1_rid,
      V1_platform,
      V1_zone_id,
      V1_name,
      V1_lev,
      V1_recruited,
      V1_dispatched,
      V1_base_id,
      V1_hp_max,
      V1_mp_max,
      V1_atk_speed,
      V1_phy_dmg,
      V1_magic_dmg,
      V1_phy_def,
      V1_magic_def,
      V1_eqm,
      V1_score}};
unpack(srv, 11143, _B0) ->
    {V1_name, _B1} = protocol:string(_B0),
    {ok, {V1_name}};
unpack(cli, 11143, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_name, _B3} = protocol:string(_B2),
    {ok, {V1_result, V1_msg, V1_name}};
unpack(srv, 11144, _B0) ->
    {V1_totem, _B1} = protocol:uint8(_B0),
    {ok, {V1_totem}};
unpack(cli, 11144, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_totem, _B3} = protocol:uint8(_B2),
    {ok, {V1_result, V1_msg, V1_totem}};
unpack(srv, 11145, _B0) -> {ok, {}};
unpack(cli, 11145, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_changeable, _B3} = protocol:uint32(_B2),
    {ok, {V1_result, V1_msg, V1_changeable}};
unpack(srv, 11146, _B0) -> {ok, {}};
unpack(cli, 11146, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_timeout, _B2} = protocol:uint32(_B1),
    {ok, {V1_result, V1_timeout}};
unpack(srv, 11147, _B0) -> {ok, {}};
unpack(cli, 11147, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_asked, _B2} = protocol:uint32(_B1),
    {V1_answer, _B3} = protocol:uint8(_B2),
    {V1_asked_num, _B4} = protocol:uint16(_B3),
    {V1_answers, _B14} = protocol:array(_B4,
                                        fun (_B5) ->
                                                {V2_rid, _B6} =
                                                    protocol:uint32(_B5),
                                                {V2_platform, _B7} =
                                                    protocol:string(_B6),
                                                {V2_zone_id, _B8} =
                                                    protocol:uint16(_B7),
                                                {V2_name, _B9} =
                                                    protocol:string(_B8),
                                                {V2_option, _B10} =
                                                    protocol:uint8(_B9),
                                                {V2_result, _B11} =
                                                    protocol:uint8(_B10),
                                                {V2_answered, _B12} =
                                                    protocol:uint32(_B11),
                                                {{V2_rid,
                                                  V2_platform,
                                                  V2_zone_id,
                                                  V2_name,
                                                  V2_option,
                                                  V2_result,
                                                  V2_answered},
                                                 _B12}
                                        end),
    {V1_cheat_off, _B15} = protocol:uint8(_B14),
    {V1_cheat_num, _B16} = protocol:uint16(_B15),
    {V1_today_right, _B17} = protocol:uint16(_B16),
    {V1_today_max, _B18} = protocol:uint16(_B17),
    {ok,
     {V1_id,
      V1_asked,
      V1_answer,
      V1_asked_num,
      V1_answers,
      V1_cheat_off,
      V1_cheat_num,
      V1_today_right,
      V1_today_max}};
unpack(srv, 11148, _B0) ->
    {V1_option, _B1} = protocol:uint8(_B0),
    {ok, {V1_option}};
unpack(cli, 11148, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_option, _B3} = protocol:uint8(_B2),
    {ok, {V1_result, V1_msg, V1_option}};
unpack(srv, 11149, _B0) -> {ok, {}};
unpack(cli, 11149, _B0) ->
    {V1_answers, _B12} = protocol:array(_B0,
                                        fun (_B1) ->
                                                {V2_rid, _B2} =
                                                    protocol:uint32(_B1),
                                                {V2_platform, _B3} =
                                                    protocol:string(_B2),
                                                {V2_zone_id, _B4} =
                                                    protocol:uint16(_B3),
                                                {V2_sex, _B5} =
                                                    protocol:uint8(_B4),
                                                {V2_classes, _B6} =
                                                    protocol:uint8(_B5),
                                                {V2_name, _B7} =
                                                    protocol:string(_B6),
                                                {V2_guild_name, _B8} =
                                                    protocol:string(_B7),
                                                {V2_totem_id, _B9} =
                                                    protocol:uint32(_B8),
                                                {V2_score, _B10} =
                                                    protocol:uint32(_B9),
                                                {{V2_rid,
                                                  V2_platform,
                                                  V2_zone_id,
                                                  V2_sex,
                                                  V2_classes,
                                                  V2_name,
                                                  V2_guild_name,
                                                  V2_totem_id,
                                                  V2_score},
                                                 _B10}
                                        end),
    {ok, {V1_answers}};
unpack(srv, 11150, _B0) -> {ok, {}};
unpack(cli, 11150, _B0) ->
    {V1_option, _B1} = protocol:uint8(_B0),
    {ok, {V1_option}};
unpack(srv, 11151, _B0) -> {ok, {}};
unpack(cli, 11151, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {V1_name, _B4} = protocol:string(_B3),
    {V1_option, _B5} = protocol:uint8(_B4),
    {V1_result, _B6} = protocol:uint8(_B5),
    {V1_answered, _B7} = protocol:uint32(_B6),
    {ok,
     {V1_rid,
      V1_platform,
      V1_zone_id,
      V1_name,
      V1_option,
      V1_result,
      V1_answered}};
unpack(srv, 11152, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {ok, {V1_rid, V1_platform, V1_zone_id}};
unpack(cli, 11152, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 11153, _B0) -> {ok, {}};
unpack(cli, 11153, _B0) ->
    {V1_exp, _B1} = protocol:uint32(_B0),
    {ok, {V1_exp}};
unpack(srv, 11154, _B0) -> {ok, {}};
unpack(cli, 11154, _B0) ->
    {V1_guild_name, _B1} = protocol:string(_B0),
    {ok, {V1_guild_name}};
unpack(srv, 11155, _B0) -> {ok, {}};
unpack(cli, 11155, _B0) ->
    {V1_my_score, _B1} = protocol:uint32(_B0),
    {V1_my_rank, _B2} = protocol:uint32(_B1),
    {V1_rid, _B3} = protocol:uint32(_B2),
    {V1_platform, _B4} = protocol:string(_B3),
    {V1_zone_id, _B5} = protocol:uint16(_B4),
    {V1_sex, _B6} = protocol:uint8(_B5),
    {V1_classes, _B7} = protocol:uint8(_B6),
    {V1_name, _B8} = protocol:string(_B7),
    {V1_guild_name, _B9} = protocol:string(_B8),
    {V1_totem_id, _B10} = protocol:uint32(_B9),
    {V1_score, _B11} = protocol:uint32(_B10),
    {ok,
     {V1_my_score,
      V1_my_rank,
      V1_rid,
      V1_platform,
      V1_zone_id,
      V1_sex,
      V1_classes,
      V1_name,
      V1_guild_name,
      V1_totem_id,
      V1_score}};
unpack(srv, 11156, _B0) ->
    {V1_battle_id, _B1} = protocol:uint32(_B0),
    {V1_id, _B2} = protocol:uint32(_B1),
    {ok, {V1_battle_id, V1_id}};
unpack(cli, 11156, _B0) ->
    {V1_battle_id, _B1} = protocol:uint32(_B0),
    {V1_id, _B2} = protocol:uint32(_B1),
    {V1_time, _B3} = protocol:uint32(_B2),
    {ok, {V1_battle_id, V1_id, V1_time}};
unpack(srv, 11157, _B0) -> {ok, {}};
unpack(cli, 11157, _B0) ->
    {V1_usurpers, _B10} = protocol:array(_B0,
                                         fun (_B1) ->
                                                 {V2_rid, _B2} =
                                                     protocol:uint32(_B1),
                                                 {V2_platform, _B3} =
                                                     protocol:string(_B2),
                                                 {V2_zone_id, _B4} =
                                                     protocol:uint16(_B3),
                                                 {V2_name, _B5} =
                                                     protocol:string(_B4),
                                                 {V2_sex, _B6} =
                                                     protocol:uint8(_B5),
                                                 {V2_classes, _B7} =
                                                     protocol:uint8(_B6),
                                                 {V2_ctime, _B8} =
                                                     protocol:uint32(_B7),
                                                 {{V2_rid,
                                                   V2_platform,
                                                   V2_zone_id,
                                                   V2_name,
                                                   V2_sex,
                                                   V2_classes,
                                                   V2_ctime},
                                                  _B8}
                                         end),
    {ok, {V1_usurpers}};
unpack(srv, 11158, _B0) -> {ok, {}};
unpack(cli, 11158, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 11159, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {ok, {V1_rid, V1_platform, V1_zone_id}};
unpack(cli, 11159, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 11160, _B0) -> {ok, {}};
unpack(cli, 11160, _B0) -> {ok, {}};
unpack(srv, 11161, _B0) -> {ok, {}};
unpack(cli, 11161, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(srv, 11162, _B0) ->
    {V1_id, _B1} = protocol:uint16(_B0),
    {V1_num, _B2} = protocol:uint16(_B1),
    {ok, {V1_id, V1_num}};
unpack(cli, 11162, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 11163, _B0) -> {ok, {}};
unpack(cli, 11163, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 11164, _B0) -> {ok, {}};
unpack(cli, 11164, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 11165, _B0) ->
    {V1_x, _B1} = protocol:uint32(_B0),
    {V1_y, _B2} = protocol:uint32(_B1),
    {ok, {V1_x, V1_y}};
unpack(cli, 11165, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 11166, _B0) ->
    {V1_battle_id, _B1} = protocol:uint32(_B0),
    {V1_id, _B2} = protocol:uint32(_B1),
    {ok, {V1_battle_id, V1_id}};
unpack(cli, 11166, _B0) ->
    {V1_owner_id, _B1} = protocol:uint32(_B0),
    {V1_owner_platform, _B2} = protocol:string(_B1),
    {V1_owner_zone_id, _B3} = protocol:uint16(_B2),
    {V1_owner_name, _B4} = protocol:string(_B3),
    {V1_sowed, _B5} = protocol:uint32(_B4),
    {V1_unit_base_id, _B6} = protocol:uint32(_B5),
    {V1_battle_id, _B7} = protocol:uint32(_B6),
    {V1_uid, _B8} = protocol:uint32(_B7),
    {V1_irrigations, _B18} = protocol:array(_B8,
                                            fun (_B9) ->
                                                    {V2_rid, _B10} =
                                                        protocol:uint32(_B9),
                                                    {V2_platform, _B11} =
                                                        protocol:string(_B10),
                                                    {V2_zone_id, _B12} =
                                                        protocol:uint16(_B11),
                                                    {V2_name, _B13} =
                                                        protocol:string(_B12),
                                                    {V2_sex, _B14} =
                                                        protocol:uint8(_B13),
                                                    {V2_classes, _B15} =
                                                        protocol:uint8(_B14),
                                                    {V2_ctime, _B16} =
                                                        protocol:uint32(_B15),
                                                    {{V2_rid,
                                                      V2_platform,
                                                      V2_zone_id,
                                                      V2_name,
                                                      V2_sex,
                                                      V2_classes,
                                                      V2_ctime},
                                                     _B16}
                                            end),
    {ok,
     {V1_owner_id,
      V1_owner_platform,
      V1_owner_zone_id,
      V1_owner_name,
      V1_sowed,
      V1_unit_base_id,
      V1_battle_id,
      V1_uid,
      V1_irrigations}};
unpack(srv, 11167, _B0) ->
    {V1_battle_id, _B1} = protocol:uint32(_B0),
    {V1_id, _B2} = protocol:uint32(_B1),
    {ok, {V1_battle_id, V1_id}};
unpack(cli, 11167, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 11168, _B0) ->
    {V1_title, _B1} = protocol:string(_B0),
    {V1_content, _B2} = protocol:string(_B1),
    {ok, {V1_title, V1_content}};
unpack(cli, 11168, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 11169, _B0) -> {ok, {}};
unpack(cli, 11169, _B0) ->
    {V1_battle_id, _B1} = protocol:uint32(_B0),
    {V1_id, _B2} = protocol:uint32(_B1),
    {ok, {V1_battle_id, V1_id}};
unpack(srv, 11170, _B0) -> {ok, {}};
unpack(cli, 11170, _B0) ->
    {V1_applys, _B12} = protocol:array(_B0,
                                       fun (_B1) ->
                                               {V2_g_id, _B2} =
                                                   protocol:uint32(_B1),
                                               {V2_g_platform, _B3} =
                                                   protocol:string(_B2),
                                               {V2_g_zone_id, _B4} =
                                                   protocol:uint16(_B3),
                                               {V2_name, _B5} =
                                                   protocol:string(_B4),
                                               {V2_r_id, _B6} =
                                                   protocol:uint32(_B5),
                                               {V2_r_platform, _B7} =
                                                   protocol:string(_B6),
                                               {V2_r_zone_id, _B8} =
                                                   protocol:uint16(_B7),
                                               {V2_leader_name, _B9} =
                                                   protocol:string(_B8),
                                               {V2_ctime, _B10} =
                                                   protocol:uint32(_B9),
                                               {{V2_g_id,
                                                 V2_g_platform,
                                                 V2_g_zone_id,
                                                 V2_name,
                                                 V2_r_id,
                                                 V2_r_platform,
                                                 V2_r_zone_id,
                                                 V2_leader_name,
                                                 V2_ctime},
                                                _B10}
                                       end),
    {ok, {V1_applys}};
unpack(srv, 11171, _B0) -> {ok, {}};
unpack(cli, 11171, _B0) ->
    {V1_applyed, _B6} = protocol:array(_B0,
                                       fun (_B1) ->
                                               {V2_a_id, _B2} =
                                                   protocol:uint32(_B1),
                                               {V2_a_platform, _B3} =
                                                   protocol:string(_B2),
                                               {V2_a_zone_id, _B4} =
                                                   protocol:uint16(_B3),
                                               {{V2_a_id,
                                                 V2_a_platform,
                                                 V2_a_zone_id},
                                                _B4}
                                       end),
    {ok, {V1_applyed}};
unpack(srv, 11172, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {ok, {V1_id, V1_platform, V1_zone_id}};
unpack(cli, 11172, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 11173, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {V1_decision, _B4} = protocol:uint8(_B3),
    {ok, {V1_id, V1_platform, V1_zone_id, V1_decision}};
unpack(cli, 11173, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 11174, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {ok, {V1_type}};
unpack(cli, 11174, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 11175, _B0) -> {ok, {}};
unpack(cli, 11175, _B0) ->
    {V1_remain, _B1} = protocol:uint32(_B0),
    {ok, {V1_remain}};
unpack(srv, 11176, _B0) -> {ok, {}};
unpack(cli, 11176, _B0) ->
    {V1_g_id, _B1} = protocol:uint32(_B0),
    {V1_g_platform, _B2} = protocol:string(_B1),
    {V1_g_zone_id, _B3} = protocol:uint16(_B2),
    {V1_name, _B4} = protocol:string(_B3),
    {V1_r_id, _B5} = protocol:uint32(_B4),
    {V1_r_platform, _B6} = protocol:string(_B5),
    {V1_r_zone_id, _B7} = protocol:uint16(_B6),
    {V1_leader_name, _B8} = protocol:string(_B7),
    {V1_ctime, _B9} = protocol:uint32(_B8),
    {ok,
     {V1_g_id,
      V1_g_platform,
      V1_g_zone_id,
      V1_name,
      V1_r_id,
      V1_r_platform,
      V1_r_zone_id,
      V1_leader_name,
      V1_ctime}};
unpack(srv, 11177, _B0) -> {ok, {}};
unpack(cli, 11177, _B0) ->
    {V1_can_open, _B1} = protocol:uint8(_B0),
    {V1_setting_chance, _B2} = protocol:uint8(_B1),
    {V1_setting_time, _B3} = protocol:uint32(_B2),
    {V1_is_win, _B4} = protocol:uint8(_B3),
    {ok,
     {V1_can_open,
      V1_setting_chance,
      V1_setting_time,
      V1_is_win}};
unpack(srv, 11178, _B0) ->
    {V1_time, _B1} = protocol:uint32(_B0),
    {ok, {V1_time}};
unpack(cli, 11178, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 11179, _B0) -> {ok, {}};
unpack(cli, 11179, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 11180, _B0) -> {ok, {}};
unpack(cli, 11180, _B0) ->
    {V1_items, _B5} = protocol:array(_B0,
                                     fun (_B1) ->
                                             {V2_base_id, _B2} =
                                                 protocol:uint32(_B1),
                                             {V2_num, _B3} =
                                                 protocol:uint16(_B2),
                                             {{V2_base_id, V2_num}, _B3}
                                     end),
    {V1_allocated, _B12} = protocol:array(_B5,
                                          fun (_B6) ->
                                                  {V2_mid, _B7} =
                                                      protocol:tuple(_B6),
                                                  {V2_base_id, _B8} =
                                                      protocol:uint16(_B7),
                                                  {V2_num, _B9} =
                                                      protocol:uint16(_B8),
                                                  {V2_time, _B10} =
                                                      protocol:uint32(_B9),
                                                  {{V2_mid,
                                                    V2_base_id,
                                                    V2_num,
                                                    V2_time},
                                                   _B10}
                                          end),
    {V1_log, _B18} = protocol:array(_B12,
                                    fun (_B13) ->
                                            {V2_msg, _B14} =
                                                protocol:string(_B13),
                                            {V2_base_id, _B15} =
                                                protocol:uint16(_B14),
                                            {V2_ctime, _B16} =
                                                protocol:uint32(_B15),
                                            {{V2_msg, V2_base_id, V2_ctime},
                                             _B16}
                                    end),
    {ok, {V1_items, V1_allocated, V1_log}};
unpack(srv, 11181, _B0) ->
    {V1_alloc, _B8} = protocol:array(_B0,
                                     fun (_B1) ->
                                             {V2_rid, _B2} =
                                                 protocol:uint32(_B1),
                                             {V2_r_platform, _B3} =
                                                 protocol:string(_B2),
                                             {V2_r_zone_id, _B4} =
                                                 protocol:uint16(_B3),
                                             {V2_base_id, _B5} =
                                                 protocol:uint32(_B4),
                                             {V2_num, _B6} =
                                                 protocol:uint16(_B5),
                                             {{V2_rid,
                                               V2_r_platform,
                                               V2_r_zone_id,
                                               V2_base_id,
                                               V2_num},
                                              _B6}
                                     end),
    {ok, {V1_alloc}};
unpack(cli, 11181, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 11182, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {ok, {V1_rid, V1_platform, V1_zone_id}};
unpack(cli, 11182, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 11183, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {V1_type, _B4} = protocol:uint8(_B3),
    {ok, {V1_rid, V1_platform, V1_zone_id, V1_type}};
unpack(cli, 11183, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 11184, _B0) -> {ok, {}};
unpack(cli, 11184, _B0) ->
    {V1_invitations, _B15} = protocol:array(_B0,
                                            fun (_B1) ->
                                                    {V2_rid, _B2} =
                                                        protocol:uint32(_B1),
                                                    {V2_platform, _B3} =
                                                        protocol:string(_B2),
                                                    {V2_zone_id, _B4} =
                                                        protocol:uint16(_B3),
                                                    {V2_name, _B5} =
                                                        protocol:string(_B4),
                                                    {V2_lev, _B6} =
                                                        protocol:uint8(_B5),
                                                    {V2_classes, _B7} =
                                                        protocol:uint8(_B6),
                                                    {V2_sex, _B8} =
                                                        protocol:uint8(_B7),
                                                    {V2_ctime, _B9} =
                                                        protocol:uint32(_B8),
                                                    {V2_gid, _B10} =
                                                        protocol:uint32(_B9),
                                                    {V2_g_platform, _B11} =
                                                        protocol:string(_B10),
                                                    {V2_g_zone_id, _B12} =
                                                        protocol:uint16(_B11),
                                                    {V2_guild_name, _B13} =
                                                        protocol:string(_B12),
                                                    {{V2_rid,
                                                      V2_platform,
                                                      V2_zone_id,
                                                      V2_name,
                                                      V2_lev,
                                                      V2_classes,
                                                      V2_sex,
                                                      V2_ctime,
                                                      V2_gid,
                                                      V2_g_platform,
                                                      V2_g_zone_id,
                                                      V2_guild_name},
                                                     _B13}
                                            end),
    {ok, {V1_invitations}};
unpack(srv, 11185, _B0) -> {ok, {}};
unpack(cli, 11185, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint16(_B2),
    {V1_name, _B4} = protocol:string(_B3),
    {V1_lev, _B5} = protocol:uint8(_B4),
    {V1_classes, _B6} = protocol:uint8(_B5),
    {V1_sex, _B7} = protocol:uint8(_B6),
    {V1_ctime, _B8} = protocol:uint32(_B7),
    {V1_gid, _B9} = protocol:uint32(_B8),
    {V1_g_platform, _B10} = protocol:string(_B9),
    {V1_g_zone_id, _B11} = protocol:uint16(_B10),
    {V1_guild_name, _B12} = protocol:string(_B11),
    {ok,
     {V1_rid,
      V1_platform,
      V1_zone_id,
      V1_name,
      V1_lev,
      V1_classes,
      V1_sex,
      V1_ctime,
      V1_gid,
      V1_g_platform,
      V1_g_zone_id,
      V1_guild_name}};
unpack(srv, 11186, _B0) ->
    {V1_lev, _B1} = protocol:uint8(_B0),
    {ok, {V1_lev}};
unpack(cli, 11186, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 11187, _B0) ->
    {V1_name, _B1} = protocol:string(_B0),
    {ok, {V1_name}};
unpack(cli, 11187, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_name, _B3} = protocol:string(_B2),
    {V1_name_used, _B4} = protocol:string(_B3),
    {ok, {V1_result, V1_msg, V1_name, V1_name_used}};
unpack(srv, 11188, _B0) -> {ok, {}};
unpack(cli, 11188, _B0) ->
    {V1_num, _B1} = protocol:uint32(_B0),
    {V1_left_num, _B2} = protocol:uint32(_B1),
    {ok, {V1_num, V1_left_num}};
unpack(srv, 11189, _B0) -> {ok, {}};
unpack(cli, 11189, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 11190, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {V1_use_type, _B2} = protocol:uint8(_B1),
    {V1_cost_type, _B3} = protocol:uint8(_B2),
    {ok, {V1_type, V1_use_type, V1_cost_type}};
unpack(cli, 11190, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 11191, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {ok, {V1_type}};
unpack(cli, 11191, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 11192, _B0) -> {ok, {}};
unpack(cli, 11192, _B0) ->
    {V1_element_attr, _B20} = protocol:array(_B0,
                                             fun (_B1) ->
                                                     {V2_effect_obj, _B2} =
                                                         protocol:uint8(_B1),
                                                     {V2_attr, _B7} =
                                                         protocol:array(_B2,
                                                                        fun
                                                                            (_B3) ->
                                                                                {V3_effect_type,
                                                                                 _B4} =
                                                                                    protocol:uint32(_B3),
                                                                                {V3_val,
                                                                                 _B5} =
                                                                                    protocol:uint32(_B4),
                                                                                {{V3_effect_type,
                                                                                  V3_val},
                                                                                 _B5}
                                                                        end),
                                                     {V2_high_attr, _B12} =
                                                         protocol:array(_B7,
                                                                        fun
                                                                            (_B8) ->
                                                                                {V3_effect_type,
                                                                                 _B9} =
                                                                                    protocol:uint32(_B8),
                                                                                {V3_val,
                                                                                 _B10} =
                                                                                    protocol:uint32(_B9),
                                                                                {{V3_effect_type,
                                                                                  V3_val},
                                                                                 _B10}
                                                                        end),
                                                     {V2_add_skill_list, _B17} =
                                                         protocol:array(_B12,
                                                                        fun
                                                                            (_B13) ->
                                                                                {V3_skill_id,
                                                                                 _B14} =
                                                                                    protocol:uint32(_B13),
                                                                                {V3_lev,
                                                                                 _B15} =
                                                                                    protocol:uint32(_B14),
                                                                                {{V3_skill_id,
                                                                                  V3_lev},
                                                                                 _B15}
                                                                        end),
                                                     {V2_end_time, _B18} =
                                                         protocol:uint32(_B17),
                                                     {{V2_effect_obj,
                                                       V2_attr,
                                                       V2_high_attr,
                                                       V2_add_skill_list,
                                                       V2_end_time},
                                                      _B18}
                                             end),
    {V1_tmp_element_attr, _B40} = protocol:array(_B20,
                                                 fun (_B21) ->
                                                         {V2_effect_obj, _B22} =
                                                             protocol:uint8(_B21),
                                                         {V2_attr, _B27} =
                                                             protocol:array(_B22,
                                                                            fun
                                                                                (_B23) ->
                                                                                    {V3_effect_type,
                                                                                     _B24} =
                                                                                        protocol:uint32(_B23),
                                                                                    {V3_val,
                                                                                     _B25} =
                                                                                        protocol:uint32(_B24),
                                                                                    {{V3_effect_type,
                                                                                      V3_val},
                                                                                     _B25}
                                                                            end),
                                                         {V2_high_attr, _B32} =
                                                             protocol:array(_B27,
                                                                            fun
                                                                                (_B28) ->
                                                                                    {V3_effect_type,
                                                                                     _B29} =
                                                                                        protocol:uint32(_B28),
                                                                                    {V3_val,
                                                                                     _B30} =
                                                                                        protocol:uint32(_B29),
                                                                                    {{V3_effect_type,
                                                                                      V3_val},
                                                                                     _B30}
                                                                            end),
                                                         {V2_add_skill_list,
                                                          _B37} =
                                                             protocol:array(_B32,
                                                                            fun
                                                                                (_B33) ->
                                                                                    {V3_skill_id,
                                                                                     _B34} =
                                                                                        protocol:uint32(_B33),
                                                                                    {V3_lev,
                                                                                     _B35} =
                                                                                        protocol:uint32(_B34),
                                                                                    {{V3_skill_id,
                                                                                      V3_lev},
                                                                                     _B35}
                                                                            end),
                                                         {V2_end_time, _B38} =
                                                             protocol:uint32(_B37),
                                                         {{V2_effect_obj,
                                                           V2_attr,
                                                           V2_high_attr,
                                                           V2_add_skill_list,
                                                           V2_end_time},
                                                          _B38}
                                                 end),
    {ok, {V1_element_attr, V1_tmp_element_attr}};
unpack(srv, 11193, _B0) ->
    {V1_build_type, _B1} = protocol:uint8(_B0),
    {ok, {V1_build_type}};
unpack(cli, 11193, _B0) ->
    {V1_cost, _B1} = protocol:uint32(_B0),
    {ok, {V1_cost}};
unpack(srv, 11194, _B0) -> {ok, {}};
unpack(cli, 11194, _B0) ->
    {V1_element_info, _B5} = protocol:array(_B0,
                                            fun (_B1) ->
                                                    {V2_build_type, _B2} =
                                                        protocol:uint8(_B1),
                                                    {V2_lev, _B3} =
                                                        protocol:uint16(_B2),
                                                    {{V2_build_type, V2_lev},
                                                     _B3}
                                            end),
    {ok, {V1_element_info}};
unpack(srv, 11195, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {ok, {V1_type}};
unpack(cli, 11195, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 11196, _B0) -> {ok, {}};
unpack(cli, 11196, _B0) ->
    {V1_remain, _B1} = protocol:uint32(_B0),
    {ok, {V1_remain}};
unpack(srv, 11197, _B0) ->
    {V1_mode, _B1} = protocol:uint8(_B0),
    {ok, {V1_mode}};
unpack(cli, 11197, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 11198, _B0) -> {ok, {}};
unpack(cli, 11198, _B0) ->
    {V1_total_donate, _B1} = protocol:uint32(_B0),
    {ok, {V1_total_donate}};
unpack(srv, 11199, _B0) -> {ok, {}};
unpack(cli, 11199, _B0) ->
    {V1_limit_mode, _B1} = protocol:uint8(_B0),
    {ok, {V1_limit_mode}};
unpack(_Type, Code, _Data) ->
    {error, {unknown_unpack_command, Code}}.

