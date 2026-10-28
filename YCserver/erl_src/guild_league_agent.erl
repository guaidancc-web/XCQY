-file("src/mod/guild/guild_league_agent.erl", 1).

-module(guild_league_agent).

-behaviour(gen_server).

-export([start_link/0,
         start_enrolling/0,
         collect_update/0,
         season_enroll/0,
         sync_matched/1,
         sync_data/1,
         sync_champion/1,
         match_fail/1,
         reward_guild/1,
         sync_log_index/1,
         update_rank/1,
         update_grade_rank/1,
         get_proto17619/1,
         get_proto17628/1,
         list_log/2,
         get_rank/1,
         get_log_result/1,
         get_logs/2,
         get_champion_tree/1,
         set_state/1,
         change_status/1,
         guess/1,
         get_guessed/1,
         shift/1,
         get_statue_id/1,
         list_champion/0,
         guild_callback/2,
         gm/1]).

-export([init/1,
         handle_call/3,
         handle_cast/2,
         handle_info/2,
         terminate/2,
         code_change/3]).

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

-file("src/mod/guild/guild_league_agent.erl", 42).

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

-file("src/mod/guild/guild_league_agent.erl", 43).

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

-file("src/mod/guild/guild_league_agent.erl", 44).

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

-file("src/mod/guild/guild_league_agent.erl", 45).

-file("inc/guild_league.hrl", 1).

-record(guild_league_role,
        {id = {0, "", 0} :: tuple(),
         gid = {0, "", 0} :: tuple(),
         ver = 1,
         name = "" :: bitstring(),
         sex = 0 :: 0..1,
         classes = 0 :: 0..4,
         lev = 0 :: non_neg_integer(),
         win = 0 :: non_neg_integer(),
         lost = 0 :: non_neg_integer(),
         to_war = 0,
         movability = 500 :: non_neg_integer(),
         match_id = 0 :: non_neg_integer(),
         side = 1,
         pid :: undefined | reference(),
         phase = 0 :: non_neg_integer(),
         season = 0 :: non_neg_integer(),
         key = {{0, "", 0}, 0},
         last_killed = 0 :: non_neg_integer(),
         picked = 0 :: non_neg_integer(),
         last_win = 0 :: non_neg_integer(),
         score = 0 :: non_neg_integer(),
         is_trump = 0,
         operating_unit = 0 :: 0 | tuple(),
         last_operated = 0 :: non_neg_integer(),
         attacked_unit = 0 :: non_neg_integer(),
         guarded_unit = 0 :: non_neg_integer(),
         cannon_attacked = 0 :: non_neg_integer(),
         cannon_used = 0 :: non_neg_integer(),
         guarding_unit = 0 :: non_neg_integer(),
         operating_num = 0 :: non_neg_integer()}).

-record(guild_league_guild,
        {id = {0, "", 0} :: tuple(),
         key = {{0, "", 0}, 0, 0},
         ver = 5,
         name = "" :: bitstring(),
         lev = 0 :: non_neg_integer(),
         leader_name = "" :: list(),
         leader_id = {0, "", 0} ::
             {non_neg_integer(), list(), non_neg_integer()},
         match_id = 0 :: non_neg_integer(),
         member_num = 0 :: non_neg_integer(),
         win = 0 :: non_neg_integer(),
         side = 1,
         totem = 0 :: non_neg_integer(),
         phase = 0 :: non_neg_integer(),
         grade = 4 :: non_neg_integer(),
         season = 0 :: non_neg_integer(),
         group = 0 :: non_neg_integer(),
         order = 0 :: non_neg_integer(),
         time = 0 :: non_neg_integer(),
         is_win = 0 :: non_neg_integer(),
         score = 0 :: non_neg_integer(),
         strenth = 0 :: non_neg_integer(),
         members = [],
         trumps = [],
         attacked_unit = 0 :: non_neg_integer(),
         consecutive_win = 0 :: non_neg_integer(),
         season_consecutive_win = 0 :: non_neg_integer(),
         avg_lev = 0 :: non_neg_integer(),
         eliminated = 8 :: non_neg_integer()}).

-record(guild_league_match,
        {id = {0, 0} :: {non_neg_integer(), non_neg_integer()},
         pid :: undefined | pid(),
         map_id = 0 :: non_neg_integer(),
         map_pid = 0 :: pid(),
         battle_id = 0 :: non_neg_integer(),
         battle_pid = 0 :: pid(),
         win_side = 0,
         time = 0 :: non_neg_integer(),
         phase = 0,
         season = 0 :: non_neg_integer(),
         combat_time = 0,
         is_judge = false,
         can_join = false,
         cannon_ready = false,
         later_phase = 0 :: non_neg_integer(),
         grade = 0 :: non_neg_integer(),
         type = 0 :: non_neg_integer()}).

-record(guild_league_alliance,
        {id = {0, 0} :: {integer(), integer()},
         gids = [] :: list(),
         names = [],
         totems = [] :: list(),
         win = 0 :: non_neg_integer(),
         lost = 0 :: non_neg_integer(),
         movability = 0 :: non_neg_integer(),
         member_num = 0 :: non_neg_integer(),
         members = [],
         remain_num = 0,
         match_id = 0 :: non_neg_integer(),
         side = 1,
         totem = 0 :: non_neg_integer(),
         map_id = 0 :: non_neg_integer(),
         map_pid = 0 :: pid(),
         phase = 0 :: non_neg_integer(),
         season = 0 :: non_neg_integer(),
         time = 0 :: non_neg_integer(),
         is_win = 0 :: non_neg_integer(),
         score = 0 :: non_neg_integer(),
         duration = 0 :: non_neg_integer(),
         attacked_unit = 0 :: non_neg_integer(),
         guarded_unit = 0 :: non_neg_integer(),
         remain_unit = 3 :: non_neg_integer(),
         grade = 4 :: non_neg_integer(),
         subsidize_buff = [] :: list()}).

-record(guild_league_trump,
        {id = {0, "", 0} :: tuple(),
         gid = {0, "", 0} :: tuple(),
         name = "" :: bitstring(),
         sex = 0 :: 0..1,
         classes = 0 :: 0..4,
         lev = 0 :: non_neg_integer(),
         pos = 1 :: non_neg_integer()}).

-record(guild_league_unit,
        {id = {0, 0} :: tuple(),
         phase = 0,
         season = 0 :: non_neg_integer(),
         grade = 4 :: non_neg_integer(),
         match_id = 0 :: non_neg_integer(),
         battle_id = 0 :: non_neg_integer(),
         side = 0,
         duration = 1000 :: non_neg_integer(),
         operators = [] :: list(),
         last_operated = 0 :: non_neg_integer()}).

-record(guild_league_operator,
        {id = {0, "", 0} :: tuple(),
         gid = {0, "", 0} :: tuple(),
         name = "" :: bitstring(),
         sex = 0 :: 0..1,
         classes = 0 :: 0..4,
         lev = 0 :: non_neg_integer(),
         side = 0,
         timeout = 0 :: non_neg_integer()}).

-record(guild_league_summary,
        {id = {0, "", 0} :: tuple(),
         ver = 4,
         name = "" :: bitstring(),
         lev = 0 :: non_neg_integer(),
         leader_name = "" :: list(),
         leader_id = {0, "", 0} ::
             {non_neg_integer(), list(), non_neg_integer()},
         member_num = 0 :: non_neg_integer(),
         season_win = 0 :: non_neg_integer(),
         season_lost = 0 :: non_neg_integer(),
         season_draw = 0 :: non_neg_integer(),
         total_win = 0 :: non_neg_integer(),
         totem = 0 :: non_neg_integer(),
         season_score = 0 :: non_neg_integer(),
         total_score = 0 :: non_neg_integer(),
         grade = 4 :: non_neg_integer(),
         rank = 0 :: non_neg_integer(),
         group = 0 :: non_neg_integer(),
         order = 0 :: non_neg_integer(),
         recent_matchs = [] :: list(),
         absence = 0 :: non_neg_integer(),
         attacked_unit = 0 :: non_neg_integer(),
         last_result = 0 :: non_neg_integer(),
         strenth = 0 :: non_neg_integer(),
         consecutive_win = 0 :: non_neg_integer(),
         season_consecutive_win = 0 :: non_neg_integer(),
         eliminated = 8 :: non_neg_integer()}).

-record(guild_league_guess,
        {id = {0, "", 0} :: tuple(),
         ver = 0 :: non_neg_integer(),
         name = "" :: bitstring(),
         sex = 0 :: 0..1,
         classes = 0 :: 0..4,
         lev = 0 :: non_neg_integer(),
         season = 0 :: non_neg_integer(),
         choices = [] :: list(),
         time = 0 :: non_neg_integer()}).

-record(guild_league_guess_choice,
        {gid = {0, "", 0} :: tuple(),
         phase = 0 :: non_neg_integer(),
         bingo = 0 :: 0..2}).

-record(guild_league_poll,
        {gid = {0, "", 0} :: tuple(),
         phase = 0 :: non_neg_integer(),
         voted = 0 :: non_neg_integer()}).

