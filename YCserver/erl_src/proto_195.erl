-file("src/proto/proto_195.erl", 1).

-module(proto_195).

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

-file("src/proto/proto_195.erl", 14).

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

-file("src/proto/proto_195.erl", 15).

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

-file("src/proto/proto_195.erl", 16).

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

-file("src/proto/proto_195.erl", 17).

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

-file("src/proto/proto_195.erl", 18).

-file("inc/guild_dungeon.hrl", 1).

-record(guild_dungeon,
        {ver = 0,
         guild_id = {0, "", 0},
         base_id = 0,
         map_id = 0,
         map_pid = undefined,
         unit_id = 0,
         chapter_now = 0,
         strongpoint_now = 0,
         boss_id = 0,
         num = 0,
         time = 0,
         chapters = [],
         rewards_all = []}).

-record(guild_dungeon_chapter,
        {ver = 0,
         chapter_id = 0,
         status = 0,
         strongpoints = []}).

-record(guild_dungeon_strongpoint,
        {ver = 0, strongpoint_id = 1, monsters = []}).

-record(guild_dungeon_monster,
        {unique = 0,
         monster_id = 0,
         percent = 0,
         challenge = 1,
         role_name = "",
         role_sex = 0,
         role_classes = 0,
         percent_list = [],
         type = 0,
         combat_pid = undefined,
         combat_id = 0,
         rewards = []}).

-record(guild_dungeon_rank,
        {id = 0,
         guild_id = {0, "", 0},
         chapter_id = 0,
         strongpoint_id = 0,
         ranks = [],
         rewards = []}).

-record(guild_dungeon_rank_role,
        {role_id = {0, "", 0},
         times = 0,
         role_name = "",
         classes = 0,
         sex = 0,
         harm = 0,
         role_ids = []}).

-record(guild_dungeon_hp,
        {id = {{0, "", 0}, 0, 0, 0},
         guild_id = {0, "", 0},
         chapter_id = 0,
         strongpoint_id = 0,
         monster_id = 0,
         monsters = []}).

-file("src/proto/proto_195.erl", 19).

-spec pack(srv | cli, non_neg_integer(),
           tuple()) -> {ok, binary()} |
                       {error, {unknown_pack_command, non_neg_integer()}}.

pack(cli, 19500, {}) ->
    {ok, <<2:32/little, 19500:16/little>>};
pack(srv, 19500,
     {#guild_dungeon{chapter_now = V0_chapter_now,
                     num = V0_num, chapters = V0_chapters},
      V0_times,
      V0_boss_times,
      V0_active}) ->
    D_a_t_a = <<V0_chapter_now:16/signed-little,
                V0_num:16/signed-little,
                (length(V0_chapters)):16/little,
                (list_to_binary([<<V1_chapter_id:16/little,
                                   V1_status:8/little,
                                   (length(V1_strongpoints)):16/little,
                                   (list_to_binary([<<V2_strongpoint_id:16/little,
                                                      (length(V2_monsters)):16/little,
                                                      (list_to_binary([<<V3_unique:16/little,
                                                                         V3_monster_id:32/little,
                                                                         (protocol:pack(string,
                                                                                        V3_role_name))/binary,
                                                                         V3_role_sex:8/little,
                                                                         V3_role_classes:8/little,
                                                                         V3_percent:32/little,
                                                                         V3_challenge:8/little,
                                                                         (length(V3_rewards)):16/little,
                                                                         (list_to_binary([<<V4_item_id:32/little,
                                                                                            V4_item_num:16/little>>
                                                                                          || {V4_item_id,
                                                                                              V4_item_num}
                                                                                                 <- V3_rewards]))/binary>>
                                                                       || #guild_dungeon_monster{unique
                                                                                                     =
                                                                                                     V3_unique,
                                                                                                 monster_id
                                                                                                     =
                                                                                                     V3_monster_id,
                                                                                                 role_name
                                                                                                     =
                                                                                                     V3_role_name,
                                                                                                 role_sex
                                                                                                     =
                                                                                                     V3_role_sex,
                                                                                                 role_classes
                                                                                                     =
                                                                                                     V3_role_classes,
                                                                                                 percent
                                                                                                     =
                                                                                                     V3_percent,
                                                                                                 challenge
                                                                                                     =
                                                                                                     V3_challenge,
                                                                                                 rewards
                                                                                                     =
                                                                                                     V3_rewards}
                                                                              <- V2_monsters]))/binary>>
                                                    || #guild_dungeon_strongpoint{strongpoint_id
                                                                                      =
                                                                                      V2_strongpoint_id,
                                                                                  monsters
                                                                                      =
                                                                                      V2_monsters}
                                                           <- V1_strongpoints]))/binary>>
                                 || #guild_dungeon_chapter{chapter_id =
                                                               V1_chapter_id,
                                                           status = V1_status,
                                                           strongpoints =
                                                               V1_strongpoints}
                                        <- V0_chapters]))/binary,
                V0_times:16/little, V0_boss_times:16/little,
                V0_active:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19500:16/little,
       D_a_t_a/binary>>};
pack(cli, 19501,
     {V0_chapter_id, V0_strongpoint_id, V0_unique}) ->
    D_a_t_a = <<V0_chapter_id:16/little,
                V0_strongpoint_id:16/little, V0_unique:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19501:16/little,
       D_a_t_a/binary>>};
pack(srv, 19501, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19501:16/little,
       D_a_t_a/binary>>};
pack(cli, 19502, {V0_chapter_id, V0_strongpoint_id}) ->
    D_a_t_a = <<V0_chapter_id:16/little,
                V0_strongpoint_id:16/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19502:16/little,
       D_a_t_a/binary>>};