-record(guild_league_live,
        {id = 0 :: non_neg_integer(),
         phase = 0 :: non_neg_integer(),
         season = 0 :: non_neg_integer(),
         grade = 0 :: non_neg_integer(),
         type = 0 :: non_neg_integer(),
         time = 0 :: non_neg_integer(),
         names1 = [] :: string(),
         names2 = [] :: string(),
         logs = [] :: list()}).

-record(guild_league_champion,
        {season = 0 :: non_neg_integer(), top3 = []}).

-file("src/mod/guild/guild_league_agent.erl", 46).

-record(state,
        {phase = 1 :: non_neg_integer(),
         season = 0 :: non_neg_integer(),
         status = 0,
         status_ref :: undefined | reference(),
         voting = [],
         voting_ref :: undefined | reference()}).

start_enrolling() ->
    case world_lev:get_world_lev() of
        {Wlv, _} when Wlv < 80 -> ok;
        _ ->
            guild_league_agent ! {set_state, 1, 1},
            case guild_league_guild:get_qualified() of
                [H | T] ->
                    big_world:cast(guild_league, enroll, [[H | T]]),
                    ets:delete_all_objects(guild_league_guild),
                    ets:delete_all_objects(guild_league_alliance),
                    ets:delete_all_objects(guild_league_role);
                _ -> ok
            end
    end,
    ok.

collect_update() ->
    case world_lev:get_world_lev() of
        {Wlv, _} when Wlv < 80 -> ok;
        _ ->
            logger:debug("=================================",
                         [],
                         guild_league_agent,
                         106),
            L1 = ets:match(guild_league_summary,
                           #guild_league_summary{id = '$1', _ = '_'}),
            L2 = do_collect_update(L1),
            L3 = guild_league_guild:calc_strenth(L2,
                                                 date:unixtime()),
            big_world:cast(guild_league, enroll, [L3]),
            ets:delete_all_objects(guild_league_guild),
            ets:delete_all_objects(guild_league_alliance),
            ets:delete_all_objects(guild_league_role),
            ok
    end.

season_enroll() ->
    case world_lev:get_world_lev() of
        {Wlv, _} when Wlv < 80 -> ok;
        _ ->
            case guild_league_guild:get_qualified() of
                [H | T] ->
                    big_world:cast(guild_league, enroll, [[H | T]]);
                _ -> ok
            end
    end,
    ok.

sync_matched(#{phase := Phase, season := Season,
               alliances := Alliances, guilds := Guilds}) ->
    guild_league_guild:update(Alliances),
    guild_league_guild:update(Guilds),
    notice_matched([G
                    || G = #guild_league_guild{id = Id} <- Guilds,
                       role_misc:is_local_role(Id)],
                   Guilds),
    guild_league_agent ! {set_state, Phase, Season}.

set_state(#{phase := Phase, season := Season}) ->
    guild_league_agent ! {set_state, Phase, Season}.

change_status({Status, Timeout}) ->
    role_group:pack_send(world, 17600, {Status, Timeout}),
    guild_league_agent ! {change_status, Status}.

sync_data(R = #guild_league_role{pid = Pid}) ->
    guild_league_guild:update(R),
    role:apply(async,
               Pid,
               {guild_league_role, callback, [{push, 17605}]});
sync_data(U = #guild_league_unit{}) ->
    guild_league_unit:update(U);
sync_data(Live = #guild_league_live{}) ->
    guild_league_live:update(Live);
sync_data(Data) -> guild_league_guild:update(Data).

sync_champion(Champion = #guild_league_champion{top3 =
                                                    Top3 = [{Id, _, _, _}
                                                            | _]}) ->
    GNames = string:join([notice:format(lang:get("~ts的~ts"),
                                        [{string_2,
                                          1,
                                          server_list_data:get_server_name({P,
                                                                            Z})},
                                         {string_2, 2, Name}])
                          || {{_, P, Z}, Name, _, _} <- Top3],
                         "、"),
    Msg =
        notice:format(lang:get("本届冠军联赛到此谢幕，恭喜~ts分别获得冠、亚、季军。新的赛季就要开始了，大家加油！！！"),
                      [{string_1, GNames}]),
    notice:cast(all, 5, Msg),
    replace_statue(Id),
    reward_fighter(Id),
    Honors = top3_to_honor(Top3, 1),
    honor_mgr:replace(guild_league_champion, Honors, 0),
    guild_league_guild:update(Champion);
sync_champion(_) -> ok.

match_fail(#guild_league_guild{id = Id1}) ->
    {Items, Assets} = {[{23014, 2}], 1000000},
    guild_loot:add(Id1, Items),
    guild_common:add_assets(Id1, {not_weekly, Assets}),
    Content =
        notice:format(lang:get("由于参与冠军联赛的公会总数为奇数，本轮你的公会轮空。直接获得冠军联赛胜利，获得~ts公会资"
                               "金、~ts。下一轮冠军联赛必定不轮空，希望公会加紧发展，积极备战！"),
                      [{string_2, 5, Assets}, {item_2, Items}]),
    Msg =
        notice:format(lang:get("本轮冠军联赛轮空，不战而胜，获得~ts公会资金、~ts。{face_1, "
                               "18}"),
                      [{string_2, 5, Assets}, {item_2, Items}]),
    guild:notice(Id1, Msg),
    guild_mgr:apply(async,
                    Id1,
                    {guild_common,
                     sync_send_mail,
                     [#{content => Content,
                        from_name => lang:get("冠军联赛议事厅")}]}),
    ok.

reward_guild(Args = #{gid := Gid = {_, LP, LZ},
                      gname := GName, type := Type, name := Name, grade := 1,
                      phase := 7, consecutive_win := ConsecutiveWin}) ->
    Pref = case Type of
               win -> lang:get("冠军联赛胜利！");
               _ -> lang:get("冠军联赛结束！")
           end,
    {Items, Assets} = case Type of
                          win -> {[{23014, 8}], 2000000};
                          _ -> {[{23014, 2}], 500000}
                      end,
    guild_loot:add(Gid, Items, Pref),
    guild_common:add_assets(Gid, {not_weekly, Assets}),
    Fmt = case Type of
              win ->
                  lang:get("在大家的骁勇奋战之下，本会在冠军联赛中~ts~ts，获得公会和~ts公会资金，真是大快人心"
                           "{face_1,18}");
              _ ->
                  lang:get("虽然大家努力奋战，但本会仍遗憾~ts~ts，仅获得了~ts公会资金，成员们纷纷表示要发愤图"
                           "强{face_1,1}")
          end,
    ResultStr = case Type of
                    win -> lang:get("战胜");
                    _ -> lang:get("败于")
                end,
    Honor = case {ConsecutiveWin, Type} of
                {4, _} -> lang:get("冠军");
                {3, _} -> lang:get("亚军");
                {2, win} -> lang:get("季军");
                _ -> lang:get("殿军")
            end,
    MailFmt = case Type of
                  win ->
                      lang:get("历经了一个月的辛苦鏖战，本公会最终成功击败了~ts的~ts，获得了冠军联赛~ts。奖励属于"
                               "你们，荣耀属于你们，你们是最棒的！{face_1,7}");
                  _ ->
                      lang:get("历经了一个月的辛苦鏖战，本公会最终惜败于~ts的~ts，获得了冠军联赛~ts。下届再战！{"
                               "face_1,7}")
              end,
    case Args of
        #{rival_gid := [{_, P, Z} | _]} ->
            AnnStr = case Type of
                         win ->
                             AnnFmt =
                                 lang:get("冠军联赛中，~ts不负众望，在与~ts的~ts对阵中赢得胜利、捍卫了~ts的荣誉{face"
                                          "_1,18}"),
                             notice:format(AnnFmt,
                                           [{string_2, 2, GName},
                                            {string_2,
                                             1,
                                             server_list_data:get_server_name({P,
                                                                               Z})},
                                            {string_2, 2, Name},
                                            {string_2,
                                             1,
                                             server_list_data:get_server_name({LP,
                                                                               LZ})}]);
                         _ ->
                             AnnFmt =
                                 lang:get("~ts在与~ts的~ts冠军联赛对阵中惜败对手，但打出了~ts的风采{face_1,38}"),
                             notice:format(AnnFmt,
                                           [{string_2, 2, GName},
                                            {string_2,
                                             1,
                                             server_list_data:get_server_name({P,
                                                                               Z})},
                                            {string_2, 2, Name},
                                            {string_2,
                                             1,
                                             server_list_data:get_server_name({LP,
                                                                               LZ})}])
                     end,
            MailContent = notice:format(MailFmt,
                                        [{string_2,
                                          1,
                                          server_list_data:get_server_name({P,
                                                                            Z})},
                                         {string_2, 2, Name},
                                         {string_2, 2, Honor}]),
            guild_common:send_mail(Gid, "", MailContent),
            notice:cast(all, 5, AnnStr);
        _ -> ok
    end,
    Msg = notice:format(Fmt,
                        [{string_2, 5, ResultStr},
                         {string_2, 2, Name},
                         {string_2, 5, Assets}]),
    guild:notice(Gid, Msg);
reward_guild(Args = #{gid := Gid = {_, LP, LZ},
                      gname := GName, type := Type, name := Name, grade := 1,
                      phase := 6, eliminated := Eliminated}) ->
    Pref = case Type of
               win -> lang:get("冠军联赛胜利！");
               _ -> lang:get("冠军联赛结束！")
           end,
    {Items, Assets} = case Type of
                          win -> {[{23014, 8}], 2000000};
                          _ -> {[{23014, 2}], 500000}
                      end,
    guild_loot:add(Gid, Items, Pref),
    guild_common:add_assets(Gid, {not_weekly, Assets}),
    Fmt = case Type of
              win ->
                  lang:get("在大家的骁勇奋战之下，本会在冠军联赛中~ts~ts，获得公会和~ts公会资金，真是大快人心"
                           "{face_1,18}");
              _ ->
                  lang:get("虽然大家努力奋战，但本会仍遗憾~ts~ts，仅获得了~ts公会资金，成员们纷纷表示要发愤图"
                           "强{face_1,1}")
          end,
    ResultStr = case Type of
                    win -> lang:get("战胜");
                    _ -> lang:get("败于")
                end,
    RaceType = case Type of
                   win -> lang:get("总决赛");
                   _ -> lang:get("季军赛")
               end,
    MailFmt = case Type of
                  win ->
                      lang:get("一场大战之后，本公会成功击败了~ts的~ts，闯进了冠军联赛~ts。总决赛将于~ts举行，"
                               "距离总冠军只有一步之遥了，大家加油！{face_1,7}");
                  _ ->
                      lang:get("一场大战之后，本公会惜败于~ts的~ts，~ts将于~ts举行，所有成员请准时参加，本次比"
                               "赛将决出3、4名。不能拿前两名，也绝不放弃第三名！{face_1,7}")
              end,
    case Args of
        #{rival_gid := [{_, P, Z} | _]} ->
            AnnStr = case Type of
                         win ->
                             AnnFmt =
                                 lang:get("冠军联赛中，~ts不负众望，在与~ts的~ts对阵中赢得胜利、捍卫了~ts的荣誉{face"
                                          "_1,18}"),
                             notice:format(AnnFmt,
                                           [{string_2, 2, GName},
                                            {string_2,
                                             1,
                                             server_list_data:get_server_name({P,
                                                                               Z})},
                                            {string_2, 2, Name},
                                            {string_2,
                                             1,
                                             server_list_data:get_server_name({LP,
                                                                               LZ})}]);
                         _ ->
                             AnnFmt =
                                 lang:get("~ts在与~ts的~ts冠军联赛对阵中惜败对手，但打出了~ts的风采{face_1,38}"),
                             notice:format(AnnFmt,
                                           [{string_2, 2, GName},
                                            {string_2,
                                             1,
                                             server_list_data:get_server_name({P,
                                                                               Z})},
                                            {string_2, 2, Name},
                                            {string_2,
                                             1,
                                             server_list_data:get_server_name({LP,
                                                                               LZ})}])
                     end,
            case Eliminated >= 6 of
                true ->
                    TimeStr = case agenda_data:get(2106) of
                                  #{starttime := St1} ->
                                      case calendar:seconds_to_time(St1) of
                                          {H, M, _} when M < 10 ->
                                              util:flist(lang:get("下周一~w:0~w"),
                                                         [H, M]);
                                          {H, M, _} ->
                                              util:flist(lang:get("下周一~w:~w"),
                                                         [H, M])
                                      end;
                                  _ -> lang:get("下周一21：30")
                              end,
                    MailContent = notice:format(MailFmt,
                                                [{string_2,
                                                  1,
                                                  server_list_data:get_server_name({P,
                                                                                    Z})},
                                                 {string_2, 2, Name},
                                                 {string_2, 5, RaceType},
                                                 {string_2, 5, TimeStr}]),
                    guild_common:send_mail(Gid, "", MailContent);
                _ -> ok
            end,
            notice:cast(all, 5, AnnStr);
        _ -> ok
    end,
    Msg = notice:format(Fmt,
                        [{string_2, 5, ResultStr},
                         {string_2, 2, Name},
                         {string_2, 5, Assets}]),
    guild:notice(Gid, Msg);
reward_guild(Args = #{gid := Gid = {_, LP, LZ},
                      gname := GName, type := Type, name := Name, grade := 1,
                      phase := Phase, eliminated := Eliminated}) ->
    Pref = case Type of
               win -> lang:get("冠军联赛胜利！");
               _ -> lang:get("冠军联赛结束！")
           end,
    {Items, Assets} = case Type of
                          win -> {[{23014, 8}], 2000000};
                          _ -> {[{23014, 2}], 500000}
                      end,
    guild_loot:add(Gid, Items, Pref),
    guild_common:add_assets(Gid, {not_weekly, Assets}),
    Fmt = case Type of
              win ->
                  lang:get("在大家的骁勇奋战之下，本会在冠军联赛中~ts~ts，获得公会和~ts公会资金，真是大快人心"
                           "{face_1,18}");
              _ ->
                  lang:get("虽然大家努力奋战，但本会仍遗憾~ts~ts，仅获得了~ts公会资金，成员们纷纷表示要发愤图"
                           "强{face_1,1}")
          end,
    ResultStr = case Type of
                    win -> lang:get("战胜");
                    _ -> lang:get("败于")
                end,
    TopNum = case {Phase, Type} of
                 {4, win} -> lang:get("8强");
                 {4, _} -> lang:get("16强");
                 {5, win} -> lang:get("4强");
                 _ -> lang:get("8强")
             end,
    MailFmt = case Type of
                  win ->
                      lang:get("一场大战之后，本公会在冠军联赛中成功击败了~ts~ts，晋级到~ts。希望公会各成员再接再"
                               "厉，继续努力，向总冠军迈进！{face_1,7}");
                  _ ->
                      lang:get("一场大战之后，本公会在冠军联赛中惜败于~ts~ts，止步~ts。没有关系，下届冠军联赛我们"
                               "再战，誓要夺取总冠军！{face_1,7}")
              end,
    case Args of
        #{rival_gid := [{_, P, Z} | _]} ->
            AnnStr = case Type of
                         win ->
                             AnnFmt =
                                 lang:get("冠军联赛中，~ts不负众望，在与~ts的~ts对阵中赢得胜利、捍卫了~ts的荣誉{face"
                                          "_1,18}"),
                             notice:format(AnnFmt,
                                           [{string_2, 2, GName},
                                            {string_2,
                                             1,
                                             server_list_data:get_server_name({P,
                                                                               Z})},
                                            {string_2, 2, Name},
                                            {string_2,
                                             1,
                                             server_list_data:get_server_name({LP,
                                                                               LZ})}]);
                         _ ->
                             AnnFmt =
                                 lang:get("~ts在与~ts的~ts冠军联赛对阵中惜败对手，但打出了~ts的风采{face_1,38}"),
                             notice:format(AnnFmt,
                                           [{string_2, 2, GName},
                                            {string_2,
                                             1,
                                             server_list_data:get_server_name({P,
                                                                               Z})},
                                            {string_2, 2, Name},
                                            {string_2,
                                             1,
                                             server_list_data:get_server_name({LP,
                                                                               LZ})}])
                     end,
            case Eliminated >= Phase of
                true ->
                    MailContent = notice:format(MailFmt,
                                                [{string_2,
                                                  1,
                                                  server_list_data:get_server_name({P,
                                                                                    Z})},
                                                 {string_2, 2, Name},
                                                 {string_2, 5, TopNum}]),
                    guild_common:send_mail(Gid, "", MailContent),
                    notice:cast(all, 5, AnnStr);
                _ -> ok
            end;
        _ -> ok
    end,
    Msg = notice:format(Fmt,
                        [{string_2, 5, ResultStr},
                         {string_2, 2, Name},
                         {string_2, 5, Assets}]),
    guild:notice(Gid, Msg);