pack(srv, 19502,
     {#guild_dungeon_rank{chapter_id = V0_chapter_id,
                          strongpoint_id = V0_strongpoint_id,
                          ranks = V0_ranks}}) ->
    D_a_t_a = <<V0_chapter_id:16/little,
                V0_strongpoint_id:16/little,
                (length(V0_ranks)):16/little,
                (list_to_binary([<<V1_r_id:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:16/little,
                                   (protocol:pack(string, V1_role_name))/binary,
                                   V1_classes:8/little, V1_sex:8/little,
                                   V1_harm:32/little>>
                                 || #guild_dungeon_rank_role{role_id =
                                                                 {V1_r_id,
                                                                  V1_platform,
                                                                  V1_zone_id},
                                                             role_name =
                                                                 V1_role_name,
                                                             classes =
                                                                 V1_classes,
                                                             sex = V1_sex,
                                                             harm = V1_harm}
                                        <- V0_ranks]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19502:16/little,
       D_a_t_a/binary>>};
pack(cli, 19503,
     {V0_chapter_id, V0_strongpoint_id, V0_unique}) ->
    D_a_t_a = <<V0_chapter_id:16/little,
                V0_strongpoint_id:16/little, V0_unique:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19503:16/little,
       D_a_t_a/binary>>};
pack(srv, 19503, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19503:16/little,
       D_a_t_a/binary>>};
pack(cli, 19504,
     {V0_chapter_id, V0_strongpoint_id, V0_unique}) ->
    D_a_t_a = <<V0_chapter_id:16/little,
                V0_strongpoint_id:16/little, V0_unique:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19504:16/little,
       D_a_t_a/binary>>};
pack(srv, 19504, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19504:16/little,
       D_a_t_a/binary>>};
pack(cli, 19505,
     {V0_chapter_id, V0_strongpoint_id, V0_unique}) ->
    D_a_t_a = <<V0_chapter_id:16/little,
                V0_strongpoint_id:16/little, V0_unique:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19505:16/little,
       D_a_t_a/binary>>};
pack(srv, 19505,
     {V0_chapter_id,
      V0_strongpoint_id,
      V0_unique,
      V0_score,
      V0_max_score,
      V0_max_guild_score,
      V0_rank,
      V0_war_percent,
      #guild_dungeon_monster{monster_id = V0_monster_id,
                             role_name = V0_role_name, role_sex = V0_role_sex,
                             role_classes = V0_role_classes,
                             percent = V0_percent,
                             challenge = V0_challenge}}) ->
    D_a_t_a = <<V0_chapter_id:16/little,
                V0_strongpoint_id:16/little, V0_unique:32/little,
                V0_score:32/little, V0_max_score:32/little,
                V0_max_guild_score:32/little, V0_rank:16/little,
                V0_war_percent:32/little, V0_monster_id:32/little,
                (protocol:pack(string, V0_role_name))/binary,
                V0_role_sex:8/little, V0_role_classes:8/little,
                V0_percent:32/little, V0_challenge:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19505:16/little,
       D_a_t_a/binary>>};
pack(cli, 19506, {}) ->
    {ok, <<2:32/little, 19506:16/little>>};
pack(srv, 19506, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19506:16/little,
       D_a_t_a/binary>>};
pack(cli, 19507, {}) ->
    {ok, <<2:32/little, 19507:16/little>>};
pack(srv, 19507,
     {V0_round, V0_dmg, V0_score, V0_percent, V0_harm}) ->
    D_a_t_a = <<V0_round:8/little, V0_dmg:32/little,
                V0_score:32/little, V0_percent:16/little,
                V0_harm:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19507:16/little,
       D_a_t_a/binary>>};
pack(cli, 19508, {}) ->
    {ok, <<2:32/little, 19508:16/little>>};
pack(srv, 19508, {V0_result}) ->
    D_a_t_a = <<V0_result:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19508:16/little,
       D_a_t_a/binary>>};
pack(cli, 19509, {}) ->
    {ok, <<2:32/little, 19509:16/little>>};
pack(srv, 19509, {V0_state, V0_time}) ->
    D_a_t_a = <<V0_state:32/little, V0_time:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19509:16/little,
       D_a_t_a/binary>>};
pack(cli, 19510, {V0_pos}) ->
    D_a_t_a = <<V0_pos:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19510:16/little,
       D_a_t_a/binary>>};
pack(srv, 19510, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19510:16/little,
       D_a_t_a/binary>>};
pack(cli, 19511, {}) ->
    {ok, <<2:32/little, 19511:16/little>>};
pack(srv, 19511, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19511:16/little,
       D_a_t_a/binary>>};
pack(cli, 19512, {V0_pos}) ->
    D_a_t_a = <<V0_pos:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19512:16/little,
       D_a_t_a/binary>>};
pack(srv, 19512, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19512:16/little,
       D_a_t_a/binary>>};
pack(cli, 19513, {V0_type, V0_question}) ->
    D_a_t_a = <<V0_type:8/little,
                (protocol:pack(string, V0_question))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19513:16/little,
       D_a_t_a/binary>>};
pack(srv, 19513, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19513:16/little,
       D_a_t_a/binary>>};
pack(cli, 19514, {V0_type, V0_id}) ->
    D_a_t_a = <<V0_type:8/little, V0_id:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19514:16/little,
       D_a_t_a/binary>>};
pack(srv, 19514, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19514:16/little,
       D_a_t_a/binary>>};
pack(cli, 19515, {}) ->
    {ok, <<2:32/little, 19515:16/little>>};