reward_guild(Args = #{gid := Gid = {_, LP, LZ},
                      gname := GName, type := Type, name := Name,
                      unit_score := UnitScore}) ->
    Pref = case Type of
               win -> lang:get("冠军联赛胜利！");
               _ -> lang:get("冠军联赛结束！")
           end,
    {Items, Assets} = case UnitScore of
                          3 -> {[{23014, 8}], 2000000};
                          2 -> {[{23014, 6}], 1500000};
                          1 -> {[{23014, 3}], 1000000};
                          _ -> {[{23014, 2}], 500000}
                      end,
    guild_loot:add(Gid, Items, Pref),
    guild_common:add_assets(Gid, {not_weekly, Assets}),
    Fmt = case Type of
              win ->
                  lang:get("在大家的骁勇奋战之下，本会在冠军联赛中~ts~ts，获得公会和~ts公会资金，真是大快人心"
                           "{face_1,18}");
              lost ->
                  lang:get("虽然大家努力奋战，但本会仍遗憾~ts~ts，仅获得了~ts公会资金，成员们纷纷表示要发愤图"
                           "强{face_1,1}");
              _ ->
                  lang:get("虽然大家努力奋战，但本会仍遗憾~ts~ts，仅获得了~ts公会资金，成员们纷纷表示要发愤图"
                           "强{face_1,1}")
          end,
    ResultStr = case UnitScore of
                    3 -> lang:get("完胜");
                    2 -> lang:get("战胜");
                    1 -> lang:get("战平");
                    _ -> lang:get("败于")
                end,
    case Args of
        #{rival_gid := [{_, P, Z} | _]} ->
            AnnStr = case Type of
                         win ->
                             AnnFmt =
                                 lang:get("冠军联赛中，~ts不负众望，在与~ts的~ts对阵中赢得胜利、捍卫了~ts的荣誉{face"
                                          "_1,18}"),
                             notice:format(AnnFmt,
                                           [{string_2, 2, GName},
                                            {string_2,
                                             1,
                                             server_list_data:get_server_name({P,
                                                                               Z})},
                                            {string_2, 2, Name},
                                            {string_2,
                                             1,
                                             server_list_data:get_server_name({LP,
                                                                               LZ})}]);
                         lost ->
                             AnnFmt =
                                 lang:get("~ts在与~ts的~ts冠军联赛对阵中惜败对手，但打出了~ts的风采{face_1,38}"),
                             notice:format(AnnFmt,
                                           [{string_2, 2, GName},
                                            {string_2,
                                             1,
                                             server_list_data:get_server_name({P,
                                                                               Z})},
                                            {string_2, 2, Name},
                                            {string_2,
                                             1,
                                             server_list_data:get_server_name({LP,
                                                                               LZ})}]);
                         _ ->
                             AnnFmt =
                                 lang:get("~ts在与~ts的~ts冠军联赛对阵中战平对手，打出了~ts的风采{face_1,38}"),
                             notice:format(AnnFmt,
                                           [{string_2, 2, GName},
                                            {string_2,
                                             1,
                                             server_list_data:get_server_name({P,
                                                                               Z})},
                                            {string_2, 2, Name},
                                            {string_2,
                                             1,
                                             server_list_data:get_server_name({LP,
                                                                               LZ})}])
                     end,
            notice:cast(all, 5, AnnStr);
        _ -> ok
    end,
    Msg = notice:format(Fmt,
                        [{string_2, 5, ResultStr},
                         {string_2, 2, Name},
                         {string_2, 5, Assets}]),
    guild:notice(Gid, Msg).

sync_log_index(L) ->
    guild_league_guild:update(L),
    load_index(L).

update_rank(L) ->
    ets:delete_all_objects(guild_league_rank),
    dets:delete_all_objects(guild_league_rank),
    ets:insert(guild_league_rank, L),
    dets:insert(guild_league_rank, L).

update_grade_rank(L) ->
    ets:insert(guild_league_rank, L),
    dets:insert(guild_league_rank, L).

get_proto17619(Gid) ->
    Season = env:get(guild_league_season),
    Phase = env:get(guild_league_phase),
    TrumpEnable = case guild_league_guild:lookup(Gid) of
                      [#guild_league_guild{is_win = 0}] -> 1;
                      _ -> 0
                  end,
    Now = date:unixtime(),
    case ets:lookup(guild_league_summary, Gid) of
        [S = #guild_league_summary{grade = Grade}] ->
            NextTime = case agenda_data:get(2106) of
                           #{args := Days1, starttime := StartTime1} ->
                               Timeout = date:week_next_diff(Days1, StartTime1),
                               Now + Timeout;
                           _False -> Now
                       end,
            N = case Phase > 3 of
                    true -> Phase - 3;
                    _ -> Phase
                end,
            FirstTime = NextTime - (N - 1) * (86400 * 7),
            UpComing = case Grade of
                           1 ->
                               {_, L} = get_rank(Grade),
                               get_super_upcoming(#{self => S,
                                                    first_time => FirstTime,
                                                    list => L, phase => Phase,
                                                    n => 4});
                           _ -> get_upcoming(S, FirstTime)
                       end,
            {Season, Phase, TrumpEnable, S, UpComing};
        _ ->
            S = case guild_league_guild:lookup(Gid) of
                    [#guild_league_guild{id = Id, name = Name,
                                         leader_name = LeaderName,
                                         leader_id = LeaderId, lev = Lev,
                                         totem = Totem, score = AddScore,
                                         win = AddWin, member_num = MemNum,
                                         grade = Grade, group = Group,
                                         order = Order}] ->
                        #guild_league_summary{id = Id, name = Name,
                                              leader_id = LeaderId,
                                              leader_name = LeaderName,
                                              totem = Totem, lev = Lev,
                                              member_num = MemNum,
                                              season_score = AddScore,
                                              season_win = AddWin,
                                              total_win = AddWin,
                                              total_score = AddScore,
                                              grade = Grade, group = Group,
                                              order = Order};
                    _ -> #guild_league_summary{grade = 0}
                end,
            {Season, Phase, TrumpEnable, S, []}
    end.

get_proto17628(MatchId) ->
    Alliances = case ets:lookup(guild_league_alliance_log,
                                {MatchId, 1})
                    of
                    [A1 = #guild_league_alliance{}] ->
                        [A1 | ets:lookup(guild_league_alliance_log,
                                         {MatchId, 2})];
                    _ -> ets:lookup(guild_league_alliance_log, {MatchId, 2})
                end,
    Units = guild_league_unit:list_all(MatchId),
    Live = case guild_league_live:lookup(MatchId) of
               [O] -> O;
               _ -> #guild_league_live{}
           end,
    {Alliances, Units, Live}.

list_log(Grade, Season) ->
    L = ets:lookup(guild_league_guild_index,
                   {Grade, Season}),
    L1 = lists:ukeysort(2, L),
    do_list_log(L1, []).

get_champion_tree(Season) ->
    Phase = 4,
    CurPhase = min(4 + 1, env:get(guild_league_phase)),
    case list_log(1, Season) of
        [H | T] ->
            [G
             || G = #guild_league_guild{eliminated = Eld} <- [H | T],
                Eld > CurPhase];
        _ ->
            {_, L} = get_rank(1),
            L1 = [#guild_league_guild{id = Id, name = Name,
                                      leader_name = LeaderName,
                                      leader_id = LeaderId, lev = Lev,
                                      totem = Totem, member_num = MemNum,
                                      grade = Grade, group = Group,
                                      order = Order, phase = Phase}
                  || #guild_league_summary{id = Id, name = Name,
                                           leader_id = LeaderId,
                                           leader_name = LeaderName,
                                           totem = Totem, lev = Lev,
                                           member_num = MemNum, grade = Grade,
                                           group = Group, order = Order}
                         <- L],
            guild_league_guild:pre_pair(L1,
                                        #{phase => Phase, next_id => 1})
    end.

get_rank(Grade) ->
    case ets:lookup(guild_league_rank, Grade) of
        [{Grade, L}] -> {Grade, L};
        _ -> {Grade, []}
    end.

get_log_result(Mid) ->
    case ets:lookup(guild_league_alliance, {Mid, 1}) of
        [A1 = #guild_league_alliance{}] ->
            {[A1 | ets:lookup(guild_league_alliance, {Mid, 2})]};
        _ -> {ets:lookup(guild_league_alliance, {Mid, 2})}
    end.

get_logs(Gid, Season) ->
    Phase = env:get(guild_league_phase),
    L = [{Gid, I, Season} || I <- lists:seq(1, 7)],
    {_, List} = get_rank(1),
    case lists:keyfind(Gid, #guild_league_summary.id, List)
        of
        #guild_league_summary{order = Order, group = Group,
                              last_result = LastResult,
                              consecutive_win = ConsecutiveWin,
                              eliminated = Eliminated} ->
            case get_rivals(#{order => Order, group => Group,
                              last_result => LastResult, phase => Phase,
                              id => Gid, consecutive_win => ConsecutiveWin,
                              eliminated => Eliminated},
                            List)
                of
                [Gid1 | _] ->
                    L2 = [{Gid1, I, Season} || I <- lists:seq(1, 7)],
                    {[Gid, Gid1], do_get_logs(L ++ L2)};
                _ -> {[Gid], do_get_logs(L)}
            end;
        _ -> {[Gid], do_get_logs(L)}
    end.

guess(Args) ->
    gen_server:call(guild_league_agent, {guess, Args}).

get_guessed(Id) ->
    Season = env:get(guild_league_season),
    Phase = env:get(guild_league_phase),
    Polls = ets:match_object(guild_league_poll,
                             #guild_league_poll{phase = Phase, _ = '_'}),
    case ets:lookup(guild_league_guess, Id) of
        [#guild_league_guess{season = Season,
                             choices = Choices}] ->
            {Choices, Polls};
        _ -> {[], Polls}
    end.

shift(#{phase := Phase, season := Season,
        guilds := Guilds, alliances := Alliances,
        timeout := Timeout}) ->
    sync_data(Guilds),
    sync_data(Alliances),
    invite_to_guess(Phase - 1),
    role_group:pack_send(world, 17600, {0, Timeout}),
    guild_league_agent ! {shift, Season, Phase}.