pack(srv, 19515,
     {V0_vacancy,
      V0_begin_time,
      V0_now_round,
      V0_max_round,
      V0_pos_info,
      V0_next_pos_info}) ->
    D_a_t_a = <<V0_vacancy:32/little,
                V0_begin_time:32/little, V0_now_round:32/little,
                V0_max_round:32/little, (length(V0_pos_info)):16/little,
                (list_to_binary([<<V1_rid:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:32/little,
                                   (protocol:pack(string, V1_role_name))/binary,
                                   V1_sex:8/little, V1_classes:32/little,
                                   V1_pos:32/little>>
                                 || {{V1_rid, V1_platform, V1_zone_id},
                                     V1_role_name,
                                     V1_sex,
                                     V1_classes,
                                     V1_pos}
                                        <- V0_pos_info]))/binary,
                (length(V0_next_pos_info)):16/little,
                (list_to_binary([<<V1_rid:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:32/little,
                                   (protocol:pack(string, V1_role_name))/binary,
                                   V1_sex:8/little, V1_classes:32/little,
                                   V1_pos:32/little>>
                                 || {{V1_rid, V1_platform, V1_zone_id},
                                     V1_role_name,
                                     V1_sex,
                                     V1_classes,
                                     V1_pos}
                                        <- V0_next_pos_info]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19515:16/little,
       D_a_t_a/binary>>};
pack(cli, 19516, {V0_type, V0_id, V0_flag}) ->
    D_a_t_a = <<V0_type:8/little, V0_id:32/little,
                V0_flag:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19516:16/little,
       D_a_t_a/binary>>};
pack(srv, 19516, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19516:16/little,
       D_a_t_a/binary>>};
pack(cli, 19517, {}) ->
    {ok, <<2:32/little, 19517:16/little>>};
pack(srv, 19517,
     {V0_min_num,
      V0_max_num,
      V0_end_time,
      {V0_rid, V0_platform, V0_zone_id},
      V0_role_name,
      V0_sex,
      V0_classes}) ->
    D_a_t_a = <<V0_min_num:32/little, V0_max_num:32/little,
                V0_end_time:32/little, V0_rid:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:32/little,
                (protocol:pack(string, V0_role_name))/binary,
                V0_sex:8/little, V0_classes:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19517:16/little,
       D_a_t_a/binary>>};
pack(cli, 19518, {V0_num}) ->
    D_a_t_a = <<V0_num:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19518:16/little,
       D_a_t_a/binary>>};
pack(srv, 19518, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19518:16/little,
       D_a_t_a/binary>>};
pack(cli, 19519, {V0_type}) ->
    D_a_t_a = <<V0_type:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19519:16/little,
       D_a_t_a/binary>>};
pack(srv, 19519, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19519:16/little,
       D_a_t_a/binary>>};
pack(cli, 19520, {}) ->
    {ok, <<2:32/little, 19520:16/little>>};
pack(srv, 19520,
     {V0_type, V0_role_name, V0_question, V0_quest_round}) ->
    D_a_t_a = <<V0_type:32/little,
                (protocol:pack(string, V0_role_name))/binary,
                (protocol:pack(string, V0_question))/binary,
                V0_quest_round:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19520:16/little,
       D_a_t_a/binary>>};
pack(cli, 19521, {}) ->
    {ok, <<2:32/little, 19521:16/little>>};
pack(srv, 19521,
     {{V0_rid, V0_platform, V0_zone_id},
      V0_name,
      V0_sex,
      V0_classes}) ->
    D_a_t_a = <<V0_rid:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:32/little,
                (protocol:pack(string, V0_name))/binary,
                V0_sex:8/little, V0_classes:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19521:16/little,
       D_a_t_a/binary>>};
pack(cli, 19522, {}) ->
    {ok, <<2:32/little, 19522:16/little>>};
pack(srv, 19522, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19522:16/little,
       D_a_t_a/binary>>};
pack(cli, 19523, {V0_type}) ->
    D_a_t_a = <<V0_type:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19523:16/little,
       D_a_t_a/binary>>};
pack(srv, 19523, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19523:16/little,
       D_a_t_a/binary>>};
pack(cli, 19524, {}) ->
    {ok, <<2:32/little, 19524:16/little>>};
pack(srv, 19524,
     {V0_is_pass,
      V0_flower,
      V0_egg,
      V0_watch,
      V0_flower_list,
      V0_egg_list,
      V0_call_list}) ->
    D_a_t_a = <<V0_is_pass:8/little, V0_flower:32/little,
                V0_egg:32/little, V0_watch:32/little,
                (length(V0_flower_list)):16/little,
                (list_to_binary([<<V1_id:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:32/little,
                                   (protocol:pack(string, V1_role_name))/binary,
                                   V1_sex:8/little, V1_classes:32/little>>
                                 || {{V1_id, V1_platform, V1_zone_id},
                                     V1_role_name,
                                     V1_sex,
                                     V1_classes}
                                        <- V0_flower_list]))/binary,
                (length(V0_egg_list)):16/little,
                (list_to_binary([<<V1_id:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:32/little,
                                   (protocol:pack(string, V1_role_name))/binary,
                                   V1_sex:8/little, V1_classes:32/little>>
                                 || {{V1_id, V1_platform, V1_zone_id},
                                     V1_role_name,
                                     V1_sex,
                                     V1_classes}
                                        <- V0_egg_list]))/binary,
                (length(V0_call_list)):16/little,
                (list_to_binary([<<V1_id:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:32/little,
                                   (protocol:pack(string, V1_role_name))/binary,
                                   V1_sex:8/little, V1_classes:32/little>>
                                 || {{V1_id, V1_platform, V1_zone_id},
                                     V1_role_name,
                                     V1_sex,
                                     V1_classes}
                                        <- V0_call_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19524:16/little,
       D_a_t_a/binary>>};
pack(cli, 19525, {}) ->
    {ok, <<2:32/little, 19525:16/little>>};
pack(srv, 19525, {V0_ver, V0_question_info}) ->
    D_a_t_a = <<V0_ver:32/little,
                (length(V0_question_info)):16/little,
                (list_to_binary([<<V1_type:32/little, V1_id:32/little,
                                   (protocol:pack(string, V1_question))/binary,
                                   (protocol:pack(string, V1_role_name))/binary,
                                   V1_is_choose:8/little>>
                                 || {V1_type,
                                     V1_id,
                                     V1_question,
                                     V1_role_name,
                                     V1_is_choose}
                                        <- V0_question_info]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19525:16/little,
       D_a_t_a/binary>>};
pack(cli, 19526, {}) ->
    {ok, <<2:32/little, 19526:16/little>>};
pack(srv, 19526,
     {V0_first, V0_rank_info, V0_self_rank}) ->
    D_a_t_a = <<(length(V0_first)):16/little,
                (list_to_binary([<<V1_type:32/little, V1_rid:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:32/little,
                                   (protocol:pack(string, V1_role_name))/binary,
                                   V1_classes:32/little, V1_sex:8/little,
                                   V1_praise:32/little>>
                                 || {V1_type,
                                     {V1_rid, V1_platform, V1_zone_id},
                                     V1_role_name,
                                     V1_classes,
                                     V1_sex,
                                     V1_praise}
                                        <- V0_first]))/binary,
                (length(V0_rank_info)):16/little,
                (list_to_binary([<<V1_rank:32/little, V1_rid:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:32/little,
                                   (protocol:pack(string, V1_role_name))/binary,
                                   V1_classes:32/little, V1_sex:8/little,
                                   V1_flower_num:32/little,
                                   V1_egg_num:32/little, V1_call_num:32/little>>
                                 || {V1_rank,
                                     {V1_rid, V1_platform, V1_zone_id},
                                     V1_role_name,
                                     V1_classes,
                                     V1_sex,
                                     V1_flower_num,
                                     V1_egg_num,
                                     V1_call_num}
                                        <- V0_rank_info]))/binary,
                V0_self_rank:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19526:16/little,
       D_a_t_a/binary>>};
pack(cli, 19527, {}) ->
    {ok, <<2:32/little, 19527:16/little>>};
pack(srv, 19527, {V0_his_lucky_info}) ->
    D_a_t_a = <<(length(V0_his_lucky_info)):16/little,
                (list_to_binary([<<V1_rid:32/little,
                                   (protocol:pack(string, V1_platform))/binary,
                                   V1_zone_id:32/little,
                                   (protocol:pack(string, V1_role_name))/binary,
                                   V1_classes:32/little, V1_sex:8/little,
                                   V1_type:8/little, V1_flower:32/little,
                                   V1_egg:32/little,
                                   (protocol:pack(string, V1_quest))/binary>>
                                 || {{V1_rid, V1_platform, V1_zone_id},
                                     V1_role_name,
                                     V1_classes,
                                     V1_sex,
                                     V1_type,
                                     V1_flower,
                                     V1_egg,
                                     V1_quest}
                                        <- V0_his_lucky_info]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19527:16/little,
       D_a_t_a/binary>>};
pack(cli, 19528, {}) ->
    {ok, <<2:32/little, 19528:16/little>>};
pack(srv, 19528,
     {{V0_rid, V0_platform, V0_zone_id},
      V0_name,
      V0_num,
      V0_min_num,
      V0_max_num}) ->
    D_a_t_a = <<V0_rid:32/little,
                (protocol:pack(string, V0_platform))/binary,
                V0_zone_id:32/little,
                (protocol:pack(string, V0_name))/binary,
                V0_num:32/little, V0_min_num:32/little,
                V0_max_num:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19528:16/little,
       D_a_t_a/binary>>};
pack(cli, 19529, {V0_type}) ->
    D_a_t_a = <<V0_type:32/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19529:16/little,
       D_a_t_a/binary>>};
pack(srv, 19529, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8/little,
                (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19529:16/little,
       D_a_t_a/binary>>};
pack(cli, 19530, {}) ->
    {ok, <<2:32/little, 19530:16/little>>};
pack(srv, 19530, {}) ->
    {ok, <<2:32/little, 19530:16/little>>};
pack(cli, 19531, {V0_flag}) ->
    D_a_t_a = <<V0_flag:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19531:16/little,
       D_a_t_a/binary>>};
pack(srv, 19531, {V0_role_name, V0_timeout}) ->
    D_a_t_a = <<(protocol:pack(string,
                               V0_role_name))/binary,
                V0_timeout:8/little>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32/little, 19531:16/little,
       D_a_t_a/binary>>};