get_statue_id(Gid) ->
    case env:get(guild_league_champion) of
        Gid -> {62318, 990, 670};
        _ -> {62317, 990, 670}
    end.

list_champion() -> ets:tab2list(guild_league_champion).

guild_callback(#guild{map_id = MapId},
               {replace_statue, {Id, X, Y}}) ->
    GuildBattleId = get(guild_battle_id),
    unit_mgr:remove({GuildBattleId, 62317}),
    unit_mgr:create({GuildBattleId, 62317},
                    Id,
                    {MapId, X, Y}),
    ok.

gm(clear) -> guild_league_guild:clear_all();
gm(invite_eliminated) ->
    L = ets:tab2list(guild_league_summary),
    Phase = env:get(guild_league_phase),
    do_invite_eliminated(L, Phase);
gm(reward_guess) -> gm_reward_guess();
gm(mail_pause) ->
    case world_lev:get_world_lev() of
        {Wlv, _} when Wlv < 80 -> ok;
        _ ->
            Conds = [{'>=', '$2', 3}, {'>=', '$3', 100}],
            MatchSpec = [{#guild{id = '$1', lev = '$2',
                                 mem_num = '$3', _ = '_'},
                          Conds,
                          ['$1']}],
            Content =
                lang:get("<color='#ffff00'>3月6日</color><color='#14F861'"
                         ">冠军联赛</color>将停战一期，全新玩法<color='#14F861'>攻城略地<"
                         "/color>即将开启，敬请留意活动公告{face_1,7}"),
            [guild_common:send_mail(Id, "", Content)
             || Id <- ets:select(guild_list, MatchSpec)]
    end,
    ok.

start_link() ->
    gen_server:start_link({local, guild_league_agent},
                          guild_league_agent,
                          [],
                          []).