pack(_Type, Code, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
             binary()) -> {ok, tuple()} |
                          {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(srv, 19500, _B0) -> {ok, {}};
unpack(cli, 19500, _B0) ->
    {V1_chapter_now, _B1} = protocol:int16(_B0),
    {V1_num, _B2} = protocol:int16(_B1),
    {V1_chapters, _B26} = protocol:array(_B2,
                                         fun (_B3) ->
                                                 {V2_chapter_id, _B4} =
                                                     protocol:uint16(_B3),
                                                 {V2_status, _B5} =
                                                     protocol:uint8(_B4),
                                                 {V2_strongpoints, _B24} =
                                                     protocol:array(_B5,
                                                                    fun (_B6) ->
                                                                            {V3_strongpoint_id,
                                                                             _B7} =
                                                                                protocol:uint16(_B6),
                                                                            {V3_monsters,
                                                                             _B22} =
                                                                                protocol:array(_B7,
                                                                                               fun
                                                                                                   (_B8) ->
                                                                                                       {V4_unique,
                                                                                                        _B9} =
                                                                                                           protocol:uint16(_B8),
                                                                                                       {V4_monster_id,
                                                                                                        _B10} =
                                                                                                           protocol:uint32(_B9),
                                                                                                       {V4_role_name,
                                                                                                        _B11} =
                                                                                                           protocol:string(_B10),
                                                                                                       {V4_role_sex,
                                                                                                        _B12} =
                                                                                                           protocol:uint8(_B11),
                                                                                                       {V4_role_classes,
                                                                                                        _B13} =
                                                                                                           protocol:uint8(_B12),
                                                                                                       {V4_percent,
                                                                                                        _B14} =
                                                                                                           protocol:uint32(_B13),
                                                                                                       {V4_challenge,
                                                                                                        _B15} =
                                                                                                           protocol:uint8(_B14),
                                                                                                       {V4_rewards,
                                                                                                        _B20} =
                                                                                                           protocol:array(_B15,
                                                                                                                          fun
                                                                                                                              (_B16) ->
                                                                                                                                  {V5_item_id,
                                                                                                                                   _B17} =
                                                                                                                                      protocol:uint32(_B16),
                                                                                                                                  {V5_item_num,
                                                                                                                                   _B18} =
                                                                                                                                      protocol:uint16(_B17),
                                                                                                                                  {{V5_item_id,
                                                                                                                                    V5_item_num},
                                                                                                                                   _B18}
                                                                                                                          end),
                                                                                                       {{V4_unique,
                                                                                                         V4_monster_id,
                                                                                                         V4_role_name,
                                                                                                         V4_role_sex,
                                                                                                         V4_role_classes,
                                                                                                         V4_percent,
                                                                                                         V4_challenge,
                                                                                                         V4_rewards},
                                                                                                        _B20}
                                                                                               end),
                                                                            {{V3_strongpoint_id,
                                                                              V3_monsters},
                                                                             _B22}
                                                                    end),
                                                 {{V2_chapter_id,
                                                   V2_status,
                                                   V2_strongpoints},
                                                  _B24}
                                         end),
    {V1_times, _B27} = protocol:uint16(_B26),
    {V1_boss_times, _B28} = protocol:uint16(_B27),
    {V1_active, _B29} = protocol:uint16(_B28),
    {ok,
     {V1_chapter_now,
      V1_num,
      V1_chapters,
      V1_times,
      V1_boss_times,
      V1_active}};
unpack(srv, 19501, _B0) ->
    {V1_chapter_id, _B1} = protocol:uint16(_B0),
    {V1_strongpoint_id, _B2} = protocol:uint16(_B1),
    {V1_unique, _B3} = protocol:uint32(_B2),
    {ok, {V1_chapter_id, V1_strongpoint_id, V1_unique}};
unpack(cli, 19501, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 19502, _B0) ->
    {V1_chapter_id, _B1} = protocol:uint16(_B0),
    {V1_strongpoint_id, _B2} = protocol:uint16(_B1),
    {ok, {V1_chapter_id, V1_strongpoint_id}};
unpack(cli, 19502, _B0) ->
    {V1_chapter_id, _B1} = protocol:uint16(_B0),
    {V1_strongpoint_id, _B2} = protocol:uint16(_B1),
    {V1_ranks, _B12} = protocol:array(_B2,
                                      fun (_B3) ->
                                              {V2_r_id, _B4} =
                                                  protocol:uint32(_B3),
                                              {V2_platform, _B5} =
                                                  protocol:string(_B4),
                                              {V2_zone_id, _B6} =
                                                  protocol:uint16(_B5),
                                              {V2_role_name, _B7} =
                                                  protocol:string(_B6),
                                              {V2_classes, _B8} =
                                                  protocol:uint8(_B7),
                                              {V2_sex, _B9} =
                                                  protocol:uint8(_B8),
                                              {V2_harm, _B10} =
                                                  protocol:uint32(_B9),
                                              {{V2_r_id,
                                                V2_platform,
                                                V2_zone_id,
                                                V2_role_name,
                                                V2_classes,
                                                V2_sex,
                                                V2_harm},
                                               _B10}
                                      end),
    {ok, {V1_chapter_id, V1_strongpoint_id, V1_ranks}};
unpack(srv, 19503, _B0) ->
    {V1_chapter_id, _B1} = protocol:uint16(_B0),
    {V1_strongpoint_id, _B2} = protocol:uint16(_B1),
    {V1_unique, _B3} = protocol:uint32(_B2),
    {ok, {V1_chapter_id, V1_strongpoint_id, V1_unique}};
unpack(cli, 19503, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 19504, _B0) ->
    {V1_chapter_id, _B1} = protocol:uint16(_B0),
    {V1_strongpoint_id, _B2} = protocol:uint16(_B1),
    {V1_unique, _B3} = protocol:uint32(_B2),
    {ok, {V1_chapter_id, V1_strongpoint_id, V1_unique}};
unpack(cli, 19504, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 19505, _B0) ->
    {V1_chapter_id, _B1} = protocol:uint16(_B0),
    {V1_strongpoint_id, _B2} = protocol:uint16(_B1),
    {V1_unique, _B3} = protocol:uint32(_B2),
    {ok, {V1_chapter_id, V1_strongpoint_id, V1_unique}};
unpack(cli, 19505, _B0) ->
    {V1_chapter_id, _B1} = protocol:uint16(_B0),
    {V1_strongpoint_id, _B2} = protocol:uint16(_B1),
    {V1_unique, _B3} = protocol:uint32(_B2),
    {V1_score, _B4} = protocol:uint32(_B3),
    {V1_max_score, _B5} = protocol:uint32(_B4),
    {V1_max_guild_score, _B6} = protocol:uint32(_B5),
    {V1_rank, _B7} = protocol:uint16(_B6),
    {V1_war_percent, _B8} = protocol:uint32(_B7),
    {V1_monster_id, _B9} = protocol:uint32(_B8),
    {V1_role_name, _B10} = protocol:string(_B9),
    {V1_role_sex, _B11} = protocol:uint8(_B10),
    {V1_role_classes, _B12} = protocol:uint8(_B11),
    {V1_percent, _B13} = protocol:uint32(_B12),
    {V1_challenge, _B14} = protocol:uint8(_B13),
    {ok,
     {V1_chapter_id,
      V1_strongpoint_id,
      V1_unique,
      V1_score,
      V1_max_score,
      V1_max_guild_score,
      V1_rank,
      V1_war_percent,
      V1_monster_id,
      V1_role_name,
      V1_role_sex,
      V1_role_classes,
      V1_percent,
      V1_challenge}};
unpack(srv, 19506, _B0) -> {ok, {}};
unpack(cli, 19506, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 19507, _B0) -> {ok, {}};
unpack(cli, 19507, _B0) ->
    {V1_round, _B1} = protocol:uint8(_B0),
    {V1_dmg, _B2} = protocol:uint32(_B1),
    {V1_score, _B3} = protocol:uint32(_B2),
    {V1_percent, _B4} = protocol:uint16(_B3),
    {V1_harm, _B5} = protocol:uint32(_B4),
    {ok, {V1_round, V1_dmg, V1_score, V1_percent, V1_harm}};
unpack(srv, 19508, _B0) -> {ok, {}};
unpack(cli, 19508, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {ok, {V1_result}};
unpack(srv, 19509, _B0) -> {ok, {}};
unpack(cli, 19509, _B0) ->
    {V1_state, _B1} = protocol:uint32(_B0),
    {V1_time, _B2} = protocol:uint32(_B1),
    {ok, {V1_state, V1_time}};
unpack(srv, 19510, _B0) ->
    {V1_pos, _B1} = protocol:uint8(_B0),
    {ok, {V1_pos}};
unpack(cli, 19510, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 19511, _B0) -> {ok, {}};
unpack(cli, 19511, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 19512, _B0) ->
    {V1_pos, _B1} = protocol:uint8(_B0),
    {ok, {V1_pos}};
unpack(cli, 19512, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 19513, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {V1_question, _B2} = protocol:string(_B1),
    {ok, {V1_type, V1_question}};
unpack(cli, 19513, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 19514, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {V1_id, _B2} = protocol:uint32(_B1),
    {ok, {V1_type, V1_id}};
unpack(cli, 19514, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 19515, _B0) -> {ok, {}};
unpack(cli, 19515, _B0) ->
    {V1_vacancy, _B1} = protocol:uint32(_B0),
    {V1_begin_time, _B2} = protocol:uint32(_B1),
    {V1_now_round, _B3} = protocol:uint32(_B2),
    {V1_max_round, _B4} = protocol:uint32(_B3),
    {V1_pos_info, _B14} = protocol:array(_B4,
                                         fun (_B5) ->
                                                 {V2_rid, _B6} =
                                                     protocol:uint32(_B5),
                                                 {V2_platform, _B7} =
                                                     protocol:string(_B6),
                                                 {V2_zone_id, _B8} =
                                                     protocol:uint32(_B7),
                                                 {V2_role_name, _B9} =
                                                     protocol:string(_B8),
                                                 {V2_sex, _B10} =
                                                     protocol:uint8(_B9),
                                                 {V2_classes, _B11} =
                                                     protocol:uint32(_B10),
                                                 {V2_pos, _B12} =
                                                     protocol:uint32(_B11),
                                                 {{V2_rid,
                                                   V2_platform,
                                                   V2_zone_id,
                                                   V2_role_name,
                                                   V2_sex,
                                                   V2_classes,
                                                   V2_pos},
                                                  _B12}
                                         end),
    {V1_next_pos_info, _B24} = protocol:array(_B14,
                                              fun (_B15) ->
                                                      {V2_rid, _B16} =
                                                          protocol:uint32(_B15),
                                                      {V2_platform, _B17} =
                                                          protocol:string(_B16),
                                                      {V2_zone_id, _B18} =
                                                          protocol:uint32(_B17),
                                                      {V2_role_name, _B19} =
                                                          protocol:string(_B18),
                                                      {V2_sex, _B20} =
                                                          protocol:uint8(_B19),
                                                      {V2_classes, _B21} =
                                                          protocol:uint32(_B20),
                                                      {V2_pos, _B22} =
                                                          protocol:uint32(_B21),
                                                      {{V2_rid,
                                                        V2_platform,
                                                        V2_zone_id,
                                                        V2_role_name,
                                                        V2_sex,
                                                        V2_classes,
                                                        V2_pos},
                                                       _B22}
                                              end),
    {ok,
     {V1_vacancy,
      V1_begin_time,
      V1_now_round,
      V1_max_round,
      V1_pos_info,
      V1_next_pos_info}};
unpack(srv, 19516, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {V1_id, _B2} = protocol:uint32(_B1),
    {V1_flag, _B3} = protocol:uint8(_B2),
    {ok, {V1_type, V1_id, V1_flag}};
unpack(cli, 19516, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 19517, _B0) -> {ok, {}};
unpack(cli, 19517, _B0) ->
    {V1_min_num, _B1} = protocol:uint32(_B0),
    {V1_max_num, _B2} = protocol:uint32(_B1),
    {V1_end_time, _B3} = protocol:uint32(_B2),
    {V1_rid, _B4} = protocol:uint32(_B3),
    {V1_platform, _B5} = protocol:string(_B4),
    {V1_zone_id, _B6} = protocol:uint32(_B5),
    {V1_role_name, _B7} = protocol:string(_B6),
    {V1_sex, _B8} = protocol:uint8(_B7),
    {V1_classes, _B9} = protocol:uint32(_B8),
    {ok,
     {V1_min_num,
      V1_max_num,
      V1_end_time,
      V1_rid,
      V1_platform,
      V1_zone_id,
      V1_role_name,
      V1_sex,
      V1_classes}};
unpack(srv, 19518, _B0) ->
    {V1_num, _B1} = protocol:uint32(_B0),
    {ok, {V1_num}};
unpack(cli, 19518, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 19519, _B0) ->
    {V1_type, _B1} = protocol:uint32(_B0),
    {ok, {V1_type}};
unpack(cli, 19519, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 19520, _B0) -> {ok, {}};
unpack(cli, 19520, _B0) ->
    {V1_type, _B1} = protocol:uint32(_B0),
    {V1_role_name, _B2} = protocol:string(_B1),
    {V1_question, _B3} = protocol:string(_B2),
    {V1_quest_round, _B4} = protocol:uint32(_B3),
    {ok,
     {V1_type, V1_role_name, V1_question, V1_quest_round}};
unpack(srv, 19521, _B0) -> {ok, {}};
unpack(cli, 19521, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint32(_B2),
    {V1_name, _B4} = protocol:string(_B3),
    {V1_sex, _B5} = protocol:uint8(_B4),
    {V1_classes, _B6} = protocol:uint32(_B5),
    {ok,
     {V1_rid,
      V1_platform,
      V1_zone_id,
      V1_name,
      V1_sex,
      V1_classes}};
unpack(srv, 19522, _B0) -> {ok, {}};
unpack(cli, 19522, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 19523, _B0) ->
    {V1_type, _B1} = protocol:uint32(_B0),
    {ok, {V1_type}};
unpack(cli, 19523, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 19524, _B0) -> {ok, {}};
unpack(cli, 19524, _B0) ->
    {V1_is_pass, _B1} = protocol:uint8(_B0),
    {V1_flower, _B2} = protocol:uint32(_B1),
    {V1_egg, _B3} = protocol:uint32(_B2),
    {V1_watch, _B4} = protocol:uint32(_B3),
    {V1_flower_list, _B13} = protocol:array(_B4,
                                            fun (_B5) ->
                                                    {V2_id, _B6} =
                                                        protocol:uint32(_B5),
                                                    {V2_platform, _B7} =
                                                        protocol:string(_B6),
                                                    {V2_zone_id, _B8} =
                                                        protocol:uint32(_B7),
                                                    {V2_role_name, _B9} =
                                                        protocol:string(_B8),
                                                    {V2_sex, _B10} =
                                                        protocol:uint8(_B9),
                                                    {V2_classes, _B11} =
                                                        protocol:uint32(_B10),
                                                    {{V2_id,
                                                      V2_platform,
                                                      V2_zone_id,
                                                      V2_role_name,
                                                      V2_sex,
                                                      V2_classes},
                                                     _B11}
                                            end),
    {V1_egg_list, _B22} = protocol:array(_B13,
                                         fun (_B14) ->
                                                 {V2_id, _B15} =
                                                     protocol:uint32(_B14),
                                                 {V2_platform, _B16} =
                                                     protocol:string(_B15),
                                                 {V2_zone_id, _B17} =
                                                     protocol:uint32(_B16),
                                                 {V2_role_name, _B18} =
                                                     protocol:string(_B17),
                                                 {V2_sex, _B19} =
                                                     protocol:uint8(_B18),
                                                 {V2_classes, _B20} =
                                                     protocol:uint32(_B19),
                                                 {{V2_id,
                                                   V2_platform,
                                                   V2_zone_id,
                                                   V2_role_name,
                                                   V2_sex,
                                                   V2_classes},
                                                  _B20}
                                         end),
    {V1_call_list, _B31} = protocol:array(_B22,
                                          fun (_B23) ->
                                                  {V2_id, _B24} =
                                                      protocol:uint32(_B23),
                                                  {V2_platform, _B25} =
                                                      protocol:string(_B24),
                                                  {V2_zone_id, _B26} =
                                                      protocol:uint32(_B25),
                                                  {V2_role_name, _B27} =
                                                      protocol:string(_B26),
                                                  {V2_sex, _B28} =
                                                      protocol:uint8(_B27),
                                                  {V2_classes, _B29} =
                                                      protocol:uint32(_B28),
                                                  {{V2_id,
                                                    V2_platform,
                                                    V2_zone_id,
                                                    V2_role_name,
                                                    V2_sex,
                                                    V2_classes},
                                                   _B29}
                                          end),
    {ok,
     {V1_is_pass,
      V1_flower,
      V1_egg,
      V1_watch,
      V1_flower_list,
      V1_egg_list,
      V1_call_list}};
unpack(srv, 19525, _B0) -> {ok, {}};
unpack(cli, 19525, _B0) ->
    {V1_ver, _B1} = protocol:uint32(_B0),
    {V1_question_info, _B9} = protocol:array(_B1,
                                             fun (_B2) ->
                                                     {V2_type, _B3} =
                                                         protocol:uint32(_B2),
                                                     {V2_id, _B4} =
                                                         protocol:uint32(_B3),
                                                     {V2_question, _B5} =
                                                         protocol:string(_B4),
                                                     {V2_role_name, _B6} =
                                                         protocol:string(_B5),
                                                     {V2_is_choose, _B7} =
                                                         protocol:uint8(_B6),
                                                     {{V2_type,
                                                       V2_id,
                                                       V2_question,
                                                       V2_role_name,
                                                       V2_is_choose},
                                                      _B7}
                                             end),
    {ok, {V1_ver, V1_question_info}};
unpack(srv, 19526, _B0) -> {ok, {}};
unpack(cli, 19526, _B0) ->
    {V1_first, _B11} = protocol:array(_B0,
                                      fun (_B1) ->
                                              {V2_type, _B2} =
                                                  protocol:uint32(_B1),
                                              {V2_rid, _B3} =
                                                  protocol:uint32(_B2),
                                              {V2_platform, _B4} =
                                                  protocol:string(_B3),
                                              {V2_zone_id, _B5} =
                                                  protocol:uint32(_B4),
                                              {V2_role_name, _B6} =
                                                  protocol:string(_B5),
                                              {V2_classes, _B7} =
                                                  protocol:uint32(_B6),
                                              {V2_sex, _B8} =
                                                  protocol:uint8(_B7),
                                              {V2_praise, _B9} =
                                                  protocol:uint32(_B8),
                                              {{V2_type,
                                                V2_rid,
                                                V2_platform,
                                                V2_zone_id,
                                                V2_role_name,
                                                V2_classes,
                                                V2_sex,
                                                V2_praise},
                                               _B9}
                                      end),
    {V1_rank_info, _B24} = protocol:array(_B11,
                                          fun (_B12) ->
                                                  {V2_rank, _B13} =
                                                      protocol:uint32(_B12),
                                                  {V2_rid, _B14} =
                                                      protocol:uint32(_B13),
                                                  {V2_platform, _B15} =
                                                      protocol:string(_B14),
                                                  {V2_zone_id, _B16} =
                                                      protocol:uint32(_B15),
                                                  {V2_role_name, _B17} =
                                                      protocol:string(_B16),
                                                  {V2_classes, _B18} =
                                                      protocol:uint32(_B17),
                                                  {V2_sex, _B19} =
                                                      protocol:uint8(_B18),
                                                  {V2_flower_num, _B20} =
                                                      protocol:uint32(_B19),
                                                  {V2_egg_num, _B21} =
                                                      protocol:uint32(_B20),
                                                  {V2_call_num, _B22} =
                                                      protocol:uint32(_B21),
                                                  {{V2_rank,
                                                    V2_rid,
                                                    V2_platform,
                                                    V2_zone_id,
                                                    V2_role_name,
                                                    V2_classes,
                                                    V2_sex,
                                                    V2_flower_num,
                                                    V2_egg_num,
                                                    V2_call_num},
                                                   _B22}
                                          end),
    {V1_self_rank, _B25} = protocol:uint32(_B24),
    {ok, {V1_first, V1_rank_info, V1_self_rank}};
unpack(srv, 19527, _B0) -> {ok, {}};
unpack(cli, 19527, _B0) ->
    {V1_his_lucky_info, _B13} = protocol:array(_B0,
                                               fun (_B1) ->
                                                       {V2_rid, _B2} =
                                                           protocol:uint32(_B1),
                                                       {V2_platform, _B3} =
                                                           protocol:string(_B2),
                                                       {V2_zone_id, _B4} =
                                                           protocol:uint32(_B3),
                                                       {V2_role_name, _B5} =
                                                           protocol:string(_B4),
                                                       {V2_classes, _B6} =
                                                           protocol:uint32(_B5),
                                                       {V2_sex, _B7} =
                                                           protocol:uint8(_B6),
                                                       {V2_type, _B8} =
                                                           protocol:uint8(_B7),
                                                       {V2_flower, _B9} =
                                                           protocol:uint32(_B8),
                                                       {V2_egg, _B10} =
                                                           protocol:uint32(_B9),
                                                       {V2_quest, _B11} =
                                                           protocol:string(_B10),
                                                       {{V2_rid,
                                                         V2_platform,
                                                         V2_zone_id,
                                                         V2_role_name,
                                                         V2_classes,
                                                         V2_sex,
                                                         V2_type,
                                                         V2_flower,
                                                         V2_egg,
                                                         V2_quest},
                                                        _B11}
                                               end),
    {ok, {V1_his_lucky_info}};
unpack(srv, 19528, _B0) -> {ok, {}};
unpack(cli, 19528, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_platform, _B2} = protocol:string(_B1),
    {V1_zone_id, _B3} = protocol:uint32(_B2),
    {V1_name, _B4} = protocol:string(_B3),
    {V1_num, _B5} = protocol:uint32(_B4),
    {V1_min_num, _B6} = protocol:uint32(_B5),
    {V1_max_num, _B7} = protocol:uint32(_B6),
    {ok,
     {V1_rid,
      V1_platform,
      V1_zone_id,
      V1_name,
      V1_num,
      V1_min_num,
      V1_max_num}};
unpack(srv, 19529, _B0) ->
    {V1_type, _B1} = protocol:uint32(_B0),
    {ok, {V1_type}};
unpack(cli, 19529, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(srv, 19530, _B0) -> {ok, {}};
unpack(cli, 19530, _B0) -> {ok, {}};
unpack(srv, 19531, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {ok, {V1_flag}};
unpack(cli, 19531, _B0) ->
    {V1_role_name, _B1} = protocol:string(_B0),
    {V1_timeout, _B2} = protocol:uint8(_B1),
    {ok, {V1_role_name, V1_timeout}};
unpack(_Type, Code, _Data) ->
    {error, {unknown_unpack_command, Code}}.