init([]) ->
    logger:info("开始启动...", [], guild_league_agent, 585),
    ets:new(guild_league_guild,
            [set,
             named_table,
             public,
             {keypos, #guild_league_guild.id}]),
    ets:new(guild_league_guild_log,
            [set,
             named_table,
             public,
             {keypos, #guild_league_guild.key}]),
    ets:new(guild_league_alliance,
            [set,
             named_table,
             public,
             {keypos, #guild_league_alliance.id}]),
    LogFile = "./dets/guild_league_guild_log.dets",
    dets:open_file(guild_league_guild_log,
                   [{file, LogFile}, {keypos, #guild_league_guild.key}]),
    ets:new(guild_league_rank,
            [set, named_table, public, {keypos, 1}]),
    dets:open_file(guild_league_rank,
                   [{file, "./dets/guild_league_rank.dets"}, {keypos, 1}]),
    ets:new(guild_league_role,
            [set,
             named_table,
             public,
             {keypos, #guild_league_role.id}]),
    dets:open_file(guild_league_unit,
                   [{file, "./dets/guild_league_unit.dets"},
                    {keypos, #guild_league_unit.id}]),
    ets:new(guild_league_unit,
            [set,
             named_table,
             public,
             {keypos, #guild_league_unit.id}]),
    dets:open_file(guild_league_summary,
                   [{file, "./dets/guild_league_summary.dets"},
                    {keypos, #guild_league_summary.id}]),
    ets:new(guild_league_summary,
            [set,
             named_table,
             public,
             {keypos, #guild_league_summary.id}]),
    ets:new(guild_league_guild_index,
            [duplicate_bag, named_table, public, {keypos, 1}]),
    ets:new(guild_league_alliance_log,
            [set,
             named_table,
             public,
             {keypos, #guild_league_alliance.id}]),
    dets:open_file(guild_league_alliance_log,
                   [{file, "./dets/guild_league_alliance_log.dets"},
                    {keypos, #guild_league_alliance.id}]),
    ets:new(guild_league_guess,
            [set,
             named_table,
             public,
             {keypos, #guild_league_guess.id}]),
    dets:open_file(guild_league_guess,
                   [{file, "./dets/guild_league_guess.dets"},
                    {keypos, #guild_league_guess.id}]),
    dets:open_file(guild_league_live,
                   [{file, "./dets/guild_league_live.dets"},
                    {keypos, #guild_league_live.id}]),
    ets:new(guild_league_live,
            [set,
             named_table,
             public,
             {keypos, #guild_league_live.id}]),
    dets:open_file(guild_league_poll,
                   [{file, "./dets/guild_league_poll.dets"},
                    {keypos, #guild_league_poll.gid}]),
    ets:new(guild_league_poll,
            [set,
             named_table,
             public,
             {keypos, #guild_league_poll.gid}]),
    dets:open_file(guild_league_champion,
                   [{file, "./dets/guild_league_champion.dets"},
                    {keypos, #guild_league_champion.season}]),
    ets:new(guild_league_champion,
            [set,
             named_table,
             public,
             {keypos, #guild_league_champion.season}]),
    guild_league_guild:load_data([guild,
                                  rank,
                                  summary,
                                  alliance,
                                  guess,
                                  unit,
                                  live,
                                  poll,
                                  champion]),
    Log = ets:tab2list(guild_league_guild_log),
    load_index(Log),
    Phase = case env:get(guild_league_phase) of
                Phs when is_integer(Phs) -> Phs;
                _ ->
                    env:save(guild_league_phase, 1),
                    1
            end,
    Season = case env:get(guild_league_season) of
                 Sn when is_integer(Sn) -> Sn;
                 _ ->
                     env:save(guild_league_season, 1),
                     1
             end,
    case guild_league_guild:find_today(#{phase => Phase,
                                         season => Season})
        of
        {ok, _Matches, Alliances, Guilds} ->
            logger:info("重启前匹配过 ~w",
                        [Phase],
                        guild_league_agent,
                        626),
            ets:insert(guild_league_guild, Guilds),
            ets:insert(guild_league_alliance, Alliances);
        _ -> ok
    end,
    StatusRef = erlang:send_after(300000,
                                  self(),
                                  check_status),
    VotingRef = erlang:send_after(20000, self(), vote),
    State = #state{phase = Phase, season = Season,
                   status_ref = StatusRef, voting_ref = VotingRef},
    logger:info("启动完成", [], guild_league_agent, 634),
    {ok, State}.

handle_call({guess,
             #{id := Id, gids := Gids, name := Name, lev := Lev,
               classes := Classes, sex := Sex}},
            _From,
            State = #state{status = 0, phase = Phase,
                           season = Season, voting = Voting})
    when Phase > 4 ->
    logger:debug("gids -----> ~w",
                 [Gids],
                 guild_league_agent,
                 639),
    {_, L} = get_rank(1),
    G1 = #guild_league_guess{choices = Done} = case
                                                   ets:lookup(guild_league_guess,
                                                              Id)
                                                   of
                                                   [G =
                                                        #guild_league_guess{season
                                                                                =
                                                                                Season}] ->
                                                       G;
                                                   _ ->
                                                       #guild_league_guess{id =
                                                                               Id,
                                                                           name
                                                                               =
                                                                               Name,
                                                                           sex =
                                                                               Sex,
                                                                           classes
                                                                               =
                                                                               Classes,
                                                                           lev =
                                                                               Lev,
                                                                           season
                                                                               =
                                                                               Season}
                                               end,
    {Reply, NewVoting} = case check_guess(Gids,
                                          #{season => Season, list => L,
                                            phase => Phase, season => Season,
                                            done => Done})
                             of
                             {ok, Choices} ->
                                 update(G1#guild_league_guess{choices =
                                                                  Choices}),
                                 acc_local_voting(Gids, Phase),
                                 {ok, acc_voting(Gids, Voting)};
                             Else -> {Else, Voting}
                         end,
    {reply, Reply, State#state{voting = NewVoting}};
handle_call({guess, _}, _From, State) ->
    Reply = {false, lang:get("现在不能竞猜哦")},
    {reply, Reply, State};
handle_call(_Request, _From, State) ->
    logger:error("未知消息 ~w",
                 [_Request],
                 guild_league_agent,
                 667),
    {reply, false, State}.

handle_cast(_Msg, State) -> {noreply, State}.

handle_info({set_state, Phase, Season},
            State = #state{season = OldSeason}) ->
    do_set_state(Season, Phase, OldSeason),
    {noreply, State#state{phase = Phase, season = Season}};
handle_info({change_status, Status},
            State = #state{status_ref = OldRef}) ->
    case erlang:is_reference(OldRef) of
        true -> erlang:cancel_timer(OldRef);
        _ -> ok
    end,
    {noreply, State#state{status = Status}};
handle_info({shift, Season, Phase},
            State = #state{status_ref = OldRef, season = OldSeason,
                           phase = OldPhase}) ->
    case erlang:is_reference(OldRef) of
        true -> erlang:cancel_timer(OldRef);
        _ -> ok
    end,
    do_set_state(Season, Phase, OldSeason),
    reward_guess(0,
                 #{season => OldSeason, phase => OldPhase}),
    {noreply,
     State#state{status = 0, season = Season,
                 phase = Phase}};
handle_info(check_status,
            State = #state{status_ref = OldRef}) ->
    case erlang:is_reference(OldRef) of
        true -> erlang:cancel_timer(OldRef);
        _ -> ok
    end,
    case big_world:call(guild_league, info, [status]) of
        Data = {Status, _} when is_integer(Status) ->
            role_group:pack_send(world, 17600, Data),
            {noreply, State#state{status = Status}};
        _ ->
            StatusRef = erlang:send_after(300000,
                                          self(),
                                          check_status),
            {noreply, State#state{status_ref = StatusRef}}
    end;
handle_info(vote,
            State = #state{voting_ref = OldRef, voting = Voting,
                           phase = Phase}) ->
    case erlang:is_reference(OldRef) of
        true -> erlang:cancel_timer(OldRef);
        _ -> ok
    end,
    case Voting of
        [] -> ok;
        _ -> big_world:cast(guild_league, vote, [Phase, Voting])
    end,
    VotingRef = erlang:send_after(20000, self(), vote),
    {noreply,
     State#state{voting_ref = VotingRef, voting = []}};
handle_info(_Info, State) -> {noreply, State}.

terminate(_Reason, _State) -> ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

notice_matched([], _) -> ok;
notice_matched([#guild_league_guild{id = Id1,
                                    side = Side, phase = Phase,
                                    eliminated = Eliminated, grade = Grade}
                | T],
               Guilds) ->
    StartTime1 = case agenda_data:get(2106) of
                     #{starttime := St1} -> St1;
                     _ -> 0
                 end,
    TimeStr = case StartTime1 of
                  0 -> "";
                  _ ->
                      case calendar:seconds_to_time(StartTime1) of
                          {H, M, _} when M < 10 -> util:flist("~w:0~w", [H, M]);
                          {H, M, _} -> util:flist("~w:~w", [H, M])
                      end
              end,
    {Msg1, Content1} = case [G
                             || G = #guild_league_guild{side = Side2, id = Id2}
                                    <- Guilds,
                                Side2 =:= Side andalso Id2 =/= Id1]
                           of
                           [] ->
                               {lang:get("冠军联赛对阵名单已经出炉，本公会的对手是"),
                                notice:format(lang:get("冠军联赛对阵公布：本公会将于今日~ts对阵"),
                                              [{string_2, 5, TimeStr}])};
                           [#guild_league_guild{name = Name2}] ->
                               {notice:format(lang:get("冠军联赛对阵名单已经出炉，本公会将联合~ts公会共同对阵"),
                                              [{string_2, 2, Name2}]),
                                notice:format(lang:get("冠军联赛对阵公布：本公会将于今日~ts联合~ts公会共同对阵"),
                                              [{string_2, 5, TimeStr},
                                               {string_2, 2, Name2}])}
                       end,
    {Msg2, Content2} = case [G
                             || G = #guild_league_guild{side = Side2} <- Guilds,
                                Side =/= Side2]
                           of
                           [#guild_league_guild{name = Name3,
                                                id = {_, P3, Z3}}] ->
                               {notice:format(lang:get("~ts~ts的~ts公会，请所有成员准时参加冠军联赛，一同守卫我们的荣誉{face_1, 7}"),
                                              [{string_1, Msg1},
                                               {string_2,
                                                5,
                                                server_list_data:get_server_name({P3,
                                                                                  Z3})},
                                               {string_2, 2, Name3}]),
                                notice:format(lang:get("~ts~ts的~ts公会。请所有成员准时参加，团结一致，共克强敌！请长老及以上管理提前安排"
                                                       "王牌领队"),
                                              [{string_1, Content1},
                                               {string_2,
                                                1,
                                                server_list_data:get_server_name({P3,
                                                                                  Z3})},
                                               {string_2, 2, Name3}])};
                           [#guild_league_guild{name = Name3},
                            #guild_league_guild{name = Name4}] ->
                               {notice:format(lang:get("~ts~ts、~ts公会，请所有成员准时参加冠军联赛，一同守卫我们的荣誉{face_1, 7}"),
                                              [{string_1, Msg1},
                                               {string_2, 2, Name3},
                                               {string_2, 2, Name4}]),
                                notice:format(lang:get("~ts~ts、~ts公会。请所有成员准时参加，团结一致，共克强敌！请长老及以上管理提前安排"
                                                       "王牌领队"),
                                              [{string_1, Content1},
                                               {string_2, 2, Name3},
                                               {string_2, 2, Name4}])}
                       end,
    Content3 = case do_invite_eliminated(#{id => Id1,
                                           eliminated => Eliminated,
                                           phase => Phase, grade => Grade})
                   of
                   PS = [_ | _] ->
                       notice:format(lang:get("~ts（~ts）"),
                                     [{string_1, Content2}, {string_1, PS}]);
                   _ -> Content2
               end,
    guild_common:send_mail(Id1, "", Content3),
    guild:notice(Id1, Msg2),
    notice_matched(T, Guilds).

load_index([]) -> ok;
load_index([#guild_league_guild{key = Key,
                                season = Season, grade = Grade}
            | T]) ->
    ets:insert(guild_league_guild_index,
               {{Grade, Season}, Key}),
    load_index(T).

do_list_log([], L) -> L;
do_list_log([{_, Key} | T], L) ->
    case ets:lookup(guild_league_guild_log, Key) of
        [G = #guild_league_guild{}] -> do_list_log(T, [G | L]);
        _ -> do_list_log(T, L)
    end.

get_upcoming(#guild_league_summary{grade = Grade,
                                   group = Group, order = Order},
             FirstTime) ->
    {_, L} = get_rank(Grade),
    L1 = [S
          || S = #guild_league_summary{group = Gp} <- L,
             Gp =:= Group],
    L2 = lists:keysort(#guild_league_summary.order, L1),
    do_get_upcoming(L2, Order, 1, FirstTime).

do_get_upcoming(_, _, N, _) when N > 3 -> [];
do_get_upcoming(L, Order, N, FirstTime) ->
    L1 = guild_league_guild:round_robin(N, L),
    case do_get_upcoming(L1, Order) of
        G = #guild_league_guild{} ->
            [G#guild_league_guild{phase = N,
                                  time = FirstTime + 86400 * 7 * (N - 1)}
             | do_get_upcoming(L, Order, N + 1, FirstTime)];
        _ -> do_get_upcoming(L, Order, N + 1, FirstTime)
    end.

do_get_upcoming([A, B | T], Order) ->
    case lists:keytake(Order,
                       #guild_league_summary.order,
                       [A, B])
        of
        {value,
         _,
         [#guild_league_summary{id = Id, name = Name, lev = Lev,
                                leader_id = LeaderId, leader_name = LeaderName,
                                totem = Totem, grade = Grade, order = Order1,
                                group = Group}]} ->
            #guild_league_guild{id = Id, name = Name, lev = Lev,
                                leader_id = LeaderId, leader_name = LeaderName,
                                totem = Totem, grade = Grade, order = Order1,
                                group = Group};
        _ -> do_get_upcoming(T, Order)
    end;
do_get_upcoming(_, _) -> false.

get_super_upcoming(Args = #{n := N, phase := Phase,
                            self :=
                                #guild_league_summary{order = Order,
                                                      group = Group,
                                                      season_consecutive_win =
                                                          ConsecutiveWin,
                                                      last_result = LastResult,
                                                      id = SId,
                                                      eliminated = Eliminated},
                            list := L, first_time := FirstTime})
    when Phase >= N ->
    case get_rivals(#{order => Order, group => Group,
                      last_result => LastResult, phase => N, id => SId,
                      consecutive_win => ConsecutiveWin,
                      eliminated => Eliminated},
                    L)
        of
        [Gid | _] ->
            case lists:keyfind(Gid, #guild_league_summary.id, L) of
                #guild_league_summary{id = Id, name = Name, lev = Lev,
                                      leader_id = LeaderId,
                                      leader_name = LeaderName, totem = Totem,
                                      grade = Grade, order = Order1,
                                      group = Group1} ->
                    G = #guild_league_guild{id = Id, name = Name, lev = Lev,
                                            leader_id = LeaderId,
                                            leader_name = LeaderName,
                                            totem = Totem, grade = Grade,
                                            order = Order1, group = Group1,
                                            time =
                                                FirstTime +
                                                    86400 * 7 * (N - 4)},
                    [G | get_super_upcoming(Args#{n := N + 1})];
                _Err -> get_super_upcoming(Args#{n := N + 1})
            end;
        _Err -> get_super_upcoming(Args#{n := N + 1})
    end;
get_super_upcoming(_Args) -> [].

update(G = #guild_league_guess{}) ->
    ets:insert(guild_league_guess, G),
    dets:insert(guild_league_guess, G).

get_rivals(#{phase := 7, consecutive_win := 4}, L) ->
    [Id
     || #guild_league_summary{id = Id, consecutive_win = 3}
            <- L];
get_rivals(#{phase := 7, consecutive_win := 3,
             id := SId},
           L) ->
    [Id
     || #guild_league_summary{id = Id, consecutive_win = Win}
            <- L,
        Win >= 3 andalso Id =/= SId];
get_rivals(#{phase := 7, last_result := LastResult,
             id := SId, consecutive_win := 2,
             eliminated := Eliminated},
           L)
    when Eliminated >= 6 ->
    case [Id
          || #guild_league_summary{id = Id,
                                   season_consecutive_win = 2, eliminated = Eld}
                 <- L,
             Eld >= 6 andalso SId =/= Id]
        of
        [A, B | T] ->
            [Id
             || #guild_league_summary{id = Id, last_result = Last}
                    <- [A, B | T],
                Last =:= LastResult];
        Ids -> Ids
    end;
get_rivals(#{phase := 4, group := Group,
             order := Order},
           L) ->
    ROrder = case Order of
                 1 -> 3;
                 2 -> 4;
                 3 -> 1;
                 4 -> 2
             end,
    [Id
     || #guild_league_summary{id = Id, order = O, group = G}
            <- L,
        O =:= ROrder andalso G =:= Group];
get_rivals(#{phase := 6, group := Group,
             consecutive_win := ConsecutiveWin},
           L)
    when ConsecutiveWin > 1 ->
    RGroup = case Group of
                 1 -> 3;
                 2 -> 4;
                 3 -> 1;
                 4 -> 2
             end,
    [Id
     || #guild_league_summary{id = Id, group = G,
                              season_consecutive_win = Win}
            <- L,
        G =:= RGroup andalso Win > 1];
get_rivals(#{phase := 6, group := Group,
             eliminated := Eliminated},
           L)
    when Eliminated > 4 ->
    RGroup = case Group of
                 1 -> 3;
                 2 -> 4;
                 3 -> 1;
                 4 -> 2
             end,
    [Id
     || #guild_league_summary{id = Id, group = G,
                              season_consecutive_win = Win, eliminated = Eld}
            <- L,
        G =:= RGroup andalso Win < 2 andalso Eld > 4];
get_rivals(#{phase := 6, group := Group,
             last_result := 1},
           L) ->
    RGroup = case Group of
                 1 -> 3;
                 2 -> 4;
                 3 -> 1;
                 4 -> 2
             end,
    [Id
     || #guild_league_summary{id = Id, group = G,
                              eliminated = 4, last_result = 1}
            <- L,
        G =:= RGroup];
get_rivals(#{phase := 6, group := Group}, L) ->
    RGroup = case Group of
                 1 -> 3;
                 2 -> 4;
                 3 -> 1;
                 4 -> 2
             end,
    [Id
     || #guild_league_summary{id = Id, group = G,
                              eliminated = 4, last_result = 2}
            <- L,
        G =:= RGroup];
get_rivals(#{group := Group, id := SId,
             consecutive_win := ConsecutiveWin, phase := Phase},
           L)
    when Phase =:= 4 + 1 andalso ConsecutiveWin > 0 ->
    [Id
     || #guild_league_summary{id = Id, group = G,
                              season_consecutive_win = Win}
            <- L,
        G =:= Group andalso Win > 0 andalso SId =/= Id];
get_rivals(#{group := Group, id := SId, phase := Phase},
           L)
    when Phase =:= 4 + 1 ->
    [Id
     || #guild_league_summary{id = Id, group = G,
                              season_consecutive_win = 0}
            <- L,
        G =:= Group andalso SId =/= Id];
get_rivals(_, _) -> [].

do_get_logs([]) -> [];
do_get_logs([Key | T]) ->
    case ets:lookup(guild_league_guild_log, Key) of
        [#guild_league_guild{match_id = Mid}] ->
            case ets:lookup(guild_league_alliance_log, {Mid, 1}) of
                [A1 = #guild_league_alliance{}] ->
                    case ets:lookup(guild_league_alliance_log, {Mid, 2}) of
                        [A2 = #guild_league_alliance{}] ->
                            [A1, A2 | do_get_logs(T)];
                        _ -> do_get_logs(T)
                    end;
                _ -> do_get_logs(T)
            end;
        _ -> do_get_logs(T)
    end.

check_guess([], #{done := Done}) -> {ok, Done};
check_guess([Gid | T],
            Args = #{season := Season, phase := Phase, list := List,
                     done := Done}) ->
    case lists:keyfind(Gid, #guild_league_summary.id, List)
        of
        #guild_league_summary{order = Order, group = Group,
                              last_result = LastResult, season_win = SeasonWin,
                              name = Name, consecutive_win = ConsecutiveWin,
                              eliminated = Eliminated} ->
            case LastResult of
                2 when Phase > 4 andalso Phase < 7 ->
                    {false,
                     notice:format(lang:get("~ts公会不参与这场比赛"),
                                   [{string_2, 2, Name}])};
                2 when Phase =:= 7 andalso SeasonWin < 2 ->
                    {false,
                     notice:format(lang:get("~ts公会不参与这场比赛"),
                                   [{string_2, 2, Name}])};
                _ ->
                    Rivals = get_rivals(#{order => Order, group => Group,
                                          last_result => LastResult,
                                          phase => Phase, id => Gid,
                                          consecutive_win => ConsecutiveWin,
                                          eliminated => Eliminated},
                                        List),
                    case [D
                          || D = #guild_league_guess_choice{gid = Cid,
                                                            phase = Cphase}
                                 <- Done,
                             Cphase =:= Phase andalso
                                 lists:member(Cid, [Gid | Rivals])]
                        of
                        [] ->
                            case ets:lookup(guild_league_guild_log,
                                            {Gid, Phase, Season})
                                of
                                [#guild_league_guild{is_win = IsWin}]
                                    when IsWin =/= 0 ->
                                    {false, lang:get("胜负已经分、不用再猜了")};
                                _ ->
                                    check_guess(T,
                                                Args#{done :=
                                                          [#guild_league_guess_choice{gid
                                                                                          =
                                                                                          Gid,
                                                                                      phase
                                                                                          =
                                                                                          Phase}
                                                           | Done]})
                            end;
                        _ ->
                            {false,
                             notice:format(lang:get("不能再选择~ts公会哦"),
                                           [{string_2, 2, Name}])}
                    end
            end;
        _ ->
            logger:debug("公会id ~w", [Gid], guild_league_agent, 956),
            {false, lang:get("不能选择这个公会哦")}
    end.

reward_guess(0,
             Args = #{phase := Phase, season := Season}) ->
    Rates = calc_vote_rates([G
                             || G = #guild_league_guild{phase = Ph}
                                    <- list_log(1, Season),
                                Ph =:= Phase]),
    L = ets:tab2list(guild_league_guess),
    do_reward_guess(L, Args#{rates => Rates});
reward_guess(_, _) -> ok.

do_reward_guess([], _) -> ok;
do_reward_guess([G = #guild_league_guess{id = Id,
                                         choices = Choices, season = Season}
                 | T],
                Args = #{season := Season, phase := Phase}) ->
    {NewChoices, Num, Rewards} =
        update_guess_choice(Choices,
                            Args#{num => 0, done => [], rewards => 0}),
    G1 = G#guild_league_guess{choices = NewChoices},
    case [Ph
          || #guild_league_guess_choice{phase = Ph} <- Choices,
             Phase =:= Ph]
        of
        [] -> ok;
        _ ->
            Factor = get_guess_num_factor(Phase, Num),
            Coin = round(500000 * Factor / 1000 * Rewards),
            update(G1),
            Title = lang:get("竞猜结果"),
            Content =
                notice:format(lang:get("本轮冠军联赛比赛结束，您一共预测正确了~ts支队伍。特发放奖励如下：（现在可以前往~ts查"
                                       "看竞猜结果，以及进行下轮竞猜）"),
                              [{string_2, 5, Num},
                               {panel_2, 17602, 2, lang:get("冠军联赛-小组信息")}]),
            Items = [{90000, Coin}],
            mail:send(Id,
                      #{title => Title, content => Content, items => Items})
    end,
    do_reward_guess(T, Args);
do_reward_guess([_ | T], Args) ->
    do_reward_guess(T, Args).

update_guess_choice([],
                    #{num := Num, done := Done, rewards := Rewards}) ->
    {Done, Num, Rewards};
update_guess_choice([C =
                         #guild_league_guess_choice{phase = Phase, gid = Gid}
                     | T],
                    Args = #{season := Season, phase := Phase, num := Num,
                             done := Done, rewards := Rewards,
                             rates := Rates}) ->
    Rewards1 = case lists:keyfind(Gid, 1, Rates) of
                   {_, Rate} -> Rewards + Rate;
                   _ -> Rewards + 1
               end,
    case ets:lookup(guild_league_guild_log,
                    {Gid, Phase, Season})
        of
        [#guild_league_guild{is_win = 1}] ->
            C1 = C#guild_league_guess_choice{bingo = 1},
            update_guess_choice(T,
                                Args#{num := Num + 1, done := [C1 | Done],
                                      rewards := Rewards1});
        _ ->
            C1 = C#guild_league_guess_choice{bingo = 2},
            update_guess_choice(T,
                                Args#{done := [C1 | Done], rewards := Rewards1})
    end;
update_guess_choice([C | T], Args = #{done := Done}) ->
    update_guess_choice(T, Args#{done := [C | Done]}).

gm_reward_guess() ->
    Phase = 5,
    Season = 1,
    Args = #{phase => Phase, season => Season},
    Rates = calc_vote_rates([G
                             || G = #guild_league_guild{phase = Ph}
                                    <- list_log(1, Season),
                                Ph =:= Phase]),
    L = ets:tab2list(guild_league_guess),
    do_gm_reward_guess(L, Args#{rates => Rates}).

do_gm_reward_guess([], _) -> ok;
do_gm_reward_guess([G = #guild_league_guess{id = Id,
                                            choices = Choices, season = Season}
                    | T],
                   Args = #{season := Season, phase := Phase}) ->
    {NewChoices, Num, _Rewards} =
        update_guess_choice(Choices,
                            Args#{num => 0, done => [], rewards => 0}),
    G1 = G#guild_league_guess{choices = NewChoices},
    case [Ph
          || #guild_league_guess_choice{phase = Ph, bingo = 0}
                 <- Choices,
             Phase =:= Ph]
        of
        [] -> ok;
        _ ->
            Factor = get_guess_num_factor(Phase, Num),
            Coin = round(500000 * Factor / 1000 *
                             1.69999999999999995559),
            update(G1),
            Title = lang:get("竞猜结果"),
            Content =
                notice:format(lang:get("本轮冠军联赛比赛结束，您一共预测正确了~ts支队伍。特发放奖励如下：（现在可以前往~ts查"
                                       "看竞猜结果，以及进行下轮竞猜）"),
                              [{string_2, 5, Num},
                               {panel_2, 17602, 2, lang:get("冠军联赛-小组信息")}]),
            Items = [{90000, Coin}],
            mail:send(Id,
                      #{title => Title, content => Content, items => Items})
    end,
    do_gm_reward_guess(T, Args);
do_gm_reward_guess([_ | T], Args) ->
    do_gm_reward_guess(T, Args).

get_guess_num_factor(_, 4) -> 2200;
get_guess_num_factor(_, 3) -> 1000;
get_guess_num_factor(5, 2) -> 500;
get_guess_num_factor(_, 2) -> 2000;
get_guess_num_factor(5, 1) -> 200;
get_guess_num_factor(6, 1) -> 200;
get_guess_num_factor(7, 1) -> 1000;
get_guess_num_factor(_, _) -> 100.

do_collect_update([]) -> [];
do_collect_update([[Id] | T]) ->
    case guild_mgr:info(by_id, Id) of
        {ok,
         #guild{name = Name, lev = Lev, leader_id = LeaderId,
                leader_name = LeadName, members = Members,
                totem = #guild_totem{id = Totem}}} ->
            G = #guild_league_guild{id = Id, name = Name, lev = Lev,
                                    leader_id = LeaderId,
                                    leader_name = LeadName, members = Members,
                                    totem = Totem, member_num = 100},
            [G | do_collect_update(T)];
        _ -> do_collect_update(T)
    end.

acc_voting([], Voting) -> Voting;
acc_voting([Gid | T], Voting) ->
    case lists:keyfind(Gid, 1, Voting) of
        {Gid, Num} ->
            acc_voting(T,
                       lists:keyreplace(Gid, 1, Voting, {Gid, Num + 1}));
        _ -> acc_voting(T, [{Gid, 1} | Voting])
    end.

acc_local_voting([], _) -> ok;
acc_local_voting([Gid | T], Phase) ->
    P1 = case ets:lookup(guild_league_poll, Gid) of
             [P = #guild_league_poll{phase = Phase, voted = Has}] ->
                 P#guild_league_poll{voted = Has + 1};
             _ ->
                 #guild_league_poll{gid = Gid, voted = 1, phase = Phase}
         end,
    guild_league_guild:update(P1),
    acc_local_voting(T, Phase).

calc_vote_rates([]) -> [];
calc_vote_rates([#guild_league_guild{id = Gid,
                                     match_id = MatchId, phase = Phase}
                 | T]) ->
    case lists:keytake(MatchId,
                       #guild_league_guild.match_id,
                       T)
        of
        {value, #guild_league_guild{id = Gid2}, Rest} ->
            Voted1 = case ets:lookup(guild_league_poll, Gid) of
                         [#guild_league_poll{phase = Phase, voted = V1}] -> V1;
                         _ -> 0
                     end,
            Voted2 = case ets:lookup(guild_league_poll, Gid2) of
                         [#guild_league_poll{phase = Phase, voted = V2}] -> V2;
                         _ -> 0
                     end,
            Total = max(1, Voted1 + Voted2),
            [{Gid,
              max(2.99999999999999988898e-1,
                  min(1.69999999999999995559,
                      Voted2 / Total * 100 / 50))},
             {Gid2,
              max(2.99999999999999988898e-1,
                  min(1.69999999999999995559, Voted1 / Total * 100 / 50))}
             | calc_vote_rates(Rest)];
        _ -> [{Gid, 1} | calc_vote_rates(T)]
    end.

do_invite_eliminated([], _) -> ok;
do_invite_eliminated([#guild_league_summary{grade =
                                                Grade = 1,
                                            id = Id1, eliminated = Eliminated}
                      | T],
                     Phase) ->
    case do_invite_eliminated(#{id => Id1,
                                eliminated => Eliminated, phase => Phase,
                                grade => Grade})
        of
        Content = [_ | _] ->
            guild_mgr:apply(async,
                            Id1,
                            {guild_common,
                             sync_send_mail,
                             [#{content => Content,
                                from_name => lang:get("冠军联赛议事厅")}]});
        _ -> ok
    end,
    do_invite_eliminated(T, Phase);
do_invite_eliminated([_ | T], Phase) ->
    do_invite_eliminated(T, Phase).

do_invite_eliminated(#{phase := 7}) ->
    logger:debug("决赛", [], guild_league_agent, 1115),
    ok;
do_invite_eliminated(#{eliminated := Eliminated,
                       phase := Phase, grade := 1})
    when Eliminated < Phase ->
    notice:format(lang:get("本轮为冠军联赛~ts。排名越高，最终冠军联赛奖励越丰厚。"),
                  [{string_2, 5, lang:get("淘汰组排位赛")}]);
do_invite_eliminated(_) -> false.

invite_to_guess(4) ->
    Content =
        notice:format(lang:get("冠军联赛正在如火如荼的进行当中，8支豪强已经成功突围首轮，成功晋级~ts。让我们一起来竞猜"
                               "预测下谁将再接再厉，获得最后的冠军奖杯吧。（前往~ts进行竞猜，每轮活动开始前均可以进行竞"
                               "猜，猜对越多奖励越丰厚）"),
                      [{string_2, 5, lang:get("冠军联赛8强淘汰赛")},
                       {panel_2, 17602, 2, lang:get("冠军联赛-小组信息")}]),
    [guild_mgr:apply(async,
                     Id1,
                     {guild_common,
                      sync_send_mail,
                      [#{content => Content,
                         from_name => lang:get("冠军联赛议事厅")}]})
     || [Id1]
            <- ets:match(guild_list, #guild{id = '$1', _ = '_'})],
    ok;
invite_to_guess(_) -> ok.

do_set_state(Season, Phase, OldSeason) ->
    env:save(guild_league_phase, Phase),
    env:save(guild_league_season, Season),
    case Season =/= OldSeason of
        true ->
            ets:delete_all_objects(guild_league_poll),
            dets:delete_all_objects(guild_league_poll),
            ets:delete_all_objects(guild_league_guess),
            dets:delete_all_objects(guild_league_guess),
            ets:delete_all_objects(guild_league_live),
            dets:delete_all_objects(guild_league_live);
        _ -> ok
    end.

top3_to_honor([], _) -> [];
top3_to_honor([{Id, _, _, _} | T], N) when N < 4 ->
    [{Id, 30119 + N} | top3_to_honor(T, N + 1)];
top3_to_honor([_ | T], N) -> top3_to_honor(T, N + 1).

replace_statue(Id) ->
    OldId = env:get(guild_league_champion),
    case role_misc:is_local_role(OldId) of
        true ->
            guild_mgr:apply(async,
                            OldId,
                            {guild_league_agent,
                             guild_callback,
                             [{replace_statue, {62317, 990, 670}}]});
        _ -> ok
    end,
    case role_misc:is_local_role(Id) of
        true ->
            guild_mgr:apply(async,
                            Id,
                            {guild_league_agent,
                             guild_callback,
                             [{replace_statue, {62318, 990, 670}}]});
        _ -> ok
    end,
    env:save(guild_league_champion, Id).

reward_fighter(Id) ->
    case role_misc:is_local_role(Id) of
        true ->
            case ets:lookup(guild_league_guild, Id) of
                [#guild_league_guild{members = Members}] ->
                    do_reward_fighter(Members);
                _ -> ok
            end;
        _ -> ok
    end.

do_reward_fighter([]) -> ok;
do_reward_fighter([Id | T]) ->
    Title = lang:get("冠军公会奖励"),
    Content =
        lang:get("通过大家共同的努力，贵公会勇夺冠军联赛总冠军，特别赠送以下奖励表示祝贺："),
    Items = [{23635, 0, 1}],
    mail:send(Id,
              #{title => Title, content => Content, items => Items}),
    do_reward_fighter(T).

